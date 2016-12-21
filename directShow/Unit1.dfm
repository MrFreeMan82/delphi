object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 519
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 478
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 478
    Width = 912
    Height = 41
    Align = alBottom
    Caption = 'Panel2'
    TabOrder = 1
    object Button1: TButton
      Left = 824
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
    object btPlayVideo: TButton
      Left = 104
      Top = 8
      Width = 75
      Height = 25
      Caption = 'PlayVideo'
      TabOrder = 1
      OnClick = btPlayVideoClick
    end
    object btPlay: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'PLayAudio'
      TabOrder = 2
    end
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
    Left = 512
    Top = 232
  end
  object IdFTP1: TIdFTP
    IPVersion = Id_IPv4
    AutoLogin = True
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 400
    Top = 272
  end
end
