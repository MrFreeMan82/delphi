unit globals;

interface

uses Classes, WinSock, Windows, SqlExpr, DBClient, Graphics, DB, SysUtils, ZLib,
	 GraphicEx, jpeg, shellApi;

//------------------------------------------------------------------------------

type
	TEntityFormMode = (fmAdd, fmEdit, fmView);

//------------------------------------------------------------------------------

const
	// милиметров в дюйме
    MM_PER_INCH         :integer    = 25;

    // разрешение в модульных объявлениях, dpi
    MODULE_RESOLUTION   :integer = 300;

	// газеты
  GZ_PR				:integer = 1;
	GZ_NS				:integer = 2;
	GZ_ST				:integer = 3;
	GZ_RZ				:integer = 4;
	GZ_RK				:integer = 5;
  GZ_REG      :integer = 6;

	// форматы
	FORMAT_KA			:integer = 14;
	FORMAT_VIP			:integer = 15;
	FORMAT_EXCLAM		:integer = 17;

	// названия файлов шаблонов экспорта
	headerTempl 		:string	= 'header.txt';
	rubTempl			:string = 'rub.txt';
	objavTempl			:string = 'objav.txt';
	objavExclamationTempl :string = 'objav_exclamation.txt';
	custInfoTempl		:string = 'custinfo.txt';
	kaTableTempl		:string = 'katable.txt';
	kaInfoTempl			:string = 'kainfo.txt';
  objavFrameTempl :string = 'objav_ramka.txt';


	//рубрики
	RUBRIKA_GOR_UNLOCK	:integer = 1;
	RUBRIKA_GOR_LOCK	:integer = 100;

    // типы сделок
    SD_TYPE_GAZETA		:integer = 1;
    // таких уже не бывает
    SD_TYPE_DOUBLE		:integer = 2;
    SD_TYPE_KA			:integer = 3;
    SD_TYPE_INTERNET	:integer = 4;
    SD_TYPE_INT_REGION: integer = 6;

    // подачи-запасы
    ZAPAS_PR			:integer = 0;
	ZAPAS_NS			:integer = 1;
	ZAPAS_ST			:integer = 2;

	// числовые идентификаторы типов пользователей. Ещё есть тип TUser - вверху модуля...
	PRG_USR_PAYMENTS    :integer = 4;
	PRG_USR_AGENT       :integer = 3;
	PRG_USR_MANAGER     :integer = 2;
	PRG_USR_ADMIN       :integer = 1;
	PRG_USR_NABOR       :integer = 5;
	PRG_USR_KORRECTURA  :integer = 6;
	PRG_USR_VERSTKA     :integer = 7;
	PRG_USR_DESIGN      :integer = 8;
  PRG_USR_SITE_ADMIN  :integer = 9;
  PRG_USR_VIEWER      :integer = 10;

	// код русского языка у Ворда
	LANG_RUS = 1049;

	TRANSACTION_AGENT_SDAL :integer = 2;

	// "Диагнозы", с которыми объявление появляется у верстальщика
	// в списке изменений, которые нужно внести в газету
	DIAGNOZ_NEW     :integer = 1;
	DIAGNOZ_DELETED :integer = 2;
	DIAGNOZ_CHANGED :integer = 3;

	// Статусы сделок. См. таблицу SDELKA_STATE
	SD_NEW      :integer = 1;
	SD_READY    :integer = 2;
	SD_TO_PAY   :integer = 3;
	SD_CURRENT  :integer = 4;
	SD_OLD      :integer = 5;
	SD_DELETED  :integer = 100;

	// Формы оплаты. См. таблицу PAY_TYPE
	PAY_NAL             :integer = 1;
	PAY_BEZNAL          :integer = 2;
	PAY_CREDIT          :integer = 3;
	PAY_BARTER          :integer = 4;
	PAY_BEZNAL_V_NAL    :integer = 5;
  PAY_KASSA           :integer = 6;

    // Статусы синхронизации
    SYNC_JOINED     :integer = 0;
    SYNC_CENTRAL    :integer = 1;
    SYNC_FILIAL     :integer = 2;
    SYNC_JOINING    :integer = 3;
    SYNC_READONLY   :integer = 4;

    // Статусы объявлений
    OB_STATE_NABOR = 0;
    OB_STATE_CORRECTURE = 1;
    OB_STATE_REPAIR = 2;
    OB_STATE_DESIGN = 3;
    OB_STATE_VERSTKA = 4;


//------------------------------------------------------------------------------

type
	// Типы пользователей. Кроме такого набора есть ещё числовые константы
	// (как в БД) типа PRG_USR_xxx. Конвертирование из одного способа
	// представления в другой: data.int2user(userType:integer):TUser
	TUser = (uAgent, uManager, uAdmin, uNabor, uCorrector, uVerstka, uDesigner, uPayments, uSiteAdmin, uViewer);

	// Класс-оболочка для хранения целых чисел как ссылки на объект,
	// например - в TList.Objects
	TIntHolder = class
	public
		value:integer;
	end;

procedure StrToClipboard(const txt :string);

//------------------------------------------------------------------------------
// Растягивает заданную картинку с соблюдением пропорций
procedure Streach(sourceBmp: TBitmap; destBmp: TBitmap; DestWidth, DestHeight: integer);

// Делает картинку черно-белой
procedure BMPxGrayScale(ABitMap: TBitMap);
//procedure BMPxGrayScale(ABitMap: TBitMap);

// Очищает значение параметра, если оно равно 0
procedure zero2null(param: TParam);

// Получаем название текущего компьютера
function getLocalHostName:String;

// Временный каталог Windows
function getTempPath:String;

// Логин пользователя в Винде
function userAccount: ShortString;

// Запись сообщения в файл c:\pi.log
procedure writeLog(s:string);

// Сследующее значение генератора по его имени

// Конвертирует тип пользователя из числового, который в БД, в TUser
function int2user(u:integer):TUser;

// Рефрешит ДатаСет таким образом, чтобы обойти странное функционирование
// dbExpress при работе нескольких пользователей
procedure RefreshClientDataSetFully(qry: TSQLquery; cds: TClientDataSet);

// То же, что и предыдущая процедура, но пытается сохранить текущую позицию курсора
procedure RefreshClientDataSetFullySavingPos(qry: TSQLquery; cds: TClientDataSet);

// Грузит содержимое заархивированного БЛОБ-поля в TPicture, считая, что
// это - TIFF или BMP файл
//function PictureFromCompressedField(APicture: TPicture; AField: TBlobField): boolean;
procedure PictureFromCompressedFieldNew(APicture: TPicture; AField: TBlobField; const ext: string; tiffPreview: boolean);

// Сохраняет картинку TIFF в БЛОБ поле
procedure PictureToCompressedField(APicture: TPicture; AField: TBlobField);

// Разархивирует и сохраняет в файл содержиме БЛОБ-поля
procedure FileFromCompressedField(AField: TBlobField; AFileName: String);

// Копирует Блоб Поля
procedure CopyCompressedField(ASrc, ADest: TBlobField);

// Архивирует и записывает в поле указанный файл
procedure FileToCompressedField(AFileName: String; AField: TBlobField);

procedure FileToPicture(const AfileName:string; APicture: TPicture);

procedure EpsToFile(AEPSField: TBlobField; AFileName: string);

procedure SavePos(cds: TClientDataset);
procedure LoadPos(cds: TClientDataset);


//------------------------------------------------------------------------------

implementation
uses clipbrd, strUtils, dialogs;

type         // Русский текст не копируеться нормально, поэтому копируем так
    TMyClipboard = class(TClipboard);

var rec:integer;

procedure StrToClipboard(const txt :string);
var vLangID :LANGID;
    brd: TmyClipBoard;
begin
    brd := TMyClipBoard.Create;
    with brd do
    begin
          Open;
          try
              AsText := txt;
              vLangID := GetUserDefaultLangID;
              SetBuffer(CF_LOCALE, vLangID, SizeOf(vLangID));
          finally
              Close;
          end;
    end;
    brd.Free;
end;

procedure BMPxGrayScale(ABitMap: TBitMap);
var
  P: PByteArray;
  R, G, B, YY: Byte;
  n1, n2: LongInt;
  x3, x, y: Longint;
begin
  if ABitMap.PixelFormat <> pf24bit then ABitMap.PixelFormat := pf24bit;

  n1 := ABitMap.Width - 1;
  n2 := ABitMap.Height - 1;

  for y := 0 to n2 do
  begin
      P := ABitMap.ScanLine[y];

      for x := 0 to n1 do
      begin
          x3 := x * 3;

          B := P[x3];
          Inc(x3);
          G := P[x3];
          Inc(x3);
          R := P[x3];

          // YY = 0.299 * R + 0.587 * G + 0.144 * B
          YY := (R * 306 + G * 601 + B * 117 + 511) shr 10; // <- div 2014

          P[x3] := YY;
          Dec(x3);
          P[x3] := YY;
          Dec(x3);
          P[x3] := YY;
      end;
  end;
end;

      
procedure Streach(sourceBMP: TBitmap; destBMP: TBitmap; DestWidth, DestHeight: integer);
const e = 0.0001;
var x_ratio, y_ratio, ratio: double;
    w,h:integer;
    w_or, h_or:integer;
    use_x_ratio: boolean;
begin
     w := DestWidth;
     h := DestHeight ;
     w_or := sourceBMP.Width;
     h_or := sourceBMP.Height;

     x_ratio := w / w_or;
     y_ratio := h / h_or;

     if x_ratio < (y_ratio - e) then ratio := x_ratio else ratio := y_ratio;

     use_x_ratio := abs(x_ratio - e) < ratio;
     if use_x_ratio then destBMP.Width := w else destBMP.Width := trunc(w_or * ratio);
     if not use_x_ratio then destBMP.Height := h  else destBMP.Height := trunc(h_or * ratio);

     destBMP.Canvas.StretchDraw(Rect(0, 0, destBMP.Width, destBMP.Height), sourceBMP);
end;

//------------------------------------------------------------------------------

procedure zero2null(param: TParam);
begin
	if (param.AsInteger = 0) then
    	param.Clear;
end;

//------------------------------------------------------------------------------

function getLocalHostName:String;
var
	name: array[0..255] of char;
begin
	Result:= '';
	gethostname(name, sizeof(name));
	Result:=name;
end;

//------------------------------------------------------------------------------

function getTempPath:String;
//var s: string;
begin
  result := GetEnvironmentVariable('TEMP');
 // s := GetEnvironmentVariable('TMP');

 // if length(s) > length(result) then result := s;
end;

function userAccount: ShortString;
var
  uname: pchar;
  unsiz: cardinal;
begin
  uname := StrAlloc(255);
  unsiz := 254;
  GetUserName(uname,unsiz);
  if (unsiz > 0) then
    Result := string(uname) else
    Result := 'n/a';
  StrDispose(uname);
end;

//------------------------------------------------------------------------------

procedure writeLog(s:string);
var
	tx:TextFile;
begin
	AssignFile(tx,'c:\pi.log');
	if (FileExists('c:\pi.log')) then
		Append(tx)
	else
		ReWrite(tx);
	writeln(tx,s);
	CloseFile(tx);
//	frmMain.Memo1.Lines.Add(s);
end;

//------------------------------------------------------------------------------

function int2user(u:integer):TUser;
begin
	Result:=uAgent;

	if (u=PRG_USR_PAYMENTS) then
		Result:=uPayments
	else if (u=PRG_USR_AGENT) then
		Result:=uAgent
	else if (u=PRG_USR_MANAGER) then
		Result:=uManager
	else if (u=PRG_USR_ADMIN) then
		Result:=uAdmin
	else if (u=PRG_USR_NABOR) then
		Result:=uNabor
	else if (u=PRG_USR_KORRECTURA) then
		Result:=uCorrector
	else if (u=PRG_USR_VERSTKA) then
		Result:=uVerstka
	else if (u=PRG_USR_DESIGN) then
		Result:=uDesigner
  else if (u = PRG_USR_SITE_ADMIN) then
    Result := uSiteAdmin
  else if (u = PRG_USR_VIEWER) then
    result := uViewer
	else
		Exception.Create('Неизвестный код типа пользователя!');
end;

procedure SavePos(cds: TClientDataset);
begin
     if cds.Active then rec := cds.RecNo else rec := 0;
end;

procedure LoadPos(cds: TClientDataset);
begin
    if not cds.Active then exit;

    if (cds.RecordCount >= rec) and (rec > 0) then cds.RecNo := rec else cds.Last;
end;

//------------------------------------------------------------------------------

procedure RefreshClientDataSetFullySavingPos(qry: TSQLquery; cds: TClientDataSet);
var
	rec: integer;
begin
	if (cds.Active) then
		rec := cds.RecNo
    else
    	rec := 0;
	RefreshClientDataSetFully(qry,cds);
    if ((cds.RecordCount >= rec) and (rec > 0)) then
    	cds.RecNo := rec
    else
    	cds.Last;
end;

//------------------------------------------------------------------------------

procedure RefreshClientDataSetFully(qry: TSQLquery;
  cds: TClientDataSet);
begin
	qry.Prepared:=false;
    if (cds.Active) then
    	cds.Close;
	cds.Open;
end;

//------------------------------------------------------------------------------

procedure convert(fromFileName, toFileName: string);
var
    si: TStartupInfo;
    pi: TProcessInformation;
    c,k:cardinal;
    exe:string;
    flexists:boolean;
begin
     FillChar(si, sizeof(si), 0);
     si.cb := sizeof(si);
     si.dwFlags := STARTF_USESHOWWINDOW;
     si.wShowWindow := SW_HIDE;

     exe := 'nconvert.exe -out tiff -dpi 300 -overwrite -o ' + toFileName + ' ' + fromFileName;

     if CreateProcess(nil, PChar(exe), nil, nil, false, 0, nil, nil, si, pi)then
     try
          WaitForSingleObject(pi.hProcess, Infinite);
          GetExitCodeProcess(pi.hProcess, c);
     finally
          CloseHandle(pi.hThread);
          CloseHandle(pi.hProcess);
     end;
                   // На некоторых машинах почему то не синхронизируеться создание файла с функцией  WaitForSingleObject
                   // Синхронизируем вручную
     k := 0;
     flexists := FileExists(toFileName);
     while not flexists and (k < 20) do
     begin
          sleep(100);
          inc(k);
          flexists := FileExists(toFileName);
     end;

     if c <> 0 then raise exception.Create('Ошибка конвертации изображения.');
end;

procedure EpsToPicture(epsFile:string; pic:TPicture);overload;
var fout:string;
    gr: TGraphicExGraphic;
begin
     gr := nil;

     fout := getTempPath + '\out.tiff';
     try
        convert(epsFile, fout);

        gr := TTIFFGraphic.Create;
        gr.LoadFromFile(fout);
        pic.Bitmap.Assign(gr);
     finally
          freeAndNil(gr);
          deleteFile(fout);
     end;
end;

procedure EpsToPicture(epsField: TBlobField; pic:TPicture);overload;
var fin, fout:string;
    gr: TTIFFGraphic;
begin
     gr := nil;
     fin := getTempPath + '\in.eps';
     fout := getTempPath + '\out.tiff';
     try

        FileFromCompressedField(epsField, fin);
        convert(fin, fout);

        gr := TTIFFGraphic.Create;
        gr.LoadFromFile(fout);
        pic.Bitmap.Assign(gr);
     finally
        freeAndNil(gr);
        deleteFile(fout);
     end;
end;

procedure EpsToFile(AEPSField: TBlobField; AFileName: string);
var fin, fout:string;
begin
     fin := getTempPath + '\in.eps';
     fout := getTempPath + '\out.tiff';

     try
        FileFromCompressedField(AEPSField, fin);
        convert(fin, fout);
        copyfile(pAnsiChar(fout), pansiChar(AFileName), false);
     finally
         deleteFile(fout);
     end
end;

procedure CopyCompressedField(ASrc, ADest: TBlobField);
var bufR: TMemoryStream;
    bufW: TClientBlobStream;
begin
     bufR := nil;
     bufW := nil;
     try
        bufR := TClientBlobStream.Create(ASrc, bmRead);
        bufW := TClientBlobStream.Create(ADest, bmWrite);
        bufW.CopyFrom(bufR, bufR.Size)
     finally
        freeAndNil(bufR);
        freeAndNil(bufW);
     end;
end;

procedure doReadFromCompressedField(AField: TBlobField; buffer: TStream);
var
    filesize:integer;
    buffer_c:TMemoryStream;
    decompressor:TDecompressionStream;
begin
    buffer_c 	 := nil;
    decompressor := nil;

    try
       buffer_c	 := TClientBlobStream.Create(AField,bmRead);
       decompressor := TDecompressionStream.Create(buffer_c);
       decompressor.ReadBuffer(filesize,sizeof(filesize));
       buffer.CopyFrom(decompressor, filesize);

    finally
       freeAndNil(decompressor);
       freeAndNil(buffer_c);
    end;
end;

procedure PictureFromCompressedFieldNew(APicture: TPicture; AField: TBlobField; const ext: string; tiffPreview: boolean);
var gr:TTIFFGraphic;
    eps: TEPSGraphic;
    bmp:TBitmap;
    buffer: TMemoryStream;
begin
     if (ext = 'eps')then
     begin
         if tiffPreview then
         try
            eps := TEPSGraphic.Create;
            buffer := TMemoryStream.Create;
            doReadFromCompressedField(AField, buffer);
            buffer.Seek(0, soFromBeginning);
            eps.LoadFromStream(buffer);
            APicture.Bitmap.Assign(eps);
         finally
             freeAndNil(buffer);
             freeAndNil(eps);
         end
         else
          EpsToPicture(AField, APicture);
     end
     else if ext = 'bmp' then
     try
        bmp := TBitmap.Create;
        buffer := TMemoryStream.Create;
        doReadFromCompressedField(AField, buffer);
        buffer.Seek(0, soFromBeginning);
        bmp.LoadFromStream(buffer);
        APicture.Bitmap.Assign(bmp);
     finally
        freeAndNil(buffer);
        freeAndNil(bmp);
     end
     else if (ext = 'tif') or (ext = 'tiff')  then
     try
          gr := TTIFFGraphic.Create;
          buffer := TMemoryStream.Create;
          doReadFromCompressedField(AField, buffer);
          buffer.Seek(0, soFromBeginning);
          gr.LoadFromStream(buffer);
          APicture.Bitmap.Assign(gr);
     finally
          freeAndNil(buffer);
          freeAndNil(gr)
     end
     else raise exception.Create('Invalid extension value ' + ext);
end;

procedure PictureToCompressedField(APicture: TPicture; AField: TBlobField);
var
    size:integer;
    buffer:TClientBlobStream;
    compressor: TCompressionStream;
    ms: TMemoryStream;
begin
    ms := nil;
    buffer		:= nil;
    compressor	:= nil;

    try
       try
           ms       :=   TMemoryStream.Create;
    	     buffer		:=   TClientBlobStream.Create(AField,bmWrite);
	         compressor	:= TCompressionStream.Create(clFastest,buffer);

           APicture.Bitmap.SaveToStream(ms);
           size := ms.Size;
           compressor.Write(size, sizeof(size));
           ms.Position := 0;
           compressor.CopyFrom(ms, size);
       except
           raise;
       end;
    finally
    	    freeAndNil(compressor);
          freeAndNil(buffer);
          FreeAndNil(ms);
    end;
end;

//------------------------------------------------------------------------------

procedure FileToCompressedField(AFileName: String; AField: TBlobField);
var
    filesize:integer;
    buffer:TClientBlobStream;
	fi:TFileStream;
    compressor: TCompressionStream;
begin
    fi			:= nil;
    buffer		:= nil;
    compressor	:= nil;

    try
       try
           fi			:= TFileStream.Create(AFileName,fmOpenRead);
    	     buffer		:= TClientBlobStream.Create(AField,bmWrite);
	         compressor	:= TCompressionStream.Create(clFastest,buffer);

           filesize := fi.Size;
    	     compressor.Write(filesize,sizeof(filesize));
	         compressor.CopyFrom(fi,fi.Size);
       except
           raise;
       end;
    finally
    	    freeAndNil(compressor);
          freeAndNil(fi);
          freeAndNil(buffer);
    end;
end;

//------------------------------------------------------------------------------

procedure FileFromCompressedField(AField: TBlobField; AFileName: String);
var
    filesize:integer;
    buffer_d:TMemoryStream;
    buffer_c:TClientBlobStream;
    decompressor:TDecompressionStream;
begin
    buffer_c 	 := nil;
    buffer_d 	 := nil;
    decompressor := nil;

    try
       try
    	    buffer_c	 := TClientBlobStream.Create(AField,bmRead);
	        buffer_d	 := TMemoryStream.Create;
       	  decompressor := TDecompressionStream.Create(buffer_c);

	        decompressor.ReadBuffer(filesize,sizeof(filesize));
    	    buffer_d.CopyFrom(decompressor,filesize);
          buffer_d.SaveToFile(AFileName);
       except
          raise;
       end;
    finally
        freeAndNil(decompressor);
    	  freeAndNil(buffer_c);
        freeAndNil(buffer_d);
    end;
end;

procedure FileToPicture(const AfileName:string; APicture: TPicture);
var ext:string;
   	gr:TTIFFGraphic;
 	  fs:TFileStream;
begin
     ext := rightStr(AfileName, length(AfileName) - pos('.', AfileName));

     if ext = 'eps' then
     begin
         EpsToPicture(AFileName, APicture);
     end
     else if (ext = 'tif') or (ext = 'tiff') then
     try
		    gr := TTIFFGraphic.Create;
		    fs := TFileStream.Create(AfileName, fmOpenRead);
		    gr.LoadFromStream(fs);
		    APicture.Bitmap.Assign(gr);
		 finally
		      freeAndNil(gr);
		      freeAndNil(fs);
     end;
end;

//------------------------------------------------------------------------------

function DayOfWeek2Str(day: integer): string;
const
	days: array[1..7] of string = ('Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб');
begin
	Result := days[day];
end;

//------------------------------------------------------------------------------

end.
