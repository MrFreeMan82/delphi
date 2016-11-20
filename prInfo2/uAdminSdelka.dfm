object frmControlSdelka: TfrmControlSdelka
  Left = 753
  Top = 250
  Width = 808
  Height = 386
  Align = alClient
  BorderIcons = []
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgSdelkaControl: TPageControl
    Left = 0
    Top = 0
    Width = 792
    Height = 348
    ActivePage = tabTasks
    Align = alClient
    TabOrder = 0
    object tabTasks: TTabSheet
      Caption = #1047#1072#1076#1072#1095#1080
      DesignSize = (
        784
        320)
      object pgTasks: TPageControl
        Left = 353
        Top = 0
        Width = 431
        Height = 320
        ActivePage = tabChangeDate
        Align = alClient
        TabOrder = 0
        object tbAddPodacha: TTabSheet
          TabVisible = False
          object Label100: TLabel
            Left = 24
            Top = 29
            Width = 69
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1072#1075#1077#1085#1090#1072
          end
          object Label101: TLabel
            Left = 24
            Top = 61
            Width = 70
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1089#1076#1077#1083#1082#1080
          end
          object Label102: TLabel
            Left = 24
            Top = 93
            Width = 70
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1075#1072#1079#1077#1090#1099
          end
          object edAG_NUM: TEdit
            Left = 112
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object edSD_NUM: TEdit
            Left = 112
            Top = 56
            Width = 121
            Height = 21
            TabOrder = 1
          end
          object edGZ_NUM: TEdit
            Left = 112
            Top = 88
            Width = 121
            Height = 21
            TabOrder = 2
          end
          object btSelectGzNUM: TButton
            Left = 236
            Top = 88
            Width = 30
            Height = 20
            Caption = '...'
            TabOrder = 3
            OnClick = btSelectGzNUMClick
          end
          object chkFreePodacha: TCheckBox
            Left = 24
            Top = 124
            Width = 321
            Height = 17
            Caption = #1041#1077#1089#1087#1083#1072#1090#1085#1072#1103' '#1087#1086#1076#1072#1095#1072
            TabOrder = 4
          end
        end
        object tabChangeSumma: TTabSheet
          ImageIndex = 1
          TabVisible = False
          object Label103: TLabel
            Left = 24
            Top = 29
            Width = 69
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1072#1075#1077#1085#1090#1072
          end
          object Label104: TLabel
            Left = 24
            Top = 61
            Width = 70
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1089#1076#1077#1083#1082#1080
          end
          object Label105: TLabel
            Left = 24
            Top = 93
            Width = 63
            Height = 13
            Caption = #1053#1086#1074#1072#1103' '#1089#1091#1084#1084#1072
          end
          object edSumAG_NUM: TEdit
            Left = 112
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object edSumSD_ID: TEdit
            Left = 112
            Top = 56
            Width = 121
            Height = 21
            TabOrder = 1
          end
          object edNewSUM: TEdit
            Left = 112
            Top = 88
            Width = 121
            Height = 21
            TabOrder = 2
          end
        end
        object tabChangePerc: TTabSheet
          ImageIndex = 2
          TabVisible = False
          object Label106: TLabel
            Left = 24
            Top = 29
            Width = 69
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1072#1075#1077#1085#1090#1072
          end
          object Label107: TLabel
            Left = 24
            Top = 61
            Width = 70
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1089#1076#1077#1083#1082#1080
          end
          object Label108: TLabel
            Left = 24
            Top = 93
            Width = 78
            Height = 13
            Caption = #1053#1086#1074#1099#1081' '#1087#1088#1086#1094#1077#1085#1090
          end
          object edPercentAG_NUM: TEdit
            Left = 116
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object edPercentSD_NUM: TEdit
            Left = 116
            Top = 56
            Width = 121
            Height = 21
            TabOrder = 1
          end
          object edPercent: TEdit
            Left = 116
            Top = 88
            Width = 121
            Height = 21
            TabOrder = 2
          end
        end
        object tabDelSdelka: TTabSheet
          ImageIndex = 3
          TabVisible = False
          object Label109: TLabel
            Left = 24
            Top = 29
            Width = 69
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1072#1075#1077#1085#1090#1072
          end
          object Label110: TLabel
            Left = 24
            Top = 61
            Width = 70
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1089#1076#1077#1083#1082#1080
          end
          object edDelAG_NUM: TEdit
            Left = 112
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object edDelSD_NUM: TEdit
            Left = 112
            Top = 56
            Width = 121
            Height = 21
            TabOrder = 1
          end
        end
        object tabDelPodacha: TTabSheet
          ImageIndex = 4
          TabVisible = False
          object Label111: TLabel
            Left = 24
            Top = 29
            Width = 69
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1072#1075#1077#1085#1090#1072
          end
          object Label112: TLabel
            Left = 24
            Top = 61
            Width = 70
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1089#1076#1077#1083#1082#1080
          end
          object Label113: TLabel
            Left = 24
            Top = 93
            Width = 70
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1075#1072#1079#1077#1090#1099
          end
          object edDelPodachAG_NUM: TEdit
            Left = 112
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object edDelPodachSD_NUM: TEdit
            Left = 112
            Top = 56
            Width = 121
            Height = 21
            TabOrder = 1
          end
          object edDelPodachGZ_NUM: TEdit
            Left = 112
            Top = 88
            Width = 121
            Height = 21
            TabOrder = 2
          end
          object btDelPodachaGZ: TButton
            Left = 235
            Top = 88
            Width = 30
            Height = 20
            Caption = '...'
            TabOrder = 3
            OnClick = btSelectGzNUMClick
          end
        end
        object tabChangeDate: TTabSheet
          ImageIndex = 5
          TabVisible = False
          object Label1: TLabel
            Left = 24
            Top = 29
            Width = 69
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1072#1075#1077#1085#1090#1072
          end
          object Label2: TLabel
            Left = 24
            Top = 61
            Width = 70
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1089#1076#1077#1083#1082#1080
          end
          object Label3: TLabel
            Left = 24
            Top = 93
            Width = 113
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072'-'#1092#1072#1082#1090#1091#1088#1099
          end
          object Label4: TLabel
            Left = 24
            Top = 125
            Width = 108
            Height = 13
            Caption = #1044#1072#1090#1072' '#1089#1095#1077#1090#1072'-'#1092#1072#1082#1090#1091#1088#1099
          end
          object edChangeAG_NUM: TEdit
            Left = 143
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object edChangeSD_NUM: TEdit
            Left = 143
            Top = 56
            Width = 121
            Height = 21
            TabOrder = 1
          end
          object edChangeSD_FACTNUM: TEdit
            Left = 143
            Top = 88
            Width = 121
            Height = 21
            TabOrder = 2
          end
          object edChangeSD_FACTDATE: TDateTimePicker
            Left = 144
            Top = 120
            Width = 121
            Height = 21
            Date = 41465.000000000000000000
            Time = 41465.000000000000000000
            TabOrder = 3
          end
        end
        object tabApprovSD: TTabSheet
          ImageIndex = 6
          TabVisible = False
          object Label7: TLabel
            Left = 24
            Top = 29
            Width = 69
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1072#1075#1077#1085#1090#1072
          end
          object Label8: TLabel
            Left = 24
            Top = 61
            Width = 70
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1089#1076#1077#1083#1082#1080
          end
          object edApprSdAG: TEdit
            Left = 119
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object edApprSD: TEdit
            Left = 119
            Top = 56
            Width = 121
            Height = 21
            TabOrder = 1
          end
        end
        object tabPayDate: TTabSheet
          ImageIndex = 7
          object Label9: TLabel
            Left = 24
            Top = 29
            Width = 69
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1072#1075#1077#1085#1090#1072
          end
          object Label10: TLabel
            Left = 24
            Top = 61
            Width = 70
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1089#1076#1077#1083#1082#1080
          end
          object edPAyDateSD: TEdit
            Left = 119
            Top = 56
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object edPaySDAG: TEdit
            Left = 119
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 1
          end
        end
        object tabSdelkaPayInfo: TTabSheet
          ImageIndex = 8
          TabVisible = False
          object Label11: TLabel
            Left = 24
            Top = 29
            Width = 69
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1072#1075#1077#1085#1090#1072
          end
          object Label12: TLabel
            Left = 24
            Top = 61
            Width = 70
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1089#1076#1077#1083#1082#1080
          end
          object edSPH_AG: TEdit
            Left = 119
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object edSPH_SD: TEdit
            Left = 119
            Top = 56
            Width = 121
            Height = 21
            TabOrder = 1
          end
        end
        object tabDeletedSdelka: TTabSheet
          ImageIndex = 9
          TabVisible = False
          object Label13: TLabel
            Left = 40
            Top = 56
            Width = 50
            Height = 13
            Caption = #1055#1077#1088#1080#1086#1076' '#1089':'
          end
          object Label14: TLabel
            Left = 75
            Top = 85
            Width = 12
            Height = 13
            Caption = #1087#1086
          end
          object pDateFrom: TDateTimePicker
            Left = 94
            Top = 52
            Width = 97
            Height = 21
            Date = 42275.438297083330000000
            Time = 42275.438297083330000000
            TabOrder = 0
          end
          object pDateTo: TDateTimePicker
            Left = 94
            Top = 79
            Width = 97
            Height = 21
            Date = 42275.439185474530000000
            Time = 42275.439185474530000000
            TabOrder = 1
          end
        end
        object tabChangeAgent: TTabSheet
          ImageIndex = 10
          TabVisible = False
          object DBGrid13: TDBGrid
            Left = 0
            Top = 0
            Width = 423
            Height = 106
            Align = alTop
            DataSource = data.dsChangeAgentTask
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = RUSSIAN_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'AG_NAME_SRC_LK'
                Width = 140
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SD_NUM'
                Title.Caption = #1050#1086#1076' '#1089#1076#1077#1083#1082#1080
                Width = 106
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'AG_NAME_DST_LK'
                Width = 150
                Visible = True
              end>
          end
          object btRefreshChanges: TBitBtn
            Left = 6
            Top = 115
            Width = 89
            Height = 25
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = btRefreshChangesClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
              FFFFFFFFF00FFFFFFFFFFFF88000FFFFFFFFFF0000000FFFFFFFF0000000FF80
              FFFF808FF00FFF000FFF00FFF0FFFFF008FF00FFFFFFFFFF00FF00FFFFFFFFFF
              00FF800FFFFF0FFF00FFF000FFF00FF808FFFF08FF0000000FFFFFFFF0000000
              FFFFFFFFFF00088FFFFFFFFFFFF00FFFFFFFFFFFFFFF0FFFFFFF}
          end
        end
        object tabChgReq: TTabSheet
          ImageIndex = 11
          TabVisible = False
          DesignSize = (
            423
            292)
          object Label15: TLabel
            Left = 24
            Top = 29
            Width = 69
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1072#1075#1077#1085#1090#1072
          end
          object Label16: TLabel
            Left = 24
            Top = 61
            Width = 70
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1089#1076#1077#1083#1082#1080
          end
          object Label17: TLabel
            Left = 24
            Top = 94
            Width = 55
            Height = 13
            Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
          end
          object edReqAgID: TEdit
            Left = 119
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object edReqSD_NUM: TEdit
            Left = 119
            Top = 56
            Width = 121
            Height = 21
            TabOrder = 1
          end
          object cbRequisite: TDBLookupComboboxEh
            Left = 120
            Top = 90
            Width = 121
            Height = 21
            Hint = #1056#1077#1082#1074#1077#1079#1080#1090#1099
            AlwaysShowBorder = True
            Anchors = [akLeft, akTop, akRight]
            EditButtons = <>
            KeyField = 'RQ_ID'
            ListField = 'RQ_NAME'
            ListSource = data.dsRequisite
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            Visible = True
          end
        end
        object tabChgPayDate: TTabSheet
          ImageIndex = 12
          object Label18: TLabel
            Left = 24
            Top = 29
            Width = 69
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1072#1075#1077#1085#1090#1072
          end
          object Label19: TLabel
            Left = 24
            Top = 61
            Width = 70
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1089#1076#1077#1083#1082#1080
          end
          object Label20: TLabel
            Left = 22
            Top = 91
            Width = 67
            Height = 13
            Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099
          end
          object edChngPayDateAG_ID: TEdit
            Left = 119
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object edChngPayDateSD_NUM: TEdit
            Left = 119
            Top = 56
            Width = 121
            Height = 21
            TabOrder = 1
          end
          object dtChngPayDatePAY_DATE: TDateTimePicker
            Left = 119
            Top = 86
            Width = 121
            Height = 21
            Date = 41465.000000000000000000
            Time = 41465.000000000000000000
            TabOrder = 2
          end
        end
      end
      object veTasks: TValueListEditor
        Left = 0
        Top = 0
        Width = 353
        Height = 320
        Align = alLeft
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect, goThumbTracking]
        Strings.Strings = (
          '1='#1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1076#1072#1095#1091' '#1082' '#1089#1076#1077#1083#1082#1077
          '2='#1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1091#1084#1084#1091' '#1089#1076#1077#1083#1082#1080
          '3='#1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1088#1086#1094#1077#1085#1090' '#1089#1076#1077#1083#1082#1080
          '4='#1059#1076#1072#1083#1080#1090#1100' '#1089#1076#1077#1083#1082#1091
          '5='#1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1076#1072#1095#1091' '#1091' '#1089#1076#1077#1083#1082#1080
          '6='#1048#1079#1084#1077#1085#1080#1090#1100' '#1085#1086#1084#1077#1088' '#1080' '#1076#1072#1090#1091' '#1089#1095#1077#1090#1072' -'#1092#1072#1082#1090#1091#1088#1099' '#1074' '#1089#1076#1077#1083#1082#1077
          '7='#1044#1072#1090#1072' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103' '#1089#1076#1077#1083#1082#1080
          '8='#1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099' '#1089#1076#1077#1083#1082#1080
          '9='#1048#1089#1090#1086#1088#1080#1103' '#1087#1088#1086#1087#1083#1072#1090' '#1089#1076#1077#1083#1082#1080
          '10='#1055#1077#1088#1077#1076#1072#1090#1100' '#1089#1076#1077#1083#1082#1091' '#1076#1088#1091#1075#1086#1084#1091' '#1072#1075#1077#1085#1090#1091
          '11='#1048#1079#1084#1077#1085#1080#1090#1100' '#1088#1077#1082#1074#1080#1079#1080#1090#1099' '#1089#1076#1077#1083#1082#1080
          '12='#1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1090#1091' '#1086#1087#1083#1072#1090#1099' '#1089#1076#1077#1083#1082#1080)
        TabOrder = 1
        TitleCaptions.Strings = (
          #1053#1086#1084#1077#1088
          #1053#1072#1079#1074#1072#1085#1080#1077' '#1079#1072#1076#1072#1095#1080)
        OnClick = veTasksClick
        ColWidths = (
          43
          304)
      end
      object btRun: TBitBtn
        Left = 667
        Top = 279
        Width = 99
        Height = 33
        Anchors = [akRight, akBottom]
        Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
        TabOrder = 2
        OnClick = btRunClick
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00999999999999
          9900999999999999990099999999999999009947999999999900974999994444
          4900949999999444490094999999994449009499999994944900974999944999
          4900997444499999990099999999999999009999999999999900999999999999
          99009999999999999900}
      end
    end
    object tabHistory: TTabSheet
      Caption = #1048#1089#1090#1086#1088#1080#1103
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 41
        Width = 784
        Height = 279
        Align = alClient
        DataSource = dsAdmHistory
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'AL_DATE'
            Title.Alignment = taCenter
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AL_IP'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AL_PARAMS'
            Title.Alignment = taCenter
            Width = 173
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'US_NAME'
            Title.Alignment = taCenter
            Width = 207
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AT_NAME'
            Title.Alignment = taCenter
            Width = 386
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PHONES'
            Title.Alignment = taCenter
            Title.Caption = #1058#1077#1083#1077#1092#1086#1085#1099
            Visible = True
          end>
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 784
        Height = 41
        Align = alTop
        TabOrder = 1
        object Label5: TLabel
          Left = 16
          Top = 15
          Width = 7
          Height = 13
          Caption = 'C'
        end
        object Label6: TLabel
          Left = 144
          Top = 13
          Width = 12
          Height = 13
          Caption = #1087#1086
        end
        object dpStart: TDateTimePicker
          Left = 32
          Top = 10
          Width = 105
          Height = 22
          Date = 0.688912349527527100
          Time = 0.688912349527527100
          TabOrder = 0
        end
        object dpEnd: TDateTimePicker
          Left = 166
          Top = 10
          Width = 105
          Height = 22
          Date = 41487.688912349530000000
          Time = 41487.688912349530000000
          TabOrder = 1
        end
        object btShowHistory: TButton
          Left = 284
          Top = 9
          Width = 82
          Height = 22
          Caption = #1055#1086#1082#1072#1079#1072#1090#1100
          TabOrder = 2
          OnClick = btShowHistoryClick
        end
      end
    end
  end
  object qTasks: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = data.connection
    Left = 570
    Top = 207
  end
  object qAdmHistory: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ds'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'de'
        ParamType = ptUnknown
      end>
    SQL.Strings = (
      'select al.al_date, al.al_ip, case '
      
        '                                  when al.AT_ID= 1 then '#39#1048#1079#1084'. '#1089#1091 +
        #1084#1084#1072' '#1089#1076#1077#1083#1082#1080#39
      
        '                                  when al.AT_ID = 2 then '#39#1059#1076#1072#1083#1077#1085 +
        #1080#1077' '#1089#1076#1077#1083#1082#1080#39
      
        '                                  when al.AT_ID = 4 then '#39#1055#1086#1076#1072#1095#1072 +
        ' '#1076#1086#1073#1072#1074#1083#1077#1085#1072#39
      
        '                                  when al.AT_ID = 5 then '#39#1055#1086#1076#1072#1095#1072 +
        ' '#1091#1076#1072#1083#1077#1085#1072#39
      
        '                                  when al.AT_ID = 6 then '#39#1048#1079#1084'. '#1076 +
        #1072#1090#1072' '#1080#1083#1080' '#8470' '#1089#1095#1077#1090#1072' '#1092#1072#1082#1090#1091#1088#1099#39
      
        '                                  when al.AT_ID = 10 then '#39#1055#1077#1088#1077#1076 +
        #1072#1095#1072' '#1089#1076#1077#1083#1082#1080' '#1076#1088#1091#1075#1086#1084#1091' '#1072#1075#1077#1085#1090#1091#39
      
        '                                  when al.AT_ID = 11 then '#39#1048#1079#1084'. ' +
        #1088#1077#1082#1074#1080#1079#1080#1090#1086#1074#39
      
        '                                  when al.AT_ID = 12 then '#39#1048#1079#1084'. ' +
        #1076#1072#1090#1099' '#1086#1087#1083#1072#1090#1099' '#1089#1076#1077#1083#1082#1080#39
      '                                  else al.AT_ID  '
      '                             end as at_name,'
      '       al.al_params,'
      '       u.us_name,'
      '       sdp.PHONES'
      'from admin_log al'
      'left join usr u on (u.us_id = al.us_id)'
      'left join SDELKA_DELETED sd on (sd.SD_NUM = al.AL_PARAMS)'
      
        'left join GET_DEL_SDELKA_PHONES_STR(sd.AG_ID, sd.SD_ID)sdp on (1' +
        '=1)'
      'where al.al_date between :ds and :de'
      'order by al_date desc')
    SQLConnection = data.connection
    Left = 84
    Top = 248
  end
  object dsAdmHistory: TDataSource
    DataSet = cdsAdmHistory
    Left = 204
    Top = 248
  end
  object cdsAdmHistory: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAdmHistory'
    Left = 164
    Top = 248
    object cdsAdmHistoryAL_IP: TStringField
      DisplayLabel = #1050#1086#1084#1087#1100#1102#1090#1077#1088
      FieldName = 'AL_IP'
      Size = 15
    end
    object cdsAdmHistoryAL_PARAMS: TStringField
      DisplayLabel = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      FieldName = 'AL_PARAMS'
      Size = 255
    end
    object cdsAdmHistoryUS_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldName = 'US_NAME'
      Size = 128
    end
    object cdsAdmHistoryAT_NAME: TStringField
      DisplayLabel = #1044#1077#1081#1089#1090#1074#1080#1077
      FieldName = 'AT_NAME'
      Size = 29
    end
    object cdsAdmHistoryAL_DATE: TSQLTimeStampField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'AL_DATE'
    end
    object cdsAdmHistoryPHONES: TStringField
      FieldName = 'PHONES'
      Size = 255
    end
  end
  object prvAdmHistory: TDataSetProvider
    DataSet = qAdmHistory
    Left = 124
    Top = 248
  end
end
