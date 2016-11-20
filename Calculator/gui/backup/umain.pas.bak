unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, process, FileUtil, Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, uformula;

type

  { TForm1 }

  TForm1 = class(TForm)
    Memo1: TMemo;
    procces: TProcess;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure FormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    { private declarations }
    x,y: integer;
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormClick(Sender: TObject);
var p: TPoint;
begin
     p.x := x;
     p.y := y;
     locateChainAtPos(p);
     repaint
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    setCanvas(self.Canvas);
end;

procedure TForm1.FormDblClick(Sender: TObject);
var p: TPoint;
begin
      p.x := x;
      p.y := y;

      createNewChain(p);
      repaint;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: char);
begin
    AppendFormula(key);
    repaint;
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
      self.x := x;
      self.y := y;
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
      if (x = 0) and (y = 0) then exit;
      DrawFormula();
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
var s: TStringList;
begin
     s := TStringList.Create;
     s.Delimiter := ';';
     s.CommaText := ConverttoString();
     s.SaveToFile('input.txt');

     procces.Active := true;
     memo1.Lines.LoadFromFile('output.txt');
end;

end.

