object frameObjavlenie: TframeObjavlenie
  Left = 0
  Top = 0
  Width = 777
  Height = 565
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 492
    Width = 777
    Height = 73
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      777
      73)
    object Shape3: TShape
      Left = 127
      Top = 4
      Width = 1
      Height = 29
      Anchors = [akLeft, akBottom]
      Pen.Color = clBtnShadow
    end
    object Label1: TLabel
      Left = 135
      Top = 12
      Width = 42
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1056#1091#1073#1088#1080#1082#1072
    end
    object Label2: TLabel
      Left = 8
      Top = 12
      Width = 38
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1060#1086#1088#1084#1072#1090
    end
    object Label3: TLabel
      Left = 323
      Top = 12
      Width = 40
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1050#1086#1087#1080#1103' '#1074
    end
    object Shape1: TShape
      Left = 314
      Top = 4
      Width = 1
      Height = 29
      Anchors = [akLeft, akBottom]
      Pen.Color = clBtnShadow
    end
    object Shape2: TShape
      Left = 8
      Top = 36
      Width = 762
      Height = 1
      Anchors = [akLeft, akRight, akBottom]
      Pen.Color = clBtnShadow
    end
    object Label4: TLabel
      Left = 192
      Top = 48
      Width = 67
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    end
    object Shape4: TShape
      Left = 558
      Top = 4
      Width = 1
      Height = 29
      Anchors = [akRight, akBottom]
      Pen.Color = clBtnShadow
    end
    object Label5: TLabel
      Left = 7
      Top = 48
      Width = 85
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1074#1072#1082#1072#1085#1089#1080#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnChangeMdl: TSpeedButton
      Left = 563
      Top = 8
      Width = 100
      Height = 22
      Anchors = [akRight, akBottom]
      Caption = #1055#1086#1084#1077#1085#1103#1090#1100' '#1084#1086#1076#1091#1083#1100
      Flat = True
      OnClick = btnChangeMdlClick
    end
    object Shape5: TShape
      Left = 179
      Top = 39
      Width = 1
      Height = 29
      Anchors = [akLeft, akBottom]
      Pen.Color = clBtnShadow
      Visible = False
    end
    object btMdlText: TSpeedButton
      Left = 668
      Top = 8
      Width = 100
      Height = 22
      Caption = #1058#1077#1082#1089#1090' '#1084#1086#1076#1091#1083#1103
      Flat = True
      OnClick = btMdlTextClick
    end
    object cbObjavlenieRubrika: TDBLookupComboboxEh
      Left = 182
      Top = 9
      Width = 126
      Height = 19
      AlwaysShowBorder = True
      Anchors = [akLeft, akBottom]
      DataField = 'RB_ID'
      DataSource = dsObjavlenie
      EditButtons = <>
      Flat = True
      KeyField = 'RB_ID'
      ListField = 'RB_NAME_SHORT'
      ListSource = dsObjavRubrika
      TabOrder = 1
      Visible = True
      OnChange = cbObjavlenieRubrikaChange
      OnEnter = cbObjavlenieFormatEnter
    end
    object cbObjavlenieFormat: TDBLookupComboboxEh
      Left = 51
      Top = 9
      Width = 70
      Height = 19
      AlwaysShowBorder = True
      Anchors = [akLeft, akBottom]
      DataField = 'FM_ID'
      DataSource = dsObjavlenie
      EditButtons = <>
      Flat = True
      KeyField = 'FM_ID'
      ListField = 'FM_NAME'
      ListSource = dsObjavFormat
      TabOrder = 0
      Visible = True
      OnChange = cbObjavlenieFormatChange
      OnEnter = cbObjavlenieFormatEnter
    end
    object cbObjavlenieDoubleRubrika: TDBLookupComboboxEh
      Left = 368
      Top = 9
      Width = 185
      Height = 19
      AlwaysShowBorder = True
      Anchors = [akLeft, akRight, akBottom]
      DataField = 'DOUBLE_RB_ID'
      DataSource = dsObjavlenie
      EditButtons = <>
      Flat = True
      KeyField = 'RB_ID'
      ListField = 'RB_NAME_SHORT'
      ListSource = dsObjavRubrikaCopy
      TabOrder = 2
      Visible = True
      OnEnter = cbObjavlenieFormatEnter
    end
    object edObjavlenieComment: TDBEditEh
      Left = 264
      Top = 45
      Width = 341
      Height = 19
      AlwaysShowBorder = True
      DataField = 'OBJAV_COMMENT'
      DataSource = dsObjavlenie
      EditButtons = <>
      Flat = True
      TabOrder = 4
      Visible = True
    end
    object cbObjavlenieAttention: TDBCheckBoxEh
      Left = 611
      Top = 46
      Width = 157
      Height = 17
      AlwaysShowBorder = True
      Caption = #1042#1085#1080#1084#1072#1085#1080#1077' '#1074#1099#1087#1091#1089#1082'. '#1086#1090#1076#1077#1083#1091'!'
      DataField = 'OBJAV_HAS_ATTENTION'
      DataSource = dsObjavlenie
      Flat = True
      TabOrder = 5
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object edObjavlenieVacCount: TDBNumberEditEh
      Left = 99
      Top = 45
      Width = 78
      Height = 19
      AlwaysShowBorder = True
      DataField = 'VAC_COUNT'
      DataSource = dsObjavlenie
      EditButtons = <
        item
          Style = ebsUpDownEh
        end>
      Flat = True
      MaxValue = 99.000000000000000000
      TabOrder = 3
      Visible = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 777
    Height = 492
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 7
    TabOrder = 1
    inline frameContent: TframeContent
      Left = 9
      Top = 9
      Width = 759
      Height = 474
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inherited PageControl1: TPageControl
        Width = 759
        Height = 474
        inherited tabPicture: TTabSheet
          inherited Panel5: TPanel
            Width = 427
            Height = 464
            inherited ScrollBox1: TScrollBox
              Width = 427
              Height = 365
              inherited img: TImage
                Width = 423
                Height = 361
              end
              inherited shpHider1: TShape
                Width = 423
                Height = 361
              end
            end
            inherited Panel1: TPanel
              Top = 365
              Width = 427
              DesignSize = (
                427
                31)
              inherited shpHider2: TShape
                Width = 425
              end
              inherited cbScale: TDBCheckBoxEh
                OnClick = frameContentcbScaleClick
              end
              inherited btSave: TBitBtn
                Left = 178
                OnClick = frameContentbtSaveClick
              end
              inherited btPrint: TBitBtn
                Left = 314
                OnClick = frameContentbtPrintClick
              end
            end
            inherited Panel2: TPanel
              Top = 396
              Width = 427
              DesignSize = (
                427
                68)
              inherited Shape1: TShape
                Width = 894
              end
              inherited shpHider3: TShape
                Width = 427
              end
              inherited DBEditEh1: TDBEditEh
                Width = 326
              end
              inherited DBLookupComboboxEh1: TDBLookupComboboxEh
                Width = 166
              end
            end
          end
          inherited Panel4: TPanel
            Left = 427
            Height = 464
            inherited Panel3: TPanel
              inherited btAddSiteObjav: TBitBtn
                OnClick = frameContentbtAddSiteObjavClick
              end
              inherited btDeleteSiteObjav: TBitBtn
                OnClick = frameContentbtDeleteSiteObjavClick
              end
            end
            inherited DBGridEh1: TDBGridEh
              Height = 408
            end
            inherited Panel6: TPanel
              Top = 433
            end
          end
        end
      end
      inherited SimpleDataSet1: TSimpleDataSet
        Left = 264
        Top = 216
      end
      inherited popCopy: TPopupMenu
        inherited N1: TMenuItem
          OnClick = frameContentN1Click
        end
      end
      inherited spCopySiteObjav: TSQLStoredProc
        Left = 124
        Top = 313
      end
    end
  end
  object qryObjavlenie: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'OBJAV_ID'
        ParamType = ptUnknown
        Value = 0
      end>
    SQL.Strings = (
      'select'
      #9'  obj.*'
      #9', iss.IS_NAME_COMPOSED'
      '                ,sd.sd_num'
      #9', sd.SD_ID_COMPOUND'
      #9', cu.CU_NAME'
      #9', ag.AG_NAME'
      #9', sd.GZ_ID'
      'from'
      #9'OBJAVLENIE obj'
      ''
      #9'left join PODACHA pd'
      #9'on (pd.PD_ID = obj.PD_ID)'
      ''
      #9'left join ISSUE iss'
      #9'on (pd.IS_ID = iss.IS_ID)'
      ''
      #9'left join SDELKA sd'
      #9'on (sd.AG_ID = pd.AG_ID and sd.SD_ID = pd.SD_ID)'
      ''
      #9'left join CUST cu'
      #9'on (cu.AG_ID = sd.AG_ID and cu.CU_ID = sd.CU_ID)'
      ''
      #9'left join AGENT ag'
      #9'on (ag.AG_ID = sd.AG_ID)'
      'where'
      #9'obj.OBJAV_ID = :OBJAV_ID'
      '')
    SQLConnection = data.connection
    Left = 172
    Top = 224
    object qryObjavlenieOBJAV_ID: TIntegerField
      FieldName = 'OBJAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryObjavleniePD_ID: TIntegerField
      FieldName = 'PD_ID'
      Required = True
    end
    object qryObjavlenieCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
    end
    object qryObjavlenieRB_ID: TIntegerField
      FieldName = 'RB_ID'
      Required = True
    end
    object qryObjavlenieFM_ID: TIntegerField
      FieldName = 'FM_ID'
      Required = True
    end
    object qryObjavlenieDOUBLE_RB_ID: TIntegerField
      FieldName = 'DOUBLE_RB_ID'
    end
    object qryObjavlenieSAME_CODE: TIntegerField
      FieldName = 'SAME_CODE'
      ProviderFlags = []
    end
    object qryObjavlenieIS_NAME_COMPOSED: TStringField
      FieldName = 'IS_NAME_COMPOSED'
      ProviderFlags = []
      Size = 25
    end
    object qryObjavlenieSD_ID_COMPOUND: TStringField
      FieldName = 'SD_ID_COMPOUND'
      ProviderFlags = []
      Size = 23
    end
    object qryObjavlenieCU_NAME: TStringField
      FieldName = 'CU_NAME'
      ProviderFlags = []
      Size = 128
    end
    object qryObjavlenieAG_NAME: TStringField
      FieldName = 'AG_NAME'
      ProviderFlags = []
      Size = 128
    end
    object qryObjavlenieOBJAV_COMMENT: TStringField
      FieldName = 'OBJAV_COMMENT'
      Size = 255
    end
    object qryObjavlenieOBJAV_HAS_ATTENTION: TSmallintField
      FieldName = 'OBJAV_HAS_ATTENTION'
    end
    object qryObjavleniePICTURE_TO_INET: TSmallintField
      FieldName = 'PICTURE_TO_INET'
    end
    object qryObjavlenieGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object qryObjavlenieVAC_COUNT: TSmallintField
      FieldName = 'VAC_COUNT'
      Required = True
    end
    object qryObjavlenieDISTRICT_ID: TIntegerField
      FieldName = 'DISTRICT_ID'
    end
    object qryObjavlenieSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 255
    end
    object qryObjavlenieMDL_TEXT: TStringField
      FieldName = 'MDL_TEXT'
      Size = 2047
    end
  end
  object prvObjavlenie: TDataSetProvider
    DataSet = qryObjavlenie
    BeforeUpdateRecord = prvObjavlenieBeforeUpdateRecord
    Left = 204
    Top = 224
  end
  object cdsObjavlenie: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'OBJAV_ID'
        ParamType = ptUnknown
        Value = 0
      end>
    ProviderName = 'prvObjavlenie'
    Left = 236
    Top = 224
    object cdsObjavlenieOBJAV_ID: TIntegerField
      FieldName = 'OBJAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsObjavleniePD_ID: TIntegerField
      FieldName = 'PD_ID'
      Required = True
    end
    object cdsObjavlenieCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
    end
    object cdsObjavlenieRB_ID: TIntegerField
      FieldName = 'RB_ID'
      Required = True
    end
    object cdsObjavlenieFM_ID: TIntegerField
      FieldName = 'FM_ID'
      Required = True
    end
    object cdsObjavlenieDOUBLE_RB_ID: TIntegerField
      FieldName = 'DOUBLE_RB_ID'
    end
    object cdsObjavlenieSAME_CODE: TIntegerField
      FieldName = 'SAME_CODE'
      ProviderFlags = []
    end
    object cdsObjavlenieIS_NAME_COMPOSED: TStringField
      FieldName = 'IS_NAME_COMPOSED'
      ProviderFlags = []
      Size = 25
    end
    object cdsObjavlenieSD_ID_COMPOUND: TStringField
      FieldName = 'SD_ID_COMPOUND'
      ProviderFlags = []
      Size = 23
    end
    object cdsObjavlenieCU_NAME: TStringField
      FieldName = 'CU_NAME'
      ProviderFlags = []
      Size = 128
    end
    object cdsObjavlenieAG_NAME: TStringField
      FieldName = 'AG_NAME'
      ProviderFlags = []
      Size = 128
    end
    object cdsObjavlenieOBJAV_COMMENT: TStringField
      FieldName = 'OBJAV_COMMENT'
      Size = 255
    end
    object cdsObjavlenieOBJAV_HAS_ATTENTION: TSmallintField
      FieldName = 'OBJAV_HAS_ATTENTION'
    end
    object cdsObjavleniePICTURE_TO_INET: TSmallintField
      DefaultExpression = '0'
      FieldName = 'PICTURE_TO_INET'
    end
    object cdsObjavlenieGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object cdsObjavlenieVAC_COUNT: TSmallintField
      DefaultExpression = '1'
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1074#1072#1082#1072#1085#1089#1080#1081
      FieldName = 'VAC_COUNT'
      Required = True
    end
    object cdsObjavlenieDISTRICT_ID: TIntegerField
      FieldName = 'DISTRICT_ID'
    end
    object cdsObjavlenieSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 255
    end
    object cdsObjavlenieMDL_TEXT: TStringField
      FieldName = 'MDL_TEXT'
      Size = 2047
    end
  end
  object dsObjavlenie: TDataSource
    DataSet = cdsObjavlenie
    Left = 312
    Top = 224
  end
  object cdsObjavFormat: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvObjavFormat'
    ReadOnly = True
    Left = 144
    Top = 280
    object cdsObjavFormatFM_ID: TIntegerField
      FieldName = 'FM_ID'
      Required = True
    end
    object cdsObjavFormatFM_NAME: TStringField
      FieldName = 'FM_NAME'
      Required = True
      Size = 128
    end
    object cdsObjavFormatFM_SPACE: TFloatField
      FieldName = 'FM_SPACE'
    end
    object cdsObjavFormatFM_ALWAYS_ADD_SUM: TSmallintField
      FieldName = 'FM_ALWAYS_ADD_SUM'
    end
    object cdsObjavFormatFM_HAS_PICTURE: TSmallintField
      FieldName = 'FM_HAS_PICTURE'
      Required = True
    end
    object cdsObjavFormatFM_PICTURE_SIZES: TStringField
      FieldName = 'FM_PICTURE_SIZES'
      Size = 128
    end
  end
  object dsObjavFormat: TDataSource
    DataSet = cdsObjavFormat
    Left = 176
    Top = 280
  end
  object spObjavlenieUpdate: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'OBJAV_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CONTENT_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'RB_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FM_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'VAC_COUNT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DOUBLE_RB_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'OBJAV_COMMENT'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'OBJAV_HAS_ATTENTION'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'PICTURE_TO_INET'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'DISTRICT_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MDL_TEXT'
        ParamType = ptInput
      end>
    SQLConnection = data.connection
    StoredProcName = 'OBJAVLENIE_UPDATE'
    Left = 168
    Top = 24
  end
  object tblObjavRubrika: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 501
    Top = 176
    object tblObjavRubrikaRB_ID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'RB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tblObjavRubrikaRB_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'RB_NAME'
      Required = True
      Size = 128
    end
    object tblObjavRubrikaRB_NAME_SHORT: TStringField
      DisplayLabel = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
      FieldName = 'RB_NAME_SHORT'
      Required = True
      Size = 64
    end
    object tblObjavRubrikaRB_COST_COEFF: TFloatField
      DisplayLabel = #1062#1077#1085#1086#1074#1086#1081' '#1082#1086#1101#1092#1080#1094#1080#1077#1085#1090
      FieldName = 'RB_COST_COEFF'
      DisplayFormat = '0.###'
    end
    object tblObjavRubrikaRB_IS_OBLOGKA: TSmallintField
      DisplayLabel = #1054#1073#1083#1086#1078#1082#1072
      FieldName = 'RB_IS_OBLOGKA'
      Required = True
    end
    object tblObjavRubrikaGZ_ID: TIntegerField
      FieldName = 'GZ_ID'
      Required = True
    end
    object tblObjavRubrikaRB_IS_LOCKABLE: TSmallintField
      FieldName = 'RB_IS_LOCKABLE'
      Required = True
    end
  end
  object dsObjavRubrika: TDataSource
    DataSet = tblObjavRubrika
    Left = 613
    Top = 176
  end
  object dsObjavRubrikaCopy: TDataSource
    DataSet = tblObjavRubrikaCopy
    Left = 613
    Top = 240
  end
  object tblObjavRubrikaCopy: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 501
    Top = 240
    object IntegerField1: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'RB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object StringField1: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'RB_NAME'
      Required = True
      Size = 128
    end
    object StringField2: TStringField
      DisplayLabel = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
      FieldName = 'RB_NAME_SHORT'
      Required = True
      Size = 64
    end
    object FloatField1: TFloatField
      DisplayLabel = #1062#1077#1085#1086#1074#1086#1081' '#1082#1086#1101#1092#1080#1094#1080#1077#1085#1090
      FieldName = 'RB_COST_COEFF'
      DisplayFormat = '0.###'
    end
    object SmallintField1: TSmallintField
      DisplayLabel = #1054#1073#1083#1086#1078#1082#1072
      FieldName = 'RB_IS_OBLOGKA'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'GZ_ID'
      Required = True
    end
    object tblObjavRubrikaCopyRB_IS_HOT: TSmallintField
      FieldName = 'RB_IS_HOT'
    end
    object tblObjavRubrikaCopyRB_IS_LOCKABLE: TSmallintField
      FieldName = 'RB_IS_LOCKABLE'
      Required = True
    end
  end
  object qInfInt: TSQLQuery
    Params = <>
    Left = 168
    Top = 320
  end
  object prvObjavFormat: TDataSetProvider
    DataSet = qObjavFormat
    Left = 112
    Top = 280
  end
  object qObjavFormat: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM FORMAT f '
      'LEFT JOIN format_cost fc ON (f.fm_id = fc.fm_id) '
      'WHERE fc.gz_id = :gz_id'
      'AND f.FM_HAS_PICTURE=1'
      'ORDER BY ORDERBY')
    SQLConnection = data.connection
    Left = 80
    Top = 280
    object qObjavFormatFM_ID: TIntegerField
      FieldName = 'FM_ID'
      Required = True
    end
    object qObjavFormatFM_NAME: TStringField
      FieldName = 'FM_NAME'
      Required = True
      Size = 128
    end
    object qObjavFormatFM_SPACE: TFloatField
      FieldName = 'FM_SPACE'
    end
    object qObjavFormatFM_ALWAYS_ADD_SUM: TSmallintField
      FieldName = 'FM_ALWAYS_ADD_SUM'
    end
    object qObjavFormatFM_HAS_PICTURE: TSmallintField
      FieldName = 'FM_HAS_PICTURE'
      Required = True
    end
    object qObjavFormatFM_PICTURE_SIZES: TStringField
      FieldName = 'FM_PICTURE_SIZES'
      Size = 128
    end
  end
  object qObjavlenieInsert: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'pd_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'content_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rb_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fm_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'vac_count'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'double_rb_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBJAV_COMMENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OBJAV_HAS_ATTENTION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PICTURE_TO_INET'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISTRICT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MDL_TEXT'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select same_code'
      
        'from OBJAVLENIE_INSERT(:PD_ID, :CONTENT_ID, :RB_ID, :FM_ID, :VAC' +
        '_COUNT, :DOUBLE_RB_ID, :OBJAV_COMMENT, :OBJAV_HAS_ATTENTION, :PI' +
        'CTURE_TO_INET, :DISTRICT_ID, :MDL_TEXT)')
    SQLConnection = data.connection
    Left = 64
    Top = 24
  end
end
