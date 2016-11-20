object frmTest: TfrmTest
  Left = 0
  Top = 0
  Caption = #1053#1086#1074#1072#1103' '#1078#1080#1076#1082#1086#1089#1090#1100
  ClientHeight = 201
  ClientWidth = 317
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object txtNewLq: TDBEdit
    Tag = 1
    Left = 0
    Top = -1
    Width = 121
    Height = 21
    DataField = 'D_NAME'
    DataSource = dsNewItem
    TabOrder = 0
    OnChange = txtChange
    OnKeyDown = txtKeyDown
  end
  object lstNewLq: TDBLookupListBox
    Tag = 1
    Left = 80
    Top = 67
    Width = 121
    Height = 91
    BorderStyle = bsNone
    DataField = 'D_NAME'
    DataSource = dsNewItem
    KeyField = 'FN_NAME'
    ListField = 'FN_NAME'
    ListSource = data.dsFNames
    TabOrder = 1
    Visible = False
    OnKeyUp = lstKeyUp
    OnMouseUp = lstMouseUp
  end
  object dsNewItem: TDataSource
    DataSet = cdsNewItem
    Left = 248
    Top = 8
  end
  object cdsNewItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvNewItem'
    Left = 216
    Top = 8
    object cdsNewItemD_ID: TIntegerField
      FieldName = 'D_ID'
    end
    object cdsNewItemORG_ID: TIntegerField
      FieldName = 'ORG_ID'
    end
    object cdsNewItemD_NAME: TStringField
      FieldName = 'D_NAME'
      Size = 64
    end
    object cdsNewItemD_SECNAME: TStringField
      FieldName = 'D_SECNAME'
      Size = 64
    end
    object cdsNewItemD_THNAME: TStringField
      FieldName = 'D_THNAME'
      Size = 64
    end
    object cdsNewItemD_TEL: TStringField
      FieldName = 'D_TEL'
      Size = 32
    end
  end
  object prvNewItem: TDataSetProvider
    DataSet = qNewItem
    Left = 184
    Top = 8
  end
  object qNewItem: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DRIVER d WHERE d.d_id = -1')
    SQLConnection = data.connection
    Left = 152
    Top = 8
  end
end
