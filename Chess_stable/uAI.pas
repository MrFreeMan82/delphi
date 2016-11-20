unit uAI;

interface
uses SysUtils, Core;

function Search(color:byte; out bestMove: TMove): integer;

implementation
const INF = 10000;
var
   WF : array[TFigType] of integer = (100, 300, 300, 300, 300, 500, 500, 900, INF);

   King  : array[0..63] of SmallInt = (0,   0,   -4,  -10, -10, -4,  0,   0,
                                       -4,  -4,  -8,  -12, -12, -8,  -4,  0,
                                       -12, -16, -20, -20, -20, -20, -16, -12,
                                       -16, -20, -24, -24, -24, -24, -20, -24,
                                       -16, -20, -24, -24, -24, -24, -20, -24,
                                       -12, -16, -20, -20, -20, -20, -16, -12,
                                       -4,  -4,  -8,  -12, -12, -8,  -4,  0,
                                       0,   0,   -4,  -10, -10, -4,  0,   0);

   BPawn : array[0..63] of smallint = (0,  0,  0,  0,  0,  0,  0,  0,
                                       4,  4,  4,  0,  0,  4,  4,  4,
                                       6,  8,  2,  10, 10, 2,  8,  6,
                                       6,  8,  12, 16, 16, 12, 8,  6,
                                       8,  12, 16, 24, 24, 16, 12, 8,
                                       12, 16, 24, 32, 32, 24, 16, 12,
                                       12, 16, 24, 32, 32, 24, 16, 12,
                                       0,  0,  0,  0,  0,  0,  0,  0);

   WPawn: array[0..63] of SmallInt = (0,  0,  0,  0,  0,  0,  0,  0,
                                      12, 16, 24, 32, 32, 24, 16, 12,
                                      12, 16, 24, 32, 32, 24, 16, 12,
                                      8,  12, 16, 24, 24, 16, 12, 8,
                                      6,  8,  12, 16, 16, 12, 8,  6,
                                      6,  8,  2,  10, 10, 2,  8,  6,
                                      4,  4,  4,  0,  0,  4,  4,  4,
                                      0,  0,  0,  0,  0,  0,  0,  0);

   Knight : array[0..63] of SmallInt = (0,  4,  8,  10, 10, 8,  4,  0,
                                        4,  6,  16, 20, 20, 16, 8,  4,
                                        8,  16, 24, 28, 28, 24, 16, 8,
                                        10, 20, 28, 32, 32, 28, 20, 10,
                                        10, 20, 28, 32, 32, 28, 20, 10,
                                        8,  16, 24, 28, 28, 24, 16, 8,
                                        4,  6,  16, 20, 20, 16, 8,  4,
                                        0,  4,  8,  10, 10, 8,  4,  0);

   Bishop : array[0..63] of SmallInt = (14, 14, 14, 14, 14, 14, 14, 14,
                                        14, 22, 18, 18, 18, 18, 22, 14,
                                        14, 18, 22, 22, 22, 22, 18, 14,
                                        14, 18, 22, 22, 22, 22, 18, 14,
                                        14, 18, 22, 22, 22, 22, 18, 14,
                                        14, 18, 22, 22, 22, 22, 18, 14,
                                        14, 22, 18, 18, 18, 18, 22, 14,
                                        14, 14, 14, 14, 14, 14, 14, 14);


function EvalPosition(CurrentMove: PMove): integer;
var i,w,b: integer;
    f: PFigure;
    c: TCallBack;
begin
   w := 0; b := 0; c:= nil;

   for i := 0 to FIG_COUNT * 2 - 1 do
   begin
     f := GetFigure(i);
     if i < FIG_COUNT then
     begin
         b := b + WF[f.FigType];

         case f.FigType of
              tPawn              : b := b + BPawn[f.Cell.x + (f.Cell.y * 8)];
              tLKnight, tRKnight : b := b + Knight[f.Cell.x + (f.Cell.y * 8)];
              tLRook, tRRook     : ;
              tLBishop, tRBishop : b := b + Bishop[f.Cell.x + (f.Cell.y * 8)];
              tQueen             : ;
              tKing              : b := b + King[f.Cell.x + (f.Cell.y * 8)];
         end;

         if mAttack in CurrentMove.MoveType then
         begin

             b := b + WF[CurrentMove.KCC_Figure.FigType];
             if CellUnderattack(CurrentMove.KCC_Figure.Cell, CurrentMove.KCC_Figure.Home, 0, c)
             then b := b - WF[f.FigType]
         end;

                 // If figure is not under then cover
         if not CellUnderAttack(f.Cell, f.Home, 0, c) then b := b - WF[f.FigType];
     end
     else begin
         w := w + WF[f.FigType];

         case f.FigType of
              tPawn              : w := w + WPawn[f.Cell.x + (f.Cell.y * 8)];
              tLKnight, tRKnight : w := w + Knight[f.Cell.x + (f.Cell.y * 8)];
              tLRook, tRRook     : ;
              tLBishop, tRBishop : w := w + Bishop[f.Cell.x + (f.Cell.y * 8)];
              tQueen             : ;
              tKing              : w := w + King[f.Cell.x + (f.Cell.y * 8)];
         end;

         if mAttack in CurrentMove.MoveType then
         begin

             b := b + WF[CurrentMove.KCC_Figure.FigType];
             if CellUnderattack(CurrentMove.KCC_Figure.Cell, CurrentMove.KCC_Figure.Home, 0, c)
             then b := b - WF[f.FigType]
         end;
                 // If figure is not under then cover
         if not CellUnderAttack(f.Cell, f.Home, 0, c) then b := b - WF[f.FigType];
     end
   end;

   result := b - w;
end;

function Search(color:byte; out bestMove: TMove): integer;
var tmp: integer;
    PosMove,t1: PMove;
begin
   Result := -1000000;

   PosMove := FindAllMoves(color);
   t1      := PosMove;

   while PosMove <> nil do
   begin
       if not (mCover in PosMove.MoveType) and PosMove.Enabled then
       begin
           MoveFigure(PosMove);
           tmp := EvalPosition(PosMove);
           UnMoveFigure(PosMove);

           if (tmp > Result) then
           begin
               Result := tmp;
               bestMove := PosMove^;
           end;
       end;

       PosMove := PosMove.Next;
   end;

   ClearMoves(t1);
end;
end.
