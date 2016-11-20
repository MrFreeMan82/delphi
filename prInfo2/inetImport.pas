unit inetImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, HttpXmlDataSet, StdCtrls, Buttons, ExtCtrls, Mask,
  DBCtrlsEh, DBLookupEh, Grids, DBGridEh, FMTBcd, SqlExpr, SimpleDS,
  GridsEh;

type
  TfrmInetImport = class(TForm)
    cdsInetImport: THttpXMLDataSet;
    dsInetImport: TDataSource;
    pnlAgent: TPanel;
    Shape6: TShape;
    btCancelAg: TBitBtn;
    btDone: TBitBtn;
    btMore: TBitBtn;
    cbRubrika: TDBLookupComboboxEh;
    edCount: TDBNumberEditEh;
    Label1: TLabel;
	Label2: TLabel;
    grInetVac: TDBGridEh;
    qryInetVac: TSimpleDataSet;
    qryInetVacRB_ID: TIntegerField;
    qryInetVacOB_TEXT: TStringField;
    qryInetVacOI_ID: TIntegerField;
    procedure btMoreClick(Sender: TObject);
	procedure cdsInetImportGetMEMOText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btDoneClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInetImport: TfrmInetImport;

implementation

uses dmPubl, dm;

{$R *.dfm}

procedure TfrmInetImport.btMoreClick(Sender: TObject);
begin
	if (cdsInetImport.Active) then
		cdsInetImport.Close();

	cdsInetImport.ProxyServer	:= data.tblParamsPM_PROXY_SERVER.AsString;
	cdsInetImport.ProxyPort		:= data.tblParamsPM_PROXY_PORT.AsInteger;
	cdsInetImport.ProxyUsername	:= data.tblParamsPM_PROXY_USERNAME.AsString;
	cdsInetImport.ProxyPassword	:= data.tblParamsPM_PROXY_PASSWORD.AsString;

	cdsInetImport.URL := data.tblParamsPM_VACANCY_IMPORT_URL.AsString + '?rubric=' + IntToStr(cbRubrika.KeyValue) + '&count=' + IntToStr(edCount.Value);
	cdsInetImport.Open();
	cdsInetImport.FieldByName('VAC_TEXT').OnGetText := cdsInetImportGetMEMOText;
end;

procedure TfrmInetImport.cdsInetImportGetMEMOText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	Text := Sender.AsString;
end;

procedure TfrmInetImport.btDoneClick(Sender: TObject);
begin
	if (grInetVac.SelectedRows.Count > 0) then
	begin
		if (not qryInetVac.Active) then
			qryInetVac.Open();
		cdsInetImport.First();
		while (not cdsInetImport.Eof) do
		begin
			if (grInetVac.SelectedRows.CurrentRowSelected) then
			begin
				qryInetVac.Insert();
				qryInetVacOI_ID.AsInteger := cdsInetImport.FieldByName('VAC_ID').AsInteger;
				qryInetVacRB_ID.AsInteger := cdsInetImport.FieldByName('RUBR_ID').AsInteger;
				qryInetVacOB_TEXT.AsString := cdsInetImport.FieldByName('VAC_NAME').AsString + '{S!}' + #10#13 + cdsInetImport.FieldByName('VAC_TEXT').AsString;

				qryInetVac.CheckBrowseMode();
			end;

			cdsInetImport.Next();
		end;
	end;

	qryInetVac.ApplyUpdates(0);
end;

end.
