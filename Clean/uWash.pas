unit uWash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, uOperator, uLogin, uSelectUser, uData, ComCtrls, db, AppEvnts;

type
  TfrmMain = class(TForm)
    pgView: TPageControl;
    tabOperator: TTabSheet;
    tabDirector: TTabSheet;
    tabAdmin: TTabSheet;
    tabReports: TTabSheet;
    StatusBar1: TStatusBar;
    ApplicationEvents: TApplicationEvents;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
  private
    { Private declarations }

    frmOperator: TfrmOperator;
    frmLogin: TfrmLogin;
    frmSelectUser: TfrmSelectUser;
    function getUserInfo(name: string): TField;
    function getOperatorInfo(name: string): TField;
  public
    { Public declarations }
    property UserInfo[name:string]:TField read getUserInfo;
    property OperatorInfo[name:string]:TField read getOperatorInfo;
    function Login(exitOnCancel: boolean): TmodalResult;
    function SelectUser(exitOnCancel: boolean): TmodalResult;
    procedure LoadFormByUserType(ut_id: integer);
  end;

var
  frmMain: TfrmMain;

implementation

uses uAccessRightRule;

{$R *.dfm}

procedure TfrmMain.ApplicationEventsException(Sender: TObject; E: Exception);
begin
    ShowMessage(Sender.UnitName + ' ' + Sender.ClassName + #13#10 + E.Message)
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var dbName: string;
begin

     dbName := ParamStr(1);
     if not data.ConnectDB(dbName) then
     begin
         messageBox(handle, PWideChar('������ ����������� � ���� ' +
                                        dbName), '������', MB_OK or MB_ICONERROR);
         Application.Terminate;
         exit;
     end;

     StatusBar1.Panels[0].Text := dbName;

     data.OpenDictionary;

     frmLogin := TfrmLogin.Create(self);
     Login(true);

     frmSelectUser := TfrmSelectUser.Create(self);
     SelectUser(true);

     SetWindowAccessState(UserInfo['UT_ID'].AsInteger, self);

     LoadFormByUserType(UserInfo['UT_ID'].AsInteger);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
     freeAndNil(frmLogin);
     freeAndNil(frmSelectUser);
     freeAndNil(frmOperator);
end;

function TfrmMain.getOperatorInfo(name: string): TField;
begin
    result := frmSelectUser.cdsOperator.FieldByName(name);
end;

function TfrmMain.getUserInfo(name: string): TField;
begin
    result := frmSelectUser.cdsUser.FieldByName(name);
end;

function TfrmMain.Login(exitOnCancel: boolean): TmodalResult;
begin
    frmLogin.txtUserPassword.Text := '';
    result := mrNone;

     while result <> mrOK do
     begin
        result := frmLogin.ShowModal;

        case result of
            mrCancel: if exitOnCancel then
                      begin
                          Application.Terminate;
                          abort;
                      end
                      else begin
                          break
                      end;
            mrNo:     messageBox(handle, '�������� �����/�����.', '������', MB_OK or MB_ICONERROR);
        end;
     end;

end;

function TfrmMain.SelectUser(exitOnCancel: boolean): TmodalResult;
begin
     result := mrNone;

     while result <> mrOK do
     begin
        result := frmSelectUser.ShowModal;
        case result of
            mrCancel: if exitOnCancel then
                      begin
                          Application.Terminate;
                          abort;
                      end
                      else begin
                          break
                      end;
        end;
     end;
end;

procedure TfrmMain.LoadFormByUserType(ut_id: integer);
begin
     case ut_id of
        1: ;
        2: if not Assigned(frmOperator) then
        begin
           frmOperator := TfrmOperator.Create(self);
           frmOperator.Dock(tabOperator, tabOperator.ClientRect);
           self.Caption := frmOperator.Caption + ' ' +
           OperatorInfo['OP_NAME'].AsString;
           frmOperator.ShowOperatorWashList(OperatorInfo['OP_ID'].AsInteger);
        end;
     end;
end;

end.
