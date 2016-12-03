{***************************************************************************}
{                                                                           }
{             Модуль:   Шаблон динамических массивов                        }
{             Описание: Для организации стека,польской записи,массива данных}
{             Автор:    Зверинцев Дмитрий                                   }
{                                                                           }
{***************************************************************************}

unit DynArray;

interface

type TArray<T> = class
    strict private
      arr: array of T;
      arr_len:integer;
      function GetT(i: integer): T;
      procedure SetT(i: integer; const Value: T);
    public
      procedure Add(const Value:T);
      procedure Del;
      procedure SetLen(length:integer);
      procedure Insert(element:T;pos:integer);
      property Element[i:integer]:T read GetT write SetT;default;
      property Len:integer read arr_len;
      constructor Create();
      destructor Destroy;override;
end;

implementation

procedure TArray<T>.Add(const Value: T);
begin
  inc(arr_len);
  SetLength(arr,arr_len);
  arr[arr_len-1]:=Value
end;

constructor TArray<T>.Create;
begin
  arr_len:=0;
  arr:=nil;
end;

procedure TArray<T>.Del;
begin
   dec(arr_len);
   SetLength(arr,arr_len)
end;

destructor TArray<T>.Destroy;
begin
  arr_len:=0;
  arr:=nil;
end;

procedure TArray<T>.Insert(element:T;pos:integer);
var i:integer;
    tmp:array of T;
begin
  SetLength(tmp,arr_len);
  for i:=0 to arr_len-1 do tmp[i]:=arr[i];
  SetLength(arr,arr_len+1);inc(arr_len);
  arr[pos]:=element;
  i:=0;
  while (i <= (arr_len-1)) do begin
     if (i>pos)then
             arr[i]:=tmp[i-1];
     inc(i)
  end;
end;

function TArray<T>.GetT(i: integer): T;
begin
  result:=arr[i];
end;

procedure TArray<T>.SetT(i: integer; const Value: T);
begin
  arr[i]:=Value;
end;

procedure TArray<T>.SetLen(length: integer);
begin
    SetLength(arr,length);
    arr_len:=length;
end;

end.

{type
  TArray = class
    private type
      val = integer;
      pval = ^val;
    private
      arr: pointer;
      arr_len:integer;
      function GetT(i: integer): val;inline;
      procedure SetT(i: integer; const Value: val);inline;
    public
      procedure SetLen(length:integer);
      property Element[i:integer]:val read GetT write SetT;default;
      property Len:integer read arr_len;
      constructor Create();
      destructor Destroy;override;
end; }
{
constructor TArray.Create;
begin
  inherited;
  arr_len:=0;
  arr:=nil;
end;

destructor TArray.Destroy;
begin
  FreeMem(arr,arr_len*sizeof(val));
  inherited;
end;

function TArray.GetT(i: integer): val;
begin
  result:=pval(integer(arr)+(i*sizeof(val)))^;
end;

procedure TArray.SetT(i: integer; const Value: val);
begin
  pval(integer(arr)+(i*sizeof(val)))^:=Value;
end;

procedure TArray.SetLen(length: integer);
 var t:pointer;
  begin
    if (length=arr_len)then exit;
    if length<=0 then begin
       FreeMem(arr,arr_len*sizeof(val));
       arr_len:=0;arr:=nil;
       exit
    end else
    begin
        GetMem(t,length*sizeof(val));
      if ((length>0)and(length>arr_len))and(arr_len>0) then
        Move(arr^,t^,arr_len*sizeof(val))
      else if ((length>0)and (length<arr_len))and(arr_len>0) then
        Move(arr^,t^,length*sizeof(val));
      if arr<>nil then FreeMem(arr,arr_len*sizeof(val));
      arr:=t;
      arr_len:=length;
    end
end; }
