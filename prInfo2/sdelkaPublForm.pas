unit sdelkaPublForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sdelka, sdelkaPubl, dm, StdCtrls, Buttons, ExtCtrls, DB,
  DBClient, SimpleDS, DBCtrls, globals;

type
  TfrmSdelkaPublForm = class(TForm)
    sdelkaObjavs: TfrmSdelkaPubl;
	pnlButtons: TPanel;
	btCancelAg: TBitBtn;
	btDone: TBitBtn;
	qrySdelkaComment: TSimpleDataSet;
	qrySdelkaCommentSD_COMMENT: TStringField;
	Panel1: TPanel;
	DBMemo1: TDBMemo;
	dsSdelkaComment: TDataSource;
	Label1: TLabel;
	Shape7: TShape;
	procedure FormKeyPress(Sender: TObject; var Key: Char);
	procedure FormShow(Sender: TObject);
	procedure btDoneClick(Sender: TObject);
	procedure btCancelAgClick(Sender: TObject);
    procedure sdelkaObjavsbtViewClick(Sender: TObject);
    procedure sdelkaObjavsbtEditClick(Sender: TObject);
  private
//    function editObjav(agid, sdid, objid: integer;
//      fldCustId: TIntegerField; user: TUser): boolean;
	{ Private declarations }
  public
  	class function Edit(sd_num:string; agid, sdid, objid, gzid: integer; fldCustId: TIntegerField; user: TUser): boolean;
  end;

implementation

uses main;

{$R *.dfm}

procedure TfrmSdelkaPublForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if (Key=#27) then
		Close;
end;

procedure TfrmSdelkaPublForm.FormShow(Sender: TObject);
begin
    sdelkaObjavs.grObjavs.SetFocus;
end;

procedure TfrmSdelkaPublForm.btDoneClick(Sender: TObject);
begin
    sdelkaObjavs.doCheckApplied:=true;
    sdelkaObjavs.cdsObjav.CheckBrowseMode;
    sdelkaObjavs.cdsObjav.ApplyUpdates(0);
    sdelkaObjavs.doCheckApplied:=false;
end;

procedure TfrmSdelkaPublForm.btCancelAgClick(Sender: TObject);
begin
    sdelkaObjavs.cdsObjav.CheckBrowseMode;
    sdelkaObjavs.cdsObjav.CancelUpdates;
end;

class function TfrmSdelkaPublForm.Edit(sd_num:string; agid, sdid, objid, gzid: integer;
  fldCustId: TIntegerField; user: TUser): boolean;
var
	frm: TfrmSdelkaPublForm;
begin
	frm := nil;

    try
    	frm := TfrmSdelkaPublForm.Create(nil);

        with frm do
        begin
			Caption := 'Объявления сделки №' + sd_num;//IntToStr(agid) + '-' + IntToStr(sdid);
			sdelkaObjavs.SetSdelka(agid, sdid, objid, gzid, fldCustId, user);
			qrySdelkaComment.DataSet.Params.ParamByName('AG_ID').AsInteger := agid;
			qrySdelkaComment.DataSet.Params.ParamByName('SD_ID').AsInteger := sdid;
			if (qrySdelkaComment.Active) then
				qrySdelkaComment.Close;
			qrySdelkaComment.Open;

			Result := true;

			ShowModal();
    	end;
    finally
    	if (Assigned(frm)) then
        	frm.Free;
    end;
end;

procedure TfrmSdelkaPublForm.sdelkaObjavsbtViewClick(Sender: TObject);
begin
  sdelkaObjavs.btViewClick(Sender);

end;

procedure TfrmSdelkaPublForm.sdelkaObjavsbtEditClick(Sender: TObject);
begin
  sdelkaObjavs.btEditClick(Sender);

end;

end.
