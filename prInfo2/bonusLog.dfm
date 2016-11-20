object frmBonusLog: TfrmBonusLog
  Left = 302
  Top = 351
  BorderStyle = bsDialog
  Caption = #1046#1091#1088#1085#1072#1083' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1073#1086#1085#1091#1089#1086#1074
  ClientHeight = 261
  ClientWidth = 637
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 238
    Width = 31
    Height = 13
    Caption = #1057#1091#1084#1084#1072
  end
  object Label2: TLabel
    Left = 152
    Top = 238
    Width = 67
    Height = 13
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 621
    Height = 217
    Color = clBtnFace
    DataSource = dsBonusLog
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'BT_DATE'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BT_SUM'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BT_CHANGE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BT_COMMENT'
        Width = 397
        Visible = True
      end>
  end
  object edSubSum: TEdit
    Left = 50
    Top = 234
    Width = 87
    Height = 21
    TabOrder = 1
  end
  object btSubBonus: TBitBtn
    Left = 440
    Top = 232
    Width = 105
    Height = 25
    Caption = #1057#1085#1103#1090#1100' '#1073#1086#1085#1091#1089
    Enabled = False
    TabOrder = 3
    OnClick = btSubBonusClick
    Glyph.Data = {
      6A000000424D6A000000000000003E000000280000000B0000000B0000000100
      0100000000002C0000000000000000000000020000000000000000000000FFFF
      FF00FFE00000FFE00000FFE00000FFE00000002000000020000000200000FFE0
      0000FFE00000FFE00000FFE00000}
  end
  object edSubComment: TEdit
    Left = 224
    Top = 234
    Width = 209
    Height = 21
    TabOrder = 2
  end
  object qryBonusLog: TSimpleDataSet
    Aggregates = <>
    Connection = data.connection
    DataSet.CommandText = 
      'SELECT BT.* FROM BONUS_TRANSACTIONS BT WHERE BT.AG_ID=:AG_ID AND' +
      ' BT.CU_ID=:CU_ID ORDER BY BT.BT_ID'
    DataSet.DataSource = data.dsCust
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'CU_ID'
        ParamType = ptInput
        Size = 4
      end>
    Params = <>
    Left = 336
    Top = 40
    object qryBonusLogAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Origin = 'DB.BONUS_TRANSACTIONS.AG_ID'
    end
    object qryBonusLogCU_ID: TIntegerField
      FieldName = 'CU_ID'
      Origin = 'DB.BONUS_TRANSACTIONS.CU_ID'
    end
    object qryBonusLogBT_ID: TIntegerField
      FieldName = 'BT_ID'
      Origin = 'DB.BONUS_TRANSACTIONS.BT_ID'
    end
    object qryBonusLogBT_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'BT_DATE'
      Origin = 'DB.BONUS_TRANSACTIONS.BT_DATE'
    end
    object qryBonusLogBT_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1073#1086#1085#1091#1089#1072
      FieldName = 'BT_SUM'
      Origin = 'DB.BONUS_TRANSACTIONS.BT_SUM'
      DisplayFormat = '0.##'
    end
    object qryBonusLogBT_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'BT_COMMENT'
      Origin = 'DB.BONUS_TRANSACTIONS.BT_COMMENT'
      Size = 128
    end
    object qryBonusLogBT_CHANGE: TFloatField
      DisplayLabel = #1048#1079#1084#1077#1085#1077#1085#1080#1077
      FieldName = 'BT_CHANGE'
      Origin = 'DB.BONUS_TRANSACTIONS.BT_CHANGE'
      DisplayFormat = '0.##'
    end
  end
  object dsBonusLog: TDataSource
    DataSet = qryBonusLog
    Left = 400
    Top = 40
  end
  object spAddBonus: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CU_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'BT_CHANGE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'BT_COMMENT'
        ParamType = ptInput
      end>
    SQLConnection = data.connection
    StoredProcName = 'ADD_BONUS'
    Left = 336
    Top = 96
  end
end
