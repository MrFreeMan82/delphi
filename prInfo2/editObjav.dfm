object frmEditObjav: TfrmEditObjav
  Left = 716
  Top = 224
  BorderStyle = bsDialog
  Caption = #1054#1073#1098#1103#1074#1083#1077#1085#1080#1077
  ClientHeight = 412
  ClientWidth = 608
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btShowAudit: TSpeedButton
    Left = 6
    Top = 5
    Width = 64
    Height = 22
    Caption = #1040#1091#1076#1080#1090'...'
    Flat = True
  end
  object Panel1: TPanel
    Left = 494
    Top = 111
    Width = 102
    Height = 30
    BevelOuter = bvNone
    TabOrder = 0
    object btIntObjav: TButton
      Left = 7
      Top = 3
      Width = 89
      Height = 25
      Caption = #1048#1085#1092'. '#1076#1083#1103' '#1080#1085#1090'.'
      TabOrder = 0
    end
  end
  inline objava: TfrmObjava
    Left = 0
    Top = 0
    Width = 608
    Height = 410
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    inherited pnlHolder: TPanel
      Width = 608
      Height = 410
      inherited pnlAgent: TPanel
        Top = 374
        Width = 608
        inherited Shape6: TShape
          Width = 608
        end
      end
      inherited pnlText: TPanel
        Width = 608
        Height = 195
      end
      inherited pnlCopyTo: TPanel
        Width = 608
        inherited Shape2: TShape
          Width = 608
        end
      end
      inherited pnlComment: TPanel
        Width = 608
        inherited Shape1: TShape
          Width = 608
        end
      end
      inherited pnlProperties: TPanel
        Width = 608
        inherited Shape5: TShape
          Width = 608
        end
      end
      inherited pnlPubl: TPanel
        Top = 338
        Width = 608
        inherited Shape4: TShape
          Width = 608
        end
      end
      inherited pnlRubrikaSite: TPanel
        Width = 608
        inherited Shape9: TShape
          Width = 608
        end
      end
    end
  end
  object Timer1: TTimer
    Interval = 2000
    Left = 184
    Top = 160
  end
end
