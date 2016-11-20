unit uSdelkaRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RpBase, RpSystem, RpDefine, RpRave, RpRender,
  RpRenderCanvas, RpRenderPreview, DBXpress, FMTBcd, DB, SqlExpr, Grids,
  RpCon, RpConDS, ComCtrls, DBGrids, DBClient, Provider,
  dm, newAccount, IBCustomDataSet, CheckLst, TypInfo, RvClass, RvCsStd, StrUtils,RvCsData;

type
  TfrmPrint = class(TForm)
    btOK: TButton;
    qAcc: TSQLQuery;
    lstInvoiceForm: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    qAccCust: TSQLQuery;
    qAccService: TSQLQuery;
    qAccSD_FACT_DATE: TSQLTimeStampField;
    qAccSD_FACT_NUM: TIntegerField;
    qAccSD_SKIDKA: TFloatField;
    qAccSD_SUM: TFloatField;
    qAccPODACHA_NUMS: TStringField;
    qAccSD_SUM_NDS: TFloatField;
    qAccSD_SUM_OUT_NDS: TFloatField;
    qAccFM_NAME: TStringField;
    qAccCustCUQ_FULL_NAME: TStringField;
    qAccCustAG_FACTURA_NAME: TStringField;
    qAccCustCUQ_OKPO: TStringField;
    qAccCustCUQ_ADDRESS: TStringField;
    qAccCustCUQ_ADDRESS_REAL: TStringField;
    qAccCustCUQ_PHONES: TStringField;
    qAccCustCUQ_NDS_NUM: TStringField;
    qAccCustCUQ_INN: TStringField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    qAccCust2: TSQLQuery;
    cdsAcc: TClientDataSet;
    cdsAccSD_SKIDKA: TFloatField;
    cdsAccSD_SUM: TFloatField;
    cdsAccPODACHA_NUMS: TStringField;
    cdsAccFM_NAME: TStringField;
    cdsAccSD_SUM_LITERAL: TStringField;
    cdsAccSD_SUM_NDS: TFloatField;
    cdsAccSD_SUM_OUT_NDS: TFloatField;
    cdsAccPREDMET_RAHUNKU: TStringField;
    DataSetProvider2: TDataSetProvider;
    cdsAccSD_FACT_DATE: TSQLTimeStampField;
    cdsAccSD_FACT_NUM: TIntegerField;
    qAccSD_SUM_LITERAL: TIBStringField;
    rdsAcc: TRvDataSetConnection;
    rdsAccCust: TRvDataSetConnection;
    qAccPREDMET_RAHUNKU: TStringField;
    chkList: TCheckListBox;
    rdsAccService: TRvDataSetConnection;
    qReq: TSQLQuery;
    rdsReq: TRvDataSetConnection;
    qReqRQ_STAMP: TBlobField;
    qReqRQ_COMP_ADDR: TStringField;
    qReqREQUISITE: TStringField;
    qBank: TSQLQuery;
    rdsBank: TRvDataSetConnection;
    qBankB_NAME: TStringField;
    qBankB_MFO: TStringField;
    qBankB_EDRPO: TStringField;
    qBankB_SVID: TStringField;
    qBankB_INN: TStringField;
    qBankB_ACC: TStringField;
    qReqLOGO: TBlobField;
    qReqRQ_NAME: TStringField;
    qAccSD_PERIOD: TStringField;
    qAccSD_KA_START_DATE: TSQLTimeStampField;
    qAccSD_KA_END_DATE: TSQLTimeStampField;
    cdsAccSD_KA_START_DATE: TSQLTimeStampField;
    cdsAccSD_KA_END_DATE: TSQLTimeStampField;
    qReqRQ_SVID: TStringField;
    qReqRQ_INN: TStringField;
    procedure btOKClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qAccCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    ag_id, sd_id,mode: integer;
    frmNewAccount: TfrmNewAccount;
    PrType:string;

    function PredmetRakh():string;
    procedure PrepareSQL();
  public
    { Public declarations }
   class procedure ShowPrintForm(ag_id, sd_id: integer);
   class procedure ShowPrintFormCust(agid,cuid, reg_id:integer);
   class procedure ShowPrintFormMulti(ag_id, sd_id: integer; summ: double; fact_num: integer; fact_date, intStartDate, intEndDate: TDate);
  end;

var
  frmPrint: TfrmPrint;

function SumNumToFull(Number:double):string;

implementation

uses dmCache;

{$R *.dfm}

procedure TfrmPrint.btOKClick(Sender: TObject);
var ms: TMemoryStream;
    TmpRaveComp: TRaveComponent;
begin
  PrType := dm.data.GetParamValue('PM_PRINFO');

  qAcc.Close;
  if mode = 1 then
  begin
    qAcc.ParamByName('ag_id').AsInteger := ag_id;
    qAcc.ParamByName('sd_id').AsInteger := sd_id;
  end
  else PrepareSQL();

  qAcc.Open;

  cacheData.rvpRepAcc.SelectReport('accPR_tov_pumb', false);
  qReq.Close;
  qBank.Close;

  case lstInvoiceForm.ItemIndex of
      0: begin    // Рахунок "Пропоную роботу" (ПУМБ)
             qReq.ParamByName('id').AsInteger := 1;
             qReq.ParamByName('gz_id').AsInteger := 1;
             qBank.ParamByName('id').AsInteger := 1;
         end;
      1: begin // Рахунок "Пропоную роботу" (БТА) успiх
            qReq.ParamByName('id').AsInteger := 2;
            qReq.ParamByName('gz_id').AsInteger := 1;
            qBank.ParamByName('id').AsInteger := 7;//2;
         end;
      2: begin // Рахунок "Пропоную роботу" (БТА) ТОВ
            qReq.ParamByName('id').AsInteger := 1;
            qReq.ParamByName('gz_id').AsInteger := 1;
            qBank.ParamByName('id').AsInteger := 3;
         end;
      3: begin   // Рахунок "Пропоную роботу" (Приват)
             qReq.ParamByName('id').AsInteger := 1;
             qReq.ParamByName('gz_id').AsInteger := 1;
             qBank.ParamByName('id').AsInteger := 5;
         end;
      4: begin   // Рахунок "Срочно требуются" (ПУМБ)
             qReq.ParamByName('id').AsInteger := 1;
             qReq.ParamByName('gz_id').AsInteger := 3;
             qBank.ParamByName('id').AsInteger := 1;
         end;
      5: begin // Рахунок "Срочно требуются" (БТА) успiх
            qReq.ParamByName('id').AsInteger := 2;
            qReq.ParamByName('gz_id').AsInteger := 3;
            qBank.ParamByName('id').AsInteger := 7;
         end;
      6: begin //Рахунок "Срочно требуются" (БТА) ТОВ
            qReq.ParamByName('id').AsInteger := 1;
            qReq.ParamByName('gz_id').AsInteger := 3;
            qBank.ParamByName('id').AsInteger := 3
         end;
      7: begin  //  Рахунок "Срочно требуются" (Приват)
             qReq.ParamByName('id').AsInteger := 1;
             qReq.ParamByName('gz_id').AsInteger := 3;
             qBank.ParamByName('id').AsInteger := 5;
         end;
      8: begin // Рахунок Internet (БТА) успiх
             qReq.ParamByName('id').AsInteger := 2;
             qReq.ParamByName('gz_id').AsInteger := 0;
             qBank.ParamByName('id').AsInteger := 3;
         end;
     { 9: begin  // Рахунок "Пропоную оголошення" (БТА)
             qReq.ParamByName('id').AsInteger := 1;
             qReq.ParamByName('gz_id').AsInteger := 2;
             qBank.ParamByName('id').AsInteger := 3;// 6;
         end; }
      9: begin // Рахунок Internet (БТА)
            qReq.ParamByName('id').AsInteger := 1;
            qReq.ParamByName('gz_id').AsInteger := 0;
            qBank.ParamByName('id').AsInteger := 3;
         end;
end;

  qReq.Open;
  qBank.Open;

  TmpRaveComp := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('Bitmap2', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);

  if (TmpRaveComp <> nil) and (TmpRaveComp is TRaveBitmap)  then
  begin
      ms := TMemoryStream.Create;
      TBlobField(qReq.FieldByName('RQ_STAMP')).SaveToStream(ms);
      ms.Position := 0;
      TRaveBitmap(TmpRaveComp).Image.LoadFromStream(ms);
      FreeAndNil(ms);
  end;

  TmpRaveComp := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('Bitmap1', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);

  if (TmpRaveComp <> nil) and (TmpRaveComp is TRaveBitmap) then
  begin
      ms := TMemoryStream.Create;
      TBlobField(qReq.FieldByName('logo')).SaveToStream(ms);
      ms.Position := 0;
      TRaveBitmap(TmpRaveComp).Image.LoadFromStream(ms);
      FreeAndNil(ms);
  end;

  try
    cacheData.rvpRepAcc.Execute;
  except end;
end;

class procedure TfrmPrint.ShowPrintForm(ag_id, sd_id: integer);
begin
  if not Assigned(frmPrint) then
  begin
      frmPrint := TfrmPrint.Create(Application);
  end;

  frmPrint.mode := 1;
  frmPrint.ag_id := ag_id;
  frmPrint.sd_id := sd_id;

  frmPrint.lstInvoiceForm.ItemIndex := 0;

  with frmPrint do begin
  qAcc.Close;

  qAcc.ParamByName('ag_id').AsInteger := ag_id;
  qAcc.ParamByName('sd_id').AsInteger := sd_id;
  qAcc.Open;

  qAccCust.Close;
  qAccCust.ParamByName('ag_id').AsInteger := ag_id;
  qAccCust.ParamByName('sd_id').AsInteger := sd_id;
  qAccCust.Open;

  if qAccCust.IsEmpty then
  begin
      MessageBox(Handle, 'На компанию нет бухгалтерских данных.', 'Prinfo', MB_OK or MB_ICONERROR);
      FreeAndNil(frmPrint);
      exit;
  end;

  qAccService.Close;
  qAccService.ParamByName('ag_id').AsInteger := ag_id;
  qAccService.ParamByName('sd_id').AsInteger := sd_id;
  qAccService.Open;
  end;
  try
    frmPrint.ShowModal;
  finally
      FreeAndNil(frmPrint);
  end
end;

procedure TfrmPrint.PrepareSQL;
var sum, sumnds,sumoutnds: double;
    sett: TformatSettings;
    s,s1:string;
begin
    sett.DecimalSeparator := '.';

    sum := StrToFloat(frmnewAccount.DBEdit4.Text);
    sumnds    := sum / 6;
    sumoutnds := sum -  (sum / 6);

    if cdsAccSD_KA_START_DATE.IsNull then
          s := 'NULL'
    else
          s := QuotedStr(cdsAccSD_KA_START_DATE.AsString);

    if cdsAccSD_KA_END_DATE.IsNull then
         s1 := 'NULL'
    else
         s1 := QuotedStr(cdsAccSD_KA_END_DATE.AsString);

    qAcc.SQL.Clear;
    qAcc.SQL.Append(
      'SELECT CAST(' + QuotedStr(cdsAccSD_FACT_DATE.AsString) + ' AS TIMESTAMP) AS sd_fact_date, ' +
                  cdsAccSD_FACT_NUM.AsString + ' AS sd_fact_num, ' +
               'CAST(' + QuotedStr(FormatFloat('0.00', cdsAccSD_SKIDKA.AsFloat, sett)) + ' AS FLOAT) AS sd_skidka, ' +
                'CAST(' + QuotedStr(FormatFloat('0.00', sum, sett)) + ' AS FLOAT) AS sd_sum, ' +
                 'CAST('+ QuotedStr(frmnewAccount.DBEdit5.Text) + ' AS VARCHAR(128)) AS PODACHA_NUMS, ' +
                 'CAST(' +QuotedStr(frmnewAccount.DBLookupComboboxEh1.Text) + ' AS VARCHAR(128)) AS fm_name, ' +
                 'CAST(NULL AS VARCHAR(255)) AS SD_SUM_LITERAL, ' +
                 'CAST('+ QuotedStr(FormatFloat('0.00', sumnds, sett)) + ' AS FLOAT) AS SD_SUM_NDS, ' +
                 'CAST('+ QuotedStr(FormatFloat('0.00', sumoutnds, sett)) + ' AS FLOAT) AS SD_SUM_OUT_NDS,' +
                 'CAST(NULL AS VARCHAR(255)) AS PREDMET_RAHUNKU, ' +
                 'CAST(' + s + ' AS TIMESTAMP) AS SD_KA_START_DATE, ' +
                 'CAST(' + s1 + ' AS TIMESTAMP) AS SD_KA_END_DATE, ' +
                 'CAST(NULL AS VARCHAR(128)) AS SD_PERIOD ' +
      'FROM rdb$database');
end;

class procedure TfrmPrint.ShowPrintFormCust(agid, cuid, reg_id: integer);
begin
  if not Assigned(frmPrint) then
  begin
      frmPrint := TfrmPrint.Create(Application);
  end;

  frmPrint.mode := 2;
  frmPrint.lstInvoiceForm.ItemIndex := 0;

  if not Assigned(frmPrint.frmnewAccount) then frmPrint.frmnewAccount := TfrmnewAccount.Create(frmPrint);

  with frmPrint do begin
    cdsAcc.FetchParams;
    cdsAcc.Params.ParamByName('ag_id').AsInteger := -1;
    cdsAcc.Params.ParamByName('sd_id').AsInteger := -1;
    cdsAcc.Open;
    frmnewAccount.dsAcc.DataSet := cdsAcc;
    frmNewAccount.CheckValidNum := true;

    if frmPrint.frmNewAccount.ShowNewAccount(true) = mrOk then
    begin
      qAccCust.SQL.Clear;
      qAccCust.SQL.Text := qAccCust2.SQL.Text;
      qAccCust.ParamByName('ag_id').AsInteger := agid;
      qAccCust.ParamByName('cu_id').AsInteger := cuid;
      qAccCust.ParamByName('reg_id').AsInteger := reg_id;
      qAccCust.Open;

      if qAccCust.IsEmpty then
      begin
          MessageBox(Handle, 'На компанию нет бухгалтерских данных.', 'Prinfo', MB_OK or MB_ICONERROR);
          FreeAndNil(frmPrint.frmnewAccount);
          FreeAndNil(frmPrint);
          exit;
      end;
      
      frmPrint.ShowModal;
    end;
  end;

  FreeAndNil(frmPrint.frmnewAccount);
  FreeAndNil(frmPrint);
end;

class procedure TfrmPrint.ShowPrintFormMulti(ag_id, sd_id: integer; summ: double; fact_num: integer; fact_date, intStartDate, intEndDate: TDate);
begin
    if not Assigned(frmPrint) then
    begin
        frmPrint := TfrmPrint.Create(Application);
    end;

    frmPrint.mode := 2;

    frmPrint.lstInvoiceForm.ItemIndex := 0;

    frmPrint.ag_id := ag_id;
    frmPrint.sd_id := sd_id;

    if not Assigned(frmPrint.frmNewAccount) then frmPrint.frmNewAccount := TfrmNewAccount.Create(frmPrint);

    with frmPrint do
    begin
          cdsAcc.FetchParams;
          cdsAcc.Params.ParamByName('ag_id').AsInteger := -1;
          cdsAcc.Params.ParamByName('sd_id').AsInteger := -1;
          cdsAcc.Open;
          frmnewAccount.dsAcc.DataSet := cdsAcc;
          frmNewAccount.CheckValidNum := false;

          frmNewAccount.dsAcc.DataSet.Edit;
          frmNewAccount.dsAcc.DataSet.FieldByName('SD_FACT_NUM').AsInteger := fact_num;
          frmNewAccount.dsAcc.DataSet.FieldByName('SD_FACT_DATE').AsDateTime := fact_date;
          frmNewAccount.dsAcc.DataSet.FieldByName('SD_SUM').AsFloat := summ;
          frmNewAccount.dsAcc.DataSet.FieldByName('SD_KA_START_DATE').AsDateTime := intStartDate;
          frmNewAccount.dsAcc.DataSet.FieldByName('SD_KA_END_DATE').AsDateTime := intEndDate;
          frmNewAccount.dsAcc.DataSet.Post;

          if frmNewAccount.ShowNewAccount(false) = mrOK then
          begin
              qAccCust.Close;
              qAccCust.ParamByName('ag_id').AsInteger := ag_id;
              qAccCust.ParamByName('sd_id').AsInteger := sd_id;
              qAccCust.Open;

              if qAccCust.IsEmpty then
              begin
                  MessageBox(Handle, 'На компанию нет бухгалтерских данных.', 'Prinfo', MB_OK or MB_ICONERROR);
                  FreeAndNil(frmPrint.frmnewAccount);
                  FreeAndNil(frmPrint);
                  exit;
              end;

              frmPrint.ShowModal;
          end;
    end;

    FreeAndNil(frmPrint.frmnewAccount);
    FreeAndNil(frmPrint);
end;

procedure TfrmPrint.FormDestroy(Sender: TObject);
begin
  FreeAndNil(frmnewAccount)
end;

function TfrmPrint.PredmetRakh():string;
var prefix,suffix,intsuff:string;
    i,k:integer;
begin
    suffix := '';
    intsuff := '';
    k := 0;

    for i := 0 to chkList.Items.Count - 1 do
    begin
        if chkList.Checked[i] then
        begin
            if i = chkList.Count - 1 then
            begin
                intsuff := ' та на сайтi www.rabotaplus.ua ';
            end
            else begin
                inc(k);
                suffix  := suffix + '"' + chkList.Items[i] + '", ';
            end;
        end;
    end;

    if (length(suffix) > 0) then suffix[length(suffix) - 1] := #0;

    if k > 1 then prefix := 'Об`ява у газетах '
    else if (k = 0) and (intsuff <> '') then intsuff := 'Об`ява на сайтi www.rabotaplus.ua '
    else prefix := 'Об`ява в газеті ';

    suffix := trim(suffix) + intsuff;
    result := prefix + suffix;

    if Prtype = '2' then
    begin
        result := result + ','#13'рубрика "Пропонується оголошення"'
    end;
end;

procedure TfrmPrint.qAccCalcFields(DataSet: TDataSet);
var s:string;
begin
    DataSet.FieldByName('SD_SUM_LITERAL').AsString := SumNumToFull(DataSet.FieldByName('SD_SUM').AsFloat);
    DataSet.FieldByName('PREDMET_RAHUNKU').AsString := PredmetRakh();

    s := DataSet.FieldByName('SD_KA_START_DATE').AsString + ' - ' +
         DataSet.FieldByName('SD_KA_END_DATE').AsString;

    if trim(s) = '-' then s := '';
    DataSet.FieldByName('SD_PERIOD').AsString := s;
end;

function SumNumToFull(Number:double):string;
var
  PartNum, TruncNum, NumTMP, D: integer;
  NumStr : string;
  i, R : byte;
  Flag11 : boolean;
begin
  if (Number <= 0) then
  begin
      result := ' ------ ';
      exit;
  end;
  
  PartNum := 0;
  D := 1000000;
  R := 4;
  //выделяем рубли
  TruncNum := Trunc(Number);
  if TruncNum <> 0 then
    repeat
      PartNum := TruncNum div D;
      Dec(R);
      D:=D div 1000;
    until
      (PartNum <> 0)
  else
    R := 0;

  // перевод рублей
  for i := R downto 1 do
  begin
    Flag11 := False;
    // выделение цифры сотен
    NumTMP := PartNum div 100;
    case NumTMP of
      1: NumStr := NumStr + 'сто ';
      2: NumStr := NumStr + 'двісті ';
      3: NumStr := NumStr + 'триста ';
      4: NumStr := NumStr + 'чотириста ';
      5: NumStr := NumStr + 'п''ятсот ';
      6: NumStr := NumStr + 'шiстсот ';
      7: NumStr := NumStr + 'сiмсот ';
      8: NumStr := NumStr + 'вiсiмсот ';
      9: NumStr := NumStr + 'дев''ятсот ';
    end;
    // выделение цифры десятков
    NumTMP := (PartNum mod 100) div 10;
    case NumTMP of
      1:
      begin
        NumTMP := PartNum mod 100;
        case NumTMP of
          10: NumStr := NumStr + 'десять ';
          11: NumStr := NumStr + 'одинадцять ';
          12: NumStr := NumStr + 'дванадцять ';
          13: NumStr := NumStr + 'тринадцять ';
          14: NumStr := NumStr + 'чотирнадцять ';
          15: NumStr := NumStr + 'п''ятнадцять ';
          16: NumStr := NumStr + 'шiстнадцять ';
          17: NumStr := NumStr + 'сiмнадцять ';
          18: NumStr := NumStr + 'вiсiмнадцять ';
          19: NumStr := NumStr + 'дев''ятнадцять ';
        end;
        case i of
          3: NumStr := NumStr + 'мільйонів ';
          2: NumStr := NumStr + 'тисяч ';
          1: NumStr := NumStr + 'гривень ';
        end;
        Flag11 := True;
      end;
      2: NumStr := NumStr + 'двадцять ';
      3: NumStr := NumStr + 'тридцять ';
      4: NumStr := NumStr + 'сорок ';
      5: NumStr := NumStr + 'п''ятдесят ';
      6: NumStr := NumStr + 'шiстдесят ';
      7: NumStr := NumStr + 'сiмдесят ';
      8: NumStr := NumStr + 'вiсiмдесят ';
      9: NumStr := NumStr + 'дев''яносто ';
    end;
    // выделение цифры единиц
    NumTMP:=PartNum mod 10;
    if not Flag11 then
    begin
      case NumTMP of
        1:
          if i = 2 then
            NumStr := NumStr + 'одна '
          else
            NumStr := NumStr + 'один ';
        2:
          if i = 2 then
            NumStr := NumStr + 'две '
          else
            NumStr := NumStr + 'двi ';
        3: NumStr := NumStr + 'три ';
        4: NumStr := NumStr + 'чотири ';
        5: NumStr := NumStr + 'п''ять ';
        6: NumStr := NumStr + 'шiсть ';
        7: NumStr := NumStr + 'сiм ';
        8: NumStr := NumStr + 'вiсiм ';
        9: NumStr := NumStr + 'дев''ять ';
      end;
      case i of
        3:
          case NumTMP of
            1: NumStr := NumStr + 'мiльйон ';
            2,3,4: NumStr := NumStr + 'мiльйона ';
            else
              NumStr := NumStr + 'мiльйони ';
          end;
        2:
          case NumTMP of
            1 : NumStr := NumStr + 'тисяча ';
            2,3,4: NumStr := NumStr + 'тисячи ';
            else
              if PartNum <> 0 then
                NumStr := NumStr + 'тисяч ';
          end;
        1:
          case NumTMP of
            1 : NumStr := NumStr + 'гривня ';
            2,3,4: NumStr := NumStr + 'гривнi ';
            else
              NumStr := NumStr + 'гривень ';
          end;
      end;
    end;
    if i > 1 then
    begin
      PartNum := (TruncNum mod (D * 1000)) div D;
      D := D div 1000;
    end;
  end;

  //перевод копеек
  PartNum := Round(Frac(Number) * 100);
  if PartNum = 0 then
  begin
    SumNumToFull := AnsiUpperCase(NumStr[1]) + RightStr(NumStr, length(numStr) - 1) + '00 копійок';
    Exit;
  end;
  // выделение цифры десятков
  NumTMP := PartNum div 10;
  if NumTMP = 0 then
    NumStr := NumStr + '0' + IntToStr(PartNum) + ' '
  else
    NumStr := NumStr + IntToStr(PartNum) + ' ';
  // выделение цифры единиц
  NumTMP := PartNum mod 10;
  case NumTMP of
    1:
      if PartNum <> 11 then
        NumStr := NumStr + 'копійка'
      else
        NumStr := NumStr + 'копійок';
    2,3,4:
      if (PartNum < 5) or (PartNum > 14) then
        NumStr := NumStr + 'копійки'
      else
        NumStr := NumStr + 'копійок';
    else
      NumStr := NumStr + 'копійок';
  end;
  SumNumToFull := AnsiUpperCase(NumStr[1]) + RightStr(NumStr, length(numStr) - 1);
end;

end.
