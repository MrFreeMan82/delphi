object frmContent: TfrmContent
  Left = 681
  Top = 359
  Width = 788
  Height = 571
  Caption = #1054#1073#1098#1103#1074#1083#1077#1085#1080#1077' - '#1082#1072#1088#1090#1080#1085#1082#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inline frameContent: TframeContent
    Left = 0
    Top = 0
    Width = 772
    Height = 493
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    inherited PageControl1: TPageControl
      Width = 772
      Height = 493
      inherited tabPicture: TTabSheet
        inherited Panel5: TPanel
          Width = 440
          Height = 483
          inherited ScrollBox1: TScrollBox
            Width = 440
            Height = 384
            inherited img: TImage
              Width = 436
              Height = 380
            end
            inherited shpHider1: TShape
              Width = 436
              Height = 380
            end
          end
          inherited Panel1: TPanel
            Top = 384
            Width = 440
            inherited shpHider2: TShape
              Width = 438
            end
            inherited btSave: TBitBtn
              Left = 199
            end
            inherited btPrint: TBitBtn
              Left = 335
            end
          end
          inherited Panel2: TPanel
            Top = 415
            Width = 440
            inherited Shape1: TShape
              Width = 935
            end
            inherited shpHider3: TShape
              Width = 440
            end
            inherited DBEditEh1: TDBEditEh
              Width = 345
            end
            inherited DBLookupComboboxEh1: TDBLookupComboboxEh
              Width = 185
            end
          end
        end
        inherited Panel4: TPanel
          Left = 440
          Height = 483
          inherited DBGridEh1: TDBGridEh
            Height = 427
          end
          inherited Panel6: TPanel
            Top = 452
          end
        end
      end
    end
    inherited qryContent: TSQLQuery
      SQL.Strings = (
        'SELECT'
        #9'OC.FM_ID,'
        #9'OC.RB_ID,'
        #9'OC.CONTENT_ID,'
        #9'OC.CONTENT_PICTURE,'
        #9'OC.CONTENT_COREL_PAGE,'
        #9'OC.CONTENT_SITE_OBJAV_ADDED,'
        #9'OC.VAC_COUNT'
        '               '
        'FROM'
        #9'OBJAV_CONTENT OC'
        'WHERE'
        #9'OC.CONTENT_ID=:CONTENT_ID')
    end
    inherited cdsContentFormat: TClientDataSet
      Filter = 'FM_HAS_PICTURE=1'
      Filtered = True
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 493
    Width = 772
    Height = 40
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      772
      40)
    object btDone: TBitBtn
      Left = 530
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
      Left = 657
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
