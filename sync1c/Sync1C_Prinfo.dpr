program Sync1C_Prinfo;

{$APPTYPE CONSOLE}

{
���� ���������� ������ 1� ��
1. regsvr32 "C:\Program Files\1cv82\8.3.7.2008\bin\comcntr.dll", ��� 8.3.7.2008 ����� ����� ������
2. �������� ������ 'V83.COMConnector' � ��������� ConnectTo1C8_COM('V83.COMConnector', OneCSettings);
}

uses
  SysUtils,
  Classes,
  Variants,
  ComObj,
  OleCtnrs,
  DB,
  IBCustomDataSet,
  IBQuery,
  IBDatabase,
  StrUtils,
  ComCtrls,
  Windows,
  uConsoleOut in 'uConsoleOut.pas';

type TParams = array [0..10] of string;

const  CUQ_1C_ID = 0;
       CUQ_TYPE = 1;
       CUQ_CONTACT = 2;
       CUQ_NAME = 3;
       CUQ_FULL_NAME = 4;
       CUQ_NDS_NUM = 5;
       CUQ_INN = 6;
       CUQ_OKPO = 7;
       CUQ_ADDRESS_REAL = 8;
       CUQ_ADDRESS = 9;
       CUQ_PHONES  = 10;

var dbPrinfo: TIBDataBase;
    DT: TIBTransaction;
    qEdit, qInsert, qCust, qClearDoubles: TIBQuery;
    Logg: TextFile;

    inserted,updated, errors:integer;
    s1C8_ole: variant;

    DBSettings, OneCSettings: string;

    procedure WriteLog(const text: string);
    begin
          WriteLn(Logg, text);
          Flush(Logg);
    end;

    procedure LoadParams();
    var s:string;
        PN,PV:string;
        F: TextFile;
    begin
        AssignFile(F, ExtractFilePath(ParamStr(0)) + 'conf.conf');
        Reset(F);

        while not Eof(F) do
        begin
            Readln(F,s);
            s := trim(s);
            if (length(s) > 0) and (s[1] <> '#') then
            begin
                PN := LeftStr(s, pos('=', s) - 1);
                PV := RightStr(s, length(s) -  pos('=', s));

                if upperCase(PN) = 'BD' then  DBSettings := PV
                else if upperCase(PN) = '1C' then OneCSettings := PV;
            end;
        end;
        CloseFile(F)
    end;

    function YesLinkToVariant(HandleAny : Variant) : boolean;     //���������, ��������� �� ������ (HandleAny)
    begin
        Result:=FALSE;
        if not VarIsEmpty(HandleAny) then Result:=TRUE;
    end;

    function ConnectTo1C8_COM(s1cAppProgID,InitLine : string) : OleVariant;
//���������� � 1Cv8 (COM)
{
//s1cAppProgID - ��� �����. COM-������� ������� 1Cv8 (����� ���� ������)
   V8.COMConnector
InitLine (������ �������������) :
  �������� ������� �.�. :
    File=����������\Trade
    Usr=������������
    Pwd=������
  ������-��������� ������� �.�. :
    Srvr=Server1C (��� �������, ��� ������� ������ ���������� 1�)
    Ref=Trade (��� ���� ������ �� ������� ���������� 1�)
    Usr=������������
    Pwd=������
}
//������������ �������� : ������ �� �����. COM-������ ������� 1Cv8
//                        ��� �������� Unassigned (� ������ �������)
    begin
      Result:=Unassigned;
      s1cAppProgID:=Trim(s1cAppProgID);
      InitLine:=Trim(InitLine);
      if Length(s1cAppProgID)>0 then
      begin
     //������� ����������
          Result := CreateOleObject(s1cAppProgID);
     //��������� ������������ ����������
          if YesLinkToVariant(Result) then
          begin
        //������������� ������� 1Cv8 � ��������� ������ �� COM-������
                Result:=Result.Connect(InitLine);
       // Result.Visible := true;
                if not YesLinkToVariant(Result) then Result:=Unassigned;
          end;
      end;
    end;

    procedure Init();
    var logdir: string;
    begin
        errors := 0;
        inserted := 0;
        updated := 0;

        logdir := ExtractFilePath(ParamStr(0)) + 'log';
        if not DirectoryExists(logdir) then CreateDir(logdir);

        AssignFile(Logg, logdir + '\' + DateToStr(Now) + '.txt');
        ReWrite(Logg);

        LoadParams();

        dbPrinfo := TIBDatabase.Create(nil);
        dbPrinfo.LoginPrompt := false;
        dbPrinfo.Params.Append('user_name=SYSDBA');
        dbPrinfo.Params.Append('password=masterkey');
        dbPrinfo.Params.Append('lc_ctype=WIN1251');
        dbPrinfo.DatabaseName := DBSettings;

        DT := TIBTransaction.Create(nil);
        DT.Params.Append('read_committed');
        DT.Params.Append('rec_version');
        DT.Params.Append('nowait');
        DT.DefaultDatabase := dbPrinfo;

        qEdit := TIBQuery.Create(nil);
        qEdit.Transaction := DT;

        qInsert := TIBQuery.Create(nil);
        qInsert.Transaction := DT;
        qInsert.SQL.Append('INSERT INTO CUST_UNIQUE (CUQ_TYPE, CUQ_FULL_NAME, CUQ_ADDRESS, CUQ_ADDRESS_REAL, CUQ_NAME,CUQ_PHONES, CUQ_OKPO, CUQ_INN, CUQ_NDS_NUM, CUQ_CONTACT, CUQ_1C_ID, CUQ_REG_ID, CUQ_CHANGED, EDIT_TIME)');
        qInsert.SQL.Append('VALUES (:CUQ_TYPE, :CUQ_FULL_NAME, :CUQ_ADDRESS, :CUQ_ADDRESS_REAL, :CUQ_NAME, :CUQ_PHONES, :CUQ_OKPO, :CUQ_INN, :CUQ_NDS_NUM, :CUQ_CONTACT, :CUQ_1C_ID, :CUQ_REG_ID, :CUQ_CHANGED, current_timestamp)');

        qCust := TIBQuery.Create(nil);
        qCust.Transaction := DT;
        qCust.SQL.Append('select * from cust_unique');

        qClearDoubles := TIBQuery.Create(nil);
        qClearDoubles.Transaction := DT;
        qClearDoubles.SQL.Append('EXECUTE PROCEDURE CLEAR_DOUBLES');
    end;

    procedure Connect();
    var connected: boolean;
        c: integer;
    begin
         c := 0;
         connected := false;

         while not connected do
         begin
            inc(c);
            if c > 3 then break;

            s1C8_ole := UnAssigned;
            try
                if not dbPrinfo.Connected then dbPrinfo.Connected := true;
                s1C8_ole := ConnectTo1C8_COM('V83.COMConnector', OneCSettings);
            except on E: Exception do WriteLog(E.message) end;

            connected := YesLinkToVariant(s1C8_ole) and dbPrinfo.Connected;
         end;

         if connected then
         begin
             WriteLog('DB Connection OK ' + dbPrinfo.DatabaseName);
             WriteLog('1C COM connection OK');
         end;
    end;

    procedure Clear();
    begin
        dbPrinfo.Connected := false;
        FreeAndNil(qClearDoubles);
        FreeAndNil(qCust);
        FreeAndNil(qInsert);
        FreeAndNil(qEdit);
        FreeAndNil(DT);
        FreeAndNil(dbPrinfo);

        CloseFile(logg);
    end;

    procedure PrepareParams(Sel_ole:variant; var Params: TParams);

            function Num(OneCode: string): string;
            var i:integer;
            begin
                  result := '';
                  i := 1;
                  while OneCode[i] = '0' do inc(i);

                  for i := i to length(OneCode) do result := result + OneCode[i];
            end;

    var Cust_type :variant;
        cindex:integer;
        cstr:string;
    begin
        FillChar(Params, sizeof(TParams), 0);
        try Params[CUQ_OKPO]         := LeftStr(trim(Sel_Ole.�����������), 10);except end;

        if Params[CUQ_OKPO] = '' then exit;

        try Params[CUQ_1C_ID] := Num(Sel_ole.���);except end;

        cust_type := Sel_ole.���������;
        try
            cindex :=    s1C8_ole.������������.���������.������(cust_type);
            cstr := trim(s1C8_ole.����������.������������.���������.��������������������.��������(cindex).���);
            if cstr = '������' then Params[CUQ_TYPE] := '1' else Params[CUQ_TYPE] := '2';
        except
           Params[CUQ_TYPE] := '2';
        end;

        try Params[CUQ_CONTACT]      := trim(Sel_ole.����������������������.������������); except end;
        try Params[CUQ_NAME]         := trim(Sel_ole.������������); except end;
        try Params[CUQ_FULL_NAME]    := trim(Sel_ole.������������������);except end;
        try Params[CUQ_NDS_NUM]      := LeftStr(trim(Sel_ole.������������������), 15);except end;
        try Params[CUQ_INN]          := LeftStr(trim(Sel_ole.���), 15);except end;
        try Params[CUQ_ADDRESS_REAL] := trim(s1C8_ole.�������������������������������.�����������������������������������(Sel_ole.������,'�����������')); except end;
        try Params[CUQ_ADDRESS]      := trim(s1C8_ole.�������������������������������.�����������������������������������(Sel_ole.������,'�����������')); except end;
        if Params[CUQ_ADDRESS_REAL] = '' then Params[CUQ_ADDRESS_REAL] := Params[CUQ_ADDRESS];
        try Params[CUQ_PHONES] := trim(s1C8_ole.�������������������������������.�������������������������������������(Sel_ole.������))except end;
    end;

    procedure InsertRecord(Params : TParams);
    begin
         qInsert.ParamByName('CUQ_TYPE').asInteger := StrToInt(Params[CUQ_TYPE]);
         qInsert.ParamByName('CUQ_FULL_NAME').AsString := Params[CUQ_FULL_NAME];
         qInsert.ParamByName('CUQ_ADDRESS').AsString := Params[CUQ_ADDRESS];
         qInsert.ParamByName('CUQ_ADDRESS_REAL').AsString := Params[CUQ_ADDRESS_REAL];
         qInsert.ParamByName('CUQ_NAME').AsString := Params[CUQ_NAME];
         qInsert.ParamByName('CUQ_PHONES').asString := Params[CUQ_PHONES];
         qInsert.ParamByName('CUQ_OKPO').AsString := Params[CUQ_OKPO];
         qInsert.ParamByName('CUQ_INN').AsString := Params[CUQ_INN];
         qInsert.ParamByName('CUQ_NDS_NUM').AsString := Params[CUQ_NDS_NUM];
         qInsert.ParamByName('CUQ_CONTACT').AsString := Params[CUQ_CONTACT];
         qInsert.ParamByName('CUQ_1C_ID').asInteger := StrToInt(Params[CUQ_1C_ID]);
         qInsert.ParamByName('CUQ_CHANGED').AsInteger := 1;
         try
              qInsert.ExecSQL;
              inserted := inserted + qInsert.RowsAffected;

              Writelog('New record okpo ' + Params[CUQ_OKPO]);
         except on E:Exception do
            begin
                inc(errors);
                WriteLog('Error while add record okpo' + Params[CUQ_OKPO]);
                WriteLog('Error Text: ' + E.message);
            end
         end;
    end;

    procedure UpdateRecord(okpo: string; const ParamName:string; const Value,OldValue: string);
    begin
          qEdit.SQL.Clear;
          qEdit.SQL.Append('UPDATE CUST_UNIQUE cu SET cu.' + ParamName +' = :name WHERE cu.CUQ_OKPO = :okpo');
          qEdit.ParamByName('name').asString := value;
          qEdit.ParamByName('okpo').asString  := okpo;
          try
              qEdit.ExecSQL;
              updated := updated + qEdit.RowsAffected;
              WriteLog('okpo= ' + okpo + ';  P= '+ ParamName+ ';  N= ' + Value + ';  O = ' + OldValue);
          except  on E:exception do
           begin
                  inc(errors);
                  WriteLog('������ ���������� ������ '+ 'okpo= ' + okpo + '; P= '+ ParamName+ ';  N= ' + Value + ';  O = ' + OldValue);
                  WriteLog('Error Text: ' + E.message);
           end
          end;
    end;

    procedure RunSync();
    var
      Sel_ole, SbCnt_ole  : Variant;
      Params: TParams;
      located:boolean;
      c:integer;
      okpo: string;
    begin
        c := 0;

        qCust.Close;
        qCust.Open;
        qCust.FetchALL;

        SbCnt_ole:=UnAssigned;
        Sel_ole:=UnAssigned;

        SbCnt_ole := s1C8_ole.�����������.�����������;
        Sel_ole   := SbCnt_ole.�������();

        while Sel_ole.���������() do
        begin
              PrepareParams(Sel_ole, Params);

              okpo    := Params[CUQ_OKPO];

              if (okpo = '') then continue;

             // located := qCust.Locate('CUQ_1C_ID;CUQ_OKPO', VarArrayOf([oneCID, okpo]), []);

              located := qCust.Locate('CUQ_OKPO', okpo, []);
              
              if located then
              begin
                  if trim(qCust.FieldByName('CUQ_NAME').AsString) <> Params[CUQ_NAME]
                  then UpdateRecord(okpo, 'CUQ_NAME', Params[CUQ_NAME], qCust.FieldByName('CUQ_NAME').AsString);

                  if trim(qCust.FieldByName('CUQ_FULL_NAME').asString) <> Params[CUQ_FULL_NAME]
                  then UpdateRecord(okpo, 'CUQ_FULL_NAME', Params[CUQ_FULL_NAME], qCust.FieldByName('CUQ_FULL_NAME').asString);

                  if trim(qCust.FieldByName('CUQ_NDS_NUM').asString) <> Params[CUQ_NDS_NUM]
                  then UpdateRecord(okpo, 'CUQ_NDS_NUM', Params[CUQ_NDS_NUM], qCust.FieldByName('CUQ_NDS_NUM').asString);

                  if trim(qCust.FieldByName('CUQ_INN').asString) <> Params[CUQ_INN]
                  then UpdateRecord(okpo, 'CUQ_INN', Params[CUQ_INN], qCust.FieldByName('CUQ_INN').asString);

                  if trim(qCust.FieldByname('CUQ_ADDRESS_REAL').asString) <> Params[CUQ_ADDRESS_REAL]
                  then UpdateRecord(okpo, 'CUQ_ADDRESS_REAL', Params[CUQ_ADDRESS_REAL], qCust.FieldByName('CUQ_ADDRESS_REAL').asString);

                  if trim(qCust.FieldByName('CUQ_ADDRESS').asString) <> Params[CUQ_ADDRESS]
                  then UpdateRecord(okpo, 'CUQ_ADDRESS', Params[CUQ_ADDRESS], qCust.FieldByName('CUQ_ADDRESS').asString);

                  if trim(qCust.FieldByName('CUQ_PHONES').asString) <> Params[CUQ_PHONES]
                  then UpdateRecord(okpo, 'CUQ_PHONES', Params[CUQ_PHONES], qCust.FieldByName('CUQ_PHONES').asString)
              end
              else begin
                  InsertRecord(Params);
              end;

              inc(c);

              if (HI(GetAsyncKeyState(VK_LCONTROL)) <> 0) and (HI(GetAsyncKeyState($58)) <> 0) then
              begin
                  WriteLog('Sync Aborted');
                  DT.RollBack;
                  exit;
              end;

              GoToXY(0,1);
              WriteLn('Inserted: ' + IntToStr(inserted) + '; Updated: ' + IntToStr(updated) + '; Errors: ' + IntToStr(errors) + '; Total read ' + IntToStr(c) + ';');
        end;

        DT.Commit;
        qClearDoubles.Open;
        DT.Commit;
        WriteLog('Sync complete');
        WriteLog('Inserted ' + IntToStr(inserted) + '; Updated ' + IntToStr(updated) + '; Errors: ' + IntToStr(errors) + '; Total read ' + IntToStr(c));
end;

begin
    try
        SetConsoleCP(1251);
        SetConsoleOutputCP(1251);
        WriteLn('Push Ctrl+X to abort');
        Init();
        Connect();
        RunSync();
    finally
        Clear();
    end;
end.
