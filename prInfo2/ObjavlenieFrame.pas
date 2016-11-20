unit ObjavlenieFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, ContentFrame, ExtCtrls,
  StdCtrls, Mask, DBCtrlsEh, DBLookupEh, SimpleDS, globals, DBGridEh,
  Buttons, Menus, uMdlText;

type
  TframeObjavlenie = class(TFrame)
    qryObjavlenie: TSQLQuery;
    prvObjavlenie: TDataSetProvider;
    cdsObjavlenie: TClientDataSet;
    dsObjavlenie: TDataSource;
    qryObjavlenieOBJAV_ID: TIntegerField;
    qryObjavleniePD_ID: TIntegerField;
    qryObjavlenieCONTENT_ID: TIntegerField;
    qryObjavlenieRB_ID: TIntegerField;
    cdsObjavlenieOBJAV_ID: TIntegerField;
    cdsObjavleniePD_ID: TIntegerField;
    cdsObjavlenieCONTENT_ID: TIntegerField;
    cdsObjavlenieRB_ID: TIntegerField;
    Panel1: TPanel;
    Panel2: TPanel;
    frameContent: TframeContent;
    Shape3: TShape;
    cbObjavlenieRubrika: TDBLookupComboboxEh;
    Label1: TLabel;
    Label2: TLabel;
    cbObjavlenieFormat: TDBLookupComboboxEh;
    cdsObjavFormat: TClientDataSet;
    cdsObjavFormatFM_ID: TIntegerField;
    cdsObjavFormatFM_NAME: TStringField;
    cdsObjavFormatFM_SPACE: TFloatField;
    cdsObjavFormatFM_ALWAYS_ADD_SUM: TSmallintField;
    cdsObjavFormatFM_HAS_PICTURE: TSmallintField;
    cdsObjavFormatFM_PICTURE_SIZES: TStringField;
    dsObjavFormat: TDataSource;
    qryObjavlenieFM_ID: TIntegerField;
    cdsObjavlenieFM_ID: TIntegerField;
    Label3: TLabel;
    cbObjavlenieDoubleRubrika: TDBLookupComboboxEh;
    Shape1: TShape;
    qryObjavlenieDOUBLE_RB_ID: TIntegerField;
    cdsObjavlenieDOUBLE_RB_ID: TIntegerField;
    spObjavlenieUpdate: TSQLStoredProc;
    qryObjavlenieSAME_CODE: TIntegerField;
    qryObjavlenieIS_NAME_COMPOSED: TStringField;
    qryObjavlenieSD_ID_COMPOUND: TStringField;
    qryObjavlenieCU_NAME: TStringField;
    qryObjavlenieAG_NAME: TStringField;
    cdsObjavlenieSAME_CODE: TIntegerField;
    cdsObjavlenieIS_NAME_COMPOSED: TStringField;
    cdsObjavlenieSD_ID_COMPOUND: TStringField;
    cdsObjavlenieCU_NAME: TStringField;
    cdsObjavlenieAG_NAME: TStringField;
    Shape2: TShape;
	qryObjavlenieOBJAV_COMMENT: TStringField;
    qryObjavlenieOBJAV_HAS_ATTENTION: TSmallintField;
    cdsObjavlenieOBJAV_COMMENT: TStringField;
    cdsObjavlenieOBJAV_HAS_ATTENTION: TSmallintField;
    edObjavlenieComment: TDBEditEh;
    cbObjavlenieAttention: TDBCheckBoxEh;
    Label4: TLabel;
    tblObjavRubrika: TClientDataSet;
    tblObjavRubrikaRB_ID: TIntegerField;
    tblObjavRubrikaRB_NAME: TStringField;
    tblObjavRubrikaRB_NAME_SHORT: TStringField;
    tblObjavRubrikaRB_COST_COEFF: TFloatField;
	tblObjavRubrikaRB_IS_OBLOGKA: TSmallintField;
    tblObjavRubrikaGZ_ID: TIntegerField;
    tblObjavRubrikaRB_IS_LOCKABLE: TSmallintField;
    dsObjavRubrika: TDataSource;
    dsObjavRubrikaCopy: TDataSource;
    tblObjavRubrikaCopy: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    SmallintField1: TSmallintField;
    IntegerField2: TIntegerField;
    tblObjavRubrikaCopyRB_IS_HOT: TSmallintField;
    tblObjavRubrikaCopyRB_IS_LOCKABLE: TSmallintField;
    Shape4: TShape;
    qryObjavleniePICTURE_TO_INET: TSmallintField;
    cdsObjavleniePICTURE_TO_INET: TSmallintField;
    qryObjavlenieGZ_ID: TSmallintField;
    cdsObjavlenieGZ_ID: TSmallintField;
    edObjavlenieVacCount: TDBNumberEditEh;
    Label5: TLabel;
    qryObjavlenieVAC_COUNT: TSmallintField;
    cdsObjavlenieVAC_COUNT: TSmallintField;
    qryObjavlenieDISTRICT_ID: TIntegerField;
    cdsObjavlenieDISTRICT_ID: TIntegerField;
    qryObjavlenieSD_NUM: TStringField;
    cdsObjavlenieSD_NUM: TStringField;
    qInfInt: TSQLQuery;
    btnChangeMdl: TSpeedButton;
    Shape5: TShape;
    prvObjavFormat: TDataSetProvider;
    qObjavFormat: TSQLQuery;
    qObjavFormatFM_ID: TIntegerField;
    qObjavFormatFM_NAME: TStringField;
    qObjavFormatFM_SPACE: TFloatField;
    qObjavFormatFM_ALWAYS_ADD_SUM: TSmallintField;
    qObjavFormatFM_HAS_PICTURE: TSmallintField;
    qObjavFormatFM_PICTURE_SIZES: TStringField;
    btMdlText: TSpeedButton;
    qryObjavlenieMDL_TEXT: TStringField;
    cdsObjavlenieMDL_TEXT: TStringField;
    qObjavlenieInsert: TSQLQuery;
    procedure prvObjavlenieBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cbObjavlenieFormatEnter(Sender: TObject);
    procedure frameContentcbScaleClick(Sender: TObject);
    procedure frameContentbtSaveClick(Sender: TObject);
    procedure frameContentbtPrintClick(Sender: TObject);
    procedure btnChangeMdlClick(Sender: TObject);
    procedure frameContentN1Click(Sender: TObject);
    procedure frameContentbtDeleteSiteObjavClick(Sender: TObject);
    procedure btMdlTextClick(Sender: TObject);
    procedure frameContentbtAddSiteObjavClick(Sender: TObject);
    procedure cbObjavlenieFormatChange(Sender: TObject);
    procedure cbObjavlenieRubrikaChange(Sender: TObject);
  private

	FGazetaId: integer;
	FObjavId: integer;
	FReadOnly: boolean;

	procedure SetObjavId(const AObjavId: integer);
	procedure SetReadOnly(const Value: boolean);
	{ Private declarations }
  public
	Mode: TEntityFormMode;
	IsInCurrentIssue: boolean;
	procedure Refresh();
	procedure Save();
	procedure Cancel();
	procedure Add(APodachaId: integer);
  procedure Edit();
  published
	property GazetaId: integer read FGazetaId write FGazetaId;
	property ObjavId: integer read FObjavId write SetObjavId;
	property ReadOnly: boolean read FReadOnly write SetReadOnly;
  end;

implementation

uses dm, main, dmCache, uInfoForInternet, uChangeObjav;

{$R *.dfm}

{ TframeObjavlenie }

procedure TframeObjavlenie.Add(APodachaId: integer);
begin
  if frmMdlText.txtMdlTxt.DataSource = nil then
          frmMdlText.txtMdlTxt.DataSource := dsObjavlenie;

	ObjavId := -1;
  Refresh();

	cdsObjavlenie.Insert;
  cdsObjavlenieOBJAV_ID.AsInteger   := ObjavId;
  cdsObjavleniePD_ID.AsInteger      := APodachaId;

  frameContent.Add;
  cdsObjavlenieCONTENT_ID.AsInteger := frameContent.ContentId;

	Mode := fmAdd;
end;

procedure TframeObjavlenie.Cancel;
begin
    	cdsObjavlenie.Cancel;
      cdsObjavlenie.CancelUpdates;
    	frameContent.Cancel;      
end;

procedure TframeObjavlenie.Edit;
begin
     if frmMdlText.txtMdlTxt.DataSource = nil then
          frmMdlText.txtMdlTxt.DataSource := dsObjavlenie;

     frameContent.Refresh;
     frameContent.cdsContent.Edit;
     Refresh();
     if frameContent.cdsContent.State in [dsBrowse] then frameContent.cdsContent.Edit;
end;

procedure TframeObjavlenie.Refresh;
var
	copyFilter: string;
begin
	if (cdsObjavlenie.Active) then
    	cdsObjavlenie.Close;

  cdsObjavFormat.Close;
  cdsObjavFormat.FetchParams;
  cdsObjavFormat.Params.ParamByName('gz_id').AsInteger := GazetaId;
  cdsObjavFormat.Open;


	cdsObjavlenie.Params.ParamByName('OBJAV_ID').AsInteger := ObjavId;
	cdsObjavlenie.Open;

	tblObjavRubrika.CloneCursor(cacheData.cdsRubrika, true);
	tblObjavRubrika.Filter := '1=1 AND GZ_ID=' + IntToStr(GazetaId);

	if (    IsInCurrentIssue
		and data.IsAgentLocked(int2user(frmMain.currentUserType))
	) then
		tblObjavRubrika.Filter := tblObjavRubrika.Filter + ' AND RB_IS_LOCKABLE = 0';
	tblObjavRubrika.Filtered := true;

	copyFilter := '1=1 AND GZ_ID=' + IntToStr(GazetaId);
	copyFilter := copyFilter + ' AND (RB_IS_HOT=1 OR RB_IS_OBLOGKA=1)';
	if (    IsInCurrentIssue
		and data.IsAgentLocked(int2user(frmMain.currentUserType))
	) then
		copyFilter := copyFilter + ' AND RB_IS_LOCKABLE = 0';

	tblObjavRubrikaCopy.CloneCursor(cacheData.cdsRubrika, true);
	tblObjavRubrikaCopy.Filter := copyFilter;
	tblObjavRubrikaCopy.Filtered := true;

	frameContent.ContentId := cdsObjavlenieCONTENT_ID.AsInteger;
  frameContent.GZ_ID := FGazetaId;
	frameContent.SetPrintData(cdsObjavlenieSD_NUM.AsString,
							  cdsObjavlenieAG_NAME.AsString,
							  cdsObjavlenieCU_NAME.AsString,
							  cdsObjavlenieIS_NAME_COMPOSED.AsString);
	frameContent.Refresh;


	// если Контент уже загружен, пользователь не должен иметь возможности
	// изменить формат объявления
	if not frameContent.cdsContentCONTENT_PICTURE.IsNull then
		cbObjavlenieFormat.ReadOnly := true
	else
		cbObjavlenieFormat.ReadOnly := false;

	//cbObjavleniePictureToInet.Enabled := (cdsObjavlenieFM_ID.AsInteger = FORMAT_VIP);

	Mode := fmEdit;

end;

procedure TframeObjavlenie.Save;
begin
	//* потенциально опасная операция - нужно бы окружить транзакцией

	frameContent.Save();

	cdsObjavlenie.CheckBrowseMode;

    // т.к. при добавлении/изменении/удалении Объявления нужно
    // внести аналогичные изменения во все ещё не вышедшие Подачи,
    // не будем напрямую изменять таблицу, а выполним соотв. ХП
    if (Mode = fmEdit) then
    begin
		spObjavlenieUpdate.ParamByName('OBJAV_ID').AsInteger   	        := cdsObjavlenieOBJAV_ID.AsInteger;

		spObjavlenieUpdate.ParamByName('CONTENT_ID').AsInteger 	        := cdsObjavlenieCONTENT_ID.AsInteger;
		zero2null(spObjavlenieUpdate.ParamByName('CONTENT_ID'));

		spObjavlenieUpdate.ParamByName('RB_ID').AsInteger 		        := cdsObjavlenieRB_ID.AsInteger;
		spObjavlenieUpdate.ParamByName('FM_ID').AsInteger 		        := cdsObjavlenieFM_ID.AsInteger;

		spObjavlenieUpdate.ParamByName('VAC_COUNT').AsInteger			:= cdsObjavlenieVAC_COUNT.AsInteger;

		spObjavlenieUpdate.ParamByName('DOUBLE_RB_ID').AsInteger        := cdsObjavlenieDOUBLE_RB_ID.AsInteger;
		zero2null(spObjavlenieUpdate.ParamByName('DOUBLE_RB_ID'));

		spObjavlenieUpdate.ParamByName('OBJAV_COMMENT').AsString	    := cdsObjavlenieOBJAV_COMMENT.AsString;
		spObjavlenieUpdate.ParamByName('OBJAV_HAS_ATTENTION').AsInteger := cdsObjavlenieOBJAV_HAS_ATTENTION.AsInteger;

    if cdsObjavlenieDISTRICT_ID.IsNull then
         spObjavlenieUpdate.ParamByName('DISTRICT_ID').AsInteger			:= 0
    else
         spObjavlenieUpdate.ParamByName('DISTRICT_ID').AsInteger			:= cdsObjavlenieDISTRICT_ID.AsInteger;
		spObjavlenieUpdate.ParamByName('PICTURE_TO_INET').AsInteger		:= cdsObjavleniePICTURE_TO_INET.AsInteger;

    spObjavlenieUpdate.ParamByName('MDL_TEXT').AsString := ''; //frmMdlText.txtMdlTxt.DataSource.DataSet.FieldByName('MDL_TEXT').AsString;
		spObjavlenieUpdate.ExecProc;
    frmMdlText.save(cdsObjavlenieOBJAV_ID.AsInteger);
	end
	else if (Mode = fmAdd) then
	begin
    qObjavlenieInsert.Close;
		qObjavlenieInsert.ParamByName('PD_ID').AsInteger 	 		    := cdsObjavleniePD_ID.AsInteger;

		qObjavlenieInsert.ParamByName('CONTENT_ID').AsInteger   		:= cdsObjavlenieCONTENT_ID.AsInteger;
		zero2null(qObjavlenieInsert.ParamByName('CONTENT_ID'));

		qObjavlenieInsert.ParamByName('RB_ID').AsInteger 	     		:= cdsObjavlenieRB_ID.AsInteger;
		qObjavlenieInsert.ParamByName('FM_ID').AsInteger 	     		:= cdsObjavlenieFM_ID.AsInteger;

		qObjavlenieInsert.ParamByName('VAC_COUNT').AsInteger     		:= cdsObjavlenieVAC_COUNT.AsInteger;

		qObjavlenieInsert.ParamByName('DOUBLE_RB_ID').AsInteger		:= cdsObjavlenieDOUBLE_RB_ID.AsInteger;
		zero2null(qObjavlenieInsert.ParamByName('DOUBLE_RB_ID'));

		qObjavlenieInsert.ParamByName('OBJAV_COMMENT').AsString	    := cdsObjavlenieOBJAV_COMMENT.AsString;
		qObjavlenieInsert.ParamByName('OBJAV_HAS_ATTENTION').AsInteger := cdsObjavlenieOBJAV_HAS_ATTENTION.AsInteger;

		if cdsObjavlenieDISTRICT_ID.IsNull then
         qObjavlenieInsert.ParamByName('DISTRICT_ID').AsInteger			:= 0
    else
         qObjavlenieInsert.ParamByName('DISTRICT_ID').AsInteger			:= cdsObjavlenieDISTRICT_ID.AsInteger;

		qObjavlenieInsert.ParamByName('PICTURE_TO_INET').AsInteger		:= cdsObjavleniePICTURE_TO_INET.AsInteger;

    qObjavlenieInsert.ParamByName('MDL_TEXT').AsString := '';//frmMdlText.txtMdlTxt.DataSource.DataSet.FieldByName('MDL_TEXT').AsString;

		qObjavlenieInsert.Open;
    frmMdlText.save(qObjavlenieInsert.Fields[0].asInteger, cdsObjavleniePD_ID.AsInteger);
	end;

	cdsObjavlenie.Cancel;
 //	Refresh();
//    cdsObjavlenie.ApplyUpdates(-1);
end;

procedure TframeObjavlenie.SetObjavId(const AObjavId: integer);
begin
	FObjavId := AObjavId;
end;

procedure TframeObjavlenie.SetReadOnly(const Value: boolean);
begin
	FReadOnly := Value;

	if (Value) then
		Mode := fmView
	else
		Mode := fmEdit;

	cdsObjavlenie.ReadOnly := Value;
	frameContent.ReadOnly  := Value;
end;

procedure TframeObjavlenie.prvObjavlenieBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
	Applied := true;
end;

procedure TframeObjavlenie.cbObjavlenieFormatEnter(Sender: TObject);
begin
	(Sender as TDBLookupComboBoxEh).DropDown;
end;

procedure TframeObjavlenie.frameContentcbScaleClick(Sender: TObject);
begin
	// иначе в форме не работает...
	frameContent.cbScaleClick(Sender);
end;

procedure TframeObjavlenie.frameContentbtSaveClick(Sender: TObject);
begin
	// иначе в форме не работает...
	frameContent.btSaveClick(Sender);
end;

procedure TframeObjavlenie.frameContentbtPrintClick(Sender: TObject);
begin
	// иначе в форме не работает...
	frameContent.btPrintClick(Sender);
end;

procedure TframeObjavlenie.btnChangeMdlClick(Sender: TObject);
begin
   if frameContent.cdsContentCONTENT_PICTURE.IsNull then
   begin
       MessageBox(Application.Handle, 'Модуль не загружен!', 'Ошибка', MB_OK or MB_ICONERROR);
       exit;
   end;
   TfrmChangeObjav.ChangeObjav(cdsObjavlenieOBJAV_ID.AsInteger, self.ReadOnly, frameContent.img.Picture.Bitmap);
end;

procedure TframeObjavlenie.frameContentN1Click(Sender: TObject);
begin
  frameContent.N1Click(Sender);

end;

procedure TframeObjavlenie.frameContentbtDeleteSiteObjavClick(
  Sender: TObject);
begin
  frameContent.btDeleteSiteObjavClick(Sender);

end;

procedure TframeObjavlenie.btMdlTextClick(Sender: TObject);
begin
    if frmMdlText.txtMdlTxt.DataSource = nil then
          frmMdlText.txtMdlTxt.DataSource := dsObjavlenie;

    frmMdlText.ob_id := FObjavId;
    frmMdlText.gz_id :=  FGazetaId;
    frmMdlText.Show;
end;

procedure TframeObjavlenie.frameContentbtAddSiteObjavClick(
  Sender: TObject);
begin
  frameContent.btAddSiteObjavClick(Sender);

end;

procedure TframeObjavlenie.cbObjavlenieFormatChange(Sender: TObject);
begin
     frameContent.cdsContentFM_ID.AsInteger := cdsObjavFormatFM_ID.AsInteger;
end;

procedure TframeObjavlenie.cbObjavlenieRubrikaChange(Sender: TObject);
begin
    frameContent.cdsContentRB_ID.AsInteger := tblObjavRubrikaRB_ID.AsInteger;
end;

end.
