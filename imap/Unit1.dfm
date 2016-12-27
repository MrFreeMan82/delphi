object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 528
  ClientWidth = 981
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 35
    Height = 16
    Caption = #1064#1083#1102#1079
  end
  object Label2: TLabel
    Left = 24
    Top = 45
    Width = 109
    Height = 16
    Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  end
  object Label3: TLabel
    Left = 24
    Top = 75
    Width = 43
    Height = 16
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object Label4: TLabel
    Left = 24
    Top = 105
    Width = 43
    Height = 16
    Caption = #1057#1077#1088#1074#1077#1088
  end
  object Label5: TLabel
    Left = 24
    Top = 135
    Width = 28
    Height = 16
    Caption = #1055#1086#1088#1090
  end
  object txtGate: TEdit
    Left = 142
    Top = 13
    Width = 155
    Height = 24
    TabOrder = 0
    Text = 'OGESYNC@yandex.ru'
  end
  object txtUser: TEdit
    Left = 142
    Top = 42
    Width = 155
    Height = 24
    TabOrder = 1
    Text = 'OGESYNC'
  end
  object txtPassword: TEdit
    Left = 142
    Top = 72
    Width = 155
    Height = 24
    TabOrder = 2
    Text = 'SYNCOGE'
  end
  object txtSendServer: TEdit
    Left = 142
    Top = 102
    Width = 155
    Height = 24
    TabOrder = 3
    Text = 'smtp.yandex.ru'
  end
  object txtSendPort: TEdit
    Left = 142
    Top = 132
    Width = 155
    Height = 24
    TabOrder = 4
    Text = '465'
  end
  object btLoginSend: TButton
    Left = 24
    Top = 168
    Width = 273
    Height = 25
    Caption = #1051#1086#1075#1080#1085'/'#1054#1090#1087#1088#1072#1074#1080#1090#1100
    TabOrder = 5
    OnClick = btLoginSendClick
  end
  object memOutput: TMemo
    Left = 0
    Top = 382
    Width = 981
    Height = 146
    Align = alBottom
    ScrollBars = ssVertical
    TabOrder = 6
    ExplicitTop = 448
    ExplicitWidth = 635
  end
  object btLoginRecive: TButton
    Left = 512
    Top = 336
    Width = 273
    Height = 25
    Caption = #1051#1086#1075#1080#1085'/'#1055#1086#1083#1091#1095#1080#1090#1100
    TabOrder = 7
    OnClick = btLoginReciveClick
  end
  object memMessageList: TMemo
    Left = 303
    Top = 8
    Width = 670
    Height = 185
    ScrollBars = ssVertical
    TabOrder = 8
  end
end
