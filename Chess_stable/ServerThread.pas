unit ServerThread;

interface

uses
  winsock, sysutils, Messanger;

const BSIZE           = 128;
      M_RECIEVE_UDP   = 100;
      M_RECIEVE_TCP   = 101;
      M_CONNECT       = 102;
      M_DISCONECT     = 103;
      MAX_CONNECTIONS = 5;
      PORT : word     = 1234;
type
  TTHreadFunc = function(ThParams : pointer): integer;stdcall;
  TThreadTCPFunc = function(): integer of object; stdcall;

  TThreadParams = record
          terminate  : Boolean;
          sock       : TSocket;
          ListenStat,
          NotifyAddr : TAddress;
          id         : byte;
          sendersock : PSockAddrIn;  // out
          fsenderIP  : PAnsiString;  // out
  end;

  TBuf = array[0..BSIZE - 1] of byte;
  PBuf = ^TBuf;

  TSrvUDP = class
  strict private
    thread_id     : cardinal;
    thread        : integer;
    srvUDP        : TSocket;
    NotifyAddr    : TAddress;
    sendersock    : TSockAddrIn;
    ThFunc        : TTHreadFunc;
    ThParams      : TThreadParams;
    UDPBufOUT : TBuf;

    procedure CreateSrvThread();
  public
    function GetMsg(MessageBuf: PBuf): string;
    procedure SendData(const Data: string; var ToAddr: TSockAddrIn; broadcast : boolean);
    property ServerUDP : TSocket read srvUDP;

    constructor Create(NotifyAddr: TAddress);
    destructor Destroy(); override;
  end;

  TConnection = class
    public
      thread_id,
      thread      : cardinal;
      iip         : in_addr;
      cltTCP      : TSocket;
      ThParams    : TThreadParams;
      ThFunc      : TThreadTCPFunc;
      TCPbufOUT   : TBuf;
      function Execute(): integer; stdcall;
      constructor Create(id: byte; Srv: TSocket; Listen: TAddress);
      destructor Destroy(); override;
  end;

  TSrvTCP = class
    strict private
        NotifyAddr  : TAddress;
        srvTCP      : TSocket;
        Connections : array [0 .. MAX_CONNECTIONS - 1] of TConnection;

        procedure ListenConnectionStatus(var Msg: TMessage);
        function GetConnectionByIP(IP: in_addr): TConnection;
        function GetFreeConnection(): integer;
    public
        initiator   : boolean;
        function GetMsg(MessageBuf: PBuf): string;
        procedure Connect(const IP: string; out Connect_id: integer);
        function Connected(Connect_id: integer): boolean;
        procedure Disconnect(Connect_id: integer);
        procedure SendDataTo(const Data: string; Connect_id: integer);

        constructor Create(NotifyAddr: TAddress);
        destructor Destroy; override;
  end;

procedure StopNet();

implementation
uses uLogging, Winapi.Windows;

const M_CONNECTION_ERROR = 500;

var inf       : TWSAData;
    sockAddr  : TSockAddrIn;
    res       : integer;

procedure StopNet();
begin
    WSACleanup;
end;

function PrepeareMsg(const Msg : string; var Buf : TBuf): integer;
var i, j, len : integer;
    s : UTF8String;
begin
     result := 0;
     len    := Length(Msg);
     s      := UTF8String(StringOfChar(#0, BSIZE - 1));
     UnicodeToUTF8(PAnsiChar(s), BSIZE - 1, PWideChar(Msg), len);
     FillChar(buf, sizeof(TBuf), 0);

     j := 1;
     for i := 0 to BSIZE - 1 do
     begin
           if s[j] = #0 then
           begin
               buf[i] := ord('.');
               inc(result);
               break;
           end;

           buf[i] := ord(s[j]);
           inc(j);
           inc(result)
     end;
end;

function ReadBufAsString(Buf: PBuf): string;
var i  : byte;
    ch : AnsiChar;
    s  : UTF8String;
begin
     s      := UTF8String(StringOfChar(#0, BSIZE));
     result := StringOfChar(#0, length(s));

     for i := 0 to BSIZE do
     begin
         ch := AnsiChar(Buf^[i]);

         if ch in ['.', #0] then break else s[i + 1] := ch;
     end;

     Utf8ToUnicode(PWideChar(result), length(s), PansiChar(s), BSIZE - 1);
     Result := TrimRight(result);
end;

{ TSrv }
{$REGION ' UDP '}

function TSrvUDP.GetMsg(MessageBuf: PBuf): string;
begin
     result := ReadBufAsString(MessageBuf);
     FreeMem(MessageBuf, BSIZE);
end;

procedure TSrvUDP.SendData(const Data: string; var ToAddr: TSockAddrIn;  broadcast: boolean);
begin
    if broadcast then ToAddr.sin_addr.S_addr := inet_addr('255.255.255.255');
    Logger.Logg(['Send ', Data, ' to ', string(inet_ntoa(ToAddr.sin_addr))]);

    res := PrepeareMsg(Data, UDPbufOUT);

    res := sendto(srvUDP, UDPbufOUT, res, 0, ToAddr, sizeof(ToAddr));
    if res = SOCKET_ERROR then
    begin
         Logger.Logg(['Error: ', WSAGetLastError()]);
         exit;
    end;
end;

function ThreadUDPFunc(ThParams: pointer):integer;stdcall;
var cb, len : integer;
    buf: PBuf;
begin
     result := 0;
     with TThreadParams(ThParams^) do
     begin
         while not terminate do
         begin
              cb := 0;
              FillChar(sendersock^, sizeof(sendersock^), 0);
              len := SizeOf(sendersock^);
              buf := nil;

              if sock <> INVALID_SOCKET then
              begin
                  buf := AllocMem(BSIZE);
                  cb := recvfrom(sock, buf^, BSIZE, 0, sendersock^, len);
              end;

              if (cb = 0) or (cb = INVALID_SOCKET) then
              begin
                    Logger.Logg(['Reciving UDP data error ', WSAGetLastError]);
                    FreeMem(buf, BSIZE);
              end
              else if cb > 0 then
                 SendMsg(NotifyAddr, M_RECIEVE_UDP, cardinal(buf), TSockAddrIn(sendersock^).sin_addr.S_addr);
         end;
     end
end;

procedure TSrvUDP.CreateSrvThread;
begin
      ThParams.terminate  := false;
      ThParams.sock       := self.srvUDP;
      ThParams.NotifyAddr := NotifyAddr;
      ThParams.sendersock := @sendersock;

      ThFunc := ThreadUDPFunc;

      thread := CreateThread(nil, 0, @ThFunc, @ThParams, 0, thread_id);

      if thread = 0 then
      begin
            Logger.Logg(['Error while create UDP thread ', GetLastError]);
            exit;
      end;
end;

destructor TSrvUDP.Destroy;
begin
      if srvUDP <> 0 then
      begin
           res := shutdown(srvUDP, SD_BOTH);
           res := closesocket(srvUDP);
      end;
      srvUDP := 0;

      if thread <> 0 then
      begin
            ThParams.terminate := true;
            WaitForSingleObject(thread, 1000);
            CloseHandle(thread);
      end;
      Logger.Logg(['TSrvTUDP Thread terminated.']);
      inherited
end;

constructor TSrvUDP.Create(NotifyAddr: TAddress);
var opt,optlen,res: integer;
begin
    self.NotifyAddr := NotifyAddr;

    Logger.Logg(['Create UDPsocket']);

    FillChar(sendersock, sizeof(TSockAddrIn) ,0);

    srvUDP := socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);

    if (srvUDP = INVALID_SOCKET) then
    begin
           Logger.Logg(['Socket error: ', WSAGetLastError]);
           exit;
    end;

    res := bind(srvUDP,sockAddr,sizeof(sockAddr));
    if res = SOCKET_ERROR then
    begin
           Logger.Logg(['Bind error: ', WSAGetLastError]);
           exit;
    end;

    opt    := 0;
    optlen := sizeof(integer);

    res := getsockopt(srvUDP, SOL_SOCKET, SO_BROADCAST, @opt, optlen);
    if res = SOCKET_ERROR then
    begin
         Logger.Logg(['Get opt error: ', WSAGetLastError()]);
         exit;
    end;

    opt := 1;

    res := setsockopt(srvUDP, SOL_SOCKET, SO_BROADCAST, @opt, optlen);
    if res = SOCKET_ERROR then
    begin
         Logger.Logg(['Set opt error: ', WSAGetLastError()]);
         exit;
    end;

    CreateSrvThread();
    Logger.Logg(['UDPsocket created']);
end;
{$ENDREGION}

{ TConnection }

function TConnection.Execute(): integer;
var cb, len : integer;
    cs      : TSocket;
    buf     : PBuf;
    ssock   : TSockAddr;
begin
     result := 0;

     FillChar(ssock, sizeof(TSockAddr), 0);
     len := sizeof(TSockAddrIn);
     cs  := accept(ThParams.sock, @ssock, @len);

     if cs = INVALID_SOCKET then
     begin
        Logger.Logg(['Accepting connection error ', WSAGetLastError]);
        exit;
     end;

     while not ThParams.terminate do
     begin
         buf := AllocMem(BSIZE);
         cb := recv(cs, buf^, BSIZE, 0);

         if (cb <= 0) then
         begin
             Logger.Logg(['Reciving TCP data error ', WSAGetLastError]);
             closesocket(cs);
             ThParams.terminate := true;
             FreeMem(buf, BSIZE);
             SendMsg(ThParams.ListenStat, M_CONNECTION_ERROR, ThParams.id, ssock.sin_addr.S_addr);
         end
         else
             SendMsg(ThParams.ListenStat, M_RECIEVE_TCP, cardinal(buf), ssock.sin_addr.S_addr);
     end;
end;

constructor TConnection.Create(id: byte; Srv: TSocket; Listen: TAddress);
begin
  inherited Create();

  ThParams.terminate  := false;
  ThParams.sock       := Srv;
  ThParams.ListenStat := Listen;
  ThParams.id         := id;

  ThFunc              := Execute;

  cltTCP := socket(AF_INET, SOCK_STREAM, IPPROTO_IP);
  if (cltTCP = INVALID_SOCKET) then
  begin
      Logger.Logg(['Create TCPClient error: ', WSAGetLastError]);
      exit;
  end;

  thread := CreateThread(nil, 0, @ThFunc, self, 0, thread_id);
  if thread = 0 then
  begin
        Logger.Logg(['Error while create TCP thread ', GetLastError]);
        exit;
  end;
end;

destructor TConnection.Destroy;
begin
    ThParams.terminate := True;

    if cltTCP <> 0 then
    begin
         shutdown(cltTCP, SD_BOTH);
         closesocket(cltTCP);
    end;

    WaitForSingleObject(thread, 1000);
    CloseHandle(thread);

    inherited Destroy;
end;

{ TSrvTCP }
{$REGION ' TCP '}

function TSrvTCP.GetConnectionByIP(IP: in_addr): TConnection;
var i: integer;
begin
     result := nil;

     for i := 0 to MAX_CONNECTIONS - 1 do
     if Assigned(Connections[i]) and (Connections[i].iip.S_addr = ip.S_addr)
     then exit(Connections[i])
end;

function TSrvTCP.GetFreeConnection: integer;
var i: integer;
begin
    for i := 0 to MAX_CONNECTIONS - 1 do
    if self.Connections[i] = nil then exit(i);

    result := -1;
end;

function TSrvTCP.GetMsg(MessageBuf: PBuf): string;
begin
    result := ReadBufAsString(MessageBuf);
    FreeMem(MessageBuf, BSIZE);
end;

procedure TSrvTCP.ListenConnectionStatus(var Msg: TMessage);
var s: string;
begin
   if Msg.msg = M_CONNECTION_ERROR then
   begin
       if Msg.wparam1 in [0..MAX_CONNECTIONS - 1] then
       begin
          SendMsg(NotifyAddr, M_DISCONECT, Msg.iparam1, Msg.iparam2);
          FreeAndNil(Connections[msg.wparam1]);

          s := 'Connection lost with ' + string(inet_ntoa(in_addr(Msg.iparam2)));
          Logger.Logg([s]);
       end
       else Logger.Logg(['Invalid connection index ', Msg.wparam1]);
   end
   else SendMsg(NotifyAddr, Msg.msg, Msg.iparam1, Msg.iparam2);
end;

procedure TSrvTCP.SendDataTo(const Data: string; Connect_id: integer);
var Con: TConnection;
begin
     if not Connect_id in [0..MAX_CONNECTIONS - 1] then
     begin
        Logger.Logg(['Send Error: Not Connected or invalid IP']);
        exit;
     end;
     if not Connected(Connect_id) then
     begin
        Logger.Logg(['Send Fail not connected.']);
        exit;
     end;
     Con := self.Connections[Connect_id];

     Logger.Logg(['Send ', Data, ' to ', string(inet_ntoa(Con.iip))]);

     res := PrepeareMsg(Data, Con.TCPbufOUT);
     res := send(Con.cltTCP, Con.TCPbufOUT, res, 0);
     if res = INVALID_SOCKET then
     begin
          Logger.Logg(['Error while send data ', WSAGetLastError]);
          exit;
     end;
end;

procedure TSrvTCP.Connect(const IP: string; out Connect_id: integer);
var iip: in_addr;
    Con: TConnection;
    sendersock: TSockAddr;
begin
    Logger.Logg(['Connecting to ', IP]);
    iip.S_addr := inet_addr(PansiChar(AnsiString(IP)));
    Con        := GetConnectionByIP(iip);

    if Assigned(Con) then
    begin
        Logger.Logg(['Already connected.']);
        exit;
    end;

    Connect_id := GetFreeConnection();
    if Connect_id < 0 then
    begin
        Logger.Logg(['Connection Limit ', MAX_CONNECTIONS]);
        exit;
    end;

    Logger.Logg(['Launch Thread #', Connect_id]);
    Connections[Connect_id] := TConnection.Create(Connect_id, srvTCP, ListenConnectionStatus);
    Con := Connections[Connect_id];

    FillChar(sendersock, sizeof(sendersock), 0);
    sendersock.sin_family := AF_INET;
    sendersock.sin_port   := htons(PORT);
    sendersock.sin_addr   := iip;

    res := winsock.connect(Con.cltTCP, sendersock, sizeof(sendersock));
    if res = SOCKET_ERROR then
    begin
        Logger.Logg(['Connect Error: ', WSAGetLastError]);
        exit;
    end;
    Con.iip        := iip;
    Logger.Logg(['Connected.']);
end;

procedure TSrvTCP.Disconnect(Connect_id: integer);
begin
    initiator := true;
    FreeAndNil(Connections[Connect_id])
end;

function TSrvTCP.Connected(Connect_id: integer): boolean;
begin
    result := (Connect_id in [0..MAX_CONNECTIONS - 1]) and
               Assigned(Connections[Connect_id]);
end;

constructor TSrvTCP.Create(NotifyAddr: TAddress);
begin
    Logger.Logg(['Create TCPsocket.']);

    FillChar(Self.Connections, sizeof(Self.Connections), 0);

    self.NotifyAddr := NotifyAddr;
    srvTCP := socket(AF_INET, SOCK_STREAM, IPPROTO_IP);

    if (srvTCP = INVALID_SOCKET) then
    begin
         Logger.Logg(['Create TCPsocket error: ', WSAGetLastError]);
         exit;
    end;

    if  bind(srvTCP,sockAddr,sizeof(sockAddr)) = SOCKET_ERROR then
    begin
        Logger.Logg(['Bind TCPsocket error: ', WSAGetLastError]);
        exit;
    end;

    if listen(srvTCP, MAX_CONNECTIONS - 1) = SOCKET_ERROR then
    begin
        Logger.Logg(['Listen TCPsocket error: ', WSAGetLastError]);
        exit;
    end;
end;

destructor TSrvTCP.Destroy;
var i : integer;
begin
    if srvTCP <> 0 then
    begin
         shutdown(srvTCP, SD_BOTH);
         closesocket(srvTCP);
    end;
    srvTCP := 0;

    for i := 0 to MAX_CONNECTIONS - 1 do
    if Assigned(self.Connections[i]) then
    begin
        Disconnect(i);
        Logger.Logg(['TSrvTCP Thread #', i, ' terminated.']);
    end;
    inherited;
end;

{$ENDREGION}

initialization
      WSAStartUp(MakeWord(1,1),inf);

      FillChar(sockAddr, sizeof(TSockAddrIn), 0);
      sockAddr.sin_family      := AF_INET;
      sockAddr.sin_port        := htons(PORT);
      sockAddr.sin_addr.S_addr := INADDR_ANY;
end.
