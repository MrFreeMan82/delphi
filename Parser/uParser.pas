﻿unit uParser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, DBXJSON;

type
  TForm1 = class(TForm)
    IdHTTP: TIdHTTP;
    Memo1: TMemo;
    edURL: TEdit;
    btParse: TButton;
    procedure btParseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    lst: TStringList;

    function parse(JSONname, JSONValue: string; raw:boolean = false): string;
    function trimJSON(s: string) :string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses StrUtils, idURI;

{$R *.dfm}

function TForm1.trimJSON(s: string): string;
var i:integer;
begin
     result := '';

     for i := 1 to length(s) do
     begin
          if ansichar(s[i]) in [' ', #13, #10] then continue;
          result := result + s[i];
     end;
end;

function checkJSONArray(JSONValue: string; JSONArray: TJSONArray):string;
var i, j: integer;
    LJsonValue : TJSONValue;
    LItem     : TJSONValue;
    pair:TJSONPair;
begin
      result := '';

     for i := 0 to JSONArray.Size - 1 do
     begin
          LJsonValue := JSONArray.Get(i);
          for j := 0 to TJSONArray(LJsonValue).Size - 1 do
          begin
              LItem := TJSONArray(LJsonValue).Get(j);
              pair := TJSONPair(LItem);

              if pair.JsonString.Value = JSONValue then
              begin
                  result :=  pair.JsonValue.Value;
                  break
              end
              else if pair.JsonValue is TJSONArray then
              begin
                  result := checkJSONArray(JSONValue, pair.JsonValue as TJSONArray);
                  if result <> '' then break;
              end;
          end;
     end;
end;


function TForm1.parse(JSONname, JSONValue: string; raw:boolean = false): string;
var i,l,r:integer;
    s: string;
    json: TBytes;
    pair: TJSONPair;
    JS: TJSONObject;
begin
     result := '';
     i := pos(JSONname, lst.Text);
     if i = 0 then exit;

     if raw then
     begin
          i := posEx('''', lst.Text, i) + 1;
          if i = 0 then exit;
          l := posEx('''', lst.Text, i);
          if l = 0 then exit;
     end
     else begin
          i := posEx('{', lst.Text, i);
          if i = 0 then exit;
          l := posEx(';', lst.Text, i);
          if l = 0 then exit;
     end;

     s := midStr(lst.Text, i, l - i);
     s := trimJSON(s);

     if raw then s := TidURI.URLDecode(s);
     json := bytesOf(s);

     JS :=  TJSONObject.Create;
     r := JS.Parse(json, 0);
     if r < 0 then
     begin
          JS.Free;
          exit;
     end;

     for i := 0 to JS.Size - 1 do
     begin
          pair := JS.Get(i);
          if pair.JsonString.Value = JSONValue then
          begin
               result :=  pair.JsonValue.Value;
               break
          end
          else if pair.JsonValue is TJSONArray then
          begin
               result := checkJSONArray(JSONValue, pair.JsonValue as TJSONArray);
               if result <> '' then break;
          end;
     end;
     JS.Free;
end;

procedure TForm1.btParseClick(Sender: TObject);
begin
        lst.Clear;
      //  lst.LoadFromFile('tmp.txt');
        lst.Add(idHTTP.Get(edURL.Text));
        memo1.Lines.Append('Цена = ' + parse('pricerawjson', 'price', true));
        memo1.Lines.Append('Продукт = ' + parse('searchImpressions', 'eventProductName'));

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     lst := TStringList.Create;

end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
     freeAndNil(lst);
end;

end.
