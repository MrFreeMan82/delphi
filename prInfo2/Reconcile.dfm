object ReconcileErrorForm: TReconcileErrorForm
  Left = 925
  Top = 293
  BorderStyle = bsDialog
  Caption = #1054#1096#1080#1073#1082#1072
  ClientHeight = 256
  ClientWidth = 414
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = DisplayFieldValues
  PixelsPerInch = 96
  TextHeight = 13
  object UpdateType: TLabel
    Left = 63
    Top = 13
    Width = 68
    Height = 13
    Alignment = taRightJustify
    Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Default'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 64
    Top = 134
    Width = 178
    Height = 13
    Caption = #1042#1085#1091#1090#1088#1077#1085#1085#1077#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1077' '#1086#1073' '#1086#1096#1080#1073#1082#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object IconImage: TImage
    Left = 12
    Top = 12
    Width = 34
    Height = 34
    Picture.Data = {
      055449636F6E0000010002002020100000000000E80200002600000020200200
      00000000300100000E0300002800000020000000400000000100040000000000
      0002000000000000000000000000000000000000000000000000800000800000
      00808000800000008000800080800000C0C0C000808080000000FF0000FF0000
      00FFFF00FF000000FF00FF00FFFF0000FFFFFF00000008888888888888888888
      8888880000008888888888888888888888888880003000000000000000000000
      0008888803BBBBBBBBBBBBBBBBBBBBBBBB7088883BBBBBBBBBBBBBBBBBBBBBBB
      BBB708883BBBBBBBBBBBBBBBBBBBBBBBBBBB08883BBBBBBBBBBBB7007BBBBBBB
      BBBB08803BBBBBBBBBBBB0000BBBBBBBBBB7088003BBBBBBBBBBB0000BBBBBBB
      BBB0880003BBBBBBBBBBB7007BBBBBBBBB708800003BBBBBBBBBBBBBBBBBBBBB
      BB088000003BBBBBBBBBBB0BBBBBBBBBB70880000003BBBBBBBBB707BBBBBBBB
      B08800000003BBBBBBBBB303BBBBBBBB7088000000003BBBBBBBB000BBBBBBBB
      0880000000003BBBBBBB70007BBBBBB708800000000003BBBBBB30003BBBBBB0
      88000000000003BBBBBB00000BBBBB70880000000000003BBBBB00000BBBBB08
      800000000000003BBBBB00000BBBB7088000000000000003BBBB00000BBBB088
      0000000000000003BBBB00000BBB708800000000000000003BBB70007BBB0880
      00000000000000003BBBBBBBBBB70880000000000000000003BBBBBBBBB08800
      000000000000000003BBBBBBBB7088000000000000000000003BBBBBBB088000
      0000000000000000003BBBBBB708800000000000000000000003BBBBB0880000
      00000000000000000003BBBB70800000000000000000000000003BB700000000
      0000000000000000000003330000000000000000F8000003F0000001C0000000
      80000000000000000000000000000001000000018000000380000003C0000007
      C0000007E000000FE000000FF000001FF000001FF800003FF800003FFC00007F
      FC00007FFE0000FFFE0000FFFF0001FFFF0001FFFF8003FFFF8003FFFFC007FF
      FFC007FFFFE00FFFFFE01FFFFFF07FFFFFF8FFFF280000002000000040000000
      0100010000000000800000000000000000000000000000000000000000000000
      FFFFFF000000000000000000000000003FFFFFC07FFFFFE07FFFFFF07FFCFFF0
      7FF87FE03FF87FE03FFCFFC01FFFFFC01FFDFF800FFDFF800FFDFF0007F8FF00
      07F8FE0003F8FE0003F07C0001F07C0001F0780000F0780000F070000078F000
      007FE000003FE000003FC000001FC000001F8000000F8000000F000000060000
      00000000FFFFFFFFFFFFFFFFC000001F8000000F000000070000000700000007
      000000078000000F8000000FC000001FC000001FE000003FE000003FF000007F
      F000007FF80000FFF80000FFFC0001FFFC0001FFFE0003FFFE0003FFFF0007FF
      FF0007FFFF800FFFFF800FFFFFC01FFFFFC01FFFFFE03FFFFFE03FFFFFF07FFF
      FFF8FFFF}
  end
  object Label2: TLabel
    Left = 64
    Top = 37
    Width = 46
    Height = 13
    Caption = #1055#1088#1080#1095#1080#1085#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Default'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 135
    Top = 13
    Width = 268
    Height = 13
    Caption = #1085#1077' '#1084#1086#1078#1077#1090' '#1073#1099#1090#1100' '#1074#1099#1087#1086#1083#1085#1077#1085#1086' '#1080' '#1073#1091#1076#1077#1090' '#1086#1090#1084#1077#1085#1077#1085#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ActionGroup: TRadioGroup
    Left = 282
    Top = 314
    Width = 102
    Height = 55
    Caption = ' Reconcile Action '
    TabOrder = 0
    Visible = False
    OnClick = DisplayFieldValues
  end
  object OKBtn: TButton
    Left = 247
    Top = 227
    Width = 159
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    Default = True
    ModalResult = 1
    TabOrder = 4
  end
  object ConflictsOnly: TCheckBox
    Left = 283
    Top = 282
    Width = 153
    Height = 17
    Caption = 'Show conflicting fields only'
    TabOrder = 2
    Visible = False
    OnClick = DisplayFieldValues
  end
  object ErrorMsg: TMemo
    Left = 64
    Top = 149
    Width = 342
    Height = 71
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object ChangedOnly: TCheckBox
    Left = 281
    Top = 258
    Width = 141
    Height = 17
    Caption = 'Show changed fields only'
    TabOrder = 3
    Visible = False
    OnClick = DisplayFieldValues
  end
  object UpdateData: TStringGrid
    Left = 120
    Top = 272
    Width = 121
    Height = 79
    ColCount = 4
    DefaultColWidth = 119
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goThumbTracking]
    TabOrder = 1
    Visible = False
    OnSelectCell = UpdateDataSelectCell
    OnSetEditText = UpdateDataSetEditText
    RowHeights = (
      24
      24)
  end
  object mmReason: TMemo
    Left = 64
    Top = 53
    Width = 342
    Height = 71
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
end
