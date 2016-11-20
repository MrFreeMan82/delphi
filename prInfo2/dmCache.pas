unit dmCache;

interface

uses
  SysUtils, Classes, FMTBcd, DBClient, Provider, DB, SqlExpr, RpBase,
  RpSystem, RpDefine, RpRave;

type TCopySiteObjav = record
     site_objav_id:integer;
end;

type TArrCopySiteObjav = array of TCopySiteObjav;

type
  TcacheData = class(TDataModule)
    qryRubrika: TSQLQuery;
    prvRubrika: TDataSetProvider;
    cdsRubrika: TClientDataSet;
    qryRubrikaSite: TSQLQuery;
    prvRubrikaSite: TDataSetProvider;
    cdsRubrikaSite: TClientDataSet;
    qryRubrikaPohozha: TSQLQuery;
    prvRubrikaPohozha: TDataSetProvider;
    cdsRubrikaPohozha: TClientDataSet;
    qryRubrikaRB_ID: TIntegerField;
    qryRubrikaRB_NAME: TStringField;
    qryRubrikaRB_NAME_SHORT: TStringField;
    qryRubrikaRB_COST_COEFF: TFloatField;
    qryRubrikaRB_IS_OBLOGKA: TSmallintField;
    qryRubrikaGZ_ID: TIntegerField;
    qryRubrikaRB_IS_HOT: TSmallintField;
    qryRubrikaRB_IS_LOCKABLE: TSmallintField;
    qryRubrikaSiteRS_ID: TIntegerField;
    qryRubrikaSiteRS_NAME: TStringField;
    qryRubrikaPohozhaRS_ID: TIntegerField;
    qryRubrikaPohozhaRB_ID: TIntegerField;
    cdsRubrikaRB_ID: TIntegerField;
    cdsRubrikaRB_NAME: TStringField;
    cdsRubrikaRB_NAME_SHORT: TStringField;
    cdsRubrikaRB_COST_COEFF: TFloatField;
    cdsRubrikaRB_IS_OBLOGKA: TSmallintField;
    cdsRubrikaGZ_ID: TIntegerField;
    cdsRubrikaRB_IS_HOT: TSmallintField;
    cdsRubrikaRB_IS_LOCKABLE: TSmallintField;
    cdsRubrikaSiteRS_ID: TIntegerField;
    cdsRubrikaSiteRS_NAME: TStringField;
    cdsRubrikaPohozhaRS_ID: TIntegerField;
    cdsRubrikaPohozhaRB_ID: TIntegerField;
    qryFormat: TSQLQuery;
    prvFormat: TDataSetProvider;
    cdsFormat: TClientDataSet;
    qryFormatFM_ID: TIntegerField;
    qryFormatFM_NAME: TStringField;
    qryFormatFM_SPACE: TFloatField;
    qryFormatFM_ALWAYS_ADD_SUM: TSmallintField;
    qryFormatFM_HAS_PICTURE: TSmallintField;
    qryFormatFM_PICTURE_SIZES: TStringField;
    cdsFormatFM_ID: TIntegerField;
    cdsFormatFM_NAME: TStringField;
    cdsFormatFM_SPACE: TFloatField;
    cdsFormatFM_ALWAYS_ADD_SUM: TSmallintField;
    cdsFormatFM_HAS_PICTURE: TSmallintField;
    cdsFormatFM_PICTURE_SIZES: TStringField;
    cdsRubrikaPohozhaRS_NAME: TStringField;
    rvpRepAcc: TRvProject;
    rvsRepAcc: TRvSystem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cacheData: TcacheData;
  arrCopySiteObjav: TArrCopySiteObjav;

implementation

uses dm;

{$R *.dfm}

end.
