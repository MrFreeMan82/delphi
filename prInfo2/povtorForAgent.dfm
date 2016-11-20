object frmPovtorForAgent: TfrmPovtorForAgent
  Left = 654
  Top = 389
  Width = 744
  Height = 539
  Caption = #1042#1099#1073#1086#1088' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1103' '#1076#1083#1103' '#1087#1086#1074#1090#1086#1088#1072' '#1090#1077#1082#1089#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 464
    Width = 728
    Height = 37
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      728
      37)
    object btAddChecked: TBitBtn
      Left = 467
      Top = 7
      Width = 146
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1077
      ModalResult = 1
      TabOrder = 0
      Glyph.Data = {
        CE000000424DCE0000000000000076000000280000000B0000000B0000000100
        04000000000058000000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
        0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
        0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
        0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
    end
    object BitBtn4: TBitBtn
      Left = 619
      Top = 7
      Width = 104
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
      Glyph.Data = {
        CE000000424DCE0000000000000076000000280000000B0000000B0000000100
        04000000000058000000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF0FFFFF0FF0
        0000F000FFF000F0000000000F0000000000F000000000F00000FF0000000FF0
        0000FFF00000FFF00000FF0000000FF00000F000000000F0000000000F000000
        0000F000FFF000F00000FF0FFFFF0FF00000}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 728
    Height = 37
    Align = alTop
    TabOrder = 1
    object btFindObjavs: TBitBtn
      Left = 464
      Top = 6
      Width = 73
      Height = 25
      Caption = #1053#1072#1081#1090#1080' >>'
      TabOrder = 4
      OnClick = btFindObjavsClick
    end
    object cbIssue: TDBLookupComboBox
      Left = 70
      Top = 8
      Width = 115
      Height = 21
      KeyField = 'IS_ID'
      ListField = 'IS_NAME_COMPOSED'
      ListSource = data.dsIssuePR
      TabOrder = 1
    end
    object cbShowPictures: TDBCheckBoxEh
      Left = 546
      Top = 11
      Width = 172
      Height = 17
      AlwaysShowBorder = True
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1084#1086#1076#1091#1083#1080' '#1074' '#1089#1087#1080#1089#1082#1077
      Flat = True
      TabOrder = 5
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = cbShowPicturesClick
    end
    object cbFormat: TDBLookupComboBox
      Left = 190
      Top = 8
      Width = 131
      Height = 21
      KeyField = 'FM_ID'
      ListField = 'FM_NAME'
      ListSource = dsFormat
      TabOrder = 2
    end
    object cbRubrika: TDBLookupComboBox
      Left = 326
      Top = 8
      Width = 131
      Height = 21
      KeyField = 'RB_ID'
      ListField = 'RB_NAME_SHORT'
      ListSource = dsRubrika
      TabOrder = 3
      OnKeyDown = cbRubrikaKeyDown
    end
    object cbGazeta: TDBLookupComboboxEh
      Left = 8
      Top = 8
      Width = 57
      Height = 21
      EditButtons = <>
      KeyField = 'GZ_ID'
      ListField = 'GZ_NAME_SHORT'
      ListSource = data.dsGazeta
      TabOrder = 0
      Visible = True
      OnChange = cbGazetaChange
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 37
    Width = 728
    Height = 427
    Align = alClient
    BorderWidth = 5
    Caption = 'Panel3'
    TabOrder = 2
    object grOldObjavs: TDBGridEh
      Left = 6
      Top = 6
      Width = 716
      Height = 415
      Align = alClient
      DataSource = dsOldTexts
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      RowLines = 6
      RowSizingAllowed = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = grOldObjavsDblClick
      OnDrawColumnCell = grOldObjavsDrawColumnCell
      Columns = <
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'DO_ADD'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          Width = 56
        end
        item
          EditButtons = <>
          FieldName = 'FM_NAME_LK'
          Footers = <>
          ReadOnly = True
          Width = 47
        end
        item
          EditButtons = <>
          FieldName = 'RB_NAME_LK'
          Footers = <>
          ReadOnly = True
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'DB_RB_NAME_LK'
          Footers = <>
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'OB_TEXT'
          Footers = <>
          ReadOnly = True
          Width = 233
        end
        item
          AlwaysShowEditButton = True
          ButtonStyle = cbsEllipsis
          Checkboxes = False
          EditButtons = <>
          FieldName = 'CONTENT_ID'
          Footers = <>
          Width = 187
        end>
    end
  end
  object dsOldTexts: TDataSource
    DataSet = cdsOldTexts
    Left = 328
    Top = 88
  end
  object cdsOldTexts: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'CU_ID'
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
        Name = 'FM_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'RB_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CU_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'CU_ID'
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
        Name = 'FM_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'RB_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CU_ID'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'prvOldTexts'
    Left = 248
    Top = 88
    object cdsOldTextsAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object cdsOldTextsSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object cdsOldTextsOB_ID: TIntegerField
      FieldName = 'OB_ID'
    end
    object cdsOldTextsOB_TEXT: TStringField
      DisplayLabel = #1058#1077#1082#1089#1090
      FieldName = 'OB_TEXT'
      Size = 2047
    end
    object cdsOldTextsRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object cdsOldTextsFM_ID: TIntegerField
      FieldName = 'FM_ID'
    end
    object cdsOldTextsDB_RB_ID: TIntegerField
      FieldName = 'DB_RB_ID'
    end
    object cdsOldTextsDO_ADD: TIntegerField
      DefaultExpression = '0'
      DisplayLabel = #1044#1086#1073#1072#1074#1080#1090#1100
      FieldName = 'DO_ADD'
      Required = True
    end
    object cdsOldTextsIS_OBJAVLENIE: TIntegerField
      FieldName = 'IS_OBJAVLENIE'
      Required = True
    end
    object cdsOldTextsRB_NAME_LK: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldKind = fkLookup
      FieldName = 'RB_NAME_LK'
      LookupDataSet = data.tblRubrika
      LookupKeyFields = 'RB_ID'
      LookupResultField = 'RB_NAME_SHORT'
      KeyFields = 'RB_ID'
      Lookup = True
    end
    object cdsOldTextsDB_RB_NAME_LK: TStringField
      DisplayLabel = #1050#1086#1087#1080#1103' '#1074
      FieldKind = fkLookup
      FieldName = 'DB_RB_NAME_LK'
      LookupDataSet = data.tblRubrika
      LookupKeyFields = 'RB_ID'
      LookupResultField = 'RB_NAME_SHORT'
      KeyFields = 'DB_RB_ID'
      Lookup = True
    end
    object cdsOldTextsCONTENT_ID: TIntegerField
      DisplayLabel = #1052#1086#1076#1091#1083#1100
      FieldName = 'CONTENT_ID'
      OnGetText = cdsOldTextsCONTENT_IDGetText
    end
    object cdsOldTextsFM_NAME_LK: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldKind = fkLookup
      FieldName = 'FM_NAME_LK'
      LookupDataSet = data.tblFormat
      LookupKeyFields = 'FM_ID'
      LookupResultField = 'FM_NAME'
      KeyFields = 'FM_ID'
      Lookup = True
    end
    object cdsOldTextsAG_NAME: TStringField
      FieldName = 'AG_NAME'
      Size = 128
    end
    object cdsOldTextsCU_NAME: TStringField
      FieldName = 'CU_NAME'
      Size = 128
    end
  end
  object prvOldTexts: TDataSetProvider
    DataSet = qryOldTexts
    OnGetTableName = prvOldTextsGetTableName
    Left = 168
    Top = 88
  end
  object qryOldTexts: TSQLQuery
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
        Name = 'CU_ID'
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
        Name = 'FM_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'RB_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CU_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ag_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'cu_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'is_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'fm_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'rb_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT'
      '    OB.AG_ID                    AS AG_ID,'
      '    OB.SD_ID                    AS SD_ID,'
      '    OB.OB_ID                    AS OB_ID,'
      '    CAST(OB.OB_TEXT AS VARCHAR(2047)) AS OB_TEXT,'
      '    OB.RB_ID                    AS RB_ID,'
      '    CAST(OB.FM_ID AS INTEGER)   AS FM_ID,'
      '    DB.RB_ID                    AS DB_RB_ID,'
      '    0                           AS DO_ADD,'
      '    0                           AS IS_OBJAVLENIE,'
      '    0                           AS CONTENT_ID,'
      '    AG.AG_NAME                  AS AG_NAME,'
      '    CU.CU_NAME                  AS CU_NAME'
      'FROM'
      
        '    GET_OLD_CUST_TEXTS_RUB(:AG_ID,:CU_ID,:IS_ID,:FM_ID,:RB_ID) G' +
        'OCT'
      ''
      '    LEFT JOIN SDELKA SD'
      '    ON (SD.AG_ID=GOCT.AG_ID AND SD.SD_ID=GOCT.SD_ID)'
      ''
      '    LEFT JOIN OBJAV OB'
      
        '    ON (OB.AG_ID=GOCT.AG_ID AND OB.SD_ID=GOCT.SD_ID AND OB.OB_ID' +
        '=GOCT.OB_ID)'
      ''
      '    LEFT JOIN OBJAV DB'
      
        '    ON (DB.AG_ID=GOCT.AG_ID AND DB.SD_ID=GOCT.SD_ID AND DB.OB_PA' +
        'RENT=GOCT.OB_ID)'
      ''
      '    LEFT JOIN AGENT AG'
      '    ON (AG.AG_ID = GOCT.AG_ID)'
      ''
      '    LEFT JOIN CUST CU'
      '    ON (CU.AG_ID = GOCT.AG_ID AND CU.CU_ID = :CU_ID)'
      'UNION'
      'SELECT s.AG_ID                     AS AG_ID,'
      '       s.SD_ID                     AS SD_ID,'
      '       o.OBJAV_ID                  AS OB_ID,'
      '       CAST(NULL AS VARCHAR(2047)) AS OB_TEXT,'
      '       o.RB_ID                     AS RB_ID,'
      '       o.FM_ID                     AS FM_ID,'
      '       o.DOUBLE_RB_ID              AS DB_RB_ID,'
      '       0                           AS DO_ADD,'
      '       1                           AS IS_OBJAVLENIE,'
      '       o.CONTENT_ID                AS CONTENT_ID,'
      '       a.AG_NAME                   AS AG_NAME,'
      '       c.CU_NAME                   AS CU_NAME'
      
        'FROM GET_OLD_CUST_OBJAVLENIE_RUB_NEW(:ag_id, :cu_id, :is_id, :fm' +
        '_id, :rb_id) obr'
      'LEFT JOIN OBJAVLENIE o ON (o.OBJAV_ID = obr.OBJAV_ID)'
      'LEFT JOIN podacha p ON (p.PD_ID = o.PD_ID)'
      'LEFT JOIN sdelka s ON (s.ag_id = p.AG_ID AND s.SD_ID = p.SD_ID)'
      'LEFT JOIN agent a ON (a.AG_ID = s.AG_ID)'
      'LEFT JOIN cust c ON (c.CU_ID = s.CU_ID)')
    SQLConnection = data.connection
    Left = 128
    Top = 88
    object qryOldTextsAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object qryOldTextsSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object qryOldTextsOB_ID: TIntegerField
      FieldName = 'OB_ID'
    end
    object qryOldTextsOB_TEXT: TStringField
      FieldName = 'OB_TEXT'
      Size = 2047
    end
    object qryOldTextsRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object qryOldTextsFM_ID: TIntegerField
      FieldName = 'FM_ID'
    end
    object qryOldTextsDB_RB_ID: TIntegerField
      FieldName = 'DB_RB_ID'
    end
    object qryOldTextsDO_ADD: TIntegerField
      FieldName = 'DO_ADD'
      Required = True
    end
    object qryOldTextsIS_OBJAVLENIE: TIntegerField
      FieldName = 'IS_OBJAVLENIE'
      Required = True
    end
    object qryOldTextsCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
    end
    object qryOldTextsAG_NAME: TStringField
      FieldName = 'AG_NAME'
      Size = 128
    end
    object qryOldTextsCU_NAME: TStringField
      FieldName = 'CU_NAME'
      Size = 128
    end
  end
  object cdsContent: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CONTENT_ID'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'prvContent'
    Left = 284
    Top = 144
    object cdsContentRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object cdsContentFM_ID: TIntegerField
      FieldName = 'FM_ID'
    end
    object cdsContentCONTENT_COREL_PAGE: TStringField
      FieldName = 'CONTENT_COREL_PAGE'
      Size = 32
    end
    object cdsContentCONTENT_PICTURE: TBlobField
      FieldName = 'CONTENT_PICTURE'
      Size = 1
    end
    object cdsContentCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
      Required = True
    end
    object cdsContentEXTENSION: TStringField
      FieldName = 'EXTENSION'
      Size = 5
    end
    object cdsContentCONTENT_SITE_OBJAV_ADDED: TSmallintField
      FieldName = 'CONTENT_SITE_OBJAV_ADDED'
    end
  end
  object prvContent: TDataSetProvider
    DataSet = qryContent
    Left = 220
    Top = 144
  end
  object qryContent: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CONTENT_ID'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'SELECT'
      '    OC.CONTENT_ID,'
      '    OC.EXTENSION,'
      '    OC.CONTENT_PICTURE,'
      '    OC.RB_ID,'
      '    OC.FM_ID,'
      '    OC.CONTENT_COREL_PAGE,'
      '    OC.CONTENT_SITE_OBJAV_ADDED'
      'FROM'
      '    OBJAV_CONTENT OC'
      'WHERE'
      '    OC.CONTENT_ID=:CONTENT_ID')
    SQLConnection = data.connection
    Left = 164
    Top = 144
    object qryContentCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
      Required = True
    end
    object qryContentCONTENT_PICTURE: TBlobField
      FieldName = 'CONTENT_PICTURE'
      Size = 1
    end
    object qryContentEXTENSION: TStringField
      FieldName = 'EXTENSION'
      Size = 5
    end
    object qryContentRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object qryContentFM_ID: TIntegerField
      FieldName = 'FM_ID'
    end
    object qryContentCONTENT_COREL_PAGE: TStringField
      FieldName = 'CONTENT_COREL_PAGE'
      Size = 32
    end
    object qryContentCONTENT_SITE_OBJAV_ADDED: TSmallintField
      FieldName = 'CONTENT_SITE_OBJAV_ADDED'
    end
  end
  object qRubrika: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      
        'SELECT * FROM rubrika r WHERE r.gz_id = :gz_id AND r.DELETED = 0' +
        ' ORDER BY r.RB_NAME_SHORT')
    SQLConnection = data.connection
    Left = 328
    Top = 32
  end
  object prvRubrika: TDataSetProvider
    DataSet = qRubrika
    Left = 360
    Top = 29
  end
  object cdsRubrika: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRubrika'
    Left = 392
    Top = 29
  end
  object dsRubrika: TDataSource
    DataSet = cdsRubrika
    Left = 424
    Top = 29
  end
  object qFormat: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT * FROM FORMAT f '
      'LEFT JOIN format_cost fc ON (f.fm_id = fc.fm_id) '
      'WHERE fc.gz_id = :gz_id')
    SQLConnection = data.connection
    Left = 184
    Top = 32
  end
  object prvFormat: TDataSetProvider
    DataSet = qFormat
    Left = 216
    Top = 32
  end
  object cdsFormat: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvFormat'
    Left = 248
    Top = 32
    object cdsFormatFM_ID: TIntegerField
      FieldName = 'FM_ID'
    end
    object cdsFormatFM_NAME: TStringField
      FieldName = 'FM_NAME'
      Size = 128
    end
  end
  object dsFormat: TDataSource
    DataSet = cdsFormat
    Left = 280
    Top = 32
  end
end
