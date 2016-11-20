object frmInetImport: TfrmInetImport
  Left = 1297
  Top = 628
  Width = 623
  Height = 422
  Caption = #1048#1084#1087#1086#1088#1090' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1081' '#1080#1079' '#1080#1085#1090#1077#1088#1085#1077#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAgent: TPanel
    Left = 0
    Top = 348
    Width = 607
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      607
      36)
    object Shape6: TShape
      Left = 0
      Top = 0
      Width = 607
      Height = 1
      Align = alTop
      Pen.Color = clBtnShadow
    end
    object Label1: TLabel
      Left = 232
      Top = 12
      Width = 37
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086':'
    end
    object Label2: TLabel
      Left = 8
      Top = 12
      Width = 45
      Height = 13
      Caption = #1056#1091#1073#1088#1080#1082#1072':'
    end
    object btCancelAg: TBitBtn
      Left = 520
      Top = 6
      Width = 87
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
      TabOrder = 2
      Glyph.Data = {
        CE000000424DCE0000000000000076000000280000000B0000000B0000000100
        04000000000058000000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF0FFFFF0FF0
        0000F000FFF000F0000000000F0000000000F000000000F00000FF0000000FF0
        0000FFF00000FFF00000FF0000000FF00000F000000000F0000000000F000000
        0000F000FFF000F00000FF0FFFFF0FF00000}
    end
    object btDone: TBitBtn
      Left = 428
      Top = 6
      Width = 87
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
      TabOrder = 1
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
    object btMore: TBitBtn
      Left = 336
      Top = 6
      Width = 87
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btMoreClick
      Glyph.Data = {
        DE000000424DDE0000000000000076000000280000000E0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
        FF00FFFFF00FFF70FF00FFF77000FF000F00FF0000000FF00700F0000000FFFF
        0000707FF00FFFFF000000FFF0FF0FFF000000FFFFF00FF7070000FFFF000000
        0F00700FF0000000FF00F000FF00077FFF00FF07FFF00FFFFF00FFFFFFFF0FFF
        FF00}
    end
    object cbRubrika: TDBLookupComboboxEh
      Left = 56
      Top = 9
      Width = 169
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      KeyField = 'RB_ID'
      ListField = 'RB_NAME_SHORT'
      ListSource = publData.dsRubrikaVerstka
      TabOrder = 3
      Visible = True
    end
    object edCount: TDBNumberEditEh
      Left = 272
      Top = 9
      Width = 57
      Height = 19
      AlwaysShowBorder = True
      currency = False
      DecimalPlaces = 0
      EditButtons = <
        item
          Style = ebsUpDownEh
        end>
      Flat = True
      TabOrder = 4
      Value = 10.000000000000000000
      Visible = True
    end
  end
  object grInetVac: TDBGridEh
    Left = 0
    Top = 0
    Width = 607
    Height = 348
    Align = alClient
    AllowedSelections = [gstRecordBookmarks, gstAll]
    DataSource = dsInetImport
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    RowLines = 4
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'VAC_ID'
        Footers = <>
        Title.Caption = 'ID '#1074#1072#1082#1072#1085#1089#1080#1080
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'RUBR_ID'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'VAC_NAME'
        Footers = <>
        Title.Caption = #1042#1072#1082#1072#1085#1089#1080#1103
        Width = 133
      end
      item
        EditButtons = <>
        FieldName = 'VAC_TEXT'
        Footers = <>
        Title.Caption = #1058#1077#1082#1089#1090
        Width = 364
        WordWrap = True
      end>
  end
  object cdsInetImport: THttpXMLDataSet
    Aggregates = <>
    Params = <>
    Opened = False
    transformationFile = 'SiteVac.xtr'
    ProxyPort = 0
    Left = 368
    Top = 168
  end
  object dsInetImport: TDataSource
    DataSet = cdsInetImport
    Left = 440
    Top = 168
  end
  object qryInetVac: TSimpleDataSet
    Aggregates = <>
    Connection = data.connection
    DataSet.CommandText = 'select * from OBJAV_INET_IMPORT'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 224
    Top = 80
    object qryInetVacOI_ID: TIntegerField
      FieldName = 'OI_ID'
    end
    object qryInetVacRB_ID: TIntegerField
      FieldName = 'RB_ID'
      Required = True
    end
    object qryInetVacOB_TEXT: TStringField
      FieldName = 'OB_TEXT'
      Size = 2047
    end
  end
end
