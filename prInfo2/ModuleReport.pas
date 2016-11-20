unit ModuleReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, GraphicEx,
  QRPrntr, RvClass, RvCsStd, RvCsData;

type
  TrepModule = class(TQuickRep)
    imgActualSize: TQRImage;
    QRBand1: TQRBand;
    imgZoomed: TQRImage;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    lblFormat: TQRLabel;
    lblRubrika: TQRLabel;
    lblSdelka: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    lblCust: TQRLabel;
    QRLabel7: TQRLabel;
    lblAgent: TQRLabel;
    QRLabel9: TQRLabel;
    lblIssue: TQRLabel;
    QRLabel1: TQRLabel;
    lblCorelPage: TQRLabel;
  private

  public
  procedure PreviewRave(APictureField: TBLOBField; ASdelka, AAgent, ACust, AFormat, ARubrika, ACorelPage, AIssue: String);
  end;

var
  repModule: TrepModule;

implementation

uses globals, ModuleReportParamsForm, dmCache, dm, Dialogs, StrUtils;

{$R *.DFM}

{ TrepModule }

procedure TrepModule.PreviewRave(APictureField: TBLOBField; ASdelka,
  AAgent, ACust, AFormat, ARubrika, ACorelPage, AIssue: String);

var TmpRaveComp, img, imgZoom: TRaveComponent;
    pic: TPicture;
    o,p : integer;
begin
  cacheData.rvpRepAcc.SelectReport('mdPrint', false);

	if (frmModuleReportParams.ShowModal <> mrOk) then exit;


  if frmModuleReportParams.rgbFormat.ItemIndex = 0 then
     cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage.PaperSize := 11
  else
     cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage.PaperSize := 9;


  img := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('imgModule', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);
  imgZoom := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('imgModuleZoom', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);

  if (img <> nil) then
  begin
      if frmModuleReportParams.cbActualSize.Checked then
      begin
          o := 1;// StrToInt(LeftStr(s, pos(',',s) - 1));
          p := 300; //StrToInt(RightStr(s, length(s) - pos(',', s)));

          pic := TPicture.Create;
//  ToDo: В связи с изменением формата хранения картинок нужно
//  заменить здесь загрузку картинки          
          PictureFromCompressedFieldNew(pic, APictureField, '', false);

          TRaveBitmap(img).Image.Assign(Pic);

          TRaveBitmap(img).Width  := o * TRaveBitmap(img).Image.Width / p;
	 	      TRaveBitmap(img).Height := o * TRaveBitmap(img).Image.Height / p;

          FreeAndNil(pic)
      end
      else begin
          TRaveBitmap(img).Width  := 0;
          TRaveBitmap(img).Height := 0;
      end;
  end;

  if imgZoom <> nil then
  begin
      if frmModuleReportParams.cbZoomed.Checked then
      begin
          o := 1;
          p := 150;

          pic := TPicture.Create;
//  ToDo: В связи с изменением формата хранения картинок нужно
//  заменить здесь загрузку картинки          
          PictureFromCompressedFieldNew(pic, APictureField, '', false);
          TRaveBitmap(imgZoom).Image.Assign(pic);

          if frmModuleReportParams.cbActualSize.Checked then
              TRaveBitmap(imgZoom).Top := TRaveBitmap(img).Bottom + 0.05
          else
              TRaveBitmap(imgZoom).Top := TRaveBitmap(img).Top;

          TRaveBitmap(imgZoom).Width  := o * TRaveBitmap(imgZoom).Image.Width / p;
	 	      TRaveBitmap(imgZoom).Height := o * TRaveBitmap(imgZoom).Image.Height / p;

          FreeAndNil(pic);
      end
      else begin
          TRaveBitmap(imgZoom).Width  := 0;
          TRaveBitmap(imgZoom).Height := 0;
      end;
  end;

  TmpRaveComp := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('txtSD_NUM', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);
  if (TmpRaveComp <> nil) and (TmpRaveComp is TRaveText)  then TRaveText(TmpRaveComp).Text := ASdelka;

  TmpRaveComp := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('txtIS', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);
  if (TmpRaveComp <> nil) and (TmpRaveComp is TRaveText)  then TRaveText(TmpRaveComp).Text := AIssue;

  TmpRaveComp := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('txtRub', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);
  if (TmpRaveComp <> nil) and (TmpRaveComp is TRaveText)  then TRaveText(TmpRaveComp).Text := ARubrika;

  TmpRaveComp := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('txtPage', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);
  if (TmpRaveComp <> nil) and (TmpRaveComp is TRaveText)  then TRaveText(TmpRaveComp).Text := ACorelPage;

  TmpRaveComp := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('txtAG', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);
  if (TmpRaveComp <> nil) and (TmpRaveComp is TRaveText)  then TRaveText(TmpRaveComp).Text := AAgent;

  TmpRaveComp := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('txtCL', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);
  if (TmpRaveComp <> nil) and (TmpRaveComp is TRaveText)  then TRaveText(TmpRaveComp).Text := ACust;

  TmpRaveComp := cacheData.rvpRepAcc.ProjMan.FindRaveComponent('txtFT', cacheData.rvpRepAcc.ProjMan.ActiveReport.FirstPage);
  if (TmpRaveComp <> nil) and (TmpRaveComp is TRaveText)  then TRaveText(TmpRaveComp).Text := AFormat;

  cacheData.rvpRepAcc.Execute;
end;

end.
