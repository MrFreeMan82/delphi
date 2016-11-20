unit ContentForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ContentFrame, StdCtrls, Buttons;

type
  TfrmContent = class(TForm)
    frameContent: TframeContent;
    Panel1: TPanel;
    btDone: TBitBtn;
    btCancelAg: TBitBtn;
    procedure btDoneClick(Sender: TObject);
    procedure btCancelAgClick(Sender: TObject);
  private
    { Private declarations }
  public
    class procedure View(AContentId: integer; ASdelka, AAgent, ACust, AIssue: String);
    class procedure Edit(AContentId: integer; ASdelka, AAgent, ACust, AIssue: String);
    class function Add():integer;        
  end;

implementation

uses db, ObjavlenieFrame;

{$R *.dfm}

{ TfrmObjavlenie }


{ TfrmContent }

class procedure TfrmContent.View(AContentId: integer; ASdelka, AAgent, ACust, AIssue: String);
var
	frm: TfrmContent;
begin
	frm := nil;

    try
    	frm := TfrmContent.Create(nil);

        frm.frameContent.ContentId := AContentId;
        frm.frameContent.SetPrintData(ASdelka, AAgent, ACust, AIssue);        
        frm.frameContent.Refresh();
        frm.frameContent.ReadOnly := true;

        frm.ShowModal();
    finally
    	if (Assigned(frm)) then
        	frm.Free;
    end;
end;

class procedure TfrmContent.Edit(AContentId: integer; ASdelka, AAgent, ACust, AIssue: String);
var
	frm: TfrmContent;
begin
	frm := nil;

    try
    	frm := TfrmContent.Create(nil);

        frm.frameContent.ContentId := AContentId;
        frm.frameContent.SetPrintData(ASdelka, AAgent, ACust, AIssue);
        frm.frameContent.Refresh();

        frm.ShowModal();
    finally
    	if (Assigned(frm)) then
        	frm.Free;
    end;
end;

procedure TfrmContent.btDoneClick(Sender: TObject);
begin
	frameContent.Save();
end;

procedure TfrmContent.btCancelAgClick(Sender: TObject);
begin
	frameContent.Cancel();
end;

class function TfrmContent.Add: integer;
var
	frm: TfrmContent;
begin
	frm := nil;

    try
    	frm := TfrmContent.Create(nil);

        frm.frameContent.Add();

        Result := frm.frameContent.ContentId;

        if (frm.ShowModal() <> mrOk) then
        	Result := 0;
    finally
    	if (Assigned(frm)) then
        	frm.Free;
    end;
end;

end.
