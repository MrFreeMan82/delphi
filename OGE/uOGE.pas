unit uOGE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ComCtrls, StdCtrls, ExtCtrls, ExtDlgs, Grids,
  ToolWin, Buttons, uAdmin, PlatformDefaultStyleActnCtrls, ActnList, ActnMan,
  AppEvnts, uTests, uTheme;

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
    procedure WebBrowser1DocumentComplete(ASender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
  private
    { Private declarations }
    path: string;
    frmAdmin: TfrmAdmin;
    frmTests: TfrmTests;
    frmTheme: TfrmTheme;
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
     exit;
   { if not Assigned(frmAdmin) then
    begin
        frmAdmin := TfrmAdmin.Create(self);
        frmAdmin.Dock(tabAdmin, tabAdmin.ClientRect);
        frmAdmin.ShowAdmin;
        tabAdmin.TabVisible := true;
        self.Caption := 'Администратор';
    end; }
end;

procedure TfrmOGE.FormCreate(Sender: TObject);
begin
    path := ExtractFilePath(Application.ExeName);
    WebBrowser1.Navigate(path + 'html/1.html');
    pgPages.ActivePage := tabInfo;

    if not Assigned(frmTests) then frmTests := TfrmTests.Create(self);
    frmTests.Dock(tabTests, tabTests.ClientRect);
    frmTests.ShowTests();

    if not Assigned(frmTheme) then frmTheme := TfrmTheme.Create(self);
    frmTheme.Dock(tabThemes, tabThemes.ClientRect);
    frmTheme.showThemes();
end;

procedure TfrmOGE.FormDestroy(Sender: TObject);
begin
    freeAndNil(frmAdmin);
    freeAndNil(frmTests);
    freeAndNil(frmTheme);
end;

procedure TfrmOGE.WebBrowser1DocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  //  while WebBrowser1.ReadyState <> 4 do Application.ProcessMessages;
  //  WebBrowser1.OleObject.Document.bgColor := '#E0FFFF';
end;

end.
