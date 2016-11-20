object frmMdlText: TfrmMdlText
  Left = 738
  Top = 345
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1058#1077#1082#1089#1090' '#1084#1086#1076#1091#1083#1103
  ClientHeight = 382
  ClientWidth = 671
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 354
    Width = 671
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      671
      28)
    object btnOK: TBitBtn
      Left = 509
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1050
      TabOrder = 0
      OnClick = btnOKClick
      Glyph.Data = {
        CE000000424DCE0000000000000076000000280000000B0000000B0000000100
        04000000000058000000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF0FFFF0
        0000FFFFF000FFF00000FFFF00000FF00000FFF0000000F00000FF0000000000
        0000F00000F000F0000000000FFF0FF00000F000FFFFFFF00000FF0FFFFFFFF0
        0000FFFFFFFFFFF00000FFFFFFFFFFF00000}
    end
    object btnCancel: TBitBtn
      Left = 591
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = btnCancelClick
      Glyph.Data = {
        CE000000424DCE0000000000000076000000280000000B0000000B0000000100
        04000000000058000000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF0FFFFF0FF0
        0000F000FFF000F0000000000F0000000000F000000000F00000FF0000000FF0
        0000FFF00000FFF00000FF0000000FF00000F000000000F0000000000F000000
        0000F000FFF000F00000FF0FFFFF0FF00000}
    end
    object btAddMdl: TBitBtn
      Left = 5
      Top = 2
      Width = 130
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1084#1086#1076#1091#1083#1100
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btAddMdlClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
        9999000000000009999900333333333099990B033333333309990FB033333333
        30990BFB0333333333090FBFB000000000000BFBFBFBFB0999990FBFBFBFBF09
        99990BFB00000009999990009999999900099999999999999009999999990999
        0909999999999000999999999999999999999999999999999999}
    end
  end
  object txtMdlTxt: TDBRichEdit
    Left = 0
    Top = 0
    Width = 671
    Height = 354
    Align = alClient
    DataField = 'MDL_TEXT'
    PlainText = True
    PopupMenu = popCopy
    TabOrder = 1
  end
  object popCopy: TPopupMenu
    Left = 440
    Top = 96
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
  end
  object qSave: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'st'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'same'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pd_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'UPDATE OBJAVLENIE ob'
      'SET ob.OB_STATE_TXT = :st'
      'WHERE ob.SAME_CODE = :same '
      'AND ob.PD_ID = :pd_id')
    SQLConnection = data.connection
    Left = 88
    Top = 120
  end
  object qSd_num: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ob_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'gz_id'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'SELECT s.SD_NUM'
      'FROM OBJAVLENIE ob'
      'LEFT JOIN podacha p ON (p.PD_ID = ob.PD_ID)'
      'LEFT JOIN sdelka s ON (s.AG_ID = p.AG_ID AND s.SD_ID = p.SD_ID)'
      'WHERE ob.OBJAV_ID = :ob_id'
      'AND   p.IS_ID = (SELECT is_id FROM GET_CURRENT_ISSUE(:gz_id))')
    SQLConnection = data.connection
    Left = 104
    Top = 184
  end
end
