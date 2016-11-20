object frmCustEdit: TfrmCustEdit
  Left = 811
  Top = 302
  BorderStyle = bsDialog
  Caption = #1050#1083#1080#1077#1085#1090
  ClientHeight = 500
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 5
    Top = 13
    Width = 56
    Height = 16
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 73
    Height = 16
    Caption = #1050#1086#1076' '#1028#1044#1056#1055#1054#1059
  end
  object Label3: TLabel
    Left = 5
    Top = 170
    Width = 237
    Height = 16
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1076#1083#1103' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1082#1083#1080#1077#1085#1090#1086#1074
  end
  object Bevel2: TBevel
    Left = 331
    Top = 2
    Width = 9
    Height = 495
    Shape = bsLeftLine
  end
  object Label7: TLabel
    Left = 422
    Top = 37
    Width = 124
    Height = 16
    Caption = #1048#1084#1077#1102#1097#1080#1077#1089#1103' '#1082#1083#1080#1077#1085#1090#1099
  end
  object Label4: TLabel
    Left = 8
    Top = 70
    Width = 17
    Height = 16
    Caption = #1048#1044
  end
  object Label5: TLabel
    Left = 8
    Top = 96
    Width = 79
    Height = 16
    Caption = 'Email('#1083#1086#1075#1080#1085'):'
  end
  object Label6: TLabel
    Left = 8
    Top = 126
    Width = 48
    Height = 16
    Caption = #1055#1072#1088#1086#1083#1100':'
  end
  object edName: TDBEditEh
    Left = 98
    Top = 12
    Width = 206
    Height = 24
    AlwaysShowBorder = True
    DataField = 'CU_NAME'
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Visible = True
  end
  object btDone: TBitBtn
    Left = 157
    Top = 464
    Width = 80
    Height = 25
    Caption = #1054#1082
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000B0000000B0000000100
      04000000000058000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
      0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
      0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
      0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
  end
  object btCancel: TBitBtn
    Left = 247
    Top = 464
    Width = 80
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 3
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000B0000000B0000000100
      04000000000058000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF0FFFFF0FF0
      0000F000FFF000F0000000000F0000000000F000000000F00000FF0000000FF0
      0000FFF00000FFF00000FF0000000FF00000F000000000F0000000000F000000
      0000F000FFF000F00000FF0FFFFF0FF00000}
  end
  object mmInfo: TDBRichEdit
    Left = 3
    Top = 192
    Width = 325
    Height = 268
    TabStop = False
    BevelKind = bkFlat
    BorderStyle = bsNone
    DataField = 'CU_INFO'
    PlainText = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object btCheckSpelling: TBitBtn
    Left = 4
    Top = 464
    Width = 115
    Height = 25
    Caption = #1054#1088#1092#1086#1075#1088#1072#1092#1080#1103
    TabOrder = 4
    TabStop = False
    Visible = False
    Glyph.Data = {
      E6000000424DE60000000000000076000000280000000E0000000E0000000100
      0400000000007000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999949999999
      9900999444F999999900994444F9999999009444F44F99999900444F9944F999
      990094F99994F9999900999999994F9999009999999994F9990099999999994F
      9900090900990094F90009090909090949000009009900999400090909990909
      99009099000900999900}
  end
  object edOKPO: TDBEditEh
    Left = 98
    Top = 38
    Width = 206
    Height = 24
    AlwaysShowBorder = True
    DataField = 'CU_OKPO'
    EditButtons = <>
    TabOrder = 5
    Visible = True
    OnExit = edOKPOExit
  end
  object Panel1: TPanel
    Left = 337
    Top = 3
    Width = 442
    Height = 22
    BevelOuter = bvLowered
    Color = clBtnShadow
    TabOrder = 6
  end
  object cbChooseCustUnique: TDBLookupComboboxEh
    Left = 532
    Top = 33
    Width = 237
    Height = 22
    AlwaysShowBorder = True
    DataField = 'CUQ_REG_ID'
    EditButtons = <>
    Flat = True
    KeyField = 'CUQ_REG_ID'
    ListField = 'CUQ_FULL_NAME'
    ListSource = data.dsCustUnique
    TabOrder = 7
    Visible = True
    OnChange = cbChooseCustUniqueChange
  end
  object Panel2: TPanel
    Left = 336
    Top = 57
    Width = 444
    Height = 441
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 8
    inline CustUnique: TfrmCustUnique
      Left = 3
      Top = 7
      Width = 436
      Height = 429
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object btFindCustUniques: TBitBtn
    Left = 338
    Top = 29
    Width = 79
    Height = 25
    Caption = #1053#1072#1081#1090#1080' >>'
    TabOrder = 9
    OnClick = btFindCustUniquesClick
  end
  object edID: TDBEditEh
    Left = 98
    Top = 66
    Width = 206
    Height = 24
    AlwaysShowBorder = True
    DataField = 'CU_COMPANY_ID'
    EditButtons = <>
    TabOrder = 10
    Visible = True
    OnExit = edOKPOExit
  end
  object dbPassw: TDBEditEh
    Left = 98
    Top = 122
    Width = 206
    Height = 24
    AlwaysShowBorder = True
    DataField = 'CU_PASSWORD'
    EditButtons = <>
    TabOrder = 11
    Visible = True
    OnExit = edOKPOExit
  end
  object dbEmail: TDBEdit
    Left = 98
    Top = 93
    Width = 206
    Height = 24
    BevelInner = bvNone
    BevelOuter = bvNone
    DataField = 'CU_EMAIL'
    TabOrder = 12
  end
end
