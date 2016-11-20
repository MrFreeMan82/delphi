program PrInfo2;
uses
  Forms,
  Windows,
  main in 'main.pas' {frmMain},
  sdelka in 'sdelka.pas' {frmSdelka: TFrame},
  dm in 'dm.pas' {data: TDataModule},
  cust in 'cust.pas' {frmCust: TFrame},
  custForm in 'custForm.pas' {frmCustForm},
  sdelkaForm in 'sdelkaForm.pas' {frmSdelkaForm},
  editPodacha in 'editPodacha.pas' {frmEditPodacha},
  editPhone in 'editPhone.pas' {frmEditPhone},
  agentSummary in 'agentSummary.pas' {frmAgentSummary},
  findSdelka in 'findSdelka.pas' {frmFindSdelka},
  chooseUser in 'chooseUser.pas' {frmChooseUser},
  wait in 'wait.pas' {frmWait},
  ChangeAgentForSdelka in 'ChangeAgentForSdelka.pas' {frmChangeAgentForSdelka},
  dmRep in 'dmRep.pas' {repData: TDataModule},
  custEdit in 'custEdit.pas' {frmCustEdit},
  dmPubl in 'dmPubl.pas' {publData: TDataModule},
  sdelkaPubl in 'sdelkaPubl.pas' {frmSdelkaPubl: TFrame},
  sdelkaPublForm in 'sdelkaPublForm.pas' {frmSdelkaPublForm},
  editObjav in 'editObjav.pas' {frmEditObjav},
  objava in 'objava.pas' {frmObjava: TFrame},
  Reconcile in 'Reconcile.pas' {ReconcileErrorForm},
  povtorForAgent in 'povtorForAgent.pas' {frmPovtorForAgent},
  ReconcileFull in 'ReconcileFull.pas' {ReconcileErrorFormFull},
  CustUnique in 'CustUnique.pas' {frmCustUnique: TFrame},
  newAccount in 'newAccount.pas' {frmNewAccount},
  accessRights in 'accessRights.pas',
  spellChecker in 'spellChecker.pas',
  loadPicture in 'loadPicture.pas' {frmLoadPicture},
  htmlReport in 'htmlReport.pas',
  globals in 'globals.pas',
  ContentFrame in 'ContentFrame.pas' {frameContent: TFrame},
  ContentForm in 'ContentForm.pas' {frmContent},
  ObjavlenieFrame in 'ObjavlenieFrame.pas' {frameObjavlenie: TFrame},
  ObjavlenieForm in 'ObjavlenieForm.pas' {frmObjavlenie},
  objavTypeDlg in 'objavTypeDlg.pas' {frmObjavType},
  ObjavlenieHistoryForm in 'ObjavlenieHistoryForm.pas' {frmObjavlenieHistory},
  SiteObjavFrame in 'SiteObjavFrame.pas' {frameSiteObjav: TFrame},
  SiteObjavForm in 'SiteObjavForm.pas' {frmSiteObjav},
  ModuleReportParamsForm in 'ModuleReportParamsForm.pas' {frmModuleReportParams},
  objavaAudit in 'objavaAudit.pas' {frmObjavaAudit},
  dmCache in 'dmCache.pas' {cacheData: TDataModule},
  inetImport in 'inetImport.pas' {frmInetImport},
  uSdelkaRep in 'uSdelkaRep.pas' {frmPrint},
  uAuditSdelka in 'uAuditSdelka.pas' {frmSdelkaHistory},
  RPDefine,
  SysUtils,
  Dialogs,
  uNewFormat in 'uNewFormat.pas' {frmNewFormat},
  uAdminSdelka in 'uAdminSdelka.pas' {frmControlSdelka},
  uSelectGazetaNum in 'uSelectGazetaNum.pas' {frmSelectGZNum},
  uSiteObjav in 'uSiteObjav.pas' {frmSite_Objav},
  uEditSiteObjavOrder in 'uEditSiteObjavOrder.pas' {frmEditSiteObjavOrder},
  uEditSiteObjav in 'uEditSiteObjav.pas' {frmEditSiteObjav},
  uNewRubrika in 'uNewRubrika.pas' {frmNewRubrika},
  uChangeObjav in 'uChangeObjav.pas' {frmChangeObjav},
  uChangeHistory in 'uChangeHistory.pas' {frmChHis},
  uCover in 'uCover.pas' {frmCover},
  uReserve in 'uReserve.pas' {frmReserve},
  uPropStorage in 'uPropStorage.pas',
  uMdlText in 'uMdlText.pas' {frmMdlText},
  uNaborshic in 'uNaborshic.pas' {frmNabor},
  uDesign in 'uDesign.pas' {frmDesign};

{$R *.res}
//{$SetPEFlags IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP or IMAGE_FILE_NET_RUN_FROM_SWAP}

begin
  RPDefine.DataID := IntToStr(Application.Handle);

  Application.Initialize;
  Application.CreateForm(Tdata, data);
  Application.CreateForm(TcacheData, cacheData);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmCustEdit, frmCustEdit);
  Application.CreateForm(TfrmCustForm, frmCustForm);
  Application.CreateForm(TfrmNewAccount, frmNewAccount);
  Application.CreateForm(TfrmEditPodacha, frmEditPodacha);
  Application.CreateForm(TfrmEditPhone, frmEditPhone);
  Application.CreateForm(TfrmAgentSummary, frmAgentSummary);
  Application.CreateForm(TfrmFindSdelka, frmFindSdelka);
  Application.CreateForm(TfrmChooseUser, frmChooseUser);
  Application.CreateForm(TfrmWait, frmWait);
  Application.CreateForm(TfrmChangeAgentForSdelka, frmChangeAgentForSdelka);
  Application.CreateForm(TrepData, repData);
  Application.CreateForm(TfrmPovtorForAgent, frmPovtorForAgent);
  Application.CreateForm(TfrmLoadPicture, frmLoadPicture);
  Application.CreateForm(TfrmObjavType, frmObjavType);
  Application.CreateForm(TfrmSiteObjav, frmSiteObjav);
  Application.CreateForm(TfrmModuleReportParams, frmModuleReportParams);
  Application.CreateForm(TfrmObjavaAudit, frmObjavaAudit);
  Application.CreateForm(TfrmInetImport, frmInetImport);
  Application.CreateForm(TfrmChangeObjav, frmChangeObjav);
  Application.CreateForm(TfrmMdlText, frmMdlText);
  Application.Run;
end.
