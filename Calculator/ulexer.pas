unit ulexer;

{$mode objfpc}{$H+}

interface

uses
  SysUtils;

const MAX_ID_LEN = 7;

type
    TTokenType = (tNone, tNum, tId, tFunc, tPlus, tMinus, tMultiply, tDivide, tMod, tPower,
                  tUnarMinus, tOpParenthes, tClParenthes,  tAssign, tVectorBegin, tVectorEnd,
                  tComma, tInstructionEnd, tReserved);    /// tNone - must be first and tInstructionEnd last!!!

    PToken = ^TToken;
    TToken = record
           id     : cardinal;
           typeof : TTokenType;
           case byte of
                1: (value: double);
                2: (name: string[MAX_ID_LEN]);

    end;

function getNextToken(const inStr: string): PToken;
function getLexErrors(): string;
function getLineNo(): integer;
function getColNo(): integer;
function getTokenCnt(): integer;
procedure setColNoFirst();inline;

implementation
uses usymbols, math;

type TState = (stInput, stDelimOrDoubleDelim, stMaybeNegNum, stDelimetrFinal,
               stNumber, stFloat, stScience, stScienceOrder, stNumberFinal,
               stId, stIdFinal, stFuncFinal);

const
      SET_DELIMS : set of char  = ['+','-','*','/', '\', '^', '(',')',':', ';', '{', '}', ',']; // -- Unar Minus  := Assign  \ - Modulus  |-vector scalar mul

var
   lineNo: integer = 1;
   colNo: integer = 1;
   tokencnt: integer = 0;

   sign:     shortInt = 1;
   mantissa: double = 0.0;
   manOrder: integer = 0;
   scSign:   shortInt = 1;
   scOrder:  integer = 0;

   LIST_ERROR: string = '';

   state, lastState: TState;

   token, lastToken: TToken;

procedure error(const errStr: string);
begin
    LIST_ERROR := LIST_ERROR + errStr + ' at ' + intToStr(lineNo) + ':' + intToStr(colNo) + #13#10;
end;

procedure changeState(newState: TState);inline;
begin
      lastState := state;
      state := newState;
end;

procedure insertToken(var token : TToken);
begin
      token.id := tokencnt + 1;
      if (locate(@token) < 0) then insert(@token);

      lastToken := token;
      state     := stInput;
      lastState := stInput;

      sign := 1;
      mantissa := 0.0;
      manOrder := 0;
      scSign := 1;
      scOrder := 0;

      inc(tokencnt);
end;

function delimetrProc(ch: char; var token: TToken): boolean;
begin
      result := false;
      case state of

           stInput:
                   if ch = ':' then
                   begin
                        changeState(stDelimOrDoubleDelim);
                        token.name := ch;
                        changeState(stInput);
                        result := true;
                   end
                   else if ch = '-' then
                   begin
                        changeState(stMaybeNegNum);
                        token.name := ch;
                        changeState(stInput);
                        result := true;
                   end
                   else if ch in SET_DELIMS then
                   begin
                        changeState(stDelimetrFinal);
                        token.name := ch;
                        inc(colNo);
                        result := true;
                   end
                   else if ch = #13 then
                   begin
                        inc(lineNo);
                        result := true;
                   end
                   else if ch in [' ', #0] then result := true;

     stMaybeNegNum:
                   if ch in ['0'..'9'] then
                   begin
                        if (tokencnt = 0) or
                            (lastToken.typeof in [tPlus..tInstructionEnd]) then
                        begin
                             changeState(stNumber);
                             sign := -1;
                             token.value := ord(ch) - ord('0');
                             changeState(stInput);
                        end
                        else begin
                             changeState(stDelimetrFinal);
                        end;

                        result := true;
                   end
                   else if ch in ['a'..'z', 'A'..'Z', '_'] then
                   begin
                        changeState(stDelimetrFinal);
                        if (tokencnt = 0) or
                            (lastToken.typeof in [tPlus..tInstructionEnd]) then token.name += '-';   // Unar minus
                        result := true;
                   end
                   else if ch = '(' then
                   begin
                        changeState(stDelimetrFinal);
                        if (tokencnt = 0) or
                            (lastToken.typeof in [tPlus..tInstructionEnd]) then token.name += '-';   // Unar minus
                        result := true;
                   end
                   else begin
                        changeState(stDelimetrFinal);
                        result := true;
                   end;

stDelimOrDoubleDelim:
                   if ch = '=' then
                   begin
                       changeState(stDelimetrFinal);
                       token.name += ch;
                       inc(colNo);
                       result := true;
                   end
                   else begin
                        error('Unknown statement ' + token.name + ch);

                        token.name := '';
                        result := true;
                   end;
      end;
end;

function numberProc(ch: char; var token: TToken): boolean;
begin
      result := false;
      case state of

           stInput:
                   if ch in ['0'..'9'] then
                   begin
                       changeState(stNumber);
                       token.value := ord(ch) - ord('0');
                       changeState(stInput);
                       result := true;
                   end;

          stNumber:
                   if ch in ['0'..'9'] then
                   begin
                       changeState(stNumber);
                       token.value := token.value * 10 + ord(ch) - ord('0');
                       changeState(stInput);
                       result := true;
                   end
                   else if ch = '.' then
                   begin
                       changeState(stFloat);
                       changeState(stInput);
                       result := true;
                   end
                   else begin
                       changeState(stNumberFinal);
                       if sign < 0 then token.value := -token.value;
                       result := true;
                   end;

           stFloat:
                   if ch in ['0'..'9'] then
                   begin
                       changeState(stFloat);
                       inc(manOrder);
                       mantissa := mantissa * 10 + ord(ch) - ord('0');
                       changeState(stInput);
                       result := true;
                   end
                   else if ch in ['e','E'] then
                   begin
                       changeState(stScience);
                       changeState(stInput);
                       result := true;
                   end
                   else begin
                       changeState(stNumberFinal);
                       if manOrder > 0 then token.value += mantissa / 10 ** manOrder;
                       if sign < 0 then token.value := -token.value;
                       result := true;
                   end;

         stScience:
                   if ch in ['+', '-'] then
                   begin
                       changeState(stScienceOrder);
                       if ch = '-' then scSign := -1 else scSign := 1;
                       changeState(stInput);
                       result := true;
                   end
                   else begin
                       error('Invalid number format ' + token.name + ch);
                       result := true;
                   end;

    stScienceOrder:
                   if ch in ['0'..'9'] then
                   begin
                       changeState(stScienceOrder);
                       scOrder := scOrder * 10 + ord(ch) - ord('0');
                       changeState(stInput);
                       result := true;
                   end
                   else begin
                       changeState(stNumberFinal);
                       if manOrder > 0 then token.value += mantissa / 10 ** manOrder;
                       if scOrder <> 0 then token.value += power(10, scOrder * scSign);
                       if sign < 0 then token.value := -token.value;
                       result := true;
                   end;
      end;
end;

function idProc(ch: char; var token: TToken): boolean;
begin
     result := false;
     case state of

         stInput:
                  if ch in ['a'..'z', 'A'..'Z', '_'] then
                  begin
                       changeState(stId);
                       token.name := ch;
                       changeState(stInput);
                       result := true;
                  end;

            stId:
                  if ch in ['a'..'z', 'A'..'Z', '_', '0'..'9'] then
                  begin
                       changeState(stId);
                       if length(token.name) < MAX_ID_LEN
                       then token.name += ch
                       else error('Max length of id is ' + intToStr(MAX_ID_LEN));
                       changeState(stInput);
                       result := true;
                  end
                  else if ch = '(' then
                  begin
                       changeState(stFuncFinal);
                       result := true;
                  end
                  else begin
                       changeState(stIdFinal);
                       result := true;
                  end;
     end;
end;

procedure setTokenTypeForDelims(var token: TToken);
begin
     if token.name = '--' then token.typeof := tUnarMinus
     else if token.name = ':=' then token.typeof := tAssign
     else
     case token.name[1] of
            '+': token.typeof := tPlus;
            '-': token.typeof := tMinus;
            '*': token.typeof := tMultiply;
            '/': token.typeof := tDivide;
            '\': token.typeof := tMod;
            '^': token.typeof := tPower;
            '(': token.typeof := tOpParenthes;
            ')': token.typeof := tClParenthes;
            '{': token.typeof := tVectorBegin;
            '}': token.typeof := tVectorEnd;
            ',': token.typeof := tComma;
            ';': token.typeof := tInstructionEnd;
            else token.typeof := tNone;
     end;
end;

function getNextToken(const inStr: string): PToken;
var ch: char;
    len: integer;
begin
      ch := inStr[colno];
      token.typeof := tNone;
      token.value := 0;
      result := @token;
      len := length(inStr);

      while true do
      begin
           case state of
                stInput:
                        begin
                             if  delimetrProc(ch, token) or
                                 numberProc(ch, token) or
                                 idProc(ch, token) then
                             begin
                             end
                             else begin
                                  error('Unknown symbol ' + ch);
                             end;
                        end;
   stMaybeNegNum,
   stDelimOrDoubleDelim:
                        delimetrProc(ch, token);

        stDelimetrFinal:
                        begin
                             setTokenTypeForDelims(token);
                             insertToken(token);
                             exit(@token);
                        end;

         stNumber,
         stFloat,
         stScience,
         stScienceOrder:
                        numberProc(ch, token);

          stNumberFinal:
                        begin
                             token.typeof := tNum;
                             insertToken(token);
                             exit(@token);
                        end;

                   stId:
                        idProc(ch, token);

              stIdFinal:
                        begin
                             token.typeof := tId;
                             insertToken(token);
                             exit(@token);
                        end;

            stFuncFinal:
                        begin
                             token.typeof := tFunc;
                             insertToken(token);
                             exit(@token);
                        end;
           end;

           if state = stInput then
           begin
                if colno > len then break;

                inc(colNo);
                ch := inStr[colNo];

                changeState(lastState);
           end;
      end;
end;

function getLexErrors: string;
begin
  result := LIST_ERROR
end;

function getLineNo: integer;
begin
    result := lineNo;
end;

function getColNo: integer;
begin
    result := colNo
end;

function getTokenCnt: integer;
begin
     result := tokenCnt;
end;

procedure setColNoFirst;
begin
  colNo := 1;
end;

end.

