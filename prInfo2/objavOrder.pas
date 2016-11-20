unit objavOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Buttons, Grids, DBGrids, DB;

type
  TfrmObjavOrder = class(TForm)
    cbGaz: TDBLookupComboBox;
    Label1: TLabel;
    Shape86: TShape;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    cbRub: TDBLookupComboBox;
    Label2: TLabel;
    Shape1: TShape;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmObjavOrder: TfrmObjavOrder;

implementation

uses dmPubl, dm;

{$R *.dfm}

procedure TfrmObjavOrder.BitBtn1Click(Sender: TObject);
begin
	with publData do
	begin
		cdsObjavOrder.Params.ParamByName('RB_ID').AsInteger:=cbRub.KeyValue;
		cdsObjavOrder.Params.ParamByName('IS_ID').AsInteger := data.getCurrentIssue(cbGaz.KeyValue);
{		if (cbGaz.KeyValue = GZ_NS) then
			cdsObjavOrder.Params.ParamByName('IS_ID').AsInteger:=data.tblParamsPM_CURRENT_ISSUE_NS.AsInteger
		else
			cdsObjavOrder.Params.ParamByName('IS_ID').AsInteger:=data.tblParamsPM_CURRENT_ISSUE_PR.AsInteger;
}
		if (not cdsObjavOrder.Active) then
			cdsObjavOrder.Open
		else
            cdsObjavOrder.Refresh;
	end;
end;

procedure TfrmObjavOrder.BitBtn2Click(Sender: TObject);
begin
    publData.cdsObjavOrder.CheckBrowseMode;
    publData.cdsObjavOrder.ApplyUpdates(0);
    publData.cdsObjavOrder.Refresh;    
end;

end.
