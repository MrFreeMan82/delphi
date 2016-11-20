object frmCustForm: TfrmCustForm
  Left = 800
  Top = 291
  Width = 756
  Height = 518
  ActiveControl = pnlHolder
  Caption = #1050#1083#1080#1077#1085#1090#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHolder: TPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 443
    Align = alClient
    TabOrder = 0
    inline cust: TfrmCust
      Left = 1
      Top = 1
      Width = 738
      Height = 441
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      inherited pnlCustPhone: TPanel
        Left = 545
        Top = 39
        Width = 191
        Height = 339
        inherited Shape1: TShape
          Width = 191
        end
        inherited btDeletePhone: TBitBtn
          Left = 162
        end
        inherited DBGrid3: TDBGridEh
          Width = 191
          Height = 316
        end
      end
      inherited pnlCust: TPanel
        Left = 7
        Width = 530
        Height = 339
        TabOrder = 3
        inherited Shape3: TShape
          Width = 530
        end
        inherited btDeleteCust: TBitBtn
          Left = 501
        end
        inherited DBGrid2: TDBGridEh
          Width = 530
          Height = 316
          Columns = <
            item
              EditButtons = <>
              FieldName = 'CU_ID_COMPOUND'
              Footers = <>
              Title.Color = clSkyBlue
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'CU_COMPANY_ID'
              Footers = <>
              Title.Caption = #1048#1044
              Title.Color = clSkyBlue
              Width = 51
            end
            item
              EditButtons = <>
              FieldName = 'CU_NAME'
              Footers = <>
              Title.Color = clSkyBlue
              Width = 137
            end
            item
              EditButtons = <>
              FieldName = 'CU_OKPO'
              Footers = <>
              Title.Caption = #1028#1044#1056#1055#1054#1059
              Title.Color = clSkyBlue
              Width = 84
            end
            item
              EditButtons = <>
              FieldName = 'CUST_BONUS'
              Footers = <>
              Title.Color = clSkyBlue
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'CU_INFO'
              Footers = <>
              Title.Color = clSkyBlue
              Width = 138
            end
            item
              Checkboxes = True
              EditButtons = <>
              FieldName = 'HAS_CUST_UNIQUE'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
              Title.Caption = #1041#1091#1093'. '#1076#1072#1085#1085#1099#1077
              Title.Color = clSkyBlue
              Width = 69
            end>
        end
        inherited btEditCust: TBitBtn
          Left = 473
        end
        inherited btRefreshCust: TBitBtn
          Left = 445
        end
      end
      inherited btAddCust: TBitBtn
        TabOrder = 1
      end
      inherited btAddPhone: TBitBtn
        TabOrder = 2
      end
      inherited Panel1: TPanel
        Width = 738
        inherited Label1: TLabel
          Left = 100
          Top = 1
          Width = 209
          Height = 32
          Align = alCustom
          AutoSize = False
          Caption = '     '#1053#1072#1079#1074#1072#1085#1080#1077', '#1090#1077#1083#1077#1092#1086#1085' '#1080#1083#1080' '#1028#1044#1056#1055#1054
          Layout = tlCenter
        end
        inherited Shape7: TShape
          Width = 738
        end
        inherited Shape5: TShape
          Width = 738
        end
        inherited edSearch: TMaskEdit
          Left = 278
          Top = 5
        end
        inherited btSearch: TBitBtn
          Left = 431
          Top = 3
          OnClick = custbtSearchClick
        end
      end
      inherited Panel2: TPanel
        Top = 373
        Width = 738
        inherited Shape9: TShape
          Width = 738
        end
        inherited Label5: TLabel
          Left = 261
        end
        inherited Label7: TLabel
          Left = 433
          Visible = True
        end
        inherited edNewCust: TDBEditEh
          Width = 130
        end
        inherited edNewCustOKPO: TDBEditEh
          Left = 313
        end
        inherited edNewPhone: TMaskEdit
          Left = 606
          Width = 86
        end
        inherited txtCompanyID: TEdit
          Left = 453
          Width = 84
          Visible = True
        end
      end
      inherited Panel3: TPanel
        Top = 407
        Width = 738
        inherited Shape11: TShape
          Width = 738
        end
      end
    end
  end
  object pnlButtonHolder: TPanel
    Left = 0
    Top = 443
    Width = 740
    Height = 37
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      740
      37)
    object BitBtn1: TBitBtn
      Left = 636
      Top = 7
      Width = 91
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
end
