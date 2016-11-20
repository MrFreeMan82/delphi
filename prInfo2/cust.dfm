object frmCust: TfrmCust
  Left = 0
  Top = 0
  Width = 748
  Height = 475
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  DesignSize = (
    748
    475)
  object pnlCustPhone: TPanel
    Left = 548
    Top = 38
    Width = 197
    Height = 365
    Anchors = [akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      197
      365)
    object Shape1: TShape
      Left = 0
      Top = 0
      Width = 197
      Height = 23
      Align = alTop
      Brush.Color = clSkyBlue
      Pen.Color = clNavy
    end
    object Label2: TLabel
      Left = 6
      Top = 5
      Width = 61
      Height = 13
      Caption = #1058#1077#1083#1077#1092#1086#1085#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btDeletePhoneManager: TBitBtn
      Left = 168
      Top = 3
      Width = 25
      Height = 17
      TabOrder = 2
      TabStop = False
      Visible = False
      OnClick = btDeletePhoneManagerClick
      Glyph.Data = {
        6A000000424D6A000000000000003E000000280000000B0000000B0000000100
        0100000000002C0000000000000000000000020000000000000000000000FFFF
        FF00FFE00000FFE00000FFE00000FFE00000002000000020000000200000FFE0
        0000FFE00000FFE00000FFE00000}
    end
    object btDeletePhone: TBitBtn
      Left = 168
      Top = 3
      Width = 25
      Height = 17
      Anchors = [akTop, akRight]
      TabOrder = 0
      TabStop = False
      OnClick = btDeletePhoneClick
      Glyph.Data = {
        6A000000424D6A000000000000003E000000280000000B0000000B0000000100
        0100000000002C0000000000000000000000020000000000000000000000FFFF
        FF00FFE00000FFE00000FFE00000FFE00000002000000020000000200000FFE0
        0000FFE00000FFE00000FFE00000}
    end
    object DBGrid3: TDBGridEh
      Left = 0
      Top = 23
      Width = 197
      Height = 342
      TabStop = False
      Align = alClient
      AutoFitColWidths = True
      Color = clBtnFace
      DataSource = data.dsCustPhone
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghHighlightFocus, dghClearSelection]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'CP_NUMBER'
          Footers = <>
          Title.Caption = #1058#1077#1083#1077#1092#1086#1085
          Title.Color = clSkyBlue
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = 'CP_ADDDATE'
          Footers = <>
          Title.Color = clSkyBlue
          Width = 99
        end>
    end
  end
  object pnlCust: TPanel
    Left = 3
    Top = 38
    Width = 541
    Height = 365
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      541
      365)
    object Shape3: TShape
      Left = 0
      Top = 0
      Width = 541
      Height = 23
      Align = alTop
      Brush.Color = clSkyBlue
      Pen.Color = clNavy
    end
    object Label3: TLabel
      Left = 6
      Top = 5
      Width = 51
      Height = 13
      Caption = #1050#1083#1080#1077#1085#1090#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btDeleteCust: TBitBtn
      Left = 512
      Top = 3
      Width = 25
      Height = 17
      Anchors = [akTop, akRight]
      TabOrder = 2
      TabStop = False
      OnClick = btDeleteCustClick
      Glyph.Data = {
        6A000000424D6A000000000000003E000000280000000B0000000B0000000100
        0100000000002C0000000000000000000000020000000000000000000000FFFF
        FF00FFE00000FFE00000FFE00000FFE00000002000000020000000200000FFE0
        0000FFE00000FFE00000FFE00000}
    end
    object DBGrid2: TDBGridEh
      Left = 0
      Top = 23
      Width = 541
      Height = 342
      Align = alClient
      AutoFitColWidths = True
      Color = clBtnFace
      DataSource = data.dsCust
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghHighlightFocus, dghClearSelection]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid2CellClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'CU_ID_COMPOUND'
          Footers = <>
          Title.Color = clSkyBlue
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'CU_COMPANY_ID'
          Footers = <>
          Title.Caption = #1048#1044
          Title.Color = clSkyBlue
          Width = 59
        end
        item
          EditButtons = <>
          FieldName = 'CU_NAME'
          Footers = <>
          Title.Color = clSkyBlue
          Width = 137
        end
        item
          EditButtons = <>
          FieldName = 'CU_OKPO'
          Footers = <>
          Title.Caption = #1028#1044#1056#1055#1054#1059
          Title.Color = clSkyBlue
          Width = 84
        end
        item
          EditButtons = <>
          FieldName = 'CUST_BONUS'
          Footers = <>
          Title.Color = clSkyBlue
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'CU_INFO'
          Footers = <>
          Title.Color = clSkyBlue
          Width = 138
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'HAS_CUST_UNIQUE'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          Title.Caption = #1041#1091#1093'. '#1076#1072#1085#1085#1099#1077
          Title.Color = clSkyBlue
          Width = 69
        end>
    end
    object btEditCust: TBitBtn
      Left = 484
      Top = 3
      Width = 25
      Height = 17
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnClick = btEditCustClick
      Glyph.Data = {
        52000000424D52000000000000003E000000280000000B000000050000000100
        010000000000140000000000000000000000020000000000000000000000FFFF
        FF0080200000C0600000E0E00000F1E00000FBE00000}
    end
    object btRefreshCust: TBitBtn
      Left = 456
      Top = 3
      Width = 25
      Height = 17
      Anchors = [akTop, akRight]
      TabOrder = 3
      TabStop = False
      OnClick = btRefreshCustClick
      Glyph.Data = {
        DE000000424DDE0000000000000076000000280000000E0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
        FF00FFFFF00FFF70FF00FFF77000FF000F00FF0000000FF00700F0000000FFFF
        0000707FF00FFFFF000000FFF0FF0FFF000000FFFFF00FF7070000FFFF000000
        0F00700FF0000000FF00F000FF00077FFF00FF07FFF00FFFFF00FFFFFFFF0FFF
        FF00}
    end
  end
  object btAddCust: TBitBtn
    Left = 208
    Top = 368
    Width = 21
    Height = 19
    TabOrder = 2
    TabStop = False
    Visible = False
    OnClick = btAddCustClick
    Glyph.Data = {
      62000000424D62000000000000003E0000002800000009000000090000000100
      010000000000240000000000000000000000020000000000000000000000FFFF
      FF00E3800000E3800000E3800000000000000000000000000000E3800000E380
      0000E3800000}
  end
  object btAddPhone: TBitBtn
    Left = 319
    Top = 368
    Width = 21
    Height = 19
    TabOrder = 3
    TabStop = False
    Visible = False
    OnClick = btAddPhoneClick
    Glyph.Data = {
      62000000424D62000000000000003E0000002800000009000000090000000100
      010000000000240000000000000000000000020000000000000000000000FFFF
      FF00E3800000E3800000E3800000000000000000000000000000E3800000E380
      0000E3800000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 748
    Height = 34
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      748
      34)
    object Label1: TLabel
      Left = 174
      Top = 11
      Width = 159
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077', '#1090#1077#1083#1077#1092#1086#1085' '#1080#1083#1080' '#1028#1044#1056#1055#1054
    end
    object Shape7: TShape
      Left = 0
      Top = 0
      Width = 748
      Height = 1
      Align = alTop
      Pen.Color = clBtnShadow
    end
    object Shape5: TShape
      Left = 0
      Top = 33
      Width = 748
      Height = 1
      Align = alBottom
      Pen.Color = clBtnShadow
    end
    object edSearch: TMaskEdit
      Left = 346
      Top = 7
      Width = 145
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      OnKeyPress = edSearchKeyPress
    end
    object btSearch: TBitBtn
      Left = 499
      Top = 5
      Width = 89
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1055#1086#1080#1089#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = False
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
    object chkAllAgents: TCheckBox
      Left = 8
      Top = 8
      Width = 97
      Height = 17
      Caption = #1042#1089#1077' '#1072#1075#1077#1085#1090#1099
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 407
    Width = 748
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    DesignSize = (
      748
      34)
    object Shape9: TShape
      Left = 0
      Top = 0
      Width = 748
      Height = 1
      Align = alTop
      Pen.Color = clBtnShadow
    end
    object Label4: TLabel
      Left = 6
      Top = 12
      Width = 59
      Height = 13
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 74
      Top = 12
      Width = 50
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 282
      Top = 12
      Width = 47
      Height = 13
      Caption = #1028#1044#1056#1055#1054#1059
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Shape8: TShape
      Left = 69
      Top = 5
      Width = 1
      Height = 26
      Pen.Color = clBtnShadow
    end
    object Label7: TLabel
      Left = 447
      Top = 12
      Width = 15
      Height = 13
      Caption = #1048#1044
    end
    object edNewCust: TDBEditEh
      Left = 127
      Top = 7
      Width = 152
      Height = 21
      EditButtons = <>
      TabOrder = 0
      Visible = True
      OnKeyPress = edNewCustKeyPress
    end
    object edNewCustOKPO: TDBEditEh
      Left = 333
      Top = 7
      Width = 110
      Height = 21
      EditButtons = <>
      TabOrder = 1
      Visible = True
      OnKeyPress = edNewCustKeyPress
    end
    object edNewPhone: TMaskEdit
      Left = 619
      Top = 7
      Width = 117
      Height = 21
      Anchors = [akRight, akBottom]
      EditMask = '!000-00-00;0;_'
      MaxLength = 9
      TabOrder = 3
      OnKeyPress = edNewPhoneKeyPress
    end
    object txtCompanyID: TEdit
      Left = 466
      Top = 7
      Width = 95
      Height = 21
      TabOrder = 2
      OnKeyPress = edNewCustKeyPress
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 441
    Width = 748
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
    object Shape11: TShape
      Left = 0
      Top = 0
      Width = 748
      Height = 1
      Align = alTop
      Pen.Color = clBtnShadow
    end
    object cbBonusEnabled: TDBCheckBox
      Left = 9
      Top = 11
      Width = 115
      Height = 17
      TabStop = False
      Alignment = taLeftJustify
      Caption = #1091#1095#1080#1090#1099#1074#1072#1090#1100' '#1073#1086#1085#1091#1089#1099
      DataField = 'CU_BONUS_ENABLED'
      DataSource = data.dsCust
      ReadOnly = True
      TabOrder = 0
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object btSave: TBitBtn
      Left = 131
      Top = 6
      Width = 27
      Height = 25
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = btSaveClick
      Glyph.Data = {
        CE000000424DCE0000000000000076000000280000000B0000000B0000000100
        04000000000058000000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
        0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
        0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
        0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
    end
    object BitBtn1: TBitBtn
      Left = 163
      Top = 6
      Width = 224
      Height = 25
      Caption = #1057#1085#1103#1090#1100' '#1073#1086#1085#1091#1089'/'#1078#1091#1088#1085#1072#1083' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1073#1086#1085#1091#1089#1086#1074
      Enabled = False
      TabOrder = 2
      TabStop = False
      OnClick = BitBtn1Click
    end
    object btPrintAcc: TBitBtn
      Tag = 1
      Left = 392
      Top = 6
      Width = 129
      Height = 25
      Caption = #1053#1072#1087#1077#1095#1072#1090#1072#1090#1100' '#1089#1095#1105#1090
      TabOrder = 3
      TabStop = False
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000000000000000000C0C0C000808080000000
        000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000C0C0C000C0C0C00000000000000000008080
        8000808080000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000000000C0C0C000C0C0C0000000000000000000C0C0C000808080000000
        000000000000808080008080800000000000FF00FF00FF00FF00FF00FF000000
        0000C0C0C0000000000000000000C0C0C000C0C0C000C0C0C000808080008080
        80008080800000000000000000008080800000000000FF00FF00FF00FF008080
        800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000808080008080
        80008080800080808000808080000000000000000000FF00FF00000000000000
        0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00808080008080
        800080808000808080008080800080808000000000000000000080808000FFFF
        FF00C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00C0C0C000C0C0C0008080
        800080808000808080008080800080808000808080000000000080808000C0C0
        C000FFFFFF00C0C0C000C0C0C000C0C0C0000000FF000000FF00C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000808080008080800000000000808080008080
        8000C0C0C000C0C0C00000FF000000FF0000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C00000000000C0C0C000C0C0C0008080800000000000FF00FF00FF00
        FF0080808000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFF
        FF00FFFFFF0000000000C0C0C00080808000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008080800080808000FFFFFF00C0C0C00080808000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00808080008080800080808000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
        FF00FFFFFF00FFFFFF0080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
        80008080800080808000FF00FF00FF00FF00FF00FF00FF00FF00}
    end
  end
  object custActions: TActionList
    Left = 152
    Top = 136
    object actFindCust: TAction
      Caption = 'actFindCust'
      ShortCut = 16454
      SecondaryShortCuts.Strings = (
        'Ctrl+'#1040)
      OnExecute = actFindCustExecute
    end
  end
  object qCheckOKPO: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ag_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'okpo'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      
        'select count(*) from cust c where c.ag_id = :ag_id and c.CU_OKPO' +
        ' = :okpo')
    SQLConnection = data.connection
    Left = 176
    Top = 232
  end
  object popAddCust: TPopupMenu
    Left = 280
    Top = 112
    object nAddCust: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1077#1073#1077' '#1074' '#1073#1072#1079#1091
      OnClick = nAddCustClick
    end
  end
  object qCopyPhones: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ag_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cu_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AG_SRC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CU_SRC'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      
        'INSERT INTO CUST_PHONE (AG_ID, CU_ID, CP_NUMBER, CP_ADDDATE, CP_' +
        'IS_DOLJNIK)'
      'SELECT :ag_id, :cu_id, cp.CP_NUMBER, current_timestamp, 0 '
      'FROM cust_phone cp '
      'WHERE cp.AG_ID = :AG_SRC '
      'AND cp.CU_ID = :CU_SRC')
    SQLConnection = data.connection
    Left = 264
    Top = 152
  end
  object qCheckCompanyID: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ag_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'com_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      
        'select count(*) from cust c where c.ag_id = :ag_id and c.CU_COMP' +
        'ANY_ID = :com_id')
    SQLConnection = data.connection
    Left = 176
    Top = 272
  end
end
