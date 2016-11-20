object frmChangeAgentForSdelka: TfrmChangeAgentForSdelka
  Left = 1040
  Top = 667
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1089#1076#1077#1083#1082#1091' '#1076#1088#1091#1075#1086#1084#1091' '#1072#1075#1077#1085#1090#1091
  ClientHeight = 37
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 211
    Height = 13
    Caption = #1040#1075#1077#1085#1090', '#1082#1086#1090#1086#1088#1086#1084#1091' '#1085#1091#1078#1085#1086' '#1087#1077#1088#1077#1076#1072#1090#1100' '#1089#1076#1077#1083#1082#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object cbChooseNewAgent: TDBLookupComboBox
    Left = 227
    Top = 8
    Width = 169
    Height = 21
    KeyField = 'AG_ID'
    ListField = 'AG_NAME'
    ListSource = data.dsAgentsList
    TabOrder = 0
  end
  object btChangeAgentForSdelka: TBitBtn
    Left = 404
    Top = 6
    Width = 78
    Height = 25
    Caption = #1055#1077#1088#1077#1076#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
    OnClick = btChangeAgentForSdelkaClick
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000B0000000B0000000100
      0400000000005800000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F0FFFFFFFFF0
      0000F00FFFFFFFF00000F000FFFFFFF00000F0000FFFFFF00000F00000FFFFF0
      0000F000000FFFF00000F00000FFFFF00000F0000FFFFFF00000F000FFFFFFF0
      0000F00FFFFFFFF00000F0FFFFFFFFF00000}
  end
  object BitBtn1: TBitBtn
    Left = 492
    Top = 6
    Width = 78
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 2
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
