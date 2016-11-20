object frmObjavOrder: TfrmObjavOrder
  Left = 305
  Top = 271
  BorderStyle = bsDialog
  Caption = #1055#1086#1088#1103#1076#1086#1082' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1081' '#1074' '#1088#1091#1073#1088#1080#1082#1077
  ClientHeight = 473
  ClientWidth = 538
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 45
    Height = 16
    Caption = #1043#1072#1079#1077#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape86: TShape
    Left = 7
    Top = 31
    Width = 521
    Height = 1
    Pen.Color = clBtnShadow
  end
  object Label2: TLabel
    Left = 208
    Top = 8
    Width = 55
    Height = 16
    Caption = #1056#1091#1073#1088#1080#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape1: TShape
    Left = 7
    Top = 438
    Width = 521
    Height = 1
    Pen.Color = clBtnShadow
  end
  object cbGaz: TDBLookupComboBox
    Left = 59
    Top = 5
    Width = 138
    Height = 21
    KeyField = 'GZ_ID'
    ListField = 'GZ_NAME'
    ListSource = data.dsGazeta
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 38
    Width = 521
    Height = 395
    DataSource = publData.dsObjavOrder
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Color = clBtnFace
        Expanded = False
        FieldName = 'SD_ID_COMPOUND'
        Width = 70
        Visible = True
      end
      item
        Color = clBtnFace
        Expanded = False
        FieldName = 'OS_NAME'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OB_ORDER'
        Visible = True
      end
      item
        Color = clBtnFace
        Expanded = False
        FieldName = 'OBJAV_TEXT'
        Width = 216
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 453
    Top = 5
    Width = 75
    Height = 21
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object cbRub: TDBLookupComboBox
    Left = 267
    Top = 5
    Width = 181
    Height = 21
    KeyField = 'RB_ID'
    ListField = 'RB_NAME'
    ListSource = data.dsRubrika
    TabOrder = 3
  end
  object BitBtn2: TBitBtn
    Left = 440
    Top = 444
    Width = 89
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 4
    OnClick = BitBtn2Click
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000B0000000B0000000100
      04000000000058000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
      0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
      0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
      0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
  end
end
