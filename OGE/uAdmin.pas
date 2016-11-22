unit uAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ToolWin, ComCtrls, Grids, StdCtrls, ExtCtrls, uData,
  uNewTask;

type
  TfrmAdmin = class(TForm)
    grModule: TGroupBox;
    GroupBox1: TGroupBox;
    grdModules: TStringGrid;
    Panel1: TPanel;
    grdTasks: TStringGrid;
    btAddTask: TSpeedButton;
    Panel2: TPanel;
    txtNewModuleName: TEdit;
    btAddModule: TSpeedButton;
    procedure btAddModuleClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btAddTaskClick(Sender: TObject);
  private
    { Private declarations }
    tblModules: TSQLiteUniTable;
    procedure LoadModules();
  public
    { Public declarations }
    procedure ShowAdmin();
  end;

implementation

{$R *.dfm}

{ TfrmAdmin }

procedure TfrmAdmin.btAddModuleClick(Sender: TObject);
var sql: ansistring;
begin
    if trim(txtNewModuleName.Text) = '' then exit;

    sql := ansistring(format('INSERT INTO MODULE (M_NAME) VALUES("%s")', [txtNewModuleName.Text]));
    dm.DB.ExecSQL(sql);
    txtNewModuleName.Text := '';
    LoadModules();
end;

procedure TfrmAdmin.btAddTaskClick(Sender: TObject);
begin
   { if not Assigned(frmNewTask) then frmNewTAsk := TfrmNewTask.Create(self);
    frmNewTask.Add();
    freeAndNil(frmNewTask); }
end;

procedure TfrmAdmin.FormDestroy(Sender: TObject);
begin
    freeAndNil(tblModules);
end;

procedure TfrmAdmin.LoadModules;
var c,r,cnt:integer;
begin
     grdModules.RowCount := 1;
     grdModules.Cells[0,0] := 'Èä';
     grdModules.Cells[1, 0] := 'Èìÿ';

     c := 0; r := 1; cnt := 1;
     tblModules := dm.DB.GetUniTable('SELECT M_ID, M_NAME FROM MODULE ');
     while not tblModules.EOF do
     begin
          inc(cnt);
          grdModules.RowCount := cnt;
          grdModules.Cells[c, r] := tblModules.FieldAsString(0);
          grdModules.Cells[c + 1, r] := tblModules.FieldAsString(1);
          inc(r);
          tblmodules.Next;
     end;
     grdModules.FixedRows := 1;
end;

procedure TfrmAdmin.ShowAdmin;
begin
   // LoadModules();
    show;
end;

end.
