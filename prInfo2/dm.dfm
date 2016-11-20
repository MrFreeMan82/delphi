object data: Tdata
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 631
  Top = 167
  Height = 868
  Width = 1091
  object cdsSdelka: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'prvSdelka'
    AfterOpen = cdsSdelkaAfterOpen
    AfterInsert = cdsSdelkaAfterInsert
    AfterScroll = cdsSdelkaAfterScroll
    AfterRefresh = cdsSdelkaAfterRefresh
    OnReconcileError = cdsSdelkaReconcileError
    Left = 205
    Top = 104
    object cdsSdelkaAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Origin = 'DB.SDELKA.AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsSdelkaSD_ID: TIntegerField
      FieldName = 'SD_ID'
      Origin = 'DB.SDELKA.SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsSdelkaSD_TYPE: TSmallintField
      FieldName = 'SD_TYPE'
      Origin = 'DB.SDELKA.SD_TYPE'
    end
    object cdsSdelkaSD_STATE: TSmallintField
      FieldName = 'SD_STATE'
      Origin = 'DB.SDELKA.SD_STATE'
    end
    object cdsSdelkaCU_ID: TIntegerField
      FieldName = 'CU_ID'
      Origin = 'DB.SDELKA.CU_ID'
    end
    object cdsSdelkaSD_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SD_SUM'
      Origin = 'DB.SDELKA.SD_SUM'
      DisplayFormat = '0.00'
    end
    object cdsSdelkaSD_PERCENT: TFloatField
      DisplayLabel = #1055#1088#1086#1094#1077#1085#1090
      FieldName = 'SD_PERCENT'
      Origin = 'DB.SDELKA.SD_PERCENT'
      DisplayFormat = '0.##'
    end
    object cdsSdelkaSD_SUM_DEFAULT: TFloatField
      FieldName = 'SD_SUM_DEFAULT'
      Origin = 'DB.SDELKA.SD_SUM_DEFAULT'
      DisplayFormat = '0.00'
    end
    object cdsSdelkaSD_PERCENT_DEFAULT: TFloatField
      FieldName = 'SD_PERCENT_DEFAULT'
      Origin = 'DB.SDELKA.SD_PERCENT_DEFAULT'
      DisplayFormat = '0.##'
    end
    object cdsSdelkaSD_SKIDKA: TFloatField
      FieldName = 'SD_SKIDKA'
      Origin = 'DB.SDELKA.SD_SKIDKA'
      DisplayFormat = '0.##'
    end
    object cdsSdelkaPT_ID: TSmallintField
      FieldName = 'PT_ID'
      Origin = 'DB.SDELKA.PT_ID'
    end
    object cdsSdelkaSD_ID_COMPOUND: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'SD_ID_COMPOUND'
      Origin = 'DB.SDELKA.AG_ID'
      ProviderFlags = []
      ReadOnly = True
      Size = 23
    end
    object cdsSdelkaGZ_ID: TSmallintField
      DisplayLabel = #1043#1072#1079#1077#1090#1072
      FieldName = 'GZ_ID'
      Origin = 'DB.SDELKA.GZ_ID'
    end
    object cdsSdelkaSD_SUM_PAYED: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'SD_SUM_PAYED'
      Origin = 'DB.SDELKA.SD_SUM_PAYED'
      DisplayFormat = '0.00'
    end
    object cdsSdelkaSD_ALL_PAYED: TSmallintField
      DisplayLabel = #1057#1076#1077#1083#1082#1072' '#1086#1087#1083#1072#1095#1077#1085#1072
      FieldName = 'SD_ALL_PAYED'
      Origin = 'DB.SDELKA.SD_ALL_PAYED'
    end
    object cdsSdelkaSD_COMMENT_SHORT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'SD_COMMENT_SHORT'
      Origin = 'DB.SDELKA.SD_COMMENT_SHORT'
      Size = 128
    end
    object cdsSdelkaAS_ID: TSmallintField
      FieldName = 'AS_ID'
      Origin = 'DB.SDELKA.AS_ID'
    end
    object cdsSdelkaSD_PAY_NOW: TSmallintField
      FieldName = 'SD_PAY_NOW'
      Origin = 'DB.SDELKA.SD_PAY_NOW'
    end
    object cdsSdelkaSD_FACT_NUM: TIntegerField
      DisplayLabel = #1057#1095#1105#1090
      FieldName = 'SD_FACT_NUM'
      Origin = 'DB.SDELKA.SD_FACT_NUM'
    end
    object cdsSdelkaSD_KA_START_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_START_DATE'
      Origin = 'DB.SDELKA.SD_KA_START_DATE'
    end
    object cdsSdelkaSD_KA_END_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_END_DATE'
      Origin = 'DB.SDELKA.SD_KA_END_DATE'
    end
    object cdsSdelkaSD_FACT_DATE: TSQLTimeStampField
      FieldName = 'SD_FACT_DATE'
      Origin = 'DB.SDELKA.SD_FACT_DATE'
    end
    object cdsSdelkaSD_PERCENT_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1088#1086#1094#1077#1085#1090#1072
      FieldName = 'SD_PERCENT_SUM'
      ProviderFlags = []
      DisplayFormat = '0.00'
    end
    object cdsSdelkaSD_PERCENT_GIVEN: TSmallintField
      DisplayLabel = #1055#1088#1086#1094#1077#1085#1090' '#1074#1099#1076#1072#1085
      FieldName = 'SD_PERCENT_GIVEN'
    end
    object cdsSdelkaSD_TO_GIVE_PERCENT: TSmallintField
      DisplayLabel = #1042#1099#1076#1072#1090#1100' '#1087#1088#1086#1094#1077#1085#1090
      FieldName = 'SD_TO_GIVE_PERCENT'
      ProviderFlags = []
    end
    object cdsSdelkaCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      ProviderFlags = []
      Size = 128
    end
    object cdsSdelkaPODACHA_NUMS: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088#1072
      FieldName = 'PODACHA_NUMS'
      ProviderFlags = []
      Size = 128
    end
    object cdsSdelkaSDS_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldKind = fkLookup
      FieldName = 'SDS_NAME'
      LookupDataSet = tblSdelkaState
      LookupKeyFields = 'SDS_ID'
      LookupResultField = 'SDS_NAME'
      KeyFields = 'SD_STATE'
      ProviderFlags = []
      Size = 64
      Lookup = True
    end
    object cdsSdelkaGZ_NAME: TStringField
      DisplayLabel = #1043#1072#1079#1077#1090#1072
      FieldName = 'GZ_NAME'
      ProviderFlags = []
      Size = 64
    end
    object cdsSdelkaPT_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099
      FieldName = 'PT_NAME'
      ProviderFlags = []
      Size = 64
    end
    object cdsSdelkaAS_NAME: TStringField
      DisplayLabel = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077
      FieldName = 'AS_NAME'
      ProviderFlags = []
      Size = 64
    end
    object cdsSdelkaSD_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'SD_COMMENT'
      Size = 1024
    end
    object cdsSdelkaFM_ID: TIntegerField
      FieldName = 'FM_ID'
      ProviderFlags = []
    end
    object cdsSdelkaRB_ID: TIntegerField
      FieldName = 'RB_ID'
      ProviderFlags = []
    end
    object cdsSdelkaRB_NAME_LK: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldKind = fkLookup
      FieldName = 'RB_NAME_LK'
      LookupDataSet = tblRubrika
      LookupKeyFields = 'RB_ID'
      LookupResultField = 'RB_NAME_SHORT'
      KeyFields = 'RB_ID'
      LookupCache = True
      ProviderFlags = []
      Lookup = True
    end
    object cdsSdelkaFM_NAME_LK: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldKind = fkLookup
      FieldName = 'FM_NAME_LK'
      LookupDataSet = tblFormat
      LookupKeyFields = 'FM_ID'
      LookupResultField = 'FM_NAME'
      KeyFields = 'FM_ID'
      ProviderFlags = []
      Lookup = True
    end
    object cdsSdelkaRB_IS_LOCKABLE: TFMTBCDField
      DisplayLabel = #1055#1088#1080#1086#1088#1080#1090#1077#1090
      FieldName = 'RB_IS_LOCKABLE'
      ProviderFlags = []
      Precision = 15
      Size = 0
    end
    object cdsSdelkaSR_IS_CURRENT_ISSUE: TIntegerField
      DisplayLabel = #1058#1077#1082'. '#8470' '#1057#1058
      FieldName = 'SR_IS_CURRENT_ISSUE'
      ProviderFlags = []
    end
    object cdsSdelkaSD_TYPE_DESC: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'SD_TYPE_DESC'
      ProviderFlags = []
      Size = 10
    end
    object cdsSdelkaSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
    object cdsSdelkaT: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'T'
      Calculated = True
    end
    object cdsSdelkaSD_NEW_CUST: TSmallintField
      FieldName = 'SD_NEW_CUST'
    end
  end
  object dsSdelka: TDataSource
    DataSet = cdsSdelka
    Left = 261
    Top = 104
  end
  object dsAgent: TDataSource
    DataSet = cdsAgent
    Left = 197
    Top = 56
  end
  object dsCust: TDataSource
    DataSet = cdsCust
    Left = 197
    Top = 160
  end
  object dsCustPhone: TDataSource
    DataSet = cdsCustPhone
    Left = 223
    Top = 360
  end
  object dsIssue: TDataSource
    DataSet = qryIssue
    Left = 373
    Top = 368
  end
  object dsRubrika: TDataSource
    DataSet = tblRubrika
    Left = 373
    Top = 223
  end
  object tblFormat: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'SELECT * FROM FORMAT'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 317
    Top = 180
    object tblFormatFM_ID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'FM_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tblFormatFM_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'FM_NAME'
      Required = True
      Size = 128
    end
    object tblFormatFM_SPACE: TFloatField
      DisplayLabel = #1055#1083#1086#1097#1072#1076#1100
      FieldName = 'FM_SPACE'
      DisplayFormat = '0.##'
    end
    object tblFormatFM_HAS_PICTURE: TSmallintField
      DisplayLabel = #1052#1086#1076#1091#1083#1100
      FieldName = 'FM_HAS_PICTURE'
      Required = True
    end
    object tblFormatFM_PICTURE_SIZES: TStringField
      DisplayLabel = #1056#1072#1079#1084#1077#1088#1099' '#1084#1086#1076#1091#1083#1077#1081
      FieldName = 'FM_PICTURE_SIZES'
      Size = 128
    end
  end
  object dsFormat: TDataSource
    DataSet = tblFormat
    Left = 373
    Top = 180
  end
  object tblPayType: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'PAY_TYPE'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 317
    Top = 94
    object tblPayTypePT_ID: TIntegerField
      FieldName = 'PT_ID'
      Required = True
    end
    object tblPayTypePT_NAME: TStringField
      FieldName = 'PT_NAME'
      Size = 64
    end
  end
  object dsPayType: TDataSource
    DataSet = tblPayType
    Left = 373
    Top = 94
  end
  object spCountSum: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SUMMA'
        ParamType = ptOutput
        Size = 8
      end>
    SQLConnection = connection
    StoredProcName = 'COUNT_SUM'
    Left = 869
    Top = 56
  end
  object spCountPercent: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PERCENT'
        ParamType = ptOutput
        Size = 8
      end>
    SQLConnection = connection
    StoredProcName = 'COUNT_PERCENT'
    Left = 869
    Top = 104
  end
  object tblGazeta: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'GAZETA'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 317
    Top = 266
    object tblGazetaGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
      Required = True
    end
    object tblGazetaGZ_NAME: TStringField
      FieldName = 'GZ_NAME'
      Size = 64
    end
    object tblGazetaGZ_NAME_SHORT: TStringField
      FieldName = 'GZ_NAME_SHORT'
      Size = 64
    end
  end
  object dsGazeta: TDataSource
    DataSet = tblGazeta
    Left = 373
    Top = 266
  end
  object spGetIssueId: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'GZ_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IS_NAME'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IS_YEAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IS_ID'
        ParamType = ptOutput
        Size = 4
      end
      item
        DataType = ftString
        Name = 'IS_NAME_COMPOSED'
        ParamType = ptOutput
        Size = 50
      end>
    SQLConnection = connection
    StoredProcName = 'GET_ISSUE_ID'
    Left = 869
    Top = 8
  end
  object spApproveSdelka: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'US_ID'
        ParamType = ptInput
      end>
    SQLConnection = connection
    StoredProcName = 'APPROVE_SDELKA'
    Left = 869
    Top = 200
  end
  object tblParams: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'PARAMS'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    AfterPost = tblParamsAfterPost
    Left = 157
    Top = 8
    object tblParamsPM_FIRST_OTKAZNIK_ISSUE_PR: TIntegerField
      FieldName = 'PM_FIRST_OTKAZNIK_ISSUE_PR'
      Required = True
    end
    object tblParamsPM_FIRST_OTKAZNIK_ISSUE_NS: TIntegerField
      FieldName = 'PM_FIRST_OTKAZNIK_ISSUE_NS'
      Required = True
    end
    object tblParamsPM_FIRST_OTKAZNIK_ISSUE_SR: TIntegerField
      FieldName = 'PM_FIRST_OTKAZNIK_ISSUE_SR'
      Required = True
    end
    object tblParamsPM_MIN_BONUS_SUM: TFloatField
      FieldName = 'PM_MIN_BONUS_SUM'
      DisplayFormat = '0.##'
    end
    object tblParamsPM_BONUS_PERCENT: TFloatField
      FieldName = 'PM_BONUS_PERCENT'
      DisplayFormat = '0.##'
    end
    object tblParamsPM_CURRENT_ISSUE_PR: TIntegerField
      FieldName = 'PM_CURRENT_ISSUE_PR'
      Required = True
    end
    object tblParamsPM_CURRENT_ISSUE_NS: TIntegerField
      FieldName = 'PM_CURRENT_ISSUE_NS'
      Required = True
    end
    object tblParamsPM_CURRENT_ISSUE_SR: TIntegerField
      FieldName = 'PM_CURRENT_ISSUE_SR'
      Required = True
    end
    object tblParamsPM_ROOT_DISK_ID: TStringField
      FieldName = 'PM_ROOT_DISK_ID'
    end
    object tblParamsPM_DO_CHECK_DISK: TSmallintField
      FieldName = 'PM_DO_CHECK_DISK'
    end
    object tblParamsPM_SYNC_STATE: TIntegerField
      FieldName = 'PM_SYNC_STATE'
      Required = True
    end
    object tblParamsPM_GAZETA_OUTPUT_PATH: TStringField
      DisplayLabel = #1055#1091#1090#1100' '#1074#1099#1074#1086#1076#1072' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1081
      FieldName = 'PM_GAZETA_OUTPUT_PATH'
      Required = True
      Size = 128
    end
    object tblParamsPM_CLOSEDATE_PR_OLD: TSQLTimeStampField
      FieldName = 'PM_CLOSEDATE_PR_OLD'
    end
    object tblParamsPM_CLOSEDATE_PR_NEW: TSQLTimeStampField
      FieldName = 'PM_CLOSEDATE_PR_NEW'
    end
    object tblParamsPM_CLOSEDATE_NS_OLD: TSQLTimeStampField
      FieldName = 'PM_CLOSEDATE_NS_OLD'
    end
    object tblParamsPM_CLOSEDATE_NS_NEW: TSQLTimeStampField
      FieldName = 'PM_CLOSEDATE_NS_NEW'
    end
    object tblParamsPM_CLOSEDATE_SR_OLD: TSQLTimeStampField
      FieldName = 'PM_CLOSEDATE_SR_OLD'
    end
    object tblParamsPM_CLOSEDATE_SR_NEW: TSQLTimeStampField
      FieldName = 'PM_CLOSEDATE_SR_NEW'
    end
    object tblParamsPM_DEFAULT_FACTURA_PHONES: TStringField
      FieldName = 'PM_DEFAULT_FACTURA_PHONES'
      Size = 64
    end
    object tblParamsPM_LOCK_RUBRIKAS_VYPUSK: TSmallintField
      DisplayLabel = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1088#1091#1073#1088#1080#1082#1080' '#1076#1083#1103' '#1042#1099#1087#1091#1089#1082#1072#1102#1097#1077#1075#1086' '#1086#1090#1076#1077#1083#1072
      FieldName = 'PM_LOCK_RUBRIKAS_VYPUSK'
      Required = True
    end
    object tblParamsPM_PROXY_SERVER: TStringField
      FieldName = 'PM_PROXY_SERVER'
      Size = 64
    end
    object tblParamsPM_PROXY_PORT: TIntegerField
      FieldName = 'PM_PROXY_PORT'
    end
    object tblParamsPM_PROXY_USERNAME: TStringField
      FieldName = 'PM_PROXY_USERNAME'
      Size = 50
    end
    object tblParamsPM_PROXY_PASSWORD: TStringField
      FieldName = 'PM_PROXY_PASSWORD'
      Size = 50
    end
    object tblParamsPM_VACANCY_IMPORT_URL: TStringField
      FieldName = 'PM_VACANCY_IMPORT_URL'
      Size = 128
    end
    object tblParamsPM_FIRST_OTKAZNIK_ISSUE_RZ: TIntegerField
      FieldName = 'PM_FIRST_OTKAZNIK_ISSUE_RZ'
      Required = True
    end
    object tblParamsPM_CURRENT_ISSUE_RZ: TIntegerField
      FieldName = 'PM_CURRENT_ISSUE_RZ'
      Required = True
    end
    object tblParamsPM_CLOSEDATE_RZ_NEW: TSQLTimeStampField
      FieldName = 'PM_CLOSEDATE_RZ_NEW'
    end
    object tblParamsPM_CLOSEDATE_RZ_OLD: TSQLTimeStampField
      FieldName = 'PM_CLOSEDATE_RZ_OLD'
    end
    object tblParamsPM_REPORT_TEMPLATE: TBlobField
      FieldName = 'PM_REPORT_TEMPLATE'
      Size = 1
    end
    object tblParamsPM_REPORT_TEMPLATE_DATE: TSQLTimeStampField
      FieldName = 'PM_REPORT_TEMPLATE_DATE'
      Required = True
    end
    object tblParamsPM_FIRST_OTKAZNIK_ISSUE_RK: TIntegerField
      FieldName = 'PM_FIRST_OTKAZNIK_ISSUE_RK'
    end
    object tblParamsPM_CURRENT_ISSUE_RK: TIntegerField
      FieldName = 'PM_CURRENT_ISSUE_RK'
    end
    object tblParamsPM_CLOSEDATE_RK_OLD: TSQLTimeStampField
      FieldName = 'PM_CLOSEDATE_RK_OLD'
    end
    object tblParamsPM_CLOSEDATE_RK_NEW: TSQLTimeStampField
      FieldName = 'PM_CLOSEDATE_RK_NEW'
    end
  end
  object dsParams: TDataSource
    DataSet = tblParams
    Left = 221
    Top = 8
  end
  object qryFindSdelkaByNumber: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'SD_NUM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'US_ID'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'SELECT'
      '    DISTINCT'
      '      FS.*'
      '                , SD.SD_NUM'
      '                , SD.SD_PAY_VER'
      '    , SD.GZ_ID'
      '    , SD.SD_TYPE'
      '    , SD.SD_DATE'
      '    , SD.SD_STATE'
      '    , SD.SD_SUM'
      '    , SD.SD_SUM_PAYED'
      '    , sdt.SD_TYPE_DESC'
      
        '    , CASE WHEN sd.GZ_ID IN (0, 6) THEN LPAD(EXTRACT(DAY FROM sd' +
        '.SD_KA_START_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        LPAD(EXTRACT(MONTH FROM ' +
        'sd.SD_KA_START_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        EXTRACT(YEAR FROM sd.SD_' +
        'KA_START_DATE)||'#39' - '#39'||'
      
        '                                        LPAD(EXTRACT(DAY FROM sd' +
        '.SD_KA_END_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        LPAD(EXTRACT(MONTH FROM ' +
        'sd.SD_KA_END_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        EXTRACT(YEAR FROM sd.SD_' +
        'KA_END_DATE)'
      '           ELSE spn.PODACHA_NUMS'
      '      END AS PODACHA_NUMS'
      '    , MFR.FM_ID'
      '    , MFR.RB_ID'
      '    , SD.SD_FACT_DATE'
      '/*    , gz.GZ_NAME_SHORT*/'
      '    , UR.AG_ID AS SDELKA_IS_OF_CURRENT_USER'
      '                ,SD.SD_KA_START_DATE'
      '                ,SD.SD_KA_END_DATE'
      '     , c.CU_COMPANY_ID'
      ''
      'FROM'
      '    FIND_SDELKA_BY_SDNUM2(:SD_NUM) FS'
      ''
      '    LEFT JOIN SDELKA SD'
      '    ON (FS.AG_ID=SD.AG_ID AND FS.SD_ID=SD.SD_ID)'
      ''
      '    LEFT JOIN SDELKA_TYPE_DESC sdt'
      '    ON (sdt.SD_TYPE = sd.SD_TYPE AND sdt.GZ_ID = sd.GZ_ID)'
      ''
      '    LEFT JOIN SDELKA_PODACHA_NUMS(SD.AG_ID,SD.SD_ID) SPN'
      '    ON (SD.SD_ID=SPN.SD_ID)'
      ''
      '    LEFT JOIN GET_MAX_FORMAT_AND_RUBRIKA(SD.AG_ID,SD.SD_ID) MFR'
      '    ON (SD.SD_ID=SD.SD_ID)'
      ''
      '    LEFT JOIN USR_RIGHTS UR'
      '    ON (UR.AG_ID=FS.AG_ID AND UR.US_ID=:US_ID)'
      ''
      
        '    LEFT JOIN CUST c ON (c.AG_ID = fs.AG_ID AND c.CU_ID = fs.CU_' +
        'ID)'
      ''
      '/*    left join GAZETA gz'
      '    on (gz.GZ_ID = sd.GZ_ID)*/'
      'ORDER BY'
      '    SD.SD_DATE DESC')
    SQLConnection = connection
    Left = 493
    Top = 8
    object qryFindSdelkaByNumberCU_COMPANY_ID: TIntegerField
      FieldName = 'CU_COMPANY_ID'
    end
    object qryFindSdelkaByNumberAG_ID: TIntegerField
      Tag = 13
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryFindSdelkaByNumberSD_ID: TIntegerField
      Tag = 13
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryFindSdelkaByNumberCU_ID: TIntegerField
      Tag = 13
      FieldName = 'CU_ID'
    end
    object qryFindSdelkaByNumberCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qryFindSdelkaByNumberSD_ID_COMPOUND: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'SD_ID_COMPOUND'
      FixedChar = True
      Size = 12
    end
    object qryFindSdelkaByNumberPT_ID: TIntegerField
      Tag = 13
      FieldName = 'PT_ID'
    end
    object qryFindSdelkaByNumberSD_ZAPAS: TIntegerField
      DisplayLabel = #1047#1072#1087#1072#1089
      FieldName = 'SD_ZAPAS'
    end
    object qryFindSdelkaByNumberAG_NAME: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_NAME'
      Size = 128
    end
    object qryFindSdelkaByNumberSD_FACT_NUM: TIntegerField
      DisplayLabel = #1057#1095#1105#1090
      FieldName = 'SD_FACT_NUM'
    end
    object qryFindSdelkaByNumberSD_ALL_PAYED: TIntegerField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1072
      FieldName = 'SD_ALL_PAYED'
    end
    object qryFindSdelkaByNumberSD_SUM_PAYED: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'SD_SUM_PAYED'
    end
    object qryFindSdelkaByNumberSD_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SD_SUM'
    end
    object qryFindSdelkaByNumberSD_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'SD_DATE'
    end
    object qryFindSdelkaByNumberSD_STATE: TSmallintField
      Tag = 13
      FieldName = 'SD_STATE'
    end
    object qryFindSdelkaByNumberPODACHA_NUMS: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object qryFindSdelkaByNumberSD_FACT_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1095#1105#1090#1072
      FieldName = 'SD_FACT_DATE'
    end
    object qryFindSdelkaByNumberFM_ID: TIntegerField
      FieldName = 'FM_ID'
    end
    object qryFindSdelkaByNumberRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object qryFindSdelkaByNumberSDELKA_IS_OF_CURRENT_USER: TIntegerField
      FieldName = 'SDELKA_IS_OF_CURRENT_USER'
      ProviderFlags = []
    end
    object qryFindSdelkaByNumberGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object qryFindSdelkaByNumberSD_TYPE: TSmallintField
      FieldName = 'SD_TYPE'
    end
    object qryFindSdelkaByNumberSD_TYPE_DESC: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'SD_TYPE_DESC'
      Size = 10
    end
    object qryFindSdelkaByNumberSD_PAY_VER: TIntegerField
      FieldName = 'SD_PAY_VER'
    end
    object qryFindSdelkaByNumberSD_KA_START_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_START_DATE'
    end
    object qryFindSdelkaByNumberSD_KA_END_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_END_DATE'
    end
    object qryFindSdelkaByNumberSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
  end
  object dsFindSdelka: TDataSource
    DataSet = cdsFindSdelka
    Left = 613
    Top = 96
  end
  object qryFindSdelkaByPhone: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'AG_ID'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'PH_NUMBER'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'US_ID'
        ParamType = ptUnknown
        Value = 0
      end>
    SQL.Strings = (
      'SELECT'
      '    DISTINCT'
      '      fs.*'
      '                , SD.SD_NUM'
      '                , SD.SD_PAY_VER'
      '    , sd.GZ_ID'
      '    , SD.SD_TYPE    '
      '    , sd.SD_DATE'
      '    , sd.SD_STATE'
      '    , sd.SD_SUM'
      '    , sd.SD_SUM_PAYED'
      '    , sdt.SD_TYPE_DESC'
      
        '    , CASE WHEN sd.GZ_ID IN (0, 6) THEN LPAD(EXTRACT(DAY FROM sd' +
        '.SD_KA_START_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        LPAD(EXTRACT(MONTH FROM ' +
        'sd.SD_KA_START_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        EXTRACT(YEAR FROM sd.SD_' +
        'KA_START_DATE)||'#39' - '#39'||'
      
        '                                        LPAD(EXTRACT(DAY FROM sd' +
        '.SD_KA_END_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        LPAD(EXTRACT(MONTH FROM ' +
        'sd.SD_KA_END_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        EXTRACT(YEAR FROM sd.SD_' +
        'KA_END_DATE)'
      '           else spn.PODACHA_NUMS'
      '      end as PODACHA_NUMS'
      '    , mfr.FM_ID'
      '    , mfr.RB_ID'
      '    , sd.SD_FACT_DATE'
      '/*    , gz.GZ_NAME_SHORT*/'
      '    , ur.AG_ID as SDELKA_IS_OF_CURRENT_USER'
      '                ,SD.SD_KA_START_DATE'
      '                ,SD.SD_KA_END_DATE'
      '    , c.CU_COMPANY_ID'
      'FROM'
      '    FIND_SDELKA_BY_PHONE(:AG_ID, :PH_NUMBER) fs'
      ''
      '    LEFT JOIN SDELKA sd'
      '    ON (fs.AG_ID = sd.AG_ID AND fs.SD_ID = sd.SD_ID)'
      ''
      '    LEFT JOIN SDELKA_TYPE_DESC sdt'
      '    ON (sdt.SD_TYPE = sd.SD_TYPE AND sdt.GZ_ID = sd.GZ_ID)'
      ''
      '    LEFT JOIN SDELKA_PODACHA_NUMS(sd.AG_ID, sd.SD_ID) spn'
      '    ON (sd.SD_ID = spn.SD_ID)'
      ''
      '    LEFT JOIN GET_MAX_FORMAT_AND_RUBRIKA(sd.AG_ID,sd.SD_ID) mfr'
      '    ON (sd.SD_ID = sd.SD_ID)'
      ''
      '    LEFT JOIN USR_RIGHTS ur'
      '    ON (ur.AG_ID = fs.AG_ID AND ur.US_ID = :US_ID)'
      ''
      
        '    LEFT JOIN CUST c ON (c.AG_ID = fs.AG_ID AND c.CU_ID = fs.CU_' +
        'ID)'
      ''
      '/*    left join GAZETA gz'
      '    on (gz.GZ_ID = sd.GZ_ID)*/'
      'ORDER BY'
      '    sd.SD_DATE DESC')
    SQLConnection = connection
    Left = 493
    Top = 56
    object qryFindSdelkaByPhoneCU_COMPANY_ID: TIntegerField
      FieldName = 'CU_COMPANY_ID'
    end
    object qryFindSdelkaByPhoneAG_ID: TIntegerField
      Tag = 13
      FieldName = 'AG_ID'
    end
    object qryFindSdelkaByPhoneSD_ID: TIntegerField
      Tag = 13
      FieldName = 'SD_ID'
    end
    object qryFindSdelkaByPhoneCU_ID: TIntegerField
      Tag = 13
      FieldName = 'CU_ID'
    end
    object qryFindSdelkaByPhoneCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qryFindSdelkaByPhoneSD_ID_COMPOUND: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'SD_ID_COMPOUND'
      FixedChar = True
      Size = 12
    end
    object qryFindSdelkaByPhonePT_ID: TIntegerField
      Tag = 13
      FieldName = 'PT_ID'
    end
    object qryFindSdelkaByPhoneSD_ZAPAS: TIntegerField
      DisplayLabel = #1047#1072#1087#1072#1089
      FieldName = 'SD_ZAPAS'
    end
    object qryFindSdelkaByPhoneAG_NAME: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_NAME'
      Size = 128
    end
    object qryFindSdelkaByPhoneSD_FACT_NUM: TIntegerField
      DisplayLabel = #1057#1095#1105#1090
      FieldName = 'SD_FACT_NUM'
    end
    object qryFindSdelkaByPhoneSD_ALL_PAYED: TIntegerField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1072
      FieldName = 'SD_ALL_PAYED'
    end
    object qryFindSdelkaByPhoneSD_SUM_PAYED: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'SD_SUM_PAYED'
    end
    object qryFindSdelkaByPhoneSD_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SD_SUM'
    end
    object qryFindSdelkaByPhoneSD_STATE: TSmallintField
      Tag = 13
      FieldName = 'SD_STATE'
    end
    object qryFindSdelkaByPhonePODACHA_NUMS: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object qryFindSdelkaByPhoneSD_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'SD_DATE'
    end
    object qryFindSdelkaByPhoneSD_FACT_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1095#1105#1090#1072
      FieldName = 'SD_FACT_DATE'
    end
    object qryFindSdelkaByPhoneFM_ID: TIntegerField
      FieldName = 'FM_ID'
    end
    object qryFindSdelkaByPhoneRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object qryFindSdelkaByPhoneGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object qryFindSdelkaByPhoneSD_TYPE: TSmallintField
      FieldName = 'SD_TYPE'
    end
    object qryFindSdelkaByPhoneSD_TYPE_DESC: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'SD_TYPE_DESC'
      Size = 10
    end
    object qryFindSdelkaByPhoneSD_PAY_VER: TIntegerField
      FieldName = 'SD_PAY_VER'
    end
    object qryFindSdelkaByPhoneSD_KA_START_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_START_DATE'
    end
    object qryFindSdelkaByPhoneSD_KA_END_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_END_DATE'
    end
    object qryFindSdelkaByPhoneSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
    object qryFindSdelkaByPhoneSDELKA_IS_OF_CURRENT_USER: TIntegerField
      FieldName = 'SDELKA_IS_OF_CURRENT_USER'
    end
  end
  object dsUsr: TDataSource
    DataSet = qryUsr
    Left = 789
    Top = 56
  end
  object tblUsrType: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'USR_TYPE'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 318
    Top = 8
    object tblUsrTypeUT_ID: TIntegerField
      FieldName = 'UT_ID'
      Required = True
    end
    object tblUsrTypeUT_NAME: TStringField
      FieldName = 'UT_NAME'
      Size = 64
    end
  end
  object dsUsrType: TDataSource
    DataSet = tblUsrType
    Left = 373
    Top = 8
  end
  object qryUsrRights: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 
      'SELECT UR.* FROM USR_RIGHTS UR LEFT JOIN AGENT AG ON (UR.AG_ID=A' +
      'G.AG_ID) WHERE US_ID=:US_ID ORDER BY AG.AG_NAME'
    DataSet.DataSource = dsUsr
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftUnknown
        Name = 'US_ID'
        ParamType = ptInput
      end>
    Params = <>
    AfterInsert = qryUsrRightsAfterInsert
    BeforeEdit = qryUsrRightsBeforeEdit
    Left = 725
    Top = 104
    object qryUsrRightsUS_ID: TIntegerField
      FieldName = 'US_ID'
      Origin = 'DB.USR_RIGHTS.US_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryUsrRightsAG_ID: TIntegerField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_ID'
      Origin = 'DB.USR_RIGHTS.AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryUsrRightsAG_NAME_LK: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldKind = fkLookup
      FieldName = 'AG_NAME_LK'
      LookupDataSet = tblAgentsList
      LookupKeyFields = 'AG_ID'
      LookupResultField = 'AG_NAME'
      KeyFields = 'AG_ID'
      LookupCache = True
      ProviderFlags = []
      Size = 128
      Lookup = True
    end
  end
  object dsUsrRights: TDataSource
    DataSet = qryUsrRights
    Left = 789
    Top = 104
  end
  object tblAgentsList: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'AGENT'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 29
    Top = 536
    object tblAgentsListAG_ID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'AG_ID'
    end
    object tblAgentsListAG_NAME: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'AG_NAME'
      Required = True
      Size = 128
    end
    object tblAgentsListAG_IS_REMOTE: TSmallintField
      FieldName = 'AG_IS_REMOTE'
    end
    object tblAgentsListAG_IS_ACTIVE: TIntegerField
      FieldName = 'AG_IS_ACTIVE'
    end
  end
  object dsAgentsList: TDataSource
    DataSet = tblAgentsList
    Left = 125
    Top = 536
  end
  object qryFindSdelkaByFactNum: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'AG_ID'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'SD_FACT_NUM'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'US_ID'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'SELECT'
      '    DISTINCT'
      '      FS.*'
      '                , SD.SD_NUM'
      '                , SD.SD_PAY_VER'
      '    , SD.GZ_ID'
      '    , SD.SD_TYPE    '
      '    , SD.SD_DATE'
      '    , SD.SD_STATE'
      '    , SD.SD_SUM'
      '    , SD.SD_SUM_PAYED'
      '    , sdt.SD_TYPE_DESC'
      
        '    , CASE WHEN sd.GZ_ID IN (0, 6) THEN LPAD(EXTRACT(DAY FROM sd' +
        '.SD_KA_START_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        LPAD(EXTRACT(MONTH FROM ' +
        'sd.SD_KA_START_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        EXTRACT(YEAR FROM sd.SD_' +
        'KA_START_DATE)||'#39' - '#39'||'
      
        '                                        LPAD(EXTRACT(DAY FROM sd' +
        '.SD_KA_END_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        LPAD(EXTRACT(MONTH FROM ' +
        'sd.SD_KA_END_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        EXTRACT(YEAR FROM sd.SD_' +
        'KA_END_DATE)'
      '           ELSE spn.PODACHA_NUMS'
      '      END AS PODACHA_NUMS'
      '    , MFR.FM_ID'
      '    , MFR.RB_ID'
      '    , SD.SD_FACT_DATE'
      '/*    , gz.GZ_NAME_SHORT*/'
      '    , UR.AG_ID AS SDELKA_IS_OF_CURRENT_USER'
      '                ,SD.SD_KA_START_DATE'
      '                ,SD.SD_KA_END_DATE'
      '    , c.CU_COMPANY_ID'
      'FROM'
      '    FIND_SDELKA_BY_FACT_NUM(:AG_ID,:SD_FACT_NUM) FS'
      ''
      '    LEFT JOIN SDELKA SD'
      '    ON (FS.AG_ID=SD.AG_ID AND FS.SD_ID=SD.SD_ID)'
      ''
      '    left join SDELKA_TYPE_DESC sdt'
      '    on (sdt.SD_TYPE = sd.SD_TYPE and sdt.GZ_ID = sd.GZ_ID)'
      ''
      '    LEFT JOIN SDELKA_PODACHA_NUMS(SD.AG_ID,SD.SD_ID) SPN'
      '    ON (SD.SD_ID=SPN.SD_ID)'
      ''
      '    LEFT JOIN GET_MAX_FORMAT_AND_RUBRIKA(SD.AG_ID,SD.SD_ID) MFR'
      '    ON (SD.SD_ID=SD.SD_ID)'
      ''
      '    LEFT JOIN USR_RIGHTS UR'
      '    ON (UR.AG_ID=FS.AG_ID AND UR.US_ID=:US_ID)'
      ''
      
        '    LEFT JOIN CUST c ON (c.AG_ID = fs.AG_ID AND c.CU_ID = fs.CU_' +
        'ID)'
      ''
      '/*    left join GAZETA gz'
      '    on (gz.GZ_ID = sd.GZ_ID)*/'
      'ORDER BY'
      '    SD.SD_DATE DESC')
    SQLConnection = connection
    Left = 493
    Top = 104
    object qryFindSdelkaByFactNumCU_COMPANY_ID: TIntegerField
      FieldName = 'CU_COMPANY_ID'
    end
    object qryFindSdelkaByFactNumAG_ID: TIntegerField
      Tag = 13
      DisplayWidth = 12
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryFindSdelkaByFactNumSD_ID: TIntegerField
      Tag = 13
      DisplayWidth = 12
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryFindSdelkaByFactNumCU_ID: TIntegerField
      Tag = 13
      DisplayWidth = 12
      FieldName = 'CU_ID'
    end
    object qryFindSdelkaByFactNumCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      DisplayWidth = 154
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qryFindSdelkaByFactNumSD_ID_COMPOUND: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 15
      FieldName = 'SD_ID_COMPOUND'
      FixedChar = True
      Size = 12
    end
    object qryFindSdelkaByFactNumPT_ID: TIntegerField
      Tag = 13
      DisplayWidth = 12
      FieldName = 'PT_ID'
    end
    object qryFindSdelkaByFactNumSD_ZAPAS: TIntegerField
      DisplayLabel = #1047#1072#1087#1072#1089
      DisplayWidth = 12
      FieldName = 'SD_ZAPAS'
    end
    object qryFindSdelkaByFactNumAG_NAME: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      DisplayWidth = 154
      FieldName = 'AG_NAME'
      Size = 128
    end
    object qryFindSdelkaByFactNumSD_FACT_NUM: TIntegerField
      DisplayLabel = #1057#1095#1105#1090
      DisplayWidth = 12
      FieldName = 'SD_FACT_NUM'
    end
    object qryFindSdelkaByFactNumSD_ALL_PAYED: TIntegerField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1072
      DisplayWidth = 12
      FieldName = 'SD_ALL_PAYED'
    end
    object qryFindSdelkaByFactNumSD_SUM_PAYED: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      DisplayWidth = 12
      FieldName = 'SD_SUM_PAYED'
    end
    object qryFindSdelkaByFactNumSD_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 12
      FieldName = 'SD_SUM'
    end
    object qryFindSdelkaByFactNumSD_STATE: TSmallintField
      Tag = 13
      DisplayWidth = 12
      FieldName = 'SD_STATE'
    end
    object qryFindSdelkaByFactNumPODACHA_NUMS: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      DisplayWidth = 306
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object qryFindSdelkaByFactNumSD_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'SD_DATE'
    end
    object qryFindSdelkaByFactNumSD_FACT_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1095#1105#1090#1072
      FieldName = 'SD_FACT_DATE'
    end
    object qryFindSdelkaByFactNumFM_ID: TIntegerField
      FieldName = 'FM_ID'
    end
    object qryFindSdelkaByFactNumRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object qryFindSdelkaByFactNumSDELKA_IS_OF_CURRENT_USER: TIntegerField
      FieldName = 'SDELKA_IS_OF_CURRENT_USER'
      ProviderFlags = []
    end
    object qryFindSdelkaByFactNumGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object qryFindSdelkaByFactNumSD_TYPE: TSmallintField
      FieldName = 'SD_TYPE'
    end
    object qryFindSdelkaByFactNumSD_TYPE_DESC: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'SD_TYPE_DESC'
      Size = 10
    end
    object qryFindSdelkaByFactNumSD_PAY_VER: TIntegerField
      FieldName = 'SD_PAY_VER'
    end
    object qryFindSdelkaByFactNumSD_KA_START_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_START_DATE'
    end
    object qryFindSdelkaByFactNumSD_KA_END_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_END_DATE'
    end
    object qryFindSdelkaByFactNumSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
  end
  object tblOtkaznik: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 
      'SELECT OT.*,AG.AG_NAME FROM OTKAZNIK OT LEFT JOIN AGENT AG ON (O' +
      'T.AG_ID=AG.AG_ID) ORDER BY OT.OT_NUMBER'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    PacketRecords = 20
    Params = <>
    Left = 493
    Top = 480
    object tblOtkaznikOT_NUMBER: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'OT_NUMBER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      EditMask = '000-00-00;0;_'
      FixedChar = True
      Size = 16
    end
    object tblOtkaznikAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object tblOtkaznikOT_IS_STATIC: TSmallintField
      DisplayLabel = #1055#1086#1089#1090#1086#1103#1085#1085#1099#1081
      FieldName = 'OT_IS_STATIC'
    end
    object tblOtkaznikOT_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'OT_COMMENT'
      Size = 64
    end
    object tblOtkaznikAG_NAME: TStringField
      FieldName = 'AG_NAME'
      ProviderFlags = []
      Size = 128
    end
  end
  object dsOtkaznik: TDataSource
    DataSet = tblOtkaznik
    Left = 573
    Top = 496
  end
  object tblBool: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'BOOL'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 318
    Top = 51
    object tblBoolBL_ID: TSmallintField
      FieldName = 'BL_ID'
      Required = True
    end
    object tblBoolBL_NAME: TStringField
      FieldName = 'BL_NAME'
      Required = True
      FixedChar = True
      Size = 4
    end
  end
  object qryUsr: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'SELECT * FROM USR ORDER BY US_NAME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    AfterInsert = qryUsrAfterInsert
    AfterScroll = qryUsrAfterScroll
    BeforeApplyUpdates = qryUsrBeforeApplyUpdates
    Left = 725
    Top = 56
    object qryUsrUS_ID: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'US_ID'
      Origin = 'DB.USR.US_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryUsrUS_NAME: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'US_NAME'
      Origin = 'DB.USR.US_NAME'
      Size = 128
    end
    object qryUsrUS_DISK_ID: TStringField
      FieldName = 'US_DISK_ID'
      Origin = 'DB.USR.US_DISK_ID'
    end
    object qryUsrUS_PASSWORD: TStringField
      DisplayLabel = #1055#1072#1088#1086#1083#1100
      FieldName = 'US_PASSWORD'
      Origin = 'DB.USR.US_PASSWORD'
      FixedChar = True
      Size = 16
    end
    object qryUsrUS_TYPE: TIntegerField
      DisplayLabel = #1058#1080#1087
      FieldName = 'US_TYPE'
      Origin = 'DB.USR.US_TYPE'
    end
    object qryUsrUS_TYPE_LK: TStringField
      DisplayLabel = #1058#1080#1087
      FieldKind = fkLookup
      FieldName = 'US_TYPE_LK'
      LookupDataSet = tblUsrType
      LookupKeyFields = 'UT_ID'
      LookupResultField = 'UT_NAME'
      KeyFields = 'US_TYPE'
      ProviderFlags = []
      Lookup = True
    end
    object qryUsrUS_OFFICE_NAME: TStringField
      DisplayLabel = #1054#1092#1080#1089
      FieldName = 'US_OFFICE_NAME'
      Origin = 'DB.USR.US_OFFICE_NAME'
      Size = 64
    end
    object qryUsrUS_IS_REMOTE: TSmallintField
      FieldName = 'US_IS_REMOTE'
      Origin = 'DB.USR.US_IS_REMOTE'
    end
    object qryUsrUS_IS_REMOTE_LK: TStringField
      DisplayLabel = #1051#1077#1074#1086#1073#1077#1088'.'
      FieldKind = fkLookup
      FieldName = 'US_IS_REMOTE_LK'
      LookupDataSet = tblBool
      LookupKeyFields = 'BL_ID'
      LookupResultField = 'BL_NAME'
      KeyFields = 'US_IS_REMOTE'
      ProviderFlags = []
      Lookup = True
    end
    object qryUsrUS_AUTO_REFRESH: TSmallintField
      FieldName = 'US_AUTO_REFRESH'
    end
    object qryUsrUS_CAN_EDIT_CUST_UNIQUE: TSmallintField
      FieldName = 'US_CAN_EDIT_CUST_UNIQUE'
      Required = True
    end
    object qryUsrUS_CAN_EDIT_CUST_UNIQUE_LK: TStringField
      FieldKind = fkLookup
      FieldName = 'US_CAN_EDIT_CUST_UNIQUE_LK'
      LookupDataSet = tblBool
      LookupKeyFields = 'BL_ID'
      LookupResultField = 'BL_NAME'
      KeyFields = 'US_CAN_EDIT_CUST_UNIQUE'
      LookupCache = True
      Lookup = True
    end
    object qryUsrUS_IS_ACTIVE: TIntegerField
      FieldName = 'US_IS_ACTIVE'
    end
    object qryUsrUS_ACCOUNT: TStringField
      FieldName = 'US_ACCOUNT'
      Size = 255
    end
    object qryUsrUS_CAN_BLOCK_COVER: TSmallintField
      FieldName = 'US_CAN_BLOCK_COVER'
    end
  end
  object dsBool: TDataSource
    DataSet = tblBool
    Left = 373
    Top = 51
  end
  object spRefreshOtkaznik: TSQLStoredProc
    MaxBlobSize = -1
    Params = <>
    SQLConnection = connection
    StoredProcName = 'REFRESH_OTKAZNIK_NEW'
    Left = 869
    Top = 248
  end
  object dsIssuePR: TDataSource
    DataSet = qryIssuePR
    Left = 373
    Top = 411
  end
  object dsIssueNS: TDataSource
    DataSet = qryIssueNS
    Left = 373
    Top = 456
  end
  object spAddToOtkaznik: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFixedChar
        Name = 'PH_NUMBER'
        ParamType = ptInput
      end>
    SQLConnection = connection
    StoredProcName = 'ADD_TO_OTKAZNIK'
    Left = 869
    Top = 296
  end
  object spAddSumForManager: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftFloat
        Name = 'M_ADD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'M_COMMENT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'M_TYPE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'M_US_ID'
        ParamType = ptInput
      end>
    SQLConnection = connection
    StoredProcName = 'ADD_SUM_FOR_MANAGER'
    Left = 861
    Top = 496
  end
  object dsMoneyTransactions: TDataSource
    DataSet = qryMoneyTransactions
    Left = 125
    Top = 573
  end
  object tblTransactionType: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'TRANSACTION_TYPE'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 29
    Top = 608
    object tblTransactionTypeTT_ID: TIntegerField
      FieldName = 'TT_ID'
      Required = True
    end
    object tblTransactionTypeTT_NAME: TStringField
      FieldName = 'TT_NAME'
      Size = 64
    end
  end
  object dsTransactionType: TDataSource
    DataSet = tblTransactionType
    Left = 125
    Top = 608
  end
  object tblOtkaznikStatic: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'SELECT * FROM OTKAZNIK WHERE OT_IS_STATIC=1 ORDER BY  OT_NUMBER'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    PacketRecords = 20
    Params = <>
    AfterInsert = tblOtkaznikStaticAfterInsert
    Left = 493
    Top = 528
    object tblOtkaznikStaticOT_NUMBER: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'OT_NUMBER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      EditMask = '000-00-00;0;_'
      FixedChar = True
      Size = 16
    end
    object tblOtkaznikStaticAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object tblOtkaznikStaticOT_IS_STATIC: TSmallintField
      FieldName = 'OT_IS_STATIC'
    end
    object tblOtkaznikStaticOT_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'OT_COMMENT'
      Size = 64
    end
  end
  object dsOtkaznikStatic: TDataSource
    DataSet = tblOtkaznikStatic
    Left = 573
    Top = 544
  end
  object spAddAgentChangingTask: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID_SRC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID_SRC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AG_ID_DST'
        ParamType = ptInput
      end>
    SQLConnection = connection
    StoredProcName = 'ADD_AGENT_CHANGING_TASK'
    Left = 869
    Top = 392
  end
  object qryAgents: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 
      'SELECT AG_ID,AG_NAME,AG_IS_REMOTE,AG_FACTURA_PHONES,AG_FACTURA_N' +
      'AME,AG_LOCK_RUBRIKAS, AG_IS_ACTIVE FROM AGENT ORDER BY AG_NAME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    AfterInsert = qryAgentsAfterInsert
    Left = 725
    Top = 8
    object qryAgentsAG_ID: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'AG_ID'
      Origin = 'DB.AGENT.AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryAgentsAG_NAME: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'AG_NAME'
      Origin = 'DB.AGENT.AG_NAME'
      ProviderFlags = [pfInUpdate]
      Size = 128
    end
    object qryAgentsAG_IS_REMOTE: TSmallintField
      FieldName = 'AG_IS_REMOTE'
      Origin = 'DB.AGENT.AG_IS_REMOTE'
      ProviderFlags = [pfInUpdate]
    end
    object qryAgentsAG_IS_REMOTE_LK: TStringField
      DisplayLabel = #1051#1077#1074#1086#1073#1077#1088'.'
      FieldKind = fkLookup
      FieldName = 'AG_IS_REMOTE_LK'
      LookupDataSet = tblBool
      LookupKeyFields = 'BL_ID'
      LookupResultField = 'BL_NAME'
      KeyFields = 'AG_IS_REMOTE'
      ProviderFlags = []
      Lookup = True
    end
    object qryAgentsAG_FACTURA_PHONES: TStringField
      DisplayLabel = #1058#1077#1083'. '#1074' '#1089#1095#1105#1090
      FieldName = 'AG_FACTURA_PHONES'
      ProviderFlags = [pfInUpdate]
      Size = 64
    end
    object qryAgentsAG_FACTURA_NAME: TStringField
      DisplayLabel = #1048#1084#1103' '#1074' '#1089#1095#1105#1090
      FieldName = 'AG_FACTURA_NAME'
      ProviderFlags = [pfInUpdate]
      Size = 64
    end
    object qryAgentsAG_LOCK_RUBRIKAS: TSmallintField
      DefaultExpression = '0'
      FieldName = 'AG_LOCK_RUBRIKAS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryAgentsAG_IS_ACTIVE: TIntegerField
      DisplayLabel = #1040#1082#1090#1080#1074#1085#1099#1081
      FieldName = 'AG_IS_ACTIVE'
    end
  end
  object dsAgents: TDataSource
    DataSet = qryAgents
    Left = 789
    Top = 8
  end
  object qryCurrentUserRights: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 
      'SELECT UR.*, AG.AG_NAME FROM USR_RIGHTS UR LEFT JOIN AGENT AG ON' +
      ' (UR.AG_ID=AG.AG_ID) WHERE US_ID=:US_ID ORDER BY AG.AG_NAME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'US_ID'
        ParamType = ptInput
      end>
    Params = <>
    AfterInsert = qryUsrRightsAfterInsert
    Left = 725
    Top = 157
    object qryCurrentUserRightsUS_ID: TIntegerField
      FieldName = 'US_ID'
      Origin = 'DB.USR_RIGHTS.US_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryCurrentUserRightsAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Origin = 'DB.USR_RIGHTS.AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryCurrentUserRightsAG_NAME: TStringField
      FieldName = 'AG_NAME'
      Origin = 'DB.AGENT.AG_NAME'
      ProviderFlags = []
      Size = 128
    end
  end
  object spPayForSdelka: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SUM_PAYED'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ALL_PAYED'
        ParamType = ptInput
      end>
    SQLConnection = connection
    StoredProcName = 'PAY_FOR_SDELKA'
    Left = 933
    Top = 480
  end
  object spNextCurrentIssue: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'GZ_ID'
        ParamType = ptInput
      end>
    SQLConnection = connection
    StoredProcName = 'NEXT_CURRENT_ISSUE'
    Left = 933
    Top = 70
  end
  object spCloseIssue: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'GZ_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'US_ID'
        ParamType = ptInput
      end>
    SQLConnection = connection
    StoredProcName = 'CLOSE_ISSUE'
    Left = 869
    Top = 152
  end
  object qryChangeAgentTask: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 
      'select ct.*, s.sd_num from change_agent_task ct join sdelka s on' +
      ' (s.ag_id = ct.ag_id_src and s.sd_id = ct.sd_id_src)'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 29
    Top = 669
    object qryChangeAgentTaskAG_ID_SRC: TIntegerField
      FieldName = 'AG_ID_SRC'
      Origin = 'CHANGE_AGENT_TASK'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryChangeAgentTaskSD_ID_SRC: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1089#1076#1077#1083#1082#1080
      FieldName = 'SD_ID_SRC'
      Origin = 'CHANGE_AGENT_TASK'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryChangeAgentTaskAG_ID_DST: TIntegerField
      FieldName = 'AG_ID_DST'
      Origin = 'CHANGE_AGENT_TASK'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryChangeAgentTaskAG_NAME_SRC_LK: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090', '#1086#1090#1076#1072#1102#1097#1080#1081' '#1089#1076#1077#1083#1082#1091
      FieldKind = fkLookup
      FieldName = 'AG_NAME_SRC_LK'
      LookupDataSet = tblAgentsList
      LookupKeyFields = 'AG_ID'
      LookupResultField = 'AG_NAME'
      KeyFields = 'AG_ID_SRC'
      Lookup = True
    end
    object qryChangeAgentTaskAG_NAME_DST_LK: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090', '#1087#1086#1083#1091#1095#1072#1102#1097#1080#1081' '#1089#1076#1077#1083#1082#1091
      FieldKind = fkLookup
      FieldName = 'AG_NAME_DST_LK'
      LookupDataSet = tblAgentsList
      LookupKeyFields = 'AG_ID'
      LookupResultField = 'AG_NAME'
      KeyFields = 'AG_ID_DST'
      Lookup = True
    end
    object qryChangeAgentTaskAG_IS_REMOTE_SRC_LK: TSmallintField
      FieldKind = fkLookup
      FieldName = 'AG_IS_REMOTE_SRC_LK'
      LookupDataSet = tblAgentsList
      LookupKeyFields = 'AG_ID'
      LookupResultField = 'AG_IS_REMOTE'
      KeyFields = 'AG_ID_SRC'
      Lookup = True
    end
    object qryChangeAgentTaskAG_IS_REMOTE_DST_LK: TSmallintField
      FieldKind = fkLookup
      FieldName = 'AG_IS_REMOTE_DST_LK'
      LookupDataSet = tblAgentsList
      LookupKeyFields = 'AG_ID'
      LookupResultField = 'AG_IS_REMOTE'
      KeyFields = 'AG_ID_DST'
      Lookup = True
    end
    object qryChangeAgentTaskSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Origin = 'SDELKA'
      Size = 64
    end
  end
  object dsChangeAgentTask: TDataSource
    DataSet = qryChangeAgentTask
    Left = 125
    Top = 669
  end
  object spChangeAgentForSdelka: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID_WAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID_WAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AG_ID_NEW'
        ParamType = ptInput
      end>
    SQLConnection = connection
    StoredProcName = 'CHANGE_AGENT_FOR_SDELKA'
    Left = 869
    Top = 440
  end
  object spPaySdelkas: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'FACT_NUM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PAY_SUM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CU_NAME'
        ParamType = ptOutput
        Size = 128
      end>
    SQLConnection = connection
    StoredProcName = 'PAY_SDELKAS'
    Left = 869
    Top = 344
  end
  object spDeleteSdelka: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COMMENT'
        ParamType = ptInput
      end>
    SQLConnection = connection
    StoredProcName = 'DELETE_SDELKA'
    Left = 933
    Top = 328
  end
  object spBeznalVNal: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SD_PERCENT'
        ParamType = ptInput
      end>
    SQLConnection = connection
    StoredProcName = 'BEZNAL_V_NAL'
    Left = 933
    Top = 119
  end
  object connection: TSQLConnection
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=c:/ib_db/prInfo.gdb'
      'RoleName='
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet=WIN1251'
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=False'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Left = 29
    Top = 8
  end
  object qryCustPhone: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'CU_ID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select *'
      'from CUST_PHONE'
      'where AG_ID = :AG_ID and CU_ID = :CU_ID'
      'order by CP_NUMBER')
    SQLConnection = connection
    Left = 21
    Top = 360
    object qryCustPhoneAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCustPhoneCU_ID: TIntegerField
      FieldName = 'CU_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCustPhoneCP_NUMBER: TStringField
      FieldName = 'CP_NUMBER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 16
    end
    object qryCustPhoneCP_ADDDATE: TSQLTimeStampField
      FieldName = 'CP_ADDDATE'
      ProviderFlags = []
    end
  end
  object cdsCustPhone: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCustPhone'
    AfterInsert = cdsCustPhoneAfterInsert
    OnReconcileError = cdsCust_ReconcileError
    Left = 159
    Top = 360
    object cdsCustPhoneAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCustPhoneCU_ID: TIntegerField
      FieldName = 'CU_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCustPhoneCP_NUMBER: TStringField
      FieldName = 'CP_NUMBER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      EditMask = 'CCC-CC-CC;0;_'
      FixedChar = True
      Size = 16
    end
    object cdsCustPhoneCP_ADDDATE: TSQLTimeStampField
      DisplayLabel = #1044#1086#1073#1072#1074#1083#1077#1085
      FieldName = 'CP_ADDDATE'
      ProviderFlags = []
    end
  end
  object SQLMonitor: TSQLMonitor
    FileName = 'c:\dbx-sql.log'
    OnLogTrace = SQLMonitorLogTrace
    SQLConnection = connection
    Left = 101
    Top = 8
  end
  object qryAgent: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM AGENT')
    SQLConnection = connection
    Left = 29
    Top = 56
    object qryAgentAG_ID: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryAgentAG_NAME: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'AG_NAME'
      Size = 128
    end
    object qryAgentAG_IS_REMOTE: TSmallintField
      FieldName = 'AG_IS_REMOTE'
    end
    object qryAgentAG_FACTURA_PHONES: TStringField
      FieldName = 'AG_FACTURA_PHONES'
      Size = 64
    end
  end
  object qryIssue: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'SELECT * FROM ISSUE'#13#10'WHERE GZ_ID=:GZ_ID'#13#10'ORDER BY IS_DATE'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'GZ_ID'
        ParamType = ptInput
        Value = '1'
      end>
    FetchOnDemand = False
    Params = <
      item
        DataType = ftString
        Name = 'GZ_ID'
        ParamType = ptInput
        Value = 1
      end>
    AfterInsert = qryIssueAfterInsert
    Left = 317
    Top = 352
    object qryIssueIS_ID: TIntegerField
      FieldName = 'IS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryIssueGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
      Required = True
    end
    object qryIssueIS_NAME: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'IS_NAME'
      Required = True
      Size = 10
    end
    object qryIssueIS_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'IS_DATE'
      Required = True
    end
    object qryIssueIS_NAME_COMPOSED: TStringField
      DisplayLabel = #1055#1086#1083#1085#1099#1081' '#1085#1086#1084#1077#1088
      FieldName = 'IS_NAME_COMPOSED'
      ProviderFlags = []
      Size = 25
    end
  end
  object qryIssuePR: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'SELECT * FROM ISSUE'#13#10'WHERE GZ_ID=1'#13#10'ORDER BY IS_DATE'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    ReadOnly = True
    Left = 317
    Top = 395
    object IntegerField5: TIntegerField
      FieldName = 'IS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SmallintField1: TSmallintField
      FieldName = 'GZ_ID'
      Required = True
    end
    object StringField6: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'IS_NAME'
      Required = True
      Size = 10
    end
    object SQLTimeStampField1: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'IS_DATE'
      Required = True
    end
    object StringField7: TStringField
      DisplayLabel = #1055#1086#1083#1085#1099#1081' '#1085#1086#1084#1077#1088
      FieldName = 'IS_NAME_COMPOSED'
      ProviderFlags = []
      Size = 25
    end
  end
  object qryIssueNS: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'SELECT * FROM ISSUE'#13#10'WHERE GZ_ID=2'#13#10'ORDER BY IS_DATE'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    ReadOnly = True
    Left = 317
    Top = 438
    object IntegerField3: TIntegerField
      FieldName = 'IS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SmallintField2: TSmallintField
      FieldName = 'GZ_ID'
      Required = True
    end
    object StringField1: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'IS_NAME'
      Required = True
      Size = 10
    end
    object SQLTimeStampField2: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'IS_DATE'
      Required = True
    end
    object StringField2: TStringField
      DisplayLabel = #1055#1086#1083#1085#1099#1081' '#1085#1086#1084#1077#1088
      FieldName = 'IS_NAME_COMPOSED'
      ProviderFlags = []
      Size = 25
    end
  end
  object tblRubrika: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'SELECT * FROM RUBRIKA WHERE DELETED = 0 ORDER BY RB_NAME_SHORT'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 317
    Top = 231
    object tblRubrikaRB_ID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'RB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tblRubrikaRB_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'RB_NAME'
      Required = True
      Size = 128
    end
    object tblRubrikaRB_NAME_SHORT: TStringField
      DisplayLabel = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
      FieldName = 'RB_NAME_SHORT'
      Required = True
      Size = 64
    end
    object tblRubrikaRB_COST_COEFF: TFloatField
      DisplayLabel = #1062#1077#1085#1086#1074#1086#1081' '#1082#1086#1101#1092#1080#1094#1080#1077#1085#1090
      FieldName = 'RB_COST_COEFF'
      DisplayFormat = '0.###'
    end
    object tblRubrikaRB_IS_OBLOGKA: TSmallintField
      DisplayLabel = #1054#1073#1083#1086#1078#1082#1072
      FieldName = 'RB_IS_OBLOGKA'
      Required = True
    end
    object tblRubrikaGZ_ID: TIntegerField
      FieldName = 'GZ_ID'
      Required = True
    end
    object tblRubrikaGZ_NAME_LK: TStringField
      DisplayLabel = #1043#1072#1079#1077#1090#1072
      FieldKind = fkLookup
      FieldName = 'GZ_NAME_LK'
      LookupDataSet = tblGazeta
      LookupKeyFields = 'GZ_ID'
      LookupResultField = 'GZ_NAME_SHORT'
      KeyFields = 'GZ_ID'
      Lookup = True
    end
    object tblRubrikaRB_IS_HOT: TSmallintField
      DisplayLabel = #1043#1086#1088#1103#1095#1080#1077
      FieldName = 'RB_IS_HOT'
    end
    object tblRubrikaRB_IS_LOCKABLE: TSmallintField
      DisplayLabel = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100
      FieldName = 'RB_IS_LOCKABLE'
      Required = True
    end
    object tblRubrikaRB_DELETED: TSmallintField
      DisplayLabel = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100
      FieldName = 'DELETED'
      Required = True
    end
  end
  object qryMoneyTransactions: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 
      'SELECT MT.*, TT.TT_NAME FROM MONEY_TRANSACTIONS MT LEFT JOIN TRA' +
      'NSACTION_TYPE TT ON (MT.TT_ID=TT.TT_ID) WHERE MT.US_ID=:US_ID AN' +
      'D CAST(MT_DATE AS DATE)>=:DATE_FROM AND CAST(MT_DATE AS DATE)<=:' +
      'DATE_TO ORDER BY MT_ID'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'US_ID'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'DATE_FROM'
        ParamType = ptInput
        Value = '1.1.1'
      end
      item
        DataType = ftString
        Name = 'DATE_TO'
        ParamType = ptInput
        Value = '1.1.1'
      end>
    PacketRecords = 20
    Params = <>
    ReadOnly = True
    Left = 29
    Top = 573
    object qryMoneyTransactionsMT_ID: TIntegerField
      FieldName = 'MT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryMoneyTransactionsMT_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'MT_DATE'
      Required = True
    end
    object qryMoneyTransactionsMT_SUM: TFloatField
      DisplayLabel = #1050#1072#1089#1089#1072
      FieldName = 'MT_SUM'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryMoneyTransactionsMT_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'MT_COMMENT'
      Size = 128
    end
    object qryMoneyTransactionsMT_CHANGE: TFloatField
      DisplayLabel = #1048#1079#1084#1077#1085#1077#1085#1080#1077
      FieldName = 'MT_CHANGE'
      Required = True
      DisplayFormat = '0.00'
    end
    object qryMoneyTransactionsTT_ID: TIntegerField
      FieldName = 'TT_ID'
      Required = True
    end
    object qryMoneyTransactionsUS_ID: TIntegerField
      FieldName = 'US_ID'
      Required = True
    end
    object qryMoneyTransactionsTT_NAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080
      FieldName = 'TT_NAME'
      ProviderFlags = []
      Size = 64
    end
  end
  object prvFindSdelka: TDataSetProvider
    DataSet = qryFindSdelkaByPhone
    Left = 613
    Top = 56
  end
  object cdsFindSdelka: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'AG_ID'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'PH_NUMBER'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'US_ID'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftString
        Name = 'SD_NUM'
        ParamType = ptUnknown
      end>
    ProviderName = 'prvFindSdelka'
    AfterScroll = cdsFindSdelkaAfterScroll
    OnCalcFields = cdsFindSdelkaCalcFields
    Left = 613
    Top = 16
    object cdsFindSdelkaAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsFindSdelkaSD_ID: TIntegerField
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsFindSdelkaCU_ID: TIntegerField
      FieldName = 'CU_ID'
    end
    object cdsFindSdelkaCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object cdsFindSdelkaSD_ID_COMPOUND: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'SD_ID_COMPOUND'
      FixedChar = True
      Size = 12
    end
    object cdsFindSdelkaPT_ID: TIntegerField
      FieldName = 'PT_ID'
    end
    object cdsFindSdelkaSD_ZAPAS: TIntegerField
      DisplayLabel = #1047#1072#1087#1072#1089
      FieldName = 'SD_ZAPAS'
    end
    object cdsFindSdelkaAG_NAME: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_NAME'
      Size = 128
    end
    object cdsFindSdelkaPT_NAME_LK: TStringField
      DisplayLabel = #1060#1054
      FieldKind = fkLookup
      FieldName = 'PT_NAME_LK'
      LookupDataSet = tblPayType
      LookupKeyFields = 'PT_ID'
      LookupResultField = 'PT_NAME'
      KeyFields = 'PT_ID'
      ReadOnly = True
      Lookup = True
    end
    object cdsFindSdelkaSD_FACT_NUM: TIntegerField
      DisplayLabel = #1057#1095#1105#1090
      FieldName = 'SD_FACT_NUM'
    end
    object cdsFindSdelkaSD_ALL_PAYED: TIntegerField
      FieldName = 'SD_ALL_PAYED'
    end
    object cdsFindSdelkaSD_ALL_PAYED_LK: TStringField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1072
      FieldKind = fkLookup
      FieldName = 'SD_ALL_PAYED_LK'
      LookupDataSet = tblBool
      LookupKeyFields = 'BL_ID'
      LookupResultField = 'BL_NAME'
      KeyFields = 'SD_ALL_PAYED'
      LookupCache = True
      ReadOnly = True
      Lookup = True
    end
    object cdsFindSdelkaSD_SUM_PAYED: TFloatField
      DisplayLabel = #1054#1087#1083'-'#1085#1086
      FieldName = 'SD_SUM_PAYED'
    end
    object cdsFindSdelkaSD_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SD_SUM'
    end
    object cdsFindSdelkaSD_STATE: TSmallintField
      FieldName = 'SD_STATE'
    end
    object cdsFindSdelkaPODACHA_NUMS: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object cdsFindSdelkaSD_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'SD_DATE'
    end
    object cdsFindSdelkaSD_FACT_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1095#1105#1090#1072
      FieldName = 'SD_FACT_DATE'
    end
    object cdsFindSdelkaFM_ID: TIntegerField
      FieldName = 'FM_ID'
    end
    object cdsFindSdelkaRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object cdsFindSdelkaFM_NAME_LK: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldKind = fkLookup
      FieldName = 'FM_NAME_LK'
      LookupDataSet = tblFormat
      LookupKeyFields = 'FM_ID'
      LookupResultField = 'FM_NAME'
      KeyFields = 'FM_ID'
      LookupCache = True
      Lookup = True
    end
    object cdsFindSdelkaRB_NAME_LK: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldKind = fkLookup
      FieldName = 'RB_NAME_LK'
      LookupDataSet = tblRubrika
      LookupKeyFields = 'RB_ID'
      LookupResultField = 'RB_NAME_SHORT'
      KeyFields = 'RB_ID'
      LookupCache = True
      Lookup = True
    end
    object cdsFindSdelkaSDELKA_IS_OF_CURRENT_AGENT: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'SDELKA_IS_OF_CURRENT_AGENT'
      ProviderFlags = []
      Calculated = True
    end
    object cdsFindSdelkaGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object cdsFindSdelkaSD_TYPE: TSmallintField
      FieldName = 'SD_TYPE'
    end
    object cdsFindSdelkaSD_TYPE_DESC: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'SD_TYPE_DESC'
      Size = 10
    end
    object cdsFindSdelkaSD_PAY_VER: TIntegerField
      FieldName = 'SD_PAY_VER'
    end
    object cdsFindSdelkaSD_KA_START_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_START_DATE'
    end
    object cdsFindSdelkaSD_KA_END_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_END_DATE'
    end
    object cdsFindSdelkaSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
    object cdsFindSdelkaSDELKA_IS_OF_CURRENT_USER: TIntegerField
      FieldName = 'SDELKA_IS_OF_CURRENT_USER'
    end
    object cdsFindSdelkaCU_COMPANY_ID: TIntegerField
      FieldName = 'CU_COMPANY_ID'
    end
  end
  object prvAgent: TDataSetProvider
    DataSet = qryAgent
    Left = 85
    Top = 56
  end
  object dsAgentLink: TDataSource
    DataSet = qryAgent
    Left = 29
    Top = 104
  end
  object cdsAgent: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAgent'
    Left = 141
    Top = 56
    object cdsAgentAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsAgentAG_NAME: TStringField
      FieldName = 'AG_NAME'
      Size = 128
    end
    object cdsAgentAG_IS_REMOTE: TSmallintField
      FieldName = 'AG_IS_REMOTE'
    end
    object cdsAgentAG_FACTURA_PHONES: TStringField
      FieldName = 'AG_FACTURA_PHONES'
      Size = 64
    end
  end
  object qrySdelka: TSQLQuery
    GetMetadata = True
    DataSource = dsAgent
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'select'
      '      SD.SD_NEW_CUST'
      '     ,SD.SD_NUM'
      '    , SD.AG_ID'
      '    , SD.SD_ID'
      '    , SD.SD_TYPE'
      '    , SD.SD_STATE'
      '    , SD.CU_ID'
      '    , SD.SD_SUM'
      '    , SD.SD_PERCENT'
      '    , SD.SD_SUM_DEFAULT'
      '    , SD.SD_PERCENT_DEFAULT'
      '    , SD.SD_SKIDKA'
      '    , SD.PT_ID'
      '    , SD.SD_ID_COMPOUND'
      '    , SD.GZ_ID'
      '    , SD.SD_COMMENT'
      '    , SD.SD_SUM_PAYED'
      '    , SD.SD_ALL_PAYED'
      '    , SD.SD_COMMENT_SHORT'
      '    , SD.AS_ID'
      '    , SD.SD_PAY_NOW'
      '    , SD.SD_FACT_NUM'
      '    , SD.SD_KA_START_DATE'
      '    , SD.SD_KA_END_DATE'
      '    , SD.SD_FACT_DATE'
      '    , SD.SD_PERCENT_SUM'
      '    , SD.SD_PERCENT_GIVEN'
      '    , SD.SD_TO_GIVE_PERCENT'
      '    , sdt.SD_TYPE_DESC    '
      '    , CU.CU_NAME'
      '    , AC.PODACHA_NUMS'
      '    , SDS.SDS_NAME'
      '    , GZ.GZ_NAME'
      '    , PT.PT_NAME'
      '    , AST.AS_NAME'
      '    , MFR.FM_ID'
      '    , MFR.RB_ID'
      '    , ('
      '        select count(*)'
      '        from PODACHA pd'
      '        where       pd.AG_ID = sd.AG_ID'
      '                and pd.SD_ID = sd.SD_ID'
      '                and pd.IS_ID = ('
      '                    select pm.PM_CURRENT_ISSUE_SR'
      '                    from PARAMS pm'
      '                )'
      '      ) as SR_IS_CURRENT_ISSUE'
      '    , ('
      '          select count(*)'
      '          from'
      '              OBJAV iob, RUBRIKA irb'
      '          where     iob.AG_ID = sd.AG_ID'
      '                and iob.SD_ID = sd.SD_ID'
      '                and irb.RB_ID = iob.RB_ID'
      '                and iob.OB_IS_ACTIVE = 1'
      '                and iob.FM_ID <> 14'
      '                and irb.RB_IS_LOCKABLE = 1'
      '      ) + ('
      '          select count(*)'
      '          from'
      '              PODACHA pd'
      ''
      '              left join OBJAVLENIE iob2'
      '              on (iob2.PD_ID = pd.PD_ID)'
      ''
      '              left join RUBRIKA irb2'
      '              on (iob2.RB_ID = irb2.RB_ID)'
      ''
      '              left join RUBRIKA irb3'
      '              on (iob2.DOUBLE_RB_ID = irb3.RB_ID)'
      '          where     pd.AG_ID = sd.AG_ID'
      '                and pd.SD_ID = sd.SD_ID'
      '                and pd.PD_IS_DONE <> 1'
      '                and ('
      '                       irb2.RB_IS_LOCKABLE = 1'
      '                    or irb3.RB_IS_LOCKABLE = 1'
      '                )'
      '      ) as RB_IS_LOCKABLE,'
      
        '      (select a.AG_NAME from AGENT a where a.AG_ID = sw.AG_ID) a' +
        's AG_NAME'
      'from'
      '    SDELKA_WORKING_LIST sw'
      ''
      '    left join SDELKA SD'
      '    on (sd.AG_ID = sw.AG_ID and sd.SD_ID = sw.SD_ID)'
      ''
      ''
      '    left join SDELKA_TYPE_DESC sdt'
      '    on (sdt.SD_TYPE = sd.SD_TYPE and sdt.GZ_ID = sd.GZ_ID)'
      ''
      '    left join SDELKA_PODACHA_NUMS(sw.AG_ID, sw.SD_ID) AC'
      '    on (1 = 1)'
      ''
      '    left join CUST CU'
      '    on (SD.AG_ID = CU.AG_ID and SD.CU_ID = CU.CU_ID)'
      ''
      '    left join  SDELKA_STATE SDS'
      '    on (SD.SD_STATE = SDS.SDS_ID)'
      ''
      '    left join GAZETA GZ'
      '    on (SD.GZ_ID = GZ.GZ_ID)'
      ''
      '    left join PAY_TYPE PT'
      '    on (SD.PT_ID = PT.PT_ID)'
      ''
      '    left join APPROVING_STATUS AST'
      '    on (SD.AS_ID = AST.AS_ID)'
      ''
      '    left join GET_MAX_FORMAT_AND_RUBRIKA(sd.AG_ID, sd.SD_ID) MFR'
      '    on (1 = 1)'
      'where'
      '    sw.AG_ID = :AG_ID'
      '    and'
      '    ('
      '        sw.SD_STATE in (1, 2, 4)'
      '        or'
      '        sw.AS_ID = 1'
      '    )'
      'order by'
      '        sd.SD_ID desc'
      '')
    SQLConnection = connection
    Left = 93
    Top = 104
    object qrySdelkaAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySdelkaSD_ID: TIntegerField
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySdelkaSD_TYPE: TSmallintField
      FieldName = 'SD_TYPE'
      Required = True
    end
    object qrySdelkaSD_STATE: TSmallintField
      FieldName = 'SD_STATE'
      Required = True
    end
    object qrySdelkaCU_ID: TIntegerField
      FieldName = 'CU_ID'
    end
    object qrySdelkaSD_SUM: TFloatField
      FieldName = 'SD_SUM'
    end
    object qrySdelkaSD_PERCENT: TFloatField
      FieldName = 'SD_PERCENT'
    end
    object qrySdelkaSD_SUM_DEFAULT: TFloatField
      FieldName = 'SD_SUM_DEFAULT'
    end
    object qrySdelkaSD_PERCENT_DEFAULT: TFloatField
      FieldName = 'SD_PERCENT_DEFAULT'
    end
    object qrySdelkaSD_SKIDKA: TFloatField
      FieldName = 'SD_SKIDKA'
    end
    object qrySdelkaPT_ID: TSmallintField
      FieldName = 'PT_ID'
      Required = True
    end
    object qrySdelkaSD_ID_COMPOUND: TStringField
      FieldName = 'SD_ID_COMPOUND'
      ProviderFlags = []
      Size = 23
    end
    object qrySdelkaGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object qrySdelkaSD_COMMENT: TStringField
      FieldName = 'SD_COMMENT'
      Size = 1024
    end
    object qrySdelkaSD_SUM_PAYED: TFloatField
      FieldName = 'SD_SUM_PAYED'
    end
    object qrySdelkaSD_ALL_PAYED: TSmallintField
      FieldName = 'SD_ALL_PAYED'
    end
    object qrySdelkaSD_COMMENT_SHORT: TStringField
      FieldName = 'SD_COMMENT_SHORT'
      Size = 128
    end
    object qrySdelkaAS_ID: TSmallintField
      FieldName = 'AS_ID'
      Required = True
    end
    object qrySdelkaSD_PAY_NOW: TSmallintField
      FieldName = 'SD_PAY_NOW'
      Required = True
    end
    object qrySdelkaSD_FACT_NUM: TIntegerField
      FieldName = 'SD_FACT_NUM'
    end
    object qrySdelkaSD_KA_START_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_START_DATE'
    end
    object qrySdelkaSD_KA_END_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_END_DATE'
    end
    object qrySdelkaSD_FACT_DATE: TSQLTimeStampField
      FieldName = 'SD_FACT_DATE'
    end
    object qrySdelkaSD_PERCENT_SUM: TFloatField
      FieldName = 'SD_PERCENT_SUM'
      ProviderFlags = []
    end
    object qrySdelkaSD_PERCENT_GIVEN: TSmallintField
      FieldName = 'SD_PERCENT_GIVEN'
    end
    object qrySdelkaSD_TO_GIVE_PERCENT: TSmallintField
      FieldName = 'SD_TO_GIVE_PERCENT'
      ProviderFlags = []
    end
    object qrySdelkaCU_NAME: TStringField
      FieldName = 'CU_NAME'
      ProviderFlags = []
      Size = 128
    end
    object qrySdelkaPODACHA_NUMS: TStringField
      FieldName = 'PODACHA_NUMS'
      ProviderFlags = []
      Size = 128
    end
    object qrySdelkaGZ_NAME: TStringField
      FieldName = 'GZ_NAME'
      ProviderFlags = []
      Size = 64
    end
    object qrySdelkaPT_NAME: TStringField
      FieldName = 'PT_NAME'
      ProviderFlags = []
      Size = 64
    end
    object qrySdelkaAS_NAME: TStringField
      FieldName = 'AS_NAME'
      ProviderFlags = []
      Size = 64
    end
    object qrySdelkaFM_ID: TIntegerField
      FieldName = 'FM_ID'
      ProviderFlags = []
    end
    object qrySdelkaRB_ID: TIntegerField
      FieldName = 'RB_ID'
      ProviderFlags = []
    end
    object qrySdelkaRB_IS_LOCKABLE: TFMTBCDField
      DisplayLabel = #1055#1088#1080#1086#1088#1080#1090#1077#1090
      FieldName = 'RB_IS_LOCKABLE'
      ProviderFlags = []
      Precision = 15
      Size = 0
    end
    object qrySdelkaSR_IS_CURRENT_ISSUE: TIntegerField
      DisplayLabel = #1058#1077#1082'. '#8470' '#1057#1058
      FieldName = 'SR_IS_CURRENT_ISSUE'
      ProviderFlags = []
    end
    object qrySdelkaSD_TYPE_DESC: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'SD_TYPE_DESC'
      ProviderFlags = []
      Size = 10
    end
    object qrySdelkaSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
    object qrySdelkaSD_NEW_CUST: TSmallintField
      FieldName = 'SD_NEW_CUST'
    end
  end
  object prvSdelka: TDataSetProvider
    DataSet = qrySdelka
    OnGetTableName = prvSdelkaGetTableName
    Left = 149
    Top = 104
  end
  object tblObjavState: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'OBJAV_STATE'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 317
    Top = 309
    object tblObjavStateOS_ID: TIntegerField
      FieldName = 'OS_ID'
      Required = True
    end
    object tblObjavStateOS_NAME: TStringField
      FieldName = 'OS_NAME'
      Size = 64
    end
  end
  object dsObjavState: TDataSource
    DataSet = tblObjavState
    Left = 373
    Top = 325
  end
  object qryFindSdelkaByText: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'AG_ID'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'OB_TEXT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IS_ID'
        ParamType = ptInput
        Value = '-1'
      end
      item
        DataType = ftInteger
        Name = 'US_ID'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'SELECT'
      '    DISTINCT'
      '      FS.*'
      '                , SD.SD_NUM'
      '                , SD.SD_PAY_VER '
      '    , SD.GZ_ID'
      '    , SD.SD_TYPE    '
      '    , SD.SD_DATE'
      '    , SD.SD_STATE'
      '    , SD.SD_SUM'
      '    , SD.SD_SUM_PAYED'
      '    , sdt.SD_TYPE_DESC'
      
        '    , CASE WHEN sd.GZ_ID IN (0, 6) THEN LPAD(EXTRACT(DAY FROM sd' +
        '.SD_KA_START_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        LPAD(EXTRACT(MONTH FROM ' +
        'sd.SD_KA_START_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        EXTRACT(YEAR FROM sd.SD_' +
        'KA_START_DATE)||'#39' - '#39'||'
      
        '                                        LPAD(EXTRACT(DAY FROM sd' +
        '.SD_KA_END_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        LPAD(EXTRACT(MONTH FROM ' +
        'sd.SD_KA_END_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        EXTRACT(YEAR FROM sd.SD_' +
        'KA_END_DATE)'
      '           ELSE spn.PODACHA_NUMS'
      '      END AS PODACHA_NUMS'
      '    , MFR.FM_ID'
      '    , MFR.RB_ID'
      '    , SD.SD_FACT_DATE'
      '/*    , gz.GZ_NAME_SHORT*/    '
      '    , UR.AG_ID AS SDELKA_IS_OF_CURRENT_USER'
      '                ,SD.SD_KA_START_DATE'
      '                ,SD.SD_KA_END_DATE'
      '     , c.CU_COMPANY_ID'
      'FROM'
      '    FIND_SDELKA_BY_TEXT(:AG_ID,:OB_TEXT,:IS_ID) FS'
      ''
      '    LEFT JOIN SDELKA SD'
      '    ON (FS.AG_ID=SD.AG_ID AND FS.SD_ID=SD.SD_ID)'
      ''
      '    left join SDELKA_TYPE_DESC sdt'
      '    on (sdt.SD_TYPE = sd.SD_TYPE and sdt.GZ_ID = sd.GZ_ID)'
      ''
      '    LEFT JOIN SDELKA_PODACHA_NUMS(SD.AG_ID,SD.SD_ID) SPN'
      '    ON (SD.SD_ID=SPN.SD_ID)'
      ''
      '    LEFT JOIN GET_MAX_FORMAT_AND_RUBRIKA(SD.AG_ID,SD.SD_ID) MFR'
      '    ON (SD.SD_ID=SD.SD_ID)'
      ''
      '    LEFT JOIN USR_RIGHTS UR'
      '    ON (UR.AG_ID=FS.AG_ID AND UR.US_ID=:US_ID)'
      ''
      
        '    LEFT JOIN CUST c ON (c.AG_ID = fs.AG_ID AND c.CU_ID = fs.CU_' +
        'ID)'
      '/*    left join GAZETA gz'
      '    on (gz.GZ_ID = sd.GZ_ID)*/'
      'ORDER BY'
      '    SD.SD_DATE DESC')
    SQLConnection = connection
    Left = 493
    Top = 152
    object qryFindSdelkaByTextCU_COMPANY_ID: TIntegerField
      FieldName = 'CU_COMPANY_ID'
    end
    object IntegerField1: TIntegerField
      Tag = 13
      DisplayWidth = 12
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IntegerField2: TIntegerField
      Tag = 13
      DisplayWidth = 12
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IntegerField4: TIntegerField
      Tag = 13
      DisplayWidth = 12
      FieldName = 'CU_ID'
    end
    object StringField3: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      DisplayWidth = 154
      FieldName = 'CU_NAME'
      Size = 128
    end
    object StringField4: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 15
      FieldName = 'SD_ID_COMPOUND'
      FixedChar = True
      Size = 12
    end
    object IntegerField6: TIntegerField
      Tag = 13
      DisplayWidth = 12
      FieldName = 'PT_ID'
    end
    object IntegerField7: TIntegerField
      DisplayLabel = #1047#1072#1087#1072#1089
      DisplayWidth = 12
      FieldName = 'SD_ZAPAS'
    end
    object StringField5: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      DisplayWidth = 154
      FieldName = 'AG_NAME'
      Size = 128
    end
    object IntegerField9: TIntegerField
      DisplayLabel = #1057#1095#1105#1090
      DisplayWidth = 12
      FieldName = 'SD_FACT_NUM'
    end
    object IntegerField10: TIntegerField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1072
      DisplayWidth = 12
      FieldName = 'SD_ALL_PAYED'
    end
    object FloatField1: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      DisplayWidth = 12
      FieldName = 'SD_SUM_PAYED'
    end
    object FloatField2: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 12
      FieldName = 'SD_SUM'
    end
    object SmallintField3: TSmallintField
      Tag = 13
      DisplayWidth = 12
      FieldName = 'SD_STATE'
    end
    object StringField9: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      DisplayWidth = 306
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object SQLTimeStampField3: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'SD_DATE'
    end
    object SQLTimeStampField4: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1095#1105#1090#1072
      FieldName = 'SD_FACT_DATE'
    end
    object qryFindSdelkaByTextFM_ID: TIntegerField
      FieldName = 'FM_ID'
    end
    object qryFindSdelkaByTextRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object qryFindSdelkaByTextSDELKA_IS_OF_CURRENT_USER: TIntegerField
      FieldName = 'SDELKA_IS_OF_CURRENT_USER'
      ProviderFlags = []
    end
    object qryFindSdelkaByTextGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object qryFindSdelkaByTextSD_TYPE: TSmallintField
      FieldName = 'SD_TYPE'
    end
    object qryFindSdelkaByTextSD_TYPE_DESC: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'SD_TYPE_DESC'
      Size = 10
    end
    object qryFindSdelkaByTextSD_PAY_VER: TIntegerField
      FieldName = 'SD_PAY_VER'
    end
    object qryFindSdelkaByTextSD_KA_START_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_START_DATE'
    end
    object qryFindSdelkaByTextSD_KA_END_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_END_DATE'
    end
    object qryFindSdelkaByTextSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
  end
  object tblSdelkaState: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'SDELKA_STATE'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    ReadOnly = True
    Left = 317
    Top = 544
    object tblSdelkaStateSDS_ID: TSmallintField
      FieldName = 'SDS_ID'
      Required = True
    end
    object tblSdelkaStateSDS_NAME: TStringField
      FieldName = 'SDS_NAME'
      Size = 64
    end
  end
  object dsSdelkaState: TDataSource
    DataSet = tblSdelkaState
    Left = 373
    Top = 560
  end
  object qryCustOne: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CU_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM CUST'
      'WHERE AG_ID=:AG_ID AND CU_ID=:CU_ID')
    SQLConnection = connection
    Left = 21
    Top = 424
    object qryCustOneAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCustOneCU_ID: TIntegerField
      FieldName = 'CU_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCustOneCU_NAME: TStringField
      FieldName = 'CU_NAME'
      ProviderFlags = [pfInUpdate]
      Size = 128
    end
    object qryCustOneCU_ID_COMPOUND: TStringField
      FieldName = 'CU_ID_COMPOUND'
      ProviderFlags = [pfInUpdate]
      Size = 23
    end
    object qryCustOneCU_BONUS_ENABLED: TSmallintField
      FieldName = 'CU_BONUS_ENABLED'
      ProviderFlags = [pfInUpdate]
    end
    object qryCustOneCU_INFO: TStringField
      FieldName = 'CU_INFO'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object qryCustOneCU_KA_INFO_SHORT: TStringField
      FieldName = 'CU_KA_INFO_SHORT'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object qryCustOneCU_KA_INFO_FULL: TStringField
      FieldName = 'CU_KA_INFO_FULL'
      ProviderFlags = [pfInUpdate]
      Size = 1023
    end
    object qryCustOneCU_OKPO: TStringField
      FieldName = 'CU_OKPO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object qryCustOneCUQ_REG_ID: TIntegerField
      FieldName = 'CUQ_REG_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qryCustOneCU_COMPANY_ID: TIntegerField
      FieldName = 'CU_COMPANY_ID'
    end
    object qryCustOneCU_EMAIL: TStringField
      FieldName = 'CU_EMAIL'
      Size = 128
    end
    object qryCustOneCU_PASSWORD: TStringField
      FieldName = 'CU_PASSWORD'
      Size = 128
    end
  end
  object dsCustOne: TDataSource
    DataSet = cdsCustOne
    Left = 213
    Top = 424
  end
  object cdsCustOne: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CU_ID'
        ParamType = ptInput
      end>
    ProviderName = 'prvCustOne'
    OnReconcileError = cdsCust_ReconcileError
    Left = 149
    Top = 424
    object cdsCustOneCU_EMAIL: TStringField
      FieldName = 'CU_EMAIL'
      Size = 128
    end
    object cdsCustOneCU_PASSWORD: TStringField
      FieldName = 'CU_PASSWORD'
      Size = 128
    end
    object cdsCustOneAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCustOneCU_ID: TIntegerField
      FieldName = 'CU_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCustOneCU_NAME: TStringField
      FieldName = 'CU_NAME'
      ProviderFlags = [pfInUpdate]
      Size = 128
    end
    object cdsCustOneCU_ID_COMPOUND: TStringField
      FieldName = 'CU_ID_COMPOUND'
      ProviderFlags = [pfInUpdate]
      Size = 23
    end
    object cdsCustOneCU_BONUS_ENABLED: TSmallintField
      FieldName = 'CU_BONUS_ENABLED'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCustOneCU_INFO: TStringField
      FieldName = 'CU_INFO'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object cdsCustOneCU_KA_INFO_SHORT: TStringField
      FieldName = 'CU_KA_INFO_SHORT'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object cdsCustOneCU_KA_INFO_FULL: TStringField
      FieldName = 'CU_KA_INFO_FULL'
      ProviderFlags = [pfInUpdate]
      Size = 1023
    end
    object cdsCustOneCU_OKPO: TStringField
      FieldName = 'CU_OKPO'
      ProviderFlags = [pfInUpdate]
      OnGetText = cdsCustOneCU_OKPOGetText
      FixedChar = True
      Size = 10
    end
    object cdsCustOneCUQ_REG_ID: TIntegerField
      FieldName = 'CUQ_REG_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCustOneCU_COMPANY_ID: TIntegerField
      FieldName = 'CU_COMPANY_ID'
    end
  end
  object prvCustOne: TDataSetProvider
    DataSet = qryCustOne
    Left = 85
    Top = 424
  end
  object qryCustUnique: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CUQ_OKPO'
        ParamType = ptInput
        Value = '312012826128'
      end>
    SQL.Strings = (
      'SELECT'
      '    *'
      'FROM'
      '    CUST_UNIQUE CUQ'
      'WHERE'
      '    CUQ.CUQ_OKPO=:CUQ_OKPO')
    SQLConnection = connection
    Left = 21
    Top = 470
    object qryCustUniqueCUQ_TYPE: TSmallintField
      FieldName = 'CUQ_TYPE'
      Required = True
    end
    object qryCustUniqueCUQ_FULL_NAME: TStringField
      FieldName = 'CUQ_FULL_NAME'
      Required = True
      Size = 64
    end
    object qryCustUniqueCUQ_ADDRESS: TStringField
      FieldName = 'CUQ_ADDRESS'
      Size = 64
    end
    object qryCustUniqueCUQ_ADDRESS_REAL: TStringField
      FieldName = 'CUQ_ADDRESS_REAL'
      Size = 64
    end
    object qryCustUniqueCUQ_NAME: TStringField
      FieldName = 'CUQ_NAME'
      Required = True
      Size = 32
    end
    object qryCustUniqueCUQ_PHONES: TStringField
      FieldName = 'CUQ_PHONES'
      Size = 30
    end
    object qryCustUniqueCUQ_BOSS: TStringField
      FieldName = 'CUQ_BOSS'
      Size = 40
    end
    object qryCustUniqueCUQ_BUHGALTER: TStringField
      FieldName = 'CUQ_BUHGALTER'
      Size = 40
    end
    object qryCustUniqueCUQ_OKPO: TStringField
      FieldName = 'CUQ_OKPO'
      Required = True
      FixedChar = True
      Size = 10
    end
    object qryCustUniqueCUQ_INN: TStringField
      FieldName = 'CUQ_INN'
      Required = True
      FixedChar = True
      Size = 15
    end
    object qryCustUniqueCUQ_NDS_NUM: TStringField
      FieldName = 'CUQ_NDS_NUM'
      FixedChar = True
      Size = 15
    end
    object qryCustUniqueCUQ_CONTACT: TStringField
      FieldName = 'CUQ_CONTACT'
      Size = 50
    end
    object qryCustUniqueCUQ_DOC_SER: TStringField
      FieldName = 'CUQ_DOC_SER'
      Size = 10
    end
    object qryCustUniqueCUQ_DOC_NUM: TStringField
      FieldName = 'CUQ_DOC_NUM'
      Size = 10
    end
    object qryCustUniqueCUQ_DOC_AUTHOR: TStringField
      FieldName = 'CUQ_DOC_AUTHOR'
      Size = 60
    end
    object qryCustUniqueCUQ_DOC_DATE: TStringField
      FieldName = 'CUQ_DOC_DATE'
      FixedChar = True
      Size = 10
    end
    object qryCustUniqueCUQ_1C_ID: TIntegerField
      FieldName = 'CUQ_1C_ID'
      Required = True
    end
    object qryCustUniqueCUQ_REG_ID: TIntegerField
      FieldName = 'CUQ_REG_ID'
      Required = True
    end
    object qryCustUniqueCUQ_CHANGED: TSmallintField
      FieldName = 'CUQ_CHANGED'
      Required = True
    end
  end
  object prvCustUnique: TDataSetProvider
    DataSet = qryCustUnique
    Left = 85
    Top = 470
  end
  object cdsCustUnique: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CUQ_OKPO'
        ParamType = ptInput
        Size = 12
      end>
    ProviderName = 'prvCustUnique'
    Left = 149
    Top = 470
    object cdsCustUniqueCUQ_TYPE: TSmallintField
      FieldName = 'CUQ_TYPE'
      Required = True
    end
    object cdsCustUniqueCUQ_FULL_NAME: TStringField
      FieldName = 'CUQ_FULL_NAME'
      Required = True
      Size = 64
    end
    object cdsCustUniqueCUQ_ADDRESS: TStringField
      FieldName = 'CUQ_ADDRESS'
      Size = 64
    end
    object cdsCustUniqueCUQ_ADDRESS_REAL: TStringField
      FieldName = 'CUQ_ADDRESS_REAL'
      Size = 64
    end
    object cdsCustUniqueCUQ_NAME: TStringField
      FieldName = 'CUQ_NAME'
      Required = True
      Size = 32
    end
    object cdsCustUniqueCUQ_PHONES: TStringField
      FieldName = 'CUQ_PHONES'
      Size = 30
    end
    object cdsCustUniqueCUQ_BOSS: TStringField
      FieldName = 'CUQ_BOSS'
      Size = 40
    end
    object cdsCustUniqueCUQ_BUHGALTER: TStringField
      FieldName = 'CUQ_BUHGALTER'
      Size = 40
    end
    object cdsCustUniqueCUQ_OKPO: TStringField
      FieldName = 'CUQ_OKPO'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cdsCustUniqueCUQ_INN: TStringField
      FieldName = 'CUQ_INN'
      Required = True
      FixedChar = True
      Size = 15
    end
    object cdsCustUniqueCUQ_NDS_NUM: TStringField
      FieldName = 'CUQ_NDS_NUM'
      FixedChar = True
      Size = 15
    end
    object cdsCustUniqueCUQ_CONTACT: TStringField
      FieldName = 'CUQ_CONTACT'
      Size = 50
    end
    object cdsCustUniqueCUQ_DOC_SER: TStringField
      FieldName = 'CUQ_DOC_SER'
      Size = 10
    end
    object cdsCustUniqueCUQ_DOC_NUM: TStringField
      FieldName = 'CUQ_DOC_NUM'
      Size = 10
    end
    object cdsCustUniqueCUQ_DOC_AUTHOR: TStringField
      FieldName = 'CUQ_DOC_AUTHOR'
      Size = 60
    end
    object cdsCustUniqueCUQ_DOC_DATE: TStringField
      FieldName = 'CUQ_DOC_DATE'
      FixedChar = True
      Size = 10
    end
    object cdsCustUniqueCUQ_1C_ID: TIntegerField
      FieldName = 'CUQ_1C_ID'
      Required = True
    end
    object cdsCustUniqueCUQ_REG_ID: TIntegerField
      FieldName = 'CUQ_REG_ID'
      Required = True
    end
    object cdsCustUniqueCUQ_CHANGED: TSmallintField
      FieldName = 'CUQ_CHANGED'
      Required = True
    end
  end
  object dsCustUnique: TDataSource
    DataSet = cdsCustUnique
    Left = 213
    Top = 470
  end
  object cdsAlterAgentPercent: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAlterAgentPercent'
    Left = 717
    Top = 350
    object cdsAlterAgentPercentAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = []
      Required = True
    end
    object cdsAlterAgentPercentAG_NAME_LK: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldKind = fkLookup
      FieldName = 'AG_NAME_LK'
      LookupDataSet = tblAgentsList
      LookupKeyFields = 'AG_ID'
      LookupResultField = 'AG_NAME'
      KeyFields = 'AG_ID'
      ProviderFlags = []
      Lookup = True
    end
    object cdsAlterAgentPercentPERCENT_BEZNAL_DELTA: TIntegerField
      DisplayLabel = #1041#1077#1079#1085#1072#1083
      FieldName = 'PERCENT_BEZNAL_DELTA'
      ProviderFlags = []
      Required = True
    end
    object cdsAlterAgentPercentPERCENT_NAL_DELTA: TIntegerField
      DisplayLabel = #1053#1072#1083#1080#1095#1085#1099#1077
      FieldName = 'PERCENT_NAL_DELTA'
      ProviderFlags = []
      Required = True
    end
    object cdsAlterAgentPercentPERCENT_CREDIT_DELTA: TIntegerField
      DisplayLabel = #1050#1088#1077#1076#1080#1090
      FieldName = 'PERCENT_CREDIT_DELTA'
      ProviderFlags = []
      Required = True
    end
    object cdsAlterAgentPercentPERCENT_BEZNAL_V_NAL_DELTA: TIntegerField
      DisplayLabel = #1041#1077#1079#1085#1072#1083' '#1074' '#1085#1072#1083
      FieldName = 'PERCENT_BEZNAL_V_NAL_DELTA'
      ProviderFlags = []
      Required = True
    end
  end
  object qryAlterAgentPercent: TSQLQuery
    DataSource = dsUsr
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'US_ID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT'
      '    UR.AG_ID,'
      '    0 AS PERCENT_BEZNAL_DELTA,'
      '    0 AS PERCENT_NAL_DELTA,'
      '    0 AS PERCENT_CREDIT_DELTA,'
      '    0 AS PERCENT_BEZNAL_V_NAL_DELTA'
      'FROM'
      '    USR_RIGHTS UR'
      '    LEFT JOIN AGENT AG'
      '    ON (UR.AG_ID=AG.AG_ID)'
      'WHERE'
      '    US_ID=:US_ID ORDER BY AG.AG_NAME')
    SQLConnection = connection
    Left = 717
    Top = 302
    object qryAlterAgentPercentAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Required = True
    end
    object qryAlterAgentPercentPERCENT_BEZNAL_DELTA: TIntegerField
      FieldName = 'PERCENT_BEZNAL_DELTA'
      ProviderFlags = []
      Required = True
    end
    object qryAlterAgentPercentPERCENT_NAL_DELTA: TIntegerField
      FieldName = 'PERCENT_NAL_DELTA'
      ProviderFlags = []
      Required = True
    end
    object qryAlterAgentPercentPERCENT_CREDIT_DELTA: TIntegerField
      FieldName = 'PERCENT_CREDIT_DELTA'
      ProviderFlags = []
      Required = True
    end
    object qryAlterAgentPercentPERCENT_BEZNAL_V_NAL_DELTA: TIntegerField
      FieldName = 'PERCENT_BEZNAL_V_NAL_DELTA'
      ProviderFlags = []
      Required = True
    end
  end
  object prvAlterAgentPercent: TDataSetProvider
    DataSet = qryAlterAgentPercent
    Left = 789
    Top = 318
  end
  object dsAlterAgentPercent: TDataSource
    DataSet = cdsAlterAgentPercent
    Left = 789
    Top = 366
  end
  object qryDoAlterAgentPercent: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'DELTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AG_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PAY_TYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_FROM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_TO'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'UPDATE'
      '    SDELKA SD'
      'SET'
      '    SD_PERCENT=SD_PERCENT+:DELTA'
      'WHERE'
      '    SD.AG_ID=:AG_ID AND'
      '    SD.PT_ID=:PAY_TYPE AND'
      '    SD.SD_PERCENT<>0 AND'
      '    SD.SD_PERCENT IS NOT NULL AND'
      '    SD.SD_APPROVED_DATE>=:DATE_FROM AND'
      '    SD.SD_APPROVED_DATE<=:DATE_TO')
    SQLConnection = connection
    Left = 717
    Top = 443
  end
  object spLogUser: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'EDITORNAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'EDITORADDR'
        ParamType = ptInput
      end>
    SQLConnection = connection
    StoredProcName = 'LOG_USER'
    Left = 933
    Top = 231
  end
  object spUserLoginLog: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'US_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'HOST'
        ParamType = ptInput
      end>
    SQLConnection = connection
    StoredProcName = 'USER_LOGGED_IN'
    Left = 933
    Top = 281
  end
  object spNalVKredit: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptInput
      end>
    SQLConnection = connection
    StoredProcName = 'NAL_V_KREDIT'
    Left = 933
    Top = 22
  end
  object qryAccessRights: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 
      'SELECT * FROM ACCESS_RIGHTS_RULE ORDER BY ARR_WINDOW_NAME,ARR_OR' +
      'DER'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 725
    Top = 208
    object qryAccessRightsARR_WINDOW_NAME: TStringField
      DisplayLabel = #1054#1082#1085#1086
      FieldName = 'ARR_WINDOW_NAME'
      Required = True
      Size = 32
    end
    object qryAccessRightsARR_ORDER: TSmallintField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1087#1088#1072#1074#1080#1083#1072
      FieldName = 'ARR_ORDER'
      Required = True
    end
    object qryAccessRightsARR_NAME: TStringField
      DisplayLabel = #1055#1088#1072#1074#1080#1083#1086
      FieldName = 'ARR_NAME'
      Required = True
      Size = 64
    end
    object qryAccessRightsARR_USER_TYPES: TStringField
      DisplayLabel = #1058#1080#1087#1099' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
      FieldName = 'ARR_USER_TYPES'
      Required = True
      Size = 32
    end
    object qryAccessRightsARR_TARGET_OBJECT_NAME: TStringField
      DisplayLabel = #1054#1073#1098#1077#1082#1090#1099
      FieldName = 'ARR_TARGET_OBJECT_NAME'
      Required = True
      Size = 64
    end
    object qryAccessRightsARR_CHECK_OBJECT_NAME: TStringField
      DisplayLabel = #1054#1073#1098#1077#1082#1090' '#1076#1083#1103' '#1087#1088#1086#1074#1077#1088#1082#1080
      FieldName = 'ARR_CHECK_OBJECT_NAME'
      Size = 64
    end
    object qryAccessRightsARR_CHECK_MODE: TStringField
      DisplayLabel = #1057#1087#1086#1089#1086#1073' '#1087#1088#1086#1074#1077#1088#1082#1080
      FieldName = 'ARR_CHECK_MODE'
      FixedChar = True
      Size = 2
    end
    object qryAccessRightsARR_CHECK_OBJECT_VALUE: TFloatField
      DisplayLabel = #1047#1085#1072#1095#1077#1085#1080#1077' '#1076#1083#1103' '#1087#1088#1086#1074#1077#1088#1082#1080
      FieldName = 'ARR_CHECK_OBJECT_VALUE'
    end
    object qryAccessRightsARR_ACTION: TStringField
      DisplayLabel = #1056#1077#1078#1080#1084' '#1076#1086#1089#1090#1091#1087#1072
      FieldName = 'ARR_ACTION'
      FixedChar = True
      Size = 1
    end
  end
  object sdsSyncState: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'SYNC_STATE'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 318
    Top = 137
    object sdsSyncStateSS_ID: TSmallintField
      FieldName = 'SS_ID'
      Required = True
    end
    object sdsSyncStateSS_NAME: TStringField
      FieldName = 'SS_NAME'
      Size = 64
    end
    object sdsSyncStateSS_IS_REMOTE: TSmallintField
      FieldName = 'SS_IS_REMOTE'
      Required = True
    end
  end
  object dsSyncState: TDataSource
    DataSet = sdsSyncState
    Left = 373
    Top = 137
  end
  object sdsCheckPhoneInOtkaznik: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 
      'SELECT OT.AG_ID,OT.OT_IS_STATIC,OT.OT_COMMENT,AG.AG_NAME FROM OT' +
      'KAZNIK OT LEFT JOIN AGENT AG ON (OT.AG_ID=AG.AG_ID) WHERE OT.OT_' +
      'NUMBER=:PH_NUMBER'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'PH_NUMBER'
        ParamType = ptInput
        Value = '0'
      end>
    Params = <
      item
        DataType = ftString
        Name = 'PH_NUMBER'
        ParamType = ptInput
        Value = '0'
      end>
    OnCalcFields = sdsCheckPhoneInOtkaznikCalcFields
    Left = 493
    Top = 576
    object sdsCheckPhoneInOtkaznikAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object sdsCheckPhoneInOtkaznikOT_IS_STATIC: TSmallintField
      FieldName = 'OT_IS_STATIC'
      Required = True
    end
    object sdsCheckPhoneInOtkaznikOT_COMMENT: TStringField
      FieldName = 'OT_COMMENT'
      Size = 64
    end
    object sdsCheckPhoneInOtkaznikAG_NAME: TStringField
      FieldName = 'AG_NAME'
      Size = 128
    end
    object sdsCheckPhoneInOtkaznikOT_CALC_DESCRIPTION: TStringField
      DisplayWidth = 255
      FieldKind = fkCalculated
      FieldName = 'OT_CALC_DESCRIPTION'
      Size = 255
      Calculated = True
    end
  end
  object dsCheckPhoneInOtkaznik: TDataSource
    DataSet = sdsCheckPhoneInOtkaznik
    Left = 573
    Top = 592
  end
  object sdsRubrikaSite: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'SELECT * FROM RUBRIKA_SITE ORDER BY RS_NAME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 308
    Top = 608
    object sdsRubrikaSiteRS_ID: TIntegerField
      DisplayLabel = 'ID'
      DisplayWidth = 7
      FieldName = 'RS_ID'
      Required = True
    end
    object sdsRubrikaSiteRS_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 33
      FieldName = 'RS_NAME'
      Required = True
      Size = 128
    end
    object sdsRubrikaSiteDELETED: TSmallintField
      DisplayLabel = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100
      FieldName = 'DELETED'
    end
  end
  object dsRubrikaSite: TDataSource
    DataSet = sdsRubrikaSite
    Left = 372
    Top = 608
  end
  object sdsRubrikaPohozha: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'SELECT * FROM RUBRIKA_POHOZHA ORDER BY RB_ID,RS_ID'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    AfterInsert = sdsRubrikaPohozhaAfterInsert
    Left = 291
    Top = 664
    object sdsRubrikaPohozhaRS_ID: TIntegerField
      DisplayLabel = 'ID '#1088#1091#1073#1088#1080#1082#1080' '#1085#1072' '#1089#1072#1081#1090#1077
      DisplayWidth = 16
      FieldName = 'RS_ID'
      Required = True
    end
    object sdsRubrikaPohozhaRB_ID: TIntegerField
      DisplayLabel = 'ID '#1088#1091#1073#1088#1080#1082#1080' '#1074' '#1075#1072#1079#1077#1090#1077
      DisplayWidth = 16
      FieldName = 'RB_ID'
      Required = True
    end
    object sdsRubrikaPohozhaRS_NAME_LK: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072' '#1085#1072' '#1089#1072#1081#1090#1077
      DisplayWidth = 128
      FieldKind = fkLookup
      FieldName = 'RS_NAME_LK'
      LookupDataSet = sdsRubrikaSite
      LookupKeyFields = 'RS_ID'
      LookupResultField = 'RS_NAME'
      KeyFields = 'RS_ID'
      Size = 128
      Lookup = True
    end
    object sdsRubrikaPohozhaRB_NAME_LK: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072' '#1074' '#1075#1072#1079#1077#1090#1077
      DisplayWidth = 128
      FieldKind = fkLookup
      FieldName = 'RB_NAME_LK'
      LookupDataSet = tblRubrikaByGZ
      LookupKeyFields = 'RB_ID'
      LookupResultField = 'RB_NAME'
      KeyFields = 'RB_ID'
      Size = 128
      Lookup = True
    end
    object sdsRubrikaPohozhaGZ_ID: TIntegerField
      FieldName = 'GZ_ID'
    end
  end
  object dsRubrikaPohozha: TDataSource
    DataSet = sdsRubrikaPohozha
    Left = 373
    Top = 656
  end
  object spNalVBeznal: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptInput
      end>
    SQLConnection = connection
    StoredProcName = 'NAL_V_BEZNAL'
    Left = 933
    Top = 175
  end
  object spLockRubrikas: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'US_ID'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'DO_LOCK'
        ParamType = ptInput
      end>
    SQLConnection = connection
    StoredProcName = 'LOCK_RUBRIKAS'
    Left = 864
    Top = 544
  end
  object qryCheckAgentLocked: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'select AG_LOCK_RUBRIKAS'
      'from AGENT'
      'where AG_ID = :AG_ID')
    SQLConnection = connection
    Left = 495
    Top = 648
    object qryCheckAgentLockedAG_LOCK_RUBRIKAS: TSmallintField
      FieldName = 'AG_LOCK_RUBRIKAS'
      Required = True
    end
  end
  object qryIssueSR: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'SELECT * FROM ISSUE'#13#10'WHERE GZ_ID=3'#13#10'ORDER BY IS_DATE'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    ReadOnly = True
    Left = 317
    Top = 481
    object IntegerField8: TIntegerField
      FieldName = 'IS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SmallintField4: TSmallintField
      FieldName = 'GZ_ID'
      Required = True
    end
    object StringField8: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'IS_NAME'
      Required = True
      Size = 10
    end
    object SQLTimeStampField5: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'IS_DATE'
      Required = True
    end
    object StringField10: TStringField
      DisplayLabel = #1055#1086#1083#1085#1099#1081' '#1085#1086#1084#1077#1088
      FieldName = 'IS_NAME_COMPOSED'
      ProviderFlags = []
      Size = 25
    end
  end
  object dsIssueSR: TDataSource
    DataSet = qryIssueSR
    Left = 373
    Top = 499
  end
  object tblRequisite: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'SELECT * FROM REQUISITE WHERE RQ_ACTIVE = 1'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 493
    Top = 423
    object tblRequisiteRQ_ID: TIntegerField
      FieldName = 'RQ_ID'
      Required = True
    end
    object tblRequisiteRQ_NAME: TStringField
      FieldName = 'RQ_NAME'
      Size = 32
    end
    object tblRequisiteRQ_FULL_NAME: TStringField
      FieldName = 'RQ_FULL_NAME'
      Size = 128
    end
    object tblRequisiteRQ_ACCOUNT: TStringField
      FieldName = 'RQ_ACCOUNT'
      Size = 128
    end
    object tblRequisiteRQ_ADDRESS: TStringField
      FieldName = 'RQ_ADDRESS'
      Size = 128
    end
    object tblRequisiteRQ_PHONES: TStringField
      FieldName = 'RQ_PHONES'
      Size = 64
    end
    object tblRequisiteRQ_ACTIVE: TSmallintField
      FieldName = 'RQ_ACTIVE'
      Required = True
    end
    object tblRequisiteRQ_STAMP: TBlobField
      FieldName = 'RQ_STAMP'
      Size = 1
    end
  end
  object tblOffice: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'SELECT * FROM OFFICE ORDER BY OF_ID'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 493
    Top = 375
    object tblOfficeOF_ID: TIntegerField
      FieldName = 'OF_ID'
      Required = True
    end
    object tblOfficeOF_NAME: TStringField
      FieldName = 'OF_NAME'
      Required = True
      Size = 50
    end
    object tblOfficeOF_IS_REMOTE: TSmallintField
      FieldName = 'OF_IS_REMOTE'
      Required = True
    end
  end
  object dsOffice: TDataSource
    DataSet = tblOffice
    Left = 573
    Top = 379
  end
  object qryIssueRZ: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'SELECT * FROM ISSUE'#13#10'WHERE GZ_ID=4'#13#10'ORDER BY IS_DATE'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    ReadOnly = True
    Left = 317
    Top = 529
    object IntegerField1666: TIntegerField
      FieldName = 'IS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SmallintField3666: TSmallintField
      FieldName = 'GZ_ID'
      Required = True
    end
    object StringField3666: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'IS_NAME'
      Required = True
      Size = 10
    end
    object SQLTimeStampField3666: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'IS_DATE'
      Required = True
    end
    object StringField4666: TStringField
      DisplayLabel = #1055#1086#1083#1085#1099#1081' '#1085#1086#1084#1077#1088
      FieldName = 'IS_NAME_COMPOSED'
      ProviderFlags = []
      Size = 25
    end
  end
  object dsIssueRZ: TDataSource
    DataSet = qryIssueRZ
    Left = 373
    Top = 547
  end
  object qryIssueRK: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'SELECT * FROM ISSUE'#13#10'WHERE GZ_ID=5'#13#10'ORDER BY IS_DATE'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    ReadOnly = True
    Left = 317
    Top = 577
    object IntegerField2666: TIntegerField
      FieldName = 'IS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SmallintField5666: TSmallintField
      FieldName = 'GZ_ID'
      Required = True
    end
    object StringField5666: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'IS_NAME'
      Required = True
      Size = 10
    end
    object SQLTimeStampField4666: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'IS_DATE'
      Required = True
    end
    object StringField9666: TStringField
      DisplayLabel = #1055#1086#1083#1085#1099#1081' '#1085#1086#1084#1077#1088
      FieldName = 'IS_NAME_COMPOSED'
      ProviderFlags = []
      Size = 25
    end
  end
  object dsIssueRK: TDataSource
    DataSet = qryIssueRK
    Left = 373
    Top = 595
  end
  object qryFindSdelkaByOKPO: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'AG_ID'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftUnknown
        Name = 'CU_OKPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'US_ID'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'SELECT'
      '    DISTINCT'
      '      FS.*'
      '                , SD.SD_NUM'
      '                 , SD.SD_PAY_VER'
      '    , SD.GZ_ID'
      '    , SD.SD_TYPE    '
      '    , SD.SD_DATE'
      '    , SD.SD_STATE'
      '    , SD.SD_SUM'
      '    , SD.SD_SUM_PAYED'
      '    , sdt.SD_TYPE_DESC'
      
        '    , CASE WHEN sd.GZ_ID IN (0, 6) THEN LPAD(EXTRACT(DAY FROM sd' +
        '.SD_KA_START_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        LPAD(EXTRACT(MONTH FROM ' +
        'sd.SD_KA_START_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        EXTRACT(YEAR FROM sd.SD_' +
        'KA_START_DATE)||'#39' - '#39'||'
      
        '                                        LPAD(EXTRACT(DAY FROM sd' +
        '.SD_KA_END_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        LPAD(EXTRACT(MONTH FROM ' +
        'sd.SD_KA_END_DATE), 2, '#39'0'#39')||'#39'.'#39'||'
      
        '                                        EXTRACT(YEAR FROM sd.SD_' +
        'KA_END_DATE)'
      '           ELSE spn.PODACHA_NUMS'
      '      END AS PODACHA_NUMS'
      '    , MFR.FM_ID'
      '    , MFR.RB_ID'
      '    , SD.SD_FACT_DATE'
      '/*    , gz.GZ_NAME_SHORT*/'
      '    , UR.AG_ID AS SDELKA_IS_OF_CURRENT_USER'
      '                ,SD.SD_KA_START_DATE'
      '                ,SD.SD_KA_END_DATE'
      '     , c.CU_COMPANY_ID'
      'FROM'
      '    FIND_SDELKA_BY_OKPO(:AG_ID,:CU_OKPO) FS'
      ''
      '    LEFT JOIN SDELKA SD'
      '    ON (FS.AG_ID=SD.AG_ID AND FS.SD_ID=SD.SD_ID)'
      ''
      '    left join SDELKA_TYPE_DESC sdt'
      '    on (sdt.SD_TYPE = sd.SD_TYPE and sdt.GZ_ID = sd.GZ_ID)'
      ''
      '    LEFT JOIN SDELKA_PODACHA_NUMS(SD.AG_ID,SD.SD_ID) SPN'
      '    ON (SD.SD_ID=SPN.SD_ID)'
      ''
      '    LEFT JOIN GET_MAX_FORMAT_AND_RUBRIKA(SD.AG_ID,SD.SD_ID) MFR'
      '    ON (SD.SD_ID=SD.SD_ID)'
      ''
      '    LEFT JOIN USR_RIGHTS UR'
      '    ON (UR.AG_ID=FS.AG_ID AND UR.US_ID=:US_ID)'
      ''
      
        '    LEFT JOIN CUST c ON (c.AG_ID = fs.AG_ID AND c.CU_ID = fs.CU_' +
        'ID)'
      ''
      '/*    left join GAZETA gz'
      '    on (gz.GZ_ID = sd.GZ_ID)*/'
      'ORDER BY'
      '    SD.SD_DATE DESC')
    SQLConnection = connection
    Left = 493
    Top = 201
    object qryFindSdelkaByOKPOCU_COMPANY_ID: TIntegerField
      FieldName = 'CU_COMPANY_ID'
    end
    object IntegerField11: TIntegerField
      Tag = 13
      DisplayWidth = 12
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IntegerField12: TIntegerField
      Tag = 13
      DisplayWidth = 12
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IntegerField13: TIntegerField
      Tag = 13
      DisplayWidth = 12
      FieldName = 'CU_ID'
    end
    object StringField11: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      DisplayWidth = 154
      FieldName = 'CU_NAME'
      Size = 128
    end
    object StringField12: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 15
      FieldName = 'SD_ID_COMPOUND'
      FixedChar = True
      Size = 12
    end
    object IntegerField14: TIntegerField
      Tag = 13
      DisplayWidth = 12
      FieldName = 'PT_ID'
    end
    object IntegerField15: TIntegerField
      DisplayLabel = #1047#1072#1087#1072#1089
      DisplayWidth = 12
      FieldName = 'SD_ZAPAS'
    end
    object StringField13: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      DisplayWidth = 154
      FieldName = 'AG_NAME'
      Size = 128
    end
    object IntegerField16: TIntegerField
      DisplayLabel = #1057#1095#1105#1090
      DisplayWidth = 12
      FieldName = 'SD_FACT_NUM'
    end
    object IntegerField17: TIntegerField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1072
      DisplayWidth = 12
      FieldName = 'SD_ALL_PAYED'
    end
    object FloatField3: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      DisplayWidth = 12
      FieldName = 'SD_SUM_PAYED'
    end
    object FloatField4: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 12
      FieldName = 'SD_SUM'
    end
    object SmallintField5: TSmallintField
      Tag = 13
      DisplayWidth = 12
      FieldName = 'SD_STATE'
    end
    object StringField14: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      DisplayWidth = 306
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object SQLTimeStampField6: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'SD_DATE'
    end
    object SQLTimeStampField7: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1095#1105#1090#1072
      FieldName = 'SD_FACT_DATE'
    end
    object IntegerField18: TIntegerField
      FieldName = 'FM_ID'
    end
    object IntegerField19: TIntegerField
      FieldName = 'RB_ID'
    end
    object IntegerField20: TIntegerField
      FieldName = 'SDELKA_IS_OF_CURRENT_USER'
      ProviderFlags = []
    end
    object SmallintField6: TSmallintField
      FieldName = 'GZ_ID'
    end
    object SmallintField7: TSmallintField
      FieldName = 'SD_TYPE'
    end
    object StringField15: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'SD_TYPE_DESC'
      Size = 10
    end
    object qryFindSdelkaByOKPOSD_PAY_VER: TIntegerField
      FieldName = 'SD_PAY_VER'
    end
    object qryFindSdelkaByOKPOSD_KA_START_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_START_DATE'
    end
    object qryFindSdelkaByOKPOSD_KA_END_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_END_DATE'
    end
    object qryFindSdelkaByOKPOSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
  end
  object dsRequisite: TDataSource
    AutoEdit = False
    DataSet = tblRequisite
    Left = 573
    Top = 440
  end
  object tblDistrict: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'SELECT * FROM DISTRICT'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 485
    Top = 268
    object tblDistrictDT_ID: TIntegerField
      FieldName = 'DT_ID'
      Required = True
    end
    object tblDistrictDT_NAME: TStringField
      FieldName = 'DT_NAME'
      Required = True
      Size = 100
    end
    object tblDistrictDT_IS_ACTIVE: TSmallintField
      FieldName = 'DT_IS_ACTIVE'
      Required = True
    end
  end
  object dsDistrict: TDataSource
    DataSet = tblDistrict
    Left = 541
    Top = 268
  end
  object spKassaNal: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SD_PERCENT'
        ParamType = ptInput
      end>
    SQLConnection = connection
    StoredProcName = 'KASSA_NAL'
    Left = 936
    Top = 376
  end
  object spNalKassa: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptInput
      end>
    SQLConnection = connection
    StoredProcName = 'NAL_KASSA'
    Left = 936
    Top = 432
  end
  object cdsCust: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCust'
    AfterOpen = cdsCust_AfterOpen
    AfterInsert = cdsCust_AfterInsert
    AfterScroll = cdsCustAfterScroll
    OnCalcFields = cdsCust_CalcFields
    OnReconcileError = cdsCust_ReconcileError
    Left = 136
    Top = 160
    object cdsCustAG_ID: TIntegerField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_ID'
    end
    object cdsCustCU_ID: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'CU_ID'
    end
    object cdsCustCU_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'CU_NAME'
      Size = 128
    end
    object cdsCustCU_ID_COMPOUND: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'CU_ID_COMPOUND'
      Size = 23
    end
    object cdsCustCU_BONUS_ENABLED: TIntegerField
      FieldName = 'CU_BONUS_ENABLED'
    end
    object cdsCustCU_OKPO: TStringField
      DisplayLabel = #1054#1050#1055#1054
      FieldName = 'CU_OKPO'
      Size = 10
    end
    object cdsCustCUQ_REG_ID: TIntegerField
      FieldName = 'CUQ_REG_ID'
    end
    object cdsCustCU_INFO: TStringField
      DisplayLabel = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
      FieldName = 'CU_INFO'
      Size = 512
    end
    object cdsCustHAS_CUST_UNIQUE: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'HAS_CUST_UNIQUE'
      Calculated = True
    end
    object cdsCustCU_COMPANY_ID: TIntegerField
      FieldName = 'CU_COMPANY_ID'
    end
  end
  object qryCustByName: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'SHOW_ALL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AG_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FIND_TEXT'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select distinct'
      '    '
      '    CU.AG_ID,'
      '    CU.CU_ID,'
      '    CU.CU_NAME,'
      '    CU.CU_ID_COMPOUND,'
      '    CU.CU_BONUS_ENABLED,'
      '    CU.CU_OKPO,'
      '    CU.CU_INFO,'
      '    CU.CUQ_REG_ID,'
      '    CU.CU_COMPANY_ID'
      'from'
      '    CUST CU'
      'where'
      '('
      '        (1 = :SHOW_ALL) '
      '        or'
      '        (CU.AG_ID = :AG_ID) '
      ')'
      'and CU.CU_NAME containing (:FIND_TEXT)')
    SQLConnection = connection
    Left = 32
    Top = 160
    object qryCustByNameAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object qryCustByNameCU_ID: TIntegerField
      FieldName = 'CU_ID'
    end
    object qryCustByNameCU_NAME: TStringField
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qryCustByNameCU_ID_COMPOUND: TStringField
      FieldName = 'CU_ID_COMPOUND'
      Size = 23
    end
    object qryCustByNameCU_BONUS_ENABLED: TIntegerField
      FieldName = 'CU_BONUS_ENABLED'
    end
    object qryCustByNameCU_OKPO: TStringField
      FieldName = 'CU_OKPO'
      Size = 10
    end
    object qryCustByNameCUQ_REG_ID: TIntegerField
      FieldName = 'CUQ_REG_ID'
    end
    object qryCustByNameCU_INFO: TStringField
      FieldName = 'CU_INFO'
      Size = 512
    end
    object qryCustByNameCU_COMPANY_ID: TIntegerField
      FieldName = 'CU_COMPANY_ID'
    end
  end
  object prvCust: TDataSetProvider
    DataSet = qryCustByName
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh]
    Left = 88
    Top = 160
  end
  object prvCustPhone: TDataSetProvider
    DataSet = qryCustPhone
    Left = 96
    Top = 360
  end
  object spDeleteCust: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'cu_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ag_id'
        ParamType = ptInput
      end>
    SQLConnection = connection
    StoredProcName = 'DELETE_CUST'
    Left = 928
    Top = 536
  end
  object qryCustByOKPO: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'SHOW_ALL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AG_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FIND_TEXT'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select'
      #9'distinct'
      #9'CU.AG_ID,'
      #9'CU.CU_ID,'
      #9'CU.CU_NAME,'
      #9'CU.CU_ID_COMPOUND,'
      #9'CU.CU_BONUS_ENABLED,'
      #9'CU.CU_OKPO,'
      #9'CU.CU_INFO,'
      #9'CU.CUQ_REG_ID,'
      '                CU.CU_COMPANY_ID'
      'from'
      #9'CUST CU'
      'where'
      #9'('
      #9#9'1 = :SHOW_ALL'
      #9#9'or'
      #9#9'CU.AG_ID = :AG_ID'
      #9')'
      #9'and CU.CU_OKPO = :FIND_TEXT')
    SQLConnection = connection
    Left = 32
    Top = 208
    object IntegerField21: TIntegerField
      FieldName = 'AG_ID'
    end
    object IntegerField22: TIntegerField
      FieldName = 'CU_ID'
    end
    object StringField16: TStringField
      FieldName = 'CU_NAME'
      Size = 128
    end
    object StringField17: TStringField
      FieldName = 'CU_ID_COMPOUND'
      Size = 23
    end
    object IntegerField23: TIntegerField
      FieldName = 'CU_BONUS_ENABLED'
    end
    object StringField18: TStringField
      FieldName = 'CU_OKPO'
      Size = 10
    end
    object IntegerField24: TIntegerField
      FieldName = 'CUQ_REG_ID'
    end
    object StringField19: TStringField
      FieldName = 'CU_INFO'
      Size = 512
    end
    object qryCustByOKPOCU_COMPANY_ID: TIntegerField
      FieldName = 'CU_COMPANY_ID'
    end
  end
  object qryCustByPhone: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'SHOW_ALL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AG_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FIND_TEXT'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select'
      #9'distinct'
      #9'CU.AG_ID,'
      #9'CU.CU_ID,'
      #9'CU.CU_NAME,'
      #9'CU.CU_ID_COMPOUND,'
      #9'CU.CU_BONUS_ENABLED,'
      #9'CU.CU_OKPO,'
      #9'CU.CU_INFO,'
      #9'CU.CUQ_REG_ID,'
      '                CU.CU_COMPANY_ID'
      'from'
      #9'CUST_PHONE cp'
      ''
      
        #9'left join CUST cu on (cu.AG_ID = cp.AG_ID and cu.CU_ID = cp.CU_' +
        'ID)'
      'where'
      #9'('
      #9#9'1 = :SHOW_ALL'
      #9#9'or'
      #9#9'cp.AG_ID = :AG_ID'
      #9')'
      #9'and cp.CP_NUMBER = :FIND_TEXT')
    SQLConnection = connection
    Left = 32
    Top = 256
    object IntegerField25: TIntegerField
      FieldName = 'AG_ID'
    end
    object IntegerField26: TIntegerField
      FieldName = 'CU_ID'
    end
    object StringField20: TStringField
      FieldName = 'CU_NAME'
      Size = 128
    end
    object StringField21: TStringField
      FieldName = 'CU_ID_COMPOUND'
      Size = 23
    end
    object IntegerField27: TIntegerField
      FieldName = 'CU_BONUS_ENABLED'
    end
    object StringField22: TStringField
      FieldName = 'CU_OKPO'
      Size = 10
    end
    object IntegerField28: TIntegerField
      FieldName = 'CUQ_REG_ID'
    end
    object StringField23: TStringField
      FieldName = 'CU_INFO'
      Size = 512
    end
    object qryCustByPhoneCU_COMPANY_ID: TIntegerField
      FieldName = 'CU_COMPANY_ID'
    end
  end
  object qCheckFactNum: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ds'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'de'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fact_num'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'okpo'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT * FROM sdelka s JOIN cust c ON (c.cu_id = s.cu_id)'
      'WHERE s.sd_fact_date BETWEEN :ds AND :de AND'
      '      s.sd_fact_num = :fact_num AND'
      '      c.ag_id = s.ag_id AND'
      '      c.cu_okpo <> :okpo')
    SQLConnection = connection
    Left = 712
    Top = 520
  end
  object tblRubrikaByGZ: TSimpleDataSet
    Aggregates = <>
    Connection = connection
    DataSet.CommandText = 'SELECT * FROM RUBRIKA WHERE DELETED = 0 ORDER BY RB_NAME_SHORT'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 285
    Top = 703
    object IntegerField29: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'RB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object StringField24: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'RB_NAME'
      Required = True
      Size = 128
    end
    object StringField25: TStringField
      DisplayLabel = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
      FieldName = 'RB_NAME_SHORT'
      Required = True
      Size = 64
    end
    object FloatField5: TFloatField
      DisplayLabel = #1062#1077#1085#1086#1074#1086#1081' '#1082#1086#1101#1092#1080#1094#1080#1077#1085#1090
      FieldName = 'RB_COST_COEFF'
      DisplayFormat = '0.###'
    end
    object SmallintField8: TSmallintField
      DisplayLabel = #1054#1073#1083#1086#1078#1082#1072
      FieldName = 'RB_IS_OBLOGKA'
      Required = True
    end
    object IntegerField30: TIntegerField
      FieldName = 'GZ_ID'
      Required = True
    end
    object StringField26: TStringField
      DisplayLabel = #1043#1072#1079#1077#1090#1072
      FieldKind = fkLookup
      FieldName = 'GZ_NAME_LK'
      LookupDataSet = tblGazeta
      LookupKeyFields = 'GZ_ID'
      LookupResultField = 'GZ_NAME_SHORT'
      KeyFields = 'GZ_ID'
      Lookup = True
    end
    object SmallintField9: TSmallintField
      DisplayLabel = #1043#1086#1088#1103#1095#1080#1077
      FieldName = 'RB_IS_HOT'
    end
    object SmallintField10: TSmallintField
      DisplayLabel = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100
      FieldName = 'RB_IS_LOCKABLE'
      Required = True
    end
    object SmallintField11: TSmallintField
      DisplayLabel = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100
      FieldName = 'DELETED'
      Required = True
    end
  end
  object qCheckNewIssue: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select count(*)'
      'from issue i'
      
        'where i.IS_ID > (select gci.is_id from GET_CURRENT_ISSUE(:gz_id)' +
        ' gci)'
      '      and i.GZ_ID = :gz_id')
    SQLConnection = connection
    Left = 712
    Top = 584
  end
  object qUpdFactNum: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'num'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'UPDATE PAID_SERVICES ps'
      'SET ps.LOADED = 1'
      'WHERE ps.FACT_NUM = :num')
    SQLConnection = connection
    Left = 712
    Top = 648
  end
  object IBDB: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 120
    Top = 248
  end
  object IBEvents1: TIBEvents
    AutoRegister = True
    Database = IBDB
    Events.Strings = (
      'MODULE_CHANGED'
      'TEXT_CHANGED')
    Registered = False
    OnEventAlert = IBEvents1EventAlert
    Left = 176
    Top = 248
  end
  object spLogState: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'OB_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'US_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NEW_STATE'
        ParamType = ptUnknown
      end>
    SQLConnection = connection
    StoredProcName = 'OB_STATE_LOG'
    Left = 932
    Top = 590
  end
  object spClearWorkingList: TSQLStoredProc
    Params = <
      item
        DataType = ftInteger
        Name = 'GZ_ID'
        ParamType = ptInput
      end>
    StoredProcName = 'CLEAR_OBJAV_WORK_LIST_INTERNET'
    Left = 864
    Top = 592
  end
  object qEmail: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ag_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sd_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT c.*'
      'FROM sdelka s'
      'LEFT JOIN cust c ON (c.AG_ID = s.AG_ID AND c.CU_ID = s.CU_ID)'
      'WHERE s.AG_ID = :ag_id'
      'AND   s.SD_ID = :sd_id')
    SQLConnection = connection
    Left = 608
    Top = 160
    object qEmailCU_EMAIL: TStringField
      FieldName = 'CU_EMAIL'
      Size = 128
    end
  end
end
