object frmObjavlenieHistory: TfrmObjavlenieHistory
  Left = 692
  Top = 247
  Width = 789
  Height = 361
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1081' '#1089#1076#1077#1083#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    773
    323)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 4
    Top = 5
    Width = 124
    Height = 289
    Anchors = [akLeft, akTop, akBottom]
    Brush.Color = clSkyBlue
    Pen.Color = clNavy
  end
  object Label1: TLabel
    Left = 11
    Top = 10
    Width = 89
    Height = 13
    Caption = #1055#1086#1076#1072#1095#1080' '#1089#1076#1077#1083#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Shape2: TShape
    Left = 3
    Top = 297
    Width = 775
    Height = 1
    Anchors = [akLeft, akRight, akBottom]
    Pen.Color = clBtnShadow
  end
  object grPodacha: TDBGridEh
    Left = 5
    Top = 27
    Width = 122
    Height = 266
    Anchors = [akLeft, akTop, akBottom]
    Color = clBtnFace
    DataSource = dsSdelkaPodacha
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghHighlightFocus, dghClearSelection]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'IS_NAME_COMPOSED'
        Footers = <>
        Title.Color = clSkyBlue
        Width = 102
      end>
  end
  inline sdelkaPubl: TfrmSdelkaPubl
    Left = 132
    Top = 4
    Width = 635
    Height = 290
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    inherited Panel2: TPanel
      Width = 635
      Height = 290
      inherited Shape1: TShape
        Top = 1
        Width = 635
        Height = 289
        Align = alNone
        Anchors = [akLeft, akTop, akRight, akBottom]
      end
      inherited Label1: TLabel
        Top = 6
      end
      inherited btAdd: TBitBtn
        Left = 546
        Top = 4
      end
      inherited btDelete: TBitBtn
        Left = 604
        Top = 4
      end
      inherited btEdit: TBitBtn [5]
        Left = 575
        Top = 4
      end
      inherited btAddPovtor: TBitBtn [6]
        Left = 483
        Top = 4
      end
      inherited btView: TBitBtn [7]
        Left = 454
        Top = 4
      end
      inherited btHistory: TBitBtn [8]
        Left = 386
        Top = 4
        Visible = False
      end
      inherited grObjavs: TDBGridEh [9]
        Left = 1
        Width = 627
        Height = 262
        Align = alNone
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
            Width = 18
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
            Width = 85
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
            Width = 136
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
            Width = 121
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
    end
    inherited qryObjav: TSQLQuery
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
        '/*    left join OBJAV_STATE os'
        '    on (ob.OB_STATE = os.OS_ID)'
        ''
        '    left join FORMAT fm_t'
        '    on (ob.FM_ID = fm_t.FM_ID)'
        ''
        '    left join RUBRIKA rb_t'
        '    on (ob.RB_ID = rb_t.RB_ID)'
        '*/'
        '    , OBJAV_STATE os, FORMAT fm_t, RUBRIKA rb_t'
        ''
        'where'
        '    OB.AG_ID=:AG_ID and'
        '    OB.SD_ID=:SD_ID and'
        '    OB.OB_PARENT is null'
        ''
        '/*    and db.AG_ID = ob.AG_ID'
        '    and DB.SD_ID = OB.SD_ID'
        '    and DB.OB_PARENT = OB.OB_ID*/'
        ''
        '    and os.OS_ID = ob.OB_STATE'
        '    and fm_t.FM_ID = ob.FM_ID'
        '    and rb_t.RB_ID = ob.RB_ID'
        '/*    and rb_td.RB_ID = db.RB_ID'
        '    and rs.RS_ID = ob.RS_ID*/'
        ''
        'union'
        ''
        'select'
        '      1                         as IS_OBJAVLENIE'
        '    , -1                        as AG_ID'
        '    , -1                        as SD_ID'
        '    , obj.OBJAV_ID              as OB_ID'
        '    , rb_m.GZ_ID                as GZ_ID'
        '    , cast(-1 as smallint)      as OB_STATE'
        '    , cast('#39#39' as varchar(64))   as OB_STATE_NAME'
        '    , cast(1 as smallint)       as OB_IS_ACTIVE'
        '    , fm_m.FM_NAME              as FM_NAME'
        '    , rb_m.RB_NAME_SHORT        as RB_NAME'
        '    , cast('#39#39' as varchar(128))  as RS_NAME'
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
        'where'
        '    obj.PD_ID = :CURRENT_PD_ID'
        ''
        '/*    and pd.PD_ID = obj.PD_ID'
        '    and fm_m.FM_ID = obj.FM_ID'
        '    and rb_m.RB_ID = obj.RB_ID'
        '    and rb_md.RB_ID = obj.DOUBLE_RB_ID'
        '    and obj_c.CONTENT_ID = obj.CONTENT_ID'
        '*/')
    end
  end
  object btCancel: TBitBtn
    Left = 694
    Top = 299
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 2
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000B0000000B0000000100
      04000000000058000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF0FFFFF0FF0
      0000F000FFF000F0000000000F0000000000F000000000F00000FF0000000FF0
      0000FFF00000FFF00000FF0000000FF00000F000000000F0000000000F000000
      0000F000FFF000F00000FF0FFFFF0FF00000}
  end
  object qrySdelkaPodacha: TSQLQuery
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
      '    PD.*,'
      '    ISS.IS_NAME,'
      '    ISS.IS_NAME_COMPOSED,'
      '    ISS.IS_DATE'
      'FROM'
      '    PODACHA PD'
      '    INNER JOIN ISSUE ISS'
      '    ON (PD.IS_ID=ISS.IS_ID)'
      'WHERE'
      '        AG_ID = :AG_ID'
      '    AND SD_ID = :SD_ID'
      'ORDER BY'
      '    PD.IS_ID'
      '')
    SQLConnection = data.connection
    Left = 56
    Top = 64
    object qrySdelkaPodachaGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
      Required = True
    end
    object qrySdelkaPodachaIS_ID: TIntegerField
      FieldName = 'IS_ID'
      Required = True
    end
    object qrySdelkaPodachaAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Required = True
    end
    object qrySdelkaPodachaSD_ID: TIntegerField
      FieldName = 'SD_ID'
      Required = True
    end
    object qrySdelkaPodachaPD_FREE_OF_CHARGE: TSmallintField
      FieldName = 'PD_FREE_OF_CHARGE'
      Required = True
    end
    object qrySdelkaPodachaPD_ID: TIntegerField
      FieldName = 'PD_ID'
      Required = True
    end
    object qrySdelkaPodachaPD_ADDDATE: TSQLTimeStampField
      FieldName = 'PD_ADDDATE'
      Required = True
    end
    object qrySdelkaPodachaPD_IS_DONE: TSmallintField
      FieldName = 'PD_IS_DONE'
      Required = True
    end
    object qrySdelkaPodachaIS_NAME: TStringField
      FieldName = 'IS_NAME'
      Required = True
      Size = 10
    end
    object qrySdelkaPodachaIS_NAME_COMPOSED: TStringField
      FieldName = 'IS_NAME_COMPOSED'
      Size = 25
    end
    object qrySdelkaPodachaIS_DATE: TSQLTimeStampField
      FieldName = 'IS_DATE'
      Required = True
    end
  end
  object prvSdelkaPodacha: TDataSetProvider
    DataSet = qrySdelkaPodacha
    Left = 56
    Top = 112
  end
  object cdsSdelkaPodacha: TClientDataSet
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
    ProviderName = 'prvSdelkaPodacha'
    ReadOnly = True
    AfterScroll = cdsSdelkaPodachaAfterScroll
    Left = 56
    Top = 160
    object cdsSdelkaPodachaGZ_ID: TSmallintField
      FieldName = 'GZ_ID'
      Required = True
    end
    object cdsSdelkaPodachaIS_ID: TIntegerField
      FieldName = 'IS_ID'
      Required = True
    end
    object cdsSdelkaPodachaAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Required = True
    end
    object cdsSdelkaPodachaSD_ID: TIntegerField
      FieldName = 'SD_ID'
      Required = True
    end
    object cdsSdelkaPodachaPD_FREE_OF_CHARGE: TSmallintField
      FieldName = 'PD_FREE_OF_CHARGE'
      Required = True
    end
    object cdsSdelkaPodachaPD_ID: TIntegerField
      FieldName = 'PD_ID'
      Required = True
    end
    object cdsSdelkaPodachaPD_ADDDATE: TSQLTimeStampField
      FieldName = 'PD_ADDDATE'
      Required = True
    end
    object cdsSdelkaPodachaPD_IS_DONE: TSmallintField
      FieldName = 'PD_IS_DONE'
      Required = True
    end
    object cdsSdelkaPodachaIS_NAME: TStringField
      FieldName = 'IS_NAME'
      Required = True
      Size = 10
    end
    object cdsSdelkaPodachaIS_NAME_COMPOSED: TStringField
      DisplayLabel = #8470' '#1075#1072#1079#1077#1090#1099
      FieldName = 'IS_NAME_COMPOSED'
      Size = 25
    end
    object cdsSdelkaPodachaIS_DATE: TSQLTimeStampField
      FieldName = 'IS_DATE'
      Required = True
    end
  end
  object dsSdelkaPodacha: TDataSource
    DataSet = cdsSdelkaPodacha
    Left = 56
    Top = 208
  end
end
