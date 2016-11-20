unit uAdminSdelka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ValEdit, StdCtrls, ExtCtrls, ComCtrls, FMTBcd, DB,
  SqlExpr, uSelectGazetaNum, Provider, DBClient, DBGrids, SqlTimSt, DBXpress,
  Buttons, htmlReport, DBGridEh, Mask, DBCtrlsEh, DBLookupEh;

type
  TfrmControlSdelka = class(TForm)
    pgSdelkaControl: TPageControl;
    tabTasks: TTabSheet;
    pgTasks: TPageControl;
    tbAddPodacha: TTabSheet;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    edAG_NUM: TEdit;
    edSD_NUM: TEdit;
    edGZ_NUM: TEdit;
    btSelectGzNUM: TButton;
    chkFreePodacha: TCheckBox;
    tabChangeSumma: TTabSheet;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    edSumAG_NUM: TEdit;
    edSumSD_ID: TEdit;
    edNewSUM: TEdit;
    tabChangePerc: TTabSheet;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    edPercentAG_NUM: TEdit;
    edPercentSD_NUM: TEdit;
    edPercent: TEdit;
    tabDelSdelka: TTabSheet;
    Label109: TLabel;
    Label110: TLabel;
    edDelAG_NUM: TEdit;
    edDelSD_NUM: TEdit;
    tabDelPodacha: TTabSheet;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    edDelPodachAG_NUM: TEdit;
    edDelPodachSD_NUM: TEdit;
    edDelPodachGZ_NUM: TEdit;
    btDelPodachaGZ: TButton;
    veTasks: TValueListEditor;
    tabHistory: TTabSheet;
    tabChangeDate: TTabSheet;
    Label1: TLabel;
    edChangeAG_NUM: TEdit;
    edChangeSD_NUM: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edChangeSD_FACTNUM: TEdit;
    Label4: TLabel;
    edChangeSD_FACTDATE: TDateTimePicker;
    qTasks: TSQLQuery;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    dpStart: TDateTimePicker;
    Label6: TLabel;
    dpEnd: TDateTimePicker;
    btShowHistory: TButton;
    qAdmHistory: TSQLQuery;
    dsAdmHistory: TDataSource;
    cdsAdmHistory: TClientDataSet;
    prvAdmHistory: TDataSetProvider;
    cdsAdmHistoryAL_IP: TStringField;
    cdsAdmHistoryAL_PARAMS: TStringField;
    cdsAdmHistoryUS_NAME: TStringField;
    cdsAdmHistoryAT_NAME: TStringField;
    cdsAdmHistoryAL_DATE: TSQLTimeStampField;
    tabApprovSD: TTabSheet;
    Label7: TLabel;
    edApprSdAG: TEdit;
    edApprSD: TEdit;
    Label8: TLabel;
    tabPayDate: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    edPAyDateSD: TEdit;
    edPaySDAG: TEdit;
    btRun: TBitBtn;
    tabSdelkaPayInfo: TTabSheet;
    Label11: TLabel;
    edSPH_AG: TEdit;
    edSPH_SD: TEdit;
    Label12: TLabel;
    tabDeletedSdelka: TTabSheet;
    Label13: TLabel;
    pDateFrom: TDateTimePicker;
    pDateTo: TDateTimePicker;
    Label14: TLabel;
    cdsAdmHistoryPHONES: TStringField;
    tabChangeAgent: TTabSheet;
    DBGrid13: TDBGrid;
    btRefreshChanges: TBitBtn;
    tabChgReq: TTabSheet;
    Label15: TLabel;
    edReqAgID: TEdit;
    edReqSD_NUM: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    cbRequisite: TDBLookupComboboxEh;
    tabChgPayDate: TTabSheet;
    Label18: TLabel;
    edChngPayDateAG_ID: TEdit;
    edChngPayDateSD_NUM: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    dtChngPayDatePAY_DATE: TDateTimePicker;
    procedure veTasksClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btRunClick(Sender: TObject);
    procedure btSelectGzNUMClick(Sender: TObject);
    procedure btShowHistoryClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btRefreshChangesClick(Sender: TObject);
  private
    { Private declarations }
     frmSelectGZNum: TfrmSelectGZNum;
     procedure ShowPayInfo(qry:TSQLQuery);
     procedure hidepages();
  public
    { Public declarations }
  end;

implementation

uses dm, main, globals, uSiteObjav;

{$R *.dfm}

procedure TfrmControlSdelka.hidepages;
var i: integer;
begin
     for i := 0 to pgTasks.PageCount - 1 do
          pgTasks.Pages[i].TabVisible := false;
end;

procedure TfrmControlSdelka.veTasksClick(Sender: TObject);
begin
 case veTasks.Row of
    1: begin
           hidepages;
           tbAddPodacha.TabVisible   := true;
           tbAddPodacha.Caption := veTasks.Values[veTasks.Keys[veTasks.row]];
       end;
    2: begin
           hidepages;
           tabChangeSumma.TabVisible := true;
           tabChangeSumma.Caption := veTasks.Values[veTasks.Keys[veTasks.row]];
       end;
    3: begin
           hidepages;
           tabChangePerc.TabVisible  := true;
           tabChangePerc.Caption := veTasks.Values[veTasks.Keys[veTasks.row]];
       end;
    4: begin
           hidepages;
           tabDelSdelka.TabVisible   := true;
           tabDelSdelka.Caption := veTasks.Values[veTasks.Keys[veTasks.row]];
       end;
    5: begin
           hidepages;
           tabDelPodacha.TabVisible  := true;
           tabDelPodacha.Caption := veTasks.Values[veTasks.Keys[veTasks.row]];
       end;
    6: begin
           hidepages;
           tabChangeDate.TabVisible  := true;
           tabChangeDate.Caption := veTasks.Values[veTasks.Keys[veTasks.row]];
       end;
    7: begin
           hidepages;
           tabApprovSD.TabVisible    := true;
           tabApprovSD.Caption       := veTasks.Values[veTasks.Keys[veTasks.row]];
       end;
    8: begin
           hidepages;
           tabPayDate.TabVisible     := true;
           tabPayDate.Caption        := veTasks.Values[veTasks.Keys[veTasks.row]];
       end;
    9: begin
           hidepages;
           tabSdelkaPayInfo.TabVisible := true;
           tabSdelkaPayInfo.Caption    := veTasks.Values[veTasks.Keys[veTasks.row]];
       end;
   10: begin
           hidePages;
           tabChangeAgent.TabVisible := true;
           tabChangeAgent.Caption  := veTasks.Values[veTasks.Keys[veTasks.row]];
       end;
   11: begin
           hidePages;
           tabChgReq.TabVisible := true;
           tabChgReq.Caption := veTasks.Values[veTasks.Keys[veTasks.row]];
       end;

   12: begin
            hidePages;
            tabChgPayDate.TabVisible := true;
            tabChgPayDate.Caption := veTasks.Values[veTasks.Keys[veTasks.row]];
       end;
 end;
end;

procedure TfrmControlSdelka.FormShow(Sender: TObject);
begin
    dpStart.Date := Now;
    dpEnd.Date := Now;
    edChangeSD_FACTDATE.Date := Now;
    pgSdelkaControl.ActivePage := tabTasks;
    veTasksClick(Sender);
end;

procedure TfrmControlSdelka.btRunClick(Sender: TObject);
var trAdm:TTransactionDesc;
begin
    trAdm.TransactionID := 2;
    trAdm.IsolationLevel := xilREADCOMMITTED;

    qTasks.SQLConnection.StartTransaction(trAdm);
    try
    case veTasks.Row of
        1:  begin
               qTasks.Close;
               qTasks.SQL.Clear;
               qTasks.SQL.Append('select result from adm_add_podacha(:sd_num, :is_id, :pd_free, :us_id, :ip)');
               qTasks.ParamByName('sd_num').AsString := edAG_NUM.Text + '-' + edSD_NUM.Text;
               qTasks.ParamByName('is_id').AsInteger := edGZ_NUM.Tag;
               qTasks.ParamByName('pd_free').AsInteger := ord(chkFreePodacha.Checked);
               qTasks.ParamByName('us_id').AsInteger := frmMain.currentUser;
               qTasks.ParamByName('ip').AsString := getLocalHostName();
               qTasks.Open;
               ShowMessage(Trim(qTasks.Fields[0].asString));
            end;
        2:  begin
               qTasks.Close;
               qTasks.SQL.Clear;
               qTasks.SQL.Append('select result from ADM_CHANGE_SDELKA_SUM(:sd_num, :sd_sum, :us_id, :ip)');
               qTasks.ParamByName('sd_num').AsString := edSumAG_NUM.Text + '-' + edSumSD_ID.Text;
               qTasks.ParamByName('sd_sum').AsFloat := StrToFloat(edNewSUM.Text);
               qTasks.ParamByName('us_id').AsInteger := frmMain.currentUser;
               qTasks.ParamByName('ip').AsString := getLocalHostName;
               qTasks.Open;
               ShowMessage(Trim(qTasks.Fields[0].asString));
            end;
        3:  begin
               qTasks.Close;
               qTasks.SQL.Clear;
               qTasks.SQL.Append('select result from adm_change_sdelka_percent(:sd_num, :sd_percent, :us_id, :ip)');
               qTasks.ParamByName('sd_num').AsString := edPercentAG_NUM.Text + '-' + edPercentSD_NUM.Text;
               qTasks.ParamByName('sd_percent').AsFloat := StrToFloat(edPercent.Text);
               qTasks.ParamByName('us_id').AsInteger := frmMain.currentUser;
               qTasks.ParamByName('ip').AsString := getLocalHostName();
               qTasks.Open;
               ShowMessage(Trim(qTasks.Fields[0].asString));
            end;
        4:  begin
               qTasks.Close;
               qTasks.SQL.Clear;
               qTasks.SQL.Append('select result from adm_delete_sdelka(:sd_num, :us_id, :ip)');
               qTasks.ParamByName('sd_num').AsString := edDelAG_NUM.Text + '-' + edDelSD_NUM.Text;
               qTasks.ParamByName('us_id').AsInteger := frmMain.currentUser;
               qTasks.ParamByName('ip').AsString := getLocalHostName();
               qTasks.Open;
               ShowMessage(Trim(qTasks.Fields[0].asString));
            end;
        5:  begin
               qTasks.Close;
               qTasks.SQL.Clear;
               qTasks.SQL.Append('select result from adm_delete_podacha(:sd_num, :is_id, :us_id, :ip)');
               qTasks.ParamByName('sd_num').AsString := edDelPodachAG_NUM.Text + '-' + edDelPodachSD_NUM.Text;
               qTasks.ParamByName('is_id').AsInteger := edDelPodachGZ_NUM.Tag;
               qTasks.ParamByName('us_id').AsInteger := frmMain.currentUser;
               qTasks.ParamByName('ip').AsString     := getLocalHostName();
               qTasks.Open;
               ShowMessage(Trim(qTasks.Fields[0].asString));
            end;
        6:  begin
               qTasks.Close;
               qTasks.SQL.Clear;
               qTasks.SQL.Append('select result from ADM_CHANGE_FACT_NUM_AND_DATE(:sd_num, :new_num, :new_date, :us_id, :ip)');
               qTasks.ParamByName('sd_num').AsString := edChangeAG_NUM.Text + '-' + edChangeSD_NUM.Text;
               qTasks.ParamByName('new_num').AsInteger := StrToInt(edChangeSD_FACTNUM.Text);
               qTasks.ParamByName('new_date').AsSQLTimeStamp := DateTimeToSQLTimeStamp(edChangeSD_FACTDATE.DateTime);
               qTasks.ParamByName('us_id').AsInteger := frmMain.currentUser;
               qTasks.ParamByName('ip').AsString := getLocalHostName();
               qTasks.Open;
               ShowMessage(Trim(qTasks.Fields[0].asString));
            end;
        7:  begin
               qTasks.Close;
               qTasks.SQL.Clear;
               qTasks.SQL.Append('select result from ADM_SDELKA_APPROVING_DATE_NEW(:sd_num)');
               qTasks.ParamByName('sd_num').AsString := edApprSdAG.Text + '-' + edApprSD.Text;
               qTasks.Open;
               if qTasks.Fields[0].IsNull then
                  MessageBox(Application.Handle, 'Сделка не найдена!', 'Prinfo', MB_OK or MB_ICONERROR)
               else
                  ShowMessage('Дата подтверждения сделки'#10#13 + FormatDateTime('dd.mm.yyyy  hh:nn:ss', qTasks.Fields[0].AsDateTime));
            end;
        8:  begin
                qTasks.Close;
                qTasks.SQL.Clear;
                qTasks.SQL.Append('select result from ADM_SDELKA_PAY_DATE_NEW(:sd_num)');
                qTasks.ParamByName('sd_num').AsString := edPaySDAG.Text + '-' + edPAyDateSD.Text;
                qTasks.Open;
                if qTasks.Fields[0].IsNull then
                   MessageBox(Application.Handle, 'Сделка не найдена!', 'Prinfo', MB_OK or MB_ICONERROR)
                else
                   ShowMessage('Дата оплаты сделки '#10#13 + FormatDateTime('dd.mm.yyyy  hh:nn:ss', qTasks.Fields[0].AsDateTime));
            end;
        9:  begin
                qTasks.Close;
                qTasks.SQL.Clear;
                qTasks.SQL.Append('select PAY_SUM AS "Оплата", PAY_DATE AS "Дата", USR AS "Пользователь" from ADM_SDELKA_PAY_INFO(:sd_num)');
                qTasks.ParamByName('sd_num').AsString := edSPH_AG.Text + '-' + edSPH_SD.Text;
                qTasks.Open;

                if qTasks.IsEmpty then
                   MessageBox(Application.Handle, 'Сделка не найдена или нет иформации!', 'Prinfo', MB_OK or MB_ICONERROR)
                else
                   ShowPayInfo(qTasks);
            end;

       10:  begin
                 qTasks.Close;
                 qTasks.SQL.Clear;
                 qTasks.SQL.Append('select result from ADM_MOVE_NEW_SDELKAS(:us_id, :ip, :sd_num_old, :ag_new)');
                 qTasks.ParamByName('us_id').AsInteger := frmMain.currentUser;
                 qTasks.ParamByName('ip').AsString := getLocalHostName();
                 qTasks.ParamByName('sd_num_old').AsString := data.qryChangeAgentTaskSD_NUM.asString;
                 qTasks.ParamByName('ag_new').AsInteger :=  data.qryChangeAgentTaskAG_ID_DST.AsInteger;
                 qTasks.Open;
                 btRefreshChangesClick(Sender);
                 ShowMessage(trim(qTasks.Fields[0].asString));
		        end;

       11: begin
               if cbRequisite.Text = '' then
               begin
                   ShowMessage('Укажите реквизит.');
                   exit;
               end;

               qTasks.Close;
               qTasks.SQL.Clear;
               qTasks.SQL.Append('select result from ADM_CHANGE_REQ(:sd_num, :rq_id, :ip, :us_id)');
               qTasks.ParamByName('sd_num').AsString := edReqAgID.Text + '-' + edReqSD_NUM.Text;
               qTasks.ParamByName('rq_id').AsInteger := cbRequisite.KeyValue;
               qTasks.ParamByName('ip').AsString :=     getLocalHostName();
               qTasks.ParamByName('us_id').AsInteger := frmMain.currentUser;
               qTasks.Open;
               ShowMessage(Trim(qTasks.Fields[0].asString));
           end;

       12: begin
       
               qTasks.Close;
               qTasks.SQL.Clear;
               qTasks.SQL.Append('select result from ADM_CHANGE_PAY_DATE(:sd_num, :pay_date, :us_id, :ip)');
               qTasks.ParamByName('sd_num').AsString := edChngPayDateAG_ID.Text + '-' + edChngPayDateSD_NUM.Text;
               qTasks.ParamByName('pay_date').AsSQLTimeStamp := DateTimeToSQLTimeStamp(dtChngPayDatePAY_DATE.Date);
               qTasks.ParamByName('us_id').AsInteger := frmMain.currentUser;
               qTasks.ParamByName('ip').AsString := getLocalHostName();
               qTasks.Open;
               ShowMessage(Trim(qTasks.Fields[0].asString));
           end;
    end;

    qTasks.SQLConnection.Commit(trAdm);
    except
        qTasks.SQLConnection.Rollback(trAdm);
        raise;
    end;
end;

procedure TfrmControlSdelka.btSelectGzNUMClick(Sender: TObject);
begin
    if not Assigned(frmSelectGZNum) then frmSelectGZNum := TfrmSelectGZNum.Create(self);
    try
        if frmSelectGZNum.ShowModal = mrOK then
        begin
           if Sender = btSelectGzNUM then
           begin
                edGZ_NUM.Tag  := frmSelectGZNum.cdsGZNumIS_ID.AsInteger;
                edGZ_NUM.Text := frmSelectGZNum.cdsGZNumIS_NAME_COMPOSED.AsString;
           end
           else if Sender = btDelPodachaGZ then
           begin
                edDelPodachGZ_NUM.Tag := frmSelectGZNum.cdsGZNumIS_ID.AsInteger;
                edDelPodachGZ_NUM.Text := frmSelectGZNum.cdsGZNumIS_NAME_COMPOSED.AsString;
           end
        end;
    finally
        //FreeAndNil(frmSelectGZNum)
    end;
end;

procedure TfrmControlSdelka.btShowHistoryClick(Sender: TObject);
begin
    cdsAdmHistory.Close;
    cdsAdmHistory.FetchParams;
    cdsAdmHistory.Params.ParamByName('ds').AsSQLTimeStamp := DateTimeToSQLTimeStamp(trunc(dpStart.DateTime));
    cdsAdmHistory.Params.ParamByName('de').AsSQLTimeStamp := DateTimeToSQLTimeStamp(dpEnd.DateTime);
    cdsAdmHistory.Open;
end;

procedure TfrmControlSdelka.FormDestroy(Sender: TObject);
begin
   FreeAndNil(frmSelectGZNum)
end;

procedure TfrmControlSdelka.ShowPayInfo(qry:TSQLQuery);
var
	rep: THtmlReport;
begin
   rep := THtmlReport.Create;

   rep.TempName := 'PrInfo-sdelka-pay-info';
	 rep.Add('<HTML><HEAD><TITLE>История оплат сделок</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	 rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');
   rep.Add(getTableHeader(qry, 13));

   while not qry.Eof do
   begin
       rep.Add(getTableRow(qry, 13, nil));

       qry.Next;
   end;

   rep.Add('</BODY></HTML>');
	 rep.OpenInBrowser();
	 rep.Free();
end;

procedure TfrmControlSdelka.btRefreshChangesClick(Sender: TObject);
begin
     data.qryChangeAgentTask.Close;
	   data.qryChangeAgentTask.Open;
end;

end.
