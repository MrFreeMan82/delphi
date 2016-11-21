unit uData;

interface

uses
  SysUtils, Classes, SQLiteTable3, SQLite3;

type
  TSQLiteUniTable = SQLiteTable3.TSQLiteUniTable;

  Tdm = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    DB: TSQLiteDatabase;
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
var sql: ansistring;
begin
     DB := TSQLiteDatabase.Create('data.sqllite');

     if not DB.TableExists('MODULE') then
     begin
          sql := 'CREATE TABLE MODULE ( ';
          sql := sql + 'M_ID INTEGER PRIMARY KEY AUTOINCREMENT,';
          sql := sql + 'M_NAME TEXT)';

          DB.ExecSQL(sql);

        //  sql := 'INSERT INTO MODULE VALUES (';
     end;
 end;

end.
