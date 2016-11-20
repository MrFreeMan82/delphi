object frmSdelkaPublForm: TfrmSdelkaPublForm
  Left = 840
  Top = 459
  Width = 743
  Height = 351
  Caption = #1054#1073#1098#1103#1074#1083#1077#1085#1080#1103' '#1089#1076#1077#1083#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline sdelkaObjavs: TfrmSdelkaPubl
    Left = 0
    Top = 0
    Width = 727
    Height = 201
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    inherited Panel2: TPanel
      Width = 727
      Height = 201
      inherited Shape1: TShape
        Width = 727
      end
      inherited grObjavs: TDBGridEh
        Width = 727
        Height = 178
      end
      inherited btEdit: TBitBtn
        OnClick = sdelkaObjavsbtEditClick
      end
      inherited btView: TBitBtn
        OnClick = sdelkaObjavsbtViewClick
      end
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 278
    Width = 727
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      727
      35)
    object Shape7: TShape
      Left = 0
      Top = 0
      Width = 727
      Height = 1
      Align = alTop
      Pen.Color = clBtnShadow
    end
    object btCancelAg: TBitBtn
      Left = 657
      Top = 6
      Width = 66
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
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
      Left = 576
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 201
    Width = 727
    Height = 77
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    Caption = 'Panel1'
    TabOrder = 2
    object Label1: TLabel
      Left = 3
      Top = 3
      Width = 721
      Height = 13
      Align = alTop
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1089#1076#1077#1083#1082#1077
    end
    object DBMemo1: TDBMemo
      Left = 3
      Top = 16
      Width = 721
      Height = 58
      TabStop = False
      Align = alClient
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'SD_COMMENT'
      DataSource = dsSdelkaComment
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object qrySdelkaComment: TSimpleDataSet
    Aggregates = <>
    Connection = data.connection
    DataSet.CommandText = 
      'SELECT SD_COMMENT FROM SDELKA WHERE AG_ID=:AG_ID AND SD_ID=:SD_I' +
      'D'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <
      item
        DataType = ftString
        Name = 'AG_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'SD_ID'
        ParamType = ptInput
        Value = '0'
      end>
    Params = <>
    ReadOnly = True
    Left = 320
    Top = 176
    object qrySdelkaCommentSD_COMMENT: TStringField
      FieldName = 'SD_COMMENT'
      Size = 1024
    end
  end
  object dsSdelkaComment: TDataSource
    DataSet = qrySdelkaComment
    Left = 432
    Top = 175
  end
end
