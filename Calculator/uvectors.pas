unit uvectors;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, math;

type
  TVector = array of double;

operator + (a,b: TVector) z: TVector;
operator + (a: double; b:TVector) z: TVector;
operator + (a: TVector; b: double) z: TVector;
operator - (a,b: TVector) z: TVector;
operator - (a: double; b:TVector) z: TVector;
operator - (a: TVector; b: double) z: TVector;
operator - (a: TVector) z: TVector;
operator * (a,b: TVector) z: double;
operator * (a: double; b:TVector) z: TVector;
operator * (a: TVector; b: double) z: TVector;
operator / (a: double; b:TVector) z: TVector;
operator / (a: TVector; b: double) z: TVector;
operator / (a,b:TVector)z: TVector;
operator mod(a,b: TVector)z: TVector;
function mulVectors(a,b: TVector): TVector;

function vectorToStr(v: TVector): string;


implementation

const e = 0.0001;

function vectorToStr(v: TVector): string;
var i:integer;
    sett: TFormatSettings;
begin
     if not assigned(v) then exit('');
     sett.DecimalSeparator := '.';
     result := '{';

     for i := 0 to length(v) - 1 do
                if i < length(v) - 1 then
                       result += floatToStr(v[i], sett) + ','
                else
                       result += floatToStr(v[i], sett);

     result += '}'
end;

operator+(a, b: TVector)z: TVector;
var i: integer;
begin
     z := nil;
     if not (assigned(a) and assigned(b)) then exit;
     SetLength(z, length(a));
     for i := 0 to length(z) - 1 do z[i] := a[i] + b[i]
end;

operator+(a: double; b: TVector)z: TVector;
begin
   z := b + a
end;

operator+(a: TVector; b: double)z: TVector;
var i: integer;
begin
     if not assigned(a) then exit;
     SetLength(z, length(a));
     for i := 0 to length(z) - 1 do z[i] := a[i] + b
end;

operator-(a, b: TVector)z: TVector;
var i: integer;
begin
     if not (assigned(a) and assigned(b)) then exit;
     SetLength(z, length(a));
    for i := 0 to length(z) - 1 do z[i] := a[i] - b[i]
end;

operator-(a: double; b: TVector)z: TVector;
var i: integer;
begin
    if not assigned(b) then exit;
    SetLength(z, length(b));
    for i := 0 to length(z) - 1 do z[i] := a - b[i]
end;

operator-(a: TVector; b: double)z: TVector;
var i: integer;
begin
    if not assigned(a) then exit;
    SetLength(z, length(a));
    for i := 0 to length(z) - 1 do z[i] := a[i] - b
end;

operator-(a: TVector)z: TVector;
var i: integer;
begin
     if not assigned(a) then exit;
     SetLength(z, length(a));
     for i := 0 to length(z) - 1 do z[i] := -a[i];
end;

operator*(a, b: TVector)z: double;
var i: integer;
begin
    z := 0;
    if not (assigned(a) and assigned(b)) then exit;
    for i := 0 to length(a) - 1 do z := z + (a[i] * b[i])
end;

operator*(a: double; b: TVector)z: TVector;
begin
     z := b * a;
end;

operator*(a: TVector; b: double)z: TVector;
var i: integer;
begin
    if not assigned(a) then exit;
    SetLength(z, length(a));
    for i := 0 to length(z) - 1 do z[i] := a[i] * b
end;

operator/(a: double; b: TVector)z: TVector;
var i: integer;
begin
    if not assigned(b) then exit;
    SetLength(z, length(b));
    for i := 0 to length(z) - 1 do
    begin
             // b[i] = 0
         if abs(b[i]) < e then z[i] := infinity else z[i] := a / b[i];
    end;
end;

operator/(a: TVector; b: double)z: TVector;
var i: integer;
begin
    if not assigned(a) then exit;
    SetLength(z, length(a));
    for i := 0 to length(z) - 1 do
    begin
          // b[i] = 0
         if abs(b) < e then z[i] := infinity else z[i] := a[i] / b;
    end;
end;

operator/(a, b: TVector)z: TVector;
var i: integer;
begin
     if not (assigned(a) and assigned(b)) then exit;
     SetLength(z, length(a));
     for i := 0 to length(z) - 1 do
         if abs(b[i]) < e then z[i] := infinity else z[i] := a[i] / b[i];
end;

operator mod(a, b: TVector)z: TVector;
var i: integer;
begin
     if not (assigned(a) and assigned(b)) then exit;
     SetLength(z, length(a));
     for i := 0 to length(z) - 1 do
         if abs(b[i]) < e then z[i] := infinity else z[i] := frac(a[i] / b[i]) * b[i];
end;

function mulVectors(a, b: TVector): TVector;
begin
     if not (assigned(a) and assigned(b)) then exit;
     SetLength(result, length(a));
     result[0] := (a[1] * b[2]) - (a[2] * b[1]);
     result[1] := (a[2] * b[0]) - (a[0] * b[2]);
     result[2] := (a[0] * b[1]) - (a[1] * b[0]);
end;



end.

