unit ObjavlenieHistoryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, SqlExpr, Grids, DBGridEh, DBClient, Provider,
  sdelkaPubl, StdCtrls, Buttons, ExtCtrls, globals, GridsEh;

type
  TfrmObjavlenieHistory = class(TForm)
    grPodacha: TDBGridEh;
    qrySdelkaPodacha: TSQLQuery;
    sdelkaPubl: TfrmSdelkaPubl;
    prvSdelkaPodacha: TDataSetProvider;
    cdsSdelkaPodacha: TClientDataSet;
    cdsSdelkaPodachaGZ_ID: TSmallintField;
    cdsSdelkaPodachaIS_ID: TIntegerField;
    cdsSdelkaPodachaAG_ID: TIntegerField;
    cdsSdelkaPodachaSD_ID: TIntegerField;
    cdsSdelkaPodachaPD_FREE_OF_CHARGE: TSmallintField;
    cdsSdelkaPodachaPD_ID: TIntegerField;
    cdsSdelkaPodachaPD_ADDDATE: TSQLTimeStampField;
    cdsSdelkaPodachaPD_IS_DONE: TSmallintField;
    dsSdelkaPodacha: TDataSource;
    qrySdelkaPodachaGZ_ID: TSmallintField;
    qrySdelkaPodachaIS_ID: TIntegerField;
    qrySdelkaPodachaAG_ID: TIntegerField;
    qrySdelkaPodachaSD_ID: TIntegerField;
    qrySdelkaPodachaPD_FREE_OF_CHARGE: TSmallintField;
    qrySdelkaPodachaPD_ID: TIntegerField;
    qrySdelkaPodachaPD_ADDDATE: TSQLTimeStampField;
    qrySdelkaPodachaPD_IS_DONE: TSmallintField;
    qrySdelkaPodachaIS_NAME: TStringField;
    qrySdelkaPodachaIS_NAME_COMPOSED: TStringField;
    qrySdelkaPodachaIS_DATE: TSQLTimeStampField;
    cdsSdelkaPodachaIS_NAME: TStringField;
    cdsSdelkaPodachaIS_NAME_COMPOSED: TStringField;
    cdsSdelkaPodachaIS_DATE: TSQLTimeStampField;
    Shape1: TShape;
    Label1: TLabel;
    Shape2: TShape;
    btCancel: TBitBtn;
    procedure cdsSdelkaPodachaAfterScroll(DataSet: TDataSet);
  private
	AgentId:  integer;
	SdelkaId: integer;
	GazetaId: integer;
    FldCust:  TIntegerField;
    User:     TUser;
  public
	procedure SetSdelka(agid, sdid, gzid: integer; fldCust: TIntegerField; usr: TUser);

	class procedure View(agid, sdid, gzid: integer; fldCust: TIntegerField; usr: TUser);
  end;

implementation

uses dm;

{$R *.dfm}

procedure TfrmObjavlenieHistory.cdsSdelkaPodachaAfterScroll(DataSet: TDataSet);
begin
	sdelkaPubl.SetSdelka(AgentId,
						 SdelkaId,
						 -1,
						 GazetaId,
						 FldCust,
						 User,
						 cdsSdelkaPodachaPD_ID.AsInteger);
end;

procedure TfrmObjavlenieHistory.SetSdelka(agid, sdid, gzid: integer; fldCust: TIntegerField; usr: TUser);
begin
	AgentId       := agid;
	SdelkaId      := sdid;
	GazetaId	  := gzid;
	self.FldCust  := fldCust;
	User		  := usr;

	if (cdsSdelkaPodacha.Active) then
		cdsSdelkaPodacha.Close;

	cdsSdelkaPodacha.Params.ParamByName('AG_ID').AsInteger := AgentId;
	cdsSdelkaPodacha.Params.ParamByName('SD_ID').AsInteger := SdelkaId;
	cdsSdelkaPodacha.Open;

	Caption := 'История объявлений сделки №' + IntToStr(AgentId) + '-' + IntToStr(SdelkaId);
end;

class procedure TfrmObjavlenieHistory.View(agid, sdid, gzid: integer; fldCust: TIntegerField; usr: TUser);
var
	frm: TfrmObjavlenieHistory;
begin
	frm := nil;

    try
    	frm := TfrmObjavlenieHistory.Create(nil);

      with frm do
      begin
			    frm.SetSdelka(agid, sdid, gzid, fldCust, user);

			    ShowModal();
    	end;
    finally
    	if (Assigned(frm)) then frm.Free;
    end;
end;

end.
