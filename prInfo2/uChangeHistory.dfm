object frmChHis: TfrmChHis
  Left = 733
  Top = 216
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1084#1086#1076#1091#1083#1103
  ClientHeight = 476
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnMouseWheel = FormMouseWheel
  PixelsPerInch = 96
  TextHeight = 16
  object pnlHis: TPanel
    Left = 0
    Top = 450
    Width = 650
    Height = 26
    Align = alBottom
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 5
      Width = 47
      Height = 16
      Caption = #1057#1086#1079#1076#1072#1085':'
    end
    object Label2: TLabel
      Left = 190
      Top = 5
      Width = 55
      Height = 16
      Caption = #1048#1079#1084#1077#1085#1077#1085':'
    end
    object DBEdit1: TDBEdit
      Left = 57
      Top = 5
      Width = 120
      Height = 18
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'CREATE_DATE'
      DataSource = dsHistory
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 248
      Top = 5
      Width = 120
      Height = 18
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'MODIFY_DATE'
      DataSource = dsHistory
      ReadOnly = True
      TabOrder = 1
    end
    object navHis: TDBNavigator
      Left = 422
      Top = 3
      Width = 224
      Height = 20
      DataSource = dsHistory
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 2
      OnClick = navHisClick
    end
    object BitBtn1: TBitBtn
      Left = 785
      Top = 1
      Width = 92
      Height = 25
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 3
      NumGlyphs = 2
    end
  end
  object ScrollBox: TScrollBox
    Left = 0
    Top = 0
    Width = 650
    Height = 450
    HorzScrollBar.Visible = False
    Align = alClient
    TabOrder = 1
    object img: TImage
      Left = 0
      Top = 0
      Width = 635
      Height = 446
      AutoSize = True
      Proportional = True
    end
  end
  object dsHistory: TDataSource
    DataSet = cdsHistory
    Left = 504
    Top = 292
  end
  object cdsHistory: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvHistory'
    Left = 456
    Top = 292
    object cdsHistoryCREATE_DATE: TSQLTimeStampField
      FieldName = 'CREATE_DATE'
    end
    object cdsHistoryMODIFY_DATE: TSQLTimeStampField
      FieldName = 'MODIFY_DATE'
    end
    object cdsHistoryCH_PICTURE: TBlobField
      FieldName = 'CH_PICTURE'
      Size = 1
    end
    object cdsHistoryCONTENT_PICTURE: TBlobField
      FieldName = 'CONTENT_PICTURE'
      Size = 1
    end
  end
  object prvHistory: TDataSetProvider
    DataSet = qHistory
    Left = 416
    Top = 292
  end
  object qHistory: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'cont_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      
        'select mh.CONT_ID, oc.CREATE_DATE, oc.MODIFY_DATE, oc.CH_PICTURE' +
        ', oc.CONTENT_PICTURE'
      'from MODULE_CHANGE_HISTORY(:cont_id, 0) mh'
      'left join OBJAV_CONTENT oc on (oc.CONTENT_ID = mh.cont_id)'
      'where oc.CH_PICTURE is not null')
    SQLConnection = data.connection
    Left = 376
    Top = 292
    object qHistoryCH_PICTURE: TBlobField
      FieldName = 'CH_PICTURE'
      Size = 1
    end
    object qHistoryCREATE_DATE: TSQLTimeStampField
      FieldName = 'CREATE_DATE'
    end
    object qHistoryMODIFY_DATE: TSQLTimeStampField
      FieldName = 'MODIFY_DATE'
    end
    object qHistoryCONTENT_PICTURE: TBlobField
      FieldName = 'CONTENT_PICTURE'
      Size = 1
    end
  end
end
