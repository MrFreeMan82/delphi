unit uCover;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Menus, FMTBcd, SqlExpr, Provider,
  DB, DBClient, DBCtrls, Buttons, ImgList, CheckLst;

type TStatus = (stUnderMouse, stSelected, stReserved, stStatic, stSpecial);

type TStatusSet = set of TStatus;

type TFormat = (f1_2, f1_4);

type
    PCell = ^TCell;
    TCell = record
     x,y: word;
     rect: TRect;
     rr_id:integer;
     us_id:integer;
     comment: string;
     status: TStatusSet;     // 1 - Under Mouse Cell; 2- Selected Cell
     visible:boolean;
     color:TColor;
     pic:TPicture;
end;

type TMap = array of TCell;

type
  TfrmCover = class(TForm)
    popReserve: TPopupMenu;
    mnuReserve: TMenuItem;
    mnuUnReserve: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbIssue: TDBLookupComboBox;
    dsIssue: TDataSource;
    cdsIssue: TClientDataSet;
    prvIssue: TDataSetProvider;
    qIssue: TSQLQuery;
    qIssueIS_NAME_COMPOSED: TStringField;
    cdsIssueIS_NAME_COMPOSED: TStringField;
    qIssueIS_ID: TIntegerField;
    cdsIssueIS_ID: TIntegerField;
    btnRefreshAll: TSpeedButton;
    qPage: TSQLQuery;
    prvPage: TDataSetProvider;
    cdsPage: TClientDataSet;
    dsPage: TDataSource;
    cbPage: TDBLookupComboBox;
    qPageRB_ID: TIntegerField;
    cdsPageRB_ID: TIntegerField;
    qPageRB_NAME_SHORT: TStringField;
    cdsPageRB_NAME_SHORT: TStringField;
    mnuDeselect: TMenuItem;
    qSaveMap: TSQLQuery;
    img: TImage;
    pnlRep: TPanel;
    cdsIssueIS_NAME: TStringField;
    qIssueIS_NAME: TStringField;
    pnlPages: TPanel;
    cbGazeta: TDBLookupComboBox;
    qGz: TSQLQuery;
    prvGz: TDataSetProvider;
    cdsGz: TClientDataSet;
    dsGz: TDataSource;
    qGzGZ_ID: TIntegerField;
    qGzGZ_NAME_SHORT: TStringField;
    cdsGzGZ_ID: TIntegerField;
    cdsGzGZ_NAME_SHORT: TStringField;
    lstThumb: TListView;
    imgThumbs: TImageList;
    imgPR: TImage;
    lblIsReadOnly: TLabel;
    qLock: TSQLQuery;
    qUnLockPage: TSQLQuery;
    qGetAllMapsByIssue: TSQLQuery;
    mnuChange: TMenuItem;
    prvGetAllMapsByIssue: TDataSetProvider;
    cdsGetAllMapsByIssue: TClientDataSet;
    cdsGetAllMapsByIssueRM_ID: TIntegerField;
    cdsGetAllMapsByIssueRB_ID: TIntegerField;
    cdsGetAllMapsByIssueDEFAULT_MAP: TStringField;
    cdsGetAllMapsByIssueRB_NAME_SHORT: TStringField;
    qGetLockUsr: TSQLQuery;
    qGetLockUsrUS_NAME: TStringField;
    cdsGetAllMapsByIssueCOMMENT: TStringField;
    cdsGetAllMapsByIssueUS_NAME: TStringField;
    cdsGetAllMapsByIssueAG_NAME: TStringField;
    cdsGetAllMapsByIssueUS_ID: TIntegerField;
    cdsGetAllMapsByIssueAG_ID: TIntegerField;
    cdsGetAllMapsByIssueRR_ID: TIntegerField;
    cdsGetAllMapsByIssueSD_ID: TIntegerField;
    qGetAllMapsByIssueCOMMENT: TStringField;
    qGetAllMapsByIssueUS_NAME: TStringField;
    qGetAllMapsByIssueAG_NAME: TStringField;
    qGetAllMapsByIssueUS_ID: TIntegerField;
    qGetAllMapsByIssueAG_ID: TIntegerField;
    qGetAllMapsByIssueRB_NAME_SHORT: TStringField;
    qGetAllMapsByIssueRM_ID: TIntegerField;
    qGetAllMapsByIssueDEFAULT_MAP: TStringField;
    qGetAllMapsByIssueRR_ID: TIntegerField;
    qGetAllMapsByIssueSD_ID: TIntegerField;
    qGetAllMapsByIssueRB_ID: TIntegerField;
    prvMap: TDataSetProvider;
    cdsMap: TClientDataSet;
    cdsMapLOCK_USR: TIntegerField;
    cdsMapCOMMENT: TStringField;
    cdsMapUS_NAME: TStringField;
    cdsMapAG_NAME: TStringField;
    cdsMapUS_ID: TIntegerField;
    cdsMapAG_ID: TIntegerField;
    cdsMapRM_ID: TIntegerField;
    cdsMapRR_ID: TIntegerField;
    cdsMapSD_ID: TIntegerField;
    cdsMapRB_ID: TIntegerField;
    Memo: TMemo;
    mnuCopy: TMenuItem;
    lblUsr: TLabel;
    cdsIssueCUR_ISS: TIntegerField;
    qIssueCUR_ISS: TIntegerField;
    cdsMapSMALL_PICTURE: TBlobField;
    qGetAllMapsByIssueSMALL_PICTURE: TBlobField;
    cdsGetAllMapsByIssueSMALL_PICTURE: TBlobField;
    cdsMapPAGE_MAP: TStringField;
    cdsGetAllMapsByIssuePAGE_MAP: TStringField;
    qGetAllMapsByIssuePAGE_MAP: TStringField;
    qMap: TSQLQuery;
    qMapCOMMENT: TStringField;
    qMapUS_NAME: TStringField;
    qMapAG_NAME: TStringField;
    qMapUS_ID: TIntegerField;
    qMapAG_ID: TIntegerField;
    qMapRM_ID: TIntegerField;
    qMapRR_ID: TIntegerField;
    qMapSD_ID: TIntegerField;
    qMapRB_ID: TIntegerField;
    qMapLOCK_USR: TIntegerField;
    qMapSMALL_PICTURE: TBlobField;
    qMapPAGE_MAP: TStringField;
    cdsPageRB_NAME: TStringField;
    qPageRB_NAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshAllClick(Sender: TObject);
    procedure mnuReserveClick(Sender: TObject);
    procedure mnuDeselectClick(Sender: TObject);
    procedure mnuUnReserveClick(Sender: TObject);
    procedure imgMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure cbIssueCloseUp(Sender: TObject);
    procedure lstThumbClick(Sender: TObject);
    procedure cbGazetaCloseUp(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mnuChangeClick(Sender: TObject);
    procedure popReservePopup(Sender: TObject);
    procedure imgDblClick(Sender: TObject);
    procedure mnuCopyClick(Sender: TObject);
  private
    { Private declarations }
    gX,gY:integer;
    rm_id:integer;
    map_str: string;
    fEnableDraw:boolean;
    fEnableBorder:boolean;
    fLoadPicture:boolean;
    oldUnderMouseCell: PCell;
    enableTX:boolean;
    fReadOnly:boolean;
    memoCell:PCell;
    fLockUsrID:integer;
    oldSelectedItemIdx: integer;
    fErrorIssues:string;
    isMultiSelect:boolean;

    procedure makeSelect(cell:PCell);
    function iSValidSelect():boolean;
    procedure freeMap();
    procedure enableDisablePopMenuItems();
    procedure updateLockUsrCaption();
    procedure createOneThumb(i:integer);
    procedure LockUnlockPage();
    procedure setReadOnly(value: boolean);
    procedure refreshComboBox();
    procedure refreshThumbs();
    procedure refreshThumnail();
    procedure createThumbs();
    procedure joinCells();
    function findCell(x,y:integer):PCell;
    procedure selectCell(x,y:integer);
    procedure setUnderMouseCell(cell:PCell; x,y:integer);
    function CountCells(): integer;
    procedure Draw();
    procedure CreateMap(Width, Height:integer; data:TDataSet);
    procedure setErrorIssues(const Value: string);
  public
    { Public declarations }
    map: TMap;
    function getRR_ID():integer;
    procedure setNewRRID(rr_id: integer);
    procedure selectByMap(fromMap:TMap);
    procedure showPage();
    procedure SaveMap();
    property ErrorIssues:string read fErrorIssues write setErrorIssues;    
    property EnableDraw: boolean read fEnableDraw write fEnableDraw;
    property ReadOnly:boolean read fReadOnly write setReadOnly;          // Если выбран номер уже вышедший то принудительно выставляеться режим просмотра
    property reserveMapID:integer read rm_id;
  end;

function MapToStr(map: TMap): string;

implementation

uses dm, strUtils, uReserve, main, globals, wait, accessRights;

{$R *.dfm}

procedure TfrmCover.joinCells;
var i,j:integer;
begin
     if map = nil then exit;
     i := 0;
     
     while i <= length(map) - 1 do
     begin
          if (map[i].rr_id = 0) or (not map[i].visible)then
          begin
               inc(i);
               continue;
          end;

          j := i + 1;
          while j <= length(map) - 1 do
          begin
               if map[i].rr_id = map[j].rr_id then
               begin
                    if (map[i].x <> map[j].x) and (map[i].y = map[j].y)
                    then  map[i].rect.Right := map[j].rect.Right

                    else if (map[i].x = map[j].x) and (map[i].y <> map[j].y)
                    then map[i].rect.Bottom := map[j].rect.Bottom;

                    map[j].visible := false;
               end;

               inc(j);
          end;

          inc(i)
     end;
end;

procedure TfrmCover.FormCreate(Sender: TObject);
begin
    img.Top := Panel1.Height;
    img.Left := Panel1.Left;
    img.Parent.DoubleBuffered := true;
    img.Canvas.Brush.Color := clBtnFace;
    img.Canvas.FillRect(img.Canvas.ClipRect);
    img.Canvas.Font.Name := 'Tahoma';
    img.Canvas.Font.Size := 10;

    cdsGz.Open;
    cbGazeta.KeyValue := cdsGzGZ_ID.AsInteger;

    refreshComboBox();

    fEnableDraw := true;
    enableTX := true;
end;

procedure TfrmCover.showPage();
begin
    cdsMap.Close;
    cdsMap.FetchParams;
    cdsMap.Params.ParamByName('gz_id').AsInteger := cdsGzGZ_ID.AsInteger;
    cdsMap.Params.ParamByName('is_id').AsInteger := cdsIssueIS_ID.AsInteger;
    cdsMap.Params.ParamByName('rb_id').AsInteger := cdsPageRB_ID.AsInteger;
    cdsMap.Open;

    rm_id :=   cdsMapRM_ID.AsInteger;
    map_str := cdsMapPAGE_MAP.AsString;
    fLockUsrID := cdsMapLOCK_USR.AsInteger;

    CreateMap(img.Width, img.Height, cdsMap);
    joinCells();
    Draw();
    cdsMap.Close;  // Commit inserting new reserve map if not exists(See proc get_RESERVE_MAP)
end;

procedure TfrmCover.LockUnlockPage();
begin
     if frmMain.currentUserType = 1 then
     begin
        qUnLockPage.ParamByName('lock_usr').AsInteger := frmMain.currentUser;
        qUnLockPage.ExecSQL();

        if not frmMain.canUserBlockCover then
        begin
             readOnly := true;
             updateLockUsrCaption();
             exit;
        end;

        if fLockUsrID > 0 then
        begin
            if (frmMain.currentUser <> fLockUsrID) then readOnly := true
            else begin
                  readonly := false;
                  qLock.ParamByName('lock_usr').AsInteger := fLockUsrID;
                  qLock.ParamByName('id').AsInteger := rm_id;
                  qLock.ExecSQL();
            end;
        end
        else begin
              readOnly := false;
              qLock.ParamByName('lock_usr').AsInteger := frmMain.currentUser;
              qLock.ParamByName('id').AsInteger := rm_id;
              qLock.ExecSQL();
        end
     end;
     updateLockUsrCaption();
end;

procedure TfrmCover.btnRefreshAllClick(Sender: TObject);
begin
    refreshThumbs();
    fLoadPicture := true;
    showPage();
    fLoadPicture := false;
    LockUnlockPage();
end;

procedure TfrmCover.CreateMap(Width, Height:integer; data:TDataSet);
var ly,lx: TStringList;
    i,j,k, cnt: integer;
    W,H:integer;
    tx, ty:integer;
    WB : integer;
    maxW:integer;
begin
     if trim(map_str) = '' then exit;

     ly := TStringList.Create;
     ly.Delimiter := '|';
     ly.DelimitedText := trim(map_str);
     lx := TStringList.Create;
     lx.Delimiter := ',';

     WB := (WIDTH * 50) div 100;
     ty := 0;
     maxW := 0;
     i := 0; k := 0; cnt := CountCells();
     freeMap();
     SetLength(map, cnt);

     while i < ly.Count do
     begin
         tx := 0;
         j := 0;
         lx.Clear;
         lx.DelimitedText := trim(ly[i]);

         H := (HEIGHT - 40) div ly.Count;
         W := (WIDTH - WB) div lx.Count;
         while j < lx.Count do
         begin
              map[k].x := j;
              map[k].y := i;
              map[k].rect.Left := j * W + tx + (WB div 2);
              map[k].rect.Top := i * H + ty;
              map[k].rect.Right := map[k].rect.Left + W;
              map[k].rect.Bottom := map[k].rect.Top + H;

              if i = 0 then
              begin
                  if map[k].rect.Right > maxW then maxW := map[k].rect.Right;
              end
              else if j = lx.Count - 1  then
              begin
                  if map[k].rect.Right <> maxW then map[k].rect.Right := maxW; 
              end;

              map[k].pic := nil;
              map[k].visible := true;
              map[k].color := clSilver;

              map[k].us_id := 0;

              if pos('(', lx[j]) > 0 then
              begin
                    include(map[k].status, stSpecial);
                    map[k].rr_id := strToInt(midStr(lx[j], 2, length(lx[j]) - 2));
              end
              else begin
                  map[k].rr_id := strToInt(lx[j]);
              end;

              if map[k].rr_id in [1..9] then include(map[k].status, stStatic);

              if data.Locate('RR_ID', map[k].rr_id, []) then
              begin
                  map[k].us_id := data.fieldByName('US_ID').AsInteger;

                  if (not data.FieldByName('SMALL_PICTURE').IsNull) and fLoadPicture then
                  begin
                       map[k].pic := TPicture.Create;
                       PictureFromCompressedFieldNew(map[k].pic, TBlobField(data.FieldByName('SMALL_PICTURE')), 'bmp', false);
                  end;

                  include(map[k].status, stReserved);
                  case map[k].us_id of
                        450: map[k].color := clMoneyGreen;
                        else map[k].color := clSkyBlue;
                  end;
                  
                  map[k].comment :=  data.FieldByName('US_NAME').AsString + #13 +
                                     data.FieldByName('AG_NAME').AsString + #13 +
                                     data.FieldByName('COMMENT').AsString;
              end;

              inc(j);
              inc(k);
              if enableTX then inc(tx, 2)
         end;

         inc(i);
         if enableTX then inc(ty, 2)
     end;

     ly.Free;
     lx.Free;
end;

///////////////////////   DRAW PART ////////////////////////////////////////////////

procedure TfrmCover.Draw;
var i,h,j,w,w1 : integer;
    list: TStringList;
    f:boolean;
const
   ML = 5;
   MT = 5;
begin
     if not fEnableDraw then exit;

     img.Canvas.Brush.Color := clBtnFace;
     img.Canvas.FillRect(img.Canvas.ClipRect);

     for i := 0 to length(map) - 1 do
     begin
          if not map[i].visible then continue;

          img.canvas.brush.style := bsSolid;
          img.Canvas.Brush.Color := map[i].color;
          img.Canvas.FillRect(map[i].rect);

          if (stReserved in map[i].status) then
          begin
               h := map[i].rect.Top + MT;
               list := TStringList.Create;
               list.Text := map[i].comment;

               for j := 0 to list.Count - 1 do
               begin
                    f := false;
                    w := img.Canvas.TextWidth(list.Strings[j]);
                    w1 := (map[i].rect.Right - map[i].rect.Left) ;

                    while (w > w1) and (w1 > 0) do
                    begin
                          f := true;
                          list.Strings[j] := leftStr(list.Strings[j], length(list.Strings[j]) - 3);
                          w := img.Canvas.TextWidth(list.Strings[j]) + 20;
                    end;

                    if f then list.Strings[j] := list.Strings[j] + '...';

                    img.Canvas.TextOut(map[i].rect.Left + ML, h, list.Strings[j]);
                    h := h + img.Canvas.TextHeight(list.Strings[j])
               end;

               list.Free;
          end;          

          if assigned(map[i].pic) then
               img.Canvas.StretchDraw(map[i].rect, map[i].pic.Bitmap);

          if (stStatic in map[i].status) then
          begin
              if (map[i].rr_id = 1) then
                     img.Canvas.StretchDraw(map[i].rect, imgPR.Picture.Bitmap)
              else if (map[i].rr_id = 3) then
              begin
                    img.canvas.brush.style := bsSolid;
                    img.Canvas.Brush.Color := clGreen;
                    img.Canvas.FillRect(map[i].rect);
              end
          end;

          if (stSpecial in map[i].status) and fEnableBorder then
          begin
              img.canvas.brush.style := bsClear;
              img.Canvas.Pen.Color := clGreen;
              img.Canvas.Pen.Width := 3;
              img.Canvas.Rectangle(map[i].rect);
          end;

          {if stUnderMouse in map[i].status then
          begin
              img.canvas.brush.style := bsClear;
              img.Canvas.Pen.Color := clAqua;
              img.Canvas.Pen.Width := 3;
              img.Canvas.Rectangle(map[i].rect);
          end; }

          if stSelected in map[i].status then
          begin
              img.canvas.brush.style := bsClear;
              img.Canvas.Pen.Color := clBlue;
              img.Canvas.Pen.Width := 3;
              img.Canvas.Rectangle(map[i].rect);
          end;
     end;
end;


function TfrmCover.CountCells: integer;
var i: integer;
begin
    result := 0;
    for i := 1 to length(map_str) do
         if map_str[i] in [',', '|'] then inc(result);

    if result > 0 then inc(result);
end;

procedure TfrmCover.setUnderMouseCell(cell: PCell; x,y:integer);
var i: integer;
begin
     if map = nil then exit;

     for i := 0 to length(map) - 1 do
               exclude(map[i].status, stUnderMouse);

     if cell = nil then exit;
     oldUnderMouseCell := cell;
     include(cell.status, stUnderMouse);
end;

procedure TfrmCover.selectCell(x, y: integer);
var cell: PCell;
begin
     if map = nil then exit;

     cell := findCell(x,y);
     if cell = nil then exit;

     if stSelected in cell.status then
     begin
          exclude(cell.status, stSelected);
     end
     else begin
              makeSelect(cell);
     end;
end;

procedure TfrmCover.makeSelect(cell:PCell);
begin
     if (frmMain.currentUser = cell.us_id) or (cell.us_id = 0) then include(cell.status, stSelected);
     if  stStatic in cell.status then exclude(cell.status, stSelected);
end;

procedure TfrmCover.mnuReserveClick(Sender: TObject);
begin
     if map = nil then exit;
     if not iSValidSelect() then
     begin
         messageBox(handle, 'Неверно выбран размер модуля!', 'Ошибка', MB_OK or MB_ICONERROR);
         exit;
     end;

     ErrorIssues := '';
     TfrmReserve.Reserve(self, frmMain.currentUser);
     fEnableDraw := false;
     mnuDeselectClick(Sender);
     fEnableDraw := true;
     cdsPage.Locate('RB_NAME_SHORT', lstThumb.Items[oldSelectedItemIdx].Caption, []);
     refreshThumnail();

     if ErrorIssues <> '' then
         messageBox(handle, PAnsiChar('Нельзя зарезервировать\изменть в выбраном месте. № ' +
                    ErrorIssues), 'Ошибка', MB_OK or MB_ICONERROR);
end;

function TfrmCover.findCell(x, y: integer): PCell;
var i: integer;
begin
     result := nil;
     if map = nil then exit;
     for i := 0 to length(map) - 1 do
     begin
          if (x >= map[i].rect.Left) and (x <= map[i].rect.Right) and
             (y >= map[i].rect.Top) and (y <= map[i].rect.Bottom) then
          begin
               result := @map[i];
               exit;
          end
     end;
end;

procedure TfrmCover.mnuDeselectClick(Sender: TObject);
var i:integer;
begin
    isMultiSelect := false;
    for i := 0 to length(map) - 1 do exclude(map[i].status, stSelected);
    Draw();
end;

procedure TfrmCover.mnuUnReserveClick(Sender: TObject);
begin
     if not iSValidSelect() then
     begin
         messageBox(handle, 'Неверно выбран размер модуля!', 'Ошибка', MB_OK or MB_ICONERROR);
         exit;
     end;

     ErrorIssues := '';
     TfrmReserve.UnReserve(self, frmMain.currentUser);

     cdsPage.Locate('RB_NAME_SHORT', lstThumb.Items[oldSelectedItemIdx].Caption, []);

     showPage();
     refreshThumnail();

     if ErrorIssues <> '' then
         messageBox(handle, PAnsiChar('Внимание! Резерв не снят в № ' +
                    ErrorIssues), 'Ошибка', MB_OK or MB_ICONERROR);
end;

procedure TfrmCover.SaveMap();
begin
    qSaveMap.ParamByName('map').AsString := mapToStr(map);
    qSaveMap.ParamByName('id').AsInteger := rm_id;
    qSaveMap.ExecSQL();
end;

function MapToStr(map: TMap): string;
var i,len: integer;
begin
     i := 0;
     len := length(map) - 1;
     result := '';

     while i <= len do
     begin
          if stSpecial in map[i].status then
              result := result + '(' + intToStr(map[i].rr_id) + ')'
          else
              result := result + intToStr(map[i].rr_id);

          if ((i + 1) <= len)  and (map[i + 1].x = 0) then
          begin
               result := result + '|';
          end
          else begin
                if i < len then
                  result := result + ',';
          end;

          inc(i);
     end;
end;

procedure TfrmCover.imgMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
var cell: PCell;
begin
      gX := X; gY := Y;

      cell := findCell(x,y);
      if cell = nil then oldUnderMouseCell := nil;
      if (cell <> memoCell) and memo.Visible then
      begin
           memoCell := nil;
           memo.Visible := false;
      end;
      if assigned(cell) and (GetKeyState(VK_LBUTTON) < 0) then
      begin
          isMultiSelect := true;
          makeSelect(cell);
      end;

      if cell = oldUnderMouseCell then exit;
      setUnderMouseCell(cell, gX, gY);
      Draw();
end;

procedure TfrmCover.imgDblClick(Sender: TObject);
var cell: PCell;
begin
     cell := findCell(gX,gY);
     if cell = nil then exit;

     exclude(cell.status, stSelected);
     memoCell := cell;
     memo.SetBounds(cell.rect.Left + 5, cell.rect.Top + 38, cell.rect.Right - cell.rect.Left - 10, cell.rect.Bottom - cell.rect.Top - 10);
     memo.Lines.Clear;
     memo.Lines.Text := cell.comment;
     memo.Visible := true;
end;

procedure TfrmCover.imgClick(Sender: TObject);
begin
     if isMultiSelect then
     begin
          isMultiSelect := false;
          exit;
     end;

     selectCell(gX, gY);
     Draw();
end;

function TfrmCover.iSValidSelect: boolean;
var i:integer;
    selStart:PCell;
    selRect: TRect;
begin
      result := false;
      selStart := nil;

      for i := 0 to length(map) - 1 do
      begin
            if (stSelected in map[i].status) then
            begin
                 if selStart = nil then
                 begin
                      selStart := @map[i];
                      selRect := selStart.rect;
                 end
                 else begin
                     if (map[i].rect.Right > selRect.Right) then selRect.Right := map[i].rect.Right;
                     if (map[i].rect.Left < selRect.Left) then selRect.Left := map[i].rect.Left;
                     if (map[i].rect.Bottom > selRect.Bottom) then selRect.Bottom := map[i].rect.Bottom;
                     if (map[i].rect.Top < selRect.Top) then selRect.Top := map[i].rect.Top;
                 end;
            end;
      end;

      for i := 0 to length(map) - 1 do
      begin
           if (map[i].rect.Left >= selRect.Left) and (map[i].rect.Right <= selRect.Right) and
              (map[i].rect.Top >= selRect.Top) and (map[i].rect.Bottom <= selRect.Bottom) and
              (map[i].visible) and (not (stSelected in map[i].status)) then exit;
      end;

      result := true;
end;

procedure TfrmCover.FormResize(Sender: TObject);
begin
      pnlRep.Width := (((self.Width * 50) div 100) div 2) - 20;
      pnlPages.Width := pnlRep.Width;
      img.Width := self.Width;
      img.Height := self.Height - 10;

      if lstThumb.Items.Count = 0 then refreshThumbs;
      fLoadPicture := true;
      showPage();
      fLoadPicture := false;
      LockUnlockPage();
end;

procedure TfrmCover.createOneThumb(i:integer);
var bmpS, bmpD: TBitmap;
    sR,dR: TRect;
    item:TListItem;
begin
     bmpS := TBitmap.Create;
     sR := Rect(map[0].rect.Left, map[0].rect.Top,  map[length(map) - 1].rect.Right, map[length(map) - 1].rect.Bottom);
     dR := Rect(0, 0, sR.Right, sR.Bottom);
     bmpS.Width := sR.Right;
     bmpS.Height := sR.Bottom;
     bmpS.Canvas.CopyMode := cmSrcCopy;
     bmpS.Canvas.CopyRect(dR, img.Canvas, sR);
     bmpD := TBitmap.Create;
     bmpD.Width := imgThumbs.Width;
     bmpD.Height := imgThumbs.Height;
     bmpD.Canvas.StretchDraw(Rect(0,0,bmpD.Width,bmpD.Height), bmpS);

     imgThumbs.Insert(i, bmpD, nil);

     item := lstThumb.Items.Insert(i);
     item.Caption := cdsPageRB_NAME_SHORT.AsString;
     item.ImageIndex := i;

     bmpS.Free;
     bmpD.Free;
end;

procedure TfrmCover.createThumbs;
var oldRecNo, i, recNo:integer;
    oldRB_ID, newRB_ID:integer;
begin
     lstThumb.Items.BeginUpdate;
     lstThumb.Items.Clear;
     imgThumbs.Clear;
     cdsGetAllMapsByIssue.Close;
     cdsGetAllMapsByIssue.FetchParams;
     cdsGetAllMapsByIssue.Params.ParamByName('gz_id').AsInteger := cdsGzGZ_ID.AsInteger;
     cdsGetAllMapsByIssue.Params.ParamByName('is_id').AsInteger := cdsIssueIS_ID.AsInteger;
     cdsGetAllMapsByIssue.Open;

     oldRecNo := cdsPage.RecNo;
     i := 0;
     while not cdsGetAllMapsByIssue.Eof do
     begin
           recNo := cdsGetAllMapsByIssue.RecNo;
           oldRB_ID := cdsGetAllMapsByIssueRB_ID.AsInteger;
           newRB_ID := oldRB_ID;

           if cdsGetAllMapsByIssueRM_ID.IsNull then
           begin
                rm_id := -1;
                map_str := cdsGetAllMapsByIssueDEFAULT_MAP.AsString;
           end
           else begin
                  rm_id :=   cdsGetAllMapsByIssueRM_ID.AsInteger;
                  map_str := cdsGetAllMapsByIssuePAGE_MAP.AsString;
           end;

           cdsPage.Locate('RB_ID', cdsGetAllMapsByIssueRB_ID.AsInteger, []);

           CreateMap(img.Width, img.Height, cdsGetAllMapsByIssue);
           joinCells();
           Draw();
           createOneThumb(i);

           inc(i);

           cdsGetAllMapsByIssue.RecNo := recNo;
           while (not cdsGetAllMapsByIssue.Eof) and (newRB_ID = oldRB_ID) do
           begin
                  cdsGetAllMapsByIssue.Next;
                  newRB_ID := cdsGetAllMapsByIssueRB_ID.AsInteger;
           end;
     end;
     freeMap;
     cdsPage.RecNo := oldRecNo;
     lstThumb.Items.EndUpdate;
end;

procedure TfrmCover.cbIssueCloseUp(Sender: TObject);
begin
    if cdsIssueIS_ID.AsInteger < cdsIssueCUR_ISS.AsInteger then readonly := true else readonly := false;
    btnRefreshAllClick(Sender);
end;

procedure TfrmCover.refreshThumbs;
var i:integer;
begin
      i := 0;
      frmWait.Show;
      Application.ProcessMessages;
      if assigned(lstThumb.Selected) then i := lstThumb.Selected.Index;
      enableTX := false;
      fEnableBorder := false;
      createThumbs();
      enableTX := true;
      fEnableBorder := true;
      showPage();
      lstThumb.Selected := lstThumb.Items[i];
      frmWait.Hide
end;

procedure TfrmCover.refreshThumnail();
var i:integer;
begin
  //  frmWait.Show;
 //   Application.ProcessMessages;
    fEnableBorder := false;
    lstThumb.Items.BeginUpdate;
    if assigned(lstThumb.Selected) then i := lstThumb.Selected.Index else i := oldSelectedItemIdx;
    lstThumb.Items.Delete(i);
    imgThumbs.Delete(i);
    enableTX := false;
    showPage();
    enableTX := true;
    createOneThumb(i);
    lstThumb.Items.EndUpdate;
    fLoadPicture := true;
    showPage();
    fLoadPicture := false;
    lstThumb.Selected := lstThumb.Items[oldSelectedItemIdx];
    fEnableBorder := true;
  //  frmWait.Hide;
end;

procedure TfrmCover.lstThumbClick(Sender: TObject);
begin
    if lstThumb.Selected = nil then exit;
    if not cdsPage.Locate('RB_NAME_SHORT', lstThumb.Selected.Caption, []) then exit;

   // frmWait.Show;
  //  Application.ProcessMessages;

    cbPage.KeyValue := cdsPageRB_ID.AsInteger;
    fLoadPicture := true;
    showPage();
    fLoadPicture := false;
    LockUnLockPage();

    if assigned(lstThumb.Selected) then oldSelectedItemIdx := lstThumb.Selected.Index;
   // frmWait.Hide;
end;

procedure TfrmCover.cbGazetaCloseUp(Sender: TObject);
begin
    refreshComboBox();
    btnRefreshAllClick(Sender);
    oldSelectedItemIdx := lstThumb.Items[0].Index;
end;

procedure TfrmCover.refreshComboBox;
begin
    cdsIssue.Close;
    cdsIssue.FetchParams;
    cdsIssue.Params.ParamByName('gz_id').AsInteger := cdsGzGZ_ID.AsInteger;
    cdsIssue.Open;
    cbIssue.KeyValue := cdsIssueCUR_ISS.AsInteger;

    cdsPage.Close;
    cdsPage.FetchParams;
    cdsPage.Params.ParamByName('gz_id').AsInteger := cdsGzGZ_ID.AsInteger;
    cdsPage.Open;
    cbPage.KeyValue := cdsPageRB_ID.AsInteger;
end;

procedure TfrmCover.setReadOnly(value: boolean);
begin
   if cdsIssueIS_ID.AsInteger < cdsIssueCUR_ISS.AsInteger then value := true;
	 fReadOnly := value;

	// Проставим тег в этой метке - по нему при установке
	// прав доступа будет определено, рид-онли ли форма.
    if (self.ReadOnly) then lblIsReadOnly.Tag := 1 else lblIsReadOnly.Tag := 0;

     TAccessRightsManager.SetWindowAccessState(int2user(frmMain.currentUserType), self);
end;

procedure TfrmCover.FormDestroy(Sender: TObject);
begin
    freeMap();

    qUnLockPage.ParamByName('lock_usr').AsInteger := frmMain.currentUser;
    qUnLockPage.ExecSQL();
end;

procedure TfrmCover.mnuChangeClick(Sender: TObject);
begin
     if map = nil then exit;
     if not iSValidSelect() then
     begin
         messageBox(handle, 'Неверно выбран размер модуля!', 'Ошибка', MB_OK or MB_ICONERROR);
         exit;
     end;
          
     ErrorIssues := '';
     TfrmReserve.EditReserve(self, frmMain.currentUser);
     mnuDeselectClick(Sender);
     cdsPage.Locate('RB_NAME_SHORT', lstThumb.Items[oldSelectedItemIdx].Caption, []);
     refreshThumnail();
     
     if ErrorIssues <> '' then
         messageBox(handle, PAnsiChar('Нельзя зарезервировать\изменть в выбраном месте. № ' +
                    ErrorIssues), 'Ошибка', MB_OK or MB_ICONERROR);
end;

procedure TfrmCover.selectByMap(fromMap: TMap);
var i:integer;
begin
     for i := 0 to length(fromMap) - 1 do
     begin
          if stSelected in fromMap[i].status then
                include(map[i].status, stSelected);
     end;
end;

procedure TfrmCover.updateLockUsrCaption;
begin
    if (fLockUsrID = 0) or (frmMain.currentUserType <> 1) then
    begin
         lblUsr.Caption := '';
         exit;
    end;

    qGetLockUsr.Close;
    qGetLockUsr.ParamByName('id').AsInteger := fLockUsrID;
    qGetLockUsr.Open;

    if frmMain.currentUser <> fLockUsrID then
          lblUsr.Caption := 'Блок.: ' + qGetLockUsrUS_NAME.AsString;
end;

procedure TfrmCover.enableDisablePopMenuItems;
var cell:PCell;
begin
    if readonly then exit;
    
    cell := findCell(gx, gy);

    mnuReserve.Enabled := false;
    mnuChange.Enabled := false;
    mnuUnReserve.Enabled := false;
    mnuCopy.Enabled := false;

    if cell = nil then exit;

    if (stSelected in cell.status) and (stUnderMouse in cell.status) then mnuReserve.Enabled := true;

    if (stUnderMouse in cell.status) and (stSelected in cell.status) and (stReserved in cell.status) then
    begin
        mnuChange.Enabled := true;
        mnuUnReserve.Enabled := true;
    end;

    if memo.Visible then mnuCopy.Enabled := true;
end;

procedure TfrmCover.popReservePopup(Sender: TObject);
begin
      enableDisablePopMenuItems();
end;

procedure TfrmCover.freeMap;
var i:integer;
begin
     for i := 0 to length(map) - 1 do freeAndNil(map[i].pic);
     map := nil;
end;

procedure TfrmCover.setErrorIssues(const Value: string);
begin
   if value = '' then
   begin
       fErrorIssues := '';
       exit;
   end;

   if fErrorIssues = '' then
               fErrorIssues := fErrorIssues + value
   else
          fErrorIssues := fErrorIssues + ', ' + value;
end;

procedure TfrmCover.mnuCopyClick(Sender: TObject);
begin
      StrToClipboard(memo.SelText);
end;

procedure TfrmCover.setNewRRID(rr_id: integer);
var i,j, old:integer;
begin
    for i := 0 to length(map) - 1 do
    if (stSelected in map[i].status) then
    begin
         old := map[i].rr_id;
         map[i].rr_id := rr_id;

         if old > 0 then
            for j := 0 to length(map) - 1 do
               if map[j].rr_id = old then map[j].rr_id := rr_id;
    end;
end;

function TfrmCover.getRR_ID: integer;
var i: integer;
begin
     result := -1;
     if map = nil then exit;

     for i := 0 to length(map) - 1 do
     begin
          if (stSelected in map[i].status) then
          begin
               result := map[i].rr_id;
               exit;
          end;
     end;
end;

end.
