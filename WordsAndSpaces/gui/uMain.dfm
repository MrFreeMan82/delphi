object frmSpaces: TfrmSpaces
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 358
  ClientWidth = 611
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
  object mInput: TMemo
    Left = 8
    Top = 8
    Width = 265
    Height = 257
    TabOrder = 0
  end
  object mOutput: TMemo
    Left = 288
    Top = 8
    Width = 305
    Height = 257
    TabOrder = 1
  end
  object btBegin: TButton
    Left = 208
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Begin'
    TabOrder = 2
    OnClick = btBeginClick
  end
  object btSave: TButton
    Left = 289
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 3
    OnClick = btSaveClick
  end
end
