unit ChangeAgentForSdelka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls;

type
  TfrmChangeAgentForSdelka = class(TForm)
    cbChooseNewAgent: TDBLookupComboBox;
    Label1: TLabel;
    btChangeAgentForSdelka: TBitBtn;
    BitBtn1: TBitBtn;
	procedure btChangeAgentForSdelkaClick(Sender: TObject);
  private
	agid:integer;
	sdid:integer;
  public
	procedure Show(ai,si:integer);
  end;

var
  frmChangeAgentForSdelka: TfrmChangeAgentForSdelka;

implementation

uses dm;

{$R *.dfm}

procedure TfrmChangeAgentForSdelka.Show(ai,si:integer);
begin
  cbChooseNewAgent.ListSource.DataSet.Close;
  cbChooseNewAgent.ListSource.DataSet.Filtered := true;
  cbChooseNewAgent.ListSource.DataSet.Filter := 'AG_IS_ACTIVE = 1';
  cbChooseNewAgent.ListSource.DataSet.Open;

	agid:=ai;
	sdid:=si;
  try
  	ShowModal();
  finally
    cbChooseNewAgent.ListSource.DataSet.Filtered := false;
  end;
end;

procedure TfrmChangeAgentForSdelka.btChangeAgentForSdelkaClick(
  Sender: TObject);
begin
	with data do
	begin
		spAddAgentChangingTask.ParamByName('AG_ID_SRC').Value:=agid;//qryAgentAG_ID.Value;
		spAddAgentChangingTask.ParamByName('SD_ID_SRC').Value:=sdid;//qrySdelkaByAgentSD_ID.Value;
		spAddAgentChangingTask.ParamByName('AG_ID_DST').Value:=cbChooseNewAgent.KeyValue;
		spAddAgentChangingTask.ExecProc;
	end;
end;

end.
