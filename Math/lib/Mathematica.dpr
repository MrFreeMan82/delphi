library Mathematica;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Calculator in 'Calculator.pas',
  Complex in 'Complex.pas',
  DynArray in 'DynArray.pas',
  Graph in 'Graph.pas' {Form2},
  Matrixes in 'Matrixes.pas',
  Test in 'Test.pas',
  Translator in 'Translator.pas',
  Vectors in 'Vectors.pas';

  function Calculate(const MainForm:Cardinal;const input:PAnsiChar;const sett:PFormat):PansiChar;stdcall
  var s:AnsiString;NewCalc:TCalculator;
  begin
     s:=AnsiString(input);
     try
        NewCalc:=TCalculator.Create(MainForm,sett);
        Result:=PAnsiChar(NewCalc.CalcStr(s));
     except
        FreeAndNil(NewCalc);
        raise
     end;
     FreeAndNil(NewCalc);
  end;

  procedure Draw(const MainForm:Cardinal;const func:PAnsiChar;const sett:Pformat);stdcall;
  var s:AnsiString;NewCalc:TCalculator;
  begin
      s:=AnsiString(func);
      NewCalc:=TCalculator.Create(MainForm,sett);
      try
        NewCalc.Draw(s);
      except
        FreeAndNil(NewCalc);
        raise
      end;
      FreeAndNil(NewCalc);
  end;

  procedure RestoreWindow;
  begin
       if Form2<>nil then Form2.Show
  end;

  exports
    Calculate name 'Calculate',
    Draw name 'Draw',
    RestoreWindow name 'RestoreWindow';

begin

end.
