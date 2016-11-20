unit uNewDriver;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, FMTBcd, DB, DBClient, Provider,
  SqlExpr, DBGridEh, DBCtrlsEh, DBLookupEh;

type
  TfrmNewDriver = class(TForm)
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    GroupBox5: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    txtHoleCnt: TDBEdit;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    btSave: TBitBtn;
    btCancel: TBitBtn;
    qNewDriver: TSQLQuery;
    prvNewDriver: TDataSetProvider;
    cdsNewDriver: TClientDataSet;
    dsNewDriver: TDataSource;
    cdsNewDriverD_ID: TIntegerField;
    cdsNewDriverORG_ID: TIntegerField;
    cdsNewDriverD_NAME: TStringField;
    cdsNewDriverD_SECNAME: TStringField;
    cdsNewDriverD_THNAME: TStringField;
    cdsNewDriverD_TEL: TStringField;
    cboFName: TDBLookupComboboxEh;
    cboSName: TDBLookupComboboxEh;
    cboTName: TDBLookupComboboxEh;
    txtTel: TDBEdit;
    txtCarN1: TDBEdit;
    txtCarN2: TDBEdit;
    qNewCar: TSQLQuery;
    prvNewCar: TDataSetProvider;
    cdsNewCar: TClientDataSet;
    dsNewCar: TDataSource;
    cdsNewCarC_ID: TIntegerField;
    cdsNewCarD_ID: TIntegerField;
    cdsNewCarC_NUM1: TStringField;
    cdsNewCarC_NUM2: TIntegerField;
    txtTankN: TDBEdit;
    qNewTank: TSQLQuery;
    prvNewTank: TDataSetProvider;
    cdsNewTank: TClientDataSet;
    dsNewTank: TDataSource;
    cdsNewTankT_ID: TIntegerField;
    cdsNewTankT_NUM: TStringField;
    cdsNewTankT_HOLE_CNT: TIntegerField;
    procedure cboFNameNotInList(Sender: TObject; NewText: string;
      var RecheckInList: Boolean);
    procedure cboSNameNotInList(Sender: TObject; NewText: string;
      var RecheckInList: Boolean);
    procedure cboTNameNotInList(Sender: TObject; NewText: string;
      var RecheckInList: Boolean);
    procedure btSaveClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Add(org_id: integer): TModalResult;
  end;

implementation

uses uData, strUtils;

{$R *.dfm}

{ TfrmNewDriver }

procedure TfrmNewDriver.btCancelClick(Sender: TObject);
begin
    cdsNewDriver.Cancel;
    cdsNewCar.Cancel;
    cdsNewTank.Cancel;
end;

procedure TfrmNewDriver.btSaveClick(Sender: TObject);
begin
    cdsNewDriver.CheckBrowseMode;
    cdsNewDriver.ApplyUpdates(0);

    cdsNewCar.CheckBrowseMode;
    cdsNewCar.ApplyUpdates(0);

    cdsNewTank.CheckBrowseMode;
    cdsNewTank.ApplyUpdates(0);

    modalResult := mrOK;
end;

procedure TfrmNewDriver.cboFNameNotInList(Sender: TObject; NewText: string;
  var RecheckInList: Boolean);
begin
    if newText = '' then exit;

    RecheckInList := true;
    data.DictionaryAppend(data.cdsFNames, 'FN_NAME', NewText);
end;

procedure TfrmNewDriver.cboSNameNotInList(Sender: TObject; NewText: string;
  var RecheckInList: Boolean);
begin
    if newText = '' then exit;

    RecheckInList := true;
    data.DictionaryAppend(data.cdsSNames, 'SN_NAME', NewText);
end;

procedure TfrmNewDriver.cboTNameNotInList(Sender: TObject; NewText: string;
  var RecheckInList: Boolean);
begin
    if newText = '' then exit;

    RecheckInList := true;
    data.DictionaryAppend(data.cdsTNames, 'TN_NAME', NewText);
end;

function TfrmNewDriver.Add(org_id: integer): TModalResult;
begin
    data.RefreshDictionary(data.cdsFNames);
    data.RefreshDictionary(data.cdsSNames);
    data.RefreshDictionary(data.cdsTNames);

    cdsNewDriver.Close;
    cdsNewDriver.Open;
    cdsNewDriver.Insert;
    cdsNewDriverD_ID.AsInteger := data.getGeneratorValue('GEN_DRIVER_ID', true);
    cdsNewDriverORG_ID.AsInteger := org_id;

    cdsNewCar.Close;
    cdsNewCar.Open;
    cdsNewCar.Insert;
    cdsNewCarC_ID.AsInteger := data.getGeneratorValue('GEN_CAR_ID', true);
    cdsNewCarD_ID.AsInteger := cdsNewDriverD_ID.AsInteger;

    cdsNewTank.Close;
    cdsNewTank.Open;
    cdsNewTank.Insert;
    cdsNewTankT_ID.AsInteger := data.getGeneratorValue('GEN_TANK_ID', true);

    result := ShowModal;
end;

end.
