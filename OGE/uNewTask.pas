unit uNewTask;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ToolWin, ComCtrls, ExtDlgs, Grids, uData;

type
  TfrmNewTask = class(TForm)
    OpenPicture: TOpenPictureDialog;
    Panel1: TPanel;
    ToolBar2: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    memTask: TMemo;
    DrawGrid1: TDrawGrid;
    btSave: TButton;
    Button2: TButton;
    procedure btSaveClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    fModule:integer;
    fVariant: integer;
    taskCnt:integer;
    taskPath, newTaskName, newTaskDir: string;
    taskInfo: TStringList;
    function getPath(): string;
  public
    { Public declarations }
    procedure Add(module, taskVariant:integer);
  end;

implementation

uses uGlobal;

{$R *.dfm}

{ TfrmNewTask }

procedure TfrmNewTask.Add(module, taskVariant:integer);
begin
    fModule := module;
    fVariant := taskVariant;

    taskPath := getPath();
    taskInfo := TStringList.Create;
    taskInfo.LoadFromFile(taskPath + '\task.info');
    taskCnt := strToInt(taskInfo.Strings[0]);
    inc(taskCnt);
    newTaskDir  := intToStr(taskCnt);
    newTaskName := newTaskDir + '.html';

    showModal;
end;

procedure TfrmNewTask.btSaveClick(Sender: TObject);
var s: string;
begin
     if DirectoryExists(taskPath + '\' + newTaskDir) then
     begin
          exit;
     end;

     MkDir(taskPath + '\' + newTaskDir);

     s := format('%s\%s\%s', [taskPath, newTaskDir, newTaskName]);
     memTask.Lines.SaveToFile(s);
     taskInfo.Strings[0] := intToStr(taskCnt);
     taskInfo.SaveToFile(taskPath + '\task.info');
end;

procedure TfrmNewTask.FormDestroy(Sender: TObject);
begin
    freeAndNil(taskInfo);
end;

function TfrmNewTask.getPath: string;
begin
     case fModule of
        MDL_ALGEBRA:
                   result := format('%shtml\%s\%d',
                     [ExtractFilePath(Application.ExeName), DIR_ALGEBRA, fVariant]);

              else result := '';
     end;
end;

end.
