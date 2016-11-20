unit custForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cust, ExtCtrls, StdCtrls, Buttons, globals;

type
  TfrmCustForm = class(TForm)
    pnlHolder: TPanel;
    pnlButtonHolder: TPanel;
    BitBtn1: TBitBtn;
    cust: TfrmCust;
    procedure FormShow(Sender: TObject);
    procedure custbtSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
	function SelectCust(EnableSelectAll: boolean):boolean;
	{ Public declarations }
  end;

var
  frmCustForm: TfrmCustForm;

implementation

uses dm, main, accessRights;

{$R *.dfm}

// Подправим размеры окна таким образом, чтобы в него полностью
// влазил фрейм для работы с клиентами
function TfrmCustForm.SelectCust(EnableSelectAll: boolean):boolean;
begin
//	ClientHeight:=pnlHolder.Height+pnlButtonHolder.Height;
 // data.dsCust.DataSet.Close;
  cust.SelectAll := EnableSelectAll;
	if (ShowModal=mrOk) then
		Result:=true
	else
		Result:=false;
//	ClientHeight:=pnlHolder.Height;
end;

procedure TfrmCustForm.FormShow(Sender: TObject);
begin
	// Расставим права доступа
	TAccessRightsManager.SetWindowAccessState(int2user(frmMain.currentUserType),cust);

	cust.edSearch.SetFocus;
end;

procedure TfrmCustForm.custbtSearchClick(Sender: TObject);
begin
  cust.btSearchClick(Sender);

end;

end.
