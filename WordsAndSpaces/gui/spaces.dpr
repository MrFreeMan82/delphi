program spaces;

uses
  Forms,
  uMain in 'uMain.pas' {frmSpaces};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSpaces, frmSpaces);
  Application.Run;
end.
