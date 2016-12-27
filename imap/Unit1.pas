unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, imapsend, ssl_openssl, mimemess, mimepart, httpsend, smtpsend, synautil;

  type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    txtGate: TEdit;
    txtUser: TEdit;
    Label3: TLabel;
    txtPassword: TEdit;
    Label4: TLabel;
    txtSendServer: TEdit;
    Label5: TLabel;
    txtSendPort: TEdit;
    btLoginSend: TButton;
    memOutput: TMemo;
    btLoginRecive: TButton;
    memMessageList: TMemo;
    procedure btLoginSendClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OnReadFilter(Sender: TObject; var Value: AnsiString);
    procedure btLoginReciveClick(Sender: TObject);
  private
      imap :TIMAPSend;
      SMTP: TSMTPSend;
      function parse(INmsg: TStringList): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


function TForm1.parse(INmsg: TStringList): string;
var i,k, eq: integer;
begin
     INmsg := TStringList.Create;
     INmsg.LoadFromFile('1.txt');
     result := '';

     i := 0;
     while  i < INMsg.Count do
     begin
          while (i < InMsg.Count) and
                     (pos('<OGE_SYNC>', INMsg.Strings[i]) = 0) do inc(i);

          inc(i);

          while (i < InMsg.Count) and
                (pos('</OGE_SYNC>', InMsg.Strings[i]) = 0) do
          begin
               result := result + trim(InMsg.Strings[i]);
               eq := pos('=', result);
               if eq > 0 then
               begin
                    result[eq] := #0;
                    result := trim(result)
               end;
               inc(i);
          end;
          break;
     end;
     INmsg.Free;
end;

procedure TForm1.btLoginReciveClick(Sender: TObject);
var i,id: integer;
    msgList, msg, input: TStringList;
    flag: string;
begin
    memOutput.Clear;
    imap.TargetHost := 'imap.yandex.ru';
    imap.TargetPort := '993';
    imap.Username := txtUser.Text;
    imap.Password := txtPassword.Text;
    imap.FullSSL := true;
    imap.Sock.OnReadFilter := OnReadFilter;

    msgList := TStringList.Create;
    msg := TStringList.Create;
    input := TStringList.Create;
    try
        if not imap.Login then abort;
        if not imap.SelectFolder('INBOX') then abort;
        imap.SearchMess('UNSEEN SUBJECT SYNC', msgList);

        for i := 0 to msgList.Count - 1 do
        begin
            id := strToInt(msgList.Strings[i]);
            flag := '';
            imap.GetFlagsMess(id, flag);

            if (pos('RECENT', flag) > 0) then
            begin
                 imap.FetchMess(id, msg);
                 input.Add(parse(msg));
                 imap.DeleteMess(id);
            end;
        end;
        imap.CloseFolder;
        imap.Logout;
    finally
        msgList.Free;
        msg.Free;
        input.Free;
    end;

end;

procedure TForm1.btLoginSendClick(Sender: TObject);
var Msg : TMimeMess;
    MIMEPart : TMimePart;
    list: TStringList;
begin
    memOutput.Clear;
    smtp.TargetHost := txtSendServer.Text;
    smtp.TargetPort := txtSendPort.Text;
    smtp.Username := txtUser.Text;
    smtp.Password := txtPassword.Text;
    smtp.FullSSL := true;
    smtp.Sock.OnReadFilter := OnReadFilter;

    list:= TstringList.Create;
    list.Add('<OGE_SYNC>');
    list.Add('2;Administrator;tabTasks;MASK_70;' +
                 '111111111111111011111111111111111111111101111111111111111111111111111111111111111111111111111111111111111111111111111110');
    list.Add('</OGE_SYNC>');
    Msg := TMimeMess.Create;
    Msg.Header.Subject := 'SYNC';
    Msg.Header.From := txtUser.Text;
    Msg.Header.ToList.Add(txtUser.Text);
    MIMEPart := Msg.AddPartMultipart('alternative', nil);
    Msg.AddPartText(list, MIMEPart);
    Msg.EncodeMessage;

    try
        if not smtp.Login then abort;
        if not SMTP.MailFrom(txtGate.Text, Length(Msg.Lines.Text)) then abort;
        if not SMTP.MailTo(txtGate.Text) then abort;
        if not SMTP.MailData(Msg.Lines) then abort;
    finally
        SMTP.Logout;

        list.Free;
        msg.Free;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
      smtp := TSMTPSend.Create;
      imap := TIMAPSend.Create;
 //   pop := TPOP3Send.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
     smtp.Free;
     imap.Free;
 //   pop.Free;
end;

procedure TForm1.OnReadFilter(Sender: TObject; var Value: AnsiString);
begin
    memOutput.Lines.Add(string(Value));
end;


end.
