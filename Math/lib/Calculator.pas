{***************************************************************************}
{                                                                           }
{             Модуль:   Калькулятор                                         }
{             Описание: Вычисления по польской записи                       }
{             Автор:    Зверинцев Дмитрий                                   }
{                                                                           }
{***************************************************************************}

unit Calculator;

interface
uses Translator,SysUtils,Complex,Forms,TypInfo;

const endl=#13#10;

type TCalculator=class
  private
    var sett:PFormat;
        data:PData;
        pz:TPz;
        stack:TStack;
        result_str:AnsiString;
        item:TDataItem;
        MAinFormHandle:Cardinal;
    procedure Addition();
    procedure Substraction();
    procedure Mult();
    procedure Divide();
    procedure FAbs();
    function Rect_Integral(const pz:TPz;var pos:integer):TNumber;
    function Derrivative(const pz:TPz;var pos:integer):TNumber;
    function UserFunction(const data:TData;f_addr:integer):PDataItem;
    function StdFuncs(const code:integer;var pos:integer):TDataItem;
    procedure Calc(const pz:TPz;const str_res:boolean=true);
  public
    procedure Draw  (const input:AnsiString);
    function CalcStr(const input:AnsiString):AnsiString;
    procedure SetData(const adress:integer;const value:TDataItem);
    function CalcPz ():TDataItem;
    function Get_Var_Addr(const VarName:ShortString):integer;
    property MainFormHWND:Cardinal read MainFormHandle;
    constructor Create(const MainForm:Cardinal;const sett:PFormat);overload;
    constructor Create(const MAinForm:cardinal;const sett:PFormat;const DataPtr:PData);overload;
    destructor Destroy;override;
end;

implementation
uses Graph;

constructor TCalculator.Create(const MainForm:Cardinal;const sett:PFormat);
begin
   inherited Create;
   MAinFormHandle:=MainForm;
   self.sett:=sett;
   stack:=TStack.Create;
   data:=@GData;
   pz:=nil;
   FillChar(item,sizeof(item),0)
end;

constructor TCalculator.Create(const MAinForm:cardinal;const sett:PFormat;const DataPtr:PData);
begin
   inherited Create;
   MAinFormHandle:=MainForm;
   self.sett:=sett;
   stack:=TStack.Create;
   data:=DataPtr;
   pz:=nil;
   FillChar(item,sizeof(item),0)
end;

destructor TCalculator.Destroy;
begin
   translator.Free;
   stack.Free;
   pz.Free;
   data:=nil;
   sett:=nil;
   inherited Destroy
end;

function TCalculator.CalcPz ():TDataItem;
begin
  Calc(pz,false);
  result:=item;
end;

function TCalculator.CalcStr(const input:AnsiString):AnsiString;
begin
    try
      Read(input,self.sett^,pz);
      if self.data=nil then self.data:=@GData;
      Calc(pz);
      result:=result_str;
    except
      raise
    end;
end;

function TCalculator.Get_Var_Addr(const VarName:ShortString):integer;
var i:integer;
begin
   result:=MaxInt;
   if Length(VarName)=0 then exit(result);
   for i:=0 to data^.Len-1 do
        if data^[i].name=VarName then exit(NData+i)
end;

procedure TCalculator.Draw  (const input:AnsiString);
begin
try
  Form2:=TForm2.Create(Application);
  Form2.sett:=sett^;
  Form2.Calculator:=self;
  Read(input,self.sett^,self.pz);
  Form2.ShowModal;
  FreeAndNil(Form2);
except
  raise
end;
end;

{$REGION ' Operations '}

procedure TCalculator.Addition();
var s:string;
label Error;
begin
with data^[stack[stack.len-2]-NData] do
 case d_type of
    Mat: case data^[stack[stack.len-1]-NData].d_type of
           Mat: begin
                  item.d_type:=Mat;
                  item.Matrix:= Matrix^+data^[stack[stack.len-1]-NData].Matrix^;
                end;
      Constant: begin
                  item.d_type:=Mat;
                  item.Matrix:= Matrix^+data^[stack[stack.len-1]-NData].number;
                end;
         end; {case}
   Vect: case data^[stack[stack.len-1]-NData].d_type of
          Vect: begin
                  item.d_type:=Vect;
                  item.Vector:=Vector^+data^[stack[stack.len-1]-NData].Vector^;
                end;
      Constant: begin
                 item.d_type:=Vect;
                 item.Vector:=Vector^+data^[stack[stack.len-1]-NData].number;
                end;
         end; {case}
Constant: case data^[stack[stack.len-1]-NData].d_type of
           Mat: begin
                  item.d_type:=Mat;
                  item.Matrix:= number+data^[stack[stack.len-1]-NData].Matrix^;
                end;
          Vect: begin
                  item.d_type:=Vect;
                  item.Vector:=number+data^[stack[stack.len-1]-NData].Vector^;
                end;
      Constant: begin
                  item.d_type:=Constant;
                  item.Number:= number+data^[stack[stack.len-1]-NData].number
                end;
         ident: begin
                  s:=string(data^[stack[stack.len-1]-NData].name);
                  goto Error;
                end;
          end; {case}
   Ident: begin
           s:=string(data^[stack[stack.len-2]-NData].name);
           goto Error;
          end;
 end; {case}
exit;
Error:
  raise Exception.Create('Использование необьявленной переменной. '+s);
end;

procedure TCalculator.Substraction();
var s:string;
label Error;
begin
with data^[stack[stack.len-2]-NData] do
 case d_type of
    Mat: case data^[stack[stack.len-1]-NData].d_type of
           Mat: begin
                  item.d_type:=Mat;
                  item.Matrix:= Matrix^-data^[stack[stack.len-1]-NData].Matrix^;
                end;
      Constant: begin
                  item.d_type:=Mat;
                  item.Matrix:= Matrix^-data^[stack[stack.len-1]-NData].number;
                end;
         end; {case}
   Vect: case data^[stack[stack.len-1]-NData].d_type of
          Vect: begin
                  item.d_type:=Vect;
                  item.Vector:=Vector^-data^[stack[stack.len-1]-NData].Vector^;
                end;
      Constant: begin
                 item.d_type:=Vect;
                 item.Vector:=Vector^-data^[stack[stack.len-1]-NData].number;
                end;
         end; {case}
Constant: case data^[stack[stack.len-1]-NData].d_type of
           Mat: begin
                  item.d_type:=Mat;
                  item.Matrix:= number-data^[stack[stack.len-1]-NData].Matrix^;
                end;
          Vect: begin
                  item.d_type:=Vect;
                  item.Vector:=number-data^[stack[stack.len-1]-NData].Vector^;
                end;
      Constant: begin
                  item.d_type:=Constant;
                  item.Number:= number-data^[stack[stack.len-1]-NData].number
                end;
        Ident: begin
                  s:=string(data^[stack[stack.len-1]-NData].name);
                  goto Error;
               end;
          end; {case}
   Ident: begin
            s:=string(data^[stack[stack.len-2]-NData].name);
            goto Error;
          end;
 end; {case}
exit;
Error:
  raise Exception.Create('Использование необьявленной переменной. '+s);
end;

procedure TCalculator.Mult();
var s:string;
label Error;
begin
with data^[stack[stack.len-2]-NData] do
 case d_type of
    Mat: case data^[stack[stack.len-1]-NData].d_type of
           Mat: begin
                  item.d_type:=Mat;
                  item.Matrix:= Matrix^*data^[stack[stack.len-1]-NData].Matrix^;
                end;
      Constant: begin
                  item.d_type:=Mat;
                  item.Matrix:= Matrix^*data^[stack[stack.len-1]-NData].number;
                end;
         end; {case}
   Vect: case data^[stack[stack.len-1]-NData].d_type of
          Vect: begin
                  item.d_type:=Constant;
                  item.number:=Vector^*data^[stack[stack.len-1]-NData].Vector^;
                end;
      Constant: begin
                 item.d_type:=Vect;
                 item.Vector:=Vector^*data^[stack[stack.len-1]-NData].number;
                end;
         end; {case}
Constant: case data^[stack[stack.len-1]-NData].d_type of
           Mat: begin
                  item.d_type:=Mat;
                  item.Matrix:= number*data^[stack[stack.len-1]-NData].Matrix^;
                end;
          Vect: begin
                  item.d_type:=Vect;
                  item.Vector:=number*data^[stack[stack.len-1]-NData].Vector^;
                end;
      Constant: begin
                  item.d_type:=Constant;
                  item.Number:= number*data^[stack[stack.len-1]-NData].number
                end;
         Ident: begin
                  s:=string(data^[stack[stack.len-1]-NData].name);
                  goto Error;
                end;
          end; {case}
   Ident: begin
            s:=string(data^[stack[stack.len-2]-NData].name);
            goto Error;
          end;
 end; {case}
exit;
Error:
  raise Exception.Create('Использование необьявленной переменной. '+s);
end;

procedure TCalculator.Divide();
var s:string;
label Error;
begin
try with data^[stack[stack.len-2]-NData] do
 case d_type of
    Mat: case data^[stack[stack.len-1]-NData].d_type of
           Mat: begin
                  item.d_type:=Mat;
                  item.Matrix:= Matrix^/data^[stack[stack.len-1]-NData].Matrix^;
                end;
      Constant: begin
                  item.d_type:=Mat;
                  item.Matrix:= Matrix^/data^[stack[stack.len-1]-NData].number;
                end;
         end; {case}
   Vect: case data^[stack[stack.len-1]-NData].d_type of
      Constant: begin
                 item.d_type:=Vect;
                 item.Vector:=Vector^/data^[stack[stack.len-1]-NData].number;
                end;
         end; {case}
Constant: case data^[stack[stack.len-1]-NData].d_type of
           Mat: begin
                  item.d_type:=Mat;
                  item.Matrix:= number/data^[stack[stack.len-1]-NData].Matrix^;
                end;
          Vect: begin
                  item.d_type:=Vect;
                  item.Vector:=number/data^[stack[stack.len-1]-NData].Vector^;
                end;
      Constant: begin
                  item.d_type:=Constant;
                  item.Number:= number/data^[stack[stack.len-1]-NData].number
                end;
         Ident: begin
                  s:=string(data^[stack[stack.len-1]-NData].name);
                  goto Error;
                end;
          end; {case}
   Ident: begin
            s:=string(data^[stack[stack.len-2]-NData].name);
            goto Error;
          end;
 end; {case}
exit;
Error:
  raise Exception.Create('Использование необьявленной переменной. '+s);
except
  on EMathError do begin
    item.d_type:=Constant;
    item.number.float:=Nan;
  end else raise
end
end;

procedure TCalculator.FAbs();
begin
  item.d_type:=constant;
  with data^[stack[stack.len-1]-NData] do
    case d_type of
      Mat:  item.number:=Matrix.GetDet();
     Vect:  item.number:=Vector.VAbs(Vector^);
 Constant:  item.number:=AbsVal(number);
    Ident: begin
            raise Exception.Create('Использование необьявленной переменной. '+string(name));
          end;
    end
end;
{$ENDREGION}

procedure TCalculator.SetData(const adress:integer;const value:TDataItem);
begin
  with data^[adress-NData] do
   if (d_type=Ident) or (d_type=value.d_type) then data^[adress-NData]:=value
   else raise Exception.Create('Несовместимые типы '+
      GetEnumName(TypeInfo(TDataType),ord(d_type))+' и '+
      GetEnumName(TypeInfo(TDataType),ord(value.d_type)));
end;
        //  integ(x,a,b,func)
function TCalculator.Rect_Integral(const pz:TPz;var pos:integer):TNumber;
var a,b,h:double;i,j,n,x_addr:integer;
    x,y:TNumber;tmp:TDataitem;
    func:TPz;
    s:ansistring;
begin
   inc(pos);a:=0;b:=0;s:='';
   tmp:=data^[pz[pos]-NData];
   tmp.d_type:=Constant;
   x_addr:=pz[pos];inc(pos);
   for i:=0 to 1 do begin
      if (i=0) and (pz[pos]<0) then
          a:=consts[abs(pz[pos]-NConst)].float
      else if (i=0) and (pz[pos]>0) then
          a:=data^[pz[pos]-NData].number.float
      else if (i=1) and (pz[pos]<0) then
          b:=consts[abs(pz[pos]-NConst)].float
      else if (i=1) and (pz[pos]>0) then
          b:=data^[pz[pos]-NData].number.float;
      inc(pos)
   end;

   func:=TPz.Create;
   i:=pos;j:=0;
   repeat
      func.SetLen(func.Len+1);
      func[j]:=pz[i];
      inc(i);inc(j);
   until (pz[i] in [Assign,Semicolon,Translator.Pow..Factorial]) or (pz[i] < 0);
   pos:=i-1;
   func.SetLen(func.Len+1);
   func[j]:=semicolon;

   item.d_type:=constant;
   item.name:='dx';
   item.Matrix:=nil;
   item.Vector:=nil;

   n:=trunc(a+b);
   h:=(b-a)/n;
   x:=(a+h)/2;
   item.number:=x;
   SetData(x_addr,item);
   y:=0.0;
   result:=y;
   for i:=1 to n do
   begin
     Calc(func,false);
     y:=item.number;
     result:=result+y;
     x:=x+h;
     item.number:=x;
     SetData(x_addr,item)
   end;
   result:=result*h;
   SetData(x_addr,tmp);
end;

 //               Вычисление производной
 //  (f(x+h)-f(x))/h  для производной первого порядка
 //  1/(nh)^n*(f(x+nh)-nf(x)+f(x-nh)) для производной второго порядка
 //  y`(x)=func
function TCalculator.Derrivative(const pz:TPz;var pos:integer):TNumber;
var i,j,x_adr,order:integer;
    func:TPz;
    x,dx,ndx,k:TNumber;tmp:TDataItem;
const h=1e-6;
begin
  inc(pos);
  order:=trunc(consts[abs(pz[pos]-NConst)].float);
  inc(pos);
            //  аргументы функции
    x_adr:=pz[pos];
    tmp:=data^[x_adr-NData];
    tmp.d_type:=Constant;
    x:= tmp.number;
    inc(pos);
    if order > 1 then
    begin
      dx:=x+(h*order)/(order-1);
      ndx:=x-(h*order)/(order-1);
      if absval(x)<e then dx:=0.0;
    end else
      dx:=x+h;
    if absval(x)<e then dx:=0.0;
    j:=0;i:=pos;
                // Выделяем функцию
    func:=TPz.Create;
    repeat
       func.SetLen(func.len+1);
       func[j]:=pz[i];
       inc(j); inc(i);
    until (pz[i] in [Assign,Semicolon,Translator.Pow..Factorial]) or (pz[i] < 0);
    pos:=i-1;
    func.SetLen(func.Len+1);
    func[j]:=semicolon;
             //  Вычисления
    Calc(func,false);           // f(x)
    x:=item.number;
    item.number:=dx;
    item.name:=data^[x_adr-Ndata].name;
    SetData(x_adr,item);
    Calc(func,false);         //  f(x+h)
    dx:=item.number;
    if order > 1 then
    begin
      item.number:=ndx;
      item.name:=data^[x_adr-Ndata].name;
      SetData(x_adr,item);
      Calc(func,false);       //  f(x-h)
      ndx:=item.number;
      k:=1./(pow(TNumber(order*h),order));
      Result:=((dx-(order*x)+ndx))*k
    end else
       result:=(dx-x)/h;
    SetData(x_adr,tmp);
    pos:=i-1;
end;


function TCalculator.UserFunction(const data:TData;f_addr:integer):PDataItem;
var s:string[10];i,j:integer;
    self_data_addr:Pointer;
    param:integer;
begin
New(result);
  with UserFuncs[f_addr-UFunc_Min] do
  begin
    for i:=high(params) downto 0 do
      if params[i]=0 then continue
      else begin
        s:=fu_data[params[i]-NData].name;
        if stack.Len=0 then raise Exception.Create('Не соответствие параметров в функции.'+
           string(UserFuncs[f_addr-UFunc_Min].name));
        param:=stack.Pop();
        for j:=0 to fu_data.Len-1 do
          if s=fu_data[j].name then
          begin
            item:= data[param-NData];
            item.name:= s;
            fu_data[j]:= item;
            FillChar(item,sizeof(item),0);
          end;
      end;
    self_data_addr:=self.data;
    self.data:=@fu_data;
    Calc(body,false);
    self.data:=self_data_addr;
    Move(item,result^,sizeof(TDataItem));
    result.name:=UserFuncs[f_addr-UFunc_Min].name;
  end;
end;

function TCalculator.StdFuncs(const code:integer;var pos:integer):TDataItem;
var a,b:integer;
begin
a:=0;b:=0;
with result,stack do begin
  if stack.Len>0 then
    name:=data^[stack[stack.Len-1]-NData].name
  else
    name :='';
  if code in [100..112] then begin
    if code in [100..110] then a:=Pop-NData;
    if code = 103 then b:=pop-NData;
    d_type:=constant;
    Matrix:=nil;
    Vector:=nil;
  end else if code=113 then begin
    d_type:=Vect;
    Matrix:=nil;
  end;
  case code of
UFunc_Min..Ndata-1: result:=UserFunction(data^,pos)^;
           100: number:=ex(data^[a].number);
           101: number:=sinus(data^[a].number);
           102: number:=cosinus(data^[a].number);
           103: number:=sqrtn(data^[b].number,
                              data^[a].number.float);
           104: number:=lnat(data^[a].number);
           105: number:=tangent(data^[a].number);
           106: number:=cotangent(data^[a].number);
           107: number:=secant(data^[a].number);
           108: number:=cosecant(data^[a].number);
           109: number:=hypsin(data^[a].number);
           110: number:=hypcos(data^[a].number);
           111: number:=Derrivative(pz,pos);
           112: number:=Rect_Integral(pz,pos);
           113: begin
                 d_type:=Vect;
                 Vector:=data^[stack[stack.len-1]-NData].Matrix.Gauss()
                end;
  end; {case}
end
end;
        // калькулятор
procedure TCalculator.Calc(const pz:TPz;const str_res:boolean=true);
var i,t,k,st_1,res_func_adr:integer;
begin
i:=0;
if pz<>nil then with stack do
  while (i<=pz.Len-1) do begin
      if item.d_type<>None then FillChar(item,sizeof(item),0);
      Push(pz[i]);
      st_1:=stack[len-1];
           // на вершине стека данные
      if (st_1 >= Ndata) then begin inc(i);continue end
          // на вершине стека число
      else if (st_1 <= NConst)then
      begin
        data^.SetLen(data^.Len+1);
        item.d_type:=constant;
        item.number:=consts[abs(st_1-NConst)];
        data^[data^.len-1]:=item;
        Del_st;
        Push(NData+data^.Len-1);
        inc(i);
      end
          // на вершине стека функция
      else if (st_1 in [NFunc..Ndata-1])then
      try
        t:=stack.Pop();
        k:=i;
        data^.SetLen(data^.Len+1);
        res_func_adr:=(data^.len-1)+NData;
        if t in [UFunc_Min..NData-1]then k:=t;               // user func
        data^[res_func_adr-NData]:=StdFuncs(t,k);
        Push(res_func_adr);
        if k <> t then i:=k;
        inc(i)
      except
        on EMathError do item.number.float:=Nan;
        else raise
      end
          // на вершине стека операция
      else if st_1 in [0..NFunc-1] then
      begin
        if not (st_1 in [Semicolon,Assign]) then data^.SetLen(data^.Len+1);
        t:=Pop();
        with data^[stack[len-2]-NData] do
        case t of
          CPop: begin Pop;inc(i);continue end;
Translator.Pow:if(d_type = Mat)then
               begin
                 item.d_type:=Mat;
                 item.Matrix:= Matrix.Inverse(data^[stack[len-2]-NData].Matrix);
               end
               else begin
                 item.d_type:=constant;
                 item.number:=Pow(number,data^[stack[Len-1]-Ndata].number.float);
               end;
    Factorial: begin
                item.d_type:=Constant;
                item.number:=fact(data^[stack[Len-1]-NData].number);
               end;
         Plus: Addition();
        Minus: Substraction();
        Cross: if(d_type=Vect) and (data^[stack[len-1]-NData].d_type=Vect)then
               begin
                 item.d_type:=Vect;
                 item.Vector:=Vector.Mul(Vector^,data^[stack[len-1]-NData].Vector^);
               end else raise Exception.Create('Незвестная операция.');
          Mul: Mult();
     Division: Divide();
     Func_abs: FAbs();
       Assign: with data^[stack[len-1]-NData] do begin
                  item.name:=data^[stack[len-2]-NData].name;
                  item.d_type:= d_type;
                  item.Matrix:= Matrix;
                  item.Vector:= Vector;
                  item.number:= number;
                  data^[stack[len-2]-NData]:=item;
                  Del_st;
                  inc(i);
                  continue;
               end;
    Semicolon: begin
                  if str_res then
                    with data^[stack[len-1]-NData] do
                    begin
                      if name='' then name:='result';
                      if d_type=Vect then begin
                          result_str:=result_str+name+' = ';
                          result_str:=result_str+Vector.ToString(sett^)+endl
                      end else if d_type=Mat then begin
                          result_str:=result_str+name+' = '+endl;
                          result_str:=result_str+Matrix.ToString(sett^)+endl
                      end else if d_type=Constant then begin
                          result_str:=result_str+name+' = ';
                          result_str:=result_str+number.ToString(sett^)+endl;
                      end
                    end
                  else item:=data^[stack[Len-1]-NData];
                  Del_st;
                  inc(i);
                  continue;
               end;
        end; {case}
        data^[data^.Len-1]:=item;
        if t in [Factorial,Func_Abs] then begin
            Del_st;
            Push(NData+data^.Len-1)
        end else begin
            Del_st;Del_st;
            Push(NData+data^.Len-1);
        end;
        inc(i)
      end {else if}
    end; {while}
end;

end.
