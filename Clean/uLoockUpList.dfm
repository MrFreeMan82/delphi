object frmLookUp: TfrmLookUp
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 61
  ClientWidth = 122
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object txtNewLq: TDBEdit
    Left = 0
    Top = -1
    Width = 121
    Height = 21
    DataField = 'LQ_NAME'
    DataSource = dsNewLiq
    TabOrder = 0
    OnChange = txtNewLqChange
    OnKeyDown = txtNewLqKeyDown
  end
  object lstLq: TDBLookupListBox
    Left = 0
    Top = 19
    Width = 121
    Height = 39
    BorderStyle = bsNone
    DataField = 'LQ_ID'
    DataSource = dsNewLiq
    KeyField = 'LQ_ID'
    ListField = 'LQ_NAME'
    ListSource = data.dsLiquid
    TabOrder = 1
    Visible = False
    OnKeyUp = lstLqKeyUp
    OnMouseUp = lstLqMouseUp
  end
  object qNewLiq: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM LIQUID l WHERE l.lq_id = -1')
    SQLConnection = data.connection
    Top = 24
  end
  object prvNewLiq: TDataSetProvider
    DataSet = qNewLiq
    Left = 16
    Top = 24
  end
  object cdsNewLiq: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvNewLiq'
    Left = 32
    Top = 24
    object cdsNewLiqLQ_ID: TIntegerField
      FieldName = 'LQ_ID'
    end
    object cdsNewLiqLQ_NAME: TStringField
      FieldName = 'LQ_NAME'
      Size = 32
    end
    object cdsNewLiqLQ_PRICE: TFloatField
      FieldName = 'LQ_PRICE'
    end
  end
  object dsNewLiq: TDataSource
    DataSet = cdsNewLiq
    Left = 40
    Top = 24
  end
end
