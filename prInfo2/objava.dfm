object frmObjava: TfrmObjava
  Left = 0
  Top = 0
  Width = 606
  Height = 446
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object pnlHolder: TPanel
    Left = 0
    Top = 0
    Width = 606
    Height = 446
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlAgent: TPanel
      Left = 0
      Top = 410
      Width = 606
      Height = 36
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 5
      Visible = False
      object Shape6: TShape
        Left = 0
        Top = 0
        Width = 606
        Height = 1
        Align = alTop
        Pen.Color = clBtnShadow
      end
      object btCancelAg: TBitBtn
        Left = 485
        Top = 7
        Width = 115
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ModalResult = 2
        ParentFont = False
        TabOrder = 2
        OnClick = btCancelAgClick
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          04000000000058000000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF0FFFFF0FF0
          0000F000FFF000F0000000000F0000000000F000000000F00000FF0000000FF0
          0000FFF00000FFF00000FF0000000FF00000F000000000F0000000000F000000
          0000F000FFF000F00000FF0FFFFF0FF00000}
      end
      object btDone: TBitBtn
        Left = 365
        Top = 7
        Width = 115
        Height = 25
        Caption = #1054#1082
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ModalResult = 1
        ParentFont = False
        TabOrder = 1
        OnClick = btDoneClick
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          04000000000058000000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
          0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
          0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
          0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
      end
      object btMore: TBitBtn
        Left = 246
        Top = 7
        Width = 115
        Height = 25
        Caption = #1045#1097#1105
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ModalResult = 4
        ParentFont = False
        TabOrder = 0
        OnClick = btDoneClick
        Glyph.Data = {
          62000000424D62000000000000003E0000002800000009000000090000000100
          010000000000240000000000000000000000020000000000000000000000FFFF
          FF00E3800000E3800000E3800000000000000000000000000000E3800000E380
          0000E3800000}
      end
    end
    object pnlText: TPanel
      Left = 0
      Top = 143
      Width = 606
      Height = 231
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 4
      object Label5: TLabel
        Left = 9
        Top = 4
        Width = 29
        Height = 13
        Caption = #1058#1077#1082#1089#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblIsReadOnly: TLabel
        Left = 331
        Top = 3
        Width = 102
        Height = 13
        Caption = #1058#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1095#1090#1077#1085#1080#1103'?'
        Visible = False
      end
      object mmText: TDBMemo
        Left = 4
        Top = 20
        Width = 598
        Height = 206
        BevelKind = bkSoft
        BorderStyle = bsNone
        Color = clBtnFace
        DataField = 'OB_TEXT'
        DataSource = dsObjav
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyPress = edCommentKeyPress
      end
      object rchText: TDBRichEdit
        Left = 4
        Top = 20
        Width = 598
        Height = 206
        BevelKind = bkFlat
        BorderStyle = bsNone
        DataField = 'OB_TEXT'
        DataSource = dsObjav
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        PlainText = True
        PopupMenu = popCopy
        ScrollBars = ssVertical
        TabOrder = 0
        OnEnter = rchTextEnter
        OnKeyPress = rchTextKeyPress
      end
    end
    object pnlCopyTo: TPanel
      Left = 0
      Top = 77
      Width = 606
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object Shape2: TShape
        Left = 0
        Top = 32
        Width = 606
        Height = 1
        Align = alBottom
        Pen.Color = clBtnShadow
      end
      object Label6: TLabel
        Left = 17
        Top = 9
        Width = 34
        Height = 13
        Caption = #1056#1072#1081#1086#1085':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object cbDoDouble: TDBCheckBoxEh
        Left = 328
        Top = 8
        Width = 113
        Height = 17
        AlwaysShowBorder = True
        Caption = #1050#1086#1087#1080#1103' '#1074' '#1088#1091#1073#1088#1080#1082#1091':'
        Flat = True
        TabOrder = 1
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = cbDoDoubleClick
        OnKeyPress = edCommentKeyPress
      end
      object cbDoubleRubrika: TDBLookupComboboxEh
        Left = 440
        Top = 7
        Width = 161
        Height = 19
        AlwaysShowBorder = True
        DataField = 'RB_ID'
        DataSource = dsDouble
        EditButtons = <>
        Flat = True
        KeyField = 'RB_ID'
        ListField = 'RB_NAME_SHORT'
        ListSource = dsRubrikaCopy
        TabOrder = 2
        Visible = False
        OnEnter = cbFormatEnter
        OnKeyPress = cbFormatKeyPress
      end
      object cbDistrict: TDBLookupComboboxEh
        Left = 64
        Top = 6
        Width = 249
        Height = 19
        AlwaysShowBorder = True
        DataField = 'DISTRICT_ID'
        DataSource = dsObjav
        EditButtons = <>
        Flat = True
        KeyField = 'DT_ID'
        ListField = 'DT_NAME'
        ListSource = data.dsDistrict
        TabOrder = 0
        Visible = True
        OnChange = cbFilterRubrikaSiteClick
        OnEnter = cbFormatEnter
        OnKeyPress = cbFormatKeyPress
      end
    end
    object pnlComment: TPanel
      Left = 0
      Top = 32
      Width = 606
      Height = 45
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Shape1: TShape
        Left = 0
        Top = 44
        Width = 606
        Height = 1
        Align = alBottom
        Pen.Color = clBtnShadow
      end
      object Label4: TLabel
        Left = 105
        Top = 3
        Width = 210
        Height = 13
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1076#1083#1103' '#1074#1099#1087#1091#1089#1082#1072#1102#1097#1077#1075#1086' '#1086#1090#1076#1077#1083#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 7
        Top = 3
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
      object edComment: TDBEditEh
        Left = 104
        Top = 18
        Width = 369
        Height = 19
        AlwaysShowBorder = True
        DataField = 'OB_COMMENT'
        DataSource = dsObjav
        EditButtons = <>
        Flat = True
        TabOrder = 1
        Visible = True
        OnKeyPress = edCommentKeyPress
      end
      object edVacCount: TDBNumberEditEh
        Left = 7
        Top = 18
        Width = 90
        Height = 19
        AlwaysShowBorder = True
        DataField = 'OB_VAC_COUNT'
        DataSource = dsObjav
        EditButtons = <
          item
            Style = ebsUpDownEh
          end>
        Flat = True
        MaxValue = 99.000000000000000000
        TabOrder = 0
        Visible = True
      end
      object DBCheckBoxEh1: TDBCheckBoxEh
        Left = 479
        Top = 19
        Width = 123
        Height = 17
        AlwaysShowBorder = True
        Caption = #1054#1073#1088#1072#1090#1080#1090#1100' '#1074#1085#1080#1084#1072#1085#1080#1077
        DataField = 'OB_HAS_ATTENTION'
        DataSource = dsObjav
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = cbFilterRubrikaSiteClick
      end
    end
    object pnlProperties: TPanel
      Left = 0
      Top = 0
      Width = 606
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      TabStop = True
      object Label2: TLabel
        Left = 377
        Top = 9
        Width = 42
        Height = 13
        Caption = #1056#1091#1073#1088#1080#1082#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 186
        Top = 9
        Width = 38
        Height = 13
        Caption = #1060#1086#1088#1084#1072#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Shape5: TShape
        Left = 0
        Top = 31
        Width = 606
        Height = 1
        Align = alBottom
        Pen.Color = clBtnShadow
      end
      object Shape3: TShape
        Left = 179
        Top = 2
        Width = 1
        Height = 26
        Pen.Color = clBtnShadow
      end
      object Shape7: TShape
        Left = 77
        Top = 2
        Width = 1
        Height = 26
        Pen.Color = clBtnShadow
      end
      object btShowAudit: TSpeedButton
        Left = 6
        Top = 5
        Width = 64
        Height = 22
        Caption = #1040#1091#1076#1080#1090'...'
        Flat = True
        OnClick = btShowAuditClick
      end
      object cbIsActive: TDBCheckBoxEh
        Left = 87
        Top = 8
        Width = 90
        Height = 17
        AlwaysShowBorder = True
        Caption = #1055#1091#1073#1083#1080#1082#1086#1074#1072#1090#1100
        DataField = 'OB_IS_ACTIVE'
        DataSource = dsObjav
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object cbFormat: TDBLookupComboboxEh
        Left = 229
        Top = 6
        Width = 137
        Height = 19
        AlwaysShowBorder = True
        DataField = 'FM_ID'
        DataSource = dsObjav
        EditButtons = <>
        Flat = True
        KeyField = 'FM_ID'
        ListField = 'FM_NAME'
        ListSource = dsFormat
        TabOrder = 0
        Visible = True
        OnChange = cbFormatChange
        OnEnter = cbFormatEnter
        OnKeyPress = cbFormatKeyPress
      end
      object cbRubrika: TDBLookupComboboxEh
        Left = 425
        Top = 6
        Width = 177
        Height = 19
        AlwaysShowBorder = True
        DataField = 'RB_ID'
        DataSource = dsObjav
        EditButtons = <>
        Flat = True
        KeyField = 'RB_ID'
        ListField = 'RB_NAME_SHORT'
        ListSource = dsRubrika
        TabOrder = 1
        Visible = True
        OnChange = cbFilterRubrikaSiteClick
        OnEnter = cbFormatEnter
        OnKeyPress = cbFormatKeyPress
      end
    end
    object pnlPubl: TPanel
      Left = 0
      Top = 374
      Width = 606
      Height = 36
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 6
      object Shape4: TShape
        Left = 0
        Top = 0
        Width = 606
        Height = 1
        Align = alTop
        Pen.Color = clBtnShadow
      end
      object btCheckSpelling: TBitBtn
        Left = 5
        Top = 6
        Width = 115
        Height = 25
        Caption = #1054#1088#1092#1086#1075#1088#1072#1092#1080#1103
        TabOrder = 0
        OnClick = actSpellCheckExecute
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999949999999
          9900999444F999999900994444F9999999009444F44F99999900444F9944F999
          990094F99994F9999900999999994F9999009999999994F9990099999999994F
          9900090900990094F90009090909090949000009009900999400090909990909
          99009099000900999900}
      end
      object btOldText: TBitBtn
        Left = 125
        Top = 6
        Width = 115
        Height = 25
        Caption = #1055#1086#1074#1090#1086#1088' '#1090#1077#1082#1089#1090#1072
        TabOrder = 1
        OnClick = btOldTextClick
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
          9900999999999999990099999999999999009947999999999900974999994444
          4900949999999444490094999999994449009499999994944900974999944999
          4900997444499999990099999999999999009999999999999900999999999999
          99009999999999999900}
      end
      object btSave: TBitBtn
        Left = 365
        Top = 6
        Width = 115
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
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
      object btCancelPubl: TBitBtn
        Left = 485
        Top = 6
        Width = 115
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ModalResult = 2
        ParentFont = False
        TabOrder = 6
        OnClick = btCancelPublClick
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          04000000000058000000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF0FFFFF0FF0
          0000F000FFF000F0000000000F0000000000F000000000F00000FF0000000FF0
          0000FFF00000FFF00000FF0000000FF00000F000000000F0000000000F000000
          0000F000FFF000F00000FF0FFFFF0FF00000}
      end
      object btToVerstka: TBitBtn
        Left = 365
        Top = 6
        Width = 115
        Height = 25
        Caption = #1042' '#1074#1077#1088#1089#1090#1082#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ModalResult = 1
        ParentFont = False
        TabOrder = 5
        OnClick = btToVerstkaClick
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          04000000000058000000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
          0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
          0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
          0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
      end
      object btToCorrector: TBitBtn
        Left = 245
        Top = 6
        Width = 115
        Height = 25
        Caption = #1042' '#1082#1086#1088#1088#1077#1082#1090#1091#1088#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = btToVerstkaClick
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          04000000000058000000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
          0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
          0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
          0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
      end
      object btBackToKorrektura: TBitBtn
        Left = 245
        Top = 6
        Width = 115
        Height = 25
        Caption = #1042' '#1082#1086#1088#1088#1077#1082#1090#1091#1088#1091
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ModalResult = 1
        ParentFont = False
        TabOrder = 2
        OnClick = btToVerstkaClick
        Glyph.Data = {
          CE000000424DCE0000000000000076000000280000000B0000000B0000000100
          04000000000058000000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF0FFFFF0FF0
          0000F000FFF000F0000000000F0000000000F000000000F00000FF0000000FF0
          0000FFF00000FFF00000FF0000000FF00000F000000000F0000000000F000000
          0000F000FFF000F00000FF0FFFFF0FF00000}
      end
    end
    object pnlRubrikaSite: TPanel
      Left = 0
      Top = 110
      Width = 606
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object Shape9: TShape
        Left = 0
        Top = 32
        Width = 606
        Height = 1
        Align = alBottom
        Pen.Color = clBtnShadow
      end
      object cbRubrikaSite: TDBLookupComboboxEh
        Left = 90
        Top = 7
        Width = 215
        Height = 19
        AlwaysShowBorder = True
        DataField = 'RS_ID'
        DataSource = dsObjav
        EditButtons = <>
        Flat = True
        KeyField = 'RS_ID'
        ListField = 'RS_NAME'
        ListSource = dsRubrikaPohozha
        TabOrder = 1
        Visible = True
        OnEnter = cbFormatEnter
        OnKeyPress = cbFormatKeyPress
      end
      object cbForInternet: TDBCheckBoxEh
        Left = 7
        Top = 8
        Width = 85
        Height = 17
        AlwaysShowBorder = True
        Caption = #1042' '#1080#1085#1090#1077#1088#1085#1077#1090
        DataField = 'OB_FOR_INTERNET'
        DataSource = dsObjav
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = cbForInternetClick
      end
      object cbFilterRubrikaSite: TDBCheckBoxEh
        Left = 311
        Top = 8
        Width = 169
        Height = 17
        AlwaysShowBorder = True
        Caption = #1058#1086#1083#1100#1082#1086' '#1087#1086#1076#1093#1086#1076#1103#1097#1080#1077' '#1088#1091#1073#1088#1080#1082#1080
        Checked = True
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = cbFilterRubrikaSiteClick
      end
      object Panel1: TPanel
        Left = 494
        Top = 1
        Width = 102
        Height = 30
        BevelOuter = bvNone
        TabOrder = 3
        object brSiteObjav: TButton
          Left = 7
          Top = 3
          Width = 89
          Height = 25
          Caption = #1044#1083#1103' '#1080#1085#1090#1077#1088#1085#1077#1090#1072
          TabOrder = 0
          OnClick = brSiteObjavClick
        end
      end
    end
  end
  object actions: TActionList
    Left = 112
    Top = 168
    object actSpellCheck: TAction
      Caption = #1054#1088#1092#1086#1075#1088#1072#1092#1080#1103
      ShortCut = 123
      OnExecute = actSpellCheckExecute
    end
  end
  object dlgOpenPicture: TOpenDialog
    DefaultExt = '*.tif'
    Left = 40
    Top = 168
  end
  object sdsRubrikaPohozha: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    Left = 51
    Top = 296
    object sdsRubrikaPohozhaRS_ID: TIntegerField
      DisplayLabel = 'ID '#1088#1091#1073#1088#1080#1082#1080' '#1085#1072' '#1089#1072#1081#1090#1077
      FieldName = 'RS_ID'
      Required = True
    end
    object sdsRubrikaPohozhaRB_ID: TIntegerField
      DisplayLabel = 'ID '#1088#1091#1073#1088#1080#1082#1080' '#1074' '#1075#1072#1079#1077#1090#1077
      FieldName = 'RB_ID'
      Required = True
    end
    object sdsRubrikaPohozhaRS_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'RS_NAME'
      LookupDataSet = cacheData.cdsRubrikaSite
      LookupKeyFields = 'RS_ID'
      LookupResultField = 'RS_NAME'
      KeyFields = 'RS_ID'
      Lookup = True
    end
  end
  object dsRubrikaPohozha: TDataSource
    DataSet = sdsRubrikaPohozha
    Left = 117
    Top = 312
  end
  object dsObjav: TDataSource
    DataSet = cdsObjav
    Left = 520
    Top = 184
  end
  object dsDouble: TDataSource
    DataSet = cdsDouble
    Left = 520
    Top = 232
  end
  object dsSdelkaPhone: TDataSource
    DataSet = cdsSdelkaPhone
    Left = 520
    Top = 280
  end
  object cdsSdelkaPhone: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptInput
      end>
    ProviderName = 'prvSdelkaPhone'
    ReadOnly = True
    Left = 432
    Top = 280
    object cdsSdelkaPhoneAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsSdelkaPhoneSD_ID: TIntegerField
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsSdelkaPhonePH_NUMBER: TStringField
      FieldName = 'PH_NUMBER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 16
    end
  end
  object cdsDouble: TClientDataSet
    Aggregates = <>
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
        DataType = ftUnknown
        Name = 'OB_ID'
        ParamType = ptUnknown
      end>
    ProviderName = 'prvDouble'
    AfterInsert = cdsDoubleAfterInsert
    OnReconcileError = cdsObjavReconcileError
    Left = 432
    Top = 232
    object cdsDoubleAG_ID: TIntegerField
      FieldName = 'AG_ID'
      Origin = 'DB.OBJAV.AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsDoubleSD_ID: TIntegerField
      FieldName = 'SD_ID'
      Origin = 'DB.OBJAV.SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsDoubleOB_ID: TIntegerField
      FieldName = 'OB_ID'
      Origin = 'DB.OBJAV.OB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsDoubleOB_PARENT: TIntegerField
      FieldName = 'OB_PARENT'
      Origin = 'DB.OBJAV.OB_PARENT'
    end
    object cdsDoubleFM_ID: TSmallintField
      FieldName = 'FM_ID'
      Origin = 'DB.OBJAV.FM_ID'
    end
    object cdsDoubleRB_ID: TIntegerField
      FieldName = 'RB_ID'
      Origin = 'DB.OBJAV.RB_ID'
    end
    object cdsDoubleOB_IS_ACTIVE: TSmallintField
      FieldName = 'OB_IS_ACTIVE'
      Origin = 'DB.OBJAV.OB_IS_ACTIVE'
    end
    object cdsDoubleOB_STATE: TSmallintField
      FieldName = 'OB_STATE'
      Origin = 'DB.OBJAV.OB_STATE'
    end
    object cdsDoubleRB_NAME_LK: TStringField
      FieldKind = fkLookup
      FieldName = 'RB_NAME_LK'
      LookupDataSet = data.tblRubrika
      LookupKeyFields = 'RB_ID'
      LookupResultField = 'RB_NAME_SHORT'
      KeyFields = 'RB_ID'
      Lookup = True
    end
  end
  object cdsObjav: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'OB_ID'
        ParamType = ptUnknown
        Value = '0'
      end>
    ProviderName = 'prvObjav'
    AfterInsert = cdsObjavAfterInsert
    BeforePost = cdsObjavBeforePost
    OnReconcileError = cdsObjavReconcileError
    AfterApplyUpdates = cdsObjavAfterApplyUpdates
    Left = 432
    Top = 184
    object cdsObjavAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsObjavSD_ID: TIntegerField
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsObjavOB_ID: TIntegerField
      FieldName = 'OB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsObjavOB_STATE: TSmallintField
      FieldName = 'OB_STATE'
    end
    object cdsObjavOB_IS_ACTIVE: TSmallintField
      FieldName = 'OB_IS_ACTIVE'
      Required = True
    end
    object cdsObjavFM_ID: TSmallintField
      FieldName = 'FM_ID'
    end
    object cdsObjavRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object cdsObjavRS_ID: TIntegerField
      FieldName = 'RS_ID'
    end
    object cdsObjavOB_TEXT: TStringField
      DisplayLabel = #1058#1077#1082#1089#1090
      FieldName = 'OB_TEXT'
      Size = 2047
    end
    object cdsObjavOB_COMMENT: TStringField
      DisplayLabel = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      FieldName = 'OB_COMMENT'
      Size = 127
    end
    object cdsObjavOB_FOR_INTERNET: TSmallintField
      FieldName = 'OB_FOR_INTERNET'
      Required = True
    end
    object cdsObjavCU_ID: TIntegerField
      FieldName = 'CU_ID'
      ProviderFlags = []
    end
    object cdsObjavRB_NAME_SHORT: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldKind = fkLookup
      FieldName = 'RB_NAME_SHORT'
      LookupDataSet = data.tblRubrika
      LookupKeyFields = 'RB_ID'
      LookupResultField = 'RB_NAME_SHORT'
      KeyFields = 'RB_ID'
      Lookup = True
    end
    object cdsObjavRS_NAME_LK: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072' '#1085#1072' '#1089#1072#1081#1090#1077
      FieldKind = fkLookup
      FieldName = 'RS_NAME_LK'
      LookupDataSet = data.sdsRubrikaSite
      LookupKeyFields = 'RS_ID'
      LookupResultField = 'RS_NAME'
      KeyFields = 'RS_ID'
      Lookup = True
    end
    object cdsObjavFM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldKind = fkLookup
      FieldName = 'FM_NAME'
      LookupDataSet = data.tblFormat
      LookupKeyFields = 'FM_ID'
      LookupResultField = 'FM_NAME'
      KeyFields = 'FM_ID'
      Lookup = True
    end
    object cdsObjavDISTRICT_NAME_LK: TStringField
      DisplayLabel = #1056#1072#1081#1086#1085
      FieldKind = fkLookup
      FieldName = 'DISTRICT_NAME_LK'
      LookupDataSet = data.tblDistrict
      LookupKeyFields = 'DT_ID'
      LookupResultField = 'DT_NAME'
      KeyFields = 'DISTRICT_ID'
      LookupCache = True
      Lookup = True
    end
    object cdsObjavOS_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldKind = fkLookup
      FieldName = 'OS_NAME'
      LookupDataSet = data.tblObjavState
      LookupKeyFields = 'OS_ID'
      LookupResultField = 'OS_NAME'
      KeyFields = 'OB_STATE'
      Lookup = True
    end
    object cdsObjavOB_VAC_COUNT: TSmallintField
      DefaultExpression = '1'
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1074#1072#1082#1072#1085#1089#1080#1081
      FieldName = 'OB_VAC_COUNT'
      Required = True
    end
    object cdsObjavOB_HAS_ATTENTION: TSmallintField
      DefaultExpression = '0'
      DisplayLabel = #1054#1073#1088#1072#1090#1080#1090#1100' '#1074#1085#1080#1084#1072#1085#1080#1077' '#1042#1099#1087#1091#1089#1082#1072#1102#1097#1077#1084#1091' '#1086#1090#1076#1077#1083#1091
      FieldName = 'OB_HAS_ATTENTION'
    end
    object cdsObjavDISTRICT_ID: TIntegerField
      FieldName = 'DISTRICT_ID'
    end
    object cdsObjavSITE_EMAIL: TStringField
      FieldName = 'SITE_EMAIL'
      Size = 128
    end
    object cdsObjavSITE_EMPLOYER: TStringField
      FieldName = 'SITE_EMPLOYER'
      Size = 255
    end
  end
  object prvObjav: TDataSetProvider
    DataSet = qryObjav
    Exported = False
    Options = [poCascadeDeletes, poCascadeUpdates]
    OnGetTableName = prvObjavGetTableName
    Left = 312
    Top = 184
  end
  object qryDouble: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftUnknown
        Name = 'OB_ID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT'
      '    OB.AG_ID,'
      '    OB.SD_ID,'
      '    OB.OB_ID,'
      '    OB.OB_PARENT,'
      '    OB.OB_IS_ACTIVE,'
      '    OB.OB_STATE,'
      '    OB.FM_ID,'
      '    OB.RB_ID'
      'FROM'
      '    OBJAV OB'
      'WHERE'
      '    OB.AG_ID=:AG_ID AND'
      '    OB.SD_ID=:SD_ID AND'
      '    OB.OB_PARENT=:OB_ID')
    SQLConnection = data.connection
    Left = 240
    Top = 232
    object qryDoubleAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDoubleSD_ID: TIntegerField
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDoubleOB_ID: TIntegerField
      FieldName = 'OB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDoubleOB_PARENT: TIntegerField
      FieldName = 'OB_PARENT'
    end
    object qryDoubleOB_IS_ACTIVE: TSmallintField
      FieldName = 'OB_IS_ACTIVE'
      Required = True
    end
    object qryDoubleOB_STATE: TSmallintField
      FieldName = 'OB_STATE'
      Required = True
    end
    object qryDoubleFM_ID: TSmallintField
      FieldName = 'FM_ID'
      Required = True
    end
    object qryDoubleRB_ID: TIntegerField
      FieldName = 'RB_ID'
      Required = True
    end
  end
  object qrySdelkaPhone: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT'
      '    CP.AG_ID,'
      '    CAST(NULL AS INTEGER) AS SD_ID,'
      '    CP.CP_NUMBER AS PH_NUMBER'
      'FROM'
      '    CUST_PHONE CP'
      'WHERE'
      '    CP.AG_ID=:AG_ID AND'
      '    CP.CU_ID = ('
      '        SELECT MAX(CU_ID)'
      '        FROM SDELKA SD'
      '        WHERE SD.AG_ID=:AG_ID AND SD.SD_ID=:SD_ID'
      '    )')
    SQLConnection = data.connection
    Left = 240
    Top = 280
    object qrySdelkaPhoneAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySdelkaPhoneSD_ID: TIntegerField
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qrySdelkaPhonePH_NUMBER: TStringField
      FieldName = 'PH_NUMBER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 16
    end
  end
  object qryObjav: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'AG_ID'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'SD_ID'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'OB_ID'
        ParamType = ptUnknown
        Value = '0'
      end>
    SQL.Strings = (
      'select'
      #9' ob.AG_ID'
      #9',ob.SD_ID'
      #9',ob.OB_ID'
      #9',ob.OB_STATE'
      #9',ob.OB_IS_ACTIVE'
      #9',ob.FM_ID'
      #9',ob.RB_ID'
      #9',ob.OB_VAC_COUNT'
      #9',ob.RS_ID'
      #9',ob.OB_TEXT'
      #9',ob.OB_COMMENT'
      #9',ob.OB_FOR_INTERNET'
      #9',ob.OB_HAS_ATTENTION'
      '  ,ob.DISTRICT_ID'
      #9',sd.CU_ID'
      '                ,SITE_EMAIL'
      '                ,SITE_EMPLOYER'
      'from'
      '     OBJAV ob'
      ''
      #9'left join SDELKA sd'
      #9'on (ob.AG_ID = sd.AG_ID and ob.SD_ID = sd.SD_ID)'
      'where'
      #9#9'ob.AG_ID=:AG_ID'
      #9'and ob.SD_ID = :SD_ID'
      #9'and ob.OB_ID = :OB_ID'
      #9'and ob.OB_PARENT is null')
    SQLConnection = data.connection
    Left = 240
    Top = 184
    object qryObjavAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryObjavSD_ID: TIntegerField
      FieldName = 'SD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryObjavOB_ID: TIntegerField
      FieldName = 'OB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryObjavOB_STATE: TSmallintField
      FieldName = 'OB_STATE'
    end
    object qryObjavOB_IS_ACTIVE: TSmallintField
      FieldName = 'OB_IS_ACTIVE'
      Required = True
    end
    object qryObjavFM_ID: TSmallintField
      FieldName = 'FM_ID'
    end
    object qryObjavRB_ID: TIntegerField
      FieldName = 'RB_ID'
    end
    object qryObjavRS_ID: TIntegerField
      FieldName = 'RS_ID'
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
    object qryObjavOB_FOR_INTERNET: TSmallintField
      FieldName = 'OB_FOR_INTERNET'
      Required = True
    end
    object qryObjavCU_ID: TIntegerField
      FieldName = 'CU_ID'
      ProviderFlags = []
    end
    object qryObjavRB_NAME_SHORT: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072
      FieldKind = fkLookup
      FieldName = 'RB_NAME_SHORT'
      LookupDataSet = data.tblRubrika
      LookupKeyFields = 'RB_ID'
      LookupResultField = 'RB_NAME_SHORT'
      KeyFields = 'RB_ID'
      Lookup = True
    end
    object qryObjavRS_NAME_LK: TStringField
      DisplayLabel = #1056#1091#1073#1088#1080#1082#1072' '#1085#1072' '#1089#1072#1081#1090#1077
      FieldKind = fkLookup
      FieldName = 'RS_NAME_LK'
      LookupDataSet = data.sdsRubrikaSite
      LookupKeyFields = 'RS_ID'
      LookupResultField = 'RS_NAME'
      KeyFields = 'RS_ID'
      Lookup = True
    end
    object qryObjavFM_NAME: TStringField
      DisplayLabel = #1060#1086#1088#1084#1072#1090
      FieldKind = fkLookup
      FieldName = 'FM_NAME'
      LookupDataSet = data.tblFormat
      LookupKeyFields = 'FM_ID'
      LookupResultField = 'FM_NAME'
      KeyFields = 'FM_ID'
      Lookup = True
    end
    object qryObjavDISTRICT_NAME_LK: TStringField
      DisplayLabel = #1056#1072#1081#1086#1085
      FieldKind = fkLookup
      FieldName = 'DISTRICT_NAME_LK'
      LookupDataSet = data.tblDistrict
      LookupKeyFields = 'DT_ID'
      LookupResultField = 'DT_NAME'
      KeyFields = 'DISTRICT_ID'
      LookupCache = True
      Lookup = True
    end
    object qryObjavOS_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldKind = fkLookup
      FieldName = 'OS_NAME'
      LookupDataSet = data.tblObjavState
      LookupKeyFields = 'OS_ID'
      LookupResultField = 'OS_NAME'
      KeyFields = 'OB_STATE'
      Lookup = True
    end
    object qryObjavOB_VAC_COUNT: TSmallintField
      DefaultExpression = '1'
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1074#1072#1082#1072#1085#1089#1080#1081
      FieldName = 'OB_VAC_COUNT'
      Required = True
    end
    object qryObjavOB_HAS_ATTENTION: TSmallintField
      DefaultExpression = '0'
      DisplayLabel = #1054#1073#1088#1072#1090#1080#1090#1100' '#1074#1085#1080#1084#1072#1085#1080#1077' '#1042#1099#1087#1091#1089#1082#1072#1102#1097#1077#1084#1091' '#1086#1090#1076#1077#1083#1091
      FieldName = 'OB_HAS_ATTENTION'
    end
    object qryObjavDISTRICT_ID: TIntegerField
      FieldName = 'DISTRICT_ID'
    end
    object qryObjavSITE_EMAIL: TStringField
      FieldName = 'SITE_EMAIL'
      Size = 128
    end
    object qryObjavSITE_EMPLOYER: TStringField
      FieldName = 'SITE_EMPLOYER'
      Size = 255
    end
  end
  object prvDouble: TDataSetProvider
    DataSet = qryDouble
    Exported = False
    Options = [poCascadeDeletes, poCascadeUpdates]
    Left = 312
    Top = 232
  end
  object prvSdelkaPhone: TDataSetProvider
    DataSet = qrySdelkaPhone
    Exported = False
    Options = [poCascadeDeletes, poCascadeUpdates]
    Left = 312
    Top = 280
  end
  object cdsFormat: TClientDataSet
    Aggregates = <>
    Filter = 'FM_HAS_PICTURE<>1'
    Params = <>
    ProviderName = 'prvFormat'
    ReadOnly = True
    Left = 240
    Top = 328
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
  object dsFormat: TDataSource
    DataSet = cdsFormat
    Left = 328
    Top = 328
  end
  object dsRubrika: TDataSource
    DataSet = tblRubrika
    Left = 165
    Top = 216
  end
  object tblRubrika: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 109
    Top = 216
    object tblRubrikaRB_ID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'RB_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tblRubrikaRB_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'RB_NAME'
      Required = True
      Size = 128
    end
    object tblRubrikaRB_NAME_SHORT: TStringField
      DisplayLabel = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
      FieldName = 'RB_NAME_SHORT'
      Required = True
      Size = 64
    end
    object tblRubrikaRB_COST_COEFF: TFloatField
      DisplayLabel = #1062#1077#1085#1086#1074#1086#1081' '#1082#1086#1101#1092#1080#1094#1080#1077#1085#1090
      FieldName = 'RB_COST_COEFF'
      DisplayFormat = '0.###'
    end
    object tblRubrikaRB_IS_OBLOGKA: TSmallintField
      DisplayLabel = #1054#1073#1083#1086#1078#1082#1072
      FieldName = 'RB_IS_OBLOGKA'
      Required = True
    end
    object tblRubrikaGZ_ID: TIntegerField
      FieldName = 'GZ_ID'
      Required = True
    end
    object tblRubrikaRB_IS_LOCKABLE: TSmallintField
      FieldName = 'RB_IS_LOCKABLE'
      Required = True
    end
  end
  object tblRubrikaCopy: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 109
    Top = 264
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
    object tblRubrikaCopyRB_IS_HOT: TSmallintField
      FieldName = 'RB_IS_HOT'
    end
    object tblRubrikaCopyRB_IS_LOCKABLE: TSmallintField
      FieldName = 'RB_IS_LOCKABLE'
      Required = True
    end
  end
  object dsRubrikaCopy: TDataSource
    DataSet = tblRubrikaCopy
    Left = 165
    Top = 264
  end
  object qryLogChanges: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'AG_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SD_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OB_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NEW_STATE_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NEW_TEXT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NEW_RB_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'US_ID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'insert into OBJAV_CHANGE_LOG ('
      '      AG_ID'
      '    , SD_ID'
      '    , OB_ID'
      #9', NEW_STATE_ID'
      #9', NEW_TEXT'
      #9', NEW_RB_ID'
      #9', US_ID'
      ')'
      'values ('
      '      :AG_ID'
      '    , :SD_ID'
      '    , :OB_ID'
      #9', :NEW_STATE_ID'
      '    , :NEW_TEXT'
      #9', :NEW_RB_ID'
      '    , :US_ID'
      ')')
    SQLConnection = data.connection
    Left = 432
    Top = 328
  end
  object qTextOrigin: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ag_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sd_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ob_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select first 1'
      '    ob.OB_TEXT,'
      '    o2.OB_TEXT as ORIGIN'
      'from'
      '     OBJAV ob'
      ''
      
        '    left join SDELKA sd on (ob.AG_ID = sd.AG_ID and ob.SD_ID = s' +
        'd.SD_ID)'
      
        '    left join objav o2 on (o2.AG_ID = sd.AG_ID and o2.SD_ID = sd' +
        '.SD_IS_CHANGED_COPY_OF_SD_ID)'
      'where'
      '        ob.AG_ID=  :ag_id'
      '    and ob.SD_ID = :sd_id'
      '    and ob.OB_ID = :ob_id'
      '    and ob.OB_PARENT is null')
    SQLConnection = data.connection
    Left = 376
    Top = 192
    object qTextOriginOB_TEXT: TStringField
      FieldName = 'OB_TEXT'
      Size = 2047
    end
    object qTextOriginORIGIN: TStringField
      FieldName = 'ORIGIN'
      Size = 2047
    end
  end
  object popCopy: TPopupMenu
    Left = 200
    Top = 176
    object nCopy: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 16451
      OnClick = nCopyClick
    end
    object nPaste: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100
      ShortCut = 16470
      OnClick = nPasteClick
    end
    object N1: TMenuItem
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      ShortCut = 16449
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1056#1077#1075#1080#1089#1090#1088
      ShortCut = 8306
      OnClick = N2Click
    end
  end
  object cdsSiteObjavs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSiteObjavs'
    Left = 432
    Top = 144
    object cdsSiteObjavsSITE_OBJAV_ID: TIntegerField
      FieldName = 'SITE_OBJAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsSiteObjavsOB_ID: TIntegerField
      FieldName = 'OB_ID'
    end
  end
  object qSiteObjavs: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'OB_ID'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT *  FROM SITE_OBJAV so WHERE so.OB_ID = :OB_ID')
    SQLConnection = data.connection
    Left = 240
    Top = 144
  end
  object prvSiteObjavs: TDataSetProvider
    DataSet = qSiteObjavs
    Left = 312
    Top = 144
  end
  object qFormat: TSQLQuery
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
      'AND f.FM_HAS_PICTURE<>1'
      'ORDER BY ORDERBY')
    SQLConnection = data.connection
    Left = 176
    Top = 328
    object qFormatFM_ID: TIntegerField
      FieldName = 'FM_ID'
      Required = True
    end
    object qFormatFM_NAME: TStringField
      FieldName = 'FM_NAME'
      Required = True
      Size = 128
    end
    object qFormatFM_SPACE: TFloatField
      FieldName = 'FM_SPACE'
    end
    object qFormatFM_ALWAYS_ADD_SUM: TSmallintField
      FieldName = 'FM_ALWAYS_ADD_SUM'
    end
    object qFormatFM_HAS_PICTURE: TSmallintField
      FieldName = 'FM_HAS_PICTURE'
      Required = True
    end
    object qFormatFM_PICTURE_SIZES: TStringField
      FieldName = 'FM_PICTURE_SIZES'
      Size = 128
    end
  end
  object prvFormat: TDataSetProvider
    DataSet = qFormat
    Left = 208
    Top = 328
  end
end
