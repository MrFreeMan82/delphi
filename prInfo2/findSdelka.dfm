object frmFindSdelka: TfrmFindSdelka
  Left = 1064
  Top = 248
  Width = 830
  Height = 557
  Caption = #1055#1086#1080#1089#1082' '#1089#1076#1077#1083#1082#1080
  Color = clBtnFace
  TransparentColorValue = clBtnFace
  Constraints.MinHeight = 100
  Constraints.MinWidth = 100
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnHide = FormHide
  OnKeyPress = FormKeyPress
  DesignSize = (
    814
    519)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape3: TShape
    Left = 0
    Top = 37
    Width = 778
    Height = 1
    Pen.Color = clBtnShadow
  end
  object btSearch: TBitBtn
    Left = 704
    Top = 6
    Width = 71
    Height = 25
    Caption = #1055#1086#1080#1089#1082
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btSearchClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333300000333330000030F000333330F00030F000333330F000300000003000
      0000300F000000F00000300F000300F00000300F000300F00000330000000000
      00033330F00030F000333330000030000033333300033300033333330F03330F
      0333333300033300033333333333333333333333333333333333}
  end
  object DBGrid1: TDBGrid
    Left = 3
    Top = 76
    Width = 808
    Height = 400
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = data.dsFindSdelka
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'CU_COMPANY_ID'
        Title.Caption = #1048#1044
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SD_TYPE_DESC'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SD_NUM'
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SD_DATE'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AG_NAME'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CU_NAME'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PT_NAME_LK'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SD_ALL_PAYED_LK'
        Title.Caption = #1054#1087#1083'-'#1085#1086
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SD_SUM'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SD_FACT_NUM'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PODACHA_NUMS'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FM_NAME_LK'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RB_NAME_LK'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SD_ZAPAS'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SD_PAY_VER'
        Visible = False
      end>
  end
  object cbAllAgents: TCheckBox
    Left = 353
    Top = 11
    Width = 103
    Height = 17
    BiDiMode = bdLeftToRight
    Caption = #1055#1086' '#1074#1089#1077#1084' '#1072#1075#1077#1085#1090#1072#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 5
  end
  object rbByID: TRadioButton
    Left = 10
    Top = 11
    Width = 39
    Height = 17
    Caption = #1082#1086#1076
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TabStop = True
    OnClick = rbByIDClick
  end
  object rbByPhone: TRadioButton
    Left = 64
    Top = 11
    Width = 65
    Height = 17
    Caption = #1090#1077#1083#1077#1092#1086#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = rbByIDClick
  end
  object rbByFact: TRadioButton
    Left = 144
    Top = 11
    Width = 44
    Height = 17
    Caption = #1089#1095#1105#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = rbByIDClick
  end
  object edSearch: TMaskEdit
    Left = 469
    Top = 8
    Width = 116
    Height = 21
    TabOrder = 6
  end
  object rbByText: TRadioButton
    Left = 204
    Top = 11
    Width = 51
    Height = 17
    Caption = #1090#1077#1082#1089#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = rbByIDClick
  end
  object cbIssuePR: TDBLookupComboboxEh
    Left = 591
    Top = 8
    Width = 108
    Height = 21
    Enabled = False
    EditButtons = <>
    KeyField = 'IS_ID'
    ListField = 'IS_NAME_COMPOSED'
    ListSource = data.dsIssuePR
    TabOrder = 9
    Visible = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 778
    Height = 33
    BevelOuter = bvNone
    TabOrder = 10
    object Shape1: TShape
      Left = 0
      Top = 0
      Width = 778
      Height = 33
      Align = alClient
      Brush.Style = bsClear
      Pen.Color = clBtnShadow
    end
    object Label1: TLabel
      Left = 8
      Top = 10
      Width = 120
      Height = 13
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1087#1086' '#1086#1090#1082#1072#1079#1085#1080#1082#1091
    end
    object Shape4: TShape
      Left = 134
      Top = 3
      Width = 1
      Height = 27
      Pen.Color = clBtnShadow
    end
    object DBText1: TDBText
      Left = 143
      Top = 9
      Width = 52
      Height = 14
      AutoSize = True
      DataField = 'OT_CALC_DESCRIPTION'
      DataSource = data.dsCheckPhoneInOtkaznik
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object rbByOKPO: TRadioButton
    Left = 272
    Top = 11
    Width = 64
    Height = 17
    Caption = #1028#1044#1056#1055#1054#1059
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = rbByIDClick
  end
  object Panel2: TPanel
    Left = 0
    Top = 478
    Width = 814
    Height = 41
    Align = alBottom
    TabOrder = 11
    DesignSize = (
      814
      41)
    object btAdditional: TDropButt
      Left = 9
      Top = 8
      Width = 128
      Height = 25
      AllowAllUp = True
      GroupIndex = 1
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
      DropMenu = ppAdditional
      BlackArrow = False
    end
    object btEditText: TBitBtn
      Left = 256
      Top = 6
      Width = 201
      Height = 30
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100'/'#1080#1079#1084#1077#1085#1080#1090#1100' '#1090#1077#1082#1089#1090
      TabOrder = 0
      Visible = False
      OnClick = btEditTextClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDCCDDCDDD
        DDDDDDDCDDCCDCDDDDDDCDC0000DDDCDDDDDDCD08830DDDDDDDDDDD08B330DDD
        DDDDDDD0BBB330DDDDDDDDDD0BBB330DDDDDDDDDD0BBB330DDDDDDDDDD0BBB33
        0DDDDDDDDDD0BBB330DDDDDDDDDD0BB3000DDDDDDDDDD0B0330DDDDDDDDDDD00
        B30DDDDDDDDDDDD000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
    end
    object btViewSdelka: TBitBtn
      Left = 464
      Top = 6
      Width = 168
      Height = 30
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btViewSdelkaClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDD00
        DDDDDDDDDDDDD4EC0DDDDD0000004ECC00DDDD877774ECC770DDDD8FFF4ECC7F
        70DDDD80087CC7FF70DDD87E70887FFF70DD8FE7E707FFFF70DD8EFE7E07FFFF
        70DD8FEFE707FFFF70DDD8FEF07FFFFF70DDDD8807FFFFFF70DDDD8FFFFFFF00
        00DDDD8FFFFFFF7F8DDDDD8FFFFFFF78DDDDDD888888888DDDDD}
    end
    object btEditSdelka: TBitBtn
      Left = 637
      Top = 6
      Width = 168
      Height = 30
      Anchors = []
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btEditSdelkaClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDCCDDCDDD
        DDDDDDDCDDCCDCDDDDDDCDC0000DDDCDDDDDDCD08830DDDDDDDDDDD08B330DDD
        DDDDDDD0BBB330DDDDDDDDDD0BBB330DDDDDDDDDD0BBB330DDDDDDDDDD0BBB33
        0DDDDDDDDDD0BBB330DDDDDDDDDD0BB3000DDDDDDDDDD0B0330DDDDDDDDDDD00
        B30DDDDDDDDDDDD000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
    end
  end
  object ppAdditional: TPopupMenu
    Left = 160
    Top = 256
    object miGiveSdelka: TMenuItem
      Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1089#1076#1077#1083#1082#1091' '#1076#1088#1091#1075#1086#1084#1091' '#1072#1075#1077#1085#1090#1091
      OnClick = miGiveSdelkaClick
    end
    object miBeznalVNal: TMenuItem
      Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1089#1076#1077#1083#1082#1091' '#1041#1077#1079#1085#1072#1083'->'#1053#1072#1083
      OnClick = miBeznalVNalClick
    end
    object miNalVBeznal: TMenuItem
      Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1089#1076#1077#1083#1082#1091' '#1053#1072#1083'->'#1041#1077#1079#1085#1072#1083
      OnClick = miNalVBeznalClick
    end
    object miBeznalVKredit: TMenuItem
      Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1089#1076#1077#1083#1082#1091' '#1053#1072#1083'->'#1050#1088#1077#1076#1080#1090
      OnClick = miBeznalVKreditClick
    end
    object mnuKassaNal: TMenuItem
      Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1089#1076#1077#1083#1082#1091' '#1050#1072#1089#1089#1072' -> '#1053#1072#1083
      OnClick = mnuKassaNalClick
    end
    object mnuNalKassa: TMenuItem
      Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1089#1076#1077#1083#1082#1091' '#1053#1072#1083' -> '#1050#1072#1089#1089#1072
      OnClick = mnuNalKassaClick
    end
    object miPrintList: TMenuItem
      Caption = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1089#1087#1080#1089#1086#1082
      OnClick = miPrintListClick
    end
    object miPrintFactura: TMenuItem
      Action = frmMain.actPrintAcc
    end
    object miDeleteSdelka: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1076#1077#1083#1082#1091
      OnClick = miDeleteSdelkaClick
    end
  end
end
