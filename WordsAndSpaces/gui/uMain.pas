unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TState= (stInput, stMaybeSpaces, stMaybeOneLetterWord, stWord, stEnd, stCheck,
           stWordWithSpaces, stWordWithUnion, stEndWordWithSpaces, stNextWord);

  TfrmSpaces = class(TForm)
    mInput: TMemo;
    mOutput: TMemo;
    btBegin: TButton;
    btSave: TButton;
    procedure btBeginClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
  private
    { Private declarations }

    lastState, state: TState;
    ch, divider: Char;
    w1, w2, w3: string;
    pos, len: integer;

    procedure changeState(newState: TState);
    function isLetter(ch: char): boolean;
    function isDivider(ch: char): boolean;
    procedure wordProc(c: char);
  public
    { Public declarations }
  end;

var
  frmSpaces: TfrmSpaces;

implementation

{$R *.dfm}

{ TfrmSpaces }

procedure TfrmSpaces.btBeginClick(Sender: TObject);
begin
     mInput.Lines.LoadFromFile(ParamStr(1));
     mOutPut.Lines.Clear;
     w1 := ''; w2 := ''; w3 := '';

     divider := #0;
     pos := 1;
     len := length(mInput.Lines.Text);
     ch := mInput.Lines.Text[pos];

     while true do
     begin
          wordProc(ch);

          if state = stEnd then
          begin
              mOutput.Lines.Add(w1);
              mOutput.Lines.Add(w2);
              //fout.Append(w1 + w2);
              if w3 <> '' then
              begin
                 mOutput.Lines.Add(w3);
                 //fout.Append(w3);
              end;

              if not charInSet(divider, [#0, #13]) then mOutput.Lines.Add(divider);// fout.Append(divider);

              w1 := ''; w2 := ''; w3 := ''; divider := #0;

              state := stInput;
              lastState := state;
          end;

          if state = stInput then
          begin
              if  pos > len then break;
              inc(pos);
              ch := mInput.Lines.Text[pos];

              changeState(lastState)
          end;
     end;

end;

procedure TfrmSpaces.btSaveClick(Sender: TObject);
begin
    mOutput.Lines.SaveToFile('out.txt', TEncoding.Unicode);
end;

procedure TfrmSpaces.changeState(newState: TState);
begin
    lastState := state;
    state := newState;
end;

function TfrmSpaces.isDivider(ch: Char): boolean;
begin
    result := charInSet(ch, ['.', ',', ':', ';', '!', '?', '"', '''', '(', ')',
                     '+', '-', '*', '\', '=', '%', '$', '@', #13, #0]);
end;

function TfrmSpaces.isLetter(ch: char): boolean;
begin
    result := charInSet(ch, ['a'..'z', 'A'..'Z', 'à'..'ÿ', 'À'..'ß', '0'..'9']);
   //   showMessage(intToStr(ord(ch)));
    if not result then result := ((ord(ch) >= 1072) and (ord(ch) <= 1103)) or
                                 ((ord(ch) >= 1040) and (ord(ch) <= 1071));
end;

procedure TfrmSpaces.wordProc(c: char);
begin
    case state of
      stInput:
         if isLetter(c) then
         begin
             changeState(stMaybeSpaces);
             w1 := c;
             changeState(stInput);
         end;

stMaybeSpaces:
         if isLetter(c) then
         begin
              changeState(stWord);
              w1 := w1 + c;
              changeState(stInput);
         end
         else if c = ' ' then
         begin
              changeState(stMaybeOneLetterWord);
              changeState(stInput);
         end;

stMaybeOneLetterWord :
         if isLetter(c) then
         begin
              changeState(stCheck);
              w2 := c;
              changeState(stInput);
         end;

        stWord:
          if isLetter(c) then
          begin
               changeState(stWord);
               w1 := w1 + c;
               changeState(stInput);
          end
          else if isDivider(c) or (c = ' ') then
          begin
               divider := c;
               changeState(stEnd);
          end;

        stEnd:;

      stCheck:
          if isLetter(c) then
          begin
              changeState(stWordWithUnion);
              w2 := w2 + c;
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
              w3 := c;
              changeState(stInput);
          end
          else if isDivider(c) then
          begin
               divider := c;
               changeState(stEnd);
          end;

stWordWithUnion:
          if isLetter(c) then
          begin
              changeState(stWordWithUnion);
              w2 := w2 + c;
              changeState(stInput);
          end
          else if isDivider(c) or (c = ' ') then
          begin
               divider := c;
               changeState(stEnd);
          end;

stEndWordWithSpaces:
          if isLetter(c) then
          begin
               changeState(stNextWord);
               w3 := w3 + c;
               changeState(stInput);
          end
          else if isDivider(c) then
          begin
                divider := c;
                changeState(stEnd);
          end
          else if c = ' ' then
          begin
              changeState(stWordWithSpaces);
              w2 := w2 + w3;
              w3 := '';
              changeState(stInput);
          end;

   stNextWord:
          if isLetter(c) then
          begin
               changeState(stNextWord);
               w3 := w3 + c;
               changeState(stInput);
          end
          else if isDivider(c) or (c = ' ') then
          begin
              divider := c;
              changeState(stEnd)
          end;
    end;
end;

end.
