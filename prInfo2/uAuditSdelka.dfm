object frmSdelkaHistory: TfrmSdelkaHistory
  Left = 1073
  Top = 483
  Width = 847
  Height = 517
  Caption = #1040#1091#1076#1080#1090' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103' '#1086#1073#1100#1103#1074#1083#1077#1085#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 831
    Height = 479
    Align = alClient
    DataSource = dsAuditSdelka
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'US_NAME'
        Title.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHANGE_DATE'
        Title.Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SD_STATE'
        Title.Caption = #1053#1086#1074#1099#1081' '#1089#1090#1072#1090#1091#1089
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AS_ID'
        Title.Caption = #1053#1086#1074#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103
        Width = 200
        Visible = True
      end>
  end
  object dsAuditSdelka: TDataSource
    DataSet = cdsAuditSdelka
    Left = 136
    Top = 176
  end
  object cdsAuditSdelka: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAuditSdelka'
    Left = 104
    Top = 176
    object cdsAuditSdelkaUS_NAME: TIBStringField
      FieldName = 'US_NAME'
      Size = 128
    end
    object cdsAuditSdelkaCHANGE_DATE: TSQLTimeStampField
      FieldName = 'CHANGE_DATE'
    end
    object cdsAuditSdelkaSD_STATE: TIBStringField
      FieldName = 'SD_STATE'
      Size = 64
    end
    object cdsAuditSdelkaAS_ID: TIBStringField
      FieldName = 'AS_ID'
      Size = 25
    end
  end
  object qAuditSdelka: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'sd_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ag_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select'
      
        '    (select u.us_name from usr u where u.us_id = scl.us_id) as u' +
        's_name,'
      '    scl.change_date,'
      
        '    (select ss.sds_name from sdelka_state ss where ss.sds_id = s' +
        'cl.sd_state) as sd_state,'
      '    cast(case when scl.as_id = 0 then '#39#1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1085#1072#1103#39
      '    else '#39#1053#1077' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1085#1072#1103#39
      '    end as varchar(25)) as as_id'
      'from sdelka_change_log scl'
      'where scl.sd_id = :sd_id and'
      '      scl.ag_id = :ag_id'
      'order by scl.change_date')
    SQLConnection = data.connection
    Left = 40
    Top = 176
    object qAuditSdelkaUS_NAME: TIBStringField
      FieldName = 'US_NAME'
      Size = 128
    end
    object qAuditSdelkaCHANGE_DATE: TSQLTimeStampField
      FieldName = 'CHANGE_DATE'
    end
    object qAuditSdelkaSD_STATE: TIBStringField
      FieldName = 'SD_STATE'
      Size = 64
    end
    object qAuditSdelkaAS_ID: TIBStringField
      FieldName = 'AS_ID'
      Size = 25
    end
  end
  object prvAuditSdelka: TDataSetProvider
    DataSet = qAuditSdelka
    Left = 72
    Top = 176
  end
end
