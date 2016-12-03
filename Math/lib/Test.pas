{***************************************************************************}
{                                                                           }
{             Модуль:   Тест                                                }
{             Описание: Поток для вычисления функции графика и тестов       }
{             Автор:    Зверинцев Дмитрий                                   }
{                                                                           }
{***************************************************************************}

unit Test;

interface

uses
  Classes,Messages,Windows,Calculator,Translator,SysUtils;

type
  TTest = class(TThread)
  private
     Mat:UPMatrix;
     t1,t2:TDatetime;
     hour,min,sec,msec:word;
     procedure Test_Det(Dim:integer);
     procedure Test_Inv(Dim:integer);
     procedure CalcFunc();
  protected
    procedure Execute; override;
  public
    TestNum:integer;
    x_addr,points:integer;
    x_name:string[10];
    XMin,XMax:double;
    NewCalc:TCalculator;
end;

implementation
uses Graph,Complex;

{ TTest }
procedure TTest.CalcFunc();
var
  i,l:integer;
  h:double;
  X,Y:TNumber;
  item:TDataItem;
begin
   h:=(Xmax-Xmin)/points;       //ToDo --------------
   X:=Xmin;
   l:=0;
   item.d_type:=constant;
   item.name:=x_name;
   item.Matrix:=nil;
   item.Vector:=nil;
   SetLength(Form2.Xres,points);
   SetLength(Form2.Yres,points);
   for i:=0 to points-1 do begin
      item.number:=X;
      try NewCalc.SetData(x_addr,item) except Form2.Xres:=nil; exit end;
      Y:=NewCalc.CalcPz().number;
      if Y.iscomplex or IsNan(Y.float) then begin
         Form2.Yres[l]:=Nan;
         Form2.Xres[l]:=X.float;
         inc(l);
         X:=X+h;
         continue
      end;
      Form2.Xres[l]:=X.float;
      Form2.Yres[l]:=Y.float;
      inc(l);
      X:=X+h;
      if i>100 then Clear;
   end;
  Clear;
end;

procedure TTest.Execute;
begin
  case TestNum of
    0: Test_det(200);
    1: Test_Inv(40);
  100: CalcFunc;
  end;
  NewCalc:=nil;
  PostMessage(Form2.Handle,WM_USER,0,0);
end;

procedure TTest.Test_Det(Dim:integer);
var i,j,k,l:integer;
begin
  Randomize;
  New(Mat);
  l:=0;
  SetLength(Form2.Xres,Dim);
  SetLength(Form2.Yres,Dim);
  for i:=2 to Dim do begin
    Mat.SetMatrix(i,i);
    for j:=0 to i-1 do
      for k:=0 to i-1 do
        Mat^[j,k]:=Random(100);
    t1:=Time;
    Mat.Getdet;
    t2:=Time;
    DecodeTime(t2-t1,hour,min,sec,msec);
    k:=msec+sec*1000+min*60000+hour*3600000;
    form2.Xres[l]:=i;
    form2.Yres[l]:=k;
    inc(l)
  end;
  dispose(mat);
end;

procedure TTest.Test_Inv(Dim:integer);
var i,j,k,l:integer;
begin
  Randomize;
  New(Mat);
  l:=0;
  SetLength(Form2.Xres,Dim);
  SetLength(Form2.Yres,Dim);
  for i:=2 to Dim do begin
    Mat.SetMatrix(i,i);
    for j:=0 to i-1 do
      for k:=0 to i-1 do
        Mat^[j,k]:=Random(100);
    t1:=Time;
    Mat.Inverse(Mat);
    t2:=Time;
    DecodeTime(t2-t1,hour,min,sec,msec);
    k:=msec+sec*1000+min*60000+hour*3600000;
    form2.Xres[l]:=i;
    form2.Yres[l]:=k;
    inc(l)
  end;
  dispose(mat)
end;

end.
