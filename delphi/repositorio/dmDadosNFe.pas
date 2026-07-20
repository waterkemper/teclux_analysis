unit dmDadosNFe;

interface

uses
  SysUtils, Classes, dmtecsoft, dmbasico, DB, cpdatasource, ZQuery,
  ZPgSqlQuery, cpquery;

type
  TdtmDadosNFe = class(TDtmBasico)
    qrytrib_entrada_item_imposto: TtecQuery;
    dsrtrib_entrada_item_imposto: TtecDataSource;
    qrytrib_saida_item_imposto: TtecQuery;
    dsrtrib_saida_item_imposto: TtecDataSource;
    qrytrib_saida_item_impostodadofiscal: TIntegerField;
    qrytrib_saida_item_impostoproduto: TLargeintField;
    qrytrib_saida_item_impostonumero: TIntegerField;
    qrytrib_saida_item_impostocodigo_cst_cbsibs: TStringField;
    qrytrib_saida_item_impostocclasstrib_cbsibs: TStringField;
    qrytrib_saida_item_impostovbc_cbsibs: TFloatField;
    qrytrib_saida_item_impostopaliq_cbs: TFloatField;
    qrytrib_saida_item_impostovimposto_cbs: TFloatField;
    qrytrib_saida_item_impostopaliq_ibsuf: TFloatField;
    qrytrib_saida_item_impostovimposto_ibsuf: TFloatField;
    qrytrib_saida_item_impostopaliq_ibsmun: TFloatField;
    qrytrib_saida_item_impostovimposto_ibsmun: TFloatField;
    qryTotais_trib_saida_item_imposto: TtecQuery;
    dsrTotais_trib_saida_item_imposto: TtecDataSource;
    qryTotais_trib_saida_item_impostovbc_cbsibs: TFloatField;
    qryTotais_trib_saida_item_impostovimposto_cbs: TFloatField;
    qryTotais_trib_saida_item_impostovimposto_ibsuf: TFloatField;
    qryTotais_trib_saida_item_impostovimposto_ibsmun: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmDadosNFe: TdtmDadosNFe;

implementation

{$R *.dfm}

end.
