unit phoneCheckResult;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls;

type
  TfrmPhoneCheckResult = class(TForm)
    DBMemo1: TDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPhoneCheckResult: TfrmPhoneCheckResult;

implementation

uses dm;

{$R *.dfm}

end.
