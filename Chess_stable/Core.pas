unit Core;

interface
uses System.SysUtils, Vcl.Graphics, System.Types, WinApi.GDIPApi, WinApi.GDIPOBJ;

const LINE_LEN = 8;
      FIG_COUNT = 16;

type
    TDirection = (dN, dNE, dE, dSE, dS, dSW, dW, dNW);

    TFigType = (tPawn, tLKnight, tRKnight, tLBishop, tRBishop, tLRook, tRRook, tQueen, tKing);

    TMoveResult = (mrProccess, mrShach, mrPat, mrMat, mrIllegal);

    TMoveType = (mCover, mAttack, mCastlingShort, mCastlingLong, mUpgrade);

    TPlayer = record
        Name   : string;
        Color  : byte;
        Active : Boolean;
    end;

    PCell = ^TCell;
    TCell = record
      x,y     : word;
      Rect    : TGPRectF;
      Color   : TGPColor;
    end;

    PFigure = ^TFigure;
    TFigure = record
       id        : byte;
       ch        : AnsiChar;
       FigType   : TFigType;
       Home      : TDirection;
       Color     : byte;        // index of a color array
       CountMove : word;
       Cell      : PCell;
       Dead      : boolean;
    end;

    TField       = array [0 .. LINE_LEN - 1, 0 .. LINE_LEN - 1] of PCell;
    TAllFigures  = array [0 .. FIG_COUNT * 2 - 1] of PFigure;
    TFigures     = array [0 .. FIG_COUNT - 1] of PFigure;

    PMove = ^TMove;
    TMove = record
      Next     : PMove;
      MoveType : set of TMoveType;
      Figure,
      KCC_Figure  : PFigure;  // Used for Attacked, Castling Rook, Cover Figures;
      FromCell,
      ToCell    : PCell;
      Enabled   : boolean;
    end;

    TMoveHistory = record
        Reverse : Boolean;
        Move    :   TMove
    end;

    TCallback = reference to procedure(Figure: PFigure);

var cntmoves         : cardinal = 0;
    selected_cell    : PCell = nil;
    choosen_figure   : PFigure = nil;
    player1, player2 : TPlayer;
    is_reverse       : boolean = false;
    posible_moves    : PMove = nil;
    pic              : TPicture;
    pic_rect         : TGPRectF;

procedure SetColor(id: byte; NewColor:TColor; alpha: byte);
function GetColor(id: byte): TColor;

{Return last move}
procedure Back();

procedure Render_Scene(width: integer);
procedure CreateChess(Width: integer);

function MoveFigure(Move : PMove): TMoveResult;
procedure UnMoveFigure(Move: PMove);

procedure ShowWayFor(Figure : PFigure);
function GetSelectedCell(gx,gy : integer): PCell;
function GetFigureAtCell(Cell : PCell) : PFigure;
function GetMoveAtCell(Cell : PCell; Source : PMove) : PMove;

function CellUnderAttack(Cell: PCell; By: TDirection;
                         Mode: byte; var CallBack: TCallBack): boolean;

function MoveToStr(Move: PMove): string;
function StrToMove(const NewPositions : string): TMove;

procedure ReversePlay();

function GetActivePlayer(): TPlayer;
procedure SetAcivePlayerTo(var Player: TPlayer);

function GetFigure(id: byte): PFigure;
function GetKilledFigures(): TAllFigures;

function FigureToStr(Figure: PFigure): string;
function StrToFigure(const Str: string): TFigure;
function StrToPlayer(const Str: string): TPlayer;

procedure ClearMoves(var Start : PMove);

function FindAllMoves(Figure : PFigure; CalcCastling,Disabling: Boolean) : PMove;overload;
function FindAllMoves(color: byte): PMove;overload;

procedure LoadGame(const FileName: string);
procedure SaveGame(const FileName: string);

procedure StopGame();

implementation
uses Classes;

var field         : TField;
    figures       : TAllFigures;
    colors        : array[0..1] of TGPColor = (aclPurple, aclSilver);
    mirror        : array[0 .. 7] of integer = (7, 6, 5, 4, 3, 2, 1, 0);
    move_history  : array of TMoveHistory;
    ihis          : integer = 0;
    Sep           : set of AnsiChar = [',', ';'];

procedure SetColor(id: byte; NewColor:TColor; alpha: byte);
var r,g,b:byte;
begin
   if id > 1 then
   begin
       Colors[0] := aclPurple;
       Colors[1] := aclSilver
   end
   else begin
       r := NewColor;
       g := NewColor shr 8;
       b := NewColor shr 16;

       Colors[id] := (DWORD(b)             or
                     (DWORD(g)    shl  8)  or
                     (DWORD(r)    shl  16) or
                     (DWORD(alpha) shl  24))
   end;
end;

function GetColor(id: byte): TColor;
var r,g,b: byte;
begin
     r := Colors[id] shr 16;
     g := Colors[id] shr 8;
     b := Colors[id];

     result :=  DWORD(r)        or
               (DWORD(g) shl 8) or
               (DWORD(b) shl 16);

end;

  // Returns the player who has to move figure now
function GetActivePlayer(): TPlayer;
begin
    if Player1.Active and not Player2.Active then result := Player1
    else if Player2.Active and not Player1.Active then result := Player2
    else raise Exception.Create('INVALID PLAYER ACTIVE STATUS.');
end;

procedure SetAcivePlayerTo(var Player: TPlayer);
begin
    Player.Active := true;
    if Player.Color = Player1.Color then Player2.Active := false
    else if Player.Color = Player2.Color then Player1.Active := false;
end;

function GetCell(x,y: word): PCell;inline;
begin
    if (x in [0..LINE_LEN - 1]) and (y in [0..LINE_LEN - 1])
    then result := Field[x,y]
    else result := nil;
end;

procedure LoadGame(const FileName: string);
var i: integer;
    List: TStringList;
    F : TFigure;
    PF : PFigure;
    reverse: Boolean;
begin
     ihis := 0;
     List := TStringList.Create;
     List.LoadFromFile(FileName);

     i := 0;
     Reverse := StrToBool(List.Strings[i]);
     inc(i);

     cntmoves := StrToInt(List.Strings[i]);
     inc(i);

     while i <= List.Count - 3 do
     begin
         F   := StrToFigure(List.Strings[i]);
         if (Reverse xor is_reverse)then
         begin
               F.Cell := GetCell(F.Cell.x, Mirror[F.Cell.y]);
               if (F.Home = dN) then F.Home := dS else F.Home := dN;
         end;

         PF  := GetFigure(F.id);
         PF^ := F;
         inc(i);
     end;

     Player1 := StrToPlayer(List.Strings[i]);
     inc(i);
     Player2 := StrToPlayer(List.Strings[i]);

     List.Free;
end;

procedure SaveGame(const FileName: string);
var i: integer;
    List: TStringList;
begin
    List := TStringList.Create;

    List.Append(BoolToStr(is_reverse));

    List.Append(IntToStr(cntmoves));

    for i := 0 to FIG_COUNT * 2 - 1 do
         List.Append(FigureToStr(GetFigure(i)));

    List.Append(Player1.Name + ',' + IntToStr(Player1.Color) + ',' + BoolToStr(Player1.Active) + ';');
    List.Append(Player2.Name + ',' + IntToStr(Player2.Color) + ',' + BoolToStr(Player2.Active) + ';');

    List.SaveToFile(FileName);
    List.Free;
end;

procedure Back();
var cl,cl2: byte;
    c: cardinal;
    M: TMove;
begin
    if ihis = 0 then exit;
    cl := GetActivePlayer.Color;
    c  := cntmoves;

    repeat
        M := move_history[ihis].Move;

        with move_history[ihis] do
        if (Reverse xor is_reverse) then
        begin
            M.FromCell := GetCell(Move.FromCell.x, Mirror[Move.FromCell.y]);
            M.ToCell   := GetCell(Move.ToCell.x, Mirror[Move.ToCell.y]);
        end;

        UnMoveFigure(@M);
        cl2 := move_history[ihis].Move.Figure.Color;
        dec(ihis)
    until (cl = cl2) or (ihis = 0);

    if c = 1 then
    begin
         cntmoves := 0;
         if Player1.Color = 1 then SetAcivePlayerTo(Player1) else SetAcivePlayerTo(Player2);
    end
    else cntmoves := c - 2;
end;

procedure AppendHistory(Move: PMove);
begin
    inc(ihis);
    if ihis mod 100 = 0 then
        SetLength(move_history, length(move_history) + 100);

    move_history[ihis].Move      := Move^;
    move_history[ihis].Move.Next := nil;

    move_history[ihis].Reverse   := is_reverse;
end;

function Prev(): TMoveHistory; inline;
begin
   result := move_history[ihis];
end;

function GetKilledFigures(): TAllFigures;
var i : PFigure;
    j : integer;
begin
    FillChar(result, sizeof(result), 0);

    j := 0;
    for i in Figures do
    begin
         if i.Dead then
         begin
            Result[j] := i;
            inc(j)
         end;
    end;
end;

function GetFigure(id: byte): PFigure;
begin
    if id in [0..FIG_COUNT * 2 - 1] then result := Figures[id] else Result := nil;
end;

procedure ReversePlay();
var i: PFigure;
begin
    for i in Figures do
    begin
        if i.Home = dN then i.Home := dS else i.Home := dN;

        i.Cell := GetCell(i.Cell.x, Mirror[i.Cell.y]);
    end;
    is_reverse := not is_reverse;
end;

function StrToPlayer(const Str: string): TPlayer;
var i, param: integer;
    s: string;
begin
   s     := '';
   param := 1;
   
   for i := 1 to length(Str) do
   begin
      if (AnsiChar(Str[i]) in Sep) then
      begin
        case param of
          1: result.Name := s;
          2: result.Color := StrToInt(s);
          3: result.Active := StrToBool(s); 
        end;

        s := '';
        inc(param);
      end
      else s := s + Str[i];
   end;
end;

function FigureToStr(Figure: PFigure): string;
begin
  result := '';
  result := result + IntToStr(Figure.id)           + ',' +
                     Char(Figure.ch)               + ',' +
                     IntToStr(ord(Figure.FigType)) + ',' +
                     IntToStr(ord(Figure.Home))    + ',' +
                     IntToStr(Figure.Color)        + ',' +
                     IntToStr(Figure.CountMove)    + ',' +
                     IntToStr(Figure.Cell.x)       + ',' +
                     IntToStr(Figure.Cell.y)       + ',' +
                     BoolToStr(Figure.Dead)        + ';'
end;

function StrToFigure(const Str: string): TFigure;
var i,param,x,y: integer;
    s : string;
begin
     s     := '';
     x     := 0;
     param := 1;

     for i := 1 to length(Str) do
     begin
         if (AnsiChar(Str[i]) in Sep) then
         begin
            case param of
               1: result.id        := StrToint(s);
               2: result.ch        := AnsiChar(s[1]);
               3: result.FigType   := TFigType(StrToInt(s));
               4: result.Home      := TDirection(StrToInt(s));
               5: result.Color     := StrToInt(s);
               6: result.CountMove := StrToInt(s);
               7: x                := StrToInt(s);
               8: begin
                    y := StrToInt(s);

                    result.Cell := GetCell(x,y);
                  end;
               9: result.Dead      := StrToBool(s);

            end;
            s := '';
            inc(param)
         end
         else s := s + Str[i];
     end;
end;

function MoveToStr(Move: PMove): string;
begin
    result := '';
    if not Assigned(Move.Figure) then exit();

    result := result + IntToStr(Move.Figure.id) + ',' +
                       BoolToStr(Move.Figure.Dead)  + ',' +
                       IntToStr(Move.FromCell.x) + ',' +
                       IntToStr(Move.FromCell.y) + ',' +
                       IntToStr(Move.ToCell.x) + ',' +
                       IntToStr(Move.ToCell.y) + ',' +
                       IntToStr(PByte(@Move.MoveType)^) + ',';

    if Assigned(Move.KCC_Figure)
    then result := result + IntToStr(Move.KCC_Figure.id) + ','
    else result := result + '-1,';

    result := result + BoolToStr(is_reverse) + ';';
end;

function CreateMove():PMove;
begin
    result          := AllocMem(sizeof(TMove));
    result.MoveType := [];
    result.Enabled  := true;
end;

function GetFigureAtCell(Cell : PCell) : PFigure;
var i : PFigure;
begin
     Result := nil;
     if not Assigned(Cell) then exit();

     for i in Figures do
           if (not i.Dead) and (i.Cell = Cell) then exit(i)
end;

function StrToMove(const NewPositions : string): TMove;
var i, param, xf, yf, xt, yt: word;
    s: string;
    OponentPlayReverse: boolean;
    p : PMove;
begin
     p      := CreateMove();
     result := p^;
     param  := 1;
     s      := '';
     xf := 0; yf := 0; xt := 0; yt := 0;

     for i := 1 to Length(NewPositions) do
     begin
           if AnsiChar(NewPositions[i]) in Sep then
           begin
                 case param of
                     1: result.Figure := Figures[StrToInt(s)];
                     2: result.Figure.Dead := StrToBool(s);
                     3: xf  := StrToInt(s);
                     4: yf  := StrToint(s);
                     5: xt  := StrToInt(s);
                     6: yt  := StrToint(s);
                     7: PByte(@result.MoveType)^ := StrToInt(s);
                     8: result.KCC_Figure        := GetFigure(StrToInt(s));
                     9: begin
                            OponentPlayReverse := StrToBool(s);

                            if OponentPlayReverse xor is_reverse then
                            begin
                                 yf := Mirror[yf];
                                 yt := Mirror[yt];
                            end;

                            result.ToCell   := GetCell(xt,yt);
                            result.FromCell := GetCell(xf, yf);
                            param           := 0;
                        end;
                 end;

                 s := '';
                 inc(param);
           end
           else if AnsiChar(NewPositions[i]) in ['0'..'9'] then
                                              s := s + NewPositions[i];
     end;
     FreeMem(p);
end;

procedure ClearMoves(var Start : PMove);
var Node : PMove;
begin
      Node := Start;

      while Node <> nil do
      begin
           FreeMem(Node);

           Node := Node.Next;
      end;
      Start := nil;
end;

function GetSelectedCell(gx,gy : integer): PCell;
var i: PCell;
begin
     result := nil;
     for i in Field do
     with i.Rect do
     begin
           if (gx >= X) and (gx <= X + Width) and
              (gy >= Y) and (gy <= Y + Height) then
           begin
                   result       := i;
                   selected_cell := result;
                   exit(result);
           end;
     end;
end;

function GetMoveAtCell(Cell : PCell; Source : PMove) : PMove;
var Node : PMove;
begin
      result := nil;
      Node   := Source;

      while Node <> nil do
      begin
           if (Node.ToCell = Cell) then exit(Node);

           Node := Node.Next;
      end;
end;

function GetNextCell(d: TDirection; out x, y: word; knight: boolean = false): PCell;
begin
   case d of
       dN: if knight then begin dec(y, 2); dec(x) end else dec(y);
      dNE: if knight then begin dec(y, 2); inc(x) end else begin dec(y); inc(x) end;
       dE: if knight then begin dec(y); inc(x, 2) end else inc(x);
      dSE: if knight then begin inc(y); inc(x, 2) end else begin inc(y); inc(x) end;
       dS: if knight then begin inc(y, 2); inc(x) end else inc(y);
      dSW: if knight then begin inc(y, 2); dec(x) end else begin inc(y); dec(x) end;
       dW: if knight then begin inc(y); dec(x, 2) end else dec(x);
      dNW: if knight then begin dec(y); dec(x, 2) end else begin dec(y); dec(x) end;
   end;
   result := GetCell(x, y);
end;

function FindWayForPawn(Direction: TDirection; Figure : PFigure) : PMove;
var i,x,y            : word;
    Node, ParentNode : PMove;
    Cell             : PCell;
    F                : PFigure;
    Last             : TMoveHistory;

    procedure NewMove;
    begin
        Node := CreateMove();
        if Assigned(ParentNode) then ParentNode.Next := Node;

        Node.Figure    := Figure;
        Node.FromCell  := GetCell(Figure.Cell.x, Figure.Cell.y);
        Node.ToCell    := Cell;
        ParentNode     := Node;

        if (F <> nil) then
        begin
             Node.KCC_Figure := F;
             if (Node.Figure.Home = F.Home)
             then include(Node.MoveType, mCover)
             else include(Node.MoveType, mAttack);
        end;

        if (byte(Node.ToCell.y) in [0, 7]) then include(Node.MoveType, mUpgrade);
        if not Assigned(result) then result := Node;
    end;

begin
   result := nil; ParentNode := nil; F := nil;
   x := Figure.Cell.x; y := Figure.Cell.y;

   case Direction of
  dN, dS : for i := 1 to 2 do
           begin
              if (Direction = Figure.Home) then exit;
              Cell := GetNextCell(Direction, x, y);
              if (i < 2) or ((Figure.CountMove = 0) and (i = 2)) then
              begin
                  if Assigned(GetFigureAtCell(Cell)) then exit;
                  NewMove();
              end;
           end;
  dE, dW : begin
              Cell := GetNextCell(Direction, x, y);
              F    := GetFigureAtCell(Cell);
              Last := Prev();

              with Last.Move do
              if (F = nil) or (F <> Figure) or (Figure.FigType <> tPawn) or
                 (abs(FromCell.y - ToCell.y) <> 2) then exit();

              NewMove;
           end;
dSW,dSE, dNE, dNW:
           begin
               if ((Figure.Home = dN) and (Direction in [dNE, dNW])) or
                  ((Figure.Home = dS) and (Direction in [dSE, dSW])) then exit;

               Cell := GetNextCell(Direction, x,y);
               F    := GetFigureAtCell(Cell);

               if (F <> nil) then
               begin
                   NewMove();
                   Result.KCC_Figure := F;
                   if (result.Figure.Home = F.Home)
                   then include(result.MoveType, mCover)
                   else include(Result.MoveType, mAttack);
               end;
          end;
   end;
end;

function FindWayForKnight(Direction : TDirection; Figure : PFigure) : PMove;
var x,y  : word;
    Cell : PCell;
    F    : PFigure;
begin
      result      := nil;

      x := Figure.Cell.x;
      y := Figure.Cell.y;

      Cell := GetNextCell(Direction, x, y, true);

      if Assigned(Cell) then
      begin
          result          := CreateMove();
          result.Figure   := Figure;
          result.FromCell := GetCell(Figure.Cell.x, Figure.Cell.y);
          result.ToCell   := Cell;
          F               := GetFigureAtCell(Cell);

          if (F <> nil) then
          begin
               Result.KCC_Figure := F;
               if (result.Figure.Home = F.Home)
               then include(result.MoveType, mCover)
               else include(Result.MoveType, mAttack);
          end;
      end;
end;

function FindWayForRook(Direction : TDirection; Figure : PFigure; lim : byte = 255) : PMove;
var x,y              : word;
    Node, ParentNode : PMove;
    F                : PFigure;
    Cell             : PCell;
begin
      result := nil;
      if not (Direction in [dN, dS, dE, dW]) then exit;

      ParentNode := nil; F := nil;

      x := Figure.Cell.x;
      y := Figure.Cell.y;

      Cell := GetNextCell(Direction, x, y);
      while Assigned(Cell) and (F = nil) and (lim > 0) do
      begin
          F    := GetFigureAtCell(Cell);
          Node := CreateMove();
          if Assigned(ParentNode) then ParentNode.Next := Node;

          Node.Figure    := Figure;
          Node.FromCell  := GetCell(Figure.Cell.x, Figure.Cell.y);
          Node.ToCell    := Cell;
          ParentNode     := Node;

          if (F <> nil) then
          begin
               Node.KCC_Figure := F;
               if (Node.Figure.Home = F.Home)
               then include(Node.MoveType, mCover)
               else include(Node.MoveType, mAttack);
          end;

          if not Assigned(result) then result := Node;

          Cell := GetNextCell(Direction, x, y);
          dec(lim);
      end;
end;

function FindWayForBishop(Direction : TDirection; Figure : PFigure; lim : byte = 255) : PMove;
var x,y              : word;
    Node, ParentNode : PMove;
    F                : PFigure;
    Cell             : PCell;
begin
      result := nil;
      if (Direction in [dN, dS, dE, dW]) then exit;

      ParentNode := nil; F := nil;

      x      := Figure.Cell.x;
      y      := Figure.Cell.y;

      Cell := GetNextCell(Direction, x, y);

      while Assigned(Cell) and (F = nil) and (lim > 0) do
      begin
          F    := GetFigureAtCell(Cell);
          Node := CreateMove();
          if Assigned(ParentNode) then ParentNode.Next := Node;

          Node.Figure     := Figure;
          Node.FromCell   := GetCell(Figure.Cell.x, Figure.Cell.y);
          Node.ToCell     := Cell;
          ParentNode      := Node;

          if (F <> nil) then
          begin
               Node.KCC_Figure := F;
               if (Node.Figure.Home = F.Home)
               then include(Node.MoveType, mCover)
               else include(Node.MoveType, mAttack);
          end;

          if not Assigned(result) then result := Node;

          Cell := GetNextCell(Direction, x, y);
          dec(lim);
      end;
end;

function FindWayForQueen(Direction : TDirection; Figure : PFigure) : PMove;
begin
     if Direction in [dN, dE, dS, dW] then
             result := FindWayForRook(Direction, Figure)
     else
             result := FindWayForBishop(Direction, Figure);
end;

function CastlingEnabled(Direction: TDirection; King : PFigure): boolean;
var x,y : word;
    Rook, Figure: PFigure;
    NextCell : PCell;
    op: TDirection;
    c: TCallBack;
begin
     c      := nil;
     result := false;

     if Direction = dE
     then Rook := Figures[King.Color * FIG_COUNT + 3]
     else Rook := Figures[King.Color * FIG_COUNT + 2];

     if (King.CountMove > 0) or (Rook.CountMove > 0) then exit;

     x        := King.Cell.x;
     y        := King.Cell.y;
     op       := TDirection(abs(ord(King.Home) + -4));
     NextCell := GetCell(x, y);

     repeat
           if CellUnderAttack(NextCell, op, 0, c) then exit;
           if Direction = dE then inc(x) else dec(x);

           NextCell := GetCell(x, y);
           Figure   := GetFigureAtCell(NextCell);
           result   := Assigned(Figure) and (Figure = Rook);

     until (NextCell = nil) or (Figure <> nil);
end;

function FindWayForKing(Direction : TDirection; Figure : PFigure; CalcCastling: boolean) : PMove;
var p : PMove;
begin
     if Direction in [dN, dE, dS, dW] then
     begin
          if CalcCastling and
             (Direction in [dE, dW]) and
             CastlingEnabled(Direction, Figure) then
          begin
               result := FindWayForRook(Direction, Figure, 2);

               if (result = nil) or (Result.Next = nil) then exit;

               p := Result.Next;
               if (p.ToCell.x - p.FromCell.x > 1) then
               begin
                   include(p.MoveType, mCastlingShort);
                   p.KCC_Figure := Figures[p.Figure.Color * FIG_COUNT + 3];
               end;

               if (p.ToCell.x - p.FromCell.x < -1) then
               begin
                   include(p.MoveType, mCastlingLong);
                   p.KCC_Figure := Figures[p.Figure.Color * FIG_COUNT + 2];
               end;
          end
          else result := FindWayForRook(Direction, Figure, 1)
     end
     else result := FindWayForBishop(Direction, Figure, 1);
end;

procedure DisableMoves(Moves: Pmove; King: PFigure);
var Node : PMove;
    Cell : PCell;
    op   : TDirection;
    c: TCallBack;
begin
    if Moves = nil  then exit;
    c    := nil;
    op   := TDirection(abs(ord(King.Home) + -4));
    Node := Moves;

    while (Node <> nil) do
    begin
      if not (mCover in Node.MoveType) then
      begin
        Cell             := Node.Figure.Cell;
        Node.Figure.Cell := Node.ToCell;
        if mAttack in Node.MoveType then Node.KCC_Figure.Dead := true;

        Node.Enabled     := not CellUnderAttack(King.Cell, op, 0, c);

        if mAttack in Node.MoveType then Node.KCC_Figure.Dead := false;
        Node.Figure.Cell := Cell;
      end;

      Node := Node.Next;
    end;
end;

function FindAllMoves(Figure : PFigure; CalcCastling,Disabling: Boolean) : PMove;overload;
var d : TDirection;
    Node, Last : PMove;
begin
     result := nil;
     Last := nil;

     if Assigned(Figure) and not Figure.Dead then
     begin
         for d := dN to dNW do
         begin
               case Figure.FigType of
                  tPawn               : Node := FindWayForPawn(d, Figure);
                  tLKnight, tRKnight  : Node := FindWayForKnight(d, Figure);
                  tLRook, tRRook      : Node := FindWayForRook(d, Figure);
                  tLBishop, tRBishop  : Node := FindWayForBishop(d, Figure);
                  tQueen              : Node := FindWayForQueen(d, Figure);
                  tKing               : Node := FindWayForKing(d, Figure, CalcCastling);
                    else                Node := nil;
               end;

               if Assigned(Node) then
               begin
                     if result = nil then result := Node else Last.Next := Node;

                     Last := Node;
                     while Assigned(Last.Next) do Last := Last.Next;
               end;
         end;
         if (result <> nil) and (Disabling) then
             DisableMoves(result, Figures[result.Figure.Color * FIG_COUNT]);
     end;
end;

function FindAllMoves(color: byte): PMove;overload;
var i: integer;
    Node, Last: PMove;
begin
   result := nil;
   Last   := nil;

   for i := color * FIG_COUNT to color * FIG_COUNT + 15 do
   begin
       Node := FindAllMoves(Figures[i], true, true);

       if Assigned(Node) then
       begin
            if result = nil then result := Node else Last.Next := Node;
            Last := Node;
            while Assigned(Last.Next) do Last := Last.Next;
       end;
   end;
end;

function DetectDirection(FromCell, ToCell: PCell): TDirection;
var f: integer;
const q:single = 180;
asm
     {ALGORITHM:
     f := trunc(arctan2(ToCell.y - FromCell.y,
                        ToCell.x - FromCell.x) * 180 / pi);
     case f  of
       -90: result := dN;
        90: result := dS;
   -89..-1: result := dNE;
         0: result := dE;
     1..89: result := dSE;
   91..179: result := dSW;
       180: result := dW;
       else result := dNW;
     end;}

     MOV     EAX, dword ptr [EAX]
     MOV     EDX, dword ptr [EDX]
     SUB     DX, AX
     ROR     EDX, 16
     ROR     EAX, 16
     SUB     DX, AX
     MOV     f, EDX
     FILD    word ptr [f]
     FILD    word ptr [f + $02]
     FPATAN
     FMUL    q
     FLDPI
     FDIV
     FISTP   f
     WAIT
     MOV     EAX, f
     TEST    EAX, EAX
     JL      @lower
     JG      @greate
     MOV     result, dE               // 0
     JMP     @exit
@greate:                            // 1..89
     CMP     EAX, 89
     JG      @next1
     MOV     result, dSE
     JMP     @exit
@next1:                             // 90
     CMP    EAX, 90
     JG     @next2
     MOV    result, &dS
     JMP    @exit
@next2:                            // 91..179
     CMP     EAX, 179
     JG      @next3
     MOV     result, dSW
     JMP     @exit
@next3:                            // 180
     MOV     result, &dW
     JMP     @exit
@lower:                            // -89..-1
     CMP     EAX, -89
     JL      @next4
     MOV     result, dNE
     JMP     @exit
@next4:                             // -90
     CMP     EAX, -90
     JL      @next5
     MOV     result, dN
     JMP     @exit
@next5:                           // -179..-91
     MOV     result, dNW
@exit:
end;

procedure Swap(var p1, p2: cardinal);inline;
begin
  p1 := p1 xor p2;
  p2 := p2 xor p1;
  p1 := p1 xor p2;
end;
   // mode = 0 -- Attack; mode = 1 -- cover
function CellUnderAttack(Cell: PCell; By: TDirection; Mode: byte; var CallBack: TCallBack): boolean;
var d           : TDirection;
    x,y, kx, ky : word;
    dist,i      : word;
    NextCell    : PCell;
    Figure      : PFigure;
    r           : boolean;
begin
  r      := false;
  result := false;
  if Cell = nil then exit;

  for d := dN to dNW do
  begin
     dist := 0; x := Cell.x; y := Cell.y; kx := x; ky := y;

     repeat
        inc(dist);

        for i := 0 to 1 do                  // One cycle for Knight and one for others
        begin
            if i = 0
            then NextCell := GetNextCell(d, kx, ky, true)
            else NextCell := GetNextCell(d, x, y);

            Figure := GetFigureAtCell(NextCell);

            if (Assigned(Figure) and (Figure.Home = By)) then
            begin
              case Figure.FigType of
                  tKing             : r := (i = 1) and (dist = 1);
                  tQueen            : r := (i = 1);
                  tLKnight, tRKnight: r := (i = 0) and (dist = 1);
                  tLRook, tRRook    : r := (i = 1) and (d in [dN, dE, dS, dW]);
                  tLBishop,tRBishop : r := (i = 1) and not(d in [dN, dE, dS, dW]);
                  tPawn :
                      if (i = 1) and
                         (((Figure.Home = dN) and (y < Cell.y)) or
                          ((Figure.Home = dS) and (y > Cell.y))) then
                      begin
                         if mode = 0 then
                              r := (dist = 1) and (Cell.x <> x)
                         else begin
                              if (Cell.x <> x) then
                                r := (dist = 1) and Assigned(GetFigureAtCell(Cell))
                              else
                                r := ((dist = 1) or ((dist = 2) and (Figure.CountMove = 0)));
                        end
                      end
              end;
              if r then
              begin
                  result := true;
                  if Assigned(CallBack) then CallBack(Figure);
                  if not Assigned(CallBack) then exit;         // Withot elseif because we need to exit when CallBack find result
              end;
              r := false;
            end;
        end;
     until (NextCell = nil) or (Figure <> nil);
  end;
end;

function Escape(King: PFigure): boolean;
var d,op: TDirection;
    x,y: word;
    NextCell: PCell;
    F: PFigure;
    c: TCallBack;
begin
    result    := false;
    c  := nil;
    op :=  TDirection(abs(ord(King.Home) + -4));

    for d := dN to dNW do
    begin
        x        := King.Cell.x; y := King.Cell.y;
        NextCell := GetNextCell(d, x, y);
        F        := GetFigureAtCell(NextCell);
        if Assigned(F) and (f.Home = King.Home) then Continue;

        if Assigned(NextCell) then
        begin
            Swap(cardinal(King.Cell), cardinal(NextCell));
            result := not CellUnderAttack(King.Cell, op, 0, c);
            Swap(cardinal(King.Cell), cardinal(NextCell));

            if result then exit;
        end;
    end;
end;

function DefeatThreat(Attacker, King: PFigure): boolean;
var op:TDirection;
    p: TCallBack;
    r: boolean;
begin
   r := false;
   p := procedure (Figure:PFigure)
        var c: TCallBack;
        begin
           c  := nil;
           op := TDirection(abs(ord(King.Home) + -4));

           Swap(cardinal(Figure.Cell), cardinal(Attacker.Cell));
           Attacker.Dead  := true;

           r := not CellUnderAttack(King.Cell, op, 0, c);

           Attacker.Dead  := false;
           Swap(cardinal(Figure.Cell), cardinal(Attacker.Cell));
           if r then p := nil;
        end;

   result := CellUnderAttack(Attacker.Cell, King.Home, 0, p) and r;
end;

function Cover(Attacker, King: PFigure): boolean;
var x,y       : word;
    op,d      : TDirection;
    NextCell  : PCell;
    r         : boolean;
    p         : TCallBack;
begin
  result := false;
  if (Attacker = nil) or (Attacker.FigType in [tLKnight, tRKnight]) then exit;
  r  := false;
  x  := King.Cell.x; y  := King.Cell.y;
  op := TDirection(abs(ord(King.Home) + -4));
  d  := DetectDirection(King.Cell, Attacker.Cell);  // Detect attack direction

  p  := procedure (Figure: PFigure)
        var c: TCallBack;
        begin
            Swap(cardinal(Figure.Cell), cardinal(NextCell));
            c := nil;
            r := not CellUnderAttack(King.Cell, op, 0, c);
            Swap(cardinal(Figure.Cell), cardinal(NextCell));

            if r then p := nil;
        end;

  repeat
          NextCell := GetNextCell(d, x, y);

          result := CellUnderAttack(NextCell, King.Home, 1, p) and r;

  until result or (NextCell = nil) or (NextCell = Attacker.Cell);
end;


function Shakh(King : PFigure): TMoveResult;
var res: boolean;
    op : TDirection;
    p  : TCallBack;
    r  : TMoveResult;

    function Pat(): boolean;
    var i: integer;
        PosibleMoves,t1 : PMove;
    begin
       result := true;
       for i := King.Color * FIG_COUNT to King.Color * FIG_COUNT + 15 do
       begin
           if Figures[i].Dead then Continue;

           t1           := FindAllMoves(Figures[i], false, true);
           PosibleMoves := t1;

           while PosibleMoves <> nil do
           begin
              if not (mCover in PosibleMoves.MoveType) and PosibleMoves.Enabled then
              begin
                  ClearMoves(t1);
                  exit(false)
              end;

              PosibleMoves := PosibleMoves.Next;
           end;
           ClearMoves(t1);
       end;
    end;
begin
     r   := mrProccess;
     op  := TDirection(abs(ord(King.Home) + -4));
     p   := procedure(Figure:PFigure)
            begin
                r    := mrShach;
                res  := Escape(King);
                if not res then res := DefeatThreat(Figure, King);
                if not res then res := Cover(Figure, King);
                if res then p := nil;
            end;

     if CellUnderAttack(King.Cell, op, 0, p) then
     begin
          if not res then exit(mrMat);
     end
     else if Pat() then exit(mrPat);
     result := r;
end;

procedure UnMoveFigure(Move: PMove);
begin
      Move.Figure.Cell    := Move.FromCell;

      if mAttack in Move.MoveType then Move.KCC_Figure.Dead  := false;

      if mUpgrade in Move.MoveType then
      begin
          Move.Figure.FigType := tPawn;
          Move.Figure.ch      := '#';
      end;

           // If King Make Castling, Unmove a Rook too
      if (mCastlingShort in Move.MoveType)
      then Move.KCC_Figure.Cell := GetCell(LINE_LEN - 1, Move.Figure.Cell.y)
      else if (mCastlingLong in Move.MoveType)
      then Move.KCC_Figure.Cell := GetCell(0, Move.Figure.Cell.y);

      dec(Move.Figure.CountMove);
      dec(cntmoves);
end;

function MoveFigure(Move : PMove): TMoveResult;
begin
      result := mrIllegal;

      if (mCover in Move.MoveType) or not Move.Enabled then exit;

      if mAttack in Move.MoveType then Move.KCC_Figure.Dead := true;

      if mUpgrade in Move.MoveType then
      begin
           Move.Figure.ch := '3';
           Move.Figure.FigType := tQueen;
      end;

      Move.Figure.Cell := Move.ToCell;
      inc(Move.Figure.CountMove);

                  // If King Make Castling, Move a Rook too
      if (mCastlingShort in Move.MoveType) then
      begin
          Move.KCC_Figure.Cell := GetCell(Move.ToCell.x - 1, Move.ToCell.y)
      end
      else if (mCastlingLong in Move.MoveType) then
      begin
          Move.KCC_Figure.Cell := GetCell(Move.ToCell.x + 1, Move.ToCell.y)
      end;

      if (Move.Figure.FigType = tPawn) then
      begin
          if (mUpgrade in Move.MoveType) then Move.Figure.FigType := tQueen;

          // If beat the pawn which jumped
          if (Move.FromCell.y - Move.ToCell.y = 0) then
          begin
              if Move.Figure.Home = dN
              then Move.ToCell := GetCell(Move.ToCell.x, Move.ToCell.y + 1)
              else Move.ToCell := GetCell(Move.ToCell.x, Move.ToCell.y - 1);

              Move.Figure.Cell := Move.ToCell;
          end;
      end;
      AppendHistory(Move);
      result := Shakh(Figures[abs(Move.Figure.Color + -1) * FIG_COUNT]);
      inc(cntmoves);
end;

procedure ShowWayFor(Figure : PFigure);
begin
     if Assigned(Figure) then
     begin
         ClearMoves(posible_moves);
         posible_moves := FindAllMoves(Figure, true, true);
     end;
end;

procedure FreeChess();
var i : PCell;
    j : PFigure;
begin
      for i in Field do FreeMem(i);

      for j in Figures do FreeMem(j);

      ClearMoves(posible_moves);
end;

procedure Create_Figures();
var i : integer;
begin
     for i := 0 to FIG_COUNT * 2 - 1 do
     begin
            Figures[i]            := AllocMem(sizeof(TFigure));
            Figures[i].CountMove  := 0;
            Figures[i].Dead       := false;
            Figures[i].id         := i;

            case i of
               00,16 : begin
                          Figures[i].ch      := '7';
                          Figures[i].FigType := tKing;

                          case i of
                              00 : Figures[i].Cell := Field[4,0];
                              16 : Figures[i].Cell := Field[4,7];
                          end;
                       end;
               01,17 : begin
                          Figures[i].ch      := '3';
                          Figures[i].FigType := tQueen;

                          case i of
                              01 : Figures[i].Cell := Field[3,0];
                              17 : Figures[i].Cell := Field[3,7];
                          end;
                       end;
           2,3,18,19 : begin
                          Figures[i].ch     := '/';

                          if i in [2,18]
                          then Figures[i].FigType := tLRook
                          else Figures[i].FigType := tRRook;

                          case i of
                              02 : Figures[i].Cell := Field[0,0];
                              03 : Figures[i].Cell := Field[7,0];
                              18 : Figures[i].Cell := Field[0,7];
                              19 : Figures[i].Cell := Field[7,7];
                          end;
                       end;
           4,5,20,21 : begin
                          Figures[i].ch      := '''';

                          if i in [4,20]
                          then Figures[i].FigType := tLKnight
                          else Figures[i].FigType := tRKnight;

                          case i of
                              04 : Figures[i].Cell := Field[1,0];
                              05 : Figures[i].Cell := Field[6,0];
                              20 : Figures[i].Cell := Field[1,7];
                              21 : Figures[i].Cell := Field[6,7];
                          end;
                       end;
           6,7,22,23 : begin
                          Figures[i].ch     := '+';

                          if i in [6,22]
                          then Figures[i].FigType := tLBishop
                          else Figures[i].FigType := tRBishop;

                          case i of
                              06 : Figures[i].Cell := Field[2,0];
                              07 : Figures[i].Cell := Field[5,0];
                              22 : Figures[i].Cell := Field[2,7];
                              23 : Figures[i].Cell := Field[5,7];
                          end;
                       end;
                else   begin
                          Figures[i].ch      := '#';
                          Figures[i].FigType := tPawn;

                          if i < 16
                          then Figures[i].Cell  := Field[i and 7, 1]
                          else Figures[i].Cell  := Field[i and 7, 6]
                end;
            end;

            if i < FIG_COUNT then
            begin
               Figures[i].Home  := dN;
               Figures[i].Color := 0;
            end
            else begin
               Figures[i].Home  := dS;
               Figures[i].Color := 1;
            end;
     end;
end;

procedure Create_Board(width : integer; Border: integer);
var i,j : word;
    p,m : single;
    l   : boolean;
begin
      p := (Width - border) / LINE_LEN;
      m := border / 2;
      l := true;

      for i := 0 to LINE_LEN - 1 do
      begin
           for j := 0 to LINE_LEN - 1 do
           begin
                 Field[i,j]             := AllocMem(sizeof(TCell));
                 Field[i,j].x           := i;
                 Field[i,j].y           := j;
                 Field[i,j].Rect.X      := i * p + m;
                 Field[i,j].Rect.Y      := j * p + m;
                 Field[i,j].Rect.Width  := p;
                 Field[i,j].Rect.Height := p;

                 case l of
                     false : if odd(j) then
                                 Field[i, j].Color := aclWhite
                             else
                                 Field[i, j].Color := aclBlack;

                     true  : if odd(j) then
                                 Field[i, j].Color := aclBlack
                             else
                                 Field[i, j].Color := aclWhite;
                 end;
           end;
           l := not l;
      end;
end;

procedure CreateChess(Width: integer);
begin
      FreeChess;
      cntmoves := 0;

      is_reverse := false;

      SetLength(move_history, 100);
      ihis := 0;

      Create_Board(Width, 40);
      Create_Figures();
end;

procedure DrawArrow(Canvas: THandle);
var Gr : TGPGraphics;
    Pen : TGPPen;
    SB : TGPSolidBrush;
    d: TDirection;
    Last: TMoveHistory;
    FR,TR: TGPRectF;
    CF,CT: PCell;
    Arrow: array[0..4] of TGPPointF;
    c: TGPColor;

      procedure Rotate(angle: single; PArrow:pointer);
      const q:single = 180;
      asm
             {ALGORITHM:
             angle := angle * pi / 180;
             for i := 1 to 4 do
             begin
                  len := Sqrt(sqr(points[i].X - points[0].X) + sqr(points[i].Y - points[0].Y));
                  at  := ArcTan2(points[i].Y - points[0].Y, points[i].X - points[0].X);
                  SinCos(angle + at, s, c);
                  points[i].X := points[0].X + len * c;
                  points[i].Y := points[0].Y + len * s;
             end; }
          FLDPI
          FMUL    angle
          FDIV    q
          MOV     ECX, 4
        @loop:
          FLD     dword ptr [EAX + ECX * 8]    // x
          FSUB    dword ptr [EAX]
          FMUL    st(0), st(0)
          FLD     dword ptr [EAX + ECX * 8 + $04]   // y
          FSUB    dword ptr [EAX + $04]
          FMUL    st(0), st(0)
          FADDP
          FSQRT
          FLD     dword ptr [EAX + ECX * 8 + $04]
          FSUB    dword ptr [EAX + $04]
          FLD     dword ptr [EAX + ECX * 8]
          FSUB    dword ptr [EAX]
          FPATAN
          FADD    st(0), st(2)
          FSINCOS  // st 0 - cos; st 1 - sin  st 2 len
          FMUL    st(0), st(2)
          FXCH
          FMUL    st(0), st(2)
          FXCH
          FADD    dword ptr [EAX]
          FXCH
          FADD    dword ptr [EAX + $04]
          FSTP    dword ptr [EAX + ECX * 8 + $04]
          FSTP    dword ptr [EAX + ECX * 8]
          FXCH
          FFREE   st(1)
          DEC     ECX
          JNZ     @loop;
          FFREE   st(0)
      end;

      procedure CreateDefaultArrow(FromRect, ToRect, PArrow: pointer);
      var t: single;
      const adx:single = 8;
            ady:single = 10;
            two: single = 2;
      asm
          FLD     dword ptr [EAX + 8]
          FDIV    two
          FSTP    t
                   // length
          FLD     dword ptr [EDX]
          FSUB    dword ptr [EAX]
          FMUL    st(0), st(0)
          FLD     dword ptr [EDX + 4]
          FSUB    dword ptr [EAX + 4]
          FMUL    st(0), st(0)
          FADD
          FSQRT
          FSUB    t
// point 0           Arrow[0] := MakePoint(FR.X + FR.Width / 2, FR.Y + FR.Height / 2);
          FLD     dword ptr [EAX + 4]      // y
          FADD    t
          FLD     dword ptr [EAX]          // x
          FADD    t
          FSTP     dword ptr [ECX]
          FSTP     dword ptr [ECX + 4]
// point 1         Arrow[1] := MakePoint(Arrow[0].X - len, Arrow[0].Y);
          FSUBR    dword ptr [ECX]         // x
          FLD      dword ptr [ECX + 4]     // y
          FSTP     dword ptr [ECX + 8 + 4]
          FST      dword ptr [ECX + 8]
// point 2         Arrow[2] := MakePoint(Arrow[1].X - ay, Arrow[1].Y);
          FSUB     adx                         // x
          FSUB     adx
          FLD      dword ptr [ECX + 8 + 4]    // y
          FSTP     dword ptr [ECX + 16 + 4]
          FSTP     dword ptr [ECX + 16]
// point 3         Arrow[3] := MakePoint(Arrow[1].X + ax, Arrow[1].Y - ay);
          FLD      dword ptr [ECX + 8]
          FLD      dword ptr [ECX + 8 + 4]
          FSUB     ady
          FSTP     dword ptr [ECX + 24 + 4]
          FSTP     dword ptr [ECX + 24]
//  point 4        Arrow[4] := MakePoint(Arrow[1].X + ax, Arrow[1].Y + ay);
          FLD      dword ptr [ECX + 8]
          FLD      dword ptr [ECX + 8 + 4]
          FADD     ady
          FSTP     dword ptr [ECX + 32 + 4]
          FSTP     dword ptr [ECX + 32]
      end;
begin
    if ihis = 0 then exit;
    c   := cardinal(200 shl 24) or $000000FF;// MakeColor(200, 0, 0, 255);
    Gr  := TGPGraphics.Create(Canvas);
    Pen := TGPPen.Create(c, 3);
    SB  := TGPSolidBrush.Create(c);
    Gr.SetSmoothingMode(SmoothingModeHighQuality);

    Last := Prev();
    with Last.Move do
    if (Last.Reverse xor is_reverse) then
    begin
        CF := GetCell(FromCell.x, Mirror[FromCell.y]);
        CT := GetCell(ToCell.x, Mirror[ToCell.y]);
        d  := DetectDirection(CF, CT);
        FR := CF.Rect;
        TR := CT.Rect;
    end
    else begin
        d  := DetectDirection(FromCell, ToCell);
        FR := FromCell.Rect;
        TR := ToCell.Rect;
    end;

    CreateDefaultArrow(@FR, @TR, @Arrow[0]);

    with Last.Move.Figure^ do
    case d of
      dN  : Rotate(90, @Arrow[0]);

      dNE : if FigType in [tLKnight, tRKnight] then
            begin
                if abs(Last.Move.FromCell.x - Last.Move.ToCell.x) = 2
                then Rotate(150, @Arrow[0])
                else Rotate(120, @Arrow[0])
            end
            else Rotate(135, @Arrow[0]);

      dE  : Rotate(180, @Arrow[0]);

      dSE : if FigType in [tLKnight, tRKnight] then
            begin
                if abs(Last.Move.FromCell.x - Last.Move.ToCell.x) = 2
                then Rotate(210, @Arrow[0])
                else Rotate(240, @Arrow[0])
            end
            else Rotate(225, @Arrow[0]);

      dS  : Rotate(270, @Arrow[0]);

      dSW : if FigType in [tLKnight, tRKnight] then
            begin
                if abs(Last.Move.FromCell.x - Last.Move.ToCell.x) = 2
                then Rotate(330, @Arrow[0])
                else Rotate(300, @Arrow[0])
            end
            else Rotate(315, @Arrow[0]);

      dW  : ;

      dNW : if FigType in [tLKnight, tRKnight] then
            begin
                if abs(Last.move.FromCell.x - Last.Move.ToCell.x) = 2
                then Rotate(25, @Arrow[0])
                else Rotate(60, @Arrow[0])
            end
            else Rotate(45, @Arrow[0]);

    end;
    Gr.DrawLine(Pen, Arrow[0], Arrow[1]);
    Gr.FillPolygon(SB, PGPPointF(@Arrow[2]), 3);

    SB.Free;
    Pen.Free;
    Gr.Free;
end;

procedure DrawCells(Canvas: THandle; PosibleMoves: PMove);
var Gr: TGPGraphics;
    Pen: TGPPen;
    Node : PMove;
    FigureAtCell : PFigure;
begin
    Gr := TGPGraphics.Create(Canvas);
    Pen := TGPPen.Create(aclRed, 2);

    Node     := PosibleMoves;

    while Node <> nil do
    begin
        FigureAtCell := GetFigureAtCell(Node.ToCell);

        if Node.Enabled then
        begin
            if Assigned(FigureAtCell) and (FigureAtCell.Home = Node.Figure.Home)
            then Pen.SetColor(aclGreen)
            else Pen.SetColor(aclRed);

            Gr.DrawRectangle(Pen, Node.ToCell.Rect);
        end;

        Node := Node.Next;
    end;

    if Assigned(choosen_figure) then
    begin
        Pen.SetColor(aclRed);
        Pen.SetWidth(2.5);
        Gr.DrawRectangle(Pen, choosen_figure.Cell.Rect);
    end;

    if Assigned(selected_cell) then
    begin
         Pen.SetColor(aclAqua);
         Gr.DrawRectangle(Pen, selected_cell.Rect);
    end;

    Pen.Free;
    Gr.Free;
end;

procedure RenderFigures(Canvas: THandle);
var i : PFigure;
    Gr: TGPGraphics;
    SB: TGPSolidBrush;
    Point: TGPPointF;
    FISDiagram : TGPFont;
begin
    Gr := TGPGraphics.Create(Canvas);
    SB := TGPSolidBrush.Create(aclWhite);
    FISDiagram := TGPFont.Create('ISDiagram', 32, 1);
    Gr.SetSmoothingMode(SmoothingModeHighQuality);

    for i in Figures do
    begin
       if i.Dead then Continue;

       SB.SetColor(Colors[i.Color]);
       Point.X := i.Cell.Rect.X;
       Point.Y := i.Cell.Rect.Y + 5;


       case i.FigType of
            tPawn              : Gr.DrawString(Char(i.ch), -1, FISDiagram, Point, SB);
            tLKnight, tRKnight : Gr.DrawString(Char(i.ch), -1, FISDiagram, Point, SB);
            tLBishop, tRBishop : Gr.DrawString(Char(i.ch), -1, FISDiagram, Point, SB);
            tLRook, tRRook     : Gr.DrawString(Char(i.ch), -1, FISDiagram, Point, SB);
            tQueen             : Gr.DrawString(Char(i.ch), -1, FISDiagram, Point, SB);
            tKing              : Gr.DrawString(Char(i.ch), -1, FISDiagram, Point, SB);
       end;
    end;

    FISDiagram.Free;
    SB.Free;
    Gr.Free;
end;

function InverseColor(Color:TGPColor):TGPColor;
begin
      case Color of
          aclWhite: result := aclBlack;
          aclBlack: result := aclWhite;
          else result := Color;
      end;
end;

procedure Render_Board(Canvas: THandle);
var i,j  : word;
    Cell: PCell;
    Gr: TGPGraphics;
    SB: TGPSolidBrush;
    GB: TGPLinearGradientBrush;
    Point: TGPPointF;
    FCourier   : TGPFont;
begin
    Gr       := TGPGraphics.Create(Canvas);
    SB       := TGPSolidBrush.Create(aclWhite);
    GB       := TGPLinearGradientBrush.Create(pic_rect, aclPeru, aclBurlyWood, 4);
    FCourier := TGPFont.Create('Courier New', 12, 1);
    Gr.FillRectangle(GB, pic_rect);
    Gr.SetSmoothingMode(SmoothingModeHighQuality);

    for i := 0 to LINE_LEN - 1 do
    begin
        for j := 0 to LINE_LEN - 1 do
        begin
             Cell := GetCell(i,j);

             if is_reverse
             then SB.SetColor(InverseColor(Cell.Color))
             else SB.SetColor(Cell.Color);

             Gr.FillRectangle(SB, Cell.Rect);

             if i = 0 then
             begin
                Point.Y := Cell.Rect.Y + (Cell.Rect.Width / 2.5);
                Point.X := 0;
                SB.SetColor(aclBlack);

                if is_reverse
                then Gr.DrawString(WideString(IntToStr(j + 1)), -1, FCourier, Point, SB)
                else Gr.DrawString(WideString(IntToStr(LINE_LEN - j)), -1, FCourier, Point, SB);
             end;
        end;

        SB.SetColor(aclBlack);
        Point.Y := Cell.Rect.Y + Cell.Rect.Height;
        Point.X := Cell.Rect.X + (Cell.Rect.Width / 2.5);

        Gr.DrawString(WideString(chr(ord('a') + i)), -1, FCourier, Point, SB);
    end;

    FCourier.Free;
    GB.Free;
    SB.Free;
    Gr.Free
end;

procedure Render_Scene(width: integer);
begin
    Pic.Bitmap.Width  := width;
    Pic.Bitmap.Height := Width;

    pic_rect.X := 0; pic_rect.Y := 0;
    pic_rect.Width := width; pic_rect.Height := width;

    with Pic.Bitmap.Canvas do
    begin
        Render_Board(Handle);
        RenderFigures(Handle);
        DrawCells(Handle, posible_moves);
        DrawArrow(Handle);
    end;
   // Pic.Bitmap.SaveToFile('R:\Messanger\Win32\Debug\bm.bmp');
end;

procedure StopGame();
begin
    Pic.Free;
    FreeChess();
end;

initialization
   Pic := TPicture.Create;

   Player1.Name        := 'First';
   Player1.Color       := 1;
   Player1.Active      := true;

   Player2.Name        := 'Second';
   Player2.Color       := 0;
   Player2.Active      := false;

end.

