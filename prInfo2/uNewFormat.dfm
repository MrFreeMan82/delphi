object frmNewFormat: TfrmNewFormat
  Left = 968
  Top = 416
  BorderStyle = bsDialog
  Caption = #1053#1086#1074#1099#1081' '#1092#1086#1088#1084#1072#1090
  ClientHeight = 268
  ClientWidth = 260
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    260
    268)
  PixelsPerInch = 96
  TextHeight = 14
  object Label5: TLabel
    Left = 8
    Top = 37
    Width = 56
    Height = 14
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 62
    Width = 54
    Height = 14
    Caption = #1055#1083#1086#1097#1072#1076#1100':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 85
    Width = 90
    Height = 14
    Caption = #1056#1072#1079#1084#1077#1088' '#1084#1086#1076#1091#1083#1103':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 110
    Width = 64
    Height = 14
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 15
    Width = 40
    Height = 14
    Caption = #1043#1072#1079#1077#1090#1072':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 157
    Width = 53
    Height = 14
    Caption = #1055#1086#1088#1103#1076#1086#1082':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 8
    Top = 134
    Width = 105
    Height = 14
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100'(4 '#1074#1099#1093'):'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btSaveFormats: TBitBtn
    Left = 66
    Top = 231
    Width = 91
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    OnClick = btSaveFormatsClick
  end
  object btClose: TBitBtn
    Left = 162
    Top = 231
    Width = 91
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
    OnClick = btCloseClick
  end
  object DBEdit1: TDBEdit
    Left = 125
    Top = 32
    Width = 125
    Height = 22
    DataField = 'FM_NAME'
    DataSource = dsNewFormat
    TabOrder = 2
    OnChange = DBEdit1Change
  end
  object cboGZ: TComboBox
    Left = 125
    Top = 8
    Width = 125
    Height = 22
    Style = csDropDownList
    ItemHeight = 14
    ItemIndex = 1
    TabOrder = 3
    Text = #1055#1056
    OnChange = DBEdit1Change
    Items.Strings = (
      #1048#1085#1090
      #1055#1056
      #1055#1054#1087#1090#1087
      #1057#1058
      #1056#1046
      #1056#1074#1050)
  end
  object DBEdit2: TDBEdit
    Left = 125
    Top = 57
    Width = 125
    Height = 22
    DataField = 'FM_SPACE'
    DataSource = dsNewFormat
    TabOrder = 4
    OnChange = DBEdit1Change
  end
  object DBEdit3: TDBEdit
    Left = 125
    Top = 81
    Width = 125
    Height = 22
    DataField = 'FM_PICTURE_SIZES'
    DataSource = dsNewFormat
    TabOrder = 5
    OnChange = DBEdit1Change
  end
  object DBEdit4: TDBEdit
    Left = 125
    Top = 106
    Width = 125
    Height = 22
    DataField = 'FM_COST'
    DataSource = dsFormatCost
    TabOrder = 6
    OnChange = DBEdit1Change
  end
  object chkModul: TCheckBox
    Left = 8
    Top = 184
    Width = 241
    Height = 17
    Caption = #1052#1086#1076#1091#1083#1100
    State = cbGrayed
    TabOrder = 7
    OnClick = DBEdit1Change
  end
  object DBEdit5: TDBEdit
    Left = 125
    Top = 155
    Width = 125
    Height = 22
    DataField = 'ORDERBY'
    DataSource = dsNewFormat
    TabOrder = 8
    OnChange = DBEdit1Change
  end
  object DBEdit6: TDBEdit
    Left = 125
    Top = 130
    Width = 125
    Height = 22
    DataField = 'FM_COST_4'
    DataSource = dsFormatCost
    TabOrder = 9
    OnChange = DBEdit1Change
  end
  object dsNewFormat: TDataSource
    DataSet = cdsNewFormat
    Left = 144
    Top = 200
  end
  object qNewFormat: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'fm_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT f.* '
      'FROM FORMAT f '
      'LEFT JOIN format_cost fc ON (f.fm_id = fc.fm_id) '
      'WHERE f.fm_id = :fm_id AND fc.gz_id = :gz_id')
    SQLConnection = data.connection
    Left = 48
    Top = 200
  end
  object prvNewFormat: TDataSetProvider
    DataSet = qNewFormat
    OnGetTableName = prvNewFormatGetTableName
    Left = 80
    Top = 200
  end
  object cdsNewFormat: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvNewFormat'
    Left = 112
    Top = 200
    object cdsNewFormatFM_ID: TIntegerField
      FieldName = 'FM_ID'
      Origin = 'FORMAT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsNewFormatFM_NAME: TStringField
      FieldName = 'FM_NAME'
      Required = True
      Size = 128
    end
    object cdsNewFormatFM_SPACE: TFloatField
      FieldName = 'FM_SPACE'
      Origin = 'FORMAT'
      DisplayFormat = '0.##'
    end
    object cdsNewFormatFM_HAS_PICTURE: TSmallintField
      FieldName = 'FM_HAS_PICTURE'
      Origin = 'FORMAT'
      Required = True
    end
    object cdsNewFormatFM_PICTURE_SIZES: TStringField
      FieldName = 'FM_PICTURE_SIZES'
      Origin = 'FORMAT'
      Size = 128
    end
    object cdsNewFormatORDERBY: TIntegerField
      FieldName = 'ORDERBY'
      Origin = 'FORMAT'
    end
  end
  object qFormatCost: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fm_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select * '
      'from FORMAT_COST fc '
      'where fc.GZ_ID = :gz_id and fc.FM_ID = :fm_id')
    SQLConnection = data.connection
    Left = 48
    Top = 232
  end
  object prvFormatCost: TDataSetProvider
    DataSet = qFormatCost
    Left = 80
    Top = 232
  end
  object cdsFormatCost: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvFormatCost'
    Left = 112
    Top = 232
    object cdsFormatCostGZ_ID: TIntegerField
      FieldName = 'GZ_ID'
    end
    object cdsFormatCostFM_ID: TIntegerField
      FieldName = 'FM_ID'
    end
    object cdsFormatCostFM_COST: TFloatField
      FieldName = 'FM_COST'
    end
    object cdsFormatCostFM_COST_4: TFloatField
      FieldName = 'FM_COST_4'
    end
  end
  object dsFormatCost: TDataSource
    DataSet = cdsFormatCost
    Left = 144
    Top = 232
  end
end
