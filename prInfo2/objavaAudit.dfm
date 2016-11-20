object frmObjavaAudit: TfrmObjavaAudit
  Left = 298
  Top = 115
  Width = 683
  Height = 540
  Caption = #1040#1091#1076#1080#1090' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object grObjavaAudit: TDBGridEh
    Left = 0
    Top = 0
    Width = 667
    Height = 502
    Align = alClient
    DataSource = dsObjavAudit
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    RowLines = 4
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'US_NAME'
        Footers = <>
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'CHANGE_DATE'
        Footers = <>
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'OS_NAME'
        Footers = <>
        Width = 83
      end
      item
        EditButtons = <>
        FieldName = 'RB_NAME'
        Footers = <>
        Width = 118
      end
      item
        EditButtons = <>
        FieldName = 'NEW_TEXT'
        Footers = <>
        Width = 230
      end>
  end
  object qryObjavAudit: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'OB_ID'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'select'
      #9'  u.US_NAME'
      #9', l.CHANGE_DATE'
      #9', s.OS_NAME'
      #9', l.NEW_TEXT'
      #9', r.RB_NAME'
      'from'
      #9'OBJAV_CHANGE_LOG l'
      ''
      #9'left join USR u'
      #9'on (u.US_ID = l.US_ID)'
      ''
      #9'left join OBJAV_STATE s'
      #9'on (s.OS_ID = l.NEW_STATE_ID)'
      ''
      #9'left join RUBRIKA r'
      #9'on (r.RB_ID = l.NEW_RB_ID)'
      'where'
      #9#9'l.AG_ID = :AG_ID'
      #9'and l.OB_ID = :OB_ID'
      'order by'
      #9'l.CHANGE_DATE')
    SQLConnection = data.connection
    Left = 176
    Top = 72
  end
  object cdsObjavAudit: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'OB_ID'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'prvObjavAudit'
    ReadOnly = True
    Left = 336
    Top = 72
    object cdsObjavAuditUS_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      DisplayWidth = 24
      FieldName = 'US_NAME'
      Size = 128
    end
    object cdsObjavAuditCHANGE_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 15
      FieldName = 'CHANGE_DATE'
      Required = True
    end
    object cdsObjavAuditOS_NAME: TStringField
      DisplayLabel = #1053#1086#1074#1099#1081' '#1089#1090#1072#1090#1091#1089
      DisplayWidth = 15
      FieldName = 'OS_NAME'
      Size = 64
    end
    object cdsObjavAuditRB_NAME: TStringField
      DisplayLabel = #1053#1086#1074#1072#1103' '#1088#1091#1073#1088#1080#1082#1072
      DisplayWidth = 26
      FieldName = 'RB_NAME'
      Size = 128
    end
    object cdsObjavAuditNEW_TEXT: TStringField
      DisplayLabel = #1053#1086#1074#1099#1081' '#1090#1077#1082#1089#1090
      DisplayWidth = 28
      FieldName = 'NEW_TEXT'
      Size = 2047
    end
  end
  object prvObjavAudit: TDataSetProvider
    DataSet = qryObjavAudit
    Options = [poReadOnly]
    Left = 256
    Top = 72
  end
  object dsObjavAudit: TDataSource
    DataSet = cdsObjavAudit
    Left = 408
    Top = 72
  end
end
