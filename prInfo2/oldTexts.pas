unit oldTexts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Grids, DBGrids, DB, Buttons,
  FMTBcd, DBClient, Provider, SqlExpr;

type
  TfrmOldTexts = class(TForm)
    DBGrid1: TDBGrid;
    qryOldTexts: TSQLQuery;
    cbIssue: TDBLookupComboBox;
    rbIssuesPR: TRadioButton;
	rbIssuesNS: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsOldTexts: TDataSource;
    DBMemo1: TDBMemo;
    BitBtn3: TBitBtn;
    prvOldTexts: TDataSetProvider;
    cdsOldTexts: TClientDataSet;
    qryOldTextsOB_TEXT: TStringField;
    cdsOldTextsOB_TEXT: TStringField;
    qryOldTextsRB_ID: TIntegerField;
    cdsOldTextsRB_ID: TIntegerField;
    cdsOldTextsRB_NAME_LK: TStringField;
    qryOldTextsFM_ID: TSmallintField;
    cdsOldTextsFM_ID: TSmallintField;
    cdsOldTextsFM_NAME_LK: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
	{ Private declarations }
  public
		function getOldText(agid,sdid:integer;var resText:String):boolean;
  end;

var
  frmOldTexts: TfrmOldTexts;

implementation

uses dm;

{$R *.dfm}


// Показываем на выбор список старых текстов объявлений того же
// клиента, результат помещаем в resText
function TfrmOldTexts.getOldText(agid,sdid:integer;var resText:String):boolean;
begin
	Result:=false;
	resText:='';

	cdsOldTexts.Params.ParamByName('AG_ID').AsInteger:=agid;
	cdsOldTexts.Params.ParamByName('SD_ID').AsInteger:=sdid;

	if (ShowModal=mrOk) then
	begin
		Result:=true;
		resText:=cdsOldTextsOB_TEXT.AsString;
	end;
end;

procedure TfrmOldTexts.BitBtn1Click(Sender: TObject);
begin
	if (rbIssuesPR.Checked) then
		cbIssue.ListSource:=data.dsIssuePR
	else
		cbIssue.ListSource:=data.dsIssueNS;
end;

procedure TfrmOldTexts.BitBtn2Click(Sender: TObject);
begin
	cdsOldTexts.Params.ParamByName('IS_ID').AsInteger:=cbIssue.KeyValue;
    if (not cdsOldTexts.Active) then
    	cdsOldTexts.Open
    else
    	cdsOldTexts.Refresh;
end;

procedure TfrmOldTexts.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if (Key=#27) then
	begin
		ModalResult:=mrCancel;
	end;
end;

end.
