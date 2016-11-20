unit ulite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, SQLite3, SQLiteTable3, FMTBcd, DB,
  SqlExpr, ExtDlgs, DBClient, MemTableDataEh, MemTableEh;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    SQLQuery1: TSQLQuery;
    btAdd: TButton;
    OpenPic: TOpenPictureDialog;
    ListBox1: TListBox;
    RadioGroup1: TRadioGroup;
    mem: TMemTableEh;
    memID: TIntegerField;
    memPICT_NAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
    Pictures : TSQLiteDatabase;
    procedure generateList();
  public
    { Public declarations }

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btAddClick(Sender: TObject);
var s:string;
    F: TFileStream;
    id:int64;
begin
    if OpenPic.Execute then
    begin
      try
        F:=TFileStream.Create(OpenPic.FileName,fmOpenRead);
        //��������� � ���� ������ ����� ������
        s:='INSERT INTO pics ';
        s:=s+'(pict_name, rating) ';
        s:=s+'VALUES ("'+ExtractFileName(OpenPic.FileName)+'", 0)';
        Pictures.ExecSQL(ansistring(s));
        //�������� ������ �� ��������� ���������� ������
        id:=Pictures.GetLastInsertRowID;
        //��������� ������, �������� ���� pict_data
        s:='UPDATE pics SET pict_data = ? WHERE id = '+intToStr(id);
        Pictures.UpdateBlob(ansistring(s),F);
      finally
        FreeAndNil(F);
      end;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var s: ansiString;
begin
    Pictures:=TSQLiteDatabase.Create('pictures.sqlite');
    try
      if not Pictures.TableExists('pics') then //������� � �� ����������� - �������
      begin
          s:='CREATE TABLE pics ';
          s:=s+'(id INTEGER PRIMARY KEY AUTOINCREMENT,';
          s:=s+'pict_name TEXT,';
          s:=s+'pict_data BLOB,';
          s:=s+'rating INTEGER)';
          Pictures.ExecSQL(s);
      end;
      generateList();
  except
    MessageBox(0,'�� ����� �������� ������� ��������� ������','������',MB_OK+MB_ICONERROR);
    Application.Terminate;
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
    Pictures.Free;
end;

procedure TForm1.generateList;
var SQLite_table: TSQLiteUniTable;
begin
  ListBox1.Clear;
  ListBox1.Items.BeginUpdate;
  SQLite_table:=Pictures.GetUniTable('SELECT pict_name, id FROM pics');//TSQLiteTable.Create(Pictures,'SELECT pict_name FROM pics');

  mem.Open;

  while not SQLite_table.EOF do
  begin
      mem.Insert;
      memID.AsInteger := SQLite_table.FieldAsInteger(1);
      memPICT_NAME.AsString := SQLite_table.FieldAsString(0);

      ListBox1.Items.Add(SQLite_table.FieldAsString(0));
      SQLite_table.Next;
  end;
  mem.Post;

  ListBox1.Items.EndUpdate;
  SQLite_table.Destroy;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var M:TStream;
    Graph: TBitmap;
    SQLite_table: TSQLiteUniTable;
    sql:string;
begin
    if ListBox1.ItemIndex > -1 then
    begin
      try
        sql := format('SELECT pict_data, rating FROM pics WHERE pict_name="%s"', [ListBox1.Items[ListBox1.itemindex]]);

        SQLite_table := Pictures.GetUniTable(ansistring(sql));
        RadioGroup1.OnClick := nil;
        RadioGroup1.ItemIndex:=SQLite_table.FieldAsInteger(1);//�������
        RadioGroup1.OnClick := RadioGroup1Click;
        //��������� ��������
        M:=SQLite_table.FieldAsBlob(0);
        M.Position:=0;
        Graph:=TBitmap.Create;
        Graph.LoadFromStream(SQLite_table.FieldAsBlob(0));
        Image1.Picture.Bitmap.Assign(Graph)
      finally
        FreeAndNil(Graph);
      end;
    end;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
var sql:string;
begin
    if ListBox1.ItemIndex > -1 then
    begin
      sql := format('UPDATE pics SET rating = %d WHERE pict_name="%s"',
                  [RadioGroup1.ItemIndex, ListBox1.Items[ListBox1.ItemIndex]]);
      Pictures.ExecSQL(ansistring(sql));
    end;
end;

end.
