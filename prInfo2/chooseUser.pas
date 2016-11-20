unit chooseUser;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, DB, Grids, DBGrids, DBClient,
  SimpleDS, FMTBcd, SqlExpr, Provider, globals;

type
  TfrmChooseUser = class(TForm)
    Panel1: TPanel;
    Label31: TLabel;
    Label1: TLabel;
    Panel33: TPanel;
    Shape14: TShape;
    Shape13: TShape;
    Button3: TButton;
    Button1: TButton;
	dsUsr: TDataSource;
	dsUsrRights: TDataSource;
	grUsr: TDBGrid;
	DBGrid2: TDBGrid;
    btExit: TButton;
	imgChecked: TImage;
    imgUnchecked: TImage;
	Label2: TLabel;
    qryUsr: TSQLQuery;
	qryUsrUS_ID: TIntegerField;
    qryUsrUS_NAME: TStringField;
	qryUsrUS_DISK_ID: TStringField;
	qryUsrUS_PASSWORD: TStringField;
	qryUsrUS_TYPE: TIntegerField;
    qryUsrUS_OFFICE_NAME: TStringField;
	qryUsrUS_IS_REMOTE: TSmallintField;
    dsUsrLink: TDataSource;
	qryUsrRights: TSQLQuery;
    qryUsrRightsUS_ID: TIntegerField;
	qryUsrRightsAG_ID: TIntegerField;
	qryUsrRightsAG_NAME: TStringField;
	prvUsr: TDataSetProvider;
	cdsUsr: TClientDataSet;
    cdsUsrRights: TClientDataSet;
    cdsUsrUS_ID: TIntegerField;
    cdsUsrUS_NAME: TStringField;
	cdsUsrUS_DISK_ID: TStringField;
	cdsUsrUS_PASSWORD: TStringField;
    cdsUsrUS_TYPE: TIntegerField;
    cdsUsrUS_OFFICE_NAME: TStringField;
    cdsUsrUS_IS_REMOTE: TSmallintField;
    cdsUsrqryUsrRights: TDataSetField;
	cdsUsrRightsUS_ID: TIntegerField;
    cdsUsrRightsAG_ID: TIntegerField;
    cdsUsrRightsAG_NAME: TStringField;
    cdsUsrUS_NAME_LK: TStringField;
    DBText1: TDBText;
    cdsUsrUS_ACCOUNT: TStringField;
    qryUsrUS_ACCOUNT: TStringField;
    procedure FormCreate(Sender: TObject);
	procedure grUsrKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure btExitClick(Sender: TObject);
    procedure grUsrDrawColumnCell(Sender: TObject; const Rect: TRect;
	  DataCol: Integer; Column: TColumn; State: TGridDrawState);
	procedure cdsUsrAfterScroll(DataSet: TDataSet);
  private
  public
	function checkDiskID(id: cardinal):boolean;
	function getDiskID: cardinal;
  function selectUserAndAgent(var usid,agid:integer):boolean;
  function selectUserAndAgentNew(var usid,agid:integer): boolean;
//	function ChooseUser(): boolean;
  end;

var
  frmChooseUser: TfrmChooseUser;
  isNew:boolean;

implementation

uses dm, main, RegExpr;

{$R *.DFM}


// Проверяет серийный номер вставленной дискеты, и возвращает
// "true", если он соответствует параметру id, или вставленаня
// дискета - root'овская.
function TfrmChooseUser.checkDiskID(id: cardinal):boolean;
var
	currId:cardinal;
begin
try
	currId:=0;
	if (data.tblParamsPM_DO_CHECK_DISK.Value<>0) then
	begin
		currId:=getDiskId();
		if ((id=currId)or(currId = cardinal(data.tblParamsPM_ROOT_DISK_ID.AsInteger))) then
			Result:=true
		else
			Result:=false;
	end
	else
		Result:=true;
//	if (Now > StrToDate('24.06.2004')) then
//		Application.Terminate;

	if (integer(currId)=data.tblParamsPM_ROOT_DISK_ID.AsInteger) then
		frmMain.isRoot:=true
	else
		frmMain.isRoot:=false;
except
    result := false;
end

//	Result := true;
end;


// Возвращает серийный номер вставленной дискеты
function TfrmChooseUser.getDiskID: cardinal;
var
	sRoot:String;
	dD:DWORD;
	dVolSerial:DWORD;
begin
	sRoot:='a:\';
	if (not GetVolumeInformation(PChar(sRoot), nil, 0, @dVolSerial, dD, dD, nil, 0)) then
	begin
		MessageDlg('Ошибка чтения ключевого диска.'#10#13'Возможно, диск поврежден.'#10#13'Попробуйте вставить другой диск.',mtError,[mbOk],0);
		dVolSerial := 0;
	end;
	Result:=dVolSerial;
end;

function TfrmChooseUser.selectUserAndAgentNew(var usid, agid: integer): boolean;
var i:integer;
    mr: TModalResult;
    rootAccount, account:string;
    doCheck: boolean;
    reg:TRegExpr;
    accounts: TStringList;
begin
     result := false;
     account := userAccount();
     rootAccount := data.tblParamsPM_ROOT_DISK_ID.AsString;

     if rootAccount = account then
     begin
           doCheck := false;
           frmMain.isRoot := true;
     end
     else begin
          doCheck := data.tblParamsPM_DO_CHECK_DISK.AsInteger = 1;
          frmMain.isRoot := false;
     end;

     if not cdsUsr.Active then cdsUsr.Open;
     if not cdsUsrRights.Active then cdsUsrRights.Open;

   	 if (usid = 0) then cdsUsr.First else cdsUsr.Locate('US_ID', usid, []);
     cdsUsrRights.Locate('AG_ID', agid, []);

     accounts := TStringList.Create;
     reg := TRegExpr.Create;
     reg.Expression := ';';

     mr := showModal();
     reg.Split(cdsUsrUS_ACCOUNT.AsString, accounts);

     while not ((mr = mrCancel) or (mr = mrAbort) or (result = true)) do
     begin
          usid := cdsUsrUS_ID.AsInteger;
          agid := cdsUsrRightsAG_ID.AsInteger;

          if doCheck then
          begin
               for i := 0 to accounts.Count - 1 do
               begin
                    result := (accounts[i] = account);

                    if result then
                    begin
                        if ((cdsUsrRights.IsEmpty) and (cdsUsrUS_TYPE.Value = PRG_USR_AGENT)) then
                        begin
                              result := false;
                              messageBox(handle, 'Этот пользователь не имеет права доступа ни к одному агенту.', 'Ошибка', MB_OK or MB_ICONERROR);
                        end;
                        break;
                    end
                    else if (i = accounts.Count - 1) then
                    begin
                        messageBox(Handle, 'Ошибка авторизации!', 'Ошибка', MB_OK or MB_ICONERROR);
                    end;
               end;
          end
          else result := true;

          if not result then
          begin
               mr := showModal();
               accounts.Clear;
               reg.Split(cdsUsrUS_ACCOUNT.AsString, accounts);
          end
          else begin
               isNew := false;

               data.spUserLoginLog.Params.ParamByName('US_ID').AsInteger:=usid;
					     data.spUserLoginLog.Params.ParamByName('AG_ID').AsInteger:=agid;
					     data.spUserLoginLog.Params.ParamByName('HOST').AsString:=getLocalHostName();
					     data.spUserLoginLog.ExecProc;
          end;
     end;

     if isNew and (mr = mrCancel) then btExitClick(self);
     freeAndNil(accounts);
     freeAndNil(reg);
end;

// Выбор пользователя/агента с проверкой ключевого диска и проч.
// Параметры - текущие коды пользователя/агента

function TfrmChooseUser.selectUserAndAgent(var usid,agid:integer):boolean;
var
	ck:boolean;
  id:double;
//	mr:TModalResult;

begin
  //cdsUsr.Close;
  if not cdsUsr.Active then cdsUsr.Open;

  //cdsUsrRights.Close;
  if not cdsUsrRights.Active then cdsUsrRights.Open;

	if (usid=0) then
		cdsUsr.First
	else
		cdsUsr.Locate('US_ID',usid,[]);
	cdsUsrRights.Locate('AG_ID',agid,[]);

	Result:=false;
  id := -1;
  ck := false;

	// Будем крутить здесь, пока /таки не будут выбран пользователь
	// со вставленной дискетой, или выбиральщик не выйдет из диалога
	while (not Application.Terminated) and (((Result=false) and (ShowModal() = mrOk)) or (isNew)) do
	begin
  //id := -1;

		if (usid<>cdsUsrUS_ID.AsInteger) then
		begin
			if (not cdsUsrUS_DISK_ID.IsNull) then
      begin
        try
            id := cdsUsrUS_DISK_ID.asFloat;
        except
            id := -1;
        end;
				ck:=checkDiskID(abs(trunc(id)))
      end
			else begin
        MessageDlg('Пользователю не назначена ключевая дискета!', mtError, [mbOK], 0);
        continue;
      end;
//			ck:=true;
			if (ck)or
			   ((MessageDlg('Вставьте ключевую дискету пользователя '+
							cdsUsrUS_NAME.AsString+
							' и нажмите Ok',
							mtConfirmation,
							[mbOk,mbCancel],
							0)=mrOk)and
				(checkDiskID(abs(trunc(id))))) then
			begin

				usid:=cdsUsrUS_ID.AsInteger;
				agid:=cdsUsrRightsAG_ID.AsInteger;
				Result:=true;
				isNew:=false;

				// запишем в лог, какой пользователь и откуда загрузился.
				// Но учтём, что процедура для лога может и отсутствовать...
				try
					data.spUserLoginLog.Params.ParamByName('US_ID').AsInteger:=usid;
					data.spUserLoginLog.Params.ParamByName('AG_ID').AsInteger:=agid;
					data.spUserLoginLog.Params.ParamByName('HOST').AsString:=getLocalHostName();
					data.spUserLoginLog.ExecProc;
				except
				end;
			end
			else
				MessageDlg('Ошибка изменения активного пользователя.'#10#13'Возможно, вставлена неправильная ключевая дискета или она повреждена.',mtError,[mbOk],0);
			if ((cdsUsrRights.IsEmpty)and(cdsUsrUS_TYPE.Value=PRG_USR_AGENT)) then
			begin
				Result:=false;
				MessageDlg('Этот пользователь не имеет права доступа ни к одному агенту.',mtError,[mbOk],0);
			end;
		end
		else
			begin
				agid:=cdsUsrRightsAG_ID.AsInteger;//cbAgent.KeyValue;
				Result:=true;
			end;
	end;
end;

procedure TfrmChooseUser.FormCreate(Sender: TObject);
begin
	// Типа - только что запустили программу, и пользователя ещё не выбирали
	isNew:=true;
end;

procedure TfrmChooseUser.grUsrKeyPress(Sender: TObject; var Key: Char);
begin
	// Найдём пользователя в списке по первой нажатой букве
	cdsUsr.Locate('US_NAME',Key,[loPartialKey,loCaseInsensitive]);
end;

procedure TfrmChooseUser.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
	// Найдём в списке агента по первой нажатой букве
	cdsUsrRights.Locate('AG_NAME',Key,[loPartialKey,loCaseInsensitive]);
end;

procedure TfrmChooseUser.btExitClick(Sender: TObject);
begin
	Application.Terminate;
end;


// Рисуем "флажки" в поле "Левый берег".
// Надо бы сделать, как и везде, DBGridEh, чтобы флажки сами
// рисовались, но пока влом.
procedure TfrmChooseUser.grUsrDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
	if (Column.Field.FieldName='US_IS_REMOTE') then
	begin
		if (Column.Field.Value=1) then
		begin
			// есть флажок
			grUsr.Canvas.FillRect(Rect);
			grUsr.Canvas.Draw(Rect.Left+((Rect.Right-Rect.Left-11) div 2),Rect.Top+((Rect.Bottom-Rect.Top-11) div 2),imgChecked.Picture.Bitmap)
		end
		else
		begin
			// нет флажка
			grUsr.Canvas.FillRect(Rect);
			grUsr.Canvas.Draw(Rect.Left+((Rect.Right-Rect.Left-11) div 2),Rect.Top+((Rect.Bottom-Rect.Top-11) div 2),imgUnchecked.Picture.Bitmap);
		end;
	end;
end;


// Дёрнем с сервера список агентов для выбранного пользователя
procedure TfrmChooseUser.cdsUsrAfterScroll(DataSet: TDataSet);
begin
	cdsUsr.FetchDetails;
end;

end.
