unit uTests;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uGlobal, uData, OleCtrls, SHDocVw, Menus,
  uNewTask;

type
  TfrmTests = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    txtAnswer: TEdit;
    btAnswear: TButton;
    Button2: TButton;
    btBack: TButton;
    btNext: TButton;
    Button1: TButton;
    Panel3: TPanel;
    cboModule: TComboBox;
    rgVariants: TRadioGroup;
    webTasks: TWebBrowser;
    PopupMenu1: TPopupMenu;
    mNewTask: TMenuItem;
    procedure rgVariantsClick(Sender: TObject);
    procedure btNextClick(Sender: TObject);
    procedure webTasksDocumentComplete(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure mNewTaskClick(Sender: TObject);
    procedure btAnswearClick(Sender: TObject);
    procedure btBackClick(Sender: TObject);
    procedure cboModuleChange(Sender: TObject);
  private
    { Private declarations }
    userTasks: array[0..9] of boolean;
    currentTask:integer;
    frmNewTask: TfrmNewTask;
    task: string;
    procedure OpenFirstTask();
    procedure NextTask();
    procedure PrevTask();
  public
    { Public declarations }
    procedure ShowTests();
  end;

implementation

{$R *.dfm}
             // Если выбран вариант с 6 - 10 то насчитываем баллы по таблице
const userPoints: array[0..9] of double = (0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 2, 2, 2);

{ TfrmTests }

procedure TfrmTests.btAnswearClick(Sender: TObject);
begin
    if CheckAnswer(cboModule.ItemIndex,
             rgVariants.ItemIndex, currentTask, strToFloatEx(txtAnswer.Text)) then
    begin
         userTasks[currentTask - 1] := true;
         showMessage('Правильно');

    end
    else begin
        showMessage('Подумай');
    end;
end;

procedure TfrmTests.cboModuleChange(Sender: TObject);
begin
    fillChar(userTasks, sizeof(userTasks), 0);
end;

procedure TfrmTests.mNewTaskClick(Sender: TObject);
begin
    if not Assigned(frmNewTask) then frmNewTask := TfrmNewTask.Create(self);
    frmNewTask.Add(cboModule.ItemIndex, rgVariants.ItemIndex + 1);
    freeAndNil(frmNewTask);
end;

procedure TfrmTests.NextTask;
var v:integer;
begin
     inc(currentTask);
     if currentTask > 10 then currentTask := 10;

     v := rgVariants.ItemIndex + 1;

     case cboModule.ItemIndex of
         MDL_ALGEBRA:
            task := format('%shtml\%s\%d\%d\%d.html',
                 [ExtractFilePath(Application.ExeName), DIR_ALGEBRA,
                                             v, currentTask, currentTask]);
         else exit;
     end;

     webTasks.Navigate(task);
end;

procedure TfrmTests.OpenFirstTask;
var v:integer;
begin
     currentTask := 1;
     v := rgVariants.ItemIndex + 1;

     case cboModule.ItemIndex of
         MDL_ALGEBRA:
            task := format('%shtml\%s\%d\%d\%d.html',
                 [ExtractFilePath(Application.ExeName), DIR_ALGEBRA,
                                             v, currentTask, currentTask]);
         else exit;
     end;

     webTasks.Navigate(task);
end;

procedure TfrmTests.PrevTask;
var v:integer;
begin
     dec(currentTask);
     if currentTask < 1 then currentTask := 1;

     v := rgVariants.ItemIndex + 1;

     case cboModule.ItemIndex of
         MDL_ALGEBRA:
            task := format('%shtml\%s\%d\%d\%d.html',
                 [ExtractFilePath(Application.ExeName), DIR_ALGEBRA,
                                             v, currentTask, currentTask]);
         else exit;
     end;

     webTasks.Navigate(task);
end;

procedure TfrmTests.ShowTests;
begin
    fillChar(userTasks, sizeof(userTasks), 0);

    LoadModuleComboBox(cboModule);
    cboModule.ItemIndex := MDL_ALGEBRA;
    rgVariants.ItemIndex := 0;
    show;
end;

procedure TfrmTests.rgVariantsClick(Sender: TObject);
begin
    OpenFirstTask();
end;

procedure TfrmTests.btBackClick(Sender: TObject);
begin
    PrevTask();
end;

procedure TfrmTests.btNextClick(Sender: TObject);
begin
    NextTask();
end;

procedure TfrmTests.webTasksDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
    while webTasks.ReadyState <> 4 do Application.ProcessMessages;
    webTasks.OleObject.Document.bgColor := '#E0FFFF';
end;

end.
