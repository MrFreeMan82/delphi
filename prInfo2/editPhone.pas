unit editPhone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, DB, DBClient;

type
  TfrmEditPhone = class(TForm)
    Label1: TLabel;
    btMore: TBitBtn;
    btDone: TBitBtn;
    btCancel: TBitBtn;
    edPhone: TDBEdit;
	procedure btMoreClick(Sender: TObject);
	procedure btDoneClick(Sender: TObject);
	procedure btCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
	fDataSource:TDataSource;
  public
	procedure setDataSource(ds:TDataSource);
	function editModal(ds:TDataSource):TModalResult;
	function addModal(ds:TDataSource):TModalResult;
  end;

var
  frmEditPhone: TfrmEditPhone;

implementation

uses dm;

{$R *.dfm}

// Устанавливает датасорц для единственного Эдита
procedure TfrmEditPhone.setDataSource(ds:TDataSource);
begin
	fDataSource:=ds;
	edPhone.DataSource:=ds;
end;

function TfrmEditPhone.editModal(ds:TDataSource):TModalResult;
begin
	setDataSource(ds);
	Result:=ShowModal;
end;


// Вызывает модальный диалог для добавления телефона
function TfrmEditPhone.addModal(ds:TDataSource):TModalResult;
begin
	setDataSource(ds);
	fDataSource.DataSet.Append;
	Result:=ShowModal;
end;

// Сохраняет одно изменение и добавляет ещё один телефон
procedure TfrmEditPhone.btMoreClick(Sender: TObject);
begin
	fDataSource.DataSet.CheckBrowseMode;
	fDataSource.DataSet.Append;
	edPhone.SetFocus;
	edPhone.SelectAll;
end;

// Сохраняемся
procedure TfrmEditPhone.btDoneClick(Sender: TObject);
begin
	fDataSource.DataSet.CheckBrowseMode;
	TClientDataSet(fDataSource.DataSet).ApplyUpdates(0);
end;


// Отменяемся
procedure TfrmEditPhone.btCancelClick(Sender: TObject);
begin
	fDataSource.DataSet.Cancel;
    TClientDataSet(fDataSource.DataSet).CancelUpdates;
end;


procedure TfrmEditPhone.FormShow(Sender: TObject);
begin
	edPhone.SetFocus;
end;

end.
