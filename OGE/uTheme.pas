unit uTheme;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, uGlobal;

type
  TfrmTheme = class(TForm)
    Panel3: TPanel;
    lkNums: TLinkLabel;
    Panel5: TPanel;
    ScrollBox: TScrollBox;
    imgTheme: TImage;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure lkNumsClick(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
    { Private declarations }
    page:integer;
    themeFile: string;
    procedure LoadTheme(theme: TTheme);
  public
    { Public declarations }
    procedure showThemes();
  end;

implementation
uses jpeg;

{$R *.dfm}

{ TfrmTheme }

procedure TfrmTheme.lkNumsClick(Sender: TObject);
begin
    LoadTheme(TH_NUMS);
end;

procedure TfrmTheme.LoadTheme(theme: TTheme);
var jpg: TJpegImage;
begin
    if theme = TH_NUMS then
    begin
         page := 1;
         themeFile := format('%sTheme\%s\%d.jpg',
              [ExtractFilePath(Application.ExeName), TH_NUMS_DIR, page]);

         jpg := TJpegImage.Create;
         jpg.LoadFromFile(themeFile);
         imgTheme.Picture.Bitmap.Assign(jpg);
         jpg.Free;
         ScrollBox.VertScrollBar.Range := imgTheme.Picture.Bitmap.Height;
    end;
end;

procedure TfrmTheme.showThemes;
begin
    page := 1;
    show;
end;

procedure TfrmTheme.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
    with scrollBox.VertScrollBar do
    begin
        if (wheelDelta < 0) and (position < range)
        then position := position + increment
        else if (position > 0) then position := position - increment
    end;with scrollBox.VertScrollBar do
    begin
        if (wheelDelta < 0) and (position < range)
        then position := position + increment
        else if (position > 0) then position := position - increment
    end;
end;

end.
