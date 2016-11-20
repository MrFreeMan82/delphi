object frmWashDetail: TfrmWashDetail
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1052#1086#1081#1082#1072
  ClientHeight = 506
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object imgEditHole: TImage
    Left = 8
    Top = 481
    Width = 20
    Height = 17
    Picture.Data = {
      07544269746D617032040000424D320400000000000036000000280000001400
      0000110000000100180000000000FC0300000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80C0E040
      0000F0CAA680C0E0400000F0CAA680C0E0400000F0CAA6FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80C0E0400000F0CA
      A680C0E0400000F0CAA680C0E0400000F0CAA6FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 389
    Height = 67
    Align = alTop
    Caption = #1052#1086#1081#1082#1072
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 17
      Width = 30
      Height = 13
      Caption = #1044#1072#1090#1072':'
    end
    object Label2: TLabel
      Left = 126
      Top = 17
      Width = 41
      Height = 13
      Caption = #1053#1072#1095#1072#1083#1086':'
    end
    object Label3: TLabel
      Left = 260
      Top = 17
      Width = 35
      Height = 13
      Caption = #1050#1086#1085#1077#1094':'
    end
    object Label15: TLabel
      Left = 4
      Top = 40
      Width = 35
      Height = 13
      Caption = #1057#1091#1084#1084#1072':'
    end
    object txtWashSum: TDBText
      Left = 44
      Top = 40
      Width = 77
      Height = 17
    end
    object pkWashDate: TDateTimePicker
      Left = 39
      Top = 12
      Width = 82
      Height = 21
      Date = 42680.545527233790000000
      Time = 42680.545527233790000000
      TabOrder = 0
    end
    object pkWashTimeBegin: TDateTimePicker
      Left = 173
      Top = 12
      Width = 79
      Height = 21
      Date = 0.545527233793109200
      Time = 0.545527233793109200
      Kind = dtkTime
      TabOrder = 1
    end
    object pkWashTimeEnd: TDateTimePicker
      Left = 301
      Top = 12
      Width = 79
      Height = 21
      Date = 42680.545527233790000000
      Time = 42680.545527233790000000
      Kind = dtkTime
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 67
    Width = 389
    Height = 71
    Align = alTop
    Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
    TabOrder = 1
    object Label4: TLabel
      Left = 4
      Top = 16
      Width = 77
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label5: TLabel
      Left = 4
      Top = 44
      Width = 77
      Height = 13
      Caption = #1060#1086#1088#1084#1072' '#1089#1086#1073#1089#1090#1074'.:'
    end
    object Label9: TLabel
      Left = 192
      Top = 44
      Width = 26
      Height = 13
      Caption = #1058#1077#1083'.:'
    end
    object btAddNewOrg: TSpeedButton
      Left = 357
      Top = 12
      Width = 23
      Height = 22
      Caption = '+'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btAddNewOrgClick
    end
    object txtOrgName: TDBLookupComboBox
      Left = 81
      Top = 13
      Width = 272
      Height = 21
      DataField = 'ORG_ID'
      DataSource = dsWash
      KeyField = 'ORG_ID'
      ListField = 'ORG_NAME'
      ListSource = data.dsOrganization
      TabOrder = 0
    end
    object cdoOrgTel: TDBLookupComboBox
      Left = 224
      Top = 40
      Width = 129
      Height = 21
      DataField = 'ORG_ID'
      DataSource = dsWash
      KeyField = 'ORG_ID'
      ListField = 'ORG_TEL'
      ListSource = data.dsOrganization
      TabOrder = 1
    end
    object txtOrgType: TDBEdit
      Left = 81
      Top = 40
      Width = 105
      Height = 21
      DataField = 'ORGT_NAME'
      DataSource = dsWash
      TabOrder = 2
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 138
    Width = 389
    Height = 93
    Align = alTop
    Caption = #1042#1086#1076#1080#1090#1077#1083#1100':'
    TabOrder = 2
    object Label6: TLabel
      Left = 4
      Top = 17
      Width = 48
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103':'
    end
    object Label7: TLabel
      Left = 4
      Top = 42
      Width = 23
      Height = 13
      Caption = #1048#1084#1103':'
    end
    object Label8: TLabel
      Left = 4
      Top = 67
      Width = 53
      Height = 13
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
    end
    object Label10: TLabel
      Left = 197
      Top = 17
      Width = 26
      Height = 13
      Caption = #1058#1077#1083'.:'
    end
    object btAddNewDr: TSpeedButton
      Left = 357
      Top = 12
      Width = 23
      Height = 22
      Caption = '+'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btAddNewDrClick
    end
    object cboDrSName: TDBLookupComboBox
      Left = 63
      Top = 13
      Width = 121
      Height = 21
      DataField = 'D_ID'
      DataSource = dsWash
      KeyField = 'D_ID'
      ListField = 'D_NAME'
      ListSource = data.dsDriver
      TabOrder = 0
    end
    object cboDrFName: TDBLookupComboBox
      Left = 63
      Top = 39
      Width = 121
      Height = 21
      DataField = 'D_ID'
      DataSource = dsWash
      KeyField = 'D_ID'
      ListField = 'D_SECNAME'
      ListSource = data.dsDriver
      TabOrder = 1
    end
    object cboDrTName: TDBLookupComboBox
      Left = 63
      Top = 66
      Width = 121
      Height = 21
      DataField = 'D_ID'
      DataSource = dsWash
      KeyField = 'D_ID'
      ListField = 'D_THNAME'
      ListSource = data.dsDriver
      TabOrder = 2
    end
    object cboDrTel: TDBLookupComboBox
      Left = 226
      Top = 13
      Width = 127
      Height = 21
      DataField = 'D_ID'
      DataSource = dsWash
      KeyField = 'D_ID'
      ListField = 'D_TEL'
      ListSource = data.dsDriver
      TabOrder = 3
    end
  end
  object GroupBox5: TGroupBox
    Left = 199
    Top = 231
    Width = 192
    Height = 68
    Align = alCustom
    Caption = #1062#1080#1089#1090#1077#1088#1085#1072':'
    TabOrder = 3
    object Label13: TLabel
      Left = 6
      Top = 17
      Width = 35
      Height = 13
      Caption = #1053#1086#1084#1077#1088':'
    end
    object Label14: TLabel
      Left = 6
      Top = 41
      Width = 32
      Height = 13
      Caption = #1051#1102#1082#1080':'
    end
    object txtHoleCnt: TDBEdit
      Left = 41
      Top = 38
      Width = 42
      Height = 21
      DataField = 'T_HOLE_CNT'
      DataSource = dsWash
      ReadOnly = True
      TabOrder = 0
    end
    object cboTankN: TDBLookupComboBox
      Left = 41
      Top = 12
      Width = 115
      Height = 21
      DataField = 'T_ID'
      DataSource = dsWash
      KeyField = 'T_ID'
      ListField = 'T_NUM'
      ListSource = data.dsTank
      TabOrder = 1
    end
  end
  object GroupBox6: TGroupBox
    Left = 0
    Top = 299
    Width = 389
    Height = 178
    Align = alCustom
    Caption = #1051#1102#1082#1080
    TabOrder = 4
    object grHolesInfo: TDBGrid
      Left = 2
      Top = 15
      Width = 385
      Height = 161
      Align = alClient
      DataSource = dsWashDetail
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = grHolesInfoCellClick
      OnDrawColumnCell = grHolesInfoDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'HOLE_NO'
          Title.Caption = #8470
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LQ_NAME'
          Title.Caption = #1046#1080#1076#1082#1086#1089#1090#1100
          Width = 208
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'WD_PRICE'
          Title.Caption = #1062#1077#1085#1072
          Visible = True
        end
        item
          Expanded = False
          Width = 22
          Visible = True
        end>
    end
  end
  object btnSave: TBitBtn
    Left = 203
    Top = 479
    Width = 89
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Default = True
    DoubleBuffered = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = btnSaveClick
  end
  object btnCancel: TBitBtn
    Left = 298
    Top = 479
    Width = 89
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    DoubleBuffered = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    ModalResult = 2
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 6
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 231
    Width = 193
    Height = 68
    Align = alCustom
    Caption = #1052#1072#1096#1080#1085#1072
    TabOrder = 7
    object Label11: TLabel
      Left = 6
      Top = 17
      Width = 35
      Height = 13
      Caption = #1053#1086#1084#1077#1088':'
    end
    object btAddCar: TSpeedButton
      Left = 164
      Top = 11
      Width = 23
      Height = 22
      Caption = '+'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btAddCarClick
    end
    object cboCarNum: TDBLookupComboBox
      Left = 44
      Top = 12
      Width = 117
      Height = 21
      DataField = 'C_ID'
      DataSource = dsWash
      KeyField = 'C_ID'
      ListField = 'CARNUM'
      ListSource = data.dsCar
      TabOrder = 0
    end
  end
  object qWash: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'w_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT w.*'
      'FROM WASH w'
      'WHERE w.w_id = :w_id')
    SQLConnection = data.connection
    Left = 128
    Top = 24
  end
  object prvWash: TDataSetProvider
    DataSet = qWash
    Left = 168
    Top = 24
  end
  object cdsWash: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'w_id'
        ParamType = ptInput
      end>
    ProviderName = 'prvWash'
    Left = 208
    Top = 24
    object cdsWashW_ID: TIntegerField
      FieldName = 'W_ID'
    end
    object cdsWashOP_ID: TIntegerField
      FieldName = 'OP_ID'
    end
    object cdsWashWS_ID: TIntegerField
      FieldName = 'WS_ID'
    end
    object cdsWashORG_ID: TIntegerField
      FieldName = 'ORG_ID'
      OnChange = cdsWashORG_IDChange
    end
    object cdsWashC_ID: TIntegerField
      FieldName = 'C_ID'
    end
    object cdsWashD_ID: TIntegerField
      FieldName = 'D_ID'
      OnChange = cdsWashD_IDChange
    end
    object cdsWashT_ID: TIntegerField
      FieldName = 'T_ID'
    end
    object cdsWashW_SUMM: TFloatField
      FieldName = 'W_SUMM'
    end
    object cdsWashW_TIME_BEGIN: TSQLTimeStampField
      FieldName = 'W_TIME_BEGIN'
    end
    object cdsWashW_TIME_END: TSQLTimeStampField
      FieldName = 'W_TIME_END'
    end
    object cdsWashW_DATE: TSQLTimeStampField
      FieldName = 'W_DATE'
    end
    object cdsWashORGT_ID: TIntegerField
      FieldKind = fkLookup
      FieldName = 'ORGT_ID'
      LookupDataSet = data.cdsOrganization
      LookupKeyFields = 'ORG_ID'
      LookupResultField = 'ORGT_ID'
      KeyFields = 'ORG_ID'
      Lookup = True
    end
    object cdsWashORGT_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'ORGT_NAME'
      LookupDataSet = data.cdsOrgType
      LookupKeyFields = 'ORGT_ID'
      LookupResultField = 'ORGT_NAME'
      KeyFields = 'ORGT_ID'
      Size = 16
      Lookup = True
    end
    object cdsWashT_HOLE_CNT: TIntegerField
      FieldKind = fkLookup
      FieldName = 'T_HOLE_CNT'
      LookupDataSet = data.cdsTank
      LookupKeyFields = 'T_ID'
      LookupResultField = 'T_HOLE_CNT'
      KeyFields = 'T_ID'
      Lookup = True
    end
  end
  object dsWash: TDataSource
    DataSet = cdsWash
    Left = 248
    Top = 24
  end
  object prvWasDetail: TDataSetProvider
    DataSet = qWashDetail
    Left = 128
    Top = 360
  end
  object cdsWashDetail: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'w_id'
        ParamType = ptInput
      end>
    ProviderName = 'prvWasDetail'
    Left = 184
    Top = 360
    object cdsWashDetailWD_ID: TIntegerField
      FieldName = 'WD_ID'
    end
    object cdsWashDetailW_ID: TIntegerField
      FieldName = 'W_ID'
    end
    object cdsWashDetailWD_HOLE_ST: TIntegerField
      FieldName = 'WD_HOLE_ST'
    end
    object cdsWashDetailLQ_ID: TIntegerField
      FieldName = 'LQ_ID'
    end
    object cdsWashDetailWD_PRICE: TFloatField
      FieldName = 'WD_PRICE'
    end
    object cdsWashDetailHOLE_NO: TIntegerField
      FieldName = 'HOLE_NO'
    end
    object cdsWashDetailLQ_NAME: TStringField
      FieldName = 'LQ_NAME'
      Size = 32
    end
  end
  object dsWashDetail: TDataSource
    DataSet = cdsWashDetail
    Left = 240
    Top = 360
  end
  object qWashDetail: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'w_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT wd.*, lq.lq_name'
      'FROM WASH_DETAIL wd'
      'LEFT JOIN LIQUID lq ON (lq.lq_id = wd.lq_id)'
      'WHERE wd.w_id = :w_id'
      'ORDER BY hole_no')
    SQLConnection = data.connection
    Left = 64
    Top = 360
  end
end
