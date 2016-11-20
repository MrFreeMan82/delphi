unit agentSummary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Buttons, ExtCtrls, dm, globals;

type
  TfrmAgentSummary = class(TForm)
	Label1: TLabel;
    lblAllS: TLabel;
	Label5: TLabel;
    lblAllP: TLabel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    lblCurrS: TLabel;
    Label4: TLabel;
    lblCurrP: TLabel;
    Label7: TLabel;
    lblReadySN: TLabel;
    Label9: TLabel;
    lblReadyPN: TLabel;
    Label11: TLabel;
    lblNewS: TLabel;
    Label13: TLabel;
    lblNewP: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Shape3: TShape;
    Shape6: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Label3: TLabel;
    lblReadySB: TLabel;
    Label8: TLabel;
    lblReadyPB: TLabel;
    Label12: TLabel;
  private
	{ Private declarations }
  public
	procedure ShowModal(ds:TDataSet); reintroduce;
  end;

var
  frmAgentSummary: TfrmAgentSummary;

implementation

uses sdelka;

{$R *.dfm}


// Подсчитаем всё, чего от нас хотят
procedure TfrmAgentSummary.ShowModal(ds:TDataSet);
var
	newS,newP,readySN,readyPN,readySB,readyPB,currS,currP,allS,allP:Currency;
begin
	ds.First;
	newS:=0;
	newP:=0;
	readySN:=0;
	readyPN:=0;
	readySB:=0;
	readyPB:=0;
	currS:=0;
	currP:=0;
	allS:=0;
	allP:=0;
	while (not ds.Eof) do
	begin
		if (ds.FieldByName('SD_STATE').AsInteger=SD_NEW) then
		begin
			newS:=newS+ds.FieldByName('SD_SUM').AsCurrency;
			newP:=newP+ds.FieldByName('SD_SUM').AsCurrency*ds.FieldByName('SD_PERCENT').AsCurrency/100;
		end
		else if (ds.FieldByName('SD_STATE').AsInteger=SD_READY) then
		begin
			if (ds.FieldByName('PT_ID').AsInteger = PAY_NAL) then
			begin
				readySN:=readySN+ds.FieldByName('SD_SUM').AsCurrency;
				readyPN:=readyPN+ds.FieldByName('SD_SUM').AsCurrency*ds.FieldByName('SD_PERCENT').AsCurrency/100;
			end
			else if ((ds.FieldByName('PT_ID').AsInteger=2)or(ds.FieldByName('PT_ID').AsInteger=3)) then
			begin
				readySB:=readySB+ds.FieldByName('SD_SUM').AsCurrency;
				readyPB:=readyPB+ds.FieldByName('SD_SUM').AsCurrency*ds.FieldByName('SD_PERCENT').AsCurrency/100;
			end;
		end
		else if (ds.FieldByName('SD_STATE').AsInteger=SD_CURRENT) then
		begin
			currS:=currS+ds.FieldByName('SD_SUM').AsCurrency;
			currP:=currP+ds.FieldByName('SD_SUM').AsCurrency*ds.FieldByName('SD_PERCENT').AsCurrency/100;
		end;

		allS:=allS+ds.FieldByName('SD_SUM').AsCurrency;
		allP:=allP+ds.FieldByName('SD_SUM').AsCurrency*ds.FieldByName('SD_PERCENT').AsCurrency/100;

		ds.Next;
	end;

	lblNewS.Caption:=format('%.2f',[newS]);
	lblNewP.Caption:=format('%.2f',[newP]);

	lblReadySN.Caption:=format('%.2f',[readySN]);
	lblReadyPN.Caption:=format('%.2f',[readyPN]);

	lblReadySB.Caption:=format('%.2f',[readySB]);
	lblReadyPB.Caption:=format('%.2f',[readyPB]);

	lblCurrS.Caption:=format('%.2f',[currS]);
	lblCurrP.Caption:=format('%.2f',[currP]);

	lblAllS.Caption:=format('%.2f',[allS]);
	lblAllP.Caption:=format('%.2f',[allP]);			

	inherited ShowModal;
end;

end.
