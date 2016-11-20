unit newAccount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, DBCtrlsEh, DBLookupEh, Buttons,
  DBGridEh, FMTBcd, SqlExpr;

type
  TfrmNewAccount = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEditEh;
    dsAcc: TDataSource;
    Label2: TLabel;
    edFactNum: TDBEditEh;
    Label3: TLabel;
    DBEdit3: TDBEditEh;
    Label4: TLabel;
    DBEdit4: TDBEditEh;
    Label5: TLabel;
    DBEdit5: TDBEditEh;
    Label6: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    BitBtn1: TBitBtn;
    qCustInfo: TSQLQuery;
    Label7: TLabel;
    Label8: TLabel;
    dbDateStart: TDBEditEh;
    dbDateEnd: TDBEditEh;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    fCheckValidNum: boolean;
  public
    { Public declarations }
    function ShowNewAccount(setdefault: boolean): TModalResult;
    property CheckValidNum:boolean read fCheckValidNum write fCheckValidNum;
  end;

var
  frmNewAccount: TfrmNewAccount;

implementation

uses repAcc, dm, uSdelkaRep;

{$R *.dfm}

procedure TfrmNewAccount.BitBtn1Click(Sender: TObject);
begin
   if dsAcc.DataSet.FieldByName('SD_FACT_NUM').AsString = '' then
   begin
      ShowMessage('ѕоле счета должно быть заполнено.');
      ModalResult := mrNone;
      exit;
   end;
   if CheckValidNum then
   if not data.IsValidFactNum(dsAcc.DataSet.FieldByName('SD_FACT_NUM').AsInteger,
                              dsAcc.DataSet.FieldByName('SD_FACT_DATE').AsDateTime,
                              Trim(data.cdsCustCU_OKPO.AsString)) then
   begin
      MessageDlg('Ќомер счета фактуры не должен повтор€тьс€ в течении мес€ца! ', mtError, [mbOk], 0);
      ModalResult := mrNone;
   end;
end;

function TfrmNewAccount.ShowNewAccount(setdefault: boolean): TModalResult;
begin
 //	edFactNum.SetFocus;
  if setdefault then
  begin
      dsAcc.DataSet.Edit;
      dsAcc.DataSet.FieldByName('SD_FACT_DATE').AsDateTime := Date;
      dsAcc.DataSet.FieldByName('SD_SKIDKA').AsFloat := 0;
      dsAcc.DataSet.FieldByName('SD_SUM').AsFloat := 0;
      dsAcc.DataSet.Post;
  end;
  result := ShowModal;
end;

end.
