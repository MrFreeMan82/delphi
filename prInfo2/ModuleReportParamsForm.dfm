object frmModuleReportParams: TfrmModuleReportParams
  Left = 973
  Top = 385
  ActiveControl = btApprove
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1077#1095#1072#1090#1080' '#1084#1086#1076#1091#1083#1103
  ClientHeight = 136
  ClientWidth = 286
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object rgbFormat: TRadioGroup
    Left = 6
    Top = 4
    Width = 97
    Height = 97
    Caption = #1060#1086#1088#1084#1072#1090' '#1073#1091#1084#1072#1075#1080
    ItemIndex = 0
    Items.Strings = (
      'A5'
      'A4')
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 110
    Top = 4
    Width = 171
    Height = 97
    Caption = #1056#1072#1079#1084#1077#1088#1099
    TabOrder = 1
    object cbActualSize: TCheckBox
      Left = 8
      Top = 25
      Width = 146
      Height = 17
      Caption = #1042' '#1085#1072#1090#1091#1088#1072#1083#1100#1085#1091#1102' '#1074#1077#1083#1080#1095#1080#1085#1091
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object cbZoomed: TCheckBox
      Left = 8
      Top = 64
      Width = 137
      Height = 17
      Caption = #1059#1074#1077#1083#1080#1095#1077#1085#1085#1099#1081' '#1088#1072#1079#1084#1077#1088
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object btApprove: TBitBtn
    Left = 121
    Top = 107
    Width = 75
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
    Left = 203
    Top = 107
    Width = 75
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
end
