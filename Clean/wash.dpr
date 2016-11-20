// ��� ��������������� ��������� ����� �������������� � ��������� ����������
// midas.dll, fbclient.dll, dbxfb.dll
program wash;

uses
  Forms,
  Crtl,
  MidasLib,
  uWash in 'uWash.pas' {frmMain},
  uOperator in 'uOperator.pas' {frmOperator},
  uLogin in 'uLogin.pas' {frmLogin},
  uSelectUser in 'uSelectUser.pas' {frmSelectUser},
  uData in 'uData.pas' {data: TDataModule},
  uAccessRightRule in 'uAccessRightRule.pas',
  uGlobals in 'uGlobals.pas',
  uWashDetail in 'uWashDetail.pas' {frmWashDetail},
  uTest in 'uTest.pas' {frmTest},
  uNewOrganization in 'uNewOrganization.pas' {frmNewOrg},
  uNewDriver in 'uNewDriver.pas' {frmNewDriver};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdata, data);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
