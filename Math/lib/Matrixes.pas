{***************************************************************************}
{                                                                           }
{             Модуль:   Матрицы                                             }
{             Описание: Операции с матрицами                                }
{             Автор:    Зверинцев Дмитрий                                   }
{                                                                           }
{***************************************************************************}

unit Matrixes;

interface
uses
  SysUtils,Vectors,Complex;

type
  PMatrix = ^_Matrix;
  _Matrix=record
private
    Matr:array of array of TNumber;
    cols,rows:integer;
    function getelement(i, j: integer): TNumber;
    procedure setelement(i, j: integer; const Value: TNumber);
    procedure CheckMainDiag();
    function Minor(i,j:integer):TNumber;
    function Algebraic():PMatrix;
    procedure SwapRows(from_row,to_row:integer);
    procedure SwapCols(from_col,to_col:integer);
public
  procedure CopyTo(B:PMatrix);
  procedure SetMatrix(row,col:integer);
  class operator Add(const A,B:_Matrix):PMatrix;overload;
  class operator Add(const A:_Matrix;const B:TNumber):PMatrix;overload;
  class operator Add(const B:TNumber;const A:_Matrix):PMatrix;overload;
  class operator Multiply(const A,B:_Matrix):PMatrix;overload;
  class operator Multiply(const k:TNumber;const B:_Matrix):PMatrix;overload;
  class operator Multiply(const B:_MAtrix;const k:TNumber):PMatrix;overload;
  class operator Subtract(const A,B:_Matrix):PMatrix;overload;
  class operator Subtract(const A:_Matrix;const B:TNumber):PMatrix;overload;
  class operator Subtract(const B:TNumber;const A:_Matrix):PMatrix;overload;
  class operator Divide(const A,B:_Matrix):PMatrix;overload;
  class operator Divide(const A:_Matrix;const B:double):PMatrix;overload;
  class operator Divide(const B:double;const A:_MAtrix):PMatrix;overload;
  function Gauss():PVector;
  function Rank():TNumber;
  function Transpose():PMatrix;
  class function Inverse(const A:PMatrix):PMatrix;static;
  function Getdet(): TNumber;
  function ToString(const sett:TFormat):AnsiString;
  property RowsCount:Integer read rows;
  property ColsCount:Integer read cols;
  property Element[i,j:integer]:TNumber read getelement write setelement;default;
end;

resourcestring
  InvalidLength='Матрицы должны иметь однинаковый размер.';
  NoInverse='Для данной матрицы обратной не существует.';
  NoMul='Умножение невозможно.';

implementation
//////////////////////////////{ TMatrix }//////////////////////////////////////

procedure _Matrix.CopyTo(B:PMatrix);
var i,j:integer;
begin
  B.SetMatrix(rows,cols);
  for i:=0 to rows-1 do
    for j:=0 to cols-1 do
      B.Matr[i,j]:=self.Matr[i,j];
end;

function _MAtrix.Gauss():PVector;
var i,j,k,co:integer;
    T:PMatrix;
    fre,mde,res:TNumber;
    swaprec:array of integer;

    function FindMax(row:integer):boolean;
    var j,k,x:integer;
        value:double;
    begin
        value:=0.0;x:=0;
        for k:= 0 to T.cols-2 do
          if(absval(T.Matr[row,k])>e)then
          begin
            value:=absval(T.Matr[row,k]);
            x:=k;
            for j:=k to T.cols-2 do
               if (absval(T.Matr[row,j])>value) then
               begin
                 value:=absval(T.Matr[row,j]);
                 x:=j
               end;
            break
          end else value:=0.0;
        if (absval(value)>e) then begin
          if (row<>x)then begin
            T.SwapCols(x,row);
            setlength(swaprec,length(swaprec)+2);
            swaprec[high(swaprec)]:=x;
            swaprec[high(swaprec)-1]:=row;
          end;
          result:=true;
        end else result:=false
    end;

begin
  New(T);
  self.CopyTo(T);
  New(result);
  result.VectorLength:=cols-1;
  mde:=0;co:=1;
       //  Прямой ход
  while(co < T.rows)do begin
    k:=1;
    for i:=co to T.rows-1 do
    begin
      FindMax(co-1);
      mde:=T.Matr[co-1,co-1];
      fre:=T.Matr[i,co-1];
      for j:=co-1 to T.cols-1 do
      begin
        if (absval(mde)<e) then
        begin
          if not FindMax(co-1) then
             raise Exception.Create('Уравнение не имеет решений.')
          else begin
             mde:=T.Matr[co-1,j];
             fre:=T.Matr[i,j];
          end
        end;
        T.Matr[i,j]:=T.Matr[i,j]-((fre/mde)*T.Matr[i-k,j]);
      end; {for}
      inc(k);
    end;{for}
    inc(co);
  end; {while}
          // Обратный ход
  for i:=T.rows-1 downto 0 do begin
    res:=0;
    for j:=i to T.cols-2 do res:=res+T.Matr[i,j]*result^[j];
    if (absval(res)<e) and
       (absval(T.Matr[i,i])<e) and
       (absval(T.Matr[i,cols-1])>e) then
    begin
      dispose(T);
      raise Exception.Create('Уравнение не имеет решений.');
    end else
      result^[i]:=(T.Matr[i,cols-1]-res)/T.Matr[i,i];
  end;
  dispose(T);
  if length(swaprec)>0 then begin
    i:=high(swaprec);
    repeat
      res:=result^[swaprec[i]];
      result^[swaprec[i]]:=result^[swaprec[i-1]];
      result^[swaprec[i-1]]:=res;
      dec(i,2)
    until (i<0);
  end
end;

{$REGION ' Operations '}
                    // Сумма матриц (векторов)
class operator _Matrix.Add(const B:TNumber;const A:_Matrix):PMatrix;
var i,j:integer;
begin
    new(result);
    Result.SetMatrix(A.rows,A.cols);
    for i:=0 to A.rows-1 do begin
      for j:=0 to A.cols-1 do
        Result.Matr[i,j]:=A.Matr[i,j]+B;
    end
end;

class operator _Matrix.Add(const A:_Matrix;const B:TNumber):PMatrix;
var i,j:integer;
begin
    new(result);
    Result.SetMatrix(A.rows,A.cols);
    for i:=0 to A.rows-1 do begin
      for j:=0 to A.cols-1 do
        Result.Matr[i,j]:=A.Matr[i,j]+B;
    end
end;

class operator _Matrix.Add(const A,B:_Matrix):PMatrix;
var i,j:integer;
begin
  if (A.rows=B.rows)and(B.cols=A.cols)then begin
    new(result);
    Result.SetMatrix(A.rows,A.cols);
    for i:=0 to A.rows-1 do begin
      for j:=0 to B.cols-1 do
        Result.Matr[i,j]:=A.Matr[i,j]+B.Matr[i,j];
    end
  end else raise Exception.Create(invalidlength);
end;

                      //Разность матриц
class operator _Matrix.Subtract(const A:_Matrix;const B:TNumber):PMatrix;
var i,j:integer;
begin
    new(result);
    Result.SetMatrix(A.rows,A.cols);
    for i:=0 to A.rows-1 do begin
      for j:=0 to A.cols-1 do
        Result.Matr[i,j]:=A.Matr[i,j]-B;
    end
end;

class operator _Matrix.Subtract(const B:TNumber;const A:_Matrix):PMatrix;
var i,j:integer;
begin
    new(result);
    Result.SetMatrix(A.rows,A.cols);
    for i:=0 to A.rows-1 do begin
      for j:=0 to A.cols-1 do
        Result.Matr[i,j]:=B-A.Matr[i,j];
    end
end;

class operator _Matrix.Subtract(const A,B:_Matrix):PMatrix;
var i,j:integer;
begin
  if (A.rows=B.rows)and(B.cols=A.cols)then begin
    new(result);
    Result.SetMatrix(A.rows,A.cols);
    for i:=0 to A.rows-1 do begin
      for j:=0 to B.cols-1 do
        Result.Matr[i,j]:=A.Matr[i,j]-B.Matr[i,j];
    end
  end else raise Exception.Create(invalidlength);
end;


                    // Умножение матриц (Векторное произведение)
// Для умножения матриц нужно чтоб кол-во строк А = кол-ву столбцов В
class operator _Matrix.Multiply(const A,B:_Matrix):PMatrix;
var i,j,k:integer;
begin
  if A.rows=B.cols then begin
    new(result);
    result.SetMatrix(A.rows,B.cols);
    for k:=0 to result.rows-1 do     // Строка результирующей матрицы
      for i:=0 to A.rows-1 do
        for j:=0 to B.rows-1 do
          result.Matr[k,i]:=result.Matr[k,i]+(A.Matr[k,j]*B.Matr[j,i]);
  end else raise Exception.Create(NoMul);
end;
                 // Умножение матрицы(вектора) на число
class operator _Matrix.Multiply(const k:TNumber;const B:_Matrix):PMatrix;
var i,j:integer;
begin
  new(result);
  result.SetMatrix(B.rows,B.cols);
  for i:=0 to B.rows-1 do
    for j:=0 to B.cols-1 do
       result.Matr[i,j]:=k*B.Matr[i,j];
end;

class operator _Matrix.Multiply(const B:_MAtrix;const k:TNumber):PMatrix;
var i,j:integer;
begin
  new(result);
  result.SetMatrix(B.rows,B.cols);
  for i:=0 to B.rows-1 do
    for j:=0 to B.cols-1 do
       result.Matr[i,j]:=k*B.Matr[i,j];
end;


           // Деление матриц
class operator _Matrix.Divide(const A,B:_Matrix):PMatrix;
var T:PMatrix;i,j:integer;
begin
  if (A.rows=A.cols)and(B.cols=B.rows)then begin
   try T:=Inverse(@B);
   except
      raise Exception.Create('Деление не возможно.');
      Dispose(T);Dispose(result);
   end;
   result:=A*T^;
   Dispose(T)
  end
  else if (A.rows=B.rows) and (B.cols=A.cols)then begin
    new(result);
    result.SetMatrix(A.rows,A.cols);
    for i:=0 to A.rows-1 do
      for j:=0 to B.cols-1 do begin
        if absval(B[i,j])<e then result^[i,j]:=e
        else
          result^[i,j]:=A[i,j]/B[i,j]
      end
  end
  else raise Exception.Create(InvalidLength);
end;

class operator _Matrix.Divide(const A:_Matrix;const B:double):PMatrix;
var i,j:integer;
begin
    new(result);
    Result.SetMatrix(A.rows,A.cols);
    for i:=0 to A.rows-1 do begin
      for j:=0 to A.cols-1 do
          if (B < -e) or (B > e) then
            Result.Matr[i,j] := A.Matr[i,j] / B
          else
            Result.Matr[i,j] := NaN
    end
end;

class operator _Matrix.Divide(const B:double;const A:_MAtrix):PMatrix;
var i,j:integer;
begin
    new(result);
    Result.SetMatrix(A.rows,A.cols);
    for i:=0 to A.rows-1 do begin
      for j:=0 to A.cols-1 do
          if (B < -e) or (B > e) then
            Result.Matr[i,j] := B / A.Matr[i,j]
          else
            Result.Matr[i,j] := NaN
    end
end;
{$ENDREGION}

function _Matrix.Transpose():PMatrix;
var i,j:integer;
begin
  new(result);
  result.SetMatrix(cols,rows);
  for i:=0 to rows-1 do
    for j:=0 to cols-1 do
      result^.Matr[j,i]:=Matr[i,j];
end;

// Процедура Проверки главной диаг на наличие 0 если есть то строки или столбцы меняются местами
procedure _Matrix.CheckMainDiag();
var i,j,k,eqnum:integer;
    row,col:integer;
label Verify;
begin
row:=0;col:=0;
                    // Проверка есть ли на главной диагонали 0
Verify:
  for i:=row to rows-1 do
    for j:=col to cols-1 do
       if (i=j) and (absval(Matr[i,j])<e) then
       begin
          eqnum:=i;
          for k:= col to cols-1 do
            if(absval(Matr[eqnum,k])>e)then
            begin
               SwapCols(eqnum,k);
               inc(row);inc(col);
               goto Verify;
            end;
          for k:=row to rows-1 do
            if (absval(Matr[k,eqnum])>e)then
            begin
               SwapRows(k,eqnum);
               inc(row);inc(col);
               goto Verify;
            end; {if}
       end {if}
end;

function _Matrix.Rank():TNumber;
var i,j,co,k:integer;
    T:PMatrix;
    mde,fre:TNumber;
    zero:boolean;

    {function FindMax(row:integer):boolean;
    var j,k,x:integer;
        value:double;
    begin
        value:=0.0;x:=0;
        for k:= 0 to T.cols-2 do
          if(absval(T.Matr[row,k])>e)then
          begin
            value := double(T.Matr[row,k]);
            x:=k;
            for j:=k to T.cols-2 do
               if (absval(T.Matr[row,j])>value) then
               begin
                 value:=T.Matr[row,j].float;
                 x:=j
               end;
            break
          end else value:=0.0;
        if abs(value)>e then begin
          T.SwapCols(x,row);
          result:=true;
        end else result:=false
    end; }
begin
  {result:=0;co:=0;
  CheckMainDiag();
   while(co < T.rows)do begin
     k:=1;
     for i:=co to T.rows-1 do
     begin
       mde:=T.Matr[co-1,co-1];
       fre:=T.Matr[i,co-1];
       if (absval(mde)<e)then Zero:=true else Zero:=false;
       for j:=co-1 to T.cols-1 do
       begin
         if Zero then begin
           if not FindMax(co-1) then raise Exception.Create('Уравнение не имеет решений.')
           else begin
            mde:=T.Matr[co-1,j];
            fre:=T.Matr[i,j];
            Zero:=false;
           end
         end;
         if not zero then
           T.Matr[i,j]:=T.Matr[i,j]-((fre/mde)*T.Matr[i-k,j]);
       end; //for
       inc(k);
     end; // for
     inc(co);
  end; // while
  CheckMainDiag();
  for i:=0 to rows-1 do
    for j:=0 to cols-1 do
      if (i=j) and (absval(Matr[i,j])>e) then result:=result+1;}
end;
             // перестановка столбцов
procedure _Matrix.SwapCols(from_col,to_col:integer);
var i:integer;tmp:Tnumber;
begin
  if (from_col<>to_col) and (from_col<=cols) and (to_col<=cols) then
    for i:=0 to rows-1 do begin
      tmp:=Matr[i,to_col];
      Matr[i,to_col]:=Matr[i,from_col];
      Matr[i,from_col]:=tmp
    end
end;
           //  Перестановка строк
procedure _Matrix.SwapRows(from_row,to_row:integer); // параметры индексы
var i:integer; tmp:TNumber;
begin
 if (from_row<>to_row) and (from_row<=rows) and (to_row<=rows) then
    for i:=0 to cols-1 do begin
      tmp:=Matr[to_row,i];
      Matr[to_row,i]:=Matr[from_row,i];
      Matr[from_row,i]:=tmp;
    end
end;
           // Минор матрицы
function _Matrix.Minor(i, j: integer):Tnumber;
var k,l,n,m:integer;
    T:PMatrix;
begin
n:=0;m:=0;result:=0;
if ((i<rows) and (j<cols))then
  if (rows>2)and(cols>2) then begin
    new(T);
    T.SetMatrix(rows-1,cols-1);
    for k:=0 to rows-1 do
      for l:=0 to cols-1 do
        if (k<>i)and(l<>j)then
          if  m<=T.cols-1 then begin
            T.Matr[n,m]:=Matr[k,l];
            inc(m);
          end else begin
             m:=0;
             inc(n);
             T.Matr[n,m]:=Matr[k,l];
             inc(m);
          end;
    result:=T.Getdet();
    Dispose(T)
  end
end;
             // Алгебраическое дополнение элемента матрицы
function _Matrix.Algebraic(): PMatrix;
var minorel:TNumber;Ex,i,j:integer;
    T:PMatrix;
begin
  new(T);new(result);
  result.SetMatrix(rows,cols);
  self.CopyTo(T);
  for i:=0 to rows-1 do
    for j:=0 to cols-1 do begin
      minorel:=T.Minor(i,j);
      Ex:=(i+j);
      if odd(Ex) then
        result.Matr[j,i]:=-minorel
      else
        result.Matr[j,i]:=minorel;
    end;
  Dispose(T);
end;
      // Обратная матрица
class function _Matrix.Inverse(const A:PMatrix):PMatrix;
var det,k:TNumber;
    T,Alg:PMatrix;
begin
 if (A.rows=A.cols)then begin
    new(T);new(alg);
    A.CopyTo(T);
    det:=T.Getdet;
    if absval(det)>e then begin
      new(result);
      Alg:=T.Algebraic;
      k:=1./det;
      result.SetMatrix(T.rows,T.cols);
      result:=k*Alg^;
      Dispose(T);dispose(Alg);
    end else begin
      Dispose(T);dispose(Alg);
      raise Exception.Create(NoInverse);
    end
 end else raise Exception.Create(InvalidLength);
end;

        // Определитель
function _Matrix.Getdet(): TNumber;
var minorel,mds,pds:Tnumber;
    T:PMatrix;co,s:integer;
             // Проверка есть ли на главной диагонали 0 если меняются строки то меняется знак результата
    function CheckDiag():integer;
    var i,j,k:integer;
      row,col:integer;
    label Verify;
    begin
      row:=0;col:=0;result:=1;
    Verify:
      for i:=row to T.rows-1 do
        for j:=col to T.cols-1 do
          if (i=j) and (absval(T.Matr[i,j])<e) then
          begin
            for k:= col to T.cols-1 do
              if(absval(T.Matr[k,i])>e)then
              begin
                T.SwapRows(k,i);
                inc(row);inc(col);
                result:=-result;
                goto Verify;
              end;
          end {if}
    end;
                      // Нижний треугольный вид
    function SetTriangle():TNumber;
    var i,j,k,co:integer;
        fre,mde:TNumber;
    begin
      mde:=0;result:=1;
      co:=1;
      while(co<T.rows-1)do begin
        k:=1;
        for i:=co to T.rows-1 do begin
          mde:=T.Matr[co-1,co-1];
          fre:=T.Matr[i,co-1];
          for j:=co-1 to T.cols-1 do
              if absval(mde)<e then T.Matr[i,j]:=0.0
              else
                T.Matr[i,j]:=T.Matr[i,j]-((fre/mde)*T.Matr[i-k,j]);
          inc(k);
        end;{for}
        inc(co);
        result:=result*mde;
      end; {while}
    end;

begin
if ((rows>=2) and (cols>=2)) and (rows=cols) then begin
  new(T);
  self.CopyTo(T);
  mds:=0;pds:=0;minorel:=1;s:=1;
  if (rows>2) and (cols>2) then begin
    s:=CheckDiag();
    minorel:=SetTriangle();
  end;
        // Вычисление разности главной и побочной диагоналей
    co:=rows-1;
    mds:=T.Matr[co,co]*T.Matr[co-1,co-1];
    pds:=T.Matr[co,co-1]*T.Matr[co-1,co];
    Result:=(minorel*(mds-pds))*s;
    Dispose(T);
end else raise Exception.Create(InvalidLength);
end;
//


function _Matrix.ToString(const sett:TFormat):AnsiString;
var i,j:integer;
begin
  result:='';
  for i:=0 to rows-1 do begin
    for j:=0 to cols-1 do
      result:=result+Matr[i,j].ToString(sett)+',';
    Delete(result,length(result),1);
    result:=result+#13#10;
  end
end;

procedure _MAtrix.SetMatrix(row,col:integer);
begin
  if (row>=0)and(col>=0)then
    SetLength(Matr,row,col);
  rows:=row;
  cols:=col
end;

function _Matrix.getelement(i, j: integer): Tnumber;
begin
Result:=self.Matr[i,j];
end;

procedure _Matrix.setelement(i, j: integer; const Value: TNumber);
begin
self.Matr[i,j]:=Value;
end;

end.
