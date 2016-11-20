unit ContentFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, StdCtrls, Mask,
  DBCtrlsEh, ExtCtrls, Buttons, DBLookupEh, SimpleDS, ComCtrls,
  SiteObjavFrame, Grids, DBGridEh, GridsEh, Menus;

type
  TframeContent = class(TFrame)
	qryContent: TSQLQuery;
    qryContentCONTENT_PICTURE: TBlobField;
    qryContentCONTENT_COREL_PAGE: TStringField;
    qryContentCONTENT_ID: TIntegerField;
    prvContent: TDataSetProvider;
    cdsContent: TClientDataSet;
    cdsContentCONTENT_PICTURE: TBlobField;
    cdsContentCONTENT_COREL_PAGE: TStringField;
    cdsContentCONTENT_ID: TIntegerField;
    dsContent: TDataSource;
    qryContentRB_ID: TIntegerField;
    cdsContentRB_ID: TIntegerField;
    qryContentFM_ID: TIntegerField;
    cdsContentFM_ID: TIntegerField;
    cdsContentFormat: TClientDataSet;
    cdsContentFormatFM_ID: TIntegerField;
    cdsContentFormatFM_NAME: TStringField;
    cdsContentFormatFM_SPACE: TFloatField;
    cdsContentFormatFM_ALWAYS_ADD_SUM: TSmallintField;
    cdsContentFormatFM_HAS_PICTURE: TSmallintField;
    cdsContentFormatFM_PICTURE_SIZES: TStringField;
    dsContentFormat: TDataSource;
    cdsContentLK_RUBRIKA: TStringField;
	cdsContentLK_FORMAT: TStringField;
    PageControl1: TPageControl;
    tabPicture: TTabSheet;
    qrySiteObjavs: TSQLQuery;
    prvSiteObjavs: TDataSetProvider;
    cdsSiteObjavs: TClientDataSet;
    dsSiteObjavs: TDataSource;
    qrySiteObjavsSITE_OBJAV_ID: TIntegerField;
    qrySiteObjavsRS_ID: TIntegerField;
    qrySiteObjavsSITE_OBJAV_TEXT: TStringField;
    qrySiteObjavsRS_NAME: TStringField;
    qrySiteObjavsCONTENT_ID: TIntegerField;
    qryContentCONTENT_SITE_OBJAV_ADDED: TSmallintField;
    cdsContentCONTENT_SITE_OBJAV_ADDED: TSmallintField;
    Panel5: TPanel;
    ScrollBox1: TScrollBox;
	img: TImage;
    shpHider1: TShape;
    Panel1: TPanel;
    shpHider2: TShape;
    cbScale: TDBCheckBoxEh;
    btSave: TBitBtn;
    btPrint: TBitBtn;
    Panel2: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Shape3: TShape;
    Label2: TLabel;
    Shape1: TShape;
    shpHider3: TShape;
    DBEditEh1: TDBEditEh;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Panel4: TPanel;
    Panel3: TPanel;
    Shape2: TShape;
    Label4: TLabel;
    btAddSiteObjav: TBitBtn;
    btEditSiteObjav: TBitBtn;
    btDeleteSiteObjav: TBitBtn;
    DBGridEh1: TDBGridEh;
    Panel6: TPanel;
    DBCheckBoxEh1: TDBCheckBoxEh;
    Shape4: TShape;
    SimpleDataSet1: TSimpleDataSet;
    Label5: TLabel;
    DBNumberEditEh1: TDBNumberEditEh;
    qryContentVAC_COUNT: TSmallintField;
    cdsContentVAC_COUNT: TSmallintField;
    Shape5: TShape;
    qrySiteObjavsSITE_VACANCY_NAME: TStringField;
    qrySiteObjavsSITE_EMAIL: TStringField;
    qrySiteObjavsSITE_TEL: TStringField;
    qrySiteObjavsSITE_CONTACT: TStringField;
    cdsSiteObjavsSITE_EMAIL: TStringField;
    cdsSiteObjavsSITE_TEL: TStringField;
    cdsSiteObjavsSITE_CONTACT: TStringField;
    cdsSiteObjavsSITE_OBJAV_ID: TIntegerField;
    cdsSiteObjavsCONTENT_ID: TIntegerField;
    cdsSiteObjavsRS_ID: TIntegerField;
    cdsSiteObjavsRS_NAME: TStringField;
    cdsSiteObjavsSITE_OBJAV_TEXT: TStringField;
    cdsSiteObjavsSITE_VACANCY_NAME: TStringField;
    cdsSiteObjavsSITE_EMPLOYER: TStringField;
    qrySiteObjavsSITE_EMPLOYER: TStringField;
    popCopy: TPopupMenu;
    N1: TMenuItem;
    cdsContentEXTENSION: TStringField;
    qryContentEXTENSION: TStringField;
    cdsSiteObjavsCU_ADDRESS: TStringField;
    qrySiteObjavsCU_ADDRESS: TStringField;
    N2: TMenuItem;
    spCopySiteObjav: TSQLStoredProc;
    cdsContentRubrika: TClientDataSet;
    dsContentRubrika: TDataSource;
    cdsContentRubrikaRB_ID: TIntegerField;
    cdsContentRubrikaRB_NAME: TStringField;
    cdsContentRubrikaRB_NAME_SHORT: TStringField;
    cdsContentRubrikaRB_COST_COEFF: TFloatField;
    cdsContentRubrikaRB_IS_OBLOGKA: TSmallintField;
    cdsContentRubrikaGZ_ID: TIntegerField;
    cdsContentRubrikaRB_IS_LOCKABLE: TSmallintField;
    procedure cbScaleClick(Sender: TObject);
    procedure DBLookupComboboxEh2Enter(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure btPrintClick(Sender: TObject);
    procedure btAddSiteObjavClick(Sender: TObject);
    procedure btEditSiteObjavClick(Sender: TObject);
    procedure btDeleteSiteObjavClick(Sender: TObject);
	procedure prvContentGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
	FSdelka, FAgent, FCust, FIssue: String;

    FReadOnly: boolean;
    FContentId: integer;
    fgzid:integer;
    procedure SetReadOnly(const Value: boolean);
    procedure SetContentId(const AContentId: integer);
  public
  	procedure Refresh();
    procedure Save();
    procedure Cancel();
    procedure Add();
    procedure SetPrintData(ASdelka, AAgent, ACust, AIssue: String);
    procedure RefreshOrder();
  published
  	property ContentId: integer read FContentId write SetContentId;
    property GZ_ID:integer read fgzid write fgzid;
  	property ReadOnly: boolean read FReadOnly write SetReadOnly;
  end;

implementation

uses dm, globals, ModuleReport, SiteObjavForm, dmCache, uEditSiteObjav,
  main, dmRep;

{$R *.dfm}

procedure TframeContent.cbScaleClick(Sender: TObject);
begin
	if (cbScale.Checked) then
    begin
        img.Stretch := true;
        img.Proportional := true;
        img.Align := alClient;
      	img.AutoSize := false;
    end
    else
    begin
        img.Stretch := false;
        img.Proportional := false;
        img.Align := alNone;
    	img.AutoSize := true;
    end;
end;

procedure TframeContent.Save;
begin
 { if frmmain.currentUserType = PRG_USR_NABOR then
  begin
       if not (cdsContent.State in [dsEdit, dsInsert]) then cdsContent.Edit;

       cdsContentCONTENT_SITE_OBJAV_ADDED.AsInteger := 1;
  end; }
	cdsContent.CheckBrowseMode();
	cdsContent.ApplyUpdates(0);
end;

procedure TframeContent.SetReadOnly(const Value: boolean);
begin
	FReadOnly := Value;

	cdsContent.ReadOnly			:= FReadOnly;

 //	btAddSiteObjav.Enabled		:= not FreadOnly;
 //	btEditSiteObjav.Enabled		:= not FreadOnly;
	btDeleteSiteObjav.Enabled	:= not FreadOnly;


end;

procedure TframeContent.Cancel;
begin
	cdsContent.Cancel;
	cdsContent.CancelUpdates();
end;

procedure TframeContent.SetContentId(const AContentId: integer);
begin
	FContentId := AContentId;
end;

procedure TframeContent.Add;
begin
	ContentId := -1;
	Refresh();

	cdsContent.Insert;
	ContentId := data.nextGeneratorId('G_OBJAV_CONTENT_ID');
	cdsContentCONTENT_ID.AsInteger := ContentId;
  cdsContentVAC_COUNT.AsInteger := 0;
end;

procedure TframeContent.Refresh;
var ext:string;
begin
	if (cdsContent.Active) then
		cdsContent.Close;

	cdsContent.Params.ParamByName('CONTENT_ID').AsInteger := ContentId;
	cdsContent.Open;

//	if (not cdsContentFormat.Active) then
//		cdsContentFormat.Open;
     cdsContentFormat.CloneCursor(cacheData.cdsFormat, true);

	if (cdsSiteObjavs.Active) then
		cdsSiteObjavs.Close;

  cdsSiteObjavs.Close;
  cdsSiteObjavs.FetchParams;
	cdsSiteObjavs.Params.ParamByName('CONTENT_ID').AsInteger := ContentId;
	cdsSiteObjavs.Open;

  cdsContentRubrika.CloneCursor(cacheData.cdsRubrika, true);
  cdsContentRubrika.Filter := 'GZ_ID=' + IntToStr(fgzid);
  cdsContentRubrika.Filtered := true;
  
	if (not cdsContent.IsEmpty) and not cdsContentCONTENT_PICTURE.IsNull then
	begin
//  ToDo: В связи с изменением формата хранения картинок нужно
//  заменить эту процедуру
    ext := trim(cdsContentEXTENSION.AsString);
 		PictureFromCompressedFieldNew(img.Picture,cdsContentCONTENT_PICTURE, ext, false);

		shpHider1.Visible := false;
		shpHider2.Visible := false;
		shpHider3.Visible := false;
	end
	else
	begin
		shpHider1.Visible := true;
		shpHider2.Visible := true;
		shpHider3.Visible := true;
	end;
end;

procedure TframeContent.DBLookupComboboxEh2Enter(Sender: TObject);
begin
	(Sender as TDBLookupComboBoxEh).DropDown;
end;

procedure TframeContent.btSaveClick(Sender: TObject);
var
	dlg: TSaveDialog;
begin
	dlg := nil;

	try
		dlg := TSaveDialog.Create(nil);
		dlg.DefaultExt := 'tiff';
    dlg.Filter := 'TIFF(*.tiff)|*.tiff';
		dlg.FileName   := 'БезИмени';
		if (dlg.Execute) then
    begin
	        if (cdsContent.Active and (not cdsContent.IsEmpty)) then
          begin
                if cdsContentEXTENSION.AsString = 'eps' then
                begin
                    epsToFile(cdsContentCONTENT_PICTURE, dlg.FileName);
                end
                else FileFromCompressedField(cdsContentCONTENT_PICTURE, dlg.FileName)
        end
        else
		        MessageDlg('Модуль не загружен.',mtError,[mbOk],0);
    end

  finally
    	freeAndNil(dlg);
  end;
end;

procedure TframeContent.btPrintClick(Sender: TObject);
begin
  if (cdsContent.Active and (not cdsContent.IsEmpty)) then
          repData.PreviewRave(cdsContentCONTENT_PICTURE
            				  , FSdelka, FAgent, FCust
                              , cdsContentLK_FORMAT.AsString
                              , cdsContentLK_RUBRIKA.AsString
                              , cdsContentCONTENT_COREL_PAGE.AsString
                              , FIssue
                              , trim(cdsContentEXTENSION.AsString))
  else
    	MessageDlg('Модуль не загружен.',mtError,[mbOk],0);
end;

procedure TframeContent.SetPrintData(ASdelka, AAgent, ACust, AIssue: String);
begin
	FSdelka	 := ASdelka;
    FAgent	 := AAgent;
    FCust	 := ACust;
    FIssue   := AIssue;
    if frmMain.currentUserType = 5 then
    begin
       btDeleteSiteObjav.Enabled := true;
      // btAddSiteObjav.Enabled := true;
    end
    else begin
       btDeleteSiteObjav.Enabled := false;
     //  btAddSiteObjav.Enabled := false;
    end;
end;

procedure TframeContent.RefreshOrder;
begin
	cdsSiteObjavs.Close;
	cdsSiteObjavs.Open;
end;

procedure TframeContent.btAddSiteObjavClick(Sender: TObject);
var Point:TPoint;
    Objav:TObjav;
begin
  if (frmMain.pages.ActivePage = frmMain.tabSiteObjav) or (frmMain.currentUserType = 3) then
  begin
     Point.X := self.ClientOrigin.X + img.Width + 12;
     Point.Y := self.ClientOrigin.Y;

     Objav.ob_text := cdsSiteObjavsSITE_OBJAV_TEXT.AsString;
     Objav.ob_employer := cdsSiteObjavsSITE_EMPLOYER.AsString;
     Objav.ob_tel := cdsSiteObjavsSITE_TEL.AsString;
     Objav.ob_email := cdsSiteObjavsSITE_EMAIL.AsString;
     Objav.ob_contact := cdsSiteObjavsSITE_CONTACT.AsString;
     Objav.ob_address := cdsSiteObjavsCU_ADDRESS.AsString;
     TfrmEditSiteObjav.AddSiteObjav(Point, ContentId, GZ_ID,  1, Objav, RefreshOrder);
  end
end;

procedure TframeContent.btEditSiteObjavClick(Sender: TObject);
var Point: TPoint;
begin
  if  not (frmMain.currentUserType in [2, 5]) then
  begin
       Point.X := 0;
       Point.Y := 0;

       TfrmEditSiteObjav.ViewSiteObjav(cdsSiteObjavsSITE_OBJAV_ID.AsInteger, cdsSiteObjavsCONTENT_ID.AsInteger);
  end
  else //if frmMain.pages.ActivePage = frmMain.tabSiteObjav then
  begin
     Point.X := self.ClientOrigin.X + img.Width + 12;
     Point.Y := self.ClientOrigin.Y;

     TfrmEditSiteObjav.EditSiteObjav(Point, cdsSiteObjavsSITE_OBJAV_ID.AsInteger, GZ_ID, 1, RefreshOrder);
  end
end;

procedure TframeContent.btDeleteSiteObjavClick(Sender: TObject);
begin
 cdsSiteObjavs.Delete;
 cdsSiteObjavs.CheckBrowseMode;
 cdsSiteObjavs.ApplyUpdates(0);
 cdsSiteObjavs.Refresh;
end;

procedure TframeContent.prvContentGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
	TableName := 'OBJAV_CONTENT';
end;

procedure TframeContent.N1Click(Sender: TObject);
var rn,i: integer;
begin
     if DBGridEh1.DataSource.DataSet.IsEmpty then exit;
     arrCopySiteObjav := nil;
     SetLength(arrCopySiteObjav, DBGridEh1.SelectedRows.Count);

     rn := DBGridEh1.DataSource.DataSet.RecNo;
     DBGridEh1.DataSource.DataSet.DisableControls;
     DBGridEh1.DataSource.DataSet.First;

     i := 0;
     while not DBGridEh1.DataSource.DataSet.Eof do
     begin
          if DBGridEh1.SelectedRows.CurrentRowSelected then
          begin
               arrCopySiteObjav[i].site_objav_id := cdsSiteObjavsSITE_OBJAV_ID.AsInteger;
               inc(i);
          end;

          DBGridEh1.DataSource.DataSet.Next;
     end;
     DBGridEh1.DataSource.DataSet.EnableControls;
     DBGridEh1.DataSource.DataSet.RecNo := rn;
end;

procedure TframeContent.N2Click(Sender: TObject);
var i:integer;
begin
    if not assigned(arrCopySiteObjav) then exit;

    for i := 0 to length(arrCopySiteObjav) - 1 do
    begin
	      spCopySiteObjav.ParamByName('SITE_OBJAV_ID_FROM').AsInteger := arrCopySiteObjav[i].site_objav_id;
	      spCopySiteObjav.ParamByName('CONTENT_ID_TO').AsInteger := cdsContentCONTENT_ID.AsInteger;
	      spCopySiteObjav.ExecProc;
    end;
    cdsSiteObjavs.Close;
    cdsSiteObjavs.Open;
end;

end.
