unit findSdelka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, sdelka,
  NewButt, DropButt, Menus, Mask, DB, htmlReport, dm, DBCtrlsEh, DBLookupEh,
  globals, DBGridEh, SqlTimSt, ShellApi;

type
  TfrmFindSdelka = class(TForm)
    btSearch: TBitBtn;
    DBGrid1: TDBGrid;
    btEditSdelka: TBitBtn;
    btViewSdelka: TBitBtn;
    Shape3: TShape;
    cbAllAgents: TCheckBox;
    rbByID: TRadioButton;
	rbByPhone: TRadioButton;
    rbByFact: TRadioButton;
    ppAdditional: TPopupMenu;
    miGiveSdelka: TMenuItem;
    miBeznalVNal: TMenuItem;
    btAdditional: TDropButt;
    edSearch: TMaskEdit;
    btEditText: TBitBtn;
    miPrintList: TMenuItem;
    rbByText: TRadioButton;
    cbIssuePR: TDBLookupComboboxEh;
    miPrintFactura: TMenuItem;
    miDeleteSdelka: TMenuItem;
    miBeznalVKredit: TMenuItem;
    Panel1: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    Shape4: TShape;
    DBText1: TDBText;
    miNalVBeznal: TMenuItem;
    rbByOKPO: TRadioButton;
    Panel2: TPanel;
    mnuKassaNal: TMenuItem;
    mnuNalKassa: TMenuItem;
    procedure btSearchClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure btViewSdelkaClick(Sender: TObject);
	procedure btEditSdelkaClick(Sender: TObject);
    procedure miBeznalVNalClick(Sender: TObject);
    procedure miGiveSdelkaClick(Sender: TObject);
	procedure rbByIDClick(Sender: TObject);
    procedure miDeleteSdelkaClick(Sender: TObject);
    procedure btEditTextClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure miPrintListClick(Sender: TObject);
	function FoundSdelkasPrint:TStringList;
    procedure miBeznalVKreditClick(Sender: TObject);
    procedure miNalVBeznalClick(Sender: TObject);
    procedure mnuNalKassaClick(Sender: TObject);
    procedure mnuKassaNalClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    // текущий тип пользователя
	fUser:TUser;
  public
	function ShowModal(usr:TUser):TModalResult; reintroduce;
	property User:TUser read fUser;
  end;

var
	frmFindSdelka: TfrmFindSdelka;

implementation

uses main, sdelkaForm, agentSummary, ChangeAgentForSdelka,
  dmPubl, sdelkaPublForm, accessRights;

{$R *.dfm}

// Типа начинаем искать сделку
function TfrmFindSdelka.ShowModal(usr:TUser):TModalResult;
begin
	fUser:=usr;

	// Установим права пользователя
	TAccessRightsManager.SetWindowAccessState(fUser,self);

	Result:=inherited ShowModal();
end;


// Ищем сделку
procedure TfrmFindSdelka.btSearchClick(Sender: TObject);
begin
	// В зависимости от того, какой вариант поиска выбран, выберем
	// Query для поиска. После этого - свяжем квери с ДатаСорцем,
	// данные из которого отображаются в списке найденных сделок.
  if trim(edSearch.Text) = '' then exit;
	if (data.sdsCheckPhoneInOtkaznik.Active) then
		data.sdsCheckPhoneInOtkaznik.Close;

	// Ищем по коду сделки (без кода агента)
	if (rbByID.Checked)  then
	begin
		// выбираем квери...
		data.prvFindSdelka.DataSet:=data.qryFindSdelkaByNumber;
		// уточняем список его параметров...
		data.cdsFindSdelka.FetchParams;
		data.cdsFindSdelka.Close;
    data.cdsFindSdelka.Params.ParamByName('SD_NUM').AsString := edSearch.Text;
		data.cdsFindSdelka.Params.ParamByName('US_ID').AsInteger := frmMain.currentUser;
		data.cdsFindSdelka.Open
	end
	// Ищем по телефону
	else if (rbByPhone.Checked) then
	begin
		data.prvFindSdelka.DataSet:=data.qryFindSdelkaByPhone;
		data.cdsFindSdelka.FetchParams;
		data.cdsFindSdelka.Close;
		if (cbAllAgents.Checked) then
			data.cdsFindSdelka.Params.ParamByName('AG_ID').AsInteger := -1
		else
			data.cdsFindSdelka.Params.ParamByName('AG_ID').AsInteger := data.cdsAgentAG_ID.Value;
		data.cdsFindSdelka.Params.ParamByName('PH_NUMBER').AsString := edSearch.Text;
    data.cdsFindSdelka.Params.ParamByName('US_ID').AsInteger := frmMain.currentUser;
		data.cdsFindSdelka.Open;

    data.sdsCheckPhoneInOtkaznik.Params.ParamByName('PH_NUMBER').AsString := edSearch.Text;
		data.sdsCheckPhoneInOtkaznik.Open;
	end
	// Ищем по номеру счёта-фактуры
	else if (rbByFact.Checked)  then
	begin
		data.prvFindSdelka.DataSet:=data.qryFindSdelkaByFactNum;
		data.cdsFindSdelka.FetchParams;
		data.cdsFindSdelka.Close;
		if (cbAllAgents.Checked) then
			data.cdsFindSdelka.Params.ParamByName('AG_ID').AsInteger := -1
		else
			data.cdsFindSdelka.Params.ParamByName('AG_ID').AsInteger := data.cdsAgentAG_ID.Value;
		data.cdsFindSdelka.Params.ParamByName('SD_FACT_NUM').AsInteger := StrToInt(edSearch.Text);
		data.cdsFindSdelka.Params.ParamByName('US_ID').AsInteger := frmMain.currentUser;
		data.cdsFindSdelka.Open;
	end
	// Ищем по тексту объявления
	else if (rbByText.Checked)  then
	begin
		data.prvFindSdelka.DataSet := data.qryFindSdelkaByText;
		data.cdsFindSdelka.FetchParams;
		data.cdsFindSdelka.Close;
		if (cbAllAgents.Checked) then
			data.cdsFindSdelka.Params.ParamByName('AG_ID').AsInteger := -1
		else
			data.cdsFindSdelka.Params.ParamByName('AG_ID').AsInteger := data.cdsAgentAG_ID.Value;
		data.cdsFindSdelka.Params.ParamByName('OB_TEXT').AsString  := edSearch.Text;
		data.cdsFindSdelka.Params.ParamByName('IS_ID').AsInteger   := cbIssuePR.KeyValue;
		data.cdsFindSdelka.Params.ParamByName('US_ID').AsInteger   := frmMain.currentUser;
		data.cdsFindSdelka.Open;
	end
	else if (rbByOKPO.Checked) then
	begin
		data.prvFindSdelka.DataSet:=data.qryFindSdelkaByOKPO;
		data.cdsFindSdelka.FetchParams;
		data.cdsFindSdelka.Close;
		if (cbAllAgents.Checked) then
			data.cdsFindSdelka.Params.ParamByName('AG_ID').AsInteger := -1
		else
			data.cdsFindSdelka.Params.ParamByName('AG_ID').AsInteger := data.cdsAgentAG_ID.Value;
		data.cdsFindSdelka.Params.ParamByName('CU_OKPO').AsString  := edSearch.Text;
		data.cdsFindSdelka.Params.ParamByName('US_ID').AsInteger   := frmMain.currentUser;
		data.cdsFindSdelka.Open;
	end;


	edSearch.SetFocus;
	edSearch.SelectAll;
end;

procedure TfrmFindSdelka.FormHide(Sender: TObject);
begin
	data.dsFindSdelka.DataSet.Close;
end;

procedure TfrmFindSdelka.btViewSdelkaClick(Sender: TObject);
begin
//    TfrmSdelkaForm.Edit(data.dsFindSdelka.DataSet.FieldByName('AG_ID').Value,data.dsFindSdelka.DataSet.FieldByName('SD_ID').Value,fUser,nil);
 	if (not data.dsFindSdelka.DataSet.IsEmpty) then
	begin
		TfrmSdelkaForm.View(data.dsFindSdelka.DataSet.FieldByName('AG_ID').Value, data.dsFindSdelka.DataSet.FieldByName('SD_ID').Value, fUser);
	end;
end;

procedure TfrmFindSdelka.btEditSdelkaClick(Sender: TObject);
begin
	if (not data.dsFindSdelka.DataSet.IsEmpty) then
	begin
		TfrmSdelkaForm.Edit(data.dsFindSdelka.DataSet.FieldByName('AG_ID').Value, data.dsFindSdelka.DataSet.FieldByName('SD_ID').Value, fUser, nil);
	end;
end;


// Переводим сделку "из безнал в нал"


procedure TfrmFindSdelka.miGiveSdelkaClick(Sender: TObject);
begin
	// передать сделку может только менеджер агента-хозяина. Чтобы это проконтролировать,
	// менеджер, передающий сделку, должен залогиниться с именно тем агентом, сделку
	// которого нужно передать.
	if (frmMain.isRoot or
		((frmMain.currentUserType=PRG_USR_MANAGER)and
		 (data.cdsAgentAG_ID.Value=data.dsFindSdelka.DataSet.FieldByName('AG_ID').Value))) then
		frmChangeAgentForSdelka.Show(data.dsFindSdelka.DataSet.FieldByName('AG_ID').Value, data.dsFindSdelka.DataSet.FieldByName('SD_ID').Value)
	else
		MessageDlg('Вы не имеете права на передачу этой сделки',mtError,[mbOk],0);
end;


procedure TfrmFindSdelka.rbByIDClick(Sender: TObject);
begin
	edSearch.Clear;
	if (rbByPhone.Checked) then
		edSearch.EditMask := '!000-00-00;0;_'
	else
		edSearch.EditMask := '';

	cbIssuePR.Enabled   :=rbByText.Checked;
	cbIssuePR.KeyValue  :=data.tblParamsPM_CURRENT_ISSUE_PR.AsInteger;
end;


// Удаление сделки
procedure TfrmFindSdelka.miDeleteSdelkaClick(Sender: TObject);
begin
	if (MessageDlg('Вы уверены, что хотите удалить эту сделку?'#10#13'Отменить удаление нельзя!',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
		with data do
	begin
		spDeleteSdelka.ParamByName('AG_ID').AsInteger := dsFindSdelka.DataSet.FieldByName('AG_ID').Value;
		spDeleteSdelka.ParamByName('SD_ID').AsInteger := dsFindSdelka.DataSet.FieldByName('SD_ID').Value;
		spDeleteSdelka.ParamByName('COMMENT').AsString :=
			  copy('Удаление сделки: ' +
					dsFindSdelka.DataSet.FieldByName('AG_ID').AsString +
					'-' +
					dsFindSdelka.DataSet.FieldByName('SD_ID').AsString +
					'; US=' + IntToStr(frmMain.currentUser) +
					'; HOST=' + getLocalHostName(),
					1, 127);

		spDeleteSdelka.ExecProc;
		btSearch.Click;
	end;
end;


// Запускаем диалог редактирования текстов объявлений
procedure TfrmFindSdelka.btEditTextClick(Sender: TObject);
begin
	if (not data.dsFindSdelka.DataSet.IsEmpty) then
		TfrmSdelkaPublForm.Edit(data.dsFindSdelka.DataSet.FieldByName('SD_NUM').AsString,
                data.dsFindSdelka.DataSet.FieldByName('AG_ID').AsInteger,
								data.dsFindSdelka.DataSet.FieldByName('SD_ID').AsInteger,
								data.dsFindSdelka.DataSet.FieldByName('CU_ID').AsInteger,
								data.dsFindSdelka.DataSet.FieldByName('GZ_ID').AsInteger,
								data.dsFindSdelka.DataSet.FieldByName('CU_ID') as TIntegerField,
								fUser);
end;

procedure TfrmFindSdelka.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if (Key=#27) then Close;
end;


// Делаем отчёт со списком найденных сделок
function TfrmFindSdelka.FoundSdelkasPrint:TStringList;
var
	rep:TStringList;
	qry:TDataSet;
begin
	qry := data.dsFindSdelka.DataSet;

	rep := TStringList.Create();

	if (qry.Active and (not qry.IsEmpty())) then
	begin
		rep.Add('<CENTER><B>Найденные сделки</B></CENTER>');

		rep.Add(getTableHeader(qry,13));

		qry.First();
		while (not qry.Eof) do
		begin
			rep.Add(getTableRow(qry, 13, nil));
			qry.Next();
		end;

		rep.Add('</TABLE>');
	end;

	Result:=rep;
end;


// Печатаем список найденных сделок
procedure TfrmFindSdelka.miPrintListClick(Sender: TObject);
var
	rep:THtmlReport;
begin
	rep:=THtmlReport.Create();
	rep.TempName:='PrInfo-find-sdelka-result';
	rep.Add('<HTML><HEAD><TITLE>Найденные сделки</TITLE><STYLE>td {font-size: 8pt; border-bottom: 1px solid black; border-left: 1px solid black} body {font-family: Tahoma,Arial,Sans-Serif}</STYLE>');
	rep.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1251"></HEAD><BODY>');

	rep.AddStrings(FoundSdelkasPrint());
	rep.Add('</BODY></HTML>');
	rep.OpenInBrowser();
	rep.Free();
end;


// Переводим безнал в кредит
procedure TfrmFindSdelka.miBeznalVKreditClick(Sender: TObject);
begin
	with data do
	begin
		if ((dsFindSdelka.DataSet.FieldByName('PT_ID').Value = PAY_NAL) and
			(dsFindSdelka.DataSet.FieldByName('SD_STATE').Value <= SD_TO_PAY) and
			((dsFindSdelka.DataSet.FieldByName('SD_ALL_PAYED').IsNull) or
			 (dsFindSdelka.DataSet.FieldByName('SD_ALL_PAYED').Value = 0)) and
			((dsFindSdelka.DataSet.FieldByName('SD_SUM_PAYED').IsNull) or
			 (dsFindSdelka.DataSet.FieldByName('SD_SUM_PAYED').Value = 0))) then
		begin
			if (MessageDlg('Вы уверены, что хотите перевести эту сделку из нала в кредит?', mtConfirmation, [mbYes,mbNo], 0) = mrYes) then
			begin
				spNalVKredit.ParamByName('AG_ID').AsInteger := dsFindSdelka.DataSet.FieldByName('AG_ID').AsInteger;
				spNalVKredit.ParamByName('SD_ID').AsInteger := dsFindSdelka.DataSet.FieldByName('SD_ID').AsInteger;
				spNalVKredit.ExecProc;
        dsFindSdelka.DataSet.Refresh;
			end;
		end
		else
			MessageDlg('Эту сделку нельзя перевести из нала в кредит.', mtError, [mbOk], 0);
	end;
end;
procedure TfrmFindSdelka.miBeznalVNalClick(Sender: TObject);
var
	perc:currency;
begin
	with data do
	begin
		if ((dsFindSdelka.DataSet.FieldByName('PT_ID').Value = PAY_BEZNAL) and
			(dsFindSdelka.DataSet.FieldByName('SD_STATE').Value >= SD_CURRENT) and
			((dsFindSdelka.DataSet.FieldByName('SD_ALL_PAYED').IsNull) or
			 (dsFindSdelka.DataSet.FieldByName('SD_ALL_PAYED').Value = 0)) and
			((dsFindSdelka.DataSet.FieldByName('SD_SUM_PAYED').IsNull) or
			 (dsFindSdelka.DataSet.FieldByName('SD_SUM_PAYED').Value = 0))) then
		begin
			// При переводе сделки из безнала в нал может возникнуть необходимость
			// поменять у неё агентский процент. Кроме того, нужно принять в кассу
			// наличные деньги за эту сделку.
      // Процент сейчас не используеться

			{try
				perc:=StrToFloat(InputBox('Процент','Введите новый процент по сделке:',''));
			except
				exit;
			end; }
      perc := 0;
			if (MessageDlg('Сумма к сдаче агентом: ' + format('%.2f',[dsFindSdelka.DataSet.FieldByName('SD_SUM').AsFloat]) + '.' + #13#10 +
                     'Принять деньги?', mtConfirmation, [mbYes,mbNo], 0) = mrYes) then
			begin
				spBeznalVNal.ParamByName('AG_ID').AsInteger := dsFindSdelka.DataSet.FieldByName('AG_ID').AsInteger;
				spBeznalVNal.ParamByName('SD_ID').AsInteger := dsFindSdelka.DataSet.FieldByName('SD_ID').AsInteger;
				spBeznalVNal.ParamByName('SD_PERCENT').AsFloat := perc;
				spBeznalVNal.ExecProc;

				spAddSumForManager.ParamByName('M_ADD').AsFloat := dsFindSdelka.DataSet.FieldByName('SD_SUM').AsFloat;
				spAddSumForManager.ParamByName('M_COMMENT').AsString := 'Из безнала в нал (сделка №' +
                                                                dsFindSdelka.DataSet.FieldByName('SD_ID_COMPOUND').AsString +
                                                                '). Сдал деньги агент ' + dsFindSdelka.DataSet.FieldByName('AG_NAME').AsString;
				spAddSumForManager.ParamByName('M_TYPE').AsInteger  := TRANSACTION_AGENT_SDAL;
				spAddSumForManager.ParamByName('M_US_ID').AsInteger := frmMain.currentUser;
				spAddSumForManager.ExecProc;
        dsFindSdelka.DataSet.Refresh;
			end;
		end
		else
			MessageDlg('Эту сделку нельзя перевести из безнала в нал.', mtError, [mbOk], 0);
	end;
end;

procedure TfrmFindSdelka.miNalVBeznalClick(Sender: TObject);
begin
    with data do
    begin
		if ((dsFindSdelka.DataSet.FieldByName('PT_ID').Value = PAY_NAL) and
			(dsFindSdelka.DataSet.FieldByName('SD_STATE').Value < SD_CURRENT) and
			((dsFindSdelka.DataSet.FieldByName('SD_ALL_PAYED').IsNull) or
			 (dsFindSdelka.DataSet.FieldByName('SD_ALL_PAYED').Value = 0)) and
			((dsFindSdelka.DataSet.FieldByName('SD_SUM_PAYED').IsNull) or
			 (dsFindSdelka.DataSet.FieldByName('SD_SUM_PAYED').Value = 0))) then
		begin
			if (MessageDlg('Вы уверены, что хотите перевести эту сделку из нала в безнал?', mtConfirmation, [mbYes,mbNo], 0) = mrYes) then
			begin
				spNalVBeznal.ParamByName('AG_ID').AsInteger := dsFindSdelka.DataSet.FieldByName('AG_ID').AsInteger;
				spNalVBeznal.ParamByName('SD_ID').AsInteger := dsFindSdelka.DataSet.FieldByName('SD_ID').AsInteger;
				spNalVBeznal.ExecProc;
        dsFindSdelka.DataSet.Refresh;
			end;
		end
		else
			MessageDlg('Эту сделку нельзя перевести из нала в безнал.', mtError, [mbOk], 0);
    end;
end;

procedure TfrmFindSdelka.mnuNalKassaClick(Sender: TObject);
begin
  with data do
  begin
      if ((data.dsFindSdelka.DataSet.FieldByName('PT_ID').Value = PAY_NAL) and
			(data.dsFindSdelka.DataSet.FieldByName('SD_STATE').Value <= SD_CURRENT) and
			((data.dsFindSdelka.DataSet.FieldByName('SD_ALL_PAYED').IsNull) or
			 (data.dsFindSdelka.DataSet.FieldByName('SD_ALL_PAYED').Value = 0)) and
			((data.dsFindSdelka.DataSet.FieldByName('SD_SUM_PAYED').IsNull) or
			 (data.dsFindSdelka.DataSet.FieldByName('SD_SUM_PAYED').Value = 0))) then
      begin
          if MessageDlg('Вы уверены, что хотитее перевести эту сделку из нала в кассу?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
              spNalKassa.ParamByName('AG_ID').AsInteger := dsFindSdelka.DataSet.fieldByName('AG_ID').AsInteger;
              spNalKassa.ParamByName('SD_ID').AsInteger := dsFindSdelka.DataSet.FieldByName('SD_ID').AsInteger;
              spNalKassa.ExecProc;
              dsFindSdelka.DataSet.Refresh;
          end;
      end
      else
        MessageDlg('Эту сделку нельзя перевести из нала в кассу.', mtError, [mbOK], 0);
  end;
end;

procedure TfrmFindSdelka.mnuKassaNalClick(Sender: TObject);
var
	perc:currency;
begin
	with data do
	begin
		if ((dsFindSdelka.DataSet.FieldByName('PT_ID').Value = PAY_KASSA) and
			(dsFindSdelka.DataSet.FieldByName('SD_STATE').Value >= SD_CURRENT) and
			((dsFindSdelka.DataSet.FieldByName('SD_ALL_PAYED').IsNull) or
			 (dsFindSdelka.DataSet.FieldByName('SD_ALL_PAYED').Value = 0)) and
			((dsFindSdelka.DataSet.FieldByName('SD_SUM_PAYED').IsNull) or
			 (dsFindSdelka.DataSet.FieldByName('SD_SUM_PAYED').Value = 0))) then
		begin
			// При переводе сделки из кассы в нал может возникнуть необходимость
			// поменять у неё агентский процент. Кроме того, нужно принять в кассу
			// наличные деньги за эту сделку.
      // Процент сейчас не используеться
		 {	try
			 	perc:=StrToFloat(InputBox('Процент','Введите новый процент по сделке:',''));
			except
				exit;
			end;}
      perc := 0;
			if (MessageDlg('Сумма к сдаче агентом: ' + format('%.2f', [dsFindSdelka.DataSet.FieldByName('SD_SUM').AsFloat]) + '.' + #13#10 +
                     'Принять деньги?', mtConfirmation, [mbYes,mbNo], 0) = mrYes) then
			begin
				spKassaNal.ParamByName('AG_ID').AsInteger := dsFindSdelka.DataSet.FieldByName('AG_ID').AsInteger;
				spKassaNal.ParamByName('SD_ID').AsInteger := dsFindSdelka.DataSet.FieldByName('SD_ID').AsInteger;
				spKassaNal.ParamByName('SD_PERCENT').AsFloat := perc;
				spKassaNal.ExecProc;

				spAddSumForManager.ParamByName('M_ADD').AsFloat := dsFindSdelka.DataSet.FieldByName('SD_SUM').AsFloat;
				spAddSumForManager.ParamByName('M_COMMENT').AsString := 'Из кассы в нал (сделка №' +
                                                                dsFindSdelka.DataSet.FieldByName('SD_ID_COMPOUND').AsString +
                                                                '). Сдал деньги агент ' + dsFindSdelka.DataSet.FieldByName('AG_NAME').AsString;
				spAddSumForManager.ParamByName('M_TYPE').AsInteger  := TRANSACTION_AGENT_SDAL;
				spAddSumForManager.ParamByName('M_US_ID').AsInteger := frmMain.currentUser;
				spAddSumForManager.ExecProc;
        dsFindSdelka.DataSet.Refresh;
			end;
		end
		else
			MessageDlg('Эту сделку нельзя перевести из кассы в нал.', mtError, [mbOk], 0);
	end;

end;

procedure TfrmFindSdelka.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (frmMain.currentUserType = 2) and (byte(DBGrid1.DataSource.DataSet.FieldByName('SD_PAY_VER').AsInteger) = 1) then
  with  DBGrid1.Canvas do
	begin
		Brush.Color:=clGreen;
		Font.Color:=clWhite;
		FillRect(Rect);
		TextOut(Rect.Left+2,Rect.Top+2,Column.Field.Text);
	end;
end;

procedure TfrmFindSdelka.DBGrid1CellClick(Column: TColumn);
var l:string;
    i:integer;
begin
    for i := 0 to DBGrid1.Columns.Count - 1 do
    begin
         Column := DBGrid1.Columns[i];
         if Column.FieldName = 'CU_COMPANY_ID' then break;
    end;

    if Column.Field.AsString = '' then exit;

    l := 'http://rabotaplus.ua/company/id/' + Column.Field.AsString;
    if (GetKeyState(VK_LCONTROL) < 0) then
        ShellExecute(Handle, 'open', PAnsiChar(l), nil, nil, SW_SHOWNORMAL);
end;

end.
