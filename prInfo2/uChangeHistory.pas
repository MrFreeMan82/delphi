unit uChangeHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, ExtCtrls, FMTBcd, SqlExpr, Provider,
  DB, DBClient, Buttons;

type
  TfrmChHis = class(TForm)
    pnlHis: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    navHis: TDBNavigator;
    img: TImage;
    dsHistory: TDataSource;
    cdsHistory: TClientDataSet;
    cdsHistoryCREATE_DATE: TSQLTimeStampField;
    cdsHistoryMODIFY_DATE: TSQLTimeStampField;
    cdsHistoryCH_PICTURE: TBlobField;
    cdsHistoryCONTENT_PICTURE: TBlobField;
    prvHistory: TDataSetProvider;
    qHistory: TSQLQuery;
    qHistoryCH_PICTURE: TBlobField;
    qHistoryCREATE_DATE: TSQLTimeStampField;
    qHistoryMODIFY_DATE: TSQLTimeStampField;
    qHistoryCONTENT_PICTURE: TBlobField;
    BitBtn1: TBitBtn;
    ScrollBox: TScrollBox;
    procedure navHisClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    class function ShowHistory(cont_id: integer): TModalResult;
  end;

implementation

uses uChangeObjav, globals;

{$R *.dfm}

{ TfrmChHis }

class function TfrmChHis.ShowHistory(cont_id: integer): TModalResult;
var frmChHis: TfrmChHis;
begin
    frmChHis := TfrmChHis.Create(Application);
    with frmChHis do
    begin
        cdsHistory.Close;
        cdsHistory.FetchParams;
        cdsHistory.Params.ParamByName('cont_id').AsInteger := cont_id;
        cdsHistory.Open;

        navHisClick(frmChHis, nbFirst);
        result := ShowModal;
    end;
    freeAndNil(frmChHis);
end;

procedure TfrmChHis.navHisClick(Sender: TObject; Button: TNavigateBtn);
var pic: TPicture;
    bmp: TBitmap;
begin
    img.Canvas.FillRect(img.Canvas.ClipRect);

    pic := TPicture.Create;
    bmp := TBitmap.Create;

    if cdsHistoryCH_PICTURE.IsNull then
    begin
         if Button in [nbFirst, nbPrior] then
         begin
       //       k := calcWidthKoef(frmChangeObjav.ModuleOrientation);
            //  Streach(frmChangeObjav.originalPic, bmp, img.Width - k, img.Height);
              BMPxGrayScale(bmp);
         end;
    end
    else begin
        PictureFromCompressedFieldNew(pic, cdsHistoryCH_PICTURE, 'bmp', false);
        bmp.Assign(pic.Bitmap);
       // Streach(pic.Bitmap, bmp, img.Width, img.Height);
    end;

    img.Picture.Assign(bmp);// .Canvas.Draw(0, 0, bmp);

    bmp.Free;
    pic.Free;
end;

procedure TfrmChHis.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
    with scrollBox.VertScrollBar do
    begin
        if (wheelDelta < 0) and (position < range)
        then position := position + increment
        else if (position > 0) then position := position - increment
    end;
end;

end.
