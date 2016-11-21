unit uOGE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ComCtrls, StdCtrls, ExtCtrls, ExtDlgs, Grids,
  ToolWin, Buttons, uAdmin, PlatformDefaultStyleActnCtrls, ActnList, ActnMan,
  AppEvnts, uTests;

type
  TfrmOGE = class(TForm)
    pgPages: TPageControl;
    tabInfo: TTabSheet;
    WebBrowser1: TWebBrowser;
    tabAlgebra: TTabSheet;
    RadioGroup1: TRadioGroup;
    tabAdmin: TTabSheet;
    Panel2: TPanel;
    ActionList: TActionList;
    Action1: TAction;
    tabThemes: TTabSheet;
    tabTests: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    txtAnswer: TEdit;
    btAnswear: TButton;
    Button2: TButton;
    btBack: TButton;
    btNext: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    path: string;
    frmAdmin: TfrmAdmin;
    frmTests: TfrmTests;
  public
    { Public declarations }
  end;

var
  frmOGE: TfrmOGE;

implementation
uses SQLiteTable3;
{$R *.dfm}

procedure TfrmOGE.Action1Execute(Sender: TObject);
begin
    if not Assigned(frmAdmin) then
    begin
        frmAdmin := TfrmAdmin.Create(self);
        frmAdmin.Dock(tabAdmin, tabAdmin.ClientRect);
        frmAdmin.ShowAdmin;
        tabAdmin.TabVisible := true;
        self.Caption := 'Администратор';
    end;
end;

procedure TfrmOGE.FormCreate(Sender: TObject);
begin
    path := ExtractFilePath(Application.ExeName);
    WebBrowser1.Navigate(path + 'html/1.html');
    pgPages.ActivePage := tabInfo;
    if not Assigned(frmTests) then frmTests := TfrmTests.Create(self);
    frmTests.Dock(tabTests, tabTests.ClientRect);
    frmTests.ShowTests();

end;

procedure TfrmOGE.FormDestroy(Sender: TObject);
begin
    freeAndNil(frmAdmin);
    freeAndNil(frmTests);
end;

end.
