program Spaces;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Classes,
  Dialogs,
  Windows,
  flcUnicodeCodecs,
  NHunspell,
  ConsoleRus;

type
  TState= (stInput, stMaybeSpaces, stMaybeOneLetterWord, stWord, stEnd, stCheck,
           stWordWithSpaces, stWordWithUnion, stEndWordWithSpaces, stNextWord);

  TWordType = (wtUnknown, wtWord, wtWithUnion, wtSpaces, wtDivider);

  TWord = record
      wordType: TWordType;
      w1, w2, w3: string;
  end;

var
  fin: TStringList;
  fout: TFileStream;
  lastState, state: TState;
  ch, divider: char;
  word: TWord;
  words:array of TWord;
  wIndex: integer;
  pos, len, i, j: integer;
  s, userVariant: string;
  buf: UTF8String;
  spell: TNHunspell;
  tmpStr: TStringList;
  v:integer;

procedure Add(word: TWord);
begin
      if wIndex = length(words) then setLength(words, length(words) + 1);
      words[wIndex] := word;
      inc(wIndex);
end;

procedure changeState(newState: TState);
begin
    lastState := state;
    state := newState;
end;

function isLetter(ch: char): boolean;
begin
    result := charInSet(ch, ['a'..'z', 'A'..'Z', '�'..'�', '�'..'�', '0'..'9']);
   // showMessage(intToStr(ord(ch)));
    if not result then result := ((ord(ch) >= 1072) and (ord(ch) <= 1105)) or
                                 ((ord(ch) >= 1040) and (ord(ch) <= 1071)) or
                                 ((ch = '�') or (ch = '�') or (ch = '�') or (ch = '}'));


end;

function isDivider(ch: char): boolean;
begin
    result := charInSet(ch, ['.', ',', ':', ';', '!', '?', '"', '''', '(', ')',
                            '+', '-', '*', '\', '=', '%', '$', '@', #13, #0]);
end;

procedure wordProc(var word:TWord; c: char);
begin
    case state of
      stInput:
         if isLetter(c) then
         begin
             changeState(stMaybeSpaces);
             word.w1 := c;
             changeState(stInput);
         end
         else begin
               divider := c;
               changeState(stEnd);
         end;

stMaybeSpaces:
         if isLetter(c) then
         begin
              changeState(stWord);
              word.w1 := word.w1 + c;
              changeState(stInput);
         end
         else if c = ' ' then
         begin
              changeState(stMaybeOneLetterWord);
              changeState(stInput);
         end
         else begin
              divider := c;
              changeState(stEnd);
         end;

stMaybeOneLetterWord :
         if isLetter(c) then
         begin
              changeState(stCheck);
              word.w2 := c;
              changeState(stInput);
         end;

        stWord:
          if isLetter(c) then
          begin
               changeState(stWord);
               word.wordType := wtWord;
               word.w1 := word.w1 + c;
               changeState(stInput);
          end
          else if isDivider(c) or (c = ' ') then
          begin
               word.wordType := wtWord;
               divider := c;
               changeState(stEnd);
          end;

        stEnd:;

      stCheck:
          if isLetter(c) then
          begin
              changeState(stWordWithUnion);
              word.w2 := word.w2 + c;
              changeState(stInput);
          end
          else if c = ' ' then
          begin
              changeState(stWordWithSpaces);
              changeState(stInput);
          end;

stWordWithSpaces:
          if isLetter(c) then
          begin
              changeState(stEndWordWithSpaces);
              word.wordType := wtSpaces;
              word.w3 := c;
              changeState(stInput);
          end
          else if isDivider(c) then
          begin
               word.wordType := wtSpaces;
               divider := c;
               changeState(stEnd);
          end
          else if c = ' ' then
          begin
               changeState(stinput);
          end;

stWordWithUnion:
          if isLetter(c) then
          begin
              changeState(stWordWithUnion);
              word.wordType := wtWithUnion;
              word.w2 := word.w2 + c;
              changeState(stInput);
          end
          else if isDivider(c) or (c = ' ') then
          begin
               word.wordType := wtWithUnion;
               divider := c;
               changeState(stEnd);
          end;

stEndWordWithSpaces:
          if isLetter(c) then
          begin
               changeState(stNextWord);
               word.w3 := word.w3 + c;
               changeState(stInput);
          end
          else if isDivider(c) then
          begin
                divider := c;
                word.w2 := word.w2 + word.w3;
                word.w3 := '';
                changeState(stEnd);
          end
          else if c = ' ' then
          begin
              changeState(stWordWithSpaces);
              word.w2 := word.w2 + word.w3;
              word.w3 := '';
              changeState(stInput);
          end;

   stNextWord:
          if isLetter(c) then
          begin
               changeState(stNextWord);
               word.w3 := word.w3 + c;
               changeState(stInput);
          end
          else if isDivider(c) or (c = ' ') then
          begin
              divider := c;
              changeState(stEnd)
          end;
    end;
end;

begin
     ConsoleFont;
     DefaultSystemCodePage := 1251;
     SetConsoleOutputCP(1251);
     SetConsoleCP(1251);

     fin := TStringList.Create;
     fin.LoadFromFile(ParamStr(1));
     fout := TfileStream.Create('out.txt', fmCreate);

     spell := TNHunspell.Create;
     spell.ReadOXT('dict-ru.oxt');
     spell.SpellDictionaries[0].Active := true;
     spell.UpdateAndLoadDictionaries;

     fillChar(word, sizeof(TWord), 0);

     divider := #0;
     pos := 1;
     len := length(fin.Text);
     ch := fin.Text[pos];

     while true do
     begin
          wordProc(word, ch);

          if state = stEnd then
          begin
              if word.wordType <> wtUnknown then Add(word);
              if divider <> #0 then
              begin
                word.wordType := wtDivider;
                word.w1 := divider;
                word.w2 := '';
                word.w3 := '';
                Add(word);
              end;

              fillChar(word, sizeof(TWord), 0);
              divider := #0;

              state := stInput;
              lastState := state;
          end;

          if state = stInput then
          begin
              if  pos > len then break;
              inc(pos);
              ch := fin.Text[pos];

              changeState(lastState)
          end;
     end;

     s := '';

     for i := 0 to length(words) - 1 do
     begin
          case words[i].wordType  of
                 wtWord:
                       s := s + words[i].w1;

                 wtWithUnion:
                       s := s + words[i].w1 + ' ' + words[i].w2;

                 wtSpaces:
                        if not spell.SpellDictionaries[0].Spell(words[i].w1 + words[i].w2) then
                        begin
                            v := 0;
                            tmpStr := TStringList.Create;
                            spell.SpellDictionaries[0].
                                Suggest(words[i].w1 + words[i].w2, tmpStr);

                            if tmpStr.Count > 0 then
                            begin
                                 WriteLn(words[i].w1 + words[i].w2);
                                 WriteLn;
                                 WriteLn('�������� �������:');
                                 for j := 0 to tmpStr.count - 1 do
                                 begin
                                    if j = 0 then WriteLn('0-���� �������');
                                    WriteLn(intToStr(j + 1) + '-' + tmpStr.Strings[j]);
                                 end;

                                 Write('>>');
                                 ReadLn(v);
                            end;

                            if v = 0 then
                            begin
                                Write('>>');
                                ReadLn(userVariant);
                                s := s + trim(userVariant + ' ' + words[i].w3)
                            end
                            else if (v > 0) and (v <= tmpStr.Count) then
                               s := s + trim(tmpStr.Strings[v - 1] + ' ' + words[i].w3);

                            freeAndNil(tmpStr);
                        end
                        else
                           s := s + trim(words[i].w1 + words[i].w2 + ' ' + words[i].w3);

                 wtDivider:
                        s := s + words[i].w1;
          end;


     end;


     buf := UTF16ToEncoding('UTF-8', s);
     fout.WriteBuffer(buf[1], length(buf));

     freeAndNil(fout);
     freeAndNil(fin);
     freeAndNil(spell);
     setLength(words, 0);
end.
