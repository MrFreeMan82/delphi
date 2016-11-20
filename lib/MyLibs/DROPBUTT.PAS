unit DropButt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NewButt, Menus;

type
  TMenuItemA = class(TMenuItem)
    public
      Clicked:boolean;
      ButtStr:string;
      procedure Click; override;
  end;
  TDropButt = class(TButt)
  private
    FDropMenu:TPopupMenu;
    FBlackArrow:boolean;
    ArrowStart:ShortInt;
    procedure SetBlackArrow(Value:boolean);
    { Private declarations }
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
                        X, Y: Integer); override;
    procedure Paint; override;
    { Protected declarations }
  public
    constructor Create(AOwner:TComponent); override;
    { Public declarations }
  published
    property DropMenu:TPopupMenu read FDropMenu write FDropMenu;
    property BlackArrow:boolean read FBlackArrow write SetBlackArrow;
  end;

procedure Register;

implementation

procedure TMenuItemA.Click;
begin
//  Tag:=Tag+3333;
  Clicked:=True;
  inherited;
end;

constructor TDropButt.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  GroupIndex:=1;
  AllowAllUp:=True;
end;

procedure TDropButt.MouseDown(Button: TMouseButton; Shift: TShiftState;
                              X, Y: Integer);
label endd;
var
  PPP:TPoint;
  i,j:word;
  it:TMenuItemA;
begin
  If (FDropMenu<>nil)and(ssLeft in Shift) then
  begin
    PPP.X:=-1;
    PPP.Y:=Height;
    PPP:=ClientToScreen(PPP);
    Down:=True;
    Repaint;
    FDropMenu.Popup(PPP.X,PPP.Y);

    Application.ProcessMessages;
    for i:=1 to DropMenu.Items.Count do
      if (DropMenu.Items[i-1] is TMenuItemA)and
         ((DropMenu.Items[i-1] as TMenuItemA).Clicked) then
      begin
        it:=(DropMenu.Items[i-1] as TMenuItemA);

        if it.Count>0 then
        begin
          for j:=1 to it.Count do
            if (it.Items[j-1] is TMenuItemA)and
              ((it.Items[j-1] as TMenuItemA).Clicked) then
              begin
                if (it.Items[j-1] as TMenuItemA).ButtStr='' then
                  Caption:=(it.Items[j-1] as TMenuItemA).Caption
                else
                  Caption:=(it.Items[j-1] as TMenuItemA).ButtStr;
                Tag:=(it.Items[j-1] as TMenuItemA).Tag;
                (it.Items[j-1] as TMenuItemA).Clicked:=False;
                goto endd;
              end;
        end
        else
        begin
          if it.ButtStr='' then
            Caption:=it.Caption
          else
            Caption:=it.ButtStr;
          Tag:=it.Tag;
          it.Clicked:=False;
          break;
        end;
      end;
    endd:
    Down:=False;
    Repaint;
  end;
end;

procedure TDropButt.Paint;
var
  d:byte;
begin
  with Canvas do
  begin
    inherited Paint;

    If FBlackArrow then
    Begin
      if Down then d:=1
        else d:=0;

      Pen.Color:=clBlack;

      Pixels[Width-8+d,2+d]:=clBlack;
      Pixels[Width-7+d,2+d]:=clBlack;
      Pixels[Width-6+d,2+d]:=clBlack;
      Pixels[Width-5+d,2+d]:=clBlack;
      Pixels[Width-4+d,2+d]:=clBlack;

      Pixels[Width-7+d,3+d]:=clBlack;
      Pixels[Width-6+d,3+d]:=clBlack;
      Pixels[Width-5+d,3+d]:=clBlack;

      Pixels[Width-6+d,4+d]:=clBlack;
    end
    else If not Down then
    Begin
      ArrowStart:=Height div 2;

      Pixels[Width-10,ArrowStart-2]:=clBtnShadow;
      Pixels[Width-9,ArrowStart-2]:=clBtnShadow;
      Pixels[Width-8,ArrowStart-2]:=clBtnShadow;
      Pixels[Width-7,ArrowStart-2]:=clBtnShadow;
      Pixels[Width-6,ArrowStart-2]:=clBtnShadow;
      Pixels[Width-5,ArrowStart-2]:=clBtnShadow;
      Pixels[Width-4,ArrowStart-2]:=clBtnHighLight;


      Pixels[Width-9,ArrowStart-1]:=clBtnShadow;
      Pixels[Width-8,ArrowStart-1]:=clBtnFace;
      Pixels[Width-7,ArrowStart-1]:=clBtnFace;
      Pixels[Width-6,ArrowStart-1]:=clBtnFace;
      Pixels[Width-5,ArrowStart-1]:=clBtnHighLight;

      Pixels[Width-8,ArrowStart]:=clBtnShadow;
      Pixels[Width-7,ArrowStart]:=clBtnFace;
      Pixels[Width-6,ArrowStart]:=clBtnHighlight;

      Pixels[Width-7,ArrowStart+1]:=clBtnHighLight;
    end
    else
    Begin
      ArrowStart:=Height div 2;

      Pixels[Width-9,ArrowStart-1]:=clBtnShadow;
      Pixels[Width-8,ArrowStart-1]:=clBtnShadow;
      Pixels[Width-7,ArrowStart-1]:=clBtnShadow;
      Pixels[Width-6,ArrowStart-1]:=clBtnShadow;
      Pixels[Width-5,ArrowStart-1]:=clBtnShadow;
      Pixels[Width-4,ArrowStart-1]:=clBtnShadow;
      Pixels[Width-3,ArrowStart-1]:=clBtnHighLight;


      Pixels[Width-8,ArrowStart]:=clBtnShadow;
      Pixels[Width-7,ArrowStart]:=clBtnFace;
      Pixels[Width-6,ArrowStart]:=clBtnFace;
      Pixels[Width-5,ArrowStart]:=clBtnFace;
      Pixels[Width-4,ArrowStart]:=clBtnHighLight;

      Pixels[Width-7,ArrowStart+1]:=clBtnShadow;
      Pixels[Width-6,ArrowStart+1]:=clBtnFace;
      Pixels[Width-5,ArrowStart+1]:=clBtnHighlight;

      Pixels[Width-6,ArrowStart+2]:=clBtnHighLight;

    end;
  end;
end;

procedure TDropButt.SetBlackArrow(Value:boolean);
begin
  If FBlackArrow<>Value then FBlackArrow:=Value;
  Repaint;
end;

procedure Register;
begin
  RegisterComponents('Win95', [TDropButt]);
end;

end.
