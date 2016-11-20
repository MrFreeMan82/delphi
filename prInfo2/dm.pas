unit dm;

interface

uses
  SysUtils, Classes, Dialogs, Forms, DBClient, SqlExpr,
  DBXpress, FMTBcd, Provider, Variants, SimpleDS, ComCtrls, RegExpr,
  Graphics, DBCtrlsEh,  DB, zlib, Controls, DBCtrls, StdCtrls, Menus,
  GraphicEx, globals, ExtCtrls, RpBase, RpSystem, RpDefine, RpRave,Windows,
  IBEvents, IBDatabase;

type
  Tdata = class(TDataModule)
	cdsSdelka: TClientDataSet;
	dsSdelka: TDataSource;
	dsAgent: TDataSource;
	dsCust: TDataSource;
	cdsSdelkaAG_ID: TIntegerField;
    cdsSdelkaSD_ID: TIntegerField;
    cdsSdelkaSD_TYPE: TSmallintField;
    cdsSdelkaSD_STATE: TSmallintField;
    dsCustPhone: TDataSource;
    cdsSdelkaCU_ID: TIntegerField;
    dsIssue: TDataSource;
    dsRubrika: TDataSource;
    cdsSdelkaSD_SUM: TFloatField;
	cdsSdelkaSD_PERCENT: TFloatField;
	cdsSdelkaSD_SUM_DEFAULT: TFloatField;
    cdsSdelkaSD_PERCENT_DEFAULT: TFloatField;
    cdsSdelkaSD_SKIDKA: TFloatField;
    tblFormat: TSimpleDataSet;
	dsFormat: TDataSource;
    tblFormatFM_ID: TIntegerField;
    tblFormatFM_NAME: TStringField;
    tblPayType: TSimpleDataSet;
	dsPayType: TDataSource;
    tblPayTypePT_ID: TIntegerField;
    tblPayTypePT_NAME: TStringField;
    cdsSdelkaPT_ID: TSmallintField;
    cdsSdelkaSD_ID_COMPOUND: TStringField;
	spCountSum: TSQLStoredProc;
    spCountPercent: TSQLStoredProc;
    tblGazeta: TSimpleDataSet;
    dsGazeta: TDataSource;
    tblGazetaGZ_ID: TSmallintField;
	tblGazetaGZ_NAME: TStringField;
	cdsSdelkaGZ_ID: TSmallintField;
	spGetIssueId: TSQLStoredProc;
    cdsSdelkaSD_SUM_PAYED: TFloatField;
    cdsSdelkaSD_ALL_PAYED: TSmallintField;
    cdsSdelkaSD_COMMENT_SHORT: TStringField;
	cdsSdelkaAS_ID: TSmallintField;
    spApproveSdelka: TSQLStoredProc;
    tblParams: TSimpleDataSet;
    dsParams: TDataSource;
    cdsSdelkaSD_PAY_NOW: TSmallintField;
    qryFindSdelkaByNumber: TSQLQuery;
    dsFindSdelka: TDataSource;
    qryFindSdelkaByPhone: TSQLQuery;
    qryFindSdelkaByPhoneAG_ID: TIntegerField;
    qryFindSdelkaByPhoneSD_ID: TIntegerField;
    qryFindSdelkaByPhoneCU_ID: TIntegerField;
    qryFindSdelkaByPhoneCU_NAME: TStringField;
    qryFindSdelkaByPhoneSD_ID_COMPOUND: TStringField;
    qryFindSdelkaByPhonePT_ID: TIntegerField;
    qryFindSdelkaByPhoneSD_ZAPAS: TIntegerField;
	qryFindSdelkaByPhoneAG_NAME: TStringField;
	qryFindSdelkaByNumberAG_ID: TIntegerField;
	qryFindSdelkaByNumberSD_ID: TIntegerField;
    qryFindSdelkaByNumberCU_ID: TIntegerField;
    qryFindSdelkaByNumberCU_NAME: TStringField;
    qryFindSdelkaByNumberSD_ID_COMPOUND: TStringField;
	qryFindSdelkaByNumberPT_ID: TIntegerField;
    qryFindSdelkaByNumberSD_ZAPAS: TIntegerField;
    qryFindSdelkaByNumberAG_NAME: TStringField;
    qryUsr: TSimpleDataSet;
    dsUsr: TDataSource;
	qryUsrUS_ID: TIntegerField;
    qryUsrUS_NAME: TStringField;
    qryUsrUS_DISK_ID: TStringField;
    qryUsrUS_PASSWORD: TStringField;
    qryUsrUS_TYPE: TIntegerField;
    tblUsrType: TSimpleDataSet;
	dsUsrType: TDataSource;
    tblUsrTypeUT_ID: TIntegerField;
    tblUsrTypeUT_NAME: TStringField;
    qryUsrUS_TYPE_LK: TStringField;
	qryUsrRights: TSimpleDataSet;
	dsUsrRights: TDataSource;
    qryUsrRightsUS_ID: TIntegerField;
	qryUsrRightsAG_ID: TIntegerField;
    tblAgentsList: TSimpleDataSet;
    dsAgentsList: TDataSource;
    tblAgentsListAG_ID: TIntegerField;
    tblAgentsListAG_NAME: TStringField;
	qryFindSdelkaByFactNum: TSQLQuery;
    qryFindSdelkaByFactNumAG_ID: TIntegerField;
    qryFindSdelkaByFactNumSD_ID: TIntegerField;
    qryFindSdelkaByFactNumCU_ID: TIntegerField;
	qryFindSdelkaByFactNumCU_NAME: TStringField;
    qryFindSdelkaByFactNumSD_ID_COMPOUND: TStringField;
    qryFindSdelkaByFactNumPT_ID: TIntegerField;
    qryFindSdelkaByFactNumSD_ZAPAS: TIntegerField;
    qryFindSdelkaByFactNumAG_NAME: TStringField;
    tblOtkaznik: TSimpleDataSet;
    dsOtkaznik: TDataSource;
    tblOtkaznikOT_NUMBER: TStringField;
    tblOtkaznikAG_ID: TIntegerField;
	tblOtkaznikOT_IS_STATIC: TSmallintField;
    tblBool: TSimpleDataSet;
    dsBool: TDataSource;
    tblBoolBL_ID: TSmallintField;
    tblBoolBL_NAME: TStringField;
	spRefreshOtkaznik: TSQLStoredProc;
    dsIssuePR: TDataSource;
	dsIssueNS: TDataSource;
	tblParamsPM_FIRST_OTKAZNIK_ISSUE_PR: TIntegerField;
    tblParamsPM_FIRST_OTKAZNIK_ISSUE_NS: TIntegerField;
	spAddToOtkaznik: TSQLStoredProc;
    spAddSumForManager: TSQLStoredProc;
    dsMoneyTransactions: TDataSource;
    tblTransactionType: TSimpleDataSet;
	dsTransactionType: TDataSource;
    tblTransactionTypeTT_ID: TIntegerField;
    tblTransactionTypeTT_NAME: TStringField;
    cdsSdelkaSD_FACT_NUM: TIntegerField;
    cdsSdelkaSD_KA_START_DATE: TSQLTimeStampField;
    cdsSdelkaSD_KA_END_DATE: TSQLTimeStampField;
    cdsSdelkaSD_FACT_DATE: TSQLTimeStampField;
	qryFindSdelkaByNumberSD_FACT_NUM: TIntegerField;
    qryFindSdelkaByPhoneSD_FACT_NUM: TIntegerField;
    qryFindSdelkaByFactNumSD_FACT_NUM: TIntegerField;
	tblOtkaznikStatic: TSimpleDataSet;
	dsOtkaznikStatic: TDataSource;
    tblOtkaznikStaticOT_NUMBER: TStringField;
    tblOtkaznikStaticAG_ID: TIntegerField;
	tblOtkaznikStaticOT_IS_STATIC: TSmallintField;
    tblOtkaznikStaticOT_COMMENT: TStringField;
    tblOtkaznikOT_COMMENT: TStringField;
    spAddAgentChangingTask: TSQLStoredProc;
    cdsSdelkaCU_NAME: TStringField;
	cdsSdelkaPODACHA_NUMS: TStringField;
    qryFindSdelkaByFactNumSD_ALL_PAYED: TIntegerField;
    qryFindSdelkaByPhoneSD_ALL_PAYED: TIntegerField;
    qryFindSdelkaByNumberSD_ALL_PAYED: TIntegerField;
    cdsSdelkaSD_PERCENT_SUM: TFloatField;
    cdsSdelkaSD_PERCENT_GIVEN: TSmallintField;
    cdsSdelkaSD_TO_GIVE_PERCENT: TSmallintField;
    tblParamsPM_MIN_BONUS_SUM: TFloatField;
    tblParamsPM_BONUS_PERCENT: TFloatField;
	tblFormatFM_SPACE: TFloatField;
	qryFindSdelkaByNumberSD_SUM_PAYED: TFloatField;
    qryFindSdelkaByPhoneSD_SUM_PAYED: TFloatField;
    qryFindSdelkaByFactNumSD_SUM_PAYED: TFloatField;
    qryFindSdelkaByNumberSD_SUM: TFloatField;
	qryFindSdelkaByPhoneSD_SUM: TFloatField;
    qryFindSdelkaByFactNumSD_SUM: TFloatField;
    qryFindSdelkaByNumberSD_STATE: TSmallintField;
    qryFindSdelkaByPhoneSD_STATE: TSmallintField;
	qryFindSdelkaByFactNumSD_STATE: TSmallintField;
    qryFindSdelkaByNumberPODACHA_NUMS: TStringField;
	qryFindSdelkaByPhonePODACHA_NUMS: TStringField;
    qryFindSdelkaByFactNumPODACHA_NUMS: TStringField;
    qryAgents: TSimpleDataSet;
	dsAgents: TDataSource;
    qryAgentsAG_ID: TIntegerField;
    qryAgentsAG_NAME: TStringField;
    tblParamsPM_CURRENT_ISSUE_PR: TIntegerField;
	tblParamsPM_CURRENT_ISSUE_NS: TIntegerField;
    cdsSdelkaSDS_NAME: TStringField;
	cdsSdelkaGZ_NAME: TStringField;
    cdsSdelkaPT_NAME: TStringField;
    cdsSdelkaAS_NAME: TStringField;
    qryCurrentUserRights: TSimpleDataSet;
    qryCurrentUserRightsUS_ID: TIntegerField;
    qryCurrentUserRightsAG_ID: TIntegerField;
    qryCurrentUserRightsAG_NAME: TStringField;
	qryUsrUS_OFFICE_NAME: TStringField;
    tblParamsPM_ROOT_DISK_ID: TStringField;
    tblParamsPM_DO_CHECK_DISK: TSmallintField;
    qryUsrRightsAG_NAME_LK: TStringField;
	spPayForSdelka: TSQLStoredProc;
    spNextCurrentIssue: TSQLStoredProc;
    spCloseIssue: TSQLStoredProc;
    qryAgentsAG_IS_REMOTE: TSmallintField;
	qryAgentsAG_IS_REMOTE_LK: TStringField;
    qryUsrUS_IS_REMOTE: TSmallintField;
    qryUsrUS_IS_REMOTE_LK: TStringField;
    tblParamsPM_SYNC_STATE: TIntegerField;
    qryChangeAgentTask: TSimpleDataSet;
	dsChangeAgentTask: TDataSource;
    spChangeAgentForSdelka: TSQLStoredProc;
	spPaySdelkas: TSQLStoredProc;
    spDeleteSdelka: TSQLStoredProc;
    tblParamsPM_GAZETA_OUTPUT_PATH: TStringField;
    spBeznalVNal: TSQLStoredProc;
    connection: TSQLConnection;
    qryCustPhone: TSQLQuery;
    cdsCustPhone: TClientDataSet;
    qryCustPhoneAG_ID: TIntegerField;
	qryCustPhoneCU_ID: TIntegerField;
    qryCustPhoneCP_NUMBER: TStringField;
	cdsCustPhoneAG_ID: TIntegerField;
    cdsCustPhoneCU_ID: TIntegerField;
    SQLMonitor: TSQLMonitor;
    qryAgent: TSQLQuery;
	qryAgentAG_ID: TIntegerField;
    qryAgentAG_NAME: TStringField;
	qryIssue: TSimpleDataSet;
    qryIssueIS_ID: TIntegerField;
    qryIssueGZ_ID: TSmallintField;
    qryIssueIS_NAME: TStringField;
	qryIssueIS_DATE: TSQLTimeStampField;
	qryIssueIS_NAME_COMPOSED: TStringField;
    qryIssuePR: TSimpleDataSet;
    IntegerField5: TIntegerField;
    SmallintField1: TSmallintField;
    StringField6: TStringField;
	SQLTimeStampField1: TSQLTimeStampField;
    StringField7: TStringField;
	qryIssueNS: TSimpleDataSet;
    IntegerField3: TIntegerField;
    SmallintField2: TSmallintField;
    StringField1: TStringField;
    SQLTimeStampField2: TSQLTimeStampField;
    StringField2: TStringField;
    cdsCustPhoneCP_NUMBER: TStringField;
    tblRubrika: TSimpleDataSet;
    tblRubrikaRB_ID: TIntegerField;
    tblRubrikaRB_NAME: TStringField;
    tblRubrikaRB_NAME_SHORT: TStringField;
    tblRubrikaRB_COST_COEFF: TFloatField;
    qryMoneyTransactions: TSimpleDataSet;
    qryMoneyTransactionsMT_ID: TIntegerField;
	qryMoneyTransactionsMT_DATE: TSQLTimeStampField;
    qryMoneyTransactionsMT_SUM: TFloatField;
    qryMoneyTransactionsMT_COMMENT: TStringField;
    qryMoneyTransactionsMT_CHANGE: TFloatField;
	qryMoneyTransactionsTT_ID: TIntegerField;
    qryMoneyTransactionsUS_ID: TIntegerField;
    qryMoneyTransactionsTT_NAME: TStringField;
    tblOtkaznikAG_NAME: TStringField;
    qryAgentAG_IS_REMOTE: TSmallintField;
    prvFindSdelka: TDataSetProvider;
    cdsFindSdelka: TClientDataSet;
    qryFindSdelkaByNumberSD_DATE: TSQLTimeStampField;
    qryFindSdelkaByNumberSD_FACT_DATE: TSQLTimeStampField;
    qryFindSdelkaByPhoneSD_DATE: TSQLTimeStampField;
    qryFindSdelkaByPhoneSD_FACT_DATE: TSQLTimeStampField;
    qryFindSdelkaByFactNumSD_DATE: TSQLTimeStampField;
	qryFindSdelkaByFactNumSD_FACT_DATE: TSQLTimeStampField;
    cdsFindSdelkaAG_ID: TIntegerField;
	cdsFindSdelkaSD_ID: TIntegerField;
    cdsFindSdelkaCU_ID: TIntegerField;
    cdsFindSdelkaCU_NAME: TStringField;
    cdsFindSdelkaSD_ID_COMPOUND: TStringField;
	cdsFindSdelkaPT_ID: TIntegerField;
	cdsFindSdelkaSD_ZAPAS: TIntegerField;
	cdsFindSdelkaAG_NAME: TStringField;
    cdsFindSdelkaPT_NAME_LK: TStringField;
    cdsFindSdelkaSD_FACT_NUM: TIntegerField;
    cdsFindSdelkaSD_ALL_PAYED: TIntegerField;
    cdsFindSdelkaSD_ALL_PAYED_LK: TStringField;
    cdsFindSdelkaSD_SUM_PAYED: TFloatField;
	cdsFindSdelkaSD_SUM: TFloatField;
    cdsFindSdelkaSD_STATE: TSmallintField;
    cdsFindSdelkaPODACHA_NUMS: TStringField;
    cdsFindSdelkaSD_DATE: TSQLTimeStampField;
    cdsFindSdelkaSD_FACT_DATE: TSQLTimeStampField;
    prvAgent: TDataSetProvider;
	dsAgentLink: TDataSource;
    cdsAgent: TClientDataSet;
    cdsAgentAG_ID: TIntegerField;
    cdsAgentAG_NAME: TStringField;
    cdsAgentAG_IS_REMOTE: TSmallintField;
    qrySdelka: TSQLQuery;
    qrySdelkaAG_ID: TIntegerField;
    qrySdelkaSD_ID: TIntegerField;
	qrySdelkaSD_TYPE: TSmallintField;
    qrySdelkaSD_STATE: TSmallintField;
    qrySdelkaCU_ID: TIntegerField;
	qrySdelkaSD_SUM: TFloatField;
    qrySdelkaSD_PERCENT: TFloatField;
    qrySdelkaSD_SUM_DEFAULT: TFloatField;
    qrySdelkaSD_PERCENT_DEFAULT: TFloatField;
	qrySdelkaSD_SKIDKA: TFloatField;
	qrySdelkaPT_ID: TSmallintField;
    qrySdelkaSD_ID_COMPOUND: TStringField;
	qrySdelkaGZ_ID: TSmallintField;
	qrySdelkaSD_COMMENT: TStringField;
    qrySdelkaSD_SUM_PAYED: TFloatField;
    qrySdelkaSD_ALL_PAYED: TSmallintField;
    qrySdelkaSD_COMMENT_SHORT: TStringField;
    qrySdelkaAS_ID: TSmallintField;
    qrySdelkaSD_PAY_NOW: TSmallintField;
	qrySdelkaSD_FACT_NUM: TIntegerField;
    qrySdelkaSD_KA_START_DATE: TSQLTimeStampField;
	qrySdelkaSD_KA_END_DATE: TSQLTimeStampField;
    qrySdelkaSD_FACT_DATE: TSQLTimeStampField;
	qrySdelkaSD_PERCENT_SUM: TFloatField;
    qrySdelkaSD_PERCENT_GIVEN: TSmallintField;
    qrySdelkaSD_TO_GIVE_PERCENT: TSmallintField;
    qrySdelkaCU_NAME: TStringField;
    qrySdelkaPODACHA_NUMS: TStringField;
	qrySdelkaGZ_NAME: TStringField;
    qrySdelkaPT_NAME: TStringField;
	qrySdelkaAS_NAME: TStringField;
	cdsSdelkaSD_COMMENT: TStringField;
    prvSdelka: TDataSetProvider;
    tblObjavState: TSimpleDataSet;
    dsObjavState: TDataSource;
    tblObjavStateOS_ID: TIntegerField;
    tblObjavStateOS_NAME: TStringField;
    qryFindSdelkaByText: TSQLQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField4: TIntegerField;
    StringField3: TStringField;
    StringField4: TStringField;
    IntegerField6: TIntegerField;
	IntegerField7: TIntegerField;
    StringField5: TStringField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
	FloatField1: TFloatField;
    FloatField2: TFloatField;
    SmallintField3: TSmallintField;
	StringField9: TStringField;
	SQLTimeStampField3: TSQLTimeStampField;
    SQLTimeStampField4: TSQLTimeStampField;
    tblSdelkaState: TSimpleDataSet;
    tblSdelkaStateSDS_ID: TSmallintField;
    tblSdelkaStateSDS_NAME: TStringField;
    dsSdelkaState: TDataSource;
	qryCustOne: TSQLQuery;
    dsCustOne: TDataSource;
    qryCustOneAG_ID: TIntegerField;
    qryCustOneCU_ID: TIntegerField;
    qryCustOneCU_NAME: TStringField;
    qryCustOneCU_ID_COMPOUND: TStringField;
    qryCustOneCU_BONUS_ENABLED: TSmallintField;
	qryCustOneCU_INFO: TStringField;
	qryCustOneCU_KA_INFO_SHORT: TStringField;
    qryCustOneCU_KA_INFO_FULL: TStringField;
    cdsCustOne: TClientDataSet;
    cdsCustOneAG_ID: TIntegerField;
    cdsCustOneCU_ID: TIntegerField;
    cdsCustOneCU_NAME: TStringField;
	cdsCustOneCU_ID_COMPOUND: TStringField;
	cdsCustOneCU_BONUS_ENABLED: TSmallintField;
	cdsCustOneCU_INFO: TStringField;
    cdsCustOneCU_KA_INFO_SHORT: TStringField;
    cdsCustOneCU_KA_INFO_FULL: TStringField;
	prvCustOne: TDataSetProvider;
	qryFindSdelkaByNumberFM_ID: TIntegerField;
	qryFindSdelkaByNumberRB_ID: TIntegerField;
	qryFindSdelkaByPhoneFM_ID: TIntegerField;
	qryFindSdelkaByPhoneRB_ID: TIntegerField;
	qryFindSdelkaByFactNumFM_ID: TIntegerField;
	qryFindSdelkaByFactNumRB_ID: TIntegerField;
	qryFindSdelkaByTextFM_ID: TIntegerField;
	qryFindSdelkaByTextRB_ID: TIntegerField;
	cdsFindSdelkaFM_ID: TIntegerField;
	cdsFindSdelkaRB_ID: TIntegerField;
	cdsFindSdelkaFM_NAME_LK: TStringField;
	cdsFindSdelkaRB_NAME_LK: TStringField;
	qrySdelkaFM_ID: TIntegerField;
	qrySdelkaRB_ID: TIntegerField;
	cdsSdelkaFM_ID: TIntegerField;
	cdsSdelkaRB_ID: TIntegerField;
	cdsSdelkaRB_NAME_LK: TStringField;
	cdsSdelkaFM_NAME_LK: TStringField;
    qryUsrUS_AUTO_REFRESH: TSmallintField;
    qryChangeAgentTaskAG_ID_SRC: TIntegerField;
    qryChangeAgentTaskSD_ID_SRC: TIntegerField;
    qryChangeAgentTaskAG_ID_DST: TIntegerField;
    qryChangeAgentTaskAG_NAME_SRC_LK: TStringField;
	qryChangeAgentTaskAG_NAME_DST_LK: TStringField;
    qryCustPhoneCP_ADDDATE: TSQLTimeStampField;
    cdsCustPhoneCP_ADDDATE: TSQLTimeStampField;
    qryChangeAgentTaskAG_IS_REMOTE_SRC_LK: TSmallintField;
    tblAgentsListAG_IS_REMOTE: TSmallintField;
	qryChangeAgentTaskAG_IS_REMOTE_DST_LK: TSmallintField;
    qryCustUnique: TSQLQuery;
    prvCustUnique: TDataSetProvider;
	cdsCustUnique: TClientDataSet;
    dsCustUnique: TDataSource;
	qryCustOneCU_OKPO: TStringField;
	cdsCustOneCU_OKPO: TStringField;
    tblParamsPM_CLOSEDATE_PR_OLD: TSQLTimeStampField;
    tblParamsPM_CLOSEDATE_PR_NEW: TSQLTimeStampField;
    tblParamsPM_CLOSEDATE_NS_OLD: TSQLTimeStampField;
    tblParamsPM_CLOSEDATE_NS_NEW: TSQLTimeStampField;
	cdsAlterAgentPercent: TClientDataSet;
    qryAlterAgentPercent: TSQLQuery;
    prvAlterAgentPercent: TDataSetProvider;
    cdsAlterAgentPercentAG_ID: TIntegerField;
    cdsAlterAgentPercentAG_NAME_LK: TStringField;
    qryAlterAgentPercentAG_ID: TIntegerField;
    dsAlterAgentPercent: TDataSource;
    qryDoAlterAgentPercent: TSQLQuery;
	qryAlterAgentPercentPERCENT_BEZNAL_DELTA: TIntegerField;
    qryAlterAgentPercentPERCENT_NAL_DELTA: TIntegerField;
	qryAlterAgentPercentPERCENT_CREDIT_DELTA: TIntegerField;
    qryAlterAgentPercentPERCENT_BEZNAL_V_NAL_DELTA: TIntegerField;
    cdsAlterAgentPercentPERCENT_BEZNAL_DELTA: TIntegerField;
    cdsAlterAgentPercentPERCENT_NAL_DELTA: TIntegerField;
    cdsAlterAgentPercentPERCENT_CREDIT_DELTA: TIntegerField;
	cdsAlterAgentPercentPERCENT_BEZNAL_V_NAL_DELTA: TIntegerField;
    qryCustOneCUQ_REG_ID: TIntegerField;
    cdsCustOneCUQ_REG_ID: TIntegerField;
    qryCustUniqueCUQ_TYPE: TSmallintField;
    qryCustUniqueCUQ_FULL_NAME: TStringField;
    qryCustUniqueCUQ_ADDRESS: TStringField;
    qryCustUniqueCUQ_ADDRESS_REAL: TStringField;
    qryCustUniqueCUQ_NAME: TStringField;
    qryCustUniqueCUQ_PHONES: TStringField;
    qryCustUniqueCUQ_BOSS: TStringField;
    qryCustUniqueCUQ_BUHGALTER: TStringField;
	qryCustUniqueCUQ_OKPO: TStringField;
    qryCustUniqueCUQ_INN: TStringField;
    qryCustUniqueCUQ_NDS_NUM: TStringField;
    qryCustUniqueCUQ_CONTACT: TStringField;
    qryCustUniqueCUQ_DOC_SER: TStringField;
    qryCustUniqueCUQ_DOC_NUM: TStringField;
    qryCustUniqueCUQ_DOC_AUTHOR: TStringField;
	qryCustUniqueCUQ_DOC_DATE: TStringField;
	qryCustUniqueCUQ_1C_ID: TIntegerField;
    qryCustUniqueCUQ_REG_ID: TIntegerField;
    qryCustUniqueCUQ_CHANGED: TSmallintField;
    cdsCustUniqueCUQ_TYPE: TSmallintField;
    cdsCustUniqueCUQ_FULL_NAME: TStringField;
    cdsCustUniqueCUQ_ADDRESS: TStringField;
	cdsCustUniqueCUQ_ADDRESS_REAL: TStringField;
    cdsCustUniqueCUQ_NAME: TStringField;
    cdsCustUniqueCUQ_PHONES: TStringField;
    cdsCustUniqueCUQ_BOSS: TStringField;
    cdsCustUniqueCUQ_BUHGALTER: TStringField;
    cdsCustUniqueCUQ_OKPO: TStringField;
	cdsCustUniqueCUQ_INN: TStringField;
	cdsCustUniqueCUQ_NDS_NUM: TStringField;
    cdsCustUniqueCUQ_CONTACT: TStringField;
    cdsCustUniqueCUQ_DOC_SER: TStringField;
    cdsCustUniqueCUQ_DOC_NUM: TStringField;
	cdsCustUniqueCUQ_DOC_AUTHOR: TStringField;
	cdsCustUniqueCUQ_DOC_DATE: TStringField;
    cdsCustUniqueCUQ_1C_ID: TIntegerField;
	cdsCustUniqueCUQ_REG_ID: TIntegerField;
	cdsCustUniqueCUQ_CHANGED: TSmallintField;
    tblParamsPM_DEFAULT_FACTURA_PHONES: TStringField;
    qryAgentAG_FACTURA_PHONES: TStringField;
    cdsAgentAG_FACTURA_PHONES: TStringField;
    qryUsrUS_CAN_EDIT_CUST_UNIQUE: TSmallintField;
    qryUsrUS_CAN_EDIT_CUST_UNIQUE_LK: TStringField;
    qryAgentsAG_FACTURA_PHONES: TStringField;
    spLogUser: TSQLStoredProc;
    spUserLoginLog: TSQLStoredProc;
    qryAgentsAG_FACTURA_NAME: TStringField;
    spNalVKredit: TSQLStoredProc;
    qryAccessRights: TSimpleDataSet;
    qryAccessRightsARR_WINDOW_NAME: TStringField;
    qryAccessRightsARR_ORDER: TSmallintField;
	qryAccessRightsARR_NAME: TStringField;
    qryAccessRightsARR_USER_TYPES: TStringField;
    qryAccessRightsARR_TARGET_OBJECT_NAME: TStringField;
    qryAccessRightsARR_CHECK_OBJECT_NAME: TStringField;
	qryAccessRightsARR_CHECK_MODE: TStringField;
    qryAccessRightsARR_CHECK_OBJECT_VALUE: TFloatField;
    qryAccessRightsARR_ACTION: TStringField;
    cdsFindSdelkaSDELKA_IS_OF_CURRENT_AGENT: TIntegerField;
    sdsSyncState: TSimpleDataSet;
    sdsSyncStateSS_ID: TSmallintField;
	sdsSyncStateSS_NAME: TStringField;
    sdsSyncStateSS_IS_REMOTE: TSmallintField;
    dsSyncState: TDataSource;
    sdsCheckPhoneInOtkaznik: TSimpleDataSet;
    sdsCheckPhoneInOtkaznikAG_ID: TIntegerField;
    sdsCheckPhoneInOtkaznikOT_IS_STATIC: TSmallintField;
    sdsCheckPhoneInOtkaznikOT_COMMENT: TStringField;
    sdsCheckPhoneInOtkaznikAG_NAME: TStringField;
    dsCheckPhoneInOtkaznik: TDataSource;
    sdsCheckPhoneInOtkaznikOT_CALC_DESCRIPTION: TStringField;
    sdsRubrikaSite: TSimpleDataSet;
    sdsRubrikaSiteRS_ID: TIntegerField;
    sdsRubrikaSiteRS_NAME: TStringField;
    dsRubrikaSite: TDataSource;
    sdsRubrikaPohozha: TSimpleDataSet;
    sdsRubrikaPohozhaRS_ID: TIntegerField;
    sdsRubrikaPohozhaRB_ID: TIntegerField;
    sdsRubrikaPohozhaRS_NAME_LK: TStringField;
    sdsRubrikaPohozhaRB_NAME_LK: TStringField;
    dsRubrikaPohozha: TDataSource;
    qryFindSdelkaByNumberSDELKA_IS_OF_CURRENT_USER: TIntegerField;
    qryFindSdelkaByFactNumSDELKA_IS_OF_CURRENT_USER: TIntegerField;
    qryFindSdelkaByTextSDELKA_IS_OF_CURRENT_USER: TIntegerField;
    spNalVBeznal: TSQLStoredProc;
    tblFormatFM_HAS_PICTURE: TSmallintField;
    tblFormatFM_PICTURE_SIZES: TStringField;
    tblRubrikaRB_IS_OBLOGKA: TSmallintField;
    tblRubrikaGZ_ID: TIntegerField;
    tblRubrikaGZ_NAME_LK: TStringField;
    tblRubrikaRB_IS_HOT: TSmallintField;
    tblRubrikaRB_IS_LOCKABLE: TSmallintField;
    spLockRubrikas: TSQLStoredProc;
    qryCheckAgentLocked: TSQLQuery;
    qryCheckAgentLockedAG_LOCK_RUBRIKAS: TSmallintField;
    qrySdelkaRB_IS_LOCKABLE: TFMTBCDField;
    cdsSdelkaRB_IS_LOCKABLE: TFMTBCDField;
    qryFindSdelkaByNumberGZ_ID: TSmallintField;
    qryFindSdelkaByPhoneGZ_ID: TSmallintField;
    qryFindSdelkaByTextGZ_ID: TSmallintField;
    qryFindSdelkaByFactNumGZ_ID: TSmallintField;
    cdsFindSdelkaGZ_ID: TSmallintField;
    tblParamsPM_LOCK_RUBRIKAS_VYPUSK: TSmallintField;
    tblParamsPM_CURRENT_ISSUE_SR: TIntegerField;
    tblParamsPM_CLOSEDATE_SR_OLD: TSQLTimeStampField;
    tblParamsPM_CLOSEDATE_SR_NEW: TSQLTimeStampField;
    qryIssueSR: TSimpleDataSet;
    IntegerField8: TIntegerField;
    SmallintField4: TSmallintField;
    StringField8: TStringField;
    SQLTimeStampField5: TSQLTimeStampField;
    StringField10: TStringField;
    dsIssueSR: TDataSource;
    tblParamsPM_FIRST_OTKAZNIK_ISSUE_SR: TIntegerField;
    tblGazetaGZ_NAME_SHORT: TStringField;
    qrySdelkaSR_IS_CURRENT_ISSUE: TIntegerField;
    cdsSdelkaSR_IS_CURRENT_ISSUE: TIntegerField;
    qryFindSdelkaByNumberSD_TYPE: TSmallintField;
    qryFindSdelkaByPhoneSD_TYPE: TSmallintField;
    qryFindSdelkaByFactNumSD_TYPE: TSmallintField;
    qryFindSdelkaByTextSD_TYPE: TSmallintField;
    cdsFindSdelkaSD_TYPE: TSmallintField;
    qrySdelkaSD_TYPE_DESC: TStringField;
    cdsSdelkaSD_TYPE_DESC: TStringField;
    qryFindSdelkaByNumberSD_TYPE_DESC: TStringField;
    qryFindSdelkaByPhoneSD_TYPE_DESC: TStringField;
    qryFindSdelkaByFactNumSD_TYPE_DESC: TStringField;
    qryFindSdelkaByTextSD_TYPE_DESC: TStringField;
    cdsFindSdelkaSD_TYPE_DESC: TStringField;
    tblParamsPM_PROXY_SERVER: TStringField;
    tblParamsPM_PROXY_PORT: TIntegerField;
    tblParamsPM_PROXY_USERNAME: TStringField;
    tblParamsPM_PROXY_PASSWORD: TStringField;
    tblParamsPM_VACANCY_IMPORT_URL: TStringField;
    qryFindSdelkaByOKPO: TSQLQuery;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    StringField11: TStringField;
    StringField12: TStringField;
    IntegerField14: TIntegerField;
    IntegerField15: TIntegerField;
    StringField13: TStringField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    SmallintField5: TSmallintField;
    StringField14: TStringField;
    SQLTimeStampField6: TSQLTimeStampField;
    SQLTimeStampField7: TSQLTimeStampField;
    IntegerField18: TIntegerField;
    IntegerField19: TIntegerField;
    IntegerField20: TIntegerField;
    SmallintField6: TSmallintField;
    SmallintField7: TSmallintField;
    StringField15: TStringField;
    qryAgentsAG_LOCK_RUBRIKAS: TSmallintField;
	tblParamsPM_FIRST_OTKAZNIK_ISSUE_RZ: TIntegerField;
	tblParamsPM_CURRENT_ISSUE_RZ: TIntegerField;
	tblParamsPM_CLOSEDATE_RZ_NEW: TSQLTimeStampField;
	tblParamsPM_CLOSEDATE_RZ_OLD: TSQLTimeStampField;
	tblParamsPM_REPORT_TEMPLATE: TBlobField;
	tblParamsPM_REPORT_TEMPLATE_DATE: TSQLTimeStampField;
	tblParamsPM_FIRST_OTKAZNIK_ISSUE_RK: TIntegerField;
	tblParamsPM_CURRENT_ISSUE_RK: TIntegerField;
	tblParamsPM_CLOSEDATE_RK_OLD: TSQLTimeStampField;
	tblParamsPM_CLOSEDATE_RK_NEW: TSQLTimeStampField;
    tblRequisite: TSimpleDataSet;
    tblRequisiteRQ_ID: TIntegerField;
    tblRequisiteRQ_NAME: TStringField;
    tblRequisiteRQ_FULL_NAME: TStringField;
    tblRequisiteRQ_ACCOUNT: TStringField;
    tblRequisiteRQ_ADDRESS: TStringField;
    tblRequisiteRQ_PHONES: TStringField;
    tblRequisiteRQ_ACTIVE: TSmallintField;
    tblRequisiteRQ_STAMP: TBlobField;
    tblOffice: TSimpleDataSet;
    dsOffice: TDataSource;
    tblOfficeOF_ID: TIntegerField;
    tblOfficeOF_NAME: TStringField;
    tblOfficeOF_IS_REMOTE: TSmallintField;
    qryIssueRZ: TSimpleDataSet;
    IntegerField1666: TIntegerField;
    SmallintField3666: TSmallintField;
    StringField3666: TStringField;
    SQLTimeStampField3666: TSQLTimeStampField;
    StringField4666: TStringField;
    dsIssueRZ: TDataSource;
    qryIssueRK: TSimpleDataSet;
    IntegerField2666: TIntegerField;
    SmallintField5666: TSmallintField;
    StringField5666: TStringField;
    SQLTimeStampField4666: TSQLTimeStampField;
    StringField9666: TStringField;
    dsIssueRK: TDataSource;
    dsRequisite: TDataSource;
    tblDistrict: TSimpleDataSet;
    dsDistrict: TDataSource;
    tblDistrictDT_ID: TIntegerField;
    tblDistrictDT_NAME: TStringField;
    tblDistrictDT_IS_ACTIVE: TSmallintField;
    qryAgentsAG_IS_ACTIVE: TIntegerField;
    tblAgentsListAG_IS_ACTIVE: TIntegerField;
    qryUsrUS_IS_ACTIVE: TIntegerField;
    spKassaNal: TSQLStoredProc;
    spNalKassa: TSQLStoredProc;
    cdsCust: TClientDataSet;
    qryCustByName: TSQLQuery;
    qryCustByNameAG_ID: TIntegerField;
    qryCustByNameCU_ID: TIntegerField;
    qryCustByNameCU_NAME: TStringField;
    qryCustByNameCU_ID_COMPOUND: TStringField;
    qryCustByNameCU_BONUS_ENABLED: TIntegerField;
    qryCustByNameCU_OKPO: TStringField;
    qryCustByNameCUQ_REG_ID: TIntegerField;
    qryCustByNameCU_INFO: TStringField;
    prvCust: TDataSetProvider;
    cdsCustAG_ID: TIntegerField;
    cdsCustCU_ID: TIntegerField;
    cdsCustCU_NAME: TStringField;
    cdsCustCU_ID_COMPOUND: TStringField;
    cdsCustCU_BONUS_ENABLED: TIntegerField;
    cdsCustCU_OKPO: TStringField;
    cdsCustCUQ_REG_ID: TIntegerField;
    cdsCustCU_INFO: TStringField;
    cdsCustHAS_CUST_UNIQUE: TIntegerField;
    prvCustPhone: TDataSetProvider;
    spDeleteCust: TSQLStoredProc;
    qryCustByOKPO: TSQLQuery;
    IntegerField21: TIntegerField;
    IntegerField22: TIntegerField;
    StringField16: TStringField;
    StringField17: TStringField;
    IntegerField23: TIntegerField;
    StringField18: TStringField;
    IntegerField24: TIntegerField;
    StringField19: TStringField;
    qryCustByPhone: TSQLQuery;
    IntegerField25: TIntegerField;
    IntegerField26: TIntegerField;
    StringField20: TStringField;
    StringField21: TStringField;
    IntegerField27: TIntegerField;
    StringField22: TStringField;
    IntegerField28: TIntegerField;
    StringField23: TStringField;
    qCheckFactNum: TSQLQuery;
    qryFindSdelkaByNumberSD_PAY_VER: TIntegerField;
    qryFindSdelkaByPhoneSD_PAY_VER: TIntegerField;
    qryFindSdelkaByFactNumSD_PAY_VER: TIntegerField;
    qryFindSdelkaByTextSD_PAY_VER: TIntegerField;
    qryFindSdelkaByOKPOSD_PAY_VER: TIntegerField;
    cdsFindSdelkaSD_PAY_VER: TIntegerField;
    cdsFindSdelkaSD_KA_START_DATE: TSQLTimeStampField;
    cdsFindSdelkaSD_KA_END_DATE: TSQLTimeStampField;
    qryFindSdelkaByFactNumSD_KA_START_DATE: TSQLTimeStampField;
    qryFindSdelkaByFactNumSD_KA_END_DATE: TSQLTimeStampField;
    qryFindSdelkaByNumberSD_KA_START_DATE: TSQLTimeStampField;
    qryFindSdelkaByNumberSD_KA_END_DATE: TSQLTimeStampField;
    qryFindSdelkaByPhoneSD_KA_START_DATE: TSQLTimeStampField;
    qryFindSdelkaByPhoneSD_KA_END_DATE: TSQLTimeStampField;
    qryFindSdelkaByTextSD_KA_START_DATE: TSQLTimeStampField;
    qryFindSdelkaByTextSD_KA_END_DATE: TSQLTimeStampField;
    qryFindSdelkaByOKPOSD_KA_START_DATE: TSQLTimeStampField;
    qryFindSdelkaByOKPOSD_KA_END_DATE: TSQLTimeStampField;
    qrySdelkaSD_NUM: TStringField;
    cdsSdelkaSD_NUM: TStringField;
    qryFindSdelkaByNumberSD_NUM: TStringField;
    qryFindSdelkaByPhoneSD_NUM: TStringField;
    qryFindSdelkaByFactNumSD_NUM: TStringField;
    qryFindSdelkaByTextSD_NUM: TStringField;
    qryFindSdelkaByOKPOSD_NUM: TStringField;
    cdsFindSdelkaSD_NUM: TStringField;
    qryChangeAgentTaskSD_NUM: TStringField;
    cdsSdelkaT: TIntegerField;
    cdsSdelkaSD_NEW_CUST: TSmallintField;
    qrySdelkaSD_NEW_CUST: TSmallintField;
    tblRubrikaRB_DELETED: TSmallintField;
    sdsRubrikaSiteDELETED: TSmallintField;
    cdsFindSdelkaSDELKA_IS_OF_CURRENT_USER: TIntegerField;
    qryFindSdelkaByPhoneSDELKA_IS_OF_CURRENT_USER: TIntegerField;
    sdsRubrikaPohozhaGZ_ID: TIntegerField;
    tblRubrikaByGZ: TSimpleDataSet;
    IntegerField29: TIntegerField;
    StringField24: TStringField;
    StringField25: TStringField;
    FloatField5: TFloatField;
    SmallintField8: TSmallintField;
    IntegerField30: TIntegerField;
    StringField26: TStringField;
    SmallintField9: TSmallintField;
    SmallintField10: TSmallintField;
    SmallintField11: TSmallintField;
    qCheckNewIssue: TSQLQuery;
    qUpdFactNum: TSQLQuery;
    IBDB: TIBDatabase;
    IBEvents1: TIBEvents;
    spLogState: TSQLStoredProc;
    cdsCustCU_COMPANY_ID: TIntegerField;
    qryCustByNameCU_COMPANY_ID: TIntegerField;
    qryCustByPhoneCU_COMPANY_ID: TIntegerField;
    qryCustByOKPOCU_COMPANY_ID: TIntegerField;
    qryCustOneCU_COMPANY_ID: TIntegerField;
    cdsCustOneCU_COMPANY_ID: TIntegerField;
    spClearWorkingList: TSQLStoredProc;
    qryCustOneCU_EMAIL: TStringField;
    qryCustOneCU_PASSWORD: TStringField;
    cdsCustOneCU_EMAIL: TStringField;
    cdsCustOneCU_PASSWORD: TStringField;
    qEmail: TSQLQuery;
    qEmailCU_EMAIL: TStringField;
    qryFindSdelkaByNumberCU_COMPANY_ID: TIntegerField;
    qryFindSdelkaByPhoneCU_COMPANY_ID: TIntegerField;
    qryFindSdelkaByFactNumCU_COMPANY_ID: TIntegerField;
    qryFindSdelkaByTextCU_COMPANY_ID: TIntegerField;
    qryFindSdelkaByOKPOCU_COMPANY_ID: TIntegerField;
    cdsFindSdelkaCU_COMPANY_ID: TIntegerField;
    qryUsrUS_ACCOUNT: TStringField;
    qryUsrUS_CAN_BLOCK_COVER: TSmallintField;
	procedure DataModuleCreate(Sender: TObject);
	procedure cdsSdelkaAfterInsert(DataSet: TDataSet);
	procedure cdsSdelkaAfterScroll(DataSet: TDataSet);
	procedure qryFindSdelkaByPhoneSD_ID_COMPOUND_TXTGetText(Sender: TField;
	  var Text: String; DisplayText: Boolean);
	procedure qryFindSdelkaByNumberSD_ID_COMPOUND_TXTGetText(
	  Sender: TField; var Text: String; DisplayText: Boolean);
	procedure qryUsrRightsAfterInsert(DataSet: TDataSet);
	procedure qryIssue3AfterInsert(DataSet: TDataSet);
	procedure tblOtkaznikStaticAfterInsert(DataSet: TDataSet);
	procedure DoUpdateSdelkaViews();
	procedure qryUsrRightsBeforeEdit(DataSet: TDataSet);
	procedure cdsCust_AfterInsert(DataSet: TDataSet);
	procedure cdsCustPhoneAfterInsert(DataSet: TDataSet);
	procedure qryIssueAfterInsert(DataSet: TDataSet);
	procedure cdsCust_ReconcileError(DataSet: TCustomClientDataSet;
	  E: EReconcileError; UpdateKind: TUpdateKind;
	  var Action: TReconcileAction);
	procedure SQLMonitorLogTrace(Sender: TObject; CBInfo: pSQLTRACEDesc);
	procedure cdsSdelkaReconcileError(DataSet: TCustomClientDataSet;
	  E: EReconcileError; UpdateKind: TUpdateKind;
	  var Action: TReconcileAction);
	procedure prvCust_GetTableName(Sender: TObject; DataSet: TDataSet;
	  var TableName: String);
	procedure prvSdelkaGetTableName(Sender: TObject; DataSet: TDataSet;
	  var TableName: String);
	procedure cdsSdelkaAfterRefresh(DataSet: TDataSet);
    procedure cdsSdelkaAfterOpen(DataSet: TDataSet);
	procedure qryAgentsAfterInsert(DataSet: TDataSet);
    procedure qryUsrAfterInsert(DataSet: TDataSet);
    procedure qryUsrAfterScroll(DataSet: TDataSet);
    procedure cdsCust_AfterOpen(DataSet: TDataSet);
    procedure tblParamsAfterPost(DataSet: TDataSet);
    procedure cdsCustOneCU_OKPOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsCust_CalcFields(DataSet: TDataSet);
    procedure qryUsrBeforeApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure cdsFindSdelkaCalcFields(DataSet: TDataSet);
    procedure cdsFindSdelkaAfterScroll(DataSet: TDataSet);
    procedure sdsCheckPhoneInOtkaznikCalcFields(DataSet: TDataSet);
    procedure cdsCustAfterScroll(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure sdsRubrikaPohozhaAfterInsert(DataSet: TDataSet);
    procedure IBEvents1EventAlert(Sender: TObject; EventName: String;
      EventCount: Integer; var CancelAlerts: Boolean);
  private
//	function GetIsAgentLocked: boolean;

  public
	// Может, у нас пользователь - root?
  ReportFolder: string;
	isRoot:boolean;

  procedure LogSdelka(ag_id, sd_id, us_id: integer);
  procedure LogState(objav_id, new_State: integer);
	function nextGeneratorId(GeneratorName:String):integer;
  function readGeneratorValue(GeneratorName:String):integer;
	function executeQuery(AQuery: String):boolean;
	function IsAgentLocked(u: TUser): boolean;
	function getCurrentIssue(gz: integer): integer;
  function GetParamValue(const Param: string): string;
  procedure SetParamValue(const Name,Value:string);
  function IsValidFactNum(fact_num: integer; fact_date: TDate; okpo: string): boolean;

  end;



var
  data: Tdata;
  tr:TTransactionDesc;

const
	// каталог БД по умолчанию
	DefaultDBPath: String = '192.168.10.4:/bd/test/PrInfo.gdb';
  IB_DB  = '192.168.10.4:/bd/ib_db/PrInfo.gdb';
  //IB_DB  = '192.168.10.11:/ib_db/PrInfo.gdb';
  IB_DB1 = '192.168.10.4:/bd/ib_db1/PrInfo.gdb';

	// программа только что запущена, и пользователь ещё не выбран?
	firstTime       :boolean = true;
implementation

uses main, Reconcile, findSdelka, accessRights, DateUtils, SqlTimSt;

{$R *.dfm}

procedure Tdata.LogState(objav_id, new_State: integer);
begin
    spLogState.Close;
    spLogState.ParamByName('ob_id').AsInteger := objav_id;
    spLogState.ParamByName('us_id').AsInteger := frmMain.currentUser;
    spLogState.ParamByName('new_state').AsInteger := new_State;
    spLogState.ExecProc;
end;

procedure Tdata.LogSdelka(ag_id, sd_id, us_id: integer);
var Q: TSQLQuery;
begin
   // Сначала проверим нет ли уже записи с таким статусом
    Q := TSQLQuery.Create(nil);
    Q.SQLConnection := connection;

    Q.SQL.Append('EXECUTE PROCEDURE LOG_SDELKA_CHANGES(:ag_id, :sd_id, :us_id)');
    Q.ParamByName('ag_id').AsInteger := ag_id;
    Q.ParamByName('sd_id').AsInteger := sd_id;
    Q.ParamByName('us_id').AsInteger := us_id;
    Q.ExecSQL();

    FreeAndNil(Q);
end;

function Tdata.GetParamValue(const Param: string): string;
var Q:TSQLQuery;
begin
    Q := TSQLQuery.Create(nil);
    Q.SQLConnection := connection;
    Q.SQL.Append('SELECT * FROM PARAMS');
    Q.Open;

    if (Q.FindField(Param) = nil)
    then result := ''
    else result := Q.FindField(Param).AsString;
    
    FreeAndNil(Q)
end;

procedure Tdata.SetParamValue(const Name, Value: string);
var Q:TSQLQuery;
begin
    Q := TSQLQuery.Create(nil);
    Q.SQLConnection := connection;
    Q.SQL.Append('UPDATE PARAMS SET ' + Name + '= :value');
    q.ParamByName('value').AsString := Value;
    Q.ExecSQL();
    FreeAndNil(q);
end;

procedure Tdata.DataModuleCreate(Sender: TObject);
begin
	if (connection.Connected) then connection.Close;

	// Прописываем путь к БД

  if pos('ib_db1', ParamStr(1)) > 0
       then begin
              connection.Params.Values['Database'] := IB_DB1;
              IBDB.DatabaseName := IB_DB1;
       end
    else if pos('ib_db', ParamStr(1)) > 0
          then begin
               connection.Params.Values['Database'] := IB_DB;
               IBDB.DatabaseName := IB_DB;
          end
       else if pos('test', ParamStr(1)) > 0
            then begin
                   connection.Params.Values['Database'] := DefaultDBPath;
                   IBDB.DatabaseName := DefaultDBPath;
            end
          else begin
              Application.Terminate;
          end;

  if not connection.Connected then
  begin
       try
        connection.Connected := true;
        IBDB.Connected := true;
       except
          Application.Terminate;
       end
  end;

	// Наша транзакция по умолчанию
	tr.TransactionID := 1;
	tr.IsolationLevel := xilREADCOMMITTED;

  // Проверим есть ли у пользователя файл с отчетами
 // self.ReportFolder := 'E:\Programs\prinfo\trunk\prInfo2\prInfo.rav';
  ReportFolder := GetParamValue('PM_REPORT_PATH'); // '\\192.168.10.4\shared\Rep\';
  //CheckReport(ReportFolder);
end;

function Tdata.nextGeneratorId(GeneratorName: String): integer;
var qry:TSQLQuery;
begin
	qry:=nil;

	try
		Result := -1;
		qry:=TSQLQuery.Create(nil);
		qry.SQLConnection := connection;
		qry.SQL.Add('SELECT GEN_ID(' + GeneratorName + ',1) AS ID FROM rdb$database');
		qry.Open;
		Result := qry.FieldByName('ID').AsInteger;
	finally
		if (Assigned(qry)) then
			qry.Free;
	end;
end;

function Tdata.readGeneratorValue(GeneratorName: String): integer;
var qry:TSQLQuery;
begin
	qry:=nil;

	try
		Result := -1;
		qry:=TSQLQuery.Create(nil);
		qry.SQLConnection := connection;
		qry.SQL.Add('SELECT GEN_ID(' + GeneratorName + ',0) AS ID FROM rdb$database');
		qry.Open;
		Result := qry.FieldByName('ID').AsInteger;
	finally
		if (Assigned(qry)) then
			qry.Free;
	end;
end;

// После добавления новой сделки нужно проставить значения полей по умолчанию.
procedure Tdata.cdsSdelkaAfterInsert(DataSet: TDataSet);
begin
	cdsSdelkaAG_ID.Value		:= cdsAgentAG_ID.Value;
	cdsSdelkaSD_ID.Value		:= nextGeneratorId('G_SD_ID');//spNextSD_ID.ParamByName('NEXT_SD_ID').Value;
	cdsSdelkaPT_ID.Value		:= 1;
	cdsSdelkaSD_TYPE.Value		:= SD_TYPE_GAZETA;
	cdsSdelkaSD_STATE.Value		:= 1;
	cdsSdelkaSD_SKIDKA.Value	:= 0;
	cdsSdelkaGZ_ID.Value		:= 1;
	cdsSdelkaSD_ALL_PAYED.Value	:= 0;
end;


// После изменения позиции курсора в списке сделок, нужно
// разрешить/запретить некоторые кнопки и обновить окошко
// просмотра сделки в правой части главного окна
procedure Tdata.cdsSdelkaAfterScroll(DataSet: TDataSet);
begin
	if (frmMain.updateSdelkaViews) then
	begin
		if (((frmMain.pages.ActivePage = frmMain.tbAgent) and (frmMain.sdelkaView.Visible))or
			((frmMain.pages.ActivePage = frmMain.tbManager) and (frmMain.sdelkaViewForManager.Visible))) then
			DoUpdateSdelkaViews();

		if (frmMain.pages.ActivePage = frmMain.tbManager) then
		begin
			if (cdsSdelkaSD_STATE.AsInteger = SD_READY) then
			begin
				frmMain.btApprove.Enabled := true;
				frmMain.btApprove.Caption := 'Подтвердить';
			end
			else if (cdsSdelkaAS_ID.AsInteger = 1) then
			begin
				frmMain.btApprove.Enabled := true;
				frmMain.btApprove.Caption := 'Что изменилось?';
			end
			else
				frmMain.btApprove.Enabled := false;
		end;
	end;
end;


// Составляем текст кода сделки в виде <Код агента>-<Код сделки>
procedure Tdata.qryFindSdelkaByPhoneSD_ID_COMPOUND_TXTGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
	Text := Sender.DataSet.FieldByName('AG_ID').AsString + '-' + Sender.DataSet.FieldByName('SD_ID').AsString;
end;


// Составляем текст кода сделки в виде <Код агента>-<Код сделки>
procedure Tdata.qryFindSdelkaByNumberSD_ID_COMPOUND_TXTGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
	Text := Sender.DataSet.FieldByName('AG_ID').AsString + '-' + Sender.DataSet.FieldByName('SD_ID').AsString;
end;


procedure Tdata.qryUsrRightsAfterInsert(DataSet: TDataSet);
begin
	qryUsrRightsUS_ID.Value := qryUsrUS_ID.Value;
end;


procedure Tdata.qryIssue3AfterInsert(DataSet: TDataSet);
begin
	qryIssueGZ_ID.Value := qryIssue.Params.ParamByName('GZ_ID').Value;
end;


procedure Tdata.tblOtkaznikStaticAfterInsert(DataSet: TDataSet);
begin
	tblOtkaznikStaticOT_IS_STATIC.Value := 1;
end;

// Обновляем "окошки" просмотра сделки в правой части главного окна
// у менеджера и агента
procedure Tdata.DoUpdateSdelkaViews();
begin
	if {( }   (frmMain.pages.ActivePage = frmMain.tbAgent)
	 {	and (   (frmMain.sdelkaView.AgentId <> data.cdsSdelka.FieldByName('AG_ID').AsInteger)
			 or (frmMain.sdelkaView.SdelkaId <> data.cdsSdelka.FieldByName('SD_ID').AsInteger))) }then
	begin
		frmMain.sdelkaView.setSdelka(  data.cdsSdelka.FieldByName('AG_ID').AsInteger
			, data.cdsSdelka.FieldByName('SD_ID').AsInteger
			, uAgent
			, true)
	end

	else if {( }   (frmMain.pages.ActivePage = frmMain.tbManager)
			{ and (   (frmMain.sdelkaViewForManager.AgentId <> data.cdsSdelka.FieldByName('AG_ID').AsInteger)
				  or (frmMain.sdelkaViewForManager.SdelkaId <> data.cdsSdelka.FieldByName('SD_ID').AsInteger)))} then
	begin
		frmMain.sdelkaViewForManager.setSdelka(data.cdsSdelkaAG_ID.AsInteger
			, data.cdsSdelkaSD_ID.AsInteger
			, uManager
			, true);
	end;
end;


// Можно редактировать права доступа к агентам только для текущего пользователя
procedure Tdata.qryUsrRightsBeforeEdit(DataSet: TDataSet);
begin
	if ((not frmMain.isRoot) and (data.qryUsrUS_ID.Value <> frmMain.currentUser)) then
	begin
		MessageDlg('Вы не имеете прав для редактирования прав этого пользователя', mtError, [mbOk], 0);
		abort;
	end;
end;


// После добавления клиента в список, проставим значения полей-ссылок
// и значения полей по умолчанию
procedure Tdata.cdsCust_AfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('AG_ID').Value := dsAgent.DataSet.FieldByName('AG_ID').Value;
	DataSet.FieldByName('CU_ID').Value := nextGeneratorId('G_CU_ID');
end;


procedure Tdata.cdsCustPhoneAfterInsert(DataSet: TDataSet);
begin
	DataSet.FieldByName('AG_ID').Value := dsCust.DataSet.FieldByName('AG_ID').Value;
	DataSet.FieldByName('CU_ID').Value := dsCust.DataSet.FieldByName('CU_ID').Value;
end;


procedure Tdata.qryIssueAfterInsert(DataSet: TDataSet);
begin
	qryIssueGZ_ID.Value := qryIssue.Params.ParamByName('GZ_ID').Value;
	qryIssueIS_ID.Value := nextGeneratorId('G_IS_ID');
end;


// Произошла ошибка при сохранении данных в БД?
// - Вызовем стандартный диалог.
procedure Tdata.cdsCust_ReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
var
	rsn:String;
begin
	if (data.connection.InTransaction) then data.connection.Rollback(tr);

	if ((UpdateKind = ukDelete)and(DataSet = cdsCust)) then
		rsn := 'Возможно, для этого клиента есть сделки.';
	Action := HandleReconcileError(DataSet, UpdateKind, E, rsn);
end;


procedure Tdata.SQLMonitorLogTrace(Sender: TObject; CBInfo: pSQLTRACEDesc);
begin

 {	if (frmMain.cbLogTrace.Checked) then
	begin
//		frmMain.mmLogTrace.Lines.Assign(SQLMonitor.TraceList);
//		if (   (CBInfo.eTraceCat or traceQEXECUTE)
//			or (traceTRANSACT in CBInfo.eTraceCat)
//			or (traceDATAIN in CBInfo.eTraceCat)
//			) then
		begin
			qryAddQueryLog.ParamByName('US_ID').AsInteger := frmMain.currentUser;
			if (CBInfo.eTraceCat = traceDATAIN) then
				qryAddQueryLog.ParamByName('QL_QUERY').AsString := 'PARAMS: ' + CBInfo.pszTrace
			else
				qryAddQueryLog.ParamByName('QL_QUERY').AsString := CBInfo.pszTrace;
//			frmMain.Memo1.Lines.Add('--');
//			frmMain.Memo1.Lines.Add(CBInfo.pszTrace);
		end;
	end;}
end;


// Ошибка при сохранении данных в БД?
// - Вызываем стандартный диалог.
procedure Tdata.cdsSdelkaReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
var
    rsn:String;
begin
    if (data.connection.InTransaction) then
        data.connection.Rollback(tr);

    if (UpdateKind = ukDelete) then
        rsn := 'Возможно, сделка уже оплачена или подтверждена менеджером.';
	Action := HandleReconcileError(DataSet, UpdateKind, E, rsn);
end;


// Когда запрос возвращает результат объединением из нескольких
// таблиц или вызовом процедуры, то Провайдер не знает, в какую
// таблицу писать изменения. Скажем ему:
procedure Tdata.prvCust_GetTableName(Sender: TObject; DataSet: TDataSet;
  var TableName: String);
begin
    if ((DataSet = qryCustByName) or (DataSet = qryCustByPhone) or (DataSet = qryCustByOKPO)) then
        TableName := 'CUST'
    else if (DataSet = qryCustPhone) then
        TableName := 'CUST_PHONE'
    else
        raise Exception.Create('Попытка обновления неизвестной таблицы.');
end;


// Когда запрос возвращает результат объединением из нескольких
// таблиц или вызовом процедуры, то Провайдер не знает, в какую
// таблицу писать изменения. Скажем ему:
procedure Tdata.prvSdelkaGetTableName(Sender: TObject; DataSet: TDataSet; var TableName: String);
begin
	TableName := 'SDELKA';
end;


// Чтобы все окошки-кнопочки обновились...
procedure Tdata.cdsSdelkaAfterRefresh(DataSet: TDataSet);
begin
	cdsSdelkaAfterScroll(cdsSdelka);
end;


// Чтобы все окошки-кнопочки обновились...
procedure Tdata.cdsSdelkaAfterOpen(DataSet: TDataSet);
begin
	cdsSdelkaAfterScroll(cdsSdelka);
end;


procedure Tdata.qryAgentsAfterInsert(DataSet: TDataSet);
begin
	qryAgentsAG_ID.AsInteger := nextGeneratorId('G_AG_ID');
	// Ставим по умолчанию телефоны, которые будут на счёте-фактуре писаться
	qryAgentsAG_FACTURA_PHONES.Value := tblParamsPM_DEFAULT_FACTURA_PHONES.Value;
end;

procedure Tdata.qryUsrAfterInsert(DataSet: TDataSet);
begin
	qryUsrUS_ID.AsInteger := nextGeneratorId('G_US_ID');
    qryUsrUS_DISK_ID.AsInteger := 0;
    qryUsrUS_OFFICE_NAME.AsString := '';
    qryUsrUS_AUTO_REFRESH.AsInteger := 0;
end;


// Бывали глюки с обновлением этого списка
procedure Tdata.qryUsrAfterScroll(DataSet: TDataSet);
begin
	if (qryUsrRights.Active) then qryUsrRights.Refresh;
end;


procedure Tdata.cdsCust_AfterOpen(DataSet: TDataSet);
begin
  if (not cdsCust.Eof) then cdsCust.FetchDetails;
end;


// Сразу же и запишем измененя в БД
procedure Tdata.tblParamsAfterPost(DataSet: TDataSet);
begin
	(DataSet as TSimpleDataSet).ApplyUpdates(0);
end;


// ОКПО у меня назначен как CHAR, а не VARCHAR, и после циферей несмотря
// ни на какие мучения появляются доп. пробелы до размера поля
procedure Tdata.cdsCustOneCU_OKPOGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
	Text := trim(Sender.AsString);
end;


// Есть ли у тебя, дорогой клиент, запись в таблице CUST_UNIQUE?
procedure Tdata.cdsCust_CalcFields(DataSet: TDataSet);
begin
	DataSet.FieldByName('HAS_CUST_UNIQUE').AsInteger := ord(not DataSet.FieldByName('CUQ_REG_ID').IsNull);
end;


// О, а вот тут помедленнее: мы хотим себе залогить, кто и что у нас со списокм
// пользователей делает!
procedure Tdata.qryUsrBeforeApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
begin
	// попробуем вести лог того, какой именно пользователь и
	// с какого компьютера вносит изменения. Но учтём, что
	// в БД может не быть процедуры для ведения этого лога.
	try
		spLogUser.Params.ParamByName('EDITORNAME').AsString := IntToStr(frmMain.currentUser);
		spLogUser.Params.ParamByName('EDITORADDR').AsString := getLocalHostName();
		spLogUser.ExecProc;
	except

	end;
end;



procedure Tdata.cdsFindSdelkaCalcFields(DataSet: TDataSet);
begin
	if (data.cdsAgentAG_ID.AsInteger=DataSet.FieldByName('AG_ID').AsInteger) then
		DataSet.FieldByName('SDELKA_IS_OF_CURRENT_AGENT').Value := 1
	else
		DataSet.FieldByName('SDELKA_IS_OF_CURRENT_AGENT').Value := 0;
end;


// А вас, Штирлиц, я попрошу задержаться! После измения текущей сделки в
// окне поиска - заново применим правила, ибо кое-что зависит от того,
// какая сделка выбрана в этом окне. А точнее - принадлежит ли она текущему
// ползователю.
procedure Tdata.cdsFindSdelkaAfterScroll(DataSet: TDataSet);
begin
	TAccessRightsManager.SetWindowAccessState(frmFindSdelka.User,frmFindSdelka);
	TAccessRightsManager.SetWindowAccessState(int2user(frmMain.currentUserType),frmMain.pnlPayments);
end;

procedure Tdata.sdsCheckPhoneInOtkaznikCalcFields(DataSet: TDataSet);
begin
    if (DataSet.FieldByName('OT_IS_STATIC').AsInteger = 1) then
        DataSet.FieldByName('OT_CALC_DESCRIPTION').AsString :=
                    'Постоянно в отказнике, комментарий: ' + DataSet.FieldByName('OT_COMMENT').AsString
    else
        DataSet.FieldByName('OT_CALC_DESCRIPTION').AsString :=
                    'В отказнике, ' + DataSet.FieldByName('AG_NAME').AsString;
end;

function Tdata.executeQuery(AQuery: String): boolean;
var
	qry: TSQLQuery;
begin
  result := true;
	qry := nil;

	try
		qry := TSQLQuery.Create(self);
		qry.SQLConnection := connection;

		qry.SQL.Text := AQuery;
		qry.ExecSQL(true);
	finally
		if (Assigned(qry)) then
			qry.Free;
	end;
end;

function Tdata.IsAgentLocked(u: TUser): boolean;
begin
  Result := false;
	if (   not qryCheckAgentLocked.Active
		or (qryCheckAgentLocked.ParamByName('AG_ID').AsInteger <> cdsAgentAG_ID.Value)) then

	if (   (   (qryCheckAgentLockedAG_LOCK_RUBRIKAS.AsInteger = 1)
			and (u <> uNabor) and (u <> uCorrector)
		   )
		or (    (tblParamsPM_LOCK_RUBRIKAS_VYPUSK.AsInteger = 1)
			and ((u = uNabor) or (u = uCorrector))
		   )
	   ) then
		Result := true
	else
		Result := false;
end;

function Tdata.getCurrentIssue(gz: integer): integer;
begin
	if (gz = GZ_PR) then
		Result := tblParamsPM_CURRENT_ISSUE_PR.AsInteger
	else if (gz = GZ_NS) then
		Result := tblParamsPM_CURRENT_ISSUE_NS.AsInteger
	else if (gz = GZ_ST) then
		Result := tblParamsPM_CURRENT_ISSUE_SR.AsInteger
	else if (gz = GZ_RZ) then
		Result := tblParamsPM_CURRENT_ISSUE_RZ.AsInteger
	else if (gz = GZ_RK) then
		Result := tblParamsPM_CURRENT_ISSUE_RK.AsInteger
	else begin
    //result := 0;
		raise Exception.Create('Неправильный ID газеты!');
  end;
end;

procedure Tdata.cdsCustAfterScroll(DataSet: TDataSet);
begin
    cdsCustPhone.Close;
    cdsCustPhone.FetchParams;
    cdsCustPhone.Params.ParamByName('AG_ID').AsInteger := cdsCustAG_ID.AsInteger;
    cdsCustPhone.Params.ParamByName('CU_ID').AsInteger := cdsCustCU_ID.AsInteger;
    cdsCustPHone.Open;
end;

function Tdata.IsValidFactNum(fact_num: integer; fact_date: TDate; okpo: string): boolean;
begin
    if fact_date = 0 then fact_date := Now;
    qCheckFactNum.Close;
    qCheckFactNum.ParamByName('ds').AsSQLTimeStamp := DateTimeToSQLTimeStamp(StartOfTheMonth(fact_date));
    qCheckFactNum.ParamByName('de').AsSQLTimeStamp := DateTimeToSQLTimeStamp(EndOfTheMonth(fact_date));
    qCheckFactNum.ParamByName('fact_num').AsInteger := fact_num;
    qCheckFactNum.ParamByName('okpo').AsString := okpo;
    qCheckFactNum.Open;
    if qCheckFactNum.Fields[0].AsInteger > 0 then result := false else result := true;
end;

procedure Tdata.DataModuleDestroy(Sender: TObject);
begin
    connection.Connected := false;
end;

procedure Tdata.sdsRubrikaPohozhaAfterInsert(DataSet: TDataSet);
begin
   sdsRubrikaPohozhaGZ_ID.AsInteger := frmmain.dblRP_Gazeta.KeyValue;
end;

procedure Tdata.IBEvents1EventAlert(Sender: TObject; EventName: String; EventCount: Integer; var CancelAlerts: Boolean);
begin
     { if EventName = 'TEXT_CHANGED' then
      begin
          if (frmMain.pages.ActivePage = frmMain.tbNabor) and (frmMain.grSdelkaForNabor.DataSource.DataSet.Active) then
              frmMain.grSdelkaForNabor.DataSource.DataSet.Refresh;
      end
      else if EventName = 'MODULE_CHANGED' then
      begin
          if (frmMain.pages.ActivePage = frmMain.tbDesign) and frmMain.grSdelkaForDesign.DataSource.DataSet.Active then
              frmMain.grSdelkaForDesign.DataSource.DataSet.Refresh
      end; }
end;

end.
