unit sdelkaPubl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, ExtCtrls, DB, Mask, ComCtrls, oldTexts, Grids,
  DBGrids, objava, Provider, DBClient, DBXpress, SqlExpr, FMTBcd, dm,
  DBGridEh, Variants, globals, GridsEh;

type
  TfrmSdelkaPubl = class(TFrame)
    dsObjav: TDataSource;
    Panel2: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    btAdd: TBitBtn;
    btDelete: TBitBtn;
    grObjavs: TDBGridEh;
    btEdit: TBitBtn;
    cdsObjav: TClientDataSet;
    qryObjav: TSQLQuery;
    btAddPovtor: TBitBtn;
    btView: TBitBtn;
    prvObjav: TDataSetProvider;
    qryObjavIS_OBJAVLENIE: TIntegerField;
    qryObjavAG_ID: TIntegerField;
    qryObjavSD_ID: TIntegerField;
    qryObjavOB_ID: TIntegerField;
    qryObjavOB_STATE: TSmallintField;
    qryObjavOB_STATE_NAME: TStringField;
    qryObjavOB_IS_ACTIVE: TSmallintField;
    qryObjavFM_NAME: TStringField;
    qryObjavRB_NAME: TStringField;
    qryObjavRS_NAME: TStringField;
    qryObjavDOUBLE_RB_NAME: TStringField;
    qryObjavOB_TEXT: TStringField;
    qryObjavOB_COMMENT: TStringField;
    cdsObjavIS_OBJAVLENIE: TIntegerField;
    cdsObjavAG_ID: TIntegerField;
	cdsObjavSD_ID: TIntegerField;
    cdsObjavOB_ID: TIntegerField;
    cdsObjavOB_STATE: TSmallintField;
    cdsObjavOB_STATE_NAME: TStringField;
    cdsObjavOB_IS_ACTIVE: TSmallintField;
    cdsObjavFM_NAME: TStringField;
    cdsObjavRB_NAME: TStringField;
    cdsObjavRS_NAME: TStringField;
    cdsObjavDOUBLE_RB_NAME: TStringField;
    cdsObjavOB_TEXT: TStringField;
    cdsObjavOB_COMMENT: TStringField;
    spGetCurrentPodacha: TSQLStoredProc;
    spCopyObjav: TSQLStoredProc;
    spCopyObjavlenie: TSQLStoredProc;
    spObjavlenieDelete: TSQLStoredProc;
    spObjavlenieInsert: TSQLStoredProc;
    lblIsReadOnly: TLabel;
    btHistory: TBitBtn;
    qryObjavCONTENT_ID: TIntegerField;
    cdsObjavCONTENT_ID: TIntegerField;
    qryObjavOBJAV_HAS_ATTENTION: TSmallintField;
    cdsObjavOBJAV_HAS_ATTENTION: TSmallintField;
    qryObjavGZ_ID: TIntegerField;
    cdsObjavGZ_ID: TIntegerField;
    qryObjavCONTENT_COREL_PAGE: TStringField;
    cdsObjavCONTENT_COREL_PAGE: TStringField;
    qryIsCurrentIssue: TSQLQuery;
    qryIsCurrentIssueCNT2: TIntegerField;
    qryObjavLOAD_DATE: TSQLTimeStampField;
    qryObjavUNLOAD_DATE: TSQLTimeStampField;
    cdsObjavLOAD_DATE: TSQLTimeStampField;
    cdsObjavUNLOAD_DATE: TSQLTimeStampField;
    qContent: TSQLQuery;
    prvContent: TDataSetProvider;
    cdsContent: TClientDataSet;
    cdsContentCONTENT_ID: TIntegerField;
    cdsContentEXTENSION: TStringField;
    cdsContentCONTENT_PICTURE: TBlobField;
    cdsContentRB_ID: TIntegerField;
    cdsContentFM_ID: TIntegerField;
    cdsContentCONTENT_COREL_PAGE: TStringField;
    spCopySiteObjavs: TSQLStoredProc;
    cdsObjavMDL_TXT: TStringField;
    qryObjavMDL_TXT: TStringField;
    cdsContentCONTENT_SITE_OBJAV_ADDED: TSmallintField;
    procedure btAddClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure grObjavsKeyPress(Sender: TObject; var Key: Char);
    procedure btEditClick(Sender: TObject);
    procedure grObjavsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure cdsDoubleReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure btViewClick(Sender: TObject);
    procedure btAddPovtorClick(Sender: TObject);
    procedure btHistoryClick(Sender: TObject);
    procedure cdsObjavOB_TEXTGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
	User:		TUser;
	AgentId:	integer;
	ObjavId:	integer;
	GazetaId:	integer;
	SdelkaId:	integer;


	IsInCurrentIssue: boolean;

	SdelkaCurrentPodacha: integer;
	PodachaIsDone: boolean;

	FldCustId:	TIntegerField;
	PodachaId:	integer;
	FReadOnly:	boolean;

  function canUserEditObjav(user: TUser):boolean;
	procedure SetReadOnly(const Value: boolean);
	function CheckObjavsEditable: boolean;
  public
	doCheckApplied:boolean;
  managerView: boolean;
  objavChanged:boolean;
	function SetSdelka(agid, sdid, objid, gzid: integer; fldCust: TIntegerField; usr: TUser; pdid: integer = -1):boolean;
  published
  	property ReadOnly: boolean read FReadOnly write SetReadOnly;
  end;

implementation

uses editObjav, Reconcile, dmPubl, povtorForAgent, main, objavTypeDlg,
  ObjavlenieForm, accessRights, ObjavlenieHistoryForm, uEditSiteObjavOrder;

{$R *.dfm}


// Добавляем объявление к сделке - открываем окно редактирования объявления
// с новым объявлением
procedure TfrmSdelkaPubl.btAddClick(Sender: TObject);
begin
	if (not CheckObjavsEditable) then exit;

	if (frmObjavType.ShowModal() = mrOk) then
		TfrmEditObjav.Add(AgentId, SdelkaId, GazetaId, User, IsInCurrentIssue)
	else
		TfrmObjavlenie.Add(SdelkaCurrentPodacha, GazetaId, IsInCurrentIssue);
   	cdsObjav.Refresh();
end;


// Удаляем объявление у сделки
procedure TfrmSdelkaPubl.btDeleteClick(Sender: TObject);
begin
	if (not CheckObjavsEditable) then exit;

	if (not grObjavs.DataSource.DataSet.IsEmpty) then
	begin
    	if (cdsObjavIS_OBJAVLENIE.AsInteger = 0) then
	        data.executeQuery('DELETE FROM OBJAV WHERE AG_ID=' + cdsObjavAG_ID.AsString
                              + ' AND SD_ID=' + cdsObjavSD_ID.AsString
                              + ' AND OB_ID=' + cdsObjavOB_ID.AsString)
        else
        begin
        	spObjavlenieDelete.ParamByName('OBJAV_ID').AsInteger := cdsObjavOB_ID.AsInteger;
            spObjavlenieDelete.ExecProc;
        end;
        cdsObjav.Refresh;
	end;
end;

function TfrmSdelkaPubl.canUserEditObjav(user: TUser): boolean;
begin
     result := false;
     case user of
         uCorrector: if cdsObjavOB_STATE.AsInteger in [1, 4, 5, 6] then result := true;
         else result := true;
     end;
end;

// Открываем окно редактирования объявления
procedure TfrmSdelkaPubl.grObjavsKeyPress(Sender: TObject; var Key: Char);
begin
	if (Key = #13) then btEdit.Click;
end;

// Открываем окно редактирования объявления
procedure TfrmSdelkaPubl.btEditClick(Sender: TObject);
var obid: integer;
begin
  if frmMain.pages.ActivePage = frmMain.tabSiteObjav then
  begin

      if (cdsObjavIS_OBJAVLENIE.AsInteger = 0) then
         TfrmEditSiteObjavOrder.ShowSiteObjavOrder(cdsObjavAG_ID.AsInteger, cdsObjavSD_ID.AsInteger, cdsObjavOB_ID.AsInteger, GazetaId)
      else
         TfrmObjavlenie.Edit(cdsObjavOB_ID.AsInteger, GazetaId, IsInCurrentIssue);
  end
  else begin
    	if ((not grObjavs.DataSource.DataSet.IsEmpty) and (btEdit.Enabled)) then
    	begin
		      obid := cdsObjavOB_ID.Value;
    	    if (cdsObjavIS_OBJAVLENIE.AsInteger = 0) then
          begin
              if canUserEditObjav(user) then
                TfrmEditObjav.Edit(cdsObjavAG_ID.Value, cdsObjavSD_ID.Value, cdsObjavOB_ID.Value, cdsObjavGZ_ID.Value, User, IsInCurrentIssue)
          end
		      else
        	    TfrmObjavlenie.Edit(cdsObjavOB_ID.AsInteger, GazetaId, IsInCurrentIssue);
          cdsObjav.Refresh;
	      	cdsObjav.Locate('OB_ID', obid, []);
	    end;
  end;
end;


// При отрисовке списка объявлений делаем текст в строках,
// соответствующих неактивным объявлениям, "серым".
procedure TfrmSdelkaPubl.grObjavsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
    if Column.Field = nil then exit;
    
    if ((cdsObjavOB_STATE.AsInteger = OB_STATE_REPAIR)) or
        (self.managerView and (cdsObjavOB_STATE.AsInteger in [OB_STATE_REPAIR])) or
        objavChanged then
    with  grObjavs.Canvas do
    begin
            if frmMain.currentUserType in [2,3] then
            begin
                   if (gdSelected in State) and (cdsObjav.RecordCount > 1) then
                   begin
                       Brush.Color := clMenuHighlight;
                       Font.Color := clWhite;
                   end
                   else begin
                        if grObjavs.Color = clBtnFace then Brush.Color := clYellow else Brush.Color := clRed;
		                    Font.Color  := clBlack;
                   end;
		               FillRect(Rect);
 		               TextOut(Rect.Left + 2, Rect.Top + 2, Column.Field.Text);
            end;
    end;

    if (Column.Field.FieldName  = 'OB_IS_ACTIVE') then
		begin
        grObjavs.Canvas.FillRect(Rect);

      if Column.Field.Value = 1 then
  			grObjavs.Canvas.Draw(Rect.Left + ((Rect.Right-Rect.Left - 11) div 2), Rect.Top + ((Rect.Bottom - Rect.Top - 11) div 2), frmMain.imgChecked.Picture.Bitmap)
      else begin
          grObjavs.Canvas.Draw(Rect.Left + ((Rect.Right - Rect.Left - 11) div 2), Rect.Top + ((Rect.Bottom - Rect.Top - 11) div 2), frmMain.imgUnchecked.Picture.Bitmap);
      end
		end;

    if (Column.Field.FieldName  = 'OBJAV_HAS_ATTENTION') then
		begin
			grObjavs.Canvas.FillRect(Rect);
      if Column.Field.Value = 1 then
  			grObjavs.Canvas.Draw(Rect.Left + ((Rect.Right-Rect.Left - 11) div 2), Rect.Top + ((Rect.Bottom - Rect.Top - 11) div 2), frmMain.imgChecked.Picture.Bitmap)
      else
        grObjavs.Canvas.Draw(Rect.Left + ((Rect.Right - Rect.Left - 11) div 2), Rect.Top + ((Rect.Bottom - Rect.Top - 11) div 2), frmMain.imgUnchecked.Picture.Bitmap);
		end;

    if (Column.Field.FieldName  = 'MDL_TEXT') then
		begin
			grObjavs.Canvas.FillRect(Rect);
      if Column.Field.AsString <> '' then
  			grObjavs.Canvas.Draw(Rect.Left + ((Rect.Right-Rect.Left - 11) div 2), Rect.Top + ((Rect.Bottom - Rect.Top - 11) div 2), frmMain.imgChecked.Picture.Bitmap)
      else
        grObjavs.Canvas.Draw(Rect.Left + ((Rect.Right - Rect.Left - 11) div 2), Rect.Top + ((Rect.Bottom - Rect.Top - 11) div 2), frmMain.imgUnchecked.Picture.Bitmap);
		end;
end;


// Ошибка при сохранении данных? Запускаем стандартный диалог
procedure TfrmSdelkaPubl.cdsDoubleReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
    if (data.connection.InTransaction) then data.connection.Rollback(tr);
  	Action := HandleReconcileError(DataSet, UpdateKind, E, '');
end;


// Просматриваем объявление в режиме "только для чтения"
procedure TfrmSdelkaPubl.btViewClick(Sender: TObject);
begin
    if ((not grObjavs.DataSource.DataSet.IsEmpty)) then
    begin
    	if (cdsObjavIS_OBJAVLENIE.AsInteger = 0) then
			TfrmEditObjav.View(cdsObjavAG_ID.Value, cdsObjavSD_ID.Value, cdsObjavOB_ID.Value, cdsObjavGZ_ID.Value, User, IsInCurrentIssue)
		else
			TfrmObjavlenie.View(cdsObjavOB_ID.AsInteger, GazetaId, IsInCurrentIssue);
	end;
end;

function resetRubrika(gz_id:integer):integer;
begin
    case gz_id of
        1: result := 119;
        2: result := 238;
        3: result := 118;
        4: result := 200;
        5: result := 374;

        else  result := -1;
    end;
end;


// Добавляем повтор объявления из предыдущих номеров газеты
procedure TfrmSdelkaPubl.btAddPovtorClick(Sender: TObject);
var
	dsToAdd:TDataSet;
  content_id, newContentID: integer;
begin
	if (not CheckObjavsEditable) then exit;

	// Запускаем диалог поиска старого текста
	if (frmPovtorForAgent.getOldText(AgentId, FldCustId.AsInteger, GazetaId, dsToAdd)) then
	begin
		dsToAdd.First;
		while (not dsToAdd.Eof) do
		begin
			// Все объявления, которым пользователь проставил "добавить",
			// копируем в эту сделку
			if (dsToAdd.FieldByName('DO_ADD').AsInteger = 1) then
			begin
       	  if (dsToAdd.FieldByName('IS_OBJAVLENIE').AsInteger = 0) then
          begin
					    spCopyObjav.ParamByName('AG_ID_SRC').AsInteger := dsToAdd.FieldByName('AG_ID').AsInteger;
					    spCopyObjav.ParamByName('SD_ID_SRC').AsInteger := dsToAdd.FieldByName('SD_ID').AsInteger;
					    spCopyObjav.ParamByName('OB_ID_SRC').AsInteger := dsToAdd.FieldByName('OB_ID').AsInteger;
					    spCopyObjav.ParamByName('AG_ID_DST').AsInteger := AgentId;
					    spCopyObjav.ParamByName('SD_ID_DST').AsInteger := SdelkaId;
					    spCopyObjav.ExecProc;
          end
          else begin
       	      spCopyObjavlenie.ParamByName('OBJAV_ID_SRC').AsInteger := dsToAdd.FieldByName('OB_ID').AsInteger;
           	  spCopyObjavlenie.ParamByName('PD_ID_DST').AsInteger	   := SdelkaCurrentPodacha;
              spCOPYObjavlenie.ParamByName('NEW_CONTENT').AsInteger := 0;
              zero2null(spCOPYObjavlenie.ParamByName('NEW_CONTENT'));

              content_id := dsToAdd.FieldByName('CONTENT_ID').AsInteger;
              frmPovtorForAgent.cdsContent.Close;
              frmPovtorForAgent.cdsContent.Params.ParamByName('CONTENT_ID').AsInteger := content_id;
              frmPovtorForAgent.cdsContent.Open;

              cdsContent.Close;
              cdsContent.FetchParams;
              cdsContent.Params.ParamByName('CONTENT_ID').AsInteger := -1;
              cdsContent.Open;

              newContentID := data.nextGeneratorId('G_OBJAV_CONTENT_ID');
              cdsContent.Insert;
              cdsContentCONTENT_ID.AsInteger := newContentID;
              cdsContentRB_ID.AsInteger := resetRubrika(GazetaId);
              cdsContentFM_ID.AsInteger := frmPovtorForAgent.cdsContentFM_ID.AsInteger;
              cdsContentEXTENSION.AsString := frmPovtorForAgent.cdsContentEXTENSION.AsString;
              cdsContentCONTENT_COREL_PAGE.AsString := frmPovtorForAgent.cdsContentCONTENT_COREL_PAGE.AsString;
              cdsContentCONTENT_SITE_OBJAV_ADDED.AsInteger := frmPovtorForAgent.cdsContentCONTENT_SITE_OBJAV_ADDED.AsInteger;
              CopyCompressedField(frmPovtorForAgent.cdsContentCONTENT_PICTURE, cdsContentCONTENT_PICTURE);
              cdsContent.CheckBrowseMode;
	            cdsContent.ApplyUpdates(-1);

              spCopySiteObjavs.ParamByName('CONTENT_ID_FROM').AsInteger := content_id;
	            spCopySiteObjavs.ParamByName('CONTENT_ID_TO').AsInteger := newContentID;
	            spCopySiteObjavs.ExecProc;

              spCOPYObjavlenie.ParamByName('NEW_CONTENT').AsInteger := newContentID;
              spCopyObjavlenie.ExecProc;
          end;
			end;
			dsToAdd.Next;
		end;

   	    cdsObjav.CheckBrowseMode;
       	cdsObjav.ApplyUpdates(0);
        cdsObjav.Refresh;
   	end;
end;

function TfrmSdelkaPubl.SetSdelka(agid, sdid, objid, gzid: integer;
  fldCust: TIntegerField; usr: TUser; pdid: integer): boolean;
begin
	doCheckApplied:=false;

	Result := false;

	User	  := usr;
	AgentId	  := agid;
	SdelkaId  := sdid;
	ObjavId	  := objid;
	GazetaId  := gzid;
	FldCustId := fldCust;
	PodachaId := pdid;

    SdelkaCurrentPodacha := -1;
	PodachaIsDone        := true;

	qryIsCurrentIssue.ParamByName('AG_ID').AsInteger := agid;
	qryIsCurrentIssue.ParamByName('SD_ID').AsInteger := sdid;
	if (qryIsCurrentIssue.Active) then qryIsCurrentIssue.Close();
	qryIsCurrentIssue.Open();
	qryIsCurrentIssue.First();
	IsInCurrentIssue := (qryIsCurrentIssue.FieldByName('CNT').AsInteger <> 0);


    if (not (PodachaId > 0)) then
    begin
	    spGetCurrentPodacha.ParamByName('AG_ID').AsInteger := agid;
    	spGetCurrentPodacha.ParamByName('SD_ID').AsInteger := sdid;
	    spGetCurrentPodacha.ExecProc;

		if (not spGetCurrentPodacha.ParamByName('PD_ID').IsNull) then
			SdelkaCurrentPodacha := spGetCurrentPodacha.ParamByName('PD_ID').AsInteger;
    	if (spGetCurrentPodacha.ParamByName('PD_IS_DONE').AsInteger = 0) then
	    	PodachaIsDone  := false
	    else
		    PodachaIsDone  := true;

		PodachaId := SdelkaCurrentPodacha;
    end;

    // Если нету текущей подачи, или текущая подача - уже вышла, то
    // установим запрет на редактирование объявлений
    if ((not (SdelkaCurrentPodacha > 0)) or (PodachaIsDone)) then ReadOnly := true;

	if (cdsObjav.Active) then cdsObjav.Close;

	cdsObjav.Params.ParamByName('AG_ID').AsInteger		   := AgentId;
	cdsObjav.Params.ParamByName('SD_ID').AsInteger		   := SdelkaId;
	cdsObjav.Params.ParamByName('CURRENT_PD_ID').AsInteger := PodachaId;

	if (not cdsObjav.Active) then cdsObjav.Open
	else cdsObjav.Refresh;

	cdsObjav.Locate('OB_ID',ObjavId,[]);
end;

procedure TfrmSdelkaPubl.SetReadOnly(const Value: boolean);
begin
	FReadOnly := Value;

    // Проставим тег в этой метке - по нему при установке
    // прав доступа будет определено, рид-онли ли форма.
    if (ReadOnly) then
        lblIsReadOnly.Tag := 1
    else
        lblIsReadOnly.Tag := 0;

    TAccessRightsManager.SetWindowAccessState(self.User,self);
end;

procedure TfrmSdelkaPubl.btHistoryClick(Sender: TObject);
begin
	TfrmObjavlenieHistory.View(AgentId, SdelkaId, GazetaId, FldCustId, User);
end;

function TfrmSdelkaPubl.CheckObjavsEditable: boolean;
begin
	Result := false;

	if ((SdelkaCurrentPodacha > 0) and (not PodachaIsDone)) then Result := true
  else MessageDlg('Редактировать список объявлений можно только у сделки, у которой вышли ещё не все подачи.',mtError,[mbOk],0);
end;

procedure TfrmSdelkaPubl.cdsObjavOB_TEXTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	if (    (Sender.DataSet.FieldByName('IS_OBJAVLENIE').AsInteger = 1)
		and ( not Sender.DataSet.FieldByName('CONTENT_ID').IsNull)
		and (Sender.DataSet.FieldByName('CONTENT_ID').AsInteger > 0))
    and (not Sender.DataSet.FieldByName('CONTENT_COREL_PAGE').IsNull) then
	begin
		Text := '[';
		if (Sender.DataSet.FieldByName('CONTENT_COREL_PAGE').Value <> '') then
			Text := Text + 'с.' + Sender.DataSet.FieldByName('CONTENT_COREL_PAGE').AsString + ', ';
		Text := Text + 'Модуль загружен]'
	end
    else
    	Text := Sender.AsString;
end;

end.

