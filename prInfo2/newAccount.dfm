object frmNewAccount: TfrmNewAccount
  Left = 872
  Top = 368
  BorderStyle = bsDialog
  Caption = #1053#1086#1074#1099#1081' '#1089#1095#1105#1090
  ClientHeight = 239
  ClientWidth = 330
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
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 57
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089#1095#1105#1090#1072
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 65
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1089#1095#1105#1090#1072
    FocusControl = edFactNum
  end
  object Label3: TLabel
    Left = 8
    Top = 104
    Width = 51
    Height = 13
    Caption = #1057#1082#1080#1076#1082#1072', %'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 152
    Width = 73
    Height = 13
    Caption = #1057#1091#1084#1084#1072' '#1089#1076#1077#1083#1082#1080
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 184
    Top = 8
    Width = 86
    Height = 13
    Caption = #1053#1086#1084#1077#1088#1072' '#1074#1099#1093#1086#1076#1086#1074
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 184
    Top = 56
    Width = 106
    Height = 13
    Caption = #1060#1086#1088#1084#1072#1090' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1103
  end
  object Label7: TLabel
    Left = 186
    Top = 104
    Width = 64
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
    FocusControl = DBEdit1
  end
  object Label8: TLabel
    Left = 184
    Top = 152
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
    FocusControl = DBEdit1
  end
  object DBEdit1: TDBEditEh
    Left = 8
    Top = 72
    Width = 153
    Height = 19
    AlwaysShowBorder = True
    DataField = 'SD_FACT_DATE'
    DataSource = dsAcc
    EditButtons = <>
    Flat = True
    MaxLength = 8
    TabOrder = 1
    Visible = True
    EditMask = '!99/99/00;1;_'
  end
  object edFactNum: TDBEditEh
    Left = 8
    Top = 24
    Width = 153
    Height = 19
    AlwaysShowBorder = True
    DataField = 'SD_FACT_NUM'
    DataSource = dsAcc
    EditButtons = <>
    Flat = True
    TabOrder = 0
    Visible = True
  end
  object DBEdit3: TDBEditEh
    Left = 8
    Top = 120
    Width = 153
    Height = 19
    AlwaysShowBorder = True
    DataField = 'SD_SKIDKA'
    DataSource = dsAcc
    EditButtons = <>
    Flat = True
    TabOrder = 2
    Visible = True
  end
  object DBEdit4: TDBEditEh
    Left = 8
    Top = 168
    Width = 153
    Height = 19
    AlwaysShowBorder = True
    DataField = 'SD_SUM'
    DataSource = dsAcc
    EditButtons = <>
    Flat = True
    TabOrder = 3
    Visible = True
  end
  object DBEdit5: TDBEditEh
    Left = 184
    Top = 24
    Width = 129
    Height = 19
    AlwaysShowBorder = True
    DataField = 'PODACHA_NUMS'
    DataSource = dsAcc
    EditButtons = <>
    Flat = True
    TabOrder = 4
    Visible = True
  end
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 184
    Top = 72
    Width = 129
    Height = 19
    AlwaysShowBorder = True
    DataField = 'FM_NAME'
    DataSource = dsAcc
    EditButtons = <>
    Flat = True
    KeyField = 'FM_NAME'
    ListField = 'FM_NAME'
    ListSource = data.dsFormat
    TabOrder = 5
    Visible = True
  end
  object BitBtn1: TBitBtn
    Left = 118
    Top = 208
    Width = 107
    Height = 25
    Caption = #1054#1082
    ModalResult = 1
    TabOrder = 6
    OnClick = BitBtn1Click
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000B0000000B0000000100
      04000000000058000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
      0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
      0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
      0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
  end
  object dbDateStart: TDBEditEh
    Left = 184
    Top = 120
    Width = 129
    Height = 19
    AlwaysShowBorder = True
    DataField = 'SD_KA_START_DATE'
    DataSource = dsAcc
    EditButtons = <>
    Flat = True
    MaxLength = 8
    TabOrder = 7
    Visible = True
    EditMask = '!99/99/00;1;_'
  end
  object dbDateEnd: TDBEditEh
    Left = 184
    Top = 168
    Width = 129
    Height = 19
    AlwaysShowBorder = True
    DataField = 'SD_KA_END_DATE'
    DataSource = dsAcc
    EditButtons = <>
    Flat = True
    MaxLength = 8
    TabOrder = 8
    Visible = True
    EditMask = '!99/99/00;1;_'
  end
  object dsAcc: TDataSource
    DataSet = rpAcc.cdsAcc
    Left = 112
    Top = 8
  end
  object qCustInfo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = data.connection
    Left = 88
    Top = 88
  end
end
