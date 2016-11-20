unit uNewOrganization;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, FMTBcd, DB, DBClient, Provider,
  SqlExpr;

type
  TfrmNewOrg = class(TForm)
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    cboOrgType: TDBLookupComboBox;
    btSave: TBitBtn;
    btCancel: TBitBtn;
    txtOrgName: TDBEdit;
    txtOrgTel: TDBEdit;
    qNewOrg: TSQLQuery;
    prvNewOrg: TDataSetProvider;
    cdsNewOrg: TClientDataSet;
    dsNewOrg: TDataSource;
    cdsNewOrgORG_ID: TIntegerField;
    cdsNewOrgORGT_ID: TIntegerField;
    cdsNewOrgORG_NAME: TStringField;
    cdsNewOrgORG_TEL: TStringField;
    cdsNewOrgOP_ID: TIntegerField;
    procedure btSaveClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Add(op_id:integer): TModalResult;
  end;

implementation

uses uData;

{$R *.dfm}

{ TfrmNewOrg }

function TfrmNewOrg.Add(op_id: integer): TModalResult;
begin
      cdsNewOrg.Close;
      cdsNewOrg.Open;
      cdsNewOrg.Insert;
      cdsNewOrgORG_ID.AsInteger := data.getGeneratorValue('GEN_ORGANIZATION_ID', true);
      cdsNewOrgOP_ID.AsInteger := op_id;

      result := ShowModal;
end;

procedure TfrmNewOrg.btCancelClick(Sender: TObject);
begin
    cdsNewOrg.Cancel;
end;

procedure TfrmNewOrg.btSaveClick(Sender: TObject);
begin
    cdsNewOrg.CheckBrowseMode;
    cdsNewOrg.ApplyUpdates(0);
    data.RefreshDictionary(data.cdsOrganization);
    modalResult := mrOK;
end;

end.
