unit dmRep;

interface

uses
  SysUtils, Classes, DB, FMTBcd, SqlExpr, DBClient, SimpleDS, Provider, Dialogs
  , globals;

type
  TrepData = class(TDataModule)
    qrySdelkaZaPeriod: TSQLQuery;
    dsSdelkaZaPeriod: TDataSource;
    qrySdelkaZaPeriodSD_COMMENT: TStringField;
    qrySdelkaZaPeriodSD_SUM: TFloatField;
    qrySdelkaZaPeriodSD_PERCENT: TFloatField;
    qrySdelkaZaPeriodSD_ID_COMPOUND: TStringField;
    qrySdelkaZaPeriodSD_FACT_NUM: TIntegerField;
    qrySdelkaZaPeriodSD_FACT_DATE: TSQLTimeStampField;
    qrySdelkaZaPeriodCU_NAME: TStringField;
    qrySdelkaZaPeriodZAPAS_COUNT: TIntegerField;
    qrySdelkaZaPeriodPODACHA_NUMS: TStringField;
    qrySdelkaZaPeriodSDELKA_SPACE: TFloatField;
    qrySdelkaZaPeriodSD_TYPE: TSmallintField;
    qrySdelkaZaPeriodSD_KA_START_DATE: TSQLTimeStampField;
    qrySdelkaZaPeriodSD_KA_END_DATE: TSQLTimeStampField;
    qrySdelkaZaPeriodSD_SUM_DEFAULT: TFloatField;
	qrySdelkaZaPeriodSD_PERCENT_DEFAULT: TFloatField;
    qrySdelkaZaPeriodGZ_ID: TSmallintField;
    qrySdelkaZaPeriodSD_PERCENT_SUM: TFloatField;
    qrySdelkaVNomer: TSQLQuery;
    dsSdelkaVNomer: TDataSource;
    qrySdelkaVNomerSD_ID_COMPOUND: TStringField;
    qrySdelkaVNomerCU_NAME: TStringField;
    qrySdelkaVNomerPODACHA_NUMS: TStringField;
    qrySdelkaVNomerSD_COMMENT: TStringField;
    qrySdelkaVNomerIS_NAME_COMPOSED: TStringField;
    qrySdelkaNotPayed: TSQLQuery;
    dsSdelkaNotPayed: TDataSource;
    qrySdelkaNotPayedAG_ID: TIntegerField;
    qrySdelkaNotPayedSD_ID: TIntegerField;
    qrySdelkaNotPayedSD_ID_COMPOUND: TStringField;
    qrySdelkaNotPayedCU_NAME: TStringField;
    qrySdelkaNotPayedSD_FACT_NUM: TIntegerField;
    qrySdelkaNotPayedSD_FACT_DATE: TSQLTimeStampField;
    qrySdelkaNotPayedSD_SUM: TFloatField;
    qrySdelkaNotPayedSD_COMMENT: TStringField;
    qrySdelkaNotPayedPODACHA_NUMS: TStringField;
    qryZapasByTime: TSQLQuery;
    dsZapasByTime: TDataSource;
    qryZapasByTimeAG_ID: TIntegerField;
    qryZapasByTimeSD_ID: TIntegerField;
    qryZapasByTimeSD_ID_COMPOUND: TStringField;
    qryZapasByTimeCU_NAME: TStringField;
    qryZapasByTimeSD_COMMENT: TStringField;
    qryZapasByTimeZAPAS_COUNT: TIntegerField;
    qryZapasByTimeCU_ID_COMPOUND: TStringField;
    qryInterceptions: TSQLQuery;
    qryInterceptionsPH_NUMBER: TStringField;
    qryInterceptionsAG_ID_INTERCEPTED: TIntegerField;
    qryInterceptionsAG_NAME: TStringField;
    qryInterceptionsAG_NAME_INTERCEPTED: TStringField;
    qryInterceptionsSD_ID_COMPOUND: TStringField;
    qrySdelkaVNomerCU_ID_COMPOUND: TStringField;
    qrySdelkaZaPeriodCU_ID_COMPOUND: TStringField;
	qrySdelkaNotPayedPT_NAME: TStringField;
    qrySdelkaZaPeriodSD_NEW_CUST: TSmallintField;
    dsSdelkaCountSummary: TDataSource;
    qryZarplata: TSQLQuery;
    dsZarplata: TDataSource;
    qryZarplataSD_COMMENT: TStringField;
    qryZarplataSD_SUM: TFloatField;
    qryZarplataSD_PERCENT: TFloatField;
    qryZarplataSD_ID_COMPOUND: TStringField;
    qryZarplataSD_PERCENT_SUM: TFloatField;
    qryZarplataCU_NAME: TStringField;
    qryZarplataSDS_NAME: TStringField;
    qryZarplataPT_NAME: TStringField;
    qrySdelkaNotPayedCU_ID_COMPOUND: TStringField;
    qrySdelkaZaPeriodONE_PODACHA_SPACE: TFloatField;
    qryInterceptionsCU_ID_INTERCEPTED: TIntegerField;
    qryInterceptionsCU_NAME: TStringField;
    qryInterceptionsCU_NAME_INTERCEPTED: TStringField;
    qryInterceptionsCU_ID_COMPOUND: TStringField;
    qryInterceptionsCU_ID_COMPOUND_INTERCEPTED: TStringField;
    qryZarplataPT_ID: TSmallintField;
    qryPayedBeznalByTime: TSQLQuery;
    qryPayedBeznalByTimeAG_ID: TIntegerField;
    qryPayedBeznalByTimePT_NAME: TStringField;
    qryPayedBeznalByTimeSD_ID: TIntegerField;
    qryPayedBeznalByTimeSD_ID_COMPOUND: TStringField;
    qryPayedBeznalByTimeCU_ID_COMPOUND: TStringField;
    qryPayedBeznalByTimeCU_NAME: TStringField;
    qryPayedBeznalByTimeSD_FACT_NUM: TIntegerField;
    qryPayedBeznalByTimeSD_FACT_DATE: TSQLTimeStampField;
    qryPayedBeznalByTimeSD_SUM: TFloatField;
    qryPayedBeznalByTimeSD_COMMENT: TStringField;
    qryPayedBeznalByTimePODACHA_NUMS: TStringField;
    qryNotApprovedSdelkas: TSQLQuery;
    qryNotApprovedSdelkasSD_COMMENT: TStringField;
    qryNotApprovedSdelkasSD_SUM: TFloatField;
    qryNotApprovedSdelkasSD_ID_COMPOUND: TStringField;
    qryNotApprovedSdelkasPT_NAME: TStringField;
    qryNotApprovedSdelkasCU_NAME: TStringField;
    qryNotApprovedSdelkasSDS_NAME: TStringField;
    qryZarplataSD_FACT_NUM: TIntegerField;
    qryZarplataSD_FACT_DATE: TSQLTimeStampField;
    qryPayedBeznalByTimeSD_SUM_PAYED: TFloatField;
    qryNotApprovedSdelkasPODACHA_NUMS: TStringField;
    qryBonusLog: TSQLQuery;
    qryBonusLogBT_DATE: TSQLTimeStampField;
    qryBonusLogBT_SUM: TFloatField;
    qryBonusLogBT_COMMENT: TStringField;
    qryBonusLogBT_CHANGE: TFloatField;
    qryBonusLogAG_NAME: TStringField;
    qryBonusLogCU_NAME: TStringField;
    qryCassaBefore: TSQLQuery;
    qryCassaAfter: TSQLQuery;
    qryFinZarplata: TSQLQuery;
    qryFinZarplataSubTotal: TSQLQuery;
    tblTransType: TSimpleDataSet;
    tblTransTypeTT_ID: TIntegerField;
    tblTransTypeTT_NAME: TStringField;
    tblTransTypeTT_SIGN: TSmallintField;
    qryFinZarplataMT_ID: TIntegerField;
    qryFinZarplataMT_DATE: TSQLTimeStampField;
    qryFinZarplataMT_SUM: TFloatField;
    qryFinZarplataMT_COMMENT: TStringField;
    qryFinZarplataMT_CHANGE: TFloatField;
    qryFinZarplataTT_ID: TIntegerField;
    qryFinZarplataUS_ID: TIntegerField;
    qryFinZarplataSubTotalSUM: TFloatField;
    qryZarplataSD_PERCENT_SUM_TO_GIVE: TFloatField;
    qryObjavCountByRubrika: TSQLQuery;
    qryObjavCountByRubrikaRB_NAME: TStringField;
    qryObjavCountByRubrikaFM_NAME: TStringField;
    qryObjavCountByRubrikaCNT: TIntegerField;
    qrySdelkaObjav: TSQLQuery;
    qrySdelkaVNomerAG_ID: TIntegerField;
    qrySdelkaVNomerSD_ID: TIntegerField;
    qryObjavByRubrika: TSQLQuery;
    qrySdelkaObjavRB_NAME_SHORT: TStringField;
    qrySdelkaObjavFM_NAME: TStringField;
    qrySdelkaObjavOB_TEXT: TStringField;
    qrySdelkaObjavOB_COMMENT: TStringField;
    qrySdelkaObjavDRB_RB_NAME: TStringField;
    qryObjavByRubrikaSD_ID_COMPOUND: TStringField;
    qryObjavByRubrikaOS_NAME: TStringField;
    qryObjavByRubrikaOB_TEXT: TStringField;
    qrySdelkaZaPeriodRB_NAME_SHORT: TStringField;
    qrySdelkaZaPeriodFM_NAME: TStringField;
    qrySdelkaVNomerRB_NAME_SHORT: TStringField;
    qrySdelkaVNomerFM_NAME: TStringField;
    qrySdelkaZaPeriodPT_NAME: TStringField;
    qrySdelkaZaPeriodPT_ID: TSmallintField;
    qrySdelkaVNomerCU_OKPO: TStringField;
    qrySdelkaVNomerCU_INFO: TStringField;
    qrySdelkaVNomerCU_KA_INFO_SHORT: TStringField;
    qrySdelkaVNomerCU_KA_INFO_FULL: TStringField;
    qryZarplataSD_SUM_PAYED: TFloatField;
    qryCustByDate: TSQLQuery;
    qryRubrikaItog: TSQLQuery;
    qryCustByDateCUST_NEW: TIntegerField;
    qryCustByDateCUST_OLD: TIntegerField;
    qryCustByDateCUST_NEW_SDELKA_COUNT: TIntegerField;
    qryCustByDateCUST_OLD_SDELKA_COUNT: TIntegerField;
    qryCustByDateAG_NAME: TStringField;
    qryRubrikaItogRB_NAME: TStringField;
    qryRubrikaItogCUST_COUNT: TIntegerField;
    qryObjavByRubrikaOB_COMMENT: TStringField;
    qryCustByDateCUST_NEW_SDELKA_SUM: TFloatField;
    qryCustByDateCUST_OLD_SDELKA_SUM: TFloatField;
    qryAllCust: TSQLQuery;
    qryAllCustCU_ID_COMPOUND: TStringField;
    qryAllCustCU_NAME: TStringField;
    qryAllCustCU_PHONES: TStringField;
    qryAllCustCU_OKPO: TStringField;
    qryOtkaznikExit: TSQLQuery;
    qryOtkaznikExitPH_NUMBER: TStringField;
    qryAttentionObjavs: TSQLQuery;
    qryAttentionObjavsSD_ID_COMPOUND: TStringField;
    qryAttentionObjavsAG_NAME: TStringField;
    qryAttentionObjavsRB_NAME: TStringField;
    qryAttentionObjavsFM_NAME: TStringField;
    qryAttentionObjavsOBJAV_COMMENT: TStringField;
    qryNotApprovedSdelkasRB_IS_LOCKABLE: TFMTBCDField;
    qryVIP: TSQLQuery;
    qryVIPAG_ID: TIntegerField;
    qryVIPCU_ID: TIntegerField;
    qryVIPCU_NAME: TStringField;
    qryVIPKA_COUNT: TIntegerField;
    qryVIPKA_SUM: TFloatField;
    qryVIPINET_COUNT: TIntegerField;
    qryVIPINET_SUM: TFloatField;
    qryVIPTOTAL_COUNT: TIntegerField;
    qryVIPTOTAL_SUM: TFloatField;
    qryVIPModules: TSQLQuery;
    qryVIPModulesAG_ID: TIntegerField;
    qryVIPModulesSD_ID: TIntegerField;
    qryVIPModulesOB_ID: TIntegerField;
    qryVIPModulesRB_ID: TIntegerField;
    qryVIPModulesFM_ID: TIntegerField;
    qryVIPModulesOBJAV_HAS_ATTENTION: TSmallintField;
    qryVIPModulesCONTENT_ID: TIntegerField;
    qryVIPModulesCONTENT_PICTURE: TBlobField;
    qrySdelkaVNomerSDELKA_ALL_PHONES: TStringField;
    qrySdelkaZaPeriodSDELKA_ALL_PHONES: TStringField;
    qrySdelkaNotPayedSDELKA_ALL_PHONES: TStringField;
    qrySdelkaZaPeriodPODACHA_COUNT: TIntegerField;
    qrySdelkaZaPeriodSD_TYPE_DESC: TStringField;
    qrySdelkaNotPayedSD_TYPE_DESC: TStringField;
    qryPayedBeznalByTimeSD_TYPE_DESC: TStringField;
    qryObjavCountModule: TSQLQuery;
    qryObjavCountText: TSQLQuery;
    qryObjavCountModuleRB_NAME: TStringField;
    qryObjavCountModuleRUB_SPACE: TFloatField;
    qryObjavCountTextRB_NAME: TStringField;
    qryObjavCountTextRUB_COUNT: TIntegerField;
    qryAttentionObjavsPODACHA_NUMS: TStringField;
    qryAttentionObjavsIS_TEXT: TIntegerField;
    qryAttentionObjavsSD_ID: TIntegerField;
    qrySdelkaByOffice: TSQLQuery;
    qrySdelkaByOfficeSD_ID_COMPOUND: TStringField;
    qrySdelkaByOfficeSD_DATE: TSQLTimeStampField;
    qrySdelkaByOfficeSD_FACT_NUM: TIntegerField;
    qrySdelkaByOfficeAG_NAME: TStringField;
    qrySdelkaByOfficeCU_NAME: TStringField;
    qrySdelkaByOfficeCU_PHONES: TStringField;
    qrySdelkaByOfficeSD_TYPE_DESC: TStringField;
    qrySdelkaByOfficeFM_NAME: TStringField;
    qrySdelkaByOfficePODACHA_NUMS: TStringField;
    qrySdelkaByOfficeSD_SUM: TFloatField;
    qrySdelkaByOfficeUS_NAME: TStringField;
    qrySdelkaByOfficeRQ_NAME: TStringField;
    qrySdelkaByOfficeGZ_ID: TIntegerField;
    qryModuliByDesigner: TSQLQuery;
    qryModuliByDesignerUS_NAME: TStringField;
    qryModuliByDesignerCONTENT_COUNT: TIntegerField;
    qryModuliByDesignerUS_ID: TIntegerField;
    qryAssistants: TSQLQuery;
    qryAssistantsUS_NAME: TStringField;
    qryAssistantsSDELKA_COUNT: TIntegerField;
    qrySdelkaNotPayedPT_ID: TSmallintField;
    qryNotApprovedCover: TSQLQuery;
    qryNotApprovedCoverSD_ID_COMPOUND: TStringField;
    qryNotApprovedCoverGZ_NAME_SHORT: TStringField;
    qryNotApprovedCoverRB_NAME_SHORT: TStringField;
    qryNotApprovedCoverFM_NAME: TStringField;
    qryNotApprovedCoverCU_NAME: TStringField;
    qryNotApprovedCoverPODACHA_NUMS: TStringField;
    qryNotApprovedSdelkasGZ_NAME_SHORT: TStringField;
    qryNalBarter: TSQLQuery;
    qryNalBarterSD_NUM: TStringField;
    qryNalBarterAG_NAME: TStringField;
    qryNalBarterGZ_NAME_SHORT: TStringField;
    qryNalBarterPT_NAME: TStringField;
    qryNalBarterCU_NAME: TStringField;
    qryNalBarterCU_ID_COMPUND: TStringField;
    qryNalBarterSD_FACT_NUM: TIntegerField;
    qryNalBarterSD_SUM: TFloatField;
    qryNalBarterSD_SUM_PAYED: TFloatField;
    qryNalBarterSD_COMMENT: TStringField;
    qryNalBarterPODACHA_NUMS: TStringField;
    qryNalBarterSD_FACT_DATE: TSQLTimeStampField;
    qryNotApprovedSdelkasST_IS_CURRENT_ISSUE: TIntegerField;
    qrySdelkaCountSummary: TSQLQuery;
    qrySdelkaCountSummaryAG_NAME: TStringField;
    qrySdelkaCountSummaryAG_ID: TIntegerField;
    qrySdelkaCountSummarySD_COUNT: TIntegerField;
    qrySdelkaCountSummaryNEW_CUST_COUNT: TIntegerField;
    qrySdelkaCountSummaryNAL_SUM: TFloatField;
    qrySdelkaCountSummaryBEZNAL_SUM: TFloatField;
    qrySdelkaCountSummaryKREDIT_SUM: TFloatField;
    qrySdelkaCountSummaryBEZNAL_V_NAL_SUM: TFloatField;
    qrySdelkaCountSummaryKASA_SUM: TFloatField;
    qrySdelkaCountSummaryBARTER_COUNT: TIntegerField;
    qrySdelkaCountSummaryPAYED_BEZNAL: TFloatField;
    qrySdelkaCountSummaryPAYED_CREDIT: TFloatField;
    qrySdelkaCountSummaryPAYED_BEZNAL_V_NAL: TFloatField;
    qrySdelkaCountSummaryPAYED_KASA: TFloatField;
    qrySdelkaCountSummaryKA_COUNT: TIntegerField;
    qrySdelkaCountSummaryKA_SUM: TFloatField;
    qrySdelkaCountSummaryINET_COUNT: TIntegerField;
    qrySdelkaCountSummaryINET_SUM: TFloatField;
    qrySdelkaCountSummaryOTHER_CITY_COUNT: TIntegerField;
    qrySdelkaCountSummaryOTHER_CITY_SUM: TFloatField;
    qrySdelkaCountSummaryOBJAV_TEXT_COUNT: TIntegerField;
    qrySdelkaCountSummaryOBJAV_MODULE_COUNT: TIntegerField;
    qrySdelkaCountSummaryOBJAV_VIP_COUNT: TIntegerField;
    qrySdelkaCountSummaryAVG_SDELKA_COST: TFloatField;
    qrySdelkaCountSummaryAVG_PODACHA_COST: TFloatField;
    qrySdelkaCountSummarySUM_PRINES: TFloatField;
    qrySdelkaCountSummarySUM_PAYED: TFloatField;
    qrySdelkaCountSummary_PAY_BALANS: TFloatField;
    qrySdelkaCountSummaryAVG_VAC_COST: TFloatField;
    qrySdelkaCountSummaryTTL_VAC_COUNT: TIntegerField;
    qrySdelkaCountSummaryTTL_OBJAV_COST: TFloatField;
    qrySdelkaCountSummaryPAYED_OTHER_CITY_COUNT: TIntegerField;
    qrySdelkaCountSummaryPAYED_OTHER_CITY_SUM: TFloatField;
    qryNotApprovedSdelkasSD_STATE: TIntegerField;
    qrySdelkaZaPeriodSD_NUM: TStringField;
    qryZapasByTimeSD_NUM: TStringField;
    qryPayedBeznalByTimeSD_NUM: TStringField;
    qrySdelkaVNomerSD_NUM: TStringField;
    qryNotApprovedCoverSD_NUM: TStringField;
    qrySdelkaNotPayedSD_NUM: TStringField;
    qryInterceptionsSD_NUM: TStringField;
    qryNotApprovedSdelkasSD_NUM: TStringField;
    qryAttentionObjavsSD_NUM: TStringField;
    qrySdelkaCrossingMonth: TSQLQuery;
    qrySdelkaCrossingMonthAG_NAME: TStringField;
    qrySdelkaCrossingMonthCU_NAME: TStringField;
    qrySdelkaCrossingMonthCU_OKPO: TStringField;
    qrySdelkaCrossingMonthPT_NAME: TStringField;
    qrySdelkaCrossingMonthSD_FACT_NUM: TIntegerField;
    qrySdelkaCrossingMonthSD_FACT_DATE: TSQLTimeStampField;
    qrySdelkaCrossingMonthGZ_NAME_SHORT: TStringField;
    qrySdelkaCrossingMonthPODACHA_NUMS_INSIDE: TStringField;
    qrySdelkaCrossingMonthSD_SUM: TFloatField;
    qrySdelkaCrossingMonthSD_SUM_PAYED: TFloatField;
    qrySdelkaCrossingMonthSD_SUM_PART: TFloatField;
    qrySdelkaCountSummaryINET_PAYED_SUM: TFloatField;
    qryNotApprovedSdelkasSD_TYPE: TIntegerField;
    qrySdelkaNotPayedCU_OKPO: TStringField;
    qrySdelkaCountSummaryREG_COUNT: TIntegerField;
    qrySdelkaCountSummaryREG_SUM: TFloatField;
    qrySdelkaCountSummaryREG_PAYED_SUM: TFloatField;
    qryVIPModulesEXTENSION: TStringField;
    procedure qrySdelkaZaPeriodSD_COMMENTGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySdelkaVNomerSD_COMMENTGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryZapasByTimeSD_COMMENTGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySdelkaNotPayedSD_COMMENTGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySdelkaZaPeriodSD_NEW_CUSTGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryZarplataSD_COMMENTGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySdelkaZaPeriodCU_ID_COMPOUNDGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySdelkaObjavOB_TEXTGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryNotApprovedSdelkasRB_IS_LOCKABLEGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qrySdelkaCountSummary__PAY_BALANSGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryNotApprovedSdelkasST_IS_CURRENT_ISSUEGetText(
      Sender: TField; var Text: String; DisplayText: Boolean);
    procedure qrySdelkaCountSummary_PAY_BALANSGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    { Private declarations }
  public
    procedure Report_AllCust;

    // Итог недели по рубрикам
	procedure Report_RubrikaItog(userId: integer; allAgents: boolean; dtFrom, dtTo: TDateTime);
	function  Report_RubrikaItog_Strings(agid:integer; dtFrom, dtTo: TDateTime):TStringList;

    // Сделки в номер (ПР/НС)
	procedure Report_AgentByIssue(userId: integer; allAgents, oneWindow, printDoubles: boolean; gzid: integer; issId: integer; issName: String);
	function  Report_AgentByIssue_Strings(agid: integer; agname: string; gzid: integer; issId: integer; issName: String; printDoubles: boolean; var sd_cnt: integer):TStringList;

    // Сделки за период
	procedure Report_SdelkaByPeriod(userId: integer; allAgents, oneWindow: boolean; dtFrom, dtTo: TDateTime);
	function  Report_SdelkaByPeriod_Strings(agid: integer; agname: string; dtFrom, dtTo: TDateTime; var lstItog:TStringList):TStringList;

    // Финансовый отчёт за период
	procedure Report_Finansy(userId: integer; dtFrom, dtTo: TDateTime);

	// Оплаченный безнал/кредит за период
	procedure Report_PayedBeznal(userId: integer; allAgents: boolean; dtFrom, dtTo: TDateTime);
	function  Report_PayedBeznal_Strings(agid: integer; agname: string; dtFrom, dtTo: TDateTime):TStringList;

    // Пересечения
	procedure Report_Interceptions;

    // Неподтверждённые сделки
	procedure Report_NotApprovedSdelkas(userId, gz_id: integer; allAgents: boolean);
	function  Report_NotApprovedSdelkas_Strings(agid, gz_id: integer; agname: String; out s:double):TStringList;

  procedure PreviewRave(APictureField: TBLOBField; ASdelka, AAgent, ACust, AFormat, ARubrika, ACorelPage, AIssue, Extension: String);
  end;

var
  repData: TrepData;



implementation

uses dm, htmlReport, StdCtrls, ModuleReportParamsForm, dmCache, GraphicEx, Graphics, RvClass, RvCsStd, RvCsData, Controls;

{$R *.dfm}

procedure TrepData.PreviewRave(APictureField: TBLOBField; ASdelka,
  AAgent, ACust, AFormat, ARubrika, ACorelPage, AIssue, Extension: String);

var TmpRaveComp, img, imgZoom: TRaveComponent;
    pic: TPicture;
    o,p : integer;
begin
  cacheData.rvpRepAcc.SelectReport('mdPrint', false);

	if (frmModuleReportParams.ShowModal <> mrOk) then exit;


  if frmModuleReportParams.rgbFormat.ItemIndex = 0 then
     cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage.PaperSize := 11
  else
     cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage.PaperSize := 9;


  img := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('imgModule', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);
  imgZoom := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('imgModuleZoom', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);

  if (img <> nil) then
  begin
      if frmModuleReportParams.cbActualSize.Checked then
      begin
          o := 1;// StrToInt(LeftStr(s, pos(',',s) - 1));
          p := 300; //StrToInt(RightStr(s, length(s) - pos(',', s)));

          pic := TPicture.Create;
//  ToDo: В связи с изменением формата хранения картинок нужно
//  заменить эту процедуру
          PictureFromCompressedFieldNew(pic, APictureField, extension, false);

          TRaveBitmap(img).Image.Assign(Pic);

          TRaveBitmap(img).Width  := o * TRaveBitmap(img).Image.Width / p;
	 	      TRaveBitmap(img).Height := o * TRaveBitmap(img).Image.Height / p;

          FreeAndNil(pic)
      end
      else begin
          TRaveBitmap(img).Width  := 0;
          TRaveBitmap(img).Height := 0;
      end;
  end;

  if imgZoom <> nil then
  begin
      if frmModuleReportParams.cbZoomed.Checked then
      begin
          o := 1;
          p := 150;

          pic := TPicture.Create;
//  ToDo: В связи с изменением формата хранения картинок нужно
//  заменить эту процедуру
          PictureFromCompressedFieldNew(pic, APictureField, extension, false);

          TRaveBitmap(imgZoom).Image.Assign(pic);

          if frmModuleReportParams.cbActualSize.Checked then
              TRaveBitmap(imgZoom).Top := TRaveBitmap(img).Bottom + 0.05
          else
              TRaveBitmap(imgZoom).Top := TRaveBitmap(img).Top;

          TRaveBitmap(imgZoom).Width  := o * TRaveBitmap(imgZoom).Image.Width / p;
	 	      TRaveBitmap(imgZoom).Height := o * TRaveBitmap(imgZoom).Image.Height / p;

          FreeAndNil(pic);
      end
      else begin
          TRaveBitmap(imgZoom).Width  := 0;
          TRaveBitmap(imgZoom).Height := 0;
      end;
  end;

  TmpRaveComp := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('txtSD_NUM', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);
  if (TmpRaveComp <> nil) and (TmpRaveComp is TRaveText)  then TRaveText(TmpRaveComp).Text := ASdelka;

  TmpRaveComp := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('txtIS', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);
  if (TmpRaveComp <> nil) and (TmpRaveComp is TRaveText)  then TRaveText(TmpRaveComp).Text := AIssue;

  TmpRaveComp := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('txtRub', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);
  if (TmpRaveComp <> nil) and (TmpRaveComp is TRaveText)  then TRaveText(TmpRaveComp).Text := ARubrika;

  TmpRaveComp := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('txtPage', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);
  if (TmpRaveComp <> nil) and (TmpRaveComp is TRaveText)  then TRaveText(TmpRaveComp).Text := ACorelPage;

  TmpRaveComp := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('txtAG', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);
  if (TmpRaveComp <> nil) and (TmpRaveComp is TRaveText)  then TRaveText(TmpRaveComp).Text := AAgent;

  TmpRaveComp := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('txtCL', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);
  if (TmpRaveComp <> nil) and (TmpRaveComp is TRaveText)  then TRaveText(TmpRaveComp).Text := ACust;

  TmpRaveComp := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('txtFT', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);
  if (TmpRaveComp <> nil) and (TmpRaveComp is TRaveText)  then TRaveText(TmpRaveComp).Text := AFormat;

  cacheData.rvpRepAcc.Execute;
end;

procedure TrepData.qrySdelkaZaPeriodSD_COMMENTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	Text := Sender.AsString;
end;

procedure TrepData.qrySdelkaVNomerSD_COMMENTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	Text := Sender.AsString;
end;

procedure TrepData.qryZapasByTimeSD_COMMENTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	Text := Sender.AsString;
end;

procedure TrepData.qrySdelkaNotPayedSD_COMMENTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	Text := Sender.AsString;
end;

procedure TrepData.qrySdelkaZaPeriodSD_NEW_CUSTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	if (Sender.Value = 1) then
		Text := 'N'
	else
		Text := '';
end;

procedure TrepData.qryZarplataSD_COMMENTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	Text := Sender.AsString;
end;

procedure TrepData.qrySdelkaZaPeriodCU_ID_COMPOUNDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	Text := '<nobr>' + Sender.AsString + '</nobr>';
end;

procedure TrepData.qrySdelkaObjavOB_TEXTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
    Text := Sender.AsString;
end;

procedure TrepData.Report_AllCust;
var
	qry: TSQLQuery;
	rep: THtmlReport;
begin
	qry := qryAllCust;
	if (qry.Active) then qry.Close();

	qry.ParamByName('AG_ID').AsInteger := data.cdsAgentAG_ID.Value;

	qry.Open();

	rep := THtmlReport.Create();
	rep.TempName := 'PrInfo-agent-cust';
	rep.Add('<HTML><HEAD><TITLE>Клиенты агента</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');
	rep.Add('<CENTER><B>Клиенты агента</B></CENTER>');

	rep.Add(getTableHeader(qry, 13));

	qry.First();
	while (not qry.Eof) do
	begin
		rep.Add(getTableRow(qry, 13, nil));
		qry.Next();
	end;

	rep.Add('</TABLE>');

	qry.Close();

	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;

procedure TrepData.Report_RubrikaItog(userId: integer; allAgents: boolean; dtFrom, dtTo: TDateTime);
var
	rep: THtmlReport;
  res:TStringList;
begin
	rep := THtmlReport.Create();
	rep.TempName := 'PrInfo-rubrika-itog-by-date';
	rep.Add('<HTML><HEAD><TITLE>Итог по рубрикам/клиентам за период с '
            + DateTimeToStr(dtFrom) + ' до ' + DateTimetoStr(dtTo)
            + '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY><CENTER>');

	if (allAgents) then
	with data do
	begin
		if (qryCurrentUserRights.Active) then qryCurrentUserRights.Close();
		qryCurrentUserRights.DataSet.ParamByName('US_ID').AsInteger := userId;
		qryCurrentUserRights.Open;

		qryCurrentUserRights.First();
		while (not qryCurrentUserRights.Eof) do
		begin
      res := Report_RubrikaItog_Strings(qryCurrentUserRightsAG_ID.Value, dtFrom, dtTo);

      if res.Count > 0 then
      begin
  			rep.Add('<H1>' + qryCurrentUserRightsAG_NAME.AsString + '</H1>');
	  		rep.AddStrings(res);
      end;

			qryCurrentUserRights.Next();
		end;
	end
	else
	begin
		rep.Add('<H1>' + data.cdsAgentAG_NAME.AsString + '</H1>');
		rep.AddStrings(Report_RubrikaItog_Strings(data.cdsAgentAG_ID.Value, dtFrom, dtTo));
	end;

	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;


function TrepData.Report_RubrikaItog_Strings(agid: integer; dtFrom, dtTo: TDateTime): TStringList;
var qry:TSQLQuery;
begin
	qry := qryRubrikaItog;
	if (qry.Active) then qry.Close();

	qry.ParamByName('AG_ID').AsInteger    := agid;
	qry.ParamByName('DATE_FROM').AsString := DateTimeToStr(dtFrom);
	qry.ParamByName('DATE_TO').AsString   := DateTimeToStr(dtTo);

	qry.Open();
  if qry.IsEmpty then
  begin
      result := TStringList.Create;
      exit;
  end;

	Result := TStringList.Create;

	Result.Add(getTableHeader(qry, 13));

	qry.First();
	while (not qry.Eof) do
	begin
		Result.Add(getTableRow(qry, 13, nil));
		qry.Next();
	end;

	Result.Add('</TABLE>');
end;

function TrepData.Report_AgentByIssue_Strings(agid: integer; agname: string; gzid: integer; issId: integer; issName: String; printDoubles: boolean; var sd_cnt: integer):TStringList;
var
	rep: TStringList;
	qry: TSQLQuery;
	iss: String;
	colCount, i: integer;
begin
	sd_cnt := 0;

	qry := repData.qrySdelkaVNomer;

	if (qry.Active) then qry.Close();
	qry.Params.ParamByName('AG_ID').AsInteger := agid;
	qry.Params.ParamByName('GZ_ID').AsInteger := gzid;
	qry.Params.ParamByName('IS_ID').AsInteger := issId;
	iss := issName;
	
{	if (gzid = 1) then
	begin
		qry.Params.ParamByName('IS_ID').AsInteger := issId;
		iss := issName;
	end else
	if (gzid = 2) then
	begin
		qry.ParamByName('IS_ID').AsInteger := issId;
		iss := issName;
	end;}
	qry.Open();
  if qry.IsEmpty then
  begin
      result := TStringList.Create;
      exit;
  end;

	if (printDoubles) then
		if (not repData.qrySdelkaObjav.Active) then
			repData.qrySdelkaObjav.Open;

	if (not printDoubles) then
		if (repData.qrySdelkaObjav.Active) then
			repData.qrySdelkaObjav.Close;

	rep := TStringList.Create();

	colCount := 0;
	for i := 0 to qry.FieldCount - 1 do
		if (qry.Fields[i].Visible) then inc(colCount);

	if (not qry.IsEmpty()) then
	begin
		rep.Add('<CENTER><B>Сделки агента ' + agname + ' в номер ' + iss + '</B></CENTER>');

		rep.Add(getTableHeader(qry, 13));

		qry.First();
		while (not qry.Eof) do
		begin
			rep.Add(getTableRow(qry, 13, nil));
			if (printDoubles and(not repData.qrySdelkaObjav.IsEmpty)) then
			begin
//				rep.Add('<TR><TD COLSPAN='+IntToStr(colCount)+'><TABLE CELLSPACING=0 CELLPADDING=2 STYLE="border: 1px solid black" ALIGN=LEFT>');
				rep.Add('<TR><TD COLSPAN=' + IntToStr(colCount) + ' ALIGN=LEFT><DIV ALIGN=LEFT>');
				rep.Add(getTableHeader(repData.qrySdelkaObjav, 13));
				repData.qrySdelkaObjav.First;
				while (not repData.qrySdelkaObjav.Eof) do
				begin
					rep.Add(getTableRow(repData.qrySdelkaObjav, 13, nil));
					repData.qrySdelkaObjav.Next;
				end;
				rep.Add('</TABLE></DIV></TD></TR>');
			end;

			// подсчитаем итоговые цифры
			inc(sd_cnt);	  // всего сделок

			qry.Next();
		end;

		rep.Add('</TABLE>');

		rep.Add('<B>Итог:</B><BR>');
		rep.Add('Всего сделок: ' + IntToStr(sd_cnt) + '<BR>');
	end;

	Result := rep;
	qry.Close();
end;


procedure TrepData.Report_AgentByIssue(userId: integer; allAgents, oneWindow, printDoubles: boolean; gzid: integer; issId: integer; issName: String);
var
	rep: THtmlReport;
	oneRep: TStringList;
	sd_cnt, sd_cntTotal: integer;
begin
	rep := nil;
	sd_cntTotal := 0;

	if (oneWindow) then
	begin
		rep := THtmlReport.Create();
		rep.TempName := 'PrInfo-agent-rep-by-isssue';
		rep.Add('<HTML><HEAD><TITLE>Сделки в номер ' + issName
				+ '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
		rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');
	end;


	if (allAgents) then
	with data do
	begin
		if (qryCurrentUserRights.Active) then qryCurrentUserRights.Close();
		qryCurrentUserRights.DataSet.ParamByName('US_ID').AsInteger := userId;//currentUser;
		qryCurrentUserRights.Open;

		qryCurrentUserRights.First();
		while (not qryCurrentUserRights.Eof) do
		begin
			if ( not oneWindow) then
			begin
				rep := THtmlReport.Create();
				rep.TempName := 'PrInfo-agent-rep-by-isssue';
				rep.Add('<HTML><HEAD><TITLE>Сделки в номер ' + issName
                        + '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
				rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');
			end;

			oneRep := Report_AgentByIssue_Strings(qryCurrentUserRightsAG_ID.Value,
                                                  qryCurrentUserRightsAG_NAME.Value,
                                                  gzid,
                                                  issId,
                                                  issName,
                                                  printDoubles,
                                                  sd_cnt);
			if (oneRep.Count > 0) then
			begin
				rep.AddStrings(oneRep);
				sd_cntTotal := sd_cntTotal + sd_cnt;

				if ( not oneWindow) then
				begin
					rep.Add('</BODY></HTML>');
					rep.OpenInBrowser();
					rep.Free();
				end;
			end;

			qryCurrentUserRights.Next();
      FreeAndNil(oneRep);
		end;
	end
	else
	begin
		if ( not oneWindow) then
		begin
			rep := THtmlReport.Create();
			rep.TempName := 'PrInfo-agent-rep-by-isssue';
			rep.Add('<HTML><HEAD><TITLE>Сделки в номер ' + issName
                    + '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
			rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');
		end;

    oneRep := Report_AgentByIssue_Strings(data.cdsAgentAG_ID.Value,
        										   data.cdsAgentAG_NAME.Value,
                                                   gzid,
                                                   issId,
                                                   issName,
                                                   printDoubles,
                                                   sd_cnt);
		rep.AddStrings(oneRep);

		if ( not oneWindow) then
		begin
			rep.Add('</BODY></HTML>');
			rep.OpenInBrowser();
			rep.Free();
		end;

    FreeAndNil(oneRep);
	end;

	if (oneWindow) then
	begin
		rep.Add('</BODY></HTML>');
		rep.OpenInBrowser();
		rep.Free();
	end;

	if (allAgents) then
		ShowMessage(format('Общее количество сделок в номер: %d',[sd_cntTotal]));
end;

procedure TrepData.Report_SdelkaByPeriod(userId: integer; allAgents, oneWindow: boolean; dtFrom, dtTo: TDateTime);
var
	rep:	 THtmlReport;
	res,lstItog: TStringList;
begin
	rep 	:= nil;
	lstItog := TStringList.Create();

	if (oneWindow) then
	begin
		rep := THtmlReport.Create();
		rep.TempName := 'PrInfo-agent-rep';
		rep.Add('<HTML><HEAD><TITLE>Сделки за период с ' + DateToStr(dtFrom) + ' до ' + DateToStr(dtTo)
				+ '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
		rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');
	end;

	if (allAgents) then
	with data do
	begin
		if (qryCurrentUserRights.Active) then
			qryCurrentUserRights.Close();
		qryCurrentUserRights.DataSet.ParamByName('US_ID').AsInteger := userId;
		qryCurrentUserRights.Open;

		qryCurrentUserRights.First();
		lstItog.Add('<BR><BR><B>Итог:</B>');
		lstItog.Add('<TABLE STYLE="border: 1px solid black"><TR STYLE="background-color: #CCCCCC; font-weight: bold;"><TD>Агент</TD>');
		lstItog.Add('<TD>Сделок</TD><TD>Сделок ПР</TD><TD>Сделок НС</TD><TD>Сделок СТ</TD><TD>Сделок КА</TD><TD>Сделок Интернет</TD>');
		lstItog.Add('<TD>Площадь в ПР</TD><TD>Площадь в НС</TD><TD>Площадь в СТ</TD>');
		lstItog.Add('<TD>Макс. сумма ПР</TD><TD>Макс. сумма СТ</TD><TD>Макс. площ. под. ПР</TD><TD>Макс. площ. под. СТ</TD>');
		lstItog.Add('<TD>Сумма в КА</TD><TD>Сумма в интернет</TD><TD>Сумма в СТ</TD><TD>Новых клиентов ПР</TD><TD>Новых клиентов СТ</TD>');
		lstItog.Add('<TD>Ср. стоимость сделки ПР</TD><TD>Ср. стоимость сделки СТ</TD><TD>Ср. стоимость подачи ПР</TD><TD>Ср. стоимость подачи СТ</TD></TR>');
		while (not qryCurrentUserRights.Eof) do
		begin
			if ( not oneWindow) then
			begin
				rep := THtmlReport.Create();
				rep.TempName := 'PrInfo-agent-rep';
				rep.Add('<HTML><HEAD><TITLE>Сделки за период с ' + DateToStr(dtFrom) + ' до ' + DateToStr(dtTo)
						+ '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
				rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');
			end;

      res := Report_SdelkaByPeriod_Strings(qryCurrentUserRightsAG_ID.Value,
														 qryCurrentUserRightsAG_NAME.Value,
														 dtFrom,
														 dtTo,
														 lstItog);

			rep.AddStrings(res);

			if ( not oneWindow) then
			begin
				rep.Add('</BODY></HTML>');
				rep.OpenInBrowser();
				rep.Free();
			end;

			qryCurrentUserRights.Next();

      FreeAndNil(res);
		end;
	end
	else
	begin
		if ( not oneWindow) then
		begin
			rep := THtmlReport.Create();
			rep.TempName := 'PrInfo-agent-rep';
			rep.Add('<HTML><HEAD><TITLE>Сделки за период с ' + DateToStr(dtFrom) + ' до ' + DateToStr(dtTo)
					+ '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
			rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');
		end;

    res := Report_SdelkaByPeriod_Strings(data.cdsAgentAG_ID.Value,
													 data.cdsAgentAG_NAME.Value,
													 dtFrom,
													 dtTo,
													 lstItog);
		rep.AddStrings(res);

		if ( not oneWindow) then
		begin
			rep.Add('</BODY></HTML>');
			rep.OpenInBrowser();
			rep.Free();
		end;

    FreeAndNil(res);
	end;

	if (allAgents) then
	begin
		if ( not oneWindow) then
		begin
			rep := THtmlReport.Create();
			rep.TempName := 'PrInfo-agent-rep';
			rep.Add('<HTML><HEAD><TITLE>Сделки за период с ' + DateToStr(dtFrom) + ' до ' + DateToStr(dtTo)
					+ '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
			rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');
		end;

		rep.AddStrings(lstItog);
		rep.Add('</TABLE>');

		if ( not oneWindow) then
		begin
			rep.Add('</BODY></HTML>');
			rep.OpenInBrowser();
			rep.Free();
		end;
	end;

	if (oneWindow) then
	begin
		rep.Add('</BODY></HTML>');
		rep.OpenInBrowser();
		rep.Free();
	end;
end;

function TrepData.Report_SdelkaByPeriod_Strings(agid: integer; agname: string; dtFrom, dtTo: TDateTime; var lstItog:TStringList):TStringList;
var
	ColumnCount: integer;
	i: integer;

	rep:     TStringList;
	kaRep:   TStringList;
	inetRep: TStringList;
	otherCityRep: TStringList;
	currRep: TStringList;
	qry:     TSQLQuery;
	kaWas:   boolean;
	inetWas: boolean;

//	sdelka_cost_total:	real;		// общ. стоимость сделки

// итоговые цифры
	sd_cnt:				integer;	// всего сделок
	sd_cnt_pr:			integer;	// всего сделок ПР
	sd_cnt_ns:			integer;	// всего сделок НС
	sd_cnt_st:			integer;	// всего сделок СТ
	sd_cnt_ka:			integer;	// всего сделок КА
	sd_cnt_int:			integer;	// всего сделок Интернет

	s_sum_pr:			real;		// площадь в ПР
	s_sum_ns:			real; 		// площадь в НС
	s_sum_st:			real;		// площадь в СТ

	max_money_pr:		real; 		// макс. сумма сделки ПР
	max_money_pr_sd:	String;		// сделка ПР, где ^^^
	max_money_st:		real; 		// макс. сумма сделки СТ
	max_money_st_sd:	String;		// сделка СТ, где ^^^

	max_s_pr:			real;		// макс. площадь ПР
	max_s_pr_sd:		String;		// сделка ПР, где ^^^
	max_s_st:			real;		// макс. площадь СТ
	max_s_st_sd:		String;		// сделка СТ, где ^^^

	money_sum_ka:		real;		// всего денег в КА
	money_sum_inet:		real;		// всего денег в интернет
	money_sum_st:		real;		// всего денег в СТ

	new_cnt_pr:			integer;	// новых клиентов ПР
	new_cnt_st:			integer;	// новых клиентов СТ

	podacha_cost_pr:	real;		// ср. стоимость подачи ПР
	podacha_cost_st:	real;		// ср. стоимость подачи СТ

	sdelka_cost_pr:		real;		// ср. стоимость сделки ПР
	sdelka_cost_st:		real;		// ср. стоимость сделки СТ

const
	NS_RUBRIKA_ID:	integer = 20;

begin
	sd_cnt			:= 0;	// всего сделок
	sd_cnt_pr		:= 0;	// всего сделок ПР
	sd_cnt_ns		:= 0;	// всего сделок НС
	sd_cnt_st		:= 0;	// всего сделок СТ
	sd_cnt_ka		:= 0;	// всего сделок КА
	sd_cnt_int		:= 0;	// всего сделок Интернет

	s_sum_pr		:= 0;   // площадь в ПР
	s_sum_ns		:= 0;	// площадь в НС
	s_sum_st		:= 0;	// площадь в СТ

	max_money_pr 	:= 0;  	// макс. сумма сделки ПР
	max_money_pr_sd	:= '';	// сделка ПР, где ^^^
	max_money_st 	:= 0;  	// макс. сумма сделки СТ
	max_money_st_sd	:= '';	// сделка СТ, где ^^^

	max_s_pr 		:= 0;	// макс. площадь ПР
	max_s_pr_sd		:= '';	// сделка ПР, где ^^^
	max_s_st 		:= 0;	// макс. площадь СТ
	max_s_st_sd		:= '';	// сделка СТ, где ^^^

	money_sum_ka	:= 0;	// всего денег в КА
	money_sum_inet	:= 0;	// всего денег в интернет
	money_sum_st	:= 0;	// всего денег в СТ

	new_cnt_pr		:= 0;	// новых клиентов ПР
	new_cnt_st		:= 0;	// новых клиентов СТ

	podacha_cost_pr	:= 0;	// ср. стоимость подачи ПР
	podacha_cost_st	:= 0;	// ср. стоимость подачи СТ

	sdelka_cost_pr	:= 0;	// ср. стоимость сделок ПР
	sdelka_cost_st	:= 0;	// ср. стоимость сделок СТ

	qry := repData.qrySdelkaZaPeriod;
	if (qry.Active) then qry.Close();
	qry.ParamByName('DATE_FROM').AsDate := dtFrom;
	qry.ParamByName('DATE_TO').AsDate	:= dtTo;
	qry.ParamByName('AG_ID').AsInteger	:= agid;
	qry.Open();

  if qry.IsEmpty then
  begin
   result := TStringList.Create;
   exit;
  end;

	rep   	:= TStringList.Create();
	kaRep 	:= TStringList.Create();
	inetRep	:= TStringList.Create();
	otherCityRep := TStringList.Create();
	rep.Add('<CENTER><B>Сделки агента ' + agname + ' за период с ' + DateToStr(dtFrom)
			+ ' до ' + DateToStr(dtTo) + '</B></CENTER>');

	rep.Add('<B>Сделки в газету</B>');
	rep.Add(getTableHeader(qry,SD_TYPE_KA));

	kaRep.Add('<BR><B>Сделки в КА</B>');
	kaRep.Add(getTableHeader(qry,SD_TYPE_GAZETA));
	kaWas := false;

	inetRep.Add('<BR><B>Сделки в интернет</B>');
	inetRep.Add(getTableHeader(qry,SD_TYPE_GAZETA));
	inetWas := false;

	qry.First();

	ColumnCount := 0;
	for i:=0 to qry.FieldCount-1 do
		if qry.Fields[i].Visible then
			inc(ColumnCount);

	while (not qry.Eof) do
	begin
		if (qry.FieldByName('SD_TYPE').Value = SD_TYPE_KA) then
		begin
			kaWas   := true;
			currRep := kaRep;
			currRep.Add(getTableRow(qry,SD_TYPE_GAZETA,nil));
		end
		else if (qry.FieldByName('SD_TYPE').Value = SD_TYPE_INTERNET) then
		begin
			inetWas := true;
			currRep := inetRep;
			currRep.Add(getTableRow(qry,SD_TYPE_GAZETA,nil));
		end
		else
		begin
			currRep := rep;
			currRep.Add(getTableRow(qry,SD_TYPE_KA,nil));
		end;

		// строчка с номерами телефонов клиента
		currRep.Add('<TR><TD ALIGN=RIGHT COLSPAN=' + IntToStr(ColumnCount) + '>' + qry.FieldByName('SDELKA_ALL_PHONES').AsString + '</TD></TR>');

// подсчитаем итоговые цифры
		inc(sd_cnt);											   							// всего сделок

		if (    (qry.FieldByName('SD_TYPE').AsInteger = SD_TYPE_GAZETA)
			and (qry.FieldByName('GZ_ID').AsInteger = GZ_PR)) then
		begin
			inc(sd_cnt_pr);
			sdelka_cost_pr := sdelka_cost_pr + qry.FieldByName('SD_SUM').Value;				// общ. стоимость сделок ПР
		end;

		if (    (qry.FieldByName('SD_TYPE').AsInteger = SD_TYPE_GAZETA)
			and (qry.FieldByName('GZ_ID').AsInteger = GZ_NS)) then
		begin
			inc(sd_cnt_ns);																	// всего сделок НС
		end;

		if (    (qry.FieldByName('SD_TYPE').AsInteger = SD_TYPE_GAZETA)
			and (qry.FieldByName('GZ_ID').AsInteger = GZ_ST)) then
		begin
			inc(sd_cnt_st);
			sdelka_cost_st := sdelka_cost_st + qry.FieldByName('SD_SUM').Value;				// общ. стоимость сделок СТ
		end;

		if (qry.FieldByName('SD_TYPE').AsInteger = SD_TYPE_KA) then
		begin
			inc(sd_cnt_ka);																	// всего сделок КА
		end;

		if (qry.FieldByName('SD_TYPE').AsInteger = SD_TYPE_INTERNET) then
		begin
			inc(sd_cnt_int);																// всего сделок Интернет
		end;

		if (qry.FieldByName('GZ_ID').Value = GZ_PR) then
				s_sum_pr	:= s_sum_pr + qry.FieldByName('SDELKA_SPACE').Value				// площадь в ПР
		else if (qry.FieldByName('GZ_ID').Value = GZ_NS) then
				s_sum_ns	:= s_sum_ns + qry.FieldByName('SDELKA_SPACE').Value				// площадь в НС
		else if (qry.FieldByName('GZ_ID').Value = GZ_ST) then
				s_sum_st	:= s_sum_st + qry.FieldByName('SDELKA_SPACE').Value;			// площадь в СТ


		if (    (qry.FieldByName('SD_TYPE').AsInteger = SD_TYPE_GAZETA)
			and (qry.FieldByName('GZ_ID').AsInteger = GZ_PR)
			and (qry.FieldByName('SD_SUM').Value > max_money_pr)) then
		begin
			max_money_pr	:= qry.FieldByName('SD_SUM').Value;								// макс. сумма сделки ПР
			max_money_pr_sd	:= qry.FieldByName('SD_ID_COMPOUND').Value;
		end;

		if (    (qry.FieldByName('SD_TYPE').AsInteger = SD_TYPE_GAZETA)
			and (qry.FieldByName('GZ_ID').AsInteger = GZ_ST)
			and (qry.FieldByName('SD_SUM').Value > max_money_st)) then
		begin
			max_money_st	:= qry.FieldByName('SD_SUM').Value;					  			// макс. сумма сделки СТ
			max_money_st_sd	:= qry.FieldByName('SD_ID_COMPOUND').Value;
		end;

		if (    (qry.FieldByName('SD_TYPE').Value = SD_TYPE_GAZETA)
			and (qry.FieldByName('GZ_ID').AsInteger = GZ_PR)
			and (qry.FieldByName('ONE_PODACHA_SPACE').Value > max_s_pr)) then
		begin
			max_s_pr		:= qry.FieldByName('ONE_PODACHA_SPACE').Value;					// макс. площадь ПР
			max_s_pr_sd		:= qry.FieldByName('SD_ID_COMPOUND').Value;
		end;

		if (    (qry.FieldByName('SD_TYPE').Value = SD_TYPE_GAZETA)
			and (qry.FieldByName('GZ_ID').AsInteger = GZ_ST)
			and (qry.FieldByName('ONE_PODACHA_SPACE').Value > max_s_st)) then
		begin
			max_s_st		:= qry.FieldByName('ONE_PODACHA_SPACE').Value;					// макс. площадь СТ
			max_s_st_sd		:= qry.FieldByName('SD_ID_COMPOUND').Value;
		end;

		if (qry.FieldByName('SD_TYPE').Value = SD_TYPE_KA) then
			money_sum_ka 	:= money_sum_ka + qry.FieldByName('SD_SUM').Value;				// всего денег в КА

		if (qry.FieldByName('SD_TYPE').Value = SD_TYPE_INTERNET) then
			money_sum_inet 	:= money_sum_inet + qry.FieldByName('SD_SUM').Value;			// всего денег в интернет

		if (qry.FieldByName('GZ_ID').Value = GZ_ST) then
			money_sum_st 	:= money_sum_st + qry.FieldByName('SD_SUM').Value;				// всего денег в СТ

		if (    (qry.FieldByName('SD_TYPE').Value = SD_TYPE_GAZETA)
			and (qry.FieldByName('GZ_ID').AsInteger = GZ_ST)
			and (qry.FieldByName('SD_NEW_CUST').Value = 1)) then
		begin
			inc(new_cnt_pr);																// новых клиентов ПР
		end;

		if (    (qry.FieldByName('SD_TYPE').Value = SD_TYPE_GAZETA)
			and (qry.FieldByName('GZ_ID').AsInteger = GZ_ST)
			and (qry.FieldByName('SD_NEW_CUST').Value = 1)) then
		begin
			inc(new_cnt_st);												  				// новых клиентов СТ
		end;

		if (    (qry.FieldByName('SD_TYPE').AsInteger = SD_TYPE_GAZETA)
			and (qry.FieldByName('GZ_ID').AsInteger = GZ_PR)) then
		begin
			if (qry.FieldByName('PODACHA_COUNT').AsInteger <> 0) then
				podacha_cost_pr := podacha_cost_pr + qry.FieldByName('SD_SUM').AsFloat / qry.FieldByName('PODACHA_COUNT').AsInteger
			else
				podacha_cost_pr := podacha_cost_pr + qry.FieldByName('SD_SUM').AsFloat;
		end;

		if (    (qry.FieldByName('SD_TYPE').AsInteger = SD_TYPE_GAZETA)
			and (qry.FieldByName('GZ_ID').AsInteger = GZ_ST)) then
		begin
			if (qry.FieldByName('PODACHA_COUNT').AsInteger <> 0) then
				podacha_cost_st := podacha_cost_st + qry.FieldByName('SD_SUM').AsFloat / qry.FieldByName('PODACHA_COUNT').AsInteger
			else
				podacha_cost_st := podacha_cost_st + qry.FieldByName('SD_SUM').AsFloat;
		end;

		qry.Next();
	end;

	if (sd_cnt_pr <> 0) then
	begin
		podacha_cost_pr := podacha_cost_pr / sd_cnt_pr;
		sdelka_cost_pr  := sdelka_cost_pr / sd_cnt_pr;
	end
	else
	begin
		podacha_cost_pr := 0;
		sdelka_cost_pr  := 0;
	end;

	if (sd_cnt_st <> 0) then
	begin
		podacha_cost_st := podacha_cost_st / sd_cnt_st;
		sdelka_cost_st  := sdelka_cost_st / sd_cnt_st;
	end
	else
	begin
		podacha_cost_st := 0;
		sdelka_cost_st  := 0;
	end;

	rep.Add('</TABLE>');
	kaRep.Add('</TABLE>');
	inetRep.Add('</TABLE>');

	if (kaWas) then rep.AddStrings(kaRep);
	if (inetWas) then rep.AddStrings(inetRep);

	rep.Add('<B>Итог:</B><BR>');
	lstItog.Add('<TR><TD>' 							+ agname + '</TD>');
	rep.Add('Всего сделок: '						+ IntToStr(sd_cnt) + '<BR>');
	lstItog.Add('<TD>'								+ IntToStr(sd_cnt) + '</TD>');
	rep.Add('Сделок ПР: '							+ IntToStr(sd_cnt_pr) + '<BR>');
	lstItog.Add('<TD>'								+ IntToStr(sd_cnt_pr) + '</TD>');
	rep.Add('Сделок НС: '							+ IntToStr(sd_cnt_ns) + '<BR>');
	lstItog.Add('<TD>'								+ IntToStr(sd_cnt_ns) + '</TD>');
	rep.Add('Сделок СТ: '							+ IntToStr(sd_cnt_st) + '<BR>');
	lstItog.Add('<TD>'								+ IntToStr(sd_cnt_st) + '</TD>');
	rep.Add('Сделок КА: '							+ IntToStr(sd_cnt_ka) + '<BR>');
	lstItog.Add('<TD>'								+ IntToStr(sd_cnt_ka) + '</TD>');
	rep.Add('Сделок Интернет: '						+ IntToStr(sd_cnt_int) + '<BR>');
	lstItog.Add('<TD>'								+ IntToStr(sd_cnt_int) + '</TD>');
	rep.Add('<BR>');



	rep.Add('Площадь в ПР: '						+ format('%.2f',[s_sum_pr]) + '<BR>');
	lstItog.Add('<TD>'								+ format('%.2f',[s_sum_pr]) + '</TD>');
	rep.Add('Площадь в НС: '						+ format('%.2f',[s_sum_ns]) + '<BR>');
	lstItog.Add('<TD>'								+ format('%.2f',[s_sum_ns]) + '</TD>');
	rep.Add('Площадь в СТ: '						+ format('%.2f',[s_sum_st]) + '<BR>');
	rep.Add('<BR>');
	lstItog.Add('<TD>'								+ format('%.2f',[s_sum_st]) + '</TD>');

	rep.Add('Максимальная сумма сделки ПР: '		+ format('%.2f (%s)',[max_money_pr,max_money_pr_sd]) + '<BR>');
	lstItog.Add('<TD>'								+ format('%.2f (%s)',[max_money_pr,max_money_pr_sd]) + '</TD>');
	rep.Add('Максимальная сумма сделки СТ: '		+ format('%.2f (%s)',[max_money_st,max_money_st_sd]) + '<BR>');
	lstItog.Add('<TD>'								+ format('%.2f (%s)',[max_money_st,max_money_st_sd]) + '</TD>');
	rep.Add('Максимальная площадь одной подачи ПР: '+ format('%.2f (%s)',[max_s_pr,max_s_pr_sd]) + '<BR>');
	lstItog.Add('<TD>'								+ format('%.2f (%s)',[max_s_pr,max_s_pr_sd]) + '</TD>');
	rep.Add('Максимальная площадь одной подачи СТ: '+ format('%.2f (%s)',[max_s_st,max_s_st_sd]) + '<BR>');
	rep.Add('<BR>');
	lstItog.Add('<TD>'								+ format('%.2f (%s)',[max_s_st,max_s_st_sd]) + '</TD>');

	rep.Add('Общая сумма сделок в КА: '				+ format('%.2f',[money_sum_ka]) + '<BR>');
	lstItog.Add('<TD>'								+ format('%.2f',[money_sum_ka]) + '</TD>');
	rep.Add('Общая сумма сделок в интернет: '		+ format('%.2f',[money_sum_inet]) + '<BR>');
	lstItog.Add('<TD>'								+ format('%.2f',[money_sum_inet]) + '</TD>');
	rep.Add('Общая сумма сделок в СТ: '				+ format('%.2f',[money_sum_st]) + '<BR>');
	rep.Add('<BR>');
	lstItog.Add('<TD>'								+ format('%.2f',[money_sum_st]) + '</TD>');

	rep.Add('Новых клиентов ПР: '					+ IntToStr(new_cnt_pr) + '<BR>');
	lstItog.Add('<TD>'								+ IntToStr(new_cnt_pr) + '</TD>');
	rep.Add('Новых клиентов СТ: '					+ IntToStr(new_cnt_st) + '<BR>');
	rep.Add('<BR>');
	lstItog.Add('<TD>'								+ IntToStr(new_cnt_st) + '</TD>');

	rep.Add('Ср. стоимость сделки ПР: '				+ format('%.2f',[sdelka_cost_pr]) + '<BR>');
	lstItog.Add('<TD>'								+ format('%.2f',[sdelka_cost_pr]) + '</TD>');
	rep.Add('Ср. стоимость сделки СТ: '				+ format('%.2f',[sdelka_cost_st]) + '<BR>');
	lstItog.Add('<TD>'								+ format('%.2f',[sdelka_cost_st]) + '</TD>');
	rep.Add('Ср. стоимость подачи ПР: '				+ format('%.2f',[podacha_cost_pr]) + '<BR>');
	lstItog.Add('<TD>'								+ format('%.2f',[podacha_cost_pr]) + '</TD>');
	rep.Add('Ср. стоимость подачи СТ: '				+ format('%.2f',[podacha_cost_st]) + '<BR>');
	lstItog.Add('<TD>'								+ format('%.2f',[podacha_cost_st]) + '</TD>');
	lstItog.Add('</TR>');

	Result := rep;
	kaRep.Free();
	qry.Close();
end;


procedure TrepData.Report_Finansy(userId: integer; dtFrom, dtTo: TDateTime);
var
	rep:			  THtmlReport;
	i:				  integer;
	sum_add, sum_sub: Currency;
begin
	sum_add := 0;
	sum_sub := 0;

	rep := THtmlReport.Create;
	rep.TempName := 'PrInfo-manager-fin';
	rep.Add('<HTML><HEAD><TITLE>Финансовый отчет за период с ' + DateToStr(dtFrom) + ' до ' + DateToStr(dtTo)
            + '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

	if (qryCassaBefore.Active) then qryCassaBefore.Close;
	qryCassaBefore.ParamByName('US_ID').AsInteger  := userId;
	qryCassaBefore.ParamByName('DATE_FROM').AsDate := dtFrom;
	qryCassaBefore.Open;

	if (qryCassaAfter.Active) then qryCassaAfter.Close;
	qryCassaAfter.ParamByName('US_ID').AsInteger := userId;
	qryCassaAfter.ParamByName('DATE_TO').AsDate  := dtTo + 1;
	qryCassaAfter.Open;

	rep.Add(format('Касса на начало периода: %.2f<BR>',[qryCassaBefore.FieldByName('SUM_WAS').AsFloat]));
	rep.Add(format('Касса на конец периода: %.2f<BR>',[qryCassaAfter.FieldByName('SUM_NOW').AsFloat]));

	rep.Add('<CENTER>');

	for i := 1 to 2 do
	begin
		if (i = 1) then
		begin
			tblTransType.Filter := 'TT_SIGN<0';
			rep.Add('<h2>Расходы:</h2>');
		end
		else
		begin
			tblTransType.Filter := 'TT_SIGN>0';
			rep.Add('<h2>Поступления:</h2>');
		end;
		tblTransType.Filtered := true;
		if (not tblTransType.Active) then tblTransType.Open;
		tblTransType.First;
		while (not tblTransType.Eof) do
		begin
			if (qryFinZarplata.Active) then qryFinZarplata.Close;
			qryFinZarplata.ParamByName('US_ID').AsInteger  := userId;
			qryFinZarplata.ParamByName('TT_ID').AsInteger  := tblTransTypeTT_ID.Value;
			qryFinZarplata.ParamByName('DATE_FROM').AsDate := dtFrom;
			qryFinZarplata.ParamByName('DATE_TO').AsDate   := dtTo + 1;
			qryFinZarplata.Open;

			if (qryFinZarplataSubTotal.Active) then qryFinZarplataSubTotal.Close;
			qryFinZarplataSubTotal.ParamByName('US_ID').AsInteger  := userId;
			qryFinZarplataSubTotal.ParamByName('TT_ID').AsInteger  := tblTransTypeTT_ID.Value;
			qryFinZarplataSubTotal.ParamByName('DATE_FROM').AsDate := dtFrom;
			qryFinZarplataSubTotal.ParamByName('DATE_TO').AsDate   := dtTo + 1;
			qryFinZarplataSubTotal.Open;

			rep.Add('<FONT SIZE=+2>' + tblTransTypeTT_NAME.AsString + '</FONT>');
			rep.Add(getTableHeader(qryFinZarplata,13));
			qryFinZarplata.First;

			while (not qryFinZarplata.Eof) do
			begin
				rep.Add(getTableRow(qryFinZarplata,13,nil));
				qryFinZarplata.Next;
			end;

			rep.Add('</TABLE>');
			rep.Add(format('Итог: %.2f<BR>', [qryFinZarplataSubTotalSUM.AsFloat]));

			if (i = 1) then
				sum_sub := sum_sub + qryFinZarplataSubTotalSUM.AsFloat
			else
				sum_add := sum_add + qryFinZarplataSubTotalSUM.AsFloat;

			tblTransType.Next;
		end;
	end;
	rep.Add('</CENTER>');

	rep.Add(format('Всего расходов: %.2f<BR>', [sum_sub]));
	rep.Add(format('Всего поступлений: %.2f<BR>', [sum_add]));

	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser;
	rep.Free;
end;


procedure TrepData.Report_PayedBeznal(userId: integer; allAgents: boolean; dtFrom, dtTo: TDateTime);
var
	rep: THtmlReport;
  res: TStringList;
begin
	rep := THtmlReport.Create();
	rep.TempName := 'PrInfo-zarplata-rep';
	rep.Add('<HTML><HEAD><TITLE>Оплаченные безналичные (кредитные) сделки за ' + DateToStr(dtFrom)
            + '-' + DateToStr(dtTo) + '</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

	if (allAgents) then
	with data do
	begin
		if (qryCurrentUserRights.Active) then qryCurrentUserRights.Close();
		qryCurrentUserRights.DataSet.ParamByName('US_ID').AsInteger := userId;
		qryCurrentUserRights.Open;

		qryCurrentUserRights.First();
		while (not qryCurrentUserRights.Eof) do
		begin
      res := Report_PayedBeznal_Strings(qryCurrentUserRightsAG_ID.Value,
            										  qryCurrentUserRightsAG_NAME.Value,
                                                      dtFrom,
                                                      dtTo);
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
    res := Report_PayedBeznal_Strings(data.cdsAgentAG_ID.Value,
         										  data.cdsAgentAG_NAME.Value,
                                                  dtFrom,
                                                  dtTo);
    if res.Count > 0 then
    begin
    		rep.AddStrings(res);
		    rep.Add('<HR><BR><BR>');
    end;
    FreeAndNil(res);
	end;

	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;


function TrepData.Report_PayedBeznal_Strings(agid: integer; agname: string; dtFrom, dtTo: TDateTime):TStringList;
var
	rep: TStringList;
	qry: TSQLQuery;
begin
	qry := repData.qryPayedBeznalByTime;

	if (qry.Active) then qry.Close();

	qry.ParamByName('DATE_FROM').AsDate := dtFrom;
	qry.ParamByName('DATE_TO').AsDate   := dtTo;

	qry.ParamByName('AG_ID').AsInteger  := agid;
	qry.Open();

  if qry.IsEmpty then
  begin
      result := TStringList.Create;
      exit
  end;

	rep := TStringList.Create();
	rep.Add('<CENTER><B>Оплаченные безналичные (кредитные) сделки агента ' + agname + ' за '
          + DateToStr(dtFrom) + '-' + DateToStr(dtTo) + '</B></CENTER>');

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

procedure TrepData.Report_Interceptions;
var
	qry: TSQLQuery;
	rep: THtmlReport;
begin
	qry := repData.qryInterceptions;
	if (qry.Active) then qry.Close();
	qry.Open();

	rep := THtmlReport.Create();
	rep.TempName := 'PrInfo-interceptions';
	rep.Add('<HTML><HEAD><TITLE>Пересечения</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');
	rep.Add('<CENTER><B>Пересечения</B></CENTER>');

	rep.Add(getTableHeader(qry, 13));

	qry.First();
	while (not qry.Eof) do
	begin
		rep.Add(getTableRow(qry, 13, nil));
		qry.Next();
	end;

	rep.Add('</TABLE>');

	qry.Close();

	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;


procedure TrepData.Report_NotApprovedSdelkas(userId, gz_id: integer; allAgents: boolean);
var
	rep:    THtmlReport;
	oneRep: TStringList;
  s, NotApprSum:double;
begin
  NotApprSum := 0;
	rep := THtmlReport.Create();
	rep.TempName := 'PrInfo-agent-sdelka-not-payed';
	rep.Add('<HTML><HEAD><TITLE>Неподтверждённые сделки</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

	if (allAgents) then
	with data do
	begin
		if (qryCurrentUserRights.Active) then qryCurrentUserRights.Close();
		qryCurrentUserRights.DataSet.ParamByName('US_ID').AsInteger := userId;
		qryCurrentUserRights.Open;

    NotApprSum := 0;
    
		qryCurrentUserRights.First();
		while (not qryCurrentUserRights.Eof) do
		begin
      s := 0;
			oneRep := Report_NotApprovedSdelkas_Strings(qryCurrentUserRightsAG_ID.Value, gz_id,
            										  qryCurrentUserRightsAG_NAME.Value, s);

      NotApprSum := NotApprSum + s;
			if (oneRep.Count > 0) then rep.AddStrings(oneRep);
			qryCurrentUserRights.Next();

      FreeAndNil(oneRep);
		end;
	end
	else begin
    oneRep := Report_NotApprovedSdelkas_Strings(data.cdsAgentAG_ID.Value, gz_id,
        												 data.cdsAgentAG_NAME.Value, s);

    NotApprSum := NotApprSum + s;
		rep.AddStrings(oneRep);
    FreeAndNil(oneRep);
  end;
  rep.Add('');
  rep.Add('<BR>');
  rep.Add('<B>Итог:</B>');
  rep.Add('<BR>');
  rep.Add(Format('Сумма неподтвержденных сделок в текущий номер: %.2f<BR> ', [NotApprSum]));
	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;

function  TrepData.Report_NotApprovedSdelkas_Strings(agid, gz_id: integer; agname: String; out s: double):TStringList;
var
	rep: TStringList;
	qry: TSQLQuery;
begin
  s   := 0;
	qry := qryNotApprovedSdelkas;

  if gz_id = 4 then gz_id := 0
  else if gz_id = 0 then gz_id := -1
  else if gz_id = 5 then gz_id := 6;

	if (qry.Active) then qry.Close();
	qry.ParamByName('AG_ID').AsInteger := agid;
  qry.ParamByName('GZ_ID').AsInteger := gz_id;
	qry.Open();

	rep := TStringList.Create();

	if (not qry.IsEmpty()) then
	begin
		rep.Add('<CENTER><B>Неподтверждённые сделки агента ' + agname + '</B></CENTER>');

		rep.Add(getTableHeader(qry, 13));

		qry.First();
		while (not qry.Eof) do
		begin
      if ((qry.FieldByName('SD_STATE').AsInteger in [1,2,3]) and (qryNotApprovedSdelkasST_IS_CURRENT_ISSUE.AsInteger = 1)) or (qryNotApprovedSdelkasSD_TYPE.asInteger = 4)
      then s := s + qryNotApprovedSdelkasSD_SUM.AsFloat;

			rep.Add(getTableRow(qry, 13, nil));
			qry.Next();
		end;

		rep.Add('</TABLE>');
	end;

	Result := rep;
	qry.Close();
end;

procedure TrepData.qryNotApprovedSdelkasRB_IS_LOCKABLEGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
	if (Sender.Value > 0) then Text := 'X' else Text := '';
end;

procedure TrepData.qrySdelkaCountSummary__PAY_BALANSGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	if (Sender.DataSet.FieldByName('SUM_PRINES').AsFloat <> 0) then
		Text := FormatFloat('0.00', 100 * Sender.DataSet.FieldByName('SUM_PAYED').AsFloat / Sender.DataSet.FieldByName('SUM_PRINES').AsFloat - 100)
	else
		Text := '0';
end;

procedure TrepData.qryNotApprovedSdelkasST_IS_CURRENT_ISSUEGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
	if (Sender.AsInteger > 0) then Text := '[X]' else Text := '';
end;

procedure TrepData.qrySdelkaCountSummary_PAY_BALANSGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	if (Sender.DataSet.FieldByName('SUM_PRINES').AsFloat <> 0) then
		Text := FormatFloat('0.00', 100 * Sender.DataSet.FieldByName('SUM_PAYED').AsFloat / Sender.DataSet.FieldByName('SUM_PRINES').AsFloat - 100)
	else
		Text := '0';
end;

end.
