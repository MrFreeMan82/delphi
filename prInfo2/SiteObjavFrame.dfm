object frameSiteObjav: TframeSiteObjav
  Left = 0
  Top = 0
  Width = 471
  Height = 212
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 179
    Width = 471
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 10
      Width = 42
      Height = 13
      Caption = #1056#1091#1073#1088#1080#1082#1072
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 60
      Top = 8
      Width = 209
      Height = 19
      AlwaysShowBorder = True
      DataField = 'RS_ID'
      DataSource = dsSiteObjav
      EditButtons = <>
      Flat = True
      KeyField = 'RS_ID'
      ListField = 'RS_NAME'
      ListSource = dsRubrikaSite
      TabOrder = 0
      Visible = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 471
    Height = 179
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 1
    object rchText: TDBRichEdit
      Left = 4
      Top = 4
      Width = 463
      Height = 171
      Align = alClient
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'SITE_OBJAV_TEXT'
      DataSource = dsSiteObjav
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      PlainText = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object qrySiteObjav: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'SITE_OBJAV_ID'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'SELECT'
      '    SO.*'
      'FROM'
      '    SITE_OBJAV SO'
      'WHERE'
      '    SO.SITE_OBJAV_ID = :SITE_OBJAV_ID')
    SQLConnection = data.connection
    Left = 80
    Top = 40
    object qrySiteObjavSITE_OBJAV_ID: TIntegerField
      FieldName = 'SITE_OBJAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySiteObjavRS_ID: TIntegerField
      FieldName = 'RS_ID'
      Required = True
    end
    object qrySiteObjavSITE_OBJAV_TEXT: TStringField
      FieldName = 'SITE_OBJAV_TEXT'
      Size = 2047
    end
  end
  object prvSiteObjav: TDataSetProvider
    DataSet = qrySiteObjav
    Left = 152
    Top = 40
  end
  object cdsSiteObjav: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'SITE_OBJAV_ID'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'prvSiteObjav'
    Left = 224
    Top = 40
    object cdsSiteObjavSITE_OBJAV_ID: TIntegerField
      FieldName = 'SITE_OBJAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSiteObjavRS_ID: TIntegerField
      FieldName = 'RS_ID'
      Required = True
    end
    object cdsSiteObjavSITE_OBJAV_TEXT: TStringField
      FieldName = 'SITE_OBJAV_TEXT'
      Size = 2047
    end
  end
  object dsSiteObjav: TDataSource
    DataSet = cdsSiteObjav
    Left = 296
    Top = 40
  end
  object cdsRubrikaSite: TClientDataSet
    Aggregates = <>
    Params = <>
    ReadOnly = True
    Left = 80
    Top = 104
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
  object dsRubrikaSite: TDataSource
    DataSet = cdsRubrikaSite
    Left = 152
    Top = 104
  end
  object spSiteObjavCopy: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'SITE_OBJAV_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NEW_SITE_OBJAV_ID'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = data.connection
    StoredProcName = 'SITE_OBJAV_COPY'
    Left = 296
    Top = 104
  end
end
