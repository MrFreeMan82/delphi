unit uSiteObjav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, ComCtrls, DBLookupEh, StdCtrls, Mask, DBCtrlsEh,
  Buttons, ExtCtrls, GridsEh, FMTBcd, SqlExpr, Provider, DB, DBClient;

type
  TfrmSite_Objav = class(TForm)
    Panel41: TPanel;
    Shape60: TShape;
    btRefresh: TBitBtn;
    btEditSiteObjav: TBitBtn;
    btSearch: TBitBtn;
    pgObjav: TPageControl;
    Panel33: TPanel;
    Shape59: TShape;
    Label67: TLabel;
    Shape19: TShape;
    Label88: TLabel;
    DBEditEh1: TDBEditEh;
    cbGazetaModuliSite: TDBLookupComboboxEh;
    tabText: TTabSheet;
    tabmodule: TTabSheet;
    grModuliSiteObjavs: TDBGridEh;
    grSdelkaForNabor: TDBGridEh;
    dsContentSiteObjavs: TDataSource;
    cdsContentSiteObjavs: TClientDataSet;
    cdsContentSiteObjavsAG_ID: TIntegerField;
    cdsContentSiteObjavsSD_ID: TIntegerField;
    cdsContentSiteObjavsOB_ID: TIntegerField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    cdsContentSiteObjavsRB_ID: TIntegerField;
    cdsContentSiteObjavsFM_ID: TIntegerField;
    cdsContentSiteObjavsCONTENT_ID: TIntegerField;
    cdsContentSiteObjavsCU_ID: TIntegerField;
    cdsContentSiteObjavsGZ_ID: TSmallintField;
    cdsContentSiteObjavsCONTENT_SITE_OBJAV_ADDED: TSmallintField;
    cdsContentSiteObjavsSD_NUM: TStringField;
    cdsContentSiteObjavsob_comment: TStringField;
    cdsContentSiteObjavsCU_PHONES: TStringField;
    prvContentSiteObjavs: TDataSetProvider;
    qryContentSiteObjavs: TSQLQuery;
    qryContentSiteObjavsAG_ID: TIntegerField;
    qryContentSiteObjavsSD_ID: TIntegerField;
    qryContentSiteObjavsOB_ID: TIntegerField;
    qryContentSiteObjavsRB_ID: TIntegerField;
    qryContentSiteObjavsFM_ID: TIntegerField;
    qryContentSiteObjavsCONTENT_ID: TIntegerField;
    qryContentSiteObjavsAG_NAME: TStringField;
    qryContentSiteObjavsSD_ID_COMPOUND: TStringField;
    qryContentSiteObjavsRB_NAME_SHORT: TStringField;
    qryContentSiteObjavsFM_NAME: TStringField;
    qryContentSiteObjavsPODACHA_NUMS: TStringField;
    qryContentSiteObjavsCU_ID: TIntegerField;
    qryContentSiteObjavsGZ_ID: TSmallintField;
    qryContentSiteObjavsCONTENT_SITE_OBJAV_ADDED: TSmallintField;
    qryContentSiteObjavsSD_NUM: TStringField;
    qryContentSiteObjavsob_comment: TStringField;
    qryContentSiteObjavsCU_PHONES: TStringField;
    qObjavForSiteNabor: TSQLQuery;
    qObjavForSiteNaborAG_ID: TIntegerField;
    qObjavForSiteNaborSD_ID: TIntegerField;
    qObjavForSiteNaborOB_ID: TIntegerField;
    qObjavForSiteNaborOB_STATE: TSmallintField;
    qObjavForSiteNaborOB_COMMENT: TStringField;
    qObjavForSiteNaborAG_NAME: TStringField;
    qObjavForSiteNaborAG_IS_REMOTE: TSmallintField;
    qObjavForSiteNaborSD_ID_COMPOUND: TStringField;
    qObjavForSiteNaborRB_NAME_SHORT: TStringField;
    qObjavForSiteNaborFM_NAME: TStringField;
    qObjavForSiteNaborGZ_NAME_SHORT: TStringField;
    qObjavForSiteNaborPODACHA_NUMS: TStringField;
    qObjavForSiteNaborCU_ID: TIntegerField;
    qObjavForSiteNaborGZ_ID: TSmallintField;
    qObjavForSiteNaborRB_IS_LOCKABLE: TSmallintField;
    qObjavForSiteNaborSR_IS_CURRENT_ISSUE: TIntegerField;
    qObjavForSiteNaborSITE_OBJAV_ADDED: TSmallintField;
    qObjavForSiteNaborSD_NUM: TStringField;
    prvObjavForSiteNabor: TDataSetProvider;
    cdsObjavForSiteNabor: TClientDataSet;
    cdsObjavForSiteNaborAG_ID: TIntegerField;
    cdsObjavForSiteNaborSD_ID: TIntegerField;
    cdsObjavForSiteNaborOB_ID: TIntegerField;
    cdsObjavForSiteNaborOB_STATE: TSmallintField;
    cdsObjavForSiteNaborAG_NAME: TStringField;
    cdsObjavForSiteNaborOB_COMMENT: TStringField;
    cdsObjavForSiteNaborAG_IS_REMOTE: TSmallintField;
    cdsObjavForSiteNaborSD_ID_COMPOUND: TStringField;
    cdsObjavForSiteNaborRB_NAME_SHORT: TStringField;
    cdsObjavForSiteNaborFM_NAME: TStringField;
    cdsObjavForSiteNaborGZ_NAME_SHORT: TStringField;
    cdsObjavForSiteNaborPODACHA_NUMS: TStringField;
    cdsObjavForSiteNaborCU_ID: TIntegerField;
    cdsObjavForSiteNaborGZ_ID: TSmallintField;
    cdsObjavForSiteNaborRB_IS_LOCKABLE: TSmallintField;
    cdsObjavForSiteNaborSR_IS_CURRENT_ISSUE: TIntegerField;
    cdsObjavForSiteNaborSITE_OBJAV_ADDED: TSmallintField;
    cdsObjavForSiteNaborSD_NUM: TStringField;
    dsObjavForSiteNabor: TDataSource;
    procedure btRefreshClick(Sender: TObject);
    procedure btEditSiteObjavClick(Sender: TObject);
    procedure btSearchClick(Sender: TObject);
    procedure cbGazetaModuliSiteChange(Sender: TObject);
    procedure grModuliSiteObjavsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure grSdelkaForNaborDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure DBEditEh1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

implementation

uses dmPubl, findSdelka, globals, sdelkaPublForm;

{$R *.dfm}

procedure TfrmSite_Objav.btRefreshClick(Sender: TObject);
begin
  savePos(cdsContentSiteObjavs);
  cdsContentSiteObjavs.Close;
  cdsContentSiteObjavs.FetchParams;
	cdsContentSiteObjavs.Params.ParamByName('GZ_ID').AsInteger := cbGazetaModuliSite.KeyValue;
  cdsContentSiteObjavs.Open;
  loadPos(cdsContentSiteObjavs);

  savePos(cdsObjavForSiteNabor);
  cdsObjavForSiteNabor.Close;
  cdsObjavForSiteNabor.FetchParams;
  cdsObjavForSiteNabor.Params.ParamByName('gz_id').AsInteger := cbGazetaModuliSite.KeyValue;
  cdsObjavForSiteNabor.Open;
  LoadPos(cdsObjavForSiteNabor);
end;

procedure TfrmSite_Objav.btEditSiteObjavClick(Sender: TObject);
var r:integer;
begin
  if pgObjav.ActivePage = tabModule then
  begin
      r := grModuliSiteObjavs.DataSource.DataSet.RecNo;

    	TfrmSdelkaPublForm.Edit(cdsContentSiteObjavsSD_NUM.AsString,
                              cdsContentSiteObjavsAG_ID.Value,
		            						  cdsContentSiteObjavsSD_ID.Value,
								              cdsContentSiteObjavsOB_ID.Value,
								              cdsContentSiteObjavsGZ_ID.Value,
            								  cdsContentSiteObjavsCU_ID,
						            		  uNabor);
      grModuliSiteObjavs.DataSource.DataSet.Refresh;
      if (r - 1) > 0 then
          grModuliSiteObjavs.DataSource.DataSet.RecNo := r - 1;
  end
  else begin
     r := grSdelkaForNabor.DataSource.DataSet.RecNo;
     TfrmSdelkaPublForm.Edit( cdsObjavForSiteNaborSD_NUM.AsString,
                              cdsObjavForSiteNaborAG_ID.Value,
		            						  cdsObjavForSiteNaborSD_ID.Value,
								              cdsObjavForSiteNaborOB_ID.Value,
								              cdsObjavForSiteNaborGZ_ID.Value,
            								  cdsObjavForSiteNaborCU_ID,
						            		  uNabor);
     grSdelkaForNabor.DataSource.DataSet.Close;
     grSdelkaForNabor.DataSource.DataSet.Open;
     if (r - 1) > 0 then
         grSdelkaForNabor.DataSource.DataSet.RecNo := r - 1;
  end;
end;

procedure TfrmSite_Objav.btSearchClick(Sender: TObject);
begin
    frmFindSdelka.ShowModal(uNabor);
end;

procedure TfrmSite_Objav.cbGazetaModuliSiteChange(Sender: TObject);
begin
  cdsContentSiteObjavs.Close;
  cdsContentSiteObjavs.FetchParams;
  cdsContentSiteObjavs.Params.ParamByName('gz_id').AsInteger := cbGazetaModuliSite.KeyValue;
  cdsContentSiteObjavs.Open;

  cdsObjavForSiteNabor.Close;
  cdsObjavForSiteNabor.FetchParams;
  cdsObjavForSiteNabor.Params.ParamByName('gz_id').AsInteger := cbGazetaModuliSite.KeyValue;
  cdsObjavForSiteNabor.Open;
end;

procedure TfrmSite_Objav.grModuliSiteObjavsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
    if (cdsContentSiteObjavsCONTENT_SITE_OBJAV_ADDED.AsInteger = 1) then
    with  grModuliSiteObjavs.Canvas do
  	begin
		  Brush.Color := clGreen;
		  Font.Color  := clWhite;
		  FillRect(Rect);
		  TextOut(Rect.Left + 2,Rect.Top + 2, Column.Field.Text);
	  end;
end;

procedure TfrmSite_Objav.grSdelkaForNaborDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
    if (cdsObjavForSiteNaborSITE_OBJAV_ADDED.AsInteger = 1) then
    with  grSdelkaForNabor.Canvas do
  	begin
		  Brush.Color := clGreen;
		  Font.Color  := clWhite;
		  FillRect(Rect);
		  TextOut(Rect.Left + 2,Rect.Top + 2, Column.Field.Text);
	  end;
end;

procedure TfrmSite_Objav.DBEditEh1KeyPress(Sender: TObject; var Key: Char);
begin
	if (Key = #13) then
  begin
      if pgObjav.ActivePage = tabText then
      begin
         if dsObjavForSiteNabor.DataSet.Locate('SD_NUM', DBEditEh1.Text, []) then grSdelkaForNabor.SetFocus
      end
      else begin
         if dsContentSiteObjavs.DataSet.Locate('SD_NUM', DBEditEh1.Text, []) then grModuliSiteObjavs.SetFocus
      end;
  end;
end;

end.
