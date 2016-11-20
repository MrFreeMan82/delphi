unit ModuleReportParamsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmModuleReportParams = class(TForm)
    rgbFormat: TRadioGroup;
    GroupBox1: TGroupBox;
    cbActualSize: TCheckBox;
    cbZoomed: TCheckBox;
    btApprove: TBitBtn;
    btCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModuleReportParams: TfrmModuleReportParams;

implementation

{$R *.dfm}

end.
