unit htmlReport;

interface

uses
	Windows, Classes, Dialogs, SysUtils, SHDocVw, DB;

type
	THtmlReport=class(TStringList)
		private
			fTempName:String;
			function SaveToTemp:String;
			function getAccessibleTempName:String;
		public
			procedure OpenInBrowser;
		published
			property TempName: String read fTempName write fTempName;
	end;

// Делает неразрывный пробел из обычного
function null2nbsp(s: String):string;

// Создаёт HTML-заголовок таблицы для заданного датасета, включая все
// его столбцы кроме тех, у которых Tag=exceptTag
function getTableHeader(qry: TDataSet; exceptTag: integer):String;

// Создаёт HTML-строку текущей записи датасета для всех полей, кроме
// тех, у которых Tag=exceptTag. Данные в столбцах, упомянутых в sumFileds,
// прибавляются к тем, которые там уже есть (в виде ИМЯ_ПОЛЯ=ЗНАЧЕНИЕ)
function getTableRow(qry: TDataSet; exceptTag: integer; sumFields: TStringList):String;


implementation

uses globals, ShellApi;

function null2nbsp(s: String):string;
begin
	if (s='') then
		Result:='&nbsp;'
	else
		Result:=s;
end;


function getTableHeader(qry: TDataSet;
  exceptTag: integer): String;
var
	i:integer;
begin
	Result:='<TABLE CELLSPACING=0 CELLPADDING=2 STYLE="border: 1px solid black" ALIGN=CENTER>';
	Result:=Result+'<TR BGCOLOR=CCCCCC>';
	for i:=0 to qry.FieldCount-1 do
		if (qry.Fields[i].Visible)and(qry.Fields[i].Tag<>exceptTag) then
			Result:=Result+'<TD><B>'+qry.Fields[i].DisplayLabel+'</B></TD>';
end;

function getTableRow(qry: TDataSet; exceptTag: integer;
  sumFields: TStringList): String;
var
	i: integer;
begin
	Result:='<TR>';
	for i:=0 to qry.FieldCount-1 do
		if 	((qry.Fields[i].Visible)and(qry.Fields[i].Tag<>exceptTag)) then
			Result:=Result+'<TD>'+null2nbsp(qry.Fields[i].DisplayText)+'</TD>';
	Result:=Result+'</TR>';

	if ((sumFields<>nil)and(sumFields.Count>0)) then
	begin
		for i:=0 to sumFields.Count-1 do
		begin
			if (qry.FieldByName(sumFields.Names[i])<>nil) then
				sumFields.Values[sumFields.Names[i]]:=FloatToStr(StrToFloat(sumFields.Values[sumFields.Names[i]])+qry.FieldByName(sumFields.Names[i]).AsFloat);
		end;
	end;
end;

function THtmlReport.getAccessibleTempName:String;
var
	ht:TextFile;
	opened:boolean;
	nextnum:string;
	name:String;
	i:integer;
begin
	opened:=false;
	nextnum:='';
	repeat
		try
			name:=getTempPath() + '\' + TempName + nextnum + '.html';
			AssignFile(ht,name);
			Rewrite(ht);
			opened:=true;
		except on E:Exception do
			begin
				opened:=false;
				if nextnum='' then
					nextnum:='0';
				nextnum:=IntToStr(StrToInt(nextnum)+1);
			end;
		end;
	until opened=true;
	CloseFile(ht);

	Result:=name;

	for i:=-1 to 50 do
	begin
		if (i>0) then
			name:=getTempPath()+'\'+TempName+IntToStr(i)+'.html'
		else
			name:=getTempPath()+'\'+TempName+'.html';
		if (FileExists(name)) then
		begin
			try
				DeleteFile(name);
			except on E:Exception do
			end;
		end;
	end;
end;

function THtmlReport.SaveToTemp:String;
begin
	Result:=getAccessibleTempName;
	SaveToFile(Result);
end;

procedure THtmlReport.OpenInBrowser;
var
	path:String;
begin
	path:=SaveToTemp();
  ShellExecute(0,  'open', PAnsiChar(path), nil, nil, SW_SHOWNORMAL);

	{f:=navOpenInNewWindow;
	browser:=TWebBrowser.Create(nil);
	browser.Navigate(path,f);
	browser.Free;}
end;

end.
