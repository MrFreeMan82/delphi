unit povtorForAgent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, StdCtrls, DBCtrls, Grids, DBGrids, Buttons, SqlExpr,
  Provider, DB, DBClient, DBGridEh, ExtCtrls, DBCtrlsEh, ContentFrame,
  globals, SimpleDS, Mask, DBLookupEh, GridsEh;

type
  TfrmPovtorForAgent = class(TForm)
    dsOldTexts: TDataSource;
    cdsOldTexts: TClientDataSet;
    prvOldTexts: TDataSetProvider;
    qryOldTexts: TSQLQuery;
    qryOldTextsAG_ID: TIntegerField;
    qryOldTextsSD_ID: TIntegerField;
    qryOldTextsOB_ID: TIntegerField;
    qryOldTextsOB_TEXT: TStringField;
    qryOldTextsRB_ID: TIntegerField;
    qryOldTextsFM_ID: TIntegerField;
    qryOldTextsDB_RB_ID: TIntegerField;
    qryOldTextsDO_ADD: TIntegerField;
    qryOldTextsIS_OBJAVLENIE: TIntegerField;
    cdsOldTextsAG_ID: TIntegerField;
    cdsOldTextsSD_ID: TIntegerField;
    cdsOldTextsOB_ID: TIntegerField;
    cdsOldTextsOB_TEXT: TStringField;
    cdsOldTextsRB_ID: TIntegerField;
    cdsOldTextsFM_ID: TIntegerField;
    cdsOldTextsDB_RB_ID: TIntegerField;
    cdsOldTextsDO_ADD: TIntegerField;
    cdsOldTextsIS_OBJAVLENIE: TIntegerField;
    cdsOldTextsRB_NAME_LK: TStringField;
    cdsOldTextsDB_RB_NAME_LK: TStringField;
    qryOldTextsCONTENT_ID: TIntegerField;
    cdsOldTextsCONTENT_ID: TIntegerField;
    cdsOldTextsFM_NAME_LK: TStringField;
    qryOldTextsAG_NAME: TStringField;
    qryOldTextsCU_NAME: TStringField;
    cdsOldTextsAG_NAME: TStringField;
    cdsOldTextsCU_NAME: TStringField;
    Panel1: TPanel;
    btAddChecked: TBitBtn;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    btFindObjavs: TBitBtn;
    cbIssue: TDBLookupComboBox;
    Panel3: TPanel;
    grOldObjavs: TDBGridEh;
    cdsContent: TClientDataSet;
    prvContent: TDataSetProvider;
    qryContent: TSQLQuery;
    cdsContentCONTENT_PICTURE: TBlobField;
    cdsContentCONTENT_ID: TIntegerField;
    qryContentCONTENT_ID: TIntegerField;
    qryContentCONTENT_PICTURE: TBlobField;
    cbShowPictures: TDBCheckBoxEh;
    cbFormat: TDBLookupComboBox;
    cbRubrika: TDBLookupComboBox;
    cbGazeta: TDBLookupComboboxEh;
    qRubrika: TSQLQuery;
    prvRubrika: TDataSetProvider;
    cdsRubrika: TClientDataSet;
    dsRubrika: TDataSource;
    qryContentEXTENSION: TStringField;
    cdsContentEXTENSION: TStringField;
    qFormat: TSQLQuery;
    prvFormat: TDataSetProvider;
    cdsFormat: TClientDataSet;
    dsFormat: TDataSource;
    cdsFormatFM_ID: TIntegerField;
    cdsFormatFM_NAME: TStringField;
    qryContentRB_ID: TIntegerField;
    qryContentFM_ID: TIntegerField;
    qryContentCONTENT_COREL_PAGE: TStringField;
    cdsContentRB_ID: TIntegerField;
    cdsContentFM_ID: TIntegerField;
    cdsContentCONTENT_COREL_PAGE: TStringField;
    qryContentCONTENT_SITE_OBJAV_ADDED: TSmallintField;
    cdsContentCONTENT_SITE_OBJAV_ADDED: TSmallintField;
    procedure btFindObjavsClick(Sender: TObject);
    procedure prvOldTextsGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure grOldObjavsDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsOldTextsCONTENT_IDGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cbShowPicturesClick(Sender: TObject);
    procedure grOldObjavsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure cbGazetaChange(Sender: TObject);
    procedure cbRubrikaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
	FIssueName: string;
  public
    function getOldText(agid,cuid,gzid:integer;var dsRes:TDataSet):boolean;
  end;

var
  frmPovtorForAgent: TfrmPovtorForAgent;

implementation

uses dm, ContentForm, wait, ObjavlenieForm;

{$R *.dfm}

procedure TfrmPovtorForAgent.btFindObjavsClick(Sender: TObject);
begin
    frmWait.show;
    Application.ProcessMessages;

	    cdsOldTexts.Params.ParamByName('IS_ID').AsInteger := cbIssue.KeyValue;
	    cdsOldTexts.Params.ParamByName('FM_ID').AsInteger := cbFormat.KeyValue;

	    if (cbRubrika.KeyValue > 0) then
		      cdsOldTexts.Params.ParamByName('RB_ID').AsInteger := cbRubrika.KeyValue
	    else
		      cdsOldTexts.Params.ParamByName('RB_ID').AsInteger := -1;

	    if (not cdsOldTexts.Active) then
		    cdsOldTexts.Open
      else
    	  cdsOldTexts.Refresh;

	FIssueName := cbIssue.Text;
  frmWait.Hide;
end;

function TfrmPovtorForAgent.getOldText(agid, cuid, gzid: integer;
  var dsRes: TDataSet): boolean;
begin
	Result := false;
	dsRes := nil;
	cbShowPictures.Checked := false;

	cdsOldTexts.Close;
  cdsOldTexts.FetchParams;
	cdsOldTexts.Params.ParamByName('AG_ID').AsInteger := agid;
	cdsOldTexts.Params.ParamByName('CU_ID').AsInteger := cuid;

    cbGazeta.KeyValue := gzid;

	if (cbGazeta.KeyValue = GZ_PR) then
		cbIssue.ListSource := data.dsIssuePR
	else if (cbGazeta.KeyValue = GZ_NS) then
		cbIssue.ListSource := data.dsIssueNS
  else if (cbGazeta.KeyValue = GZ_ST) then
    cbIssue.ListSource := data.dsIssueSR
  else if (cbGazeta.KeyValue = GZ_RZ) then
    cbIssue.ListSource := data.dsIssueRZ
  else if (cbGazeta.KeyValue = GZ_RK) then
    cbIssue.ListSource := data.dsIssueRK
	else
		cbIssue.ListSource := data.dsIssueSR;

  cdsRubrika.Close;
  cdsRubrika.FetchParams;
  cdsRubrika.Params.ParamByName('gz_id').AsInteger := cbGazeta.KeyValue;
  cdsRubrika.Open;

  cdsFormat.Close;
  cdsFormat.FetchParams;
  cdsFormat.Params.ParamByName('gz_id').AsInteger := cbGazeta.KeyValue;
  cdsFormat.Open;

	if (ShowModal = mrOk) then
	begin
		Result := true;
		dsRes  := cdsOldTexts;
	end;
end;


procedure TfrmPovtorForAgent.prvOldTextsGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin

end;


// ѕокажем картинку-модуль
procedure TfrmPovtorForAgent.grOldObjavsDblClick(Sender: TObject);
begin
    if (cdsOldTextsCONTENT_ID.IsNull) then
        MessageDlg('ћодуль не задан',mtError,[mbOk],0)
    else
    TfrmObjavlenie.View(cdsOldTextsOB_ID.AsInteger, cbGazeta.KeyValue, false)

end;


// ќтработаем нажати€ Tab и Esc, чтобы было всем удобно
procedure TfrmPovtorForAgent.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if (Key=27) then
	begin
		ModalResult:=mrCancel;
	end
	else if (Key=9) then
		if (frmPovtorForAgent.ActiveControl=grOldObjavs) then
		begin
			if (ssShift in Shift) then
				btFindObjavs.SetFocus
			else
				btAddChecked.SetFocus;
			Key:=0;
		end;
end;

procedure TfrmPovtorForAgent.cdsOldTextsCONTENT_IDGetText(Sender: TField;
 var Text: String; DisplayText: Boolean);
begin
	if (Sender.IsNull or
        (Sender.DataSet.FieldByName('IS_OBJAVLENIE').AsInteger <> 1)
       ) then
    	Text := ''
    else
    	Text := '[модуль]'
end;

procedure TfrmPovtorForAgent.cbShowPicturesClick(Sender: TObject);
begin
	grOldObjavs.Repaint;
end;

procedure TfrmPovtorForAgent.grOldObjavsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  srcPic: TPicture;
  destBmp:TBitmap;
  ext: string;
begin
  if cbShowPictures.Checked and (Column.FieldName = 'CONTENT_ID') then
  begin
       if (cdsContent.Active) then cdsContent.Close;
    	 cdsContent.Params.ParamByName('CONTENT_ID').AsInteger := Column.Field.AsInteger;
       cdsContent.Open;

       if cdsContentCONTENT_PICTURE.IsNull then exit;

       srcPic := TPicture.Create;
       destBmp := TBitMap.Create;

//  ToDo: ¬ св€зи с изменением формата хранени€ картинок нужно
//  заменить здесь загрузку картинки
       ext := trim(cdsContentEXTENSION.AsString);
    	 PictureFromCompressedFieldNew(srcPic, cdsContentCONTENT_PICTURE, ext, true);

       streach(srcPic.Bitmap, destBmp, rect.Right - rect.Left, rect.Bottom - rect.Top);
       grOldObjavs.Canvas.Draw(rect.Left, rect.Top, destBmp);

       srcPic.Free;
       destBmp.Free;
  end;
end;

procedure TfrmPovtorForAgent.cbGazetaChange(Sender: TObject);
begin
	if (cbGazeta.KeyValue = GZ_PR) then
		cbIssue.ListSource := data.dsIssuePR
	else if (cbGazeta.KeyValue = GZ_NS) then
		cbIssue.ListSource := data.dsIssueNS
  else if (cbGazeta.KeyValue = GZ_ST) then
    cbIssue.ListSource := data.dsIssueSR
  else if (cbGazeta.KeyValue = GZ_RZ) then
    cbIssue.ListSource := data.dsIssueRZ
  else if (cbGazeta.KeyValue = GZ_RK) then
    cbIssue.ListSource := data.dsIssueRK
	else
		cbIssue.ListSource := data.dsIssueSR;

  cdsRubrika.Close;
  cdsRubrika.FetchParams;
  cdsRubrika.Params.ParamByName('gz_id').AsInteger := cbGazeta.KeyValue;
  cdsRubrika.Open;

  cdsFormat.Close;
  cdsFormat.FetchParams;
  cdsFormat.Params.ParamByName('gz_id').AsInteger := cbGazeta.KeyValue;
  cdsFormat.Open;
end;

procedure TfrmPovtorForAgent.cbRubrikaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = VK_DELETE then cbRubrika.KeyValue := 0;
end;

end.
