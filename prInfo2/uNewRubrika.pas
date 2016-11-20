unit uNewRubrika;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, FMTBcd, DB, SqlExpr, DBClient,
  Provider;

type
  TfrmNewRubrika = class(TForm)
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    btSaveRubrika: TBitBtn;
    btClose: TBitBtn;
    qRubrika: TSQLQuery;
    Label3: TLabel;
    txtName: TDBEdit;
    txtShort: TDBEdit;
    txtPriceKoef: TDBEdit;
    txtOrder: TDBEdit;
    txtMap: TDBEdit;
    Label4: TLabel;
    prvRubrika: TDataSetProvider;
    cdsRubrika: TClientDataSet;
    dsRubrika: TDataSource;
    chkCover: TDBCheckBox;
    chkHot: TDBCheckBox;
    chkBlock: TDBCheckBox;
    cdsRubrikaRB_NAME: TStringField;
    cdsRubrikaRB_NAME_SHORT: TStringField;
    cdsRubrikaRB_COST_COEFF: TFloatField;
    cdsRubrikaRB_IS_OBLOGKA: TSmallintField;
    cdsRubrikaGZ_ID: TIntegerField;
    cdsRubrikaRB_IS_HOT: TSmallintField;
    cdsRubrikaDELETED: TSmallintField;
    cdsRubrikaORDERBY: TIntegerField;
    cdsRubrikaDEFAULT_MAP: TStringField;
    cdsRubrikaRB_ID: TIntegerField;
    cdsRubrikaRB_IS_LOCKABLE: TIntegerField;
    procedure btSaveRubrikaClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
  private
    { Private declarations }
    newRB_ID: integer;
  public
    { Public declarations }
    function AddNewRubrika(gz_id: integer): TModalResult;
    function EditNewRubrika(rb_id: integer): TModalResult;
  end;

var
  frmNewRubrika: TfrmNewRubrika;

implementation

uses dm;

{$R *.dfm}

function TfrmNewRubrika.AddNewRubrika(gz_id: integer): TModalResult;
begin
   newRB_ID := data.nextGeneratorId('G_RB_ID');
   cdsRubrika.Close;
   cdsRubrika.FetchParams;
   cdsRubrika.Params.ParamByName('id').AsInteger := -1;
   cdsRubrika.Open;
   cdsRubrika.Insert;
   cdsRubrikaGZ_ID.AsInteger := gz_id;
   cdsRubrikaRB_IS_LOCKABLE.AsInteger := 0;
   cdsRubrikaRB_IS_OBLOGKA.AsInteger := 0;
   cdsRubrikaRB_IS_HOT.AsInteger := 0;
   cdsRubrikaDELETED.AsInteger := 0;
   result := ShowModal;
end;

function TfrmNewRubrika.EditNewRubrika(rb_id: integer): TModalResult;
begin
    newRB_ID := 0;
    cdsRubrika.Close;
    cdsRubrika.FetchParams;
    cdsRubrika.Params.ParamByName('id').AsInteger := rb_id;
    cdsRubrika.Open;
    cdsRubrika.Edit;

    result := ShowModal;
end;

procedure TfrmNewRubrika.btSaveRubrikaClick(Sender: TObject);
begin
     if newRB_ID > 0 then cdsRubrikaRB_ID.AsInteger := newRB_ID;
     cdsRubrika.CheckBrowseMode;
     cdsRubrika.ApplyUpdates(0);
end;

procedure TfrmNewRubrika.btCloseClick(Sender: TObject);
begin
     cdsRubrika.Cancel;
end;

end.
