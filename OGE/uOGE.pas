unit uOGE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ComCtrls, StdCtrls, ExtCtrls, ExtDlgs, Grids,
  ToolWin, Buttons, uAdmin, PlatformDefaultStyleActnCtrls, ActnList, ActnMan,
  AppEvnts, uTests, uTheme, uData;

type
  TfrmOGE = class(TForm)
    pgPages: TPageControl;
    tabInfo: TTabSheet;
    tabAdmin: TTabSheet;
    ActionList: TActionList;
    Action1: TAction;
    tabThemes: TTabSheet;
    tabTests: TTabSheet;
    WebBrowser1: TWebBrowser;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure WebBrowser1DocumentComplete(ASender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
  private
    { Private declarations }
    frmAdmin: TfrmAdmin;
    frmTests: TfrmTests;
    frmTheme: TfrmTheme;
    path: string;
  public
    { Public declarations }
  end;

var
  frmOGE: TfrmOGE;

implementation

{$R *.dfm}

procedure TfrmOGE.FormCreate(Sender: TObject);
begin
    Path := dm.exePath();
    WebBrowser1.Navigate(path + '1.html');
    WebBrowser1.OleObject.Document.bgColor := '#E0FFFF';
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
    while WebBrowser1.ReadyState <> 4 do Application.ProcessMessages;
    WebBrowser1.OleObject.Document.bgColor := '#E0FFFF';
end;

end.
