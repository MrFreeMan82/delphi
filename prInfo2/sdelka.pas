unit sdelka;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, Variants,
  ComCtrls, dbcgrids, sdelkaPubl, dm, FMTBcd, Provider, DBClient, SqlExpr, DBXpress,
  DBGridEh, DBCtrlsEh, DBLookupEh, globals, GridsEh, AppEvnts, SqlTimSt, ShellAPI,
  SimpleDS;

type
  TfrmSdelka = class(TFrame)
	btChooseCust: TButton;
    Label1: TLabel;
    Label2: TLabel;
    btSave: TBitBtn;
    mmComment: TDBEditEh;
    btCancel: TBitBtn;
    imgChecked: TImage;
    imgUnchecked: TImage;
    qrySdelkaOne: TSQLQuery;
    qrySdelkaOneAG_ID: TIntegerField;
	  qrySdelkaOneSD_ID: TIntegerField;
    qrySdelkaOneSD_TYPE: TSmallintField;
    qrySdelkaOneSD_STATE: TSmallintField;
    qrySdelkaOneCU_ID: TIntegerField;
    qrySdelkaOneSD_SUM: TFloatField;
    qrySdelkaOneSD_PERCENT: TFloatField;
    qrySdelkaOneSD_SUM_DEFAULT: TFloatField;
    qrySdelkaOneSD_PERCENT_DEFAULT: TFloatField;
    qrySdelkaOneSD_SKIDKA: TFloatField;
    qrySdelkaOnePT_ID: TSmallintField;
    qrySdelkaOneSD_ID_COMPOUND: TStringField;
    qrySdelkaOneGZ_ID: TSmallintField;
    qrySdelkaOneSD_SUM_PAYED: TFloatField;
    qrySdelkaOneSD_ALL_PAYED: TSmallintField;
    qrySdelkaOneSD_COMMENT_SHORT: TStringField;
    dsSdelkaOne: TDataSource;
    dsSdelkaPodacha: TDataSource;
    dsSdelkaPhone: TDataSource;
	btApprove: TBitBtn;
    edAddComment: TDBEditEh;
    btAddComment: TBitBtn;
    qryDeleteSdelka: TSQLQuery;
	qrySdelkaOneAS_ID: TSmallintField;
	txSumDefault: TDBText;
    edSum: TDBEditEh;
	Label8: TLabel;
    Label9: TLabel;
    edPercent: TDBEditEh;
    txPercentDefault: TDBText;
    Label15: TLabel;
    edPayed: TDBEditEh;
    edSkidka: TDBEditEh;
    Label12: TLabel;
    cbAllPayed: TDBCheckBoxEh;
    Shape3: TShape;
    Shape8: TShape;
    Shape9: TShape;
    edCust: TDBEditEh;
    qrySdelkaOneCU_NAME: TStringField;
    qrySdelkaOneSD_FACT_NUM: TIntegerField;
    edFactNum: TDBEditEh;
    Label3: TLabel;
    pages: TPageControl;
    pgSdelkaVGazetu: TTabSheet;
	pgSdelkaVKA: TTabSheet;
    Label11: TLabel;
    Label13: TLabel;
    imgLocked: TImage;
    cbPayType: TDBLookupComboboxEh;
    cbGazeta: TDBLookupComboboxEh;
    pnlPodacha: TPanel;
    Shape5: TShape;
    Label16: TLabel;
    grPodacha: TDBGridEh;
    btAddPodacha: TBitBtn;
    btEditPodacha: TBitBtn;
    btDeletePodacha: TBitBtn;
    cbPayTypeKA: TDBLookupComboboxEh;
	Label4: TLabel;
    edKAStartDate: TDBEditEh;
    edKAEndDate: TDBEditEh;
    Label14: TLabel;
    Label18: TLabel;
    Shape11: TShape;
    edFactDate: TDBEditEh;
    Label19: TLabel;
    imgAttn: TImage;
	edSdelkaID: TDBEditEh;
    btDropChanges: TBitBtn;
    shSumDiffers: TShape;
    shPercentDiffers: TShape;
    qrySdelkaOneSD_ID_COMPOUND_FOR_USER: TStringField;
    dsSdelkaDojnika: TDataSource;
    btCheckDoljnik: TBitBtn;
    qrySdelkaOneSD_IS_CHANGED_COPY_OF_SD_ID: TIntegerField;
    cbShowCustCode: TDBCheckBoxEh;
    qrySdelkaOneSD_SHOW_CUST_ID: TSmallintField;
    sdelkaObjavs: TfrmSdelkaPubl;
    cdsSdelkaOne: TClientDataSet;
    prvSdelkaOne: TDataSetProvider;
    qrySdelkaOneSD_COMMENT: TStringField;
    qrySdelkaOneSD_KA_START_DATE: TSQLTimeStampField;
    qrySdelkaOneSD_KA_END_DATE: TSQLTimeStampField;
    qrySdelkaOneSD_FACT_DATE: TSQLTimeStampField;
    cdsSdelkaOneAG_ID: TIntegerField;
    cdsSdelkaOneSD_ID: TIntegerField;
    cdsSdelkaOneSD_TYPE: TSmallintField;
	cdsSdelkaOneSD_STATE: TSmallintField;
    cdsSdelkaOneCU_ID: TIntegerField;
    cdsSdelkaOneSD_SUM: TFloatField;
    cdsSdelkaOneSD_PERCENT: TFloatField;
    cdsSdelkaOneSD_SUM_DEFAULT: TFloatField;
    cdsSdelkaOneSD_PERCENT_DEFAULT: TFloatField;
    cdsSdelkaOneSD_SKIDKA: TFloatField;
    cdsSdelkaOnePT_ID: TSmallintField;
    cdsSdelkaOneSD_ID_COMPOUND: TStringField;
    cdsSdelkaOneGZ_ID: TSmallintField;
	cdsSdelkaOneSD_COMMENT: TStringField;
    cdsSdelkaOneSD_SUM_PAYED: TFloatField;
    cdsSdelkaOneSD_ALL_PAYED: TSmallintField;
    cdsSdelkaOneSD_COMMENT_SHORT: TStringField;
    cdsSdelkaOneAS_ID: TSmallintField;
    cdsSdelkaOneCU_NAME: TStringField;
    cdsSdelkaOneSD_KA_START_DATE: TSQLTimeStampField;
    cdsSdelkaOneSD_KA_END_DATE: TSQLTimeStampField;
    cdsSdelkaOneSD_FACT_NUM: TIntegerField;
    cdsSdelkaOneSD_FACT_DATE: TSQLTimeStampField;
    cdsSdelkaOneSD_ID_COMPOUND_FOR_USER: TStringField;
    cdsSdelkaOneSD_IS_CHANGED_COPY_OF_SD_ID: TIntegerField;
	cdsSdelkaOneSD_SHOW_CUST_ID: TSmallintField;
    dsSdelkaOneLink: TDataSource;
    qrySdelkaPodacha: TSQLQuery;
	qrySdelkaPodachaGZ_ID: TSmallintField;
    qrySdelkaPodachaIS_ID: TIntegerField;
    qrySdelkaPodachaAG_ID: TIntegerField;
    qrySdelkaPodachaSD_ID: TIntegerField;
    qrySdelkaPodachaPD_FREE_OF_CHARGE: TSmallintField;
    qrySdelkaPodachaPD_ID: TIntegerField;
    qrySdelkaPodachaIS_NAME: TStringField;
    qrySdelkaPodachaIS_NAME_COMPOSED: TStringField;
    qrySdelkaPodachaIS_DATE: TSQLTimeStampField;
    cdsSdelkaOneqrySdelkaPodacha: TDataSetField;
    cdsSdelkaPodacha: TClientDataSet;
    cdsSdelkaPodachaPD_ID: TIntegerField;
    cdsSdelkaPodachaGZ_ID: TSmallintField;
    cdsSdelkaPodachaIS_ID: TIntegerField;
    cdsSdelkaPodachaAG_ID: TIntegerField;
    cdsSdelkaPodachaSD_ID: TIntegerField;
    cdsSdelkaPodachaPD_FREE_OF_CHARGE: TSmallintField;
    cdsSdelkaPodachaIS_NAME: TStringField;
    cdsSdelkaPodachaIS_NAME_COMPOSED: TStringField;
	cdsSdelkaPodachaIS_DATE: TSQLTimeStampField;
    spFindCopy: TSQLStoredProc;
    spBackupSdelka: TSQLStoredProc;
    spDropSdelkaChanges: TSQLStoredProc;
    qrySdelkaDoljnika: TSQLQuery;
    prvSdelkaDoljnika: TDataSetProvider;
    cdsSdelkaDoljnika: TClientDataSet;
    qrySdelkaDoljnikaAG_ID: TIntegerField;
    qrySdelkaDoljnikaSD_ID: TIntegerField;
    qrySdelkaDoljnikaSD_ID_COMPOUND: TStringField;
    qrySdelkaDoljnikaSD_SUM: TFloatField;
    qrySdelkaDoljnikaAG_NAME: TStringField;
    qrySdelkaDoljnikaPODACHA_NUMS: TStringField;
	qrySdelkaDoljnikaCU_NAME: TStringField;
    cdsDelkaDoljnikaAG_ID: TIntegerField;
	cdsDelkaDoljnikaSD_ID: TIntegerField;
    cdsDelkaDoljnikaSD_ID_COMPOUND: TStringField;
    cdsDelkaDoljnikaSD_SUM: TFloatField;
    cdsDelkaDoljnikaAG_NAME: TStringField;
    cdsDelkaDoljnikaPODACHA_NUMS: TStringField;
    cdsDelkaDoljnikaCU_NAME: TStringField;
    Shape2: TShape;
    pnlPhone: TPanel;
    Shape6: TShape;
    Label17: TLabel;
    btAddPhone: TBitBtn;
    btDeletePhone: TBitBtn;
    grPhones: TDBGridEh;
    btGenFactNum: TButton;
    spNextFactNum: TSQLStoredProc;
    qrySdelkaDoljnikaSD_FACT_NUM: TIntegerField;
    qrySdelkaDoljnikaSD_FACT_DATE: TSQLTimeStampField;
    cdsSdelkaDoljnikaSD_FACT_NUM: TIntegerField;
    cdsSdelkaDoljnikaSD_FACT_DATE: TSQLTimeStampField;
    lblIsReadOnly: TLabel;
	cbIsImportant: TDBCheckBoxEh;
    qrySdelkaOneSD_IS_IMPORTANT_FOR_SITE: TSmallintField;
    cdsSdelkaOneSD_IS_IMPORTANT_FOR_SITE: TSmallintField;
    qrySdelkaPodachaPD_IS_DONE: TSmallintField;
    cdsSdelkaPodachaPD_IS_DONE: TSmallintField;
    pgSdelkaVInternet: TTabSheet;
    cbPayTypeInternet: TDBLookupComboboxEh;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edInternetEndDate: TDBEditEh;
    edInternetStartDate: TDBEditEh;
    Label10: TLabel;
    Label20: TLabel;
    spSdelkaIsDoljnika: TSQLStoredProc;
    spSetResetSumAndPercent: TSQLStoredProc;
    qrySdelkaOneCUQ_REG_ID: TIntegerField;
    cdsSdelkaOneCUQ_REG_ID: TIntegerField;
	cbRequisite: TDBLookupComboboxEh;
    Label21: TLabel;
    qrySdelkaOneRQ_ID: TIntegerField;
    cdsSdelkaOneRQ_ID: TIntegerField;
    btnHistory: TSpeedButton;
    qrySdelkaOneREGISTERED_BY_ID: TIntegerField;
    qrySdelkaOneSD_NEW_CUST: TIntegerField;
    cdsSdelkaOneSD_NEW_CUST: TIntegerField;
    cdsSdelkaOneREGISTERED_BY_ID: TIntegerField;
    qrySdelkaPhone: TSQLQuery;
    prvSdelkaPhone: TDataSetProvider;
    cdsSdelkaPhone: TClientDataSet;
    qSdelkaPhoneAG_ID: TIntegerField;
    qSdelkaPhoneCP_NUMBER: TStringField;
    qSdelkaPhoneINTERCEPTED: TIntegerField;
    qSdelkaPhoneCU_ID: TIntegerField;
    qSdelkaPhoneCP_ADDDATE: TSQLTimeStampField;
    cdsSdelkaPhoneAG_ID: TIntegerField;
    cdsSdelkaPhoneCU_ID: TIntegerField;
    cdsSdelkaPhoneCP_NUMBER: TStringField;
    cdsSdelkaPhoneCP_ADDDATE: TSQLTimeStampField;
    cdsSdelkaPhoneINTERCEPTED: TIntegerField;
    qCustInfo: TSQLQuery;
    qLogERR: TSQLQuery;
    qrySdelkaOneSD_PAY_VER: TIntegerField;
    cdsSdelkaOneSD_PAY_VER: TIntegerField;
    dbPayVer: TDBCheckBox;
    Panel1: TPanel;
    Label22: TLabel;
    btnAddLink: TBitBtn;
    btnDelLink: TBitBtn;
    btEditLink: TBitBtn;
    cdsInet: TClientDataSet;
    prvInet: TDataSetProvider;
    qInet: TSQLQuery;
    qInetAG_ID: TIntegerField;
    qInetSD_ID: TIntegerField;
    qInetOB_LINK: TStringField;
    qInetOB_TYPE: TSmallintField;
    cdsInetAG_ID: TIntegerField;
    cdsInetSD_ID: TIntegerField;
    cdsInetOB_LINK: TStringField;
    cdsInetOB_TYPE: TSmallintField;
    grLinks: TDBGridEh;
    dsInet: TDataSource;
    sdsOB_Type: TSimpleDataSet;
    sdsOB_TypeOB_TYPE: TSmallintField;
    sdsOB_TypeSHORT_NAME: TStringField;
    cdsInetSHORT_NAME: TStringField;
    qPayHistory: TSQLQuery;
    cdsSdelkaOneSD_NUM: TStringField;
    qrySdelkaOneSD_NUM: TStringField;
    spEvent: TSQLStoredProc;
    procedure btChooseCustClick(Sender: TObject);
	procedure btSaveClick(Sender: TObject);
	procedure btAddCommentClick(Sender: TObject);
    procedure btAddPodachaClick(Sender: TObject);
    procedure btEditPodachaClick(Sender: TObject);
    procedure btDeletePodachaClick(Sender: TObject);
    procedure btAddPhoneClick(Sender: TObject);
    procedure btDeletePhoneClick(Sender: TObject);
    procedure edFactDateKeyPress(Sender: TObject; var Key: Char);
	procedure btChooseCustExit(Sender: TObject);
	procedure cbPayTypeExit(Sender: TObject);
	procedure btApproveClick(Sender: TObject);
	procedure btDropChangesClick(Sender: TObject);
	procedure cbRubrikaEnter(Sender: TObject);
	procedure btCheckDoljnikClick(Sender: TObject);
	procedure cbGazetaEnter(Sender: TObject);
	procedure sdelkaObjavsExit(Sender: TObject);
	procedure cdsSdelkaOneAfterInsert(DataSet: TDataSet);
	procedure cdsSdelkaPodachaAfterInsert(DataSet: TDataSet);
	procedure cdsSdelkaOneReconcileError(DataSet: TCustomClientDataSet;
	  E: EReconcileError; UpdateKind: TUpdateKind;
	  var Action: TReconcileAction);
	procedure btCancelClick(Sender: TObject);
	procedure cdsSdelkaOneSD_ID_COMPOUND_FOR_USERGetText(Sender: TField;
	  var Text: String; DisplayText: Boolean);
	procedure grPhonesDrawColumnCell(Sender: TObject; const Rect: TRect;
	  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
	procedure btGenFactNumClick(Sender: TObject);
	procedure sdelkaObjavsbtAddClick(Sender: TObject);
    procedure prvSdelkaOneGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure sdelkaObjavsbtAddPovtorClick(Sender: TObject);
    procedure btnHistoryClick(Sender: TObject);
    procedure cdsSdelkaOneSD_SUMChange(Sender: TField);
    procedure cdsSdelkaOneSD_STATEChange(Sender: TField);
    procedure sdelkaObjavsbtViewClick(Sender: TObject);
    procedure cdsSdelkaPhoneAfterInsert(DataSet: TDataSet);
    procedure cdsSdelkaOneAfterScroll(DataSet: TDataSet);
    procedure prvSdelkaPhoneGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure sdelkaObjavsbtHistoryClick(Sender: TObject);
    procedure cdsSdelkaOneCU_IDChange(Sender: TField);
    procedure btnAddLinkClick(Sender: TObject);
    procedure grLinksCellClick(Column: TColumnEh);
    procedure btEditLinkClick(Sender: TObject);
    procedure btnDelLinkClick(Sender: TObject);
    procedure prvInetGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure grLinksMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cdsSdelkaOneSD_NUMGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure sdelkaObjavsbtDeleteClick(Sender: TObject);
    procedure sdelkaObjavsbtEditClick(Sender: TObject);
    procedure sdelkaObjavsgrObjavsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    private
	// последние код агента и сделки, с которыми проверялся должник - используется
	// для кеширования информации о том, сделка ли это должника
	lastDoljnikAgId: integer;
	lastDoljnikSdId: integer;
	lastHasDoljnik: boolean;
  sd_num: string;
	// текущий пользователь
	fUser: TUser;

	// окно - в состоянии рид-онли?
	fReadOnly: boolean;
  old_sum_payed:double;

  fflag: boolean;     // Временный костыль для лога, не позволяющий многократно записывать лог статуса.
                      // так как лог прописан в процедуре btSaveClick, а она вызываеться не понятно как.
	procedure setUser(u: TUser);
	procedure setReadOnly(r: boolean);
	procedure SetDoljnikState;
  procedure OpenCustPhone();
  public
	AgentId, SdelkaId: integer;

	// сделка только что создана в этом окне?
	isNewSdelka: boolean;
	function hasDoljnik: boolean;
//	procedure addIssue(issue:String;year:integer;isFree:integer);
	procedure setSdelka(agent, sdelka: integer; usr: TUser; approved: boolean);
	function findCopy(agent, sdelka: integer): integer;
	procedure highlightChanges(sd: TfrmSdelka);
	procedure setSdelkaType(sdtype: integer);
  published
	// текущий пользователь в виде проперти
	property User: TUser read fUser write setUser;
	// состояние рид-онли в виде проперти
	property ReadOnly: boolean read fReadOnly write setReadOnly;

  procedure OpenInetLinks(ag_id,sd_id: integer);
  procedure AddInetLinks();
  procedure EditInetLinks();
  procedure DeleteInetLinks();
  end;


implementation

uses custForm, editPodacha, editPhone, notPayedSdelkas,
  editObjav, Reconcile, main, ReconcileFull, accessRights, uAuditSdelka;

{$R *.dfm}

// устанавливает состоянии рид-онли
procedure TfrmSdelka.setReadOnly(r:boolean);
begin
	fReadOnly := r;

	// Проставим тег в этой метке - по нему при установке
	// прав доступа будет определено, рид-онли ли форма.
    if (self.ReadOnly) then
		lblIsReadOnly.Tag := 1
    else
        lblIsReadOnly.Tag := 0;
    dbPayVer.ReadOnly := fReadOnly;
    TAccessRightsManager.SetWindowAccessState(self.User, self);
end;


// Устанавливает форме текущую сделку.
// Параметры: код агента/сделки, тип пользователя, работающего с формой,
// показывать ли только подтверждённый вариант сделки, или (если есть) -
// неподтверждённый (с неподтверждёнными менеджером изменениями). Причём
// если предполагается смотреть неподтверждённый вариант, а его нету, то
// он будет создан (значит, где-то нажато "изменить")
procedure TfrmSdelka.setSdelka(agent,sdelka:integer;usr:TUser;approved:boolean);
var
	si:integer;
begin
  fflag := false;
	AgentId := agent;
	SdelkaId := sdelka;
//*	User := usr;
	fUser := usr;

  if usr = uManager then dbPayVer.Visible := true else dbPayVer.Visible := false;

	cdsSdelkaOne.Params.ParamByName('AG_ID').AsInteger := agent;
	cdsSdelkaOne.Params.ParamByName('SD_ID').AsInteger := sdelka;
	if ((cdsSdelkaOne.Active) and (cdsSdelkaOne.UpdateStatus <> usUnmodified)) then
		cdsSdelkaOne.CancelUpdates;
	if (not cdsSdelkaOne.Active) then
		cdsSdelkaOne.Open
	else
		cdsSdelkaOne.Refresh;
	cdsSdelkaOne.First;

  old_sum_payed := cdsSdelkaOneSD_SUM_PAYED.AsFloat;

  qCustInfo.Close;
  qCustInfo.ParamByName('AG_ID').AsInteger := cdsSdelkaOneAG_ID.AsInteger;
  qCustInfo.ParamByName('CU_ID').AsInteger := cdsSdelkaOneCU_ID.AsInteger;
  qCustInfo.Open;
  edCust.Hint := qCustInfo.FieldByNaMe('CU_OKPO').AsString;

  OpenInetLinks(cdsSdelkaOneAG_ID.AsInteger, cdsSdelkaOneSD_ID.AsInteger);
 
	// будем показывать правду-матку - если есть неподтверждённые
	// изменения, то - их
	if (not approved) then
	begin
		if ((cdsSdelkaOne.FieldByName('SD_STATE').AsInteger >= SD_CURRENT)) then
		begin
			// найдём изменения, если есть...
			si := findCopy(agent,sdelka);

			// если изменений нету, а пользователь - агент, то создадим-ка ему
			// копию сделки - значит, он нажал "изменить", а не "просмотреть"
			if ((si = -1) and (usr = uAgent)) then
			begin
        sd_num := cdsSdelkaOneSD_NUM.AsString;
				spBackupSdelka.ParamByName('AG_ID').Value := agent;
				spBackupSdelka.ParamByName('SD_ID').Value := sdelka;
				spBackupSdelka.ParamByName('US_ID').Value := frmMain.currentUser;
				spBackupSdelka.ExecProc;
				si := spBackupSdelka.ParamByName('NEW_SD_ID').Value;
			end;

			if (si > 0) then
			begin
        sd_num := cdsSdelkaOneSD_NUM.AsString;
				sdelka := si;
				cdsSdelkaOne.Params.ParamByName('AG_ID').AsInteger := agent;
				cdsSdelkaOne.Params.ParamByName('SD_ID').AsInteger := sdelka;
			 	if (not cdsSdelkaOne.Active) then
					cdsSdelkaOne.Open
				else
					cdsSdelkaOne.Refresh;
			end;
		end;
	end;

	// Загрузим список объявлений
	sdelkaObjavs.SetSdelka(cdsSdelkaOne.Params.ParamByName('AG_ID').AsInteger,
						   cdsSdelkaOne.Params.ParamByName('SD_ID').AsInteger,
						   0,
						   cdsSdelkaOneGZ_ID.AsInteger,
						   cdsSdelkaOneCU_ID,
						   fUser);

//*	User:=usr;

	// Впишем вручную код клиента в поле быстрого поиска клиента
	edAddComment.Text := '';

	// Газета, КА или другой город?
	setSdelkaType(cdsSdelkaOneSD_TYPE.Value);

	// Сделка - не новая, т.к. мы её открыли по коду
	isNewSdelka := false;

	// Повыделяем везде красненьким суммы,
	// отличающиеся от дефолтных
	if (edSum.Text <> txSumDefault.Caption) then
		shSumDiffers.Visible := true
	else
		shSumDiffers.Visible := false;

	if (edPercent.Text <> txPercentDefault.Caption) then
		shPercentDiffers.Visible := true
	else
		shPercentDiffers.Visible := false;

	// Не должничок ли-с?
	SetDoljnikState;

	TAccessRightsManager.SetWindowAccessState(self.User,self);
end;


// Ищет изменённую копию сделки - возвращает код сделки, если
// нашлась.
function TfrmSdelka.findCopy(agent,sdelka:integer):integer;
begin
	spFindCopy.ParamByName('AG_ID').Value := agent;
	spFindCopy.ParamByName('SD_ID').Value := sdelka;
	spFindCopy.ExecProc;
	Result:=spFindCopy.ParamByName('COPY_SD_ID').Value;
end;

// Расставляет права пользователя
procedure TfrmSdelka.setUser(u:TUser);
begin
	fUser := u;

    TAccessRightsManager.SetWindowAccessState(self.User, self);
end;


// Выделяет жёлтым изменения в сделке относительно
// подтверждённого экземпляра. Сравнивает текущий
// экземпляр формы сделки с тем экземпляром, который
// передан, как параметр sd.
procedure TfrmSdelka.highlightChanges(sd:TfrmSdelka);
var
	ds1:TDataSet;
	ds2:TDataSet;
	changed:boolean;
begin
  if (sd.edInternetStartDate.Text <> edInternetStartDate.Text) then
    edInternetStartDate.Color := clYellow
  else
   edInternetStartDate.Color := clWindow;

  if (sd.edInternetEndDate.Text <> edInternetEndDate.Text) then
    edInternetEndDate.Color := clYellow
  else
   edInternetEndDate.Color := clWindow;

	if (sd.cbRequisite.Text <> cbRequisite.Text) then
		cbRequisite.Color := clYellow
	else
		cbRequisite.Color := clWindow;

	if (sd.cbShowCustCode.Checked <> cbShowCustCode.Checked) then
        cbShowCustCode.Color := clYellow
    else
        cbShowCustCode.Color := clBtnFace;

    if (sd.cbIsImportant.Checked <> cbIsImportant.Checked) then
        cbIsImportant.Color := clYellow
    else
        cbIsImportant.Color := clBtnFace;

	// Проверим grCust
	if (sd.cbGazeta.Text <> cbGazeta.Text) then
		cbGazeta.Color := clYellow
	else
		cbGazeta.Color := clWindow;

	if (sd.cbPayType.Text <> cbPayType.Text) then
		cbPayType.Color := clYellow
	else
		cbPayType.Color := clWindow;

	// Проверим grPodacha
	ds1 := grPodacha.DataSource.DataSet;
	ds2 := sd.grPodacha.DataSource.DataSet;
	changed := false;
	ds1.First;
	ds2.First;
	while (not ds1.Eof) do
	begin
		if (ds2.Eof) then
		begin
			changed := true;
			break;
		end;

		if ((ds1.FieldByName('IS_ID').Value <> ds2.FieldByName('IS_ID').Value)
			or
			(ds1.FieldByName('PD_FREE_OF_CHARGE').Value <> ds2.FieldByName('PD_FREE_OF_CHARGE').Value))then
		begin
			changed := true;
			break;
		end;

		ds1.Next;
		ds2.Next;
	end;

	// В одном из гридов оказалось меньше строк, чем
	// в другом?
    if ((ds1.Eof)and(not ds2.Eof)) then changed := true;
        
	if (changed) then
		grPodacha.Color := clYellow
	else
		grPodacha.Color := clBtnFace;


	// Проверим grPhones
	ds1 := grPhones.DataSource.DataSet;
	ds2 := sd.grPhones.DataSource.DataSet;
	changed := false;
	ds1.First;
	ds2.First;
	while (not ds1.Eof) do
	begin
		if (ds2.Eof) then
		begin
			changed := true;
			break;
		end;

		if (ds1.FieldByName('CP_NUMBER').Value <> ds2.FieldByName('CP_NUMBER').Value) then
		begin
			changed := true;
			break;
		end;

		ds1.Next;
		ds2.Next;
	end;
	if (not ds2.Eof) then
		changed := true;
	if (changed) then
		grPhones.Color := clYellow
	else
		grPhones.Color := clBtnFace;


	// Проверим grObjavs
	ds1 := sdelkaObjavs.grObjavs.DataSource.DataSet;
	ds2 := sd.sdelkaObjavs.grObjavs.DataSource.DataSet;
	changed := false;
	ds1.First;
	ds2.First;
	while (not ds1.Eof) do
	begin
		if (ds2.Eof) then
		begin
			changed := true;
			break;
		end;

    sdelkaObjavs.objavChanged := false;
		if ((ds1.FieldByName('FM_NAME').Value <> ds2.FieldByName('FM_NAME').Value)
			or
			(ds1.FieldByName('RB_NAME').Value <> ds2.FieldByName('RB_NAME').Value)
			or
			(ds1.FieldByName('OB_COMMENT').Value <> ds2.FieldByName('OB_COMMENT').Value)
			or
			(ds1.FieldByName('OB_IS_ACTIVE').Value <> ds2.FieldByName('OB_IS_ACTIVE').Value)
			or
			(ds1.FieldByName('OB_TEXT').Value <> ds2.FieldByName('OB_TEXT').Value)
			or
			(ds1.FieldByName('DOUBLE_RB_NAME').Value <> ds2.FieldByName('DOUBLE_RB_NAME').Value)
      or
      (ds1.FieldByName('MDL_TEXT').Value <> ds2.FieldByName('MDL_TEXT').Value)
			)then
		begin
			changed := true;
      sdelkaObjavs.objavChanged := true;
			break;
		end;

		ds1.Next;
		ds2.Next;
	end;
	if (not ds2.Eof) then changed := true;
	if (not ds2.Eof) then changed := true;

	if (changed) then
  begin
    sdelkaObjavs.managerView := true;
    if (ds1.RecordCount <> ds2.RecordCount) then
	 	sdelkaObjavs.grObjavs.Color := clYellow
  end
	else begin
    sdelkaObjavs.managerView := false;
		sdelkaObjavs.grObjavs.Color := clBtnFace;
  end;


	// Проверим всякие отдельные Edit'ы и проч.
	if (sd.edSum.Text <> edSum.Text) then
		edSum.Color := clYellow
	else
		edSum.Color := clWindow;

	if (sd.txSumDefault.Caption <> txSumDefault.Caption) then
		txSumDefault.Color := clYellow
	else
		txSumDefault.Color := clBtnFace;

	if (sd.edPercent.Text <> edPercent.Text) then
		edPercent.Color := clYellow
	else
		edPercent.Color := clWindow;
      
	if (sd.txPercentDefault.Caption <> txPercentDefault.Caption) then
		txPercentDefault.Color := clYellow
	else
		txPercentDefault.Color := clBtnFace;

	if (sd.edSkidka.Text <> edSkidka.Text) then
		edSkidka.Color := clYellow
	else
		edSkidka.Color := clWindow;

	if (sd.edPayed.Text <> edPayed.Text) then
		edPayed.Color := clYellow
	else
		edPayed.Color := clWindow;

	if (sd.edFactNum.Text <> edFactNum.Text) then
		edFactNum.Color := clYellow
	else
		edFactNum.Color := clWindow;

	if (sd.cbAllPayed.Checked <> cbAllPayed.Checked) then
		cbAllPayed.Color := clYellow
	else
		cbAllPayed.Color := clBtnFace;

	if (sd.mmComment.Text <> mmComment.Text) then
		mmComment.Color := clYellow
	else
		mmComment.Color := clWindow;
end;


// Устанавливает тип сделки (Газета/КА)
procedure TfrmSdelka.setSdelkaType(sdtype:integer);
begin
	if (cdsSdelkaOneSD_TYPE.Value <> sdtype) then
	begin
		if (not (cdsSdelkaOne.State in [dsInsert, dsEdit])) then
			cdsSdelkaOne.Edit;
		cdsSdelkaOneSD_TYPE.Value := sdtype;
	end;

	if (sdtype=SD_TYPE_GAZETA) then
	begin
		pgSdelkaVGazetu.Enabled		:= true;
		pgSdelkaVKA.Enabled			:= false;
		pgSdelkaVInternet.Enabled	:= false;
		pages.ActivePage			:= pgSdelkaVGazetu;
	end
	else if (sdtype=SD_TYPE_KA) then
	begin
		pgSdelkaVGazetu.Enabled		:= false;
		pgSdelkaVKA.Enabled		:= true;
		pgSdelkaVInternet.Enabled	:= false;
		pages.ActivePage		:= pgSdelkaVKA;
	end
	else if (sdtype in [SD_TYPE_INTERNET, SD_TYPE_INT_REGION]) then
	begin
		pgSdelkaVGazetu.Enabled		:= false;
		pgSdelkaVKA.Enabled		:= false;
		pgSdelkaVInternet.Enabled	:= true;
		pages.ActivePage		:= pgSdelkaVInternet;
    if sdtype = SD_TYPE_INTERNET
    then Label20.Caption := 'Сделка в интернет'
    else Label20.Caption := 'Сделка в интернет (регионы)';

	end;
end;


// Выбираем клиента
procedure TfrmSdelka.btChooseCustClick(Sender: TObject);
begin
	if (frmCustForm.SelectCust(false)) then
	begin
		if (not (cdsSdelkaOne.State in [dsEdit, dsInsert])) then
			cdsSdelkaOne.Edit;
		cdsSdelkaOne.FieldByName('CU_ID').Value  := data.cdsCustCU_ID.Value;
		cdsSdelkaOne.FieldByName('CU_NAME').Text := data.cdsCustCU_NAME.Value;
		cdsSdelkaOne.FieldByName('CUQ_REG_ID').AsInteger := data.cdsCustCUQ_REG_ID.AsInteger;
    self.OpenCustPhone();

    if data.cdsCustCU_COMPANY_ID.IsNull then
      MessageBox(Application.Handle, 'У компании не зарегистрирован "ИД Компании"', 'Внимание', MB_OK or MB_ICONWARNING);
	end;
end;


// Сохраняем изменения
procedure TfrmSdelka.btSaveClick(Sender: TObject);
begin
	// Проверим: если форма оплаты - безнал, то должны быть
	// указаны номер и дата счёта-фактуры
	if (Sender <> nil) then
		if ((cdsSdelkaOnePT_ID.AsInteger = PAY_BEZNAL)and
			((cdsSdelkaOneSD_FACT_NUM.AsString = '') or (cdsSdelkaOneSD_FACT_DATE.AsString = ''))) then
		begin
			if (MessageDlg('Для безналичной сделки нужно обязательно указать номер и дату счёта-фактуры -'
						   +#10#13+'вы действительно хотите продолжить?',
						   mtConfirmation, [mbYes,mbNo], 0) = mrNo) then
			Abort;
		end;

    if cdsSdelkaOneCU_ID.IsNull then
    begin
      MessageDlg('Не указан клиент! ', mtError, [mbOk], 0);
      Abort
    end;

  // Проверим: если форма оплаты - безнал,
  // то номер счета фактуры не должен повторяться в течении месяца
  if ((Sender <> nil) and (cdsSdelkaOnePT_ID.AsInteger in [PAY_BEZNAL,PAY_KASSA])) and ((cdsSdelkaOneSD_FACT_NUM.OldValue <> cdsSdelkaOneSD_FACT_NUM.NewValue) or
      (cdsSdelkaOneCU_ID.OldValue <> cdsSdelkaOneCU_ID.NewValue) or (cdsSdelkaOneSD_FACT_DATE.OldValue <> cdsSdelkaOneSD_FACT_DATE.NewValue)) then
  begin
     if not data.IsValidFactNum(cdsSdelkaOneSD_FACT_NUM.AsInteger, cdsSdelkaOneSD_FACT_DATE.AsDateTime, Trim(qCustInfo.FieldByName('CU_OKPO').AsString)) then
     begin
      MessageDlg('Одни и тот же номер счета-фактуры, не может использоваться для разных фирм в течении месяца! ', mtError, [mbOk], 0);
      Abort
    end
  end;


	// Для безнальных сделок у клиента должны быть внесены бух. данные
	if (Sender <> nil) then
		if ((cdsSdelkaOnePT_ID.AsInteger = PAY_BEZNAL) and
			not (cdsSdelkaOneCUQ_REG_ID.AsInteger > 0)) then
		begin
			if (MessageDlg('У клиента безналичной сделки обязательно должны быть внесены бухгалтерские данные.'
						   +#10#13+'Вы действительно хотите продолжить?',
						   mtConfirmation,[mbYes,mbNo], 0) = mrNo) then
			Abort;
		end;

 // SetNewCust();
	cdsSdelkaOne.CheckBrowseMode;
	cdsSdelkaPhone.CheckBrowseMode;
	cdsSdelkaPodacha.CheckBrowseMode;
	sdelkaObjavs.cdsObjav.CheckBrowseMode;

	// Стартуем транзакцию
	data.connection.StartTransaction(tr);

	// Записываем изменения
	if (data.connection.InTransaction) then
		cdsSdelkaOne.ApplyUpdates(0);

	if (data.connection.InTransaction) then
		sdelkaObjavs.cdsObjav.ApplyUpdates(0);


  if (data.connection.InTransaction) and not cdsInet.IsEmpty then
  begin
     cdsInet.First;

     while not cdsInet.Eof do
     begin
         if not (cdsInet.State in [dsEdit, dsInsert]) then cdsInet.Edit;
         cdsInetSD_ID.AsInteger := SdelkaID;
         cdsInetAG_ID.AsInteger := AgentID;

         cdsInet.Next;
     end;

     cdsInet.ApplyUpdates(0);
  end;

	spSetResetSumAndPercent.ParamByName('AG_ID').AsInteger := cdsSdelkaOneAG_ID.AsInteger;
	spSetResetSumAndPercent.ParamByName('SD_ID').AsInteger := cdsSdelkaOneSD_ID.AsInteger;
	if (isNewSdelka) then
  begin
		spSetResetSumAndPercent.ParamByName('RESET').AsInteger := 1;    // old 1
  //  isNewSdelka := false;
  end
	else
		spSetResetSumAndPercent.ParamByName('RESET').AsInteger := 0;
	spSetResetSumAndPercent.ExecProc();

  if(old_sum_payed <> cdsSdelkaOneSD_SUM_PAYED.AsFloat) then
  begin
     qPayHistory.ParamByName('ag_id').AsInteger := cdsSdelkaOneAG_ID.AsInteger;
     qPayHistory.ParamByName('sd_id').AsInteger := cdsSdelkaOneSD_ID.AsInteger;
     qPayHistory.ParamByName('pay_sum').AsFloat := cdsSdelkaOneSD_SUM_PAYED.AsFloat;
     qPayHistory.ParamByName('us_id').AsInteger := frmMain.currentUser;
     qPayHistory.ExecSQL();
  end;

  if fflag then
  begin
      data.LogSdelka(cdsSdelkaOneAG_ID.AsInteger, cdsSdelkaOneSD_ID.AsInteger, frmMain.currentUser);
      fflag := false;
  end;

  spEvent.ParamByName('ev_id').AsInteger := 1;
  spEvent.ExecProc;

  spEvent.ParamByName('ev_id').AsInteger := 2;
  spEvent.ExecProc;
	// Подтверждаем/откатываем транзакцию, вложенные датасеты
	// не трогаем - с ними всё автоматом произойдёт
  if (data.connection.InTransaction) then
      data.connection.Commit(tr)
  else begin
        cdsSdelkaOne.CancelUpdates;
        cdsSdelkaOne.Refresh;
        sdelkaObjavs.cdsObjav.CancelUpdates;
        sdelkaObjavs.cdsObjav.Refresh;
	end;
end;


// Добавим новый комментарий к имеющимся
procedure TfrmSdelka.btAddCommentClick(Sender: TObject);
begin
	if (not (cdsSdelkaOne.State in [dsEdit,dsInsert])) then
		cdsSdelkaOne.Edit;
	cdsSdelkaOne.FieldByName('SD_COMMENT').AsString := cdsSdelkaOne.FieldByName('SD_COMMENT').AsString + ' ['+DateToStr(Date) + ']>> ' + edAddComment.Text;
	edAddComment.Text := '';
	cdsSdelkaOne.CheckBrowseMode;
end;

// Добавим подачу
procedure TfrmSdelka.btAddPodachaClick(Sender: TObject);
begin
	frmEditPodacha.Add(dsSdelkaPodacha,dsSdelkaOne, not sdelkaObjavs.cdsObjav.IsEmpty);
 // SetNewCust();
end;


// Отредактируем подачу, учтём, что можно редактировать
// только будущие выходы
procedure TfrmSdelka.btEditPodachaClick(Sender: TObject);
begin
	if (cdsSdelkaPodachaPD_IS_DONE.AsInteger = 0) then
		frmEditPodacha.Edit(dsSdelkaPodacha,dsSdelkaOne)
    else
		MessageDlg('Нельзя редактировать подачи, которые уже вышли.', mtError, [mbOk], 0);
end;


// Удалим подачу. Учтём, что удалить можно только будущую подачу.
procedure TfrmSdelka.btDeletePodachaClick(Sender: TObject);
begin
	if (cdsSdelkaPodachaPD_IS_DONE.AsInteger = 0) then
    	cdsSdelkaPodacha.Delete
    else
		MessageDlg('Нельзя удалить подачи, которые уже вышли.', mtError, [mbOk], 0);
end;


// Добавим телефон к сделке
procedure TfrmSdelka.btAddPhoneClick(Sender: TObject);
begin
	frmEditPhone.addModal(dsSdelkaPhone);
end;


// Удалим телефон у сделки
procedure TfrmSdelka.btDeletePhoneClick(Sender: TObject);
var qDel: TSQLQuery;
begin
	if ((not cdsSdelkaPhoneCP_ADDDATE.IsNull) and ((Date+Time-cdsSdelkaPhoneCP_ADDDATE.AsDateTime) <= 1 / 24)) then
  begin
    qDel := TSQLQuery.Create(nil);
    qDel.SQLConnection := data.connection;
    qDel.SQL.Append('DELETE FROM cust_phone cp WHERE cp.ag_id = :ag_id AND cp.cu_id = :cu_id AND cp.cp_number = :cp_num');
    qDel.Params.ParamByName('ag_id').AsInteger := cdsSdelkaPhoneAG_ID.AsInteger;
    qDel.Params.ParamByName('cu_id').AsInteger := cdsSdelkaPhoneCU_ID.AsInteger;
    qDel.Params.ParamByName('cp_num').AsString := cdsSdelkaPhoneCP_NUMBER.AsString;
    qDel.ExecSQL();
    cdsSdelkaPhone.Refresh;
  end
	else
		MessageDlg('Здесь удалить можно только что заведенный телефон.', mtConfirmation, [mbOk], 0);
end;


// Сохранение изменений и закрытие формы при нажатии "Enter"
procedure TfrmSdelka.edFactDateKeyPress(Sender: TObject; var Key: Char);
begin
	if (Key = #13) then
		if ((btSave.Visible) and (btSave.Enabled)) then
			btSave.Click;
end;


// После выбора клиента - перейдём к нужному контролу
// в зависимости о того, сделка это в Газету или в КА.
procedure TfrmSdelka.btChooseCustExit(Sender: TObject);
begin
	if (pages.ActivePage = pgSdelkaVGazetu) then
	begin
		if (cbGazeta.Enabled) then
			cbGazeta.SetFocus;
	end
	else if (pages.ActivePage = pgSdelkaVKA) then
	begin
		if (cbPayTypeKA.Enabled) then
			cbPayTypeKA.SetFocus;
	end
	else if (pages.ActivePage = pgSdelkaVInternet) then
	begin
		if (cbPayTypeInternet.Enabled) then
			cbPayTypeInternet.SetFocus;
	end
end;


// После выбора способа оплаты - посмотрим снова на то, чего у нас в форме
//разрешено/запрещено редактировать (номер/дата счёта)
procedure TfrmSdelka.cbPayTypeExit(Sender: TObject);
begin
	cdsSdelkaOne.CheckBrowseMode;

    TAccessRightsManager.SetWindowAccessState(self.User,self);

	if ((edFactNum.ReadOnly) and (cdsSdelkaOneSD_STATE.Value < SD_TO_PAY)) then
	begin
		if (not (cdsSdelkaOne.State in [dsEdit,dsInsert])) then
			cdsSdelkaOne.Edit;
		cdsSdelkaOneSD_FACT_NUM.Clear;
		cdsSdelkaOneSD_FACT_DATE.Clear;
		cdsSdelkaOne.CheckBrowseMode;
	end;


    // После установки прав сбивается активный контрол (наверное из-за
    // того, что в какой-то момент его запрещают, и он теряет фокус, а
    // потом - снова разрешают, но фокус уже "ушёл". Поэтому проставим
    // фокус заново "вручную".
    if (Sender = cbPayTypeKA) then
        edKAStartDate.SetFocus
    else if (Sender = cbPayTypeInternet) then
        edInternetStartDate.SetFocus
    else
    begin
        if ((btAddPodacha.Enabled) and (btAddPodacha.Visible)) then
        begin
//            btAddPodacha.Default:=true;
            btAddPodacha.SetFocus;
        end;
	end;
end;


// Менеджер подтверждает изменения в сделке
procedure TfrmSdelka.btApproveClick(Sender: TObject);
begin
	if (cdsSdelkaOneAS_ID.Value = 2) then
	begin
		data.spApproveSdelka.ParamByName('AG_ID').AsInteger := cdsSdelkaOneAG_ID.AsInteger;
		data.spApproveSdelka.ParamByName('SD_ID').AsInteger := cdsSdelkaOneSD_ID.AsInteger;
		data.spApproveSdelka.ParamByName('US_ID').AsInteger := frmMain.currentUser;
		data.spApproveSdelka.ExecProc;
	end
  else if cdsSdelkaOneAS_ID.Value = 1 then
  begin
       if not (cdsSdelkaOne.State in [dsEdit, dsInsert]) then cdsSdelkaOne.Edit;
       cdsSdelkaOneAS_ID.Value := 0;
       cdsSdelkaOne.Post;
       cdsSdelkaOne.ApplyUpdates(0);
       data.LogSdelka(cdsSdelkaOneAG_ID.AsInteger, cdsSdelkaOneSD_ID.AsInteger, frmMain.currentUser);
  end;
end;


// Отмена всех неподтверждённых изменений в сделке и
// уделение изменённой копии из БД.
procedure TfrmSdelka.btDropChangesClick(Sender: TObject);
begin
	if (cdsSdelkaOneAS_ID.Value = 2) then
	begin
		sdelkaObjavs.cdsObjav.CancelUpdates;
		cdsSdelkaOne.CancelUpdates;

		spDropSdelkaChanges.ParamByName('AG_ID').AsInteger := cdsSdelkaOneAG_ID.AsInteger;
		spDropSdelkaChanges.ParamByName('SD_ID').AsInteger := cdsSdelkaOneSD_ID.AsInteger;
		spDropSdelkaChanges.ParamByName('US_ID').AsInteger := frmMain.currentUser;
		spDropSdelkaChanges.ExecProc;
	end
end;


// Открываем выпадающий список при входе в него
procedure TfrmSdelka.cbRubrikaEnter(Sender: TObject);
begin
	(Sender as TDBLookupComboBoxEh).DropDown;
end;


// Возвращает "истину", если с одним из телефонов сделки
// связаны неоплаченные сделки
function TfrmSdelka.hasDoljnik:boolean;
begin
	Result := false;

	if (User <> uManager) then exit;

	// Проверим - если уже проверялись должники с этой сделки,
	// то не будем проверять ещё раз
	if (    (lastDoljnikAgId = cdsSdelkaOneAG_ID.AsInteger)
		and (lastDoljnikSdId = cdsSdelkaOneSD_ID.AsInteger)) then
	begin
		Result := lastHasDoljnik;

		exit;
	end;

	spSdelkaIsDoljnika.ParamByName('AG_ID_INPUT').AsInteger := cdsSdelkaOneAG_ID.AsInteger;
	spSdelkaIsDoljnika.ParamByName('SD_ID_INPUT').AsInteger := cdsSdelkaOneSD_ID.AsInteger;
	spSdelkaIsDoljnika.ExecProc();
	if (spSdelkaIsDoljnika.ParamByName('RESULT').AsInteger = 1) then
		Result := true
	else
		Result := false;

	// Кешируем информацию о том, является ли клиент должником
	lastDoljnikAgId := cdsSdelkaOneAG_ID.AsInteger;
	lastDoljnikSdId := cdsSdelkaOneSD_ID.AsInteger;
	lastHasDoljnik  := Result;
end;


// Показываем список долгов, связанных с телефонами сделки
procedure TfrmSdelka.btCheckDoljnikClick(Sender: TObject);
var
	frmNotPayed:TfrmNotPayedSdelkas;
begin
    frmNotPayed := nil;
    
	cdsSdelkaDoljnika.Params.ParamByName('AG_ID').AsInteger := cdsSdelkaOneAG_ID.AsInteger;
	cdsSdelkaDoljnika.Params.ParamByName('SD_ID').AsInteger := cdsSdelkaOneSD_ID.AsInteger;
	if (not cdsSdelkaDoljnika.Active) then
		cdsSdelkaDoljnika.Open
	else
		cdsSdelkaDoljnika.Refresh;

	try
		frmNotPayed := TfrmNotPayedSdelkas.Create(self,dsSdelkaDojnika);
		frmNotPayed.ShowModal;
	finally
		if (Assigned(frmNotPayed)) then frmNotPayed.Free;
	end;
end;


// Откроем выпадающее меню при входе в него
procedure TfrmSdelka.cbGazetaEnter(Sender: TObject);
begin
	(Sender as TDBLookupComboBoxEh).DropDown;
end;


// Сохраним сделку и список объявлений при выходе из
// списка объявлений, и обновим всю информацию - заодно
// получим рассчётные стоимость и процент для сделки
procedure TfrmSdelka.sdelkaObjavsExit(Sender: TObject);
begin
	btSaveClick(nil);

	if (not cdsSdelkaOne.Active) then
		cdsSdelkaOne.Open
	else
		cdsSdelkaOne.Refresh;

    sdelkaObjavs.SetSdelka(cdsSdelkaOneAG_ID.AsInteger,
						   cdsSdelkaOneSD_ID.AsInteger,
						   0,
						   cdsSdelkaOneGZ_ID.AsInteger,
						   cdsSdelkaOneCU_ID,
						   User);

	SetDoljnikState;
end;


// Проставим значения полей сделки по умолчанию, загрузим
// новую сделку в форму
procedure TfrmSdelka.cdsSdelkaOneAfterInsert(DataSet: TDataSet);
begin
	SdelkaId := data.nextGeneratorId('G_SD_ID');
	cdsSdelkaOneSD_ID.Value						   	:= SdelkaId;
	cdsSdelkaOne.Params.ParamByName('SD_ID').Value 	:= SdelkaId;
  cdsSdelkaOneREGISTERED_BY_ID.Value := frmmain.currentUser;
	cdsSdelkaOnePT_ID.Value						   	:= 1;
	cdsSdelkaOneRQ_ID.Value							:= 1;
	cdsSdelkaOneSD_TYPE.Value					   	:= SD_TYPE_GAZETA;
	cdsSdelkaOneSD_STATE.Value					   	:= 1;
	cdsSdelkaOneSD_SKIDKA.Value						:= 0;
	cdsSdelkaOneGZ_ID.Value							:= 1;
	cdsSdelkaOneSD_ALL_PAYED.Value					:= 0;
	cdsSdelkaOneAS_ID.Value							:= 0;
	cdsSdelkaOneSD_SHOW_CUST_ID.Value				:= 1;
  cdsSdelkaOneSD_IS_IMPORTANT_FOR_SITE.Value		:= 0;
  cdsSdelkaOneSD_KA_END_DATE.AsVariant := null;
  cdsSdelkaOneSD_KA_START_DATE.AsVariant := null;
  cdsSdelkaOneSD_NEW_CUST.AsInteger := 0;
  cdsSdelkaOneSD_SUM_PAYED.AsFloat := 0;
  cdsSdelkaOneSD_PAY_VER.AsInteger := 0;
  cdsSdelkaOneSD_NUM.AsString := IntToStr(cdsSdelkaOne.Params.ParamByName('AG_ID').AsInteger) + '-' +
                                 IntToStr(data.nextGeneratorId('GEN_SD_NUM'));

  sdelkaObjavs.SetSdelka(cdsSdelkaOne.Params.ParamByName('AG_ID').AsInteger,
                         cdsSdelkaOne.Params.ParamByName('SD_ID').AsInteger,
						   0,
						   cdsSdelkaOneGZ_ID.AsInteger,
                           cdsSdelkaOneCU_ID,
                           fUser);
end;


// Проставим значения полей подачи по умолчанию
procedure TfrmSdelka.cdsSdelkaPodachaAfterInsert(DataSet: TDataSet);
begin
	cdsSdelkaPodachaAG_ID.Value := dsSdelkaOne.DataSet.FieldByName('AG_ID').AsInteger;
	cdsSdelkaPodachaSD_ID.Value := dsSdelkaOne.DataSet.FieldByName('SD_ID').AsInteger;
	cdsSdelkaPodachaPD_ID.Value := data.nextGeneratorId('G_PD_ID');
end;


// Проставим значения полей телефона сделки по умолчанию
procedure TfrmSdelka.cdsSdelkaPhoneAfterInsert(DataSet: TDataSet);
begin

	cdsSdelkaPhoneAG_ID.Value := dsSdelkaOne.DataSet.FieldByName('AG_ID').AsInteger;
	cdsSdelkaPhoneCU_ID.Value := dsSdelkaOne.DataSet.FieldByName('CU_ID').AsInteger;
	cdsSdelkaPhoneCP_ADDDATE.AsDateTime := Now();
end;


// Ошибка сохраненния в БД? Обработаем стандартным обработчиком.
procedure TfrmSdelka.cdsSdelkaOneReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);

var T:TTransactionDesc;
begin
  T.TransactionID := 2;
	T.IsolationLevel := xilREADCOMMITTED;

  data.connection.StartTransaction(T);
  qLogERR.ParamByName('US_ID').AsInteger := frmMain.currentUser;
  qLogErr.ParamByName('ERR_TEXT').AsString := E.Message;
  qLogErr.ParamByName('AG_ID').AsInteger := DataSet.fieldByName('AG_ID').AsInteger;
  qLogErr.ParamByName('SD_ID').AsInteger := DataSet.FieldByNAme('SD_ID').AsInteger;
  qLogErr.ParamByName('ERR_DATE').AsSQLTimeStamp := DateTimeToSQLTimeStamp(NOW);
  qLogErr.ParamByName('ERR_CTX').AsString := E.Context;
  qLogErr.ExecSQL();
  data.connection.Commit(T);

	if (data.connection.InTransaction) then
		data.connection.Rollback(tr);
	Action := HandleReconcileError(DataSet, UpdateKind, E, '');
end;


// Отмена несохранённых изменений...
procedure TfrmSdelka.btCancelClick(Sender: TObject);
begin
    sdelkaObjavs.cdsObjav.CancelUpdates;
    cdsSdelkaOne.CancelUpdates;
end;


// Возвращает код сделки. Причём если это - изменённая копия
// другой сделки, то возвращает код "родительской" сделки
// и ставит возле него "*"
procedure TfrmSdelka.cdsSdelkaOneSD_ID_COMPOUND_FOR_USERGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
	if (not Sender.DataSet.IsEmpty) then
	begin
		if (Sender.DataSet.FieldByName('AS_ID').Value <> 2) then
			Text := Sender.DataSet.FieldByName('SD_ID_COMPOUND').AsString
		else
			Text := Sender.DataSet.FieldByName('AG_ID').AsString + '-' + Sender.DataSet.FieldByName('SD_IS_CHANGED_COPY_OF_SD_ID').AsString + '*';
	end;
end;


// Рисуем список телефонов: "замочки" возле телефонов клиента,
// красным цветом - пересечения.
procedure TfrmSdelka.grPhonesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
	cl:TColor;
begin
	if (Column.FieldName = 'INTERCEPTED') then
	begin
		if ((Column.Field.AsInteger = 1) and (User = uManager)) then
		begin
			cl := grPhones.Canvas.Brush.Color;
			grPhones.Canvas.Brush.Color := clRed;
			grPhones.Canvas.FillRect(Rect);
			grPhones.Canvas.Brush.Color := cl;
		end
		else
			grPhones.Canvas.FillRect(Rect);
	end;
end;


// Сгенерируем автоматом номер счёта-фатуры
procedure TfrmSdelka.btGenFactNumClick(Sender: TObject);
//var
//	factNum:string;
begin
    // Пока эта функция не используется - агенты по-старому вводят
    // номера счетов вручную
{
	spNextFactNum.ParamByName('AG_ID').Value:=cdsSdelkaOne.Params.ParamByName('AG_ID').AsInteger;
	spNextFactNum.ExecProc;

	factNum:=IntToStr(cdsSdelkaOne.Params.ParamByName('AG_ID').AsInteger);
	while (length(factNum)<3) do
		factNum:='9'+factNum;

	factNum:=factNum+spNextFactNum.ParamByName('FACT_NUM').AsString;

	if (not (cdsSdelkaOne.State in [dsEdit,dsInsert])) then
		cdsSdelkaOne.Edit;
	cdsSdelkaOneSD_FACT_NUM.AsString:=factNum;
	cdsSdelkaOneSD_FACT_DATE.AsDateTime:=Date;
	cdsSdelkaOne.CheckBrowseMode;
}
end;


// Должник - выходи, подлый трус!
procedure TfrmSdelka.SetDoljnikState;
begin
	if (hasDoljnik()) then
		btCheckDoljnik.Font.Color := clRed
	else
		btCheckDoljnik.Font.Color := clWindowText;
end;

procedure TfrmSdelka.sdelkaObjavsbtAddClick(Sender: TObject);
begin
  sdelkaObjavs.btAddClick(Sender);

end;

procedure TfrmSdelka.prvSdelkaOneGetTableName(Sender: TObject; DataSet: TDataSet; var TableName: String);
begin
	if (DataSet = qrySdelkaPhone) then TableName := 'CUST_PHONE';
end;

procedure TfrmSdelka.sdelkaObjavsbtAddPovtorClick(Sender: TObject);
begin
  sdelkaObjavs.btAddPovtorClick(Sender);

end;

procedure TfrmSdelka.btnHistoryClick(Sender: TObject);
begin
    TfrmSdelkaHistory.ShowAudit(SdelkaId, AgentID);
end;

procedure TfrmSdelka.cdsSdelkaOneSD_SUMChange(Sender: TField);
begin

    isNewSdelka := false;     // Отключим признак новой сделки здесь
                              // Иначе сумма сделки будет перезаписываться на расчетную  см. процедуру SET_RESET_SUM_AND_PERCENT
                              // В не зависимости от ручного ввода.
end;

procedure TfrmSdelka.cdsSdelkaOneSD_STATEChange(Sender: TField);
begin
       fflag := true;
end;

procedure TfrmSdelka.sdelkaObjavsbtViewClick(Sender: TObject);
begin
  sdelkaObjavs.btViewClick(Sender);

end;

procedure TfrmSdelka.OpenCustPhone;
begin
    cdsSdelkaPhone.Close;
    cdsSdelkaPhone.FetchParams;
    cdsSdelkaPhone.Params.ParamByName('AG_ID').AsInteger := cdsSdelkaOne.FieldByName('AG_ID').AsInteger;
    cdsSdelkaPhone.Params.ParamByName('CU_ID').AsInteger := cdsSdelkaOne.FieldByName('CU_ID').AsInteger;
    cdsSdelkaPhone.Open;
end;

procedure TfrmSdelka.cdsSdelkaOneAfterScroll(DataSet: TDataSet);
begin
       OpenCustPhone
end;

procedure TfrmSdelka.prvSdelkaPhoneGetTableName(Sender: TObject; DataSet: TDataSet; var TableName: String);
begin
   TableName := 'CUST_PHONE';
end;

procedure TfrmSdelka.sdelkaObjavsbtHistoryClick(Sender: TObject);
begin
  sdelkaObjavs.btHistoryClick(Sender);

end;

procedure TfrmSdelka.cdsSdelkaOneCU_IDChange(Sender: TField);
begin
  qCustInfo.Close;
  qCustInfo.ParamByName('AG_ID').AsInteger := cdsSdelkaOneAG_ID.AsInteger;
  qCustInfo.ParamByName('CU_ID').AsInteger := cdsSdelkaOneCU_ID.AsInteger;
  qCustInfo.Open;
  edCust.Hint := qCustInfo.FieldByNaMe('CU_OKPO').AsString;
end;

procedure TfrmSdelka.AddInetLinks;
var s:string;
begin
    s := InputBox('Prinfo', 'Добавить ссылку','');
    if (s <> '') and not cdsSdelkaOneSD_ID.IsNull then
    begin
        cdsInet.Append;
        cdsInetAG_ID.AsInteger := SdelkaId;
        cdsInetSD_ID.AsInteger := AgentId;
        cdsInetOB_LINK.AsString := s;
        cdsInetOB_TYPE.AsInteger := 0;
        cdsInet.Post;
    end;
end;

procedure TfrmSdelka.DeleteInetLinks;
begin
    if not cdsInet.IsEmpty then cdsInet.Delete;
end;

procedure TfrmSdelka.EditInetLinks;
var s:string;
begin
    s := InputBox('Prinfo', 'Редактировать ссылку', cdsInetOB_LINK.AsString);
    if (s <> '') and (s <> cdsInetOB_LINK.AsString) then
    begin
        cdsInet.Edit;
        cdsInetOB_LINK.AsString := s;
        cdsInet.Post;
    end
end;

procedure TfrmSdelka.OpenInetLinks(ag_id, sd_id: integer);
begin
    if not sdsOB_Type.Active then sdsOB_Type.Open;
    cdsInet.Close;
    cdsInet.FetchParams;
    cdsInet.Params.ParamByName('ag_id').AsInteger := ag_id;
    cdsInet.Params.ParamByName('sd_id').AsInteger := sd_id;
    cdsInet.Open;
end;

procedure TfrmSdelka.btnAddLinkClick(Sender: TObject);
begin
    AddInetLinks();
end;

procedure TfrmSdelka.grLinksCellClick(Column: TColumnEh);
var l:string;
begin
    l := Column.Field.AsString;
    if (Column.FieldName = 'OB_LINK') and (l <> '') then
    begin
        ShellExecute(Handle, 'open', PAnsiChar(l), nil, nil, SW_SHOWNORMAL);
    end;
end;

procedure TfrmSdelka.btEditLinkClick(Sender: TObject);
begin
   EditInetLinks();
end;

procedure TfrmSdelka.btnDelLinkClick(Sender: TObject);
begin
   DeleteInetLinks();
end;

procedure TfrmSdelka.prvInetGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
   TableName := 'SD_INET_OB'
end;

procedure TfrmSdelka.grLinksMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var gPT: TGridCoord;
begin
   if not cdsInet.IsEmpty then
   begin
      gPT := grLinks.MouseCoord(X, Y);

      if (gPT.X > 0) and (gPT.X = 1)
      then grLinks.Cursor := crHandPoint
      else grLinks.Cursor := crDefault;
   end;
end;

procedure TfrmSdelka.cdsSdelkaOneSD_NUMGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	if (not Sender.DataSet.IsEmpty) then
	begin
		if (Sender.DataSet.FieldByName('AS_ID').Value <> 2) then
			Text := Sender.DataSet.FieldByName('SD_NUM').AsString
		else
			Text := sd_num + '*';
	end;
end;

procedure TfrmSdelka.sdelkaObjavsbtDeleteClick(Sender: TObject);
begin
  sdelkaObjavs.btDeleteClick(Sender);

end;

procedure TfrmSdelka.sdelkaObjavsbtEditClick(Sender: TObject);
begin
  sdelkaObjavs.btEditClick(Sender);

end;

procedure TfrmSdelka.sdelkaObjavsgrObjavsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  sdelkaObjavs.grObjavsDrawColumnCell(Sender, Rect, DataCol, Column,
  State);

end;

end.
