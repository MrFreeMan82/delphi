unit uNewFormat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, FMTBcd, DB, SqlExpr, Mask, DBCtrls, Provider,
  DBClient;

type
  TfrmNewFormat = class(TForm)
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btSaveFormats: TBitBtn;
    btClose: TBitBtn;
    DBEdit1: TDBEdit;
    dsNewFormat: TDataSource;
    cboGZ: TComboBox;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    chkModul: TCheckBox;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    qNewFormat: TSQLQuery;
    prvNewFormat: TDataSetProvider;
    cdsNewFormat: TClientDataSet;
    cdsNewFormatFM_ID: TIntegerField;
    cdsNewFormatFM_NAME: TStringField;
    cdsNewFormatFM_SPACE: TFloatField;
    cdsNewFormatFM_HAS_PICTURE: TSmallintField;
    cdsNewFormatFM_PICTURE_SIZES: TStringField;
    cdsNewFormatORDERBY: TIntegerField;
    qFormatCost: TSQLQuery;
    prvFormatCost: TDataSetProvider;
    cdsFormatCost: TClientDataSet;
    dsFormatCost: TDataSource;
    cdsFormatCostGZ_ID: TIntegerField;
    cdsFormatCostFM_ID: TIntegerField;
    cdsFormatCostFM_COST: TFloatField;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    cdsFormatCostFM_COST_4: TFloatField;
    procedure btSaveFormatsClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure prvNewFormatGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure btCloseClick(Sender: TObject);
  private
    { Private declarations }
    newFmID:integer;
  public
    { Public declarations }
    function AddNewFormat(): TModalResult;
    function EditFormat(fm_id, gz_id:integer): TModalResult;
    function DeleteFormat(fm_id:integer):integer;
  end;

var
  frmNewFormat: TfrmNewFormat;

implementation

uses dm;

{$R *.dfm}

{ TfrmNewFormat }

function TfrmNewFormat.AddNewFormat(): TModalResult;
begin
    newFmID := data.nextGeneratorId('G_FM_ID');

    cdsNewFormat.Close;
    cdsNewFormat.FetchParams;
    cdsNewFormat.Params.ParamByName('gz_id').AsInteger := -1;
    cdsNewFormat.Params.ParamByName('fm_id').AsInteger := -1;
    cdsNewFormat.Open;

    cdsFormatCost.Close;
    cdsFormatCost.FetchParams;
    cdsFormatCost.Params.ParamByName('gz_id').AsInteger := -1;
    cdsFormatCost.Params.ParamByName('fm_id').AsInteger := -1;
    cdsFormatCost.Open;

    cdsFormatCost.Insert;
    cdsNewFormat.Insert;
    result := ShowModal;
end;

procedure TfrmNewFormat.btSaveFormatsClick(Sender: TObject);
begin
      if newFmID > 0 then cdsNewFormatFM_ID.AsInteger := newFmID;

      cdsNewFormatFM_HAS_PICTURE.AsInteger := ord(chkModul.Checked);
      cdsFormatCostGZ_ID.AsInteger := cboGZ.ItemIndex;
      cdsFormatCostFM_ID.AsInteger := cdsNewFormatFM_ID.AsInteger;

      cdsNewFormat.CheckBrowseMode;
      cdsNewFormat.ApplyUpdates(0);
      cdsFormatCost.CheckBrowseMode;
      cdsFormatCost.ApplyUpdates(0);
end;

function TfrmNewFormat.EditFormat(fm_id, gz_id: integer): TModalResult;
begin
    newFmID := 0;
    cdsNewFormat.Close;
    cdsNewFormat.FetchParams;
    cdsNewFormat.Params.ParamByName('fm_id').AsInteger := fm_id;
    cdsNewFormat.Params.ParamByName('gz_id').AsInteger := gz_id;
    cdsNewFormat.Open;

    cdsFormatCost.Close;
    cdsFormatCost.FetchParams;
    cdsFormatCost.Params.ParamByName('gz_id').AsInteger := gz_id;
    cdsFormatCost.Params.ParamByName('fm_id').AsInteger := fm_id;
    cdsFormatCost.Open;

    cdsFormatCost.Edit;
    cdsNewFormat.Edit;

    cboGZ.Enabled := false;
    cboGZ.ItemIndex := gz_id;
    if cdsNewFormatFM_HAS_PICTURE.IsNull then chkModul.State := cbGrayed
    else chkModul.Checked := boolean(cdsNewFormatFM_HAS_PICTURE.AsInteger);

    result := ShowModal;
end;

procedure TfrmNewFormat.DBEdit1Change(Sender: TObject);
begin
    btSaveFormats.Enabled := true;
end;

function TfrmNewFormat.DeleteFormat(fm_id: integer): integer;

begin
result := 0;

end;

procedure TfrmNewFormat.prvNewFormatGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  tableName := 'FORMAT';
end;

procedure TfrmNewFormat.btCloseClick(Sender: TObject);
begin
    cdsFormatCost.Cancel;
    cdsNewFormat.Cancel;
end;

end.
