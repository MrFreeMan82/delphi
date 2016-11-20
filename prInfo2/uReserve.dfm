object frmReserve: TfrmReserve
  Left = 853
  Top = 260
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1047#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1090#1100
  ClientHeight = 159
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 32
    Top = 8
    Width = 92
    Height = 16
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100': '
  end
  object Label2: TLabel
    Left = 32
    Top = 33
    Width = 38
    Height = 16
    Caption = #1040#1075#1077#1085#1090':'
  end
  object Label3: TLabel
    Left = 32
    Top = 93
    Width = 83
    Height = 16
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
  end
  object Label4: TLabel
    Left = 32
    Top = 62
    Width = 59
    Height = 16
    Caption = #1053#1086#1084#1077#1088'('#1072'):'
  end
  object lblUser: TDBText
    Left = 128
    Top = 8
    Width = 337
    Height = 17
    DataField = 'US_NAME'
    DataSource = dsUsr
  end
  object btnOK: TBitBtn
    Left = 256
    Top = 127
    Width = 100
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 0
    OnClick = btnReserveClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 368
    Top = 126
    Width = 100
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = btnCancelClick
    Kind = bkCancel
  end
  object cbAgent: TDBLookupComboboxEh
    Left = 128
    Top = 29
    Width = 336
    Height = 24
    DataField = 'AG_ID'
    DataSource = dsReserveRecord
    EditButtons = <>
    KeyField = 'AG_ID'
    ListField = 'AG_NAME'
    ListSource = dsAgent
    TabOrder = 2
    Visible = True
  end
  object txtIssues: TEdit
    Left = 128
    Top = 59
    Width = 338
    Height = 24
    TabOrder = 3
  end
  object txtComment: TDBEdit
    Left = 128
    Top = 88
    Width = 337
    Height = 24
    DataField = 'COMMENT'
    DataSource = dsReserveRecord
    TabOrder = 4
  end
  object qUsr: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'us_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select u.US_NAME from usr u where u.US_ID = :us_id'
      '')
    SQLConnection = data.connection
    Left = 128
    object qUsrUS_NAME: TStringField
      FieldName = 'US_NAME'
      Size = 128
    end
  end
  object qReserveRecord: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select rr.RR_ID,'
      '          rr.AG_ID,'
      '          rr.US_ID,'
      '          rr.RM_ID,'
      '          rr.COMMENT'
      'from RESERVE_RECORD rr '
      'where rr.rr_id = :id')
    SQLConnection = data.connection
    Left = 144
    Top = 72
    object qReserveRecordRR_ID: TIntegerField
      FieldName = 'RR_ID'
    end
    object qReserveRecordUS_ID: TIntegerField
      FieldName = 'US_ID'
    end
    object qReserveRecordAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object qReserveRecordCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 128
    end
    object qReserveRecordRM_ID: TIntegerField
      FieldName = 'RM_ID'
    end
  end
  object qAgent: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'us_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select a.*'
      'from agent a'
      'left join USR_RIGHTS ur on (a.AG_ID = ur.AG_ID)'
      'where a.AG_IS_ACTIVE= 1'
      'and ur.US_ID = :us_id'
      'ORDER BY a.AG_NAME')
    SQLConnection = data.connection
    Left = 144
    Top = 24
    object qAgentAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object qAgentAG_NAME: TStringField
      FieldName = 'AG_NAME'
      Size = 128
    end
  end
  object prvAgent: TDataSetProvider
    DataSet = qAgent
    Left = 176
    Top = 24
  end
  object cdsAgent: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAgent'
    Left = 208
    Top = 24
    object cdsAgentAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object cdsAgentAG_NAME: TStringField
      FieldName = 'AG_NAME'
      Size = 128
    end
  end
  object dsAgent: TDataSource
    DataSet = cdsAgent
    Left = 240
    Top = 24
  end
  object dsReserveRecord: TDataSource
    DataSet = cdsReserveRecord
    Left = 256
    Top = 72
  end
  object prvReserveRecord: TDataSetProvider
    DataSet = qReserveRecord
    Left = 176
    Top = 72
  end
  object cdsReserveRecord: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReserveRecord'
    Left = 216
    Top = 72
    object cdsReserveRecordRR_ID: TIntegerField
      FieldName = 'RR_ID'
    end
    object cdsReserveRecordUS_ID: TIntegerField
      FieldName = 'US_ID'
    end
    object cdsReserveRecordAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object cdsReserveRecordCOMMENT: TStringField
      FieldName = 'COMMENT'
      Size = 128
    end
    object cdsReserveRecordRM_ID: TIntegerField
      FieldName = 'RM_ID'
    end
  end
  object dsUsr: TDataSource
    DataSet = qUsr
    Left = 160
  end
  object qDeleteRR: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'DELETE FROM RESERVE_RECORD rr WHERE rr.rr_id = :id')
    SQLConnection = data.connection
    Left = 96
    Top = 120
  end
end
