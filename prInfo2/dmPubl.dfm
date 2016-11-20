object publData: TpublData
  OldCreateOrder = False
  Left = 732
  Top = 153
  Height = 754
  Width = 810
  object qryObjavVerstkaDifference: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'IS_ID'
        ParamType = ptInput
        Value = '-1'
      end>
    SQL.Strings = (
      'SELECT'
      '    SD.SD_NUM,'
      '    OBDIFF.AG_ID,'
      '    OBDIFF.SD_ID,'
      '    OBDIFF.OB_ID,'
      '    OBDIFF.PD_ID,'
      #9'OBDIFF.RB_ID,'
      '    OBDIFF.DIAGNOZ,'
      ''
      '    OBDIFF.AG_ID||'#39'-'#39'||OBDIFF.SD_ID AS SD_ID_COMPOUND,'
      ''
      #9'OB.OB_COMMENT,'
      #9'OB.FM_ID,'
      '    SD.SD_SHOW_CUST_ID,'
      '    CU.AG_ID||'#39'-'#39'||SD.CU_ID AS CU_ID_COMPOUND,'
      '    CU.CU_INFO,'
      ''
      '    SD.GZ_ID,'
      ''
      #9'RB.RB_NAME_SHORT,'
      '    VD.VD_NAME AS DIAGNOZ_NAME,'
      ''
      #9'OBJ.OB_TEXT AS OBJAV_TEXT,'
      '  FM.FM_NAME'
      'FROM'
      #9'OBJAV_VERSTKA_DIFFERENCE(:IS_ID) OBDIFF'
      ''
      '    LEFT JOIN SDELKA SD'
      '    ON (OBDIFF.AG_ID=SD.AG_ID AND OBDIFF.SD_ID=SD.SD_ID)'
      ''
      '    LEFT JOIN CUST CU'
      '    ON (OBDIFF.AG_ID=CU.AG_ID AND SD.CU_ID=CU.CU_ID)'
      ''
      #9'LEFT JOIN OBJAV OB'
      #9'ON (OBDIFF.AG_ID=OB.AG_ID AND'
      '        OBDIFF.SD_ID=OB.SD_ID AND'
      '        OBDIFF.OB_ID=OB.OB_ID)'
      ''
      #9'LEFT JOIN RUBRIKA RB'
      #9'ON (OBDIFF.RB_ID=RB.RB_ID)'
      ''
      
        #9'LEFT JOIN GET_OBJAV_TEXT(OBDIFF.AG_ID,OBDIFF.SD_ID,OBDIFF.OB_ID' +
        ') OBJ'
      #9'ON (OBDIFF.SD_ID=OBDIFF.SD_ID)'
      ''
      #9'LEFT JOIN VERSTKA_DIAGNOZ VD'
      #9'ON (OBDIFF.DIAGNOZ=VD.VD_ID)'
      ''
      '  LEFT JOIN FORMAT FM'
      '  ON (FM.FM_ID = OB.FM_ID)'
      'ORDER BY'
      #9'OBDIFF.DIAGNOZ DESC,OB.OB_ORDER DESC,OBJ.OB_TEXT')
    SQLConnection = data.connection
    Left = 72
    Top = 78
    object qryObjavVerstkaDifferenceAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryObjavVerstkaDifferenceSD_ID: TIntegerField
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryObjavVerstkaDifferenceOB_ID: TIntegerField
      FieldName = 'OB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryObjavVerstkaDifferencePD_ID: TIntegerField
      FieldName = 'PD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryObjavVerstkaDifferenceRB_ID: TIntegerField
      FieldName = 'RB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryObjavVerstkaDifferenceSD_ID_COMPOUND: TStringField
      FieldName = 'SD_ID_COMPOUND'
      ProviderFlags = []
      Size = 23
    end
    object qryObjavVerstkaDifferenceDIAGNOZ: TSmallintField
      FieldName = 'DIAGNOZ'
    end
    object qryObjavVerstkaDifferenceOB_COMMENT: TStringField
      FieldName = 'OB_COMMENT'
      Size = 127
    end
    object qryObjavVerstkaDifferenceRB_NAME_SHORT: TStringField
      FieldName = 'RB_NAME_SHORT'
      ProviderFlags = []
      Size = 64
    end
    object qryObjavVerstkaDifferenceOBJAV_TEXT: TStringField
      FieldName = 'OBJAV_TEXT'
      ProviderFlags = []
      Size = 2047
    end
    object qryObjavVerstkaDifferenceDIAGNOZ_NAME: TStringField
      FieldName = 'DIAGNOZ_NAME'
      ProviderFlags = []
      Size = 64
    end
    object qryObjavVerstkaDifferenceSD_SHOW_CUST_ID: TSmallintField
      FieldName = 'SD_SHOW_CUST_ID'
    end
    object qryObjavVerstkaDifferenceCU_ID_COMPOUND: TStringField
      FieldName = 'CU_ID_COMPOUND'
      Size = 23
    end
    object qryObjavVerstkaDifferenceCU_INFO: TStringField
      FieldName = 'CU_INFO'
      Size = 255
    end
    object qryObjavVerstkaDifferenceGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object qryObjavVerstkaDifferenceFM_ID: TSmallintField
      FieldName = 'FM_ID'
    end
    object qryObjavVerstkaDifferenceFM_NAME: TStringField
      FieldName = 'FM_NAME'
      Size = 128
    end
    object qryObjavVerstkaDifferenceSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
  end
  object dsObjavVerstkaDifference: TDataSource
    DataSet = cdsObjavVerstkaDifference
    Left = 480
    Top = 78
  end
  object cdsObjavSverstano: TClientDataSet
    Aggregates = <>
    PacketRecords = 20
    Params = <>
    ProviderName = 'prvObjavSverstano'
    Left = 344
    Top = 113
    object cdsObjavSverstanoAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsObjavSverstanoSD_ID: TIntegerField
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsObjavSverstanoOB_ID: TIntegerField
      FieldName = 'OB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsObjavSverstanoPD_ID: TIntegerField
      FieldName = 'PD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsObjavSverstanoRB_ID: TIntegerField
      FieldName = 'RB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsObjavSverstanoSD_ID_COMPOUND: TStringField
      DisplayLabel = #1050#1086#1076' '#1089#1076#1077#1083#1082#1080
      FieldName = 'SD_ID_COMPOUND'
      ProviderFlags = []
      Required = True
      Size = 23
    end
    object cdsObjavSverstanoOB_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'OB_COMMENT'
      Size = 127
    end
    object cdsObjavSverstanoOBJAV_TEXT: TStringField
      DisplayLabel = #1058#1077#1082#1089#1090
      FieldName = 'OBJAV_TEXT'
      ProviderFlags = []
      Size = 2047
    end
    object cdsObjavSverstanoSD_SHOW_CUST_ID: TSmallintField
      FieldName = 'SD_SHOW_CUST_ID'
      ProviderFlags = []
    end
    object cdsObjavSverstanoCU_ID_COMPOUND: TStringField
      FieldName = 'CU_ID_COMPOUND'
      ProviderFlags = []
      Size = 23
    end
    object cdsObjavSverstanoCU_INFO: TStringField
      FieldName = 'CU_INFO'
      ProviderFlags = []
      Size = 255
    end
    object cdsObjavSverstanoGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object cdsObjavSverstanoFM_ID: TSmallintField
      FieldName = 'FM_ID'
    end
    object cdsObjavSverstanoFM_NAME: TStringField
      FieldName = 'FM_NAME'
      Size = 128
    end
    object cdsObjavSverstanoRB_NAME_SHORT: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME_SHORT'
      Size = 50
    end
    object cdsObjavSverstanoSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
  end
  object dsObjavSverstano: TDataSource
    DataSet = cdsObjavSverstano
    Left = 480
    Top = 113
  end
  object qry: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = data.connection
    Left = 616
    Top = 108
  end
  object cdsChangeCount: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'IS_ID'
        ParamType = ptInput
        Value = '-1'
      end>
    ProviderName = 'prvChangeCount'
    ReadOnly = True
    Left = 344
    Top = 148
    object cdsChangeCountCHANGE_COUNT: TIntegerField
      FieldName = 'CHANGE_COUNT'
    end
    object cdsChangeCountRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object cdsChangeCountRB_NAME: TStringField
      FieldName = 'RB_NAME'
      OnGetText = qryChangeCountLIST_TEXTGetText
      Size = 128
    end
  end
  object dsChangeCount: TDataSource
    DataSet = cdsChangeCount
    Left = 480
    Top = 148
  end
  object tblGazetaCurrent: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 'GAZETA'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    ReadOnly = True
    Left = 544
    Top = 551
    object tblGazetaCurrentGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
      Required = True
    end
    object tblGazetaCurrentGZ_NAME: TStringField
      FieldName = 'GZ_NAME'
      Size = 64
    end
    object tblGazetaCurrentGZ_NAME_SHORT: TStringField
      FieldName = 'GZ_NAME_SHORT'
      Size = 64
    end
  end
  object dsGazetaCurrent: TDataSource
    DataSet = tblGazetaCurrent
    Left = 480
    Top = 439
  end
  object spObjavSverstana: TSQLStoredProc
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
        Name = 'OB_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PD_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'RB_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DIAGNOZ'
        ParamType = ptInput
      end>
    SQLConnection = data.connection
    StoredProcName = 'OBJAV_SVERSTANA'
    Left = 616
    Top = 12
  end
  object spNextExportID: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'EXPORT_ID'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = data.connection
    StoredProcName = 'GET_NEXT_EXPORT_ID'
    Left = 616
    Top = 60
  end
  object cdsObjavOrder: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'AG_ID'
        DataType = ftInteger
      end
      item
        Name = 'SD_ID'
        DataType = ftInteger
      end
      item
        Name = 'OB_ID'
        DataType = ftInteger
      end
      item
        Name = 'SD_ID_COMPOUND'
        DataType = ftString
        Size = 23
      end
      item
        Name = 'OB_ORDER'
        DataType = ftFloat
      end
      item
        Name = 'OS_NAME'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'OBJAV_TEXT'
        DataType = ftString
        Size = 2047
      end>
    IndexDefs = <
      item
        Name = 'I_CDS_GAZETA'
        DescFields = 'OB_ORDER'
        Fields = 'OB_ORDER;OBJAV_TEXT'
        Options = [ixDescending]
      end>
    IndexName = 'I_CDS_GAZETA'
    Params = <
      item
        DataType = ftString
        Name = 'IS_ID'
        ParamType = ptInput
        Value = '50'
      end
      item
        DataType = ftString
        Name = 'RB_ID'
        ParamType = ptInput
        Value = '1'
      end>
    ProviderName = 'prvObjavOrder'
    StoreDefs = True
    Left = 344
    Top = 183
    object cdsObjavOrderAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsObjavOrderSD_ID: TIntegerField
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsObjavOrderOB_ID: TIntegerField
      FieldName = 'OB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsObjavOrderSD_ID_COMPOUND: TStringField
      DisplayLabel = #1050#1086#1076' '#1089#1076#1077#1083#1082#1080
      FieldName = 'SD_ID_COMPOUND'
      ProviderFlags = []
      Size = 23
    end
    object cdsObjavOrderOB_ORDER: TFloatField
      DisplayLabel = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081' '#1085#1086#1084#1077#1088
      FieldName = 'OB_ORDER'
      DisplayFormat = '0.00'
    end
    object cdsObjavOrderOS_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'OS_NAME'
      ProviderFlags = []
      Size = 64
    end
    object cdsObjavOrderOBJAV_TEXT: TStringField
      DisplayLabel = #1058#1077#1082#1089#1090
      FieldName = 'OBJAV_TEXT'
      ProviderFlags = []
      Size = 2047
    end
  end
  object dsObjavOrder: TDataSource
    DataSet = cdsObjavOrder
    Left = 480
    Top = 183
  end
  object tblAgent: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 'AGENT'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    ReadOnly = True
    Left = 344
    Top = 425
    object tblAgentAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Required = True
    end
    object tblAgentAG_NAME: TStringField
      FieldName = 'AG_NAME'
      Required = True
      Size = 128
    end
    object tblAgentAG_IS_REMOTE: TSmallintField
      FieldName = 'AG_IS_REMOTE'
    end
  end
  object dsAgent: TDataSource
    DataSet = tblAgent
    Left = 480
    Top = 401
  end
  object qryObjavSverstano: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '  s.sd_num,'
      '  os.*,'
      '  fm.FM_NAME'
      'from'
      '  OBJAV_VERSTKA_SVERSTANO os'
      '  LEFT JOIN FORMAT fm on (fm.FM_ID = os.FM_ID)'
      '  JOIN sdelka s ON(s.ag_id = os.ag_id AND s.sd_id = os.sd_id)'
      'ORDER BY'
      '    os.OB_ORDER DESC, os.OBJAV_TEXT')
    SQLConnection = data.connection
    Left = 72
    Top = 105
    object qryObjavSverstanoAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryObjavSverstanoSD_ID: TIntegerField
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryObjavSverstanoOB_ID: TIntegerField
      FieldName = 'OB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryObjavSverstanoPD_ID: TIntegerField
      FieldName = 'PD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryObjavSverstanoRB_ID: TIntegerField
      FieldName = 'RB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryObjavSverstanoSD_ID_COMPOUND: TStringField
      FieldName = 'SD_ID_COMPOUND'
      ProviderFlags = []
      Required = True
      Size = 23
    end
    object qryObjavSverstanoOB_COMMENT: TStringField
      FieldName = 'OB_COMMENT'
      Size = 127
    end
    object qryObjavSverstanoOBJAV_TEXT: TStringField
      FieldName = 'OBJAV_TEXT'
      ProviderFlags = []
      Size = 2047
    end
    object qryObjavSverstanoSD_SHOW_CUST_ID: TSmallintField
      FieldName = 'SD_SHOW_CUST_ID'
      ProviderFlags = []
    end
    object qryObjavSverstanoCU_ID_COMPOUND: TStringField
      FieldName = 'CU_ID_COMPOUND'
      ProviderFlags = []
      Size = 23
    end
    object qryObjavSverstanoCU_INFO: TStringField
      FieldName = 'CU_INFO'
      ProviderFlags = []
      Size = 255
    end
    object qryObjavSverstanoGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object qryObjavSverstanoFM_ID: TSmallintField
      FieldName = 'FM_ID'
    end
    object qryObjavSverstanoFM_NAME: TStringField
      FieldName = 'FM_NAME'
      Size = 128
    end
    object qryObjavSverstanoRB_NAME_SHORT: TStringField
      FieldName = 'RB_NAME_SHORT'
      Size = 50
    end
    object qryObjavSverstanoSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
  end
  object prvObjavSverstano: TDataSetProvider
    DataSet = qryObjavSverstano
    OnGetTableName = prvObjavSverstanoGetTableName
    Left = 208
    Top = 113
  end
  object prvObjavVerstkaDifference: TDataSetProvider
    DataSet = qryObjavVerstkaDifference
    OnGetTableName = prvObjavVerstkaDifferenceGetTableName
    Left = 208
    Top = 78
  end
  object cdsObjavVerstkaDifference: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'IS_ID'
        ParamType = ptInput
        Value = '-1'
      end>
    ProviderName = 'prvObjavVerstkaDifference'
    Left = 344
    Top = 78
    object cdsObjavVerstkaDifferenceAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsObjavVerstkaDifferenceSD_ID: TIntegerField
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsObjavVerstkaDifferenceOB_ID: TIntegerField
      FieldName = 'OB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsObjavVerstkaDifferencePD_ID: TIntegerField
      FieldName = 'PD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsObjavVerstkaDifferenceRB_ID: TIntegerField
      FieldName = 'RB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsObjavVerstkaDifferenceDIAGNOZ: TSmallintField
      FieldName = 'DIAGNOZ'
      ProviderFlags = []
    end
    object cdsObjavVerstkaDifferenceSD_ID_COMPOUND: TStringField
      DisplayLabel = #1050#1086#1076' '#1089#1076#1077#1083#1082#1080
      FieldName = 'SD_ID_COMPOUND'
      ProviderFlags = []
      Size = 23
    end
    object cdsObjavVerstkaDifferenceDIAGNOZ_NAME: TStringField
      DisplayLabel = #1048#1079#1084#1077#1085#1077#1085#1080#1077
      FieldName = 'DIAGNOZ_NAME'
      ProviderFlags = []
      Size = 64
    end
    object cdsObjavVerstkaDifferenceOB_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'OB_COMMENT'
      Size = 127
    end
    object cdsObjavVerstkaDifferenceRB_NAME_SHORT: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME_SHORT'
      ProviderFlags = []
      Size = 64
    end
    object cdsObjavVerstkaDifferenceOBJAV_TEXT: TStringField
      DisplayLabel = #1058#1077#1082#1089#1090
      FieldName = 'OBJAV_TEXT'
      ProviderFlags = []
      Size = 2047
    end
    object cdsObjavVerstkaDifferenceSD_SHOW_CUST_ID: TSmallintField
      FieldName = 'SD_SHOW_CUST_ID'
    end
    object cdsObjavVerstkaDifferenceCU_ID_COMPOUND: TStringField
      FieldName = 'CU_ID_COMPOUND'
      Size = 23
    end
    object cdsObjavVerstkaDifferenceCU_INFO: TStringField
      FieldName = 'CU_INFO'
      Size = 255
    end
    object cdsObjavVerstkaDifferenceGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object cdsObjavVerstkaDifferenceFM_ID: TSmallintField
      FieldName = 'FM_ID'
    end
    object cdsObjavVerstkaDifferenceFM_NAME: TStringField
      FieldName = 'FM_NAME'
      Size = 128
    end
    object cdsObjavVerstkaDifferenceSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
  end
  object qryChangeCount: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'IS_ID'
        ParamType = ptInput
        Value = '-1'
      end>
    SQL.Strings = (
      'SELECT'
      '    COUNT(*) AS CHANGE_COUNT,'
      #9'OBDIFF.RB_ID,'
      #9'RB.RB_NAME'
      'FROM'
      #9'OBJAV_VERSTKA_DIFFERENCE(:IS_ID) OBDIFF'
      #9'LEFT JOIN RUBRIKA RB'
      #9'ON (RB.RB_ID=OBDIFF.RB_ID)'
      'GROUP BY OBDIFF.RB_ID,RB.RB_NAME')
    SQLConnection = data.connection
    Left = 72
    Top = 148
    object qryChangeCountCHANGE_COUNT: TIntegerField
      FieldName = 'CHANGE_COUNT'
      Required = True
    end
    object qryChangeCountRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object qryChangeCountRB_NAME: TStringField
      FieldName = 'RB_NAME'
      Size = 128
    end
  end
  object prvChangeCount: TDataSetProvider
    DataSet = qryChangeCount
    Left = 208
    Top = 148
  end
  object qryObjavOrder: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'IS_ID'
        ParamType = ptInput
        Value = '50'
      end
      item
        DataType = ftString
        Name = 'RB_ID'
        ParamType = ptInput
        Value = '1'
      end>
    SQL.Strings = (
      'SELECT'
      #9'OBL.AG_ID,'
      #9'OBL.SD_ID,'
      #9'OBL.OB_ID,'
      ''
      #9'OBL.AG_ID||'#39'-'#39'||OBL.SD_ID AS SD_ID_COMPOUND,'
      ''
      #9'OB.OB_ORDER,'
      ''
      #9'OS.OS_NAME,'
      ''
      #9'OBJ.OB_TEXT AS OBJAV_TEXT'
      'FROM'
      #9'OBJAV_LIST_V_NOMER(:IS_ID) OBL'
      ''
      #9'LEFT JOIN OBJAV OB'
      #9'ON (OBL.AG_ID=OB.AG_ID AND'
      #9'  OBL.SD_ID=OB.SD_ID AND'
      #9'  OBL.OB_ID=OB.OB_ID)'
      ''
      #9'LEFT JOIN OBJAV_STATE OS'
      #9'ON(OBL.OB_STATE=OS.OS_ID)'
      ''
      #9'LEFT JOIN GET_OBJAV_TEXT(OBL.AG_ID,OBL.SD_ID,OBL.OB_ID) OBJ'
      #9'ON (OBL.SD_ID=OBL.SD_ID)'
      'WHERE'
      #9'OB.RB_ID=:RB_ID'
      #9'AND ('
      #9#9'OB.FM_ID=1 OR'
      #9#9'OB.FM_ID=17'
      #9')')
    SQLConnection = data.connection
    Left = 72
    Top = 183
    object qryObjavOrderAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryObjavOrderSD_ID: TIntegerField
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryObjavOrderOB_ID: TIntegerField
      FieldName = 'OB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryObjavOrderSD_ID_COMPOUND: TStringField
      FieldName = 'SD_ID_COMPOUND'
      ProviderFlags = []
      Size = 23
    end
    object qryObjavOrderOB_ORDER: TFloatField
      FieldName = 'OB_ORDER'
    end
    object qryObjavOrderOS_NAME: TStringField
      FieldName = 'OS_NAME'
      ProviderFlags = []
      Size = 64
    end
    object qryObjavOrderOBJAV_TEXT: TStringField
      FieldName = 'OBJAV_TEXT'
      ProviderFlags = []
      Size = 2047
    end
  end
  object prvObjavOrder: TDataSetProvider
    DataSet = qryObjavOrder
    OnGetTableName = prvObjavOrderGetTableName
    Left = 208
    Top = 183
  end
  object qryCustInfoList: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 'SELECT * FROM CUST_INFO_LIST(:GZ_ID)'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'GZ_ID'
        ParamType = ptInput
        Value = '1'
      end>
    Params = <>
    ReadOnly = True
    Left = 72
    Top = 401
    object qryCustInfoListCU_ID_COMPOUND: TStringField
      DisplayLabel = #1050#1086#1076' '#1082#1083#1080#1077#1085#1090#1072
      DisplayWidth = 22
      FieldName = 'CU_ID_COMPOUND'
      FixedChar = True
      Size = 23
    end
    object qryCustInfoListCU_INFO: TStringField
      DisplayLabel = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
      DisplayWidth = 121
      FieldName = 'CU_INFO'
      Size = 255
    end
  end
  object dsCustInfoList: TDataSource
    DataSet = qryCustInfoList
    Left = 208
    Top = 401
  end
  object qryObjavForKA: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '    SD.sd_num,'
      '    OBL.AG_ID,'
      '    OBL.SD_ID,'
      '    OBL.OB_ID,'
      #9'OBL.RB_ID,'
      ''
      '    OBL.AG_ID||'#39'-'#39'||OBL.SD_ID AS SD_ID_COMPOUND,'
      ''
      '    OB.OB_COMMENT,'
      ''
      '    CU.AG_ID||'#39'-'#39'||SD.CU_ID AS CU_ID_COMPOUND,'
      ''
      '    CU.CU_NAME,'
      '    CU.CU_KA_INFO_SHORT,'
      ''
      #9'RB.RB_NAME_SHORT,'
      ''
      #9'OBJ.OB_TEXT AS OBJAV_TEXT'
      'FROM'
      '    OBJAV_LIST_KA OBL'
      ''
      '    LEFT JOIN OBJAV OB'
      '    ON (OBL.AG_ID=OB.AG_ID AND'
      '        OBL.SD_ID=OB.SD_ID AND'
      '        OBL.OB_ID=OB.OB_ID)'
      ''
      '    LEFT JOIN SDELKA SD'
      '    ON (OBL.AG_ID=SD.AG_ID AND OBL.SD_ID=SD.SD_ID)'
      ''
      #9'LEFT JOIN RUBRIKA RB'
      #9'ON (OBL.RB_ID=RB.RB_ID)'
      ''
      '    LEFT JOIN CUST CU'
      '    ON (OBL.AG_ID=CU.AG_ID AND SD.CU_ID=CU.CU_ID)'
      ''
      #9'LEFT JOIN GET_OBJAV_TEXT(OBL.AG_ID,OBL.SD_ID,OBL.OB_ID) OBJ'
      #9'ON (OBL.SD_ID=OBL.SD_ID)'
      'ORDER BY'
      #9'OBL.RB_ID,OB.OB_ORDER DESC,OBJ.OB_TEXT')
    SQLConnection = data.connection
    Left = 72
    Top = 364
    object qryObjavForKAAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object qryObjavForKASD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object qryObjavForKAOB_ID: TIntegerField
      FieldName = 'OB_ID'
    end
    object qryObjavForKARB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object qryObjavForKASD_ID_COMPOUND: TStringField
      DisplayLabel = #1050#1086#1076' '#1089#1076#1077#1083#1082#1080
      FieldName = 'SD_ID_COMPOUND'
      Size = 23
    end
    object qryObjavForKAOB_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'OB_COMMENT'
      Size = 127
    end
    object qryObjavForKACU_ID_COMPOUND: TStringField
      FieldName = 'CU_ID_COMPOUND'
      Size = 23
    end
    object qryObjavForKACU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qryObjavForKARB_NAME_SHORT: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object qryObjavForKAOBJAV_TEXT: TStringField
      DisplayLabel = #1058#1077#1082#1089#1090
      FieldName = 'OBJAV_TEXT'
      Size = 2047
    end
    object qryObjavForKACU_KA_INFO_SHORT: TStringField
      FieldName = 'CU_KA_INFO_SHORT'
      Size = 255
    end
    object qryObjavForKASD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
  end
  object prvObjavForKA: TDataSetProvider
    DataSet = qryObjavForKA
    Left = 208
    Top = 364
  end
  object cdsObjavForKA: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvObjavForKA'
    ReadOnly = True
    Left = 344
    Top = 364
    object cdsObjavForKAAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object cdsObjavForKASD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object cdsObjavForKAOB_ID: TIntegerField
      FieldName = 'OB_ID'
    end
    object cdsObjavForKARB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object cdsObjavForKASD_ID_COMPOUND: TStringField
      DisplayLabel = #1050#1086#1076' '#1089#1076#1077#1083#1082#1080
      FieldName = 'SD_ID_COMPOUND'
      Size = 23
    end
    object cdsObjavForKAOB_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'OB_COMMENT'
      Size = 127
    end
    object cdsObjavForKACU_ID_COMPOUND: TStringField
      FieldName = 'CU_ID_COMPOUND'
      Size = 23
    end
    object cdsObjavForKACU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object cdsObjavForKARB_NAME_SHORT: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object cdsObjavForKAOBJAV_TEXT: TStringField
      DisplayLabel = #1058#1077#1082#1089#1090
      FieldName = 'OBJAV_TEXT'
      Size = 2047
    end
    object cdsObjavForKACU_KA_INFO_SHORT: TStringField
      DisplayLabel = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1050#1040
      FieldName = 'CU_KA_INFO_SHORT'
      Size = 255
    end
    object cdsObjavForKASD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
  end
  object dsObjavForKA: TDataSource
    DataSet = cdsObjavForKA
    Left = 480
    Top = 364
  end
  object qryCustKAInfo: TSimpleDataSet
    Aggregates = <>
    DataSet.CommandText = 'SELECT * FROM CUST_KA_INFO_LIST ORDER BY CU_NAME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    ReadOnly = True
    Left = 72
    Top = 439
    object qryCustKAInfoCU_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'CU_NAME'
      Size = 255
    end
    object qryCustKAInfoCU_KA_INFO_FULL: TStringField
      DisplayLabel = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
      FieldName = 'CU_KA_INFO_FULL'
      Size = 1023
    end
  end
  object dsCustKAInfo: TDataSource
    DataSet = qryCustKAInfo
    Left = 208
    Top = 439
  end
  object qryModuliVerstka: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'GZ_ID'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'SELECT'
      '    SD.sd_num,'
      '    MN.AG_ID,'
      '    MN.SD_ID,'
      '    MN.OB_ID,'
      '    MN.RB_ID,'
      '    MN.FM_ID,'
      #9'MN.CONTENT_ID,'
      #9'MN.OBJAV_HAS_ATTENTION,'
      ''
      #9'AG.AG_NAME,'
      #9'MN.AG_ID || '#39'-'#39' || MN.SD_ID AS SD_ID_COMPOUND,'
      #9'RB.RB_NAME_SHORT,'
      #9'FM.FM_NAME,'
      #9'SD.GZ_ID,'
      #9'SPN.PODACHA_NUMS,'
      '    OC.CONTENT_PICTURE,'
      '    OC.EXTENSION'
      'FROM'
      #9'MODULI_V_NOMER(:GZ_ID) MN'
      ''
      #9'LEFT JOIN AGENT AG'
      #9'ON (MN.AG_ID=AG.AG_ID)'
      ''
      #9'LEFT JOIN SDELKA SD'
      #9'ON (SD.AG_ID = MN.AG_ID AND SD.SD_ID = MN.SD_ID)'
      ''
      #9'LEFT JOIN RUBRIKA RB'
      #9'ON (MN.RB_ID=RB.RB_ID)'
      ''
      #9'LEFT JOIN FORMAT FM'
      #9'ON (MN.FM_ID=FM.FM_ID)'
      ''
      #9'LEFT JOIN SDELKA_PODACHA_NUMS(MN.AG_ID,MN.SD_ID) SPN'
      #9'ON (MN.SD_ID=SPN.SD_ID)'
      ''
      '    LEFT JOIN OBJAV_CONTENT OC'
      #9'ON (MN.CONTENT_ID=OC.CONTENT_ID)'
      'WHERE'
      #9'SD.SD_STATE <> 100'
      #9'AND SD.SD_STATE >= 4'
      #9'AND NOT (SD.AS_ID IN (1, 2))')
    SQLConnection = data.connection
    Left = 72
    Top = 291
    object qryModuliVerstkaAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object qryModuliVerstkaSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object qryModuliVerstkaOB_ID: TIntegerField
      FieldName = 'OB_ID'
    end
    object qryModuliVerstkaRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object qryModuliVerstkaFM_ID: TIntegerField
      FieldName = 'FM_ID'
    end
    object qryModuliVerstkaCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
    end
    object qryModuliVerstkaAG_NAME: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_NAME'
      Size = 128
    end
    object qryModuliVerstkaSD_ID_COMPOUND: TStringField
      DisplayLabel = #1057#1076#1077#1083#1082#1072
      FieldName = 'SD_ID_COMPOUND'
      Size = 23
    end
    object qryModuliVerstkaRB_NAME_SHORT: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object qryModuliVerstkaFM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldName = 'FM_NAME'
      Size = 128
    end
    object qryModuliVerstkaPODACHA_NUMS: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object qryModuliVerstkaCONTENT_PICTURE: TBlobField
      FieldName = 'CONTENT_PICTURE'
      Size = 1
    end
    object qryModuliVerstkaOBJAV_HAS_ATTENTION: TSmallintField
      FieldName = 'OBJAV_HAS_ATTENTION'
    end
    object qryModuliVerstkaGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object qryModuliVerstkaSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
    object qryModuliVerstkaEXTENSION: TStringField
      FieldName = 'EXTENSION'
      Size = 5
    end
  end
  object prvModuliVerstka: TDataSetProvider
    DataSet = qryModuliVerstka
    Left = 208
    Top = 291
  end
  object cdsModuliVerstka: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'GZ_ID'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'prvModuliVerstka'
    ReadOnly = True
    Left = 344
    Top = 291
    object cdsModuliVerstkaAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object cdsModuliVerstkaSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object cdsModuliVerstkaOB_ID: TIntegerField
      FieldName = 'OB_ID'
    end
    object cdsModuliVerstkaRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object cdsModuliVerstkaFM_ID: TIntegerField
      FieldName = 'FM_ID'
    end
    object cdsModuliVerstkaCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
    end
    object cdsModuliVerstkaAG_NAME: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_NAME'
      Size = 128
    end
    object cdsModuliVerstkaSD_ID_COMPOUND: TStringField
      DisplayLabel = #1057#1076#1077#1083#1082#1072
      FieldName = 'SD_ID_COMPOUND'
      Size = 23
    end
    object cdsModuliVerstkaRB_NAME_SHORT: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object cdsModuliVerstkaFM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldName = 'FM_NAME'
      Size = 128
    end
    object cdsModuliVerstkaPODACHA_NUMS: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object cdsModuliVerstkaCONTENT_PICTURE: TBlobField
      FieldName = 'CONTENT_PICTURE'
      Size = 1
    end
    object cdsModuliVerstkaOBJAV_HAS_ATTENTION: TSmallintField
      DisplayLabel = ' !!! '
      FieldName = 'OBJAV_HAS_ATTENTION'
    end
    object cdsModuliVerstkaGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object cdsModuliVerstkaSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
    object cdsModuliVerstkaEXTENSION: TStringField
      FieldName = 'EXTENSION'
      Size = 5
    end
  end
  object dsModuliVerstka: TDataSource
    DataSet = cdsModuliVerstka
    Left = 480
    Top = 291
  end
  object qryNavchCourse: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IS_ID'
        ParamType = ptInput
        Value = -1
      end>
    SQL.Strings = (
      'select'
      #9'  ol.AG_ID'
      #9', ob.SD_ID'
      #9', ob.OB_ID'
      #9', sd.GZ_ID'
      #9', ag.AG_NAME'
      '/*    , cu.CU_NAME*/'
      '    , rb.RB_NAME'
      '    , cu.CU_INFO'
      '    , ob.OB_TEXT'
      '    , sd.sd_num'
      'from'
      #9'OBJAV_LIST_V_NOMER_ALL(:IS_ID) ol'
      '    '
      
        '    left join OBJAV ob on (ob.AG_ID = ol.AG_ID and ob.OB_ID = ol' +
        '.OB_ID)'
      '    '
      '    left join RUBRIKA rb on (rb.RB_ID = ol.RB_ID)'
      '    '
      
        '    left join SDELKA sd on (sd.AG_ID = ob.AG_ID and sd.SD_ID = o' +
        'b.SD_ID)'
      '    '
      
        '    left join CUST cu on (cu.AG_ID = sd.AG_ID and cu.CU_ID = sd.' +
        'CU_ID)'
      '    '
      '    left join AGENT ag on (ag.AG_ID = ob.AG_ID)'
      'where'
      #9'ob.FM_ID = 16'
      'order by'
      #9'rb.RB_NAME, ob.OB_TEXT')
    SQLConnection = data.connection
    Left = 72
    Top = 219
    object qryNavchCourseAG_NAME: TStringField
      FieldName = 'AG_NAME'
      Size = 128
    end
    object qryNavchCourseRB_NAME: TStringField
      FieldName = 'RB_NAME'
      Size = 128
    end
    object qryNavchCourseCU_INFO: TStringField
      FieldName = 'CU_INFO'
      Size = 255
    end
    object qryNavchCourseOB_TEXT: TStringField
      FieldName = 'OB_TEXT'
      Size = 2047
    end
    object qryNavchCourseAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object qryNavchCourseSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object qryNavchCourseOB_ID: TIntegerField
      FieldName = 'OB_ID'
    end
    object qryNavchCourseGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object qryNavchCourseSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
  end
  object dsNavchCourse: TDataSource
    DataSet = cdsNavchCourse
    Left = 480
    Top = 219
  end
  object cdsNavchCourse: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IS_ID'
        ParamType = ptInput
        Value = -1
      end>
    ProviderName = 'prvNavchCourse'
    ReadOnly = True
    Left = 345
    Top = 219
    object cdsNavchCourseAG_NAME: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_NAME'
      Size = 128
    end
    object cdsNavchCourseRB_NAME: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME'
      Size = 128
    end
    object cdsNavchCourseCU_INFO: TStringField
      DisplayLabel = #1054' '#1082#1083#1080#1077#1085#1090#1077
      FieldName = 'CU_INFO'
      Size = 255
    end
    object cdsNavchCourseOB_TEXT: TStringField
      DisplayLabel = #1058#1077#1082#1089#1090
      FieldName = 'OB_TEXT'
      Size = 2047
    end
    object cdsNavchCourseAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object cdsNavchCourseSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object cdsNavchCourseOB_ID: TIntegerField
      FieldName = 'OB_ID'
    end
    object cdsNavchCourseGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object cdsNavchCourseSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
  end
  object prvNavchCourse: TDataSetProvider
    DataSet = qryNavchCourse
    Left = 208
    Top = 219
  end
  object cdsInetImport: THttpXMLDataSet
    Aggregates = <>
    Params = <>
    Opened = False
    transformationFile = 'SiteVac.xtr'
    ProxyPort = 0
    Left = 624
    Top = 272
  end
  object dsRubrikaVerstka: TDataSource
    DataSet = tblRubrikaVerstka
    Left = 648
    Top = 216
  end
  object tblRubrikaVerstka: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 613
    Top = 216
    object tblRubrikaVerstkaRB_ID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'RB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tblRubrikaVerstkaRB_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'RB_NAME'
      Required = True
      Size = 128
    end
    object tblRubrikaVerstkaRB_NAME_SHORT: TStringField
      DisplayLabel = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
      FieldName = 'RB_NAME_SHORT'
      Required = True
      Size = 64
    end
    object tblRubrikaVerstkaRB_COST_COEFF: TFloatField
      DisplayLabel = #1062#1077#1085#1086#1074#1086#1081' '#1082#1086#1101#1092#1080#1094#1080#1077#1085#1090
      FieldName = 'RB_COST_COEFF'
      DisplayFormat = '0.###'
    end
    object tblRubrikaVerstkaRB_IS_OBLOGKA: TSmallintField
      DisplayLabel = #1054#1073#1083#1086#1078#1082#1072
      FieldName = 'RB_IS_OBLOGKA'
      Required = True
    end
    object tblRubrikaVerstkaGZ_ID: TIntegerField
      FieldName = 'GZ_ID'
      Required = True
    end
    object tblRubrikaVerstkaRB_IS_LOCKABLE: TSmallintField
      FieldName = 'RB_IS_LOCKABLE'
      Required = True
    end
  end
  object dsRubrikaKorrektura: TDataSource
    DataSet = tblRubrikaKorrektura
    Left = 648
    Top = 160
  end
  object tblRubrikaKorrektura: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 613
    Top = 160
    object IntegerField1: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'RB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object StringField1: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'RB_NAME'
      Required = True
      Size = 128
    end
    object StringField2: TStringField
      DisplayLabel = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
      FieldName = 'RB_NAME_SHORT'
      Required = True
      Size = 64
    end
    object FloatField1: TFloatField
      DisplayLabel = #1062#1077#1085#1086#1074#1086#1081' '#1082#1086#1101#1092#1080#1094#1080#1077#1085#1090
      FieldName = 'RB_COST_COEFF'
      DisplayFormat = '0.###'
    end
    object SmallintField1: TSmallintField
      DisplayLabel = #1054#1073#1083#1086#1078#1082#1072
      FieldName = 'RB_IS_OBLOGKA'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'GZ_ID'
      Required = True
    end
    object SmallintField2: TSmallintField
      FieldName = 'RB_IS_LOCKABLE'
      Required = True
    end
  end
  object dsCustForObjavExport: TDataSource
    DataSet = cdsCustForObjavExport
    Left = 712
    Top = 384
  end
  object qryCustForObjavExport: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'select ce.*, a.AG_NAME, c.CU_NAME, ce.AG_ID || '#39'-'#39' || ce.CU_ID a' +
        's CU_ID_CMP'
      'from CUST_FOR_OBJAV_EXPORT ce'
      'left join AGENT a on (a.AG_ID = ce.AG_ID)'
      'left join CUST c on (c.AG_ID = ce.AG_ID and c.CU_ID = ce.CU_ID)')
    SQLConnection = data.connection
    Left = 576
    Top = 344
    object qryCustForObjavExportAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Required = True
    end
    object qryCustForObjavExportCU_ID: TIntegerField
      FieldName = 'CU_ID'
      Required = True
    end
    object qryCustForObjavExportAG_NAME: TStringField
      FieldName = 'AG_NAME'
      ProviderFlags = []
      Size = 128
    end
    object qryCustForObjavExportCU_NAME: TStringField
      FieldName = 'CU_NAME'
      ProviderFlags = []
      Size = 128
    end
    object qryCustForObjavExportCU_ID_CMP: TStringField
      FieldName = 'CU_ID_CMP'
      ProviderFlags = []
      Size = 23
    end
  end
  object cdsCustForObjavExport: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCustForObjavExport'
    Left = 664
    Top = 376
    object cdsCustForObjavExportCU_ID_CMP: TStringField
      DisplayLabel = #8470' '#1082#1083#1080#1077#1085#1090#1072
      DisplayWidth = 12
      FieldName = 'CU_ID_CMP'
      ProviderFlags = []
      Size = 23
    end
    object cdsCustForObjavExportAG_NAME: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      DisplayWidth = 24
      FieldName = 'AG_NAME'
      ProviderFlags = []
      Size = 128
    end
    object cdsCustForObjavExportCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      DisplayWidth = 82
      FieldName = 'CU_NAME'
      ProviderFlags = []
      Size = 128
    end
    object cdsCustForObjavExportAG_ID: TIntegerField
      DisplayWidth = 10
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object cdsCustForObjavExportCU_ID: TIntegerField
      DisplayWidth = 10
      FieldName = 'CU_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
  end
  object prvCustForObjavExport: TDataSetProvider
    DataSet = qryCustForObjavExport
    Left = 616
    Top = 360
  end
  object cdsObjavExportCust: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IS_ID'
        ParamType = ptUnknown
        Value = -1
      end>
    ProviderName = 'prvObjavExportCust'
    ReadOnly = True
    Left = 344
    Top = 480
    object cdsObjavExportCustRB_NAME_SHORT: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object cdsObjavExportCustOB_TEXT: TStringField
      DisplayLabel = #1054#1073#1098#1103#1074#1083#1077#1085#1080#1077
      FieldName = 'OB_TEXT'
      Size = 2047
    end
    object cdsObjavExportCustAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Visible = False
    end
    object cdsObjavExportCustSD_ID: TIntegerField
      FieldName = 'SD_ID'
      Visible = False
    end
    object cdsObjavExportCustOB_ID: TIntegerField
      FieldName = 'OB_ID'
      Visible = False
    end
    object cdsObjavExportCustOB_STATE: TSmallintField
      FieldName = 'OB_STATE'
      Visible = False
    end
    object cdsObjavExportCustOB_COMMENT: TStringField
      FieldName = 'OB_COMMENT'
      Visible = False
      Size = 127
    end
    object cdsObjavExportCustCU_ID: TIntegerField
      FieldName = 'CU_ID'
      Visible = False
    end
  end
  object dsObjavExportCust: TDataSource
    DataSet = cdsObjavExportCust
    Left = 480
    Top = 480
  end
  object qryObjavExportCust: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IS_ID'
        ParamType = ptUnknown
        Value = -1
      end>
    SQL.Strings = (
      'select'
      #9'  OBN.AG_ID'
      #9', OBN.SD_ID'
      #9', OBN.OB_ID'
      #9', OB.OB_STATE'
      #9', OB.OB_COMMENT'
      #9', OB.OB_TEXT'
      #9', SD.CU_ID'
      #9', RB.RB_NAME_SHORT'
      'from'
      #9'OBJAV_LIST_V_NOMER(:IS_ID) OBN'
      ''
      #9'left join OBJAV OB'
      
        #9'on (OBN.AG_ID = OB.AG_ID and OBN.SD_ID=OB.SD_ID and OBN.OB_ID=O' +
        'B.OB_ID)'
      ''
      #9'left join SDELKA SD'
      #9'on (OBN.AG_ID = SD.AG_ID and OBN.SD_ID=SD.SD_ID)'
      ''
      #9'left join RUBRIKA RB'
      #9'on (OB.RB_ID = RB.RB_ID)'
      ''
      #9'inner join CUST_FOR_OBJAV_EXPORT cex'
      #9'on (cex.AG_ID = sd.AG_ID and cex.CU_ID = sd.CU_ID)'
      'order by'
      #9'RB.RB_NAME_SHORT')
    SQLConnection = data.connection
    Left = 72
    Top = 480
    object qryObjavExportCustAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object qryObjavExportCustSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object qryObjavExportCustOB_ID: TIntegerField
      FieldName = 'OB_ID'
    end
    object qryObjavExportCustOB_STATE: TSmallintField
      FieldName = 'OB_STATE'
    end
    object qryObjavExportCustOB_COMMENT: TStringField
      FieldName = 'OB_COMMENT'
      Size = 127
    end
    object qryObjavExportCustOB_TEXT: TStringField
      FieldName = 'OB_TEXT'
      Size = 2047
    end
    object qryObjavExportCustCU_ID: TIntegerField
      FieldName = 'CU_ID'
    end
    object qryObjavExportCustRB_NAME_SHORT: TStringField
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
  end
  object prvObjavExportCust: TDataSetProvider
    DataSet = qryObjavExportCust
    Left = 208
    Top = 480
  end
  object qryModuliExportCust: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IS_ID'
        ParamType = ptUnknown
        Value = -1
      end>
    SQL.Strings = (
      'SELECT'
      '    MN.AG_ID,'
      '    MN.SD_ID,'
      '    MN.OB_ID,'
      '    MN.RB_ID,'
      '    MN.FM_ID,'
      #9'MN.CONTENT_ID,'
      #9'RB.RB_NAME_SHORT,'
      '    OC.CONTENT_PICTURE,'
      '    SD.sd_num'
      'FROM'
      #9'MODULI_V_NOMER_NOMER(:IS_ID) MN'
      ''
      #9'LEFT JOIN AGENT AG'
      #9'ON (MN.AG_ID=AG.AG_ID)'
      ''
      #9'LEFT JOIN SDELKA SD'
      #9'ON (SD.AG_ID = MN.AG_ID AND SD.SD_ID = MN.SD_ID)'
      ''
      #9'LEFT JOIN RUBRIKA RB'
      #9'ON (MN.RB_ID=RB.RB_ID)'
      ''
      #9'LEFT JOIN FORMAT FM'
      #9'ON (MN.FM_ID=FM.FM_ID)'
      ''
      #9'LEFT JOIN SDELKA_PODACHA_NUMS(MN.AG_ID,MN.SD_ID) SPN'
      #9'ON (MN.SD_ID=SPN.SD_ID)'
      ''
      '    LEFT JOIN OBJAV_CONTENT OC'
      '    ON (MN.CONTENT_ID=OC.CONTENT_ID)'
      ''
      #9'inner join CUST_FOR_OBJAV_EXPORT cex'
      #9'on (cex.AG_ID = sd.AG_ID and cex.CU_ID = sd.CU_ID)'
      '')
    SQLConnection = data.connection
    Left = 72
    Top = 531
    object qryModuliExportCustAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object qryModuliExportCustSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object qryModuliExportCustOB_ID: TIntegerField
      FieldName = 'OB_ID'
    end
    object qryModuliExportCustRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object qryModuliExportCustFM_ID: TIntegerField
      FieldName = 'FM_ID'
    end
    object qryModuliExportCustCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
    end
    object qryModuliExportCustRB_NAME_SHORT: TStringField
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object qryModuliExportCustCONTENT_PICTURE: TBlobField
      FieldName = 'CONTENT_PICTURE'
      Size = 1
    end
    object qryModuliExportCustSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
  end
  object prvModuliExportCust: TDataSetProvider
    DataSet = qryModuliExportCust
    Left = 208
    Top = 515
  end
  object cdsModuliExportCust: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IS_ID'
        ParamType = ptUnknown
        Value = -1
      end>
    ProviderName = 'prvModuliExportCust'
    ReadOnly = True
    Left = 344
    Top = 515
    object cdsModuliExportCustAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object cdsModuliExportCustSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object cdsModuliExportCustOB_ID: TIntegerField
      FieldName = 'OB_ID'
    end
    object cdsModuliExportCustRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object cdsModuliExportCustFM_ID: TIntegerField
      FieldName = 'FM_ID'
    end
    object cdsModuliExportCustCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
    end
    object cdsModuliExportCustRB_NAME_SHORT: TStringField
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object cdsModuliExportCustCONTENT_PICTURE: TBlobField
      FieldName = 'CONTENT_PICTURE'
      Size = 1
    end
  end
  object dsModuliExportCust: TDataSource
    DataSet = cdsModuliExportCust
    Left = 480
    Top = 515
  end
  object qryObjavForKorrektura: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'GZ_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'is_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select'
      '      SD.sd_num'
      '     ,obk.OB_TYPE'
      '     ,OBK.AG_ID'
      '    , OBK.SD_ID'
      '    , OBK.OB_ID'
      '    , case when obk.OB_TYPE = 1 then OB.OB_STATE'
      '           when obk.OB_TYPE = 2 then o.OB_STATE'
      '           when obk.OB_TYPE = 3 then o.OB_STATE_TXT'
      '      end as ob_state'
      '    , case when obk.OB_TYPE = 1 then OB.OB_COMMENT'
      '           when obk.OB_TYPE in (2,3) then o.OBJAV_COMMENT'
      '      end as ob_comment'
      '    , SD.CU_ID'
      '    , AG.AG_NAME'
      '    , AG.AG_IS_REMOTE'
      '    , OBK.AG_ID || '#39'-'#39' || OBK.SD_ID AS SD_ID_COMPOUND'
      '    , case when obk.OB_TYPE = 1 then RB.RB_NAME_SHORT'
      '           when obk.OB_TYPE in (2,3) then obr.RB_NAME_SHORT'
      '      end as RB_NAME_SHORT'
      '    , case when obk.OB_TYPE = 1 then FM.FM_NAME'
      '           when obk.OB_TYPE in (2,3) then ofr.FM_NAME'
      '      end as FM_NAME'
      '    , SD.GZ_ID'
      '    , GZ.GZ_NAME_SHORT'
      
        '    , (select PODACHA_NUMS from SDELKA_PODACHA_NUMS(OBK.AG_ID, O' +
        'BK.SD_ID) SPN)  AS PODACHA_NUMS'
      '    , RBL.RB_IS_LOCKABLE'
      
        '    , (case when ob.ob_comment like '#39'['#1055#1086#1074#1090#1086#1088'%'#39' then 1 else 0 end' +
        ') as SR_IS_CURRENT_ISSUE,'
      '      p.is_id'
      'from'
      '    OBJAV_LIST_FOR_KORREKTURA(:GZ_ID) OBK'
      ''
      '    left join OBJAV OB'
      
        '    on (OBK.AG_ID = OB.AG_ID and OBK.SD_ID = OB.SD_ID and OBK.OB' +
        '_ID = OB.OB_ID)'
      ''
      '    left join OBJAVLENIE o on (o.OBJAV_ID = obk.OB_ID)'
      '    left join rubrika obr on (obr.RB_ID = o.RB_ID)'
      '    left join format ofr on (ofr.FM_ID = o.FM_ID)'
      ''
      '    left join SDELKA SD'
      '    on (OBK.AG_ID = SD.AG_ID and OBK.SD_ID = SD.SD_ID)'
      ''
      '    left join AGENT AG'
      '    on (OBK.AG_ID = AG.AG_ID)'
      ''
      '    left join RUBRIKA RB'
      '    on (OB.RB_ID = RB.RB_ID)'
      ''
      '    left join RUBRIKA RBL'
      
        '    on (OB.RB_ID = RBL.RB_ID and OB.OB_IS_ACTIVE = 1 and OB.FM_I' +
        'D <> 14)'
      ''
      '    left join FORMAT FM'
      '    on (OB.FM_ID = FM.FM_ID)'
      ''
      '    left join GAZETA GZ'
      '    on (GZ.GZ_ID = SD.GZ_ID)'
      ''
      
        '    left join podacha p on (p.sd_id = sd.sd_id and p.ag_id = sd.' +
        'ag_id)'
      ''
      'where p.is_id = :is_id'
      ''
      'order by'
      '  obk.OB_TYPE desc')
    SQLConnection = data.connection
    Left = 72
    Top = 43
    object IntegerField3: TIntegerField
      FieldName = 'AG_ID'
    end
    object IntegerField4: TIntegerField
      FieldName = 'SD_ID'
    end
    object IntegerField5: TIntegerField
      FieldName = 'OB_ID'
    end
    object SmallintField3: TSmallintField
      FieldName = 'OB_STATE'
    end
    object StringField3: TStringField
      FieldName = 'OB_COMMENT'
      Size = 127
    end
    object StringField4: TStringField
      FieldName = 'AG_NAME'
      Size = 128
    end
    object SmallintField4: TSmallintField
      FieldName = 'AG_IS_REMOTE'
    end
    object StringField5: TStringField
      FieldName = 'SD_ID_COMPOUND'
      Size = 23
    end
    object StringField6: TStringField
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object StringField7: TStringField
      FieldName = 'FM_NAME'
      Size = 128
    end
    object StringField13: TStringField
      FieldName = 'GZ_NAME_SHORT'
      Size = 64
    end
    object StringField14: TStringField
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object IntegerField6: TIntegerField
      FieldName = 'CU_ID'
      ProviderFlags = []
    end
    object SmallintField5: TSmallintField
      FieldName = 'GZ_ID'
    end
    object SmallintField6: TSmallintField
      DisplayLabel = #1055#1088#1080#1086#1088#1080#1090#1077#1090
      FieldName = 'RB_IS_LOCKABLE'
      ProviderFlags = []
    end
    object IntegerField7: TIntegerField
      FieldName = 'SR_IS_CURRENT_ISSUE'
      ProviderFlags = []
    end
    object qryObjavForKorrekturaIS_ID: TIntegerField
      FieldName = 'IS_ID'
    end
    object qryObjavForKorrekturasd_num: TStringField
      FieldName = 'sd_num'
      Size = 64
    end
  end
  object dsObjavForKorrekturaNew: TDataSource
    DataSet = cdsObjavForKorrektura
    Left = 480
    Top = 48
  end
  object qIssue: TSQLQuery
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
      'select *'
      'from issue i'
      'where i.gz_id = :gz_id'
      'and i.IS_ID >= (select is_id from GET_CURRENT_ISSUE(:gz_id))'
      'order by i.is_date')
    SQLConnection = data.connection
    Left = 592
    Top = 496
  end
  object prvObjavForKorrektura: TDataSetProvider
    DataSet = qryObjavForKorrektura
    Left = 208
    Top = 51
  end
  object cdsObjavForKorrektura: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvObjavForKorrektura'
    ReadOnly = True
    Left = 344
    Top = 51
    object cdsObjavForKorrekturaAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object cdsObjavForKorrekturaSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object cdsObjavForKorrekturaOB_ID: TIntegerField
      FieldName = 'OB_ID'
    end
    object cdsObjavForKorrekturaOB_STATE: TSmallintField
      FieldName = 'OB_STATE'
    end
    object cdsObjavForKorrekturaOB_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'OB_COMMENT'
      Size = 127
    end
    object cdsObjavForKorrekturaAG_NAME: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_NAME'
      Size = 128
    end
    object cdsObjavForKorrekturaAG_IS_REMOTE: TSmallintField
      FieldName = 'AG_IS_REMOTE'
    end
    object cdsObjavForKorrekturaSD_ID_COMPOUND: TStringField
      DisplayLabel = #1050#1086#1076' '#1089#1076#1077#1083#1082#1080
      FieldName = 'SD_ID_COMPOUND'
      Size = 23
    end
    object cdsObjavForKorrekturaRB_NAME_SHORT: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object cdsObjavForKorrekturaFM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldName = 'FM_NAME'
      Size = 128
    end
    object cdsObjavForKorrekturaGZ_NAME_SHORT: TStringField
      DisplayLabel = #1043#1072#1079#1077#1090#1072
      FieldName = 'GZ_NAME_SHORT'
      Size = 64
    end
    object cdsObjavForKorrekturaPODACHA_NUMS: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object cdsObjavForKorrekturaCU_ID: TIntegerField
      FieldName = 'CU_ID'
      ProviderFlags = []
    end
    object cdsObjavForKorrekturaGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object cdsObjavForKorrekturaRB_IS_LOCKABLE: TSmallintField
      DisplayLabel = #1055#1088#1080#1086#1088#1080#1090#1077#1090
      FieldName = 'RB_IS_LOCKABLE'
      ProviderFlags = []
    end
    object cdsObjavForKorrekturaSR_IS_CURRENT_ISSUE: TIntegerField
      DisplayLabel = #1058#1077#1082'. '#8470' '#1057#1058
      FieldName = 'SR_IS_CURRENT_ISSUE'
      ProviderFlags = []
    end
    object cdsObjavForKorrekturaIS_ID: TIntegerField
      FieldName = 'IS_ID'
    end
    object cdsObjavForKorrekturasd_num: TStringField
      FieldName = 'sd_num'
      Size = 64
    end
  end
  object qSTTable: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT so.SITE_VACANCY_NAME, so.SITE_OBJAV_TEXT, so.SITE_TEL, so' +
        '.SITE_ZP, r.RB_NAME_ENG'
      'FROM PODACHA p'
      
        'LEFT JOIN OBJAV ob ON (ob.AG_ID = p.AG_ID AND ob.SD_ID = p.SD_ID' +
        ')'
      'LEFT JOIN SITE_OBJAV so ON (so.OB_ID = ob.OB_ID)'
      'LEFT JOIN RUBRIKA r ON (ob.RB_ID = r.RB_ID)'
      'WHERE p.IS_ID = (SELECT is_id FROM GET_CURRENT_ISSUE(3))'
      'AND so.SITE_OBJAV_TEXT IS NOT NULL')
    SQLConnection = data.connection
    Left = 64
    Top = 616
  end
  object prvSTTable: TDataSetProvider
    DataSet = qSTTable
    Left = 200
    Top = 600
  end
  object cdsSTTable: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSTTable'
    Left = 344
    Top = 592
    object cdsSTTableSITE_VACANCY_NAME: TStringField
      FieldName = 'SITE_VACANCY_NAME'
      Size = 128
    end
    object cdsSTTableSITE_OBJAV_TEXT: TStringField
      FieldName = 'SITE_OBJAV_TEXT'
      Size = 2047
    end
    object cdsSTTableSITE_TEL: TStringField
      FieldName = 'SITE_TEL'
      Size = 128
    end
    object cdsSTTableSITE_ZP: TIntegerField
      FieldName = 'SITE_ZP'
    end
    object cdsSTTableRB_NAME_ENG: TStringField
      FieldName = 'RB_NAME_ENG'
      Size = 128
    end
  end
  object dsSTTable: TDataSource
    DataSet = cdsSTTable
    Left = 480
    Top = 592
  end
end
