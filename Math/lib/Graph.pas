{***************************************************************************}
{                                                                           }
{             Модуль:   Графики                                             }
{             Описание: Построение графиков                                 }
{             Автор:    Зверинцев Дмитрий                                   }
{                                                                           }
{***************************************************************************}

unit Graph;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, StdCtrls, Buttons, Series,
  Complex,Calculator, ToolWin, ExtDlgs, ImgList, ComCtrls;

type
  TForm2 = class(TForm)
    Chart1: TChart;
    Panel1: TPanel;
    Series1: TLineSeries;
    StatusBar1: TStatusBar;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    step: TEdit;
    Xmax_: TEdit;
    Xmin_: TEdit;
    Draw: TBitBtn;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    Button2: TButton;
    ComboBox1: TComboBox;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    SavePictureDialog: TSavePictureDialog;
    ImageList1: TImageList;
    procedure DrawClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
    procedure Chart1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Chart1DblClick(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure Xmax_KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Xmin_KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure stepKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton1Click(Sender: TObject);
  private
    Cur: LongInt;
    procedure SetCursor;
  protected
    procedure EndThreadWork(var Msg:TMessage);message WM_USER;
    procedure ControlWindow(var Msg:TMessage); message WM_SYSCOMMAND;
    procedure MouseWheel(var Msg:TMessage);message WM_MOUSEWHEEL;
  public
    Xres:array of double;
    Yres:array of double;
    sett:TFormat;
    NewTitle:TChartTitle;
    Calculator:TCalculator;
  end;

var
  Form2: TForm2;

implementation

uses Test,Math;

{$R *.dfm}
var NewThr:TTest;

procedure TForm2.SetCursor;
// Поиск координат и прорисовка курсоров графика
var XPos, YPos: LongInt;
    X,Y:TNumber;
    PenMode: TPenMode;
begin
 with Chart1 do begin
  PenMode := Canvas.Pen.Mode;
  Canvas.Pen.Color:=clBlack;
  Canvas.Pen.Mode := pmNot;
  XPos:=Series1.CalcXPos(cur);
  YPos:=Series1.CalcYPos(cur);
  Canvas.MoveTo(XPos,ChartRect.Bottom);
  Canvas.LineTo(XPos, ChartRect.Top);
  Canvas.MoveTo(ChartRect.Left, YPos);
  Canvas.LineTo(ChartRect.Right, YPos);
  Canvas.Pen.Mode := PenMode;
 end;
 Series1.Repaint;
 with StatusBar1 do begin
     X:=Series1.XValue[cur];
     Y:=Series1.YValue[cur];
     Panels[0].Text:='X= '+string(X.ToString(sett));
     Panels[1].Text:='Y= '+string(Y.ToString(sett));
 end
end;

procedure TForm2.Chart1AfterDraw(Sender: TObject);
begin
  if (Series1.Count>0) and (cur >= 0) then SetCursor;
end;

procedure TForm2.Chart1DblClick(Sender: TObject);
begin
  Chart1.UndoZoom;
end;

procedure TForm2.Chart1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var newcur:longint;
    back:boolean;
begin
  if Series1.Count>0 then begin
    newcur:=cur;
    case Key of
    VK_LEFT: begin dec(newcur);back:=true end;
   VK_RIGHT: begin inc(newcur);back:=false end;
    VK_HOME: begin newcur:=0;back:=true end;
     VK_END: begin newcur:=Series1.Count-1;back:=false end;
       else  exit;
    end;
    with Series1 do
      repeat
        if Back then
           while (newcur>=0) and (ValueColor[newcur]<>clRed) do dec(newcur)
        else
           while (newcur<=Count-1) and (ValueColor[newcur]<>clRed) do inc(newcur);
        if newcur<0 then begin
          newcur:=0;
          back:=false
        end else if newcur>Count-1 then begin
          newcur:=Count-1;
          back:=true
        end;
      until ValueColor[newcur]=clRed;
    SetCursor;
    cur:=newcur;
    SetCursor;
  end;
end;

procedure TForm2.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
var Xp,Yp:double;
begin
  if Series1.Cursor=crCross then
    with StatusBar1 do begin
       Series1.GetCursorValues(Xp,Yp);
       Panels[0].Text:='X= '+string(TNumber(Xp).ToString(sett));
       Panels[1].Text:='Y= '+string(TNumber(Yp).ToString(sett));
   end
end;

procedure TForm2.ControlWindow(var Msg:TMessage);
begin
      if Msg.WParam=SC_MINIMIZE then begin
         PostMessage(Calculator.MainFormHWND,WM_SYSCOMMAND,SC_MINIMIZE,0);
         Hide
      end else inherited
end;

procedure TForm2.EndThreadWork(var Msg: TMessage);
var i,k:integer;
begin
  if Msg.Msg=WM_USER then begin
     Series1.ColorEachPoint:=true;
     Series1.BeginUpdate;
     k:=high(Xres);
     for i:=0 to k do
       if not IsNan(Yres[i])then begin
          Series1.AddXY(Xres[i],Yres[i]);
          Series1.ValueColor[i]:=clRed;
       end else begin
          Series1.AddXY(Xres[i],0);
          Series1.ValueColor[i]:=clNone;
       end;
     Series1.EndUpdate;
     SetLength(xRes,0);
     SetLength(YRes,0);
     Screen.Cursor:=crDefault;
     Series1.Cursor:=crCross;
     cur:=0;
     PostMessage(Calculator.MainFormHWND,WM_USER,0,0);
  end else inherited
end;

procedure TForm2.MouseWheel(var Msg:TMessage);
begin
  if Msg.Msg=WM_MOUSEWHEEL then begin
     if Msg.WParam<0 then Chart1.ZoomPercent(110)
     else if Msg.LParam>0 then Chart1.ZoomPercent(90)
  end else inherited
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  if Chart1.Zoomed then Chart1.UndoZoom;
  Screen.Cursor:=crHourGlass;
  Series1.Clear;
  Chart1.Axes.Bottom.Title.Caption:='Размерность матрицы.';
  Chart1.Axes.Left.Title.Caption:=' Время (мс.)';
  case ComboBox1.ItemIndex of
    0: NewTitle.Caption:='Тест определителя.';
    1: NewTitle.Caption:='Тест обратной матрицы.';
  end;
  NewThr:=TTest.Create(true);
  NewThr.TestNum:=ComboBox1.ItemIndex;
  NewThr.FreeOnTerminate:=true;
  NewThr.Resume;
end;

procedure TForm2.DrawClick(Sender: TObject);
var curvar:string[10];x_value:integer;
begin
  if Chart1.Zoomed then Chart1.UndoZoom;
  Series1.Clear;
  curvar:=Ansistring(Form2.Edit1.Text);
  x_value:=Calculator.Get_Var_Addr(curvar);
  if x_value<>MaxInt then begin
    NewTitle.Caption:='График функции.';
    Chart1.Axes.Bottom.Title.Caption:=UpperCase(Edit1.Text);
    Chart1.Axes.Left.Title.Caption:='Y';
    NewThr:=Ttest.Create(true);
    with NewThr do begin
      Xmin:=StrToFloat(Xmin_.Text,sett.settings);
      Xmax:=StrToFloat(Xmax_.Text,sett.settings);
      points:=StrToInt(step.Text);
      TestNum:=100;
      x_addr:=x_value;
      x_name:=curvar;
      NewCalc:=Calculator;
      FreeOnTerminate:=true;
      Resume
    end;
  end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Series1.Clear;
  Series1.Cursor:=crDefault;
  cur:=-1;
  Calculator:=nil;
  self.ModalResult:=mrCancel;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
   cur:=-1;
   self.ModalResult:=mrNone;
   NewTitle:=Chart1.Title.Create;
end;

procedure TForm2.ToolButton1Click(Sender: TObject);
begin
  if SavePictureDialog.Execute(self.Handle) then
      Chart1.SaveToBitmapFile(SavePictureDialog.FileName);
end;

{$REGION}
procedure TForm2.stepKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
    if Key in [VK_LEFT,VK_RIGHT,VK_HOME,VK_END] then
      self.Chart1KeyDown(self,Key,Shift);
end;

procedure TForm2.Xmax_KeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
    if Key in [VK_LEFT,VK_RIGHT,VK_HOME,VK_END] then
      self.Chart1KeyDown(self,Key,Shift);
end;

procedure TForm2.Xmin_KeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
    if Key in [VK_LEFT,VK_RIGHT,VK_HOME,VK_END] then
      self.Chart1KeyDown(self,Key,Shift);
end;

procedure TForm2.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key in [VK_LEFT,VK_RIGHT,VK_HOME,VK_END] then
      self.Chart1KeyDown(self,Key,Shift);
end;
{$ENDREGION}
end.
