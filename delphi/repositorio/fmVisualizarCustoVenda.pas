unit fmVisualizarCustoVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, cpdatasource, ZQuery, ZPgSqlQuery, cpquery, dmbasico,
  fmajuda, dmtecsoft, Grids, DBGrids, cpdbgrid, ExtCtrls, StdCtrls, Mask,
  DBCtrls, Provider, DBClient, ctconstantes, cpdbtext, ComCtrls, clusuario, biblio;

type
  TfrmVisualizarCustoVenda = class(TFrmAjuda)
    dsrProdutos: TtecDataSource;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    dbgProdutos: TtecDBGrid;
    lblSomaTotalVenda: TStaticText;
    dtxSomaTotalVenda: TtecDBText;
    lblSomadescontofinanceiro: TStaticText;
    dtxSomadescontofinanceiro: TtecDBText;
    lblSomaacrescimofinanceiro: TStaticText;
    dtxSomaacrescimofinanceiro: TtecDBText;
    lblSomaFrete: TStaticText;
    dtxSomaFrete: TtecDBText;
    lblSomaSeguro: TStaticText;
    dtxSomaSeguro: TtecDBText;
    lblSomaValorICMS: TStaticText;
    dtxSomaICMSValor: TtecDBText;
    lblSomapisvalor: TStaticText;
    dtxSomapisvalor: TtecDBText;
    lblSomaCofinsValor: TStaticText;
    dtxSomaCofinsValor: TtecDBText;
    lblSomaTotalCusto: TStaticText;
    dtxSomaTotalCusto: TtecDBText;
    dtxSomaPercentualTotalCusto: TtecDBText;
    lblSomaVendaBruta: TStaticText;
    dtxSomaVendaBruta: TtecDBText;
    StaticText1: TStaticText;
    dtxMargemBrutaTotaisLucroReal: TtecDBText;
    lblSomaMargemLucro: TStaticText;
    dtxSomaMargemLucro: TtecDBText;
    dtxPercentualMargemLucro: TtecDBText;
    StaticText7: TStaticText;
    dtxTotalServicos: TtecDBText;
    StaticText8: TStaticText;
    dtxTotalProdutos: TtecDBText;
    dbgServicos: TtecDBGrid;
    StaticText14: TStaticText;
    dtxSomaValorISSQN: TtecDBText;
    gbxVenda: TGroupBox;
    pnlDesconto: TPanel;
    pnlBrutoProdutos: TPanel;
    StaticText16: TStaticText;
    dtxTotalItens: TtecDBText;
    pnlAcrescimo: TPanel;
    pnlFrete: TPanel;
    pnlSeguro: TPanel;
    pnlTotalVenda: TPanel;
    pnlTotalServicos: TPanel;
    pnlMargemBruta: TPanel;
    pnlTotaldoiCusto: TPanel;
    pnlLiquidoProdutos: TPanel;
    gbxLucroReal: TGroupBox;
    pgcLucroReal: TPageControl;
    tstTotaisLucroReal: TTabSheet;
    tstProdutosLucroReal: TTabSheet;
    tstServicosLucroReal: TTabSheet;
    pnlMargemBrutaTotaisLucroReal: TPanel;
    pnlCofinsTotaisLucroReal: TPanel;
    pnlPISTotaisLucroReal: TPanel;
    pnlICMSTotaisLucroReal: TPanel;
    pnlMargemLucroTotaisLucroReal: TPanel;
    Panel1: TPanel;
    StaticText2: TStaticText;
    dtxMargemBrutaTotaisProdutosLucroReal: TtecDBText;
    Panel2: TPanel;
    StaticText9: TStaticText;
    dtxSomaICMSValorProdutos: TtecDBText;
    Panel4: TPanel;
    StaticText18: TStaticText;
    dtxSomapisvalorprodutos: TtecDBText;
    Panel5: TPanel;
    StaticText19: TStaticText;
    dtxSomaCofinsValorCofins: TtecDBText;
    Panel7: TPanel;
    StaticText21: TStaticText;
    dtxSomaMargemLucroProdutos: TtecDBText;
    dtxPercentualMargemLucroProdutos: TtecDBText;
    pnlISSQNTotaisLucroReal: TPanel;
    Panel8: TPanel;
    StaticText10: TStaticText;
    dtxtotalservico: TtecDBText;
    Panel11: TPanel;
    StaticText13: TStaticText;
    dtxpisvalorservicos: TtecDBText;
    Panel12: TPanel;
    StaticText15: TStaticText;
    dtxcofinsvalorservicos: TtecDBText;
    Panel14: TPanel;
    StaticText23: TStaticText;
    dtxvalorissqn: TtecDBText;
    Panel15: TPanel;
    StaticText24: TStaticText;
    dtxSomaMargemLucroServicos: TtecDBText;
    dtxPercentualMargemLucroServicos: TtecDBText;
    gbxSimplesNacional: TGroupBox;
    pgcSimplesNacional: TPageControl;
    tstTotaisSimplesNacional: TTabSheet;
    Panel9: TPanel;
    StaticText4: TStaticText;
    dtxMargemBrutaTotalSN: TtecDBText;
    Panel17: TPanel;
    StaticText25: TStaticText;
    dtxSNServicos: TtecDBText;
    Panel18: TPanel;
    StaticText26: TStaticText;
    dtxSNProdutos: TtecDBText;
    Panel19: TPanel;
    StaticText27: TStaticText;
    dtxSomaMargemLucroSN: TtecDBText;
    dtxPercentualMargemLucroSN: TtecDBText;
    tstProdutosSimpleNacional: TTabSheet;
    Panel21: TPanel;
    StaticText29: TStaticText;
    dtxMargemBrutaSNProdutos: TtecDBText;
    Panel22: TPanel;
    StaticText30: TStaticText;
    dtxSNProdutosP: TtecDBText;
    Panel27: TPanel;
    StaticText35: TStaticText;
    dtxSomaMargemLucroSNProdutos: TtecDBText;
    dtxPercentualMargemLucroSNProdutos: TtecDBText;
    tstSimplesSimpleNacional: TTabSheet;
    Panel28: TPanel;
    StaticText36: TStaticText;
    dtxtotalservicoSN: TtecDBText;
    Panel29: TPanel;
    StaticText37: TStaticText;
    dtxSNServicosSN: TtecDBText;
    Panel32: TPanel;
    StaticText40: TStaticText;
    dtxSomaMargemLucroSNServicos: TtecDBText;
    dtxPercentualMargemLucroSNServicos: TtecDBText;
    pnlIPI: TPanel;
    lblSomaIPI: TStaticText;
    dtxSomaIPI: TtecDBText;
    pnlSubstTributaria: TPanel;
    lblSomaSubstTributaria: TStaticText;
    dtxSomaSubstTribut: TtecDBText;
    pnlRetencoes: TPanel;
    StaticText3: TStaticText;
    dtxRetencoes: TtecDBText;
    Panel3: TPanel;
    StaticText5: TStaticText;
    dtxLiquidoServicos: TtecDBText;
    qryOrcamentos: TtecQuery;
    qryProdutosOrcamentos: TtecQuery;
    qryProdutosContratos: TtecQuery;
    qryProdutosCompostos: TtecQuery;
    qryContratos: TtecQuery;
    qryContratosnumero: TStringField;
    qryContratosdata: TDateField;
    qryContratosdatafechamento: TDateField;
    qryContratosfaturamento: TDateField;
    qryContratosavalista: TIntegerField;
    qryContratoscliente: TIntegerField;
    qryContratostipocliente: TStringField;
    qryContratosdependente: TIntegerField;
    qryContratosvendedor: TIntegerField;
    qryContratosfilialvenda: TIntegerField;
    t: TFloatField;
    qryContratosvalorprazo: TFloatField;
    qryContratostotalprodutos: TFloatField;
    qryContratossubtotalprodutos: TFloatField;
    qryContratosvalorprodutos: TFloatField;
    qryContratostotalbrindes: TFloatField;
    qryContratostotalipi: TFloatField;
    qryContratostotalservicos: TFloatField;
    qryContratosimpostoretido: TFloatField;
    qryContratosdesconto: TFloatField;
    qryContratosfrete: TFloatField;
    qryContratosseguro: TFloatField;
    qryContratosagente: TIntegerField;
    qryContratosanalista: TIntegerField;
    qryContratosorigem: TStringField;
    qryContratostiporenegociacao: TStringField;
    qryContratostaxajuros: TFloatField;
    qryContratosplano: TIntegerField;
    qryContratosconsideracoes: TStringField;
    qryContratosentrua: TStringField;
    qryContratosentnumero: TIntegerField;
    qryContratosentcomplemento: TStringField;
    qryContratosentestado: TStringField;
    qryContratosentcidade: TIntegerField;
    qryContratosentbairro: TIntegerField;
    qryContratosentcep: TIntegerField;
    qryContratosentfoneddd: TIntegerField;
    qryContratosentfonenumero: TIntegerField;
    qryContratosentfoneramal: TStringField;
    qryContratosmontagemobs: TStringField;
    qryContratosmontagemfilial: TIntegerField;
    qryContratossituacao: TStringField;
    qryContratossituacaoanterior: TStringField;
    qryContratosemitirnotadepoisde: TDateField;
    qryContratosmotivo: TIntegerField;
    qryContratosdescricaomotivo: TStringField;
    qryContratosnomecidadeentrega: TStringField;
    qryContratoscodigoibgecidadeentrega: TIntegerField;
    qryContratosnomebairroentrega: TStringField;
    qryContratosnomecidadenaturalidade: TStringField;
    qryContratosnomecidade: TStringField;
    qryContratoscodigoibgecidadedest: TIntegerField;
    qryContratosnomebairro: TStringField;
    qryContratosnomecidadeempresa: TStringField;
    qryContratosnomebairroempresa: TStringField;
    qryContratosnomecidadeconjuge: TStringField;
    qryContratosnomebairroconjuge: TStringField;
    qryContratosnomecidadereferencia: TStringField;
    qryContratosnomebairroreferencia: TStringField;
    qryContratosnome: TStringField;
    qryContratosnascto: TDateField;
    qryContratosapelido: TStringField;
    qryContratossexo: TStringField;
    qryContratoscivil: TStringField;
    qryContratoscivildata: TDateField;
    qryContratosiddocumento: TStringField;
    qryContratosidorgao: TStringField;
    qryContratosiddata: TDateField;
    qryContratosidestado: TStringField;
    qryContratospessoatipo: TStringField;
    qryContratospessoanumero: TStringField;
    qryContratosinscricaomunicipal: TStringField;
    qryContratosmae: TStringField;
    qryContratospai: TStringField;
    qryContratosconceito: TIntegerField;
    qryContratosnaturalcidade: TIntegerField;
    qryContratosnaturalestado: TStringField;
    qryContratosrua: TStringField;
    qryContratosendnumero: TIntegerField;
    qryContratosendcomplemento: TStringField;
    qryContratosestado: TStringField;
    qryContratoscidade: TIntegerField;
    qryContratosbairro: TIntegerField;
    qryContratoscep: TIntegerField;
    qryContratosfonetipo: TStringField;
    qryContratosfoneddd: TIntegerField;
    qryContratosfonenumero: TIntegerField;
    qryContratosfoneramal: TStringField;
    qryContratosfone2ddd: TIntegerField;
    qryContratosfone2numero: TIntegerField;
    qryContratosfone2ramal: TStringField;
    qryContratosrestipo: TStringField;
    qryContratosresonus: TFloatField;
    qryContratosrestempo: TDateField;
    qryContratosempresa: TStringField;
    qryContratosempadmissao: TDateField;
    qryContratosempcep: TIntegerField;
    qryContratosempcomprovado: TBooleanField;
    qryContratosempfoneddd: TIntegerField;
    qryContratosempfonenumero: TIntegerField;
    qryContratosempfoneramal: TStringField;
    qryContratosempoutrasdescricao: TStringField;
    qryContratosempoutrasfaixa: TIntegerField;
    qryContratosempoutrasvalor: TFloatField;
    qryContratosemprendafaixa: TIntegerField;
    qryContratosemprendavalor: TFloatField;
    qryContratosemprua: TStringField;
    qryContratosempnumero: TIntegerField;
    qryContratosempcomplemento: TStringField;
    qryContratosempestado: TStringField;
    qryContratosempcidade: TIntegerField;
    qryContratosempbairro: TIntegerField;
    qryContratosempcargo: TIntegerField;
    qryContratosconjuge: TIntegerField;
    qryContratosconnome: TStringField;
    qryContratosconadmissao: TDateField;
    qryContratosconcep: TIntegerField;
    qryContratosconempresa: TStringField;
    qryContratosconfoneddd: TIntegerField;
    qryContratosconfonenumero: TIntegerField;
    qryContratosconfoneramal: TStringField;
    qryContratosconnascto: TDateField;
    qryContratosconrendafaixa: TIntegerField;
    qryContratosconrendavalor: TFloatField;
    qryContratosconrua: TStringField;
    qryContratosconnumero: TIntegerField;
    qryContratosconcomplemento: TStringField;
    qryContratosconestado: TStringField;
    qryContratosconcidade: TIntegerField;
    qryContratosconbairro: TIntegerField;
    qryContratosconcargo: TIntegerField;
    qryContratosreferencia: TStringField;
    qryContratosreftipo: TStringField;
    qryContratosrefrua: TStringField;
    qryContratosrefnumero: TIntegerField;
    qryContratosrefcomplemento: TStringField;
    qryContratosrefestado: TStringField;
    qryContratosrefcidade: TIntegerField;
    qryContratosrefcodigoibge: TIntegerField;
    qryContratosrefbairro: TIntegerField;
    qryContratosrefcep: TIntegerField;
    qryContratosreffoneddd: TIntegerField;
    qryContratosreffonenumero: TIntegerField;
    qryContratosreffoneramal: TStringField;
    qryContratosreffone2ddd: TIntegerField;
    qryContratosreffone2numero: TIntegerField;
    qryContratosreffone2ramal: TStringField;
    qryContratosobservacoes: TStringField;
    qryContratosemail: TStringField;
    qryContratosautomovel: TBooleanField;
    qryContratoscartaocredito: TBooleanField;
    qryContratoscartaoloja: TBooleanField;
    qryContratoscheque: TBooleanField;
    qryContratoschequeespecial: TBooleanField;
    qryContratosdependentes: TIntegerField;
    qryContratosonus: TFloatField;
    qryContratosprimogenito: TStringField;
    qryContratospedidocliente: TStringField;
    qryContratosrenegociado: TStringField;
    qryContratoscreditotroca: TFloatField;
    qryContratostotalqtdeprodutos: TFloatField;
    qryContratosdescontototal: TFloatField;
    qryContratosdescontototaldocontrato: TFloatField;
    qryContratoscfps: TIntegerField;
    qryContratosdescricaocfps: TStringField;
    qryContratosclientebonus: TIntegerField;
    qryContratoscan_data: TDateField;
    qryContratoscan_usuariologado: TIntegerField;
    qryContratoscan_usuarioautorizacao: TIntegerField;
    qryContratosdatareservado: TDateField;
    qryContratosvaloricmssubstituicao: TFloatField;
    qryContratosnrpontos: TIntegerField;
    qryContratoslimitecredito: TFloatField;
    qryContratoslimitedisponivel: TFloatField;
    qryContratoslimiteparcela: TFloatField;
    qryContratosaberto30dias: TFloatField;
    qryContratoscontribicms: TBooleanField;
    qryContratosvendaconsumidorfinal: TBooleanField;
    qryContratosoperacao: TStringField;
    qryContratosdespesasacessorias: TFloatField;
    qryContratosnosimples: TBooleanField;
    qryContratosfrete_transportadora: TStringField;
    qryContratosfrete_servico: TStringField;
    qryContratosfrete_erro: TBooleanField;
    qryContratosfrete_mensagem: TStringField;
    qryContratosfrete_prazo_entrega: TIntegerField;
    qryContratostipoequipamento: TIntegerField;
    qryContratosproduto: TLargeintField;
    qryContratosfrete_pago: TFloatField;
    qryContratosindpres: TIntegerField;
    qryContratosos_garantia: TBooleanField;
    qryContratosos_garantia_status: TStringField;
    qryContratosos_cortesia: TBooleanField;
    qryContratosfilial_retirada: TIntegerField;
    qryContratosnomefilialretirada: TStringField;
    qryContratoscontrato_atual: TStringField;
    dsrContratos: TtecDataSource;
    qryContratostotalservico: TFloatField;
    qryContratosdescontofinanceiro: TFloatField;
    qryContratosacrescimofinanceiro: TFloatField;
    qryContratostotalcusto: TFloatField;
    qryContratosicmsvalorst: TFloatField;
    qryContratospisvalorprodutos: TFloatField;
    qryContratoscofinsvalorprodutos: TFloatField;
    qryContratosvalorissqn: TFloatField;
    qryContratosvaloripi: TFloatField;
    qryContratosaliquotaicms_sn: TFloatField;
    qryContratostotalitens: TFloatField;
    qryContratosTotalLiquidoProdutos: TCurrencyField;
    qryContratosLiquidoServicos: TCurrencyField;
    qryContratosTotalVenda: TCurrencyField;
    qryContratosPercentualTotalCusto: TCurrencyField;
    qryContratosMargemBruta: TCurrencyField;
    qryContratosMargemBrutaTotal: TCurrencyField;
    qryContratostotalvalorpis: TCurrencyField;
    qryContratostotalvalorcofins: TCurrencyField;
    qryContratosSomaMargemLucro: TCurrencyField;
    qryContratosSomaMargemLucroProdutos: TCurrencyField;
    qryContratosPercentualMargemLucroProdutos: TCurrencyField;
    qryContratosSomaMargemLucroServicos: TCurrencyField;
    qryContratosPercentualMargemLucroServicos: TCurrencyField;
    qryContratosSNProdutos: TCurrencyField;
    qryContratosSNServicos: TCurrencyField;
    qryContratosSomaMargemLucroSN: TCurrencyField;
    qryContratosPercentualMargemLucroSN: TCurrencyField;
    qryContratosPercentualMargemLucroSNProdutos: TCurrencyField;
    qryContratosSomaMargemLucroSNServicos: TCurrencyField;
    qryContratosPercentualMargemLucroSNServicos: TCurrencyField;
    qryProdutosContratosproduto: TLargeintField;
    qryProdutosContratostotalitens: TFloatField;
    qryProdutosContratosdesconto: TFloatField;
    qryProdutosContratosacrescimo: TFloatField;
    qryProdutosContratosfrete: TFloatField;
    qryProdutosContratosseguro: TFloatField;
    qryProdutosContratostotalvenda: TFloatField;
    qryProdutosContratostotalcusto: TFloatField;
    qryProdutosContratosicmsvalor: TFloatField;
    qryProdutosContratosicmsvalorst: TFloatField;
    qryProdutosContratospisvalor: TFloatField;
    qryProdutosContratoscofinsvalor: TFloatField;
    qryProdutosContratosvaloripi: TFloatField;
    qryProdutosContratosaliquotaicms_sn: TFloatField;
    qryProdutosContratospercentualcusto: TFloatField;
    qryProdutosContratosvendabruta: TFloatField;
    qryProdutosContratosmargemlucro: TFloatField;
    qryProdutosContratospercentualmargemlucro: TFloatField;
    qryProdutosContratosimpostossn: TFloatField;
    qryProdutosContratosmargemlucrosn: TFloatField;
    qryProdutosContratospercentualmargemlucrosn: TFloatField;
    qryProdutosContratosdescricao: TStringField;
    qryProdutosContratosprodutovisual: TStringField;
    qryServicosContratos: TtecQuery;
    dsrServicosContratos: TtecDataSource;
    qryServicosContratosMargemLucro: TCurrencyField;
    qryServicosContratosPercentualMargemLucro: TCurrencyField;
    qryServicosContratosimpostossn: TCurrencyField;
    qryServicosContratosMargemLucrosn: TCurrencyField;
    qryServicosContratosPercentualMargemLucrosn: TCurrencyField;
    qryServicosContratoscontrato: TStringField;
    qryServicosContratosservico: TIntegerField;
    qryServicosContratosdescricaoservico: TStringField;
    qryServicosContratosquantidade: TIntegerField;
    qryServicosContratoscancelado: TIntegerField;
    qryServicosContratosaliquotaissqn: TFloatField;
    qryServicosContratosvalorservico: TFloatField;
    qryServicosContratoscomplementoservico: TStringField;
    qryServicosContratosequipamento: TStringField;
    qryServicosContratosestado: TStringField;
    qryServicosContratoscidade: TIntegerField;
    qryServicosContratosreterissqn: TBooleanField;
    qryServicosContratosvalorissqn: TFloatField;
    qryServicosContratospiscst: TStringField;
    qryServicosContratosaliquotapis: TFloatField;
    qryServicosContratoscofinscst: TStringField;
    qryServicosContratosaliquotacofins: TFloatField;
    qryServicosContratoscodigolcp116: TStringField;
    qryServicosContratoscnae: TIntegerField;
    qryServicosContratoscstissqn: TIntegerField;
    qryServicosContratostotalitens: TFloatField;
    qryServicosContratospisvalor: TFloatField;
    qryServicosContratoscofinsvalor: TFloatField;
    qryServicosContratosaliquotaicms_sn: TFloatField;
    qryContratosSomaMargemLucroSNProdutos: TCurrencyField;
    qryProdutosContratosquantidade: TFloatField;
    qryProdutosContratosprecovenda: TFloatField;
    qryProdutosContratosvalordescontoitem: TFloatField;
    qryProdutosContratosbrinde: TBooleanField;
    qryProdutosContratoscomposto: TBooleanField;
    qryProdutosContratosdespesasacessorias: TFloatField;
    qryProdutosContratosipicst: TStringField;
    qryProdutosContratosunidade: TStringField;
    qryProdutosContratosvendasemestoque: TStringField;
    qryProdutosContratosaliquotaicms: TFloatField;
    qryProdutosContratosaliquotaicmsst: TFloatField;
    qryProdutosContratosicms: TIntegerField;
    qryProdutosContratosorigem: TIntegerField;
    qryProdutosContratosincidencia: TStringField;
    qryProdutosContratoscsosn: TStringField;
    qryProdutosContratosmontagemoriginal: TBooleanField;
    qryProdutosContratospercentualreducaobase: TFloatField;
    qryProdutosContratospredbcst: TFloatField;
    qryProdutosContratosvalorgrade1: TStringField;
    qryProdutosContratosvalorgrade2: TStringField;
    qryProdutosContratosanvisa: TStringField;
    qryProdutosContratosbaseicms: TFloatField;
    qryProdutosContratosdiscriminarcomposto: TStringField;
    qryProdutosContratosdiscriminarpreco: TBooleanField;
    qryProdutosContratosproducaopropria: TBooleanField;
    qryProdutosContratosobslegal: TStringField;
    qryProdutosContratosicmsmodalidade: TIntegerField;
    qryProdutosContratosicmsmodsubst: TIntegerField;
    qryProdutosContratospiscst: TStringField;
    qryProdutosContratoscofinscst: TStringField;
    qryProdutosContratospisaliquota: TFloatField;
    qryProdutosContratoscofinsaliquota: TFloatField;
    qryProdutosContratoscodigo_efd_t53: TStringField;
    qryProdutosContratosgenero: TIntegerField;
    qryProdutosContratosextipi: TStringField;
    qryProdutosContratoscontrato: TStringField;
    qryProdutosContratosfilial: TIntegerField;
    qryProdutosContratosnumero: TIntegerField;
    qryProdutosContratosprecotabela: TFloatField;
    qryProdutosContratosdescricaoprecovenda: TStringField;
    qryProdutosContratosmontagem: TStringField;
    qryProdutosContratosentrega: TStringField;
    qryProdutosContratosprevisao: TDateField;
    qryProdutosContratosnota: TBooleanField;
    qryProdutosContratoscancelado: TFloatField;
    qryProdutosContratosfuturo: TFloatField;
    qryProdutosContratosreserva: TIntegerField;
    qryProdutosContratosnotasimplesremessa: TBooleanField;
    qryProdutosContratosprodutolista: TBooleanField;
    qryProdutosContratosmovimento: TIntegerField;
    qryProdutosContratosvendedor: TIntegerField;
    qryProdutosContratospromocao: TBooleanField;
    qryProdutosContratosdata: TDateField;
    qryProdutosContratosaliquotaipi: TFloatField;
    qryProdutosContratosclassificacaofiscal: TStringField;
    qryProdutosContratosprecosubsttributaria: TFloatField;
    qryProdutosContratosfatorsubstituicao: TFloatField;
    qryProdutosContratosipi: TIntegerField;
    qryProdutosContratosdias: TIntegerField;
    qryProdutosContratoslistacasamento: TIntegerField;
    qryProdutosContratospcredsn: TFloatField;
    qryProdutosContratosvcredicmssn: TFloatField;
    qryProdutosContratosreducaobasest: TFloatField;
    qryProdutosContratosvbcstret: TFloatField;
    qryProdutosContratosvicmsstret: TFloatField;
    qryProdutosContratosicmsisentas: TFloatField;
    qryProdutosContratosicmsoutras: TFloatField;
    qryProdutosContratosipioutras: TFloatField;
    qryProdutosContratosipiisentas: TFloatField;
    qryProdutosContratosreducaobase: TFloatField;
    qryProdutosContratosicmsbasecalculo: TFloatField;
    qryProdutosContratosicmsbasecalculost: TFloatField;
    qryProdutosContratospisbasecalculo: TFloatField;
    qryProdutosContratoscofinsbasecalculo: TFloatField;
    qryProdutosContratosipibasecalculo: TFloatField;
    qryProdutosContratosimportadodaico: TBooleanField;
    qryProdutosContratosxped: TStringField;
    qryProdutosContratosprodutomonstruario: TBooleanField;
    qryProdutosContratosusuariologadoalteracao: TIntegerField;
    qryProdutosContratosusuarioalteracao: TIntegerField;
    qryProdutosContratosdatahoraalteracaousuario: TDateTimeField;
    qryProdutosContratosnitemped: TIntegerField;
    qryProdutosContratosemail_lista_enviado: TBooleanField;
    qryProdutosContratossetorvenda: TIntegerField;
    qryProdutosContratosprodutodigitado: TStringField;
    qryProdutosContratospercreducaomva: TFloatField;
    qryProdutosContratospeso: TFloatField;
    qryProdutosContratosvolumes: TIntegerField;
    qryProdutosContratosprodutooriginal: TLargeintField;
    qryProdutosContratosfilialoriginal: TIntegerField;
    qryProdutosContratosquantidadeoriginal: TFloatField;
    qryProdutosContratoscest: TStringField;
    qryContratosvaloricms: TFloatField;
    qryContratosPercentualMargemLucro: TCurrencyField;
    qryServicosContratospisbasecalculo: TFloatField;
    qryServicosContratoscofinsbasecalculo: TFloatField;
    qryContratostotalvalorpis_servicos: TFloatField;
    qryContratostotalvalorcofins_servicos: TFloatField;
    qryContratosissqnbasecalculo: TFloatField;
    qryProdutosContratosicmsValor_SemST: TCurrencyField;
    qryOrcamentostotalitens: TFloatField;
    qryOrcamentostotalservico: TFloatField;
    qryOrcamentosdescontofinanceiro: TFloatField;
    qryOrcamentosacrescimofinanceiro: TFloatField;
    qryOrcamentosfrete: TFloatField;
    qryOrcamentosseguro: TFloatField;
    qryOrcamentostotalcusto: TFloatField;
    qryOrcamentosicmsvalor: TFloatField;
    qryOrcamentosicmsvalorst: TFloatField;
    qryOrcamentospisvalorprodutos: TFloatField;
    qryOrcamentoscofinsvalorprodutos: TFloatField;
    qryOrcamentosvalorissqn: TFloatField;
    qryOrcamentospisvalorservicos: TFloatField;
    qryOrcamentoscofinsvalorservicos: TFloatField;
    qryOrcamentosvaloripi: TFloatField;
    qryOrcamentosaliquotaicms_sn: TFloatField;
    qryOrcamentostotalipi: TFloatField;
    qryOrcamentoscodigo: TIntegerField;
    qryOrcamentosfilial: TIntegerField;
    qryOrcamentoscliente: TIntegerField;
    qryOrcamentostipocliente: TStringField;
    qryOrcamentosnome: TStringField;
    qryOrcamentospessoatipo: TStringField;
    qryOrcamentospessoanumero: TStringField;
    qryOrcamentosvendedor: TIntegerField;
    qryOrcamentossituacao: TStringField;
    qryOrcamentosvalidade: TDateField;
    qryOrcamentosfilialmontagem: TIntegerField;
    qryOrcamentosfrete_1: TFloatField;
    qryOrcamentosseguro_1: TFloatField;
    qryOrcamentosrua: TStringField;
    qryOrcamentosestado: TStringField;
    qryOrcamentoscidade: TIntegerField;
    qryOrcamentosbairro: TIntegerField;
    qryOrcamentoscep: TIntegerField;
    qryOrcamentosfoneddd: TIntegerField;
    qryOrcamentosfonenumero: TIntegerField;
    qryOrcamentosfoneramal: TStringField;
    qryOrcamentosfone2ddd: TIntegerField;
    qryOrcamentosfone2numero: TIntegerField;
    qryOrcamentosfone2ramal: TStringField;
    qryOrcamentosemail: TStringField;
    qryOrcamentosmotivo: TIntegerField;
    qryOrcamentoscancelamento: TDateField;
    qryOrcamentoscontrato: TStringField;
    qryOrcamentosobservacao: TStringField;
    qryOrcamentosnumero: TIntegerField;
    qryOrcamentoscomplemento: TStringField;
    qryOrcamentosdisponibilizarparavenda: TBooleanField;
    qryOrcamentoscreditotroca: TFloatField;
    qryOrcamentosempcargo: TIntegerField;
    qryOrcamentosvalortotal: TFloatField;
    qryOrcamentosanalistacredito: TIntegerField;
    qryOrcamentosqualidade_venda: TIntegerField;
    qryOrcamentosTotalLiquidoProdutos: TCurrencyField;
    qryOrcamentosLiquidoServicos: TCurrencyField;
    qryOrcamentosimpostoretido: TFloatField;
    qryOrcamentosTotalVenda: TCurrencyField;
    qryOrcamentosvaloricmssubstituicao: TFloatField;
    qryOrcamentospercentualtotalcusto: TFloatField;
    qryOrcamentosMargemBruta: TCurrencyField;
    qryOrcamentosMargemBrutaTotal: TCurrencyField;
    qryOrcamentostotalvalorpis: TCurrencyField;
    qryOrcamentostotalvalorpis_servicos: TFloatField;
    qryOrcamentostotalvalorcofins_servicos: TFloatField;
    qryOrcamentosissqnbasecalculo: TFloatField;
    qryOrcamentostotalvalorcofins: TFloatField;
    qryOrcamentossomamargemlucro: TFloatField;
    qryOrcamentosvaloricms: TFloatField;
    qryOrcamentospercentualmargemlucro: TFloatField;
    qryOrcamentossomamargemlucroprodutos: TFloatField;
    qryOrcamentosPercentualMargemLucroProdutos: TCurrencyField;
    qryOrcamentosSomaMargemLucroServicos: TCurrencyField;
    qryOrcamentosPercentualMargemLucroServicos: TCurrencyField;
    qryOrcamentosSNProdutos: TCurrencyField;
    qryOrcamentosSNServicos: TCurrencyField;
    qryOrcamentosSomaMargemLucroSN: TCurrencyField;
    qryOrcamentosPercentualMargemLucroSN: TCurrencyField;
    qryOrcamentosSomaMargemLucroSNProdutos: TCurrencyField;
    qryOrcamentosPercentualMargemLucroSNProdutos: TCurrencyField;
    qryOrcamentosSomaMargemLucroSNServicos: TCurrencyField;
    qryOrcamentosPercentualMargemLucroSNServicos: TCurrencyField;
    qryServicosOrcamentos: TtecQuery;
    qryOrcamentostotalprodutos: TFloatField;
    qryProdutosOrcamentosicmsValor_SemST: TCurrencyField;
    qryProdutosOrcamentosproduto: TLargeintField;
    qryProdutosOrcamentosprodutovisual: TStringField;
    qryProdutosOrcamentosdescricao: TStringField;
    qryProdutosOrcamentostotalitens: TFloatField;
    qryProdutosOrcamentosdescontofinanceiro: TFloatField;
    qryProdutosOrcamentosacrescimofinanceiro: TFloatField;
    qryProdutosOrcamentosfrete: TFloatField;
    qryProdutosOrcamentosseguro: TFloatField;
    qryProdutosOrcamentostotalcusto: TFloatField;
    qryProdutosOrcamentosicmsvalor: TFloatField;
    qryProdutosOrcamentosicmsvalorst: TFloatField;
    qryProdutosOrcamentospisvalor: TFloatField;
    qryProdutosOrcamentoscofinsvalor: TFloatField;
    qryProdutosOrcamentosvaloripi: TFloatField;
    qryProdutosOrcamentosdesconto: TFloatField;
    qryProdutosOrcamentosacrescimo: TFloatField;
    qryProdutosOrcamentosaliquotaicms_sn: TFloatField;
    qryProdutosOrcamentostotalvenda: TFloatField;
    qryProdutosOrcamentospercentualcusto: TFloatField;
    qryProdutosOrcamentosvendabruta: TFloatField;
    qryProdutosOrcamentosmargemlucro: TFloatField;
    qryProdutosOrcamentospercentualmargemlucro: TFloatField;
    qryProdutosOrcamentosimpostossn: TFloatField;
    qryProdutosOrcamentosmargemlucrosn: TFloatField;
    qryProdutosOrcamentospercentualmargemlucrosn: TFloatField;
    qryOrcamentosvendaconsumidorfinal: TBooleanField;
    qryOrcamentoscontribicms: TBooleanField;
    qryProdutosOrcamentosorcamento: TIntegerField;
    qryProdutosOrcamentosfilial: TIntegerField;
    qryProdutosOrcamentosnumero: TIntegerField;
    qryProdutosOrcamentosquantidade: TFloatField;
    qryProdutosOrcamentosprecotabela: TFloatField;
    qryProdutosOrcamentosprecovenda: TFloatField;
    qryProdutosOrcamentosmontagem: TStringField;
    qryProdutosOrcamentosentrega: TStringField;
    qryProdutosOrcamentosprevisao: TDateField;
    qryProdutosOrcamentosdescricaoprecovenda: TStringField;
    qryProdutosOrcamentosvendido: TFloatField;
    qryProdutosOrcamentosvendedor: TIntegerField;
    qryProdutosOrcamentosvalordescontoitem: TFloatField;
    qryProdutosOrcamentosprodutodigitado: TStringField;
    qryOrcamentosvalorprodutos: TFloatField;
    qryOrcamentosbaseicms: TFloatField;
    qryOrcamentostotalbaseicmssubstituicao: TFloatField;
    qryOrcamentostotalvaloricmssubstituicao: TFloatField;
    qryOrcamentosvalorvista: TFloatField;
    qryOrcamentosvalorprazo: TFloatField;
    qryProdutosOrcamentosdespesasacessorias: TFloatField;
    qryOrcamentosdesconto: TFloatField;
    qryOrcamentosacrescimo: TFloatField;
    qryOrcamentosdespesasacessorias: TFloatField;
    qryProdutosOrcamentosunidade: TStringField;
    qryProdutosOrcamentosvendasemestoque: TStringField;
    qryProdutosOrcamentosaliquotaicms: TFloatField;
    qryProdutosOrcamentosaliquotaicmsst: TFloatField;
    qryProdutosOrcamentosicms: TIntegerField;
    qryProdutosOrcamentosorigem: TIntegerField;
    qryProdutosOrcamentosincidencia: TStringField;
    qryProdutosOrcamentoscsosn: TStringField;
    qryProdutosOrcamentosmontagemoriginal: TBooleanField;
    qryProdutosOrcamentospercentualreducaobase: TFloatField;
    qryProdutosOrcamentospredbcst: TFloatField;
    qryProdutosOrcamentosanvisa: TStringField;
    qryProdutosOrcamentosbaseicms: TFloatField;
    qryProdutosOrcamentoscomposto: TBooleanField;
    qryProdutosOrcamentosdiscriminarcomposto: TStringField;
    qryProdutosOrcamentosdiscriminarpreco: TBooleanField;
    qryProdutosOrcamentosproducaopropria: TBooleanField;
    qryProdutosOrcamentosobslegal: TStringField;
    qryProdutosOrcamentosicmsmodalidade: TIntegerField;
    qryProdutosOrcamentosicmsmodsubst: TIntegerField;
    qryProdutosOrcamentospiscst: TStringField;
    qryProdutosOrcamentoscofinscst: TStringField;
    qryProdutosOrcamentosipicst: TStringField;
    qryProdutosOrcamentospisaliquota: TFloatField;
    qryProdutosOrcamentoscofinsaliquota: TFloatField;
    qryProdutosOrcamentoscodigo_efd_t53: TStringField;
    qryProdutosOrcamentosgenero: TIntegerField;
    qryProdutosOrcamentosextipi: TStringField;
    qryProdutosOrcamentospeso: TFloatField;
    qryProdutosOrcamentosvolumes: TIntegerField;
    qryProdutosOrcamentoscest: TStringField;
    qryProdutosOrcamentosipioutras: TFloatField;
    qryProdutosOrcamentosipiisentas: TFloatField;
    qryProdutosOrcamentosaliquotaipi: TFloatField;
    qryProdutosOrcamentosipibasecalculo: TFloatField;
    qryProdutosOrcamentosicmsoutras: TFloatField;
    qryProdutosOrcamentosicmsisentas: TFloatField;
    qryProdutosOrcamentosreducaobase: TFloatField;
    qryProdutosOrcamentosicmsbasecalculo: TFloatField;
    qryProdutosOrcamentosvcredicmssn: TFloatField;
    qryProdutosOrcamentospcredsn: TFloatField;
    qryProdutosOrcamentosfatorsubstituicao: TFloatField;
    qryProdutosOrcamentosreducaobasest: TFloatField;
    qryProdutosOrcamentosicmsbasecalculost: TFloatField;
    qryProdutosOrcamentospisbasecalculo: TFloatField;
    qryProdutosOrcamentoscofinsbasecalculo: TFloatField;
    qryProdutosOrcamentosvbcstret: TFloatField;
    qryProdutosOrcamentosvicmsstret: TFloatField;
    qryProdutosOrcamentospercreducaomva: TFloatField;
    qryProdutosOrcamentosclassificacaofiscal: TStringField;
    qryContratosvaloricms_agregado: TFloatField;
    qryProdutosContratosvICMSUFDest: TCurrencyField;
    qryProdutosContratosvICMSUFRemet: TCurrencyField;
    qryProdutosContratospfcp: TFloatField;
    qryProdutosContratosvfcp: TFloatField;
    qryProdutosContratosvbcfcpst: TFloatField;
    qryProdutosContratospfcpst: TFloatField;
    qryProdutosContratosvfcpst: TFloatField;
    qryProdutosContratosvbcfcp: TFloatField;
    qryProdutosContratosvbcfcpstret: TFloatField;
    qryProdutosContratospfcpstret: TFloatField;
    qryProdutosContratosvfcpstret: TFloatField;
    qryProdutosContratosvbcfcpufdest: TFloatField;
    qryProdutosContratospst: TFloatField;
    qryProdutosOrcamentosvICMSUFDest: TCurrencyField;
    qryProdutosOrcamentosvICMSUFRemet: TCurrencyField;
    qryOrcamentosvaloricms_agregado: TCurrencyField;
    qryContratosvicmsufdest: TFloatField;
    qryContratosvicmsufremet: TFloatField;
    qryOrcamentosvicmsufdest: TFloatField;
    qryOrcamentosvicmsufremet: TFloatField;
    qryProdutosOrcamentospfcp: TFloatField;
    qryProdutosOrcamentosvfcp: TFloatField;
    qryProdutosOrcamentosvbcfcpst: TFloatField;
    qryProdutosOrcamentospfcpst: TFloatField;
    qryProdutosOrcamentosvfcpst: TFloatField;
    qryProdutosOrcamentosvbcfcp: TFloatField;
    qryProdutosOrcamentosvbcfcpstret: TFloatField;
    qryProdutosOrcamentospfcpstret: TFloatField;
    qryProdutosOrcamentosvfcpstret: TFloatField;
    qryProdutosOrcamentosvbcfcpufdest: TFloatField;
    qryProdutosOrcamentospst: TFloatField;
    qryProdutosOrcamentospfcpufdest: TFloatField;
    qryProdutosOrcamentosvbcufdest: TFloatField;
    qryProdutosOrcamentospicmsufdest: TFloatField;
    qryProdutosOrcamentospicmsinter: TFloatField;
    qryProdutosOrcamentospicmsinterpart: TFloatField;
    qryProdutosOrcamentosvfcpufdest: TFloatField;
    qryProdutosContratospfcpufdest: TFloatField;
    qryProdutosContratosvbcufdest: TFloatField;
    qryProdutosContratospicmsufdest: TFloatField;
    qryProdutosContratospicmsinter: TFloatField;
    qryProdutosContratospicmsinterpart: TFloatField;
    qryProdutosContratosvfcpufdest: TFloatField;
    qryContratosmodelodocto: TStringField;
    qryOrcamentosmodelodocto: TStringField;
    qryProdutosContratoscodigofiscal: TIntegerField;
    qryProdutosOrcamentoscodigofiscal: TIntegerField;
    pnlFretePago: TPanel;
    lblFretePago: TStaticText;
    dtxFretePago: TtecDBText;
    dtxSomaPercentuallFretePago: TtecDBText;
    qryOrcamentosfrete_pago: TFloatField;
    qryContratosPercentualFrete_Pago: TCurrencyField;
    qryOrcamentosPercentualFrete_Pago: TCurrencyField;
    pnlComissoes: TPanel;
    lblComissao: TStaticText;
    dtxComissao: TtecDBText;
    dtxSomaPercentualComissao: TtecDBText;
    qryContratospercprazo: TFloatField;
    qryContratospercvista: TFloatField;
    qryContratospercentrada: TFloatField;
    qryContratosvalorcontratoavista: TFloatField;
    qryContratosvalorcontratoaprazo: TFloatField;
    qryContratosvalorcontratoentrada: TFloatField;
    qryContratosTotalComissaoVendedor: TCurrencyField;
    qryContratosPercComissaoVendedor: TCurrencyField;
    qryOrcamentosTotalComissaoVendedor: TCurrencyField;
    qryOrcamentospercprazo: TFloatField;
    qryOrcamentospercvista: TFloatField;
    qryOrcamentospercentrada: TFloatField;
    qryOrcamentosvalorcontratoavista: TFloatField;
    qryOrcamentosvalorcontratoaprazo: TFloatField;
    qryOrcamentosvalorcontratoentrada: TFloatField;
    qryOrcamentosPercComissaoVendedor: TCurrencyField;
    qryOrcamentosemissao: TDateTimeField;
    procedure qryContratosCalcFields(DataSet: TDataSet);
    procedure qryProdutosContratosCalcFields(DataSet: TDataSet);
    procedure qryServicosContratosCalcFields(DataSet: TDataSet);
    procedure qryOrcamentosCalcFields(DataSet: TDataSet);
    procedure qryProdutosOrcamentosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmVisualizarCustoVenda: TfrmVisualizarCustoVenda;
  AcionarTelaVisualizarCustoVenda: procedure (Owner: TComponent; Documento: TTecStringRetorno; Tipo: TTecStringRetorno; qryPlanosOrcamentos: TtecQuery = nil);


implementation

{$R *.dfm}

procedure AcionarTelaVisualizarCustoVenda_(Owner: TComponent; Documento: TTecStringRetorno; Tipo: TTecStringRetorno; qryPlanosOrcamentos: TtecQuery);
var
  UsrAut: TtecUsuarios;
begin
  UsrAut :=  TdtmBasico.ObterAutorizacao(taLOGIN, 'VISUALIZAR CUSTOS', 'Gerente de Vendas', '');

  if Assigned(UsrAut) then
  begin
    if Not UsrAut.GerenteVendas then
       MensagemAviso(ctUSUARIOSEMPERMISSAO)
    else
    begin
      if not assigned(frmVisualizarCustoVenda) or (frmVisualizarCustoVenda.Owner <> Owner) then
      begin
        if assigned(frmVisualizarCustoVenda) then
          frmVisualizarCustoVenda.free;

        frmVisualizarCustoVenda := TfrmVisualizarCustoVenda.create(Owner);

        with frmVisualizarCustoVenda do
        begin
          if tipo = 'C' then
          begin

            qryContratos.parambyname('numero').asString := Documento;
            qryContratos.close;
            qryContratos.open;

            dsrContratos.DataSet := qryContratos;

            qryProdutosContratos.parambyname('contrato').asString := Documento;
            qryProdutosContratos.parambyname('estadofilialbase').asString := fEstadoFilialBase;
            qryProdutosContratos.close;
            qryProdutosContratos.open;

            dsrProdutos.DataSet := qryProdutosContratos;

            qryProdutosCompostos.parambyname('estadofilialbase').asString := fEstadoFilialBase;
            qryProdutosCompostos.parambyname('estadocfo').asString := qryContratos.fieldbyname('estado').asString;
            qryProdutosCompostos.parambyname('tipopessoa').asString := qryContratos.fieldbyname('pessoatipo').asString;
            qryProdutosCompostos.parambyname('composto').asString := qryProdutosContratos.fieldbyname('produto').asString;
            qryProdutosCompostos.close;
            qryProdutosCompostos.open;

            qryServicosContratos.parambyname('contrato').asString := Documento;
            qryServicosContratos.close;
            qryServicosContratos.open;

            dsrServicosContratos.DataSet := qryServicosContratos;

            dtmBasico := tdtmBasico.create(nil);

            dtmBasico.CalcularImpostos(qryprodutoscontratos,
                                       qrycontratos, true, true, true, nil,
                                       qryprodutoscompostos, false, CalculoMargem,
                                       qryContratos.fieldbyname('vendaconsumidorfinal').asboolean,
                                       qrycontratos.fieldbyname('contribicms').asboolean, qryServicosContratos, False, true, false);

            qryContratosCalcFields(qrycontratos);

                                                    
          end
          else
          if tipo = 'O' then
          begin

            qryOrcamentos.parambyname('codigo').asString := Documento;

            qryOrcamentos.parambyname('DescontoFinanceiro').asCurrency := qryPlanosOrcamentos.fieldbyname('desconto').asCurrency;

            qryOrcamentos.parambyname('valorvista').asCurrency := qryPlanosOrcamentos.fieldbyname('valorvista').asCurrency;
            qryOrcamentos.parambyname('valorprazo').asCurrency := qryPlanosOrcamentos.fieldbyname('valorprazo').asCurrency;

            if qryPlanosOrcamentos.fieldbyname('valorprazo').asCurrency > qryPlanosOrcamentos.fieldbyname('valorvista').asCurrency then
               qryOrcamentos.parambyname('AcrescimoFinanceiro').asCurrency := qryPlanosOrcamentos.fieldbyname('valorprazo').asCurrency -
                                                                              qryPlanosOrcamentos.fieldbyname('valorvista').asCurrency
            else
               qryOrcamentos.parambyname('AcrescimoFinanceiro').asCurrency := 0;

            qryOrcamentos.close;
            qryOrcamentos.open;

            dsrContratos.DataSet := qryOrcamentos;

            qryProdutosOrcamentos.parambyname('orcamento').asString := Documento;
            qryProdutosOrcamentos.parambyname('estadofilialbase').asString := fEstadoFilialBase;
            qryProdutosOrcamentos.close;
            qryProdutosOrcamentos.open;

            dsrProdutos.DataSet := qryProdutosOrcamentos;

            qryProdutosCompostos.parambyname('estadofilialbase').asString := fEstadoFilialBase;
            qryProdutosCompostos.parambyname('estadocfo').asString := qryOrcamentos.fieldbyname('estado').asString;
            qryProdutosCompostos.parambyname('tipopessoa').asString := qryOrcamentos.fieldbyname('pessoatipo').asString;
            qryProdutosCompostos.parambyname('composto').asString := qryProdutosOrcamentos.fieldbyname('produto').asString;
            qryProdutosCompostos.close;
            qryProdutosCompostos.open;

            qryServicosOrcamentos.parambyname('orcamento').asString := Documento;
            qryServicosOrcamentos.close;
            qryServicosOrcamentos.open;

            dsrServicosContratos.DataSet := qryServicosOrcamentos;

            dtmBasico := tdtmBasico.create(nil);

            dtmBasico.CalcularImpostos(qryprodutosOrcamentos,
                                       qryOrcamentos, true, true, true, nil,
                                       qryprodutoscompostos, false, CalculoMargem,
                                       qryOrcamentos.fieldbyname('vendaconsumidorfinal').asboolean,
                                       qryOrcamentos.fieldbyname('contribicms').asboolean, qryServicosOrcamentos, False, true, false);

            qryOrcamentosCalcFields(qryOrcamentos);

          end;
          showmodal;
       end;
      end;
      frmVisualizarCustoVenda.Free;
    end;
  end;
end;


constructor TfrmVisualizarCustoVenda.Create(AOwner: TComponent);
begin
  inherited;
  pgcLucroReal.ActivePage := tstTotaisLucroReal;
  pgcSimplesNacional.ActivePage := tstTotaisSimplesNacional;


end;

destructor TfrmVisualizarCustoVenda.Destroy;
begin
  frmVisualizarCustoVenda := nil;
  inherited;
end;


procedure TfrmVisualizarCustoVenda.qryContratosCalcFields(
  DataSet: TDataSet);
begin
  inherited;

  qryContratosTotalComissaoVendedor.asCurrency :=
    (qryContratosvalorcontratoavista.asCurrency *
      qryContratospercvista.asCurrency/100) +
    (qryContratosvalorcontratoaprazo.asCurrency *
      qryContratospercprazo.asCurrency/100) +
    (qryContratosvalorcontratoentrada.asCurrency *
      qryContratospercentrada.asCurrency/100);

  qryContratosPercComissaoVendedor.AsCurrency :=
    (qryContratosTotalComissaoVendedor.asCurrency * 100) / qryContratosvalorprazo.AsCurrency;

  qryContratosvaloricms_agregado.AsCurrency := qryContratosvaloricms.AsCurrency +
                                               qryContratosvICMSUFDest.AsCurrency +
                                               qryContratosvICMSUFRemet.AsCurrency;

  qryContratosTotalLiquidoProdutos.asCurrency := qryContratostotalitens.asCurrency -
                                         qryContratosdescontofinanceiro.asCurrency +
                                         qryContratosacrescimofinanceiro.asCurrency +
                                         qryContratosfrete.asCurrency +
                                         qryContratosseguro.asCurrency +
                                         qryContratostotalipi.asCurrency {+
                                         qryContratosvaloricmssubstituicao.asCurrency};

  qryContratosLiquidoServicos.asCurrency := qryContratostotalservico.asCurrency - qryContratosimpostoretido.asCurrency;

  qryContratosTotalVenda.asCurrency :=  qryContratosTotalLiquidoProdutos.asCurrency +
                                        qryContratosvaloricmssubstituicao.asCurrency +
                                        qryContratosLiquidoServicos.asCurrency;

  qryContratosPercentualTotalCusto.ascurrency := 0;
  if (qryContratostotalcusto.asCurrency <> 0) and (qryContratosTotalLiquidoProdutos.asCurrency <> 0) then
    qryContratosPercentualTotalCusto.ascurrency := (qryContratostotalcusto.asCurrency * 100) / qryContratosTotalLiquidoProdutos.asCurrency;

  qryContratosPercentualFrete_Pago.ascurrency := 0;
  if (qryContratosfrete_pago.asCurrency <> 0) and (qryContratosTotalLiquidoProdutos.asCurrency <> 0) then
    qryContratosPercentualFrete_Pago.ascurrency := (qryContratosfrete_pago.asCurrency * 100) / qryContratosTotalLiquidoProdutos.asCurrency;

  qryContratosMargemBruta.asCurrency :=  qryContratosTotalLiquidoProdutos.asCurrency -
        (qryContratostotalcusto.asCurrency + qryContratosfrete_pago.asCurrency + qryContratosTotalComissaoVendedor.AsCurrency);

  qryContratosMargemBrutaTotal.asCurrency := qryContratosMargemBruta.asCurrency +  qryContratosLiquidoServicos.asCurrency;

  //zerado por enquanto, pedido Ferrari 15/05/2018-JR
  qryContratostotalvalorpis.asCurrency := 0 {qryContratosPisValorProdutos.asCurrency + qryContratostotalvalorpis_servicos.asCurrency};

  qryContratostotalvalorcofins.asCurrency := 0 {qryContratosCofinsValorProdutos.asCurrency + qryContratostotalvalorcofins_servicos.asCurrency};

  qryContratosSomaMargemLucro.asCurrency := qryContratosMargemBrutaTotal.asCurrency -
                                           qryContratosvaloricms_agregado.ascurrency -  {ver quando}
                                          { qryContratostotalvalorpis.asCurrency -
                                           qryContratostotalvalorcofins.asCurrency -}
                                           qryContratosvalorissqn.asCurrency;


  qryContratosPercentualMargemLucro.asCurrency := 0;
  {
  if (qryContratosSomaMargemLucro.asCurrency <> 0) and (qryContratosMargemBrutaTotal.asCurrency <> 0) then
    qryContratosPercentualMargemLucro.asCurrency := qryContratosSomaMargemLucro.asCurrency * 100 / qryContratosMargemBrutaTotal.asCurrency;
  }

  if (qryContratosSomaMargemLucro.asCurrency <> 0) and ((qryContratostotalprodutos.asCurrency + (qryContratosfrete.asCurrency - qryContratosfrete_pago.asCurrency)) <> 0) then
    qryContratosPercentualMargemLucro.asCurrency := qryContratosSomaMargemLucro.asCurrency * 100 /
                 (qryContratostotalprodutos.asCurrency + (qryContratosfrete.asCurrency - qryContratosfrete_pago.asCurrency));

  qryContratosSomaMargemLucroProdutos.asCurrency := qryContratosMargemBruta.asCurrency -
                                           qryContratosvaloricms_agregado.ascurrency -
                                           {qryContratosicmsvalorst.ascurrency -
                                           qryContratospisvalorprodutos.asCurrency -
                                           qryContratoscofinsvalorprodutos.asCurrency -}
                                           qryContratosvaloripi.asCurrency;


  qryContratosPercentualMargemLucroProdutos.asCurrency := 0;
  {
  if (qryContratosSomaMargemLucroProdutos.asCurrency <> 0) and (qryContratosMargemBruta.asCurrency <> 0) then
    qryContratosPercentualMargemLucroProdutos.asCurrency :=  qryContratosSomaMargemLucroProdutos.asCurrency * 100 / qryContratosMargemBruta.asCurrency;
    }

  if (qryContratosSomaMargemLucroProdutos.asCurrency <> 0) and ((qryContratostotalprodutos.asCurrency + (qryContratosfrete.asCurrency - qryContratosfrete_pago.asCurrency)) <> 0) then
    qryContratosPercentualMargemLucroProdutos.asCurrency :=  qryContratosSomaMargemLucroProdutos.asCurrency * 100 / (qryContratostotalprodutos.asCurrency + (qryContratosfrete.asCurrency - qryContratosfrete_pago.asCurrency));


  qryContratosSomaMargemLucroServicos.asCurrency := qryContratosLiquidoServicos.asCurrency -
                                                   qryContratostotalvalorpis_servicos.asCurrency -
                                                   qryContratostotalvalorcofins_servicos.asCurrency -
                                                   qryContratosvalorissqn.asCurrency;

  qryContratosPercentualMargemLucroServicos.asCurrency := 0;
  if (qryContratosSomaMargemLucroServicos.asCurrency <> 0) and (qryContratosLiquidoServicos.asCurrency <> 0) then
    qryContratosPercentualMargemLucroServicos.asCurrency := qryContratosSomaMargemLucroServicos.asCurrency * 100 / qryContratosLiquidoServicos.asCurrency;

  qryContratosSNProdutos.asCurrency := ((qryContratosTotalLiquidoProdutos.asCurrency * qryContratosaliquotaicms_sn.asCurrency) / 100);
  qryContratosSNServicos.asCurrency := ((qryContratosTotalServico.asCurrency * qryContratosaliquotaicms_sn.asCurrency) / 100);

  qryContratosSomaMargemLucroSN.asCurrency :=  qryContratosMargemBrutaTotal.asCurrency -
                                              qryContratosSNProdutos.asCurrency -
                                              qryContratosSNServicos.asCurrency;

  qryContratosPercentualMargemLucroSN.asCurrency := 0;
  {
  if (qryContratosSomaMargemLucroSN.asCurrency <> 0) and (qryContratosMargemBrutaTotal.asCurrency <> 0) then
    qryContratosPercentualMargemLucroSN.asCurrency := qryContratosSomaMargemLucroSN.asCurrency * 100 / qryContratosMargemBrutaTotal.asCurrency;
    }

  if (qryContratosSomaMargemLucroSN.asCurrency <> 0) and ((qryContratostotalprodutos.asCurrency + (qryContratosfrete.asCurrency - qryContratosfrete_pago.asCurrency)) <> 0) then
    qryContratosPercentualMargemLucroSN.asCurrency := qryContratosSomaMargemLucroSN.asCurrency * 100 / (qryContratostotalprodutos.asCurrency + (qryContratosfrete.asCurrency - qryContratosfrete_pago.asCurrency));


  qryContratosSomaMargemLucroSNProdutos.asCurrency := qryContratosMargemBruta.asCurrency - qryContratosSNProdutos.asCurrency;

  qryContratosPercentualMargemLucroSNProdutos.asCurrency := 0;
  {
  if (qryContratosSomaMargemLucroSNProdutos.asCurrency <> 0) and  (qryContratosMargemBruta.asCurrency <> 0) then
    qryContratosPercentualMargemLucroSNProdutos.asCurrency :=  qryContratosSomaMargemLucroSNProdutos.asCurrency * 100 / qryContratosMargemBruta.asCurrency;
    }

  if (qryContratosSomaMargemLucroSNProdutos.asCurrency <> 0) and  ((qryContratostotalprodutos.asCurrency + (qryContratosfrete.asCurrency - qryContratosfrete_pago.asCurrency)) <> 0) then
    qryContratosPercentualMargemLucroSNProdutos.asCurrency :=  qryContratosSomaMargemLucroSNProdutos.asCurrency * 100 / (qryContratostotalprodutos.asCurrency + (qryContratosfrete.asCurrency - qryContratosfrete_pago.asCurrency));

  qryContratosSomaMargemLucroSNServicos.asCurrency :=  qryContratostotalservico.asCurrency - qryContratosSNServicos.asCurrency;

  qryContratosPercentualMargemLucroSNServicos.asCurrency := 0;

  if (qryContratosSomaMargemLucroSNServicos.asCurrency <> 0) and (qryContratostotalservico.asCurrency <> 0) then
    qryContratosPercentualMargemLucroSNServicos.asCurrency := qryContratosSomaMargemLucroSNServicos.asCurrency * 100 / qryContratostotalservico.asCurrency;

end;

procedure TfrmVisualizarCustoVenda.qryProdutosContratosCalcFields(
  DataSet: TDataSet);
begin
  inherited;

  if qryProdutosContratosicmsValorst.asCurrency = 0 then
    qryProdutosContratosicmsValor_SemST.asCurrency := qryProdutosContratosicmsValor.asCurrency +
                                                      qryProdutosContratosvICMSUFDest.asCurrency +
                                                      qryProdutosContratosvICMSUFRemet.asCurrency
  else
    qryProdutosContratosicmsValor_SemST.clear;


  qryProdutosContratosTotalVenda.asCurrency :=
    qryProdutosContratosTotalItens.asCurrency -
    qryProdutosContratosDesconto.asCurrency +
    qryProdutosContratosAcrescimo.asCurrency +
    qryProdutosContratosFrete.asCurrency +
    qryProdutosContratosSeguro.asCurrency +
    qryProdutosContratosValorIPI.asCurrency {+
    qryProdutosContratosIcmsValorST.asCurrency};

       {
  if qryProdutosContratosTotalCusto.asCurrency <> 0 then
    qryProdutosContratospercentualCusto.asCurrency := ((qryProdutosContratosTotalVenda.asCurrency -
                                                        qryProdutosContratosTotalCusto.asCurrency)*100/qryProdutosContratosTotalCusto.asCurrency)
  else
    qryProdutosContratospercentualCusto.asCurrency := 0;
    }

  if (qryProdutosContratosTotalCusto.asCurrency <> 0) and (qryProdutosContratosTotalVenda.asCurrency <> 0) then
    qryProdutosContratospercentualCusto.asCurrency := 100 - (qryProdutosContratosTotalCusto.asCurrency*100)/qryProdutosContratosTotalVenda.asCurrency
  else
    qryProdutosContratospercentualCusto.asCurrency := 0;



  qryProdutosContratosVendaBruta.asCurrency := qryProdutosContratosTotalVenda.asCurrency - qryProdutosContratosTotalCusto.asCurrency;

  qryProdutosContratosMargemLucro.asCurrency := (qryProdutosContratosTotalVenda.asCurrency - qryProdutosContratosTotalCusto.asCurrency - qryProdutosContratosIcmsValor_SemST.asCurrency {- qryProdutosContratosIcmsValorST.asCurrency} - {qryProdutosContratosPisValor.asCurrency - qryProdutosContratosCofinsValor.asCurrency} - qryProdutosContratosValorIPI.asCurrency);

  if (qryProdutosContratosMargemLucro.asCurrency <> 0) and (qryProdutosContratosTotalVenda.asCurrency <> 0) then
    qryProdutosContratosPercentualMargemLucro.asCurrency := (qryProdutosContratosMargemLucro.asCurrency * 100) / qryProdutosContratosTotalVenda.asCurrency;

  qryProdutosContratosimpostossn.asCurrency := (qryProdutosContratosTotalVenda.asCurrency * qryProdutosContratosaliquotaicms_sn.asCurrency / 100);

  qryProdutosContratosMargemLucrosn.asCurrency := (qryProdutosContratosTotalVenda.asCurrency - qryProdutosContratosTotalCusto.asCurrency) - qryProdutosContratosimpostossn.asCurrency;

  if (qryProdutosContratosMargemLucrosn.asCurrency <> 0) and (qryProdutosContratosTotalVenda.asCurrency <> 0) then
    qryProdutosContratosPercentualMargemLucrosn.asCurrency := qryProdutosContratosMargemLucrosn.asCurrency * 100 / qryProdutosContratosTotalVenda.asCurrency;

end;

procedure TfrmVisualizarCustoVenda.qryServicosContratosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryServicosContratosMargemLucro.asCurrency :=
    qryServicosContratosTotalItens.asCurrency -
    qryServicosContratosvalorissqn.asCurrency -
    qryServicosContratosPisValor.asCurrency -
    qryServicosContratosCofinsValor.asCurrency;

  if qryServicosContratosTotalItens.asCurrency <> 0 then
    qryServicosContratosPercentualMargemLucro.asCurrency :=
        ((qryServicosContratosTotalItens.asCurrency - qryServicosContratosvalorissqn.asCurrency - qryServicosContratosPisValor.asCurrency - qryServicosContratosCofinsValor.asCurrency) * 100) / qryServicosContratosTotalItens.asCurrency;

  qryServicosContratosimpostossn.asCurrency :=
      (qryServicosContratosTotalItens.asCurrency * qryServicosContratosaliquotaicms_sn.asCurrency / 100);

  qryServicosContratosMargemLucrosn.asCurrency :=
      (qryServicosContratosTotalItens.asCurrency - (qryServicosContratosTotalItens.asCurrency * qryServicosContratosaliquotaicms_sn.asCurrency / 100));

  if qryServicosContratosTotalItens.asCurrency <> 0 then
    qryServicosContratosPercentualMargemLucrosn.asCurrency :=
        (((qryServicosContratosTotalItens.asCurrency - (qryServicosContratosTotalItens.asCurrency * qryServicosContratosaliquotaicms_sn.asCurrency / 100)) * 100) / qryServicosContratosTotalItens.asCurrency);

end;

procedure TfrmVisualizarCustoVenda.qryOrcamentosCalcFields(
  DataSet: TDataSet);
begin
  inherited;

    qryOrcamentosTotalComissaoVendedor.asCurrency :=
    (qryOrcamentosvalorcontratoavista.asCurrency *
      qryOrcamentospercvista.asCurrency/100) +
    (qryOrcamentosvalorcontratoaprazo.asCurrency *
      qryOrcamentospercprazo.asCurrency/100) +
    (qryOrcamentosvalorcontratoentrada.asCurrency *
      qryOrcamentospercentrada.asCurrency/100);

  qryOrcamentosPercComissaoVendedor.AsCurrency :=
    (qryOrcamentosTotalComissaoVendedor.asCurrency * 100) / qryOrcamentosvalorprazo.AsCurrency;


  qryOrcamentosvaloricms_agregado.AsCurrency := qryOrcamentosvaloricms.AsCurrency +
                                               qryOrcamentosvICMSUFDest.AsCurrency +
                                               qryOrcamentosvICMSUFRemet.AsCurrency;

  qryOrcamentosTotalLiquidoProdutos.asCurrency := qryOrcamentostotalitens.asCurrency -
                                         qryOrcamentosdescontofinanceiro.asCurrency +
                                         qryOrcamentosacrescimofinanceiro.asCurrency +
                                         qryOrcamentosfrete.asCurrency +
                                         qryOrcamentosseguro.asCurrency +
                                         qryOrcamentostotalipi.asCurrency {+
                                         qryOrcamentosvaloricmssubstituicao.asCurrency};

  qryOrcamentosLiquidoServicos.asCurrency := qryOrcamentostotalservico.asCurrency - qryOrcamentosimpostoretido.asCurrency;

  qryOrcamentosTotalVenda.asCurrency :=  qryOrcamentosTotalLiquidoProdutos.asCurrency +
                                        qryOrcamentosvaloricmssubstituicao.asCurrency +
                                        qryOrcamentosLiquidoServicos.asCurrency;

  qryOrcamentosPercentualTotalCusto.ascurrency := 0;
  if (qryOrcamentostotalcusto.asCurrency <> 0) and (qryOrcamentosTotalLiquidoProdutos.asCurrency <> 0) then
    qryOrcamentosPercentualTotalCusto.ascurrency := (qryOrcamentostotalcusto.asCurrency * 100) / qryOrcamentosTotalLiquidoProdutos.asCurrency;

  qryOrcamentosPercentualFrete_Pago.ascurrency := 0;
  if (qryOrcamentosfrete_pago.asCurrency <> 0) and (qryOrcamentosTotalLiquidoProdutos.asCurrency <> 0) then
    qryOrcamentosPercentualFrete_Pago.ascurrency := (qryOrcamentosfrete_pago.asCurrency * 100) / qryOrcamentosTotalLiquidoProdutos.asCurrency;


  qryOrcamentosMargemBruta.asCurrency :=  qryOrcamentosTotalLiquidoProdutos.asCurrency -
        (qryOrcamentostotalcusto.asCurrency + qryOrcamentosfrete_pago.asCurrency + qryOrcamentosTotalComissaoVendedor.AsCurrency);


  qryOrcamentosMargemBrutaTotal.asCurrency := qryOrcamentosMargemBruta.asCurrency +  qryOrcamentosLiquidoServicos.asCurrency;

    //zerado por enquanto, pedido Ferrari 15/05/2018-JR
  qryOrcamentostotalvalorpis.asCurrency := 0{qryOrcamentosPisValorProdutos.asCurrency + qryOrcamentostotalvalorpis_servicos.asCurrency};

  qryOrcamentostotalvalorcofins.asCurrency := 0 {qryOrcamentosCofinsValorProdutos.asCurrency + qryOrcamentostotalvalorcofins_servicos.asCurrency};

  qryOrcamentosSomaMargemLucro.asCurrency := qryOrcamentosMargemBrutaTotal.asCurrency -
                                           qryOrcamentosvaloricms_agregado.ascurrency -  {ver quando}
                                           {qryOrcamentostotalvalorpis.asCurrency -
                                           qryOrcamentostotalvalorcofins.asCurrency -}
                                           qryOrcamentosvalorissqn.asCurrency;


  qryOrcamentosPercentualMargemLucro.asCurrency := 0;
  {
  if (qryOrcamentosSomaMargemLucro.asCurrency <> 0) and (qryOrcamentosMargemBrutaTotal.asCurrency <> 0) then
    qryOrcamentosPercentualMargemLucro.asCurrency := qryOrcamentosSomaMargemLucro.asCurrency * 100 / qryOrcamentosMargemBrutaTotal.asCurrency;
    }

  if (qryOrcamentosSomaMargemLucro.asCurrency <> 0) and (qryOrcamentosTotalVenda.asCurrency <> 0) then
    qryOrcamentosPercentualMargemLucro.asCurrency := qryOrcamentosSomaMargemLucro.asCurrency * 100 / qryOrcamentosTotalVenda.asCurrency;

  qryOrcamentosSomaMargemLucroProdutos.asCurrency := qryOrcamentosMargemBruta.asCurrency -
                                           qryOrcamentosvaloricms_agregado.ascurrency -
                                           {qryOrcamentosicmsvalorst.ascurrency -}
                                           {qryOrcamentospisvalorprodutos.asCurrency -
                                           qryOrcamentoscofinsvalorprodutos.asCurrency -}
                                           qryOrcamentosvaloripi.asCurrency;

  qryOrcamentosPercentualMargemLucroProdutos.asCurrency := 0;
  if (qryOrcamentosSomaMargemLucroProdutos.asCurrency <> 0) and ((qryOrcamentostotalprodutos.asCurrency + (qryOrcamentosfrete.asCurrency - qryOrcamentosfrete_pago.asCurrency)) <> 0) then
    qryOrcamentosPercentualMargemLucroProdutos.asCurrency :=  qryOrcamentosSomaMargemLucroProdutos.asCurrency * 100 / (qryOrcamentostotalprodutos.asCurrency + (qryOrcamentosfrete.asCurrency - qryOrcamentosfrete_pago.asCurrency));

  qryOrcamentosSomaMargemLucroServicos.asCurrency := qryOrcamentosLiquidoServicos.asCurrency -
                                                   qryOrcamentostotalvalorpis_servicos.asCurrency -
                                                   qryOrcamentostotalvalorcofins_servicos.asCurrency -
                                                   qryOrcamentosvalorissqn.asCurrency;

  qryOrcamentosPercentualMargemLucroServicos.asCurrency := 0;
  if (qryOrcamentosSomaMargemLucroServicos.asCurrency <> 0) and (qryOrcamentosLiquidoServicos.asCurrency <> 0) then
    qryOrcamentosPercentualMargemLucroServicos.asCurrency := qryOrcamentosSomaMargemLucroServicos.asCurrency * 100 / qryOrcamentosLiquidoServicos.asCurrency;

  qryOrcamentosSNProdutos.asCurrency := ((qryOrcamentosTotalLiquidoProdutos.asCurrency * qryOrcamentosaliquotaicms_sn.asCurrency) / 100);
  qryOrcamentosSNServicos.asCurrency := ((qryOrcamentosTotalServico.asCurrency * qryOrcamentosaliquotaicms_sn.asCurrency) / 100);

  qryOrcamentosSomaMargemLucroSN.asCurrency :=  qryOrcamentosMargemBrutaTotal.asCurrency -
                                              qryOrcamentosSNProdutos.asCurrency -
                                              qryOrcamentosSNServicos.asCurrency;

  qryOrcamentosPercentualMargemLucroSN.asCurrency := 0;
  {
  if (qryOrcamentosSomaMargemLucroSN.asCurrency <> 0) and (qryOrcamentosMargemBrutaTotal.asCurrency <> 0) then
    qryOrcamentosPercentualMargemLucroSN.asCurrency := qryOrcamentosSomaMargemLucroSN.asCurrency * 100 / qryOrcamentosMargemBrutaTotal.asCurrency;
    }

  if (qryOrcamentosSomaMargemLucroSN.asCurrency <> 0) and ((qryOrcamentostotalprodutos.asCurrency + (qryOrcamentosfrete.asCurrency - qryOrcamentosfrete_pago.asCurrency)) <> 0) then
    qryOrcamentosPercentualMargemLucroSN.asCurrency := qryOrcamentosSomaMargemLucroSN.asCurrency * 100 / (qryOrcamentostotalprodutos.asCurrency + (qryOrcamentosfrete.asCurrency - qryOrcamentosfrete_pago.asCurrency));

  qryOrcamentosSomaMargemLucroSNProdutos.asCurrency := qryOrcamentosMargemBruta.asCurrency - qryOrcamentosSNProdutos.asCurrency;

  qryOrcamentosPercentualMargemLucroSNProdutos.asCurrency := 0;
  if (qryOrcamentosSomaMargemLucroSNProdutos.asCurrency <> 0) and  ((qryOrcamentostotalprodutos.asCurrency + (qryOrcamentosfrete.asCurrency - qryOrcamentosfrete_pago.asCurrency)) <> 0) then
    qryOrcamentosPercentualMargemLucroSNProdutos.asCurrency :=  qryOrcamentosSomaMargemLucroSNProdutos.asCurrency * 100 / (qryOrcamentostotalprodutos.asCurrency + (qryOrcamentosfrete.asCurrency - qryOrcamentosfrete_pago.asCurrency));

  qryOrcamentosSomaMargemLucroSNServicos.asCurrency :=  qryOrcamentostotalservico.asCurrency - qryOrcamentosSNServicos.asCurrency;

  qryOrcamentosPercentualMargemLucroSNServicos.asCurrency := 0;
  if (qryOrcamentosSomaMargemLucroSNServicos.asCurrency <> 0) and (qryOrcamentostotalservico.asCurrency <> 0) then
   qryOrcamentosPercentualMargemLucroSNServicos.asCurrency := qryOrcamentosSomaMargemLucroSNServicos.asCurrency * 100 / qryOrcamentostotalservico.asCurrency;

end;

procedure TfrmVisualizarCustoVenda.qryProdutosOrcamentosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if qryProdutosOrcamentosicmsValorst.asCurrency = 0 then
    qryProdutosOrcamentosicmsValor_SemST.asCurrency := qryProdutosOrcamentosicmsValor.asCurrency +
                                                       qryProdutosOrcamentosvICMSUFDest.asCurrency +
                                                       qryProdutosOrcamentosvICMSUFRemet.asCurrency

  else
    qryProdutosOrcamentosicmsValor_SemST.clear;


  qryProdutosOrcamentosTotalVenda.asCurrency :=
    qryProdutosOrcamentosTotalItens.asCurrency -
    qryProdutosOrcamentosDesconto.asCurrency +
    qryProdutosOrcamentosAcrescimo.asCurrency +
    qryProdutosOrcamentosFrete.asCurrency +
    qryProdutosOrcamentosSeguro.asCurrency +
    qryProdutosOrcamentosValorIPI.asCurrency {+
    qryProdutosOrcamentosIcmsValorST.asCurrency};

       {
  if qryProdutosOrcamentosTotalCusto.asCurrency <> 0 then
    qryProdutosOrcamentospercentualCusto.asCurrency := ((qryProdutosOrcamentosTotalVenda.asCurrency -
                                                        qryProdutosOrcamentosTotalCusto.asCurrency)*100/qryProdutosOrcamentosTotalCusto.asCurrency)
  else
    qryProdutosOrcamentospercentualCusto.asCurrency := 0;
    }

  if qryProdutosOrcamentosTotalCusto.asCurrency <> 0 then
    qryProdutosOrcamentospercentualCusto.asCurrency := 100 - (qryProdutosOrcamentosTotalCusto.asCurrency*100)/qryProdutosOrcamentosTotalVenda.asCurrency
  else
    qryProdutosOrcamentospercentualCusto.asCurrency := 0;



  qryProdutosOrcamentosVendaBruta.asCurrency := qryProdutosOrcamentosTotalVenda.asCurrency - qryProdutosOrcamentosTotalCusto.asCurrency;

  qryProdutosOrcamentosMargemLucro.asCurrency := (qryProdutosOrcamentosTotalVenda.asCurrency - qryProdutosOrcamentosTotalCusto.asCurrency - qryProdutosOrcamentosIcmsValor_SemST.asCurrency {- qryProdutosOrcamentosIcmsValorST.asCurrency} - {qryProdutosOrcamentosPisValor.asCurrency - qryProdutosOrcamentosCofinsValor.asCurrency} - qryProdutosOrcamentosValorIPI.asCurrency);
  qryProdutosOrcamentosPercentualMargemLucro.asCurrency := (qryProdutosOrcamentosMargemLucro.asCurrency * 100) / qryProdutosOrcamentosTotalVenda.asCurrency;

  qryProdutosOrcamentosimpostossn.asCurrency := (qryProdutosOrcamentosTotalVenda.asCurrency * qryProdutosOrcamentosaliquotaicms_sn.asCurrency / 100);
  qryProdutosOrcamentosMargemLucrosn.asCurrency := (qryProdutosOrcamentosTotalVenda.asCurrency - qryProdutosOrcamentosTotalCusto.asCurrency) - qryProdutosOrcamentosimpostossn.asCurrency;
  qryProdutosOrcamentosPercentualMargemLucrosn.asCurrency := qryProdutosOrcamentosMargemLucrosn.asCurrency * 100 / qryProdutosOrcamentosTotalVenda.asCurrency;

end;

initialization
   AcionarTelaVisualizarCustoVenda :=  AcionarTelaVisualizarCustoVenda_;


end.
