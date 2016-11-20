unit editPodacha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, SqlTimSt, DBCtrls, Mask, DB,
  DBClient, DateUtils, FMTBcd, SqlExpr, DBCtrlsEh;

type
  TfrmEditPodacha = class(TForm)
    edIssue: TDBEditEh;
    edYear: TDBEditEh;
	Label1: TLabel;
	Label2: TLabel;
	btMore: TBitBtn;
	btDone: TBitBtn;
	btCancel: TBitBtn;
    cbFreeOfCharge: TDBCheckBoxEh;
    spPodachaInsert: TSQLStoredProc;
    Shape1: TShape;
	procedure btMoreClick(Sender: TObject);
	procedure btDoneClick(Sender: TObject);
	procedure btCancelClick(Sender: TObject);
    procedure edIssueEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
	PodachaDataSource:TDataSource;
	SdelkaDataSource:TDataSource;
	IsNew:boolean;
	SdelkaHasObjavs:boolean;
	function Save(): boolean;
    procedure Cancel();
	procedure Load();
	procedure Reset();
	procedure setDataSource(ds, sdelkaDS: TDataSource);
  public
	function Edit(ds, sdelkaDS: TDataSource): TModalResult;
	function Add(ds, sdelkaDS: TDataSource; sdelkaHasObjavs: boolean): TModalResult;
  end;

var
  frmEditPodacha: TfrmEditPodacha;

implementation

uses dm, globals;

{$R *.dfm}


// Сохраняем данные формы в БД
function TfrmEditPodacha.Save(): boolean;
var
	curriss: integer;

	year:integer;
	issue:String;
	isFree:integer;
begin
	Result := false;
	year   := StrToInt(edYear.Text);
	issue  := trim(edIssue.Text);
	if (cbFreeOfCharge.Checked) then
		isFree := 1
	else
		isFree := 0;

	// Определим номер выхода в зависимости от указанных
	// названия номера и года выхода
	data.spGetIssueId.ParamByName('GZ_ID').AsInteger   := SdelkaDataSource.DataSet.FieldByName('GZ_ID').Value;
	data.spGetIssueId.ParamByName('IS_NAME').Value     := issue;
	data.spGetIssueId.ParamByName('IS_YEAR').AsInteger := year;
	data.spGetIssueId.ExecProc;

	if (data.spGetIssueId.ParamByName('IS_ID').AsInteger >= 0) then
	begin
		curriss := data.getCurrentIssue(SdelkaDataSource.DataSet.FieldByName('GZ_ID').Value);

{		if (SdelkaDataSource.DataSet.FieldByName('GZ_ID').Value = GZ_PR) then
			curriss := data.tblParamsPM_CURRENT_ISSUE_PR.Value
		else if (SdelkaDataSource.DataSet.FieldByName('GZ_ID').Value = GZ_NS) then
			curriss := data.tblParamsPM_CURRENT_ISSUE_NS.Value
		else
			curriss := data.tblParamsPM_CURRENT_ISSUE_SR.Value;
}
		if (    (data.spGetIssueId.ParamByName('IS_ID').AsInteger < curriss)
			and (data.spGetIssueId.ParamByName('IS_ID').AsInteger <> ZAPAS_PR)
			and (data.spGetIssueId.ParamByName('IS_ID').AsInteger <> ZAPAS_NS)
			and (data.spGetIssueId.ParamByName('IS_ID').AsInteger <> ZAPAS_ST))
      and (issue <> '0') then
			MessageDlg('Нельзя добавлять подачи в номера, которые уже вышли.', mtError, [mbOk], 0)
		else
		begin
			if (IsNew) then
				PodachaDataSource.DataSet.Append
			else
				PodachaDataSource.DataSet.Edit;

			if (not SdelkaHasObjavs) then
			begin
				PodachaDataSource.DataSet.FieldByName('GZ_ID').AsInteger           := SdelkaDataSource.DataSet.FieldByName('GZ_ID').AsInteger;
				PodachaDataSource.DataSet.FieldByName('AG_ID').AsInteger           := SdelkaDataSource.DataSet.FieldByName('AG_ID').AsInteger;
				PodachaDataSource.DataSet.FieldByName('SD_ID').AsInteger           := SdelkaDataSource.DataSet.FieldByName('SD_ID').AsInteger;
				PodachaDataSource.DataSet.FieldByName('IS_ID').AsInteger           := data.spGetIssueId.ParamByName('IS_ID').AsInteger;
				PodachaDataSource.DataSet.FieldByName('IS_NAME_COMPOSED').AsString := data.spGetIssueId.ParamByName('IS_NAME_COMPOSED').AsString;//DayOfWeek2Str(DayOfweek(###)) + ', ' + issue + '/' + IntToStr(year);
				PodachaDataSource.DataSet.FieldByName('PD_FREE_OF_CHARGE').Value   := isFree;
				PodachaDataSource.DataSet.Post;
			end
			else
			begin
				// если у сделки уже есть объявления, то при добавлении подачи
				// воспользуемся ХП, которая скопирует в эту подачу объявления
				spPodachaInsert.ParamByName('AG_ID').AsInteger             := SdelkaDataSource.DataSet.FieldByName('AG_ID').AsInteger;
				spPodachaInsert.ParamByName('SD_ID').AsInteger			   := SdelkaDataSource.DataSet.FieldByName('SD_ID').AsInteger;
				spPodachaInsert.ParamByName('GZ_ID').AsInteger             := SdelkaDataSource.DataSet.FieldByName('GZ_ID').AsInteger;
				spPodachaInsert.ParamByName('IS_ID').AsInteger             := data.spGetIssueId.ParamByName('IS_ID').AsInteger;
				spPodachaInsert.ParamByName('PD_FREE_OF_CHARGE').AsInteger := isFree;
				spPodachaInsert.ExecProc;
				SdelkaDataSource.DataSet.Close;
				SdelkaDataSource.DataSet.Open;
			end;

			Result := true;
		end;
	end
	else
		MessageDlg('Номер не найден!', mtError, [mbOk], 0);
end;


// Заполняем форму данными из БД
procedure TfrmEditPodacha.Load();
begin
	edIssue.Text := PodachaDataSource.DataSet.FieldByName('IS_NAME').AsString;
	edYear.Text  := IntToStr(YearOf(PodachaDataSource.DataSet.FieldByName('IS_DATE').AsDateTime));
	if (PodachaDataSource.DataSet.FieldByName('PD_FREE_OF_CHARGE').AsInteger = 0) then
		cbFreeOfCharge.Checked := false
	else
		cbFreeOfCharge.Checked := true;
end;


// Очищает форму
procedure TfrmEditPodacha.Reset();
begin
	edIssue.Clear;
	edYear.Clear;
	cbFreeOfCharge.Checked := false;
end;


procedure TfrmEditPodacha.setDataSource(ds, sdelkaDS: TDataSource);
begin
	PodachaDataSource := ds;
	SdelkaDataSource  := sdelkaDS;
end;


function TfrmEditPodacha.Edit(ds, sdelkaDS: TDataSource): TModalResult;
begin
	setDataSource(ds, sdelkaDS);
	Load();
  self.SdelkaHasObjavs := false;
	IsNew          := false;
    btMore.Enabled := false;

	Result         := ShowModal;

    btMore.Enabled := true;
end;


function TfrmEditPodacha.Add(ds, sdelkaDS: TDataSource; sdelkaHasObjavs: boolean): TModalResult;
begin
	setDataSource(ds, sdelkaDS);
  cbFreeOfCharge.Checked := false;
 //	Reset();

    self.SdelkaHasObjavs := sdelkaHasObjavs;
	IsNew                := true;

	Result               := ShowModal;
end;


// "Ещё": добавляет ещё одну подачу к той же сделке (в следующий
// номер после того, в который подача была добавлена только что)
procedure TfrmEditPodacha.btMoreClick(Sender: TObject);
var
	n:integer;
begin
	if (Save()) then
	begin
		n := StrToInt(edIssue.Text);
		PodachaDataSource.DataSet.CheckBrowseMode;
		IsNew := true;
		Reset();
		edIssue.Text := IntToStr(n + 1);
	end;
	edIssue.SetFocus;
	edIssueEnter(edIssue);
end;


procedure TfrmEditPodacha.btDoneClick(Sender: TObject);
begin
	Save();
end;


procedure TfrmEditPodacha.btCancelClick(Sender: TObject);
begin
	Cancel();
end;


// Поставим текущий год
procedure TfrmEditPodacha.edIssueEnter(Sender: TObject);
begin
	if (edYear.Text = '') then
		edYear.Text := IntToStr(CurrentYear);
end;


// Форму вывели - перейдём к нужному полю редактирования
procedure TfrmEditPodacha.FormShow(Sender: TObject);
begin
	edIssue.SetFocus;
	edIssueEnter(edIssue);
end;


// Если нажали "ESC" - закроем окно.
procedure TfrmEditPodacha.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if (Key = #27) then Close;
end;

procedure TfrmEditPodacha.Cancel;
begin
	PodachaDataSource.DataSet.Cancel;
	(PodachaDataSource.DataSet as TClientDataSet).CancelUpdates;
end;

end.
