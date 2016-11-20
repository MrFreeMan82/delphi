object frmNewOrg: TfrmNewOrg
  Left = 0
  Top = 0
  Caption = #1053#1086#1074#1072#1103' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
  ClientHeight = 124
  ClientWidth = 302
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
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
    Left = 4
    Top = 71
    Width = 26
    Height = 13
    Caption = #1058#1077#1083'.:'
  end
  object cboOrgType: TDBLookupComboBox
    Left = 86
    Top = 39
    Width = 208
    Height = 21
    DataField = 'ORGT_ID'
    DataSource = dsNewOrg
    KeyField = 'ORGT_ID'
    ListField = 'ORGT_NAME'
    ListSource = data.dsOrgType
    TabOrder = 1
  end
  object btSave: TBitBtn
    Left = 117
    Top = 93
    Width = 85
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
    TabOrder = 3
    OnClick = btSaveClick
  end
  object btCancel: TBitBtn
    Left = 208
    Top = 93
    Width = 86
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    DoubleBuffered = True
    Kind = bkCancel
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = btCancelClick
  end
  object txtOrgName: TDBEdit
    Left = 86
    Top = 12
    Width = 208
    Height = 21
    DataField = 'ORG_NAME'
    DataSource = dsNewOrg
    TabOrder = 0
  end
  object txtOrgTel: TDBEdit
    Left = 86
    Top = 66
    Width = 208
    Height = 21
    DataField = 'ORG_TEL'
    DataSource = dsNewOrg
    TabOrder = 2
  end
  object qNewOrg: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM ORGANIZATION org WHERE org.org_id = -1')
    SQLConnection = data.connection
    Left = 40
    Top = 8
  end
  object prvNewOrg: TDataSetProvider
    DataSet = qNewOrg
    Left = 80
    Top = 8
  end
  object cdsNewOrg: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvNewOrg'
    Left = 120
    Top = 8
    object cdsNewOrgORG_ID: TIntegerField
      FieldName = 'ORG_ID'
    end
    object cdsNewOrgORGT_ID: TIntegerField
      FieldName = 'ORGT_ID'
    end
    object cdsNewOrgOP_ID: TIntegerField
      FieldName = 'OP_ID'
    end
    object cdsNewOrgORG_NAME: TStringField
      FieldName = 'ORG_NAME'
      Size = 512
    end
    object cdsNewOrgORG_TEL: TStringField
      FieldName = 'ORG_TEL'
      EditMask = '!+99\ 000 0000 000;1;_'
      Size = 32
    end
  end
  object dsNewOrg: TDataSource
    DataSet = cdsNewOrg
    Left = 160
    Top = 8
  end
end
