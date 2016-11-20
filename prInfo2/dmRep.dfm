object repData: TrepData
  OldCreateOrder = False
  Left = 871
  Top = 204
  Height = 677
  Width = 825
  object qrySdelkaZaPeriod: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'AG_ID'
        ParamType = ptInput
        Value = '0'
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
      end
      item
        DataType = ftString
        Name = 'AG_ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '                  sd.sd_num'
      #9' ,sd.SD_NEW_CUST'
      #9', sd.SD_ID_COMPOUND'
      #9', sd.SD_TYPE'
      #9', sd.PT_ID'
      #9', sd.SD_KA_START_DATE'
      #9', sd.SD_KA_END_DATE'
      #9', sd.SD_COMMENT'
      #9', sd.SD_FACT_NUM'
      #9', sd.SD_FACT_DATE'
      #9', sd.SD_SUM'
      #9', sd.SD_SUM_DEFAULT'
      #9', sd.SD_PERCENT'
      #9', sd.SD_PERCENT_DEFAULT'
      #9', sd.SD_PERCENT_SUM'
      #9', sd.GZ_ID'
      #9', sdt.SD_TYPE_DESC'
      #9', cu.CU_NAME'
      #9', cu.CU_ID_COMPOUND'
      #9', ac.OBJAVS_COUNT'
      #9', ac.PODACHA_COUNT'
      #9', ac.FREE_PODACHA_COUNT'
      #9', ac.ZAPAS_COUNT'
      #9', ac.PODACHA_NUMS'
      #9', ac.SDELKA_SPACE'
      #9', ac.ONE_PODACHA_SPACE'
      #9', rb.RB_NAME_SHORT'
      #9', fm.FM_NAME'
      #9', pt.PT_NAME'
      #9', sdp.PHONES as SDELKA_ALL_PHONES'
      'from'
      #9'SDELKA sd'
      ''
      #9'left join SDELKA_TYPE_DESC sdt'
      #9'on (sdt.SD_TYPE = sd.SD_TYPE and sdt.GZ_ID = sd.GZ_ID)'
      ''
      #9'left join ADDITIONAL_COUNT_FOR_SDELKA(sd.AG_ID, sd.SD_ID) ac'
      #9'on (sd.AG_ID = ac.AG_ID and sd.SD_ID = ac.SD_ID)'
      ''
      #9'left join CUST cu'
      #9'on (sd.AG_ID = cu.AG_ID and sd.CU_ID = cu.CU_ID)'
      ''
      #9'left join GET_MAX_FORMAT_AND_RUBRIKA(sd.AG_ID, sd.SD_ID) mfr'
      #9'on (sd.SD_ID = sd.SD_ID)'
      ''
      #9'left join RUBRIKA rb'
      #9'on (mfr.RB_ID = rb.RB_ID)'
      ''
      #9'left join FORMAT fm'
      #9'on (mfr.FM_ID = fm.FM_ID)'
      ''
      #9'left join PAY_TYPE pt'
      #9'on (sd.PT_ID = pt.PT_ID)'
      ''
      #9'left join GET_SDELKA_PHONES_STR(sd.AG_ID, sd.SD_ID) sdp'
      #9'on (1 = 1)'
      'where'
      #9'sd.AG_ID = :AG_ID'
      #9'and'
      #9'sd.SD_STATE <> 100'
      #9'and'
      #9'sd.SD_STATE >= 4'
      #9'and'
      #9'sd.AS_ID <> 2'
      #9'and'
      #9'sd.SD_APPROVED_DATE >= :DATE_FROM'
      #9'and'
      #9'sd.SD_APPROVED_DATE < :DATE_TO + 1'
      '                and'
      
        '               (EXISTS(SELECT 1 FROM agent a WHERE a.ag_id = :AG' +
        '_ID AND a.ag_is_active = 1))'
      'order by'
      #9'sd.SD_ID')
    SQLConnection = data.connection
    Left = 56
    Top = 32
    object qrySdelkaZaPeriodSD_NEW_CUST: TSmallintField
      DisplayLabel = 'N'
      FieldName = 'SD_NEW_CUST'
      OnGetText = qrySdelkaZaPeriodSD_NEW_CUSTGetText
    end
    object qrySdelkaZaPeriodSD_NUM: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'SD_NUM'
      Size = 64
    end
    object qrySdelkaZaPeriodSD_ID_COMPOUND: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'SD_ID_COMPOUND'
      Visible = False
      OnGetText = qrySdelkaZaPeriodCU_ID_COMPOUNDGetText
      Size = 23
    end
    object qrySdelkaZaPeriodSD_TYPE_DESC: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'SD_TYPE_DESC'
      Size = 10
    end
    object qrySdelkaZaPeriodCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qrySdelkaZaPeriodCU_ID_COMPOUND: TStringField
      DisplayLabel = #8470' '#1082#1083'.'
      FieldName = 'CU_ID_COMPOUND'
      OnGetText = qrySdelkaZaPeriodCU_ID_COMPOUNDGetText
      Size = 23
    end
    object qrySdelkaZaPeriodPT_NAME: TStringField
      DisplayLabel = #1054#1087#1083#1072#1090#1072
      FieldName = 'PT_NAME'
      Size = 64
    end
    object qrySdelkaZaPeriodSD_TYPE: TSmallintField
      FieldName = 'SD_TYPE'
      Visible = False
    end
    object qrySdelkaZaPeriodSD_KA_START_DATE: TSQLTimeStampField
      Tag = 2
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      FieldName = 'SD_KA_START_DATE'
    end
    object qrySdelkaZaPeriodSD_KA_END_DATE: TSQLTimeStampField
      Tag = 2
      DisplayLabel = #1044#1072#1090#1072' '#1082#1086#1085#1094#1072
      FieldName = 'SD_KA_END_DATE'
    end
    object qrySdelkaZaPeriodZAPAS_COUNT: TIntegerField
      Tag = 1
      DisplayLabel = #1047#1072#1087#1072#1089
      FieldName = 'ZAPAS_COUNT'
    end
    object qrySdelkaZaPeriodPODACHA_NUMS: TStringField
      Tag = 1
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object qrySdelkaZaPeriodRB_NAME_SHORT: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object qrySdelkaZaPeriodFM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldName = 'FM_NAME'
      Size = 128
    end
    object qrySdelkaZaPeriodSD_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'SD_COMMENT'
      OnGetText = qrySdelkaZaPeriodSD_COMMENTGetText
      Size = 1024
    end
    object qrySdelkaZaPeriodSD_FACT_NUM: TIntegerField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'SD_FACT_NUM'
    end
    object qrySdelkaZaPeriodSD_FACT_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1095#1077#1090#1072
      FieldName = 'SD_FACT_DATE'
    end
    object qrySdelkaZaPeriodSD_SUM: TFloatField
      DisplayLabel = #1057#1090#1086#1080#1084'.'
      FieldName = 'SD_SUM'
      DisplayFormat = '0.00'
    end
    object qrySdelkaZaPeriodSD_SUM_DEFAULT: TFloatField
      Tag = 1
      DisplayLabel = #1057#1090#1086#1080#1084'. ('#1088#1072#1089'.)'
      FieldName = 'SD_SUM_DEFAULT'
      DisplayFormat = '0.00'
    end
    object qrySdelkaZaPeriodSD_PERCENT: TFloatField
      DisplayLabel = '%'
      FieldName = 'SD_PERCENT'
      Visible = False
      DisplayFormat = '0.00'
    end
    object qrySdelkaZaPeriodSD_PERCENT_DEFAULT: TFloatField
      Tag = 1
      DisplayLabel = '% ('#1088#1072#1089'.)'
      FieldName = 'SD_PERCENT_DEFAULT'
      Visible = False
      DisplayFormat = '0.00'
    end
    object qrySdelkaZaPeriodSD_PERCENT_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' %'
      FieldName = 'SD_PERCENT_SUM'
      Visible = False
      DisplayFormat = '0.00'
    end
    object qrySdelkaZaPeriodSDELKA_SPACE: TFloatField
      Tag = 1
      DisplayLabel = #1055#1083#1086#1097'.'
      FieldName = 'SDELKA_SPACE'
      DisplayFormat = '0.00'
      Precision = 2
    end
    object qrySdelkaZaPeriodGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
      Visible = False
    end
    object qrySdelkaZaPeriodONE_PODACHA_SPACE: TFloatField
      FieldName = 'ONE_PODACHA_SPACE'
      Visible = False
    end
    object qrySdelkaZaPeriodPT_ID: TSmallintField
      FieldName = 'PT_ID'
      Required = True
      Visible = False
    end
    object qrySdelkaZaPeriodSDELKA_ALL_PHONES: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085#1099
      DisplayWidth = 1000
      FieldName = 'SDELKA_ALL_PHONES'
      Visible = False
      Size = 1000
    end
    object qrySdelkaZaPeriodPODACHA_COUNT: TIntegerField
      FieldName = 'PODACHA_COUNT'
      Visible = False
    end
  end
  object dsSdelkaZaPeriod: TDataSource
    DataSet = qrySdelkaZaPeriod
    Left = 192
    Top = 32
  end
  object qrySdelkaVNomer: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'IS_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'GZ_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'ag_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      #9'  sd.AG_ID'
      #9', sd.SD_ID'
      '                , SD.sd_num'
      #9', sd.SD_ID_COMPOUND'
      #9', cu.CU_NAME'
      #9', cu.CU_ID_COMPOUND'
      #9', cu.CU_OKPO'
      #9', cu.CU_INFO'
      #9', cu.CU_KA_INFO_SHORT'
      #9', cu.CU_KA_INFO_FULL'
      #9', ac.PODACHA_NUMS'
      #9', sd.SD_COMMENT'
      #9', iss.IS_NAME_COMPOSED'
      #9', rb.RB_NAME_SHORT'
      #9', fm.FM_NAME'
      #9', sdp.PHONES as SDELKA_ALL_PHONES'
      'from'
      #9'PODACHA pd'
      #9'left join SDELKA sd'
      #9'on (pd.AG_ID = sd.AG_ID and pd.SD_ID = sd.SD_ID)'
      ''
      #9'left join ISSUE iss'
      #9'on (pd.IS_ID = iss.IS_ID)'
      ''
      #9'left join CUST cu'
      #9'on (sd.AG_ID = cu.AG_ID and sd.CU_ID = cu.CU_ID)'
      ''
      #9'left join SDELKA_PODACHA_NUMS(pd.AG_ID, sd.SD_ID) ac'
      #9'on (sd.SD_ID = ac.SD_ID)'
      ''
      #9'left join GET_MAX_FORMAT_AND_RUBRIKA(sd.AG_ID, sd.SD_ID) mfr'
      #9'on (sd.SD_ID = sd.SD_ID)'
      ''
      #9'left join RUBRIKA rb'
      #9'on (mfr.RB_ID = rb.RB_ID)'
      ''
      #9'left join FORMAT fm'
      #9'on (mfr.FM_ID = fm.FM_ID)'
      ''
      
        #9'left join GET_SDELKA_PHONES_STR(sd.AG_ID, sd.SD_ID) sdp on (1 =' +
        ' 1)'
      'where'
      #9'pd.AG_ID = :AG_ID'
      #9'and'
      #9'pd.IS_ID = :IS_ID'
      #9'and'
      #9'pd.GZ_ID = :GZ_ID'
      #9'and'
      #9'sd.SD_STATE <> 100'
      #9'and'
      #9'sd.SD_STATE >= 4'
      #9'and'
      #9'('
      #9#9'sd.AS_ID = 0 or sd.AS_ID = 1 or sd.AS_ID is null'
      #9')'
      '               and'
      
        '               EXISTS(SELECT 1 FROM agent a WHERE a.ag_id = :ag_' +
        'id AND a.ag_is_active = 1)'
      'order by'
      #9'sd.SD_ID'
      '')
    SQLConnection = data.connection
    Left = 56
    Top = 80
    object qrySdelkaVNomerSD_NUM: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'SD_NUM'
      Size = 64
    end
    object qrySdelkaVNomerSD_ID_COMPOUND: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'SD_ID_COMPOUND'
      Visible = False
      OnGetText = qrySdelkaZaPeriodCU_ID_COMPOUNDGetText
      Size = 23
    end
    object qrySdelkaVNomerCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qrySdelkaVNomerCU_ID_COMPOUND: TStringField
      DisplayLabel = #8470' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'CU_ID_COMPOUND'
      OnGetText = qrySdelkaZaPeriodCU_ID_COMPOUNDGetText
      Size = 23
    end
    object qrySdelkaVNomerPODACHA_NUMS: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object qrySdelkaVNomerRB_NAME_SHORT: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object qrySdelkaVNomerFM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldName = 'FM_NAME'
      Size = 128
    end
    object qrySdelkaVNomerSD_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'SD_COMMENT'
      OnGetText = qrySdelkaVNomerSD_COMMENTGetText
      Size = 1024
    end
    object qrySdelkaVNomerIS_NAME_COMPOSED: TStringField
      FieldName = 'IS_NAME_COMPOSED'
      Visible = False
      Size = 25
    end
    object qrySdelkaVNomerAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Visible = False
    end
    object qrySdelkaVNomerSD_ID: TIntegerField
      FieldName = 'SD_ID'
      Visible = False
    end
    object qrySdelkaVNomerCU_OKPO: TStringField
      DisplayLabel = #1054#1050#1055#1054
      FieldName = 'CU_OKPO'
      FixedChar = True
      Size = 10
    end
    object qrySdelkaVNomerCU_INFO: TStringField
      DisplayLabel = #1048#1085#1092#1086
      FieldName = 'CU_INFO'
      Visible = False
      Size = 512
    end
    object qrySdelkaVNomerCU_KA_INFO_SHORT: TStringField
      DisplayLabel = #1048#1085#1092#1086' ('#1050#1040', '#1090#1072#1073#1083#1080#1094#1072')'
      FieldName = 'CU_KA_INFO_SHORT'
      Visible = False
      Size = 512
    end
    object qrySdelkaVNomerCU_KA_INFO_FULL: TStringField
      DisplayLabel = #1048#1085#1092#1086' ('#1050#1040')'
      FieldName = 'CU_KA_INFO_FULL'
      Visible = False
      Size = 1023
    end
    object qrySdelkaVNomerSDELKA_ALL_PHONES: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085#1099
      DisplayWidth = 1000
      FieldName = 'SDELKA_ALL_PHONES'
      Size = 1000
    end
  end
  object dsSdelkaVNomer: TDataSource
    DataSet = qrySdelkaVNomer
    Left = 192
    Top = 80
  end
  object qrySdelkaNotPayed: TSQLQuery
    DataSource = data.dsAgent
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
        Name = 'ag_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'de'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT'
      '    SNP.AG_ID,'
      '    PT.PT_NAME,'
      '    SNP.SD_ID,'
      '    SD.sd_num,'
      '    SD.SD_ID_COMPOUND,'
      '    CU.CU_ID_COMPOUND,'
      '    CU.CU_NAME,'
      '    SD.SD_FACT_NUM,'
      '    SD.SD_FACT_DATE,'
      '    SD.SD_SUM,'
      '    SD.SD_COMMENT,'
      '    SDT.SD_TYPE_DESC,'
      '    AC.PODACHA_NUMS,'
      '    sdp.PHONES as SDELKA_ALL_PHONES,'
      '    SD.PT_ID,'
      '    CU.CU_OKPO'
      'FROM'
      '    NOT_PAYED_SDELKA SNP'
      ''
      
        '    LEFT JOIN SDELKA SD ON (SD.AG_ID = SNP.AG_ID AND SD.SD_ID = ' +
        'SNP.SD_ID)'
      ''
      
        '    LEFT JOIN SDELKA_TYPE_DESC SDT ON (SDT.SD_TYPE = SD.SD_TYPE ' +
        'AND SDT.GZ_ID = SD.GZ_ID)'
      ''
      
        '    LEFT JOIN CUST CU ON (SD.AG_ID = CU.AG_ID AND SD.CU_ID = CU.' +
        'CU_ID)'
      ''
      
        '    LEFT JOIN SDELKA_PODACHA_NUMS(SD.AG_ID, SD.SD_ID) AC ON (1 =' +
        ' 1)'
      ''
      '    LEFT JOIN PAY_TYPE PT ON (SD.PT_ID = PT.PT_ID)'
      ''
      
        '    left join GET_SDELKA_PHONES_STR(snp.AG_ID, snp.SD_ID) sdp on' +
        ' (1 = 1)'
      'WHERE'
      '    SNP.AG_ID = :AG_ID AND'
      '    SD.PT_ID IN (2,3,4,6) AND'
      
        '    EXISTS(SELECT 1 FROM agent a WHERE a.ag_id = :ag_id AND a.ag' +
        '_is_active = 1) AND'
      
        '    (((SD.gz_id = :gz_id) AND (:gz_id >= 0)) OR (:gz_id = -1)) A' +
        'ND sd.SD_APPROVED_DATE BETWEEN :ds AND :de'
      ''
      'ORDER BY'
      '    SNP.SD_ID')
    SQLConnection = data.connection
    Left = 56
    Top = 320
    object qrySdelkaNotPayedAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Visible = False
    end
    object qrySdelkaNotPayedSD_ID: TIntegerField
      FieldName = 'SD_ID'
      Visible = False
    end
    object qrySdelkaNotPayedSD_NUM: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'SD_NUM'
      Size = 64
    end
    object qrySdelkaNotPayedSD_ID_COMPOUND: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'SD_ID_COMPOUND'
      Visible = False
      OnGetText = qrySdelkaZaPeriodCU_ID_COMPOUNDGetText
      Size = 23
    end
    object qrySdelkaNotPayedSD_TYPE_DESC: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'SD_TYPE_DESC'
      Size = 10
    end
    object qrySdelkaNotPayedPT_NAME: TStringField
      DisplayLabel = #1054#1087#1083#1072#1090#1072
      FieldName = 'PT_NAME'
      Size = 64
    end
    object qrySdelkaNotPayedCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qrySdelkaNotPayedCU_OKPO: TStringField
      DisplayLabel = #1054#1050#1055#1054
      FieldName = 'CU_OKPO'
      Size = 10
    end
    object qrySdelkaNotPayedCU_ID_COMPOUND: TStringField
      DisplayLabel = #8470' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'CU_ID_COMPOUND'
      OnGetText = qrySdelkaZaPeriodCU_ID_COMPOUNDGetText
      Size = 23
    end
    object qrySdelkaNotPayedSD_FACT_NUM: TIntegerField
      DisplayLabel = #8470' '#1089#1095#1105#1090#1072
      FieldName = 'SD_FACT_NUM'
    end
    object qrySdelkaNotPayedSD_FACT_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1095#1105#1090#1072
      FieldName = 'SD_FACT_DATE'
    end
    object qrySdelkaNotPayedSD_SUM: TFloatField
      DisplayLabel = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      FieldName = 'SD_SUM'
      DisplayFormat = '0.00'
    end
    object qrySdelkaNotPayedSD_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'SD_COMMENT'
      OnGetText = qrySdelkaNotPayedSD_COMMENTGetText
      Size = 1024
    end
    object qrySdelkaNotPayedPODACHA_NUMS: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object qrySdelkaNotPayedSDELKA_ALL_PHONES: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085#1099
      FieldName = 'SDELKA_ALL_PHONES'
      Size = 1000
    end
    object qrySdelkaNotPayedPT_ID: TSmallintField
      FieldName = 'PT_ID'
      Visible = False
    end
  end
  object dsSdelkaNotPayed: TDataSource
    DataSet = qrySdelkaNotPayed
    Left = 192
    Top = 328
  end
  object qryZapasByTime: TSQLQuery
    DataSource = data.dsAgent
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'AG_ID'
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
      end
      item
        DataType = ftUnknown
        Name = 'ag_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT'
      
        '    (SELECT s.sd_num FROM sdelka s WHERE s.ag_id = sdr.ag_id AND' +
        ' s.sd_id = sdr.sd_id) AS sd_num,'
      '    SDR.AG_ID,'
      '    SDR.SD_ID,'
      '    SDR.SD_ID_COMPOUND,'
      '    CU.CU_NAME,'
      '    CU.CU_ID_COMPOUND,'
      '    SDR.SD_COMMENT,'
      '    AC.ZAPAS_COUNT'
      'FROM'
      '('
      '    ('
      '        SDELKA_REAL SDR'
      '        LEFT JOIN CUST CU'
      '        ON (SDR.AG_ID=CU.AG_ID AND SDR.CU_ID=CU.CU_ID)'
      '    )'
      
        '    LEFT JOIN ADDITIONAL_COUNT_FOR_SDELKA(SDR.AG_ID,SDR.SD_ID) A' +
        'C'
      '    ON (SDR.AG_ID=AC.AG_ID AND SDR.SD_ID=AC.SD_ID)'
      ')'
      'WHERE'
      '    SDR.AG_ID=:AG_ID AND'
      '    CAST(SDR.SD_DATE AS DATE)>=:DATE_FROM AND'
      '    CAST(SDR.SD_DATE AS DATE)<=:DATE_TO AND'
      
        '    EXISTS(SELECT 1 FROM agent a WHERE a.ag_id = :ag_id AND a.ag' +
        '_is_active = 1) AND'
      '    AC.ZAPAS_COUNT>0')
    SQLConnection = data.connection
    Left = 56
    Top = 176
    object qryZapasByTimeAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Visible = False
    end
    object qryZapasByTimeSD_ID: TIntegerField
      FieldName = 'SD_ID'
      Visible = False
    end
    object qryZapasByTimeSD_NUM: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1089#1076#1077#1083#1082#1080
      FieldName = 'SD_NUM'
      Size = 64
    end
    object qryZapasByTimeSD_ID_COMPOUND: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1089#1076#1077#1083#1082#1080
      FieldName = 'SD_ID_COMPOUND'
      Visible = False
      OnGetText = qrySdelkaZaPeriodCU_ID_COMPOUNDGetText
      Size = 23
    end
    object qryZapasByTimeCU_ID_COMPOUND: TStringField
      DisplayLabel = #8470' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'CU_ID_COMPOUND'
      OnGetText = qrySdelkaZaPeriodCU_ID_COMPOUNDGetText
      Size = 23
    end
    object qryZapasByTimeCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qryZapasByTimeSD_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'SD_COMMENT'
      OnGetText = qryZapasByTimeSD_COMMENTGetText
      Size = 1024
    end
    object qryZapasByTimeZAPAS_COUNT: TIntegerField
      DisplayLabel = #1047#1072#1087#1072#1089
      FieldName = 'ZAPAS_COUNT'
    end
  end
  object dsZapasByTime: TDataSource
    DataSet = qryZapasByTime
    Left = 192
    Top = 176
  end
  object qryInterceptions: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      #9'GI.*,'
      #9'AG1.AG_NAME AS AG_NAME,'
      #9'AG2.AG_NAME AS AG_NAME_INTERCEPTED,'
      #9'SD2.SD_ID_COMPOUND,'
      '                SD2.sd_num,'
      #9'CU1.CU_NAME,'
      #9'CU1.CU_ID_COMPOUND,'
      #9'CU2.CU_NAME AS CU_NAME_INTERCEPTED,'
      #9'CU2.CU_ID_COMPOUND AS CU_ID_COMPOUND_INTERCEPTED'#9
      'FROM'
      '('
      #9'('
      #9#9'('
      #9#9#9'('
      #9#9#9#9'GET_INTERCEPTIONS GI'
      #9#9#9#9'LEFT JOIN AGENT AG1'
      #9#9#9#9'ON (GI.AG_ID=AG1.AG_ID)'
      #9#9#9')'
      #9#9#9'LEFT JOIN AGENT AG2'
      #9#9#9'ON (GI.AG_ID_INTERCEPTED=AG2.AG_ID)'
      #9#9')'
      #9#9'LEFT JOIN SDELKA SD2'
      #9#9'ON (GI.AG_ID=SD2.AG_ID AND GI.SD_ID=SD2.SD_ID)'
      #9')'
      #9'LEFT JOIN CUST CU1'
      #9'ON (GI.AG_ID=CU1.AG_ID AND SD2.CU_ID=CU1.CU_ID)'
      ')'
      'LEFT JOIN CUST CU2'
      
        'ON (GI.AG_ID_INTERCEPTED=CU2.AG_ID AND GI.CU_ID_INTERCEPTED=CU2.' +
        'CU_ID)'
      'ORDER BY AG1.AG_NAME,GI.SD_ID,GI.PH_NUMBER,AG2.AG_NAME')
    SQLConnection = data.connection
    Left = 352
    Top = 32
    object qryInterceptionsAG_NAME: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_NAME'
      Size = 128
    end
    object qryInterceptionsSD_NUM: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'SD_NUM'
      Size = 64
    end
    object qryInterceptionsSD_ID_COMPOUND: TStringField
      DisplayLabel = #1057#1076#1077#1083#1082#1072
      FieldName = 'SD_ID_COMPOUND'
      Visible = False
      Size = 23
    end
    object qryInterceptionsCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qryInterceptionsCU_ID_COMPOUND: TStringField
      DisplayLabel = #8470' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'CU_ID_COMPOUND'
      Size = 23
    end
    object qryInterceptionsPH_NUMBER: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'PH_NUMBER'
      Size = 12
    end
    object qryInterceptionsAG_NAME_INTERCEPTED: TStringField
      DisplayLabel = #1055#1077#1088#1077#1089#1077#1095#1077#1085#1080#1077' '#1089' '#1072#1075#1077#1085#1090#1086#1084
      FieldName = 'AG_NAME_INTERCEPTED'
      Size = 128
    end
    object qryInterceptionsCU_NAME_INTERCEPTED: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME_INTERCEPTED'
      Size = 128
    end
    object qryInterceptionsCU_ID_COMPOUND_INTERCEPTED: TStringField
      DisplayLabel = #8470' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'CU_ID_COMPOUND_INTERCEPTED'
      Size = 23
    end
    object qryInterceptionsAG_ID_INTERCEPTED: TIntegerField
      FieldName = 'AG_ID_INTERCEPTED'
      Visible = False
    end
    object qryInterceptionsCU_ID_INTERCEPTED: TIntegerField
      FieldName = 'CU_ID_INTERCEPTED'
      Visible = False
    end
  end
  object dsSdelkaCountSummary: TDataSource
    Left = 192
    Top = 224
  end
  object qryZarplata: TSQLQuery
    DataSource = data.dsAgent
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftString
        Name = 'DATE_FROM'
        ParamType = ptInput
        Value = '01.01.01'
      end
      item
        DataType = ftString
        Name = 'DATE_TO'
        ParamType = ptInput
        Value = '01.01.01'
      end>
    SQL.Strings = (
      'SELECT'
      '    SD.SD_ID_COMPOUND,'
      '    SD.SD_FACT_NUM,'
      '    SD.SD_FACT_DATE,'
      '    SD.SD_SUM,'
      '    SD.SD_SUM_PAYED,'
      '    SD.SD_PERCENT,'
      '    SD.SD_PERCENT_SUM,'
      '    SD.SD_PERCENT_SUM_TO_GIVE,'
      '    SD.SD_COMMENT,'
      '    SD.PT_ID,'
      #9'CU.CU_NAME,'
      #9'SDS.SDS_NAME,'
      #9'PT.PT_NAME'
      'FROM'
      '    SDELKA_FOR_ZARPLATA(:AG_ID,:DATE_FROM,:DATE_TO) SDZ'
      #9'LEFT JOIN SDELKA SD'
      #9'ON (SDZ.AG_ID=SD.AG_ID AND SDZ.SD_ID=SD.SD_ID)'
      ''
      #9'LEFT JOIN CUST CU'
      #9'ON (SD.AG_ID=CU.AG_ID AND SD.CU_ID=CU.CU_ID)'
      ''
      #9'LEFT JOIN SDELKA_STATE SDS'
      #9'ON (SD.SD_STATE=SDS.SDS_ID)'
      ''
      #9'LEFT JOIN PAY_TYPE PT'
      #9'ON (SD.PT_ID=PT.PT_ID)'
      'ORDER BY'
      '    SD.PT_ID,SD.SD_ID DESC')
    SQLConnection = data.connection
    Left = 56
    Top = 272
    object qryZarplataSD_ID_COMPOUND: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'SD_ID_COMPOUND'
      OnGetText = qrySdelkaZaPeriodCU_ID_COMPOUNDGetText
      Size = 23
    end
    object qryZarplataCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qryZarplataSDS_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'SDS_NAME'
      Size = 64
    end
    object qryZarplataPT_NAME: TStringField
      DisplayLabel = #1054#1087#1083#1072#1090#1072
      FieldName = 'PT_NAME'
      Size = 64
    end
    object qryZarplataSD_FACT_NUM: TIntegerField
      DisplayLabel = #1057#1095#1105#1090
      FieldName = 'SD_FACT_NUM'
    end
    object qryZarplataSD_FACT_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1095#1105#1090#1072
      FieldName = 'SD_FACT_DATE'
    end
    object qryZarplataSD_SUM: TFloatField
      DisplayLabel = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      FieldName = 'SD_SUM'
      DisplayFormat = '0.00'
    end
    object qryZarplataSD_SUM_PAYED: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'SD_SUM_PAYED'
      DisplayFormat = '0.00'
    end
    object qryZarplataSD_PERCENT: TFloatField
      DisplayLabel = '%'
      FieldName = 'SD_PERCENT'
      DisplayFormat = '0.00'
    end
    object qryZarplataSD_PERCENT_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' %'
      FieldName = 'SD_PERCENT_SUM'
      DisplayFormat = '0.00'
    end
    object qryZarplataSD_PERCENT_SUM_TO_GIVE: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' % ('#1082' '#1074#1099#1076#1072#1095#1077')'
      FieldName = 'SD_PERCENT_SUM_TO_GIVE'
    end
    object qryZarplataSD_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'SD_COMMENT'
      OnGetText = qryZarplataSD_COMMENTGetText
      Size = 1024
    end
    object qryZarplataPT_ID: TSmallintField
      FieldName = 'PT_ID'
      Visible = False
    end
  end
  object dsZarplata: TDataSource
    DataSet = qryZarplata
    Left = 192
    Top = 272
  end
  object qryPayedBeznalByTime: TSQLQuery
    MaxBlobSize = -1
    ParamCheck = False
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDate
        Name = 'DATE_FROM'
        ParamType = ptInput
        Value = 36892d
      end
      item
        DataType = ftDate
        Name = 'DATE_TO'
        ParamType = ptInput
        Value = 36892d
      end
      item
        DataType = ftInteger
        Name = 'ag_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      #9'SDR.AG_ID,'
      #9'PT.PT_NAME,'
      #9'SDR.SD_ID,'
      '                SDR.sd_num,'
      #9'SDR.SD_ID_COMPOUND,'
      #9'SDT.SD_TYPE_DESC,'
      #9'CU.CU_ID_COMPOUND,'
      #9'CU.CU_NAME,'
      #9'SDR.SD_FACT_NUM,'
      #9'SDR.SD_FACT_DATE,'
      #9'SDR.SD_SUM,'
      #9'SDR.SD_SUM_PAYED,'
      #9'SDR.SD_COMMENT,'
      #9'AC.PODACHA_NUMS'
      'FROM'
      #9'SDELKA_FOR_ZARPLATA(:AG_ID,:DATE_FROM,:DATE_TO) SDZ'
      ''
      #9'LEFT JOIN SDELKA SDR'
      #9'ON (SDZ.AG_ID=SDR.AG_ID AND SDZ.SD_ID=SDR.SD_ID)'
      ''
      #9'LEFT JOIN SDELKA_TYPE_DESC SDT'
      #9'ON (SDT.SD_TYPE = SDR.SD_TYPE AND SDT.GZ_ID = SDR.GZ_ID)'
      ''
      '    LEFT JOIN CUST CU'
      #9'ON (SDR.AG_ID=CU.AG_ID AND SDR.CU_ID=CU.CU_ID)'
      ''
      #9'LEFT JOIN SDELKA_PODACHA_NUMS(SDZ.AG_ID,SDZ.SD_ID) AC'
      #9'ON (SDZ.SD_ID=AC.SD_ID)'
      ''
      #9'LEFT JOIN PAY_TYPE PT'
      #9'ON (SDR.PT_ID=PT.PT_ID)'
      'WHERE'
      #9'SDR.PT_ID IN (2,3) AND'
      
        '                EXISTS(SELECT 1 FROM agent a WHERE a.ag_id = :ag' +
        '_id AND a.ag_is_active = 1)'
      'ORDER BY'
      #9'SDR.SD_PAY_DATE')
    SQLConnection = data.connection
    Left = 56
    Top = 368
    object qryPayedBeznalByTimeAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Visible = False
    end
    object qryPayedBeznalByTimeSD_ID: TIntegerField
      FieldName = 'SD_ID'
      Visible = False
    end
    object qryPayedBeznalByTimeSD_NUM: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'SD_NUM'
      Size = 64
    end
    object qryPayedBeznalByTimeSD_ID_COMPOUND: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'SD_ID_COMPOUND'
      Visible = False
      OnGetText = qrySdelkaZaPeriodCU_ID_COMPOUNDGetText
      Size = 23
    end
    object qryPayedBeznalByTimeSD_TYPE_DESC: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'SD_TYPE_DESC'
      Size = 10
    end
    object qryPayedBeznalByTimePT_NAME: TStringField
      DisplayLabel = #1054#1087#1083#1072#1090#1072
      FieldName = 'PT_NAME'
      Size = 64
    end
    object qryPayedBeznalByTimeCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qryPayedBeznalByTimeCU_ID_COMPOUND: TStringField
      DisplayLabel = #8470' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'CU_ID_COMPOUND'
      OnGetText = qrySdelkaZaPeriodCU_ID_COMPOUNDGetText
      Size = 23
    end
    object qryPayedBeznalByTimeSD_FACT_NUM: TIntegerField
      DisplayLabel = #8470' '#1089#1095#1105#1090#1072
      FieldName = 'SD_FACT_NUM'
    end
    object qryPayedBeznalByTimeSD_FACT_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1095#1105#1090#1072
      FieldName = 'SD_FACT_DATE'
    end
    object qryPayedBeznalByTimeSD_SUM: TFloatField
      DisplayLabel = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      FieldName = 'SD_SUM'
      DisplayFormat = '0.00'
    end
    object qryPayedBeznalByTimeSD_SUM_PAYED: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'SD_SUM_PAYED'
      DisplayFormat = '0.00'
    end
    object qryPayedBeznalByTimeSD_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'SD_COMMENT'
      OnGetText = qrySdelkaNotPayedSD_COMMENTGetText
      Size = 1024
    end
    object qryPayedBeznalByTimePODACHA_NUMS: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
  end
  object qryNotApprovedSdelkas: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ag_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '      SDR.*'
      '    , PT.PT_NAME'
      '    , CU.CU_NAME'
      '    , ASS.AS_NAME'
      '    , SDS.SDS_NAME'
      '    , case when sdr.SD_TYPE = 4 then'
      '            ('
      
        '             substring(100 + extract(day from sdr.SD_KA_START_DA' +
        'TE) from 2 for 2) || '#39'.'#39' ||'
      
        '             substring(100 + extract(month from sdr.SD_KA_START_' +
        'DATE) from 2 for 2) || '#39'.'#39' ||'
      '             extract(year from sdr.SD_KA_START_DATE) || '#39' - '#39' ||'
      
        '             substring(100 + extract(day from sdr.SD_KA_END_DATE' +
        ') from 2 for 2) || '#39'.'#39' ||'
      
        '             substring(100 + extract(month from sdr.SD_KA_END_DA' +
        'TE) from 2 for 2) || '#39'.'#39' ||'
      '             extract(year from sdr.SD_KA_END_DATE)'
      '            )'
      '            else AC.PODACHA_NUMS'
      '      end as PODACHA_NUMS'
      '    , ('
      
        '        select result from SD_IS_CURRENT_ISSUE(sdr.ag_id, sdr.sd' +
        '_id)'
      '      ) as ST_IS_CURRENT_ISSUE    -- '#1058#1077#1082' '#8470' '#1057#1058
      '    , ('
      '          select count(*)'
      '          from'
      '              OBJAV IOB'
      '              left join RUBRIKA IRB'
      '              on (IOB.RB_ID = IRB.RB_ID)'
      '          where     IOB.AG_ID = SDR.AG_ID'
      '                and IOB.SD_ID = SDR.SD_ID'
      '                and IOB.OB_IS_ACTIVE = 1'
      '                and IOB.FM_ID <> 14'
      '                and IRB.RB_IS_LOCKABLE = 1'
      '      ) + ('
      '          select count(*)'
      '          from'
      '              PODACHA PD'
      ''
      '              left join OBJAVLENIE IOB2'
      '              on (IOB2.PD_ID = PD.PD_ID)'
      ''
      '              left join RUBRIKA IRB2'
      '              on (IOB2.RB_ID = IRB2.RB_ID)'
      ''
      '              left join RUBRIKA IRB3'
      '              on (IOB2.DOUBLE_RB_ID = IRB3.RB_ID)'
      '          where     PD.AG_ID = SDR.AG_ID'
      '                and PD.SD_ID = SDR.SD_ID'
      '                and PD.PD_IS_DONE <> 1'
      '                and ('
      '                       IRB2.RB_IS_LOCKABLE = 1'
      '                    or IRB3.RB_IS_LOCKABLE = 1'
      '                )'
      '        ) as RB_IS_LOCKABLE,'
      
        '        (select GZ_NAME_SHORT from gazeta g where g.gz_id = sdr.' +
        'gz_id) as GZ_NAME_SHORT'
      'FROM'
      '    SDELKA_WORKING_LIST sw'
      ''
      
        '    left join SDELKA sdr on (sdr.AG_ID = sw.AG_ID and sdr.SD_ID ' +
        '= sw.SD_ID)'
      ''
      '/*    SDELKA_REAL SDR*/'
      ''
      '    LEFT JOIN CUST CU'
      '    ON (SDR.AG_ID=CU.AG_ID AND SDR.CU_ID=CU.CU_ID)'
      ''
      '    LEFT JOIN APPROVING_STATUS ASS'
      '    ON (SDR.AS_ID=ASS.AS_ID)'
      ''
      '    LEFT JOIN SDELKA_STATE SDS'
      '    ON (SDR.SD_STATE=SDS.SDS_ID)'
      ''
      '    LEFT JOIN PAY_TYPE PT'
      '    ON (SDR.PT_ID=PT.PT_ID)'
      ''
      '    LEFT JOIN SDELKA_PODACHA_NUMS(:AG_ID,SDR.SD_ID) AC'
      '    ON (SDR.SD_ID=AC.SD_ID)'
      'WHERE'
      
        '    (((sdr.gz_id = :gz_id) AND (:gz_id >= 0)) OR (:gz_id < 0)) A' +
        'ND'
      '    sw.AG_ID=:AG_ID'
      '    AND'
      '    ('
      '        sw.SD_STATE<4'
      '        OR'
      '        sw.AS_ID=1'
      '    ) AND'
      
        '   EXISTS(SELECT 1 FROM agent a WHERE a.ag_id = :ag_id AND a.ag_' +
        'is_active = 1)'
      'ORDER BY'
      '    sw.SD_ID'
      ''
      ''
      ''
      ''
      '')
    SQLConnection = data.connection
    Left = 352
    Top = 80
    object qryNotApprovedSdelkasST_IS_CURRENT_ISSUE: TIntegerField
      DisplayLabel = #1058#1077#1082' '#8470
      FieldName = 'ST_IS_CURRENT_ISSUE'
      OnGetText = qryNotApprovedSdelkasST_IS_CURRENT_ISSUEGetText
    end
    object qryNotApprovedSdelkasGZ_NAME_SHORT: TStringField
      DisplayLabel = #1043#1072#1079#1077#1090#1072
      FieldName = 'GZ_NAME_SHORT'
      Size = 64
    end
    object qryNotApprovedSdelkasRB_IS_LOCKABLE: TFMTBCDField
      Tag = 13
      Alignment = taCenter
      DisplayLabel = #1055#1088#1080#1086#1088#1080#1090#1077#1090
      FieldName = 'RB_IS_LOCKABLE'
      OnGetText = qryNotApprovedSdelkasRB_IS_LOCKABLEGetText
      Precision = 15
      Size = 0
    end
    object qryNotApprovedSdelkasSDS_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'SDS_NAME'
      Size = 64
    end
    object qryNotApprovedSdelkasSD_NUM: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'SD_NUM'
      Size = 64
    end
    object qryNotApprovedSdelkasSD_ID_COMPOUND: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'SD_ID_COMPOUND'
      Visible = False
      Size = 23
    end
    object qryNotApprovedSdelkasCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qryNotApprovedSdelkasPT_NAME: TStringField
      DisplayLabel = #1060'. '#1086#1087#1083#1072#1090#1099
      FieldName = 'PT_NAME'
      Size = 64
    end
    object qryNotApprovedSdelkasPODACHA_NUMS: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object qryNotApprovedSdelkasSD_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'SD_COMMENT'
      OnGetText = qrySdelkaNotPayedSD_COMMENTGetText
      Size = 1024
    end
    object qryNotApprovedSdelkasSD_STATE: TIntegerField
      Tag = 13
      FieldName = 'SD_STATE'
    end
    object qryNotApprovedSdelkasSD_SUM: TFloatField
      DisplayLabel = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      FieldName = 'SD_SUM'
      DisplayFormat = '0.00'
    end
    object qryNotApprovedSdelkasSD_TYPE: TIntegerField
      Tag = 13
      FieldName = 'SD_TYPE'
    end
  end
  object qryBonusLog: TSQLQuery
    MaxBlobSize = -1
    Params = <
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
      'SELECT'
      #9'BT.*,'
      #9'AG.AG_NAME,'
      #9'CU.CU_NAME'
      'FROM'
      #9'('
      #9#9'BONUS_TRANSACTIONS BT'
      #9#9'LEFT JOIN AGENT AG'
      #9#9'ON (BT.AG_ID=AG.AG_ID)'
      #9')'
      #9'LEFT JOIN CUST CU'
      #9'ON (BT.AG_ID=CU.AG_ID AND BT.CU_ID=CU.CU_ID)'
      'WHERE'
      #9'CAST(BT.BT_DATE AS DATE)>=:DATE_FROM'
      #9'AND'
      #9'CAST(BT.BT_DATE AS DATE)<=:DATE_TO'
      'ORDER BY'
      #9'BT.BT_DATE,BT.AG_ID,BT.CU_ID')
    SQLConnection = data.connection
    Left = 352
    Top = 128
    object qryBonusLogBT_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'BT_DATE'
    end
    object qryBonusLogAG_NAME: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_NAME'
      Size = 128
    end
    object qryBonusLogCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qryBonusLogBT_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1073#1086#1085#1091#1089#1072' '#1082#1083#1080#1077#1085#1090#1072' ('#1087#1086#1089#1083#1077')'
      FieldName = 'BT_SUM'
    end
    object qryBonusLogBT_CHANGE: TFloatField
      DisplayLabel = #1048#1079#1084#1077#1085#1077#1085#1080#1077
      FieldName = 'BT_CHANGE'
    end
    object qryBonusLogBT_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'BT_COMMENT'
      Size = 128
    end
  end
  object qryCassaBefore: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'US_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'US_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_FROM'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT'
      #9'MT.MT_SUM AS SUM_WAS'
      'FROM'
      #9'MONEY_TRANSACTIONS MT'
      'WHERE'
      #9'MT.US_ID=:US_ID'
      #9'AND'
      #9'MT.MT_ID='#9'('
      #9#9#9#9#9'SELECT'
      #9#9#9#9#9#9'MAX(MT2.MT_ID)'
      #9#9#9#9#9'FROM'
      #9#9#9#9#9#9'MONEY_TRANSACTIONS MT2'
      #9#9#9#9#9'WHERE'
      #9#9#9#9#9#9'MT2.US_ID=:US_ID'
      #9#9#9#9#9#9'AND'
      #9#9#9#9#9#9'CAST(MT2.MT_DATE AS DATE)<:DATE_FROM'
      #9#9#9#9')')
    SQLConnection = data.connection
    Left = 352
    Top = 176
  end
  object qryCassaAfter: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'US_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'US_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_TO'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT'
      #9'MT.MT_SUM AS SUM_NOW'
      'FROM'
      #9'MONEY_TRANSACTIONS MT'
      'WHERE'
      #9'MT.US_ID=:US_ID'
      #9'AND'
      #9'MT.MT_ID='#9'('
      #9#9#9#9#9'SELECT'
      #9#9#9#9#9#9'MAX(MT2.MT_ID)'
      #9#9#9#9#9'FROM'
      #9#9#9#9#9#9'MONEY_TRANSACTIONS MT2'
      #9#9#9#9#9'WHERE'
      #9#9#9#9#9#9'MT2.US_ID=:US_ID'
      #9#9#9#9#9#9'AND'
      #9#9#9#9#9#9'CAST(MT2.MT_DATE AS DATE)<=:DATE_TO'
      #9#9#9#9')')
    SQLConnection = data.connection
    Left = 448
    Top = 176
  end
  object qryFinZarplata: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'US_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TT_ID'
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
      'SELECT'
      #9'MT.*'
      'FROM'
      #9'MONEY_TRANSACTIONS MT'
      'WHERE'
      #9'MT.US_ID=:US_ID'
      #9'AND'
      #9'TT_ID=:TT_ID'
      #9'AND'
      #9'CAST(MT.MT_DATE AS DATE)>=:DATE_FROM'
      #9'AND'
      #9'CAST(MT.MT_DATE AS DATE)<=:DATE_TO')
    SQLConnection = data.connection
    Left = 352
    Top = 224
    object qryFinZarplataMT_ID: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'MT_ID'
    end
    object qryFinZarplataMT_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'MT_DATE'
    end
    object qryFinZarplataMT_SUM: TFloatField
      DisplayLabel = #1050#1072#1089#1089#1072' ('#1087#1086#1089#1083#1077')'
      FieldName = 'MT_SUM'
      DisplayFormat = '0.00'
    end
    object qryFinZarplataMT_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'MT_COMMENT'
      Size = 128
    end
    object qryFinZarplataMT_CHANGE: TFloatField
      DisplayLabel = #1048#1079#1084#1077#1085#1077#1085#1080#1077
      FieldName = 'MT_CHANGE'
      DisplayFormat = '0.00'
    end
    object qryFinZarplataTT_ID: TIntegerField
      FieldName = 'TT_ID'
      Visible = False
    end
    object qryFinZarplataUS_ID: TIntegerField
      FieldName = 'US_ID'
      Visible = False
    end
  end
  object qryFinZarplataSubTotal: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'US_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TT_ID'
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
      'SELECT'
      #9'SUM(MT.MT_CHANGE)'
      'FROM'
      #9'MONEY_TRANSACTIONS MT'
      'WHERE'
      #9'MT.US_ID=:US_ID'
      #9'AND'
      #9'TT_ID=:TT_ID'
      #9'AND'
      #9'CAST(MT.MT_DATE AS DATE)>=:DATE_FROM'
      #9'AND'
      #9'CAST(MT.MT_DATE AS DATE)<=:DATE_TO')
    SQLConnection = data.connection
    Left = 448
    Top = 224
    object qryFinZarplataSubTotalSUM: TFloatField
      FieldName = 'SUM'
      DisplayFormat = '0.00'
    end
  end
  object tblTransType: TSimpleDataSet
    Aggregates = <>
    Connection = data.connection
    DataSet.CommandText = 'TRANSACTION_TYPE'
    DataSet.CommandType = ctTable
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 352
    Top = 272
    object tblTransTypeTT_ID: TIntegerField
      FieldName = 'TT_ID'
      Required = True
    end
    object tblTransTypeTT_NAME: TStringField
      FieldName = 'TT_NAME'
      Size = 64
    end
    object tblTransTypeTT_SIGN: TSmallintField
      FieldName = 'TT_SIGN'
      Required = True
    end
  end
  object qryObjavCountByRubrika: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'IS_ID'
        ParamType = ptInput
        Value = '0'
      end>
    SQL.Strings = (
      'SELECT'
      '    RB.RB_NAME,'
      '    FM.FM_NAME,'
      '    COUNT(*) AS CNT'
      'FROM'
      #9'OBJAV_LIST_V_NOMER_ALL(:IS_ID) OBJ'
      #9'LEFT JOIN OBJAV OB'
      
        #9'ON (OBJ.AG_ID=OB.AG_ID AND OBJ.SD_ID=OB.SD_ID AND OBJ.OB_ID=OB.' +
        'OB_ID)'
      ''
      #9'LEFT JOIN RUBRIKA RB'
      #9'ON (OB.RB_ID=RB.RB_ID)'
      ''
      #9'LEFT JOIN FORMAT FM'
      #9'ON (OB.FM_ID=FM.FM_ID)'
      'GROUP BY'
      #9'FM.FM_NAME,RB.RB_NAME'
      'ORDER BY'
      #9'1, 2')
    SQLConnection = data.connection
    Left = 528
    Top = 80
    object qryObjavCountByRubrikaRB_NAME: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME'
      Size = 128
    end
    object qryObjavCountByRubrikaFM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldName = 'FM_NAME'
      Size = 128
    end
    object qryObjavCountByRubrikaCNT: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1081
      FieldName = 'CNT'
    end
  end
  object qrySdelkaObjav: TSQLQuery
    DataSource = dsSdelkaVNomer
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
        Name = 'SD_ID'
        ParamType = ptInput
        Size = 4
      end
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
    SQL.Strings = (
      'SELECT'
      #9'RB.RB_NAME_SHORT,'
      #9'FM.FM_NAME,'
      #9'CAST(OB.OB_TEXT AS VARCHAR(2047)) AS OB_TEXT,'
      #9'CAST(OB.OB_COMMENT AS VARCHAR(127)) AS OB_COMMENT,'
      #9'RB2.RB_NAME_SHORT AS DRB_RB_NAME'
      'FROM'
      #9'OBJAV OB'
      ''
      
        '    left join OBJAV OB2 on (OB2.AG_ID = OB.AG_ID and OB2.SD_ID =' +
        ' OB.SD_ID and OB2.OB_PARENT = OB.OB_ID)'
      '    left join RUBRIKA RB2 on (RB2.RB_ID = OB2.RB_ID)'
      '    '
      '    , RUBRIKA RB, FORMAT FM'
      ''
      'WHERE'
      #9'OB.AG_ID=:AG_ID'
      #9'AND OB.SD_ID=:SD_ID'
      #9'AND OB.OB_IS_ACTIVE=1'
      #9'AND OB.OB_PARENT IS NULL'
      ''
      #9'AND RB.RB_ID = OB.RB_ID'
      #9'AND FM.FM_ID = OB.FM_ID'
      ''
      'UNION'
      ''
      'SELECT'
      #9'RB_O.RB_NAME_SHORT,'
      #9'FM_O.FM_NAME,'
      #9'CAST('#39#39' AS VARCHAR(2047)) AS OB_TEXT,'
      #9'CAST('#39#39' AS VARCHAR(127)) AS OB_COMMENT,'
      #9'RB_OD.RB_NAME_SHORT AS DRB_RB_NAME'
      'FROM'
      #9'GET_CURRENT_PODACHA(:AG_ID, :SD_ID) CPD'
      ''
      #9'LEFT JOIN OBJAVLENIE OBJ'
      #9'ON (OBJ.PD_ID = CPD.PD_ID)'
      ''
      #9'LEFT JOIN RUBRIKA RB_O'
      #9'ON (OBJ.RB_ID=RB_O.RB_ID)'
      ''
      #9'LEFT JOIN FORMAT FM_O'
      #9'ON (OBJ.FM_ID=FM_O.FM_ID)'
      ''
      #9'LEFT JOIN RUBRIKA RB_OD'
      #9'ON (OBJ.DOUBLE_RB_ID=RB_OD.RB_ID)'
      'WHERE'
      #9'OBJ.OBJAV_ID is not null')
    SQLConnection = data.connection
    Left = 88
    Top = 128
    object qrySdelkaObjavFM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldName = 'FM_NAME'
      Size = 128
    end
    object qrySdelkaObjavRB_NAME_SHORT: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object qrySdelkaObjavDRB_RB_NAME: TStringField
      DisplayLabel = #1050#1086#1087#1080#1103' '#1074' '#1088#1091#1073#1088#1080#1082#1091
      FieldName = 'DRB_RB_NAME'
      Size = 64
    end
    object qrySdelkaObjavOB_TEXT: TStringField
      DisplayLabel = #1058#1077#1082#1089#1090
      FieldName = 'OB_TEXT'
      OnGetText = qrySdelkaObjavOB_TEXTGetText
      Size = 2047
    end
    object qrySdelkaObjavOB_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'OB_COMMENT'
      Size = 127
    end
  end
  object qryObjavByRubrika: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'IS_ID'
        ParamType = ptInput
        Value = '-1'
      end
      item
        DataType = ftString
        Name = 'RB_ID'
        ParamType = ptInput
        Value = '-1'
      end
      item
        DataType = ftInteger
        Name = 'ONLY_CHANGED'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftTimeStamp
        Name = 'CHANGED_AFTER'
        ParamType = ptInput
        Value = '01.01.01'
      end>
    SQL.Strings = (
      'SELECT'
      '    --OLN.AG_ID||'#39'-'#39'||OLN.SD_ID AS SD_ID_COMPOUND,'
      '                S.sd_num AS SD_ID_COMPOUND,'
      #9'OS.OS_NAME,'
      #9'OBJ.OB_TEXT,'
      '    OB.OB_COMMENT'
      'FROM'
      '    OBJAV_LIST_V_NOMER(:IS_ID) OLN'
      ''
      
        '    LEFT JOIN sdelka s ON(s.AG_ID = oln.ag_id AND s.SD_ID = oln.' +
        'sd_id)'
      ''
      '    LEFT JOIN OBJAV OB'
      
        '    ON (OB.AG_ID=OLN.AG_ID AND OB.SD_ID=OLN.SD_ID AND OB.OB_ID=O' +
        'LN.OB_ID)'
      ''
      '    LEFT JOIN OBJAV_STATE OS'
      '    ON (OS.OS_ID=OLN.OB_STATE)'
      ''
      '    LEFT JOIN GET_OBJAV_TEXT(OLN.AG_ID,OLN.SD_ID,OLN.OB_ID) OBJ'
      '    ON (OLN.SD_ID=OLN.SD_ID)'
      'WHERE'
      '  OLN.RB_ID=:RB_ID AND'
      '  (0=:ONLY_CHANGED OR OB.OB_CHANGED>=:CHANGED_AFTER) '
      'ORDER BY'
      '  OB.OB_ORDER DESC, OBJ.OB_TEXT')
    SQLConnection = data.connection
    Left = 524
    Top = 32
    object qryObjavByRubrikaSD_ID_COMPOUND: TStringField
      DisplayLabel = #1050#1086#1076' '#1089#1076#1077#1083#1082#1080
      FieldName = 'SD_ID_COMPOUND'
      Size = 23
    end
    object qryObjavByRubrikaOS_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'OS_NAME'
      Size = 64
    end
    object qryObjavByRubrikaOB_TEXT: TStringField
      DisplayLabel = #1058#1077#1082#1089#1090' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1103
      FieldName = 'OB_TEXT'
      Size = 2047
    end
    object qryObjavByRubrikaOB_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'OB_COMMENT'
      Size = 127
    end
  end
  object qryCustByDate: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'US_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'DATE_FROM'
        ParamType = ptInput
        Value = '01.01.01'
      end
      item
        DataType = ftString
        Name = 'DATE_TO'
        ParamType = ptInput
        Value = '01.01.01'
      end>
    SQL.Strings = (
      'SELECT'
      '    AG.AG_NAME,'
      '    CBD.CUST_NEW,'
      '    CBD.CUST_OLD,'
      '    CBD.CUST_NEW_SDELKA_COUNT,'
      '    CBD.CUST_NEW_SDELKA_SUM,'
      '    CBD.CUST_OLD_SDELKA_COUNT,'
      '    CBD.CUST_OLD_SDELKA_SUM'
      'FROM'
      '    CUST_BY_DATE (:US_ID,:DATE_FROM,:DATE_TO) CBD'
      ''
      '    LEFT JOIN AGENT AG'
      '    ON (AG.AG_ID=CBD.AG_ID)'
      
        'where exists(SELECT 1 FROM agent a WHERE a.ag_id = ag.ag_id AND ' +
        'a.ag_is_active = 1)')
    SQLConnection = data.connection
    Left = 56
    Top = 416
    object qryCustByDateAG_NAME: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_NAME'
      Size = 128
    end
    object qryCustByDateCUST_NEW: TIntegerField
      DisplayLabel = #1053#1086#1074#1099#1093' '#1082#1083#1080#1077#1085#1090#1086#1074
      FieldName = 'CUST_NEW'
    end
    object qryCustByDateCUST_OLD: TIntegerField
      DisplayLabel = #1057#1090#1072#1088#1099#1093' '#1082#1083#1080#1077#1085#1090#1086#1074
      FieldName = 'CUST_OLD'
    end
    object qryCustByDateCUST_NEW_SDELKA_COUNT: TIntegerField
      DisplayLabel = #1057#1076#1077#1083#1086#1082' '#1089' '#1085#1086#1074#1099#1084#1080' '#1082#1083#1080#1077#1085#1090#1072#1084#1080
      FieldName = 'CUST_NEW_SDELKA_COUNT'
    end
    object qryCustByDateCUST_NEW_SDELKA_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1086' '#1085#1086#1074#1099#1084
      FieldName = 'CUST_NEW_SDELKA_SUM'
      DisplayFormat = '0.00'
    end
    object qryCustByDateCUST_OLD_SDELKA_COUNT: TIntegerField
      DisplayLabel = #1057#1076#1077#1083#1086#1082' '#1089#1086' '#1089#1090#1072#1088#1099#1084#1080' '#1082#1083#1080#1077#1085#1090#1072#1084#1080
      FieldName = 'CUST_OLD_SDELKA_COUNT'
    end
    object qryCustByDateCUST_OLD_SDELKA_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1086' '#1089#1090#1072#1088#1099#1084
      FieldName = 'CUST_OLD_SDELKA_SUM'
      DisplayFormat = '0.00'
    end
  end
  object qryRubrikaItog: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Size = 4
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'DATE_FROM'
        ParamType = ptInput
        Value = '01.01.01'
      end
      item
        DataType = ftString
        Name = 'DATE_TO'
        ParamType = ptInput
        Value = '01.01.01'
      end>
    SQL.Strings = (
      'SELECT'
      '    RB.RB_NAME,'
      '    COUNT(DISTINCT SDR.CU_ID) AS CUST_COUNT'
      'FROM'
      '    SDELKA_REAL SDR, OBJAV OB'
      '    LEFT JOIN RUBRIKA RB'
      '    ON (OB.RB_ID=RB.RB_ID)'
      'WHERE'
      '    SDR.AG_ID=:AG_ID AND'
      '    SDR.AG_ID=OB.AG_ID AND SDR.SD_ID=OB.SD_ID AND'
      '    SDR.SD_APPROVED_DATE>=:DATE_FROM AND'
      '    SDR.SD_APPROVED_DATE<=:DATE_TO AND'
      '    OB.OB_ID IS NOT NULL'
      'GROUP BY'
      '    RB.RB_NAME'
      'ORDER BY'
      '    RB.RB_NAME')
    SQLConnection = data.connection
    Left = 56
    Top = 464
    object qryRubrikaItogRB_NAME: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME'
      Size = 128
    end
    object qryRubrikaItogCUST_COUNT: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1082#1083#1080#1077#1085#1090#1086#1074
      FieldName = 'CUST_COUNT'
      Required = True
    end
  end
  object qryAllCust: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'AG_ID'
        ParamType = ptInput
        Value = '0'
      end>
    SQL.Strings = (
      'SELECT'
      '    CU.CU_ID_COMPOUND,'
      '    CU.CU_NAME,'
      '    CAST(TRIM(CU.CU_OKPO) AS VARCHAR(16)) AS CU_OKPO,'
      '    CUP.CU_PHONES'
      'FROM'
      '    CUST CU'
      '    LEFT JOIN GET_CUST_PHONES(CU.AG_ID,CU.CU_ID) CUP'
      '    ON (CU.AG_ID=CU.AG_ID)'
      'WHERE'
      '    CU.AG_ID=:AG_ID'
      'ORDER BY'
      '    CU.CU_NAME')
    SQLConnection = data.connection
    Left = 352
    Top = 400
    object qryAllCustCU_ID_COMPOUND: TStringField
      DisplayLabel = #8470' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'CU_ID_COMPOUND'
      Size = 23
    end
    object qryAllCustCU_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qryAllCustCU_OKPO: TStringField
      DisplayLabel = #1028#1044#1056#1055#1054#1059
      FieldName = 'CU_OKPO'
      Size = 16
    end
    object qryAllCustCU_PHONES: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085#1099
      FieldName = 'CU_PHONES'
      Size = 1024
    end
  end
  object qryOtkaznikExit: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'AG_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'LAST_ISSUE_PR'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'LAST_ISSUE_NS'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftUnknown
        Name = 'LAST_ISSUE_SR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LAST_ISSUE_RZ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LAST_ISSUE_RK'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT'
      '    PH_NUMBER'
      'FROM'
      '    REP_PHONES_EXIT_FROM_OTKAZNIK('
      '      :AG_ID'
      '      ,:LAST_ISSUE_PR'
      '      ,:LAST_ISSUE_NS'
      '      ,:LAST_ISSUE_SR'
      '      ,:LAST_ISSUE_RZ'
      '      ,:LAST_ISSUE_RK'
      '    )'
      'ORDER BY'
      '    PH_NUMBER')
    SQLConnection = data.connection
    Left = 352
    Top = 328
    object qryOtkaznikExitPH_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
      FieldName = 'PH_NUMBER'
      FixedChar = True
      Size = 16
    end
  end
  object qryAttentionObjavs: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'IS_ID'
        ParamType = ptInput
        Value = -1
      end
      item
        DataType = ftInteger
        Name = 'GZ_ID'
        ParamType = ptInput
        Value = -1
      end>
    SQL.Strings = (
      'select'
      '      1 as IS_TEXT'
      
        '    ,(select s.sd_num from sdelka s where s.ag_id = ob.ag_id and' +
        ' s.sd_id = ob.sd_id) as sd_num'
      
        '    , cast (ob.AG_ID || '#39'-'#39' || ob.SD_ID as varchar(100)) as SD_I' +
        'D_COMPOUND'
      '    , ob.SD_ID'
      '    , ag.AG_NAME'
      '    , rb.RB_NAME'
      '    , sp.PODACHA_NUMS'
      '    , fm.FM_NAME'
      '    , cast (o.OB_COMMENT as varchar(255)) as OBJAV_COMMENT'
      'from'
      '    OBJAV_LIST_V_NOMER_ALL(:IS_ID) ob'
      ''
      '    left join OBJAV o'
      
        '    on (o.AG_ID = ob.AG_ID and o.SD_ID = ob.SD_ID and o.OB_ID = ' +
        'ob.OB_ID)'
      ''
      '    left join AGENT ag'
      '    on (ag.AG_ID = ob.AG_ID)'
      ''
      '    left join RUBRIKA rb'
      '    on (rb.RB_ID = ob.RB_ID)'
      ''
      '    left join SDELKA_PODACHA_NUMS(ob.AG_ID, ob.SD_ID) sp'
      '    on (1 = 1)'
      ''
      '    left join FORMAT fm'
      '    on (fm.FM_ID = o.FM_ID)'
      'where'
      '    o.OB_HAS_ATTENTION = 1'
      ''
      'union'
      ''
      'select'
      '      0 as IS_TEXT'
      
        '    ,(select s.sd_num from sdelka s where s.ag_id = mn.ag_id and' +
        ' s.sd_id = mn.sd_id) as sd_num'
      
        '    , cast (mn.AG_ID || '#39'-'#39' || mn.SD_ID as varchar(100)) as SD_I' +
        'D_COMPOUND'
      '    , mn.SD_ID'
      '    , ag.AG_NAME'
      '    , rb.RB_NAME'
      '    , sp.PODACHA_NUMS'
      '    , fm.FM_NAME'
      '    , cast (ob.OBJAV_COMMENT as varchar(255)) as OBJAV_COMMENT'
      'from'
      '    MODULI_V_NOMER(:GZ_ID) mn'
      ''
      '    left join OBJAVLENIE ob'
      '    on (ob.OBJAV_ID = mn.OB_ID)'
      ''
      '    left join AGENT ag'
      '    on (ag.AG_ID = mn.AG_ID)'
      ''
      '    left join RUBRIKA rb'
      '    on (rb.RB_ID = mn.RB_ID)'
      ''
      '    left join SDELKA_PODACHA_NUMS(mn.AG_ID, mn.SD_ID) sp'
      '    on (1 = 1)'
      ''
      '    left join FORMAT fm'
      '    on (fm.FM_ID = mn.FM_ID)'
      'where'
      '    mn.OBJAV_HAS_ATTENTION = 1'
      ''
      'order by'
      '    5, 1, 3')
    SQLConnection = data.connection
    Left = 56
    Top = 512
    object qryAttentionObjavsSD_NUM: TStringField
      DisplayLabel = #1057#1076#1077#1083#1082#1072
      FieldName = 'SD_NUM'
      Size = 64
    end
    object qryAttentionObjavsSD_ID_COMPOUND: TStringField
      DisplayLabel = #1057#1076#1077#1083#1082#1072
      FieldName = 'SD_ID_COMPOUND'
      Visible = False
      Size = 23
    end
    object qryAttentionObjavsAG_NAME: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_NAME'
      Size = 128
    end
    object qryAttentionObjavsRB_NAME: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME'
      Size = 128
    end
    object qryAttentionObjavsPODACHA_NUMS: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object qryAttentionObjavsFM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldName = 'FM_NAME'
      Size = 128
    end
    object qryAttentionObjavsOBJAV_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'OBJAV_COMMENT'
      Size = 255
    end
    object qryAttentionObjavsIS_TEXT: TIntegerField
      FieldName = 'IS_TEXT'
      Required = True
      Visible = False
    end
    object qryAttentionObjavsSD_ID: TIntegerField
      FieldName = 'SD_ID'
      Visible = False
    end
  end
  object qryVIP: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftTimeStamp
        Name = 'DATE_FROM'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftTimeStamp
        Name = 'DATE_TO'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftInteger
        Name = 'ag_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '      rp.AG_ID'
      '    , rp.CU_ID'
      '    , cu.CU_NAME'
      '    , rp.KA_COUNT'
      '    , rp.KA_SUM'
      '    , rp.INET_COUNT'
      '    , rp.INET_SUM'
      '    , rp.TOTAL_COUNT'
      '    , rp.TOTAL_SUM'
      ''
      'from'
      '    REP_CUST_VIP(:AG_ID, :DATE_FROM, :DATE_TO) rp'
      '    '
      '    left join CUST cu'
      #9'on (cu.AG_ID = rp.AG_ID and cu.CU_ID = rp.CU_ID)'
      ''
      
        'where exists(SELECT 1 FROM agent a WHERE a.ag_id = :ag_id AND a.' +
        'ag_is_active = 1)')
    SQLConnection = data.connection
    Left = 192
    Top = 416
    object qryVIPAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Visible = False
    end
    object qryVIPCU_ID: TIntegerField
      FieldName = 'CU_ID'
      Visible = False
    end
    object qryVIPCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qryVIPKA_COUNT: TIntegerField
      DisplayLabel = #1057#1076#1077#1083#1086#1082' '#1074' '#1050#1040
      FieldName = 'KA_COUNT'
    end
    object qryVIPKA_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1074' '#1050#1040
      FieldName = 'KA_SUM'
      DisplayFormat = '0.00'
    end
    object qryVIPINET_COUNT: TIntegerField
      DisplayLabel = #1057#1076#1077#1083#1086#1082' '#1074' '#1080#1085#1090#1077#1088#1085#1077#1090
      FieldName = 'INET_COUNT'
    end
    object qryVIPINET_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1074' '#1080#1085#1090#1077#1088#1085#1077#1090
      FieldName = 'INET_SUM'
      DisplayFormat = '0.00'
    end
    object qryVIPTOTAL_COUNT: TIntegerField
      DisplayLabel = #1042#1089#1077#1075#1086' '#1089#1076#1077#1083#1086#1082
      FieldName = 'TOTAL_COUNT'
    end
    object qryVIPTOTAL_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1074#1089#1077#1075#1086
      FieldName = 'TOTAL_SUM'
      DisplayFormat = '0.00'
    end
  end
  object qryVIPModules: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      #9'm.*,'
      #9'c.CONTENT_PICTURE'
      '                c.EXTENSION'
      ''
      'from'
      #9'MODULI_V_NOMER(1) m'
      ''
      #9'left join OBJAV_CONTENT c'
      #9'on (c.CONTENT_ID = m.CONTENT_ID)'
      ''
      'where'
      #9'm.FM_ID = 15'
      #9'and m.CONTENT_ID is not null')
    SQLConnection = data.connection
    Left = 352
    Top = 464
    object qryVIPModulesAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object qryVIPModulesSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object qryVIPModulesOB_ID: TIntegerField
      FieldName = 'OB_ID'
    end
    object qryVIPModulesRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object qryVIPModulesFM_ID: TIntegerField
      FieldName = 'FM_ID'
    end
    object qryVIPModulesOBJAV_HAS_ATTENTION: TSmallintField
      FieldName = 'OBJAV_HAS_ATTENTION'
    end
    object qryVIPModulesCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
    end
    object qryVIPModulesCONTENT_PICTURE: TBlobField
      FieldName = 'CONTENT_PICTURE'
      Size = 1
    end
    object qryVIPModulesEXTENSION: TStringField
      FieldName = 'EXTENSION'
      Size = 5
    end
  end
  object qryObjavCountModule: TSQLQuery
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
      #9'  r.RB_NAME'
      #9', sum(f.FM_SPACE) as RUB_SPACE'
      'from'
      #9'MODULI_V_NOMER(:IS_ID) ol'
      #9
      #9'left join RUBRIKA r on (r.RB_ID = ol.RB_ID)'
      #9
      #9'left join FORMAT f on (f.FM_ID = ol.FM_ID)'
      'group by'
      #9'r.RB_NAME'
      'order by'
      #9'r.RB_NAME')
    SQLConnection = data.connection
    Left = 576
    Top = 168
    object qryObjavCountModuleRB_NAME: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME'
      Size = 128
    end
    object qryObjavCountModuleRUB_SPACE: TFloatField
      DisplayLabel = #1055#1083#1086#1097#1072#1076#1100
      FieldName = 'RUB_SPACE'
    end
  end
  object qryObjavCountText: TSQLQuery
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
      #9'rb.RB_NAME,'
      #9'count(*) as RUB_COUNT'
      'from'
      #9'OBJAV_LIST_V_NOMER_ALL(:IS_ID) ol'
      ''
      #9'left join OBJAV ob'
      
        #9'on (ol.AG_ID = ob.AG_ID and ol.SD_ID = ob.SD_ID and ol.OB_ID = ' +
        'ob.OB_ID)'
      ''
      #9'left join RUBRIKA rb'
      '    on (ol.RB_ID = rb.RB_ID)'
      '--where'
      '--'#9'ob.FM_ID in (1, 17)'
      'group by'
      #9'rb.RB_NAME'
      'order by'
      #9'rb.RB_NAME')
    SQLConnection = data.connection
    Left = 576
    Top = 232
    object qryObjavCountTextRB_NAME: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME'
      Size = 128
    end
    object qryObjavCountTextRUB_COUNT: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1089#1090#1088#1086#1095#1085#1099#1093
      FieldName = 'RUB_COUNT'
      Required = True
    end
  end
  object qrySdelkaByOffice: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'OFFICE_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'RQ_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'PT_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDate
        Name = 'DATE_FROM'
        ParamType = ptInput
        Value = 36892d
      end
      item
        DataType = ftDate
        Name = 'DATE_TO'
        ParamType = ptInput
        Value = 36892d
      end>
    SQL.Strings = (
      'select r.*'
      
        'from REP_SDELKA_BY_OFFICE(:OFFICE_ID, :RQ_ID, :PT_ID, :DATE_FROM' +
        ', :DATE_TO) r')
    SQLConnection = data.connection
    Left = 640
    Top = 512
    object qrySdelkaByOfficeSD_ID_COMPOUND: TStringField
      DisplayLabel = #1057#1076#1077#1083#1082#1072
      FieldName = 'SD_ID_COMPOUND'
      Size = 200
    end
    object qrySdelkaByOfficeSD_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'SD_DATE'
    end
    object qrySdelkaByOfficeSD_FACT_NUM: TIntegerField
      DisplayLabel = #1057#1095#1105#1090
      FieldName = 'SD_FACT_NUM'
    end
    object qrySdelkaByOfficeAG_NAME: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_NAME'
      Size = 200
    end
    object qrySdelkaByOfficeCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 200
    end
    object qrySdelkaByOfficeCU_PHONES: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085#1099
      FieldName = 'CU_PHONES'
      Size = 200
    end
    object qrySdelkaByOfficeSD_TYPE_DESC: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'SD_TYPE_DESC'
      Size = 200
    end
    object qrySdelkaByOfficeFM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldName = 'FM_NAME'
      Size = 200
    end
    object qrySdelkaByOfficePODACHA_NUMS: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 200
    end
    object qrySdelkaByOfficeSD_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SD_SUM'
      DisplayFormat = '0.00'
    end
    object qrySdelkaByOfficeUS_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldName = 'US_NAME'
      Size = 200
    end
    object qrySdelkaByOfficeRQ_NAME: TStringField
      FieldName = 'RQ_NAME'
      Visible = False
      Size = 32
    end
    object qrySdelkaByOfficeGZ_ID: TIntegerField
      FieldName = 'GZ_ID'
      Visible = False
    end
  end
  object qryModuliByDesigner: TSQLQuery
    MaxBlobSize = -1
    Params = <
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
      'select'
      '*'
      'from'
      '    REP_MODULI_BY_DESIGNER(:DATE_FROM, :DATE_TO)')
    SQLConnection = data.connection
    Left = 56
    Top = 568
    object qryModuliByDesignerUS_ID: TIntegerField
      FieldName = 'US_ID'
      Visible = False
    end
    object qryModuliByDesignerUS_NAME: TStringField
      DisplayLabel = #1044#1080#1079#1072#1081#1085#1077#1088
      FieldName = 'US_NAME'
      Size = 200
    end
    object qryModuliByDesignerCONTENT_COUNT: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1075#1088#1091#1078#1077#1085#1085#1099#1093' '#1084#1086#1076#1091#1083#1077#1081
      FieldName = 'CONTENT_COUNT'
    end
  end
  object qryAssistants: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftTimeStamp
        Name = 'DATE_FROM'
        ParamType = ptInput
        Value = '01.01.01'
      end
      item
        DataType = ftTimeStamp
        Name = 'DATE_TO'
        ParamType = ptInput
        Value = '01.01.01'
      end>
    SQL.Strings = (
      'select'
      '*'
      'from'
      '    REP_ASSISTANTS(:DATE_FROM, :DATE_TO)')
    SQLConnection = data.connection
    Left = 640
    Top = 560
    object qryAssistantsUS_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldName = 'US_NAME'
      Size = 128
    end
    object qryAssistantsSDELKA_COUNT: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1076#1077#1083#1086#1082
      FieldName = 'SDELKA_COUNT'
    end
  end
  object qryNotApprovedCover: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'GZ_ID'
        ParamType = ptInput
        Value = -1
      end
      item
        DataType = ftInteger
        Name = 'gz_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select'
      '    sd.sd_num'
      '   ,sd.SD_ID_COMPOUND'
      '  , gz.GZ_NAME_SHORT'
      '  , rb.RB_NAME_SHORT'
      '  , fm.FM_NAME'
      '  , cu.CU_NAME'
      '  , pn.PODACHA_NUMS'
      'from'
      '  SDELKA sd'
      ''
      '  left join GET_MAX_FORMAT_AND_RUBRIKA(sd.AG_ID, sd.SD_ID) mfr'
      '  on (1 = 1)'
      ''
      '  left join RUBRIKA rb'
      '  on (rb.RB_ID = mfr.RB_ID)'
      ''
      '  left join SDELKA_PODACHA_NUMS(sd.AG_ID, sd.SD_ID) pn'
      '  on (1 = 1)'
      ''
      '  inner join GET_IS_SDELKA_CURRENT_ISSUE(sd.AG_ID, sd.SD_ID) ci'
      '  on (ci.IS_CURRENT_ISSUE = 1)'
      ''
      '  left join GAZETA gz'
      '  on (gz.GZ_ID = sd.GZ_ID)'
      ''
      '  left join CUST cu'
      '  on (cu.AG_ID = sd.AG_ID and cu.CU_ID = sd.CU_ID)'
      ''
      '  left join FORMAT fm'
      '  on (fm.FM_ID = mfr.FM_ID)'
      'where'
      '   rb.RB_IS_OBLOGKA = 1'
      '  and sd.GZ_ID = :GZ_ID'
      '  and (sd.SD_STATE < 4 or sd.AS_ID = 1)'
      'union'
      'select'
      
        '     (select s1.SD_NUM from sdelka s1 where s1.AG_ID = s.AG_ID a' +
        'nd s1.SD_ID = s.SD_IS_CHANGED_COPY_OF_SD_ID) as SD_NUM,'
      '     s.SD_ID_COMPOUND,'
      '     gz.GZ_NAME_SHORT,'
      '     r.RB_NAME_SHORT,'
      '     fm.FM_NAME,'
      '     cu.CU_NAME,'
      '     pn.PODACHA_NUMS'
      'from sdelka s'
      
        '  left join GET_MAX_FORMAT_AND_RUBRIKA(s.AG_ID, s.SD_ID) fr  on ' +
        '(1 = 1)'
      '  left join RUBRIKA r on (r.RB_ID = fr.RB_ID)'
      '  left join SDELKA_PODACHA_NUMS(s.AG_ID, s.SD_ID) pn on (1 = 1)'
      
        '  inner join GET_IS_SDELKA_CURRENT_ISSUE(s.AG_ID, s.SD_ID) ci on' +
        ' (ci.IS_CURRENT_ISSUE = 1)'
      '  left join GAZETA gz on (gz.GZ_ID = s.GZ_ID)'
      
        '  left join CUST cu on (cu.AG_ID = s.AG_ID and cu.CU_ID = s.CU_I' +
        'D)'
      '  left join FORMAT fm on (fm.FM_ID = fr.FM_ID)'
      ''
      'where s.AS_ID = 2 and'
      '            s.GZ_ID = :gz_id and'
      '           r.RB_IS_OBLOGKA = 1')
    SQLConnection = data.connection
    Left = 184
    Top = 568
    object qryNotApprovedCoverSD_NUM: TStringField
      DisplayLabel = #1057#1076#1077#1083#1082#1072
      FieldName = 'SD_NUM'
      Size = 64
    end
    object qryNotApprovedCoverSD_ID_COMPOUND: TStringField
      DisplayLabel = #1057#1076#1077#1083#1082#1072
      FieldName = 'SD_ID_COMPOUND'
      Visible = False
      Size = 23
    end
    object qryNotApprovedCoverGZ_NAME_SHORT: TStringField
      DisplayLabel = #1043#1072#1079#1077#1090#1072
      FieldName = 'GZ_NAME_SHORT'
      Size = 64
    end
    object qryNotApprovedCoverRB_NAME_SHORT: TStringField
      DisplayLabel = #1056#1091#1073'.'
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object qryNotApprovedCoverFM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldName = 'FM_NAME'
      Size = 128
    end
    object qryNotApprovedCoverCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qryNotApprovedCoverPODACHA_NUMS: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
  end
  object qryNalBarter: TSQLQuery
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
      end>
    SQL.Strings = (
      'SELECT s.SD_NUM,'
      
        '       a.ag_name, g.gz_name_short, pt.pt_name, c.cu_name, c.cu_i' +
        'd_compound, s.sd_fact_num, s.sd_fact_date,'
      '       s.sd_sum, s.sd_sum_payed, s.sd_comment, spn.PODACHA_NUMS'
      ''
      'FROM agent a'
      'LEFT JOIN sdelka s ON (s.ag_id = a.ag_id)'
      'LEFT JOIN gazeta g ON (g.gz_id = s.gz_id)'
      'LEFT JOIN pay_type pt ON (pt.pt_id = s.pt_id)'
      'LEFT JOIN cust c ON (c.cu_id = s.cu_id)'
      'LEFT JOIN SDELKA_PODACHA_NUMS(s.ag_id, s.sd_id) spn ON (1=1)'
      
        'WHERE s.pt_id IN (1,4,5) AND s.sd_all_payed = 1 AND s.sd_date BE' +
        'TWEEN :ds AND :de AND'
      
        '      EXISTS(SELECT 1 FROM agent a1 WHERE a1.ag_id = a.ag_id AND' +
        ' a1.ag_is_active = 1)')
    SQLConnection = data.connection
    Left = 448
    Top = 344
    object qryNalBarterSD_NUM: TStringField
      DisplayLabel = #8470' '#1057#1076#1077#1083#1082#1080
      FieldName = 'SD_NUM'
      Size = 64
    end
    object qryNalBarterGZ_NAME_SHORT: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'GZ_NAME_SHORT'
      Size = 64
    end
    object qryNalBarterPT_NAME: TStringField
      DisplayLabel = #1054#1087#1083#1072#1090#1072
      FieldName = 'PT_NAME'
      Size = 64
    end
    object qryNalBarterCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qryNalBarterCU_ID_COMPUND: TStringField
      DisplayLabel = #8470' '#1050#1083#1080#1077#1085#1090#1072
      FieldName = 'CU_ID_COMPOUND'
      Size = 23
    end
    object qryNalBarterSD_FACT_NUM: TIntegerField
      DisplayLabel = #8470' '#1057#1095#1077#1090#1072
      FieldName = 'SD_FACT_NUM'
    end
    object qryNalBarterSD_FACT_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1095#1077#1090#1072
      FieldName = 'SD_FACT_DATE'
    end
    object qryNalBarterSD_SUM: TFloatField
      DisplayLabel = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      FieldName = 'SD_SUM'
    end
    object qryNalBarterSD_SUM_PAYED: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'SD_SUM_PAYED'
    end
    object qryNalBarterSD_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'SD_COMMENT'
      Size = 1024
    end
    object qryNalBarterPODACHA_NUMS: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object qryNalBarterAG_NAME: TStringField
      Tag = 13
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_NAME'
      Size = 128
    end
  end
  object qrySdelkaCountSummary: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'DATE_FROM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATE_TO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'US_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REP_MODE'
        ParamType = ptInput
        Value = '0'
      end>
    SQL.Strings = (
      'select'
      '      ag.AG_NAME'
      '    , scs.*'
      
        '    , NAL_SUM + BEZNAL_SUM + BEZNAL_V_NAL_SUM + KREDIT_SUM + KAS' +
        'A_SUM as SUM_PRINES'
      
        '    , NAL_SUM + PAYED_BEZNAL + PAYED_BEZNAL_V_NAL + PAYED_KASA +' +
        ' PAYED_CREDIT as SUM_PAYED'
      'from'
      
        '    SDELKA_COUNT_SUMMARY(:DATE_FROM, :DATE_TO, :US_ID, :REP_MODE' +
        ') scs'
      ''
      '    left join AGENT ag'
      '    on (scs.AG_ID = ag.AG_ID)'
      
        'where  ((scs.SD_COUNT > 0) or (PAYED_CREDIT > 0) or (NAL_SUM > 0' +
        ') or (BEZNAL_SUM > 0) or (KREDIT_SUM > 0) or (KASA_SUM > 0) or (' +
        'KA_SUM > 0)'
      
        '        or (INET_SUM > 0) or (OTHER_CITY_SUM > 0) or (PAYED_BEZN' +
        'AL > 0) or (PAYED_OTHER_CITY_SUM > 0) or (PAYED_BEZNAL_V_NAL > 0' +
        ') or (PAYED_KASA > 0) or (BEZNAL_V_NAL_SUM > 0))'
      'order by'
      '    scs.SD_COUNT desc')
    SQLConnection = data.connection
    Left = 56
    Top = 232
    object qrySdelkaCountSummaryAG_NAME: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_NAME'
      Size = 128
    end
    object qrySdelkaCountSummaryAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Visible = False
    end
    object qrySdelkaCountSummarySD_COUNT: TIntegerField
      DisplayLabel = #1057#1076'-'#1086#1082
      FieldName = 'SD_COUNT'
    end
    object qrySdelkaCountSummaryNEW_CUST_COUNT: TIntegerField
      DisplayLabel = #1053#1086#1074#1099#1093
      FieldName = 'NEW_CUST_COUNT'
    end
    object qrySdelkaCountSummaryNAL_SUM: TFloatField
      DisplayLabel = #1057#1090'-'#1090#1100' ('#1085'.)'
      FieldName = 'NAL_SUM'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummaryBEZNAL_SUM: TFloatField
      DisplayLabel = #1057#1090'-'#1090#1100' ('#1073'/'#1085')'
      FieldName = 'BEZNAL_SUM'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummaryKREDIT_SUM: TFloatField
      DisplayLabel = #1057#1090'-'#1090#1100' ('#1082#1088#1077#1076'.)'
      FieldName = 'KREDIT_SUM'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummaryBEZNAL_V_NAL_SUM: TFloatField
      DisplayLabel = #1057#1090'-'#1090#1100' ('#1073'/'#1085' -> '#1085')'
      FieldName = 'BEZNAL_V_NAL_SUM'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummaryKASA_SUM: TFloatField
      DisplayLabel = #1057#1090'-'#1090#1100' ('#1082#1072#1089#1089#1072')'
      FieldName = 'KASA_SUM'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummaryPAYED_BEZNAL: TFloatField
      DisplayLabel = #1054#1087#1083'. '#1073'-'#1085#1072#1083
      FieldName = 'PAYED_BEZNAL'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummaryPAYED_CREDIT: TFloatField
      DisplayLabel = #1054#1087#1083'. '#1082#1088#1077#1076'.'
      FieldName = 'PAYED_CREDIT'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummaryPAYED_BEZNAL_V_NAL: TFloatField
      DisplayLabel = #1054#1087#1083'. '#1073'/'#1085' -> '#1085'.'
      FieldName = 'PAYED_BEZNAL_V_NAL'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummaryPAYED_KASA: TFloatField
      DisplayLabel = #1054#1087#1083'. '#1082#1072#1089#1089#1072
      FieldName = 'PAYED_KASA'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummaryKA_COUNT: TIntegerField
      DisplayLabel = #1057'-'#1082' '#1074' '#1050#1040
      FieldName = 'KA_COUNT'
      Visible = False
    end
    object qrySdelkaCountSummaryKA_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1074' '#1050#1040
      FieldName = 'KA_SUM'
      Visible = False
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummaryINET_COUNT: TIntegerField
      DisplayLabel = #1057'-'#1082' '#1074' '#1080#1085#1090'.'
      FieldName = 'INET_COUNT'
    end
    object qrySdelkaCountSummaryINET_SUM: TFloatField
      DisplayLabel = #1057#1091#1084'. '#1074' '#1080#1085#1090'.'
      FieldName = 'INET_SUM'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummaryINET_PAYED_SUM: TFloatField
      DisplayLabel = #1054#1087#1083'. '#1080#1085#1090'.'
      FieldName = 'INET_PAYED_SUM'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummaryREG_COUNT: TIntegerField
      DisplayLabel = #1057'-'#1082'.'#1074' '#1088#1077#1075'.'
      FieldName = 'REG_COUNT'
    end
    object qrySdelkaCountSummaryREG_SUM: TFloatField
      DisplayLabel = #1057#1091#1084'. '#1088#1077#1075'.'
      FieldName = 'REG_SUM'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummaryREG_PAYED_SUM: TFloatField
      DisplayLabel = #1054#1087#1083'. '#1088#1077#1075'.'
      FieldName = 'REG_PAYED_SUM'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummaryOTHER_CITY_COUNT: TIntegerField
      DisplayLabel = #1057#1076#1077#1083#1086#1082' '#1074' '#1088#1077#1075#1080#1086#1085#1099
      FieldName = 'OTHER_CITY_COUNT'
      Visible = False
    end
    object qrySdelkaCountSummaryOTHER_CITY_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1074' '#1088#1077#1075#1080#1086#1085#1099
      FieldName = 'OTHER_CITY_SUM'
      Visible = False
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummarySUM_PRINES: TFloatField
      DisplayLabel = #1055#1088#1080#1085#1077#1089'. '#1089#1091#1084#1084#1072
      FieldName = 'SUM_PRINES'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummarySUM_PAYED: TFloatField
      DisplayLabel = #1054#1087#1083'. '#1089#1091#1084#1084#1072
      FieldName = 'SUM_PAYED'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummary_PAY_BALANS: TFloatField
      DisplayLabel = #1041#1072#1083#1072#1085#1089' '#1087#1088#1086#1087#1083#1072#1090
      FieldKind = fkCalculated
      FieldName = '_PAY_BALANS'
      OnGetText = qrySdelkaCountSummary_PAY_BALANSGetText
      DisplayFormat = '0.00'
      Calculated = True
    end
    object qrySdelkaCountSummaryAVG_VAC_COST: TFloatField
      DisplayLabel = #1057#1088'. '#1089#1090#1086#1080#1084'. '#1074#1072#1082'.'
      FieldName = 'AVG_VAC_COST'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummaryTTL_VAC_COUNT: TIntegerField
      FieldName = 'TTL_VAC_COUNT'
      Visible = False
    end
    object qrySdelkaCountSummaryTTL_OBJAV_COST: TFloatField
      FieldName = 'TTL_OBJAV_COST'
      Visible = False
    end
    object qrySdelkaCountSummaryPAYED_OTHER_CITY_COUNT: TIntegerField
      DisplayLabel = #1054#1087#1083#1072#1095'. '#1088#1077#1075#1080#1086#1085#1086#1074
      FieldName = 'PAYED_OTHER_CITY_COUNT'
      Visible = False
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummaryPAYED_OTHER_CITY_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1086#1087#1083'. '#1088#1077#1075#1080#1086#1085#1086#1074
      FieldName = 'PAYED_OTHER_CITY_SUM'
      Visible = False
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummaryAVG_SDELKA_COST: TFloatField
      DisplayLabel = #1057#1088'. '#1089#1090#1086#1080#1084'. '#1089'-'#1082#1080
      FieldName = 'AVG_SDELKA_COST'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummaryAVG_PODACHA_COST: TFloatField
      DisplayLabel = #1057#1088'. '#1089#1090#1086#1080#1084'. '#1087#1086#1076#1072#1095#1080
      FieldName = 'AVG_PODACHA_COST'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCountSummaryOBJAV_TEXT_COUNT: TIntegerField
      DisplayLabel = #1058#1077#1082#1089#1090'.'
      FieldName = 'OBJAV_TEXT_COUNT'
    end
    object qrySdelkaCountSummaryOBJAV_MODULE_COUNT: TIntegerField
      DisplayLabel = #1052#1086#1076'.'
      FieldName = 'OBJAV_MODULE_COUNT'
    end
    object qrySdelkaCountSummaryOBJAV_VIP_COUNT: TIntegerField
      DisplayLabel = #1042#1048#1055
      FieldName = 'OBJAV_VIP_COUNT'
    end
    object qrySdelkaCountSummaryBARTER_COUNT: TIntegerField
      DisplayLabel = #1041'-'#1088
      FieldName = 'BARTER_COUNT'
    end
  end
  object qrySdelkaCrossingMonth: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      '')
    SQLConnection = data.connection
    Left = 576
    Top = 304
    object qrySdelkaCrossingMonthAG_NAME: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_NAME'
      Size = 128
    end
    object qrySdelkaCrossingMonthCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qrySdelkaCrossingMonthCU_OKPO: TStringField
      DisplayLabel = #1045#1044#1056#1055#1054#1059
      FieldName = 'CU_OKPO'
      FixedChar = True
      Size = 10
    end
    object qrySdelkaCrossingMonthPT_NAME: TStringField
      DisplayLabel = #1054#1087#1083#1072#1090#1072
      FieldName = 'PT_NAME'
      Size = 64
    end
    object qrySdelkaCrossingMonthSD_FACT_NUM: TIntegerField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'SD_FACT_NUM'
    end
    object qrySdelkaCrossingMonthSD_FACT_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1095'.'
      FieldName = 'SD_FACT_DATE'
    end
    object qrySdelkaCrossingMonthGZ_NAME_SHORT: TStringField
      DisplayLabel = #1043#1072#1079'.'
      FieldName = 'GZ_NAME_SHORT'
      Size = 64
    end
    object qrySdelkaCrossingMonthPODACHA_NUMS_INSIDE: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080' '#1074' '#1087#1077#1088#1080#1086#1076#1077
      DisplayWidth = 255
      FieldName = 'PODACHA_NUMS_INSIDE'
      Size = 255
    end
    object qrySdelkaCrossingMonthSD_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1086#1073#1097#1072#1103
      FieldName = 'SD_SUM'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCrossingMonthSD_SUM_PAYED: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'SD_SUM_PAYED'
      DisplayFormat = '0.00'
    end
    object qrySdelkaCrossingMonthSD_SUM_PART: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1074' '#1087#1077#1088#1080#1086#1076#1077
      FieldName = 'SD_SUM_PART'
      DisplayFormat = '0.00'
    end
  end
end
