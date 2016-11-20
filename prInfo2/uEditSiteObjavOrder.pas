unit uEditSiteObjavOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DBGridEh, Mask, DBCtrlsEh, DBLookupEh, SqlExpr,
  Provider, DB, DBClient, StdCtrls, ComCtrls, DBCtrls, ExtCtrls, GridsEh,
  Buttons;

type
  TfrmEditSiteObjavOrder = class(TForm)
    pnlText: TPanel;
    Label5: TLabel;
    lblIsReadOnly: TLabel;
    dsObjav: TDataSource;
    cdsObjav: TClientDataSet;
    cdsObjavAG_ID: TIntegerField;
    cdsObjavSD_ID: TIntegerField;
    cdsObjavOB_ID: TIntegerField;
    cdsObjavOB_STATE: TSmallintField;
    cdsObjavOB_IS_ACTIVE: TSmallintField;
    cdsObjavFM_ID: TSmallintField;
    cdsObjavRB_ID: TIntegerField;
    cdsObjavRS_ID: TIntegerField;
    cdsObjavOB_TEXT: TStringField;
    cdsObjavOB_COMMENT: TStringField;
    cdsObjavOB_FOR_INTERNET: TSmallintField;
    cdsObjavCU_ID: TIntegerField;
    cdsObjavRB_NAME_SHORT: TStringField;
    cdsObjavRS_NAME_LK: TStringField;
    cdsObjavFM_NAME: TStringField;
    cdsObjavDISTRICT_NAME_LK: TStringField;
    cdsObjavOS_NAME: TStringField;
    cdsObjavOB_VAC_COUNT: TSmallintField;
    cdsObjavOB_HAS_ATTENTION: TSmallintField;
    cdsObjavDISTRICT_ID: TIntegerField;
    prvObjav: TDataSetProvider;
    qryObjav: TSQLQuery;
    qryObjavAG_ID: TIntegerField;
    qryObjavSD_ID: TIntegerField;
    qryObjavOB_ID: TIntegerField;
    qryObjavOB_STATE: TSmallintField;
    qryObjavOB_IS_ACTIVE: TSmallintField;
    qryObjavFM_ID: TSmallintField;
    qryObjavRB_ID: TIntegerField;
    qryObjavRS_ID: TIntegerField;
    qryObjavOB_TEXT: TStringField;
    qryObjavOB_COMMENT: TStringField;
    qryObjavOB_FOR_INTERNET: TSmallintField;
    qryObjavDISTRICT_ID: TIntegerField;
    qryObjavCU_ID: TIntegerField;
    qryObjavOB_VAC_COUNT: TSmallintField;
    qryObjavOB_HAS_ATTENTION: TSmallintField;
    Label1: TLabel;
    cbFormat: TDBLookupComboboxEh;
    Label2: TLabel;
    cbRubrika: TDBLookupComboboxEh;
    Panel4: TPanel;
    Panel3: TPanel;
    Shape2: TShape;
    Label4: TLabel;
    btAddSiteObjav: TBitBtn;
    btEditSiteObjav: TBitBtn;
    btDeleteSiteObjav: TBitBtn;
    DBGridEh1: TDBGridEh;
    Panel6: TPanel;
    Shape4: TShape;
    DBCheckBoxEh1: TDBCheckBoxEh;
    qrySiteObjavs: TSQLQuery;
    prvSiteObjavs: TDataSetProvider;
    cdsSiteObjavs: TClientDataSet;
    cdsSiteObjavsSITE_OBJAV_ID: TIntegerField;
    cdsSiteObjavsOB_ID: TIntegerField;
    cdsSiteObjavsRS_ID: TIntegerField;
    cdsSiteObjavsRS_NAME: TStringField;
    cdsSiteObjavsSITE_OBJAV_TEXT: TStringField;
    dsSiteObjavs: TDataSource;
    rchText: TDBRichEdit;
    cdsFormat: TClientDataSet;
    cdsFormatFM_ID: TIntegerField;
    cdsFormatFM_NAME: TStringField;
    cdsFormatFM_SPACE: TFloatField;
    cdsFormatFM_ALWAYS_ADD_SUM: TSmallintField;
    cdsFormatFM_HAS_PICTURE: TSmallintField;
    cdsFormatFM_PICTURE_SIZES: TStringField;
    dsFormat: TDataSource;
    dsRubrika: TDataSource;
    cdsRubrika: TClientDataSet;
    cdsRubrikaRB_ID: TIntegerField;
    cdsRubrikaRB_NAME: TStringField;
    cdsRubrikaRB_NAME_SHORT: TStringField;
    cdsRubrikaRB_COST_COEFF: TFloatField;
    cdsRubrikaRB_IS_OBLOGKA: TSmallintField;
    cdsRubrikaGZ_ID: TIntegerField;
    cdsRubrikaRB_IS_LOCKABLE: TSmallintField;
    Panel1: TPanel;
    btDone: TBitBtn;
    btCancelAg: TBitBtn;
    cdsSiteObjavsSITE_VACANCY_NAME: TStringField;
    qDelSiteObjav: TSQLQuery;
    cdsObjavSITE_OBJAV_ADDED: TSmallintField;
    qryObjavSITE_OBJAV_ADDED: TSmallintField;
    cdsSiteObjavsSITE_TEL: TStringField;
    cdsSiteObjavsSITE_EMPLOYER: TStringField;
    cdsSiteObjavsSITE_CONTACT: TStringField;
    cdsSiteObjavsSITE_EMAIL: TStringField;
    cdsObjavSITE_EMAIL: TStringField;
    cdsObjavSITE_EMPLOYER: TStringField;
    qryObjavSITE_EMAIL: TStringField;
    qryObjavSITE_EMPLOYER: TStringField;
    qGz: TSQLQuery;
    cdsSiteObjavsCU_ADDRESS: TStringField;
    procedure btAddSiteObjavClick(Sender: TObject);
    procedure btEditSiteObjavClick(Sender: TObject);
    procedure btDeleteSiteObjavClick(Sender: TObject);
    procedure rchTextChange(Sender: TObject);
    procedure prvSiteObjavsGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure btDoneClick(Sender: TObject);
    procedure btCancelAgClick(Sender: TObject);
  private
    { Private declarations }
    fgzid:integer;
  public
    { Public declarations }
    procedure RefreshOrder();
    class function ShowSiteObjavOrder(ag_id,sd_id,ob_id, gz_id:integer): TModalResult;
  end;

implementation

uses dmCache, uEditSiteObjav, dm, main, globals;

{$R *.dfm}

procedure TfrmEditSiteObjavOrder.btAddSiteObjavClick(Sender: TObject);
var Point:TPoint;
    Objav:TObjav;
begin
    Point.X := 0;
    Point.Y := 0;
    Objav.ob_text := cdsObjavOB_TEXT.Text;
    Objav.ob_employer := cdsSiteObjavsSITE_EMPLOYER.AsString;
    if Objav.ob_employer = '' then  Objav.ob_employer := cdsObjavSITE_EMPLOYER.AsString;

    Objav.ob_tel := cdsSiteObjavsSITE_TEL.AsString;
    Objav.ob_email := cdsSiteObjavsSITE_EMAIL.AsString;
    if Objav.ob_email = '' then Objav.ob_email := cdsObjavSITE_EMAIL.AsString;

    Objav.ob_contact := cdsSiteObjavsSITE_CONTACT.AsString;
    objav.ob_address := cdsSiteObjavsCU_ADDRESS.AsString;
    TfrmEditSiteObjav.AddSiteObjav(Point, cdsObjavOB_ID.AsInteger, fgzid, 0, Objav, RefreshOrder)
end;

procedure TfrmEditSiteObjavOrder.btEditSiteObjavClick(Sender: TObject);
var Point: TPoint;
begin
    Point.X := 0;
    Point.Y := 0;

    TfrmEditSiteObjav.EditSiteObjav(Point, cdsSiteObjavsSITE_OBJAV_ID.AsInteger, fgzid, 0, RefreshOrder);
end;

procedure TfrmEditSiteObjavOrder.btDeleteSiteObjavClick(Sender: TObject);
begin
      if not cdsSiteObjavs.isEmpty then
      begin
            qDelSiteObjav.ParamByName('id').AsInteger := cdsSiteObjavsSITE_OBJAV_ID.AsInteger;
            qDelSiteObjav.ParamByName('is_module').AsInteger := 0;
            qDelSiteObjav.ParamByName('OB_ID').AsInteger :=  cdsSiteObjavsOB_ID.AsInteger;
            qDelSiteObjav.ExecSQL();

            cdsSiteObjavs.Delete;
      end
end;

class function TfrmEditSiteObjavOrder.ShowSiteObjavOrder(ag_id,sd_id,ob_id, gz_id:integer):TModalResult;
var
  frmEditSiteObjavOrder: TfrmEditSiteObjavOrder;
begin
   frmEditSiteObjavOrder := TfrmEditSiteObjavOrder.Create(Application);
   try
      with frmEditSiteObjavOrder do
      begin
          fgzid := gz_id;
          cdsObjav.Close;
          cdsobjav.FetchParams;
          cdsobjav.Params.ParamByName('ag_id').AsInteger := ag_id;
          cdsobjav.Params.ParamByName('sd_id').AsInteger := sd_id;
          cdsobjav.Params.ParamByName('ob_id').AsInteger := ob_id;
          cdsobjav.Open;

          cdsRubrika.CloneCursor(cacheData.cdsRubrika, true);

          cdsFormat.CloneCursor(cacheData.cdsFormat, true);
	        cdsFormat.Filter := 'FM_HAS_PICTURE<>1';
	        cdsformat.Filtered := true;

          cdsSiteObjavs.Close;
          cdsSiteObjavs.FetchParams;
          cdsSiteObjavs.Params.ParamByName('ob_id').AsInteger := ob_id;
          cdsSiteObjavs.Open;

          result := ShowModal;
      end;
   finally
       FreeAndNil(frmEditSiteObjavOrder)
   end;
end;

procedure TfrmEditSiteObjavOrder.rchTextChange(Sender: TObject);
var
	ss, sl, len, ent_pos: integer;
begin
	if (rchText.Visible) then
	with rchText do
	begin
		ss := SelStart;
		sl := SelLength;

		SelectAll;
		SelAttributes.Color	:= clWindowText;
		SelAttributes.Name	:= 'Tahoma';
		len := SelLength;

		SelStart := 0;
		ent_pos := pos(#10, rchText.Text);
		if (ent_pos = 0) then
			ent_pos := pos(#13, rchText.Text);
		if (ent_pos = 0) then
			ent_pos := length(rchText.Text);
		SelLength := ent_pos;
		SelAttributes.Style := [fsBold];

		SelStart	:= ent_pos;
		SelLength	:= len-ent_pos;
		SelAttributes.Style := [];

		SelStart  := ss;
		SelLength := sl;
	end;
end;

procedure TfrmEditSiteObjavOrder.RefreshOrder;
begin
   cdsSiteObjavs.Close;
   cdsSiteObjavs.Open
end;

procedure TfrmEditSiteObjavOrder.prvSiteObjavsGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
   TableName := 'OBJAV_TEXT_SITE_OBJAV'
end;

procedure TfrmEditSiteObjavOrder.btDoneClick(Sender: TObject);
begin
    if frmmain.currentUserType = PRG_USR_NABOR then
    begin
       if not (cdsObjav.State in [dsEdit, dsInsert]) then cdsObjav.Edit;

       cdsObjavSITE_OBJAV_ADDED.AsInteger := 1;
    end;
    cdsObjav.ApplyUpdates(0);

end;

procedure TfrmEditSiteObjavOrder.btCancelAgClick(Sender: TObject);
begin
   cdsObjav.CancelUpdates;
end;

end.
