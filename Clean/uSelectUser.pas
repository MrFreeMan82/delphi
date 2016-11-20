unit uSelectUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, uData, FMTBcd, DB, Provider,
  DBClient, SqlExpr;

type
  TfrmSelectUser = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    grdUser: TDBGrid;
    grdOperator: TDBGrid;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    qUser: TSQLQuery;
    cdsUser: TClientDataSet;
    prvUser: TDataSetProvider;
    dsUser: TDataSource;
    cdsUserU_ID: TIntegerField;
    cdsUserUT_ID: TIntegerField;
    cdsUserU_FIO: TStringField;
    cdsUserUT_NAME: TStringField;
    qOperator: TSQLQuery;
    prvOperator: TDataSetProvider;
    cdsOperator: TClientDataSet;
    dsOperator: TDataSource;
    cdsOperatorOP_NAME: TStringField;
    cdsOperatorOP_ID: TIntegerField;
    procedure cdsUserAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmSelectUser.cdsUserAfterScroll(DataSet: TDataSet);
begin
    cdsOperator.Close;
    cdsOperator.FetchParams;
    cdsOperator.Params.ParamByName('us_id').AsInteger := cdsUserU_ID.AsInteger;
    cdsOperator.Open;
end;

procedure TfrmSelectUser.FormShow(Sender: TObject);
begin
    cdsUser.Close;
    cdsUser.open;
end;

end.
