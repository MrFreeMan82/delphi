unit uChangeObjav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, FMTBcd, DB, SqlExpr, DBCtrls,
  DBClient, Provider, ToolWin, ImgList, Mask, Buttons, Menus, Grids,
  GridsEh, DBGridEh;

type TTextPos = record
      color: TColor;
      rect: TRect;
      text: string;
end;

type TTextArr = array of TTextPos;

type TRefreshProc = procedure of object;

type TModuleOrientation=(oNA, oAlbum, oBook, oSquare);

type
  TfrmChangeObjav = class(TForm)
    Panel1: TPanel;
    lbFormat: TLabel;
    lbRubrika: TLabel;
    lbAgent: TLabel;
    lbCode: TLabel;
    lbPage: TLabel;
    dbAgent: TDBText;
    dsHead: TDataSource;
    dbFormat: TDBText;
    dbRubrika: TDBText;
    dbPage: TDBText;
    qInsertNewChange: TSQLQuery;
    qHead2: TSQLQuery;
    qHead2AG_NAME: TStringField;
    qHead2SD_NUM: TStringField;
    qHead2RB_NAME_SHORT: TStringField;
    qHead2FM_NAME: TStringField;
    qHead2CONTENT_COREL_PAGE: TStringField;
    qHead2CH_TEXT: TStringField;
    qPic: TSQLQuery;
    prvPic: TDataSetProvider;
    cdsPic: TClientDataSet;
    cdsPicCONTENT_PICTURE: TBlobField;
    qPicCONTENT_PICTURE: TBlobField;
    ImageList1: TImageList;
    cdsPicCH_PICTURE: TBlobField;
    qPicCH_PICTURE: TBlobField;
    qPicCONTENT_ID: TIntegerField;
    cdsPicCONTENT_ID: TIntegerField;
    qHead2CONTENT_ID: TIntegerField;
    dbCode: TDBEdit;
    Panel2: TPanel;
    btAddModule: TBitBtn;
    btVerstka: TBitBtn;
    btSaveMdl: TBitBtn;
    btnCancel: TBitBtn;
    Panel3: TPanel;
    tools: TToolBar;
    btPaint: TToolButton;
    btText: TToolButton;
    btClear: TToolButton;
    btSave: TToolButton;
    img: TImage;
    Memo: TMemo;
    popCopy: TPopupMenu;
    nCopy: TMenuItem;
    nPaste: TMenuItem;
    N1: TMenuItem;
    lblIsReadOnly: TLabel;
    qHead2OB_STATE: TIntegerField;
    qPicOLD_CONTENT_ID_LINK: TIntegerField;
    cdsPicOLD_CONTENT_ID_LINK: TIntegerField;
    qHead2OLD_CONTENT_ID_LINK: TIntegerField;
    qPicCH_TEXT: TStringField;
    cdsPicCH_TEXT: TStringField;
    qHead2OLD_TEXT: TStringField;
    btHistory: TToolButton;
    qHead2AG_ID: TIntegerField;
    qHead2SD_ID: TIntegerField;
    qHead2SD_STATE: TIntegerField;
    qHead2OS_NAME: TStringField;
    btDesign: TBitBtn;
    ScrollBox: TScrollBox;
    procedure imgMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure imgDblClick(Sender: TObject);
    procedure imgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btClearClick(Sender: TObject);
    procedure btClearNaborClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MemoExit(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btSaveMdlClick(Sender: TObject);
    procedure btSaveMdlCorrectorClick(Sender: TObject);
    procedure btVerstkaClick(Sender: TObject);
    procedure btCorrectureClick(Sender: TObject);
    procedure btAddModuleClick(Sender: TObject);
    procedure nCopyClick(Sender: TObject);
    procedure nPasteClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure btHistoryClick(Sender: TObject);
    procedure MemoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MemoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure MemoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MemoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btDesignClick(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
    { Private declarations }
    ob_id:integer;
    ob_state: integer;
    txtX, txtY, txtIdx: integer;

    txtArr: TTextArr;
    txtArrIndex: integer;
    freadonly: boolean;
    old_link, new_link: integer;
    dbText: string;
    his: boolean;
    enableChangeColor:boolean;
    usrColor: TColor;

    MouseDownSpot : TPoint;
    Capturing : bool;
    orient: TModuleOrientation;

    resultPicture:TBitmap;

    procedure fillList(idx:integer; list: TStringList);
    procedure ChangeModuleObjav(ob_id:integer; picture: TBitmap; reload: boolean = false);
    function joinBMP(): TBitmap;
    function PrepareChText(): string;
    procedure ReadChTextNew();
    procedure UpdateTextRectByList(idx, leftPos, topPos: integer; list:TStrings);
    procedure setUsrColor();
    procedure setMemoReadOnly(usrType:integer; color:TColor);
    procedure setReadonly(value: boolean);
    function locateText():integer;
    procedure setButtonSaveClick();
    procedure setButtonClearClick();
    function getOrientation():TModuleOrientation;
  public
    { Public declarations }
    originalPic: TBitmap;
    Ref : TRefreshProc;
    property Readonly :boolean read fReadonly write setReadOnly;
    property ModuleOrientation: TModuleOrientation read orient;
    class procedure ChangeObjav(ob_id: integer; readonly: boolean; picture: TBitmap; refresh: TRefreshProc = nil);
    class procedure setNewCorrectureState(ob_id: integer);
  end;

var
  frmChangeObjav: TfrmChangeObjav;

function calcWidthKoef(o: TModuleOrientation): integer;

implementation

uses dm, main, globals, accessRights, RegExpr, strUtils, loadPicture,
  uChangeHistory;

{$R *.dfm}

const
    DEF_COLOR = clRed;
    CORR_COLOR = clGreen;
    NABOR_COLOR = clRed;

    DEF_IMG_HEIGHT = 446;
    DEF_IMG_WIDTH  = 635;
{ TfrmChangeObjav }

function calcWidthKoef(o: TModuleOrientation): integer;
begin
     if o = oSquare then result := 200 else result := 0;
end;

class procedure TfrmChangeObjav.setNewCorrectureState(ob_id: integer);
var q: TSQLQuery;
begin
     q := TSQLQuery.Create(data);
     q.SQLConnection := data.connection;
     q.SQL.Append('UPDATE OBJAVLENIE o SET o.OB_STATE = 1 WHERE o.OBJAV_ID = :id AND o.OB_STATE = 3');
     q.ParamByName('id').AsInteger := ob_id;
     q.ExecSQL();

     if q.RowsAffected > 0 then
         data.LogState(ob_id, OB_STATE_CORRECTURE);

     q.Free;
end;

class procedure TfrmChangeObjav.ChangeObjav(ob_id: integer; readonly: boolean; picture: TBitmap; refresh: TRefreshProc = nil);
begin
     if not Assigned(frmChangeObjav) then frmChangeObjav := TfrmChangeObjav.Create(application);

     frmChangeObjav.originalPic := picture;
     frmChangeObjav.ob_id := ob_id;
     frmChangeObjav.readonly := readonly;
     frmChangeObjav.Ref := refresh;

     frmChangeObjav.setButtonSaveClick();
     frmChangeObjav.setButtonClearClick();

     with frmChangeObjav do
     begin
            qHead2.Close;
            qHead2.ParamByName('ob_id').AsInteger := ob_id;
            qHead2.Open;

            old_link := qHead2OLD_CONTENT_ID_LINK.AsInteger;
            new_link := qHead2CONTENT_ID.AsInteger;

            cdsPic.Close;
            cdsPic.FetchParams;
            cdsPic.Params.ParamByName('content_id').AsInteger := new_link;
            cdsPic.Open;
            dbText := qHead2CH_TEXT.AsString;

            if frmMain.currentUserType = 6 then
            begin
                  if cdsPicCH_PICTURE.isNull then
                  begin
                      cdsPic.Close;
                      if old_link <= 0 then
                           cdsPic.Params.ParamByName('content_id').AsInteger := new_link
                      else
                           cdsPic.Params.ParamByName('content_id').AsInteger := old_link;
                      dbText := qHead2OLD_TEXT.AsString
                  end
                  else begin
                      cdsPic.Close;
                      cdsPic.Params.ParamByName('content_id').AsInteger := new_link;
                      dbText := qHead2CH_TEXT.AsString
                  end;
                  cdsPic.Open;
            end;

            ob_state := qHead2OB_STATE.AsInteger;
            
            setUsrColor();
            setMemoReadOnly(frmMain.currentUserType, usrColor);
     end;
     TAccessRightsManager.SetWindowAccessState(int2user(frmMain.currentUserType), frmChangeObjav);

     frmChangeObjav.ChangeModuleObjav(ob_id, picture);
     frmChangeObjav.Show;
end;

procedure TfrmChangeObjav.ChangeModuleObjav(ob_id: integer; picture: TBitmap; reload: boolean = false);
var   pic: TPicture;
      k: integer;
begin
    resultPicture.Canvas.FillRect(resultPicture.Canvas.ClipRect);
   // if frmmain.currentUserType = 6 then reload := true;
    if cdsPicCONTENT_PICTURE.IsNull then exit;

    reload := reload or (cdsPicCH_PICTURE.IsNull) or (ob_state = OB_STATE_NABOR);

    if reload then
    begin
         if (originalPic = nil) then exit;
         orient := getOrientation();
         k := calcWidthKoef(orient);
         pic := TPicture.Create;
         Streach(originalPic, pic.Bitmap, resultPicture.Width - k, resultPicture.Height);
         BMPxGrayScale(pic.Bitmap);
         resultPicture.Canvas.Draw(0, 0, pic.Bitmap);
         pic.Free;
    end
    else if not cdsPicCH_PICTURE.IsNull then
    begin
         //ReadChText();
         ReadChTextNew();
         pic := TPicture.Create;
         PictureFromCompressedFieldNew(pic, cdsPicCH_PICTURE, 'bmp', false);
         resultPicture.Canvas.Draw(0,0,pic.Bitmap);
         pic.Free;
    end
    else exit;

    Repaint;
end;

function TfrmChangeObjav.joinBMP(): TBitmap;
var sR,dR: TRect;
begin
     result := TBitmap.Create;
     result.Width := resultPicture.Width;
     result.Height := resultPicture.Height;
     sR := Rect(0, 0, resultPicture.Width, resultPicture.Height);
     dR := sR;
     result.Canvas.CopyMode := cmSrcCopy;
     result.Canvas.CopyRect(dR, resultPicture.Canvas, sR);
end;

procedure TfrmChangeObjav.imgMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    txtX := X;
    txtY := Y;

    if not btPaint.Down then exit;

    with img.Canvas do
    begin
        Pen.Color:= clRed;
        Pen.Width:= 2;
        MoveTo(X, Y);

        resultPicture.Canvas.Pen.Color := clRed;
        resultPicture.Canvas.Pen.Width := 2;
        resultPicture.Canvas.MoveTo(X, Y);
    end;
end;

procedure TfrmChangeObjav.imgMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    if not btPaint.Down then exit;
    if ssLeft in Shift then
    begin
         img.Canvas.LineTo(x, y);
         resultPicture.Canvas.LineTo(x,y);
    end;
end;

procedure TfrmChangeObjav.fillList(idx:integer; list: TStringList);
var i, j, w, k: integer;
    r:TRegExpr;
    words: TStringList;
    sent, s:string;
begin
     s := txtArr[idx].text;
     if s = '' then exit;

     r := TRegExpr.Create;
     r.Expression := ' ';
     words := TStringList.Create;

     list.Text := s;
     i := 0;
     while i < list.Count do
     begin
          k := i;
          w := resultPicture.Canvas.TextWidth(list.Strings[i]);
          if txtArr[idx].rect.Left + w >= resultPicture.Width then
          begin
                words.Clear;
                r.Split(list.Strings[i], words);
                list.Strings[i] := '';
                sent := '';

                for j := 0 to words.Count - 1 do
                begin
                      w := resultPicture.Canvas.TextWidth(sent + words.Strings[j]);
                      if txtArr[idx].rect.Left + w < resultPicture.Width then
                      begin
                           sent := sent + words.Strings[j] + ' '
                      end
                      else begin
                          list.Insert(k, sent);
                          sent := words.Strings[j] + ' ';
                          inc(k); inc(i);
                      end;
                end;

                list.Insert(k, sent);
          end;
          inc(i);
     end;
     freeAndNil(words);
     freeAndNil(r);
end;

procedure TfrmChangeObjav.FormPaint(Sender: TObject);
var i, j, h: integer;
    list: TStringList;
    fl:boolean;
begin
     fl := false;
     list := TStringList.Create;
     for i := 0 to length(txtArr) - 1 do
     begin
          if txtArr[i].text <> '' then
          begin
              h := txtArr[i].rect.Top;
              fillList(i, list);
              updateTextRectByList(i, txtArr[i].rect.Left, txtArr[i].rect.Top, list);
              if (txtArr[i].rect.Bottom >= (resultPicture.Height - 25)) then
              begin
                   resultPicture.Height := resultPicture.Height + txtArr[i].rect.Bottom - resultPicture.Height + 25;
                   fl := true;
              end
              else if not fl then
                   resultPicture.Height := DEF_IMG_HEIGHT;
              //list.Text := txtArr[i].text;

              for j := 0 to list.Count - 1 do
              with resultPicture.Canvas do
              begin
                  if list.Strings[j] = '' then continue;

                  Font.Color := txtArr[i].color;
                  TextOut(txtArr[i].rect.Left, h, list.Strings[j]);
                  h := h + TextHeight(list.Strings[j]);
              end;
          end;
         // img.Canvas.Rectangle(txtArr[i].Rect);
     end;
     img.Picture.Assign(resultPicture);
     list.Free;
end;

procedure TfrmChangeObjav.btClearNaborClick(Sender: TObject);
begin
     txtArrIndex := 0;
     SetLength(txtArr, 0);

     resultPicture.Canvas.FillRect(resultPicture.Canvas.ClipRect);
     img.Picture.Assign(resultPicture);
     TfrmChangeObjav.ChangeObjav(ob_id, readonly, originalPic, Ref);
//     ChangeModuleObjav(ob_id, originalPic, true);
end;

procedure TfrmChangeObjav.btClearClick(Sender: TObject);
begin
     txtArrIndex := 0;
     SetLength(txtArr, 0);

     resultPicture.Free;
     resultPicture := TBitmap.Create;
     resultPicture.Canvas.Font.Name := 'Tahoma';
     resultPicture.Canvas.Font.Size := 10;
     resultPicture.Width := img.Width;
     resultPicture.Height := DEF_IMG_HEIGHT;
     resultPicture.Width  := DEF_IMG_WIDTH;

     img.Width  := DEF_IMG_WIDTH;
     img.Height := DEF_IMG_HEIGHT;
     img.Picture.Assign(resultPicture);
     ChangeModuleObjav(ob_id, originalPic, true);
end;

function TfrmChangeObjav.locateText: integer;
var i: integer;
begin
     result := -1;
     for i := 0 to length(txtArr) - 1 do
     with txtArr[i].rect do
     begin
         if (txtX >= Left) and (txtX <= Right) and
             (txtY >= Top) and (txtY <= Bottom) then
          begin
               result := i;
               exit;
          end
     end
end;

procedure TfrmChangeObjav.imgDblClick(Sender: TObject);
var k: integer;
begin
     enableChangeColor := true;
     k := locateText();
     if k >= 0 then
     begin
          setUsrColor();
          setMemoReadOnly(frmMain.currentUserType, txtArr[k].color);

          if enableChangeColor then
                   txtArr[k].color := usrColor;

          memo.Left := txtArr[k].rect.Left;
          memo.Top := txtArr[k].rect.Top - scrollBox.VertScrollBar.Position;
          memo.Text := txtArr[k].text;
          memo.Visible := true;
          txtIdx := k;
          if btText.Down = false then btText.Down := true;
          memo.SetFocus;
          exit;
     end;

     setUsrColor();
     setMemoReadOnly(frmMain.currentUserType, usrColor);
     memo.Left := txtX;
     memo.Top := txtY - scrollBox.VertScrollBar.Position;
     memo.Visible := true;
     if not btText.Down then btText.Down := true;
     memo.SetFocus;
end;

procedure TfrmChangeObjav.UpdateTextRectByList(idx, leftPos, topPos: integer; list:TStrings);
var s: string;
    i, w: integer;
begin
    if idx < 0 then exit;
    resultPicture.Canvas.FillRect(txtArr[idx].rect);
    with txtArr[idx].rect do
    begin
         Left := leftPos;
         Top := topPos;
         Bottom := Top;
         Right := Left;

         for i := 0 to list.Count - 1 do
         begin
              s := list.Strings[i];
              w := Left + resultPicture.Canvas.TextWidth(s) + 5;
              if w > Right then Right := w;

              Bottom := Bottom + resultPicture.Canvas.TextHeight(s);
         end;
    end;
end;

procedure TfrmChangeObjav.imgClick(Sender: TObject);
begin
    if memo.Visible = true then memo.Visible := false;
    if not btText.Down then exit;

    if (memo.Text <> '') or (txtIdx >= 0) then
    begin
         if txtIdx >= 0 then
         begin
             UpdateTextRectByList(txtIdx, memo.Left, memo.Top + scrollBox.VertScrollBar.Position, memo.Lines);                 /// elder records
             txtArr[txtIdx].text := memo.Text;
             
             setUsrColor();
             if enableChangeColor then
                  txtArr[txtIdx].color := usrColor;
             txtIdx := -1;
         end
         else begin
                if txtArrIndex = length(txtArr) then SetLength(txtArr, txtArrIndex + 10);
                UpdateTextRectByList(txtArrIndex, memo.Left, memo.Top + scrollBox.VertScrollBar.Position, memo.Lines);

                setUsrColor();
                if enableChangeColor then
                   txtArr[txtArrIndex].color := usrColor;             // new record

                txtArr[txtArrIndex].text := memo.Text;
                inc(txtArrIndex)
         end;
         memo.Lines.Clear;
         Repaint;
    end;
end;

procedure TfrmChangeObjav.FormCreate(Sender: TObject);
begin
    img.Parent.DoubleBuffered := true;
    txtIdx := -1;
    txtArrIndex := 0;
    SetLength(txtArr, length(txtArr) + 10);
    enableChangeColor := true;
    resultPicture := TBitmap.Create;
    resultPicture.Canvas.Font.Name := 'Tahoma';
    resultPicture.Canvas.Font.Size := 10;
    resultPicture.Width := img.Width;
    resultPicture.Height := img.Height;
end;

procedure TfrmChangeObjav.btSaveClick(Sender: TObject);
var
	dlg: TSaveDialog;
  bmp: TBitmap;
begin

	try
    bmp := nil;
		dlg := TSaveDialog.Create(nil);
		dlg.DefaultExt := 'bmp';
    dlg.Filter := 'BMP(*.bmp)|*.bmp';
		dlg.FileName   := 'БезИмени.bmp';
		if (dlg.Execute) then
    begin
        bmp := joinBMP();
        bmp.SaveToFile(dlg.FileName);
    end
  finally
      FreeAndNil(bmp);
    	FreeAndNil(dlg)
  end;
end;

procedure TfrmChangeObjav.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if Assigned(ref) then Ref();

     memo.Lines.Clear;
     if memo.Visible then memo.Visible := false;
     txtArrIndex := 0;
     SetLength(txtArr, 0);
     his := false;
     freeandNil(resultPicture);
     
     Action := caFree;
     frmChangeObjav := nil;
end;

procedure TfrmChangeObjav.MemoExit(Sender: TObject);
begin
    imgClick(Sender)
end;

function replaceWithSpecialChars(const s: string): string;
var h, t: integer;
begin
     result := s;
     h := pos('|', s);
     t := pos(';', s);

     while (h > 0) or (t > 0) do
     begin
          if h > 0 then
          begin
              result[h] := #$17;
              h := pos('|', result);
          end;
          if t > 0 then
          begin
               result[t] := #$1A;
               t := pos(';', result);
          end;
     end;
end;

function replaceSpecialChars(const s: string): string;
var h, t: integer;
begin
     result := s;
     h := pos(#$17, s);
     t := pos(#$1A, s);

     while (h > 0) or (t > 0) do
     begin
          if h > 0 then
          begin
               result[h] := '|';
               h := pos(#$17, result);
          end;
          if t > 0 then
          begin
              result[t] := ';';
              t := pos(#$1A, result);
          end;
     end;
end;

function TfrmChangeObjav.PrepareChText(): string;
var i: integer;
begin
     if (length(txtArr) = 0) then
     begin
          result := '';
          exit;
     end;

     result := intToStr(length(txtArr)) + ';';
     for i := 0 to length(txtArr) - 1 do
     with txtArr[i] do
     begin
          if txtArr[i].text <> '' then
          begin
              result := result + IntToStr(txtArr[i].color) + ';' +
                                 IntToStr(rect.Left) + ';' +
                                 IntToStr(rect.Top) +  ';' +
                                 IntToStr(rect.Right) +';' +
                                 IntToStr(rect.Bottom)+ ';' +
                                 replaceWithSpecialChars(txtArr[i].text) + '|';
          end;
     end;
end;

procedure TfrmChangeObjav.ReadChTextNew;
var list, list2:TStringList;
    r:TRegExpr;
    i,j:integer;
begin
      txtArrIndex := 0;
      SetLength(txtArr, 0);

      list := TStringList.Create;
      r := TRegExpr.Create;
      r.Expression := '\|';
      r.Split(dbText, list);

      list2 := TStringList.Create;

      for i := 0 to list.Count - 1 do
      begin
           if list.Strings[i] = '' then continue;
           list2.Clear;
           r.Expression := '\;';

           if i = 0 then
                    r.Split(list.Strings[i], list2)
           else                                   // Добавлена пустая ячейка чтоб соответствовать формату хранения текста смотри CH_TEXT OBJAV_CONTENT table
                    r.Split(';' + list.Strings[i], list2);

           for j := 0 to  list2.Count - 1 do
           with txtArr[txtArrIndex] do
           begin
                if list2.Strings[j] = '' then continue;
                
                case j  of
                      0: if i = 0 then SetLength(txtArr, strToint(list2.Strings[j]));
                      1: color := strToInt(list2.Strings[j]);
                      2: rect.Left := strToInt(list2.Strings[j]);
                      3: rect.Top := strToInt(list2.Strings[j]);
                      4: rect.Right := strToInt(list2.Strings[j]);
                      5: rect.Bottom := strToInt(list2.Strings[j]);
                      else text := text + replaceSpecialChars(list2.Strings[j]);
                end;
           end;
           inc(txtArrIndex);
      end;

      list2.Free;
      list.Free;
      r.Free;
end;

procedure TfrmChangeObjav.btnCancelClick(Sender: TObject);
begin
 Close
end;

procedure TfrmChangeObjav.btSaveMdlClick(Sender: TObject);
var s: string;
    pic:TPicture;
begin
     if frmMain.currentUserType = 3 then
     begin
              s := PrepareChText();
              qInsertNewChange.SQL.Clear;
              qInsertNewChange.SQL.Append('UPDATE objavlenie o SET o.OB_STATE = 2 WHERE o.objav_id = :ob_id');
              qInsertNewChange.ParamByName('ob_id').AsInteger := ob_id;
              qInsertNewChange.ExecSQL();

              if (qHead2SD_STATE.AsInteger < 4) then
              begin
                   qInsertNewChange.SQL.Clear;
                   qInsertNewChange.SQL.Append('UPDATE sdelka s SET s.AS_ID = 1 WHERE s.ag_id =:ag_id AND s.SD_ID = :sd_id');
                   qInsertNewChange.ParamByName('ag_id').AsInteger := qHead2AG_ID.AsInteger;
                   qInsertNewChange.ParamByName('sd_id').AsInteger := qHead2SD_ID.AsInteger;
                   qInsertNewChange.ExecSQL();
              end;

              cdsPic.Edit;
              cdsPicCH_TEXT.AsString := s;
              pic := TPicture.Create;
              pic.Bitmap := joinBMP();
              PictureToCompressedField(pic, cdsPicCH_PICTURE);
              cdsPic.ApplyUpdates(0);
              pic.Free;
              data.LogState(ob_id, OB_STATE_REPAIR);
     end;
     Close;
end;

procedure TfrmChangeObjav.btSaveMdlCorrectorClick(Sender: TObject);
var s: string;
   pic: TPicture;
begin
    if frmMain.currentUserType = 6 then
    begin
          s := PrepareChText();
          qInsertNewChange.SQL.Clear;
          qInsertNewChange.SQL.Append('UPDATE objavlenie o SET o.OB_STATE = 3 WHERE o.objav_id = :ob_id');
          qInsertNewChange.ParamByName('ob_id').AsInteger := ob_id;
          qInsertNewChange.ExecSQL();

          cdsPic.Close;
          cdsPic.Params.ParamByName('content_id').AsInteger := new_link;
          cdsPic.Open;

          cdsPic.Edit;
          cdsPicCH_TEXT.AsString := s;
          pic := TPicture.Create;
          pic.Bitmap := joinBMP();
          PictureToCompressedField(pic, cdsPicCH_PICTURE);
          cdsPic.ApplyUpdates(0);
          pic.Free;
          data.LogState(ob_id, OB_STATE_DESIGN);
    end;
    Close;
end;

procedure TfrmChangeObjav.btVerstkaClick(Sender: TObject);
begin
     if frmMain.currentUserType = 6 then
     begin
            qInsertNewChange.SQL.Clear;
            qInsertNewChange.SQL.Append('UPDATE OBJAVLENIE o SET o.OB_STATE = 4 WHERE o.OBJAV_ID = :id');
            qInsertNewChange.ParamByName('id').AsInteger := ob_id;
            qInsertNewChange.ExecSQL();

            data.LogState(ob_id, OB_STATE_VERSTKA);
     end;
     Close;
end;

procedure TfrmChangeObjav.btCorrectureClick(Sender: TObject);
begin
     if frmMain.currentUserType = 8 then
     begin
            qInsertNewChange.SQL.Clear;
            qInsertNewChange.SQL.Append('UPDATE OBJAVLENIE o SET o.OB_STATE = 1 WHERE o.OBJAV_ID = :id AND o.OB_STATE = 3');
            qInsertNewChange.ParamByName('id').AsInteger := ob_id;
            qInsertNewChange.ExecSQL();

            if qInsertNewChange.RowsAffected > 0 then
                      data.LogState(ob_id, OB_STATE_CORRECTURE);
     end;
     Close;
end;


procedure TfrmChangeObjav.btDesignClick(Sender: TObject);
var s: string;
    pic: TPicture;
begin
    if frmMain.currentUserType = 5 then
    begin
            s := PrepareChText();
            qInsertNewChange.SQL.Clear;
            qInsertNewChange.SQL.Append('UPDATE OBJAVLENIE o SET o.OB_STATE = 3 WHERE o.OBJAV_ID = :id');
            qInsertNewChange.ParamByName('id').AsInteger := ob_id;
            qInsertNewChange.ExecSQL();

            cdsPic.Edit;
            cdsPicCH_TEXT.AsString := s;
            pic := TPicture.Create;
            pic.Bitmap := joinBMP();
            PictureToCompressedField(pic, cdsPicCH_PICTURE);
            cdsPic.ApplyUpdates(0);
            pic.Free;
            
            data.LogState(ob_id, OB_STATE_DESIGN);
    end;
    Close;
end;

procedure TfrmChangeObjav.setReadonly(value: boolean);
begin
	 fReadOnly := value;

	// Проставим тег в этой метке - по нему при установке
	// прав доступа будет определено, рид-онли ли форма.
    if (self.ReadOnly) then lblIsReadOnly.Tag := 1 else lblIsReadOnly.Tag := 0;
   // TAccessRightsManager.SetWindowAccessState(int2user(frmMain.currentUserType), frmChangeObjav);
end;

procedure TfrmChangeObjav.btAddModuleClick(Sender: TObject);
begin
   if frmLoadPicture.loadmodule(dbCode.Text, dbPage.Caption, self.ClassName) = mrOK then
   begin
       btCorrectureClick(Sender);
   end;
end;

procedure TfrmChangeObjav.nCopyClick(Sender: TObject);
begin
      StrToClipboard(memo.SelText);
end;

procedure TfrmChangeObjav.nPasteClick(Sender: TObject);
begin
    memo.PasteFromClipboard;
end;

procedure TfrmChangeObjav.N1Click(Sender: TObject);
begin
    memo.SelectAll;
end;

procedure TfrmChangeObjav.btHistoryClick(Sender: TObject);
begin
    TfrmChHis.ShowHistory(new_link)
end;

procedure TfrmChangeObjav.setUsrColor;
begin
    case frmMain.currentUserType of
      5: usrColor := NABOR_COLOR;
      6: usrColor := CORR_COLOR;
      else usrcolor := DEF_COLOR;
    end;
end;

procedure TfrmChangeObjav.setMemoReadOnly(usrType:integer; color:TColor);
begin
    case usrType of
          8: begin
                Memo.ReadOnly := true;
                enableChangeColor := false; 
             end;
          5: begin
                  if (color in [NABOR_COLOR, DEF_COLOR]) then
                  begin
                      memo.ReadOnly := false;
                      enableChangeColor := true;
                  end
                  else begin
                       memo.ReadOnly := true;
                       enableChangeColor := false;
                  end
             end;
          6:
            begin
                if (color = CORR_COLOR) then
                begin
                     memo.ReadOnly := false;
                     enableChangeColor := true;
                end
                else begin
                    memo.ReadOnly := true;
                    enableChangeColor := false;
                end;
            end;

          3: if color <> DEF_COLOR then
             begin
                 memo.ReadOnly := true;
                 enableChangeColor := false;
             end
             else begin
                 memo.ReadOnly := false;
                 enableChangeColor := true;
             end;

          else begin
                 memo.ReadOnly := true;
                 enableChangeColor := false;
          end;
    end;
end;

procedure TfrmChangeObjav.MemoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ssCtrl in Shift then
  begin
        SetCapture(memo.Handle);
        Capturing := true;
        MouseDownSpot.X := x;
        MouseDownSpot.Y := Y;
  end;
end;

procedure TfrmChangeObjav.MemoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Capturing then
  begin
        memo.Left := memo.Left - (MouseDownSpot.x - x);
        memo.Top := memo.Top - (MouseDownSpot.y - y);
  end;
end;

procedure TfrmChangeObjav.MemoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if Capturing then
 begin
        ReleaseCapture;
        Capturing := false;
        memo.Left := memo.Left - (MouseDownSpot.x - x);
        memo.Top := memo.Top - (MouseDownSpot.y - y);
  end;
end;

procedure TfrmChangeObjav.MemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if ssCtrl in Shift then
    begin
        memo.Cursor := crSizeAll;
    end;

    if Key = VK_ESCAPE then
    begin
         if memo.Visible then
         begin
              memo.Lines.Clear;
              memo.Visible := false;
         end;
    end;
end;

procedure TfrmChangeObjav.MemoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    memo.Cursor := crDefault;
end;

procedure TfrmChangeObjav.setButtonSaveClick;
begin
      case frmMain.currentUserType of
         3: btSaveMdl.OnClick := btSaveMdlClick;
         6: btSaveMdl.OnClick := btSaveMdlCorrectorClick;
         else btSaveMdl.OnClick := nil;
      end;
end;

procedure TfrmChangeObjav.setButtonClearClick;
begin
     case frmMain.currentUserType of
        5: btClear.OnClick := btClearNaborClick;
        else btClear.OnClick := btClearClick;
     end;
end;


function TfrmChangeObjav.getOrientation: TModuleOrientation;
var k:integer;
begin
     result := oNA;
     if originalPic = nil then exit;
     if originalPic.Height = 0 then exit;

     k := originalPic.Width  div originalPic.Height;

     case k of
        0: result := oBook;
        1: result := oSquare;
        else result := oAlbum;
     end;
end;

procedure TfrmChangeObjav.FormMouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
begin
    if memo.Visible then exit;
    
    with scrollBox.VertScrollBar do
    begin
        if (wheelDelta < 0) and (position < range)
        then position := position + increment
        else if (position > 0) then position := position - increment
    end;
end;

end.
