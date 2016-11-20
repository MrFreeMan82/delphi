unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,Tetris, StdCtrls, AppEvnts, Menus;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Panel1: TPanel;
    lblScore: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    Panel2: TPanel;
    Label2: TLabel;
    Panel3: TPanel;
    lblLevel: TLabel;
    Label4: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Play();
    procedure UpdateScore(score : integer);
    procedure UpdateLevel(level : integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  T : TTetraMino;
  Rect : Trect;
  OldLevel : integer = 1;
  oldScore : integer = 0;

implementation

{$R *.dfm}

procedure TForm1.Play();
begin
     try
          t := CreateTetramino;
          Render(Image1.Picture.Bitmap,t);
          Timer1.Enabled := true;
     except
             on TWin do ShowMessage('У вас невероятная реакция!!! Вы выиграли!');

             on TGameOver do showmessage('GAME OVER');
     end;
end;

procedure TForm1.UpdateScore(Score:integer);
var i,cnt : integer;
    sc,res : string;
begin
    if oldScore <> Score then
    begin
        res := '';
        sc := IntToStr(score);
        cnt := length(lblScore.Caption) - length(sc);
        for i := 1 to cnt do res := res + '0';
        lblScore.Caption := res + sc;
        oldScore := Score;
    end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   if not Pause and Timer1.Enabled and MoveDown(t)then
   begin
         Render(Image1.Picture.Bitmap,t);
   end
   else if not Pause then
   begin
        Timer1.Enabled := false;
        RefreshScore();
        UpdateScore(Tetris.Score);
        UpdateLevel(Tetris.level);
        Play;
   end;
end;

procedure TForm1.UpdateLevel(level : integer);
begin
   if OldLevel <> Level then
   begin
     lblLevel.Caption := IntToStr(level);
     Timer1.Interval := Timer1.Interval - 50;
     OldLevel := level;
   end;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if GameOver then exit;

        case Key of
            39 :  if not Pause then
                  begin
                            MoveRight(T);
                            Render(Image1.Picture.Bitmap,t);
                  end;
            37 :  if not Pause then
                  begin
                            MoveLeft(T);
                            Render(Image1.Picture.Bitmap,t);
                  end;
            38 :  if not Pause then
                  begin
                            Rotate(T);  // R - Key
                            Render(Image1.Picture.Bitmap,t);
                  end;
            40 :  Timer1Timer(Sender);

            80 :  begin
                      Pause := not Pause;

                      if Pause then
                      begin
                          Image1.Canvas.TextOut(0,0,'PAUSE');
                      end
                      else begin
                          Image1.Canvas.Brush.Color := clWhite;
                          Image1.Canvas.FillRect(rect);
                      end;
                  end;

        end;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
     Image1.Picture.Bitmap.FreeImage;
     Image1.Picture.Bitmap.Width := Image1.Width;
     Image1.Picture.Bitmap.Height := Image1.Height;
     Image1.Canvas.Font.Size := 16;
     rect.Left    := 0;
     rect.Top     := 0;
     rect.Right   := 150;
     rect.Bottom  := 30;
     Init();
     Play();
//     showMessage(IntToStr(sizeof(TColor)))
end;

end.
