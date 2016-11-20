object frmSdelkaPubl: TfrmSdelkaPubl
  Left = 0
  Top = 0
  Width = 735
  Height = 172
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 735
    Height = 172
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      735
      172)
    object Shape1: TShape
      Left = 0
      Top = 0
      Width = 735
      Height = 23
      Align = alTop
      Brush.Color = clSkyBlue
      Pen.Color = clNavy
    end
    object Label1: TLabel
      Left = 7
      Top = 5
      Width = 117
      Height = 13
      Caption = #1054#1073#1098#1103#1074#1083#1077#1085#1080#1103' '#1089#1076#1077#1083#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblIsReadOnly: TLabel
      Left = 240
      Top = 6
      Width = 97
      Height = 13
      Caption = #1058#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1095#1090#1077#1085#1080#1103
      Visible = False
    end
    object btAdd: TBitBtn
      Left = 648
      Top = 3
      Width = 25
      Height = 17
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1077
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btAddClick
      Glyph.Data = {
        62000000424D62000000000000003E0000002800000009000000090000000100
        010000000000240000000000000000000000020000000000000000000000FFFF
        FF00E3800000E3800000E3800000000000000000000000000000E3800000E380
        0000E3800000}
    end
    object btDelete: TBitBtn
      Left = 706
      Top = 3
      Width = 25
      Height = 17
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1077
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btDeleteClick
      Glyph.Data = {
        6A000000424D6A000000000000003E000000280000000B0000000B0000000100
        0100000000002C0000000000000000000000020000000000000000000000FFFF
        FF00FFE00000FFE00000FFE00000FFE00000002000000020000000200000FFE0
        0000FFE00000FFE00000FFE00000}
    end
    object grObjavs: TDBGridEh
      Left = 0
      Top = 23
      Width = 735
      Height = 149
      Align = alClient
      Color = clBtnFace
      DataSource = dsObjav
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      MinAutoFitWidth = 10
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghHighlightFocus, dghClearSelection]
      ReadOnly = True
      RowHeight = 2
      RowLines = 1
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = btEditClick
      OnDrawColumnCell = grObjavsDrawColumnCell
      OnKeyPress = grObjavsKeyPress
      Columns = <
        item
          AlwaysShowEditButton = True
          Checkboxes = True
          EditButtons = <>
          FieldName = 'OB_IS_ACTIVE'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          Title.Caption = ' '
          Title.Color = clSkyBlue
          Width = 15
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'OBJAV_HAS_ATTENTION'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          Title.Alignment = taCenter
          Title.Caption = ' !!!'
          Title.Color = clSkyBlue
          Width = 15
        end
        item
          EditButtons = <>
          FieldName = 'MDL_TEXT'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = 'T'
          Title.Color = clSkyBlue
          Width = 15
        end
        item
          EditButtons = <>
          FieldName = 'FM_NAME'
          Footers = <>
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 43
        end
        item
          EditButtons = <>
          FieldName = 'RB_NAME'
          Footers = <>
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'DOUBLE_RB_NAME'
          Footers = <>
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'RS_NAME'
          Footers = <>
          Title.Color = clSkyBlue
          Width = 106
        end
        item
          EditButtons = <>
          FieldName = 'OB_STATE_NAME'
          Footers = <>
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 78
        end
        item
          EditButtons = <>
          FieldName = 'OB_TEXT'
          Footers = <>
          Title.Color = clSkyBlue
          Width = 190
        end
        item
          EditButtons = <>
          FieldName = 'OB_COMMENT'
          Footers = <>
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 148
        end
        item
          EditButtons = <>
          FieldName = 'LOAD_DATE'
          Footers = <>
          Title.Caption = #1047#1072#1075#1088'. '#1084#1086#1076#1091#1083#1103
          Title.Color = clSkyBlue
        end
        item
          EditButtons = <>
          FieldName = 'UNLOAD_DATE'
          Footers = <>
          Title.Caption = #1042#1099#1075#1088'. '#1084#1086#1076#1091#1083#1103
          Title.Color = clSkyBlue
        end>
    end
    object btEdit: TBitBtn
      Left = 677
      Top = 3
      Width = 25
      Height = 17
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1077
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btEditClick
      Glyph.Data = {
        52000000424D52000000000000003E000000280000000B000000050000000100
        010000000000140000000000000000000000020000000000000000000000FFFF
        FF0080200000C0600000E0E00000F1E00000FBE00000}
    end
    object btAddPovtor: TBitBtn
      Left = 585
      Top = 3
      Width = 59
      Height = 17
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1103'-'#1087#1086#1074#1090#1086#1088#1099
      Anchors = [akTop, akRight]
      Caption = #1087#1086#1074#1090#1086#1088
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btAddPovtorClick
      Glyph.Data = {
        62000000424D62000000000000003E0000002800000009000000090000000100
        010000000000240000000000000000000000020000000000000000000000FFFF
        FF00E3800000E3800000E3800000000000000000000000000000E3800000E380
        0000E3800000}
    end
    object btView: TBitBtn
      Left = 556
      Top = 3
      Width = 25
      Height = 17
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1086#1083#1085#1091#1102' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      TabStop = False
      OnClick = btViewClick
      Glyph.Data = {
        D6000000424DD60000000000000076000000280000000C0000000C0000000100
        0400000000006000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
        0000999999999999000099999999099900009999999000990000999999000999
        000099000700999900009099907999990000099999099999000009F999099999
        000009FF99099999000090999099999900009900099999990000}
    end
    object btHistory: TBitBtn
      Left = 486
      Top = 3
      Width = 65
      Height = 17
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1103'-'#1087#1086#1074#1090#1086#1088#1099
      Anchors = [akTop, akRight]
      Caption = #1080#1089#1090#1086#1088#1080#1103'...'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      TabStop = False
      OnClick = btHistoryClick
    end
  end
  object dsObjav: TDataSource
    DataSet = cdsObjav
    Left = 520
    Top = 56
  end
  object cdsObjav: TClientDataSet
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
      end
      item
        DataType = ftInteger
        Name = 'CURRENT_PD_ID'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'prvObjav'
    OnReconcileError = cdsDoubleReconcileError
    Left = 424
    Top = 56
    object cdsObjavIS_OBJAVLENIE: TIntegerField
      FieldName = 'IS_OBJAVLENIE'
      Required = True
    end
    object cdsObjavAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Required = True
    end
    object cdsObjavSD_ID: TIntegerField
      FieldName = 'SD_ID'
      Required = True
    end
    object cdsObjavOB_ID: TIntegerField
      FieldName = 'OB_ID'
      Required = True
    end
    object cdsObjavOB_STATE: TSmallintField
      FieldName = 'OB_STATE'
      Required = True
    end
    object cdsObjavOB_STATE_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'OB_STATE_NAME'
      Size = 64
    end
    object cdsObjavOB_IS_ACTIVE: TSmallintField
      DisplayLabel = #1055#1091#1073#1083#1080#1082#1086#1074#1072#1090#1100
      FieldName = 'OB_IS_ACTIVE'
      Required = True
    end
    object cdsObjavFM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldName = 'FM_NAME'
      Size = 128
    end
    object cdsObjavRB_NAME: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME'
      Size = 64
    end
    object cdsObjavRS_NAME: TStringField
      DisplayLabel = #1053#1072' '#1089#1072#1081#1090#1077
      FieldName = 'RS_NAME'
      Size = 128
    end
    object cdsObjavDOUBLE_RB_NAME: TStringField
      DisplayLabel = #1050#1086#1087#1080#1103' '#1074
      FieldName = 'DOUBLE_RB_NAME'
      Size = 64
    end
    object cdsObjavOB_TEXT: TStringField
      DisplayLabel = #1058#1077#1082#1089#1090
      FieldName = 'OB_TEXT'
      OnGetText = cdsObjavOB_TEXTGetText
      Size = 2047
    end
    object cdsObjavOB_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'OB_COMMENT'
      Size = 127
    end
    object cdsObjavCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
      ProviderFlags = []
    end
    object cdsObjavOBJAV_HAS_ATTENTION: TSmallintField
      DisplayLabel = ' !!! '
      FieldName = 'OBJAV_HAS_ATTENTION'
    end
    object cdsObjavGZ_ID: TIntegerField
      FieldName = 'GZ_ID'
    end
    object cdsObjavCONTENT_COREL_PAGE: TStringField
      FieldName = 'CONTENT_COREL_PAGE'
      Size = 32
    end
    object cdsObjavLOAD_DATE: TSQLTimeStampField
      FieldName = 'LOAD_DATE'
    end
    object cdsObjavUNLOAD_DATE: TSQLTimeStampField
      FieldName = 'UNLOAD_DATE'
    end
    object cdsObjavMDL_TXT: TStringField
      FieldName = 'MDL_TEXT'
      Size = 2048
    end
  end
  object qryObjav: TSQLQuery
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
      end
      item
        DataType = ftInteger
        Name = 'CURRENT_PD_ID'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'select'
      '      0                         as IS_OBJAVLENIE'
      '    , ob.AG_ID                  as AG_ID'
      '    , ob.SD_ID                  as SD_ID'
      '    , ob.OB_ID                  as OB_ID'
      '    , rb_t.GZ_ID                as GZ_ID'
      '    , ob.OB_STATE               as OB_STATE'
      '    , os.OS_NAME                as OB_STATE_NAME'
      '    , ob.OB_IS_ACTIVE           as OB_IS_ACTIVE'
      '    , fm_t.FM_NAME              as FM_NAME'
      '    , rb_t.RB_NAME_SHORT        as RB_NAME'
      '    , rs.RS_NAME                as RS_NAME'
      '    , rb_td.RB_NAME_SHORT       as DOUBLE_RB_NAME'
      '    , cast(ob.OB_TEXT as varchar(2047)) as OB_TEXT'
      '    , ob.OB_COMMENT             as OB_COMMENT'
      '    , -1                        as CONTENT_ID'
      '    , cast(0 as smallint)        as OBJAV_HAS_ATTENTION'
      '    , cast('#39#39' as varchar(32))    as CONTENT_COREL_PAGE'
      '    , cast(null as timestamp) as load_date'
      '    , cast(null as timestamp) as unload_date'
      '    , cast('#39#39' as varchar(2048)) as MDL_TEXT'
      'from'
      '    OBJAV ob'
      ''
      '    left join OBJAV db'
      
        '    on (ob.AG_ID = db.AG_ID and OB.SD_ID=DB.SD_ID and OB.OB_ID =' +
        ' DB.OB_PARENT)'
      ''
      '    left join RUBRIKA rb_td'
      '    on (db.RB_ID = rb_td.RB_ID)'
      ''
      '    left join RUBRIKA_SITE rs'
      '    on (ob.RS_ID = rs.RS_ID)'
      ''
      '    , OBJAV_STATE os, FORMAT fm_t, RUBRIKA rb_t'
      ''
      'where'
      '    OB.AG_ID=:AG_ID and'
      '    OB.SD_ID=:SD_ID and'
      '    OB.OB_PARENT is null'
      ''
      '    and os.OS_ID = ob.OB_STATE'
      '    and fm_t.FM_ID = ob.FM_ID'
      '    and rb_t.RB_ID = ob.RB_ID'
      ''
      'union'
      ''
      'select'
      '      1                         as IS_OBJAVLENIE'
      '    , -1                        as AG_ID'
      '    , -1                        as SD_ID'
      '    , obj.OBJAV_ID              as OB_ID'
      '    , rb_m.GZ_ID                as GZ_ID'
      '    , os.OS_ID                  as OB_STATE'
      '    , os.OS_NAME                as OB_STATE_NAME'
      '    , cast(1 as smallint)       as OB_IS_ACTIVE'
      '    , fm_m.FM_NAME              as FM_NAME'
      '    , rb_m.RB_NAME_SHORT        as RB_NAME'
      '    , cast(null as varchar(128)) as RS_NAME'
      '    , rb_md.RB_NAME_SHORT       as DOUBLE_RB_NAME'
      '    , cast('#39#39' as varchar(2047)) as OB_TEXT'
      
        '    , cast(left(obj.OBJAV_COMMENT,127) as varchar(127)) as OB_CO' +
        'MMENT'
      '    , obj.CONTENT_ID            as CONTENT_ID'
      '    , obj.OBJAV_HAS_ATTENTION   as OBJAV_HAS_ATTENTION'
      '    , obj_c.CONTENT_COREL_PAGE    as CONTENT_COREL_PAGE'
      
        '    , (select max(ocl.ll_date) from objav_content_load_log ocl w' +
        'here ocl.content_id = obj.content_id and ocl.log_type = 1) as lo' +
        'ad_date'
      
        '    , (select max(ocl.ll_date) from objav_content_load_log ocl w' +
        'here ocl.content_id = obj.content_id and ocl.log_type = 2) as un' +
        'load_date'
      '    , obj.MDL_TEXT'
      'from'
      
        '    OBJAVLENIE obj/*, PODACHA pd, FORMAT fm_m, RUBRIKA rb_m, RUB' +
        'RIKA rb_md, OBJAV_CONTENT obj_c*/'
      ''
      '    left join PODACHA pd'
      '    on (obj.PD_ID = pd.PD_ID)'
      ''
      '    left join FORMAT fm_m'
      '    on (obj.FM_ID = fm_m.FM_ID)'
      ''
      '    left join RUBRIKA rb_m'
      '    on (obj.RB_ID = rb_m.RB_ID)'
      ''
      '    left join RUBRIKA rb_md'
      '    on (obj.DOUBLE_RB_ID = rb_md.RB_ID)'
      ''
      '    left join OBJAV_CONTENT obj_c'
      '    on (obj_c.CONTENT_ID = obj.CONTENT_ID)'
      ''
      '    left join OBJAV_STATE os on (os.OS_ID = obj.OB_STATE)'
      ''
      'where'
      '    obj.PD_ID = :CURRENT_PD_ID')
    SQLConnection = data.connection
    Left = 216
    Top = 56
    object qryObjavIS_OBJAVLENIE: TIntegerField
      FieldName = 'IS_OBJAVLENIE'
      Required = True
    end
    object qryObjavAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Required = True
    end
    object qryObjavSD_ID: TIntegerField
      FieldName = 'SD_ID'
      Required = True
    end
    object qryObjavOB_ID: TIntegerField
      FieldName = 'OB_ID'
      Required = True
    end
    object qryObjavOB_STATE: TSmallintField
      FieldName = 'OB_STATE'
      Required = True
    end
    object qryObjavOB_STATE_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'OB_STATE_NAME'
      Size = 64
    end
    object qryObjavOB_IS_ACTIVE: TSmallintField
      DisplayLabel = #1040#1082#1090#1080#1074#1085#1086
      FieldName = 'OB_IS_ACTIVE'
      Required = True
    end
    object qryObjavFM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldName = 'FM_NAME'
      Size = 128
    end
    object qryObjavRB_NAME: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME'
      Size = 64
    end
    object qryObjavRS_NAME: TStringField
      DisplayLabel = #1053#1072' '#1089#1072#1081#1090#1077
      FieldName = 'RS_NAME'
      Size = 128
    end
    object qryObjavDOUBLE_RB_NAME: TStringField
      DisplayLabel = #1050#1086#1087#1080#1103' '#1074
      FieldName = 'DOUBLE_RB_NAME'
      Size = 64
    end
    object qryObjavOB_TEXT: TStringField
      DisplayLabel = #1058#1077#1082#1089#1090
      FieldName = 'OB_TEXT'
      Size = 2047
    end
    object qryObjavOB_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'OB_COMMENT'
      Size = 127
    end
    object qryObjavCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
      ProviderFlags = []
    end
    object qryObjavOBJAV_HAS_ATTENTION: TSmallintField
      DisplayLabel = ' !!! '
      FieldName = 'OBJAV_HAS_ATTENTION'
    end
    object qryObjavGZ_ID: TIntegerField
      FieldName = 'GZ_ID'
    end
    object qryObjavCONTENT_COREL_PAGE: TStringField
      FieldName = 'CONTENT_COREL_PAGE'
      Size = 32
    end
    object qryObjavLOAD_DATE: TSQLTimeStampField
      FieldName = 'LOAD_DATE'
    end
    object qryObjavUNLOAD_DATE: TSQLTimeStampField
      FieldName = 'UNLOAD_DATE'
    end
    object qryObjavMDL_TXT: TStringField
      FieldName = 'MDL_TEXT'
      Size = 2048
    end
  end
  object prvObjav: TDataSetProvider
    DataSet = qryObjav
    Exported = False
    Options = [poCascadeDeletes, poCascadeUpdates]
    Left = 320
    Top = 56
  end
  object spGetCurrentPodacha: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PD_ID'
        ParamType = ptOutput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'IS_ID'
        ParamType = ptOutput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'PD_IS_DONE'
        ParamType = ptOutput
        Size = 4
      end>
    SQLConnection = data.connection
    StoredProcName = 'GET_CURRENT_PODACHA'
    Left = 56
    Top = 56
  end
  object spCopyObjav: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID_SRC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID_SRC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OB_ID_SRC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AG_ID_DST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID_DST'
        ParamType = ptInput
      end>
    SQLConnection = data.connection
    StoredProcName = 'COPY_OBJAV'
    Left = 57
    Top = 105
  end
  object spCopyObjavlenie: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'OBJAV_ID_SRC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PD_ID_DST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NEW_CONTENT'
        ParamType = ptInput
      end>
    SQLConnection = data.connection
    StoredProcName = 'COPY_OBJAVLENIE'
    Left = 145
    Top = 105
  end
  object spObjavlenieDelete: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'OBJAV_ID'
        ParamType = ptInput
      end>
    SQLConnection = data.connection
    StoredProcName = 'OBJAVLENIE_DELETE'
    Left = 424
    Top = 104
  end
  object spObjavlenieInsert: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PD_ID'
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
        DataType = ftString
        Name = 'MDL_TEXT'
        ParamType = ptInput
      end>
    SQLConnection = data.connection
    StoredProcName = 'OBJAVLENIE_INSERT'
    Left = 360
    Top = 104
  end
  object qryIsCurrentIssue: TSQLQuery
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
      'select count(1) as CNT'
      'from PODACHA p'
      'where       p.AG_ID = :AG_ID'
      #9#9'and p.SD_ID = :SD_ID'
      #9#9'and ('
      #9#9#9'p.IS_ID = ('
      #9#9#9#9'select PM_CURRENT_ISSUE_PR'
      #9#9#9#9'from PARAMS'
      #9#9#9')'
      #9#9#9'or'
      #9#9#9'p.IS_ID = ('
      #9#9#9#9'select PM_CURRENT_ISSUE_NS'
      #9#9#9#9'from PARAMS'
      #9#9#9')'
      #9#9')')
    SQLConnection = data.connection
    Left = 520
    Top = 104
    object qryIsCurrentIssueCNT2: TIntegerField
      FieldName = 'CNT'
      Required = True
    end
  end
  object qContent: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CONTENT_ID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT'
      '    OC.CONTENT_ID,'
      '    OC.EXTENSION,'
      '    OC.CONTENT_PICTURE,'
      '    OC.RB_ID,'
      '    OC.FM_ID,'
      '    OC.CONTENT_COREL_PAGE,'
      '    OC.CONTENT_SITE_OBJAV_ADDED'
      'FROM'
      '    OBJAV_CONTENT OC'
      'WHERE'
      '    OC.CONTENT_ID = :CONTENT_ID')
    SQLConnection = data.connection
    Left = 192
    Top = 96
  end
  object prvContent: TDataSetProvider
    DataSet = qContent
    Left = 224
    Top = 96
  end
  object cdsContent: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvContent'
    Left = 256
    Top = 96
    object cdsContentCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
    end
    object cdsContentEXTENSION: TStringField
      FieldName = 'EXTENSION'
      Size = 5
    end
    object cdsContentCONTENT_PICTURE: TBlobField
      FieldName = 'CONTENT_PICTURE'
      Size = 1
    end
    object cdsContentRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object cdsContentFM_ID: TIntegerField
      FieldName = 'FM_ID'
    end
    object cdsContentCONTENT_COREL_PAGE: TStringField
      FieldName = 'CONTENT_COREL_PAGE'
      Size = 32
    end
    object cdsContentCONTENT_SITE_OBJAV_ADDED: TSmallintField
      FieldName = 'CONTENT_SITE_OBJAV_ADDED'
    end
  end
  object spCopySiteObjavs: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CONTENT_ID_FROM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CONTENT_ID_TO'
        ParamType = ptInput
      end>
    SQLConnection = data.connection
    StoredProcName = 'COPY_SITE_OBJAV'
    Left = 472
    Top = 104
  end
end
