object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  ClientHeight = 117
  ClientWidth = 283
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 40
    Height = 16
    Caption = #1051#1086#1075#1080#1085':'
  end
  object Label2: TLabel
    Left = 8
    Top = 46
    Width = 48
    Height = 16
    Caption = #1055#1072#1088#1086#1083#1100':'
  end
  object txtUserName: TEdit
    Left = 80
    Top = 8
    Width = 193
    Height = 24
    TabOrder = 0
    Text = '1'
  end
  object txtUserPassword: TEdit
    Left = 80
    Top = 38
    Width = 193
    Height = 24
    TabOrder = 1
    Text = '1'
  end
  object btOk: TBitBtn
    Left = 104
    Top = 82
    Width = 83
    Height = 25
    DoubleBuffered = True
    Kind = bkOK
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = btOkClick
  end
  object btCancel: TBitBtn
    Left = 193
    Top = 82
    Width = 83
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    DoubleBuffered = True
    Kind = bkCancel
    ParentDoubleBuffered = False
    TabOrder = 3
  end
  object qLogin: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'login'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pass'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT u.u_id'
      'FROM "USER" u '
      'WHERE u.u_login = :login'
      'AND u.u_pass = :pass')
    SQLConnection = data.connection
    Left = 56
    Top = 24
    object qLoginU_ID: TIntegerField
      FieldName = 'U_ID'
    end
  end
end
