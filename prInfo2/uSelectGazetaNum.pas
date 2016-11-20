unit uSelectGazetaNum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, FMTBcd, Provider, DBClient,
  DB, SqlExpr, DBCtrls;

type
  TfrmSelectGZNum = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Label1: TLabel;
    qGZNum: TSQLQuery;
    dsGZNum: TDataSource;
    cdsGZNum: TClientDataSet;
    prvGZNum: TDataSetProvider;
    cdsGZNumIS_ID: TIntegerField;
    cdsGZNumIS_NAME_COMPOSED: TStringField;
    cdsGZNumIS_DATE: TSQLTimeStampField;
    qGZ: TSQLQuery;
    dsGZ: TDataSource;
    prvGZ: TDataSetProvider;
    cdsGZ: TClientDataSet;
    cdsGZGZ_ID: TIntegerField;
    cdsGZGZ_NAME: TStringField;
    rgGZ: TRadioGroup;
    procedure rgGZClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure FillGZ();

  public
    { Public declarations }
  end;

implementation

uses dm;

{$R *.dfm}

{ TfrmSelectGZNum }

procedure TfrmSelectGZNum.FillGZ;
begin
    cdsGZ.Close;
    cdsGZ.Open;

    while not cdsGZ.Eof do
    begin
        rgGZ.Items.Append(cdsGZ.Fields[1].asString);

        cdsGZ.Next;
    end;
end;

procedure TfrmSelectGZNum.rgGZClick(Sender: TObject);
begin
    if cdsGZ.Locate('GZ_NAME', rgGZ.Items[rgGZ.ItemIndex], []) then
    begin
        cdsGZNum.Close;
        cdsGZNum.FetchParams;
        cdsGZNum.Params.ParamByName('gz_id').asINteger := cdsGZGZ_ID.AsInteger;
        cdsGZNum.Open;
    end
end;

procedure TfrmSelectGZNum.FormCreate(Sender: TObject);
begin
    FillGZ();
end;

end.
