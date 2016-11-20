object frmNewRubrika: TfrmNewRubrika
  Left = 902
  Top = 309
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1053#1086#1074#1072#1103' '#1088#1091#1073#1088#1080#1082#1072
  ClientHeight = 225
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  DesignSize = (
    352
    225)
  PixelsPerInch = 96
  TextHeight = 16
  object Label5: TLabel
    Left = 8
    Top = 13
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
    Top = 38
    Width = 74
    Height = 14
    Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1085#1086':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 61
    Width = 71
    Height = 14
    Caption = #1050#1086#1101#1092'. '#1094#1077#1085#1099':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 85
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
  object Label4: TLabel
    Left = 24
    Top = 139
    Width = 36
    Height = 14
    Caption = #1050#1072#1088#1090#1072':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btSaveRubrika: TBitBtn
    Left = 162
    Top = 194
    Width = 91
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    OnClick = btSaveRubrikaClick
  end
  object btClose: TBitBtn
    Left = 258
    Top = 194
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
  object txtName: TDBEdit
    Left = 104
    Top = 8
    Width = 233
    Height = 24
    DataField = 'RB_NAME'
    DataSource = dsRubrika
    TabOrder = 2
  end
  object txtShort: TDBEdit
    Left = 104
    Top = 32
    Width = 233
    Height = 24
    DataField = 'RB_NAME_SHORT'
    DataSource = dsRubrika
    TabOrder = 3
  end
  object txtPriceKoef: TDBEdit
    Left = 104
    Top = 56
    Width = 233
    Height = 24
    DataField = 'RB_COST_COEFF'
    DataSource = dsRubrika
    TabOrder = 4
  end
  object txtOrder: TDBEdit
    Left = 104
    Top = 80
    Width = 49
    Height = 24
    DataField = 'ORDERBY'
    DataSource = dsRubrika
    TabOrder = 5
  end
  object txtMap: TDBEdit
    Left = 72
    Top = 136
    Width = 265
    Height = 24
    Hint = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077' '#1084#1086#1076#1091#1083#1077#1081' '#1074' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1086#1081' '#1086#1073#1083#1086#1078#1082#1077' '
    DataField = 'DEFAULT_MAP'
    DataSource = dsRubrika
    TabOrder = 6
  end
  object chkCover: TDBCheckBox
    Left = 8
    Top = 112
    Width = 89
    Height = 17
    Caption = #1054#1073#1083#1086#1078#1082#1072
    DataField = 'RB_IS_OBLOGKA'
    DataSource = dsRubrika
    TabOrder = 7
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object chkHot: TDBCheckBox
    Left = 8
    Top = 167
    Width = 97
    Height = 17
    Caption = #1043#1086#1088#1103#1095#1072#1103
    DataField = 'RB_IS_HOT'
    DataSource = dsRubrika
    TabOrder = 8
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object chkBlock: TDBCheckBox
    Left = 8
    Top = 191
    Width = 97
    Height = 17
    Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100
    DataField = 'DELETED'
    DataSource = dsRubrika
    TabOrder = 9
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object qRubrika: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT * FROM RUBRIKA r WHERE r.RB_ID = :id')
    SQLConnection = data.connection
    Left = 200
    Top = 96
  end
  object prvRubrika: TDataSetProvider
    DataSet = qRubrika
    Left = 232
    Top = 96
  end
  object cdsRubrika: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRubrika'
    Left = 264
    Top = 96
    object cdsRubrikaRB_NAME: TStringField
      FieldName = 'RB_NAME'
      Size = 128
    end
    object cdsRubrikaRB_NAME_SHORT: TStringField
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object cdsRubrikaRB_COST_COEFF: TFloatField
      FieldName = 'RB_COST_COEFF'
      DisplayFormat = '0.#'
    end
    object cdsRubrikaRB_IS_OBLOGKA: TSmallintField
      FieldName = 'RB_IS_OBLOGKA'
    end
    object cdsRubrikaGZ_ID: TIntegerField
      FieldName = 'GZ_ID'
    end
    object cdsRubrikaRB_IS_HOT: TSmallintField
      FieldName = 'RB_IS_HOT'
    end
    object cdsRubrikaDELETED: TSmallintField
      FieldName = 'DELETED'
    end
    object cdsRubrikaORDERBY: TIntegerField
      FieldName = 'ORDERBY'
    end
    object cdsRubrikaDEFAULT_MAP: TStringField
      FieldName = 'DEFAULT_MAP'
      Size = 255
    end
    object cdsRubrikaRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object cdsRubrikaRB_IS_LOCKABLE: TIntegerField
      FieldName = 'RB_IS_LOCKABLE'
    end
  end
  object dsRubrika: TDataSource
    DataSet = cdsRubrika
    Left = 296
    Top = 96
  end
end
