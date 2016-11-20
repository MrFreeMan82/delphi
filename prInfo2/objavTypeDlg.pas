unit objavTypeDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmObjavType = class(TForm)
    Label1: TLabel;
    btText: TButton;
    btPicture: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmObjavType: TfrmObjavType;

implementation

{$R *.dfm}

procedure TfrmObjavType.FormShow(Sender: TObject);
begin
	btText.SetFocus;
end;

end.
