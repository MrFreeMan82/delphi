unit Messanger;

interface
uses SysUtils, Windows;

type
    TMessage = record
         msg : cardinal;
         case integer of
         0 : (wparam1, wparam2, wparam3, wparam4 : word);
         1 : (iparam1, iparam2 : cardinal);
         2 : (i64param1 : int64);
    end;

    TProccesMsgFunc = procedure(var Msg: TMessage) of object;

    TAddress = TProccesMsgFunc;

procedure SendMsg(ToAddress : TAddress; Message : Cardinal; l,r: integer);
procedure StopMessenger();

implementation
uses uLogging, Classes;

{ TMessanger }

type
    PMessageQueue = ^TMessageQueue;
    TMessageQueue = record
         Child  : PMessageQueue;
         ToAddr : TAddress;
         Msg    : TMessage;
    end;

    TThreadParams = record
        terminate : Boolean;
        Msg       : TMessageQueue;
    end;

    TTHreadFunc = function(ThParams : pointer): integer;stdcall;

    TMessanger = class(TThread)
      strict private
          queuelen  : integer;
          Head,
          Tail      : PMessageQueue;

      public
        procedure Execute(); override;
        procedure Put(ToAddress : TAddress; const Msg : TMessage);
        function Accept(out NextMsg: TMessageQueue): boolean;
        constructor Create();
        destructor Destroy; override;
    end;

var vMessanger : TMessanger;
    Params     : TThreadParams;
    event      : cardinal = 0;

procedure StopMessenger();
begin
  FreeAndNil(vMessanger);
  Logger.Logg(['Messanger destroyed']);
end;

procedure SendMsg(ToAddress : TAddress; Message : Cardinal; l,r: integer);
var Msg: TMessage;
begin
    if vMessanger = nil then
    begin
        Logger.Logg(['Send Msg Fail Messanger not Assigned. Msg= ', Message]);
        exit;
    end;

    Msg.msg := Message;
    Msg.iparam1 := l;
    Msg.iparam2 := r;
    vMessanger.Put(ToAddress, Msg);
end;

procedure TMessanger.Put(ToAddress: TAddress; const Msg: TMessage);
begin
    if Tail = nil then
    begin
         Tail        := AllocMem(sizeof(TMessageQueue));
         Head        := Tail;
         Tail.ToAddr := ToAddress;
         Tail.Msg    := Msg
    end
    else begin
         Tail.Child        := AllocMem(sizeof(TMessageQueue));
         Tail.Child.ToAddr := ToAddress;
         Tail.Child.Msg    := Msg;
         Tail              := Tail.Child;
    end;
    inc(queuelen);
    SetEvent(Event);
end;

function TMessanger.Accept(out NextMsg: TMessageQueue): boolean;
var t: PMessageQueue;
begin
    if Head = nil then exit(false);

    NextMsg := Head^;
    t       := Head;
    Head    := Head.Child;
    if t = Tail then Tail := nil;
    FreeMem(t);
    dec(queuelen);
    Result := true;
end;

procedure TMessanger.Execute();
begin
    while not Params.terminate do
    begin
        WaitForSingleObject(event, INFINITE);

        while Assigned(vMessanger) and vMessanger.Accept(Params.Msg) do
        if Assigned(Params.Msg.ToAddr) then
        begin
             Synchronize(procedure begin Params.Msg.ToAddr(Params.Msg.Msg) end);
        end;
    end;
end;

constructor TMessanger.Create;
begin
    Head   := nil;
    Tail   := nil;
    Params.terminate := false;

    Event := CreateEvent(nil, false, false, 'EvntMsg');
    if Event = 0 then
    begin
        Logger.Logg(['Event create error ', GetLastError]);
        exit;
    end;

    inherited Create(false);
end;

destructor TMessanger.Destroy;
begin
  Params.terminate := true;
  SetEvent(Event);
  CloseHandle(Event);

  while Head <> nil do
  begin
      FreeMem(Head);
      Head := Head.Child;
  end;
end;

initialization
  vMessanger := TMessanger.Create();

end.
