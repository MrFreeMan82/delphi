unit uSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart;

type
TPopulation = record
    victims, predators: double;
end;

  TForm1 = class(TForm)
    Label1: TLabel;
    txtGenVictims: TEdit;
    Label2: TLabel;
    txtBeginVictims: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    txtPredatorDeath: TEdit;
    txtBeginPredator: TEdit;
    txtPredatorCanEatVictim: TEdit;
    txtPeriod: TEdit;
    btCalc: TButton;
    btExit: TButton;
    Chart1: TChart;
    txtVictimDeath: TEdit;
    Label8: TLabel;
    Series1: TLineSeries;
    Series2: TLineSeries;
    procedure btCalcClick(Sender: TObject);
    procedure btExitClick(Sender: TObject);
  private
    { Private declarations }
    period: single;
    beginVictims, beginPredators: double;
    genVictims: double;
    kills: double;
    victimDeath, predatorDeath: double;

    population: array of TPopulation;

    procedure Draw();
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function strToFloatEx(s: string): double;
var sett: TFormatSettings;
begin
    if pos(',', s) > 0 then sett.DecimalSeparator := ','
    else  sett.DecimalSeparator := '.';

    result := strToFloat(s, sett);
end;

procedure TForm1.btCalcClick(Sender: TObject);
var i, j: integer; v, p: double;
begin
    beginVictims := strToFloatEx(txtBeginVictims.Text);
    beginPredators := strToFloatEx(txtBeginPredator.Text);

    genVictims := strToFloatEx(txtGenVictims.Text);
    kills := strToFloatEx(txtPredatorCanEatVictim.Text);
    predatorDeath := strToFloatEx(txtPredatorDeath.Text);
    victimDeath := strToFloatEx(txtVictimDeath.Text);

    period := strToFloatEx(txtPeriod.Text);
    setLength(population, trunc(period));

    population[0].victims := beginVictims;
    population[0].predators := beginPredators;

    i := 1;
    while i <= length(population) - 1 do
    begin
         j := i - 1;
         v := population[j].victims + genVictims * population[j].victims -
                    victimDeath * population[j].predators * population[j].victims;

         p := population[j].predators + kills *
            population[j].predators * population[j].victims -
                              predatorDeath * population[j].predators;

         population[i].victims := v;
         population[i].predators := p;
         inc(i)
    end;

    Draw();
end;

procedure TForm1.btExitClick(Sender: TObject);
begin
close;
end;

procedure TForm1.Draw;
var i: integer;
begin
      Series2.Clear;
      Series1.Clear;
      Series1.Title := 'Жертвы';
      Series2.Title := 'Хищники';

      for i := 0 to length(population) - 1 do
      begin
           Series1.AddXY(i, population[i].victims,
                                    floatToStr(i), clGreen);

           Series2.AddXY(i, population[i].predators,
                                    floatToStr(i), clRed);
      end;
end;

end.
