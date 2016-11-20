object frmOperator: TfrmOperator
  Left = 0
  Top = 0
  Align = alClient
  BorderIcons = []
  BorderStyle = bsNone
  Caption = #1054#1087#1077#1088#1072#1090#1086#1088
  ClientHeight = 375
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 785
    Height = 29
    ButtonHeight = 26
    ButtonWidth = 47
    Caption = 'ToolBar1'
    TabOrder = 0
    object btAddNew: TSpeedButton
      Left = 0
      Top = 0
      Width = 49
      Height = 26
      Caption = '+'
      OnClick = btAddNewClick
    end
    object btEdit: TSpeedButton
      Left = 49
      Top = 0
      Width = 49
      Height = 26
      Caption = '^'
      OnClick = btEditClick
    end
    object btRefresh: TSpeedButton
      Left = 98
      Top = 0
      Width = 49
      Height = 26
      Caption = '( )'
      OnClick = btRefreshClick
    end
    object ToolButton1: TToolButton
      Left = 147
      Top = 0
      Width = 71
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object btDel: TSpeedButton
      Left = 218
      Top = 0
      Width = 49
      Height = 26
      Caption = '-'
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 29
    Width = 785
    Height = 346
    Align = alClient
    DataSource = dsOperator
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'W_DATE'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'W_TIME_BEGIN'
        Title.Alignment = taCenter
        Title.Caption = #1042#1088#1077#1084#1103' '#1085#1072#1095'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'W_TIME_END'
        Title.Alignment = taCenter
        Title.Caption = #1042#1088#1077#1084#1103' '#1082#1086#1085'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORG_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIO'
        Title.Alignment = taCenter
        Title.Caption = #1042#1086#1076#1080#1090#1077#1083#1100
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARNUM'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1084#1072#1096#1080#1085#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'T_NUM'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1094#1080#1089#1090#1077#1088#1085#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Visible = True
      end>
  end
  object qOperator: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT w.*, org.org_name, (SELECT fio FROM get_fio(d.d_name, d.d' +
        '_secname, d.d_thname)) AS fio,'
      
        '       (c.c_num1|| '#39'-'#39' || CAST(c.c_num2 AS VARCHAR(3))) AS carnu' +
        'm,'
      '       t.t_num'
      'FROM WASH w'
      'LEFT JOIN ORGANIZATION org ON (org.org_id = w.org_id)'
      'LEFT JOIN DRIVER d ON (d.d_id = w.d_id)'
      'LEFT JOIN CAR c ON (c.c_id = w.c_id)'
      'LEFT JOIN TANK t ON (t.t_id = w.t_id)'
      'WHERE w.op_id = :op_id AND w.ws_id = :ws_id')
    SQLConnection = data.connection
    Left = 72
    Top = 128
  end
  object prvOperator: TDataSetProvider
    DataSet = qOperator
    Left = 128
    Top = 128
  end
  object cdsOperator: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'op_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ws_id'
        ParamType = ptInput
      end>
    ProviderName = 'prvOperator'
    Left = 192
    Top = 128
    object cdsOperatorORG_NAME: TStringField
      FieldName = 'ORG_NAME'
      Size = 512
    end
    object cdsOperatorFIO: TStringField
      FieldName = 'FIO'
      Size = 256
    end
    object cdsOperatorCARNUM: TStringField
      FieldName = 'CARNUM'
      Size = 19
    end
    object cdsOperatorT_NUM: TStringField
      FieldName = 'T_NUM'
      Size = 16
    end
    object cdsOperatorW_ID: TIntegerField
      FieldName = 'W_ID'
    end
    object cdsOperatorOP_ID: TIntegerField
      FieldName = 'OP_ID'
    end
    object cdsOperatorWS_ID: TIntegerField
      FieldName = 'WS_ID'
    end
    object cdsOperatorORG_ID: TIntegerField
      FieldName = 'ORG_ID'
    end
    object cdsOperatorC_ID: TIntegerField
      FieldName = 'C_ID'
    end
    object cdsOperatorD_ID: TIntegerField
      FieldName = 'D_ID'
    end
    object cdsOperatorT_ID: TIntegerField
      FieldName = 'T_ID'
    end
    object cdsOperatorW_SUMM: TFloatField
      FieldName = 'W_SUMM'
    end
    object cdsOperatorW_DATE: TSQLTimeStampField
      FieldName = 'W_DATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object cdsOperatorW_TIME_BEGIN: TSQLTimeStampField
      FieldName = 'W_TIME_BEGIN'
      DisplayFormat = 'hh:nn'
    end
    object cdsOperatorW_TIME_END: TSQLTimeStampField
      FieldName = 'W_TIME_END'
      DisplayFormat = 'hh:nn'
    end
  end
  object dsOperator: TDataSource
    DataSet = cdsOperator
    Left = 256
    Top = 128
  end
end
