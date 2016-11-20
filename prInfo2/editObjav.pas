unit editObjav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, objava,
  sdelka, dm, globals, AppEvnts, FMTBcd, DBClient, Provider, SqlExpr;

type
  TfrmEditObjav = class(TForm)
	Timer1: TTimer;
    Panel1: TPanel;
    btIntObjav: TButton;
    btShowAudit: TSpeedButton;
    objava: TfrmObjava;
	procedure FormShow(Sender: TObject);
	procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
  public
	class function Edit(agid, sdid, obid, gzid: integer; user: TUser; isInCurrIssue: boolean):TModalResult;
	class function Add(agid, sdid, gzid: integer; user: TUser; isInCurrIssue: boolean):TModalResult;
	class function View(agid, sdid, obid, gzid: integer; user: TUser; isInCurrIssue: boolean):TModalResult;
  end;

implementation

uses main;

{$R *.dfm}

procedure TfrmEditObjav.FormShow(Sender: TObject);
begin
 	if (not objava.ReadOnly) then
  begin
    // Проверяем какой отдел работает
    if data.qryUsrUS_TYPE.Value = PRG_USR_KORRECTURA then objava.cbRubrika.SetFocus
    else begin
       objava.cbFormat.SetFocus;
    end;
  end;


end;

procedure TfrmEditObjav.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if (Key = #27) then
	begin
		objava.Cancel;
		Close;
	end;
end;


class function TfrmEditObjav.Add(agid, sdid, gzid: integer;
  user: TUser; isInCurrIssue: boolean): TModalResult;
var
	frm: TfrmEditObjav;
begin
	frm := nil;

	try
		frm := TfrmEditObjav.Create(nil);

		frm.objava.SetObjav(agid, sdid, 0, gzid, user, isInCurrIssue);
		frm.objava.cdsObjav.Append;

		Result := frm.ShowModal;

	finally
		if (Assigned(frm)) then frm.Free;
	end;

	// Если пользователь нажал "Ещё", то запускаем себя заново
	if (Result = mrRetry) then
		Result := TfrmEditObjav.Add(agid, sdid, gzid, user, isInCurrIssue);
end;

class function TfrmEditObjav.Edit(agid, sdid, obid, gzid: integer;
  user: TUser; isInCurrIssue: boolean): TModalResult;
var
	frm: TfrmEditObjav;
begin
	frm := nil;

	try
		frm := TfrmEditObjav.Create(nil);

		frm.objava.pnlAgent.Visible := true;
		frm.objava.btMore.Enabled := false;
		frm.objava.SetObjav(agid, sdid, obid, gzid, user, isInCurrIssue);

		Result := frm.ShowModal;
	finally
		if (Assigned(frm)) then frm.Free;
	end;
end;

class function TfrmEditObjav.View(agid, sdid, obid, gzid: integer;
  user: TUser; isInCurrIssue: boolean): TModalResult;
var
	frm: TfrmEditObjav;
begin
	frm := nil;

	try
		frm := TfrmEditObjav.Create(nil);
		frm.objava.SetObjav(agid, sdid, obid, gzid, user, isInCurrIssue);
    frm.objava.ReadOnly := true;

		Result := frm.ShowModal;
	finally
		if (Assigned(frm)) then frm.Free;
	end;
end;

end.
