object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 394
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 535
    Height = 217
    Align = alTop
    TabOrder = 0
  end
  object edURL: TEdit
    Left = 8
    Top = 223
    Width = 519
    Height = 21
    TabOrder = 1
    Text = 
      'http://rozetka.com.ua/search/?section_id=&section=&text=8991B009' +
      '&rz-search-button='
  end
  object btParse: TButton
    Left = 8
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Parse'
    TabOrder = 2
    OnClick = btParseClick
  end
  object IdHTTP: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 360
    Top = 96
  end
end
