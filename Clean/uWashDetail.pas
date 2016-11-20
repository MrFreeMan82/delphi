unit uWashDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DBCtrls, Mask, Grids, DBGrids, FMTBcd, DB,
  DBClient, Provider, SqlExpr, Buttons, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  DBCGrids, ExtCtrls, uNewOrganization, uNewDriver;

type
  TfrmWashDetail = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pkWashDate: TDateTimePicker;
    pkWashTimeBegin: TDateTimePicker;
    pkWashTimeEnd: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    GroupBox5: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    txtHoleCnt: TDBEdit;
    GroupBox6: TGroupBox;
    Label15: TLabel;
    txtWashSum: TDBText;
    qWash: TSQLQuery;
    prvWash: TDataSetProvider;
    cdsWash: TClientDataSet;
    dsWash: TDataSource;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btAddNewOrg: TSpeedButton;
    btAddNewDr: TSpeedButton;
    txtOrgName: TDBLookupComboBox;
    cboDrSName: TDBLookupComboBox;
    cboDrFName: TDBLookupComboBox;
    cboDrTName: TDBLookupComboBox;
    cdoOrgTel: TDBLookupComboBox;
    cboDrTel: TDBLookupComboBox;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    cdsWashW_ID: TIntegerField;
    cdsWashOP_ID: TIntegerField;
    cdsWashWS_ID: TIntegerField;
    cdsWashORG_ID: TIntegerField;
    cdsWashC_ID: TIntegerField;
    cdsWashD_ID: TIntegerField;
    cdsWashT_ID: TIntegerField;
    cdsWashW_SUMM: TFloatField;
    cdsWashW_TIME_BEGIN: TSQLTimeStampField;
    cdsWashW_TIME_END: TSQLTimeStampField;
    cdsWashW_DATE: TSQLTimeStampField;
    cboCarNum: TDBLookupComboBox;
    btAddCar: TSpeedButton;
    cboTankN: TDBLookupComboBox;
    txtOrgType: TDBEdit;
    prvWasDetail: TDataSetProvider;
    cdsWashDetail: TClientDataSet;
    dsWashDetail: TDataSource;
    qWashDetail: TSQLQuery;
    cdsWashDetailWD_ID: TIntegerField;
    cdsWashDetailW_ID: TIntegerField;
    cdsWashDetailWD_HOLE_ST: TIntegerField;
    cdsWashDetailLQ_ID: TIntegerField;
    cdsWashDetailWD_PRICE: TFloatField;
    cdsWashDetailHOLE_NO: TIntegerField;
    cdsWashDetailLQ_NAME: TStringField;
    grHolesInfo: TDBGrid;
    imgEditHole: TImage;
    cdsWashORGT_ID: TIntegerField;
    cdsWashORGT_NAME: TStringField;
    cdsWashT_HOLE_CNT: TIntegerField;
    procedure cdsWashORG_IDChange(Sender: TField);
    procedure cdsWashD_IDChange(Sender: TField);
    procedure btnSaveClick(Sender: TObject);
    procedure grHolesInfoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grHolesInfoCellClick(Column: TColumn);
    procedure btAddCarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btAddNewOrgClick(Sender: TObject);
    procedure btAddNewDrClick(Sender: TObject);
  private
    { Private declarations }
    op_id:integer;
    frmNewOrg: TfrmNewOrg;
    frmNewDriver: TfrmNewDriver;
    procedure AddHoles(holes_cnt: integer);
  public
    { Public declarations }
    procedure Edit(w_id: integer);
    procedure Add(op_id: integer);
  end;

implementation

uses uData, uGlobals, SqlTimSt, uTest;

{$R *.dfm}

{ TfrmWashDetail }

procedure TfrmWashDetail.Add(op_id:integer);
begin
     self.op_id := op_id;
     pkWashDate.Date := Date;
     pkWashTimeBegin.Time := Time;
     pkWashTimeEnd.Time := Time;

     cdsWash.Close;
     cdsWash.Params.ParamByName('w_id').AsInteger := -1;
     cdsWash.Open;

     cdsWash.Insert;
     cdsWashW_ID.AsInteger := data.getGeneratorValue('GEN_WASH_ID', true);
     cdsWashOP_ID.AsInteger := op_id;
     cdsWashWS_ID.AsInteger := W_BEGIN;

     cdsWashDetail.Close;
     cdsWashDetail.Params.ParamByName('w_id').AsInteger := -1;
     cdsWashDetail.Open;

     ShowModal;
end;

procedure TfrmWashDetail.AddHoles(holes_cnt: integer);
var i:integer;
begin
     for i := 0 to holes_cnt - 1 do
     begin
          cdsWashDetail.Insert;
          cdsWashDetailWD_ID.AsInteger := data.getGeneratorValue('GEN_WASH_DETAIL_ID', true);
          cdsWashDetailW_ID.AsInteger := cdsWashW_ID.AsInteger;
          cdsWashDetailWD_HOLE_ST.AsInteger := 2;
          cdsWashDetailHOLE_NO.AsInteger := i + 1;
          cdsWashDetailLQ_ID.AsInteger := 0;
     end;
end;

procedure TfrmWashDetail.btAddCarClick(Sender: TObject);
begin
      if not Assigned(frmTest) then frmTest := TfrmTest.Create(self);
      frmTest.cdsNewItem.Open;
      frmTest.cdsNewItem.Insert;
      frmTest.ShowModal;
      freeAndNil(frmTest);
end;

procedure TfrmWashDetail.btAddNewDrClick(Sender: TObject);
begin
     if cdsWashORG_ID.IsNull then
     begin
          messageBox(handle, '���������� ������� �����������', '������', MB_OK or MB_ICONERROR);
          exit;
     end;

     if not Assigned(frmNewDriver) then frmNewDriver := TfrmNewDriver.Create(self);
     if frmNewDriver.Add(cdsWashORG_ID.AsInteger) = mrOk then
     begin
         cdsWashD_ID.AsInteger := frmNewDriver.cdsNewDriverD_ID.AsInteger;
         cdsWashC_ID.AsInteger := frmNewDriver.cdsNewCarC_ID.AsInteger;
         cdsWashT_ID.AsInteger := frmNewDriver.cdsNewTankT_ID.AsInteger;

         if not cdsWashT_ID.IsNull then AddHoles(frmNewDriver.cdsNewTankT_HOLE_CNT.AsInteger);
     end;
end;

procedure TfrmWashDetail.btAddNewOrgClick(Sender: TObject);
begin
     if not Assigned(frmNewOrg) then frmNewOrg := TfrmNewOrg.Create(self);
     if frmNewOrg.Add(cdsWashOP_ID.AsInteger) = mrOK then
         cdsWashORG_ID.AsInteger := frmNewOrg.cdsNewOrgORG_ID.AsInteger;
end;

procedure TfrmWashDetail.btnSaveClick(Sender: TObject);
begin
    cdsWashW_DATE.AsSQLTimeStamp := DateTimeToSQLTimeStamp(pkWashDate.Date);
    cdsWashW_TIME_BEGIN.AsSQLTimeStamp := DateTimeToSQLTimeStamp(pkWashTimeBegin.Date);
    cdsWashW_TIME_END.AsSQLTimeStamp := DateTimeToSQLTimeStamp(pkWashTimeEnd.Date);

    cdsWash.CheckBrowseMode;
    cdsWash.ApplyUpdates(0);

    cdsWashDetail.CheckBrowseMode;
    cdsWashDetail.ApplyUpdates(0);

    ModalResult := mrOK;
end;

procedure TfrmWashDetail.cdsWashD_IDChange(Sender: TField);
begin
    data.filterDictionary(data.cdsCar, 'D_ID=' + Sender.AsString);
    cdsWashC_ID.Clear;
end;

procedure TfrmWashDetail.cdsWashORG_IDChange(Sender: TField);
begin
    data.filterDictionary(data.cdsDriver, 'ORG_ID=' + Sender.AsString);

    cdsWashD_ID.OnChange := nil;
    cdsWashD_ID.Clear;
    cdsWashD_ID.OnChange := cdsWashD_IDChange;
    cdsWashC_ID.Clear;
    cdsWashT_ID.Clear;
    txtHoleCnt.Text := '';

    cdsWashDetail.EmptyDataSet;
end;

procedure TfrmWashDetail.Edit(w_id: integer);
begin
     cdsWash.Close;
     cdsWash.Params.ParamByName('w_id').AsInteger := w_id;
     cdsWash.Open;
     cdsWash.Edit;

     cdsWashDetail.Close;
     cdsWashDetail.Params.ParamByName('w_id').AsInteger := w_id;
     cdsWashDetail.Open;

     pkWashDate.Date := cdsWashW_DATE.AsDateTime;
     pkWashTimeBegin.Time := TTime(cdsWashW_TIME_BEGIN.AsDateTime);
     pkWashTimeEnd.Time := TTime(cdsWashW_TIME_END.AsDateTime);

     data.filterDictionary(data.cdsDriver, 'ORG_ID=' + cdsWashORG_ID.AsString);
     data.filterDictionary(data.cdsCar, 'D_ID=' + cdsWashD_ID.AsString);

     ShowModal;
end;

procedure TfrmWashDetail.FormDestroy(Sender: TObject);
begin
    freeAndNil(frmNewOrg);
    freeAndNil(frmNewDriver);
end;

procedure TfrmWashDetail.grHolesInfoCellClick(Column: TColumn);
begin
    if Column.FieldName = '' then
    begin
         showMessage('Edit Rec ' + cdsWashDetailHOLE_NO.AsString)
    end
end;

procedure TfrmWashDetail.grHolesInfoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if Column.FieldName = '' then
    begin
         grHolesInfo.Canvas.FillRect(rect);
         grHolesInfo.Canvas.Draw(rect.Left, rect.Top, imgEditHole.Picture.Bitmap);
    end
end;

end.
