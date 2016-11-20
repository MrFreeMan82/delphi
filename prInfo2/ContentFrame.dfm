object frameContent: TframeContent
  Left = 0
  Top = 0
  Width = 780
  Height = 473
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 780
    Height = 473
    ActivePage = tabPicture
    Align = alClient
    TabOrder = 0
    object tabPicture: TTabSheet
      Caption = #1052#1086#1076#1091#1083#1100
      TabVisible = False
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 448
        Height = 463
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object ScrollBox1: TScrollBox
          Left = 0
          Top = 0
          Width = 448
          Height = 364
          Align = alClient
          BevelKind = bkSoft
          BorderStyle = bsNone
          TabOrder = 0
          object img: TImage
            Left = 0
            Top = 0
            Width = 444
            Height = 360
            Align = alClient
            AutoSize = True
            Proportional = True
            Stretch = True
          end
          object shpHider1: TShape
            Left = 0
            Top = 0
            Width = 444
            Height = 360
            Align = alClient
            Brush.Style = bsBDiagonal
            Pen.Style = psClear
            Visible = False
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 364
          Width = 448
          Height = 31
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          DesignSize = (
            448
            31)
          object shpHider2: TShape
            Left = 1
            Top = 1
            Width = 446
            Height = 29
            Align = alClient
            Brush.Style = bsBDiagonal
            Pen.Style = psClear
            Visible = False
          end
          object cbScale: TDBCheckBoxEh
            Left = 7
            Top = 8
            Width = 162
            Height = 17
            AlwaysShowBorder = True
            Anchors = [akLeft, akBottom]
            Caption = #1052#1072#1089#1096#1090#1072#1073#1080#1088#1086#1074#1072#1090#1100' '#1082#1072#1088#1090#1080#1085#1082#1091
            Checked = True
            Flat = True
            State = cbChecked
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = cbScaleClick
          end
          object btSave: TBitBtn
            Left = 310
            Top = 3
            Width = 132
            Height = 25
            Anchors = [akRight]
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083
            TabOrder = 1
            TabStop = False
            OnClick = btSaveClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
              9999990000000000000990330000003303099033000000330309903300000033
              0309903300000000030990333333333333099033000000003309903099999999
              0309903099999999030990309999999903099030999999990309903099999999
              0009903099999999030990000000000000099999999999999999}
          end
          object btPrint: TBitBtn
            Left = 198
            Top = 3
            Width = 108
            Height = 25
            Anchors = [akRight]
            Caption = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100
            TabOrder = 2
            TabStop = False
            OnClick = btPrintClick
            Glyph.Data = {
              E6000000424DE6000000000000007600000028000000100000000E0000000100
              04000000000070000000CE0E0000D80E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00990000000000
              0999907777777770709900000000000007090777777BBB770009077777788877
              0709000000000000077007777777777070709000000000070700990FFF777770
              70709990F00000F000099990FFFFFFFF099999990F00000F099999990FFFFFFF
              F0999999900000000099}
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 395
          Width = 448
          Height = 68
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          DesignSize = (
            448
            68)
          object Label5: TLabel
            Left = 6
            Top = 47
            Width = 85
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = #1050#1086#1083'-'#1074#1086' '#1074#1072#1082#1072#1085#1089#1080#1081
          end
          object Label3: TLabel
            Left = 160
            Top = 47
            Width = 86
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = #1057#1090#1088#1072#1085#1080#1094#1072' '#1074' Corel'
          end
          object Label1: TLabel
            Left = 211
            Top = 11
            Width = 42
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = #1056#1091#1073#1088#1080#1082#1072
          end
          object Shape3: TShape
            Left = 203
            Top = 3
            Width = 1
            Height = 29
            Anchors = [akLeft, akBottom]
            Pen.Color = clBtnShadow
          end
          object Label2: TLabel
            Left = 6
            Top = 11
            Width = 38
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = #1060#1086#1088#1084#1072#1090
          end
          object Shape1: TShape
            Left = 4
            Top = 35
            Width = 610
            Height = 1
            Anchors = [akLeft, akRight, akBottom]
            Pen.Color = clBtnShadow
          end
          object shpHider3: TShape
            Left = 0
            Top = 0
            Width = 448
            Height = 68
            Align = alClient
            Brush.Style = bsBDiagonal
            Pen.Style = psClear
            Visible = False
          end
          object Shape5: TShape
            Left = 152
            Top = 39
            Width = 1
            Height = 28
            Anchors = [akLeft, akBottom]
            Pen.Color = clBtnShadow
          end
          object DBNumberEditEh1: TDBNumberEditEh
            Left = 95
            Top = 44
            Width = 50
            Height = 19
            AlwaysShowBorder = True
            DataField = 'VAC_COUNT'
            DataSource = dsContent
            EditButtons = <>
            Flat = True
            ReadOnly = True
            TabOrder = 3
            Visible = True
          end
          object DBEditEh1: TDBEditEh
            Left = 250
            Top = 44
            Width = 192
            Height = 19
            AlwaysShowBorder = True
            Anchors = [akLeft, akRight, akBottom]
            DataField = 'CONTENT_COREL_PAGE'
            DataSource = dsContent
            EditButtons = <>
            Flat = True
            TabOrder = 2
            Visible = True
          end
          object DBLookupComboboxEh1: TDBLookupComboboxEh
            Left = 256
            Top = 8
            Width = 188
            Height = 19
            AlwaysShowBorder = True
            Anchors = [akLeft, akRight, akBottom]
            DataField = 'RB_ID'
            DataSource = dsContent
            EditButtons = <>
            Flat = True
            KeyField = 'RB_ID'
            ListField = 'RB_NAME_SHORT'
            ListSource = dsContentRubrika
            TabOrder = 1
            Visible = True
            OnEnter = DBLookupComboboxEh2Enter
          end
          object DBLookupComboboxEh2: TDBLookupComboboxEh
            Left = 50
            Top = 8
            Width = 146
            Height = 19
            AlwaysShowBorder = True
            Anchors = [akLeft, akBottom]
            DataField = 'FM_ID'
            DataSource = dsContent
            EditButtons = <>
            Flat = True
            KeyField = 'FM_ID'
            ListField = 'FM_NAME'
            ListSource = dsContentFormat
            TabOrder = 0
            Visible = True
            OnEnter = DBLookupComboboxEh2Enter
          end
        end
      end
      object Panel4: TPanel
        Left = 448
        Top = 0
        Width = 324
        Height = 463
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 324
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Panel3'
          TabOrder = 0
          DesignSize = (
            324
            25)
          object Shape2: TShape
            Left = 0
            Top = 0
            Width = 324
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
            Caption = '  '#1054#1073#1098#1103#1074#1083#1077#1085#1080#1103' '#1085#1072' '#1089#1072#1081#1090' '#1076#1083#1103' '#1101#1090#1086#1075#1086' '#1084#1086#1076#1091#1083#1103
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object btAddSiteObjav: TBitBtn
            Left = 239
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
            Left = 267
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
            Left = 295
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
          Width = 324
          Height = 407
          Align = alClient
          Color = clBtnFace
          DataSource = dsSiteObjavs
          FixedColor = clSkyBlue
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghHighlightFocus, dghClearSelection]
          PopupMenu = popCopy
          RowHeight = 40
          RowSizingAllowed = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'RS_NAME'
              Footers = <>
              Width = 54
            end
            item
              EditButtons = <>
              FieldName = 'SITE_VACANCY_NAME'
              Footers = <>
              Title.Caption = #1042#1072#1082#1072#1085#1089#1080#1103
              Width = 66
            end
            item
              EditButtons = <>
              FieldName = 'SITE_OBJAV_TEXT'
              Footers = <>
              Width = 194
            end>
        end
        object Panel6: TPanel
          Left = 0
          Top = 432
          Width = 324
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
            DataField = 'CONTENT_SITE_OBJAV_ADDED'
            DataSource = dsContent
            Flat = True
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
    end
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
      '    OC.FM_ID,'
      '    OC.RB_ID,'
      '    OC.CONTENT_ID,'
      '    OC.CONTENT_PICTURE,'
      '    OC.CONTENT_COREL_PAGE,'
      '    OC.CONTENT_SITE_OBJAV_ADDED,'
      '    OC.VAC_COUNT,'
      '    OC.EXTENSION'
      'FROM'
      '    OBJAV_CONTENT OC'
      'WHERE'
      '    OC.CONTENT_ID=:CONTENT_ID')
    SQLConnection = data.connection
    Left = 124
    Top = 16
    object qryContentCONTENT_PICTURE: TBlobField
      FieldName = 'CONTENT_PICTURE'
      ProviderFlags = []
      Size = 1
    end
    object qryContentCONTENT_COREL_PAGE: TStringField
      FieldName = 'CONTENT_COREL_PAGE'
      Size = 32
    end
    object qryContentCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryContentRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object qryContentFM_ID: TIntegerField
      FieldName = 'FM_ID'
      Required = True
    end
    object qryContentCONTENT_SITE_OBJAV_ADDED: TSmallintField
      FieldName = 'CONTENT_SITE_OBJAV_ADDED'
    end
    object qryContentVAC_COUNT: TSmallintField
      FieldName = 'VAC_COUNT'
      Required = True
    end
    object qryContentEXTENSION: TStringField
      FieldName = 'EXTENSION'
      Size = 5
    end
  end
  object prvContent: TDataSetProvider
    DataSet = qryContent
    OnGetTableName = prvContentGetTableName
    Left = 204
    Top = 16
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
    Top = 16
    object cdsContentCONTENT_PICTURE: TBlobField
      FieldName = 'CONTENT_PICTURE'
      ProviderFlags = []
      Size = 1
    end
    object cdsContentCONTENT_COREL_PAGE: TStringField
      FieldName = 'CONTENT_COREL_PAGE'
      Size = 32
    end
    object cdsContentCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContentRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object cdsContentFM_ID: TIntegerField
      FieldName = 'FM_ID'
      Required = True
    end
    object cdsContentLK_RUBRIKA: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_RUBRIKA'
      LookupDataSet = data.tblRubrika
      LookupKeyFields = 'RB_ID'
      LookupResultField = 'RB_NAME_SHORT'
      KeyFields = 'RB_ID'
      Lookup = True
    end
    object cdsContentLK_FORMAT: TStringField
      FieldKind = fkLookup
      FieldName = 'LK_FORMAT'
      LookupDataSet = data.tblFormat
      LookupKeyFields = 'FM_ID'
      LookupResultField = 'FM_NAME'
      KeyFields = 'FM_ID'
      Lookup = True
    end
    object cdsContentCONTENT_SITE_OBJAV_ADDED: TSmallintField
      FieldName = 'CONTENT_SITE_OBJAV_ADDED'
    end
    object cdsContentVAC_COUNT: TSmallintField
      DefaultExpression = '1'
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1074#1072#1082#1072#1085#1089#1080#1081
      FieldName = 'VAC_COUNT'
      Required = True
    end
    object cdsContentEXTENSION: TStringField
      FieldName = 'EXTENSION'
      Size = 5
    end
  end
  object dsContent: TDataSource
    DataSet = cdsContent
    Left = 360
    Top = 80
  end
  object cdsContentFormat: TClientDataSet
    Aggregates = <>
    Params = <>
    ReadOnly = True
    Left = 128
    Top = 72
    object cdsContentFormatFM_ID: TIntegerField
      FieldName = 'FM_ID'
      Required = True
    end
    object cdsContentFormatFM_NAME: TStringField
      FieldName = 'FM_NAME'
      Required = True
      Size = 128
    end
    object cdsContentFormatFM_SPACE: TFloatField
      FieldName = 'FM_SPACE'
    end
    object cdsContentFormatFM_ALWAYS_ADD_SUM: TSmallintField
      FieldName = 'FM_ALWAYS_ADD_SUM'
    end
    object cdsContentFormatFM_HAS_PICTURE: TSmallintField
      FieldName = 'FM_HAS_PICTURE'
      Required = True
    end
    object cdsContentFormatFM_PICTURE_SIZES: TStringField
      FieldName = 'FM_PICTURE_SIZES'
      Size = 128
    end
  end
  object dsContentFormat: TDataSource
    DataSet = cdsContentFormat
    Left = 208
    Top = 72
  end
  object qrySiteObjavs: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CONTENT_ID'
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
      '   ,SO.CONTENT_ID'
      '   ,RS.RS_NAME'
      '   ,SO.CU_ADDRESS'
      'FROM SITE_OBJAV so'
      'LEFT JOIN RUBRIKA_SITE rs ON (rs.RS_ID = so.RS_ID)'
      'WHERE so.CONTENT_ID = :CONTENT_ID')
    SQLConnection = data.connection
    Left = 128
    Top = 128
    object qrySiteObjavsSITE_OBJAV_ID: TIntegerField
      FieldName = 'SITE_OBJAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrySiteObjavsCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySiteObjavsRS_ID: TIntegerField
      FieldName = 'RS_ID'
      ProviderFlags = []
    end
    object qrySiteObjavsSITE_OBJAV_TEXT: TStringField
      FieldName = 'SITE_OBJAV_TEXT'
      ProviderFlags = []
      Size = 2047
    end
    object qrySiteObjavsRS_NAME: TStringField
      FieldName = 'RS_NAME'
      ProviderFlags = []
      Size = 128
    end
    object qrySiteObjavsSITE_VACANCY_NAME: TStringField
      FieldName = 'SITE_VACANCY_NAME'
      Size = 128
    end
    object qrySiteObjavsSITE_EMAIL: TStringField
      FieldName = 'SITE_EMAIL'
      Size = 128
    end
    object qrySiteObjavsSITE_TEL: TStringField
      FieldName = 'SITE_TEL'
      Size = 128
    end
    object qrySiteObjavsSITE_CONTACT: TStringField
      FieldName = 'SITE_CONTACT'
      Size = 255
    end
    object qrySiteObjavsSITE_EMPLOYER: TStringField
      FieldName = 'SITE_EMPLOYER'
      Size = 255
    end
    object qrySiteObjavsCU_ADDRESS: TStringField
      FieldName = 'CU_ADDRESS'
      Size = 255
    end
  end
  object prvSiteObjavs: TDataSetProvider
    DataSet = qrySiteObjavs
    Left = 204
    Top = 128
  end
  object cdsSiteObjavs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSiteObjavs'
    Left = 244
    Top = 128
    object cdsSiteObjavsSITE_EMAIL: TStringField
      FieldName = 'SITE_EMAIL'
      Size = 128
    end
    object cdsSiteObjavsSITE_TEL: TStringField
      FieldName = 'SITE_TEL'
      Size = 128
    end
    object cdsSiteObjavsSITE_CONTACT: TStringField
      FieldName = 'SITE_CONTACT'
      Size = 255
    end
    object cdsSiteObjavsSITE_OBJAV_ID: TIntegerField
      FieldName = 'SITE_OBJAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsSiteObjavsCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSiteObjavsRS_ID: TIntegerField
      FieldName = 'RS_ID'
      Origin = 'SITE_OBJAV.RS_ID'
      Required = True
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
    object cdsSiteObjavsSITE_EMPLOYER: TStringField
      FieldName = 'SITE_EMPLOYER'
      Size = 255
    end
    object cdsSiteObjavsCU_ADDRESS: TStringField
      FieldName = 'CU_ADDRESS'
      Size = 255
    end
  end
  object dsSiteObjavs: TDataSource
    DataSet = cdsSiteObjavs
    Left = 360
    Top = 128
  end
  object SimpleDataSet1: TSimpleDataSet
    Aggregates = <>
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 240
    Top = 224
  end
  object popCopy: TPopupMenu
    Left = 528
    Top = 104
    object N1: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100
      OnClick = N2Click
    end
  end
  object spCopySiteObjav: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SITE_OBJAV_ID_FROM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CONTENT_ID_TO'
        ParamType = ptInput
      end>
    SQLConnection = data.connection
    StoredProcName = 'COPY_SITE_OBJAV_ID'
    Left = 132
    Top = 297
  end
  object cdsContentRubrika: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 288
    object cdsContentRubrikaRB_ID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'RB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsContentRubrikaRB_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'RB_NAME'
      Required = True
      Size = 128
    end
    object cdsContentRubrikaRB_NAME_SHORT: TStringField
      DisplayLabel = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
      FieldName = 'RB_NAME_SHORT'
      Required = True
      Size = 64
    end
    object cdsContentRubrikaRB_COST_COEFF: TFloatField
      DisplayLabel = #1062#1077#1085#1086#1074#1086#1081' '#1082#1086#1101#1092#1080#1094#1080#1077#1085#1090
      FieldName = 'RB_COST_COEFF'
      DisplayFormat = '0.###'
    end
    object cdsContentRubrikaRB_IS_OBLOGKA: TSmallintField
      DisplayLabel = #1054#1073#1083#1086#1078#1082#1072
      FieldName = 'RB_IS_OBLOGKA'
      Required = True
    end
    object cdsContentRubrikaGZ_ID: TIntegerField
      FieldName = 'GZ_ID'
      Required = True
    end
    object cdsContentRubrikaRB_IS_LOCKABLE: TSmallintField
      FieldName = 'RB_IS_LOCKABLE'
      Required = True
    end
  end
  object dsContentRubrika: TDataSource
    DataSet = cdsContentRubrika
    Left = 240
    Top = 288
  end
end
