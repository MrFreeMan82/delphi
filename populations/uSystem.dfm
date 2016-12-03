object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1080#1089#1090#1077#1084#1072
  ClientHeight = 481
  ClientWidth = 844
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 60
    Width = 88
    Height = 16
    Caption = #1087#1088#1080#1088#1086#1089#1090' '#1078#1077#1088#1090#1074
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 163
    Height = 16
    Caption = #1074#1077#1083#1080#1095#1080#1085#1072' '#1087#1086#1087#1091#1083#1103#1094#1080#1080' '#1078#1077#1088#1090#1074
  end
  object Label3: TLabel
    Left = 8
    Top = 115
    Width = 169
    Height = 16
    Caption = #1074#1077#1088#1086#1103#1090#1085#1086#1089#1090#1100' '#1089#1084#1077#1088#1090#1080' '#1078#1077#1088#1090#1074#1099
  end
  object Label4: TLabel
    Left = 8
    Top = 188
    Width = 184
    Height = 16
    Caption = #1074#1077#1083#1080#1095#1080#1085#1072' '#1087#1086#1087#1091#1083#1103#1094#1080#1080' '#1093#1080#1097#1085#1080#1082#1086#1074
  end
  object Label5: TLabel
    Left = 8
    Top = 292
    Width = 218
    Height = 16
    Caption = #1074#1077#1088#1086#1103#1090#1085#1086#1089#1090#1100' '#1093#1080#1097#1085#1080#1082#1091' '#1089#1100#1077#1089#1090#1100' '#1078#1077#1088#1090#1074#1091
  end
  object Label7: TLabel
    Left = 8
    Top = 369
    Width = 63
    Height = 16
    Caption = #1055#1086#1082#1086#1083#1077#1085#1080#1103
  end
  object Label8: TLabel
    Left = 8
    Top = 240
    Width = 174
    Height = 16
    Caption = #1074#1077#1088#1086#1103#1090#1085#1086#1089#1090#1100' '#1089#1084#1077#1088#1090#1080' '#1093#1080#1097#1085#1080#1082#1072
  end
  object txtGenVictims: TEdit
    Left = 8
    Top = 82
    Width = 121
    Height = 24
    TabOrder = 0
    Text = '0.1'
  end
  object txtBeginVictims: TEdit
    Left = 8
    Top = 30
    Width = 121
    Height = 24
    TabOrder = 1
    Text = '500'
  end
  object txtPredatorDeath: TEdit
    Left = 8
    Top = 262
    Width = 121
    Height = 24
    TabOrder = 2
    Text = '0.05'
  end
  object txtBeginPredator: TEdit
    Left = 8
    Top = 210
    Width = 121
    Height = 24
    TabOrder = 3
    Text = '50'
  end
  object txtPredatorCanEatVictim: TEdit
    Left = 8
    Top = 314
    Width = 121
    Height = 24
    TabOrder = 4
    Text = '0.000041'
  end
  object txtPeriod: TEdit
    Left = 8
    Top = 391
    Width = 121
    Height = 24
    TabOrder = 5
    Text = '100'
  end
  object btCalc: TButton
    Left = 664
    Top = 454
    Width = 75
    Height = 25
    Caption = #1056#1072#1089#1095#1080#1090#1072#1090#1100
    TabOrder = 6
    OnClick = btCalcClick
  end
  object btExit: TButton
    Left = 761
    Top = 454
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 7
    OnClick = btExitClick
  end
  object Chart1: TChart
    Left = 240
    Top = -1
    Width = 603
    Height = 448
    Title.Text.Strings = (
      'TChart')
    View3D = False
    TabOrder = 8
    object Series2: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      Title = #1046#1077#1088#1090#1074#1072
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series1: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      Title = #1061#1080#1097#1085#1080#1082
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object txtVictimDeath: TEdit
    Left = 8
    Top = 137
    Width = 121
    Height = 24
    TabOrder = 9
    Text = '0.0018'
  end
end
