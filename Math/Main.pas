unit Main;

interface

uses
  Windows,ShellAPI, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ActnList, StdCtrls, ExtCtrls,ComCtrls, ToolWin,
  ImgList, Menus,Dialogs, AppEvnts, ShellAnimations;


type
  TForm1 = class(TForm)
    Input: TMemo;
    ActionList1: TActionList;
    Run: TAction;
    Exit: TAction;
    Splitter1: TSplitter;
    OutPut: TMemo;
    Draw: TAction;
    MainMenu1: TMainMenu;
    A1: TMenuItem;
    N1: TMenuItem;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Open: TAction;
    Save: TAction;
    OpenD: TOpenDialog;
    SaveD: TSaveDialog;
    FontD: TFontDialog;
    ToolButton7: TToolButton;
    FontCh: TAction;
    Save1: TMenuItem;
    Open1: TMenuItem;
    Exit1: TMenuItem;
    N2: TMenuItem;
    Graph1: TMenuItem;
    FontCh1: TMenuItem;
    TrayIcon1: TTrayIcon;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    ToolButton8: TToolButton;
    N4: TMenuItem;
    N5: TMenuItem;
    About: TAction;
    BalloonHint1: TBalloonHint;
    ShellResources1: TShellResources;
    procedure RunExecute(Sender: TObject);
    procedure DrawExecute(Sender: TObject);
    procedure ExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SaveExecute(Sender: TObject);
    procedure OpenExecute(Sender: TObject);
    procedure FontChExecute(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure AboutExecute(Sender: TObject);
  private
    procedure ControlWindow(var Msg:TMessage); message WM_SYSCOMMAND;
    procedure DropFile(var Msg:TMessage);message WM_DROPFILES;
    procedure WorkDone(var Msg:TMessage);message WM_USER;
  public
    { Public declarations }
end;

type
  TNumberView=(DecFrac,Frac);
  TComplexView=(Algeb,Trig,Exponent);
type
  PFormat=^TFormat;
  TFormat=record
     settings:TFormatSettings;
     NumberView:TNumberview;
     ComplexView:TComplexView;
end;

const ConfFile:string='conf.cfg';

var
  Form1: TForm1;
  sett:PFormat;

implementation
uses About;

{$R *.dfm}

function Calculate(const MainForm:Cardinal;const input:PAnsiChar;const sett:PFormat):PansiChar;stdcall;external 'Mathematica.dll';
procedure Draw(const MainForm:Cardinal;const func:PAnsiChar;const sett:Pformat);stdcall;external 'Mathematica.dll';
procedure RestoreWindow;external 'Mathematica.dll';

procedure TForm1.DropFile(var Msg:TMessage);
var FileName:array [0..255] of Char;
    count:integer;
begin
   count:=DragQueryFile(Msg.WParam,$FFFFFFFF,FileName,sizeof(FileName));
   if count=1 then
   begin
     DragQueryFile(Msg.WParam,count-1,FileName,sizeof(FileName));
     Input.Lines.LoadFromFile(FileName);
   end;
end;

procedure Tform1.WorkDone(var Msg:TMessage);
begin
  if (Msg.Msg=WM_USER) and (TrayIcon1.Visible) then
  begin
    TrayIcon1.BalloonTitle:='Калькулятор';
    TrayIcon1.BalloonFlags:=bfInfo;
    TrayIcon1.BalloonHint:='Вычисления завершены.';
    TrayIcon1.ShowBalloonHint;
  end else inherited
end;

procedure TForm1.ControlWindow(var Msg:TMessage);
begin
  if Msg.WParam=SC_MINIMIZE then
  begin
    TrayIcon1.Hint:=self.Caption;
    TrayIcon1.Icon:=Application.Icon;
    TrayIcon1.Visible:=true;
    hide;
  end else inherited
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  TrayIcon1.Visible:=false;
  Show;
  RestoreWindow;
end;

procedure TForm1.AboutExecute(Sender: TObject);
begin
  AboutBox.Show;
end;

procedure TForm1.DrawExecute(Sender: TObject);
var func:AnsiString;
begin
  func:= AnsiString(Input.Text);
  Main.Draw(Form1.Handle,PAnsiChar(func),sett);
end;

procedure TForm1.ExitExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.FontChExecute(Sender: TObject);
begin
   if FontD.Execute(self.Handle) then begin
      Input.Font:=FontD.Font;
      OutPut.Font:=FontD.Font
   end
end;


procedure TForm1.FormCreate(Sender: TObject);
var Conf:TFileStream;
begin
  DragAcceptFiles(Form1.Handle,true);
  New(sett);
  if FileExists(ConfFile)then begin
       Conf:=TFileStream.Create(ConfFile,fmOpenRead);
       Conf.ReadBuffer(sett^,sizeof(TFormat));
       Conf.Free;
  end else begin
       sett.settings.DecimalSeparator:='.';
       sett.settings.CurrencyDecimals:=4;
       sett.NumberView:=Frac;
       Conf:=TFileStream.Create(ConfFile,fmCreate);
       Conf.WriteBuffer(sett^,sizeof(TFormat));
       Conf.Free;
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
var Conf:TFileStream;
begin
  DragAcceptFiles(Form1.Handle,false);
  sett.settings.DecimalSeparator:='.';
  sett.settings.CurrencyDecimals:=3;
  sett.NumberView:=DecFrac;
  sett.ComplexView:=Algeb;
  Conf:=TFileStream.Create(ConfFile,fmCreate);
  Conf.WriteBuffer(sett^,sizeof(TFormat));
  Conf.Free;
  dispose(sett);
end;

procedure TForm1.OpenExecute(Sender: TObject);
begin
  if OpenD.Execute(self.Handle) then
    Input.Lines.LoadFromFile(OpenD.FileName)
end;

procedure TForm1.RunExecute(Sender: TObject);
var s:AnsiString;
begin
   OutPut.Lines.Clear;
   s:= AnsiString(Input.Text);
   try
      OutPut.Text:=string(Calculate(Form1.Handle,PAnsiChar(s),sett));
   except
    on e:Exception do MessageDlg(e.Message,mtInformation,[mbOk],0)
   end;
end;

procedure TForm1.SaveExecute(Sender: TObject);
begin
 if SaveD.Execute(self.Handle) then
    Input.Lines.SaveToFile(SaveD.FileName)
end;

end.

