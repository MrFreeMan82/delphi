object frmPrint: TfrmPrint
  Left = 1112
  Top = 223
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1095#1105#1090#1072'-'#1092#1072#1082#1090#1091#1088#1099
  ClientHeight = 231
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 74
    Height = 14
    Caption = #1060#1086#1088#1084#1072' '#1089#1095#1105#1090#1072
  end
  object Label2: TLabel
    Left = 281
    Top = 10
    Width = 86
    Height = 14
    Caption = #1055#1088#1077#1076#1084#1077#1090' '#1089#1095#1105#1090#1072
  end
  object btOK: TButton
    Left = 392
    Top = 198
    Width = 91
    Height = 27
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 0
    OnClick = btOKClick
  end
  object lstInvoiceForm: TListBox
    Left = 8
    Top = 24
    Width = 265
    Height = 169
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 14
    Items.Strings = (
      #1056#1072#1093#1091#1085#1086#1082' "'#1055#1088#1086#1087#1086#1085#1091#1102' '#1088#1086#1073#1086#1090#1091'" ('#1055#1059#1052#1041')'
      #1056#1072#1093#1091#1085#1086#1082' "'#1055#1088#1086#1087#1086#1085#1091#1102' '#1088#1086#1073#1086#1090#1091'" ('#1041#1058#1040') '#1091#1089#1087'i'#1093
      #1056#1072#1093#1091#1085#1086#1082' "'#1055#1088#1086#1087#1086#1085#1091#1102' '#1088#1086#1073#1086#1090#1091'" ('#1041#1058#1040') '#1058#1054#1042
      #1056#1072#1093#1091#1085#1086#1082' "'#1055#1088#1086#1087#1086#1085#1091#1102' '#1088#1086#1073#1086#1090#1091'" ('#1055#1088#1080#1074#1072#1090')'
      #1056#1072#1093#1091#1085#1086#1082' "'#1057#1088#1086#1095#1085#1086' '#1090#1088#1077#1073#1091#1102#1090#1089#1103'" ('#1055#1059#1052#1041')'
      #1056#1072#1093#1091#1085#1086#1082' "'#1057#1088#1086#1095#1085#1086' '#1090#1088#1077#1073#1091#1102#1090#1089#1103'" ('#1041#1058#1040') '#1091#1089#1087'i'#1093
      #1056#1072#1093#1091#1085#1086#1082' "'#1057#1088#1086#1095#1085#1086' '#1090#1088#1077#1073#1091#1102#1090#1089#1103'" ('#1041#1058#1040') '#1058#1054#1042
      #1056#1072#1093#1091#1085#1086#1082' "'#1057#1088#1086#1095#1085#1086' '#1090#1088#1077#1073#1091#1102#1090#1089#1103'" ('#1055#1088#1080#1074#1072#1090')'
      #1056#1072#1093#1091#1085#1086#1082' "PA '#1059#1089#1087#1110#1093' '#1087#1083#1102#1089'" ('#1041#1058#1040') Internet'
      #1056#1072#1093#1091#1085#1086#1082' "'#1056#1086#1073#1086#1090#1072' '#1087#1083#1102#1089'" ('#1041#1058#1040') Internet')
    ParentFont = False
    TabOrder = 1
  end
  object chkList: TCheckListBox
    Left = 280
    Top = 24
    Width = 201
    Height = 169
    ItemHeight = 14
    Items.Strings = (
      #1055#1088#1086#1087#1086#1085#1091#1102' '#1056#1086#1073#1086#1090#1091
      #1057#1088#1086#1095#1085#1086' '#1090#1088#1077#1073#1091#1102#1090#1089#1103
      #1048#1085#1090#1077#1088#1085#1077#1090)
    TabOrder = 2
  end
  object qAcc: TSQLQuery
    OnCalcFields = qAccCalcFields
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
      'SELECT FIRST 1 DISTINCT'
      
        '        sd.sd_fact_date, sd.sd_fact_num, sd.sd_skidka, sd.sd_sum' +
        ','
      
        '       (SELECT pn.PODACHA_NUMS FROM sdelka_podacha_nums(sd.ag_id' +
        ', sd.sd_id) pn) AS PODACHA_NUMS,'
      '       f.fm_name, CAST(NULL AS VARCHAR(255)) AS SD_SUM_LITERAL,'
      '       a.ag_factura_phones, (sd.sd_sum / 6) AS SD_SUM_NDS,'
      '       CAST(NULL AS FLOAT) AS SD_SUM_PZR,'
      '       (sd.sd_sum -  (sd.sd_sum / 6)) AS SD_SUM_OUT_NDS,'
      '       sd.pt_id, sd.cu_id,'
      '      CAST(NULL AS VARCHAR(255)) AS PREDMET_RAHUNKU,'
      '      SD.SD_KA_START_DATE,'
      '      SD.SD_KA_END_DATE'
      'FROM'
      '    FIND_SDELKA_BY_NUMBER(:AG_ID,:SD_ID) FS'
      ''
      '    LEFT JOIN SDELKA SD'
      '    ON (FS.AG_ID=SD.AG_ID AND FS.SD_ID=SD.SD_ID)'
      ''
      '    LEFT JOIN agent a'
      '    ON (a.ag_id = sd.ag_id)'
      ''
      '    LEFT JOIN GET_MAX_FORMAT_AND_RUBRIKA(SD.AG_ID,SD.SD_ID) MFR'
      '    ON (SD.SD_ID=SD.SD_ID)'
      ''
      '    LEFT JOIN format f ON (f.fm_id = mfr.fm_id)')
    SQLConnection = data.connection
    Left = 416
    Top = 176
    object qAccSD_FACT_DATE: TSQLTimeStampField
      FieldName = 'SD_FACT_DATE'
    end
    object qAccSD_FACT_NUM: TIntegerField
      FieldName = 'SD_FACT_NUM'
    end
    object qAccSD_SKIDKA: TFloatField
      FieldName = 'SD_SKIDKA'
    end
    object qAccSD_SUM: TFloatField
      FieldName = 'SD_SUM'
      DisplayFormat = '0.00'
    end
    object qAccPODACHA_NUMS: TStringField
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object qAccSD_SUM_NDS: TFloatField
      FieldName = 'SD_SUM_NDS'
      DisplayFormat = '0.00'
    end
    object qAccSD_SUM_OUT_NDS: TFloatField
      FieldName = 'SD_SUM_OUT_NDS'
      DisplayFormat = '0.00'
    end
    object qAccFM_NAME: TStringField
      FieldName = 'FM_NAME'
      Size = 128
    end
    object qAccSD_SUM_LITERAL: TIBStringField
      FieldKind = fkCalculated
      FieldName = 'SD_SUM_LITERAL'
      Size = 255
      Calculated = True
    end
    object qAccPREDMET_RAHUNKU: TStringField
      FieldKind = fkCalculated
      FieldName = 'PREDMET_RAHUNKU'
      Size = 255
      Calculated = True
    end
    object qAccSD_PERIOD: TStringField
      FieldKind = fkCalculated
      FieldName = 'SD_PERIOD'
      Size = 128
      Calculated = True
    end
    object qAccSD_KA_START_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_START_DATE'
    end
    object qAccSD_KA_END_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_END_DATE'
    end
  end
  object qAccCust: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ag_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ag_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sd_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      
        'SELECT (SELECT a.ag_factura_name FROM agent a WHERE a.ag_id = s.' +
        'ag_id) AS AG_FACTURA_NAME,'
      '        cu.cuq_okpo,'
      
        '        CASE WHEN CHAR_LENGTH(cu.cuq_full_name) >= 125 THEN cu.C' +
        'UQ_NAME ELSE cu.cuq_full_name END AS cuq_full_name,'
      '        LEFT(cu.cuq_address, 100) as cuq_address,'
      '        LEFT(cu.cuq_address_real, 100) as cuq_address_real,'
      
        '        (SUBSTRING((SELECT cp.CU_PHONES FROM GET_CUST_PHONES(c.A' +
        'G_ID, c.CU_ID) cp) FROM 1 FOR 16)) AS cuq_phones,'
      '        cu.cuq_nds_num, cu.cuq_inn'
      'FROM sdelka s'
      'LEFT JOIN cust c ON (c.cu_id = s.cu_id)'
      'LEFT JOIN cust_unique cu on (cu.cuq_reg_id = c.cuq_reg_id)'
      'WHERE c.ag_id = :ag_id AND '
      '               s.ag_id = :ag_id AND'
      '               s.sd_id = :sd_id AND'
      '               c.CUQ_REG_ID IS NOT NULL')
    SQLConnection = data.connection
    Left = 416
    Top = 208
    object qAccCustCUQ_FULL_NAME: TStringField
      FieldName = 'CUQ_FULL_NAME'
      Size = 128
    end
    object qAccCustAG_FACTURA_NAME: TStringField
      FieldName = 'AG_FACTURA_NAME'
      Size = 64
    end
    object qAccCustCUQ_OKPO: TStringField
      FieldName = 'CUQ_OKPO'
      Size = 10
    end
    object qAccCustCUQ_ADDRESS: TStringField
      FieldName = 'CUQ_ADDRESS'
      Size = 128
    end
    object qAccCustCUQ_ADDRESS_REAL: TStringField
      FieldName = 'CUQ_ADDRESS_REAL'
      Size = 128
    end
    object qAccCustCUQ_PHONES: TStringField
      FieldName = 'CUQ_PHONES'
      Size = 30
    end
    object qAccCustCUQ_NDS_NUM: TStringField
      FieldName = 'CUQ_NDS_NUM'
      Size = 15
    end
    object qAccCustCUQ_INN: TStringField
      FieldName = 'CUQ_INN'
      Size = 15
    end
  end
  object qAccService: TSQLQuery
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
      
        'SELECT sr.sr_id, sr.ag_id, sr.sd_id, sr.sr_amount AS SDELKA_SERV' +
        'ICE_AMOUNT,'
      
        '       sr.sr_sum AS SERVICE_SUM, srt.se_id AS SERVICE_TYPE_ID, s' +
        'rt.se_name AS SERVICE_TYPE_NAME,'
      
        '       sr.sr_description AS SDELKA_SERVICE_DESCRIPTION, srt.se_d' +
        'escription AS SERVICE_TYPE_DESCRIPTION'
      'FROM service sr'
      'LEFT JOIN service_type srt ON (srt.se_id = sr.sr_type)'
      
        'LEFT JOIN sdelka s ON (s.ag_id = sr.ag_id AND s.sd_id = sr.sd_id' +
        ')'
      'WHERE s.ag_id = :ag_id AND'
      '      s.sd_id = :sd_id')
    SQLConnection = data.connection
    Left = 384
    Top = 208
  end
  object DataSource1: TDataSource
    DataSet = qAcc
    Left = 304
    Top = 168
  end
  object DataSource2: TDataSource
    DataSet = qAccCust
    Left = 304
    Top = 200
  end
  object qAccCust2: TSQLQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'ag_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cu_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reg_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      
        'SELECT (SELECT a.ag_factura_name FROM agent a WHERE a.ag_id = :a' +
        'g_id) AS AG_FACTURA_NAME,'
      '        cu.cuq_okpo,'
      
        '        CASE WHEN CHAR_LENGTH(cu.cuq_full_name) >= 125 THEN cu.C' +
        'UQ_NAME ELSE cu.cuq_full_name END AS cuq_full_name,'
      '        LEFT(cu.cuq_address, 100) as cuq_address,'
      '        LEFT(cu.cuq_address_real, 100) as cuq_address_real,'
      
        '        (SUBSTRING((SELECT cp.CU_PHONES FROM GET_CUST_PHONES(c.A' +
        'G_ID, c.CU_ID) cp) FROM 1 FOR 16)) as cuq_phones,'
      '        cu.cuq_nds_num,'
      '        cu.cuq_inn'
      'FROM cust c'
      'LEFT JOIN cust_unique cu on (cu.cuq_reg_id = c.cuq_reg_id)'
      'WHERE c.cu_id = :cu_id AND c.cuq_reg_id = :reg_id')
    Left = 352
    Top = 208
  end
  object cdsAcc: TClientDataSet
    Aggregates = <>
    PacketRecords = 100
    Params = <>
    ProviderName = 'DataSetProvider2'
    Left = 352
    Top = 176
    object cdsAccSD_SKIDKA: TFloatField
      FieldName = 'SD_SKIDKA'
    end
    object cdsAccSD_SUM: TFloatField
      FieldName = 'SD_SUM'
    end
    object cdsAccPODACHA_NUMS: TStringField
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object cdsAccFM_NAME: TStringField
      FieldName = 'FM_NAME'
      Size = 128
    end
    object cdsAccSD_SUM_LITERAL: TStringField
      FieldName = 'SD_SUM_LITERAL'
      Size = 255
    end
    object cdsAccSD_SUM_NDS: TFloatField
      FieldName = 'SD_SUM_NDS'
    end
    object cdsAccSD_SUM_OUT_NDS: TFloatField
      FieldName = 'SD_SUM_OUT_NDS'
    end
    object cdsAccPREDMET_RAHUNKU: TStringField
      FieldName = 'PREDMET_RAHUNKU'
      Size = 255
    end
    object cdsAccSD_FACT_DATE: TSQLTimeStampField
      FieldName = 'SD_FACT_DATE'
    end
    object cdsAccSD_FACT_NUM: TIntegerField
      FieldName = 'SD_FACT_NUM'
    end
    object cdsAccSD_KA_START_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_START_DATE'
    end
    object cdsAccSD_KA_END_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_END_DATE'
    end
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = qAcc
    Left = 384
    Top = 176
  end
  object rdsAcc: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qAcc
    Left = 184
  end
  object rdsAccCust: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qAccCust
    Left = 216
  end
  object rdsAccService: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qAccService
    Left = 248
  end
  object qReq: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT r.rq_id, r.rq_stamp, r.rq_comp_addr, r.rq_name,'
      
        '       (SELECT g.gz_logo FROM gazeta g WHERE g.gz_id = :gz_id) a' +
        's logo,'
      '       r.rq_svid, r.rq_inn'
      'FROM requisite r'
      'WHERE r.rq_id = :id ')
    SQLConnection = data.connection
    Left = 208
    Top = 176
    object qReqRQ_STAMP: TBlobField
      FieldName = 'RQ_STAMP'
      Size = 1000
    end
    object qReqRQ_COMP_ADDR: TStringField
      FieldName = 'RQ_COMP_ADDR'
      Size = 255
    end
    object qReqREQUISITE: TStringField
      FieldKind = fkCalculated
      FieldName = 'REQUISITE'
      Size = 1024
      Calculated = True
    end
    object qReqLOGO: TBlobField
      FieldName = 'LOGO'
      Size = 1000
    end
    object qReqRQ_NAME: TStringField
      FieldName = 'RQ_NAME'
      Size = 32
    end
    object qReqRQ_SVID: TStringField
      FieldName = 'RQ_SVID'
      Size = 128
    end
    object qReqRQ_INN: TStringField
      FieldName = 'RQ_INN'
      Size = 128
    end
  end
  object rdsReq: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qReq
    Left = 152
  end
  object qBank: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT b.*'
      'FROM bank b'
      'WHERE b.id_b = :id')
    SQLConnection = data.connection
    Left = 256
    Top = 192
    object qBankB_NAME: TStringField
      FieldName = 'B_NAME'
      Size = 128
    end
    object qBankB_MFO: TStringField
      FieldName = 'B_MFO'
      Size = 30
    end
    object qBankB_EDRPO: TStringField
      FieldName = 'B_EDRPO'
      Size = 30
    end
    object qBankB_SVID: TStringField
      FieldName = 'B_SVID'
      Size = 30
    end
    object qBankB_INN: TStringField
      FieldName = 'B_INN'
      Size = 30
    end
    object qBankB_ACC: TStringField
      FieldName = 'B_ACC'
      Size = 30
    end
  end
  object rdsBank: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qBank
    Left = 120
  end
end
