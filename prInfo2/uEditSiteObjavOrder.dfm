object frmEditSiteObjavOrder: TfrmEditSiteObjavOrder
  Left = 644
  Top = 512
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1054#1073#1098#1103#1074#1083#1077#1085#1080#1103' '#1076#1083#1103' '#1089#1072#1081#1090#1072
  ClientHeight = 296
  ClientWidth = 787
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlText: TPanel
    Left = 0
    Top = 0
    Width = 473
    Height = 255
    Align = alLeft
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 0
    object Label5: TLabel
      Left = 9
      Top = 29
      Width = 29
      Height = 13
      Caption = #1058#1077#1082#1089#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblIsReadOnly: TLabel
      Left = 363
      Top = 29
      Width = 101
      Height = 13
      Caption = #1058#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1095#1090#1077#1085#1080#1103'?'
    end
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 38
      Height = 13
      Caption = #1060#1086#1088#1084#1072#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 225
      Top = 9
      Width = 42
      Height = 13
      Caption = #1056#1091#1073#1088#1080#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbFormat: TDBLookupComboboxEh
      Left = 59
      Top = 6
      Width = 143
      Height = 19
      AlwaysShowBorder = True
      DataField = 'FM_ID'
      DataSource = dsObjav
      Enabled = False
      EditButtons = <>
      Flat = True
      KeyField = 'FM_ID'
      ListField = 'FM_NAME'
      ListSource = dsFormat
      ReadOnly = True
      TabOrder = 0
      Visible = True
    end
    object cbRubrika: TDBLookupComboboxEh
      Left = 281
      Top = 6
      Width = 177
      Height = 19
      AlwaysShowBorder = True
      DataField = 'RB_ID'
      DataSource = dsObjav
      Enabled = False
      EditButtons = <>
      Flat = True
      KeyField = 'RB_ID'
      ListField = 'RB_NAME_SHORT'
      ListSource = dsRubrika
      ReadOnly = True
      TabOrder = 1
      Visible = True
    end
    object rchText: TDBRichEdit
      Left = 4
      Top = 44
      Width = 461
      Height = 206
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'OB_TEXT'
      DataSource = dsObjav
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PlainText = True
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 2
      OnChange = rchTextChange
    end
  end
  object Panel4: TPanel
    Left = 473
    Top = 0
    Width = 314
    Height = 255
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 314
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Panel3'
      TabOrder = 0
      DesignSize = (
        314
        25)
      object Shape2: TShape
        Left = 0
        Top = 0
        Width = 314
        Height = 25
        Align = alClient
        Brush.Color = clSkyBlue
        Pen.Color = clNavy
      end
      object Label4: TLabel
        Left = -1
        Top = 6
        Width = 324
        Height = 15
        AutoSize = False
        Caption = '  '#1054#1073#1098#1103#1074#1083#1077#1085#1080#1103' '#1085#1072' '#1089#1072#1081#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object btAddSiteObjav: TBitBtn
        Left = 229
        Top = 4
        Width = 25
        Height = 17
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1077
        Anchors = [akTop, akRight]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btAddSiteObjavClick
        Glyph.Data = {
          62000000424D62000000000000003E0000002800000009000000090000000100
          010000000000240000000000000000000000020000000000000000000000FFFF
          FF00E3800000E3800000E3800000000000000000000000000000E3800000E380
          0000E3800000}
      end
      object btEditSiteObjav: TBitBtn
        Left = 257
        Top = 4
        Width = 25
        Height = 17
        Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1077
        Anchors = [akTop, akRight]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btEditSiteObjavClick
        Glyph.Data = {
          52000000424D52000000000000003E000000280000000B000000050000000100
          010000000000140000000000000000000000020000000000000000000000FFFF
          FF0080200000C0600000E0E00000F1E00000FBE00000}
      end
      object btDeleteSiteObjav: TBitBtn
        Left = 285
        Top = 4
        Width = 25
        Height = 17
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1077
        Anchors = [akTop, akRight]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btDeleteSiteObjavClick
        Glyph.Data = {
          6A000000424D6A000000000000003E000000280000000B0000000B0000000100
          0100000000002C0000000000000000000000020000000000000000000000FFFF
          FF00FFE00000FFE00000FFE00000FFE00000002000000020000000200000FFE0
          0000FFE00000FFE00000FFE00000}
      end
    end
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 25
      Width = 314
      Height = 199
      Align = alClient
      Color = clBtnFace
      DataSource = dsSiteObjavs
      FixedColor = clSkyBlue
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghHighlightFocus, dghClearSelection]
      RowHeight = 40
      RowSizingAllowed = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'RS_NAME'
          Footers = <>
          Width = 112
        end
        item
          EditButtons = <>
          FieldName = 'SITE_VACANCY_NAME'
          Footers = <>
          Title.Caption = #1042#1072#1082#1072#1085#1089#1080#1103
          Width = 189
        end>
    end
    object Panel6: TPanel
      Left = 0
      Top = 224
      Width = 314
      Height = 31
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object Shape4: TShape
        Left = 0
        Top = 0
        Width = 1
        Height = 31
        Align = alLeft
        Pen.Color = clBtnShadow
      end
      object DBCheckBoxEh1: TDBCheckBoxEh
        Left = 99
        Top = 8
        Width = 153
        Height = 17
        AlwaysShowBorder = True
        Caption = #1042#1089#1077' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1103' '#1074#1085#1077#1089#1077#1085#1099
        DataField = 'SITE_OBJAV_ADDED'
        DataSource = dsObjav
        Flat = True
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
        Visible = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 255
    Width = 787
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btDone: TBitBtn
      Left = 542
      Top = 11
      Width = 115
      Height = 25
      Caption = #1054#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      OnClick = btDoneClick
      Glyph.Data = {
        CE000000424DCE0000000000000076000000280000000B0000000B0000000100
        04000000000058000000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
        0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
        0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
        0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
    end
    object btCancelAg: TBitBtn
      Left = 662
      Top = 11
      Width = 115
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      OnClick = btCancelAgClick
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
  object dsObjav: TDataSource
    DataSet = cdsObjav
    Left = 336
    Top = 88
  end
  object cdsObjav: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'OB_ID'
        ParamType = ptUnknown
        Value = '0'
      end>
    ProviderName = 'prvObjav'
    Left = 280
    Top = 88
    object cdsObjavAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsObjavSD_ID: TIntegerField
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsObjavOB_ID: TIntegerField
      FieldName = 'OB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsObjavOB_STATE: TSmallintField
      FieldName = 'OB_STATE'
    end
    object cdsObjavOB_IS_ACTIVE: TSmallintField
      FieldName = 'OB_IS_ACTIVE'
      Required = True
    end
    object cdsObjavFM_ID: TSmallintField
      FieldName = 'FM_ID'
    end
    object cdsObjavRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object cdsObjavRS_ID: TIntegerField
      FieldName = 'RS_ID'
    end
    object cdsObjavOB_TEXT: TStringField
      DisplayLabel = #1058#1077#1082#1089#1090
      FieldName = 'OB_TEXT'
      Size = 2047
    end
    object cdsObjavOB_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'OB_COMMENT'
      Size = 127
    end
    object cdsObjavOB_FOR_INTERNET: TSmallintField
      FieldName = 'OB_FOR_INTERNET'
      Required = True
    end
    object cdsObjavCU_ID: TIntegerField
      FieldName = 'CU_ID'
      ProviderFlags = []
    end
    object cdsObjavRB_NAME_SHORT: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldKind = fkLookup
      FieldName = 'RB_NAME_SHORT'
      LookupDataSet = data.tblRubrika
      LookupKeyFields = 'RB_ID'
      LookupResultField = 'RB_NAME_SHORT'
      KeyFields = 'RB_ID'
      Lookup = True
    end
    object cdsObjavRS_NAME_LK: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072' '#1085#1072' '#1089#1072#1081#1090#1077
      FieldKind = fkLookup
      FieldName = 'RS_NAME_LK'
      LookupDataSet = data.sdsRubrikaSite
      LookupKeyFields = 'RS_ID'
      LookupResultField = 'RS_NAME'
      KeyFields = 'RS_ID'
      Lookup = True
    end
    object cdsObjavFM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldKind = fkLookup
      FieldName = 'FM_NAME'
      LookupDataSet = data.tblFormat
      LookupKeyFields = 'FM_ID'
      LookupResultField = 'FM_NAME'
      KeyFields = 'FM_ID'
      Lookup = True
    end
    object cdsObjavDISTRICT_NAME_LK: TStringField
      DisplayLabel = #1056#1072#1081#1086#1085
      FieldKind = fkLookup
      FieldName = 'DISTRICT_NAME_LK'
      LookupDataSet = data.tblDistrict
      LookupKeyFields = 'DT_ID'
      LookupResultField = 'DT_NAME'
      KeyFields = 'DISTRICT_ID'
      LookupCache = True
      Lookup = True
    end
    object cdsObjavOS_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldKind = fkLookup
      FieldName = 'OS_NAME'
      LookupDataSet = data.tblObjavState
      LookupKeyFields = 'OS_ID'
      LookupResultField = 'OS_NAME'
      KeyFields = 'OB_STATE'
      Lookup = True
    end
    object cdsObjavOB_VAC_COUNT: TSmallintField
      DefaultExpression = '1'
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1074#1072#1082#1072#1085#1089#1080#1081
      FieldName = 'OB_VAC_COUNT'
      Required = True
    end
    object cdsObjavOB_HAS_ATTENTION: TSmallintField
      DefaultExpression = '0'
      DisplayLabel = #1054#1073#1088#1072#1090#1080#1090#1100' '#1074#1085#1080#1084#1072#1085#1080#1077' '#1042#1099#1087#1091#1089#1082#1072#1102#1097#1077#1084#1091' '#1086#1090#1076#1077#1083#1091
      FieldName = 'OB_HAS_ATTENTION'
    end
    object cdsObjavDISTRICT_ID: TIntegerField
      FieldName = 'DISTRICT_ID'
    end
    object cdsObjavSITE_OBJAV_ADDED: TSmallintField
      FieldName = 'SITE_OBJAV_ADDED'
    end
    object cdsObjavSITE_EMAIL: TStringField
      FieldName = 'SITE_EMAIL'
      Size = 128
    end
    object cdsObjavSITE_EMPLOYER: TStringField
      FieldName = 'SITE_EMPLOYER'
      Size = 255
    end
  end
  object prvObjav: TDataSetProvider
    DataSet = qryObjav
    Exported = False
    Options = [poCascadeDeletes, poCascadeUpdates]
    Left = 216
    Top = 88
  end
  object qryObjav: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'OB_ID'
        ParamType = ptUnknown
        Value = '0'
      end>
    SQL.Strings = (
      'select'
      #9' ob.AG_ID'
      #9',ob.SD_ID'
      #9',ob.OB_ID'
      #9',ob.OB_STATE'
      #9',ob.OB_IS_ACTIVE'
      #9',ob.FM_ID'
      #9',ob.RB_ID'
      #9',ob.OB_VAC_COUNT'
      #9',ob.RS_ID'
      #9',ob.OB_TEXT'
      #9',ob.OB_COMMENT'
      #9',ob.OB_FOR_INTERNET'
      #9',ob.OB_HAS_ATTENTION'
      '                ,ob.SITE_OBJAV_ADDED'
      '                ,ob.SITE_EMAIL'
      '                ,ob.SITE_EMPLOYER'
      '  ,ob.DISTRICT_ID'
      #9',sd.CU_ID'
      '                ,sd.GZ_ID'
      'from'
      '     OBJAV ob'
      ''
      #9'left join SDELKA sd'
      #9'on (ob.AG_ID = sd.AG_ID and ob.SD_ID = sd.SD_ID)'
      'where'
      #9#9'ob.AG_ID=:AG_ID'
      #9'and ob.SD_ID = :SD_ID'
      #9'and ob.OB_ID = :OB_ID'
      #9'and ob.OB_PARENT is null')
    SQLConnection = data.connection
    Left = 168
    Top = 88
    object qryObjavAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryObjavSD_ID: TIntegerField
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryObjavOB_ID: TIntegerField
      FieldName = 'OB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryObjavOB_STATE: TSmallintField
      FieldName = 'OB_STATE'
      Required = True
    end
    object qryObjavOB_IS_ACTIVE: TSmallintField
      FieldName = 'OB_IS_ACTIVE'
      Required = True
    end
    object qryObjavFM_ID: TSmallintField
      FieldName = 'FM_ID'
      Required = True
    end
    object qryObjavRB_ID: TIntegerField
      FieldName = 'RB_ID'
      Required = True
    end
    object qryObjavRS_ID: TIntegerField
      FieldName = 'RS_ID'
    end
    object qryObjavOB_TEXT: TStringField
      FieldName = 'OB_TEXT'
      Size = 2047
    end
    object qryObjavOB_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'OB_COMMENT'
      Size = 127
    end
    object qryObjavOB_FOR_INTERNET: TSmallintField
      FieldName = 'OB_FOR_INTERNET'
      Required = True
    end
    object qryObjavDISTRICT_ID: TIntegerField
      FieldName = 'DISTRICT_ID'
    end
    object qryObjavCU_ID: TIntegerField
      FieldName = 'CU_ID'
      ProviderFlags = []
    end
    object qryObjavOB_VAC_COUNT: TSmallintField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1074#1072#1082#1072#1085#1089#1080#1081
      FieldName = 'OB_VAC_COUNT'
      Required = True
    end
    object qryObjavOB_HAS_ATTENTION: TSmallintField
      DisplayLabel = #1054#1073#1088#1072#1090#1080#1090#1100' '#1074#1085#1080#1084#1072#1085#1080#1077' '#1042#1099#1087#1091#1089#1082#1072#1102#1097#1077#1084#1091' '#1086#1090#1076#1077#1083#1091
      FieldName = 'OB_HAS_ATTENTION'
    end
    object qryObjavSITE_OBJAV_ADDED: TSmallintField
      FieldName = 'SITE_OBJAV_ADDED'
    end
    object qryObjavSITE_EMAIL: TStringField
      FieldName = 'SITE_EMAIL'
      Size = 128
    end
    object qryObjavSITE_EMPLOYER: TStringField
      FieldName = 'SITE_EMPLOYER'
      Size = 255
    end
  end
  object qrySiteObjavs: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'OB_ID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT'
      '    SO.SITE_OBJAV_ID'
      '   ,SO.RS_ID'
      '   ,SO.SITE_OBJAV_TEXT'
      '   ,SO.SITE_VACANCY_NAME'
      '   ,SO.SITE_EMAIL'
      '   ,SO.SITE_TEL'
      '   ,SO.SITE_CONTACT'
      '   ,SO.SITE_DONT_UPLOAD'
      '   ,SO.SITE_ZP'
      '   ,SO.SITE_EMPLOYER'
      '   ,SO.OB_ID'
      '   ,RS.RS_NAME'
      '   ,SO.CU_ADDRESS'
      'FROM SITE_OBJAV so'
      'LEFT JOIN RUBRIKA_SITE rs ON (rs.RS_ID = so.RS_ID)'
      'WHERE so.OB_ID = :OB_ID')
    SQLConnection = data.connection
    Left = 488
    Top = 112
  end
  object prvSiteObjavs: TDataSetProvider
    DataSet = qrySiteObjavs
    OnGetTableName = prvSiteObjavsGetTableName
    Left = 524
    Top = 112
  end
  object cdsSiteObjavs: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CONTENT_ID'
        ParamType = ptUnknown
        Value = 0
      end>
    ProviderName = 'prvSiteObjavs'
    Left = 564
    Top = 112
    object cdsSiteObjavsSITE_OBJAV_ID: TIntegerField
      FieldName = 'SITE_OBJAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsSiteObjavsOB_ID: TIntegerField
      FieldName = 'OB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSiteObjavsRS_ID: TIntegerField
      FieldName = 'RS_ID'
      ProviderFlags = []
    end
    object cdsSiteObjavsRS_NAME: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RS_NAME'
      ProviderFlags = []
      Size = 128
    end
    object cdsSiteObjavsSITE_OBJAV_TEXT: TStringField
      DisplayLabel = #1058#1077#1082#1089#1090
      FieldName = 'SITE_OBJAV_TEXT'
      ProviderFlags = []
      Size = 2047
    end
    object cdsSiteObjavsSITE_VACANCY_NAME: TStringField
      FieldName = 'SITE_VACANCY_NAME'
      Size = 128
    end
    object cdsSiteObjavsSITE_TEL: TStringField
      FieldName = 'SITE_TEL'
      Size = 128
    end
    object cdsSiteObjavsSITE_EMPLOYER: TStringField
      FieldName = 'SITE_EMPLOYER'
      Size = 255
    end
    object cdsSiteObjavsSITE_CONTACT: TStringField
      FieldName = 'SITE_CONTACT'
      Size = 255
    end
    object cdsSiteObjavsSITE_EMAIL: TStringField
      FieldName = 'SITE_EMAIL'
      Size = 128
    end
    object cdsSiteObjavsCU_ADDRESS: TStringField
      FieldName = 'CU_ADDRESS'
      Size = 255
    end
  end
  object dsSiteObjavs: TDataSource
    DataSet = cdsSiteObjavs
    Left = 600
    Top = 112
  end
  object cdsFormat: TClientDataSet
    Aggregates = <>
    Filter = 'FM_HAS_PICTURE<>1'
    Filtered = True
    Params = <>
    ReadOnly = True
    Left = 160
    Top = 136
    object cdsFormatFM_ID: TIntegerField
      FieldName = 'FM_ID'
      Required = True
    end
    object cdsFormatFM_NAME: TStringField
      FieldName = 'FM_NAME'
      Required = True
      Size = 128
    end
    object cdsFormatFM_SPACE: TFloatField
      FieldName = 'FM_SPACE'
    end
    object cdsFormatFM_ALWAYS_ADD_SUM: TSmallintField
      FieldName = 'FM_ALWAYS_ADD_SUM'
    end
    object cdsFormatFM_HAS_PICTURE: TSmallintField
      FieldName = 'FM_HAS_PICTURE'
      Required = True
    end
    object cdsFormatFM_PICTURE_SIZES: TStringField
      FieldName = 'FM_PICTURE_SIZES'
      Size = 128
    end
  end
  object dsFormat: TDataSource
    DataSet = cdsFormat
    Left = 248
    Top = 136
  end
  object dsRubrika: TDataSource
    DataSet = cdsRubrika
    Left = 245
    Top = 176
  end
  object cdsRubrika: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 157
    Top = 176
    object cdsRubrikaRB_ID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'RB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsRubrikaRB_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'RB_NAME'
      Required = True
      Size = 128
    end
    object cdsRubrikaRB_NAME_SHORT: TStringField
      DisplayLabel = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
      FieldName = 'RB_NAME_SHORT'
      Required = True
      Size = 64
    end
    object cdsRubrikaRB_COST_COEFF: TFloatField
      DisplayLabel = #1062#1077#1085#1086#1074#1086#1081' '#1082#1086#1101#1092#1080#1094#1080#1077#1085#1090
      FieldName = 'RB_COST_COEFF'
      DisplayFormat = '0.###'
    end
    object cdsRubrikaRB_IS_OBLOGKA: TSmallintField
      DisplayLabel = #1054#1073#1083#1086#1078#1082#1072
      FieldName = 'RB_IS_OBLOGKA'
      Required = True
    end
    object cdsRubrikaGZ_ID: TIntegerField
      FieldName = 'GZ_ID'
      Required = True
    end
    object cdsRubrikaRB_IS_LOCKABLE: TSmallintField
      FieldName = 'RB_IS_LOCKABLE'
      Required = True
    end
  end
  object qDelSiteObjav: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'is_module'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OB_ID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'EXECUTE PROCEDURE DELETE_SITE_OBJAV(:id,:is_module,:OB_ID)')
    SQLConnection = data.connection
    Left = 136
    Top = 224
  end
  object qGz: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = data.connection
    Left = 344
    Top = 176
  end
end
