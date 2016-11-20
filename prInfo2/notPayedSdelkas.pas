unit notPayedSdelkas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB;

type
  TfrmNotPayedSdelkas = class(TForm)
    grid: TDBGrid;
  private
    { Private declarations }
  public
	constructor Create(AOwner:TComponent;ds:TDataSource); reintroduce;
	{ Public declarations }
  end;

implementation

uses sdelkaForm, agentSummary;

{$R *.dfm}

constructor TfrmNotPayedSdelkas.Create(AOwner:TComponent;ds:TDataSource);
begin
	inherited Create(AOwner);

	grid.DataSource:=ds;
end;

end.
