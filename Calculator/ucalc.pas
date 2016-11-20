unit ucalc;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Math, uparser, uStack, usymbols, ulexer, uvectors;

procedure Calc(const inStr: string);
function getErrors(): string;
function getResult(): string;

implementation

type TCalcState = (stInput, stNumberWith, stVectorWith);

     TRef = record
          id: integer;
          ref: integer;
     end;
const REF_INIT_LEN = 100;
var
    refArray: array of TRef;
    rix: integer = 0;

    st: TStack;
    LIST_ERROR: string = '';

    a,b: double;
    vA, vB: TVector;

const e = 0.0001;

function tokenToVector(token: PToken): TVector; forward;

function getErrors(): string;
begin
         result := getLexErrors() + getSyntaxErrors() + LIST_ERROR;

         if result = '' then result := 'OK';
end;

procedure error();
begin
     LIST_ERROR += 'Operator not determined for that data type, at ' + intToStr(getLineNo()) + ':' + intToStr(getColNo() - 1) + #13#10;
end;

function getResult(): string;
var f: PToken;
    vR: TVector;
    sett: TFormatSettings;
begin
     sett.DecimalSeparator := '.';
     pop(@st, f);
     if f = nil then exit('');

     case f^.typeof of
          tNum: result := floatToStr(f^.value, sett);
    tVectorEnd:
               begin
                    vR := tokenToVector(f);
                    result := vectorToStr(vR);
               end;

          else result := '';
     end;
end;

procedure pushVector(vector: TVector);
var r: TToken;
    i: integer;
begin
     r.typeof := tVectorBegin;
     push(@st, @r);

     r.typeof := tNum;
     for i := 0 to length(vector) - 1 do
     begin
          r.value := vector[i];
          push(@st, @r)
     end;

     r.typeof := tReserved;
     r.value := length(vector);
     push(@st, @r);

     r.typeof := tVectorEnd;
     push(@st, @r);
end;

procedure pushVector(addr: integer);
var token: PToken;
begin
    token := readToken(addr);

    while token^.typeof <> tVectorEnd do
    begin
        push(@st, token);
        dec(addr);
        token := readToken(addr);
    end;
    push(@st, token);
end;

procedure addReference(ref: Tref);
begin
     if rix = length(refArray) then setLength(refArray, length(refArray) + REF_INIT_LEN);
     refArray[rix] := ref;
     inc(rix);
end;

procedure reference(token: PToken; n: double);
var ref: Tref;
    t: TToken;
begin
     t.typeof := tNum;
     t.value := n;
     ref.id := locate(token);
     ref.ref := locate(@t);
     addReference(ref)
end;

procedure reference(token: PToken; v: TVector);
var i: integer;
    t: TToken;
    ref: Tref;
begin
     t.typeof := tVectorBegin;
     ref.id := locate(token);
     ref.ref := storeToken(@t);

     t.typeof := tNum;
     for i := 0 to length(v) - 1 do
     begin
          t.value := v[i];
          storeToken(@t);
     end;

     t.typeof := tVectorEnd;
     t.value := 0;
     storeToken(@t);

     addReference(ref)
end;

procedure dereference(token: PToken);
var i,j: integer;
begin
     i := locate(token);

     for j := 0 to rix do
     if refArray[j].id = i then
     begin
          token := getTokenByIndex(refArray[j].ref);

          if token^.typeof = tVectorBegin then
          begin
               pushVector(refArray[j].ref);
               exit();
          end
          else if token^.typeof = tNum then
          begin
               push(@st, token);
               exit;
          end;
     end;
end;

function tokenToVector(token: PToken): TVector;
var d:integer;
begin
     result := nil;
     pop(@st, token);
     if token^.typeof = tReserved then d := trunc(token^.value) else exit();

     setLength(result, d);

     while (token^.typeof <> tVectorBegin) do
     begin
         if token^.typeof = tNum then
         begin
              result[d - 1] := token^.value;
              dec(d);
         end;

         pop(@st, token);
     end;
end;

procedure numberWithNumber(op: TTokenType);
var r: TToken;
begin
     r.typeof := tNum;
     case op of
           tMod: if abs(b) < e then r.value := infinity else r.value := frac(a / b) * b;
         tPower: r.value := power(a, b);
     tUnarMinus: r.value := -b;
          tPlus: r.value := a + b;
         tMinus: r.value := a - b;
      tmultiply: r.value := a * b;
        tDivide: if abs(b) < e then r.value := infinity else r.value := a / b;
        else     error();
     end;
     push(@st, @r);
end;

procedure numberWithVector(op: TTokenType);
var vR: TVector;
begin
     case op of
          tPlus: vR := a + vB;
         tMinus: vR := a - vB;
      tMultiply: vR := a * vB;
        tDivide: vR := a / vB;
        else     error();
     end;

     pushVector(vR)
end;

procedure vectorWithVector(op: TTokenType);
var vR: TVector; r: TToken;
begin
     case op of
           tMod: vR := vA mod vB;
     tUnarMinus: vR := -vB;
          tPlus: vR := vA + vB;
         tMinus: vR := vA - vB;
      tMultiply: begin
                      r.typeof := tNum;
                      r.value := vA * vB;
                      push(@st, @r);
                      exit;
                 end;
        tDivide: vR := vA / vB;
        else     error();
     end;

     pushVector(vR)
end;

procedure vectorWithNumber(op: TTokenType);
var vR: TVector;
begin
     case op of
          tPlus: vR := vA + b;
         tMinus: vR := vA - b;
      tMultiply: vR := vA * b;
        tDivide: vR := vA / b;
        else     error();
     end;

     pushVector(vR)
end;

procedure doCalc(state: TCalcState; op: TTokenType; f, last: PToken);
begin
    if f = nil then pop(@st, f);

    case f^.typeof of
         tNum:
             if state = stInput then
             begin
                  b := f^.value;

                  if op = tUnarMinus
                  then numberWithNumber(op)
                  else doCalc(stNumberWith, op, nil, f);
             end
             else if state = stNumberWith then
             begin
                  a := f^.value;
                  numberWithNumber(op);
             end
             else if state = stVectorWith then
             begin
                  a := f^.value;
                  numberWithVector(op);
             end;

        tId:
             if (state = stNumberWith) and (op = tAssign) then
             begin
                  reference(f, b);
             end
             else if (state = stVectorWith) and (op = tAssign) then
             begin
                  reference(f, vB);
             end
             else begin
                  last := f;
                  dereference(f);
                  doCalc(state, op, nil, last)
             end;

    tVectorEnd:
              if state = stInput then
              begin
                   vB := tokenToVector(f);
                   if op = tUnarMinus
                   then vectorWithVector(op)
                   else doCalc(stVectorWith, op, nil, f)
              end
              else if state = stVectorWith then
              begin
                   vA := tokenToVector(f);
                   vectorWithVector(op)
              end
              else if state = stNumberWith then
              begin
                   vA := tokenToVector(f);
                   vectorWithNumber(op);
              end;
    end;
end;

procedure Calc(const inStr: string);
var token, signal: PToken;
    tmp:TToken;
    k:integer;
begin
     k := 0;
     signal := nil;
     repeat
         token := getNextToken(inStr);
         checkSyntax(token);

         token := doPostfix(token, signal);

         while assigned(token) do
         begin
              case token^.typeof of
                     tNum, tId,
                     tVectorBegin: begin push(@st, token); token := nil end;
                     tVectorEnd:
                                begin
                                    tmp.typeof := tReserved;
                                    tmp.value := k + 1;
                                    push(@st, @tmp);
                                    push(@st, token);
                                    k := 0;
                                    token := nil
                                end;

                     tComma: begin inc(k); token := nil end;

                     tPlus,
                     tMinus,
                     tDivide,
                     tMultiply,
                     tUnarMinus,
                     tPower,
                     tAssign  : begin
                                     doCalc(stInput, token^.typeof, nil, nil);
                                     token := signal
                                end;

                     else break;
              end;

              token := doPostfix(token, signal);
         end;

     until assigned(token) and (token^.typeof = tNone);
end;


initialization
              clear(@st);
              setLength(refArray, REF_INIT_LEN);
              a := 0;
              b := 0;
end.

