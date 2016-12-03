{***************************************************************************}
{                                                                           }
{             Модуль:   Вектора                                             }
{             Описание: Операции с векторами                                }
{             Автор:    Зверинцев Дмитрий                                   }
{                                                                           }
{***************************************************************************}

unit Vectors;

interface
uses
  SysUtils,Complex;

type
  PVector = ^TVector;
  TVector = record
  private
    Vector:array of TNumber;
    len:byte;
    function GetVector(j: byte): TNumber;inline;
    procedure SetVector(j: byte; const Value: TNumber);
    procedure SetLen(value:byte);
  public
    class operator Add(const A,B:TVector):PVector;overload;inline;
    class operator Add(const A:TNumber;const B:TVector):PVector;overload;
    class operator Add(const A:TVector;const B:TNumber):PVector;overload;
    class operator Subtract(const A,B:TVector):PVector;overload;
    class operator Subtract(const A:TNumber;const B:TVector):PVector;overload;
    class operator Subtract(const A:TVector;const B:TNumber):PVector;overload;
    class operator Multiply(const A,B:TVector):TNumber;overload;
    class operator Multiply(const A:TNumber;const B:TVector):PVector;overload;
    class operator Multiply(const B:TVector;const A:TNumber):PVector;overload;
    class operator Divide(const A:TNumber;const B:TVector):PVector;overload;
    class operator Divide(const B:TVector;const A:TNumber):PVector;overload;
    class function Mul(const A,B: TVector):PVector;static;
    class function VAbs(const A:TVector):TNumber;static;
    function ToString(const sett:TFormat):AnsiString;
    property VectorLength:Byte read len write SetLen;
    property Element[j:byte]:TNumber read GetVector write SetVector;default;
    procedure Clear;
end;

resourcestring
  InvalidLength = 'Векторы должны иметь однинаковую длину.';
  Dim_3Vector   = 'Вектор не трехмерный';

implementation

{ TVector }
procedure TVector.Clear;
begin
  if (len > 0) then Vector  :=  nil;
end;

function TVector.ToString(const sett:TFormat):AnsiString;
var i:TNumber;
begin
  Result  :=  '';
  for i in Vector do
    result  :=  result  + i.ToString(sett)  + ',';
  Delete(result,length(result),1);
end;

{$REGION ' minus '}
class operator TVector.Subtract(const A,B:TVector):PVector;
var j:integer;
begin
  if (A.Len = B.Len) then
  begin
    New(Result);
    Result.VectorLength:=A.len;
    for j:=0 to A.Len-1 do
      Result.Vector[j]  :=  A.Vector[j] - B.Vector[j];
  end
  else raise Exception.Create(InvalidLength);
end;


class operator TVector.Subtract(const A:TVector;const B:TNumber):PVector;
var j:integer;
begin
    New(Result);
    Result.VectorLength :=  A.len;
    for j:=0 to A.Len-1 do
      Result.Vector[j]  :=  A.Vector[j] - B;
end;

class operator TVector.Subtract(const A:TNumber;const B:TVector):PVector;
var j:integer;
begin
    New(Result);
    Result.VectorLength :=  B.len;
    for j:=0 to B.Len-1 do
      Result.Vector[j]  :=  A - B.Vector[j];
end;
{$ENDREGION}

{$REGION ' plus '}
class operator TVector.Add(const A:TVector;const B:TNumber):PVector;
var j:integer;
begin
    New(Result);
    Result.VectorLength :=  A.len;
    for j:=0 to A.Len-1 do
      Result.Vector[j]  :=  B + A.Vector[j];
end;

class operator TVector.Add(const A:TNumber;const B:TVector):PVector;
var j:integer;
begin
    New(Result);
    Result.VectorLength :=  B.len;
    for j:=0 to B.Len-1 do
      Result.Vector[j]  :=  A + B.Vector[j];
end;

class operator TVector.Add(const A,B:TVector):PVector;
var j:integer;
begin
  if (A.Len = B.Len) then
  begin
    New(Result);
    Result.VectorLength :=  A.len;
    for j:=0 to A.Len-1 do
      Result.Vector[j]  :=  A.Vector[j] + B.Vector[j];
  end
  else raise Exception.Create(InvalidLength);
end;
{$ENDREGION}

{$REGION ' multiply '}
class operator TVector.Multiply(const B:TVector;const A:TNumber):PVector;
var j:integer;
begin
    New(Result);
    Result.VectorLength :=  B.len;
    for j:=0 to B.Len-1 do
      Result.Vector[j]  :=  A * B.Vector[j];
end;

class operator TVector.Multiply(const A:TNumber;const B:TVector):PVector;
var j:integer;
begin
    New(Result);
    Result.VectorLength :=  B.len;
    for j:=0 to B.Len-1 do
      Result.Vector[j]  :=  A * B.Vector[j];
end;

class operator TVector.Multiply(const A,B: TVector):TNumber;
var i:integer;
begin
  if (A.Len = B.Len) then
    for i:=0 to A.Len-1 do
      Result  :=  Result  + (A.Vector[i]  * B.Vector[i])
  else raise Exception.Create(InvalidLength);
end;
//
class function TVector.Mul(const A,B:TVector): PVector;
begin
  if(A.Len  = B.Len)and
    ((A.Len = 3)  and (B.Len  = 3))then
  begin
    New(Result);
    Result.VectorLength :=  3;
    Result.Vector[0]  :=  (A.Vector[1]*B.Vector[2])-(A.Vector[2]*b.Vector[1]);
    Result.Vector[1]  :=  (A.Vector[2]*B.Vector[0])-(A.Vector[0]*b.Vector[2]);
    Result.Vector[2]  :=  (A.Vector[0]*B.Vector[1])-(A.Vector[1]*b.Vector[0]);
    end else raise Exception.Create(Dim_3Vector);
end;
{$ENDREGION}

class operator TVector.Divide(const A:TNumber;const B:TVector):PVector;
var j:integer;
begin
    New(Result);
    Result.VectorLength :=  B.len;
    for j:=0 to B.Len-1 do
      Result.Vector[j]  :=  A / B.Vector[j];
end;

class operator TVector.Divide(const B:TVector;const A:TNumber):PVector;
var j:integer;
begin
    New(Result);
    Result.VectorLength :=  B.len;
    for j:=0 to B.Len-1 do
      Result.Vector[j]  :=  B.Vector[j] / A;
end;

class function TVector.VAbs(const A:TVector):TNumber;
var i:byte;
begin
  for i:=0 to A.Len-1 do
    result  :=result  + (A.Vector[i]*A.Vector[i]);
  result  :=  AbsVal(result);
  Result  :=  Sqrtn(result,2);
end;

procedure TVector.SetVector(j: byte; const Value: TNumber);
begin
  self.Vector[j]  :=  Value
end;

procedure TVector.SetLen(value:byte);
begin
    SetLength(Vector,value);
    Len :=  value
end;

function TVector.GetVector(j: byte): TNumber;
begin
  Result  :=  Vector[j]
end;

end.
