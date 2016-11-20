unit bonusLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Grids, DBGrids, FMTBcd,
  SqlExpr, DBClient, SimpleDS;

type
  TfrmBonusLog = class(TForm)
    qryBonusLog: TSimpleDataSet;
    dsBonusLog: TDataSource;
    spAddBonus: TSQLStoredProc;
    DBGrid1: TDBGrid;
    qryBonusLogAG_ID: TIntegerField;
    qryBonusLogCU_ID: TIntegerField;
    qryBonusLogBT_ID: TIntegerField;
    qryBonusLogBT_DATE: TSQLTimeStampField;
    qryBonusLogBT_SUM: TFloatField;
    qryBonusLogBT_COMMENT: TStringField;
    qryBonusLogBT_CHANGE: TFloatField;
    edSubSum: TEdit;
    btSubBonus: TBitBtn;
    Label1: TLabel;
    edSubComment: TEdit;
    Label2: TLabel;
    procedure btSubBonusClick(Sender: TObject);
  private
    { Private declarations }
  public
	procedure ShowModalForCust(agid,cuid:integer);
  end;

var
  frmBonusLog: TfrmBonusLog;

implementation

uses dm;

{$R *.dfm}

procedure TfrmBonusLog.ShowModalForCust(agid,cuid:integer);
begin
	if (qryBonusLog.Active) then
		qryBonusLog.Close;
	qryBonusLog.Params.ParamByName('AG_ID').Value:=agid;
	qryBonusLog.Params.ParamByName('CU_ID').Value:=cuid;
	qryBonusLog.Open;

	ShowModal;
end;

procedure TfrmBonusLog.btSubBonusClick(Sender: TObject);
begin
	try
		if (StrToFloat(edSubSum.Text)<=0) then
			raise EConvertError.Create('');
	except
		MessageDlg('Неправильное значение в поле "Сумма"',mtError,[mbOk],0);
		exit;
	end;
	spAddBonus.ParamByName('AG_ID').Value:=qryBonusLog.Params.ParamByName('AG_ID').Value;
	spAddBonus.ParamByName('CU_ID').Value:=qryBonusLog.Params.ParamByName('CU_ID').Value;
	spAddBonus.ParamByName('BT_CHANGE').AsFloat:=-StrToFloat(edSubSum.Text);
	spAddBonus.ParamByName('BT_COMMENT').Value:=edSubComment.Text;
	spAddBonus.ExecProc;
	qryBonusLog.Close;
	qryBonusLog.Open;
end;

end.
