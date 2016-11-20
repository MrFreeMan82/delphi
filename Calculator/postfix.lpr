program postfix;

uses sysutils, uStack, ulexer, usymbols, uparser, ucalc, uvectors;

var s:string;
    fin, fout: TextFile;

begin
  //  s := ParamStr(1);
    if not fileExists('input.txt') then exit;

    assignFile(fout, 'output.txt');
    rewrite(fout);

    assignFile(fin, 'input.txt');
    reset(fin);

    while not eof(fin) do
    begin
         setColNoFirst();
         reInitRule();
         readln(fin, s);
         calc(s);
    end;

    writeln(fout, getResult());
    writeln(fout, getErrors());

    closefile(fin);
    closefile(fout);
   // readln;
end.

