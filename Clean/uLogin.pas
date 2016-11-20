unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uData, FMTBcd, DB, SqlExpr;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    txtUserName: TEdit;
    txtUserPassword: TEdit;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    qLogin: TSQLQuery;
    qLoginU_ID: TIntegerField;
    procedure btOkClick(Sender: TObject);
  private
    { Private declarations }
    function Login(const UserName, UserPassword: string): boolean;
  public
    { Public declarations }

  end;

implementation

{$R *.dfm}

{ TfrmLogin }

procedure TfrmLogin.btOkClick(Sender: TObject);
begin
    ModalResult := mrNone;
    if Login(txtUserName.Text, txtUserPassword.Text)
    then ModalResult := mrOK
    else ModalResult := mrNo;
end;

function TfrmLogin.Login(const UserName, UserPassword: string): boolean;
begin
     qLogin.Close;
     qLogin.ParamByName('login').AsString := trim(UserName);
     qLogin.ParamByName('pass').AsString := trim(UserPassword);
     qLogin.Open;

     result := qLoginU_ID.AsInteger > 0;
end;

end.
