object frmMain: TfrmMain
  Left = 708
  Top = 211
  Caption = #1059#1095#1077#1090' '#1089#1076#1077#1083#1086#1082
  ClientHeight = 573
  ClientWidth = 927
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 900
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pages: TPageControl
    Left = 0
    Top = 0
    Width = 927
    Height = 573
    ActivePage = tbAgent
    Align = alClient
    DockSite = True
    DragKind = dkDock
    TabOrder = 0
    OnChange = pagesChange
    object tbAgent: TTabSheet
      Caption = #1040#1075#1077#1085#1090
      object imgUnchecked: TImage
        Left = 151
        Top = 3
        Width = 11
        Height = 11
        AutoSize = True
        Picture.Data = {
          07544269746D6170CE000000424DCE0000000000000076000000280000000B00
          00000B0000000100040000000000580000000000000000000000100000000000
          000000000000000080000080000000808000800000008000800080800000C0C0
          C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF0088888888888000008FFFFFFFFF8000008FFFFFFFFF8000008FFFFFFFFF80
          00008FFFFFFFFF8000008FFFFFFFFF8000008FFFFFFFFF8000008FFFFFFFFF80
          00008FFFFFFFFF8000008FFFFFFFFF8000008888888888800000}
        Visible = False
      end
      object imgChecked: TImage
        Left = 175
        Top = 3
        Width = 11
        Height = 11
        AutoSize = True
        Picture.Data = {
          07544269746D6170CE000000424DCE0000000000000076000000280000000B00
          00000B0000000100040000000000580000000000000000000000100000000000
          000000000000000080000080000000808000800000008000800080800000C0C0
          C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF0088888888888000008FFFFFFFFF8000008FFF0FFFFF8000008FF000FFFF80
          00008F00000FFF8000008F00F000FF8000008F0FFF000F8000008FFFFFF00F80
          00008FFFFFFF0F8000008FFFFFFFFF8000008888888888800000}
        Visible = False
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 918
        Height = 545
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 3
        TabOrder = 2
        object Shape53: TShape
          Left = 3
          Top = 507
          Width = 912
          Height = 5
          Align = alBottom
          Brush.Style = bsClear
          Pen.Color = clBtnShadow
          Pen.Style = psClear
          ExplicitTop = 496
          ExplicitWidth = 606
        end
        object grAgentSdelka: TDBGrid
          Left = 3
          Top = 30
          Width = 912
          Height = 477
          Align = alClient
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          PopupMenu = ppGrid
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = grAgentSdelkaCellClick
          OnDrawColumnCell = grAgentSdelkaDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'SR_IS_CURRENT_ISSUE'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RB_IS_LOCKABLE'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SD_NUM'
              Title.Caption = #1053#1086#1084#1077#1088
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SD_TYPE_DESC'
              Width = 24
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SDS_NAME'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SD_STATE'
              Title.Caption = #1050' '#1089#1076#1072#1095#1077
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AS_ID'
              Title.Caption = #1055
              Width = 10
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PT_NAME'
              Title.Caption = #1054#1087#1083#1072#1090#1072
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SD_FACT_NUM'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CU_ID'
              Title.Caption = #8470' '#1050#1086#1084#1087#1072#1085#1080#1080
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CU_NAME'
              Width = 98
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SD_SUM'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RB_NAME_LK'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FM_NAME_LK'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PODACHA_NUMS'
              Width = 205
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 3
          Top = 512
          Width = 912
          Height = 30
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object Shape1: TShape
            Left = 0
            Top = 0
            Width = 912
            Height = 1
            Align = alTop
            Pen.Color = clBtnShadow
            ExplicitWidth = 606
          end
          object BitBtn10: TBitBtn
            Left = 78
            Top = 5
            Width = 77
            Height = 25
            Caption = #1059#1076#1072#1083#1080#1090#1100
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              6A000000424D6A000000000000003E000000280000000B0000000B0000000100
              0100000000002C0000000000000000000000020000000000000000000000FFFF
              FF00FFE00000FFE00000FFE00000FFE00000002000000020000000200000FFE0
              0000FFE00000FFE00000FFE00000}
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 0
            OnClick = BitBtn10Click
          end
          object BitBtn3: TBitBtn
            Left = 158
            Top = 5
            Width = 83
            Height = 25
            Caption = #1048#1079#1084#1077#1085#1080#1090#1100
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDCCDDCDDD
              DDDDDDDCDDCCDCDDDDDDCDC0000DDDCDDDDDDCD08830DDDDDDDDDDD08B330DDD
              DDDDDDD0BBB330DDDDDDDDDD0BBB330DDDDDDDDDD0BBB330DDDDDDDDDD0BBB33
              0DDDDDDDDDD0BBB330DDDDDDDDDD0BB3000DDDDDDDDDD0B0330DDDDDDDDDDD00
              B30DDDDDDDDDDDD000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 1
            OnClick = BitBtn3Click
          end
          object btRefresh: TBitBtn
            Left = 244
            Top = 5
            Width = 82
            Height = 25
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
              FFFFFFFFF00FFFFFFFFFFFF88000FFFFFFFFFF0000000FFFFFFFF0000000FF80
              FFFF808FF00FFF000FFF00FFF0FFFFF008FF00FFFFFFFFFF00FF00FFFFFFFFFF
              00FF800FFFFF0FFF00FFF000FFF00FF808FFFF08FF0000000FFFFFFFF0000000
              FFFFFFFFFF00088FFFFFFFFFFFF00FFFFFFFFFFFFFFF0FFFFFFF}
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 2
            OnClick = btRefreshClick
          end
          object BitBtn2: TBitBtn
            Left = 329
            Top = 5
            Width = 62
            Height = 25
            Caption = #1048#1090#1086#1075
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
              73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
              0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
              0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
              0333337F777777737F333308888888880333337F333333337F33330888888888
              03333373FFFFFFFF733333700000000073333337777777773333}
            NumGlyphs = 2
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 3
            OnClick = BitBtn2Click
          end
          object btFindSdelkaAgent: TBitBtn
            Left = 394
            Top = 5
            Width = 65
            Height = 25
            Caption = #1055#1086#1080#1089#1082
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333300000333330000030F000333330F00030F000333330F000300000003000
              0000300F000000F00000300F000300F00000300F000300F00000330000000000
              00033330F00030F000333330000030000033333300033300033333330F03330F
              0333333300033300033333333333333333333333333333333333}
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 4
            OnClick = btFindSdelkaAgentClick
          end
          object btPrintNew: TBitBtn
            Left = 590
            Top = 5
            Width = 78
            Height = 25
            Caption = #1053#1086#1074#1099#1077
            DoubleBuffered = True
            Glyph.Data = {
              42010000424D4201000000000000760000002800000013000000110000000100
              040000000000CC00000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
              DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
              7700788008800DD00000D07700777888800880D00000D80077777888888000D0
              000000777777F8888888800000008F7777FF77788888880000008F77FF777777
              78888800000087FF7779977777788800000088777AA77777707778000000DD88
              F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
              0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
              88DDDDD00000}
            ParentDoubleBuffered = False
            TabOrder = 5
            Visible = False
            OnClick = btPrintNewClick
          end
          object btPrintAcc: TBitBtn
            Left = 462
            Top = 5
            Width = 121
            Height = 25
            Action = actPrintAcc
            Caption = #1053#1072#1087#1077#1095#1072#1090#1072#1090#1100' '#1089#1095#1105#1090
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              42010000424D4201000000000000760000002800000013000000110000000100
              040000000000CC00000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
              DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
              7700788008800DD00000D07700777888800880D00000D80077777888888000D0
              000000777777F8888888800000008F7777FF77788888880000008F77FF777777
              78888800000087FF7779977777788800000088777AA77777707778000000DD88
              F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
              0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
              88DDDDD00000}
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 6
          end
        end
        object Panel6: TPanel
          Left = 3
          Top = 3
          Width = 912
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object Label4: TLabel
            Left = 141
            Top = 6
            Width = 77
            Height = 13
            Caption = #1057#1087#1086#1089#1086#1073' '#1086#1087#1083#1072#1090#1099
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 8
            Top = 6
            Width = 104
            Height = 13
            Caption = #1040#1082#1090#1080#1074#1085#1099#1077' '#1089#1076#1077#1083#1082#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object cbPayTypeFilter: TComboBox
            Left = 222
            Top = 2
            Width = 145
            Height = 21
            Style = csDropDownList
            TabOrder = 0
            OnChange = cbPayTypeFilterChange
          end
          object Panel7: TPanel
            Left = 826
            Top = 0
            Width = 86
            Height = 27
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object Shape51: TShape
              Left = 0
              Top = 0
              Width = 1
              Height = 25
              Pen.Color = clBtnShadow
            end
            object btShowSdelkaView: TBitBtn
              Left = 7
              Top = 2
              Width = 78
              Height = 21
              Caption = #1087#1086#1076#1088#1086#1073#1085#1086' <<'
              DoubleBuffered = True
              ParentDoubleBuffered = False
              TabOrder = 0
              OnClick = btShowSdelkaViewClick
            end
          end
        end
      end
      object BitBtn4: TBitBtn
        Left = 97
        Top = 418
        Width = 76
        Height = 25
        Caption = #1053#1086#1074#1072#1103
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          62000000424D62000000000000003E0000002800000009000000090000000100
          010000000000240000000000000000000000020000000000000000000000FFFF
          FF00E3800000E3800000E3800000000000000000000000000000E3800000E380
          0000E3800000}
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 0
        Visible = False
      end
      object Panel3: TPanel
        Left = 918
        Top = 0
        Width = 1
        Height = 545
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
      end
    end
    object tbManager: TTabSheet
      Caption = #1052#1077#1085#1077#1076#1078#1077#1088
      ImageIndex = 1
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 919
        Height = 545
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 3
        TabOrder = 3
        object Shape54: TShape
          Left = 3
          Top = 507
          Width = 913
          Height = 5
          Align = alBottom
          Brush.Style = bsClear
          Pen.Color = clBtnShadow
          Pen.Style = psClear
          ExplicitTop = 496
          ExplicitWidth = 607
        end
        object grManagerSdelka: TDBGrid
          Left = 3
          Top = 30
          Width = 913
          Height = 477
          Align = alClient
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = ppGrid
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = grManagerSdelkaCellClick
          OnDrawColumnCell = grManagerSdelkaDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'T'
              Title.Caption = ' '
              Width = 16
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SR_IS_CURRENT_ISSUE'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RB_IS_LOCKABLE'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SD_NUM'
              Title.Caption = #1053#1086#1084#1077#1088
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SD_TYPE_DESC'
              Width = 24
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SDS_NAME'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SD_PAY_NOW'
              Title.Caption = #1050' '#1086#1087#1083#1072#1090#1077
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AS_ID'
              Title.Caption = #1055
              Width = 10
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PT_NAME'
              Title.Caption = #1054#1087#1083#1072#1090#1072
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SD_FACT_NUM'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CU_NAME'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SD_SUM'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RB_NAME_LK'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FM_NAME_LK'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PODACHA_NUMS'
              Width = 197
              Visible = True
            end>
        end
        object Panel9: TPanel
          Left = 3
          Top = 512
          Width = 913
          Height = 30
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object Shape2: TShape
            Left = 0
            Top = 0
            Width = 913
            Height = 1
            Align = alTop
            Pen.Color = clBtnShadow
            ExplicitWidth = 607
          end
          object btApprove: TBitBtn
            Left = 3
            Top = 5
            Width = 121
            Height = 25
            Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              CE000000424DCE0000000000000076000000280000000B0000000B0000000100
              04000000000058000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
              0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
              0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
              0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 0
            OnClick = btApproveClick
          end
          object btRefreshManager: TBitBtn
            Left = 205
            Top = 5
            Width = 82
            Height = 25
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
              FFFFFFFFF00FFFFFFFFFFFF88000FFFFFFFFFF0000000FFFFFFFF0000000FF80
              FFFF808FF00FFF000FFF00FFF0FFFFF008FF00FFFFFFFFFF00FF00FFFFFFFFFF
              00FF800FFFFF0FFF00FFF000FFF00FF808FFFF08FF0000000FFFFFFFF0000000
              FFFFFFFFFF00088FFFFFFFFFFFF00FFFFFFFFFFFFFFF0FFFFFFF}
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 1
            OnClick = btRefreshClick
          end
          object btFindSdelkaManager: TBitBtn
            Left = 290
            Top = 5
            Width = 74
            Height = 25
            Caption = #1055#1086#1080#1089#1082
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333300000333330000030F000333330F00030F000333330F000300000003000
              0000300F000000F00000300F000300F00000300F000300F00000330000000000
              00033330F00030F000333330000030000033333300033300033333330F03330F
              0333333300033300033333333333333333333333333333333333}
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 2
            OnClick = btFindSdelkaManagerClick
          end
          object btGetMoney: TBitBtn
            Left = 367
            Top = 5
            Width = 93
            Height = 25
            Caption = #1055#1088#1080#1085#1103#1090#1100' '#1076#1077#1085#1100#1075#1080
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 3
            OnClick = btGetMoneyClick
          end
          object btEditSdelkaManager: TBitBtn
            Left = 126
            Top = 5
            Width = 76
            Height = 25
            Caption = #1048#1079#1084#1077#1085#1080#1090#1100
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDCCDDCDDD
              DDDDDDDCDDCCDCDDDDDDCDC0000DDDCDDDDDDCD08830DDDDDDDDDDD08B330DDD
              DDDDDDD0BBB330DDDDDDDDDD0BBB330DDDDDDDDDD0BBB330DDDDDDDDDD0BBB33
              0DDDDDDDDDD0BBB330DDDDDDDDDD0BB3000DDDDDDDDDD0B0330DDDDDDDDDDD00
              B30DDDDDDDDDDDD000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 4
            OnClick = btEditSdelkaManagerClick
          end
        end
        object Panel10: TPanel
          Left = 3
          Top = 3
          Width = 913
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object Label3: TLabel
            Left = 8
            Top = 6
            Width = 169
            Height = 13
            Caption = #1048#1079#1084#1077#1085#1077#1085#1085#1099#1077' '#1080' '#1085#1086#1074#1099#1077' '#1089#1076#1077#1083#1082#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object Panel11: TPanel
            Left = 732
            Top = 0
            Width = 181
            Height = 27
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object Shape55: TShape
              Left = 94
              Top = 0
              Width = 1
              Height = 25
              Pen.Color = clBtnShadow
            end
            object btShowSdelkaViewForManager: TBitBtn
              Left = 102
              Top = 3
              Width = 78
              Height = 21
              Caption = #1087#1086#1076#1088#1086#1073#1085#1086' <<'
              DoubleBuffered = True
              ParentDoubleBuffered = False
              TabOrder = 0
              OnClick = btShowSdelkaViewForManagerClick
            end
          end
        end
      end
      object mmAgentSQL: TMemo
        Left = 8
        Top = 72
        Width = 193
        Height = 137
        Lines.Strings = (
          'select'
          '      SD.SD_NEW_CUST'
          '     , SD.SD_NUM   '
          '    , SD.AG_ID'
          '    , SD.SD_ID'
          '    , SD.SD_TYPE'
          #9', SD.SD_STATE'
          #9', SD.CU_ID'
          #9', SD.SD_SUM'
          #9', SD.SD_PERCENT'
          #9', SD.SD_SUM_DEFAULT'
          #9', SD.SD_PERCENT_DEFAULT'
          #9', SD.SD_SKIDKA'
          #9', SD.PT_ID'
          #9', SD.SD_ID_COMPOUND'
          #9', SD.GZ_ID'
          #9', SD.SD_COMMENT'
          #9', SD.SD_SUM_PAYED'
          #9', SD.SD_ALL_PAYED'
          #9', SD.SD_COMMENT_SHORT'
          #9', SD.AS_ID'
          #9', SD.SD_PAY_NOW'
          #9', SD.SD_FACT_NUM'
          #9', SD.SD_KA_START_DATE'
          #9', SD.SD_KA_END_DATE'
          #9', SD.SD_FACT_DATE'
          #9', SD.SD_PERCENT_SUM'
          #9', SD.SD_PERCENT_GIVEN'
          #9', SD.SD_TO_GIVE_PERCENT'
          #9', sdt.SD_TYPE_DESC'
          #9', CU.CU_NAME'
          #9', AC.PODACHA_NUMS'
          '    , SDS.SDS_NAME'
          '    , GZ.GZ_NAME'
          '    , PT.PT_NAME'
          '    , AST.AS_NAME'
          #9', MFR.FM_ID'
          #9', MFR.RB_ID'
          #9', ('
          #9#9'select count(*)'
          #9#9'from PODACHA pd'
          #9#9'where       pd.AG_ID = sd.AG_ID'
          #9#9#9#9'and pd.SD_ID = sd.SD_ID'
          #9#9#9#9'and pd.IS_ID = ('
          #9#9#9#9#9'select pm.PM_CURRENT_ISSUE_SR'
          #9#9#9#9#9'from PARAMS pm'
          #9#9#9#9')'
          #9'  ) as SR_IS_CURRENT_ISSUE'
          #9', ('
          #9#9'  select count(*)'
          #9#9'  from'
          #9#9#9'  OBJAV iob, RUBRIKA irb'
          #9#9'  where     iob.AG_ID = sd.AG_ID'
          #9#9#9#9'and iob.SD_ID = sd.SD_ID'
          #9#9#9#9'and irb.RB_ID = iob.RB_ID'
          #9#9#9#9'and iob.OB_IS_ACTIVE = 1'
          #9#9#9#9'and iob.FM_ID <> 14'
          #9#9#9#9'and irb.RB_IS_LOCKABLE = 1'
          #9'  ) + ('
          #9#9'  select count(*)'
          #9#9'  from'
          #9#9#9'  PODACHA pd'
          ''
          #9#9#9'  left join OBJAVLENIE iob2'
          #9#9#9'  on (iob2.PD_ID = pd.PD_ID)'
          ''
          #9#9#9'  left join RUBRIKA irb2'
          #9#9#9'  on (iob2.RB_ID = irb2.RB_ID)'
          ''
          #9#9#9'  left join RUBRIKA irb3'
          #9#9#9'  on (iob2.DOUBLE_RB_ID = irb3.RB_ID)'
          #9#9'  where     pd.AG_ID = sd.AG_ID'
          #9#9#9#9'and pd.SD_ID = sd.SD_ID'
          #9#9#9#9'and pd.PD_IS_DONE <> 1'
          #9#9#9#9'and ('
          #9#9#9#9#9'   irb2.RB_IS_LOCKABLE = 1'
          #9#9#9#9#9'or irb3.RB_IS_LOCKABLE = 1'
          #9#9#9#9')'
          #9'  ) as RB_IS_LOCKABLE,'
          
            '      (select a.AG_NAME from AGENT a where a.AG_ID = sw.AG_ID) a' +
            's AG_NAME'
          'from'
          #9'SDELKA_WORKING_LIST sw'
          ''
          #9'left join SDELKA SD'
          #9'on (sd.AG_ID = sw.AG_ID and sd.SD_ID = sw.SD_ID)'
          ''
          #9'left join SDELKA_TYPE_DESC sdt'
          #9'on (sdt.SD_TYPE = sd.SD_TYPE and sdt.GZ_ID = sd.GZ_ID)'
          ''
          #9'left join SDELKA_PODACHA_NUMS(sw.AG_ID, sw.SD_ID) AC'
          #9'on (1 = 1)'
          ''
          #9'left join CUST CU'
          #9'on (SD.AG_ID = CU.AG_ID and SD.CU_ID = CU.CU_ID)'
          ''
          #9'left join  SDELKA_STATE SDS'
          #9'on (SD.SD_STATE = SDS.SDS_ID)'
          ''
          #9'left join GAZETA GZ'
          #9'on (SD.GZ_ID = GZ.GZ_ID)'
          ''
          #9'left join PAY_TYPE PT'
          #9'on (SD.PT_ID = PT.PT_ID)'
          ''
          #9'left join APPROVING_STATUS AST'
          #9'on (SD.AS_ID = AST.AS_ID)'
          ''
          #9'left join GET_MAX_FORMAT_AND_RUBRIKA(sd.AG_ID, sd.SD_ID) MFR'
          #9'on (1 = 1)'
          'where'
          #9'sw.AG_ID = :AG_ID'
          #9'and'
          #9'('
          #9#9'sw.SD_STATE in (1, 2, 4)'
          #9#9'or'
          #9#9'sw.AS_ID = 1'
          #9')'
          'order by'
          #9#9'sd.SD_ID desc')
        TabOrder = 0
        Visible = False
        WordWrap = False
      end
      object mmManagerSQL: TMemo
        Left = 208
        Top = 72
        Width = 201
        Height = 137
        Lines.Strings = (
          'select'
          '        SD.SD_NEW_CUST'
          '      ,SD.SD_NUM'
          '     ,SD.AG_ID'
          '    , SD.SD_ID'
          '    , SD.SD_TYPE'
          '    , SD.SD_STATE'
          '    , SD.CU_ID'
          '    , SD.SD_SUM'
          '    , SD.SD_PERCENT'
          '    , SD.SD_SUM_DEFAULT'
          '    , SD.SD_PERCENT_DEFAULT'
          '    , SD.SD_SKIDKA'
          '    , SD.PT_ID'
          '    , SD.SD_ID_COMPOUND'
          '    , SD.GZ_ID'
          '    , SD.SD_COMMENT'
          '    , SD.SD_SUM_PAYED'
          '    , SD.SD_ALL_PAYED'
          '    , SD.SD_COMMENT_SHORT'
          '    , SD.AS_ID'
          #9', SD.SD_PAY_NOW'
          #9', SD.SD_FACT_NUM'
          #9', SD.SD_KA_START_DATE'
          #9', SD.SD_KA_END_DATE'
          #9', SD.SD_FACT_DATE'
          #9', SD.SD_PERCENT_SUM'
          #9', SD.SD_PERCENT_GIVEN'
          #9', SD.SD_TO_GIVE_PERCENT'
          #9', sdt.SD_TYPE_DESC'
          #9', CU.CU_NAME'
          #9', AC.PODACHA_NUMS'
          #9', SDS.SDS_NAME'
          #9', GZ.GZ_NAME'
          #9', PT.PT_NAME'
          #9', AST.AS_NAME'
          #9', MFR.FM_ID'
          #9', MFR.RB_ID'
          #9', ('
          #9#9'select count(*)'
          #9#9'from PODACHA pd'
          #9#9'where       pd.AG_ID = sd.AG_ID'
          #9#9#9#9'and pd.SD_ID = sd.SD_ID'
          #9#9#9#9'and pd.IS_ID = ('
          #9#9#9#9#9'select pm.PM_CURRENT_ISSUE_SR'
          #9#9#9#9#9'from PARAMS pm'
          #9#9#9#9')'
          #9'  ) as SR_IS_CURRENT_ISSUE'
          #9', ('
          #9#9'  select count(*)'
          #9#9'  from'
          #9#9#9'  OBJAV iob, RUBRIKA irb'
          #9#9'  where     iob.AG_ID = sd.AG_ID'
          #9#9#9#9'and iob.SD_ID = sd.SD_ID'
          #9#9#9#9'and iob.RB_ID = irb.RB_ID'
          #9#9#9#9'and iob.OB_IS_ACTIVE = 1'
          #9#9#9#9'and iob.FM_ID <> 14'
          #9#9#9#9'and irb.RB_IS_LOCKABLE = 1'
          #9'  ) + ('
          #9#9'  select count(*)'
          #9#9'  from'
          #9#9#9'  PODACHA pd'
          ''
          #9#9#9'  left join OBJAVLENIE iob2'
          #9#9#9'  on (IOB2.PD_ID = PD.PD_ID)'
          ''
          #9#9#9'  left join RUBRIKA irb2'
          #9#9#9'  on (IOB2.RB_ID = IRB2.RB_ID)'
          ''
          #9#9#9'  left join RUBRIKA irb3'
          #9#9#9'  on (iob2.DOUBLE_RB_ID = irb3.RB_ID)'
          #9#9'  where     pd.AG_ID = sd.AG_ID'
          #9#9#9#9'and pd.SD_ID = sd.SD_ID'
          #9#9#9#9'and pd.PD_IS_DONE <> 1'
          #9#9#9#9'and ('
          #9#9#9#9#9'   irb2.RB_IS_LOCKABLE = 1'
          #9#9#9#9#9'or irb3.RB_IS_LOCKABLE = 1'
          #9#9#9#9')'
          #9'  ) as RB_IS_LOCKABLE,'
          
            '      (select a.AG_NAME from AGENT a where a.AG_ID = sw.AG_ID) a' +
            's AG_NAME'
          'from'
          #9'SDELKA_WORKING_LIST sw'
          ''
          #9'left join SDELKA SD'
          #9'on (sd.AG_ID = sw.AG_ID and sd.SD_ID = sw.SD_ID)'
          ''
          #9'left join SDELKA_TYPE_DESC sdt'
          #9'on (sdt.SD_TYPE = sd.SD_TYPE and sdt.GZ_ID = sd.GZ_ID)'
          ''
          #9'left join SDELKA_PODACHA_NUMS(SD.AG_ID, SD.SD_ID) AC'
          '    on (SD.SD_ID = AC.SD_ID)'
          ''
          '    left join CUST CU'
          '    on (SD.AG_ID = CU.AG_ID AND SD.CU_ID = CU.CU_ID)'
          ''
          '    left join SDELKA_STATE SDS'
          '    on (SD.SD_STATE = SDS.SDS_ID)'
          ''
          '    left join GAZETA GZ'
          '    on (SD.GZ_ID = GZ.GZ_ID)'
          ''
          '    left join PAY_TYPE PT'
          '    on (SD.PT_ID = PT.PT_ID)'
          ''
          '    left join APPROVING_STATUS AST'
          '    on (SD.AS_ID = AST.AS_ID)'
          ''
          '    left join GET_MAX_FORMAT_AND_RUBRIKA(SD.AG_ID, SD.SD_ID) MFR'
          '    on (SD.SD_ID = SD.SD_ID)'
          ''
          'where'
          #9'sw.AG_ID = :AG_ID'
          #9'and ('
          #9#9'sw.SD_STATE in (2, 3)'
          #9#9'or'
          #9#9'(sw.AS_ID = 1 and sw.SD_STATE > 1)'
          #9')'
          'order by'
          #9'SD.SD_ID desc'
          '')
        TabOrder = 1
        Visible = False
        WordWrap = False
      end
      object mmPercentSQL: TMemo
        Left = 416
        Top = 72
        Width = 233
        Height = 137
        Lines.Strings = (
          'SELECT'
          '        SD.AG_ID,'
          '        SD.SD_ID,'
          '        SD.SD_TYPE,'
          '        SD.SD_STATE,'
          '        SD.CU_ID,'
          '        SD.SD_SUM,'
          '        SD.SD_PERCENT,'
          '        SD.SD_SUM_DEFAULT,'
          '        SD.SD_PERCENT_DEFAULT,'
          '        SD.SD_SKIDKA,'
          '        SD.PT_ID,'
          '        SD.SD_ID_COMPOUND,'
          '        SD.GZ_ID,'
          '        SD.SD_COMMENT,'
          '        SD.SD_SUM_PAYED,'
          '        SD.SD_ALL_PAYED,'
          '        SD.SD_COMMENT_SHORT,'
          '        SD.AS_ID,'
          '        SD.SD_PAY_NOW,'
          '        SD.SD_FACT_NUM,'
          '        SD.SD_KA_START_DATE,'
          '        SD.SD_KA_END_DATE,'
          '        SD.SD_FACT_DATE,'
          '        SD.SD_PERCENT_SUM,'
          '        SD.SD_PERCENT_GIVEN,'
          '        SD.SD_TO_GIVE_PERCENT,'
          #9'CU.CU_NAME,'
          #9'AC.PODACHA_NUMS,'
          #9'SDS.SDS_NAME,'
          #9'GZ.GZ_NAME,'
          #9'PT.PT_NAME,'
          #9'AST.AS_NAME,'
          '        MFR.FM_ID,'
          '        MFR.RB_ID'
          'FROM'
          #9'SDELKA SD'
          #9'LEFT JOIN SDELKA_PODACHA_NUMS(SD.AG_ID,SD.SD_ID) AC'
          #9'ON (SD.SD_ID=AC.SD_ID)'
          #9'LEFT JOIN CUST CU'
          #9'ON (SD.AG_ID=CU.AG_ID AND SD.CU_ID=CU.CU_ID)'
          #9'LEFT JOIN SDELKA_STATE SDS'
          #9'ON (SD.SD_STATE=SDS.SDS_ID)'
          #9'LEFT JOIN GAZETA GZ'
          #9'ON (SD.GZ_ID=GZ.GZ_ID)'
          #9'LEFT JOIN PAY_TYPE PT'
          #9'ON (SD.PT_ID=PT.PT_ID)'
          #9'LEFT JOIN APPROVING_STATUS AST'
          #9'ON (SD.AS_ID=AST.AS_ID)'
          
            '        LEFT JOIN GET_MAX_FORMAT_AND_RUBRIKA(SD.AG_ID,SD.SD_ID) ' +
            'MFR'
          '        ON (SD.SD_ID=SD.SD_ID)'
          'WHERE'
          #9'SD.AG_ID=:AG_ID'
          #9'AND'
          #9'SD.SD_TYPE<>2'
          #9'AND'
          #9'SD.SD_STATE<>100'
          #9'AND'
          #9'SD.AS_ID<>2'
          #9'AND'
          #9'('
          #9#9'('
          #9#9#9'SD.PT_ID=1'
          #9#9#9'AND'
          #9#9#9'SD.SD_STATE>=4'
          #9#9')'
          #9#9'OR'
          #9#9'('
          #9#9#9'SD.PT_ID>=2'
          #9#9#9'AND'
          #9#9#9'SD.SD_STATE>=4'
          #9#9#9'AND'
          #9#9#9'SD.SD_ALL_PAYED=1'
          #9#9')'
          #9')'
          #9'AND'
          #9'('
          #9#9'SD.SD_PERCENT_GIVEN IS NULL'
          #9#9'OR'
          #9#9'SD.SD_PERCENT_GIVEN<>1'
          #9')'
          'ORDER BY'
          #9'SD.SD_ID DESC')
        TabOrder = 2
        Visible = False
        WordWrap = False
      end
    end
    object tbAgentCusts: TTabSheet
      Caption = #1050#1083#1080#1077#1085#1090#1099' '#1072#1075#1077#1085#1090#1072
      ImageIndex = 3
    end
    object tbManagerFinance: TTabSheet
      Caption = #1052#1077#1085#1077#1076#1078#1077#1088' - '#1092#1080#1085#1072#1085#1089#1099
      ImageIndex = 5
      OnShow = tbPercentShow
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 919
        Height = 545
        ActivePage = TabSheet1
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = #1050#1072#1089#1089#1072', '#1078#1091#1088#1085#1072#1083' '#1088#1072#1089#1093#1086#1076#1086#1074' '#1080' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1081
          DesignSize = (
            911
            514)
          object Shape12: TShape
            Left = 8
            Top = 453
            Width = 885
            Height = 1
            Anchors = [akLeft, akTop, akRight]
            Pen.Color = clBtnShadow
          end
          object Label17: TLabel
            Left = 12
            Top = 467
            Width = 7
            Height = 13
            Caption = #1057
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label18: TLabel
            Left = 180
            Top = 467
            Width = 13
            Height = 13
            Caption = #1076#1086
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label22: TLabel
            Left = 356
            Top = 467
            Width = 40
            Height = 13
            Caption = #1087#1086' '#1074#1080#1076#1091
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label16: TLabel
            Left = 11
            Top = 86
            Width = 46
            Height = 13
            Caption = #1046#1091#1088#1085#1072#1083
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Shape14: TShape
            Left = 0
            Top = 0
            Width = 911
            Height = 1
            Align = alTop
            Pen.Color = clBtnShadow
            ExplicitWidth = 903
          end
          object Shape44: TShape
            Left = 0
            Top = 513
            Width = 911
            Height = 1
            Align = alBottom
            Pen.Color = clBtnShadow
            ExplicitTop = 502
            ExplicitWidth = 903
          end
          object Shape50: TShape
            Left = 8
            Top = 80
            Width = 885
            Height = 1
            Anchors = [akLeft, akTop, akRight]
            Pen.Color = clBtnShadow
          end
          object Shape36: TShape
            Left = 0
            Top = 1
            Width = 1
            Height = 512
            Align = alLeft
            Pen.Color = clBtnShadow
            ExplicitHeight = 501
          end
          object Shape47: TShape
            Left = 910
            Top = 1
            Width = 1
            Height = 512
            Align = alRight
            Pen.Color = clBtnShadow
            ExplicitLeft = 902
            ExplicitHeight = 501
          end
          object dtpTransFrom: TDateTimePicker
            Left = 23
            Top = 463
            Width = 132
            Height = 21
            Date = 37299.514216770800000000
            Time = 37299.514216770800000000
            TabOrder = 0
          end
          object dtpTransTo: TDateTimePicker
            Left = 197
            Top = 463
            Width = 132
            Height = 21
            Date = 37299.514265567100000000
            Time = 37299.514265567100000000
            TabOrder = 1
          end
          object cbTranTypeFilter: TComboBox
            Left = 400
            Top = 463
            Width = 145
            Height = 21
            Style = csDropDownList
            TabOrder = 2
          end
          object btRefreshMoneyTransactions: TBitBtn
            Left = 560
            Top = 461
            Width = 87
            Height = 25
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
              FFFFFFFFF00FFFFFFFFFFFF88000FFFFFFFFFF0000000FFFFFFFF0000000FF80
              FFFF808FF00FFF000FFF00FFF0FFFFF008FF00FFFFFFFFFF00FF00FFFFFFFFFF
              00FF800FFFFF0FFF00FFF000FFF00FF808FFFF08FF0000000FFFFFFFF0000000
              FFFFFFFFFF00088FFFFFFFFFFFF00FFFFFFFFFFFFFFF0FFFFFFF}
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 3
            OnClick = btRefreshMoneyTransactionsClick
          end
          object DBGrid10: TDBGrid
            Left = 9
            Top = 101
            Width = 884
            Height = 344
            Anchors = [akLeft, akTop, akRight]
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 4
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'MT_DATE'
                Width = 74
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MT_SUM'
                Width = 79
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MT_CHANGE'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TT_NAME'
                Width = 156
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MT_COMMENT'
                Width = 356
                Visible = True
              end>
          end
          object GroupBox2: TGroupBox
            Left = 10
            Top = 7
            Width = 883
            Height = 66
            Anchors = [akLeft, akTop, akRight]
            Caption = #1055#1088#1080#1085#1103#1090#1100'/'#1074#1099#1076#1072#1090#1100' '#1076#1077#1085#1100#1075#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            object Label14: TLabel
              Left = 11
              Top = 19
              Width = 31
              Height = 13
              Caption = #1057#1091#1084#1084#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label15: TLabel
              Left = 257
              Top = 19
              Width = 67
              Height = 13
              Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label19: TLabel
              Left = 65
              Top = 19
              Width = 49
              Height = 13
              Caption = #1044#1077#1081#1089#1090#1074#1080#1077
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object btGetGiveMoney: TBitBtn
              Left = 554
              Top = 33
              Width = 176
              Height = 25
              Caption = #1055#1088#1080#1085#1103#1090#1100'/'#1074#1099#1076#1072#1090#1100' '#1076#1077#1085#1100#1075#1080
              DoubleBuffered = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDDDDDD33000DDDDDDDDDD300BBB00DDDDDDD30BBBBBBB0DDDD0300BBBBBB
                B0DDD0B30BB0B000BB0DD0B30FB0B0B0BB0D0BB30FB0B0B0BB0D0FB30FB0B0B0
                BB0D0FB30FB0B000BB0D0FB030FBBBBBB0DD0FB0B0FFBBBBB0DDD0FBBB00FFB0
                0DDDD0FFBBBB000DDDDDDD00FFB00DDDDDDDDDDD000DDDDDDDDD}
              ParentDoubleBuffered = False
              ParentFont = False
              TabOrder = 0
              OnClick = btGetGiveMoneyClick
            end
            object edAddComment: TEdit
              Left = 257
              Top = 35
              Width = 290
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object edAddSum: TEdit
              Left = 11
              Top = 35
              Width = 50
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Text = '0,00'
            end
            object cbTransactionType: TDBLookupComboBox
              Left = 65
              Top = 35
              Width = 188
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'TT_ID'
              ListField = 'TT_NAME'
              ParentFont = False
              TabOrder = 3
            end
          end
        end
        object tbPercent: TTabSheet
          Caption = #1042#1099#1076#1072#1095#1072' '#1087#1088#1086#1094#1077#1085#1090#1086#1074' '#1072#1075#1077#1085#1090#1072#1084
          ImageIndex = 1
          TabVisible = False
          OnShow = tbPercentShow
          object Shape15: TShape
            Left = -2
            Top = 0
            Width = 761
            Height = 1
            Pen.Color = clBtnShadow
          end
          object Shape13: TShape
            Left = 9
            Top = 453
            Width = 742
            Height = 1
            Pen.Color = clBtnShadow
          end
          object Label23: TLabel
            Left = 11
            Top = 8
            Width = 264
            Height = 13
            Caption = #1057#1076#1077#1083#1082#1080', '#1087#1086' '#1082#1086#1090#1086#1088#1099#1084' '#1085#1091#1078#1085#1086' '#1074#1099#1076#1072#1090#1100' '#1087#1088#1086#1094#1077#1085#1090
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Shape45: TShape
            Left = 0
            Top = 513
            Width = 911
            Height = 1
            Align = alBottom
            Pen.Color = clBtnShadow
            ExplicitTop = 496
            ExplicitWidth = 757
          end
          object Shape38: TShape
            Left = 0
            Top = 0
            Width = 1
            Height = 513
            Align = alLeft
            Pen.Color = clBtnShadow
            ExplicitHeight = 496
          end
          object Shape48: TShape
            Left = 910
            Top = 0
            Width = 1
            Height = 513
            Align = alRight
            Pen.Color = clBtnShadow
            ExplicitLeft = 756
            ExplicitHeight = 496
          end
          object btGivePercent: TBitBtn
            Left = 520
            Top = 461
            Width = 230
            Height = 25
            Caption = #1042#1099#1076#1072#1090#1100' '#1087#1088#1086#1094#1077#1085#1090' '#1087#1086' '#1074#1099#1073#1088#1072#1085#1085#1099#1084' '#1089#1076#1077#1083#1082#1072#1084
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 0
            OnClick = btGivePercentClick
          end
          object BitBtn5: TBitBtn
            Left = 399
            Top = 461
            Width = 113
            Height = 25
            Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              EE000000424DEE0000000000000076000000280000000F0000000F0000000100
              0400000000007800000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999900000000
              00009999087777777700999908FF0FFFF700999908F000FFF70000000000000F
              F700087777777700F70008FF0FFFF700070008F000FFF70007000800000FF70F
              07000800F000F7088800080FFF000700000008FFFFF00709999008FFFFFF0709
              999008888888880999900000000000099990}
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 1
            OnClick = BitBtn5Click
          end
          object grPercent: TDBGrid
            Left = 9
            Top = 25
            Width = 741
            Height = 420
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = grPercentCellClick
            OnDrawColumnCell = grPercentDrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'SD_ID_COMPOUND'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CU_NAME'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SDS_NAME'
                Width = 112
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'AS_ID'
                Title.Caption = #1055
                Width = 10
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PT_NAME'
                Width = 106
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SD_SUM'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SD_PERCENT'
                Width = 66
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SD_PERCENT_SUM'
                Width = 92
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SD_TO_GIVE_PERCENT'
                Width = 96
                Visible = True
              end>
          end
        end
      end
    end
    object tbReports: TTabSheet
      Caption = #1054#1090#1095#1105#1090#1099
      ImageIndex = 6
      object Shape63: TShape
        Left = 918
        Top = 50
        Width = 1
        Height = 494
        Align = alRight
        Pen.Color = clBtnShadow
        ExplicitLeft = 910
        ExplicitHeight = 483
      end
      object Shape64: TShape
        Left = 0
        Top = 50
        Width = 1
        Height = 494
        Align = alLeft
        Pen.Color = clBtnShadow
        ExplicitHeight = 483
      end
      object Shape65: TShape
        Left = 0
        Top = 544
        Width = 919
        Height = 1
        Align = alBottom
        Pen.Color = clBtnShadow
        ExplicitTop = 533
        ExplicitWidth = 911
      end
      object Shape82: TShape
        Left = 481
        Top = 50
        Width = 284
        Height = 1
        Pen.Color = clBtnShadow
      end
      object pnlReportsParams: TPanel
        Left = 0
        Top = 0
        Width = 919
        Height = 50
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Shape62: TShape
          Left = 0
          Top = 0
          Width = 919
          Height = 1
          Align = alTop
          Pen.Color = clBtnShadow
          ExplicitWidth = 911
        end
        object Shape102: TShape
          Left = 0
          Top = 1
          Width = 1
          Height = 48
          Align = alLeft
          Pen.Color = clBtnShadow
        end
        object Shape103: TShape
          Left = 918
          Top = 1
          Width = 1
          Height = 48
          Align = alRight
          Pen.Color = clBtnShadow
          ExplicitLeft = 910
        end
        object Shape66: TShape
          Left = 0
          Top = 49
          Width = 919
          Height = 1
          Align = alBottom
          Pen.Color = clBtnShadow
          ExplicitWidth = 911
        end
        object cbAllAgents: TCheckBox
          Left = 17
          Top = 7
          Width = 217
          Height = 17
          Caption = #1044#1083#1103' '#1074#1089#1077#1093' '#1072#1075#1077#1085#1090#1086#1074' '#1101#1090#1086#1075#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
          Checked = True
          Ctl3D = True
          ParentCtl3D = False
          State = cbChecked
          TabOrder = 0
        end
        object cbOneWindow: TCheckBox
          Left = 17
          Top = 28
          Width = 217
          Height = 17
          Caption = #1042#1089#1105' '#1074' '#1086#1076#1085#1086#1084' '#1086#1082#1085#1077
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
      object Panel15: TPanel
        Left = 1
        Top = 50
        Width = 917
        Height = 494
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Shape67: TShape
          Left = 916
          Top = 0
          Width = 1
          Height = 494
          Align = alRight
          Pen.Color = clBtnShadow
          ExplicitLeft = 908
          ExplicitHeight = 483
        end
        object Panel150: TPanel
          Left = 0
          Top = 0
          Width = 457
          Height = 494
          Align = alLeft
          BevelOuter = bvNone
          BorderStyle = bsSingle
          TabOrder = 0
          object pnlReports1: TPanel
            Left = 0
            Top = 0
            Width = 453
            Height = 490
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              453
              490)
            object pnlCustItog: TPanel
              Left = 0
              Top = 428
              Width = 461
              Height = 39
              Align = alCustom
              BevelOuter = bvNone
              TabOrder = 11
              object Shape130: TShape
                Left = 0
                Top = 38
                Width = 461
                Height = 1
                Align = alBottom
                Pen.Color = clBtnShadow
              end
              object Label68: TLabel
                Left = 200
                Top = 14
                Width = 31
                Height = 13
                Caption = #1053#1086#1084#1077#1088
              end
              object btCustItog: TBitBtn
                Left = 8
                Top = 7
                Width = 185
                Height = 25
                Caption = #1048#1090#1086#1075' '#1085#1077#1076#1077#1083#1080' '#1087#1086' '#1082#1083#1080#1077#1085#1090#1072#1084
                DoubleBuffered = True
                Glyph.Data = {
                  42010000424D4201000000000000760000002800000013000000110000000100
                  040000000000CC00000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                  DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                  7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                  000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                  78888800000087FF7779977777788800000088777AA77777707778000000DD88
                  F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                  0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                  88DDDDD00000}
                ParentDoubleBuffered = False
                TabOrder = 0
                OnClick = btCustItogClick
              end
              object cbCustItog: TComboBox
                Left = 234
                Top = 10
                Width = 145
                Height = 21
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 1
                Text = #1047#1072#1082#1088#1099#1090#1099#1081
                Items.Strings = (
                  #1047#1072#1082#1088#1099#1090#1099#1081
                  #1058#1077#1082#1091#1097#1080#1081)
              end
            end
            object pnlRubrikaItog: TPanel
              Left = 0
              Top = 389
              Width = 461
              Height = 39
              Align = alCustom
              BevelOuter = bvNone
              TabOrder = 12
              object Shape134: TShape
                Left = 0
                Top = 38
                Width = 461
                Height = 1
                Align = alBottom
                Pen.Color = clBtnShadow
              end
              object Label69: TLabel
                Left = 200
                Top = 14
                Width = 31
                Height = 13
                Caption = #1053#1086#1084#1077#1088
              end
              object btRubrikaItog: TBitBtn
                Left = 8
                Top = 7
                Width = 185
                Height = 25
                Caption = #1048#1090#1086#1075' '#1085#1077#1076#1077#1083#1080' '#1087#1086' '#1088#1091#1073#1088#1080#1082#1072#1084
                DoubleBuffered = True
                Glyph.Data = {
                  42010000424D4201000000000000760000002800000013000000110000000100
                  040000000000CC00000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                  DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                  7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                  000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                  78888800000087FF7779977777788800000088777AA77777707778000000DD88
                  F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                  0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                  88DDDDD00000}
                ParentDoubleBuffered = False
                TabOrder = 0
                OnClick = btRubrikaItogClick
              end
              object cbRubrikaItog: TComboBox
                Left = 234
                Top = 10
                Width = 145
                Height = 21
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 1
                Text = #1047#1072#1082#1088#1099#1090#1099#1081
                Items.Strings = (
                  #1047#1072#1082#1088#1099#1090#1099#1081
                  #1058#1077#1082#1091#1097#1080#1081)
              end
            end
            object pnlAgRepByIssueNS: TPanel
              Left = 0
              Top = 195
              Width = 329
              Height = 39
              Anchors = [akLeft, akTop, akRight]
              BevelOuter = bvNone
              TabOrder = 2
            end
            object pnlAgRepByIssuePR: TPanel
              Left = 0
              Top = 195
              Width = 461
              Height = 39
              Align = alCustom
              BevelOuter = bvNone
              TabOrder = 3
              object Shape142: TShape
                Left = 0
                Top = 38
                Width = 461
                Height = 1
                Align = alBottom
                Pen.Color = clBtnShadow
              end
              object Label28: TLabel
                Left = 200
                Top = 14
                Width = 13
                Height = 13
                Caption = #8470
              end
              object btAgRepByIssue: TBitBtn
                Tag = 1
                Left = 8
                Top = 7
                Width = 121
                Height = 25
                Caption = #1057#1076#1077#1083#1082#1080' '#1074' '#1085#1086#1084#1077#1088
                DoubleBuffered = True
                Glyph.Data = {
                  42010000424D4201000000000000760000002800000013000000110000000100
                  040000000000CC00000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                  DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                  7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                  000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                  78888800000087FF7779977777788800000088777AA77777707778000000DD88
                  F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                  0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                  88DDDDD00000}
                ParentDoubleBuffered = False
                TabOrder = 0
                OnClick = btAgRepByIssueClick
              end
              object cbAgRepByIssueIssue: TDBLookupComboBox
                Left = 216
                Top = 10
                Width = 121
                Height = 21
                KeyField = 'IS_ID'
                ListField = 'IS_NAME_COMPOSED'
                TabOrder = 1
              end
              object cbDoubles: TCheckBox
                Left = 344
                Top = 14
                Width = 105
                Height = 17
                Caption = #1057' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1103#1084#1080
                TabOrder = 2
              end
            end
            object pnlObjavRepPR: TPanel
              Left = 0
              Top = 273
              Width = 461
              Height = 39
              Align = alCustom
              BevelOuter = bvNone
              TabOrder = 13
              object Shape147: TShape
                Left = 0
                Top = 38
                Width = 461
                Height = 1
                Align = alBottom
                Pen.Color = clBtnShadow
              end
              object Label59: TLabel
                Left = 200
                Top = 14
                Width = 13
                Height = 13
                Caption = #8470
              end
              object cbObjavRepIssue: TDBLookupComboBox
                Left = 216
                Top = 10
                Width = 121
                Height = 21
                KeyField = 'IS_ID'
                ListField = 'IS_NAME_COMPOSED'
                TabOrder = 0
              end
              object btObjavRep: TBitBtn
                Tag = 1
                Left = 8
                Top = 7
                Width = 121
                Height = 25
                Caption = #1060#1086#1088#1084#1072#1090#1099'/'#1088#1091#1073#1088#1080#1082#1080
                DoubleBuffered = True
                Glyph.Data = {
                  42010000424D4201000000000000760000002800000013000000110000000100
                  040000000000CC00000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                  DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                  7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                  000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                  78888800000087FF7779977777788800000088777AA77777707778000000DD88
                  F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                  0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                  88DDDDD00000}
                ParentDoubleBuffered = False
                TabOrder = 1
                OnClick = btObjavRepClick
              end
            end
            object pnlZapasByTime: TPanel
              Left = 0
              Top = 39
              Width = 461
              Height = 39
              Align = alCustom
              BevelOuter = bvNone
              TabOrder = 5
              object Shape107: TShape
                Left = 0
                Top = 38
                Width = 461
                Height = 1
                Align = alBottom
                Pen.Color = clBtnShadow
              end
              object Label30: TLabel
                Left = 170
                Top = 14
                Width = 7
                Height = 13
                Caption = #1057
              end
              object Label31: TLabel
                Left = 247
                Top = 14
                Width = 13
                Height = 13
                Caption = #1076#1086
              end
              object btZapasByTime: TBitBtn
                Left = 8
                Top = 7
                Width = 153
                Height = 25
                Caption = #1047#1072#1087#1072#1089' '#1079#1072' '#1087#1077#1088#1080#1086#1076
                DoubleBuffered = True
                Glyph.Data = {
                  42010000424D4201000000000000760000002800000013000000110000000100
                  040000000000CC00000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                  DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                  7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                  000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                  78888800000087FF7779977777788800000088777AA77777707778000000DD88
                  F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                  0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                  88DDDDD00000}
                ParentDoubleBuffered = False
                TabOrder = 0
                OnClick = btZapasByTimeClick
              end
              object edZapasFrom: TEdit
                Left = 178
                Top = 10
                Width = 65
                Height = 21
                TabOrder = 1
              end
              object edZapasTo: TEdit
                Left = 264
                Top = 10
                Width = 65
                Height = 21
                TabOrder = 2
              end
            end
            object pnlFinReport: TPanel
              Left = 0
              Top = 156
              Width = 461
              Height = 39
              Align = alCustom
              BevelOuter = bvNone
              TabOrder = 6
              object Shape138: TShape
                Left = 0
                Top = 38
                Width = 461
                Height = 1
                Align = alBottom
                Pen.Color = clBtnShadow
              end
              object Label50: TLabel
                Left = 168
                Top = 14
                Width = 7
                Height = 13
                Caption = #1057
              end
              object Label51: TLabel
                Left = 247
                Top = 14
                Width = 13
                Height = 13
                Caption = #1076#1086
              end
              object btFinReport: TBitBtn
                Left = 8
                Top = 7
                Width = 153
                Height = 25
                Caption = #1060#1080#1085#1072#1085#1089#1086#1074#1099#1081' '#1086#1090#1095#1105#1090
                DoubleBuffered = True
                Glyph.Data = {
                  42010000424D4201000000000000760000002800000013000000110000000100
                  040000000000CC00000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                  DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                  7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                  000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                  78888800000087FF7779977777788800000088777AA77777707778000000DD88
                  F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                  0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                  88DDDDD00000}
                ParentDoubleBuffered = False
                TabOrder = 0
                OnClick = btFinReportClick
              end
              object edFinReportFrom: TEdit
                Left = 176
                Top = 10
                Width = 65
                Height = 21
                TabOrder = 1
              end
              object edFinReportTo: TEdit
                Left = 264
                Top = 10
                Width = 65
                Height = 21
                TabOrder = 2
              end
            end
            object pnlPayedBeznalByTime: TPanel
              Left = 0
              Top = 117
              Width = 461
              Height = 39
              Align = alCustom
              BevelOuter = bvNone
              TabOrder = 7
              object Shape126: TShape
                Left = 0
                Top = 38
                Width = 461
                Height = 1
                Align = alBottom
                Pen.Color = clBtnShadow
              end
              object Label42: TLabel
                Left = 168
                Top = 14
                Width = 7
                Height = 13
                Caption = #1057
              end
              object Label43: TLabel
                Left = 247
                Top = 14
                Width = 13
                Height = 13
                Caption = #1076#1086
              end
              object btPayedBeznalByTime: TBitBtn
                Left = 8
                Top = 7
                Width = 153
                Height = 25
                Caption = #1054#1087#1083'. '#1073#1077#1079#1085#1072#1083'/'#1082#1088#1077#1076#1080#1090
                DoubleBuffered = True
                Glyph.Data = {
                  42010000424D4201000000000000760000002800000013000000110000000100
                  040000000000CC00000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                  DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                  7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                  000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                  78888800000087FF7779977777788800000088777AA77777707778000000DD88
                  F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                  0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                  88DDDDD00000}
                ParentDoubleBuffered = False
                TabOrder = 0
                OnClick = btPayedBeznalByTimeClick
              end
              object edPayedBeznalFrom: TEdit
                Left = 176
                Top = 10
                Width = 65
                Height = 21
                TabOrder = 1
              end
              object edPayedBeznalTo: TEdit
                Left = 264
                Top = 10
                Width = 65
                Height = 21
                TabOrder = 2
              end
            end
            object pnlZarplata: TPanel
              Left = 0
              Top = 350
              Width = 461
              Height = 39
              Align = alCustom
              BevelOuter = bvNone
              TabOrder = 8
              object Shape122: TShape
                Left = 0
                Top = 38
                Width = 461
                Height = 1
                Align = alBottom
                Pen.Color = clBtnShadow
              end
              object Label37: TLabel
                Left = 208
                Top = 14
                Width = 7
                Height = 13
                Caption = #1057
              end
              object Label38: TLabel
                Left = 331
                Top = 14
                Width = 13
                Height = 13
                Caption = #1076#1086
              end
              object btVIP: TBitBtn
                Left = 8
                Top = 7
                Width = 185
                Height = 25
                Caption = #1042#1048#1055'-'#1079#1072#1082#1072#1079#1095#1080#1082#1080
                DoubleBuffered = True
                Glyph.Data = {
                  42010000424D4201000000000000760000002800000013000000110000000100
                  040000000000CC00000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                  DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                  7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                  000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                  78888800000087FF7779977777788800000088777AA77777707778000000DD88
                  F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                  0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                  88DDDDD00000}
                ParentDoubleBuffered = False
                TabOrder = 0
                OnClick = btVIPClick
              end
              object edVIPFrom: TEdit
                Left = 224
                Top = 10
                Width = 97
                Height = 21
                TabOrder = 1
              end
              object edVIPTo: TEdit
                Left = 352
                Top = 10
                Width = 97
                Height = 21
                TabOrder = 2
              end
            end
            object pnlModuliByDesigner: TPanel
              Left = 0
              Top = 0
              Width = 449
              Height = 39
              BevelOuter = bvNone
              TabOrder = 14
              object Shape1666: TShape
                Left = 0
                Top = 38
                Width = 449
                Height = 1
                Align = alBottom
                Pen.Color = clBtnShadow
              end
              object Label1666: TLabel
                Left = 176
                Top = 14
                Width = 7
                Height = 13
                Caption = #1057
              end
              object Label2666: TLabel
                Left = 299
                Top = 14
                Width = 13
                Height = 13
                Caption = #1076#1086
              end
              object btModuliByDesigner: TBitBtn
                Tag = 1
                Left = 8
                Top = 7
                Width = 153
                Height = 25
                Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1084#1086#1076#1091#1083#1077#1081
                DoubleBuffered = True
                Glyph.Data = {
                  42010000424D4201000000000000760000002800000013000000110000000100
                  040000000000CC00000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                  DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                  7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                  000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                  78888800000087FF7779977777788800000088777AA77777707778000000DD88
                  F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                  0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                  88DDDDD00000}
                ParentDoubleBuffered = False
                TabOrder = 0
                OnClick = btModuliByDesignerClick
              end
              object edModuliByDesignerFrom: TEdit
                Left = 192
                Top = 10
                Width = 97
                Height = 21
                TabOrder = 1
              end
              object edModuliByDesignerTo: TEdit
                Left = 320
                Top = 10
                Width = 97
                Height = 21
                TabOrder = 2
              end
            end
            object Panel2666: TPanel
              Left = 0
              Top = 234
              Width = 461
              Height = 39
              Align = alCustom
              BevelOuter = bvNone
              TabOrder = 4
              object Shape5666: TShape
                Left = 0
                Top = 38
                Width = 461
                Height = 1
                Align = alBottom
                Pen.Color = clBtnShadow
              end
              object btNotApprovedCover: TBitBtn
                Left = 8
                Top = 7
                Width = 241
                Height = 25
                Caption = #1053#1077#1087#1086#1076#1090#1074#1077#1088#1078#1076#1105#1085#1085#1099#1077' '#1089#1076#1077#1083#1082#1080' '#1085#1072' '#1086#1073#1083#1086#1078#1082#1091
                DoubleBuffered = True
                Glyph.Data = {
                  42010000424D4201000000000000760000002800000013000000110000000100
                  040000000000CC00000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                  DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                  7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                  000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                  78888800000087FF7779977777788800000088777AA77777707778000000DD88
                  F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                  0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                  88DDDDD00000}
                ParentDoubleBuffered = False
                TabOrder = 0
                OnClick = btNotApprovedCoverClick
              end
            end
            object pnlSdelkaByOffice: TPanel
              Left = 0
              Top = 0
              Width = 449
              Height = 39
              BevelOuter = bvNone
              TabOrder = 0
              Visible = False
              object Shape1777: TShape
                Left = 0
                Top = 38
                Width = 449
                Height = 1
                Align = alBottom
                Pen.Color = clBtnShadow
              end
              object Label1777: TLabel
                Left = 272
                Top = 14
                Width = 7
                Height = 13
                Caption = #1057
              end
              object Label2777: TLabel
                Left = 395
                Top = 14
                Width = 13
                Height = 13
                Caption = #1076#1086
              end
              object btSdelkaByOffice: TBitBtn
                Tag = 1
                Left = 8
                Top = 7
                Width = 169
                Height = 25
                Caption = #1057#1076#1077#1083#1082#1080' '#1087#1086' '#1086#1092#1080#1089#1091
                DoubleBuffered = True
                Glyph.Data = {
                  42010000424D4201000000000000760000002800000013000000110000000100
                  040000000000CC00000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                  DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                  7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                  000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                  78888800000087FF7779977777788800000088777AA77777707778000000DD88
                  F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                  0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                  88DDDDD00000}
                ParentDoubleBuffered = False
                TabOrder = 0
                OnClick = btSdelkaByOfficeClick
              end
              object edSdelkaByOfficeDateFrom: TEdit
                Left = 288
                Top = 10
                Width = 97
                Height = 21
                TabOrder = 1
              end
              object edSdelkaByOfficeDateTo: TEdit
                Left = 416
                Top = 10
                Width = 97
                Height = 21
                TabOrder = 2
              end
            end
            object pnlAssistants: TPanel
              Left = 0
              Top = 78
              Width = 461
              Height = 39
              Align = alCustom
              BevelOuter = bvNone
              TabOrder = 1
              object Shape2666: TShape
                Left = 0
                Top = 38
                Width = 461
                Height = 1
                Align = alBottom
                Pen.Color = clBtnShadow
              end
              object Label3666: TLabel
                Left = 171
                Top = 14
                Width = 7
                Height = 13
                Caption = #1057
              end
              object Label4666: TLabel
                Left = 247
                Top = 14
                Width = 13
                Height = 13
                Caption = #1076#1086
              end
              object btNalBarter: TBitBtn
                Tag = 1
                Left = 8
                Top = 7
                Width = 153
                Height = 25
                Caption = #1054#1087#1083'. '#1085#1072#1083'\'#1073#1072#1088#1090#1077#1088
                DoubleBuffered = True
                Glyph.Data = {
                  42010000424D4201000000000000760000002800000013000000110000000100
                  040000000000CC00000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                  DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                  7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                  000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                  78888800000087FF7779977777788800000088777AA77777707778000000DD88
                  F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                  0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                  88DDDDD00000}
                ParentDoubleBuffered = False
                TabOrder = 0
                OnClick = btNalBarterClick
              end
              object edNalBarterDateFrom: TEdit
                Left = 179
                Top = 10
                Width = 65
                Height = 21
                TabOrder = 1
              end
              object edNalBarterDateTo: TEdit
                Left = 264
                Top = 10
                Width = 65
                Height = 21
                TabOrder = 2
              end
            end
            object pnlSdelkaCountSummary: TPanel
              Left = 0
              Top = 311
              Width = 461
              Height = 39
              Align = alCustom
              BevelOuter = bvNone
              TabOrder = 9
              object Shape114: TShape
                Left = 0
                Top = 38
                Width = 461
                Height = 1
                Align = alBottom
                Pen.Color = clBtnShadow
              end
              object Label35: TLabel
                Left = 262
                Top = 14
                Width = 7
                Height = 13
                Caption = #1057
              end
              object Label36: TLabel
                Left = 355
                Top = 14
                Width = 13
                Height = 13
                Caption = #1076#1086
              end
              object btSdelkaCountSummary: TBitBtn
                Left = 8
                Top = 7
                Width = 121
                Height = 25
                Caption = #1054#1073#1097#1080#1081' '#1080#1090#1086#1075
                DoubleBuffered = True
                Glyph.Data = {
                  42010000424D4201000000000000760000002800000013000000110000000100
                  040000000000CC00000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                  DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                  7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                  000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                  78888800000087FF7779977777788800000088777AA77777707778000000DD88
                  F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                  0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                  88DDDDD00000}
                ParentDoubleBuffered = False
                TabOrder = 0
                OnClick = btSdelkaCountSummaryClick
              end
              object edSdelkaCountFrom: TEdit
                Left = 273
                Top = 10
                Width = 70
                Height = 21
                TabOrder = 1
              end
              object edSdelkaCountTo: TEdit
                Left = 376
                Top = 10
                Width = 70
                Height = 21
                TabOrder = 2
              end
              object cbSdelkaCountSummaryMode: TComboBox
                Left = 136
                Top = 10
                Width = 121
                Height = 21
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 3
                Text = #1042#1089#1105
                Items.Strings = (
                  #1042#1089#1105
                  #1042#1089#1105' '#1082#1088#1086#1084#1077' '#1057#1058
                  #1058#1086#1083#1100#1082#1086' '#1057#1058
                  #1042#1089#1105' '#1082#1088#1086#1084#1077' '#1088#1077#1075#1080#1086#1085#1086#1074
                  #1058#1086#1083#1100#1082#1086' '#1088#1077#1075#1080#1086#1085#1099
                  #1058#1086#1083#1100#1082#1086' '#1080#1085#1090' ('#1088#1077#1075#1080#1086#1085#1099')'
                  #1058#1086#1083#1100#1082#1086' '#1080#1085#1090#1077#1088#1085#1077#1090
                  #1042#1089#1105' '#1082#1088#1086#1084#1077' '#1080#1085#1090#1077#1088#1085#1077#1090#1072
                  #1058#1086#1083#1100#1082#1086' '#1056#1044#1046
                  #1042#1089#1105' '#1082#1088#1086#1084#1077' '#1056#1044#1046
                  #1058#1086#1083#1100#1082#1086' '#1055#1056
                  #1058#1086#1083#1100#1082#1086' '#1083#1080#1089#1090#1086#1074#1082#1080
                  #1058#1086#1083#1100#1082#1086' '#1056#1074#1050
                  #1042#1089#1105' '#1082#1088#1086#1084#1077' '#1056#1074#1050
                  #1055#1056' + '#1057#1058
                  #1042#1089#1105' '#1082#1088#1086#1084#1077' '#1053#1057
                  #1058#1086#1083#1100#1082#1086' '#1053#1057
                  #1058#1086#1083#1100#1082#1086' '#1055#1054#1087#1090#1087
                  #1042#1089#1077' '#1082#1088#1086#1084#1077' '#1056#1042#1050' '#1080' '#1055#1054#1087#1090#1087)
              end
            end
            object pnlSdelkaByPeriod: TPanel
              Left = 0
              Top = 0
              Width = 453
              Height = 39
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 10
              object Shape111: TShape
                Left = 0
                Top = 38
                Width = 453
                Height = 1
                Align = alBottom
                Pen.Color = clBtnShadow
              end
              object Label24: TLabel
                Left = 170
                Top = 14
                Width = 7
                Height = 13
                Caption = #1057
              end
              object Label25: TLabel
                Left = 247
                Top = 14
                Width = 13
                Height = 13
                Caption = #1076#1086
              end
              object btSdelkaByPeriod: TBitBtn
                Left = 8
                Top = 7
                Width = 153
                Height = 25
                Caption = #1057#1076#1077#1083#1082#1080' '#1079#1072' '#1087#1077#1088#1080#1086#1076
                DoubleBuffered = True
                Glyph.Data = {
                  42010000424D4201000000000000760000002800000013000000110000000100
                  040000000000CC00000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                  DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                  7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                  000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                  78888800000087FF7779977777788800000088777AA77777707778000000DD88
                  F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                  0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                  88DDDDD00000}
                ParentDoubleBuffered = False
                TabOrder = 0
                OnClick = btSdelkaByPeriodClick
              end
              object edAgRepFrom: TEdit
                Left = 178
                Top = 10
                Width = 65
                Height = 21
                Ctl3D = True
                ParentCtl3D = False
                TabOrder = 1
              end
              object edAgRepTo: TEdit
                Left = 264
                Top = 10
                Width = 65
                Height = 21
                TabOrder = 2
              end
            end
          end
        end
        object pnlReports2: TPanel
          Left = 457
          Top = 0
          Width = 459
          Height = 494
          Align = alClient
          BevelOuter = bvNone
          BorderStyle = bsSingle
          TabOrder = 1
          object pnlSdelkaNotPayed: TPanel
            Left = 0
            Top = 0
            Width = 455
            Height = 39
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Shape4777: TShape
              Left = 0
              Top = 38
              Width = 455
              Height = 1
              Align = alBottom
              Pen.Color = clBtnShadow
              ExplicitWidth = 447
            end
            object Label100: TLabel
              Left = 246
              Top = 12
              Width = 7
              Height = 13
              Caption = #1057
            end
            object Label101: TLabel
              Left = 323
              Top = 12
              Width = 13
              Height = 13
              Caption = #1076#1086
            end
            object btSdelkaNotPayed: TBitBtn
              Left = 8
              Top = 7
              Width = 169
              Height = 25
              Caption = #1053#1077#1086#1087#1083#1072#1095#1077#1085#1085#1099#1077' '#1089#1076#1077#1083#1082#1080
              DoubleBuffered = True
              Glyph.Data = {
                42010000424D4201000000000000760000002800000013000000110000000100
                040000000000CC00000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                78888800000087FF7779977777788800000088777AA77777707778000000DD88
                F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                88DDDDD00000}
              ParentDoubleBuffered = False
              TabOrder = 0
              OnClick = btSdelkaNotPayedClick
            end
            object cboGZNP: TComboBox
              Left = 184
              Top = 8
              Width = 57
              Height = 21
              Style = csDropDownList
              ItemIndex = 0
              TabOrder = 1
              Text = #1042#1089#1105
              Items.Strings = (
                #1042#1089#1105
                #1055#1056
                #1055#1054#1087#1090#1087
                #1057#1058
                #1056#1046
                #1056#1074#1050
                #1048#1085#1090#1077#1088#1085#1077#1090
                #1048#1085#1090'('#1088#1077#1075#1080#1086#1085#1099')')
            end
            object edRepNotPayFrom: TEdit
              Left = 254
              Top = 8
              Width = 65
              Height = 21
              Ctl3D = True
              ParentCtl3D = False
              TabOrder = 2
            end
            object edRepNotPayTo: TEdit
              Left = 340
              Top = 8
              Width = 65
              Height = 21
              TabOrder = 3
            end
          end
          object pnlNotApprovedSdelkas: TPanel
            Left = 0
            Top = 79
            Width = 409
            Height = 39
            Align = alCustom
            BevelOuter = bvNone
            TabOrder = 1
            object Shape157: TShape
              Left = 0
              Top = 38
              Width = 409
              Height = 1
              Align = alBottom
              Pen.Color = clBtnShadow
            end
            object btNotApprovedSdelkas: TBitBtn
              Left = 8
              Top = 7
              Width = 185
              Height = 25
              Caption = #1053#1077#1087#1086#1076#1090#1074#1077#1088#1078#1076#1105#1085#1085#1099#1077' '#1089#1076#1077#1083#1082#1080
              DoubleBuffered = True
              Glyph.Data = {
                42010000424D4201000000000000760000002800000013000000110000000100
                040000000000CC00000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                78888800000087FF7779977777788800000088777AA77777707778000000DD88
                F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                88DDDDD00000}
              ParentDoubleBuffered = False
              TabOrder = 0
              OnClick = btNotApprovedSdelkasClick
            end
            object cboGZ: TComboBox
              Left = 200
              Top = 8
              Width = 95
              Height = 21
              Style = csDropDownList
              ItemIndex = 0
              TabOrder = 1
              Text = #1042#1089#1105
              Items.Strings = (
                #1042#1089#1105
                #1055#1056
                #1055#1054#1087#1090#1087
                #1057#1058
                #1048#1085#1090#1077#1088#1085#1077#1090
                #1048#1085#1090'('#1088#1077#1075#1080#1086#1085#1099')')
            end
          end
          object pnlInterceptions: TPanel
            Left = 0
            Top = 39
            Width = 409
            Height = 39
            Align = alCustom
            BevelOuter = bvNone
            TabOrder = 2
            object Shape161: TShape
              Left = 0
              Top = 38
              Width = 409
              Height = 1
              Align = alBottom
              Pen.Color = clBtnShadow
            end
            object btInterceptions: TBitBtn
              Left = 8
              Top = 7
              Width = 185
              Height = 25
              Caption = #1055#1077#1088#1077#1089#1077#1095#1077#1085#1080#1103
              DoubleBuffered = True
              Glyph.Data = {
                42010000424D4201000000000000760000002800000013000000110000000100
                040000000000CC00000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                78888800000087FF7779977777788800000088777AA77777707778000000DD88
                F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                88DDDDD00000}
              ParentDoubleBuffered = False
              TabOrder = 0
              OnClick = btInterceptionsClick
            end
          end
          object pnlAllCustPrint: TPanel
            Left = 0
            Top = 159
            Width = 409
            Height = 39
            Align = alCustom
            BevelOuter = bvNone
            TabOrder = 3
            object Shape118: TShape
              Left = 0
              Top = 38
              Width = 409
              Height = 1
              Align = alBottom
              Pen.Color = clBtnShadow
            end
            object Shape69: TShape
              Left = 0
              Top = 37
              Width = 409
              Height = 1
              Align = alBottom
              Pen.Color = clBtnShadow
            end
            object btAllCustPrint: TBitBtn
              Left = 8
              Top = 7
              Width = 185
              Height = 25
              Caption = #1042#1089#1077' '#1082#1083#1080#1077#1085#1090#1099' '#1072#1075#1077#1085#1090#1072
              DoubleBuffered = True
              Glyph.Data = {
                42010000424D4201000000000000760000002800000013000000110000000100
                040000000000CC00000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                78888800000087FF7779977777788800000088777AA77777707778000000DD88
                F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                88DDDDD00000}
              ParentDoubleBuffered = False
              TabOrder = 0
              OnClick = btAllCustPrintClick
            end
          end
          object pnlOtkaznikExit: TPanel
            Left = 0
            Top = 199
            Width = 409
            Height = 230
            Align = alCustom
            BevelOuter = bvNone
            TabOrder = 4
            object Shape68: TShape
              Left = 0
              Top = 229
              Width = 409
              Height = 1
              Align = alBottom
              Pen.Color = clBtnShadow
            end
            object Label73: TLabel
              Left = 24
              Top = 92
              Width = 29
              Height = 13
              Caption = #8470' '#1055#1056
            end
            object Label74: TLabel
              Left = 24
              Top = 116
              Width = 30
              Height = 13
              Caption = #8470' '#1053#1057
            end
            object Label75: TLabel
              Left = 17
              Top = 44
              Width = 251
              Height = 45
              AutoSize = False
              Caption = 
                #1053#1086#1084#1077#1088' '#1075#1072#1079#1077#1090#1099', '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1073#1091#1076#1077#1090' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100#1089#1103' '#1086#1090#1082#1072#1079#1085#1080#1082' ('#1085 +
                #1072#1087#1088#1080#1084#1077#1088', 20 '#1085#1086#1084#1077#1088#1086#1074' '#1085#1072#1079#1072#1076'):'
              WordWrap = True
            end
            object Label83: TLabel
              Left = 24
              Top = 140
              Width = 29
              Height = 13
              Caption = #8470' '#1057#1056
            end
            object Label90: TLabel
              Left = 24
              Top = 164
              Width = 32
              Height = 13
              Caption = #8470' '#1056#1046
            end
            object Label91: TLabel
              Left = 24
              Top = 188
              Width = 29
              Height = 13
              Caption = #8470' '#1056#1050
            end
            object btOtkaznikExit: TBitBtn
              Left = 8
              Top = 7
              Width = 265
              Height = 25
              Caption = #1050#1072#1082#1080#1077' '#1090#1077#1083#1077#1092#1086#1085#1099' '#1074#1099#1081#1076#1091#1090' '#1080#1079' '#1086#1090#1082#1072#1079#1085#1080#1082#1072'?'
              DoubleBuffered = True
              Glyph.Data = {
                42010000424D4201000000000000760000002800000013000000110000000100
                040000000000CC00000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                78888800000087FF7779977777788800000088777AA77777707778000000DD88
                F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                88DDDDD00000}
              ParentDoubleBuffered = False
              TabOrder = 0
              OnClick = btOtkaznikExitClick
            end
            object cbOtkaznikExitPR: TDBLookupComboBox
              Left = 67
              Top = 88
              Width = 142
              Height = 21
              KeyField = 'IS_ID'
              ListField = 'IS_NAME_COMPOSED'
              TabOrder = 1
            end
            object cbOtkaznikExitNS: TDBLookupComboBox
              Left = 68
              Top = 112
              Width = 141
              Height = 21
              KeyField = 'IS_ID'
              ListField = 'IS_NAME_COMPOSED'
              TabOrder = 2
            end
            object cbOtkaznikExitSR: TDBLookupComboBox
              Left = 68
              Top = 136
              Width = 141
              Height = 21
              KeyField = 'IS_ID'
              ListField = 'IS_NAME_COMPOSED'
              TabOrder = 3
            end
            object cbOtkaznikExitRZ: TDBLookupComboBox
              Left = 68
              Top = 160
              Width = 141
              Height = 21
              KeyField = 'IS_ID'
              ListField = 'IS_NAME_COMPOSED'
              TabOrder = 4
            end
            object cbOtkaznikExitRK: TDBLookupComboBox
              Left = 68
              Top = 184
              Width = 141
              Height = 21
              KeyField = 'IS_ID'
              ListField = 'IS_NAME_COMPOSED'
              TabOrder = 5
            end
          end
          object pnlAttentionObjavs: TPanel
            Left = 0
            Top = 119
            Width = 409
            Height = 39
            Align = alCustom
            BevelOuter = bvNone
            TabOrder = 5
            object Shape76: TShape
              Left = 0
              Top = 38
              Width = 409
              Height = 1
              Align = alBottom
              Pen.Color = clBtnShadow
            end
            object btAttentionObjavs: TBitBtn
              Left = 8
              Top = 7
              Width = 217
              Height = 25
              Caption = #1054#1073#1098#1103#1074#1083#1077#1085#1080#1103', '#1090#1088#1077#1073#1091#1102#1097#1080#1077' '#1074#1085#1080#1084#1072#1085#1080#1103
              DoubleBuffered = True
              Glyph.Data = {
                42010000424D4201000000000000760000002800000013000000110000000100
                040000000000CC00000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
                DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
                7700788008800DD00000D07700777888800880D00000D80077777888888000D0
                000000777777F8888888800000008F7777FF77788888880000008F77FF777777
                78888800000087FF7779977777788800000088777AA77777707778000000DD88
                F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
                0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
                88DDDDD00000}
              ParentDoubleBuffered = False
              TabOrder = 0
              OnClick = btAttentionObjavsClick
            end
          end
          object Panel44: TPanel
            Left = -24
            Top = 428
            Width = 425
            Height = 39
            Align = alCustom
            BevelOuter = bvNone
            TabOrder = 6
            object Shape93: TShape
              Left = 0
              Top = 38
              Width = 425
              Height = 1
              Align = alBottom
              Pen.Color = clBtnShadow
            end
            object btExportVIPModules: TBitBtn
              Left = 32
              Top = 7
              Width = 265
              Height = 25
              Caption = #1069#1082#1089#1087#1086#1088#1090' VIP-'#1084#1086#1076#1091#1083#1077#1081' '#1074' '#1085#1086#1084#1077#1088#1077
              DoubleBuffered = True
              ParentDoubleBuffered = False
              TabOrder = 0
              Visible = False
              OnClick = btExportVIPModulesClick
            end
          end
        end
        object pnlBuhgalter: TPanel
          Left = 292
          Top = 640
          Width = 457
          Height = 49
          TabOrder = 2
          Visible = False
          object Label48: TLabel
            Left = 200
            Top = 21
            Width = 7
            Height = 13
            Caption = #1057
            Transparent = True
          end
          object Label49: TLabel
            Left = 323
            Top = 21
            Width = 13
            Height = 13
            Caption = #1076#1086
            Transparent = True
          end
          object btBuhgalterByTime: TBitBtn
            Left = 8
            Top = 13
            Width = 185
            Height = 25
            Caption = #1055#1086#1084#1086#1096#1085#1080#1082' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1072
            DoubleBuffered = True
            Enabled = False
            Glyph.Data = {
              42010000424D4201000000000000760000002800000013000000110000000100
              040000000000CC00000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
              DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
              7700788008800DD00000D07700777888800880D00000D80077777888888000D0
              000000777777F8888888800000008F7777FF77788888880000008F77FF777777
              78888800000087FF7779977777788800000088777AA77777707778000000DD88
              F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
              0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
              88DDDDD00000}
            ParentDoubleBuffered = False
            TabOrder = 0
          end
          object edBuhgalterFrom: TEdit
            Left = 216
            Top = 17
            Width = 97
            Height = 21
            TabOrder = 1
          end
          object edBuhgalterTo: TEdit
            Left = 344
            Top = 17
            Width = 97
            Height = 21
            TabOrder = 2
          end
        end
        object pnlBonus: TPanel
          Left = 292
          Top = 552
          Width = 465
          Height = 57
          TabOrder = 3
          Visible = False
          object Label46: TLabel
            Left = 208
            Top = 22
            Width = 7
            Height = 13
            Caption = #1057
          end
          object Label47: TLabel
            Left = 331
            Top = 22
            Width = 13
            Height = 13
            Caption = #1076#1086
          end
          object btBonusLogByTime: TBitBtn
            Left = 16
            Top = 15
            Width = 185
            Height = 25
            Caption = #1041#1086#1085#1091#1089#1099
            DoubleBuffered = True
            Glyph.Data = {
              42010000424D4201000000000000760000002800000013000000110000000100
              040000000000CC00000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
              DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
              7700788008800DD00000D07700777888800880D00000D80077777888888000D0
              000000777777F8888888800000008F7777FF77788888880000008F77FF777777
              78888800000087FF7779977777788800000088777AA77777707778000000DD88
              F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
              0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
              88DDDDD00000}
            ParentDoubleBuffered = False
            TabOrder = 0
            OnClick = btBonusLogByTimeClick
          end
          object edBonusLogFrom: TEdit
            Left = 224
            Top = 18
            Width = 97
            Height = 21
            TabOrder = 1
          end
          object edBonusLogTo: TEdit
            Left = 352
            Top = 18
            Width = 97
            Height = 21
            TabOrder = 2
          end
        end
      end
    end
    object tbAdmin: TTabSheet
      Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
      ImageIndex = 5
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 919
        Height = 545
        ActivePage = tabSdelka
        Align = alClient
        DockSite = True
        DragKind = dkDock
        Style = tsFlatButtons
        TabOrder = 0
        OnChange = PageControl1Change
        object TabSheet7: TTabSheet
          Caption = #1040#1075#1077#1085#1090#1099' '#1080' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
          ImageIndex = 2
          object Shape11: TShape
            Left = -2
            Top = 0
            Width = 761
            Height = 1
            Pen.Color = clBtnShadow
          end
          object Shape6: TShape
            Left = 0
            Top = 513
            Width = 911
            Height = 1
            Align = alBottom
            Pen.Color = clBtnShadow
            ExplicitTop = 502
            ExplicitWidth = 903
          end
          object Shape7: TShape
            Left = 0
            Top = 18
            Width = 1
            Height = 495
            Align = alLeft
            Pen.Color = clBtnShadow
            ExplicitHeight = 484
          end
          object Shape9: TShape
            Left = 910
            Top = 18
            Width = 1
            Height = 495
            Align = alRight
            Pen.Color = clBtnShadow
            ExplicitLeft = 902
            ExplicitHeight = 484
          end
          object Shape27: TShape
            Left = 0
            Top = 0
            Width = 911
            Height = 1
            Align = alTop
            Pen.Color = clBtnShadow
            ExplicitWidth = 903
          end
          object Panel27: TPanel
            Left = 1
            Top = 18
            Width = 352
            Height = 495
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object Panel30: TPanel
              Left = 0
              Top = 458
              Width = 352
              Height = 37
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 0
              DesignSize = (
                352
                37)
              object btSaveAgents: TBitBtn
                Left = 259
                Top = 9
                Width = 91
                Height = 25
                Anchors = [akRight, akBottom]
                Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
                DoubleBuffered = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Glyph.Data = {
                  CE000000424DCE0000000000000076000000280000000B0000000B0000000100
                  04000000000058000000C40E0000C40E00001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
                  0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
                  0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
                  0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
                ParentDoubleBuffered = False
                ParentFont = False
                TabOrder = 0
                OnClick = btSaveAgentsClick
              end
            end
          end
          object Panel28: TPanel
            Left = 353
            Top = 18
            Width = 297
            Height = 495
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object Panel31: TPanel
              Left = 0
              Top = 458
              Width = 297
              Height = 37
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 0
              DesignSize = (
                297
                37)
              object btSaveUsers: TBitBtn
                Left = 204
                Top = 9
                Width = 91
                Height = 25
                Anchors = [akRight, akBottom]
                Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
                DoubleBuffered = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Glyph.Data = {
                  CE000000424DCE0000000000000076000000280000000B0000000B0000000100
                  04000000000058000000C40E0000C40E00001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
                  0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
                  0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
                  0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
                ParentDoubleBuffered = False
                ParentFont = False
                TabOrder = 0
                OnClick = btSaveUsersClick
              end
            end
          end
          object Panel29: TPanel
            Left = 650
            Top = 18
            Width = 247
            Height = 495
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 2
            object Panel32: TPanel
              Left = 0
              Top = 458
              Width = 247
              Height = 37
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 0
              DesignSize = (
                247
                37)
              object btSaveUserRights: TBitBtn
                Left = 144
                Top = 9
                Width = 91
                Height = 25
                Anchors = [akRight, akBottom]
                Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
                DoubleBuffered = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Glyph.Data = {
                  CE000000424DCE0000000000000076000000280000000B0000000B0000000100
                  04000000000058000000C40E0000C40E00001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
                  0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
                  0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
                  0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
                ParentDoubleBuffered = False
                ParentFont = False
                TabOrder = 0
                OnClick = btSaveUserRightsClick
              end
            end
          end
          object HeaderControl1: THeaderControl
            Left = 0
            Top = 1
            Width = 911
            Height = 17
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Sections = <
              item
                Alignment = taCenter
                ImageIndex = -1
                Text = #1040#1075#1077#1085#1090#1099
                Width = 300
              end
              item
                Alignment = taCenter
                ImageIndex = -1
                Text = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
                Width = 330
              end
              item
                Alignment = taCenter
                ImageIndex = -1
                Text = #1055#1088#1072#1074#1072' '#1076#1086#1089#1090#1091#1087#1072
                Width = 270
              end>
            OnSectionTrack = HeaderControl1SectionTrack
            ParentFont = False
          end
        end
        object TabSheet8: TTabSheet
          Caption = #1043#1072#1079#1077#1090#1072
          ImageIndex = 3
          object Shape23: TShape
            Left = 910
            Top = 0
            Width = 1
            Height = 514
            Align = alRight
            Pen.Color = clBtnShadow
            ExplicitLeft = 902
            ExplicitHeight = 503
          end
          object Panel42: TPanel
            Left = 0
            Top = 0
            Width = 296
            Height = 514
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              296
              514)
            object Shape21: TShape
              Left = 8
              Top = 472
              Width = 280
              Height = 1
              Anchors = [akRight, akBottom]
              Pen.Color = clBtnShadow
            end
            object Label7: TLabel
              Left = 8
              Top = 8
              Width = 50
              Height = 13
              Caption = #1042#1099#1093#1086#1076#1099
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Shape22: TShape
              Left = 0
              Top = 0
              Width = 1
              Height = 513
              Align = alLeft
              Pen.Color = clBtnShadow
              ExplicitHeight = 502
            end
            object Shape24: TShape
              Left = 295
              Top = 0
              Width = 1
              Height = 513
              Align = alRight
              Pen.Color = clBtnShadow
              ExplicitHeight = 502
            end
            object Shape91: TShape
              Left = -465
              Top = 0
              Width = 761
              Height = 1
              Pen.Color = clBtnShadow
            end
            object Shape20: TShape
              Left = 0
              Top = 513
              Width = 296
              Height = 1
              Align = alBottom
              Pen.Color = clBtnShadow
              ExplicitTop = 502
            end
            object Label1: TLabel
              Left = 7
              Top = 480
              Width = 50
              Height = 13
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            end
            object Label2: TLabel
              Left = 104
              Top = 480
              Width = 56
              Height = 13
              Caption = #1085#1086#1084#1077#1088#1072'('#1086#1074')'
            end
            object cbGazetaForIssue: TDBLookupComboBox
              Left = 10
              Top = 24
              Width = 210
              Height = 21
              KeyField = 'GZ_ID'
              ListField = 'GZ_NAME'
              TabOrder = 0
            end
            object btShowIssuesForGazeta: TBitBtn
              Left = 224
              Top = 24
              Width = 63
              Height = 21
              Caption = #1087#1086#1082#1072#1079#1072#1090#1100
              DoubleBuffered = True
              ParentDoubleBuffered = False
              TabOrder = 1
              OnClick = btShowIssuesForGazetaClick
            end
            object btSaveIssues: TBitBtn
              Left = 197
              Top = 475
              Width = 91
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
              DoubleBuffered = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                CE000000424DCE0000000000000076000000280000000B0000000B0000000100
                04000000000058000000C40E0000C40E00001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
                0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
                0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
                0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
              ParentDoubleBuffered = False
              ParentFont = False
              TabOrder = 3
              OnClick = btSaveIssuesClick
            end
            object txtIss: TEdit
              Left = 61
              Top = 477
              Width = 36
              Height = 21
              MaxLength = 1
              TabOrder = 2
            end
          end
          object Panel43: TPanel
            Left = 296
            Top = 0
            Width = 614
            Height = 514
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              614
              514)
            object Shape30: TShape
              Left = 7
              Top = 455
              Width = 448
              Height = 1
              Pen.Color = clBtnShadow
            end
            object Label9: TLabel
              Left = 9
              Top = 272
              Width = 55
              Height = 13
              Anchors = [akLeft, akBottom]
              Caption = #1060#1086#1088#1084#1072#1090#1099
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 9
              Top = 8
              Width = 47
              Height = 13
              Caption = #1056#1091#1073#1088#1080#1082#1080
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Shape25: TShape
              Left = -3
              Top = 254
              Width = 625
              Height = 1
              Anchors = [akLeft, akRight, akBottom]
              Pen.Color = clBtnShadow
            end
            object Shape92: TShape
              Left = 0
              Top = 513
              Width = 614
              Height = 1
              Align = alBottom
              Pen.Color = clBtnShadow
              ExplicitTop = 502
              ExplicitWidth = 606
            end
            object Shape16: TShape
              Left = 0
              Top = 0
              Width = 614
              Height = 1
              Align = alTop
              Pen.Color = clBtnShadow
              ExplicitWidth = 606
            end
            object btDeleteFormat: TBitBtn
              Left = 490
              Top = 275
              Width = 25
              Height = 17
              DoubleBuffered = True
              Glyph.Data = {
                6A000000424D6A000000000000003E000000280000000B0000000B0000000100
                0100000000002C0000000000000000000000020000000000000000000000FFFF
                FF00FFE00000FFE00000FFE00000FFE00000002000000020000000200000FFE0
                0000FFE00000FFE00000FFE00000}
              ParentDoubleBuffered = False
              TabOrder = 0
              TabStop = False
              Visible = False
            end
            object btEditFormat: TBitBtn
              Left = 513
              Top = 470
              Width = 80
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = #1056#1077#1076#1072#1082#1090'.'
              DoubleBuffered = True
              Glyph.Data = {
                52000000424D52000000000000003E000000280000000B000000050000000100
                010000000000140000000000000000000000020000000000000000000000FFFF
                FF0080200000C0600000E0E00000F1E00000FBE00000}
              ParentDoubleBuffered = False
              TabOrder = 1
              TabStop = False
              OnClick = btEditFormatClick
            end
            object btAddFormat: TBitBtn
              Left = 427
              Top = 470
              Width = 80
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100
              DoubleBuffered = True
              Glyph.Data = {
                62000000424D62000000000000003E0000002800000009000000090000000100
                010000000000240000000000000000000000020000000000000000000000FFFF
                FF00E3800000E3800000E3800000000000000000000000000000E3800000E380
                0000E3800000}
              ParentDoubleBuffered = False
              TabOrder = 2
              OnClick = btAddFormatClick
            end
            object cdGzFormat: TDBLookupComboBox
              Left = 74
              Top = 268
              Width = 210
              Height = 21
              Anchors = [akLeft, akBottom]
              KeyField = 'GZ_ID'
              ListField = 'GZ_NAME'
              TabOrder = 4
              OnCloseUp = cdGzFormatCloseUp
            end
            object cdGzRubrika: TDBLookupComboBox
              Left = 63
              Top = 2
              Width = 210
              Height = 21
              KeyField = 'GZ_ID'
              ListField = 'GZ_NAME'
              TabOrder = 6
              OnCloseUp = cdGzRubrikaCloseUp
            end
            object btNewRubrika: TBitBtn
              Left = 411
              Top = 222
              Width = 80
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100
              DoubleBuffered = True
              Glyph.Data = {
                62000000424D62000000000000003E0000002800000009000000090000000100
                010000000000240000000000000000000000020000000000000000000000FFFF
                FF00E3800000E3800000E3800000000000000000000000000000E3800000E380
                0000E3800000}
              ParentDoubleBuffered = False
              TabOrder = 3
              OnClick = btNewRubrikaClick
            end
            object btEditRubrika: TBitBtn
              Left = 497
              Top = 222
              Width = 80
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = #1056#1077#1076#1072#1082#1090'.'
              DoubleBuffered = True
              Glyph.Data = {
                52000000424D52000000000000003E000000280000000B000000050000000100
                010000000000140000000000000000000000020000000000000000000000FFFF
                FF0080200000C0600000E0E00000F1E00000FBE00000}
              ParentDoubleBuffered = False
              TabOrder = 5
              TabStop = False
              OnClick = btEditRubrikaClick
            end
          end
        end
        object tbAdminOtkaznik: TTabSheet
          Caption = #1054#1090#1082#1072#1079#1085#1080#1082
          ImageIndex = 4
          DesignSize = (
            911
            514)
          object Label20: TLabel
            Left = 6
            Top = 5
            Width = 286
            Height = 13
            Caption = #1058#1077#1083#1077#1092#1086#1085#1099', '#1085#1072#1093#1086#1076#1103#1097#1080#1077#1089#1103' '#1074' '#1086#1090#1082#1072#1079#1085#1080#1082#1077' '#1087#1086#1089#1090#1086#1103#1085#1085#1086
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label21: TLabel
            Left = 494
            Top = 5
            Width = 84
            Height = 13
            Caption = #1042#1077#1089#1100' '#1086#1090#1082#1072#1079#1085#1080#1082
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Shape17: TShape
            Left = -2
            Top = 0
            Width = 761
            Height = 1
            Pen.Color = clBtnShadow
          end
          object Shape33: TShape
            Left = 0
            Top = 513
            Width = 911
            Height = 1
            Align = alBottom
            Pen.Color = clBtnShadow
            ExplicitTop = 502
            ExplicitWidth = 903
          end
          object Shape40: TShape
            Left = 0
            Top = 453
            Width = 756
            Height = 1
            Pen.Color = clBtnShadow
          end
          object Shape41: TShape
            Left = 0
            Top = 380
            Width = 756
            Height = 1
            Pen.Color = clBtnShadow
          end
          object Shape32: TShape
            Left = 0
            Top = 0
            Width = 1
            Height = 513
            Align = alLeft
            Pen.Color = clBtnShadow
            ExplicitHeight = 502
          end
          object Shape39: TShape
            Left = 910
            Top = 0
            Width = 1
            Height = 513
            Align = alRight
            Pen.Color = clBtnShadow
            ExplicitLeft = 902
            ExplicitHeight = 502
          end
          object Shape89: TShape
            Left = 8
            Top = 343
            Width = 473
            Height = 1
            Pen.Color = clBtnShadow
          end
          object Shape49: TShape
            Left = 496
            Top = 343
            Width = 255
            Height = 1
            Pen.Color = clBtnShadow
          end
          object Shape90: TShape
            Left = 488
            Top = 1
            Width = 1
            Height = 380
            Pen.Color = clBtnShadow
          end
          object DBGrid7: TDBGrid
            Left = 496
            Top = 21
            Width = 384
            Height = 316
            Anchors = [akLeft, akTop, akRight]
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = ppGrid
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'OT_NUMBER'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'AG_NAME'
                Title.Caption = #1040#1075#1077#1085#1090
                Width = 146
                Visible = True
              end>
          end
          object btRefreshOtkaznik: TBitBtn
            Left = 506
            Top = 461
            Width = 244
            Height = 25
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100' ('#1084#1086#1078#1077#1090' '#1079#1072#1085#1103#1090#1100' '#1084#1085#1086#1075#1086' '#1074#1088#1077#1084#1077#1085#1080')'
            DoubleBuffered = True
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
              FFFFFFFFF00FFFFFFFFFFFF88000FFFFFFFFFF0000000FFFFFFFF0000000FF80
              FFFF808FF00FFF000FFF00FFF0FFFFF008FF00FFFFFFFFFF00FF00FFFFFFFFFF
              00FF800FFFFF0FFF00FFF000FFF00FF808FFFF08FF0000000FFFFFFFF0000000
              FFFFFFFFFF00088FFFFFFFFFFFF00FFFFFFFFFFFFFFF0FFFFFFF}
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 1
            OnClick = btRefreshOtkaznikClick
          end
          object GroupBox1: TGroupBox
            Left = 6
            Top = 384
            Width = 880
            Height = 62
            Anchors = [akLeft, akTop, akRight]
            Caption = #1042#1099#1087#1091#1089#1082' '#1075#1072#1079#1077#1090#1099', '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1090#1077#1083#1077#1092#1086#1085#1099' '#1087#1086#1087#1072#1076#1072#1102#1090' '#1074' '#1086#1090#1082#1072#1079#1085#1080#1082
            TabOrder = 2
            object Label12: TLabel
              Left = 7
              Top = 27
              Width = 21
              Height = 13
              Caption = '"'#1055#1056'"'
            end
            object Label13: TLabel
              Left = 138
              Top = 27
              Width = 22
              Height = 13
              Caption = '"'#1053'C"'
            end
            object Label82: TLabel
              Left = 268
              Top = 27
              Width = 21
              Height = 13
              Caption = '"'#1057'T"'
            end
            object Label97: TLabel
              Left = 399
              Top = 27
              Width = 24
              Height = 13
              Caption = '"'#1056#1046'"'
            end
            object Label98: TLabel
              Left = 533
              Top = 26
              Width = 27
              Height = 13
              Caption = '"'#1056#1074#1050'"'
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 29
              Top = 23
              Width = 100
              Height = 21
              DataField = 'PM_FIRST_OTKAZNIK_ISSUE_PR'
              KeyField = 'IS_ID'
              ListField = 'IS_NAME_COMPOSED'
              TabOrder = 0
            end
            object DBLookupComboBox2: TDBLookupComboBox
              Left = 164
              Top = 23
              Width = 100
              Height = 21
              DataField = 'PM_FIRST_OTKAZNIK_ISSUE_NS'
              KeyField = 'IS_ID'
              ListField = 'IS_NAME_COMPOSED'
              TabOrder = 1
            end
            object DBNavigator1: TDBNavigator
              Left = 686
              Top = 20
              Width = 36
              Height = 25
              VisibleButtons = [nbPost]
              TabOrder = 2
              OnClick = DBNavigator1Click
            end
            object DBLookupComboBox7: TDBLookupComboBox
              Left = 294
              Top = 23
              Width = 100
              Height = 21
              DataField = 'PM_FIRST_OTKAZNIK_ISSUE_SR'
              KeyField = 'IS_ID'
              ListField = 'IS_NAME_COMPOSED'
              TabOrder = 3
            end
            object DBLookupComboBox10: TDBLookupComboBox
              Left = 429
              Top = 22
              Width = 100
              Height = 21
              DataField = 'PM_FIRST_OTKAZNIK_ISSUE_RZ'
              KeyField = 'IS_ID'
              ListField = 'IS_NAME_COMPOSED'
              TabOrder = 4
            end
            object DBLookupComboBox11: TDBLookupComboBox
              Left = 565
              Top = 23
              Width = 100
              Height = 21
              DataField = 'PM_FIRST_OTKAZNIK_ISSUE_RK'
              KeyField = 'IS_ID'
              ListField = 'IS_NAME_COMPOSED'
              TabOrder = 5
            end
          end
          object btImportOtkaznik: TBitBtn
            Left = 9
            Top = 461
            Width = 182
            Height = 25
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1090#1082#1072#1079#1085#1080#1082' '#1080#1079' '#1092#1072#1081#1083#1072
            DoubleBuffered = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
              9999000000000009999900333333333099990B033333333309990FB033333333
              30990BFB0333333333090FBFB000000000000BFBFBFBFB0999990FBFBFBFBF09
              99990BFB00000009999990009999999900099999999999999009999999990999
              0909999999999000999999999999999999999999999999999999}
            ParentDoubleBuffered = False
            TabOrder = 3
            OnClick = btImportOtkaznikClick
          end
          object btPrintOtkaznik: TBitBtn
            Left = 199
            Top = 461
            Width = 151
            Height = 25
            Caption = #1053#1072#1087#1077#1095#1072#1090#1072#1090#1100' '#1086#1090#1082#1072#1079#1085#1080#1082
            DoubleBuffered = True
            Glyph.Data = {
              42010000424D4201000000000000760000002800000013000000110000000100
              040000000000CC00000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
              DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
              7700788008800DD00000D07700777888800880D00000D80077777888888000D0
              000000777777F8888888800000008F7777FF77788888880000008F77FF777777
              78888800000087FF7779977777788800000088777AA77777707778000000DD88
              F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
              0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
              88DDDDD00000}
            ParentDoubleBuffered = False
            TabOrder = 4
            OnClick = btPrintOtkaznikClick
          end
          object btSaveOtkaznikToFile: TBitBtn
            Left = 358
            Top = 461
            Width = 140
            Height = 25
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1086#1090#1082#1072#1079#1085#1080#1082
            DoubleBuffered = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
              9999990000000000000990330000003303099033000000330309903300000033
              0309903300000000030990333333333333099033000000003309903099999999
              0309903099999999030990309999999903099030999999990309903099999999
              0009903099999999030990000000000000099999999999999999}
            ParentDoubleBuffered = False
            TabOrder = 5
            OnClick = btSaveOtkaznikToFileClick
          end
          object DBGrid11: TDBGrid
            Left = 8
            Top = 21
            Width = 473
            Height = 316
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = ppGrid
            TabOrder = 6
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'OT_NUMBER'
                Width = 74
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OT_COMMENT'
                Width = 376
                Visible = True
              end>
          end
          object btSaveOtkaznik: TBitBtn
            Left = 649
            Top = 350
            Width = 91
            Height = 25
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              CE000000424DCE0000000000000076000000280000000B0000000B0000000100
              04000000000058000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
              0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
              0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
              0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 7
            OnClick = btSaveOtkaznikClick
          end
          object btSavePermanentOtkaznik: TBitBtn
            Left = 383
            Top = 350
            Width = 91
            Height = 25
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              CE000000424DCE0000000000000076000000280000000B0000000B0000000100
              04000000000058000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
              0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
              0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
              0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 8
            OnClick = btSavePermanentOtkaznikClick
          end
        end
        object TabSheet6: TTabSheet
          Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1087#1088#1086#1094#1077#1085#1090#1072
          ImageIndex = 5
          DesignSize = (
            911
            514)
          object Shape95: TShape
            Left = -2
            Top = 0
            Width = 761
            Height = 1
            Pen.Color = clBtnShadow
          end
          object Shape96: TShape
            Left = 910
            Top = 0
            Width = 1
            Height = 513
            Align = alRight
            Pen.Color = clBtnShadow
            ExplicitLeft = 902
            ExplicitHeight = 502
          end
          object Shape97: TShape
            Left = 0
            Top = 0
            Width = 1
            Height = 513
            Align = alLeft
            Pen.Color = clBtnShadow
            ExplicitHeight = 502
          end
          object Shape98: TShape
            Left = 0
            Top = 513
            Width = 911
            Height = 1
            Align = alBottom
            Pen.Color = clBtnShadow
            ExplicitTop = 502
            ExplicitWidth = 903
          end
          object Label70: TLabel
            Left = 8
            Top = 7
            Width = 321
            Height = 13
            Caption = #1055#1088#1086#1089#1090#1072#1074#1100#1090#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1087#1088#1086#1094#1077#1085#1090#1072' '#1076#1083#1103' '#1082#1072#1078#1076#1086#1075#1086' '#1072#1075#1077#1085#1090#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Shape99: TShape
            Left = 9
            Top = 454
            Width = 736
            Height = 1
            Pen.Color = clBtnShadow
          end
          object Label71: TLabel
            Left = 88
            Top = 469
            Width = 31
            Height = 13
            Anchors = [akRight, akBottom]
            Caption = #1053#1086#1084#1077#1088
          end
          object btDoAlterAgentPercent: TBitBtn
            Left = 399
            Top = 464
            Width = 101
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
            DoubleBuffered = True
            Enabled = False
            Glyph.Data = {
              BE000000424DBE0000000000000076000000280000000E000000090000000100
              04000000000048000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7700774877777777770078477777444447007477777774444700747777777744
              4700747777777474470078477774477747007784444777777700777777777777
              7700}
            ParentDoubleBuffered = False
            TabOrder = 0
            OnClick = btDoAlterAgentPercentClick
          end
          object BitBtn25: TBitBtn
            Left = 266
            Top = 464
            Width = 125
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = #1053#1072#1095#1072#1090#1100' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1077
            DoubleBuffered = True
            ParentDoubleBuffered = False
            TabOrder = 2
            OnClick = BitBtn25Click
          end
          object cbAlterAgentPercentIssue: TComboBox
            Left = 138
            Top = 466
            Width = 120
            Height = 21
            Style = csDropDownList
            Anchors = [akRight, akBottom]
            ItemIndex = 0
            TabOrder = 1
            Text = #1047#1072#1082#1088#1099#1090#1099#1081
            Items.Strings = (
              #1047#1072#1082#1088#1099#1090#1099#1081
              #1058#1077#1082#1091#1097#1080#1081)
          end
        end
        object TabSheet9: TTabSheet
          Caption = #1057#1072#1081#1090
          ImageIndex = 6
          DesignSize = (
            911
            514)
          object Shape70: TShape
            Left = -2
            Top = 0
            Width = 902
            Height = 1
            Anchors = [akLeft, akTop, akRight]
            Pen.Color = clBtnShadow
          end
          object Shape71: TShape
            Left = 910
            Top = 0
            Width = 1
            Height = 513
            Align = alRight
            Pen.Color = clBtnShadow
            ExplicitLeft = 902
            ExplicitHeight = 502
          end
          object Shape72: TShape
            Left = 0
            Top = 0
            Width = 1
            Height = 513
            Align = alLeft
            Pen.Color = clBtnShadow
            ExplicitHeight = 502
          end
          object Shape73: TShape
            Left = 9
            Top = 454
            Width = 832
            Height = 1
            Pen.Color = clBtnShadow
          end
          object Shape74: TShape
            Left = 0
            Top = 513
            Width = 911
            Height = 1
            Align = alBottom
            Pen.Color = clBtnShadow
            ExplicitTop = 502
            ExplicitWidth = 903
          end
          object Label77: TLabel
            Left = 8
            Top = 7
            Width = 123
            Height = 13
            Caption = #1042#1089#1077' '#1088#1091#1073#1088#1080#1082#1080' '#1085#1072' '#1089#1072#1081#1090#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Shape75: TShape
            Left = 296
            Top = 6
            Width = 1
            Height = 443
            Pen.Color = clBtnShadow
          end
          object Label79: TLabel
            Left = 304
            Top = 7
            Width = 241
            Height = 13
            Caption = #1057#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1088#1091#1073#1088#1080#1082' '#1074' '#1075#1072#1079#1077#1090#1077' '#1080' '#1085#1072' '#1089#1072#1081#1090#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btSaveRubrikaSite: TBitBtn
            Left = 756
            Top = 461
            Width = 91
            Height = 25
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              CE000000424DCE0000000000000076000000280000000B0000000B0000000100
              04000000000058000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
              0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
              0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
              0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 1
            OnClick = btSaveRubrikaSiteClick
          end
          object dblRP_Gazeta: TDBLookupComboBox
            Left = 552
            Top = 5
            Width = 199
            Height = 21
            KeyField = 'GZ_ID'
            ListField = 'GZ_NAME'
            TabOrder = 0
            OnCloseUp = dblRP_GazetaCloseUp
          end
        end
        object tbAdminOther: TTabSheet
          Caption = #1055#1088#1086#1095#1077#1077
          ImageIndex = 3
          object Shape18: TShape
            Left = -2
            Top = 0
            Width = 761
            Height = 1
            Pen.Color = clBtnShadow
          end
          object Shape37: TShape
            Left = 0
            Top = 513
            Width = 911
            Height = 1
            Align = alBottom
            Pen.Color = clBtnShadow
            ExplicitTop = 502
            ExplicitWidth = 903
          end
          object Shape35: TShape
            Left = 0
            Top = 0
            Width = 1
            Height = 513
            Align = alLeft
            Pen.Color = clBtnShadow
            ExplicitHeight = 502
          end
          object Shape46: TShape
            Left = 910
            Top = 0
            Width = 1
            Height = 513
            Align = alRight
            Pen.Color = clBtnShadow
            ExplicitLeft = 902
            ExplicitHeight = 502
          end
          object Shape3: TShape
            Left = 408
            Top = -2
            Width = 1
            Height = 329
            Pen.Color = clBtnShadow
          end
          object Label10: TLabel
            Left = 16
            Top = 5
            Width = 99
            Height = 26
            Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088' "'#1055#1088#1086#1087#1086#1085#1091#1102' '#1056#1086#1073#1086#1090#1091'"'
            WordWrap = True
          end
          object Label34: TLabel
            Left = 16
            Top = 74
            Width = 103
            Height = 26
            Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088' "'#1053#1072#1074#1095#1072#1085#1085#1103' '#1089#1100#1086#1075#1086#1076#1085'i"'
            WordWrap = True
          end
          object Shape4: TShape
            Left = 0
            Top = 137
            Width = 409
            Height = 1
            Pen.Color = clBtnShadow
          end
          object Shape56: TShape
            Left = 0
            Top = 327
            Width = 409
            Height = 1
            Pen.Color = clBtnShadow
          end
          object Shape57: TShape
            Left = 0
            Top = 66
            Width = 409
            Height = 1
            Pen.Color = clBtnShadow
          end
          object Label44: TLabel
            Left = 6
            Top = 37
            Width = 395
            Height = 26
            Caption = 
              #1087#1077#1088#1077#1076' '#1087#1077#1088#1077#1093#1086#1076#1086#1084' '#1082' '#1089#1083#1077#1076#1091#1102#1097#1077#1084#1091' '#1085#1086#1084#1077#1088#1091' '#1085#1077' '#1079#1072#1073#1091#1076#1100#1090#1077' '#1087#1088#1086#1089#1090#1072#1074#1080#1090#1100' '#1085#1086#1084#1077#1088 +
              ' '#1075#1072#1079#1077#1090#1099', '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '#1086#1090#1082#1072#1079#1085#1080#1082' ('#1085#1072' '#1079#1072#1082#1083#1072#1076#1082#1077' "'#1086 +
              #1090#1082#1072#1079#1085#1080#1082'")'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsItalic]
            ParentFont = False
            WordWrap = True
          end
          object Label45: TLabel
            Left = 6
            Top = 105
            Width = 395
            Height = 26
            Caption = 
              #1087#1077#1088#1077#1076' '#1087#1077#1088#1077#1093#1086#1076#1086#1084' '#1082' '#1089#1083#1077#1076#1091#1102#1097#1077#1084#1091' '#1085#1086#1084#1077#1088#1091' '#1085#1077' '#1079#1072#1073#1091#1076#1100#1090#1077' '#1087#1088#1086#1089#1090#1072#1074#1080#1090#1100' '#1085#1086#1084#1077#1088 +
              ' '#1075#1072#1079#1077#1090#1099', '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '#1086#1090#1082#1072#1079#1085#1080#1082' ('#1085#1072' '#1079#1072#1082#1083#1072#1076#1082#1077' "'#1086 +
              #1090#1082#1072#1079#1085#1080#1082'")'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsItalic]
            ParentFont = False
            WordWrap = True
          end
          object Label76: TLabel
            Left = 416
            Top = 338
            Width = 77
            Height = 13
            Caption = #1056#1077#1078#1080#1084' '#1088#1072#1073#1086#1090#1099':'
            Visible = False
          end
          object Label32: TLabel
            Left = 16
            Top = 143
            Width = 104
            Height = 26
            Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088' "'#1057#1088#1086#1095#1085#1086' '#1090#1088#1077#1073#1091#1102#1090#1089#1103'"'
            WordWrap = True
          end
          object Label33: TLabel
            Left = 6
            Top = 174
            Width = 395
            Height = 26
            Caption = 
              #1087#1077#1088#1077#1076' '#1087#1077#1088#1077#1093#1086#1076#1086#1084' '#1082' '#1089#1083#1077#1076#1091#1102#1097#1077#1084#1091' '#1085#1086#1084#1077#1088#1091' '#1085#1077' '#1079#1072#1073#1091#1076#1100#1090#1077' '#1087#1088#1086#1089#1090#1072#1074#1080#1090#1100' '#1085#1086#1084#1077#1088 +
              ' '#1075#1072#1079#1077#1090#1099', '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '#1086#1090#1082#1072#1079#1085#1080#1082' ('#1085#1072' '#1079#1072#1082#1083#1072#1076#1082#1077' "'#1086 +
              #1090#1082#1072#1079#1085#1080#1082'")'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsItalic]
            ParentFont = False
            WordWrap = True
          end
          object Shape10: TShape
            Left = 408
            Top = 91
            Width = 349
            Height = 1
            Pen.Color = clBtnShadow
          end
          object Label29: TLabel
            Left = 424
            Top = 121
            Width = 79
            Height = 13
            Caption = #1055#1088#1086#1082#1089#1080'-'#1089#1077#1088#1074#1077#1088':'
            Visible = False
          end
          object Label60: TLabel
            Left = 424
            Top = 148
            Width = 29
            Height = 13
            Caption = #1055#1086#1088#1090':'
            Visible = False
          end
          object Label84: TLabel
            Left = 424
            Top = 169
            Width = 76
            Height = 13
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
            Visible = False
          end
          object Label85: TLabel
            Left = 424
            Top = 193
            Width = 41
            Height = 13
            Caption = #1055#1072#1088#1086#1083#1100':'
            Visible = False
          end
          object Label86: TLabel
            Left = 424
            Top = 217
            Width = 73
            Height = 13
            Caption = 'URL '#1074#1072#1082#1072#1085#1089#1080#1081':'
            Visible = False
          end
          object Label87: TLabel
            Left = 416
            Top = 98
            Width = 145
            Height = 13
            Caption = #1048#1084#1087#1086#1088#1090' '#1074#1072#1082#1072#1085#1089#1080#1081' '#1089' '#1089#1072#1081#1090#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object Shape5: TShape
            Left = 0
            Top = 203
            Width = 409
            Height = 1
            Pen.Color = clBtnShadow
          end
          object Label92: TLabel
            Left = 16
            Top = 207
            Width = 110
            Height = 26
            Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088' "'#1056#1086#1073#1086#1090#1072' '#1076#1083#1103' '#1078#1077#1085#1097#1080#1085'"'
            WordWrap = True
          end
          object Label93: TLabel
            Left = 6
            Top = 239
            Width = 395
            Height = 26
            Caption = 
              #1087#1077#1088#1077#1076' '#1087#1077#1088#1077#1093#1086#1076#1086#1084' '#1082' '#1089#1083#1077#1076#1091#1102#1097#1077#1084#1091' '#1085#1086#1084#1077#1088#1091' '#1085#1077' '#1079#1072#1073#1091#1076#1100#1090#1077' '#1087#1088#1086#1089#1090#1072#1074#1080#1090#1100' '#1085#1086#1084#1077#1088 +
              ' '#1075#1072#1079#1077#1090#1099', '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '#1086#1090#1082#1072#1079#1085#1080#1082' ('#1085#1072' '#1079#1072#1082#1083#1072#1076#1082#1077' "'#1086 +
              #1090#1082#1072#1079#1085#1080#1082'")'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsItalic]
            ParentFont = False
            WordWrap = True
          end
          object Shape31: TShape
            Left = 0
            Top = 268
            Width = 409
            Height = 1
            Pen.Color = clBtnShadow
          end
          object Label94: TLabel
            Left = 16
            Top = 271
            Width = 87
            Height = 26
            Caption = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088' "'#1056#1086#1073#1086#1090#1072' '#1074' '#1050#1080#1077#1074#1077'"'
            WordWrap = True
          end
          object Label95: TLabel
            Left = 6
            Top = 298
            Width = 395
            Height = 26
            Caption = 
              #1087#1077#1088#1077#1076' '#1087#1077#1088#1077#1093#1086#1076#1086#1084' '#1082' '#1089#1083#1077#1076#1091#1102#1097#1077#1084#1091' '#1085#1086#1084#1077#1088#1091' '#1085#1077' '#1079#1072#1073#1091#1076#1100#1090#1077' '#1087#1088#1086#1089#1090#1072#1074#1080#1090#1100' '#1085#1086#1084#1077#1088 +
              ' '#1075#1072#1079#1077#1090#1099', '#1085#1072#1095#1080#1085#1072#1103' '#1089' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1092#1086#1088#1084#1080#1088#1091#1077#1090#1089#1103' '#1086#1090#1082#1072#1079#1085#1080#1082' ('#1085#1072' '#1079#1072#1082#1083#1072#1076#1082#1077' "'#1086 +
              #1090#1082#1072#1079#1085#1080#1082'")'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsItalic]
            ParentFont = False
            WordWrap = True
          end
          object DBLookupComboBox4: TDBLookupComboBox
            Left = 136
            Top = 78
            Width = 121
            Height = 21
            Color = clBtnFace
            DataField = 'PM_CURRENT_ISSUE_NS'
            KeyField = 'IS_ID'
            ListField = 'IS_NAME_COMPOSED'
            ReadOnly = True
            TabOrder = 0
          end
          object DBLookupComboBox3: TDBLookupComboBox
            Left = 136
            Top = 9
            Width = 121
            Height = 21
            Color = clBtnFace
            DataField = 'PM_CURRENT_ISSUE_PR'
            KeyField = 'IS_ID'
            ListField = 'IS_NAME_COMPOSED'
            ReadOnly = True
            TabOrder = 1
          end
          object btNextIssuePR: TBitBtn
            Left = 263
            Top = 7
            Width = 125
            Height = 25
            Caption = #1057#1083#1077#1076#1091#1102#1097#1080#1081' '#1085#1086#1084#1077#1088
            DoubleBuffered = True
            Glyph.Data = {
              BE000000424DBE0000000000000076000000280000000E000000090000000100
              04000000000048000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7700774877777777770078477777444447007477777774444700747777777744
              4700747777777474470078477774477747007784444777777700777777777777
              7700}
            ParentDoubleBuffered = False
            TabOrder = 2
            OnClick = btNextIssuePRClick
          end
          object btNextIssueNS: TBitBtn
            Left = 263
            Top = 76
            Width = 125
            Height = 25
            Caption = #1057#1083#1077#1076#1091#1102#1097#1080#1081' '#1085#1086#1084#1077#1088
            DoubleBuffered = True
            Glyph.Data = {
              BE000000424DBE0000000000000076000000280000000E000000090000000100
              04000000000048000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7700774877777777770078477777444447007477777774444700747777777744
              4700747777777474470078477774477747007784444777777700777777777777
              7700}
            ParentDoubleBuffered = False
            TabOrder = 3
            OnClick = btNextIssuePRClick
          end
          object DBLookupComboBox5: TDBLookupComboBox
            Left = 498
            Top = 334
            Width = 239
            Height = 21
            DataField = 'PM_SYNC_STATE'
            KeyField = 'SS_ID'
            ListField = 'SS_NAME'
            TabOrder = 4
            Visible = False
          end
          object btSaveParamsInet: TBitBtn
            Left = 654
            Top = 241
            Width = 91
            Height = 25
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              CE000000424DCE0000000000000076000000280000000B0000000B0000000100
              04000000000058000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
              0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
              0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
              0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 5
            Visible = False
            OnClick = btSaveParamsClick
          end
          object BitBtn8: TBitBtn
            Left = 424
            Top = 7
            Width = 273
            Height = 25
            Caption = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1088#1091#1073#1088#1080#1082#1080' '#1076#1083#1103' '#1084#1086#1080#1093' '#1072#1075#1077#1085#1090#1086#1074
            DoubleBuffered = True
            Glyph.Data = {
              FE000000424DFE0000000000000076000000280000000E000000110000000100
              04000000000088000000C40E0000C40E00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
              FF00F00000000000FF00F333333333330F00F3FBBBBBBBB30F00F3F333333383
              0F00F3FBBBBBBBB30F00F3F3333333830F00F3FBBBBBBBB30F00F3FFFFFFFFF3
              0F00FF33333333330F00FFF303333303FF00FFF30FFFF30FFF00FFF30FFFF30F
              FF00FFF380FF330FFF00FFFF380030FFFF00FFFFF3333FFFFF00FFFFFFFFFFFF
              FF00}
            ParentDoubleBuffered = False
            TabOrder = 6
            OnClick = BitBtn8Click
          end
          object BitBtn13: TBitBtn
            Left = 424
            Top = 38
            Width = 273
            Height = 25
            Caption = #1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1088#1091#1073#1088#1080#1082#1080' '#1076#1083#1103' '#1084#1086#1080#1093' '#1072#1075#1077#1085#1090#1086#1074
            DoubleBuffered = True
            Glyph.Data = {
              FE000000424DFE00000000000000760000002800000010000000110000000100
              0400000000008800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
              FFFF00000000000FFFFF333333333330FFFF3FBBBBBBBB30FFFF3F3333333830
              FFFF3FBBBBBBBB30FFFF3F3333333830FFFF3FBBBBBBBB30FFFF3FFFFFFFFF30
              FFFFF33333333330FFFFFF303333303FFF30FFFFFFFF30FFFF30FFFFFFFF30FF
              FF30FFFFFFFF33FFFF30FFFFFFFFF3000838FFFFFFFFFF3333FFFFFFFFFFFFFF
              FFFF}
            ParentDoubleBuffered = False
            TabOrder = 7
            OnClick = BitBtn13Click
          end
          object Panel45: TPanel
            Left = 432
            Top = 208
            Width = 289
            Height = 105
            TabOrder = 8
            Visible = False
            object Label27: TLabel
              Left = 8
              Top = 49
              Width = 94
              Height = 13
              Caption = #1041#1086#1085#1091#1089#1085#1099#1081' '#1087#1088#1086#1094#1077#1085#1090
            end
            object Label26: TLabel
              Left = 8
              Top = 9
              Width = 139
              Height = 26
              Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1072#1103' '#1089#1091#1084#1084#1072' '#1089#1076#1077#1083#1082#1080' '#1076#1083#1103' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1073#1086#1085#1091#1089#1072
              WordWrap = True
            end
            object DBEdit2: TDBEdit
              Left = 156
              Top = 13
              Width = 121
              Height = 21
              DataField = 'PM_MIN_BONUS_SUM'
              TabOrder = 0
            end
            object DBEdit3: TDBEdit
              Left = 156
              Top = 45
              Width = 121
              Height = 21
              DataField = 'PM_BONUS_PERCENT'
              TabOrder = 1
            end
            object btSaveParams: TBitBtn
              Left = 187
              Top = 72
              Width = 91
              Height = 25
              Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
              DoubleBuffered = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                CE000000424DCE0000000000000076000000280000000B0000000B0000000100
                04000000000058000000C40E0000C40E00001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
                0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
                0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
                0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
              ParentDoubleBuffered = False
              ParentFont = False
              TabOrder = 2
              OnClick = btSaveParamsClick
            end
          end
          object DBLookupComboBox6: TDBLookupComboBox
            Left = 136
            Top = 147
            Width = 121
            Height = 21
            Color = clBtnFace
            DataField = 'PM_CURRENT_ISSUE_SR'
            KeyField = 'IS_ID'
            ListField = 'IS_NAME_COMPOSED'
            ReadOnly = True
            TabOrder = 9
          end
          object btNextIssueSR: TBitBtn
            Left = 263
            Top = 145
            Width = 125
            Height = 25
            Caption = #1057#1083#1077#1076#1091#1102#1097#1080#1081' '#1085#1086#1084#1077#1088
            DoubleBuffered = True
            Glyph.Data = {
              BE000000424DBE0000000000000076000000280000000E000000090000000100
              04000000000048000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7700774877777777770078477777444447007477777774444700747777777744
              4700747777777474470078477774477747007784444777777700777777777777
              7700}
            ParentDoubleBuffered = False
            TabOrder = 11
            OnClick = btNextIssuePRClick
          end
          object btNextIssueRZ: TBitBtn
            Left = 271
            Top = 209
            Width = 125
            Height = 25
            Caption = #1057#1083#1077#1076#1091#1102#1097#1080#1081' '#1085#1086#1084#1077#1088
            DoubleBuffered = True
            Glyph.Data = {
              BE000000424DBE0000000000000076000000280000000E000000090000000100
              04000000000048000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7700774877777777770078477777444447007477777774444700747777777744
              4700747777777474470078477774477747007784444777777700777777777777
              7700}
            ParentDoubleBuffered = False
            TabOrder = 10
            OnClick = btNextIssuePRClick
          end
          object DBLookupComboBox8: TDBLookupComboBox
            Left = 136
            Top = 211
            Width = 121
            Height = 21
            Color = clBtnFace
            DataField = 'PM_CURRENT_ISSUE_RZ'
            KeyField = 'IS_ID'
            ListField = 'IS_NAME_COMPOSED'
            ReadOnly = True
            TabOrder = 12
          end
          object btNextIssueRK: TBitBtn
            Left = 279
            Top = 273
            Width = 125
            Height = 25
            Caption = #1057#1083#1077#1076#1091#1102#1097#1080#1081' '#1085#1086#1084#1077#1088
            DoubleBuffered = True
            Glyph.Data = {
              BE000000424DBE0000000000000076000000280000000E000000090000000100
              04000000000048000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7700774877777777770078477777444447007477777774444700747777777744
              4700747777777474470078477774477747007784444777777700777777777777
              7700}
            ParentDoubleBuffered = False
            TabOrder = 13
            OnClick = btNextIssuePRClick
          end
          object DBLookupComboBox9: TDBLookupComboBox
            Left = 136
            Top = 275
            Width = 121
            Height = 21
            Color = clBtnFace
            DataField = 'PM_CURRENT_ISSUE_RK'
            KeyField = 'IS_ID'
            ListField = 'IS_NAME_COMPOSED'
            ReadOnly = True
            TabOrder = 14
          end
        end
        object tabSdelka: TTabSheet
          Caption = #1059#1095#1077#1090' '#1089#1076#1077#1083#1086#1082
          ImageIndex = 6
        end
      end
    end
    object tbKorrectura: TTabSheet
      Caption = #1050#1086#1088#1088#1077#1082#1090#1091#1088#1072
      ImageIndex = 10
      object Shape29: TShape
        Left = 773
        Top = 70
        Width = 1
        Height = 441
        Align = alRight
        Pen.Color = clBtnShadow
        ExplicitLeft = 765
        ExplicitHeight = 430
      end
      object Panel13: TPanel
        Left = 0
        Top = 0
        Width = 919
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Shape88: TShape
          Left = 191
          Top = 4
          Width = 1
          Height = 29
          Pen.Color = clBtnShadow
        end
        object Shape87: TShape
          Left = 0
          Top = 34
          Width = 919
          Height = 1
          Align = alBottom
          Pen.Color = clBtnShadow
          ExplicitWidth = 911
        end
        object btRepAllByRubForCorrector: TBitBtn
          Tag = 1
          Left = 197
          Top = 6
          Width = 156
          Height = 25
          Caption = #1054#1073#1098#1103#1074#1083#1077#1085#1080#1103' '#1074' '#1088#1091#1073#1088#1080#1082#1091
          DoubleBuffered = True
          Glyph.Data = {
            42010000424D4201000000000000760000002800000013000000110000000100
            040000000000CC00000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
            DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
            7700788008800DD00000D07700777888800880D00000D80077777888888000D0
            000000777777F8888888800000008F7777FF77788888880000008F77FF777777
            78888800000087FF7779977777788800000088777AA77777707778000000DD88
            F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
            0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
            88DDDDD00000}
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = btRepAllByRubForCorrectorClick
        end
        object cbRepAllByRubForCorrectorGZ: TDBLookupComboBox
          Left = 333
          Top = 32
          Width = 119
          Height = 21
          KeyField = 'GZ_ID'
          ListField = 'GZ_NAME'
          TabOrder = 1
          Visible = False
        end
        object btRepByRubForCorrector: TBitBtn
          Tag = 1
          Left = 4
          Top = 6
          Width = 182
          Height = 25
          Caption = #1048#1090#1086#1075' '#1087#1086' '#1092#1086#1088#1084#1072#1090#1072#1084'/'#1088#1091#1073#1088#1080#1082#1072#1084
          DoubleBuffered = True
          Glyph.Data = {
            42010000424D4201000000000000760000002800000013000000110000000100
            040000000000CC00000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
            DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
            7700788008800DD00000D07700777888800880D00000D80077777888888000D0
            000000777777F8888888800000008F7777FF77788888880000008F77FF777777
            78888800000087FF7779977777788800000088777AA77777707778000000DD88
            F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
            0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
            88DDDDD00000}
          ParentDoubleBuffered = False
          TabOrder = 3
          OnClick = btRepByRubForCorrectorClick
        end
        object edChangedAfter: TMaskEdit
          Left = 663
          Top = 8
          Width = 90
          Height = 21
          EditMask = '!99/99/00 90:00;1;_'
          MaxLength = 14
          TabOrder = 2
          Text = '  .  .     :  '
        end
      end
      object Panel22: TPanel
        Left = 0
        Top = 70
        Width = 773
        Height = 441
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 5
        TabOrder = 1
      end
      object Panel23: TPanel
        Left = 0
        Top = 511
        Width = 919
        Height = 34
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object Shape85: TShape
          Left = 0
          Top = 0
          Width = 919
          Height = 1
          Align = alTop
          Pen.Color = clBtnShadow
          ExplicitWidth = 911
        end
        object btCorrectObjav: TBitBtn
          Left = 7
          Top = 6
          Width = 144
          Height = 25
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1077#1082#1089#1090
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDCCDDCDDD
            DDDDDDDCDDCCDCDDDDDDCDC0000DDDCDDDDDDCD08830DDDDDDDDDDD08B330DDD
            DDDDDDD0BBB330DDDDDDDDDD0BBB330DDDDDDDDDD0BBB330DDDDDDDDDD0BBB33
            0DDDDDDDDDD0BBB330DDDDDDDDDD0BB3000DDDDDDDDDD0B0330DDDDDDDDDDD00
            B30DDDDDDDDDDDD000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 0
          OnClick = btCorrectObjavClick
        end
        object btRefreshKorrektura: TBitBtn
          Left = 159
          Top = 6
          Width = 144
          Height = 25
          Caption = #1054#1073#1085#1086#1074#1080#1090#1100
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
            FFFFFFFFF00FFFFFFFFFFFF88000FFFFFFFFFF0000000FFFFFFFF0000000FF80
            FFFF808FF00FFF000FFF00FFF0FFFFF008FF00FFFFFFFFFF00FF00FFFFFFFFFF
            00FF800FFFFF0FFF00FFF000FFF00FF808FFFF08FF0000000FFFFFFFF0000000
            FFFFFFFFFF00088FFFFFFFFFFFF00FFFFFFFFFFFFFFF0FFFFFFF}
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 1
          OnClick = btRefreshKorrekturaClick
        end
        object btFindForCorrector: TBitBtn
          Left = 312
          Top = 6
          Width = 207
          Height = 25
          Caption = #1055#1086#1080#1089#1082' '#1076#1083#1103' '#1074#1085#1077#1089#1077#1085#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333300000333330000030F000333330F00030F000333330F000300000003000
            0000300F000000F00000300F000300F00000300F000300F00000330000000000
            00033330F00030F000333330000030000033333300033300033333330F03330F
            0333333300033300033333333333333333333333333333333333}
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 2
          OnClick = btFindForCorrectorClick
        end
      end
      object Panel24: TPanel
        Left = 774
        Top = 70
        Width = 145
        Height = 441
        Align = alRight
        BevelOuter = bvNone
        BorderWidth = 5
        TabOrder = 3
        Visible = False
        object Label72: TLabel
          Left = 5
          Top = 5
          Width = 135
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1077' '#1073#1083#1072#1085#1082#1080
          ExplicitWidth = 115
        end
        object Panel25: TPanel
          Left = 5
          Top = 381
          Width = 135
          Height = 55
          Align = alBottom
          BevelOuter = bvNone
          BorderWidth = 5
          TabOrder = 0
          object SpeedButton1: TSpeedButton
            Left = 9
            Top = 3
            Width = 30
            Height = 25
            Hint = #1055#1086#1083#1086#1078#1080#1090#1100' '#1073#1083#1072#1085#1082#1080' '#1074' '#1086#1073#1097#1091#1102' '#1089#1090#1086#1087#1082#1091
            Glyph.Data = {
              E6000000424DE60000000000000076000000280000000F0000000E0000000100
              0400000000007000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00880000000008
              88808880B8B8B8B088808888077777780880880000000007B0808880BBBBBBB0
              000088880BBBBBBB0880888880BBBBBBB0808888880000000000888888888888
              888088888844448888808488888C4488888084888884C4888880874888478488
              88808874447888888880}
            ParentShowHint = False
            ShowHint = True
          end
          object SpeedButton5: TSpeedButton
            Left = 39
            Top = 3
            Width = 23
            Height = 25
            Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1073#1083#1072#1085#1082' '#1089' '#1085#1086#1084#1077#1088#1086#1084' '#1089#1076#1077#1083#1082#1080'...'
            Glyph.Data = {
              62000000424D62000000000000003E0000002800000009000000090000000100
              010000000000240000000000000000000000020000000000000000000000FFFF
              FF00E3800000E3800000E3800000000000000000000000000000E3800000E380
              0000E3800000}
            ParentShowHint = False
            ShowHint = True
          end
          object SpeedButton4: TSpeedButton
            Left = 62
            Top = 3
            Width = 23
            Height = 25
            Hint = #1059#1073#1088#1072#1090#1100' '#1073#1083#1072#1085#1082
            Glyph.Data = {
              6A000000424D6A000000000000003E000000280000000B0000000B0000000100
              0100000000002C0000000000000000000000020000000000000000000000FFFF
              FF00FFE00000FFE00000FFE00000FFE00000002000000020000000200000FFE0
              0000FFE00000FFE00000FFE00000}
            ParentShowHint = False
            ShowHint = True
          end
          object SpeedButton2: TSpeedButton
            Left = 85
            Top = 3
            Width = 23
            Height = 25
            Hint = #1054#1087#1091#1089#1090#1080#1090#1100' '#1073#1083#1072#1085#1082' '#1085#1080#1078#1077
            Glyph.Data = {
              CE000000424DCE0000000000000076000000280000000B0000000B0000000100
              04000000000058000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFF0
              0000FFFFFFFFFFF00000FFFFF4FFFFF00000FFFF444FFFF00000FFF44444FFF0
              0000FF4444444FF00000F444444444F000004444444444400000FFFFFFFFFFF0
              0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
            ParentShowHint = False
            ShowHint = True
          end
          object SpeedButton3: TSpeedButton
            Left = 108
            Top = 3
            Width = 23
            Height = 25
            Hint = #1055#1086#1076#1085#1103#1090#1100' '#1073#1083#1072#1085#1082' '#1074#1099#1096#1077
            Glyph.Data = {
              CE000000424DCE0000000000000076000000280000000B0000000B0000000100
              04000000000058000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFF0
              0000FFFFFFFFFFF00000FFFFFFFFFFF000004444444444400000F444444444F0
              0000FF4444444FF00000FFF44444FFF00000FFFF444FFFF00000FFFFF4FFFFF0
              0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
            ParentShowHint = False
            ShowHint = True
          end
          object SpeedButton6: TSpeedButton
            Left = 8
            Top = 28
            Width = 123
            Height = 25
            Hint = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1086#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1093' '#1073#1083#1072#1085#1082#1086#1074' '#1074' '#1086#1073#1097#1077#1081' '#1089#1090#1086#1087#1082#1077
            Caption = #1054#1073#1097#1072#1103' '#1089#1090#1086#1087#1082#1072'...'
            Glyph.Data = {
              E6000000424DE60000000000000076000000280000000F0000000E0000000100
              0400000000007000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888088888888888888808000000000888880880B8B8B8B088880888077777780
              888080000000007B0880880BBBBBBB0000808880BBBBBBB0888088880BBBBBBB
              0880888880000000008088888888888888808888888888888880888888888888
              88808888888888888880}
            ParentShowHint = False
            ShowHint = True
          end
        end
      end
      object Panel26: TPanel
        Left = 0
        Top = 35
        Width = 919
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
        object Shape100: TShape
          Left = 0
          Top = 34
          Width = 919
          Height = 1
          Align = alBottom
          Pen.Color = clBtnShadow
          ExplicitWidth = 911
        end
        object Label54: TLabel
          Left = 8
          Top = 10
          Width = 20
          Height = 13
          Caption = #1050#1086#1076
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label96: TLabel
          Left = 136
          Top = 10
          Width = 39
          Height = 13
          Caption = #1043#1072#1079#1077#1090#1072':'
        end
        object Label99: TLabel
          Left = 368
          Top = 10
          Width = 35
          Height = 13
          Caption = #1053#1086#1084#1077#1088':'
        end
        object cbGZ_: TComboBox
          Left = 656
          Top = 8
          Width = 121
          Height = 21
          Style = csDropDownList
          ItemIndex = 1
          TabOrder = 0
          Text = #1055#1088#1086#1087#1086#1085#1091#1102' '#1088#1086#1073#1086#1090#1091
          Visible = False
          Items.Strings = (
            ''
            #1055#1088#1086#1087#1086#1085#1091#1102' '#1088#1086#1073#1086#1090#1091
            #1055#1088#1086#1087#1086#1085#1091#1102' '#1086#1075#1086#1083#1086#1096#1077#1085#1085#1103
            #1057#1088#1086#1095#1085#1086' '#1090#1088#1077#1073#1091#1102#1090#1089#1103
            #1056#1072#1073#1086#1090#1072' '#1076#1083#1103' '#1078#1077#1085#1097#1080#1085
            #1056#1086#1073#1086#1090#1072' '#1074' '#1050#1080#1108#1074#1110)
        end
        object btnShowKorrectura: TButton
          Left = 529
          Top = 8
          Width = 113
          Height = 20
          Caption = #1055#1086#1082#1072#1079#1072#1090#1100
          TabOrder = 2
          OnClick = btnShowKorrecturaClick
        end
        object cboIss: TComboBox
          Left = 408
          Top = 8
          Width = 113
          Height = 21
          Style = csDropDownList
          TabOrder = 1
          OnChange = cboIssChange
        end
      end
    end
    object tbVerstka: TTabSheet
      Caption = #1042#1077#1088#1089#1090#1082#1072
      ImageIndex = 11
      object Shape86: TShape
        Left = 6
        Top = 27
        Width = 755
        Height = 2
        Pen.Color = clBtnShadow
      end
      object Panel35: TPanel
        Left = 0
        Top = 0
        Width = 919
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Shape58: TShape
          Left = 0
          Top = 34
          Width = 919
          Height = 1
          Align = alBottom
          Pen.Color = clBtnShadow
          ExplicitWidth = 911
        end
        object Label58: TLabel
          Left = 8
          Top = 10
          Width = 35
          Height = 13
          Caption = #1043#1072#1079#1077#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 749
          Top = 11
          Width = 60
          Height = 13
          Caption = #1050#1086#1076#1080#1088#1086#1074#1082#1072':'
        end
        object btVerstkaGazety: TBitBtn
          Left = 202
          Top = 6
          Width = 75
          Height = 21
          Caption = #1055#1086#1082#1072#1079#1072#1090#1100
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = btVerstkaGazetyClick
        end
        object btRepVerstkaObjavCount: TBitBtn
          Tag = 1
          Left = 285
          Top = 4
          Width = 172
          Height = 25
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1081
          DoubleBuffered = True
          Glyph.Data = {
            42010000424D4201000000000000760000002800000013000000110000000100
            040000000000CC00000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDD000D
            DDDDDDD00000DDDDDD0078800DDDDDD00000DDDD00770008800DDDD00000DD00
            7700788008800DD00000D07700777888800880D00000D80077777888888000D0
            000000777777F8888888800000008F7777FF77788888880000008F77FF777777
            78888800000087FF7779977777788800000088777AA77777707778000000DD88
            F777777FF0788DD00000DDDD88F78FFFFF0DDDD00000DDDDDD888FFFFFF0DDD0
            0000DDDDDDDD88FFFFFF00D00000DDDDDDDDDD8FFF88DDD00000DDDDDDDDDDD8
            88DDDDD00000}
          ParentDoubleBuffered = False
          TabOrder = 2
          OnClick = btRepVerstkaObjavCountClick
        end
        object cbCodePage: TComboBox
          Left = 816
          Top = 8
          Width = 89
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 1
          TabOrder = 1
          Text = 'UCS2'
          Items.Strings = (
            'ANSI'
            'UCS2'
            'UTF-8')
        end
      end
      object Panel36: TPanel
        Left = 0
        Top = 35
        Width = 919
        Height = 510
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object verstkaPages: TPageControl
          Left = 0
          Top = 8
          Width = 919
          Height = 502
          ActivePage = TabSheet10
          Align = alClient
          TabHeight = 20
          TabOrder = 0
          object tabObjavs: TTabSheet
            Caption = #1054#1073#1098#1103#1074#1083#1077#1085#1080#1103
            ImageIndex = 1
            object Panel38: TPanel
              Left = 0
              Top = 0
              Width = 911
              Height = 258
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              DesignSize = (
                911
                258)
              object Shape83: TShape
                Left = 0
                Top = 257
                Width = 911
                Height = 1
                Align = alBottom
                Pen.Color = clBtnShadow
                ExplicitTop = 246
                ExplicitWidth = 903
              end
              object Label55: TLabel
                Left = 620
                Top = 6
                Width = 42
                Height = 13
                Anchors = [akTop, akRight]
                Caption = #1056#1091#1073#1088#1080#1082#1072
                ExplicitLeft = 612
              end
              object Label62: TLabel
                Left = 8
                Top = 7
                Width = 306
                Height = 16
                Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103', '#1082#1086#1090#1086#1088#1099#1077' '#1085#1091#1078#1085#1086' '#1074#1085#1077#1089#1090#1080' '#1074' '#1074#1077#1088#1089#1090#1082#1091
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object btSelectedExport: TBitBtn
                Left = 485
                Top = 232
                Width = 138
                Height = 25
                Anchors = [akRight, akBottom]
                Caption = #1042#1099#1076#1077#1083#1077#1085#1085#1086#1077' '#1074' '#1092#1072#1081#1083
                DoubleBuffered = True
                Enabled = False
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
                  9999990000000000000990330000003303099033000000330309903300000033
                  0309903300000000030990333333333333099033000000003309903099999999
                  0309903099999999030990309999999903099030999999990309903099999999
                  0009903099999999030990000000000000099999999999999999}
                ParentDoubleBuffered = False
                TabOrder = 0
                OnClick = btSelectedExportClick
              end
              object btSelectAll: TBitBtn
                Left = 368
                Top = 232
                Width = 111
                Height = 25
                Anchors = [akRight, akBottom]
                Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
                DoubleBuffered = True
                Enabled = False
                Glyph.Data = {
                  EE000000424DEE0000000000000076000000280000000F0000000F0000000100
                  0400000000007800000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999900000000
                  00009999087777777700999908FF0FFFF700999908F000FFF70000000000000F
                  F700087777777700F70008FF0FFFF700070008F000FFF70007000800000FF70F
                  07000800F000F7088800080FFF000700000008FFFFF00709999008FFFFFF0709
                  999008888888880999900000000000099990}
                ParentDoubleBuffered = False
                TabOrder = 1
                OnClick = btSelectAllClick
              end
              object btRefreshVerstka: TBitBtn
                Left = 2
                Top = 232
                Width = 111
                Height = 25
                Anchors = [akLeft, akBottom]
                Caption = #1054#1073#1085#1086#1074#1080#1090#1100
                DoubleBuffered = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
                  FFFFFFFFF00FFFFFFFFFFFF88000FFFFFFFFFF0000000FFFFFFFF0000000FF80
                  FFFF808FF00FFF000FFF00FFF0FFFFF008FF00FFFFFFFFFF00FF00FFFFFFFFFF
                  00FF800FFFFF0FFF00FFF000FFF00FF808FFFF08FF0000000FFFFFFFF0000000
                  FFFFFFFFFF00088FFFFFFFFFFFF00FFFFFFFFFFFFFFF0FFFFFFF}
                ParentDoubleBuffered = False
                ParentFont = False
                TabOrder = 2
                OnClick = btRefreshVerstkaClick
              end
              object btOneSdelkaVerst: TBitBtn
                Left = 629
                Top = 232
                Width = 138
                Height = 25
                Anchors = [akRight, akBottom]
                Caption = #1042#1099#1076#1077#1083#1077#1085#1085#1086#1077' '#1075#1086#1090#1086#1074#1086
                DoubleBuffered = True
                Enabled = False
                Glyph.Data = {
                  CE000000424DCE0000000000000076000000280000000B0000000B0000000100
                  04000000000058000000C40E0000C40E00001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFF0
                  0000FFFFFFFFFFF00000FFFFF4FFFFF00000FFFF444FFFF00000FFF44444FFF0
                  0000FF4444444FF00000F444444444F000004444444444400000FFFFFFFFFFF0
                  0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
                Layout = blGlyphRight
                ParentDoubleBuffered = False
                TabOrder = 3
                OnClick = btOneSdelkaVerstClick
              end
              object btAllRubVerstka: TBitBtn
                Left = 770
                Top = 232
                Width = 138
                Height = 25
                Anchors = [akRight, akBottom]
                Caption = #1042#1089#1077' '#1088#1091#1073#1088#1080#1082#1080' - '#1075#1086#1090#1086#1074#1086
                DoubleBuffered = True
                Glyph.Data = {
                  CE000000424DCE0000000000000076000000280000000B0000000B0000000100
                  04000000000058000000C40E0000C40E00001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFF0
                  0000FFFFFFFFFFF00000FFFFF4FFFFF00000FFFF444FFFF00000FFF44444FFF0
                  0000FF4444444FF00000F444444444F000004444444444400000FFFFFFFFFFF0
                  0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
                Layout = blGlyphRight
                ParentDoubleBuffered = False
                TabOrder = 4
                OnClick = btAllRubVerstkaClick
              end
            end
            object Panel39: TPanel
              Left = 0
              Top = 258
              Width = 911
              Height = 214
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              DesignSize = (
                911
                214)
              object Label57: TLabel
                Left = 622
                Top = 8
                Width = 42
                Height = 13
                Anchors = [akTop, akRight]
                Caption = #1056#1091#1073#1088#1080#1082#1072
                ExplicitLeft = 614
              end
              object Label61: TLabel
                Left = 8
                Top = 9
                Width = 106
                Height = 16
                Caption = #1057#1077#1081#1095#1072#1089' '#1074' '#1075#1072#1079#1077#1090#1077
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object btRefreshSverstana: TBitBtn
                Left = 2
                Top = 187
                Width = 111
                Height = 25
                Anchors = [akLeft, akBottom]
                Caption = #1054#1073#1085#1086#1074#1080#1090#1100
                DoubleBuffered = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
                  FFFFFFFFF00FFFFFFFFFFFF88000FFFFFFFFFF0000000FFFFFFFF0000000FF80
                  FFFF808FF00FFF000FFF00FFF0FFFFF008FF00FFFFFFFFFF00FF00FFFFFFFFFF
                  00FF800FFFFF0FFF00FFF000FFF00FF808FFFF08FF0000000FFFFFFFF0000000
                  FFFFFFFFFF00088FFFFFFFFFFFF00FFFFFFFFFFFFFFF0FFFFFFF}
                ParentDoubleBuffered = False
                ParentFont = False
                TabOrder = 0
                OnClick = btRefreshSverstanaClick
              end
              object btClearVersting: TBitBtn
                Left = 118
                Top = 187
                Width = 111
                Height = 25
                Anchors = [akLeft, akBottom]
                Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1074#1089#1105
                DoubleBuffered = True
                Glyph.Data = {
                  E6000000424DE6000000000000007600000028000000100000000E0000000100
                  04000000000070000000CE0E0000D80E00001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
                  99999999999999990F99990F9999999999999000F9999990F9999000F999990F
                  999999000F99900F9999999000F900F99999999900000F99999999999000F999
                  9999999900000F999999999000F90F99999990000F99900F99990000F9999900
                  F99900F9999999900F99}
                ParentDoubleBuffered = False
                TabOrder = 1
                OnClick = btClearVerstingClick
              end
              object btClearVerstingRub: TBitBtn
                Left = 234
                Top = 187
                Width = 127
                Height = 25
                Anchors = [akLeft, akBottom]
                Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1088#1091#1073#1088#1080#1082#1091
                DoubleBuffered = True
                Enabled = False
                Glyph.Data = {
                  E6000000424DE6000000000000007600000028000000100000000E0000000100
                  04000000000070000000CE0E0000D80E00001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
                  99999999999999990F99990F9999999999999000F9999990F9999000F999990F
                  999999000F99900F9999999000F900F99999999900000F99999999999000F999
                  9999999900000F999999999000F90F99999990000F99900F99990000F9999900
                  F99900F9999999900F99}
                ParentDoubleBuffered = False
                TabOrder = 2
                OnClick = btClearVerstingRubClick
              end
              object btExportRub: TBitBtn
                Left = 651
                Top = 187
                Width = 116
                Height = 25
                Anchors = [akRight, akBottom]
                Caption = #1056#1091#1073#1088#1080#1082#1072' '#1074' '#1092#1072#1081#1083
                DoubleBuffered = True
                Enabled = False
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
                  9999990000000000000990330000003303099033000000330309903300000033
                  0309903300000000030990333333333333099033000000003309903099999999
                  0309903099999999030990309999999903099030999999990309903099999999
                  0009903099999999030990000000000000099999999999999999}
                ParentDoubleBuffered = False
                TabOrder = 3
                OnClick = btExportRubClick
              end
              object btExportAllRub: TBitBtn
                Left = 770
                Top = 187
                Width = 138
                Height = 25
                Anchors = [akRight, akBottom]
                Caption = #1042#1089#1077' '#1088#1091#1073#1088#1080#1082#1080' '#1074' '#1092#1072#1081#1083#1099
                DoubleBuffered = True
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
                  9999990000000000000990330000003303099033000000330309903300000033
                  0309903300000000030990333333333333099033000000003309903099999999
                  0309903099999999030990309999999903099030999999990309903099999999
                  0009903099999999030990000000000000099999999999999999}
                ParentDoubleBuffered = False
                TabOrder = 4
                OnClick = btExportAllRubClick
              end
              object btInetImport: TBitBtn
                Left = 366
                Top = 187
                Width = 127
                Height = 25
                Anchors = [akLeft, akBottom]
                Caption = #1048#1079' '#1080#1085#1090#1077#1088#1085#1077#1090#1072
                DoubleBuffered = True
                Glyph.Data = {
                  62000000424D62000000000000003E0000002800000009000000090000000100
                  010000000000240000000000000000000000020000000000000000000000FFFF
                  FF00E3800000E3800000E3800000000000000000000000000000E3800000E380
                  0000E3800000}
                ParentDoubleBuffered = False
                TabOrder = 5
                OnClick = btInetImportClick
              end
            end
          end
          object TabSheet10: TTabSheet
            Caption = #1052#1086#1076#1091#1083#1080
            ImageIndex = 4
            DesignSize = (
              911
              472)
            object Label78: TLabel
              Left = 8
              Top = 7
              Width = 110
              Height = 16
              Caption = #1052#1086#1076#1091#1083#1080' '#1074' '#1085#1086#1084#1077#1088
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label80: TLabel
              Left = 612
              Top = 6
              Width = 42
              Height = 13
              Anchors = [akTop, akRight]
              Caption = #1056#1091#1073#1088#1080#1082#1072
            end
            object btModuliExportAll: TBitBtn
              Left = 769
              Top = 436
              Width = 138
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074#1089#1105
              DoubleBuffered = True
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
                9999990000000000000990330000003303099033000000330309903300000033
                0309903300000000030990333333333333099033000000003309903099999999
                0309903099999999030990309999999903099030999999990309903099999999
                0009903099999999030990000000000000099999999999999999}
              ParentDoubleBuffered = False
              TabOrder = 0
              OnClick = btModuliExportAllClick
            end
            object btRefreshModuliVerstka: TBitBtn
              Left = 2
              Top = 436
              Width = 138
              Height = 25
              Anchors = [akLeft, akBottom]
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              DoubleBuffered = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
                FFFFFFFFF00FFFFFFFFFFFF88000FFFFFFFFFF0000000FFFFFFFF0000000FF80
                FFFF808FF00FFF000FFF00FFF0FFFFF008FF00FFFFFFFFFF00FF00FFFFFFFFFF
                00FF800FFFFF0FFF00FFF000FFF00FF808FFFF08FF0000000FFFFFFFF0000000
                FFFFFFFFFF00088FFFFFFFFFFFF00FFFFFFFFFFFFFFF0FFFFFFF}
              ParentDoubleBuffered = False
              ParentFont = False
              TabOrder = 1
              OnClick = btRefreshModuliVerstkaClick
            end
            object btModuliExportRubrika: TBitBtn
              Left = 625
              Top = 436
              Width = 138
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1088#1091#1073#1088#1080#1082#1091
              DoubleBuffered = True
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
                9999990000000000000990330000003303099033000000330309903300000033
                0309903300000000030990333333333333099033000000003309903099999999
                0309903099999999030990309999999903099030999999990309903099999999
                0009903099999999030990000000000000099999999999999999}
              ParentDoubleBuffered = False
              TabOrder = 2
              OnClick = btModuliExportRubrikaClick
            end
          end
          object TabSheet2: TTabSheet
            Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1088#1072#1073#1086#1090#1086#1076#1072#1090#1077#1083#1077#1081
            ImageIndex = 1
            DesignSize = (
              911
              472)
            object btRefreshCustInfo: TBitBtn
              Left = -1
              Top = 436
              Width = 138
              Height = 25
              Anchors = [akLeft, akBottom]
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              DoubleBuffered = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
                FFFFFFFFF00FFFFFFFFFFFF88000FFFFFFFFFF0000000FFFFFFFF0000000FF80
                FFFF808FF00FFF000FFF00FFF0FFFFF008FF00FFFFFFFFFF00FF00FFFFFFFFFF
                00FF800FFFFF0FFF00FFF000FFF00FF808FFFF08FF0000000FFFFFFFF0000000
                FFFFFFFFFF00088FFFFFFFFFFFF00FFFFFFFFFFFFFFF0FFFFFFF}
              ParentDoubleBuffered = False
              ParentFont = False
              TabOrder = 1
              OnClick = btRefreshCustInfoClick
            end
            object btSaveCustInfo: TBitBtn
              Left = 766
              Top = 436
              Width = 138
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083
              DoubleBuffered = True
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
                9999990000000000000990330000003303099033000000330309903300000033
                0309903300000000030990333333333333099033000000003309903099999999
                0309903099999999030990309999999903099030999999990309903099999999
                0009903099999999030990000000000000099999999999999999}
              ParentDoubleBuffered = False
              TabOrder = 0
              OnClick = btSaveCustInfoClick
            end
          end
          object TabSheet4: TTabSheet
            Caption = #1058#1072#1073#1083#1080#1094#1072' '#1074#1072#1082#1072#1085#1089#1080#1081
            ImageIndex = 2
            DesignSize = (
              911
              472)
            object Label64: TLabel
              Left = 613
              Top = 6
              Width = 42
              Height = 13
              Anchors = [akTop, akRight]
              Caption = #1056#1091#1073#1088#1080#1082#1072
            end
            object Label65: TLabel
              Left = 8
              Top = 7
              Width = 155
              Height = 16
              Caption = #1054#1073#1098#1103#1074#1083#1077#1085#1080#1103' '#1074' '#1090#1072#1073#1083#1080#1094#1091
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btRefreshKA: TBitBtn
              Left = 3
              Top = 436
              Width = 138
              Height = 25
              Anchors = [akLeft, akBottom]
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              DoubleBuffered = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
                FFFFFFFFF00FFFFFFFFFFFF88000FFFFFFFFFF0000000FFFFFFFF0000000FF80
                FFFF808FF00FFF000FFF00FFF0FFFFF008FF00FFFFFFFFFF00FF00FFFFFFFFFF
                00FF800FFFFF0FFF00FFF000FFF00FF808FFFF08FF0000000FFFFFFFF0000000
                FFFFFFFFFF00088FFFFFFFFFFFF00FFFFFFFFFFFFFFF0FFFFFFF}
              ParentDoubleBuffered = False
              ParentFont = False
              TabOrder = 1
              OnClick = btRefreshKAClick
            end
            object btSaveKA: TBitBtn
              Left = 763
              Top = 436
              Width = 138
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = #1069#1082#1089#1087#1086#1088#1090
              DoubleBuffered = True
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
                9999990000000000000990330000003303099033000000330309903300000033
                0309903300000000030990333333333333099033000000003309903099999999
                0309903099999999030990309999999903099030999999990309903099999999
                0009903099999999030990000000000000099999999999999999}
              ParentDoubleBuffered = False
              TabOrder = 0
              OnClick = btSaveKAClick
            end
          end
          object TabSheet5: TTabSheet
            Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1050#1040
            ImageIndex = 3
            DesignSize = (
              911
              472)
            object btRefreshCustKA: TBitBtn
              Left = 2
              Top = 436
              Width = 138
              Height = 25
              Anchors = [akLeft, akBottom]
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              DoubleBuffered = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
                FFFFFFFFF00FFFFFFFFFFFF88000FFFFFFFFFF0000000FFFFFFFF0000000FF80
                FFFF808FF00FFF000FFF00FFF0FFFFF008FF00FFFFFFFFFF00FF00FFFFFFFFFF
                00FF800FFFFF0FFF00FFF000FFF00FF808FFFF08FF0000000FFFFFFFF0000000
                FFFFFFFFFF00088FFFFFFFFFFFF00FFFFFFFFFFFFFFF0FFFFFFF}
              ParentDoubleBuffered = False
              ParentFont = False
              TabOrder = 1
              OnClick = btRefreshCustKAClick
            end
            object btSaveCustKA: TBitBtn
              Left = 769
              Top = 436
              Width = 138
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083
              DoubleBuffered = True
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
                9999990000000000000990330000003303099033000000330309903300000033
                0309903300000000030990333333333333099033000000003309903099999999
                0309903099999999030990309999999903099030999999990309903099999999
                0009903099999999030990000000000000099999999999999999}
              ParentDoubleBuffered = False
              TabOrder = 0
              OnClick = btSaveCustKAClick
            end
          end
          object TabSheet3: TTabSheet
            Caption = #1059#1095#1077#1073#1085#1099#1077' '#1082#1091#1088#1089#1099
            ImageIndex = 5
            DesignSize = (
              911
              472)
            object btRefreshNavchCourse: TBitBtn
              Left = 2
              Top = 436
              Width = 138
              Height = 25
              Anchors = [akLeft, akBottom]
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              DoubleBuffered = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
                FFFFFFFFF00FFFFFFFFFFFF88000FFFFFFFFFF0000000FFFFFFFF0000000FF80
                FFFF808FF00FFF000FFF00FFF0FFFFF008FF00FFFFFFFFFF00FF00FFFFFFFFFF
                00FF800FFFFF0FFF00FFF000FFF00FF808FFFF08FF0000000FFFFFFFF0000000
                FFFFFFFFFF00088FFFFFFFFFFFF00FFFFFFFFFFFFFFF0FFFFFFF}
              ParentDoubleBuffered = False
              ParentFont = False
              TabOrder = 1
              OnClick = btRefreshNavchCourseClick
            end
            object btExportNavchCourse: TBitBtn
              Left = 763
              Top = 436
              Width = 138
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1083#1103' '#1075#1072#1079#1077#1090#1099
              DoubleBuffered = True
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
                9999990000000000000990330000003303099033000000330309903300000033
                0309903300000000030990333333333333099033000000003309903099999999
                0309903099999999030990309999999903099030999999990309903099999999
                0009903099999999030990000000000000099999999999999999}
              ParentDoubleBuffered = False
              TabOrder = 0
              OnClick = btExportNavchCourseClick
            end
          end
          object tabCustObjavExport: TTabSheet
            Caption = #1069#1082#1089#1087#1086#1088#1090' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1081' '#1082#1083#1080#1077#1085#1090#1072
            ImageIndex = 6
            OnShow = tabCustObjavExportShow
            DesignSize = (
              911
              472)
            object Label89: TLabel
              Left = 0
              Top = 7
              Width = 121
              Height = 17
              AutoSize = False
              Caption = ' '#1050#1083#1080#1077#1085#1090#1099' '#1076#1083#1103' '#1101#1082#1089#1087#1086#1088#1090#1072
            end
            object BitBtn1: TBitBtn
              Left = 2
              Top = 436
              Width = 103
              Height = 25
              Anchors = [akLeft, akBottom]
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100
              DoubleBuffered = True
              Glyph.Data = {
                62000000424D62000000000000003E0000002800000009000000090000000100
                010000000000240000000000000000000000020000000000000000000000FFFF
                FF00E3800000E3800000E3800000000000000000000000000000E3800000E380
                0000E3800000}
              ParentDoubleBuffered = False
              TabOrder = 0
              OnClick = BitBtn1Click
            end
            object BitBtn15: TBitBtn
              Left = 112
              Top = 436
              Width = 103
              Height = 25
              Anchors = [akLeft, akBottom]
              Caption = #1059#1073#1088#1072#1090#1100
              DoubleBuffered = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                6A000000424D6A000000000000003E000000280000000B0000000B0000000100
                0100000000002C0000000000000000000000020000000000000000000000FFFF
                FF00FFE00000FFE00000FFE00000FFE00000002000000020000000200000FFE0
                0000FFE00000FFE00000FFE00000}
              ParentDoubleBuffered = False
              ParentFont = False
              TabOrder = 1
              OnClick = BitBtn15Click
            end
            object BitBtn16: TBitBtn
              Left = 760
              Top = 436
              Width = 138
              Height = 25
              Anchors = [akRight, akBottom]
              Caption = #1069#1082#1089#1087#1086#1088#1090
              DoubleBuffered = True
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
                9999990000000000000990330000003303099033000000330309903300000033
                0309903300000000030990333333333333099033000000003309903099999999
                0309903099999999030990309999999903099030999999990309903099999999
                0009903099999999030990000000000000099999999999999999}
              ParentDoubleBuffered = False
              TabOrder = 3
              OnClick = BitBtn16Click
            end
            object cbExportIssue: TDBLookupComboBox
              Left = 230
              Top = 2
              Width = 115
              Height = 21
              KeyField = 'IS_ID'
              ListField = 'IS_NAME_COMPOSED'
              TabOrder = 2
            end
          end
        end
        object Panel37: TPanel
          Left = 0
          Top = 0
          Width = 919
          Height = 8
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
        end
      end
    end
    object tbDesign: TTabSheet
      Caption = #1044#1080#1079#1072#1081#1085#1077#1088
      ImageIndex = 14
    end
    object tbNabor: TTabSheet
      Caption = #1053#1072#1073#1086#1088' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1081
      ImageIndex = 15
    end
    object tabSiteObjav: TTabSheet
      Caption = #1054#1073#1098#1103#1074#1083#1077#1085#1080#1077' '#1076#1083#1103' '#1089#1072#1081#1090#1072
      ImageIndex = 14
    end
    object tbPayments: TTabSheet
      Caption = #1054#1087#1083#1072#1090#1072' '#1089#1076#1077#1083#1086#1082
      ImageIndex = 1
      object pnlPayments: TPanel
        Left = 0
        Top = 0
        Width = 919
        Height = 545
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Panel19: TPanel
          Left = 0
          Top = 0
          Width = 919
          Height = 35
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Shape81: TShape
            Left = 0
            Top = 34
            Width = 919
            Height = 1
            Align = alBottom
            Pen.Color = clBtnShadow
            ExplicitWidth = 911
          end
          object Label39: TLabel
            Left = 8
            Top = 10
            Width = 63
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1089#1095#1105#1090#1072
          end
          object Label53: TLabel
            Left = 204
            Top = 10
            Width = 31
            Height = 13
            Caption = #1057#1091#1084#1084#1072
          end
          object btFindSdelkaForPayment: TBitBtn
            Left = 359
            Top = 4
            Width = 170
            Height = 25
            Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1085#1086#1084#1077#1088#1091' '#1089#1095#1105#1090#1072
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333300000333330000030F000333330F00030F000333330F000300000003000
              0000300F000000F00000300F000300F00000300F000300F00000330000000000
              00033330F00030F000333330000030000033333300033300033333330F03330F
              0333333300033300033333333333333333333333333333333333}
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 2
            OnClick = btFindSdelkaForPaymentClick
          end
          object btFindAndPay: TBitBtn
            Left = 656
            Top = 5
            Width = 138
            Height = 25
            Caption = #1053#1072#1081#1090#1080' '#1080' '#1086#1087#1083#1072#1090#1080#1090#1100
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DDDDDDDDDD33000DDDDDDDDDD300BBB00DDDDDDD30BBBBBBB0DDDD0300BBBBBB
              B0DDD0B30BB0B000BB0DD0B30FB0B0B0BB0D0BB30FB0B0B0BB0D0FB30FB0B0B0
              BB0D0FB30FB0B000BB0D0FB030FBBBBBB0DD0FB0B0FFBBBBB0DDD0FBBB00FFB0
              0DDDD0FFBBBB000DDDDDDD00FFB00DDDDDDDDDDD000DDDDDDDDD}
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 0
            Visible = False
            OnClick = btFindAndPayClick
          end
          object bthCheck: TButton
            Left = 652
            Top = 4
            Width = 75
            Height = 25
            Caption = #1048#1089#1087#1088#1072#1074#1080#1090#1100
            TabOrder = 1
            OnClick = bthCheckClick
          end
        end
        object pnlApplyPayments: TPanel
          Left = 0
          Top = 510
          Width = 919
          Height = 35
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object Shape28: TShape
            Left = 0
            Top = 0
            Width = 919
            Height = 1
            Align = alTop
            Pen.Color = clBtnShadow
            ExplicitWidth = 911
          end
          object Label40: TLabel
            Left = 8
            Top = 13
            Width = 157
            Height = 13
            Caption = #1042#1089#1077#1075#1086' '#1079#1072' '#1101#1090#1091' '#1089#1076#1077#1083#1082#1091' '#1079#1072#1087#1083#1072#1095#1077#1085#1086
          end
          object Label41: TLabel
            Left = 284
            Top = 13
            Width = 63
            Height = 13
            Caption = #1053#1086#1074#1072#1103' '#1089#1091#1084#1084#1072
          end
          object btApplyPayment: TBitBtn
            Left = 608
            Top = 7
            Width = 91
            Height = 25
            Caption = #1054#1082
            DoubleBuffered = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              CE000000424DCE0000000000000076000000280000000B0000000B0000000100
              04000000000058000000C40E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
              0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
              0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
              0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 0
            OnClick = btApplyPaymentClick
          end
        end
        object Panel34: TPanel
          Left = 0
          Top = 35
          Width = 919
          Height = 475
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 5
          TabOrder = 2
        end
      end
    end
    object tabCover: TTabSheet
      Caption = #1054#1073#1083#1086#1078#1082#1072
      ImageIndex = 14
    end
    object tbChangeUser: TTabSheet
      Caption = #1042#1099#1073#1086#1088' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103'/'#1072#1075#1077#1085#1090#1072
      ImageIndex = 5
      object Panel5: TPanel
        Left = 224
        Top = 208
        Width = 297
        Height = 81
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label11: TLabel
          Left = 16
          Top = 16
          Width = 81
          Height = 13
          Caption = #1058#1077#1082#1091#1097#1080#1081' '#1072#1075#1077#1085#1090':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object DBText1: TDBText
          Left = 100
          Top = 16
          Width = 139
          Height = 17
          DataField = 'AG_NAME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btChooseUser: TBitBtn
          Left = 14
          Top = 40
          Width = 267
          Height = 25
          Action = actChooseUser
          Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103'/'#1072#1075#1077#1085#1090#1072
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 0
        end
      end
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 441
        Height = 521
        TabOrder = 1
        Visible = False
        object Button1222: TButton
          Left = 8
          Top = 8
          Width = 129
          Height = 25
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' SQL-'#1083#1086#1075
          TabOrder = 0
          OnClick = Button1222Click
        end
        object cbLogTrace: TCheckBox
          Left = 16
          Top = 80
          Width = 97
          Height = 17
          Caption = 'SQL-log is ON'
          TabOrder = 1
          OnClick = cbLogTraceClick
        end
        object mmLogTrace: TMemo
          Left = 8
          Top = 112
          Width = 385
          Height = 393
          Lines.Strings = (
            'mmLogTrace')
          ScrollBars = ssBoth
          TabOrder = 2
        end
        object Button1: TButton
          Left = 160
          Top = 64
          Width = 75
          Height = 25
          Caption = 'Show log'
          TabOrder = 3
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 248
          Top = 64
          Width = 75
          Height = 25
          Caption = 'Clear log'
          TabOrder = 4
          OnClick = Button2Click
        end
      end
    end
  end
  object dlgOpen: TOpenDialog
    Left = 624
    Top = 88
  end
  object dlgSave: TSaveDialog
    Left = 560
    Top = 88
  end
  object iml1: TImageList
    Left = 376
    Top = 352
    Bitmap = {
      494C010101000C000C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FC7F000000000000FC7F000000000000
      FC7F000000000000E00F000000000000E00F000000000000E00F000000000000
      FC7F000000000000FC7F000000000000FC7F000000000000FFFF000000000000
      FFFF000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object ppNewSdelka: TPopupMenu
    Left = 224
    Top = 152
    object N1: TMenuItem
      Action = actNewSdelkaVGazetuPR
    end
    object N7: TMenuItem
      Action = actNewSdelkaVGazetuSR
    end
    object N5: TMenuItem
      Action = actNewSdelkaVGazetuNS
    end
    object N8: TMenuItem
      Action = actNewSdelkaVRDZ
      Visible = False
    end
    object N9: TMenuItem
      Action = actNewSdelkaVRK
      Visible = False
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Action = actNewSdelkaVKA
      Visible = False
    end
    object N4: TMenuItem
      Action = actNewSdelkaVInternet
    end
    object N10: TMenuItem
      Action = actNewSdelkaRegion
      Caption = #1053#1086#1074#1072#1103' '#1089#1076#1077#1083#1082#1072' '#1074' '#1080#1085#1090#1077#1088#1085#1077#1090' ('#1088#1077#1075#1080#1086#1085#1099')'
    end
  end
  object actions: TActionList
    Images = imlActions
    Left = 440
    Top = 328
    object actNewSdelkaVGazetuPR: TAction
      Caption = #1053#1086#1074#1072#1103' '#1089#1076#1077#1083#1082#1072' '#1074' "'#1055#1088#1086#1087#1086#1085#1091#1102' '#1088#1086#1073#1086#1090#1091'"'
      ShortCut = 16462
      SecondaryShortCuts.Strings = (
        'Ctrl+'#1058)
      OnExecute = actNewSdelkaVGazetuPRExecute
    end
    object actNewSdelkaVGazetuSR: TAction
      Caption = #1053#1086#1074#1072#1103' '#1089#1076#1077#1083#1082#1072' '#1074' "'#1057#1088#1086#1095#1085#1086' '#1090#1088#1077#1073#1091#1102#1090#1089#1103'"'
      ShortCut = 16461
      SecondaryShortCuts.Strings = (
        'Ctrl+'#1058
        'Ctrl+'#1068)
      OnExecute = actNewSdelkaVGazetuSRExecute
    end
    object actNewSdelkaVGazetuNS: TAction
      Caption = #1053#1086#1074#1072#1103' '#1089#1076#1077#1083#1082#1072' '#1074' "'#1053#1072#1074#1095#1072#1085#1085#1103'"'
      SecondaryShortCuts.Strings = (
        'Ctrl+'#1058)
      OnExecute = actNewSdelkaVGazetuNSExecute
    end
    object actNewSdelkaVRDZ: TAction
      Caption = #1053#1086#1074#1072#1103' '#1089#1076#1077#1083#1082#1072' '#1074' "'#1056#1044#1046'"'
      OnExecute = actNewSdelkaVRDZExecute
    end
    object actNewSdelkaVKA: TAction
      Caption = #1053#1086#1074#1072#1103' '#1089#1076#1077#1083#1082#1072' '#1074' '#1050#1040
      OnExecute = actNewSdelkaVKAExecute
    end
    object actChooseUser: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103'/'#1072#1075#1077#1085#1090#1072
      ShortCut = 16465
      SecondaryShortCuts.Strings = (
        'Ctrl+'#1040)
      OnExecute = btChooseUserClick
    end
    object actPrintAcc: TAction
      Caption = #1053#1072#1087#1077#1095#1072#1090#1072#1090#1100' '#1089#1095#1105#1090
      ImageIndex = 0
      OnExecute = actPrintAccExecute
    end
    object actNewSdelkaVInternet: TAction
      Caption = #1053#1086#1074#1072#1103' '#1089#1076#1077#1083#1082#1072' '#1074' '#1080#1085#1090#1077#1088#1085#1077#1090
      OnExecute = actNewSdelkaVInternetExecute
    end
    object actNewSdelkaVRK: TAction
      Caption = #1053#1086#1074#1072#1103' '#1089#1076#1077#1083#1082#1072' '#1074' "'#1056#1072#1073#1086#1090#1072' '#1074' '#1050#1080#1077#1074#1077'"'
      ShortCut = 16466
      OnExecute = actNewSdelkaVRKExecute
    end
    object actNewSdelkaRegion: TAction
      Caption = 'actNewSdelkaRegion'
      OnExecute = actNewSdelkaRegionExecute
    end
  end
  object imlVerstkaDiagnoz: TImageList
    Left = 364
    Top = 88
    Bitmap = {
      494C010103000C000C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF0000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      00000000000000000000FF000000FF00000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000FF000000000000000000
      0000848484008484840000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00008484840000FFFF0000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF00000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00008484000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF000084840000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000848400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF00008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF00000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFF37F0000C007FFFFECBF0000
      C007FFFF41DF0000C007E3E3A0FF0000C007E1C3E07F0000C007F087E03F0000
      C007F80FF01F0000C007FC1FF80F0000C007FC1FFC070000C007F80FFE030000
      C007F087FF010000C00FE1C3FF810000C01FE3E3FFC10000C03FFFFFFFE30000
      FFFFFFFFFFFF0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object imlActions: TImageList
    Left = 236
    Top = 416
    Bitmap = {
      494C010101000C000C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C6000000000000000000C6C6C6008484840000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      000000000000C6C6C600C6C6C600C6C6C6008484840084848400848484000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600FFFFFF008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600FFFFFF00FFFFFF00C6C6C600C6C6C60084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400C6C6C600FFFFFF00C6C6
      C600C6C6C600C6C6C6000000FF000000FF00C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400C6C6C600C6C6
      C60000FF000000FF0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF000000
      0000C6C6C6008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FE7F000000000000F81F000000000000
      E007000000000000C00300000000000080010000000000008001000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      C003000000000000E007000000000000F807000000000000FE01000000000000
      FF07000000000000FF8F00000000000000000000000000000000000000000000
      000000000000}
  end
  object ppGrid: TPopupMenu
    Left = 108
    Top = 192
    object N3: TMenuItem
      Caption = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
      OnClick = N3Click
    end
  end
  object dlgSaveObjavExport: TSaveDialog
    DefaultExt = 'htm'
    FileName = 'c:\export_objavs.htm'
    Left = 264
    Top = 253
  end
  object qFormats: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      
        'SELECT * FROM FORMAT f LEFT JOIN format_cost fc ON (f.fm_id = fc' +
        '.fm_id) '
      'WHERE fc.gz_id = :gz_id'
      'ORDER BY ORDERBY')
    SQLConnection = data.connection
    Left = 376
    Top = 419
  end
  object dsFormats: TDataSource
    DataSet = cdsFormats
    Left = 408
    Top = 419
  end
  object cdsFormats: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvFormats'
    Left = 408
    Top = 451
    object cdsFormatsFM_ID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'FM_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsFormatsFM_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'FM_NAME'
      Required = True
      Size = 128
    end
    object cdsFormatsFM_SPACE: TFloatField
      DisplayLabel = #1055#1083#1086#1097#1072#1076#1100
      FieldName = 'FM_SPACE'
      DisplayFormat = '0.##'
    end
    object cdsFormatsFM_HAS_PICTURE: TSmallintField
      DisplayLabel = #1052#1086#1076#1091#1083#1100
      FieldName = 'FM_HAS_PICTURE'
      Required = True
    end
    object cdsFormatsFM_PICTURE_SIZES: TStringField
      DisplayLabel = #1056#1072#1079#1084#1077#1088#1099' '#1084#1086#1076#1091#1083#1077#1081
      FieldName = 'FM_PICTURE_SIZES'
      Size = 128
    end
    object cdsFormatsFM_COST: TFloatField
      FieldName = 'FM_COST'
      Origin = 'FORMAT_COST'
      DisplayFormat = #1057#1090#1086#1080#1084#1086#1089#1090#1100
    end
    object cdsFormatsGZ_ID: TIntegerField
      FieldName = 'GZ_ID'
    end
    object cdsFormatsFM_COST_4: TFloatField
      FieldName = 'FM_COST_4'
    end
  end
  object prvFormats: TDataSetProvider
    DataSet = qFormats
    Left = 376
    Top = 451
  end
  object spLogModuleLoad: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'US_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OBJAV_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CONTENT_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TYP'
        ParamType = ptInput
      end>
    SQLConnection = data.connection
    StoredProcName = 'MODULE_LOAD_LOG'
    Left = 132
    Top = 345
  end
  object ppReports: TPopupMenu
    Left = 492
    Top = 128
    object mnuSdRep: TMenuItem
      Caption = #1044#1083#1080#1085#1085#1099#1077' '#1089#1076#1077#1083#1082#1080'('#1079#1072' '#1087#1088#1086#1096#1083#1099#1081' '#1084#1077#1089#1103#1094')'
      OnClick = mnuSdRepClick
    end
  end
  object qRubrika: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT * FROM RUBRIKA '
      'WHERE GZ_ID = :gz_id'
      'ORDER BY  DELETED, RB_NAME_SHORT, ORDERBY')
    SQLConnection = data.connection
    Left = 336
    Top = 155
  end
  object cdsRubrika: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'prvRubrika'
    Left = 384
    Top = 155
    object cdsRubrikaRB_ID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'RB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsRubrikaRB_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'RB_NAME'
      Size = 128
    end
    object cdsRubrikaRB_NAME_SHORT: TStringField
      DisplayLabel = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object cdsRubrikaRB_COST_COEFF: TFloatField
      DisplayLabel = #1062#1077#1085#1086#1074#1086#1081' '#1082#1086#1101#1092#1080#1094#1080#1077#1085#1090
      FieldName = 'RB_COST_COEFF'
      DisplayFormat = '0.###'
    end
    object cdsRubrikaRB_IS_OBLOGKA: TSmallintField
      DisplayLabel = #1054#1073#1083#1086#1078#1082#1072
      FieldName = 'RB_IS_OBLOGKA'
    end
    object cdsRubrikaGZ_ID: TIntegerField
      FieldName = 'GZ_ID'
    end
    object cdsRubrikaRB_IS_HOT: TSmallintField
      DisplayLabel = #1043#1086#1088#1103#1095#1080#1077
      FieldName = 'RB_IS_HOT'
    end
    object cdsRubrikaRB_IS_LOCKABLE: TSmallintField
      DisplayLabel = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100
      FieldName = 'RB_IS_LOCKABLE'
    end
    object cdsRubrikaDELETED: TSmallintField
      DisplayLabel = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100
      FieldName = 'DELETED'
    end
  end
  object prvRubrika: TDataSetProvider
    DataSet = qRubrika
    Left = 336
    Top = 195
  end
  object dsRubrika: TDataSource
    DataSet = cdsRubrika
    Left = 384
    Top = 195
  end
end
