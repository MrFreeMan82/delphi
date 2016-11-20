unit uNaborshic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, FMTBcd, DB, DBClient, Provider, SqlExpr, GridsEh,
  DBCtrls, StdCtrls, DBLookupEh, Mask, DBCtrlsEh, Buttons, ExtCtrls;

type
  TfrmNabor = class(TForm)
    Panel20: TPanel;
    Shape84: TShape;
    btShowObjavOrder: TBitBtn;
    btFindSdelkaNabor: TBitBtn;
    btRefreshNabor: TBitBtn;
    btEditObjav: TBitBtn;
    Panel18: TPanel;
    Shape79: TShape;
    Label56: TLabel;
    Label63: TLabel;
    edSearchNabor: TDBEditEh;
    cbSdelkaNaborGazeta: TDBLookupComboboxEh;
    Panel1: TPanel;
    cbSdelkaNaborFiltered: TCheckBox;
    cbObjavBeregFilter: TComboBox;
    btSetBereg: TBitBtn;
    cbAgentForNabor: TDBLookupComboBox;
    btFilterNaborSdelkas: TBitBtn;
    grSdelkaForNabor: TDBGridEh;
    qryObjavForNabor: TSQLQuery;
    qryObjavForNaborAG_ID: TIntegerField;
    qryObjavForNaborSD_ID: TIntegerField;
    qryObjavForNaborOB_ID: TIntegerField;
    qryObjavForNaborOB_STATE: TSmallintField;
    qryObjavForNaborOB_COMMENT: TStringField;
    qryObjavForNaborAG_NAME: TStringField;
    qryObjavForNaborAG_IS_REMOTE: TSmallintField;
    qryObjavForNaborSD_ID_COMPOUND: TStringField;
    qryObjavForNaborRB_NAME_SHORT: TStringField;
    qryObjavForNaborFM_NAME: TStringField;
    qryObjavForNaborGZ_NAME_SHORT: TStringField;
    qryObjavForNaborPODACHA_NUMS: TStringField;
    qryObjavForNaborCU_ID: TIntegerField;
    qryObjavForNaborGZ_ID: TSmallintField;
    qryObjavForNaborRB_IS_LOCKABLE: TSmallintField;
    qryObjavForNaborSR_IS_CURRENT_ISSUE: TIntegerField;
    qryObjavForNaborsd_num: TStringField;
    qryObjavForNaborOB_TYPE: TIntegerField;
    prvObjavForNabor: TDataSetProvider;
    cdsObjavForNabor: TClientDataSet;
    cdsObjavForNaborAG_ID: TIntegerField;
    cdsObjavForNaborSD_ID: TIntegerField;
    cdsObjavForNaborOB_ID: TIntegerField;
    cdsObjavForNaborOB_STATE: TSmallintField;
    cdsObjavForNaborAG_NAME: TStringField;
    cdsObjavForNaborOB_COMMENT: TStringField;
    cdsObjavForNaborAG_IS_REMOTE: TSmallintField;
    cdsObjavForNaborSD_ID_COMPOUND: TStringField;
    cdsObjavForNaborRB_NAME_SHORT: TStringField;
    cdsObjavForNaborFM_NAME: TStringField;
    cdsObjavForNaborGZ_NAME_SHORT: TStringField;
    cdsObjavForNaborPODACHA_NUMS: TStringField;
    cdsObjavForNaborCU_ID: TIntegerField;
    cdsObjavForNaborGZ_ID: TSmallintField;
    cdsObjavForNaborRB_IS_LOCKABLE: TSmallintField;
    cdsObjavForNaborSR_IS_CURRENT_ISSUE: TIntegerField;
    cdsObjavForNaborsd_num: TStringField;
    cdsObjavForNaborOB_TYPE: TIntegerField;
    dsObjavForNabor: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btFilterNaborSdelkasClick(Sender: TObject);
    procedure btEditObjavClick(Sender: TObject);
    procedure btRefreshNaborClick(Sender: TObject);
    procedure btFindSdelkaNaborClick(Sender: TObject);
    procedure btShowObjavOrderClick(Sender: TObject);
    procedure grSdelkaForNaborDblClick(Sender: TObject);
    procedure grSdelkaForNaborDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure grSdelkaForNaborKeyPress(Sender: TObject; var Key: Char);
    procedure edSearchNaborKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{var
  frmNabor: TfrmNabor;}

implementation

uses sdelkaPublForm, dmPubl, globals, findSdelka, objavOrder, main;

{$R *.dfm}

procedure TfrmNabor.FormShow(Sender: TObject);
begin
     btFilterNaborSdelkasClick(Sender);
end;

procedure TfrmNabor.btFilterNaborSdelkasClick(Sender: TObject);
begin
     SavePos(cdsObjavForNabor);

     cdsObjavForNabor.Close;
     cdsObjavForNabor.FetchParams;
     cdsObjavForNabor.Params.ParamByName('gz_id').AsInteger := cbSdelkaNaborGazeta.KeyValue;
     cdsObjavForNabor.Open;

     LoadPos(cdsObjavForNabor);
end;

procedure TfrmNabor.btEditObjavClick(Sender: TObject);
begin
	TfrmSdelkaPublForm.Edit(
              cdsObjavForNaborsd_num.AsString,
              cdsObjavForNaborAG_ID.Value,
							cdsObjavForNaborSD_ID.Value,
							cdsObjavForNaborOB_ID.Value,
							cdsObjavForNaborGZ_ID.Value,
							cdsObjavForNaborCU_ID,
							uNabor);

 grSdelkaForNabor.DataSource.DataSet.Refresh;
end;

procedure TfrmNabor.btRefreshNaborClick(Sender: TObject);
begin
    btFilterNaborSdelkasClick(Sender);
end;

procedure TfrmNabor.btFindSdelkaNaborClick(Sender: TObject);
begin
   frmFindSdelka.ShowModal(uNabor);
end;

procedure TfrmNabor.btShowObjavOrderClick(Sender: TObject);
begin
  //  frmObjavOrder.ShowModal;
end;

procedure TfrmNabor.grSdelkaForNaborDblClick(Sender: TObject);
begin
    btEditObjavClick(Sender)
end;

procedure TfrmNabor.grSdelkaForNaborDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
	frmMain.DrawLockCell(Sender, Column, Rect);
	frmMain.DrawSRCell(Sender, Column, Rect);
end;

procedure TfrmNabor.grSdelkaForNaborKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (Key=#13) then btEditObjavClick(Sender);
end;

procedure TfrmNabor.edSearchNaborKeyPress(Sender: TObject; var Key: Char);
begin
	if (Key = #13) then
		    if (cdsObjavForNabor.Locate('SD_NUM', edSearchNabor.Text, []))
        then grSdelkaForNabor.SetFocus;
end;

end.
