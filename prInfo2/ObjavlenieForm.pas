unit ObjavlenieForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjavlenieFrame, StdCtrls, Buttons, ExtCtrls;

type
  TfrmObjavlenie = class(TForm)
    frameObjavlenie: TframeObjavlenie;
    Panel1: TPanel;
    btDone: TBitBtn;
    btCancelAg: TBitBtn;
    procedure btDoneClick(Sender: TObject);
    procedure btCancelAgClick(Sender: TObject);
    procedure frameContentbtSaveClick(Sender: TObject);
    procedure frameObjavleniebtMdlTextClick(Sender: TObject);
  private
    { Private declarations }
  public
	class procedure View(AObjavId: integer; AGazetaId: integer; isInCurrIssue: boolean);
	class procedure Edit(AObjavId: integer; AGazetaId: integer; isInCurrIssue: boolean);
	class function Add(APodachaId: integer; AGazetaId: integer; isInCurrIssue: boolean):integer;
  end;

var
  frmObjavlenie: TfrmObjavlenie;

implementation

uses dm, uInfoForInternet, db;

{$R *.dfm}

procedure TfrmObjavlenie.btDoneClick(Sender: TObject);
begin
try
	frameObjavlenie.Save();
except
end
end;

procedure TfrmObjavlenie.btCancelAgClick(Sender: TObject);
begin
	frameObjavlenie.Cancel();
end;

class procedure TfrmObjavlenie.Edit(AObjavId: integer; AGazetaId: integer; isInCurrIssue: boolean);
var
	frm: TfrmObjavlenie;
begin
	frm := nil;

	try
		frm := TfrmObjavlenie.Create(nil);

		frm.frameObjavlenie.GazetaId := AGazetaId;
		frm.frameObjavlenie.ObjavId := AObjavId;
		frm.frameObjavlenie.IsInCurrentIssue := isInCurrIssue;
		frm.frameObjavlenie.Edit();

		frm.ShowModal();
	finally
		if (Assigned(frm)) then
			frm.Free;
	end;
end;

class procedure TfrmObjavlenie.View(AObjavId: integer; AGazetaId: integer; isInCurrIssue: boolean);
var
	frm: TfrmObjavlenie;
begin
	frm := nil;

    try
    	frm := TfrmObjavlenie.Create(nil);

		frm.frameObjavlenie.GazetaId := AGazetaId;
		frm.frameObjavlenie.ObjavId := AObjavId;
		frm.frameObjavlenie.IsInCurrentIssue := isInCurrIssue;
    frm.frameObjavlenie.frameContent.Refresh;
    frm.frameObjavlenie.frameContent.cdsContent.Edit;
        frm.frameObjavlenie.Refresh();
        frm.frameObjavlenie.ReadOnly := true;

        frm.ShowModal();
    finally
    	if (Assigned(frm)) then
        	frm.Free;
    end;
end;

class function TfrmObjavlenie.Add(APodachaId: integer; AGazetaId: integer; isInCurrIssue: boolean):integer;
var
	frm: TfrmObjavlenie;
begin
	frm := nil;

	try
		frm := TfrmObjavlenie.Create(nil);

		frm.frameObjavlenie.GazetaId := AGazetaId;
		frm.frameObjavlenie.IsInCurrentIssue := isInCurrIssue;

		frm.frameObjavlenie.Add(APodachaId);

		Result := frm.frameObjavlenie.ObjavId;

        if (frm.ShowModal() <> mrOk) then
        	Result := 0;
    finally
    	if (Assigned(frm)) then
        	frm.Free;
    end;
end;

procedure TfrmObjavlenie.frameContentbtSaveClick(Sender: TObject);
begin
  frameObjavlenie.frameContentbtSaveClick(Sender);

end;

procedure TfrmObjavlenie.frameObjavleniebtMdlTextClick(Sender: TObject);
begin
  frameObjavlenie.btMdlTextClick(Sender);

end;

end.
