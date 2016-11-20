object frmDesign: TfrmDesign
  Left = 797
  Top = 314
  Width = 882
  Height = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel14: TPanel
    Left = 0
    Top = 0
    Width = 866
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Shape78: TShape
      Left = 0
      Top = 34
      Width = 866
      Height = 1
      Align = alBottom
      Pen.Color = clBtnShadow
    end
    object Label66: TLabel
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
    object Label81: TLabel
      Left = 120
      Top = 10
      Width = 35
      Height = 13
      Caption = #1043#1072#1079#1077#1090#1072
    end
    object Shape61: TShape
      Left = 110
      Top = 3
      Width = 1
      Height = 27
      Pen.Color = clBtnShadow
    end
    object edDesignerSearch: TDBEditEh
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
      OnKeyPress = edDesignerSearchKeyPress
    end
    object cbShowOblogka: TDBCheckBoxEh
      Left = 344
      Top = 8
      Width = 130
      Height = 17
      AlwaysShowBorder = True
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1086#1073#1083#1086#1078#1082#1091
      Flat = True
      TabOrder = 1
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = cbShowOblogkaClick
    end
    object cbGazetaDesign: TDBLookupComboboxEh
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
      TabOrder = 2
      Visible = True
    end
  end
  object grSdelkaForDesign: TDBGridEh
    Left = 0
    Top = 35
    Width = 866
    Height = 260
    Align = alClient
    AutoFitColWidths = True
    DataSource = dsModuliDesign
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
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDblClick = btEditObjavDesignClick
    OnDrawColumnCell = grSdelkaForDesignDrawColumnCell
    OnKeyPress = grSdelkaForDesignKeyPress
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
        Width = 59
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
        Width = 60
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
        Width = 214
      end>
  end
  object Panel16: TPanel
    Left = 0
    Top = 295
    Width = 866
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Shape77: TShape
      Left = 0
      Top = 0
      Width = 866
      Height = 1
      Align = alTop
      Pen.Color = clBtnShadow
    end
    object DBText2: TDBText
      Left = 656
      Top = 8
      Width = 65
      Height = 17
    end
    object btAddModule: TBitBtn
      Left = 5
      Top = 6
      Width = 130
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1084#1086#1076#1091#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btAddModuleClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
        9999000000000009999900333333333099990B033333333309990FB033333333
        30990BFB0333333333090FBFB000000000000BFBFBFBFB0999990FBFBFBFBF09
        99990BFB00000009999990009999999900099999999999999009999999990999
        0909999999999000999999999999999999999999999999999999}
    end
    object btRefreshObjavsDesigner: TBitBtn
      Left = 141
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
      TabOrder = 1
      OnClick = btRefreshObjavsDesignerClick
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
    object btEditObjavDesign: TBitBtn
      Left = 261
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
      TabOrder = 2
      OnClick = btEditObjavDesignClick
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
    object btFindDesigner: TBitBtn
      Left = 382
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
      TabOrder = 3
      OnClick = btFindDesignerClick
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
  object qryModuliDesign: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'GZ_ID'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'select'
      '                  SD.sd_num'
      #9', SD.AG_ID'
      #9', SD.SD_ID'
      #9', SD.CU_ID'
      #9', OBJ.OBJAV_ID as OB_ID'
      #9', AG.AG_NAME'
      #9', AG.AG_IS_REMOTE'
      #9', OBN.AG_ID || '#39'-'#39' || OBN.SD_ID as SD_ID_COMPOUND'
      #9', RB.RB_NAME_SHORT'
      #9', FM.FM_NAME'
      #9', SD.GZ_ID'
      #9', GZ.GZ_NAME_SHORT'
      #9', SPN.PODACHA_NUMS'
      #9', RB.RB_IS_OBLOGKA'
      #9', RB.RB_IS_LOCKABLE'
      #9', ('
      #9#9'select count(*)'
      #9#9'from PODACHA pd'
      #9#9'where       pd.AG_ID = sd.AG_ID'
      #9#9#9#9'and pd.SD_ID = sd.SD_ID'
      #9#9#9#9'and pd.IS_ID = ('
      #9#9#9#9#9'select pm.PM_CURRENT_ISSUE_SR'
      #9#9#9#9#9'from PARAMS pm'
      #9#9#9#9')'
      #9'  ) as SR_IS_CURRENT_ISSUE'
      '    ,obj.OB_STATE'
      '    ,obj.OB_STATE_TXT'
      'from'
      #9'OBJAV_LIST_FOR_DESIGN(:GZ_ID) OBN'
      ''
      #9'left join OBJAVLENIE OBJ'
      #9'on (OBN.OB_ID = OBJ.OBJAV_ID)'
      #9
      #9'left join PODACHA PD'
      #9'on (OBJ.PD_ID = PD.PD_ID)'
      ''
      #9'left join SDELKA SD'
      #9'on (PD.AG_ID = SD.AG_ID and PD.SD_ID = SD.SD_ID)'
      ''
      #9'left join AGENT AG'
      #9'on (PD.AG_ID = AG.AG_ID)'
      ''
      #9'left join RUBRIKA RB'
      #9'on (OBJ.RB_ID = RB.RB_ID)'
      ''
      #9'left join FORMAT FM'
      #9'on (OBJ.FM_ID = FM.FM_ID)'
      ''
      #9'left join GAZETA GZ'
      #9'on (GZ.GZ_ID = SD.GZ_ID)'
      ''
      #9'left join SDELKA_PODACHA_NUMS(PD.AG_ID, PD.SD_ID) SPN'
      #9'on (PD.SD_ID = SPN.SD_ID)'
      
        'order by obj.OB_STATE desc, obj.OB_STATE_TXT desc, RB.RB_NAME_SH' +
        'ORT')
    SQLConnection = data.connection
    Left = 48
    Top = 96
    object qryModuliDesignAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object qryModuliDesignSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object qryModuliDesignOB_ID: TIntegerField
      FieldName = 'OB_ID'
    end
    object qryModuliDesignCU_ID: TIntegerField
      FieldName = 'CU_ID'
    end
    object qryModuliDesignAG_NAME: TStringField
      FieldName = 'AG_NAME'
      Size = 128
    end
    object qryModuliDesignAG_IS_REMOTE: TSmallintField
      FieldName = 'AG_IS_REMOTE'
    end
    object qryModuliDesignSD_ID_COMPOUND: TStringField
      FieldName = 'SD_ID_COMPOUND'
      Size = 23
    end
    object qryModuliDesignRB_NAME_SHORT: TStringField
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object qryModuliDesignFM_NAME: TStringField
      FieldName = 'FM_NAME'
      Size = 128
    end
    object qryModuliDesignGZ_NAME_SHORT: TStringField
      FieldName = 'GZ_NAME_SHORT'
      Size = 64
    end
    object qryModuliDesignPODACHA_NUMS: TStringField
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object qryModuliDesignRB_IS_OBLOGKA: TSmallintField
      FieldName = 'RB_IS_OBLOGKA'
      ProviderFlags = []
    end
    object qryModuliDesignGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object qryModuliDesignRB_IS_LOCKABLE: TSmallintField
      DisplayLabel = #1055#1088#1080#1086#1088#1080#1090#1077#1090
      FieldName = 'RB_IS_LOCKABLE'
      ProviderFlags = []
    end
    object qryModuliDesignSR_IS_CURRENT_ISSUE: TIntegerField
      FieldName = 'SR_IS_CURRENT_ISSUE'
      ProviderFlags = []
    end
    object qryModuliDesignSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
    object qryModuliDesignOB_STATE: TIntegerField
      FieldName = 'OB_STATE'
    end
    object qryModuliDesignOB_STATE_TXT: TIntegerField
      FieldName = 'OB_STATE_TXT'
    end
  end
  object prvModuliDesign: TDataSetProvider
    DataSet = qryModuliDesign
    Left = 184
    Top = 96
  end
  object cdsModuliDesign: TClientDataSet
    Aggregates = <>
    Filter = 'RB_IS_OBLOGKA=0'
    Filtered = True
    Params = <
      item
        DataType = ftInteger
        Name = 'GZ_ID'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'prvModuliDesign'
    ReadOnly = True
    Left = 320
    Top = 96
    object cdsModuliDesignAG_ID: TIntegerField
      FieldName = 'AG_ID'
    end
    object cdsModuliDesignSD_ID: TIntegerField
      FieldName = 'SD_ID'
    end
    object cdsModuliDesignOB_ID: TIntegerField
      FieldName = 'OB_ID'
    end
    object cdsModuliDesignCU_ID: TIntegerField
      FieldName = 'CU_ID'
    end
    object cdsModuliDesignAG_IS_REMOTE: TSmallintField
      FieldName = 'AG_IS_REMOTE'
    end
    object cdsModuliDesignGZ_NAME_SHORT: TStringField
      FieldName = 'GZ_NAME_SHORT'
      Size = 64
    end
    object cdsModuliDesignAG_NAME: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = 'AG_NAME'
      Size = 128
    end
    object cdsModuliDesignSD_ID_COMPOUND: TStringField
      DisplayLabel = #1057#1076#1077#1083#1082#1072
      FieldName = 'SD_ID_COMPOUND'
      Size = 23
    end
    object cdsModuliDesignRB_NAME_SHORT: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldName = 'RB_NAME_SHORT'
      Size = 64
    end
    object cdsModuliDesignFM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldName = 'FM_NAME'
      Size = 128
    end
    object cdsModuliDesignPODACHA_NUMS: TStringField
      DisplayLabel = #1055#1086#1076#1072#1095#1080
      FieldName = 'PODACHA_NUMS'
      Size = 128
    end
    object cdsModuliDesignRB_IS_OBLOGKA: TSmallintField
      FieldName = 'RB_IS_OBLOGKA'
      ProviderFlags = []
    end
    object cdsModuliDesignGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
    end
    object cdsModuliDesignRB_IS_LOCKABLE: TSmallintField
      DisplayLabel = #1055#1088#1080#1086#1088#1080#1090#1077#1090
      FieldName = 'RB_IS_LOCKABLE'
      ProviderFlags = []
    end
    object cdsModuliDesignSR_IS_CURRENT_ISSUE: TIntegerField
      DisplayLabel = #1058#1077#1082'. '#8470' '#1057#1058
      FieldName = 'SR_IS_CURRENT_ISSUE'
      ProviderFlags = []
    end
    object cdsModuliDesignSD_NUM: TStringField
      FieldName = 'SD_NUM'
      Size = 64
    end
    object cdsModuliDesignOB_STATE: TIntegerField
      FieldName = 'OB_STATE'
    end
    object cdsModuliDesignOB_STATE_TXT: TIntegerField
      FieldName = 'OB_STATE_TXT'
    end
  end
  object dsModuliDesign: TDataSource
    DataSet = cdsModuliDesign
    Left = 456
    Top = 96
  end
end
