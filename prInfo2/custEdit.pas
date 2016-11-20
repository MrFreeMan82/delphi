unit custEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, dm, DBCtrls, Mask, DB, RegExpr,
  DBClient, DBCtrlsEh, CustUnique, DBLookupEh, globals, DBGridEh;

type
  TfrmCustEdit = class(TForm)
    Label1: TLabel;
    edName: TDBEditEh;
    btDone: TBitBtn;
    btCancel: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    mmInfo: TDBRichEdit;
    btCheckSpelling: TBitBtn;
    edOKPO: TDBEditEh;
    Bevel2: TBevel;
    Panel1: TPanel;
    cbChooseCustUnique: TDBLookupComboboxEh;
    Label7: TLabel;
    Panel2: TPanel;
    btFindCustUniques: TBitBtn;
    CustUnique: TfrmCustUnique;
    Label4: TLabel;
    edID: TDBEditEh;
    Label5: TLabel;
    Label6: TLabel;
    dbPassw: TDBEditEh;
    dbEmail: TDBEdit;
    procedure edOKPOExit(Sender: TObject);
	procedure btFindCustUniquesClick(Sender: TObject);
	procedure cbChooseCustUniqueChange(Sender: TObject);
	procedure updateCustUniqueList;
  private
	fAgentId,fCustId:integer;
	fUser:TUser;
	fdsCust,fdsCustOne:TDataSource;
  public
	function editCust(dsCust,dsCustOne:TDataSource;agid,cuid:integer;user:TUser):boolean;
  end;

var
  frmCustEdit: TfrmCustEdit;

implementation

uses main, accessRights, spellChecker;

{$R *.dfm}


// Показываем информацию о клиенте.
// Параметры: ДатаСорц со списком клиентов, ДатаСорц с этим конкретным клиентом,
// коды агента и клиента, которого показываем, тип пользователя.
function TfrmCustEdit.editCust(dscust,dsCustOne:TDataSource;agid, cuid: integer; user: TUser): boolean;
begin
    Result:=true;

	fdsCust:=dsCust;
	fdsCustOne:=dsCustOne;

	fAgentId:=agid;
	fCustId:=cuid;
	fUser:=user;

	edName.DataSource:=fdsCustOne;
	edOKPO.DataSource:=fdsCustOne;
	mmInfo.DataSource:=fdsCustOne;
  edID.DataSource := fdsCustOne;
  dbEmail.DataSource := fdsCustOne;
  dbPassw.DataSource := fdsCustOne;

	cbChooseCustUnique.DataSource:=fdsCustOne;

	if (fdsCustOne.DataSet.Active) then
		fdsCustOne.DataSet.Close;
	TClientDataSet(fdsCustOne.DataSet).Params.ParamByName('AG_ID').AsInteger:=fAgentId;
	TClientDataSet(fdsCustOne.DataSet).Params.ParamByName('CU_ID').AsInteger:=fCustId;
	if (not fdsCustOne.DataSet.Active) then
		fdsCustOne.DataSet.Open
	else
		fdsCustOne.DataSet.Refresh;

    TAccessRightsManager.SetWindowAccessState(self.fUser,self);

	// Обновим список "уникальных" клиентов с таким ОКПО, который показывается.
	updateCustUniqueList;
	// Покажем уникального клиента, связанного с этим клиентом
	CustUnique.setCustUnique(fdsCustOne.DataSet.FieldByName('CUQ_REG_ID').AsInteger,not frmMain.currentUserCanEditCustUnique);

	if ((ShowModal=mrOk)and(edName.Text<>'')) then
	begin
		fdsCustOne.DataSet.CheckBrowseMode;
		TClientDataSet(fdsCustOne.DataSet).ApplyUpdates(0);
		fdsCustOne.DataSet.Refresh;
	end;
end;


// Проверим, чтобы в ОКПО всё было, как положено...
procedure TfrmCustEdit.edOKPOExit(Sender: TObject);
var
	re:TRegExpr;
begin
	if (edOKPO.Text<>'') then
	begin
		re:=TRegExpr.Create;
		re.Expression:='^\d{8,12}\s*$';
		if (not re.Exec(edOKPO.Text)) then
		begin
			MessageDlg('Код ЄДРПОУ должен содержать только цифры'#10#13'и состоять не менее, чем из 8-ми'#10#13'и не более, чем из 12-ти символов.',mtError,[mbOk],0);
			edOKPO.SetFocus;
		end;
	end;
end;

procedure TfrmCustEdit.btFindCustUniquesClick(Sender: TObject);
begin
	if (edOKPO.Text<>'') then
		updateCustUniqueList
	else
		MessageDlg('Должен быть введен код ЄДРПОУ',mtError,[mbOk],0);
end;


// Пользователь выбрал уникального клиента - покажем его.
procedure TfrmCustEdit.cbChooseCustUniqueChange(Sender: TObject);
begin
	if (cbChooseCustUnique.KeyValue<>Null) then
		CustUnique.setCustUnique(cbChooseCustUnique.KeyValue,not frmMain.currentUserCanEditCustUnique);
end;

procedure TfrmCustEdit.updateCustUniqueList;
begin
	if (trim(edOKPO.Text)<>'') then
	begin
		data.cdsCustUnique.Params.ParamByName('CUQ_OKPO').AsString:=edOKPO.Text;
		data.cdsCustUnique.Close;
		data.cdsCustUnique.Open;
	end
	else
		data.cdsCustUnique.Close;
end;

end.
