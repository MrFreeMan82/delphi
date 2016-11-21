object frmNewTask: TfrmNewTask
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1053#1086#1074#1086#1077' '#1079#1072#1076#1072#1085#1080#1077
  ClientHeight = 361
  ClientWidth = 511
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 49
    Height = 16
    Caption = #1052#1086#1076#1091#1083#1100':'
  end
  object ComboBox1: TComboBox
    Left = 57
    Top = 5
    Width = 152
    Height = 24
    TabOrder = 0
    Text = 'ComboBox1'
  end
  object RadioGroup2: TRadioGroup
    Left = 2
    Top = 32
    Width = 505
    Height = 41
    Align = alCustom
    Caption = #1042#1072#1088#1080#1072#1085#1090
    Columns = 10
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10')
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 79
    Width = 508
    Height = 242
    BevelOuter = bvNone
    TabOrder = 2
    object ToolBar2: TToolBar
      Left = 0
      Top = 97
      Width = 508
      Height = 27
      ButtonHeight = 25
      ButtonWidth = 8
      Caption = 'ToolBar1'
      TabOrder = 0
      ExplicitTop = 104
      object SpeedButton1: TSpeedButton
        Left = 0
        Top = 0
        Width = 25
        Height = 25
        Caption = '+'
      end
      object SpeedButton2: TSpeedButton
        Left = 25
        Top = 0
        Width = 23
        Height = 25
        Caption = '-'
      end
    end
    object mText: TMemo
      Left = 0
      Top = 0
      Width = 508
      Height = 97
      Align = alTop
      TabOrder = 1
    end
    object DrawGrid1: TDrawGrid
      Left = 0
      Top = 124
      Width = 508
      Height = 118
      Align = alClient
      ColCount = 3
      FixedCols = 0
      RowCount = 2
      TabOrder = 2
      ExplicitLeft = 279
      ExplicitTop = 28
      ExplicitWidth = 296
      ExplicitHeight = 307
      ColWidths = (
        91
        103
        73)
    end
  end
  object Button1: TButton
    Left = 352
    Top = 331
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 3
  end
  object Button2: TButton
    Left = 433
    Top = 331
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
  end
  object OpenPicture: TOpenPictureDialog
    Left = 248
    Top = 16
  end
end
