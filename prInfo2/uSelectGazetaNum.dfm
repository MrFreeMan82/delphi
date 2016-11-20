object frmSelectGZNum: TfrmSelectGZNum
  Left = 886
  Top = 227
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1085#1086#1084#1077#1088#1072
  ClientHeight = 418
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    290
    418)
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 8
    Top = 140
    Width = 37
    Height = 14
    Caption = #1053#1086#1084#1077#1088
  end
  object DBGrid1: TDBGrid
    Left = 6
    Top = 156
    Width = 274
    Height = 228
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsGZNum
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IS_NAME_COMPOSED'
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IS_DATE'
        Title.Caption = #1044#1072#1090#1072
        Width = 87
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 203
    Top = 387
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object rgGZ: TRadioGroup
    Left = 8
    Top = 8
    Width = 273
    Height = 129
    Caption = #1043#1072#1079#1077#1090#1072
    TabOrder = 2
    OnClick = rgGZClick
  end
  object qGZNum: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select * from issue i '
      'where ((i.is_id = 0) and (i.gz_id = :gz_id)) or'
      '      ((i.is_id = 1) and (i.gz_id = :gz_id)) or'
      '      ((i.is_id = 2) and (i.gz_id = :gz_id)) or'
      '      ((i.is_id = 3) and (i.gz_id = :gz_id)) or'
      '      ((i.is_id = 4) and (i.gz_id = :gz_id)) or'
      
        '      (i.gz_id = :gz_id and extract(year from i.is_date) >= extr' +
        'act(year from current_date)) order by i.is_date')
    SQLConnection = data.connection
    Left = 24
    Top = 232
  end
  object dsGZNum: TDataSource
    DataSet = cdsGZNum
    Left = 120
    Top = 232
  end
  object cdsGZNum: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvGZNum'
    Left = 88
    Top = 232
    object cdsGZNumIS_ID: TIntegerField
      FieldName = 'IS_ID'
    end
    object cdsGZNumIS_NAME_COMPOSED: TStringField
      FieldName = 'IS_NAME_COMPOSED'
      Size = 30
    end
    object cdsGZNumIS_DATE: TSQLTimeStampField
      FieldName = 'IS_DATE'
    end
  end
  object prvGZNum: TDataSetProvider
    DataSet = qGZNum
    Left = 56
    Top = 232
  end
  object qGZ: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT g.gz_name, g.gz_id FROM gazeta g WHERE g.gz_id > 0 ORDER ' +
        'BY g.gz_id')
    SQLConnection = data.connection
    Left = 24
    Top = 64
  end
  object dsGZ: TDataSource
    DataSet = cdsGZ
    Left = 120
    Top = 64
  end
  object prvGZ: TDataSetProvider
    DataSet = qGZ
    Left = 56
    Top = 64
  end
  object cdsGZ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvGZ'
    Left = 88
    Top = 64
    object cdsGZGZ_ID: TIntegerField
      FieldName = 'GZ_ID'
    end
    object cdsGZGZ_NAME: TStringField
      FieldName = 'GZ_NAME'
      Size = 64
    end
  end
end
