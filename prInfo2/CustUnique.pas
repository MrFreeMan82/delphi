unit CustUnique;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, DB, Buttons, DBCLient, SimpleDS,
  DBCtrls, DBLookupEh, ExtCtrls, globals, DBGridEh;

type
  TfrmCustUnique = class(TFrame)
    btEdit: TBitBtn;
    btSave: TBitBtn;
    btCancel: TBitBtn;
    sdsCustUnique: TSimpleDataSet;
    sdsCustUniqueCUQ_TYPE: TSmallintField;
    sdsCustUniqueCUQ_FULL_NAME: TStringField;
    sdsCustUniqueCUQ_ADDRESS: TStringField;
    sdsCustUniqueCUQ_ADDRESS_REAL: TStringField;
    sdsCustUniqueCUQ_NAME: TStringField;
    sdsCustUniqueCUQ_PHONES: TStringField;
    sdsCustUniqueCUQ_BOSS: TStringField;
    sdsCustUniqueCUQ_BUHGALTER: TStringField;
    sdsCustUniqueCUQ_OKPO: TStringField;
    sdsCustUniqueCUQ_INN: TStringField;
    sdsCustUniqueCUQ_NDS_NUM: TStringField;
    sdsCustUniqueCUQ_CONTACT: TStringField;
    sdsCustUniqueCUQ_DOC_SER: TStringField;
    sdsCustUniqueCUQ_DOC_NUM: TStringField;
    sdsCustUniqueCUQ_DOC_AUTHOR: TStringField;
    sdsCustUniqueCUQ_DOC_DATE: TStringField;
	sdsCustUniqueCUQ_1C_ID: TIntegerField;
	sdsCustUniqueCUQ_REG_ID: TIntegerField;
	sdsCustUniqueCUQ_CHANGED: TSmallintField;
    Label1: TLabel;
    DBEdit1: TDBEditEh;
    dsCustUnique: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEditEh;
    Label3: TLabel;
    DBEdit3: TDBEditEh;
    Label4: TLabel;
    DBEdit4: TDBEditEh;
    Label5: TLabel;
    DBEdit5: TDBEditEh;
    Label6: TLabel;
    DBEdit6: TDBEditEh;
    Label7: TLabel;
    DBEdit7: TDBEditEh;
    Label8: TLabel;
    DBEdit8: TDBEditEh;
    Label9: TLabel;
    DBEdit9: TDBEditEh;
    Label10: TLabel;
    DBEdit10: TDBEditEh;
    Label11: TLabel;
    DBEdit11: TDBEditEh;
    sdsCustUniqueType: TSimpleDataSet;
    sdsCustUniqueTypeCUQT_ID: TSmallintField;
    sdsCustUniqueTypeCUQT_NAME: TStringField;
    dsCustUniqueType: TDataSource;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label16: TLabel;
    Label12: TLabel;
    DBEdit12: TDBEditEh;
    DBEdit13: TDBEditEh;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit14: TDBEditEh;
    DBEdit15: TDBEditEh;
    Label15: TLabel;
    Shape1: TShape;
    Label17: TLabel;
	procedure btSaveClick(Sender: TObject);
	procedure btCancelClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure sdsCustUniqueAfterInsert(DataSet: TDataSet);
  private
	fRegId:integer;
	fReadOnly:boolean;
	procedure setReadOnly(ro:boolean);
    function getReadOnly: boolean;
  public
	procedure setCustUnique(regid:integer;readOnly:boolean);
	property ReadOnly:boolean read getReadOnly write setReadOnly;
  end;

implementation

uses dm, accessRights;

{$R *.dfm}

{ TfrmCustUnique }


// Показываем уникального клиента
procedure TfrmCustUnique.setCustUnique(regid:integer;readOnly:boolean);
begin
	fRegId:=regid;
	sdsCustUnique.Params.ParamByName('CUQ_REG_ID').AsInteger:=regid;
	if (sdsCustUnique.Active) then
		sdsCustUnique.Close;
	sdsCustUnique.Open;

	if (not sdsCustUniqueType.Active) then
		sdsCustUniqueType.Open;

	self.ReadOnly:=readOnly;
end;


procedure TfrmCustUnique.btSaveClick(Sender: TObject);
begin
	sdsCustUnique.CheckBrowseMode;
	sdsCustUnique.ApplyUpdates(0);
end;


procedure TfrmCustUnique.btCancelClick(Sender: TObject);
begin
	sdsCustUnique.CancelUpdates;
end;

function TfrmCustUnique.getReadOnly: boolean;
begin
	Result:=fReadOnly;
end;


// Устанавливаем рид-онли
procedure TfrmCustUnique.setReadOnly(ro: boolean);
begin
	inherited;

    fReadOnly:=ro;

    if (ReadOnly) then
        TAccessRightsManager.DisableWindow(self)
    else
    begin
        TAccessRightsManager.EnableWindow(self);
        TAccessRightsManager.SetWindowAccessState(uAgent,self);
    end;
end;

procedure TfrmCustUnique.btEditClick(Sender: TObject);
begin
	if (sdsCustUnique.IsEmpty) then
		sdsCustUnique.Insert
	else
		sdsCustUnique.Edit;
end;

procedure TfrmCustUnique.sdsCustUniqueAfterInsert(DataSet: TDataSet);
begin
	sdsCustUniqueCUQ_REG_ID.AsInteger:=data.nextGeneratorId('G_CUQ_ID');
end;

end.
