unit Unit1;

interface

uses
  Winapi.Windows, messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Core,
  Vcl.CheckLst, Winsock, ServerThread, typinfo, uLogging, Vcl.ComCtrls,
  Vcl.Menus, Messanger, Vcl.AppEvnts;

type
  TForm1 = class(TForm)
    btCreateGame: TButton;
    btSearchGame: TButton;
    chkGamesList: TCheckListBox;
    btConnectGame: TButton;
    cbColor: TComboBox;
    RadioGroup1: TRadioGroup;
    txtPlayerName: TEdit;
    Panel: TPanel;
    lbWhite: TLabel;
    Label2: TLabel;
    lbBlack: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    CreateNewGame: TMenuItem;
    SaveGame: TMenuItem;
    LoadGame: TMenuItem;
    N5: TMenuItem;
    ExitGame: TMenuItem;
    Label1: TLabel;
    memCorrespondence: TMemo;
    txtMsg: TEdit;
    Image1: TPaintBox;
    PicSave: TMenuItem;
    mnuAbout: TMenuItem;
    NewNetGame: TMenuItem;
    WithCPU: TMenuItem;
    N2: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    cbFigColor: TColorBox;
    GroupBox1: TGroupBox;
    UpDown1: TUpDown;
    txtOpac: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Image1_MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Image1_Click(Sender: TObject);
    procedure Image1_ContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure btCreateGameClick(Sender: TObject);
    procedure btSearchGameClick(Sender: TObject);
    procedure btConnectGameClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure cbColorChange(Sender: TObject);
    procedure ExitGameClick(Sender: TObject);
    procedure CreateNewGameClick(Sender: TObject);
    procedure SaveGameClick(Sender: TObject);
    procedure LoadGameClick(Sender: TObject);
    procedure txtMsgKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtPlayerNameChange(Sender: TObject);
    procedure Image1Paint(Sender: TObject);
    procedure PicSaveClick(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure NewNetGameClick(Sender: TObject);
    procedure WithCPUClick(Sender: TObject);
    procedure ApplicationEvents1ShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure cbFigColorChange(Sender: TObject);
    procedure txtOpacChange(Sender: TObject);
    procedure UpDown1ChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: SmallInt; Direction: TUpDownDirection);
    procedure chkGamesListClick(Sender: TObject);
  private
    { Private declarations }
    Connect_id      : integer;
    OldCell         : PCell;
    ThreadUDP       : TSrvUDP;
    ThreadTCP       : TSrvTCP;
    ToAddr          : TSockAddrIn;
    AppDir,
    opIP  : string;

    procedure CreateNetGame();
    procedure ApplyPlayerInfo(const s : string);
    procedure PaintChess;
    procedure AnalizeMoveResult(MR : TMoveResult; Move: PMove);
    procedure UpdStatus();
    procedure InitPlayersForLocaleGame();
    procedure InitPlayerForNetGame();
    procedure SendPlayerInfo();
    procedure SetDefault;
    procedure CPUMove;
    procedure FreeNetGame();
  public
    { Public declarations }
    procedure ReciveTCPData(var Msg : TMessage);
    procedure ReciveUDPDAta(var Msg : TMessage);
  end;
  TFlags = (fGameRun, fGameOver, fGameLanched, fNetGame, fCPUGame, fInfoWasSent);

var
  Form1: TForm1;
  Flags : set of TFlags;

implementation
uses StrUtils, ABOUT, uAI;
{$R *.dfm}

{ TForm1 }


procedure TForm1.SetDefault;
begin
    btConnectGame.Caption := 'Подключиться';
    lbBlack.Caption := '';
    lbWhite.Caption := '';

    chkGamesList.Clear;

    is_reverse := false;
    Flags := [];

    RadioGroup1.OnClick   := nil;
    cbColor.OnChange      := nil;

    cbColor.ItemIndex     := 1;
    RadioGroup1.ItemIndex := 1;

    cbColor.OnChange      := cbColorChange;
    RadioGroup1.OnClick   := RadioGroup1Click;
    cbFigColor.Selected   := cbFigColor.DefaultColorColor;
    txtOpac.Text          := '255';
    SetColor(255, 0, 255);
end;

procedure TForm1.CreateNewGameClick(Sender: TObject);
begin
    if fNetGame in Flags then FreeNetGame;
    txtPlayerName.Enabled := false;
    btCreateGame.Enabled  := false;
    btSearchGame.Enabled  := false;
    chkGamesList.Enabled  := false;
    btConnectGame.Enabled := false;

    SetDefault;
    InitPlayersForLocaleGame;
    CreateChess(self.Image1.Width);
    PaintChess;
end;

procedure TForm1.NewNetGameClick(Sender: TObject);
begin
    chkGamesList.Clear;
    NewNetGame.Enabled    := false;
    txtPlayerName.Enabled := true;
    btCreateGame.Enabled  := true;
    btSearchGame.Enabled  := true;
    chkGamesList.Enabled  := true;
    btConnectGame.Enabled := true;
    cbColor.Enabled       := true;

    SetDefault;
    CreateNetGame();
    CreateChess(self.Image1.Width);
    PaintChess;
end;


procedure TForm1.WithCPUClick(Sender: TObject);
begin
    if fNetGame in Flags then FreeNetGame;
    txtPlayerName.Enabled := false;
    btCreateGame.Enabled  := false;
    btSearchGame.Enabled  := false;
    chkGamesList.Enabled  := false;
    btConnectGame.Enabled := false;
  //  cbColor.Enabled       := false;

    SetDefault;
    InitPlayersForLocaleGame;
    CreateChess(self.Image1.Width);
    include(Flags, fCPUGame);
    PaintChess;
end;

procedure TForm1.btCreateGameClick(Sender: TObject);
begin
    btCreateGame.Enabled  := false;
    btSearchGame.Enabled  := false;
   // cbColor.Enabled       := false;
    chkGamesList.Enabled  := false;
    txtPlayerName.Enabled := false;
    btConnectGame.Enabled := false;

    InitPlayerForNetGame;
    include(Flags, fGameLanched);
end;

procedure TForm1.CreateNetGame;
begin
    include(Flags, fNetGame);
    FreeAndNil(ThreadTCP);
    FreeAndNil(ThreadUDP);

    ThreadUDP  := TSrvUDP.Create(ReciveUDPDAta);
    ThreadTCP  := TSrvTCP.Create(ReciveTCPData);

    Logger.Logg(['Net Game was created.']);
end;

procedure TForm1.btConnectGameClick(Sender: TObject);
begin
      if Assigned(ThreadTCP) and not ThreadTCP.Connected(Connect_id) then
      begin
          opIP := string(inet_ntoa(ToAddr.sin_addr));
          InitPlayerForNetGame;
          ThreadTCP.Connect(opIP, Connect_id);
          ThreadTCP.SendDataTo('CONNECT', Connect_id);
      end
      else begin
          FreeNetGame;
      end;

end;

procedure TForm1.btSearchGameClick(Sender: TObject);
begin
     btSearchGame.Enabled := false;
     chkGamesList.Clear;
     Logger.Logg(['Serching a new game ']);
     if Assigned(ThreadUDP) then ThreadUDP.SendData('LOOK_FOR_NEW_GAME', ToAddr, true);
     btSearchGame.Enabled := true;
end;

procedure TForm1.InitPlayersForLocaleGame;
begin
    Player1.Name        := 'First';
    Player1.Color       := cbColor.ItemIndex;
    Player1.Active      := Player1.Color = 1;

    Player2.Name        := 'Second';
    Player2.Color       := abs(cbColor.ItemIndex + -1);
    Player2.Active      := Player2.Color = 1;
end;

procedure TForm1.InitPlayerForNetGame;
begin
    Player1.Name   := txtPlayerName.Text;
    Player1.Color  := cbColor.ItemIndex;
    Player1.Active := Player1.Color = 1;

    Player2.Name   := '';
    Player2.Color  := abs(cbColor.ItemIndex + -1);
    Player2.Active := Player2.Color = 1;
end;

procedure TForm1.CPUMove();
var bestMove: TMove;
begin
    FillChar(bestMove, sizeof(bestMove), 0);
    Search(0, bestMove);
    AnalizeMoveResult(MoveFigure(@bestMove), @bestMove);
    ShowWayFor(bestMove.Figure);
    include(Flags, fGameRun);
    PaintChess;
end;

procedure TForm1.txtOpacChange(Sender: TObject);
var NewPos: integer;
begin
   if txtOpac.Text = '' then txtOpac.Text := '255';
   NewPos := StrToInt(txtOpac.Text);
   if not (NewPos in [UpDown1.Min .. UpDown1.Max]) then NewPos := UpDown1.Max;

   UpDown1.OnChangingEx := nil;
   UpDown1.Position     := NewPos;
   UpDown1.OnChangingEx := UpDown1ChangingEx;

   SetColor(cbColor.ItemIndex, cbFigColor.Selected, NewPos);
   PaintChess;
end;

procedure TForm1.UpDown1ChangingEx(Sender: TObject; var AllowChange: Boolean;
  NewValue: SmallInt; Direction: TUpDownDirection);
begin
    AllowChange  := False;
    if NewValue in [UpDown1.Min .. UpDown1.Max] then txtOpac.Text := IntToStr(NewValue)
end;

procedure TForm1.UpdStatus;
var killed : TAllFigures;
    i      : integer;
    b,w    : AnsiString;
begin
    if GetActivePlayer.Color = 0
    then Label2.Caption := ' Ход черных.'
    else Label2.Caption := ' Ход белых.';

    killed := GetKilledFigures();

    b := ''; w := '';
    for i := 0 to FIG_COUNT * 2 - 1 do
    begin
         if killed[i] = nil then break;

         if killed[i].Color = 0 then
             b := b + killed[i].ch
         else
             w := w + killed[i].ch;
    end;
    lbWhite.Caption := string(w);
    lbBlack.Caption := string(b);
    Label1.Caption := IntToStr(cntmoves);
end;

procedure TForm1.cbColorChange(Sender: TObject);
begin
   cbFigColor.Selected := GetColor(cbColor.ItemIndex);
   if  (fGameRun in Flags) then  exit;

   case cbColor.ItemIndex of
        0 : begin
                Player1.Color := 0;
                Player2.Color := 1;
                SetAcivePlayerTo(Player2);
            end;
        1 : begin
                Player1.Color := 1;
                Player2.Color := 0;
                SetAcivePlayerTo(Player1);
            end;
    end;

    RadioGroup1.OnClick   := nil;
    if is_reverse
    then RadioGroup1.ItemIndex := abs(cbColor.ItemIndex + -1)
    else RadioGroup1.ItemIndex := cbColor.ItemIndex;
    RadioGroup1.OnClick   := RadioGroup1Click;
end;

procedure TForm1.cbFigColorChange(Sender: TObject);
begin
    if cbColor.ItemIndex < 0 then exit;
    SetColor(cbColor.ItemIndex, cbFigColor.Selected, UpDown1.Position);
    PaintChess
end;

procedure TForm1.chkGamesListClick(Sender: TObject);
var i: integer;
    ip: AnsiString;
begin
    if chkGamesList.Items.Count > 0 then
    begin
       for i := 0 to chkGamesList.Items.Count - 1 do
          if chkGamesList.Checked[i] then
          begin
              ip := AnsiString(chkGamesList.Items[i]);
              ToAddr.sin_addr.S_addr :=inet_addr(@ip[1]);
          end;
    end;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
    ClearMoves(posible_moves);
    ReversePlay();
    PaintChess
end;

procedure TForm1.SaveGameClick(Sender: TObject);
begin
    Core.SaveGame(ExtractFilePath(Application.ExeName) + 'sv.txt');
end;

procedure TForm1.LoadGameClick(Sender: TObject);
begin
     exclude(Flags, fGameOver);
     Core.LoadGame(ExtractFilePath(Application.ExeName) + 'sv.txt');
     cbColor.ItemIndex := Player1.Color;
     txtPlayerName.Text := Player1.Name;
     PaintChess;
end;

procedure TForm1.mnuAboutClick(Sender: TObject);
begin
  if not Assigned(AboutBox) then AboutBox := TAboutBox.Create(Application);
  AboutBox.ShowModal;
  FreeAndNil(AboutBox)
end;

procedure TForm1.AnalizeMoveResult(MR : TMoveResult; Move: PMove);
begin
    case MR of
       mrIllegal : begin ClearMoves(posible_moves); Abort; end;
       mrShach   : if (not (fNetGame in Flags)) or
                      ((fNetGame in Flags) and (GetActivePlayer().Color = Player2.Color))
                   then MessageBox(0, 'Шах!', PWideChar(Caption), MB_OK or MB_ICONINFORMATION);

       mrMat     : MessageBox(0, 'Мат!', PWideChar(Caption), MB_OK or MB_ICONINFORMATION);

       mrPat     : MessageBox(0, 'Пат!', PWideChar(Caption), MB_OK or MB_ICONINFORMATION);
    end;
    if player1.Active then SetAcivePlayerTo(Player2) else SetAcivePlayerTo(Player1);
    if mr in [mrPat, mrMat] then include(Flags, fGameOver);

end;

procedure TForm1.ApplyPlayerInfo(const s: string);
var i,c    : integer;
    tmpstr : string;
begin
     tmpstr := '';
     c := 1;
     for i := pos('=', s) + 1 to length(s) do
     begin
          if AnsiChar(s[i]) in [',', ';'] then
          begin
             case c of
              1 : Player2.Name  := tmpstr;
              2 : Player2.Color := StrToInt(tmpstr);
             end;
             tmpstr := '';
             inc(c);
          end
          else tmpstr := tmpstr + s[i];
     end;

     if player2.Color = 1
     then SetAcivePlayerTo(Player2)
     else SetAcivePlayerTo(Player1);
end;

procedure TForm1.SendPlayerInfo;
var s: string;
begin
   if not (fInfoWasSent in Flags) then
   begin
        s := 'PLAYER_INFO=' + Player1.Name + ',' +
                              IntToStr(Player1.Color) + ';';
        ThreadTCP.SendDataTo(s, Connect_id);
        include(Flags, fInfoWasSent);
   end;
end;

procedure TForm1.ReciveTCPData(var Msg: TMessage);
var s,sIP : string;
    res   : integer;
    Move  : TMove;
    Mr    : TMoveResult;
begin
     sIP  := string(inet_ntoa(in_addr(Msg.iparam2)));

     if Msg.msg = M_DISCONECT then
     begin
         if chkGamesList.Items.Count > 0 then
             chkGamesList.Items[chkGamesList.Items.IndexOf(sIP)] := 'Conn. Lost';
         FreeNetGame;
         exit;
     end;

     s    := ThreadTCP.GetMsg(PBuf(Msg.iparam1));
     Logger.Logg(['Recieve ', s, ' from ', sIP]);

     if s = 'CONNECT' then
     begin
        chkGamesList.Items.Append(sIP);
        btConnectGame.Enabled := true;
        btConnectGame.Caption := 'Отключить';
        SendPlayerInfo();
        exit;
     end;

     res := pos('PLAYER_INFO=', s);
     if (res > 0) then
     begin
          btConnectGame.Caption := 'Отключить';
          btCreateGame.Enabled  := false;
          btSearchGame.Enabled  := false;
          txtPlayerName.Enabled := false;
          chkGamesList.Enabled  := false;

          ApplyPlayerInfo(s);
          cbColor.ItemIndex := abs(Player2.Color + -1);
          cbColorChange(self);
          SendPlayerInfo();
          exit;
     end;

     res := pos('POS=', s);
     if res > 0 then
     begin
         Move := StrToMove(s);
         mr   := MoveFigure(@Move);
         AnalizeMoveResult(mr, @Move);
         include(Flags, fGameRun);
         PaintChess;
     end;

     res := pos('CHAT=', s);
     if res > 0 then
     begin
          memCorrespondence.Lines.Append(
                  FormatDateTime('dd.mm.yyyy hh:mm', Date + Time) +
                  '  ' + Player2.Name + ' (' + sIP + '):   ' +
                  RightStr(s, length(s) - length('CHAT='))
          );
     end;

     res := pos('BACK', s);
     if res > 0 then
     begin
       ClearMoves(posible_moves);
       Back();
       PaintChess
     end;
end;

procedure TForm1.ReciveUDPDAta(var Msg: TMessage);
var s,ip : string;
begin
   ip := string(inet_ntoa(in_addr(Msg.iparam2)));
   s := ThreadUDP.GetMsg(PBuf(msg.iparam1));
   Logger.Logg(['Recieve "', s, '" from ', ip]);

   if (s = 'LOOK_FOR_NEW_GAME') and (fGameLanched in Flags) then
   begin
        ToAddr.sin_addr.S_addr := Msg.iparam2;

        ThreadUDP.SendData('HAVE_NEW_GAME', ToAddr, False);
        ThreadTCP.Connect(ip, Connect_id);
        opIP := Copy(ip, 1, length(ip));
   end
   else if (s = 'HAVE_NEW_GAME') then
   begin
        chkGamesList.Items.Append(IP);
   end
end;

procedure TForm1.Image1Paint(Sender: TObject);
begin
      Image1.Canvas.Draw(0,0, Pic.Bitmap);
end;

procedure TForm1.Image1_Click(Sender: TObject);
var Move : PMove;
    mr : TMoveResult;
begin
     if fGameOver in Flags then exit;

     if Assigned(choosen_figure) then
     try
           Move := GetMoveAtCell(selected_cell, posible_moves);
           if (Move = nil) or (Move.Figure.Color <> GetActivePlayer().Color) then exit;

           mr := MoveFigure(Move);
           AnalizeMoveResult(mr, Move);

           Logger.Logg(['Move ', GetenumName(TypeInfo(TFigType), ord(Move.Figure.FigType)), '  ',
                       Move.FromCell.x, ',', Move.FromCell.y, '  ', Move.ToCell.x, ',', Move.ToCell.y,';']);

           if (fNetGame in Flags) and Assigned(ThreadTCP)
           then ThreadTCP.SendDataTo('POS=' + MoveToStr(Move), Connect_id);

           ShowWayFor(choosen_figure);

           PaintChess;
           if fCPUGame in Flags then CPUMove();
     finally
           include(Flags, fGameRun);
           if Assigned(choosen_figure) then choosen_figure := nil;
     end
     else if Assigned(selected_cell) then
     begin
          choosen_figure := GetFigureAtCell(selected_cell);

          if (fNetGame in Flags) and Assigned(choosen_figure) and
             (choosen_figure.Color <> Player1.Color) then
          begin
             choosen_figure := nil;
             exit;
          end;

          if (not (fNetGame in Flags)) and Assigned(choosen_figure) and
             (choosen_figure.Color <> GetActivePlayer().Color) then
          begin
             choosen_figure := nil;
             exit;
          end;

          ShowWayFor(choosen_figure);
          PaintChess
     end;
end;

procedure TForm1.Image1_ContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin
     choosen_figure := nil;
     ClearMoves(posible_moves);
     PaintChess
end;

procedure TForm1.Image1_MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
var Cell : PCell;
begin
     if fGameOver in Flags then exit;

     Cell    := GetSelectedCell(x,y);
     if Cell = OldCell then exit;
     OldCell := Cell;

     PaintChess;
end;

procedure TForm1.PaintChess;
begin
     UpdStatus;
     Render_Scene(Self.Image1.Width);
     Image1.Invalidate;
end;

procedure TForm1.PicSaveClick(Sender: TObject);
begin
   Pic.Bitmap.SaveToFile(AppDir + 'game.bmp');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    IsMultiThread := true;
    chkGamesList.MultiSelect := false;
    SetDefault;
    AppDir := ExtractFilePath(Application.ExeName);
    Logger := TLogger.Create(AppDir + 'log.txt');

    FillChar(ToAddr, sizeof(ToAddr), 0);
    ToAddr.sin_family      := AF_INET;
    ToAddr.sin_port        := htons(PORT);
    ToAddr.sin_addr.S_addr := INADDR_ANY;

    lbWhite.Font.Name  := 'ISDiagram';
    lbBlack.Font.Name  := 'ISDiagram';

    CreateNewGameClick(Sender);
    PaintChess
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
      StopMessenger;
      StopGame;
      FreeAndNil(ThreadUDP);
      FreeAndNil(ThreadTCP);
      StopNet;
      FreeAndNil(Logger);
end;

procedure TForm1.FreeNetGame;
begin
     NewNetGame.Enabled := true;
     btConnectGame.Caption := 'Подключиться';
     ThreadTCP.Disconnect(Connect_id);
end;

procedure TForm1.ApplicationEvents1ShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
    if (Msg.CharCode = VK_F6) then
    begin
       if (fGameOver in Flags) then Exclude(Flags, fGameOver);
       ClearMoves(posible_moves);
       Back();
       if (fNetGame in Flags) and Assigned(ThreadTCP)
       then ThreadTCP.SendDataTo('BACK', Connect_id);
       PaintChess
    end;
end;

procedure TForm1.txtPlayerNameChange(Sender: TObject);
begin
   Player1.Name := txtPlayerName.Text;
end;

procedure TForm1.txtMsgKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (Key = VK_RETURN) and (txtMsg.Text <> '') then
    begin
        memCorrespondence.Lines.Append(FormatDateTime('dd.mm.yyyy hh:mm', Date + Time) +
                                       '  ' + Player1.Name + ':   ' + txtMsg.Text);

        if Assigned(ThreadTCP)then ThreadTCP.SendDataTo('CHAT=' + txtMsg.Text, Connect_id);
        txtMsg.Text := '';
    end;
end;

procedure TForm1.ExitGameClick(Sender: TObject);
begin
    Close;
end;

end.
