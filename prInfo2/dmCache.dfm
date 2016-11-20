object cacheData: TcacheData
  OldCreateOrder = False
  Left = 1209
  Top = 411
  Height = 360
  Width = 408
  object qryRubrika: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select r.*'
      'from RUBRIKA r'
      'WHERE r.deleted = 0'
      'order by r.RB_NAME_SHORT')
    SQLConnection = data.connection
    Left = 40
    Top = 8
    object qryRubrikaRB_ID: TIntegerField
      FieldName = 'RB_ID'
      Required = True
    end
    object qryRubrikaRB_NAME: TStringField
      FieldName = 'RB_NAME'
      Required = True
      Size = 128
    end
    object qryRubrikaRB_NAME_SHORT: TStringField
      FieldName = 'RB_NAME_SHORT'
      Required = True
      Size = 64
    end
    object qryRubrikaRB_COST_COEFF: TFloatField
      FieldName = 'RB_COST_COEFF'
      Required = True
    end
    object qryRubrikaRB_IS_OBLOGKA: TSmallintField
      FieldName = 'RB_IS_OBLOGKA'
      Required = True
    end
    object qryRubrikaGZ_ID: TIntegerField
      FieldName = 'GZ_ID'
      Required = True
    end
    object qryRubrikaRB_IS_HOT: TSmallintField
      FieldName = 'RB_IS_HOT'
    end
    object qryRubrikaRB_IS_LOCKABLE: TSmallintField
      FieldName = 'RB_IS_LOCKABLE'
      Required = True
    end
  end
  object prvRubrika: TDataSetProvider
    DataSet = qryRubrika
    Left = 144
    Top = 8
  end
  object cdsRubrika: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRubrika'
    Left = 248
    Top = 8
    object cdsRubrikaRB_ID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'RB_ID'
      Required = True
    end
    object cdsRubrikaRB_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'RB_NAME'
      Required = True
      Size = 128
    end
    object cdsRubrikaRB_NAME_SHORT: TStringField
      FieldName = 'RB_NAME_SHORT'
      Required = True
      Size = 64
    end
    object cdsRubrikaRB_COST_COEFF: TFloatField
      DisplayLabel = #1062#1077#1085#1086#1074#1086#1081' '#1082#1086#1101#1092#1080#1094#1080#1077#1085#1090
      FieldName = 'RB_COST_COEFF'
      Required = True
      DisplayFormat = '0.###'
    end
    object cdsRubrikaRB_IS_OBLOGKA: TSmallintField
      DisplayLabel = #1054#1073#1083#1086#1078#1082#1072
      FieldName = 'RB_IS_OBLOGKA'
      Required = True
    end
    object cdsRubrikaGZ_ID: TIntegerField
      FieldName = 'GZ_ID'
      Required = True
    end
    object cdsRubrikaRB_IS_HOT: TSmallintField
      DisplayLabel = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
      FieldName = 'RB_IS_HOT'
    end
    object cdsRubrikaRB_IS_LOCKABLE: TSmallintField
      FieldName = 'RB_IS_LOCKABLE'
      Required = True
    end
  end
  object qryRubrikaSite: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select r.*'
      'from RUBRIKA_SITE r'
      'where r.deleted = 0'
      'order by r.RS_NAME')
    SQLConnection = data.connection
    Left = 40
    Top = 56
    object qryRubrikaSiteRS_ID: TIntegerField
      FieldName = 'RS_ID'
      Required = True
    end
    object qryRubrikaSiteRS_NAME: TStringField
      FieldName = 'RS_NAME'
      Required = True
      Size = 128
    end
  end
  object prvRubrikaSite: TDataSetProvider
    DataSet = qryRubrikaSite
    Left = 144
    Top = 56
  end
  object cdsRubrikaSite: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRubrikaSite'
    Left = 248
    Top = 56
    object cdsRubrikaSiteRS_ID: TIntegerField
      FieldName = 'RS_ID'
      Required = True
    end
    object cdsRubrikaSiteRS_NAME: TStringField
      FieldName = 'RS_NAME'
      Required = True
      Size = 128
    end
  end
  object qryRubrikaPohozha: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select r.*'
      'from RUBRIKA_POHOZHA r')
    SQLConnection = data.connection
    Left = 40
    Top = 104
    object qryRubrikaPohozhaRS_ID: TIntegerField
      DisplayLabel = 'ID '#1088#1091#1073#1088#1080#1082#1080' '#1085#1072' '#1089#1072#1081#1090#1077
      FieldName = 'RS_ID'
      Required = True
    end
    object qryRubrikaPohozhaRB_ID: TIntegerField
      DisplayLabel = 'ID '#1088#1091#1073#1088#1080#1082#1080' '#1074' '#1075#1072#1079#1077#1090#1077
      FieldName = 'RB_ID'
      Required = True
    end
  end
  object prvRubrikaPohozha: TDataSetProvider
    DataSet = qryRubrikaPohozha
    Left = 144
    Top = 104
  end
  object cdsRubrikaPohozha: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRubrikaPohozha'
    Left = 248
    Top = 104
    object cdsRubrikaPohozhaRS_ID: TIntegerField
      FieldName = 'RS_ID'
      Required = True
    end
    object cdsRubrikaPohozhaRB_ID: TIntegerField
      FieldName = 'RB_ID'
      Required = True
    end
    object cdsRubrikaPohozhaRS_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'RS_NAME'
      LookupDataSet = cdsRubrikaSite
      LookupKeyFields = 'RS_ID'
      LookupResultField = 'RS_NAME'
      KeyFields = 'RS_ID'
      Lookup = True
    end
  end
  object qryFormat: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select f.*'
      'from FORMAT f')
    SQLConnection = data.connection
    Left = 40
    Top = 152
    object qryFormatFM_ID: TIntegerField
      FieldName = 'FM_ID'
      Required = True
    end
    object qryFormatFM_NAME: TStringField
      FieldName = 'FM_NAME'
      Required = True
      Size = 128
    end
    object qryFormatFM_SPACE: TFloatField
      FieldName = 'FM_SPACE'
    end
    object qryFormatFM_ALWAYS_ADD_SUM: TSmallintField
      FieldName = 'FM_ALWAYS_ADD_SUM'
    end
    object qryFormatFM_HAS_PICTURE: TSmallintField
      FieldName = 'FM_HAS_PICTURE'
      Required = True
    end
    object qryFormatFM_PICTURE_SIZES: TStringField
      FieldName = 'FM_PICTURE_SIZES'
      Size = 128
    end
  end
  object prvFormat: TDataSetProvider
    DataSet = qryFormat
    Left = 144
    Top = 152
  end
  object cdsFormat: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvFormat'
    Left = 248
    Top = 152
    object cdsFormatFM_ID: TIntegerField
      FieldName = 'FM_ID'
      Required = True
    end
    object cdsFormatFM_NAME: TStringField
      FieldName = 'FM_NAME'
      Required = True
      Size = 128
    end
    object cdsFormatFM_SPACE: TFloatField
      FieldName = 'FM_SPACE'
    end
    object cdsFormatFM_ALWAYS_ADD_SUM: TSmallintField
      FieldName = 'FM_ALWAYS_ADD_SUM'
    end
    object cdsFormatFM_HAS_PICTURE: TSmallintField
      FieldName = 'FM_HAS_PICTURE'
      Required = True
    end
    object cdsFormatFM_PICTURE_SIZES: TStringField
      FieldName = 'FM_PICTURE_SIZES'
      Size = 128
    end
  end
  object rvpRepAcc: TRvProject
    Engine = rvsRepAcc
    Left = 80
    Top = 202
  end
  object rvsRepAcc: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 32
    Top = 202
  end
end
