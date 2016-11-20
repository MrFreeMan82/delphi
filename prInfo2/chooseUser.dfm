object frmChooseUser: TfrmChooseUser
  Left = 831
  Top = 375
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  ClientHeight = 319
  ClientWidth = 589
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 589
    Height = 319
    Align = alClient
    BorderWidth = 5
    TabOrder = 0
    object Label31: TLabel
      Left = 13
      Top = 8
      Width = 87
      Height = 13
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 389
      Top = 8
      Width = 38
      Height = 13
      Caption = #1040#1075#1077#1085#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object imgChecked: TImage
      Left = 175
      Top = 3
      Width = 11
      Height = 11
      AutoSize = True
      Picture.Data = {
        07544269746D6170CE000000424DCE0000000000000076000000280000000B00
        00000B0000000100040000000000580000000000000000000000100000000000
        000000000000000080000080000000808000800000008000800080800000C0C0
        C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF0088888888888000008FFFFFFFFF8000008FFF0FFFFF8000008FF000FFFF80
        00008F00000FFF8000008F00F000FF8000008F0FFF000F8000008FFFFFF00F80
        00008FFFFFFF0F8000008FFFFFFFFF8000008888888888800000}
      Visible = False
    end
    object imgUnchecked: TImage
      Left = 151
      Top = 3
      Width = 11
      Height = 11
      AutoSize = True
      Picture.Data = {
        07544269746D6170CE000000424DCE0000000000000076000000280000000B00
        00000B0000000100040000000000580000000000000000000000100000000000
        000000000000000080000080000000808000800000008000800080800000C0C0
        C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF0088888888888000008FFFFFFFFF8000008FFFFFFFFF8000008FFFFFFFFF80
        00008FFFFFFFFF8000008FFFFFFFFF8000008FFFFFFFFF8000008FFFFFFFFF80
        00008FFFFFFFFF8000008FFFFFFFFF8000008888888888800000}
      Visible = False
    end
    object Label2: TLabel
      Left = 12
      Top = 257
      Width = 391
      Height = 13
      Caption = 
        #1044#1083#1103' '#1073#1099#1089#1090#1088#1086#1075#1086' '#1087#1077#1088#1077#1093#1086#1076#1072' '#1085#1072#1078#1084#1080#1090#1077' '#1087#1077#1088#1074#1091#1102' '#1073#1091#1082#1074#1091' '#1080#1084#1077#1085#1080' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103'/'#1072#1075 +
        #1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Panel33: TPanel
      Left = 6
      Top = 276
      Width = 577
      Height = 37
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object Shape14: TShape
        Left = 0
        Top = 0
        Width = 577
        Height = 1
        Align = alTop
        Brush.Color = clBtnShadow
        Pen.Color = clBtnShadow
      end
      object Shape13: TShape
        Left = 0
        Top = 36
        Width = 577
        Height = 1
        Align = alBottom
        Brush.Color = clBtnShadow
        Pen.Color = clBtnShadow
      end
      object DBText1: TDBText
        Left = 384
        Top = 8
        Width = 65
        Height = 17
      end
      object Button3: TButton
        Left = 495
        Top = 6
        Width = 75
        Height = 25
        Caption = #1042#1086#1081#1090#1080
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ModalResult = 1
        ParentFont = False
        TabOrder = 0
      end
      object Button1: TButton
        Left = 410
        Top = 6
        Width = 75
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ModalResult = 2
        ParentFont = False
        TabOrder = 1
      end
      object btExit: TButton
        Left = 5
        Top = 6
        Width = 75
        Height = 25
        Caption = #1042#1099#1093#1086#1076
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ModalResult = 3
        ParentFont = False
        TabOrder = 2
        OnClick = btExitClick
      end
    end
    object grUsr: TDBGrid
      Left = 11
      Top = 23
      Width = 369
      Height = 229
      DataSource = dsUsr
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = grUsrDrawColumnCell
      OnKeyPress = grUsrKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'US_NAME'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 176
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'US_TYPE_LK'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 134
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'US_IS_REMOTE'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 37
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 387
      Top = 23
      Width = 190
      Height = 229
      DataSource = dsUsrRights
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnKeyPress = DBGrid2KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'AG_NAME'
          Width = 170
          Visible = True
        end>
    end
  end
  object dsUsr: TDataSource
    DataSet = cdsUsr
    Left = 304
    Top = 48
  end
  object dsUsrRights: TDataSource
    DataSet = cdsUsrRights
    Left = 304
    Top = 96
  end
  object qryUsr: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM USR'
      'WHERE US_IS_ACTIVE = 1'
      'ORDER BY US_NAME')
    SQLConnection = data.connection
    Left = 32
    Top = 48
    object qryUsrUS_ID: TIntegerField
      FieldName = 'US_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryUsrUS_NAME: TStringField
      FieldName = 'US_NAME'
      Required = True
      Size = 128
    end
    object qryUsrUS_DISK_ID: TStringField
      FieldName = 'US_DISK_ID'
    end
    object qryUsrUS_PASSWORD: TStringField
      FieldName = 'US_PASSWORD'
      FixedChar = True
      Size = 16
    end
    object qryUsrUS_TYPE: TIntegerField
      FieldName = 'US_TYPE'
    end
    object qryUsrUS_OFFICE_NAME: TStringField
      FieldName = 'US_OFFICE_NAME'
      Size = 64
    end
    object qryUsrUS_IS_REMOTE: TSmallintField
      FieldName = 'US_IS_REMOTE'
    end
    object qryUsrUS_ACCOUNT: TStringField
      FieldName = 'US_ACCOUNT'
      Size = 255
    end
  end
  object dsUsrLink: TDataSource
    DataSet = qryUsr
    Left = 56
    Top = 104
  end
  object qryUsrRights: TSQLQuery
    DataSource = dsUsrLink
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'US_ID'
        ParamType = ptInput
        Size = 4
      end>
    SQL.Strings = (
      'SELECT'
      '  UR.*,'
      '  AG.AG_NAME'
      'FROM'
      '  USR_RIGHTS UR'
      '  LEFT JOIN AGENT AG'
      '  ON (UR.AG_ID=AG.AG_ID)'
      'WHERE'
      '  UR.US_ID=:US_ID'
      'ORDER BY'
      '  AG_NAME')
    SQLConnection = data.connection
    Left = 112
    Top = 104
    object qryUsrRightsUS_ID: TIntegerField
      FieldName = 'US_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryUsrRightsAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryUsrRightsAG_NAME: TStringField
      FieldName = 'AG_NAME'
      ProviderFlags = []
      Size = 128
    end
  end
  object prvUsr: TDataSetProvider
    DataSet = qryUsr
    Options = [poFetchDetailsOnDemand]
    Left = 112
    Top = 48
  end
  object cdsUsr: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvUsr'
    AfterScroll = cdsUsrAfterScroll
    Left = 184
    Top = 48
    object cdsUsrUS_ID: TIntegerField
      FieldName = 'US_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUsrUS_NAME: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'US_NAME'
      Required = True
      Size = 128
    end
    object cdsUsrUS_DISK_ID: TStringField
      FieldName = 'US_DISK_ID'
    end
    object cdsUsrUS_PASSWORD: TStringField
      FieldName = 'US_PASSWORD'
      FixedChar = True
      Size = 16
    end
    object cdsUsrUS_TYPE: TIntegerField
      FieldName = 'US_TYPE'
    end
    object cdsUsrUS_OFFICE_NAME: TStringField
      FieldName = 'US_OFFICE_NAME'
      Size = 64
    end
    object cdsUsrUS_NAME_LK: TStringField
      DisplayLabel = #1058#1080#1087
      FieldKind = fkLookup
      FieldName = 'US_TYPE_LK'
      LookupDataSet = data.tblUsrType
      LookupKeyFields = 'UT_ID'
      LookupResultField = 'UT_NAME'
      KeyFields = 'US_TYPE'
      Lookup = True
    end
    object cdsUsrUS_IS_REMOTE: TSmallintField
      DisplayLabel = #1051'.'#1041'.'
      FieldName = 'US_IS_REMOTE'
    end
    object cdsUsrqryUsrRights: TDataSetField
      FieldName = 'qryUsrRights'
    end
    object cdsUsrUS_ACCOUNT: TStringField
      FieldName = 'US_ACCOUNT'
      Size = 255
    end
  end
  object cdsUsrRights: TClientDataSet
    Aggregates = <>
    DataSetField = cdsUsrqryUsrRights
    FetchOnDemand = False
    Params = <>
    Left = 184
    Top = 104
    object cdsUsrRightsUS_ID: TIntegerField
      FieldName = 'US_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUsrRightsAG_ID: TIntegerField
      FieldName = 'AG_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsUsrRightsAG_NAME: TStringField
      FieldName = 'AG_NAME'
      ProviderFlags = []
      Size = 128
    end
  end
end
