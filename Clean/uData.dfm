object data: Tdata
  OldCreateOrder = False
  Height = 434
  Width = 541
  object connection: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxfb.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database='
      'RoleName=RoleName'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'ServerCharSet=WIN1251'
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=True')
    VendorLib = 'fbclient.dll'
    Left = 24
    Top = 6
  end
  object qAccessRight: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'wnd'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT ar.*'
      'FROM ACCESS_RIGHTS_RULE ar'
      'WHERE ar.arr_window_name = :wnd'
      'ORDER BY ar.ARR_ORDER')
    SQLConnection = connection
    Left = 96
    Top = 8
    object qAccessRightARR_WINDOW_NAME: TStringField
      FieldName = 'ARR_WINDOW_NAME'
      Size = 32
    end
    object qAccessRightARR_ORDER: TSmallintField
      FieldName = 'ARR_ORDER'
    end
    object qAccessRightARR_NAME: TStringField
      FieldName = 'ARR_NAME'
      Size = 256
    end
    object qAccessRightARR_USER_TYPES: TStringField
      FieldName = 'ARR_USER_TYPES'
      Size = 32
    end
    object qAccessRightARR_TARGET_OBJECT_NAME: TStringField
      FieldName = 'ARR_TARGET_OBJECT_NAME'
      Size = 512
    end
    object qAccessRightARR_CHECK_OBJECT_NAME: TStringField
      FieldName = 'ARR_CHECK_OBJECT_NAME'
      Size = 64
    end
    object qAccessRightARR_CHECK_MODE: TStringField
      FieldName = 'ARR_CHECK_MODE'
      Size = 2
    end
    object qAccessRightARR_ACTION: TStringField
      FieldName = 'ARR_ACTION'
      Size = 1
    end
    object qAccessRightARR_CHECK_OBJECT_VALUE: TSingleField
      FieldName = 'ARR_CHECK_OBJECT_VALUE'
    end
  end
  object qOrganization: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT o.*, ot.orgt_name'
      'FROM organization o'
      'LEFT JOIN org_type ot ON(ot.orgt_id = o.orgt_id)')
    SQLConnection = connection
    Left = 24
    Top = 80
  end
  object qDriver: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM DRIVER')
    SQLConnection = connection
    Left = 24
    Top = 128
  end
  object qCar: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT c.*, (c.c_num1|| '#39'-'#39' || CAST(c.c_num2 AS VARCHAR(3))) AS ' +
        'carnum'
      'FROM CAR c')
    SQLConnection = connection
    Left = 24
    Top = 176
  end
  object qTank: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TANK')
    SQLConnection = connection
    Left = 24
    Top = 224
  end
  object prvOrganization: TDataSetProvider
    DataSet = qOrganization
    Left = 72
    Top = 80
  end
  object cdsOrganization: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvOrganization'
    Left = 112
    Top = 80
    object cdsOrganizationORG_ID: TIntegerField
      FieldName = 'ORG_ID'
    end
    object cdsOrganizationORGT_ID: TIntegerField
      FieldName = 'ORGT_ID'
    end
    object cdsOrganizationOP_ID: TIntegerField
      FieldName = 'OP_ID'
    end
    object cdsOrganizationORG_NAME: TStringField
      FieldName = 'ORG_NAME'
      Size = 512
    end
    object cdsOrganizationORG_TEL: TStringField
      FieldName = 'ORG_TEL'
      EditMask = '!+99\ 000 0000 000;1;_'
      Size = 32
    end
    object cdsOrganizationORGT_NAME: TStringField
      FieldName = 'ORGT_NAME'
      Size = 16
    end
  end
  object dsOrganization: TDataSource
    DataSet = cdsOrganization
    Left = 160
    Top = 80
  end
  object prvDriver: TDataSetProvider
    DataSet = qDriver
    Left = 72
    Top = 128
  end
  object cdsDriver: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDriver'
    Left = 112
    Top = 128
    object cdsDriverD_ID: TIntegerField
      FieldName = 'D_ID'
    end
    object cdsDriverORG_ID: TIntegerField
      FieldName = 'ORG_ID'
    end
    object cdsDriverD_NAME: TStringField
      FieldName = 'D_NAME'
      Size = 64
    end
    object cdsDriverD_SECNAME: TStringField
      FieldName = 'D_SECNAME'
      Size = 64
    end
    object cdsDriverD_THNAME: TStringField
      FieldName = 'D_THNAME'
      Size = 64
    end
    object cdsDriverD_TEL: TStringField
      FieldName = 'D_TEL'
      Size = 32
    end
  end
  object dsDriver: TDataSource
    DataSet = cdsDriver
    Left = 160
    Top = 128
  end
  object prvCar: TDataSetProvider
    DataSet = qCar
    Left = 64
    Top = 176
  end
  object cdsCar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCar'
    Left = 112
    Top = 176
    object cdsCarC_ID: TIntegerField
      FieldName = 'C_ID'
    end
    object cdsCarD_ID: TIntegerField
      FieldName = 'D_ID'
    end
    object cdsCarC_NUM1: TStringField
      FieldName = 'C_NUM1'
      Size = 16
    end
    object cdsCarCARNUM: TStringField
      FieldName = 'CARNUM'
      Size = 19
    end
    object cdsCarC_NUM2: TIntegerField
      FieldName = 'C_NUM2'
    end
  end
  object dsCar: TDataSource
    DataSet = cdsCar
    Left = 160
    Top = 176
  end
  object prvTank: TDataSetProvider
    DataSet = qTank
    Left = 64
    Top = 224
  end
  object cdsTank: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTank'
    Left = 112
    Top = 224
    object cdsTankT_ID: TIntegerField
      FieldName = 'T_ID'
    end
    object cdsTankT_NUM: TStringField
      FieldName = 'T_NUM'
      Size = 16
    end
    object cdsTankT_HOLE_CNT: TIntegerField
      FieldName = 'T_HOLE_CNT'
    end
  end
  object dsTank: TDataSource
    DataSet = cdsTank
    Left = 160
    Top = 224
  end
  object dsOrgType: TDataSource
    DataSet = cdsOrgType
    Left = 160
    Top = 280
  end
  object cdsOrgType: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvOrgType'
    Left = 112
    Top = 280
    object cdsOrgTypeORGT_ID: TIntegerField
      FieldName = 'ORGT_ID'
    end
    object cdsOrgTypeORGT_NAME: TStringField
      FieldName = 'ORGT_NAME'
      Size = 16
    end
  end
  object prvOrgType: TDataSetProvider
    DataSet = qOrgType
    Left = 64
    Top = 280
  end
  object qOrgType: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM ORG_TYPE')
    SQLConnection = connection
    Left = 24
    Top = 280
  end
  object qNextGenValue: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = connection
    Left = 144
    Top = 8
  end
  object qLiquid: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM LIQUID')
    SQLConnection = connection
    Left = 24
    Top = 328
  end
  object prvLiquid: TDataSetProvider
    DataSet = qLiquid
    Left = 64
    Top = 328
  end
  object cdsLiquid: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvLiquid'
    Left = 112
    Top = 328
    object cdsLiquidLQ_ID: TIntegerField
      FieldName = 'LQ_ID'
    end
    object cdsLiquidLQ_NAME: TStringField
      FieldName = 'LQ_NAME'
      Size = 32
    end
    object cdsLiquidLQ_PRICE: TFloatField
      FieldName = 'LQ_PRICE'
    end
  end
  object dsLiquid: TDataSource
    DataSet = cdsLiquid
    Left = 160
    Top = 328
  end
  object qFNames: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM FNAMES')
    SQLConnection = connection
    Left = 232
    Top = 80
  end
  object prvFNames: TDataSetProvider
    DataSet = qFNames
    Left = 272
    Top = 80
  end
  object cdsFNames: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvFNames'
    Left = 304
    Top = 80
    object cdsFNamesFN_NAME: TStringField
      FieldName = 'FN_NAME'
      Size = 64
    end
  end
  object dsFNames: TDataSource
    DataSet = cdsFNames
    Left = 344
    Top = 80
  end
  object qSNames: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM SNAMES')
    SQLConnection = connection
    Left = 232
    Top = 136
  end
  object prvSNames: TDataSetProvider
    DataSet = qSNames
    Left = 272
    Top = 136
  end
  object cdsSNames: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSNames'
    Left = 312
    Top = 136
    object cdsSNamesSN_NAME: TStringField
      FieldName = 'SN_NAME'
      Size = 64
    end
  end
  object dsSNames: TDataSource
    DataSet = cdsSNames
    Left = 352
    Top = 136
  end
  object qTNames: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM TNAMES')
    SQLConnection = connection
    Left = 232
    Top = 192
  end
  object prvTNames: TDataSetProvider
    DataSet = qTNames
    Left = 264
    Top = 192
  end
  object cdsTNames: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTNames'
    Left = 304
    Top = 192
    object cdsTNamesTN_NAME: TStringField
      FieldName = 'TN_NAME'
      Size = 64
    end
  end
  object dsTNames: TDataSource
    DataSet = cdsTNames
    Left = 352
    Top = 192
  end
end
