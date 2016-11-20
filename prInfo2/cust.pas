unit cust;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, DB, Buttons, ActnList,
  RegExpr, custEdit, DBGridEh, Variants, globals, DBCtrlsEh, GridsEh,
  FMTBcd, SqlExpr, Menus, shellapi;

type
  TfrmCust = class(TFrame)
    pnlCustPhone: TPanel;
    Shape1: TShape;
    Label2: TLabel;
    btDeletePhone: TBitBtn;
    DBGrid3: TDBGridEh;
    btAddPhone: TBitBtn;
    pnlCust: TPanel;
    Shape3: TShape;
    Label3: TLabel;
	btDeleteCust: TBitBtn;
    DBGrid2: TDBGridEh;
    btAddCust: TBitBtn;
    custActions: TActionList;
    actFindCust: TAction;
    btEditCust: TBitBtn;
    btRefreshCust: TBitBtn;
    btDeletePhoneManager: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
	edSearch: TMaskEdit;
    btSearch: TBitBtn;
    Shape7: TShape;
    Shape5: TShape;
    Panel2: TPanel;
    Shape9: TShape;
    Panel3: TPanel;
    Shape11: TShape;
    cbBonusEnabled: TDBCheckBox;
    btSave: TBitBtn;
    BitBtn1: TBitBtn;
    btPrintAcc: TBitBtn;
    Label4: TLabel;
    Label6: TLabel;
    edNewCust: TDBEditEh;
    Label5: TLabel;
    edNewCustOKPO: TDBEditEh;
    edNewPhone: TMaskEdit;
    Shape8: TShape;
    chkAllAgents: TCheckBox;
    qCheckOKPO: TSQLQuery;
    popAddCust: TPopupMenu;
    nAddCust: TMenuItem;
    qCopyPhones: TSQLQuery;
    Label7: TLabel;
    txtCompanyID: TEdit;
    qCheckCompanyID: TSQLQuery;
    procedure edSearchKeyPress(Sender: TObject; var Key: Char);
    procedure btSaveClick(Sender: TObject);
    procedure btAddPhoneClick(Sender: TObject);
    procedure btDeletePhoneClick(Sender: TObject);
    procedure btDeleteCustClick(Sender: TObject);
    procedure btAddCustClick(Sender: TObject);
    procedure edNewCustKeyPress(Sender: TObject; var Key: Char);
    procedure edNewPhoneKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure actFindCustExecute(Sender: TObject);
    procedure btEditCustClick(Sender: TObject);
    procedure btRefreshCustClick(Sender: TObject);
    procedure btSearchClick(Sender: TObject);
    procedure btDeletePhoneManagerClick(Sender: TObject);
    procedure nAddCustClick(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumnEh);
  private
	{ Private declarations }
   fSelectAll: boolean;
   fCopyPhones: boolean;
    procedure setSelectAll(const Value: boolean);
    procedure CopyPhones(ag_src,cu_src,ag_dest,cu_dest:integer);
  public
    { Public declarations }
     property SelectAll:boolean read fSelectAll write setSelectAll;
  end;

implementation

uses dm, bonusLog, custForm, main;

{$R *.dfm}


// Нажат Enter в строке поиска - ищем
procedure TfrmCust.edSearchKeyPress(Sender: TObject; var Key: Char);
begin
	if (Key=#13) then
	begin
		btSearch.Click;
		edSearch.SelectAll;
	end;
end;

procedure TfrmCust.btSaveClick(Sender: TObject);
begin
	data.cdsCust.ApplyUpdates(0);
end;


// Добавляем клиенту телефон
procedure TfrmCust.btAddPhoneClick(Sender: TObject);
begin
	if (edNewPhone.Text<>'') then
		with data do
		begin
			cdsCustPhone.Append;
			cdsCustPhoneCP_NUMBER.Value:=edNewPhone.Text;
			cdsCustPhone.CheckBrowseMode;
            cdsCustPhone.ApplyUpdates(0);
			edNewPhone.SetFocus;
			edNewPhone.Clear;
		end;
end;


// Удаляем телефон
procedure TfrmCust.btDeletePhoneClick(Sender: TObject);
begin
	if ((Date+Time-data.cdsCustPhoneCP_ADDDATE.AsDateTime)<=1/24) then
	begin
		data.cdsCustPhone.Delete;
		data.cdsCustPhone.ApplyUpdates(0);
	end
	else
		MessageDlg('Для удаления этого телефона обратитесь к менеджеру.',mtConfirmation,[mbOk],0);
end;


// Удаляем клиента
procedure TfrmCust.btDeleteCustClick(Sender: TObject);
begin
  data.spDeleteCust.ParamByName('cu_id').AsInteger := data.cdsCustCU_ID.AsInteger;
  data.spDeleteCust.ParamByName('ag_id').AsInteger := data.cdsCustAG_ID.AsInteger;
  data.spDeleteCust.ExecProc;
  
  btRefreshCustClick(Sender);
end;

procedure TfrmCust.CopyPhones(ag_src,cu_src,ag_dest,cu_dest:integer);
begin
     qCopyPhones.Close;
     qCopyPhones.ParamByName('AG_ID').AsInteger := ag_dest;
     qCopyPhones.ParamByName('CU_ID').AsInteger := cu_dest;
     qCopyPhones.ParamByName('AG_SRC').AsInteger := ag_src;
     qCopyPhones.ParamByName('CU_SRC').AsInteger := cu_src;
     qCopyPhones.ExecSQL();
end;


// Добавляем клиента
procedure TfrmCust.btAddCustClick(Sender: TObject);
var
	re:TRegExpr;
	ag,cu:integer;
  ag_src, cu_src:integer;

begin
	if (edNewCust.Text<>'') then
  with data do
	begin
      ag_src := cdsCustAG_ID.AsInteger;
      cu_src := cdsCustCU_ID.AsInteger;

      cdsCust.Active := false;
			if (not cdsCust.Active) then
			begin
				//qryCust.SQL.Assign(frmMain.mmCustByNameSQL.Lines);
        data.prvCust.DataSet := data.qryCustByName;

				cdsCust.Params.ParamByName('FIND_TEXT').AsString:=edNewCust.Text;
				cdsCust.Open;
			  cdsCust.Insert;
			  cdsCustCU_NAME.Value := edNewCust.Text;
			// Проверим регулярным выражением, нормальный ли введен ОКПО:
			  if (edNewCustOKPO.Text <> '') then
			  begin
				  re:=TRegExpr.Create;
				  re.Expression:='^\d{8,12}$';
				  if (not re.Exec(edNewCustOKPO.Text)) then
				  begin
					  MessageDlg('ОКПО должен содержать только цифры'#10#13'и состоять не менее, чем из 8-ми'#10#13'и не более, чем из 12-ти символов.',mtError,[mbOk],0);
					  cdsCust.Cancel;
					  exit;
				  end;
				  cdsCustCU_OKPO.Value:=edNewCustOKPO.Text;

          qCheckOKPO.Close;
          qCheckOKPO.ParamByName('ag_id').AsInteger := cdsCustAG_ID.AsInteger;
          qCheckOKPO.ParamByName('okpo').AsString :=  cdsCustCU_OKPO.Value;
          qCheckOKPO.Open;

          if (frmMain.currentUserType = 3) and (qCheckOKPO.Fields[0].AsInteger > 0) then   // Менеджерам разрешено создавать компании с одним ИД, нужно для интернета.
          begin
              MessageDlg('Компания с таким ОКПО уже зарегистрирована.',mtError,[mbOk],0);
              cdsCust.Cancel;
					    exit;
          end;
			  end;

        if (txtCompanyID.Text <> '') then
        begin
            qCheckCompanyID.Close;
            qCheckCompanyID.ParamByName('ag_id').AsInteger := cdsCustAG_ID.AsInteger;
            qCheckCompanyID.ParamByName('com_id').AsInteger := strToInt(txtCompanyID.Text);
            qCheckCompanyID.Open;

            if qCheckCompanyID.Fields[0].AsInteger > 0 then
            begin
                MessageDlg('Компания с таким ИД уже зарегистрирована.',mtError,[mbOk],0);
                cdsCust.Cancel;
					      exit;
            end;

            data.cdsCustCU_COMPANY_ID.AsInteger := strToInt(txtCompanyID.Text);
        end;

			  cdsCust.CheckBrowseMode;
			  ag:=cdsCustAG_ID.AsInteger;
			  cu:=cdsCustCU_ID.AsInteger;
			  cdsCust.ApplyUpdates(0);

        if fCopyPhones then
            CopyPhones(ag_src, cu_src, ag, cu);

			// Откроем список всех клиентов агента с именами, такими же, как у нового
//			  qryCust.SQL.Assign(frmMain.mmCustByNameSQL.Lines);
        data.prvCust.DataSet := data.qryCustByName;
			  cdsCust.Params.ParamByName('FIND_TEXT').AsString:=edNewCust.Text;
			  cdsCust.Close;
			  cdsCust.Open;

			// Перейдём к только что добавленному клиенту
			  cdsCust.Locate('AG_ID;CU_ID',VarArrayOf([ag,cu]),[]);
			  edNewPhone.SetFocus;
			  edNewPhone.Clear;
      end;  
		end;
end;

procedure TfrmCust.nAddCustClick(Sender: TObject);
var o1, o2: string;
begin
    fCopyPhones := true;
    o1 := edNewCust.Text;
    o2 := edNewCustOKPO.Text;
    edNewCust.Text := trim(data.cdsCustCU_NAME.AsString);
    edNewCustOKPO.Text := trim(data.cdsCustCU_OKPO.AsString);
    btAddCustClick(Sender);
    edNewCustOKPO.Text := o2;
    edNewCust.Text := o1;
end;

procedure TfrmCust.edNewCustKeyPress(Sender: TObject; var Key: Char);
begin
	if (Key=#13) then
		btAddCust.Click;
end;

procedure TfrmCust.edNewPhoneKeyPress(Sender: TObject; var Key: Char);
begin
	if (Key=#13) then
		btAddPhone.Click;
end;


// Откроем окно работы с бонусами
procedure TfrmCust.BitBtn1Click(Sender: TObject);
begin
	frmBonusLog.ShowModalForCust(data.cdsCustAG_ID.Value,data.cdsCustCU_ID.Value);
end;


procedure TfrmCust.actFindCustExecute(Sender: TObject);
begin
	if (edSearch.CanFocus) then
		edSearch.SetFocus;
end;


// Откроем окно редактирования одного клиента, передадим ему
// наши датасорцы и тип пользователя
procedure TfrmCust.btEditCustClick(Sender: TObject);
begin
	frmCustEdit.editCust(data.dsCust,data.dsCustOne,data.cdsCustAG_ID.AsInteger,data.cdsCustCU_ID.AsInteger,int2user(frmMain.currentUserType));
  btRefreshCustClick(Sender)
end;

procedure TfrmCust.btRefreshCustClick(Sender: TObject);
begin
	data.cdsCust.Refresh;
end;


// Ищем клиента. Автоматои определим, в строке поиска - телефон или название.
procedure TfrmCust.btSearchClick(Sender: TObject);
var
	re:TRegExpr;
  list: TStringList;
  s: string;
  i:integer;
begin
  data.cdsCustPhone.Close;

	data.cdsCust.Close;

	re:=TRegExpr.Create;
	re.Expression := '^\d{7,7}$';

	if re.Exec(edSearch.Text) then
  begin
    list := TStringList.Create;
    re.Expression := '\-';
    re.Split(edSearch.Text, list);
    data.prvCust.DataSet := data.qryCustByPhone;
    data.cdsCust.FetchParams;

    if (frmMain.currentUserType in [2, 6, 5]) or chkAllAgents.Checked then
         data.cdsCust.Params.paramByName('SHOW_ALL').AsInteger := 1
    else
         data.cdsCust.Params.paramByName('SHOW_ALL').AsInteger := 0;

    s := '';
    for i := 0 to list.Count - 1 do s := s + trim(list.Strings[i]);
    data.cdsCust.Params.ParamByName('AG_ID').AsInteger := data.cdsAgentAG_ID.AsInteger;
    data.cdsCust.Params.ParamByName('FIND_TEXT').AsString := s;
    list.Free;
    try data.cdsCust.Open;  except end;

    exit;
  end;

  re.Expression := '^\d{8,12}$';

  if re.Exec(edSearch.Text) then
  begin
      data.prvCust.DataSet := data.qryCustByOKPO;
      data.cdsCust.FetchParams;

      if (frmMain.currentUserType in [2, 6, 5]) or chkAllAgents.Checked then
           data.cdsCust.Params.paramByName('SHOW_ALL').AsInteger := 1
      else
         data.cdsCust.Params.paramByName('SHOW_ALL').AsInteger := 0;

      data.cdsCust.Params.ParamByName('AG_ID').AsInteger := data.cdsAgentAG_ID.AsInteger;
      data.cdsCust.Params.ParamByName('FIND_TEXT').AsString := edSearch.Text;
      try data.cdsCust.Open;  except end;

      exit;
  end;

  data.prvCust.DataSet := data.qryCustByName;
  data.cdsCust.FetchParams;

  data.cdsCust.Params.ParamByName('AG_ID').AsInteger := data.cdsAgentAG_ID.AsInteger;
	data.cdsCust.Params.ParamByName('FIND_TEXT').AsString := edSearch.Text;

  if (frmMain.currentUserType in [2, 6, 5]) or chkAllAgents.Checked then
      data.cdsCust.Params.paramByName('SHOW_ALL').AsInteger := 1
  else
     data.cdsCust.Params.paramByName('SHOW_ALL').AsInteger := 0;

  try data.cdsCust.Open;  except end;

end;

procedure TfrmCust.btDeletePhoneManagerClick(Sender: TObject);
begin
	data.cdsCustPhone.Delete;
	data.cdsCustPhone.ApplyUpdates(0);
end;

procedure TfrmCust.setSelectAll(const Value: boolean);
begin
  fSelectAll := Value;
  chkAllAgents.Visible := Value;
end;

procedure TfrmCust.DBGrid2CellClick(Column: TColumnEh);
var l:string;
    i:integer;
begin
    for i := 0 to DBGrid2.Columns.Count - 1 do
    begin
         Column := DBGrid2.Columns[i];
         if Column.FieldName = 'CU_COMPANY_ID' then break;
    end;

    if Column.Field.AsString = '' then exit;

    l := 'http://rabotaplus.ua/company/id/' + Column.Field.AsString;
    if (GetKeyState(VK_LCONTROL) < 0) then
        ShellExecute(Handle, 'open', PAnsiChar(l), nil, nil, SW_SHOWNORMAL);
end;

end.
