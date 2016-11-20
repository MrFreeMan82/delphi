object frmObjavlenie: TfrmObjavlenie
  Left = 683
  Top = 197
  Width = 822
  Height = 590
  Caption = #1052#1086#1076#1091#1083#1100#1085#1086#1077' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inline frameObjavlenie: TframeObjavlenie
    Left = 0
    Top = 0
    Width = 806
    Height = 511
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    inherited Panel1: TPanel
      Top = 438
      Width = 806
      DesignSize = (
        806
        73)
      inherited Shape2: TShape
        Width = 796
      end
      inherited Shape4: TShape
        Left = 592
      end
      inherited btnChangeMdl: TSpeedButton
        Left = 599
        Top = 7
      end
      inherited Shape5: TShape
        Left = 217
      end
      inherited btMdlText: TSpeedButton
        Left = 699
        Top = 7
        OnClick = frameObjavleniebtMdlTextClick
      end
      inherited cbObjavlenieDoubleRubrika: TDBLookupComboboxEh
        Width = 219
      end
    end
    inherited Panel2: TPanel
      Width = 806
      Height = 438
      inherited frameContent: TframeContent
        Width = 788
        Height = 420
        inherited PageControl1: TPageControl
          Width = 788
          Height = 420
          inherited tabPicture: TTabSheet
            inherited Panel5: TPanel
              Width = 456
              Height = 410
              inherited ScrollBox1: TScrollBox
                Width = 456
                Height = 311
                inherited img: TImage
                  Width = 452
                  Height = 307
                end
                inherited shpHider1: TShape
                  Width = 452
                  Height = 307
                end
              end
              inherited Panel1: TPanel
                Top = 311
                Width = 456
                inherited shpHider2: TShape
                  Width = 454
                end
                inherited btSave: TBitBtn
                  Left = 212
                  OnClick = frameContentbtSaveClick
                end
                inherited btPrint: TBitBtn
                  Left = 348
                end
              end
              inherited Panel2: TPanel
                Top = 342
                Width = 456
                inherited Shape1: TShape
                  Width = 1211
                end
                inherited shpHider3: TShape
                  Width = 456
                end
                inherited DBEditEh1: TDBEditEh
                  Width = 360
                  TabOrder = 0
                end
                inherited DBLookupComboboxEh1: TDBLookupComboboxEh
                  Width = 200
                  OnEnter = nil
                end
                inherited DBLookupComboboxEh2: TDBLookupComboboxEh
                  TabOrder = 2
                  OnEnter = nil
                end
              end
            end
            inherited Panel4: TPanel
              Left = 456
              Height = 410
              inherited DBGridEh1: TDBGridEh
                Height = 354
              end
              inherited Panel6: TPanel
                Top = 379
              end
            end
          end
        end
      end
    end
    inherited qryObjavlenie: TSQLQuery
      inherited qryObjavlenieSD_NUM: TStringField
        Size = 64
      end
    end
    inherited cdsObjavlenie: TClientDataSet
      inherited cdsObjavlenieSD_NUM: TStringField
        Size = 64
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 511
    Width = 806
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      806
      41)
    object btDone: TBitBtn
      Left = 566
      Top = 8
      Width = 115
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      OnClick = btDoneClick
      Glyph.Data = {
        CE000000424DCE0000000000000076000000280000000B0000000B0000000100
        04000000000058000000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
        0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
        0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
        0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
    end
    object btCancelAg: TBitBtn
      Left = 691
      Top = 8
      Width = 115
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      OnClick = btCancelAgClick
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
end
