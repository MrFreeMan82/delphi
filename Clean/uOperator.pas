unit uOperator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ToolWin, ComCtrls, Grids, DBGrids, FMTBcd, DB, DBClient,
  Provider, SqlExpr, uWashDetail;

type
  TfrmOperator = class(TForm)
    ToolBar1: TToolBar;
    btDel: TSpeedButton;
    btAddNew: TSpeedButton;
    DBGrid1: TDBGrid;
    ToolButton1: TToolButton;
    qOperator: TSQLQuery;
    prvOperator: TDataSetProvider;
    cdsOperator: TClientDataSet;
    dsOperator: TDataSource;
    cdsOperatorORG_NAME: TStringField;
    cdsOperatorFIO: TStringField;
    cdsOperatorCARNUM: TStringField;
    cdsOperatorT_NUM: TStringField;
    btEdit: TSpeedButton;
    cdsOperatorW_ID: TIntegerField;
    cdsOperatorOP_ID: TIntegerField;
    cdsOperatorWS_ID: TIntegerField;
    cdsOperatorORG_ID: TIntegerField;
    cdsOperatorC_ID: TIntegerField;
    cdsOperatorD_ID: TIntegerField;
    cdsOperatorT_ID: TIntegerField;
    cdsOperatorW_SUMM: TFloatField;
    cdsOperatorW_DATE: TSQLTimeStampField;
    cdsOperatorW_TIME_BEGIN: TSQLTimeStampField;
    cdsOperatorW_TIME_END: TSQLTimeStampField;
    btRefresh: TSpeedButton;
    procedure btEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btAddNewClick(Sender: TObject);
    procedure btRefreshClick(Sender: TObject);
  private
    { Private declarations }
    op_id:integer;
    frmWashDetail: TfrmWashDetail;
  public
    { Public declarations }
    procedure ShowOperatorWashList(op_id:integer);
  end;

implementation

uses uGlobals, uData;

{$R *.dfm}

{ TfrmOperator }

procedure TfrmOperator.btAddNewClick(Sender: TObject);
begin
   frmWashDetail.Add(op_id);
   btRefreshClick(Sender);
end;

procedure TfrmOperator.btEditClick(Sender: TObject);
begin
    frmWashDetail.Edit(cdsOperatorW_ID.AsInteger);
end;

procedure TfrmOperator.btRefreshClick(Sender: TObject);
begin
    cdsOperator.Refresh
end;

procedure TfrmOperator.FormCreate(Sender: TObject);
begin
    frmWashDetail := TfrmWashDetail.Create(self)
end;

procedure TfrmOperator.FormDestroy(Sender: TObject);
begin
    freeAndNil(frmWashDetail)
end;

procedure TfrmOperator.ShowOperatorWashList(op_id: integer);
begin
     self.op_id := op_id;
     cdsOperator.Close;
    // cdsOperator.FetchParams;
     cdsOperator.Params.ParamByName('op_id').AsInteger := op_id;
     cdsOperator.Params.ParamByName('ws_id').AsInteger := W_BEGIN;
     cdsOperator.Open;

     Show
end;

end.
