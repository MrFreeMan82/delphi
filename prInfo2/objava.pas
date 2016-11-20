unit objava;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DB, 
  ComCtrls, ActnList, oldTexts, RegExpr, DBClient, Grids, DBGrids, dm,
  DBCtrlsEh, DBLookupEh, DBCtrls, SimpleDS, Variants, FMTBcd, SqlExpr,
  Provider, globals, DBGridEh, AppEvnts, Menus;

type
  TfrmObjava = class(TFrame)
    actions: TActionList;
    actSpellCheck: TAction;
    pnlHolder: TPanel;
    pnlAgent: TPanel;
    Shape6: TShape;
    btCancelAg: TBitBtn;
    btDone: TBitBtn;
    btMore: TBitBtn;
    pnlText: TPanel;
    Label5: TLabel;
    rchText: TDBRichEdit;
    pnlCopyTo: TPanel;
    Shape2: TShape;
    cbDoDouble: TDBCheckBoxEh;
	cbDoubleRubrika: TDBLookupComboboxEh;
    pnlComment: TPanel;
    edComment: TDBEditEh;
    pnlProperties: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    cbIsActive: TDBCheckBoxEh;
    cbFormat: TDBLookupComboboxEh;
    cbRubrika: TDBLookupComboboxEh;
    Shape5: TShape;
    Shape1: TShape;
    Label4: TLabel;
    Shape3: TShape;
	dlgOpenPicture: TOpenDialog;
    pnlPubl: TPanel;
    Shape4: TShape;
    btCheckSpelling: TBitBtn;
    btOldText: TBitBtn;
    btSave: TBitBtn;
    btCancelPubl: TBitBtn;
    btToVerstka: TBitBtn;
    btToCorrector: TBitBtn;
	btBackToKorrektura: TBitBtn;
    lblIsReadOnly: TLabel;
    pnlRubrikaSite: TPanel;
    Shape9: TShape;
    cbRubrikaSite: TDBLookupComboboxEh;
    cbForInternet: TDBCheckBoxEh;
    sdsRubrikaPohozha: TClientDataSet;
    sdsRubrikaPohozhaRS_ID: TIntegerField;
    sdsRubrikaPohozhaRB_ID: TIntegerField;
    dsRubrikaPohozha: TDataSource;
    cbFilterRubrikaSite: TDBCheckBoxEh;
    mmText: TDBMemo;
    dsObjav: TDataSource;
    dsDouble: TDataSource;
    dsSdelkaPhone: TDataSource;
    cdsSdelkaPhone: TClientDataSet;
    cdsSdelkaPhoneAG_ID: TIntegerField;
    cdsSdelkaPhoneSD_ID: TIntegerField;
    cdsSdelkaPhonePH_NUMBER: TStringField;
    cdsDouble: TClientDataSet;
    cdsDoubleAG_ID: TIntegerField;
    cdsDoubleSD_ID: TIntegerField;
	cdsDoubleOB_ID: TIntegerField;
    cdsDoubleOB_PARENT: TIntegerField;
    cdsDoubleFM_ID: TSmallintField;
    cdsDoubleRB_ID: TIntegerField;
    cdsDoubleOB_IS_ACTIVE: TSmallintField;
    cdsDoubleOB_STATE: TSmallintField;
    cdsDoubleRB_NAME_LK: TStringField;
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
    cdsObjavOS_NAME: TStringField;
    prvObjav: TDataSetProvider;
    qryDouble: TSQLQuery;
    qryDoubleAG_ID: TIntegerField;
    qryDoubleSD_ID: TIntegerField;
    qryDoubleOB_ID: TIntegerField;
    qryDoubleOB_PARENT: TIntegerField;
    qryDoubleOB_IS_ACTIVE: TSmallintField;
    qryDoubleOB_STATE: TSmallintField;
    qryDoubleFM_ID: TSmallintField;
    qryDoubleRB_ID: TIntegerField;
    qrySdelkaPhone: TSQLQuery;
    qrySdelkaPhoneAG_ID: TIntegerField;
    qrySdelkaPhoneSD_ID: TIntegerField;
    qrySdelkaPhonePH_NUMBER: TStringField;
    qryObjav: TSQLQuery;
    prvDouble: TDataSetProvider;
    prvSdelkaPhone: TDataSetProvider;
    cdsFormat: TClientDataSet;
    dsFormat: TDataSource;
    cdsFormatFM_ID: TIntegerField;
    cdsFormatFM_NAME: TStringField;
    cdsFormatFM_SPACE: TFloatField;
    cdsFormatFM_ALWAYS_ADD_SUM: TSmallintField;
    cdsFormatFM_HAS_PICTURE: TSmallintField;
    cdsFormatFM_PICTURE_SIZES: TStringField;
    dsRubrika: TDataSource;
    tblRubrika: TClientDataSet;
    tblRubrikaRB_ID: TIntegerField;
    tblRubrikaRB_NAME: TStringField;
    tblRubrikaRB_NAME_SHORT: TStringField;
	tblRubrikaRB_COST_COEFF: TFloatField;
    tblRubrikaRB_IS_OBLOGKA: TSmallintField;
    tblRubrikaGZ_ID: TIntegerField;
    tblRubrikaCopy: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    SmallintField1: TSmallintField;
    IntegerField2: TIntegerField;
    dsRubrikaCopy: TDataSource;
    tblRubrikaCopyRB_IS_HOT: TSmallintField;
    tblRubrikaRB_IS_LOCKABLE: TSmallintField;
    tblRubrikaCopyRB_IS_LOCKABLE: TSmallintField;
    qryLogChanges: TSQLQuery;
    Shape7: TShape;
    btShowAudit: TSpeedButton;
    sdsRubrikaPohozhaRS_NAME: TStringField;
    Label3: TLabel;
    cdsObjavOB_VAC_COUNT: TSmallintField;
    edVacCount: TDBNumberEditEh;
    cdsObjavOB_HAS_ATTENTION: TSmallintField;
    DBCheckBoxEh1: TDBCheckBoxEh;
    cdsObjavDISTRICT_ID: TIntegerField;
    cdsObjavDISTRICT_NAME_LK: TStringField;
    Label6: TLabel;
    cbDistrict: TDBLookupComboboxEh;
    Panel1: TPanel;
    brSiteObjav: TButton;
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
    qryObjavCU_ID: TIntegerField;
    qryObjavRB_NAME_SHORT: TStringField;
    qryObjavRS_NAME_LK: TStringField;
    qryObjavFM_NAME: TStringField;
    qryObjavDISTRICT_NAME_LK: TStringField;
    qryObjavOS_NAME: TStringField;
    qryObjavOB_VAC_COUNT: TSmallintField;
    qryObjavOB_HAS_ATTENTION: TSmallintField;
    qryObjavDISTRICT_ID: TIntegerField;
    qryObjavSITE_EMAIL: TStringField;
    qryObjavSITE_EMPLOYER: TStringField;
    cdsObjavSITE_EMAIL: TStringField;
    cdsObjavSITE_EMPLOYER: TStringField;
    qTextOrigin: TSQLQuery;
    qTextOriginOB_TEXT: TStringField;
    qTextOriginORIGIN: TStringField;
    popCopy: TPopupMenu;
    nCopy: TMenuItem;
    nPaste: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    cdsSiteObjavs: TClientDataSet;
    cdsSiteObjavsSITE_OBJAV_ID: TIntegerField;
    cdsSiteObjavsOB_ID: TIntegerField;
    qSiteObjavs: TSQLQuery;
    prvSiteObjavs: TDataSetProvider;
    qFormat: TSQLQuery;
    qFormatFM_ID: TIntegerField;
    qFormatFM_NAME: TStringField;
    qFormatFM_SPACE: TFloatField;
    qFormatFM_ALWAYS_ADD_SUM: TSmallintField;
    qFormatFM_HAS_PICTURE: TSmallintField;
    qFormatFM_PICTURE_SIZES: TStringField;
    prvFormat: TDataSetProvider;
    procedure btDoneClick(Sender: TObject);
    procedure btCancelAgClick(Sender: TObject);
    procedure cbFormatEnter(Sender: TObject);
	procedure cbDoDoubleClick(Sender: TObject);
    procedure cbFormatKeyPress(Sender: TObject; var Key: Char);
    procedure btCancelPublClick(Sender: TObject);
    procedure btOldTextClick(Sender: TObject);
    procedure rchTextChange(Sender: TObject);
    procedure actSpellCheckExecute(Sender: TObject);
    procedure rchTextKeyPress(Sender: TObject; var Key: Char);
    procedure btToVerstkaClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure edCommentKeyPress(Sender: TObject; var Key: Char);
	procedure cbForInternetClick(Sender: TObject);
    procedure cbFilterRubrikaSiteClick(Sender: TObject);
    procedure cdsObjavAfterInsert(DataSet: TDataSet);
    procedure cdsObjavReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsDoubleAfterInsert(DataSet: TDataSet);
    procedure cbFormatChange(Sender: TObject);
    procedure cdsObjavAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure btShowAuditClick(Sender: TObject);
    procedure prvObjavGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure nCopyClick(Sender: TObject);
    procedure nPasteClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure rchTextEnter(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure cdsObjavBeforePost(DataSet: TDataSet);
    procedure brSiteObjavClick(Sender: TObject);
  private
	User:		TUser;
	AgentId:	integer;
	ObjavId:	integer;
	SdelkaId:	integer;
	GazetaId:	integer;
  RegisterType: integer; // 0-- small leters, 1 - Capital, 2 - First Capital

	IsInCurrentIssue: boolean;

	fReadOnly:	boolean;
	IsLoading:	boolean;
	oldTextGetter:	TfrmOldTexts;
  oldText: string;

	procedure setReadOnly(const Value: boolean);
	procedure setRubrikaSiteFilter(resetRubrika: boolean = true);
	procedure setRubrikaFilter();
  public
	function getOldText(agid, sdid: integer; var resText: String): boolean;
	procedure CheckPhones(mm: TCustomRichEdit);

    procedure Save;
    procedure Cancel;

	procedure SetObjav(agid, sdid, obid, gzid: integer; usr: TUser; isInCurrIssue: boolean);

  published
	property ReadOnly:boolean read fReadOnly write setReadOnly;
  end;

  // статусы объявлений
  const
	PUBL_STATE_NABOR:integer=0;
	PUBL_STATE_KORREKTURA:integer=1;
	PUBL_STATE_KORREKTING:integer=2;
	PUBL_STATE_DESIGN:integer=3;
	PUBL_STATE_VERSTKA:integer=4;
	PUBL_STATE_VERSTING:integer=5;
	PUBL_STATE_READY:integer=6;

implementation

uses ContentForm, main, accessRights, spellChecker, Reconcile, objavaAudit,
  dmCache, uInfoForInternet, uChangeObjav, ClipBrd, StrUtils,
  uEditSiteObjav;

{$R *.dfm}

procedure TfrmObjava.btDoneClick(Sender: TObject);
begin
	Save();
end;

procedure TfrmObjava.Save;
var s: string;
begin
  if frmMain.currentUserType = 3 then
  begin
       if (oldText <> rchText.Text) then
       begin
            cdsObjav.BeforePost := nil;
            cdsObjav.Edit;
            s := cdsObjavOB_COMMENT.AsString;
            if pos('[Правка]', s) = 0 then cdsObjavOB_COMMENT.AsString := '[Правка] ' + s;
            cdsObjavOB_STATE.AsInteger := OB_STATE_REPAIR;
            cdsObjav.Post;
            cdsObjav.BeforePost := cdsObjavBeforePost;
       end;
       oldText := '';
  end;
  if not cbForInternet.Checked then
  begin
       if not (cdsObjav.State in [dsEdit, dsInsert]) then cdsObjav.Edit;
       cdsObjavRS_ID.AsInteger := 0;
  end;
	cdsObjav.CheckBrowseMode();
	cdsObjav.ApplyUpdates(-1);
    cdsDouble.CheckBrowseMode();
    cdsDouble.ApplyUpdates(-1);
end;

procedure TfrmObjava.btCancelAgClick(Sender: TObject);
begin
	Cancel();
end;

// Открывает выпадающее меню при "входе" в него
procedure TfrmObjava.cbFormatEnter(Sender: TObject);
begin
	if (cdsObjav.State = dsInsert) then
		(Sender as TDBLookupComboBoxEh).DropDown();
end;

// Добавляет/удаляет дубль при щелчке на соотв. чекбокс
procedure TfrmObjava.cbDoDoubleClick(Sender: TObject);
begin
	if (cbDoDouble.Checked) then
	begin
		if (cdsDouble.IsEmpty) then
		begin
			cdsObjav.CheckBrowseMode();
			cdsDouble.Append();
			cbDoubleRubrika.Visible := true;
			actSpellCheck.Execute();
			cdsDouble.CheckBrowseMode();
		end
	end
	else
	begin
		if (not cdsDouble.IsEmpty) then
		begin
			cdsDouble.CheckBrowseMode();
			cdsDouble.Delete();
			cbDoubleRubrika.Visible := false;
			actSpellCheck.Execute();
			cdsDouble.CheckBrowseMode();
		end;
	end;
end;

// Нажатие на Enter - сохранение изменений и закрытие окна
procedure TfrmObjava.cbFormatKeyPress(Sender: TObject; var Key: Char);
begin
	if (Key=#13) then
		if  (not (Sender as TDBLookupcomboBoxEh).ListVisible) then
			btDone.Click;
end;

procedure TfrmObjava.btCancelPublClick(Sender: TObject);
begin
	Cancel();
end;

// Повтор старого текста объявления - вызов соответствующего диалога
function TfrmObjava.getOldText(agid, sdid: integer; var resText: String): boolean;
begin
	if (oldTextGetter = nil) then
		oldTextGetter := TfrmOldTexts.Create(self);
	Result := oldTextGetter.getOldText(agid, sdid, resText);
end;

// Выделение в тексте номеров телефонов, не связанных со сделкой
procedure TfrmObjava.CheckPhones(mm: TCustomRichEdit);

function deleteMinus(s: string): string;
begin
	Result := s;
	delete(Result, pos('-', Result), 1);
end;

var
	re: TRegExpr;
begin
	if (rchText.Visible) then
	begin
		re := TRegExpr.Create;
		re.Expression := '(\d\d\d\-\d\d\d\d)';
   // re.Expression := '(\d{3}-\d{3}-\d{4}(\,|\.|$|\ ))';
		if (re.Exec(mm.Text)) then
		begin
			repeat
				if (not cdsSdelkaPhone.Locate('PH_NUMBER',deleteMinus(re.Match[0]), [])) then
				begin
					mm.SelStart	 := re.MatchPos[0] - 1;
					mm.SelLength := re.MatchLen[0];
					mm.SelAttributes.Color	:= clBlue;
					mm.SelAttributes.Style	:= [fsBold, fsUnderline];
				end;
			until (not re.ExecNext)
		end;
	end;
end;

// Повтор старого текста объявления
procedure TfrmObjava.btOldTextClick(Sender: TObject);
var
	tx: String;
begin
	if (getOldText(cdsObjavAG_ID.AsInteger, cdsObjavSD_ID.AsInteger, tx)) then
	begin
		if ( not (qryObjav.State in [dsEdit, dsInsert])) then
			qryObjav.Edit;
		qryObjavOB_TEXT.AsString := tx;
		rchTextChange(rchText);
	end;
end;

// Форматирование текста объявления - выделение жирным
// начертанием первой строки
procedure TfrmObjava.rchTextChange(Sender: TObject);
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


// Проверка орфографии
procedure TfrmObjava.actSpellCheckExecute(Sender: TObject);
begin
	if (rchText.Visible) then
	try
		  rchTextChange(rchText);
		  CheckPhones(rchText);
	 //	if (speller = nil) then

		  //speller := TSpellChecker.Create();
		 if Assigned(speller) then speller.CheckSpelling(rchText);
     // speller.Free;
  except
	end;
end;


// Переключение из режима жирного текста в режим обычного, когда
// наборщица переходит на вторую строку текста объявления
procedure TfrmObjava.rchTextKeyPress(Sender: TObject; var Key: Char);
begin
	if (Key=#13) then
	begin
		rchTextChange(rchText);
		if (rchText.SelStart+2>=length(rchText.Lines[0])) then
			rchText.SelAttributes.Style:=[];
	end;
end;


// Отправляем объявление в вёрстку
procedure TfrmObjava.btToVerstkaClick(Sender: TObject);
begin
	if (not (cdsObjav.State in [dsEdit, dsInsert])) then
		cdsObjav.Edit();
	if (Sender = btToCorrector) or (Sender = btBackToKorrektura) then
		cdsObjav.FieldByName('OB_STATE').AsInteger := PUBL_STATE_KORREKTURA
	else
		cdsObjav.FieldByName('OB_STATE').AsInteger := PUBL_STATE_VERSTKA;
	//Save();
  btDone.Click;
end;


// Сохраняем изменения. Если их вносила наборщица, то (возможно - заново)
// отправляем объявление в корректуру
procedure TfrmObjava.btSaveClick(Sender: TObject);
begin
	if ((User=uNabor)and(cdsObjav.FieldByName('OB_STATE').AsInteger>PUBL_STATE_NABOR)) then
	begin
		if (not (cdsObjav.State in [dsEdit,dsInsert])) then
			cdsObjav.Edit;
		cdsObjav.FieldByName('OB_STATE').AsInteger:=PUBL_STATE_KORREKTURA;
	end;
	btDone.Click;
end;


procedure TfrmObjava.edCommentKeyPress(Sender: TObject; var Key: Char);
begin
	if (Key=#13) then
		btDone.Click;
end;


// Делаем форму доступной только для чтения
// (агент просматривает объявление)
procedure TfrmObjava.setReadOnly(const Value: boolean);
begin
	fReadOnly := Value;

	// По тэгу этой метки будет определено, должна ли форма быть
	// рид-онли.
	if (ReadOnly) then
		lblIsReadOnly.Tag:=1
	else
		lblIsReadOnly.Tag:=0;

	TAccessRightsManager.SetWindowAccessState(User,self);
end;

procedure TfrmObjava.cbForInternetClick(Sender: TObject);
begin
	cbRubrikaSite.Enabled:=cbForInternet.Checked;
end;

// Устанавливает состояние комбобокса для выбора рубрики на сайте
procedure TfrmObjava.setRubrikaSiteFilter(resetRubrika:boolean);
var
	rs, rb: integer;
	doFilter: boolean;
begin
	if (not IsLoading) then
	begin
		if (cbRubrika.KeyValue <> null) then
			rb := cbRubrika.KeyValue
		else
			rb := 0;

		if (rb = 1) and (cbDoDouble.Checked) and (cbDoubleRubrika.KeyValue <> null) then
			rb := cbDoubleRubrika.KeyValue;

		if (not cdsObjavRS_ID.IsNull) then
			rs := cdsObjavRS_ID.AsInteger
		else
			rs := 0;

		// отфильтруем список похожих рубрик
		if (rb > 0) then
			sdsRubrikaPohozha.Filter := 'RB_ID='+IntToStr(rb);

		// если нету нужной рубрики, и мы не можем поставить свою (например -
		// только что открыли форму), то - отключим фильтр
		doFilter := not ((not resetRubrika) and (rs > 0) and (not sdsRubrikaPohozha.Locate('RS_ID', rs, [])));

		if (doFilter
			and cbFilterRubrikaSite.Checked
			and (rb > 0)
			and (not sdsRubrikaPohozha.IsEmpty)) then
			cbRubrikaSite.ListSource := dsRubrikaPohozha
		else
			cbRubrikaSite.ListSource := data.dsRubrikaSite;

		if (resetRubrika) then
		begin
			cbRubrikaSite.ListSource.DataSet.First();
			if (not cbRubrikaSite.ListSource.DataSet.IsEmpty) then
			begin
				if (not (cdsObjav.State in [dsEdit, dsInsert])) then
					cdsObjav.Edit;
				cdsObjav.FieldByName('RS_ID').Value :=
					cbRubrikaSite.ListSource.DataSet.FieldByName('RS_ID').Value;
			end;
		end;

		// выделим жирным шрифтом текст, если есть только одна рубрика
		if (cbRubrikaSite.ListSource.DataSet.RecordCount = 1) then
			cbRubrikaSite.Font.Style := cbRubrikaSite.Font.Style + [fsBold]
		else
			cbRubrikaSite.Font.Style := cbRubrikaSite.Font.Style - [fsBold];
	end;
end;

procedure TfrmObjava.cbFilterRubrikaSiteClick(Sender: TObject);
begin
    setRubrikaSiteFilter();
end;

procedure TfrmObjava.cdsObjavAfterInsert(DataSet: TDataSet);
begin
	cdsObjavAG_ID.Value				:= AgentId;
	cdsObjavSD_ID.Value				:= SdelkaId;
	cdsObjavOB_STATE.Value			:= 0;
	cdsObjavOB_IS_ACTIVE.Value		:= 1;
	cdsObjavOB_FOR_INTERNET.Value	:= 1;

	cdsObjavOB_ID.Value 			:= data.nextGeneratorId('G_OB_ID');

	cdsObjavFM_ID.Value				:= 1;
end;

procedure TfrmObjava.cdsObjavReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
	if (data.connection.InTransaction) then
		data.connection.Rollback(tr);
	Action:=HandleReconcileError(DataSet, UpdateKind, E, '');
end;

procedure TfrmObjava.cdsDoubleAfterInsert(DataSet: TDataSet);
begin
	cdsDoubleAG_ID.Value		:= AgentId;
	cdsDoubleSD_ID.Value		:= SdelkaId;
	cdsDoubleOB_STATE.Value		:= 1;
	cdsDoubleOB_IS_ACTIVE.Value	:= 1;
	cdsDoubleOB_PARENT.Value	:= cdsObjavOB_ID.Value;

	cdsDoubleOB_ID.Value		:= data.nextGeneratorId('G_OB_ID');

	tblRubrika.Locate('RB_ID', cbRubrika.KeyValue, []);
	if (tblRubrikaRB_IS_LOCKABLE.AsInteger = 1) then
		cdsDoubleRB_ID.Value := RUBRIKA_GOR_LOCK
	else
		cdsDoubleRB_ID.Value := RUBRIKA_GOR_UNLOCK;

	cdsDoubleFM_ID.Value		:= cdsObjavFM_ID.Value;
end;

procedure TfrmObjava.SetObjav(agid, sdid, obid, gzid: integer; usr: TUser; isInCurrIssue: boolean);
begin
	IsLoading	:= true;

	AgentId		:= agid;
	SdelkaId	:= sdid;
	ObjavId		:= obid;
	GazetaId	:= gzid;
	User		:= usr;

  qTextOrigin.Close;
  qTextOrigin.ParamByName('ag_id').AsInteger := agid;
  qTextOrigin.ParamByName('sd_id').AsInteger := sdid;
  qTextOrigin.ParamByName('ob_id').AsInteger := obid;
  qTextOrigin.Open;

	IsInCurrentIssue := isInCurrIssue;

	cdsObjav.Params.ParamByName('AG_ID').AsInteger		 := agid;
	cdsDouble.Params.ParamByName('AG_ID').AsInteger		 := agid;
	cdsSdelkaPhone.Params.ParamByName('AG_ID').AsInteger := agid;

	cdsObjav.Params.ParamByName('SD_ID').AsInteger		 := sdid;
	cdsDouble.Params.ParamByName('SD_ID').AsInteger		 := sdid;
	cdsSdelkaPhone.Params.ParamByName('SD_ID').AsInteger := sdid;

	cdsObjav.Params.ParamByName('OB_ID').AsInteger		 := obid;
	cdsDouble.Params.ParamByName('OB_ID').AsInteger		 := obid;

	tblRubrika.CloneCursor(cacheData.cdsRubrika, true);
	tblRubrikaCopy.CloneCursor(cacheData.cdsRubrika, true);

	sdsRubrikaPohozha.CloneCursor(cacheData.cdsRubrikaPohozha, true);
	sdsRubrikaPohozha.Filtered := true;

 {	cdsFormat.CloneCursor(cacheData.cdsFormat, true);
	cdsFormat.Filter := 'FM_HAS_PICTURE<>1';
	cdsformat.Filtered := true;}

  cdsFormat.Close;
  cdsFormat.FetchParams;
  cdsFormat.Params.ParamByName('gz_id').AsInteger := gzid;
  cdsFormat.Open;

  cdsSiteObjavs.FetchParams;
  cdsSiteObjavs.Params.ParamByName('ob_id').AsInteger := obid;


	if (cdsObjav.Active) then cdsObjav.Close;
	if (cdsDouble.Active) then cdsDouble.Close;
	if (cdsSdelkaPhone.Active) then cdsSdelkaPhone.Close;
  if (cdsSiteObjavs.Active) then cdsSiteObjavs.Close;

	cdsObjav.Open;
	cdsDouble.Open;
  cdsSiteObjavs.Open;

	setRubrikaFilter();


	cdsSdelkaPhone.Open;

	if (cdsDouble.IsEmpty) then
	begin
		cbDoubleRubrika.Visible := false;
		cbDoDouble.Checked := false;
	end
	else
	begin
		cbDoubleRubrika.Visible := true;
		cbDoDouble.Checked := true;
	end;

	cbRubrikaSite.Enabled := cbForInternet.Checked;

	TAccessRightsManager.SetWindowAccessState(User, self);

	if (rchText.Visible) then//(fUser in [uNabor, uCorrector, uVerstka, uDesigner]) then
	begin
		rchTextChange(rchText);
		btCheckSpelling.Click;
	end;

	IsLoading := false;

	setRubrikaSiteFilter(false);
end;

procedure TfrmObjava.Cancel;
begin
  try
	cdsObjav.Cancel;
	cdsObjav.CancelUpdates;
  except end;
end;

procedure TfrmObjava.setRubrikaFilter;
var
	filter: string;
begin
	filter := '1=1';

	filter := filter + ' AND GZ_ID=' + IntToStr(GazetaId);

	if (    IsInCurrentIssue
		and data.IsAgentLocked(int2user(frmMain.currentUserType))
		and (cbFormat.KeyValue <> FORMAT_KA)
	) then
	begin
		filter := filter + ' AND (RB_IS_LOCKABLE=0';

		if (cdsObjavRB_ID.Value > 0) then
			filter := filter + ' OR RB_ID=' + cdsObjavRB_ID.AsString;
		filter := filter + ')';
	end;

	tblRubrika.Filter := filter;
	tblRubrika.Filtered := true;



	filter := '1=1';

	if (cdsDouble.IsEmpty or cdsDoubleRB_ID.IsNull) then
		filter := filter + ' AND (RB_IS_HOT=1 OR RB_IS_OBLOGKA=1)';

	if (    IsInCurrentIssue
		and data.IsAgentLocked(int2user(frmMain.currentUserType))
		and (cbFormat.KeyValue <> FORMAT_KA)
	) then
	begin
		filter := filter + ' AND (RB_IS_LOCKABLE=0';

		if (cdsDoubleRB_ID.Value > 0) then
			filter := filter + ' OR RB_ID=' + cdsDoubleRB_ID.AsString;
		filter := filter + ')';
	end;

	tblRubrikaCopy.Filter := filter;
	tblRubrikaCopy.Filtered := true;
end;

procedure TfrmObjava.cbFormatChange(Sender: TObject);
begin
	setRubrikaFilter();
end;

procedure TfrmObjava.cdsObjavAfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
	qryLogChanges.ParamByName('AG_ID').AsInteger		:= cdsObjavAG_ID.AsInteger;
	qryLogChanges.ParamByName('SD_ID').AsInteger		:= cdsObjavSD_ID.AsInteger;
	qryLogChanges.ParamByName('OB_ID').AsInteger		:= cdsObjavOB_ID.AsInteger;

	qryLogChanges.ParamByName('NEW_STATE_ID').AsInteger	:= cdsObjavOB_STATE.AsInteger;
	qryLogChanges.ParamByName('NEW_TEXT').AsString		:= cdsObjavOB_TEXT.AsString;
	qryLogChanges.ParamByName('NEW_RB_ID').AsInteger	:= cdsObjavRB_ID.AsInteger;

	qryLogChanges.ParamByName('US_ID').AsInteger		:= frmMain.currentUser;

	qryLogChanges.ExecSQL();
end;

procedure TfrmObjava.btShowAuditClick(Sender: TObject);
begin
	frmObjavaAudit.ShowObjavAudit(AgentId, ObjavId);
end;

procedure TfrmObjava.prvObjavGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
	TableName := 'OBJAV';
end;

procedure TfrmObjava.nCopyClick(Sender: TObject);
begin
    StrToClipboard(rchText.SelText);
end;

procedure TfrmObjava.nPasteClick(Sender: TObject);
begin
    rchText.PasteFromClipboard;
end;

procedure TfrmObjava.N1Click(Sender: TObject);
begin
    rchText.SelectAll;
end;

procedure TfrmObjava.rchTextEnter(Sender: TObject);
begin
    if oldText = '' then oldText := rchText.Text; 
end;

procedure TfrmObjava.N2Click(Sender: TObject);
var len, start: integer;
    s : string;
begin
      if rchText.ReadOnly  then exit;
      if trim(rchText.SelText) = '' then exit;

      start := rchText.SelStart;
      len := rchText.SelLength;

      cdsObjav.Edit;
      inc(RegisterType);
      if RegisterType > 2 then RegisterType := 0;
      case RegisterType of
        0: rchText.SelText := AnsiLowerCase(rchText.SelText);
        1: rchText.SelText := AnsiUpperCase(rchText.SelText);
        2: begin
              s := RightStr(AnsiLowerCase(rchText.SelText), length(rchText.SelText) - 1);
              rchText.SelText := AnsiUpperCase(rchText.SelText[1]) + s;
           end;
      end;

      rchText.SelStart := start;
      rchText.SelLength := len;
      cdsObjav.Post;
end;

procedure TfrmObjava.cdsObjavBeforePost(DataSet: TDataSet);
begin
      if (cdsObjavOB_STATE.AsInteger = 0) and (trim(cdsObjavOB_TEXT.AsString) <> '') then
      begin
            if not (cdsObjav.State in [dsEdit, dsInsert]) then cdsObjav.Edit;
            cdsObjavOB_STATE.AsInteger := 1;
      end;
end;

procedure TfrmObjava.brSiteObjavClick(Sender: TObject);
var Objav:TObjav;
begin
    fillchar(objav, sizeof(objav), 0);

    if cbForInternet.Checked then
          objav.rs_id := cdsObjavRS_ID.AsInteger;

    data.qEmail.Close;
    data.qEmail.ParamByName('ag_id').AsInteger := cdsObjavAG_ID.AsInteger;
    data.qEmail.ParamByName('sd_id').AsInteger := cdsObjavSD_ID.AsInteger;
    data.qEmail.Open;

    objav.ob_email := trim(data.qEmailCU_EMAIL.AsString);

    TfrmEditSiteObjav.MergeSiteObjav(Point(0, 0),
                                     cdsSiteObjavsSITE_OBJAV_ID.asInteger,
                                     GazetaId,
                                     cdsObjavOB_ID.AsInteger,
                                     0,
                                     Objav,
                                     self.ReadOnly);
end;

end.

