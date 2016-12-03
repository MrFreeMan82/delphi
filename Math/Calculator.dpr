program Calculator;

uses
  Forms,
  ABOUT in 'ABOUT.pas' {AboutBox},
  Main in 'Main.pas' {Form1},
  VersionInfo in 'VersionInfo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
