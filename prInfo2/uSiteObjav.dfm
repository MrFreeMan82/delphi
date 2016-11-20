object frmSite_Objav: TfrmSite_Objav
  Left = 738
  Top = 208
  Width = 837
  Height = 448
  Align = alClient
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel41: TPanel
    Left = 0
    Top = 376
    Width = 821
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Shape60: TShape
      Left = 0
      Top = 0
      Width = 821
      Height = 1
      Align = alTop
      Pen.Color = clBtnShadow
    end
    object btRefresh: TBitBtn
      Left = 5
      Top = 6
      Width = 114
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btRefreshClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
        FFFFFFFFF00FFFFFFFFFFFF88000FFFFFFFFFF0000000FFFFFFFF0000000FF80
        FFFF808FF00FFF000FFF00FFF0FFFFF008FF00FFFFFFFFFF00FF00FFFFFFFFFF
        00FF800FFFFF0FFF00FFF000FFF00FF808FFFF08FF0000000FFFFFFFF0000000
        FFFFFFFFFF00088FFFFFFFFFFFF00FFFFFFFFFFFFFFF0FFFFFFF}
    end
    object btEditSiteObjav: TBitBtn
      Left = 125
      Top = 6
      Width = 114
      Height = 25
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btEditSiteObjavClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDCCDDCDDD
        DDDDDDDCDDCCDCDDDDDDCDC0000DDDCDDDDDDCD08830DDDDDDDDDDD08B330DDD
        DDDDDDD0BBB330DDDDDDDDDD0BBB330DDDDDDDDDD0BBB330DDDDDDDDDD0BBB33
        0DDDDDDDDDD0BBB330DDDDDDDDDD0BB3000DDDDDDDDDD0B0330DDDDDDDDDDD00
        B30DDDDDDDDDDDD000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
    end
    object btSearch: TBitBtn
      Left = 246
      Top = 6
      Width = 207
      Height = 25
      Caption = #1055#1086#1080#1089#1082' '#1076#1083#1103' '#1074#1085#1077#1089#1077#1085#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btSearchClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333300000333330000030F000333330F00030F000333330F000300000003000
        0000300F000000F00000300F000300F00000300F000300F00000330000000000
        00033330F00030F000333330000030000033333300033300033333330F03330F
        0333333300033300033333333333333333333333333333333333}
    end
  end
  object pgObjav: TPageControl
    Left = 0
    Top = 35
    Width = 821
    Height = 341
    ActivePage = tabmodule
    Align = alClient
    TabOrder = 1
    object tabText: TTabSheet
      Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1077
      object grSdelkaForNabor: TDBGridEh
        Left = 0
        Top = 0
        Width = 813
        Height = 313
        Align = alClient
        AutoFitColWidths = True
        DataSource = dsObjavForSiteNabor
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghHighlightFocus, dghClearSelection]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDblClick = btEditSiteObjavClick
        OnDrawColumnCell = grSdelkaForNaborDrawColumnCell
        Columns = <
          item
            EditButtons = <>
            FieldName = 'SR_IS_CURRENT_ISSUE'
            Footers = <>
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 58
          end
          item
            EditButtons = <>
            FieldName = 'RB_IS_LOCKABLE'
            Footers = <>
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 59
          end
          item
            EditButtons = <>
            FieldName = 'SD_NUM'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'AG_NAME'
            Footers = <>
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 108
          end
          item
            EditButtons = <>
            FieldName = 'GZ_NAME_SHORT'
            Footers = <>
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 40
          end
          item
            EditButtons = <>
            FieldName = 'FM_NAME'
            Footers = <>
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 44
          end
          item
            EditButtons = <>
            FieldName = 'RB_NAME_SHORT'
            Footers = <>
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 87
          end
          item
            EditButtons = <>
            FieldName = 'PODACHA_NUMS'
            Footers = <>
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 132
          end
          item
            EditButtons = <>
            FieldName = 'OB_COMMENT'
            Footers = <>
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 182
          end>
      end
    end
    object tabmodule: TTabSheet
      Caption = #1052#1086#1076#1091#1083#1100#1085#1099#1077
      ImageIndex = 1
      object grModuliSiteObjavs: TDBGridEh
        Left = 0
        Top = 0
        Width = 813
        Height = 313
        Align = alClient
        DataSource = dsContentSiteObjavs
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghHighlightFocus, dghClearSelection]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDblClick = btEditSiteObjavClick
        OnDrawColumnCell = grModuliSiteObjavsDrawColumnCell
        Columns = <
          item
            EditButtons = <>
            FieldName = 'AG_NAME'
            Footers = <>
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 117
          end
          item
            EditButtons = <>
            FieldName = 'SD_NUM'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 99
          end
          item
            EditButtons = <>
            FieldName = 'RB_NAME_SHORT'
            Footers = <>
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 136
          end
          item
            EditButtons = <>
            FieldName = 'FM_NAME'
            Footers = <>
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 91
          end
          item
            EditButtons = <>
            FieldName = 'PODACHA_NUMS'
            Footers = <>
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 149
          end
          item
            EditButtons = <>
            FieldName = 'ob_comment'
            Footers = <>
            Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 97
          end
          item
            EditButtons = <>
            FieldName = 'CU_PHONES'
            Footers = <>
            Title.Caption = #1058#1077#1083#1077#1092#1086#1085#1099
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end>
      end
    end
  end
  object Panel33: TPanel
    Left = 0
    Top = 0
    Width = 821
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Shape59: TShape
      Left = 0
      Top = 34
      Width = 821
      Height = 1
      Align = alBottom
      Pen.Color = clBtnShadow
    end
    object Label67: TLabel
      Left = 8
      Top = 10
      Width = 20
      Height = 13
      Caption = #1050#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Shape19: TShape
      Left = 110
      Top = 3
      Width = 1
      Height = 27
      Pen.Color = clBtnShadow
    end
    object Label88: TLabel
      Left = 120
      Top = 10
      Width = 35
      Height = 13
      Caption = #1043#1072#1079#1077#1090#1072
    end
    object DBEditEh1: TDBEditEh
      Left = 33
      Top = 7
      Width = 70
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Flat = True
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnKeyPress = DBEditEh1KeyPress
    end
    object cbGazetaModuliSite: TDBLookupComboboxEh
      Left = 160
      Top = 7
      Width = 169
      Height = 19
      AlwaysShowBorder = True
      EditButtons = <>
      Flat = True
      KeyField = 'GZ_ID'
      ListField = 'GZ_NAME'
      ListSource = data.dsGazeta
      TabOrder = 1
      Visible = True
      OnChange = cbGazetaModuliSiteChange
    end
  end
  object dsContentSiteObjavs: TDataSource
    DataSet = cdsContentSiteObjavs
    Left = 544
    Top = 110
  end
  object cdsContentSiteObjavs: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'GZ_ID'
        ParamType = ptInput
        Value = 1
      end>
    ProviderName = 'prvContentSiteObjavs'
    ReadOnly = True
    Left = 408
    Top = 110
    object cdsContentSiteObjavsAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object cdsContentSiteObjavsSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object cdsContentSiteObjavsOB_ID: TIntegerField
      FieldName = 'OB_ID'
    end
    object StringField8: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_NAME'
      Size = 128
    end
    object StringField9: TStringField
      DisplayLabel = #1057#1076#1077#1083#1082#1072
      FieldName = 'SD_ID_COMPOUND'
      Size = 23
    end
    object StringField10: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object StringField11: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldName = 'FM_NAME'
      Size = 128
    end
    object StringField12: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object cdsContentSiteObjavsRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object cdsContentSiteObjavsFM_ID: TIntegerField
      FieldName = 'FM_ID'
    end
    object cdsContentSiteObjavsCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
    end
    object cdsContentSiteObjavsCU_ID: TIntegerField
      FieldName = 'CU_ID'
    end
    object cdsContentSiteObjavsGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object cdsContentSiteObjavsCONTENT_SITE_OBJAV_ADDED: TSmallintField
      FieldName = 'CONTENT_SITE_OBJAV_ADDED'
    end
    object cdsContentSiteObjavsSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
    object cdsContentSiteObjavsob_comment: TStringField
      FieldName = 'ob_comment'
      Size = 255
    end
    object cdsContentSiteObjavsCU_PHONES: TStringField
      FieldName = 'CU_PHONES'
      Size = 1024
    end
  end
  object prvContentSiteObjavs: TDataSetProvider
    DataSet = qryContentSiteObjavs
    Left = 272
    Top = 110
  end
  object qryContentSiteObjavs: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'GZ_ID'
        ParamType = ptInput
        Value = 1
      end>
    SQL.Strings = (
      'SELECT'
      '    SD.sd_num,'
      '    MN.AG_ID,'
      '    MN.SD_ID,'
      '    MN.OB_ID,'
      '    MN.RB_ID,'
      '    MN.FM_ID,'
      '    MN.CONTENT_ID,'
      ''
      '    AG.AG_NAME,'
      '    MN.AG_ID || '#39'-'#39' || MN.SD_ID AS SD_ID_COMPOUND,'
      '    RB.RB_NAME_SHORT,'
      '    FM.FM_NAME,'
      '    SD.GZ_ID,'
      
        '    (SELECT PODACHA_NUMS FROM SDELKA_PODACHA_NUMS(MN.AG_ID,MN.SD' +
        '_ID)) AS PODACHA_NUMS,'
      '    SD.CU_ID,'
      '    oc.content_site_objav_added,'
      
        '    (SELECT o.OBJAV_COMMENT FROM OBJAVLENIE o WHERE o.OBJAV_ID =' +
        ' mn.OB_ID) as ob_comment,'
      
        '    (SELECT cp.CU_PHONES FROM GET_CUST_PHONES(sd.AG_ID, sd.CU_ID' +
        ') cp) as cu_phones,'
      '    ob.MDL_TEXT'
      'FROM'
      '    OBJAV_LIST_FOR_INT_NABOR(:GZ_ID) MN'
      ''
      '    LEFT JOIN AGENT AG'
      '    ON (MN.AG_ID=AG.AG_ID)'
      ''
      '    LEFT JOIN RUBRIKA RB'
      '    ON (MN.RB_ID=RB.RB_ID)'
      ''
      '    LEFT JOIN FORMAT FM'
      '    ON (MN.FM_ID=FM.FM_ID)'
      ''
      '    LEFT JOIN SDELKA SD'
      '    ON (MN.AG_ID=SD.AG_ID AND MN.SD_ID=SD.SD_ID)'
      ''
      '    LEFT JOIN OBJAV_CONTENT OC'
      '    ON (MN.CONTENT_ID=OC.CONTENT_ID)'
      ''
      '    LEFT JOIN OBJAVLENIE ob'
      '    ON (ob.OBJAV_ID = mn.OB_ID)'
      ''
      'WHERE sd.SD_STATE > 2'
      
        'AND   ((oc.CONTENT_SITE_OBJAV_ADDED = 0) OR (oc.CONTENT_SITE_OBJ' +
        'AV_ADDED IS NULL))'
      ''
      ''
      '')
    SQLConnection = data.connection
    Left = 136
    Top = 110
    object qryContentSiteObjavsAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object qryContentSiteObjavsSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object qryContentSiteObjavsOB_ID: TIntegerField
      FieldName = 'OB_ID'
    end
    object qryContentSiteObjavsRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object qryContentSiteObjavsFM_ID: TIntegerField
      FieldName = 'FM_ID'
    end
    object qryContentSiteObjavsCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
    end
    object qryContentSiteObjavsAG_NAME: TStringField
      FieldName = 'AG_NAME'
      Size = 128
    end
    object qryContentSiteObjavsSD_ID_COMPOUND: TStringField
      FieldName = 'SD_ID_COMPOUND'
      Size = 23
    end
    object qryContentSiteObjavsRB_NAME_SHORT: TStringField
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object qryContentSiteObjavsFM_NAME: TStringField
      FieldName = 'FM_NAME'
      Size = 128
    end
    object qryContentSiteObjavsPODACHA_NUMS: TStringField
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object qryContentSiteObjavsCU_ID: TIntegerField
      FieldName = 'CU_ID'
    end
    object qryContentSiteObjavsGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object qryContentSiteObjavsCONTENT_SITE_OBJAV_ADDED: TSmallintField
      FieldName = 'CONTENT_SITE_OBJAV_ADDED'
    end
    object qryContentSiteObjavsSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
    object qryContentSiteObjavsob_comment: TStringField
      FieldName = 'ob_comment'
      Size = 255
    end
    object qryContentSiteObjavsCU_PHONES: TStringField
      FieldName = 'CU_PHONES'
      Size = 1024
    end
  end
  object qObjavForSiteNabor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'GZ_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT'
      '      SD.sd_num'
      '     ,p.AG_ID'
      '    , p.SD_ID'
      '    , o.OB_ID'
      '    , o.OB_STATE'
      '    , o.OB_COMMENT'
      '    , SD.CU_ID'
      '    , AG.AG_NAME'
      '    , AG.AG_IS_REMOTE'
      '    , p.AG_ID || '#39'-'#39' || p.SD_ID as SD_ID_COMPOUND'
      '    , RB.RB_NAME_SHORT'
      '    , FM.FM_NAME'
      '    , SD.GZ_ID'
      '    , GZ.GZ_NAME_SHORT'
      '    , SPN.PODACHA_NUMS'
      '    , RBL.RB_IS_LOCKABLE'
      '    , ('
      '        SELECT COUNT(*)'
      '        FROM PODACHA pd'
      '        WHERE       pd.AG_ID = sd.AG_ID'
      '                AND pd.SD_ID = sd.SD_ID'
      '                AND pd.IS_ID = ('
      '                    SELECT pm.PM_CURRENT_ISSUE_SR'
      '                    FROM PARAMS pm'
      '                )'
      '      ) AS SR_IS_CURRENT_ISSUE,'
      '      o.SITE_OBJAV_ADDED'
      'FROM podacha p'
      'LEFT JOIN OBJAV o ON (o.AG_ID = p.AG_ID AND o.SD_ID = p.SD_ID)'
      
        'LEFT JOIN SDELKA SD ON (sd.AG_ID = p.AG_ID AND sd.SD_ID = p.SD_I' +
        'D)'
      'LEFT JOIN AGENT AG ON (AG.AG_ID = p.AG_ID)'
      'LEFT JOIN RUBRIKA RB ON (RB.RB_ID = o.RB_ID)'
      
        'LEFT JOIN RUBRIKA RBL ON (rbl.RB_ID = o.RB_ID AND O.OB_IS_ACTIVE' +
        ' = 1 AND O.FM_ID <> 14)'
      'LEFT JOIN FORMAT FM ON (fm.FM_ID = o.FM_ID)'
      'LEFT JOIN GAZETA GZ ON (GZ.GZ_ID = :GZ_ID)'
      
        'LEFT JOIN SDELKA_PODACHA_NUMS(p.AG_ID, p.SD_ID) SPN ON (spn.SD_I' +
        'D = o.SD_ID)'
      'WHERE'
      '     p.IS_ID = (SELECT is_id FROM GET_CURRENT_ISSUE(:gz_id))'
      'AND  o.OB_TEXT <> '#39#39
      'AND  sd.SD_STATE > 2'
      'AND  sd.AS_ID <> 2'
      'AND  sd.AS_ID <> 1'
      'AND  o.OB_IS_ACTIVE = 1'
      'AND ((o.SITE_OBJAV_ADDED = 0) OR (o.SITE_OBJAV_ADDED IS NULL))'
      
        'AND NOT EXISTS(SELECT 1 FROM OBJAVLENIE ob WHERE ob.PD_ID = p.PD' +
        '_ID)')
    SQLConnection = data.connection
    Left = 136
    Top = 168
    object qObjavForSiteNaborAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qObjavForSiteNaborSD_ID: TIntegerField
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qObjavForSiteNaborOB_ID: TIntegerField
      FieldName = 'OB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qObjavForSiteNaborOB_STATE: TSmallintField
      FieldName = 'OB_STATE'
    end
    object qObjavForSiteNaborOB_COMMENT: TStringField
      FieldName = 'OB_COMMENT'
      Size = 127
    end
    object qObjavForSiteNaborAG_NAME: TStringField
      FieldName = 'AG_NAME'
      Size = 128
    end
    object qObjavForSiteNaborAG_IS_REMOTE: TSmallintField
      FieldName = 'AG_IS_REMOTE'
    end
    object qObjavForSiteNaborSD_ID_COMPOUND: TStringField
      FieldName = 'SD_ID_COMPOUND'
      Size = 23
    end
    object qObjavForSiteNaborRB_NAME_SHORT: TStringField
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object qObjavForSiteNaborFM_NAME: TStringField
      FieldName = 'FM_NAME'
      Size = 128
    end
    object qObjavForSiteNaborGZ_NAME_SHORT: TStringField
      FieldName = 'GZ_NAME_SHORT'
      Size = 64
    end
    object qObjavForSiteNaborPODACHA_NUMS: TStringField
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object qObjavForSiteNaborCU_ID: TIntegerField
      FieldName = 'CU_ID'
      ProviderFlags = []
    end
    object qObjavForSiteNaborGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object qObjavForSiteNaborRB_IS_LOCKABLE: TSmallintField
      DisplayLabel = #1058#1077#1082'. '#8470' '#1057#1058
      FieldName = 'RB_IS_LOCKABLE'
      ProviderFlags = []
    end
    object qObjavForSiteNaborSR_IS_CURRENT_ISSUE: TIntegerField
      FieldName = 'SR_IS_CURRENT_ISSUE'
      ProviderFlags = []
    end
    object qObjavForSiteNaborSITE_OBJAV_ADDED: TSmallintField
      FieldName = 'SITE_OBJAV_ADDED'
    end
    object qObjavForSiteNaborSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
  end
  object prvObjavForSiteNabor: TDataSetProvider
    DataSet = qObjavForSiteNabor
    Left = 272
    Top = 168
  end
  object cdsObjavForSiteNabor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvObjavForSiteNabor'
    Left = 408
    Top = 160
    object cdsObjavForSiteNaborAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsObjavForSiteNaborSD_ID: TIntegerField
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsObjavForSiteNaborOB_ID: TIntegerField
      FieldName = 'OB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsObjavForSiteNaborOB_STATE: TSmallintField
      FieldName = 'OB_STATE'
    end
    object cdsObjavForSiteNaborAG_NAME: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_NAME'
      Size = 128
    end
    object cdsObjavForSiteNaborOB_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'OB_COMMENT'
      Size = 127
    end
    object cdsObjavForSiteNaborAG_IS_REMOTE: TSmallintField
      FieldName = 'AG_IS_REMOTE'
    end
    object cdsObjavForSiteNaborSD_ID_COMPOUND: TStringField
      DisplayLabel = #1050#1086#1076' '#1089#1076#1077#1083#1082#1080
      FieldName = 'SD_ID_COMPOUND'
      Size = 23
    end
    object cdsObjavForSiteNaborRB_NAME_SHORT: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object cdsObjavForSiteNaborFM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldName = 'FM_NAME'
      Size = 128
    end
    object cdsObjavForSiteNaborGZ_NAME_SHORT: TStringField
      DisplayLabel = #1043#1072#1079#1077#1090#1072
      FieldName = 'GZ_NAME_SHORT'
      Size = 64
    end
    object cdsObjavForSiteNaborPODACHA_NUMS: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object cdsObjavForSiteNaborCU_ID: TIntegerField
      FieldName = 'CU_ID'
      ProviderFlags = []
    end
    object cdsObjavForSiteNaborGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object cdsObjavForSiteNaborRB_IS_LOCKABLE: TSmallintField
      DisplayLabel = #1055#1088#1080#1086#1088#1080#1090#1077#1090
      FieldName = 'RB_IS_LOCKABLE'
      ProviderFlags = []
    end
    object cdsObjavForSiteNaborSR_IS_CURRENT_ISSUE: TIntegerField
      DisplayLabel = #1058#1077#1082'. '#8470' '#1057#1058
      FieldName = 'SR_IS_CURRENT_ISSUE'
      ProviderFlags = []
    end
    object cdsObjavForSiteNaborSITE_OBJAV_ADDED: TSmallintField
      FieldName = 'SITE_OBJAV_ADDED'
    end
    object cdsObjavForSiteNaborSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
  end
  object dsObjavForSiteNabor: TDataSource
    DataSet = cdsObjavForSiteNabor
    Left = 544
    Top = 160
  end
end
