object frmSdelka: TfrmSdelka
  Left = 0
  Top = 0
  Width = 705
  Height = 531
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentColor = False
  ParentFont = False
  ParentShowHint = False
  ShowHint = True
  TabOrder = 0
  DesignSize = (
    705
    531)
  object shPercentDiffers: TShape
    Left = 5
    Top = 421
    Width = 59
    Height = 21
    Brush.Color = clRed
    Pen.Style = psClear
    Visible = False
  end
  object shSumDiffers: TShape
    Left = 5
    Top = 398
    Width = 59
    Height = 21
    Brush.Color = clRed
    Pen.Style = psClear
    Visible = False
  end
  object Label1: TLabel
    Left = 5
    Top = 49
    Width = 37
    Height = 13
    Caption = #1050#1083#1080#1077#1085#1090
  end
  object Label2: TLabel
    Left = 6
    Top = 447
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
  object imgChecked: TImage
    Left = 31
    Top = 8
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
  object imgUnchecked: TImage
    Left = 15
    Top = 10
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
  object Shape9: TShape
    Left = 5
    Top = 496
    Width = 289
    Height = 1
    Pen.Color = clBtnShadow
  end
  object txSumDefault: TDBText
    Left = 128
    Top = 402
    Width = 45
    Height = 17
    DataField = 'SD_SUM_DEFAULT'
    DataSource = dsSdelkaOne
  end
  object Label8: TLabel
    Left = 7
    Top = 402
    Width = 54
    Height = 13
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label9: TLabel
    Left = 18
    Top = 425
    Width = 43
    Height = 13
    Caption = #1055#1088#1086#1094#1077#1085#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object txPercentDefault: TDBText
    Left = 128
    Top = 425
    Width = 45
    Height = 17
    DataField = 'SD_PERCENT_DEFAULT'
    DataSource = dsSdelkaOne
    Visible = False
  end
  object Label15: TLabel
    Left = 179
    Top = 402
    Width = 50
    Height = 13
    Caption = #1054#1087#1083#1072#1095#1077#1085#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 191
    Top = 425
    Width = 38
    Height = 13
    Caption = #1057#1082#1080#1076#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Shape3: TShape
    Left = 5
    Top = 444
    Width = 289
    Height = 1
    Pen.Color = clBtnShadow
  end
  object Shape8: TShape
    Left = 5
    Top = 395
    Width = 289
    Height = 1
    Pen.Color = clBtnShadow
  end
  object Label3: TLabel
    Left = 5
    Top = 377
    Width = 25
    Height = 13
    Caption = #1057#1095#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label19: TLabel
    Left = 117
    Top = 377
    Width = 12
    Height = 13
    Caption = #1086#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object imgAttn: TImage
    Left = 23
    Top = 2
    Width = 6
    Height = 14
    AutoSize = True
    Picture.Data = {
      07544269746D6170AE000000424DAE0000000000000076000000280000000600
      00000E000000010004000000000038000000C40E0000C40E0000100000000000
      0000000000000000800000800000008080008000000080008000808000008080
      8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF009999990098FF89009FFFF90098FF89009999990098FF890098FF89009FFF
      F9009FFFF9009FFFF9009FFFF9009FFFF90098FF890099999900}
    Transparent = True
    Visible = False
  end
  object Shape2: TShape
    Left = 5
    Top = 23
    Width = 289
    Height = 1
    Pen.Color = clBtnShadow
  end
  object lblIsReadOnly: TLabel
    Left = 384
    Top = 392
    Width = 102
    Height = 13
    Caption = #1058#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1095#1090#1077#1085#1080#1103'?'
    Visible = False
  end
  object Label21: TLabel
    Left = 4
    Top = 28
    Width = 55
    Height = 13
    Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnHistory: TSpeedButton
    Left = 243
    Top = 3
    Width = 52
    Height = 18
    Hint = #1048#1089#1090#1086#1088#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1089#1076#1077#1083#1082#1080
    Anchors = [akTop, akRight]
    Caption = #1080#1089#1090#1086#1088#1080#1103
    OnClick = btnHistoryClick
  end
  object btSave: TBitBtn
    Left = 130
    Top = 500
    Width = 89
    Height = 23
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    OnClick = btSaveClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
      9999990000000000000990330000003303099033000000330309903300000033
      0309903300000000030990333333333333099033000000003309903099999999
      0309903099999999030990309999999903099030999999990309903099999999
      0009903099999999030990000000000000099999999999999999}
  end
  object mmComment: TDBEditEh
    Left = 125
    Top = 447
    Width = 169
    Height = 47
    AlwaysShowBorder = True
    Constraints.MinHeight = 47
    Ctl3D = True
    DataField = 'SD_COMMENT'
    DataSource = dsSdelkaOne
    EditButtons = <>
    Flat = True
    ParentCtl3D = False
    ShowHint = True
    TabOrder = 13
    Visible = True
  end
  object btCancel: TBitBtn
    Left = 219
    Top = 500
    Width = 75
    Height = 23
    Hint = #1047#1072#1082#1088#1099#1090#1100' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    OnClick = btCancelClick
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000B0000000B0000000100
      04000000000058000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF0FFFFF0FF0
      0000F000FFF000F0000000000F0000000000F000000000F00000FF0000000FF0
      0000FFF00000FFF00000FF0000000FF00000F000000000F0000000000F000000
      0000F000FFF000F00000FF0FFFFF0FF00000}
  end
  object btApprove: TBitBtn
    Left = 2
    Top = 500
    Width = 127
    Height = 23
    Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 16
    OnClick = btApproveClick
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000B0000000B0000000100
      04000000000058000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
      0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
      0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
      0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
  end
  object edAddComment: TDBEditEh
    Left = 5
    Top = 475
    Width = 93
    Height = 19
    AlwaysShowBorder = True
    EditButtons = <>
    Flat = True
    ShowHint = True
    TabOrder = 11
    Visible = True
  end
  object btAddComment: TBitBtn
    Left = 100
    Top = 474
    Width = 23
    Height = 20
    Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    TabOrder = 12
    OnClick = btAddCommentClick
    Glyph.Data = {
      62000000424D62000000000000003E0000002800000009000000090000000100
      010000000000240000000000000000000000020000000000000000000000FFFF
      FF00E3800000E3800000E3800000000000000000000000000000E3800000E380
      0000E3800000}
  end
  object pages: TPageControl
    Left = -4
    Top = 62
    Width = 302
    Height = 311
    ActivePage = pgSdelkaVGazetu
    Anchors = [akLeft, akTop, akRight, akBottom]
    Style = tsFlatButtons
    TabOrder = 2
    object pgSdelkaVGazetu: TTabSheet
      Caption = #1057#1076#1077#1083#1082#1072' '#1074' '#1075#1072#1079#1077#1090#1091
      TabVisible = False
      object Label11: TLabel
        Left = 155
        Top = 3
        Width = 38
        Height = 13
        Caption = #1054#1087#1083#1072#1090#1072
      end
      object Label13: TLabel
        Left = 5
        Top = 3
        Width = 35
        Height = 13
        Caption = #1043#1072#1079#1077#1090#1072
      end
      object imgLocked: TImage
        Left = 16
        Top = 39
        Width = 14
        Height = 17
        AutoSize = True
        Picture.Data = {
          07544269746D6170FE000000424DFE0000000000000076000000280000000E00
          000011000000010004000000000088000000C40E0000C40E0000100000000000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00FFFFFFFFFFFFFF00F00000000000FF00F333333333330F00F3FBBBBBBBB3
          0F00F3F3333333830F00F3FBBBBBBBB30F00F3F3333333830F00F3FBBBBBBBB3
          0F00F3FFFFFFFFF30F00FF33333333330F00FFF303333303FF00FFF30FFFF30F
          FF00FFF30FFFF30FFF00FFF380FF330FFF00FFFF380030FFFF00FFFFF3333FFF
          FF00FFFFFFFFFFFFFF00}
        Transparent = True
        Visible = False
      end
      inline sdelkaObjavs: TfrmSdelkaPubl
        Left = 4
        Top = 188
        Width = 290
        Height = 114
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnEnter = sdelkaObjavsExit
        OnExit = sdelkaObjavsExit
        inherited Panel2: TPanel
          Width = 290
          Height = 114
          DesignSize = (
            290
            114)
          inherited Shape1: TShape
            Width = 290
          end
          inherited Label1: TLabel
            Width = 72
            Caption = #1054#1073#1098#1103#1074#1083#1077#1085#1080#1103
          end
          inherited btAdd: TBitBtn
            Left = 222
            Width = 21
            OnClick = sdelkaObjavsbtAddClick
          end
          inherited btDelete: TBitBtn
            Left = 266
            Width = 23
            OnClick = sdelkaObjavsbtDeleteClick
          end
          inherited grObjavs: TDBGridEh
            Width = 290
            Height = 91
            HorzScrollBar.Visible = False
            OnDrawColumnCell = sdelkaObjavsgrObjavsDrawColumnCell
            Columns = <
              item
                AlwaysShowEditButton = True
                Checkboxes = True
                EditButtons = <>
                FieldName = 'OB_IS_ACTIVE'
                Footers = <>
                KeyList.Strings = (
                  '1'
                  '0')
                Title.Caption = ' '
                Title.Color = clSkyBlue
                Width = 15
              end
              item
                Checkboxes = True
                EditButtons = <>
                FieldName = 'OBJAV_HAS_ATTENTION'
                Footers = <>
                KeyList.Strings = (
                  '1'
                  '0')
                Title.Color = clSkyBlue
                Width = 19
              end
              item
                EditButtons = <>
                FieldName = 'MDL_TEXT'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = 'T'
                Title.Color = clSkyBlue
                Width = 15
              end
              item
                EditButtons = <>
                FieldName = 'FM_NAME'
                Footers = <>
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 40
              end
              item
                EditButtons = <>
                FieldName = 'RB_NAME'
                Footers = <>
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 53
              end
              item
                EditButtons = <>
                FieldName = 'RS_NAME'
                Footers = <>
                Title.Caption = #1053#1072' '#1089#1072#1081#1090
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 61
              end
              item
                EditButtons = <>
                FieldName = 'OB_TEXT'
                Footers = <>
                Title.Color = clSkyBlue
                Width = 84
              end
              item
                EditButtons = <>
                FieldName = 'RS_NAME'
                Footers = <>
                Title.Color = clSkyBlue
                Visible = False
                Width = 106
              end
              item
                EditButtons = <>
                FieldName = 'OB_STATE_NAME'
                Footers = <>
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Visible = False
                Width = 78
              end
              item
                EditButtons = <>
                FieldName = 'OB_COMMENT'
                Footers = <>
                Title.Color = clSkyBlue
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clBlack
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Visible = False
                Width = 148
              end>
          end
          inherited btEdit: TBitBtn
            Left = 244
            Width = 21
            OnClick = sdelkaObjavsbtEditClick
          end
          inherited btAddPovtor: TBitBtn
            Left = 166
            Width = 55
            OnClick = sdelkaObjavsbtAddPovtorClick
          end
          inherited btView: TBitBtn
            Left = 144
            Width = 21
            OnClick = sdelkaObjavsbtViewClick
          end
          inherited btHistory: TBitBtn
            Left = 83
            Width = 60
            OnClick = sdelkaObjavsbtHistoryClick
          end
        end
        inherited spCopyObjav: TSQLStoredProc
          Left = 17
          Top = 73
        end
        inherited spCopyObjavlenie: TSQLStoredProc
          Left = 153
          Top = 89
        end
      end
      object cbPayType: TDBLookupComboboxEh
        Left = 195
        Top = 0
        Width = 99
        Height = 19
        Hint = #1058#1080#1087' '#1086#1087#1083#1072#1090#1099
        AlwaysShowBorder = True
        DataField = 'PT_ID'
        DataSource = dsSdelkaOne
        EditButtons = <>
        Flat = True
        KeyField = 'PT_ID'
        ListField = 'PT_NAME'
        ListSource = data.dsPayType
        ShowHint = True
        TabOrder = 1
        Visible = True
        OnEnter = cbGazetaEnter
        OnExit = cbPayTypeExit
      end
      object cbGazeta: TDBLookupComboboxEh
        Left = 42
        Top = 0
        Width = 107
        Height = 19
        Hint = #1043#1072#1079#1077#1090#1072
        AlwaysShowBorder = True
        Color = clBtnFace
        DataField = 'GZ_ID'
        DataSource = dsSdelkaOne
        EditButton.Visible = False
        EditButtons = <>
        Flat = True
        KeyField = 'GZ_ID'
        ListField = 'GZ_NAME'
        ListSource = data.dsGazeta
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
      object pnlPodacha: TPanel
        Left = 5
        Top = 22
        Width = 143
        Height = 164
        BevelOuter = bvNone
        TabOrder = 2
        object Shape5: TShape
          Left = 0
          Top = 0
          Width = 143
          Height = 23
          Align = alTop
          Brush.Color = clSkyBlue
          Pen.Color = clNavy
        end
        object Label16: TLabel
          Left = 6
          Top = 5
          Width = 44
          Height = 13
          Caption = #1055#1086#1076#1072#1095#1080
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object grPodacha: TDBGridEh
          Left = 0
          Top = 23
          Width = 143
          Height = 141
          TabStop = False
          Align = alClient
          Color = clBtnFace
          Ctl3D = True
          DataSource = dsSdelkaPodacha
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghHighlightFocus, dghClearSelection]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          RowHeight = 2
          RowLines = 1
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              EditButtons = <>
              FieldName = 'IS_NAME_COMPOSED'
              Footers = <>
              Title.Caption = #8470
              Title.Color = clSkyBlue
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBtnText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 98
            end
            item
              AlwaysShowEditButton = True
              Checkboxes = True
              EditButtons = <>
              FieldName = 'PD_FREE_OF_CHARGE'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
              Title.Caption = #1041#1055
              Title.Color = clSkyBlue
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBtnText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 24
            end>
        end
        object btAddPodacha: TBitBtn
          Left = 58
          Top = 3
          Width = 25
          Height = 17
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1076#1072#1095#1091
          TabOrder = 0
          OnClick = btAddPodachaClick
          Glyph.Data = {
            62000000424D62000000000000003E0000002800000009000000090000000100
            010000000000240000000000000000000000020000000000000000000000FFFF
            FF00E3800000E3800000E3800000000000000000000000000000E3800000E380
            0000E3800000}
        end
        object btEditPodacha: TBitBtn
          Left = 86
          Top = 3
          Width = 25
          Height = 17
          Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1076#1072#1095#1091
          TabOrder = 1
          TabStop = False
          OnClick = btEditPodachaClick
          Glyph.Data = {
            52000000424D52000000000000003E000000280000000B000000050000000100
            010000000000140000000000000000000000020000000000000000000000FFFF
            FF0080200000C0600000E0E00000F1E00000FBE00000}
        end
        object btDeletePodacha: TBitBtn
          Left = 114
          Top = 3
          Width = 25
          Height = 17
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1076#1072#1095#1091
          TabOrder = 2
          TabStop = False
          OnClick = btDeletePodachaClick
          Glyph.Data = {
            6A000000424D6A000000000000003E000000280000000B0000000B0000000100
            0100000000002C0000000000000000000000020000000000000000000000FFFF
            FF00FFE00000FFE00000FFE00000FFE00000002000000020000000200000FFE0
            0000FFE00000FFE00000FFE00000}
        end
      end
    end
    object pgSdelkaVKA: TTabSheet
      Caption = #1057#1076#1077#1083#1082#1072' '#1074' '#1050#1040
      ImageIndex = 1
      TabVisible = False
      object Label4: TLabel
        Left = 155
        Top = 5
        Width = 38
        Height = 13
        Caption = #1054#1087#1083#1072#1090#1072
      end
      object Label14: TLabel
        Left = 106
        Top = 204
        Width = 65
        Height = 13
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      end
      object Label18: TLabel
        Left = 81
        Top = 229
        Width = 90
        Height = 13
        Caption = #1044#1072#1090#1072' '#1079#1072#1074#1077#1088#1096#1077#1085#1080#1103
      end
      object Shape11: TShape
        Left = 5
        Top = 321
        Width = 289
        Height = 1
        Pen.Color = clBtnShadow
      end
      object Label10: TLabel
        Left = 21
        Top = 64
        Width = 104
        Height = 72
        Caption = #1057#1076#1077#1083#1082#1072' '#1074' '#1050#1072#1076#1088#1086#1074#1086#1077' '#1040#1075#1077#1085#1090#1089#1090#1074#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object cbPayTypeKA: TDBLookupComboboxEh
        Left = 195
        Top = 2
        Width = 99
        Height = 19
        AlwaysShowBorder = True
        DataField = 'PT_ID'
        DataSource = dsSdelkaOne
        EditButtons = <>
        Flat = True
        KeyField = 'PT_ID'
        ListField = 'PT_NAME'
        ListSource = data.dsPayType
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnExit = cbPayTypeExit
      end
      object edKAStartDate: TDBEditEh
        Left = 173
        Top = 201
        Width = 121
        Height = 19
        AlwaysShowBorder = True
        DataField = 'SD_KA_START_DATE'
        DataSource = dsSdelkaOne
        EditButtons = <>
        Flat = True
        MaxLength = 8
        ShowHint = True
        TabOrder = 1
        Visible = True
      end
      object edKAEndDate: TDBEditEh
        Left = 173
        Top = 226
        Width = 121
        Height = 19
        AlwaysShowBorder = True
        DataField = 'SD_KA_END_DATE'
        DataSource = dsSdelkaOne
        EditButtons = <>
        Flat = True
        MaxLength = 8
        ShowHint = True
        TabOrder = 2
        Visible = True
      end
    end
    object pgSdelkaVInternet: TTabSheet
      Caption = #1057#1076#1077#1083#1082#1072' '#1074' '#1080#1085#1090#1077#1088#1085#1077#1090
      ImageIndex = 2
      TabVisible = False
      DesignSize = (
        294
        301)
      object Label5: TLabel
        Left = 155
        Top = 5
        Width = 38
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1054#1087#1083#1072#1090#1072
      end
      object Label6: TLabel
        Left = 10
        Top = 79
        Width = 65
        Height = 13
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      end
      object Label7: TLabel
        Left = 9
        Top = 119
        Width = 90
        Height = 13
        Caption = #1044#1072#1090#1072' '#1079#1072#1074#1077#1088#1096#1077#1085#1080#1103
      end
      object Label20: TLabel
        Left = 21
        Top = 8
        Width = 99
        Height = 48
        Caption = #1057#1076#1077#1083#1082#1072' '#1074' '#1080#1085#1090#1077#1088#1085#1077#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object cbPayTypeInternet: TDBLookupComboboxEh
        Left = 195
        Top = 2
        Width = 99
        Height = 19
        AlwaysShowBorder = True
        Anchors = [akTop, akRight]
        DataField = 'PT_ID'
        DataSource = dsSdelkaOne
        EditButtons = <>
        Flat = True
        KeyField = 'PT_ID'
        ListField = 'PT_NAME'
        ListSource = data.dsPayType
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnExit = cbPayTypeExit
      end
      object edInternetEndDate: TDBEditEh
        Left = 21
        Top = 135
        Width = 121
        Height = 19
        AlwaysShowBorder = True
        DataField = 'SD_KA_END_DATE'
        DataSource = dsSdelkaOne
        EditButtons = <>
        Flat = True
        MaxLength = 8
        ShowHint = True
        TabOrder = 2
        Visible = True
      end
      object edInternetStartDate: TDBEditEh
        Left = 21
        Top = 94
        Width = 121
        Height = 19
        AlwaysShowBorder = True
        DataField = 'SD_KA_START_DATE'
        DataSource = dsSdelkaOne
        EditButtons = <>
        Flat = True
        MaxLength = 8
        ShowHint = True
        TabOrder = 1
        Visible = True
      end
      object Panel1: TPanel
        Left = 0
        Top = 188
        Width = 294
        Height = 113
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 3
        DesignSize = (
          294
          113)
        object Label22: TLabel
          Left = 1
          Top = 1
          Width = 292
          Height = 20
          Align = alTop
          Caption = '  '#1057#1089#1099#1083#1082#1080' '#1085#1072' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1103' '#1085#1072' '#1089#1072#1081#1090#1077
          Color = clSkyBlue
          Constraints.MinHeight = 20
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object btnAddLink: TBitBtn
          Left = 221
          Top = 1
          Width = 25
          Height = 17
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1077#1083#1077#1092#1086#1085
          TabOrder = 0
          OnClick = btnAddLinkClick
          Glyph.Data = {
            62000000424D62000000000000003E0000002800000009000000090000000100
            010000000000240000000000000000000000020000000000000000000000FFFF
            FF00E3800000E3800000E3800000000000000000000000000000E3800000E380
            0000E3800000}
        end
        object btnDelLink: TBitBtn
          Left = 266
          Top = 1
          Width = 25
          Height = 17
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1083#1077#1092#1086#1085
          TabOrder = 1
          TabStop = False
          OnClick = btnDelLinkClick
          Glyph.Data = {
            6A000000424D6A000000000000003E000000280000000B0000000B0000000100
            0100000000002C0000000000000000000000020000000000000000000000FFFF
            FF00FFE00000FFE00000FFE00000FFE00000002000000020000000200000FFE0
            0000FFE00000FFE00000FFE00000}
        end
        object btEditLink: TBitBtn
          Left = 246
          Top = 1
          Width = 21
          Height = 17
          Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1077
          Anchors = [akTop, akRight]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btEditLinkClick
          Glyph.Data = {
            52000000424D52000000000000003E000000280000000B000000050000000100
            010000000000140000000000000000000000020000000000000000000000FFFF
            FF0080200000C0600000E0E00000F1E00000FBE00000}
        end
        object grLinks: TDBGridEh
          Left = 1
          Top = 21
          Width = 292
          Height = 91
          Align = alClient
          AutoFitColWidths = True
          Color = clBtnFace
          DataSource = dsInet
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = grLinksCellClick
          OnEnter = sdelkaObjavsExit
          OnExit = sdelkaObjavsExit
          OnMouseMove = grLinksMouseMove
          Columns = <
            item
              EditButtons = <>
              Footers = <>
              Width = 1
            end
            item
              EditButtons = <>
              FieldName = 'OB_LINK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsUnderline]
              Footers = <>
              ReadOnly = True
              Title.Caption = #1057#1089#1099#1083#1082#1072
              Width = 208
            end
            item
              EditButtons = <>
              FieldName = 'SHORT_NAME'
              Footers = <>
              Title.Caption = #1058#1080#1087
              Width = 76
            end>
        end
      end
    end
  end
  object edCust: TDBEditEh
    Left = 44
    Top = 46
    Width = 201
    Height = 19
    Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1083#1080#1077#1085#1090#1072
    TabStop = False
    AlwaysShowBorder = True
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    DataField = 'CU_NAME'
    DataSource = dsSdelkaOne
    EditButtons = <>
    Flat = True
    ReadOnly = True
    ShowHint = True
    TabOrder = 17
    Visible = True
  end
  object btChooseCust: TButton
    Left = 246
    Top = 45
    Width = 23
    Height = 21
    Hint = #1042#1099#1073#1088#1072#1090#1100
    Anchors = [akTop, akRight]
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btChooseCustClick
    OnExit = btChooseCustExit
  end
  object edPercent: TDBEditEh
    Left = 62
    Top = 422
    Width = 64
    Height = 19
    Hint = #1055#1088#1086#1094#1077#1085#1090
    AlwaysShowBorder = True
    DataField = 'SD_PERCENT'
    DataSource = dsSdelkaOne
    EditButtons = <>
    Flat = True
    ShowHint = True
    TabOrder = 8
    Visible = False
  end
  object edPayed: TDBEditEh
    Left = 231
    Top = 399
    Width = 63
    Height = 19
    AlwaysShowBorder = True
    DataField = 'SD_SUM_PAYED'
    DataSource = dsSdelkaOne
    EditButtons = <>
    Flat = True
    ShowHint = True
    TabOrder = 9
    Visible = True
  end
  object cbAllPayed: TDBCheckBoxEh
    Left = 209
    Top = 376
    Width = 83
    Height = 14
    Alignment = taLeftJustify
    AlwaysShowBorder = True
    BiDiMode = bdLeftToRight
    Caption = #1042#1089#1077' '#1086#1087#1083#1072#1095#1077#1085#1086
    Color = clBtnFace
    DataField = 'SD_ALL_PAYED'
    DataSource = dsSdelkaOne
    Flat = True
    ParentBiDiMode = False
    ParentColor = False
    TabOrder = 6
    ValueChecked = '1'
    ValueUnchecked = '0'
    OnKeyPress = edFactDateKeyPress
  end
  object edFactNum: TDBEditEh
    Left = 50
    Top = 373
    Width = 62
    Height = 19
    AlwaysShowBorder = True
    DataField = 'SD_FACT_NUM'
    DataSource = dsSdelkaOne
    EditButtons = <>
    Flat = True
    ShowHint = True
    TabOrder = 4
    Visible = True
    OnKeyPress = edFactDateKeyPress
  end
  object edSkidka: TDBEditEh
    Left = 231
    Top = 422
    Width = 63
    Height = 19
    AlwaysShowBorder = True
    DataField = 'SD_SKIDKA'
    DataSource = dsSdelkaOne
    EditButtons = <>
    Flat = True
    ShowHint = True
    TabOrder = 10
    Visible = True
  end
  object edSum: TDBEditEh
    Left = 62
    Top = 399
    Width = 64
    Height = 19
    Hint = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1089#1076#1077#1083#1082#1080
    AlwaysShowBorder = True
    DataField = 'SD_SUM'
    DataSource = dsSdelkaOne
    EditButtons = <>
    Flat = True
    ShowHint = True
    TabOrder = 7
    Visible = True
  end
  object edFactDate: TDBEditEh
    Left = 130
    Top = 373
    Width = 75
    Height = 19
    AlwaysShowBorder = True
    DataField = 'SD_FACT_DATE'
    DataSource = dsSdelkaOne
    EditButtons = <>
    Flat = True
    MaxLength = 8
    ShowHint = True
    TabOrder = 5
    Visible = True
    OnKeyPress = edFactDateKeyPress
  end
  object edSdelkaID: TDBEditEh
    Left = 3
    Top = 2
    Width = 134
    Height = 19
    AlwaysShowBorder = True
    Color = clBtnFace
    DataField = 'SD_NUM'
    DataSource = dsSdelkaOne
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Flat = True
    ParentFont = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 18
    Visible = True
  end
  object btDropChanges: TBitBtn
    Left = 4
    Top = 500
    Width = 127
    Height = 23
    Caption = #1057#1073#1088#1086#1089' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 19
    Visible = False
    OnClick = btDropChangesClick
    Glyph.Data = {
      E6000000424DE6000000000000007600000028000000100000000E0000000100
      04000000000070000000CE0E0000D80E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
      99999999999999990F99990F9999999999999000F9999990F9999000F999990F
      999999000F99900F9999999000F900F99999999900000F99999999999000F999
      9999999900000F999999999000F90F99999990000F99900F99990000F9999900
      F99900F9999999900F99}
  end
  object btCheckDoljnik: TBitBtn
    Left = 270
    Top = 45
    Width = 23
    Height = 21
    Anchors = [akTop, akRight]
    Caption = '$?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 20
    OnClick = btCheckDoljnikClick
  end
  object cbShowCustCode: TDBCheckBoxEh
    Left = 152
    Top = 3
    Width = 81
    Height = 17
    AlwaysShowBorder = True
    DataField = 'SD_SHOW_CUST_ID'
    DataSource = dsSdelkaOne
    Flat = True
    TabOrder = 21
    ValueChecked = '1'
    ValueUnchecked = '0'
    Visible = False
  end
  object pnlPhone: TPanel
    Left = 151
    Top = 90
    Width = 143
    Height = 164
    BevelOuter = bvNone
    TabOrder = 22
    DesignSize = (
      143
      164)
    object Shape6: TShape
      Left = 0
      Top = 0
      Width = 143
      Height = 23
      Align = alTop
      Brush.Color = clSkyBlue
      Pen.Color = clNavy
    end
    object Label17: TLabel
      Left = 6
      Top = 5
      Width = 61
      Height = 13
      Caption = #1058#1077#1083#1077#1092#1086#1085#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btAddPhone: TBitBtn
      Left = 86
      Top = 3
      Width = 25
      Height = 17
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1077#1083#1077#1092#1086#1085
      Anchors = [akTop, akRight]
      TabOrder = 0
      TabStop = False
      OnClick = btAddPhoneClick
      Glyph.Data = {
        62000000424D62000000000000003E0000002800000009000000090000000100
        010000000000240000000000000000000000020000000000000000000000FFFF
        FF00E3800000E3800000E3800000000000000000000000000000E3800000E380
        0000E3800000}
    end
    object btDeletePhone: TBitBtn
      Left = 114
      Top = 3
      Width = 25
      Height = 17
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1083#1077#1092#1086#1085
      Anchors = [akTop, akRight]
      TabOrder = 1
      TabStop = False
      OnClick = btDeletePhoneClick
      Glyph.Data = {
        6A000000424D6A000000000000003E000000280000000B0000000B0000000100
        0100000000002C0000000000000000000000020000000000000000000000FFFF
        FF00FFE00000FFE00000FFE00000FFE00000002000000020000000200000FFE0
        0000FFE00000FFE00000FFE00000}
    end
    object grPhones: TDBGridEh
      Left = 0
      Top = 23
      Width = 143
      Height = 141
      TabStop = False
      Align = alClient
      Anchors = [akTop, akRight, akBottom]
      Color = clBtnFace
      DataSource = dsSdelkaPhone
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = grPhonesDrawColumnCell
      Columns = <
        item
          EditButtons = <>
          FieldName = 'CP_NUMBER'
          Footers = <>
          Width = 98
        end
        item
          EditButtons = <>
          FieldName = 'INTERCEPTED'
          Footers = <>
          Width = 20
        end>
    end
  end
  object btGenFactNum: TButton
    Left = 32
    Top = 372
    Width = 16
    Height = 21
    Hint = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1085#1086#1084#1077#1088' '#1080' '#1076#1072#1090#1091' '#1089#1095#1105#1090#1072
    Caption = '8'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Marlett'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TabStop = False
    OnClick = btGenFactNumClick
  end
  object cbIsImportant: TDBCheckBoxEh
    Left = 138
    Top = 3
    Width = 103
    Height = 17
    Hint = #1042#1072#1078#1085#1072#1103' '#1089#1076#1077#1083#1082#1072
    AlwaysShowBorder = True
    Anchors = [akTop, akRight]
    Caption = #1042#1072#1078#1085#1072#1103' '#1089#1076#1077#1083#1082#1072
    DataField = 'SD_IS_IMPORTANT_FOR_SITE'
    DataSource = dsSdelkaOne
    Flat = True
    TabOrder = 23
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object cbRequisite: TDBLookupComboboxEh
    Left = 62
    Top = 26
    Width = 232
    Height = 19
    Hint = #1056#1077#1082#1074#1077#1079#1080#1090#1099
    AlwaysShowBorder = True
    Anchors = [akLeft, akTop, akRight]
    DataField = 'RQ_ID'
    DataSource = dsSdelkaOne
    EditButtons = <>
    Flat = True
    KeyField = 'RQ_ID'
    ListField = 'RQ_NAME'
    ListSource = data.dsRequisite
    ShowHint = True
    TabOrder = 0
    Visible = True
    OnEnter = cbGazetaEnter
  end
  object dbPayVer: TDBCheckBox
    Left = 6
    Top = 424
    Width = 121
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = #1054#1087#1083'. '#1087#1088#1086#1074'.'
    DataField = 'SD_PAY_VER'
    DataSource = dsSdelkaOne
    TabOrder = 24
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object qrySdelkaOne: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'AG_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'SD_ID'
        ParamType = ptInput
        Value = '0'
      end>
    SQL.Strings = (
      'SELECT'
      '    SD.AG_ID,'
      '    SD.SD_ID,'
      '    SD.SD_TYPE,'
      '    SD.SD_STATE,'
      '    SD.SD_IS_CHANGED_COPY_OF_SD_ID,'
      '    SD.CU_ID,'
      '    SD.SD_SUM,'
      '    SD.SD_PERCENT,'
      '    SD.SD_SUM_DEFAULT,'
      '    SD.SD_PERCENT_DEFAULT,'
      '    SD.SD_SKIDKA,'
      '    SD.PT_ID,'
      '    SD.RQ_ID,'
      '    SD.SD_ID_COMPOUND,'
      '    SD.GZ_ID,'
      '    SD.SD_COMMENT,'
      '    SD.SD_SUM_PAYED,'
      '    SD.SD_ALL_PAYED,'
      '    SD.SD_COMMENT_SHORT,'
      '    SD.AS_ID,'
      '    SD.SD_FACT_NUM,'
      '    SD.SD_KA_START_DATE,'
      '    SD.SD_KA_END_DATE,'
      '    SD.SD_FACT_DATE,'
      '    SD.SD_SHOW_CUST_ID,'
      '    SD.SD_IS_IMPORTANT_FOR_SITE,'
      '    SD.SD_NEW_CUST,'
      '    SD.REGISTERED_BY_ID,'
      '    SD.SD_PAY_VER,'
      '    CU.CU_NAME,'
      '    CU.CUQ_REG_ID,'
      '    CU.CU_OKPO,'
      '    SD.SD_NUM'
      'FROM'
      '    SDELKA SD'
      '    LEFT JOIN CUST CU'
      '    ON (SD.AG_ID=CU.AG_ID AND SD.CU_ID=CU.CU_ID)'
      'WHERE'
      '    SD.AG_ID=:AG_ID AND'
      '    SD.SD_ID=:SD_ID')
    SQLConnection = data.connection
    Left = 352
    Top = 16
    object qrySdelkaOneAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Origin = 'DB.SDELKA.AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrySdelkaOneSD_ID: TIntegerField
      FieldName = 'SD_ID'
      Origin = 'DB.SDELKA.SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrySdelkaOneSD_TYPE: TSmallintField
      FieldName = 'SD_TYPE'
      Origin = 'DB.SDELKA.SD_TYPE'
    end
    object qrySdelkaOneSD_STATE: TSmallintField
      FieldName = 'SD_STATE'
      Origin = 'DB.SDELKA.SD_STATE'
    end
    object qrySdelkaOneCU_ID: TIntegerField
      FieldName = 'CU_ID'
      Origin = 'DB.SDELKA.CU_ID'
    end
    object qrySdelkaOneSD_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SD_SUM'
      Origin = 'DB.SDELKA.SD_SUM'
      DisplayFormat = '0.00'
    end
    object qrySdelkaOneSD_PERCENT: TFloatField
      DisplayLabel = #1055#1088#1086#1094#1077#1085#1090
      FieldName = 'SD_PERCENT'
      Origin = 'DB.SDELKA.SD_PERCENT'
      DisplayFormat = '0.##'
    end
    object qrySdelkaOneSD_SUM_DEFAULT: TFloatField
      FieldName = 'SD_SUM_DEFAULT'
      Origin = 'DB.SDELKA.SD_SUM_DEFAULT'
      ProviderFlags = []
      DisplayFormat = '0.00'
    end
    object qrySdelkaOneSD_PERCENT_DEFAULT: TFloatField
      FieldName = 'SD_PERCENT_DEFAULT'
      Origin = 'DB.SDELKA.SD_PERCENT_DEFAULT'
      ProviderFlags = []
      DisplayFormat = '0.##'
    end
    object qrySdelkaOneSD_SKIDKA: TFloatField
      FieldName = 'SD_SKIDKA'
      Origin = 'DB.SDELKA.SD_SKIDKA'
      DisplayFormat = '0.##'
    end
    object qrySdelkaOnePT_ID: TSmallintField
      FieldName = 'PT_ID'
      Origin = 'DB.SDELKA.PT_ID'
    end
    object qrySdelkaOneRQ_ID: TIntegerField
      FieldName = 'RQ_ID'
      Origin = 'DB.SDELKA.RQ_ID'
      Required = True
    end
    object qrySdelkaOneSD_ID_COMPOUND: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'SD_ID_COMPOUND'
      Origin = 'DB.SDELKA.AG_ID'
      ProviderFlags = []
      ReadOnly = True
      Size = 23
    end
    object qrySdelkaOneGZ_ID: TSmallintField
      DisplayLabel = #1043#1072#1079#1077#1090#1072
      FieldName = 'GZ_ID'
      Origin = 'DB.SDELKA.GZ_ID'
    end
    object qrySdelkaOneSD_COMMENT: TStringField
      FieldName = 'SD_COMMENT'
      Size = 1024
    end
    object qrySdelkaOneSD_SUM_PAYED: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'SD_SUM_PAYED'
      Origin = 'DB.SDELKA.SD_SUM_PAYED'
      DisplayFormat = '0.00'
    end
    object qrySdelkaOneSD_ALL_PAYED: TSmallintField
      DisplayLabel = #1057#1076#1077#1083#1082#1072' '#1086#1087#1083#1072#1095#1077#1085#1072
      FieldName = 'SD_ALL_PAYED'
      Origin = 'DB.SDELKA.SD_ALL_PAYED'
    end
    object qrySdelkaOneSD_COMMENT_SHORT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'SD_COMMENT_SHORT'
      Origin = 'DB.SDELKA.SD_COMMENT_SHORT'
      Size = 128
    end
    object qrySdelkaOneAS_ID: TSmallintField
      FieldName = 'AS_ID'
      Origin = 'DB.SDELKA.AS_ID'
    end
    object qrySdelkaOneCU_NAME: TStringField
      FieldName = 'CU_NAME'
      Origin = 'DB.CUST.CU_NAME'
      ProviderFlags = []
      Size = 128
    end
    object qrySdelkaOneSD_KA_START_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_START_DATE'
    end
    object qrySdelkaOneSD_KA_END_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_END_DATE'
    end
    object qrySdelkaOneSD_FACT_NUM: TIntegerField
      DisplayLabel = #1057#1095#1077#1090' '#8470
      FieldName = 'SD_FACT_NUM'
      Origin = 'DB.SDELKA.SD_FACT_NUM'
    end
    object qrySdelkaOneSD_FACT_DATE: TSQLTimeStampField
      FieldName = 'SD_FACT_DATE'
    end
    object qrySdelkaOneSD_ID_COMPOUND_FOR_USER: TStringField
      FieldKind = fkCalculated
      FieldName = 'SD_ID_COMPOUND_FOR_USER'
      ProviderFlags = []
      Calculated = True
    end
    object qrySdelkaOneSD_IS_CHANGED_COPY_OF_SD_ID: TIntegerField
      FieldName = 'SD_IS_CHANGED_COPY_OF_SD_ID'
      Origin = 'DB.SDELKA.SD_IS_CHANGED_COPY_OF_SD_ID'
    end
    object qrySdelkaOneSD_SHOW_CUST_ID: TSmallintField
      FieldName = 'SD_SHOW_CUST_ID'
      Origin = 'DB.SDELKA.SD_SHOW_CUST_ID'
    end
    object qrySdelkaOneSD_IS_IMPORTANT_FOR_SITE: TSmallintField
      FieldName = 'SD_IS_IMPORTANT_FOR_SITE'
      Origin = 'DB.SDELKA.SD_IS_IMPORTANT_FOR_SITE'
    end
    object qrySdelkaOneCUQ_REG_ID: TIntegerField
      FieldName = 'CUQ_REG_ID'
      ProviderFlags = []
    end
    object qrySdelkaOneREGISTERED_BY_ID: TIntegerField
      FieldName = 'REGISTERED_BY_ID'
    end
    object qrySdelkaOneSD_NEW_CUST: TIntegerField
      FieldName = 'SD_NEW_CUST'
    end
    object qrySdelkaOneSD_PAY_VER: TIntegerField
      FieldName = 'SD_PAY_VER'
    end
    object qrySdelkaOneSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
  end
  object dsSdelkaOne: TDataSource
    DataSet = cdsSdelkaOne
    Left = 616
    Top = 16
  end
  object dsSdelkaPodacha: TDataSource
    DataSet = cdsSdelkaPodacha
    Left = 616
    Top = 64
  end
  object dsSdelkaPhone: TDataSource
    DataSet = cdsSdelkaPhone
    Left = 616
    Top = 152
  end
  object qryDeleteSdelka: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'AG_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SD_ID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'DELETE FROM SDELKA WHERE AG_ID=:AG_ID AND SD_ID=:SD_ID')
    SQLConnection = data.connection
    Left = 352
    Top = 304
  end
  object dsSdelkaDojnika: TDataSource
    DataSet = cdsSdelkaDoljnika
    Left = 617
    Top = 200
  end
  object cdsSdelkaOne: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'AG_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'SD_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvSdelkaOne'
    AfterInsert = cdsSdelkaOneAfterInsert
    AfterScroll = cdsSdelkaOneAfterScroll
    OnReconcileError = cdsSdelkaOneReconcileError
    Left = 536
    Top = 16
    object cdsSdelkaOneAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Origin = 'DB.SDELKA.AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsSdelkaOneSD_ID: TIntegerField
      FieldName = 'SD_ID'
      Origin = 'DB.SDELKA.SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsSdelkaOneSD_TYPE: TSmallintField
      FieldName = 'SD_TYPE'
      Origin = 'DB.SDELKA.SD_TYPE'
    end
    object cdsSdelkaOneSD_STATE: TSmallintField
      FieldName = 'SD_STATE'
      Origin = 'DB.SDELKA.SD_STATE'
      OnChange = cdsSdelkaOneSD_STATEChange
    end
    object cdsSdelkaOneCU_ID: TIntegerField
      FieldName = 'CU_ID'
      Origin = 'DB.SDELKA.CU_ID'
      OnChange = cdsSdelkaOneCU_IDChange
    end
    object cdsSdelkaOneSD_SUM: TFloatField
      DefaultExpression = '0'
      FieldName = 'SD_SUM'
      Origin = 'DB.SDELKA.SD_SUM'
      OnChange = cdsSdelkaOneSD_SUMChange
      DisplayFormat = '0.00'
    end
    object cdsSdelkaOneSD_PERCENT: TFloatField
      FieldName = 'SD_PERCENT'
      Origin = 'DB.SDELKA.SD_PERCENT'
      DisplayFormat = '0.00'
    end
    object cdsSdelkaOneSD_SUM_DEFAULT: TFloatField
      FieldName = 'SD_SUM_DEFAULT'
      Origin = 'DB.SDELKA.SD_SUM_DEFAULT'
      ProviderFlags = []
      DisplayFormat = '0.00'
    end
    object cdsSdelkaOneSD_PERCENT_DEFAULT: TFloatField
      FieldName = 'SD_PERCENT_DEFAULT'
      Origin = 'DB.SDELKA.SD_PERCENT_DEFAULT'
      ProviderFlags = []
      DisplayFormat = '0.00'
    end
    object cdsSdelkaOneSD_SKIDKA: TFloatField
      FieldName = 'SD_SKIDKA'
      Origin = 'DB.SDELKA.SD_SKIDKA'
    end
    object cdsSdelkaOnePT_ID: TSmallintField
      FieldName = 'PT_ID'
      Origin = 'DB.SDELKA.PT_ID'
    end
    object cdsSdelkaOneRQ_ID: TIntegerField
      FieldName = 'RQ_ID'
      Origin = 'DB.SDELKA.RQ_ID'
      Required = True
    end
    object cdsSdelkaOneSD_ID_COMPOUND: TStringField
      FieldName = 'SD_ID_COMPOUND'
      Origin = 'DB.SDELKA.AG_ID'
      ProviderFlags = []
      ReadOnly = True
      Size = 23
    end
    object cdsSdelkaOneGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
      Origin = 'DB.SDELKA.GZ_ID'
    end
    object cdsSdelkaOneSD_COMMENT: TStringField
      FieldName = 'SD_COMMENT'
      Size = 1024
    end
    object cdsSdelkaOneSD_SUM_PAYED: TFloatField
      FieldName = 'SD_SUM_PAYED'
      Origin = 'DB.SDELKA.SD_SUM_PAYED'
      DisplayFormat = '0.00'
    end
    object cdsSdelkaOneSD_ALL_PAYED: TSmallintField
      FieldName = 'SD_ALL_PAYED'
      Origin = 'DB.SDELKA.SD_ALL_PAYED'
    end
    object cdsSdelkaOneSD_COMMENT_SHORT: TStringField
      FieldName = 'SD_COMMENT_SHORT'
      Origin = 'DB.SDELKA.SD_COMMENT_SHORT'
      Size = 128
    end
    object cdsSdelkaOneAS_ID: TSmallintField
      FieldName = 'AS_ID'
      Origin = 'DB.SDELKA.AS_ID'
    end
    object cdsSdelkaOneCU_NAME: TStringField
      FieldName = 'CU_NAME'
      Origin = 'DB.CUST.CU_NAME'
      ProviderFlags = []
      Size = 128
    end
    object cdsSdelkaOneSD_KA_START_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_START_DATE'
      EditMask = '!99/99/00;1;_'
    end
    object cdsSdelkaOneSD_KA_END_DATE: TSQLTimeStampField
      FieldName = 'SD_KA_END_DATE'
      EditMask = '!99/99/00;1;_'
    end
    object cdsSdelkaOneSD_FACT_NUM: TIntegerField
      FieldName = 'SD_FACT_NUM'
      Origin = 'DB.SDELKA.SD_FACT_NUM'
    end
    object cdsSdelkaOneSD_FACT_DATE: TSQLTimeStampField
      FieldName = 'SD_FACT_DATE'
      EditMask = '!99/99/00;1;_'
    end
    object cdsSdelkaOneSD_ID_COMPOUND_FOR_USER: TStringField
      FieldName = 'SD_ID_COMPOUND_FOR_USER'
      ProviderFlags = []
      ReadOnly = True
      OnGetText = cdsSdelkaOneSD_ID_COMPOUND_FOR_USERGetText
    end
    object cdsSdelkaOneSD_IS_CHANGED_COPY_OF_SD_ID: TIntegerField
      FieldName = 'SD_IS_CHANGED_COPY_OF_SD_ID'
      Origin = 'DB.SDELKA.SD_IS_CHANGED_COPY_OF_SD_ID'
    end
    object cdsSdelkaOneSD_SHOW_CUST_ID: TSmallintField
      FieldName = 'SD_SHOW_CUST_ID'
      Origin = 'DB.SDELKA.SD_SHOW_CUST_ID'
    end
    object cdsSdelkaOneSD_IS_IMPORTANT_FOR_SITE: TSmallintField
      FieldName = 'SD_IS_IMPORTANT_FOR_SITE'
      Origin = 'DB.SDELKA.SD_IS_IMPORTANT_FOR_SITE'
    end
    object cdsSdelkaOneqrySdelkaPodacha: TDataSetField
      FieldName = 'qrySdelkaPodacha'
    end
    object cdsSdelkaOneCUQ_REG_ID: TIntegerField
      FieldName = 'CUQ_REG_ID'
      ProviderFlags = []
    end
    object cdsSdelkaOneSD_NEW_CUST: TIntegerField
      FieldName = 'SD_NEW_CUST'
    end
    object cdsSdelkaOneREGISTERED_BY_ID: TIntegerField
      FieldName = 'REGISTERED_BY_ID'
    end
    object cdsSdelkaOneSD_PAY_VER: TIntegerField
      FieldName = 'SD_PAY_VER'
    end
    object cdsSdelkaOneSD_NUM: TStringField
      FieldName = 'SD_NUM'
      OnGetText = cdsSdelkaOneSD_NUMGetText
      Size = 64
    end
  end
  object prvSdelkaOne: TDataSetProvider
    DataSet = qrySdelkaOne
    Exported = False
    OnGetTableName = prvSdelkaOneGetTableName
    Left = 440
    Top = 16
  end
  object dsSdelkaOneLink: TDataSource
    DataSet = qrySdelkaOne
    Left = 352
    Top = 64
  end
  object qrySdelkaPodacha: TSQLQuery
    DataSource = dsSdelkaOneLink
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT'
      '  PD.*,'
      '  ISS.IS_NAME,'
      '  ISS.IS_NAME_COMPOSED,'
      '  ISS.IS_DATE'
      'FROM'
      '  PODACHA PD'
      '  INNER JOIN ISSUE ISS'
      '  ON (PD.IS_ID=ISS.IS_ID)'
      'WHERE'
      '  AG_ID=:AG_ID AND'
      '  SD_ID=:SD_ID'
      'ORDER BY'
      '  PD.IS_ID')
    SQLConnection = data.connection
    Left = 440
    Top = 64
    object qrySdelkaPodachaPD_ID: TIntegerField
      FieldName = 'PD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySdelkaPodachaGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
      Required = True
    end
    object qrySdelkaPodachaIS_ID: TIntegerField
      FieldName = 'IS_ID'
      Required = True
    end
    object qrySdelkaPodachaAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Required = True
    end
    object qrySdelkaPodachaSD_ID: TIntegerField
      FieldName = 'SD_ID'
      Required = True
    end
    object qrySdelkaPodachaPD_FREE_OF_CHARGE: TSmallintField
      FieldName = 'PD_FREE_OF_CHARGE'
      Required = True
    end
    object qrySdelkaPodachaIS_NAME: TStringField
      FieldName = 'IS_NAME'
      ProviderFlags = []
      Size = 10
    end
    object qrySdelkaPodachaIS_NAME_COMPOSED: TStringField
      FieldName = 'IS_NAME_COMPOSED'
      ProviderFlags = []
      Size = 25
    end
    object qrySdelkaPodachaIS_DATE: TSQLTimeStampField
      FieldName = 'IS_DATE'
      ProviderFlags = []
    end
    object qrySdelkaPodachaPD_IS_DONE: TSmallintField
      DisplayLabel = #1059#1078#1077' '#1074#1099#1096#1083#1072
      FieldName = 'PD_IS_DONE'
      ProviderFlags = []
    end
  end
  object cdsSdelkaPodacha: TClientDataSet
    Aggregates = <>
    DataSetField = cdsSdelkaOneqrySdelkaPodacha
    Params = <>
    AfterInsert = cdsSdelkaPodachaAfterInsert
    OnReconcileError = cdsSdelkaOneReconcileError
    Left = 536
    Top = 64
    object cdsSdelkaPodachaPD_ID: TIntegerField
      FieldName = 'PD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSdelkaPodachaGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
      Required = True
    end
    object cdsSdelkaPodachaIS_ID: TIntegerField
      FieldName = 'IS_ID'
      Required = True
    end
    object cdsSdelkaPodachaAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Required = True
    end
    object cdsSdelkaPodachaSD_ID: TIntegerField
      FieldName = 'SD_ID'
      Required = True
    end
    object cdsSdelkaPodachaPD_FREE_OF_CHARGE: TSmallintField
      FieldName = 'PD_FREE_OF_CHARGE'
      Required = True
    end
    object cdsSdelkaPodachaIS_NAME: TStringField
      FieldName = 'IS_NAME'
      ProviderFlags = []
      Size = 10
    end
    object cdsSdelkaPodachaIS_NAME_COMPOSED: TStringField
      FieldName = 'IS_NAME_COMPOSED'
      ProviderFlags = []
      Size = 25
    end
    object cdsSdelkaPodachaIS_DATE: TSQLTimeStampField
      FieldName = 'IS_DATE'
      ProviderFlags = []
    end
    object cdsSdelkaPodachaPD_IS_DONE: TSmallintField
      DisplayLabel = #1059#1078#1077' '#1074#1099#1096#1083#1072
      FieldName = 'PD_IS_DONE'
      ProviderFlags = []
    end
  end
  object spFindCopy: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COPY_SD_ID'
        ParamType = ptOutput
        Size = 4
        Value = -1
      end>
    SQLConnection = data.connection
    StoredProcName = 'FIND_COPY'
    Left = 352
    Top = 240
  end
  object spBackupSdelka: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'US_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NEW_SD_ID'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = data.connection
    StoredProcName = 'BACKUP_SDELKA'
    Left = 448
    Top = 240
  end
  object spDropSdelkaChanges: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'US_ID'
        ParamType = ptInput
      end>
    SQLConnection = data.connection
    StoredProcName = 'DROP_CHANGES_IN_SDELKA'
    Left = 539
    Top = 240
  end
  object qrySdelkaDoljnika: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'AG_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'SD_ID'
        ParamType = ptInput
        Value = '0'
      end>
    SQL.Strings = (
      'SELECT'
      '    DISTINCT'
      '    SDD.AG_ID,'
      '    SDD.SD_ID,'
      '    SD.SD_ID_COMPOUND,'
      '    SD.SD_SUM,'
      '    SD.SD_FACT_NUM,'
      '    SD.SD_FACT_DATE,'
      #9'AG.AG_NAME,'
      #9'SPN.PODACHA_NUMS,'
      #9'CU.CU_NAME'
      'FROM'
      '    SDELKA_DOLJNIKA(:AG_ID,:SD_ID) SDD'
      '    LEFT JOIN AGENT AG'
      '    ON (AG.AG_ID=SDD.AG_ID)'
      ''
      '    LEFT JOIN SDELKA SD'
      '    ON (SDD.AG_ID=SD.AG_ID AND SDD.SD_ID=SD.SD_ID)'
      ''
      '    LEFT JOIN CUST CU'
      '    ON (SD.AG_ID=CU.AG_ID AND SD.CU_ID=CU.CU_ID)'
      ''
      '    LEFT JOIN SDELKA_PODACHA_NUMS(SDD.AG_ID,SDD.SD_ID) SPN'
      '    ON (SDD.SD_ID=SPN.SD_ID)')
    SQLConnection = data.connection
    Left = 352
    Top = 200
    object qrySdelkaDoljnikaAG_ID: TIntegerField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_ID'
    end
    object qrySdelkaDoljnikaSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object qrySdelkaDoljnikaSD_ID_COMPOUND: TStringField
      DisplayLabel = #1057#1076#1077#1083#1082#1072
      FieldName = 'SD_ID_COMPOUND'
      Size = 23
    end
    object qrySdelkaDoljnikaSD_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SD_SUM'
    end
    object qrySdelkaDoljnikaAG_NAME: TStringField
      FieldName = 'AG_NAME'
      Size = 128
    end
    object qrySdelkaDoljnikaPODACHA_NUMS: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object qrySdelkaDoljnikaCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qrySdelkaDoljnikaSD_FACT_NUM: TIntegerField
      DisplayLabel = #1057#1095#1105#1090
      FieldName = 'SD_FACT_NUM'
    end
    object qrySdelkaDoljnikaSD_FACT_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1095#1105#1090#1072
      FieldName = 'SD_FACT_DATE'
    end
  end
  object prvSdelkaDoljnika: TDataSetProvider
    DataSet = qrySdelkaDoljnika
    Exported = False
    Left = 448
    Top = 192
  end
  object cdsSdelkaDoljnika: TClientDataSet
    Aggregates = <>
    PacketRecords = 5
    Params = <
      item
        DataType = ftString
        Name = 'AG_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'SD_ID'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'prvSdelkaDoljnika'
    ReadOnly = True
    Left = 536
    Top = 200
    object cdsDelkaDoljnikaAG_ID: TIntegerField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_ID'
    end
    object cdsDelkaDoljnikaSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object cdsDelkaDoljnikaSD_ID_COMPOUND: TStringField
      DisplayLabel = #1057#1076#1077#1083#1082#1072
      FieldName = 'SD_ID_COMPOUND'
      Size = 23
    end
    object cdsDelkaDoljnikaSD_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SD_SUM'
    end
    object cdsDelkaDoljnikaAG_NAME: TStringField
      FieldName = 'AG_NAME'
      Size = 128
    end
    object cdsDelkaDoljnikaPODACHA_NUMS: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object cdsDelkaDoljnikaCU_NAME: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'CU_NAME'
      Size = 128
    end
    object cdsSdelkaDoljnikaSD_FACT_NUM: TIntegerField
      DisplayLabel = #1057#1095#1105#1090
      FieldName = 'SD_FACT_NUM'
    end
    object cdsSdelkaDoljnikaSD_FACT_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1095#1105#1090#1072
      FieldName = 'SD_FACT_DATE'
    end
  end
  object spNextFactNum: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FACT_NUM'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = data.connection
    StoredProcName = 'GET_NEXT_FACT_NUM'
    Left = 448
    Top = 304
  end
  object spSdelkaIsDoljnika: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID_INPUT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID_INPUT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'RESULT'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = data.connection
    StoredProcName = 'SDELKA_IS_DOLJNIKA'
    Left = 540
    Top = 304
  end
  object spSetResetSumAndPercent: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'RESET'
        ParamType = ptInput
      end>
    SQLConnection = data.connection
    StoredProcName = 'SET_RESET_SUM_AND_PERCENT'
    Left = 382
    Top = 424
  end
  object qrySdelkaPhone: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'AG_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CU_ID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select'
      #9'  cp.AG_ID'
      #9', cp.CP_NUMBER as CP_NUMBER'
      #9', cp.CU_ID as CU_ID'
      #9', cp.CP_ADDDATE as CP_ADDDATE'
      #9', ii2.RESULT as INTERCEPTED'
      'from'
      #9'CUST_PHONE cp'
      
        #9'left join IS_INTERCEPTED(cp.AG_ID, cp.CP_NUMBER) ii2 on (ii2.AG' +
        '_ID = cp.AG_ID)'
      'where'
      #9#9'cp.AG_ID = :AG_ID'
      #9'and cp.CU_ID = :CU_ID'
      ''
      'order by 2')
    SQLConnection = data.connection
    Left = 352
    Top = 154
    object qSdelkaPhoneAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object qSdelkaPhoneCP_NUMBER: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'CP_NUMBER'
      EditMask = '000-00-00;0;_'
      Size = 16
    end
    object qSdelkaPhoneINTERCEPTED: TIntegerField
      FieldName = 'INTERCEPTED'
    end
    object qSdelkaPhoneCU_ID: TIntegerField
      FieldName = 'CU_ID'
    end
    object qSdelkaPhoneCP_ADDDATE: TSQLTimeStampField
      FieldName = 'CP_ADDDATE'
    end
  end
  object prvSdelkaPhone: TDataSetProvider
    DataSet = qrySdelkaPhone
    OnGetTableName = prvSdelkaPhoneGetTableName
    Left = 448
    Top = 152
  end
  object cdsSdelkaPhone: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSdelkaPhone'
    AfterInsert = cdsSdelkaPhoneAfterInsert
    OnReconcileError = cdsSdelkaOneReconcileError
    Left = 536
    Top = 152
    object cdsSdelkaPhoneAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object cdsSdelkaPhoneCU_ID: TIntegerField
      FieldName = 'CU_ID'
    end
    object cdsSdelkaPhoneCP_NUMBER: TStringField
      FieldName = 'CP_NUMBER'
      EditMask = '000-00-00;0;_'
      Size = 16
    end
    object cdsSdelkaPhoneCP_ADDDATE: TSQLTimeStampField
      FieldName = 'CP_ADDDATE'
    end
    object cdsSdelkaPhoneINTERCEPTED: TIntegerField
      FieldName = 'INTERCEPTED'
    end
  end
  object qCustInfo: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CU_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AG_ID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT * FROM CUST C WHERE C.CU_ID = :CU_ID AND C.AG_ID = :AG_ID')
    SQLConnection = data.connection
    Left = 528
    Top = 360
  end
  object qLogERR: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'US_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ERR_TEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SD_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AG_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ERR_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ERR_CTX'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      
        'INSERT INTO pk_error_log(US_ID, ERR_TEXT, SD_ID, AG_ID,ERR_DATE,' +
        'ERR_CTX) '
      'VALUES(:US_ID, :ERR_TEXT, :SD_ID, :AG_ID,:ERR_DATE,:ERR_CTX)')
    SQLConnection = data.connection
    Left = 520
    Top = 432
  end
  object cdsInet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvInet'
    Left = 128
    Top = 288
    object cdsInetAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object cdsInetSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object cdsInetOB_LINK: TStringField
      FieldName = 'OB_LINK'
      Size = 1024
    end
    object cdsInetOB_TYPE: TSmallintField
      FieldName = 'OB_TYPE'
    end
    object cdsInetSHORT_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'SHORT_NAME'
      LookupDataSet = sdsOB_Type
      LookupKeyFields = 'OB_TYPE'
      LookupResultField = 'SHORT_NAME'
      KeyFields = 'OB_TYPE'
      Size = 32
      Lookup = True
    end
  end
  object prvInet: TDataSetProvider
    DataSet = qInet
    OnGetTableName = prvInetGetTableName
    Left = 96
    Top = 288
  end
  object qInet: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ag_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sd_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT * FROM sd_inet_ob sib'
      'WHERE sib.ag_id = :ag_id AND sib.sd_id = :sd_id')
    SQLConnection = data.connection
    Left = 64
    Top = 288
    object qInetAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object qInetSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object qInetOB_LINK: TStringField
      FieldName = 'OB_LINK'
      Size = 1024
    end
    object qInetOB_TYPE: TSmallintField
      FieldName = 'OB_TYPE'
    end
  end
  object dsInet: TDataSource
    DataSet = cdsInet
    Left = 160
    Top = 288
  end
  object sdsOB_Type: TSimpleDataSet
    Aggregates = <>
    Connection = data.connection
    DataSet.CommandText = 
      'SELECT f.FM_ID AS OB_TYPE, f.FM_NAME AS SHORT_NAME FROM FORMAT f' +
      ' LEFT JOIN format_cost fc ON (f.fm_id = fc.fm_id) WHERE fc.gz_id' +
      ' = 0 ORDER BY ORDERBY'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 72
    Top = 320
    object sdsOB_TypeOB_TYPE: TSmallintField
      FieldName = 'OB_TYPE'
    end
    object sdsOB_TypeSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
      Size = 32
    end
  end
  object qPayHistory: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'AG_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SD_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PAY_SUM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'US_ID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      
        'INSERT INTO sdelka_pay_history(AG_ID, SD_ID, PAY_SUM, PAY_DATE, ' +
        'US_ID)'
      'VALUES(:AG_ID, :SD_ID, :PAY_SUM, CURRENT_TIMESTAMP, :US_ID)')
    SQLConnection = data.connection
    Left = 432
    Top = 488
  end
  object spEvent: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ev_id'
        ParamType = ptUnknown
      end>
    SQLConnection = data.connection
    StoredProcName = 'EVENT_CHANGE'
    Left = 616
    Top = 256
  end
end
