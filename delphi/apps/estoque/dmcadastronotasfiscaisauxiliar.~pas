unit dmcadastronotasfiscaisauxiliar;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZPgSqlQuery, cpquery, ZTransact, Math,
  ctconstantes, variants, cpdatasource, dmtecsoft, ZQuery;

type
  TdtmCadastroNotasFiscaisAuxiliar = class(TdtmBasico)
    qryProcuraProdutoNotaFiscal_PEDIDO: TtecQuery;
    qryProcuraProdutoNotaFiscal_NOTASAIDA: TtecQuery;
    qryProcuraProdutoNotaFiscal_NORMAL: TtecQuery;
    qryConsultaProdutosNotaFiscal_NORMAL: TtecQuery;
    qryConsultaProdutosNotaFiscal_NOTASAIDA: TtecQuery;
    qryConsultaProdutosNotaFiscal_PEDIDO: TtecQuery;
    qryEstadosIPI: TtecQuery;
    qryEstadosIPIipi: TIntegerField;
    qryEstadosIPIcodigotipi: TStringField;
    qryEstadosIPIestado: TStringField;
    qryEstadosIPIfatorsubstituicao: TFloatField;
    dsrEstadosIPI: TtecDataSource;
    qryCalculoICMSST: TtecQuery;
    qryCalculoICMSSTproduto: TLargeintField;
    qryCalculoICMSSTnomeproduto: TStringField;
    qryCalculoICMSSTcodigocaracteristica: TLargeintField;
    qryCalculoICMSSTicmscaracteristica: TIntegerField;
    qryCalculoICMSSTpercreducaobase: TFloatField;
    qryCalculoICMSSTquantidade: TFloatField;
    qryCalculoICMSSTprecounitario: TFloatField;
    qryCalculoICMSSTaliquotaipi: TFloatField;
    qryCalculoICMSSTincidencia: TIntegerField;
    qryCalculoICMSSTaliquotaprodutonota: TFloatField;
    qryCalculoICMSSTaliquotadentro: TFloatField;
    qryCalculoICMSSTfator: TFloatField;
    qryCalculoICMSSTcorrecaoicms: TFloatField;
    qryCalculoICMSSTvalortotalsemipi: TFloatField;
    qryCalculoICMSSTvalortotal: TFloatField;
    qryCalculoICMSSTbaseicmstotal: TFloatField;
    qryCalculoICMSSTicmsproprio: TFloatField;
    qryCalculoICMSSTicmsdentro: TFloatField;
    qryCalculoICMSSTicmsfora: TFloatField;
    qryCalculoICMSSTbaseicmstotal2: TFloatField;
    qryCalculoICMSSTvalorsubstituicao: TFloatField;
    dsrCalculoICMSST: TtecDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

   {
var
  dtmCadastroNotasFiscaisAuxiliar: TdtmCadastroNotasFiscaisAuxiliar;}

implementation

uses clparametrossistema;

{$R *.dfm}


end.
