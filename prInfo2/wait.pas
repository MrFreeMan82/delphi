unit wait;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls;

type
  TfrmWait = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWait: TfrmWait;

implementation

{$R *.DFM}

end.
