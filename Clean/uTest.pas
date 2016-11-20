unit uTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, SqlExpr, StdCtrls, DBCtrls, Mask, DBClient, Provider,
  Buttons, ExtCtrls;

type
  TfrmTest = class(TForm)
    txtNewLq: TDBEdit;
    lstNewLq: TDBLookupListBox;
    dsNewItem: TDataSource;
    cdsNewItem: TClientDataSet;
    prvNewItem: TDataSetProvider;
    qNewItem: TSQLQuery;
    cdsNewItemD_ID: TIntegerField;
    cdsNewItemORG_ID: TIntegerField;
    cdsNewItemD_NAME: TStringField;
    cdsNewItemD_SECNAME: TStringField;
    cdsNewItemD_THNAME: TStringField;
    cdsNewItemD_TEL: TStringField;
    procedure txtChange(Sender: TObject);
    procedure txtKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lstKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lstMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    function findLinkedText(list: TDBLookUpListBox): TDBEdit;
    function findLinkedList(txt: TDBEdit): TDBLookUpListBox;
  public
    { Public declarations }
  end;

var
  frmTest: TfrmTest;

implementation

uses uData, strUtils;

{$R *.dfm}

function TfrmTest.findLinkedList(txt: TDBEdit): TDBLookUpListBox;
var listName: string;
begin
     result := nil;
     if txt = nil then exit;

     listName := 'lst' + rightStr(txt.Name, length(txt.Name) - 3);

     result := TDBLookUpListBox(self.FindComponent(listName));
end;

function TfrmTest.findLinkedText(list: TDBLookUpListBox): TDBEdit;
var txtname:string;
begin
     result := nil;
     if list = nil then exit;

     txtname := 'txt' + rightStr(list.Name, length(list.Name) - 3);

     result := TDBEDit(self.FindComponent(txtname))
end;

procedure TfrmTest.lstKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var txt: TDBEdit;
begin
     if key = VK_ESCAPE then
     begin
         if TDBLookUpListBox(Sender).Visible then TDBLookUpListBox(Sender).Visible := false;
         exit;
     end;

     txt := findLinkedText(TDBLookUpListBox(Sender));
     if txt = nil then exit;

     txt.OnChange := nil;
     txt.Field.AsString := TDBLookUpListBox(Sender).SelectedItem;
     txt.OnChange := txtChange;

     if key = VK_RETURN then
     begin
         TDBLookUpListBox(Sender).Visible := false;
     end;
end;

procedure TfrmTest.lstMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

var key: word;
begin
     key := VK_RETURN;
     lstKeyUp(Sender, key, []);
end;

procedure TfrmTest.txtChange(Sender: TObject);
var list: TDBLookUpListBox;
begin
    if not TDBEDit(Sender).Focused then exit;

    list := findLinkedList(TDBEdit(Sender));
    if list = nil then exit;


    if trim(TDBEdit(Sender).Text) = '' then
    begin
         if list.Visible then list.Visible := false;
         exit;
    end;

    data.filterDictionary(TClientDataSet(list.ListSource.DataSet),
        'UPPER(' + list.ListField + ') LIKE ' +
              QuotedStr('%' + AnsiUpperCase(TDBEdit(Sender).Text) + '%'));

    if list.ListSource.DataSet.RecordCount = 0 then
    begin
          if list.Visible then list.Visible := false;
          exit;
    end;

    if not list.Visible then
    with TDBEDit(Sender) do
    begin
       list.Left := Left;
       list.Top  := Top + Height;
       list.Visible := true;
    end;
end;

procedure TfrmTest.txtKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var list: TDBLookUpListBox;
begin
   list := findLinkedList(TDBEdit(Sender));
   if list = nil then exit;
   case key of
    40, VK_TAB: begin
                  if not list.Visible then exit;

                  list.SetFocus;
                end;

    VK_ESCAPE:  begin
                    if list.Visible then list.Visible := false;
                   // TDBEdit(Sender).SetFocus;
                end;

   end;

end;

end.


