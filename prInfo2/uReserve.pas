unit uReserve;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, FMTBcd, DB, DBClient, Provider,
  SqlExpr, DBGridEh, Mask, DBCtrlsEh, DBLookupEh, uCover;

type
  TfrmReserve = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    qUsr: TSQLQuery;
    qReserveRecord: TSQLQuery;
    qUsrUS_NAME: TStringField;
    qAgent: TSQLQuery;
    prvAgent: TDataSetProvider;
    cdsAgent: TClientDataSet;
    dsAgent: TDataSource;
    qAgentAG_ID: TIntegerField;
    qAgentAG_NAME: TStringField;
    cdsAgentAG_ID: TIntegerField;
    cdsAgentAG_NAME: TStringField;
    cbAgent: TDBLookupComboboxEh;
    Label4: TLabel;
    txtIssues: TEdit;
    dsReserveRecord: TDataSource;
    prvReserveRecord: TDataSetProvider;
    cdsReserveRecord: TClientDataSet;
    qReserveRecordRR_ID: TIntegerField;
    qReserveRecordUS_ID: TIntegerField;
    qReserveRecordAG_ID: TIntegerField;
    qReserveRecordCOMMENT: TStringField;
    cdsReserveRecordRR_ID: TIntegerField;
    cdsReserveRecordUS_ID: TIntegerField;
    cdsReserveRecordAG_ID: TIntegerField;
    cdsReserveRecordCOMMENT: TStringField;
    txtComment: TDBEdit;
    lblUser: TDBText;
    dsUsr: TDataSource;
    qReserveRecordRM_ID: TIntegerField;
    cdsReserveRecordRM_ID: TIntegerField;
    qDeleteRR: TSQLQuery;
    procedure btnReserveClick(Sender: TObject);
    procedure UnReserveOKClick(Sender:TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    us_id:integer;
    localMap: TMap;
    frmCover: TfrmCover;
    isNew:boolean;

    function canReserve(issue:string):boolean;
    function getNums(str:string):TStringList;
  public
    { Public declarations }
    class function Reserve(frmCover: TfrmCover;us_id:integer): TModalResult;
    class function EditReserve(frmCover: TfrmCover; us_id:integer):TModalResult;
    class function UnReserve(frmCover: TfrmCover; us_id:integer):TModalResult;
  end;

implementation

uses dm, main;

{$R *.dfm}

{ TfrmReserve }

class function TfrmReserve.UnReserve(frmCover: TfrmCover; us_id: integer): TModalResult;
var
  frmReserve: TfrmReserve;
begin
     frmReserve := TfrmReserve.Create(Application);
     frmReserve.Caption := 'Снять резерв';
     frmReserve.localMap := frmCover.map;
     frmReserve.isNew := false;
     frmReserve.us_id := us_id;
     frmReserve.frmCover := frmCover;
     frmReserve.cbAgent.Enabled := false;
     frmReserve.txtComment.Enabled := false;

     frmReserve.qUsr.ParamByName('us_id').AsInteger := us_id;
     frmReserve.qUsr.Open;

     frmReserve.cdsAgent.FetchParams;
     frmReserve.cdsAgent.Params.ParamByName('us_id').AsInteger := us_id;
     frmReserve.cdsAgent.Open;

     frmReserve.cdsReserveRecord.FetchParams;
     frmReserve.cdsReserveRecord.Params.ParamByName('id').AsInteger := frmCover.getRR_ID;
     frmReserve.cdsReserveRecord.Open;

     frmReserve.txtIssues.Text := frmCover.cdsIssueIS_NAME.AsString;
     frmReserve.btnOK.OnClick := frmReserve.UnReserveOKClick;

     result := frmReserve.ShowModal;

     freeAndNil(frmReserve);
end;

class function TfrmReserve.EditReserve(frmCover: TfrmCover; us_id: integer): TModalResult;
var
  frmReserve: TfrmReserve;
begin
     frmReserve := TfrmReserve.Create(Application);

     frmReserve.Caption := 'Изменить';
     frmReserve.localMap := frmCover.map;
     frmReserve.isNew := false;
     frmReserve.us_id := us_id;
     frmReserve.frmCover := frmCover;

     frmReserve.qUsr.ParamByName('us_id').AsInteger := us_id;
     frmReserve.qUsr.Open;

     frmReserve.cdsAgent.FetchParams;
     frmReserve.cdsAgent.Params.ParamByName('us_id').AsInteger := us_id;
     frmReserve.cdsAgent.Open;

     frmReserve.cdsReserveRecord.FetchParams;
     frmReserve.cdsReserveRecord.Params.ParamByName('id').AsInteger := frmCover.getRR_ID;
     frmReserve.cdsReserveRecord.Open;
     frmReserve.cdsReserveRecord.Edit;

     frmReserve.txtIssues.Text := frmCover.cdsIssueIS_NAME.AsString;

     result := frmReserve.ShowModal;

     freeAndNil(frmReserve)
end;

class function TfrmReserve.Reserve(frmCover: TfrmCover; us_id: integer): TModalResult;
var
  frmReserve: TfrmReserve;
begin
     frmReserve := TfrmReserve.Create(Application);

     frmReserve.localMap := frmCover.map;
     frmReserve.isNew := true;
     frmReserve.us_id := us_id;
     frmReserve.frmCover := frmCover;

     frmReserve.qUsr.ParamByName('us_id').AsInteger := us_id;
     frmReserve.qUsr.Open;

     frmReserve.cdsAgent.FetchParams;
     frmReserve.cdsAgent.Params.ParamByName('us_id').AsInteger := us_id;
     frmReserve.cdsAgent.Open;
     frmReserve.cbAgent.KeyValue := frmReserve.cdsAgentAG_ID.AsInteger;

     frmReserve.cdsReserveRecord.FetchParams;
     frmReserve.cdsReserveRecord.Params.ParamByName('id').AsInteger := -1;
     frmReserve.cdsReserveRecord.Open;
     frmReserve.cdsReserveRecord.Insert;
     frmReserve.cdsReserveRecordAG_ID.AsInteger := frmReserve.cdsAgentAG_ID.AsInteger;

     frmReserve.txtIssues.Text := frmCover.cdsIssueIS_NAME.AsString;

     result := frmReserve.ShowModal;

     freeAndNil(frmReserve)
end;

procedure TfrmReserve.btnReserveClick(Sender: TObject);
var i:integer;
    issueList: TStringList;
    oldRecNo:integer;
    ag_id:integer;
    comment:string;
begin
    self.Hide;
    issueList := getNums(trim(txtIssues.Text));

    oldRecNo := frmCover.cdsIssue.RecNo;
    try
        frmCover.EnableDraw := false;
        ag_id := cdsAgentAG_ID.AsInteger;
        comment := cdsReserveRecordCOMMENT.AsString;
        cdsReserveRecord.Cancel;
                                                           //42,43-45
        for i := 0 to issueList.Count - 1 do
        begin
            if not frmCover.cdsIssue.Locate('IS_NAME', issueList.Strings[i], []) then continue;

            frmCover.showPage();
            frmCover.selectByMap(localMap);

            if isNew then
            begin
                 cdsReserveRecord.Insert;
                 cdsReserveRecordRR_ID.AsInteger := data.nextGeneratorId('GEN_RESERVE_RECORD_ID');
            end
            else begin
                cdsReserveRecord.Close;
                cdsReserveRecord.Params.ParamByName('id').AsInteger := frmCover.getRR_ID;
                cdsReserveRecord.Open;
                cdsReserveRecord.Edit;
            end;

            cdsReserveRecordUS_ID.AsInteger := us_id;
            cdsReserveRecordAG_ID.AsInteger := ag_id;
            cdsReserveRecordRM_ID.AsInteger := frmCover.reserveMapID;
            cdsReserveRecordCOMMENT.AsString := comment;

            if canReserve(issueList.Strings[i]) then
            begin
                frmCover.setNewRRID(cdsReserveRecordRR_ID.AsInteger);
                cdsReserveRecord.Post;
                cdsReserveRecord.ApplyUpdates(0);

                frmCover.SaveMap();
            end
            else cdsReserveRecord.Cancel;
        end;

     finally
        frmCover.cdsIssue.RecNo := oldRecNo;
        frmCover.EnableDraw := true;
        freeAndNil(issueList);
     end
end;

function TfrmReserve.canReserve(issue: string): boolean;
var i:integer;
begin
     result := false;

     for i := 0 to length(localMap) - 1 do
     if (stSelected in localMap[i].status) then
     begin
            // Если разные пользователи
         if (stReserved in frmCover.map[i].status) and (frmCover.map[i].us_id <> localMap[i].us_id) then
         begin
              frmCover.ErrorIssues := issue;
              exit;
         end;

              // Если разные форматы модулей
         if (frmCover.map[i].rect.Left <> localMap[i].rect.Left) or
            (frmCover.map[i].rect.Top <> localMap[i].rect.Top) or
            (frmCover.map[i].rect.Right <> localMap[i].rect.Right) or
            (frmCover.map[i].rect.Bottom <> localMap[i].rect.Bottom) then
         begin
            frmCover.ErrorIssues := issue;
            exit;
         end;

     end;
     result := true;
end;

function TfrmReserve.getNums(str: string): TStringList;
var list: TStringList;
    f,s:integer;
begin
    result := TSTringList.Create;
    if pos('-', str) > 0 then
    begin
        list := TStringList.Create;
        list.Delimiter := '-';
        list.DelimitedText := str;
        f := strToInt(list.Strings[0]);
        s := strToInt(list.Strings[list.Count - 1]);

        while f <= s do
        begin
            result.Append(intToStr(f));

            inc(f);
        end;
        list.Free;
    end
    else if pos(',', str) > 0 then
    begin
         result.Delimiter := ',';
         result.DelimitedText := str;
    end
    else result.Text := str;
end;

procedure TfrmReserve.btnCancelClick(Sender: TObject);
begin
    cdsReserveRecord.Cancel;
end;

procedure TfrmReserve.UnReserveOKClick(Sender: TObject);
var i,j,id:integer;
    oldRecNo:integer;
    issList:TStringList;
begin
     oldRecNo := frmCover.cdsIssue.RecNo;

     issList := getNums(trim(txtIssues.Text));
     frmCover.EnableDraw := false;

     for j := 0 to issList.Count - 1 do
     begin
          if not frmCover.cdsIssue.Locate('IS_NAME', issList.Strings[j], []) then continue;

          frmCover.showPage();
          frmCover.selectByMap(localMap);

          if canReserve(issList.Strings[j]) then
          begin
                id := -1;
                for i := 0 to length(localMap) - 1 do
                begin
                    if stSelected in localMap[i].status then id := frmCover.map[i].rr_id;

                    if (id = frmCover.map[i].rr_id) then
                    begin
                         exclude(frmCover.map[i].status, stReserved);
                         frmCover.map[i].rr_id := 0;
                    end;
                end;

                qDeleteRR.ParamByName('id').AsInteger := id;
                qDeleteRR.ExecSQL();

                frmCover.SaveMap();
          end;
     end;

     frmCover.cdsIssue.RecNo := oldRecNo;
     frmCover.EnableDraw := true;
     freeAndNil(issList);
end;

end.
