unit uConsoleOut;
interface
uses SysUtils, Windows;

procedure GotoXY(aX, aY: integer);
procedure SetAttr(attr: word);
function WhereX: integer;
function WhereY: integer;

implementation

var
  UpperLeft: TCoord = (X:0; Y:0);
  hCon: integer;

procedure GotoXY(aX, aY: integer);
var
  aCoord: TCoord;
begin
  aCoord.x:=aX;
  aCoord.y:=aY;
  SetConsoleCursorPosition(hCon,aCoord);
end;

procedure SetAttr(attr: word);
begin
  SetConsoleTextAttribute(hCon,attr);
end;

function WhereX: integer;
var
  ScrBufInfo: TConsoleScreenBufferInfo;
begin
  GetConsoleScreenBufferInfo(hCon,ScrBufInfo);
  Result:=ScrBufInfo.dwCursorPosition.x;
end;

function WhereY: integer;
var
  ScrBufInfo: TConsoleScreenBufferInfo;
begin
  GetConsoleScreenBufferInfo(hCon,ScrBufInfo);
  Result:=ScrBufInfo.dwCursorPosition.y;
end;

function GetAttr: word;
var
  ScrBufInfo: TConsoleScreenBufferInfo;
begin
  GetConsoleScreenBufferInfo(hCon,ScrBufInfo);
  Result:=ScrBufInfo.wAttributes;
end;

initialization
  hCon := GetStdHandle(STD_OUTPUT_HANDLE);

end.
