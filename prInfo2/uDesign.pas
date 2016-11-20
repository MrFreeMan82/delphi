unit uDesign;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, DBLookupEh, StdCtrls, DBCtrlsEh, Mask, ExtCtrls,
  Buttons, DBCtrls, GridsEh, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TfrmDesign = class(TForm)
    Panel14: TPanel;
    Shape78: TShape;
    Label66: TLabel;
    Label81: TLabel;
    Shape61: TShape;
    edDesignerSearch: TDBEditEh;
    cbShowOblogka: TDBCheckBoxEh;
    cbGazetaDesign: TDBLookupComboboxEh;
    grSdelkaForDesign: TDBGridEh;
    Panel16: TPanel;
    Shape77: TShape;
    DBText2: TDBText;
    btAddModule: TBitBtn;
    btRefreshObjavsDesigner: TBitBtn;
    btEditObjavDesign: TBitBtn;
    btFindDesigner: TBitBtn;
    qryModuliDesign: TSQLQuery;
    qryModuliDesignAG_ID: TIntegerField;
    qryModuliDesignSD_ID: TIntegerField;
    qryModuliDesignOB_ID: TIntegerField;
    qryModuliDesignCU_ID: TIntegerField;
    qryModuliDesignAG_NAME: TStringField;
    qryModuliDesignAG_IS_REMOTE: TSmallintField;
    qryModuliDesignSD_ID_COMPOUND: TStringField;
    qryModuliDesignRB_NAME_SHORT: TStringField;
    qryModuliDesignFM_NAME: TStringField;
    qryModuliDesignGZ_NAME_SHORT: TStringField;
    qryModuliDesignPODACHA_NUMS: TStringField;
    qryModuliDesignRB_IS_OBLOGKA: TSmallintField;
    qryModuliDesignGZ_ID: TSmallintField;
    qryModuliDesignRB_IS_LOCKABLE: TSmallintField;
    qryModuliDesignSR_IS_CURRENT_ISSUE: TIntegerField;
    qryModuliDesignSD_NUM: TStringField;
    qryModuliDesignOB_STATE: TIntegerField;
    qryModuliDesignOB_STATE_TXT: TIntegerField;
    prvModuliDesign: TDataSetProvider;
    cdsModuliDesign: TClientDataSet;
    cdsModuliDesignAG_ID: TIntegerField;
    cdsModuliDesignSD_ID: TIntegerField;
    cdsModuliDesignOB_ID: TIntegerField;
    cdsModuliDesignCU_ID: TIntegerField;
    cdsModuliDesignAG_IS_REMOTE: TSmallintField;
    cdsModuliDesignGZ_NAME_SHORT: TStringField;
    cdsModuliDesignAG_NAME: TStringField;
    cdsModuliDesignSD_ID_COMPOUND: TStringField;
    cdsModuliDesignRB_NAME_SHORT: TStringField;
    cdsModuliDesignFM_NAME: TStringField;
    cdsModuliDesignPODACHA_NUMS: TStringField;
    cdsModuliDesignRB_IS_OBLOGKA: TSmallintField;
    cdsModuliDesignGZ_ID: TSmallintField;
    cdsModuliDesignRB_IS_LOCKABLE: TSmallintField;
    cdsModuliDesignSR_IS_CURRENT_ISSUE: TIntegerField;
    cdsModuliDesignSD_NUM: TStringField;
    cdsModuliDesignOB_STATE: TIntegerField;
    cdsModuliDesignOB_STATE_TXT: TIntegerField;
    dsModuliDesign: TDataSource;
    procedure btAddModuleClick(Sender: TObject);
    procedure btRefreshObjavsDesignerClick(Sender: TObject);
    procedure btEditObjavDesignClick(Sender: TObject);
    procedure btFindDesignerClick(Sender: TObject);
    procedure edDesignerSearchKeyPress(Sender: TObject; var Key: Char);
    procedure cbShowOblogkaClick(Sender: TObject);
    procedure grSdelkaForDesignDblClick(Sender: TObject);
    procedure grSdelkaForDesignDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure grSdelkaForDesignKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{var
  frmDesign: TfrmDesign; }

implementation

uses loadPicture, globals, uChangeObjav, ObjavlenieForm, findSdelka, main,
  dm;

{$R *.dfm}

procedure TfrmDesign.btAddModuleClick(Sender: TObject);
begin
    frmLoadPicture.ShowModal();
end;

procedure TfrmDesign.btRefreshObjavsDesignerClick(Sender: TObject);
begin
  savePos(cdsModuliDesign);
  cdsModuliDesign.Close;
	cdsModuliDesign.Params.ParamByName('GZ_ID').AsInteger := cbGazetaDesign.KeyValue;
  cdsModuliDesign.Open;
  loadPos(cdsModuliDesign);
  
	if (not cbShowOblogka.Checked) then
	begin
		cdsModuliDesign.Filter   := 'RB_IS_OBLOGKA=0';
		cdsModuliDesign.Filtered := true;
	end
	else
		cdsModuliDesign.Filtered := false;
end;

procedure TfrmDesign.btEditObjavDesignClick(Sender: TObject);
begin
    if cdsModuliDesignOB_STATE.AsInteger = OB_STATE_DESIGN then
        TfrmChangeObjav.ChangeObjav(cdsModuliDesignOB_ID.AsInteger, false, nil, grSdelkaForDesign.DataSource.DataSet.Refresh)
    else begin
        TfrmObjavlenie.View(cdsModuliDesignOB_ID.AsInteger, cdsModuliDesignGZ_ID.AsInteger, false);
    end;
end;

procedure TfrmDesign.btFindDesignerClick(Sender: TObject);
begin
    frmFindSdelka.ShowModal(uDesigner);
end;

procedure TfrmDesign.edDesignerSearchKeyPress(Sender: TObject;
  var Key: Char);
begin
	if (Key = #13) then
		    if (cdsModuliDesign.Locate('SD_NUM', edDesignerSearch.Text, []))
        then grSdelkaForDesign.SetFocus;
end;

procedure TfrmDesign.cbShowOblogkaClick(Sender: TObject);
begin
      cdsModuliDesign.Filtered := not (Sender as TDBCheckBoxEh).Checked;
end;

procedure TfrmDesign.grSdelkaForDesignDblClick(Sender: TObject);
begin
    btEditObjavDesign.Click;
end;

procedure TfrmDesign.grSdelkaForDesignDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
    	frmMain.DrawLockCell(Sender, Column, Rect);
	    frmMain.DrawSRCell(Sender, Column, Rect);
end;

procedure TfrmDesign.grSdelkaForDesignKeyPress(Sender: TObject;
  var Key: Char);
begin
	if (Key = #13) then
		btEditObjavDesign.Click;
end;

end.
