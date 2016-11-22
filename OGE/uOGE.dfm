object frmOGE: TfrmOGE
  Left = 0
  Top = 0
  Caption = #1054#1043#1069
  ClientHeight = 425
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object pgPages: TPageControl
    Left = 0
    Top = 0
    Width = 792
    Height = 425
    ActivePage = tabThemes
    Align = alClient
    MultiLine = True
    TabOrder = 0
    ExplicitWidth = 587
    ExplicitHeight = 393
    object tabInfo: TTabSheet
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object WebBrowser1: TWebBrowser
        Left = 0
        Top = 0
        Width = 579
        Height = 362
        Align = alClient
        TabOrder = 0
        OnDocumentComplete = WebBrowser1DocumentComplete
        ExplicitLeft = 104
        ExplicitTop = 104
        ExplicitWidth = 300
        ExplicitHeight = 150
        ControlData = {
          4C000000D73B00006A2500000100000001020000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126209000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
    object tabThemes: TTabSheet
      Caption = #1058#1077#1084#1099
      ImageIndex = 3
      ExplicitWidth = 579
      ExplicitHeight = 362
    end
    object tabTests: TTabSheet
      Caption = #1059#1095#1077#1073#1085#1086'-'#1090#1088#1077#1085#1080#1088#1086#1074#1086#1095#1085#1099#1077' '#1090#1077#1089#1090#1099
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object tabAlgebra: TTabSheet
      Caption = #1040#1083#1075#1077#1073#1088#1072
      ImageIndex = 1
      TabVisible = False
      ExplicitWidth = 579
      ExplicitHeight = 362
      object RadioGroup1: TRadioGroup
        Left = 0
        Top = 0
        Width = 784
        Height = 41
        Align = alTop
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
        TabOrder = 0
        ExplicitWidth = 579
      end
      object Panel2: TPanel
        Left = 0
        Top = 41
        Width = 784
        Height = 324
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        ShowCaption = False
        TabOrder = 1
        ExplicitWidth = 579
        ExplicitHeight = 292
      end
      object Panel1: TPanel
        Left = 0
        Top = 365
        Width = 784
        Height = 29
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitTop = 333
        ExplicitWidth = 579
        DesignSize = (
          784
          29)
        object Label1: TLabel
          Left = 5
          Top = 8
          Width = 40
          Height = 16
          Anchors = [akLeft, akBottom]
          Caption = #1054#1090#1074#1077#1090':'
        end
        object txtAnswer: TEdit
          Left = 42
          Top = 5
          Width = 183
          Height = 24
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
          Left = 678
          Top = 3
          Width = 50
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '<--'
          TabOrder = 3
          ExplicitLeft = 473
        end
        object btNext: TButton
          Left = 730
          Top = 3
          Width = 50
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '-->'
          TabOrder = 4
          ExplicitLeft = 525
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
    end
    object tabAdmin: TTabSheet
      Caption = 'Admin'
      ImageIndex = 2
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
  object ActionList: TActionList
    Left = 40
    Top = 312
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 49217
      OnExecute = Action1Execute
    end
  end
end
