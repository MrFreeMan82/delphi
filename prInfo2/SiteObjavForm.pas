unit SiteObjavForm;
   // UNIT DEPRECATED
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SiteObjavFrame, StdCtrls, Buttons;

type
  TfrmSiteObjav = class(TForm)
    frameSiteObjav: TframeSiteObjav;
    Panel1: TPanel;
    btDone: TBitBtn;
    btCancelAg: TBitBtn;
    procedure btDoneClick(Sender: TObject);
    procedure btCancelAgClick(Sender: TObject);
  private
    { Private declarations }
  public
	class procedure View(ASiteObjavId: integer);
	class procedure Edit(ASiteObjavId, AContentId: integer);
	class function Add(AContentId: integer):integer; overload;
  class function Add(ag_id,sd_id: integer):integer; overload;
  end;

var
  frmSiteObjav: TfrmSiteObjav;

implementation

{$R *.dfm}

procedure TfrmSiteObjav.btDoneClick(Sender: TObject);
begin
	frameSiteObjav.Save();
end;

procedure TfrmSiteObjav.btCancelAgClick(Sender: TObject);
begin
	frameSiteObjav.Cancel();
end;

class function TfrmSiteObjav.Add(AContentId: integer): integer;
var
	frm: TfrmSiteObjav;
begin
	frm := nil;

	try
		frm := TfrmSiteObjav.Create(nil);

		frm.frameSiteObjav.Add(AContentId);

		Result := frm.frameSiteObjav.SiteObjavId;

		if (frm.ShowModal() <> mrOk) then
			Result := 0;
	finally
		if (Assigned(frm)) then
			frm.Free;
	end;
end;

class procedure TfrmSiteObjav.Edit(ASiteObjavId, AContentId: integer);
var
	frm: TfrmSiteObjav;
begin
	frm := nil;

	try
		frm := TfrmSiteObjav.Create(nil);

		frm.frameSiteObjav.SiteObjavId := ASiteObjavId;
		frm.frameSiteObjav.ContentId := AContentId;
		frm.frameSiteObjav.Edit();

		frm.ShowModal();
	finally
		if (Assigned(frm)) then
			frm.Free;
	end;
end;

class procedure TfrmSiteObjav.View(ASiteObjavId: integer);
var
	frm: TfrmSiteObjav;
begin
	frm := nil;

	try
		frm := TfrmSiteObjav.Create(nil);

		frm.frameSiteObjav.SiteObjavId := ASiteObjavId;
		frm.frameSiteObjav.Refresh();
		frm.frameSiteObjav.ReadOnly := true;

		frm.ShowModal();
	finally
		if (Assigned(frm)) then
			frm.Free;
	end;
end;

class function TfrmSiteObjav.Add(ag_id, sd_id: integer): integer;
begin
    result := 0;
end;

end.
