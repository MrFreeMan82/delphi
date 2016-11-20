object frmRepAccParams: TfrmRepAccParams
  Left = 539
  Top = 232
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1072#1084#1077#1090#1088#1099' '#1089#1095#1105#1090#1072'-'#1092#1072#1082#1090#1091#1088#1099
  ClientHeight = 135
  ClientWidth = 256
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
  object rgLogo: TRadioGroup
    Left = 8
    Top = 8
    Width = 145
    Height = 121
    Caption = #1051#1086#1075#1086#1090#1080#1087
    ItemIndex = 0
    Items.Strings = (
      #1055#1088#1086#1087#1086#1085#1091#1102' '#1088#1086#1073#1086#1090#1091
      #1057#1088#1086#1095#1085#1086' '#1090#1088#1077#1073#1091#1102#1090#1089#1103
      #1055#1056' + '#1057#1058)
    TabOrder = 0
  end
  object rgOrgData: TRadioGroup
    Left = 160
    Top = 8
    Width = 89
    Height = 89
    Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
    ItemIndex = 1
    Items.Strings = (
      #1057#1090#1072#1088#1099#1077
      #1053#1086#1074#1099#1077)
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 163
    Top = 104
    Width = 84
    Height = 25
    Caption = #1054#1082
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
end
