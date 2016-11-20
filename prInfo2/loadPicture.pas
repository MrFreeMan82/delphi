unit loadPicture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ComCtrls, DB, DBClient, SimpleDS,
  FMTBcd, SqlExpr, RegExpr, Provider, Grids, DBGridEh, ExtCtrls,
  GraphicEx, globals, DBCtrls, GridsEh;

type
  TfrmLoadPicture = class(TForm)
    dlgOpen: TOpenDialog;
    pages: TPageControl;
    tab1: TTabSheet;
    edFileName: TDBEditEh;
    Label2: TLabel;
    edCorelPage: TDBEditEh;
    Label3: TLabel;
    edSdelka: TDBEditEh;
    Label1: TLabel;
    tab2: TTabSheet;
    Button1: TButton;
    edAgent: TDBEditEh;
    Label5: TLabel;
    edSdelka2: TDBEditEh;
    Label6: TLabel;
    Button2: TButton;
    qrySdelka: TSQLQuery;
    qrySdelkaSD_ID_COMPOUND: TStringField;
    qrySdelkaAG_NAME: TStringField;
    qrySdelkaCU_NAME: TStringField;
	qrySdelkaPODACHA_NUMS: TStringField;
    edCust: TDBEditEh;
    Label4: TLabel;
    edPodachas: TDBEditEh;
    Label7: TLabel;
    prvSdelka: TDataSetProvider;
    cdsSdelka: TClientDataSet;
    cdsSdelkaSD_ID_COMPOUND: TStringField;
    cdsSdelkaAG_NAME: TStringField;
    cdsSdelkaCU_NAME: TStringField;
    cdsSdelkaPODACHA_NUMS: TStringField;
    dsSdelka: TDataSource;
    qryObjavlenie: TSQLQuery;
    prvObjavlenie: TDataSetProvider;
    cdsObjavlenie: TClientDataSet;
    dsObjavlenie: TDataSource;
    grObjavs: TDBGridEh;
    Label8: TLabel;
    Label9: TLabel;
    qryContent: TSQLQuery;
    prvContent: TDataSetProvider;
    cdsContent: TClientDataSet;
    dsContent: TDataSource;
    qryContentCONTENT_ID: TIntegerField;
    qryContentFM_ID: TIntegerField;
    qryContentRB_ID: TIntegerField;
    qryContentCONTENT_PICTURE: TBlobField;
    qryContentCONTENT_COREL_PAGE: TStringField;
    cdsContentCONTENT_ID: TIntegerField;
    cdsContentFM_ID: TIntegerField;
    cdsContentRB_ID: TIntegerField;
    cdsContentCONTENT_PICTURE: TBlobField;
    cdsContentCONTENT_COREL_PAGE: TStringField;
    Button3: TButton;
    ScrollBox1: TScrollBox;
    img: TImage;
    cbScale: TDBCheckBoxEh;
    qryObjavleniePD_ID: TIntegerField;
    qryObjavlenieOBJAV_ID: TIntegerField;
    qryObjavlenieFM_ID: TIntegerField;
    qryObjavlenieRB_ID: TIntegerField;
    qryObjavlenieFM_NAME: TStringField;
    qryObjavlenieRB_NAME_SHORT: TStringField;
    qryObjavlenieCONTENT_ID: TIntegerField;
    qryObjavlenieFM_PICTURE_SIZES: TStringField;
	cdsObjavleniePD_ID: TIntegerField;
    cdsObjavlenieOBJAV_ID: TIntegerField;
    cdsObjavlenieFM_ID: TIntegerField;
    cdsObjavlenieRB_ID: TIntegerField;
    cdsObjavlenieFM_NAME: TStringField;
    cdsObjavlenieRB_NAME_SHORT: TStringField;
    cdsObjavlenieCONTENT_ID: TIntegerField;
    cdsObjavlenieFM_PICTURE_SIZES: TStringField;
    qryObjavlenieDOUBLE_RB_ID: TIntegerField;
    cdsObjavlenieDOUBLE_RB_ID: TIntegerField;
    spCopySiteObjavs: TSQLStoredProc;
    qryObjavlenieOBJAV_COMMENT: TStringField;
    qryObjavlenieOBJAV_HAS_ATTENTION: TSmallintField;
    cdsObjavlenieOBJAV_COMMENT: TStringField;
    cdsObjavlenieOBJAV_HAS_ATTENTION: TSmallintField;
    qryObjavleniePICTURE_TO_INET: TSmallintField;
    cdsObjavleniePICTURE_TO_INET: TSmallintField;
    qryContentVAC_COUNT: TSmallintField;
    cdsContentVAC_COUNT: TSmallintField;
    qryObjavlenieVAC_COUNT: TSmallintField;
    cdsObjavlenieVAC_COUNT: TSmallintField;
    DBText1: TDBText;
    qObjavlenieUpdate: TSQLQuery;
    spLogModuleLoad: TSQLStoredProc;
    cdsSdelkaSD_ID: TIntegerField;
    qrySdelkaSD_ID: TIntegerField;
    qrySdelkaSD_NUM: TStringField;
    cdsSdelkaSD_NUM: TStringField;
    cdsContentOLD_CONTENT_ID_LINK: TIntegerField;
    qryContentOLD_CONTENT_ID_LINK: TIntegerField;
    qryContentEXTENSION: TStringField;
    cdsContentEXTENSION: TStringField;
    cdsObjavlenieMDL_TEXT: TStringField;
    qryObjavlenieMDL_TEXT: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure edFileNameEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure cdsObjavlenieCONTENT_IDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGridEh1Columns3EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbScaleClick(Sender: TObject);
  private
    { Private declarations }
    sndr: string;
    function CheckSize(W, H: integer):boolean;
    procedure NewContent(oldContentId, newContentId: integer; makeInsert: boolean);
  public
    { Public declarations }

    function loadmodule(sd_num, page: string;sender:string): TModalResult;
  end;

var
  frmLoadPicture: TfrmLoadPicture;

implementation

uses CustUnique, dm, ContentForm, main, uChangeObjav, strUtils;

{$R *.dfm}

procedure TfrmLoadPicture.Button1Click(Sender: TObject);
var
	ag,defPos:integer;
begin
 	if (cdsSdelka.Active) then
		cdsSdelka.Close;

	if (edCorelPage.Text = '') then
	begin
		MessageDlg('Ќе введен номер страницы в Corel!',mtError,[mbOk],0);
		exit;
	end;

	try
		defPos := Pos('-',edSdelka.Text);
		ag := StrToInt(Copy(edSdelka.Text,1,defPos-1));
	//	sd := StrToInt(Copy(edSdelka.Text,defPos+1,length(edSdelka.Text) - defPos));
	except
		MessageDlg('ќшибка в коде сделки!',mtError,[mbOk],0);
		exit;
	end;

	cdsSdelka.Params.ParamByName('AG_ID').AsInteger := ag;
 	cdsSdelka.Params.ParamByName('SD_NUM').AsString := edSdelka.Text;
	cdsSdelka.Open;

	if (cdsSdelka.IsEmpty) then
	begin
		MessageDlg('—делка не найдена!',mtError,[mbOk],0);
		exit;
	end;

	if (cdsObjavlenie.Active) then
		cdsObjavlenie.Close;

	cdsObjavlenie.Params.ParamByName('AG_ID').AsInteger := ag;
	cdsObjavlenie.Params.ParamByName('SD_ID').AsInteger := cdsSdelkaSD_ID.AsInteger;
	cdsObjavlenie.Open;

	if (cdsObjavlenie.IsEmpty) then
	begin
		MessageDlg('ћодульные объ€влени€ к этой сделке не зарегистрированы!',mtError,[mbOk],0);
		exit;
	end;

//  ToDo: ¬ св€зи с изменением формата хранени€ картинок нужно
//  заменить здесь загрузку картинки
  FileToPicture(edFileName.Text, img.Picture);
  pages.ActivePage := tab2;
  grObjavs.SetFocus;
end;

procedure TfrmLoadPicture.edFileNameEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
	if (dlgOpen.Execute) then
		edfileName.Text := dlgOpen.FileName;
end;

procedure TfrmLoadPicture.cdsObjavlenieCONTENT_IDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	if (Sender.IsNull) then
    	Text := ''
    else
    	Text := '[X]'
end;

procedure TfrmLoadPicture.DBGridEh1Columns3EditButtonClick(Sender: TObject;
  var Handled: Boolean);
begin
	if (not cdsObjavlenieCONTENT_ID.IsNull) then
    	TfrmContent.View(cdsObjavlenieCONTENT_ID.AsInteger,
        				 edSdelka.Text,
                         edAgent.Text,
                         edCust.Text,
                         edPodachas.Text);
end;

function TfrmLoadPicture.CheckSize(W, H: integer): boolean;
var
	i: integer;
	slSizes, slDim: TStringList;
	re: TRegExpr;
	wereSizes, sizeFound: boolean;
const
	OTKLONENIE: integer = 20;
begin
  result := true;
	// переменные - "были какие-то размеры" и "размер найден"
	wereSizes := false;
	sizeFound := false;

	// проверим соответствие размеров модул€ формату

	if (cdsObjavlenieFM_PICTURE_SIZES.AsString <> '') then
	begin
		re := nil;
		slSizes := nil;
		slDim := nil;

		try
			re := TRegExpr.Create;
			slSizes := TStringList.Create;
			slDim := TStringList.Create;

			re.Expression := '\;';
			re.Split(cdsObjavlenieFM_PICTURE_SIZES.AsString,slSizes);
			if (slSizes.Count > 0) then
			begin
				// по всем найденным вариантам размеров
				sizeFound := false;
				for i := 0 to slSizes.Count - 1 do
				begin
					if (not sizeFound) then
					begin
						re.Expression := '\*';
						slDim.Clear;
						re.Split(slSizes[i],slDim);

						// проверим один вариант размеров
						if (slDim.Count = 2) then
						begin
							wereSizes := true;

							sizeFound := 	(
												(StrToInt(slDim[0]) - OTKLONENIE < W)
												and
												(W < StrToInt(slDim[0]) + OTKLONENIE)
												and
												(StrToInt(slDim[1]) - OTKLONENIE < H)
												and
												(H < StrToInt(slDim[1]) + OTKLONENIE)
											);
						end;
					end;
				end;
			end;

		finally
			  freeAndNil(re);
			  freeAndNil(slSizes);
			  freeAndNil(sldim);
		end;
	end;

 	if (wereSizes and not sizeFound) then
	begin
		MessageDlg('–азмер модул€ не соответствует требуемому.'#10#13'¬озможные размеры модулей:'
				   + cdsObjavlenieFM_PICTURE_SIZES.AsString + #10#13
				   + '‘актический размер модул€:'
				   + IntToStr(W) + '*' + IntToStr(H)
				   + #10#13 + 'Ётот модуль загрузить нельз€.',
				   mtError,[mbOk],0);
    result := false;
	end;
end;

procedure TfrmLoadPicture.Button2Click(Sender: TObject);
begin

  if not CheckSize(img.Picture.Width, img.Picture.Height) then exit;

  // ѕроверим загружен ли модуль дл€ этого объ€влени€

  if (cdsObjavlenieCONTENT_ID.IsNull) then
  begin
       NewContent(-1, data.nextGeneratorId('G_OBJAV_CONTENT_ID'), true);
  end
  else begin
      cdsContent.Close;
      cdsContent.FetchParams;
      cdsContent.Params.ParamByName('CONTENT_ID').AsInteger := cdsObjavlenieCONTENT_ID.AsInteger;
      cdsContent.Open;

      if cdsContentCONTENT_PICTURE.IsNull then
      begin
          NewContent(-1, cdsObjavlenieCONTENT_ID.AsInteger, false);
      end
      else begin
         if (MessageDlg('ƒл€ этого объ€влени€ модуль уже загружен. ¬ы уверены, что хотите его заменить?',
					   mtConfirmation,[mbYes,mbNo],0) = mrNo) then exit;

         NewContent(cdsObjavlenieCONTENT_ID.AsInteger, data.nextGeneratorId('G_OBJAV_CONTENT_ID'), true);
      end
  end;

	MessageDlg('ћодуль загружен.',mtInformation,[mbOk],0);

	pages.ActivePage := tab1;
  if (sndr = 'TfrmChangeObjav') or (sndr = 'TfrmMdlText') then ModalResult := mrOK;
end;

procedure TfrmLoadPicture.NewContent(oldContentId, newContentId: integer; makeInsert: boolean);
begin
  if not cdsContent.Active then cdsContent.Open;

  if makeInsert then cdsContent.Insert else cdsContent.Edit;

	//newContentId := data.nextGeneratorId('G_OBJAV_CONTENT_ID');
	cdsContentCONTENT_ID.AsInteger			:= newContentId;
	cdsContentFM_ID.AsInteger				:= cdsObjavlenieFM_ID.AsInteger;
	cdsContentRB_ID.AsInteger				:= cdsObjavlenieRB_ID.AsInteger;
	cdsContentVAC_COUNT.AsInteger			:= cdsObjavlenieVAC_COUNT.AsInteger;
	cdsContentCONTENT_COREL_PAGE.AsString	:= edCorelPage.Text;
  cdsContentOLD_CONTENT_ID_LINK.AsInteger := oldContentId;
//  ToDo: ¬ св€зи с изменением формата хранени€ картинок нужно
//  заменить здесь загрузку картинки
  cdsContentEXTENSION.AsString := RightStr(edFileName.Text, length(edFileName.Text) - pos('.', edFileName.Text));
	FileToCompressedField(edFileName.Text,cdsContentCONTENT_PICTURE);
	cdsContent.CheckBrowseMode;
	cdsContent.ApplyUpdates(-1);

	//* TODO: потенциально опасна€ операци€ - нужно бы окружить транзакцией

	// обновим ссылку на  онтент у ќбъ€влени€
  qObjavlenieUpdate.Close;
  qObjavlenieUpdate.ParamByName('OBJAV_ID').AsInteger :=  cdsObjavlenieOBJAV_ID.AsInteger;
  qObjavlenieUpdate.ParamByName('CONTENT_ID').AsInteger := newContentId;
  zero2null(qObjavlenieUpdate.ParamByName('CONTENT_ID'));
  qObjavlenieUpdate.ParamByName('RB_ID').AsInteger := cdsObjavlenieRB_ID.AsInteger;
  qObjavlenieUpdate.ParamByName('FM_ID').AsInteger := cdsObjavlenieFM_ID.AsInteger;
  qObjavlenieUpdate.ParamByName('VAC_COUNT').AsInteger := cdsObjavlenieVAC_COUNT.AsInteger;
  qObjavlenieUpdate.ParamByName('DOUBLE_RB_ID').AsInteger := cdsObjavlenieDOUBLE_RB_ID.AsInteger;
  zero2null(qObjavlenieUpdate.ParamByName('DOUBLE_RB_ID'));
  qObjavlenieUpdate.ParamByName('OBJAV_COMMENT').AsString := cdsObjavlenieOBJAV_COMMENT.AsString;
  qObjavlenieUpdate.ParamByName('OBJAV_HAS_ATTENTION').AsInteger := cdsObjavlenieOBJAV_HAS_ATTENTION.AsInteger;
  qObjavlenieUpdate.ParamByName('PICTURE_TO_INET').AsInteger := cdsObjavleniePICTURE_TO_INET.AsInteger;
  qObjavlenieUpdate.ParamByName('DISTRICT_ID').AsInteger  := 0;
  qObjavlenieUpdate.ParamByName('mdl_text').AsString := '';
  qObjavlenieUpdate.ExecSQL();

  TfrmChangeObjav.setNewCorrectureState(cdsObjavlenieOBJAV_ID.AsInteger);

	// если был старый  онтент - скопируем из него в новый объ€влени€ на сайт
	spCopySiteObjavs.ParamByName('CONTENT_ID_FROM').AsInteger := oldContentId;
	spCopySiteObjavs.ParamByName('CONTENT_ID_TO').AsInteger := newContentId;
	spCopySiteObjavs.ExecProc;

  // ƒобавим лог загрузки модул€

  spLogModuleLoad.ParamByName('US_ID').AsInteger := frmMain.currentUser;
  spLogModuleLoad.ParamByName('OBJAV_ID').AsInteger := cdsObjavlenieOBJAV_ID.AsInteger;
  spLogModuleLoad.ParamByName('CONTENT_ID').AsInteger := newContentId;
  spLogModuleLoad.ParamByName('TYP').AsInteger := 1;
  spLogModuleLoad.ExecProc();
end;

procedure TfrmLoadPicture.Button3Click(Sender: TObject);
begin
	pages.ActivePage := tab1
end;

procedure TfrmLoadPicture.FormShow(Sender: TObject);
begin
	pages.ActivePage := tab1;
end;

procedure TfrmLoadPicture.cbScaleClick(Sender: TObject);
begin
	if (cbScale.Checked) then
    begin
        img.Stretch := true;
        img.Proportional := true;
        img.Align := alClient;
    	img.AutoSize := false;
    end
    else
    begin
        img.Stretch := false;
        img.Proportional := false;
        img.Align := alNone;
    	img.AutoSize := true;
    end;
end;

function TfrmLoadPicture.loadmodule(sd_num, page: string;sender:string): TmodalResult;
begin
    sndr := sender;
    edSdelka.Text := sd_num;
    edCorelPage.Text := page;
    result := ShowModal;
end;

end.
