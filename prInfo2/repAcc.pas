unit repAcc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, FMTBcd, DBClient, Provider, DB,
  SqlExpr, globals, jpeg, RpCon, RpConDS, RpRender, RpRenderCanvas,
  RpRenderPreview, RpBase, RpSystem, RpDefine, RpRave;

type
  TrpAcc = class(TForm)
    qrAcc: TQuickRep;
    ChildBand1: TQRBand;
    QRLabel14: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
	QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape4: TQRShape;
    QRLabel27: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    lblSubject: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape6: TQRShape;
    QRDBText15: TQRDBText;
    QRLabel15: TQRLabel;
    QRShape7: TQRShape;
    QRDBText20: TQRDBText;
	QRDBText121: TQRDBText;
	QRDBText122: TQRDBText;
    QRDBText123: TQRDBText;
    imgPR: TQRImage;
    mmOrg: TQRMemo;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText11: TQRDBText;
    QRShape8: TQRShape;
    imgStampOld: TQRImage;
    QRShape9: TQRShape;
    QRDBText13: TQRDBText;
    QRLabel10: TQRLabel;
    qryAcc: TSQLQuery;
    qryAccSD_FACT_DATE: TSQLTimeStampField;
    qryAccSD_FACT_NUM: TIntegerField;
    qryAccSD_SKIDKA: TFloatField;
    qryAccSD_SUM: TFloatField;
    qryAccPODACHA_NUMS: TStringField;
    qryAccFM_NAME: TStringField;
    qryAccAG_FACTURA_PHONES: TStringField;
    prvAcc: TDataSetProvider;
    cdsAcc: TClientDataSet;
    cdsAccSD_FACT_DATE: TSQLTimeStampField;
    cdsAccSD_FACT_NUM: TIntegerField;
    cdsAccSD_SKIDKA: TFloatField;
    cdsAccSD_SUM: TFloatField;
    cdsAccPODACHA_NUMS: TStringField;
    cdsAccFM_NAME: TStringField;
    cdsAccSD_SUM_LITERAL: TStringField;
    cdsAccAG_FACTURA_PHONES: TStringField;
    cdsAccSD_SUM_NDS: TFloatField;
    cdsAccSD_SUM_PZR: TFloatField;
    cdsAccSD_SUM_OUT_NDS: TFloatField;
    qryAccPT_ID: TSmallintField;
    cdsAccPT_ID: TSmallintField;
    qryAccCust: TSQLQuery;
    prvAccCust: TDataSetProvider;
    cdsAccCust: TClientDataSet;
    cdsAccCustCUQ_OKPO: TStringField;
    cdsAccCustCUQ_ADDRESS: TStringField;
    cdsAccCustCUQ_ADDRESS_REAL: TStringField;
    cdsAccCustCUQ_PHONES: TStringField;
    cdsAccCustCUQ_NDS_NUM: TStringField;
    cdsAccCustCUQ_INN: TStringField;
    qryAccCU_ID: TIntegerField;
    cdsAccCU_ID: TIntegerField;
    DataSource1: TDataSource;
    QRDBText14: TQRDBText;
    cdsAccCustAG_FACTURA_NAME: TStringField;
    cdsAccCustCUQ_FULL_NAME: TStringField;
    QRMemo4: TQRMemo;
    mmPDV: TQRMemo;
    mmOKPO: TQRMemo;
    imgStampNew: TQRImage;
    QRLabel11: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    imgST: TQRImage;
    QRImage1: TQRImage;
    procedure cdsAccCalcFields(DataSet: TDataSet);
    procedure cdsAccSD_SUM_LITERALGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure prvAccBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
	  var Applied: Boolean);
	procedure cdsAccCustCUQ_FULL_NAMEGetText(Sender: TField;
	  var Text: String; DisplayText: Boolean);
  private
	function checkBuhgalterData(showWarningMessage:boolean):boolean;
	procedure setParams(AOldOrgData: boolean; ALogoGazeta: integer);
  public
	function printAccountForCust(agid,cuid:integer; OldOrgData: boolean; ALogoGazeta: integer):boolean;
  end;

var
  rpAcc: TrpAcc;

implementation

uses dmRep, dm, newAccount;

{$R *.dfm}

function TrpAcc.checkBuhgalterData(showWarningMessage:boolean):boolean;
begin
	Result:=false;
	if ((cdsAccCust.Active)and(trim(cdsAccCustCUQ_OKPO.Value)<>'')) then
		Result:=true;

	if ((not Result)and(showWarningMessage)) then
		MessageDlg('Для клиента этой сделки не введены точные бухгалтерские данные!',mtError,[mbOk],0);
end;

{
procedure TForm1.FormCreate(Sender: TObject);
begin
  RvProject.Open;
  RvProject.GetReportList(ReportLB.Items,true);
end;

procedure TForm1.ReportLBClick(Sender: TObject);
begin
  RvProject.SelectReport(ReportLB.Items[ReportLB.ItemIndex],true);
  RvProject.ReportDescToMemo(DescMemo);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  RvProject.Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  RvProject.Execute;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ReportLB.ItemIndex := 0;
  ReportLBClick(nil);
end;
}

function TrpAcc.printAccountForCust(agid,cuid:integer; OldOrgData: boolean; ALogoGazeta: integer):boolean;
begin
	Result:=false;

	setParams(OldOrgData, ALogoGazeta);

//*    frmNewAccount.dsAcc.DataSet:=cdsAcc;

	if (cdsAcc.Active) then
		cdsAcc.Close;

// сделаем пустой ResultSet, в который потом добавим запись, как
// будто это - сделка. Все нужные поля заполнит пользователь вручную
	cdsAcc.Params.ParamByName('AG_ID').AsInteger:=-1;
	cdsAcc.Params.ParamByName('SD_ID').AsInteger:=-1;
	cdsAcc.Open;

	cdsAcc.Insert;
	cdsAccAG_FACTURA_PHONES.AsString:=data.cdsAgentAG_FACTURA_PHONES.Value;
	cdsAccSD_FACT_DATE.AsDateTime:=Date;
	cdsAccSD_SKIDKA.Value:=0;
	cdsAccSD_SUM.Value:=0;

	if (cdsAccCust.Active) then
		cdsAccCust.Close;

	cdsAccCust.Params.ParamByName('AG_ID').AsInteger:=agid;
	cdsAccCust.Params.ParamByName('CU_ID').AsInteger:=cuid;
	cdsAccCust.Open;

	if (checkBuhgalterData(true) and
		(frmNewAccount.ShowModal=mrOk)
	   ) then
	begin
//		cdsAcc.CheckBrowseMode;
		qrAcc.PreviewModal;
		Result:=true;
	end;
end;


// Сформируем "сумму прописью"
procedure TrpAcc.cdsAccCalcFields(DataSet: TDataSet);
begin
	if (not DataSet.FieldByName('SD_SUM').IsNull) then
	begin
// так "загадочно" сделано для того, чтобы округление не мешало
// "сходиться" копейкам в сумме
		DataSet.FieldByName('SD_SUM_NDS').Value:=
			(DataSet.FieldByName('SD_SUM').Value/1.205)*0.2;

		DataSet.FieldByName('SD_SUM_PZR').Value:=
			DataSet.FieldByName('SD_SUM').Value*0.005/1.205;

		DataSet.FieldByName('SD_SUM_OUT_NDS').Value:=
			DataSet.FieldByName('SD_SUM').Value-
			StrToFloat(DataSet.FieldByName('SD_SUM_NDS').DisplayText)-
			StrToFloat(DataSet.FieldByName('SD_SUM_PZR').DisplayText);
	end;
end;

procedure TrpAcc.cdsAccSD_SUM_LITERALGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
function sNumToStr(sNum:string):string;
const
  Names:array[1..12] of String=(' мiльйон',' мiльйони',' мiльйонiв',
								' тисяча',' тисячi',' тисяч',
								' гривня',' гривнi',' гривень',
								' копiйка',' копiйки',' копiйок');
  Nums:array[1..38] of String=(' один',' одна',' два',' двi',' три',
							   ' чотири',' п''ять',' шiсть',
							   ' сiм',' вiсiм',' дев''ять',' десять',
							   ' одинадцять',' дванадцять',' тринадцять',
							   ' чотирнадцять',' п''ятнадцять',' шiстнадцять',
							   ' сiмнадцять',' вiсiмнадцять',' дев''ятнадцять',
							   ' двадцять',' тридцять',' сорок',
							   ' п''ятдесят',' шiстдесят',' сiмдесят',
							   ' вiсiмдесят',' дев''яносто',' сто',
							   ' двiстi',' триста',' чотириста',' п''ятсот',
							   ' шiстсот',' сiмсот',' вiсiмсот',
							   ' дев''ятсот');
  NumStrLen=12;
  NumRazr=4;

var
  s1,s2:String;
  sTmp:string[1];
  i,a,err:integer;
function SetS(s:char):char;
begin
  if s=' ' then Result:='0'
  else Result:=s;
end;
begin
  s1:='';
  While Pos(' ',sNum)>0 do
    Delete(sNum,Pos(' ',sNum),1);
  If Length(sNum)<12 then
    For i:=1 to 12-Length(sNum) do sNum:='0'+sNum;
  s2:='';
  s1:=sNum;
  s1[10]:='0';

  For i:=NumRazr DownTo 1 do
  begin
    case s1[i*3-1] of
	  '1': s2:=Names[i*3]+s2;
    else
      case s1[i*3] of
        '1'      : s2:=Names[i*3-2]+s2;
        '2'..'4' : s2:=Names[i*3-1]+s2;
        '5'..'9' : s2:=Names[i*3]  +s2;
        '0'      : If (not((s1[i*3-2]='0')and(s1[i*3-1]='0')))or(i=NumRazr)
                       then s2:=Names[i*3]  +s2;
      end;
    end;
    
    if (i<>4) then
    case s1[i*3-1] of
      '1'          : begin
                       Val(s1[i*3],a,err);
                       s2:=Nums[12+a]+s2;
                     end;
      '0','2'..'9' : begin
                       Val(s1[i*3],a,err);
                       case a of
                          1    : case i of
                                   2,3,4 : s2:=Nums[2]+s2;
                                   1     : s2:=Nums[1]+s2;
                                 end;
                          2    : case i of
                                   2,3,4 : s2:=Nums[4]+s2;
                                   1     : s2:=Nums[3]+s2;
                                 end;
                          3..9 : s2:=Nums[a+2]+s2;
					   end;
                       Val(s1[i*3-1],a,err);
                       If a<>0 then s2:=Nums[20+a]+s2;
					 end;
    end
    else s2:=' '+s1[i*3-1]+s1[i*3]+s2;

    if (i=NumRazr-1)and(s1[i*3-2]='0')and(s1[i*3-1]='0')and(s1[i*3]='0') then
      s2:=Names[9]+s2;

    Val(s1[i*3-2],a,err);
    If a<>0 then s2:=Nums[29+a]+s2;

  end;

  sTmp:=s2[2];
  sTmp:=AnsiUpperCase(sTmp);
  s2:=Copy(s2,3,Length(s2)-2);
  s2:=sTmp+s2;
  Result:=s2;

end;

begin
	if (not cdsAccSD_SUM.IsNull) then
		Text:=sNumToStr(cdsAccSD_SUM.Text);
end;

procedure TrpAcc.prvAccBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
	DeltaDS.EmptyDataSet;
end;

procedure TrpAcc.cdsAccCustCUQ_FULL_NAMEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	if (Sender<>nil) then
		Text:=trim(Sender.AsString);
end;

procedure TrpAcc.setParams(AOldOrgData: boolean; ALogoGazeta: integer);
begin
	if (AOldOrgData) then
	begin
		mmOrg.Lines.Clear();
		mmOrg.Lines.Add('ПП "РОБОТА ПЛЮС"');
		mmOrg.Lines.Add('р/р 2600 200 00692 01');
		mmOKPO.Lines.Text := 'ЄДРПУ 24257092';
		imgStampOld.Enabled := true;
		imgStampNew.Enabled := false;
	end
	else
	begin
		mmOrg.Lines.Clear();
		mmOrg.Lines.Add('ТОВ "РОБОТА ПЛЮС"');
		mmOrg.Lines.Add('р/р 2600 900 07337 01');
		mmOKPO.Lines.Text := 'ЄДРПУ 33302178';
		imgStampOld.Enabled := false;
		imgStampNew.Enabled := true;
	end;

	if (ALogoGazeta = GZ_ST) then
	begin
		imgPR.Enabled := false;
		imgST.Enabled := true;
		lblSubject.Caption := 'Предмет рахунку: За публікацію оголошення в газеті "Срочно требуются"'
	end
	else
	begin
		imgPR.Enabled := true;
		imgST.Enabled := false;

		if (ALogoGazeta = -1) then
			lblSubject.Caption := 'Предмет рахунку: За публікацію оголошень у газетах "Пропоную Роботу" та "Срочно требуются"'
		else
			lblSubject.Caption := 'Предмет рахунку: За публікацію оголошення в газеті "Пропоную Роботу"';
	end;
end;

end.
