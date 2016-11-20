unit uMdlText;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Menus, Buttons, DBCtrls, DB,
  FMTBcd, SqlExpr;

type
  TfrmMdlText = class(TForm)
    Panel1: TPanel;
    popCopy: TPopupMenu;
    nCopy: TMenuItem;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    txtMdlTxt: TDBRichEdit;
    nPaste: TMenuItem;
    qSave: TSQLQuery;
    btAddMdl: TBitBtn;
    qSd_num: TSQLQuery;
    procedure nCopyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure nPasteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btAddMdlClick(Sender: TObject);
  private
    { Private declarations }
    oldText:string;
    ob_state_txt:integer;
    fob_id: integer;
    fgz_id: integer;
    procedure setReadOnly(userType:integer);
    procedure save_state(same_code, pd_id: integer);overload;
    procedure save_state(objav_id:integer);overload;

  public
    { Public declarations }
    procedure save(same_code, pd_id: integer);overload;
    procedure save(objav_id:integer);overload;
    property ob_id: integer read fob_id write fob_id;
    property gz_id: integer read fgz_id write fgz_id;

  end;

var frmMdlText:TfrmMdlText;

implementation

uses globals, main, dm, loadPicture;

{$R *.dfm}

{ TfrmMdlText }


procedure TfrmMdlText.nCopyClick(Sender: TObject);
begin
  StrToClipboard(txtMdlTxt.SelText);
end;

procedure TfrmMdlText.btnOKClick(Sender: TObject);
begin
     case frmMain.currentUserType of
      3:
         if (oldText <> txtMdlTxt.Text) and (trim(txtMdlTxt.Text) <> '') then
         begin
              ob_state_txt := 2;
         end;
      5: if (trim(txtMdlTxt.Text) <> '') then
         begin
              ob_state_txt := 3;
         end;

      8: if (trim(txtMdlTxt.Text) <> '') then
         begin
              ob_state_txt := 1;
         end;

      6: if (trim(txtMdlTxt.Text) <> '') then
         begin
              ob_state_txt := 4;
         end;

         else ob_state_txt := 0;
     end;
    hide
end;

procedure TfrmMdlText.btnCancelClick(Sender: TObject);
begin
  ob_state_txt := 0;
  hide
end;

procedure TfrmMdlText.nPasteClick(Sender: TObject);
begin
    txtMdlTxt.PasteFromClipboard;
end;

procedure TfrmMdlText.FormShow(Sender: TObject);
begin
    ob_state_txt := 0;
    oldText := txtMdlTxt.Text;

    setReadOnly(frmMain.currentUserType);
end;

procedure TfrmMdlText.save_state(same_code, pd_id: integer);
begin
    if ob_state_txt = 0 then exit;

    qSave.Close;
    qSave.SQL.Clear;
    qSave.SQL.Append('UPDATE OBJAVLENIE ob SET ob.OB_STATE_TXT = :st WHERE ob.SAME_CODE = :same AND ob.PD_ID = :pd_id');
    qSave.ParamByName('st').AsInteger := ob_state_txt;
    qSave.ParamByName('same').AsInteger := same_code;
    qSave.ParamByName('pd_id').AsInteger := pd_id;
    qSave.ExecSQL();

    data.LogState(same_code, ob_state_txt);
end;

procedure TfrmMdlText.save_state(objav_id: integer);
begin
    if ob_state_txt = 0 then exit;

    qSave.Close;
    qSave.SQL.Clear;
    qSave.SQL.Append('UPDATE OBJAVLENIE ob SET ob.OB_STATE_TXT = :st WHERE ob.OBJAV_ID = :id');
    qSave.ParamByName('st').AsInteger := ob_state_txt;
    qSave.ParamByName('id').AsInteger := objav_id;
    qSave.ExecSQL();

    data.LogState(objav_id, ob_state_txt);
end;

procedure TfrmMdlText.save(same_code, pd_id: integer);
begin
    if ob_state_txt = 0 then exit;

    qSave.Close;
    qSave.SQL.Clear;
    qSave.SQL.Append('UPDATE OBJAVLENIE ob SET ob.MDL_TEXT = :txt WHERE ob.SAME_CODE = :same AND ob.PD_ID = :pd_id');
    qSave.ParamByName('txt').AsString := txtMdlTxt.DataSource.DataSet.FieldByName('MDL_TEXT').AsString;
    qSave.ParamByName('same').AsInteger := same_code;
    qSave.ParamByName('pd_id').AsInteger := pd_id;
    qSave.ExecSQL();

    save_state(same_code, pd_id);
end;


procedure TfrmMdlText.save(objav_id: integer);
begin
    if ob_state_txt = 0 then exit;

    qSave.Close;
    qSave.SQL.Clear;
    qSave.SQL.Append('UPDATE OBJAVLENIE ob SET ob.MDL_TEXT = :txt WHERE ob.OBJAV_ID = :id');
    qSave.ParamByName('txt').AsString:= txtMdlTxt.DataSource.DataSet.FieldByName('MDL_TEXT').AsString;
    qSave.ParamByName('id').AsInteger := objav_id;
    qSave.ExecSQL();

    save_state(objav_id);
end;

procedure TfrmMdlText.btAddMdlClick(Sender: TObject);
begin
   qSd_num.Close;
   qSd_num.ParamByName('ob_id').AsInteger := ob_id;
   qSd_num.ParamByName('gz_id').AsInteger := gz_id;
   qSd_num.Open;
   if frmLoadPicture.loadmodule(qSd_num.Fields[0].AsString, '', self.ClassName) = mrOK then
   begin
       btnOKClick(Sender);
       save_state(ob_id);
   end;
  // frmMain.btRefreshObjavsDesigner.Click;
end;


procedure TfrmMdlText.setReadOnly(userType: integer);
begin
     case userType of
         3,5: txtMdlTxt.ReadOnly := false;

         else txtMdlTxt.ReadOnly := true;
     end;

     if (userType = 8) and (trim(txtMdlTxt.Text) <> '') then btAddMdl.Enabled := true else btAddMdl.Enabled := false;
end;


end.
