unit spellChecker;

interface

uses
    Classes, RegExpr, WordXP, ComCtrls, Variants, Graphics;

type
	// "Проверяльщик орфографии" - проверяет орфографию
    // Вородовским спеллчекером
	TSpellChecker=class
	private
		langId:OleVariant;
		wordDoc:TWordDocument;
		rusDict:OleVariant;
//		ukrDict:OleVariant;
		customDicts:array[1..10] of OleVariant;
	  function getSuggestions(w:String):TStringList;
		function isCorrect(w:String):boolean;
	public
		constructor Create();
    destructor Destroy();override;
    procedure CheckSpelling(mm:TCustomRichEdit);
	end;

var
	speller:TSpellChecker;

implementation

uses main;

constructor TSpellChecker.Create;
var
	iv:OleVariant;
	i:integer;
begin
	  wordDoc:=TWordDocument.Create(nil);
    wordDoc.ActiveWindow.Visible := false;

	  langId:=1049; // Номер языка "русский"
	  rusDict:=wordDoc.Application.Languages.Item(langId).ActiveSpellingDictionary;

//  Украинская орфография (по крайней мере, с Вордом-2000) нормально не проверяется.
//  Возможно, дело в том, что модуль проверки украинской орфографии работает не так,
//  как русской и английской - может, его писали не в Микрософте, а кто-то у нас,
//  не знаю...
//	langId:=1058; // Номер языка "украинский"
//	ukrDict:=wordDoc.Application.Languages.Item(langId).ActiveSpellingDictionary;

	// Заполняем список пользовательских словарей (обычно он оказвается пустым)
	  iv:=1;
	  for i:=1 to 10 do
	  begin
		    iv:=i;

		    if (wordDoc.Application.CustomDictionaries.Count>=i) then
			        customDicts[i]:=wordDoc.Application.CustomDictionaries.Item(iv)
		    else
			        customDicts[i]:=UnAssigned;
    end;
end;

// Возвращает набор слов, на которые Ворд предлагает
// заменить указанное слово
function TSpellChecker.getSuggestions(w:String):TStringList;
var
	suggs:SpellingSuggestions;
	i:integer;
	iv,bv,smv:OleVariant;
	nullDict:OleVariant;
begin
	bv:=false;
	smv:=0;
	nullDict:=UnAssigned;

	suggs:=wordDoc.Application.GetSpellingSuggestions(w,
													  nullDict,
													  bv,
													  rusDict,
													  smv,
													  nullDict,nullDict,nullDict,
													  nullDict,nullDict,nullDict,
													  nullDict,nullDict,nullDict);
	Result:=TStringList.Create;
	for i:=1 to suggs.Count do
	begin
		iv:=i;
		Result.Add(suggs.Item(iv).Name);
	end;
end;


// Проверяет Вордом правильность одного слова
function TSpellChecker.isCorrect(w:String):boolean;
var
	bv:OleVariant;
	nullDict:OleVariant;
	res:boolean;
begin
	bv:=true;
	nullDict:=Unassigned;

	res:=wordDoc.Application.CheckSpelling(w,nullDict,bv,rusDict,
										   nullDict,nullDict,nullDict,
										   nullDict,nullDict,nullDict,
										   nullDict,nullDict,nullDict);
	Result:=res;
end;


// Проверка орфографии для указанного РичЭдита
procedure TSpellChecker.CheckSpelling(mm:TCustomRichEdit);
var
	i:integer;
	re:TRegExpr;
	words:TStringList;
	passed:integer;
begin
    if (mm.Visible) then
    begin
		// Разбиваем весь текст на отдельные слова, правильность которых
		// и будем проверять.
		re:=TRegExpr.Create;
		re.Expression:='\s';
		words:=TStringList.Create;
		re.Split(mm.Text,words);
		passed:=0;

		for i:=0 to words.Count-1 do
		begin
			if (not isCorrect(words[i])) then
			begin
				// Есть ошибка - выделим слово
				mm.SelStart:=passed;
				mm.SelLength:=length(words[i]);
				mm.SelAttributes.Color:=clRed;
				mm.SelAttributes.Style:=[fsBold];
			end;
			passed:=passed+length(words[i])+1;
		end;

		mm.SelStart:=length(mm.Text);
		words.Free;
    Re.free;
	end;

end;

destructor TSpellChecker.Destroy;
begin
  wordDoc.Free;
end;

end.
