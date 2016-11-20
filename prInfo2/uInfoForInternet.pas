unit uInfoForInternet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, FMTBcd, DB, SqlExpr;

type
  TfrmInfoForInternet = class(TForm)
    Label5: TLabel;
    Label4: TLabel;
    btDone: TBitBtn;
    btCancelAg: TBitBtn;
    txtEmployer: TEdit;
    txtEmail: TEdit;
  private
    { Private declarations }

  public
    { Public declarations }
  end;

implementation

uses dm;

{$R *.dfm}

{ TfrmInfoForInternet }


end.
