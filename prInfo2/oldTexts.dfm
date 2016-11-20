object frmOldTexts: TfrmOldTexts
  Left = 869
  Top = 266
  BorderStyle = bsDialog
  Caption = #1057#1076#1077#1083#1082#1080' '#1101#1090#1086#1075#1086' '#1082#1083#1080#1077#1085#1090#1072
  ClientHeight = 351
  ClientWidth = 623
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 5
    Top = 36
    Width = 396
    Height = 279
    DataSource = dsOldTexts
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'FM_NAME_LK'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RB_NAME_LK'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OB_TEXT'
        Width = 205
        Visible = True
      end>
  end
  object cbIssue: TDBLookupComboBox
    Left = 121
    Top = 8
    Width = 145
    Height = 21
    KeyField = 'IS_ID'
    ListField = 'IS_NAME_COMPOSED'
    ListSource = data.dsIssuePR
    TabOrder = 0
  end
  object rbIssuesPR: TRadioButton
    Left = 5
    Top = 12
    Width = 41
    Height = 17
    Caption = #1055#1056
    Checked = True
    TabOrder = 3
    TabStop = True
  end
  object rbIssuesNS: TRadioButton
    Left = 48
    Top = 12
    Width = 41
    Height = 17
    Caption = #1053#1057
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 89
    Top = 6
    Width = 25
    Height = 25
    Caption = '>>'
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 6
    Width = 129
    Height = 25
    Caption = #1053#1072#1081#1090#1080' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1103' >>'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object DBMemo1: TDBMemo
    Left = 408
    Top = 36
    Width = 209
    Height = 279
    TabStop = False
    DataField = 'OB_TEXT'
    DataSource = dsOldTexts
    TabOrder = 6
  end
  object BitBtn3: TBitBtn
    Left = 312
    Top = 321
    Width = 90
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100
    Default = True
    ModalResult = 1
    TabOrder = 7
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000B0000000B0000000100
      04000000000058000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
      0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
      0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
      0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
  end
  object qryOldTexts: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'AG_ID'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'SD_ID'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'IS_ID'
        ParamType = ptInput
        Value = '1'
      end>
    SQL.Strings = (
      'SELECT'
      '  DISTINCT'
      '    OB.OB_TEXT,'
      '    OB.RB_ID,'
      '    OB.FM_ID'
      'FROM'
      '  GET_OLD_SDELKA_TEXTS(:AG_ID,:SD_ID,:IS_ID) GOST'
      ''
      '  LEFT JOIN SDELKA SD'
      '  ON (SD.AG_ID=GOST.AG_ID AND SD.SD_ID=GOST.SD_ID)'
      ''
      '  LEFT JOIN OBJAV OB'
      
        '  ON (OB.AG_ID=GOST.AG_ID AND OB.SD_ID=GOST.SD_ID AND OB.OB_ID=G' +
        'OST.OB_ID)'
      'ORDER BY'
      '  SD.SD_DATE DESC')
    SQLConnection = data.connection
    Left = 72
    Top = 88
    object qryOldTextsOB_TEXT: TStringField
      FieldName = 'OB_TEXT'
      Size = 2047
    end
    object qryOldTextsRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object qryOldTextsFM_ID: TSmallintField
      FieldName = 'FM_ID'
    end
  end
  object dsOldTexts: TDataSource
    DataSet = cdsOldTexts
    Left = 328
    Top = 88
  end
  object prvOldTexts: TDataSetProvider
    DataSet = qryOldTexts
    Left = 168
    Top = 88
  end
  object cdsOldTexts: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'AG_ID'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'SD_ID'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'IS_ID'
        ParamType = ptInput
        Value = '1'
      end>
    ProviderName = 'prvOldTexts'
    ReadOnly = True
    Left = 248
    Top = 88
    object cdsOldTextsOB_TEXT: TStringField
      DisplayLabel = #1058#1077#1082#1089#1090
      FieldName = 'OB_TEXT'
      Size = 2047
    end
    object cdsOldTextsRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object cdsOldTextsRB_NAME_LK: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldKind = fkLookup
      FieldName = 'RB_NAME_LK'
      LookupDataSet = data.tblRubrika
      LookupKeyFields = 'RB_ID'
      LookupResultField = 'RB_NAME_SHORT'
      KeyFields = 'RB_ID'
      Lookup = True
    end
    object cdsOldTextsFM_ID: TSmallintField
      FieldName = 'FM_ID'
    end
    object cdsOldTextsFM_NAME_LK: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldKind = fkLookup
      FieldName = 'FM_NAME_LK'
      LookupDataSet = data.tblFormat
      LookupKeyFields = 'FM_ID'
      LookupResultField = 'FM_NAME'
      KeyFields = 'FM_ID'
      Lookup = True
    end
  end
end
