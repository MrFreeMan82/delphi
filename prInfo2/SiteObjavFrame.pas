unit SiteObjavFrame;
 // UNIT DEPRECATED
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, SimpleDS, DBClient, Provider, SqlExpr, StdCtrls,
  Mask, DBCtrlsEh, DBLookupEh, ExtCtrls, ComCtrls, DBCtrls, DBGridEh;

type
  TframeSiteObjav = class(TFrame)
	qrySiteObjav: TSQLQuery;
	prvSiteObjav: TDataSetProvider;
	cdsSiteObjav: TClientDataSet;
	dsSiteObjav: TDataSource;
    cdsRubrikaSite: TClientDataSet;
	cdsRubrikaSiteRS_ID: TIntegerField;
	cdsRubrikaSiteRS_NAME: TStringField;
	cdsSiteObjavSITE_OBJAV_ID: TIntegerField;
	cdsSiteObjavRS_ID: TIntegerField;
	cdsSiteObjavSITE_OBJAV_TEXT: TStringField;
	qrySiteObjavSITE_OBJAV_ID: TIntegerField;
	qrySiteObjavRS_ID: TIntegerField;
	qrySiteObjavSITE_OBJAV_TEXT: TStringField;
	dsRubrikaSite: TDataSource;
	Panel1: TPanel;
	DBLookupComboboxEh1: TDBLookupComboboxEh;
	Label1: TLabel;
	spSiteObjavCopy: TSQLStoredProc;
	Panel2: TPanel;
	rchText: TDBRichEdit;
  private
	FReadOnly: boolean;
	FSiteObjavId: integer;
	AddObjavContentLink: boolean;
	procedure SetReadOnly(const Value: boolean);
	procedure SetSiteObjavId(const ASiteObjavId: integer);
	{ Private declarations }
  public
	ContentId: integer;  
	procedure Refresh();
	procedure Save();
	procedure Cancel();
	procedure Edit();
	procedure Add(AContentId: integer);
  published
	property SiteObjavId: integer read FSiteObjavId write SetSiteObjavId;
	property ReadOnly: boolean read FReadOnly write SetReadOnly;
  end;

implementation

uses dm, dmCache;

{$R *.dfm}

{ TframeSiteObjav }

procedure TframeSiteObjav.Add(AContentId: integer);
begin
	SiteObjavId := -1;
	Refresh();

	// при сохранении объявления нужно добавить ссылку
	// на него из OBJAV_CONTENT
	AddObjavContentLink := (AContentId > 0);
	ContentId := AContentId;

	cdsSiteObjav.Insert;
	SiteObjavId := data.nextGeneratorId('G_SITE_OBJAV');
	cdsSiteObjavSITE_OBJAV_ID.AsInteger := SiteObjavId;
end;

procedure TframeSiteObjav.Cancel;
begin
	cdsSiteObjav.Cancel;
	cdsSiteObjav.CancelUpdates();
end;

procedure TframeSiteObjav.Edit;
var
	OldSiteObjavId: integer;
begin
	// при редактировании объявления для сайта мы можем либо
	// отредактировать существующее объявление, либо создать его
	// копию, чтобы не затронуть при этом другие модули, которые
	// могут быть связаны с этим объявлением.

	spSiteObjavCopy.ParamByName('SITE_OBJAV_ID').AsInteger := SiteObjavId;
	spSiteObjavCopy.ExecProc;
	OldSiteObjavId := SiteObjavId;
	SiteObjavId := spSiteObjavCopy.ParamByName('NEW_SITE_OBJAV_ID').AsInteger;

	// обновим ссылку
	if (ContentId > 0) then
		data.executeQuery('UPDATE OBJAV_CONTENT_SITE_OBJAV SET SITE_OBJAV_ID = ' + IntToStr(SiteObjavId)
						  + ' WHERE SITE_OBJAV_ID = ' + IntToStr(OldSiteObjavId)
						  + ' AND CONTENT_ID = ' + IntToStr(ContentId));
	Refresh();
end;

procedure TframeSiteObjav.Refresh;
begin
	if (cdsSiteObjav.Active) then
		cdsSiteObjav.Close;

//	if (not cdsRubrikaSite.Active) then
//		cdsRubrikaSite.Open;
	cdsRubrikaSite.CloneCursor(cacheData.cdsRubrikaSite, true);

	cdsSiteObjav.Params.ParamByName('SITE_OBJAV_ID').AsInteger := SiteObjavId;
	cdsSiteObjav.Open;
end;

procedure TframeSiteObjav.Save;
begin
	cdsSiteObjav.CheckBrowseMode();
	AddObjavContentLink := AddObjavContentLink and (cdsSiteObjav.ChangeCount > 0);
	cdsSiteObjav.ApplyUpdates(-1);

	// добавим ссылку на сайтовое объявление из OBJAV_CONTENT
	if (AddObjavContentLink) then
	begin
		AddObjavContentLink := false;
		data.executeQuery('INSERT INTO OBJAV_CONTENT_SITE_OBJAV (CONTENT_ID,SITE_OBJAV_ID)'
						  + ' VALUES (' + IntToStr(ContentId) + ', ' + IntToStr(SiteObjavId) + ')');
	end;
end;

procedure TframeSiteObjav.SetReadOnly(const Value: boolean);
begin
	FReadOnly := Value;

	cdsSiteObjav.ReadOnly := FReadOnly;
end;

procedure TframeSiteObjav.SetSiteObjavId(const ASiteObjavId: integer);
begin
	FSiteObjavId := ASiteObjavId;
end;

end.
