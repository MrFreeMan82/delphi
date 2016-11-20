object frmEditPodacha: TfrmEditPodacha
  Left = 484
  Top = 389
  BorderStyle = bsDialog
  Caption = #1055#1086#1076#1072#1095#1072
  ClientHeight = 85
  ClientWidth = 287
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
  object Label1: TLabel
    Left = 11
    Top = 5
    Width = 31
    Height = 13
    Caption = #1053#1086#1084#1077#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 198
    Top = 5
    Width = 19
    Height = 13
    Caption = #1043#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Shape1: TShape
    Left = 2
    Top = 48
    Width = 283
    Height = 1
    Pen.Color = clBtnShadow
  end
  object edIssue: TDBEditEh
    Left = 10
    Top = 21
    Width = 79
    Height = 19
    AlwaysShowBorder = True
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Flat = True
    ParentFont = False
    TabOrder = 0
    Visible = True
    OnEnter = edIssueEnter
  end
  object edYear: TDBEditEh
    Left = 196
    Top = 21
    Width = 79
    Height = 19
    AlwaysShowBorder = True
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Flat = True
    ParentFont = False
    TabOrder = 2
    Visible = True
  end
  object btMore: TBitBtn
    Left = 10
    Top = 55
    Width = 80
    Height = 25
    Caption = #1045#1097#1105
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btMoreClick
    Glyph.Data = {
      62000000424D62000000000000003E0000002800000009000000090000000100
      010000000000240000000000000000000000020000000000000000000000FFFF
      FF00E3800000E3800000E3800000000000000000000000000000E3800000E380
      0000E3800000}
  end
  object btDone: TBitBtn
    Left = 103
    Top = 55
    Width = 80
    Height = 25
    Caption = #1054#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 4
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
  object btCancel: TBitBtn
    Left = 196
    Top = 55
    Width = 80
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 5
    OnClick = btCancelClick
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000B0000000B0000000100
      04000000000058000000C40E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF0FFFFF0FF0
      0000F000FFF000F0000000000F0000000000F000000000F00000FF0000000FF0
      0000FFF00000FFF00000FF0000000FF00000F000000000F0000000000F000000
      0000F000FFF000F00000FF0FFFFF0FF00000}
  end
  object cbFreeOfCharge: TDBCheckBoxEh
    Left = 105
    Top = 23
    Width = 81
    Height = 17
    AlwaysShowBorder = True
    Caption = #1041#1077#1089#1087#1083#1072#1090#1085#1086
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object spPodachaInsert: TSQLStoredProc
    MaxBlobSize = -1
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
        DataType = ftInteger
        Name = 'GZ_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PD_FREE_OF_CHARGE'
        ParamType = ptInput
      end>
    SQLConnection = data.connection
    StoredProcName = 'PODACHA_INSERT'
    Left = 192
    Top = 24
  end
end
