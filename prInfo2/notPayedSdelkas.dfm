object frmNotPayedSdelkas: TfrmNotPayedSdelkas
  Left = 784
  Top = 394
  BorderStyle = bsDialog
  Caption = #1053#1077#1086#1087#1083#1072#1095#1077#1085#1085#1099#1077' '#1089#1076#1077#1083#1082#1080
  ClientHeight = 222
  ClientWidth = 670
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
  object grid: TDBGrid
    Left = 0
    Top = 0
    Width = 670
    Height = 222
    Align = alClient
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'AG_NAME'
        Title.Caption = #1040#1075#1077#1085#1090
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CU_NAME'
        Title.Caption = #1050#1083#1080#1077#1085#1090
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SD_ID_COMPOUND'
        Title.Caption = #1053#1086#1084#1077#1088' '#1089#1076#1077#1083#1082#1080
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SD_SUM'
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PODACHA_NUMS'
        Title.Caption = #1055#1086#1076#1072#1095#1080
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SD_FACT_NUM'
        Title.Caption = #1057#1095#1105#1090
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SD_FACT_DATE'
        Title.Caption = #1044#1072#1090#1072' '#1089#1095#1105#1090#1072
        Width = 74
        Visible = True
      end>
  end
end
