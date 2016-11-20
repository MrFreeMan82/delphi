program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type TRoman=class
  private
    roman:Ansistring;
    function Get_num: Ansistring;
  public
    procedure ToRoman(arabic:integer);
    function ToArabic(roman:Ansistring):integer;
    property View:Ansistring read Get_num;
    constructor Create;
end;

type PRoman=^TRoman;

{ TRoman }

function TRoman.ToArabic(roman: Ansistring):integer;
var
  i,lastValue,curValue:integer;
begin
  Result:=0;
  lastValue:=0;
  curValue:=0;
  for i:=Length(roman)downto 1 do begin
    case UpCase(roman[i]) of
      'C':curValue:=100;
      'D':curValue:=500;
      'I':curValue:=1;
      'L':curValue:=50;
      'M':curValue:=1000;
      'V':curValue:=5;
      'X':curValue:=10;
      else
        Exit(0)
    end;
    if curValue<lastValue then
      dec(Result,curValue)
    else
      inc(Result,curValue);
    lastValue:=curValue;
  end;
end;

procedure TRoman.ToRoman(arabic:integer);
const
  vals:array[0..12]of integer=(1,4,5,9,10,40,50,90,100,400,500,900,1000);
  roms:array[0..12]of string[2]=('I','IV','V','IX','X','XL','L','XC','C','CD','D','CM','M');
var
  b:byte;
begin
  if (arabic>0)and(arabic<=3999) then begin
    roman:='';
    b:=12;
    while arabic>0 do begin
      while vals[b]>arabic do dec(b);
      dec(arabic,vals[b]);
      roman:=roman+roms[b];
    end
  end else raise Exception.Create('Enter number between 1..3999');
end;

constructor TRoman.Create;
begin
  roman:=''
end;

function TRoman.Get_num: Ansistring;
begin
  Result:=roman;
end;

var
  Rom:TRoman;
  num:integer;
  tmp:char;
begin
  try
  repeat
    Rom:=TRoman.Create;
    Writeln('Enter arab number ');
    Readln(num);
    Rom.ToRoman(num);
    writeln(Rom.View);
    Writeln(Rom.ToArabic(Rom.View));
    Write('Quit? ');
    readln(tmp);
  until tmp='y';
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
