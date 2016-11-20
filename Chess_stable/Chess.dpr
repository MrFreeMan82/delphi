program Chess;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Core in 'Core.pas',
  ServerThread in 'ServerThread.pas',
  Messanger in 'Messanger.pas',
  uLogging in 'uLogging.pas',
  uAI in 'uAI.pas',
  ABOUT in 'ABOUT.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
