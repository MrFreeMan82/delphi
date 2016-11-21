unit uNewTask;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ToolWin, ComCtrls, ExtDlgs, Grids;

type
  TfrmNewTask = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    RadioGroup2: TRadioGroup;
    OpenPicture: TOpenPictureDialog;
    Panel1: TPanel;
    ToolBar2: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    mText: TMemo;
    DrawGrid1: TDrawGrid;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewTask: TfrmNewTask;

implementation

{$R *.dfm}

end.
