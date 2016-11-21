unit uTests;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uGlobal, uData;

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
    Panel2: TPanel;
    Panel3: TPanel;
    cboModule: TComboBox;
    rgVariants: TRadioGroup;
    procedure rgVariantsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    tblModules: TSQLiteUniTable;
  public
    { Public declarations }
    procedure ShowTests();
  end;

implementation

{$R *.dfm}

{ TfrmTests }

procedure TfrmTests.FormDestroy(Sender: TObject);
begin
    freeAndNil(tblModules);
end;

procedure TfrmTests.rgVariantsClick(Sender: TObject);
var key:integer;
begin
    if cboModule.ItemIndex < 0 then exit;
    key := integer(cboModule.Items.Objects[cboModule.ItemIndex]);
    showMessage(intToStr(key));
end;

procedure TfrmTests.ShowTests;
begin
    tblModules := dm.DB.GetUniTable('SELECT M_ID, M_NAME FROM MODULE ');
    LoadComboBox(cboModule, tblModules);
    show;
end;

end.
