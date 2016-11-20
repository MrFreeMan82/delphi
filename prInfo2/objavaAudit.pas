unit objavaAudit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, SimpleDS, Grids, DBGridEh, FMTBcd, Provider,
  SqlExpr, GridsEh;

type
  TfrmObjavaAudit = class(TForm)
    grObjavaAudit: TDBGridEh;
    qryObjavAudit: TSQLQuery;
    cdsObjavAudit: TClientDataSet;
    prvObjavAudit: TDataSetProvider;
    cdsObjavAuditUS_NAME: TStringField;
    cdsObjavAuditCHANGE_DATE: TSQLTimeStampField;
    cdsObjavAuditOS_NAME: TStringField;
    cdsObjavAuditNEW_TEXT: TStringField;
    cdsObjavAuditRB_NAME: TStringField;
    dsObjavAudit: TDataSource;
  private
    { Private declarations }
  public
	procedure ShowObjavAudit(agid, obid: integer);
  end;

var
  frmObjavaAudit: TfrmObjavaAudit;

implementation

uses dm;

{$R *.dfm}

{ TfrmObjavaAudit }

procedure TfrmObjavaAudit.ShowObjavAudit(agid, obid: integer);
begin
	cdsObjavAudit.Params.ParamByName('AG_ID').AsInteger := agid;
	cdsObjavAudit.Params.ParamByName('OB_ID').AsInteger := obid;

	if (cdsObjavAudit.Active) then
		cdsObjavAudit.Close();
	cdsObjavAudit.Open();

	ShowModal();
end;

end.
