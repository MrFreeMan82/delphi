object frmEditSiteObjav: TfrmEditSiteObjav
  Left = 841
  Top = 326
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1077' '#1076#1083#1103' '#1089#1072#1081#1090#1072
  ClientHeight = 409
  ClientWidth = 498
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 14
  object Label2: TLabel
    Left = 9
    Top = 14
    Width = 50
    Height = 14
    Caption = #1056#1091#1073#1088#1080#1082#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 9
    Top = 44
    Width = 56
    Height = 14
    Caption = #1042#1072#1082#1072#1085#1089#1080#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 9
    Top = 74
    Width = 55
    Height = 14
    Caption = #1047#1072#1088#1087#1083#1072#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 260
    Top = 39
    Width = 83
    Height = 14
    Caption = #1056#1072#1073#1086#1090#1086#1076#1072#1090#1077#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 260
    Top = 69
    Width = 35
    Height = 14
    Caption = 'E-mail:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 260
    Top = 125
    Width = 30
    Height = 14
    Caption = #1058#1077#1083'.:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 10
    Top = 179
    Width = 37
    Height = 14
    Caption = #1058#1077#1082#1089#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 260
    Top = 97
    Width = 49
    Height = 14
    Caption = #1050#1086#1085#1090#1072#1082#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 9
    Top = 102
    Width = 79
    Height = 14
    Caption = #1054#1087#1099#1090' '#1088#1072#1073#1086#1090#1099':'
  end
  object Label10: TLabel
    Left = 9
    Top = 129
    Width = 78
    Height = 14
    Caption = #1054#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077':'
  end
  object Label11: TLabel
    Left = 260
    Top = 10
    Width = 38
    Height = 14
    Caption = #1043#1086#1088#1086#1076':'
  end
  object Label12: TLabel
    Left = 8
    Top = 157
    Width = 39
    Height = 14
    Caption = #1040#1076#1088#1077#1089':'
  end
  object cbRubrikaSite: TDBLookupComboboxEh
    Left = 93
    Top = 8
    Width = 140
    Height = 22
    AlwaysShowBorder = True
    DataField = 'RS_ID'
    DataSource = dsSiteObjavs
    EditButtons = <>
    KeyField = 'RS_ID'
    ListField = 'RS_NAME'
    ListSource = dsRubrikaSite
    TabOrder = 0
    Visible = True
  end
  object dbVacancy: TDBEdit
    Left = 93
    Top = 38
    Width = 140
    Height = 22
    BevelInner = bvNone
    BevelOuter = bvNone
    DataField = 'SITE_VACANCY_NAME'
    DataSource = dsSiteObjavs
    TabOrder = 1
    OnDragDrop = dbVacancyDragDrop
    OnDragOver = dbVacancyDragOver
  end
  object dbZP: TDBEdit
    Tag = 1
    Left = 93
    Top = 68
    Width = 140
    Height = 22
    DataField = 'SITE_ZP'
    DataSource = dsSiteObjavs
    TabOrder = 2
    OnDragDrop = dbVacancyDragDrop
    OnDragOver = dbVacancyDragOver
  end
  object dbEmployer: TDBEdit
    Tag = 2
    Left = 349
    Top = 33
    Width = 140
    Height = 22
    DataField = 'SITE_EMPLOYER'
    DataSource = dsSiteObjavs
    TabOrder = 6
    OnDragDrop = dbVacancyDragDrop
    OnDragOver = dbVacancyDragOver
  end
  object dbEmail: TDBEdit
    Tag = 3
    Left = 349
    Top = 63
    Width = 140
    Height = 22
    DataField = 'SITE_EMAIL'
    DataSource = dsSiteObjavs
    TabOrder = 7
    OnDragDrop = dbVacancyDragDrop
    OnDragOver = dbVacancyDragOver
  end
  object dbTel: TDBEdit
    Tag = 4
    Left = 349
    Top = 119
    Width = 140
    Height = 22
    DataField = 'SITE_TEL'
    DataSource = dsSiteObjavs
    TabOrder = 9
    OnDragDrop = dbVacancyDragDrop
    OnDragOver = dbVacancyDragOver
  end
  object rchText: TDBRichEdit
    Tag = 7
    Left = 8
    Top = 195
    Width = 481
    Height = 169
    BevelKind = bkFlat
    BorderStyle = bsNone
    DataField = 'SITE_OBJAV_TEXT'
    DataSource = dsSiteObjavs
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    PlainText = True
    ScrollBars = ssVertical
    TabOrder = 11
    OnMouseDown = rchTextMouseDown
  end
  object btDone: TBitBtn
    Left = 254
    Top = 368
    Width = 115
    Height = 25
    Caption = #1054#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
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
  object btCancelAg: TBitBtn
    Left = 375
    Top = 368
    Width = 115
    Height = 26
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
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
  object dbContact: TDBEdit
    Tag = 5
    Left = 349
    Top = 91
    Width = 140
    Height = 22
    DataField = 'SITE_CONTACT'
    DataSource = dsSiteObjavs
    TabOrder = 8
    OnDragDrop = dbVacancyDragDrop
    OnDragOver = dbVacancyDragOver
  end
  object cbExp: TDBLookupComboboxEh
    Left = 93
    Top = 96
    Width = 140
    Height = 22
    AlwaysShowBorder = True
    DataField = 'EX_ID'
    DataSource = dsSiteObjavs
    EditButtons = <>
    KeyField = 'EX_ID'
    ListField = 'EX_NAME'
    ListSource = dsExp
    TabOrder = 3
    Visible = True
  end
  object cbEdu: TDBLookupComboboxEh
    Left = 93
    Top = 125
    Width = 140
    Height = 22
    AlwaysShowBorder = True
    DataField = 'ED_ID'
    DataSource = dsSiteObjavs
    EditButtons = <>
    KeyField = 'ED_ID'
    ListField = 'ED_NAME'
    ListSource = dsEdu
    TabOrder = 4
    Visible = True
  end
  object cbCity: TDBLookupComboboxEh
    Left = 349
    Top = 5
    Width = 140
    Height = 22
    AlwaysShowBorder = True
    DataField = 'C_ID'
    DataSource = dsSiteObjavs
    EditButtons = <>
    KeyField = 'C_ID'
    ListField = 'C_NAME'
    ListSource = dsCity
    Style = csDropDownEh
    TabOrder = 5
    Visible = True
    OnKeyDown = cbCityKeyDown
    OnNotInList = cbCityNotInList
  end
  object dbAddress: TDBEdit
    Tag = 6
    Left = 93
    Top = 154
    Width = 395
    Height = 22
    DataField = 'CU_ADDRESS'
    DataSource = dsSiteObjavs
    TabOrder = 10
    OnDragDrop = dbVacancyDragDrop
    OnDragOver = dbVacancyDragOver
  end
  object qrySiteObjavs: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'site_objav_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      
        'select * from SITE_OBJAV so where so.site_objav_id = :site_objav' +
        '_id')
    SQLConnection = data.connection
    Left = 78
    Top = 169
  end
  object prvSiteObjavs: TDataSetProvider
    DataSet = qrySiteObjavs
    Left = 154
    Top = 169
  end
  object cdsSiteObjavs: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CONTENT_ID'
        ParamType = ptUnknown
        Value = 0
      end>
    ProviderName = 'prvSiteObjavs'
    Left = 234
    Top = 168
    object cdsSiteObjavsSITE_OBJAV_ID: TIntegerField
      FieldName = 'SITE_OBJAV_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsSiteObjavsRS_ID: TIntegerField
      FieldName = 'RS_ID'
      ProviderFlags = []
    end
    object cdsSiteObjavsSITE_VACANCY_NAME: TStringField
      FieldName = 'SITE_VACANCY_NAME'
      OnSetText = cdsSiteObjavsSITE_VACANCY_NAMESetText
      Size = 128
    end
    object cdsSiteObjavsSITE_EMAIL: TStringField
      FieldName = 'SITE_EMAIL'
      Size = 128
    end
    object cdsSiteObjavsSITE_TEL: TStringField
      FieldName = 'SITE_TEL'
      Size = 128
    end
    object cdsSiteObjavsSITE_CONTACT: TStringField
      FieldName = 'SITE_CONTACT'
      Size = 255
    end
    object cdsSiteObjavsSITE_DONT_UPLOAD: TSmallintField
      FieldName = 'SITE_DONT_UPLOAD'
    end
    object cdsSiteObjavsSITE_OBJAV_TEXT: TStringField
      FieldName = 'SITE_OBJAV_TEXT'
      Size = 2047
    end
    object cdsSiteObjavsSITE_ZP: TIntegerField
      FieldName = 'SITE_ZP'
    end
    object cdsSiteObjavsSITE_EMPLOYER: TStringField
      FieldName = 'SITE_EMPLOYER'
      Size = 255
    end
    object cdsSiteObjavsCONTENT_ID: TIntegerField
      FieldName = 'CONTENT_ID'
    end
    object cdsSiteObjavsOB_ID: TIntegerField
      FieldName = 'OB_ID'
    end
    object cdsSiteObjavsEX_ID: TIntegerField
      FieldName = 'EX_ID'
    end
    object cdsSiteObjavsED_ID: TIntegerField
      FieldName = 'ED_ID'
    end
    object cdsSiteObjavsC_ID: TIntegerField
      FieldName = 'C_ID'
    end
    object cdsSiteObjavsIS_ID: TIntegerField
      FieldName = 'IS_ID'
    end
    object cdsSiteObjavsCU_ADDRESS: TStringField
      FieldName = 'CU_ADDRESS'
      Size = 255
    end
  end
  object dsSiteObjavs: TDataSource
    DataSet = cdsSiteObjavs
    Left = 310
    Top = 169
  end
  object dsRubrikaSite: TDataSource
    DataSet = cdsRubrikaSite
    Left = 312
    Top = 208
  end
  object cdsRubrikaSite: TClientDataSet
    Aggregates = <>
    Params = <>
    ReadOnly = True
    Left = 232
    Top = 200
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
  object qExp: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM EXPERIENCE')
    SQLConnection = data.connection
    Left = 80
    Top = 240
  end
  object qEdu: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM EDUCATION')
    SQLConnection = data.connection
    Left = 80
    Top = 288
  end
  object qCity: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM CITY c ORDER BY c.ORDERBY DESC, c.C_NAME')
    SQLConnection = data.connection
    Left = 80
    Top = 336
  end
  object cdsExp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvExp'
    Left = 232
    Top = 240
    object cdsExpEX_ID: TIntegerField
      FieldName = 'EX_ID'
    end
    object cdsExpEX_NAME: TStringField
      DisplayWidth = 32
      FieldName = 'EX_NAME'
      Size = 32
    end
  end
  object cdsEdu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEdu'
    Left = 232
    Top = 288
    object cdsEduED_ID: TIntegerField
      FieldName = 'ED_ID'
    end
    object cdsEduED_NAME: TStringField
      FieldName = 'ED_NAME'
      Size = 32
    end
  end
  object cdsCity: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCity'
    Left = 232
    Top = 328
    object cdsCityC_ID: TIntegerField
      FieldName = 'C_ID'
    end
    object cdsCityC_NAME: TStringField
      FieldName = 'C_NAME'
      Size = 128
    end
    object cdsCityORDERBY: TIntegerField
      FieldName = 'ORDERBY'
    end
  end
  object prvExp: TDataSetProvider
    DataSet = qExp
    Left = 160
    Top = 240
  end
  object prvEdu: TDataSetProvider
    DataSet = qEdu
    Left = 160
    Top = 288
  end
  object prvCity: TDataSetProvider
    DataSet = qCity
    Left = 160
    Top = 328
  end
  object dsExp: TDataSource
    DataSet = cdsExp
    Left = 312
    Top = 248
  end
  object dsEdu: TDataSource
    DataSet = cdsEdu
    Left = 312
    Top = 288
  end
  object dsCity: TDataSource
    DataSet = cdsCity
    Left = 312
    Top = 328
  end
  object ApEvents: TApplicationEvents
    OnMessage = ApEventsMessage
    Left = 376
    Top = 160
  end
  object qCurrIssue: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT is_id FROM GET_CURRENT_ISSUE(:gz_id)')
    SQLConnection = data.connection
    Left = 376
    Top = 216
    object qCurrIssueIS_ID: TIntegerField
      FieldName = 'IS_ID'
    end
  end
end
