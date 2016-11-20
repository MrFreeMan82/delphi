unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AppEvnts, ComCtrls, ActnMan, ActnCtrls, ExtCtrls,
  sdelka, Grids, DBGrids, StdCtrls, DBCtrls, Buttons, cust, DB,
  Mask, ShDocVw, RegExpr, ImgList, Menus, htmlReport, NewButt, DropButt,
  ActnList, Clipbrd, dm, DBClient, DBLookupEh, SqlExpr, DBGridEh,
  DBCtrlsEh, DBXpress, FMTBcd, Provider, XPStyleActnCtrls, WinSock,
  zlib, globals, StrUtils, IniFiles, GridsEh, IBCustomDataSet, IBQuery,
  ValEdit, uAdminSdelka,math, uSiteObjav, uCover, uNaborshic, uDesign;

type
  TStringHolder = class
	Value: string;
	constructor Create(v: string);
  end;

  TfrmMain = class(TForm)
    pages: TPageControl;
    tbAgent: TTabSheet;
    tbManager: TTabSheet;
    BitBtn4: TBitBtn;
	tbAgentCusts: TTabSheet;
    imgUnchecked: TImage;
	imgChecked: TImage;
	mmAgentSQL: TMemo;
    mmManagerSQL: TMemo;
    Panel3: TPanel;
    tbAdmin: TTabSheet;
    PageControl1: TPageControl;
    TabSheet7: TTabSheet;
	TabSheet8: TTabSheet;
	tbAdminOtkaznik: TTabSheet;
	Shape11: TShape;
    tbAdminOther: TTabSheet;
    DBGrid7: TDBGrid;
    btRefreshOtkaznik: TBitBtn;
    GroupBox1: TGroupBox;
	DBLookupComboBox1: TDBLookupComboBox;
	Label12: TLabel;
    Label13: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBNavigator1: TDBNavigator;
    btImportOtkaznik: TBitBtn;
	btPrintOtkaznik: TBitBtn;
	dlgOpen: TOpenDialog;
    btSaveOtkaznikToFile: TBitBtn;
    pnlSdelkaByOffice: TPanel;
    btSdelkaByOffice: TBitBtn;
    edSdelkaByOfficeDateFrom: TEdit;
	edSdelkaByOfficeDateTo: TEdit;
    cbSdelkaByOfficeOffice: TDBLookupComboboxEh;
    pnlAssistants: TPanel;
    btNalBarter: TBitBtn;
    edNalBarterDateFrom: TEdit;
    edNalBarterDateTo: TEdit;
    btNotApprovedCover: TBitBtn;
	cbNotApprovedCoverGazeta: TDBLookupComboboxEh;
	dlgSave: TSaveDialog;
    tbManagerFinance: TTabSheet;
    iml1: TImageList;
    ppNewSdelka: TPopupMenu;
    tbChangeUser: TTabSheet;
    Panel5: TPanel;
	Label11: TLabel;
    DBText1: TDBText;
    btChooseUser: TBitBtn;
    DBGrid11: TDBGrid;
	Label20: TLabel;
    Label21: TLabel;
    N1: TMenuItem;
    N2: TMenuItem;
    mmPercentSQL: TMemo;
	PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    tbPercent: TTabSheet;
    Shape12: TShape;
    Label17: TLabel;
    dtpTransFrom: TDateTimePicker;
	Label18: TLabel;
    dtpTransTo: TDateTimePicker;
	Label22: TLabel;
    cbTranTypeFilter: TComboBox;
    btRefreshMoneyTransactions: TBitBtn;
	DBGrid10: TDBGrid;
    Label16: TLabel;
    GroupBox2: TGroupBox;
    Label14: TLabel;
	Label15: TLabel;
    Label19: TLabel;
	btGetGiveMoney: TBitBtn;
    edAddComment: TEdit;
    edAddSum: TEdit;
    cbTransactionType: TDBLookupComboBox;
	Shape14: TShape;
	Shape15: TShape;
    Shape13: TShape;
	btGivePercent: TBitBtn;
    BitBtn5: TBitBtn;
    grPercent: TDBGrid;
    Label23: TLabel;
	tbReports: TTabSheet;
    Shape17: TShape;
    Shape18: TShape;
    Shape6: TShape;
    Shape7: TShape;
	Shape9: TShape;
    Shape23: TShape;
    Shape33: TShape;
    Shape37: TShape;
    Shape40: TShape;
    Shape41: TShape;
	Shape44: TShape;
	Shape45: TShape;
    Shape50: TShape;
    Shape32: TShape;
    Shape35: TShape;
    Shape36: TShape;
    Shape38: TShape;
    Shape39: TShape;
	Shape46: TShape;
	Shape47: TShape;
    Shape48: TShape;
	actions: TActionList;
    actNewSdelkaVGazetuPR: TAction;
	actNewSdelkaVKA: TAction;
    actChooseUser: TAction;
	sdelkaView: TfrmSdelka;
	sdelkaViewForManager: TfrmSdelka;
    Panel2: TPanel;
	grAgentSdelka: TDBGrid;
    Panel4: TPanel;
	btNewSdelka: TDropButt;
    BitBtn10: TBitBtn;
    BitBtn3: TBitBtn;
    btRefresh: TBitBtn;
    BitBtn2: TBitBtn;
    btFindSdelkaAgent: TBitBtn;
    Shape1: TShape;
	Shape53: TShape;
    Panel6: TPanel;
	cbPayTypeFilter: TComboBox;
    Label4: TLabel;
	Label6: TLabel;
	Panel7: TPanel;
    btShowSdelkaView: TBitBtn;
	Shape51: TShape;
    Panel8: TPanel;
	grManagerSdelka: TDBGrid;
    Panel9: TPanel;
    btApprove: TBitBtn;
    btRefreshManager: TBitBtn;
    btFindSdelkaManager: TBitBtn;
    btGetMoney: TBitBtn;
    Shape2: TShape;
    Shape54: TShape;
	Panel10: TPanel;
	Label3: TLabel;
    Panel11: TPanel;
	Shape55: TShape;
    btShowSdelkaViewForManager: TBitBtn;
    btEditSdelkaManager: TBitBtn;
	Shape3: TShape;
	DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
	Label10: TLabel;
    Label34: TLabel;
    btNextIssuePR: TBitBtn;
	Shape4: TShape;
    btNextIssueNS: TBitBtn;
	Shape56: TShape;
    Shape57: TShape;
    Shape63: TShape;
    Shape64: TShape;
    Shape65: TShape;
    Label44: TLabel;
    Label45: TLabel;
    Shape82: TShape;
    btPrintNew: TBitBtn;
	tbKorrectura: TTabSheet;
    tbVerstka: TTabSheet;
	Shape86: TShape;
    btSaveOtkaznik: TBitBtn;
	btSavePermanentOtkaznik: TBitBtn;
	Shape89: TShape;
    Shape49: TShape;
    Shape90: TShape;
    imlVerstkaDiagnoz: TImageList;
	Panel12: TPanel;
	Button1222: TButton;
    cbLogTrace: TCheckBox;
    mmLogTrace: TMemo;
    Button1: TButton;
	Button2: TButton;
    Panel13: TPanel;
    Shape88: TShape;
    btRepAllByRubForCorrector: TBitBtn;
    cbRepAllByRubForCorrectorGZ: TDBLookupComboBox;
    cbRepAllByRubForCorrectorRB: TDBLookupComboboxEh;
    btRepByRubForCorrector: TBitBtn;
    Shape87: TShape;
    cbOnlyChangedAfter: TDBCheckBoxEh;
    edChangedAfter: TMaskEdit;
    TabSheet6: TTabSheet;
    Shape95: TShape;
    Shape96: TShape;
    Shape97: TShape;
    Shape98: TShape;
    DBGridEh3: TDBGridEh;
	Label70: TLabel;
	Shape99: TShape;
	btDoAlterAgentPercent: TBitBtn;
	BitBtn25: TBitBtn;
	cbAlterAgentPercentIssue: TComboBox;
	Label71: TLabel;
	btPrintAcc: TBitBtn;
	actPrintAcc: TAction;
	imlActions: TImageList;
    pnlReportsParams: TPanel;
	cbAllAgents: TCheckBox;
    cbOneWindow: TCheckBox;
    Shape62: TShape;
    Shape102: TShape;
    Shape103: TShape;
    Shape66: TShape;
    Panel15: TPanel;
    Panel150: TPanel;
    pnlReports2: TPanel;
	pnlSdelkaNotPayed: TPanel;
    btSdelkaNotPayed: TBitBtn;
    pnlNotApprovedSdelkas: TPanel;
    Shape157: TShape;
    btNotApprovedSdelkas: TBitBtn;
    pnlInterceptions: TPanel;
    Shape161: TShape;
	btInterceptions: TBitBtn;
    pnlAllCustPrint: TPanel;
    Shape118: TShape;
    btAllCustPrint: TBitBtn;
    pnlBuhgalter: TPanel;
    Label48: TLabel;
    Label49: TLabel;
    btBuhgalterByTime: TBitBtn;
    edBuhgalterFrom: TEdit;
    edBuhgalterTo: TEdit;
	pnlBonus: TPanel;
    Label46: TLabel;
    Label47: TLabel;
    btBonusLogByTime: TBitBtn;
    edBonusLogFrom: TEdit;
    edBonusLogTo: TEdit;
    pnlReports1: TPanel;
	Shape67: TShape;
    pnlCustItog: TPanel;
    Shape130: TShape;
    Label68: TLabel;
    btCustItog: TBitBtn;
    cbCustItog: TComboBox;
    pnlRubrikaItog: TPanel;
    Shape134: TShape;
    Label69: TLabel;
    btRubrikaItog: TBitBtn;
    cbRubrikaItog: TComboBox;
    pnlAgRepByIssueNS: TPanel;
    pnlAgRepByIssuePR: TPanel;
    Shape142: TShape;
    Label28: TLabel;
    btAgRepByIssue: TBitBtn;
    cbAgRepByIssueIssue: TDBLookupComboBox;
    cbDoubles: TCheckBox;
	pnlObjavRepPR: TPanel;
    Shape147: TShape;
	Label59: TLabel;
    cbObjavRepIssue: TDBLookupComboBox;
    btObjavRep: TBitBtn;
	pnlZapasByTime: TPanel;
    Shape107: TShape;
    Label30: TLabel;
    Label31: TLabel;
    btZapasByTime: TBitBtn;
    edZapasFrom: TEdit;
    edZapasTo: TEdit;
	pnlFinReport: TPanel;
    Shape138: TShape;
    Label50: TLabel;
    Label51: TLabel;
    btFinReport: TBitBtn;
    edFinReportFrom: TEdit;
    edFinReportTo: TEdit;
    pnlPayedBeznalByTime: TPanel;
    Shape126: TShape;
    Label42: TLabel;
    Label43: TLabel;
    btPayedBeznalByTime: TBitBtn;
    edPayedBeznalFrom: TEdit;
    edPayedBeznalTo: TEdit;
    pnlZarplata: TPanel;
    Shape122: TShape;
    Label37: TLabel;
    Label38: TLabel;
    btVIP: TBitBtn;
    edVIPFrom: TEdit;
    edVIPTo: TEdit;
    pnlSdelkaCountSummary: TPanel;
    Shape114: TShape;
    Label35: TLabel;
    Label36: TLabel;
    btSdelkaCountSummary: TBitBtn;
	edSdelkaCountFrom: TEdit;
    edSdelkaCountTo: TEdit;
    pnlSdelkaByPeriod: TPanel;
    Shape111: TShape;
    Label24: TLabel;
    Label25: TLabel;
    btSdelkaByPeriod: TBitBtn;
	edAgRepFrom: TEdit;
    edAgRepTo: TEdit;
    pnlOtkaznikExit: TPanel;
    Shape68: TShape;
	btOtkaznikExit: TBitBtn;
    Label73: TLabel;
    cbOtkaznikExitPR: TDBLookupComboBox;
    cbOtkaznikExitNS: TDBLookupComboBox;
    cbOtkaznikExitRZ: TDBLookupComboBox;
    cbOtkaznikExitRK: TDBLookupComboBox;
    Label74: TLabel;
    Label75: TLabel;
    Shape69: TShape;
    DBLookupComboBox5: TDBLookupComboBox;
    Label76: TLabel;
    btSaveParamsInet: TBitBtn;
    TabSheet9: TTabSheet;
    DBGridEh4: TDBGridEh;
    Shape70: TShape;
    Shape71: TShape;
    Shape72: TShape;
    Shape73: TShape;
    Shape74: TShape;
    btSaveRubrikaSite: TBitBtn;
	Label77: TLabel;
    Shape75: TShape;
    DBGridEh5: TDBGridEh;
    Label79: TLabel;
    pnlPayments: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Shape85: TShape;
	btCorrectObjav: TBitBtn;
    btRefreshKorrektura: TBitBtn;
    btFindForCorrector: TBitBtn;
    Panel24: TPanel;
    Label72: TLabel;
    grBlanks: TDBGridEh;
    Panel25: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton6: TSpeedButton;
    grSdelkaForKorrektura: TDBGridEh;
    Panel26: TPanel;
    Shape100: TShape;
    edSearchKorrektura: TDBEditEh;
    Label54: TLabel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    grAdminRights: TDBGridEh;
    grAdminUsers: TDBGridEh;
    grAdminAgents: TDBGridEh;
    Panel30: TPanel;
	Panel31: TPanel;
    Panel32: TPanel;
    btSaveAgents: TBitBtn;
	btSaveUsers: TBitBtn;
	btSaveUserRights: TBitBtn;
    Shape27: TShape;
    Panel19: TPanel;
    Shape81: TShape;
    pnlApplyPayments: TPanel;
    Shape28: TShape;
    Label39: TLabel;
    edFindSdelkaForPayment: TDBEditEh;
    Label53: TLabel;
    edFindSdelkaSum: TDBEditEh;
    btFindSdelkaForPayment: TBitBtn;
    btFindAndPay: TBitBtn;
    Label40: TLabel;
    edNowPayed: TDBEditEh;
    Label41: TLabel;
    edTotalPayed: TDBEditEh;
    cbAllPayed: TDBCheckBoxEh;
    btApplyPayment: TBitBtn;
    Panel34: TPanel;
    grFindSdelkaForPayment: TDBGridEh;
    Shape29: TShape;
    Panel35: TPanel;
    Shape58: TShape;
    Label58: TLabel;
    cbGazetaSelector: TDBLookupComboboxEh;
	btVerstkaGazety: TBitBtn;
    Panel36: TPanel;
    verstkaPages: TPageControl;
    tabObjavs: TTabSheet;
    TabSheet10: TTabSheet;
    Label78: TLabel;
    Label80: TLabel;
	btModuliExportAll: TBitBtn;
    grModuliVerstka: TDBGridEh;
    cbModuliVerstkaFilter: TDBLookupComboboxEh;
    btRefreshModuliVerstka: TBitBtn;
    btModuliExportRubrika: TBitBtn;
	TabSheet2: TTabSheet;
    grCustList: TDBGridEh;
    btRefreshCustInfo: TBitBtn;
    btSaveCustInfo: TBitBtn;
    TabSheet4: TTabSheet;
    Label64: TLabel;
    Label65: TLabel;
    DBGridEh1: TDBGridEh;
	btRefreshKA: TBitBtn;
    btSaveKA: TBitBtn;
    cbKAFilter: TDBLookupComboboxEh;
    TabSheet5: TTabSheet;
    DBGridEh2: TDBGridEh;
    btRefreshCustKA: TBitBtn;
    btSaveCustKA: TBitBtn;
    Panel37: TPanel;
    Panel38: TPanel;
    Shape83: TShape;
    btSelectedExport: TBitBtn;
    btSelectAll: TBitBtn;
    btRefreshVerstka: TBitBtn;
	btOneSdelkaVerst: TBitBtn;
    btAllRubVerstka: TBitBtn;
    grVerstkaDifference: TDBGridEh;
    Label55: TLabel;
    cbVerstkaDifferenceFilter: TDBLookupComboboxEh;
    Label62: TLabel;
    Panel39: TPanel;
	btRefreshSverstana: TBitBtn;
    btClearVersting: TBitBtn;
    btClearVerstingRub: TBitBtn;
    btExportRub: TBitBtn;
    btExportAllRub: TBitBtn;
    grObjavSverstano: TDBGridEh;
    Label57: TLabel;
    cbVerstkaReadyFilter: TDBLookupComboboxEh;
    Label61: TLabel;
    agentCusts: TfrmCust;
    ppGrid: TPopupMenu;
    N3: TMenuItem;
    actNewSdelkaVInternet: TAction;
    N4: TMenuItem;
    pnlAttentionObjavs: TPanel;
	Shape76: TShape;
    btAttentionObjavs: TBitBtn;
    Panel42: TPanel;
    Shape21: TShape;
    grIssue: TDBGridEh;
    cbGazetaForIssue: TDBLookupComboBox;
    btShowIssuesForGazeta: TBitBtn;
    Label7: TLabel;
    btSaveIssues: TBitBtn;
    Shape22: TShape;
    Shape24: TShape;
    Shape91: TShape;
    Shape20: TShape;
    Panel43: TPanel;
    Shape30: TShape;
    grRubriki: TDBGridEh;
    grFormats: TDBGridEh;
    Label9: TLabel;
    Label8: TLabel;
    Shape25: TShape;
    Shape92: TShape;
    Shape16: TShape;
    BitBtn8: TBitBtn;
	BitBtn13: TBitBtn;
    DBCheckBoxEh1: TDBCheckBoxEh;
    Panel44: TPanel;
    Shape93: TShape;
    btExportVIPModules: TBitBtn;
	TabSheet3: TTabSheet;
    DBGridEh6: TDBGridEh;
    btRefreshNavchCourse: TBitBtn;
    btExportNavchCourse: TBitBtn;
    N5: TMenuItem;
    actNewSdelkaVGazetuNS: TAction;
    N6: TMenuItem;
    actNewSdelkaVGazetuSR: TAction;
	N7: TMenuItem;
    Panel45: TPanel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label27: TLabel;
    Label26: TLabel;
    Label32: TLabel;
    DBLookupComboBox6: TDBLookupComboBox;
    btNextIssueSR: TBitBtn;
    Label33: TLabel;
    btSaveParams: TBitBtn;
    Label82: TLabel;
    DBLookupComboBox7: TDBLookupComboBox;
    Label83: TLabel;
    cbOtkaznikExitSR: TDBLookupComboBox;
    cbAgRepByIssueGazeta: TDBLookupComboboxEh;
    cbObjavRepGazeta: TDBLookupComboboxEh;
    cbRepAllByRubGazeta: TDBLookupComboboxEh;
    Shape10: TShape;
    DBEditEh2: TDBEditEh;
    Label29: TLabel;
    DBEditEh3: TDBEditEh;
    Label60: TLabel;
    DBEditEh4: TDBEditEh;
	Label84: TLabel;
    Label85: TLabel;
    DBEditEh5: TDBEditEh;
    Label86: TLabel;
    DBEditEh6: TDBEditEh;
    Label87: TLabel;
    btInetImport: TBitBtn;
    btRepVerstkaObjavCount: TBitBtn;
    tabCustObjavExport: TTabSheet;
    DBGridEh7: TDBGridEh;
    Label89: TLabel;
    BitBtn1: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    cbExportGazeta: TDBLookupComboboxEh;
    cbExportIssue: TDBLookupComboBox;
    dlgSaveObjavExport: TSaveDialog;
    cbAttentionObjavsGazeta: TDBLookupComboboxEh;
    edModuliByDesignerFrom: TEdit;
	edModuliByDesignerTo: TEdit;
    Label90: TLabel;
    Label91: TLabel;
    N8: TMenuItem;
    N9: TMenuItem;
    actNewSdelkaVRDZ: TAction;
    actNewSdelkaVRK: TAction;
    Shape5: TShape;
    Label92: TLabel;
    btNextIssueRZ: TBitBtn;
    Label93: TLabel;
    DBLookupComboBox8: TDBLookupComboBox;
    Shape31: TShape;
    Label94: TLabel;
    btNextIssueRK: TBitBtn;
    DBLookupComboBox9: TDBLookupComboBox;
    Label95: TLabel;
    Label96: TLabel;
    cbGZ_: TComboBox;
    cboGZ: TComboBox;
    cboGZNP: TComboBox;
    Label97: TLabel;
    DBLookupComboBox10: TDBLookupComboBox;
    Label98: TLabel;
    DBLookupComboBox11: TDBLookupComboBox;
    btnShowKorrectura: TButton;
    cboIss: TComboBox;
    Label99: TLabel;
    cbGz: TDBLookupComboboxEh;
    tabSdelka: TTabSheet;
    btDeleteFormat: TBitBtn;
    btEditFormat: TBitBtn;
    btAddFormat: TBitBtn;
    qFormats: TSQLQuery;
    dsFormats: TDataSource;
    cdsFormats: TClientDataSet;
    prvFormats: TDataSetProvider;
    cdsFormatsFM_ID: TIntegerField;
    cdsFormatsFM_NAME: TStringField;
    cdsFormatsFM_SPACE: TFloatField;
    cdsFormatsFM_HAS_PICTURE: TSmallintField;
    cdsFormatsFM_PICTURE_SIZES: TStringField;
    cdsFormatsFM_COST: TFloatField;
    cdsFormatsGZ_ID: TIntegerField;
    cbSdelkaCountSummaryMode: TComboBox;
    spLogModuleLoad: TSQLStoredProc;
    tabSiteObjav: TTabSheet;
    Label100: TLabel;
    edRepNotPayFrom: TEdit;
    Label101: TLabel;
    edRepNotPayTo: TEdit;
    cdGzFormat: TDBLookupComboBox;
    DropButt1: TDropButt;
    ppReports: TPopupMenu;
    mnuSdRep: TMenuItem;
    cdGzRubrika: TDBLookupComboBox;
    qRubrika: TSQLQuery;
    cdsRubrika: TClientDataSet;
    cdsRubrikaRB_ID: TIntegerField;
    cdsRubrikaRB_NAME: TStringField;
    cdsRubrikaRB_NAME_SHORT: TStringField;
    cdsRubrikaRB_COST_COEFF: TFloatField;
    cdsRubrikaRB_IS_OBLOGKA: TSmallintField;
    cdsRubrikaGZ_ID: TIntegerField;
    cdsRubrikaRB_IS_HOT: TSmallintField;
    cdsRubrikaRB_IS_LOCKABLE: TSmallintField;
    cdsRubrikaDELETED: TSmallintField;
    prvRubrika: TDataSetProvider;
    dsRubrika: TDataSource;
    dblRP_Gazeta: TDBLookupComboBox;
    btNewRubrika: TBitBtn;
    btEditRubrika: TBitBtn;
    tbPayments:TTabSheet;
    bthCheck: TButton;
    N10: TMenuItem;
    actNewSdelkaRegion: TAction;
    HeaderControl1: THeaderControl;
    tabCover: TTabSheet;
    Label1: TLabel;
    txtIss: TEdit;
    Label2: TLabel;
    cbCodePage: TComboBox;
    Label5: TLabel;
    cdsFormatsFM_COST_4: TFloatField;
    tbNabor: TTabSheet;
    tbDesign: TTabSheet;
	procedure BitBtn3Click(Sender: TObject);
	procedure cbPayTypeFilterChange(Sender: TObject);
	procedure BitBtn2Click(Sender: TObject);
	procedure btRefreshClick(Sender: TObject);
	procedure btApproveClick(Sender: TObject);
	procedure FormCreate(Sender: TObject);
	procedure BitBtn10Click(Sender: TObject);
	procedure grAgentSdelkaDrawColumnCell(Sender: TObject; const Rect: TRect;
	  DataCol: Integer; Column: TColumn; State: TGridDrawState);
	procedure grAgentSdelkaCellClick(Column: TColumn);
	procedure grManagerSdelkaDrawColumnCell(Sender: TObject; const Rect: TRect;
	  DataCol: Integer; Column: TColumn; State: TGridDrawState);
	procedure grManagerSdelkaCellClick(Column: TColumn);
	procedure btGetMoneyClick(Sender: TObject);
	procedure btFindSdelkaAgentClick(Sender: TObject);
	procedure btFindSdelkaManagerClick(Sender: TObject);
	procedure btSaveAgentsClick(Sender: TObject);
	procedure btSaveUsersClick(Sender: TObject);
	procedure btSaveUserRightsClick(Sender: TObject);
	procedure btSaveIssuesClick(Sender: TObject);
	procedure btChooseUserClick(Sender: TObject);
	procedure btRefreshOtkaznikClick(Sender: TObject);
	procedure btPrintOtkaznikClick(Sender: TObject);
	procedure btImportOtkaznikClick(Sender: TObject);
	procedure btSaveOtkaznikToFileClick(Sender: TObject);
	procedure btGetGiveMoneyClick(Sender: TObject);
	procedure btRefreshMoneyTransactionsClick(Sender: TObject);
	procedure btShowIssuesForGazetaClick(Sender: TObject);
	procedure FormShow(Sender: TObject);
	procedure pagesChange(Sender: TObject);
	procedure tbPercentShow(Sender: TObject);
	procedure grPercentCellClick(Column: TColumn);
	procedure grPercentDrawColumnCell(Sender: TObject; const Rect: TRect;
	  DataCol: Integer; Column: TColumn; State: TGridDrawState);
	procedure btGivePercentClick(Sender: TObject);
	procedure BitBtn5Click(Sender: TObject);
	procedure btSdelkaByPeriodClick(Sender: TObject);
	procedure btSaveParamsClick(Sender: TObject);
	procedure actNewSdelkaVGazetuPRExecute(Sender: TObject);
	procedure actNewSdelkaVKAExecute(Sender: TObject);
	procedure btShowSdelkaViewClick(Sender: TObject);
	procedure btShowSdelkaViewForManagerClick(Sender: TObject);
	procedure btAgRepByIssueClick(Sender: TObject);
	procedure btEditSdelkaManagerClick(Sender: TObject);
	function ZapasByTimePrint(agid:integer;agname:string):TStringList;
	procedure btZapasByTimeClick(Sender: TObject);
	function SdelkaNotPayedPrint(agid, gzid: integer; agname: string; dateFrom: TDate; dateTo: TDate):TStringList;
	procedure btSdelkaNotPayedClick(Sender: TObject);
	procedure btInterceptionsClick(Sender: TObject);
	procedure btSdelkaCountSummaryClick(Sender: TObject);
	procedure btVIPClick(Sender: TObject);
//	function ZarplataPrint(agid:integer;agname:string;var sum_n,sum_b,sum_c,sum_bn,sum_n_payed,sum_b_payed:currency):TStringList;
	function VIPPrint(agid:integer;agname:string;var c_ka: integer; var s_ka: currency; var c_inet: integer; var s_inet: currency; var c_total: integer; var s_total: currency):TStringList;
	procedure btFindSdelkaForPaymentClick(Sender: TObject);
    procedure edFindSdelkaForPaymentKeyPress(Sender: TObject;
      var Key: Char);
	procedure btApplyPaymentClick(Sender: TObject);
	procedure btPayedBeznalByTimeClick(Sender: TObject);
	procedure btNextIssuePRClick(Sender: TObject);
	procedure btNotApprovedSdelkasClick(Sender: TObject);
	function BonusLogPrint:TStringList;
    procedure btBonusLogByTimeClick(Sender: TObject);
	procedure btFinReportClick(Sender: TObject);
	function DescribeSdelka(sd:TfrmSdelka):String;
    procedure btPrintNewClick(Sender: TObject);
    procedure btFindAndPayClick(Sender: TObject);
	procedure btCorrectObjavClick(Sender: TObject);
    procedure grSdelkaForKorrekturaDblClick(Sender: TObject);
    procedure grSdelkaForKorrekturaKeyPress(Sender: TObject; var Key: Char);
	procedure btRefreshKorrekturaClick(Sender: TObject);
	procedure edSearchKorrekturaKeyPress(Sender: TObject; var Key: Char);
	procedure btOneSdelkaVerstClick(Sender: TObject);
	procedure btClearVerstingClick(Sender: TObject);
	procedure btRefreshSverstanaClick(Sender: TObject);
	procedure btRefreshVerstkaClick(Sender: TObject);
	procedure btVerstkaGazetyClick(Sender: TObject);
	procedure grVerstkaDifferenceDblClick(Sender: TObject);
	procedure grObjavSverstanoDblClick(Sender: TObject);
	procedure btClearVerstingRubClick(Sender: TObject);
	function ObjavRepByIssuePrint(gzid,iss:integer):TStringList;
	function ObjavRepByRubIssuePrint(gzid,isid,rbid:integer;onlyChanged:boolean;changedDate:TDateTime):TStringList;
	function ObjavAttentionRepPrint():TStringList;	
	procedure btObjavRepClick(Sender: TObject);
	procedure btExportRubClick(Sender: TObject);
	procedure btSelectedExportClick(Sender: TObject);
	procedure btSelectAllClick(Sender: TObject);
	procedure btFindForCorrectorClick(Sender: TObject);
	procedure btRepByRubForCorrectorClick(Sender: TObject);
	procedure btRepAllByRubForCorrectorClick(Sender: TObject);
	procedure btAllRubVerstkaClick(Sender: TObject);
	procedure btExportAllRubClick(Sender: TObject);
	procedure Button1222Click(Sender: TObject);
	procedure btSavePermanentOtkaznikClick(Sender: TObject);
	procedure btSaveOtkaznikClick(Sender: TObject);
	procedure cbVerstkaDifferenceFilterChange(Sender: TObject);
	procedure cbVerstkaReadyFilterChange(Sender: TObject);
	procedure btRefreshCustInfoClick(Sender: TObject);
	procedure btSaveCustInfoClick(Sender: TObject);
	procedure cbKAFilterChange(Sender: TObject);
	procedure btRefreshKAClick(Sender: TObject);
	procedure btSaveKAClick(Sender: TObject);
	procedure btRefreshCustKAClick(Sender: TObject);
	procedure btSaveCustKAClick(Sender: TObject);
	procedure Button1Click(Sender: TObject);
	procedure Button2Click(Sender: TObject);
	procedure cbLogTraceClick(Sender: TObject);
	procedure btCustItogClick(Sender: TObject);
	procedure btRubrikaItogClick(Sender: TObject);
	procedure BitBtn25Click(Sender: TObject);
	procedure btDoAlterAgentPercentClick(Sender: TObject);
	procedure actPrintAccExecute(Sender: TObject);
	procedure btAllCustPrintClick(Sender: TObject);
	procedure grAdminAgentsColumns1UpdateData(Sender: TObject;
	  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
	function OtkaznikExitPrint(agid:integer;agname:string):TStringList;
	procedure btOtkaznikExitClick(Sender: TObject);
	procedure btSaveRubrikaSiteClick(Sender: TObject);
	procedure btModuliExportAllClick(Sender: TObject);
	procedure cbModuliVerstkaFilterChange(Sender: TObject);
	procedure btRefreshModuliVerstkaClick(Sender: TObject);
	procedure grModuliVerstkaDblClick(Sender: TObject);
	procedure N3Click(Sender: TObject);
	procedure actNewSdelkaVInternetExecute(Sender: TObject);
	procedure BitBtn14Click(Sender: TObject);
    procedure btAttentionObjavsClick(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure grSdelkaForNaborDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure btExportVIPModulesClick(Sender: TObject);
    procedure DBGridEh6DblClick(Sender: TObject);
	procedure btRefreshNavchCourseClick(Sender: TObject);
    procedure btExportNavchCourseClick(Sender: TObject);
    procedure actNewSdelkaVGazetuNSExecute(Sender: TObject);
    procedure actNewSdelkaVGazetuSRExecute(Sender: TObject);
    procedure cbAgRepByIssueGazetaChange(Sender: TObject);
    procedure cbObjavRepGazetaChange(Sender: TObject);
    procedure btInetImportClick(Sender: TObject);
	procedure cbRepAllByRubGazetaChange(Sender: TObject);
    procedure btRepVerstkaObjavCountClick(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure tabCustObjavExportShow(Sender: TObject);
    procedure cbExportGazetaChange(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure btModuliByDesignerClick(Sender: TObject);
	procedure btSdelkaByOfficeClick(Sender: TObject);
	function SdelkaByOfficePrint(officeId: integer; dateFrom: TDate; dateTo: TDate): TStringList;
	function SdelkaByOfficePrintOneTable(officeId: integer; dateFrom: TDate; dateTo: TDate; requisiteId: integer; requisiteName: string; payTypeId: integer; payTypeName: string): TStringList;
	procedure btNalBarterClick(Sender: TObject);
	function AssistantsPrint(dateFrom: TDate; dateTo: TDate): TStringList;
  function NalBarterPrint(dateFrom: TDate; dateTo: TDate): TStringList;
	procedure btNotApprovedCoverClick(Sender: TObject);
	function NotApprovedCoverPrint(gazetaId: integer): TStringList;
	function ModuliByDesignerPrint(dateFrom, dateTo: TDateTime): TStringList;
	procedure btModuliExportRubrikaClick(Sender: TObject);
    procedure actNewSdelkaVRDZExecute(Sender: TObject);
    procedure actNewSdelkaVRKExecute(Sender: TObject);
    procedure cboIssChange(Sender: TObject);
    procedure btnShowKorrecturaClick(Sender: TObject);
    procedure cbGzChange(Sender: TObject);
    procedure btAddFormatClick(Sender: TObject);
    procedure btEditFormatClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cdGzFormatCloseUp(Sender: TObject);
    procedure mnuSdRepClick(Sender: TObject);
    procedure cdGzRubrikaCloseUp(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure dblRP_GazetaCloseUp(Sender: TObject);
    procedure btNewRubrikaClick(Sender: TObject);
    procedure btEditRubrikaClick(Sender: TObject);
    procedure bthCheckClick(Sender: TObject);
    procedure actNewSdelkaRegionExecute(Sender: TObject);
    procedure HeaderControl1SectionTrack(HeaderControl: THeaderControl;
      Section: THeaderSection; Width: Integer; State: TSectionTrackState);
    procedure FormResize(Sender: TObject);
  private
  frmControlSdelka: TfrmControlSdelka;
  frmCover: TFrmCover;
	exportTemplates: THashedStringList;
  frmSite_Objav: TfrmSite_Objav;
  frmNabor:TfrmNabor;
  frmDesign: TfrmDesign;

	function LoadTemplates: boolean;
	function getCurrentIssueExportPath:string;
	function stripNewLine(s:String):String;
	procedure OpenDB;

	procedure ExportObjavs(ds:TDataSet; rbNameLong,rbNameShort,exportPath:String; appendId:integer; onlySelected,showChanges:boolean);
	procedure SetModuliVerstkaFilter(rbId: Variant; isEvent: boolean);
	function ModuliExportRubrika(rbId: integer): string;
	function ChooseTemplate(gzId: integer; templateType: string): string; overload;
	function ChooseTextTemplate(gzId, fmId: integer; fmName: string): string; overload;
  function SdelkaCrossingMonthPrint(dateFrom: TDate; dateTo: TDate;RepIndex:integer):TStringList;
  procedure HideIssues();
  procedure DetectActivePage();
  procedure createCover;
  public
	// Обновлять ли автоматически формочки для просмотра сделок при
	// переходах по таблице cdsSdelka? Бывает лучше отключить (скажем,
	// когда перебираются все записи из cdsSdelka)
	updateSdelkaViews:boolean;

	// Номер текущего пользователя, реально
	currentUser:integer;

	// Тип текущего пользователя (цифирью, как в БД)
	currentUserType:integer;

  canUserBlockCover:boolean;

	// Может ли текущий пользователь редактировать "уникальных" клиентов?
	currentUserCanEditCustUnique:boolean;

	// Может, у нас пользователь - root?
	isRoot:boolean;

	procedure setCustSQL(byAgent:boolean);
	procedure setSdelkaSQL(sl:TStrings);
	procedure DrawLockCell(AGrid: TObject; AColumn: TObject; ARect: TRect);
	procedure DrawSRCell(AGrid: TObject; AColumn: TObject; ARect: TRect);

  procedure FillIss(gz_id: integer);
  end;

var
  frmMain: TfrmMain;

implementation

uses sdelkaForm, agentSummary, findSdelka, wait, chooseUser,
  ChangeAgentForSdelka, dmRep, phoneCheckResult, bonusLog, dmPubl,
  sdelkaPublForm, objavOrder, Reconcile, repAcc, custForm, accessRights,
  editObjav, ContentForm, loadPicture, dmCache, RepAccParams, inetImport,
  uSdelkaRep, uNewFormat, DateUtils,FileCtrl, uNewRubrika, uChangeObjav,
  spellChecker, SqlTimSt, cUnicodeCodecs, cUtils, ObjavlenieForm;

//{$DEFINE DEBUG}

{$R *.dfm}
procedure TfrmMain.btnShowKorrecturaClick(Sender: TObject);
begin
      publData.cdsObjavForKorrektura.Close;
      publData.cdsObjavForKorrektura.Params.ParamByName('gz_id').AsInteger := cbGZ.KeyValue;
      publData.cdsObjavForKorrektura.Params.ParamByName('is_id').AsInteger := publData.qIssue.fieldByName('IS_ID').AsInteger;
      publData.cdsObjavForKorrektura.Open;
end;

procedure TfrmMain.FillIss(gz_id: integer);
begin
    cboIss.Items.Clear;
    publData.qIssue.Close;
    publData.qIssue.ParamByName('gz_id').AsInteger := gz_id;
    publData.qIssue.Open;

    while not publData.qIssue.Eof do
    begin
        cboIss.Items.Append(publData.qIssue.fieldByName('IS_NAME_COMPOSED').AsString);
        publData.qIssue.Next
    end;  
end;

procedure TfrmMain.cboIssChange(Sender: TObject);
begin
  if publData.qIssue.Locate('IS_NAME_COMPOSED', cboIss.Text, []) then
  begin
     // ShowMessage(publData.qIssue.FieldByName('IS_ID').asstring);
  end;
end;


// Редактировать сделку (агент)
procedure TfrmMain.BitBtn3Click(Sender: TObject);
begin
	data.DoUpdateSdelkaViews();
	TfrmSdelkaForm.Edit(data.cdsSdelka.FieldByName('AG_ID').AsInteger,data.cdsSdelka.FieldByName('SD_ID').AsInteger,uAgent,sdelkaView);
	btRefresh.Click;
end;


// Фильтруем список сделок при изменении в списке-фильтре сверху
procedure TfrmMain.cbPayTypeFilterChange(Sender: TObject);
var
	pt:integer;
begin
	pt := TIntHolder(cbPayTypeFilter.Items.Objects[cbPayTypeFilter.ItemIndex]).value;
	if (pt <> -1) then
	begin
		data.cdsSdelka.Filter   := 'PT_ID=' + IntToStr(pt);
		data.cdsSdelka.Filtered := true;
	end
	else
		data.cdsSdelka.Filtered := false;
end;


// Показать "Итог" по показываемым сделкам
procedure TfrmMain.BitBtn2Click(Sender: TObject);
begin
	updateSdelkaViews := false;
	frmAgentSummary.ShowModal(data.cdsSdelka);
	updateSdelkaViews := true;
	data.cdsSdelkaAfterScroll(data.cdsSdelka);
end;


// Полностью обновляем список сделок и "окошко" просмотра
procedure TfrmMain.btRefreshClick(Sender: TObject);
begin
	RefreshClientDataSetFullySavingPos(data.qrySdelka,data.cdsSdelka);
end;

// Подтверждаем новую сделку/проверяем изменения в изменённой (менеджер)
procedure TfrmMain.btApproveClick(Sender: TObject);
begin
// подтверждаем новую
	if (data.cdsSdelkaSD_STATE.Value = SD_READY) then
	begin
		if (    (sdelkaViewForManager.Visible)
			and (sdelkaViewForManager.hasDoljnik())
			and (MessageDlg('Клиент, связанный с этой сделкой - должник. Подтвердить сделку?',
							mtConfirmation,[mbYes,mbNo],0) = mrNo))
		then
			exit;

		data.cdsSdelka.Edit;
		if (data.cdsSdelkaPT_ID.Value = PAY_NAL) then // "нал"
			data.cdsSdelkaSD_STATE.Value := SD_TO_PAY
		else
			data.cdsSdelkaSD_STATE.Value := SD_CURRENT;

    if (data.cdsSdelkaAS_ID.Value = 1) then data.cdsSdelkaAS_ID.Value := 0;
    
		data.cdsSdelka.CheckBrowseMode;
		data.cdsSdelka.ApplyUpdates(0);
    data.LogSdelka(data.cdsSdelkaAG_ID.AsInteger, data.cdsSdelkaSD_ID.AsInteger, frmMain.currentUser);

		btRefreshManager.Click;
	end
// проверяем изменения
	else if (data.cdsSdelkaAS_ID.Value = 1) then
	begin
		data.DoUpdateSdelkaViews();
		TfrmSdelkaForm.Edit(data.cdsSdelkaAG_ID.AsInteger, data.cdsSdelkaSD_ID.AsInteger, uManager, sdelkaViewForManager);
		btRefreshManager.Click;
	end;
end;


procedure TfrmMain.FormCreate(Sender: TObject);
begin
  tabSiteObjav.PageIndex := 12;
	// откроем БД
	OpenDB();

	sdelkaView.ReadOnly := true;
	sdelkaView.btCancel.Visible := false;
	sdelkaViewForManager.ReadOnly := true;
	sdelkaViewForManager.btCancel.Visible := false;
	updateSdelkaViews := true;

	dtpTransFrom.Date := Date;
	dtpTransTo.Date := Date;

	pages.ActivePage := tbChangeUser;
	verstkaPages.ActivePage := tabObjavs;
  PageControl1.ActivePage := TabSheet7;

	cbAgRepByIssueGazeta.KeyValue := GZ_PR;
	cbAgRepByIssueIssue.KeyValue := data.getCurrentIssue(GZ_PR);

	cbObjavRepGazeta.KeyValue := GZ_PR;
	cbObjavRepIssue.KeyValue := data.getCurrentIssue(GZ_PR);

	cbOtkaznikExitPR.KeyValue := data.tblParamsPM_FIRST_OTKAZNIK_ISSUE_PR.Value;
	cbOtkaznikExitNS.KeyValue := data.tblParamsPM_FIRST_OTKAZNIK_ISSUE_NS.Value;
	cbOtkaznikExitSR.KeyValue := data.tblParamsPM_FIRST_OTKAZNIK_ISSUE_SR.Value;
	cbOtkaznikExitRZ.KeyValue := data.tblParamsPM_FIRST_OTKAZNIK_ISSUE_RZ.Value;
	cbOtkaznikExitRK.KeyValue := data.tblParamsPM_FIRST_OTKAZNIK_ISSUE_RK.Value;

	// по неизвестным науке причинам, у этой кнопки теряется Action...
	agentCusts.btPrintAcc.Action := frmMain.actPrintAcc;

	exportTemplates := nil;

  cacheData.rvpRepAcc.ProjectFile := data.ReportFolder;

  speller := TSpellChecker.Create;
end;


// Удаляем сделку (агент)
procedure TfrmMain.BitBtn10Click(Sender: TObject);
var q: TSQLQuery;
begin
	if ((
			(data.cdsSdelka.FieldByName('SD_STATE').AsInteger = SD_NEW) or
			(data.cdsSdelka.FieldByName('SD_STATE').AsInteger = SD_READY)
		)
		and
		(data.cdsSdelka.FieldByName('SD_SUM_PAYED').AsFloat = 0)
		and
		(data.cdsSdelka.FieldByName('SD_ALL_PAYED').AsInteger = 0)
		) then
	begin
		if (MessageDlg('Вы уверены, что хотите удалить эту сделку?'#10#13'Отменить удаление нельзя!', mtConfirmation, [mbYes,mbNo], 0)=mrYes) then
		begin
		 {	data.cdsSdelka.Delete;
			data.cdsSdelka.ApplyUpdates(0);}
     q := TSQLQuery.Create(data);
     q.SQLConnection := data.connection;
     q.SQL.Append('select result from adm_delete_sdelka(:sd_num, :us_id, :ip)');
     q.ParamByName('sd_num').AsString := data.cdsSdelkaSD_NUM.AsString;
     q.ParamByName('us_id').AsInteger := frmMain.currentUser;
     q.ParamByName('ip').AsString := getLocalHostName();
     q.Open;
     q.Free;
     data.cdsSdelka.Refresh;
		end;
	end
	else
		MessageDlg('Нельзя удалить эту сделку - возможно, она уже оплачена или подтверждена менеджером.', mtError, [mbOk], 0);
end;


// Отрисуем список сделок у агента
procedure TfrmMain.grAgentSdelkaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
	cl:TColor;
begin
	// отметим ячейку "Приоритет"
 	DrawLockCell(Sender, Column, Rect);
	// отметим ячейку "Тек. № СТ"
	DrawSRCell(Sender, Column, Rect);

	// отметим красным сделки с неподтверждёнными изменениями,
	// остальные - зелёным
	cl := grAgentSdelka.Canvas.Brush.Color;
	if (Column.FieldName = 'AS_ID') then
	begin
		if (Column.Field.Value = 0) then
			grAgentSdelka.Canvas.Brush.Color := clGreen
		else
			if (Column.Field.Value = 1) then
				grAgentSdelka.Canvas.Brush.Color := clRed;
		grAgentSdelka.Canvas.FillRect(Rect);
	end;

	// нарисуем "чекбокс" на "новых" сделках и "готовых к сдаче"
	if (Column.Title.Caption = 'К сдаче') then
	begin
		if (Column.Field.Value = 2) then
		begin
			grAgentSdelka.Canvas.FillRect(Rect);
			grAgentSdelka.Canvas.Draw(Rect.Left + ((Rect.Right-Rect.Left - 11) div 2), Rect.Top + ((Rect.Bottom - Rect.Top - 11) div 2), imgChecked.Picture.Bitmap)
		end
		else if (Column.Field.Value = 1) then
		begin
			grAgentSdelka.Canvas.FillRect(Rect);
			grAgentSdelka.Canvas.Draw(Rect.Left + ((Rect.Right - Rect.Left - 11) div 2), Rect.Top + ((Rect.Bottom - Rect.Top - 11) div 2), imgUnchecked.Picture.Bitmap);
		end
		else
		begin
			grAgentSdelka.Canvas.Brush.Color := clBtnFace;
			grAgentSdelka.Canvas.FillRect(Rect);
		end;
	end;
	grAgentSdelka.Canvas.Brush.Color := cl;
end;


// Нажатие по списку сделок у агента
procedure TfrmMain.grAgentSdelkaCellClick(Column: TColumn);
begin
	// может, кто-то нажал по "чекбоксу" на "новой" или "готовой к сдаче" сделке?
	if (Column.Title.Caption = 'К сдаче') then
	begin
		try
			if ((Column.Field.AsInteger = 1) or (Column.Field.AsInteger = 2)) then
			begin
				// проверим, чтобы не было объявлений в "заблокированые" рубрики
				if (    (Column.Field.DataSet.FieldByName('RB_IS_LOCKABLE').AsInteger > 0)
					and data.IsAgentLocked(uAgent)) then
				begin
					MessageDlg(  'В этой сделке есть объявление, рубрика которого сейчас заблокирована. '
							   + 'Удалите его или поменяйте рубрику.', mtError, [mbOk],0);
					exit;
				end;
				if ( not (grAgentSdelka.DataSource.DataSet.State in [dsEdit,dsInsert])) then
					grAgentSdelka.DataSource.DataSet.Edit;
				if (Column.Field.AsInteger = 1) then
					Column.Field.AsInteger := 2
				else if (Column.Field.AsInteger = 2) then
					Column.Field.AsInteger := 1;
				grAgentSdelka.DataSource.DataSet.Post;
				TClientDataSet(grAgentSdelka.DataSource.DataSet).ApplyUpdates(0);

        data.LogSdelka(data.cdsSdelkaAG_ID.AsInteger, data.cdsSdelkaSD_ID.AsInteger, frmMain.currentUser);
			end;
		except
			btRefresh.Click;
		end;
	end;
end;


// Отрисовка списка сделок у менеджера
procedure TfrmMain.grManagerSdelkaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
	cl:TColor;
begin
	// отметим ячейку "Приоритет"
	DrawLockCell(Sender, Column, Rect);
	// отметим ячейку "Тек. № СТ"
	DrawSRCell(Sender, Column, Rect);

  cl:=grManagerSdelka.Canvas.Brush.Color;

  if (Column.FieldName = 'T') then
  begin
      if data.cdsSdelkaT.AsInteger = 1 then
          grManagerSdelka.Canvas.Brush.Color := clGreen
      else
          grManagerSdelka.Canvas.Brush.Color := clWhite;

      grManagerSdelka.Canvas.FillRect(Rect);
  end;

	// отметим сделки с неподтверждёнными изменениями красным квадратиком,
	// остальные - зелёным

	if (Column.FieldName = 'AS_ID') then
	begin
		if (Column.Field.Value = 0) then
			grManagerSdelka.Canvas.Brush.Color := clGreen
		else
			if (Column.Field.Value = 1) then
				grManagerSdelka.Canvas.Brush.Color := clRed;
		grManagerSdelka.Canvas.FillRect(Rect);
	end;

	// нарисуем "чекбокс" на сделках наличных "подтверждённых" и "к оплате"
	if (Column.Title.Caption = 'К оплате') then
	begin
		if ((Column.Field.DataSet.FieldByName('SD_STATE').AsInteger = SD_TO_PAY) and (Column.Field.DataSet.FieldByName('PT_ID').AsInteger = PAY_NAL)) then // "нал"
		begin
			if (Column.Field.Value = 0) then
			begin
				grManagerSdelka.Canvas.FillRect(Rect);
				grManagerSdelka.Canvas.Draw(Rect.Left + ((Rect.Right - Rect.Left - 11) div 2), Rect.Top + ((Rect.Bottom - Rect.Top - 11) div 2), imgUnchecked.Picture.Bitmap);
			end
			else if (Column.Field.Value > 0) then
			begin
				grManagerSdelka.Canvas.FillRect(Rect);
				grManagerSdelka.Canvas.Draw(Rect.Left + ((Rect.Right-Rect.Left - 11) div 2), Rect.Top + ((Rect.Bottom - Rect.Top - 11) div 2), imgChecked.Picture.Bitmap)
			end;
		end
		else
		begin
			grManagerSdelka.Canvas.Brush.Color := clBtnFace;
			grManagerSdelka.Canvas.FillRect(Rect);
		end;
	end;
	grManagerSdelka.Canvas.Brush.Color := cl;
end;


// Нажатие на списке сделок у менеджера
procedure TfrmMain.grManagerSdelkaCellClick(Column: TColumn);
begin
	// моежт, менеджер нажал на "чекбокс" в поле "к оплате"?
	if ((Column.Title.Caption = 'К оплате') and (Column.Field.DataSet.FieldByName('SD_STATE').AsInteger = SD_TO_PAY) and (Column.Field.DataSet.FieldByName('PT_ID').AsInteger = PAY_NAL)) then // "нал"
	begin
		try
			if (not (grManagerSdelka.DataSource.DataSet.State in [dsEdit,dsInsert])) then
				grManagerSdelka.DataSource.DataSet.Edit;

			if (Column.Field.AsInteger = 0) then
				Column.Field.AsInteger := 1
			else
				Column.Field.AsInteger := 0;


			grManagerSdelka.DataSource.DataSet.CheckBrowseMode;
			TClientDataSet(grManagerSdelka.DataSource.DataSet).ApplyUpdates(0);
		except
			btRefreshManager.Click;
		end;
	end;
end;


// Нажатие "Принять деньги" у менеджера
procedure TfrmMain.btGetMoneyClick(Sender: TObject);
var
	sum: Currency;
	wasSd: boolean; // были сделки?
begin
	// менеджер принимает наличные по сделкам "к оплате"

	updateSdelkaViews := false;

	data.cdsSdelka.First;
	sum   := 0;
	wasSd := false;

	// пошли считать сумму...
	while (not data.cdsSdelka.Eof) do
	begin
		if (data.cdsSdelkaSD_PAY_NOW.AsInteger = 1) then
		begin
			sum   := sum + data.cdsSdelkaSD_SUM.Value;
			wasSd := true;
		end;
		data.cdsSdelka.Next;
	end;

	if (MessageDlg('Общая сумма к сдаче по выделенным сделкам: '+format('%.2f',[sum])+'.'+#13#10+'Принять деньги?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
	begin
		if (wasSd) then
		begin

			// отметим сделки, как "текущие", но ApplyUpdates делать не будем
			data.cdsSdelka.First;
			while (not data.cdsSdelka.Eof) do
			begin
				if (data.cdsSdelkaSD_PAY_NOW.AsInteger = 1) then
				begin
					if (not (data.cdsSdelka.State in [dsEdit,dsInsert])) then
						data.cdsSdelka.Edit;
					data.cdsSdelkaSD_STATE.AsInteger := SD_CURRENT;
					data.cdsSdelka.CheckBrowseMode;
				end;
				data.cdsSdelka.Next;
			end;

			// стартуем транзакцию (тут с транзакциями как-то криво всё написано
			// было, но работает, так что пока не трогаем)
			data.connection.StartTransaction(tr);

			// записываем изменения в сделках
			if (data.connection.InTransaction) then
				data.cdsSdelka.ApplyUpdates(0);

			// добавляем запись в кассу
			data.spAddSumForManager.ParamByName('M_ADD').AsFloat      := sum;
			data.spAddSumForManager.ParamByName('M_COMMENT').AsString := 'Сдал деньги агент ' + data.cdsAgentAG_NAME.AsString;
			data.spAddSumForManager.ParamByName('M_TYPE').AsInteger   := TRANSACTION_AGENT_SDAL;
			data.spAddSumForManager.ParamByName('M_US_ID').AsInteger  := currentUser;


			if (data.connection.InTransaction) then
				data.spAddSumForManager.ExecProc;

			// подтверждаем или откатываем транзакцию
			if (data.connection.InTransaction) then
				data.connection.Commit(tr)
			else
			begin
				data.cdsSdelka.CancelUpdates;
				data.cdsSdelka.Refresh;
			end;
		end;
	end;

	updateSdelkaViews := true;
	btRefreshManager.Click;
	data.cdsSdelkaAfterScroll(data.cdsSdelka);
end;


// Вызов диалога поиска сделки агентом
procedure TfrmMain.btFindSdelkaAgentClick(Sender: TObject);
begin
  case currentUserType of
  9:  frmFindSdelka.ShowModal(uSiteAdmin);
  10: frmFindSdelka.ShowModal(uViewer);
  else
	  frmFindSdelka.ShowModal(uAgent);
  end;
end;


// Вызов диалога поиска сделки менеджером
procedure TfrmMain.btFindSdelkaManagerClick(Sender: TObject);
begin
	frmFindSdelka.ShowModal(uManager);
end;


// Сохраняем список агентов
procedure TfrmMain.btSaveAgentsClick(Sender: TObject);
begin
	data.qryAgents.CheckBrowseMode;
	data.qryAgents.ApplyUpdates(0);
end;


// Сохраняем список пользователей
procedure TfrmMain.btSaveUsersClick(Sender: TObject);
begin
	data.qryUsr.CheckBrowseMode;
	data.qryUsr.ApplyUpdates(0);
end;


// Сохраняем спиок прав доступа пользователей к агентам
procedure TfrmMain.btSaveUserRightsClick(Sender: TObject);
begin
	data.qryUsrRights.CheckBrowseMode;
	data.qryUsrRights.ApplyUpdates(0);
end;

// Сохраняем список выпусков газеты
procedure TfrmMain.btSaveIssuesClick(Sender: TObject);
var i,cnt:integer;
    last_is_name:string;
    last_is_date:TDateTime;
    cur_is_name:string;
    cur_is_date:TDateTime;
    weekDay:word;
begin
  if (trim(txtIss.Text) <> '') then
  begin
      cnt := strToInt(txtIss.Text);
      data.qryIssue.Last;
      last_is_name := data.qryIssueIS_NAME.AsString;
      last_is_date := SQLTimeStampToDateTime(data.qryIssueIS_DATE.AsSQLTimeStamp);

      case cbGazetaForIssue.KeyValue of
          1:
          for i := 1 to cnt do
          begin
              cur_is_date := incDay(last_is_date , 7);
              cur_is_name := intToStr(strToInt(last_is_name) + i);

              data.qryIssue.Insert;
              data.qryIssueGZ_ID.AsInteger := data.tblGazetaGZ_ID.AsInteger;
              data.qryIssueIS_NAME.AsString := cur_is_name;
              data.qryIssueIS_DATE.AsSQLTimeStamp := DateTimeToSQLTimeStamp(cur_is_date);
              data.qryIssue.Post;

              last_is_date := cur_is_date;
          end;
          3:
          for i := 1 to cnt do
          begin
               cur_is_date := incDay(last_is_date , 1);
               weekDay := DayOfTheWeek(cur_is_date);

               while not (weekDay in [1, 2, 3, 4]) do
               begin
                    cur_is_date := incDay(cur_is_date , 1);
                    weekDay := DayOfTheWeek(cur_is_date);
               end;
               cur_is_name := intToStr(strToInt(last_is_name) + i);

              data.qryIssue.Insert;
              data.qryIssueGZ_ID.AsInteger := data.tblGazetaGZ_ID.AsInteger;
              data.qryIssueIS_NAME.AsString := cur_is_name;
              data.qryIssueIS_DATE.AsSQLTimeStamp := DateTimeToSQLTimeStamp(cur_is_date);
              data.qryIssue.Post;

              last_is_date := cur_is_date;
          end;
      end;
      txtIss.Text := '';
  end;

	data.qryIssue.CheckBrowseMode;
	data.qryIssue.ApplyUpdates(0);

  data.qryIssue.Close;
  data.qryIssue.Open;
  data.qryIssue.Last;
end;

procedure TfrmMain.HideIssues();
var v:string;
begin
    v := data.GetParamValue('PM_PRINFO');

    N1.Visible := v = '1';
    N5.Visible := v = '1';
    N8.Visible := v = '1';
    N9.Visible := v = '1';
    N2.Visible := v = '1';
    N4.Visible := v = '1';
end;


// Выбираем нового пользователя/агента
procedure TfrmMain.btChooseUserClick(Sender: TObject);
var
	usid, agid: integer;
begin
	usid := currentUser;
	agid := data.cdsAgentAG_ID.Value;
	if (frmChooseUser.selectUserAndAgentNew(usid, agid)) then
	begin
		currentUser := usid;
		data.cdsAgent.Locate('AG_ID', agid, []);
		data.qryUsr.Locate('US_ID', usid, []);
		currentUserType := data.qryUsrUS_TYPE.Value;
    canUserBlockCover := boolean(data.qryUsrUS_CAN_BLOCK_COVER.AsInteger);

		if (data.qryUsrUS_CAN_EDIT_CUST_UNIQUE.Value = 1) then
			currentUserCanEditCustUnique := true
		else
			currentUserCanEditCustUnique := false;

		// применим права доступа выбранного типа пользователя...
		TAccessRightsManager.SetWindowAccessState(int2user(data.qryUsrUS_TYPE.Value), frmMain);

		TAccessRightsManager.SetWindowAccessState(int2user(data.qryUsrUS_TYPE.Value), frmMain.pnlReports1);
		TAccessRightsManager.SetWindowAccessState(int2user(data.qryUsrUS_TYPE.Value), frmMain.pnlReports2);

		TAccessRightsManager.SetWindowAccessState(int2user(data.qryUsrUS_TYPE.Value), frmMain.agentCusts);

		// подготовим программу к работе выбранного типа пользователя...
		if (data.qryUsrUS_TYPE.Value = PRG_USR_PAYMENTS) then
		begin
			pages.ActivePage := tbPayments;
      tbPayments.PageIndex := 1;
      
			data.cdsCust.Close;
			data.cdsCust.Params.ParamByName('SHOW_ALL').AsInteger := 1;
		end
		else if (data.qryUsrUS_TYPE.Value in [PRG_USR_AGENT,PRG_USR_VIEWER]) then
		begin
			pages.ActivePage := tbAgent;

      HideIssues();

			setSdelkaSQL(mmAgentSQL.Lines);

			setCustSQL(true);

			if (not data.cdsSdelka.Active) then
				data.cdsSdelka.Open
			else
				data.cdsSdelka.Refresh;
		end
		else if (data.qryUsrUS_TYPE.Value = PRG_USR_MANAGER) then
		begin
			pages.ActivePage := tbManager;

			setSdelkaSQL(mmManagerSQL.Lines);

			setCustSQL(true);

			if (not data.cdsSdelka.Active) then
				data.cdsSdelka.Open
			else
				data.cdsSdelka.Refresh;
		end
		else if (data.qryUsrUS_TYPE.Value = PRG_USR_ADMIN) then
		begin
			pages.ActivePage := tbAdmin;

			setCustSQL(true);

		end
		else if (data.qryUsrUS_TYPE.Value = PRG_USR_NABOR) then
		begin
      pages.ActivePage := tbNabor;

		 	if (publData = nil) then
				Application.CreateForm(TpublData, publData);

			if (publData.cdsObjavForKorrektura.Active) then publData.cdsObjavForKorrektura.Close;

			if (publData.cdsObjavVerstkaDifference.Active) then publData.cdsObjavVerstkaDifference.Close;

			if (publData.cdsObjavSverstano.Active) then publData.cdsObjavSverstano.Close;
      
			if (publData.cdsChangeCount.Active) then publData.cdsChangeCount.Close;

			//	publData.cdsContentSiteObjavs.Open;

      if not Assigned(frmSite_Objav) then
      begin
               frmSite_Objav := TfrmSite_Objav.Create(self);
               frmSite_Objav.Dock(tabSiteObjav, tabSiteObjav.ClientRect);
               frmSite_Objav.cbGazetaModuliSite.KeyValue := GZ_PR;
               frmSite_Objav.Show;
      end;

      if not Assigned(frmNabor) then
      begin
           frmNabor := TfrmNabor.Create(self);
           frmNabor.cbSdelkaNaborGazeta.KeyValue := GZ_PR;
           frmNabor.Dock(tbNabor, tbNabor.ClientRect);
           frmNabor.Show;
      end;
		end
		else if (data.qryUsrUS_TYPE.Value = PRG_USR_DESIGN) then
		begin
			pages.ActivePage := tbDesign;

			setCustSQL(false);

			if (publData = nil) then
				Application.CreateForm(TpublData, publData);
			if (publData.cdsObjavForKorrektura.Active) then
				publData.cdsObjavForKorrektura.Close;
			if (publData.cdsObjavVerstkaDifference.Active) then
				publData.cdsObjavVerstkaDifference.Close;
			if (publData.cdsObjavSverstano.Active) then
				publData.cdsObjavSverstano.Close;
			if (publData.cdsChangeCount.Active) then
				publData.cdsChangeCount.Close;

      if not Assigned(frmDesign) then
      begin
           frmDesign := TfrmDesign.Create(self);
           frmDesign.cbGazetaDesign.KeyValue := GZ_PR;
           frmDesign.Dock(tbDesign, tbDesign.ClientRect);
           frmDesign.Show
      end;

		end
		else if (data.qryUsrUS_TYPE.Value = PRG_USR_KORRECTURA) then
		begin
			pages.ActivePage := tbKorrectura;

			setCustSQL(false);

			if (publData = nil) then
				Application.CreateForm(TpublData, publData);

			if (publData.cdsObjavForKorrektura.Active) then
				publData.cdsObjavForKorrektura.Close;

      publData.cdsObjavForKorrektura.FetchParams;
      publData.cdsObjavForKorrektura.Params.ParamByName('GZ_ID').AsInteger := GZ_PR;
      publData.cdsObjavForKorrektura.Params.ParamByName('IS_ID').AsInteger := StrToInt(data.GetParamValue('PM_CURRENT_ISSUE_PR'));
			publData.cdsObjavForKorrektura.Open;

      cbGZ.KeyValue := GZ_PR;

      publData.qIssue.ParamByName('GZ_ID').AsInteger := GZ_PR;
      publData.qIssue.Open;

      publData.qIssue.Locate('IS_ID', publData.cdsObjavForKorrektura.Params.ParamByName('IS_ID').AsInteger, []);
      cboIss.ItemIndex := cboIss.Items.IndexOf(publData.qIssue.fieldByName('IS_NAME_COMPOSED').AsString);

			if (publData.cdsObjavVerstkaDifference.Active) then
				publData.cdsObjavVerstkaDifference.Close;
			if (publData.cdsObjavSverstano.Active) then
				publData.cdsObjavSverstano.Close;
			if (publData.cdsChangeCount.Active) then
				publData.cdsChangeCount.Close;
		end
		else if (data.qryUsrUS_TYPE.Value = PRG_USR_VERSTKA) then
		begin
			pages.ActivePage := tbVerstka;


			setCustSQL(false);

			if (publData = nil) then
				Application.CreateForm(TpublData, publData);

			if (publData.cdsObjavForKorrektura.Active) then
				publData.cdsObjavForKorrektura.Close;
		end
    else if (data.qryUsrUS_TYPE.Value = PRG_USR_SITE_ADMIN) then
    begin
        pages.ActivePage := tbReports;
    end
    else application.Terminate;


    if (data.qryCheckAgentLocked.Active) then
		data.qryCheckAgentLocked.Close;

	  data.qryCheckAgentLocked.ParamByName('AG_ID').AsInteger := data.cdsAgentAG_ID.Value;

	  data.qryCheckAgentLocked.Open();

	  if (data.tblParams.Active) then data.tblParams.Close;
	  data.tblParams.Open;

		frmMain.Caption :=   'Учет сделок: пользователь ' + data.qryUsrUS_NAME.Value
						   + ' (агент ' + data.cdsAgentAG_NAME.Value + ')';
	end;
end;


// Перестроить заново отказник
procedure TfrmMain.btRefreshOtkaznikClick(Sender: TObject);
begin
  if MEssageBox(Handle, 'Вы уверены что хотите обновить отказник?','Prinfo', MB_YESNO or MB_ICONQUESTION) = mrYes then
	with data do
	begin
		tblOtkaznik.Close;
    {k := tblParamsPM_FIRST_OTKAZNIK_ISSUE_PR.Value;
		spRefreshOtkaznik.ParamByName('LAST_ISSUE_PR').AsInteger := k;

    k := tblParamsPM_FIRST_OTKAZNIK_ISSUE_NS.Value;
		spRefreshOtkaznik.ParamByName('LAST_ISSUE_NS').AsInteger := k;

    k := tblParamsPM_FIRST_OTKAZNIK_ISSUE_SR.Value;
		spRefreshOtkaznik.ParamByName('LAST_ISSUE_SR').AsInteger := k;

    k := tblParamsPM_FIRST_OTKAZNIK_ISSUE_RZ.Value;
    spRefreshOtkaznik.ParamByName('LAST_ISSUE_RZ').AsInteger := k;

    k := tblParamsPM_FIRST_OTKAZNIK_ISSUE_RK.Value;
    spRefreshOtkaznik.ParamByName('LAST_ISSUE_RK').AsInteger := k;}
    spRefreshOtkaznik.ExecProc();
    
		tblOtkaznik.Open();

    MessageBox(Handle, 'Обновление отказника успешно завершено.', 'Prinfo', MB_OK or MB_ICONINFORMATION)
	end;
end;


// Напечатать отказник
procedure TfrmMain.btPrintOtkaznikClick(Sender: TObject);
var
	s,prev: string;
	nFirst,cnt: integer;
	f: OleVariant;
	browser: TWebBrowser;
	sl: TStringList;
begin
	sl := TStringList.Create();
	with sl do
	begin
		frmWait.Show;
		Application.ProcessMessages;
		nFirst := 3;
		prev   := '';
		Clear;
		Add('<HTML><HEAD><TITLE>Отказник</TITLE></HEAD><BODY><FONT FACE=Tahoma SIZE=-2>');
		data.tblOtkaznik.First;
		data.tblOtkaznik.DisableControls;
		while (not data.tblOtkaznik.EOF) do
		begin
			cnt  := 0;
			prev := copy(data.tblOtkaznikOT_NUMBER.Value,1,nFirst);
			Add('<BR>');
			Add(prev+'<BR>');
			s := '';
			while (not data.tblOtkaznik.EOF)and
				  (prev = copy(data.tblOtkaznikOT_NUMBER.Value, 1, nFirst))and
				  (cnt < 10) do
			begin
				s := s + copy(data.tblOtkaznikOT_NUMBER.Value,
						  nFirst+1,
						  length(data.tblOtkaznikOT_NUMBER.Value)-nFirst)+
					 ' ';
				data.tblOtkaznik.Next;
			end;
			Add(s);
		end;
		Add('</FONT></BODY></HTML>');
		SaveToFile('c:\tmp.html');
		data.tblOtkaznik.First;
		data.tblOtkaznik.EnableControls;
		frmWait.Hide;

		f := navOpenInNewWindow;
		browser := TWebBrowser.Create(frmMain);
		browser.Navigate('c:\tmp.html', f);
		browser.Free;
	end;
	sl.Free();
end;


// Добавление откзаника из файла
procedure TfrmMain.btImportOtkaznikClick(Sender: TObject);
var
	sl,sr: TStringList;
	i,j: integer;
	re: TRegExpr;
begin
	frmWait.Show;
	Application.ProcessMessages;
	if (dlgOpen.Execute) then
		with data do
		begin
			sl := TStringList.Create;
			try
				sl.LoadFromFile(dlgOpen.FileName);
			except
				MessageDlg('Ошибка открытия отказника. Файл недоступен.', mtError, [mbOk], 0);
				frmWait.Hide;
				exit;
			end;
			sl.Delete(0);

			re := TRegExpr.Create;
			re.Expression := '\s+';
			sr := TStringList.Create;
			if tblOtkaznik.Active then
				tblOtkaznik.Close;
			tblOtkaznik.Open;
			for j := 0 to sl.Count - 1 do
			begin
				sr.Clear;
				re.Split(sl[j], sr);
				if (sr.Count > 0) then
					for i := 1 to sr.Count - 1 do
						if sr[i] <> '' then
						begin
							spAddToOtkaznik.ParamByName('PH_NUMBER').Value := sr[0] + sr[i];
							spAddToOtkaznik.ExecProc;
						end;
			end;
			tblOtkaznik.Open;

			sr.Free;
			sl.Free;
		end;
	frmWait.Hide;
end;


// Сохранение отказника в файл
procedure TfrmMain.btSaveOtkaznikToFileClick(Sender: TObject);
var
	s,prev: string;
	nFirst,cnt: integer;
	sl: TStringList;
begin
	sl := TStringList.Create();
	if (dlgSave.Execute) then
		with sl do
		begin
			frmWait.Show;
			Application.ProcessMessages;
			nFirst := 3;
			prev   := '';
			Clear;
			Add('Дата: ' + DateToStr(Date));
			Add('');
			data.tblOtkaznik.First;
			data.tblOtkaznik.DisableControls;
			while (not data.tblOtkaznik.EOF) do
			begin
				cnt  := 0;
				prev := copy(data.tblOtkaznikOT_NUMBER.Value, 1, nFirst);
				s:='';
				while (not data.tblOtkaznik.EOF)and
					  (prev = copy(data.tblOtkaznikOT_NUMBER.Value, 1, nFirst)) and
					  (cnt < 10) do
				begin

					s := s + copy(data.tblOtkaznikOT_NUMBER.Value,
							  nFirst+1,
							  length(data.tblOtkaznikOT_NUMBER.Value) - nFirst)+
						 ' ';
					data.tblOtkaznik.Next;
				end;
				Add(prev + '  ' + s);
			end;
			SaveToFile(dlgSave.FileName);
			data.tblOtkaznik.First;
			data.tblOtkaznik.EnableControls;
			frmWait.Hide;
		end;
	sl.Free();
end;


// Принять деньги в кассу или выдать из кассы
procedure TfrmMain.btGetGiveMoneyClick(Sender: TObject);
begin
	try
		if (StrToFloat(edAddSum.Text) < 0) then
			raise EConvertError.Create('Сумма должна быть положительной.');
	except
		on E:EConvertError do
		begin
			MessageDlg('Недопустимое значение в поле "Сумма": ' + E.Message, mtError, [mbOk], 0);
			exit;
		end;
	end;
	data.spAddSumForManager.ParamByName('M_ADD').AsFloat      := StrToFloat(edAddSum.Text);
	data.spAddSumForManager.ParamByName('M_COMMENT').AsString := edAddComment.Text;
	data.spAddSumForManager.ParamByName('M_TYPE').AsInteger   := cbTransactionType.KeyValue;
	data.spAddSumForManager.ParamByName('M_US_ID').AsInteger  := currentUser;
	data.spAddSumForManager.ExecProc;
end;


// Обновить список денеждных транзакций
procedure TfrmMain.btRefreshMoneyTransactionsClick(Sender: TObject);
var
	pt: integer;
begin
	data.qryMoneyTransactions.DataSet.ParamByName('US_ID').AsInteger  :=  currentUser;
	data.qryMoneyTransactions.DataSet.ParamByName('DATE_FROM').AsDate :=  dtpTransFrom.Date;
	data.qryMoneyTransactions.DataSet.ParamByName('DATE_TO').AsDate   := dtpTransTo.Date + 1;

	pt := TIntHolder(cbTranTypeFilter.Items.Objects[cbTranTypeFilter.ItemIndex]).value;
	if (pt = -3) then
	begin
		data.qryMoneyTransactions.Filtered := false
	end
	else if (pt = -2) then
	begin
		data.qryMoneyTransactions.Filter   := 'MT_CHANGE<=0';
		data.qryMoneyTransactions.Filtered := true;
	end
	else if (pt = -1) then
	begin
		data.qryMoneyTransactions.Filter   := 'MT_CHANGE>=0';
		data.qryMoneyTransactions.Filtered := true;
	end
	else
	begin
		data.qryMoneyTransactions.Filter   := 'TT_ID=' + IntToStr(pt);
		data.qryMoneyTransactions.Filtered := true;
	end;

    if (not data.qryMoneyTransactions.Active) then
    	data.qryMoneyTransactions.Open;
    data.qryMoneyTransactions.Refresh;
end;


// Показать номера выходов для выбранной газеты
procedure TfrmMain.btShowIssuesForGazetaClick(Sender: TObject);
begin
	if (data.qryIssue.Active) then
		data.qryIssue.Close;
	data.qryIssue.Params.ParamByName('GZ_ID').Value := cbGazetaForIssue.KeyValue;
	data.qryIssue.Open;
  data.qryIssue.Last;
end;


procedure TfrmMain.FormShow(Sender: TObject);
begin
	// Если программа только запустилась - дадим выбрать пользователя
	if (firstTime) then
		btChooseUser.Click;
	firstTime:=false;
  cdGzFormatCloseUp(Sender);
  DetectActivePage();
end;

procedure TfrmMain.DetectActivePage;
begin
    case currentUserType of
         9:  begin
                pages.ActivePage := tbAgent;
                PageControl1.ActivePage := TabSheet9;
             end;
         10: pages.ActivePage := tbAgent;
    end;
end;

procedure TfrmMain.btModuliByDesignerClick(Sender: TObject);
var
	rep: THtmlReport;
begin
	rep := THtmlReport.Create();
	rep.TempName := 'PrInfo-moduli-by-designer';
	rep.Add('<HTML><HEAD><TITLE>Количество загруженных модулей по дизайнерам за ' + edModuliByDesignerFrom.Text + '-' + edModuliByDesignerTo.Text + '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

	rep.AddStrings(ModuliByDesignerPrint(StrToDate(edModuliByDesignerFrom.Text), StrToDate(edModuliByDesignerTo.Text)));

	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;

function TfrmMain.ModuliByDesignerPrint(dateFrom,
  dateTo: TDateTime): TStringList;
var
	rep: TStringList;
	qry: TSQLQuery;
begin
	qry := repData.qryModuliByDesigner;

	if (qry.Active) then
		qry.Close();
	qry.ParamByName('DATE_FROM').AsDate := dateFrom;
	qry.ParamByName('DATE_TO').AsDate := dateTo;

	qry.Open();

	rep := TStringList.Create();
	rep.Add('<CENTER><B> Количество загруженных модулей по дизайнерам за ' + DateToStr(dateFrom) + ' - ' + DateToStr(dateTo) + '</B></CENTER>');

	rep.Add(getTableHeader(qry, 13));

	qry.First();
	while (not qry.Eof) do
	begin
		rep.Add(getTableRow(qry, 13, nil));
		qry.Next();
	end;

	rep.Add('</TABLE>');

	Result := rep;
	qry.Close();
end;


procedure TfrmMain.pagesChange(Sender: TObject);
begin
	data.cdsSdelkaAfterScroll(data.cdsSdelka);
  if pages.ActivePage = tabCover then createCover
end;

procedure TfrmMain.tbPercentShow(Sender: TObject);
begin
	if (data.cdsSdelka.Active) then
		data.cdsSdelka.Close;
end;


// Выдача процента по сделкам - сейчас не используется
procedure TfrmMain.grPercentCellClick(Column: TColumn);
begin
	if (Column.Title.Caption = 'Выдать процент') then
	begin
		if (not (grPercent.DataSource.DataSet.State in [dsEdit,dsInsert])) then
			grPercent.DataSource.DataSet.Edit;
		if ((Column.Field.AsInteger = 0) or (Column.Field.IsNull)) then
			Column.Field.AsInteger := 1
		else
			Column.Field.AsInteger := 0;
		grPercent.DataSource.DataSet.Post;
	end;
end;


// Выдача процента по сделкам - сейчас не используется
procedure TfrmMain.grPercentDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
	cl: TColor;
begin
	cl := grPercent.Canvas.Brush.Color;
	if (Column.FieldName = 'AS_ID') then
	begin
		if (Column.Field.Value = 0) then
			grPercent.Canvas.Brush.Color := clGreen
		else
			if (Column.Field.Value = 1) then
				grPercent.Canvas.Brush.Color := clRed;
		grPercent.Canvas.FillRect(Rect);
	end;

	if (Column.Title.Caption = 'Выдать процент') then
	begin
		if ((Column.Field.Value = 0) or (Column.Field.IsNull)) then
		begin
			grPercent.Canvas.FillRect(Rect);
			grPercent.Canvas.Draw(Rect.Left + ((Rect.Right-Rect.Left - 11) div 2), Rect.Top + ((Rect.Bottom - Rect.Top - 11) div 2), imgUnchecked.Picture.Bitmap);
		end
		else if (Column.Field.Value > 0) then
		begin
			grPercent.Canvas.FillRect(Rect);
			grPercent.Canvas.Draw(Rect.Left + ((Rect.Right - Rect.Left - 11) div 2), Rect.Top + ((Rect.Bottom - Rect.Top - 11) div 2), imgChecked.Picture.Bitmap)
		end;
	end;
	grPercent.Canvas.Brush.Color := cl;
end;


// Выдача процента по сделкам - сейчас не используется
procedure TfrmMain.btGivePercentClick(Sender: TObject);
var
	sum:Currency;
begin
	data.cdsSdelka.First;
	sum := 0;
	while (not data.cdsSdelka.Eof) do
	begin
		if (data.cdsSdelkaSD_TO_GIVE_PERCENT.AsInteger = 1) then
		begin
			sum := sum + data.cdsSdelkaSD_PERCENT_SUM.Value;
		end;
		data.cdsSdelka.Next;
	end;
	if (MessageDlg('Общая сумма к выдаче по выделенным сделкам: '+format('%.2f',[sum])+'.'+#13#10+'Выдать деньги?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
	begin
		if (sum > 0) then
		begin
			data.cdsSdelka.First;
			while (not data.cdsSdelka.Eof) do
			begin
				if (data.cdsSdelkaSD_TO_GIVE_PERCENT.AsInteger = 1) then
				begin
					if (not (data.cdsSdelka.State in [dsEdit,dsInsert])) then
						data.cdsSdelka.Edit;
					data.cdsSdelkaSD_PERCENT_GIVEN.AsInteger := 1;
					data.cdsSdelka.CheckBrowseMode;
				end;
				data.cdsSdelka.Next;
			end;
            data.cdsSdelka.ApplyUpdates(0);

			data.spAddSumForManager.ParamByName('M_ADD').AsFloat      := sum;
			data.spAddSumForManager.ParamByName('M_COMMENT').AsString := 'Выдан процент агенту ' + data.cdsAgentAG_NAME.AsString;//+' по сделкам '+sdids;
			data.spAddSumForManager.ParamByName('M_TYPE').AsInteger   := 5;
			data.spAddSumForManager.ParamByName('M_US_ID').AsInteger  := currentUser;
			data.spAddSumForManager.ExecProc;
		end;
	end;

    data.cdsSdelka.Refresh;
end;


// Выдача процента по сделкам - сейчас не используется
procedure TfrmMain.BitBtn5Click(Sender: TObject);
begin
	updateSdelkaViews := false;
	with data do
	begin
		cdsSdelka.First;
		while (not cdsSdelka.Eof) do
		begin
			if (not (grPercent.DataSource.DataSet.State in [dsEdit, dsInsert])) then
				grPercent.DataSource.DataSet.Edit;
			cdsSdelkaSD_TO_GIVE_PERCENT.AsInteger := 1;
			grPercent.DataSource.DataSet.Post;
			cdsSdelka.Next;
		end;
	end;
	updateSdelkaViews := true;
end;

procedure TfrmMain.btSdelkaByPeriodClick(Sender: TObject);
begin
	repData.Report_SdelkaByPeriod(currentUser,cbAllAgents.Checked, cbOneWindow.Checked, StrToDate(edAgRepFrom.Text), StrToDate(edAgRepTo.Text));
end;


// Сохранить параметры
procedure TfrmMain.btSaveParamsClick(Sender: TObject);
begin
	data.tblParams.CheckBrowseMode;
	data.tblParams.ApplyUpdates(0);
end;


// Новая сделка в ПР
procedure TfrmMain.actNewSdelkaVGazetuPRExecute(Sender: TObject);
begin
	if (tbAgent.TabVisible) then
	begin
		TfrmSdelkaForm.New(data.cdsAgentAG_ID.Value, SD_TYPE_GAZETA, GZ_PR);
		btRefresh.Click();
	end;
end;

// Новая сделка в НС
procedure TfrmMain.actNewSdelkaVGazetuNSExecute(Sender: TObject);
begin
	if (tbAgent.TabVisible) then
	begin
		TfrmSdelkaForm.New(data.cdsAgentAG_ID.Value, SD_TYPE_GAZETA, GZ_NS);
		btRefresh.Click();
	end;
end;

// Новая сделка в СР
procedure TfrmMain.actNewSdelkaVGazetuSRExecute(Sender: TObject);
begin
	if (tbAgent.TabVisible) then
	begin
		TfrmSdelkaForm.New(data.cdsAgentAG_ID.Value, SD_TYPE_GAZETA, GZ_ST);
		btRefresh.Click();
	end;
end;


// Новая сделка в КА
procedure TfrmMain.actNewSdelkaVKAExecute(Sender: TObject);
begin
	if (tbAgent.TabVisible) then
	begin
		TfrmSdelkaForm.New(data.cdsAgentAG_ID.AsInteger, SD_TYPE_KA);
		btRefresh.Click();
	end;
end;
    // Новая сделка в "Работа в Киеве"
procedure TfrmMain.actNewSdelkaVRKExecute(Sender: TObject);
begin
	if (tbAgent.TabVisible) then
	begin
		TfrmSdelkaForm.New(data.cdsAgentAG_ID.Value, SD_TYPE_GAZETA, GZ_RK);
		btRefresh.Click();
	end;
end;

// Новая сделка в РДЖ
procedure TfrmMain.actNewSdelkaVRDZExecute(Sender: TObject);
begin
	if (tbAgent.TabVisible) then
	begin
		TfrmSdelkaForm.New(data.cdsAgentAG_ID.Value, SD_TYPE_GAZETA, GZ_RZ);
		btRefresh.Click();
	end;
end;


// Показать/скрыть окошко просмотра сделки в правой части окна программы (агент)
procedure TfrmMain.btShowSdelkaViewClick(Sender: TObject);
begin
	sdelkaView.Visible := not SdelkaView.Visible;
	if (sdelkaView.Visible) then
		btShowSdelkaView.Caption := 'убрать >>'
	else
		btShowSdelkaView.Caption := 'подробно <<';
	data.cdsSdelkaAfterScroll(data.cdsSdelka);
end;


// Показать/скрыть окошко просмотра сделки в правой части окна программы (менеджер)
procedure TfrmMain.btShowSdelkaViewForManagerClick(Sender: TObject);
begin
	sdelkaViewForManager.Visible := not sdelkaViewForManager.Visible;
	if (sdelkaViewForManager.Visible) then
		btShowSdelkaViewForManager.Caption := 'убрать >>'
	else
		btShowSdelkaViewForManager.Caption := 'подробно <<';
	data.cdsSdelkaAfterScroll(data.cdsSdelka);
end;

procedure TfrmMain.btAgRepByIssueClick(Sender: TObject);
begin
	repData.Report_AgentByIssue(  currentUser
								, cbAllAgents.Checked
								, cbOneWindow.Checked
								, cbDoubles.Checked
								, cbAgRepByIssueGazeta.KeyValue
								, cbAgRepByIssueIssue.KeyValue
								, cbAgRepByIssueIssue.Text);
end;


// Редактировать сделку (менеджер)
procedure TfrmMain.btEditSdelkaManagerClick(Sender: TObject);
begin
	data.DoUpdateSdelkaViews();
	TfrmSdelkaForm.Edit(data.cdsSdelka.FieldByName('AG_ID').AsInteger, data.cdsSdelka.FieldByName('SD_ID').AsInteger, uManager, sdelkaViewForManager);
	btRefreshManager.Click;
end;


// отчёты...
function TfrmMain.ZapasByTimePrint(agid:integer;agname:string):TStringList;
var
	rep: TStringList;
	qry: TSQLQuery;
begin
	qry := repData.qryZapasByTime;

	if (qry.Active) then
		qry.Close();
	qry.ParamByName('AG_ID').AsInteger  := agid;
	qry.ParamByName('DATE_FROM').AsDate :=StrToDate(edZapasFrom.Text);
	qry.ParamByName('DATE_TO').AsDate   := StrToDate(edZapasTo.Text)+1;
	qry.Open();

	rep := TStringList.Create();
	rep.Add('<CENTER><B>Запас агента ' + agname + ' за период ' + edZapasFrom.Text + '-' + edZapasTo.Text + '</B></CENTER>');

	rep.Add(getTableHeader(qry, 13));

	qry.First();
	while (not qry.Eof) do
	begin
		rep.Add(getTableRow(qry, 13, nil));
		qry.Next();
	end;

	rep.Add('</TABLE>');

	Result := rep;
  if qry.IsEmpty then result.Clear;
	qry.Close();
end;


// отчёты...
procedure TfrmMain.btZapasByTimeClick(Sender: TObject);
var
	rep: THtmlReport;
  res: TStringList;
begin
	rep := THtmlReport.Create();
	rep.TempName := 'PrInfo-agent-zapas-by-time';
	rep.Add('<HTML><HEAD><TITLE>Запас за период ' + edZapasFrom.Text + '-' + edZapasTo.Text + '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

	if (cbAllAgents.Checked) then
	with data do
	begin
		if (qryCurrentUserRights.Active) then
			qryCurrentUserRights.Close();
		qryCurrentUserRights.DataSet.ParamByName('US_ID').AsInteger := currentUser;
		qryCurrentUserRights.Open;

		qryCurrentUserRights.First();
		while (not qryCurrentUserRights.Eof) do
		begin
      res := ZapasByTimePrint(qryCurrentUserRightsAG_ID.Value,qryCurrentUserRightsAG_NAME.Value);
			rep.AddStrings(res);
			qryCurrentUserRights.Next();
      FreeAndNil(res);
		end;
	end
	else begin
    res := ZapasByTimePrint(data.cdsAgentAG_ID.Value,data.cdsAgentAG_NAME.Value);
		rep.AddStrings(res);
    FreeAndNil(res);
 end;
	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;


// отчёты...
procedure TfrmMain.btSdelkaNotPayedClick(Sender: TObject);
var
	rep: THtmlReport;
  gz_id: integer;
  res: TStringList;
  ds,de: TDateTime;
begin
	rep:=THtmlReport.Create();
	rep.TempName := 'PrInfo-agent-sdelka-not-payed';
	rep.Add('<HTML><HEAD><TITLE>Неоплаченные сделки</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

  gz_id := cboGZNP.ItemIndex;
  if gz_id = 0 then gz_id := -1
  else if gz_id = 6 then gz_id := 0
  else if gz_id = 7 then gz_id := 6;

  if edRepNotPayFrom.Text = '' then ds := MinDateTime else ds := StrToDate(edRepNotPayFrom.Text);
  if edRepNotPayTo.Text = '' then de := MaxDateTime else de := StrToDate(edRepNotPayTo.Text);

	if (cbAllAgents.Checked) then
	with data do
	begin
		if (qryCurrentUserRights.Active) then
			qryCurrentUserRights.Close();
		qryCurrentUserRights.DataSet.ParamByName('US_ID').AsInteger := currentUser;
		qryCurrentUserRights.Open;

		qryCurrentUserRights.First();
		while (not qryCurrentUserRights.Eof) do
		begin
      res := SdelkaNotPayedPrint(qryCurrentUserRightsAG_ID.Value, gz_id, qryCurrentUserRightsAG_NAME.Value, ds, de);
			rep.AddStrings(res);
			qryCurrentUserRights.Next();
      FreeAndNil(res);
		end;
	end
	else begin
    res := SdelkaNotPayedPrint(data.cdsAgentAG_ID.Value, gz_id, data.cdsAgentAG_NAME.Value, ds, de);
		rep.AddStrings(res);
    FreeAndNil(res);
  end;
	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;

function TfrmMain.SdelkaNotPayedPrint(agid, gzid:integer; agname: string; dateFrom: TDate; dateTo: TDate):TStringList;
var
	rep: TStringList;
	qry: TSQLQuery;

	sum_total, sum_beznal, sum_credit, sum_barter, sum_kassa: currency;
begin
	sum_total			:= 0;
	sum_beznal 			:= 0;
	sum_credit			:= 0;
	sum_barter 			:= 0;
  sum_kassa       := 0;

	qry := repData.qrySdelkaNotPayed;

	if (qry.Active) then
		qry.Close();

	qry.ParamByName('AG_ID').AsInteger	:= agid;
  qry.ParamByName('GZ_ID').AsInteger  := gzid;
 	qry.ParamByName('DS').AsDate	:= dateFrom;
  qry.ParamByName('DE').AsDate	:= dateTo;

	qry.Open();

	rep := TStringList.Create();

	rep.Add('<CENTER><B>Неоплаченные сделки агента ' + agname + '</B></CENTER>');

	rep.Add(getTableHeader(qry, 13));

	qry.First();
	while (not qry.Eof) do
	begin
		rep.Add(getTableRow(qry, 13, nil));

		sum_total := sum_total + qry.FieldByName('SD_SUM').AsCurrency;

		if (qry.FieldByName('PT_ID').AsInteger = 	PAY_BEZNAL) then
			sum_beznal 			:= sum_beznal 			+ qry.FieldByName('SD_SUM').AsCurrency

		else if (qry.FieldByName('PT_ID').AsInteger = 	PAY_CREDIT) then
			sum_credit 			:= sum_credit 			+ qry.FieldByName('SD_SUM').AsCurrency

		else if (qry.FieldByName('PT_ID').AsInteger = 	PAY_BARTER) then
			sum_barter 			:= sum_barter 			+ qry.FieldByName('SD_SUM').AsCurrency
    else if (qry.FieldByName('PT_ID').AsInteger = PAY_KASSA) then
      sum_kassa := sum_kassa + qry.fieldByName('SD_SUM').AsCurrency;

		qry.Next();
	end;

	rep.Add('</TABLE>');

	rep.Add('<B>Итог:</B><BR>');
	rep.Add(format('Общая сумма: %.2f<BR>',		[sum_total]));
	rep.Add(format('Безнал: %.2f<BR>',			[sum_beznal]));
	rep.Add(format('Кредит: %.2f<BR>',			[sum_credit]));
	rep.Add(format('Бартер: %.2f<BR>',			[sum_barter]));
  rep.Add(format('Касса: %.2f<BR>',       [sum_kassa]));

	Result := rep;
  if qry.IsEmpty then Result.Clear;
	qry.Close();
end;


procedure TfrmMain.btInterceptionsClick(Sender: TObject);
begin
	repData.Report_Interceptions();
end;


// отчёты...

procedure TfrmMain.btSdelkaCountSummaryClick(Sender: TObject);
var
	qry: TSQLQuery;
	rep: THtmlReport;
	s, barter_s: integer;
	ag_count, ka_count, inet_count, other_c_count, text_count, module_count, vip_count, new_cust_count, ttl_vac_count, reg_count: integer;
	ka_sum, inet_sum, inet_sum_payed, other_c_sum, nal_sum, bnal_sum, kredit_sum, kasa_sum, reg_sum: currency;
	payed_bnal, payed_kredit, payed_bnal_v_nal, payed_kasa: currency;
	ttl_objav_cost, avg_podacha_cost, avg_sdelka_cost: currency;
	bnal_v_nal_sum:currency;
  t:currency;

  i,k,l:integer;
begin
	qry := repData.qrySdelkaCountSummary;
	if (qry.Active) then
		qry.Close();

	qry.ParamByName('DATE_FROM').AsDate		:= StrToDate(edSdelkaCountFrom.Text);
	qry.ParamByName('DATE_TO').AsDate		:= StrToDate(edSdelkaCountTo.Text);
	qry.ParamByName('US_ID').AsInteger		:= currentUser;
	qry.ParamByName('REP_MODE').AsInteger	:= cbSdelkaCountSummaryMode.ItemIndex;

	data.qryUsr.Locate('US_ID',currentUser,[]);

	qry.Open();

	rep:=THtmlReport.Create();
	rep.TempName:='PrInfo-sdelka-count-summary';
	rep.Add('<HTML><HEAD><TITLE>Общий итог по сделкам</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');
	rep.Add('<CENTER><h1>Общий итог по сделкам за ' + edSdelkaCountFrom.Text + '-' + edSdelkaCountTo.Text + '<br> Для сделок: ' + cbSdelkaCountSummaryMode.Text + '</h1></CENTER>');

	rep.Add(getTableHeader(qry, 13));
  k := 0;
  if cbSdelkaCountSummaryMode.ItemIndex = 0 then l := 1 else l := 0;

  for i := 0 to l do             
  begin
     if (i = 1) and (cbSdelkaCountSummaryMode.ItemIndex = 0) then
     begin
         qry.Close;
         qry.ParamByName('REP_MODE').AsInteger := 6;
         qry.Open;
     end;

	ag_count := 0;

	qry.First();
	s					:=0;
	barter_s			:=0;
	nal_sum				:=0;
	bnal_sum			:=0;
	kredit_sum			:=0;
	kasa_sum			:=0;
	payed_bnal			:=0;
	payed_kredit		:=0;
	payed_bnal_v_nal	:=0;
	payed_kasa			:=0;
	bnal_v_nal_sum		:=0;

	ka_count		:= 0;
	inet_count		:= 0;
	other_c_count	:= 0;
	text_count		:= 0;
	module_count	:= 0;
	vip_count		:= 0;
	ka_sum			:= 0;
	inet_sum		:= 0;
  inet_sum_payed := 0;
	other_c_sum		:= 0;

	new_cust_count	:= 0;
	avg_podacha_cost:= 0;
	avg_sdelka_cost	:= 0;

	ttl_vac_count		:= 0;
  ttl_objav_cost  := 0;

  reg_count := 0;
  reg_sum := 0;

	while (not qry.Eof) do
	begin
    if i = 0 then rep.Add(getTableRow(qry, 13, nil));

		inc(ag_count);

		s				:= s				+ qry.FieldByName('SD_COUNT'			).Value;
		barter_s		:= barter_s			+ qry.FieldByName('BARTER_COUNT'		).AsInteger;
		nal_sum			:= nal_sum			+ qry.FieldByName('NAL_SUM'				).AsFloat;
		bnal_sum		:= bnal_sum			+ qry.FieldByName('BEZNAL_SUM'			).AsFloat;
		kredit_sum		:= kredit_sum		+ qry.FieldByName('KREDIT_SUM'			).AsFloat;
		kasa_sum		:= kasa_sum			+ qry.FieldByName('KASA_SUM'			).AsFloat;
		payed_bnal		:= payed_bnal		+ qry.FieldByName('PAYED_BEZNAL'		).AsFloat;
		payed_kredit	:= payed_kredit		+ qry.FieldByName('PAYED_CREDIT'		).AsFloat;
		payed_bnal_v_nal:= payed_bnal_v_nal	+ qry.FieldByName('PAYED_BEZNAL_V_NAL'	).AsFloat;
		payed_kasa		:= payed_kasa		+ qry.FieldByName('PAYED_KASA'			).AsFloat;
		bnal_v_nal_sum	:= bnal_v_nal_sum	+ qry.FieldByName('BEZNAL_V_NAL_SUM'	).AsFloat;

		ka_count 		:= ka_count 		+ qry.FieldByName('KA_COUNT'			).AsInteger;
		inet_count 		:= inet_count 		+ qry.FieldByName('INET_COUNT'			).AsInteger;
		other_c_count 	:= other_c_count 	+ qry.FieldByName('OTHER_CITY_COUNT'	).AsInteger;
		text_count 		:= text_count 		+ qry.FieldByName('OBJAV_TEXT_COUNT'	).AsInteger;
		module_count 	:= module_count		+ qry.FieldByName('OBJAV_MODULE_COUNT'	).AsInteger;
		vip_count 		:= vip_count 		+ qry.FieldByName('OBJAV_VIP_COUNT'		).AsInteger;
		ka_sum 			:= ka_sum 			+ qry.FieldByName('KA_SUM'				).AsFloat;
		inet_sum 		:= inet_sum 		+ qry.FieldByName('INET_SUM'			).AsFloat;
    inet_sum_payed := inet_sum_payed + qry.FieldByName('INET_PAYED_SUM').asFloat;
		other_c_sum		:= other_c_sum		+ qry.FieldByName('OTHER_CITY_SUM'		).AsFloat;

		new_cust_count	:= new_cust_count 	+ qry.FieldByName('NEW_CUST_COUNT'		).AsInteger;
		avg_podacha_cost:= avg_podacha_cost + qry.FieldByName('AVG_PODACHA_COST'	).AsFloat;
		avg_sdelka_cost	:= avg_sdelka_cost 	+ qry.FieldByName('AVG_SDELKA_COST'		).AsFloat;
		ttl_objav_cost	:= ttl_objav_cost 	+ qry.FieldByName('TTL_OBJAV_COST'		).AsFloat;

		ttl_vac_count	:= ttl_vac_count 	+ qry.FieldByName('TTL_VAC_COUNT'		).AsInteger;

    reg_count := reg_count + qry.FieldByName('REG_COUNT'		).AsInteger;
    reg_sum := reg_sum + qry.FieldByName('REG_SUM'		).AsInteger;

		qry.Next();
	end;

  if i = 0 then
  begin
	rep.Add('</TABLE>');
	rep.Add('<B>Итог:</B>');
	rep.Add('Всего сделок: ' + IntToStr(s) + '<BR>');
	rep.Add(format('Бартерных сделок: %d<BR>',		[barter_s]));
	rep.Add(format('Наличные: %.2f<BR>',			[nal_sum]));
	rep.Add(format('Безнал: %.2f<BR>',				[bnal_sum]));
	rep.Add(format('Безнал -> наличные (подтвержденные в период): %.2f<BR>', [bnal_v_nal_sum]));
	rep.Add(format('Кредит: %.2f<BR>',				[kredit_sum]));
	rep.Add(format('Касса: %.2f<BR>',				[kasa_sum]));
	rep.Add(format('Оплаченный безнал: %.2f<BR>',	[payed_bnal]));
	rep.Add(format('Оплаченный кредит: %.2f<BR>',	[payed_kredit]));
	rep.Add(format('Оплаченный безнал в нал: %.2f<BR>', [payed_bnal_v_nal]));
	rep.Add(format('Оплаченная касса: %.2f<BR>',  	[payed_kasa]));

	rep.Add('<BR>');

	rep.Add(format('Принесённая сумма (н + б + б>н + к + кс): %.2f<BR>', [nal_sum + bnal_sum + bnal_v_nal_sum + kredit_sum + kasa_sum]));
  k :=	rep.Add(format('Оплаченная сумма (н + б + б>н + к + кс): %.2f<BR>', [nal_sum + payed_bnal + payed_bnal_v_nal + payed_kasa + payed_kredit]));
  t := (nal_sum + bnal_sum + bnal_v_nal_sum + kredit_sum + kasa_sum);
	if (t <> 0) then
		rep.Add(format('Баланс оплат: %0.0f%%<BR>',[100 * ((nal_sum + payed_bnal + payed_bnal_v_nal + payed_kasa + payed_kredit) / t) - 100]));

	rep.Add('<BR>');

	rep.Add(format('Сделок в КА: %d<BR>',			[ka_count]));
	rep.Add(format('Сделок в интернет: %d<BR>',		[inet_count]));
	rep.Add(format('Сделок в интернет(регионы): %d<BR>',		[reg_count]));
 //	rep.Add(format('Сделок в регионы: %d<BR>',		[other_c_count]));
	rep.Add(format('Текстовых: %d<BR>',				[text_count]));
	rep.Add(format('Модульных: %d<BR>',				[module_count]));
	rep.Add(format('ВИПов: %d<BR>',					[vip_count]));
 //	rep.Add(format('Сумма в КА: %.2f<BR>',			[ka_sum]));
	rep.Add(format('Сумма в интернет: %.2f<BR>',	[inet_sum]));
	rep.Add(format('Сумма в интернет(регионы): %.2f<BR>',	[reg_sum]));
	rep.Add(format('Сумма в регионы: %.2f<BR>',		[other_c_sum]));

	rep.Add('<BR>');

	rep.Add(format('Новых клиентов: %d<BR>',		[new_cust_count]));
	if (s <> 0) then
		rep.Add(format('Ср. стоимость сделки: %.2f<BR>',[(nal_sum + bnal_sum + bnal_v_nal_sum + kredit_sum + kasa_sum) / s]));
  if ag_count > 0 then
	  rep.Add(format('Ср. стоимость подачи: %.2f<BR>',[avg_podacha_cost / ag_count]));
	if (ttl_vac_count <> 0) then
		rep.Add(format('Ср. стоимость вакансии: %.2f<BR>',[ttl_objav_cost / ttl_vac_count]));

  end
  else begin
     rep.Insert(k + 1, format('Принесённая сумма в интернет(н + б + б>н + к + кс): %.2f<BR>', [nal_sum + bnal_sum + bnal_v_nal_sum + kredit_sum + kasa_sum]));
     rep.Insert(k + 1, format('Оплаченная сумма в интернет(н + б + б>н + к + кс): %.2f<BR>', [nal_sum + payed_bnal + payed_bnal_v_nal + payed_kasa + payed_kredit]));
  end
  end;
	qry.Close();

	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;

// отчёты...
procedure TfrmMain.btVIPClick(Sender: TObject);
var
	rep: THtmlReport;
	count_ka, count_inet, count_total: integer;
	sum_ka, sum_inet, sum_total: Currency;
  res: TStringList;
begin
	count_ka	:= 0;
	count_inet	:= 0;
	count_total	:= 0;

	sum_ka		:= 0;
	sum_inet	:= 0;
	sum_total	:= 0;

	rep := THtmlReport.Create();
	rep.TempName := 'PrInfo-VIP-rep';
	rep.Add('<HTML><HEAD><TITLE>Отчёт по VIP-клиентам за ' + edVIPFrom.Text + '-' + edVIPTo.Text + '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

	if (cbAllAgents.Checked) then
	with data do
	begin
		if (qryCurrentUserRights.Active) then
			qryCurrentUserRights.Close();
		qryCurrentUserRights.DataSet.ParamByName('US_ID').AsInteger := currentUser;
		qryCurrentUserRights.Open;

		qryCurrentUserRights.First();
		while (not qryCurrentUserRights.Eof) do
		begin
      res := VIPPrint(  qryCurrentUserRightsAG_ID.Value
									, qryCurrentUserRightsAG_NAME.Value
									, count_ka, sum_ka, count_inet, sum_inet
									, count_total, sum_total);

      if res.Count > 0 then
      begin
    			rep.AddStrings(res);
		    	rep.Add('<HR><BR><BR>');
      end;

			qryCurrentUserRights.Next();
      FreeAndNil(res);
		end;
	end
	else
	begin
    res := VIPPrint(  data.cdsAgentAG_ID.Value
								, data.cdsAgentAG_NAME.Value
								, count_ka, sum_ka, count_inet, sum_inet
								, count_total, sum_total);

    if res.Count > 0 then
    begin
    		rep.AddStrings(res);
		    rep.Add('<HR><BR><BR>');
    end;

    FreeAndNil(res)
	end;

	rep.Add(format('Общее количество VIP в КА: %d<BR>',			[count_ka]));
	rep.Add(format('Общая сумма VIP в КА: %.2f<BR><BR>',		[sum_ka]));
	rep.Add(format('Общее количество VIP в интернет: %d<BR>',	[count_inet]));
	rep.Add(format('Общая сумма VIP в интернет: %.2f<BR><BR>',	[sum_inet]));
	rep.Add(format('Общее количество VIP: %d<BR>',				[count_total]));
	rep.Add(format('Общая сумма VIP: %.2f<BR>',					[sum_total]));

	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;

procedure TfrmMain.btFindSdelkaForPaymentClick(Sender: TObject);
begin
	if (data.cdsFindSdelka.Active) then
		data.cdsFindSdelka.Close;

	data.prvFindSdelka.DataSet := data.qryFindSdelkaByFactNum;
	data.cdsFindSdelka.FetchParams;

	data.cdsFindSdelka.Params.ParamByName('AG_ID').AsInteger := -1;
	data.cdsFindSdelka.Params.ParamByName('SD_FACT_NUM').AsInteger := StrToInt(edFindSdelkaForPayment.Text);
	data.cdsFindSdelka.Params.ParamByName('US_ID').AsInteger := frmMain.currentUser;
	data.cdsFindSdelka.Open;

	edFindSdelkaForPayment.SetFocus;
	edFindSdelkaForPayment.SelectAll;
end;


procedure TfrmMain.edFindSdelkaForPaymentKeyPress(Sender: TObject;
  var Key: Char);
begin
	if (Key = #13) then
		btFindSdelkaForPayment.Click;
end;


// Сохранить изменения в статусе оплаченности/оплаченной сумме сделки (помощник бухгалтера)
procedure TfrmMain.btApplyPaymentClick(Sender: TObject);
begin
	with data do
	begin
		spPayForSdelka.ParamByName('AG_ID').AsInteger   := dsFindSdelka.DataSet.FieldByName('AG_ID').AsInteger;
		spPayForSdelka.ParamByName('SD_ID').AsInteger   := dsFindSdelka.DataSet.FieldByName('SD_ID').AsInteger;
		spPayForSdelka.ParamByName('SUM_PAYED').AsFloat := StrToFloat(edTotalPayed.Text);
		if (cbAllPayed.Checked) then
			spPayForSdelka.ParamByName('ALL_PAYED').AsInteger := 1
		else
			spPayForSdelka.ParamByName('ALL_PAYED').AsInteger := 0;
		spPayForSdelka.ExecProc();
		dsFindSdelka.DataSet.Close();
		dsFindSdelka.DataSet.Open();
	end;
end;


procedure TfrmMain.btPayedBeznalByTimeClick(Sender: TObject);
begin
	repData.Report_PayedBeznal(currentUser, cbAllAgents.Checked, StrToDate(edPayedBeznalFrom.Text), StrToDate(edPayedBeznalTo.Text));
end;


// Переход в следующий номер.
{
	Для перехода в следующий номер:
	1. Сделать отчёт по пересечениям (sp GET_INTERCEPTIONS)
	2. Проставить "новизну" клиентов (sp SET_NEW_CUST_FOR_SDELKAS)
	3. Увеличить текущий номер газеты, отметить все подащи в закрываемый
       номер, как вышедшие (sp NEXT_CURRENT_ISSUE)
	4. Закрыть номер газеты - отправить все "текущие" объявления в
	   "старые" (sp CLOSE_ISSUE)
	5. Проставить номера газет, с которых нужно начинать формирование
	   отказника
	6. Обновить отказник (sp REFRESH_OTKAZNIK)
	7. Импортировать старый отказник (или создать его, если инф-я из
	   старой программы будет импортирована сюда)
	8. Применить старый отказник (sp APPLY_OLD_OTKAZNIK)
}
procedure TfrmMain.btNextIssuePRClick(Sender: TObject);
var
	gzid: integer;
begin
    if MessageBox(frmMain.Handle, 'Вы уверены, что хотите перейти к следующему номеру?', 'PrInfo', MB_YESNO or MB_ICONQUESTION) = mrNO then exit;

  	if (Sender = btNextIssuePR) then
			gzid := GZ_PR
		else if (Sender = btNextIssueNS) then
			gzid := GZ_NS
    else if (Sender = btNextIssueRZ) then
      gzid := GZ_RZ
    else if (Sender = btNextIssueRK) then
      gzid :=  GZ_RK
		else
			gzid := GZ_ST;

    data.qCheckNewIssue.Close;
    data.qCheckNewIssue.ParamByName('gz_id').AsInteger := gzid;
    data.qCheckNewIssue.Open;
    if data.qCheckNewIssue.Fields[0].AsInteger = 0
    then begin
            MessageBox(frmMain.Handle, 'Не открыт следующий номер!', 'PrInfo', MB_OK or MB_ICONERROR);
            exit;
    end;

	frmWait.Show();
	Application.ProcessMessages();

  btInterceptions.Click;
	try
		data.spNextCurrentIssue.ParamByName('GZ_ID').AsInteger := gzid;
// 3:
		data.spNextCurrentIssue.ExecProc();
		data.tblParams.Close();
		data.tblParams.Open();
		data.spCloseIssue.ParamByName('GZ_ID').AsInteger := gzid;
    data.spCloseIssue.ParamByName('US_ID').AsInteger := currentUser;
// 4:
		data.spCloseIssue.ExecProc();
// 5:
	 {	data.tblOtkaznik.Close;
    data.spRefreshOtkaznik.ExecProc();
		data.tblOtkaznik.Open(); }
	finally
	 	frmWait.Hide();
	end;
end;


procedure TfrmMain.btNotApprovedSdelkasClick(Sender: TObject);
var gz_id: integer;
begin
  gz_id := cboGZ.ItemIndex;
	repData.Report_NotApprovedSdelkas(currentUser, gz_id, cbAllAgents.Checked);
end;


// отчёты...
function TfrmMain.BonusLogPrint:TStringList;
var
	rep: TStringList;
	qry: TSQLQuery;
	sumAdd,daySumAdd,sumSub,daySumSub: currency;
	dayWas,dayNow: TDateTime;
begin
	sumAdd    := 0;
	daySumAdd := 0;
	sumSub    := 0;
	daySumSub := 0;

	qry := repData.qryBonusLog;

	if (qry.Active) then
		qry.Close();

	qry.ParamByName('DATE_FROM').AsDate := StrToDate(edBonusLogFrom.Text);
	qry.ParamByName('DATE_TO').AsDate   := StrToDate(edBonusLogTo.Text) + 1;

	qry.Open();

	rep := TStringList.Create();
	rep.Add('<CENTER><B>Журнал изменения бонусов за ' + edBonusLogFrom.Text + '-' + edBonusLogTo.Text + '</B></CENTER>');

	rep.Add(getTableHeader(qry, 13));

	qry.First();
	while (not qry.Eof) do
	begin
		rep.Add(getTableRow(qry, 13, nil));

		if (qry.FieldByName('BT_CHANGE').AsCurrency > 0) then
		begin
			sumAdd    := sumAdd+qry.FieldByName('BT_CHANGE').AsCurrency;
			daySumAdd := daySumAdd+qry.FieldByName('BT_CHANGE').AsCurrency;
		end
		else
		begin
			sumSub    := sumSub+qry.FieldByName('BT_CHANGE').AsCurrency;
			daySumSub := daySumSub+qry.FieldByName('BT_CHANGE').AsCurrency;
		end;

		dayWas  :=  qry.FieldByName('BT_DATE').AsDateTime;
		replaceTime(dayWas, 0);

		qry.Next();

		dayNow  :=  qry.FieldByName('BT_DATE').AsDateTime;
		replaceTime(dayNow, 0);

		if ((dayWas <> dayNow) or (qry.Eof)) then
		begin
			rep.Add('</TABLE>');
			rep.Add(format('<BR>Всего снято за день: %.2f', [daySumSub]));
			rep.Add(format('<BR>Всего начислено за день: %.2f<BR>', [daySumAdd]));

			if (not qry.Eof) then
				rep.Add(getTableHeader(qry, 13));
		end;
	end;

	rep.Add('</TABLE>');

	rep.Add('<B>Итог:</B><BR>');
	rep.Add(format('<BR>Всего снято: %.2f', [sumSub]));
	rep.Add(format('<BR>Всего начислено: %.2f<BR>', [sumAdd]));

	Result := rep;
	qry.Close();
end;


// отчёты...
procedure TfrmMain.btBonusLogByTimeClick(Sender: TObject);
var
	rep:THtmlReport;
begin
	rep := THtmlReport.Create();
	rep.TempName := 'PrInfo-bonus-rep';
	rep.Add('<HTML><HEAD><TITLE>Журнал изменения бонусов за ' + edBonusLogFrom.Text + '-' + edBonusLogTo.Text + '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

	rep.AddStrings(BonusLogPrint());

	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;

procedure TfrmMain.btFinReportClick(Sender: TObject);
begin
	repData.Report_Finansy(currentUser,StrToDate(edFinReportFrom.Text),StrToDate(edFinReportTo.Text));
end;


// Возвращает краткое текстовое описание сделки. Сейчас не используется.
function TfrmMain.DescribeSdelka(sd:TfrmSdelka):String;
begin
	Result := '';
	Result := Result + 'СДЕЛКА №' + sd.edSdelkaID.Text + '<BR>';
	Result := Result + 'КЛИЕНТ: ' + sd.edCust.Text + ' ТЕЛ. ';
	sd.grPhones.DataSource.DataSet.First;
	while (not sd.grPhones.DataSource.DataSet.Eof) do
	begin
		Result := Result + sd.grPhones.DataSource.DataSet.FieldByName('PH_NUMBER').AsString + ' ';
		sd.grPhones.DataSource.DataSet.Next;
	end;
	Result := Result + '<BR>';
	Result := Result + 'ГАЗЕТА: ' + sd.cbGazeta.Text + ' ФОРМА ОПЛАТЫ: ' + sd.cbPayType.Text;

	Result := Result + ' ПОДАЧИ: ';
	sd.grPodacha.DataSource.DataSet.First;
	while (not sd.grPodacha.DataSource.DataSet.Eof) do
	begin
		if (sd.grPodacha.DataSource.DataSet.FieldByName('PD_FREE_OF_CHARGE').AsInteger = 1) then Result := Result + '(';

		Result := Result + sd.grPodacha.DataSource.DataSet.FieldByName('IS_NAME_COMPOSED').AsString;

		if (sd.grPodacha.DataSource.DataSet.FieldByName('PD_FREE_OF_CHARGE').AsInteger = 1) then Result := Result + ')';

		Result := Result + ',';
		sd.grPodacha.DataSource.DataSet.Next;
	end;
	Result := Result + '<BR>';

	Result := Result + 'ДУБЛИ: ';
	sd.sdelkaObjavs.grObjavs.DataSource.DataSet.First;
	while (not sd.sdelkaObjavs.grObjavs.DataSource.DataSet.Eof) do
	begin
		Result := Result + 'ФОРМАТ: ' + sd.sdelkaObjavs.grObjavs.DataSource.DataSet.FieldByName('FM_NAME_LOOKUP').AsString + ', ';
		Result := Result + 'РУБРИКА: ' + sd.sdelkaObjavs.grObjavs.DataSource.DataSet.FieldByName('RB_NAME_SHORT_LOOKUP').AsString + ', ';
		Result := Result + 'КЛЮЧЕВОЕ СЛОВО: ' + sd.sdelkaObjavs.grObjavs.DataSource.DataSet.FieldByName('SD_KEYWORD').AsString + ', ';
		Result := Result + 'КОММЕНТАРИЙ: ' + sd.sdelkaObjavs.grObjavs.DataSource.DataSet.FieldByName('SD_COMMENT_SHORT').AsString;
		Result := Result + ';';
		sd.sdelkaObjavs.grObjavs.DataSource.DataSet.Next;
	end;

	Result := Result + '<BR>';
	Result := Result + 'СЧЕТ: ' + sd.edFactNum.Text + ' ОТ: ' + sd.edFactDate.Text+' СТОИМОСТЬ: ' + sd.edSum.Text +
			' ПРОЦЕНТ: ' + sd.edPercent.Text + ' КОММЕНТАРИЙ: ' + sd.mmComment.Text;
end;


// Печатает короткие описания всех сделок из cdsSdelka
procedure TfrmMain.btPrintNewClick(Sender: TObject);
var
	rep:THtmlReport;
begin
	rep := THtmlReport.Create();
	rep.TempName := 'PrInfo-new-approving';
	rep.Add('<HTML><HEAD><TITLE>Проверка сделок</TITLE><STYLE>td {font-size: 9pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></HEAD><BODY>');
	rep.Add('<CENTER><FONT SIZE=+1>Проверка новых сделок</FONT></CENTER>');

	with data do
	begin
		cdsSdelka.First;
		while (not cdsSdelka.Eof) do
		begin
			data.DoUpdateSdelkaViews();
			rep.Add(DescribeSdelka(sdelkaView) + '<HR>');
			cdsSdelka.Next;
		end;
	end;
	rep.Add('</BODY></HTML>');

	rep.OpenInBrowser();
	rep.Free;
end;

// "Найти и оплатить" сделку (помощник бухгалтера).
// Сейчас не используется в связи с большим количеством ошибок.
procedure TfrmMain.btFindAndPayClick(Sender: TObject);
begin
	with data do
	begin
		spPaySdelkas.ParamByName('FACT_NUM').AsInteger := StrToInt(edFindSdelkaForPayment.Text);
		spPaySdelkas.ParamByName('PAY_SUM').AsFloat    := StrToFloat(edFindSdelkaSum.Text);
		spPaySdelkas.ExecProc;

        btFindSdelkaForPayment.Click;

		MessageDlg(spPaySdelkas.ParamByName('CU_NAME').AsString, mtConfirmation, [mbOk], 0);
	end;
end;

// "Изменить текст объявления" (корректор)
procedure TfrmMain.btCorrectObjavClick(Sender: TObject);
begin
	TfrmSdelkaPublForm.Edit(
              publData.cdsObjavForKorrekturasd_num.AsString,
              publData.cdsObjavForKorrekturaAG_ID.Value,
							publData.cdsObjavForKorrekturaSD_ID.Value,
							publData.cdsObjavForKorrekturaOB_ID.Value,
							publData.cdsObjavForKorrekturaGZ_ID.Value,
							publData.cdsObjavForKorrekturaCU_ID,
							uCorrector);
end;


procedure TfrmMain.grSdelkaForKorrekturaDblClick(Sender: TObject);
begin
	btCorrectObjav.Click;
end;


procedure TfrmMain.grSdelkaForKorrekturaKeyPress(Sender: TObject; var Key: Char);
begin
	if (Key=#13) then btCorrectObjav.Click;
end;

procedure TfrmMain.btRefreshKorrekturaClick(Sender: TObject);
begin
	RefreshClientDataSetFullySavingPos(publData.qryObjavForKorrektura, publData.cdsObjavForKorrektura);
end;

// Быстрый поиск сделки у корректора
procedure TfrmMain.edSearchKorrekturaKeyPress(Sender: TObject; var Key: Char);
begin
	if (Key = #13) then
    begin
		    if (publData.cdsObjavForKorrektura.Locate('SD_NUM', edSearchKorrektura.Text, [])) then grSdelkaForKorrektura.SetFocus;
    end;
end;

// Одно объявление "готово" (верстальщик)
procedure TfrmMain.btOneSdelkaVerstClick(Sender: TObject);
var
	i: integer;
begin
	with publData do
	begin
		for i := 0 to grVerstkaDifference.SelectedRows.Count - 1 do
		begin
			cdsObjavVerstkaDifference.GotoBookmark(pointer(grVerstkaDifference.SelectedRows[i]));
			spObjavSverstana.ParamByName('AG_ID').AsInteger   := cdsObjavVerstkaDifferenceAG_ID.Value;
			spObjavSverstana.ParamByName('SD_ID').AsInteger   := cdsObjavVerstkaDifferenceSD_ID.Value;
			spObjavSverstana.ParamByName('OB_ID').AsInteger   := cdsObjavVerstkaDifferenceOB_ID.Value;
			spObjavSverstana.ParamByName('PD_ID').AsInteger   := cdsObjavVerstkaDifferencePD_ID.Value;
			spObjavSverstana.ParamByName('RB_ID').AsInteger   := cdsObjavVerstkaDifferenceRB_ID.Value;
			spObjavSverstana.ParamByName('DIAGNOZ').AsInteger := cdsObjavVerstkaDifferenceDIAGNOZ.Value;
			spObjavSverstana.ExecProc;
		end;
		btRefreshVerstka.Click;
		btRefreshSverstana.Click;
	end;
end;

// Сбросить все рубрики (верстальщик)
procedure TfrmMain.btClearVerstingClick(Sender: TObject);
begin
	with publData do
	begin
		if (qry.Active) then qry.Close;
		qry.SQL.Clear;
		qry.SQL.Add('DELETE FROM OBJAV_SVERSTANO');
		qry.ExecSQL;

		if (qry.Active) then qry.Close;
		qry.SQL.Clear;
		qry.SQL.Add('DELETE FROM OBJAV_INET_IMPORT');
		qry.ExecSQL;
	end;
	btRefreshSverstana.Click;
end;


// Обновить список "сейчас в газете" (верстальщик)
procedure TfrmMain.btRefreshSverstanaClick(Sender: TObject);
begin
	if (not publData.cdsObjavSverstano.Active) then
		publData.cdsObjavSverstano.Open
	else
		RefreshClientDataSetFully(publData.qryObjavSverstano, publData.cdsObjavSverstano);
end;

// Обновить список изменений, которые нужно внести в вёрстку (верстальщик)
procedure TfrmMain.btRefreshVerstkaClick(Sender: TObject);
begin
    if (not publData.cdsObjavVerstkaDifference.Active) then
        publData.cdsObjavVerstkaDifference.Open
    else
		RefreshClientDataSetFully(publData.qryObjavVerstkaDifference,publData.cdsObjavVerstkaDifference);

    if (not publData.cdsChangeCount.Active) then
        publData.cdsChangeCount.Open
    else
		RefreshClientDataSetFully(publData.qryChangeCount,publData.cdsChangeCount);
end;


// Показать информацию по вёрстке выбранной газеты (верстальщик)
procedure TfrmMain.btVerstkaGazetyClick(Sender: TObject);
var
	isid:integer;
begin
	if (not (csDestroying in cbGazetaSelector.ListSource.ComponentState)) then
	begin
		isid := data.getCurrentIssue(cbGazetaSelector.KeyValue);

		publData.tblRubrikaVerstka.CloneCursor(cacheData.cdsRubrika, true);
		publData.tblRubrikaVerstka.Filter := 'GZ_ID=' + IntToStr(cbGazetaSelector.KeyValue);
		publData.tblRubrikaVerstka.Filtered := true;

		// При закрытии программы происходит вылазит OnChange, а параметр уже уничтожен
		if (publData.cdsObjavVerstkaDifference.Params.FindParam('IS_ID') <> nil) then
		begin
			publData.cdsObjavVerstkaDifference.Params.ParamByName('IS_ID').AsInteger := isid;
			if (not publData.cdsObjavVerstkaDifference.Active) then
				publData.cdsObjavVerstkaDifference.Open
			else
				publData.cdsObjavVerstkaDifference.Refresh;
			publData.cdsChangeCount.Params.ParamByName('IS_ID').AsInteger := isid;
			if (not publData.cdsChangeCount.Active) then
				publData.cdsChangeCount.Open
			else
				publData.cdsChangeCount.Refresh;
			cbVerstkaDifferenceFilterChange(cbVerstkaDifferenceFilter);
		end;

		publData.cdsModuliVerstka.Params.ParamByName('GZ_ID').AsInteger := cbGazetaSelector.KeyValue;
	end;
end;


// Показать объявление верстальщику
procedure TfrmMain.grVerstkaDifferenceDblClick(Sender: TObject);
begin
	TfrmSdelkaPublForm.Edit(
                  publData.cdsObjavVerstkaDifferenceSD_NUM.AsString,
                  publData.cdsObjavVerstkaDifferenceAG_ID.Value,
								  publData.cdsObjavVerstkaDifferenceSD_ID.Value,
								  publData.cdsObjavVerstkaDifferenceOB_ID.Value,
								  publData.cdsObjavVerstkaDifferenceGZ_ID.Value,
								  nil,
								  uVerstka);
end;


// Показать объявление верстальщику
procedure TfrmMain.grObjavSverstanoDblClick(Sender: TObject);
begin
	TfrmSdelkaPublForm.Edit(
              publData.cdsObjavSverstanoSD_NUM.AsString,
              publData.cdsObjavSverstanoAG_ID.Value,
    					publData.cdsObjavSverstanoSD_ID.Value,
							publData.cdsObjavSverstanoOB_ID.Value,
							publData.cdsObjavSverstanoGZ_ID.Value,
							nil,
							uVerstka);
end;


// Сбросить информацию по рубрике (верстальщик)
procedure TfrmMain.btClearVerstingRubClick(Sender: TObject);
begin
	with publData do
	begin
		if (qry.Active) then qry.Close;
		qry.SQL.Clear;
		qry.SQL.Add('DELETE FROM OBJAV_SVERSTANO SS WHERE SS.RB_ID=' + IntToStr(cbVerstkaReadyFilter.KeyValue));
		qry.ExecSQL;

		if (qry.Active) then qry.Close;
		qry.SQL.Clear;
		qry.SQL.Add('DELETE FROM OBJAV_INET_IMPORT WHERE RB_ID=' + IntToStr(cbVerstkaReadyFilter.KeyValue));
		qry.ExecSQL;

		if (qry.Active) then qry.Close;
		qry.SQL.Clear;
		qry.SQL.Add('UPDATE OBJAV OB SET OB_STATE=4 WHERE OB_STATE=5 AND OB.RB_ID=' + IntToStr(cbVerstkaReadyFilter.KeyValue));
		qry.ExecSQL;
	end;
	btRefreshSverstana.Click;
end;


// отчёты...
function TfrmMain.ObjavRepByIssuePrint(gzid,iss:integer):TStringList;
var
	rep: TStringList;
	qry: TSQLQuery;
begin
	qry := repData.qryObjavCountByRubrika;

	if (qry.Active) then qry.Close();
	qry.ParamByName('IS_ID').AsInteger := iss;
	qry.Open();

	rep := TStringList.Create();

	if (not qry.IsEmpty()) then
	begin
		rep.Add('<CENTER><B>Статистика по форматам/рубрикам в номер</B></CENTER>');

		rep.Add(getTableHeader(qry, 13));

		qry.First();
		while (not qry.Eof) do
		begin
			rep.Add(getTableRow(qry, 13, nil));
			qry.Next();
		end;

		rep.Add('</TABLE>');
	end;

	Result := rep;
	qry.Close();
end;


// отчёты...
procedure TfrmMain.btObjavRepClick(Sender: TObject);
var
	rep: THtmlReport;
  res: TStringList;
begin
	rep := THtmlReport.Create();
	rep.TempName := 'PrInfo-objav-rep-by-isssue';
	rep.Add('<HTML><HEAD><TITLE>Статистика по форматам/рубрикам в номер ' + cbObjavRepIssue.Text + '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

  res := ObjavRepByIssuePrint(cbObjavRepGazeta.KeyValue, cbObjavRepIssue.KeyValue);
	rep.AddStrings(res);

	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
  FreeAndNil(res);
end;


// Заменить текстовый шаблон. Паарметры: текст шаблона,
// название переменной в шаблоне, значение, на которое нужно
// заменить. Возвращает обработанный текст.
function substituteTemplate(template,name,value:string):string;
var
	re: TRegExpr;
begin
	re := TRegExpr.Create;
	re.Expression := '\{' + name + '\}';
	Result := re.Replace(template, value);
end;


// Загружает шаблоны для вывода объявлений и проч. из файлов
function TfrmMain.LoadTemplates: boolean;
var
	lst: TStringList;
	gzpath: string;
	search: TSearchRec;
begin
	//Result:=false;

	if (exportTemplates = nil) then
		exportTemplates := THashedStringList.Create
	else
		exportTemplates.Clear;

	lst := TStringList.Create;

	data.tblGazeta.First;
	while (not data.tblGazeta.Eof) do
	begin
		if (data.tblGazetaGZ_ID.Value = GZ_PR) then
			gzpath := ''
		else if (data.tblGazetaGZ_ID.Value = GZ_NS) then
			gzpath := ''
		else if (data.tblGazetaGZ_ID.Value = GZ_ST) then
			gzpath := 'ST\'
		else if (data.tblGazetaGZ_ID.Value = GZ_RZ) then
			gzpath := 'RZ\'
		else if (data.tblGazetaGZ_ID.Value = GZ_RK) then
			gzpath := 'RK\';

		if (FindFirst('templates\' + gzpath + '*.txt', faAnyFile - faDirectory, search) = 0) then
		begin

			repeat
				lst.LoadFromFile('templates\' + gzpath + search.Name);
				exportTemplates.AddObject(IntToStr(data.tblGazetaGZ_ID.Value) + '-' + search.Name, TStringHolder.Create(lst.Text));
			until (FindNext(search) <> 0);

			FindClose(search);
		end;

		data.tblGazeta.Next;
	end;

	lst.Free;

	if (exportTemplates.Count > 5) then
		Result := true
	else
		Result := false;

	if (not Result) then
  begin
		MessageDlg('Не удалось загрузить шаблоны объявлений!', mtError, [mbOk], 0);
    abort;
  end;
end;


// Разбивает текст объявления на заголовок и тело
procedure splitObjav(text: String; var header, body: String);
var
	lst: TStringList;
	i: integer;
begin
	lst := TStringList.Create;
	lst.Text := text;
	header := '';
	body := '';
	if (lst.Count > 0) then
	begin
		header := trim(lst[0]);
		if (lst.Count > 1) then
			for i:=1 to lst.Count-1 do
				body := body + ' ' + lst[i];
		body := trim(body);
	end;
	lst.Free;
end;

// Экспорт объявлений в вёрстку.
// Параметры: датасет с объявлениями; названия рубрики - полное и короткое;
// путь, куда положить файлы; код, который нужно добавить к имени файла
// (используется, если >0); только выбранные строки датасета?;
// отмечать в текстах объявлений причину "диагноз" (новое объявление, удалено, и т.д.)
procedure TfrmMain.ExportObjavs(ds:TDataSet; rbNameLong,rbNameShort,exportPath:String; appendId:integer; onlySelected,showChanges:boolean);
var
  fl:TFileStream;
	mm: TStringList;
	i: integer;
	objav, header, body, fileName, msg, custcode: String;
	currTemplate: String;
  bufW: wideString;
  buf: UTF8string;

	// ещё есть объявления для экспорта?
	function hasMore:boolean;
	begin
		if (((onlySelected) and (frmMain.grVerstkaDifference.SelectedRows.Count > 0) and (i < frmMain.grVerstkaDifference.SelectedRows.Count)) or
			((not onlySelected) and (not ds.Eof))) then
			Result := true
		else
			Result := false;
	end;


	// перейдём в начало списка для экспорта
	procedure rewind;
	begin
		if (not onlySelected) then
			ds.First
		else
		begin
			i := 0;
			publData.cdsObjavVerstkaDifference.GotoBookmark(pointer(frmMain.grVerstkaDifference.SelectedRows[i]));
		end;
	end;


	// следующее объявления для экспорта
	procedure next;
	begin
		if (not onlySelected) then
			ds.Next
		else
		begin
			inc(i);
			if (i < frmMain.grVerstkaDifference.SelectedRows.Count) then
				publData.cdsObjavVerstkaDifference.GotoBookmark(pointer(frmMain.grVerstkaDifference.SelectedRows[i]));
		end;
	end;

begin
	mm := TStringList.Create;

	if (not LoadTemplates()) then exit;

	mm.Clear();
	mm.Append(ChooseTemplate(cbGazetaSelector.KeyValue, headerTempl));
	mm.Append(substituteTemplate(ChooseTemplate(cbGazetaSelector.KeyValue, rubTempl), 'RUB_NAME', rbNameLong));

	// в начало списка
	rewind();
	// пока ещё есть объявления для экспорта...
	while (hasMore()) do
	begin
		// отделим заголовок объявления от остального текста
		splitObjav(ds.FieldByName('OBJAV_TEXT').AsString, header, body);

		// если нужно, покажем "диагноз"
		if (showChanges) then
		begin
			if (ds.FieldByName('DIAGNOZ').Value = DIAGNOZ_DELETED) then
				msg := '[!!! УДАЛЕНО !!!] '
			else
				if (ds.FieldByName('DIAGNOZ').Value = DIAGNOZ_CHANGED) then
					msg := '[!!! ИЗМЕНЕНО !!!] '
				else
					msg := '';
		end;

		// выберем шаблон - обычный, или с "!"
		currTemplate := ChooseTextTemplate(cbGazetaSelector.KeyValue, ds.FieldByName('FM_ID').AsInteger, ds.FieldByName('FM_NAME').AsString);

		// вставим заголовок и диагноз в шаблон
		if (showChanges) then
			objav := substituteTemplate(currTemplate, 'OBJAV_HEADER', msg + header)
		else
			objav := substituteTemplate(currTemplate, 'OBJAV_HEADER', header);

		// вставим текст в шаблон
		objav := substituteTemplate(objav, 'OBJAV_BODY', body);

		// если нужно - вставим "код клиента"
		if ((ds.FieldByName('SD_SHOW_CUST_ID').AsInteger = 1)and
			(ds.FieldByName('CU_INFO').AsString <> '')) then
			custcode := ' // ' + ds.FieldByName('CU_ID_COMPOUND').AsString
		else
			custcode := '';

		objav := substituteTemplate(objav, 'CUST_CODE', custcode);

		mm.Append(frmMain.stripNewLine(objav));

		// следующее объявление
		next();
	end;

	if (appendId > 0) then
		fileName := exportPath + '\' + rbNameShort + '_' + format('%.5d', [publData.spNextExportID.ParamByName('EXPORT_ID').AsInteger]) + '.txt'
	else
		fileName := exportPath + '\' + rbNameShort + '.txt';

	if (not DirectoryExists(ExtractFilePath(fileName))) then
		if (not ForceDirectories(ExtractFilePath(fileName))) then
			raise Exception.Create('Не могу создать каталог: ' + ExtractFilePath(fileName));

  fl := nil;
  if cbCodePage.ItemIndex = 1 then
  try
       bufW := WideChar($FEFF) + EncodingToUTF16('windows-1251', mm.Text);
       fl := TFileStream.Create(fileName, fmCreate);
       fl.WriteBuffer(bufW[1], length(bufW) * 2);
  finally
       FreeAndNil(fl);
  end
  else if cbCodePage.ItemIndex = 2 then
  try
       bufW := EncodingToUTF16('windows-1251', mm.Text);
       buf := char($EF) + char($BB) + char($BF) + UTF16ToEncoding('UTF-8', bufW);

       fl := TFileStream.Create(fileName, fmCreate);
       fl.WriteBuffer(buf[1], length(buf));
  finally
       freeAndNil(fl);
  end
  else begin
        mm.SaveToFile(fileName);
  end;
	Clipboard.AsText := fileName;

	mm.Free();
end;


// Получить путь, куда нужно экспортировать объявления
// (и если нужно - создать соответствующие папки)
function TfrmMain.getCurrentIssueExportPath:string;
var
	iss: String;
	qry: TDataSet;
begin
	if (cbGazetaSelector.KeyValue = GZ_PR) then
		qry := data.qryIssuePR
	else if (cbGazetaSelector.KeyValue = GZ_NS) then
		qry := data.qryIssueNS
	else if (cbGazetaSelector.KeyValue = GZ_ST) then
		qry := data.qryIssueSR
	else if (cbGazetaSelector.KeyValue = GZ_RZ) then
		qry := data.qryIssueRZ
	else if (cbGazetaSelector.KeyValue = GZ_RK) then
		qry := data.qryIssueRK
  else qry := nil;

  if qry = nil then exit;

	qry.Locate('IS_ID', data.getCurrentIssue(cbGazetaSelector.KeyValue), []);
	iss := qry.FieldByName('IS_NAME').AsString;

	Result := data.tblParamsPM_GAZETA_OUTPUT_PATH.AsString + '\' + cbGazetaSelector.Text + '\' + iss;

	if (not DirectoryExists(Result)) then
		if (not ForceDirectories(Result)) then
			raise Exception.Create('Не могу создать каталог: ' + Result);
end;


// Экспорт в файл одной рубрики
procedure TfrmMain.btExportRubClick(Sender: TObject);
var
	id:integer;
begin
	if (Sender<>nil) then
	begin
		publData.spNextExportID.ExecProc;
		id := publData.spNextExportID.ParamByName('EXPORT_ID').AsInteger;
	end
	else
		id := 0;

	data.tblRubrika.Locate('RB_ID', cbVerstkaReadyFilter.KeyValue, []);

	exportObjavs(publData.cdsObjavSverstano,
				 data.tblRubrikaRB_NAME.AsString,
				 data.tblRubrikaRB_NAME_SHORT.AsString,
				 getCurrentIssueExportPath,
				 id,
				 false,false);
end;


// Экспорт выбранных объявлений
procedure TfrmMain.btSelectedExportClick(Sender: TObject);
begin
	publData.spNextExportID.ExecProc;
	data.tblRubrika.Locate('RB_ID', cbVerstkaDifferenceFilter.KeyValue, []);

	exportObjavs(publData.cdsObjavVerstkaDifference,
				 data.tblRubrikaRB_NAME.AsString,
				 data.tblRubrikaRB_NAME_SHORT.AsString,
				 getCurrentIssueExportPath,
				 publData.spNextExportID.ParamByName('EXPORT_ID').AsInteger,
				 true,true);
end;


// Выделить все изменения (верстальщик)
procedure TfrmMain.btSelectAllClick(Sender: TObject);
begin
	grVerstkaDifference.DataSource.DataSet.First;
	grVerstkaDifference.SelectedRows.Clear;
	while (not grVerstkaDifference.DataSource.DataSet.Eof) do
	begin
		grVerstkaDifference.SelectedRows.CurrentRowSelected := true;
		grVerstkaDifference.DataSource.DataSet.Next;
	end;
end;

// Показать окно поиска сделок (корректор)
procedure TfrmMain.btFindForCorrectorClick(Sender: TObject);
begin
	frmFindSdelka.ShowModal(uCorrector);
end;


// Отчёт: количество объявлений разных форматов по рубриками (корректор)
procedure TfrmMain.btRepByRubForCorrectorClick(Sender: TObject);
var
	rep: THtmlReport;
	gzid,isid: integer;
begin
	gzid := cbRepAllByRubGazeta.KeyValue;

	isid := data.getCurrentIssue(gzid);

	rep := THtmlReport.Create();
	rep.TempName := 'PrInfo-objav-rep-by-isssue';
	rep.Add('<HTML><HEAD><TITLE>Итог по форматам/рубрикам в номер</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

	rep.AddStrings(ObjavRepByIssuePrint(gzid, isid));

	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;


// Отчёт: объявления в рубрику (корректор)
function TfrmMain.ObjavRepByRubIssuePrint(gzid,isid,rbid:integer;onlyChanged:boolean;changedDate:TDateTime):TStringList;
var
	rep: TStringList;
	qry: TSQLQuery;
begin
	qry := repData.qryObjavByRubrika;

	if (qry.Active) then qry.Close();
	qry.ParamByName('IS_ID').AsInteger := isid;
    qry.ParamByName('RB_ID').AsInteger := rbid;

    if (onlyChanged) then
        qry.ParamByName('ONLY_CHANGED').AsInteger := 1
    else
        qry.ParamByName('ONLY_CHANGED').AsInteger := 0;

    qry.ParamByName('CHANGED_AFTER').AsString := DateTimeToStr(changedDate);
	qry.Open();

	rep := TStringList.Create();

	if (not qry.IsEmpty()) then
	begin
		rep.Add('<CENTER><B>Объявления в рубрику</B></CENTER>');

		rep.Add(getTableHeader(qry, 13));

		qry.First();
		while (not qry.Eof) do
		begin
			rep.Add(getTableRow(qry, 13, nil));
			qry.Next();
		end;

		rep.Add('</TABLE>');
	end;

	Result := rep;
	qry.Close();
end;


// Отчёт: объявления в рубрику (корректор)
procedure TfrmMain.btRepAllByRubForCorrectorClick(Sender: TObject);
var
	rep:THtmlReport;
	gzid,rbid,isid:integer;
    changedDate:TDateTime;
begin
	gzid := cbRepAllByRubGazeta.KeyValue;

	rbid := cbRepAllByRubForCorrectorRB.KeyValue;

	isid := data.getCurrentIssue(gzid);

	rep := THtmlReport.Create();
	rep.TempName := 'PrInfo-objav-rep-by-rub';
	rep.Add('<HTML><HEAD><TITLE>Объявления в рубрику "' + cbRepAllByRubForCorrectorRB.Text + '"</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

    if (edChangedAfter.Text = '  .  .     :  ') then
        changedDate := Now
    else
        changedDate := StrToDateTime(edChangedAfter.Text);

	rep.AddStrings(ObjavRepByRubIssuePrint(gzid, isid, rbid, cbOnlyChangedAfter.Checked, changedDate));

	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;


// Отправить все объявления всех рубрик в вёрстку (верстальщик)
procedure TfrmMain.btAllRubVerstkaClick(Sender: TObject);
begin
	btRefreshVerstka.Click;

	with publData do
	begin
		cdsObjavVerstkaDifference.Filter := '';
		cdsObjavVerstkaDifference.Filtered := false;
		cdsObjavVerstkaDifference.First;

		while (not cdsObjavVerstkaDifference.Eof) do
		begin
			spObjavSverstana.ParamByName('AG_ID').AsInteger := cdsObjavVerstkaDifferenceAG_ID.Value;
			spObjavSverstana.ParamByName('SD_ID').AsInteger := cdsObjavVerstkaDifferenceSD_ID.Value;
			spObjavSverstana.ParamByName('OB_ID').AsInteger := cdsObjavVerstkaDifferenceOB_ID.Value;
			spObjavSverstana.ParamByName('PD_ID').AsInteger := cdsObjavVerstkaDifferencePD_ID.Value;
			spObjavSverstana.ParamByName('RB_ID').AsInteger := cdsObjavVerstkaDifferenceRB_ID.Value;
			spObjavSverstana.ParamByName('DIAGNOZ').AsInteger := cdsObjavVerstkaDifferenceDIAGNOZ.Value;
			spObjavSverstana.ExecProc;

			cdsObjavVerstkaDifference.Next;
		end;
	end;

	btRefreshVerstka.Click;
	btRefreshSverstana.Click;
end;

// Экспорт всех объявлений всех рубрик в файлы для вёрстки
procedure TfrmMain.btExportAllRubClick(Sender: TObject);
begin

	btRefreshSverstana.Click;

	cbVerstkaReadyFilter.ListSource.DataSet.First;
	while (not cbVerstkaReadyFilter.ListSource.DataSet.Eof) do
	begin
		cbVerstkaReadyFilter.KeyValue := cbVerstkaReadyFilter.ListSource.DataSet.FieldByName(cbVerstkaReadyFilter.KeyField).Value;
		cbVerstkaReadyFilterChange(cbVerstkaReadyFilter);

		btExportRubClick(nil);

		cbVerstkaReadyFilter.ListSource.DataSet.Next;
	end;

end;


procedure TfrmMain.Button1222Click(Sender: TObject);
begin
	data.SQLMonitor.TraceList.SaveToFile(data.SQLMonitor.FileName);
end;


// Часть пользователей работают только со списком своих клиентов, часть - со всеми.
procedure TfrmMain.setCustSQL(byAgent:boolean);
begin
    data.cdsCust.Close;
    data.cdsCust.FetchParams;
    if data.cdsCust.Params.FindParam('SHOW_ALL') <> nil then
    begin
        if (byAgent) then
            data.cdsCust.Params.ParamByName('SHOW_ALL').AsInteger := 0
        else
            data.cdsCust.Params.ParamByName('SHOW_ALL').AsInteger := 1;
    end;
    data.cdsCust.Params.ParamByName('AG_ID').AsInteger := data.cdsAgentAG_ID.AsInteger;
end;


// Устанавливает текст SQL-запроса для qrySdelka.
procedure TfrmMain.setSdelkaSQL(sl:TStrings);
begin
    data.cdsSdelka.Close;
    if (data.qrySdelka.Active) then
        data.qrySdelka.Close;
    data.qrySdelka.SQL.Assign(sl);
    data.cdsSdelka.Open;
//    data.cdsSdelka.Refresh;
end;


// Сохранить "объявления, постоянно находящиеся в отказнике"
procedure TfrmMain.btSavePermanentOtkaznikClick(Sender: TObject);
begin
    data.tblOtkaznikStatic.CheckBrowseMode;
    data.tblOtkaznikStatic.ApplyUpdates(0);
end;


// Сохранить отказник
procedure TfrmMain.btSaveOtkaznikClick(Sender: TObject);
begin
	data.tblOtkaznik.CheckBrowseMode;
	data.tblOtkaznik.ApplyUpdates(0);
end;


procedure TfrmMain.cbVerstkaDifferenceFilterChange(Sender: TObject);
begin
    if (not (csDestroying in cbVerstkaDifferenceFilter.ListSource.ComponentState)) then
	with publData do
		if (not cdsChangeCount.IsEmpty) then
		begin
            grVerstkaDifference.SelectedRows.Clear;
			if (cbVerstkaDifferenceFilter.KeyValue = Null) then
			begin
				cdsChangeCount.First;
				cbVerstkaDifferenceFilter.KeyValue := cdsChangeCountRB_ID.Value;
			end;
			cdsObjavVerstkaDifference.Filter := 'RB_ID=' + IntToStr(cbVerstkaDifferenceFilter.KeyValue);
			if (not cdsObjavVerstkaDifference.Filtered) then
				cdsObjavVerstkaDifference.Filtered := true;
		end;
end;


procedure TfrmMain.cbVerstkaReadyFilterChange(Sender: TObject);
begin
	if (not (csDestroying in cbVerstkaReadyFilter.ListSource.ComponentState)) then

	with publData do
	begin
		cdsObjavSverstano.Filter := 'RB_ID=' + IntToStr(cbVerstkaReadyFilter.KeyValue);
		if (not cdsObjavSverstano.Filtered) then
			cdsObjavSverstano.Filtered := true;
	end;
end;


// Обновить список с информацией о клиентах (верстальщик)
procedure TfrmMain.btRefreshCustInfoClick(Sender: TObject);
begin
	publData.qryCustInfoList.DataSet.ParamByName('GZ_ID').AsInteger := cbGazetaSelector.KeyValue;
	if (not publData.qryCustInfoList.Active) then
		publData.qryCustInfoList.Open
	else
		publData.qryCustInfoList.Refresh;
end;


// Сохранить в файл информацию о клиентах (верстальщик)
procedure TfrmMain.btSaveCustInfoClick(Sender: TObject);
var
    sl: TStringList;
    cuname,cuinfo,line: String;
begin
	if (not LoadTemplates()) then exit;

	sl := TStringList.Create;
	with publData do
	begin
		qryCustInfoList.First;
		while (not qryCustInfoList.Eof) do
		begin
			splitObjav(qryCustInfoListCU_INFO.AsString, cuname, cuinfo);
			line := substituteTemplate(ChooseTemplate(cbGazetaSelector.KeyValue, custInfoTempl), 'CUST_ID', trim(qryCustInfoListCU_ID_COMPOUND.AsString));
			line := substituteTemplate(line, 'CUST_NAME', cuname);
			line := substituteTemplate(line, 'CUST_INFO', cuinfo);
			sl.Add(frmMain.stripNewLine(line));

			qryCustInfoList.Next;
		end;
	end;
	sl.SaveToFile(getCurrentIssueExportPath + '\_Справочник работодателей.txt');
	sl.Free;
end;


procedure TfrmMain.cbKAFilterChange(Sender: TObject);
begin
	with publData do
    begin
// Обходим глюк при уничтожении формы...
        if (not (csDestroying in cbKAFilter.ListSource.ComponentState)) then
        begin
    		cdsObjavForKA.Filter := 'RB_ID=' + IntToStr(cbKAFilter.KeyValue);
	    	if (not cdsObjavForKA.Filtered) then
		    		cdsObjavForKA.Filtered := true;
        end;
	end;
end;


// Обновить список вакансий КА (верстальщик)
procedure TfrmMain.btRefreshKAClick(Sender: TObject);
begin
  with publData do
  begin
       cdsSTTable.Close;
       cdsSTTable.Open;
  end;

	{if (not publData.cdsObjavForKA.Active) then
		publData.cdsObjavForKA.Open
	else
		RefreshClientDataSetFully(publData.qryObjavForKA, publData.cdsObjavForKA);}
end;


// Сохранить список вакансий КА в файл (верстальщик)
procedure TfrmMain.btSaveKAClick(Sender: TObject);
var
	rep: THtmlReport;
begin
	rep := THtmlReport.Create();
	rep.TempName:='PrInfo-Table-export';
	rep.Add('<HTML><HEAD><TITLE>Таблица</TITLE>');//<STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

	with publData do
	begin
		rep.Add('<TABLE BORDER=1 BORDERCOLOR=BLACK>');
		cdsSTTable.First();
		while (not cdsSTTable.Eof) do
		begin
        rep.Add('<TR><TD COLSPAN=4><CENTER>' + cdsSTTableSITE_VACANCY_NAME.AsString + '</CENTER></TD>');
        rep.Add('<TD COLSPAN=4><CENTER>' + cdsSTTableSITE_OBJAV_TEXT.AsString + '</CENTER></TD>');
        rep.Add('<TD COLSPAN=4><CENTER>' + cdsSTTableSITE_TEL.AsString + '</CENTER></TD>');
        rep.Add('<TD COLSPAN=4><CENTER>' + cdsSTTableSITE_ZP.AsString + '</CENTER></TD>');
        rep.Add('<TD COLSPAN=4><CENTER>' + cdsSTTableRB_NAME_ENG.AsString + '</CENTER></TD></TR>');

			cdsSTTable.Next();
		end;
	end;

	rep.Add('</TABLE></BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();


{	if (not LoadTemplates()) then exit;

	sl := TStringList.Create;
	with publData do
	begin

		cbKAFilter.ListSource.DataSet.First;
		while (not cbKAFilter.ListSource.DataSet.Eof) do
		begin
			cbKAFilter.KeyValue := cbKAFilter.ListSource.DataSet.FieldByName(cbVerstkaReadyFilter.KeyField).Value;
			cbKAFilterChange(cbKAFilter);

			sl.Add('');
			sl.Add('');
			sl.Add(cbKAFilter.Text);

			cdsObjavForKA.First;
			while (not cdsObjavForKA.Eof) do
			begin
				splitObjav(cdsObjavForKACU_KA_INFO_SHORT.AsString, kaname, kainfo);
				splitObjav(cdsObjavForKAOBJAV_TEXT.AsString, objavStart, objavEnd);

				line := substituteTemplate(ChooseTemplate(GZ_PR, kaTableTempl), 'OBJAV_START', objavStart);
				line := substituteTemplate(line, 'OBJAV_END', objavEnd);
				line := substituteTemplate(line, 'KA_NAME', kaname);
				line := substituteTemplate(line, 'KA_INFO_SHORT', kainfo);
				sl.Add(frmMain.stripNewLine(line));

				cdsObjavForKA.Next;
			end;

			cbKAFilter.ListSource.DataSet.Next;
		end;
	end;
	sl.SaveToFile(getCurrentIssueExportPath + '\_Таблица_КА.txt');
	sl.Free; }
end;


// Обновить список информаций о КА (верстальщик)
procedure TfrmMain.btRefreshCustKAClick(Sender: TObject);
begin
	if (not publData.qryCustKAInfo.Active) then
		publData.qryCustKAInfo.Open
	else
		publData.qryCustKAInfo.Refresh;
end;


// Сохранить в файл список информаций о КА (верстальщик)
procedure TfrmMain.btSaveCustKAClick(Sender: TObject);
var
    sl: TStringList;
    kaname,kainfo,line: String;
begin
	if (not LoadTemplates()) then exit;

	sl := TStringList.Create;
	with publData do
	begin
		qryCustKAInfo.First;
		while (not qryCustKAInfo.Eof) do
		begin
			splitObjav(trim(qryCustKAInfoCU_KA_INFO_FULL.AsString), kaname, kainfo);
			line := substituteTemplate(ChooseTemplate(GZ_PR, kaInfoTempl),'KA_NAME',kaname);
			line := substituteTemplate(line, 'KA_INFO_FULL', kainfo);
			if (trim(qryCustKAInfoCU_KA_INFO_FULL.AsString) = '') then
				line := '*** Информация о КА не введена: ' + qryCustKAInfoCU_NAME.AsString;
			sl.Add(frmMain.stripNewLine(line));

			qryCustKAInfo.Next;
		end;
	end;
	sl.SaveToFile(getCurrentIssueExportPath + '\_Справочник КА.txt');
	sl.Free;
end;


procedure TfrmMain.Button1Click(Sender: TObject);
begin
	frmMain.mmLogTrace.Lines.Assign(data.SQLMonitor.TraceList);
end;


procedure TfrmMain.Button2Click(Sender: TObject);
begin
	mmLogTrace.Lines.Clear;
	data.SQLMonitor.TraceList.Clear;
end;


procedure TfrmMain.cbLogTraceClick(Sender: TObject);
begin
	data.SQLMonitor.Active := cbLogTrace.Checked;
end;


// Заменяем символы новой строки на пробелы
function TfrmMain.stripNewLine(s: String): String;
var
	tmp: string;
	p: integer;
begin
	Result := s;
	while (pos(#10#13,Result) > 0) do
		Result[pos(#10#13,Result)] := ' ';
	while (pos(#13#10,Result) > 0) do
		Result[pos(#13#10,Result)] := ' ';

	while (pos(#10,Result) > 0) do
		Result[pos(#10,Result)] := ' ';
	while (pos(#13,Result) > 0) do
		Result[pos(#13,Result)] := ' ';

	p := pos('{\n}', Result);
	while (p > 0) do
	begin
		tmp := copy(Result, 1, p - 1);
		tmp := copy(Result, 1, p - 1) + #13 + copy(Result, p + 4, length(Result) - 4);
		Result := tmp;
		p := pos('{\n}', Result);
	end;
end;

// Формирование списка итогов для отчёта
function FormatSumList(sumFields:TStringList;qry:TDataSet):TStringList;
var
	i: integer;
begin
	Result := TStringList.Create;

	if ((sumFields <> nil) and (sumFields.Count > 0)) then
	begin
		Result.Add('<BR>');
		for i := 0 to sumFields.Count - 1 do
			Result.Append('Всего по полю <B>"' + qry.FieldByName(sumFields.Names[i]).DisplayLabel + '"</B>: ' +
						  format('%.2f', [StrToFloat(sumFields.Values[sumFields.Names[i]])]) + '<BR>');
		Result.Add('<BR>');
	end;
end;


// отчёты...
procedure TfrmMain.btCustItogClick(Sender: TObject);
var
	rep: THtmlReport;
	qry: TSQLQuery;
	dtFrom,dtTo: TDateTime;
	sumFields: TStringList;
begin
	if (cbCustItog.ItemIndex = 0) then
	begin
		dtFrom := data.tblParamsPM_CLOSEDATE_PR_OLD.AsDateTime;
		dtTo   := data.tblParamsPM_CLOSEDATE_PR_NEW.AsDateTime;
	end
	else
	begin
		dtFrom := data.tblParamsPM_CLOSEDATE_PR_NEW.AsDateTime;
		dtTo   := Now;
	end;

	qry := repData.qryCustByDate;
	if (qry.Active) then qry.Close();

	qry.ParamByName('US_ID').AsInteger := frmMain.currentUser;
	qry.ParamByName('DATE_FROM').AsString := DateTimeToStr(dtFrom);
	qry.ParamByName('DATE_TO').AsString := DateTimeToStr(dtTo);

	qry.Open();

	sumFields := TStringList.Create;
	sumFields.Add('CUST_NEW=0');
	sumFields.Add('CUST_OLD=0');
	sumFields.Add('CUST_NEW_SDELKA_COUNT=0');
	sumFields.Add('CUST_NEW_SDELKA_SUM=0');
	sumFields.Add('CUST_OLD_SDELKA_COUNT=0');
	sumFields.Add('CUST_OLD_SDELKA_SUM=0');

	rep := THtmlReport.Create();
	rep.TempName := 'PrInfo-cust-itog-by-date';
	rep.Add('<HTML><HEAD><TITLE>Итоги недели по клиентам с ' + DateTimeToStr(dtFrom) + ' до ' + DateTimetoStr(dtTo) + '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');
	rep.Add('<CENTER><B>Итоги недели по клиентам с ' + DateTimetoStr(dtFrom) + ' до ' + DateTimetoStr(dtTo) + '</B></CENTER>');

	rep.Add(getTableHeader(qry, 13));

	qry.First();
	while (not qry.Eof) do
	begin
		rep.Add(getTableRow(qry, 13, sumFields));
		qry.Next();
	end;

	rep.Add('</TABLE>');

	rep.Add(FormatSumList(sumFields, qry).Text);

	qry.Close();	

	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;


// отчёты...
procedure TfrmMain.btRubrikaItogClick(Sender: TObject);
var
	dtFrom,dtTo:TDateTime;
begin
	if (cbRubrikaItog.ItemIndex = 0) then
	begin
		dtFrom := data.tblParamsPM_CLOSEDATE_PR_OLD.AsDateTime;
		dtTo   := data.tblParamsPM_CLOSEDATE_PR_NEW.AsDateTime;
	end
	else
	begin
		dtFrom := data.tblParamsPM_CLOSEDATE_PR_NEW.AsDateTime;
		dtTo   := Now;
	end;

	repData.Report_RubrikaItog(currentUser, cbAllAgents.Checked, dtFrom, dtTo);
end;


// Изменение процентов у всех агентов по итогам недели - начало заполнения
procedure TfrmMain.BitBtn25Click(Sender: TObject);
begin
	if (data.cdsAlterAgentPercent.Active) then
	begin
		data.cdsAlterAgentPercent.CancelUpdates;
		data.cdsAlterAgentPercent.Close;
	end;
	data.cdsAlterAgentPercent.Open;

	btDoAlterAgentPercent.Enabled := true;

	if (cbAlterAgentPercentIssue.ItemIndex = 0) then
	begin
		data.qryDoAlterAgentPercent.ParamByName('DATE_FROM').AsString := data.tblParamsPM_CLOSEDATE_PR_OLD.AsString;
		data.qryDoAlterAgentPercent.ParamByName('DATE_TO').AsString   := data.tblParamsPM_CLOSEDATE_PR_NEW.AsString;
	end
	else
	begin
		data.qryDoAlterAgentPercent.ParamByName('DATE_FROM').AsString := data.tblParamsPM_CLOSEDATE_PR_NEW.AsString;
		data.qryDoAlterAgentPercent.ParamByName('DATE_TO').AsString   := DateTimetoStr(Now);
	end;

	MessageDlg('Будут измененяться проценты у сделок,'#10#13'подтверждённых в период с '#10#13 +
					data.qryDoAlterAgentPercent.ParamByName('DATE_FROM').AsString+
					#10#13'по'#10#13+
					data.qryDoAlterAgentPercent.ParamByName('DATE_TO').AsString,
			   mtInformation,
			   [mbOk],
			   0);
end;


// Изменение процентов у всех агентов по итогам недели - выполнить изменение
procedure TfrmMain.btDoAlterAgentPercentClick(Sender: TObject);
begin
	with data do
	begin
		cdsAlterAgentPercent.First;

		while (not cdsAlterAgentPercent.Eof) do
		begin
			qryDoAlterAgentPercent.ParamByName('AG_ID').AsInteger := cdsAlterAgentPercentAG_ID.AsInteger;

			qryDoAlterAgentPercent.ParamByName('PAY_TYPE').AsInteger := PAY_NAL;
			qryDoAlterAgentPercent.ParamByName('DELTA').Value := cdsAlterAgentPercentPERCENT_NAL_DELTA.Value;
			qryDoAlterAgentPercent.ExecSQL;

			qryDoAlterAgentPercent.ParamByName('PAY_TYPE').AsInteger := PAY_BEZNAL;
			qryDoAlterAgentPercent.ParamByName('DELTA').Value := cdsAlterAgentPercentPERCENT_BEZNAL_DELTA.Value;
			qryDoAlterAgentPercent.ExecSQL;

			qryDoAlterAgentPercent.ParamByName('PAY_TYPE').AsInteger := PAY_CREDIT;
			qryDoAlterAgentPercent.ParamByName('DELTA').Value := cdsAlterAgentPercentPERCENT_CREDIT_DELTA.Value;
			qryDoAlterAgentPercent.ExecSQL;

			cdsAlterAgentPercent.Next;
		end;
	end;
	btDoAlterAgentPercent.Enabled := false;
end;

// Печать счёта-фактуры
procedure TfrmMain.actPrintAccExecute(Sender: TObject);
var
	ds: TDataSet;
	byCust: boolean; // счёт для клиента (на любую сумму), а не для сделки
  fact_num: integer;
  fact_date, intStartDate, intEndDate:TDateTime;
  ag_id, sd_id, cu_id: integer;
  summ: double;
  rec_no:integer;
begin

  if frmFindSdelka.Active and (frmFindSdelka.DBGrid1.SelectedRows.Count > 1) then
  begin
      ag_id    := 0;
      sd_id    := 0;
      cu_id    := 0;
      summ     := 0;
      fact_num := 0;
      fact_date := 0;
      intStartDate := 0;
      intEndDate := 0;
      rec_no := 0;
       // Проверяем можно ли распечатать счет(совпадают ли номера счетов и дата счетов в выбраных сделках)
      frmFindSdelka.DBGrid1.DataSource.DataSet.DisableControls;
      if not frmFindSdelka.DBGrid1.DataSource.DataSet.IsEmpty then
                rec_no := frmFindSdelka.DBGrid1.DataSource.DataSet.RecNo;
      frmFindSdelka.DBGrid1.DataSource.DataSet.First;

      while not frmFindSdelka.DBGrid1.DataSource.DataSet.Eof do
      begin
          if frmFindSdelka.DBGrid1.SelectedRows.CurrentRowSelected then
          begin
              if  ((frmFindSdelka.DBGrid1.DataSource.DataSet.fieldByName('SD_FACT_NUM').AsInteger <> fact_num) and (fact_num > 0)) or
                  ((trunc(frmFindSdelka.DBGrid1.DataSource.DataSet.FieldByName('SD_FACT_DATE').AsFloat) <> trunc(fact_date)) and (fact_date > 0)) or
                  ((frmFindSdelka.DBGrid1.DataSource.DataSet.FieldByName('CU_ID').AsInteger <> cu_id) and (cu_id > 0)) then
              begin
                  ShowMessage('Сделка может быть выписана только на одну сделку, или клиента,'#13#10 +
                              'или на несколько сделок одного агента по одному клиенту.');

                  frmFindSdelka.DBGrid1.DataSource.DataSet.EnableControls;
                  exit;
              end;

              fact_num  := frmFindSdelka.DBGrid1.DataSource.DataSet.fieldByName('SD_FACT_NUM').AsInteger;
              fact_date := frmFindsdelka.DBGrid1.DataSource.DataSet.FieldByName('SD_FACT_DATE').AsDateTime;
              if intStartDate = 0 then
                  intStartDate := frmFindSdelka.DBGrid1.DataSource.DataSet.FieldByNAme('SD_KA_START_DATE').AsDateTime;
              if intEndDate = 0 then
                  intEndDate := frmFindSdelka.DBGrid1.DataSource.DataSet.FieldByName('SD_KA_END_DATE').AsDateTime;


              if ag_id = 0 then
                  ag_id     := frmFindSdelka.DBGrid1.DataSource.DataSet.FieldByName('AG_ID').AsInteger;
              if sd_id = 0 then
                  sd_id := frmFindSdelka.DBGrid1.DataSource.DataSet.FieldByName('SD_ID').AsInteger;
              if cu_id = 0 then
                  cu_id := frmFindSdelka.DBGrid1.DataSource.DataSet.FieldByName('CU_ID').AsInteger;


              summ := summ + frmFindSdelka.DBGrid1.DataSource.DataSet.FieldByName('SD_SUM').AsFloat;
          end;

          frmFindSdelka.DBGrid1.DataSource.DataSet.Next;
      end;
      if rec_no > 0 then
            frmFindSdelka.DBGrid1.DataSource.DataSet.RecNo := rec_no;
      frmFindSdelka.DBGrid1.DataSource.DataSet.EnableControls;
      TfrmPrint.ShowPrintFormMulti(ag_id, sd_id, summ, fact_num, fact_date, intStartDate, intEndDate);
      exit;
  end;

  if grAgentSdelka.SelectedRows.Count > 1 then
  begin
      ag_id    := 0;
      sd_id    := 0;
      cu_id    := 0;
      summ     := 0;
      fact_num := 0;
      fact_date := 0;
      intStartDate := 0;
      intEndDate := 0;

      grAgentSdelka.DataSource.DataSet.DisableControls;
      grAgentSdelka.DataSource.DataSet.First;

      while not grAgentSdelka.DataSource.DataSet.Eof do
      begin
           if grAgentSdelka.SelectedRows.CurrentRowSelected then
           begin
              if  ((grAgentSdelka.DataSource.DataSet.fieldByName('SD_FACT_NUM').AsInteger <> fact_num) and (fact_num > 0)) or
                  ((trunc(grAgentSdelka.DataSource.DataSet.FieldByName('SD_FACT_DATE').AsFloat) <> trunc(fact_date)) and (fact_date > 0)) or
                  ((grAgentSdelka.DataSource.DataSet.FieldByName('CU_ID').AsInteger <> cu_id) and (cu_id > 0)) then
              begin
                  ShowMessage('Сделка может быть выписана только на одну сделку, или клиента,'#13#10 +
                              'или на несколько сделок одного агента по одному клиенту.');

                  grAgentSdelka.DataSource.DataSet.EnableControls;
                  exit;
              end;

              fact_num  := grAgentSdelka.DataSource.DataSet.fieldByName('SD_FACT_NUM').AsInteger;
              fact_date := grAgentSdelka.DataSource.DataSet.FieldByName('SD_FACT_DATE').AsDateTime;
              if intStartDate = 0 then
                intStartDate := grAgentSdelka.DataSource.DataSet.FieldByName('SD_KA_START_DATE').AsDateTime;
              if intEndDate = 0 then
                intEndDate := grAgentSdelka.DataSource.DataSet.FieldByName('SD_KA_END_DATE').AsDateTime;

              if ag_id = 0 then
                  ag_id     := grAgentSdelka.DataSource.DataSet.FieldByName('AG_ID').AsInteger;
              if sd_id = 0 then
                  sd_id := grAgentSdelka.DataSource.DataSet.FieldByName('SD_ID').AsInteger;
              if cu_id = 0 then
                  cu_id := grAgentSdelka.DataSource.DataSet.FieldByName('CU_ID').AsInteger;


              summ := summ + grAgentSdelka.DataSource.DataSet.FieldByName('SD_SUM').AsFloat;
           end;

           grAgentSdelka.DataSource.DataSet.Next
      end;

      grAgentSdelka.DataSource.DataSet.EnableControls;
      TfrmPrint.ShowPrintFormMulti(ag_id, sd_id, summ, fact_num, fact_date, intStartDate, intEndDate);
      exit;
  end;

	ds := nil;
	byCust := false;

// определим, где была выбрана "печать счёта", и, соответственно,
// какими данными нужно воспользоваться для счёта

// в окне поиска сделки
	if ((frmFindSdelka.Active) and
		(data.dsFindSdelka.DataSet.Active) and
		(not data.dsFindSdelka.DataSet.IsEmpty)) then
		ds := data.dsFindSdelka.DataSet
// в главном окне, на закладке "Агент"
	else if ((frmMain.Active) and
			 (frmMain.pages.ActivePage = tbAgent) and
			 (data.cdsSdelka.Active) and
			 (not data.cdsSdelka.IsEmpty)) then
		ds  := data.cdsSdelka
// в списке клиентов - в главном окне на закладке "Клиенты агента", либо
// в окне frmCustForm
	else if (
				(
					(
						(frmMain.Active) and
						(frmMain.pages.ActivePage = tbAgentCusts)
					)or
					frmCustForm.Active
				)and
				(data.cdsCust.Active)and
				(not data.cdsCust.IsEmpty)
			) then
		byCust := true;

	if ((ds <> nil) or (byCust = true)) then
	begin
			if (ds <> nil) then
           TfrmPrint.ShowPrintForm(ds.FieldByName('AG_ID').Value, ds.FieldByName('SD_ID').Value)
      else
           TfrmPrint.ShowPrintFormCust(data.cdsCustAG_ID.Value, data.cdsCustCU_ID.Value, data.cdsCustCUQ_REG_ID.Value);
  end;
    
end;


// отчёты...
procedure TfrmMain.btAllCustPrintClick(Sender: TObject);
begin
	repData.Report_AllCust();
end;


// Предупреждение перед тем, как поменять офис у агента
procedure TfrmMain.grAdminAgentsColumns1UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
	Handled := false;
	if (MessageDlg('Вы уверены, что хотите поменять офис для этого агента?' + (Sender as TColumnEh).DisplayText,
				   mtConfirmation,
				   [mbYes,mbNo],
				   0)<>mrYes) then
	begin
		Handled := true;
		(Sender as TDBGridColumnEh).Grid.DataSource.DataSet.Cancel;
	end;
end;

procedure TfrmMain.OpenDB;
var
	ih: TIntHolder;
begin
    with data do
    begin
    	connection.Open;
//        SQLMonitor.Active:=true;

	    // Не синхронизируется ли сейчас информация?
    	tblParams.Open;
	    if (tblParamsPM_SYNC_STATE.Value = 3) then
    	begin
	    	MessageDlg('Происходит синхронизация информации,'#10#13'попробуйте запустить программу позже.', mtInformation, [mbOk], 0);
		    Application.Terminate;
    	end;

	    cdsAgent.Open;
    	cdsSdelka.Open;

	    // Установим SQL-запрос для списка клиентов
        frmMain.setCustSQL(true);

    	qryIssue.Params.ParamByName('GZ_ID').Value := GZ_PR;
	    qryIssue.Open;
      qryIssue.Last;
      cbGazetaForIssue.KeyValue := GZ_PR;
    	tblRubrika.Open;

      //tblFormat.Filter := 'GZ_ID = 1';
      //tblFormat.Filtered := true;

	    tblFormat.Open;

		tblPayType.Open;
		tblRequisite.Open;
	    tblObjavState.Open;
		tblGazeta.Open;
		tblDistrict.Open;
        sdsSyncState.Open;

	    tblAgentsList.Open;
    	qryUsr.Open;
	    qryUsrRights.Open;

    	tblOtkaznik.Open;
	    tblOtkaznikStatic.Open;
    	tblBool.Open;

		qryIssuePR.Open;
		qryIssueNS.Open;
		qryIssueSR.Open;
		qryIssueRZ.Open;
		qryIssueRK.Open;

    	qryAgents.Open;

	    tblTransactionType.Open;

	    // Заполним несколько выпадающих меню, связав с из строками
	    // числовые значения
	    ih := TIntHolder.Create();
    	ih.value := -1;
	    frmMain.cbPayTypeFilter.Items.AddObject('[ Не имеет значения ]', ih);
    	tblPayType.First;
	    while (not tblPayType.Eof) do
    	begin
	    	ih := TIntHolder.Create();
		    ih.value := tblPayTypePT_ID.Value;
    		frmMain.cbPayTypeFilter.Items.AddObject(tblPayTypePT_NAME.Value, ih);
	    	tblPayType.Next();
    	end;

	    ih := TIntHolder.Create();
    	ih.value := -3;
	    frmMain.cbTranTypeFilter.Items.AddObject('[ показывать всё ]', ih);

    	ih := TIntHolder.Create();
	    ih.value := -2;
    	frmMain.cbTranTypeFilter.Items.AddObject('[ только расходы ]', ih);

	    ih := TIntHolder.Create();
    	ih.value := -1;
	    frmMain.cbTranTypeFilter.Items.AddObject('[ только поступления ]', ih);

    	tblTransactionType.First;
	    while (not tblTransactionType.EOF) do
    	begin
	    	ih:=TIntHolder.Create();
		    ih.value:=tblTransactionTypeTT_ID.Value;
    		frmMain.cbTranTypeFilter.Items.AddObject(tblTransactionTypeTT_NAME.Value, ih);
	    	tblTransactionType.Next;
    	end;

		frmMain.cbTranTypeFilter.ItemIndex := 0;

    	frmMain.btRefreshMoneyTransactions.Click;

	    qryChangeAgentTask.Open;

    	qryAccessRights.Open;

        sdsRubrikaSite.Open;
        tblRubrikaByGZ.Open;
		//sdsRubrikaPohozha.Open;

		// Откроем ДатаСеты с кешем данных, которые затем
		// будут копировать себе разные формы
		cacheData.cdsRubrika.Open();
		cacheData.cdsRubrikaSite.Open();
		cacheData.cdsRubrikaPohozha.Open();
		cacheData.cdsFormat.Open();
    end;
end;

// отчёты...
function TfrmMain.OtkaznikExitPrint(agid:integer;agname:string):TStringList;
var
	rep: TStringList;
	qry: TSQLQuery;
begin
	qry := repData.qryOtkaznikExit;

	if (qry.Active) then qry.Close();

	qry.ParamByName('AG_ID').AsInteger := agid;
	qry.ParamByName('LAST_ISSUE_PR').AsInteger := cbOtkaznikExitPR.KeyValue;
	qry.ParamByName('LAST_ISSUE_NS').AsInteger := cbOtkaznikExitNS.KeyValue;
	qry.ParamByName('LAST_ISSUE_SR').AsInteger := cbOtkaznikExitSR.KeyValue;
	qry.ParamByName('LAST_ISSUE_RZ').AsInteger := cbOtkaznikExitRZ.KeyValue;
	qry.ParamByName('LAST_ISSUE_RK').AsInteger := cbOtkaznikExitRK.KeyValue;

	qry.Open();

	rep := TStringList.Create();
	rep.Add('<CENTER><B>Телефоны, выходящие из отказника, агента ' + agname + '</B></CENTER>');

	rep.Add(getTableHeader(qry, 13));

	qry.First();
	while (not qry.Eof) do
	begin
		rep.Add(getTableRow(qry, 13, nil));
		qry.Next();
	end;

	rep.Add('</TABLE>');

	Result := rep;
	qry.Close();
end;


// отчёты...
procedure TfrmMain.btOtkaznikExitClick(Sender: TObject);
var
	rep: THtmlReport;
begin
	rep := THtmlReport.Create();
	rep.TempName := 'PrInfo-otkaznik-exit-rep';
	rep.Add('<HTML><HEAD><TITLE>Телефоны, которые выйдут из Отказника</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

	if (cbAllAgents.Checked) then
	with data do
	begin
		if (qryCurrentUserRights.Active) then
			qryCurrentUserRights.Close();
		qryCurrentUserRights.DataSet.ParamByName('US_ID').AsInteger := currentUser;
		qryCurrentUserRights.Open;

		qryCurrentUserRights.First();
		while (not qryCurrentUserRights.Eof) do
		begin
			rep.AddStrings(OtkaznikExitPrint(qryCurrentUserRightsAG_ID.Value, qryCurrentUserRightsAG_NAME.Value));
			rep.Add('<HR><BR><BR>');
			qryCurrentUserRights.Next();
		end;
	end
	else
	begin
		rep.AddStrings(OtkaznikExitPrint(data.cdsAgentAG_ID.Value, data.cdsAgentAG_NAME.Value));
		rep.Add('<HR><BR><BR>');
	end;

	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;

procedure TfrmMain.btSaveRubrikaSiteClick(Sender: TObject);
begin
    data.sdsRubrikaSite.CheckBrowseMode;
    data.sdsRubrikaPohozha.CheckBrowseMode;
    data.sdsRubrikaSite.ApplyUpdates(0);
    data.sdsRubrikaPohozha.ApplyUpdates(0);

    data.sdsRubrikaPohozha.Close;
    data.sdsRubrikaPohozha.Open;

    data.sdsRubrikaSite.Close;
    data.sdsRubrikaSite.Open;
end;

procedure TfrmMain.btModuliExportAllClick(Sender: TObject);
var
	errors: string;
begin
//	btRefreshModuliVerstka.Click;

	with publData do
	begin
		tblRubrikaVerstka.First;
		while (not tblRubrikaVerstka.Eof) do
		begin
			errors := errors + ModuliExportRubrika(tblRubrikaVerstkaRB_ID.AsInteger);

			tblRubrikaVerstka.Next;
		end;

		if (errors <> '') then
			MessageDlg(LeftStr('Невозможно сохранить следующие файлы: '#10#13 + errors, 1000),mtError,[mbOk],0);
	end;
end;

procedure TfrmMain.cbModuliVerstkaFilterChange(Sender: TObject);
begin
	SetModuliVerstkaFilter(cbModuliVerstkaFilter.KeyValue, true);
end;

procedure TfrmMain.btRefreshModuliVerstkaClick(Sender: TObject);
begin
	publData.cdsModuliVerstka.Params.ParamByName('GZ_ID').AsInteger := cbGazetaSelector.KeyValue;

	if (not publData.cdsModuliVerstka.Active) then
		publData.cdsModuliVerstka.Open
	else
		RefreshClientDataSetFully(publData.qryModuliVerstka,publData.cdsModuliVerstka);

	SetModuliVerstkaFilter(NULL, false);
end;

procedure TfrmMain.grModuliVerstkaDblClick(Sender: TObject);
begin
	TfrmSdelkaPublForm.Edit(
              publData.cdsModuliVerstkaSD_NUM.AsString,
              publData.cdsModuliVerstkaAG_ID.Value,
							publData.cdsModuliVerstkaSD_ID.Value,
							publData.cdsModuliVerstkaOB_ID.Value,
							publData.cdsModuliVerstkaGZ_ID.Value,
							nil,
							uVerstka);
end;

procedure TfrmMain.N3Click(Sender: TObject);
var
	rep: THtmlReport;
    ds: TDataSet;
    cmp: TComponent;
begin
	if (    (Sender is TMenuItem)
        and ((Sender as TMenuItem).GetParentMenu() <> nil)
        and ((Sender as TMenuItem).GetParentMenu() is TPopupMenu)
        and (((Sender as TMenuItem).GetParentMenu() as TPopupMenu).PopupComponent <> nil)) then
    begin
		cmp := ((Sender as TMenuItem).GetParentMenu() as TPopupMenu).PopupComponent;
		ds := nil;
        if (cmp is TDBGrid) then
        	ds := (cmp as TDBGrid).DataSource.DataSet
        else if (cmp is TDBGridEh) then
        	ds := (cmp as TDBGridEh).DataSource.DataSet;

		if ((ds <> nil) and ds.Active) then
        begin
			rep := THtmlReport.Create();
			rep.TempName := 'PrInfo-grid-data';
			rep.Add('<HTML><HEAD><TITLE>Данные из таблицы</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
			rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

            rep.Add(GetTableHeader(ds, -1));

            ds.First;
            while (not ds.Eof) do
            begin
	            rep.Add(GetTableRow(ds, -1, nil));

                ds.Next;
            end;

			rep.Add('</BODY></HTML>');
			rep.OpenInBrowser();
			rep.Free();
		end;
    end;
end;

procedure TfrmMain.actNewSdelkaVInternetExecute(Sender: TObject);
begin
	if (tbAgent.TabVisible) then
	begin
		TfrmSdelkaForm.New(data.cdsAgentAG_ID.AsInteger, SD_TYPE_INTERNET);
		btRefresh.Click();
	end;
end;


procedure TfrmMain.actNewSdelkaRegionExecute(Sender: TObject);
begin
	if (tbAgent.TabVisible) then
	begin
		TfrmSdelkaForm.New(data.cdsAgentAG_ID.AsInteger, SD_TYPE_INT_REGION, GZ_REG);
		btRefresh.Click();
	end;
end;

procedure TfrmMain.BitBtn14Click(Sender: TObject);
begin
	frmFindSdelka.ShowModal(uNabor);
end;

function TfrmMain.ObjavAttentionRepPrint():TStringList;
var
	rep: TStringList;
	qry: TSQLQuery;
begin
	qry := repData.qryAttentionObjavs;

	if (qry.Active) then qry.Close();

	qry.ParamByName('GZ_ID').AsInteger := cbAttentionObjavsGazeta.KeyValue;
	qry.ParamByName('IS_ID').AsInteger := data.getCurrentIssue(cbAttentionObjavsGazeta.KeyValue);

	qry.Open();

	rep := TStringList.Create();

	if (not qry.IsEmpty()) then
	begin
		rep.Add('<CENTER><B>Объявления в номере, требующие внимания Выпускающего отдела</B></CENTER>');

		rep.Add(getTableHeader(qry, 13));

		qry.First();
		while (not qry.Eof) do
		begin
			rep.Add(getTableRow(qry, 13, nil));
			qry.Next();
		end;

		rep.Add('</TABLE>');
	end;

	Result := rep;
	qry.Close();
end;


procedure TfrmMain.btAttentionObjavsClick(Sender: TObject);
var
	rep: THtmlReport;
begin
	rep := THtmlReport.Create();
	rep.TempName := 'PrInfo-objav-rep-attention';
	rep.Add('<HTML><HEAD><TITLE>Объявления в номере, требующие внимания Выпускающего отдела</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

	rep.AddStrings(ObjavAttentionRepPrint());

	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;

procedure TfrmMain.BitBtn8Click(Sender: TObject);
begin
	data.spLockRubrikas.ParamByName('US_ID').AsInteger := frmMain.currentUser;
	data.spLockRubrikas.ParamByName('DO_LOCK').AsInteger := 1;
	data.spLockRubrikas.ExecProc();
end;

procedure TfrmMain.BitBtn13Click(Sender: TObject);
begin
	data.spLockRubrikas.ParamByName('US_ID').AsInteger := frmMain.currentUser;
	data.spLockRubrikas.ParamByName('DO_LOCK').AsInteger := 0;
	data.spLockRubrikas.ExecProc();
end;

procedure TfrmMain.grSdelkaForNaborDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
	DrawLockCell(Sender, Column, Rect);
	DrawSRCell(Sender, Column, Rect);
end;

procedure TfrmMain.DrawLockCell(AGrid: TObject; AColumn: TObject;
  ARect: TRect);
var
	svColor: TColor;
begin
	if (AGrid is TDBGridEh) then
	begin
		if ((AColumn as TColumnEh).FieldName = 'RB_IS_LOCKABLE') then
		begin
			svColor := (AGrid as TDBGridEh).Canvas.Brush.Color;
			if ((AColumn as TColumnEh).Field.AsInteger > 0) then
				(AGrid as TDBGridEh).Canvas.Brush.Color := clPurple;
			(AGrid as TDBGridEh).Canvas.FillRect(ARect);
			(AGrid as TDBGridEh).Canvas.Brush.Color := svColor;
		end;

    if (assigned(frmDesign) and (frmDesign.cdsModuliDesignOB_STATE.AsInteger = OB_STATE_DESIGN)) or
       (assigned(frmDesign) and (frmDesign.cdsModuliDesignOB_STATE_TXT.AsInteger = OB_STATE_DESIGN)) or
       (assigned(frmNabor) and (frmNabor.cdsObjavForNaborOB_TYPE.AsInteger in [2, 3])) then
    with  (AGrid as TDBGridEh).Canvas do
  	begin
        if (assigned(frmDesign) and (frmDesign.cdsModuliDesignRB_IS_OBLOGKA.AsInteger = 1)) then
        begin
		          Brush.Color := clPurple;
		          Font.Color  := clWhite;
		          FillRect(ARect);
		          TextOut(ARect.Left + 2, ARect.Top + 2, (AColumn as TColumnEh).Field.Text);
        end
        else begin
		          Brush.Color := clGreen;
		          Font.Color  := clWhite;
		          FillRect(ARect);
		          TextOut(ARect.Left + 2, ARect.Top + 2, (AColumn as TColumnEh).Field.Text);
        end;
	  end;
	end
	else if (AGrid is TDBGrid) then
	begin
		if ((AColumn as TColumn).FieldName = 'RB_IS_LOCKABLE') then
		begin
			svColor := (AGrid as TDBGrid).Canvas.Brush.Color;
			if ((AColumn as TColumn).Field.AsInteger > 0) then
				(AGrid as TDBGrid).Canvas.Brush.Color := clPurple;
			(AGrid as TDBGrid).Canvas.FillRect(ARect);
			(AGrid as TDBGrid).Canvas.Brush.Color := svColor;
		end;
	end;
end;

procedure TfrmMain.DrawSRCell(AGrid: TObject; AColumn: TObject; ARect: TRect);
var
	svColor: TColor;
begin
	if (AGrid is TDBGridEh) then
	begin
		if ((AColumn as TColumnEh).FieldName = 'SR_IS_CURRENT_ISSUE') then
		begin
			svColor := (AGrid as TDBGridEh).Canvas.Brush.Color;
			if ((AColumn as TColumnEh).Field.AsInteger > 0) then
				(AGrid as TDBGridEh).Canvas.Brush.Color := clRed;
			(AGrid as TDBGridEh).Canvas.FillRect(ARect);
			(AGrid as TDBGridEh).Canvas.Brush.Color := svColor;
		end;
	end
	else if (AGrid is TDBGrid) then
	begin
		if ((AColumn as TColumn).FieldName = 'SR_IS_CURRENT_ISSUE') then
		begin
			svColor := (AGrid as TDBGrid).Canvas.Brush.Color;
			if ((AColumn as TColumn).Field.AsInteger > 0) then
				(AGrid as TDBGrid).Canvas.Brush.Color := clRed;
			(AGrid as TDBGrid).Canvas.FillRect(ARect);
			(AGrid as TDBGrid).Canvas.Brush.Color := svColor;
		end;
	end;
end;


function TfrmMain.VIPPrint(agid: integer; agname: string;
  var c_ka: integer; var s_ka: currency; var c_inet: integer;
  var s_inet: currency; var c_total: integer;
  var s_total: currency): TStringList;
var
	rep: TStringList;
	qry: TSQLQuery;
	count_ka, count_inet, count_total: integer;
	sum_ka, sum_inet, sum_total: Currency;
begin
	count_ka	:= 0;
	count_inet	:= 0;
	count_total	:= 0;

	sum_ka		:= 0;
	sum_inet	:= 0;
	sum_total	:= 0;

	qry := repData.qryVIP;

	if (qry.Active) then qry.Close();

	qry.ParamByName('DATE_FROM').AsDate := StrToDate(edVIPFrom.Text);
	qry.ParamByName('DATE_TO').AsDate   := StrToDate(edVIPTo.Text);

	qry.ParamByName('AG_ID').AsInteger  := agid;
	qry.Open();

  if qry.IsEmpty then
  begin
      result := TStringList.Create;
      exit;
  end;

	rep := TStringList.Create();
	rep.Add('<CENTER><B>ВИП-клиенты агента ' + agname + ' по сделкам зарегистрированным за ' + edVIPFrom.Text + '-' + edVIPTo.Text + '</B></CENTER>');

	rep.Add(getTableHeader(qry, 13));

	qry.First();
	while (not qry.Eof) do
	begin
		rep.Add(getTableRow(qry, 13, nil));

//		sum:=sum+qry.FieldByName('SD_PERCENT_SUM_TO_GIVE').AsCurrency;
		sum_ka := sum_ka + qry.FieldByName('KA_SUM').AsCurrency;
		count_ka := count_ka + qry.FieldByName('KA_COUNT').AsInteger;

		sum_inet := sum_inet + qry.FieldByName('INET_SUM').AsCurrency;
		count_inet := count_inet + qry.FieldByName('INET_COUNT').AsInteger;

		sum_total := sum_total + qry.FieldByName('TOTAL_SUM').AsCurrency;
		count_total := count_total + qry.FieldByName('TOTAL_COUNT').AsInteger;


		qry.Next();
	end;

	rep.Add('</TABLE>');

	rep.Add('<B>Итог:</B><BR>');

	rep.Add(format('Количество VIP в КА: %d<BR>',	  	[count_ka]));
	rep.Add(format('Сумма VIP в КА: %.2f<BR><BR>',		[sum_ka]));
	rep.Add(format('Количество VIP в интернет: %d<BR>',	[count_inet]));
	rep.Add(format('Сумма VIP в интернет: %.2f<BR><BR>',[sum_inet]));
	rep.Add(format('Количество VIP: %d<BR>',			[count_total]));
	rep.Add(format('Сумма VIP: %.2f<BR>',				[sum_total]));


	s_ka := s_ka + sum_ka;
	c_ka := c_ka + count_ka;

	s_inet := s_inet + sum_inet;
	c_inet := c_inet + count_inet;


	s_total := s_total + sum_total;
	c_total := c_total + count_total;

	Result := rep;
	qry.Close();
end;

procedure TfrmMain.btExportVIPModulesClick(Sender: TObject);
begin
	if (repData.qryVIPModules.Active) then
		repData.qryVIPModules.Close();

	ForceDirectories('c:\VIP-moduli');

	repData.qryVIPModules.Open();
	repData.qryVIPModules.First();
	while ( not repData.qryVIPModules.Eof) do
	begin
		FileFromCompressedField(  repData.qryVIPModulesCONTENT_PICTURE
								,   'c:\VIP-moduli\'
								  + repData.qryVIPModulesAG_ID.AsString
								  + '-' + repData.qryVIPModulesSD_ID.AsString
								  + '-' + repData.qryVIPModulesOB_ID.AsString
								  + '.tiff');

		repData.qryVIPModules.Next();
	end;
end;

procedure TfrmMain.DBGridEh6DblClick(Sender: TObject);
begin
	TfrmSdelkaPublForm.Edit(
                  publData.cdsNavchCourseSD_NUM.AsString,
                  publData.cdsNavchCourseAG_ID.Value,
								  publData.cdsNavchCourseSD_ID.Value,
								  publData.cdsNavchCourseOB_ID.Value,
								  publData.cdsNavchCourseGZ_ID.Value,
								  nil,
								  uVerstka);
end;

procedure TfrmMain.btRefreshNavchCourseClick(Sender: TObject);
begin
  if cbGazetaSelector.KeyValue = GZ_PR then
      publData.cdsNavchCourse.Params.ParamByName('IS_ID').AsInteger := data.tblParamsPM_CURRENT_ISSUE_PR.AsInteger
  else if cbGazetaSelector.KeyValue = GZ_NS then
    	publData.cdsNavchCourse.Params.ParamByName('IS_ID').AsInteger := data.tblParamsPM_CURRENT_ISSUE_NS.AsInteger
  else if cbGazetaSelector.KeyValue = GZ_ST then
      publData.cdsNavchCourse.Params.ParamByName('IS_ID').AsInteger := data.tblParamsPM_CURRENT_ISSUE_SR.AsInteger
  else if cbGazetaSelector.KeyValue = GZ_RZ then
      publData.cdsNavchCourse.Params.ParamByName('IS_ID').AsInteger := data.tblParamsPM_CURRENT_ISSUE_RZ.AsInteger
  else if cbGazetaSelector.KeyValue = GZ_RK then
      publData.cdsNavchCourse.Params.ParamByName('IS_ID').AsInteger := data.tblParamsPM_CURRENT_ISSUE_RK.AsInteger;

	if ( not publData.cdsNavchCourse.Active) then
		publData.cdsNavchCourse.Open()
	else
		publData.cdsNavchCourse.Refresh();
end;

// Разбивает текст объявления на заголовок и тело для таблицы Учебных курсов
procedure splitCourse(text: String; var name, length, cost: String);
var
	lst: TStringList;
	i: integer;
begin
	lst := TStringList.Create;
	lst.Text := text;
	name	:= '';
	length	:= '';
	cost	:= '';
	if (lst.Count > 0) then
	begin
		name := lst[0];
		if (lst.Count > 1) then
			length := lst[1];

		if (lst.Count > 2) then
			for i := 2 to lst.Count - 1 do
				cost := cost + ' ' + lst[i];
	end;
	lst.Free;
end;

// Разбивает информацию о клиенте на название и адрес для таблицы Учебных курсов
procedure splitCustInfo(text: String; var name, info: String);
var
	lst: TStringList;
	i: integer;
begin
	lst := TStringList.Create;
	lst.Text := text;
	name	:= '';
	info	:= '';
	if (lst.Count > 0) then
	begin
		name := lst[0];

		if (lst.Count > 1) then
			for i:=1 to lst.Count-1 do
				info := info + ' ' + lst[i];
	end;
	lst.Free;
end;


procedure TfrmMain.btExportNavchCourseClick(Sender: TObject);
var
	rep: THtmlReport;
	lastRub: string;
	tx_name, tx_length, tx_cost, ci_name, ci_info: string;
begin
	rep := THtmlReport.Create();
	rep.TempName:='PrInfo-Navch-Course-export';
	rep.Add('<HTML><HEAD><TITLE>Учебные курсы</TITLE>');//<STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

	with publData do
	begin
		rep.Add('<TABLE BORDER=1 BORDERCOLOR=BLACK>');
		cdsNavchCourse.First();
		while (not cdsNavchCourse.Eof) do
		begin
			if (cdsNavchCourseRB_NAME.AsString <> lastRub) then
				rep.Add('<TR><TD COLSPAN=4><CENTER>' + null2nbsp(cdsNavchCourseRB_NAME.AsString) + '</CENTER></TD></TR>');
			lastRub := cdsNavchCourseRB_NAME.AsString;

			splitCourse(cdsNavchCourseOB_TEXT.AsString, tx_name, tx_length, tx_cost);
			splitCustInfo(cdsNavchCourseCU_INFO.AsString, ci_name, ci_info);

			rep.Add(  '<TR><TD ROWSPAN=2><B>' + null2nbsp(tx_name)
					+ '</B></TD><TD><B><CENTER>' + null2nbsp(ci_name)
					+ '</CENTER></B></TD><TD ROWSPAN=2><CENTER>' + null2nbsp(tx_length)
					+ '</CENTER></TD><TD ROWSPAN=2><CENTER>' + null2nbsp(tx_cost)
					+ '</CENTER></TD></TR><TR><TD><CENTER>' + null2nbsp(ci_info)
					+ '</CENTER></TD></TR>');
			cdsNavchCourse.Next();
		end;
	end;

	rep.Add('</TABLE></BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;

procedure TfrmMain.cbAgRepByIssueGazetaChange(Sender: TObject);
begin
	if (cbAgRepByIssueGazeta.KeyValue = GZ_PR) then
		cbAgRepByIssueIssue.ListSource := data.dsIssuePR
	else if (cbAgRepByIssueGazeta.KeyValue = GZ_NS) then
		cbAgRepByIssueIssue.ListSource := data.dsIssueNS
	else if (cbAgRepByIssueGazeta.KeyValue = GZ_ST) then
    cbAgRepByIssueIssue.ListSource := data.dsIssueSR
  else if (cbAgRepByIssueGazeta.KeyValue = GZ_RZ) then
    cbAgRepByIssueIssue.ListSource := data.dsIssueRZ
  else if (cbAgRepByIssueGazeta.KeyValue = GZ_RK) then
    cbAgRepByIssueIssue.ListSource := data.dsIssueRK
  else
		cbAgRepByIssueIssue.ListSource := data.dsIssueSR;
end;

procedure TfrmMain.cbObjavRepGazetaChange(Sender: TObject);
begin
	if (cbObjavRepGazeta.KeyValue = GZ_PR) then
		cbObjavRepIssue.ListSource := data.dsIssuePR
	else if (cbObjavRepGazeta.KeyValue = GZ_NS) then
		cbObjavRepIssue.ListSource := data.dsIssueNS
	else if (cbObjavRepGazeta.KeyValue = GZ_ST) then
    cbObjavRepIssue.ListSource := data.dsIssueSR
  else if (cbObjavRepGazeta.KeyValue = GZ_RZ) then
    cbObjavRepIssue.ListSource := data.dsIssueRZ
  else if (cbObjavRepGazeta.KeyValue = GZ_RK) then
    cbObjavRepIssue.ListSource := data.dsIssueRK
  else
		cbObjavRepIssue.ListSource := data.dsIssueSR;
end;

procedure TfrmMain.btInetImportClick(Sender: TObject);
begin
	frmInetImport.ShowModal();
end;

procedure TfrmMain.cbRepAllByRubGazetaChange(Sender: TObject);
begin
	publData.tblRubrikaKorrektura.CloneCursor(cacheData.cdsRubrika, true);
	publData.tblRubrikaKorrektura.Filter := 'GZ_ID=' + IntToStr(cbRepAllByRubGazeta.KeyValue);
	publData.tblRubrikaKorrektura.Filtered := true;
end;

procedure TfrmMain.btRepVerstkaObjavCountClick(Sender: TObject);
var
	qry: TSQLQuery;
	rep: THtmlReport;
	sum: real;
	cnt: integer;
begin
	qry := repData.qryObjavCountModule;
	qry.Params.ParamByName('IS_ID').AsInteger := cbGazetaSelector.KeyValue;// data.getCurrentIssue(cbGazetaSelector.KeyValue);

	if (qry.Active) then qry.Close();
	qry.Open();

	rep := THtmlReport.Create();
	rep.TempName := 'PrInfo-verstka-count';
	rep.Add('<HTML><HEAD><TITLE>Статистика для вёрстки</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');
	rep.Add('<CENTER><B>Статистика для вёрстки</B></CENTER>');

	rep.Add(getTableHeader(qry,13));

	sum := 0;

	qry.First();
	while (not qry.Eof) do
	begin
		rep.Add(getTableRow(qry,13,nil));
		sum := sum + qry.FieldByName('RUB_SPACE').AsFloat;
		qry.Next();
	end;

	rep.Add('</TABLE>');

	rep.Add('<BR>Общая площадь: ' + format('%.2f',[sum]));

	qry.Close();

	qry := repData.qryObjavCountText;
	qry.Params.ParamByName('IS_ID').AsInteger := data.getCurrentIssue(cbGazetaSelector.KeyValue);
	//qryObjavCountText
	if (qry.Active) then qry.Close();
	qry.Open();

	rep.Add(getTableHeader(qry,13));

	cnt := 0;

	qry.First();
	while (not qry.Eof) do
	begin
		rep.Add(getTableRow(qry,13,nil));
		cnt := cnt + qry.FieldByName('RUB_COUNT').AsInteger;
		qry.Next();
	end;

	rep.Add('</TABLE>');

	rep.Add('<BR>Общее количество: ' + IntToStr(cnt));

	qry.Close();

	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;

procedure TfrmMain.BitBtn15Click(Sender: TObject);
begin
	publData.cdsCustForObjavExport.Delete();
	publData.cdsCustForObjavExport.ApplyUpdates(0);
end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
	if (frmCustForm.SelectCust(true)) then
	begin
		publData.cdsCustForObjavExport.Append();
		publData.cdsCustForObjavExport.FieldByName('AG_ID').Value := data.cdsCustAG_ID.Value;
		publData.cdsCustForObjavExport.FieldByName('CU_ID').Value := data.cdsCustCU_ID.Value;
		publData.cdsCustForObjavExport.CheckBrowseMode();
		publData.cdsCustForObjavExport.ApplyUpdates(0);
		publData.cdsCustForObjavExport.Refresh();
	end;
end;

procedure TfrmMain.tabCustObjavExportShow(Sender: TObject);
begin
	if (not publData.cdsCustForObjavExport.Active) then
		publData.cdsCustForObjavExport.Open();
end;

procedure TfrmMain.cbExportGazetaChange(Sender: TObject);
begin
	if (cbExportGazeta.KeyValue = GZ_PR) then
		cbExportIssue.ListSource := data.dsIssuePR
	else if (cbExportGazeta.KeyValue = GZ_NS) then
		cbExportIssue.ListSource := data.dsIssueNS
	else
		cbExportIssue.ListSource := data.dsIssueSR;
end;

procedure TfrmMain.BitBtn16Click(Sender: TObject);
var
	rep: THtmlReport;
	currPath,currFile,errors: String;
begin
	if (dlgSaveObjavExport.Execute()) then
	begin
		publData.cdsObjavExportCust.Params.ParamByName('IS_ID').AsInteger := cbExportIssue.KeyValue;
		if (publData.cdsObjavExportCust.Active) then
			publData.cdsObjavExportCust.Close();
		publData.cdsObjavExportCust.Open();
		rep := THtmlReport.Create();
		try
			rep.TempName := 'cust-objav-export';
			rep.Add('<HTML><HEAD><TITLE>Объявления в номер: ' + cbExportIssue.Text + '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
			rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

			publData.cdsObjavExportCust.First();
			rep.Add(getTableHeader(publData.cdsObjavExportCust, 13));
			while ( not publData.cdsObjavExportCust.Eof) do
			begin
				rep.Add(getTableRow(publData.cdsObjavExportCust, 13, nil));

				publData.cdsObjavExportCust.Next();
			end;

			rep.Add('</BODY></HTML>');
			rep.SaveToFile(dlgSaveObjavExport.FileName);				
		finally
			rep.Free();                                         
		end;

		publData.cdsModuliExportCust.Params.ParamByName('IS_ID').AsInteger := cbExportIssue.KeyValue;
		if (publData.cdsModuliExportCust.Active) then
			publData.cdsModuliExportCust.Close();
		publData.cdsModuliExportCust.Open();

		errors := '';
		currPath := ExtractFilePath(dlgSaveObjavExport.FileName) + '_Модули\';
		publData.cdsModuliExportCust.First();		
		while ( not publData.cdsModuliExportCust.Eof) do
		begin
			ForceDirectories(currPath + publData.cdsModuliExportCustRB_NAME_SHORT.AsString);

//  ToDo: В связи с изменением формата хранения картинок нужно
//  заменить эту процедуру
      
			currFile := currPath + publData.cdsModuliExportCustRB_NAME_SHORT.AsString + '\';
			currFile := currFile
            + publData.qryModuliExportCustSD_NUM.AsString + '-'
						+ publData.cdsModuliExportCustOB_ID.AsString + '.tif';

			try
				FileFromCompressedField(publData.cdsModuliExportCustCONTENT_PICTURE, currFile);
			except
				errors := errors + currFile + #10#13;
			end;

			publData.cdsModuliExportCust.Next();
		end;

		if (errors <> '') then
			MessageDlg('Невозможно сохранить следующие файлы: '#10#13 + errors, mtError, [mbOk], 0);
	end;
end;

procedure TfrmMain.btSdelkaByOfficeClick(Sender: TObject);
var
	rep: THtmlReport;
begin
	rep := THtmlReport.Create();
	rep.TempName := 'PrInfo-objav-rep-by-office';
	rep.Add('<HTML><HEAD><TITLE>Объявления по офису (ППО) ' + cbSdelkaByOfficeOffice.Text + ' за ' + edSdelkaByOfficeDateFrom.Text + '-' + edSdelkaByOfficeDateTo.Text + '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

	rep.AddStrings(SdelkaByOfficePrint(cbSdelkaByOfficeOffice.KeyValue, StrToDate(edSdelkaByOfficeDateFrom.Text), StrToDate(edSdelkaByOfficeDateTo.Text)));

	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;

function TfrmMain.SdelkaByOfficePrint(officeId: integer; dateFrom: TDate; dateTo: TDate): TStringList;
var
	rep: TStringList;
begin
	rep := TStringList.Create();

	data.tblRequisite.First();
	while (not data.tblRequisite.Eof) do
	begin
		data.tblPayType.First();
		while (not data.tblPayType.Eof) do
		begin
			rep.AddStrings(SdelkaByOfficePrintOneTable(officeId, dateFrom, dateTo, data.tblRequisiteRQ_ID.Value, data.tblRequisiteRQ_NAME.Value, data.tblPayTypePT_ID.Value, data.tblPayTypePT_NAME.Value));

			data.tblPayType.Next();
		end;

		data.tblRequisite.Next();
	end;

	Result := rep;
end;


function TfrmMain.SdelkaByOfficePrintOneTable(officeId: integer; dateFrom: TDate; dateTo: TDate; requisiteId: integer; requisiteName: string; payTypeId: integer; payTypeName: string): TStringList;
var
	rep: TStringList;
	qry: TSQLQuery;

	sum_pr, sum_ns, sum_st, sum_rz, sum_rk, sum_ttl: Currency;
	sdelka_count: integer;
begin
	rep := TStringList.Create();

	sum_pr	:= 0;
	sum_ns	:= 0;
	sum_st	:= 0;
	sum_rz	:= 0;
	sum_rk	:= 0;
	sum_ttl	:= 0;

	sdelka_count := 0;

	qry := repData.qrySdelkaByOffice;

	if (qry.Active) then
		qry.Close();

	qry.ParamByName('OFFICE_ID').AsInteger	:= officeId;
	qry.ParamByName('RQ_ID').AsInteger		:= requisiteId;
	qry.ParamByName('PT_ID').AsInteger		:= payTypeId;
	qry.ParamByName('DATE_FROM').AsDate		:= dateFrom;
	qry.ParamByName('DATE_TO').AsDate		:= dateTo;

	qry.Open();

	rep.Add('<B>Юр. лицо: ' + requisiteName + ', форма оплаты: ' + payTypeName + '</B>');

	rep.Add(getTableHeader(qry, 13));

	qry.First();
	while (not qry.Eof) do
	begin
		rep.Add(getTableRow(qry, 13, nil));

		inc(sdelka_count);

		sum_ttl := sum_ttl + qry.FieldByName('SD_SUM').AsCurrency;

		if (qry.FieldByName('GZ_ID').AsInteger = GZ_PR) then
			sum_pr := sum_pr + qry.FieldByName('SD_SUM').AsCurrency
		else if (qry.FieldByName('GZ_ID').AsInteger = GZ_NS) then
			sum_ns := sum_ns + qry.FieldByName('SD_SUM').AsCurrency
		else if (qry.FieldByName('GZ_ID').AsInteger = GZ_ST) then
			sum_st := sum_st + qry.FieldByName('SD_SUM').AsCurrency
		else if (qry.FieldByName('GZ_ID').AsInteger = GZ_RZ) then
			sum_rz := sum_rz + qry.FieldByName('SD_SUM').AsCurrency
		else if (qry.FieldByName('GZ_ID').AsInteger = GZ_RK) then
			sum_rk := sum_rk + qry.FieldByName('SD_SUM').AsCurrency;

		qry.Next();
	end;

	rep.Add('</TABLE>');

	rep.Add('<B>Итог:</B><BR>');

	rep.Add(format('Количество сделок: %d<BR>',	[sdelka_count]));
	rep.Add(format('Сумма: %.2f<BR><BR>',		[sum_ttl]));
	rep.Add(format('Сумма ПР: %.2f<BR>',		[sum_pr]));
	rep.Add(format('Сумма НС: %.2f<BR>',		[sum_ns]));
	rep.Add(format('Сумма СТ: %.2f<BR>',		[sum_st]));
	rep.Add(format('Сумма РдЖ: %.2f<BR>',		[sum_rz]));
	rep.Add(format('Сумма РвК: %.2f<BR>',		[sum_rk]));

	Result := rep;
	qry.Close();
end;

procedure TfrmMain.btNalBarterClick(Sender: TObject);
var rep: THtmlReport;
    res: TStringList;
begin
    rep := THtmlReport.Create();
    rep.TempName :=  'PrInfo-nal-barter';
    rep.Add('<HTML><HEAD><TITLE>Оплаченные наличные, бартерные, безнал-в нал сделки за ' +
            edNalBarterDateFrom.Text + '-' + edNalBarterDateTo.Text +
            '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
    rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html"; charset=windows-1251"></HEAD><BODY>');

    res := NalBarterPrint(StrToDate(edNalBarterDateFrom.text), StrToDate(edNalBarterDateTo.Text));
    rep.AddStrings(res);

    rep.Add('</BODY></HTML>');
    rep.OpenInBrowser;
    rep.Free;
    FreeAndNil(res);
end;


function TfrmMain.NalBarterPrint(dateFrom, dateTo: TDate): TStringList;
var
	rep: TStringList;
	qry: TSQLQuery;
  oldAgent,newAgent: string;
  f: boolean;
begin
    rep := TStringList.Create;
    qry := repData.qryNalBarter;
    if qry.Active then qry.Close;

    qry.ParamByName('ds').AsDate := dateFrom;
    qry.ParamByName('de').AsDate := dateTo;
    qry.Open;
    qry.First;

    oldAgent := qry.fieldByName('AG_NAME').AsString;
    newAgent := oldAgent;

    while not qry.Eof do
    begin
          f := true;
          while (oldAgent = newAgent) and (not qry.Eof) do
          begin
              if f then
              begin
                  rep.Add('<B>Оплаченные наличные, бартерные, безнал-в нал сделки агента ' +
                          oldAgent + ' за ' + edNalBarterDateFrom.Text + '-' + edNalBarterDateTo.Text + '<B>');
                  rep.Add(getTableHeader(qry, 13));
                  f := false;
              end;

              rep.Add(getTableRow(qry,13,nil));
              qry.Next;
              newAgent := qry.fieldByName('AG_NAME').AsString;
          end;
          oldAgent := newAgent;
          rep.Add('</TABLE>');
          rep.Add('<BR>');
    end;

    result := rep;
    qry.Close();
end;

function TfrmMain.AssistantsPrint(dateFrom: TDate; dateTo: TDate): TStringList;
var
	rep: TStringList;
	qry: TSQLQuery;
begin
	rep := TStringList.Create();

	qry := repData.qryAssistants;

	if (qry.Active) then
		qry.Close();

	qry.ParamByName('DATE_FROM').AsDate		:= dateFrom;
	qry.ParamByName('DATE_TO').AsDate		:= dateTo;

	qry.Open();

	rep.Add(getTableHeader(qry, 13));

	qry.First();
	while (not qry.Eof) do
	begin
		rep.Add(getTableRow(qry, 13, nil));

		qry.Next();
	end;

	rep.Add('</TABLE>');

	Result := rep;
	qry.Close();
end;


procedure TfrmMain.btNotApprovedCoverClick(Sender: TObject);
var
	rep: THtmlReport;
  res: TStringList;
begin
	rep := THtmlReport.Create();
	rep.TempName := 'PrInfo-not-approved-cover';
	rep.Add('<HTML><HEAD><TITLE>Неподтвержденная обложка в газету ' + cbNotApprovedCoverGazeta.Text + '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

	rep.Add('<CENTER><B>Неподтвержденные сделки на обложку газеты ' + cbNotApprovedCoverGazeta.Text + '</B></CENTER><BR>');

  res := NotApprovedCoverPrint(cbNotApprovedCoverGazeta.KeyValue);
	rep.AddStrings(res);

	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
  FreeAndNil(res)
end;

function TfrmMain.NotApprovedCoverPrint(gazetaId: integer): TStringList;
var
	rep: TStringList;
	qry: TSQLQuery;
begin
	rep := TStringList.Create();

	qry := repData.qryNotapprovedCover;

	if (qry.Active) then qry.Close();

	qry.ParamByName('GZ_ID').AsInteger := gazetaId;

	qry.Open();

	rep.Add(getTableHeader(qry, 13));

	qry.First();
	while (not qry.Eof) do
	begin
		rep.Add(getTableRow(qry,13,nil));

		qry.Next();
	end;

	rep.Add('</TABLE>');

	Result := rep;
	qry.Close();
end;


procedure TfrmMain.SetModuliVerstkaFilter(rbId: Variant; isEvent: boolean);
begin
	if (not (csDestroying in cbModuliVerstkaFilter.ListSource.ComponentState)) then
	with publData do
	begin
		grModuliVerstka.SelectedRows.Clear;

		if (rbId = NULL) then
		begin
			cbModuliVerstkaFilter.KeyValue := NULL;
			publData.cdsModuliVerstka.Filtered := false;

			data.tblRubrika.First;

			if (not isEvent) then
				cbModuliVerstkaFilter.KeyValue := data.tblRubrikaRB_ID.Value;
		end
		else
		begin
			cdsModuliVerstka.Filter := 'RB_ID=' + IntToStr(rbId);
			if (not cdsModuliVerstka.Filtered) then
				cdsModuliVerstka.Filtered := true;

			if (not isEvent) then
				cbModuliVerstkaFilter.KeyValue := rbId;
		end;

	end;
end;

function TfrmMain.ModuliExportRubrika(rbId: integer): string;
var
	currPath, currFile, errors: String;
  rn:integer;
  ext:string;
begin
  randomize;
	with publData do
	begin
		SetModuliVerstkaFilter(rbId, false);

		cdsModuliVerstka.First;

		errors := '';
		currPath := getCurrentIssueExportPath() + '\_Модули\';

		while (not cdsModuliVerstka.Eof) do
		begin
			ForceDirectories(currPath + cdsModuliVerstkaRB_NAME_SHORT.AsString);

			currFile := currPath + cdsModuliVerstkaRB_NAME_SHORT.AsString + '\';

			if (cdsModuliVerstkaOBJAV_HAS_ATTENTION.Value > 0) then
			begin
				ForceDirectories(currPath + cdsModuliVerstkaRB_NAME_SHORT.AsString + '\_Отдельно');
				currFile := currFile + '_Отдельно\';
			end;

      rn := RandomRange(100, 999);
//  ToDo: В связи с изменением формата хранения картинок нужно
//  заменить эту процедуру
      ext := trim(cdsModuliVerstkaEXTENSION.AsString);
      if ext = '' then ext := 'tif';

			currFile := currFile
            + IntToStr(rn) + '-'
            + cdsModuliVerstkaSD_NUM.AsString + '.' + ext;

			try
				FileFromCompressedField(cdsModuliVerstkaCONTENT_PICTURE, currFile);

        spLogModuleLoad.ParamByName('US_ID').AsInteger := frmMain.currentUser;
        spLogModuleLoad.ParamByName('OBJAV_ID').AsInteger := cdsModuliVerstkaOB_ID.AsInteger;
        spLogModuleLoad.ParamByName('CONTENT_ID').AsInteger := cdsModuliVerstkaCONTENT_ID.AsInteger;
        spLogModuleLoad.ParamByName('TYP').AsInteger := 2;
        spLogModuleLoad.ExecProc();
			except
				errors := errors + currFile + #10#13;
			end;

			cdsModuliVerstka.Next;
		end;

		Result := errors;
	end;
end;

procedure TfrmMain.btModuliExportRubrikaClick(Sender: TObject);
var
	errors: string;
begin
	if (cbModuliVerstkaFilter.KeyValue <> NULL) then
	begin
//		btRefreshModuliVerstka.Click;

		errors := ModuliExportRubrika(cbModuliVerstkaFilter.KeyValue);
		if (errors <> '') then
			MessageDlg(LeftStr('Невозможно сохранить следующие файлы: '#10#13 + errors, 1000),mtError,[mbOk],0);
	end
	else
		MessageDlg('Выберите рубрику', mtError, [mbOk], 0);
end;

function TfrmMain.ChooseTemplate(gzId: integer; templateType: string): string;
begin
	if (exportTemplates.IndexOf(IntToStr(gzId) + '-' + templateType) >= 0) then
		Result := (exportTemplates.Objects[exportTemplates.IndexOf(IntToStr(gzId) + '-' + templateType)] as TStringHolder).Value
	else
		Result := '';
end;

function TfrmMain.ChooseTextTemplate(gzId, fmId: integer; fmName: string): string;
var
	fmNameSimple: string;
begin
	// сначала проверим, может есть шаблон для конкретного формата
	fmNameSimple := StringReplace(fmName, ' ', '', [rfReplaceAll]);
	fmNameSimple := StringReplace(fmNameSimple, '!', '', [rfReplaceAll]);
	fmNameSimple := StringReplace(fmNameSimple, '?', '', [rfReplaceAll]);
	fmNameSimple := StringReplace(fmNameSimple, '.', '', [rfReplaceAll]);
	fmNameSimple := StringReplace(fmNameSimple, '/', '', [rfReplaceAll]);
	fmNameSimple := StringReplace(fmNameSimple, '\', '', [rfReplaceAll]);

	Result := ChooseTemplate(gzId, fmNameSimple + '.txt');

	if (Result <> '') then exit;

  if (fmID in [124, 125, 126, 43]) then  // Объявление в рамке
  begin
      result := ChooseTemplate(gzId, objavFrameTempl);
      if result = '' then Result := ChooseTemplate(gzId, objavTempl);
  end
	else if (fmId = FORMAT_EXCLAM) then
	begin
		Result := ChooseTemplate(gzId, objavExclamationTempl);
		if (Result = '') then
			Result := ChooseTemplate(gzId, objavTempl);
	end
	else
		Result := ChooseTemplate(gzId, objavTempl);
end;

{ TStringHolder }

constructor TStringHolder.Create(v: string);
begin
	Value := v;
end;

procedure TfrmMain.cbGzChange(Sender: TObject);
begin
    FillIss(cbGZ.KeyValue);
end;

procedure TfrmMain.btAddFormatClick(Sender: TObject);
begin
      if not Assigned(frmNewFormat) then frmNewFormat := TfrmNewFormat.Create(self);
      try
        frmNewFormat.AddNewFormat();
      finally
        cdsFormats.Locate('FM_NAME', frmNewFormat.cdsNewFormatFM_NAME.AsString, []);
        FreeAndNil(frmNewFormat);
        data.tblFormat.Close;
        data.tblFormat.Open;
        cdGzFormatCloseUp(Sender);
      end;
end;

procedure TfrmMain.btEditFormatClick(Sender: TObject);
var row:integer;
begin
    row := 0;
    if not Assigned(frmNewFormat) then frmNewFormat := TfrmNewFormat.Create(self);
    try
        if cdsFormats.Active then  row := cdsFormats.RecNo else row := 0;
        frmnewFormat.EditFormat(grFormats.DataSource.DataSet.FieldByName('FM_ID').AsInteger,
                                grFormats.DataSource.DataSet.FieldByName('GZ_ID').AsInteger);
    finally
        FreeAndNil(frmNewFormat);
        data.tblFormat.Close;
        data.tblFormat.Open;
        cdGzFormatCloseUp(Sender);

        if (row > 0) and (row <= cdsFormats.RecordCount) then
        begin
           cdsFormats.RecNo := row;
        end;
    end;    
end;

procedure TfrmMain.PageControl1Change(Sender: TObject);
begin
      if PageControl1.ActivePage = tabSdelka then
      begin
          if not Assigned(frmControlSdelka) then
          begin
             frmControlSdelka := TfrmControlSdelka.Create(self);
             frmControlSdelka.Dock(tabSdelka, tabSdelka.ClientRect);
             frmControlSdelka.Show;
          end;
      end
      else if PageControl1.ActivePage = tabCover then
      begin

      end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
    FreeAndNil(frmControlSdelka);
    FreeAndNil(frmCover);
    FreeAndNil(frmSite_Objav);
    FreeAndNil(speller);
    FreeAndNil(frmnabor);
    FreeAndNil(frmDesign);
end;

procedure TfrmMain.cdGzFormatCloseUp(Sender: TObject);
begin
    if cdGzFormat.KeyValue = NULL then exit;

     cdsFormats.Close;
     cdsFormats.FetchParams;
     cdsFormats.Params.ParamByName('gz_id').AsInteger := cdGzFormat.KeyValue;

     cdsFormats.Open;
end;

procedure TfrmMain.mnuSdRepClick(Sender: TObject);
var
	rep:THtmlReport;
  ds,de: TDateTime;
  path,s:string;
  i:integer;
begin
  ds := StartOfTheMonth(IncMonth(Date, -1));
  de := EndOfTheMonth(IncMonth(Date, -1));
  if not SelectDirectory('Выберите каталог', '', path) then exit;

  for i := 0 to 2 do
  begin
    	rep:=THtmlReport.Create();
    	rep.TempName:='PrInfo-agent-sdelka-crossing-month';
    	rep.Add('<HTML><HEAD><TITLE>Длинные сделки в периоде ' + DateToStr(ds) + ' - ' + DateToStr(de) + '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
    	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

	    rep.AddStrings(SdelkaCrossingMonthPrint(ds, de, i));
    	rep.Add('</BODY></HTML>');
	//rep.OpenInBrowser();
      s :=  '\Длинные сделки в периоде '+ DateToStr(ds) + ' - ' + DateToStr(de);
      case i of
            0: rep.SaveToFile(path + s + ' Коваленко.html');
            1: rep.SaveToFile(path + s + ' кроме Ковалеко.html');
            2: rep.SaveToFile(path + s + ' инвестиция.html');
      end;
	    rep.Free();
  end;
  MessageBox(handle, 'Создание отчетов завершено.', 'PrInfo', MB_OK or MB_ICONINFORMATION);
end;

function TfrmMain.SdelkaCrossingMonthPrint(dateFrom: TDate; dateTo: TDate;RepIndex:integer):TStringList;
var
	rep:TStringList;
	qry:TSQLQuery;
begin
	qry:=repData.qrySdelkaCrossingMonth;

	if (qry.Active) then qry.Close();

  qry.SQL.Clear;
  case RepIndex of
      0: qry.SQL.Append('SELECT * FROM REP_SDELKA_CROSSING_MONTH(:DATE_FROM, :DATE_TO)');
      1: qry.SQL.Append('SELECT * FROM REP_SDELKA_CROSSING_MONTH2(:DATE_FROM, :DATE_TO)');
      2: qry.SQL.Append('SELECT * FROM REP_SDELKA_CROSSING_MONTH3(:DATE_FROM, :DATE_TO)');
  end;
	qry.ParamByName('DATE_FROM').AsDate	:= dateFrom;
	qry.ParamByName('DATE_TO').AsDate	:= dateTo;

	qry.Open();

	rep:=TStringList.Create();

	rep.Add('<CENTER><B>Длинные сделки за период ' + DateToStr(dateFrom) + ' - ' + DateToStr(dateTo) + '</B></CENTER>');

	rep.Add(getTableHeader(qry,13));

	qry.First();
	while (not qry.Eof) do
	begin
		rep.Add(getTableRow(qry,13,nil));

		qry.Next();
	end;

	Result:=rep;
	qry.Close();
end;

procedure TfrmMain.cdGzRubrikaCloseUp(Sender: TObject);
begin
    if cdGzRubrika.KeyValue = NULL then exit;

     cdsRubrika.Close;
     cdsRubrika.FetchParams;
     cdsRubrika.Params.ParamByName('gz_id').AsInteger := cdGzRubrika.KeyValue;

     cdsRubrika.Open;
end;

procedure TfrmMain.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
    data.SetParamValue('PM_FIRST_OTKAZNIK_ISSUE_PR', DBLookupComboBox1.KeyValue);
    data.SetParamValue('PM_FIRST_OTKAZNIK_ISSUE_NS', DBLookupComboBox2.KeyValue);
    data.SetParamValue('PM_FIRST_OTKAZNIK_ISSUE_SR', DBLookupComboBox7.KeyValue);
    data.SetParamValue('PM_FIRST_OTKAZNIK_ISSUE_RZ', DBLookupComboBox10.KeyValue);
    data.SetParamValue('PM_FIRST_OTKAZNIK_ISSUE_RK', DBLookupComboBox11.KeyValue);
    data.tblParams.Close;
    data.tblParams.Open;
end;

procedure TfrmMain.dblRP_GazetaCloseUp(Sender: TObject);
begin
   if not data.sdsRubrikaPohozha.Active then data.sdsRubrikaPohozha.Open;
   if dblRP_Gazeta.KeyValue = NULL then exit;

   if not data.tblRubrikaByGZ.Active then data.tblRubrikaByGZ.Open;

   data.tblRubrikaByGZ.Filtered := false;
   data.tblRubrikaByGZ.Filter := 'GZ_ID=' + VartoStr(dblRP_Gazeta.KeyValue);
   data.tblRubrikaByGZ.Filtered := true;

   data.sdsRubrikaPohozha.Filtered := false;
   data.sdsRubrikaPohozha.Filter := 'GZ_ID=' + VartoStr(dblRP_Gazeta.KeyValue);
   data.sdsRubrikaPohozha.Filtered := true;
end;

procedure TfrmMain.btNewRubrikaClick(Sender: TObject);
begin
    if not Assigned(frmNewRubrika) then frmNewRubrika := TfrmNewRubrika.Create(self);
    try
       frmNewRubrika.AddNewRubrika(cdGzRubrika.KeyValue);
       cdGzRubrikaCloseUp(Sender);
       
    finally
       cdsRubrika.Locate('RB_NAME_SHORT', frmNewRubrika.cdsRubrikaRB_NAME_SHORT.AsString, []);
       FreeAndNil(frmNewRubrika);
    end
end;

procedure TfrmMain.btEditRubrikaClick(Sender: TObject);
var row:integer;
begin
    row := 0;
    if not Assigned(frmNewRubrika) then frmNewRubrika := TfrmNewRubrika.Create(self);
    try
       if cdsRubrika.Active then row := cdsRubrika.RecNo;
       frmNewRubrika.EditNewRubrika(cdsRubrikaRB_ID.AsInteger);
       cdGzRubrikaCloseUp(Sender);
    finally
       FreeAndNil(frmNewRubrika);

       if (row > 0) and (row <= cdsRubrika.RecordCount) then cdsRubrika.RecNo := row;
    end
end;

procedure TfrmMain.bthCheckClick(Sender: TObject);
var factNum:integer;
begin
  factNum := StrToInt(InputBox('', '№ Счета', '0'));
  if factNum = 0 then exit;

  data.qUpdFactNum.ParamByName('num').AsInteger := factNum;
  data.qUpdFactNum.ExecSQL;
  ShowMessage('Исправлено.');
end;

procedure TfrmMain.HeaderControl1SectionTrack(
  HeaderControl: THeaderControl; Section: THeaderSection; Width: Integer;
  State: TSectionTrackState);
begin
      Section.Width := width;
      Panel27.Width := HeaderControl1.Sections.Items[0].Width;
      Panel27.Left :=  HeaderControl1.Sections.Items[0].Left;
      Panel28.Width := HeaderControl1.Sections.Items[1].Width;
      Panel28.Left :=  HeaderControl1.Sections.Items[1].Left;
      Panel29.Width := HeaderControl1.Sections.Items[2].Width;
      Panel29.Left := HeaderControl1.Sections.Items[2].Left;

end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
        HeaderControl1SectionTrack(HeaderControl1,
                                   HeaderControl1.Sections.Items[0],
                                   HeaderControl1.Sections.Items[0].Width,
                                   tsTrackEnd);

end;

procedure TfrmMain.createCover;
begin
      if not Assigned(frmCover) then
      begin
          frmCover := TfrmCover.Create(self);
          frmCover.Dock(tabCover, tabCover.ClientRect);
      end;
      TAccessRightsManager.SetWindowAccessState(int2user(frmMain.currentUserType), frmCover);
      frmCover.Show;
end;

end.
