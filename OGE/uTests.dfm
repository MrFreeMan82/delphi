object frmTests: TfrmTests
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  ClientHeight = 277
  ClientWidth = 541
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 248
    Width = 541
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      541
      29)
    object Label1: TLabel
      Left = 5
      Top = 8
      Width = 36
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1054#1090#1074#1077#1090':'
    end
    object txtAnswer: TEdit
      Left = 42
      Top = 5
      Width = 183
      Height = 21
      Anchors = [akLeft, akBottom]
      TabOrder = 0
    end
    object btAnswear: TButton
      Left = 228
      Top = 3
      Width = 61
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1054#1090#1074#1077#1090#1080#1090#1100
      TabOrder = 1
      OnClick = btAnswearClick
    end
    object Button2: TButton
      Left = 292
      Top = 3
      Width = 61
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1055#1086#1076#1089#1082#1072#1079#1082#1072
      TabOrder = 2
    end
    object btBack: TButton
      Left = 435
      Top = 3
      Width = 50
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '<--'
      TabOrder = 3
      OnClick = btBackClick
    end
    object btNext: TButton
      Left = 487
      Top = 3
      Width = 50
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '-->'
      TabOrder = 4
      OnClick = btNextClick
    end
    object Button1: TButton
      Left = 356
      Top = 3
      Width = 61
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      TabOrder = 5
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 541
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object cboModule: TComboBox
      Left = 5
      Top = 11
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 0
      OnChange = cboModuleChange
    end
    object rgVariants: TRadioGroup
      Left = 156
      Top = 2
      Width = 381
      Height = 33
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
      OnClick = rgVariantsClick
    end
  end
  object webTasks: TWebBrowser
    Left = 0
    Top = 41
    Width = 541
    Height = 207
    Align = alClient
    PopupMenu = PopupMenu1
    TabOrder = 2
    OnDocumentComplete = webTasksDocumentComplete
    ExplicitLeft = 117
    ExplicitTop = 64
    ExplicitWidth = 300
    ExplicitHeight = 150
    ControlData = {
      4C000000EA370000651500000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126209000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object PopupMenu1: TPopupMenu
    Left = 168
    Top = 144
    object mNewTask: TMenuItem
      Caption = 'New Task'
      ShortCut = 49230
      OnClick = mNewTaskClick
    end
  end
end
