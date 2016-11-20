unit uEditSiteObjav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, DBCtrls, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,
  ComCtrls, Buttons, FMTBcd, DB, DBClient, Provider, SqlExpr,uEditSiteObjavOrder,
  AppEvnts;

type TCallBack = procedure of object;

type TObjav =record
    rs_id:integer;
    ob_text, ob_employer, ob_tel, ob_email, ob_contact, ob_address : string;
end;

type
  TfrmEditSiteObjav = class(TForm)
    cbRubrikaSite: TDBLookupComboboxEh;
    Label2: TLabel;
    Label1: TLabel;
    dbVacancy: TDBEdit;
    dbZP: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    dbEmployer: TDBEdit;
    Label5: TLabel;
    dbEmail: TDBEdit;
    dbTel: TDBEdit;
    Label6: TLabel;
    rchText: TDBRichEdit;
    Label7: TLabel;
    qrySiteObjavs: TSQLQuery;
    prvSiteObjavs: TDataSetProvider;
    cdsSiteObjavs: TClientDataSet;
    cdsSiteObjavsSITE_OBJAV_ID: TIntegerField;
    cdsSiteObjavsRS_ID: TIntegerField;
    dsSiteObjavs: TDataSource;
    cdsSiteObjavsSITE_VACANCY_NAME: TStringField;
    cdsSiteObjavsSITE_EMAIL: TStringField;
    cdsSiteObjavsSITE_TEL: TStringField;
    cdsSiteObjavsSITE_CONTACT: TStringField;
    cdsSiteObjavsSITE_DONT_UPLOAD: TSmallintField;
    dsRubrikaSite: TDataSource;
    cdsRubrikaSite: TClientDataSet;
    cdsRubrikaSiteRS_ID: TIntegerField;
    cdsRubrikaSiteRS_NAME: TStringField;
    btDone: TBitBtn;
    btCancelAg: TBitBtn;
    cdsSiteObjavsSITE_OBJAV_TEXT: TStringField;
    cdsSiteObjavsSITE_ZP: TIntegerField;
    Label8: TLabel;
    dbContact: TDBEdit;
    cdsSiteObjavsSITE_EMPLOYER: TStringField;
    cdsSiteObjavsCONTENT_ID: TIntegerField;
    cdsSiteObjavsOB_ID: TIntegerField;
    Label9: TLabel;
    cbExp: TDBLookupComboboxEh;
    Label10: TLabel;
    cbEdu: TDBLookupComboboxEh;
    Label11: TLabel;
    cbCity: TDBLookupComboboxEh;
    qExp: TSQLQuery;
    qEdu: TSQLQuery;
    qCity: TSQLQuery;
    cdsExp: TClientDataSet;
    cdsEdu: TClientDataSet;
    cdsCity: TClientDataSet;
    prvExp: TDataSetProvider;
    prvEdu: TDataSetProvider;
    prvCity: TDataSetProvider;
    dsExp: TDataSource;
    dsEdu: TDataSource;
    dsCity: TDataSource;
    cdsExpEX_ID: TIntegerField;
    cdsExpEX_NAME: TStringField;
    cdsEduED_ID: TIntegerField;
    cdsEduED_NAME: TStringField;
    cdsCityC_ID: TIntegerField;
    cdsCityC_NAME: TStringField;
    cdsCityORDERBY: TIntegerField;
    cdsSiteObjavsEX_ID: TIntegerField;
    cdsSiteObjavsED_ID: TIntegerField;
    cdsSiteObjavsC_ID: TIntegerField;
    ApEvents: TApplicationEvents;
    cdsSiteObjavsIS_ID: TIntegerField;
    qCurrIssue: TSQLQuery;
    qCurrIssueIS_ID: TIntegerField;
    Label12: TLabel;
    dbAddress: TDBEdit;
    cdsSiteObjavsCU_ADDRESS: TStringField;
    procedure btDoneClick(Sender: TObject);
    procedure btCancelAgClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rchTextMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbVacancyDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbVacancyDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure cdsSiteObjavsSITE_VACANCY_NAMESetText(Sender: TField;
      const Text: String);
    procedure cbCityNotInList(Sender: TObject; NewText: String;
      var RecheckInList: Boolean);
    procedure cbCityKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ApEventsMessage(var Msg: tagMSG; var Handled: Boolean);
  private
    { Private declarations }
    fob_type:integer;    // 0 - text; 1 - module
    fCallBack: TCallBack;
    fViewMode:boolean;
    fmaxCityID:integer;
    fgzid:integer;
    freadOnly: boolean;

    function UpCaseFirstLetter(const s: string): string;
    procedure SetUnsetReadOnly(Value:boolean);
    procedure OpenQry(site_objav_id:integer);
    function MaxCityID():integer;
  public
    { Public declarations }
    class procedure AddSiteObjav(Position: TPoint; content_id, gz_id:integer; ob_type: integer; Objav:Tobjav; CallBack: TCallBack);
    class procedure EditSiteObjav(Position: TPoint; site_objav_id, gz_id:integer; ob_type: integer; CallBack: TCallBack);
    class procedure MergeSiteObjav(Position: TPoint; site_objav_id, gz_id, content_id, ob_type: integer; Objav:Tobjav; readOnly: boolean);
    class procedure ViewSiteObjav(site_objav_id, content_id:integer);
  end;

implementation

uses dm, dmCache, main, ContentForm,StrUtils;

{$R *.dfm}

{ TfrmEditSiteObjav }

procedure TfrmEditSiteObjav.OpenQry(site_objav_id:integer);
begin
       cdsRubrikaSite.CloneCursor(cacheData.cdsRubrikaSite, true);

       qCurrIssue.Close;
       qCurrIssue.ParamByName('gz_id').AsInteger := fgzid;
       qCurrIssue.Open;

       cdsSiteObjavs.Close;
       cdsSiteObjavs.FetchParams;
       cdsSiteObjavs.Params.ParamByName('site_objav_id').AsInteger := site_objav_id;
       cdsSiteObjavs.Open;

       cdsExp.Open;
       cdsEdu.Open;
       cdsCity.Open;
       fmaxCityID := MaxCityID();

       cbCity.KeyValue := 1;
       cbExp.KeyValue := 1;
       cbEdu.KeyValue := 6;
end;

class procedure TfrmEditSiteObjav.ViewSiteObjav(site_objav_id, content_id: integer);
var frmEditSiteObjav: TfrmEditSiteObjav;
begin
    frmEditSiteObjav := TfrmEditSiteObjav.Create(Application);
    with frmEditSiteObjav do
    begin
       fViewMode := true;

       OpenQry(site_objav_id);

       Position := poMainFormCenter;
       SetUnsetReadOnly(true);

       Show
    end;
end;

class procedure TfrmEditSiteObjav.AddSiteObjav(Position: TPoint; content_id, gz_id: integer; ob_type: integer; Objav:Tobjav; CallBack: TCallBack);
var
  frmEditSiteObjav: TfrmEditSiteObjav;
begin
    frmEditSiteObjav := TfrmEditSiteObjav.Create(Application);
    with frmEditSiteObjav do
    begin
        fViewMode := false;
        fob_type := ob_type;
        fCallBack := CallBack;
        fgzid := gz_id;

        OpenQry(-1);

        cdsSiteObjavs.Edit;
        cdsSiteObjavsSITE_OBJAV_ID.AsInteger :=  data.nextGeneratorId('G_SITE_OBJAV');

        if ob_type = 1 then
            cdsSiteObjavsCONTENT_ID.AsInteger := content_id
        else
            cdsSiteObjavsOB_ID.AsInteger := content_id;

        cdsSiteObjavsIS_ID.AsInteger := qCurrIssueIS_ID.AsInteger;
        cdsSiteObjavsSITE_OBJAV_TEXT.Value := Objav.ob_text;
        cdsSiteObjavsSITE_EMAIL.AsString := Objav.ob_email;
        cdsSiteObjavsSITE_TEL.AsString := Objav.ob_tel;
        cdsSiteObjavsSITE_EMPLOYER.AsString := Objav.ob_employer;
        cdsSiteObjavsSITE_CONTACT.AsString := Objav.ob_contact;
        cdsSiteObjavsCU_ADDRESS.AsString := objav.ob_address;
    end;
    if (Position.X = 0) and (Position.Y = 0) then frmEditSiteObjav.Position := poMainFormCenter
    else begin
        frmEditSiteObjav.Left := Position.X;
        frmEditSiteObjav.Top  := Position.Y;
    end;

    frmEditSiteObjav.Show;
end;

class procedure TfrmEditSiteObjav.EditSiteObjav(Position: TPoint; site_objav_id, gz_id, ob_type: integer; CallBack: TCallBack);
var
  frmEditSiteObjav: TfrmEditSiteObjav;
begin
    frmEditSiteObjav := TfrmEditSiteObjav.Create(Application);
    with frmEditSiteObjav do
    begin
        fViewMode := false;
        fob_type := ob_type;
        fCallBack := CallBack;
        fgzid := gz_id;
        OpenQry(site_objav_id);
    end;

    if (Position.X = 0) and (Position.Y = 0) then frmEditSiteObjav.Position := poMainFormCenter
    else begin
        frmEditSiteObjav.Left := Position.X;
        frmEditSiteObjav.Top  := Position.Y;
    end;

    frmEditSiteObjav.Show;
end;

class procedure TfrmEditSiteObjav.MergeSiteObjav(Position: TPoint; site_objav_id, gz_id, content_id, ob_type: integer; Objav:Tobjav; readOnly: boolean);
var
  frmEditSiteObjav: TfrmEditSiteObjav;
begin
     frmEditSiteObjav := TfrmEditSiteObjav.Create(Application);
     with  frmEditSiteObjav do
     begin
          fViewMode := false;
          fob_type := ob_type;
          fCallBack := nil;
          fgzid := gz_id;
          freadOnly := readOnly;

          SetUnsetReadOnly(freadOnly);

          OpenQry(site_objav_id);

          cdsSiteObjavs.Edit;

          if cdsSiteObjavsSITE_OBJAV_ID.IsNull then
              cdsSiteObjavsSITE_OBJAV_ID.AsInteger :=  data.nextGeneratorId('G_SITE_OBJAV');

          if cdsSiteObjavsIS_ID.AsInteger <> qCurrIssueIS_ID.AsInteger then
                      cdsSiteObjavsIS_ID.AsInteger := qCurrIssueIS_ID.AsInteger;
                      
          if ob_type = 1 then
                cdsSiteObjavsCONTENT_ID.AsInteger := content_id
          else
                cdsSiteObjavsOB_ID.AsInteger := content_id;

          if Objav.rs_id > 0 then cdsSiteObjavsRS_ID.AsInteger := Objav.rs_id;
          if (objav.ob_email <> '') and (cdsSiteObjavsSITE_EMAIL.AsString = '')
          then cdsSiteObjavsSITE_EMAIL.AsString := objav.ob_email; 
     end;

     if (Position.X = 0) and (Position.Y = 0) then frmEditSiteObjav.Position := poMainFormCenter
     else begin
             frmEditSiteObjav.Left := Position.X;
             frmEditSiteObjav.Top  := Position.Y;
     end;

     frmEditSiteObjav.Show;
end;

procedure TfrmEditSiteObjav.btDoneClick(Sender: TObject);
begin
    if fViewMode then
    begin
       Close;
       Exit;
    end;

    data.connection.StartTransaction(tr);
    try
        cdsCity.CheckBrowseMode;
        cdsCity.ApplyUpdates(0);
        
        cdsSiteObjavs.CheckBrowseMode;
        cdsSiteObjavs.ApplyUpdates(0);

        data.connection.Commit(tr);
        if Assigned(fCallBack) then fCallBack();
    except
        data.connection.Rollback(tr);
        raise;
    end;
    Close;
end;

procedure TfrmEditSiteObjav.btCancelAgClick(Sender: TObject);
begin
    if cdsSiteObjavs.State in [dsEdit, dsInsert] then cdsSiteObjavs.Cancel;
    Close;
end;

procedure TfrmEditSiteObjav.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmEditSiteObjav.rchTextMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var s,l:integer;
begin
   if (rchText.SelText <> '') then
   begin
       s := rchText.SelStart;
       l := rchText.SelLength;
       rchText.BeginDrag(false);
       rchText.SelStart := s;
       rchText.SelLength := l;
   end;
end;

procedure TfrmEditSiteObjav.dbVacancyDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
    Accept := (Source is TDBRichEdit);
end;

procedure TfrmEditSiteObjav.dbVacancyDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
    if not (cdsSiteObjavs.State in [dsEdit, dsInsert]) then cdsSiteObjavs.Edit;
    try
        case TDBEdit(Sender).Tag of
           0: cdsSiteObjavsSITE_VACANCY_NAME.AsString := UpCaseFirstLetter(Trim(rchText.SelText));  // Vacancy
           1: cdsSiteObjavsSITE_ZP.AsInteger := StrToInt(Trim(rchText.SelText));
           2: cdsSiteObjavsSITE_EMPLOYER.AsString := Trim(rchText.SelText);
           3: cdsSiteObjavsSITE_EMAIL.AsString := Trim(rchText.SelText);
           4: cdsSiteObjavsSITE_TEL.AsString := Trim(rchText.SelText);
           5: cdsSiteObjavsSITE_CONTACT.AsString := Trim(rchText.SelText);
           6: cdsSiteObjavsCU_ADDRESS.AsString := trim(rchText.SelText);
        end;
    finally
        rchText.EndDrag(true);
    end;
end;

function TfrmEditSiteObjav.UpCaseFirstLetter(const s: string): string;
begin
   result := '';
   if s = '' then exit;

   result := AnsiUpperCase(s[1]) + RightStr(s, length(s) - 1);
end;

procedure TfrmEditSiteObjav.cdsSiteObjavsSITE_VACANCY_NAMESetText(Sender: TField; const Text: String);
begin
    Sender.AsString := UpCaseFirstLetter(Trim(Text));
end;

procedure TfrmEditSiteObjav.SetUnsetReadOnly(Value: boolean);
begin
    cbRubrikaSite.ReadOnly := Value;
    dbVacancy.ReadOnly     := Value;
    dbZP.ReadOnly          := Value;
    dbEmployer.ReadOnly    := Value;
    dbEmail.ReadOnly       := Value;
    dbTel.ReadOnly         := Value;
    rchText.ReadOnly       := Value;
    dbContact.ReadOnly     := Value;
    cbExp.ReadOnly         := Value;
    cbEdu.ReadOnly         := Value;
    cbCity.ReadOnly        := Value;
end;

procedure TfrmEditSiteObjav.cbCityNotInList(Sender: TObject; NewText: String; var RecheckInList: Boolean);
begin
    if RecheckInList and cdsCity.Locate('C_NAME', newText, []) then exit;
    
    inc(fMaxCityID);
    cdsCity.Insert;
    cdsCityC_ID.AsInteger :=  fMaxCityId;
    cdsCityC_NAME.AsString := UpCaseFirstLetter(trim(newText));
    cdsCity.Post;

    cbCity.KeyValue := fMaxCityID;
end;

function TfrmEditSiteObjav.MaxCityID: integer;
var k:integer;
begin
     result := 0;
     if not cdsCity.Active then exit;

     k := cdsCity.RecNo;
     cdsCity.First;
     while not cdsCity.Eof do
     begin
          if cdsCityC_ID.AsInteger > result then result := cdsCityC_ID.AsInteger;
          cdsCity.Next;
     end;
     cdsCity.RecNo := k;
end;

procedure TfrmEditSiteObjav.cbCityKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var RecheckInList:boolean;
begin
    if Key in [VK_RETURN, VK_TAB]then
    begin
         RecheckInList := true;
         cbCityNotInList(Sender, cbCity.Text, RecheckInList);
         if key = VK_RETURN then selectNext(cbCity, true, true)
    end;
end;

procedure TfrmEditSiteObjav.ApEventsMessage(var Msg: tagMSG; var Handled: Boolean);
var key: word;
begin
    if cbCity.Focused and (Msg.message = WM_KEYDOWN) and (Msg.wParam = VK_TAB) then
    begin
         key := VK_TAB;
         cbCityKeyDown(ApEvents, key, []);
    end;
end;

end.
