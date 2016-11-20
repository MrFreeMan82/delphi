unit uAuditSdelka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, FMTBcd, Provider, SqlExpr, DB, DBClient,
  IBCustomDataSet;

type
  TfrmSdelkaHistory = class(TForm)
    DBGrid1: TDBGrid;
    dsAuditSdelka: TDataSource;
    cdsAuditSdelka: TClientDataSet;
    qAuditSdelka: TSQLQuery;
    prvAuditSdelka: TDataSetProvider;
    cdsAuditSdelkaUS_NAME: TIBStringField;
    cdsAuditSdelkaCHANGE_DATE: TSQLTimeStampField;
    cdsAuditSdelkaSD_STATE: TIBStringField;
    cdsAuditSdelkaAS_ID: TIBStringField;
    qAuditSdelkaUS_NAME: TIBStringField;
    qAuditSdelkaCHANGE_DATE: TSQLTimeStampField;
    qAuditSdelkaSD_STATE: TIBStringField;
    qAuditSdelkaAS_ID: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowAudit(sd_id, ag_id: integer);
  end;

var
  frmSdelkaHistory: TfrmSdelkaHistory;

implementation

uses dm;

{$R *.dfm}

{ TfrmSdelkaHistory }

class procedure TfrmSdelkaHistory.ShowAudit(sd_id, ag_id: integer);
begin
    if not Assigned(frmSdelkaHistory) then
    try
      frmSdelkaHistory := TfrmSdelkaHistory.Create(Application);
      frmSdelkaHistory.qAuditSdelka.Close;
      frmSdelkaHistory.qAuditSdelka.Params.ParamByName('sd_id').AsInteger := sd_id;
      frmSdelkaHistory.qAuditSdelka.Params.ParamByName('ag_id').AsInteger := ag_id;
      frmSdelkaHistory.qAuditSdelka.Open;
      frmSdelkaHistory.cdsAuditSdelka.Open;
     // frmSdelkaHistory.cdsAuditSdelka.Last;
      frmSdelkaHistory.ShowModal;

      if frmSdelkaHistory.cdsAuditSdelka.RecordCount > 0 then
    finally
        FreeAndNil(frmSdelkaHistory);
    end;
end;

end.
