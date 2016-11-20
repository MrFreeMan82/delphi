object frmSdelkaForm: TfrmSdelkaForm
  Left = 751
  Top = 224
  BorderStyle = bsDialog
  Caption = #1057#1076#1077#1083#1082#1072
  ClientHeight = 524
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline sdelka: TfrmSdelka
    Left = 0
    Top = 0
    Width = 299
    Height = 524
    Align = alClient
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    inherited btnHistory: TSpeedButton
      OnClick = sdelkabtnHistoryClick
    end
    inherited btSave: TBitBtn
      OnClick = sdelkabtSaveClick
    end
    inherited btCancel: TBitBtn
      ModalResult = 2
    end
    inherited pages: TPageControl
      inherited pgSdelkaVInternet: TTabSheet
        inherited Label6: TLabel
          Top = 100
        end
        inherited Label7: TLabel
          Top = 140
        end
        inherited edInternetEndDate: TDBEditEh
          Top = 156
        end
        inherited edInternetStartDate: TDBEditEh
          Top = 115
        end
      end
    end
    inherited btChooseCust: TButton
      OnClick = sdelkabtChooseCustClick
    end
    inherited cbIsImportant: TDBCheckBoxEh
      Left = 144
    end
  end
end
