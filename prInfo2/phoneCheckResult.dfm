object frmPhoneCheckResult: TfrmPhoneCheckResult
  Left = 474
  Top = 327
  Width = 505
  Height = 120
  BorderStyle = bsSizeToolWin
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1087#1088#1086#1074#1077#1088#1082#1080' '#1090#1077#1083#1077#1092#1086#1085#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBMemo1: TDBMemo
    Left = 0
    Top = 0
    Width = 497
    Height = 93
    Align = alClient
    DataField = 'PC_RESULT'
    DataSource = data.dsPhoneCheck
    TabOrder = 0
  end
end
