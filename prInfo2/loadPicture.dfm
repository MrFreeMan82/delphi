object frmLoadPicture: TfrmLoadPicture
  Left = 886
  Top = 216
  Width = 486
  Height = 585
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1092#1072#1081#1083#1072' '#1084#1086#1076#1091#1083#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pages: TPageControl
    Left = 0
    Top = 0
    Width = 470
    Height = 547
    ActivePage = tab1
    Align = alClient
    TabOrder = 0
    object tab1: TTabSheet
      Caption = 'tab1'
      TabVisible = False
      DesignSize = (
        462
        537)
      object Label2: TLabel
        Left = 4
        Top = 96
        Width = 54
        Height = 13
        Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072
      end
      object Label3: TLabel
        Left = 4
        Top = 52
        Width = 161
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1075#1072#1079#1077#1090#1099', '#1089#1090#1088#1072#1085#1080#1094#1072' '#1074' Corel'
      end
      object Label1: TLabel
        Left = 4
        Top = 8
        Width = 59
        Height = 13
        Caption = #1050#1086#1076' '#1089#1076#1077#1083#1082#1080
      end
      object edFileName: TDBEditEh
        Left = 8
        Top = 112
        Width = 453
        Height = 19
        AlwaysShowBorder = True
        Anchors = [akLeft, akTop, akRight]
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = edFileNameEditButtons0Click
          end>
        Flat = True
        TabOrder = 2
        Text = 'c:\module.tif'
        Visible = True
      end
      object edCorelPage: TDBEditEh
        Left = 8
        Top = 68
        Width = 453
        Height = 19
        AlwaysShowBorder = True
        Anchors = [akLeft, akTop, akRight]
        EditButtons = <>
        Flat = True
        TabOrder = 1
        Visible = True
      end
      object edSdelka: TDBEditEh
        Left = 8
        Top = 24
        Width = 453
        Height = 19
        AlwaysShowBorder = True
        Anchors = [akLeft, akTop, akRight]
        EditButtons = <>
        Flat = True
        TabOrder = 0
        Visible = True
      end
      object Button1: TButton
        Left = 386
        Top = 511
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1044#1072#1083#1077#1077' >>'
        Default = True
        TabOrder = 3
        OnClick = Button1Click
      end
    end
    object tab2: TTabSheet
      Caption = 'tab2'
      ImageIndex = 1
      TabVisible = False
      DesignSize = (
        462
        537)
      object Label5: TLabel
        Left = 4
        Top = 52
        Width = 30
        Height = 13
        Caption = #1040#1075#1077#1085#1090
      end
      object Label6: TLabel
        Left = 4
        Top = 8
        Width = 59
        Height = 13
        Caption = #1050#1086#1076' '#1089#1076#1077#1083#1082#1080
      end
      object Label4: TLabel
        Left = 4
        Top = 96
        Width = 37
        Height = 13
        Caption = #1050#1083#1080#1077#1085#1090
      end
      object Label7: TLabel
        Left = 4
        Top = 139
        Width = 38
        Height = 13
        Caption = #1055#1086#1076#1072#1095#1080
      end
      object Label8: TLabel
        Left = 4
        Top = 183
        Width = 63
        Height = 13
        Caption = #1054#1073#1098#1103#1074#1083#1077#1085#1080#1103
      end
      object Label9: TLabel
        Left = 4
        Top = 299
        Width = 109
        Height = 13
        Caption = #1052#1086#1076#1091#1083#1100' '#1076#1083#1103' '#1079#1072#1075#1088#1091#1079#1082#1080
      end
      object DBText1: TDBText
        Left = 208
        Top = 512
        Width = 65
        Height = 17
      end
      object edAgent: TDBEditEh
        Left = 8
        Top = 68
        Width = 457
        Height = 19
        TabStop = False
        AlwaysShowBorder = True
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        DataField = 'AG_NAME'
        DataSource = dsSdelka
        EditButtons = <>
        Flat = True
        ReadOnly = True
        TabOrder = 0
        Visible = True
      end
      object edSdelka2: TDBEditEh
        Left = 8
        Top = 24
        Width = 457
        Height = 19
        TabStop = False
        AlwaysShowBorder = True
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        DataField = 'SD_NUM'
        DataSource = dsSdelka
        EditButtons = <>
        Flat = True
        ReadOnly = True
        TabOrder = 1
        Visible = True
      end
      object Button2: TButton
        Left = 382
        Top = 511
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1054#1082
        Default = True
        TabOrder = 5
        OnClick = Button2Click
      end
      object edCust: TDBEditEh
        Left = 8
        Top = 112
        Width = 457
        Height = 19
        TabStop = False
        AlwaysShowBorder = True
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        DataField = 'CU_NAME'
        DataSource = dsSdelka
        EditButtons = <>
        Flat = True
        ReadOnly = True
        TabOrder = 2
        Visible = True
      end
      object edPodachas: TDBEditEh
        Left = 8
        Top = 155
        Width = 457
        Height = 19
        TabStop = False
        AlwaysShowBorder = True
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        DataField = 'PODACHA_NUMS'
        DataSource = dsSdelka
        EditButtons = <>
        Flat = True
        ReadOnly = True
        TabOrder = 3
        Visible = True
      end
      object grObjavs: TDBGridEh
        Left = 8
        Top = 199
        Width = 457
        Height = 89
        AllowedOperations = []
        Anchors = [akLeft, akTop, akRight]
        DataSource = dsObjavlenie
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghHighlightFocus, dghClearSelection, dghRowHighlight]
        ReadOnly = True
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'FM_NAME'
            Footers = <>
            Width = 129
          end
          item
            EditButtons = <>
            FieldName = 'RB_NAME_SHORT'
            Footers = <>
            Width = 190
          end
          item
            ButtonStyle = cbsEllipsis
            EditButtons = <>
            FieldName = 'CONTENT_ID'
            Footers = <>
            Width = 51
            OnEditButtonClick = DBGridEh1Columns3EditButtonClick
          end>
      end
      object Button3: TButton
        Left = 310
        Top = 511
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '<< '#1053#1072#1079#1072#1076
        TabOrder = 6
        OnClick = Button3Click
      end
      object ScrollBox1: TScrollBox
        Left = 8
        Top = 315
        Width = 457
        Height = 197
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelKind = bkSoft
        BorderStyle = bsNone
        TabOrder = 7
        object img: TImage
          Left = 0
          Top = 0
          Width = 453
          Height = 193
          Align = alClient
          AutoSize = True
          Proportional = True
          Stretch = True
        end
      end
      object cbScale: TDBCheckBoxEh
        Left = 9
        Top = 523
        Width = 208
        Height = 17
        AlwaysShowBorder = True
        Anchors = [akLeft, akBottom]
        Caption = #1052#1072#1089#1096#1090#1072#1073#1080#1088#1086#1074#1072#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
        Checked = True
        Flat = True
        State = cbChecked
        TabOrder = 8
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = cbScaleClick
      end
    end
  end
  object dlgOpen: TOpenDialog
    Filter = 'EPS(*.eps)|*.eps|TIF(*.tif)|*.tif|TIFF(*.tiff)|*.tiff'
    Title = #1047#1072#1075#1088#1091#1079#1082#1072' '#1092#1072#1081#1083#1072' '#1084#1086#1076#1091#1083#1100#1085#1086#1075#1086' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1103
    Left = 168
    Top = 8
  end
  object qrySdelka: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'SD_NUM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sd_num'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT'
      '    SD.SD_NUM,'
      '    SD.SD_ID,'
      '    SD.SD_ID_COMPOUND,'
      '    AG.AG_NAME,'
      '    CU.CU_NAME,'
      '    CU.cu_id,'
      '    SPN.PODACHA_NUMS'
      'FROM'
      '    SDELKA SD'
      ''
      '    LEFT JOIN AGENT AG'
      '    ON (SD.AG_ID=AG.AG_ID)'
      ''
      '    LEFT JOIN CUST CU'
      '    ON (SD.CU_ID=CU.CU_ID AND Cu.ag_id = sd.ag_id)'
      ''
      '    LEFT JOIN SDELKA_PODACHA_NUMS(SD.AG_ID,SD.SD_ID) SPN'
      '    ON (SD.SD_ID=SPN.SD_ID)'
      'WHERE'
      '    SD.AG_ID=:AG_ID'
      '    AND'
      '    SD.SD_NUM=:SD_NUM'
      '    AND'
      
        '    SD.sd_date = (SELECT MAX(s.sd_date) FROM sdelka s WHERE s.ag' +
        '_id = :AG_ID AND s.sd_num = :sd_num)')
    SQLConnection = data.connection
    Left = 124
    Top = 96
    object qrySdelkaSD_ID_COMPOUND: TStringField
      FieldName = 'SD_ID_COMPOUND'
      Size = 23
    end
    object qrySdelkaAG_NAME: TStringField
      FieldName = 'AG_NAME'
      Size = 128
    end
    object qrySdelkaCU_NAME: TStringField
      FieldName = 'CU_NAME'
      Size = 128
    end
    object qrySdelkaPODACHA_NUMS: TStringField
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object qrySdelkaSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object qrySdelkaSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
  end
  object prvSdelka: TDataSetProvider
    DataSet = qrySdelka
    Left = 180
    Top = 96
  end
  object cdsSdelka: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'SD_NUM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'SD_NUM'
        ParamType = ptUnknown
      end>
    ProviderName = 'prvSdelka'
    Left = 236
    Top = 96
    object cdsSdelkaSD_ID_COMPOUND: TStringField
      FieldName = 'SD_ID_COMPOUND'
      Size = 23
    end
    object cdsSdelkaAG_NAME: TStringField
      FieldName = 'AG_NAME'
      Size = 128
    end
    object cdsSdelkaCU_NAME: TStringField
      FieldName = 'CU_NAME'
      Size = 128
    end
    object cdsSdelkaPODACHA_NUMS: TStringField
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object cdsSdelkaSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object cdsSdelkaSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
  end
  object dsSdelka: TDataSource
    DataSet = cdsSdelka
    Left = 292
    Top = 96
  end
  object qryObjavlenie: TSQLQuery
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
        Name = 'SD_ID'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'SELECT'
      '    OBJ.PD_ID,'
      '    OBJ.OBJAV_ID,'
      '    OBJ.FM_ID,'
      #9'OBJ.RB_ID,'
      #9'OBJ.VAC_COUNT,'
      #9'OBJ.DOUBLE_RB_ID,'
      #9'FM.FM_NAME,'
      #9'RB.RB_NAME_SHORT,'
      #9'OBJ.CONTENT_ID,'
      #9'OBJ.OBJAV_COMMENT,'
      #9'OBJ.OBJAV_HAS_ATTENTION,'
      #9'OBJ.PICTURE_TO_INET,'
      '  OBJ.MDL_TEXT,'
      #9'FM.FM_PICTURE_SIZES'
      'FROM'
      #9'OBJAVLENIE OBJ'
      ''
      #9'LEFT JOIN FORMAT FM'
      #9'ON (OBJ.FM_ID=FM.FM_ID)'
      ''
      #9'LEFT JOIN RUBRIKA RB'
      #9'ON (OBJ.RB_ID=RB.RB_ID)'
      'WHERE'
      
        #9'OBJ.PD_ID = (SELECT PD_ID FROM GET_CURRENT_PODACHA(:AG_ID,:SD_I' +
        'D))')
    SQLConnection = data.connection
    Left = 124
    Top = 144
    object qryObjavleniePD_ID: TIntegerField
      FieldName = 'PD_ID'
      Required = True
    end
    object qryObjavlenieOBJAV_ID: TIntegerField
      FieldName = 'OBJAV_ID'
      Required = True
    end
    object qryObjavlenieFM_ID: TIntegerField
      FieldName = 'FM_ID'
      Required = True
    end
    object qryObjavlenieRB_ID: TIntegerField
      FieldName = 'RB_ID'
      Required = True
    end
    object qryObjavlenieFM_NAME: TStringField
      FieldName = 'FM_NAME'
      ProviderFlags = []
      Size = 128
    end
    object qryObjavlenieRB_NAME_SHORT: TStringField
      FieldName = 'RB_NAME_SHORT'
      ProviderFlags = []
      Size = 64
    end
    object qryObjavlenieCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
    end
    object qryObjavlenieFM_PICTURE_SIZES: TStringField
      FieldName = 'FM_PICTURE_SIZES'
      ProviderFlags = []
      Size = 128
    end
    object qryObjavlenieDOUBLE_RB_ID: TIntegerField
      FieldName = 'DOUBLE_RB_ID'
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
    object qryObjavlenieVAC_COUNT: TSmallintField
      FieldName = 'VAC_COUNT'
      Required = True
    end
    object qryObjavlenieMDL_TEXT: TStringField
      FieldName = 'MDL_TEXT'
      Size = 2047
    end
  end
  object prvObjavlenie: TDataSetProvider
    DataSet = qryObjavlenie
    Left = 196
    Top = 144
  end
  object cdsObjavlenie: TClientDataSet
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
        Name = 'SD_ID'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'prvObjavlenie'
    Left = 268
    Top = 144
    object cdsObjavleniePD_ID: TIntegerField
      FieldName = 'PD_ID'
      Required = True
    end
    object cdsObjavlenieOBJAV_ID: TIntegerField
      FieldName = 'OBJAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsObjavlenieFM_ID: TIntegerField
      FieldName = 'FM_ID'
      Required = True
    end
    object cdsObjavlenieRB_ID: TIntegerField
      FieldName = 'RB_ID'
      Required = True
    end
    object cdsObjavlenieFM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldName = 'FM_NAME'
      ProviderFlags = []
      Size = 128
    end
    object cdsObjavlenieRB_NAME_SHORT: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME_SHORT'
      ProviderFlags = []
      Size = 64
    end
    object cdsObjavlenieCONTENT_ID: TIntegerField
      DisplayLabel = #1052#1086#1076#1091#1083#1100
      FieldName = 'CONTENT_ID'
      OnGetText = cdsObjavlenieCONTENT_IDGetText
    end
    object cdsObjavlenieFM_PICTURE_SIZES: TStringField
      FieldName = 'FM_PICTURE_SIZES'
      ProviderFlags = []
      Size = 128
    end
    object cdsObjavlenieDOUBLE_RB_ID: TIntegerField
      FieldName = 'DOUBLE_RB_ID'
    end
    object cdsObjavlenieOBJAV_COMMENT: TStringField
      FieldName = 'OBJAV_COMMENT'
      Size = 255
    end
    object cdsObjavlenieOBJAV_HAS_ATTENTION: TSmallintField
      FieldName = 'OBJAV_HAS_ATTENTION'
    end
    object cdsObjavleniePICTURE_TO_INET: TSmallintField
      FieldName = 'PICTURE_TO_INET'
    end
    object cdsObjavlenieVAC_COUNT: TSmallintField
      FieldName = 'VAC_COUNT'
      Required = True
    end
    object cdsObjavlenieMDL_TEXT: TStringField
      FieldName = 'MDL_TEXT'
      Size = 2047
    end
  end
  object dsObjavlenie: TDataSource
    DataSet = cdsObjavlenie
    Left = 340
    Top = 144
  end
  object qryContent: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CONTENT_ID'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'SELECT'
      '    OC.*'
      'FROM'
      '    OBJAV_CONTENT OC'
      'WHERE'
      '    OC.CONTENT_ID=:CONTENT_ID')
    SQLConnection = data.connection
    Left = 124
    Top = 192
    object qryContentCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryContentFM_ID: TIntegerField
      FieldName = 'FM_ID'
      Required = True
    end
    object qryContentRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object qryContentCONTENT_PICTURE: TBlobField
      FieldName = 'CONTENT_PICTURE'
      Size = 1
    end
    object qryContentCONTENT_COREL_PAGE: TStringField
      FieldName = 'CONTENT_COREL_PAGE'
      Size = 32
    end
    object qryContentVAC_COUNT: TSmallintField
      FieldName = 'VAC_COUNT'
      Required = True
    end
    object qryContentOLD_CONTENT_ID_LINK: TIntegerField
      FieldName = 'OLD_CONTENT_ID_LINK'
    end
    object qryContentEXTENSION: TStringField
      FieldName = 'EXTENSION'
      Size = 5
    end
  end
  object prvContent: TDataSetProvider
    DataSet = qryContent
    Left = 180
    Top = 192
  end
  object cdsContent: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CONTENT_ID'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'prvContent'
    Left = 236
    Top = 192
    object cdsContentCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsContentFM_ID: TIntegerField
      FieldName = 'FM_ID'
      Required = True
    end
    object cdsContentRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object cdsContentCONTENT_PICTURE: TBlobField
      FieldName = 'CONTENT_PICTURE'
      Size = 1
    end
    object cdsContentCONTENT_COREL_PAGE: TStringField
      FieldName = 'CONTENT_COREL_PAGE'
      Size = 32
    end
    object cdsContentVAC_COUNT: TSmallintField
      FieldName = 'VAC_COUNT'
      Required = True
    end
    object cdsContentOLD_CONTENT_ID_LINK: TIntegerField
      FieldName = 'OLD_CONTENT_ID_LINK'
    end
    object cdsContentEXTENSION: TStringField
      FieldName = 'EXTENSION'
      Size = 5
    end
  end
  object dsContent: TDataSource
    DataSet = cdsContent
    Left = 292
    Top = 192
  end
  object spCopySiteObjavs: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CONTENT_ID_FROM'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'CONTENT_ID_TO'
        ParamType = ptInput
      end>
    SQLConnection = data.connection
    StoredProcName = 'COPY_SITE_OBJAV'
    Left = 132
    Top = 297
  end
  object qObjavlenieUpdate: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'objav_id'
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
        Name = 'objav_comment'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'objav_has_attention'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'picture_to_inet'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'district_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mdl_text'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      
        'execute procedure OBJAVLENIE_UPDATE(:objav_id, :content_id, :rb_' +
        'id, :fm_id, :vac_count, :double_rb_id, :objav_comment, :objav_ha' +
        's_attention, :picture_to_inet, :district_id, :mdl_text)')
    SQLConnection = data.connection
    Left = 132
    Top = 246
  end
  object spLogModuleLoad: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'US_ID'
        ParamType = ptInput
      end
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
        Name = 'TYP'
        ParamType = ptInput
      end>
    SQLConnection = data.connection
    StoredProcName = 'MODULE_LOAD_LOG'
    Left = 132
    Top = 345
  end
end
