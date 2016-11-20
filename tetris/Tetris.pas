unit Tetris;

interface
uses SysUtils,Graphics,types,TetraMinos;

type TWin = class(Exception);
type TGameOver = class(Exception);

type TCube = record
    X,Y : byte;
end;

type
  TTetraMino = record
    Head : TCube;
    Body : array [0..3] of TCube;
    TetraMinoInfo : integer;
end;

const MAX_ROWS = 20;
      MAX_COLS = 15;

var
   GameOver   : boolean = false;
   Pause      : boolean = false;
   Score      : integer = 0;
   level      : integer = 1;

procedure Init();
function CreateTetramino():TTetraMino;
function DeleteLine:integer;
function MoveDown(var TetraMino : TTetraMino):boolean;
procedure MoveRight(var TetraMino : TTetraMino);
procedure MoveLeft(var TetraMino : TTetraMino);
procedure Rotate(var TetraMino : TTetraMino);    // ClockWise
procedure Render(BitMap : TBitmap;const Tetramino : TTetraMino);
procedure RefreshScore();

implementation

var
   Field      : array[0..MAX_ROWS - 1,0..MAX_COLS - 1] of integer;
   Colors     : array[0..8] of TColor = (clWhite,clRed,clBlue,clGreen,clAqua,clFuchsia,clYellow,clPurple,clTeal);

procedure SetHeadPoint(var TetraMino : TTetraMino);
var i,X,Y : integer;
begin
     X := MAX_COLS;
     Y := MAX_ROWS;

     for i := 0 to 3 do
     begin
            if (TetraMino.Body[i].X < X) then X := TetraMino.Body[i].X;
            if (TetraMino.Body[i].Y < Y) then Y := Tetramino.Body[i].Y;
     end;

     TetraMino.Head.X := X;
     TetraMino.Head.Y := Y;
end;

procedure Init();
begin
     Randomize;
     GameOver := false;
     Pause    := false;
     FillChar(Field,sizeof(Field),0);
end;

function CreateTetramino():TTetraMino;
var i,j,t,position : integer;
    ProtoType : TMino;
    tpinfo : integer;
    tp : TTetraMinoType;
    angle : TAngle;
begin
     tp    := TTetraMinoType(Random(ord(high(TTetraMinoType)) + 1));
     angle := TAngle(Random(ord(high(TAngle))));

     tpinfo := (Random(8) + 1) shl $08;     // Color
     tpinfo := (tpinfo + byte(tp)) shl $08 ;    // Type
     tpinfo := tpinfo + byte(angle);    // Angle

     result.TetraMinoInfo := tpinfo;

     ProtoType := CreatePrototype(tp,angle);

     position := Random(MAX_COLS - 3);

     t := 0;
     for i := 0 to 3 do
     begin
         for j := 0 to 3 do
         if (Prototype[i,j] > 0) then
         begin
                    if Field[i,j + position] > 0 then
                    begin
                        GameOver := true;
                        raise TGameOver.Create('');
                    end;

                    Field[i,j + position] := result.TetraMinoInfo;
                    result.Body[t].X := j + position;
                    result.Body[t].Y := i;
                    inc(t);
         end;
     end;
     SetHeadPoint(result)
end;

procedure PutTetraminoToField(const Tetramino : TTetraMino);
var k : integer;
begin
     for k := 0 to 3 do
          Field[Tetramino.Body[k].Y,Tetramino.Body[k].X] := TetraMino.TetraMinoInfo;
end;


function FindRowWith_MAX_COLS():integer;
var i,j,cnt : integer;
begin
      result := -1;
      for i := MAX_ROWS - 1 downto 0 do
      begin
            cnt := 0;
            for j := MAX_COLS - 1 downto 0 do
            begin
                 if (Field[i,j] > 0) then inc(cnt);
                 if (cnt = MAX_COLS) then exit(i);
            end
      end;
end;


function DeleteLine:integer;
var i,j,row : integer;
begin
      result := 0;
      row    := FindRowWith_MAX_COLS();
      if (row >= 0) then
      begin
            inc(result);

            for j := 0 to MAX_COLS - 1 do
                for i := row - 1 downto 0 do
                       Field[i + 1,j] := Field[i,j];

            result := result + DeleteLine;
      end;
end;

procedure RefreshScore();
var totallines : integer;

begin
    totalLines := DeleteLine();

    if totalLines > 0 then
    begin
         case totallines of
            1: score := score + totallines * 10;
            2: score := score + totallines * 25;
            3: score := score + totallines * 45;
            4: score := score + totallines * 50;
         end;

         if (score > 1000) and (level = 1) then
         begin
             inc(level)
         end
         else if (score > 2000) and (level = 2) then
         begin
             inc(level);
         end
         else if (score > 3000) and (level = 3) then
         begin
            inc(level)
         end
         else if (score > 5000) then
         begin
             raise Twin.Create('');
         end;
    end;
end;

procedure ClearLast(const TetraMino : TTetraMino);
var k: integer;
begin
      for k := 0 to 3 do
           Field[Tetramino.Body[k].Y,Tetramino.Body[k].X] := 0;
end;

function MoveDown(var TetraMino : TTetraMino):boolean;
var k : integer;
begin
     result := true;
     ClearLast(TetraMino);
     with TetraMino do
     begin
          for k := 0 to 3 do
          if (Body[k].Y = MAX_ROWS - 1) or
             (Field[Body[k].Y + 1, Body[k].X] > 0) then
          begin
                result := false;
                PutTetraminoToField(Tetramino);
                exit
          end;
          for k := 0 to 3 do inc(Body[k].Y);
          SetHeadPoint(TetraMino);
          PutTetraminoToField(Tetramino);
     end;
end;

procedure MoveRight(var TetraMino : TTetraMino);
var k : integer;
begin
      ClearLast(TetraMino);
      with TetraMino do
      begin
            for k := 0 to 3 do
            if (Body[k].X = MAX_COLS - 1) or
               (Field[Body[k].Y, Body[k].X + 1] > 0) then
            begin
                  PutTetraminoToField(Tetramino);
                  exit;
            end;
            for k := 0 to 3 do inc(Body[k].X);
            SetHeadPoint(TetraMino);
            PutTetraminoToField(Tetramino);
      end;
end;

procedure MoveLeft(var TetraMino : TTetraMino);
var k : integer;
begin
      ClearLast(TetraMino);
      with TetraMino do
      begin
            for k := 0 to 3 do
            if (Body[k].X = 0) or
               (Field[Body[k].Y, Body[k].X - 1] > 0) then
            begin
                 PutTetraminoToField(Tetramino);
                 exit;
            end;

            for k := 0 to 3 do dec(Body[k].X);
            SetHeadPoint(TetraMino);
            PutTetraminoToField(Tetramino);
      end;
end;

function EnableRotate(const TetraMino:TTetraMino;const Prototype : TMino): boolean;
var i,j : integer;
    tp : TTetraminoType;
    x,y : integer;
begin
     result := true;
     tp     := TTetraMinoType(lo(word(Tetramino.TetraMinoInfo shr $08)));
     if (tp = tSQ) then exit(false);

     x := Tetramino.Head.X;
     y := Tetramino.Head.Y;

     for i := 0 to 3 do
     begin
           for j := 0 to 3 do
           begin
                if (Prototype[i,j] > 0) and
                   ((Field[i + Y,j + X] > 0) or
                    (j + X > MAX_COLS - 1) or
                    (i + Y > MAX_ROWS - 1)) then exit(false);
           end;
     end;
end;

procedure Rotation(var TetraMino : TTetraMino;const ProtoType : TMino);
var i,j,k : integer;
begin
     k := 0;
     for i := 0 to 3 do
     begin
          for j := 0 to 3 do
          begin
               if (Prototype[i,j] > 0) then
               with TetraMino do
               begin
                    Field[i + Head.Y, j + Head.X] := TetraMinoInfo;
                    Body[k].X := j + Head.X;
                    Body[k].Y := i + Head.Y;
                    inc(k)
               end;
          end;
     end;
end;

procedure Rotate(var TetraMino : TTetraMino);    // ClockWise
var Prototype : Tmino;
    OldAngle,NewAngle : TAngle;
    tp  : TTetraminoType;
begin
     tp        := TTetraMinoType(lo(word(Tetramino.TetraMinoInfo shr $08)));
     OldAngle  := TAngle(lo(word(Tetramino.TetraMinoInfo)));
     NewAngle  := GetNewAngle(tp,OldAngle);

     Prototype := CreatePrototype(tp,NewAngle);

     ClearLast(Tetramino);
              // Verify
     if EnableRotate(TetraMino,Prototype) then
     begin
          Tetramino.TetraMinoInfo := Tetramino.TetraMinoInfo - ord(Oldangle) + ord(NewAngle);
          Rotation(Tetramino,Prototype);
          SetHeadPoint(TetraMino);
     end
     else begin
          PutTetraminoToField(Tetramino);
     end;
end;

procedure Render(BitMap : TBitmap;const Tetramino : TTetraMino);
var i,j : integer;
    rect : TRect;
    w,h : integer;
    k : integer;
begin
     w := Bitmap.Width;
     h := Bitmap.Height;
     rect.Left    := 0;
     rect.Top     := 0;
     rect.Right   := w;
     rect.Bottom  := h;
     BitMap.Canvas.Brush.Color := Colors[0];
     BitMap.Canvas.FillRect(rect);

     for i := 0 to MAX_ROWS - 1 do
          for j := 0 to MAX_COLS - 1 do
          begin
                if (Field[i,j] > 0) then
                with Bitmap.Canvas do
                begin
                      rect.Left   := (j * w div MAX_COLS) + 2;
                      rect.Top    := (i * h div MAX_ROWS) + 2;
                      rect.Right  := (rect.Left + MAX_COLS) - 2;
                      rect.Bottom := (rect.Top + MAX_ROWS) - 2;

                      Brush.Color := Colors[Field[i,j] shr $10];
                      k := 0;
                      Pen.Color := clBlack;
                      Pen.Width := 2;
                      if k = 0 then
                      begin
                            FillRect(rect);
                            MoveTo(rect.Left,rect.Top);
                            LineTo(rect.Left,rect.Bottom);
                            MoveTo(rect.Left,rect.Bottom);
                            LineTo(rect.Right,rect.Bottom);
                      end
                      else begin
                           Bitmap.Canvas.Ellipse(Rect);
                      end;
                end
          end;
end;

end.
