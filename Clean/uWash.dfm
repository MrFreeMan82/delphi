object frmMain: TfrmMain
  Left = 0
  Top = 0
  ClientHeight = 361
  ClientWidth = 634
  Color = clBtnFace
  DockSite = True
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
  object pgView: TPageControl
    Left = 0
    Top = 0
    Width = 634
    Height = 342
    ActivePage = tabOperator
    Align = alClient
    TabOrder = 0
    object tabOperator: TTabSheet
      Caption = #1054#1087#1077#1088#1072#1090#1086#1088
    end
    object tabDirector: TTabSheet
      Caption = #1044#1080#1088#1077#1082#1090#1086#1088
      ImageIndex = 1
    end
    object tabAdmin: TTabSheet
      Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
      ImageIndex = 2
    end
    object tabReports: TTabSheet
      Caption = #1054#1090#1095#1077#1090#1099
      ImageIndex = 3
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 342
    Width = 634
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object ApplicationEvents: TApplicationEvents
    OnException = ApplicationEventsException
    Left = 232
    Top = 56
  end
end
