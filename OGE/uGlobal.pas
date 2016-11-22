unit uGlobal;

interface
uses SysUtils, Classes, StdCtrls, uData;

type TTheme = integer;

const   TH_NUMS = 0;
        TH_NUMS_DIR = 'Nums';

type TModule = integer;

const //MODULES = 'MODULES';
      MDL_ALGEBRA = 0;
      DIR_ALGEBRA = 'Algebra';


var ModuleArr: array[0..1] of string = ('јлгебра', '”чебные тесты');
    AlgebraAnswArr: array[0..9, 0..9] of double = (
                                              (20.756, 2, 0, 0, 0, 0, 0, 0, 0, 0),
                                              (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
                                              (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
                                              (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
                                              (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
                                              (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
                                              (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
                                              (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
                                              (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
                                              (0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
                                            );

    AlgebraPoints: array[0..9] of integer = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

procedure LoadModuleComboBox(cbo:TComboBox);
function CheckAnswer(mdl: TModule; taskVariant, task: integer; x: double): boolean;
function strToFloatEx(const s: string): double;

implementation

function strToFloatEx(const s: string): double;
var sett: TFormatSettings;
begin
      sett.DecimalSeparator := '.';
      result := strToFloatDef(s, 0, sett);
end;

function CheckAnswer(mdl: TModule; taskVariant, task: integer; x: double): boolean;
const e: double = 0.01;
begin
    result := false;
    if (not (taskVariant in [0..9])) or (not (task - 1 in [0..9])) then exit;

    if mdl = MDL_ALGEBRA then
      result := (abs(AlgebraAnswArr[taskVariant, task - 1] - x) < e);  // здесь проверка на = ;
                                                                       //task - 1 потому что индекс массива начинаестьс€ с 0
end;

procedure LoadModuleComboBox(cbo:TComboBox);
var i: integer;
begin
    for i := 0 to length(ModuleArr) - 1 do cbo.Items.Add(ModuleArr[i]);

end;

end.
