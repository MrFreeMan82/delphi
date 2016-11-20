unit uparser;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, ulexer;

procedure checkSyntax(token: Ptoken);
function doPostfix(token: PToken; out signal: PToken): PToken;
function getSyntaxErrors(): string;
procedure reInitRule();inline;

implementation
uses uStack;

type
     TRuleWord = (C_NOP, C_CONST, C_ID, C_PLUS, C_MINUS, C_MUL, C_DIV, C_MOD, C_POW,
                  C_ASGN, C_UM, C_COMMA, C_IE, C_OP, C_VB, C_E, C_CP, C_VE, C_P, C_K, C_PE);     // Order has rule!!

     Trule = set of TRuleWord;


var
   rules: array [0..2, TTokenType] of Trule;

   stack: TStack;

   currentRule: array of TRule;
   rix: byte = 0;
   top: byte = 0;

   LIST_ERROR: string = '';

const CR_INIT_LEN = 10;

function getSyntaxErrors(): string;
begin
     result := LIST_ERROR
end;

procedure reInitRule;
begin
     currentRule[0] := [C_E];
end;

procedure error();
begin
    LIST_ERROR := LIST_ERROR  + 'Syntax error at ' + intToStr(getLineNo()) + ':' + intToStr(getColNo() - 1) + #13#10;
end;

function popFromRuleStack(): TRuleWord;
var i: TRuleWord;
begin
     for i in TRuleWord do
     if i in currentRule[top] then
     begin
          result := i;
          currentRule[top] -= [i];
          if (currentRule[top] = []) then
          begin
               rix := top;
               if top > 0 then dec(top)
          end;
          break
     end;
end;

procedure pushToRuleStack(value: Trule);
begin
     if rix = length(currentRule) then setLength(currentRule, length(currentRule) + CR_INIT_LEN);
     currentRule[rix] += value;
     top := rix;
     inc(rix)
end;

function priority(token: PToken): integer;
begin
     case token^.typeof of
                 tAssign : result := 5;
           tPlus, tMinus : result := 10;
       tMultiply, tDivide,
                    tMod : result := 20;
                  tPower : result := 30;
              tUnarMinus : result := 40;
                      else result := 0;
     end;
end;

function instructionEnd(token: PToken; out signal: PToken): PToken;
begin
     if token^.typeof = tNone then exit(token);
     if stack.empty then exit(nil);
     pop(@stack, result);
     signal := token;
end;

function comma(token: PToken; out signal: PToken): PToken;
begin
     if stack.empty then exit(nil);

     if read(@stack)^.typeof = tVectorBegin then exit(token);      // Не извлекаем tVectorBegin так как он в дольнейшем нужен
     pop(@stack, result);
     signal := token;
end;

function vectorEnd(token: PToken; out signal: PToken): PToken;
begin
     if not stack.empty then exit(nil);
     pop(@stack, result);
     if result^.typeof = tVectorBegin then exit(token);
     signal := token;
end;

function vectorBegin(token: PToken): PToken;
begin
     push(@stack, token);
     result := token;
end;

function openParenthses(token: PToken): PToken;
begin
    push(@stack, token);
    result := token;
end;

function closeParenthses(token: PToken; out signal: PToken): PToken;
begin
      pop(@stack, result);
      if result^.typeof = tOpParenthes then result := nil;
      signal := token;
end;

function other(token: PToken; out signal: PToken): PToken;
var p1, p2: integer;
    t: TToken;
begin
     result := nil;
     signal := nil;
     with token^ do
     begin
          if stack.empty then
          begin
               push(@stack, token);
          end
          else begin
               result := read(@stack);
               p1 := priority(token);
               p2 := priority(result);

               if p1 > p2 then
               begin
                    push(@stack, token);
                    result := nil;
               end
               else if p1 <= p2 then
               begin
                    pop(@stack, result);
                    t := result^;
                    push(@stack, token);
                    result := @t;
               end
          end
     end
end;

function doPostfix(token: PToken; out signal: PToken): PToken;
begin
   result := nil;
   signal := nil;
   if token = nil then exit;

   case token^.typeof of

        tNone,
        tInstructionEnd: result := instructionEnd(token, signal);

         tComma: result := comma(token, signal);

          tVectorEnd: result := vectorEnd(token, signal);

           tVectorBegin: result := vectorBegin(token);

             tOpParenthes: result := openParenthses(token);

              tClParenthes: result := closeParenthses(token, signal);

              tNum, tId: result := token;

         else result := other(token, signal);
     end;
end;

procedure terminal(r: TruleWord; token: PToken);
begin
     with token^ do
     begin
          if ((r = C_CONST) and (typeof = tNum)) or
             ((r = C_ID) and (typeof = tId)) or
             ((r = C_PLUS) and (typeof = tPlus)) or
             ((r = C_MINUS) and (typeof = tMinus)) or
             ((r = C_MUL) and (typeof = tMultiply)) or
             ((r = C_DIV) and (typeof = tDivide)) or
             ((r = C_MOD) and (typeof = tMod)) or
             ((r = C_POW) and (typeof = tPower)) or
             ((r = C_OP) and (typeof = tOpParenthes)) or
             ((r = C_CP) and (typeof = tClParenthes)) or
             ((r = C_VB) and (typeof = tVectorBegin)) or
             ((r = C_VE) and (typeof = tVectorEnd)) or
             ((r = C_ASGN) and (typeof = tAssign)) or
             ((r = C_COMMA) and (typeof = tComma)) or
             ((r = C_IE) and (typeof = tInstructionEnd)) or
             ((r = C_UM) and (typeof = tUnarMinus)) or
             ((r = C_PE) and (typeof = tNone)) then
          begin
          end
          else
              error();  // Unexpected statement
     end
end;

procedure notTerminal(r: TRuleWord; token: PToken);
var rule: Trule;
begin
     case r of
           C_E: rule := rules[0, token^.typeof];
           C_P: rule := rules[1, token^.typeof];
           C_K: rule := rules[2, token^.typeof];
           else error();
     end;

     pushToRuleStack(rule);
end;

procedure checkSyntax(token: PToken);
var r: TruleWord;
begin
     while (currentRule[top] <> []) do
     begin
           r := popFromruleStack();
           case r of
               C_NOP:;

               C_E, C_P, C_K:
                       notTerminal(r, token);

               else begin
                         terminal(r, token);
                         exit;
               end;
           end;
     end;

     if token^.typeof <> tNone then error();
end;

initialization
              clear(@stack);
              setLength(currentRule, CR_INIT_LEN);
              currentRule[0] := [C_E];
//               c   x   +   -   *   /   ^     --    (    )  none   \    :=   ;   {    }    ,
//            E cP  xP                        --K   (E)P                         {E}P
//            P         +E  -E  *E  /E  ^E                #   $     \E   :=E  ;E       #    ,E
//            K     xP                              (E)P                         {E}P

              rules[1, tNone]                := [C_PE];
              rules[0, tNum]                 := [C_CONST, C_P];
              rules[0, tId]                  := [C_ID, C_P];
              rules[1, tPlus]                := [C_PLUS, C_E];
              rules[1, tMinus]               := [C_MINUS, C_E];
              rules[1, tMultiply]            := [C_MUL, C_E];
              rules[1, tDivide]              := [C_DIV, C_E];
              rules[1, tMod]                 := [C_MOD, C_E];
              rules[1, tPower]               := [C_POW, C_E];
              rules[0, tUnarMinus]           := [C_UM, C_K]; // '--(E)P';
              rules[0, tOpParenthes]         := [C_OP, C_E, C_CP, C_P]; //'(E)P';
              rules[1, tClParenthes]         := [C_NOP];
              rules[1, tAssign]              := [C_ASGN, C_E]; //':=E';
              rules[0, tVectorBegin]         := [C_VB, C_E, C_VE, C_P]; //'{E}P';
              rules[1, tVectorEnd]           := [C_NOP];
              rules[1, tComma]               := [C_COMMA, C_E];
              rules[1, tInstructionEnd]      := [C_IE, C_E];
              rules[2, tId]                  := [C_ID, C_P];
              rules[2, tOpParenthes]         := [C_OP, C_E, C_CP, C_P];
              rules[2, tVectorBegin]         := [C_VB, C_E, C_VE, C_P];

end.

