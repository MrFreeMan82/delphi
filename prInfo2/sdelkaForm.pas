unit sdelkaForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sdelka, DBGrids, Grids, dm, globals;

type
  TfrmSdelkaForm = class(TForm)
	sdelka: TfrmSdelka;
	procedure FormShow(Sender: TObject);
    procedure sdelkabtSaveClick(Sender: TObject);
    procedure sdelkabtChooseCustClick(Sender: TObject);
    procedure sdelkabtnHistoryClick(Sender: TObject);
  private
  public
	class function Edit(agid, sdid: integer; usr: TUser; highlightSdelka: TfrmSdelka):TModalResult;
	class function New(agid, sdtype: integer; gzid: integer = 0):TModalResult;
	class procedure View(agid, sdid: integer; usr: TUser);
  end;

implementation

uses notPayedSdelkas;

const agents: array[0..18] of integer = (4, 94, 22, 42, 34, 26, 304, 305, 306, 307, 308, 309, 35, 333, 481, 487, 489, 496, 501);

{$R *.dfm}

procedure TfrmSdelkaForm.FormShow(Sender: TObject);
begin
	sdelka.cbRequisite.SetFocus;
end;

procedure TfrmSdelkaForm.sdelkabtSaveClick(Sender: TObject);
begin
	sdelka.btSaveClick(Sender);

    ModalResult:=mrOk;
end;


class function TfrmSdelkaForm.Edit(agid, sdid: integer; usr: TUser;
  highlightSdelka: TfrmSdelka): TModalResult;
var
	frm: TfrmSdelkaForm;
begin
	frm := nil;
	try
		frm := TfrmSdelkaForm.Create(nil);

		frm.sdelka.setSdelka(agid,sdid,usr,false);
		if (highlightSdelka<>nil) then
			frm.sdelka.highlightChanges(highlightSdelka);

		Result := frm.ShowModal;
	finally
		if (Assigned(frm)) then
			frm.Free;
	end;
end;

function DetermineN1Agent(ag_id: integer): boolean;
var i: integer;
begin
     result := false;

     for i := 0 to 18 do
     begin
          if ag_id = agents[i] then
          begin
              result := true;
              break;
          end
     end
end;

class function TfrmSdelkaForm.New(agid, sdtype, gzid: integer): TModalResult;
var
	frm: TfrmSdelkaForm;
    sdid: integer;
begin
	frm := nil;
	try
		frm := TfrmSdelkaForm.Create(nil);

		frm.sdelka.setSdelka(agid, -1, uAgent, true);
		frm.sdelka.cdsSdelkaOne.Append();
		frm.sdelka.isNewSdelka := true;
		frm.sdelka.setSdelkaType(sdtype);
		sdid := frm.sdelka.cdsSdelkaOneSD_ID.AsInteger;
		frm.sdelka.cdsSdelkaOneAG_ID.AsInteger := agid;
		frm.sdelka.cdsSdelkaOneGZ_ID.AsInteger := gzid;

    if DetermineN1Agent(agid) then
        frm.sdelka.cdsSdelkaOneRQ_ID.AsInteger := 2;

		Result := frm.ShowModal;
		// Если пользователь не сохранил новую сделку - удалим её из БД
		if (Result <> mrOk) then
		begin
			frm.sdelka.qryDeleteSdelka.Params.ParamByName('AG_ID').AsInteger := agid;
			frm.sdelka.qryDeleteSdelka.Params.ParamByName('SD_ID').AsInteger := sdid;
			frm.sdelka.qryDeleteSdelka.ExecSQL();
		end;
	finally
		if (Assigned(frm)) then
			frm.Free();
	end;
end;


class procedure TfrmSdelkaForm.View(agid, sdid: integer; usr: TUser);
var
	frm: TfrmSdelkaForm;
begin
	frm := nil;
	try
		frm := TfrmSdelkaForm.Create(nil);
		frm.sdelka.setSdelka(agid, sdid, usr, true);
		frm.sdelka.ReadOnly := true;
		frm.ShowModal;
	finally
		if (Assigned(frm)) then
			frm.Free;
	end;
end;


procedure TfrmSdelkaForm.sdelkabtChooseCustClick(Sender: TObject);
begin
  sdelka.btChooseCustClick(Sender);

end;

procedure TfrmSdelkaForm.sdelkabtnHistoryClick(Sender: TObject);
begin
  sdelka.btnHistoryClick(Sender);

end;



end.
