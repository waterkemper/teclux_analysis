unit dmcadastronotasfiscais;

interface

uses                                                                        
  //CLX
  Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, DB,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Biblio
  ctconstantes,
  //Componentes
  cpquery, cpdatasource, cpnumero,
  //Repositorio
  dmbasico, dmtecsoft, ZTransact, MaskUtils, fmmensagemgrid,
  dmlancamentocontabilidade,
  dmimprimeautorizacaopagto,
  dmimprimefiscalgrafica, DateUtils, cptable, ACBrNFe,
  pcnNFeRTXT, pcnConversao, pcnconversaonfe, ACBrNFe.Conversao, variants, DBClient, Provider, ACBrBase, ACBrDFe,
  ACBrNFSe, ZSqlTypes, ACBrCTe, StrUtils, pcteConversaoCTe,
  AdvSmoothProgressBar, cpdbgrid, dmCalcularCusto, dmcadastronotasfiscaisauxiliar;

type
  tOperationClientDataSet = (Open, Close, Open_and_Close);
  tModoGrade = (SomenteItemAtual, Todos);

type


  TdtmCadastroNotasFiscais = class(TdtmBasico)
    qryNotaFiscal: TtecQuery;
    dsrNotaFiscal: TtecDataSource;
    qryProcuraFornecedores: TtecQuery;
    qryProcuraFornecedorescodigo: TIntegerField;
    qryProcuraFornecedoresnome: TStringField;
    dsrProcuraFornecedores: TtecDataSource;
    qryConsultaNotasFiscais: TtecQuery;
    qryConsultaNotasFiscaisfornecedor: TIntegerField;
    qryConsultaNotasFiscaisserie: TStringField;
    qryConsultaNotasFiscaisnumero: TIntegerField;
    qryConsultaNotasFiscaisfilial: TIntegerField;
    qryConsultaNotasFiscaiscodigofiscal: TIntegerField;
    qryConsultaNotasFiscaisdata: TDateField;
    qryConsultaNotasFiscaisemissao: TDateField;
    qryProcuraSeriesFornecedor: TtecQuery;
    qryProcuraSeriesFornecedorfornecedor: TIntegerField;
    qryProcuraSeriesFornecedorserie: TStringField;
    dsrProcuraSeriesFornecedor: TtecDataSource;
    qryConsultaFornecedores: TtecQuery;
    qryConsultaSeriesFornecedor: TtecQuery;
    qryConsultaSeriesFornecedorfornecedor: TIntegerField;
    qryConsultaSeriesFornecedorserie: TStringField;
    qryConsultaEstados: TtecQuery;
    qryProcuraEstados: TtecQuery;
    dsrProcuraEstados: TtecDataSource;
    qryConsultaEstadoscodigo: TStringField;
    qryConsultaEstadosnome: TStringField;
    qryProcuraEstadoscodigo: TStringField;
    qryProcuraEstadosnome: TStringField;
    qryProcuraFornecedoresestado: TStringField;
    qryDuplicatas: TtecQuery;
    qryDuplicatasdatavencto: TDateField;
    qryDuplicatasvalorvencto: TFloatField;
    qryDuplicatasvalordesconto: TFloatField;
    qryDuplicatasdocumentopag: TIntegerField;
    dsrDuplicatas: TtecDataSource;
    qryProdutosNotaFiscal: TtecQuery;
    dsrProdutosNotaFiscal: TtecDataSource;
    qryProcuraPedidosNotaFiscal: TtecQuery;
    qryProcuraPedidosNotaFiscalnumero: TIntegerField;
    dsrProcuraPedidosNotaFiscal: TtecDataSource;
    qryProcuraProdutoNotaFiscal: TtecQuery;
    dsrProcuraProdutoNotaFiscal: TtecDataSource;
    qryConsultaProdutosNotaFiscal: TtecQuery;
    qryConsultaProdutosNotaFiscalcodigo: TLargeintField;
    qryConsultaProdutosNotaFiscaldescricao: TStringField;
    qryProdutosRecebidos: TtecQuery;
    qryProdutosRecebidosquantidade: TFloatField;
    qryMovimentos: TtecQuery;
    qryMovimentosnumero: TIntegerField;
    qryMovimentosproduto: TLargeintField;
    qryMovimentosfilial: TIntegerField;
    qryMovimentosquantidade: TFloatField;
    qryMovimentostipomovimento: TStringField;
    qryMovimentosvalor: TFloatField;
    qryMovimentosreferencia: TStringField;
    spcMovimentosProximo: TtecQuery;
    spcMovimentosProximovalor: TIntegerField;
    qryConsultaProdutosNotaFiscalpreco: TFloatField;
    qryNotaFiscalfornecedor: TIntegerField;
    qryNotaFiscalserie: TStringField;
    qryNotaFiscalfilial: TIntegerField;
    qryNotaFiscalcodigofiscal: TIntegerField;
    qryNotaFiscalemissao: TDateField;
    qryNotaFiscalestado: TStringField;
    qryNotaFiscalreferencia: TStringField;
    qryNotaFiscalvalornota: TFloatField;
    qryNotaFiscalfreteinterno: TFloatField;
    qryNotaFiscaldesconto: TFloatField;
    qryNotaFiscalirretido: TFloatField;
    qryValidarCNPJ: TtecQuery;
    qryProcuraFornecedorespessoanumero: TStringField;
    qryValidarCNPJpessoanumero: TStringField;
    qryConsultaFornecedorescodigo: TIntegerField;
    qryConsultaFornecedoresnome: TStringField;
    qryConsultaFornecedorespessoanumero: TStringField;
    qryConsultaFornecedoresestado: TStringField;
    qryConsultaNaturezas: TtecQuery;
    qryConsultaNaturezascodigofiscal: TIntegerField;
    qryConsultaNaturezascodigo: TIntegerField;
    qryProcuraNaturezas: TtecQuery;
    qryProcuraNaturezasdescricao: TStringField;
    qryProcuraNaturezascodigofiscal: TIntegerField;
    qryProcuraNaturezastipomovimento: TStringField;
    dsrProcuraNaturezas: TtecDataSource;
    qryDocumentoPag: TtecQuery;
    qryDocumentoPagnumero: TIntegerField;
    qryDocumentoPagfornecedor: TIntegerField;
    qryDocumentoPagemissao: TDateField;
    qryDocumentoPagfilialemissao: TIntegerField;
    qryDocumentoPagreferencia: TStringField;
    qryDocumentoPagvalor: TFloatField;
    qryDocumentoPagirretido: TFloatField;
    qryDocumentoPaginssretido: TFloatField;
    qryDocumentoPagissretido: TFloatField;
    spcDocumentoPag: TtecQuery;
    qryNotaFiscaltipofornecedor: TStringField;
    qryNotaFiscalcontrato: TStringField;
    qryNotaFiscalseguro: TFloatField;
    qryNotaFiscaldespesasacessorias: TFloatField;
    qryNotaFiscalbaseicmssubstituicao: TFloatField;
    qryNotaFiscalvaloricmssubstituicao: TFloatField;
    qryNotaFiscaldocumentopag: TIntegerField;
    qryNotaFiscalfornecedorconhecimentofrete: TIntegerField;
    qryNotaFiscalserieconhecimentofrete: TStringField;
    qryNotaFiscalnumeroconhecimentofrete: TIntegerField;
    qryNotaFiscalissretido: TFloatField;
    qryNotaFiscalinssretido: TFloatField;
    dsrProcuraFornecConhecFrete: TtecDataSource;
    qryICMSFrete: TtecQuery;
    qryICMSSeguro: TtecQuery;
    qryICMSFretevalor: TFloatField;
    qryICMSSegurovalor: TFloatField;
    qryNotaFiscalacrescimo: TFloatField;
    qryConsultaConhecimentoFrete: TtecQuery;
    qryConsultaConhecimentoFretefornecedor: TIntegerField;
    qryConsultaConhecimentoFretecnpj: TStringField;
    qryConsultaConhecimentoFreteserie: TStringField;
    qryConsultaConhecimentoFretenumero: TIntegerField;
    qryConsultaConhecimentoFretevalornota: TFloatField;
    qryConsultaConhecimentoFretevaloricms: TFloatField;
    qryConsultaConhecimentoFretenomefornecedor: TStringField;
    qryConsultaFornecedorescnpj: TStringField;
    dsrConhecimentoFrete: TtecDataSource;
    qryNotaFiscalicmsfrete: TFloatField;
    qryNotaFiscalicmsseguro: TFloatField;
    qryProcuraFornecedoresinscricaoestadual: TStringField;
    qryNotaFiscalcnpj: TStringField;
    qryNotaFiscalinscricaoestadual: TStringField;
    qryProcuraFornecConhecFrete: TtecQuery;
    qryProcuraFornecConhecFretecodigo: TIntegerField;
    qryProcuraFornecConhecFretenome: TStringField;
    qryProcuraSerieFornecConFrete: TtecQuery;
    qryProcuraSerieFornecConFretefornecedor: TIntegerField;
    qryProcuraSerieFornecConFreteserie: TStringField;
    dsrProcuraSerieFornecConFrete: TtecDataSource;
    qryDuplicatasdatapagto: TDateField;
    qryDuplicatasvalorpagto: TFloatField;
    qryDocumentoPagtipofornecedor: TStringField;
    qryDocumentoPagpisretido: TFloatField;
    qryDocumentoPagcofinsretido: TFloatField;
    qryNotaFiscalpisretido: TFloatField;
    qryNotaFiscalcofinsretido: TFloatField;
    qryExisteDuplicataPagas: TtecQuery;
    qryExisteDuplicataPagassim: TBooleanField;
    qryFornecedorProduto: TtecQuery;
    qryFornecedorProdutofornecedor: TIntegerField;
    qryFornecedorProdutocaracteristica: TLargeintField;
    spcRecalcularValores: TtecQuery;
    qryNotaFiscalcsllretido: TFloatField;
    qryDocumentoPagcsllretido: TFloatField;
    qryProcuraNaturezasgerarpagamento: TBooleanField;
    qryConsultaFornecedorestipo: TStringField;
    qryDuplicatasnumero: TIntegerField;
    qryConsultaFornecedorestipoorignal: TStringField;
    qryDocumentoPagprevisao: TBooleanField;
    qryProcuraFornecedorestipo: TStringField;
    qryConsultaNotasFiscaistipofornecedor: TStringField;
    qryNotaFiscalvalorconhecimentofrete: TFloatField;
    qryNotaFiscalicmsconhecimentofrete: TFloatField;
    qryMovimentosoperacao: TStringField;
    qryMovimentosemestoque: TFloatField;
    qryMovimentosreservado: TFloatField;
    qryMovimentostransito: TFloatField;
    qryMovimentosdemonstracao: TFloatField;
    qryMovimentosconserto: TFloatField;
    qryMovimentosfuturo: TFloatField;
    qryMovimentosdanificada: TFloatField;
    qryMovimentosfinanceiro: TFloatField;
    qryMovimentostrfproduto: TLargeintField;
    qryMovimentostrffilial: TIntegerField;
    qryMovimentostrfmovimento: TIntegerField;
    qryEstoque: TtecQuery;
    qryEstoqueproduto: TLargeintField;
    qryEstoquefilial: TIntegerField;
    qryEstoquedatacompra: TDateField;
    qryEstoqueQtdecompra: TFloatField;
    qryEstoqueprecosemicms: TFloatField;
    qryEstoqueultimaentrada: TDateField;
    qryDocumentoPagcomplemento: TStringField;
    qryDuplicatastipojuros: TStringField;
    qryDuplicatastipomulta: TStringField;
    qryDuplicatasjuros: TFloatField;
    qryDuplicatasmulta: TFloatField;
    qryProdutosPedidos: TtecQuery;
    qryPedidos: TtecQuery;
    qryPedidosnumero: TIntegerField;
    qryPrevisao: TtecQuery;
    qryPrevisaonumero: TIntegerField;
    qryPrevisaoDuplicatas: TtecQuery;
    qryPrevisaoDuplicatasdocumentopag: TIntegerField;
    qryPrevisaoDuplicatasdatavencto: TDateField;
    qryPrevisaoDuplicatasvalorvencto: TFloatField;
    qryPrevisaofornecedor: TIntegerField;
    qryPrevisaotipofornecedor: TStringField;
    qryPrevisaoprevisao: TBooleanField;
    qryPrevisaoemissao: TDateField;
    qryPrevisaofilialemissao: TIntegerField;
    qryPrevisaoreferencia: TStringField;
    qryPrevisaovalor: TFloatField;
    qryPrevisaoirretido: TFloatField;
    qryPrevisaoinssretido: TFloatField;
    qryPrevisaoissretido: TFloatField;
    qryPrevisaopisretido: TFloatField;
    qryPrevisaocofinsretido: TFloatField;
    qryPrevisaocsllretido: TFloatField;
    qryPrevisaocomplemento: TStringField;
    qryPrevisaoDuplicatasnumero: TIntegerField;
    qryPrevisoesPedidos: TtecQuery;
    qryPrevisoesPedidospedido: TIntegerField;
    qryPrevisoesPedidosnumero: TIntegerField;
    qryPrevisoesPedidosdias: TIntegerField;
    qryPrevisoesPedidospercentual: TFloatField;
    qryPrevisoesPedidosdata: TDateField;
    qryPrevisoesPedidostotal: TFloatField;
    qryPrevisoesPedidosparcial: TFloatField;
    qryPrevisoesPedidosvalor: TFloatField;
    qryPedidosfornecedor: TIntegerField;
    qryPedidosemissao: TDateField;
    qryPedidosfilialfatura: TIntegerField;
    qryPedidostotalpedido: TFloatField;
    qryDocumentoPagpedido: TIntegerField;
    qryPrevisaopedido: TIntegerField;
    qryProcuraFornecedoresmarkup: TFloatField;
    qryConsultaProdutosNotaFiscalcodigopreco: TIntegerField;
    qryDuplicatasautorizado: TBooleanField;
    qryNotaFiscaltotalprodutos: TFloatField;
    qryNotaFiscalvalorprodutos: TFloatField;
    qrySeriesFiliais: TtecQuery;
    qrySeriesFiliaisfilial: TIntegerField;
    qrySeriesFiliaisvalor: TStringField;
    qrySeriesFiliaisnumeroinicial: TIntegerField;
    qrySeriesFiliaisnumerofinal: TIntegerField;
    qrySeriesFiliaismodelonota: TIntegerField;
    qryNotaFiscalnatureza: TStringField;
    qryProcuraNaturezasoperacao: TStringField;
    qryProcuraFornecedorespessoatipo: TStringField;
    qryNotaFiscalpermitirimprimir: TBooleanField;
    qryPedidossituacao: TStringField;
    spcNotaFiscal: TtecQuery;
    spcNotaFiscalproximocodigo: TIntegerField;
    qryMovNotaFiscal: TtecQuery;
    qryMovNotaFiscalnumero: TIntegerField;
    qryMovNotaFiscalproduto: TLargeintField;
    qryMovimentoscodigonota: TIntegerField;
    qryNotaFiscalobservacoes: TStringField;
    qryNotaFiscalfornecedortransporte: TIntegerField;
    qryNotaFiscalestadoplaca: TStringField;
    qryNotaFiscalplaca: TStringField;
    qryNotaFiscalviatransporte: TStringField;
    dsrProcuraFornecedorTransporte: TtecDataSource;
    qryProcuraFornecedorTransporte: TtecQuery;
    qryProcuraFornecedorTransportecodigo: TIntegerField;
    qryProcuraFornecedorTransporterazao: TStringField;
    dsrProcuraEstadoPlaca: TtecDataSource;
    qryProcuraEstadoPlaca: TtecQuery;
    qryProcuraEstadoPlacanome: TStringField;
    qryProcuraEstadoPlacacodigo: TStringField;
    qryConsultaFornecedorTransporte: TtecQuery;
    qryConsultaFornecedorTransportepessoanumero: TStringField;
    qryConsultaFornecedorTransportecodigo: TIntegerField;
    qryConsultaFornecedorTransporteestado: TStringField;
    qryPedidosconcluido: TDateField;
    qryConsultaFornecedoresnomecidade: TStringField;
    qryConsultaFornecedorTransportenome: TStringField;
    qryConsultaFornecedorTransportenomecidade: TStringField;
    qryProcuraNaturezasdescricaocfop: TStringField;
    qryMovimentosprecocomicms: TFloatField;
    qryMovimentosprecosemicms: TFloatField;
    qryMovimentosaliquotaipi: TFloatField;
    qryEstoqueprecocomicms: TFloatField;
    qryEstoquefinanceiro: TFloatField;
    qryEstoquealiquotaipi: TFloatField;
    qryEstoqueemestoque: TFloatField;
    qryEstoquereservado: TFloatField;
    qryEstoquetransito: TFloatField;
    qryEstoquedemonstracao: TFloatField;
    qryEstoqueconserto: TFloatField;
    qryEstoquefuturo: TFloatField;
    qryEstoquedanificada: TFloatField;
    qryEstoqueestoquefisico: TFloatField;
    qryUltimaCompra: TtecQuery;
    qryUltimaCompranumero: TIntegerField;
    qryUltimaCompraproduto: TLargeintField;
    qryUltimaComprafilial: TIntegerField;
    qryUltimaCompradata: TDateTimeField;
    qryUltimaCompraquantidade: TFloatField;
    qryUltimaCompratipomovimento: TStringField;
    qryUltimaCompraoperacao: TStringField;
    qryUltimaCompraemestoque: TFloatField;
    qryUltimaComprareservado: TFloatField;
    qryUltimaCompratransito: TFloatField;
    qryUltimaComprademonstracao: TFloatField;
    qryUltimaCompraconserto: TFloatField;
    qryUltimaComprafuturo: TFloatField;
    qryUltimaCompradanificada: TFloatField;
    qryUltimaComprafinanceiro: TFloatField;
    qryUltimaCompravalor: TFloatField;
    qryUltimaCompraprecocomicms: TFloatField;
    qryUltimaCompraprecosemicms: TFloatField;
    qryUltimaCompraaliquotaipi: TFloatField;
    qryUltimaComprareferencia: TStringField;
    qryUltimaCompratrfproduto: TLargeintField;
    qryUltimaCompratrffilial: TIntegerField;
    qryUltimaCompratrfmovimento: TIntegerField;
    qryUltimaCompracodigonota: TIntegerField;
    qryUltimaEntrada: TtecQuery;
    qryUltimaEntradanumero: TIntegerField;
    qryUltimaEntradaproduto: TLargeintField;
    qryUltimaEntradafilial: TIntegerField;
    qryUltimaEntradadata: TDateTimeField;
    qryUltimaEntradaquantidade: TFloatField;
    qryUltimaEntradatipomovimento: TStringField;
    qryUltimaEntradaoperacao: TStringField;
    qryUltimaEntradaemestoque: TFloatField;
    qryUltimaEntradareservado: TFloatField;
    qryUltimaEntradatransito: TFloatField;
    qryUltimaEntradademonstracao: TFloatField;
    qryUltimaEntradaconserto: TFloatField;
    qryUltimaEntradafuturo: TFloatField;
    qryUltimaEntradadanificada: TFloatField;
    qryUltimaEntradafinanceiro: TFloatField;
    qryUltimaEntradavalor: TFloatField;
    qryUltimaEntradaprecocomicms: TFloatField;
    qryUltimaEntradaprecosemicms: TFloatField;
    qryUltimaEntradaaliquotaipi: TFloatField;
    qryUltimaEntradareferencia: TStringField;
    qryUltimaEntradatrfproduto: TLargeintField;
    qryUltimaEntradatrffilial: TIntegerField;
    qryUltimaEntradatrfmovimento: TIntegerField;
    qryUltimaEntradacodigonota: TIntegerField;
    qryMovimentosestoquefisico: TFloatField;
    qryProcuraFornecedoresgrupofornecedor: TIntegerField;
    qryConsultaProdutosNotaFiscalvalorgrade1: TStringField;
    qryProdutosDadosFiscais: TtecQuery;
    qryProdutosDadosFiscaisquantidade: TFloatField;
    qryProdutosDadosFiscaisaliquotaicms: TFloatField;
    qryProdutosDadosFiscaisproduto: TLargeintField;
    qryProdutosDadosFiscaisfilial: TIntegerField;
    qryProdutosDadosFiscaisprecovenda: TFloatField;
    qryProdutosDadosFiscaisprodutodescricao: TStringField;
    qryProdutosDadosFiscaisunidade: TStringField;
    qryProdutosDadosFiscaisorigem: TIntegerField;
    qryProdutosDadosFiscaismarcadescricao: TStringField;
    qryProdutosDadosFiscaisprecototal: TFloatField;
    qryProdutosDadosFiscaisdadofiscal: TIntegerField;
    qryProdutosDadosFiscaisincidencia: TStringField;
    qryProdutosDadosFiscaisobslegal: TStringField;
    qryProdutosDadosFiscaisreferencia: TStringField;
    qryProdutosDadosFiscaislocalizacao: TStringField;
    qryProcuraNaturezasentrada: TStringField;
    qryProcuraNotaFiscalProdutos: TtecQuery;
    dsrProcuraNotaFiscalProduto: TtecDataSource;
    qryProcuraNotaFiscalProdutosdadofiscal: TIntegerField;
    qryProcuraNotaFiscalProdutosnumero: TIntegerField;
    qryProcuraFiliais: TtecQuery;
    dsrProcuraFiliais: TtecDataSource;
    qryProcuraSerieFiliais: TtecQuery;
    dsrProcuraSerieFiliais: TtecDataSource;
    qryConsultaSeriesFiliais: TtecQuery;
    qryProcuraSerieFiliaisfilial: TIntegerField;
    qryProcuraSerieFiliaisserie: TStringField;
    qryConsultaNotaFiscalProdutos: TtecQuery;
    qryProcuraNotaFiscalProdutosfilial: TIntegerField;
    qryProcuraNotaFiscalProdutosserie: TStringField;
    qryConsultaNotaFiscalProdutosfilial: TIntegerField;
    qryConsultaNotaFiscalProdutosserie: TStringField;
    qryConsultaNotaFiscalProdutosnumero: TIntegerField;
    qryProcuraFiliaiscodigo: TIntegerField;
    qryProcuraFiliaisnome: TStringField;
    qryConsultaSeriesFiliaisfilial: TIntegerField;
    qryConsultaSeriesFiliaisserie: TStringField;
    qryGrade: TtecQuery;
    dsrGrade: TtecDataSource;
    qryProdutosNotaFiscaldescricaolc: TStringField;
    qryLinhas: TtecQuery;
    dsrLinhas: TtecDataSource;
    spcProdutoProximo: TtecQuery;
    spcProdutoProximocodigo: TLargeintField;
    qryProdutosInclusao: TtecQuery;
    qryEstoques: TtecQuery;
    qryEstoquesproduto: TLargeintField;
    qryEstoquesfilial: TIntegerField;
    qryEstoqueslocalizacao: TStringField;
    qryEstoquesminimo: TFloatField;
    qryEstoquesmaximo: TFloatField;
    qryEstoquesdescricaofilial: TStringField;
    qryEstoquesemestoque: TFloatField;
    qryEstoquesreservado: TFloatField;
    qryEstoquestransito: TFloatField;
    qryEstoquesdemonstracao: TFloatField;
    qryEstoquesconserto: TFloatField;
    qryEstoquesfuturo: TFloatField;
    qryEstoquesdanificada: TFloatField;
    qryEstoquesestoquefisico: TFloatField;
    qryFiliais: TtecQuery;
    qryFiliaiscodigo: TIntegerField;
    qryConsultaProdutosNotaFiscalreferencia: TStringField;
    qryNotaFiscalcodigonatureza: TIntegerField;
    qryProcuraNaturezascodigo: TIntegerField;
    qryDuplicatasobservacao: TStringField;
    qryNotaFiscalTotalQtdeProdutos: TFloatField;
    qryNotaFiscalEvento: TIntegerField;
    qryDocumentoPagEvento: TIntegerField;
    qryPrevisaoEvento: TIntegerField;
    qryNotaFiscalsituacao: TStringField;
    qryNotaFiscaldescricaosituacao: TStringField;
    qryProcuraContaContabil: TtecQuery;
    qryProcuraContaContabilcodigo: TIntegerField;
    qryProcuraContaContabilclassificacao: TStringField;
    qryProcuraContaContabildescricao: TStringField;
    dsrProcuraContaContabil: TtecDataSource;
    qryDocumentoPagdatalancto: TDateField;
    qryProcuraFornecedoresdebito: TIntegerField;
    qryProcuraFornecedorescredito: TIntegerField;
    qryProcuraNaturezasdebitar: TIntegerField;
    qryProcuraNaturezascreditar: TIntegerField;
    qryProcuraNaturezashistorico: TIntegerField;
    qryNotaFiscalobslivroentrada: TStringField;
    qryDuplicatasevento: TIntegerField;
    qryLancamentosNaturezas: TtecQuery;
    qryLancamentosNaturezasdescricao: TStringField;
    qryLancamentosNaturezasnatureza: TIntegerField;
    qryLancamentosNaturezasoperacao: TStringField;
    qryLancamentosNaturezascontacontabil: TIntegerField;
    qryLancamentosNaturezashistorico: TIntegerField;
    qryLancamentosNaturezasdescricaocontacontabil: TStringField;
    qryLancamentosNaturezasclassificacao: TStringField;
    qryTotais: TtecQuery;
    dsrTotais: TtecDataSource;
    qryTotaistotaldebito: TFloatField;
    qryTotaistotalcredito: TFloatField;
    qryProcuraFornecedoresdescricaodebitoplanocontas: TStringField;
    qryProcuraFornecedoresclassificacaodebitoplanocontas: TStringField;
    qryProcuraFornecedoresdescricaocreditoplanocontas: TStringField;
    qryProcuraFornecedoresclassificacaocreditoplanocontas: TStringField;
    qryNotaFiscalvaloripi: TFloatField;
    qryDocumentoPagcreditar: TIntegerField;
    qryDocumentoPaghistorico: TIntegerField;
    qryContasEntradasFiliais: TtecQuery;
    dsrCalculosNotasPag: TtecDataSource;
    qryVenctosImpostosRetidosEntradas: TtecQuery;
    qryVenctosImpostosRetidosEntradasdescricao: TStringField;
    qryVenctosImpostosRetidosEntradasquinzenal: TBooleanField;
    qryVenctosImpostosRetidosEntradasparametro_inicial: TStringField;
    qryVenctosImpostosRetidosEntradasdia: TIntegerField;
    qryVenctosImpostosRetidosEntradasparametro_final: TStringField;
    qryVenctosImpostosRetidosEntradasocasiao: TStringField;
    qryVenctosImpostosRetidosEntradasfornecedor: TIntegerField;
    qryVenctosImpostosRetidosEntradastipofornecedor: TStringField;
    qryContasEntradasFiliaiscontacontabil: TIntegerField;
    qryContasEntradasFiliaisdescricao: TStringField;
    qryContasEntradasFiliaisclassificacao: TStringField;
    qryContasEntradasFiliaisdescricaocontacontabil: TStringField;
    qryContasEntradasFiliaisoperacao: TStringField;
    qryDocumentosPagImpostosRetidos: TtecQuery;
    qryDocumentosPagImpostosRetidosnumero: TIntegerField;
    qryDocumentosPagImpostosRetidosfornecedor: TIntegerField;
    qryDocumentosPagImpostosRetidosemissao: TDateField;
    qryDocumentosPagImpostosRetidosdatalancto: TDateField;
    qryDocumentosPagImpostosRetidoscomplemento: TStringField;
    qryDocumentosPagImpostosRetidosevento: TIntegerField;
    qryDocumentosPagImpostosRetidosfilialemissao: TIntegerField;
    qryDocumentosPagImpostosRetidosreferencia: TStringField;
    qryDocumentosPagImpostosRetidosvalor: TFloatField;
    qryDocumentosPagImpostosRetidosirretido: TFloatField;
    qryDocumentosPagImpostosRetidosinssretido: TFloatField;
    qryDocumentosPagImpostosRetidosissretido: TFloatField;
    qryDocumentosPagImpostosRetidoscofinsretido: TFloatField;
    qryDocumentosPagImpostosRetidospisretido: TFloatField;
    qryDocumentosPagImpostosRetidoscsllretido: TFloatField;
    qryDocumentosPagImpostosRetidostipofornecedor: TStringField;
    qryDocumentosPagImpostosRetidosprevisao: TBooleanField;
    qryDocumentosPagImpostosRetidospedido: TIntegerField;
    qryDocumentosPagImpostosRetidoscreditar: TIntegerField;
    qryDocumentosPagImpostosRetidoshistorico: TIntegerField;
    qryDocumentosPagImpostosRetidosdocumentopagorigem: TIntegerField;
    qryDocumentosPagImpostosRetidosdatavenctoorigem: TDateField;
    qryDocumentosPagImpostosRetidosnumeroorigem: TIntegerField;
    qryDuplicatasImpostosRetidos: TtecQuery;
    qryDocumentoPagValorLiquido: TCurrencyField;
    qryDuplicatasdatavenctooriginal: TDateField;
    spcDocumentoPagcodigo: TIntegerField;
    qryProdutosInclusaocodigo: TLargeintField;
    qryProdutosInclusaocaracteristica: TLargeintField;
    qryProdutosInclusaodescricao: TStringField;
    qryProdutosInclusaovalorgrade1: TStringField;
    qryProdutosInclusaovalorgrade2: TStringField;
    qryProcuraFornecedoresrazao: TStringField;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryNotaFiscalvalorservicos: TFloatField;
    qryProdutosNotaFiscalTotalQuantidadeXPrecoUnitario: TCurrencyField;
    qryProdutosNotaFiscalTotalProdutoMaisIPI: TCurrencyField;
    qryAtualizarTabelaIPI: TtecQuery;
    qryDuplicatasValorAPagar: TCurrencyField;
    qryDuplicatasjaquitada: TBooleanField;
    qryDuplicatasbancocobranca: TIntegerField;
    qryNotaFiscalbaseicms: TFloatField;
    qryNotaFiscalvaloricms: TFloatField;
    qryProdutosNotaFiscalpercentualreducaobaseCVR: TCurrencyField;
    spcLancamentosProximo: TtecQuery;
    spcLancamentosProximocodigo: TIntegerField;
    qryAtualizaValorUltimaCompra: TtecQuery;
    qryFornecedorProdutogrupo: TStringField;
    qryConsultaProdutosNotaFiscalcodigovisual: TStringField;
    qryProdutosInclusaocodigovisual: TStringField;
    qryDuplicatasauxdatapagto: TDateField;
    qryProcuraNotaSaida: TtecQuery;
    dsrProcuraNotaSaida: TtecDataSource;
    qryConsultaNotaSaida: TtecQuery;
    dsrNotasSaidasFrete: TtecDataSource;
    qryConsultaNotaSaidanumero: TIntegerField;
    qryConsultaNotaSaidaserie: TStringField;
    qryConsultaNotaSaidafilial: TIntegerField;
    qryConsultaNotaSaidadadofiscal: TIntegerField;
    qryConsultaNotaSaidacliente: TIntegerField;
    qryConsultaNotaSaidanomecliente: TStringField;
    qryConsultaNotaSaidavalortotal: TFloatField;
    qryNotasSaidasFrete: TtecQuery;
    qryNotasSaidasFretecodigonotapag: TIntegerField;
    qryNotasSaidasFretenotasaida: TIntegerField;
    qryNotasSaidasFretedadofiscal: TIntegerField;
    qryMovimentosmoeda: TStringField;
    qryMovimentosvalormoeda: TFloatField;
    qryProcuraNaturezasProduto: TtecQuery;
    dsrProcuraNaturezasProduto: TtecDataSource;
    qryProcuraNaturezasProdutocodigofiscal: TIntegerField;
    qryProcuraNaturezasProdutodescricao: TStringField;
    qryProcuraNaturezasProdutocodigo: TIntegerField;
    qryProcuraNaturezasProdutotipomovimento: TStringField;
    qryProcuraNaturezasProdutoentrada: TStringField;
    qryProcuraNaturezasProdutooperacao: TStringField;
    qryProcuraNaturezasProdutodescricaocfop: TStringField;
    qryProcuraNaturezasProdutogerarpagamento: TBooleanField;
    qryProcuraNaturezasProdutodebitar: TIntegerField;
    qryProcuraNaturezasProdutodescricaodebitar: TStringField;
    qryProcuraNaturezasProdutoclassificacaodebitar: TStringField;
    qryProcuraNaturezasProdutocreditar: TIntegerField;
    qryProcuraNaturezasProdutodescricaocreditar: TStringField;
    qryProcuraNaturezasProdutoclassificacaocreditar: TStringField;
    qryProcuraNaturezasProdutohistorico: TIntegerField;
    qryConsultadadosFiscais: TtecQuery;
    dsrConsultaDadosFiscais: TtecDataSource;
    qryConsultadadosFiscaisfilial: TIntegerField;
    qryConsultadadosFiscaisserie: TStringField;
    qryConsultadadosFiscaisnumeronota: TIntegerField;
    qryConsultadadosFiscaisnumero: TIntegerField;
    qryConsultadadosFiscaisdata: TDateField;
    qryConsultadadosFiscaissituacao: TStringField;
    qryConsultadadosFiscaisfilialvenda: TIntegerField;
    qryConsultadadosFiscaisvalortotal: TFloatField;
    qryConsultadadosFiscaisvalorvista: TFloatField;
    qryConsultadadosFiscaisdesconto: TFloatField;
    qryConsultadadosFiscaisvalorfrete: TFloatField;
    qryConsultadadosFiscaisseguro: TFloatField;
    qryConsultadadosFiscaisvaloripi: TFloatField;
    qryConsultadadosFiscaisdespesasacessorias: TFloatField;
    qryConsultadadosFiscaiscodigofiscal: TIntegerField;
    qryConsultadadosFiscaisdescricaocfop: TStringField;
    qryConsultadadosFiscaisestadocfo: TStringField;
    qryConsultadadosFiscaisfilialemissao: TIntegerField;
    qryConsultadadosFiscaisnatureza: TStringField;
    qryConsultadadosFiscaisdescricaonatureza: TStringField;
    qryConsultadadosFiscaiscodigonatureza: TIntegerField;
    qryConsultadadosFiscaisdescricaosemprodutos: TStringField;
    qryConsultadadosFiscaisviatransporte: TStringField;
    qryConsultadadosFiscaisdatasaida: TDateField;
    qryConsultadadosFiscaisfornecedortransporte: TIntegerField;
    qryConsultadadosFiscaisfrete: TStringField;
    qryConsultadadosFiscaiscliente: TIntegerField;
    qryConsultadadosFiscaisnomecliente: TStringField;
    qryConsultadadosFiscaisclientecredito: TIntegerField;
    qryConsultadadosFiscaisclientedebito: TIntegerField;
    qryConsultadadosFiscaistipocliente: TStringField;
    qryConsultadadosFiscaisnome: TStringField;
    qryConsultadadosFiscaisrua: TStringField;
    qryConsultadadosFiscaisbairro: TIntegerField;
    qryConsultadadosFiscaisnomebairro: TStringField;
    qryConsultadadosFiscaiscidade: TIntegerField;
    qryConsultadadosFiscaisnomecidade: TStringField;
    qryConsultadadosFiscaisestado: TStringField;
    qryConsultadadosFiscaiscep: TIntegerField;
    qryConsultadadosFiscaispessoatipo: TStringField;
    qryConsultadadosFiscaispessoanumero: TStringField;
    qryConsultadadosFiscaisfonenumero: TIntegerField;
    qryConsultadadosFiscaisfoneddd: TIntegerField;
    qryConsultadadosFiscaisdocumento: TStringField;
    qryConsultadadosFiscaisobservacoes: TStringField;
    qryConsultadadosFiscaiscontrato: TStringField;
    qryConsultadadosFiscaisvendedor: TIntegerField;
    qryConsultadadosFiscaisagente: TIntegerField;
    qryConsultadadosFiscaisplano: TIntegerField;
    qryConsultadadosFiscaisprodutos: TFloatField;
    qryConsultadadosFiscaisacrescimo: TFloatField;
    qryConsultadadosFiscaisbaseicms: TFloatField;
    qryConsultadadosFiscaisvaloricms: TFloatField;
    qryConsultadadosFiscaisvalorissqn: TFloatField;
    qryConsultadadosFiscaistotalprodutos: TFloatField;
    qryConsultadadosFiscaistotalQtdeprodutos: TFloatField;
    qryConsultadadosFiscaisdebitar: TIntegerField;
    qryConsultadadosFiscaiscreditar: TIntegerField;
    qryConsultadadosFiscaishistorico: TIntegerField;
    qryConsultadadosFiscaisvalorservicos: TFloatField;
    qryConsultadadosFiscaisirretido: TFloatField;
    qryConsultadadosFiscaisinssretido: TFloatField;
    qryConsultadadosFiscaisissretido: TFloatField;
    qryConsultadadosFiscaiscofinsretido: TFloatField;
    qryConsultadadosFiscaispisretido: TFloatField;
    qryConsultadadosFiscaiscsllretido: TFloatField;
    qryConsultadadosFiscaistotalbaseicmssubstituicao: TFloatField;
    qryConsultadadosFiscaisok: TBooleanField;
    qryConsultadadosFiscaisobservacoescomplementar: TStringField;
    qryConsultadadosFiscaistotalvaloricmssubstituicao: TFloatField;
    qryAdicoesImportacao: TtecQuery;
    dsrAdicoesImportacao: TtecDataSource;
    qryDadosImportacoes: TtecQuery;
    dsrDadosImportacoes: TtecDataSource;
    qryProdutosImportados: TtecQuery;
    dsrProdutosImportados: TtecDataSource;
    qryDadosImportacoesdata: TDateField;
    qryDadosImportacoeslocaldesembaraco: TStringField;
    qryDadosImportacoesufdesembaraco: TStringField;
    qryDadosImportacoesdatadesembaraco: TDateField;
    qryDadosImportacoesexportador: TIntegerField;
    qryAdicoesImportacaonumero: TIntegerField;
    qryAdicoesImportacaofabricante: TIntegerField;
    qryAdicoesImportacaomercadoria: TFloatField;
    qryAdicoesImportacaofrete: TFloatField;
    qryAdicoesImportacaoembalagem: TFloatField;
    qryAdicoesImportacaothc: TFloatField;
    qryAdicoesImportacaoii: TFloatField;
    qryAdicoesImportacaoipi: TFloatField;
    qryAdicoesImportacaopis: TFloatField;
    qryAdicoesImportacaocofins: TFloatField;
    qryAdicoesImportacaosiscomex: TFloatField;
    qryAdicoesImportacaobaseicms: TFloatField;
    qryAdicoesImportacaovaloricms: TFloatField;
    qryAdicoesImportacaonomefabricante: TStringField;
    qryNotaFiscalndi: TStringField;
    qryDadosImportacoesnumero: TStringField;
    qryAdicoesImportacaodadoimportacao: TStringField;
    qryNotaFiscalfrete: TStringField;
    qryVolumesNotasPag: TtecQuery;
    qryVolumesNotasPagcodigo: TIntegerField;
    qryVolumesNotasPagvolumes: TIntegerField;
    qryVolumesNotasPagnumeracao: TStringField;
    qryVolumesNotasPagmarca: TStringField;
    qryVolumesNotasPagpesobruto: TFloatField;
    qryVolumesNotasPagpesoliquido: TFloatField;
    qryVolumesNotasPagespecietransporte: TStringField;
    dsrVolumesNotasPag: TtecDataSource;
    qryLacresVolumesNotasPag: TtecQuery;
    qryLacresVolumesNotasPagcodigovolume: TIntegerField;
    qryLacresVolumesNotasPaglacre: TStringField;
    dsrLacresVolumesNotasPag: TtecDataSource;
    qryVolumesNotasPagnotapag: TIntegerField;
    qryLacresVolumesNotasPagnotapag: TIntegerField;
    qryConhecimentoFrete: TtecQuery;
    qryConhecimentoFretefornecedor: TIntegerField;
    qryConhecimentoFretenomefornecedor: TStringField;
    qryConhecimentoFretecnpj: TStringField;
    qryConhecimentoFreteserie: TStringField;
    qryConhecimentoFretenumero: TIntegerField;
    qryConhecimentoFretevalornota: TFloatField;
    qryConhecimentoFretevaloricms: TFloatField;
    qryConhecimentoFretealiquota: TFloatField;
    qryConhecimentoFretevalorconhecimentofreteusadonanota: TFloatField;
    qryConhecimentoFreteicmsconhecimentofreteusadonanota: TFloatField;
    qryConhecimentoFretevalorsugestaoconhecimento: TCurrencyField;
    qryConhecimentoFreteicmssugestaoconhecimento: TCurrencyField;
    qryDadosImportacoestaxacambio: TFloatField;
    qryNotaFiscalversaolayout: TFloatField;
    qryNotaFiscalcodaleatorio: TIntegerField;
    qryNotaFiscalformapagto: TIntegerField;
    qryNotaFiscalformatodanfe: TIntegerField;
    qryNotaFiscalformaemissao: TIntegerField;
    qryNotaFiscaldigchaveacesso: TIntegerField;
    qryNotaFiscalambiente: TIntegerField;
    qryNotaFiscalfinalidadenf: TIntegerField;
    qryNotaFiscalprocemissao: TIntegerField;
    qryNotaFiscalversaoteclux: TStringField;
    qryNotaFiscaltotalimportacao: TFloatField;
    qryNotaFiscaltotalvalorpis: TFloatField;
    qryNotaFiscaltotalvalorcofins: TFloatField;
    qryNotaFiscalnomebairro: TStringField;
    qryNotaFiscalnomecidade: TStringField;
    qryNotaFiscalcidadeibge: TIntegerField;
    qryNotaFiscalpais: TIntegerField;
    qryNotaFiscalnomepais: TStringField;
    qryNotaFiscallocalretirada_cnpj: TStringField;
    qryNotaFiscallocalretirada_rua: TStringField;
    qryNotaFiscallocalretirada_numero: TStringField;
    qryNotaFiscallocalretirada_complemento: TStringField;
    qryNotaFiscallocalretirada_bairro: TIntegerField;
    qryNotaFiscallocalretirada_nomebairro: TStringField;
    qryNotaFiscallocalretirada_cidade: TIntegerField;
    qryNotaFiscallocalretirada_cep: TIntegerField;
    qryNotaFiscallocalretirada_nomecidade: TStringField;
    qryNotaFiscallocalretirada_cidadeibge: TIntegerField;
    qryNotaFiscallocalretirada_estado: TStringField;
    qryNotaFiscallocalentrega_cnpj: TStringField;
    qryNotaFiscallocalentrega_rua: TStringField;
    qryNotaFiscallocalentrega_numero: TStringField;
    qryNotaFiscallocalentrega_complemento: TStringField;
    qryNotaFiscallocalentrega_bairro: TIntegerField;
    qryNotaFiscallocalentrega_nomebairro: TStringField;
    qryNotaFiscallocalentrega_cidade: TIntegerField;
    qryNotaFiscallocalentrega_cep: TIntegerField;
    qryNotaFiscallocalentrega_nomecidade: TStringField;
    qryNotaFiscallocalentrega_cidadeibge: TIntegerField;
    qryNotaFiscallocalentrega_estado: TStringField;
    qryNotaFiscaltransportadora_cnpj: TStringField;
    qryNotaFiscaltransportadora_ie: TStringField;
    qryNotaFiscaltransportadora_nome: TStringField;
    qryNotaFiscaltransportadora_rua: TStringField;
    qryNotaFiscaltransportadora_bairro: TIntegerField;
    qryNotaFiscaltransportadora_nomebairro: TStringField;
    qryNotaFiscaltransportadora_cidade: TIntegerField;
    qryNotaFiscaltransportadora_nomecidade: TStringField;
    qryNotaFiscaltransportadora_cidadeibge: TIntegerField;
    qryNotaFiscaltransportadora_estado: TStringField;
    qryNotaFiscaltransportadora_rntc: TStringField;
    qryNotaFiscalendnumero: TIntegerField;
    qryNotaFiscalendcomplemento: TStringField;
    qryNotaFiscalinfcomplementar: TStringField;
    qryNotaFiscalnumlotenfe: TStringField;
    qryNotaFiscalnumrecibonfe: TStringField;
    qryNotaFiscalnumprotocolonfe: TStringField;
    qryProcuraNaturezasicmscst: TStringField;
    qryProcuraNaturezasipicst: TStringField;
    qryProcuraNaturezaspiscst: TStringField;
    qryProcuraNaturezascofinscst: TStringField;
    qryNotaFiscalnrdocumento: TIntegerField;
    qryNotaFiscaldata: TDateField;
    qryProdutosImportadosprodutovisual: TStringField;
    qryProdutosImportadosdescricao: TStringField;
    qryProdutosImportadosquantidade: TFloatField;
    qryProdutosImportadosvalor: TFloatField;
    qryProcuraFornecedoresrua: TStringField;
    qryProcuraFornecedoresbairro: TIntegerField;
    qryProcuraFornecedorescidade: TIntegerField;
    qryProcuraFornecedorescep: TIntegerField;
    qryProcuraFornecedoresfonenumero: TIntegerField;
    qryProcuraFornecedoresfoneddd: TIntegerField;
    qryProcuraFornecedoresnumero: TIntegerField;
    qryProcuraFornecedorescomplemento: TStringField;
    qryProcuraFornecedoresnomebairro: TStringField;
    qryProcuraFornecedoresnomecidade: TStringField;
    qryProcuraFornecedorescidadeibge: TIntegerField;
    qryNotaFiscalnome: TStringField;
    qryNotaFiscalrua: TStringField;
    qryNotaFiscalbairro: TIntegerField;
    qryNotaFiscalcidade: TIntegerField;
    qryNotaFiscalcep: TIntegerField;
    qryNotaFiscalfonenumero: TIntegerField;
    qryNotaFiscalfoneddd: TIntegerField;
    qryNotaFiscaliesubsttributario: TStringField;
    qryNotaFiscalsuframa: TStringField;
    qryProcuraNaturezasProdutoicmscst: TStringField;
    qryProcuraNaturezasProdutoipicst: TStringField;
    qryProcuraNaturezasProdutopiscst: TStringField;
    qryProcuraNaturezasProdutocofinscst: TStringField;
    qryConsultaProdutosNotaFiscalclasse: TStringField;
    qryFornecedorProdutoclasse: TStringField;
    dsrPrevisoesPedidos: TtecDataSource;
    qryProcuraNaturezascredbigualvalornota: TBooleanField;
    qryProcuraNaturezasgravarsemlanctos: TBooleanField;
    qryNotaFiscalfornecedorparaiss: TIntegerField;
    qryDocumentoPagfornecedorparaiss: TIntegerField;
    qryPedidosdatabase: TDateField;
    qryNotaFiscalpiscofinscsllretido: TFloatField;
    qryDocumentoPagpiscofinscsllretido: TFloatField;
    qryPrevisaoDataLancto: TDateField;
    qryNotaFiscalchv_nfe: TStringField;
    qryNotaFiscalmodelodocto: TStringField;
    qryNotaFiscalvalorservicos_nt: TFloatField;
    qryNotaFiscalvalorterceiros: TFloatField;
    qryNotaFiscalvalorpis: TFloatField;
    qryNotaFiscalvalorcofins: TFloatField;
    qryProcuraSeriesFornecedormodelodoctofiscal: TStringField;
    qryContaCreditoFornecedor: TtecQuery;
    dsrContaCreditoFornecedor: TtecDataSource;
    qryContaCreditoFornecedordescricao: TStringField;
    qryContaCreditoFornecedornatureza: TIntegerField;
    qryContaCreditoFornecedoroperacao: TStringField;
    qryContaCreditoFornecedorcontacontabil: TIntegerField;
    qryContaCreditoFornecedorhistorico: TIntegerField;
    qryEstadosICMS: TtecQuery;
    dsrEstadosICMS: TtecDataSource;
    qryEstadosICMScodigo: TIntegerField;
    qryEstadosICMSestado: TStringField;
    qryEstadosICMSvalornoestado: TFloatField;
    qryEstadosICMSvalorforaestado: TFloatField;
    qryNotaFiscalnumcancelamentonfe: TStringField;
    qryNaturezasPadrao: TtecQuery;
    qryNaturezasPadraodescricao: TStringField;
    qryNaturezasPadraonatureza: TIntegerField;
    qryNaturezasPadraocodigofiscal: TIntegerField;
    qryNaturezasPadraodescricaonatureza: TStringField;
    qryNaturezasPadraopiscst: TStringField;
    qryNaturezasPadraocofinscst: TStringField;
    qryNaturezasPadraoipicst: TStringField;
    qryNaturezasPadraoicmscst: TStringField;
    qryMovimentosdata: TDateField;
    qryProdutosImportadosdadoimportacao: TStringField;
    qryProdutosImportadosnumeroadicao: TIntegerField;
    qryProdutosImportadosproduto: TLargeintField;
    qryProdutosImportadosaliquotaipi: TFloatField;
    qryProcuraAdicoesImportacao: TtecQuery;
    dsrProcuraAdicoesImportacao: TtecDataSource;
    qryProcuraAdicoesImportacaodadoimportacao: TStringField;
    qryProcuraAdicoesImportacaonumero: TIntegerField;
    qryNotasPagDeclaracao: TtecQuery;
    qryNotasPagDeclaracaocodigo: TIntegerField;
    qryNotasPagDeclaracaofornecedor: TIntegerField;
    qryNotasPagDeclaracaoserie: TStringField;
    qryNotasPagDeclaracaonumero: TIntegerField;
    qryProdutosImportadosValorConvertido: TCurrencyField;
    qryProdutosImportadostotaladicao: TFloatField;
    qryProdutosImportadosadicaofechada: TBooleanField;
    qryProdutosImportadosaliquotaipiduplicadas: TBooleanField;
    qryAdicoesImportacaoaliquotaicms: TFloatField;
    qryAdicoesImportacaobaseicmscalculada: TCurrencyField;
    qryAdicoesImportacaovaloricmscalculado: TCurrencyField;
    qryProcuraFornecedorestipofornecimento_t: TBooleanField;
    qryNotaFiscalcreditar: TIntegerField;
    qryNotaFiscaldatahoraemissao: TDateTimeField;
    qryNotaFiscalregimetributario: TIntegerField;
    qryNotaFiscalnuminutilizacaonfe: TStringField;
    qryProcuraNaturezasProdutocsosn: TStringField;
    qryProcuraNaturezascsosn: TStringField;
    qryProcuraNaturezasdestacaripi: TBooleanField;
    qryCalculosProdutos: TtecQuery;
    qryCalculosProdutostipo: TStringField;
    qryCalculosProdutosincidencia: TStringField;
    qryCalculosProdutoscodigofiscal: TIntegerField;
    qryCalculosProdutosbasecalculo: TFloatField;
    qryCalculosProdutosaliquota: TFloatField;
    qryCalculosProdutosvalor: TFloatField;
    qryCalculosProdutosvalorst: TFloatField;
    qryCalculosProdutosisentas: TFloatField;
    qryCalculosProdutosoutras: TFloatField;
    dsrCalculosProdutos: TtecDataSource;
    qryNotaFiscalvalorvista: TFloatField;
    qryNotaFiscalvcredicmssn: TFloatField;
    qryNotaFiscalvicmsstret: TFloatField;
    qryProcuraNaturezasdiferenciada: TBooleanField;
    qryProcuraNaturezasProdutodiferenciada: TBooleanField;
    qryProcuraFornecedoresnaosubstituto: TBooleanField;
    qryNotaFiscalbaseicmscalculada: TFloatField;
    qryNotaFiscalvaloricmscalculada: TFloatField;
    qryNotaFiscalbaseicmssubstituicaocalculada: TFloatField;
    qryNotaFiscalvaloricmssubstituicaocalculada: TFloatField;
    qryNotaFiscalvaloripicalculada: TFloatField;
    qryNotaFiscalvalornotacalculada: TFloatField;
    qryDiferencas: TtecQuery;
    dsrDiferencas: TtecDataSource;
    qryDiferencasdescricao: TStringField;
    qryDiferencasvalornota: TFloatField;
    qryDiferencasvalorcalculado: TFloatField;
    qryDiferencasdiferenca: TFloatField;
    qryNaturezasPadraonaogerarcreditoicms: TBooleanField;
    qryProcuraNaturezasnaogerarcreditoicms: TBooleanField;
    qryProcuraNaturezasProdutonaogerarcreditoicms: TBooleanField;
    qryConsultaNaturezasnaogerarcreditoicms: TBooleanField;
    qryNaturezasPadraonaogerarcreditoipi: TBooleanField;
    qryProcuraNaturezasnaogerarcreditoipi: TBooleanField;
    qryProcuraNaturezasProdutonaogerarcreditoipi: TBooleanField;
    qryConsultaNaturezasnaogerarcreditoipi: TBooleanField;
    qryProcuraFornecedoresdistribuidor: TBooleanField;
    qryNotaFiscaldistribuidor: TBooleanField;
    qryCalculosProdutostotal: TFloatField;
    qryDuplicatasdataautorizacaopagto: TDateField;
    qryNaturezasPadraonaocalcularipisobrefrete: TBooleanField;
    qryProcuraNaturezasnaocalcularipisobrefrete: TBooleanField;
    qryProcuraNaturezasProdutonaocalcularipisobrefrete: TBooleanField;
    qryConsultaNaturezasnaocalcularipisobrefrete: TBooleanField;
    qryNotaFiscalnosimples: TBooleanField;
    qryProcuraFornecedoresnosimples: TBooleanField;
    qryNotaFiscaldhprocnfe: TDateTimeField;
    qryNotaFiscalhsaient: TDateTimeField;
    qryDocumentoPagfilialcontabil: TIntegerField;
    qryNaturezasPadraoicmssobreipi: TBooleanField;
    qryProcuraNaturezasicmssobreipi: TBooleanField;
    qryConsultaNaturezasicmssobreipi: TBooleanField;
    qryNotasSaidasFretesrienotapag: TIntegerField;
    qryConsultaProdutosNotaFiscaldescricaoprecoproduto: TStringField;
    ACBrNFe1: TACBrNFe;
    qryProdutosFornecedores: TtecQuery;
    qryProdutosFornecedoresproduto: TLargeintField;
    qryProdutosFornecedoresfornecedor: TIntegerField;
    qryProdutosFornecedoresprodutonofornecedor: TStringField;
    qryProcuraPedidosNFE: TtecQuery;
    qryProcuraPedidosNFEnumero: TIntegerField;
    qryProcuraPedidosNFEfilialentrega: TIntegerField;
    qryProcuraPedidosNFEcancelado: TDateField;
    qryProcuraPedidosNFEconcluido: TDateField;
    qryProcuraPedidosNFEfornecedor: TIntegerField;
    qryProcuraPedidosNFEgrupofornecedor: TIntegerField;
    qryProcuraPedidosNFEquantidadependentepedido: TFloatField;
    qryComprasProdutos: TtecQuery;
    qryComprasProdutosnumeromovimento: TIntegerField;
    qryFornecedorProdutogeradocadastro: TBooleanField;
    qryNaturezasPadraogerarpagamento: TBooleanField;
    qryConsultaNaturezasgerarpagamento: TBooleanField;
    qryProdutosNotasPagNFEItemsSituacao: TtecQuery;
    dsrProdutosNotasPagNFEItemsSituacao: TtecDataSource;
    qryProdutosFornecedoresprodutovisual: TStringField;
    qrynfe: TtecQuery;
    qrynfecodigo: TIntegerField;
    qrynfexmlnfe: TMemoField;
    qryContratosDevolvidos: TtecQuery;
    qryParcelas: TtecQuery;
    qryParcelascontrato: TStringField;
    qryParcelasnumero: TIntegerField;
    qryParcelastipopagto: TStringField;
    qryParcelasfilialpagto: TIntegerField;
    qryParcelasvalorpagto: TFloatField;
    qryParcelasdatapagto: TDateField;
    qryProdutosContratos: TtecQuery;
    qryProdutosContratoscontrato: TStringField;
    qryProdutosContratosproduto: TLargeintField;
    qryProdutosContratosfilial: TIntegerField;
    qryProdutosContratosquantidade: TFloatField;
    qryProdutosContratoscancelado: TFloatField;
    qryContratosDevolvidostipo: TStringField;
    qryContratosDevolvidoscontrato: TStringField;
    qryApagarMovimentos: TtecQuery;
    qryApagarMovimentosnumero: TIntegerField;
    qryContratos: TtecQuery;
    qryContratosnumero: TStringField;
    qryContratossituacao: TStringField;
    qryProdutosNotasPagNFE: TtecQuery;
    dsrProdutosNotasPagNFE: TtecDataSource;
    qryProdutosNotasPagNFEItems: TtecQuery;
    dsrProdutosNotasPagNFEItems: TtecDataSource;
    qryProdutosNotasPagNFEcodigonota: TIntegerField;
    qryProdutosNotasPagNFEnumero: TIntegerField;
    qryProdutosNotasPagNFEprodutonofornecedor: TStringField;
    qryProdutosNotasPagNFEdescricaofornecedor: TStringField;
    qryProdutosNotasPagNFEncmfornecedor: TStringField;
    qryProdutosNotasPagNFEquantidade: TFloatField;
    qryProdutosNotasPagNFEprecounitario: TFloatField;
    qryProdutosNotasPagNFEvalortotal: TFloatField;
    qryProdutosNotasPagNFEItemscodigonota: TIntegerField;
    qryProdutosNotasPagNFEItemsnumerosequencianfe: TIntegerField;
    qryProdutosNotasPagNFEItemsnumero: TIntegerField;
    qryProdutosNotasPagNFEItemsquantidade: TFloatField;
    qryProdutosNotasPagNFEItemsprecounitario: TFloatField;
    qryProdutosNotasPagNFEItemsvalortotal: TFloatField;
    qryProdutosNotasPagNFEItemsproduto: TLargeintField;
    qryProdutosNotasPagNFEItemspedido: TIntegerField;
    qryProdutosNotasPagNFEItemscodigofiscal: TIntegerField;
    qryProdutosNotasPagNFEItemsnatureza: TIntegerField;
    qryProdutosNotasPagNFEItemsregistrosemerro: TBooleanField;
    qryProdutosNotasPagNFEItemsgerarpagamento: TBooleanField;
    qryProdutosNotasPagNFEItemsnaogerarcreditoicms: TBooleanField;
    qryProdutosNotasPagNFEItemsnaogerarcreditoipi: TBooleanField;
    qryProdutosNotasPagNFEItemsicmssobreipi: TBooleanField;
    qryProdutosNotasPagNFEItemsnaocalcularipisobrefrete: TBooleanField;
    qryProdutosNotasPagNFEItemsprodutovisual: TStringField;
    qryProdutosNotasPagNFEItemsdescricaoproduto: TStringField;
    qryProdutosNotasPagNFEItemsncmempresa: TStringField;
    qryProdutosNotasPagNFEItemsdescricaonatureza: TStringField;
    qryProdutosNotasPagNFEItemsdescricaocodigofiscal: TStringField;
    qryProdutosNotasPagNFEItemstipomovimento: TStringField;
    qryProdutosNotasPagNFEItemsoperacao: TStringField;
    qryProdutosNotasPagNFEregistrosemerro: TBooleanField;
    qryProdutosNotasPagNFEItemsSituacaocodigonota: TIntegerField;
    qryProdutosNotasPagNFEItemsSituacaonumerosequencianfe: TIntegerField;
    qryProdutosNotasPagNFEItemsSituacaonumerosequencianfeitens: TIntegerField;
    qryProdutosNotasPagNFEItemsSituacaonumero: TIntegerField;
    qryProdutosNotasPagNFEItemsSituacaosituacao: TStringField;
    spcProdutosNotasPagNFEItems_proximocodigo: TtecQuery;
    spcProdutosNotasPagNFEItems_proximocodigocodigo: TIntegerField;
    spcProdutosNotasPagNFEItemsSituacao_proximocodigo: TtecQuery;
    spcProdutosNotasPagNFEItemsSituacao_proximocodigocodigo: TIntegerField;
    qryProcuraNaturezasProdutoicmssobreipi: TBooleanField;
    qryProcuraNaturezasProdutoNFE: TtecQuery;
    dsrProcuraNaturezasProdutoNFE: TtecDataSource;
    qryProcuraNaturezasProdutoNFEcodigofiscal: TIntegerField;
    qryProcuraNaturezasProdutoNFEdescricao: TStringField;
    qryProcuraNaturezasProdutoNFEcodigo: TIntegerField;
    qryProcuraNaturezasProdutoNFEtipomovimento: TStringField;
    qryProcuraNaturezasProdutoNFEentrada: TStringField;
    qryProcuraNaturezasProdutoNFEoperacao: TStringField;
    qryProcuraNaturezasProdutoNFEdescricaocfop: TStringField;
    qryProcuraNaturezasProdutoNFEgerarpagamento: TBooleanField;
    qryProcuraNaturezasProdutoNFEdebitar: TIntegerField;
    qryProcuraNaturezasProdutoNFEdescricaodebitar: TStringField;
    qryProcuraNaturezasProdutoNFEclassificacaodebitar: TStringField;
    qryProcuraNaturezasProdutoNFEcreditar: TIntegerField;
    qryProcuraNaturezasProdutoNFEdescricaocreditar: TStringField;
    qryProcuraNaturezasProdutoNFEclassificacaocreditar: TStringField;
    qryProcuraNaturezasProdutoNFEhistorico: TIntegerField;
    qryProcuraNaturezasProdutoNFEicmscst: TStringField;
    qryProcuraNaturezasProdutoNFEcsosn: TStringField;
    qryProcuraNaturezasProdutoNFEipicst: TStringField;
    qryProcuraNaturezasProdutoNFEpiscst: TStringField;
    qryProcuraNaturezasProdutoNFEcofinscst: TStringField;
    qryProcuraNaturezasProdutoNFEdiferenciada: TBooleanField;
    qryProcuraNaturezasProdutoNFEnaogerarcreditoicms: TBooleanField;
    qryProcuraNaturezasProdutoNFEnaogerarcreditoipi: TBooleanField;
    qryProcuraNaturezasProdutoNFEnaocalcularipisobrefrete: TBooleanField;
    qryProcuraNaturezasProdutoNFEicmssobreipi: TBooleanField;
    qryProdutosNotasPagNFEsaldoquantidade: TFloatField;
    qryProdutosNotasPagNFEItemsincidencia: TStringField;
    qryProdutosNotasPagNFEItemscsosn: TStringField;
    qryProdutosNotasPagNFEItemsipicst: TStringField;
    qryProdutosNotasPagNFEItemspiscst: TStringField;
    qryProdutosNotasPagNFEItemscofinscst: TStringField;
    qryProdutosFornecedoresserienota: TStringField;
    qryProdutosFornecedoresnumeronota: TIntegerField;
    qryProdutosFornecedorestipofornecedor: TStringField;
    qryProdutosFornecedoresdata: TDateTimeField;
    qryProdutosFornecedoresexisteoutrasvinculacoes: TBooleanField;
    qryProdutosFornecedoresnumerodevinculacoesnanota: TLargeintField;
    qryProdutosNotasPagNFEItemsSituacaoerro: TBooleanField;
    qryProdutosNotasPagNFEItemsSituacaodescricaotipoerro: TStringField;
    qryProdutosNotasPagNFEalerta: TBooleanField;
    qryProdutosNotasPagNFEItemsalerta: TBooleanField;
    qryProdutosNotasPagNFECFOP: TIntegerField;
    qryProdutosNotasPagNFEuCom: TStringField;
    qryProdutosNotasPagNFEcsosn: TStringField;
    qryProdutosNotasPagNFEorig: TStringField;
    qryProdutosNotasPagNFEmodBC: TStringField;
    qryProdutosNotasPagNFEpRedBC: TFloatField;
    qryProdutosNotasPagNFEpICMS: TFloatField;
    qryProdutosNotasPagNFEvICMS: TFloatField;
    qryProdutosNotasPagNFEpMVAST: TFloatField;
    qryProdutosNotasPagNFEpRedBCST: TFloatField;
    qryProdutosNotasPagNFEpICMSST: TFloatField;
    qryProdutosNotasPagNFEvICMSST: TFloatField;
    qryProdutosNotasPagNFEvICMSSTRet: TFloatField;
    qryProdutosNotasPagNFEpCredSN: TFloatField;
    qryProdutosNotasPagNFEvCredICMSSN: TFloatField;
    qryProdutosNotasPagNFEvBCICMS: TFloatField;
    qryProdutosNotasPagNFEvBCICMSST: TFloatField;
    qryProdutosNotasPagNFEvBCICMSSTRet: TFloatField;
    qryProdutosNotasPagNFEcsticms: TStringField;
    qryProdutosNotasPagNFEcstipi: TStringField;
    qryProdutosNotasPagNFEvBCIPI: TFloatField;
    qryProdutosNotasPagNFEpIPI: TFloatField;
    qryProdutosNotasPagNFEvIPI: TFloatField;
    qryProdutosNotasPagNFEcstPIS: TStringField;
    qryProdutosNotasPagNFEvBCPIS: TFloatField;
    qryProdutosNotasPagNFEpPIS: TFloatField;
    qryProdutosNotasPagNFEvPIS: TFloatField;
    qryProdutosNotasPagNFEcstCOFINS: TStringField;
    qryProdutosNotasPagNFEvBCCOFINS: TFloatField;
    qryProdutosNotasPagNFEpCOFINS: TFloatField;
    qryProdutosNotasPagNFEvCOFINS: TFloatField;
    qryProdutosNotasPagNFEdescricaocfop: TStringField;
    qryProdutosNotasPagNFEmodbcst: TStringField;
    qryNotaFiscalcrt: TIntegerField;
    qryProcuraFornecedorescrt: TIntegerField;
    qryProdutosNotasPagNFEdesconto: TFloatField;
    qryProdutosNotasPagNFEdespesasacessorias: TFloatField;
    qryPedidosNotasPag: TtecQuery;
    dsrPedidosNotasPag: TtecDataSource;
    qryPedidosNotasPagcodigonota: TIntegerField;
    qryPedidosNotasPagpedido: TIntegerField;
    qryPedidosNotasPagfiltrarproduto: TBooleanField;
    qryConsultaPedidosNotaFiscal: TtecQuery;
    qryConsultaPedidosNotaFiscalnome: TStringField;
    qryConsultaPedidosNotaFiscalemissao: TDateField;
    qryConsultaPedidosNotaFiscalnumero: TIntegerField;
    qryConsultaPedidosNotaFiscalentrega: TDateField;
    qryConsultaPedidosNotaFiscalreferencia: TStringField;
    qryConsultaPedidosNotaFiscalcodigo: TIntegerField;
    qryProdutosNotasPagNFEvFrete: TFloatField;
    qryProdutosNotasPagNFEvSeg: TFloatField;
    qryProdutosFornecedoresdescricaonofornecedor: TStringField;
    qryNotaFiscalrequernfsaida: TBooleanField;
    qryProcuraNaturezasrequernfsaida: TBooleanField;
    qryConsultaProdutosNotaFiscalvalorgrade2: TStringField;
    qryConsultaProdutosNotaFiscalnumeroprodutotabela: TIntegerField;
    qryConsultaProdutosNotaFiscalnumerodocumentotabela: TIntegerField;
    qryProcuraProdutoNotaFiscalproduto: TLargeintField;
    qryProcuraProdutoNotaFiscaldescricao: TStringField;
    qryProcuraProdutoNotaFiscalvalorgrade1: TStringField;
    qryProcuraProdutoNotaFiscalvalorgrade2: TStringField;
    qryProcuraProdutoNotaFiscalincidencia: TStringField;
    qryProcuraProdutoNotaFiscalcsosn: TStringField;
    qryProcuraProdutoNotaFiscalaliquotaipi: TFloatField;
    qryProcuraProdutoNotaFiscalipicst: TStringField;
    qryProcuraProdutoNotaFiscalpiscst: TStringField;
    qryProcuraProdutoNotaFiscalcofinscst: TStringField;
    qryProcuraProdutoNotaFiscalnumerodocumentotabela: TIntegerField;
    qryProcuraProdutoNotaFiscalnumeroprodutotabela: TIntegerField;
    qryProcuraProdutoNotaFiscaldescricaolc: TStringField;
    qryConsultaPedidosProdutoNFE: TtecQuery;
    qryConsultaPedidosProdutoNFEpedido: TIntegerField;
    qryConsultaPedidosProdutoNFEnumero: TIntegerField;
    qryConsultaPedidosProdutoNFEemissao: TDateField;
    qryConsultaPedidosProdutoNFEentrega: TDateField;
    qryConsultaPedidosProdutoNFEreferencia: TStringField;
    qryConsultaPedidosProdutoNFEcodigo: TIntegerField;
    qryConsultaPedidosProdutoNFEnome: TStringField;
    qryProcuraPedidosNFEpedido: TIntegerField;
    qryProdutosNotasPagNFEItemsnumeroprodutonopedido: TIntegerField;
    qryNotaFiscalNFE_Calculada: TStringField;
    qryNotaFiscalcnpj_filial: TStringField;
    qryMovimentosvalorultimacompra: TFloatField;
    qryConsultaProdutosNotaFiscalquantidade: TFloatField;
    qryProdutosNotaFiscalTotalLiquido: TFloatField;
    qryNotaFiscalnumeroregistrodescontoalterado: TIntegerField;
    qryProdutosNotasPagNFEItemsnumeroprodutosfornecedorunidade: TIntegerField;
    qryProdutosNotasPagNFEItemsunidadenfe: TStringField;
    qryProdutosNotasPagNFEItemsdescricaounidadenfe: TStringField;
    qryProdutosNotasPagNFEItemsfatorconversao: TFloatField;
    qryProdutosFornecedoresUnidades: TtecQuery;
    qryProdutosFornecedoresUnidadesproduto: TLargeintField;
    qryProdutosFornecedoresUnidadesfornecedor: TIntegerField;
    qryProdutosFornecedoresUnidadestipofornecedor: TStringField;
    qryProdutosFornecedoresUnidadesunidade: TStringField;
    qryProdutosFornecedoresUnidadesfatorconversao: TFloatField;
    qryProdutosFornecedoresUnidadesdescricaounidade: TStringField;
    qryUnidades: TtecQuery;
    qryUnidadescodigo: TStringField;
    qryUnidadesdescricao: TStringField;
    qryProdutosNotasPagNFEItemsqtdeestoque: TFloatField;
    qryProcuraProdutoNotaFiscalunidade: TStringField;
    qryProdutosNotasPagNFEItemsunidade: TStringField;
    qryProcuraNaturezasicmssobredespesasacessorias: TBooleanField;
    qryProdutosNotasPagNFEItemsicmssobredespesasacessorias: TBooleanField;
    qryConsultaNaturezasicmssobredespesasacessorias: TBooleanField;
    qryProcuraNaturezasProdutoNFEicmssobredespesasacessorias: TBooleanField;
    qryProcuraNaturezasProdutoicmssobredespesasacessorias: TBooleanField;
    qryMovimentosnumerocontrole: TIntegerField;
    qryMovimentosok: TBooleanField;
    qryNotaFiscalstatusnfe: TIntegerField;
    qryDadosFiscaisRef: TtecQuery;
    qryDadosFiscaisRefdigchaveacesso: TIntegerField;
    qryDadosFiscaisRefdata: TDateField;
    qryDadosFiscaisRefmodelodocto: TStringField;
    qryDadosFiscaisRefserie: TStringField;
    qryDadosFiscaisReffilial: TIntegerField;
    qryDadosFiscaisRefdadofiscal: TIntegerField;
    qryDadosFiscaisRefnumeronfe: TStringField;
    qryDadosFiscaisRefcodigouf: TStringField;
    qryDadosFiscaisRefpessoanumero: TStringField;
    qryDadosFiscaisRefnumeronf: TIntegerField;
    dsrDadosFiscaisRef: TtecDataSource;
    qryNotaFiscalcancelamentonfforaprazolegal: TBooleanField;
    qryNotaFiscaldadofiscalreferenciado: TIntegerField;
    qryNotaFiscalfilialnotasaidareferenciada: TIntegerField;
    qryNotaFiscalserienotasaidareferenciada: TStringField;
    qryNotaFiscalnumeronotasaidareferenciada: TIntegerField;
    qryNotaFiscalicmsbasecalculo_dev: TFloatField;
    qryNotaFiscalicmsvalor_dev: TFloatField;
    qryNotaFiscalnaoutilizarobsautomaticas: TBooleanField;
    qryProcuraNaturezasnaoutilizarobsautomaticas: TBooleanField;
    qryNotaFiscalvbcstret: TFloatField;
    qryNotaFiscalvbcstretdesp: TFloatField;
    qryNotaFiscalvicmsstretdesp: TFloatField;
    qryNotaFiscalclientecontribicms: TBooleanField;
    qryDadosImportacoestpviatransp: TIntegerField;
    qryDadosImportacoesvAFRMM: TFloatField;
    qryDadosImportacoestpIntermedio: TIntegerField;
    qryDadosImportacoescnpjadquirente: TStringField;
    qryDadosImportacoesufadquirente: TStringField;
    qryProcuraFornecedorescontribicms: TBooleanField;
    qryProdutosImportadosprodutodigitado: TStringField;
    qryProcuraProdutoNotaFiscalprodutovisual: TStringField;
    qryProdutosNotasPagNFEItemsprodutodigitado: TStringField;
    qryProdutosFornecedoresprodutodigitado: TStringField;
    qryNotaFiscalexigenotareferenciada: TBooleanField;
    qryProdutosFornecedoresnumerodeocorrencias: TLargeintField;
    qryProdutosFornecedoresflag: TBooleanField;
    qryProdutosNotaFiscalpercAtual_x_Venda: TFloatField;
    qryProdutosNotaFiscalpercVenda_x_Digitado: TFloatField;
    qryProcuraPedidosNFEprecounitariopedido: TFloatField;
    qryProdutosNotasPagNFEItemsprecounitariopedido: TFloatField;
    qryProdutosNotaFiscalpercUnitario_x_Pedido: TFloatField;
    qryProdutosNotasPagNFEItemspercUnitario_x_Pedido: TFloatField;
    qryConsultaPedidosProdutoNFEprecounitariopedido: TFloatField;
    qryServicosContratos: TtecQuery;
    qryServicosContratoscontrato: TStringField;
    qryServicosContratosservico: TIntegerField;
    qryServicosContratosquantidade: TIntegerField;
    qryServicosContratoscancelado: TIntegerField;
    qryEstoquefuturo_na_data_inclusao: TFloatField;
    qryProcuraFornecedoresemail: TStringField;
    qryNotaFiscaldatahoragravacao: TDateTimeField;
    qryNotaFiscaldescontoitem: TFloatField;
    qryNotaFiscalcodigo: TIntegerField;
    qryProdutosNotasPagNFEItemspedidook: TBooleanField;
    qryProdutosFornecedoresUnidades_: TtecQuery;
    qryConsultaNaturezasdescricaocodigofiscal: TStringField;
    qryConsultaNaturezasdescricaonatureza: TStringField;
    qryConsultaNaturezastipomovimento: TStringField;
    qryConsultaNaturezasdescricaotipomovimento: TStringField;
    qryNotaFiscalvfcp: TFloatField;
    qryNotaFiscalvfcpst: TFloatField;
    qryNotaFiscalvfcpstret: TFloatField;
    qryListaCamposdaGrade: TtecQuery;
    qryProdutosNotaFiscalprodutovisual: TStringField;
    qryProdutosNotaFiscalicms: TIntegerField;
    qryProdutosNotaFiscalipi: TIntegerField;
    qryProdutosNotaFiscalaliquotaipioriginal: TFloatField;
    qryProdutosNotaFiscalgrade1: TIntegerField;
    qryProdutosNotaFiscalgrade2: TIntegerField;
    qryProdutosNotaFiscallinha: TStringField;
    qryProdutosNotaFiscalcoluna: TStringField;
    qryProdutosNotaFiscalvalorgrade1: TStringField;
    qryProdutosNotaFiscalvalorgrade2: TStringField;
    qryProdutosNotaFiscalcaracteristica: TLargeintField;
    qryProdutosNotaFiscalreferencia: TStringField;
    qryProdutosNotaFiscalcaracteristicavisual: TStringField;
    qryProdutosNotaFiscaldescricaocaracteristica: TStringField;
    qryProdutosNotaFiscalpreco: TIntegerField;
    qryProdutosNotaFiscaldescricaoprecoproduto: TStringField;
    qryProdutosNotaFiscalprodutototal: TFloatField;
    qryProdutosNotaFiscalcalcularpreco: TBooleanField;
    qryProdutosNotaFiscalaliquotaicmscalculopreco: TFloatField;
    qryProdutosNotaFiscalpermitiratualizar: TBooleanField;
    qryProdutosNotaFiscalpermitiratualizardigitado: TBooleanField;
    qryProdutosNotaFiscalcodigorecolha: TLargeintField;
    qryProdutosNotaFiscalvaloratual: TFloatField;
    qryProdutosNotaFiscalcomposto: TBooleanField;
    qryProdutosNotaFiscalprecovenda: TFloatField;
    qryProdutosNotaFiscalcustototal: TFloatField;
    qryProdutosNotaFiscalcustototalfatorizado: TFloatField;
    qryProdutosNotaFiscalcustoparavenda: TFloatField;
    qryProdutosNotaFiscalprecoatual: TFloatField;
    qryProdutosNotaFiscalprecoatribuido: TFloatField;
    qryProdutosNotaFiscalprecodigitado: TFloatField;
    qryProdutosNotaFiscalprecodigitadoalterado: TBooleanField;
    qryProdutosNotaFiscalgrupo: TStringField;
    qryProdutosNotaFiscalclasse: TStringField;
    qryProdutosNotaFiscalnaoreplicar: TBooleanField;
    qryProdutosNotaFiscaltipomovimento: TStringField;
    qryProdutosNotaFiscalgerarpagamento: TBooleanField;
    qryProdutosNotaFiscaloperacao: TStringField;
    qryProdutosNotaFiscallocalizacao: TStringField;
    qryProdutosNotaFiscalprodutook: TBooleanField;
    qryProdutosNotaFiscalfilialnotafiscalsaida: TIntegerField;
    qryProdutosNotaFiscalserienotafiscalsaida: TStringField;
    qryProdutosNotaFiscalnumeronotafiscalsaida: TIntegerField;
    qryProdutosNotaFiscaldescricaounidade: TStringField;
    qryProdutosNotaFiscalcst_produto_1: TStringField;
    qryProdutosNotaFiscalcsosn_produto_1: TStringField;
    qryProdutosNotaFiscalmarkup_produto_1: TFloatField;
    qryProdutosNotaFiscalmarkup_grupo_1: TFloatField;
    qryProdutosNotaFiscalmarkup_fornecedor: TFloatField;
    qryProdutosNotaFiscalprecounitariopedido: TFloatField;
    qryProdutosNotaFiscalpercentualreducaobase_produto: TFloatField;
    qryProdutosNotaFiscalcodigonota: TIntegerField;
    qryProdutosNotaFiscalnumero: TIntegerField;
    qryProdutosNotaFiscalnumerooriginal: TIntegerField;
    qryProdutosNotaFiscalfilial: TIntegerField;
    qryProdutosNotaFiscalfilialincluidaoriginal: TIntegerField;
    qryProdutosNotaFiscalproduto: TLargeintField;
    qryProdutosNotaFiscalprodutoincluidooriginal: TLargeintField;
    qryProdutosNotaFiscalaliquotaicms: TFloatField;
    qryProdutosNotaFiscalbaseicms: TFloatField;
    qryProdutosNotaFiscalvaloricms: TFloatField;
    qryProdutosNotaFiscalaliquotaipi: TFloatField;
    qryProdutosNotaFiscalvaloripi: TFloatField;
    qryProdutosNotaFiscaldesconto: TFloatField;
    qryProdutosNotaFiscalvalorreducaobase: TFloatField;
    qryProdutosNotaFiscalpercentualreducaobase: TFloatField;
    qryProdutosNotaFiscalprecounitario: TFloatField;
    qryProdutosNotaFiscalquantidade: TFloatField;
    qryProdutosNotaFiscalincidencia: TStringField;
    qryProdutosNotaFiscalpedido: TIntegerField;
    qryProdutosNotaFiscalmovimento: TIntegerField;
    qryProdutosNotaFiscalacrescimo: TFloatField;
    qryProdutosNotaFiscalfrete: TFloatField;
    qryProdutosNotaFiscalseguro: TFloatField;
    qryProdutosNotaFiscalvalordescontoitem: TFloatField;
    qryProdutosNotaFiscalnatureza: TIntegerField;
    qryProdutosNotaFiscalcodigofiscal: TIntegerField;
    qryProdutosNotaFiscalmoeda: TStringField;
    qryProdutosNotaFiscalvalormoeda: TFloatField;
    qryProdutosNotaFiscaladicao: TIntegerField;
    qryProdutosNotaFiscalnseqadicao: TIntegerField;
    qryProdutosNotaFiscaldescricaoproduto: TStringField;
    qryProdutosNotaFiscalgenero: TIntegerField;
    qryProdutosNotaFiscalclassificacaofiscal: TStringField;
    qryProdutosNotaFiscalunidade: TStringField;
    qryProdutosNotaFiscalextipi: TStringField;
    qryProdutosNotaFiscalicmsbasecalculo: TFloatField;
    qryProdutosNotaFiscalicmsmodalidade: TIntegerField;
    qryProdutosNotaFiscalicmsmodsubst: TIntegerField;
    qryProdutosNotaFiscaltribcodigoean: TStringField;
    qryProdutosNotaFiscaltribunidade: TStringField;
    qryProdutosNotaFiscaltribquantidade: TFloatField;
    qryProdutosNotaFiscaltribunitario: TFloatField;
    qryProdutosNotaFiscalenquadramento: TIntegerField;
    qryProdutosNotaFiscalipicst: TStringField;
    qryProdutosNotaFiscalipibasecalculo: TFloatField;
    qryProdutosNotaFiscaliibasecalculo: TFloatField;
    qryProdutosNotaFiscaliidespaduaneira: TFloatField;
    qryProdutosNotaFiscaliivalor: TFloatField;
    qryProdutosNotaFiscaliiiof: TFloatField;
    qryProdutosNotaFiscalpiscst: TStringField;
    qryProdutosNotaFiscalpisbasecalculo: TFloatField;
    qryProdutosNotaFiscalpisaliquota: TFloatField;
    qryProdutosNotaFiscalpisvalor: TFloatField;
    qryProdutosNotaFiscalcofinscst: TStringField;
    qryProdutosNotaFiscalcofinsbasecalculo: TFloatField;
    qryProdutosNotaFiscalcofinsaliquota: TFloatField;
    qryProdutosNotaFiscalcofinsvalor: TFloatField;
    qryProdutosNotaFiscalicmsvalor: TFloatField;
    qryProdutosNotaFiscaldespesasacessorias: TFloatField;
    qryProdutosNotaFiscalind_mov_fisica: TIntegerField;
    qryProdutosNotaFiscalaliquotaicmsst: TFloatField;
    qryProdutosNotaFiscalicmsbasecalculost: TFloatField;
    qryProdutosNotaFiscalicmsvalorst: TFloatField;
    qryProdutosNotaFiscalembalagem: TFloatField;
    qryProdutosNotaFiscalthc: TFloatField;
    qryProdutosNotaFiscalnaotribipi: TFloatField;
    qryProdutosNotaFiscalnaotribicms: TFloatField;
    qryProdutosNotaFiscalcsosn: TStringField;
    qryProdutosNotaFiscalpcredsn: TFloatField;
    qryProdutosNotaFiscalvcredicmssn: TFloatField;
    qryProdutosNotaFiscalfatorsubstituicao: TFloatField;
    qryProdutosNotaFiscalpredbcst: TFloatField;
    qryProdutosNotaFiscalreducaobasest: TFloatField;
    qryProdutosNotaFiscalvbcstret: TFloatField;
    qryProdutosNotaFiscalvicmsstret: TFloatField;
    qryProdutosNotaFiscalquantidadesaida: TFloatField;
    qryProdutosNotaFiscalicmsisentas: TFloatField;
    qryProdutosNotaFiscalicmsoutras: TFloatField;
    qryProdutosNotaFiscalipioutras: TFloatField;
    qryProdutosNotaFiscalipiisentas: TFloatField;
    qryProdutosNotaFiscalicmsbasecalculostcusto: TFloatField;
    qryProdutosNotaFiscalicmsvalorstcusto: TFloatField;
    qryProdutosNotaFiscalvaloripidigitado: TBooleanField;
    qryProdutosNotaFiscalvaloricmsdigitado: TBooleanField;
    qryProdutosNotaFiscalnaogerarcreditoicms: TBooleanField;
    qryProdutosNotaFiscalnaogerarcreditoipi: TBooleanField;
    qryProdutosNotaFiscalnaocalcularipisobrefrete: TBooleanField;
    qryProdutosNotaFiscalicmsbasecalculo_custo: TFloatField;
    qryProdutosNotaFiscalaliquotaicms_custo: TFloatField;
    qryProdutosNotaFiscalicmsvalor_custo: TFloatField;
    qryProdutosNotaFiscalicmsoutrasdigitado: TBooleanField;
    qryProdutosNotaFiscalicmssobreipi: TBooleanField;
    qryProdutosNotaFiscalvalorpisdigitado: TBooleanField;
    qryProdutosNotaFiscalvalorcofinsdigitado: TBooleanField;
    qryProdutosNotaFiscalorigem: TIntegerField;
    qryProdutosNotaFiscalnumerosequencianfe: TIntegerField;
    qryProdutosNotaFiscalnumerosequencianfeitens: TIntegerField;
    qryProdutosNotaFiscalfatorsubstituicao_custo: TFloatField;
    qryProdutosNotaFiscalaliquotaicmsst_custo: TFloatField;
    qryProdutosNotaFiscalpercentualreducaobase_custo: TFloatField;
    qryProdutosNotaFiscalvalorreducaobase_custo: TFloatField;
    qryProdutosNotaFiscalpredbcst_custo: TFloatField;
    qryProdutosNotaFiscalvalorreducaobasest_custo: TFloatField;
    qryProdutosNotaFiscalcst_nf: TStringField;
    qryProdutosNotaFiscalcsosn_nf: TStringField;
    qryProdutosNotaFiscalipicst_nf: TStringField;
    qryProdutosNotaFiscalpmvast: TFloatField;
    qryProdutosNotaFiscalvaloricmsstdigitado: TBooleanField;
    qryProdutosNotaFiscaldadofiscal: TIntegerField;
    qryProdutosNotaFiscalnumeroprodutotabela: TIntegerField;
    qryProdutosNotaFiscalcodigonotaoriginal: TIntegerField;
    qryProdutosNotaFiscalnumeroprodutooriginal: TIntegerField;
    qryProdutosNotaFiscalprodutooriginal: TLargeintField;
    qryProdutosNotaFiscaldescontodigitado: TBooleanField;
    qryProdutosNotaFiscalfretedigitado: TBooleanField;
    qryProdutosNotaFiscalunidadenf: TStringField;
    qryProdutosNotaFiscalfatorconversao: TFloatField;
    qryProdutosNotaFiscalqtdeestoque: TFloatField;
    qryProdutosNotaFiscalicmssobredespesasacessorias: TBooleanField;
    qryProdutosNotaFiscalvbcstretdesp: TFloatField;
    qryProdutosNotaFiscalvicmsstretdesp: TFloatField;
    qryProdutosNotaFiscalicmsbasecalculo_dev: TFloatField;
    qryProdutosNotaFiscalicmsvalor_dev: TFloatField;
    qryProdutosNotaFiscalprodutodigitado: TStringField;
    qryProdutosNotaFiscalpercreducaomva: TFloatField;
    qryProdutosNotaFiscalmarkup_produto: TFloatField;
    qryProdutosNotaFiscalmarkup_grupo: TFloatField;
    qryProdutosNotaFiscalmarkup_fornecedor_1: TFloatField;
    qryProdutosNotaFiscalcsosn_produto: TStringField;
    qryProdutosNotaFiscalcst_produto: TStringField;
    qryProdutosNotaFiscalpfcp: TFloatField;
    qryProdutosNotaFiscalvfcp: TFloatField;
    qryProdutosNotaFiscalvbcfcpst: TFloatField;
    qryProdutosNotaFiscalpfcpst: TFloatField;
    qryProdutosNotaFiscalvfcpst: TFloatField;
    qryProdutosNotaFiscalvbcfcp: TFloatField;
    qryProdutosNotaFiscalvbcfcpstret: TFloatField;
    qryProdutosNotaFiscalpfcpstret: TFloatField;
    qryProdutosNotaFiscalvfcpstret: TFloatField;
    qryProdutosNotaFiscalvbcfcpufdest: TFloatField;
    qryProdutosNotaFiscalmsgfatorsubstituicao_custo: TBooleanField;
    qryListaCamposdaGradelistacamposdagradenotaentrada: TMemoField;
    qryProdutosNotasPagNFEinfadprod: TStringField;
    qryProdutosNotasPagNFEItemscaracteristica: TLargeintField;
    qryProdutosNotasPagNFEItemsvalorgrade1: TStringField;
    qryProdutosNotasPagNFEItemsvalorgrade2: TStringField;
    qryProdutosNotasPagNFEItemscaracteristicavisual: TStringField;
    qryProdutosNotasPagNFEquantidadeselecionadalc: TFloatField;
    qryProdutosNotasPagNFEsaldoquantidadelc: TFloatField;
    qryNotaFiscaldataselecaoprodutosgrade: TDateField;
    qryCaracteristicasNotaFiscal: TtecQuery;
    dsrCaracteristicasNotaFiscal: TtecDataSource;
    qryIncluirCaracteristicasNotaFiscal: TtecQuery;
    qryCaracteristicasNotaFiscalcodigonota: TIntegerField;
    qryCaracteristicasNotaFiscalcaracteristica: TLargeintField;
    qryCaracteristicasNotaFiscalcodigovisual: TStringField;
    qryCaracteristicasNotaFiscaldescricao: TStringField;
    qryCaracteristicasNotaFiscallinha: TStringField;
    qryCaracteristicasNotaFiscalcoluna: TStringField;
    qryCaracteristicasNotaFiscalgrade1: TIntegerField;
    qryCaracteristicasNotaFiscalgrade2: TIntegerField;
    qrycaracteristicaselementosnotaspag_l: TtecQuery;
    dsrcaracteristicaselementosnotaspag_l: TtecDataSource;
    qrycaracteristicaselementosnotaspag_lcodigonota: TIntegerField;
    qrycaracteristicaselementosnotaspag_lcaracteristica: TLargeintField;
    qrycaracteristicaselementosnotaspag_lgrade: TIntegerField;
    qrycaracteristicaselementosnotaspag_lvalor: TStringField;
    qrycaracteristicaselementosnotaspag_lcontidonanfe: TBooleanField;
    qrycaracteristicaselementosnotaspag_lpresenteemprodutos: TBooleanField;
    qrycaracteristicaselementosnotaspag_lemuso: TBooleanField;
    qrycaracteristicaselementosnotaspag_labreviatura: TStringField;
    qrycaracteristicaselementosnotaspag_c: TtecQuery;
    dsrcaracteristicaselementosnotaspag_c: TtecDataSource;
    qrycaracteristicaselementosnotaspag_ccodigonota: TIntegerField;
    qrycaracteristicaselementosnotaspag_ccaracteristica: TLargeintField;
    qrycaracteristicaselementosnotaspag_cgrade: TIntegerField;
    qrycaracteristicaselementosnotaspag_cvalor: TStringField;
    qrycaracteristicaselementosnotaspag_ccontidonanfe: TBooleanField;
    qrycaracteristicaselementosnotaspag_cpresenteemprodutos: TBooleanField;
    qrycaracteristicaselementosnotaspag_cemuso: TBooleanField;
    qrycaracteristicaselementosnotaspag_cabreviatura: TStringField;
    qryIncluircaracteristicaselementosnotaspag: TtecQuery;
    qryLinhasgrade: TIntegerField;
    qryLinhasvalor: TStringField;
    qryLinhasusual: TBooleanField;
    qryLinhasabreviatura: TStringField;
    qryElementosLinhas: TtecQuery;
    dsrElementosLinhas: TtecDataSource;
    qryElementosLinhasgrade: TIntegerField;
    qryElementosLinhasvalor: TStringField;
    qryElementosLinhasusual: TBooleanField;
    qryElementosLinhasabreviatura: TStringField;
    qryElementosLinhasordem: TIntegerField;
    qryElementosLinhaspresenteemprodutos: TBooleanField;
    qryElementosLinhasemuso: TBooleanField;
    qryElementosColunas: TtecQuery;
    dsrElementosColunas: TtecDataSource;
    qryElementosLinhasmarcar: TBooleanField;
    qryElementosColunasgrade: TIntegerField;
    qryElementosColunasvalor: TStringField;
    qryElementosColunasusual: TBooleanField;
    qryElementosColunassequencia: TIntegerField;
    qryElementosColunasabreviatura: TStringField;
    qryElementosColunasordem: TIntegerField;
    qryElementosColunascor: TStringField;
    qryElementosColunaspresenteemprodutos: TBooleanField;
    qryElementosColunasemuso: TBooleanField;
    qryElementosColunasmarcar: TBooleanField;
    qryElementosGrades: TtecQuery;
    qryElementosGradesvalor: TStringField;
    qryIncluirCaracteristicasNFE: TtecQuery;
    qryProdutosNotasPagNFEquantidadeselecionadalc_copia: TFloatField;
    qryProdutosNotasPagNFEceantrib: TStringField;
    qryIncluirprodutoscodigobarras: TtecQuery;
    qryCaracteristicasNotaFiscalprodutonofornecedor: TStringField;
    qryCaracteristicasNotaFiscalaplicarfiltro: TBooleanField;
    qryCaracteristicasNotaFiscalvalorgrade1: TStringField;
    qryCaracteristicasNotaFiscalvalorgrade2: TStringField;
    qryProdutosNotasPagNFEfatorconversao: TFloatField;
    qryProdutosNotasPagNFEqtdeestoque: TFloatField;
    qryProdutosNotaFiscalpst: TFloatField;
    ACBrCTe1: TACBrCTe;
    qryUpdateTipFornecedor: TtecQuery;
    qryConsultaPedidos: TtecQuery;
    dsrConsultaPedidos: TtecDataSource;
    qryConsultaPedidospedido: TIntegerField;
    qryConsultaPedidosemissao: TDateField;
    qryConsultaPedidosobservacoes_estoque: TStringField;
    qrySituacaoProdutosCodigoBarras: TtecQuery;
    qrySituacaoProdutosCodigoBarraslistaprodutos: TStringField;
    qryDadosFiscaisRefnumprotocolonfe: TStringField;
    qryDuplicatasdda: TBooleanField;
    qryProcuraFornecedoresdda: TBooleanField;
    qryProdutosFornecedoresinfadprod: TStringField;
    qryProcuraProdutoNotaFiscalobservacoesentrada: TStringField;
    qryProcuraFornecedoressuframa: TStringField;
    qryListaPedidosProdutosIncluidos: TtecQuery;
    qryListaPedidosProdutosIncluidospedido: TIntegerField;
    qryListaPedidosProdutosIncluidosnumero: TIntegerField;
    qryListaPedidosProdutosIncluidosprodutovisual: TStringField;
    qryListaPedidosProdutosIncluidosdescricao: TStringField;
    qryProdutosNotaFiscalpedido_com_nf_normal: TBooleanField;
    dsrListaPedidosProdutosIncluidos: TtecDataSource;
    qryProcuraProdutoSimples: TtecQuery;
    qryProcuraProdutoSimplesproduto: TLargeintField;
    qryProcuraProdutoSimplesprodutovisual: TStringField;
    qryProcuraProdutoSimplescodigobarras: TStringField;
    qrynotaspagchv: TtecQuery;
    qrynotaspagchvcodigonota: TIntegerField;
    qrynotaspagchvchv_nfe: TStringField;
    qryUpdateContratos_chv: TtecQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    qryNotaFiscaltipo: TStringField;
    qryNotaFiscalestornada: TBooleanField;
    qryDadosFiscaischv: TtecQuery;
    qryDadosFiscaischvnumero: TIntegerField;
    qryProdutosNotasPagPedidos: TtecQuery;
    qryNotasPagPedidos: TtecQuery;
    DSPProdutosNotaFiscal: TDataSetProvider;
    CDSProdutosNotaFiscal: TClientDataSet;
    CDSProdutosNotaFiscalAux: TClientDataSet;
    qryProdutosNotasPagNFELotes: TtecQuery;
    qryProdutosNotasPagNFELotescodigonota: TIntegerField;
    qryProdutosNotasPagNFELotesnumerosequencianfe: TIntegerField;
    qryProdutosNotasPagNFELotesnlote: TStringField;
    qryProdutosNotasPagNFELotesqlote: TFloatField;
    qryProdutosNotasPagNFELotesdfab: TDateField;
    qryProdutosNotasPagNFELotesdval: TDateField;
    dsrProdutosNotasPagNFELotes: TtecDataSource;
    qryProdutosNotasPagNFEItemsnlote: TStringField;
    qryProdutosNotasPagNFELotescagreg: TStringField;
    qryProdutosNotasPagNFELotesqtatribuida: TFloatField;
    qryProdutosNotasPagNFELotessaldo: TCurrencyField;
    qryProdutosNotaFiscallote: TLargeintField;
    qryProdutosNotaFiscalgerenciarloteevalidade: TBooleanField;
    qryIncluirAtualizarLotes: TtecQuery;
    qryIncluirAtualizarLoteslote: TLargeintField;
    qryMovimentosloteproduto: TLargeintField;
    qryProdutosNotasPagNFELotespermitealterar: TBooleanField;
    qryProdutosNotasPagNFELotesnulo_dval: TBooleanField;
    qryProdutosNotasPagNFELotesnulo_dfab: TBooleanField;
    qryProdutosNotasPagNFELotesqtatribuidaestoque: TFloatField;
    qryProdutosNotasPagNFEItemsgerenciarloteevalidade: TBooleanField;
    qryProcuraProdutoNotaFiscalGerenciarLoteeValidade: TBooleanField;
    qryProdutosNotasPagNFEipi: TIntegerField;
    qryProdutosNotasPagNFEdescricaoipi: TStringField;
    qryIPI: TtecQuery;
    qryIPIcodigo: TIntegerField;
    qryIPIdescricao: TStringField;
    qryIPIclassificacaofiscal: TStringField;
    qryIPIcodigodescricao: TStringField;
    qryProdutosNotasPagNFEipiLookup: TStringField;
    qryNCMTabela: TtecQuery;
    qryIPIaliquota: TFloatField;
    qryIPIgenero: TIntegerField;
    qryIPIextipi: TStringField;
    qryIPIncmisentopiscofins: TBooleanField;
    qryIPImvasubncm: TStringField;
    qryipiMAX: TtecQuery;
    qryProdutosNotaFiscalipioriginal: TIntegerField;
    qryAtualizarTabelaCaracteristicas: TtecQuery;
    qryProdutosNotasPagNFEItemsipi: TIntegerField;
    qryProdutosNotasPagNFEItemsdescricaoipi: TStringField;
    qryProdutosNotasPagNFEItemsipiLookup: TStringField;
    qryProdutosNotasPagNFEItemsncmfornecedor: TStringField;
    qryProdutosNotaFiscalnrlote: TStringField;
    qryProdutosNotaFiscalfabricacao: TDateField;
    qryProdutosNotaFiscalvalidade: TDateField;
    qryGradeProdutosNFe: TtecQuery;
    qryGradeGeral: TtecQuery;
    qryCaracteristicasNotaFiscalquantidade: TFloatField;
    qryProdutosNotasPagNFEItemsSituacaodetalheerro: TIntegerField;
    qryConsultaConhecimentoFretechv_nfe: TStringField;
    qryNotaFiscallocalretirada_pessoatipo: TStringField;
    qryNotaFiscallocalentrega_pessoatipo: TStringField;
    qryProdutosNotasPagNFEItemsPrecoUnitarioFatorizado: TFloatField;
    qryNotaFiscalestrangeiro: TBooleanField;
    qryProcuraFornecedoresestrangeiro: TBooleanField;
    procedure qryDetalhesNotaFiscalBefore(DataSet: TDataSet);
    procedure qryNotaFiscalNewRecord(DataSet: TDataSet);
    procedure qryProcuraFornecedoresAfterScroll(DataSet: TDataSet);
    procedure qryProdutosNotaFiscalBeforeEdit(DataSet: TDataSet);
    procedure qryProdutosNotaFiscalBeforeInsert(DataSet: TDataSet);
    procedure qryProdutosNotaFiscalprodutoChange(Sender: TField);
    procedure qryProdutosNotaFiscalNewRecord(DataSet: TDataSet);
    procedure qryProcuraFornecConhecFreteAfterScroll(DataSet: TDataSet);
    procedure qryConhecimentoFreteAfterOpen(DataSet: TDataSet);
    procedure qryProdutosNotaFiscalAfterScroll(DataSet: TDataSet);
    procedure qryDuplicatasNewRecord(DataSet: TDataSet);
    procedure qryProcuraNaturezasBeforeOpen(DataSet: TDataSet);
    procedure qryProdutosNotaFiscalAfterDelete(DataSet: TDataSet);
    procedure qryProdutosNotaFiscalBeforeDelete(DataSet: TDataSet);
    procedure qryProcuraNaturezasAfterScroll(DataSet: TDataSet);
    procedure dsrNotaFiscalDataChange(Sender: TObject; Field: TField);
    procedure qryProcuraProdutoNotaFiscalCalcFields(DataSet: TDataSet);
    procedure qryConsultaProdutosNotaFiscalAfterOpen(DataSet: TDataSet);
    procedure qryProcuraFiliaisAfterScroll(DataSet: TDataSet);
    procedure qryProcuraSerieFiliaisAfterScroll(DataSet: TDataSet);
    procedure qryProcuraNotaFiscalProdutosAfterScroll(DataSet: TDataSet);
    procedure qryConsultaSeriesFiliaisAfterOpen(DataSet: TDataSet);
    procedure qryConsultaNotaFiscalProdutosAfterOpen(DataSet: TDataSet);
//    procedure qryProdutos_AfterOpen(DataSet: TDataSet);
    procedure dsrGradeDataChange(Sender: TObject; Field: TField);
    procedure qryGradeAfterScroll(DataSet: TDataSet);
    procedure qryProdutosNotaFiscalCalcFields(DataSet: TDataSet);
    procedure qryLinhasAfterInsert(DataSet: TDataSet);
    procedure qryEstoquesNewRecord(DataSet: TDataSet);
    procedure qryGradeAfterInsert(DataSet: TDataSet);
    procedure qryNotaFiscalCalcFields(DataSet: TDataSet);
    procedure dsrProdutosNotaFiscalDataChange(Sender: TObject;
      Field: TField);
    procedure qryDocumentosPagImpostosRetidosBeforeDelete(
      DataSet: TDataSet);
    procedure qryDuplicatasImpostosRetidosAfterOpen(DataSet: TDataSet);
    procedure qryDocumentoPagCalcFields(DataSet: TDataSet);
    procedure qryVenctosImpostosRetidosEntradasAfterOpen(
      DataSet: TDataSet);
    procedure qryDuplicatasBeforeDelete(DataSet: TDataSet);
    procedure qryDocumentosPagImpostosRetidosAfterScroll(
      DataSet: TDataSet);
    procedure qryProdutosNotaFiscalAfterCancel(DataSet: TDataSet);
    procedure qryDuplicatasCalcFields(DataSet: TDataSet);
    procedure qryNotaFiscalAfterOpen(DataSet: TDataSet);
    procedure qryNotaFiscalAfterInsert(DataSet: TDataSet);
    procedure qryProcuraFornecedoresAfterOpen(DataSet: TDataSet);
    procedure qryNotaFiscalAfterScroll(DataSet: TDataSet);
    procedure qryProdutosNotaFiscalAfterInsert(DataSet: TDataSet);
    procedure qryProcuraNaturezasProdutoBeforeOpen(DataSet: TDataSet);
    procedure qryAdicoesImportacaoAfterScroll(DataSet: TDataSet);
    procedure qryAdicoesImportacaoAfterPost(DataSet: TDataSet);
    procedure qryAdicoesImportacaoAfterDelete(DataSet: TDataSet);
    procedure qryAdicoesImportacaoAfterCancel(DataSet: TDataSet);
    procedure dsrProdutosImportadosDataChange(Sender: TObject;
      Field: TField);
    procedure qryConhecimentoFreteCalcFields(DataSet: TDataSet);
    procedure qryAdicoesImportacaoBeforeInsert(DataSet: TDataSet);
    procedure qryVolumesNotasPagAfterEdit(DataSet: TDataSet);
    procedure qryProdutosNotaFiscalAfterOpen(DataSet: TDataSet);
    procedure qryDadosImportacoesNewRecord(DataSet: TDataSet);
    procedure qryDadosImportacoesAfterScroll(DataSet: TDataSet);
    procedure qryAdicoesImportacaoBeforePost(DataSet: TDataSet);
    procedure qryProdutosImportadosAfterPost(DataSet: TDataSet);
    procedure qryAdicoesImportacaoAfterOpen(DataSet: TDataSet);
    procedure qryProcuraAdicoesImportacaoBeforeOpen(DataSet: TDataSet);
    procedure qryProdutosImportadosNewRecord(DataSet: TDataSet);
    procedure qryProdutosImportadosBeforeOpen(DataSet: TDataSet);
    procedure qryProdutosImportadosCalcFields(DataSet: TDataSet);
    procedure qryAdicoesImportacaoNewRecord(DataSet: TDataSet);
    procedure qryAdicoesImportacaoCalcFields(DataSet: TDataSet);
    procedure dsrAdicoesImportacaoDataChange(Sender: TObject;
      Field: TField);
    procedure qryNotaFiscalBeforePost(DataSet: TDataSet);
    procedure qryProdutosNotaFiscalBeforePost(DataSet: TDataSet);
    procedure qryNotaFiscalBeforeInsert(DataSet: TDataSet);
    procedure qryDuplicatasAfterOpen(DataSet: TDataSet);
    procedure qryProcuraPedidosNFEBeforeOpen(DataSet: TDataSet);
    procedure qryNotaFiscalAfterCancel(DataSet: TDataSet);
    procedure dsrProdutosNotasPagNFEItemsDataChange(Sender: TObject;
      Field: TField);
    procedure qryProdutosNotasPagNFEItemsAfterScroll(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFENewRecord(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFEItemsNewRecord(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFEItemsSituacaoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryProdutosNotasPagNFEItemsCalcFields(DataSet: TDataSet);
    procedure qryProcuraNaturezasBeforeClose(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFEItemsSituacaoNewRecord(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFEAfterPost(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFEItemsAfterPost(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFEItemsAfterDelete(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFEItemsBeforeDelete(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFEBeforeDelete(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFEItemsAfterCancel(DataSet: TDataSet);
    procedure qryProcuraNaturezasProdutoNFEBeforeOpen(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFEItemsAfterInsert(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFEItemsBeforeEdit(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFEItemsSituacaoCalcFields(
      DataSet: TDataSet);
    procedure dsrPedidosNotasPagDataChange(Sender: TObject; Field: TField);
    procedure qryPedidosNotasPagAfterPost(DataSet: TDataSet);
    procedure qryPedidosNotasPagNewRecord(DataSet: TDataSet);
    procedure qryConsultaProdutosNotaFiscalBeforeOpen(DataSet: TDataSet);
    procedure qryProcuraProdutoNotaFiscalBeforeOpen(DataSet: TDataSet);
    procedure qryConsultaPedidosNotaFiscalBeforeOpen(DataSet: TDataSet);
    procedure qryProcuraPedidosNotaFiscalBeforeOpen(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFEItemsAfterEdit(DataSet: TDataSet);
    procedure qryDadosFiscaisRefAfterOpen(DataSet: TDataSet);
    procedure qryDadosFiscaisRefBeforeOpen(DataSet: TDataSet);
    procedure qryConsultaNaturezasBeforeOpen(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFEAfterScroll(DataSet: TDataSet);
    procedure qryProdutosNotaFiscalAfterPost(DataSet: TDataSet);
    procedure qryProdutosNotaFiscalBeforeOpen(DataSet: TDataSet);
    procedure qryNotaFiscalBeforeEdit(DataSet: TDataSet);
    procedure qryMovimentosFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure dsrProdutosNotasPagNFEDataChange(Sender: TObject;
      Field: TField);
    procedure qryCaracteristicasNotaFiscalAfterScroll(DataSet: TDataSet);
    procedure qryCaracteristicasNotaFiscalBeforeOpen(DataSet: TDataSet);
    procedure qryCaracteristicasNotaFiscalNewRecord(DataSet: TDataSet);
    procedure qrycaracteristicaselementosnotaspag_lAfterScroll(
      DataSet: TDataSet);
    procedure qrycaracteristicaselementosnotaspag_lNewRecord(
      DataSet: TDataSet);
    procedure qrycaracteristicaselementosnotaspag_cAfterScroll(
      DataSet: TDataSet);
    procedure qrycaracteristicaselementosnotaspag_cNewRecord(
      DataSet: TDataSet);
    procedure qryElementosLinhasFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryElementosColunasFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryElementosLinhasAfterDelete(DataSet: TDataSet);
    procedure qryElementosLinhasAfterPost(DataSet: TDataSet);
    procedure qryElementosLinhasBeforePost(DataSet: TDataSet);
    procedure qryElementosColunasBeforePost(DataSet: TDataSet);
    procedure qryElementosColunasAfterPost(DataSet: TDataSet);
    procedure qryElementosColunasAfterDelete(DataSet: TDataSet);
    procedure qrycaracteristicaselementosnotaspag_lBeforeInsert(
      DataSet: TDataSet);
    procedure qrycaracteristicaselementosnotaspag_cBeforeInsert(
      DataSet: TDataSet);
    procedure qrycaracteristicaselementosnotaspag_lAfterPost(
      DataSet: TDataSet);
    procedure qrycaracteristicaselementosnotaspag_cAfterPost(
      DataSet: TDataSet);
    procedure qrycaracteristicaselementosnotaspag_lAfterDelete(
      DataSet: TDataSet);
    procedure qrycaracteristicaselementosnotaspag_cAfterDelete(
      DataSet: TDataSet);
    procedure qryCaracteristicasNotaFiscalAfterOpen(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFEFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryCaracteristicasNotaFiscalaplicarfiltroChange(
      Sender: TField);
    procedure qryGradeAfterOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qryVolumesNotasPagNewRecord(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFEBeforeInsert(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFELotesNewRecord(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFELotesCalcFields(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFELotesAfterScroll(DataSet: TDataSet);
    procedure dsrProdutosNotasPagNFELotesDataChange(Sender: TObject;
      Field: TField);
    procedure qryProdutosNotasPagNFELotesAfterOpen(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFELotesAfterPost(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFELotesAfterDelete(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFELotesBeforeDelete(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFELotesBeforeEdit(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFELotesBeforeScroll(DataSet: TDataSet);
    procedure qryIPIFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure qryProdutosNotasPagNFEipiLookupGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryProdutosNotasPagNFEAfterOpen(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFEItemsipiLookupGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryProdutosNotasPagNFEItemsipiLookupChange(Sender: TField);
    procedure qryGradeBeforeOpen(DataSet: TDataSet);
    procedure qryCaracteristicasNotaFiscalAfterPost(DataSet: TDataSet);
    procedure qryCaracteristicasNotaFiscalAfterDelete(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFEAfterInsert(DataSet: TDataSet);
    procedure qryProdutosNotasPagNFEItemsSituacaoAfterInsert(
      DataSet: TDataSet);
    procedure qryCaracteristicasNotaFiscalAfterCancel(DataSet: TDataSet);
    procedure qryProcuraSeriesFornecedorBeforeOpen(DataSet: TDataSet);
    procedure qryProcuraSeriesFornecedorBeforeClose(DataSet: TDataSet);
    procedure qryNotaFiscalBeforeClose(DataSet: TDataSet);
  private
    fdtmCalcularCusto: TdtmCalcularCusto;
    fdtmCadastroNotasFiscaisAuxiliar: TdtmCadastroNotasFiscaisAuxiliar;
    ftpModoGrade: tModoGrade;
    fGradeBeforeOpen: TNotifyEvent;
    fCaracteristicasNotaFiscalAfterOpen: TNotifyEvent;
    fCaracteristicasNotaFiscalBeforeOpen: TNotifyEvent;
    fUnlockedGerarTabelaGrade: Boolean;
    fAtualizarTotais: TNotifyEvent;
    function GetdtmCalcularCusto: TdtmCalcularCusto;
    function GetdtmCadastroNotasFiscaisAuxiliar: TdtmCadastroNotasFiscaisAuxiliar;
    procedure PostProdutosNotaFiscal;
    procedure SetUnlockedGerarTabelaGrade(const Value: Boolean);

  private
    vProdutosNotasPagNFELotesnlote_Ant : String;
    State_qryProdutosNotaFiscal : TDataSetState;
    vPosition : dOUBLE;
    vTipoInclusaoProdutoGrade : TipoInclusaoProdutoGrade;
{    vListaProdutosComponentesdosCompostos : TStringList;}

    vOutroRateado : Boolean;
    vAtualizandoCodigoFiscalProdutosNFE: Boolean;
    {TotalProdutosSubstituicao,} TotalIPI: Currency;
    vSituacaoVisualizandoProdutosdaNFE : boolean;
    vSituacaoVisualizarDetalhesProdutosNota : boolean;
    vProdutosNotasPagNFEItemsquantidadeAntesEditar: Double;
    vDescricaoUnidadeAntesEditar: String;
    vFatorConversaoAntesEditar: Double;
    vFatorConversaoPNPAntesEditar: Double;

    vQtdeEstoqueAntesEditar: Currency;
    vQtdeEstoquePNPAntesEditar: Currency;

    ExecutadoCalculorImpostos : boolean;
    FInserindoLinhas: Boolean;
    FInserindoColunas: Boolean;

    FOnScrollLinhaColunaGrade: TNotifyEvent;
    FDataInicialNotaProduto: String;
    FDataFinalNotaProduto: String;
    FExistePrecoemBranco: Boolean;
    FUtilizarValoresPadrao: boolean;
    FValorPadraoaliquotaicms: Currency;
    FValorPadraovalorreducaobase: Currency;
    FValorPadraoaliquotaipi: currency;
    FValorPadraoprecounitario: Currency;
    FPodeInserirnaGrade: Boolean;
    FSomenteLeituraDuplicata: Boolean;
    FSomenteLeituraProdutos: Boolean;
    FSomenteLeituraImpostos: Boolean;
    FSomenteLeituraContabilidade: Boolean;
    FLancamentosOK: Boolean;
    fdescricaohistorico: String;
    fCodigoFiscalAuxiliar: integer;
    fCodigoFiscalAnterior: integer;
    fVenctosImpostosRetidosEntradasAfterOpen: TNotifyEvent;
    fExisteQuitacaoImpostosRetidosDuplicatas: Boolean;
    fExisteQuitacaoImpostosRetidosNotas: Boolean;
    fValorMarkup: Currency;
    FOnChangeTipoFornecedor: TNotifyEvent;
    FOnChangeCodigoFiscal: TNotifyEvent;
    FValorRatear: Currency;
    FValorRatearIPI: Currency;
    FValorRatearICMS: Currency;
    FVerificarPrecoVenda: Boolean;
    FAfterOpenNotaFiscal: TNotifyEvent;
    FVisualizarGrade: Boolean;
    FNumeroAdicaoImportacao: Integer;
    FValorConhecimentoFrete: Currency;
    FOnTotalizarAdicoes: TNotifyEvent;
    FmercadoriasAdicoes: Currency;
    FfreteAdicoes: Currency;
    FembalagemAdicoes: Currency;
    FthcAdicoes: Currency;
    FiiAdicoes: Currency;
    FipiAdicoes: Currency;
    FpisAdicoes: Currency;
    FcofinsAdicoes: Currency;
    FsiscomexAdicoes: Currency;
    FbaseicmsAdicoes: Currency;
    FvaloricmsAdicoes: Currency;
    FImportacao : Boolean;

    FValorICMSSubstituicao     : Currency;
    FVAlorBaseReducaoICMSSubst : Currency;
    fExisteDuplicatasemAberto: Boolean;
    FEntrarChavesNota: TNotifyEvent;
    FProdutosNFEBeforeScroll: TNotifyEvent;
    fArquivoXMLNFe: string;
    fIncluidoViaXml: boolean;
    fSaldoQuantidade: Double;
    fListaProdutosnoFornecedor: String;
    fIncluindoViaXml: boolean;
    fcrt: integer;
    fVisualizandoProdutosdaNFE: boolean;
    fAtualizarCodigoFiscalProdutosNFE: boolean;
    fListadePedidosMarcados: String;
//    fListadePedidos: String;
    fEntradaViaXML: boolean;
    fCondicaoEmissorNFE: Boolean;
    fNotaReferenciada: boolean;
    fPosicionarLinhaColunaNaGrade: TNotifyEvent;
    fcolunaAtual: String;
    fNomeCampocolunaAtual: string;
    fVisualizandoProdutosdaNFELC: boolean;
    fVisualizandoGrade: Boolean;
    fVisualizarComSaldosQuantidadeNFe: Boolean;
    fGradeAfterOpen: TNotifyEvent;
    fTipoLeituraXML: TtecLeituraXML;
    fFilialBase_Entrada: integer;
    fCNPJFilialBase_Entrada: String;
    fFilialContabil_Entrada: integer;
    fDuplicatasQuitadas: Boolean;
//    fPermitirCTeDiferenteNormal: boolean;
    procedure VerificarCampos_ProdutosNotasPagNFEItems(Sender: TObject; Field: TField);
    procedure SituacaoProduto(Reatualizar: boolean = false);
    procedure SituacaoNLote;
    procedure SituacaoPedido;
    procedure SituacaoCodigoFiscal;
    function ValorPagar: Currency;
    function getTipoPessoa: TtecTipoPessoa;
    function GetColunadaGrade: String;
    function GetLinhadaGrade: String;
    function GetEntradaporPedido: boolean;
    function GetTabelaConsultaSerieFilial: TZDataSet;
    function GetTabelaConsultaFilial: TZDataSet;
    function GetTabelaConsultaNotasProdutos: TZDataSet;
    procedure SetDataFinalNotaProduto(const Value: String);
    function GetGradeIcmsDiferente: Boolean;
    function GetGradeIPIDiferente: Boolean;
    function GetGradePrecoDiferene: Boolean;
    function GetGradeReducaoBaseDiferente: Boolean;
    function GetCopiaProdutoColunaGrade: String;
    function GetCopiaProdutoLinhaGrade: String;
    function GetTabelaGrade: TtecQuery;
    procedure setExistePrecoemBranco(const Value: Boolean);
    function GetCaracteristicaProduto: String;
    function GetTabelaLinhas: TZDataSet;
    function GetCodigoProcuraCaracteristica: String;
    function GetPodeTrocarVisualizacaoGrade: boolean;
    function GetNotaCancelada: Boolean;
//    function GetPermitirAlterar: Boolean;
//    procedure SetPermitirAlterar(const Value: Boolean);
    function GetSomenteLeituraDuplicata: Boolean;
    function GetSomenteLeituraProdutos: Boolean;
    function GetDocumentoPag: integer;
    function GetListaContasContabeis: String;
    function getQuantidadeNaturezas: Boolean;
    function GetDuplicatasQuitadas: Boolean;
    function GetProximoNrLancto: integer;
    procedure SetProximoNrLancto(const Value: integer);
    function GetValorMarkup: Currency;
    procedure SetPermitirAtualizarDigitado(const Value: Boolean);
    function GetPermitirAtualizarDigitado: Boolean;
    function GetValorRatear: Currency;
    function GetValorRatearIPI: Currency;
    function GetValorRatearICMS: Currency;
    function GetVerificarPrecoVenda: Boolean;
    function GetQuantidadeNaturezasProduto: Boolean;
    procedure TotalizarAdicoes;
//    procedure SelecionarCodigoNatureza(descricao: String);
//    procedure SelecionarCodigoNaturezaNFE(descricao: String);

    function GetEhNfeouCTE: boolean;
    procedure AtualizarCodigoFiscalProdutosNFE;
    function getIncluidoViaXml: boolean;
    function GetProdutosNotasPagNFEItems_proximocodigo: integer;
    function GetProdutosNotasPagNFEItemsSituacao_proximocodigo: integer;
    function PosicionarProdutosNotaFiscalPorProdutosNFE: boolean;
    procedure VerificarProdutosNotaFiscalPorProdutosNFE(operacao: TipoOperacaoErroProdutoNFE; ReatualizarProduto: boolean = false; TodosItems: boolean = false);
    function getQuantidadeNaturezasProdutoNFE: Boolean;
    function GetSaldoQuantidade: Double;
    function GetListaProdutosnoFornecedor: String;
    procedure SetArquivoXMLNFe(const Value: string);
    function getIncluindoViaXml: boolean;
    procedure setIncluindoViaXml(const Value: boolean);
    function Getcrt: integer;
    function GetListadePedidosMarcados: String;
    function Getdadofiscalnotafiscalsaida: integer;
    procedure Setdadofiscalnotafiscalsaida(const Value: integer);
    function GetListaChaveProdutoDadosFiscal: String;
    function GetListaChaveProdutoPedido: String;
    function GetCondicaoEmissorNFE: Boolean;
    function GetNotaReferenciada: boolean;
    function GetListaChaveProdutoPedidoAtual: String;
    procedure SetVisualizandoGrade(const Value: Boolean);
    procedure SetVisualizarComSaldosQuantidadeNFe(const Value: Boolean);
//    function GetListadePedidos: String;
    procedure DesabilitarControles(Desabilitar: Boolean);

//    procedure AdicionarListaProdutosComponentesdosCompostos(Produto: String);
    procedure AtualizacoesAposGravacao;
    procedure Atualizar_Valor_Frete_Contrato;
    function getFilialBase_Entrada: integer;
    function GetCNPJFilialBase_Entrada: String;
    function getFilialContabil_Entrada: integer;

    procedure OpenClientDataSetProdutosNotaFiscal(NameClient: TClientDataSet;
             Operation: tOperationClientDataSet);




  protected

      qryFornecedor,
    qryvFornecedores,
    spcProximoFornecedor,
    qryseriesfornecedores,
    qryEstados,
    qryCidades, qryCidadesUF,
    qryBairros,
    qryRuas: TtecQuery;

    ListaChavesProdutosPedidos : String;

    ListaChavesProdutosDadosFiscais : String;

    FContrapartidaAlterada: Boolean;
    FExisteAlteracaoCusto: boolean;
    FExistePrecoDigitado: Boolean;
    FViaPedido: Boolean;
    NumeroPedido: Integer;
    ProdutoAlterado: Boolean;
    FViaNota: Boolean;
    FExecutarScrollTabelaProdutos: Boolean;
    CriterioVerificacaoValores,
    CriterioVerificacaoImpostos: TtecCriterioVerificacaoImpostosNotaFiscal;
    SituacaoFreteInterno: TtecFreteInterno;
    QtdadeAnterior : Currency;
    NroUltimaDuplicata,
    NroUltimoImposto: Integer;
    vLigarEventosProdutosNotasPagNFEItems : boolean;
//    procedure AtualizarQuantidadeNaoRecebida(Incrementa: Boolean);

    function  BloquearProdutosNoEstoque: Boolean;
    procedure ExcluirDetalhesNotaEntrada;
    function ExcluirMovimentos: Boolean;
    procedure ExcluirProdutoFornecedor(Caracteristica, Fornecedor: String);
    procedure GerarSerieFilialBase;
    function GetCodigoEstadoConsultado: String;
    function GetCodigoFiscal: Integer;
    function GetCodigoFornecedorConsultado: String;
    function GetEditandoTabelaDuplicatasNota: Boolean;
    function GetEditandoTabelaProdutosNota: Boolean;
    function GetIncluindoNota: Boolean;
    function GetNomeFornecedor: String;
    function GetNumeroPessoa: String;
    function GetSerieFornecedorConsultado: String;
    function GetSomenteLeitura: Boolean;
    function GetTabelaConsultaConhecimento: TZDataSet;
    function GetTabelaConsultaEstados: TZDataset;
    function GetTabelaConsultaFornecedores: TZDataSet;
    function GetTabelaConsultaFornecedorTransporte: TZDataset;
    function GetTabelaConsultaNaturezaOperacao: TZDataSet;
    function GetTabelaConsultaNotaFiscais: TZDataSet;
    function GetTabelaConsultaPedidosNotaFiscal: TZDataSet;
    function GetTabelaConsultaProdutosNotaFiscal: TZDataSet;
    function GetTabelaConsultaSerieFornecedor: TZDataSet;
    function GetTabelaDuplicata: TZDataSet;
    function GetTabelaNotaFiscais: TZDataSet;
    function GetTabelaNotaFiscalVazia: Boolean;
    function GetTabelaProdutosNotaFiscal: TZDataSet;
    function GetTipoFornecedor: String;
    function GetTipoMovimentoNatureza: String;
    function ICMSFrete: Currency;
    function ICMSSeguro: Currency;
    procedure IncluirEditarMovimento(Qtdade: Currency; Tipo, Referencia: String; Custo: Currency; Incluir : boolean = true);

    function IncluirProdutosNaoCadastrados:Boolean;
    function IncluirProdutosNaoCadastradosLC(Caracteristica, DescricaoCaracteristica, ValorGrade1, ValorGrade2: String):Boolean;

    function IncluirPrecosNaoCadastrados: Boolean;
{    function IncluirPrecosNaoCadastradosLC(Produto, ItemProduto: String):Boolean;}

//    procedure IncluirMovimentos;
    procedure IncluirAtualizarLotes;
    procedure AtualizarMovimentos;
    procedure EliminarMovimentos;

    function  ImpostosRetidos: Currency;
    function PermitirExcluirNotaFiscal:Boolean;
    function QtdadeRecebida({ProdutodaNotaAtual: Boolean;} Pedido: integer; Produto: Int64):  Currency;
    procedure SetProcurarPorFornecedor(const Value: Boolean);
    procedure SetFornecedorParaISS(const Value: Integer);
    procedure SetSomenteLeitura(Value: Boolean);
    function VerificarProdutosFornecedor: Boolean;
    function VerificarValoresDasDuplicatas(var TotalSomatorio, TotalNota:Currency): TtecErroDuplicatas;
    function VerificarCustos: Boolean;
    property DuplicatasQuitadas: Boolean read GetDuplicatasQuitadas write fDuplicatasQuitadas;
    procedure AtualizarTabelaIPI;
//    procedure AtualizarValorUltimaCompra;
    property ValorRatear: Currency read GetValorRatear write FValorRatear;
    property ValorRatearIPI: Currency read GetValorRatearIPI write FValorRatearIPI;
    property ValorRatearICMS: Currency read GetValorRatearICMS write FValorRatearICMS;
    procedure VisualizarNFSaidas;
    procedure AtualizarIncidencias;
    function VerificarDestinatarioNFE(CNPJCPF: String; ExibirMsg: Boolean = true): boolean;
    function VerificarEmitenteNFE: boolean;
    procedure ImportarDadosCorpoNFE;
    procedure ImportarDadosVencimentoNFE;
    Function DocumentoReferenciadoNFSaida: Boolean;
    procedure ImportarDocumentosReferenciados;

    procedure ImportarProdutosNFE;
    function TodosProdutosNFEValidos(PosicionarnoRegistro: Boolean): boolean;
    function TodosProdutosNotasPagValidos: Boolean;
    function ExisteNaturezasProdutosSemGerarPagamento: boolean;

    procedure DesligarEventosProdutosNotasPagNFE;
    procedure LigarEventosProdutosNotasPagNFE;

    procedure DesligarEventosProdutosNotasPagNFEItems;
    procedure LigarEventosProdutosNotasPagNFEItems;

    property SaldoQuantidade: Double read GetSaldoQuantidade write fSaldoQuantidade;
    property ListaChaveProdutoDadosFiscal: String read GetListaChaveProdutoDadosFiscal;
    property ListaChaveProdutoPedido: String read GetListaChaveProdutoPedido;
    property ListaChaveProdutoPedidoAtual: String read GetListaChaveProdutoPedidoAtual;

    procedure VerificarUnidadeNFE;

    procedure AlertarProdutosPedidosnaNotaNormal;
    function CondicaoIncluirDuplicatasCTe: Boolean;

    procedure SituacaoProdutosNotasPagNFEsaldoquantidade;
    procedure SituacaoProdutosNotasPagNFEClassificacaoFiscal(Modo: byte; Reatualizar: boolean = false);


  public
    SelecionandoNF : boolean;
    ProdutosNotaFiscaldadofiscal : integer;
    ProdutosNotaFiscalfilialnotafiscalsaida: integer;
    ProdutosNotaFiscalserienotafiscalsaida: String;
    ProdutosNotaFiscalnumeronotafiscalsaida: integer;

    FCodigoFiscalProdutoOriginal: Integer;
    NroUltimoProdutoNota: integer;
    nomedocampoposicionar : string;
    vSerie, vtipo: String;
    vcodigo: integer;

//    RecalcularImpostos : Boolean;

    ErroValorConhecimentoFrete : Boolean;
    TotalValorIPIAlterado: Boolean;
    FProximoNrLancto: integer;
    FListaContasContabeis: String;
{    LinhasColunas: array [1..5] of TStringList;}
    Colunas : TStringList;
{    LInhas : TStringList;}
    FCodFiscalNatureza : Integer;
    vTipoFiltroSituacao : TipoFiltroSituacao;

    FCodigoFiscalProdutoNFEOriginal: Integer;
    FCodigoNaturezaProdutoNFEOriginal: Integer;

    FProdutosNotasPagNFEItemsproduto: largeint;
    FProdutosNotasPagNFEItemsprodutovisual: String;
    fProdutosNotasPagNFEItemspedido: integer;
    fGerandoProdutos: boolean;
    CampoProdutosNotasPagNFEItemsAlterado : TField;

    v_PosicaoProdutosNotasPagNFE : array[1..2] of TStringList;
    {
    v_qryProdutosNotasPagNFEnumero : integer;
    v_qryProdutosNotasPagNFEItemsnumero : integer;
    }

    VisualizarDetalhesProdutosNota : boolean;
    vcaracteristicaselementosnotaspag_lc : boolean;

    procedure CancelarProdutosNotaFiscal_;
    procedure AtualizaSQLProdutosExistenteNotas;
    procedure LerArquivoXMLNFe;
    procedure LerArquivoXMLCTe;

    procedure AbreTabelaConsultaProdutosNotaFiscal(FiltrarFornecedor, FiltrarPedido, FiltrarNota: Boolean; PesquisaNFE: boolean = false; ConciliarProdutosNFE: Boolean = false);

    procedure AbreTabelaProcuraNotaFiscal;
    procedure RefazerNumeroProdutos;
    procedure CalcularValorTotalItemProduto(TiposValor: TTecTiposValores);
    procedure CalcularValorTotalProdutosGrade;
    procedure CancelarDuplicatas;
    procedure CancelarProdutosNotaFiscal;
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
    function  ExcluirDuplicataNotaFiscal:  Boolean;
    function  ExcluirNotaFiscal:  Boolean;
    function  ExcluirNotaFiscalSaida: Boolean;
    function  ExcluirProdutosNotaFiscal:  Boolean;
    function  ExisteConhecimentoFrete(NomeCampo: String; Value: Variant): Boolean;
    function  ExisteEstado(NomeCampo: String; Value: Variant): Boolean;
    function  ExisteFornecedor(NomeCampo: String; Value: Variant): Boolean;
    function  ExisteFornecedorTransporte(NomeCampo: String; Value: Variant): Boolean;
    function  ExisteNatureza(NomeCampo: String; Value: Variant): Boolean;
    function  ExisteNotaFiscal(NomeCampo: String; Value: Variant): Boolean;
    function  ExistePedidoNotaFiscal(NomeCampo: String; Value: Variant): Boolean;
    function  ExistePedidoProdutoNFE(NomeCampo: String; Value: Variant): Boolean;

    function  ExisteFilial(NomeCampo: String; Value: Variant): Boolean;
    function  ExisteSerie(NomeCampo: String; Value: Variant): Boolean;
    function  ExisteNotaFiscalProduto(NomeCampo: String; Value: Variant): Boolean;

    function  ExisteProdutoNotaFiscal(NomeCampo: String; Value: Variant): Boolean;

    function  ExisteSerieFornecedor(NomeCampo: String; Value: Variant): Boolean;
    procedure FechaTabelaConsultaProdutosNotaFiscal;
    procedure FechaTabelaProcuraNotaFiscal;
    procedure GerarDuplicatas(Parcelas, Intervalo: Integer;
                Data: TDateTime;
                TipoJuros, TipoMulta: Char;
                ValorJuros: Currency;
                ValorMulta: Currency);

    function GravarDocumentoPag(Operacao: TtecOperacao; AnularCalculoPedidos: Boolean = false): Boolean;
    procedure GravarLancamentosContabeis;
    function  GravarDuplicataNotaFiscal: Boolean;
    function  GravarNotaFiscal(Var Erro: Integer) : Boolean;
    function  GravarNotaParcial(ForcarGravacao: Boolean = false) : Boolean;

    function GravarProdutosNotaFiscal: Boolean;
    function GravarProdutosNotasPagNFELotes: Boolean;

    function  GravarNotaFiscalSaida: Boolean;
    function  IncluirDuplicataNotaFiscal(Editar:Boolean): Boolean;
    function  IncluirNotaEntrada: Boolean;
    function  IncluirNotaSaida: Boolean;
    function  IncluirProdutosDoPedido : Boolean;

    function  IncluirProdutosDoPedidodaNFE(ExibirMensagemProdutosNaoIdentificados, ConfirmarVinculacao:boolean):Boolean;

    function  IncluirProdutosDaNota:Boolean;
    function  IncluirProdutosNotaFiscal(Editar:Boolean):Boolean;
    procedure LimparDetalhesNotaFiscal(Tudo: Boolean);
    function  PosicionarFornecedor: Boolean;
    procedure PosicionarNotaFiscal;
    function  PosicionarSerieFornecedor: Boolean;
    procedure ReFazConsultaDetalhesNotaFiscal;
    procedure IncluirDuplicatasViaXML;
    procedure Selecionar;
    procedure AbrirConhecimentoFrete;
    procedure SelecionarConhecimentoFrete;
    procedure SelecionarEstadoPlaca;
    procedure SelecionarFornecedorTransporte;
    procedure SelecionarFilial;
    procedure SelecionarSerie;
    procedure SelecionarNotaFiscalProduto;
    procedure SelecionarPedidoNotaFiscal;
    procedure SelecionarPedidoNFE;
    procedure SelecionarPedidoNotasPag;

    procedure SelecionarProdutoNotaFiscal;
    procedure SelecionarProdutoNFE;

    procedure SelecionarNatureza; overload;
    procedure SelecionarNatureza(CodigoNatureza: integer); overload;
    procedure SetarFornecedorPedido;
    procedure SetarTipoFornecedor;
    function  ValidarCNPJ(Numero: String): Boolean;
    property CodigoEstadoConsultado: String read GetCodigoEstadoConsultado;
    property CodigoFiscal: Integer read GetCodigoFiscal;
    property CodigoFornecedorConsultado: String read GetCodigoFornecedorConsultado;
    property EditandoTabelaDuplicatasNota: Boolean read GetEditandoTabelaDuplicatasNota;
    property EditandoTabelaProdutosNota: Boolean read GetEditandoTabelaProdutosNota;
    function GetGerarDocumentoPag: Boolean;
    property GerarDocumentoPag: Boolean read GetGerarDocumentoPag;
    property IncluindoNota: Boolean Read GetIncluindoNota;
    property NomeFornecedor: String read GetNomeFornecedor;
    property NumeroPessoa: String read GetNumeroPessoa;
    property ProcurarPorFornecedor: Boolean write SetProcurarPorFornecedor;
    property SerieFornecedorConsultado: String read GetSerieFornecedorConsultado;
    property SomenteLeitura: Boolean read GetSomenteLeitura write SetSomenteLeitura;
    property SomenteLeituraDuplicata: Boolean read GetSomenteLeituraDuplicata write FSomenteLeituraDuplicata;
    property SomenteLeituraProdutos: Boolean read GetSomenteLeituraProdutos write FSomenteLeituraProdutos;
    function GetSomenteLeituraContabilidade: Boolean;
    function GetCReDBigualValorNota: Boolean;
    function GetGravarSemLanctos: Boolean;
    function GetCodFiscalNatureza : Integer;
    function ExisteContaCreditoNatureza : Boolean;


    property SomenteLeituraContabilidade: Boolean read GetSomenteLeituraContabilidade write FSomenteLeituraContabilidade;
    property TabelaConsultaConhecimento: TZDataSet read GetTabelaConsultaConhecimento;
    property TabelaConsultaEstados: TZDataset read GetTabelaConsultaEstados;
    property TabelaConsultaFornecedores: TZDataSet read GetTabelaConsultaFornecedores;
    property TabelaConsultaFornecedorTransporte: TZDataset read GetTabelaConsultaFornecedorTransporte;
    property TabelaConsultaNaturezaOperacao: TZDataSet read GetTabelaConsultaNaturezaOperacao;
    property TabelaConsultaNotaFiscais: TZDataSet read GetTabelaConsultaNotaFiscais;
    property TabelaConsultaPedidosNotaFiscal: TZDataSet read GetTabelaConsultaPedidosNotaFiscal;
    property TabelaConsultaProdutosNotaFiscal: TZDataSet read GetTabelaConsultaProdutosNotaFiscal;
    property TabelaConsultaSerieFornecedor: TZDataSet read GetTabelaConsultaSerieFornecedor;
    property TabelaConsultaSerieFilial: TZDataSet read GetTabelaConsultaSerieFilial;
    property TabelaConsultaNotasProdutos: TZDataSet read GetTabelaConsultaNotasProdutos;
    property TabelaConsultaFilial: TZDataSet read GetTabelaConsultaFilial;
    property TabelaDuplicata: TZDataSet read GetTabelaDuplicata;
    property TabelaNotaFiscais: TZDataSet read GetTabelaNotaFiscais;
    property TabelaNotaFiscalVazia: Boolean read GetTabelaNotaFiscalVazia;
    property TabelaProdutosNotaFiscal: TZDataSet read GetTabelaProdutosNotaFiscal;
    property TabelaLinhas: TZDataSet read GetTabelaLinhas;
    property TipoFornecedor: String read GetTipoFornecedor;
    property TipoMovimentoNatureza: String read GetTipoMovimentoNatureza;
    property TipoPessoa: TtecTipoPessoa read getTipoPessoa;
    property ExecutarScrollTabelaProdutos: Boolean read FExecutarScrollTabelaProdutos write FExecutarScrollTabelaProdutos;
    property OnScrollLinhaColunaGrade    : TNotifyEvent read FOnScrollLinhaColunaGrade write FOnScrollLinhaColunaGrade;
    property OnChangeTipoFornecedor: TNotifyEvent read FOnChangeTipoFornecedor write FOnChangeTipoFornecedor;
    property OnChangeCodigoFiscal: TNotifyEvent read FOnChangeCodigoFiscal write FOnChangeCodigoFiscal;
    property PosicionarLinhaColunaNaGrade: TNotifyEvent read fPosicionarLinhaColunaNaGrade write fPosicionarLinhaColunaNaGrade;

    property GradeAfterOpen: TNotifyEvent read fGradeAfterOpen write fGradeAfterOpen;
    property GradeBeforeOpen: TNotifyEvent read fGradeBeforeOpen write fGradeBeforeOpen;
    property AtualizarTotais: TNotifyEvent read fAtualizarTotais write fAtualizarTotais;

    property CaracteristicasNotaFiscalAfterOpen: TNotifyEvent read fCaracteristicasNotaFiscalAfterOpen write fCaracteristicasNotaFiscalAfterOpen;
    property CaracteristicasNotaFiscalBeforeOpen: TNotifyEvent read fCaracteristicasNotaFiscalBeforeOpen write fCaracteristicasNotaFiscalBeforeOpen;

    property LinhadaGrade: String read GetLinhadaGrade;
    property ColunadaGrade: String read GetColunadaGrade;
    property EntradaporPedido: boolean read GetEntradaporPedido;
    property DataInicialNotaProduto: String read FDataInicialNotaProduto write FDataInicialNotaProduto;
    property DataFinalNotaProduto: String read FDataFinalNotaProduto write SetDataFinalNotaProduto;
    procedure FechaTabelas_PesquisarNota;
    procedure AbreTabelas_PesquisarNota;
    procedure GerarTabelaGrade;
    function UtilizandoGrade: Boolean;
//    procedure CopiarProdutosNotasFiscais;
    procedure GravarCamposCopiaProdutos(Origem, Destino: TTecQuery);
    procedure CalcularTotalGrade;
    procedure PosicionarLinhanaGrade;
    property GradePrecoDiferente: Boolean read GetGradePrecoDiferene;
    property GradeIcmsDiferente: Boolean read GetGradeIcmsDiferente;
    property GradeIPIDiferente: Boolean read GetGradeIPIDiferente;
    property GradeReducaoBaseDiferente: Boolean read GetGradeReducaoBaseDiferente;
//    function PosicionarLinhaColunanoProduto(Coluna :String): boolean;
    property CopiaProdutoLinhaGrade : String read GetCopiaProdutoLinhaGrade;
    property CopiaProdutoColunaGrade : String read GetCopiaProdutoColunaGrade;
    function PosicionarLinhaColunanoProdutoNotaFiscal(Coluna :String): boolean;
    function PosicionarLinhaColunanoProdutoNotaFiscalCopia(Coluna :String): boolean;
    property TabelaGrade: TtecQuery read GetTabelaGrade;
    procedure EditarGrade(Editar:Boolean);
//    procedure GravarCopiaProdutosNotasFiscais;
    property ExistePrecoemBranco: Boolean read FExistePrecoemBranco write setExistePrecoemBranco;
//    procedure AbreTabelaConsultaCaracteristica;
    procedure AbreTabelaProcuraCaracteristica;
    property CodigoProcuraCaracteristica: String read GetCodigoProcuraCaracteristica;
//    function ExisteCaracteristica(Campo, Codigo: string): Boolean;
    property UtilizarValoresPadrao: boolean read FUtilizarValoresPadrao write FUtilizarValoresPadrao;
    property ValorPadraoprecounitario: Currency read FValorPadraoprecounitario write FValorPadraoprecounitario;
    property ValorPadraoaliquotaicms: Currency read FValorPadraoaliquotaicms write FValorPadraoaliquotaicms;
    property ValorPadraoaliquotaipi: currency read FValorPadraoaliquotaipi write FValorPadraoaliquotaipi;
    property ValorPadraovalorreducaobase: Currency read FValorPadraovalorreducaobase write FValorPadraovalorreducaobase;
    property CaracteristicaProduto: String read GetCaracteristicaProduto;
    procedure AbrirElementosNaoCadastrados;

    procedure AdicionarLinhasSelecionadas(Marcando, Todos: Boolean);
    procedure AdicionarLinhasPresentesemProdutosSelecionadas(Marcando, Todos: Boolean);

    procedure AdicionarColunasSelecionadas(Marcando, Todos: Boolean);
    procedure AdicionarColunasPresentesemProdutosSelecionadas(Marcando, Todos: Boolean);

    function GravarElementosGrade: Boolean;
    function ExcluirLinhas_: Boolean;

    property PodeInserirnaGrade: Boolean read FPodeInserirnaGrade write FPodeInserirnaGrade;
//    procedure AdicionarLinhaColuna(CodigoProduto, CodigoCaracteristica, LinhaColuna, Linha, Coluna: String); overload;
//    procedure AdicionarLinhaColuna(index : integer; CodigoProduto, CodigoCaracteristica, LinhaColuna, Linha, Coluna: String); overload;

    procedure IncluirLinha_(linha: String);
    procedure IncluirColuna(coluna: String);


    property PodeTrocarVisualizacaoGrade: boolean read GetPodeTrocarVisualizacaoGrade;
    procedure LocalizarLinha(elemento:String);
    procedure LocalizarLinha_(elemento:String);
    procedure LocalizarColuna(elemento:String);

//    function JaCadastradonaGrade(Elemento: String): boolean;
    property NotaCancelada: Boolean read GetNotaCancelada;
//    property PermitirAlterar: Boolean read GetPermitirAlterar write SetPermitirAlterar;
    property DocumentoPag: integer read GetDocumentoPag;
    property ListaContasContabeis: String read GetListaContasContabeis write FListaContasContabeis;
    procedure AtribuirContaCreditoDocumentoPag(Conta,Historico: Integer;
                                               excluir: Boolean);
    function getdescricaohistorico: String;
    property descricaohistorico:String read getdescricaohistorico write fdescricaohistorico;
    property QuantidadeNaturezas: Boolean read getQuantidadeNaturezas;
    property QuantidadeNaturezasProduto: Boolean read getQuantidadeNaturezasProduto;
    property QuantidadeNaturezasProdutoNFE: Boolean read getQuantidadeNaturezasProdutoNFE;

    property CodigoFiscalAuxiliar: integer read fCodigoFiscalAuxiliar write fCodigoFiscalAuxiliar;
    property CodigoFiscalAnterior: integer read fCodigoFiscalAnterior write fCodigoFiscalAnterior;
    property VenctosImpostosRetidosEntradasAfterOpen: TNotifyEvent
             read fVenctosImpostosRetidosEntradasAfterOpen
             write fVenctosImpostosRetidosEntradasAfterOpen;
    property ExisteQuitacaoImpostosRetidosDuplicatas: Boolean
             read fExisteQuitacaoImpostosRetidosDuplicatas
             write fExisteQuitacaoImpostosRetidosDuplicatas;
    property ExisteQuitacaoImpostosRetidosNotas: Boolean
             read fExisteQuitacaoImpostosRetidosNotas
             write fExisteQuitacaoImpostosRetidosNotas;
    procedure LimparRetencoes;
    property ProximoNrLancto: integer read GetProximoNrLancto write SetProximoNrLancto;
    property ValorMarkup: Currency read GetValorMarkup write fValorMarkup;
    procedure EditarNotaFiscal;
    procedure EditarProdutosNotasPag;


    procedure EliminarCalculosIncluidos;
    function CalcularCusto: Boolean;
    function CalcularPrecoVenda : Boolean;
    function IcmsSubstDestacado : Boolean;

    procedure AtribuirPreco(caracteristica :String; preco: integer;
                            ValorCusto,
                            precovenda : Currency; //preço a aribuir: calculado ou digitado
                            VerificarMaiorPreco : Boolean; //guardar o maior ou forçar (qdo alterado)
                            CampoValorPreco : TField); //atualizar digitado ou atribuido

    property PermitirAtualizarDigitado: Boolean
             read GetPermitirAtualizarDigitado
             Write SetPermitirAtualizarDigitado;

    procedure AtribuirPermitirAtualizarDigitado(caracteristica :String; preco: integer;
                            ValorCusto : Currency; Valor: Boolean);

    property VerificarPrecoVenda: Boolean read GetVerificarPrecoVenda write FVerificarPrecoVenda;


    function GetValorAcrescimo: Currency;
    function GetValorCofinsaRecolher: Currency;
    function GetValordaNota: Currency;
    function GetValorDespesasAcessorias: Currency;
    function GetValorDespesasCOFINS: Currency;
    function GetValorCustodaMercadoria: Currency;
    function GetValorEstoquedaMercadoria: Currency;
    function GetValorFrete: Currency;
    function GetValorICMS: Currency;
    function GetValorICMSSubstituicao: Currency;
    function GetValorIPI: Currency;
    function GetValorPIS: Currency;

    function GetValorProdutos: Currency;
    function GetValorSeguro: Currency;
    function GetCofinsRetido: Currency;
    function GetCSLLRetido: Currency;
    function GetINSSRetido: Currency;
    function GetIRRetido: Currency;
    function GetISSRetido: Currency;
    function GetPISRetido: Currency;
    function GetPISCOFINSCSLLRetido: Currency;
    function GetValordesconto: Currency;
    function GetDataDocumento: TDateTime;
    function GetCodigoNatureza: Integer;
    function GetDebitoFornecedor: Integer;
    function GetFornecedorParaISS: Integer;
    function GetCreditoFornecedor: Integer;
    function GetFilialDocumento: Integer;
    function GetCodigoDocumento: Int64;
    function GetProduto: String;
    function GetNumeroNotaFiscal: integer;
    function GetContaCreditar: integer;
    function GetHistoricoDebitar: integer;
    procedure PerpetrarExclusao;
    procedure CancelarNFe;
    procedure SelecionarNaturezaProduto;
    procedure SelecionarNaturezaProdutoNFE(CodigoNatureza, codigofiscal: integer; AbrirConsulta: boolean = false);
    property AfterOpenNotaFiscal: TNotifyEvent read FAfterOpenNotaFiscal write FAfterOpenNotaFiscal;
    property VisualizarGrade: Boolean read FVisualizarGrade write FVisualizarGrade;

    function Importacao_: Boolean;

    function IncluirAdicao(Editar:Boolean):Boolean;
    function ExcluirAdicao: Boolean;
    function GravarAdicao: Boolean;
    function IncluirProdutoImportado(Editar:Boolean):Boolean;
    function ExcluirProdutoImportado: Boolean;
    function GravarProdutoImportado: Integer;
    function GerarProdutosImportacao: Boolean;
    function VerificarPedido(Pedido:Integer):Boolean;
    procedure PreencherDuplicatas(Pedido: Integer);
    property ValorConhecimentoFrete: Currency read FValorConhecimentoFrete write FValorConhecimentoFrete;
    property FornecedorParaISS: integer write SetFornecedorParaISS;
    function ProdutosNotaMesmoPedido(var Pedido: Integer): Integer;
    property  OnTotalizarAdicoes  : TNotifyEvent read FOnTotalizarAdicoes write FOnTotalizarAdicoes;
    property  MercadoriasAdicoes  : Currency read FmercadoriasAdicoes write FmercadoriasAdicoes;
    property  FreteAdicoes        : Currency read FfreteAdicoes       write FfreteAdicoes;
    property  EmbalagemAdicoes    : Currency read FembalagemAdicoes   write FembalagemAdicoes;
    property  THCAdicoes          : Currency read FthcAdicoes         write FthcAdicoes;
    property  IIAdicoes           : Currency read FiiAdicoes          write FiiAdicoes;
    property  IPIAdicoes          : Currency read FipiAdicoes         write FipiAdicoes;
    property  PISAdicoes          : Currency read FpisAdicoes         write FpisAdicoes;
    property  COFINSAdicoes       : Currency read FcofinsAdicoes      write FcofinsAdicoes;
    property  SISCOMEXAdicoes     : Currency read FsiscomexAdicoes    write FsiscomexAdicoes;
    property  BaseICMSAdicoes     : Currency read FbaseicmsAdicoes    write FbaseicmsAdicoes;
    property  ValorICMSAdicoes    : Currency read FvaloricmsAdicoes   write FvaloricmsAdicoes;
    function ValidarDeclaracao: Boolean;

    function CalcularImpostos(msgDifAliquotaICMS: boolean = true;
                              {ForcarRecalculo: boolean = false;}
                              AlteracaoEspecifica: tpAlteracaoEspecifica = tpAltEsp_Nenhuma;
                              VerificarAcertoCentavos: boolean = True;
                              CalcularTodosRegistros: Boolean = false): boolean; overload;

    function ValidarValoresDigitados: boolean;
    procedure ImprimirEspelhoNota;
    procedure ImprimirAutorizacoes;
    property ExisteDuplicatasemAberto: Boolean read fExisteDuplicatasemAberto write fExisteDuplicatasemAberto;
    property EhNfeouCTE: boolean read GetEhNfeouCTE;
    property ArquivoXMLNFe: string read fArquivoXMLNFe write SetArquivoXMLNFe;
    property EntrarChavesNota: TNotifyEvent read FEntrarChavesNota write FEntrarChavesNota;
    property ProdutosNFEBeforeScroll: TNotifyEvent read FProdutosNFEBeforeScroll write FProdutosNFEBeforeScroll;
    procedure abreConsultaNaturezaProduto;
    procedure fechaConsultaNaturezaProduto;
    function VerificarProdutosFornecedores(VerificarTodos: Boolean = true; Excluir: Boolean = false) : boolean;
    procedure VerificarProdutosFornecedoresUnidades;

    property IncluidoViaXml: boolean read getIncluidoViaXml write fIncluidoViaXml;
    property IncluindoViaXml: boolean read getIncluindoViaXml write setIncluindoViaXml;
    procedure ApagarProdutosNotasPagNFE;
    property ProdutosNotasPagNFEItems_proximocodigo: integer read GetProdutosNotasPagNFEItems_proximocodigo;
    property ProdutosNotasPagNFEItemsSituacao_proximocodigo: integer read GetProdutosNotasPagNFEItemsSituacao_proximocodigo;
    procedure ListaErroProdutosNFE(descricaoerro, complementodescricaoerro: string;
              operacao: TipoOperacaoErroProdutoNFE;
              TipodeProcura: TLocateOption  = loCaseInsensitive;
              Erro : Boolean = true;
              ReatualizarProduto : Boolean = false;
              RemoverProdutodaLista : Boolean = True);

    procedure VerificarValoresProdutosNotasPagNFEItems;
    procedure PosicionarProdutosNotasPagNFEComerro;
    property ListaProdutosnoFornecedor: String read GetListaProdutosnoFornecedor write fListaProdutosnoFornecedor;
    function ProdutosNotasPagNFEItemsSituacaoSemErro: boolean;
    function ProdutosNotasPagNFEItemsSituacaoComAlerta: boolean;
    function CondicaoCSOSN: Boolean;
    property crt: integer read Getcrt write fcrt;
    property VisualizandoProdutosdaNFE: boolean read fVisualizandoProdutosdaNFE write fVisualizandoProdutosdaNFE;
    property VisualizandoProdutosdaNFELC: boolean read fVisualizandoProdutosdaNFELC write fVisualizandoProdutosdaNFELC;

    property ListadePedidosMarcados: String read GetListadePedidosMarcados write fListadePedidosMarcados;
//    property ListadePedidos: String read GetListadePedidos write fListadePedidos;

    procedure AbrirConsultaPedidosProdutosNotasPagNFE;
    procedure FecharConsultaPedidosNFE;
    procedure IncluirNaListadePedidos;
    procedure ExcluirdaListadePedidos;
    property EntradaViaXML: boolean read fEntradaViaXML write fEntradaViaXML;
//    property PermitirCTeDiferenteNormal: boolean read fPermitirCTeDiferenteNormal write fPermitirCTeDiferenteNormal default true;
    property dadofiscalnotafiscalsaida: integer read Getdadofiscalnotafiscalsaida write Setdadofiscalnotafiscalsaida;

    procedure RatearDesconto;
    procedure RatearFrete;

    procedure GuardarPosicaoProdutosNotasPagNFE;
    procedure VoltarPosicaoProdutosNotasPagNFE;

    property CondicaoEmissorNFE: Boolean read GetCondicaoEmissorNFE write fCondicaoEmissorNFE;
    procedure LimparDadosNotaReferenciada;
    property NotaReferenciada: boolean read GetNotaReferenciada write fNotaReferenciada;
    function VerificarBloqueiodaTabela: boolean; overload;

    function VerificarProdutosNotasPagNFEquantidadeselecionada(ValorAlterado: boolean = false): boolean;
    property ColunaAtual: string read fcolunaAtual write fcolunaatual;
    property NomeCampoColunaAtual: string read fNomeCampocolunaAtual write fNomeCampocolunaatual;
    property VisualizandoGrade: Boolean read fVisualizandoGrade write SetVisualizandoGrade;
    property VisualizarComSaldosQuantidadeNFe : Boolean read fVisualizarComSaldosQuantidadeNFe write SetVisualizarComSaldosQuantidadeNFe;

    function VerificarDadosAntesGravar(ds: array of TZDataSet): TtecVerificarDados;
    procedure VerificarDadosDepoisGravar;

    function aplicarfiltroProdutosNotasPagNFE: boolean;

    procedure AtualizarItensgradenfe;
    function ApagarProdutosNotasPagGrade(ValorColuna, CampoColuna: String): boolean;

    property TipoLeituraXML: TtecLeituraXML read fTipoLeituraXML write fTipoLeituraXML;
    function ValorPropriedade(propriedade, classe: String): Variant;

    procedure refazerConsultaPedidos;
    Function ExibirFicha(FormOrigem: String): boolean;

    procedure IncluirporEAN;
    property FilialBase_Entrada: integer read getFilialBase_Entrada write fFilialBase_Entrada;
    property FilialContabil_Entrada: integer read getFilialContabil_Entrada write fFilialContabil_Entrada;

    property CNPJFilialBase_Entrada: String read GetCNPJFilialBase_Entrada write fCNPJFilialBase_Entrada;

    procedure RedistribuirLotes;
    property dtmCalcularCusto: TdtmCalcularCusto read GetdtmCalcularCusto write fdtmCalcularCusto;
    property dtmCadastroNotasFiscaisAuxiliar: TdtmCadastroNotasFiscaisAuxiliar read GetdtmCadastroNotasFiscaisAuxiliar write fdtmCadastroNotasFiscaisAuxiliar;
    property tpModoGrade: tModoGrade read ftpModoGrade write ftpModoGrade;
    function PosicionarProdutosNFEPorProdutosNotaFiscal : boolean;
    property UnlockedGerarTabelaGrade: Boolean read fUnlockedGerarTabelaGrade write SetUnlockedGerarTabelaGrade;



  end;

var
{  dtmCadastroNotasFiscais: TdtmCadastroNotasFiscais;}
  tipoGrade : TTecTipoGrade;

  CodClienteAnt: Integer;
  TipoClienteAnt: String;


const
  SQLListaContaContabil =   'and (codigo = %s or codigo not in (%s))';
  SQLGrade = 'AND (c.grade1 is not null or c.grade2 is not null)';


implementation

uses
  //CLX
  SysUtils, Math,
  //Biblio
  biblio, clusuario, clparametrossistema, clnfe,
  //Repositorio
  dmimprimenotaentrada, fmcadastronotasfiscais, {pcnNFe, pcteCTe,}
  ACBrCTeConhecimentos, fmNFeEntradaSefaz;

{$R *.dfm}

{ TdtmCadastroNotasFiscais }

const
  CriteriosAjusteValoresNotaFiscal: array[TtecCriterioVerificacaoImpostosNotaFiscal] of
  record
    Frete,
    Seguro,
    Acresc: Boolean;
    arredonda: single;
  end = ((Frete:False; Seguro:False;   Acresc:False;  arredonda:0),
         (Frete:True;  Seguro:False;   Acresc:False;  arredonda:0),
         (Frete:False; Seguro:True;    Acresc:False;  arredonda:0),
         (Frete:True;  Seguro:True;    Acresc:False;  arredonda:0),
         (Frete:False; Seguro:False;   Acresc:True;   arredonda:0),
         (Frete:True;  Seguro:False;   Acresc:True;   arredonda:0),
         (Frete:False; Seguro:True;    Acresc:True;   arredonda:0),
         (Frete:True;  Seguro:True;    Acresc:True;   arredonda:0),
         (Frete:False; Seguro:False;   Acresc:False;  arredonda:0.5),
         (Frete:True;  Seguro:False;   Acresc:False;  arredonda:0.5),
         (Frete:False; Seguro:True;    Acresc:False;  arredonda:0.5),
         (Frete:True;  Seguro:True;    Acresc:False;  arredonda:0.5),
         (Frete:False; Seguro:False;   Acresc:True;   arredonda:0.5),
         (Frete:True;  Seguro:False;   Acresc:True;   arredonda:0.5),
         (Frete:False; Seguro:True;    Acresc:True;   arredonda:0.5),
         (Frete:True;  Seguro:True;    Acresc:True;   arredonda:0.5));

{
type

  TtecQuantidadePorProdutoPedido = class
  protected
    FQuantidade: Currency;
    FPedido: Integer;
    FProduto: Int64;
  public
    constructor Create(Ped: integer; Prod: int64; Qtdade: Currency);
    property Pedido: Integer read FPedido;
    property Produto: Int64 read FProduto;
    property Quantidade: Currency read FQuantidade write FQuantidade;
  end;

  TtecList = class(TList)
  protected
    function GetItems(Pedido: integer; Produto: Int64): TtecQuantidadePorProdutoPedido;
  public
    property Items[Pedido: integer; Produto: Int64]: TtecQuantidadePorProdutoPedido read GetItems;// write SetItems;
  end;
}

  {
var
  T_Lista: TtecList;
  }

const

  SQLPorPedido = ' and pp.pedido in (%s)';
  SQLPedido = 'and (p.codigo in (select d.produto from produtospedidos d ' +
                                'where (produtospedidos_recebido(d.pedido, d.produto) <= d.quantidade) and '+
                                '(d.pedido in (%s))))';

{ESTA SITUACAO DEVERÁ SER REVISTA POIS NA NAVEGACAO DE UMA NOTA PARCIAL A CONSULTA NÃO ABRE QUANDO QtIDADE NOTA > QtIDADE PEDIDO}
  SQLFornecedor = 'and p.caracteristica in (select fp.caracteristica from fornecedoresprodutos fp where fp.fornecedor = %d)';


procedure TdtmCadastroNotasFiscais.AbreTabelaConsultaProdutosNotaFiscal(FiltrarFornecedor, FiltrarPedido, FiltrarNota: Boolean; PesquisaNFE: boolean; ConciliarProdutosNFE: Boolean);
begin
  if FiltrarPedido then
  begin
    qryConsultaProdutosNotaFiscal.Sql.Text := dtmCadastroNotasFiscaisAuxiliar.qryConsultaProdutosNotaFiscal_PEDIDO.Sql.Text;
//    qryConsultaProdutosNotaFiscal.ParamByName('estado').AsString := qryNotaFiscalestado.AsString;
//    qryConsultaProdutosNotaFiscal.ParamByName('estadofilialbase').AsString := EstadoFilialBase;
    qryConsultaProdutosNotaFiscal.ParamByName('filial').AsInteger:= FilialBase;
    qryConsultaProdutosNotaFiscalnumerodocumentotabela.visible := true;
    qryConsultaProdutosNotaFiscalnumeroprodutotabela.visible := true;
    qryConsultaProdutosNotaFiscalquantidade.visible := true;

    if PesquisaNFE then
    begin
      if ConciliarProdutosNFE then
      begin
        qryConsultaProdutosNotaFiscal.MacroByName('SQLDetalhes').AsString := qryPedidosNotasPagpedido.AsString;
        qryConsultaProdutosNotaFiscal.MacroByName('SQLProduto').AsString := '';
      end
      else
      begin
        if fListadePedidosMarcados<>'0' then
        begin
          qryConsultaProdutosNotaFiscal.MacroByName('SQLDetalhes').AsString := fListadePedidosMarcados;
          qryConsultaProdutosNotaFiscal.MacroByName('SQLProduto').AsString := '';
        end
        else
        begin
          qryConsultaProdutosNotaFiscal.MacroByName('SQLDetalhes').AsString := inttostr(qryProdutosNotasPagNFEItemspedido.asinteger);
          qryConsultaProdutosNotaFiscal.MacroByName('SQLProduto').AsString := '';
        end;
      end;
    end
    else
    begin
      qryConsultaProdutosNotaFiscal.MacroByName('SQLDetalhes').AsString := inttostr(qryProdutosNotaFiscalpedido.asinteger);
      qryConsultaProdutosNotaFiscal.MacroByName('SQLProduto').AsString := '';
    end;
  end
  else
  if FiltrarNota then
  begin
    qryConsultaProdutosNotaFiscalnumerodocumentotabela.visible := false;
    qryConsultaProdutosNotaFiscalnumeroprodutotabela.visible := true;
    qryConsultaProdutosNotaFiscalquantidade.Visible := true;

    qryConsultaProdutosNotaFiscal.Sql.Text := dtmCadastroNotasFiscaisAuxiliar.qryConsultaProdutosNotaFiscal_NOTASAIDA.Sql.Text;
    qryConsultaProdutosNotaFiscal.MacroByName('SQLDetalhes').AsString := '';
    qryConsultaProdutosNotaFiscal.MacroByName('SQLProduto').AsString := '';
    qryConsultaProdutosNotaFiscal.Parambyname('dadofiscal').AsInteger := qryProcuraNotaFiscalProdutosdadofiscal.AsInteger;
  end
  else
  begin
    qryConsultaProdutosNotaFiscalnumerodocumentotabela.visible := false;
    qryConsultaProdutosNotaFiscalnumeroprodutotabela.visible := false;
    qryConsultaProdutosNotaFiscalquantidade.visible := false;

    qryConsultaProdutosNotaFiscal.Sql.Text := dtmCadastroNotasFiscaisAuxiliar.qryConsultaProdutosNotaFiscal_NORMAL.Sql.Text;
    qryConsultaProdutosNotaFiscal.ParamByName('filial').AsInteger:= FilialBase;
    if FiltrarFornecedor then
    begin
      qryConsultaProdutosNotaFiscal.MacroByName('SQLDetalhes').AsString := Format(SQLFornecedor, [qryProcuraFornecedorescodigo.AsInteger]);
      qryConsultaProdutosNotaFiscal.MacroByName('SQLProduto').AsString := '';
    end
    else
    begin
      qryConsultaProdutosNotaFiscal.MacroByName('SQLDetalhes').AsString := '';
      qryConsultaProdutosNotaFiscal.MacroByName('SQLProduto').AsString := ' and (p.codigo = 0)';
    end
  end;
  Abre(ctTabelaConsultaProdutosNotafiscal);
end;

procedure TdtmCadastroNotasFiscais.AbreTabelaProcuraNotaFiscal;
begin
  qryConsultaNotasFiscais.open;
//  Abre(ctTabelaConsultaNotaFiscal);
//  Abre(ctTabelasConsultaFornecedores);
  qryConsultaFornecedores.Open;
  qryConsultaSeriesFornecedor.Open;
//  Abre(ctTabelaConsultaSerieFornecedor);
end;

procedure TdtmCadastroNotasFiscais.AtualizaSQLProdutosExistenteNotas;
var
  Pos: TBookmark;
  Where, str: String;
  Prod: Int64;
  QtdeProdutos: Currency;
begin
  QtdeProdutos := 0;
  qryProdutosNotaFiscal.AfterScroll := nil;

  ListaChavesProdutosPedidos := '';
  ListaChavesProdutosDadosFiscais := '';

  if qryProdutosNotaFiscal.Active then
  begin

    Pos := qryProdutosNotaFiscal.GetBookmark;
    qryProdutosNotaFiscal.DisableControls;
    try
      DesabilitarControles(true);
      qryProdutosNotaFiscal.First;
      while Not qryProdutosNotaFiscal.Eof do
      begin
        if qryProdutosNotaFiscalpedido.AsInteger <> 0 then
          ListaChavesProdutosPedidos := ListaChavesProdutosPedidos + '('+qryProdutosNotaFiscalpedido.AsString + ', ' +
                                                                         inttostr(qryProdutosNotaFiscalnumeroprodutotabela.AsInteger) + ', ' +
                                                                         qryProdutosNotaFiscalproduto.AsString +')';
        if qryprodutosnotafiscaldadofiscal.asinteger <> 0 then
           ListaChavesProdutosDadosFiscais := ListaChavesProdutosDadosFiscais + '('+qryProdutosNotaFiscaldadofiscal.AsString + ', ' +
                                                                         qryProdutosNotaFiscalnumeroprodutotabela.AsString + ', ' +
                                                                         qryProdutosNotaFiscalproduto.AsString +')';

        QtdeProdutos := QtdeProdutos + qryProdutosNotaFiscalQuantidade.Value;
        qryProdutosNotaFiscal.Next
      end;

    finally
      qryProdutosNotaFiscal.GotoBookmark(Pos);
      qryProdutosNotaFiscal.FreeBookmark(Pos);

      if ListaChavesProdutosPedidos='' then
        ListaChavesProdutosPedidos := '(0, 0, 0)';

      if ListaChavesProdutosDadosFiscais='' then
        ListaChavesProdutosDadosFiscais := '(0, 0, 0)';

      qryProdutosNotaFiscal.EnableControls;
      qryNotaFiscalTotalQtdeProdutos.AsCurrency := QtdeProdutos;
      qryProdutosNotaFiscal.AfterScroll := qryProdutosNotaFiscalAfterScroll;

      {ESTE NÚMERO SÓ EXISTE PELA SELEÇÃO DO PRODUTO PELA LUPA}
      qryProcuraProdutoNotaFiscal.ParamByName('numeroproduto').clear;
      DesabilitarControles(false);
    end;
  end;




end;

{
procedure TdtmCadastroNotasFiscais.AtualizarQuantidadeNaoRecebida(Incrementa: Boolean);

var
  Item: TtecQuantidadePorProdutoPedido;

begin

  Item := T_Lista.Items[qryProdutosNotaFiscalpedido.AsInteger, qryProdutosNotaFiscalproduto.AsLargeint];
  if Assigned(Item) then
    if Incrementa then
      Item.Quantidade := Item.Quantidade + qryProdutosNotaFiscalqtdeestoque.AsFloat - QtdadeAnterior
    else
    if Item.Quantidade > qryProdutosNotaFiscalqtdeestoque.AsFloat then
      Item.Quantidade := Item.Quantidade - qryProdutosNotaFiscalqtdeestoque.AsFloat
    else
      Item.Quantidade := 0
  else
  begin
    if incrementa then
      T_Lista.Add(TtecQuantidadePorProdutoPedido.Create(qryProdutosNotaFiscalpedido.AsInteger,
                                                      qryProdutosNotaFiscalproduto.AsLargeInt,
                                                      qryProdutosNotaFiscalqtdeestoque.AsFloat));
  end;

  QtdadeAnterior := 0;

end;
}


function TdtmCadastroNotasFiscais.BloquearProdutosNoEstoque: Boolean;
var
  Pos: TBookmark;
  WhereSQL: String;
begin
  Result := True;
  qryProdutosNotaFiscal.AfterScroll := nil;

  if qryProdutosNotaFiscal.Active then
  begin
    try

      Pos := qryProdutosNotaFiscal.GetBookmark;
      qryProdutosNotaFiscal.DisableControls;

      DesabilitarControles(true);

      if qryProdutosNotaFiscal.RecordCount = 0 then
        WhereSQL := 'false'
      else begin
        WhereSQL := '';
        qryProdutosNotaFiscal.First;
        while Not qryProdutosNotaFiscal.Eof do
        begin
          WhereSQL := WhereSQL +
          '((e.produto = ' + qryProdutosNotaFiscalproduto.AsString +')and' +
 //         '(e.filial = ' + qryProdutosNotaFiscalfilial.AsString + '))or';
          '(e.filial = ' + inttostr(ifthen(TipoFilial<>'V', FilialBase, FilialEstoque)) + '))or';



          if (qryProdutosNotaFiscalproduto.AsLargeInt <> qryProdutosNotaFiscalprodutoincluidooriginal.AsLargeInt) {or
             (qryProdutosNotaFiscalfilial.AsInteger  <> qryProdutosNotaFiscalfilialincluidaoriginal.AsInteger)} then  {não existe hoje troca de filial ao editar uma nf entrada}

             if not qryProdutosNotaFiscalprodutoincluidooriginal.isnull then
              WhereSQL := WhereSQL +
              '((e.produto = ' + qryProdutosNotaFiscalprodutoincluidooriginal.AsString + ')and' +
//              '(e.filial = '   + qryProdutosNotaFiscalfilialincluidaoriginal.AsString  + '))or';
              '(e.filial = '   + inttostr(ifthen(TipoFilial<>'V', FilialBase, FilialEstoque))  + '))or';

          {
          if (qryProdutosNotaFiscalproduto.AsLargeInt <> qryProdutosNotaFiscalproduto.OldValue) or
             (qryProdutosNotaFiscalfilial.AsInteger  <> qryProdutosNotaFiscalfilial.OldValue) then
             if qryProdutosNotaFiscalproduto.OldValue <> null then
              WhereSQL := WhereSQL +
              '((e.produto = ' + VarToStr(qryProdutosNotaFiscalproduto.OldValue) + ')and' +
              '(e.filial = '   + VarToStr(qryProdutosNotaFiscalfilial.OldValue)  + '))or';
          }

          qryProdutosNotaFiscal.Next
        end;
        Delete(WhereSQL, Length(WhereSQL) - 1, 2);
        qryEstoque.macrobyname('ListadeProdutoseFiliais').asString := WhereSQL;

        qryEstoque.parambyname('datalancamentonota').asDateTime := qryNotaFiscalData.asDateTime;
        qryEstoque.parambyname('codigonota').asinteger := qrynotafiscalcodigo.asinteger;
{        qryEstoque.parambyname('inclusao').asboolean := (qrynotafiscal.state = dsinsert) or (qryNotaFiscalsituacao.asString = 'P');}

        qryEstoque.close;
        qryEstoque.Open;

        qryProdutosNotaFiscal.First;
        while Not qryProdutosNotaFiscal.Eof do begin
          if Not qryEstoque.Locate('produto;filial',
                                   VarArrayOf([qryProdutosNotaFiscalproduto.AsString,
//                                               qryProdutosNotaFiscalfilial.AsInteger]), [])
                                               ifthen(TipoFilial<>'V', FilialBase, FilialEstoque)]), [])
          then begin
            Result := False;
            MensagemAviso(Format(ctPRODUTOSEMESTOQUECADASTRADO, [qryProdutosNotaFiscalproduto.AsString,
                                                                 qryProdutosNotaFiscalfilial.AsString]));
          end;
          qryProdutosNotaFiscal.Next
        end;
      end;

      {
      A tabela abaixo estava sendo usada somente para travar os produtos no estoque 'for update' ao dar o commit (perpetrar) é desbloqueado.
      Não necessária pois o comando update pode estar em qryEstoque acima aberto

      if Result then begin
        qryTravarEstoque.Sql[18] := WhereSQL;
        qryTravarEstoque.Open;
      end
      }

      if not result then
        qryEstoque.close;

    finally
      qryProdutosNotaFiscal.GotoBookmark(Pos);
      qryProdutosNotaFiscal.EnableControls;
      qryProdutosNotaFiscal.FreeBookmark(Pos);
      qryProdutosNotaFiscal.AfterScroll := qryProdutosNotaFiscalAfterScroll;

      DesabilitarControles(false);

    end;
  end;
end;




procedure TdtmCadastroNotasFiscais.RefazerNumeroProdutos;
begin
  if qryProdutosNotaFiscal.Active then
  begin
    try
      qryProdutosNotaFiscal.AfterScroll := nil;
      GuardarRegistroAtual(qryProdutosNotaFiscal,true);
      DesabilitarControles(true);
      qryProdutosNotaFiscal.SortByField('numero');
      qryProdutosNotaFiscal.First;
      while not qryProdutosNotaFiscal.Eof do
      begin
        if qryProdutosNotaFiscalnumero.AsInteger <> qryProdutosNotaFiscal.RecNo then
        begin
          qryProdutosNotaFiscal.Edit;
          qryProdutosNotaFiscalnumero.AsInteger := qryProdutosNotaFiscal.RecNo;
          PostProdutosNotaFiscal;
        end;
        qryprodutosnotafiscal.Next;
      end;
    finally
      VoltarRegistroAtual(qryProdutosNotaFiscal);
      qryProdutosNotaFiscal.AfterScroll     := qryProdutosNotaFiscalAfterScroll;
      DesabilitarControles(false);
    end;
  end;
end;

procedure TdtmCadastroNotasFiscais.CancelarDuplicatas;
begin
  if qryDuplicatas.State in [dsInsert, dsEdit] then
    qryDuplicatas.Cancel;
end;


procedure TdtmCadastroNotasFiscais.CancelarProdutosNotaFiscal;
begin
  if qryProdutosNotaFiscal.State in [dsInsert, dsEdit] then
    qryProdutosNotaFiscal.Cancel;
end;

constructor TdtmCadastroNotasFiscais.Create(AOwner: TComponent);
begin
  inherited;

  vTipoInclusaoProdutoGrade := manual;
  TotalIPI := 0;
  TotalValorIPIAlterado := false;
  tipoGrade := tpLINHA;


  qryNotaFiscal.Tag                   := ctTabelaCadastroNotaFiscal;
  qryProdutosNotaFiscal.Tag           := ctTabelaCadastroNotaFiscal;
  qryDuplicatas.Tag                   := ctTabelaCadastroNotaFiscal;
  qryDocumentoPag.Tag                 := ctTabelaCadastroNotaFiscal;
  qryConhecimentoFrete.Tag            := ctTabelaCadastroNotaFiscal;

  qryConsultaEstados.Tag              := ctTabelaConsultaEstado;
  qryConsultaNotasFiscais.Tag         := ctTabelaConsultaNotaFiscal;
  qryConsultaFornecedores.Tag         := ctTabelasConsultaFornecedores;
  qryConsultaSeriesFornecedor.Tag     := ctTabelaConsultaSerieFornecedor;
  qryConsultaSeriesFiliais.Tag        := ctTabelaConsultaSerie;
  qryConsultaFiliais.Tag              := ctTabelaConsultaFiliais;
  qryConsultaNotaFiscalProdutos.tag   := ctTabelaConsultaNotasFiscais;
  qryConsultaNaturezas.Tag            := ctTabelaNaturezaOperacoes;
  qryConsultaProdutosNotaFiscal.Tag   := ctTabelaConsultaProdutosNotafiscal;
  qryConsultaConhecimentoFrete.Tag    := ctTabelaConsultaConhecimentoFrete;
  qryConsultaFornecedorTransporte.Tag := ctTabelaConsultaFornecedoresTransp;

  qryConsultaPedidosNotaFiscal.Parambyname('filialentrega').AsInteger := FilialBase;
  qryConsultaPedidosProdutoNFE.Parambyname('filialentrega').AsInteger := FilialBase;

  qryProcuraPedidosNotaFiscal.ParamByName('filialbase').AsInteger  := FilialBase;

//  qryProcuraProdutoNotaFiscal.ParamByName('filialbase').AsInteger  := FilialBase;
//  qryProcuraProdutoNotaFiscal.ParamByName('estadofilialbase').AsString  := estadoFilialBase;


  qryConsultaProdutosNotaFiscal.ParamByName('filial').AsInteger:= FilialBase;
//  qryConsultaProdutosNotaFiscal.ParamByName('estadofilialbase').AsString:= estadoFilialBase;

  qryConsultaSeriesFornecedor.Params[2].AsInteger  := FilialBase;
  qryProcuraSeriesFornecedor.Parambyname('FilialBase').AsInteger   := FilialBase;
  qryProcuraFornecedores.Parambyname('tipo').AsString        := 'F';
  qryconsultaNotaFiscalProdutos.Params[0].value := null;
  qryconsultaNotaFiscalProdutos.Params[1].value := null;
  qryconsultaNotaFiscalProdutos.Params[0].value := null;
  qryProcuraNotaFiscalProdutos.Params[0].value := null;
  qryconsultaseriesfiliais.Params[0].value := null;
  qryProcuraSerieFiliais.Params[0].value := null;
  qryConsultaNotaFiscalProdutos.Params[1].value := null;
  qryProcuraNotaFiscalProdutos.Params[1].value := null;
  qryConsultadadosFiscais.ParamByName('Filial').AsInteger:= FilialBase;
  qryConsultadadosFiscais.ParamByName('Serie').AsString:= SerieSugestao;
  FViaPedido:= False;
  FViaNota := false;
  qryProdutosNotaFiscalquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosNotaFiscalqtdeestoque.DisplayFormat := ParSistema.MascaraQuantidadeGrade;

  qryNotaFiscalTotalQtdeProdutos.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosNotasPagNFEquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosNotasPagNFEqtdeestoque.DisplayFormat := ParSistema.MascaraQuantidadeGrade;

  qryProdutosNotasPagNFEItemsquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryProdutosNotasPagNFEItemsqtdeestoque.DisplayFormat := ParSistema.MascaraQuantidadeGrade;


  FLancamentosOK := True;
  {
  if not assigned(dtmGerarNotaFiscal) then
  begin
    dtmGerarNotaFiscal := tdtmGerarNotaFiscal.create(self);
    dtmGerarNotaFiscal.qryCalculosNotasPag.tag := ctTabelaCadastroNotaFiscal;
    dsrCalculosNotasPag.DataSet := dtmGerarNotaFiscal.qryCalculosNotasPag;
    dtmGerarNotaFiscal.CodigoFiscal := GetCodigoFiscal;
    dtmGerarNotaFiscal.CodigoNatureza := GetCodigoNatureza;
  end;
  }
  qryConsultaNaturezas.MacroByName('CodigoFiscal').AsString := '';
  FProximoNrLancto := 0;
  FImportacao := False;
  FNumeroAdicaoImportacao := 0;

  qryVenctosImpostosRetidosEntradas.tag := ctTabelas;
  qryVenctosImpostosRetidosEntradas.ParamByName('filial').AsInteger := FilialBase;

  qryProdutosNotaFiscalproduto.Required := not ParSistema.UsarGradesProdutos;

  qryNaturezasPadrao.Tag := ctTabelas;

  qryCalculosProdutos.ParamByName('SimplesNacional').AsBoolean := (RegimeTributario = 1);
  qryCalculosProdutos.ParamByName('ContribIPI').AsBoolean := contribipi;

  vLigarEventosProdutosNotasPagNFEItems := True;

  OnPerpetrar := VerificarDadosAntesGravar;
  AfterPerpetrar := VerificarDadosDepoisGravar;

{
  vListaProdutosComponentesdosCompostos := TStringList.create;
  vListaProdutosComponentesdosCompostos.Duplicates := dupIgnore;
}

// PermitirCTeDiferenteNormal := true;
end;




procedure TdtmCadastroNotasFiscais.dsrNotaFiscalDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Field = qryNotaFiscalcodigofiscal then
  begin
    if Assigned(OnChangeCodigoFiscal) then
      OnChangeCodigoFiscal(qryNotaFiscal);

    if (qryProcuraNaturezas.recordcount = 1) then
    begin
      qryNotaFiscalnatureza.AsString := qryProcuraNaturezasdescricao.AsString;
      if (not qryProcuraNaturezasgerarpagamento.AsBoolean)
         and ((qryDuplicatas.RecordCount > 0) and
              (qryNotaFiscalcodigonatureza.AsInteger <>
               qryProcuraNaturezascodigo.AsInteger)) then
      begin
        if MensagemConfirmacao(Format(ctNATUREZAEXCLUIRPAGAMENTO,[qryNotaFiscalnrdocumento.asstring]))= smbOk then
        begin
          if DuplicatasQuitadas then
          begin
             MensagemAviso(Format(ctDUPLICATASNAOEXCLUIR,[qryNotaFiscalnrdocumento.asstring]));
             SelecionarNatureza(qryNotaFiscalcodigonatureza.asinteger);
          end
          else
            LimparTabela(qryduplicatas);
        end
        else
          SelecionarNatureza(qryNotaFiscalcodigonatureza.asinteger);
      end;
      qryNotaFiscalcodigonatureza.AsInteger := qryProcuraNaturezascodigo.AsInteger;
      qryNotaFiscalrequernfsaida.AsBoolean := qryProcuraNaturezasrequernfsaida.AsBoolean;
      qryNotaFiscalnaoutilizarobsautomaticas.AsBoolean := qryProcuraNaturezasnaoutilizarobsautomaticas.AsBoolean;


      AtualizarCodigoFiscalProdutosNFE;
    end;

    qryNotaFiscalexigenotareferenciada.asboolean := exigenotareferenciada(qrynotafiscalcodigofiscal.asinteger);
  end
  else
  if field = qryNotaFiscalvalorconhecimentofrete then
  begin
    if qryNotaFiscalvalorconhecimentofrete.AsCurrency >
       qryConhecimentoFretevalorsugestaoconhecimento.AsCurrency then
    begin
       MensagemAviso(format(ctNAOULTRAPASSARVALORJAUTILIZADO,
          [qryConhecimentoFretevalorconhecimentofreteusadonanota.ascurrency,
           qryConhecimentoFretevalornota.ascurrency,
           qryConhecimentoFretevalorsugestaoconhecimento.ascurrency]));

       dsrNotaFiscal.OnDataChange := nil;
       qryNotaFiscalvalorconhecimentofrete.AsCurrency := ValorConhecimentoFrete;
       dsrNotaFiscal.OnDataChange := dsrNotaFiscalDataChange;

       ErroValorConhecimentoFrete := true;

    end
    else
    begin

      qryNotaFiscalicmsconhecimentofrete.AsCurrency := truncar(
        qryNotaFiscalvalorconhecimentofrete.AsCurrency *
        qryConhecimentoFretealiquota.AsCurrency/100, 2);

      dsrNotaFiscal.OnDataChange := nil;
      if gravarnotaparcial then
        qrynotafiscal.Edit;
      dsrNotaFiscal.OnDataChange := dsrNotaFiscalDataChange;

    end;
  end
  else
  if (field = qryNotaFiscalfreteinterno) then
  begin
//     RecalcularImpostos := true;
     CalcularImpostos(true, {false,} tpAltEsp_ValorFreteNota);
  end
  else
  if (field = qrynotafiscaldesconto)     then
  begin
//     RecalcularImpostos := true;
     CalcularImpostos(true, {false,} tpAltEsp_ValorDescontoNota);
  end
  else
  if (field = qrynotafiscaldesconto)     or
     (field = qryNotaFiscalacrescimo)    or
     (field = qryNotaFiscalfreteinterno) or
     (field = qryNotaFiscalseguro)       then
  begin
//     RecalcularImpostos := true;
     CalcularImpostos;
  end
  else

  if (Field = qryNotaFiscaldespesasacessorias) then
  begin
//     RecalcularImpostos := true;
     CalcularImpostos(true, {false,} tpAltEsp_DespesasAcessoriasNota);
  end
  else
  {
  if Field = qryNotaFiscalnDI then
    qryDadosImportacoesnumero.AsString := qryNotaFiscalnDI.AsString
  else
  }
  if Field = qryNotaFiscalserie then
  begin
    qryNotaFiscalmodelodocto.AsString := qryProcuraSeriesFornecedormodelodoctofiscal.AsString;
    qryNotaFiscalchv_nfe.ReadOnly := not EhNfeouCTE;
  end;

end;

procedure TdtmCadastroNotasFiscais.ExcluirDetalhesNotaEntrada;
var
  situacaoleituraproduto : boolean;
begin
  if qryNotaFiscalpermitirimprimir.AsBoolean then
  begin
    qryNotaFiscal.Edit;
    qryNotaFiscalsituacao.AsString := 'C';
    if qryNotaFiscalndi.AsString <> '' then
      qryNotaFiscalndi.Clear;
    qryNotaFiscal.post;

    if {((CodigoFiscal mod 1000) = ctDEVOLUCAO) and}  not  qryNotaFiscalcontrato.IsNull then
    begin

      refazconsultapornome(qryContratos, ['contrato'], [qryNotaFiscalcontrato.AsString]);

      qrycontratos.edit;
      qryContratossituacao.AsString := 'N';
      qrycontratos.post;

      qryparcelas.first;
      while not qryparcelas.Eof do
      begin
        qryparcelas.edit;
        qryParcelastipopagto.Clear;
        qryParcelasfilialpagto.clear;
        qryParcelasvalorpagto.Clear;
        qryParcelasdatapagto.Clear;
        qryparcelas.post;

        qryparcelas.Next;
      end;

      qryProdutosContratos.First;
      while not qryProdutosContratos.Eof do
      begin
        qryProdutosContratos.Edit;
        qryProdutosContratoscancelado.clear;
        qryProdutosContratos.post;

        qryProdutosContratos.Next;
      end;

      qryServicosContratos.First;
      while not qryServicosContratos.Eof do
      begin
        qryServicosContratos.Edit;
        qryServicosContratoscancelado.clear;
        qryServicosContratos.post;

        qryServicosContratos.Next;
      end;


      LimparTabela(qryContratosDevolvidos);

      RefazConsultaPorNome(qryApagarMovimentos,['codigonota'],[qryNotaFiscalcodigo.AsInteger]);
      LimparTabela(qryApagarMovimentos);

    end;
  end
  else
  begin
    while qryDuplicatas.RecordCount > 0 do
      qryDuplicatas.Delete;
{
    while dtmGerarNotaFiscal.qryCalculosNotasPag.RecordCount > 0 do
      dtmGerarNotaFiscal.qryCalculosNotasPag.Delete;
      }
    situacaoleituraproduto := qryProdutosNotaFiscal.RequestLive;
    qryProdutosNotaFiscal.RequestLive := true;
    while qryProdutosNotaFiscal.RecordCount > 0 do
      qryProdutosNotaFiscal.Delete;
    qryProdutosNotaFiscal.RequestLive := situacaoleituraproduto;


    qryNotaFiscal.Delete;
  end;

{
  while not qryProdutosImportados.Eof do
    qryProdutosImportados.Delete;

  while not qryAdicoesImportacao.Eof do
    qryAdicoesImportacao.Delete;

  while not qryDadosImportacoes.Eof do
    qryDadosImportacoes.Delete;
}

  while not qryVolumesNotasPag.Eof do
    qryVolumesNotasPag.Delete;
  while not qryLacresVolumesNotasPag.Eof do
    qryLacresVolumesNotasPag.Delete;
end;

function TdtmCadastroNotasFiscais.ExcluirDuplicataNotaFiscal: Boolean;
begin
  Result := qryDuplicatas.RecordCount > 0;
  if Result then
    if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['a DUPLICATA'])) = smbOk then begin
      qryDuplicatas.Delete;
      Result := True;
    end
    else
      Result:= False;
end;



function TdtmCadastroNotasFiscais.ExcluirNotaFiscalSaida: Boolean;
var
  Mensagem : String;
begin
  Result := False;
  if qryNotasSaidasFrete.RecordCount > 0 then
  begin
    Mensagem:= Format(ctCONFIRMEEXCLUIR, ['a NOTA DE SAÍDA']);
    Result := MensagemConfirmacao(Mensagem) = smbOK;
    if Result then
      qryNotasSaidasFrete.Delete;
  end;
end;


function TdtmCadastroNotasFiscais.ExcluirNotaFiscal: Boolean;
const
  Totalizadores: Array[1..8] of String = ('Em Estoque', 'Reservado', 'Transito', 'Demonstracao',
                                          'Conserto', 'Futuro', 'Danificada', 'Estoque Fisico');
var
  Ind, NumeroMov: Integer;
  mensagem : String;
  UsrAut: TtecUsuarios;

  function ObterAutorizacaoParaExcluir: Boolean;
  begin
    result := True;
    UsrAut := ObterAutorizacao(taLOGIN, ctEXCLUSAONOTAENTRADA, ctGERENTEESTOQUE, '');
    if Assigned(UsrAut) then
    begin
      if Not UsrAut.GerenteEstoque then
      begin
        Result := False;
        MensagemAviso(ctUSUARIOSEMPERMISSAO);
      end
    end
    else
      Result := False
  end;

begin

  vSituacaoVisualizandoProdutosdaNFE := VisualizandoProdutosdaNFE;
  VisualizandoProdutosdaNFE := false;
  try
    Result := (qryNotaFiscal.RecordCount > 0);
    if Result then
    begin
      if qryNotaFiscalpermitirimprimir.AsBoolean then
        mensagem := format(ctCONFIRMECANCELAR, ['a NOTA FISCAL'])
      else
        mensagem := format(ctCONFIRMEEXCLUIR, ['a NOTA FISCAL']);

      if  PermitirExcluirNotaFiscal and
         (MensagemConfirmacao(mensagem) = smbOk) and
         ObterAutorizacaoParaExcluir then
      begin

        try
          //Ind := ExcluirMovimentos(NumeroMov);
          SomenteLeitura := False;
          VerificarProdutosFornecedores(true, true);
          if ExcluirMovimentos then
          begin
            //if qryNotaFiscalsituacao.AsString <> 'P' then
              GravarDocumentoPag(topDELETE, true);
            ExcluirDetalhesNotaEntrada;
            result := true;
          end else begin
            ReFazConsulta(qryMovNotaFiscal, [], []);
            MensagemAviso(Format(ctNAOAPAGARNOTAENTRADA, [NumeroMov, Totalizadores[Ind]]));
            Result := False
          end
        finally
          qryMovimentos.close;
          qryMovimentos.MacroByName('SQL').AsString := ' and numero = 0 ';
  //        SomenteLeitura := True;
          SomenteLeitura := false; // True;
  //        qryDocumentoPag.Close;
        end
      end else
        Result:= False;
    end;
  finally
    VisualizandoProdutosdaNFE := vSituacaoVisualizandoProdutosdaNFE;
  end;
end;

procedure TdtmCadastroNotasFiscais.ExcluirProdutoFornecedor(Caracteristica, Fornecedor: String);
var
  Pos: TBookmark;

  function ExisteAlgumaCompradoProduto: boolean;
  begin
    RefazConsultaPorNome(qryComprasProdutos,
                         ['caracteristica','codigonota'],
                         [Caracteristica,qryNotaFiscalcodigo.AsInteger]);
    result := qryComprasProdutosnumeromovimento.AsInteger <> 0;
  end;

begin
  if qryFornecedorProduto.Active and
    (qryNotaFiscalsituacao.AsString='N') and
    (qryNotaFiscaltipofornecedor.AsString = 'F') then
  begin
    if qryFornecedorProduto.Locate('caracteristica;fornecedor', VarArrayOf([Caracteristica, Fornecedor]), []) then
    begin
      if not qryFornecedorProdutogeradocadastro.AsBoolean then
      begin

        if qryProdutosNotaFiscal.Active then
        begin

          Pos := qryProdutosNotaFiscal.GetBookmark;
          qryProdutosNotaFiscal.DisableControls;
          try
            if Not qryProdutosNotaFiscal.Locate('caracteristica', qryFornecedorProdutocaracteristica.AsString, []) then
              if not ExisteAlgumaCompradoProduto then
                qryFornecedorProduto.Delete

          finally
            qryProdutosNotaFiscal.GotoBookmark(Pos);
            qryProdutosNotaFiscal.FreeBookmark(Pos);
            qryProdutosNotaFiscal.EnableControls
          end
        end;
      end;
    end;
  end;
end;

function TdtmCadastroNotasFiscais.ExcluirProdutosNotaFiscal: Boolean;
var
  vcaracteristica, vfornecedor: String;

begin
  if dsrProdutosNotaFiscal.DataSet = qryProdutosNotaFiscal then
  begin
    Result := qryProdutosNotaFiscal.RecordCount > 0;
    if Result then
      if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o PRODUTO'])) = smbOk then
      begin
//        AtualizarQuantidadeNaoRecebida(False);
        vcaracteristica := qryProdutosNotaFiscalcaracteristica.AsString;
        vfornecedor := qryNotaFiscalfornecedor.AsString;
        qryProdutosNotaFiscal.Delete;
        ExcluirProdutoFornecedor(vcaracteristica, vfornecedor);
        AtualizaSQLProdutosExistenteNotas;
        CalcularImpostos;
//        CalcularValorTotalProdutos;
        if gravarnotaparcial then
          qrynotafiscal.Edit;

        RefazerNumeroProdutos;
        gravarnotaparcial;


        Result := True;
      end else
        Result:= False;
  end
  else
  begin
    dsrGrade.OnDataChange := nil;
    qrygrade.Edit;
    case tipoGrade of
     tpLINHA : if qryProdutosNotaFiscalvalorgrade2.AsString<>'' then
                 qryGrade.Fields[colunas.IndexOf(qryProdutosNotaFiscalvalorgrade2.AsString)+1].AsCurrency := 0
               else qryGrade.Fields[0].AsCurrency := 0;
     tpCOLUNA : if qryProdutosNotaFiscalvalorgrade1.AsString<>'' then
                  qryGrade.Fields[colunas.IndexOf(qryProdutosNotaFiscalvalorgrade1.AsString)+1].AsCurrency := 0
                else qryGrade.Fields[0].AsCurrency := 0;
    end;
    qrygrade.Post;
    qryProdutosNotaFiscal.Edit;
    qryProdutosNotaFiscalquantidade.AsFloat := 0;
//  qryProdutosNotaFiscal.DisableControls;
    PostProdutosNotaFiscal;
//  qryProdutosNotaFiscal.EnableControls;
    CalcularTotalGrade;
    dsrGrade.OnDataChange := dsrGradeDataChange;
    qrygrade.Edit;
    result := true;
  end;
end;

function TdtmCadastroNotasFiscais.ExisteConhecimentoFrete(NomeCampo: String; Value: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaConhecimentoFrete, NomeCampo, Value)
end;

function TdtmCadastroNotasFiscais.ExisteEstado(NomeCampo: String; Value: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaEstados, NomeCampo, Value)
end;

function TdtmCadastroNotasFiscais.ExisteFornecedor(NomeCampo: String; Value: Variant): Boolean;
const
  SQL = 'Where (to_ascii(%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
var
  Str: String;
begin
  if NomeCampo = 'nomecidade' then
    NomeCampo:= 'c.nome'
  else if NomeCampo = 'tipo' then
    NomeCampo := 'f.tipo'
  else if NomeCampo = 'cnpj' then
    NomeCampo := 'f.pessoanumero'
  else NomeCampo:= 'f.' + NomeCampo;
  Str := Format(SQL, [NomeCampo, ANSIUpperCase(Value), '%']);
  qryConsultaFornecedores.Sql[16]  := Str;
  qryConsultaFornecedores.Open;
  Result := qryConsultaFornecedores.RecordCount > 0
end;

function TdtmCadastroNotasFiscais.ExisteFornecedorTransporte(NomeCampo: String; Value: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaFornecedorTransporte, NomeCampo, Value)
end;

function TdtmCadastroNotasFiscais.ExisteNatureza(NomeCampo: String; Value: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaNaturezas, NomeCampo, Value)
end;

function TdtmCadastroNotasFiscais.ExisteNotaFiscal(NomeCampo: String; Value: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaNotasFiscais, NomeCampo, Value)
end;

function TdtmCadastroNotasFiscais.ExistePedidoNotaFiscal(NomeCampo: String;
  Value: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaPedidosNotaFiscal, NomeCampo, Value)
end;

function TdtmCadastroNotasFiscais.ExisteProdutoNotaFiscal(NomeCampo: String; Value: Variant): Boolean;
begin
  if NomeCampo = 'descricaoprecoproduto' then
    qryConsultaProdutosNotaFiscal.MacroByName('SQLProduto').AsString := ' and (upper(to_ascii(pr.descricao,''latin1'')) ilike upper(to_ascii(''' + ansiuppercase(Value) + '%'',''latin1'')))'
  else
  if NomeCampo = 'codigopreco' then
      qryConsultaProdutosNotaFiscal.MacroByName('SQLProduto').AsString := ' and (p.preco = ' + Value + ')'
  else
    qryConsultaProdutosNotaFiscal.MacroByName('SQLProduto').AsString := ' and (upper(to_ascii(p.' + NomeCampo + ',''latin1'')) ilike upper(to_ascii(''' + ansiuppercase(Value) + '%'',''latin1'')))';

  qryConsultaProdutosNotaFiscal.close;
  qryConsultaProdutosNotaFiscal.Open;
  Result := qryConsultaProdutosNotaFiscal.RecordCount > 0
end;

function TdtmCadastroNotasFiscais.ExisteSerieFornecedor(NomeCampo: String; Value: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaSeriesFornecedor, NomeCampo, Value)
end;

procedure TdtmCadastroNotasFiscais.FechaTabelaConsultaProdutosNotaFiscal;
begin
  Fecha(ctTabelaConsultaProdutosNotafiscal);
end;

procedure TdtmCadastroNotasFiscais.FechaTabelaProcuraNotaFiscal;
begin
  qryConsultaFornecedores.Sql[16]  := 'where false';
  Fecha(ctTabelaConsultaNotaFiscal);
  Fecha(ctTabelasConsultaFornecedores);
  Fecha(ctTabelaConsultaSerieFornecedor);
end;

procedure TdtmCadastroNotasFiscais.GerarDuplicatas(Parcelas, Intervalo: Integer; Data: TDateTime;
                                                   TipoJuros, TipoMulta: Char; ValorJuros: Currency;
                                                   ValorMulta: Currency);
var ValorDuplicata,
    TotalDuplicatas,
    ValorNota, Dif: Currency;
    I: Integer;
begin
   if Parcelas > 0 then
   begin
      ValorNota     := qryNotaFiscalvalornota.AsCurrency - ImpostosRetidos;
      ValorDuplicata:= Truncar(ValorNota / Parcelas, 2);

      while not qryDuplicatas.IsEmpty do
         qryDuplicatas.Delete;
      if qryDuplicatas.State = dsInactive then
         qryDuplicatas.Open;

      TotalDuplicatas := 0;
      qryDuplicatas.DisableControls;
      try
         for I:= 0 to Parcelas-1 do begin
             TotalDuplicatas:= TotalDuplicatas + ValorDuplicata;
             qryDuplicatas.Append;
             qryDuplicatasdatavencto.AsDateTime := SomarDia(Data,(I * Intervalo),'S');
             qryDuplicatasnumero.AsInteger      := I+1;
             qryDuplicatasvalorvencto.AsCurrency:= ValorDuplicata;
             qryDuplicatastipojuros.AsString    := TipoJuros;
             qryDuplicatastipomulta.AsString    := TipoMulta;
             qryDuplicatasjuros.AsCurrency      := ValorJuros;
             qryDuplicatasmulta.AsCurrency      := ValorMulta;
             qryDuplicatasautorizado.AsBoolean  := ParSistema.AutorizacaoPagtoAutomatica;
             qryDuplicatasdataautorizacaopagto.AsDateTime := now;
             qryDuplicatas.Post;
         end;
      finally
         qryDuplicatas.EnableControls;
      end;
      qryDuplicatas.First;

      Dif:= ValorNota - TotalDuplicatas;
      qryDuplicatas.First;
      qryDuplicatas.Edit;
      qryDuplicatasvalorvencto.AsCurrency:= qryDuplicatasvalorvencto.AsCurrency + Dif;
      qryDuplicatas.Post
   end;
end;

procedure TdtmCadastroNotasFiscais.GerarSerieFilialBase;
begin
  try
    if not qryNotaFiscalpermitirimprimir.AsBoolean then
      MensagemErro('Atenção! Entre em contato com a TECSOFT e informe que'+#13+
                   'esta sendo gerada uma nota fiscal de entrada da filial indevidamente.'+#13+
                   'Repasse os procedimentos que você adotou para digitar a nota fiscal.')
    else
    begin
      ReFazConsulta(qrySeriesFiliais, [0,1], [FilialBase, SerieSugestao]);
      qryNotaFiscalserie.AsString   := SerieSugestao;
      qryNotaFiscalmodelodocto.AsString := ModeloDoctoFiscal;
      qryNotaFiscalnrdocumento.AsInteger := qrySeriesFiliaisnumeroinicial.AsInteger;
      qrySeriesFiliais.Edit;
      qrySeriesFiliaisnumeroinicial.AsInteger := qrySeriesFiliaisnumeroinicial.AsInteger + 1;
      qrySeriesFiliais.Post;
    end;
  except
    qrySeriesFiliais.Close;
    raise
  end
end;

function TdtmCadastroNotasFiscais.GetCodigoEstadoConsultado: String;
begin
  Result := qryConsultaEstadoscodigo.AsString
end;

function TdtmCadastroNotasFiscais.GetCodigoFiscal: Integer;
begin
  Result := qryNotaFiscalcodigofiscal.AsInteger
end;

function TdtmCadastroNotasFiscais.GetCodigoFornecedorConsultado: String;
begin
  Result := qryConsultaFornecedorescodigo.AsString
end;

function TdtmCadastroNotasFiscais.GetEditandoTabelaDuplicatasNota: Boolean;
begin
  Result:= qryDuplicatas.State = dsEdit;
end;

{
function TdtmCadastroNotasFiscais.GetEditandoTabelaImpostosNota: Boolean;
begin
  Result:= dtmGerarNotaFiscal.qryCalculosNotasPag.State = dsEdit;
end;
}

function TdtmCadastroNotasFiscais.GetEditandoTabelaProdutosNota: Boolean;
begin
  Result:= qryProdutosNotaFiscal.State = dsEdit;
end;

function TdtmCadastroNotasFiscais.GetGerarDocumentoPag: Boolean;
begin
  Result := qryProcuraNaturezasgerarpagamento.AsBoolean
end;

function TdtmCadastroNotasFiscais.GetIncluindoNota: Boolean;
begin
  Result := (qryNotaFiscal.State = dsInsert) or qryNotaFiscal.IsEmpty
end;

function TdtmCadastroNotasFiscais.GetNomeFornecedor: String;
begin
  Result := qryProcuraFornecedoresnome.AsString
end;

function TdtmCadastroNotasFiscais.GetNumeroPessoa: String;
begin
  Result := qryNotaFiscalcnpj.AsString
end;

function TdtmCadastroNotasFiscais.GetSerieFornecedorConsultado: String;
begin
  Result := qryConsultaSeriesFornecedorserie.AsString
end;

function TdtmCadastroNotasFiscais.GetSomenteLeitura: Boolean;
begin
//  Result := Not qryNotaFiscal.RequestLive;
  Result := false; //Not qryNotaFiscal.RequestLive;
end;

function TdtmCadastroNotasFiscais.GetTabelaConsultaConhecimento: TZDataSet;
begin
  Result := qryConsultaConhecimentoFrete
end;

function TdtmCadastroNotasFiscais.GetTabelaConsultaEstados: TZDataset;
begin
  Result := qryConsultaEstados
end;

function TdtmCadastroNotasFiscais.GetTabelaConsultaFornecedores: TZDataSet;
begin
  Result := qryConsultaFornecedores;
end;

function TdtmCadastroNotasFiscais.GetTabelaConsultaFornecedorTransporte: TZDataset;
begin
  Result := qryConsultaFornecedorTransporte
end;


function TdtmCadastroNotasFiscais.GetTabelaConsultaNaturezaOperacao: TZDataSet;
begin
  Result := qryConsultaNaturezas
end;

function TdtmCadastroNotasFiscais.GetTabelaConsultaNotaFiscais: TZDataSet;
begin
  Result := qryConsultaNotasFiscais
end;

function TdtmCadastroNotasFiscais.GetTabelaConsultaPedidosNotaFiscal: TZDataSet;
begin
  Result := qryConsultaPedidosNotaFiscal
end;

function TdtmCadastroNotasFiscais.GetTabelaConsultaProdutosNotaFiscal: TZDataSet;
begin
  Result := qryConsultaProdutosNotaFiscal
end;

function TdtmCadastroNotasFiscais.GetTabelaConsultaSerieFornecedor: TZDataSet;
begin
  Result := qryConsultaSeriesFornecedor
end;

function TdtmCadastroNotasFiscais.GetTabelaDuplicata: TZDataSet;
begin
  Result := qryDuplicatas
end;

{
function TdtmCadastroNotasFiscais.GetTabelaImpostosNotaFiscal: TZDataSet;
begin
  Result := dtmGerarNotaFiscal.qryCalculosNotasPag
end;
}

function TdtmCadastroNotasFiscais.GetTabelaNotaFiscais: TZDataSet;
begin
  Result := qryNotaFiscal
end;

function TdtmCadastroNotasFiscais.GetTabelaNotaFiscalVazia: Boolean;
begin
  Result := qryNotaFiscal.IsEmpty
end;

function TdtmCadastroNotasFiscais.GetTabelaProdutosNotaFiscal: TZDataSet;
begin
  Result := qryProdutosNotaFiscal
end;

function TdtmCadastroNotasFiscais.GetTipoFornecedor: String;
begin
  Result := qryNotaFiscaltipofornecedor.AsString
end;

function TdtmCadastroNotasFiscais.GetTipoMovimentoNatureza: String;
begin
  Result := qryProcuraNaturezastipomovimento.AsString
end;


function TdtmCadastroNotasFiscais.ValorPagar: Currency;
var
 Multa,Juros: Currency;
 NrDias: Integer;
begin
 Multa:= 0;  Juros:= 0;
 if (DataServidor > qryDuplicatasdatavencto.AsDateTime) then begin
   NrDias:= DaysBetween(DataServidor,qryDuplicatasdatavencto.AsDateTime);
   if qryDuplicatasmulta.asCurrency > 0 then
     if (qryDuplicatastipomulta.AsString = '%') then
          Multa := ((qryDuplicatasvalorvencto.AsCurrency * qryDuplicatasmulta.asCurrency) / 100)
     else Multa := qryDuplicatasmulta.asCurrency;

   if qryDuplicatasjuros.asCurrency > 0 then
     if qryDuplicatastipojuros.AsString = '%' then
          Juros := ((qryDuplicatasvalorvencto.AsCurrency * (qryDuplicatasjuros.asCurrency * NrDias)) / 100)
     else Juros := (qryDuplicatasjuros.asCurrency * NrDias);
 end;
 Result:= qryDuplicatasvalorvencto.AsCurrency + Multa + Juros - qryDuplicatasvalordesconto.AsCurrency;
end;

function TdtmCadastroNotasFiscais.getTipoPessoa: TtecTipoPessoa;
begin
  if qryProcuraFornecedorespessoatipo.AsString = 'F' then
    Result := tsFISICA
  else if qryProcuraFornecedorespessoatipo.AsString = 'J' then
    Result := tsJURIDICA
  else
    Result := tsNENHUMA
end;


function TdtmCadastroNotasFiscais.GravarDocumentoPag(Operacao: TtecOperacao; AnularCalculoPedidos: Boolean = false): Boolean;
var
    Produto_Aberto, TemProduto_Aberto,
    Produto_Parcial,
    Produto_Concluido, TemProduto_Concluido, vDuplicatasReadOnly: Boolean;
    P, {Qtde,}
    a, Numero: Integer;
    Pos: TBookmark;
    WhereQueryPrevisoes,
    WhereQueryDuplicatas: String;


    function AlterarPrevisao(Pedido: Integer; Valor: Currency; ForcarValor: Boolean = false): boolean;
    var NrDup: Integer;
        Dif, TotDup, Prest: Currency;

        function NrDuplicatas(Documento:Integer): Integer;
        var Aux: Integer;
        begin
           Aux:= 0;
           qryPrevisaoDuplicatas.First;
           while not qryPrevisaoDuplicatas.Eof do begin
              if qryPrevisaoDuplicatasdocumentopag.AsInteger = Documento
              then Inc(Aux);
              qryPrevisaoDuplicatas.Next;
           end;
           Result:= Aux;
        end;

        {
        function TotalPedidoNotaAntesdeGravar(Pedido: integer): Currency;
        begin
          result := 0;
          if qryPedidosdaNota.Locate('pedido',Pedido,[]) then
            result := qryPedidosdaNotatotalpedidonanota.AsCurrency;
        end;
        }


    begin
       result := false;
       if qryPrevisao.Locate('pedido',Pedido,[]) then
       begin
          result := true;
          qryPrevisao.Edit;

          if ForcarValor then
            qryPrevisaovalor.AsCurrency := Valor
          else
          if AnularCalculoPedidos then
            qryPrevisaovalor.AsCurrency:= qryPrevisaovalor.AsCurrency + qryNotasPagPedidos.fieldbyname('totalpedidosdanotaoriginal').asCurrency
          else
            qryPrevisaovalor.AsCurrency:= qryPrevisaovalor.AsCurrency + qryNotasPagPedidos.fieldbyname('totalpedidosdanotaoriginal').asCurrency - valor;


          qryPrevisao.Post;

          try
             NrDup := NrDuplicatas(qryPrevisaonumero.AsInteger);
             Prest := Truncar(qryPrevisaovalor.AsCurrency / NrDup, 2);
             TotDup:= Prest * NrDup;
             Dif   := qryPrevisaovalor.AsCurrency - TotDup;

             qryPrevisaoDuplicatas.First;
             while not qryPrevisaoDuplicatas.Eof do
             begin
               if qryPrevisaoDuplicatasdocumentopag.AsInteger = qryPrevisaonumero.AsInteger then
               begin
                 qryPrevisaoDuplicatas.Edit;
                 qryPrevisaoDuplicatasvalorvencto.AsCurrency:= Prest + Dif;
                 qryPrevisaoDuplicatas.Post;
               end;
               qryPrevisaoDuplicatas.Next;
               Dif:= 0;
             end;
          finally
          end;
       end;
    end;


    procedure IncluirNovaPrevisao(Pedido: Integer; Valor: Currency);
    var Numero, NrDup, ND: Integer;
        Dif, Prest, TotDup: Currency;
    begin

       if qryPrevisao.Locate('pedido',Pedido,[]) then
         AlterarPrevisao(Pedido,Valor,true)
       else
       begin
          spcDocumentoPag.Open;
          try
             Numero:= spcDocumentoPagcodigo.AsInteger;
          finally
             spcDocumentoPag.Close
          end;

          qryPrevisao.Append;
          qryPrevisaonumero.AsInteger       := Numero;
          qryPrevisaofornecedor.AsInteger   := qryPedidosfornecedor.AsInteger;
          qryPrevisaotipofornecedor.AsString:= 'F';
          qryPrevisaoemissao.AsDateTime     := qryPedidosemissao.AsDateTime;
          qryPrevisaoDataLancto.AsDateTime  := qryPedidosemissao.AsDateTime;
          qryPrevisaofilialemissao.AsInteger:= qryPedidosfilialfatura.AsInteger;
          qryPrevisaoprevisao.AsBoolean     := True;
          qryPrevisaovalor.AsCurrency       := Valor;
          qryPrevisaopedido.AsInteger       := qryPedidosnumero.AsInteger;
          qryPrevisao.Post;

          try
             ReFazConsulta(qryPrevisoesPedidos,[0],[Pedido]);
             NrDup := qryPrevisoesPedidos.RecordCount;
             Prest := Truncar(Valor / NrDup, 2);
             TotDup:= Prest * NrDup;
             Dif   := Valor - TotDup;

             if not qryPrevisoesPedidos.IsEmpty then begin
                ND:= 1;
                qryPrevisoesPedidos.First;
                while not qryPrevisoesPedidos.Eof do begin
                   qryPrevisaoDuplicatas.Append;
                   qryPrevisaoDuplicatasdocumentopag.AsInteger:= qryPrevisaonumero.AsInteger;
                   qryPrevisaoDuplicatasnumero.AsInteger      := ND;
                   qryPrevisaoDuplicatasdatavencto.AsDateTime := qryPrevisoesPedidosdata.AsDateTime;
                   qryPrevisaoDuplicatasvalorvencto.AsCurrency:= Prest + Dif;
                   qryPrevisaoDuplicatas.Post;
                   Inc(ND);
                   qryPrevisoesPedidos.Next;
                   Dif:= 0;
                end;
             end;
          finally
          end;
       end;
    end;


    procedure ExcluirPrevisao(Pedido: Integer);
    begin
       if qryPrevisao.Locate('pedido',Pedido,[]) then
       begin
          qryPrevisaoDuplicatas.First;

          while not qryPrevisaoDuplicatas.Eof do
          begin
             if qryPrevisaoDuplicatas.Locate('documentopag', qryPrevisaonumero.AsInteger, []) then
               qryPrevisaoDuplicatas.Delete
             else
               qryPrevisaoDuplicatas.Next;
          end;

          qryPrevisao.Delete;
       end;
    end;

    procedure GravarDocumentoPag;
    var
      Pedido,
      PedidoAnt,
      c: Integer;
    begin
//       ReFazConsulta(qryDocumentoPag, [0], [qryNotaFiscaldocumentopag.AsInteger]);
       if qryDocumentoPag.isempty then
         qrydocumentopag.Append
       else
         qrydocumentopag.edit;

       qryDocumentoPagnumero.AsInteger       := qryNotaFiscaldocumentopag.AsInteger;
       qryDocumentoPagfornecedor.AsInteger   := qryNotaFiscalfornecedor.AsInteger;
       qryDocumentoPagfornecedorparaiss.AsVariant   := qryNotaFiscalfornecedorparaiss.AsVariant;
       qryDocumentoPagtipofornecedor.AsString:= qryNotaFiscaltipofornecedor.AsString;
       qryDocumentoPagprevisao.AsBoolean     := False;
       qryDocumentoPagemissao.AsDateTime     := qryNotaFiscalEmissao.AsDateTime; {era DataServidor;}
       qryDocumentoPagdatalancto.AsDateTime  := qryNotaFiscaldata.AsDateTime;
       qryDocumentoPagcomplemento.AsString   := format('%-3s',[qryNotaFiscalserie.AsString]) + '/' +
                                                  format('%6.6d',[qryNotaFiscalnrdocumento.AsInteger]);

       Pedido:=0; PedidoAnt:=0;

       if qryProdutosNotaFiscal.Active then
       begin
         GuardarRegistroAtual(qryProdutosNotaFiscal,true);
         DesabilitarControles(true);
         try

           qryProdutosNotaFiscal.First;
           while not qryProdutosNotaFiscal.Eof do
           begin
             if not qryProdutosNotaFiscalpedido.IsNull then
             begin
               Pedido := qryProdutosNotaFiscalpedido.AsInteger;
               if Pedido <> PedidoAnt then
               begin
                 PedidoAnt := Pedido;
                 Inc(c);
               end;
             end;
             qryProdutosNotaFiscal.Next;
           end;
         finally
           VoltarRegistroAtual(qryProdutosNotaFiscal);
           DesabilitarControles(false);
         end;
       end;

       if c = 1 then
         qryDocumentoPagpedido.AsInteger     := Pedido;

       if not qryNotaFiscalEvento.IsNull
       then qryDocumentoPagEvento.AsInteger:= qryNotaFiscalEvento.AsInteger;

       qryDocumentoPagfilialemissao.AsInteger:= FilialBase_Entrada;
       qryDocumentoPagfilialcontabil.AsInteger := FilialContabil_Entrada;

       qryDocumentoPagreferencia.AsString    := qryNotaFiscalreferencia.AsString;
       qryDocumentoPagvalor.AsCurrency       := qryNotaFiscalvalornota.AsCurrency;

       if not qryNotaFiscalirretido.IsNull
       then qryDocumentoPagirretido.AsCurrency := qryNotaFiscalirretido.AsCurrency;

       if not qryNotaFiscalissretido.IsNull
       then qryDocumentoPagissretido.AsCurrency := qryNotaFiscalissretido.AsCurrency;

       if not qryNotaFiscalinssretido.IsNull
       then qryDocumentoPaginssretido.AsCurrency := qryNotaFiscalinssretido.AsCurrency;

       if not qryNotaFiscalpisretido.IsNull
       then qryDocumentoPagpisretido.AsCurrency := qryNotaFiscalpisretido.AsCurrency;

       if not qryNotaFiscalcofinsretido.IsNull
       then qryDocumentoPagcofinsretido.AsCurrency := qryNotaFiscalcofinsretido.AsCurrency;

       if not qryNotaFiscalcsllretido.IsNull
       then qryDocumentoPagcsllretido.AsCurrency := qryNotaFiscalcsllretido.AsCurrency;

       if not qryNotaFiscalpiscofinscsllretido.IsNull
       then qryDocumentoPagpiscofinscsllretido.AsCurrency := qryNotaFiscalpiscofinscsllretido.AsCurrency;

    end;

    procedure GravarDuplicatas;
    var
      Write_Duplicatas : Boolean;
    begin
       Write_Duplicatas := qryDuplicatas.RequestLive;
       Pos := qryDuplicatas.GetBookmark;
       qryDuplicatas.DisableControls;
       try
          a := 1;
          if not Write_Duplicatas then
            qryDuplicatas.RequestLive := true;

          if qryDuplicatas.isempty then
          begin

             qryDuplicatas.Append;
             qryDuplicatasdocumentopag.AsInteger := qryDocumentoPagnumero.AsInteger;
             qryDuplicatasdatavencto.AsDateTime := qryNotaFiscalEmissao.AsDateTime;
             qryDuplicatasnumero.AsInteger      := 1;
             qryDuplicatasvalorvencto.AsCurrency:= qryNotaFiscalvalornota.AsCurrency;
             qryDuplicatastipojuros.AsString    := 'V';;
             qryDuplicatastipomulta.AsString    := 'V';;
             qryDuplicatasjuros.AsCurrency      := 0;
             qryDuplicatasmulta.AsCurrency      := 0;
             qryDuplicatasautorizado.AsBoolean  := ParSistema.AutorizacaoPagtoAutomatica;
             qryDuplicatasdataautorizacaopagto.AsDateTime := now;
             qryDuplicatas.Post;

          end
          else
          begin
            try
              vDuplicatasReadOnly := qryDuplicatas.readonly;

              qryDuplicatas.First;
              while not qryDuplicatas.Eof do
              begin
                 qryDuplicatas.Edit;
                 qryDuplicatasdocumentopag.AsInteger := qryDocumentoPagnumero.AsInteger;
                 qryDuplicatasnumero.AsInteger       := a;
                 {Refazer os lançamentos contábeis com a nova contrapartida(excluir e incluir)}
                 if Assigned(dtmLancamentoContabilidade) then
                   if FContrapartidaAlterada then
                     if not qryDuplicatasdatapagto.IsNull then
                     begin
                       qryDuplicatasauxdatapagto.AsDateTime := qryDuplicatasdatapagto.AsDateTime;
                       qryDuplicatasdatapagto.Clear;
                     end;
                 qryDuplicatas.Next;
                 Inc(a);
              end;
            finally
             qryDuplicatas.readonly := vDuplicatasReadOnly;
            end;

          end;

       finally
          qryDuplicatas.GotoBookmark(Pos);
          qryDuplicatas.FreeBookmark(Pos);
          qryDuplicatas.EnableControls;
          qryDuplicatas.RequestLive := Write_Duplicatas;
       end;
    end;

    procedure AtualizarQuantidadeProdutosNotasPagPedidos;
    begin
      if qryProdutosNotasPagPedidos.locate('pedido;produto;numeroprodutotabela',
        VarArrayOf([qryProdutosNotaFiscalpedido.asinteger,
                    qryProdutosNotaFiscalproduto.asString,
                    qryProdutosNotaFiscalnumeroprodutotabela.asinteger]), []) then
        qryProdutosNotasPagPedidos.edit
      else
        qryProdutosNotasPagPedidos.append;

      qryProdutosNotasPagPedidos.fieldbyname('pedido').asInteger := qryProdutosNotaFiscalpedido.asInteger;
      qryProdutosNotasPagPedidos.fieldbyname('produto').asString := qryProdutosNotaFiscalProduto.asString;
      qryProdutosNotasPagPedidos.fieldbyname('numeroprodutotabela').asInteger := qryProdutosNotaFiscalNumeroProdutoTabela.asInteger;
//    qryProdutosNotasPagPedidosquantidadenforiginal.asFloat := MANTER O VALOR ORIGINAL;
      qryProdutosNotasPagPedidos.fieldbyname('quantidadenfatual').asFloat := qryProdutosNotasPagPedidos.fieldbyname('quantidadenfatual').asFloat + qryProdutosNotaFiscalqtdeestoque.asFloat;
      qryProdutosNotasPagPedidos.fieldbyname('verificado').asBoolean := True;

      qryProdutosNotasPagPedidos.post;
    end;

    procedure AtualizarTotaisNotasPagPedidos;
    begin
      if qryNotasPagPedidos.locate('pedido', qryProdutosNotaFiscalpedido.asinteger, []) then
        qryNotasPagPedidos.edit
      else
        qryNotasPagPedidos.append;

      qryNotasPagPedidos.fieldbyname('pedido').asInteger := qryProdutosNotaFiscalpedido.asInteger;
      qryNotasPagPedidos.fieldbyname('totalpedidosdanotaatual').asFloat := qryNotasPagPedidos.fieldbyname('totalpedidosdanotaatual').asFloat +
                            RoundTo((qryProdutosNotaFiscalquantidade.AsFloat  *
                                     qryProdutosNotaFiscalprecounitario.asFloat) + qryProdutosNotaFiscalvaloripi.asCurrency, -2);

      qryNotasPagPedidos.fieldbyname('verificado').asBoolean := True;

      qryNotasPagPedidos.post;

    end;


begin

{  Qtde:= 0;}


  if not AnularCalculoPedidos then  {Esta codição ocorre quando for foita uma exclusão/cancelamento de nota de entrada}
  begin

    qryProdutosNotaFiscal.AfterScroll := nil;
    qryProdutosNotaFiscal.DisableControls;

    try

      Pos := qryProdutosNotaFiscal.GetBookmark;
      qryProdutosNotaFiscal.First;
      DesabilitarControles(true);

      while not qryProdutosNotaFiscal.Eof do
      begin

        if qryProdutosNotaFiscalpedido.AsInteger <> 0 then
        begin

          AtualizarQuantidadeProdutosNotasPagPedidos;
          AtualizarTotaisNotasPagPedidos;

        end;
        qryProdutosNotaFiscal.Next;
      end;

    finally
      qryProdutosNotaFiscal.EnableControls;
      qryProdutosNotaFiscal.AfterScroll := qryProdutosNotaFiscalAfterScroll;
      qryProdutosNotaFiscal.GotoBookmark(Pos);
      qryProdutosNotaFiscal.FreeBookmark(Pos);
      DesabilitarControles(false);
    end;

  end
  else
  begin
    RefazConsultaPorNome(qryProdutosNotasPagPedidos, ['codigonota'],[qryNotaFiscalcodigo.AsInteger]);
    RefazConsultaPorNome(qryNotasPagPedidos, ['codigonota'],[qryNotaFiscalcodigo.AsInteger]);
  end;

  WhereQueryPrevisoes := RetornarLista(qryNotasPagPedidos, qryNotasPagPedidos.fieldbyname('pedido'));
//  Delete(WhereQueryPrevisoes,Length(WhereQueryPrevisoes),1);
  if WhereQueryPrevisoes = ''
  then WhereQueryPrevisoes:= '0';

  { Abrir os documentospag de previsão que não estão relacionados a nota fiscal }
  qryPrevisao.Close;
  qryPrevisao.MacroByName('WherePedidos').AsString:= 'and (pedido in (' + WhereQueryPrevisoes + '))';
  qryPrevisao.Open;

  qryPrevisao.First;
  while not qryPrevisao.Eof do
  begin
    WhereQueryDuplicatas:= WhereQueryDuplicatas + qryPrevisaonumero.AsString + ',';
    qryPrevisao.Next;
  end;
  Delete(WhereQueryDuplicatas,Length(WhereQueryDuplicatas),1);

  if WhereQueryDuplicatas = ''
  then WhereQueryDuplicatas:= '0';

  qryPrevisaoDuplicatas.Sql[12]:= 'Where (d.documentopag in (' + WhereQueryDuplicatas + '))';
  qryPrevisaoDuplicatas.Open;

  qryPedidos.close;
  qryPedidos.MacroByName('NumeroPedido').AsString:= 'Where (numero in (' + WhereQueryPrevisoes + '))';
  qryPedidos.Open;

  qryProdutosPedidos.close;
  qryProdutosPedidos.parambyname('codigonota').asinteger := qryNotaFiscalcodigo.AsInteger;
  qryProdutosPedidos.MacroByName('NumeroPedido').AsString:= WhereQueryPrevisoes;
  qryProdutosPedidos.open;

  qryNotasPagPedidos.first;
  while not qryNotasPagPedidos.eof do
  begin

    Produto_Aberto       := False;
    TemProduto_Aberto    := False;
    Produto_Parcial      := False;
    TemProduto_Concluido := False;
    Produto_Concluido := False;

    qryProdutosPedidos.first;
    qryprodutospedidos.locate('pedido', qryNotasPagPedidos.fieldbyname('pedido').asinteger,[]);

    while (qryprodutospedidos.fieldbyname('pedido').asinteger = qryNotasPagPedidos.fieldbyname('pedido').asinteger) and not qryprodutospedidos.eof do
    begin

      if AnularCalculoPedidos then
      begin

        Produto_Parcial := (qryProdutosPedidos.fieldbyname('qtderecebida').asFloat < qryProdutosPedidos.fieldbyname('quantidade').asFloat) and
                           (qryProdutosPedidos.fieldbyname('qtderecebida').asFloat <> 0);

        Produto_Aberto := (qryProdutosPedidos.FieldbyName('qtderecebida').asFloat < qryProdutosPedidos.FieldbyName('quantidade').asFloat) and
                          (qryProdutosPedidos.FieldbyName('qtderecebida').asFloat = 0);

        TemProduto_Aberto := TemProduto_Aberto or Produto_Aberto;

        Produto_Concluido := qryProdutosPedidos.FieldbyName('qtderecebida').asFloat >= qryProdutosPedidos.FieldbyName('quantidade').asFloat;

        TemProduto_Concluido := TemProduto_Concluido or Produto_Concluido;

      end
      else
      begin
        if qryProdutosNotasPagPedidos.locate('pedido;produto;numeroprodutotabela',
          VarArrayOf([qryProdutosPedidos.FieldbyName('pedido').asinteger,
                      qryProdutosPedidos.FieldbyName('produto').asString,
                      qryProdutosPedidos.FieldbyName('numero').asinteger]), []) then
        begin

          Produto_Parcial := ((qryProdutosPedidos.FieldbyName('qtderecebida').asFloat + qryProdutosNotasPagPedidos.fieldbyname('quantidadenfatual').asFloat) < qryProdutosPedidos.FieldbyName('quantidade').asFloat) and
                     ((qryProdutosPedidos.FieldbyName('qtderecebida').asFloat + qryProdutosNotasPagPedidos.fieldbyname('quantidadenfatual').asFloat) <> 0);

          Produto_Aberto := ((qryProdutosPedidos.FieldbyName('qtderecebida').asFloat + qryProdutosNotasPagPedidos.fieldbyname('quantidadenfatual').asFloat) < qryProdutosPedidos.FieldbyName('quantidade').asFloat) and
                     ((qryProdutosPedidos.FieldbyName('qtderecebida').asFloat + qryProdutosNotasPagPedidos.fieldbyname('quantidadenfatual').asFloat) = 0);
          TemProduto_Aberto := TemProduto_Aberto or Produto_Aberto;

          Produto_Concluido := (qryProdutosPedidos.FieldbyName('qtderecebida').asFloat + qryProdutosNotasPagPedidos.fieldbyname('quantidadenfatual').asFloat) >= qryProdutosPedidos.FieldbyName('quantidade').asFloat;
          TemProduto_Concluido := TemProduto_Concluido or Produto_Concluido;


        end
        else
        begin
          Produto_Parcial := (qryProdutosPedidos.FieldbyName('qtderecebida').asFloat < qryProdutosPedidos.FieldbyName('quantidade').asFloat) and
                             (qryProdutosPedidos.FieldbyName('qtderecebida').asFloat <> 0);

          Produto_Aberto := (qryProdutosPedidos.FieldbyName('qtderecebida').asFloat < qryProdutosPedidos.FieldbyName('quantidade').asFloat) and
                            (qryProdutosPedidos.FieldbyName('qtderecebida').asFloat = 0);

          TemProduto_Aberto := TemProduto_Aberto or Produto_Aberto;

          Produto_Concluido := qryProdutosPedidos.FieldbyName('qtderecebida').asFloat >= qryProdutosPedidos.FieldbyName('quantidade').asFloat;
          TemProduto_Concluido := TemProduto_Concluido or Produto_Concluido;

        end;
      end;

      if Produto_Parcial or (TemProduto_Aberto and TemProduto_Concluido) then
         break;

      qryProdutosPedidos.next;
    end;


    if qryPedidos.Locate('numero',qryNotasPagPedidos.fieldbyname('pedido').asinteger,[]) then
    begin

      if Produto_Parcial or (TemProduto_Aberto and TemProduto_Concluido) then
      begin
        qryPedidos.Edit;
        qryPedidossituacao.AsString:= 'P';
        qryPedidosconcluido.clear;
        qryPedidos.Post;
        if not AlterarPrevisao(qryNotasPagPedidos.fieldbyname('pedido').asinteger, qryNotasPagPedidos.fieldbyname('totalpedidosdanotaatual').asCurrency) then
          IncluirNovaPrevisao(qryNotasPagPedidos.fieldbyname('pedido').asinteger,(qryPedidostotalpedido.AsCurrency - qryNotasPagPedidos.fieldbyname('totalpedidosdanotaatual').asCurrency));
      end
      else
      if Produto_Concluido then
      begin
        qryPedidos.Edit;
        qryPedidossituacao.AsString   := 'L';
        qryPedidosconcluido.AsDateTime:= DataServidor;
        qryPedidos.Post;
        ExcluirPrevisao(qryNotasPagPedidos.fieldbyname('pedido').asinteger);
      end
      else
      if Produto_Aberto then
      begin
        qryPedidos.Edit;
        qryPedidossituacao.AsString:= 'A';
        qryPedidosconcluido.clear;
        qryPedidos.Post;
        IncluirNovaPrevisao(qryNotasPagPedidos.fieldbyname('pedido').asinteger,qryPedidostotalpedido.AsCurrency);
      end;
    end;

    qryNotasPagPedidos.next;

  end;

  if CondicaoIncluirDuplicatasCTe then
  begin

    case operacao of
    topDELETE : begin
  //                ReFazConsulta(qryDocumentoPag, [0], [qryNotaFiscaldocumentopag.AsInteger]);
                  if not qryDocumentoPag.IsEmpty then
                  begin
                     ReFazConsulta(qryDuplicatas,[0],[qryDocumentoPagnumero.AsInteger]);
                     if not qryDuplicatas.IsEmpty then begin
                        while not qryDuplicatas.Eof do
                           qryDuplicatas.Delete;
                     end;
                     qryNotaFiscaldocumentopag.Clear;
  //                   ReFazConsulta(qryLancamentos,[0],[qryDocumentoPagnumero.AsVariant]);
  //                   ApagarLancamentos;
                     qryDocumentoPag.Delete;
                  end;
                end;

    topINSERT : begin
                   spcDocumentoPag.Open;
                   try
                      Numero := spcDocumentoPagcodigo.AsInteger;
                   finally
                      spcDocumentoPag.Close
                   end;
                   qryNotaFiscaldocumentopag.AsInteger   := Numero;

                   GravarDocumentoPag;
                   GravarDuplicatas;
                 end;

     topUPDATE : begin
                   GravarDocumentoPag;
                   GravarDuplicatas;
                 end;
    end;
  end;

  Result:= True;
end;


function TdtmCadastroNotasFiscais.GravarDuplicataNotaFiscal: Boolean;
begin
  if qryDuplicatas.State in [dsEdit, dsInsert] then begin
    if qryDuplicatas.CheckRequiredFields then begin
       if ParSistema.AutorizacaoPagtoAutomatica then
          qryDuplicatasautorizado.AsBoolean:= True
       else
          qryDuplicatasautorizado.AsBoolean:= False;

      qryDuplicatas.Post;
      Result := True;
    end else
      Result:= False;
  end else
    Result:= False;
end;


function TdtmCadastroNotasFiscais.GravarNotaFiscal(Var Erro: Integer): Boolean;
var
  ErroDuplicata: TtecErroDuplicatas;
  UsrAut: TtecUsuarios;
  DocumentopagExcluido : Boolean;
  Totalsomatorio, TotalNota, Diferenca: Currency;
  Write_Duplicatas: Boolean;
  vAtualizarIPINCMProdutos : Boolean;
  vmsgnfe: Boolean;

{  vEstaIncluindo  : boolean;}

  procedure PreencherChavePrimaria;
  var
    Pos: TBookmark;
  begin

    if not SomenteLeituraProdutos then
    begin

      if IncluidoViaXml or IncluindoViaXml then
      begin

      end
      else
      begin
        ReFazConsulta(qryProdutosNotasPagNFE, [0], [0]);
        ReFazConsulta(qryProdutosNotasPagNFELotes, [0], [0]);
        ReFazConsulta(qryProdutosNotasPagNFEItems, [0], [0]);
        ReFazConsulta(qryProdutosNotasPagNFEItemsSituacao, [0], [0]);
      end;
    end;



    if IncluindoViaXml or IncluidoViaXml then
    begin

    end
    else
      RefazConsultaPorNome(qryPedidosNotasPag, ['codigonota'],[0]);


  end;

  function EmitirNFe(Validando: Boolean = False): Boolean;
  var
    ChaveAcesso,
    LoteNFE,
    {ReciboNFE,}
    ProtocoloNFE, status, DataHoraProcessamento: String;
//    NFe: TTecNotaFiscalEletronica;
  begin
    qryNotaFiscal.Edit;
    // NF ELETRÔNICA
    qryNotaFiscalversaolayout.AsCurrency := 3.10;
    if qryNotaFiscalmodelodocto.IsNull then
      qryNotaFiscalmodelodocto.AsString    := '55';
    qryNotaFiscalcodaleatorio.AsInteger  := Aleatorio(qryNotaFiscaldata.AsDateTime, qryNotaFiscalnrdocumento.Asstring);
    { 0 – pagamento à vista   1 – pagamento à prazo     2 - outros }
    qryNotaFiscalformapagto.AsInteger    := 2;
    { 1-Retrato/ 2-Paisagem }
    qryNotaFiscalformatodanfe.AsInteger  := 1;
    {1-Normal/ 2-Contingência}
    qryNotaFiscalformaemissao.AsInteger  := NFeTipoEmissao;

    ChaveAcesso :=
               copy(CodigoCidadeIBGEFilialBase,1,2)+                            // 2
               FormatDateTime('YYMM',qryNotaFiscaldata.AsDateTime)+             // 4
               preencheString(CNPJFilialBase,'0',14,false)+                     // 14
               preencheString(qryNotaFiscalmodelodocto.AsString,'0',2,false)+   // 2
               preencheString(SerieSugestao,'0',3,false)+                       // 3
               preencheString(qryNotaFiscalnrdocumento.Asstring,'0',9,false) +       // 9
               qryNotaFiscalformaemissao.AsString + //1
               preencheString(qryNotaFiscalcodaleatorio.Asstring,'0',8,false);  // 8

    qryNotaFiscaldigchaveacesso.AsString  := Modulo11(ChaveAcesso);
    qryNotaFiscalchv_nfe.AsString  := ChaveAcesso+qryNotaFiscaldigchaveacesso.AsString;


    {1 - PRODUÇÃO 2 - HOMOLOGAÇÃO}
    qryNotaFiscalambiente.AsInteger       := NFeAmbiente;// '2';

    {1 - normal 2 - compelementar}
//    qryNotaFiscalfinalidadenf.AsInteger   := 1;

    qryNotaFiscalprocemissao.AsString     := '0';
    qryNotaFiscalversaoteclux.AsString    := VersaoTecLUX;
    qryNotaFiscalinfcomplementar.AsString := qryNotaFiscalobservacoes.AsString;


    if not Validando then
    begin
      qryNotaFiscal.Post;
      Result := Perpetrar([qryNotaFiscal]);
    end
    else
      Result := True;

    if Result then
    begin
      if Validando then
        NFe := TTecNotaFiscalEletronica.Create(dtmTecSoft.Database)
      else
        NFe := TTecNotaFiscalEletronica.Create;


        {
      NFe.DiretorioEnvio       := NFeDirEnvio;
      NFe.DiretorioEnviado     := NFeDirEnviados;
      NFe.DiretorioRetorno     := NFeDirRetorno;
      NFe.DiretorioCompartilha := NfeDirCompartilha;
      NFe.Executavel           := NFeExecNFe;
      }
      try
        if not Validando then
        begin
          ShowProcessando('Gerando o arquivo da NF-e!');
          Sleep(500);
        end;
        // EMITENTE
        NFe.Emit_Documento := CNPJFilialBase;
        NFe.Emit_Nome      := RazaoFilialBase;
        NFe.Emit_Rua       := RuaSemNumeroFilialBase;
        NFe.Emit_Nro       := NumeroFilialBase;
        NFe.Emit_Compl     := ComplementoFilialBase;
        NFe.Emit_Bairro    := BairroFilialBase;
        NFe.Emit_CodMun    := CodigoCidadeIBGEFilialBase;
        NFe.Emit_Mun       := CidadeFilialBase;
        NFe.Emit_UF        := EstadoFilialBase;
        NFe.Emit_CEP       := CEPFilialBase;
    //    NFe.Emit_CodPais   := 1058;
    //    NFe.Emit_Pais      := 'Brasil';
        NFe.Emit_Fone      := DDDFilialBase+FoneFilialBase;
        NFe.Emit_IE        := InscricaoEstadualFilialBase;
    //    NFe.Emit_IEST      := '';
        NFe.Emit_IM        := InscricaoMunicipalFilialBase;
        NFe.Emit_CNAE      := CNAEFiscalFilialBase;
        NFE.Emit_CRT       := qryNotaFiscalregimetributario.AsInteger;

        NFe.Dest_TipoPessoa :=qryProcuraFornecedorespessoatipo.AsString;
        NFe.Dest_Documento := qryNotaFiscalcnpj.AsString;
        NFe.Dest_Nome      := qryNotaFiscalnome.AsString;
        NFe.Dest_Rua       := qryNotaFiscalrua.AsString;
        NFe.Dest_Nro       := qryNotaFiscalendnumero.AsString;
        NFe.Dest_Compl     := qryNotaFiscalendcomplemento.AsString;
        NFe.Dest_Bairro    := qryNotaFiscalnomebairro.AsString;
        NFe.Dest_CodMun    := qryNotaFiscalcidadeibge.AsString;
        NFe.Dest_Mun       := qryNotaFiscalnomecidade.AsString;
        NFe.Dest_UF        := qryNotaFiscalestado.AsString;
        NFe.Dest_CEP       := qryNotaFiscalcep.AsString;
        NFe.Dest_CodPais   := qryNotaFiscalpais.AsInteger;
        NFe.Dest_Pais      := qryNotaFiscalnomepais.AsString;
        NFe.Dest_Fone      := qryNotaFiscalfoneddd.AsString+qryNotaFiscalfonenumero.AsString;
        NFe.Dest_IE        := qryNotaFiscalinscricaoestadual.AsString;
//        NFe.Dest_ISUF      := qryNotaFiscaliesubsttributario.AsString;
        NFe.Dest_ISUF      := qryNotaFiscalsuframa.AsString;


        nfe.Validando := Validando;

        Result := NFe.GerarNFe(qryNotaFiscal, qryDadosFiscaisRef,qryProdutosNotaFiscal,nil,nil,
                       qryDuplicatas,qryVolumesNotasPag,qryLacresVolumesNotasPag,
                       qryDadosImportacoes,qryAdicoesImportacao,SerieSugestao,
                       'E', nil);

        if Result and not Validando then
        begin
          if NFeTipoEmissao in [1,3] then
          begin
            ShowProcessando;
            ShowProcessando('Verificando status do serviço NF-e!');
            Sleep(500);
            if NFe.VerificarStatusServico(IntToStr(NFeAmbiente)) then
            begin
              ShowProcessando;
              ShowProcessando('Processando o arquivo de envio da NF-e!');
              Sleep(500);
              Result := NFe.EnviarNFe(ChaveAcesso+qryNotaFiscaldigchaveacesso.AsString,
                 LoteNFe, {ReciboNFe,} ProtocoloNFe, status, DataHoraProcessamento);

              if Result then
              begin
                qryNotaFiscal.Edit;
                qryNotaFiscalnumlotenfe.AsString   := LoteNFe;
                {
                qryNotaFiscalnumrecibonfe.AsString := ReciboNFe;
                qryNotaFiscal.Post;
                Result := Perpetrar([qryNotaFiscal]);
                if Result then
                begin
                  ShowProcessando;
                  ShowProcessando('Consultando o arquivo de retorno da NF-e!');
                  Sleep(500);
                  Result := NFe.ConsultarSituacaoLote(ReciboNFe, ProtocoloNFe, status, DataHoraProcessamento, IntToStr(NFeAmbiente));
                end;

                if Result then
                begin
                  qryNotaFiscal.Edit;
                  }

                  qryNotaFiscalnumprotocolonfe.AsString := ProtocoloNFe;
                  qryNotaFiscalstatusnfe.AsString := status;
                  qryNotaFiscaldhprocnfe.AsDateTime :=  FormatarTimeStamp(DataHoraProcessamento);
                  qryNotaFiscal.Post;
                  if (qryNotaFiscalstatusnfe.AsString = '301') or
                     (qryNotaFiscalstatusnfe.AsString = '302') then
                  begin
                    qryNotaFiscal.Edit;
                    qryNotaFiscalsituacao.AsString := 'D';
                    qryNotaFiscal.Post;
                    EliminarMovimentos;
                    LimparTabela(qryDuplicatas);
                    Result := Perpetrar([qryNotaFiscal, qryDuplicatas, qryMovimentos]);
                    MensagemAviso('Nota fiscal em uso denegado.');
                  end
                  else
                  begin

                    Result := Perpetrar([qryNotaFiscal]);

                    if Result then
                    begin
                      ShowProcessando;
                      ShowProcessando('Gerando o arquivo de compartilhamento da NF-e!');
                      Sleep(500);
                      Result := NFe.CompartilharXML(ChaveAcesso+qryNotaFiscaldigchaveacesso.AsString,
                                                    {ReciboNFe,} qryNotaFiscalfilial.AsString,
                                                    SerieSugestao, qryNotaFiscalnrdocumento.AsString,
                                                    qryNotaFiscalemissao.AsDateTime, qryNotaFiscalnumlotenfe.AsString);
                      if Result then
                      begin
                        SalvarConteudoxml('E', qryNotaFiscalcodigo.asString);

                        ShowProcessando;
                        ShowProcessando('Imprimindo o DANFE!');
                        NFe.ImprimirDanfe({ChaveAcesso+qryNotaFiscaldigchaveacesso.AsString,}
                                          qryNotaFiscalfilial.AsString,
                                          qryNotaFiscalserie.AsString,
                                          qryNotaFiscalnrdocumento.AsString,
                                          qryNotaFiscallocalentrega_cep.AsString,
                                          '',
                                          IntToStr(NFeNVias), NFeLogotipoDANFE,

                                          ParSistema.NomeImpressoraNotaMercadorias,

                                          NFeVisualizarDANFE,
                                          qryNotaFiscalemissao.AsDateTime,
                                          qryProdutosNotaFiscal,
                                          NFeExecDANFE, Enviar, 'E');
                        ShowProcessando;


                        if (qryProcuraFornecedoresemail.AsString <> '')      and
                           (UsuarioLogin.PortaSmtp        <> '')      and
                           (UsuarioLogin.HostSmtp         <> '')      and
                           (UsuarioLogin.Email            <> '')      and
                           (UsuarioLogin.SenhaEmail       <> '')      and
                           EmailValido(qryProcuraFornecedoresemail.AsString, false) then
                        begin
                          ShowProcessando('Enviando email para o cliente');
                          try
                            if not NFe.EnviarEmail(UsuarioLogin.Email,qryProcuraFornecedoresemail.AsString,
                                                qryNotaFiscalnrdocumento.AsString, qryNotaFiscalserie.AsString, IntToStr(fFilialBase),
                                                '',
                                                fNomeFilialBase, fRazaoFilialBase, fCNPJFilialBase, fDDDFilialBase, fFoneFilialBase,
                                                fDDDFaxFilialBase, fFaxFilialBase, UsuarioLogin.NomeUsuario, UsuarioLogin.PortaSMTP,
                                                UsuarioLogin.HostSMTP, UsuarioLogin.UsuarioEmail, UsuarioLogin.SenhaEmail,
                                                qryNotaFiscalemissao.AsDateTime, qryNotaFiscalvalornota.AsCurrency,
                                                UsuarioLogin.AutenticarSMTP, qryNotaFiscalemissao.AsDateTime) then
                                  MensagemAviso('Ocorreu um erro inesperado no envio do email')
                          finally
                                ShowProcessando;
                          end;
                        end;

                      end
                      else
                        ShowProcessando;
                    end;

                  end;
                  {
                end
                else
                  ShowProcessando;
                  }
              end
              else
                ShowProcessando;
            end
            else
              ShowProcessando;
          end
          else
          begin
            if not NFeVisualizarDANFE then
              MensagemAviso('Impressão da Nota Fiscal será iniciada.');
            NFe.ImprimirDanfe({ChaveAcesso+qryNotaFiscaldigchaveacesso.AsString,}
                              qryNotaFiscalfilial.AsString,
                              qryNotaFiscalserie.AsString,
                              qryNotaFiscalnrdocumento.AsString,
                              qryNotaFiscallocalentrega_cep.AsString,
                              '',
                              IntToStr(NFeNVias), NFeLogotipoDANFE,
                              ParSistema.NomeImpressoraNotaMercadorias, NFeVisualizarDANFE,
                              qryNotaFiscalemissao.AsDateTime,qryProdutosNotaFiscal,
                              NFeExecDANFE, Enviar, 'E');
          end;
        end;

      finally
        FreeAndNil(NFe);
      end;
    end;
  end;

  function VerificarFornecedorparaISS: Boolean;
  begin
    result := true;
    if ParSistema.GeracaoAutomaticadoImpostoRetido then
    begin
      if qryNotaFiscalissretido.AsCurrency <> 0 then
      begin
        qryVenctosImpostosRetidosEntradas.First;
        if (qryVenctosImpostosRetidosEntradas.Locate('descricao','ISS retido',[])) and
           qryVenctosImpostosRetidosEntradasfornecedor.IsNull and
           not qryDocumentoPagfornecedorparaiss.IsNull then
        begin
          qryVenctosImpostosRetidosEntradas.Edit;
          qryVenctosImpostosRetidosEntradasfornecedor.AsVariant := qryDocumentoPagfornecedorparaiss.AsVariant;
          qryVenctosImpostosRetidosEntradastipofornecedor.AsString := 'F';
          qryVenctosImpostosRetidosEntradas.post;
          result := true;
        end
        else
        if not qryVenctosImpostosRetidosEntradasfornecedor.IsNull then
          result := true
        else
          result := false;
      end;
    end;
  end;

begin
  vAtualizarIPINCMProdutos := False;
  vSituacaoVisualizandoProdutosdaNFE := VisualizandoProdutosdaNFE;
  vSituacaoVisualizarDetalhesProdutosNota := VisualizarDetalhesProdutosNota;

  VisualizandoProdutosdaNFE := false;
  VisualizarDetalhesProdutosNota := false;

  try
    result := IncluirProdutosDoPedidodaNFE(False, True);
    if result then
    begin
      RefazerNumeroProdutos;
      if GerarDocumentoPag and
        (ParSistema.InicioIntegracaoBancos > strtodate('01/01/1980')) and
        (ParSistema.InicioIntegracaoBancos <= qryNotaFiscaldata.AsDateTime) then
        qryNotaFiscalEvento.Required := true
      else
        qryNotaFiscalEvento.Required := false;

      if not NotaReferenciada then
      begin
        refazconsultapornome(qryDadosFiscaisRef, ['filial','serie','numero'],
        [0, '',0]);
        LimparDadosNotaReferenciada;
      end
      else
        result := qryDadosFiscaisRef.CheckRequiredFields(false, True);

      if result then
      begin

        if qryNotaFiscal.CheckRequiredFields and
           qrydadosimportacoes.CheckRequiredFields then
        begin
          if qryNotaFiscaldata.AsDateTime <= ParSistema.DataContabil then
          begin
            MensagemAviso(ctERRONOTAFISCALDATALANCAMENTOMENORDATACONTABIL);
            Result := False
          end
          else
          if qryNotaFiscalemissao.AsDateTime > qryNotaFiscaldata.AsDateTime then
          begin
            MensagemAviso(ctERRONOTAFISCALDATAEMISSAOMAIORLANCAMENTO);
            Result := False
          end
          else
          if ((CodigoFiscal mod 1000) = cfSERVICOTRANSPORTE) and
             ((qryNotaFiscaltipofornecedor.AsString <> 'F') or
              ((qryNotaFiscaltipofornecedor.AsString = 'F') and
               (not qryProcuraFornecedorestipofornecimento_t.AsBoolean))) then
          begin
            MensagemAviso(ctCONHECIMENTOFRETEFORNECEDOR);
            Result := False
          end
          else
          begin
            result := TodosProdutosNFEValidos(true);
            vmsgnfe := true;

            if result then
            begin
              result := TodosProdutosNotasPagValidos;
              vmsgnfe := false;
            end;


//            if result then
//              result := ValidarQuantidadeLotes;

            if result then
            begin

              result := ValidarValoresDigitados;

1
              if not result and qryProcuraNaturezasdiferenciada.AsBoolean then
                Result := MensagemConfirmacao('Esta é uma nota fiscal diferenciada. Deseja continuar a gravação dos dados?' ) = smbOK;
            end
            else
            begin
              if vmsgnfe then
                MensagemErro('Existem ítens da NFe que estão com erros.')
              else
                MensagemErro('Existem ítens de NotasPag que estão com erros.');
            end
          end;

      {Este Bloco esta na função ValidarValoresDigitados
          begin

            Diferenca := abs(((qryNotaFiscaltotalprodutos.AsCurrency +
                               qryNotaFiscalvaloricmssubstituicao.AsCurrency +
                               qryNotaFiscalfreteinterno.AsCurrency +
                               qryNotaFiscalseguro.AsCurrency +
                               qryNotaFiscaldespesasacessorias.AsCurrency +
                               qryNotaFiscalvaloripi.AsCurrency +
                               ifthen(FImportacao,qryNotaFiscalvaloricms.AsCurrency,0)) -
                               qryNotaFiscalvalornota.AsCurrency));
      }

      // Garantir que não deixe que passe pela validação cfe bug. 2788
      // onde não se conseguiu simular o total de produtos maior que a nota
      //      if (TipoMovimentoNatureza <> '')

      {
            if ((TipoMovimentoNatureza <> '') or not qryProdutosNotaFiscal.IsEmpty) and
               (diferenca >= 0.01) then
            begin
              MensagemAviso(format(ctSOMATORIODIFERENTESTOTAL,[

                                                'os produtos e demais campos',

                                                FormatarValor((qryNotaFiscaltotalprodutos.AsCurrency +
                                                              qryNotaFiscalvaloricmssubstituicao.AsCurrency +
                                                              qryNotaFiscalfreteinterno.AsCurrency +
                                                              qryNotaFiscalseguro.AsCurrency +
                                                              qryNotaFiscaldespesasacessorias.AsCurrency +
                                                              qryNotaFiscalvaloripi.AsCurrency +
                                                              ifthen(FImportacao,qryNotaFiscalvaloricms.AsCurrency,0)),2),

                                                               'a '+ansilowercase(ctNOTAFISCAL),

                                                               formatarvalor(qryNotaFiscalvalornota.AsCurrency,2),

                                               FormatarValor(
                                               ((qryNotaFiscaltotalprodutos.AsCurrency +
                                                qryNotaFiscalvaloricmssubstituicao.AsCurrency +
                                                qryNotaFiscalfreteinterno.AsCurrency +
                                                qryNotaFiscalseguro.AsCurrency +
                                                qryNotaFiscaldespesasacessorias.AsCurrency +
                                                qryNotaFiscalvaloripi.AsCurrency +
                                                ifthen(FImportacao,qryNotaFiscalvaloricms.AsCurrency,0)) - qryNotaFiscalvalornota.AsCurrency),2)]));
              Result := false;
            end;
          end;
      }


          if result then
          begin
            ErroDuplicata := VerificarValoresDasDuplicatas(Totalsomatorio,TotalNota);
            case ErroDuplicata of
             edDATADUPLICADAEACIMAUMANO :
                if MensagemConfirmacao(ctVENCIMENTOSDUPLICADOS+#10+
                                       ctAVISODATAVENCTOCIMAUMANOEMISSAO)= smbOk then
                   ErroDuplicata := edNENHUM;
             edDATADUPLICADA :
                if MensagemConfirmacao(ctVENCIMENTOSDUPLICADOS)= smbOk then
                   ErroDuplicata := edNENHUM;
             edDATAACIMAUMANO :
                if MensagemConfirmacao(ctAVISODATAVENCTOCIMAUMANOEMISSAO)= smbOk then
                   ErroDuplicata := edNENHUM;
             edDATANULA : begin
                            MensagemAviso(ctERRODATASDUPLICATASNULA);
                            Erro := 1;
                          end;
             edVALORES  : begin
                            {
                            if ExisteNaturezasProdutosSemGerarPagamento then
                            begin
                              result := MensagemConfirmacao(format(ctSOMATORIODIFERENTESTOTAL,['as '+ansilowercase(ctDUPLICATAS),
                                                                               FormatarValor(TotalSomatorio,2),
                                                                               'a '+ansilowercase(ctNOTAFISCAL),
                                                                               FormatarValor(TotalNota,2),
                                                                               FormatarValor((TotalSomatorio-TotalNota),2)])) = smbOk;
                             if not result then
                               Erro := 1
                             else
                               ErroDuplicata := edNENHUM;


                            end
                            else
                            begin
                              MensagemErro(format(ctSOMATORIODIFERENTESTOTAL,['as '+ansilowercase(ctDUPLICATAS),
                                                                               FormatarValor(TotalSomatorio,2),
                                                                               'a '+ansilowercase(ctNOTAFISCAL),
                                                                               FormatarValor(TotalNota,2),
                                                                               FormatarValor((TotalSomatorio-TotalNota),2)]));
                              Erro := 1;
                            end;
                            }

                            result := MensagemConfirmacao(format(ctSOMATORIODIFERENTESTOTAL,['as '+ansilowercase(ctDUPLICATAS),
                                                                               FormatarValor(TotalSomatorio,2),
                                                                               'a '+ansilowercase(ctNOTAFISCAL),
                                                                               FormatarValor(TotalNota,2),
                                                                               FormatarValor((TotalSomatorio-TotalNota),2)])) = smbOk;
                            if not result then
                               Erro := 1
                            else
                            begin
                              ErroDuplicata := edNENHUM;
                              if UsuarioLogin.GerenteEstoque then
                                UsrAut := ObterAutorizacao(taSENHA, 'Liberar somatório de duplicatas diferente do valor da nota', ctGERENTEESTOQUE, '')
                              else
                                UsrAut := ObterAutorizacao(taLOGIN, 'Liberar somatório de duplicatas diferente do valor da nota', ctGERENTEESTOQUE, '');

                              if Assigned(UsrAut) then
                              begin
                                 if Not UsrAut.GerenteEstoque then
                                 begin
                                   Erro := 1;
                                   MensagemAviso(ctUSUARIOSEMPERMISSAO);
                                 end
                               end
                              else
                                Erro := 1;
                            end;
                          end;
            end;

            if not GerarDocumentoPag or (ErroDuplicata = edNENHUM) then
            begin
              if VerificarCustos then
              begin
                if not SomenteLeituraDuplicata then
                  GravarDuplicataNotaFiscal;

                  {
                if not SomenteLeituraImpostos then
                  GravarImpostosNotaFiscal;}

                PreencherChavePrimaria;

                GravarLancamentosContabeis;

                if (qryNotaFiscal.State = dsinsert) or
                   (qryNotaFiscalsituacao.AsString='P') then
                begin
                  vAtualizarIPINCMProdutos := True;

                  result := GravarProdutosNotaFiscal;

                  if result then
                  begin

                    if qryNotaFiscalserie.IsNull then
                      GerarSerieFilialBase;

                    if qryProcuraNaturezasgerarpagamento.AsBoolean then
                    begin
                      if qryDocumentoPagnumero.AsInteger <> 0 then
                       GravarDocumentoPag(topUPDATE)
                      else
                        GravarDocumentoPag(topINSERT);
                    end
                    else
                      GravarDocumentoPag(topDELETE);

                    if qryProdutosNotaFiscal.IsEmpty then
                      Result := True
                    else
                    begin
                      if not parsistema.PermitirGravacaoNFEParcial then
                        Result := IncluirProdutosNaoCadastrados
                      else
                        result := true;

                      if result then
                        result := IncluirPrecosNaoCadastrados;
                    end;
                  end;
                end
                else
                begin
                  if qryProcuraNaturezasgerarpagamento.AsBoolean then
                  begin
                    if qryNotaFiscaldocumentopag.AsInteger = 0 then
                      result := GravarDocumentoPag(topINSERT)
                    else
                      result := GravarDocumentoPag(topUPDATE);
                  end
                  else
                    result := GravarDocumentoPag(topDELETE);

                 { if result then
                  begin
                    if (qryNotaFiscalsituacao.AsString='N') then
                      AtualizarMovimentos;
                  end;}

                  if result then
                    result := IncluirPrecosNaoCadastrados;

                end;

                if FImportacao then
                begin
                  if qryDadosImportacoesnumero.AsString <> '' then
                    qryNotaFiscalndi.AsString := qryDadosImportacoesnumero.AsString
                  else
                    qryNotaFiscalndi.clear;
                end;

                if result then
                begin
                  result := VerificarFornecedorparaISS;

                  if result then
                  begin
                    if qryProcuraNaturezasgerarpagamento.AsBoolean then
                      result := VerificarImpostosRetidos(false,
                                            validar,
                                            qryDocumentosPagImpostosRetidos,
                                            qryDuplicatasImpostosRetidos,
                                            qryContasEntradasFiliais,
                                            qryVenctosImpostosRetidosEntradas,
                                            qryDocumentoPag,
                                            qryDuplicatas,
                                            spcDocumentoPag,
                                            CadastroDuplicatas);
                  end
                  else
                  begin
                    Erro := 5;
                    MensagemAviso('Não foi informado um fornecedor para o ISS');
                  end;
                end;

                if Result then
                begin


      {            vEstaIncluindo := qryNotafiscal.State = dsInsert;}


                  VerificarImpostosRetidos(false,
                            GRAVAR,
                            qryDocumentosPagImpostosRetidos,
                            qryDuplicatasImpostosRetidos,
                            qryContasEntradasFiliais,
                            qryVenctosImpostosRetidosEntradas,
                            qryDocumentoPag,
                            qryDuplicatas,
                            spcDocumentoPag,
                            CadastroDuplicatas);

                  DocumentopagExcluido := (qryNotaFiscaldocumentopag.OldValue <> null) and
                                          (qryNotaFiscaldocumentopag.AsInteger = 0);

                  if qryNotaFiscalpermitirimprimir.AsBoolean and
                     CondicaoEmissorNfe and
                     qryNotaFiscalnumprotocolonfe.isNull  then
                    Result := EmitirNFe(true);

                  if result then
                  begin
                    qryNotaFiscal.edit;
                    Result := BloquearProdutosNoEstoque;
                    if Result then
                    begin
                      qryNotaFiscalsituacao.AsString := 'N';
                      AtualizarMovimentos;
                    end;


                    qryNotaFiscal.Post;
                    qryProdutosNotaFiscal.AfterScroll := nil;
                    VerificarProdutosFornecedor;
                    VerificarProdutosFornecedores;
                    VerificarProdutosFornecedoresUnidades;
                    qryProdutosNotaFiscal.first;
                    qryProdutosNotaFiscal.AfterScroll := qryProdutosNotaFiscalAfterScroll;

                    if qryDocumentoPag.isempty then
                      limpartabela(qryDuplicatas);


                    if (qrynotafiscalmodelodocto.asstring='57') then
                    begin
                      ApagarProdutosNotasPagNFe;
                      qryProdutosNotasPagNFE.AfterScroll := nil;
                      if qryProdutosNotasPagNFEItems.state = dsinsert then
                        qryProdutosNotasPagNFEItems.cancel;

                      if qryProdutosNotasPagNFE.state = dsinsert then
                        qryProdutosNotasPagNFE.cancel;
                    end;


                    if Assigned(dtmLancamentoContabilidade) then
                    begin
                      if DocumentopagExcluido then
                      begin
                        result :=
                          Perpetrar([qryPedidos, qryPrevisao, qryPrevisaoDuplicatas,
                          dtmCalcularCusto.qryprecos, dtmCalcularCusto.qrycolunasprecos, dtmCalcularCusto.qryprodutosalteracao,
                          qryDadosImportacoes, qryAdicoesImportacao, qryprodutosimportados,
                          qryNotaFiscal, qryDuplicatas,
                          qryDocumentoPag, qryEstoque, qrySeriesFiliais,
                          qryProdutosNotasPagNFE, qryProdutosNotasPagNFELotes, qryProdutosNotasPagNFEItems, qryProdutosNotasPagNFEItemsSituacao, qryPedidosNotasPag,
                          qryProdutosNotaFiscal, {dtmGerarNotaFiscal.qryCalculosNotasPag,}
                          qryMovimentos, qryFornecedorProduto,
                          dtmLancamentoContabilidade.qrylancamentosNotasEntradas,
                          qryVolumesNotasPag, qryLacresVolumesNotasPag, qryProdutosFornecedores, qryProdutosFornecedoresUnidades_, qrynotaspagchv ]);

                        if result then
                          AtualizacoesAposGravacao;

                      end
                      else
                      begin
                      {
                        dtmLancamentoContabilidade.qrylancamentosNotasEntradas.first;
                        while not dtmLancamentoContabilidade.qrylancamentosNotasEntradas.eof do
                           dtmLancamentoContabilidade.qrylancamentosNotasEntradas.next;
                       }
                        result :=
                          Perpetrar([qryPedidos, qryPrevisao, qryPrevisaoDuplicatas,
                          qryDocumentoPag, qryEstoque,
                          qryDadosImportacoes, qryAdicoesImportacao, qryprodutosimportados,
                          qrySeriesFiliais, qryNotaFiscal,
                          dtmCalcularCusto.qryprecos, dtmCalcularCusto.qrycolunasprecos, dtmCalcularCusto.qryprodutosalteracao,
                          qryProdutosNotasPagNFE, qryProdutosNotasPagNFELotes, qryProdutosNotasPagNFEItems, qryProdutosNotasPagNFEItemsSituacao, qryPedidosNotasPag,
                          qryProdutosNotaFiscal,
                          qryDuplicatas, qrydocumentospagimpostosretidos,
                          qryduplicatasimpostosretidos,
                          {dtmGerarNotaFiscal.qryCalculosNotasPag,}
                          qryMovimentos, qryFornecedorProduto,
                          dtmLancamentoContabilidade.qrylancamentosNotasEntradas,
                          qryVolumesNotasPag, qryLacresVolumesNotasPag, qryProdutosFornecedores, qryProdutosFornecedoresUnidades, qrynotaspagchv]);

                        if result then
                          AtualizacoesAposGravacao;

                        {Refazer os lançamentos contábeis com a nova contrapartida(efeito excluir e incluir)}
                        if FContrapartidaAlterada then
                        begin
                          if qryNotaFiscalsituacao.AsString <> 'D' then
                          begin
                            Write_Duplicatas := qryDuplicatas.RequestLive;
                            if not Write_Duplicatas then
                              qryDuplicatas.RequestLive := true;

                            qryDuplicatas.DisableControls;
                            try
                               qryDuplicatas.First;
                               while not qryduplicatas.Eof do
                               begin
                                 if not qryDuplicatasauxdatapagto.IsNull then
                                 begin
                                   qryDuplicatas.Edit;
                                   qryDuplicatasdatapagto.AsDateTime := qryDuplicatasauxdatapagto.AsDateTime;
                                   qryDuplicatasauxdatapagto.Clear;
                                   qryDuplicatas.Post;
                                 end;
                                 qryDuplicatas.Next;
                               end;
                            finally
                               qryDuplicatas.First;
                               qryDuplicatas.EnableControls;
                               FContrapartidaAlterada := false;
                               qryDuplicatas.RequestLive := Write_Duplicatas;
                            end;
                            if (qrynotafiscal.State in [dsedit, dsinsert]) then
                              qryNotaFiscal.Cancel;
                            Perpetrar([qryDuplicatas]);
                          end;
                        end;
                      end;
                    end
                    else
                    begin

                      if DocumentopagExcluido then
                      begin
                        result :=
                          Perpetrar([qryPedidos, qryPrevisao, qryPrevisaoDuplicatas,
                          qryDadosImportacoes, qryAdicoesImportacao, qryprodutosimportados,
                          qryNotaFiscal, qryDuplicatas, qryDocumentoPag, qryEstoque,
                          qrySeriesFiliais,
                          dtmCalcularCusto.qryprecos, dtmCalcularCusto.qrycolunasprecos, dtmCalcularCusto.qryprodutosalteracao,
                          qryProdutosNotasPagNFE, qryProdutosNotasPagNFELotes, qryProdutosNotasPagNFEItems, qryProdutosNotasPagNFEItemsSituacao, qryPedidosNotasPag,
                          qryProdutosNotaFiscal,
                          {dtmGerarNotaFiscal.qryCalculosNotasPag,}
                          qryMovimentos, qryFornecedorProduto,
                          qryVolumesNotasPag, qryLacresVolumesNotasPag, qryProdutosFornecedores, qryProdutosFornecedoresUnidades, qrynotaspagchv]);

                        if result then
                          AtualizacoesAposGravacao;

                      end
                      else
                      begin
                        result :=
                          Perpetrar([qryPedidos, qryPrevisao, qryPrevisaoDuplicatas, qryDocumentoPag, qryEstoque,
                          qryDadosImportacoes, qryAdicoesImportacao, qryprodutosimportados,
                          qrySeriesFiliais, qryNotaFiscal,
                          dtmCalcularCusto.qryprecos, dtmCalcularCusto.qrycolunasprecos, dtmCalcularCusto.qryprodutosalteracao,
                          qryProdutosNotasPagNFE, qryProdutosNotasPagNFELotes, qryProdutosNotasPagNFEItems, qryProdutosNotasPagNFEItemsSituacao, qryPedidosNotasPag,
                          qryProdutosNotaFiscal,
                          qryDuplicatas, qrydocumentospagimpostosretidos,
                          qryduplicatasimpostosretidos,
                          {dtmGerarNotaFiscal.qryCalculosNotasPag,}
                          qryMovimentos, qryFornecedorProduto,
                          qryVolumesNotasPag, qryLacresVolumesNotasPag, qryProdutosFornecedores, qryProdutosFornecedoresUnidades, qrynotaspagchv]);

                        if result then
                          AtualizacoesAposGravacao;
                      end;
                    end;

                    if result and qryNotaFiscalpermitirimprimir.asBoolean then
                      result := CalcularImpostos(qryNotaFiscalcodigo.asinteger, 'E');


                    if (qrynotafiscalmodelodocto.asstring='57') then
                    begin
                      qryProdutosNotasPagNFE.AfterScroll :=
                         qryProdutosNotasPagNFEAfterScroll;

                    end;


                    if result and IncluindoViaXml and (qryNotaFiscal.recordcount <> 0) then
                    begin
                      qrynfe.close;
                      qrynfe.ParamByName('codigo').AsInteger := qryNotaFiscalcodigo.AsInteger;
                      qrynfe.Open;
                      qrynfe.edit;
                      qrynfexmlnfe.LoadFromFile(ArquivoXMLNFe);
                      qrynfe.Post;

                      perpetrar([qrynfe]);
                      IncluindoViaXml := false;
                    end;
                  end;

                  if result then
                  begin

                    AtualizarTabelaIPI;
                    if qryNotaFiscalpermitirimprimir.AsBoolean then
                    begin
                      if CondicaoEmissorNfe then
                      begin
                         if qryNotaFiscalnumprotocolonfe.isNull  then
                           Result := EmitirNFe;
                      end
                      else
                      if MensagemConfirmacao(ctIMPRIMIRNOTAENTRADA) = smbOK then
                      begin
                        dtmImprimeNotaEntrada := TdtmImprimeNotaEntrada.Create(Self);
                        dtmImprimeNotaEntrada.ImprimirNotasPag(qryNotaFiscalcodigo.AsInteger);
                        dtmImprimeNotaEntrada.Free;
                        dtmImprimeNotaEntrada := nil
                      end;
                    end;
                    qryMovimentos.Close;
                    qryFornecedorProduto.Close;
      //              SomenteLeitura := True;
                    SomenteLeitura := false; // True;

      {              if vEstaIncluindo and (qryDuplicatas.RecordCount <> 0) then
                    begin
                      if MensagemSelecionaOpcao()
                    end;}

                  end;

                end
              end
              else
                Erro := 3;
            end
          end;

          if not result then
          begin
            if qryNotaFiscalsituacao.AsString = 'P' then
             if MensagemConfirmacao('Gravar a Nota Parcialmente') = smbOK then
              gravarnotaparcial;
          end
          else if
           // compras p/ industrialização, comercialização ou prestação de servicos
           ((qryprodutosnotafiscalCodigoFiscal.asinteger MOD 1000 > 100) and (qryprodutosnotafiscalCodigoFiscal.asinteger MOD 1000 < 127)  or
           // compra de energia eletrica
            (qryprodutosnotafiscalCodigoFiscal.asinteger MOD 1000 > 250) and (qryprodutosnotafiscalCodigoFiscal.asinteger MOD 1000 < 258)  or
           // compras sujeitas ao regime de subst. tributária
            (qryprodutosnotafiscalCodigoFiscal.asinteger MOD 1000 > 400) and (qryprodutosnotafiscalCodigoFiscal.asinteger MOD 1000 < 408) or (qryprodutosnotafiscalCodigoFiscal.asinteger MOD 1000 = 551)) then
           begin
                //AtualizarValorUltimaCompra;
           end;
        end
        else
        begin
          Result := False;
          erro := 6;
        end;

        if result then
        begin
          qryDuplicatasAfterOpen(nil);
//          RefazConsultaPorNome(qryPedidosdaNota, ['codigonota'],[qryNotaFiscalcodigo.AsInteger]);
          if qryProdutosNotasPagNFE.active then
          begin
            qryProdutosNotasPagNFE.first;
            qryProdutosNotasPagNFEItems.first;
          end;
        end;

      end;
    end;
  finally
    VisualizandoProdutosdaNFE := vSituacaoVisualizandoProdutosdaNFE;
    VisualizarDetalhesProdutosNota := vSituacaoVisualizarDetalhesProdutosNota;

    qryNotaFiscalCalcFields(qryNotaFiscal);


  end;

end;


function TdtmCadastroNotasFiscais.GravarNotaFiscalSaida: Boolean;
begin
  if not (qryNotasSaidasFrete.state in [dsinsert, dsedit]) then
    qryNotasSaidasFrete.Edit;
  if ((qryNotasSaidasFretenotasaida.IsNull) and
      (qryNotasSaidasFretedadofiscal.IsNull)) then
      MensagemAviso('Campos da Nota de Saída devem ser preenchidos.')
  else
    qryNotasSaidasFrete.Post;
end;

function TdtmCadastroNotasFiscais.GravarProdutosNotaFiscal: Boolean;
var Editando: Boolean;
begin
   ProdutoAlterado := false;
   Result := False;

   if dsrProdutosNotaFiscal.DataSet = qryProdutosNotaFiscal then
   begin
      qryProdutosNotaFiscalproduto.Required := true;

      qryProdutosNotaFiscaldadofiscal.required := qryNotaFiscalrequernfsaida.AsBoolean;
      qryProdutosNotaFiscalnumeroprodutotabela.required := qryNotaFiscalrequernfsaida.AsBoolean;
      qryProdutosNotaFiscalfilialnotafiscalsaida.required := qryNotaFiscalrequernfsaida.AsBoolean;
      qryProdutosNotaFiscalserienotafiscalsaida.required := qryNotaFiscalrequernfsaida.AsBoolean;
      qryProdutosNotaFiscalnumeronotafiscalsaida.required := qryNotaFiscalrequernfsaida.AsBoolean;
      qryProdutosNotaFiscalnrlote.required := qryProdutosNotaFiscalgerenciarloteevalidade.asBoolean;

      if qryProcuraNaturezastipomovimento.IsNull then begin
         while Not qryProdutosNotaFiscal.IsEmpty do
            qryProdutosNotaFiscal.Delete;
            Result := True
      end
      else if qryProdutosNotaFiscal.State in [dsEdit, dsInsert] then begin
              Editando:= (qryProdutosNotaFiscal.State = dsEdit);

              if ((qryProdutosNotaFiscalprecounitario.asFloat * qryProdutosNotaFiscalquantidade.AsFloat) = 0) and
                 not qryProcuraNaturezasProdutodiferenciada.AsBoolean
              then MensagemAviso(ctPRECOQtDADENOTAENTRADAMAIORZERO)
              else if Truncar(qryProdutosNotaFiscalprecounitario.asFloat *
                              qryProdutosNotaFiscalquantidade.AsFloat, 2) >=
                              qryProdutosNotaFiscalvalorreducaobase.AsCurrency
                   then begin
                      if (qryProdutosNotaFiscalaliquotaipi.AsCurrency = 0) and
                         (qryProdutosNotaFiscalvaloripi.AsCurrency <> 0) then
                         MensagemAviso('Informe a alíquota do IPI')
                      else
                      if (qryProdutosNotaFiscalipibasecalculo.AsCurrency <> 0) and
                         (qryProdutosNotaFiscalaliquotaipi.AsCurrency <> 0) and
                         (qryProdutosNotaFiscalvaloripi.AsCurrency = 0) and
                         not qryProdutosNotaFiscalvaloripidigitado.AsBoolean then
                         MensagemAviso('Informe o valor do IPI')
                      else
                      if (qryProdutosNotaFiscalpercentualreducaobase.AsCurrency = 0) and
                         (qryProdutosNotaFiscalvalorreducaobase.AsCurrency <> 0) then
                         MensagemAviso('Informe o percentual de redução da base')
                      else
                      if (qryProdutosNotaFiscalpercentualreducaobase.AsCurrency <> 0) and
                         (qryProdutosNotaFiscalvalorreducaobase.AsCurrency = 0) then
                         MensagemAviso('Informe o valor da redução da base')
                      else
                      if (qryProdutosNotaFiscalqtdeestoque.AsCurrency = 0) then
                         MensagemErro('A quantidade em estoque deve ser maior do que zero')
                      else
                      if qryProdutosNotaFiscal.CheckRequiredFields {and
                         VerificarProdutosFornecedor} then begin
                           qryProdutosNotaFiscalprodutototal.AsCurrency:= (qryProdutosNotaFiscalprecounitario.asFloat *
                                                                           qryProdutosNotaFiscalquantidade.AsFloat);

                         if qryProcuraNaturezasProduto.IsEmpty then
                           RefazConsultaPorNome(qryProcuraNaturezasProduto,['codigofiscal'],[qryProdutosNotaFiscalcodigofiscal.AsVariant]);

                         if ((qryProdutosNotaFiscalcodigofiscal.AsInteger = qryNotaFiscalcodigofiscal.AsInteger) and
                             (qryProdutosNotaFiscalnatureza.AsInteger     = qryNotaFiscalcodigonatureza.AsInteger)) then
                         begin
                           qryProdutosNotaFiscaltipomovimento.AsString := qryProcuraNaturezastipomovimento.AsString;
                           qryProdutosNotaFiscaloperacao.AsString      := qryProcuraNaturezasoperacao.AsString;
                         end
                         else
                         begin
                           qryProdutosNotaFiscaltipomovimento.AsString := qryProcuraNaturezasProdutotipomovimento.AsString;
                           qryProdutosNotaFiscaloperacao.AsString      := qryProcuraNaturezasProdutooperacao.AsString;
                         end;

//                         if qryProdutosNotaFiscalprecovenda.AsCurrency = 0 then
//                           qryProdutosNotaFiscalprecovenda.AsCurrency := qryProdutosNotaFiscalprecounitario.asFloat;
//                         qryProdutosNotaFiscaltribquantidade.AsFloat := qryProdutosNotaFiscalquantidade.AsFloat;
//                         qryProdutosNotaFiscaltribunitario.AsFloat   := qryProdutosNotaFiscalprecounitario.AsFloat;

                         //result := CalcularValorTotalProdutos;

                         result := CalcularImpostos;
                         if result then
                         begin
                           PostProdutosNotaFiscal;
//                           AtualizarQuantidadeNaoRecebida(True);
                           AtualizaSQLProdutosExistenteNotas;
                         end;

                      end
                   end
                   else MensagemAviso(ctNOTAENTBASEREDUCAOMAIORTOTALPROD)
           end
           else
             result := CalcularImpostos;
   end
   else begin
      qryProdutosNotaFiscalproduto.Required := false;
//      qryProdutosNotaFiscal.DisableControls;
//      if qryProdutosNotaFiscal.State in [dsedit, dsinsert] then
//        PostProdutosNotaFiscal;
      qryProdutosNotaFiscal.EnableControls;
      dsrGrade.OnDataChange := nil;
//      PosicionarLinhanaGrade;
//      PosicionarLinhaColunaNaGrade(nil);
      qrygrade.Edit;

      case tipograde of
         tpLINHA : if qryProdutosNotaFiscalvalorgrade2.AsString <> ''
                   then qryGrade.Fields[colunas.IndexOf(qryProdutosNotaFiscalvalorgrade2.AsString)+1].AsCurrency := qryProdutosNotaFiscalquantidade.AsFloat
                   else qryGrade.Fields[1].AsCurrency := qryProdutosNotaFiscalquantidade.AsFloat;

         tpCOLUNA: if qryProdutosNotaFiscalvalorgrade1.AsString <> ''
                   then qryGrade.Fields[colunas.IndexOf(qryProdutosNotaFiscalvalorgrade1.AsString)+1].Ascurrency := qryProdutosNotaFiscalquantidade.AsFloat
                   else qryGrade.Fields[1].AsCurrency := qryProdutosNotaFiscalquantidade.AsFloat;
      end;
      qryGrade.FieldByName('precounitario').AsFloat := qryProdutosNotaFiscalprecounitario.AsFloat;
      qryGrade.FieldByName('aliquotaicms').Ascurrency := qryProdutosNotaFiscalaliquotaicms.AsCurrency;
      qryGrade.FieldByName('aliquotaipi').Ascurrency := qryProdutosNotaFiscalaliquotaipi.AsCurrency;
      qrygrade.FieldByName('valorreducaobase').AsCurrency := qryProdutosNotaFiscalvalorreducaobase.AsCurrency;
      CalcularTotalGrade;
      qrygrade.Post;
      dsrGrade.OnDataChange := dsrGradeDataChange;
      qrygrade.Edit;
      result := true;
   end;

   State_qryProdutosNotaFiscal := qryProdutosNotaFiscal.state;

   if result then
     OpenClientDataSetProdutosNotaFiscal(CDSProdutosNotaFiscalAux, Open_and_Close);
end;

function TdtmCadastroNotasFiscais.ICMSFrete: Currency;
begin
  try
    ReFazConsulta(qryICMSFrete, [0, 1], [ParSistema.IcmsFrete, qryNotaFiscalestado.AsString]);
    Result := qryICMSFretevalor.ascurrency;
  finally
    qryICMSFrete.Close
  end
end;

function TdtmCadastroNotasFiscais.ICMSSeguro: Currency;
begin
  try
    ReFazConsulta(qryICMSSeguro, [0, 1], [ParSistema.IcmsSeguro, qryNotaFiscalestado.AsString]);
    Result := qryICMSSegurovalor.ascurrency;
  finally
    qryICMSSeguro.Close
  end
end;

function TdtmCadastroNotasFiscais.ImpostosRetidos: Currency;
begin
  Result := qryNotaFiscalirretido.ascurrency +
            qryNotaFiscalissretido.ascurrency +
            qryNotaFiscalinssretido.ascurrency +
            qryNotaFiscalpisretido.ascurrency +
            qryNotaFiscalcofinsretido.ascurrency +
            qryNotaFiscalcsllretido.ascurrency +
            qryNotaFiscalpiscofinscsllretido.AsCurrency;
end;

function TdtmCadastroNotasFiscais.IncluirDuplicataNotaFiscal(Editar:Boolean): Boolean;
begin
  if qryDuplicatas.State = dsEdit then
    qryDuplicatas.Cancel;

  if not Editar or qryDuplicatas.IsEmpty then
  begin
    qryDuplicatas.Append;
    qryDuplicatasvalordesconto.AsCurrency:= 0;
    qryDuplicatastipojuros.AsString:= 'V';
    qryDuplicatastipomulta.AsString:= 'V';

    if ParSistema.AutorizacaoPagtoAutomatica then
       qryDuplicatasautorizado.AsBoolean  := True
    else
       qryDuplicatasautorizado.AsBoolean  := False;
  end;
  Result := True
end;

{
function TdtmCadastroNotasFiscais.IncluirImpostosNotaFiscal(Editar:Boolean): Boolean;
begin
  if dtmGerarNotaFiscal.qryCalculosNotasPag.State = dsEdit then
    dtmGerarNotaFiscal.qryCalculosNotasPag.Cancel;
  if  not Editar or dtmGerarNotaFiscal.qryCalculosNotasPag.IsEmpty then
    dtmGerarNotaFiscal.qryCalculosNotasPag.Append;
  Result := True;
end;
}

procedure TdtmCadastroNotasFiscais.IncluirEditarMovimento(Qtdade: Currency; Tipo, Referencia: String; Custo: Currency; Incluir : boolean = true);
var
  MovProxNumero: Integer;
  vGravarMovimentos : Boolean;
begin

  if incluir then
  begin
    spcMovimentosProximo.Open;
    MovProxNumero := spcMovimentosProximovalor.AsInteger;
    spcMovimentosProximo.Close;
    qryMovimentos.Append;
    qryMovimentosnumero.AsInteger        := MovProxNumero;
    vGravarMovimentos := true
  end
  else
  begin
    vGravarMovimentos :=  {true} (qryMovimentostipomovimento.AsString <> 'NFN') or (tipo <> 'NFN') ; {Comentado por Lúcio/Gedovar a pedido da Gama (não grava NFN ou sem operacao)}
                                                                                          {Voltado atrás pelo João...quando ele ficou sabendo...bhaaaa}
    qryMovimentos.edit;
  end;

  if vGravarMovimentos then
  begin
    qryMovimentosnumerocontrole.AsInteger := qryProdutosNotaFiscalnumero.AsInteger;
    {Numerooriginal: situacao para atender a necessidade de uma alteração de nota fiscal}
  // qryProdutosNotaFiscalnumeroprodutooriginal.asInteger := qryProdutosNotaFiscalnumero.AsInteger;
    qryProdutosNotaFiscalnumerooriginal.asInteger := qryProdutosNotaFiscalnumero.AsInteger;

    //em 22/09/15 - Sempre que a filial for virtual o estoque a ser movimentado é o do campo filial_estoque da tabela de filiais
    qryMovimentosfilial.AsInteger        :=  ifthen(TipoFilial<>'V', FilialBase, FilialEstoque);
    qryMovimentoscodigonota.AsInteger    := qryNotaFiscalcodigo.AsInteger;

    qryMovimentosquantidade.AsFloat   := Qtdade;
    qryMovimentostipomovimento.AsString  := Tipo;

    if copy(qryProdutosNotaFiscaloperacao.AsString, 12, 1) <> '*' then
      qryMovimentosvalor.AsCurrency        := Custo;

    qryMovimentosvalorultimacompra.AsCurrency := Custo/qtdade;
    qryMovimentosprecocomicms.ascurrency := qryProdutosNotaFiscalprecounitario.asFloat / qryProdutosNotaFiscalfatorconversao.asfloat;
  //  qryMovimentosprecosemicms.ascurrency := (qryProdutosNotaFiscalprecounitario.asFloat - (qryProdutosNotaFiscalprecounitario.asFloat * qryProdutosNotaFiscalaliquotaicms.ascurrency / 100)) / qryProdutosNotaFiscalfatorconversao.asfloat;

    if not (NotaSubstituicao(qryProdutosNotaFiscalcst_produto.AsString) or
            NotaSemICMS(qryProdutosNotaFiscalcst_produto.AsString)) then
      qryMovimentosprecosemicms.ascurrency := (qryProdutosNotaFiscalprecounitario.asFloat -
                                               (qryProdutosNotaFiscalprecounitario.asFloat * qryProdutosNotaFiscalaliquotaicms.ascurrency / 100) -
                                               (qryProdutosNotaFiscalprecounitario.asFloat * qryProdutosNotaFiscalpcredsn.ascurrency / 100))
                                               / qryProdutosNotaFiscalfatorconversao.asfloat
    else
      qryMovimentosprecosemicms.ascurrency := qryMovimentosprecocomicms.ascurrency;

    qryMovimentosaliquotaipi.ascurrency  := qryProdutosNotaFiscalaliquotaipi.ascurrency;
    qryMovimentosreferencia.AsString     := Referencia;
    qryMovimentosdata.AsDateTime         := qryNotaFiscaldata.AsDateTime;
    qryMovimentosproduto.AsLargeInt      := qryProdutosNotaFiscalproduto.AsLargeInt;

    if not qryProdutosNotaFiscallote.isnull and qryProdutosNotaFiscalgerenciarloteevalidade.AsBoolean then
      qryMovimentosloteproduto.asLargeint := qryProdutosNotaFiscallote.asLargeInt
    else
      qryMovimentosloteproduto.clear;

    qryMovimentosok.AsBoolean := true;

    if qryProdutosNotaFiscalvalormoeda.AsCurrency<>0 then
    begin
      qryMovimentosmoeda.AsString        := qryProdutosNotaFiscalmoeda.AsString;
      qryMovimentosvalormoeda.AsCurrency := qryProdutosNotaFiscalvalormoeda.AsCurrency;
    end
    else
    begin
      qryMovimentosmoeda.clear;
      qryMovimentosvalormoeda.clear;
    end;
    qryMovimentos.Post;
  end
  else
  begin
    qryMovimentosok.AsBoolean := true;
    qryMovimentos.Post;
  end;

end;

procedure TdtmCadastroNotasFiscais.VisualizarNFSaidas;
//var CFOP: String;
begin
// CFOP:= Copy(qryProcuraNaturezascodigofiscal.AsString,2,2);
 if Copy(qryProcuraNaturezascodigofiscal.AsString,2,2) = '35' then
   VisualizarGrade:= true
 else
   VisualizarGrade:= False;
end;

procedure TdtmCadastroNotasFiscais.AtualizarIncidencias;
begin
  if qryProdutosNotaFiscal.Active then
  begin
    try
      qryProdutosNotaFiscal.BeforeEdit := nil;

      qryProdutosNotaFiscal.DisableControls;
      DesabilitarControles(true);

      qryProdutosNotaFiscal.First;
      while not qryProdutosNotaFiscal.Eof do
      begin
        RefazConsultaPorNome(qryProcuraNaturezasProduto,['codigofiscal'],[qryProdutosNotaFiscalcodigofiscal.AsVariant]);
        if ((regimetributario =1) and (qryProcuraNaturezasProdutocsosn.AsString  <> '')) or
           ((regimetributario<>1) and (qryProcuraNaturezasProdutoicmscst.AsString <> '')) then
        begin

          if ((qryProdutosNotaFiscalincidencia.AsString <> qryProcuraNaturezasProdutoicmscst.AsString) and (regimetributario <>1)) or
             ((qryProdutosNotaFiscalcsosn.AsString <> qryProcuraNaturezasProdutocsosn.AsString) and (regimetributario =1)) then
          begin
            qryProdutosNotaFiscal.Edit;
            qryProdutosNotaFiscalincidencia.AsString := qryProcuraNaturezasProdutoicmscst.AsString;
            qryProdutosNotaFiscalcsosn.AsString := qryProcuraNaturezasProdutocsosn.AsString;
            PostProdutosNotaFiscal;
          end;
        end
        else
        begin
          RefazConsultaPorNome(qryProcuraProdutoNotaFiscal, ['produtovisual','caracteristica','valorgrade1','valorgrade2'],
                               [qryProdutosNotaFiscalprodutovisual.AsString,
                                null, null, null]);

          if ((regimetributario=1) and (qryProcuraProdutoNotaFiscalcsosn.AsString <> '')) or
             ((regimetributario<>1) and (qryProcuraProdutoNotaFiscalincidencia.AsString <> '')) then
          begin
            if ((qryProdutosNotaFiscalincidencia.AsString <> qryProcuraProdutoNotaFiscalincidencia.AsString) and (regimetributario <>1)) or
               ((qryProdutosNotaFiscalcsosn.AsString  <> qryProcuraProdutoNotaFiscalcsosn.AsString) and (regimetributario =1)) then
            begin
              qryProdutosNotaFiscal.Edit;
              qryProdutosNotaFiscalincidencia.AsString := qryProcuraProdutoNotaFiscalincidencia.AsString;
              qryProdutosNotaFiscalcsosn.AsString := qryProcuraProdutoNotaFiscalcsosn.AsString;
              PostProdutosNotaFiscal;
            end;
          end;
        end;
        qryProdutosNotaFiscal.Next;
      end;
    finally
      qryProdutosNotaFiscal.First;
      qryProdutosNotaFiscal.EnableControls;

      qryProdutosNotaFiscal.BeforeEdit := qryProdutosNotaFiscalBeforeEdit;
      DesabilitarControles(false);
    end;
  end;
end;

procedure TdtmCadastroNotasFiscais.TotalizarAdicoes;
begin
  FmercadoriasAdicoes := 0; FfreteAdicoes := 0; FembalagemAdicoes := 0; FthcAdicoes := 0;
  FiiAdicoes := 0;          FipiAdicoes := 0;   FpisAdicoes := 0;       FcofinsAdicoes := 0;
  FsiscomexAdicoes := 0;    FbaseicmsAdicoes := 0;                      FvaloricmsAdicoes := 0;

  qryAdicoesImportacao.AfterScroll := nil;
  GuardarRegistroAtual(qryAdicoesImportacao,True);
  try
    qryAdicoesImportacao.First;
    while not qryAdicoesImportacao.Eof do
    begin
      FmercadoriasAdicoes := FmercadoriasAdicoes + qryAdicoesImportacaomercadoria.AsCurrency;
      FfreteAdicoes       := FfreteAdicoes      + qryAdicoesImportacaofrete.AsCurrency;
      FembalagemAdicoes   := FembalagemAdicoes  + qryAdicoesImportacaoembalagem.AsCurrency;
      FthcAdicoes         := FthcAdicoes        + qryAdicoesImportacaothc.AsCurrency;
      FiiAdicoes          := FiiAdicoes         + qryAdicoesImportacaoii.AsCurrency;
      FipiAdicoes         := FipiAdicoes        + qryAdicoesImportacaoipi.AsCurrency;
      FpisAdicoes         := FpisAdicoes        + qryAdicoesImportacaopis.AsCurrency;
      FcofinsAdicoes      := FcofinsAdicoes     + qryAdicoesImportacaocofins.AsCurrency;
      FsiscomexAdicoes    := FsiscomexAdicoes   + qryAdicoesImportacaosiscomex.AsCurrency;
      FbaseicmsAdicoes    := FbaseicmsAdicoes   + qryAdicoesImportacaobaseicms.AsCurrency;
      FvaloricmsAdicoes   := FvaloricmsAdicoes  + qryAdicoesImportacaovaloricms.AsCurrency;
      qryAdicoesImportacao.Next;
    end;
  finally
    VoltarRegistroAtual(qryAdicoesImportacao);
    qryAdicoesImportacao.AfterScroll := qryAdicoesImportacaoAfterScroll;
  end;
  if Assigned(OnTotalizarAdicoes) then
    OnTotalizarAdicoes(qryAdicoesImportacao);
end;

(*
procedure TdtmCadastroNotasFiscais.SelecionarCodigoNatureza(descricao: String);
begin
  if qryNaturezasPadrao.Locate('descricao',descricao,[]) then
  begin
    qryProdutosNotaFiscalnatureza.asinteger     := qryNaturezasPadraonatureza.AsInteger;
    qryProdutosNotaFiscalgerarpagamento.AsBoolean := qryNaturezasPadraogerarpagamento.AsBoolean;
    qryProdutosNotaFiscalcodigofiscal.AsInteger := qryNaturezasPadraocodigofiscal.AsInteger;
    qryProdutosNotaFiscalnaogerarcreditoicms.AsBoolean := qryNaturezasPadraonaogerarcreditoicms.AsBoolean;
    qryProdutosNotaFiscalnaogerarcreditoipi.AsBoolean := qryNaturezasPadraonaogerarcreditoipi.AsBoolean;
    qryProdutosNotaFiscalicmssobreipi.AsBoolean := qryNaturezasPadraoicmssobreipi.AsBoolean;
    qryProdutosNotaFiscalnaocalcularipisobrefrete.AsBoolean := qryNaturezasPadraonaocalcularipisobrefrete.AsBoolean;

{    qryProdutosNotasPagipicst.asstring        := qryNaturezasPadraoipicst.AsString;
    qryProdutosNotasPagcofinscst.AsString     := qryNaturezasPadraocofinscst.AsString;
    qryProdutosNotasPagpiscst.AsString        := qryNaturezasPadraopiscst.AsString;}

    if HeUnidadeFederacao(qryNotaFiscalestado.AsString) then
    begin
      if qryNotaFiscalestado.AsString = EstadoFilialBase then
         qryProdutosNotaFiscalcodigofiscal.AsInteger := 1000 + qryProdutosNotaFiscalcodigofiscal.AsInteger mod 1000
      else
         qryProdutosNotaFiscalcodigofiscal.AsInteger := 2000 + qryProdutosNotaFiscalcodigofiscal.AsInteger mod 1000;
    end
    else
      qryProdutosNotaFiscalcodigofiscal.AsInteger := 3000 + qryProdutosNotaFiscalcodigofiscal.AsInteger mod 1000;
  end
  else
    MensagemAviso(ctNATUREZAPADRAONAOVINCULADA);
end;
*)



(*
function TdtmCadastroNotasFiscais.GerarProdutosImportacao: Boolean;
var
  UltimoProduto_ComIPI : String;

  NPA,          //NUMERO DE PRODUTOS DA ADICAO
  NPI,          //NUMERO DE PRODUTOS INCLUIDOS POR ADICAO
  i: Integer;
  SomaOriginal_comIPI, //SOMATORIO VALOR ORIGINAL DOS PRODUTOS DA ADICAO
  SomaOriginal_semIPI,
  PT,           //PRODUTO TOTAL
  BaseICMSDistribuido,
  ValorICMSDistribuido,
  IPIdistribuido,
  IIdistribuido, //VALOR DO IMPOSTO DE IMPORTACAO JÁ ATRIBUIDO
  MercadoriaDistribuida,
  FreteDistribuido,
  DespesasAcessoriasDistribuida,
  TotalFrete,
  TotalBaseICMS,
  TotalValorICMS,
  TotalPIS,
  TotalCOFINS,
  TotalIPI,
  TotalII,
  TotalProd,
  embalagemdistribuida,
  thcdistribuida,
  TotalMercadorias,
  TotalIPICalculado,
  TotalFechamentoIPI,
  TotalDiferencaFechamentoIPI,
  TotalDiferencaFechamentoIPIDistribuida : Currency;
begin
  fGerandoProdutos := true;
  result := false;

  TotalFrete := 0;    TotalPIS := 0;       TotalCOFINS := 0;  TotalII   := 0;
  TotalBaseICMS := 0; TotalValorICMS := 0; TotalIPI    := 0;  TotalProd := 0;

  dsrNotaFiscal.OnDataChange := nil;
  qryNotaFiscalndi.AsString                  := qryDadosImportacoesnumero.AsString;
  dsrNotaFiscal.OnDataChange := dsrNotaFiscalDataChange;


  qryProdutosNotaFiscal.Close;
  qryProdutosNotaFiscal.Open;

  try

    DesabilitarControles(true);

    qryProdutosNotaFiscal.First;
    while not qryprodutosnotafiscal.Eof do
      qryprodutosnotafiscal.Delete;
  finally
    DesabilitarControles(false);
  end;


//  qryAdicoesImportacao.DisableControls;
  qryAdicoesImportacao.AfterScroll  := nil;
  qryprodutosnotafiscal.AfterInsert := nil;


  qryAdicoesImportacao.First;
  try

    GuardarRegistroAtual(qryProdutosImportados,True);
    while not qryAdicoesImportacao.Eof do
    begin
      SomaOriginal_comIPI := 0;
      SomaOriginal_semIPI := 0;
      NPA          := 0;

      IPIdistribuido := 0; NPI := 0;
      IIdistribuido  := 0;
      FreteDistribuido := 0;
      MercadoriaDistribuida := 0;
      embalagemdistribuida := 0;
      thcdistribuida := 0;
      TotalIPICalculado := 0;
      TotalFechamentoIPI := 0;
      TotalDiferencaFechamentoIPI := 0;

      DespesasAcessoriasDistribuida := 0;

      BaseICMSDistribuido := 0;
      ValorICMSDistribuido := 0;

{      if not qryAdicoesImportacaototais.AsBoolean then
      begin                                            }

      qryProdutosImportados.First;
      while not qryProdutosImportados.Eof do
      begin
        if qryProdutosImportadosnumeroadicao.AsInteger = qryAdicoesImportacaonumero.AsInteger then
        begin
          if qryProdutosImportadosaliquotaipi.AsCurrency > 0 then
          begin
            SomaOriginal_comIPI := SomaOriginal_comIPI + qryProdutosImportadosvalor.AsCurrency;
            UltimoProduto_ComIPI := qryProdutosImportadosproduto.AsString;
          end
          else
            SomaOriginal_semIPI := SomaOriginal_semIPI + qryProdutosImportadosvalor.AsCurrency;
            Inc(NPA);
        end;
        qryProdutosImportados.Next;
      end;

      TotalMercadorias := ((SomaOriginal_comIPI + SomaOriginal_semIPI) * qryDadosImportacoestaxacambio.AsCurrency);

{      if TotalMercadorias <> qryAdicoesImportacaomercadoria.AsCurrency then
        MensagemAviso(format('O total dos produtos: %f não esta fechando com o total das mercadorias: %f da adição n° %s. A diferença será rateada.',
                   [TotalMercadorias, qryAdicoesImportacaomercadoria.AsCurrency, qryadicoesimportacaonumero.asstring]));
 }

      qryProdutosImportados.First;
      while not qryProdutosImportados.Eof do
      begin
        if qryProdutosImportadosnumeroadicao.AsInteger = qryAdicoesImportacaonumero.AsInteger then
        begin
          Inc(NPI);

          RefazConsultaPorNome(qryProcuraProdutoNotaFiscal, ['produtovisual','caracteristica','valorgrade1','valorgrade2'],
                               [qryProdutosImportadosprodutovisual.AsString,
                                null, null, null]);

          dsrProdutosNotaFiscal.OnDataChange := nil;
          qryProdutosNotaFiscal.Append;
          qryProdutosNotaFiscalprodutook.AsBoolean := true;

          qryProdutosNotaFiscalnatureza.AsInteger           := qryNotaFiscalcodigonatureza.Asinteger;
          qryProdutosNotaFiscalcodigofiscal.AsInteger           := qryNotaFiscalcodigofiscal.Asinteger;

          qryProcuraNaturezasProduto.ParamByName('codigofiscal').asinteger := qryNotaFiscalcodigofiscal.Asinteger;
          qryProcuraNaturezasProduto.close;
          qryProcuraNaturezasProduto.open;

          qryProdutosNotaFiscalnumero.AsInteger        := qryProdutosImportados.RecNo;
          qryProdutosNotaFiscalproduto.AsLargeInt      := qryProdutosImportadosproduto.AsLargeInt;
          qryProdutosNotaFiscalquantidade.AsFloat   := qryProdutosImportadosquantidade.AsFloat;
          qryProdutosNotaFiscalqtdeestoque.AsFloat   := qryProdutosNotaFiscalquantidade.AsFloat * qryProdutosNotaFiscalfatorconversao.AsFloat;


          qryProdutosNotaFiscalaliquotaipi.AsCurrency  := qryProdutosImportadosaliquotaipi.AsCurrency;
          qryProdutosNotaFiscalaliquotaicms.AsCurrency := {qryProdutosImportadosicms.AsCurrency;} qryAdicoesImportacaoaliquotaicms.AsCurrency;

          qryProdutosNotaFiscaladicao.AsInteger        := qryAdicoesImportacaonumero.AsInteger;
          qryProdutosNotaFiscalnseqadicao.AsInteger    := NPI;


          if NPI <> NPA then
          begin
            qryProdutosNotaFiscalprodutototal.AsCurrency :=  roundto((qryProdutosImportadosvalor.AsFloat *
                                                                qryDadosImportacoestaxacambio.AsFloat) *
                                                              qryAdicoesImportacaomercadoria.AsCurrency /
                                                              TotalMercadorias, -2);
            MercadoriaDistribuida := MercadoriaDistribuida + qryProdutosNotaFiscalprodutototal.AsFloat;

            qryProdutosNotaFiscalicmsbasecalculo.AsCurrency :=  roundto((qryProdutosImportadosvalor.AsFloat *
                                                                qryDadosImportacoestaxacambio.AsFloat) *
                                                              qryAdicoesImportacaobaseicms.AsCurrency /
                                                              TotalMercadorias, -2);
            BaseICMSDistribuido := BaseICMSDistribuido + qryProdutosNotaFiscalicmsbasecalculo.AsCurrency;

            qryProdutosNotaFiscalicmsvalor.AsCurrency :=  roundto((qryProdutosImportadosvalor.AsFloat *
                                                                qryDadosImportacoestaxacambio.AsFloat) *
                                                              qryAdicoesImportacaovaloricms.AsCurrency /
                                                              TotalMercadorias, -2);
            ValorICMSDistribuido := ValorICMSDistribuido + qryProdutosNotaFiscalicmsvalor.AsCurrency;

            qryProdutosNotaFiscalfrete.asfloat  := roundto(qryProdutosNotaFiscalprodutototal.AsFloat *
                                                      qryAdicoesImportacaofrete.AsCurrency/
                                                      qryAdicoesImportacaomercadoria.AsFloat, -2);

            FreteDistribuido := FreteDistribuido + qryProdutosNotaFiscalfrete.asfloat;

            qryProdutosNotaFiscalembalagem.asfloat := roundto(qryProdutosNotaFiscalprodutototal.asfloat *
                                                      qryAdicoesImportacaoembalagem.AsCurrency/
                                                      qryAdicoesImportacaomercadoria.AsCurrency,-2);
            embalagemdistribuida := embalagemdistribuida + qryProdutosNotaFiscalembalagem.asfloat;


            qryProdutosNotaFiscalthc.asfloat := roundto(qryProdutosNotaFiscalprodutototal.asfloat *
                                                      qryAdicoesImportacaothc.AsCurrency/
                                                      qryAdicoesImportacaomercadoria.AsCurrency,-2);
            thcdistribuida := thcdistribuida + qryProdutosNotaFiscalthc.asfloat;


            qryProdutosNotaFiscaliivalor.asfloat  := roundto(qryProdutosNotaFiscalprodutototal.asfloat *
                                                      qryAdicoesImportacaoii.AsCurrency/
                                                      qryAdicoesImportacaomercadoria.AsCurrency,-2);

            IIdistribuido := IIdistribuido + qryProdutosNotaFiscaliivalor.asfloat;

{
            qryProdutosNotaFiscaldespesasacessorias.asfloat := roundto(qryProdutosNotaFiscalprodutototal.asfloat *
                                                                (qryAdicoesImportacaopis.AsCurrency +
                                                                 qryAdicoesImportacaocofins.AsCurrency +
                                                                 qryAdicoesImportacaosiscomex.AsCurrency +
                                                                 qryAdicoesImportacaoembalagem.AsCurrency +
                                                                 qryAdicoesImportacaothc.AsCurrency) /
                                                                qryAdicoesImportacaomercadoria.AsCurrency,-2);
}
{
    {desp. acess.: pis + cofins + siscomex + embalagem + thc ou
     desp. acess.: TotalBaseICMS - TotalProd - TotalFrete - TotalIPI - TotalValorICMS

     optar pela segunda opção pois nem sempre o valor é fechado c/ o total
}

            qryProdutosNotaFiscaldespesasacessorias.asfloat := roundto(qryProdutosNotaFiscalprodutototal.asfloat *
                                                                (qryAdicoesImportacaobaseicms.AsCurrency -
                                                                 qryAdicoesImportacaomercadoria.AsCurrency -
                                                                 qryAdicoesImportacaofrete.AsCurrency -
                                                                 qryAdicoesImportacaoipi.AsCurrency -
                                                                 qryAdicoesImportacaovaloricms.AsCurrency -
                                                                 qryAdicoesImportacaoii.AsCurrency) /
                                                                qryAdicoesImportacaomercadoria.AsCurrency,-2);


            DespesasAcessoriasDistribuida := DespesasAcessoriasDistribuida + qryProdutosNotaFiscaldespesasacessorias.asfloat;

          end
          else
          begin
            qryProdutosNotaFiscalprodutototal.AsCurrency := qryAdicoesImportacaomercadoria.AsCurrency - MercadoriaDistribuida;
            qryProdutosNotaFiscalicmsbasecalculo.AsCurrency :=  qryAdicoesImportacaobaseicms.AsCurrency - BaseICMSDistribuido;
            qryProdutosNotaFiscalicmsvalor.AsCurrency := qryAdicoesImportacaovaloricms.AsCurrency - ValorICMSDistribuido;

            qryProdutosNotaFiscalfrete.asfloat  := qryAdicoesImportacaofrete.ascurrency - FreteDistribuido;
            qryProdutosNotaFiscalembalagem.asfloat  := qryAdicoesImportacaoembalagem.ascurrency - embalagemdistribuida;
            qryProdutosNotaFiscalthc.asfloat  := qryAdicoesImportacaothc.ascurrency - thcdistribuida;
            qryProdutosNotaFiscaliivalor.asfloat  := qryAdicoesImportacaoii.ascurrency - IIdistribuido;
            qryProdutosNotaFiscaldespesasacessorias.asfloat  := (qryAdicoesImportacaobaseicms.AsCurrency -
                                                                 qryAdicoesImportacaomercadoria.AsCurrency -
                                                                 qryAdicoesImportacaofrete.AsCurrency -
                                                                 qryAdicoesImportacaoipi.AsCurrency -
                                                                 qryAdicoesImportacaovaloricms.AsCurrency -
                                                                 qryAdicoesImportacaoii.AsCurrency) - DespesasAcessoriasDistribuida;
          end;


          qryProdutosNotaFiscaliidespaduaneira.asfloat  := qryProdutosNotaFiscalprodutototal.asfloat +
                                                              qryProdutosNotaFiscalfrete.asfloat +
                                                              qryProdutosNotaFiscalthc.asfloat +
                                                              qryProdutosNotaFiscalembalagem.asfloat;

          qryProdutosNotaFiscalprecounitario.AsFloat := {roundto(}(qryProdutosNotaFiscalprodutototal.AsFloat / qryProdutosNotaFiscalquantidade.AsFloat){, -ParSistema.PrecoUnitarioCasasDecimais)};
//          qryProdutosNotaFiscaltribunitario.AsFloat          := qryProdutosNotaFiscalprecounitario.asFloat;

          qryProdutosNotaFiscalipibasecalculo.asfloat  := qryProdutosNotaFiscaliidespaduaneira.asfloat +
                                                             qryProdutosNotaFiscaliivalor.asfloat;

          qryProdutosNotaFiscaliibasecalculo.asfloat   := qryProdutosNotaFiscaliidespaduaneira.asfloat;

          if (qryAdicoesImportacaoipi.AsCurrency > 0) and (qryProdutosImportadosaliquotaipi.asfloat > 0) then
             qryProdutosNotaFiscalvaloripi.asfloat := roundto(qryProdutosNotaFiscalipibasecalculo.asfloat * qryProdutosNotaFiscalaliquotaipi.asfloat / 100, -2)
          else
             qryProdutosNotaFiscalvaloripi.asfloat      := 0;

          TotalIPICalculado := TotalIPICalculado + qryProdutosNotaFiscalvaloripi.AsCurrency;

          TotalProd := TotalProd + qryProdutosNotaFiscalprodutototal.AsCurrency;
          PostProdutosNotaFiscal;


          dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
        end;

        qryProdutosImportados.Next;
      end;

      TotalIPICalculado := RoundTo(TotalIPICalculado, -2);
      if TotalIPICalculado <> qryAdicoesImportacaoipi.AsCurrency then
      begin

         if TotalIPICalculado = 0 then
           MensagemErro(format('A adição n° %s possui um total de ipi de: %f e nenhum dos produtos possui alíquota de IPI.',
             [qryadicoesimportacaonumero.asstring, qryAdicoesImportacaoipi.asfloat ]))
         else
         begin
         {
           if abs(TotalIPICalculado - qryAdicoesImportacaoipi.AsCurrency) > 0.01 then
             MensagemAviso(format('O total do IPI calculado: %f não esta fechando com o total do ipi: %f da adição n° %s. A diferença será rateada.',
                [TotalIPICalculado, qryAdicoesImportacaoipi.asfloat, qryadicoesimportacaonumero.asstring]));
          }
           try
             DesabilitarControles(true);
             qryProdutosNotaFiscal.First;
             IPIdistribuido := 0;
             dsrProdutosNotaFiscal.OnDataChange := nil;
             while not qryprodutosnotafiscal.Eof do
             begin
               if qryProdutosNotaFiscaladicao.AsInteger = qryAdicoesImportacaonumero.AsInteger then
               begin
                 if UltimoProduto_ComIPI <> qryProdutosNotaFiscalproduto.AsString then
                 begin
                   qryprodutosnotafiscal.Edit;
                   qryProdutosNotaFiscalvaloripi.asfloat := roundto(qryProdutosNotaFiscalvaloripi.asfloat * qryAdicoesImportacaoipi.AsCurrency / TotalIPICalculado, -2);
                   PostProdutosNotaFiscal;
                   IPIdistribuido := IPIdistribuido + qryProdutosNotaFiscalvaloripi.asfloat;
                 end
                 else
                 begin
                   qryprodutosnotafiscal.Edit;
                   qryProdutosNotaFiscalvaloripi.asfloat := qryAdicoesImportacaoipi.AsCurrency - IPIdistribuido;
                   PostProdutosNotaFiscal;
                end;
               end;
               qryprodutosnotafiscal.next;
             end;

           finally
             dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
             DesabilitarControles(false);
           end;
         end;
      end;

      try

        DesabilitarControles(true);

        qryProdutosNotaFiscal.First;
        TotalFechamentoIPI := 0;
        while not qryprodutosnotafiscal.Eof do
        begin
          if qryProdutosNotaFiscaladicao.AsInteger = qryAdicoesImportacaonumero.AsInteger then
            TotalFechamentoIPI := TotalFechamentoIPI + qryProdutosNotaFiscalipibasecalculo.AsCurrency +
                                                       qryProdutosNotaFiscalvaloripi.AsCurrency +
                                                       qryProdutosNotaFiscalicmsvalor.AsCurrency +
                                                       qryProdutosNotaFiscaldespesasacessorias.AsCurrency -
                                                       qryProdutosNotaFiscalembalagem.AsCurrency -
                                                       qryProdutosNotaFiscalthc.AsCurrency;
          qryprodutosnotafiscal.next;
        end;

        TotalDiferencaFechamentoIPI := qryAdicoesImportacaobaseicms.AsCurrency - TotalFechamentoIPI;
        if TotalDiferencaFechamentoIPI <> 0 then
        begin
          qryProdutosNotaFiscal.First;
          TotalDiferencaFechamentoIPIDistribuida  := 0;
          dsrProdutosNotaFiscal.OnDataChange := nil;
          while not qryprodutosnotafiscal.Eof do
          begin
           if qryProdutosNotaFiscaladicao.AsInteger = qryAdicoesImportacaonumero.AsInteger then
           begin
             if UltimoProduto_ComIPI <> qryProdutosNotaFiscalproduto.AsString then
             begin
               qryprodutosnotafiscal.Edit;
               IPIdistribuido := RoundTo((qryProdutosNotaFiscalipibasecalculo.asfloat * TotalDiferencaFechamentoIPI / TotalFechamentoIPI), -2);
               qryProdutosNotaFiscalipibasecalculo.asfloat := roundto(qryProdutosNotaFiscalipibasecalculo.asfloat + IPIdistribuido, -2);
               PostProdutosNotaFiscal;
               TotalDiferencaFechamentoIPIDistribuida := TotalDiferencaFechamentoIPIDistribuida + IPIdistribuido;
             end
             else
             begin
               qryprodutosnotafiscal.Edit;
               qryProdutosNotaFiscalipibasecalculo.asfloat := roundto(qryProdutosNotaFiscalipibasecalculo.asfloat +
                                                              (TotalDiferencaFechamentoIPI - abs(TotalDiferencaFechamentoIPIDistribuida)),-2);
               PostProdutosNotaFiscal;
            end;
           end;
           qryprodutosnotafiscal.next;
          end;
          dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
        end;
      finally
        DesabilitarControles(false);
      end;

      TotalFrete     := TotalFrete     + qryAdicoesImportacaofrete.AsCurrency;
      TotalII        := TotalII        + qryAdicoesImportacaoii.AsCurrency;
      TotalIPI       := TotalIPI       + qryAdicoesImportacaoipi.AsCurrency;

      TotalPIS       := TotalPIS       + qryAdicoesImportacaopis.AsCurrency;
      TotalCOFINS    := TotalCOFINS    + qryAdicoesImportacaocofins.AsCurrency;

      TotalBaseICMS  := TotalBaseICMS  + qryAdicoesImportacaobaseicms.AsCurrency;
      TotalValorICMS := TotalValorICMS + qryAdicoesImportacaovaloricms.AsCurrency;


      qryAdicoesImportacao.Next;
    end;


    //CalcularImpostos;

    dsrNotaFiscal.OnDataChange := nil;

    qryNotaFiscalndi.AsString                  := qryDadosImportacoesnumero.AsString;
    qryNotaFiscalfreteinterno.AsCurrency       := TotalFrete;
    {desp. acess.: pis + cofins + siscomex + embalagem + thc ou cfe abaixo:}
    qryNotaFiscaldespesasacessorias.AsCurrency := TotalBaseICMS - TotalProd - TotalFrete - TotalIPI - TotalValorICMS;


    qryNotaFiscaltotalvalorpis.AsCurrency      := TotalPIS;
    qryNotaFiscaltotalvalorcofins.AsCurrency   := TotalCOFINS;
    qryNotaFiscaltotalimportacao.AsCurrency    := TotalII;
    qryNotaFiscalbaseicms.AsCurrency           := TotalBaseICMS;
    qryNotaFiscalvaloricms.AsCurrency          := TotalValorICMS;
    qryNotaFiscalvalornota.AsCurrency          := Truncar(TotalBaseICMS, 2);
    qryNotaFiscalvaloripi.AsCurrency           := TotalIPI;

    dsrNotaFiscal.OnDataChange := dsrNotaFiscalDataChange;

  finally
    VoltarRegistroAtual(qryProdutosImportados);
//    qryAdicoesImportacao.EnableControls;
    qryAdicoesImportacao.AfterScroll  := qryAdicoesImportacaoAfterScroll;
    qryprodutosnotafiscal.AfterInsert := qryProdutosNotaFiscalAfterInsert;
    fGerandoProdutos := false;
    CalcularImpostos;
//    CalcularValorTotalProdutos;
  end;
end;
*)


function TdtmCadastroNotasFiscais.GerarProdutosImportacao: Boolean;
var
  UltimoProduto_ComIPI : String;

  NPA,          //NUMERO DE PRODUTOS DA ADICAO
  NPI,          //NUMERO DE PRODUTOS INCLUIDOS POR ADICAO
  i: Integer;
  SomaOriginal_comIPI, //SOMATORIO VALOR ORIGINAL DOS PRODUTOS DA ADICAO
  SomaOriginal_semIPI,
  PT,           //PRODUTO TOTAL
  BaseICMSDistribuido,
  ValorICMSDistribuido,
  IPIdistribuido,
  IIdistribuido, //VALOR DO IMPOSTO DE IMPORTACAO JÁ ATRIBUIDO
  MercadoriaDistribuida,
  FreteDistribuido,
  DespesasAcessoriasDistribuida,
  TotalFrete,
  TotalBaseICMS,
  TotalValorICMS,
  TotalPIS,
  TotalCOFINS,
  TotalIPI,
  TotalII,
  TotalProd,
  embalagemdistribuida,
  thcdistribuida,
  TotalMercadorias,
  TotalIPICalculado,
  TotalFechamentoIPI,
  TotalDiferencaFechamentoIPI,
  TotalDiferencaFechamentoIPIDistribuida,
  TotalFinalAdicao,
  TotalDespesasAcessoriasAdicao,
  TotalDespesasAcessorias,
  TotalValorFinalNota : Currency;
begin
  fGerandoProdutos := true;
  result := false;

  TotalFrete := 0;    TotalPIS := 0;       TotalCOFINS := 0;  TotalII   := 0;
  TotalBaseICMS := 0; TotalValorICMS := 0; TotalIPI    := 0;  TotalProd := 0;
  TotalDespesasAcessorias := 0;
  TotalValorFinalNota := 0;

  dsrNotaFiscal.OnDataChange := nil;
  qryNotaFiscalndi.AsString                  := qryDadosImportacoesnumero.AsString;
  dsrNotaFiscal.OnDataChange := dsrNotaFiscalDataChange;


  qryProdutosNotaFiscal.Close;
  qryProdutosNotaFiscal.Open;

  try

    DesabilitarControles(true);

    qryProdutosNotaFiscal.First;
    while not qryprodutosnotafiscal.Eof do
      qryprodutosnotafiscal.Delete;
  finally
    DesabilitarControles(false);
  end;


//  qryAdicoesImportacao.DisableControls;
  qryAdicoesImportacao.AfterScroll  := nil;
  qryprodutosnotafiscal.AfterInsert := nil;


  qryAdicoesImportacao.First;
  try

    GuardarRegistroAtual(qryProdutosImportados,True);
    while not qryAdicoesImportacao.Eof do
    begin
      SomaOriginal_comIPI := 0;
      SomaOriginal_semIPI := 0;
      TotalFinalAdicao := 0;
      TotalDespesasAcessoriasAdicao := 0;
      UltimoProduto_ComIPI := '';
      NPA := 0;

      IPIdistribuido := 0; NPI := 0;
      IIdistribuido  := 0;
      FreteDistribuido := 0;
      MercadoriaDistribuida := 0;
      embalagemdistribuida := 0;
      thcdistribuida := 0;
      TotalIPICalculado := 0;
      TotalFechamentoIPI := 0;
      TotalDiferencaFechamentoIPI := 0;

      DespesasAcessoriasDistribuida := 0;

      BaseICMSDistribuido := 0;
      ValorICMSDistribuido := 0;

{      if not qryAdicoesImportacaototais.AsBoolean then
      begin                                            }

      qryProdutosImportados.First;
      while not qryProdutosImportados.Eof do
      begin
        if qryProdutosImportadosnumeroadicao.AsInteger = qryAdicoesImportacaonumero.AsInteger then
        begin
          TotalFinalAdicao := TotalFinalAdicao +
                              qryProdutosImportadosvalor.AsCurrency;

          if qryProdutosImportadosaliquotaipi.AsCurrency > 0 then
          begin
            SomaOriginal_comIPI := SomaOriginal_comIPI +
                                   qryProdutosImportadosvalor.AsCurrency;
            UltimoProduto_ComIPI := qryProdutosImportadosproduto.AsString;
          end
          else
            SomaOriginal_semIPI := SomaOriginal_semIPI +
                                   qryProdutosImportadosvalor.AsCurrency;

          Inc(NPA);
        end;
        qryProdutosImportados.Next;
      end;

      TotalMercadorias := ((SomaOriginal_comIPI + SomaOriginal_semIPI) *
                             qryDadosImportacoestaxacambio.AsCurrency);

      { O campo produtosimportados.valor contém o valor final/original
        mostrado na aba Produtos. A despesa acessória da adição é a
        diferença entre esse total final e a base de ICMS da adição. }
      TotalDespesasAcessoriasAdicao :=
        RoundTo(
          TotalFinalAdicao -
          qryAdicoesImportacaobaseicms.AsCurrency,
          -2
        );

      TotalDespesasAcessorias :=
        TotalDespesasAcessorias + TotalDespesasAcessoriasAdicao;

      TotalValorFinalNota :=
        TotalValorFinalNota + TotalFinalAdicao;

{      if TotalMercadorias <> qryAdicoesImportacaomercadoria.AsCurrency then
        MensagemAviso(format('O total dos produtos: %f não esta fechando com o total das mercadorias: %f da adição n° %s. A diferença será rateada.',
                   [TotalMercadorias, qryAdicoesImportacaomercadoria.AsCurrency, qryadicoesimportacaonumero.asstring]));
 }

      qryProdutosImportados.First;
      while not qryProdutosImportados.Eof do
      begin
        if qryProdutosImportadosnumeroadicao.AsInteger = qryAdicoesImportacaonumero.AsInteger then
        begin
          Inc(NPI);

          RefazConsultaPorNome(qryProcuraProdutoNotaFiscal, ['produtovisual','caracteristica','valorgrade1','valorgrade2'],
                               [qryProdutosImportadosprodutovisual.AsString,
                                null, null, null]);

          dsrProdutosNotaFiscal.OnDataChange := nil;
          qryProdutosNotaFiscal.Append;
          qryProdutosNotaFiscalprodutook.AsBoolean := true;

          qryProdutosNotaFiscalnatureza.AsInteger           := qryNotaFiscalcodigonatureza.Asinteger;
          qryProdutosNotaFiscalcodigofiscal.AsInteger           := qryNotaFiscalcodigofiscal.Asinteger;

          qryProcuraNaturezasProduto.ParamByName('codigofiscal').asinteger := qryNotaFiscalcodigofiscal.Asinteger;
          qryProcuraNaturezasProduto.close;
          qryProcuraNaturezasProduto.open;

          qryProdutosNotaFiscalnumero.AsInteger        := qryProdutosImportados.RecNo;
          qryProdutosNotaFiscalproduto.AsLargeInt      := qryProdutosImportadosproduto.AsLargeInt;
          qryProdutosNotaFiscalquantidade.AsFloat   := qryProdutosImportadosquantidade.AsFloat;
          qryProdutosNotaFiscalqtdeestoque.AsFloat   := qryProdutosNotaFiscalquantidade.AsFloat * qryProdutosNotaFiscalfatorconversao.AsFloat;


          qryProdutosNotaFiscalaliquotaipi.AsCurrency  := qryProdutosImportadosaliquotaipi.AsCurrency;
          qryProdutosNotaFiscalaliquotaicms.AsCurrency := {qryProdutosImportadosicms.AsCurrency;} qryAdicoesImportacaoaliquotaicms.AsCurrency;

          qryProdutosNotaFiscaladicao.AsInteger        := qryAdicoesImportacaonumero.AsInteger;
          qryProdutosNotaFiscalnseqadicao.AsInteger    := NPI;


          if NPI <> NPA then
          begin
            qryProdutosNotaFiscalprodutototal.AsCurrency :=  roundto((qryProdutosImportadosvalor.AsFloat *
                                                                qryDadosImportacoestaxacambio.AsFloat) *
                                                              qryAdicoesImportacaomercadoria.AsCurrency /
                                                              TotalMercadorias, -2);
            MercadoriaDistribuida := MercadoriaDistribuida + qryProdutosNotaFiscalprodutototal.AsFloat;

            qryProdutosNotaFiscalicmsbasecalculo.AsCurrency :=  roundto((qryProdutosImportadosvalor.AsFloat *
                                                                qryDadosImportacoestaxacambio.AsFloat) *
                                                              qryAdicoesImportacaobaseicms.AsCurrency /
                                                              TotalMercadorias, -2);
            BaseICMSDistribuido := BaseICMSDistribuido + qryProdutosNotaFiscalicmsbasecalculo.AsCurrency;

            qryProdutosNotaFiscalicmsvalor.AsCurrency :=  roundto((qryProdutosImportadosvalor.AsFloat *
                                                                qryDadosImportacoestaxacambio.AsFloat) *
                                                              qryAdicoesImportacaovaloricms.AsCurrency /
                                                              TotalMercadorias, -2);
            ValorICMSDistribuido := ValorICMSDistribuido + qryProdutosNotaFiscalicmsvalor.AsCurrency;

            qryProdutosNotaFiscalfrete.asfloat  := roundto(qryProdutosNotaFiscalprodutototal.AsFloat *
                                                      qryAdicoesImportacaofrete.AsCurrency/
                                                      qryAdicoesImportacaomercadoria.AsFloat, -2);

            FreteDistribuido := FreteDistribuido + qryProdutosNotaFiscalfrete.asfloat;

            qryProdutosNotaFiscalembalagem.asfloat := roundto(qryProdutosNotaFiscalprodutototal.asfloat *
                                                      qryAdicoesImportacaoembalagem.AsCurrency/
                                                      qryAdicoesImportacaomercadoria.AsCurrency,-2);
            embalagemdistribuida := embalagemdistribuida + qryProdutosNotaFiscalembalagem.asfloat;


            qryProdutosNotaFiscalthc.asfloat := roundto(qryProdutosNotaFiscalprodutototal.asfloat *
                                                      qryAdicoesImportacaothc.AsCurrency/
                                                      qryAdicoesImportacaomercadoria.AsCurrency,-2);
            thcdistribuida := thcdistribuida + qryProdutosNotaFiscalthc.asfloat;


            qryProdutosNotaFiscaliivalor.asfloat  := roundto(qryProdutosNotaFiscalprodutototal.asfloat *
                                                      qryAdicoesImportacaoii.AsCurrency/
                                                      qryAdicoesImportacaomercadoria.AsCurrency,-2);

            IIdistribuido := IIdistribuido + qryProdutosNotaFiscaliivalor.asfloat;

{
            qryProdutosNotaFiscaldespesasacessorias.asfloat := roundto(qryProdutosNotaFiscalprodutototal.asfloat *
                                                                (qryAdicoesImportacaopis.AsCurrency +
                                                                 qryAdicoesImportacaocofins.AsCurrency +
                                                                 qryAdicoesImportacaosiscomex.AsCurrency +
                                                                 qryAdicoesImportacaoembalagem.AsCurrency +
                                                                 qryAdicoesImportacaothc.AsCurrency) /
                                                                qryAdicoesImportacaomercadoria.AsCurrency,-2);
}
{
    {desp. acess.: pis + cofins + siscomex + embalagem + thc ou
     desp. acess.: TotalBaseICMS - TotalProd - TotalFrete - TotalIPI - TotalValorICMS

     optar pela segunda opção pois nem sempre o valor é fechado c/ o total
}

            if qryAdicoesImportacaomercadoria.AsCurrency <> 0 then
              qryProdutosNotaFiscaldespesasacessorias.AsCurrency :=
                RoundTo(
                  qryProdutosNotaFiscalprodutototal.AsCurrency *
                  TotalDespesasAcessoriasAdicao /
                  qryAdicoesImportacaomercadoria.AsCurrency,
                  -2
                )
            else
              qryProdutosNotaFiscaldespesasacessorias.AsCurrency := 0;


            DespesasAcessoriasDistribuida := DespesasAcessoriasDistribuida + qryProdutosNotaFiscaldespesasacessorias.asfloat;

          end
          else
          begin
            qryProdutosNotaFiscalprodutototal.AsCurrency := qryAdicoesImportacaomercadoria.AsCurrency - MercadoriaDistribuida;
            qryProdutosNotaFiscalicmsbasecalculo.AsCurrency :=  qryAdicoesImportacaobaseicms.AsCurrency - BaseICMSDistribuido;
            qryProdutosNotaFiscalicmsvalor.AsCurrency := qryAdicoesImportacaovaloricms.AsCurrency - ValorICMSDistribuido;

            qryProdutosNotaFiscalfrete.asfloat  := qryAdicoesImportacaofrete.ascurrency - FreteDistribuido;
            qryProdutosNotaFiscalembalagem.asfloat  := qryAdicoesImportacaoembalagem.ascurrency - embalagemdistribuida;
            qryProdutosNotaFiscalthc.asfloat  := qryAdicoesImportacaothc.ascurrency - thcdistribuida;
            qryProdutosNotaFiscaliivalor.asfloat  := qryAdicoesImportacaoii.ascurrency - IIdistribuido;
            qryProdutosNotaFiscaldespesasacessorias.AsCurrency :=
              RoundTo(
                TotalDespesasAcessoriasAdicao -
                DespesasAcessoriasDistribuida,
                -2
              );
          end;


          qryProdutosNotaFiscaliidespaduaneira.asfloat  := qryProdutosNotaFiscalprodutototal.asfloat +
                                                              qryProdutosNotaFiscalfrete.asfloat +
                                                              qryProdutosNotaFiscalthc.asfloat +
                                                              qryProdutosNotaFiscalembalagem.asfloat;

          qryProdutosNotaFiscalprecounitario.AsFloat := {roundto(}(qryProdutosNotaFiscalprodutototal.AsFloat / qryProdutosNotaFiscalquantidade.AsFloat){, -ParSistema.PrecoUnitarioCasasDecimais)};
//          qryProdutosNotaFiscaltribunitario.AsFloat          := qryProdutosNotaFiscalprecounitario.asFloat;

          qryProdutosNotaFiscalipibasecalculo.asfloat  := qryProdutosNotaFiscaliidespaduaneira.asfloat +
                                                             qryProdutosNotaFiscaliivalor.asfloat;

          qryProdutosNotaFiscaliibasecalculo.asfloat   := qryProdutosNotaFiscaliidespaduaneira.asfloat;

          if (qryAdicoesImportacaoipi.AsCurrency > 0) and (qryProdutosImportadosaliquotaipi.asfloat > 0) then
             qryProdutosNotaFiscalvaloripi.asfloat := roundto(qryProdutosNotaFiscalipibasecalculo.asfloat * qryProdutosNotaFiscalaliquotaipi.asfloat / 100, -2)
          else
             qryProdutosNotaFiscalvaloripi.asfloat      := 0;

          TotalIPICalculado := TotalIPICalculado + qryProdutosNotaFiscalvaloripi.AsCurrency;

          TotalProd := TotalProd + qryProdutosNotaFiscalprodutototal.AsCurrency;
          PostProdutosNotaFiscal;


          dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
        end;

        qryProdutosImportados.Next;
      end;

      TotalIPICalculado := RoundTo(TotalIPICalculado, -2);
      if TotalIPICalculado <> qryAdicoesImportacaoipi.AsCurrency then
      begin

         if TotalIPICalculado = 0 then
           MensagemErro(format('A adição n° %s possui um total de ipi de: %f e nenhum dos produtos possui alíquota de IPI.',
             [qryadicoesimportacaonumero.asstring, qryAdicoesImportacaoipi.asfloat ]))
         else
         begin
         {
           if abs(TotalIPICalculado - qryAdicoesImportacaoipi.AsCurrency) > 0.01 then
             MensagemAviso(format('O total do IPI calculado: %f não esta fechando com o total do ipi: %f da adição n° %s. A diferença será rateada.',
                [TotalIPICalculado, qryAdicoesImportacaoipi.asfloat, qryadicoesimportacaonumero.asstring]));
          }
           try
             DesabilitarControles(true);
             qryProdutosNotaFiscal.First;
             IPIdistribuido := 0;
             dsrProdutosNotaFiscal.OnDataChange := nil;
             while not qryprodutosnotafiscal.Eof do
             begin
               if qryProdutosNotaFiscaladicao.AsInteger = qryAdicoesImportacaonumero.AsInteger then
               begin
                 if UltimoProduto_ComIPI <> qryProdutosNotaFiscalproduto.AsString then
                 begin
                   qryprodutosnotafiscal.Edit;
                   qryProdutosNotaFiscalvaloripi.asfloat := roundto(qryProdutosNotaFiscalvaloripi.asfloat * qryAdicoesImportacaoipi.AsCurrency / TotalIPICalculado, -2);
                   PostProdutosNotaFiscal;
                   IPIdistribuido := IPIdistribuido + qryProdutosNotaFiscalvaloripi.asfloat;
                 end
                 else
                 begin
                   qryprodutosnotafiscal.Edit;
                   qryProdutosNotaFiscalvaloripi.asfloat := qryAdicoesImportacaoipi.AsCurrency - IPIdistribuido;
                   PostProdutosNotaFiscal;
                end;
               end;
               qryprodutosnotafiscal.next;
             end;

           finally
             dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
             DesabilitarControles(false);
           end;
         end;
      end;

      try

        DesabilitarControles(true);

        qryProdutosNotaFiscal.First;
        TotalFechamentoIPI := 0;
        while not qryprodutosnotafiscal.Eof do
        begin
          if qryProdutosNotaFiscaladicao.AsInteger = qryAdicoesImportacaonumero.AsInteger then
            TotalFechamentoIPI := TotalFechamentoIPI + qryProdutosNotaFiscalipibasecalculo.AsCurrency +
                                                       qryProdutosNotaFiscalvaloripi.AsCurrency +
                                                       qryProdutosNotaFiscalicmsvalor.AsCurrency +
                                                       qryProdutosNotaFiscaldespesasacessorias.AsCurrency -
                                                       qryProdutosNotaFiscalembalagem.AsCurrency -
                                                       qryProdutosNotaFiscalthc.AsCurrency;
          qryprodutosnotafiscal.next;
        end;

        TotalDiferencaFechamentoIPI := qryAdicoesImportacaobaseicms.AsCurrency - TotalFechamentoIPI;
        if TotalDiferencaFechamentoIPI <> 0 then
        begin
          qryProdutosNotaFiscal.First;
          TotalDiferencaFechamentoIPIDistribuida  := 0;
          dsrProdutosNotaFiscal.OnDataChange := nil;
          while not qryprodutosnotafiscal.Eof do
          begin
           if qryProdutosNotaFiscaladicao.AsInteger = qryAdicoesImportacaonumero.AsInteger then
           begin
             if UltimoProduto_ComIPI <> qryProdutosNotaFiscalproduto.AsString then
             begin
               qryprodutosnotafiscal.Edit;
               IPIdistribuido := RoundTo((qryProdutosNotaFiscalipibasecalculo.asfloat * TotalDiferencaFechamentoIPI / TotalFechamentoIPI), -2);
               qryProdutosNotaFiscalipibasecalculo.asfloat := roundto(qryProdutosNotaFiscalipibasecalculo.asfloat + IPIdistribuido, -2);
               PostProdutosNotaFiscal;
               TotalDiferencaFechamentoIPIDistribuida := TotalDiferencaFechamentoIPIDistribuida + IPIdistribuido;
             end
             else
             begin
               qryprodutosnotafiscal.Edit;
               qryProdutosNotaFiscalipibasecalculo.asfloat := roundto(qryProdutosNotaFiscalipibasecalculo.asfloat +
                                                              (TotalDiferencaFechamentoIPI - abs(TotalDiferencaFechamentoIPIDistribuida)),-2);
               PostProdutosNotaFiscal;
            end;
           end;
           qryprodutosnotafiscal.next;
          end;
          dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
        end;
      finally
        DesabilitarControles(false);
      end;

      TotalFrete     := TotalFrete     + qryAdicoesImportacaofrete.AsCurrency;
      TotalII        := TotalII        + qryAdicoesImportacaoii.AsCurrency;
      TotalIPI       := TotalIPI       + qryAdicoesImportacaoipi.AsCurrency;

      TotalPIS       := TotalPIS       + qryAdicoesImportacaopis.AsCurrency;
      TotalCOFINS    := TotalCOFINS    + qryAdicoesImportacaocofins.AsCurrency;

      TotalBaseICMS  := TotalBaseICMS  + qryAdicoesImportacaobaseicms.AsCurrency;
      TotalValorICMS := TotalValorICMS + qryAdicoesImportacaovaloricms.AsCurrency;


      qryAdicoesImportacao.Next;
    end;


    //CalcularImpostos;

    dsrNotaFiscal.OnDataChange := nil;

    qryNotaFiscalndi.AsString                  := qryDadosImportacoesnumero.AsString;
    qryNotaFiscalfreteinterno.AsCurrency       := TotalFrete;
    qryNotaFiscaldespesasacessorias.AsCurrency :=
      RoundTo(TotalDespesasAcessorias, -2);


    qryNotaFiscaltotalvalorpis.AsCurrency      := TotalPIS;
    qryNotaFiscaltotalvalorcofins.AsCurrency   := TotalCOFINS;
    qryNotaFiscaltotalimportacao.AsCurrency    := TotalII;
    qryNotaFiscalbaseicms.AsCurrency           := TotalBaseICMS;
    qryNotaFiscalvaloricms.AsCurrency          := TotalValorICMS;
    qryNotaFiscalvalornota.AsCurrency          := RoundTo(TotalValorFinalNota, -2);
    qryNotaFiscalvaloripi.AsCurrency           := TotalIPI;

    dsrNotaFiscal.OnDataChange := dsrNotaFiscalDataChange;

  finally
    VoltarRegistroAtual(qryProdutosImportados);
//    qryAdicoesImportacao.EnableControls;
    qryAdicoesImportacao.AfterScroll  := qryAdicoesImportacaoAfterScroll;
    qryprodutosnotafiscal.AfterInsert := qryProdutosNotaFiscalAfterInsert;
    fGerandoProdutos := false;
    CalcularImpostos;
//    CalcularValorTotalProdutos;
  end;
end;




procedure TdtmCadastroNotasFiscais.PreencherDuplicatas(Pedido: Integer);
var i: Integer ;
begin
  i:=1;
  if VerificarPedido(Pedido) then
  begin
    RefazConsultaPorNome(qryPrevisoesPedidos,['Numero'],[Pedido]);
    qryPrevisoesPedidos.First;
    while not qryPrevisoesPedidos.Eof do
    begin
      qryDuplicatas.Append;
      qryDuplicatasdatavencto.AsDateTime := SomarDia(qryNotaFiscaldata.AsDateTime, Trunc(qryPrevisoesPedidosdata.AsDateTime - qryPedidosdatabase.AsDateTime),'S');
      qryDuplicatasnumero.AsInteger      := I;
      qryDuplicatasvalorvencto.AsCurrency:= qryNotaFiscalvalornota.AsCurrency * (qryPrevisoesPedidospercentual.AsCurrency / 100);
      qryDuplicatastipojuros.AsString    := 'V';
      qryDuplicatastipomulta.AsString    := 'V';
      qryDuplicatasjuros.AsCurrency      := 0;
      qryDuplicatasmulta.AsCurrency      := 0;
      qryDuplicatasautorizado.AsBoolean  := ParSistema.AutorizacaoPagtoAutomatica;
      qryDuplicatas.Post;
      inc(i);
      qryPrevisoesPedidos.Next;
    end;
  end;
end;

function TdtmCadastroNotasFiscais.CalcularImpostos(msgDifAliquotaICMS: boolean = true;
                                  {ForcarRecalculo: boolean = false;}
                                  AlteracaoEspecifica: tpAlteracaoEspecifica = tpAltEsp_Nenhuma;
                                  VerificarAcertoCentavos: boolean = True;
                                  CalcularTodosRegistros: Boolean = false): boolean;
var
  EstadoTabelaProdutos: TDataSetState;
  vRecnoProduto_ : Integer;
//  vauxMasterSource : TDataSource;

begin
  result := true;
//  if RecalcularImpostos or ForcarRecalculo then
  begin
    EstadoTabelaProdutos := qryProdutosNotaFiscal.state;

//    vauxMasterSource  := qryProdutosNotaFiscal.mastersource;
//    qryProdutosNotaFiscal.mastersource := nil;

    if parsistema.AtualizarNCMNotaEntrada then
    begin
      qryProdutosNotasPagNFe.MasterSource := dsrProdutosNotaFiscal;
      qryProdutosNotasPagNFe.LinkFields := 'codigonota=codigonota, numerosequencianfe=numero';
    end;

    dsrNotaFiscal.onDataChange := nil;

    try

      DesabilitarControles(true);
      vRecnoProduto_ := qryProdutosNotaFiscal.recno;
//      OpenClientDataSetProdutosNotaFiscal(CDSProdutosNotaFiscal, Open_and_Close);


        result := CalcularImpostos(qryProdutosNotaFiscal, qryNotaFiscal, true, true,{CalcularTodosRegistros} false, {qryNotaFiscalpermitirimprimir.AsBoolean,}
        qryCalculosProdutos, nil, false, NotaEntrada, false, true, nil, false, msgDifAliquotaICMS, false, AlteracaoEspecifica,
        VerificarAcertoCentavos, qrynfe);

    finally


//      CDSProdutosNotaFiscal.recno := vRecnoProduto_ ;
//      CopiaRegistrosporNome(ttecQuery(CDSProdutosNotaFiscal), qryProdutosNotaFiscal, true, true, false, true, true, true, true);
      qryProdutosNotaFiscal.recno := vRecnoProduto_ ;
//      CDSProdutosNotaFiscal.recno := vRecnoProduto_ ;

      DesabilitarControles(false);
      if EstadoTabelaProdutos in [dsedit, dsinsert] then
         qryProdutosNotaFiscal.edit;

      if parsistema.AtualizarNCMNotaEntrada then
      begin
        qryProdutosNotasPagNFe.LinkFields := '';
        qryProdutosNotasPagNFe.MasterSource := nil;
      end;

    end;


    if result then
      ExecutadoCalculorImpostos := true
    else
      ExecutadoCalculorImpostos := false;


    dsrNotaFiscal.onDataChange := dsrNotaFiscalDataChange;
//    RecalcularImpostos := False;

//    qryProdutosNotaFiscal.mastersource := vauxMasterSource;

  end;
end;

function TdtmCadastroNotasFiscais.ValidarValoresDigitados: boolean;
var
  msg: String;
  vDiferenca : Currency;
begin

  if not ExecutadoCalculorImpostos then
    CalcularImpostos(false);


  result := ((TipoMovimentoNatureza <> '') or not qryProdutosNotaFiscal.IsEmpty);
  vDiferenca := 0.05;

  if result then
  begin
    qryDiferencas.Close;
    qryDiferencas.Open;
    qryDiferencas.delete;

    if (abs((qrynotafiscal.fieldbyname('baseicms').ascurrency - qrynotafiscal.fieldbyname('baseicmscalculada').ascurrency)) >= vdiferenca) then
    begin
      if (IncluidoViaXml or IncluindoViaXml) and
         ((qryNotaFiscalcodigofiscal.AsInteger mod 1000) = 949) and
         (qryProdutosNotasPagNFECFOP.AsInteger = 6105) then { as notas da Whirlpool Eletrodomesticos AM S.A é dado a entrada em duas notas a que possui os vencimentos esta com base total de icms e nos produtos não esta.
                                                              neste caso}
        result := true
      else
        result := false;
      qryDiferencas.Append;
      qryDiferencas.FieldByName('descricao').AsString := 'Base de cálculo do ICMS';
      qryDiferencas.FieldByName('valornota').AsCurrency := qrynotafiscal.fieldbyname('baseicms').ascurrency;
      qryDiferencas.FieldByName('valorcalculado').AsCurrency := qrynotafiscal.fieldbyname('baseicmscalculada').ascurrency;
      qryDiferencas.FieldByName('diferenca').AsCurrency := qrynotafiscal.fieldbyname('baseicms').ascurrency - qrynotafiscal.fieldbyname('baseicmscalculada').ascurrency;
      qryDiferencas.post;
    end;

    if (abs((qrynotafiscal.fieldbyname('valoricms').ascurrency - qrynotafiscal.fieldbyname('valoricmscalculada').ascurrency)) >= vdiferenca) then
    begin
      result := false;
      qryDiferencas.Append;
      qryDiferencas.FieldByName('descricao').AsString := 'Valor do ICMS';
      qryDiferencas.FieldByName('valornota').AsCurrency := qrynotafiscal.fieldbyname('valoricms').ascurrency;
      qryDiferencas.FieldByName('valorcalculado').AsCurrency := qrynotafiscal.fieldbyname('valoricmscalculada').ascurrency;
      qryDiferencas.FieldByName('diferenca').AsCurrency := qrynotafiscal.fieldbyname('valoricms').ascurrency - qrynotafiscal.fieldbyname('valoricmscalculada').ascurrency;
      qryDiferencas.post;
    end;

    { Em determinadas nfe´s o calculo não fecha em 0,01 centavos }
    if (abs((qrynotafiscal.fieldbyname('baseicmssubstituicao').ascurrency - qrynotafiscal.fieldbyname('baseicmssubstituicaocalculada').ascurrency)) > vdiferenca) then
    begin
      result := false;
      qryDiferencas.Append;
      qryDiferencas.FieldByName('descricao').AsString := 'Base de cálculo do ICMS ST';
      qryDiferencas.FieldByName('valornota').AsCurrency := qrynotafiscal.fieldbyname('baseicmssubstituicao').ascurrency;
      qryDiferencas.FieldByName('valorcalculado').AsCurrency := qrynotafiscal.fieldbyname('baseicmssubstituicaocalculada').ascurrency;
      qryDiferencas.FieldByName('diferenca').AsCurrency := qrynotafiscal.fieldbyname('baseicmssubstituicao').ascurrency - qrynotafiscal.fieldbyname('baseicmssubstituicaocalculada').ascurrency;
      qryDiferencas.post;
    end;


    if (abs((qrynotafiscal.fieldbyname('ValorICMSSubstituicao').ascurrency - qrynotafiscal.fieldbyname('ValorICMSSubstituicaocalculada').ascurrency)) >= vdiferenca) then
    begin
      result := false;
      qryDiferencas.Append;
      qryDiferencas.FieldByName('descricao').AsString := 'Valor do ICMS ST';
      qryDiferencas.FieldByName('valornota').AsCurrency := qrynotafiscal.fieldbyname('ValorICMSSubstituicao').ascurrency;
      qryDiferencas.FieldByName('valorcalculado').AsCurrency := qrynotafiscal.fieldbyname('ValorICMSSubstituicaocalculada').ascurrency;
      qryDiferencas.FieldByName('diferenca').AsCurrency := qrynotafiscal.fieldbyname('ValorICMSSubstituicao').ascurrency - qrynotafiscal.fieldbyname('ValorICMSSubstituicaocalculada').ascurrency;
      qryDiferencas.post;
    end;

    if (abs((qrynotafiscal.fieldbyname('valoripi').ascurrency - qrynotafiscal.fieldbyname('valoripicalculada').ascurrency)) >= vdiferenca) then
    begin
      result := false;
      qryDiferencas.Append;
      qryDiferencas.FieldByName('descricao').AsString := 'Valor do IPI';
      qryDiferencas.FieldByName('valornota').AsCurrency := qrynotafiscal.fieldbyname('valoripi').ascurrency;
      qryDiferencas.FieldByName('valorcalculado').AsCurrency := qrynotafiscal.fieldbyname('valoripicalculada').ascurrency;
      qryDiferencas.FieldByName('diferenca').AsCurrency := qrynotafiscal.fieldbyname('valoripi').ascurrency - qrynotafiscal.fieldbyname('valoripicalculada').ascurrency;
      qryDiferencas.post;
    end;

    if ((abs((qrynotafiscal.fieldbyname('valornota').ascurrency - qrynotafiscal.fieldbyname('valornotacalculada').ascurrency)) >= vdiferenca) and (not IncluidoViaXml and not IncluindoViaXml)) or
       { XML AS VEZES VEM COM DIFERENÇA DE 0,01}
       ((abs((qrynotafiscal.fieldbyname('valornota').ascurrency - qrynotafiscal.fieldbyname('valornotacalculada').ascurrency)) > vdiferenca) and (IncluidoViaXml or IncluindoViaXml)) then
    begin
      result := false;
      qryDiferencas.Append;
      qryDiferencas.FieldByName('descricao').AsString := 'Valor da nota fiscal';
      qryDiferencas.FieldByName('valornota').AsCurrency := qrynotafiscal.fieldbyname('valornota').ascurrency;
      qryDiferencas.FieldByName('valorcalculado').AsCurrency := qrynotafiscal.fieldbyname('valornotacalculada').ascurrency;
      qryDiferencas.FieldByName('diferenca').AsCurrency := qrynotafiscal.fieldbyname('valornota').ascurrency - qrynotafiscal.fieldbyname('valornotacalculada').ascurrency;
      qryDiferencas.post;
    end;

    if qryDiferencas.RecordCount > 0 then
    begin
      frmMensagemGrid := TfrmMensagemGrid.Create(frmMensagemGrid);
      frmMensagemGrid.Caption := 'Mensagem de erro';
      frmMensagemGrid.lblTitulo.Caption := 'DIFERENÇAS NOS CÁLCULOS DOS PRODUTOS!';
      frmMensagemGrid.lblTExto.Caption := 'Verifique no quadro abaixo as diferenças entre os valores da Nota Fiscal e os valores calculados nos produtos.';
      frmMensagemGrid.dbgMensagem.DataSource := dsrDiferencas;
      frmMensagemGrid.ShowModal;
      frmMensagemGrid.Free;
    end
    else
    begin
      vDiferenca := 0.5;    {Neste nível de total a dif pode ser de 0,50}
      qryCalculosProdutos.First;
      while not qryCalculosProdutos.Eof do
      begin

        if (qryCalculosProdutostipo.AsString = 'TOTAL ICMS') and
           (((abs(qrynotafiscal.fieldbyname('valornota').ascurrency - qryCalculosProdutostotal.AsCurrency) >= vdiferenca) and (not IncluidoViaXml and not IncluindoViaXml)) OR
            ((abs(qrynotafiscal.fieldbyname('valornota').ascurrency - qryCalculosProdutostotal.AsCurrency) > vdiferenca) and (IncluidoViaXml or IncluindoViaXml))) then
        begin
          qryDiferencas.Append;
          qryDiferencas.FieldByName('descricao').AsString := 'Fechamento dos cálculos do ICMS';
          qryDiferencas.FieldByName('valornota').AsCurrency := qrynotafiscal.fieldbyname('valornota').ascurrency;
          qryDiferencas.FieldByName('valorcalculado').AsCurrency := qryCalculosProdutostotal.AsCurrency;
          qryDiferencas.FieldByName('diferenca').AsCurrency := qrynotafiscal.fieldbyname('valornota').ascurrency - qryCalculosProdutostotal.AsCurrency;
          qryDiferencas.post;
        end;

        //if contribipi then
        if (qryCalculosProdutostipo.AsString = 'TOTAL IPI') and
           (((abs(qrynotafiscal.fieldbyname('valornota').ascurrency - qryCalculosProdutostotal.AsCurrency) >= vdiferenca) and (not IncluidoViaXml and not IncluindoViaXml)) OR
            ((abs(qrynotafiscal.fieldbyname('valornota').ascurrency - qryCalculosProdutostotal.AsCurrency) > vdiferenca) and (IncluidoViaXml or IncluindoViaXml))) then
          begin
            qryDiferencas.Append;
            qryDiferencas.FieldByName('descricao').AsString := 'Fechamento dos cálculos do IPI';
            qryDiferencas.FieldByName('valornota').AsCurrency := qrynotafiscal.fieldbyname('valornota').ascurrency;
            qryDiferencas.FieldByName('valorcalculado').AsCurrency := qryCalculosProdutostotal.AsCurrency;
            qryDiferencas.FieldByName('diferenca').AsCurrency := qrynotafiscal.fieldbyname('valornota').ascurrency - qryCalculosProdutostotal.AsCurrency;
            qryDiferencas.post;
          end;

        if contribiss then
          if (qryCalculosProdutostipo.AsString = 'TOTAL ISS') and
             (((abs(qrynotafiscal.fieldbyname('valornota').ascurrency - qryCalculosProdutostotal.AsCurrency) >= vdiferenca) and (not IncluidoViaXml and not IncluindoViaXml)) OR
              ((abs(qrynotafiscal.fieldbyname('valornota').ascurrency - qryCalculosProdutostotal.AsCurrency) > vdiferenca) and (IncluidoViaXml or IncluindoViaXml))) then

          begin
            qryDiferencas.Append;
            qryDiferencas.FieldByName('descricao').AsString := 'Fechamento dos cálculos do ISS';
            qryDiferencas.FieldByName('valornota').AsCurrency := qrynotafiscal.fieldbyname('valornota').ascurrency;
            qryDiferencas.FieldByName('valorcalculado').AsCurrency := qryCalculosProdutostotal.AsCurrency;
            qryDiferencas.FieldByName('diferenca').AsCurrency := qrynotafiscal.fieldbyname('valornota').ascurrency - qryCalculosProdutostotal.AsCurrency;
            qryDiferencas.post;
          end;

        qryCalculosProdutos.next;
      end;

      if qryDiferencas.RecordCount > 0 then
      begin
        frmMensagemGrid := TfrmMensagemGrid.Create(frmMensagemGrid);
        frmMensagemGrid.Caption := 'Mensagem de erro';
        frmMensagemGrid.lblTitulo.Caption := 'DIFERENÇAS NOS CÁLCULOS DOS IMPOSTOS!';
        frmMensagemGrid.lblTExto.Caption := 'Verifique no quadro abaixo as diferenças entre os valor da Nota Fiscal e os valores calculados nos impostos.';
        frmMensagemGrid.dbgMensagem.DataSource := dsrDiferencas;

        result  := false;
        frmMensagemGrid.ShowModal;
        frmMensagemGrid.Free;

      end

    end;
  end;

end;


function TdtmCadastroNotasFiscais.VerificarPedido(Pedido: Integer): Boolean;
begin
  Result:= False;
  If Assigned(qrypedidos) then
    qryPedidos.Close;
  qryPedidos.MacroByName('NumeroPedido').AsString:= 'Where (numero in (' + inttostr(Pedido) + '))';
  qryPedidos.Open;

  if qryPedidos.RecordCount > 0 then
  begin
    if qryPedidossituacao.AsString = 'A' then
    begin
      if not Assigned(qryDuplicatas) then
        RefazConsultaPorNome(qryDuplicatas,['documentopag'],[qryNotaFiscaldocumentopag.AsInteger]);
      if qryDuplicatas.IsEmpty then
        Result:= True;
    end;
  end;
end;

function TdtmCadastroNotasFiscais.ValidarDeclaracao: boolean;
begin
  result := true;
  RefazConsultaPorNome(qrynotaspagdeclaracao, ['ndi'],[qryDadosImportacoesnumero.AsVariant]);
  if qryNotasPagDeclaracaocodigo.AsInteger <> qryNotaFiscalcodigo.AsInteger then
  begin
    result := false;
    MensagemErro('Esta declaração já está cadastrada na nota fiscal: '+
                  'Fornec.: ' + qryNotasPagDeclaracaofornecedor.AsString+' '+#10#13+
                  'Série: ' + qryNotasPagDeclaracaoserie.AsString+' '+#10#13+
                  'Número: ' + qryNotasPagDeclaracaonumero.AsString);
    qryDadosImportacoes.Cancel;
  end;
end;

function TdtmCadastroNotasFiscais.IncluirNotaSaida: Boolean;
begin
  qryConsultadadosFiscais.Close;
  ReFazConsulta(qryConsultadadosFiscais,[0,1,2],[FilialBase,SerieSugestao,0]);
end;

function TdtmCadastroNotasFiscais.IncluirNotaEntrada: Boolean;
begin
  SomenteLeitura := false;

  ReFazConsultapornome(qryProdutosNotaFiscal, ['codigo'], [0]);

  qryNotaFiscal.Insert;
  qryNotaFiscalpermitirimprimir.AsBoolean := True;
  qryNotaFiscalsituacao.AsString          := 'N';
  qryNotaFiscalfornecedor.AsInteger       := qryProcuraFornecedorescodigo.AsInteger;
  qryNotaFiscalcnpj.AsString              := qryProcuraFornecedorespessoanumero.AsString;
  qryNotaFiscalestrangeiro.asBoolean      := qryProcuraFornecedoresestrangeiro.AsBoolean;

  qryNotaFiscalinscricaoestadual.AsString := qryProcuraFornecedoresinscricaoestadual.AsString;
  qryNotaFiscaltipofornecedor.AsString    := qryProcuraFornecedorestipo.AsString;
  qryNotaFiscalnosimples.AsBoolean        := qryProcuraFornecedoresnosimples.AsBoolean;
  qrynotafiscalcrt.asinteger              := crt;
  qryNotaFiscaldistribuidor.AsBoolean     := qryProcuraFornecedoresdistribuidor.AsBoolean;
  qryNotaFiscalestado.AsString            := qryProcuraFornecedoresestado.AsString;
  qryNotaFiscalserie.Required             := false;
  qryNotaFiscalnrdocumento.Required       := false;

  if qryNotaFiscalpermitirimprimir.AsBoolean then
  begin
    qryNotaFiscalmodelodocto.AsString := ModeloDoctoFiscal;
//    qryNotaFiscalclientecontribicms.AsBoolean := contribicms;  //neste caso é a própria empresa;
  end
{  else
    qryNotaFiscalclientecontribicms.AsBoolean := false};

  qryNotaFiscalmodelodocto.Required       := false;
  Result := True;
end;



function TdtmCadastroNotasFiscais.IncluirProdutosDoPedido:Boolean;
var Pedido: integer;
var Qtdade: Currency;
begin
  if qryProdutosNotaFiscal.Active then
  begin

   Pedido := qryProdutosNotaFiscalpedido.AsInteger;
   if Pedido > 0 then
   begin
      FViaPedido:= True;
      qryProdutosNotaFiscal.AfterScroll := nil;
      qryProdutosNotaFiscal.DisableControls;
//      qryProdutosNotaFiscalproduto.OnChange := nil;
      dsrProdutosnotafiscal.OnDataChange := nil;
      AbreTabelaConsultaProdutosNotaFiscal(False, True, false);

      try
         qryProdutosNotaFiscal.Cancel;
         qryConsultaProdutosNotaFiscal.First;
         while not qryConsultaProdutosNotaFiscal.Eof do
         begin
            if not qryProdutosNotaFiscal.Locate('produto', qryConsultaProdutosNotaFiscalcodigo.AsString, []) then
            begin
               qryprodutosnotafiscal.AfterInsert := nil;
               QtdadeAnterior := 0;
               qryProdutosNotaFiscal.Append;
               qryProdutosNotaFiscalpedido.        AsInteger := Pedido;
               qryProdutosNotaFiscalnumeroprodutotabela.asinteger := qryConsultaProdutosNotaFiscalnumeroprodutotabela.asinteger;
               dsrProdutosNotaFiscalDataChange(qryProdutosNotaFiscal, qryProdutosNotaFiscalnumeroprodutotabela);

               qryProdutosNotaFiscalprodutook.AsBoolean := true;

               SelecionarProdutoNotaFiscal;

               PostProdutosNotaFiscal;
               qryprodutosnotafiscal.AfterInsert := qryProdutosNotaFiscalAfterInsert;

//               AtualizarQuantidadeNaoRecebida(True);

            end;
            qryConsultaProdutosNotaFiscal.Next;
         end;
         NumeroPedido:= Pedido;
      finally
        FechaTabelaConsultaProdutosNotaFiscal;
        FViaPedido:= False;
        if parsistema.PermitirGravacaoNFEParcial then
        begin
          try
            DesabilitarControles(true);
            qryProdutosNotaFiscal.First;
            while not qryProdutosNotaFiscal.eof do
            begin
              if qryProdutosNotaFiscalpedido.AsInteger = Pedido then
              begin
                if gravarnotaparcial then
                begin
                   qrynotafiscal.Edit;
                   qryProdutosNotaFiscal.AfterScroll := nil;
                   break;
                end;
              end;
              qryProdutosNotaFiscal.Next;
            end;
          finally
            DesabilitarControles(false);
          end;

        end;
        AtualizaSQLProdutosExistenteNotas;
        CalcularImpostos;
//        CalcularValorTotalProdutos;
        PreencherDuplicatas(Pedido);
//        qryProdutosNotaFiscalproduto.OnChange := qryProdutosNotaFiscalprodutoChange;
        qryProdutosNotaFiscal.AfterScroll     := qryProdutosNotaFiscalAfterScroll;
        dsrProdutosnotafiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
        qryProdutosNotaFiscal.EnableControls;
      end;
   end;
   Result := True;
  end;
end;

function TdtmCadastroNotasFiscais.IncluirProdutosNotaFiscal(Editar:Boolean): Boolean;
var
  Anterior: Boolean;
  vRecnoProduto_ : integer;
begin
  qryProdutosNotaFiscal.AfterInsert := nil;
  if qryProdutosNotaFiscal.State = dsEdit then
     qryProdutosNotaFiscal.Cancel;

{
  if (qryProcuraProdutoNotaFiscal.MacroByName('SQLporPedido').AsString <> '') or
     (qryProcuraProdutoNotaFiscal.MacroByName('SQLPedido').AsString <> '') then
  begin
    qryProcuraProdutoNotaFiscal.MacroByName('SQLporPedido').AsString := '';
    qryProcuraProdutoNotaFiscal.MacroByName('SQLPedido').AsString := '';
    qryProcuraProdutoNotaFiscal.Close;
  end;
}

  qryProdutosNotaFiscalAfterScroll(qryProdutosNotaFiscal);

  EditarNotaFiscal;
  OpenClientDataSetProdutosNotaFiscal(CDSProdutosNotaFiscalAux, Open_and_Close);

  if not qryProdutosNotaFiscal.IsEmpty and Editar then
  begin
//    qryProdutosNotaFiscal.Edit;
  end
  else begin
    Anterior := ExecutarScrollTabelaProdutos;
    ExecutarScrollTabelaProdutos := False;
    dsrProdutosnotafiscal.OnDataChange := nil;
    qryProdutosNotaFiscal.Append;
{    AcertarCasasDecimais(qryProdutosNotaFiscalprecounitario);}
    dsrProdutosnotafiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    ExecutarScrollTabelaProdutos := Anterior;
  end;
  qryProdutosNotaFiscal.AfterInsert :=   qryProdutosNotaFiscalAfterInsert;

  State_qryProdutosNotaFiscal := qryProdutosNotaFiscal.state;


  Result := True
end;

procedure TdtmCadastroNotasFiscais.LimparDetalhesNotaFiscal(Tudo: Boolean);
begin
  if Tudo then
    ReFazConsulta(qryNotaFiscal, [0,1,2,3], [0,'',0,'']);
  ReFazConsultapornome(qryProdutosNotaFiscal, ['preconormal','codigo'], [0,0]);

  ReFazConsulta(qryProdutosNotasPagNFE, [0], [0]);
  ReFazConsulta(qryProdutosNotasPagNFELotes, [0], [0]);

  ReFazConsulta(qryProdutosNotasPagNFEItems, [0], [0]);
  ReFazConsulta(qryProdutosNotasPagNFEItemsSituacao, [0], [0]);

  ReFazConsulta(qryDuplicatas, [0], [0]);
  ReFazConsulta(qryDocumentoPag,[0],[0]);
  ReFazConsulta(qryDocumentosPagImpostosRetidos,[0],[0]);
  if ParSistema.GeracaoAutomaticadoImpostoRetido then
    ReFazConsulta(qryVenctosImpostosRetidosEntradas, [0], [filialbase]);
  ReFazConsulta(qryDuplicatasImpostosRetidos,[0],[0]);
{  ReFazConsulta(dtmGerarNotaFiscal.qryCalculosNotasPag, [0], [0]);}

  ReFazConsulta(qryConhecimentoFrete, [0, 1, 2, 3], [0, '0', 0, 0]);
  {
  while T_Lista.Count > 0 do begin
    TtecQuantidadePorProdutoPedido(T_Lista.First).Free;
    T_Lista.Delete(0);
  end;
  }

  FImportacao := False;
  ReFazConsulta(qryDadosImportacoes,[0],[0]);
{  ReFazConsulta(qryAdicoesImportacao,[0],[0]);
  ReFazConsulta(qryProdutosImportados,[0],[0]);}
end;


function TdtmCadastroNotasFiscais.PermitirExcluirNotaFiscal: Boolean;
var
  Pos: TBookmark;
  vDataHora : TDateTime;

begin
  qryDuplicatas.DisableControls;
  Pos := qryDuplicatas.GetBookmark;
  Result := True;

  try
    qryDuplicatas.First;
    while Not qryDuplicatas.Eof do begin
      if Not qryDuplicatasdatapagto.IsNull then begin
        Result := False;
        break
      end else
        qryDuplicatas.Next;
    end
  finally
    qryDuplicatas.GotoBookmark(Pos);
    qryDuplicatas.FreeBookmark(Pos);
    qryDuplicatas.EnableControls
  end;

  if not Result then
    MensagemAviso(ctNOTAENTRADADUPLICATASQUITADAS)
  else
    if ParSistema.DataContabil > qryNotaFiscaldata.AsDateTime then
    begin
      Result := False;
      MensagemAviso('Esta nota não pode ser excluida.'+#10#13+
                     Format(ctDATACONTABILMAIORDATALANCTO, ['de lançamento',
                            datetostr(qryNotaFiscaldata.AsDateTime),
                            'contábil',
                            datetostr(ParSistema.DataContabil)]));
    end
    else
    if NotaCancelada then
    begin
      Result := false;
      MensagemAviso('A nota fiscal está na situação cancelada.');
    end
    else
    if ExisteQuitacaoImpostosRetidosDuplicatas then
    begin
      Result := false;
      MensagemAviso('Existe quitação de impostos retidos nas duplicatas.');
    end
    else
    if ExisteQuitacaoImpostosRetidosNotas then
    begin
      Result := false;
      MensagemAviso('Existe quitação de impostos retidos nesta nota.');
    end
    else
    begin
      ReFazConsulta(qryExisteDuplicataPagas, [0,1,2], [qryNotaFiscalfornecedorconhecimentofrete.AsInteger,
                                                     qryNotaFiscalserieconhecimentofrete.AsString,
                                                     qryNotaFiscalnumeroconhecimentofrete.AsInteger]);
      if qryExisteDuplicataPagassim.AsBoolean then
      begin
        Result := False;
        MensagemAviso(ctNOTAENTRADADUPLICATASFRETEQUITADAS)
      end;
    end;

    if result then
    begin
      if qryNotaFiscalpermitirimprimir.AsBoolean and
         CondicaoEmissorNfe and
         (qryNotaFiscalnumprotocolonfe.AsString <> '') then
      begin
        if not qryNotaFiscaldhprocnfe.IsNull then
          vDataHora := qryNotaFiscaldhprocnfe.AsDateTime
        else
          vDataHora := qryNotaFiscaldatahoraemissao.AsDateTime;

        if (SecondsBetween(vDataHora, now) > (parsistema.LimitedediasparacancelamentodaNFE*24*60*60)) then
        begin
          result := false;
          MensagemAviso( 'A data para o cancelamento da NFE expirou em '+FormatDateTime('dd/mm/yyyy hh:nn:ss', (vdatahora+parsistema.LimitedediasparacancelamentodaNFE)));
        end;
      end;
    end;

    if result then
    begin
      if {((CodigoFiscal mod 1000) = ctDEVOLUCAO) and} not  qryNotaFiscalcontrato.IsNull then
      begin
        RefazConsultaPorNome(qryParcelas, ['contrato'], [qryNotaFiscalcontrato.AsString]);
        { Todas as parcelas devem ser do tipopagto = E }
        qryparcelas.first;
        while not qryparcelas.Eof do
        begin
          if qryParcelastipopagto.AsString <> 'E' then
          begin
            result := false;
            break;
          end;
          qryparcelas.Next;
        end;

        if not result then
          MensagemAviso(format('Existem parcelas quitadas no contrato %s vinculado a esta nota de devolução',[qryNotaFiscalcontrato.AsString]))
        else
        begin
          RefazConsultaPorNome(qryProdutosContratos,['contrato'],[qryNotaFiscalcontrato.AsString]);
          qryProdutosContratos.First;
          while not qryProdutosContratos.Eof do
          begin
            if (qryProdutosContratosquantidade.AsFloat <> qryProdutosContratoscancelado.AsCurrency) then
            begin
              result := false;
              break;
            end;
            qryProdutosContratos.Next;
          end;

          if not result then
            MensagemAviso(format('Existe diferença entre a quantidade vendida e cancelada no contrato %s e produto %s vinculado a esta nota de devolução',
              [qryNotaFiscalcontrato.AsString, qryprodutoscontratosproduto.asstring]))
          else
          begin
            RefazConsultaPorNome(qryServicosContratos,['contrato'],[qryNotaFiscalcontrato.AsString]);
            qryServicosContratos.First;
            while not qryServicosContratos.Eof do
            begin
              if (qryServicosContratosquantidade.Asinteger <> qryServicosContratoscancelado.AsInteger) then
              begin
                result := false;
                break;
              end;
              qryServicosContratos.Next;
            end;
          end;

          if not result then
            MensagemAviso(format('Existe diferença entre a quantidade vendida e cancelada no contrato %s e servico %s',
              [qryNotaFiscalcontrato.AsString, qryServicoscontratosservico.asstring]))
          else
          begin

            if qryProdutosNotaFiscal.Active then
            begin

              qryProdutosContratos.First;
              while not qryProdutosContratos.Eof do
              begin
                if not qryProdutosNotaFiscal.Locate('produto', qryProdutosContratosproduto.AsString,[]) then
                begin
                  result := false;
                  MensagemAviso(format('O produto %s do contrato %s não foi encontrado nesta nota de devolução.',
                    [qryprodutoscontratosproduto.asstring, qryNotaFiscalcontrato.AsString]));
                  break;
                end
                else
                if (qryProdutosContratosquantidade.AsFloat <> qryProdutosNotaFiscalquantidade.AsFloat) then
                begin
                  result := false;
                  MensagemAviso(format('Existe diferença entre a quantidade da nota fiscal de devolução e a vendida no contrato %s para o produto %s',
                    [qryNotaFiscalcontrato.AsString, qryprodutoscontratosproduto.asstring]));
                  break;
                end;
                qryProdutosContratos.Next;
              end;
            end;


          end;
        end;

        if result then
        begin
          RefazConsultaPorNome(qryContratosDevolvidos,['contrato'],[qryNotaFiscalcontrato.AsString]);
          qryContratosDevolvidos.First;
          while not qryContratosDevolvidos.eof do
          begin
            if qryContratosDevolvidostipo.AsString = 'T' then
            begin
              result := false;
              MensagemAviso(format('O contrato %s possue devoluções do tipo ''TROCA''',
                  [qryContratosDevolvidoscontrato.AsString]));
                break;
            end;
            qryContratosDevolvidos.next;
          end;
        end;

      end;
    end;

end;


function TdtmCadastroNotasFiscais.PosicionarFornecedor: Boolean;
begin
  Result := ExisteFornecedor(qryProcuraFornecedorescodigo.FieldName,
                             qryProcuraFornecedorescodigo.AsString)
end;

procedure TdtmCadastroNotasFiscais.PosicionarNotaFiscal;
begin
  ReFazConsulta(qryConsultaNotasFiscais, [0, 1], [qryConsultaFornecedorescodigo.AsInteger,
                                                  qryConsultaSeriesFornecedorserie.AsString]);
end;

function TdtmCadastroNotasFiscais.PosicionarSerieFornecedor: Boolean;
begin
  ReFazConsulta(qryConsultaSeriesFornecedor, [0,1], [qryConsultaFornecedorescodigo.AsInteger,
                                                     qryConsultaFornecedorestipoorignal.AsString]);
  Result := qryConsultaSeriesFornecedor.RecordCount > 0;
end;

function TdtmCadastroNotasFiscais.ProdutosNotaMesmoPedido(var Pedido: Integer): Integer;
var
  PedidoAnt,
  c : Integer;
begin
  Pedido:=0; PedidoAnt:=0; c:=0;
  GuardarRegistroAtual(qryProdutosNotaFiscal,true);
  DesabilitarControles(true);
  try
    qryProdutosNotaFiscal.First;
    while not qryProdutosNotaFiscal.Eof do
    begin
      Pedido := qryProdutosNotaFiscalpedido.AsInteger;
      if (Pedido <> PedidoAnt) or ((Pedido = 0) and (PedidoAnt = 0)) then
      begin
        PedidoAnt := Pedido;
        Inc(c);
      end;
      qryProdutosNotaFiscal.Next;
    end;
  finally
    VoltarRegistroAtual(qryProdutosNotaFiscal);
    DesabilitarControles(false);
  end;
  if c = 1 then
    Result := Pedido
  else
    Result := 0;
end;

procedure TdtmCadastroNotasFiscais.qryDetalhesNotaFiscalBefore(DataSet: TDataSet);
begin
  inherited;
  EditarNotaFiscal;
end;

procedure TdtmCadastroNotasFiscais.qryConhecimentoFreteAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if qryConhecimentoFrete.RecordCount <> 0 then
    SelecionarConhecimentoFrete;
end;

procedure TdtmCadastroNotasFiscais.qryDuplicatasNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryDuplicatastipojuros.AsString := '%';
  qryDuplicatastipomulta.AsString := '%';
  qryDuplicatasjaquitada.AsBoolean := False;
  qryDuplicatasdda.asBoolean := qryProcuraFornecedoresdda.asBoolean;
end;

procedure TdtmCadastroNotasFiscais.qryNotaFiscalNewRecord(DataSet: TDataSet);
begin
  inherited;


  ReFazConsulta(spcNotaFiscal, [], []);
  qryNotaFiscalcodigo.AsInteger := spcNotaFiscalproximocodigo.AsInteger;

  qryNotaFiscalserie.Required       := true;
  qryNotaFiscalnrdocumento.Required := true;
  qryNotaFiscalmodelodocto.Required := true;

//  qryProcuraNaturezas.Sql[12] := '(inativo is null) and ';
  qryProcuraNaturezas.MacroByName('WhereInativo').asstring := ' and (naturezas.inativo is null)';
  qryConsultaNaturezas.MacroByName('CodigoFiscal').AsString := '';
//  qryProcuraHistorico.Sql[4]  := '(h.inativo is null) and ';
  qryNotaFiscaltipofornecedor.AsString    := qryProcuraFornecedorestipo.AsString;
  qryNotaFiscalclientecontribicms.AsBoolean := qryProcuraFornecedorescontribicms.asboolean;
  qryNotaFiscaldistribuidor.AsBoolean     := qryProcuraFornecedoresdistribuidor.AsBoolean;
  qryNotaFiscalfilial.AsInteger           := FilialBase_Entrada;
  qryNotaFiscalestado.AsString            := qryProcuraFornecedoresestado.AsString;
  qryNotaFiscalEmissao.AsDateTime         := DataServidor;
  qryNotaFiscaldata.AsDateTime      := DataServidor;
  qryNotaFiscalicmsfrete.ascurrency       := ICMSFrete;
  qryNotaFiscalicmsseguro.ascurrency      := ICMSSeguro;
  qryNotaFiscalpermitirimprimir.AsBoolean := False;
  qryNotaFiscalfrete.AsString             := '1';
  qryNotaFiscalviatransporte.AsString     := 'R';
  if (ParSistema.PermitirGravacaoNFEParcial) then
    qryNotaFiscalsituacao.AsString := 'P'
  else
    qryNotaFiscalsituacao.AsString := 'N';

  if ParSistema.CNPJOpcionalNFEntrada then
    qryNotaFiscalcnpj.AsString            := qryProcuraFornecedorespessoanumero.AsString;

  qryNotaFiscalestrangeiro.asBoolean      := qryProcuraFornecedoresestrangeiro.AsBoolean;
  qryNotaFiscalinscricaoestadual.AsString := qryProcuraFornecedoresinscricaoestadual.AsString;
  qryNotaFiscalregimetributario.AsInteger := regimetributario;

  qryNotaFiscalnosimples.AsBoolean := false;
  qryNotaFiscalnosimples.AsBoolean        := qryProcuraFornecedoresnosimples.AsBoolean;
  qrynotafiscalcrt.asinteger              := crt;
  qryNotaFiscaldistribuidor.AsBoolean     := qryProcuraFornecedoresdistribuidor.AsBoolean;
  qryNotaFiscalcnpj_filial.AsString       := CNPJFilialBase_Entrada;

  qryNotaFiscalfinalidadenf.AsInteger  := 1;
//  qryNotaFiscalnumeroregistrodescontoalterado.asinteger := 0;
//  qryNotaFiscalnumeroregistrofretealterado.asinteger := 0;

  qryNotaFiscalcancelamentonfforaprazolegal.asboolean := false;
  qryNotaFiscaldataselecaoprodutosgrade.asDatetime := DataServidor;

  LimparDetalhesNotaFiscal(False);




end;

procedure TdtmCadastroNotasFiscais.qryProcuraFornecConhecFreteAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryProcuraSerieFornecConFrete, [0], [qryProcuraFornecConhecFretecodigo.AsInteger]);
end;

procedure TdtmCadastroNotasFiscais.qryProcuraFornecedoresAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if qryNotaFiscal.State = dsInsert then begin
    qryNotaFiscaltipofornecedor.AsString := qryProcuraFornecedorestipo.AsString;
    qryNotaFiscalfornecedor.AsInteger    := qryProcuraFornecedorescodigo.AsInteger;
    qryNotaFiscalnome.AsString           := qryProcuraFornecedoresnome.AsString;

{    qryNotaFiscalnome.AsString           := qryProcuraFornecedoresrazao.AsString;}

    qryNotaFiscaldistribuidor.AsBoolean  := qryProcuraFornecedoresdistribuidor.AsBoolean;
    qryNotaFiscalcrt.AsInteger           := qryProcuraFornecedorescrt.asinteger {crt};
  end;

  if qryNotaFiscal.State in [dsEdit, dsInsert] then
  begin

    qryNotaFiscalfoneddd.Asvariant         := qryProcuraFornecedoresfoneddd.AsVariant;
    qryNotaFiscalfonenumero.AsVariant      := qryProcuraFornecedoresfonenumero.AsVariant;
    qryNotaFiscalclientecontribicms.AsBoolean := qryProcuraFornecedorescontribicms.asboolean;

    if qryProcuraFornecedoresestado.AsString = '.' then {estrangeiro}
    begin
      qryNotaFiscalpais.asstring           := qryProcuraFornecedorescidadeibge.asstring;
      qryNotaFiscalnomepais.AsString       := qryProcuraFornecedoresnomecidade.AsString;
      qryNotaFiscalrua.AsString            := qryProcuraFornecedoresrua.AsString;
      qryNotaFiscalendnumero.AsString      := qryProcuraFornecedoresnumero.AsString;
      qryNotaFiscalendcomplemento.AsString := qryProcuraFornecedorescomplemento.AsString;
      qryNotaFiscalcidade.AsString         := qryProcuraFornecedoresbairro.AsString;
      qryNotaFiscalnomecidade.AsString     := qryProcuraFornecedoresnomebairro.AsString;
      qryNotaFiscalestado.AsString         := qryProcuraFornecedoresestado.AsString;
      qrynotafiscalsuframa.asString        := qryProcuraFornecedoressuframa.asString;

      qryNotaFiscalbairro.clear;
      qryNotaFiscalnomebairro.clear;
    end
    else
    begin
      qryNotaFiscalpais.AsInteger          := 1058;
      qryNotaFiscalnomepais.AsString       := 'Brasil';
      qryNotaFiscalrua.AsString            := qryProcuraFornecedoresrua.AsString;
      qryNotaFiscalendnumero.AsString      := qryProcuraFornecedoresnumero.AsString;
      qryNotaFiscalendcomplemento.AsString := qryProcuraFornecedorescomplemento.AsString;
      qryNotaFiscalbairro.AsString         := qryProcuraFornecedoresbairro.AsString;
      qryNotaFiscalnomebairro.AsString     := qryProcuraFornecedoresnomebairro.AsString;
      qryNotaFiscalcidade.AsString         := qryProcuraFornecedorescidade.AsString;
      qryNotaFiscalnomecidade.AsString     := qryProcuraFornecedoresnomecidade.AsString;
      qryNotaFiscalcidadeibge.AsString     := qryProcuraFornecedorescidadeibge.AsString;
      qryNotaFiscalestado.AsString         := qryProcuraFornecedoresestado.AsString;
      qryNotaFiscalcep.Asstring            := qryProcuraFornecedorescep.AsString;
      qrynotafiscalsuframa.asString        := qryProcuraFornecedoressuframa.asString;
    end;
  end;

  qryProcuraFiliais.Params[1].AsInteger := qryProcuraFornecedorescodigo.AsInteger;
  qryProcuraFiliais.Params[2].AsString := qryProcuraFornecedorestipo.AsString;
  qryConsultaFiliais.Params[0].AsInteger := qryProcuraFornecedorescodigo.AsInteger;
  qryConsultaFiliais.Params[1].AsString := qryProcuraFornecedorestipo.AsString;

  qryProcuraSerieFiliais.Params[2].AsInteger := qryProcuraFornecedorescodigo.AsInteger;
  qryProcuraSerieFiliais.Params[3].AsString := qryProcuraFornecedorestipo.AsString;
  qryConsultaSeriesFiliais.Params[1].AsInteger := qryProcuraFornecedorescodigo.AsInteger;
  qryConsultaSeriesFiliais.Params[2].AsString := qryProcuraFornecedorestipo.AsString;

  qryProcuraNotaFiscalProdutos.Params[3].AsInteger := qryProcuraFornecedorescodigo.AsInteger;
  qryProcuraNotaFiscalProdutos.Params[4].ASstring := qryProcuraFornecedorestipo.AsString;
  qryConsultaNotaFiscalProdutos.Params[2].AsInteger := qryProcuraFornecedorescodigo.AsInteger;
  qryConsultaNotaFiscalProdutos.Params[3].ASstring := qryProcuraFornecedorestipo.AsString;

  if qryProcuraFornecedoresestado.AsString = EstadoFilialBase then
  begin
    qryConsultaNaturezas.Params[0].AsString := 'L';
    qryProcuraNaturezas.Params[0].AsString  := 'L';
    qryProcuraNaturezasProduto.Params[0].AsString  := 'L';
    qryProcuraNaturezasProdutonfe.Params[0].AsString  := 'L';

  end else if HeUnidadeFederacao(qryProcuraFornecedoresestado.AsString) then
  begin
    qryConsultaNaturezas.Params[0].AsString := 'F';
    qryProcuraNaturezas.Params[0].AsString  := 'F';
    qryProcuraNaturezasProduto.Params[0].AsString  := 'F';
    qryProcuraNaturezasProdutonfe.Params[0].AsString  := 'F';

  end else
  begin
    qryConsultaNaturezas.Params[0].AsString := 'E';
    qryProcuraNaturezas.Params[0].AsString  := 'E';
    qryProcuraNaturezasProduto.Params[0].AsString  := 'E';
    qryProcuraNaturezasProdutonfe.Params[0].AsString  := 'E';

  end;
  if qryProcuraFornecedorestipo.AsString = 'F' then begin
    if qryNotaFiscal.State in [dsEdit, dsInsert] then
    begin
      if ParSistema.CNPJOpcionalNFEntrada then
        qryNotaFiscalcnpj.AsString                      := qryProcuraFornecedorespessoanumero.AsString;

      qryNotaFiscalestrangeiro.asBoolean      := qryProcuraFornecedoresestrangeiro.AsBoolean;
      qryNotaFiscalinscricaoestadual.AsString         := qryProcuraFornecedoresinscricaoestadual.AsString;
    end;

    qryProcuraSeriesFornecedor.Parambyname('fornecedor').AsInteger  := qryProcuraFornecedorescodigo.AsInteger;
    qryConsultaSeriesFornecedor.Params[0].AsInteger := qryProcuraFornecedorescodigo.AsInteger;

    qryProcuraSeriesFornecedor.Parambyname('tipo').AsString   := 'F';
    qryConsultaSeriesFornecedor.Params[1].AsString  := 'F';
  end
  else
  if qryProcuraFornecedorestipo.AsString = 'C' then begin
    if qryNotaFiscal.State in [dsEdit, dsInsert] then
    begin
      if ParSistema.CNPJOpcionalNFEntrada then
        qryNotaFiscalcnpj.AsString                      := qryProcuraFornecedorespessoanumero.AsString;
        
      qryNotaFiscalestrangeiro.asBoolean      := qryProcuraFornecedoresestrangeiro.AsBoolean;
      qryNotaFiscalinscricaoestadual.AsString         := qryProcuraFornecedoresinscricaoestadual.AsString;
    end;
    qryProcuraSeriesFornecedor.Parambyname('fornecedor').AsInteger  := qryProcuraFornecedorescodigo.AsInteger;
    qryConsultaSeriesFornecedor.Params[0].AsInteger := qryProcuraFornecedorescodigo.AsInteger;
    qryProcuraSeriesFornecedor.Parambyname('tipo').AsString   := 'C';
    qryConsultaSeriesFornecedor.Params[1].AsString  := 'C';
  end else if qryProcuraFornecedorestipo.AsString = 'L' then begin
    if qryNotaFiscal.State in [dsEdit, dsInsert] then begin
      if ParSistema.CNPJOpcionalNFEntrada then
        qryNotaFiscalcnpj.AsString                      := qryProcuraFornecedorespessoanumero.AsString;

      qryNotaFiscalestrangeiro.asBoolean      := qryProcuraFornecedoresestrangeiro.AsBoolean;
      qryNotaFiscalinscricaoestadual.AsString         := qryProcuraFornecedoresinscricaoestadual.AsString;
    end;
    qryProcuraSeriesFornecedor.Parambyname('fornecedor').AsInteger  := qryProcuraFornecedorescodigo.AsInteger;
    qryConsultaSeriesFornecedor.Params[0].AsInteger := qryProcuraFornecedorescodigo.AsInteger;
    qryProcuraSeriesFornecedor.Parambyname('tipo').AsString   := 'L';
    qryConsultaSeriesFornecedor.Params[1].AsString  := 'L';
  end;
  qryNotaFiscal.Params[3].AsString := qryProcuraFornecedorestipo.AsString;

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotaFiscalAfterDelete(DataSet: TDataSet);
begin
  inherited;
//  CalcularImpostos;
//  CalcularValorTotalProdutos;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotaFiscalBeforeDelete(DataSet: TDataSet);
begin
  inherited;
//  AtualizarQuantidadeNaoRecebida(False);
  qryNotaFiscalTotalQtdeProdutos.AsCurrency :=  qryNotaFiscalTotalQtdeProdutos.AsCurrency - qryProdutosNotaFiscalquantidade.AsFloat;
end;

procedure TdtmCadastroNotasFiscais.qryProcuraNaturezasAfterScroll(DataSet: TDataSet);
begin
  inherited;
//  qryNotaFiscalnatureza.AsString := qryProcuraNaturezasdescricao.AsString
  VisualizarNFSaidas;
end;

procedure TdtmCadastroNotasFiscais.qryProcuraNaturezasBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  qryProcuraNaturezasdescricao.Size := 80;

  if CodigoFiscalAnterior = 0 then
    CodigoFiscalAnterior := qryNotaFiscalcodigofiscal.AsInteger;
  if not qryConsultaNaturezas.Active then
    if not ((qryProcuraNaturezas.ParamByName('codigofiscal').Asinteger = 1353) or
            (qryProcuraNaturezas.ParamByName('codigofiscal').Asinteger = 2353)) then
      qryProcuraNaturezas.MacroByName('CodigoNaturezaPadrao').AsString := '';

  if pos(inttostr(CodigoFiscalAuxiliar), qryProcuraNaturezas.params[1].asstring)=0 then
    qryProcuraNaturezas.MacroByName('CodigoNaturezaPadrao').AsString := '';

  if (qryNotaFiscalcodigonatureza.AsInteger <> 0) and
     (qryProcuraNaturezas.Params[1].AsInteger = qryNotaFiscalcodigofiscal.asinteger) then
    qryProcuraNaturezas.MacroByName('CodigoNaturezaPadrao').AsString := ' and (naturezas.codigo = ' + IntToStr(qryNotaFiscalcodigonatureza.AsInteger) + ') ';

  qryProcuraNaturezas.paramByName('finalidade').AsInteger := qryNotaFiscalfinalidadenf.AsInteger;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotaFiscalAfterScroll(DataSet: TDataSet);
begin
  inherited;

  if ExecutarScrollTabelaProdutos and not FViaPedido and not FViaNota Then
  begin
    ReFazConsulta(qryProcuraNaturezasProduto,[],[]);

    ReFazConsultapornome(qryProcuraNotaFiscalProdutos, ['filial','serie','numero'],
        [qryProdutosNotaFiscalfilialnotafiscalsaida.AsInteger,
         qryProdutosNotaFiscalserienotafiscalsaida.AsString,
         qryProdutosNotaFiscalnumeronotafiscalsaida.AsInteger]);
  end;

  if Assigned(OnScrollLinhaColunaGrade) then
    OnScrollLinhaColunaGrade(qryProdutosNotaFiscal);

  QtdadeAnterior := qryProdutosNotaFiscalqtdeestoque.AsFloat;

  FCodigoFiscalProdutoOriginal := qryProdutosNotaFiscalcodigofiscal.AsInteger;


  if not VisualizandoProdutosdaNFE and
     not fAtualizarCodigoFiscalProdutosNFE then
    PosicionarProdutosNFEPorProdutosNotaFiscal;



end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotaFiscalBeforeEdit(DataSet: TDataSet);
begin
  inherited;

//  RecalcularImpostos := true;
  qryDetalhesNotaFiscalBefore(qryNotaFiscal);
  vFatorConversaoPNPAntesEditar := qryProdutosNotaFiscalfatorconversao.AsFloat;
  vQtdeEstoquePNPAntesEditar := qryProdutosNotaFiscalqtdeestoque.asfloat;

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotaFiscalBeforeInsert(DataSet: TDataSet);
//  var vauxMasterSource : TDataSource;
begin
  inherited;

  ProdutosNotaFiscaldadofiscal :=  qryProdutosNotaFiscaldadofiscal.asinteger;
  ProdutosNotaFiscalfilialnotafiscalsaida := qryProdutosNotaFiscalfilialnotafiscalsaida.asinteger;
  ProdutosNotaFiscalserienotafiscalsaida := qryProdutosNotaFiscalserienotafiscalsaida.asstring;
  ProdutosNotaFiscalnumeronotafiscalsaida := qryProdutosNotaFiscalnumeronotafiscalsaida.asinteger;

//  vauxMasterSource  := qryProdutosNotaFiscal.mastersource;
//  qryProdutosNotaFiscal.mastersource := nil;

  qryProdutosNotaFiscal.SortByField('numero');
  qryProdutosNotaFiscal.Last;
  NroUltimoProdutoNota := qryProdutosNotaFiscalnumero.AsInteger;

//  qryProdutosNotaFiscal.mastersource := vauxMasterSource;

  qryDetalhesNotaFiscalBefore(qryNotaFiscal)
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotaFiscalNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryProdutosNotaFiscalCodigoNota.AsInteger := qryNotaFiscalcodigo.AsInteger;
  qryProdutosNotaFiscalnumero.AsInteger := NroUltimoProdutoNota + 1;
  qryProdutosNotaFiscalfilial.AsInteger := FilialBase_Entrada;
  qryProdutosNotaFiscalpermitiratualizar.AsBoolean := ParSistema.GerarPrecoAutomatico;
  qryProdutosNotaFiscalpermitiratualizardigitado.AsVariant := null;
  qryProdutosNotaFiscalquantidade.AsFloat := 0;

  qryProcuraNaturezasProduto.MacroByName('WhereInativo').asstring := ' and (naturezas.inativo is null)';
  qryConsultaNaturezas.MacroByName('CodigoFiscal').AsString := '';

  FCodigoFiscalProdutoOriginal                := 0;
  qryProdutosNotaFiscalnatureza.AsInteger     := qryNotaFiscalcodigonatureza.AsInteger;
  qryProdutosNotaFiscalgerarpagamento.AsBoolean := qryProcuraNaturezasgerarpagamento.AsBoolean;
  qryProdutosNotaFiscalcodigofiscal.AsInteger := qryNotaFiscalcodigofiscal.AsInteger;
  qryProdutosNotaFiscalnaogerarcreditoicms.AsBoolean := qryProcuraNaturezasnaogerarcreditoicms.AsBoolean;
  qryProdutosNotaFiscalnaogerarcreditoipi.AsBoolean := qryProcuraNaturezasnaogerarcreditoipi.AsBoolean;
  qryProdutosNotaFiscalicmssobreipi.AsBoolean := qryProcuraNaturezasicmssobreipi.AsBoolean;
  qryProdutosNotaFiscalicmssobredespesasacessorias.AsBoolean := qryProcuraNaturezasicmssobredespesasacessorias.AsBoolean;

  qryProdutosNotaFiscalnaocalcularipisobrefrete.AsBoolean := qryProcuraNaturezasnaocalcularipisobrefrete.AsBoolean;

  qryProdutosNotaFiscalenquadramento.AsInteger:= 999;
  FCodigoFiscalProdutoOriginal                := qryProdutosNotaFiscalcodigofiscal.AsInteger;

  qryProdutosNotaFiscal.FieldByName('valoricmsDigitado').AsBoolean := false;
  qryProdutosNotaFiscal.FieldByName('valoricmsstDigitado').AsBoolean := false;

//  qryProdutosNotaFiscal.FieldByName('valoricmsstDigitado').AsBoolean := false;
  qryProdutosNotaFiscal.FieldByName('valoripiDigitado').AsBoolean := false;
  qryProdutosNotaFiscal.FieldByName('icmsoutrasdigitado').AsBoolean := false;
//  qryProdutosNotaFiscalicmssobreipi.AsBoolean := false;

  qryProdutosNotaFiscalvalorpisdigitado.AsBoolean := false;
  qryProdutosNotaFiscalvalorcofinsdigitado.AsBoolean := false;


  {

  ==================================================================
  NOTA: Gedovar
  ==================================================================
  Acredito este ser o problema do zeramento dos campos de sequencia
  ocorrendo a duplicação quando importado via xml.
  O valor quando uma inclusão ja esta nulo.

  qryProdutosNotaFiscalnumerosequencianfe.clear;
  qryProdutosNotaFiscalnumerosequencianfeitens.clear;
  }

  qryProdutosNotaFiscaldescontodigitado.asboolean := false;
  qryProdutosNotaFiscalfretedigitado.asboolean := false;


  if ProdutosNotaFiscaldadofiscal <> 0 then
    qryProdutosNotaFiscaldadofiscal.asinteger := ProdutosNotaFiscaldadofiscal;

  if ProdutosNotaFiscalfilialnotafiscalsaida <> 0 then
    qryProdutosNotaFiscalfilialnotafiscalsaida.asinteger := ProdutosNotaFiscalfilialnotafiscalsaida;

  if ProdutosNotaFiscalserienotafiscalsaida <> '' then
    qryProdutosNotaFiscalserienotafiscalsaida.asstring := ProdutosNotaFiscalserienotafiscalsaida;

  if ProdutosNotaFiscalnumeronotafiscalsaida <> 0 then
    qryProdutosNotaFiscalnumeronotafiscalsaida.asinteger := ProdutosNotaFiscalnumeronotafiscalsaida;

  if ProdutosNotaFiscaldadofiscal <> 0 then
    ReFazConsultapornome(qryProcuraNotaFiscalProdutos, ['filial','serie','numero'],
        [qryProdutosNotaFiscalfilialnotafiscalsaida.AsInteger,
         qryProdutosNotaFiscalserienotafiscalsaida.AsString,
         qryProdutosNotaFiscalnumeronotafiscalsaida.AsInteger]);

  qryProdutosNotaFiscalfatorconversao.AsFloat := 1;


end;


procedure TdtmCadastroNotasFiscais.qryProdutosNotaFiscalprodutoChange(Sender: TField);
var
  Qtdade: Currency;
begin
  inherited;
  if {not FImportacao and}
     (qryProcuraProdutoNotaFiscal.recordcount = 1) and
     (qryProdutosNotaFiscal.State in [dsinsert, dsedit]) then
  begin
    if not fGerandoProdutos  then
      dsrProdutosNotaFiscal.OnDataChange := nil;

    qryProdutosNotaFiscalmsgfatorsubstituicao_custo.asboolean := false;
    if qryProcuraProdutoNotaFiscalnumeroprodutotabela.asinteger <> 0 then
      qryProdutosNotaFiscalnumeroprodutotabela.asinteger := qryProcuraProdutoNotaFiscalnumeroprodutotabela.asinteger
    else
      qryProdutosNotaFiscalnumeroprodutotabela.clear;

    dsrProdutosNotaFiscalDataChange(qryProdutosNotaFiscal, qryProdutosNotaFiscalnumeroprodutotabela);

    ReFazConsulta(qryProcuraNaturezasProduto,[],[]);
    AtribuirDadosProdutos(qryprodutosNotaFiscal, qryNotaFiscal, qryProcuraNaturezasProduto, false, NotaEntrada);

    AtribuirDadosCalculosImpostos(qryNotaFiscal, qryProcuraProdutoNotaFiscal, qryProcuraNaturezasProduto, qryProdutosNotaFiscal, NotaEntrada, (qryNotaFiscalndi.AsString=''));

    if qryProdutosNotaFiscalpedido.AsInteger <> 0 then
      Qtdade := QtdadeRecebida({False,} qryProdutosNotaFiscalpedido.AsInteger, qryProdutosNotaFiscalproduto.AsLargeInt)
    else
      Qtdade := 0;

    if qryProdutosNotaFiscalquantidade.AsFloat > Qtdade then
    begin
      qryProdutosNotaFiscalquantidade.AsFloat := qryProdutosNotaFiscalquantidade.AsFloat - Qtdade;
      qryProdutosNotaFiscalqtdeestoque.AsFloat   := qryProdutosNotaFiscalquantidade.AsFloat * qryProdutosNotaFiscalfatorconversao.AsFloat;
    end;

    if not fGerandoProdutos then
    begin
      CalcularImpostos;
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;
  end;
end;

function TdtmCadastroNotasFiscais.QtdadeRecebida({ProdutodaNotaAtual: Boolean;} Pedido: integer; Produto: Int64): Currency;
//var
//  Item: TtecQuantidadePorProdutoPedido;
begin
{
  if ProdutodaNotaAtual then
  begin
    Item := T_Lista.Items[Pedido, Produto];
    if Assigned(Item) then
      Result := Item.Quantidade
    else
      result := 0;
  end
  else
  begin
  }
    ReFazConsulta(qryProdutosRecebidos,[0,1],[Pedido,IntToStr(Produto)]);
    Result := qryProdutosRecebidosquantidade.AsFloat;
    qryProdutosRecebidos.Close;
//  end;
end;

procedure TdtmCadastroNotasFiscais.ReFazConsultaDetalhesNotaFiscal;
begin
  if (qryNotaFiscalfornecedor.AsInteger > 0) and
     (qryNotaFiscalnrdocumento.AsInteger > 0)     and
     (qryNotaFiscalserie.AsString <> '')
  then begin

     ReFazConsulta(qryProdutosNotasPagNFE, [0], [qryNotaFiscalcodigo.AsInteger]);
     ReFazConsulta(qryProdutosNotasPagNFELotes, [0], [qryNotaFiscalcodigo.AsInteger]);

     ReFazConsulta(qryProdutosNotasPagNFEItems, [0], [qryNotaFiscalcodigo.AsInteger]);
     ReFazConsulta(qryProdutosNotasPagNFEItemsSituacao, [0], [qryNotaFiscalcodigo.AsInteger]);

     ReFazConsultapornome(qryProdutosNotaFiscal, ['preconormal','codigo'], [PrecoNormal,qryNotaFiscalcodigo.AsInteger]);

     ReFazConsulta(qryDuplicatas, [0], [qryNotaFiscaldocumentopag.AsInteger]);
     ReFazConsulta(qryDocumentosPagImpostosRetidos,
                    [0],[qryNotaFiscaldocumentopag.AsInteger]);
     ReFazConsulta(qryDuplicatasImpostosRetidos,[0],[qryNotaFiscaldocumentopag.AsInteger]);
{     ReFazConsulta(dtmGerarNotaFiscal.qryCalculosNotasPag, [0], [qryNotaFiscalcodigo.AsInteger]);}
     ReFazConsulta(qryConhecimentoFrete, [0, 1, 2, 3],
                  [qryNotaFiscalfornecedorconhecimentofrete.AsInteger,
                   qryNotaFiscalserieconhecimentofrete.AsString,
                   qryNotaFiscalnumeroconhecimentofrete.AsInteger,
                   qrynotafiscalcodigo.asinteger]);
     ReFazConsulta(qryDocumentoPag, [0], [qryNotaFiscaldocumentopag.AsInteger]);
     if qryNotaFiscalndi.AsString <> '' then
     begin
       RefazConsulta(qryDadosImportacoes,[0],[qryNotaFiscalndi.AsString]);
{       ReFazConsulta(qryAdicoesImportacao,[0],[qryNotaFiscalndi.AsString]);
       ReFazConsulta(qryProdutosImportados,[0],[qryNotaFiscalndi.AsString]);}
     end;
     if ParSistema.GeracaoAutomaticadoImpostoRetido then
       ReFazConsulta(qryVenctosImpostosRetidosEntradas, [0], [filialbase]);

     if IncluidoViaXml and not EntradaViaXML and (qryNotaFiscalsituacao.AsString = 'P') and
       (qrynotafiscal.State <> dsinsert) then
       IncluirDuplicatasViaXML;

  end;
end;

procedure TdtmCadastroNotasFiscais.Selecionar;
begin
  if qryConsultaFornecedoresestado.AsString = EstadoFilialBase then begin
    qryConsultaNaturezas.Params[0].AsString := 'L';
    qryProcuraNaturezas.Params[0].AsString  := 'L';
    qryProcuraNaturezasProduto.Params[0].AsString  := 'L';
    qryProcuraNaturezasProdutonfe.Params[0].AsString  := 'L';

  end else if HeUnidadeFederacao(qryConsultaFornecedoresestado.AsString) then begin
    qryConsultaNaturezas.Params[0].AsString := 'F';
    qryProcuraNaturezas.Params[0].AsString  := 'F';
    qryProcuraNaturezasProduto.Params[0].AsString  := 'F';
    qryProcuraNaturezasProdutonfe.Params[0].AsString  := 'F';

  end else begin
    qryConsultaNaturezas.Params[0].AsString := 'E';
    qryProcuraNaturezas.Params[0].AsString  := 'E';
    qryProcuraNaturezasProduto.Params[0].AsString  := 'E';
    qryProcuraNaturezasProdutonfe.Params[0].AsString  := 'F';
  end;
  qryProcuraNaturezas.MacroByName('WhereInativo').asstring := '';
  qryProcuraNaturezasProduto.MacroByName('WhereInativo').asstring := '';
//  qryProcuraHistorico.Sql[4]  := '';
  qryProcuraFornecedores.Parambyname('tipo').AsString := qryConsultaFornecedorestipoorignal.AsString;
  ReFazConsulta(qryNotaFiscal, [0, 1, 2, 3], [qryConsultaNotasFiscaisfornecedor.AsInteger,
                                              qryConsultaNotasFiscaisserie.AsString,
                                              qryConsultaNotasFiscaisnumero.AsInteger,
                                              qryConsultaNotasFiscaistipofornecedor.AsString]);
  ReFazConsultaDetalhesNotaFiscal;
//  CalcularValorTotalProdutos;
end;


procedure TdtmCadastroNotasFiscais.AbrirConhecimentoFrete;
begin
  ReFazConsulta(qryConhecimentoFrete, [0,1,2,3], [qryConsultaConhecimentoFretefornecedor.AsInteger,
                                                  qryConsultaConhecimentoFreteserie.AsString,
                                                  qryConsultaConhecimentoFretenumero.AsInteger,
                                                  qryNotaFiscalCodigo.asinteger]);
end;


procedure TdtmCadastroNotasFiscais.SelecionarConhecimentoFrete;
begin
  if (qryNotaFiscal.State = dsinsert) or
     ((qryNotaFiscalvalorconhecimentofrete.ascurrency = 0) and
      (qryNotaFiscalicmsconhecimentofrete.AsCurrency = 0))  then
    if qrynotafiscal.RequestLive then
    begin
      qryNotaFiscalfornecedorconhecimentofrete.AsInteger := qryConhecimentoFretefornecedor.AsInteger;
      qryNotaFiscalserieconhecimentofrete.AsString       := qryConhecimentoFreteserie.AsString;
      qryNotaFiscalnumeroconhecimentofrete.AsInteger     := qryConhecimentoFretenumero.AsInteger;
      dsrNotaFiscal.OnDataChange := nil;
      qryNotaFiscalvalorconhecimentofrete.ascurrency     := qryConhecimentoFretevalorsugestaoconhecimento.ascurrency;
      qryNotaFiscalicmsconhecimentofrete.ascurrency      := qryConhecimentoFreteicmssugestaoconhecimento.ascurrency;
      ValorConhecimentoFrete := qryNotaFiscalvalorconhecimentofrete.ascurrency;
      dsrNotaFiscal.onDataChange := dsrNotaFiscalDataChange;
    end;
end;

procedure TdtmCadastroNotasFiscais.SelecionarEstadoPlaca;
begin
  EditarNotaFiscal;
  qryNotaFiscalestadoplaca.AsString := qryConsultaEstadoscodigo.AsString
end;

procedure TdtmCadastroNotasFiscais.SelecionarFornecedorTransporte;
begin
  EditarNotaFiscal;
  qryNotaFiscalFornecedorTransporte.AsInteger := qryConsultaFornecedorTransportecodigo.AsInteger;
  qryNotaFiscaltransportadora_cnpj.AsString   := SomenteNumero(qryConsultaFornecedorTransportepessoanumero.AsString);
  qryNotaFiscaltransportadora_nome.AsString   := qryConsultaFornecedorTransportenome.AsString;
  qryNotaFiscaltransportadora_estado.AsString    := qryConsultaFornecedorTransporteestado.AsString;
  qryNotaFiscaltransportadora_nomecidade.AsString    := qryConsultaFornecedorTransportenomecidade.AsString;
end;


procedure TdtmCadastroNotasFiscais.SelecionarNatureza;
begin
  if CodigoFiscalAnterior = 0 then
    CodigoFiscalAnterior := qryNotaFiscalcodigofiscal.AsInteger;
  qryProcuraNaturezas.BeforeOpen := nil;
  EditarNotaFiscal;
  qryProcuraNaturezas.paramByName('finalidade').AsInteger := qryNotaFiscalfinalidadenf.AsInteger;
  qryProcuraNaturezas.MacroByName('CodigoNaturezaPadrao').AsString := ' and (naturezas.codigo = ' + IntToStr(qryConsultaNaturezascodigo.AsInteger) + ') ';
  if qryProcuraNaturezascodigofiscal.AsInteger = qryConsultaNaturezascodigofiscal.AsInteger then
    ReFazConsulta(qryProcuraNaturezas,[],[]);
  qryNotaFiscalcodigofiscal.AsInteger := qryConsultaNaturezascodigofiscal.AsInteger;
  qryProcuraNaturezas.BeforeOpen := qryProcuraNaturezasBeforeOpen;
end;

procedure TdtmCadastroNotasFiscais.SelecionarPedidoNotaFiscal;
begin
  ReFazConsulta(qryProcuraPedidosNotaFiscal, [0], [qryConsultaPedidosNotaFiscalnumero.AsInteger]);
  if qryProdutosNotaFiscal.State = dsBrowse then
    qryProdutosNotaFiscal.Edit;
  qryProdutosNotaFiscalpedido.AsInteger := qryConsultaPedidosNotaFiscalnumero.AsInteger
end;

procedure TdtmCadastroNotasFiscais.SelecionarProdutoNotaFiscal;
begin

  RefazConsultaPorNome(qryProcuraProdutoNotaFiscal, ['produtovisual','numeroproduto','caracteristica','valorgrade1','valorgrade2'],
                       [qryConsultaProdutosNotaFiscalcodigovisual.AsString,
                        qryConsultaProdutosNotaFiscalnumeroprodutotabela.AsVariant,
                        null, null, null]);


  if qryProdutosNotaFiscal.State = dsBrowse then
    qryProdutosNotaFiscal.Edit;

  qryProdutosNotaFiscalprodutodigitado.AsString    := qryProcuraProdutoNotaFiscalprodutovisual.AsString;
  qryProdutosNotaFiscalprodutovisual.AsString    :=   qryProcuraProdutoNotaFiscalprodutovisual.AsString;
  qryProdutosNotaFiscalproduto.AsLargeInt        := qryProcuraProdutoNotaFiscalproduto.AsLargeInt;
end;

procedure TdtmCadastroNotasFiscais.SetarFornecedorPedido;
begin
  if qryProcuraFornecedorestipo.AsString = 'F' then begin

    qryProcuraPedidosNotaFiscal.ParamByName('fornecedor').AsInteger  := qryProcuraFornecedorescodigo.AsInteger;
    qryProcuraPedidosNotaFiscal.ParamByName('grupo').AsInteger  := qryProcuraFornecedoresgrupofornecedor.AsInteger;
    qryConsultaPedidosNotaFiscal.Parambyname('fornecedor').AsInteger := qryProcuraFornecedorescodigo.AsInteger;
    qryConsultaPedidosNotaFiscal.Parambyname('grupo').AsInteger := qryProcuraFornecedoresgrupofornecedor.AsInteger;
    qryConsultaPedidosProdutoNFE.Parambyname('fornecedor').AsInteger := qryProcuraFornecedorescodigo.AsInteger;
    qryConsultaPedidosProdutoNFE.Parambyname('grupo').AsInteger := qryProcuraFornecedoresgrupofornecedor.AsInteger;

  end else begin
    qryProcuraPedidosNotaFiscal.Parambyname('fornecedor').clear;
    qryProcuraPedidosNotaFiscal.Parambyname('grupo').clear;
    qryConsultaPedidosNotaFiscal.Parambyname('fornecedor').clear;
    qryConsultaPedidosNotaFiscal.Parambyname('grupo').clear;
    qryConsultaPedidosProdutoNFE.Parambyname('fornecedor').clear;
    qryConsultaPedidosProdutoNFE.Parambyname('grupo').clear;

  end
end;

procedure TdtmCadastroNotasFiscais.SetarTipoFornecedor;
begin
  qryProcuraFornecedores.Parambyname('tipo').AsString := qryConsultaFornecedorestipoorignal.AsString
end;

procedure TdtmCadastroNotasFiscais.SetProcurarPorFornecedor(const Value: Boolean);
begin
  if Value then begin
    qryProdutosNotaFiscal.Edit;
    qryProdutosNotaFiscalpedido.Clear;
    qryProdutosNotaFiscalproduto.Clear;
  end;
end;

procedure TdtmCadastroNotasFiscais.SetFornecedorParaISS(const Value: Integer);
begin
  if qryNotaFiscal.State in [dsinsert, dsinsert] then
    qryNotaFiscal.Edit;

  if value<>0 then
    qryNotaFiscalfornecedorparaiss.AsInteger := Value
  else
    qryNotaFiscalfornecedorparaiss.clear;
end;

procedure TdtmCadastroNotasFiscais.SetSomenteLeitura(Value: Boolean);
var vSomenteLeituraProdutos, vsomenteleituranota : boolean;
begin
  if  (IncluindoNota or
      (qryNotaFiscalsituacao.AsString='P')) then
  begin
    qryNotaFiscal.RequestLive          := True ;
    qryProdutosNotaFiscal.RequestLive  := True ;
    qryDuplicatas.RequestLive          := True ;
{    dtmGerarNotaFiscal.
    qryCalculosNotasPag.RequestLive    := True ;}
    qryNotaFiscalemissao.ReadOnly      := False;
    qryNotaFiscaldata.ReadOnly         := False;
    qryNotaFiscalvalornota.ReadOnly    := False;
    qryNotaFiscalirretido.ReadOnly     := False;
    qryNotaFiscalinssretido.ReadOnly   := False;
    qryNotaFiscalissretido.ReadOnly    := False;
    qryNotaFiscalpisretido.ReadOnly    := False;
    qryNotaFiscalpiscofinscsllretido.ReadOnly    := False;
    qryNotaFiscalcofinsretido.ReadOnly := False;
    qryNotaFiscalcsllretido.ReadOnly   := False;
    qryNotaFiscalcodigofiscal.ReadOnly := False;
    qryDuplicatasvalorvencto.ReadOnly  := False;
    qryDadosImportacoes.ReadOnly       := false;
    qryAdicoesImportacao.ReadOnly      := false;
    qryProdutosImportados.ReadOnly     := false;
    vSomenteLeituraProdutos := false;
    vSomenteLeituraNota := false;

  end
  else
  begin
    qryNotaFiscal.RequestLive          := (((Not Value) or UsuarioLogin.AlterarDadosContabeis) and (qryNotaFiscaldata.AsDateTime > ParSistema.DataContabil))
                                          and ((qryNotaFiscalfilial.AsInteger = filialbase) or (qrynotafiscal.State = dsinsert));

    qryNotaFiscalemissao.ReadOnly      := ExisteQuitacaoImpostosRetidosNotas or
                                         (qryNotaFiscaldata.AsDateTime <= ParSistema.DataContabil);

    qryNotaFiscaldata.ReadOnly   := qryNotaFiscalemissao.ReadOnly;

    qryNotaFiscalvalornota.ReadOnly    := ExisteQuitacaoImpostosRetidosDuplicatas or
                                          ExisteQuitacaoImpostosRetidosNotas or
                                         (qryNotaFiscaldata.AsDateTime <= ParSistema.DataContabil);

    qryNotaFiscalirretido.ReadOnly     := qryNotaFiscalvalornota.ReadOnly;
    qryNotaFiscalinssretido.ReadOnly   := qryNotaFiscalvalornota.ReadOnly;
    qryNotaFiscalissretido.ReadOnly    := qryNotaFiscalvalornota.ReadOnly;
    qryNotaFiscalpisretido.ReadOnly    := qryNotaFiscalvalornota.ReadOnly;
    qryNotaFiscalpiscofinscsllretido.ReadOnly    := qryNotaFiscalvalornota.ReadOnly;

    qryNotaFiscalcofinsretido.ReadOnly := qryNotaFiscalvalornota.ReadOnly;
    qryNotaFiscalcsllretido.ReadOnly   := qryNotaFiscalvalornota.ReadOnly;
    qryNotaFiscalcodigofiscal.ReadOnly := qryNotaFiscalvalornota.ReadOnly;


    qryProdutosNotaFiscal.RequestLive  := Not Value and
                                         (qryNotaFiscaldata.AsDateTime > ParSistema.DataContabil);

    qryDuplicatas.RequestLive := ((Not Value) and
                                           (UsuarioLogin.AlterarDadosContabeis and
                                            not DuplicatasQuitadas)) and
                                          (qryNotaFiscaldata.AsDateTime > ParSistema.DataContabil);

    qryDuplicatasvalorvencto.ReadOnly  := ExisteQuitacaoImpostosRetidosDuplicatas;


    qryDadosImportacoes.ReadOnly       := Value;
    qryAdicoesImportacao.ReadOnly      := Value;
    qryProdutosImportados.ReadOnly     := Value;
    vSomenteLeituraProdutos :=  not qryProdutosNotaFiscal.RequestLive;
    vsomenteleituranota :=  not qryNotaFiscal.RequestLive;


  end;

  qryNotaFiscalvalorservicos_nt.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituranota;
  qryNotaFiscalvalorservicos.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituranota;
  qryNotaFiscaldesconto.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituranota;
  qryNotaFiscalacrescimo.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituranota;

  qryNotaFiscalbaseicms.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituranota;
  qryNotaFiscalvaloricms.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituranota;

  qryNotaFiscalbaseicmssubstituicao.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituranota;

  qryNotaFiscalvaloricmssubstituicao.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituranota;
  qryNotaFiscalfreteinterno.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituranota;
  qryNotaFiscalseguro.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituranota;
  qryNotaFiscaldespesasacessorias.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituranota;
  qryNotaFiscalvaloripi.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituranota;
  qryNotaFiscalvalornota.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituranota;

  //qryProdutosNotaFiscalcodigofiscal.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalpedido.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalproduto.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalprodutovisual.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalquantidade.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalqtdeestoque.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalfatorconversao.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalunidadenf.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;

  qryProdutosNotaFiscalprecounitario.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalvalormoeda.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
//  qryProdutosNotaFiscalincidencia.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalcst_nf.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;

//  qryProdutosNotaFiscalcsosn.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalcsosn_nf.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;

  qryProdutosNotaFiscalpercentualreducaobase.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalvalorreducaobase.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalicmsbasecalculo.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalaliquotaicms.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalicmsvalor.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalpcredsn.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalvcredicmssn.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalpMVAST.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalpredbcst.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalreducaobasest.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalicmsbasecalculost.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalaliquotaicmsst.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalicmsvalorst.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
//  qryProdutosNotaFiscalipicst.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalipicst_nf.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalipibasecalculo.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalaliquotaipi.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalvaloripi.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;
  qryProdutosNotaFiscalCodigoNota.ReadOnly := IncluindoViaXml or IncluidoViaXml or vsomenteleituraprodutos;



end;

function  TdtmCadastroNotasFiscais.ValidarCNPJ(Numero:String): Boolean;
begin
  Result:= true;
  if numero<>'' then
  begin
    ReFazConsulta(qryValidarCNPJ,[0,1],[qryProcuraFornecedorescodigo.AsInteger,
                                        qryProcuraFornecedorestipo.AsString], false);
    if not qryValidarCNPJ.IsEmpty then
      if Numero <> qryProcuraFornecedorespessoanumero.AsString then
      begin
        result := false;
        MensagemAviso(ctCNPJOUCPFNAOCONFERE)
      end;
  end;
end;


function TdtmCadastroNotasFiscais.VerificarProdutosFornecedor: Boolean;
var
  Msg: String;
  pos : TbookMark;

  procedure IncluirFornecedorProduto;
  begin
    if(ParSistema.VincularAutomaticoProdutoFornecedor) then
      Result:=true
    else
    begin
      Msg := Format(ctINCLUIRPRODNOFORNECEDOR, [qryProdutosNotaFiscalcaracteristicavisual.AsString, qryProcuraFornecedoresNome.AsString]);
      Result := MensagemConfirmacao(Msg) = smbOK;
    end;
    if Result then
    begin
      qryFornecedorProduto.insert;
      qryFornecedorProdutocaracteristica.AsString := qryProdutosNotaFiscalcaracteristica.AsString;
      qryFornecedorProdutofornecedor.AsInteger    := qryNotaFiscalfornecedor.AsInteger;
      qryFornecedorProdutogrupo.AsString          := qryProdutosNotaFiscalgrupo.AsString;
      qryFornecedorProdutoclasse.AsString          := qryProdutosNotaFiscalclasse.AsString;
      qryFornecedorProdutogeradocadastro.AsBoolean := false;

      qryFornecedorProduto.Post
    end;
  end;

begin
  Result := True;

  if (qryNotaFiscaltipofornecedor.AsString = 'F') and
     (qryNotaFiscalsituacao.AsString = 'N') then
  begin
    if not qryFornecedorProduto.Active or
       not qryFornecedorProduto.UpdatesPending then
      RefazConsultaPorNome(qryFornecedorProduto, ['fornecedor'], [qryNotaFiscalfornecedor.asinteger]);

    if qryProdutosNotaFiscal.Active then
    begin

      try

        Pos := qryProdutosNotaFiscal.GetBookmark;
        qryProdutosNotaFiscal.DisableControls;
        DesabilitarControles(true);

         qryProdutosNotaFiscal.First;
         while Not qryProdutosNotaFiscal.Eof do
         begin
           if qryProdutosNotaFiscalnaoreplicar.AsBoolean or
              not ParSistema.Replicar_Fornecedores then
           begin
             if Not qryFornecedorProduto.Locate('caracteristica;fornecedor',
                               VarArrayOf([qryProdutosNotaFiscalcaracteristica.AsString,
                                           qryNotaFiscalfornecedor.AsString]), []) then
               IncluirFornecedorProduto;
           end
           else
           begin
             if Not qryFornecedorProduto.Locate('grupo;classe;fornecedor',
                               VarArrayOf([qryProdutosNotaFiscalgrupo.AsString,
                                           qryProdutosNotaFiscalclasse.AsString,
                                           qryNotaFiscalfornecedor.AsString]), []) then
             begin
               if qryFornecedorProduto.Locate('caracteristica;fornecedor',
                               VarArrayOf([qryProdutosNotaFiscalcaracteristica.AsString,
                                           qryNotaFiscalfornecedor.AsString]), []) then
               begin
                 qryFornecedorProduto.edit;
                 qryFornecedorProdutogrupo.AsString          := qryProdutosNotaFiscalgrupo.AsString;
                 qryFornecedorProdutoclasse.AsString          := qryProdutosNotaFiscalclasse.AsString;
                 qryFornecedorProduto.post;
               end
               else
                 IncluirFornecedorProduto;
             end;
             {
             else
               if not qryFornecedorProduto.Locate('caracteristica;fornecedor',
                               VarArrayOf([qryProdutosNotaFiscalcaracteristica.AsString,
                                           qryNotaFiscalfornecedor.AsString]), []) then
                IncluirFornecedorProduto;
             }
           end;
           qryProdutosNotaFiscal.Next
         end;
      finally
        qryProdutosNotaFiscal.GotoBookmark(Pos);
        qryProdutosNotaFiscal.FreeBookmark(Pos);
        qryProdutosNotaFiscal.EnableControls;

        DesabilitarControles(false);
      end;
    end;

  end;
end;

function TdtmCadastroNotasFiscais.VerificarValoresDasDuplicatas(
    var TotalSomatorio, TotalNota:Currency): TtecErroDuplicatas;
var
  Pos,
  PosAnt               : TBookmark;
  Data                      : TDateTime;
  MesmaData                 : Boolean;
  AcimadeumAno              : Boolean;
begin
  AcimadeumAno := false;
  MesmaData := False;
  if qryDuplicatas.RecordCount = 1 then begin
    TotalSomatorio := qryDuplicatasvalorvencto.AsCurrency;
//    if qryDuplicatasdatavencto.IsNull then
//      Result := edDATANULA
//    else
      if (qryDuplicatasdatavencto.AsDateTime >
          qryNotaFiscaldata.AsDateTime + 365) then
        AcimadeumAno := true;
      Result := edNENHUM;
  end else begin
    TotalSomatorio := 0;
    Result := edNENHUM;
    PosAnt := qryDuplicatas.GetBookmark;
    qryDuplicatas.DisableControls;
    try
      qryDuplicatas.First;
      while Not qryDuplicatas.Eof do begin
        if qryDuplicatasdatavencto.IsNull then begin
          Result := edDATANULA;
          break
        end;

        if not AcimadeumAno then
          if (qryDuplicatasdatavencto.AsDateTime >
              qryNotaFiscaldata.AsDateTime + 365) then
            AcimadeumAno := true;

        if not qryNotaFiscalEvento.IsNull then
        begin
          if (not (qryduplicatas.State in [dsedit, dsinsert]))
             and (qryDuplicatasevento.AsInteger <> qryNotaFiscalEvento.AsInteger)
             and not qryduplicatas.readonly then
          begin
            qryduplicatas.Edit;
            qryDuplicatasevento.AsInteger := qryNotaFiscalEvento.AsInteger;
            qryduplicatas.Post;
          end;
        end;

        TotalSomatorio := TotalSomatorio + qryDuplicatasvalorvencto.AsCurrency;

        if not MesmaData then
        begin
          Data := qryDuplicatasdatavencto.AsDateTime;
          Pos  := qryDuplicatas.GetBookmark;

          qryDuplicatas.Next;

          while Not qryDuplicatas.Eof do begin
            if qryDuplicatasdatavencto.AsDateTime = Data then begin
              MesmaData := True;
              break;
            end;
            qryDuplicatas.Next
          end;
          qryDuplicatas.GotoBookmark(Pos);
        end;
        qryDuplicatas.Next;
      end;
    finally
      qryDuplicatas.GotoBookmark(PosAnt);
      qryDuplicatas.FreeBookmark(PosAnt);
      qryDuplicatas.EnableControls
    end
  end;

  if Result = edNENHUM then
  begin
    if GerarDocumentopag then
    begin
      TotalNota := qryNotaFiscalvalornota.ascurrency - ImpostosRetidos;
      if Abs(Truncar(TotalSomatorio,2) -
             Truncar(TotalNota,2)) <> 0 then
        Result := edVALORES
      else
        if AcimadeumAno and MesmaData then
          Result := edDATADUPLICADAEACIMAUMANO
        else
          if MesmaData then
            Result := edDATADUPLICADA
          else
           if AcimadeumAno then
             Result := edDATAACIMAUMANO;
    end;
  end;

end;

function TdtmCadastroNotasFiscais.ExcluirMovimentos: Boolean;
begin
  Result:=True;
  BloquearProdutosNoEstoque;
  ReFazConsulta(qryMovNotaFiscal, [0], [qryNotaFiscalcodigo.AsInteger]);
  qryMovNotafiscal.First;
  try
    while not qryMovNotaFiscal.Eof do
      qryMovNotaFiscal.Delete;
  except
    Result:=False;
  end;
end;

function TdtmCadastroNotasFiscais.getQuantidadeNaturezas: Boolean;
const
  sql = 'and (case when ''F'' = ''%s'' then %s' +
        '          when ''E'' = ''%s'' then %s' +
        '          else %s' +
        '     end) = codigofiscal - 1000';
var
  local: String;
begin
  local := '';
  CodigoFiscalAuxiliar := 0;
  Result := (qryProcuraNaturezas.RecordCount > 1) and
            (qryNotaFiscal.State in [dsInsert, dsEdit]) and
            (qryProcuraNaturezascodigofiscal.AsInteger <> 1353) and
            (qryProcuraNaturezascodigofiscal.AsInteger <> 2353);
  if Result then
  begin
    qryConsultaNaturezas.MacroByName('CodigoFiscal').AsString := 'and (mod(codigofiscal,1000) = mod(' + IntToStr(qryProcuraNaturezascodigofiscal.AsInteger) + ',1000))';
    {if qryProcuraFornecedoresestado.AsString = EstadoFilialBase then
    begin
      local := 'L';
      CodigoFiscalAuxiliar := qryProcuraNaturezascodigofiscal.AsInteger - 1000;
    end
    else if HeUnidadeFederacao(qryProcuraFornecedoresestado.AsString) then
    begin
      local := 'F';
      CodigoFiscalAuxiliar := qryProcuraNaturezascodigofiscal.AsInteger - 2000;
    end
    else
    begin
      local := 'E';
      CodigoFiscalAuxiliar := qryProcuraNaturezascodigofiscal.AsInteger;
    end;
    qryConsultaNaturezas.MacroByName('CodigoFiscal').AsString :=
        Format(sql,[local, inttostr(CodigoFiscalAuxiliar),
                    local, inttostr(CodigoFiscalAuxiliar),
                           inttostr(CodigoFiscalAuxiliar)]);
  }
  end
  else
    qryConsultaNaturezas.MacroByName('CodigoFiscal').AsString := '';
end;

function TdtmCadastroNotasFiscais.getQuantidadeNaturezasProduto: Boolean;
const
  sql = 'and (case when ''F'' = ''%s'' then %s' +
        '          when ''E'' = ''%s'' then %s' +
        '          else %s' +
        '     end) = codigofiscal - 1000';
var
  local: String;
begin
  local := '';
  CodigoFiscalAuxiliar := 0;

  Result := (qryProcuraNaturezasProduto.RecordCount > 1) and
            (qryProdutosNotaFiscal.State in [dsInsert, dsEdit]) and
            (qryProcuraNaturezasProdutocodigofiscal.AsInteger <> 1353) and
            (qryProcuraNaturezasProdutocodigofiscal.AsInteger <> 2353) and
            (qryProdutosNotaFiscalcodigofiscal.AsInteger <> FCodigoFiscalProdutoOriginal);
  if Result then
  begin
    qryConsultaNaturezas.MacroByName('CodigoFiscal').AsString :=
      'and (mod(codigofiscal,1000) = mod(' + IntToStr(qryProcuraNaturezasProdutocodigofiscal.AsInteger) + ',1000))';
  end
  else
    qryConsultaNaturezas.MacroByName('CodigoFiscal').AsString := '';
end;

function TdtmCadastroNotasFiscais.IncluirProdutoImportado(
  Editar: Boolean): Boolean;
begin
  Result := True;
  if Editar and not qryProdutosImportados.IsEmpty then
    qryProdutosImportados.Edit
  else
    qryProdutosImportados.Append;
end;

function TdtmCadastroNotasFiscais.ExcluirProdutoImportado: Boolean;
begin
  qryProdutosImportados.Delete;
end;

function TdtmCadastroNotasFiscais.GravarProdutoImportado: Integer;
begin
  if qryProdutosImportados.CheckRequiredFields then
  begin
    Result := 1;
    qryAdicoesImportacao.AfterScroll := nil;
    if not qryAdicoesImportacao.Locate('numero',qryProdutosImportadosnumeroadicao.AsInteger,[]) then
      Result := 0;
    if Result = 1 then
      if (qryProdutosImportadosaliquotaipi.AsCurrency = 0) and
         (qryAdicoesImportacaoipi.AsCurrency  > 0) then
        Result := 2;
    qryAdicoesImportacao.AfterScroll := qryAdicoesImportacaoAfterScroll;
    if (Result in [1,2]) then
      qryProdutosImportados.Post;
  end
  else
    Result := -1;
end;

function TdtmCadastroNotasFiscais.ExcluirAdicao: Boolean;
begin
  if not qryAdicoesImportacao.ReadOnly and
     (qryAdicoesImportacao.RecordCount > 0) then
  begin
    Result := True;
    qryProdutosImportados.First;
    while not qryProdutosImportados.Eof do
    begin
      if qryProdutosImportadosnumeroadicao.AsInteger = qryAdicoesImportacaonumero.AsInteger then
        qryProdutosImportados.Delete
      else
        qryProdutosImportados.next;
    end;
    qryAdicoesImportacao.Delete;
    FNumeroAdicaoImportacao := qryAdicoesImportacao.RecordCount;
  end
  else
    Result := False;
end;

function TdtmCadastroNotasFiscais.GravarAdicao: Boolean;
begin
  result := qryAdicoesImportacao.CheckRequiredFields;
  if Result then
  begin
    qryAdicoesImportacaodadoimportacao.AsString := qryDadosImportacoesnumero.AsString;
    qryAdicoesImportacao.Post;
    Result := True;
  end;
end;

function TdtmCadastroNotasFiscais.IncluirAdicao(Editar: Boolean): Boolean;
begin
  Result := True;
  if qryAdicoesImportacao.readonly then
  begin
    if not Editar then
    begin
      qryAdicoesImportacao.AfterScroll := nil;
      qryAdicoesImportacao.DisableControls;
      try
        qryAdicoesImportacao.AfterDelete := nil;
        qryAdicoesImportacao.ReadOnly := False;
        qryAdicoesImportacao.Delete;
        qryAdicoesImportacao.AfterDelete := qryAdicoesImportacaoAfterDelete;
      finally
        qryAdicoesImportacao.EnableControls;
        qryAdicoesImportacao.AfterScroll := qryAdicoesImportacaoAfterScroll;
      end;
      IncluirAdicao(False);
    end;
  end
  else
  if Editar and not qryAdicoesImportacao.IsEmpty then
    qryAdicoesImportacao.Edit
  else
  begin
    qryAdicoesImportacao.Append;
    qryAdicoesImportacaodadoimportacao.AsString := qryDadosImportacoesnumero.AsString;
    qryAdicoesImportacaonumero.AsInteger        := qryAdicoesImportacao.RecordCount + 1;
    qryAdicoesImportacaofabricante.AsInteger    := qryNotaFiscalfornecedor.AsInteger;
  end;
end;

function TdtmCadastroNotasFiscais.GetEhNfeouCTE: boolean;
begin
  result := (sped_fiscal or sped_pis_cofins) and
        ((qryNotaFiscalmodelodocto.AsString = '55') or
         (qryNotaFiscalmodelodocto.AsString = '57'));
end;


function TdtmCadastroNotasFiscais.VerificarDestinatarioNFE(CNPJCPF: String;
              ExibirMsg: Boolean = true): boolean;

begin
  result := true;

  if CNPJFilialBase <> CNPJCPF then
  begin
    if parsistema.permitir_importar_xml_com_cnpj_diferente_da_filial_base then
      result := MensagemConfirmacao(format('CNPJ/CPF da NFe: %s'+#10#13+
                           'CNPJ da empresa: %s'+#10#13+#10#13+
                           'O CNPJ/CPJ da NFe difere do cadastrado na empresa.'+#10#13+
                           'Continuar com a importação do arquivo XML?',
                           [FormatarCPFouCGC(CNPJCPF),
                           FormatarCPFouCGC(CNPJFilialBase)])) = smbOK
    else
    begin
      if ExibirMsg then
        MensagemErro(format('CNPJ/CPF da NFe: %s'+#10#13+
                           'CNPJ da empresa: %s'+#10#13+#10#13+
                           'O CNPJ/CPJ da NFe difere do cadastrado na empresa.',
                           [FormatarCPFouCGC(CNPJCPF),
                           FormatarCPFouCGC(CNPJFilialBase)]));
      result := false;
    end;
  end;


end;

function TdtmCadastroNotasFiscais.VerificarEmitenteNFE: boolean;

begin
  if not assigned(qryEstados) then
  begin
    qryEstados := TTecQuery.Create(self);
    qryEstados.Database := dtmTecSoft.Database;
    qryEstados.CachedUpdates := true;
    qryEstados.RequestLive := true;
    qryEstados.sql.text := 'select * from estados where codigo = :codigo';
  end;

  if not assigned(qryCidades) then
  begin
    qryCidades := TTecQuery.Create(self);
    qryCidades.Database := dtmTecSoft.Database;
    qryCidades.CachedUpdates := true;
    qryCidades.RequestLive := true;
    qryCidades.sql.text := 'select * from cidades where codigoibge = :codigoibge';
  end;

  if not assigned(qryBairros) then
  begin
    qryBairros := TTecQuery.Create(self);
    qryBairros.Database := dtmTecSoft.Database;
    qryBairros.CachedUpdates := true;
    qryBairros.RequestLive := true;
    qryBairros.sql.text := 'select * from bairros where (estado = :estado and cidade = :cidade and nome = :nome)';
  end;

  if not assigned(qryFornecedor) then
  begin
    qryFornecedor := TTecQuery.Create(self);
    qryFornecedor.Database := dtmTecSoft.Database;
    qryFornecedor.CachedUpdates := true;
    qryfornecedor.RequestLive := true;
    qryFornecedor.sql.text := 'select codigo, nome, razao, pessoatipo,         '+#13+
                                     ' pessoanumero, rua, numero, complemento, '+#13+
                                     ' bairro, cidade, estado, cep, foneddd, fonenumero, '+#13+
                                     ' inscricaoestadual, inscricaomunicipal, nosimples, crt '+#13+
                              'from fornecedores where pessoanumero = :cnpjcpf ';

    qryvFornecedores := TTecQuery.Create(self);
    qryvFornecedores.Database := dtmTecSoft.Database;
    qryvFornecedores.sql.text := 'select codigo, nome, tipo, razao, pessoatipo,         '+#13+
                                     ' pessoanumero, rua, numero, complemento, '+#13+
                                     ' bairro, cidade, estado, cep, foneddd, fonenumero, '+#13+
                                     ' inscricaoestadual, inscricaomunicipal, nosimples, '+#13+
                                     ' case when tipo = ''F'' then (select f.crt from fornecedores f where f.codigo = vfornecedores.codigo ) '+#13+
                                     '      when tipo = ''L'' then (select f.regimetributario from filiais f where f.codigo = vfornecedores.codigo)'+#13+
                                     ' else cast(null as smallint) end as crt '+#13+
                              'from vfornecedores where pessoanumero = :cnpjcpf and tipo = ''F'' order by tipo desc limit 1';


                              { o order by acima devido a existencia de cnpj´s duplicados  }

  end;

  if not assigned(qryseriesfornecedores) then
  begin
    qryseriesfornecedores := TTecQuery.Create(self);
    qryseriesfornecedores.Database := dtmTecSoft.Database;
    qryseriesfornecedores.CachedUpdates := true;
    qryseriesfornecedores.RequestLive := true;
    qryseriesfornecedores.sql.text := 'select * from seriesfornecedores where fornecedor = :fornecedor and serie = :serie';
  end;

  {
  with ACBrNFe1.NotasFiscais.Items[0].NFe.Emit do
  begin
  }

    result := true;

    qryvfornecedores.ParamByName('cnpjcpf').AsString := ValorPropriedade('CNPJCPF', 'Emit');

    qryvfornecedores.close;
    qryvfornecedores.Open;

    if qryvFornecedores.RecordCount = 0 then
    begin
      result := MensagemConfirmacao(format('O fornecedor com a razão social ''%s'' '+#13+
                                           'e nome de fantasia ''%s'' '+#13+
                                           'com o cnpj/cpf ''%s''  não esta cadastrado.'+#13+
                                           'O sistema importará os dados contido na NFe.',
                                           [ValorPropriedade('xNome', 'Emit'),
                                            ValorPropriedade('xFant', 'Emit'),
                                           FormatarCPFouCGC(ValorPropriedade('CNPJCPF', 'Emit'))])) = smbOk;

      if result then
      begin
        qryEstados.parambyName('codigo').AsString := ValorPropriedade('UF', 'Emit.EnderEmit');
        qryestados.close;
        qryestados.Open;
        if qryestados.RecordCount = 0 then
        begin
          MensagemErro('A unidade de federação ''%s'' não esta cadastrada.');
          result := false;
        end;
      end;

      if result then
      begin
        qryCidades.parambyname('codigoibge').asinteger := ValorPropriedade('cMun', 'Emit.EnderEmit');
        qryCidades.Close;
        qryCidades.Open;
        if qryCidades.recordcount = 0 then
        begin
          if not assigned(qryCidadesUF) then
          begin
            qryCidadesUF := TTecQuery.Create(self);
            qryCidadesUF.Database := dtmTecSoft.Database;
            qryCidadesUF.CachedUpdates := true;
            qryCidadesUF.RequestLive := true;
            qryCidadesUF.sql.text := 'select * from cidades where estado = :estado and UPPER(TO_ASCII(nome,''LATIN1'')) = UPPER(TO_ASCII(:nome,''LATIN1''))';

          end;
          qryCidadesUF.ParamByName('estado').asstring := ValorPropriedade('UF', 'Emit.EnderEmit');
          qryCidadesUF.ParamByName('nome').asstring := ValorPropriedade('xmun', 'Emit.EnderEmit');

          qryCidadesUF.close;
          qryCidadesUF.open;

          if qryCidadesUF.RecordCount = 0 then
          begin
            qryCidades.Append;
            qryCidades.FieldByName('estado').asstring := ValorPropriedade('UF', 'Emit.EnderEmit');
            qryCidades.FieldByName('nome').asstring := ValorPropriedade('xmun', 'Emit.EnderEmit');
            qryCidades.FieldByName('codigoibge').AsInteger := ValorPropriedade('cMun', 'Emit.EnderEmit');

            qryCidades.Post;
            perpetrar([qryCidades]);
            qryCidades.Close;
            qrycidades.Open;
          end
          else
          begin
            //result := false;
            result := true;
            {
            MensagemAviso( format('Há cidade com o nome %s cadastrada com código de IBGE %s diferente do %s constante na NF-e. '
                                  + chr(13) + 'O código IBGE será atualizado.',
                                  [EnderEmit.xmun,
                                   qryCidadesUF.FieldByName('codigoibge').asstring,
                                   inttostr(EnderEmit.cMun)]) );
            }
            qryCidadesUF.edit;
            qryCidadesUF.FieldByName('codigoibge').AsInteger := ValorPropriedade('cMun', 'Emit.EnderEmit');
            qryCidadesUF.post;
            perpetrar([qryCidadesUF]);

            qryCidades.parambyname('codigoibge').asinteger := ValorPropriedade('cMun', 'Emit.EnderEmit');
            qryCidades.Close;
            qryCidades.Open;

          end;
        end
        else
        begin
          {
          if (uppercase(qryCidades.FieldByName('estado').asstring) <> uppercase(EnderEmit.UF)) or
             (uppercase(qryCidades.FieldByName('nome').asstring) <> uppercase(EnderEmit.xmun)) then
          begin
            result := false;
            MensagemErro( format('Há cidade com o nome/UF %s diferente de %s constante na NF-e',
                                [qryCidades.FieldByName('nome').asstring+'/'+qryCidades.FieldByName('estado').asstring,
                                 EnderEmit.xmun+'/'+EnderEmit.UF]));
          end;
          }

          if (uppercase(qryCidades.FieldByName('estado').asstring) <> uppercase(ValorPropriedade('UF', 'Emit.EnderEmit'))) then
          begin
            result := false;
            MensagemErro( format('Há cidade com o nome/UF %s diferente de %s constante na NF-e',
                                [qryCidades.FieldByName('nome').asstring+'/'+qryCidades.FieldByName('estado').asstring,
                                 ValorPropriedade('xmun', 'Emit.EnderEmit')+'/'+ValorPropriedade('UF', 'Emit.EnderEmit')]));
          end;
          {
          else
          if (uppercase(RetiraAcento(qryCidades.FieldByName('nome').asstring)) <> uppercase(RetiraAcento(EnderEmit.xmun))) then
          begin
            result := true;
            MensagemErro( format('Há cidade com o nome/UF %s diferente de %s constante na NF-e',
                                [qryCidades.FieldByName('nome').asstring+'/'+qryCidades.FieldByName('estado').asstring,
                                 EnderEmit.xmun+'/'+EnderEmit.UF]));
          end;
          }

        end;
      end;

      if result then
      begin
        qryBairros.ParamByName('estado').asstring := ValorPropriedade('UF', 'Emit.EnderEmit');
        qryBairros.ParamByName('cidade').asinteger := qryCidades.FieldByName('codigo').asinteger;
        qryBairros.ParamByName('nome').asstring := ValorPropriedade('xBairro', 'Emit.EnderEmit');

        qryBairros.close;
        qryBairros.open;

        if qryBairros.RecordCount = 0 then
        begin
          qryBairros.Append;
          qryBairros.fieldbyname('estado').AsString := ValorPropriedade('UF', 'Emit.EnderEmit');
          qryBairros.fieldbyname('cidade').Asinteger := qryCidades.FieldByName('codigo').asinteger;
          qryBairros.fieldbyname('nome').AsString := ValorPropriedade('xBairro', 'Emit.EnderEmit');
          qryBairros.post;
          perpetrar([qryBairros]);
          qryBairros.close;
          qryBairros.open;
        end;
      end;


      if result then
      begin

        qryfornecedor.ParamByName('cnpjcpf').AsString := ValorPropriedade('CNPJCPF', 'Emit');
        qryfornecedor.close;
        qryfornecedor.Open;

        spcProximoFornecedor := TTecQuery.Create(self);
        spcProximoFornecedor.Database := dtmTecSoft.Database;
        spcProximoFornecedor.sql.text := 'Select fornecedores_ProximoCodigo() as codigo';

        spcProximoFornecedor.Close;
        spcProximoFornecedor.Open;

        qryFornecedor.Append;
        qryfornecedor.FieldByName('codigo').AsInteger := spcProximoFornecedor.fieldbyname('codigo').AsInteger;

        if ValorPropriedade('xFant', 'Emit') <> '' then
          qryfornecedor.FieldByName('nome').AsString := ValorPropriedade('xFant', 'Emit')
        else
          qryfornecedor.FieldByName('nome').AsString := ValorPropriedade('xNome', 'Emit');

        qryfornecedor.FieldByName('razao').AsString := ValorPropriedade('xNome', 'Emit');
        if length(ValorPropriedade('CNPJCPF', 'Emit')) = 14 then
          qryfornecedor.FieldByName('pessoatipo').AsString := 'J'
        else
          qryfornecedor.FieldByName('pessoatipo').AsString := 'F';

        qryfornecedor.FieldbyName('pessoanumero').AsString := ValorPropriedade('CNPJCPF', 'Emit');
        qryfornecedor.FieldbyName('rua').AsString := ValorPropriedade('xLgr', 'Emit.EnderEmit');

        if  possuisomentenumero(ValorPropriedade('nro', 'Emit.EnderEmit')) then
        begin
          qryfornecedor.FieldbyName('numero').AsString :=  ValorPropriedade('nro', 'Emit.EnderEmit');
          qryfornecedor.FieldbyName('complemento').AsString := ValorPropriedade('xCpl', 'Emit.EnderEmit');
        end
        else
        begin
          if (ValorPropriedade('nro', 'Emit.EnderEmit') <> '') then
            qryfornecedor.FieldbyName('complemento').AsString := trim(ValorPropriedade('nro', 'Emit.EnderEmit') + ' ' + ValorPropriedade('xCpl', 'Emit.EnderEmit'))
          else
            qryfornecedor.FieldbyName('complemento').AsString := ValorPropriedade('xCpl', 'Emit.EnderEmit');
        end;

        qryfornecedor.FieldbyName('bairro').AsInteger :=  qrybairros.fieldbyname('codigo').asinteger;
        qryfornecedor.FieldbyName('cidade').AsInteger :=  qryCidades.fieldbyname('codigo').asinteger;
        qryfornecedor.FieldbyName('estado').AsString := ValorPropriedade('UF', 'Emit.EnderEmit');
        qryfornecedor.FieldbyName('cep').AsInteger := ValorPropriedade('CEP', 'Emit.EnderEmit');

        if ValorPropriedade('UF', 'Emit.EnderEmit') = 'SP' then
        begin
          qryfornecedor.FieldbyName('foneddd').AsString := copy(SomenteNumero(ValorPropriedade('fone', 'Emit.EnderEmit')), 1,2);
          qryfornecedor.FieldbyName('fonenumero').AsString := copy(SomenteNumero(ValorPropriedade('fone', 'Emit.EnderEmit')),
                                                                   length(SomenteNumero(ValorPropriedade('fone', 'Emit.EnderEmit')))-9,
                                                                   9);
        end
        else
        begin
          qryfornecedor.FieldbyName('foneddd').AsString := copy(SomenteNumero(ValorPropriedade('fone', 'Emit.EnderEmit')), 1,2);
          qryfornecedor.FieldbyName('fonenumero').AsString := copy(SomenteNumero(ValorPropriedade('fone', 'Emit.EnderEmit')),
                                                                   length(SomenteNumero(ValorPropriedade('fone', 'Emit.EnderEmit')))-8,
                                                                   8);
        end;

        qryfornecedor.FieldbyName('inscricaoestadual').AsString := ValorPropriedade('IE', 'Emit');

        if ValorPropriedade('IM', 'Emit') <> '' then
          qryfornecedor.FieldbyName('inscricaomunicipal').AsString := ValorPropriedade('IM', 'Emit');

        qryfornecedor.FieldbyName('crt').asString := ValorPropriedade('CRT', 'Emit');
        qryfornecedor.FieldbyName('noSimples').AsBoolean := (qryfornecedor.FieldbyName('crt').asString <> '3');

        qryfornecedor.Post;

                 {
          1=Simples Nacional;
          2=Simples Nacional, excesso sublimite de receita bruta;
          3=Regime Normal;
          4=Simples Nacional - Microempreendedor Individual - MEI
          }


        qryseriesfornecedores.close;
        qryseriesfornecedores.open;
        qryseriesfornecedores.append;
        qryseriesfornecedores.FieldByName('fornecedor').AsInteger := qryfornecedor.FieldByName('codigo').AsInteger;
        qryseriesfornecedores.FieldByName('serie').Asinteger := ValorPropriedade('serie', 'Ide');

        if TipoLeituraXML = XMLNfe then
          qryseriesfornecedores.FieldByName('modelodoctofiscal').AsString := '55'
        else
          qryseriesfornecedores.FieldByName('modelodoctofiscal').AsString := '57';

        qryseriesfornecedores.post;

        result := perpetrar([qryfornecedor, qryseriesfornecedores]);

        if TipoLeituraXML = xmlCte then
        begin
          qryUpdateTipFornecedor.Sql.Append('update fornecedores set tipofornecimento[1] = ''T'' where codigo  = '+qryFornecedor.fieldbyname('codigo').AsString+';');
          qryUpdateTipFornecedor.ExecSql;
          result := perpetrar([]);
        end;

        {refaz consulta vfornecedores, campos são utilizados em outras partes do cadastro de notas - jr 03/11}
        qryvfornecedores.ParamByName('cnpjcpf').AsString := ValorPropriedade('CNPJCPF', 'Emit');
        qryvfornecedores.close;
        qryvfornecedores.Open;
      end;
    end
    else
    begin
      if qryvfornecedores.FieldbyName('tipo').asString = 'F' then
      begin

        qryfornecedor.ParamByName('cnpjcpf').AsString := ValorPropriedade('CNPJCPF', 'Emit');
        qryfornecedor.close;
        qryfornecedor.Open;

        if (qryvfornecedores.FieldbyName('noSimples').AsBoolean <> (ValorPropriedade('CRT', 'Emit') <> '3')) or
           (qryvfornecedores.FieldbyName('crt').asString <> ValorPropriedade('CRT', 'Emit')) then
                                                                                                   {     Ficamos na duvida: alguem pediu esta alteração: atualizar a razao e a fantasia? 14/06/2019
           (qryvfornecedores.FieldbyName('razao').asString <> ValorPropriedade('xNome', 'Emit')) or
           (qryvfornecedores.FieldbyName('nome').asString <> ValorPropriedade('xFant', 'Emit')) then
           }

        begin
          qryfornecedor.edit;
          qryfornecedor.FieldbyName('noSimples').AsBoolean := (ValorPropriedade('CRT', 'Emit') <> '3');
          qryfornecedor.FieldbyName('crt').asString := ValorPropriedade('CRT', 'Emit');
          {
          qryfornecedor.FieldbyName('razao').asString := ValorPropriedade('xNome', 'Emit');
          if ValorPropriedade('xFant', 'Emit') <> '' then
            qryfornecedor.FieldByName('nome').AsString := ValorPropriedade('xFant', 'Emit')
          else
            qryfornecedor.FieldByName('nome').AsString := ValorPropriedade('xNome', 'Emit');
            }

          qryfornecedor.post;

          {
          if qrynotafiscal.recordcount <> 0 then
            if qryNotaFiscalcrt.AsString  <> qryfornecedor.FieldbyName('crt').asString then
            begin
              qryNotaFiscal.edit;
              qryNotaFiscalcrt.asString := qryfornecedor.FieldbyName('crt').asString;
            end;
           }


        end;

        if TipoLeituraXML = xmlCte then
        begin
          qryUpdateTipFornecedor.Sql.Append('update fornecedores set tipofornecimento[1] = ''T'' where codigo  = '+qryFornecedor.fieldbyname('codigo').AsString+';');
          qryUpdateTipFornecedor.ExecSql;
        end;

        result := perpetrar([qryfornecedor]);


        if result then
        begin
          qryseriesfornecedores.paramByName('fornecedor').AsInteger := qryfornecedor.FieldByName('codigo').AsInteger;
          qryseriesfornecedores.paramByName('serie').AsString := IntToStr(ValorPropriedade('serie', 'Ide'));
          qryseriesfornecedores.close;
          qryseriesfornecedores.Open;

          if qryseriesfornecedores.recordcount = 0 then
          begin
            qryseriesfornecedores.append;
            qryseriesfornecedores.FieldByName('fornecedor').AsInteger := qryfornecedor.FieldByName('codigo').AsInteger;
            qryseriesfornecedores.FieldByName('serie').Asinteger := ValorPropriedade('serie', 'Ide');

            if TipoLeituraXML = XMLNfe then
              qryseriesfornecedores.FieldByName('modelodoctofiscal').AsString := '55'
            else
              qryseriesfornecedores.FieldByName('modelodoctofiscal').AsString := '57';

            qryseriesfornecedores.post;
            result := perpetrar([qryseriesfornecedores]);
          end
          else
          begin
            if TipoLeituraXML = xmlCte then
            begin
              if qryseriesfornecedores.FieldByName('modelodoctofiscal').Asinteger <> ACBrCTe1.Conhecimentos.Items[0].CTe.Ide.modelo then
              begin
                 qryseriesfornecedores.edit;
                 qryseriesfornecedores.FieldByName('modelodoctofiscal').Asinteger := ACBrCTe1.Conhecimentos.Items[0].CTe.Ide.modelo;
                 qryseriesfornecedores.post;
                 result := perpetrar([qryseriesfornecedores]);
              end;
            end
            else
            begin
              if qryseriesfornecedores.FieldByName('modelodoctofiscal').Asinteger <> ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.modelo then
              begin
                 qryseriesfornecedores.edit;
                 qryseriesfornecedores.FieldByName('modelodoctofiscal').Asinteger := ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.modelo;
                 qryseriesfornecedores.post;
                 result := perpetrar([qryseriesfornecedores]);
              end;
            end;
          end;
        end;
      end;
    end;

  {end;}

end;

procedure TdtmCadastroNotasFiscais.ImportarDadosCorpoNFE;
begin
  case TipoLeituraXML of
    XMLNfe :
    begin

      with ACBrNFe1.NotasFiscais.Items[0].NFe.Total.ICMSTot do
      begin
        qryNotaFiscalbaseicms.AsCurrency := vBC;
        qryNotaFiscalvaloricms.AsCurrency := vICMS;

        qryNotaFiscalbaseicmssubstituicao.AsCurrency := vBCST;
        qryNotaFiscalvaloricmssubstituicao.AsCurrency := vST;
        qryNotaFiscalvalorprodutos.ascurrency := vProd;
        qryNotaFiscalfreteinterno.AsCurrency := vFrete;
        qryNotaFiscalseguro.AsCurrency := vSeg;
        qryNotaFiscaldesconto.AsCurrency := vDesc;

        vOutroRateado := false;
        {Caso em que a os totais não fecham. Vem o faturamento e depois os impostos}
        if ((vNF - (vST + vProd + vFrete + vSeg - vDesc + vOutro + vIPI))<> 0) then
        begin
          qryNotaFiscaldespesasacessorias.AsCurrency := vNF - (vST + vProd + vFrete + vSeg - vDesc + vOutro + vIPI);
          vOutroRateado := true;
        end
        else
          qryNotaFiscaldespesasacessorias.AsCurrency := vOutro;

        qryNotaFiscalvaloripi.AsCurrency := vIPI;
        qryNotaFiscalTotalValorPIS.AsCurrency := vPIS;
        qryNotaFiscaltotalvalorcofins.AsCurrency := vCOFINS;
        qryNotaFiscalvalornota.AsCurrency := vNF;
      end;
      qryNotaFiscalemissao.asdatetime :=  ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.dEmi;

      qryNotaFiscalchv_nfe.AsString := SomenteNumero(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID);
      qryNotaFiscalmodelodocto.AsInteger := ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.modelo;
      qryNotaFiscalcrt.AsInteger := ValorPropriedade('CRT', 'Emit');

    end;

    XMLCte :
    begin

      qryNotaFiscalbaseicms.AsCurrency :=
         ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS00.vBC +
         ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS20.vBC +
         ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS90.vBC +
         ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMSOutraUF.vBCOutraUF ;

      qryNotaFiscalvaloricms.AsCurrency :=
         ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS00.vICMS +
         ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS20.vICMS +
         ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS90.vICMS +
         ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMSOutraUF.vICMSOutraUF;


      qryNotaFiscalbaseicmssubstituicao.AsCurrency := 0;
      qryNotaFiscalvaloricmssubstituicao.AsCurrency := 0;

      qryNotaFiscalvalorprodutos.ascurrency := ACBrCTe1.Conhecimentos.Items[0].CTe.vPrest.vTPrest;

      qryNotaFiscalfreteinterno.AsCurrency := 0;
      qryNotaFiscalseguro.AsCurrency := 0;
      qryNotaFiscaldesconto.AsCurrency := 0;


      vOutroRateado := false;
      {Caso em que a os totais não fecham. Vem o faturamento e depois os impostos}

      {
      if ((vNF - (vST + vProd + vFrete + vSeg - vDesc + vOutro + vIPI))<> 0) then
      begin
        qryNotaFiscaldespesasacessorias.AsCurrency := vNF - (vST + vProd + vFrete + vSeg - vDesc + vOutro + vIPI);
        vOutroRateado := true;
      end
      else
      }
        qryNotaFiscaldespesasacessorias.AsCurrency := 0;

      qryNotaFiscalvaloripi.AsCurrency := 0;
      qryNotaFiscalTotalValorPIS.AsCurrency := 0;
      qryNotaFiscaltotalvalorcofins.AsCurrency := 0;
      qryNotaFiscalvalornota.AsCurrency := ACBrCTe1.Conhecimentos.Items[0].CTe.vPrest.vTPrest;

      qryNotaFiscalemissao.asdatetime :=  ACBrCTe1.Conhecimentos.Items[0].CTe.Ide.dhEmi;

      if qryNotaFiscaldata.isnull then
        qryNotaFiscaldata.asdatetime := qryNotaFiscalemissao.asdatetime;

      qryNotaFiscalchv_nfe.AsString := SomenteNumero(ACBrCTe1.Conhecimentos.Items[0].CTe.infCTe.Id);
      qryNotaFiscalmodelodocto.AsInteger := ACBrCTe1.Conhecimentos.Items[0].CTe.Ide.modelo;

    end;

  end;
end;

procedure TdtmCadastroNotasFiscais.ImportarDadosVencimentoNFE;
var
  I : integer;
  vExisteDuplicataVencida: boolean;

  procedure ImportarDadosVencimento_CTe;
  var
    J : integer;
  begin
    with ACBrCTe1.Conhecimentos.Items[0].CTe.infCTeNorm do
    begin
      for J:=0 to Cobr.Dup.Count-1 do
      begin
        with Cobr.Dup.Items[J] do
        begin
          qryDuplicatas.Append;
          qryDuplicatasdatavencto.AsDateTime := dVenc;
          qryDuplicatasvalorvencto.AsCurrency := vDup;
          GravarDuplicataNotaFiscal;
          if dataservidor > qryDuplicatasdatavencto.AsDateTime then
             vExisteDuplicataVencida := true;
        end;
      end;
    end;
  end;


begin
  vExisteDuplicataVencida := false;

  case TipoLeituraXML of
    XMLNfe : begin

                if qryDuplicatas.RecordCount = 0 then
                begin
                 with ACBrNFe1.NotasFiscais.Items[0].NFe do
                 begin

                   for I:=0 to Cobr.Dup.Count-1 do
                   begin
                     with Cobr.Dup.Items[I] do
                     begin
                       qryDuplicatas.Append;
                       qryDuplicatasdatavencto.AsDateTime := dVenc;
                       qryDuplicatasvalorvencto.AsCurrency := vDup;
                       GravarDuplicataNotaFiscal;
                       if dataservidor > qryDuplicatasdatavencto.AsDateTime then
                          vExisteDuplicataVencida := true;
                     end;
                   end;

                 end;
                end;

             end;

    XMLCte : begin
               if qryDuplicatas.RecordCount = 0 then
               begin
                 if CondicaoIncluirDuplicatasCTe then
                    ImportarDadosVencimento_CTe;
               end;
             end;
  end;

  if vExisteDuplicataVencida then
    MensagemAviso('Existem duplicatas vencidas!');

end;

procedure TdtmCadastroNotasFiscais.ImportarProdutosNFE;
var
  I, J : integer;
  vSoma, vTotal_ProdutosNotasPagNFEvFrete, vTotalRateado : currency;
  vListaProdutosDescricao,
  vListaProdutosDescricaoinfAd,
  vListaCodigodeBarras,
  vProdCFOP,
  vDescricaoNatureza, vListaNCM : String;

  procedure AdicionarProdutoServico(CST: String; vTotalNota, vBC, pICMS, vICMS, pRedBC, vbcstret, pICMSSTRet, vICMSSTRet, PrecoUnitario: Currency);
  begin
    try
      fGerandoProdutos := true;

      qryProdutosNotaFiscal.Append;
      qryProdutosNotaFiscalprodutook.AsBoolean := true;

      qryProdutosNotaFiscalprodutodigitado.AsString  := qryProcuraProdutoNotaFiscalprodutovisual.AsString;
      qryProdutosNotaFiscalprodutovisual.AsString    := qryProcuraProdutoNotaFiscalprodutovisual.AsString;
      qryProdutosNotaFiscalproduto.AsLargeInt        := qryProcuraProdutoNotaFiscalproduto.AsLargeInt;

      qryProdutosNotaFiscalcodigofiscal.value := qryNotaFiscalcodigofiscal.value;
      qryProdutosNotaFiscalnatureza.value := qryNotaFiscalcodigonatureza.value;

      RefazConsultaPorNome(qryProcuraNaturezasProduto,['codigofiscal'],[qryProdutosNotaFiscalcodigofiscal.AsVariant]);

      qryProdutosNotaFiscalincidencia.AsString := cst;
      qryProdutosNotaFiscalcst_nf.AsString := cst;


      if ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMSSN.indSN<>0 then
      begin
        qryProdutosNotaFiscalcsosn.AsString := '101';
        qryProdutosNotaFiscalcsosn_nf.AsString := '101';
      end;


      qryProdutosNotaFiscalicmsbasecalculo.AsCurrency := vBC;
      qryProdutosNotaFiscalaliquotaicms.AsCurrency := pICMS;
      qryProdutosNotaFiscalicmsvalor.AsCurrency := vICMS;
      qryProdutosNotaFiscalpercentualreducaobase.AsCurrency := pRedBC;

      if ((vTotalNota - vBC) <> 0) and (vBC<>0) then
      begin
        qryNotaFiscaldespesasacessorias.ascurrency := vTotalNota - vBC;
        qryProdutosNotaFiscaldespesasacessorias.AsCurrency := vTotalNota - vBC;
      end;

      qryProdutosNotaFiscalvbcstret.AsCurrency := vbcstret;
  //    qryProdutosNotaFiscalpICMSSTRet.AsCurrency := pICMSSTRet;
      qryProdutosNotaFiscalvICMSSTRet.AsCurrency := vICMSSTRet;

      qryProdutosNotaFiscalquantidade.ascurrency := 1;
      qryProdutosNotaFiscalprecounitario.asFloat := PrecoUnitario;
      qryProdutosNotaFiscalprodutototal.asCurrency := PrecoUnitario;

      PostProdutosNotaFiscal;
    finally
      fGerandoProdutos := false;
    end;

  end;

  function situTrib: String;
  begin
    case ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.SituTrib of
      cst00 : result := '00';
      cst10 : result := '10';
      cst20 : result := '20';
      cst30 : result := '30';
      cst40 : result := '40';
      cst41 : result := '41';
      cst45 : result := '45';
      cst50 : result := '50';
      cst51 : result := '51';
      cst60 : result := '60';
      cst70 : result := '70';
      cst80 : result := '80';
      cst81 : result := '81';
      cst90 : result := '90';
      {
      cstPart10
      cstPart90,
      cstRep41,
      cstVazio
      cstICMSOutraUF
      cstICMSSN
      cstRep60
      }
    end;
  end;

begin

//  AbrirTabelaSituacaoProduto;


  try

    if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
      TfrmCadastroNotasFiscais(self.owner).Enabled := False;

    case TipoLeituraXML of
    XMLCte
      : begin
          if parsistema.Item_Vinculado_ao_CTe = '' then
            MensagemAviso('Verifique em ''Parametros do Sistema - Geral - Notas'''+chr(13)+
                          'O parâmetro ''Item Vinculado ao CTe - Conhecimento de Frete'' não está definido.');

          RefazConsultaPorNome(qryProcuraProdutoNotaFiscal, ['produtovisual','caracteristica','valorgrade1','valorgrade2'],
                               [parsistema.Item_Vinculado_ao_CTe,
                                null, null, null]);

          if qryProcuraProdutoNotaFiscal.recordcount = 1 then
          begin

            try
              qryProdutosNotaFiscal.AfterScroll := nil;
              qryProdutosNotaFiscal.DisableControls;
              dsrProdutosnotafiscal.OnDataChange := nil;
              qryProdutosNotaFiscal.Cancel;
              qryprodutosnotafiscal.AfterInsert := nil;


              if ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS00.vBC <> 0 then
                AdicionarProdutoServico('00',

                        ACBrCTe1.Conhecimentos.Items[0].CTe.vPrest.vTPrest,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS00.vBC,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS00.pICMS,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS00.vICMS, 0, 0, 0, 0,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS00.vBC);

              if ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS20.vBC <> 0 then
                AdicionarProdutoServico('20',
                        ACBrCTe1.Conhecimentos.Items[0].CTe.vPrest.vTPrest,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS20.vBC,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS20.pICMS,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS20.vICMS,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS20.pRedBC,
                        0, 0, 0,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS20.vBC);

              if (ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS45.CST in [cst40, cst41, cst50]) then
                AdicionarProdutoServico('41',
                ACBrCTe1.Conhecimentos.Items[0].CTe.vPrest.vTPrest,
                0, 0, 0, 0, 0, 0, 0, ACBrCTe1.Conhecimentos.Items[0].CTe.vPrest.vTPrest );

              if ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS60.vBCSTRet <> 0 then
                AdicionarProdutoServico('60',
                        ACBrCTe1.Conhecimentos.Items[0].CTe.vPrest.vTPrest,
                        0,0,0,0,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS60.vBCSTRet,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS60.pICMSSTRet,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS60.vICMSSTRet,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS60.vBCSTRet);

              if ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS90.vBC <> 0 then
                AdicionarProdutoServico('90',
                        ACBrCTe1.Conhecimentos.Items[0].CTe.vPrest.vTPrest,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS90.vBC,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS90.pICMS,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS90.vICMS,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS90.pRedBC,
                        0,0,0,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMS90.vBC);


              if ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMSOutraUF.vBCOutraUF <> 0 then
                AdicionarProdutoServico('90',
                        ACBrCTe1.Conhecimentos.Items[0].CTe.vPrest.vTPrest,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMSOutraUF.vBCOutraUF,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMSOutraUF.pICMSOutraUF,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMSOutraUF.vICMSOutraUF,
                        0,
                        0,0,0,
                        ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMSOutraUF.vBCOutraUF);


              if (ACBrCTe1.Conhecimentos.Items[0].CTe.imp.ICMS.ICMSSN.indSN<>0) then
                AdicionarProdutoServico('90',
                ACBrCTe1.Conhecimentos.Items[0].CTe.vPrest.vTPrest,
                0, 0, 0, 0, 0, 0, 0, ACBrCTe1.Conhecimentos.Items[0].CTe.vPrest.vTPrest);

              if qryProdutosNotaFiscal.isempty then
              begin

                AdicionarProdutoServico(SituTrib,
                ACBrCTe1.Conhecimentos.Items[0].CTe.vPrest.vTPrest,
                0, 0, 0, 0, 0, 0, 0, ACBrCTe1.Conhecimentos.Items[0].CTe.vPrest.vTPrest);

              end;

            finally

              AtualizaSQLProdutosExistenteNotas;
              CalcularImpostos(false);
              qryprodutosnotafiscal.AfterInsert := qryProdutosNotaFiscalAfterInsert;
              qryProdutosNotaFiscal.AfterScroll     := qryProdutosNotaFiscalAfterScroll;
              dsrProdutosnotafiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
              qryProdutosNotaFiscal.EnableControls;

            end;

          end;

        end;

    XMLNfe
     : begin

         if qryProdutosNotasPagNFE.active then
         begin

           DesligarEventosProdutosNotasPagNFE;
           DesligarEventosProdutosNotasPagNFEItems;

           ApagarProdutosNotasPagNFE;

           vListaProdutosDescricao := '';
           vListaProdutosDescricaoinfAd := '';
           vListaCodigodeBarras := '';

           if parsistema.AtualizarNCMNotaEntrada then
           begin
             with ACBrNFe1.NotasFiscais.Items[0].NFe do
             begin
               for I := 0 to Det.Count-1 do
               with Det.Items[I] do
                 vListaNCM := vListaNCM+quotedstr(Prod.ncm)+','
             end;
             delete(vListaNCM,length(vListaNCM),1);
             qryIPI.MacroByName('vListaNCM').asString := vListaNCM;

    //         qryIPI.mastersource := nil;

             qryipi.Close;
             qryipi.Open;

             qryncmtabela.close;
           end;


           with ACBrNFe1.NotasFiscais.Items[0].NFe do
           begin

             for I := 0 to Det.Count-1 do
             begin

               with Det.Items[I] do
               begin

                 qryProdutosNotasPagNFE.Append;
                 qryProdutosNotasPagNFEcodigonota.AsInteger := qryNotaFiscalcodigo.AsInteger;
                 qryProdutosNotasPagNFEnumero.AsInteger := Prod.nItem;
                 qryProdutosNotasPagNFEprodutonofornecedor.AsString := Prod.cProd;
                 qryProdutosNotasPagNFEdescricaofornecedor.AsString := utf8decode_(Prod.xProd);

                 vListaProdutosDescricao :=
                   vListaProdutosDescricao + '('+quotedstr(Prod.cProd)+','+
                                     quotedstr(utf8decode_(Prod.xProd))+'),';

                 vListaProdutosDescricaoinfAd :=
                   vListaProdutosDescricaoinfAd + '('+quotedstr(Prod.cProd)+','+
                                          quotedstr(utf8decode_(Prod.xProd))+','+
                                          quotedstr(Det.Items[I].infAdProd)+'),';

                 vListaCodigodeBarras :=
                   vListaCodigodeBarras +  quotedstr(Prod.cEANTRIB)+',';


          //       qryProdutosNotasPagNFEcEAN.asstring :=  Prod.cEAN;


                 qryProdutosNotasPagNFEncmfornecedor.asstring :=  Prod.ncm;
          //       qryProdutosNotasPagNFEEXTIPI.asstring :=  Prod.EXTIPI;

                 if parsistema.AtualizarNCMNotaEntrada then
                 begin
                   if qryipi.Locate('classificacaofiscal',Prod.ncm,[]) then
                   begin
                     qryProdutosNotasPagNFEipi.asinteger := qryIPIcodigo.asinteger;
                     qryProdutosNotasPagNFEdescricaoipi.asString := qryIPIdescricao.asString;
                   end
                   else
                   begin

                     if not qryncmtabela.active then
                     begin
                       qryNCMTabela.MacroByName('vListaNCM').asString := vListaNCM;
                       qryNCMTabela.Close;
                       qryNCMTabela.Open;
                     end;

                     if qryNCMTabela.Locate('codigotipi',Prod.ncm,[]) then
                     begin
                       qryipiMAX.close;
                       qryipiMAX.open;

                       qryipi.filtered := false;
                       qryipi.append;
                       qryipicodigo.asinteger := qryipiMAX.fieldbyname('codigo').asinteger;
                       qryipidescricao.asString := copy(qryncmtabela.fieldbyname('descricao').asString, 1, qryipidescricao.size);
                       qryipialiquota.asCurrency := qryNCMTabela.fieldbyname('aliquota').asCurrency;
                       qryipiclassificacaofiscal.asString := qryNCMTabela.fieldbyname('codigotipi').asString;
                       qryIPIcodigodescricao.asString := qryipicodigo.asString + ' - ' + qryipidescricao.asString;
                       qryipi.post;
                       perpetrar([qryipi]);

                       qryProdutosNotasPagNFEipi.asinteger := qryIPIcodigo.asinteger;
                       qryProdutosNotasPagNFEdescricaoipi.asString := qryIPIdescricao.asString;
                       qryipi.filtered := true;

                     end;

                   end;
                 end;

                 qryProdutosNotasPagNFECFOP.asString :=  Prod.CFOP;
                 if vProdCFOP <> Prod.CFOP then
                   vDescricaoNatureza := ValorCampodaTabela('codigosfiscais',['codigo'],[Prod.CFOP],['descricao'])[0];

                 qryProdutosNotasPagNFEdescricaocfop.asString := vDescricaoNatureza;
                 vProdCFOP := Prod.CFOP;


                 qryProdutosNotasPagNFEuCOM.asString :=  ansiuppercase(utf8decode_(Prod.uCOM));


                 qryProdutosNotasPagNFEquantidade.AsFloat := Prod.qCom;
                 qryProdutosNotasPagNFEqtdeestoque.AsFloat := Prod.qCom;  {Fator por padrão é 1 na inclusão}

                 qryProdutosNotasPagNFEsaldoquantidade.asfloat := qryProdutosNotasPagNFEquantidade.AsFloat;

                 qryProdutosNotasPagNFEprecounitario.AsFloat := Prod.vUnCom;
                 qryProdutosNotasPagNFEdesconto.AsCurrency := Prod.vDesc;
                 qryProdutosNotasPagNFEvalortotal.AsCurrency := Prod.vProd;

                 {
                  Casos de NF da Amazonia onde o total dos produtos e outros valores não fecham com o total da nota que é o valor da st constante em outra NF,
                  Nesta vem somente o valor para o faturamento
                  5.105 - Venda de produção do estabelecimento que não deva por ele transitar
                  5.106 - Venda de mercadoria adquirida ou recebida de terceiros, que não deva por ele transitar
                 }
                 if {((Prod.CFOP mod 100) = 105) or
                    ((Prod.CFOP mod 100) = 106) then}
                    vOutroRateado then

                   qryProdutosNotasPagNFEdespesasacessorias.AsCurrency :=  RatearValores(qryNotaFiscaldespesasacessorias.AsCurrency,
                                                                                          qryNotaFiscalvalorprodutos.ascurrency,
                                                                                          qryProdutosNotasPagNFEvalortotal.AsCurrency)
                 else
                   qryProdutosNotasPagNFEdespesasacessorias.AsCurrency := Prod.vOutro;



                 qryProdutosNotasPagNFEcEANTRIB.asstring :=  Prod.cEANTRIB;
          //       qryProdutosNotasPagNFEuTRIB.asString :=  Prod.uTRIB;
          //       qryProdutosNotasPagNFEqTrib.AsCurrency := Prod.qTrib;
          //       qryProdutosNotasPagNFEvUnTrib.AsString := Prod.vUnTrib;

                 qryProdutosNotasPagNFEvFrete.AsCurrency := Prod.vFrete;
                 qryProdutosNotasPagNFEvSeg.AsCurrency := Prod.vSeg;
                 qryProdutosNotasPagNFEinfadprod.asString := Det.Items[I].infAdProd;
          //       qryProdutosNotasPagNFEvDesc.AsCurrency := Prod.vDesc;
          //       qryProdutosNotasPagNFEvOutro.AsCurrency := Prod.vOutro;

          //       qryProdutosNotasPagNFEindTot.AsInteger := Prod.indTot;

                 with Imposto do
                 begin
                   with ICMS do
                   begin

                     if (ValorPropriedade('CRT', 'Emit') = '1') or
                        (ValorPropriedade('CRT', 'Emit') = '4') or
                        (ValorPropriedade('CRT', 'Emit') = '')  then
                       CST := cstVazio;

                     qryProdutosNotasPagNFEcsticms.asString   := CSTICMSToStr(CST);

                     qryProdutosNotasPagNFEcsosn.asString := CSOSNIcmsToStr(CSOSN);
                     qryProdutosNotasPagNFEorig.asString  := OrigToStr(ICMS.orig);

                     if ICMS.modBC <> pcnconversaonfe.dbiNenhum then
                       qryProdutosNotasPagNFEmodBC.asString := pcnconversaonfe.modBCToStr(ICMS.modBC);

                     if (ICMS.pRedBC <> 100) then {Este valor (100) esta presente em um xml da Gama porém incoerente pois exists vbcicmsst}
                       qryProdutosNotasPagNFEpRedBC.asCurrency := ICMS.pRedBC
                     else
                       qryProdutosNotasPagNFEpRedBC.asCurrency := 0.00;

                     qryProdutosNotasPagNFEpICMS.asCurrency  := ICMS.pICMS;
                     qryProdutosNotasPagNFEvBCICMS.asCurrency   := ICMS.vBC;
                     qryProdutosNotasPagNFEvICMS.asCurrency  := ICMS.vICMS;

                     qryProdutosNotasPagNFEmodBCST.asString  := pcnconversaonfe.modBCSTToStr(ICMS.modBCST);
                     if qryProdutosNotasPagNFEmodBCST.asString= '' then
                       qryProdutosNotasPagNFEmodBCST.clear;


                     qryProdutosNotasPagNFEpMVAST.asCurrency := ICMS.pMVAST;

                     if (ICMS.pRedBCST <> 100) then {Este valor (100) esta presente em um xml da Gama porém incoerente pois exists vbcicmsst}
                       qryProdutosNotasPagNFEpRedBCST.asCurrency := ICMS.pRedBCST
                     else
                       qryProdutosNotasPagNFEpRedBCST.asCurrency := 0.00;

                     qryProdutosNotasPagNFEpICMSST.asCurrency  := ICMS.pICMSST;
                     qryProdutosNotasPagNFEvBCICMSST.asCurrency := ICMS.vBCST;
                     qryProdutosNotasPagNFEvICMSST.asCurrency  := ICMS.vICMSST;

                     qryProdutosNotasPagNFEvICMSSTRet.asCurrency := ICMS.vBCSTRet;
                     qryProdutosNotasPagNFEvBCICMSSTRet.asCurrency := ICMS.vBCSTRet;

                     qryProdutosNotasPagNFEpCredSN.asCurrency  := ICMS.pCredSN;
                     qryProdutosNotasPagNFEvCredICMSSN.asCurrency  := ICMS.vCredICMSSN;
                   end;

                   with IPI do
                   begin
                     qryProdutosNotasPagNFEcstipi.asSTring := pcnconversaonfe.CSTIPIToStr(CST);
                     qryProdutosNotasPagNFEvBCIPI.asCurrency := vBC;
                     qryProdutosNotasPagNFEpIPI.asCurrency := pIPI;
                     qryProdutosNotasPagNFEvIPI.asCurrency := vIPI;
                   end;

                   with PIS do
                   begin
                     qryProdutosNotasPagNFEcstPIS.asSTring := ACBrDFe.Conversao.CSTPISToStr(CST);
                     qryProdutosNotasPagNFEvBCPIS.asCurrency := vBC;
                     qryProdutosNotasPagNFEpPIS.asCurrency := pPIS;
                     qryProdutosNotasPagNFEvPIS.asCurrency := vPIS;
                   end;

                   with COFINS do
                   begin
                     qryProdutosNotasPagNFEcstCOFINS.asSTring := ACBrDFe.Conversao.CSTCOFINSToStr(CST);
                     qryProdutosNotasPagNFEvBCCOFINS.asCurrency := vBC;
                     qryProdutosNotasPagNFEpCOFINS.asCurrency := pCOFINS;
                     qryProdutosNotasPagNFEvCOFINS.asCurrency := vCOFINS;
                   end;
                 end;

                 qryProdutosNotasPagNFE.post;

                 for J:=0 to Det.Items[I].Prod.rastro.Count-1 do
                 begin
                   if qryProdutosNotasPagNFELotes.locate('numerosequencianfe;nlote',
                          VarArrayof([qryProdutosNotasPagNFEnumero.AsInteger, Det.Items[I].Prod.rastro.Items[j].nLote]), []) then
                     qryProdutosNotasPagNFELotes.edit
                   else
                     qryProdutosNotasPagNFELotes.Append;

                   qryProdutosNotasPagNFELotesnumerosequencianfe.AsInteger := qryProdutosNotasPagNFEnumero.AsInteger;
                   qryProdutosNotasPagNFELotesnlote.asString := Det.Items[I].Prod.rastro.Items[j].nLote;
                   qryProdutosNotasPagNFELotesqlote.asCurrency := qryProdutosNotasPagNFELotesqlote.asCurrency + Det.Items[I].Prod.rastro.Items[j].qLote;
                   qryProdutosNotasPagNFELotesdfab.asCurrency := Det.Items[I].Prod.rastro.Items[j].dFab;
                   qryProdutosNotasPagNFELotesdval.asCurrency := Det.Items[I].Prod.rastro.Items[j].dVal;
                   qryProdutosNotasPagNFELotescagreg.AsString := Det.Items[I].Prod.rastro.Items[j].cAgreg;
                   qryProdutosNotasPagNFELotespermitealterar.asBoolean := false;
                   qryProdutosNotasPagNFELotes.post;
                 end;

                 qryProdutosNotasPagNFEcsticms.visible := not (qryProdutosNotasPagNFEcsosn.asString <> '');
                 qryProdutosNotasPagNFEcsosn.visible := (qryProdutosNotasPagNFEcsosn.asString <> '');
                 qryProdutosNotasPagNFEpCredSN.visible := (qryProdutosNotasPagNFEcsosn.asString <> '');
                 qryProdutosNotasPagNFEvCredICMSSN.visible := (qryProdutosNotasPagNFEcsosn.asString <> '');


                 vTotalRateado := 0;
                 if qryProdutosNotasPagNFELotes.recordcount > 1 then
                 begin

                   qryProdutosNotasPagNFELotes.first;
                   while not qryProdutosNotasPagNFELotes.eof do
                   begin

                     if qryProdutosNotasPagNFELotesqlote.asCurrency <> 0 then
                     begin

                       qryProdutosNotasPagNFELotes.GuardarRegistroAtual(false, false);

                       if qryProdutosNotasPagNFEItems.state <> dsinsert then
                         qryProdutosNotasPagNFEItems.Append;

                       qryProdutosNotasPagNFELotes.VoltarRegistro;

                       qryProdutosNotasPagNFEItemscodigonota.AsInteger :=  qryNotaFiscalcodigo.AsInteger;
                       qryProdutosNotasPagNFEItemsnumerosequencianfe.AsInteger := qryProdutosNotasPagNFEnumero.AsInteger;

                       if parsistema.Importar_o_numero_do_pedido_da_NFE then
                         if PossuiSomenteNumeroInteiro(Prod.xPed) then
                           if eHInteger(Prod.xPed) then
                             if (strtoint(Prod.xPed)<>0) then
                               qryProdutosNotasPagNFEItemspedido.AsString := Prod.xPed;

                       qryProdutosNotasPagNFEItemsquantidade.AsFloat := qryProdutosNotasPagNFELotesqlote.asCurrency;


                       qryProdutosNotasPagNFEItemsunidadenfe.AsString := ansiuppercase(utf8decode_(Prod.uCom));
                       qryProdutosNotasPagNFEItemsdescricaounidadenfe.AsString := qryProdutosNotasPagNFEItemsunidadenfe.AsString;

                       VerificarUnidadeNFE;

                       qryProdutosNotasPagNFEItemsprecounitario.AsFloat := Prod.vUnCom;

                       if qryProdutosNotasPagNFELotes.recno = qryProdutosNotasPagNFELotes.recordcount then
                         qryProdutosNotasPagNFEItemsvalortotal.AsCurrency := Prod.vProd - vTotalRateado
                       else
                       begin
                         qryProdutosNotasPagNFEItemsvalortotal.AsCurrency := RatearValores(Prod.vProd, Prod.qCom, qryProdutosNotasPagNFEItemsquantidade.AsFloat);
                         vTotalRateado := vTotalRateado + qryProdutosNotasPagNFEItemsvalortotal.AsCurrency;
                       end;

                       if qryProdutosNotasPagNFELotesnlote.asString<>'' then
                         qryProdutosNotasPagNFEItemsnlote.AsString := qryProdutosNotasPagNFELotesnlote.asString
                       else
                         qryProdutosNotasPagNFEItemsnlote.clear;

                       if (qryProdutosNotasPagNFEItems.State in [dsinsert, dsedit]) then
                         qryProdutosNotasPagNFEItems.post;

                       qryProdutosNotasPagNFELotes.VoltarRegistro;

                       qryProdutosNotasPagNFELotes.edit;
                       qryProdutosNotasPagNFELotesqtatribuida.asCurrency := qryProdutosNotasPagNFELotesqlote.asCurrency;
                       qryProdutosNotasPagNFELotesqtatribuidaestoque.asCurrency := qryProdutosNotasPagNFELotesqlote.asCurrency;  {Não usado para nada}
                       qryProdutosNotasPagNFELotes.post;

                       qryProdutosNotasPagNFE.edit;
                       qryProdutosNotasPagNFEsaldoquantidade.asfloat :=
                         qryProdutosNotasPagNFEsaldoquantidade.asfloat -
                           qryProdutosNotasPagNFEItemsquantidade.AsFloat;
                       qryProdutosNotasPagNFE.post;

                     end;

                     qryProdutosNotasPagNFELotes.next;

                   end;

                   if qryProdutosNotasPagNFEsaldoquantidade.asfloat < 0 then
                     SituacaoProdutosNotasPagNFEsaldoquantidade;

                 end
                 else
                 begin

                   if qryProdutosNotasPagNFEItems.state <> dsinsert then
                     qryProdutosNotasPagNFEItems.Append;

                   qryProdutosNotasPagNFEItemscodigonota.AsInteger :=  qryNotaFiscalcodigo.AsInteger;
                   qryProdutosNotasPagNFEItemsnumerosequencianfe.AsInteger := qryProdutosNotasPagNFEnumero.AsInteger;

                   if parsistema.Importar_o_numero_do_pedido_da_NFE then
                     if PossuiSomenteNumeroInteiro(Prod.xPed) then
                       if eHInteger(Prod.xPed) then
                         if (strtoint(Prod.xPed)<>0) then
                           qryProdutosNotasPagNFEItemspedido.AsString := Prod.xPed;

                   qryProdutosNotasPagNFEItemsquantidade.AsFloat := Prod.qCom;
                   qryProdutosNotasPagNFEItemsunidadenfe.AsString := ansiuppercase(utf8decode_(Prod.uCom));
                   qryProdutosNotasPagNFEItemsdescricaounidadenfe.AsString := qryProdutosNotasPagNFEItemsunidadenfe.AsString;

                   VerificarUnidadeNFE;

                   qryProdutosNotasPagNFEItemsprecounitario.AsFloat := Prod.vUnCom;
                   qryProdutosNotasPagNFEItemsvalortotal.AsCurrency := Prod.vProd;

    //               SelecionarDadosNatureza(qryProcuraNaturezas, qryProdutosNotasPagNFEItems);

                   if qryProdutosNotasPagNFELotesnlote.asString<>'' then
                   begin
                     qryProdutosNotasPagNFEItemsnlote.AsString := qryProdutosNotasPagNFELotesnlote.asString;

                     qryProdutosNotasPagNFE.edit;
                     qryProdutosNotasPagNFEsaldoquantidade.asfloat :=
                       qryProdutosNotasPagNFEsaldoquantidade.asfloat -
                         qryProdutosNotasPagNFEItemsquantidade.AsFloat;
                     qryProdutosNotasPagNFE.post;


                   end
                   else
                     qryProdutosNotasPagNFEItemsnlote.clear;

                   if (qryProdutosNotasPagNFEItems.State in [dsinsert, dsedit]) then
                     qryProdutosNotasPagNFEItems.post;

                 end;

               end;
               vPosition:=  (i * 100) / (Det.Count - 1);

               if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
               begin
                 TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).visible := true;
                 TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).Appearance.ValueFormat := 'Adicionando produtos da NFe  %.0f%%';
                 TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).Position := vPosition;
               end;

               Application.ProcessMessages;

             end;


  //           qryIPI.mastersource := dsrProdutosNotasPagNFE;

             if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
               TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).visible := false;

             delete(vListaProdutosDescricao, length(vListaProdutosDescricao), 1);
             delete(vListaProdutosDescricaoinfAd, length(vListaProdutosDescricaoinfAd), 1);
             delete(vListaCodigodeBarras, length(vListaCodigodeBarras), 1);


             qryProdutosFornecedores.MacroByName('CondicaoPorChavePrimaria').asString := '';
             qryProdutosFornecedores.MacroByName('CondicaoPorProdutonoFornecedor').asString :=

                'and case when c.grade1 is null and c.grade2 is null then '+
                '(pf.produtonofornecedor, pf.descricaonofornecedor) in ( '+

                   vListaProdutosDescricao +

                ') else  (pf.produtonofornecedor, pf.descricaonofornecedor, pf.infadprod ) in ('+

                   vListaProdutosDescricaoInfAd +

                ') end '+
                'and pf.fornecedor = :fornecedor '+
                'and pf.tipofornecedor = :tipofornecedor '+
                'and ((pf.serienota is null or pf.serienota = :SerieNota) and (pf.numeronota is null or pf.NumeroNota = :NumeroNota))';

             qryProdutosFornecedores.MacroByName('CondicaoPorNumerodeNota').asString := '';

             refazconsultapornome(qryProdutosFornecedores, ['fornecedor','tipofornecedor','SerieNota','NumeroNota'],
                                  [qryNotaFiscalfornecedor.asstring,
                                   qryNotaFiscalTipofornecedor.asstring,
                                   qryNotaFiscalserie.asstring,
                                   qryNotaFiscalnrdocumento.AsInteger]);


             qryProcuraProdutoSimples.macrobyname('ListaCodigoBarras').asString := vListaCodigodeBarras;
             qryProcuraProdutoSimples.close;
             qryProcuraProdutoSimples.open;



             qryProdutosNotasPagNFE.first;
             while not  qryProdutosNotasPagNFE.eof do
             begin

               qryProdutosNotasPagNFEItems.first;
               while not  qryProdutosNotasPagNFEItems.eof do
               begin

                 if qryProdutosFornecedores.locate('produtonofornecedor;descricaonofornecedor;infadprod;fornecedor;tipofornecedor',
                       VarArrayOf([qryProdutosNotasPagNFEprodutonofornecedor.AsString,
                         qryProdutosNotasPagNFEdescricaofornecedor.AsString,
                         qryProdutosNotasPagNFEinfadprod.AsString,
                         qryNotaFiscalfornecedor.asstring, qryNotaFiscalTipofornecedor.asstring]),[]) then
                 begin

                   if qryProdutosFornecedoresprodutovisual.AsString<>'' then
                   begin

                     RefazConsultaPorNome(qryProcuraProdutoNotaFiscal, ['produtovisual','caracteristica','valorgrade1','valorgrade2'],
                                           [qryProdutosFornecedoresprodutovisual.AsString,
                                            null, null, null]);

                     if qryProcuraProdutoNotaFiscal.recordcount = 1 then
                     begin
                       AtribuirDados(qryProdutosNotasPagNFEItems,
                           [qryProdutosNotasPagNFEItemsproduto,
                            qryProdutosNotasPagNFEItemsprodutovisual,
                            qryProdutosNotasPagNFEItemsprodutodigitado],
                           [qryProdutosFornecedoresproduto.asstring,
                            qryProdutosFornecedoresprodutovisual.asstring,
                            qryProdutosFornecedoresprodutovisual.asstring]);

                            {
                       qryProdutosNotasPagNFEItems.edit;
                       qryProdutosNotasPagNFEItemsproduto.asstring := qryProdutosFornecedoresproduto.asstring;
                       qryProdutosNotasPagNFEItemsprodutovisual.asstring := qryProdutosFornecedoresprodutovisual.asstring;
                       qryProdutosNotasPagNFEItemsprodutodigitado.asstring := qryProdutosFornecedoresprodutovisual.asstring;
                       }

                     end;
                   end
                   else
                   begin

                     RefazConsultaPorNome(qryProcuraProdutoNotaFiscal, ['produtovisual','caracteristica','valorgrade1','valorgrade2'],
                                           [qryProdutosNotasPagNFEprodutonofornecedor.AsString,
                                            null, null, null]);

                     if qryProcuraProdutoNotaFiscal.recordcount = 1 then
                     begin
                       AtribuirDados(qryProdutosNotasPagNFEItems,
                           [qryProdutosNotasPagNFEItemsproduto,
                            qryProdutosNotasPagNFEItemsprodutovisual,
                            qryProdutosNotasPagNFEItemsprodutodigitado],
                           [qryProcuraProdutoNotaFiscalproduto.asstring,
                            qryProcuraProdutoNotaFiscalprodutovisual.asstring,
                            qryProcuraProdutoNotaFiscalprodutovisual.asstring]);

                            {
                       qryProdutosNotasPagNFEItems.edit;
                       qryProdutosNotasPagNFEItemsproduto.asstring := qryProcuraProdutoNotaFiscalproduto.asstring;
                       qryProdutosNotasPagNFEItemsprodutovisual.asstring := qryProcuraProdutoNotaFiscalprodutovisual.asstring;
                       qryProdutosNotasPagNFEItemsprodutodigitado.asstring := qryProcuraProdutoNotaFiscalprodutovisual.asstring;
                       }
                     end;
                   end;

                   if qryProcuraProdutoNotaFiscal.recordcount = 1 then
                   begin
                     VerificarCampos_ProdutosNotasPagNFEItems(qryProdutosNotasPagNFEItems, qryProdutosNotasPagNFEItemsprodutodigitado);
                     if not qryProdutosNotasPagNFEItemspedido.isnull then
                       VerificarCampos_ProdutosNotasPagNFEItems(qryProdutosNotasPagNFEItems, qryProdutosNotasPagNFEItemspedido);


    //                 dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemsprodutodigitado);
    {                 dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemspedido);
                     qryProcuraNaturezasProdutoNFE.Close;
                     dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemscodigofiscal);}
                   end
                   else
                   begin
                     qryProcuraProdutoNotaFiscal.close;
                     SituacaoProduto(true);
                   end;

                   if (qryProdutosNotasPagNFEItems.State in [dsinsert, dsedit]) then
                     qryProdutosNotasPagNFEItems.post;


                 end
                 else
                 begin
                   if qryProcuraProdutoSimples.locate('codigobarras', qryProdutosNotasPagNFEceantrib.AsString, []) then
                   begin

                     AtribuirDados(qryProdutosNotasPagNFEItems,
                         [qryProdutosNotasPagNFEItemsproduto,
                          qryProdutosNotasPagNFEItemsprodutovisual,
                          qryProdutosNotasPagNFEItemsprodutodigitado],
                         [qryProcuraProdutoSimplesproduto.asstring,
                          qryProcuraProdutoSimplesprodutovisual.asstring,
                          qryProdutosNotasPagNFEceantrib.AsString]);

                          {
                     qryProdutosNotasPagNFEItems.edit;
                     qryProdutosNotasPagNFEItemsproduto.asstring := qryProcuraProdutoSimplesproduto.asstring;
                     qryProdutosNotasPagNFEItemsprodutovisual.asstring := qryProcuraProdutoSimplesprodutovisual.asstring;
                     qryProdutosNotasPagNFEItemsprodutodigitado.asstring := qryProdutosNotasPagNFEceantrib.AsString;
                     }

                     if (qryProdutosNotasPagNFEItems.State in [dsinsert, dsedit]) then
                       qryProdutosNotasPagNFEItems.post;

                     VerificarCampos_ProdutosNotasPagNFEItems(qryProdutosNotasPagNFEItems, qryProdutosNotasPagNFEItemsprodutodigitado);
    //                 dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemsprodutodigitado);
                    { dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemspedido);
                     qryProcuraNaturezasProdutoNFE.Close;
                     dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemscodigofiscal);}

                     if (qryProdutosNotasPagNFEItems.State in [dsinsert, dsedit]) then
                       qryProdutosNotasPagNFEItems.post;

                   end
                   else
                   begin
                     qryProcuraProdutoNotaFiscal.close;
                     SituacaoProduto(true);
                   end;

                 end;
                 qryProdutosNotasPagNFEItems.next;
               end;

               qryProdutosNotasPagNFE.next;

               vPosition :=  (qryProdutosNotasPagNFE.RecNo * 100) / qryProdutosNotasPagNFE.recordcount;

               if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
               begin
                 TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).visible := true;
                 TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).Appearance.ValueFormat := 'Atribuindo produtos dos fornecedores %.0f%%';

                 TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).Position := vPosition;
               end;

               Application.ProcessMessages;

             end;

             if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
               TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).visible := false;


              {Acertar centavos em caso de rateio}
             if vOutroRateado then
             begin
                vSoma := SomarValores(qryProdutosNotasPagNFE, [qryProdutosNotasPagNFEdespesasacessorias], [], [], []);
                if (vSoma - qryNotaFiscaldespesasacessorias.AsCurrency) <> 0 then
                begin
                  qryProdutosNotasPagNFE.edit;
                  qryProdutosNotasPagNFEdespesasacessorias.AsCurrency := qryProdutosNotasPagNFEdespesasacessorias.AsCurrency + (vSoma - qryNotaFiscaldespesasacessorias.AsCurrency);
                  qryProdutosNotasPagNFE.post;
                end;
             end;

           end;
           LigarEventosProdutosNotasPagNFE;
           LigarEventosProdutosNotasPagNFEItems;

           qryProdutosNotasPagNFE.First;
           qryProdutosNotasPagNFEItems.First;

           vTotal_ProdutosNotasPagNFEvFrete := SomarValores(qryProdutosNotasPagNFE, [qryProdutosNotasPagNFEvfrete], [], [], []);

           if vTotal_ProdutosNotasPagNFEvFrete <> qryNotaFiscalfreteinterno.AsCurrency then
           begin
              try

                vTotal_ProdutosNotasPagNFEvFrete := 0;

                qryProdutosNotasPagNFE.AfterScroll := nil;
                qryProdutosNotasPagNFE.onFilterRecord := nil;

                qryProdutosNotasPagNFE.First;

                while not qryProdutosNotasPagNFE.eof do
                begin
                  qryProdutosNotasPagNFE.edit;

                  if qryProdutosNotasPagNFE.recno = qryProdutosNotasPagNFE.recordcount then
                    qryProdutosNotasPagNFEvFrete.asCurrency := qryNotaFiscalfreteinterno.AsCurrency - vTotal_ProdutosNotasPagNFEvFrete
                  else
                    qryProdutosNotasPagNFEvFrete.asCurrency := RatearValores(qryNotaFiscalfreteinterno.AsCurrency,
                                                 qryNotaFiscalvalorprodutos.ascurrency,
                                                 qryProdutosNotasPagNFEvalortotal.AsCurrency);

                  qryProdutosNotasPagNFE.post;

                  vTotal_ProdutosNotasPagNFEvFrete := vTotal_ProdutosNotasPagNFEvFrete + qryProdutosNotasPagNFEvFrete.asCurrency;

                  qryProdutosNotasPagNFE.next;
                end;

              finally
                if vLigarEventosProdutosNotasPagNFEItems then
                  qryProdutosNotasPagNFE.AfterScroll := qryProdutosNotasPagNFEAfterScroll;
                qryProdutosNotasPagNFE.onFilterRecord := qryProdutosNotasPagNFEFilterRecord;
              end;


           end;
         end;
       end;
    end;

  finally

    if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
      TfrmCadastroNotasFiscais(self.owner).Enabled := True;

  end;
end;


procedure TdtmCadastroNotasFiscais.SelecionarProdutoNFE;
begin

  GuardarPosicaoProdutosNotasPagNFE;
  if qryProdutosNotasPagNFEItems.State = dsBrowse then
    qryProdutosNotasPagNFEItems.Edit;

  qryProdutosNotasPagNFEItemsprodutodigitado.AsString    := qryConsultaProdutosNotaFiscalcodigovisual.AsString;
  dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemsprodutodigitado);
  VoltarPosicaoProdutosNotasPagNFE;
  VerificarValoresProdutosNotasPagNFEItems;

end;


procedure TdtmCadastroNotasFiscais.AtualizarCodigoFiscalProdutosNFE;
var
 vRegistroAtual: TbookMark;
begin

  try

    if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
      TfrmCadastroNotasFiscais(self.owner).Enabled := False;

    if TipoLeituraXML = XMLCte then
    begin

      qryProdutosNotaFiscal.First;
      while not qryProdutosNotaFiscal.eof do
      begin
        FCodigoFiscalProdutoOriginal                := 0;
        qryProdutosNotaFiscal.edit;
        qryProdutosNotaFiscalnatureza.AsInteger     := qryNotaFiscalcodigonatureza.AsInteger;
        qryProdutosNotaFiscalgerarpagamento.AsBoolean := qryProcuraNaturezasgerarpagamento.AsBoolean;
        qryProdutosNotaFiscalcodigofiscal.AsInteger := qryNotaFiscalcodigofiscal.AsInteger;
        qryProdutosNotaFiscalnaogerarcreditoicms.AsBoolean := qryProcuraNaturezasnaogerarcreditoicms.AsBoolean;
        qryProdutosNotaFiscalnaogerarcreditoipi.AsBoolean := qryProcuraNaturezasnaogerarcreditoipi.AsBoolean;
        qryProdutosNotaFiscalicmssobreipi.AsBoolean := qryProcuraNaturezasicmssobreipi.AsBoolean;
        qryProdutosNotaFiscalicmssobredespesasacessorias.AsBoolean := qryProcuraNaturezasicmssobredespesasacessorias.AsBoolean;
        qryProdutosNotaFiscalnaocalcularipisobrefrete.AsBoolean := qryProcuraNaturezasnaocalcularipisobrefrete.AsBoolean;
        FCodigoFiscalProdutoOriginal                := qryProdutosNotaFiscalcodigofiscal.AsInteger;
        qryProdutosNotaFiscal.next;

      end;

      if (qryProdutosNotaFiscal.State in [dsinsert, dsedit]) then
        PostProdutosNotaFiscal;

      CalcularImpostos;

    end
    else
    begin

      if qryProdutosNotasPagNFE.Active then
      begin
        fAtualizarCodigoFiscalProdutosNFE := true;
        vRegistroAtual := qryProdutosNotasPagNFE.getbookmark;

        DesligarEventosProdutosNotasPagNFEItems;

        qryProcuraNaturezasProdutoNFE.BeforeOpen := nil;

        if qryProcuraNaturezasProdutoNFE.MacroByName('CodigoNaturezaPadrao').AsString <> ' and (naturezas.codigo = ' + IntToStr(qryNotaFiscalcodigonatureza.asinteger) + ') ' then
          qryProcuraNaturezasProdutoNFE.MacroByName('CodigoNaturezaPadrao').AsString := ' and (naturezas.codigo = ' + IntToStr(qryNotaFiscalcodigonatureza.asinteger) + ') ';

        ReFazConsultapornome(qryProcuraNaturezasProdutoNFE,['codigofiscal'],[qryNotaFiscalcodigofiscal.asinteger], true);

        qryProcuraNaturezasProdutoNFE.BeforeOpen := qryProcuraNaturezasProdutoNFEBeforeOpen;

        qryProdutosNotasPagNFE.first;
        while not qryProdutosNotasPagNFE.eof do
        begin
          qryProdutosNotasPagNFEItems.first;
          while not qryProdutosNotasPagNFEItems.eof do
          begin
            qryProdutosNotasPagNFEItems.edit;
            SelecionarDadosNatureza(qryProcuraNaturezas, qryProdutosNotasPagNFEItems);
            if qryProdutosNotasPagNFEItems.state in [dsedit, dsinsert] then
              qryProdutosNotasPagNFEItems.post;
            qryProdutosNotasPagNFEItems.Next;
          end;
          qryProdutosNotasPagNFE.Next;

          vPosition :=  (qryProdutosNotasPagNFE.RecNo * 100) / qryProdutosNotasPagNFE.recordcount;

          if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
          begin
            TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).visible := true;
            TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).Appearance.ValueFormat := 'Atribuindo CFOP aos produtos %.0f%%';

            TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).Position := vPosition;
          end;

          Application.ProcessMessages;

        end;

        if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
          TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).visible := false;

        vAtualizandoCodigoFiscalProdutosNFE := true;

        qryProdutosNotasPagNFE.first;
        while not qryProdutosNotasPagNFE.eof do
        begin
          qryProdutosNotasPagNFEItems.first;
          while not qryProdutosNotasPagNFEItems.eof do
          begin
  //          if not qryProdutosNotasPagNFEItemsprodutodigitado.isnull then
            begin

              qryProdutosNotasPagNFEItems.edit;


              FCodigoFiscalProdutoNFEOriginal := qryProdutosNotasPagNFEItemscodigofiscal.asinteger;

  //            dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemsprodutodigitado);
  //            dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemspedido);
  //            qryProcuraNaturezasProdutoNFE.Close;
  //            dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemscodigofiscal);


              VerificarCampos_ProdutosNotasPagNFEItems(qryProdutosNotasPagNFE, qryProdutosNotasPagNFEItemscodigofiscal);

              FCodigoFiscalProdutoNFEOriginal := qryProdutosNotasPagNFEItemscodigofiscal.asinteger;

              if qryProdutosNotasPagNFEItems.state in [dsedit, dsinsert] then
                qryProdutosNotasPagNFEItems.post;
            end;

            qryProdutosNotasPagNFEItems.Next;
          end;
          qryProdutosNotasPagNFE.Next;

          vPosition :=  (qryProdutosNotasPagNFE.RecNo * 100) / qryProdutosNotasPagNFE.recordcount;

          if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
          begin
            TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).visible := true;
            TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).Appearance.ValueFormat := 'Adicionando Produtos identificados a nota fiscal %.0f%%';

            TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).Position := vPosition;
          end;

          Application.ProcessMessages;

        end;

        if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
          TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).visible := false;


        LigarEventosProdutosNotasPagNFEItems;

        qryProdutosNotasPagNFE.GotoBookmark(vRegistroAtual);


    //    qryProcuraNaturezasProdutoNFE.ParamByName('codigofiscal').AsInteger := qryProdutosNotasPagNFEItemscodigofiscal.asinteger;
    //    qryProcuraNaturezasProdutoNFE.close;
    //    qryProcuraNaturezasProdutoNFE.open;
        fAtualizarCodigoFiscalProdutosNFE := false;

        vAtualizandoCodigoFiscalProdutosNFE := false;
        CalcularImpostos{(false)};
        AtualizaSQLProdutosExistenteNotas;
        if qryProdutosNotaFiscal.recordcount <> 0 then
        begin
          GravarNotaParcial;
          EditarNotaFiscal;
        end;
      end;
    end;

  finally

    if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
      TfrmCadastroNotasFiscais(self.owner).Enabled := true;

  end;

end;

procedure TdtmCadastroNotasFiscais.ListaErroProdutosNFE(
  descricaoerro, complementodescricaoerro: string; operacao: TipoOperacaoErroProdutoNFE;
  TipodeProcura: TLocateOption;
  Erro : Boolean;
  ReatualizarProduto : Boolean;
  RemoverProdutodaLista : Boolean);
begin
  if qryprodutosnotaspagnfe.active then
  begin
    if (qryProdutosNotasPagNFEItemsnumero.AsInteger <> 0) then
    begin
      if vLigarEventosProdutosNotasPagNFEItems then
        qryProdutosNotasPagNFEItems.AfterPost := nil;

      case operacao of
        opAdicionar :  begin
                         if not qryProdutosNotasPagNFEItemsSituacao.Locate('numerosequencianfe;numerosequencianfeitens;situacao',
                            VarArrayOf([qryProdutosNotasPagNFEnumero.AsInteger,
                                        qryProdutosNotasPagNFEItemsnumero.AsInteger,
  //                                    uppercase(descricaoerro)]),[]) then
                                        descricaoerro]),[TipodeProcura]) then
                         begin
                           qryProdutosNotasPagNFEItemsSituacao.Append;
  //                       qryProdutosNotasPagNFEItemsSituacaosituacao.AsString := uppercase(descricaoerro);
                           qryProdutosNotasPagNFEItemsSituacaosituacao.AsString := DescricaoErro;

                           if complementodescricaoerro<>'' then
                             qryProdutosNotasPagNFEItemsSituacaosituacao.AsString :=
                               qryProdutosNotasPagNFEItemsSituacaosituacao.AsString +
                               complementodescricaoerro;

                           qryProdutosNotasPagNFEItemsSituacaoerro.AsBoolean := erro;
                           qryProdutosNotasPagNFEItemsSituacao.Post;
                         end
                         else
                         begin
                           if ReatualizarProduto then
                           begin
                             qryProdutosNotasPagNFEItemsSituacao.Edit;
                             qryProdutosNotasPagNFEItemsSituacaosituacao.AsString := DescricaoErro;

                             if complementodescricaoerro<>'' then
                               qryProdutosNotasPagNFEItemsSituacaosituacao.AsString :=
                                 qryProdutosNotasPagNFEItemsSituacaosituacao.AsString +
                                 complementodescricaoerro;

                             qryProdutosNotasPagNFEItemsSituacaoerro.AsBoolean := erro;
                             qryProdutosNotasPagNFEItemsSituacao.Post;
                           end;
                         end;

//                         if qryProdutosNotasPagNFEItems.State = dsinsert then
//                           qryProdutosNotasPagNFEItems.post;

                         if qryProdutosNotasPagNFEItemsregistrosemerro.AsBoolean and erro then
                         begin
                           qryProdutosNotasPagNFEItems.Edit;
                           qryProdutosNotasPagNFEItemsregistrosemerro.AsBoolean := false;
//                           qryProdutosNotasPagNFEItems.post;


                           qryProdutosNotasPagNFE.Edit;
                           qryProdutosNotasPagNFERegistroSemErro.AsBoolean := false;
                           qryProdutosNotasPagNFE.POST;


                         end
                         else
                         if not qryProdutosNotasPagNFEItemsalerta.AsBoolean and not erro then
                         begin
                           qryProdutosNotasPagNFEItems.Edit;
                           qryProdutosNotasPagNFEItemsalerta.AsBoolean := true;
//                           qryProdutosNotasPagNFEItems.post;

                           qryProdutosNotasPagNFE.Edit;
                           qryProdutosNotasPagNFEalerta.AsBoolean := true;
                           qryProdutosNotasPagNFE.post;

                         end;

                         qryProdutosNotasPagNFEItemsSituacao.edit;
                         if not RemoverProdutodaLista then
                           qryProdutosNotasPagNFEItemsSituacaodetalheerro.asinteger := 1
                         else
                           qryProdutosNotasPagNFEItemsSituacaodetalheerro.asinteger := 0;
                         qryProdutosNotasPagNFEItemsSituacao.post;


                         if erro then
                         begin
                           if qryProdutosNotasPagNFEItemsSituacaodetalheerro.asinteger = 1 then ///tem erro mas não deve retirar da lista
                             VerificarProdutosNotaFiscalPorProdutosNFE(opAdicionar , ReatualizarProduto)
                           else
                             VerificarProdutosNotaFiscalPorProdutosNFE(opRemover);
                         end;


                       end;

        opRemover   :  begin
                         if qryProdutosNotasPagNFEItemsSituacao.Locate('numerosequencianfe;numerosequencianfeitens;situacao',
                            VarArrayOf([qryProdutosNotasPagNFEnumero.AsInteger,
                                        qryProdutosNotasPagNFEItemsnumero.AsInteger,
  //                                    uppercase(descricaoerro)]), [TipodeProcura]) then
                                        descricaoerro]), [TipodeProcura]) then
                         begin
                           qryProdutosNotasPagNFEItemsSituacao.Delete;

                           if erro then
                           begin
                             qryProdutosNotasPagNFEItems.Edit;
                             qryProdutosNotasPagNFEItemsRegistroSemErro.AsBoolean := ProdutosNotasPagNFEItemsSituacaoSemErro;
//                             qryProdutosNotasPagNFEItems.post;

                             qryProdutosNotasPagNFE.Edit;
                             qryProdutosNotasPagNFERegistroSemErro.AsBoolean := qryProdutosNotasPagNFEItemsRegistroSemErro.AsBoolean;
                             qryProdutosNotasPagNFE.post;

                             vTipoFiltroSituacao := numerosequencianfe;
                           end
                           else
                           begin
                             qryProdutosNotasPagNFEItems.Edit;
                             qryProdutosNotasPagNFEItemsalerta.AsBoolean := ProdutosNotasPagNFEItemsSituacaoComAlerta;
//                             qryProdutosNotasPagNFEItems.post;

                             qryProdutosNotasPagNFE.Edit;
                             qryProdutosNotasPagNFEalerta.AsBoolean := qryProdutosNotasPagNFEItemsalerta.AsBoolean;
                             qryProdutosNotasPagNFE.post;



                             vTipoFiltroSituacao := numerosequencianfeAlerta;
                           end;


                           qryProdutosNotasPagNFEItemsSituacao.MasterSource := nil;
                           qryProdutosNotasPagNFEItemsSituacao.Filter := 'numerosequencianfe = '+qryProdutosNotasPagNFEnumero.asstring;

                           qryProdutosNotasPagNFEItemsSituacao.filtered := true;


                           qryProdutosNotasPagNFE.Edit;
                           if erro then
                             qryProdutosNotasPagNFERegistroSemErro.AsBoolean := qryProdutosNotasPagNFEItemsSituacao.recordcount = 0
                           else
                             qryProdutosNotasPagNFEAlerta.AsBoolean := qryProdutosNotasPagNFEItemsSituacao.recordcount <> 0;

  //                         qryProdutosNotasPagNFE.post;

                           qryProdutosNotasPagNFEItemsSituacao.filter := '';
                           qryProdutosNotasPagNFEItemsSituacao.filtered := false;
                           qryProdutosNotasPagNFEItemsSituacao.MasterSource := dsrProdutosNotasPagNFEItems;


                           qryProdutosNotasPagNFEItemsSituacao.first;

                           qryProdutosNotasPagNFE.post
                         end
                         else
                         begin
                           if erro then
                           begin
                             if not qryProdutosNotasPagNFEItemsregistrosemerro.AsBoolean and
                                ProdutosNotasPagNFEItemsSituacaoSemErro then
                             begin
                               qryProdutosNotasPagNFEItems.Edit;
                               qryProdutosNotasPagNFEItemsRegistroSemErro.asBoolean := true;
//                               qryProdutosNotasPagNFEItems.post;
                                                         {ACRESCENTADO}
                               qryProdutosNotasPagNFE.Edit;
                               qryProdutosNotasPagNFERegistroSemErro.AsBoolean := True;
                               qryProdutosNotasPagNFE.POST;

                             end;
                           end
                           else
                           begin
                             if qryProdutosNotasPagNFEItemsalerta.AsBoolean and
                                not ProdutosNotasPagNFEItemsSituacaoComAlerta then
                             begin
                               qryProdutosNotasPagNFEItems.Edit;
                               qryProdutosNotasPagNFEItemsalerta.AsBoolean := false;
//                               qryProdutosNotasPagNFEItems.post;
                                                           {ACRESCENTADO}

                               qryProdutosNotasPagNFE.Edit;
                               qryProdutosNotasPagNFEAlerta.AsBoolean := False;
                               qryProdutosNotasPagNFE.POST;

                             end;
                           end;
                         end;
                         VerificarProdutosNotaFiscalPorProdutosNFE(opAdicionar , ReatualizarProduto);
                       end;
      end;
      if vLigarEventosProdutosNotasPagNFEItems then
        qryProdutosNotasPagNFEItems.AfterPost := qryProdutosNotasPagNFEItemsAfterPost;
    end;
  end;
end;



procedure TdtmCadastroNotasFiscais.SelecionarPedidoNFE;
begin
  ReFazConsultaporNome(qryProcuraPedidosNFE, ['pedido'], [qryConsultaPedidosProdutoNFEpedido.AsInteger]);
  qryProdutosNotasPagNFEItems.Edit;
  qryProdutosNotasPagNFEItemspedidook.asboolean := true;
  qryProdutosNotasPagNFEItemspedido.AsInteger := qryConsultaPedidosProdutoNFEpedido.AsInteger;
  qryProdutosNotasPagNFEItemsnumeroprodutonopedido.AsInteger := qryConsultaPedidosProdutoNFEnumero.AsInteger;
  qryProdutosNotasPagNFEItemsprecounitariopedido.asCurrency := qryConsultaPedidosProdutoNFEprecounitariopedido.asCurrency;

//  qryProdutosNotasPagNFEItems.post;
  dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemspedido);
end;

procedure TdtmCadastroNotasFiscais.abreConsultaNaturezaProduto;
begin
  qryConsultaNaturezas.MacroByName('CondicaoCodigoFiscalProduto').asstring :=
    'and coalesce(btrim((select m.operacao from tiposmovimentos m where naturezas.tipomovimento = m.codigo)),'''')<>''''';
  Abre(ctTabelaNaturezaOperacoes);

end;

procedure TdtmCadastroNotasFiscais.SelecionarNaturezaProdutoNFE(CodigoNatureza, codigofiscal: integer; AbrirConsulta: boolean);
begin
  if qryProdutosNotasPagNFEItems.State = dsBrowse then
    qryProdutosNotasPagNFEItems.Edit;

  if AbrirConsulta then
  begin
    qryProcuraNaturezasProdutoNFE.BeforeOpen := nil;
    qryProcuraNaturezasProdutoNFE.MacroByName('CodigoNaturezaPadrao').AsString := ' and (naturezas.codigo = ' + IntToStr(CodigoNatureza) + ') ';
    ReFazConsultapornome(qryProcuraNaturezasProdutoNFE,['codigofiscal'],[codigofiscal]);
    qryProcuraNaturezasProdutoNFE.BeforeOpen := qryProcuraNaturezasProdutoNFEBeforeOpen;
    AtribuirDadosCalculosImpostos(qryNotaFiscal, qryProcuraProdutoNotaFiscal, qryProcuraNaturezasProdutoNFE, qryProdutosNotasPagNFEItems, NotaEntrada, false);
    FCodigoFiscalProdutoNFEOriginal := qryProdutosNotasPagNFeItemscodigofiscal.AsInteger;
    dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemscodigofiscal);
  end
  else
  begin
    AtribuirDadosCalculosImpostos(qryNotaFiscal, {qryProdutosNotasPagNFE} qryProcuraProdutoNotaFiscal, qryProcuraNaturezasProdutoNFE, qryProdutosNotasPagNFEItems, NotaEntradaXML, false);
    FCodigoFiscalProdutoNFEOriginal := qryProdutosNotasPagNFeItemscodigofiscal.AsInteger;
  end;

//  qryProdutosNotasPagNFEItems.post;

//  dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemscodigofiscal);


end;

procedure TdtmCadastroNotasFiscais.fechaConsultaNaturezaProduto;
begin
  qryConsultaNaturezas.MacroByName('CondicaoCodigoFiscalProduto').asstring :='';
  Fecha(ctTabelaNaturezaOperacoes);
end;

function TdtmCadastroNotasFiscais.TodosProdutosNFEValidos(PosicionarnoRegistro: Boolean): boolean;
var
 vRegistroAtual : TbookMark;
begin
  result := true;
  qryProdutosNotasPagNFE.enablecontrols;
  qryProdutosNotasPagNFELotes.enablecontrols;
  qryProdutosNotasPagNFEitems.enablecontrols;

  if qryprodutosnotaspagnfe.active and
     (qryProdutosnotaspagnfe.recordcount <> 0) and
     (qrynotafiscalmodelodocto.asstring<>'57') then
  begin
    vRegistroAtual := qryprodutosNotasPagnfe.GetBookmark;
  //  qryProdutosNFE.DisableControls;
    {se tirar o edit/post o valor da chave produto/produtovisual é perdido}
  //  qryProdutosNFE.Edit;
  //  qryProdutosNFE.post;

    qryProdutosNotasPagNFE.First;
    while not qryProdutosNotasPagNFE.Eof do
    begin
      if not qryProdutosNotasPagNFERegistroSemErro.AsBoolean then
      begin
        result := false;
        break;
      end;

      qryProdutosNotasPagNFELotes.first;
      result := qryProdutosNotasPagNFELotes.CheckRequiredFields(true, false, true, self, true, false);
      if not result then
        break;

      if result then
      begin
        qryProdutosNotasPagNFEitems.First;
        while not qryProdutosNotasPagNFEitems.Eof do
        begin
          qryProdutosNotasPagNFEItemsnlote.required := qryProdutosNotasPagNFEItemsgerenciarloteevalidade.AsBoolean;
          result := qryProdutosNotasPagNFEitems.CheckRequiredFields(false, false, true, self, true, false);
          if not result then
            break;

          qryProdutosNotasPagNFEItems.next;
        end;
      end;

      qryProdutosNotasPagNFE.next;
    end;
  //  qryProdutosNotasPagNFE.EnableControls;
    if not PosicionarnoRegistro then
      qryProdutosNotasPagNFE.GotoBookmark(vRegistroAtual);

    qryProdutosNotasPagNFE.freeBookmark(vRegistroAtual);
  end;
end;

function TdtmCadastroNotasFiscais.VerificarProdutosFornecedores(VerificarTodos: Boolean; Excluir: Boolean): boolean;
var
  vRegistroAtual, vRegistroAtualAux : TbookMark;
  vProduto : String;
  procedure IncluirExcluirProdutosFornecedores_daNFE(Excluir: Boolean);
  begin
    qryProdutosFornecedores.MacroByName('CondicaoPorChavePrimaria').asString := 'and pf.produtonofornecedor = :produtonofornecedor '+
                                                                                 'and pf.descricaonofornecedor = :descricaonofornecedor '+
                                                                                 'and case when c.grade1 is null and c.grade2 is null then true '+
                                                                                 'else coalesce(pf.infadprod, :infadprod) = :infadprod end '+
                                                                                 'and pf.produto = :produto '+
                                                                                 'and pf.fornecedor = :fornecedor '+
                                                                                 'and pf.tipofornecedor = :tipofornecedor '+
                                                                                 'and ((pf.serienota is null or pf.serienota = :SerieNota) and (pf.numeronota is null or pf.NumeroNota = :NumeroNota))';

    qryProdutosFornecedores.MacroByName('CondicaoPorNumerodeNota').asString := '';
    qryProdutosFornecedores.MacroByName('CondicaoPorProdutonoFornecedor').asString := '';

    if Excluir then
    begin

      refazconsultapornome(qryProdutosFornecedores, ['produtonofornecedor','descricaonofornecedor','infadprod','produto','fornecedor','tipofornecedor','SerieNota','NumeroNota'],
                           [qryProdutosNotasPagNFEprodutonofornecedor.AsString,
                            qryProdutosNotasPagNFEdescricaofornecedor.AsString,
                            qryProdutosNotasPagNFEinfadprod.AsString,
                            qryProdutosNotaFiscalproduto.asstring,
                            qryNotaFiscalfornecedor.asstring,
                            qryNotaFiscalTipofornecedor.asstring,
                            qryNotaFiscalserie.asstring,
                            qryNotaFiscalnrdocumento.AsInteger]);


      if (not qryProdutosFornecedoresserienota.isnull) and (not qryProdutosFornecedoresnumeronota.isnull) then
      begin
        if qryProdutosFornecedoresNumerodeVinculacoesnaNota.asinteger = 1 then
           qryProdutosFornecedores.delete
        else
        begin
          qryProdutosFornecedores.Edit;
          qryProdutosFornecedoresNumerodeVinculacoesnaNota.asinteger := qryProdutosFornecedoresNumerodeVinculacoesnaNota.asinteger -1;
          qryProdutosFornecedores.post;
        end;
      end;
    end
    else
    begin
      refazconsultapornome(qryProdutosFornecedores, ['produtonofornecedor','descricaonofornecedor','infadprod','produto','fornecedor','tipofornecedor','SerieNota','NumeroNota'],
                             [qryProdutosNotasPagNFEprodutonofornecedor.AsString,
                              qryProdutosNotasPagNFEdescricaofornecedor.AsString,
                              qryProdutosNotasPagNFEinfadprod.AsString,
                              qryProdutosNotasPagNFEItemsproduto.asstring,
                              qryNotaFiscalfornecedor.asstring,
                              qryNotaFiscalTipofornecedor.asstring,
                              qryNotaFiscalserie.asstring,
                              qryNotaFiscalnrdocumento.AsInteger]);




      if (qryProdutosFornecedores.RecordCount = 0) then
      begin
        qryProdutosFornecedores.append;
        qryProdutosFornecedoresproduto.asstring := qryProdutosNotasPagNFEItemsproduto.asstring;
        qryProdutosFornecedoresprodutodigitado.asstring := qryProdutosNotasPagNFEItemsprodutodigitado.asstring;

        qryProdutosFornecedoresfornecedor.AsInteger := qryNotaFiscalfornecedor.AsInteger;
        qryProdutosFornecedoresprodutonofornecedor.AsString := qryProdutosNotasPagNFEprodutonofornecedor.AsString;
        qryProdutosFornecedoresdescricaonofornecedor.AsString := qryProdutosNotasPagNFEdescricaofornecedor.AsString;
        qryProdutosFornecedoresinfadprod.AsString := qryProdutosNotasPagNFEinfadprod.AsString;

        qryProdutosFornecedoresdata.AsDateTime := DataHoraLocal;

        qryProdutosFornecedoresserienota.asstring := qryNotaFiscalserie.AsString;
        qryProdutosFornecedoresnumeronota.asinteger := qryNotaFiscalnrdocumento.AsInteger;
        qryProdutosFornecedorestipofornecedor.asstring := qryNotaFiscaltipofornecedor.AsString;
        qryProdutosFornecedoresNumerodeVinculacoesnaNota.asinteger := 1;
        qryProdutosFornecedores.post;
      end
      else
      begin
        qryProdutosFornecedores.Edit;
        qryProdutosFornecedoresdata.AsDateTime := DataHoraLocal;
        qryProdutosFornecedoresprodutodigitado.asstring := qryProdutosNotasPagNFEItemsprodutodigitado.asstring;
        if (not qryProdutosFornecedoresserienota.isnull) and (not qryProdutosFornecedoresnumeronota.isnull) then
          qryProdutosFornecedoresNumerodeVinculacoesnaNota.asinteger := qryProdutosFornecedoresNumerodeVinculacoesnaNota.asinteger + 1;
        qryProdutosFornecedores.post;
      end;
    end;
    Perpetrar([qryProdutosFornecedores]);
  end;
begin
  result := true;

  if VerificarTodos then
  begin
    qryProdutosFornecedores.MacroByName('CondicaoPorChavePrimaria').asString := '';

    if UtilizandoGrade then
      qryProdutosFornecedores.MacroByName('CondicaoPorNumerodeNota').asString :=    'and pf.fornecedor = :fornecedor '+
                                                                                    'and pf.tipofornecedor = :tipofornecedor '+
                                                                                    'and ((pf.serienota is null or pf.serienota = :SerieNota) and (pf.numeronota is null or pf.NumeroNota = :NumeroNota))'+
                                                                                    'and (pf.produtonofornecedor, pf.descricaonofornecedor, pf.infadprod, pf.produto) in (' + ListaProdutosnoFornecedor + ')'
    else
      qryProdutosFornecedores.MacroByName('CondicaoPorNumerodeNota').asString :=    'and pf.fornecedor = :fornecedor '+
                                                                                    'and pf.tipofornecedor = :tipofornecedor '+
                                                                                    'and ((pf.serienota is null or pf.serienota = :SerieNota) and (pf.numeronota is null or pf.NumeroNota = :NumeroNota))'+
                                                                                    'and (pf.produtonofornecedor, pf.descricaonofornecedor, pf.produto) in (' + ListaProdutosnoFornecedor + ')';


    qryProdutosFornecedores.MacroByName('CondicaoPorProdutonoFornecedor').asString := '';

    refazconsultapornome(qryProdutosFornecedores, ['fornecedor','tipofornecedor','SerieNota','NumeroNota'],
                     [qryNotaFiscalfornecedor.AsInteger,
                      qryNotaFiscalTipofornecedor.asstring,
                      qryNotaFiscalserie.AsString,
                      qryNotaFiscalnrdocumento.AsInteger]);


    try
      vRegistroAtual := qryProdutosNotaFiscal.GetBookmark;
      DesabilitarControles(true);
      qryProdutosFornecedores.First;
      while not qryProdutosFornecedores.Eof do
      begin
        if Excluir then
        begin
          if ((not qryProdutosFornecedoresserienota.isnull) and
              (not qryProdutosFornecedoresnumeronota.isnull)) or
             not qryProdutosFornecedoresexisteoutrasvinculacoes.asboolean then
            qryProdutosFornecedores.delete
          else
            qryProdutosFornecedores.Next;
        end
        else
        begin

          if qryProdutosNotaFiscal.active and not qryProdutosNotaFiscal.locate('produto',qryProdutosFornecedoresproduto.AsString,[]) then
          begin
            if ((not qryProdutosFornecedoresserienota.isnull) and
                (not qryProdutosFornecedoresnumeronota.isnull)) or
                not qryProdutosFornecedoresexisteoutrasvinculacoes.asboolean then
              qryProdutosFornecedores.delete
            else
              qryProdutosFornecedores.Next;
          end
          else
          begin
            qryProdutosFornecedores.edit;
            qryProdutosFornecedoresdata.AsDateTime := DataHoraLocal;
            qryProdutosFornecedoresserienota.clear;
            qryProdutosFornecedoresnumeronota.clear;
            qryProdutosFornecedoresflag.asBoolean := true;
            qryProdutosFornecedores.post;

            if qryProdutosFornecedoresnumerodeocorrencias.asinteger > 1 then
            begin
              vRegistroAtualAux := qryProdutosFornecedores.GetBookmark;
              vProduto := qryProdutosFornecedoresproduto.asString;
              while true do
              begin
                if qryProdutosFornecedores.Locate('produto;flag', VarArrayOf([vProduto, False]),[]) then
                  qryProdutosFornecedores.delete
                else
                  break;
              end;

              qryProdutosFornecedores.GotoBookmark(vRegistroAtualAux);
              qryProdutosFornecedores.FreeBookmark(vRegistroAtualAux);

            end;
            qryProdutosFornecedores.Next;
          end;

        end;
      end;
    finally
      qryProdutosNotaFiscal.GotoBookmark(vRegistroAtual);
      qryProdutosNotaFiscal.freeBookmark(vRegistroAtual);
      DesabilitarControles(false);
    end;
  end
  else
    IncluirExcluirProdutosFornecedores_daNFE(Excluir);

end;

function TdtmCadastroNotasFiscais.ExisteNaturezasProdutosSemGerarPagamento: boolean;
var
  vRegistroAtual: TbookMark;
begin
  result := false;
  if qryProdutosNotaFiscal.Active then
  begin
    try
      vRegistroAtual := qryProdutosNotaFiscal.GetBookmark;
      DesabilitarControles(true);

      qryProdutosNotaFiscal.First;
      while not qryprodutosnotafiscal.Eof do
      begin
        if not qryProdutosNotaFiscalgerarpagamento.AsBoolean then
        begin
          result := true;
          break;
        end;
        qryProdutosNotaFiscal.next;
      end;
    finally
      qryProdutosNotaFiscal.GotoBookmark(vRegistroAtual);
      qryProdutosNotaFiscal.FreeBookmark(vRegistroAtual);
      DesabilitarControles(false);
    end;
  end;
end;

function TdtmCadastroNotasFiscais.getIncluidoViaXml: boolean;
begin
  if qryProdutosNotasPagNFE.active then
  begin
  
    fIncluidoViaXml := qryProdutosNotasPagNFE.recordcount <> 0;
    Result := fIncluidoViaXml;
  end;
end;

procedure TdtmCadastroNotasFiscais.ApagarProdutosNotasPagNFE;
begin
  if qryprodutosnotaspagnfe.active then
  begin
    qryProdutosNotasPagNFE.first;
    while not qryProdutosNotasPagNFE.eof do
    begin
      qryProdutosNotasPagNFEItems.First;
      while not qryProdutosNotasPagNFEItems.eof do
      begin
        qryProdutosNotasPagNFEItemsSituacao.first;
        while not qryProdutosNotasPagNFEItemsSituacao.eof do
          qryProdutosNotasPagNFEItemsSituacao.delete;
        qryProdutosNotasPagNFEItems.delete;
      end;
      qryProdutosNotasPagNFE.delete;
    end;
  end;
end;

{
procedure TdtmCadastroNotasFiscais.AbrirTabelaSituacaoProduto;
begin
  qryProdutosNotasPagNFEItemsSituacao.Close;
  qryProdutosNotasPagNFEItemsSituacao.Open;
//qryProdutosNotasPagNFEItemsSituacao.Delete;
end;
}

function TdtmCadastroNotasFiscais.GetProdutosNotasPagNFEItems_proximocodigo: integer;
begin
    ReFazConsulta(spcProdutosNotasPagNFEItems_proximocodigo,[],[]);
  result := spcProdutosNotasPagNFEItems_proximocodigocodigo.AsInteger;
end;

function TdtmCadastroNotasFiscais.GetProdutosNotasPagNFEItemsSituacao_proximocodigo: integer;
begin
  ReFazConsulta(spcProdutosNotasPagNFEItemssituacao_proximocodigo,[],[]);
  result := spcProdutosNotasPagNFEItemssituacao_proximocodigocodigo.AsInteger;

end;

procedure TdtmCadastroNotasFiscais.VerificarValoresProdutosNotasPagNFEItems;
var
  vProdutosNotasPagNFEItemsquantidade: double;
  vProdutosNotasPagNFEItemsqtEstoque: double;

  vRegistrosemErro, vSomenteFatorUm : boolean;
  vRegistroAtual : TBookMark;

  vproduto, vprodutodigitado, vprodutovisual : String;
  vRegistroemAlteracao : integer;

begin
  {Guardar o registro em alteração, somente nele se fara a reatualização dos valores}

  vRegistroemAlteracao := qryProdutosNotasPagNFEItems.recno;

  vProdutosNotasPagNFEItemsquantidade := 0;
  vProdutosNotasPagNFEItemsqtEstoque := 0;

  if qryProdutosNotasPagNFE.active then
  begin

    vRegistroAtual := qryProdutosNotasPagNFEItems.GetBookmark;
    GuardarPosicaoProdutosNotasPagNFE;

    if not qryProdutosNotasPagNFEItemsproduto.isnull then
    begin
      vproduto := qryProdutosNotasPagNFEItemsproduto.asString;
      vprodutodigitado := qryProdutosNotasPagNFEItemsprodutodigitado.asString;
      vprodutovisual := qryProdutosNotasPagNFEItemsprodutovisual.asString;

      qryProdutosNotasPagNFEItems.GuardarRegistroAtual(false, false);
      qryProdutosNotasPagNFEItems.first;
      while not qryProdutosNotasPagNFEItems.eof do
      begin
        if qryProdutosNotasPagNFEItemsproduto.isnull then
        begin
          qryProdutosNotasPagNFEItems.edit;
          qryProdutosNotasPagNFEItemsprodutovisual.asString := vprodutovisual;
          qryProdutosNotasPagNFEItemsproduto.asString := vproduto;
          qryProdutosNotasPagNFEItemsprodutodigitado.asString := vprodutodigitado;
          qryProdutosNotasPagNFEItems.post;
          dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemsprodutodigitado);
        end;
        qryProdutosNotasPagNFEItems.next;
      end;

      qryProdutosNotasPagNFEItems.VoltarRegistro;
    end;

    vSomenteFatorUm := True;
    vRegistrosemErro := false;

    qryProdutosNotasPagNFEItems.first;

    AtribuirDados(qryProdutosNotasPagNFELotes,
                 [qryProdutosNotasPagNFELotesqtatribuida,
                  qryProdutosNotasPagNFELotesqtatribuidaestoque],
                  [0, 0], false);

    while not qryProdutosNotasPagNFEItems.eof do
    begin
      if not qryProdutosNotasPagNFEItemsproduto.IsNull then
      begin
        vProdutosNotasPagNFEItemsquantidade := vProdutosNotasPagNFEItemsquantidade + qryProdutosNotasPagNFEItemsquantidade.AsFloat;
        vProdutosNotasPagNFEItemsqtEstoque := vProdutosNotasPagNFEItemsqtEstoque + qryProdutosNotasPagNFEItemsqtdeestoque.AsFloat;

        if (qryProdutosNotasPagNFEItemsfatorconversao.AsCurrency <> 1) and vSomenteFatorUm then
          vSomenteFatorUm := False;

        if qryProdutosNotasPagNFELotes.locate('nlote', qryProdutosNotasPagNFEItemsnlote.asString, []) then
        begin
          qryProdutosNotasPagNFELotes.edit;

          qryProdutosNotasPagNFELotesqtatribuida.asCurrency := qryProdutosNotasPagNFELotesqtatribuida.asCurrency +
                                                               qryProdutosNotasPagNFEItemsquantidade.AsFloat;

          qryProdutosNotasPagNFELotesqtatribuidaestoque.asCurrency := qryProdutosNotasPagNFELotesqtatribuidaestoque.asCurrency +
                                                               qryProdutosNotasPagNFEItemsqtdeestoque.AsFloat;


          qryProdutosNotasPagNFELotes.post;
        end;
      end;
      qryProdutosNotasPagNFEItems.next;
    end;

    VoltarPosicaoProdutosNotasPagNFE;


    qryProdutosNotasPagNFEItems.BeforeEdit := nil;

    qryProdutosNotasPagNFEItems.first;
    while not qryProdutosNotasPagNFEItems.eof do
    begin

      if qryProdutosNotasPagNFELotes.locate('nlote', qryProdutosNotasPagNFEItemsnlote.asString, []) then
      begin

        if (qryProdutosNotasPagNFELotesqtatribuida.asCurrency        = qryProdutosNotasPagNFELotesqlote.asCurrency) or
           (qryProdutosNotasPagNFELotesqtatribuidaestoque.asCurrency = qryProdutosNotasPagNFELotesqlote.asCurrency) then
          ListaErroProdutosNFE(format('A Quantidade atribuida do lote ''%s'' esta discrepante',[qryProdutosNotasPagNFELotesnlote.asString]), '', opRemover, loCaseInsensitive, false)
        else
          ListaErroProdutosNFE(format('A Quantidade atribuida do lote ''%s'' esta discrepante',[qryProdutosNotasPagNFELotesnlote.asString]), '', opAdicionar, loCaseInsensitive, true);

      end;

      GuardarPosicaoProdutosNotasPagNFE;

      if (vProdutosNotasPagNFEItemsquantidade = qryProdutosNotasPagNFEqtdeestoque.AsFloat) or
         (vProdutosNotasPagNFEItemsqtEstoque = qryProdutosNotasPagNFEquantidade.AsFloat) then
      begin
        ListaErroProdutosNFE('A Quantidade do produto esta discrepante em relação à NFe', '', opRemover, loCaseInsensitive, false);
        ListaErroProdutosNFE('A Quantidade do produto (com fator 1) esta discrepante em relação à NFe', '', opRemover, loCaseInsensitive, true);
      end
      else
      begin
        if vSomenteFatorUm then
        begin
          ListaErroProdutosNFE('A Quantidade do produto esta discrepante em relação à NFe', '', opRemover, loCaseInsensitive, false);
          ListaErroProdutosNFE('A Quantidade do produto (com fator 1) esta discrepante em relação à NFe', '', opAdicionar, loCaseInsensitive, true,
          (vRegistroemAlteracao = qryProdutosNotasPagNFEItems.recno), false);
        end
        else
        begin
          ListaErroProdutosNFE('A Quantidade do produto (com fator 1) esta discrepante em relação à NFe', '', opRemover, loCaseInsensitive, true);
          ListaErroProdutosNFE('A Quantidade do produto esta discrepante em relação à NFe', '', opAdicionar, loCaseInsensitive, true,
          (vRegistroemAlteracao = qryProdutosNotasPagNFEItems.recno), false);
        end;
      end;

      VoltarPosicaoProdutosNotasPagNFE;

      if (qryProdutosNotasPagNFEsaldoquantidade.AsFloat < 0) and (qryProdutosNotasPagNFELotes.recordcount <> 0) then
        ListaErroProdutosNFE('As quantidades do lote não estão fechando com a nota', '', opAdicionar )
      else
        ListaErroProdutosNFE('As quantidades do lote não estão fechando com a nota', '', opRemover );

      VoltarPosicaoProdutosNotasPagNFE;

      if (qryProdutosNotasPagNFEItemsSituacao.state in [dsedit, dsinsert]) then
        qryProdutosNotasPagNFEItemsSituacao.post;

      qryProdutosNotasPagNFEItems.next;
    end;

    qryProdutosNotasPagNFEItems.BeforeEdit := qryProdutosNotasPagNFEItemsBeforeEdit;

    qryprodutosnotaspagnfeitems.GotoBookmark(vRegistroAtual);
    qryprodutosnotaspagnfeitems.FreeBookmark(vRegistroAtual);

    vRegistrosemErro := (qryProdutosNotasPagNFEItems.RecordCount <> 0);

    if vRegistrosemErro then
      vRegistrosemErro := vProdutosNotasPagNFEItemsquantidade = qryProdutosNotasPagNFEqtdeestoque.AsFloat;

    GuardarPosicaoProdutosNotasPagNFE;
    if vRegistrosemErro then
    begin
      qryProdutosNotasPagNFEItems.first;
      while not qryProdutosNotasPagNFEItems.eof do
      begin
        if vRegistrosemErro then
        begin
          vRegistrosemErro := qryProdutosNotasPagNFEItemsregistrosemerro.AsBoolean;
          if not vRegistrosemErro then
            break;
        end;
        qryProdutosNotasPagNFEItems.next;
      end;
    end;

    qryProdutosNotasPagNFE.edit;
    qryProdutosNotasPagNFEregistrosemerro.AsBoolean := vRegistrosemErro;
    qryProdutosNotasPagNFEsaldoquantidade.AsFloat := qryProdutosNotasPagNFEquantidade.AsFloat - vProdutosNotasPagNFEItemsquantidade;

    VoltarPosicaoProdutosNotasPagNFE;
  end;
end;

procedure TdtmCadastroNotasFiscais.DesligarEventosProdutosNotasPagNFEItems;
begin
  vLigarEventosProdutosNotasPagNFEItems := false;

  dsrProdutosNotasPagNFEItems.onDataChange := nil;
  qryProdutosNotasPagNFEItems.AfterPost    := nil;
  qryProdutosNotasPagNFEItems.AfterDelete  := nil;
  qryProdutosNotasPagNFEItems.AfterInsert  := nil;
  qryProdutosNotasPagNFE.AfterScroll       := nil;

  qryProdutosNotasPagNFEItems.AfterCancel  := nil;
  qryProdutosNotasPagNFEItems.AfterEdit    := nil;
  qryProdutosNotasPagNFEItems.AfterInsert  := nil;
  qryProdutosNotasPagNFEItems.AfterScroll  := nil;
  qryProdutosNotasPagNFEItems.BeforeDelete := nil;
  qryProdutosNotasPagNFEItems.BeforeEdit   := nil;

//  qryProdutosNotasPagNFEItems.disablecontrols;

end;

procedure TdtmCadastroNotasFiscais.LigarEventosProdutosNotasPagNFEItems;
begin
  vLigarEventosProdutosNotasPagNFEItems := true;
  dsrProdutosNotasPagNFEItems.onDataChange := dsrProdutosNotasPagNFEItemsDataChange;
  qryProdutosNotasPagNFEItems.AfterPost := qryProdutosNotasPagNFEItemsAfterPost;
  qryProdutosNotasPagNFEItems.AfterDelete := qryProdutosNotasPagNFEItemsAfterDelete;
  qryProdutosNotasPagNFEItems.AfterInsert :=   qryProdutosNotasPagNFEItemsAfterInsert;
  qryProdutosNotasPagNFE.AfterScroll := qryProdutosNotasPagNFEAfterScroll;

  qryProdutosNotasPagNFEItems.AfterCancel  := qryProdutosNotasPagNFEItemsAfterCancel;
  qryProdutosNotasPagNFEItems.AfterEdit    := qryProdutosNotasPagNFEItemsAfterEdit;
  qryProdutosNotasPagNFEItems.AfterInsert  := qryProdutosNotasPagNFEItemsAfterInsert;
  qryProdutosNotasPagNFEItems.AfterScroll  := qryProdutosNotasPagNFEItemsAfterScroll;
  qryProdutosNotasPagNFEItems.BeforeDelete := qryProdutosNotasPagNFEItemsBeforeDelete;
  qryProdutosNotasPagNFEItems.BeforeEdit   := qryProdutosNotasPagNFEItemsBeforeEdit;

//  qryProdutosNotasPagNFEItems.enablecontrols;


end;


function TdtmCadastroNotasFiscais.PosicionarProdutosNotaFiscalPorProdutosNFE: boolean;
begin
  if qryProdutosNotaFiscal.active and
     ((qryProdutosNotasPagNFEItemsnumerosequencianfe.AsInteger = qryProdutosNotaFiscalnumerosequencianfe.AsInteger) and
      (qryProdutosNotasPagNFEItemsnumero.AsInteger = qryProdutosNotaFiscalnumerosequencianfeitens.AsInteger)) then
    result := true
  else
    result := qryProdutosNotaFiscal.active and qryProdutosNotaFiscal.Locate('numerosequencianfe;numerosequencianfeitens', VarArrayOf([qryProdutosNotasPagNFEItemsnumerosequencianfe.AsInteger, qryProdutosNotasPagNFEItemsnumero.AsInteger]),[]);
end;


function TdtmCadastroNotasFiscais.getQuantidadeNaturezasProdutoNFE: Boolean;
const
  sql = 'and (case when ''F'' = ''%s'' then %s' +
        '          when ''E'' = ''%s'' then %s' +
        '          else %s' +
        '     end) = codigofiscal - 1000';
var
  local: String;
begin
  local := '';
  CodigoFiscalAuxiliar := 0;

  Result := (qryProcuraNaturezasProdutoNFE.RecordCount > 1) and
            (qryProdutosNotasPagNFEItems.State in [dsInsert, dsEdit]) and
            (qryProcuraNaturezasProdutoNFEcodigofiscal.AsInteger <> 1353) and
            (qryProcuraNaturezasProdutoNFEcodigofiscal.AsInteger <> 2353) and
            (qryProdutosNotasPagNFEItemscodigofiscal.AsInteger <> FCodigoFiscalProdutoNFEOriginal);
  if Result then
  begin
    qryConsultaNaturezas.MacroByName('CodigoFiscal').AsString :=
      'and (mod(codigofiscal,1000) = mod(' + IntToStr(qryProcuraNaturezasProdutoNFEcodigofiscal.AsInteger) + ',1000))';
  end
  else
    qryConsultaNaturezas.MacroByName('CodigoFiscal').AsString := '';
end;

procedure TdtmCadastroNotasFiscais.PosicionarProdutosNotasPagNFEComerro;
var
 vEncontrou: boolean;
{ vRegistroAtual : TBookMark;
 vRegistroAtualItems : TBookMark;}

begin

  vEncontrou := false;

    if qryprodutosnotaspagnfe.active then
    begin

    {
      vRegistroAtual := qryProdutosNotasPagNFE.GetBookmark;
      vRegistroAtualItems := qryProdutosNotasPagNFEItems.GetBookmark;
      }

      qryProdutosNotasPagNFE.GuardarRegistroAtual(true);
      qryProdutosNotasPagNFEItems.GuardarRegistroAtual(true);

      qryProdutosNotasPagNFE.first;
      while not qryProdutosNotasPagNFE.eof do
      begin
        if not qryProdutosNotasPagNFEregistrosemerro.AsBoolean then
        begin
          vEncontrou := true;
          qryProdutosNotasPagNFE.GuardarRegistroAtual(false, true);
          qryProdutosNotasPagNFEItems.guardarRegistroAtual(false, true);

          if qryProdutosNotasPagNFEItems.locate('numerosequencianfe',
              qryProdutosNotasPagNFEnumero.asInteger,[]) then
          begin
            qryProdutosNotasPagNFEItems.first;
            while not qryProdutosNotasPagNFEItems.eof do
            begin
              if not qryProdutosNotasPagNFEItemsregistrosemerro.AsBoolean then
              begin
                vEncontrou := true;
                break;
              end;
              qryProdutosNotasPagNFEItems.next;
            end;
          end;

        end;

        if not vEncontrou then
          qryProdutosNotasPagNFE.next
        else
          break;
      end;

      if not vEncontrou then
      begin
        {
        qryProdutosNotasPagNFE.GotoBookmark(vRegistroAtual);
        qryProdutosNotasPagNFEItems.GotoBookmark(vRegistroAtualItems);
        }

        qryProdutosNotasPagNFE.VoltarRegistro;
        qryProdutosNotasPagNFEItems.VoltarRegistro;


      end;

//      qryProdutosNotasPagNFE.FreeBookmark(vRegistroAtual);
//      qryProdutosNotasPagNFEItems.FreeBookmark(vRegistroAtualItems);
    end;
end;

function TdtmCadastroNotasFiscais.GetSaldoQuantidade: Double;
begin
{
  if ((field.AsFloat > qryProdutosNotasPagNFEsaldoquantidade.AsFloat) and  (qryProdutosNotasPagNFEsaldoquantidade.AsFloat <> 0)) then
  begin
    MensagemErro(format('A quantidade ultrapassou o saldo de %s',[qryProdutosNotasPagNFEsaldoquantidade.AsString]));
    field.AsFloat := qryProdutosNotasPagNFEsaldoquantidade.AsFloat;
  end
  else
  if ((field.AsFloat > qryProdutosNotasPagNFEquantidade.AsFloat) and  (qryProdutosNotasPagNFEsaldoquantidade.AsFloat = 0)) then
  begin
    MensagemErro(format('A quantidade ultrapassou o saldo de %s',[qryProdutosNotasPagNFEquantidade.AsString]));
    field.AsFloat := qryProdutosNotasPagNFEquantidade.AsFloat;
  end;
 }

  if qryProdutosNotasPagNFEsaldoquantidade.AsFloat = 0 then
   fSaldoquantidade := vProdutosNotasPagNFEItemsquantidadeAntesEditar
  else
   fSaldoquantidade := vProdutosNotasPagNFEItemsquantidadeAntesEditar + qryProdutosNotasPagNFEsaldoquantidade.AsFloat;


  Result := fSaldoQuantidade;
end;

(*
procedure TdtmCadastroNotasFiscais.SelecionarCodigoNaturezaNFE(
  descricao: String);
begin
  if qryNaturezasPadrao.Locate('descricao',descricao,[]) then
  begin
    qryProdutosNotasPagNFEItemsnatureza.asinteger     := qryNaturezasPadraonatureza.AsInteger;
    qryProdutosNotasPagNFEItemscodigofiscal.AsInteger := qryNaturezasPadraocodigofiscal.AsInteger;
{
    qryProdutosNotasPagNFEItemsgerarpagamento.AsBoolean := qryNaturezasPadraogerarpagamento.AsBoolean;
    qryProdutosNotasPagNFEItemsnaogerarcreditoicms.AsBoolean := qryNaturezasPadraonaogerarcreditoicms.AsBoolean;
    qryProdutosNotasPagNFEItemsnaogerarcreditoipi.AsBoolean := qryNaturezasPadraonaogerarcreditoipi.AsBoolean;
    qryProdutosNotasPagNFEItemsicmssobreipi.AsBoolean := qryNaturezasPadraoicmssobreipi.AsBoolean;
    qryProdutosNotasPagNFEItemsnaocalcularipisobrefrete.AsBoolean := qryNaturezasPadraonaocalcularipisobrefrete.AsBoolean;
}

{    qryProdutosNotasPagipicst.asstring        := qryNaturezasPadraoipicst.AsString;
    qryProdutosNotasPagcofinscst.AsString     := qryNaturezasPadraocofinscst.AsString;
    qryProdutosNotasPagpiscst.AsString        := qryNaturezasPadraopiscst.AsString;}

    if HeUnidadeFederacao(qryNotaFiscalestado.AsString) then
    begin
      if qryNotaFiscalestado.AsString = EstadoFilialBase then
         qryProdutosNotasPagNFEItemscodigofiscal.AsInteger := 1000 + qryProdutosNotasPagNFEItemscodigofiscal.AsInteger mod 1000
      else
         qryProdutosNotasPagNFEItemscodigofiscal.AsInteger := 2000 + qryProdutosNotasPagNFEItemscodigofiscal.AsInteger mod 1000;
    end
    else
      qryProdutosNotasPagNFEItemscodigofiscal.AsInteger := 3000 + qryProdutosNotasPagNFEItemscodigofiscal.AsInteger mod 1000;
  end
  else
    MensagemAviso(ctNATUREZAPADRAONAOVINCULADA);
end;
*)

function TdtmCadastroNotasFiscais.GetListaProdutosnoFornecedor: String;
begin

  try
    qryProdutosNotasPagNFEItems.AfterScroll := nil;
    DesabilitarControles(true);
    fListaProdutosnoFornecedor := '';

    if qryProdutosNotaFiscal.Active  then
    begin

      qryProdutosNotaFiscal.first;
      while not qryProdutosNotaFiscal.eof do
      begin

        if qryProdutosNotasPagNFE.active and qryProdutosNotasPagNFE.Locate('numero',qryProdutosNotaFiscalnumerosequencianfe.AsInteger,[]) then
        begin
          if utilizandograde then
            fListaProdutosnoFornecedor := fListaProdutosnoFornecedor + '('+quotedstr(qryProdutosNotasPagNFEprodutonofornecedor.AsString) + ',' +
                                                                           quotedstr(qryProdutosNotasPagNFEdescricaofornecedor.AsString) + ',' +
                                                                           quotedstr(qryProdutosNotasPagNFEinfadprod.AsString) + ',' +
                                                                           qryProdutosNotaFiscalproduto.AsString+'), '
          else

            fListaProdutosnoFornecedor := fListaProdutosnoFornecedor + '('+quotedstr(qryProdutosNotasPagNFEprodutonofornecedor.AsString) + ',' +
                                                                           quotedstr(qryProdutosNotasPagNFEdescricaofornecedor.AsString) + ',' +
                                                                           qryProdutosNotaFiscalproduto.AsString+'), ';
        end;

        qryProdutosNotaFiscal.Next;
      end;

      if fListaProdutosnoFornecedor <> '' then
        delete(fListaProdutosnoFornecedor,length(fListaProdutosnoFornecedor)-1,2)
      else
      begin
        if utilizandograde then
          fListaProdutosnoFornecedor := '(''0'','''','''',0)'
        else
          fListaProdutosnoFornecedor := '(''0'','''',0)';
      end;

    end;
    Result := fListaProdutosnoFornecedor;
  finally
    qryProdutosNotasPagNFEItems.AfterScroll := qryProdutosNotasPagNFEItemsAfterScroll;
    DesabilitarControles(false);
  end;

end;

function TdtmCadastroNotasFiscais.ProdutosNotasPagNFEItemsSituacaoSemErro: boolean;
begin
  vTipoFiltroSituacao := SituacaoComErro;
  qryProdutosNotasPagNFEItemsSituacao.Filtered := true;
  qryProdutosNotasPagNFEItemsSituacao.first;
  result := (qryProdutosNotasPagNFEItemsSituacao.RecordCount = 0);
  qryProdutosNotasPagNFEItemsSituacao.Filtered := false;
end;

function TdtmCadastroNotasFiscais.ProdutosNotasPagNFEItemsSituacaoComAlerta: boolean;
begin
  vTipoFiltroSituacao := SituacaoComAlerta;
  qryProdutosNotasPagNFEItemsSituacao.Filtered := true;
  qryProdutosNotasPagNFEItemsSituacao.first;
//  result := (qryProdutosNotasPagNFEItemsSituacao.RecordCount = 0);
  result := (qryProdutosNotasPagNFEItemsSituacao.RecordCount <> 0);
  qryProdutosNotasPagNFEItemsSituacao.Filtered := false;
end;


{
  if qryProdutosNotasPagNFEItemsSituacao.filtered then
  begin
    case vTipoFiltroSituacao of
      SituacaoComErro : Accept := qryProdutosNotasPagNFEItemsSituacaoerro.asboolean;
      SituacaoComAlerta : Accept := not qryProdutosNotasPagNFEItemsSituacaoerro.asboolean;
      numerosequencianfe : Accept := (qryProdutosNotasPagNFEItemsSituacaonumerosequencianfe.asstring = qryProdutosNotasPagNFEnumero.asstring) and qryProdutosNotasPagNFEItemsSituacaoerro.asboolean;
      numerosequencianfeAlerta : Accept := (qryProdutosNotasPagNFEItemsSituacaonumerosequencianfe.asstring = qryProdutosNotasPagNFEnumero.asstring) and not qryProdutosNotasPagNFEItemsSituacaoerro.asboolean;
    end;
  end;
}  




procedure TdtmCadastroNotasFiscais.SetArquivoXMLNFe(const Value: string);
begin
  fArquivoXMLNFe := Value;

  if value <> '' then
  begin
    if ExistsNode(Value, 'NFe') then
      LerArquivoXMLNFe
    else
    if ExistsNode(Value, 'CTe') then
      LerArquivoXMLCTe;
  end;
         {
  qrynfe.close;
  qrynfe.ParamByName('codigo').AsInteger := qryNotaFiscalcodigo.AsInteger;
  qrynfe.Open;
  qrynfe.edit;
  qrynfexmlnfe.LoadFromFile(ArquivoXMLNFe);
  qrynfe.Post;
  }

  VisualizandoProdutosdaNFE := false;  
end;


{
function TtecList.GetItems(Pedido: Integer; Produto: Int64): TtecQuantidadePorProdutoPedido;
var
  a, ped: Integer;
  prod: Int64;
begin
  Result := nil;
  for a := 0 to Count - 1 do begin
    ped := TtecQuantidadePorProdutoPedido(inherited Items[a]).Pedido;
    prod := TtecQuantidadePorProdutoPedido(inherited Items[a]).Produto;
    if (ped = Pedido) and (prod = Produto) then begin
      Result := inherited Items[a];
      break
    end
  end
end;
}


{
constructor TtecQuantidadePorProdutoPedido.Create(Ped: Integer; Prod: int64; Qtdade: Currency);
begin
  FPedido     := Ped;
  FProduto    := Prod;
  FQuantidade := Qtdade
end;
}


function TdtmCadastroNotasFiscais.GetColunadaGrade: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryProdutosNotaFiscalcoluna.AsString)
end;

function TdtmCadastroNotasFiscais.GetLinhadaGrade: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryProdutosNotaFiscallinha.AsString)
end;

procedure TdtmCadastroNotasFiscais.qryProcuraProdutoNotaFiscalCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryProcuraProdutoNotaFiscaldescricaolc.AsString :=
    qryProcuraProdutoNotaFiscaldescricao.AsString+' '+
    qryProcuraProdutoNotaFiscalvalorgrade1.AsString+' '+
    qryProcuraProdutoNotaFiscalvalorgrade2.AsString;
end;

procedure TdtmCadastroNotasFiscais.qryConsultaProdutosNotaFiscalAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaProdutosNotaFiscalvalorgrade1.Visible := ParSistema.UsarGradesProdutos;
  qryConsultaProdutosNotaFiscalvalorgrade2.Visible := ParSistema.UsarGradesProdutos;
end;

function TdtmCadastroNotasFiscais.GetEntradaporPedido: boolean;
begin
  result := qryProcuraNaturezasentrada.AsString = 'P';
end;

function TdtmCadastroNotasFiscais.IncluirProdutosDaNota: Boolean;
var
  ProdutosNotaFiscaldadofiscal_ : integer;
  ProdutosNotaFiscalfilialnotafiscalsaida_: integer;
  ProdutosNotaFiscalserienotafiscalsaida_: String;
  ProdutosNotaFiscalnumeronotafiscalsaida_: integer;

begin
   FViaNota:= True;
   qryProdutosNotaFiscal.AfterScroll := nil;
   qryProdutosNotaFiscal.DisableControls;
//   qryProdutosNotaFiscalproduto.OnChange := nil;
   dsrProdutosnotafiscal.OnDataChange := nil;

   ProdutosNotaFiscaldadofiscal_ :=  qryProcuraNotaFiscalProdutosdadofiscal.AsInteger;
   ProdutosNotaFiscalfilialnotafiscalsaida_ := qryProcuraNotaFiscalProdutosfilial.AsInteger;
   ProdutosNotaFiscalserienotafiscalsaida_ := qryProcuraNotaFiscalProdutosserie.AsString;
   ProdutosNotaFiscalnumeronotafiscalsaida_ := qryProcuraNotaFiscalProdutosnumero.AsInteger;

   AbreTabelaConsultaProdutosNotaFiscal(False, False,true);

   try
      fGerandoProdutos := true;
      if qryProdutosNotaFiscal.State in [dsedit, dsinsert] then
        qryProdutosNotaFiscal.cancel;

      qryConsultaProdutosNotaFiscal.First;
      while not qryConsultaProdutosNotaFiscal.Eof do
      begin
         if qryProdutosNotaFiscal.active and not qryProdutosNotaFiscal.Locate('dadofiscal;numeroprodutotabela;produto',
            VarArrayOf([qryConsultaProdutosNotaFiscalnumerodocumentotabela.asinteger,
                        qryConsultaProdutosNotaFiscalnumeroprodutotabela.asinteger,
                        qryConsultaProdutosNotaFiscalcodigo.AsString]), []) then
         begin
            qryprodutosnotafiscal.AfterInsert := nil;
            qryProdutosNotaFiscal.Append;
            qryProdutosNotaFiscalprodutook.AsBoolean := true;

            qryProdutosNotaFiscalfilialnotafiscalsaida.AsInteger := ProdutosNotaFiscalfilialnotafiscalsaida_;
            qryProdutosNotaFiscalserienotafiscalsaida.AsString := ProdutosNotaFiscalserienotafiscalsaida_;
            qryProdutosNotaFiscalnumeronotafiscalsaida.AsInteger := ProdutosNotaFiscalnumeronotafiscalsaida_;

            qryProdutosNotaFiscaldadofiscal.AsInteger := ProdutosNotaFiscaldadofiscal_;
            qryProdutosNotaFiscalnumeroprodutotabela.asinteger := qryConsultaProdutosNotaFiscalnumeroprodutotabela.asinteger;

            SelecionarProdutoNotaFiscal;
            qryProdutosNotaFiscaltipomovimento.AsString:=GetTipoMovimentoNatureza;
            qryProdutosNotaFiscaloperacao.AsString:=qryProcuraNaturezasoperacao.AsString;
            PostProdutosNotaFiscal;
            qryprodutosnotafiscal.AfterInsert := qryProdutosNotaFiscalAfterInsert;
         end;

         qryConsultaProdutosNotaFiscal.Next
      end;
   finally
      if parsistema.PermitirGravacaoNFEParcial then
        if gravarnotaparcial then
           qrynotafiscal.Edit;

      AtualizaSQLProdutosExistenteNotas;
      CalcularImpostos;
//      CalcularValorTotalProdutos;
//      qryProdutosNotaFiscalproduto.OnChange := qryProdutosNotaFiscalprodutoChange;
      qryProdutosNotaFiscal.AfterScroll     := qryProdutosNotaFiscalAfterScroll;
      dsrProdutosnotafiscal.OnDataChange    := dsrProdutosNotaFiscalDataChange;
      qryProdutosNotaFiscal.EnableControls;
      FechaTabelaConsultaProdutosNotaFiscal;
      FViaNota:= False;

      fGerandoProdutos := false;

   end;
   Result := True;
end;

procedure TdtmCadastroNotasFiscais.SelecionarFilial;
begin
  ReFazConsulta(qryProcuraFiliais, [0], [qryConsultaFiliaiscodigo.AsVariant]);
  qryProdutosNotaFiscalfilialnotafiscalsaida.AsInteger := qryProcuraFiliaiscodigo.AsInteger;
end;

procedure TdtmCadastroNotasFiscais.qryProcuraFiliaisAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if qryProcuraFiliaiscodigo.AsString='' then
  begin
   qryconsultaNotaFiscalProdutos.Params[0].value := null;
   qryProcuraNotaFiscalProdutos.Params[0].value := null;
   qryconsultaseriesfiliais.Params[0].value := null;
   qryProcuraSerieFiliais.Params[0].value := null;
  end   
  else
  begin
   qryconsultaNotaFiscalProdutos.Params[0].AsString := qryProcuraFiliaiscodigo.AsString;
   qryProcuraNotaFiscalProdutos.Params[0].AsString := qryProcuraFiliaiscodigo.AsString;
   qryconsultaseriesfiliais.Params[0].AsString := qryProcuraFiliaiscodigo.AsString;
   qryProcuraSerieFiliais.Params[0].AsString := qryProcuraFiliaiscodigo.AsString;
  end;
end;

procedure TdtmCadastroNotasFiscais.qryProcuraSerieFiliaisAfterScroll(
  DataSet: TDataSet);
begin
  inherited;


  if qryProcuraSerieFiliaisserie.AsString='' then
  begin
    qryConsultaNotaFiscalProdutos.Params[1].value := null;
    qryProcuraNotaFiscalProdutos.Params[1].value := null;
  end
  else
  begin
    qryConsultaNotaFiscalProdutos.Params[1].AsString := qryProcuraSerieFiliaisserie.AsString;
    qryProcuraNotaFiscalProdutos.Params[1].AsString := qryProcuraSerieFiliaisserie.AsString;
  end;

  if (qryProcuraSerieFiliaisfilial.AsString<>
      qryProcuraFiliaiscodigo.AsString) then
   RefazConsulta(qryProcuraFiliais, [0], [qryProcuraSerieFiliaisfilial.AsVariant]);

end;

procedure TdtmCadastroNotasFiscais.qryProcuraNotaFiscalProdutosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if (qryProcuraFiliaiscodigo.AsString<>
      qryProcuraNotaFiscalProdutosfilial.AsString) then
   RefazConsulta(qryProcuraFiliais, [0], [qryProcuraNotaFiscalProdutosfilial.AsVariant]);

  if (qryProcuraSerieFiliaisserie.AsString<>
      qryProcuraNotaFiscalProdutosserie.AsString) then
   ReFazConsulta(qryProcuraSerieFiliais, [0,1], [qryProcuraNotaFiscalProdutosfilial.AsVariant,
                                                 qryProcuraNotaFiscalProdutosserie.AsVariant]);

end;

function TdtmCadastroNotasFiscais.GetTabelaConsultaSerieFilial: TZDataSet;
begin
 result := qryConsultaSeriesFiliais;
end;

function TdtmCadastroNotasFiscais.GetTabelaConsultaFilial: TZDataSet;
begin
 result := qryConsultaFiliais;
end;

procedure TdtmCadastroNotasFiscais.SelecionarSerie;
begin
  ReFazConsulta(qryProcuraSerieFiliais, [0,1],
    [qryConsultaSeriesFiliaisfilial.AsVariant,
     qryConsultaSeriesFiliaisserie.AsVariant]);
  qryProdutosNotaFiscalserienotafiscalsaida.AsString := qryProcuraSerieFiliaisserie.AsString;
end;

procedure TdtmCadastroNotasFiscais.SelecionarNotaFiscalProduto;
begin
  ReFazConsulta(qryProcuraNotaFiscalProdutos, [0,1,2],
        [qryConsultaNotaFiscalProdutosfilial.AsVariant,
         qryConsultaNotaFiscalProdutosserie.AsVariant,
         qryConsultaNotaFiscalProdutosnumero.AsVariant]);
  qryProdutosNotaFiscalfilialnotafiscalsaida.AsInteger := qryProcuraNotaFiscalProdutosfilial.AsInteger;
  qryProdutosNotaFiscalserienotafiscalsaida.AsString := qryProcuraNotaFiscalProdutosserie.AsString;
  qryProdutosNotaFiscalnumeronotafiscalsaida.AsInteger := qryProcuraNotaFiscalProdutosnumero.AsInteger;
  qryProdutosNotaFiscaldadofiscal.AsInteger := qryProcuraNotaFiscalProdutosdadofiscal.AsInteger;

end;

function TdtmCadastroNotasFiscais.GetTabelaConsultaNotasProdutos: TZDataSet;
begin
 result := qryConsultaNotaFiscalProdutos;
end;

procedure TdtmCadastroNotasFiscais.SetDataFinalNotaProduto(
  const Value: String);
begin
  FDataFinalNotaProduto := Value;
  if FDataFinalNotaProduto<>'' then
  begin
   if FDataInicialNotaProduto='' then
     FDataInicialNotaProduto := FDataFinalNotaProduto;
  end   
  else
  begin
   if FDataInicialNotaProduto<>'' then
     FDataFinalNotaProduto := FDataInicialNotaProduto
   else
   begin
     FDataInicialNotaProduto := datetostr(DataLocal);
     FDatafinalNotaProduto := datetostr(DataLocal);
   end;
  end;
   qryConsultaNotaFiscalProdutos.ParamByName('datainicial').AsString := FDataInicialNotaProduto;
   qryConsultaNotaFiscalProdutos.ParamByName('datafinal').AsString := FDataFinalNotaProduto;
end;

procedure TdtmCadastroNotasFiscais.qryConsultaSeriesFiliaisAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaSeriesFiliaisfilial.Visible := qryProcuraFiliaiscodigo.AsString=''
end;

procedure TdtmCadastroNotasFiscais.qryConsultaNotaFiscalProdutosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaNotaFiscalProdutosfilial.Visible := qryProcuraFiliaiscodigo.AsString='';
  qryConsultaNotaFiscalProdutosserie.Visible := qryProcuraSerieFiliaisserie.AsString='';
end;

procedure TdtmCadastroNotasFiscais.FechaTabelas_PesquisarNota;
begin
  qryprocurafiliais.Params[0].Clear;
  qryProcuraSerieFiliais.Params[0].Clear;
  qryProcuraSerieFiliais.Params[1].Clear;
  qryProcuraNotaFiscalProdutos.Params[0].Clear;
  qryProcuraNotaFiscalProdutos.Params[1].Clear;
  qryProcuraNotaFiscalProdutos.Params[2].Clear;
  qryProcuraFiliais.Close;
  qryProcuraSerieFiliais.Close;
  qryProcuraNotaFiscalProdutos.Close;
end;

function TdtmCadastroNotasFiscais.ExisteFilial(NomeCampo: String;
  Value: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaFiliais, NomeCampo, Value)
end;

function TdtmCadastroNotasFiscais.ExisteSerie(NomeCampo: String;
  Value: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaSeriesFiliais, NomeCampo, Value)
end;

function TdtmCadastroNotasFiscais.ExisteNotaFiscalProduto(
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaNotaFiscalProdutos, NomeCampo, Value)
end;

procedure TdtmCadastroNotasFiscais.AbreTabelas_PesquisarNota;
begin
  qryProcuraFiliais.open;
  qryProcuraSerieFiliais.open;
  qryProcuraNotaFiscalProdutos.open;

  if NotaReferenciada then
  begin
    if qryNotaFiscaldadofiscalreferenciado.asinteger <> 0 then
    begin
      ReFazConsultapornome(qryProcuraNotaFiscalProdutos, ['filial','serie','numero'],
          [qryNotaFiscalfilialnotasaidareferenciada.AsInteger,
           qryNotaFiscalserienotasaidareferenciada.AsString,
           qryNotaFiscalnumeronotasaidareferenciada.AsInteger]);

      qryProdutosNotaFiscaldadofiscal.asinteger :=  qryNotaFiscaldadofiscalreferenciado.asinteger;
      qryProdutosNotaFiscalfilialnotafiscalsaida.asinteger := qryNotaFiscalfilialnotasaidareferenciada.asinteger;
      qryProdutosNotaFiscalserienotafiscalsaida.asstring := qryNotaFiscalserienotasaidareferenciada.asString;
      qryProdutosNotaFiscalnumeronotafiscalsaida.asinteger := qryNotaFiscalnumeronotasaidareferenciada.asinteger;

      {
      if incluindonota then
      begin
        if qryProdutosNotaFiscal.recordcount=0 then
          MensagemAviso('O ítens da nota referenciada serão incluidos automaticamente.' );
        IncluirProdutosDaNota;
      end;
      }
    end;
  end
  else
    ReFazConsultapornome(qryProcuraNotaFiscalProdutos, ['filial','serie','numero'],
        [qryProdutosNotaFiscalfilialnotafiscalsaida.AsInteger,
         qryProdutosNotaFiscalserienotafiscalsaida.AsString,
         qryProdutosNotaFiscalnumeronotafiscalsaida.AsInteger]);
end;

procedure TdtmCadastroNotasFiscais.GerarTabelaGrade;
const
 SQLColunaGrade = 'cast(null as numeric(9,3)) as %s';
 SQLElementoGrade = 'and eg.valor not in (%s)';

Var
// SQLGrade: TStringList;
 VLinha,VColuna: String;
 I,J,Index : Integer;
 Preco, icms, ipi, reducaobase: Real;
 quantidade : Double;
 PrecoDiferente, ICMSdiferente, IPIdiferente, ReducaoBasediferente, achou : Boolean;
 RegistroAtual: TBookMark;
 vRecnoNfe, vRecnoNfeIems: Integer;

begin

 try
   vRecnoNfe     := qryProdutosNotasPagNFE.recno;
   vRecnoNfeIems := qryProdutosNotasPagNFEItems.recno;

   if GravarNotaParcial(true) then
    qryNotaFiscal.edit;
 finally

   qryProdutosNotasPagNFE.recno := vRecnoNFe;
   qryProdutosNotasPagNFEItems.recno := vRecnoNfeIems;

 end;

 qryListaCamposdaGrade.close;
 qryGrade.close;

 case tpModoGrade of
   SomenteItemAtual : qryGrade.sql.text := qryGradeProdutosNFe.sql.text;
   Todos            : qryGrade.sql.text := qryGradeGeral.sql.text;
 end;

  if qryCaracteristicasNotaFiscal.IsEmpty then
    qryCaracteristicasNotaFiscalcodigovisual.readonly := false;

 if qryCaracteristicasNotaFiscalcaracteristica.asString <> '' then
 begin

   Colunas :=  TStringList.Create;
   colunas.Sorted := true;

   PodeInserirnaGrade := True;

   qryElementosGrades.close;
   qryElementosGrades.ParamByName('grade').asinteger := qryCaracteristicasNotaFiscalgrade2.asInteger;
   qryElementosGrades.ParamByName('codigonota').asinteger := qrynotafiscalcodigo.asInteger;
   qryElementosGrades.ParamByName('caracteristica').asString := qryCaracteristicasNotaFiscalcaracteristica.AsString;
   qryElementosGrades.open;


   if (qryCaracteristicasNotaFiscalgrade1.AsInteger=0) then
     tipoGrade := tpCOLUNA;

   if (qryCaracteristicasNotaFiscalgrade2.AsInteger=0) then
     tipoGrade := tpLINHA;

   qryElementosGrades.First;
   colunas.Clear;
   while not qryElementosGrades.Eof do
   begin
     colunas.Add(qryElementosGradesvalor.AsString);
     qryelementosgrades.Next;
   end;

   qryListaCamposdaGrade.parambyname('codigonota').asInteger := qryNotaFiscalcodigo.asinteger;
   qryListaCamposdaGrade.parambyname('caracteristica').asString := qryCaracteristicasNotaFiscalcaracteristica.asstring;

   qryGrade.parambyname('caracteristica').asString := qryCaracteristicasNotaFiscalcaracteristica.asstring;
   qryGrade.parambyname('codigonota').asInteger := qryNotaFiscalcodigo.asInteger;

   case tipoGrade of
     tpLINHA:  begin
                 qryListaCamposdaGrade.parambyname('coluna').asInteger := qryCaracteristicasNotaFiscalgrade2.AsInteger;

                 qryGrade.parambyname('linha').asInteger := qryCaracteristicasNotaFiscalgrade1.AsInteger;
                 qryGrade.parambyname('coluna').asInteger := qryCaracteristicasNotaFiscalgrade2.AsInteger;
                 qryGrade.parambyname('EhLinha').asBoolean := true;


               end;

     tpCOLUNA: begin
                 qryListaCamposdaGrade.parambyname('coluna').asInteger := qryCaracteristicasNotaFiscalgrade1.AsInteger;

                 qryGrade.parambyname('linha').asInteger := qryCaracteristicasNotaFiscalgrade2.AsInteger;
                 qryGrade.parambyname('coluna').asInteger := qryCaracteristicasNotaFiscalgrade1.AsInteger;
                 qryGrade.parambyname('EhLinha').asBoolean := false;

               end;
   end;
   qryListaCamposdaGrade.open;
   qryGrade.macrobyname('ListaCampos').asString := qryListaCamposdaGradelistacamposdagradenotaentrada.asString;


   case tpModoGrade of
     SomenteItemAtual : qryGrade.Parambyname('nfeitem').asInteger := qryProdutosNotasPagNFEnumero.asInteger;
   end;

   qryGrade.open;

   qryGrade.FieldByName('valorlinha').DisplayLabel := 'Linha/Coluna';
   qryGrade.FieldByName('valorlinha').readonly := true;

   for i:=1 to qryGrade.FieldCount - 1 do
    qryGrade.Fields[i].readonly := true;

   for i:=1 to qryGrade.FieldCount - 10 do
   begin
     if (pos('_', qrygrade.fields[i].FieldName)=1) and
        (copy(qrygrade.fields[i].FieldName,length(qrygrade.fields[i].FieldName),1)='_') then
     begin
       qrygrade.fields[i].DisplayLabel := ' '+Colunas.Strings[I-1]+' ';

       TCurrencyField(qrygrade.fields[i]).EditFormat   := Parsistema.MascaraQuantidadeGrade;
       TCurrencyField(qrygrade.fields[i]).DisplayFormat := ParSistema.MascaraQuantidadeGrade;
       qrygrade.fields[i].DisplayWidth := length(qrygrade.fields[i].FieldName);

       case tpModoGrade of
         SomenteItemAtual : qrygrade.fields[i].readonly := false;
//         Todos            : qrygrade.fields[i].readonly := True;
       end;

     end;
   end;

   qryGrade.FieldByName('quantidade').DisplayLabel := 'QtD. TOTAL';
   TCurrencyField(qryGrade.FieldByName('quantidade')).DisplayFormat := ParSistema.MascaraQuantidadeGrade;
   qryGrade.FieldByName('quantidade').readonly := true;

   qryGrade.FieldByName('precounitario').DisplayLabel := 'PREÇO UNIT.';
   qryGrade.FieldByName('precounitario').readonly := true;
   qryGrade.FieldByName('precodiferente').visible := TRUE;

   qryGrade.FieldByName('aliquotaicms').DisplayLabel := 'ICMS (%)';
   qryGrade.FieldByName('aliquotaicms').readonly := true;
   qryGrade.FieldByName('icmsdiferente').visible := TRUE;

   qryGrade.FieldByName('aliquotaipi').DisplayLabel := 'IPI (%)';
   qryGrade.FieldByName('aliquotaipi').readonly := true;
   qryGrade.FieldByName('ipidiferente').visible := TRUE;

   qryGrade.FieldByName('valorreducaobase').DisplayLabel := 'REDUÇÃO';
   qryGrade.FieldByName('valorreducaobase').readonly := true;
   qryGrade.FieldByName('reducaobasediferente').visible := TRUE;


   qryGrade.FieldByName('total').DisplayLabel := 'PREÇO TOTAL';
   qryGrade.FieldByName('total').readonly := true;

   PosicionarLinhanaGrade;

   if assigned(PosicionarLinhaColunaNaGrade) then
     PosicionarLinhaColunaNaGrade(nil);

   PodeInserirnaGrade := False;

 end;

end;

{
procedure TdtmCadastroNotasFiscais.qryProdutos_AfterOpen(DataSet: TDataSet);
var
 RegistroAtual : TBookMark;
begin
  inherited;
  if UtilizandoGrade then
  begin
    LinhasColunas[Codigo].Clear;
    LInhasColunas[ValorLinhaColuna].Clear;
    LinhasColunas[ValorLinha].Clear;
    LinhasColunas[ValorColuna].Clear;
    LinhasColunas[Caracteristica].Clear;
    qryprodutos.First;
    While not qryprodutos.Eof do
    begin
      LinhasColunas[codigo].Add(qryProdutoscodigo.AsString);
      LinhasColunas[ValorLinhaColuna].Add(qryProdutosvalorgrade1.AsString+qryProdutosvalorgrade2.AsString);
      LinhasColunas[ValorLinha].Add(qryProdutosvalorgrade1.AsString);
      LinhasColunas[ValorColuna].Add(qryProdutosvalorgrade2.AsString);
      LinhasColunas[Caracteristica].Add(qryProdutoscaracteristica.AsString);
      qryprodutos.Next;
    end;

    if qryGrade.Active then
     qryGrade.Close;
  end;
end;
}


function TdtmCadastroNotasFiscais.UtilizandoGrade: Boolean;
begin
 result := ParSistema.UsarGradesProdutos;
end;

{
procedure TdtmCadastroNotasFiscais.CopiarProdutosNotasFiscais;
var
 RegistroAtual: TBookMark;
 caracteristica : String;
begin
  if qryProdutosNotaFiscal.Active then
  begin

    RegistroAtual := qryProdutosNotaFiscal.GetBookmark;
    qryProdutosNotaFiscal.DisableControls;
    ReFazConsulta qryProdutosNotaFiscal,[0],[Null]);
    qryProdutosNotaFiscal.RequestLive := true;
    caracteristica := qryCaracteristicasNotaFiscalcodigo.AsString;


    qryProdutosNotaFiscal.First;
    try
      qryProdutosNotaFiscal.OnNewRecord := nil;
      qryProdutosNotaFiscal.BeforeInsert := nil;

      while not qryProdutosNotaFiscal.Eof do
      begin
       if ((qryProdutosNotaFiscalcaracteristica.AsString = caracteristica) and
           (qryProdutosNotaFiscalcodigorecolha.AsString='')) then
       begin
         qryProdutosNotaFiscal.Append;
         GravarCamposCopiaProdutos(qryProdutosNotaFiscal, qryProdutosNotaFiscal);
         qryProdutosNotaFiscal.edit;
         qryProdutosNotaFiscalconfirmada.AsBoolean := true;
//         qryProdutosNotaFiscal.DisableControls;
         PostProdutosNotaFiscal;
//         qryProdutosNotaFiscal.EnableControls;

       end;
       qryProdutosNotaFiscal.Next;
      end;
    finally
      qryProdutosNotaFiscal.GotoBookmark(RegistroAtual);
      qryProdutosNotaFiscal.FreeBookmark(RegistroAtual);
      qryProdutosNotaFiscal.enableControls;
      qryProdutosNotaFiscal.Locate('produto',qryProdutosNotaFiscalproduto.AsString,[]);
      qryProdutosNotaFiscal.RequestLive := qryProdutosNotaFiscal.RequestLive;
      qryProdutosNotaFiscal.BeforeInsert := qryProdutosNotaFiscalBeforeInsert;
      qryProdutosNotaFiscal.OnNewRecord := qryProdutosNotaFiscalNewRecord;

    end;
  end;
end;
}

procedure TdtmCadastroNotasFiscais.CalcularTotalGrade;
var vipi, vpreco : Currency;
    vreducaobaseant, vipiant, vicmsant, vprecoant, vquantidade : Real;
    vprecodiferente, vipidiferente, vicmsdiferente, vreducaobasediferente, achou, ok : boolean;
    RegistroAtual: TBookMark;

    procedure AtribuirTotalGrade;
      var
        dsrGradeOnDataChange : Boolean;
    begin
       if assigned(dsrGrade.OnDataChange) then
       begin
         dsrGrade.OnDataChange := nil;
         dsrGradeOnDataChange := true;
       end;

       if not (qrygrade.State in [dsedit, dsinsert]) then
         qrygrade.Edit;

       qrygrade.FieldByName('total').     AsCurrency := vpreco + vipi;
       qrygrade.FieldByName('quantidade').AsFloat := vquantidade;

       qrygrade.FieldByName('precodiferente').AsBoolean := vprecodiferente;
       if not vprecodiferente then
         qrygrade.FieldByName('precounitario').AsFloat := vprecoant;

       qrygrade.FieldByName('ipidiferente').AsBoolean := vipidiferente;
       if not vipidiferente then
         qrygrade.FieldByName('aliquotaipi').ascurrency := vipiant;

       qrygrade.FieldByName('icmsdiferente').AsBoolean := vicmsdiferente;
       if not vicmsdiferente then
         qrygrade.FieldByName('aliquotaicms').AsCurrency := vicmsant;

       qrygrade.FieldByName('reducaobasediferente').AsBoolean := vreducaobasediferente;
       if not vreducaobasediferente then
         qrygrade.FieldByName('valorreducaobase').AsCurrency := vreducaobaseant;

       qrygrade.FieldByName('precounitario').   ReadOnly:= vprecodiferente;;
       qrygrade.FieldByName('aliquotaicms').    ReadOnly:= vicmsdiferente;
       qrygrade.FieldByName('aliquotaipi').     ReadOnly:= vipidiferente;
       qrygrade.FieldByName('valorreducaobase').ReadOnly:= vreducaobasediferente;

       vquantidade:= 0;
       vipi       := 0;
       vpreco     := 0;

       vprecodiferente      := false;
       vipidiferente        := false;
       vicmsdiferente       := false;
       vreducaobasediferente:= false;
       achou                := false;

       vprecoant       := 0;
       vreducaobaseant := 0;
       vipiant         := 0;
       vicmsant        := 0;

       CalcularValorTotalProdutosGrade;

       if qrygrade.state = dsedit then
         qrygrade.Post;

       if dsrGradeOnDataChange then
         dsrGrade.OnDataChange := dsrGradeDataChange;
    end;


begin
   vquantidade := 0;
   vipi        := 0;
   vpreco      := 0;

   vprecodiferente := false;
   vipidiferente := false;
   vicmsdiferente := false;
   vreducaobasediferente := false;
   achou := false;

   vprecoant       := 0;
   vreducaobaseant := 0;
   vipiant         := 0;
   vicmsant        := 0;

   ok := false;

   FExistePrecoemBranco := false;
   try

     RegistroAtual := qryProdutosNotaFiscal.GetBookmark;
     qryProdutosNotaFiscal.DisableControls;
     DesabilitarControles(true);

     qryProdutosNotaFiscal.First;
     while not qryProdutosNotaFiscal.Eof do
     begin

        case tipograde of
           tpLINHA:  ok := (qryProdutosNotaFiscalvalorgrade1.AsString = qrygrade.Fieldbyname('valorlinha').AsString) and
                           (qryProdutosNotaFiscalquantidade.AsFloat <> 0) and
                           (qryProdutosNotaFiscalcaracteristica.AsString = qryCaracteristicasNotaFiscalcaracteristica.AsString);

           tpCOLUNA: ok := (qryProdutosNotaFiscalvalorgrade2.AsString = qrygrade.Fieldbyname('valorlinha').AsString) and
                           (qryProdutosNotaFiscalquantidade.AsFloat <> 0) and
                           (qryProdutosNotaFiscalcaracteristica.AsString = qryCaracteristicasNotaFiscalcaracteristica.AsString);
        end;

        if ok and (tpModoGrade = SomenteItemAtual) then
          ok := qryProdutosNotaFiscalnumerosequencianfe.asinteger = qryProdutosNotasPagNFEItemsnumerosequencianfe.asinteger;


        if ok then
        begin
           if not vprecodiferente then
             vprecodiferente:=  (qryProdutosNotaFiscalprecounitario.AsFloat <> vprecoant) and ((vprecoant <> 0) or achou);

           if not vipidiferente then
             vipidiferente :=  (qryProdutosNotaFiscalaliquotaipi.AsCurrency <> vipiant) and  ((vipiant <> 0) or achou);

           if not vicmsdiferente  then
             vicmsdiferente :=  (qryProdutosNotaFiscalaliquotaicms.AsCurrency <> vicmsant) and ((vicmsant <> 0) or achou);

           if not vreducaobasediferente  then
             vreducaobasediferente :=  (qryProdutosNotaFiscalvalorreducaobase.AsCurrency <> vreducaobaseant)  and ((vreducaobaseant<>0) or achou);

             vipi:= vipi +  qryProdutosNotaFiscalvaloripi.AsCurrency;
  {         else
           begin
             vipi:= vipi +   qryProdutosNotaFiscalprecounitario.AsFloat *
                             qryProdutosNotaFiscalquantidade.   AsCurrency) -
                    Truncar(qryProdutosNotaFiscalprecounitario.AsFloat *
                            qryProdutosNotaFiscalquantidade.   AsCurrency *
                            (100 - qryProdutosNotaFiscalaliquotaipi.AsCurrency) / 100, 2);
           end;
  }
           vpreco:= vpreco + Truncar(qryProdutosNotaFiscalprecounitario.AsFloat *
                                     qryProdutosNotaFiscalquantidade.   AsCurrency, 2);

           vquantidade:= vquantidade + qryProdutosNotaFiscalquantidade.AsFloat;

           if qryProdutosNotaFiscalprecounitario.AsFloat <> 0  then
             vprecoant:= qryProdutosNotaFiscalprecounitario.AsFloat;

           if qryProdutosNotaFiscalaliquotaipi.AsCurrency <> 0 then
             vipiant:= qryProdutosNotaFiscalaliquotaipi.AsCurrency;

           if qryProdutosNotaFiscalaliquotaicms.AsCurrency <> 0  then
             vicmsant:= qryProdutosNotaFiscalaliquotaicms.AsCurrency;

           if qryProdutosNotaFiscalvalorreducaobase.AsCurrency <> 0 then
             vreducaobaseant := qryProdutosNotaFiscalvalorreducaobase.AsCurrency;

           achou := true;

           if colunas.count = 0 then
             AtribuirTotalGrade;
        end;

        if not FExistePrecoemBranco
        then if  (qryProdutosNotaFiscalquantidade.   AsCurrency <> 0) and
                 (qryProdutosNotaFiscalprecounitario.AsFloat =  0) then
          FExistePrecoemBranco := true;

        qryProdutosNotaFiscal.Next;

     end;

     if colunas.count<>0
     then AtribuirTotalGrade;
   finally
     qryProdutosNotaFiscal.GotoBookmark(RegistroAtual);
     qryProdutosNotaFiscal.FreeBookmark(RegistroAtual);
     qryProdutosNotaFiscal.EnableControls;
     DesabilitarControles(false);
   end;

end;



procedure TdtmCadastroNotasFiscais.PosicionarLinhanaGrade;
begin
 qrygrade.First;
 while not qrygrade.Eof do
 begin
  case tipoGrade of
   tpLINHA : begin
//               if qrygrade.FieldByName('valorlinha').AsString = qryProdutosNotaFiscalvalorgrade1.AsString then
               if qrygrade.FieldByName('valorlinha').AsString = qryProdutosNotasPagNFEItemsvalorgrade1.AsString then
                 break;
             end;

   tpCOLUNA : begin
//               if qrygrade.FieldByName('valorlinha').AsString = qryProdutosNotaFiscalvalorgrade2.AsString then
               if qrygrade.FieldByName('valorlinha').AsString = qryProdutosNotasPagNFEItemsvalorgrade2.AsString then
                  break;
              end;
  end;
  qrygrade.Next;
 end;

 case tipoGrade of
//   tpLINHA : if qrygrade.FieldByName('valorlinha').AsString <> qryProdutosNotaFiscalvalorgrade1.AsString then
   tpLINHA : if qrygrade.FieldByName('valorlinha').AsString <> qryProdutosNotasPagNFEItemsvalorgrade1.AsString then
               qrygrade.First;
//   tpCOLUNA : if qrygrade.FieldByName('valorlinha').AsString <> qryProdutosNotaFiscalvalorgrade2.AsString then
   tpCOLUNA : if qrygrade.FieldByName('valorlinha').AsString <> qryProdutosNotasPagNFEItemsvalorgrade2.AsString then
                qrygrade.First;
  end;

end;

procedure TdtmCadastroNotasFiscais.dsrGradeDataChange(Sender: TObject;
  Field: TField);
var
 quantidade: Currency;
 I : integer;


  procedure GravarCopiaProdutosContratos(campo:String);
  var
   ok: Boolean;
  begin
    ok := false;
    try
      DesabilitarControles(true);
      qryProdutosNotaFiscal.First;
      while not qryProdutosNotaFiscal.Eof do
      begin
        case tipograde of
         tpLINHA :  ok := qryProdutosNotaFiscalvalorgrade1.AsString = qrygrade.FieldByName('valorlinha').AsString;
         tpCOLUNA : ok := qryProdutosNotaFiscalvalorgrade2.AsString = qrygrade.FieldByName('valorlinha').AsString;
        end;
        if ok then
        begin
          qryProdutosNotaFiscal.Edit;
          qryProdutosNotaFiscal.FieldByName(campo).AsString := qrygrade.FieldByName(campo).AsString;
          if campo='valorreducaobase' then
             qryProdutosNotaFiscal.FieldByName('percentualreducaobase').ascurrency :=
               PercentualDoValorSobreTotal(
                 qryProdutosNotaFiscal.FieldByName('quantidade').AsFloat *
                 qryProdutosNotaFiscal.FieldByName('precounitario').AsFloat,
                 qryProdutosNotaFiscal.FieldByName('valorreducaobase').ascurrency);

          if (campo='aliquotaipi') or
             (campo='precounitario') then
             qryProdutosNotaFiscal.FieldByName('valoripi').ascurrency :=
               ValorDoPercentualSobreTotal(
                 qryProdutosNotaFiscal.FieldByName('quantidade').AsFloat *
                 qryProdutosNotaFiscal.FieldByName('precounitario').AsFloat,
                 qryProdutosNotaFiscal.FieldByName('aliquotaipi').ascurrency);

  //        qryProdutosNotaFiscal.DisableControls;
          PostProdutosNotaFiscal;
  //        qryProdutosNotaFiscal.EnableControls;
        end;
        qryProdutosNotaFiscal.Next;
      end;
    finally
      DesabilitarControles(false);
    end;

  end;

begin
  inherited;
(*
  dsrGrade.OnDataChange := nil;
  quantidade := 0;
  if (field <> nil) and not (qrygrade.Eof) then
  begin
    if (field <> qrygrade.FieldByName('valorlinha')) and
       (field <> qrygrade.FieldByName('precodiferente')) and
       (field <> qrygrade.FieldByName('icmsdiferente')) and
       (field <> qrygrade.FieldByName('ipidiferente')) and
       (field <> qrygrade.FieldByName('reducaobasediferente')) and
       (field <> qrygrade.FieldByName('precounitario')) and
       (field <> qrygrade.FieldByName('valorreducaobase')) and
       (field <> qrygrade.FieldByName('aliquotaicms')) and
       (field <> qrygrade.FieldByName('aliquotaipi')) and
       (field <> qrygrade.FieldByName('total')) then
    begin
    { GravarQuantidade;}

     for I:=1 to qrygrade.FieldCount - 10 do
       if (pos('_', qrygrade.fields[i].FieldName)=1) and
          (copy(qrygrade.fields[i].FieldName,length(qrygrade.fields[i].FieldName),1)='_') then
         quantidade := quantidade + qrygrade.Fields[I].AsCurrency;

     qrygrade.FieldByName('quantidade').AsFloat := quantidade;
//     AtualizaPrecoVenda;
     CalcularTotalGrade;
//     PosicionarLinhaColunaNaGrade(field);
     
    end
    else
    if (field = qrygrade.FieldByName('precounitario')) then
    begin
     GravarCopiaProdutosContratos('precounitario');
  //   for I:=2 to qrygrade.FieldCount-11 do
  //     quantidade := quantidade + qrygrade.Fields[I].AsInteger;
//     AtualizaPrecoVenda;
     CalcularTotalGrade;
    end
    else
    if (field = qrygrade.FieldByName('valorreducaobase')) then
    begin
      GravarCopiaProdutosContratos('valorreducaobase');
//      AtualizaPrecoVenda;
      CalcularTotalGrade;
    end
    else
    if (field = qrygrade.FieldByName('aliquotaicms')) then
    begin
      GravarCopiaProdutosContratos('aliquotaicms');
//      AtualizaPrecoVenda;
      CalcularTotalGrade;
     end
    else
    if (field = qrygrade.FieldByName('aliquotaipi')) then
    begin
      GravarCopiaProdutosContratos('aliquotaipi');
//      AtualizaPrecoVenda;
      CalcularTotalGrade;
    end;
  end;
  dsrGrade.OnDataChange  := dsrGradeDataChange;
*)
end;

function TdtmCadastroNotasFiscais.GetGradeIcmsDiferente: Boolean;
begin
  result := qryGrade.FieldByName('icmsdiferente').AsBoolean;
end;

function TdtmCadastroNotasFiscais.GetGradeIPIDiferente: Boolean;
begin
  result := qryGrade.FieldByName('ipidiferente').AsBoolean;
end;

function TdtmCadastroNotasFiscais.GetGradePrecoDiferene: Boolean;
begin
 result := qryGrade.FieldByName('precodiferente').AsBoolean;
end;

function TdtmCadastroNotasFiscais.GetGradeReducaoBaseDiferente: Boolean;
begin
 result := qryGrade.FieldByName('reducaobasediferente').AsBoolean;
end;

{
function TdtmCadastroNotasFiscais.PosicionarLinhaColunanoProduto(
  Coluna: String): boolean;
begin
  result := false;
  if qryProdutos.Active then
  begin
    if (Coluna <> '') and (qrygrade.FieldByName('valorlinha').AsString <> '') then
    begin
      case tipoGrade of
       tpLINHA : result := qryProdutos.Locate('valorgrade1;valorgrade2', VarArrayOf([qrygrade.FieldByName('valorlinha').AsString,Coluna]),[]);
       tpCOLUNA : result := qryProdutos.Locate('valorgrade1;valorgrade2', VarArrayOf([Coluna,qrygrade.FieldByName('valorlinha').AsString]),[]);
      end;
    end
    else
    if (Coluna <> '') then
       result := qryprodutos.Locate('valorgrade2', Coluna,[])
    else
    if (qrygrade.FieldByName('valorlinha').AsString <> '') then
       result := qryprodutos.Locate('valorgrade1', qrygrade.FieldByName('valorlinha').AsString,[]);
  end;
end;
}

procedure TdtmCadastroNotasFiscais.qryGradeAfterScroll(DataSet: TDataSet);
begin
  inherited;
  {
  dataset.FieldByName('precounitario').ReadOnly    := dataset.FieldByName('precodiferente').AsBoolean;
  dataset.FieldByName('aliquotaicms').ReadOnly     := dataset.FieldByName('icmsdiferente').AsBoolean;
  dataset.FieldByName('aliquotaipi').ReadOnly      := dataset.FieldByName('ipidiferente').AsBoolean;
  dataset.FieldByName('valorreducaobase').ReadOnly := dataset.FieldByName('reducaobasediferente').AsBoolean;
  }

  if Assigned(OnScrollLinhaColunaGrade) then
    OnScrollLinhaColunaGrade(qryProdutosNotaFiscal);

end;

function TdtmCadastroNotasFiscais.GetCopiaProdutoColunaGrade: String;
begin
 result := trim(qryProdutosNotasPagNFEItemsvalorgrade2.AsString);
end;

function TdtmCadastroNotasFiscais.GetCopiaProdutoLinhaGrade: String;
begin
 result := trim(qryProdutosNotasPagNFEItemsvalorgrade1.AsString);
end;

function TdtmCadastroNotasFiscais.PosicionarLinhaColunanoProdutoNotaFiscal(
  Coluna: String): boolean;
var
  vTeste : String;
begin
  result := false;
  if qryProdutosNotaFiscal.Active and
     (qrygrade.RecordCount>0) then
  begin
    vTeste := qrygrade.FieldByName('valorlinha').AsString;
    if (Coluna <> '') and (qrygrade.FieldByName('valorlinha').AsString <> '') then
    begin
     case tipoGrade of
      tpLINHA : result := qryProdutosNotaFiscal.active and
                          qryProdutosNotaFiscal.Locate('valorgrade1;valorgrade2;codigorecolha;numerosequencianfe;numerosequencianfeitens',
                          VarArrayOf([qrygrade.FieldByName('valorlinha').AsString,
                                       Coluna,
                                       '',
                                       qryProdutosNotasPagNFEItemsnumerosequencianfe.asinteger, qryProdutosNotasPagNFEItemsnumero.asinteger]),[]);

      tpCOLUNA : result := qryProdutosNotaFiscal.active and
                           qryProdutosNotaFiscal.Locate('valorgrade1;valorgrade2;codigorecolha;numerosequencianfe;numerosequencianfeitens',
                           VarArrayOf([Coluna,qrygrade.FieldByName('valorlinha').AsString,'',
                           qryProdutosNotasPagNFEItemsnumerosequencianfe.asinteger, qryProdutosNotasPagNFEItemsnumero.asinteger]),[]);
     end;
    end
    else
    if (Coluna <> '') then
     result := qryProdutosNotaFiscal.active and
               qryProdutosNotaFiscal.Locate('valorgrade2;codigorecolha;numerosequencianfe;numerosequencianfeitens',
               VarArrayOf([Coluna,'',
               qryProdutosNotasPagNFEItemsnumerosequencianfe.asinteger, qryProdutosNotasPagNFEItemsnumero.asinteger]),[])
    else
    if (qrygrade.FieldByName('valorlinha').AsString <> '') then
     result := qryProdutosNotaFiscal.active and qryProdutosNotaFiscal.Locate('valorgrade1;codigorecolha;numerosequencianfe;numerosequencianfeitens',
               VarArrayOf([qrygrade.FieldByName('valorlinha').AsString,'',
               qryProdutosNotasPagNFEItemsnumerosequencianfe.asinteger, qryProdutosNotasPagNFEItemsnumero.asinteger]),[]);
  end;

//  qrygrade.Close;
//  qryProdutosNotaFiscal.Close;
end;

function TdtmCadastroNotasFiscais.PosicionarLinhaColunanoProdutoNotaFiscalCopia(
  Coluna: String): boolean;
begin
  result := false;
  if qryProdutosNotaFiscal.Active then
  begin
    if (Coluna <> '') and (qrygrade.FieldByName('valorlinha').AsString <> '') then
    begin
      case tipoGrade of
       tpLINHA : result := qryProdutosNotaFiscal.Locate('valorgrade1;valorgrade2', VarArrayOf([qrygrade.FieldByName('valorlinha').AsString,Coluna]),[]);
       tpCOLUNA : result := qryProdutosNotaFiscal.Locate('valorgrade1;valorgrade2', VarArrayOf([Coluna,qrygrade.FieldByName('valorlinha').AsString]),[]);
      end;
    end
    else
    if (Coluna <> '') then
     result := qryProdutosNotaFiscal.Locate('valorgrade2', Coluna,[])
    else
    if (qrygrade.FieldByName('valorlinha').AsString <> '') then
     result := qryProdutosNotaFiscal.Locate('valorgrade1', qrygrade.FieldByName('valorlinha').AsString,[]);
  end;

  if Assigned(OnScrollLinhaColunaGrade) then
  OnScrollLinhaColunaGrade(qryProdutosNotaFiscal);

  
end;

function TdtmCadastroNotasFiscais.GetTabelaGrade: TtecQuery;
begin
  Result := qryGrade;
end;

procedure TdtmCadastroNotasFiscais.EditarGrade(Editar: Boolean);
begin
 if editar then
  qrygrade.edit;
end;


procedure TdtmCadastroNotasFiscais.setExistePrecoemBranco(
  const Value: Boolean);
begin
  FExistePrecoemBranco := Value;
end;

procedure TdtmCadastroNotasFiscais.AbreTabelaProcuraCaracteristica;
begin
 ReFazConsulta(qryCaracteristicasNotaFiscal, [2], [qryProdutosNotaFiscalcaracteristica.AsVariant]);
end;


function TdtmCadastroNotasFiscais.GetCaracteristicaProduto: String;
begin
 result := qryProdutosNotaFiscalcaracteristica.AsString;
end;


procedure TdtmCadastroNotasFiscais.qryProdutosNotaFiscalCalcFields(
  DataSet: TDataSet);
begin
  inherited;

  qryProdutosNotaFiscaldescricaolc.AsString :=
    qryProdutosNotaFiscaldescricaoproduto.AsString+' '+
    qryProdutosNotaFiscalvalorgrade1.AsString+' '+
    qryProdutosNotaFiscalvalorgrade2.AsString;

  if qryNotaFiscalcodigofiscal.AsInteger - (qryNotaFiscalcodigofiscal.AsInteger mod 1000) = 3000 then
    qryProdutosNotaFiscalTotalQuantidadeXprecounitario.AsFloat := RoundTo(
                  (qryProdutosNotaFiscalprecounitario.asFloat *
                    qryProdutosNotaFiscalquantidade.AsFloat), -2)
  else
    qryProdutosNotaFiscalTotalQuantidadeXprecounitario.AsFloat := RoundTo(
                  (qryProdutosNotaFiscalprecounitario.AsFloat *
                    qryProdutosNotaFiscalquantidade.AsFloat), -2);


  qryProdutosNotaFiscalTotalLiquido.asfloat := qryProdutosNotaFiscalTotalQuantidadeXprecounitario.AsFloat -
                                               qryProdutosNotaFiscaldesconto.AsFloat -
                                               qryProdutosNotaFiscalvalordescontoitem.AsFloat;

  qryProdutosNotaFiscalTotalProdutoMaisIPI.AsCurrency :=
    qryProdutosNotaFiscalTotalLiquido.asfloat +
    qryProdutosNotaFiscalFrete.asFloat +
    qryProdutosNotaFiscalvaloripi.AsCurrency;


  if qryProdutosNotaFiscalprecoatual.asFloat <> 0 then
    qryProdutosNotaFiscalpercAtual_x_Venda.asFloat := (qryProdutosNotaFiscalprecovenda.asFloat * 100 / qryProdutosNotaFiscalprecoatual.asFloat) - 100
  else
    qryProdutosNotaFiscalpercAtual_x_Venda.asFloat := 0;

  if qryProdutosNotaFiscalprecovenda.asFloat <> 0 then
    qryProdutosNotaFiscalpercVenda_x_Digitado.asFloat := (qryProdutosNotaFiscalprecodigitado.asFloat * 100 / qryProdutosNotaFiscalprecovenda.asFloat) - 100
  else
    qryProdutosNotaFiscalpercVenda_x_Digitado.asFloat := 0;

  if qryProdutosNotaFiscalprecounitariopedido.asFloat <> 0 then
    qryProdutosNotaFiscalpercUnitario_x_Pedido.asFloat := ((qryProdutosNotaFiscalprecounitario.asFloat/qryProdutosNotaFiscalfatorconversao.asfloat) * 100 / qryProdutosNotaFiscalprecounitariopedido.asFloat) -100
  else
    qryProdutosNotaFiscalpercUnitario_x_Pedido.asFloat := 0;

end;

procedure TdtmCadastroNotasFiscais.AbrirElementosNaoCadastrados;
{
const
 sQL = 'and eg.valor not in (%s)';
var
 I : integer;
 ListaLinha : String;
 }
begin

{
 case tipoGrade of
  tpLINHA : qryLinhas.Params[0].AsInteger := qryCaracteristicasNotaFiscalgrade1.AsInteger;
  tpCOLUNA: qryLinhas.Params[0].AsInteger := qryCaracteristicasNotaFiscalgrade2.AsInteger;
 end;
 for I:=0 to LInhas.Count-1 do
  ListaLinha := ListaLinha+quotedstr(Linhas[I])+',';
 delete(ListaLinha, length(ListaLinha),1);
 if ListaLinha<>'' then
   qryLinhas.Sql[15] := format(SQL, [ListaLinha])
 else  qryLinhas.Sql[15] := '' ;
 qrylinhas.open;
}

  qryIncluircaracteristicaselementosnotaspag.parambyname('codigonota').asInteger := qryNotaFiscalcodigo.asinteger;
  qryIncluircaracteristicaselementosnotaspag.parambyname('caracteristica').asString := qryCaracteristicasNotaFiscalcaracteristica.asString;
  qryIncluircaracteristicaselementosnotaspag.parambyname('grade').asInteger := qryCaracteristicasNotaFiscalgrade1.asInteger;
  qryIncluircaracteristicaselementosnotaspag.parambyname('eHlinha').asBoolean := true;
  qryIncluircaracteristicaselementosnotaspag.execSQL;
  perpetrar([qryIncluircaracteristicaselementosnotaspag]);
  qryIncluircaracteristicaselementosnotaspag.parambyname('grade').asInteger := qryCaracteristicasNotaFiscalgrade2.asInteger;
  qryIncluircaracteristicaselementosnotaspag.parambyname('eHlinha').asBoolean := false;

  qryIncluircaracteristicaselementosnotaspag.execSQL;
  perpetrar([qryIncluircaracteristicaselementosnotaspag]);

  qrycaracteristicaselementosnotaspag_l.parambyname('codigonota').asInteger := qryNotaFiscalcodigo.asinteger;
  qrycaracteristicaselementosnotaspag_l.parambyname('caracteristica').asString := qryCaracteristicasNotaFiscalcaracteristica.asString;
  qrycaracteristicaselementosnotaspag_l.parambyname('grade1').asInteger := qryCaracteristicasNotaFiscalgrade1.asInteger;

  qrycaracteristicaselementosnotaspag_c.parambyname('codigonota').asInteger := qryNotaFiscalcodigo.asinteger;
  qrycaracteristicaselementosnotaspag_c.parambyname('caracteristica').asString := qryCaracteristicasNotaFiscalcaracteristica.asString;
  qrycaracteristicaselementosnotaspag_c.parambyname('grade2').asInteger := qryCaracteristicasNotaFiscalgrade2.asInteger;

  qrycaracteristicaselementosnotaspag_l.close;
  qrycaracteristicaselementosnotaspag_c.close;

  qrycaracteristicaselementosnotaspag_l.open;
  qrycaracteristicaselementosnotaspag_c.open;

  qryElementosLinhas.parambyname('codigonota').asInteger := qryNotaFiscalcodigo.asinteger;
  qryElementosLinhas.parambyname('caracteristica').asString := qryCaracteristicasNotaFiscalcaracteristica.asString;
  qryElementosLinhas.parambyname('grade1').asInteger := qryCaracteristicasNotaFiscalgrade1.asInteger;

  qryElementosColunas.parambyname('codigonota').asInteger := qryNotaFiscalcodigo.asinteger;
  qryElementosColunas.parambyname('caracteristica').asString := qryCaracteristicasNotaFiscalcaracteristica.asString;
  qryElementosColunas.parambyname('grade2').asInteger := qryCaracteristicasNotaFiscalgrade2.asInteger;

  qryElementosLinhas.close;
  qryElementosColunas.close;

  qryElementosLinhas.open;
  qryElementosColunas.open;

end;

function TdtmCadastroNotasFiscais.GetTabelaLinhas: TZDataSet;
begin
 result := qrylinhas;
end;

function TdtmCadastroNotasFiscais.GravarElementosGrade: Boolean;
{
var
  a, b: Integer;
  PosAnt: TBookmark;
  OK: Boolean;
  Valores: array of String;
  }
begin
  RefazconsultaPorNome(qryLinhas,['grade'], [qryCaracteristicasNotaFiscalgrade1.AsInteger]);
  qrycaracteristicaselementosnotaspag_l.first;
  while not  qrycaracteristicaselementosnotaspag_l.eof do
  begin
    if not qrycaracteristicaselementosnotaspag_lemuso.AsBoolean then
    begin
      if not qrylinhas.locate('valor', qrycaracteristicaselementosnotaspag_lvalor.AsString, []) then
      begin
        qrylinhas.append;
        qryLinhasgrade.asinteger := qrycaracteristicaselementosnotaspag_lgrade.AsInteger;
        qryLinhasvalor.asString :=  qrycaracteristicaselementosnotaspag_lvalor.AsString;
        qryLinhasusual.asBoolean := true;
        qryLinhasabreviatura.asString := qrycaracteristicaselementosnotaspag_labreviatura.AsString;
        qrylinhas.post;
      end
      else
      begin
        qrylinhas.edit;
        qryLinhasusual.asBoolean := true;
        qryLinhasabreviatura.asString := qrycaracteristicaselementosnotaspag_labreviatura.AsString;
        qrylinhas.post;
      end;
    end;
    qrycaracteristicaselementosnotaspag_l.next;
  end;

//  result := perpetrar([qrylinhas, qrycaracteristicaselementosnotaspag_l], AguardareTerminarDentroDm);
  result := perpetrar([qrylinhas, qrycaracteristicaselementosnotaspag_l]);

  if result then
  begin

    RefazconsultaPorNome(qryLinhas,['grade'], [qryCaracteristicasNotaFiscalgrade2.AsInteger]);
    qrycaracteristicaselementosnotaspag_c.first;
    while not  qrycaracteristicaselementosnotaspag_c.eof do
    begin
      if not qrycaracteristicaselementosnotaspag_cemuso.AsBoolean then
      begin
        if not qrylinhas.locate('valor', qrycaracteristicaselementosnotaspag_cvalor.AsString, []) then
        begin
          qrylinhas.append;
          qryLinhasgrade.asinteger := qrycaracteristicaselementosnotaspag_cgrade.AsInteger;
          qryLinhasvalor.asString :=  qrycaracteristicaselementosnotaspag_cvalor.AsString;
          qryLinhasusual.asBoolean := true;
          qryLinhasabreviatura.asString := qrycaracteristicaselementosnotaspag_cabreviatura.AsString;
          qrylinhas.post;
        end
        else
        begin
          qrylinhas.edit;
          qryLinhasusual.asBoolean := true;
          qryLinhasabreviatura.asString := qrycaracteristicaselementosnotaspag_cabreviatura.AsString;
          qrylinhas.post;
        end;
      end;
      qrycaracteristicaselementosnotaspag_c.next;
    end;
//    result := perpetrar([qrylinhas, qrycaracteristicaselementosnotaspag_c], AguardareTerminarDentroDm);
    result := perpetrar([qrylinhas, qrycaracteristicaselementosnotaspag_c]);

  end;

  if (qrycaracteristicaselementosnotaspag_l.recordcount = 0) then
  begin
    result := false;
    MensagemAviso('Elementos da linha da grade não informados');
  end
  else
  if (qrycaracteristicaselementosnotaspag_c.recordcount = 0) then
  begin
    result := false;
    MensagemAviso('Elementos da coluna da grade não informados');
  end;



  (*
  if qrylinhas.CheckRequiredFields then
  begin
      OK := True;
      if qryLinhas.State in [dsEdit, dsInsert] then
        qryLinhas.Post;
      if qryLinhas.RecordCount > 1 then begin
        SetLength(Valores, qryLinhas.RecordCount+linhas.Count);
        PosAnt := qryLinhas.GetBookmark;
        qryLinhas.DisableControls;
        try
          qryLinhas.First;
          for a := 0 to qryLinhas.RecordCount - 1 do begin
            Valores[a]  := qryLinhaslinha.AsString;
            qryLinhas.Next;
          end;
          for a := 0 to Linhas.count -1 do
            Valores[a+qryLinhas.RecordCount] := Linhas[a]
        finally
          qryLinhas.GotoBookmark(PosAnt);
          qryLinhas.FreeBookmark(PosAnt);
          qryLinhas.EnableControls
        end;

        for a := 0 to High(Valores) - 1 do begin
          for b := a + 1 to High(Valores) do
            if Valores[a] = Valores[b] then begin
              OK := False;
              break
            end;
          if Not OK then
            Break
        end
      end;
      if OK then begin
        result := Perpetrar([qryLinhas], AguardareTerminarDentroDm);
        if result then
        begin
          try
            PodeInserirnaGrade := true;
            dsrGrade.OnDataChange := nil;
            qrygrade.DisableControls;
            qrylinhas.First;
            while not qrylinhas.Eof do
            begin
              if qryLinhasmarcar.AsBoolean then
              begin
                case tipoGrade of
                  tpLINHA :
                  begin
                    if (colunas.count)=0 then
                      AdicionarLinhaColuna('',qryCaracteristicasNotaFiscalcaracteristica.AsString,
                        qryLinhaslinha.AsString+'',qryLinhaslinha.AsString,'')
                    else
                    begin
                      if (linhas.count)=0 then
                       for a:=0 to colunas.count -1 do
                         AdicionarLinhaColuna(a, '',qryCaracteristicasNotaFiscalcaracteristica.AsString,
                           qryLinhaslinha.AsString+colunas[a],qryLinhaslinha.AsString,colunas[a])
                      else
                       for a:=0 to colunas.count -1 do
                         AdicionarLinhaColuna('',qryCaracteristicasNotaFiscalcaracteristica.AsString,
                           qryLinhaslinha.AsString+colunas[a],qryLinhaslinha.AsString,colunas[a]);
                    end;
                  end;
                  tpCOLUNA :
                  begin
                    if (colunas.count)=0 then
                      AdicionarLinhaColuna('',qryCaracteristicasNotaFiscalcaracteristica.AsString,
                       ''+qryLinhaslinha.AsString,'',qryLinhaslinha.AsString)
                    else
                    begin
                      if (linhas.count)=0 then
                       for a:=0 to colunas.count -1 do
                         AdicionarLinhaColuna(a,'',
                           qryCaracteristicasNotaFiscalcaracteristica.AsString,
                           colunas[a]+qryLinhaslinha.AsString, colunas[a], qryLinhaslinha.AsString)
                      else
                       for a:=0 to colunas.count -1 do
                         AdicionarLinhaColuna('',
                           qryCaracteristicasNotaFiscalcaracteristica.AsString,
                           colunas[a]+qryLinhaslinha.AsString, colunas[a], qryLinhaslinha.AsString);
                    end;
                  end;
                end;
                qrygrade.First;
                while (qrygrade.FieldByName('valorlinha').AsString < qryLinhaslinha.asstring) do
                begin
                  qrygrade.next;
                  if qrygrade.Eof then
                    break;
                end;
                if qrygrade.Eof then
                  qrygrade.Append
                else
                  qryGrade.insert;
                qrygrade.FieldByName('valorlinha').AsString := qryLinhaslinha.AsString;
                qrygrade.Post;
                linhas.Add(qryLinhaslinha.AsString);
              end;
              qrylinhas.Next;
            end;
          finally
            qrygrade.EnableControls;
            dsrGrade.OnDataChange := dsrGradeDataChange;
            PodeInserirnaGrade := false;
          end;
        end;
      end else begin
        Result := False;
        MensagemAviso(ctREPETICAOELEMENTOGRADE);
      end
  end
  *)
end;

procedure TdtmCadastroNotasFiscais.qryLinhasAfterInsert(DataSet: TDataSet);
begin
  inherited;
  case tipoGrade of
   tpLINHA : qryLinhasgrade.AsInteger := qryCaracteristicasNotaFiscalgrade1.AsInteger;
   tpCOLUNA : qryLinhasgrade.AsInteger := qryCaracteristicasNotaFiscalgrade2.AsInteger;
  end;
end;

procedure TdtmCadastroNotasFiscais.qryEstoquesNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryEstoquesemestoque .AsCurrency     := 0;
  qryEstoquesreservado.AsCurrency     := 0;
  qryEstoquestransito.AsInteger      := 0;
  qryEstoquesdemonstracao.AsCurrency  := 0;
  qryEstoquesconserto.AsCurrency      := 0;
  qryEstoquesfuturo.AsCurrency        := 0;
  qryEstoquesdanificada.AsCurrency    := 0;
  qryEstoquesestoquefisico.AsCurrency := 0;
end;

procedure TdtmCadastroNotasFiscais.qryGradeAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if not PodeInserirnaGrade then
    qrygrade.Cancel;
end;

function TdtmCadastroNotasFiscais.GetCodigoProcuraCaracteristica: String;
begin
 result := qryCaracteristicasNotaFiscalcaracteristica.AsString;
end;


{
procedure TdtmCadastroNotasFiscais.AdicionarLinhaColuna(CodigoProduto,
  CodigoCaracteristica, LinhaColuna, Linha, Coluna: String);
begin
  LinhasColunas[codigo].Add(codigoProduto);
  LinhasColunas[Caracteristica].Add(CodigoCaracteristica);
  LinhasColunas[ValorLinhaColuna].Add(LinhaColuna);
  LinhasColunas[ValorLinha].Add(Linha);
  LinhasColunas[ValorColuna].Add(Coluna);
end;
}

{
procedure TdtmCadastroNotasFiscais.AdicionarLinhaColuna(index: integer;
  CodigoProduto, CodigoCaracteristica, LinhaColuna, Linha, Coluna: String);
begin
  LinhasColunas[codigo].Strings[index] := codigoProduto;
  LinhasColunas[Caracteristica].Strings[index] := CodigoCaracteristica;
  LinhasColunas[ValorLinhaColuna].Strings[index] := LinhaColuna;
  LinhasColunas[ValorLinha].Strings[index] := Linha;
  LinhasColunas[ValorColuna].Strings[index] :=Coluna;
end;
}

function TdtmCadastroNotasFiscais.GetPodeTrocarVisualizacaoGrade: boolean;
begin
  result := (qryCaracteristicasNotaFiscalgrade1.AsInteger<>0) and
            (qryCaracteristicasNotaFiscalgrade2.AsInteger<>0);
end;

procedure TdtmCadastroNotasFiscais.LocalizarLinha(elemento:String);
begin
 qrylinhas.Locate('linha',elemento,[loPartialKey]);
end;

procedure TdtmCadastroNotasFiscais.CalcularValorTotalProdutosGrade;
var
  Pos: TBookmark;
  TotalProdutos,
  TotalIPI,
  QtdeProdutos,
  PrecoTotal,
  DescontoRateadoIPI,
  AcrescimoRateadadoIPI: Currency;
begin
  TotalProdutos := 0;
  TotalIPI      := 0;
  QtdeProdutos  := 0;

 {
  Pos := qryProdutosNotaFiscal.GetBookmark;
  try
    qryProdutosNotaFiscal.First;
    while Not qryProdutosNotaFiscal.Eof do
    begin
      PrecoTotal :=  qryProdutosNotaFiscalquantidade.AsFloat *
                     qryProdutosNotaFiscalprecounitario.AsFloat);
      TotalProdutos := TotalProdutos + PrecoTotal;
      QtdeProdutos := QtdeProdutos + qryProdutosNotaFiscalquantidade.AsFloat;
      qryProdutosNotaFiscal.Next;
    end;

  finally
    qryProdutosNotaFiscal.GotoBookmark(Pos);
    qryProdutosNotaFiscal.FreeBookmark(Pos);
    qryProdutosNotaFiscal.EnableControls;
  end;
 }

  if qryProdutosNotaFiscal.Active then
  begin


    try

      qryProdutosNotaFiscal.AfterScroll := nil;
      qryProdutosNotaFiscal.DisableControls;
    //  qryProdutosNotaFiscalproduto.OnChange := nil;
      Pos := qryProdutosNotaFiscal.GetBookmark;
      DesabilitarControles(true);

      qryProdutosNotaFiscal.First;
      while Not qryProdutosNotaFiscal.Eof do
      begin
        PrecoTotal := (qryProdutosNotaFiscalquantidade.AsFloat * qryProdutosNotaFiscalprecounitario.asFloat) - qryProdutosNotaFiscalvalordescontoitem.asfloat;
        TotalProdutos := TotalProdutos + PrecoTotal;
        QtdeProdutos := QtdeProdutos + qryProdutosNotaFiscalquantidade.AsFloat;
        qryProdutosNotaFiscal.Next;
      end;
    finally
  //    qryProdutosNotaFiscalproduto.OnChange := qryProdutosNotaFiscalprodutoChange;
      qryProdutosNotaFiscal.AfterScroll     := qryProdutosNotaFiscalAfterScroll;
      qryProdutosNotaFiscal.GotoBookmark(Pos);
      qryProdutosNotaFiscal.FreeBookmark(Pos);
      qryProdutosNotaFiscal.EnableControls;
      DesabilitarControles(false);
    end;
  end;

  {
  Pos := qryProdutosNotaFiscal.GetBookmark;
  try
    qryProdutosNotaFiscal.First;
    while Not qryProdutosNotaFiscal.Eof do
    begin
      PrecoTotal := qryProdutosNotaFiscalquantidade.AsFloat *
                    qryProdutosNotaFiscalprecounitario.AsFloat;
      if TotalProdutos<>0 then
      begin
        DescontoRateadoIPI := (Precototal * qryNotaFiscaldesconto.AsCurrency)/TotalProdutos;
        AcrescimoRateadadoIPI := (PrecoTotal * ValorRatearIPI)/TotalProdutos
      end
      else
      begin
        DescontoRateadoIPI    := 0;
        AcrescimoRateadadoIPI := 0;
      end;

      TotalIPI := TotalIPI + qryProdutosNotaFiscalvaloripi.AsCurrency
                  - ((DescontoRateadoIPI * qryProdutosNotaFiscalaliquotaipi.ascurrency)/100)
                  + ((AcrescimoRateadadoIPI * qryProdutosNotaFiscalaliquotaipi.ascurrency)/100);

      qryProdutosNotaFiscal.Next;
    end;

  finally
    qryProdutosNotaFiscal.GotoBookmark(Pos);
    qryProdutosNotaFiscal.FreeBookmark(Pos);
    qryProdutosNotaFiscal.EnableControls;
  end;
  }

  if qryProdutosNotaFiscal.Active then
  begin

    try

      qryProdutosNotaFiscal.AfterScroll := nil;
      qryProdutosNotaFiscal.DisableControls;
    //  qryProdutosNotaFiscalproduto.OnChange := nil;
      Pos := qryProdutosNotaFiscal.GetBookmark;
      DesabilitarControles(true);

      qryProdutosNotaFiscal.First;
      while Not qryProdutosNotaFiscal.Eof do begin
        PrecoTotal := (qryProdutosNotaFiscalquantidade.AsFloat * qryProdutosNotaFiscalprecounitario.asFloat) - qryProdutosNotaFiscalValorDescontoItem.asfloat;
        if TotalProdutos<>0 then
        begin
          DescontoRateadoIPI := (Precototal * qryNotaFiscaldesconto.AsCurrency)/TotalProdutos;
          AcrescimoRateadadoIPI := (PrecoTotal * ValorRatearIPI)/TotalProdutos;
        end
        else
        begin
          DescontoRateadoIPI    := 0;
          AcrescimoRateadadoIPI := 0;
        end;

        TotalIPI := TotalIPI + qryProdutosNotaFiscalvaloripi.AsCurrency
                    - ((DescontoRateadoIPI * qryProdutosNotaFiscalaliquotaipi.ascurrency)/100)
                    + ((AcrescimoRateadadoIPI * qryProdutosNotaFiscalaliquotaipi.ascurrency)/100);

        qryProdutosNotaFiscal.Next;
      end;
    finally
      totalIPI := truncar(totalipi,2);
      EditarNotaFiscal;
      qryNotaFiscalvalorprodutos.AsCurrency := TotalProdutos;
      if not totalValorIPIAlterado then
      begin
        if TotalIPI = 0 then
          qryNotaFiscalvalorIPI.clear
        else
          qryNotaFiscalvalorIPI.AsCurrency      := TotalIPI;
      end;
      qryNotaFiscaltotalprodutos.AsCurrency := TotalProdutos - qryNotaFiscaldesconto.AsCurrency  + qryNotaFiscalacrescimo.AsCurrency;
      qryNotaFiscalTotalQtdeProdutos.AsCurrency := QtdeProdutos;
  //    qryProdutosNotaFiscalproduto.OnChange := qryProdutosNotaFiscalprodutoChange;
      qryProdutosNotaFiscal.AfterScroll     := qryProdutosNotaFiscalAfterScroll;
      qryProdutosNotaFiscal.GotoBookmark(Pos);
      qryProdutosNotaFiscal.FreeBookmark(Pos);
      qryProdutosNotaFiscal.EnableControls;
      DesabilitarControles(false);
    end;
  end;  
end;

{
function TdtmCadastroNotasFiscais.JaCadastradonaGrade(
  Elemento: String): boolean;
begin
  result := linhas.IndexOf(Elemento) <> -1;
end;
}



function TdtmCadastroNotasFiscais.GetNotaCancelada: Boolean;
begin
  Result:= qryNotaFiscalsituacao.AsString = 'C';
end;

procedure TdtmCadastroNotasFiscais.qryNotaFiscalCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if (qryNotaFiscalsituacao.AsString = 'N') or
     (trim(qryNotaFiscalsituacao.AsString) = '') then
  begin
    if qryNotaFiscalEstornada.asBoolean then
      qryNotaFiscaldescricaosituacao.AsString := 'ESTORNADA'
    else
    begin
      qryNotaFiscaldescricaosituacao.asvariant := null;
      qryNotaFiscaldescricaosituacao.asString := '';
      qryNotaFiscaldescricaosituacao.clear;

    end
  end
  else
  if qryNotaFiscalsituacao.AsString = 'C' then
    qryNotaFiscaldescricaosituacao.AsString := ANSIUpperCase(ctCANCELADA)
  else
  if qryNotaFiscalsituacao.AsString = 'D' then
  begin
    if qryNotaFiscalstatusnfe.AsString = '301' then
      qryNotaFiscaldescricaosituacao.AsString := 'DENEGADA EMITENTE'
    else
      qryNotaFiscaldescricaosituacao.AsString := 'DENEGADA';
  end
  else
  if qryNotaFiscalsituacao.AsString = 'P' then
    qryNotaFiscaldescricaosituacao.AsString := ANSIUpperCase(ctParcial);

{  qryNotaFiscalTotalLiquido.AsCurrency := qryNotaFiscalprodutos.AsCurrency -
                                          qryNotaFiscaldesconto.AsCurrency;}

  if (qryNotaFiscalmodelodocto.AsString='55') and PossuiSomenteNumero(qryNotaFiscalserie.AsString) and (qryNotaFiscalpermitirimprimir.AsBoolean) then
  begin
    qryNotaFiscalNFE_Calculada.AsString :=
       copy(qryNotaFiscalCidadeIBGE.AsString,1,2) +       // 2
       FormatDateTime('YYMM',qryNotaFiscalemissao.AsDateTime)+      // 4
       preencheString(qryNotaFiscalcnpj_filial.AsString,'0',14,false) +
       preencheString(qryNotaFiscalmodelodocto.AsString,'0',2,false)+ // 2
       preencheString(qryNotaFiscalserie.AsString,'0',3,false)+                  // 3
       preencheString(qryNotaFiscalnrdocumento.Asstring,'0',9,false) + // 9
       ifthen(qryNotaFiscalformaemissao.AsString<>'', qryNotaFiscalformaemissao.AsString, inttostr(NFeTipoEmissao)) + //1
       preencheString(inttostr(Aleatorio(qryNotaFiscalemissao.AsDateTime, qryNotaFiscalnrdocumento.Asstring)),'0',8, false);

    qryNotaFiscalNFE_Calculada.AsString := qryNotaFiscalNFE_Calculada.AsString +
                                             Modulo11(qryNotaFiscalNFE_Calculada.AsString);
  end;
                                          
end;


procedure TdtmCadastroNotasFiscais.dsrProdutosNotaFiscalDataChange(
  Sender: TObject; Field: TField);
var
  Qtdade: Currency;
begin
  inherited;
  {
  if (field = qryProdutosNotaFiscal.FieldByName('permitiratualizardigitado')) then
  begin
    MensagemAviso('ok');
  end;
  }

  if (field = qryProdutosNotaFiscal.FieldByName('fatorconversao')) then
  begin
    if field.AsCurrency = 0 then
    begin
      MensagemErro('O Fator de conversão deve ser maior do que zero');
      field.AsFloat := vFatorConversaoPNPAntesEditar;
    end
    else
      qryProdutosNotaFiscal.FieldByName('qtdeestoque').asFloat := qryProdutosNotaFiscal.FieldByName('quantidade').AsFloat * qryProdutosNotaFiscal.FieldByName('fatorconversao').AsFloat;
  end;

  if field = qryProdutosNotaFiscalqtdeestoque then
  begin
    if (field.AsCurrency = 0) then
    begin
      MensagemErro('A quantidade em estoque deve ser maior do que zero');
      field.AsCurrency := vQtdeEstoquePNPAntesEditar;
    end;
  end;

  {

  if (field = qryProdutosNotaFiscalprodutovisual) and (qryProcuraProdutoNotaFiscalproduto.AsLargeInt<>0) then
    qryProdutosNotaFiscalproduto.AsLargeInt   := qryProcuraProdutoNotaFiscalproduto.AsLargeInt;
  }

  if (field = qryProdutosNotaFiscalprecodigitado) then
  begin
    dsrProdutosnotafiscal.OnDataChange := nil;
    qryProdutosNotaFiscalprecodigitadoalterado.AsBoolean :=
      qryProdutosNotaFiscalprecodigitado.AsCurrency <>
      qryProdutosNotaFiscalprecoatribuido.AsCurrency;

    AtribuirPreco(qryProdutosNotaFiscalcaracteristica.AsString,
                  qryProdutosNotaFiscalpreco.AsInteger,
                  qryProdutosNotaFiscalcustoparavenda.AsCurrency,
                  qryProdutosNotaFiscalprecodigitado.AsCurrency,
                  false,
                  qryProdutosNotaFiscalprecodigitado);

    CalcularImpostos(true {,true});

    dsrProdutosnotafiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
  end;

  if (field = qryProdutosNotaFiscal.FieldByName('quantidade')) or
     (field = qryProdutosNotaFiscal.FieldByName('precounitario')) then
  begin
    dsrProdutosNotaFiscal.OnDataChange := nil;
    qryProdutosNotaFiscal.FieldByName('qtdeestoque').AsFloat := qryProdutosNotaFiscal.FieldByName('quantidade').AsFloat * qryProdutosNotaFiscal.FieldByName('fatorconversao').AsFloat;
    CalcularImpostos(true {,true});
    dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
  end;

  if (field = qryProdutosNotaFiscal.FieldByName('percentualreducaobase')) then
    if (qryProdutosNotaFiscal.FieldByName('percentualreducaobase').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valoricmsdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('valorreducaobase')) then
    if (qryProdutosNotaFiscal.FieldByName('valorreducaobase').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valoricmsdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('icmsbasecalculo')) then
    if (qryProdutosNotaFiscal.FieldByName('icmsbasecalculo').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valoricmsdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('aliquotaicms')) then
    if (qryProdutosNotaFiscal.FieldByName('aliquotaicms').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valoricmsdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('icmsvalor')) then
    if (qryProdutosNotaFiscal.FieldByName('icmsvalor').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valoricmsdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('pMVAST')) then
    if (qryProdutosNotaFiscal.FieldByName('pMVAST').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valoricmsstdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      if qryProdutosNotaFiscal.FieldByName('pMVAST').Value <> 0 then
        qryProdutosNotaFiscalfatorsubstituicao.AsCurrency :=  1 + (qryProdutosNotaFiscal.FieldByName('pMVAST').Value/100)
      else
        qryProdutosNotaFiscalfatorsubstituicao.AsCurrency := 0;

      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;


  if field = qryProdutosNotaFiscal.FieldByName('fatorsubstituicao') then
    if qryProdutosNotaFiscal.FieldByName('fatorsubstituicao').Value <> Null then
    begin

      qryProdutosNotaFiscal.FieldByName('valoricmsstdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      if qryProdutosNotaFiscalfatorsubstituicao.AsCurrency > 1 then
        qryProdutosNotaFiscalpMVAST.AsCurrency := abs((1 - qryProdutosNotaFiscalfatorsubstituicao.AsCurrency) * 100)
      else
        qryProdutosNotaFiscalpMVAST.AsCurrency := 0;

      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;

    end;

  if (field = qryProdutosNotaFiscal.FieldByName('predbcst')) then
    if (qryProdutosNotaFiscal.FieldByName('predbcst').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valoricmsstdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('reducaobasest')) then
    if (qryProdutosNotaFiscal.FieldByName('reducaobasest').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valoricmsstdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('icmsbasecalculost')) then
    if (qryProdutosNotaFiscal.FieldByName('icmsbasecalculost').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valoricmsstdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('aliquotaicmsst')) then
    if (qryProdutosNotaFiscal.FieldByName('aliquotaicmsst').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valoricmsstdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('icmsvalorst')) then
    if (qryProdutosNotaFiscal.FieldByName('icmsvalorst').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valoricmsstdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

   if (field = qryProdutosNotaFiscal.FieldByName('ipicst')) then
    if (qryProdutosNotaFiscal.FieldByName('ipicst').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valoripidigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

   if (field = qryProdutosNotaFiscal.FieldByName('ipicst_nf')) then
    if (qryProdutosNotaFiscal.FieldByName('ipicst_nf').Value <> Null) then
    begin
//      qryProdutosNotaFiscal.FieldByName('valoripidigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('aliquotaipi')) then
    if (qryProdutosNotaFiscal.FieldByName('aliquotaipi').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valoripidigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('valoripi')) then
    if (qryProdutosNotaFiscal.FieldByName('valoripi').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valoripidigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('pisbasecalculo')) then
    if (qryProdutosNotaFiscal.FieldByName('pisbasecalculo').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valorpisdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('pisaliquota')) then
    if (qryProdutosNotaFiscal.FieldByName('pisaliquota').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valorpisdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('pisvalor')) then
    if (qryProdutosNotaFiscal.FieldByName('pisvalor').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valorpisdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;


  if (field = qryProdutosNotaFiscal.FieldByName('piscst')) then
    if (qryProdutosNotaFiscal.FieldByName('piscst').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valorpisdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('incidencia')) then
    if (qryProdutosNotaFiscal.FieldByName('incidencia').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valoricmsdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('csosn')) then
    if (qryProdutosNotaFiscal.FieldByName('csosn').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valoricmsdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('csosn_nf')) then
    if (qryProdutosNotaFiscal.FieldByName('csosn_nf').Value <> Null) then
    begin
//      qryProdutosNotaFiscal.FieldByName('valoricmsdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('cst_nf')) then
    if (qryProdutosNotaFiscal.FieldByName('cst_nf').Value <> Null) then
    begin
//      qryProdutosNotaFiscal.FieldByName('valoricmsdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('cofinsbasecalculo')) then
    if (qryProdutosNotaFiscal.FieldByName('cofinsbasecalculo').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valorcofinsdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('cofinsaliquota')) then
    if (qryProdutosNotaFiscal.FieldByName('cofinsaliquota').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valorcofinsdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('cofinsvalor')) then
    if (qryProdutosNotaFiscal.FieldByName('cofinsvalor').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valorcofinsdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('desconto')) then
    if (qryProdutosNotaFiscal.FieldByName('desconto').Value <> Null) then
    begin
//      qryNotaFiscalnumeroregistrodescontoalterado.AsInteger := qryProdutosNotaFiscalnumero.AsInteger;
      qryProdutosNotaFiscaldescontodigitado.asboolean := true;

      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('frete')) then
    if (qryProdutosNotaFiscal.FieldByName('frete').Value <> Null) then
    begin
//      qryNotaFiscalnumeroregistrofretealterado.AsInteger := qryProdutosNotaFiscalnumero.AsInteger;
      qryProdutosNotaFiscalfretedigitado.asboolean := true;

      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('valordescontoitem')) then
    if (qryProdutosNotaFiscal.FieldByName('valordescontoitem').Value <> Null) then
    begin
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;

  if (field = qryProdutosNotaFiscal.FieldByName('cofinscst')) then
    if (qryProdutosNotaFiscal.FieldByName('cofinscst').Value <> Null) then
    begin
      qryProdutosNotaFiscal.FieldByName('valorcofinsdigitado').AsBoolean := true;
      dsrProdutosNotaFiscal.OnDataChange := nil;
      CalcularImpostos(true {,true});
      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    end;


  if (Field = qryProdutosNotaFiscalcodigofiscal) and
     (FCodigoFiscalProdutoOriginal <> 0) then
  begin
    if (qryProcuraNaturezasProduto.recordcount = 1) then
    begin

      dsrProdutosNotaFiscal.OnDataChange := nil;
      AtribuirDadosCalculosImpostos(qryNotaFiscal, qryProcuraProdutoNotaFiscal, qryProcuraNaturezasProduto, qryProdutosNotaFiscal, NotaEntrada, true);

      if not VisualizandoProdutosdaNFE and
         not fAtualizarCodigoFiscalProdutosNFE and
         (IncluidoViaXml OR IncluindoViaXml) then
      begin
        DesligarEventosProdutosNotasPagNFEItems;
        qryProdutosNotasPagNFEItems.Edit;
        qryProdutosNotaFiscalmsgfatorsubstituicao_custo.asboolean := false;
        qryProdutosNotasPagNFEItemscodigofiscal.AsInteger := qryProdutosNotaFiscalcodigofiscal.AsInteger;
        qryProdutosNotasPagNFEItemsnatureza.AsInteger := qryProdutosNotaFiscalnatureza.AsInteger;
        qryProdutosNotasPagNFEItemsdescricaonatureza.AsString := qryProcuraNaturezasProdutodescricao.AsString;
        qryProdutosNotasPagNFEItemsdescricaocodigofiscal.AsString := qryProcuraNaturezasProdutodescricaocfop.AsString;
        qryProdutosNotasPagNFEItemsgerarpagamento.AsBoolean := qryProdutosNotaFiscalgerarpagamento.AsBoolean;
        qryProdutosNotasPagNFEItemstipomovimento.AsString   := qryProdutosNotaFiscaltipomovimento.AsString;
        qryProdutosNotasPagNFEItemsoperacao.AsString        := qryProdutosNotaFiscaloperacao.AsString;
        qryProdutosNotasPagNFEItemsnaogerarcreditoicms.AsBoolean := qryProdutosNotaFiscalnaogerarcreditoicms.AsBoolean;
        qryProdutosNotasPagNFEItemsnaogerarcreditoipi.AsBoolean :=  qryProdutosNotaFiscalnaogerarcreditoipi.AsBoolean;
        qryProdutosNotasPagNFEItemsicmssobreipi.AsBoolean := qryProdutosNotaFiscalicmssobreipi.AsBoolean;
        qryProdutosNotasPagNFEItemsicmssobredespesasacessorias.AsBoolean := qryProdutosNotaFiscalicmssobredespesasacessorias.AsBoolean;

        qryProdutosNotasPagNFEItemsnaocalcularipisobrefrete.AsBoolean :=  qryProdutosNotaFiscalnaocalcularipisobrefrete.AsBoolean;
        qryProdutosNotasPagNFEItemsincidencia.AsString := qryProdutosNotaFiscalincidencia.AsString;
        qryProdutosNotasPagNFEItemscsosn.AsString :=  qryProdutosNotaFiscalcsosn.AsString;
        qryProdutosNotasPagNFEItemsipicst.AsString    := qryProdutosNotaFiscalipicst.AsString;
        qryProdutosNotasPagNFEItemspiscst.AsString    := qryProdutosNotaFiscalpiscst.AsString;
        qryProdutosNotasPagNFEItemscofinscst.AsString    :=  qryProdutosNotaFiscalcofinscst.AsString;
        qryProdutosNotasPagNFEItems.post;
        LigarEventosProdutosNotasPagNFEItems;
      end;

      CalcularImpostos(true {,true});

      dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;

    end;
  end;

  if (Field = qryProdutosNotaFiscalpedido) or
     (Field = qryProdutosNotaFiscalnumeroprodutotabela) then
  begin
    if not qryProdutosNotaFiscalpedido.isnull { and
       not qryProdutosNotaFiscalnumeroprodutotabela.isnull} then
    begin
      if qryNotaFiscalsituacao.AsString = 'N' then
        qryProdutosNotaFiscalpedido_com_nf_normal.asBoolean := true;
    end
    else
    if qryProdutosNotaFiscalpedido.isnull and
       qryProdutosNotaFiscalnumeroprodutotabela.isnull then
      qryProdutosNotaFiscalpedido_com_nf_normal.asBoolean := false; 
  end;

end;

procedure TdtmCadastroNotasFiscais.GravarCamposCopiaProdutos(Origem, Destino: TTecQuery);
var
 i : integer;
begin
   CopiarRegistros(Origem, Destino, false);

   {
   for i:=0 to Origem.FieldCount do
   begin
     if Origem.fields[i].FieldName = 'custototal' then
       break;
     Destino.Fields[i].AsString := Origem.Fields[i].AsString;
   end
   }
end;

{
function TdtmCadastroNotasFiscais.GetPermitirAlterar: Boolean;
begin
  result := qryProdutosNotaFiscalpermitiratualizar.AsBoolean;
end;


procedure TdtmCadastroNotasFiscais.SetPermitirAlterar(
  const Value: Boolean);
begin
  if not (qryProdutosNotaFiscal.State in [dsinsert, dsedit]) then
   qryProdutosNotaFiscal.Edit;
  if qryProdutosNotaFiscal.Name = 'qryProdutosNotaFiscal' then
  begin
    qryProdutosNotaFiscal.FieldByName('permitiratualizar').AsBoolean := value;
    qryProdutosNotaFiscal.FieldByName('permitiratualizardigitado').AsBoolean := value;
  end
  else
   qryProdutosNotaFiscal.FieldByName('permitiratualizar').AsBoolean := value;
end;
}

function TdtmCadastroNotasFiscais.GetSomenteLeituraDuplicata: Boolean;
begin
  FSomenteLeituraDuplicata := not qryDuplicatas.RequestLive;
//  FSomenteLeituraDuplicata := false; //not qryDuplicatas.RequestLive; {Habilitar ou desabilitar...16/07/2021 segundo Jr deve-se alterar no cadastro de duplicatas...requisito BUG #5528 (cadastrado em 22/06/2021 às 10:04):}
  result := FSomenteLeituraDuplicata;
end;

{
function TdtmCadastroNotasFiscais.GetSomenteLeituraImpostos: Boolean;
begin
  FSomenteLeituraImpostos := not dtmGerarNotaFiscal.qryCalculosNotasPag.RequestLive;
  result := FSomenteLeituraImpostos;
end;
}

function TdtmCadastroNotasFiscais.GetSomenteLeituraProdutos: Boolean;
begin
//  FSomenteLeituraProdutos := not qryProdutosNotaFiscal.RequestLive;
  FSomenteLeituraProdutos := false; // not qryProdutosNotaFiscal.RequestLive;
  result := FSomenteLeituraProdutos;
end;

function TdtmCadastroNotasFiscais.GetSomenteLeituraContabilidade: Boolean;
begin
  FSomenteLeituraContabilidade := not UsuarioLogin.AlterarDadosContabeis or
                                (qryNotaFiscaldata.AsDateTime <= ParSistema.DataContabil) or
                                notacancelada;
  result := FSomenteLeituraContabilidade;
end;

function TdtmCadastroNotasFiscais.GetCReDBigualValorNota: Boolean;
begin
  result := qryProcuraNaturezascredbigualvalornota.AsBoolean;
end;

function TdtmCadastroNotasFiscais.GetGravarSemLanctos: Boolean;
begin
  result := qryProcuraNaturezasgravarsemlanctos.AsBoolean;
end;

function TdtmCadastroNotasFiscais.GetCodFiscalNatureza : Integer;
begin
  Result:= qryProcuraNaturezascodigofiscal.AsInteger;
end;

function TdtmCadastroNotasFiscais.ExisteContaCreditoNatureza : Boolean;
begin
  RefazConsultaPorNome(qryContaCreditoFornecedor,['CodigoFiscal'],[qryProcuraNaturezascodigofiscal.AsVariant]);
  if qryContaCreditoFornecedorcontacontabil.AsInteger > 0 then
    Result:= True
  else
    Result:= False;
end;

function TdtmCadastroNotasFiscais.GetDocumentoPag: integer;
begin
  result := qryNotaFiscaldocumentopag.AsInteger;
end;

procedure TdtmCadastroNotasFiscais.AtualizarTabelaIPI;
begin
  if EntradaporPedido then  {não for devolução}
  begin
    if qryProdutosNotaFiscal.Active then
    begin
      try

        DesabilitarControles(true);
        GuardarRegistroAtual(qryProdutosNotaFiscal,true);
        qryProdutosNotaFiscal.First;
        while not qryProdutosNotaFiscal.Eof do
        begin

          if qryProdutosNotaFiscalaliquotaipi.AsCurrency <>
             qryProdutosNotaFiscalaliquotaipioriginal.AsCurrency then
          begin
            qryAtualizarTabelaIPI.Params[0].AsCurrency := qryProdutosNotaFiscalaliquotaipi.AsCurrency;
            qryAtualizarTabelaIPI.Params[1].AsCurrency := qryProdutosNotaFiscalipi.Asinteger;
            qryAtualizarTabelaIPI.ExecSql;
          end;

          if parsistema.AtualizarNCMNotaEntrada then
            if qryProdutosNotaFiscalipi.AsInteger <>
               qryProdutosNotaFiscalipiOriginal.AsInteger then
            begin
              qryAtualizarTabelaCaracteristicas.ParamByName('ipi').AsInteger := qryProdutosNotaFiscalipi.AsInteger;
              qryAtualizarTabelaCaracteristicas.ParamByName('codigo').AsString := qryProdutosNotaFiscalcaracteristica.AsString;
              qryAtualizarTabelaCaracteristicas.ExecSql;
            end;

          qryProdutosNotaFiscal.Next;
        end;
        Perpetrar([qryAtualizarTabelaIPI, qryAtualizarTabelaCaracteristicas]);
      finally
        VoltarRegistroAtual(qryProdutosNotaFiscal);
        DesabilitarControles(false);
      end;
    end;
  end;
end;


function TdtmCadastroNotasFiscais.GetListaContasContabeis: String;
begin
  if FListaContasContabeis <> '' then
    Result := FListaContasContabeis
  else Result := '0';
end;

procedure TdtmCadastroNotasFiscais.AtribuirContaCreditoDocumentoPag(
  Conta,Historico: Integer;
  excluir: Boolean);
begin
  if gerardocumentopag then
  begin
    if qrydocumentopag.IsEmpty then
      qrydocumentopag.Append;
    if not (qryDocumentoPag.state in [dsedit,dsinsert]) then
      qryDocumentoPag.Edit;
    if excluir then
    begin
      qrydocumentopagcreditar.Clear;
      qryDocumentoPaghistorico.Clear;
    end
    else
    begin
      qryDocumentopagcreditar.AsInteger := Conta;
      if Historico<>0 then
        qryDocumentoPaghistorico.AsInteger := Historico
      else
        qryDocumentoPaghistorico.clear;
    end;

    if qryDocumentoPag.State = dsedit then
    begin
      if qryDocumentoPagcreditar.OldValue <> null then
        if qryDocumentoPagcreditar.OldValue <>
           qryDocumentoPagcreditar.AsInteger then
          FContrapartidaAlterada := true;
    end;
  end;
end;

function TdtmCadastroNotasFiscais.getdescricaohistorico: String;
begin
  fdescricaohistorico := 'NF '+qryNotaFiscalnrdocumento.asstring +
                         ' - '+trim(qryProcuraFornecedoresnome.AsString);
  Result := fdescricaohistorico;
end;

destructor TdtmCadastroNotasFiscais.Destroy;
begin
  if assigned(v_PosicaoProdutosNotasPagNFE[1]) then
  begin
    freeandnil(v_PosicaoProdutosNotasPagNFE[1]);
    freeandnil(v_PosicaoProdutosNotasPagNFE[2]);
  end;

  inherited;

//  if assigned(dtmCalcularCusto) then
//    dtmCalcularCusto.free;

  if assigned(dtmlancamentocontabilidade) then
    dtmLancamentoContabilidade := nil;
end;

procedure TdtmCadastroNotasFiscais.GravarLancamentosContabeis;
begin
   if parsistema.GerarContabilidade then
   begin
     FProximoNrLancto := 0;
     dtmLancamentoContabilidade.qrylancamentosNotasEntradas.First;
     while not dtmLancamentoContabilidade.qrylancamentosNotasEntradas.Eof do
     begin
       dtmLancamentoContabilidade.qrylancamentosNotasEntradas.Edit;
       if (dtmLancamentoContabilidade.qryLancamentosNotasEntradasnumerocriado.AsBoolean) then
         dtmLancamentoContabilidade.qrylancamentosNotasEntradasnrlancto.AsInteger := ProximoNrLancto;

       dtmLancamentoContabilidade.qrylancamentosNotasEntradasdata.AsDateTime         := qryNotaFiscaldata.AsDateTime;
       dtmLancamentoContabilidade.qryLancamentosNotasEntradasexercicio.Asinteger     := yearof(qryNotaFiscaldata.AsDateTime);
       dtmLancamentoContabilidade.qrylancamentosNotasEntradasnrorigem.AsString       := qryNotaFiscalcodigo.AsString;
       dtmLancamentoContabilidade.qryLancamentosNotasEntradasfilial.Asinteger        := qryNotaFiscalfilial.Asinteger;
       if pos('NF  - ',dtmLancamentoContabilidade.qryLancamentosNotasEntradascomplemento.AsString)<>0 then
            dtmLancamentoContabilidade.qryLancamentosNotasEntradascomplemento.AsString := Trocar(
              dtmLancamentoContabilidade.qryLancamentosNotasEntradascomplemento.AsString,
              'NF  - ',
              'NF '+qryNotaFiscalnrdocumento.AsString+' - ');

       dtmLancamentoContabilidade.qrylancamentosNotasEntradas.Next;
     end;
   end;
end;

function TdtmCadastroNotasFiscais.GetDuplicatasQuitadas: Boolean;
var
  Pos: TBookmark;
begin
  fDuplicatasQuitadas := False;
  Pos:= qryDuplicatas.GetBookmark;
  qryDuplicatas.DisableControls;
  try
    qryDuplicatas.First;
    while not fDuplicatasQuitadas and not qryDuplicatas.Eof do
    begin
      fDuplicatasQuitadas := (qryDuplicatasvalorpagto.AsCurrency <> 0);
      qryDuplicatas.Next;
    end;
  finally
    qryDuplicatas.GotoBookmark(Pos);
    qryDuplicatas.FreeBookmark(Pos);
    qryDuplicatas.EnableControls;
    result := fDuplicatasQuitadas;
  end;
end;

procedure TdtmCadastroNotasFiscais.SelecionarNatureza(CodigoNatureza: integer);
begin
  qryProcuraNaturezas.BeforeOpen := nil;
  EditarNotaFiscal;
  qryProcuraNaturezas.MacroByName('CodigoNaturezaPadrao').AsString := ' and (naturezas.codigo = ' + IntToStr(CodigoNatureza) + ') ';
  qryProcuraNaturezas.Params[1].AsInteger := CodigoFiscalAnterior;
  qryProcuraNaturezas.Close;
  qryProcuraNaturezas.Open;
  qryNotaFiscalcodigofiscal.AsInteger := CodigoFiscalAnterior;
  CodigoFiscalAnterior := 0;
  qryProcuraNaturezas.BeforeOpen := qryProcuraNaturezasBeforeOpen;
end;


procedure TdtmCadastroNotasFiscais.qryDocumentosPagImpostosRetidosBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  qryDuplicatasImpostosRetidos.First;
  while not qryDuplicatasImpostosRetidos.Eof do
    if qryDuplicatasImpostosRetidos.FieldByName('documentopag').AsInteger =
       qryDocumentosPagImpostosRetidosnumero.AsInteger then
      qryDuplicatasImpostosRetidos.Delete
    else
      qryDuplicatasImpostosRetidos.Next;
end;

procedure TdtmCadastroNotasFiscais.qryDuplicatasImpostosRetidosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  ExisteQuitacaoImpostosRetidosDuplicatas := false;
  ExisteQuitacaoImpostosRetidosNotas := false;
  qryDuplicatasImpostosRetidos.First;
  while not qryDuplicatasImpostosRetidos.Eof do
  begin
    if not qryDuplicatasImpostosRetidos.FieldByName('datapagto').IsNull then
    begin
      if qryDocumentosPagImpostosRetidos.Locate('numero', qryDuplicatasImpostosRetidos.FieldByName('documentopag').AsInteger,[]) then
        if qryDocumentosPagImpostosRetidosnumeroorigem.IsNull then
          ExisteQuitacaoImpostosRetidosNotas := true
        else
          ExisteQuitacaoImpostosRetidosDuplicatas := true;

      if ExisteQuitacaoImpostosRetidosNotas and
         ExisteQuitacaoImpostosRetidosDuplicatas then
        break
      else
        qryDuplicatasImpostosRetidos.Next;
    end
    else
      qryDuplicatasImpostosRetidos.Next;
  end;
end;

procedure TdtmCadastroNotasFiscais.qryDocumentoPagCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryDocumentoPagValorLiquido.AsCurrency:= qryDocumentoPagvalor.       AsCurrency -
                                           qryDocumentoPagIRRetido.    AsCurrency -
                                             qryDocumentoPagINSSRetido.  AsCurrency -
                                            qryDocumentoPagISSRetido.   AsCurrency -
                                            qryDocumentoPagPISRetido.   AsCurrency -
                                            qryDocumentoPagCOFINSRetido.AsCurrency -
                                            qryDocumentoPagCSLLRetido.  AsCurrency;
end;

procedure TdtmCadastroNotasFiscais.LimparRetencoes;
begin
//  if not (qrynotafiscal.State in [dsedit,dsinsert]) then
//    qrynotafiscal.Edit;
  qryNotaFiscalirretido.clear;
  qryNotaFiscalinssretido.clear;
  qryNotaFiscalissretido.clear;
  qryNotaFiscalpisretido.clear;
  qryNotaFiscalpiscofinscsllretido.clear;
  qryNotaFiscalcofinsretido.clear;
  qryNotaFiscalcsllretido.clear;
end;

procedure TdtmCadastroNotasFiscais.qryVenctosImpostosRetidosEntradasAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  if ParSistema.GeracaoAutomaticadoImpostoRetido then
    if Assigned(FVenctosImpostosRetidosEntradasAfterOpen) then
      FVenctosImpostosRetidosEntradasAfterOpen(qryVenctosImpostosRetidosEntradas);
end;

procedure TdtmCadastroNotasFiscais.qryDuplicatasBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  qryDocumentosPagImpostosRetidos.First;
  while not qryDocumentosPagImpostosRetidos.Eof do
    if (qryDocumentosPagImpostosRetidosdocumentopagorigem.AsInteger =
        qryDuplicatasdocumentopag.AsInteger) and
       (qryDocumentosPagImpostosRetidosdatavenctoorigem.AsDateTime =
        qryDuplicatasdatavenctooriginal.AsDateTime) and
       (qryDocumentosPagImpostosRetidosnumeroorigem.AsInteger =
        qryDuplicatasnumero.AsInteger) then
      qryDocumentosPagImpostosRetidos.Delete
    else
      qryDocumentosPagImpostosRetidos.next;
end;

procedure TdtmCadastroNotasFiscais.qryDocumentosPagImpostosRetidosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if qryDuplicatasImpostosRetidos.Active then
    qryDuplicatasImpostosRetidos.Locate('documentopag', qryDocumentosPagImpostosRetidosnumero.AsInteger, [])
end;

function TdtmCadastroNotasFiscais.GravarNotaParcial(ForcarGravacao: Boolean): Boolean;
var
  ErroDuplicata: TtecErroDuplicatas;
  DocumentopagExcluido : Boolean;

{  vTestep, vTestepn, vTestepni : Boolean; }

  procedure PreencherChavePrimaria;
  var
    PosProdutoNfe,PosProduto: TBookmark;
  begin
                            {
    if qryNotaFiscalcodigo.isnull then
    begin
      ReFazConsulta(spcNotaFiscal, [], []);
      qryNotaFiscalcodigo.AsInteger := spcNotaFiscalproximocodigo.AsInteger;
    end;

    }
    if not SomenteLeituraProdutos then
    begin

    (*
      if qryProdutosNotaFiscal.Active then
      begin

        DesabilitarControles(true);
        PosProduto := qryProdutosNotaFiscal.GetBookmark;
        qryProdutosNotaFiscal.DisableControls;
        try

          qryProdutosNotaFiscal.First;
          while Not qryProdutosNotaFiscal.Eof do
          begin
            if qryProdutosNotaFiscalcodigonota.AsInteger <> qryNotaFiscalcodigo.AsInteger then
            begin
              qryProdutosNotaFiscal.Edit;
              qryProdutosNotaFiscalcodigonota.AsInteger := qryNotaFiscalcodigo.AsInteger;
              PostProdutosNotaFiscal;
            end;

            {

            ==================================================================
            NOTA: Gedovar
            ==================================================================
            Acredito este ser o problema do zeramento dos campos de sequencia
            ocorrendo a duplicação quando importado via xml.

            Não vejo a necessidade de zerar os campos abaixo visto que
            são atribuidos quando for somenete importação via xml


            if not (IncluidoViaXml or IncluindoViaXml) and
               (not qryProdutosNotaFiscalnumerosequencianfe.isnull or
                not qryProdutosNotaFiscalnumerosequencianfeitens.isnull) then
            begin
              qryProdutosNotaFiscal.Edit;
              qryProdutosNotaFiscalnumerosequencianfe.clear;
              qryProdutosNotaFiscalnumerosequencianfeitens.clear;
              PostProdutosNotaFiscal;
            end;

            }

            qryProdutosNotaFiscal.Next
          end;
        finally
          qryProdutosNotaFiscal.GotoBookmark(PosProduto);
          qryProdutosNotaFiscal.FreeBookmark(PosProduto);
          qryProdutosNotaFiscal.EnableControls;
          DesabilitarControles(false);
        end;
      end;
      *)

      if IncluidoViaXml or IncluindoViaXml then
      begin
        (*
        if qryProdutosNotasPagNFE.active then
        begin

          DesligarEventosProdutosNotasPagNFEItems;
          PosProdutoNfe := qryProdutosNotasPagNFE.GetBookmark;
          PosProduto := qryProdutosNotaFiscal.GetBookmark;

          try
            qryProdutosNotasPagNFE.first;
            while not qryProdutosNotasPagNFE.eof do
            begin

              if qryProdutosNotasPagNFEcodigonota.AsInteger <> qrynotafiscalcodigo.AsInteger then
              begin
                qryProdutosNotasPagNFE.edit;
                qryProdutosNotasPagNFEcodigonota.AsInteger := qryNotaFiscalcodigo.AsInteger;
                qryProdutosNotasPagNFE.Post;
              end;

              qryProdutosNotasPagNFEItems.first;
              while not qryProdutosNotasPagNFEItems.eof do
              begin

                qryProdutosNotasPagNFEItemsSituacao.first;
                while not qryProdutosNotasPagNFEItemsSituacao.eof do
                begin
                  if qryProdutosNotasPagNFEItemsSituacaocodigonota.AsInteger <> qrynotafiscalcodigo.AsInteger then
                  begin
                    qryProdutosNotasPagNFEItemsSituacao.edit;
                    qryProdutosNotasPagNFEItemsSituacaocodigonota.AsInteger := qryNotaFiscalcodigo.AsInteger;
                    qryProdutosNotasPagNFEItemsSituacao.Post;
                  end;
                  qryProdutosNotasPagNFEItemsSituacao.Next;
                end;

                if qryProdutosNotasPagNFEItemscodigonota.AsInteger <> qrynotafiscalcodigo.AsInteger then
                begin
                  qryProdutosNotasPagNFEItems.edit;
                  qryProdutosNotasPagNFEItemscodigonota.AsInteger := qryNotaFiscalcodigo.AsInteger;
                  qryProdutosNotasPagNFEItems.Post;
                end;

                qryProdutosNotasPagNFEItems.Next;
              end;
              qryProdutosNotasPagNFE.Next;
            end;
          finally
            qryProdutosNotasPagNFE.GotoBookmark(PosProdutoNfe);
            qryProdutosNotasPagNFE.FreeBookmark(PosProdutoNfe);

            qryProdutosNotaFiscal.GotoBookmark(PosProduto);
            qryProdutosNotaFiscal.FreeBookmark(PosProduto);

            LigarEventosProdutosNotasPagNFEItems;
          end;
        end;
        *)

      end
      else
      begin
        ReFazConsulta(qryProdutosNotasPagNFE, [0], [0]);
        ReFazConsulta(qryProdutosNotasPagNFEItems, [0], [0]);
        ReFazConsulta(qryProdutosNotasPagNFEItemsSituacao, [0], [0]);
      end;


    end;

    (*
    if (qryVolumesNotasPagvolumes.AsInteger > 0) or
       (qryVolumesNotasPagnumeracao.AsString <> '') or
       (qryVolumesNotasPagmarca.AsString <> '') or
       (qryVolumesNotasPagpesobruto.AsCurrency > 0) or
       (qryVolumesNotasPagpesoliquido.AsCurrency > 0) then
    begin
      qryVolumesNotasPag.First;
      while not qryVolumesNotasPag.Eof do
      begin
        qryVolumesNotasPag.Edit;
        qryVolumesNotasPagnotapag.AsInteger := qryNotaFiscalcodigo.AsInteger;
        qryVolumesNotasPagcodigo.AsInteger  := qryVolumesNotasPag.RecNo;
        qryVolumesNotasPag.Post;
        qryVolumesNotasPag.Next;
      end;
    end;
    *)

    if IncluindoViaXml or IncluidoViaXml then
    begin
      (*
      qryPedidosNotasPag.AfterPost := Nil;
      AtribuirChave(qryPedidosNotasPag,[qryPedidosNotasPagcodigonota], [qryNotaFiscalcodigo]);
      qryPedidosNotasPag.AfterPost := qryPedidosNotasPagAfterPost;
      *)
    end
    else
      RefazConsultaPorNome(qryPedidosNotasPag, ['codigonota'],[0]);
  end;

begin
  result := false;
  if parsistema.PermitirGravacaoNFEParcial or ForcarGravacao then
  begin
    if (qryNotaFiscalsituacao.AsString = 'P') or ForcarGravacao then
    begin
      Result := VerificarBloqueiodaTabela;

      if result then
      begin
        EditarNotaFiscal;
        if qryNotaFiscalvalornota.IsNull then
          qryNotaFiscalvalornota.AsCurrency := 0;

         (*
        // bug?? solução abaixo porque o componente apos excluir atribuir o valor depois
        if (IncluidoViaXml or IncluindoViaXml) and (qrynotafiscal.state = dsinsert) then
        begin
          if qrynotafiscalfornecedor.isnull then
            qrynotafiscalfornecedor.required := false;

          if qrynotafiscaltipofornecedor.isnull then
            qrynotafiscaltipofornecedor.required := false;

          if qryNotaFiscalserie.isnull then
            qryNotaFiscalserie.Required := false;

          if qryNotaFiscalnrdocumento.isnull then
            qryNotaFiscalnrdocumento.Required := false;
        end;
        *)

        if EntradaViaXML then
        begin
          if TipoLeituraXML = XMLNfe then
          begin

            if qrynotafiscalfornecedor.isnull then
              qrynotafiscalfornecedor.asinteger := vcodigo;

            if qrynotafiscaltipofornecedor.isnull then
              qrynotafiscaltipofornecedor.asstring := vtipo;

            if qryNotaFiscalserie.isnull then
              qryNotaFiscalserie.asstring := vserie;

            if qryNotaFiscalnrdocumento.isnull then
              qryNotaFiscalnrdocumento.asinteger := ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF;
          end
          else
          if TipoLeituraXML = XMLCTe then
          begin

            if qrynotafiscalfornecedor.isnull then
              qrynotafiscalfornecedor.asinteger := vcodigo;

            if qrynotafiscaltipofornecedor.isnull then
              qrynotafiscaltipofornecedor.asstring := vtipo;

            if qryNotaFiscalserie.isnull then
              qryNotaFiscalserie.asstring := vserie;

            if qryNotaFiscalnrdocumento.isnull then
              qryNotaFiscalnrdocumento.asinteger := ACBrCTe1.Conhecimentos.Items[0].CTe.Ide.nCT;

          end;
        end;


        if qryNotaFiscal.CheckRequiredFields then
        begin
          qryProdutosNotaFiscal.AfterScroll := nil;
          PreencherChavePrimaria;
          if qryProdutosNotaFiscal.IsEmpty then
             Result := True
          else
            Result := IncluirProdutosNaoCadastrados;

          if Result then
          begin
            VerificarProdutosFornecedoresUnidades;
            if FImportacao then
            begin
              if qryDadosImportacoesnumero.AsString <> '' then
                qryNotaFiscalndi.AsString := qryDadosImportacoesnumero.AsString
              else
                qryNotaFiscalndi.clear;
            end;


            qryNotaFiscal.Post;
            qryProdutosNotaFiscal.GuardarRegistroAtual(false);
            qryProdutosNotasPagNFE.GuardarRegistroAtual(false);
            qryProdutosNotasPagNFEItems.GuardarRegistroAtual(false);

            {
            vTestep := qryProdutosNotaFiscal.controlsdisabled;
            vTestepn := qryProdutosNotasPagNFE.controlsdisabled;
            vTestepni := qryProdutosNotasPagNFEItems.controlsdisabled;

            qryProdutosNotaFiscal.first;
            qryProdutosNotasPagNFE.first;
            }


            result := Perpetrar([qryDadosImportacoes, qryAdicoesImportacao, qryprodutosimportados,
                                 qryNotaFiscal,
                                 qryProdutosNotasPagNFE, qryProdutosNotasPagNFELotes, qryProdutosNotasPagNFEItems, qryProdutosNotasPagNFEItemsSituacao, qryPedidosNotasPag,
                                 qryProdutosNotaFiscal,
                                 qryVolumesNotasPag, qryProdutosFornecedoresUnidades_, qrynotaspagchv]);

            {
            vTestep := qryProdutosNotaFiscal.controlsdisabled;
            vTestepn := qryProdutosNotasPagNFE.controlsdisabled;
            vTestepni := qryProdutosNotasPagNFEItems.controlsdisabled;
            }


            qryProdutosNotaFiscal.VoltarRegistro;
            qryProdutosNotasPagNFE.VoltarRegistro;
            qryProdutosNotasPagNFEItems.VoltarRegistro;

            if result and IncluindoViaXml  and (qryNotaFiscal.recordcount <> 0) then
            begin
              qrynfe.close;
              qrynfe.ParamByName('codigo').AsInteger := qryNotaFiscalcodigo.AsInteger;
              qrynfe.Open;
              qrynfe.edit;
              qrynfexmlnfe.LoadFromFile(ArquivoXMLNFe);
              qrynfe.Post;

              perpetrar([qrynfe]);
              IncluindoViaXml := false;
            end;

            if qryProdutosNotasPagNFE.active then
              PosicionarProdutosNFEPorProdutosNotaFiscal;

          end;
          qryprodutosnotafiscal.AfterScroll := qryProdutosNotaFiscalAfterScroll;
        end;
      end;
    end;
  end;
end;

function TdtmCadastroNotasFiscais.GetProximoNrLancto: integer;
begin
  if FProximoNrLancto=0 then
  begin
    spcLancamentosProximo.ParamByName('Exercicio').AsInteger:= yearof(qryNotaFiscaldata.asdatetime);
    spcLancamentosProximo.ParamByName('Filial').AsInteger:= qryNotaFiscalfilial.AsInteger;
    spcLancamentosProximo.Open;
    FProximoNrLancto := spcLancamentosProximocodigo.AsInteger;
    spcLancamentosProximo.Close;
  end
  else
   FProximoNrLancto := FProximoNrLancto + 1;
  Result := FProximoNrLancto;
end;

procedure TdtmCadastroNotasFiscais.SetProximoNrLancto(
  const Value: integer);
begin
  FProximoNrLancto := value;
end;

function TdtmCadastroNotasFiscais.GetValorMarkup: Currency;
begin
  if (qryProdutosNotaFiscal.FieldByName('markup_produto_1').ascurrency > 0) then
    fValorMarkup := qryProdutosNotaFiscal.FieldByName('markup_produto_1').AsCurrency
  else if (qryProdutosNotaFiscal.FieldByName('markup_grupo_1').ascurrency > 0) then
    fValorMarkup := qryProdutosNotaFiscal.FieldByName('markup_grupo_1').AsCurrency
  else if (qryProcuraFornecedoresmarkup.ascurrency > 0) then
    fValorMarkup := qryProcuraFornecedoresmarkup.AsCurrency
  else
    fValorMarkup := 0;
  result := fValorMarkup;
end;

procedure TdtmCadastroNotasFiscais.EditarNotaFiscal;
begin
  if (qrynotafiscal.RecordCount = 1) or
     (qrynotafiscal.State = dsinsert) then
    if not (qryNotaFiscal.State in [dsinsert, dsedit]) then
      qrynotafiscal.Edit;
end;


procedure TdtmCadastroNotasFiscais.EditarProdutosNotasPag;
begin
  if (qrynotafiscal.RecordCount = 1) or
     (qrynotafiscal.State = dsinsert) then
    if not (qryNotaFiscal.State in [dsinsert, dsedit]) then
      qrynotafiscal.Edit;
end;

procedure TdtmCadastroNotasFiscais.EliminarCalculosIncluidos;
begin
{
  qryProdutosNotaFiscal.first;
  while not qryProdutosNotaFiscal.eof do
    if not qryProdutosNotaFiscalconfirmada.AsBoolean then
      qryProdutosNotaFiscal.Delete
    else
      qryProdutosNotaFiscal.Next;
}      
      
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotaFiscalAfterCancel(
  DataSet: TDataSet);
begin
  inherited;
  if ProdutoAlterado then
  begin
    ProdutoAlterado := false;
  end;

end;

procedure TdtmCadastroNotasFiscais.qryDuplicatasCalcFields(
  DataSet: TDataSet);
begin
  inherited;
   if not qryDuplicatasJaQuitada.AsBoolean
   then qryDuplicatasvalorapagar.AsCurrency:= ValorPagar
   else qryDuplicatasvalorapagar.AsString  := '';

end;

procedure TdtmCadastroNotasFiscais.CalcularValorTotalItemProduto(TiposValor: TTecTiposValores);
begin
  qryProdutosNotaFiscal.Edit;
  case TiposValor of
    icms  : begin
             qryProdutosNotaFiscal.FieldByName('icmsoutrasDigitado').AsBoolean := false;
             qryProdutosNotaFiscal.FieldByName('valoricmsDigitado').AsBoolean := false;
             qryProdutosNotaFiscal.FieldByName('valoricmsstDigitado').AsBoolean := false;

            end;
//    icmsst: qryProdutosNotaFiscal.FieldByName('valoricmsstDigitado').AsBoolean := false;
    ipi   : qryProdutosNotaFiscal.FieldByName('valoripiDigitado').AsBoolean := false;
    pis   : qryProdutosNotaFiscal.FieldByName('valorpisDigitado').AsBoolean := false;
    cofins: qryProdutosNotaFiscal.FieldByName('valorcofinsDigitado').AsBoolean := false;
  end;
//  PostProdutosNotaFiscal;
  CalcularImpostos;
end;

function TdtmCadastroNotasFiscais.CalcularCusto: Boolean;
begin

   dtmCalcularCusto.DesabilitarControles_ := DesabilitarControles;

   result := dtmCalcularCusto.CalcularCusto_(qryProdutosNotaFiscal, qryNotaFiscal, FExisteAlteracaoCusto,
                  fImportacao, ValorRatear, ValorRatearICMS, NotaEntrada);
end;

function  TdtmCadastroNotasFiscais.IcmsSubstDestacado : Boolean;
begin
  Result:= False;
  if not (qryNotaFiscalvaloricmssubstituicao.IsNull) then
    Result:= True;
end;


function TdtmCadastroNotasFiscais.CalcularPrecoVenda: Boolean;
begin

   dtmCalcularCusto.DesabilitarControles_ := DesabilitarControles;

   result := dtmCalcularCusto.CalcularPrecoVenda_(qryProdutosNotaFiscal, qryNotaFiscal,
                  qryProcuraFornecedores, FExisteAlteracaoCusto, NotaEntrada);


end;

procedure TdtmCadastroNotasFiscais.AtribuirPreco(caracteristica: String;
  preco: integer;
  ValorCusto, precovenda: Currency;
  VerificarMaiorPreco: Boolean;
  CampoValorPreco: TField);
begin
    { Varrer a tabela de produtos da nota para atribuir o maior preço
      para as mesmas caracterisiticas e preços}

   dtmCalcularCusto.DesabilitarControles_ := DesabilitarControles;

   dtmCalcularCusto.AtribuirPreco(qryProdutosNotaFiscal, qryNotaFiscal,
                caracteristica, preco, ValorCusto, precovenda, VerificarMaiorPreco,
                CampoValorPreco)

end;

procedure TdtmCadastroNotasFiscais.SetPermitirAtualizarDigitado(
  const Value: Boolean);
begin
  qryprodutosnotafiscal.Edit;
  qryProdutosNotaFiscalpermitiratualizardigitado.AsBoolean := value;
  PostProdutosNotaFiscal;
  AtribuirPermitirAtualizarDigitado(qryProdutosNotaFiscalcaracteristica.AsString,
                                qryprodutosnotafiscalpreco.AsInteger,
                                qryProdutosNotaFiscalcustoparavenda.AsCurrency,
                                Value);
end;

function TdtmCadastroNotasFiscais.GetPermitirAtualizarDigitado: Boolean;
begin
 result := qryProdutosNotaFiscalpermitiratualizardigitado.AsBoolean;
end;

procedure TdtmCadastroNotasFiscais.AtribuirPermitirAtualizarDigitado(
  caracteristica: String; preco: integer; ValorCusto: Currency; Valor: Boolean);
var
  RegistroAtual: TBookMark;
begin
  if qryProdutosNotaFiscal.Active then
  begin
    try

      RegistroAtual := qryProdutosNotaFiscal.GetBookmark;
      qryprodutosnotafiscal.DisableControls;
      DesabilitarControles(true);

      qryprodutosnotafiscal.First;
      while not qryprodutosnotafiscal.Eof do
      begin
        if (qryProdutosNotaFiscalcaracteristica.AsString = caracteristica) and
           ((qryProdutosNotaFiscalcustoparavenda.AsCurrency = ValorCusto) or
            ((qryProdutosNotaFiscalpreco.AsInteger = preco) and (preco<>0))) then
        begin
          qryprodutosnotafiscal.Edit;
          qryProdutosNotaFiscalpermitiratualizardigitado.AsBoolean := Valor;
        end;
        qryprodutosnotafiscal.Next;
      end;
    finally
      qryprodutosnotafiscal.enableControls;
      qryProdutosNotaFiscal.GotoBookmark(RegistroAtual);
      qryprodutosnotafiscal.FreeBookmark(RegistroAtual);
      DesabilitarControles(false);
    end;
  end;  
end;

function TdtmCadastroNotasFiscais.GetValorRatear: Currency;
begin
  fValorRatear := qryNotaFiscalvalorconhecimentofrete.AsCurrency +
                  {colocado em comentario pq tem que considerar o frete do produto e não da nota, as vezes
                    o frete foi cobrado somente de um item -}
                  {qryNotaFiscalfreteinterno.Ascurrency +}
                  qryNotaFiscaldespesasacessorias.ascurrency +
                  qryNotaFiscalacrescimo.ascurrency +
                  qryNotaFiscalseguro.AsCurrency;

  result := fValorratear;
end;

function TdtmCadastroNotasFiscais.GetValorRatearIPI: Currency;
begin
  if not FImportacao then
    fValorRatearIPI  := qryNotaFiscaldespesasacessorias.ascurrency +
                        qryNotaFiscalacrescimo.ascurrency +
                        qryNotaFiscalfreteinterno.Ascurrency +
                        qryNotaFiscalseguro.AsCurrency
  else
    FValorRatearIPI := 0;

  result := fValorRatearIPI;
end;

function TdtmCadastroNotasFiscais.GetValorRatearICMS: Currency;
begin
  if not FImportacao then
    fValorRatearICMS   := {qryNotaFiscalfreteinterno.Ascurrency +
                          qryNotaFiscalseguro.ascurrency +}
                          qryNotaFiscalicmsconhecimentofrete.AsCurrency
  else
    fValorRatearICMS := 0;


  Result := FValorRatearICMS;
end;

function TdtmCadastroNotasFiscais.IncluirProdutosNaoCadastrados: Boolean;
var
 RegistroAtual: TBookMark;
 CodigodoProduto: String;

 procedure IncluirProduto;
 begin
   RefazConsulta(spcProdutoProximo,[0],[qryProdutosNotaFiscalcaracteristica.AsLargeInt]);
   CodigodoProduto := spcProdutoProximocodigo.AsString;
   spcProdutoProximo.Close;
   if not qryProdutosInclusao.Active then
     ReFazConsulta(qryProdutosInclusao,[0],[0]);
   qryProdutosInclusao.Append;
   qryProdutosInclusaocodigo.AsString := CodigodoProduto;
   qryProdutosInclusaocodigovisual.AsString := CodigodoProduto;
   qryProdutosInclusaocaracteristica.AsString := qryProdutosNotaFiscalcaracteristica.AsString;
   qryProdutosInclusaodescricao.AsString :=  qryProdutosNotaFiscaldescricaoproduto.AsString;
   qryProdutosInclusaovalorgrade1.AsString := qryProdutosNotaFiscalvalorgrade1.AsString;
   qryProdutosInclusaovalorgrade2.AsString := qryProdutosNotaFiscalvalorgrade2.AsString;
   qryProdutosInclusao.Post;
 end;

 procedure IncluirEstoqueFilialBase;
 begin
   if qryEstoques.State = dsInactive then
      ReFazConsulta(qryEstoques,[0],[0]);

   if ParSistema.IncluirEstoqueAutomatico then
   begin
     qryfiliais.Open;
     qryfiliais.First;
     while not qryfiliais.Eof do
     begin
       qryEstoques.Append;
       qryEstoquesproduto.AsString := CodigodoProduto;
       qryEstoquesfilial.AsInteger := qryfiliaiscodigo.AsInteger;
       qryEstoques.Post;
       qryfiliais.Next;
     end;
     qryfiliais.Close;
   end
   else
   begin
     qryEstoques.Append;
     qryEstoquesproduto.AsString         := CodigodoProduto;
     qryEstoquesfilial.AsInteger         := FilialBase;
     qryEstoques.Post;
   end;
 end;

 procedure AtualizarCodigoProduto;
 begin
   qryProdutosNotaFiscal.Edit;
   qryProdutosNotaFiscalproduto.AsString := CodigodoProduto;
   qryProdutosNotaFiscalprodutovisual.AsString := CodigodoProduto;
   PostProdutosNotaFiscal;
 end;


begin
 result := true;
  if qryProdutosNotaFiscal.Active then
  begin

     RegistroAtual := qryProdutosNotaFiscal.GetBookmark;
     try
       qryProdutosNotaFiscalproduto.OnChange := nil;
       qryprodutosnotafiscal.disableControls;
       DesabilitarControles(true);
       qryProdutosNotaFiscal.First;
       while not qryProdutosNotaFiscal.Eof do
       begin
         if qryProdutosNotaFiscalproduto.AsString='' then
         begin
           IncluirProduto;
           IncluirEstoqueFilialBase;
           AtualizarCodigoProduto;
           result := Perpetrar([qryprodutosinclusao, qryestoques], AguardareTerminarDentroDm)
         end;
         qryProdutosNotaFiscal.Next
       end;
     finally
       qryProdutosNotaFiscal.GotoBookmark(RegistroAtual);
       qryProdutosNotaFiscal.FreeBookmark(RegistroAtual);
       qryprodutosnotafiscal.enableControls;
       qryProdutosNotaFiscalproduto.OnChange :=  qryProdutosNotaFiscalprodutoChange;
       DesabilitarControles(false);
     end;
  end;
end;


function TdtmCadastroNotasFiscais.IncluirProdutosNaoCadastradosLC(Caracteristica, DescricaoCaracteristica, ValorGrade1, ValorGrade2: String): Boolean;
var
 RegistroAtual: TBookMark;
 CodigodoProduto: String;

 procedure IncluirProduto;
 begin
   RefazConsulta(spcProdutoProximo,[0],[Caracteristica]);
   CodigodoProduto := spcProdutoProximocodigo.AsString;
   spcProdutoProximo.Close;
   if not qryProdutosInclusao.Active then
     ReFazConsulta(qryProdutosInclusao,[0],[0]);
   qryProdutosInclusao.Append;
   qryProdutosInclusaocodigo.AsString := CodigodoProduto;
   qryProdutosInclusaocodigovisual.AsString := CodigodoProduto;
   qryProdutosInclusaocaracteristica.AsString := Caracteristica;
   qryProdutosInclusaodescricao.AsString :=  DescricaoCaracteristica;
   qryProdutosInclusaovalorgrade1.AsString := ValorGrade1;
   qryProdutosInclusaovalorgrade2.AsString := ValorGrade2;
   qryProdutosInclusao.Post;
 end;

 procedure IncluirEstoqueFilialBase;
 begin
   if qryEstoques.State = dsInactive then
      ReFazConsulta(qryEstoques,[0],[0]);

   if ParSistema.IncluirEstoqueAutomatico then
   begin
     qryfiliais.Open;
     qryfiliais.First;
     while not qryfiliais.Eof do
     begin
       qryEstoques.Append;
       qryEstoquesproduto.AsString := CodigodoProduto;
       qryEstoquesfilial.AsInteger := qryfiliaiscodigo.AsInteger;
       qryEstoques.Post;
       qryfiliais.Next;
     end;
     qryfiliais.Close;
   end
   else
   begin
     qryEstoques.Append;
     qryEstoquesproduto.AsString         := CodigodoProduto;
     qryEstoquesfilial.AsInteger         := FilialBase;
     qryEstoques.Post;
   end;
 end;

begin
 result := true;
 IncluirProduto;
 IncluirEstoqueFilialBase;
 result := Perpetrar([qryprodutosinclusao, qryestoques], AguardareTerminarDentroDm)
// result := Perpetrar([qryprodutosinclusao, qryestoques])
end;


function TdtmCadastroNotasFiscais.IncluirPrecosNaoCadastrados: Boolean;

begin
  dtmCalcularCusto.DesabilitarControles_ := DesabilitarControles;
  result := dtmCalcularCusto.IncluirPrecosNaoCadastrados(qryProdutosNotaFiscal,
                                            qryNotaFiscal,
                                            NotaEntrada);


end;

function TdtmCadastroNotasFiscais.VerificarCustos: Boolean;
begin
  result := True;
{  if not qryProcuraNaturezasdiferenciada.AsBoolean then
  begin}
    CalcularCusto;
    if (qryNotaFiscalvaloricmssubstituicao.AsCurrency <> 0) and
       (qryNotaFiscalvaloricmssubstituicaocalculada.AsCurrency = 0) then
    begin
      result := false;
      MensagemErro('A informação do valor de icms de substituição tributária '+ #10 +
                    'requer pelo menos um produto com incidência 10, 30, 60 ou 70.'+ #10 +
                    'Verifique o cadastro de produtos.');
    end;

    if result then
      if VerificarPrecoVenda then
      begin
        CalcularPrecoVenda;
        if FExisteAlteracaoCusto and
           FExistePrecoDigitado then
            result := MensagemSelecionaOpcao('Existe mudança no custo, '+#10+
                                             'deseja verificar as preços antes de gravar?') = smbNo;
      end;
{  end;}
end;

function TdtmCadastroNotasFiscais.GetVerificarPrecoVenda: Boolean;
begin
 FVerificarPrecoVenda :=
     (ParSistema.GerarPrecoAutomatico)                                and
     (ParSistema.LocalCalculoPreco in [lcpNOTAENTRADA, lcpAMBOS])     and
     (qryNotaFiscalfinalidadenf.asinteger = 1) and  //Normal
 // compras p/ industrialização, comercialização ou prestação de servicos
     ((CodigoFiscal MOD 1000 > 100)
       and (CodigoFiscal MOD 1000 < 127)  or
 // compra de energia eletrica
      (CodigoFiscal MOD 1000 > 250)
       and (CodigoFiscal MOD 1000 < 258)  or
 // compras sujeitas ao regime de subst. tributária
      (CodigoFiscal MOD 1000 > 400)
       and (codigoFiscal MOD 1000 < 408) or
      (CodigoFiscal MOD 1000 = 551));

  Result := FVerificarPrecoVenda;
end;

function TdtmCadastroNotasFiscais.GetValorAcrescimo: Currency;
begin
  Result := qryNotaFiscalacrescimo.AsCurrency;
end;

function TdtmCadastroNotasFiscais.GetValorCofinsaRecolher: Currency;
begin
  Result := qryNotaFiscaltotalvalorcofins.AsCurrency;
end;

function TdtmCadastroNotasFiscais.GetValordaNota: Currency;
begin
  Result := qryNotaFiscalvalornota.AsCurrency;
end;

function TdtmCadastroNotasFiscais.GetValorDespesasAcessorias: Currency;
begin
  Result := qryNotaFiscaldespesasacessorias.AsCurrency;
end;

function TdtmCadastroNotasFiscais.GetValorDespesasCOFINS: Currency;
begin
  Result := qryNotaFiscaltotalvalorcofins.AsCurrency;
end;

function TdtmCadastroNotasFiscais.GetValorCustodaMercadoria: Currency;
begin
  result := qryNotaFiscalvalornota.AsCurrency;
  if ContribIPI then
    Result :=  Result - qryNotaFiscalvaloripi.AsCurrency;
  if ContribICMS then
    Result := Result - qryNotaFiscalvaloricms.AsCurrency;
end;

function TdtmCadastroNotasFiscais.GetValorEstoquedaMercadoria: Currency;
begin
  result := qryNotaFiscalvalornota.AsCurrency;
  if ContribIPI then
    Result :=  Result - qryNotaFiscalvaloripi.AsCurrency;
  if ContribICMS then
    Result := Result - qryNotaFiscalvaloricms.AsCurrency;
end;


function TdtmCadastroNotasFiscais.GetValorFrete: Currency;
begin
  Result := qryNotaFiscalfreteinterno.AsCurrency;
end;

function TdtmCadastroNotasFiscais.GetValorICMS: Currency;
begin
  Result := qryNotaFiscalvaloricms.AsCurrency;
end;

function TdtmCadastroNotasFiscais.GetValorICMSSubstituicao: Currency;
begin
  Result := qryNotaFiscalvaloricmssubstituicao.AsCurrency;
end;

function TdtmCadastroNotasFiscais.GetValorPIS: Currency;
begin
  Result := qryNotaFiscaltotalvalorpis.AsCurrency;
end;

function TdtmCadastroNotasFiscais.GetValorIPI: Currency;
begin
  Result := qryNotaFiscalvaloripi.AsCurrency;
end;

function TdtmCadastroNotasFiscais.GetValorProdutos: Currency;
begin
  Result := qryNotaFiscaltotalprodutos.AsCurrency;
end;

function TdtmCadastroNotasFiscais.GetValorSeguro: Currency;
begin
  Result := qryNotaFiscalseguro.AsCurrency;
end;

function TdtmCadastroNotasFiscais.GetCofinsRetido: Currency;
begin
  result := qryNotaFiscalcofinsretido.AsCurrency;
end;

function TdtmCadastroNotasFiscais.GetCSLLRetido: Currency;
begin
  result := qryNotaFiscalcsllretido.AsCurrency;
end;

function TdtmCadastroNotasFiscais.GetINSSRetido: Currency;
begin
  result := qryNotaFiscalinssretido.AsCurrency;
end;

function TdtmCadastroNotasFiscais.GetIRRetido: Currency;
begin
  result := qryNotaFiscalirretido.AsCurrency;
end;

function TdtmCadastroNotasFiscais.GetISSRetido: Currency;
begin
  result := qryNotaFiscalissretido.AsCurrency;
end;

function TdtmCadastroNotasFiscais.GetPISRetido: Currency;
begin
  result := qryNotaFiscalpisretido.AsCurrency;
end;

function TdtmCadastroNotasFiscais.GetPISCOFINSCSLLRetido: Currency;
begin
  result := qryNotaFiscalpiscofinscsllretido.AsCurrency;
end;


function TdtmCadastroNotasFiscais.GetValordesconto: Currency;
begin
  result := qryNotaFiscaldesconto.AsCurrency;
end;


function TdtmCadastroNotasFiscais.GetDataDocumento: TDateTime;
begin
  result := qryNotaFiscaldata.AsDateTime;
end;

function TdtmCadastroNotasFiscais.GetCodigoNatureza: Integer;
begin
  result := qryNotaFiscalcodigonatureza.AsInteger;
end;

function TdtmCadastroNotasFiscais.GetCreditoFornecedor: Integer;
begin
 { if ExisteContaCreditoNatureza then
    Result:= qryContaCreditoFornecedorcontacontabil.AsInteger
  else              }
    result := qryProcuraFornecedorescredito.AsInteger;
end;

function TdtmCadastroNotasFiscais.GetDebitoFornecedor: Integer;
begin
 result := qryProcuraFornecedoresdebito.AsInteger;
end;

function TdtmCadastroNotasFiscais.GetFornecedorParaISS: Integer;
begin
 result := qryNotaFiscalfornecedorparaiss.AsInteger;
end;

function TdtmCadastroNotasFiscais.GetFilialDocumento: Integer;
begin
  result := qryNotaFiscalfilial.AsInteger;
end;

function TdtmCadastroNotasFiscais.GetCodigoDocumento: Int64;
begin
  result := qryNotaFiscalcodigo.asInteger;
end;

function TdtmCadastroNotasFiscais.GetNumeroNotaFiscal: integer;
begin
  result := qryNotaFiscalnrdocumento.AsInteger;
end;


function TdtmCadastroNotasFiscais.GetContaCreditar: integer;
begin
  if qryDocumentoPag.IsEmpty then
     ReFazConsulta(qryDocumentoPag, [0], [qryNotaFiscaldocumentopag.AsInteger]);
  result := qryDocumentoPagcreditar.AsInteger;
end;

function TdtmCadastroNotasFiscais.GetHistoricoDebitar: integer;
begin
  result := qryDocumentoPaghistorico.AsInteger;
end;

procedure TdtmCadastroNotasFiscais.CancelarNFe;
var
//  NFe : TTecNotaFiscalEletronica;
  ChaveNota,
  ProtocoloCancelamento,
  ProtocoloInutilizacao: String;
begin
  if CondicaoEmissorNfe and
     qryNotaFiscalpermitirimprimir.AsBoolean then
  begin
    NFe := TTecNotaFiscalEletronica.Create;
    {
    NFe.DiretorioEnvio       := NFeDirEnvio;
    NFe.DiretorioEnviado     := NFeDirEnviados;
    NFe.DiretorioRetorno     := NFeDirRetorno;
    NFe.DiretorioCompartilha := NfeDirCompartilha;
    NFe.Executavel           := NFeExecNFe;
    }

    try
      ShowProcessando('Verificando status do serviço NF-e!');
      Sleep(500);
      if NFe.VerificarStatusServico(IntToStr(NFeAmbiente)) then
      begin
        if (qryNotaFiscalnumprotocolonfe.AsString <> '') then
        begin
          ShowProcessando;
          ShowProcessando('Cancelando NF-e');
          ChaveNota := copy(CodigoCidadeIBGEFilialBase,1,2)+
                       FormatDateTime('YYMM', qryNotaFiscaldata.AsDateTime)+
                       preencheString(CNPJFilialBase,'0',14,false)+
                       preencheString(qryNotaFiscalmodelodocto.AsString,'0',2,false) +
                       preencheString(qryNotaFiscalserie.Asstring,'0',3,false)       +
                       preencheString(qryNotaFiscalnrdocumento.Asstring,'0',9,false) +
                       qryNotaFiscalformaemissao.AsString + //1
                       preencheString(qryNotaFiscalcodaleatorio.Asstring,'0',8,false)+
                       qryNotaFiscaldigchaveacesso.AsString;

          if NFe.CancelarNfe(ChaveNota,
                             qryNotaFiscalnumprotocolonfe.AsString,
                             'CANCELADA EMITIDA ERRONEAMENTE',
                             qryNotaFiscalambiente.AsString,
                             EstadoFilialBaseIBGE,
                             CNPJFilialBase,
                             DataHoraProcessamentoNfe,
                             ProtocoloCancelamento) then
          begin
            SalvarConteudoxml('E', qryNotaFiscalcodigo.asString, true);

            qryNotaFiscal.ReadOnly := False;
            qryNotaFiscal.Edit;
            qryNotaFiscalnumcancelamentonfe.AsString := ProtocoloCancelamento;
            qryNotaFiscal.Post;
            Perpetrar([qryNotaFiscal]);
            qryNotaFiscal.ReadOnly := True;


          end;
          ShowProcessando;
        end
        else
        begin
          ShowProcessando;
          ShowProcessando('Inutilizando NF-e');
          ChaveNota := EstadoFilialBaseIBGE+
//                       FormatDateTime('YY',qryNotaFiscaldata.AsDateTime)+
                         FormatDateTime('YY',date())+
                       preencheString(CNPJFilialBase,'0',14,false)+
                       '55'+
                       preencheString(qryNotaFiscalserie.Asstring,'0',3,false)       +
                       preencheString(qryNotaFiscalnrdocumento.Asstring,'0',9,false) +
                       preencheString(qryNotaFiscalnrdocumento.Asstring,'0',9,false);

          if NFe.InutilizarNFe(ChaveNota,
                              'INUTILIZADA ERRO',
                              inttostr(NFeAmbiente),
                             EstadoFilialBaseIBGE,
                             CNPJFilialBase,
                             qryNotaFiscalmodelodocto.AsString,
                             qryNotaFiscalserie.AsString,
                             qryNotaFiscalnrdocumento.AsString,
                             ProtocoloInutilizacao) then
          begin
            SalvarConteudoxml('E', qryNotaFiscalcodigo.asString, true);
            qryNotaFiscal.ReadOnly := False;
            qryNotaFiscal.Edit;
            qryNotaFiscalnuminutilizacaonfe.AsString := ProtocoloInutilizacao;
            qryNotaFiscal.Post;
            Perpetrar([qryNotaFiscal]);
            qryNotaFiscal.ReadOnly := True;
          end;
          ShowProcessando;
        end;
      end
      else
        ShowProcessando;
    finally
      FreeAndNil(NFe);
    end;
  end;
end;


procedure TdtmCadastroNotasFiscais.PerpetrarExclusao;
begin
  SomenteLeitura := False;
  if (ParSistema.GerarContabilidade) and Assigned(dtmLancamentoContabilidade)  then
    Perpetrar([qryPedidos, qryPrevisao, qryPrevisaoDuplicatas, qryDuplicatas,
               qryProdutosNotaFiscal,
               {dtmGerarNotaFiscal.qryCalculosNotasPag,}
               qryMovNotaFiscal,qryMovimentos,
               qryVolumesNotasPag, qryLacresVolumesNotasPag,
               qryNotaFiscal, qryDocumentoPag, qryEstoque,
               dtmLancamentoContabilidade.qryLancamentosNotasEntradas, qryContratos,
               qryParcelas, qryProdutosContratos, qryServicosContratos, qryContratosDevolvidos, qryApagarMovimentos, qryProdutosFornecedores
               {,
               qryprodutosimportados, qryAdicoesImportacao, qryDadosImportacoes}])
  else
    Perpetrar([qryPedidos, qryPrevisao, qryPrevisaoDuplicatas, qryDuplicatas,
               qryProdutosNotaFiscal,
               {dtmGerarNotaFiscal.qryCalculosNotasPag,}
               qryMovNotaFiscal, qryMovimentos,
               qryVolumesNotasPag, qryLacresVolumesNotasPag,
               qryNotaFiscal, qryDocumentoPag, qryEstoque, qryContratos,
               qryParcelas, qryProdutosContratos, qryServicosContratos, qryContratosDevolvidos, qryApagarMovimentos, qryProdutosFornecedores
               {,
               qryprodutosimportados,
               qryAdicoesImportacao, qryDadosImportacoes}]);
  SomenteLeitura := True;
end;

procedure TdtmCadastroNotasFiscais.qryNotaFiscalAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  if qryNotaFiscalcodigo.AsInteger<>0 then
  begin
//    SomenteLeitura := false;
    if Assigned(FAfterOpenNotaFiscal) then
      FAfterOpenNotaFiscal(DataSet);

    if (qryNotaFiscalfilial.AsInteger <> filialbase) and (qrynotafiscal.State <> dsinsert) then
      MensagemAviso('Esta nota foi cadastrada em outra filial e não poderá ser editada');

    VisualizarComSaldosQuantidadeNFe := false;

    qryProdutosNotasPagNFE.filtered := false;
  end;
end;

procedure TdtmCadastroNotasFiscais.qryNotaFiscalAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryProcuraFornecedoresAfterScroll(nil);
  if Assigned(FAfterOpenNotaFiscal) then
    FAfterOpenNotaFiscal(DataSet);
end;

procedure TdtmCadastroNotasFiscais.qryProcuraFornecedoresAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  if Assigned(OnChangeTipoFornecedor) then
    OnChangeTipoFornecedor(qryNotaFiscal);
end;

(*
procedure TdtmCadastroNotasFiscais.AtualizarValorUltimaCompra;
begin
  if qryProdutosNotaFiscal.Active then
  begin


    try

      GuardarRegistroAtual(qryProdutosNotaFiscal,True);
      DesabilitarControles(true);
      qryProdutosNotaFiscal.First;
      while not qryProdutosNotaFiscal.Eof do
      begin
        qryAtualizaValorUltimaCompra.Params[0].AsCurrency := qryProdutosNotaFiscalcustoparavenda.AsCurrency;
        qryAtualizaValorUltimaCompra.Params[1].AsString   := qryProdutosNotaFiscalproduto.AsString;
        //qryAtualizaValorUltimaCompra.Params[2].AsInteger  := qryProdutosNotaFiscalfilial.AsInteger;
        qryAtualizaValorUltimaCompra.ExecSql;
        qryProdutosNotaFiscal.Next;
      end;
      Perpetrar([qryAtualizaValorUltimaCompra]);
    finally
      VoltarRegistroAtual(qryProdutosNotaFiscal);
      DesabilitarControles(false);
    end;
  end;
end;
*)

procedure TdtmCadastroNotasFiscais.qryNotaFiscalAfterScroll(
  DataSet: TDataSet);
begin
  inherited;

  if assigned(v_PosicaoProdutosNotasPagNFE[1]) then
  begin
    v_PosicaoProdutosNotasPagNFE[1] := nil;
    v_PosicaoProdutosNotasPagNFE[2] := nil;
  end;

  FContrapartidaAlterada := false;
  ReFazConsulta(qryVolumesNotasPag,[0],[qryNotaFiscalcodigo.AsInteger]);
  ReFazConsulta(qryLacresVolumesNotasPag,[0],[qryNotaFiscalcodigo.AsInteger]);
  qryProcuraPedidosNotaFiscal.Parambyname('codigonota').AsInteger  := qryNotaFiscalcodigo.AsInteger;
  qryConsultaPedidosNotaFiscal.Parambyname('codigonota').AsInteger  := qryNotaFiscalcodigo.AsInteger;
  qryConsultaPedidosProdutoNFE.Parambyname('codigonota').AsInteger  := qryNotaFiscalcodigo.AsInteger;

  ReFazConsulta(qryCalculosProdutos, [0], [qryNotaFiscalCodigo.AsInteger]);
  RefazConsultaPorNome(qryFornecedorProduto, ['fornecedor'], [qryNotaFiscalfornecedor.asinteger]);
//  RefazConsultaPorNome(qryPedidosdaNota, ['codigonota'],[qryNotaFiscalcodigo.AsInteger]);
  RefazConsultaPorNome(qryPedidosNotasPag, ['codigonota'],[qryNotaFiscalcodigo.AsInteger]);
  RefazConsultaPorNome(qrynotaspagchv, ['codigonota'],[qryNotaFiscalcodigo.AsInteger]);

  RefazConsultaPorNome(qryProdutosNotasPagPedidos, ['codigonota'],[qryNotaFiscalcodigo.AsInteger]);
  RefazConsultaPorNome(qryNotasPagPedidos, ['codigonota'],[qryNotaFiscalcodigo.AsInteger]);

  SelecionandoNF := true;
  refazconsultapornome(qryDadosFiscaisRef, ['filial','serie','numero'],
  [filialbase,
   qryNotaFiscalserienotasaidareferenciada.AsString,
   qryNotaFiscalnumeronotasaidareferenciada.Asinteger]);
  SelecionandoNF := false; 

  ExecutadoCalculorImpostos := false;

  dtmCalcularCusto.vListaProdutosComponentesdosCompostos.clear;


end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotaFiscalAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryProdutosNotaFiscal.Cancel;
end;

procedure TdtmCadastroNotasFiscais.SelecionarNaturezaProduto;
begin
{  qryProcuraNaturezasProduto.MacroByName('CodigoNaturezaPadrao').AsString := ' and (naturezas.codigo = ' + IntToStr(qryConsultaNaturezascodigo.AsInteger) + ') ';
  if qryProcuraNaturezasProdutocodigofiscal.AsInteger = qryConsultaNaturezascodigofiscal.AsInteger then
    ReFazConsulta(qryProcuraNaturezasProduto,[],[]);
  qryProdutosNotaFiscalcodigofiscal.AsInteger := qryConsultaNaturezascodigofiscal.AsInteger;
}
  if qryProdutosNotaFiscal.State = dsBrowse then
    qryProdutosNotaFiscal.Edit;
  qryProcuraNaturezasProduto.BeforeOpen := nil;
  qryProcuraNaturezasProduto.MacroByName('CodigoNaturezaPadrao').AsString := ' and (naturezas.codigo = ' + IntToStr(qryConsultaNaturezascodigo.AsInteger) + ') ';
  if qryProcuraNaturezasProdutocodigofiscal.AsInteger = qryConsultaNaturezascodigofiscal.AsInteger then
    ReFazConsulta(qryProcuraNaturezasProduto,[],[]);

  qryProdutosNotaFiscalnatureza.AsInteger     := qryConsultaNaturezascodigo.AsInteger;
  qryProdutosNotaFiscalgerarpagamento.AsBoolean := qryConsultaNaturezasgerarpagamento.AsBoolean;

  qryProdutosNotaFiscalnaogerarcreditoicms.AsBoolean := qryConsultaNaturezasnaogerarcreditoicms.AsBoolean;
  qryProdutosNotaFiscalnaogerarcreditoipi.AsBoolean := qryConsultaNaturezasnaogerarcreditoipi.AsBoolean;
  qryProdutosNotaFiscalicmssobreipi.AsBoolean := qryConsultaNaturezasicmssobreipi.AsBoolean;
  qryProdutosNotaFiscalicmssobredespesasacessorias.AsBoolean := qryConsultaNaturezasicmssobredespesasacessorias.AsBoolean;


  qryProdutosNotaFiscalnaocalcularipisobrefrete.AsBoolean := qryConsultaNaturezasnaocalcularipisobrefrete.AsBoolean;

  qryProdutosNotaFiscalcodigofiscal.AsInteger := qryConsultaNaturezascodigofiscal.AsInteger;
  qryProcuraNaturezasProduto.BeforeOpen := qryProcuraNaturezasProdutoBeforeOpen;
end;

procedure TdtmCadastroNotasFiscais.qryProcuraNaturezasProdutoBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  if not qryConsultaNaturezas.Active then
    if not ((qryProcuraNaturezasProduto.ParamByName('codigofiscal').Asinteger = 1353) or
            (qryProcuraNaturezasProduto.ParamByName('codigofiscal').Asinteger = 2353)) then
      qryProcuraNaturezasProduto.MacroByName('CodigoNaturezaPadrao').AsString := '';

  if pos(inttostr(CodigoFiscalAuxiliar), qryProcuraNaturezasProduto.params[1].asstring)=0 then
    qryProcuraNaturezasProduto.MacroByName('CodigoNaturezaPadrao').AsString := '';

  if (qryProdutosNotaFiscalnatureza.AsInteger <> 0) and
     (qryProcuraNaturezasProduto.Params[1].AsInteger = qryProdutosNotaFiscalcodigofiscal.asinteger) then
    qryProcuraNaturezasProduto.MacroByName('CodigoNaturezaPadrao').AsString := ' and (naturezas.codigo = ' + IntToStr(qryProdutosNotaFiscalnatureza.AsInteger) + ') ';

  qryProcuraNaturezasProduto.paramByName('finalidade').AsInteger := qryNotaFiscalfinalidadenf.AsInteger;    
end;


procedure TdtmCadastroNotasFiscais.qryAdicoesImportacaoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
{  qryAdicoesImportacao.ReadOnly := qryAdicoesImportacaototais.AsBoolean;}
end;

procedure TdtmCadastroNotasFiscais.qryAdicoesImportacaoAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  TotalizarAdicoes;
  Perpetrar([qryAdicoesImportacao]);
end;

procedure TdtmCadastroNotasFiscais.qryAdicoesImportacaoAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  TotalizarAdicoes;
end;

function TdtmCadastroNotasFiscais.Importacao_: Boolean;
begin
//  result := false;
//  if ParSistema.ControlesVoltadosparaIndustria then
//  begin
    Result := (qryNotaFiscalcodigofiscal.AsInteger - (qryNotaFiscalcodigofiscal.AsInteger mod 1000) = 3000)
              and not ((qryNotaFiscalcodigofiscal.AsInteger = 3201) or { Devolução de venda de produção do estabelecimento }
                       (qryNotaFiscalcodigofiscal.AsInteger = 3202) or { 3.202 - Devolução de venda de mercadoria adquirida ou recebida de terceiros }
                       (qryNotaFiscalcodigofiscal.AsInteger = 3211) or { Devolução de venda de produção do estabelecimento sob o regime de “drawback” }
                       (qryNotaFiscalcodigofiscal.AsInteger = 3503) or { Devolução de mercadoria exportada que tenha sid recebida com fim específico de exportação }
                       (qryNotaFiscalcodigofiscal.AsInteger = 3553));  { 3.553 - Devolução de venda de bem do ativo imobilizado (NT 2010.007) }


    if Result then
    begin
      FImportacao := True;
      if qryDadosImportacoes.State = dsInactive then
        qryDadosImportacoes.Open;
{      if qryAdicoesImportacao.State = dsInactive then
        qryAdicoesImportacao.Open;
      if qryProdutosImportados.State = dsInactive then
        qryProdutosImportados.Open;}
{
      if (qryDadosImportacoes.State <> dsInsert) and
         qryDadosImportacoes.IsEmpty then
      begin
        qryDadosImportacoes.Append;
        qryDadosImportacoesexportador.AsInteger := qryNotaFiscalfornecedor.AsInteger;
      end;
}
//      qryProcuraProdutoNotaFiscal.ParamByName('estado').AsString   := EstadoFilialBase;
//      qryConsultaProdutosNotaFiscal.ParamByName('estado').AsString := EstadoFilialBase;

    end
    else
    begin
      if qryDadosImportacoes.State <> dsInactive then
        qryDadosImportacoes.Close;
      if qryAdicoesImportacao.State <> dsInactive then
        qryAdicoesImportacao.Close;
      if qryProdutosImportados.State <> dsInactive then
        qryProdutosImportados.Close;
    end;
//  end;
end;

procedure TdtmCadastroNotasFiscais.qryAdicoesImportacaoAfterCancel(
  DataSet: TDataSet);
begin
  inherited;
  TotalizarAdicoes;
end;

procedure TdtmCadastroNotasFiscais.dsrProdutosImportadosDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if Field = qryProdutosImportadosprodutodigitado then
  begin
    qryProdutosImportadosdescricao.AsString       := qryProcuraProdutoNotaFiscaldescricaolc.AsString;
    qryProdutosImportadosaliquotaipi.AsCurrency           := qryProcuraProdutoNotaFiscalaliquotaipi.AsCurrency;
  end;
end;

procedure TdtmCadastroNotasFiscais.qryConhecimentoFreteCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryConhecimentoFretevalorsugestaoconhecimento.AsCurrency :=
    qryConhecimentoFretevalornota.AsCurrency -
    qryConhecimentoFretevalorconhecimentofreteusadonanota.AsCurrency;

  qryConhecimentoFreteicmssugestaoconhecimento.AsCurrency :=
    qryConhecimentoFretevaloricms.AsCurrency -
    qryConhecimentoFreteicmsconhecimentofreteusadonanota.AsCurrency;
end;

procedure TdtmCadastroNotasFiscais.qryAdicoesImportacaoBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryAdicoesImportacao.AfterScroll := nil;
  qryAdicoesImportacao.DisableControls;
  try
    qryAdicoesImportacao.Last;
    {
    if qryAdicoesImportacaototais.AsBoolean then
    begin
      qryAdicoesImportacao.AfterDelete := nil;
      qryAdicoesImportacao.ReadOnly := False;
      qryAdicoesImportacao.Delete;
      qryAdicoesImportacao.AfterDelete := qryAdicoesImportacaoAfterDelete;
    end;
    }
  finally
    qryAdicoesImportacao.EnableControls;
    qryAdicoesImportacao.AfterScroll := qryAdicoesImportacaoAfterScroll;
  end;
end;

procedure TdtmCadastroNotasFiscais.qryVolumesNotasPagAfterEdit(
  DataSet: TDataSet);
begin
  inherited;
  qryNotaFiscal.Edit;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotaFiscalAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  AtualizaSQLProdutosExistenteNotas;
end;

procedure TdtmCadastroNotasFiscais.qryDadosImportacoesNewRecord(
  DataSet: TDataSet);
begin
  inherited;
   qryDadosImportacoesexportador.AsInteger := qryNotaFiscalfornecedor.AsInteger;
   qryDadosImportacoestpviatransp.AsInteger := 1;
   qryDadosImportacoestpIntermedio.AsInteger := 1;
   qryDadosImportacoescnpjadquirente.AsString := CNPJFilialBase;
   qryDadosImportacoesufadquirente.AsString := EstadoFilialBase;

end;

procedure TdtmCadastroNotasFiscais.qryDadosImportacoesAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryAdicoesImportacao,[0],[qryDadosImportacoesnumero.AsVariant]);
  ReFazConsulta(qryProdutosImportados,[0],[qryDadosImportacoesnumero.AsVariant]);

end;

procedure TdtmCadastroNotasFiscais.qryAdicoesImportacaoBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  Perpetrar([qryDadosImportacoes]);
end;

procedure TdtmCadastroNotasFiscais.qryProdutosImportadosAfterPost(
  DataSet: TDataSet);
var
  adicao, produto : String;
begin
  inherited;
  adicao := qryProdutosImportadosnumeroadicao.AsString;
  produto := qryProdutosImportadosproduto.asstring;

  Perpetrar([qryprodutosimportados]);
  ReFazConsulta(qryProdutosImportados,[0],[qryDadosImportacoesnumero.AsVariant]);
  qryProdutosImportados.Locate('numeroadicao; produto', Vararrayof([adicao,produto]),[]);
  if qryProdutosImportadosaliquotaipiduplicadas.AsBoolean then
    MensagemAviso('Existem alíquotas de ipi diferentes nesta adição');

end;

procedure TdtmCadastroNotasFiscais.qryAdicoesImportacaoAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TotalizarAdicoes;
end;

procedure TdtmCadastroNotasFiscais.qryProcuraAdicoesImportacaoBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryProcuraAdicoesImportacao.ParamByName('importacao').AsString := qryDadosImportacoesnumero.AsString;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosImportadosNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryProdutosImportadosdadoimportacao.AsString := qryDadosImportacoesnumero.AsString;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosImportadosBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  // qryProdutosimportados.ParamByName('estado').AsString   := EstadoFilialBase;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosImportadosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryProdutosImportadosValorConvertido.AsCurrency := qryProdutosImportadosvalor.AsCurrency *
                                                     qryDadosImportacoestaxacambio.AsCurrency;
end;

procedure TdtmCadastroNotasFiscais.qryAdicoesImportacaoNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryAdicoesImportacaoaliquotaicms.AsCurrency := 17;
end;

procedure TdtmCadastroNotasFiscais.qryAdicoesImportacaoCalcFields(
  DataSet: TDataSet);
begin
  inherited;
    qryAdicoesImportacaobaseicmscalculada.AsCurrency :=

      roundto((qryAdicoesImportacaomercadoria.AsCurrency +
       qryAdicoesImportacaofrete.AsCurrency +
       qryAdicoesImportacaoembalagem.AsCurrency +
       qryAdicoesImportacaothc.AsCurrency +
       qryAdicoesImportacaoii.AsCurrency +
       qryAdicoesImportacaoipi.AsCurrency +
       qryAdicoesImportacaopis.AsCurrency +
       qryAdicoesImportacaocofins.AsCurrency +
       qryAdicoesImportacaosiscomex.AsCurrency) /(1-qryAdicoesImportacaoaliquotaicms.AsCurrency/100),-2);

    qryAdicoesImportacaovaloricmscalculado.AsCurrency := roundto(qryAdicoesImportacaobaseicms.AsCurrency *
                                                qryAdicoesImportacaoaliquotaicms.AsCurrency/100,-2);



end;

procedure TdtmCadastroNotasFiscais.dsrAdicoesImportacaoDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if (field =  qryAdicoesImportacaomercadoria) or
     (field =  qryAdicoesImportacaofrete) or
     (field =  qryAdicoesImportacaoembalagem) or
     (field =  qryAdicoesImportacaothc) or
     (field =  qryAdicoesImportacaoii) or
     (field =  qryAdicoesImportacaoipi) or
     (field =  qryAdicoesImportacaopis) or
     (field =  qryAdicoesImportacaocofins) or
     (field =  qryAdicoesImportacaosiscomex) or
     (field =  qryAdicoesImportacaoaliquotaicms) then

    if qryAdicoesImportacao.state = dsinsert then
    begin
      qryAdicoesImportacaobaseicms.AsCurrency :=
        (qryAdicoesImportacaomercadoria.AsCurrency +
         qryAdicoesImportacaofrete.AsCurrency +
         qryAdicoesImportacaoembalagem.AsCurrency +
         qryAdicoesImportacaothc.AsCurrency +
         qryAdicoesImportacaoii.AsCurrency +
         qryAdicoesImportacaoipi.AsCurrency +
         qryAdicoesImportacaopis.AsCurrency +
         qryAdicoesImportacaocofins.AsCurrency +
         qryAdicoesImportacaosiscomex.AsCurrency) /(1-qryAdicoesImportacaoaliquotaicms.AsCurrency/100);

      qryAdicoesImportacaovaloricms.AsCurrency := qryAdicoesImportacaobaseicms.AsCurrency *
                                                  qryAdicoesImportacaoaliquotaicms.AsCurrency/100;
    end;
end;

{
function TdtmCadastroNotasFiscais.GetCalculosNotasPagtotaltipo: Currency;
begin
  result := dtmGerarNotaFiscal.qryCalculosNotasPagtotaltipo.AsCurrency;
end;
}

procedure TdtmCadastroNotasFiscais.qryNotaFiscalBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if trim(qryNotaFiscalchv_nfe.AsString)='' then
    qryNotaFiscalchv_nfe.clear;

  qryNotaFiscaldatahoraemissao.AsDateTime := DataHoraServidor;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotaFiscalBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if qryProdutosNotaFiscalincidencia.AsString = '' then
     qryProdutosNotaFiscalincidencia.Clear;

  if qryProdutosNotaFiscalcsosn.AsString = '' then
     qryProdutosNotaFiscalcsosn.Clear;

  qryProdutosNotaFiscaltribquantidade.AsFloat := qryProdutosNotaFiscalquantidade.AsFloat;
  qryProdutosNotaFiscaltribunidade.AsString   := qryProdutosNotaFiscalunidade.AsString;
  qryProdutosNotaFiscaltribunitario.AsFloat   := qryProdutosNotaFiscalprecounitario.asFloat;

 { if qrynotafiscalsituacao.asstring = 'P' then
  begin}
    qryProdutosNotaFiscalmarkup_produto.ascurrency := qryProdutosNotaFiscalmarkup_produto_1.ascurrency;
    qryProdutosNotaFiscalmarkup_grupo.ascurrency := qryProdutosNotaFiscalmarkup_grupo_1.ascurrency;
    qryProdutosNotaFiscalmarkup_fornecedor.ascurrency := qryProdutosNotaFiscalmarkup_fornecedor_1.ascurrency;
    qryProdutosNotaFiscalcsosn_produto.asString := qryProdutosNotaFiscalcsosn_produto_1.asString;
    qryProdutosNotaFiscalcst_produto.asString := qryProdutosNotaFiscalcst_produto_1.asString;
{  end;}

//  qryProdutosNotaFiscalnrLote.value := qryProdutosNotaFiscalnLote.value;
//  qryProdutosNotaFiscalfabricacao.value := qryProdutosNotaFiscaldfab.value;
//  qryProdutosNotaFiscalvalidade.value := qryProdutosNotaFiscaldval.value;


end;

procedure TdtmCadastroNotasFiscais.ImprimirEspelhoNota;
begin
  dtmImprimeFiscalGrafica := TdtmImprimeFiscalGrafica.Create(self);
  try
    with dtmImprimeFiscalGrafica.Nota do
    begin
      Tipo              := nfENTRADA;
      Filial            := qryNotaFiscalfilial.AsInteger;
      Serie             := qryNotaFiscalserie.AsString;
      Numero            := qryNotaFiscalnrdocumento.AsInteger;
      NaturezaDescricao := qryNotaFiscalnatureza.AsString;
      CodigoFiscal      := qryNotaFiscalcodigofiscal.AsInteger;
      CNPJ              := SomenteNumero(CNPJFilialBase);
      IE                := InscricaoEstadualFilialBase;
      IEST              := '';
      Data              := qryNotaFiscalemissao.AsDateTime;
      DataSaida         := qryNotaFiscaldata.AsDateTime;
      InfComplementares := qryNotaFiscalobservacoes.AsString;
      if qryNotaFiscalfrete.AsString = '1' then
        TipoFrete       := tfEmitente
      else
        TipoFrete       := tfDestinatario;

      with Cliente do
      begin
        CNPJ := SomenteNumero(qryNotaFiscalcnpj.AsString);
        IE   := qryNotaFiscalinscricaoestadual.AsString;
        Nome := qryNotaFiscalnome.AsString;
        Rua  := qryNotaFiscalrua.AsString;
        Numero := qryNotaFiscalendnumero.AsInteger;
        Complemento := qryNotaFiscalendcomplemento.AsString;

        if SomenteNumero(qryNotaFiscalcep.AsString) <> '' then
          CEP := StrToInt(SomenteNumero(qryNotaFiscalcep.AsString));

        NomeBairro := qryNotaFiscalnomebairro.AsString;
        NomeCidade := qryNotaFiscalnomecidade.AsString;
        Estado := qryNotaFiscalestado.AsString;
        FoneDDD := qryNotaFiscalfoneddd.AsInteger;
        FoneNumero := qryNotaFiscalfonenumero.AsInteger;
      end;

      with Totais do
      begin
        IPI        := qryNotaFiscalvaloripi.AsFloat;
        ICMSBase   := qryNotaFiscalbaseicms.AsFloat;
        ICMS       := qryNotaFiscalvaloricms.AsFloat;
        ICMSSTBase := qryNotaFiscalbaseicmssubstituicao.AsFloat;
        ICMSST     := qryNotaFiscalvaloricmssubstituicao.AsFloat;
        Frete      := qryNotaFiscalfreteinterno.AsFloat;
        Seguro     := qryNotaFiscalseguro.AsFloat;
        Desconto   := qryNotaFiscaldesconto.AsFloat;
        Produtos   := qryNotaFiscalvalorprodutos.AsFloat + qryNotaFiscalvalorservicos.AsFloat;
        Prazo      := qryNotaFiscalvalornota.AsFloat;
        DespesasAcessorias := qryNotaFiscaldespesasacessorias.AsFloat;
      end;
      {
      with Transporte do
      begin
        CNPJ        := qryDadosFiscaistransportadora_cnpj.AsString;
        IE          := qryDadosFiscaistransportadora_ie.AsString;
        Nome        := qryDadosFiscaistransportadora_nome.AsString;
        Rua         := qryDadosFiscaistransportadora_rua.AsString;
        NomeCidade  := qryDadosFiscaistransportadora_nomecidade.AsString;
        Estado      := qryDadosFiscaistransportadora_estado.AsString;
        Placa       := qryDadosFiscaisplaca.AsString;
        EstadoPlaca := qryDadosFiscaisestadoplaca.AsString;
        Quantidade  := qryVolumesDadosFiscaisvolumes.AsInteger;
        Especie     := qryVolumesDadosFiscaisespecietransporte.AsString;
        Marca       := qryVolumesDadosFiscaismarca.AsString;
        Numero      := qryVolumesDadosFiscaisnumeracao.AsString;
        PesoBruto   := qryVolumesDadosFiscaispesobruto.AsFloat;
        PesoLiquido := qryVolumesDadosFiscaispesoliquido.AsFloat;
      end;
      }
      //VENCTOS
      if qryDuplicatas.Active then
      begin
        GuardarRegistroAtual(qryDuplicatas,true);
        try
          qryDuplicatas.First;
          while not qryDuplicatas.Eof do
          begin
            with Venctos.Add do
            begin;
              Numero := qryDuplicatasnumero.AsInteger;
              Data   := qryDuplicatasdatavencto.AsDateTime;
              Valor  := qryDuplicatasvalorvencto.AsFloat;
            end;
            qryDuplicatas.Next;
          end;
        finally
          VoltarRegistroAtual(qryDuplicatas);
        end;
      end;

      //PRODUTOS
      if qryProdutosNotaFiscal.Active then
      begin
        GuardarRegistroAtual(qryProdutosNotaFiscal,true);
        DesabilitarControles(true);
        try
          qryProdutosNotaFiscal.First;
          while not qryProdutosNotaFiscal.Eof do
          begin
            with Produtos.Add do
            begin
              CodigoVisual        := qryProdutosNotaFiscalprodutovisual.AsString;
              Descricao           := qryProdutosNotaFiscaldescricaoproduto.AsString;
              Referencia          := qryProdutosNotaFiscalreferencia.AsString;
              ClassificacaoFiscal := qryProdutosNotaFiscalclassificacaofiscal.AsString;
              Origem              := qryProdutosNotaFiscalorigem.AsString;
              Incidencia          := qryProdutosNotaFiscalincidencia.AsString;
              CodigoFiscal        := qryProdutosNotaFiscalcodigofiscal.AsInteger;
              Unidade             := qryProdutosNotaFiscalunidade.AsString;
              Quantidade          := qryProdutosNotaFiscalquantidade.AsFloat;
              PrecoUnitario       := qryProdutosNotaFiscalprecounitario.AsFloat;
              PrecoTotal          := qryProdutosNotaFiscalprodutototal.AsFloat;
              BaseCalculoICMS     := qryProdutosNotaFiscalicmsbasecalculo.AsFloat;
              ValorICMS           := qryProdutosNotaFiscalicmsvalor.AsFloat;
              ValorIPI            := qryProdutosNotaFiscalvaloripi.AsFloat;
              AliquotaICMS        := qryProdutosNotaFiscalaliquotaicms.AsFloat;
              AliquotaIPI         := qryProdutosNotaFiscalaliquotaipi.AsFloat;
            end;
            qryProdutosNotaFiscal.Next;
          end;
        finally
          VoltarRegistroAtual(qryProdutosNotaFiscal);
          DesabilitarControles(false);
        end;
      end;

    end;
    dtmImprimeFiscalGrafica.ImprimirNota;
  finally
    dtmImprimeFiscalGrafica.Free;

  end;
end;

procedure TdtmCadastroNotasFiscais.qryNotaFiscalBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  ReFazConsultapornome(qryProdutosNotaFiscal, ['codigo'], [0]);

end;

procedure TdtmCadastroNotasFiscais.ImprimirAutorizacoes;
var
  Usuario: TtecUsuarios;

  vDocumentoPag : integer;
  vDataVencto : TDateTime;
  vNumero : integer;
  vReadOnlyDuplicatas : Boolean;



  function ListadeDuplicatas(SomenteAtual: Boolean): String;
  begin
    if SomenteAtual then
    begin
      if qryDuplicatasdatapagto.IsNull then
      begin
        result := '('+qryDuplicatasDocumentoPag.AsString+','+
                      quotedstr(formatdatetime('yyyy-mm-dd',qryDuplicatasDataVencto.AsDateTime))+','+
                      qryDuplicatasNumero.AsString+')';
        qryDuplicatas.Edit;
        qryDuplicatasautorizado.AsBoolean := true;
        qryDuplicatasdataautorizacaopagto.AsDateTime := now;
        qryDuplicatas.Post;
        perpetrar([qryduplicatas]);
      end;
    end
    else
    begin
      qryduplicatas.First;
      while not qryduplicatas.Eof do
      begin
        if qryDuplicatasdatapagto.IsNull then
        begin
          result := result +
                    '('+ qryDuplicatasdocumentopag.AsString + ','
                       + quotedstr(formatdatetime('yyyy-mm-dd',qryDuplicatasdatavencto.AsDateTime)) + ','
                       + qryDuplicatasnumero.AsString + '),';

          qryDuplicatas.Edit;
          qryDuplicatasautorizado.AsBoolean := true;
          qryDuplicatasdataautorizacaopagto.AsDateTime := now;
          qryDuplicatas.Post;
        end;
        qryduplicatas.next;
      end;
      delete(result, length(result),1);
      perpetrar([qryduplicatas]);
    end;
  end;
begin
  Usuario:= TtecUsuarios.Create(dtmTecSoft.Database);
  if UsuarioLogin.Pagamento then
       Usuario:= ObterAutorizacao(taSENHA)
  else Usuario:= ObterAutorizacao(taLOGIN, ctAUTORIZACAOPAGAMENTO, ctAUTORIZADO);

  if Assigned(Usuario) and Usuario.Pagamento then
  begin
    dtmImprimeAutorizacaoPagto := TdtmImprimeAutorizacaoPagto.create(self);

    try

      vDocumentoPag := qryDuplicatasDocumentoPag.AsInteger;
      vDataVencto   := qryDuplicatasDataVencto.AsDateTime;
      vNumero       := qryDuplicatasNumero.AsInteger;

      ReFazConsulta(qryDuplicatas, [0], [qryNotaFiscaldocumentopag.AsInteger]);

      vReadOnlyDuplicatas := qryDuplicatas.ReadOnly;
      qryDuplicatas.ReadOnly := false;

      if qryduplicatas.Locate('documentopag;datavencto;numero',VarArrayof([vDocumentoPag,vDataVencto,vNumero]),[]) then
      begin

        qryDuplicatas.BeforeEdit := nil;

        if qryDuplicatas.RecordCount = 1 then
          dtmImprimeAutorizacaoPagto.ImprimirAutorizacao(ListadeDuplicatas(true))
        else
        begin
          case MensagemSimNaoOpcaoCancelar('Deseja imprimir todas as autorizações de pagamento possíveis?' ,'',true,
                                           '&Todas',
                                           '&Registro Atual') of
            mrYes: dtmImprimeAutorizacaoPagto.ImprimirAutorizacao(ListadeDuplicatas(false));
            mrNo : dtmImprimeAutorizacaoPagto.ImprimirAutorizacao(ListadeDuplicatas(true));
          end;
        end;
      end
      else
        MensagemErro(format(ctNENHUMREGISTROENCONTRADO,['registro']));
    finally

      qryDuplicatas.BeforeEdit := qryDetalhesNotaFiscalBefore;
      qryDuplicatas.ReadOnly := vReadOnlyDuplicatas;

    end;
  end;
end;


procedure TdtmCadastroNotasFiscais.LerArquivoXMLNFe;
var
  n  : integer;
  NFeRTXT: TNFeRTXT;
  vresult : boolean;
begin

  TipoLeituraXML := XMLNfe;

  LimparDetalhesNotaFiscal(true);
  
  ACBrNFe1.NotasFiscais.Clear;
  //tenta TXT
  ACBrNFe1.NotasFiscais.Add;

//  if not Assigned(NFeRTXT) then
    NFeRTXT := TNFeRTXT.Create(ACBrNFe1.NotasFiscais.Items[0].NFe);

//  NFeRTXT.ConteudoArquivo
  NFeRTXT.CarregarArquivo(ArquivoXMLNFe);

  if NFeRTXT.LerTxt then
     NFeRTXT.Free
  else
  begin
     NFeRTXT.Free;

     //tenta XML
     ACBrNFe1.NotasFiscais.Clear;
     try
        ACBrNFe1.NotasFiscais.LoadFromFile(ArquivoXMLNFe);
     except
        on E: Exception do
        begin
          ShowMessage(E.Message);
          exit;
        end;
     end;

  end;

//  trvwNFe.Items.Clear;

  for n:=0 to ACBrNFe1.NotasFiscais.Count-1 do
  begin
    with ACBrNFe1.NotasFiscais.Items[n].NFe do
    begin
      if EntradaViaXML then
      begin
        vresult := VerificarDestinatarioNFE(Dest.CNPJCPF);
        if vresult then
          vresult := VerificarEmitenteNFE;

        if vresult then
        begin

          vSerie := inttostr(ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.serie); {qryseriesfornecedores.fieldbyname('serie').AsString;}
          if qryvfornecedores.fieldbyname('tipo').asstring = 'F' then
          begin
            vcodigo := qryFornecedor.fieldbyname('codigo').AsInteger;
            vtipo := 'F';
          end
          else
          begin
            vcodigo := qryvfornecedores.fieldbyname('codigo').asinteger;
            vTipo := qryvfornecedores.fieldbyname('tipo').asString;
          end;

          {
          qrynotafiscal.ParamByName('fornecedor').AsInteger := vcodigo;
          qrynotafiscal.ParamByName('tipofornecedor').AsString := vtipo;
          qrynotafiscal.ParamByName('serie').AsString := vSerie;

          qrynotafiscal.ParamByName('numero').AsInteger := ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF;

          qryProcuraFornecedores.ParamByName('codigo').asinteger := vcodigo;
          qryProcuraFornecedores.ParamByName('tipo').asString := vtipo;

          qryProcuraSeriesFornecedor.ParamByName('fornecedor').asinteger := vcodigo;
          qryProcuraSeriesFornecedor.ParamByName('serie').asString := vSerie;
          qryProcuraSeriesFornecedor.ParamByName('tipo').asString := vtipo;
          }

          incluindoviaXml := false;

          EntrarChavesNota(self);
          if (qryNotaFiscal.State = dsinsert) then
          begin
            qryNotaFiscalfornecedor.AsInteger := vcodigo;
            qryNotaFiscaltipofornecedor.AsString := vtipo;
            qryNotaFiscalserie.AsString := vSerie;

            qryNotaFiscalTipo.asString := 'NFe';

            incluindoviaXml := true;
            ImportarDadosCorpoNFE;
            ImportarDadosVencimentoNFE;
//            ImportarDocumentosReferenciados;
            ImportarProdutosNFE;

          end
          else
          if IncluidoViaXml then
          begin
            ImportarDadosCorpoNFE;
            ImportarDadosVencimentoNFE;
          end;
        end;
      end
      else
        ImportarDadosVencimentoNFE;
    end;
  end;

end;


procedure TdtmCadastroNotasFiscais.qryDuplicatasAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  ExisteDuplicatasemAberto := false;
  GuardarRegistroAtual(qryDuplicatas,true);
  qryduplicatas.first;
  while not qryDuplicatas.Eof do
  begin
    if qryDuplicatasdatapagto.IsNull then
    begin
      ExisteDuplicatasemAberto := true;
      break;
    end;
    qryduplicatas.Next;
  end;
  VoltarRegistroAtual(qryduplicatas);

  if (qryDuplicatas.recordcount <> 0) then
    qryDuplicatas.RequestLive :=  (UsuarioLogin.AlterarDadosContabeis and
                                   not DuplicatasQuitadas) and
                                  (qryNotaFiscaldata.AsDateTime > ParSistema.DataContabil);

end;


procedure TdtmCadastroNotasFiscais.qryProcuraPedidosNFEBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryProcuraPedidosNFE.parambyname('produto').asstring := ifthen((qryProdutosNotasPagNFEItemsproduto.asString=''),'0',qryProdutosNotasPagNFEItemsproduto.asString);
  qryProcuraPedidosNFE.parambyname('codigonota').asinteger := qryNotaFiscalcodigo.asinteger;

end;

procedure TdtmCadastroNotasFiscais.qryNotaFiscalAfterCancel(
  DataSet: TDataSet);
begin
  inherited;
  incluindoviaXml := false;
end;

procedure TdtmCadastroNotasFiscais.dsrProdutosNotasPagNFEItemsDataChange(
  Sender: TObject; Field: TField);
{Var
 vl_qryProdutosNotasPagNFEnumero : integer;
  vl_qryProdutosNotasPagNFEItemsnumero : integer;}


  procedure SituacaoCodigoBarras;
  begin
    if (trim(qryProdutosNotasPagNFEceantrib.AsString)='') or
       (trim(qryProdutosNotasPagNFEceantrib.AsString)='SEM GTIN') then
      ListaErroProdutosNFE('Código de barras duplicado', '', opRemover, loPartialKey, true)
    else
    begin
      RefazConsultaPornome(qrySituacaoProdutosCodigoBarras, ['codigobarras', 'produto'],
                           [qryProdutosNotasPagNFEceantrib.AsString,
                            qryProdutosNotasPagNFEItemsproduto.AsString]);

     if qrySituacaoProdutosCodigoBarras.RecordCount = 0 then
       ListaErroProdutosNFE('Código de barras duplicado', '', opRemover, loPartialKey, true)
     else
     begin
       ListaErroProdutosNFE('Código de barras duplicado ', qrySituacaoProdutosCodigoBarraslistaprodutos.AsString,
                            opAdicionar, loPartialKey, true);
     end;
    end;
  end;


  procedure SituacaoUnidade;
  begin
    if qryProdutosNotasPagNFEItemsdescricaounidadenfe.AsString = '' then
      ListaErroProdutosNFE('Unidade não cadastrada', '', opAdicionar )
    else
      ListaErroProdutosNFE('Unidade não cadastrada', '', opRemover );
  end;

  {
  procedure SituacaoFatorConversao;
  begin
    if qryProdutosNotasPagNFEItemsfatorconversao.AsFloat = 0 then
      ListaErroProdutosNFE('Fator de conversão não cadastrado', opAdicionar)
    else
    begin
      GuardarPosicaoProdutosNotasPagNFE;
      ListaErroProdutosNFE('Fator de conversão não cadastrado', opRemover );
      VoltarPosicaoProdutosNotasPagNFE;
    end;
  end;
  }

  procedure SituacaoProdutosFornecedoresUnidades;
  begin

    if qryProdutosNotasPagNFEItemsfatorconversao.AsFloat = 0 then
      ListaErroProdutosNFE('Fator de conversão não cadastrado', '', opAdicionar)
    else
    begin
      GuardarPosicaoProdutosNotasPagNFE;
      ListaErroProdutosNFE('Fator de conversão não cadastrado', '', opRemover );
      VoltarPosicaoProdutosNotasPagNFE;
    end;

    {
    if (qryProdutosFornecedoresUnidades.recordcount > 1) then
      ListaErroProdutosNFE('A Unidade possui mais de um fator de conversão', opAdicionar, LoCaseInsensitive, false)
    else
      ListaErroProdutosNFE('A Unidade possui mais de um fator de conversão', opRemover, LoCaseInsensitive, false);
    }  

  end;

  procedure SituacaoQuantidade;
  begin
    if qryProdutosNotasPagNFEItemsquantidade.AsFloat <= 0 then
      ListaErroProdutosNFE('A quantidade não pode ser menor ou igual a zero', '', opAdicionar )
    else
      ListaErroProdutosNFE('A quantidade não pode ser menor ou igual a zero', '', opRemover );
  end;

  procedure SituacaoQtdeEstoque;
  begin
    if qryProdutosNotasPagNFEItemsqtdeestoque.asfloat <= 0 then
      ListaErroProdutosNFE('A quantidade convertida não pode ser menor ou igual a zero', '', opAdicionar )
    else
      ListaErroProdutosNFE('A quantidade convertida não pode ser menor ou igual a zero', '', opRemover );
  end;

  function ExisteSituacaoErro: boolean;
  begin
    result := false;
    qryProdutosNotasPagNFEItemsSituacao.First;
    while not qryProdutosNotasPagNFEItemsSituacao.Eof do
    begin
      if qryProdutosNotasPagNFEItemsSituacaoerro.AsBoolean then
      begin
        result := true;
        break;
      end;
      qryProdutosNotasPagNFEItemsSituacao.next;
    end;

  end;

begin
  inherited;
  if Sender = nil then
  begin
    if (field = qryProdutosNotasPagNFEItemsipi) then
    begin

      dsrProdutosNotasPagNFEItems.onDataChange := nil;
      qryProdutosNotasPagNFEItemsdescricaoipi.asString := qryIPIdescricao.asString;

      if qryProdutosNotasPagNFEItemsipi.value <> qryProdutosNotasPagNFEipi.value then
      begin
        qryProdutosNotasPagNFE.Edit;
        qryProdutosNotasPagNFEipi.Value := qryProdutosNotasPagNFEitemsipi.value;
        qryProdutosNotasPagNFEdescricaoipi.value := qryProdutosNotasPagNFEitemsdescricaoipi.value;
        qryProdutosNotasPagNFE.post;
      end;

      SituacaoProduto(true);

      if vLigarEventosProdutosNotasPagNFEItems then
        dsrProdutosNotasPagNFEItems.OnDataChange := dsrProdutosNotasPagNFEItemsDataChange;
    end
    else
    if (field = qryProdutosNotasPagNFEItemsprodutodigitado) then
    begin
      dsrProdutosNotasPagNFEItems.OnDataChange := nil;

      if not visualizandograde then
      begin

        RefazConsultaPorNome(qryProcuraProdutoNotaFiscal, ['produtovisual','caracteristica','valorgrade1','valorgrade2'],
                               [qryProdutosNotasPagNFEItemsprodutodigitado.AsString,
                                null, null, null], true);

        if qryProdutosNotasPagNFEItemsprodutovisual.AsString <> qryProcuraProdutoNotaFiscalprodutovisual.AsString then
          qryProdutosNotasPagNFEItemsprodutovisual.AsString := qryProcuraProdutoNotaFiscalprodutovisual.AsString;

        if qryProdutosNotasPagNFEItemsproduto.AsString <> qryProcuraProdutoNotaFiscalproduto.AsString then
          qryProdutosNotasPagNFEItemsproduto.AsString := qryProcuraProdutoNotaFiscalproduto.AsString;

        if qryProdutosNotasPagNFEItemsdescricaoproduto.AsString <> qryProcuraProdutoNotaFiscaldescricao.AsString then
          qryProdutosNotasPagNFEItemsdescricaoproduto.AsString := qryProcuraProdutoNotaFiscaldescricao.AsString;
      end;


      if qryProcuraNaturezasProdutoNFE.MacroByName('CodigoNaturezaPadrao').AsString <> ' and (naturezas.codigo = ' + IntToStr(qryProdutosNotasPagNFEItemsnatureza.AsInteger) + ') ' then
      begin
        qryProcuraNaturezasProdutoNFE.MacroByName('CodigoNaturezaPadrao').AsString := ' and (naturezas.codigo = ' + IntToStr(qryProdutosNotasPagNFEItemsnatureza.AsInteger) + ') ';
        qryProcuraNaturezasProdutoNFE.close;

      end;
      RefazConsultaPorNome(qryProcuraNaturezasProdutoNFE,['codigofiscal'], [qryProdutosNotasPagNFEItemscodigofiscal.AsVariant], true);

      AtribuirDadosProdutos(qryprodutosNotasPagNFEitems, qryNotaFiscal, qryProcuraNaturezasProdutoNFE, false, NotaEntradaXML);
      AtribuirDadosCalculosImpostos(qryNotaFiscal, qryProcuraProdutoNotaFiscal, qryProcuraNaturezasProdutoNFE, qryProdutosNotasPagNFEitems, NotaEntradaXML, True);

      if (qryProcuraPedidosNFE.RecordCount = 0) or
         (qryProcuraPedidosNFE.parambyname('pedido').asinteger <> qryProdutosNotasPagNFEItemspedido.asinteger) or
         (qryProcuraPedidosNFE.parambyname('produto').asString <> ifthen((qryProdutosNotasPagNFEItemsproduto.asString=''),'0',qryProdutosNotasPagNFEItemsproduto.asString)) or
         (qryProcuraPedidosNFE.parambyname('codigonota').asinteger <> qryNotaFiscalcodigo.asinteger) then

        RefazConsultaPorNome(qryProcuraPedidosNFE, ['pedido','produto','codigonota'],
                             [qryProdutosNotasPagNFEItemspedido.asinteger,
                              ifthen((qryProdutosNotasPagNFEItemsproduto.asString=''),'0',qryProdutosNotasPagNFEItemsproduto.asString),
                              qryNotaFiscalcodigo.asinteger], true);

      qryProdutosNotasPagNFEItemsnumeroprodutonopedido.asVariant := qryProcuraPedidosNFEnumero.asvariant;
      qryProdutosNotasPagNFEItemsprecounitariopedido.asCurrency := qryProcuraPedidosNFEprecounitariopedido.asCurrency;

      VerificarUnidadeNFE;

      {
      if qryProdutosNotasPagNFEItemsunidadenfe.AsString = qryProcuraProdutoNotaFiscalunidade.AsString then
        qryProdutosNotasPagNFEItemsfatorconversao.AsFloat := 1
      else
      }

      if (qryprodutosfornecedoresUnidades.RecordCount = 0) or
         (qryProdutosFornecedoresUnidades.ParamByName('produto').AsString <> qryProdutosNotasPagNFEItemsproduto.AsString) or
         (qryProdutosFornecedoresUnidades.ParamByName('fornecedor').asinteger <> qryNotaFiscalfornecedor.AsInteger) or
         (qryProdutosFornecedoresUnidades.ParamByName('tipofornecedor').asstring <> qryNotaFiscaltipofornecedor.AsString) or
         (qryProdutosFornecedoresUnidades.ParamByName('unidade').asstring <> qryProdutosNotasPagNFEItemsunidadenfe.AsString)  then
//      begin
        RefazConsultaporNome(qryProdutosFornecedoresUnidades, ['produto','fornecedor','tipofornecedor','unidade'],
                         [ifthen(trim(qryProdutosNotasPagNFEItemsproduto.AsString)<>'',qryProdutosNotasPagNFEItemsproduto.AsString, '0'), qryNotaFiscalfornecedor.AsInteger,
                          qryNotaFiscaltipofornecedor.AsString, qryProdutosNotasPagNFEItemsunidadenfe.AsString], true);

      if qryProdutosFornecedoresUnidadesfatorconversao.AsFloat <> 0 then
        qryProdutosNotasPagNFEItemsfatorconversao.AsFloat := qryProdutosFornecedoresUnidadesfatorconversao.AsFloat
      else
        qryProdutosNotasPagNFEItemsfatorconversao.AsFloat := 1;

      qryProdutosNotasPagNFEItemsqtdeestoque.asfloat := FormatarQuantidadeFloat(qryProdutosNotasPagNFEItemsquantidade.AsFloat * qryProdutosNotasPagNFEItemsfatorconversao.AsFloat);

      SituacaoProdutosFornecedoresUnidades;
      SituacaoUnidade;
      SituacaoPedido;
//      SituacaoCodigoBarras;
      SituacaoNLote;
      SituacaoProduto(true);

      if not vAtualizandoCodigoFiscalProdutosNFE then
        if not ExisteSituacaoErro then
          CalcularImpostos;

  //    SalvarProdutosNFE;

      if vLigarEventosProdutosNotasPagNFEItems then
        dsrProdutosNotasPagNFEItems.OnDataChange := dsrProdutosNotasPagNFEItemsDataChange;

    end
    else
    if field = qryProdutosNotasPagNFEItemspedido then
    begin
      dsrProdutosNotasPagNFEItems.OnDataChange := nil;

      if (qryProcuraPedidosNFE.RecordCount = 0) or
         (qryProcuraPedidosNFE.parambyname('pedido').asinteger <> qryProdutosNotasPagNFEItemspedido.asinteger) or
         (qryProcuraPedidosNFE.parambyname('produto').asString <> ifthen((qryProdutosNotasPagNFEItemsproduto.asString=''),'0',qryProdutosNotasPagNFEItemsproduto.asString)) or
         (qryProcuraPedidosNFE.parambyname('codigonota').asinteger <> qryNotaFiscalcodigo.asinteger) then
        RefazConsultaPorNome(qryProcuraPedidosNFE, ['pedido','produto','codigonota'],
                         [qryProdutosNotasPagNFEItemspedido.asinteger,
                          ifthen((qryProdutosNotasPagNFEItemsproduto.asString=''),'0',qryProdutosNotasPagNFEItemsproduto.asString),
                          qryNotaFiscalcodigo.asinteger], true);

      qryProdutosNotasPagNFEItemsnumeroprodutonopedido.asVariant := qryProcuraPedidosNFEnumero.asvariant;
      qryProdutosNotasPagNFEItemsprecounitariopedido.asCurrency := qryProcuraPedidosNFEprecounitariopedido.asCurrency;

      SituacaoPedido;
  //    SalvarProdutosNFE;

      if vLigarEventosProdutosNotasPagNFEItems then
        dsrProdutosNotasPagNFEItems.OnDataChange := dsrProdutosNotasPagNFEItemsDataChange;
    end
    else
    if field = qryProdutosNotasPagNFEItemscodigofiscal then
    begin
      dsrProdutosNotasPagNFEItems.OnDataChange := nil;

      if (qryProcuraNaturezasProdutoNFE.recordcount = 0) or
         (FCodigoFiscalProdutoNFEOriginal <> qryProdutosNotasPagNFEItemscodigofiscal.asinteger) then
        RefazConsultaPorNome(qryProcuraNaturezasProdutoNFE,['codigofiscal'],[qryProdutosNotasPagNFEItemscodigofiscal.AsVariant], true);

      if not QuantidadeNaturezasProdutoNFE then
        SelecionarNaturezaProdutoNFE(qryProcuraNaturezasProdutoNFEcodigo.asinteger, qryProcuraNaturezasProdutoNFEcodigofiscal.asinteger, false);

      SituacaoCodigoFiscal;

      if vLigarEventosProdutosNotasPagNFEItems then
        dsrProdutosNotasPagNFEItems.OnDataChange := dsrProdutosNotasPagNFEItemsDataChange;
    end
    else
    if field = qryProdutosNotasPagNFEItemsdescricaounidadenfe then
    begin
      if field.AsString <> vDescricaoUnidadeAntesEditar then
      begin
        if (field.AsString = '') then
        begin
          MensagemErro('A descrição da unidade não pode ser nula');
          field.AsString := vDescricaoUnidadeAntesEditar;
          SituacaoUnidade;
        end
        else
        begin
          RefazConsultaPorNome(qryUnidades,['unidade'],[qryProdutosNotasPagNFEItemsunidadenfe.AsString], true);
          qryunidades.Edit;
          qryUnidadescodigo.asstring := qryProdutosNotasPagNFEItemsunidadenfe.AsString;
          qryUnidadesdescricao.asstring := qryProdutosNotasPagNFEItemsdescricaounidadenfe.AsString;
          qryunidades.post;

          perpetrar([qryunidades]);

          if qryProdutosNotasPagNFE.active then
          begin
            GuardarPosicaoProdutosNotasPagNFE;

            qryProdutosNotasPagNFE.First;
            while not qryProdutosNotasPagNFE.Eof do
            begin
              if qryProdutosNotasPagNFEuCom.AsString = qryUnidadescodigo.AsString then
              begin
                qryProdutosNotasPagNFEItems.First;
                while not qryProdutosNotasPagNFEItems.Eof do
                begin

                  GuardarPosicaoProdutosNotasPagNFE;
//                  vl_qryProdutosNotasPagNFEnumero := v_qryProdutosNotasPagNFEnumero;
//                  vl_qryProdutosNotasPagNFEItemsnumero := v_qryProdutosNotasPagNFEItemsnumero;

                  qryProdutosNotasPagNFEItems.Edit;
                  qryProdutosNotasPagNFEItemsdescricaounidadenfe.AsString := qryUnidadesdescricao.asstring;
                  qryProdutosNotasPagNFEItems.post;
                  SituacaoUnidade;

                  VoltarPosicaoProdutosNotasPagNFE;

//                  qryProdutosNotasPagNFE.Locate('numero', vl_qryProdutosNotasPagNFEnumero,[]);
//                  qryProdutosNotasPagNFEItems.Locate('numero', vl_qryProdutosNotasPagNFEItemsnumero,[]);

                  qryProdutosNotasPagNFEItems.Next;
                end;
              end;
              qryProdutosNotasPagNFE.Next;
            end;

            VoltarPosicaoProdutosNotasPagNFE;
          end;


        end;
      end;
    end
    else
    if field = qryProdutosNotasPagNFEItemsfatorconversao then
    begin
      if vFatorConversaoAntesEditar <> qryProdutosNotasPagNFEItemsfatorconversao.AsFloat then
      begin
        if (field.AsCurrency = 0) then
        begin
          MensagemErro('O Fator de conversão deve ser maior do que zero');
          qryProdutosNotasPagNFEItems.edit;
          field.AsFloat := vFatorConversaoAntesEditar;
        end;

        if qryProdutosNotasPagNFEItemsqtdeestoque.asfloat <> FormatarQuantidadeFloat(qryProdutosNotasPagNFEItemsquantidade.AsFloat * qryProdutosNotasPagNFEItemsfatorconversao.AsFloat) then
        begin
          qryProdutosNotasPagNFEItems.edit;
          qryProdutosNotasPagNFEItemsqtdeestoque.asfloat := FormatarQuantidadeFloat(qryProdutosNotasPagNFEItemsquantidade.AsFloat * qryProdutosNotasPagNFEItemsfatorconversao.AsFloat);
        end;

        SituacaoProdutosFornecedoresUnidades;
//        SituacaoFatorConversao;
      end;
    end
    else
    if field = qryProdutosNotasPagNFEItemsqtdeestoque then
    begin
      if (field.AsCurrency = 0) then
      begin
        MensagemErro('A quantidade em estoque deve ser maior do que zero');
        qryProdutosNotasPagNFEItems.edit;
        field.AsCurrency := vQtdeEstoqueAntesEditar;
      end;
      SituacaoQtdeEstoque;
    end
    else
    if field = qryProdutosNotasPagNFEItemsnlote then
      SituacaoNLote
    else
    if field = qryProdutosNotasPagNFEItemsquantidade then
    begin
    {
      if ((field.AsFloat > qryProdutosNotasPagNFEsaldoquantidade.AsFloat) and  (qryProdutosNotasPagNFEsaldoquantidade.AsFloat <> 0)) then
      begin
        MensagemErro(format('A quantidade ultrapassou o saldo de %s',[qryProdutosNotasPagNFEsaldoquantidade.AsString]));
        field.AsFloat := qryProdutosNotasPagNFEsaldoquantidade.AsFloat;
      end
      else
      if ((field.AsFloat > qryProdutosNotasPagNFEquantidade.AsFloat) and  (qryProdutosNotasPagNFEsaldoquantidade.AsFloat = 0)) then
      begin
        MensagemErro(format('A quantidade ultrapassou o saldo de %s',[qryProdutosNotasPagNFEquantidade.AsString]));
        field.AsFloat := qryProdutosNotasPagNFEquantidade.AsFloat;
      end;
     }
      if (field.AsFloat > SaldoQuantidade) then
        if FSaldoQuantidade > 0 then
        begin
          MensagemErro(format('A quantidade ultrapassou o saldo de %s',[FloattoStr(FSaldoQuantidade)]));
{          qryProdutosNotasPagNFEItems.edit;
          field.AsFloat := SaldoQuantidade;}
        end;

      if qryProdutosNotasPagNFEItemsqtdeestoque.asfloat <> FormatarQuantidadeFloat(qryProdutosNotasPagNFEItemsquantidade.AsFloat * qryProdutosNotasPagNFEItemsfatorconversao.AsFloat) then
      begin
        qryProdutosNotasPagNFEItems.edit;
        qryProdutosNotasPagNFEItemsqtdeestoque.asfloat := FormatarQuantidadeFloat(qryProdutosNotasPagNFEItemsquantidade.AsFloat * qryProdutosNotasPagNFEItemsfatorconversao.AsFloat);
      end;

      SituacaoQuantidade;
    end;

  end;

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEItemsAfterScroll(
  DataSet: TDataSet);
begin
  inherited;

  FCodigoFiscalProdutoNFEOriginal := qryProdutosNotasPagNFeItemscodigofiscal.AsInteger;
  FCodigoNaturezaProdutoNFEOriginal := qryProdutosNotasPagNFEItemsnatureza.AsInteger;
  FProdutosNotasPagNFEItemsproduto :=  qryProdutosNotasPagNFEItemsproduto.aslargeint;
  FProdutosNotasPagNFEItemsprodutovisual :=  qryProdutosNotasPagNFEItemsprodutovisual.asstring;
  fProdutosNotasPagNFEItemspedido :=  qryProdutosNotasPagNFEItemspedido.asinteger;

  PosicionarProdutosNotaFiscalPorProdutosNFE;

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFENewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryProdutosNotasPagNFERegistroSemErro.asboolean := false;
  qryProdutosNotasPagNFEAlerta.asboolean := false;
  qryProdutosNotasPagNFEcodigonota.asinteger := qryNotaFiscalcodigo.AsInteger;
  qryProdutosNotasPagNFEfatorconversao.asFloat := 1;

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEItemsNewRecord(
  DataSet: TDataSet);
begin
  inherited;

  qryProdutosNotasPagNFEItemsRegistroSemErro.asboolean := false;
  qryProdutosNotasPagNFEItemsAlerta.asboolean := false;
  qryProdutosNotasPagNFEItemscodigonota.AsInteger := qryNotaFiscalcodigo.AsInteger;
  qryProdutosNotasPagNFEItemsnumerosequencianfe.AsInteger := qryProdutosNotasPagNFEnumero.AsInteger;
  qryProdutosNotasPagNFEItemsnumero.AsInteger := ProdutosNotasPagNFEItems_proximocodigo;

  if qryProdutosNotasPagNFELotes.recordcount > 1 then
  begin
    qryProdutosNotasPagNFELotes.GuardarRegistroAtual(false, false);
    qryProdutosNotasPagNFELotes.first;
    while not qryProdutosNotasPagNFELotes.eof do
    begin
      if qryProdutosNotasPagNFELotesSaldo.asCurrency > 0 then
      begin
        qryProdutosNotasPagNFEItemsquantidade.AsFloat := qryProdutosNotasPagNFELotesSaldo.asCurrency;
        qryProdutosNotasPagNFEItemsnlote.asString := qryProdutosNotasPagNFELotesnlote.asString;
        break;
      end;
      qryProdutosNotasPagNFELotes.VoltarRegistro;
      qryProdutosNotasPagNFELotes.next;
    end;
    qryProdutosNotasPagNFELotes.VoltarRegistro;
  end
  else
  begin
    qryProdutosNotasPagNFEItemsquantidade.AsFloat := qryProdutosNotasPagNFEsaldoquantidade.AsFloat;

    if qryProdutosNotasPagNFELotesnlote.asString<>'' then
      qryProdutosNotasPagNFEItemsnlote.AsString := qryProdutosNotasPagNFELotesnlote.asString
    else
      qryProdutosNotasPagNFEItemsnlote.clear;

  end;

  qryProdutosNotasPagNFEItemsprecounitario.AsFloat := qryProdutosNotasPagNFEvalortotal.AsFloat/qryProdutosNotasPagNFEqtdeestoque.AsFloat;

  //qryProdutosNotasPagNFEItemsquantidade.AsFloat := qryProdutosNotasPagNFEquantidadeselecionada.AsFloat;


  qryProdutosNotasPagNFEItemsunidadenfe.AsString := qryProdutosNotasPagNFEuCom.AsString;
  qryProdutosNotasPagNFEItemsdescricaounidadenfe.AsString := qryProdutosNotasPagNFEItemsunidadenfe.AsString;

  qryProdutosNotasPagNFEItemsfatorconversao.AsFloat := 1;
 // AtribuirDadosNaturezaNotaFiscal;
  SelecionarDadosNatureza(qryProcuraNaturezas, qryProdutosNotasPagNFEItems);
  FCodigoFiscalProdutoNFEOriginal := qryProdutosNotasPagNFEItemscodigofiscal.asinteger;

  qryProdutosNotasPagNFEItemsncmfornecedor.asString := qryProdutosNotasPagNFEncmfornecedor.asString;

  if parsistema.AtualizarNCMNotaEntrada then
  begin
    if qryProdutosNotasPagNFEipi.asinteger <> 0 then
    begin
      qryProdutosNotasPagNFEItemsipi.value := qryProdutosNotasPagNFEipi.value;
      qryProdutosNotasPagNFEItemsdescricaoipi.value := qryProdutosNotasPagNFEdescricaoipi.value;
    end
    else
    begin
      qryProdutosNotasPagNFEItemsipi.clear;
      qryProdutosNotasPagNFEItemsdescricaoipi.clear;
    end;
  end;

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEItemsSituacaoFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  if qryProdutosNotasPagNFEItemsSituacao.filtered then
  begin
    case vTipoFiltroSituacao of
      SituacaoComErro : Accept := qryProdutosNotasPagNFEItemsSituacaoerro.asboolean;
      SituacaoComAlerta : Accept := not qryProdutosNotasPagNFEItemsSituacaoerro.asboolean;
      numerosequencianfe : Accept := (qryProdutosNotasPagNFEItemsSituacaonumerosequencianfe.asstring = qryProdutosNotasPagNFEnumero.asstring) and qryProdutosNotasPagNFEItemsSituacaoerro.asboolean;
      numerosequencianfeAlerta : Accept := (qryProdutosNotasPagNFEItemsSituacaonumerosequencianfe.asstring = qryProdutosNotasPagNFEnumero.asstring) and not qryProdutosNotasPagNFEItemsSituacaoerro.asboolean;
    end;
  end;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEItemsCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryProdutosNotasPagNFEItemsvalortotal.Asfloat := roundto(qryProdutosNotasPagNFEItemsquantidade.asfloat *
                                                            qryProdutosNotasPagNFEItemsprecounitario.AsFloat, -2);
  if qryProdutosNotasPagNFEItemsfatorconversao.AsFloat <> 0 then
    qryProdutosNotasPagNFEItemsPrecoUnitarioFatorizado.AsFloat := qryProdutosNotasPagNFEItemsPrecoUnitario.AsFloat / qryProdutosNotasPagNFEItemsfatorconversao.AsFloat
  else
    qryProdutosNotasPagNFEItemsPrecoUnitarioFatorizado.AsFloat := qryProdutosNotasPagNFEItemsPrecoUnitario.AsFloat;


  if qryProdutosNotasPagNFEItemsprecounitariopedido.asFloat <> 0 then
    qryProdutosNotasPagNFEItemspercUnitario_x_Pedido.asFloat := (qryProdutosNotasPagNFEItemsPrecoUnitarioFatorizado.asFloat * 100 / qryProdutosNotasPagNFEItemsprecounitariopedido.asFloat) - 100
  else
    qryProdutosNotasPagNFEItemspercUnitario_x_Pedido.asFloat := 0;

end;

procedure TdtmCadastroNotasFiscais.qryProcuraNaturezasBeforeClose(
  DataSet: TDataSet);
  var i: integer;
begin
  inherited;
  i:= 1 ;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEItemsSituacaoNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryProdutosNotasPagNFEItemsSituacaocodigonota.AsInteger := qryNotaFiscalcodigo.AsInteger;
  qryProdutosNotasPagNFEItemsSituacaonumerosequencianfe.AsInteger := qryProdutosNotasPagNFEnumero.AsInteger;
  qryProdutosNotasPagNFEItemsSituacaonumerosequencianfeitens.asinteger := qryProdutosNotasPagNFEItemsnumero.AsInteger;
  qryProdutosNotasPagNFEItemsSituacaonumero.asinteger := ProdutosNotasPagNFEItemsSituacao_proximocodigo;

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  EditarNotaFiscal
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEItemsAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  EditarNotaFiscal;

  qryProdutosNotasPagNFEItems.AfterPost := nil;

  if CampoProdutosNotasPagNFEItemsAlterado = qryProdutosNotasPagNFEItemsfatorconversao then
  begin
    GuardarPosicaoProdutosNotasPagNFE;
    dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemsfatorconversao);
    VoltarPosicaoProdutosNotasPagNFE;
    VerificarValoresProdutosNotasPagNFEItems;
  end
  else
  if CampoProdutosNotasPagNFEItemsAlterado = qryProdutosNotasPagNFEItemsdescricaounidadenfe then
  begin
    dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemsdescricaounidadenfe);
  end
  else
  if CampoProdutosNotasPagNFEItemsAlterado = qryProdutosNotasPagNFEItemsquantidade then
  begin
    GuardarPosicaoProdutosNotasPagNFE;
    dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemsquantidade);
    VoltarPosicaoProdutosNotasPagNFE;
    VerificarValoresProdutosNotasPagNFEItems;
  end
  else
  if CampoProdutosNotasPagNFEItemsAlterado = qryProdutosNotasPagNFEItemsqtdeestoque then
  begin
    dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemsqtdeestoque);
  end
  else
  if CampoProdutosNotasPagNFEItemsAlterado = qryProdutosNotasPagNFEItemsnlote then
  begin
    GuardarPosicaoProdutosNotasPagNFE;
    dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemsnlote);
    VoltarPosicaoProdutosNotasPagNFE;
    VerificarValoresProdutosNotasPagNFEItems;
  end
  else
  begin
    if VisualizandoGrade then
    begin
      GuardarPosicaoProdutosNotasPagNFE;
      dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemsprodutodigitado);
      VoltarPosicaoProdutosNotasPagNFE;
      qryProdutosNotasPagNFEItems.AfterPost := nil;
    end
    else
    begin

      GuardarPosicaoProdutosNotasPagNFE;
      dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemsprodutodigitado);
      VoltarPosicaoProdutosNotasPagNFE;
      qryProdutosNotasPagNFEItems.AfterPost := nil;

      GuardarPosicaoProdutosNotasPagNFE;
      dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemspedido);
      VoltarPosicaoProdutosNotasPagNFE;
      qryProdutosNotasPagNFEItems.AfterPost := nil;

      GuardarPosicaoProdutosNotasPagNFE;
      dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemscodigofiscal);
      VoltarPosicaoProdutosNotasPagNFE;
      qryProdutosNotasPagNFEItems.AfterPost := nil;
    end;
    
    VerificarValoresProdutosNotasPagNFEItems;
  end;

  if vLigarEventosProdutosNotasPagNFEItems then
    qryProdutosNotasPagNFEItems.AfterPost := qryProdutosNotasPagNFEItemsAfterPost;

  if qryProdutosNotasPagNFE.active then
    if qryProdutosNotasPagNFE.State = dsedit then
      qryProdutosNotasPagNFE.Post;

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEItemsAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  EditarNotaFiscal;

  qryProdutosNotasPagNFEItems.AfterPost := nil;
  VerificarValoresProdutosNotasPagNFEItems;

  if vLigarEventosProdutosNotasPagNFEItems then
    qryProdutosNotasPagNFEItems.AfterPost := qryProdutosNotasPagNFEItemsAfterPost;

  qryProdutosNotasPagNFEAfterScroll(nil);

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEItemsBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  GuardarPosicaoProdutosNotasPagNFE;
  VerificarProdutosNotaFiscalPorProdutosNFE(opRemover);
  VoltarPosicaoProdutosNotasPagNFE;
  qryProdutosNotasPagNFEItemsSituacao.first;
  while not qryProdutosNotasPagNFEItemsSituacao.eof do
    qryProdutosNotasPagNFEItemsSituacao.delete;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  qryProdutosNotasPagNFEItems.first;
  while not qryProdutosNotasPagNFEItems.eof do
    qryProdutosNotasPagNFEItems.delete; 

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEItemsAfterCancel(
  DataSet: TDataSet);
begin
  inherited;
  qryProdutosNotasPagNFEItems.AfterPost := nil;

  if qryProdutosNotasPagNFE.active then
    if qryProdutosNotasPagNFE.state = dsedit then
      qryProdutosNotasPagNFE.cancel;

//  VerificarValoresProdutosNotasPagNFEItems;

  if vLigarEventosProdutosNotasPagNFEItems then
    qryProdutosNotasPagNFEItems.AfterPost := qryProdutosNotasPagNFEItemsAfterPost;

end;

procedure TdtmCadastroNotasFiscais.VerificarProdutosNotaFiscalPorProdutosNFE(operacao: TipoOperacaoErroProdutoNFE;
                                                               ReatualizarProduto: boolean = false; TodosItems: boolean = false);
  function IcmsBaseCalculo: Currency;
  begin
    result := qryProdutosNotaFiscalprodutototal.ascurrency
              - qryProdutosNotaFiscalvalordescontoitem.AsCurrency
              - qryProdutosNotaFiscaldesconto.AsCurrency
              + qryProdutosNotaFiscalfrete.AsCurrency
              + qryProdutosNotaFiscalseguro.AsCurrency
              + ifthen(qryProdutosNotaFiscalICMSSobreIPI.AsBoolean, qryProdutosNotaFiscalvaloripi.ascurrency,0)
              + ifthen(qryProdutosNotaFiscalicmssobredespesasacessorias.AsBoolean, qryProdutosNotaFiscaldespesasacessorias.ascurrency,0);

  end;

  function IcmsBaseCalculoST: Currency;
  begin
    result := (IcmsBaseCalculo + ifthen(qryProdutosNotaFiscalICMSSobreIPI.AsBoolean, 0, qryProdutosNotaFiscalvaloripi.ascurrency)) *
              qryProdutosNotaFiscalfatorsubstituicao.AsCurrency;
  end;


  procedure VerificarSaldosdeRateio;
  var
    vRegistroAtual: TbookMark;
    vEncontrouTodosProdutos: boolean;

    vTotalvalorreducaobase,
    vTotalicmsbasecalculo,
    vTotalicmsvalor,
    vTotalreducaobasest,
    vTotalicmsbasecalculost,
    vTotalicmsvalorst,
    vTotalvcredicmssn,
    vTotalDesconto,
    vTotalprodutototal,
    vTotaldespesasacessorias,
    vTotalfrete,
    vTotalSeguro,
    vTotalQuantidade : Currency;


    vDiferencavalorreducaobase,
    vDiferencaicmsbasecalculo,
    vDiferencaicmsvalor,
{    vDiferencareducaobasest,}
    vDiferencaicmsbasecalculost,
    vDiferencaicmsvalorst,
    vDiferencavcredicmssn,
    vDiferencaDesconto,
    vDiferencaprodutototal,
    vDiferencadespesasacessorias,
    vDiferencafrete,
    vDiferencaSeguro : Currency;

  begin
    vRegistroAtual := qryProdutosNotasPagNFEitems.GetBookmark;
    vTotalvalorreducaobase := 0;
    vTotalicmsbasecalculo := 0;
    vTotalicmsvalor := 0;
    vTotalreducaobasest := 0;
    vTotalicmsbasecalculost := 0;
    vTotalicmsvalorst := 0;
    vTotalvcredicmssn := 0;
    vTotalDesconto := 0;
    vTotalprodutototal := 0;
    vTotaldespesasacessorias := 0;
    vTotalfrete := 0;
    vTotalSeguro  := 0;
    vTotalQuantidade := 0;

    vEncontrouTodosProdutos := true;

    qryProdutosNotasPagNFEItems.first;
    while not qryProdutosNotasPagNFEItems.eof do
    begin
      if qryProdutosNotaFiscal.Locate('numerosequencianfe;numerosequencianfeitens', VarArrayOf([qryProdutosNotasPagNFEItemsnumerosequencianfe.AsInteger, qryProdutosNotasPagNFEItemsnumero.AsInteger]),[]) then
      begin
        vTotalvalorreducaobase := vTotalvalorreducaobase + qryProdutosNotaFiscalvalorreducaobase.AsCurrency;
        vTotalicmsbasecalculo := vTotalicmsbasecalculo + qryProdutosNotaFiscalicmsbasecalculo.AsCurrency;
        vTotalicmsvalor := vTotalicmsvalor + qryProdutosNotaFiscalicmsvalor.AsCurrency;
        vTotalreducaobasest := vTotalreducaobasest + qryProdutosNotaFiscalreducaobasest.AsCurrency;
        vTotalicmsbasecalculost := vTotalicmsbasecalculost + qryProdutosNotaFiscalicmsbasecalculost.AsCurrency;
        vTotalicmsvalorst := vTotalicmsvalorst + qryProdutosNotaFiscalicmsvalorst.AsCurrency;
        vTotalvcredicmssn := vTotalvcredicmssn + qryProdutosNotaFiscalvcredicmssn.AsCurrency;
        vTotalDesconto := vTotalDesconto + qryProdutosNotaFiscaldesconto.AsCurrency;
        vTotalprodutototal := vTotalprodutototal + qryProdutosNotaFiscalprodutototal.AsCurrency;
        vTotaldespesasacessorias := vTotaldespesasacessorias + qryProdutosNotaFiscaldespesasacessorias.AsCurrency;
        vTotalfrete  := vTotalfrete + qryProdutosNotaFiscalfrete.AsCurrency;
        vTotalSeguro  := vTotalSeguro + qryProdutosNotaFiscalseguro.AsCurrency;

      end
      else
      begin
        vEncontrouTodosProdutos := false;
        break;
      end;

      vTotalQuantidade := vTotalQuantidade + qryProdutosNotasPagNFEItemsquantidade.AsFloat;

      qryProdutosNotasPagNFEItems.Next
    end;

    if vEncontrouTodosProdutos and (vTotalQuantidade = qryProdutosNotasPagNFEquantidade.AsFloat) then
    begin
      if CondicaoPRedBC(qryProdutosNotaFiscalcst_nf.asstring, qryProdutosNotaFiscalcsosn_nf.asstring, qrynotafiscalcrt.asinteger) and
         (vTotalvalorreducaobase <> 0) then
        vDiferencavalorreducaobase := vTotalvalorreducaobase - (qryProdutosNotasPagNFEvalortotal.AsCurrency
                                                                 + qryProdutosNotasPagNFEvFrete.AsCurrency   {Atenção a necessidade de parametro qdo não for icms sobre frete }
                                                                 - qryProdutosNotasPagNFEdesconto.AsCurrency
                                                                 - qryProdutosNotasPagNFEvBCICMS.AsCurrency )
      else
        vDiferencavalorreducaobase := 0;

      vDiferencaicmsbasecalculo := vTotalicmsbasecalculo - qryProdutosNotasPagNFEvBCICMS.AsCurrency;
      vDiferencaicmsvalor := vTotalicmsvalor - qryProdutosNotasPagNFEvICMS.AsCurrency;

      {
      if qryProdutosNotasPagNFEpRedBCST.AsCurrency <> 0 then
        vDiferencareducaobasest := vTotalreducaobasest - (icmsbasecalculost - qryProdutosNotasPagNFEvBCICMSST.AsCurrency)
      else
        vDiferencareducaobasest := 0;
      }

      vDiferencaicmsbasecalculost := vTotalicmsbasecalculost - qryProdutosNotasPagNFEvBCICMSST.AsCurrency;
      vDiferencaicmsvalorst := vTotalicmsvalorst - qryProdutosNotasPagNFEvICMSST.AsCurrency;
      vDiferencavcredicmssn := vTotalvcredicmssn - qryProdutosNotasPagNFEvCredICMSSN.AsCurrency;
      vDiferencaDesconto := vTotalDesconto - qryProdutosNotasPagNFEdesconto.AsCurrency;
      vDiferencaprodutototal := vTotalprodutototal -  qryProdutosNotasPagNFEvalortotal.AsCurrency;

      vDiferencadespesasacessorias := vTotaldespesasacessorias - qryProdutosNotasPagNFEdespesasacessorias.AsCurrency;
      vDiferencafrete := vTotalfrete - qryProdutosNotasPagNFEvFrete.AsCurrency;
      vDiferencaSeguro := vTotalSeguro - qryProdutosNotasPagNFEvSeg.AsCurrency;


      if (vDiferencavalorreducaobase <> 0) or
         (vDiferencaicmsbasecalculo <> 0) or
         (vDiferencaicmsvalor <> 0) or
{         (vDiferencareducaobasest <> 0) or}
         (vDiferencaicmsbasecalculost <> 0) or
         (vDiferencaicmsvalorst <> 0) or
         (vDiferencavcredicmssn <> 0) or
         (vDiferencaDesconto <> 0) or
         (vDiferencaprodutototal <>0) or
         (vDiferencadespesasacessorias <>0) or
         (vDiferencafrete <>0) or
         (vDiferencaSeguro <>0) then
      begin
        qryProdutosNotaFiscal.Edit;
        qryProdutosNotaFiscalvalorreducaobase.AsCurrency := qryProdutosNotaFiscalvalorreducaobase.AsCurrency - vDiferencavalorreducaobase ;
        qryProdutosNotaFiscalicmsbasecalculo.AsCurrency := qryProdutosNotaFiscalicmsbasecalculo.AsCurrency - vDiferencaicmsbasecalculo ;
        qryProdutosNotaFiscalicmsvalor.AsCurrency := qryProdutosNotaFiscalicmsvalor.AsCurrency - vDiferencaicmsvalor;
{        qryProdutosNotaFiscalreducaobasest.AsCurrency := qryProdutosNotaFiscalreducaobasest.AsCurrency - vDiferencareducaobasest;}
        qryProdutosNotaFiscalicmsbasecalculost.AsCurrency := qryProdutosNotaFiscalicmsbasecalculost.AsCurrency - vDiferencaicmsbasecalculost;
        qryProdutosNotaFiscalicmsvalorst.AsCurrency := qryProdutosNotaFiscalicmsvalorst.AsCurrency - vDiferencaicmsvalorst;
        qryProdutosNotaFiscalvcredicmssn.AsCurrency := qryProdutosNotaFiscalvcredicmssn.AsCurrency - vDiferencavcredicmssn;
        qryProdutosNotaFiscaldesconto.AsCurrency := qryProdutosNotaFiscaldesconto.AsCurrency - vDiferencaDesconto;
        qryProdutosNotaFiscalprodutototal.AsCurrency := qryProdutosNotaFiscalprodutototal.AsCurrency - vDiferencaprodutototal;
        qryProdutosNotaFiscaldespesasacessorias.AsCurrency := qryProdutosNotaFiscaldespesasacessorias.AsCurrency - vDiferencadespesasacessorias;
        qryProdutosNotaFiscalfrete.AsCurrency := qryProdutosNotaFiscalfrete.AsCurrency - vDiferencafrete;
        qryProdutosNotaFiscalseguro.AsCurrency := qryProdutosNotaFiscalseguro.AsCurrency - vDiferencaSeguro;

        PostProdutosNotaFiscal;
      end;

      if (qryProdutosNotaFiscal.state in [dsinsert, dsedit]) then
        PostProdutosNotaFiscal;

    end;
    qryProdutosNotasPagNFEitems.GotoBookmark(vRegistroAtual);
    qryProdutosNotasPagNFEitems.FreeBookmark(vRegistroAtual);


  end;

  procedure AtribuirProdutosNotasPag_daNFE(operacao: TtecOperacao);
  begin
    dsrProdutosNotaFiscal.OnDataChange := nil;
    qryprodutosnotafiscal.AfterInsert := nil;
    qryProdutosNotaFiscalproduto.OnChange := nil;
    case operacao of
      topINSERT : qryProdutosNotaFiscal.Append;
      topUPDATE : qryProdutosNotaFiscal.edit;
    end;
    qryProdutosNotaFiscalprodutook.AsBoolean := true;
    qryProdutosNotaFiscalproduto.AsString := qryProdutosNotasPagNFEItemsproduto.AsString;
    qryProdutosNotaFiscalprodutovisual.AsString := qryProdutosNotasPagNFEItemsprodutovisual.AsString;

    if qryProdutosNotasPagNFEItemsnLote.AsString<>'' then
    begin
//      qryProdutosNotaFiscalnLote.AsString  := qryProdutosNotasPagNFEItemsnLote.AsString;
      qryProdutosNotaFiscalnrLote.AsString := qryProdutosNotasPagNFEItemsnLote.AsString;
    end
    else
    begin
//      qryProdutosNotaFiscalnLote.clear;
      qryProdutosNotaFiscalnrLote.clear;
    end;

    if qryProdutosNotasPagNFELotes.locate('nlote', qryProdutosNotasPagNFEItemsnLote.AsString, []) then
    begin
//      qryProdutosNotaFiscaldfab.AsDateTime := qryProdutosNotasPagNFELotesdfab.AsDateTime;
//      qryProdutosNotaFiscaldval.AsDateTime := qryProdutosNotasPagNFELotesdval.AsDateTime;
      qryProdutosNotaFiscalfabricacao.AsDateTime := qryProdutosNotasPagNFELotesdfab.AsDateTime;
      qryProdutosNotaFiscalvalidade.AsDateTime := qryProdutosNotasPagNFELotesdval.AsDateTime;
    end;

    if parsistema.AtualizarNCMNotaEntrada then
      qryProdutosNotaFiscalipi.asinteger := qryProdutosNotasPagNFEipi.AsInteger;

    qryProdutosNotaFiscalnumerosequencianfe.AsInteger := qryProdutosNotasPagNFEItemsnumerosequencianfe.AsInteger;
    qryProdutosNotaFiscalnumerosequencianfeitens.AsInteger := qryProdutosNotasPagNFEItemsnumero.AsInteger;

    if not visualizandograde or
    
      (visualizandograde and
       ((CampoProdutosNotasPagNFEItemsAlterado=nil) or
        (CampoProdutosNotasPagNFEItemsAlterado.fieldname <> 'quantidade'))
      )   then
    begin
      qryProcuraNaturezasProdutoNFE.MacroByName('CodigoNaturezaPadrao').AsString := ' and (naturezas.codigo = ' + IntToStr(qryProdutosNotasPagNFEItemsnatureza.AsInteger) + ') ';
      RefazConsultaPorNome(qryProcuraNaturezasProdutoNFE,['codigofiscal'],[qryProdutosNotasPagNFEItemscodigofiscal.AsVariant]);
      AtribuirDadosProdutos(qryprodutosNotaFiscal, qryNotaFiscal, qryProcuraNaturezasProdutoNFE, false, NotaEntradaXML);
      AtribuirDadosCalculosImpostos(qryNotaFiscal, qryProcuraProdutoNotaFiscal, qryProcuraNaturezasProdutoNFE, qryProdutosNotaFiscal, NotaEntrada, false);
    end;


    if (qryProdutosNotasPagNFEcsosn.AsString='0') or
       (qryProdutosNotasPagNFEcsosn.AsString='') or
       qryProdutosNotasPagNFEcsosn.isnull then
      qryProdutosNotaFiscalcst_nf.AsString := qryProdutosNotasPagNFEcsticms.AsString;

    qryProdutosNotaFiscalorigem.AsInteger := qryProdutosNotasPagNFEorig.AsInteger;

    if not qryProdutosNotasPagNFEmodBC.isnull then
      qryProdutosNotaFiscalicmsmodalidade.AsInteger := qryProdutosNotasPagNFEmodBC.AsInteger;

    qryProdutosNotaFiscalpercentualreducaobase.AsCurrency := qryProdutosNotasPagNFEpRedBC.AsCurrency;

    qryProdutosNotaFiscalicmsbasecalculo.AsCurrency := RatearValores(qryProdutosNotasPagNFEvBCICMS.AsCurrency, qryProdutosNotasPagNFEqtdeestoque.AsFloat, qryProdutosNotasPagNFEItemsquantidade.AsFloat);

    qryProdutosNotaFiscalaliquotaicms.AsCurrency := qryProdutosNotasPagNFEpICMS.AsCurrency;
    qryProdutosNotaFiscalicmsvalor.AsCurrency := RatearValores(qryProdutosNotasPagNFEvICMS.AsCurrency, qryProdutosNotasPagNFEqtdeestoque.AsFloat, qryProdutosNotasPagNFEItemsquantidade.AsFloat);
    qryProdutosNotaFiscaldesconto.AsCurrency := RatearValores(qryProdutosNotasPagNFEdesconto.AsCurrency, qryProdutosNotasPagNFEqtdeestoque.AsFloat, qryProdutosNotasPagNFEItemsquantidade.AsFloat);
    qryProdutosNotaFiscaldespesasacessorias.AsCurrency := RatearValores(qryProdutosNotasPagNFEdespesasacessorias.AsCurrency, qryProdutosNotasPagNFEqtdeestoque.AsFloat, qryProdutosNotasPagNFEItemsquantidade.AsFloat);
    qryProdutosNotaFiscalfrete.AsCurrency := RatearValores(qryProdutosNotasPagNFEvFrete.AsCurrency, qryProdutosNotasPagNFEqtdeestoque.AsFloat, qryProdutosNotasPagNFEItemsquantidade.AsFloat);
    qryProdutosNotaFiscalseguro.AsCurrency := RatearValores(qryProdutosNotasPagNFEvSeg.AsCurrency, qryProdutosNotasPagNFEqtdeestoque.AsFloat, qryProdutosNotasPagNFEItemsquantidade.AsFloat);

    if not qryProdutosNotasPagNFEmodbcst.isnull then
      qryProdutosNotaFiscalicmsmodsubst.AsInteger := qryProdutosNotasPagNFEmodbcst.AsInteger;

    qryProdutosNotaFiscalpMVAST.AsCurrency := qryProdutosNotasPagNFEpMVAST.AsCurrency;
    if qryProdutosNotasPagNFEpMVAST.AsCurrency <> 0 then
      qryProdutosNotaFiscalfatorsubstituicao.AsCurrency := 1+(qryProdutosNotasPagNFEpMVAST.AsCurrency/100)
    else
      qryProdutosNotaFiscalfatorsubstituicao.AsCurrency := 0;

    qryProdutosNotaFiscalpredbcst.AsCurrency := qryProdutosNotasPagNFEpRedBCST.AsCurrency;

    qryProdutosNotaFiscalicmsbasecalculost.AsCurrency := RatearValores(qryProdutosNotasPagNFEvBCICMSST.AsCurrency, qryProdutosNotasPagNFEqtdeestoque.AsFloat, qryProdutosNotasPagNFEItemsquantidade.AsFloat);
    qryProdutosNotaFiscalaliquotaicmsst.AsCurrency := qryProdutosNotasPagNFEpICMSST.AsCurrency;
    qryProdutosNotaFiscalicmsvalorst.AsCurrency := RatearValores(qryProdutosNotasPagNFEvICMSST.AsCurrency, qryProdutosNotasPagNFEqtdeestoque.AsFloat, qryProdutosNotasPagNFEItemsquantidade.AsFloat);


    if (qryProdutosNotasPagNFEcsosn.AsString<>'0') and
       (qryProdutosNotasPagNFEcsosn.AsString<>'') and
       not qryProdutosNotasPagNFEcsosn.isnull then
      qryProdutosNotaFiscalcsosn_nf.AsString := qryProdutosNotasPagNFEcsosn.AsString
    else
      qryProdutosNotaFiscalcsosn_nf.clear;

    qryProdutosNotaFiscalpcredsn.AsCurrency := qryProdutosNotasPagNFEpCredSN.AsCurrency;
    qryProdutosNotaFiscalvcredicmssn.AsCurrency := RatearValores(qryProdutosNotasPagNFEvCredICMSSN.AsCurrency, qryProdutosNotasPagNFEqtdeestoque.AsFloat, qryProdutosNotasPagNFEItemsquantidade.AsFloat);


    qryProdutosNotaFiscalquantidade.AsFloat := qryProdutosNotasPagNFEItemsquantidade.AsFloat;
    qryProdutosNotaFiscalunidadenf.AsString := qryProdutosNotasPagNFEItemsunidadenfe.AsString;
    qryProdutosNotaFiscalfatorconversao.AsFloat := qryProdutosNotasPagNFEItemsfatorconversao.AsFloat;
    qryProdutosNotaFiscalqtdeestoque.asfloat := qryProdutosNotasPagNFEItemsqtdeestoque.asfloat;
    qryProdutosNotaFiscalprecounitario.AsFloat := qryProdutosNotasPagNFEItemsprecounitario.AsFloat;

    qryProdutosNotaFiscalprodutototal.Ascurrency := RatearValores(qryProdutosNotasPagNFEvalortotal.AsCurrency, qryProdutosNotasPagNFEqtdeestoque.AsFloat, qryProdutosNotasPagNFEItemsquantidade.AsFloat);
{
    qryProdutosNotaFiscalprodutototal.AsFloat := RoundTo(
                    (qryProdutosNotaFiscalprecounitario.asFloat *
                      qryProdutosNotaFiscalquantidade.AsFloat), -2);
}

    if qryProdutosNotasPagNFEItemspedidook.asboolean then
      qryProdutosNotaFiscalpedido.AsVariant := qryProdutosNotasPagNFEItemspedido.AsVariant
    else
      qryProdutosNotaFiscalpedido.clear;

    qryProdutosNotaFiscalnumeroprodutotabela.AsVariant := qryProdutosNotasPagNFEItemsnumeroprodutonopedido.AsVariant;
    dsrProdutosNotaFiscalDataChange(qryProdutosNotaFiscal, qryProdutosNotaFiscalnumeroprodutotabela);

    qryProdutosNotaFiscalprecounitariopedido.AsCurrency := qryProdutosNotasPagNFEItemsprecounitariopedido.AsCurrency;

    qryProdutosNotaFiscalgerarpagamento.AsBoolean := qryProdutosNotasPagNFEItemsgerarpagamento.AsBoolean;
    qryProdutosNotaFiscalnaogerarcreditoicms.AsBoolean := qryProdutosNotasPagNFEItemsnaogerarcreditoicms.AsBoolean;
    qryProdutosNotaFiscalnaogerarcreditoipi.AsBoolean := qryProdutosNotasPagNFEItemsnaogerarcreditoipi.AsBoolean;
    qryProdutosNotaFiscalicmssobreipi.AsBoolean := qryProdutosNotasPagNFEItemsicmssobreipi.AsBoolean;
    qryProdutosNotaFiscalicmssobredespesasacessorias.AsBoolean := qryProdutosNotasPagNFEItemsicmssobredespesasacessorias.AsBoolean;

    qryProdutosNotaFiscalnaocalcularipisobrefrete.AsBoolean := qryProdutosNotasPagNFEItemsnaocalcularipisobrefrete.AsBoolean;


    qryProdutosNotaFiscaltipomovimento.AsString := qryProdutosNotasPagNFEItemstipomovimento.AsString;
    qryProdutosNotaFiscaloperacao.AsString      := qryProdutosNotasPagNFEItemsoperacao.AsString;

    if qryProdutosNotasPagNFEcstipi.asSTring <> '0' then
    begin
      qryProdutosNotaFiscalipicst_nf.AsString := qryProdutosNotasPagNFEcstipi.asSTring;
      qryProdutosNotaFiscalipibasecalculo.AsCurrency := RatearValores(qryProdutosNotasPagNFEvBCIPI.asCurrency, qryProdutosNotasPagNFEqtdeestoque.AsFloat, qryProdutosNotasPagNFEItemsquantidade.AsFloat);
      qryProdutosNotaFiscalaliquotaipi.AsCurrency := qryProdutosNotasPagNFEpIPI.asCurrency;
      qryProdutosNotaFiscalvaloripi.AsCurrency := RatearValores(qryProdutosNotasPagNFEvIPI.asCurrency, qryProdutosNotasPagNFEqtdeestoque.AsFloat, qryProdutosNotasPagNFEItemsquantidade.AsFloat);
    end;

//    if CondicaoPRedBC(qryProdutosNotaFiscalcst_nf.asstring, qryProdutosNotaFiscalcsosn_nf.asstring, qrynotafiscalcrt.asinteger) and
//       (icmsbasecalculo > qryProdutosNotasPagNFEvBCICMS.AsCurrency) then

    if CondicaoPRedBC(qryProdutosNotaFiscalcst_nf.asstring, qryProdutosNotaFiscalcsosn_nf.asstring, qrynotafiscalcrt.asinteger) and
       (icmsbasecalculo > RatearValores(qryProdutosNotasPagNFEvBCICMS.AsCurrency,
                          qryProdutosNotasPagNFEqtdeestoque.AsFloat, qryProdutosNotasPagNFEItemsquantidade.AsFloat)) then
    begin
      qryProdutosNotaFiscalvalorreducaobase.AsCurrency :=(icmsbasecalculo - RatearValores(qryProdutosNotasPagNFEvBCICMS.AsCurrency,
                                                                   qryProdutosNotasPagNFEqtdeestoque.AsFloat, qryProdutosNotasPagNFEItemsquantidade.AsFloat));

      if (qryProdutosNotasPagNFEpRedBC.AsCurrency=0) and (qryProdutosNotaFiscalvalorreducaobase.AsCurrency<>0) then
        qryProdutosNotaFiscalpercentualreducaobase.AsCurrency := qryProdutosNotaFiscalvalorreducaobase.AsCurrency * 100 / icmsbasecalculo;

      {não existe 100% de redução, talvez devemos testar se o cst é 90}
      if (qryProdutosNotaFiscalpercentualreducaobase.AsCurrency = 100) or (qryProdutosNotaFiscalicmsbasecalculo.ascurrency = 0) then     //comentariozinho...um [] nf apolonia 23627 fornec 100778 serie 1
      begin
        qryProdutosNotaFiscalpercentualreducaobase.AsCurrency := 0;
        qryProdutosNotaFiscalvalorreducaobase.AsCurrency := 0;
      end;
    end
    else
      {ATENÇÃO: CASOS EM QUE A REDUÇÃO DE BASE NÃO VEM NA NFE E O CST = 00
    if NOT CondicaoPRedBC(qryProdutosNotaFiscalcst_nf.asstring, qryProdutosNotaFiscalcsosn_nf.asstring, qrynotafiscalcrt.asinteger) and
       (icmsbasecalculo > qryProdutosNotasPagNFEvBCICMS.AsCurrency) then   }
    if (qrynotafiscalcrt.asinteger in [2,3]) and (qryProdutosNotaFiscalcst_nf.asstring = 'OO') and
       (icmsbasecalculo > RatearValores(qryProdutosNotasPagNFEvBCICMS.AsCurrency,
                          qryProdutosNotasPagNFEqtdeestoque.AsFloat, qryProdutosNotasPagNFEItemsquantidade.AsFloat)) then
    begin
      qryProdutosNotaFiscalvalorreducaobase.AsCurrency := (icmsbasecalculo - RatearValores(qryProdutosNotasPagNFEvBCICMS.AsCurrency,
                                                                                    qryProdutosNotasPagNFEqtdeestoque.AsFloat, qryProdutosNotasPagNFEItemsquantidade.AsFloat));

      if (qryProdutosNotasPagNFEpRedBC.AsCurrency=0) and (qryProdutosNotaFiscalvalorreducaobase.AsCurrency<>0) then
        qryProdutosNotaFiscalpercentualreducaobase.AsCurrency := qryProdutosNotaFiscalvalorreducaobase.AsCurrency * 100 / icmsbasecalculo;

      {não existe 100% de redução, talvez devemos testar se o cst é 90}
      if qryProdutosNotaFiscalpercentualreducaobase.AsCurrency = 100 then
      begin
        qryProdutosNotaFiscalpercentualreducaobase.AsCurrency := 0;
        qryProdutosNotaFiscalvalorreducaobase.AsCurrency := 0;
      end;
    end
    else
      qryProdutosNotaFiscalvalorreducaobase.AsCurrency := 0.00;

    if qryProdutosNotasPagNFEpRedBCST.AsCurrency<>0 then
      qryProdutosNotaFiscalreducaobasest.AsCurrency := (icmsbasecalculost - RatearValores(qryProdutosNotasPagNFEvBCICMSST.AsCurrency,
                                                                                    qryProdutosNotasPagNFEqtdeestoque.AsFloat, qryProdutosNotasPagNFEItemsquantidade.AsFloat))
    else
      qryProdutosNotaFiscalreducaobasest.AsCurrency := 0.00;


    if (qryProdutosNotaFiscal.State in [dsedit, dsinsert]) then
      PostProdutosNotaFiscal;

    if (CampoProdutosNotasPagNFEItemsAlterado = nil) or (CampoProdutosNotasPagNFEItemsAlterado.fieldname <> 'quantidade') then
      VerificarProdutosFornecedores(False);

    VerificarSaldosdeRateio;

    qryprodutosnotafiscal.AfterInsert := qryProdutosNotaFiscalAfterInsert;
    dsrProdutosNotaFiscal.OnDataChange := dsrProdutosNotaFiscalDataChange;
    qryProdutosNotaFiscalproduto.OnChange := qryProdutosNotaFiscalprodutoChange;



  end;

  function ExisteDiferencaProdutosNotasPag_X_produtosNFE: boolean;
  begin
    result :=  (qryProdutosNotaFiscalproduto.AsString <> qryProdutosNotasPagNFEItemsproduto.AsString) or
//               (qryProdutosNotaFiscalnLote.AsString <> qryProdutosNotasPagNFEItemsNLote.AsString) or
               (qryProdutosNotaFiscalnrLote.AsString <> qryProdutosNotasPagNFEItemsNLote.AsString) or
               (qryProdutosNotaFiscalprodutovisual.AsString <> qryProdutosNotasPagNFEItemsprodutovisual.AsString) or
               (qryProdutosNotaFiscalcodigofiscal.AsInteger <> qryProdutosNotasPagNFEItemscodigofiscal.AsInteger) or
               (qryProdutosNotaFiscalnatureza.AsInteger <> qryProdutosNotasPagNFEItemsnatureza.AsInteger) or
               (qryProdutosNotaFiscalquantidade.AsFloat <> qryProdutosNotasPagNFEItemsquantidade.AsFloat) or
               (qryProdutosNotaFiscalprecounitario.AsFloat <> qryProdutosNotasPagNFEItemsprecounitario.AsFloat) or
               (qryProdutosNotasPagNFEItemspedidook.asBoolean and (qryProdutosNotaFiscalpedido.AsVariant <> qryProdutosNotasPagNFEItemspedido.AsVariant)) or
               (qryProdutosNotaFiscalnumeroprodutotabela.AsVariant <> qryProdutosNotasPagNFEItemsnumeroprodutonopedido.AsVariant) or
               (qryProdutosNotaFiscalprecounitariopedido.AsCurrency <> qryProdutosNotasPagNFEItemsprecounitariopedido.AsCurrency) or
               (qryProdutosNotaFiscalgerarpagamento.AsBoolean <> qryProdutosNotasPagNFEItemsgerarpagamento.AsBoolean) or
               (qryProdutosNotaFiscalnaogerarcreditoicms.AsBoolean <> qryProdutosNotasPagNFEItemsnaogerarcreditoicms.AsBoolean) or
               (qryProdutosNotaFiscalnaogerarcreditoipi.AsBoolean <> qryProdutosNotasPagNFEItemsnaogerarcreditoipi.AsBoolean) or
               (qryProdutosNotaFiscalicmssobreipi.AsBoolean <> qryProdutosNotasPagNFEItemsicmssobreipi.AsBoolean) or
               (qryProdutosNotaFiscalicmssobredespesasacessorias.AsBoolean <> qryProdutosNotasPagNFEItemsicmssobredespesasacessorias.AsBoolean) or
               (qryProdutosNotaFiscalnaocalcularipisobrefrete.AsBoolean <> qryProdutosNotasPagNFEItemsnaocalcularipisobrefrete.AsBoolean) or
               (qryProdutosNotaFiscaltipomovimento.AsString <> qryProdutosNotasPagNFEItemstipomovimento.AsString) or
               (qryProdutosNotaFiscaloperacao.AsString  <> qryProdutosNotasPagNFEItemsoperacao.AsString) or
{               (qryProdutosNotaFiscalunidadenf.AsString  <> qryProdutosNotasPagNFEItemsunidadenfe.AsString) or}
               (qryProdutosNotaFiscalfatorconversao.AsFloat  <> qryProdutosNotasPagNFEItemsfatorconversao.AsFloat) or
               (qryProdutosNotaFiscalqtdeestoque.asfloat  <> qryProdutosNotasPagNFEItemsqtdeestoque.asfloat) or
               ((qryProdutosNotaFiscalIPI.AsInteger <> qryProdutosNotasPagNFEipi.asinteger) and parsistema.AtualizarNCMNotaEntrada);



  end;

  function CondicaoProdutosNotasPag_X_produtosNFE: boolean;
  begin
    result :=  (qryProdutosNotasPagNFEItemsproduto.AsString<>'') and
               (qryProdutosNotasPagNFEItemscodigofiscal.AsInteger <> 0) and
               (qryProdutosNotasPagNFEItemsnatureza.AsInteger <> 0) and
               (qryProdutosNotasPagNFEItemsquantidade.AsFloat <> 0) and

               (qryProdutosNotasPagNFEItemsregistrosemerro.AsBoolean or
                (qryProdutosNotasPagNFEItemsSituacao.locate('detalheerro', 1, []))
                );
  end;

  function Forcar_a_Reatualizacao_ProdutosNotasPag_X_produtosNFE: boolean;
  begin
    result := MensagemConfirmacao('Reatualizar os dados do produto?')= smbOk;
  end;


begin
  try
    GuardarPosicaoProdutosNotasPagNFE;

    if TodosItems then
    begin
      qryProdutosNotasPagNFEItems.First;
      GuardarPosicaoProdutosNotasPagNFE;
    end;

    while not qryProdutosNotasPagNFEItems.Eof do
    begin

      if (operacao = opRemover) and
         PosicionarProdutosNotaFiscalPorProdutosNFE then
      begin
        VerificarProdutosFornecedores(False, True);
        qryProdutosNotaFiscal.delete;
        RefazerNumeroProdutos;
        if not fAtualizarCodigoFiscalProdutosNFE then
        begin
          CalcularImpostos(false);
          AtualizaSQLProdutosExistenteNotas;
          GravarNotaParcial;
          EditarNotaFiscal;
        end;
      end
      else
      if (operacao = opAdicionar) then
      begin
        if PosicionarProdutosNotaFiscalPorProdutosNFE then
        begin
          if ((qryProdutosNotaFiscalproduto.AsString <> qryProdutosNotasPagNFEItemsproduto.AsString) and (not qryProdutosNotaFiscalproduto.isnull)) or
             ((qryProdutosNotaFiscalprodutovisual.AsString <> qryProdutosNotasPagNFEItemsprodutovisual.AsString) and (not qryProdutosNotaFiscalprodutovisual.isnull)) then
            VerificarProdutosFornecedores(False, True);

          if ExisteDiferencaProdutosNotasPag_X_produtosNFE {or
             ReatualizarProduto and Forcar_a_Reatualizacao_ProdutosNotasPag_X_produtosNFE)} then
            if CondicaoProdutosNotasPag_X_produtosNFE then
            begin
              AtribuirProdutosNotasPag_daNFE(topUPDATE);

              if not fAtualizarCodigoFiscalProdutosNFE and
                 (qryprodutosnotaspagnfeitems.RecNo = qryProdutosNotasPagNFEItems.RecordCount) {Racionalizar fazendo somente no úlitmo item}
              then
              begin
                CalcularImpostos(false, {False,} tpaltEsp_Nenhuma, false);
                AtualizaSQLProdutosExistenteNotas;
                GravarNotaParcial;
                EditarNotaFiscal;
              end;
            end;
        end
        else
          if CondicaoProdutosNotasPag_X_produtosNFE then
          begin
            AtribuirProdutosNotasPag_daNFE(topINSERT);
            if not fAtualizarCodigoFiscalProdutosNFE then
            begin
              CalcularImpostos(false, {False,} tpaltEsp_Nenhuma, false);
              AtualizaSQLProdutosExistenteNotas;
              GravarNotaParcial;
              EditarNotaFiscal;
            end;
          end;
      end;

      if TodosItems then
      begin
        VoltarPosicaoProdutosNotasPagNFE;
        qryProdutosNotasPagNFEItems.Next
      end
      else
        break;
    end;

  finally
    VoltarPosicaoProdutosNotasPagNFE;
  end;
end;


procedure TdtmCadastroNotasFiscais.qryProcuraNaturezasProdutoNFEBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  if not qryConsultaNaturezas.Active then
    if not ((qryProcuraNaturezasProdutoNFE.ParamByName('codigofiscal').Asinteger = 1353) or
            (qryProcuraNaturezasProdutoNFE.ParamByName('codigofiscal').Asinteger = 2353)) then
      qryProcuraNaturezasProdutoNFE.MacroByName('CodigoNaturezaPadrao').AsString := '';

  if pos(inttostr(CodigoFiscalAuxiliar), qryProcuraNaturezasProdutoNFE.params[1].asstring)=0 then
    qryProcuraNaturezasProdutoNFE.MacroByName('CodigoNaturezaPadrao').AsString := '';

  if (qryProdutosNotasPagNFEItemsnatureza.AsInteger <> 0) and
     (fCodigoFiscalProdutoNFEOriginal = qryProdutosNotasPagNFEItemscodigofiscal.asinteger) then
    qryProcuraNaturezasProdutoNFE.MacroByName('CodigoNaturezaPadrao').AsString := ' and (naturezas.codigo = ' + IntToStr(qryProdutosNotasPagNFEItemsnatureza.AsInteger) + ') ';

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEItemsAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  if (qryProdutosNotasPagNFEsaldoquantidade.AsFloat <= 0) then
  begin
    MensagemAviso('A quantidade adicionada esta igual a NFe de entrada. Não existe saldo para adicionar!');
    qryProdutosNotasPagNFEitems.cancel;
  end;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEItemsBeforeEdit(
  DataSet: TDataSet);
begin
  inherited;
  vProdutosNotasPagNFEItemsquantidadeAntesEditar := qryProdutosNotasPagNFEItemsquantidade.asfloat;
  vDescricaoUnidadeAntesEditar := qryProdutosNotasPagNFEItemsdescricaounidadenfe.asString;
  vFatorConversaoAntesEditar := qryProdutosNotasPagNFEItemsfatorconversao.AsFloat;
  vQtdeEstoqueAntesEditar := qryProdutosNotasPagNFEItemsqtdeestoque.asfloat;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEItemsSituacaoCalcFields(
  DataSet: TDataSet);                                                                                                                                   
begin
  inherited;
  if qryProdutosNotasPagNFEItemsSituacaoerro.AsBoolean then
    qryProdutosNotasPagNFEItemsSituacaodescricaotipoerro.AsString := 'ERRO'
  else
    qryProdutosNotasPagNFEItemsSituacaodescricaotipoerro.AsString :=  'ALERTA'
end;

function TdtmCadastroNotasFiscais.CondicaoCSOSN: Boolean;
begin
  result := (qryNotaFiscalcrt.AsInteger = 1) or   //SIMPLES NACIONAL
            (qryNotaFiscalcrt.AsInteger = 4);     //MEI
end;

function TdtmCadastroNotasFiscais.getIncluindoViaXml: boolean;
begin
  Result := fIncluindoViaXml;
end;

procedure TdtmCadastroNotasFiscais.setIncluindoViaXml(
  const Value: boolean);
begin
  fincluindoviaxml := value;
  SomenteLeitura := value;
end;

function TdtmCadastroNotasFiscais.Getcrt: integer;
begin
  if qryNotaFiscalpermitirimprimir.AsBoolean or
     (qryNotaFiscaltipofornecedor.AsString <> 'F') then
    fcrt := RegimeTributario
  else
    fcrt := qryProcuraFornecedorescrt.AsInteger;

  Result := fcrt;
end;

procedure TdtmCadastroNotasFiscais.SelecionarPedidoNotasPag;
var
  vNumeroPedido : integer;
begin
  ReFazConsultaporNome(qryProcuraPedidosNotaFiscal, ['numero'], [qryConsultaPedidosNotaFiscalnumero.AsInteger]);
  qryPedidosNotasPag.edit;
  qryPedidosNotasPagpedido.AsInteger := qryConsultaPedidosNotaFiscalnumero.AsInteger;
  qryPedidosNotasPag.post;
end;


function TdtmCadastroNotasFiscais.GetListadePedidosMarcados: String;
begin
  fListadePedidosMarcados := RetornarLista(qryPedidosNotasPag, qryPedidosNotasPagpedido, qryPedidosNotasPagfiltrarproduto);
  if fListadePedidosMarcados = '' then
    fListadePedidosMarcados := '0';
  Result := fListadePedidosMarcados;
end;

procedure TdtmCadastroNotasFiscais.dsrPedidosNotasPagDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if Sender = nil then
  begin
    if field = qryPedidosNotasPagpedido then
    begin
      dsrPedidosNotasPag.OnDataChange := nil;

      if (qryProcuraPedidosNotaFiscal.RecordCount = 0) or
         (qryProcuraPedidosNotaFiscal.parambyname('numero').asinteger <> qryPedidosNotasPagpedido.asinteger) or
         (qryProcuraPedidosNotaFiscal.parambyname('codigonota').asinteger <> qryPedidosNotasPagcodigonota.asinteger) then

        RefazConsultaPorNome(qryProcuraPedidosNotaFiscal, ['numero','codigonota'],
                         [qryPedidosNotasPagpedido.asinteger, qryPedidosNotasPagcodigonota.asinteger]);

      if qryProcuraPedidosNotaFiscal.IsEmpty then
      begin
        MensagemAviso(format('O pedido ''%s'' não foi encontrado',[qryPedidosNotasPagpedido.AsString]));
        qryPedidosNotasPagpedido.clear;
      end;

      dsrPedidosNotasPag.OnDataChange := dsrPedidosNotasPagDataChange;
    end;
  end;
end;

procedure TdtmCadastroNotasFiscais.AbrirConsultaPedidosProdutosNotasPagNFE;
begin
  qryConsultaPedidosProdutoNFE.macrobyname('SQLProdutosPedidos').asstring := 'and pp1.produto = '+
    ifthen(qryProdutosNotasPagNFEItemsproduto.asString<>'',qryProdutosNotasPagNFEItemsproduto.asString,'0');
  qryConsultaPedidosProdutoNFE.macrobyname('SQLProdutosNotasPag').asstring := 'and pnp.produto = '+
    ifthen(qryProdutosNotasPagNFEItemsproduto.asString<>'',qryProdutosNotasPagNFEItemsproduto.asString,'0');
  qryConsultaPedidosProdutoNFE.close;
  qryConsultaPedidosProdutoNFE.open;

end;

procedure TdtmCadastroNotasFiscais.FecharConsultaPedidosNFE;
begin
  qryConsultaPedidosNotaFiscal.macrobyname('SQLProdutosPedidos').asstring := '';
  qryConsultaPedidosNotaFiscal.macrobyname('SQLProdutosNotasPag').asstring := '';
  qryConsultaPedidosNotaFiscal.Close;
end;

procedure TdtmCadastroNotasFiscais.qryPedidosNotasPagAfterPost(
  DataSet: TDataSet);
var
  vRecno, vPedido: integer;
begin
  inherited;
  vRecno := qryPedidosNotasPag.recno;
  vPedido := qryPedidosNotasPagpedido.asinteger;
  qryPedidosNotasPag.first;
  while not qryPedidosNotasPag.Eof do
  begin
    if (vRecno <> qryPedidosNotasPag.recno) and
       (vpedido = qryPedidosNotasPagpedido.asinteger) then
    begin
      qryPedidosNotasPag.Delete;
      break;
    end
    else
      qryPedidosNotasPag.next;
  end;
end;

function TdtmCadastroNotasFiscais.IncluirProdutosDoPedidodaNFE(ExibirMensagemProdutosNaoIdentificados, ConfirmarVinculacao:boolean): Boolean;
var Pedido: integer;
var Qtdade: Currency;
var vExibirMensagemProdutosNaoIdentificados : Boolean;
var ValorMensagem : TModalResult;

  procedure VincularPedidoNotaPag;
  begin

    qryProdutosNotasPagNFEItems.Edit;
    qryProdutosNotasPagNFEItemspedido.AsInteger := qryPedidosNotasPagpedido.AsInteger;
    qryProdutosNotasPagNFEItemspedidook.asBoolean := true;
    qryProdutosNotasPagNFEItemsnumeroprodutonopedido.AsInteger := qryConsultaProdutosNotaFiscalnumeroprodutotabela.AsInteger;
    qryProdutosNotasPagNFEItemsprecounitariopedido.AsCurrency := qryConsultaProdutosNotaFiscalpreco.AsCurrency;

    qryProdutosNotasPagNFEItems.Post;
    dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemspedido);
    DesligarEventosProdutosNotasPagNFEItems;

  end;

begin
  result := true;

  if qryProdutosNotasPagNFE.active then
  begin
    vExibirMensagemProdutosNaoIdentificados := False;

    DesligarEventosProdutosNotasPagNFEItems;
    qryPedidosNotasPag.first;
    while not qryPedidosNotasPag.eof do
    begin
      AbreTabelaConsultaProdutosNotaFiscal(False, True, false, true, true);
      qryConsultaProdutosNotaFiscal.First;
      while not qryConsultaProdutosNotaFiscal.Eof do
      begin
        qryProdutosNotasPagNFE.First;
        while not qryprodutosnotaspagnfe.Eof do
        begin
          qryProdutosNotasPagNFEItems.First;
          while not qryProdutosNotasPagNFEItems.Eof do
          begin
            if (qryProdutosNotasPagNFEItemspedido.AsInteger = 0) and
               (qryProdutosNotasPagNFEItemsproduto.AsString = qryConsultaProdutosNotaFiscalcodigo.AsString) then
            begin
              if not ConfirmarVinculacao then
                VincularPedidoNotaPag
              else
              begin
                case MensagemSimNaoOpcaoCancelar(format('Vincular o produto %s com o pedido %s ?', [qryProdutosNotasPagNFEItemsprodutovisual.AsString,  qryPedidosNotasPagpedido.AsString]), '') of
                  mrYes : VincularPedidoNotaPag;
                  mrNo  : ;
                  mrCancel : begin
                               result := false;
                               exit;
                             end;
                end;
              end;
            end;

            if qryProdutosNotasPagNFEItemsproduto.isnull then
               vExibirMensagemProdutosNaoIdentificados := true;

            qryProdutosNotasPagNFEItems.next;
          end;

  //        if not result then
  //          break;

          qryProdutosNotasPagNFE.next;
        end;

  //      if not result then
  //        break;

        qryConsultaProdutosNotaFiscal.next;
      end;
      qryPedidosNotasPag.next;
    end;
    LigarEventosProdutosNotasPagNFEItems;

    if vExibirMensagemProdutosNaoIdentificados and ExibirMensagemProdutosNaoIdentificados then
      MensagemAviso('Existem produtos não identificados que podem estar presentes nos pedidos');

  end;

  AlertarProdutosPedidosnaNotaNormal;

end;

{
function TdtmCadastroNotasFiscais.GetListadePedidos: String;
begin
  fListadePedidos := RetornarLista(qryPedidosNotasPag, qryPedidosNotasPagpedido);
  Result := fListadePedidos;
end;
}

procedure TdtmCadastroNotasFiscais.qryPedidosNotasPagNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryPedidosNotasPagcodigonota.asinteger := qryNotaFiscalcodigo.asinteger;
  qryPedidosNotasPagfiltrarproduto.asboolean := true;


end;

procedure TdtmCadastroNotasFiscais.IncluirNaListadePedidos;
begin
  qryPedidosNotasPag.append;
end;

procedure TdtmCadastroNotasFiscais.ExcluirdaListadePedidos;
begin

  if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR,['este pedido da lista de pedidos']))= smbOk then
    qryPedidosNotasPag.delete;

end;

procedure TdtmCadastroNotasFiscais.IncluirDuplicatasViaXML;
var
  vNomeArquivo : String;
begin
  qrynfe.close;
  qrynfe.ParamByName('codigo').AsInteger := qryNotaFiscalcodigo.AsInteger;
  qrynfe.Open;
  if not qrynfexmlnfe.IsNull then
  begin
    vNomeArquivo := ExtractFilePath(Application.ExeName) + 'XMLTemp';
    if not DirectoryExists(vNomeArquivo) then
      if not CreateDir(vNomeArquivo) then
      raise Exception.Create('Impossível criar o diretório '+vNomeArquivo);
    vNomeArquivo := vNomeArquivo + '\xmlnfe_' + qryNotaFiscalcodigo.asstring+'.xml';
    qrynfexmlnfe.SaveToFile(vNomeArquivo);

    EntradaViaXML := True;
    ArquivoXMLNFe := vNomeArquivo;
    EntradaViaXML := False;


  end
  else
    MensagemErro('Algo inesperado aconteceu: O arquivo xml não esta presente na nota parcial');
end;

function TdtmCadastroNotasFiscais.Getdadofiscalnotafiscalsaida: integer;
begin
  result := qryProdutosNotaFiscaldadofiscal.AsInteger;
end;

procedure TdtmCadastroNotasFiscais.Setdadofiscalnotafiscalsaida(
  const Value: integer);
begin
  if value <> 0 then
  begin

  {  qryProdutosNotaFiscalfilialnotafiscalsaida.AsVariant := qryProcuraFiliaiscodigo.AsVariant;
    qryProdutosNotaFiscalserienotafiscalsaida.AsVariant := qryProcuraSerieFiliaisserie.AsVariant;
    qryProdutosNotaFiscalnumeronotafiscalsaida.AsVariant := qryProcuraNotaFiscalProdutosnumero.AsVariant;
    if (qryProcuraFiliaiscodigo.AsInteger<>0) and
       (qryProcuraSerieFiliaisserie.AsString<>'') and
       (qryProcuraNotaFiscalProdutosnumero.AsInteger<>0) then}
      qryProdutosNotaFiscaldadofiscal.AsInteger := value
{    else
      qryProdutosNotaFiscaldadofiscal.clear;}


  end
  else
  begin
    qryProdutosNotaFiscaldadofiscal.clear;
    if qryProdutosNotaFiscalfilialnotafiscalsaida.Asinteger <> qryProcuraFiliaiscodigo.AsInteger then
    begin
      qryProdutosNotaFiscalfilialnotafiscalsaida.value := qryProcuraFiliaiscodigo.value;
       qryProcuraSerieFiliais.ParamByName('filial').Value := qryProcuraFiliaiscodigo.Value;
       qryProcuraNotaFiscalProdutos.ParamByName('filial').Value := qryProcuraFiliaiscodigo.Value;
    end;
{
    begin
       refazconsultapornome(qryProcuraFiliais, ['filial'], [0]);
       qryProcuraSerieFiliais.ParamByName('filial').Value := qryProcuraFiliaiscodigo.Value;
       qryProcuraNotaFiscalProdutos.ParamByName('filial').Value := qryProcuraFiliaiscodigo.Value;
    end;
}

    if (qryProdutosNotaFiscalserienotafiscalsaida.AsString <> qryProcuraSerieFiliaisserie.AsString) or
       (qryProdutosNotaFiscalfilialnotafiscalsaida.Asinteger <> qryProcuraSerieFiliaisfilial.AsInteger) then
    begin
      qryProdutosNotaFiscalserienotafiscalsaida.Asvariant := qryProcuraSerieFiliaisserie.AsVariant;
      qryProcuraNotaFiscalProdutos.ParamByName('serie').Value := qryProcuraSerieFiliaisserie.Value;
    end;
{
    begin
      qryProcuraNotaFiscalProdutos.ParamByName('serie').Value := qryProcuraSerieFiliaisserie.Value;
      refazconsultapornome(qryProcuraSerieFiliais, ['filial','serie'], [0,'']);
    end;
}

    if (qryProdutosNotaFiscalnumeronotafiscalsaida.AsInteger <> qryProcuraNotaFiscalProdutosnumero.AsInteger) or
       (qryProdutosNotaFiscalfilialnotafiscalsaida.Asinteger <> qryProcuraNotaFiscalProdutosfilial.AsInteger) or
       (qryProdutosNotaFiscalserienotafiscalsaida.AsString <> qryProcuraNotaFiscalProdutosserie.AsString) then
      qryProdutosNotaFiscalnumeronotafiscalsaida.AsVariant := qryProcuraNotaFiscalProdutosnumero.AsVariant;

{
    begin
      refazconsultapornome(qryProcuraNotaFiscalProdutos, ['filial','serie','numero'], [0,'',0]);
    end;
}

  end;
end;

procedure TdtmCadastroNotasFiscais.qryConsultaProdutosNotaFiscalBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;

  if ((qryProdutosNotaFiscalpedido.asinteger <> 0) and not VisualizandoProdutosdaNFE) or
     ((qryProdutosNotasPagNFEItemspedido.asinteger <> 0) and VisualizandoProdutosdaNFE) then
  begin
    qryConsultaProdutosNotaFiscal.MacroByName('SQLPedidoAtual').asString := '(pp.pedido, pp.numero, pp.produto) in ('+ListaChaveProdutoPedidoAtual+') or ';
    qryConsultaProdutosNotaFiscal.MacroByName('SQLListas').asString := ' and (pp.pedido, pp.numero, pp.produto) not in ('+ListaChaveProdutoPedido+') ';
  end
  else
  if qryProdutosNotaFiscaldadofiscal.asinteger <> 0 then
    qryConsultaProdutosNotaFiscal.MacroByName('SQLListas').asString := ' and (pdf.dadofiscal, pdf.numero, pdf.produto) not in ('+ListaChaveProdutoDadosFiscal+')'
  else
    qryConsultaProdutosNotaFiscal.MacroByName('SQLListas').asString := '';

end;

procedure TdtmCadastroNotasFiscais.qryProcuraProdutoNotaFiscalBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;

  {
  if (((qryProdutosNotaFiscalpedido.asinteger <> 0) and not(getIncluidoViaXml))
       or ((qryProdutosNotaFiscalpedido.asinteger <> 0) and (getIncluidoViaXml) and (qryProdutosNotaFiscalproduto.AsString=qryProdutosNotasPagNFEItemsproduto.AsString)))then
   }
   if ((qryProdutosNotaFiscalpedido.asinteger <> 0) and not VisualizandoProdutosdaNFE) or
      ((qryProdutosNotasPagNFEItemspedido.asinteger <> 0) and qryProdutosNotasPagNFEItemspedidook.asBoolean and VisualizandoProdutosdaNFE) then
  begin
    qryProcuraProdutoNotaFiscal.sql.text := dtmCadastroNotasFiscaisAuxiliar.qryProcuraProdutoNotaFiscal_PEDIDO.sql.text;

    if VisualizandoProdutosdaNFE then
      qryProcuraProdutoNotaFiscal.ParamByName('pedido').asinteger := qryProdutosNotasPagNFEItemspedido.AsInteger
    else
      qryProcuraProdutoNotaFiscal.ParamByName('pedido').asinteger := qryProdutosNotaFiscalpedido.AsInteger;

    qryProcuraProdutoNotaFiscal.MacroByName('SQLPedidoAtual').asString := '(pp.pedido, pp.numero, pp.produto) in ('+ListaChaveProdutoPedidoAtual+') or ';
    qryProcuraProdutoNotaFiscal.MacroByName('SQLListas').asString := ' and  (pp.pedido, pp.numero, pp.produto) not in ('+ListaChaveProdutoPedido+') ';

    if qryProcuraProdutoNotaFiscal.ParamByName('numeroproduto').isnull then
      qryProcuraProdutoNotaFiscal.MacroByName('SQLListas').asString := qryProcuraProdutoNotaFiscal.MacroByName('SQLListas').asString +
                                                                       ' limit 1'
  end
  else
  if qryProdutosNotaFiscaldadofiscal.asinteger <> 0 then
  begin
    qryProcuraProdutoNotaFiscal.sql.text := dtmCadastroNotasFiscaisAuxiliar.qryProcuraProdutoNotaFiscal_NOTASAIDA.sql.text;
    qryProcuraProdutoNotaFiscal.ParamByName('dadofiscal').asinteger := qryProdutosNotaFiscaldadofiscal.AsInteger;
    qryProcuraProdutoNotaFiscal.MacroByName('SQLListas').asString := ' and (pdf.dadofiscal, pdf.numero, pdf.produto) not in ('+ListaChaveProdutoDadosFiscal+')';
    if qryProcuraProdutoNotaFiscal.ParamByName('numeroproduto').isnull then
      qryProcuraProdutoNotaFiscal.MacroByName('SQLListas').asString := qryProcuraProdutoNotaFiscal.MacroByName('SQLListas').asString +
                                                                       ' limit 1'
  end
  else
  begin
    qryProcuraProdutoNotaFiscal.ParamByName('numeroproduto').clear;
    qryProcuraProdutoNotaFiscal.sql.text := dtmCadastroNotasFiscaisAuxiliar.qryProcuraProdutoNotaFiscal_NORMAL.sql.text;
    qryProcuraProdutoNotaFiscal.MacroByName('SQLListas').asString := '';
  end;

end;

function TdtmCadastroNotasFiscais.ExistePedidoProdutoNFE(
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaPedidosProdutoNFE, NomeCampo, Value)
end;

procedure TdtmCadastroNotasFiscais.qryConsultaPedidosNotaFiscalBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  
  qryConsultaPedidosNotaFiscal.parambyname('PesquisaNFE').asBoolean := VisualizandoProdutosdaNFE;

end;

procedure TdtmCadastroNotasFiscais.qryProcuraPedidosNotaFiscalBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryProcuraPedidosNotaFiscal.parambyname('PesquisaNFE').asBoolean := VisualizandoProdutosdaNFE;
end;

function TdtmCadastroNotasFiscais.GetListaChaveProdutoDadosFiscal: String;
begin
{
  if FViaNota then
  begin
    if (qryConsultaProdutosNotaFiscalnumerodocumentotabela.asinteger <> 0) and
       (qryConsultaProdutosNotaFiscalnumeroprodutotabela.Asinteger <> 0) and
       (qryConsultaProdutosNotaFiscalcodigo.AsString <> '') then

      result := '('+qryConsultaProdutosNotaFiscalnumerodocumentotabela.AsString + ', ' +
                    qryConsultaProdutosNotaFiscalnumeroprodutotabela.AsString + ', ' +
                    qryConsultaProdutosNotaFiscalcodigo.AsString +')'
    else
      result := '(0, 0, 0)';
  end
  else
  begin
  }
    if (qryProdutosNotaFiscaldadofiscal.asinteger <> 0) and
       (qryProdutosNotaFiscalnumeroprodutotabela.Asinteger <> 0) and
       (qryProdutosNotaFiscalproduto.AsString <> '') then

      result := '('+qryProdutosNotaFiscaldadofiscal.AsString + ', ' +
                    qryProdutosNotaFiscalnumeroprodutotabela.AsString + ', ' +
                    qryProdutosNotaFiscalproduto.AsString +')'
    else
      result := '(0, 0, 0)';

    if (pos(result, ListaChavesProdutosDadosFiscais)<>0) and (result <> '(0, 0, 0)') then
      result :=  Trocar(ListaChavesProdutosDadosFiscais,result,'')
    else
      result := ListaChavesProdutosDadosFiscais;

    if trim(result) = '' then
      result := '(0, 0, 0)';

    result := trocar(result,')(','), (');
  {end;}


end;

function TdtmCadastroNotasFiscais.GetListaChaveProdutoPedido: String;
begin

  result := ListaChaveProdutoPedidoAtual;

  if (pos(result, ListaChavesProdutosPedidos)<> 0)  and (result <> '(0, 0, 0)') then
    result :=  Trocar(ListaChavesProdutosPedidos,result,'')
  else
    result := ListaChavesProdutosPedidos;

  if trim(result) = '' then
    result := '(0, 0, 0)';

  result := trocar(result,')(','), (');

end;

procedure TdtmCadastroNotasFiscais.RatearDesconto;
begin
//  qryNotaFiscalnumeroregistrodescontoalterado.AsInteger := 0;
  dsrProdutosNotaFiscal.onDataChange := nil;
  dsrProdutosNotaFiscal.DataSet.edit;
  dsrProdutosNotaFiscal.DataSet.fieldbyname('descontodigitado').asboolean := false;
  dsrProdutosNotaFiscal.DataSet.fieldbyname('desconto').asCurrency := 0;
  CalcularImpostos(false);
  dsrProdutosNotaFiscal.onDataChange := dsrProdutosNotaFiscalDataChange;
end;

procedure TdtmCadastroNotasFiscais.RatearFrete;
begin
//  qryNotaFiscalnumeroregistroFretealterado.AsInteger := 0;

  dsrProdutosNotaFiscal.onDataChange := nil;
  dsrProdutosNotaFiscal.dataset.edit;
  dsrProdutosNotaFiscal.dataset.fieldbyname('fretedigitado').asboolean := false;
  dsrProdutosNotaFiscal.dataset.fieldbyname('frete').asCurrency := 0;
  CalcularImpostos(false);
  dsrProdutosNotaFiscal.onDataChange := dsrProdutosNotaFiscalDataChange;
end;

procedure TdtmCadastroNotasFiscais.VerificarProdutosFornecedoresUnidades;
var
  i, t: integer;
  vLista : String;
  posProduto : TBookMark;
begin
  if qryProdutosNotaFiscal.Active then
  begin
    try

      posProduto := qryProdutosNotaFiscal.getBookMark;
      qryProdutosNotaFiscal.DisableControls;
      DesabilitarControles(true);


      vLista := RetornarLista(qryprodutosnotafiscal,
               [qryProdutosNotaFiscalproduto, qryProdutosNotaFiscalunidadenf],
               nil);

      if vLista <> '' then
      begin

        qryProdutosFornecedoresUnidades_.macrobyname('ListaProdutosUnidades').asString := vLista;
        RefazConsultaporNome(qryProdutosFornecedoresUnidades_, ['fornecedor','tipofornecedor'],
                           [qryNotaFiscalfornecedor.AsInteger, qryNotaFiscaltipofornecedor.AsString]);

        qryProdutosNotaFiscal.first;
        while not qryProdutosNotaFiscal.eof do
        begin
          if not qryProdutosFornecedoresUnidades_.locate('produto;unidade',
                              VarArrayOf([qryProdutosNotaFiscalproduto.AsString, qryProdutosNotaFiscalunidadenf.AsString]),[]) then
          begin
            qryProdutosFornecedoresUnidades_.append;
            qryProdutosFornecedoresUnidades_.fieldbyname('produto').AsString          := qryProdutosNotaFiscalproduto.AsString;
            qryProdutosFornecedoresUnidades_.fieldbyname('fornecedor').AsInteger      := qryNotaFiscalfornecedor.AsInteger;
            qryProdutosFornecedoresUnidades_.fieldbyname('tipofornecedor').AsString   := qryNotaFiscaltipofornecedor.AsString;
            qryProdutosFornecedoresUnidades_.fieldbyname('unidade').AsString          := qryProdutosNotaFiscalunidadenf.AsString;
            qryProdutosFornecedoresUnidades_.fieldbyname('fatorconversao').AsFloat := qryProdutosNotaFiscalfatorconversao.AsFloat;
            qryProdutosFornecedoresUnidades_.post;
          end
          else
          begin
            if qryProdutosFornecedoresUnidades_.fieldbyname('fatorconversao').AsFloat <> qryProdutosNotaFiscalfatorconversao.AsFloat then
            begin
              qryProdutosFornecedoresUnidades_.edit;
              qryProdutosFornecedoresUnidades_.fieldbyname('fatorconversao').AsFloat := qryProdutosNotaFiscalfatorconversao.AsFloat;
              qryProdutosFornecedoresUnidades_.post;
            end;
          end;
          qryProdutosNotaFiscal.next;
        end;
      end;

    finally
      qryProdutosNotaFiscal.GotoBookMark(posProduto);
      qryProdutosNotaFiscal.FreeBookMark(posProduto);
      qryProdutosNotaFiscal.enableControls;
      DesabilitarControles(false);
    end;

  end;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEItemsAfterEdit(
  DataSet: TDataSet);
begin
  inherited;
  if qryProdutosNotasPagNFEItemsunidadenfe.isnull and not qryProdutosNotasPagNFEuCom.isnull then
  begin

    qryProdutosNotasPagNFEItemsunidadenfe.AsString := qryProdutosNotasPagNFEuCom.AsString;

    if qryProdutosNotasPagNFEItemsdescricaounidadenfe.isnull then
      qryProdutosNotasPagNFEItemsdescricaounidadenfe.AsString := qryProdutosNotasPagNFEItemsunidadenfe.AsString;

  end;
end;

procedure TdtmCadastroNotasFiscais.VerificarUnidadeNFE;
begin
   if not qryUnidades.Active or
      not qryUnidades.Locate('codigo', qryProdutosNotasPagNFEItemsunidadenfe.AsString, []) then
     RefazConsultaPorNome(qryUnidades,['unidade'],[qryProdutosNotasPagNFEItemsunidadenfe.AsString]);

   if qryUnidades.RecordCount = 1 then
     qryProdutosNotasPagNFEItemsdescricaounidadenfe.AsString := qryUnidadesdescricao.AsString
   else
   begin
      qryProdutosNotasPagNFEItemsdescricaounidadenfe.AsString := qryProdutosNotasPagNFEItemsunidadenfe.AsString;
      qryunidades.Edit;
      qryUnidadescodigo.asstring := qryProdutosNotasPagNFEItemsunidadenfe.AsString;
      qryUnidadesdescricao.asstring := qryProdutosNotasPagNFEItemsdescricaounidadenfe.AsString;
      qryunidades.post;

      perpetrar([qryunidades]);
   end;


end;

procedure TdtmCadastroNotasFiscais.GuardarPosicaoProdutosNotasPagNFE;
begin
  if not assigned(v_PosicaoProdutosNotasPagNFE[1]) then
  begin
    v_PosicaoProdutosNotasPagNFE[1] := tStringlist.Create;
    v_PosicaoProdutosNotasPagNFE[2] := tStringlist.Create;
  end;

  v_PosicaoProdutosNotasPagNFE[1].Add(qryProdutosNotasPagNFEnumero.asString);
  v_PosicaoProdutosNotasPagNFE[2].Add(qryProdutosNotasPagNFEItemsnumero.asString);


//v_qryProdutosNotasPagNFEnumero := qryProdutosNotasPagNFEnumero.asinteger;
//v_qryProdutosNotasPagNFEItemsnumero := qryProdutosNotasPagNFEItemsnumero.asinteger;
end;

procedure TdtmCadastroNotasFiscais.VoltarPosicaoProdutosNotasPagNFE;
begin

  if qryProdutosNotasPagNFE.active then
    if v_PosicaoProdutosNotasPagNFE[1].Count <> 0 then
      if qryProdutosNotasPagNFEnumero.asString <> (v_PosicaoProdutosNotasPagNFE[1].Strings[v_PosicaoProdutosNotasPagNFE[1].Count-1]) then
         qryProdutosNotasPagNFE.Locate('numero', (v_PosicaoProdutosNotasPagNFE[1].Strings[v_PosicaoProdutosNotasPagNFE[1].Count-1]), []);

  if qryProdutosNotasPagNFEItems.active then
    if v_PosicaoProdutosNotasPagNFE[2].Count <> 0 then
      if qryProdutosNotasPagNFEItemsnumero.asString <> (v_PosicaoProdutosNotasPagNFE[2].Strings[v_PosicaoProdutosNotasPagNFE[2].Count-1]) then
        qryProdutosNotasPagNFEItems.Locate('numero', (v_PosicaoProdutosNotasPagNFE[2].Strings[v_PosicaoProdutosNotasPagNFE[2].Count-1]),[]);

   if v_PosicaoProdutosNotasPagNFE[1].Count<>0 then
     v_PosicaoProdutosNotasPagNFE[1].Delete(v_PosicaoProdutosNotasPagNFE[1].Count-1);

   if v_PosicaoProdutosNotasPagNFE[2].Count<>0 then
     v_PosicaoProdutosNotasPagNFE[2].Delete(v_PosicaoProdutosNotasPagNFE[2].Count-1);
end;

function TdtmCadastroNotasFiscais.GetCondicaoEmissorNFE: Boolean;
begin
  if qryNotaFiscal.recordcount <> 0 then
    fCondicaoEmissorNFE := parsistema.EmissorNfe and
                           ((qryNotaFiscalmodelodocto.AsString = '55') or
                            (qryNotaFiscalmodelodocto.AsString = '57'))
  else
    fCondicaoEmissorNFE := parsistema.EmissorNfe and
                           ((ModeloDoctoFiscal = '55') or
                            (ModeloDoctoFiscal = '57'));

  Result := fCondicaoEmissorNFE;
end;

procedure TdtmCadastroNotasFiscais.AtualizarMovimentos;
var
  SituacaoProduto : TtecComposicao;
  Pos: TBookmark;
  Referencia,
  WhereSQL: String;
  a:integer;

  QtdeFuturo: Currency;


  function PosicionarMovimento: boolean;
  begin
    if qryProdutosNotaFiscalnumerooriginal.isnull then
      result := qrymovimentos.Locate('codigonota;numerocontrole',
          VarArrayOf([qrynotafiscalcodigo.asstring, qryProdutosNotaFiscalnumero.asstring]),[])
    else
      {o numerooriginal quando foram gerados os movimentos}
      result := qrymovimentos.Locate('codigonota;numerocontrole',
          VarArrayOf([qrynotafiscalcodigo.asstring, qryProdutosNotaFiscalnumerooriginal.asstring]),[]);
  end;

  procedure AcumularQuantidadeTFR;
  begin
    if qryEstoque.Locate('produto;filial', VarArrayOf([qryMovimentosproduto.AsString,
                                                       qryMovimentosfilial.AsInteger]), []) then
    begin
      qryEstoque.edit;
      qryEstoquefuturo_na_data_inclusao.asfloat := qryEstoquefuturo_na_data_inclusao.asfloat +
                                                   qryMovimentosquantidade.asfloat;
      qryEstoque.post;
    end;
  end;

  procedure ApagarMovimentos;
  begin
    {apagar os movimentos do produto trocado e armazenar a quantidade de futuro em qryEstoques}
    qrymovimentos.last;
    while not qryMovimentos.bof do
    begin
      if qrymovimentosproduto.asString <> qryProdutosNotaFiscalproduto.asString then
      begin
        if qryMovimentostipomovimento.asString = 'TFR' then
          AcumularQuantidadeTFR;
        qrymovimentos.Delete;
      end
      else
        qrymovimentos.prior;
    end;
  end;

  procedure IncluirMovimento(Incluir : boolean);
  begin
    { incluindo primeira vez , a questão da edição é mais complexa pois o saldo da tabela estoque é sempre a ultima situação,
      talvez tenhamos que ter uma solução usando o saldo da tabela movimentos no dia e hora antes da inclusão

      Finalmente chegou este dia. Hoje dia 23/11/15 foi necessário trocar um produtos da nota cadastrado erroneamente.
      }

    if qryEstoque.Locate('produto;filial', VarArrayOf([qryProdutosNotaFiscalproduto.AsString,
//                                                        qryProdutosNotaFiscalfilial.AsInteger]), []) then
                                                        ifthen(TipoFilial<>'V', FilialBase, FilialEstoque)]), []) then



      QtdeFuturo := qryEstoquefuturo_na_data_inclusao.AsCurrency
    else
      QtdeFuturo := 0;

    {Se não estiver incluindo deve-se posicionar no tipomovimento <> TFR, presume-se que existam sempre dois movimentos: um da operacao constante na natureza e o outro o TFR}
    if not incluir then
    begin
      qrymovimentos.last;
      while not qrymovimentos.bof do
      begin
        if qrymovimentostipomovimento.asstring <> 'TFR' then
          break
        else
          qrymovimentos.prior;
      end;

      {Caso, Caso por alguma razão não tenha encontrado então adicione}
      if qrymovimentostipomovimento.asstring = 'TFR' then
        Incluir := true;

    end;

    IncluirEditarMovimento(qryProdutosNotaFiscalqtdeestoque.AsFloat,
                     qryProdutosNotaFiscaltipomovimento.AsString,
                     Referencia,
                     qryProdutosNotaFiscalcustototal.AsCurrency,
                     Incluir);

    if ({qryProcuraNaturezasoperacao}qryProdutosNotaFiscaloperacao.AsString[1] = '+') then // or (qryProcuraNaturezasoperacao.AsString[2] = '+') then
    begin

      {Se não estiver incluindo deve-se posicionar no tipomovimento = TFR, presume-se que existam sempre dois movimentos: um da operacao constante na natureza e o outro o TFR}
      if not incluir then
      begin
        qrymovimentos.last;
        while not qrymovimentos.bof do
        begin
          if qrymovimentostipomovimento.asstring = 'TFR' then
          begin
            QtdeFuturo := qryEstoquefuturo_na_data_inclusao.AsCurrency;
            break;
          end
          else
            qrymovimentos.prior;
        end;

        {Caso... Caso por alguma razão não tenha encontrado então adicione}
        if qrymovimentostipomovimento.asstring <> 'TFR' then
          Incluir := true;
      end;

      if qryProdutosNotaFiscalqtdeestoque.AsFloat <= QtdeFuturo then
      begin
        IncluirEditarMovimento(qryProdutosNotaFiscalqtdeestoque.AsFloat, 'TFR', Referencia, qryProdutosNotaFiscalcustototal.AsCurrency, incluir);
        qryEstoque.Edit;
        qryEstoquefuturo_na_data_inclusao.AsCurrency := qryEstoquefuturo_na_data_inclusao.AsCurrency - qryProdutosNotaFiscalqtdeestoque.AsFloat;
        qryEstoque.post;
      end
      else
      if QtdeFuturo > 0 then
      begin
        IncluirEditarMovimento(QtdeFuturo, 'TFR', Referencia,
          (qryProdutosNotaFiscalcustototal.AsCurrency/
           qryProdutosNotaFiscalqtdeestoque.AsFloat) * QtdeFuturo, incluir);
        qryEstoque.Edit;
        qryEstoquefuturo_na_data_inclusao.AsCurrency := 0;
        qryEstoque.post;
      end;

    end
    else
    begin
      {Apagar os TFR supostamente existentes}
      qrymovimentos.last;
      while not qryMovimentos.bof do
      begin
        if qryMovimentostipomovimento.asstring = 'TFR' then
        begin
          AcumularQuantidadeTFR;
          qrymovimentos.Delete;
        end
        else
          qrymovimentos.prior;
      end;
    end;

  end;


  procedure MontarReferencia;
  begin
    Referencia := '';

    if Not qryProdutosNotaFiscalpedido.IsNull then
      Referencia := Referencia + 'PD ' + qryProdutosNotaFiscalpedido.AsString;

    if Referencia <> '' then
      Referencia := Referencia + '/';
    if Not qryProdutosNotaFiscalproduto.IsNull then
      Referencia := Referencia + 'NFE F' + qryNotaFiscalfornecedor.AsString
                                         + qryNotaFiscaltipofornecedor.AsString +
                                    ' S' + qryNotaFiscalserie.AsString +
                                    ' N' + qryNotaFiscalnrdocumento.AsString;
  end;

begin
  qryProdutosNotaFiscal.AfterScroll := nil;

  if qryProdutosNotaFiscal.Active then
  begin


    try
      qryProdutosNotaFiscal.DisableControls;
      Pos := qryProdutosNotaFiscal.GetBookmark;
      DesabilitarControles(true);


//      qryMovimentos.MacroByName('SQL').AsString := ' and tipomovimento<>''TFR'' and m.codigonota = '+qryNotaFiscalcodigo.AsString;
      qryMovimentos.MacroByName('SQL').AsString := ' and m.codigonota = '+qryNotaFiscalcodigo.AsString;
      qryMovimentos.close;
      qryMovimentos.Open;
      qryMovimentos.filtered := true;

      {Primeiro processar as exclusões de produto originados por uma troca de produto pois a tabela qrymovimentos e recuperada
       pelo codigo da nota, a exclusao de um TFR gera um retorno para o futuro no qual se faz necesário um processamento do saldo em
       qryEstoques do saldo do futuro
      }


      {PRIMEIRO: PROCESSAR AS EXCLUÕES }

      for SituacaoProduto := stNAOCOMPOSTO to stCOMPOSTO do
      begin

        qryProdutosNotaFiscal.First;
        while Not qryProdutosNotaFiscal.Eof do
        begin

          if FiltrarComposto(qryProdutosNotaFiscalcomposto.AsBoolean, SituacaoProduto) { and
             (qryProdutosNotaFiscalqtdeestoque.AsFloat<>0)} then
          begin

            IncluirAtualizarLotes;

            MontarReferencia;

            if (qryProdutosNotaFiscaloperacao.AsString<>'') and
               not PossuiSomente(qryProdutosNotaFiscaloperacao.AsString,'*') then
            begin
              if PosicionarMovimento then
              begin
                if (qryMovimentosproduto.AsString <> qryProdutosNotaFiscalproduto.AsString) then
                   ApagarMovimentos;
              end;
            end
            else
            begin
              {apagar movimentos sem operação}
              if posicionarmovimento then
                ApagarMovimentos;
            end;
          end;
          qryProdutosNotaFiscal.Next;
        end
      end;

      {SEGUNDO : PROCESSAR O RESTANTE DOS MOVIMENTOS APOS AS EXCLUSÕES}
      for SituacaoProduto := stNAOCOMPOSTO to stCOMPOSTO do
      begin
        qryProdutosNotaFiscal.First;
        while Not qryProdutosNotaFiscal.Eof do
        begin
          if FiltrarComposto(qryProdutosNotaFiscalcomposto.AsBoolean, SituacaoProduto) then
          begin

            MontarReferencia;

            if (qryProdutosNotaFiscaloperacao.AsString<>'') and
               not PossuiSomente(qryProdutosNotaFiscaloperacao.AsString,'*') then
            begin
              if PosicionarMovimento then
              begin
                (* SITUAÇÃO ABAIXO COMENTADA NÃO ACONTECE POIS O MOVIMENTO JÁ FOI EXCLUIDO NO LOOP ANTERIOR
                if (qryMovimentosproduto.AsString <> qryProdutosNotaFiscalproduto.AsString) then
                begin
                  IncluirMovimento(true);
                end
                else
                *)
                  { edição com mesmo produto }
                  {passagem de parametro para nao incluir mas sim editar}
                  IncluirMovimento(false);
              end
              else
                {incluir o produto}
                IncluirMovimento(true);
            end;
          end;
          qryProdutosNotaFiscal.Next;
        end;
      end;

      qrymovimentos.first;
      while not qrymovimentos.Eof do
      begin
        if not qryMovimentosok.AsBoolean then
          qrymovimentos.delete
        else
          qrymovimentos.Next;
      end;


    finally
      qryProdutosNotaFiscal.GotoBookmark(Pos);
      qryProdutosNotaFiscal.FreeBookmark(Pos);
      qryProdutosNotaFiscal.EnableControls;
      qryProdutosNotaFiscal.AfterScroll := qryProdutosNotaFiscalAfterScroll;
      qryMovimentos.filtered := false;
      qryMovimentos.MacroByName('SQL').AsString := 'and false';
      DesabilitarControles(false);

    end
  end;

end;

procedure TdtmCadastroNotasFiscais.EliminarMovimentos;
begin
  try
    qryMovimentos.MacroByName('SQL').AsString := ' and m.codigonota = '+qryNotaFiscalcodigo.AsString;
    qryMovimentos.close;
    qryMovimentos.Open;

    qrymovimentos.first;
    while not qrymovimentos.Eof do
      qrymovimentos.delete

  finally
    qryMovimentos.MacroByName('SQL').AsString := 'and false';
  end;
end;

procedure TdtmCadastroNotasFiscais.LimparDadosNotaReferenciada;
begin
  EditarNotaFiscal;
  qryNotaFiscaldadofiscalreferenciado.clear;
  qryNotaFiscalfilialnotasaidareferenciada.clear;
  qryNotaFiscalserienotasaidareferenciada.clear;
  qryNotaFiscalnumeronotasaidareferenciada.clear;
end;

procedure TdtmCadastroNotasFiscais.qryDadosFiscaisRefAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  if qryDadosFiscaisRefdadofiscal.AsInteger <> 0 then
  begin
    qryNotaFiscaldadofiscalreferenciado.AsInteger := qryDadosFiscaisRefdadofiscal.AsInteger;
    qryNotaFiscalfilialnotasaidareferenciada.asinteger := qryDadosFiscaisReffilial.AsInteger;
    qryNotaFiscalserienotasaidareferenciada.asString:= qryDadosFiscaisRefserie.asstring;
    qryNotaFiscalnumeronotasaidareferenciada.asinteger := qryDadosFiscaisRefnumeronf.asinteger;
  end
  else
  begin
    qryNotaFiscaldadofiscalreferenciado.clear;
    qryNotaFiscalfilialnotasaidareferenciada.clear;
    qryNotaFiscalserienotasaidareferenciada.clear;
    qryNotaFiscalnumeronotasaidareferenciada.clear;
  end;

end;

procedure TdtmCadastroNotasFiscais.qryDadosFiscaisRefBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qrydadosfiscaisref.ParamByName('filial').asinteger := qryNotaFiscalfilial.asinteger;

end;

function TdtmCadastroNotasFiscais.GetNotaReferenciada: boolean;
begin
  fNotaReferenciada := (qryNotaFiscalfinalidadenf.asinteger = 3) or //Ajuste

                       (((qryNotaFiscalfinalidadenf.asinteger = 4) or
                         (qryNotaFiscalfinalidadenf.asinteger = 1))
                        and exigenotareferenciada(qryNotaFiscalcodigofiscal.asinteger));

  Result := fNotaReferenciada;
end;

procedure TdtmCadastroNotasFiscais.qryConsultaNaturezasBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaNaturezas.paramByName('finalidade').AsInteger := qryNotaFiscalfinalidadenf.AsInteger;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEAfterScroll(
  DataSet: TDataSet);
begin
  inherited;


  if qryProdutosNotasPagNFEItems.active then
  begin
    if qryProdutosNotasPagNFEItems.isempty then
    begin
      qryProdutosNotasPagNFEItems.AfterInsert := nil;

      if qryProdutosNotasPagNFELotes.RecordCount > 1 then
      begin
        qryProdutosNotasPagNFELotes.first;
        while not qryProdutosNotasPagNFELotes.eof do
        begin
          if qryProdutosNotasPagNFELotesqlote.asFloat > 0 then
          begin
            qryProdutosNotasPagNFELotes.GuardarRegistroAtual(false, false);
            qryProdutosNotasPagNFEItems.Append;
            qryProdutosNotasPagNFELotes.VoltarRegistro;

            qryProdutosNotasPagNFEItemsquantidade.asCurrency :=
              qryProdutosNotasPagNFELotesqlote.asCurrency;

            qryProdutosNotasPagNFEItemsnlote.asString :=
              qryProdutosNotasPagNFELotesnlote.AsString;

            qryProdutosNotasPagNFELotes.VoltarRegistro;
          end;

          qryProdutosNotasPagNFELotes.next;
        end;
      end
      else
      begin
        qryProdutosNotasPagNFEItems.Append;
      end;

      if vLigarEventosProdutosNotasPagNFEItems then
        qryProdutosNotasPagNFEItems.AfterInsert := qryProdutosNotasPagNFEItemsAfterInsert;

    end
    else
      if VisualizandoProdutosdaNFE then
        qryProdutosNotasPagNFEItemsAfterScroll(qryProdutosNotasPagNFE);
  end;

//  cdsTotaisProdutosNotasPagNFELotes.close;
//  cdsTotaisProdutosNotasPagNFELotes.open;

  if assigned(self.owner) then
    if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
      TfrmCadastroNotasFiscais(Self.owner).CalcularTotaisProdutosNotasPagNFELotes;

end;

function TdtmCadastroNotasFiscais.GetListaChaveProdutoPedidoAtual: String;
begin
  if VisualizandoProdutosdaNFE then
  begin
    if (qryProdutosNotasPagNFEItemspedido.asinteger <> 0) and
       (qryProdutosNotasPagNFEItemsnumeroprodutonopedido.Asinteger <> 0) and
       (qryProdutosNotasPagNFEItemsproduto.AsString <> '') then

      result := '('+qryProdutosNotasPagNFEItemspedido.asString + ', ' +
                    inttostr(qryProdutosNotasPagNFEItemsnumeroprodutonopedido.Asinteger) + ', ' +
                    qryProdutosNotasPagNFEItemsproduto.AsString +')'
    else
      result := '(0, 0, 0)';

  end
  else
  begin
    if (qryProdutosNotaFiscalpedido.asinteger <> 0) and
       (qryProdutosNotaFiscalnumeroprodutotabela.Asinteger <> 0) and
       (qryProdutosNotaFiscalproduto.AsString <> '') then

      result := '('+qryProdutosNotaFiscalpedido.AsString + ', ' +
                    inttostr(qryProdutosNotaFiscalnumeroprodutotabela.AsInteger) + ', ' +
                    qryProdutosNotaFiscalproduto.AsString +')'
    else
      result := '(0, 0, 0)';
  end;

  if trim(result) = '' then
    result := '(0, 0, 0)';

end;



procedure TdtmCadastroNotasFiscais.qryProdutosNotaFiscalAfterPost(
  DataSet: TDataSet);
begin
  inherited;
//  RecalcularImpostos := true;
  EditarNotaFiscal;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotaFiscalBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryProdutosNotaFiscal.parambyname('EstadoFilialBaseCalculoPreco').asString :=  estadoFilialbase;
end;


procedure TdtmCadastroNotasFiscais.qryNotaFiscalBeforeEdit(
  DataSet: TDataSet);
begin
  inherited;
;
end;

procedure TdtmCadastroNotasFiscais.qryMovimentosFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  if qryProdutosNotaFiscalnumerooriginal.isnull then
    Accept := qrymovimentosnumerocontrole.asinteger = qryProdutosNotaFiscalnumero.asInteger
  else
  {o numerooriginal quando foram gerados os movimentos}
    Accept := qrymovimentosnumerocontrole.asinteger = qryProdutosNotaFiscalnumerooriginal.asInteger;
end;

function TdtmCadastroNotasFiscais.GetProduto: String;
begin
  result := qryProdutosNotaFiscalproduto.asString;
end;

function TdtmCadastroNotasFiscais.VerificarBloqueiodaTabela: boolean;
begin
 result := VerificarBloqueiodaTabela(
                        qryNotaFiscal,
                        'codigo',
                        'datahoragravacao',
                        'notaspag');
end;

procedure TdtmCadastroNotasFiscais.AtualizarItensgradenfe;
var
  vQuantidadeAntesdaAlteracao, vtestevalor: currency;
begin

//  VisualizandoProdutosdaNFE := true;

  vQuantidadeAntesdaAlteracao := 0;
  vTipoInclusaoProdutoGrade := ViaXml;

  RefazConsultaPorNome(qryProcuraProdutoNotaFiscal, ['produtovisual','caracteristica','valorgrade1','valorgrade2'],
                       [null,
                        qryCaracteristicasNotaFiscalcaracteristica.AsString,
                        qryGrade.fieldbyname('valorlinha').AsString,
                        colunaatual]);

  if qryProcuraProdutoNotaFiscal.RecordCount = 0 then
  begin
    if IncluirProdutosNaoCadastradosLC(qryCaracteristicasNotaFiscalcaracteristica.AsString,
                                    qryCaracteristicasNotaFiscaldescricao.AsString,
                                    qryGrade.fieldbyname('valorlinha').AsString,
                                    colunaatual) then

      RefazConsultaPorNome(qryProcuraProdutoNotaFiscal, ['produtovisual','caracteristica','valorgrade1','valorgrade2'],
                           [null,
                            qryCaracteristicasNotaFiscalcaracteristica.AsString,
                            qryGrade.fieldbyname('valorlinha').AsString,
                            colunaatual]);
  end;

  if qryProcuraProdutoNotaFiscal.RecordCount <> 0 then
  begin

    CampoProdutosNotasPagNFEItemsAlterado := nil;

    if qryProdutosNotasPagNFEItems.locate('produto', qryProcuraProdutoNotaFiscalproduto.AsString,[]) then
    begin
      vQuantidadeAntesdaAlteracao := qryProdutosNotasPagNFEItemsquantidade.AsCurrency;
      qryProdutosNotasPagNFEItems.edit;
    end
    else
    begin
      if qryProdutosNotasPagNFEItemsproduto.IsNull and
         (qryProdutosNotasPagNFEItems.recordcount = 1) then
        qryProdutosNotasPagNFEItems.delete;
      qryProdutosNotasPagNFEItems.append;
    end;

    if (qryProdutosNotasPagNFEItems.state in [dsedit, dsinsert]) then
    begin

      if qryProdutosNotasPagNFEItemsproduto.asstring <> qryProcuraProdutoNotaFiscalproduto.asstring then
        qryProdutosNotasPagNFEItemsproduto.asstring := qryProcuraProdutoNotaFiscalproduto.asstring;

      if qryProdutosNotasPagNFEItemsprodutovisual.asstring <> qryProcuraProdutoNotaFiscalprodutovisual.asstring then
        qryProdutosNotasPagNFEItemsprodutovisual.asstring := qryProcuraProdutoNotaFiscalprodutovisual.asstring;

      if qryProdutosNotasPagNFEItemsprodutodigitado.asstring <> qryProcuraProdutoNotaFiscalprodutovisual.asstring then
        qryProdutosNotasPagNFEItemsprodutodigitado.asstring := qryProcuraProdutoNotaFiscalprodutovisual.asstring;

      if qryProdutosNotasPagNFEItemsdescricaoproduto.AsString <> qryProcuraProdutoNotaFiscaldescricao.AsString then
        qryProdutosNotasPagNFEItemsdescricaoproduto.AsString := qryProcuraProdutoNotaFiscaldescricao.AsString;

      if qryProdutosNotasPagNFEItemscaracteristica.AsString <> qryCaracteristicasNotaFiscalcaracteristica.AsString then
        qryProdutosNotasPagNFEItemscaracteristica.AsString := qryCaracteristicasNotaFiscalcaracteristica.AsString;

      if qryProdutosNotasPagNFEItemscaracteristicavisual.AsString <> qryCaracteristicasNotaFiscalcodigovisual.AsString then
        qryProdutosNotasPagNFEItemscaracteristicavisual.AsString := qryCaracteristicasNotaFiscalcodigovisual.AsString;


      if qryProdutosNotasPagNFEItemsvalorgrade1.asstring <> qryGrade.fieldbyname('valorlinha').AsString then
        qryProdutosNotasPagNFEItemsvalorgrade1.asstring := qryGrade.fieldbyname('valorlinha').AsString;

      if qryProdutosNotasPagNFEItemsvalorgrade2.asstring <> colunaatual then
        qryProdutosNotasPagNFEItemsvalorgrade2.asstring := colunaatual;


      case tpModoGrade of
        SomenteItemAtual:
         begin
           if qryProdutosNotasPagNFEItemsquantidade.AsCurrency <> qrygrade.fieldbyname(nomecampocolunaatual).ascurrency then
             qryProdutosNotasPagNFEItemsquantidade.AsCurrency := qrygrade.fieldbyname(nomecampocolunaatual).ascurrency;

           if qryProdutosNotasPagNFEItems.state = dsEdit then
              CampoProdutosNotasPagNFEItemsAlterado := qryProdutosNotasPagNFEItemsquantidade;
         end;
        Todos: begin

                 if qryProdutosNotasPagNFEItemsquantidade.AsCurrency <>
                    (qryProdutosNotasPagNFEquantidadeselecionadalc.ascurrency +
                    (qryProdutosNotasPagNFEsaldoquantidadelc.asCurrency - qryProdutosNotasPagNFEquantidadeselecionadalc.ascurrency)) then

                   qryProdutosNotasPagNFEItemsquantidade.AsCurrency :=
                   (qryProdutosNotasPagNFEquantidadeselecionadalc.ascurrency +
                     (qryProdutosNotasPagNFEsaldoquantidadelc.asCurrency - qryProdutosNotasPagNFEquantidadeselecionadalc.ascurrency));

                 if qryProdutosNotasPagNFEItems.state = dsEdit then
                    CampoProdutosNotasPagNFEItemsAlterado := qryProdutosNotasPagNFEItemsquantidade;

               end;
      end;

      qryProdutosNotasPagNFEItems.Post;

      GerarTabelaGrade;

    end
    else
    begin
      qrygrade.edit;
      qrygrade.fieldbyname(nomecampocolunaatual).clear;
      qrygrade.post;
    end;

    (*
    dsrGrade.onDataChange := nil;

    if (qryProdutosNotaFiscalnumerosequencianfeitens.asinteger =
        qryProdutosNotasPagNFEItemsnumero.asinteger) and

       (qryProdutosNotaFiscalnumerosequencianfe.asinteger =
        qryProdutosNotasPagNFEItemsnumerosequencianfe.asinteger) then
    begin

      qrygrade.Edit;

      qrygrade.FieldByName('precounitario').AsFloat       := qryProdutosNotaFiscalprecounitario.AsFloat;
  //    qrygrade.FieldByName('precounitario').AsFloat       := qryProdutosNotasPagNFEItemsprecounitario.asFloat;

      qrygrade.FieldByName('aliquotaicms').Ascurrency     := qryProdutosNotaFiscalaliquotaicms.AsFloat;
  //    qrygrade.FieldByName('aliquotaicms').Ascurrency     := qryProdutosNotasPagNFEpICMS.AsFloat;

      qrygrade.FieldByName('aliquotaipi').Ascurrency      := qryProdutosNotaFiscalaliquotaipi.AsFloat;
  //    qrygrade.FieldByName('aliquotaipi').Ascurrency      := qryProdutosNotasPagNFEpIPI.AsFloat;

      qrygrade.FieldByName('valorreducaobase').Ascurrency := qryProdutosNotaFiscalvalorreducaobase.AsFloat;

      case tpModoGrade of
        Todos: qrygrade.fieldbyname(nomecampocolunaatual).ascurrency := qrygrade.fieldbyname(nomecampocolunaatual).ascurrency -
                                                               vQuantidadeAntesdaAlteracao +
                                                               qryProdutosNotasPagNFEItemsquantidade.AsCurrency;
      end;

      qrygrade.Post;
    end;

    dsrGradeDataChange(qryGrade, qrygrade.fieldbyname(nomecampocolunaatual));

    Verificar porque ao apagar (zero) não esta zerando visualmente;
    vtestevalor := qrygrade.fieldbyname(nomecampocolunaatual).ascurrency;

    if qrygrade.state = dsedit then
      qrygrade.Post;

    dsrGrade.onDataChange := dsrGradeDataChange;
    *)

  end;

  PosicionarLinhaColunanoProdutoNotaFiscal(ColunaAtual);
//  nomedocampoposicionar := ColunaAtual;
//  PosicionarLinhaColunaNaGrade(nil);
//  VisualizandoProdutosdaNFE := false;


end;

procedure TdtmCadastroNotasFiscais.dsrProdutosNotasPagNFEDataChange(
  Sender: TObject; Field: TField);

  procedure AtribuirDados_ProdutosNotasPagNFEItemsquantidade;
  var vProdutosNotasPagNFEItemsquantidade : Currency;
      vProdutosNotasPagNFEItemsprecounitario : Real;
  begin
    vProdutosNotasPagNFEItemsprecounitario := qryProdutosNotasPagNFEvalortotal.AsFloat/qryProdutosNotasPagNFEqtdeestoque.AsFloat;
    vProdutosNotasPagNFEItemsquantidade := qryProdutosNotasPagNFEqtdeestoque.asCurrency -
          SomarValores(qryProdutosNotasPagNFEItems,
                       [qryProdutosNotasPagNFEItemsquantidade],
                       [qryProdutosNotasPagNFEItemsproduto], [''], ['<>']);

    qryProdutosNotasPagNFEItems.AfterPost := nil;

    if vProdutosNotasPagNFEItemsquantidade > 0 then
      AtribuirDados(qryProdutosNotasPagNFEItems,
                    [qryProdutosNotasPagNFEItemsquantidade],
                    [vProdutosNotasPagNFEItemsquantidade], [qryProdutosNotasPagNFEItemsproduto], [''], ['=']);

    AtribuirDados(qryProdutosNotasPagNFEItems,
                  [qryProdutosNotasPagNFEItemsprecounitario],
                  [vProdutosNotasPagNFEItemsprecounitario]);

   if vLigarEventosProdutosNotasPagNFEItems then
     qryProdutosNotasPagNFEItems.AfterPost := qryProdutosNotasPagNFEItemsAfterPost;

   VerificarValoresProdutosNotasPagNFEItems;
   VerificarProdutosNotaFiscalPorProdutosNFE(opAdicionar , true, true);

  end;

begin
  inherited;
  if field = qryProdutosNotasPagNFEquantidadeselecionadalc then
  begin
    dsrProdutosNotasPagNFE.onDataChange := nil;
    VerificarProdutosNotasPagNFEquantidadeselecionada(true);
    dsrProdutosNotasPagNFE.onDataChange := dsrProdutosNotasPagNFEDataChange;
  end
  else
  if field = qryProdutosNotasPagNFEsaldoquantidade then
  begin
    dsrProdutosNotasPagNFE.onDataChange := nil;
    SituacaoProdutosNotasPagNFEsaldoquantidade;
//    VerificarValoresProdutosNotasPagNFEItems;
    dsrProdutosNotasPagNFE.onDataChange := dsrProdutosNotasPagNFEDataChange;
  end
  else
  if field = qryProdutosNotasPagNFEipi then
  begin
    dsrProdutosNotasPagNFE.onDataChange := nil;
    qryProdutosNotasPagNFEdescricaoipi.asString := qryIPIdescricao.asString;
    dsrProdutosNotasPagNFE.onDataChange := dsrProdutosNotasPagNFEDataChange;
  end;

  { Bloqueado a edição dos campos fatorconversao e qtdeestoque em 01/06/2022 sem sentido....o campo qtdeestoque alterando quantidade nos itens...ou uma coisa ou outra!!!
  else
  if field = qryProdutosNotasPagNFEfatorconversao then
  begin
    dsrProdutosNotasPagNFE.OnDataChange := nil;
    qryProdutosNotasPagNFEqtdeestoque.asCurrency := FormatarQuantidadeFloat(qryProdutosNotasPagNFEquantidade.AsFloat * qryProdutosNotasPagNFEfatorconversao.AsFloat);
    AtribuirDados_ProdutosNotasPagNFEItemsquantidade;
    dsrProdutosNotasPagNFE.OnDataChange := dsrProdutosNotasPagNFEDataChange;
  end
  else
  if field = qryProdutosNotasPagNFEqtdeestoque then
  begin
    dsrProdutosNotasPagNFE.OnDataChange := nil;
    qryProdutosNotasPagNFEfatorconversao.AsFloat := RoundToD(qryProdutosNotasPagNFEquantidade.AsFloat / qryProdutosNotasPagNFEqtdeestoque.AsFloat, 8);
    AtribuirDados_ProdutosNotasPagNFEItemsquantidade;
    dsrProdutosNotasPagNFE.OnDataChange := dsrProdutosNotasPagNFEDataChange;
  end;
  }
end;

function TdtmCadastroNotasFiscais.VerificarProdutosNotasPagNFEquantidadeselecionada(ValorAlterado: boolean): boolean;
begin
  result := true;

  if VisualizandoProdutosdaNFELC then
  begin

    if qryProdutosNotasPagNFEsaldoquantidadelc.ascurrency = 0 then
    begin
      MensagemAviso('Não existe saldo para este produto');
      if valoralterado then
        qryProdutosNotasPagNFEquantidadeselecionadalc.ascurrency := qryProdutosNotasPagNFEquantidadeselecionadalc_copia.ascurrency;
      result := false;
    end
    else

//    if qryProdutosNotasPagNFEquantidadeselecionadalc.ascurrency >
//       qryProdutosNotasPagNFEsaldoquantidadelc.ascurrency then

    if (qryProdutosNotasPagNFEquantidadeselecionadalc.ascurrency +
        (qryProdutosNotasPagNFEsaldoquantidadelc.asCurrency - qryProdutosNotasPagNFEquantidadeselecionadalc.ascurrency)) >
        qryProdutosNotasPagNFEqtdeestoque.asCurrency then
    begin
      MensagemAviso('A quantidade selecionada não pode ser superior ao saldo pendente.');
      if valoralterado then
        qryProdutosNotasPagNFEquantidadeselecionadalc.ascurrency := qryProdutosNotasPagNFEquantidadeselecionadalc_copia.ascurrency;

      result := false;
    end;

  end;

end;


procedure TdtmCadastroNotasFiscais.qryCaracteristicasNotaFiscalAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  qryCaracteristicasNotaFiscalcodigovisual.readonly := (qryProdutosNotaFiscal.recordcount <> 0);

  if UnlockedGerarTabelaGrade  then
    GerarTabelaGrade;

end;

procedure TdtmCadastroNotasFiscais.SetVisualizandoGrade(
  const Value: Boolean);
begin
  fVisualizandoGrade := Value;
  {
  if value then
    qryProdutosNotaFiscal.mastersource := dsrCaracteristicasNotaFiscal
  else
    qryProdutosNotaFiscal.mastersource := nil;
  }  

end;

procedure TdtmCadastroNotasFiscais.qryCaracteristicasNotaFiscalBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryIncluirCaracteristicasNotaFiscal.ParamByName('codigonota').AsInteger := qryNotaFiscalcodigo.AsInteger;
  qryIncluirCaracteristicasNotaFiscal.ExecSql;
  perpetrar([qryIncluirCaracteristicasNotaFiscal]);

  if assigned(CaracteristicasNotaFiscalBeforeOpen) then
    CaracteristicasNotaFiscalBeforeOpen(nil);


end;

procedure TdtmCadastroNotasFiscais.qryCaracteristicasNotaFiscalNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryCaracteristicasNotaFiscalcodigonota.asinteger := qrynotafiscalcodigo.asinteger;
end;

procedure TdtmCadastroNotasFiscais.qrycaracteristicaselementosnotaspag_lAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  qrycaracteristicaselementosnotaspag_l.readonly := qrycaracteristicaselementosnotaspag_lcontidonanfe.asBoolean;
end;

procedure TdtmCadastroNotasFiscais.LocalizarLinha_(elemento: String);
begin
 qryElementosLinhas.Locate('valor',elemento,[loPartialKey]);
 qrycaracteristicaselementosnotaspag_l.Locate('valor',elemento,[loPartialKey]);
end;

procedure TdtmCadastroNotasFiscais.IncluirLinha_(linha: String);
begin
{
  qryElementosLinhas.Append;
  qryElementosLinhasvalor.AsString := linha;
}
  qrycaracteristicaselementosnotaspag_L.readonly := false;
  qrycaracteristicaselementosnotaspag_L.Append;
  qrycaracteristicaselementosnotaspag_Lvalor.AsString := linha;

end;

procedure TdtmCadastroNotasFiscais.AdicionarLinhasSelecionadas(Marcando,
  Todos: Boolean);
var vProximo : String;
begin
  if marcando then
  begin

    if todos then
    begin
      qryElementosLinhas.filtered := false;
      qryElementosLinhas.first;
    end;

    while not qryElementosLinhas.eof do
    begin

      if not qryElementosLinhasmarcar.AsBoolean then
      begin
        qrycaracteristicaselementosnotaspag_l.readonly := false;
        qrycaracteristicaselementosnotaspag_l.append;
        qrycaracteristicaselementosnotaspag_lvalor.asString := qryElementosLinhasvalor.asString;
        qrycaracteristicaselementosnotaspag_labreviatura.asString := qryElementosLinhasabreviatura.asString;
        qrycaracteristicaselementosnotaspag_lpresenteemprodutos.asBoolean := qryElementosLinhaspresenteemprodutos.asboolean;
        qrycaracteristicaselementosnotaspag_lemuso.asBoolean := qryElementosLinhasemuso.AsBoolean;
        qrycaracteristicaselementosnotaspag_l.post;

        qryElementosLinhas.Next;
        vProximo := qryElementosLinhasvalor.asString;
        if not qryElementosLinhas.eof then
          qryElementosLinhas.prior;

        MarcarRegistros(qryElementosLinhas, qryElementosLinhasmarcar, Marcando, false, false);
      end;

      if todos then
        qryElementosLinhas.next
      else
      begin
        qryElementosLinhas.Locate('valor', vProximo, []);
        break;
      end;

    end;

    if todos then
      qryElementosLinhas.filtered := true;


  end
  else
  begin

    if todos then
      qrycaracteristicaselementosnotaspag_l.first;

    while not qrycaracteristicaselementosnotaspag_l.eof do
    begin

      if not qrycaracteristicaselementosnotaspag_l.readonly then
      begin
        qryElementosLinhas.filtered := false;
        qryElementosLinhas.first;
        if qryElementosLinhas.locate('valor', qrycaracteristicaselementosnotaspag_lvalor.asString, []) then
          MarcarRegistros(qryElementosLinhas, qryElementosLinhasmarcar, Marcando, false, false)
        else
        begin

          qryElementosLinhas.AfterDelete := nil;
          qryElementosLinhas.AfterPost := nil;
          qryElementosLinhas.BeforePost := nil;

          qryElementosLinhas.append;
          qryElementosLinhasgrade.asinteger := qryCaracteristicasNotaFiscalgrade1.AsInteger;
          qryElementosLinhasvalor.asString := qrycaracteristicaselementosnotaspag_lvalor.AsString;
          qryElementosLinhasabreviatura.asString := qrycaracteristicaselementosnotaspag_labreviatura.asString;
          qryElementosLinhaspresenteemprodutos.AsBoolean := qrycaracteristicaselementosnotaspag_labreviatura.AsBoolean;
          qryElementosLinhasmarcar.asBoolean := false;
          qryElementosLinhas.post;

          qryElementosLinhas.AfterDelete := qryElementosLinhasAfterDelete;
          qryElementosLinhas.AfterPost   := qryElementosLinhasAfterPost;
          qryElementosLinhas.BeforePost  := qryElementosLinhasBeforePost;

        end;

        qryElementosLinhas.filtered := true;

        qryElementosLinhas.locate('valor', qrycaracteristicaselementosnotaspag_lvalor.AsString, []);

        qrycaracteristicaselementosnotaspag_l.delete;

        if not todos then
          break;

      end
      else
      begin
        if todos then
          qrycaracteristicaselementosnotaspag_l.next
        else
          break;
      end;
    end;

  end;

end;

procedure TdtmCadastroNotasFiscais.AdicionarLinhasPresentesemProdutosSelecionadas(
  Marcando, Todos: Boolean);
begin
  if marcando then
  begin

    if todos then
    begin
      qryElementosLinhas.filtered := false;
      qryElementosLinhas.first;
    end;

    while not qryElementosLinhas.eof do
    begin

      if not qryElementosLinhasmarcar.AsBoolean and
         qryElementosLinhaspresenteemprodutos.AsBoolean then
      begin
        qrycaracteristicaselementosnotaspag_l.readonly := false;
        qrycaracteristicaselementosnotaspag_l.append;
        qrycaracteristicaselementosnotaspag_lvalor.asString := qryElementosLinhasvalor.asString;
        qrycaracteristicaselementosnotaspag_labreviatura.asString := qryElementosLinhasabreviatura.asString;
        qrycaracteristicaselementosnotaspag_lpresenteemprodutos.asBoolean := qryElementosLinhaspresenteemprodutos.asboolean;
        qrycaracteristicaselementosnotaspag_lemuso.asBoolean := qryElementosLinhasemuso.AsBoolean;

        qrycaracteristicaselementosnotaspag_l.post;
        MarcarRegistros(qryElementosLinhas, qryElementosLinhasmarcar, Marcando, false, false);
      end;

      if todos then
        qryElementosLinhas.next
      else
        break;

    end;

    if todos then
      qryElementosLinhas.filtered := true;


  end
  else
  begin

    if todos then
      qrycaracteristicaselementosnotaspag_l.first;

    while not qrycaracteristicaselementosnotaspag_l.eof do
    begin

      if not qrycaracteristicaselementosnotaspag_l.readonly and
         qrycaracteristicaselementosnotaspag_lpresenteemprodutos.asboolean then
      begin
        qryElementosLinhas.filtered := false;
        qryElementosLinhas.first;
        if qryElementosLinhas.locate('valor', qrycaracteristicaselementosnotaspag_lvalor.asString, []) then
          MarcarRegistros(qryElementosLinhas, qryElementosLinhasmarcar, Marcando, false, false);

        qryElementosLinhas.filtered := true;

        qrycaracteristicaselementosnotaspag_l.delete;

        if not todos then
          break;

      end
      else
      begin
        if todos then
          qrycaracteristicaselementosnotaspag_l.next
        else
          break;
      end;
    end;

  end;

end;

function TdtmCadastroNotasFiscais.ExcluirLinhas_: Boolean;
begin
  if qrycaracteristicaselementosnotaspag_lemuso.AsBoolean then
  begin
    MensagemAviso(ctELEMENTOGRADEEMUSO);
    Result := False
  end
  else
  begin
    qrycaracteristicaselementosnotaspag_l.Delete;
    Result := True
  end
end;

procedure TdtmCadastroNotasFiscais.qrycaracteristicaselementosnotaspag_lNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qrycaracteristicaselementosnotaspag_lcodigonota.asinteger := qryNotaFiscalcodigo.asinteger;
  qrycaracteristicaselementosnotaspag_lcaracteristica.asString := qryCaracteristicasNotaFiscalcaracteristica.asString;
  qrycaracteristicaselementosnotaspag_lgrade.asinteger := qryCaracteristicasNotaFiscalgrade1.asinteger;
  qrycaracteristicaselementosnotaspag_lcontidonanfe.asboolean := false;
  qrycaracteristicaselementosnotaspag_lpresenteemprodutos.asboolean := false;
  qrycaracteristicaselementosnotaspag_lemuso.asboolean := false;
end;

procedure TdtmCadastroNotasFiscais.qrycaracteristicaselementosnotaspag_cAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  qrycaracteristicaselementosnotaspag_c.readonly := qrycaracteristicaselementosnotaspag_ccontidonanfe.asBoolean;
end;

procedure TdtmCadastroNotasFiscais.qrycaracteristicaselementosnotaspag_cNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qrycaracteristicaselementosnotaspag_ccodigonota.asinteger := qryNotaFiscalcodigo.asinteger;
  qrycaracteristicaselementosnotaspag_ccaracteristica.asString := qryCaracteristicasNotaFiscalcaracteristica.asString;
  qrycaracteristicaselementosnotaspag_cgrade.asinteger := qryCaracteristicasNotaFiscalgrade2.asinteger;
  qrycaracteristicaselementosnotaspag_ccontidonanfe.asboolean := false;
  qrycaracteristicaselementosnotaspag_cpresenteemprodutos.asboolean := false;
  qrycaracteristicaselementosnotaspag_cemuso.asboolean := false;

end;

procedure TdtmCadastroNotasFiscais.IncluirColuna(coluna: String);
begin
  qrycaracteristicaselementosnotaspag_c.readonly := false;
  qrycaracteristicaselementosnotaspag_c.Append;
  qrycaracteristicaselementosnotaspag_cvalor.AsString := coluna;

end;

procedure TdtmCadastroNotasFiscais.AdicionarColunasPresentesemProdutosSelecionadas(
  Marcando, Todos: Boolean);
begin
  if marcando then
  begin

    if todos then
    begin
      qryElementosColunas.filtered := false;
      qryElementosColunas.first;
    end;

    while not qryElementosColunas.eof do
    begin

      if not qryElementosColunasmarcar.AsBoolean and
         qryElementosColunaspresenteemprodutos.AsBoolean then
      begin
        qrycaracteristicaselementosnotaspag_c.readonly := false;
        qrycaracteristicaselementosnotaspag_c.append;
        qrycaracteristicaselementosnotaspag_cvalor.asString := qryElementosColunasvalor.asString;
        qrycaracteristicaselementosnotaspag_cabreviatura.asString := qryElementosColunasabreviatura.asString;
        qrycaracteristicaselementosnotaspag_cpresenteemprodutos.asBoolean := qryElementosColunaspresenteemprodutos.asboolean;
        qrycaracteristicaselementosnotaspag_cemuso.asBoolean := qryElementosColunasemuso.AsBoolean;
        qrycaracteristicaselementosnotaspag_c.post;
        MarcarRegistros(qryElementosColunas, qryElementosColunasmarcar, Marcando, false, false);
      end;

      if todos then
        qryElementosColunas.next
      else
        break;

    end;

    if todos then
      qryElementosColunas.filtered := true;


  end
  else
  begin

    if todos then
      qrycaracteristicaselementosnotaspag_c.first;

    while not qrycaracteristicaselementosnotaspag_c.eof do
    begin

      if not qrycaracteristicaselementosnotaspag_c.readonly and
         qrycaracteristicaselementosnotaspag_cpresenteemprodutos.asboolean then
      begin
        qryElementosColunas.filtered := false;
        qryElementosColunas.first;
        if qryElementosColunas.locate('valor', qrycaracteristicaselementosnotaspag_cvalor.asString, []) then
          MarcarRegistros(qryElementosColunas, qryElementosColunasmarcar, Marcando, false, false);

        qryElementosColunas.filtered := true;

        qrycaracteristicaselementosnotaspag_c.delete;

        if not todos then
          break;

      end
      else
      begin
        if todos then
          qrycaracteristicaselementosnotaspag_c.next
        else
          break;
      end;
    end;

  end;
end;

procedure TdtmCadastroNotasFiscais.AdicionarColunasSelecionadas(Marcando,
  Todos: Boolean);
  
  var vProximo: String;

begin
  if marcando then
  begin

    if todos then
    begin
      qryElementosColunas.filtered := false;
      qryElementosColunas.first;
    end;

    while not qryElementosColunas.eof do
    begin

      if not qryElementosColunasmarcar.AsBoolean then
      begin
        qrycaracteristicaselementosnotaspag_c.readonly := false;
        qrycaracteristicaselementosnotaspag_c.append;
        qrycaracteristicaselementosnotaspag_cvalor.asString := qryElementosColunasvalor.asString;
        qrycaracteristicaselementosnotaspag_cabreviatura.asString := qryElementosColunasabreviatura.asString;
        qrycaracteristicaselementosnotaspag_cpresenteemprodutos.asBoolean := qryElementosColunaspresenteemprodutos.asboolean;
        qrycaracteristicaselementosnotaspag_cemuso.asBoolean := qryElementosColunasemuso.AsBoolean;

        qrycaracteristicaselementosnotaspag_c.post;


        qryElementosColunas.Next;
        vProximo := qryElementosColunasvalor.asString;
        if not qryElementosColunas.eof then
          qryElementosColunas.prior;

        MarcarRegistros(qryElementosColunas, qryElementosColunasmarcar, Marcando, false, false);
      end;

      if todos then
        qryElementosColunas.next
      else
      begin
        qryElementosColunas.Locate('valor', vProximo, []);
        break;
      end;

    end;

    if todos then
      qryElementosColunas.filtered := true;


  end
  else
  begin

    if todos then
      qrycaracteristicaselementosnotaspag_c.first;

    while not qrycaracteristicaselementosnotaspag_c.eof do
    begin

      if not qrycaracteristicaselementosnotaspag_c.readonly then
      begin
        qryElementosColunas.filtered := false;
        qryElementosColunas.first;
        if qryElementosColunas.locate('valor', qrycaracteristicaselementosnotaspag_cvalor.asString, []) then
          MarcarRegistros(qryElementosColunas, qryElementosColunasmarcar, Marcando, false, false)
        else  
        begin
          qryElementosColunas.AfterDelete := nil;
          qryElementosColunas.AfterPost := nil;
          qryElementosColunas.BeforePost := nil;

          qryElementosColunas.append;
          qryElementosColunasgrade.asinteger := qryCaracteristicasNotaFiscalgrade2.AsInteger;
          qryElementosColunasvalor.asString := qrycaracteristicaselementosnotaspag_cvalor.AsString;
          qryElementosColunasabreviatura.asString := qrycaracteristicaselementosnotaspag_cabreviatura.asString;
          qryElementosColunaspresenteemprodutos.AsBoolean := qrycaracteristicaselementosnotaspag_cabreviatura.AsBoolean;
          qryElementosColunasmarcar.asBoolean := false;
          qryElementosColunas.post;

          qryElementosColunas.AfterDelete := qryElementosColunasAfterDelete;
          qryElementosColunas.AfterPost   := qryElementosColunasAfterPost;
          qryElementosColunas.BeforePost  := qryElementosColunasBeforePost;

        end;

        qryElementosColunas.filtered := true;

        qryElementosColunas.locate('valor', qrycaracteristicaselementosnotaspag_cvalor.AsString, []);

        qrycaracteristicaselementosnotaspag_c.delete;

        if not todos then
          break;

      end
      else
      begin
        if todos then
          qrycaracteristicaselementosnotaspag_c.next
        else
          break;
      end;
    end;

  end;

end;

procedure TdtmCadastroNotasFiscais.LocalizarColuna(elemento: String);
begin
 qryElementosColunas.Locate('valor',elemento,[loPartialKey]);
 qrycaracteristicaselementosnotaspag_c.Locate('valor',elemento,[loPartialKey]);
end;

procedure TdtmCadastroNotasFiscais.qryElementosLinhasFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;

  if qryElementosLinhas.filtered then
    accept := not qryElementosLinhasmarcar.asBoolean;

end;

procedure TdtmCadastroNotasFiscais.qryElementosColunasFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  if qryElementosColunas.filtered then
    accept := not qryElementosColunasmarcar.asboolean;
end;

procedure TdtmCadastroNotasFiscais.qryElementosLinhasAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  vcaracteristicaselementosnotaspag_lc := true;
end;

procedure TdtmCadastroNotasFiscais.qryElementosLinhasAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  vcaracteristicaselementosnotaspag_lc := true;

  if qryElementosLinhasvalor.asstring = '' then
    qryElementosLinhas.Delete
  else
  if FInserindoLinhas then
  begin
    AdicionarLinhasSelecionadas(true, false);
    FInserindoLinhas := false;
  end;


end;

procedure TdtmCadastroNotasFiscais.qryElementosLinhasBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  qryElementosLinhasvalor.asString := trim(qryElementosLinhasvalor.asString);
  FInserindoLinhas := qryElementosLinhas.State = dsinsert;

end;

procedure TdtmCadastroNotasFiscais.qryElementosColunasBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  qryElementosColunasvalor.asString := trim(qryElementosColunasvalor.asString);
  FInserindoColunas := qryElementosColunas.State = dsinsert;

end;

procedure TdtmCadastroNotasFiscais.qryElementosColunasAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  vcaracteristicaselementosnotaspag_lc := true;


  if qryElementosColunasvalor.asstring = '' then
    qryElementosColunas.Delete
  else
  if FInserindoColunas then
  begin
    AdicionarColunasSelecionadas(true, false);
    FInserindoColunas := false;
  end;

end;

procedure TdtmCadastroNotasFiscais.qryElementosColunasAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  vcaracteristicaselementosnotaspag_lc := true;
end;

procedure TdtmCadastroNotasFiscais.qrycaracteristicaselementosnotaspag_lBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  qrycaracteristicaselementosnotaspag_l.readonly := false;
end;

procedure TdtmCadastroNotasFiscais.qrycaracteristicaselementosnotaspag_cBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  qrycaracteristicaselementosnotaspag_c.readonly := false;
end;

procedure TdtmCadastroNotasFiscais.qrycaracteristicaselementosnotaspag_lAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  vcaracteristicaselementosnotaspag_lc := true;
end;

procedure TdtmCadastroNotasFiscais.qrycaracteristicaselementosnotaspag_cAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  vcaracteristicaselementosnotaspag_lc := true;
end;

procedure TdtmCadastroNotasFiscais.qrycaracteristicaselementosnotaspag_lAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  vcaracteristicaselementosnotaspag_lc := true;
end;

procedure TdtmCadastroNotasFiscais.qrycaracteristicaselementosnotaspag_cAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  vcaracteristicaselementosnotaspag_lc := true;
end;

procedure TdtmCadastroNotasFiscais.qryCaracteristicasNotaFiscalAfterOpen(
  DataSet: TDataSet);
var
 vListaDescricao : String;
begin
  inherited;

  vListaDescricao := '';

  if qryCaracteristicasNotaFiscal.recordcount = 0 then
  begin
    vListaDescricao := RetornarLista(qryProdutosNotasPagNFE, qryProdutosNotasPagNFEdescricaofornecedor, nil, true);
    if vListaDescricao <> '' then
    begin
      qryIncluirCaracteristicasNFE.ParamByName('codigonota').AsInteger := qryNotaFiscalcodigo.AsInteger;
      qryIncluirCaracteristicasNFE.macrobyname('ListaDescricao').AsString := vListaDescricao;
      qryIncluirCaracteristicasNFE.ExecSql;
      perpetrar([qryIncluirCaracteristicasNFE]);
      qryCaracteristicasNotaFiscal.AfterOpen := nil;
      qryCaracteristicasNotaFiscal.close;
      qryCaracteristicasNotaFiscal.open;
      qryCaracteristicasNotaFiscal.AfterOpen := qryCaracteristicasNotaFiscalAfterOpen;

    end;

  end;

  if assigned(CaracteristicasNotaFiscalAfterOpen) then
    CaracteristicasNotaFiscalAfterOpen(nil);


end;

procedure TdtmCadastroNotasFiscais.SetVisualizarComSaldosQuantidadeNFe(
  const Value: Boolean);
begin
  fVisualizarComSaldosQuantidadeNFe := Value;

  if Value then
  begin
    if qryProdutosNotasPagNFE.filtered then
      qryProdutosNotasPagNFE.filtered := false;
    qryProdutosNotasPagNFE.filtered := true;
  end
  else
    if not qryCaracteristicasNotaFiscalaplicarfiltro.asBoolean then
      qryProdutosNotasPagNFE.filtered := false
    else
    begin
      if qryProdutosNotasPagNFE.filtered then
        qryProdutosNotasPagNFE.filtered := false;
      qryProdutosNotasPagNFE.filtered := true;
    end;

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);

  function FiltrarLInhaColunaProduto: boolean;
  begin
    result := false;

    if (qryCaracteristicasNotaFiscalprodutonofornecedor.asString<>'') then
      result := posM(qryCaracteristicasNotaFiscalprodutonofornecedor.asString,
                     qryProdutosNotasPagNFEprodutonofornecedor.asString,
                     '%');

    if not result  and (qryCaracteristicasNotaFiscalprodutonofornecedor.asString='') then
    begin
      if (qryCaracteristicasNotaFiscalvalorgrade1.asString<>'') and
         (qryCaracteristicasNotaFiscalvalorgrade2.asString<>'') then

      begin
          result :=

                 ((pos(qryCaracteristicasNotaFiscalvalorgrade1.asString, qryProdutosNotasPagNFEdescricaofornecedor.asstring)<>0) and
                  (pos(qryCaracteristicasNotaFiscalvalorgrade2.asString, qryProdutosNotasPagNFEdescricaofornecedor.asstring)<>0)) or

                 ((pos(qryCaracteristicasNotaFiscalvalorgrade1.asString, qryProdutosNotasPagNFEinfadprod.asstring)<>0) and
                  (pos(qryCaracteristicasNotaFiscalvalorgrade2.asString, qryProdutosNotasPagNFEinfadprod.asstring)<>0));

      end
      else
      if (qryCaracteristicasNotaFiscalvalorgrade1.asString<>'') then
      begin

          result :=
                 (pos(qryCaracteristicasNotaFiscalvalorgrade1.asString, qryProdutosNotasPagNFEdescricaofornecedor.asstring)<>0) or
                 (pos(qryCaracteristicasNotaFiscalvalorgrade1.asString, qryProdutosNotasPagNFEinfadprod.asstring)<>0);

      end
      else
      if (qryCaracteristicasNotaFiscalcoluna.asString<>'') then
      begin
          result :=
                 (pos(qryCaracteristicasNotaFiscalvalorgrade2.asString, qryProdutosNotasPagNFEdescricaofornecedor.asstring)<>0) or
                 (pos(qryCaracteristicasNotaFiscalvalorgrade2.asString, qryProdutosNotasPagNFEinfadprod.asstring)<>0);

      end
      else
        result := true;

    end;
  end;

begin
  inherited;
  if qryProdutosNotasPagNFE.filtered then
  begin
    if VisualizarComSaldosQuantidadeNFe and qryCaracteristicasNotaFiscalaplicarfiltro.asBoolean then
      Accept := FiltrarLInhaColunaProduto and
                (qryProdutosNotasPagNFEsaldoquantidadelc.asCurrency <> 0)
    else
    if VisualizarComSaldosQuantidadeNFe then
      Accept := (qryProdutosNotasPagNFEsaldoquantidadelc.asCurrency <> 0)
    else
    if qryCaracteristicasNotaFiscalaplicarfiltro.asBoolean then
      Accept := FiltrarLInhaColunaProduto;
  end;

end;

procedure TdtmCadastroNotasFiscais.VerificarDadosDepoisGravar;
begin
  if qryNotaFiscalsituacao.AsString = 'N' then
  begin
    qryIncluirprodutoscodigobarras.parambyname('codigonota').asinteger := qryNotaFiscalcodigo.asinteger;
    qryIncluirprodutoscodigobarras.execSql;
    perpetrar([qryIncluirprodutoscodigobarras]);
  end;

  Atualizar_Valor_Frete_Contrato;
end;

function TdtmCadastroNotasFiscais.VerificarDadosAntesGravar(
  ds: array of TZDataSet): TtecVerificarDados;
var
 a: integer;
  
begin

  result := Prosseguir;

  for a := 0 to High(ds) do
    if ds[a] is TZDataSet then
      if (TZDataSet(ds[a]).Name = 'qryProdutosNotasPagNFE') or
         (TZDataSet(ds[a]).Name = 'qrynotaspagchv')
      then
      begin
       result := Prosseguir_e_ReabrirVerificacao;
       break;
      end
end;

function TdtmCadastroNotasFiscais.PosicionarProdutosNFEPorProdutosNotaFiscal: boolean;
begin
  result := false;

  {
  if qryProdutosNotasPagNFE.active and qryProdutosNotaFiscal.active and
     (qryProdutosNotaFiscalnumerosequencianfe.AsInteger <> 0) and
     (qryProdutosNotaFiscalnumerosequencianfe.AsInteger <> qryProdutosNotasPagNFEnumero.asinteger) then
  begin
  }
  if not VisualizandoProdutosdaNFE then
  begin
    qryProdutosNotasPagNFEItems.AfterScroll := nil;
    result := qryProdutosNotasPagNFE.Locate('numero', qryProdutosNotaFiscalnumerosequencianfe.AsInteger, []);
    qryProdutosNotasPagNFEItems.AfterScroll := qryProdutosNotasPagNFEItemsAfterScroll;
    result := qryProdutosNotasPagNFEItems.Locate('numero', qryProdutosNotaFiscalnumerosequencianfeitens.AsInteger, []);
  end;  
    {
  end
  else
    result := true;
    }
end;

procedure TdtmCadastroNotasFiscais.qryCaracteristicasNotaFiscalaplicarfiltroChange(
  Sender: TField);
begin
  inherited;

  qryProdutosNotasPagNFE.filtered := aplicarfiltroProdutosNotasPagNFE;
end;

function TdtmCadastroNotasFiscais.aplicarfiltroProdutosNotasPagNFE: boolean;
begin
  result := qryCaracteristicasNotaFiscalaplicarfiltro.asBoolean or
                        VisualizarComSaldosQuantidadeNFe;
end;

function TdtmCadastroNotasFiscais.ApagarProdutosNotasPagGrade(
  ValorColuna, CampoColuna: String): boolean;
var
  ValorLinha: String;
begin
  result := false;
  ValorLinha := qryGrade.fieldbyname('valorlinha').asString;
  vTipoInclusaoProdutoGrade := ViaXml;

  case tpModoGrade of
    SomenteItemAtual:
    begin
      if qrygrade.fieldbyname(CampoColuna).AsCurrency <> 0 then
      begin
        while true do
        begin
          if qryProdutosNotasPagNFEItems.locate('numerosequencianfe;caracteristica;valorgrade1;valorgrade2',
                             VarArrayof([qryprodutosnotaspagnfenumero.AsInteger,
                                         qryCaracteristicasNotaFiscalcaracteristica.asString,
                                         ValorLinha, ValorColuna]),[]) then
            qryProdutosNotasPagNFEItems.delete
          else
            break;
        end;
      end;
    end;

    Todos:
    begin

      if qrygrade.fieldbyname(CampoColuna).AsCurrency <> 0 then
      begin
        qryProdutosNotasPagNFE.First;
        while not qryProdutosNotasPagNFE.eof do
        begin
          while true do
          begin
            if qryProdutosNotasPagNFEItems.locate('numerosequencianfe;caracteristica;valorgrade1;valorgrade2',
                               VarArrayof([qryprodutosnotaspagnfenumero.AsInteger,
                                           qryCaracteristicasNotaFiscalcaracteristica.asString,
                                           ValorLinha, ValorColuna]),[]) then
              qryProdutosNotasPagNFEItems.delete
            else
              break;
          end;
          qryProdutosNotasPagNFE.next;
        end;

        {
        qryProdutosNotaFiscal.mastersource := nil;
        while true do
        begin
          if qryProdutosNotaFiscal.locate('caracteristica;valorgrade1;valorgrade2',
                             VarArrayof([qryCaracteristicasNotaFiscalcaracteristica.asString,
                                         ValorLinha, ValorColuna]),[]) then
          begin
            if PosicionarProdutosNFEPorProdutosNotaFiscal then
              qryProdutosNotasPagNFEItems.delete;
          end
          else
            break;
        end;
        qryProdutosNotaFiscal.mastersource := dsrCaracteristicasNotaFiscal;
        }

      end;

    end;
  end;

  GerarTabelaGrade;
  result := GravarNotaParcial(true);
  if result then
    qryNotaFiscal.edit;
    
//  PosicionarLinhaColunanoProdutoNotaFiscal(CampoColuna);
//  nomedocampoposicionar := CampoColuna;
//  PosicionarLinhaColunaNaGrade(nil);



end;

procedure TdtmCadastroNotasFiscais.qryGradeAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if assigned(GradeAfterOpen) then
    GradeAfterOpen(nil);
end;

procedure TdtmCadastroNotasFiscais.DesabilitarControles(
  Desabilitar: Boolean);
begin
  if Desabilitar then
  begin
    qryProdutosNotaFiscal.AfterScroll := nil;
//    dsrProdutosNotaFiscal.Enabled := false;
    dsrProdutosNotaFiscal.onDataChange := nil;
//    dsrProdutosNotaFiscal.DataSet := nil;
  end
  else
  begin
    qryProdutosNotaFiscal.AfterScroll := qryProdutosNotaFiscalAfterScroll;
//    dsrProdutosNotaFiscal.Enabled := true;
//    dsrProdutosNotaFiscal.DataSet := qryProdutosNotaFiscal;
    dsrProdutosNotaFiscal.onDataChange := dsrProdutosNotaFiscalDataChange;
  end;

end;

procedure TdtmCadastroNotasFiscais.LerArquivoXMLCTe;
var
  n  : integer;
  CTeRTXT: TNFeRTXT;
  vresult : boolean;
begin
  TipoLeituraXML := XMLCte;

  LimparDetalhesNotaFiscal(true);

  try
    ACBrCTe1.Conhecimentos.Clear;
    ACBrCTe1.Conhecimentos.LoadFromFile(fArquivoXMLNFe);

  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      exit;
    end;
  end;


  try

  for n:=0 to ACBrCTe1.Conhecimentos.Count-1 do
  begin
    with ACBrCte1.Conhecimentos.Items[n].CTe do
    begin
//      if (ide.tpServ = tsNormal) or PermitirCTeDiferenteNormal then
//      begin
        if EntradaViaXML then
        begin

          if self.owner.name = 'frmNFeEntradaSefaz' then
            vresult := true
          else
          begin
            vresult := VerificarDestinatarioNFE(Dest.CNPJCPF, false, );

            if not vresult then
            begin
              vresult := VerificarDestinatarioNFE(Rem.CNPJCPF, false);
              if not vresult then
                vresult := VerificarDestinatarioNFE(Dest.CNPJCPF, true);
            end;
          end;

          if vresult then
            vresult := VerificarEmitenteNFE;

          if vresult then
          begin

            vSerie := inttostr(ACBrCTe1.Conhecimentos.Items[0].CTe.Ide.serie);
            if qryvfornecedores.fieldbyname('tipo').asstring = 'F' then
            begin
              vcodigo := qryFornecedor.fieldbyname('codigo').AsInteger;
              vtipo := 'F';
            end
            else
            begin
              vcodigo := qryvfornecedores.fieldbyname('codigo').asinteger;
              vTipo := qryvfornecedores.fieldbyname('tipo').asString;
            end;

            incluindoviaXml := false;

            if self.owner.name = 'frmNFeEntradaSefaz' then
            begin
              RefazConsultaPorNome(qryProcuraFornecedores, ['tipo','codigo'],
                  [vtipo, vcodigo]);

              qryProcuraSeriesFornecedor.parambyname('serie').asString := vSerie;
              qryProcuraSeriesFornecedor.close;
              qryProcuraSeriesFornecedor.open;


              RefazConsultaPorNome(qryNotaFiscal,['fornecedor','tipofornecedor','serie','numero'],
                           [vcodigo, vtipo, vserie, ACBrCTe1.Conhecimentos.Items[0].CTe.Ide.nCT]);

              if qryNotaFiscal.isempty then
              begin
                qryNotaFiscal.append;
                qryNotaFiscalnrdocumento.asinteger := ACBrCTe1.Conhecimentos.Items[0].CTe.Ide.nCT;
              end;

            end
            else
              EntrarChavesNota(self);

            if (qryNotaFiscal.State = dsinsert) then
            begin
              qryNotaFiscalfornecedor.AsInteger := vcodigo;
              qryNotaFiscaltipofornecedor.AsString := vtipo;
              qryNotaFiscalserie.AsString := vSerie;
              qryNotaFiscalTipo.asString := 'CTe';

              if parsistema.EventoCTe <> '' then
                qryNotaFiscalEvento.value := parsistema.EventoCTe;

              qryProcuraNaturezas.close;
                
              if DocumentoReferenciadoNFSaida then
                SelecionarDadosNaturezaPadrao('SERVIÇO DE TRANSPORTE PARA VENDAS',
                   qryProcuraNaturezas, qryNotaFiscal, qryNotaFiscal, NotaEntradaXML, EstadoFilialBase, true)
              else
                SelecionarDadosNaturezaPadrao('SERVIÇO DE TRANSPORTE PARA COMÉRCIO',
                   qryProcuraNaturezas, qryNotaFiscal, qryNotaFiscal, NotaEntradaXML, EstadoFilialBase, true);

              incluindoviaXml := true;
              ImportarDadosCorpoNFE;
              ImportarDadosVencimentoNFE;
              ImportarDocumentosReferenciados;
              ImportarProdutosNFE;

            end
            else
            if IncluidoViaXml then
              ImportarDadosVencimentoNFE;
          end;
        end
        else
          ImportarDadosVencimentoNFE;
      {
      end
      else
      begin

        MensagemAviso(format('O tipo de frete é %S. '+chr(13)+
                      'O CTe não pode ser importado para este tipo.',
                      [DescricaoTpcteTipoServico(ide.tpServ)]));
        exit;
      end;
      }

    end;

  end;

  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      exit;
    end;
  end;


end;

function TdtmCadastroNotasFiscais.ValorPropriedade(propriedade,
  classe: String): Variant;
begin
  if (classe = 'Ide') and (propriedade = 'serie') then
  begin
    case TipoLeituraXML of
    XMLNfe : result := ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.serie;
    XMLCte : result := ACBrCTe1.Conhecimentos.Items[0].CTe.Ide.serie;
    end;
  end
  else
  if (classe = 'Ide') and (propriedade = 'nNF') then
  begin
    case TipoLeituraXML of
    XMLNfe : result := ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF;
    XMLCte : result := ACBrCTe1.Conhecimentos.Items[0].CTe.Ide.nCT;
    end;
  end
  else
  if (classe = 'Emit') and (propriedade = 'CNPJCPF') then
  begin
    case TipoLeituraXML of
    XMLNfe : result := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.CNPJCPF;
    XMLCte : result := ACBrCTe1.conhecimentos.Items[0].CTe.Emit.CNPJ;
    end;
  end
  else
  if (classe = 'Emit') and (propriedade = 'xNome') then
  begin
    case TipoLeituraXML of
    XMLNfe : result := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.xNome;
    XMLCte : result := ACBrCTe1.conhecimentos.Items[0].CTe.Emit.xNome;
    end;
  end
  else
  if (classe = 'Emit') and (propriedade = 'xFant') then
  begin
    case TipoLeituraXML of
    XMLNfe : result := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.xFant;
    XMLCte : result := ACBrCTe1.conhecimentos.Items[0].CTe.Emit.xFant;
    end;
  end
  else
  if (classe = 'Emit') and (propriedade = 'IM') then
  begin
    case TipoLeituraXML of
    XMLNfe : result := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.IM;
    XMLCte : result := '';
    end;
  end
  else
  if (classe = 'Emit') and (propriedade = 'IE') then
  begin
    case TipoLeituraXML of
    XMLNfe : result := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.IE;
    XMLCte : result := ACBrCTe1.conhecimentos.Items[0].CTe.Emit.IE;
    end;
  end
  else
  if (classe = 'Emit') and (propriedade = 'CRT') then
  begin
    case TipoLeituraXML of
    XMLNfe : result := pcnConversaoNFe.CrtToStr(aCBrNFe1.NotasFiscais.Items[0].NFe.Emit.CRT);
    XMLCte : begin
               if ACBrCTe1.conhecimentos.Items[0].CTe.imp.icms.SituTrib = cstICMSSN then
                 result := ACBrCTe1.conhecimentos.Items[0].CTe.imp.icms.ICMSSN.indSN
               else
                 result := 3;
             end;
    end;
  end
  else
  if (classe = 'Emit.EnderEmit') and (propriedade = 'UF') then
  begin
    case TipoLeituraXML of
    XMLNfe : result := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.UF;
    XMLCte : result := ACBrCTe1.conhecimentos.Items[0].CTe.Emit.EnderEmit.UF;
    end;
  end
  else
  if (classe = 'Emit.EnderEmit') and (propriedade = 'CEP') then
  begin
    case TipoLeituraXML of
    XMLNfe : result := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.CEP;
    XMLCte : result := ACBrCTe1.conhecimentos.Items[0].CTe.Emit.EnderEmit.CEP;
    end;
  end
  else
  if (classe = 'Emit.EnderEmit') and (propriedade = 'cMun') then
  begin
    case TipoLeituraXML of
    XMLNfe : result := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.cMun;
    XMLCte : result := ACBrCTe1.conhecimentos.Items[0].CTe.Emit.EnderEmit.cMun;
    end;
  end
  else
  if (classe = 'Emit.EnderEmit') and (propriedade = 'xmun') then
  begin
    case TipoLeituraXML of
    XMLNfe : result := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xmun;
    XMLCte : result := ACBrCTe1.conhecimentos.Items[0].CTe.Emit.EnderEmit.xmun;
    end;
  end
  else
  if (classe = 'Emit.EnderEmit') and (propriedade = 'xBairro') then
  begin
    case TipoLeituraXML of
    XMLNfe : result := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xBairro;
    XMLCte : result := ACBrCTe1.conhecimentos.Items[0].CTe.Emit.EnderEmit.xBairro;
    end;
  end
  else
  if (classe = 'Emit.EnderEmit') and (propriedade = 'xLgr') then
  begin
    case TipoLeituraXML of
    XMLNfe : result := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xLgr;
    XMLCte : result := ACBrCTe1.conhecimentos.Items[0].CTe.Emit.EnderEmit.xLgr;
    end;
  end
  else
  if (classe = 'Emit.EnderEmit') and (propriedade = 'nro') then
  begin
    case TipoLeituraXML of
    XMLNfe : result := somentenumero(ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.nro);
    XMLCte : result := somentenumero(ACBrCTe1.conhecimentos.Items[0].CTe.Emit.EnderEmit.nro);
    end;
  end
  else
  if (classe = 'Emit.EnderEmit') and (propriedade = 'xCpl') then
  begin
    case TipoLeituraXML of
    XMLNfe : result := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xCpl;
    XMLCte : result := ACBrCTe1.conhecimentos.Items[0].CTe.Emit.EnderEmit.xCpl;
    end;
  end
  else
  if (classe = 'Emit.EnderEmit') and (propriedade = 'fone') then
  begin
    case TipoLeituraXML of
    XMLNfe : result := ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.fone;
    XMLCte : result := ACBrCTe1.conhecimentos.Items[0].CTe.Emit.EnderEmit.fone;
    end;
  end;
end;

procedure TdtmCadastroNotasFiscais.refazerConsultaPedidos;
begin
  RefazConsultaPorNome(qryConsultaPedidos, ['codigonota'], [qryNotaFiscalcodigo.asInteger]);
end;

function TdtmCadastroNotasFiscais.ExibirFicha(FormOrigem: String): boolean;
begin
 result := ExibirFichacliente(qryProcuraFornecedorescodigo.AsInteger,
                              qryProcuraFornecedorestipo.AsString,
                              qryProcuraFornecedoresnome.AsString,
                              FormOrigem)
end;


{
procedure TdtmCadastroNotasFiscais.AdicionarListaProdutosComponentesdosCompostos(
  Produto: String);
begin
  vListaProdutosComponentesdosCompostos.append(Produto);
end;
}

procedure TdtmCadastroNotasFiscais.AtualizacoesAposGravacao;
var
  Frm : TForm;

begin
  dtmCalcularCusto.AtualizacoesAposGravacao;


  {
  qryContratos_chv.first;
  while not qryContratos_chv.eof do
  begin
    Frm := Tfrmcadastrocontratos.Referencia;
    if Assigned(Frm) then
      TfrmCadastroContratos(Frm).SelecionarContrato(qryContratos_chvcontrato.asString)

    qryContratos_chv.next;
  end;
  }


end;

procedure TdtmCadastroNotasFiscais.DataModuleCreate(Sender: TObject);
begin
  inherited;
  RemoveDataModule(Self);

//  if not assigned(dtmCalcularCusto) then
//    dtmCalcularCusto := TdtmCalcularCusto.create(self);

end;

procedure TdtmCadastroNotasFiscais.AlertarProdutosPedidosnaNotaNormal;
 var
 vListaProdutosPedidos, vListaProdutosPedidos_p: String;

begin

  vListaProdutosPedidos := RetornarLista(qryProdutosNotaFiscal,
    [qryProdutosNotaFiscalpedido, qryProdutosNotaFiscalnumeroprodutotabela],
    qryProdutosNotaFiscalpedido_com_nf_normal);

  vListaProdutosPedidos_p := RetornarLista(qryProdutosNotaFiscal,
    [qryProdutosNotaFiscalpedido, qryProdutosNotaFiscalproduto],
    qryProdutosNotaFiscalpedido_com_nf_normal);

  if (vListaProdutosPedidos <> '') or
     (vListaProdutosPedidos_p <> '') then
  begin

    if vListaProdutosPedidos = '' then
      vListaProdutosPedidos := '(0,0)';

    if vListaProdutosPedidos_p = '' then
      vListaProdutosPedidos_p := '(0,0)';

    qryListaPedidosProdutosIncluidos.macrobyname('ListaProdutosPedidos').asString := vListaProdutosPedidos;
    qryListaPedidosProdutosIncluidos.macrobyname('ListaProdutosPedidos_p').asString := vListaProdutosPedidos_p;

    qryListaPedidosProdutosIncluidos.close;
    qryListaPedidosProdutosIncluidos.open;
    if qryListaPedidosProdutosIncluidos.recordcount <> 0 then
    begin
      frmMensagemGrid := TfrmMensagemGrid.Create(frmMensagemGrid);
      frmMensagemGrid.Caption := 'Alerta de pedidos associados com os produtos';
      frmMensagemGrid.lblTitulo.Caption := 'OS PREÇOS DE VENDA DEVEM SER VERIFICADOS!';
      frmMensagemGrid.lblTExto.Caption := 'O pedido foi associado ao produto após a gravação da nota fiscal, verifique os preços de venda dos produtos abaixo:';
      frmMensagemGrid.dbgMensagem.DataSource := dsrListaPedidosProdutosIncluidos;
      frmMensagemGrid.ShowModal;
      frmMensagemGrid.Free;
    end;
  end;

end;

procedure TdtmCadastroNotasFiscais.qryVolumesNotasPagNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryVolumesNotasPagnotapag.AsInteger := qryNotaFiscalcodigo.AsInteger;
  qryVolumesNotasPagcodigo.AsInteger  := qryVolumesNotasPag.RecNo;

end;

procedure TdtmCadastroNotasFiscais.IncluirporEAN;
begin
  try
//    qryProdutosNotasPagNFE.GuardarRegistroAtual(false);


    qryProdutosNotasPagNFE.first;
    while not qryProdutosNotasPagNFE.eof do
    begin

      if not qryProdutosNotasPagNFEceantrib.isnull and
             qryProdutosNotasPagNFEitemsprodutodigitado.isnull then
      begin

        RefazConsultaPorNome(qryProcuraProdutoNotaFiscal, ['produtovisual','caracteristica','valorgrade1','valorgrade2'],
                   [qryProdutosNotasPagNFEceantrib.AsString,
                    null, null, null], true);

        if qryProcuraProdutoNotaFiscal.recordcount <> 0 then
        begin
          try
            GuardarPosicaoProdutosNotasPagNFE;
            qryProdutosNotasPagNFEItems.edit;
            qryProdutosNotasPagNFEItemsprodutodigitado.asString := qryProdutosNotasPagNFEceantrib.asstring;
            dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemsprodutodigitado);

          finally
            VoltarPosicaoProdutosNotasPagNFE;
            CampoProdutosNotasPagNFEItemsAlterado := nil;
            VerificarValoresProdutosNotasPagNFEItems;
          end;
        end;
      end;
      qryProdutosNotasPagNFE.next;
    end;
  finally
//    qryProdutosNotasPagNFE.VoltarRegistro;
  end;


end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  ;
end;

procedure TdtmCadastroNotasFiscais.ImportarDocumentosReferenciados;
var
  I : integer;
begin

  case TipoLeituraXML of
    XMLCTe :
    begin
    { pcteConversaoCTe }
//      if (ACBrCTe1.Conhecimentos.Items[0].CTe.ide.tpServ = tsNormal) or PermitirCTeDiferenteNormal then
      begin
        with ACBrCTe1.Conhecimentos.Items[0].CTe.infCTeNorm do
        begin

          for I:=0 to infDoc.infNFe.Count-1 do
          begin
            with infDoc.infNFe.Items[I] do
            begin

              if not qrynotaspagchv.locate('chv_nfe', infDoc.infNFe.Items[I].chave, []) then
              begin
                qrynotaspagchv.append;
                qrynotaspagchvcodigonota.asinteger := qryNotaFiscalcodigo.asinteger;
                qrynotaspagchvchv_nfe.asString := infDoc.infNFe.Items[I].chave;
                qrynotaspagchv.post;
              end;

            end;
          end;
        end;
      end;
    end;

  end;
end;

procedure TdtmCadastroNotasFiscais.Atualizar_Valor_Frete_Contrato;
begin
  if qrynotaspagchv.recordcount <> 0 then
  begin
    qryUpdateContratos_chv.ParamByName('codigonota').asinteger := qryNotaFiscalcodigo.asinteger;
    qryUpdateContratos_chv.execsql;
    perpetrar([qryUpdateContratos_chv]);
  end;
end;

function TdtmCadastroNotasFiscais.getFilialBase_Entrada: integer;
begin
  if self.owner.name = 'frmNFeEntradaSefaz' then
    fFilialBase_Entrada :=  TfrmNFeEntradaSefaz(self.owner).qryNSUSfilial.asinteger
  else
    fFilialBase_Entrada := FilialBase;
  Result := fFilialBase_Entrada;
end;

function TdtmCadastroNotasFiscais.GetCNPJFilialBase_Entrada: String;
begin
  if self.owner.name = 'frmNFeEntradaSefaz' then
    fCNPJFilialBase_Entrada :=  TfrmNFeEntradaSefaz(self.owner).qryNSUScnpj.asString
  else
    fCNPJFilialBase_Entrada := CNPJFilialBase;
  Result := fCNPJFilialBase_Entrada;
end;

function TdtmCadastroNotasFiscais.getFilialContabil_Entrada: integer;
begin
  if self.owner.name = 'frmNFeEntradaSefaz' then
    fFilialContabil_Entrada :=  TfrmNFeEntradaSefaz(self.owner).qryNSUSfilialcontabil.asinteger
  else
    fFilialContabil_Entrada := FilialContabil;

  Result := fFilialContabil_Entrada;
end;

function TdtmCadastroNotasFiscais.CondicaoIncluirDuplicatasCTe: Boolean;
begin
  result := True;

  if self.owner.name = 'frmNFeEntradaSefaz' then
  begin
    if ACBrCTe1.Conhecimentos.Items[0].CTe.toma.CNPJCPF =
       CNPJFilialBase_Entrada then
      result := True
    else
      Result := False;
  end;
end;

function TdtmCadastroNotasFiscais.DocumentoReferenciadoNFSaida: Boolean;
var
  I : integer;
  vListaChaves: String;
begin
  result := false;
  vListaChaves := '';

  case TipoLeituraXML of
    XMLCTe :
    begin
      with ACBrCTe1.Conhecimentos.Items[0].CTe.infCTeNorm do
      begin
        for I:=0 to infDoc.infNFe.Count-1 do
          vListaChaves := vListaChaves + quotedstr(infDoc.infNFe.Items[I].chave)+', '
      end;

      if vListaChaves <> '' then
      begin
        delete(vListaChaves, length(vListaChaves)-1, 2);
        qryDadosFiscaischv.close;
        qryDadosFiscaischv.macrobyname('ListaNFe').asString := vListaChaves;
        qryDadosFiscaischv.open;
        result := qryDadosFiscaischv.recordcount > 0;

      end;

    end;
  end;
end;

procedure TdtmCadastroNotasFiscais.DesligarEventosProdutosNotasPagNFE;
begin
  dsrProdutosNotasPagNFE.onDataChange   := nil;
  qryProdutosNotasPagNFE.AfterScroll  := nil;
  qryProdutosNotasPagNFE.BeforeDelete := nil;
  qryProdutosNotasPagNFE.BeforeInsert := nil;
  qryProdutosNotasPagNFE.onFilterRecord := nil;

//  qryProdutosNotasPagNFE.disablecontrols;

end;

procedure TdtmCadastroNotasFiscais.LigarEventosProdutosNotasPagNFE;
begin
  dsrProdutosNotasPagNFE.onDataChange    := dsrProdutosNotasPagNFEDataChange;
  qryProdutosNotasPagNFE.AfterScroll     := qryProdutosNotasPagNFEAfterScroll;
  qryProdutosNotasPagNFE.BeforeDelete    := qryProdutosNotasPagNFEBeforeDelete;
  qryProdutosNotasPagNFE.BeforeInsert    := qryProdutosNotasPagNFEBeforeInsert;
  qryProdutosNotasPagNFE.onFilterRecord  := qryProdutosNotasPagNFEFilterRecord;

//  qryProdutosNotasPagNFE.enablecontrols;
end;

procedure TdtmCadastroNotasFiscais.VerificarCampos_ProdutosNotasPagNFEItems(
  Sender: TObject; Field: TField);
begin
  if field = qryProdutosNotasPagNFEItemsprodutodigitado then
  begin
    RefazConsultaPorNome(qryProcuraProdutoNotaFiscal, ['produtovisual','caracteristica','valorgrade1','valorgrade2'],
                           [qryProdutosNotasPagNFEItemsprodutodigitado.AsString,
                            null, null, null], true);

    if qryProdutosNotasPagNFEItemsprodutovisual.AsString <> qryProcuraProdutoNotaFiscalprodutovisual.AsString then
      qryProdutosNotasPagNFEItemsprodutovisual.AsString := qryProcuraProdutoNotaFiscalprodutovisual.AsString;
    if qryProdutosNotasPagNFEItemsproduto.AsString <> qryProcuraProdutoNotaFiscalproduto.AsString then
      qryProdutosNotasPagNFEItemsproduto.AsString := qryProcuraProdutoNotaFiscalproduto.AsString;
    if qryProdutosNotasPagNFEItemsdescricaoproduto.AsString <> qryProcuraProdutoNotaFiscaldescricao.AsString then
      qryProdutosNotasPagNFEItemsdescricaoproduto.AsString := qryProcuraProdutoNotaFiscaldescricao.AsString;

    {
    if qryProcuraNaturezasProdutoNFE.MacroByName('CodigoNaturezaPadrao').AsString <> ' and (naturezas.codigo = ' + IntToStr(qryProdutosNotasPagNFEItemsnatureza.AsInteger) + ') ' then
    begin
      qryProcuraNaturezasProdutoNFE.MacroByName('CodigoNaturezaPadrao').AsString := ' and (naturezas.codigo = ' + IntToStr(qryProdutosNotasPagNFEItemsnatureza.AsInteger) + ') ';
      qryProcuraNaturezasProdutoNFE.close;
    end;
    RefazConsultaPorNome(qryProcuraNaturezasProdutoNFE,['codigofiscal'], [qryProdutosNotasPagNFEItemscodigofiscal.AsVariant], true);
    }

    AtribuirDadosProdutos(qryprodutosNotasPagNFEitems, qryNotaFiscal, qryProcuraNaturezasProdutoNFE, false, NotaEntradaXML);
//    AtribuirDadosCalculosImpostos(qryNotaFiscal, qryProcuraProdutoNotaFiscal, qryProcuraNaturezasProdutoNFE, qryProdutosNotasPagNFEitems, NotaEntradaXML, True);

    {
    if (qryProcuraPedidosNFE.RecordCount = 0) or
       (qryProcuraPedidosNFE.parambyname('pedido').asinteger <> qryProdutosNotasPagNFEItemspedido.asinteger) or
       (qryProcuraPedidosNFE.parambyname('produto').asString <> ifthen((qryProdutosNotasPagNFEItemsproduto.asString=''),'0',qryProdutosNotasPagNFEItemsproduto.asString)) or
       (qryProcuraPedidosNFE.parambyname('codigonota').asinteger <> qryNotaFiscalcodigo.asinteger) then

      RefazConsultaPorNome(qryProcuraPedidosNFE, ['pedido','produto','codigonota'],
                           [qryProdutosNotasPagNFEItemspedido.asinteger,
                            ifthen((qryProdutosNotasPagNFEItemsproduto.asString=''),'0',qryProdutosNotasPagNFEItemsproduto.asString),
                            qryNotaFiscalcodigo.asinteger], true);

    qryProdutosNotasPagNFEItemsnumeroprodutonopedido.asVariant := qryProcuraPedidosNFEnumero.asvariant;
    qryProdutosNotasPagNFEItemsprecounitariopedido.asCurrency := qryProcuraPedidosNFEprecounitariopedido.asCurrency;


    VerificarUnidadeNFE;
    }

    if (qryprodutosfornecedoresUnidades.RecordCount = 0) or
       (qryProdutosFornecedoresUnidades.ParamByName('produto').AsString <> qryProdutosNotasPagNFEItemsproduto.AsString) or
       (qryProdutosFornecedoresUnidades.ParamByName('fornecedor').asinteger <> qryNotaFiscalfornecedor.AsInteger) or
       (qryProdutosFornecedoresUnidades.ParamByName('tipofornecedor').asstring <> qryNotaFiscaltipofornecedor.AsString) or
       (qryProdutosFornecedoresUnidades.ParamByName('unidade').asstring <> qryProdutosNotasPagNFEItemsunidadenfe.AsString)  then
      RefazConsultaporNome(qryProdutosFornecedoresUnidades, ['produto','fornecedor','tipofornecedor','unidade'],
                       [ifthen(trim(qryProdutosNotasPagNFEItemsproduto.AsString)<>'',qryProdutosNotasPagNFEItemsproduto.AsString, '0'), qryNotaFiscalfornecedor.AsInteger,
                        qryNotaFiscaltipofornecedor.AsString, qryProdutosNotasPagNFEItemsunidadenfe.AsString], true);

    if qryProdutosFornecedoresUnidadesfatorconversao.AsFloat <> 0 then
      qryProdutosNotasPagNFEItemsfatorconversao.AsFloat := qryProdutosFornecedoresUnidadesfatorconversao.AsFloat
    else
      qryProdutosNotasPagNFEItemsfatorconversao.AsFloat := 1;

    qryProdutosNotasPagNFEItemsqtdeestoque.asfloat := FormatarQuantidadeFloat(qryProdutosNotasPagNFEItemsquantidade.AsFloat * qryProdutosNotasPagNFEItemsfatorconversao.AsFloat);

//    SituacaoProdutosFornecedoresUnidades;
//    SituacaoUnidade;
//    SituacaoPedido; {se tiver numero de pedido}
    SituacaoNLote;
    SituacaoProduto(true);

//    if not vAtualizandoCodigoFiscalProdutosNFE then
//      if not ExisteSituacaoErro then
//        CalcularImpostos;

//    if vLigarEventosProdutosNotasPagNFEItems then
//      dsrProdutosNotasPagNFEItems.OnDataChange := dsrProdutosNotasPagNFEItemsDataChange;

  end
  else
  if field = qryProdutosNotasPagNFEItemspedido then
  begin
      if (qryProcuraPedidosNFE.RecordCount = 0) or
         (qryProcuraPedidosNFE.parambyname('pedido').asinteger <> qryProdutosNotasPagNFEItemspedido.asinteger) or
         (qryProcuraPedidosNFE.parambyname('produto').asString <> ifthen((qryProdutosNotasPagNFEItemsproduto.asString=''),'0',qryProdutosNotasPagNFEItemsproduto.asString)) or
         (qryProcuraPedidosNFE.parambyname('codigonota').asinteger <> qryNotaFiscalcodigo.asinteger) then
        RefazConsultaPorNome(qryProcuraPedidosNFE, ['pedido','produto','codigonota'],
                         [qryProdutosNotasPagNFEItemspedido.asinteger,
                          ifthen((qryProdutosNotasPagNFEItemsproduto.asString=''),'0',qryProdutosNotasPagNFEItemsproduto.asString),
                          qryNotaFiscalcodigo.asinteger], true);

      qryProdutosNotasPagNFEItemsnumeroprodutonopedido.asVariant := qryProcuraPedidosNFEnumero.asvariant;
      qryProdutosNotasPagNFEItemsprecounitariopedido.asCurrency := qryProcuraPedidosNFEprecounitariopedido.asCurrency;

      SituacaoPedido;
  //    SalvarProdutosNFE;

//      if vLigarEventosProdutosNotasPagNFEItems then
//        dsrProdutosNotasPagNFEItems.OnDataChange := dsrProdutosNotasPagNFEItemsDataChange;
  end
  else
  if field = qryProdutosNotasPagNFEItemscodigofiscal then
  begin
    if (qryProcuraNaturezasProdutoNFE.recordcount = 0) or
       (FCodigoFiscalProdutoNFEOriginal <> qryProdutosNotasPagNFEItemscodigofiscal.asinteger) then
      RefazConsultaPorNome(qryProcuraNaturezasProdutoNFE,['codigofiscal'],[qryProdutosNotasPagNFEItemscodigofiscal.AsVariant], true);

    if not QuantidadeNaturezasProdutoNFE then
      SelecionarNaturezaProdutoNFE(qryProcuraNaturezasProdutoNFEcodigo.asinteger, qryProcuraNaturezasProdutoNFEcodigofiscal.asinteger, false);

    SituacaoCodigoFiscal;

  end;

end;


procedure TdtmCadastroNotasFiscais.SituacaoProduto(Reatualizar: boolean = false);
begin

  GuardarPosicaoProdutosNotasPagNFE;

  if qryProcuraProdutoNotaFiscalobservacoesentrada.asString<>'' then
    ListaErroProdutosNFE('OBS. ENTRADA: ', qryProcuraProdutoNotaFiscalobservacoesentrada.asString, opAdicionar, loPartialKey, False, True)
  else
    ListaErroProdutosNFE('OBS. ENTRADA: ', '', opRemover, loPartialKey, false);

  VoltarPosicaoProdutosNotasPagNFE;

  if parsistema.AtualizarNCMNotaEntrada then
  begin
    SituacaoProdutosNotasPagNFEClassificacaoFiscal(1, Reatualizar);
  end
  else
  begin
    if not qryProdutosNotasPagNFEItemsncmempresa.isnull then
    begin
      GuardarPosicaoProdutosNotasPagNFE;
      ListaErroProdutosNFE('O NCM na empresa não esta preenchido', '', opRemover, loCaseInsensitive);
      VoltarPosicaoProdutosNotasPagNFE;


      GuardarPosicaoProdutosNotasPagNFE;
      if (qryProdutosNotasPagNFEncmfornecedor.AsString <> qryProdutosNotasPagNFEItemsncmempresa.AsString) then
        ListaErroProdutosNFE('O NCM na empresa é diferente do NCM no fornecedor', '', opAdicionar, loCaseInsensitive, false)
      else
        ListaErroProdutosNFE('O NCM na empresa é diferente do NCM no fornecedor', '', opRemover, loCaseInsensitive, false);
      VoltarPosicaoProdutosNotasPagNFE;

    end
    else
    begin
      GuardarPosicaoProdutosNotasPagNFE;
      ListaErroProdutosNFE('O NCM na empresa não esta preenchido', '', opAdicionar, loCaseInsensitive);
      VoltarPosicaoProdutosNotasPagNFE;

    end;
  end;

  if (qryProcuraProdutoNotaFiscal.RecordCount = 0) then
    { qryProdutosNotasPagNFEItemsproduto.isnull then}
  begin
    GuardarPosicaoProdutosNotasPagNFE;
    ListaErroProdutosNFE('Produto não foi identificado na empresa', '', opAdicionar );
    VoltarPosicaoProdutosNotasPagNFE;

  end
  else
  begin
    GuardarPosicaoProdutosNotasPagNFE;
    ListaErroProdutosNFE('Produto não foi identificado na empresa', '', opRemover, loCaseInsensitive, true, Reatualizar);
    VoltarPosicaoProdutosNotasPagNFE;
  end;

end;


procedure TdtmCadastroNotasFiscais.SituacaoPedido;
begin

  if (qryProcuraPedidosNFEpedido.asinteger = 0) and
     (qryProdutosNotasPagNFEItemspedido.asinteger <> 0) then
  begin
    ListaErroProdutosNFE('O pedido não existe', '',  opAdicionar, LoCaseInsensitive, false);
    qryProdutosNotasPagNFEItemspedidook.asBoolean := false;
  end
  else
  begin
    GuardarPosicaoProdutosNotasPagNFE;
    ListaErroProdutosNFE('O pedido não existe', '',  opRemover, LoCaseInsensitive, false);
    qryProdutosNotasPagNFEItemspedidook.asBoolean := true;
    VoltarPosicaoProdutosNotasPagNFE;
  end;

  if (qryProcuraPedidosNFEpedido.asinteger <> 0) and
     (qryProdutosNotasPagNFEItemspedido.asinteger <> 0) and
     (qryProcuraPedidosNFEquantidadependentepedido.ascurrency <= 0) then
    ListaErroProdutosNFE('A quantidade do pedido já foi atendida', '',  opAdicionar )
  else
  begin
    GuardarPosicaoProdutosNotasPagNFE;
    ListaErroProdutosNFE('A quantidade do pedido já foi atendida', '',  opREmover);
    VoltarPosicaoProdutosNotasPagNFE;
  end;

  if (qryProcuraPedidosNFEpedido.asinteger <> 0) and
     (qryProdutosNotasPagNFEItemspedido.asinteger <> 0) and
     (qryProcuraPedidosNFEfilialentrega.asinteger <> FilialBase) then
    ListaErroProdutosNFE('A filial de entrega está diferente da filial base', '',  opAdicionar )
  else
  begin
    GuardarPosicaoProdutosNotasPagNFE;
    ListaErroProdutosNFE('A filial de entrega está diferente da filial base', '',  opREmover);
    VoltarPosicaoProdutosNotasPagNFE;
  end;

  if (qryProcuraPedidosNFEpedido.asinteger <> 0) and
     (qryProdutosNotasPagNFEItemspedido.asinteger <> 0) and
     (not qryProcuraPedidosNFEcancelado.isnull) then
    ListaErroProdutosNFE('O pedido foi cancelado em ' + qryProcuraPedidosNFEcancelado.asstring, '', opAdicionar )
  else
  begin
    GuardarPosicaoProdutosNotasPagNFE;
    ListaErroProdutosNFE('O pedido foi cancelado em ' {+ qryProcuraPedidosNFEcancelado.asstring}, '', opREmover, LoPartialKey);
    VoltarPosicaoProdutosNotasPagNFE;
  end;

  if (qryProcuraPedidosNFEpedido.asinteger <> 0) and
     (qryProdutosNotasPagNFEItemspedido.asinteger <> 0) and
     (not qryProcuraPedidosNFEconcluido.isnull) and
     (qryNotaFiscalsituacao.AsString <> 'N') then
    ListaErroProdutosNFE('O pedido foi concluido em ' + qryProcuraPedidosNFEconcluido.asstring, '', opAdicionar )
  else
  begin
    GuardarPosicaoProdutosNotasPagNFE;
    ListaErroProdutosNFE('O pedido foi concluido em ' {+ qryProcuraPedidosNFEconcluido.asstring}, '',  opREmover, LoPartialKey);
    VoltarPosicaoProdutosNotasPagNFE;
  end;

  if (qryProcuraPedidosNFEpedido.asinteger <> 0) and
     (qryProdutosNotasPagNFEItemspedido.asinteger <> 0) and
     (qryProcuraPedidosNFEfornecedor.asinteger <> qryNotaFiscalfornecedor.AsInteger) and
     (qryProcuraPedidosNFEgrupofornecedor.asinteger <> qryProcuraFornecedoresgrupofornecedor.AsInteger) then
    ListaErroProdutosNFE('O fornecedor do pedido difere da NF-e', '', opAdicionar )
  else
  begin
    GuardarPosicaoProdutosNotasPagNFE;
    ListaErroProdutosNFE('O fornecedor do pedido difere da NF-e', '', opREmover);
    VoltarPosicaoProdutosNotasPagNFE;
  end;

  if (qryProcuraPedidosNFEpedido.asinteger <> 0) and
     (qryProdutosNotasPagNFEItemspedido.asinteger <> 0) and
     (qryProdutosNotasPagNFEItemsprecounitario.AsFloat <> qryProcuraPedidosNFEprecounitariopedido.AsCurrency) then
    ListaErroProdutosNFE('O preço unitário da nota difere do pedido', '', opAdicionar, loCaseInsensitive, false)
  else
  begin
    GuardarPosicaoProdutosNotasPagNFE;
    ListaErroProdutosNFE('O preço unitário da nota difere do pedido', '', opRemover, loCaseInsensitive, false);
    VoltarPosicaoProdutosNotasPagNFE;
  end;

end;



procedure TdtmCadastroNotasFiscais.SituacaoCodigoFiscal;
begin
  if qryProdutosNotasPagNFEItemscodigofiscal.AsInteger = 0 then
    ListaErroProdutosNFE('CFOP não identificado', '', opAdicionar )
  else
    ListaErroProdutosNFE('CFOP não identificado', '', opRemover );
end;

procedure TdtmCadastroNotasFiscais.CancelarProdutosNotaFiscal_;
begin
  if State_qryProdutosNotaFiscal = dsinsert then
  begin
    if qryProdutosNotaFiscal.state <> dsinsert then
      if CDSProdutosNotaFiscalAux.active and (CDSProdutosNotaFiscalAux.recno <> qryProdutosNotaFiscal.recno) then
        qryProdutosNotaFiscal.delete;
  end
  else
  begin
    if CDSProdutosNotaFiscalAux.active then
    begin
      CDSProdutosNotaFiscalAux.recno := qryProdutosNotaFiscal.recno;
      CopiaRegistrosporNome(ttecQuery(CDSProdutosNotaFiscalAux), qryProdutosNotaFiscal, false, true, false, true, true, true, true);
    end;
  end;

  OpenClientDataSetProdutosNotaFiscal(CDSProdutosNotaFiscalAux, Close);
  State_qryProdutosNotaFiscal := dsBrowse;

end;

procedure TdtmCadastroNotasFiscais.OpenClientDataSetProdutosNotaFiscal(
  NameClient: TClientDataSet; Operation: tOperationClientDataSet);
begin
  try

    qryProdutosNotaFiscal.GuardarRegistroAtual(true, false);

    if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
      TtecDBGrid(self.owner.FindComponent('dbgProdutosNotaFiscal')).visible := false;


    case operation of
      open:;

      close: NameClient.close;

      Open_and_Close:
      begin
        NameClient.close;
        NameClient.open;
        if NameClient.recordcount <>  //bug tclientdataset...segunda vez não retorna todos registros
          qryProdutosNotaFiscal.recordcount then
        begin
          qryProdutosNotaFiscal.VoltarRegistro;
          OpenClientDataSetProdutosNotaFiscal(NameClient, Open_and_Close);
        end;
      end;

    end;

  finally
    qryProdutosNotaFiscal.VoltarRegistro;

    if NameClient.active then
      NameClient.recno := qryProdutosNotaFiscal.recno;

    if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
      TtecDBGrid(self.owner.FindComponent('dbgProdutosNotaFiscal')).visible := true;

  end;

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFELotesNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryProdutosNotasPagNFELotescodigonota.asinteger := qryNotaFiscalcodigo.AsInteger;
  qryProdutosNotasPagNFELotesnumerosequencianfe.AsInteger := qryProdutosNotasPagNFEnumero.AsInteger;
  qryProdutosNotasPagNFELotesdfab.asDateTime := DataServidor - 30;
  qryProdutosNotasPagNFELotespermitealterar.asBoolean := true;

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFELotesCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryProdutosNotasPagNFELotessaldo.asCurrency :=
    qryProdutosNotasPagNFELotesqlote.asCurrency -
    qryProdutosNotasPagNFELotesqtatribuida.ascurrency;
end;

procedure TdtmCadastroNotasFiscais.IncluirAtualizarLotes;
begin
  if (qryProdutosNotaFiscalnrlote.asString <> '') then
//     and (ValorCampodaTabela('caracteristicas',['codigo'],[qryProdutosNotaFiscalcaracteristica.asString],['gerenciarloteevalidade'])[0]= True) then
  begin
    qryIncluirAtualizarLotes.close;

    qryIncluirAtualizarLotes.parambyname('produto').asString :=
      qryProdutosNotaFiscalproduto.asString;

    qryIncluirAtualizarLotes.parambyname('validade').asDateTime :=
      qryProdutosNotaFiscalvalidade.asDateTime;

    qryIncluirAtualizarLotes.parambyname('fabricacao').asDateTime :=
      qryProdutosNotaFiscalfabricacao.asDateTime;

    qryIncluirAtualizarLotes.parambyname('nrlote').asString :=
      qryProdutosNotaFiscalnrlote.asString;

    qryIncluirAtualizarLotes.open;

//    perpetrar([]);

    if qryProdutosNotaFiscallote.asString <> qryIncluirAtualizarLoteslote.asString then
    begin
      qryProdutosNotaFiscal.edit;
      qryProdutosNotaFiscallote.asString := qryIncluirAtualizarLoteslote.asString;
    end;

  end
  else
  begin
    qryProdutosNotaFiscal.edit;
    qryProdutosNotaFiscallote.clear;
  end;

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFELotesAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  qryProdutosNotasPagNFELotesnLote.readonly := not qryProdutosNotasPagNFELotespermitealterar.asBoolean and not qryProdutosNotasPagNFELotes.isEmpty;
//  qryProdutosNotasPagNFELotesqlote.readonly := qryProdutosNotasPagNFELotesnLote.readonly;
  qryProdutosNotasPagNFELotesdfab.readonly := qryProdutosNotasPagNFELotesnLote.readonly;
  qryProdutosNotasPagNFELotesdval.readonly := qryProdutosNotasPagNFELotesnLote.readonly;

end;

function TdtmCadastroNotasFiscais.GravarProdutosNotasPagNFELotes: Boolean;
begin
  try
    if (qryProdutosNotasPagNFELotes.state in [dsinsert, dsedit]) then
    begin
//      qryProdutosNotasPagNFELotes.afterpost := nil;
      qryProdutosNotasPagNFELotes.post;
//      qryProdutosNotasPagNFELotes.afterpost := qryProdutosNotasPagNFELotesafterpost;
    end;

//    Result := perpetrar([qryProdutosLotes]);

  finally
//    if not Result then
//      RefazConsultaPorNome(qryProdutosLotes, ['produto'], [qryProdutoscodigo.asString]);
  end;

end;

procedure TdtmCadastroNotasFiscais.dsrProdutosNotasPagNFELotesDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if field <> nil then
  begin

    if field = qryProdutosNotasPagNfeLotesdval then
      qryProdutosNotasPagNfeLotesnulo_dval.asBoolean := not qryProdutosNotasPagNfeLotesdval.isnull
    else
    if field = qryProdutosNotasPagNfeLotesdfab then
      qryProdutosNotasPagNfeLotesnulo_dfab.asBoolean := not qryProdutosNotasPagNfeLotesdfab.isnull
    else
    if field = qryProdutosNotasPagNfeLotesnulo_dval then
    begin
      if field.asboolean then
      begin
        if qryProdutosNotasPagNfeLotesdval.isnull then
          qryProdutosNotasPagNfeLotesdval.asDateTime := DataServidor
      end
      else
      begin
        dsrProdutosNotasPagNFELotes.onDataChange := nil;
        qryProdutosNotasPagNfeLotesdval.clear;
        dsrProdutosNotasPagNFELotes.onDataChange := dsrProdutosNotasPagNFELotesDataChange;
      end;
    end
    else
    if field = qryProdutosNotasPagNfeLotesnulo_dfab then
    begin
      if field.asboolean then
      begin
        if qryProdutosNotasPagNfeLotesdfab.isnull then
          qryProdutosNotasPagNfeLotesdfab.asDateTime := DataServidor
      end
      else
      begin
        dsrProdutosNotasPagNFELotes.onDataChange := nil;
        qryProdutosNotasPagNfeLotesdfab.clear;
        dsrProdutosNotasPagNFELotes.onDataChange := dsrProdutosNotasPagNFELotesDataChange;
      end;
    end
    else
    if field = qryProdutosNotasPagNFELotesnlote then
    begin
      if not IncluindoViaXml then
      begin
        if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
        begin
          with TfrmCadastroNotasFiscais(self.owner) do
          begin
            if DBAdvGridLotes.GetDistinctValues(DBAdvGridLotes.ColumnByFieldName['nlote'].index,
                                            DBAdvGridLotes.row, true ).indexof(qryProdutosNotasPagNFELotesnlote.asString)<>-1 then
            begin
              MensagemAviso('Número de lote já cadastrado!');
              qryProdutosNotasPagNFELotes.cancel;
            end;
          end;
        end;
      end;  

    end;


    {
    else

    try
      if (qryProdutosNotasPagNfeLotes.state in [dsedit, dsinsert]) then
      begin
        dsrProdutosNotasPagNFELotes.onDataChange := nil;
        if qryProdutosNotasPagNfeLotes.CheckRequiredFields(false, false, false, nil, false) then
          GravarProdutosNotasPagNFELotes;
      end;
    finally
      dsrProdutosNotasPagNFELotes.onDataChange := dsrProdutosNotasPagNFELotesDataChange;
    end;
    }
  end;

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFELotesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  
  if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
    TfrmCadastroNotasFiscais(Self.owner).CalcularTotaisProdutosNotasPagNFELotes;
//  cdsTotaisProdutosNotasPagNFELotes.close;
//  cdsTotaisProdutosNotasPagNFELotes.open;

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFELotesAfterPost(
  DataSet: TDataSet);
begin
  inherited;
//  if qryProdutosNotasPagNFELotespermitealterar.asBoolean then

  if qryProdutosNotasPagNFELotes.state = dsedit then
    if (vProdutosNotasPagNFELotesnlote_Ant <>
        qryProdutosNotasPagNFELotesnlote.asString) and
        (vProdutosNotasPagNFELotesnlote_Ant<>'') then
      AtribuirDados(qryProdutosNotasPagNFEItems,
           [qryProdutosNotasPagNFEItemsnlote],
           [qryProdutosNotasPagNFELotesnlote.asString],
           [qryProdutosNotasPagNFEItemsnlote],
           [vProdutosNotasPagNFELotesnlote_Ant],
           ['=']);

//  cdsTotaisProdutosNotasPagNFELotes.close;
//  cdsTotaisProdutosNotasPagNFELotes.open;

  if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
    TfrmCadastroNotasFiscais(Self.owner).CalcularTotaisProdutosNotasPagNFELotes;
         

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFELotesAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
//  cdsTotaisProdutosNotasPagNFELotes.close;
//  cdsTotaisProdutosNotasPagNFELotes.open;

  if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
    TfrmCadastroNotasFiscais(Self.owner).CalcularTotaisProdutosNotasPagNFELotes;
end;

procedure TdtmCadastroNotasFiscais.RedistribuirLotes;
var
  vJaAtribuido, vApagado, vAlterado, vIncluido: Boolean;
  vProdutoDigitado : String;
  vProduto : int64;
begin
  try

    qryProdutosNotasPagNFELotes.AfterPost := nil;
    qryProdutosNotasPagNFELotes.BeforeEdit := nil;

    vProdutoDigitado := qryProdutosNotasPagNFEItemsprodutodigitado.asString;
    vProduto := qryProdutosNotasPagNFEItemsproduto.asLargeint;

    if vProdutoDigitado='' then
    begin
      qryProdutosNotasPagNFEItems.first;
      while not qryProdutosNotasPagNFEItems.eof do
      begin
        if qryProdutosNotasPagNFEItemsprodutodigitado.asString<>'' then
        begin
          vProdutoDigitado := qryProdutosNotasPagNFEItemsprodutodigitado.asString;
          vProduto := qryProdutosNotasPagNFEItemsproduto.asLargeint;
          break;
        end;
        qryProdutosNotasPagNFEItems.next;
      end;
    end;

    qryProdutosNotasPagNFEItems.first;
    while not qryProdutosNotasPagNFEItems.eof do
      qryProdutosNotasPagNFEItems.delete;

    if not (qryProdutosNotasPagNFEItems.state = dsinsert) then
      qryProdutosNotasPagNFEItems.append
    else
      qryProdutosNotasPagNFEItems.post;


    if vProdutoDigitado<>'' then
    begin
      qryProdutosNotasPagNFEItems.first;
      while not qryProdutosNotasPagNFEItems.eof do
      begin
        qryProdutosNotasPagNFEItems.edit;
        qryProdutosNotasPagNFEItemsprodutodigitado.asString :=  vProdutoDigitado;
        qryProdutosNotasPagNFEItems.post;
        qryProdutosNotasPagNFEItems.next;
      end;
    end;

  finally
    qryProdutosNotasPagNFELotes.AfterPost := qryProdutosNotasPagNFELotesAfterPost;
    qryProdutosNotasPagNFELotes.BeforeEdit := qryProdutosNotasPagNFELotesBeforeEdit;
  end;
end;

procedure TdtmCadastroNotasFiscais.SituacaoProdutosNotasPagNFEsaldoquantidade;
begin
  try
    qryProdutosNotasPagNFEItems.GuardarRegistroAtual(false, false);
    qryProdutosNotasPagNFEItems.first;
    while not qryProdutosNotasPagNFEItems.eof do
    begin

      if (qryProdutosNotasPagNFEsaldoquantidade.AsFloat < 0) and (qryProdutosNotasPagNFELotes.recordcount <> 0) then
        ListaErroProdutosNFE('As quantidades do lote não estão fechando com a nota', '', opAdicionar )
      else
        ListaErroProdutosNFE('As quantidades do lote não estão fechando com a nota', '', opRemover );

      qryProdutosNotasPagNFEItems.next;
    end;
  finally
    qryProdutosNotasPagNFEItems.VoltarRegistro;
  end;
end;

procedure TdtmCadastroNotasFiscais.SituacaoNLote;
begin
  if qryProdutosNotasPagNFEItemsgerenciarloteevalidade.asBoolean then
  begin
    if qryProdutosNotasPagNFEItemsnlote.asString = '' then
      ListaErroProdutosNFE('O produto requer a informação do número do lote', '', opAdicionar )
    else
      ListaErroProdutosNFE('O produto requer a informação do número do lote', '', opRemover);
  end;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFELotesBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  try

    qryProdutosNotasPagNFELotes.AfterPost := nil;
    qryProdutosNotasPagNFELotes.BeforeEdit := nil;

    qryProdutosNotasPagNFELotes.GuardarRegistroAtual(false,false);
    qryProdutosNotasPagNFEItems.GuardarRegistroAtual(false,false);
    qryProdutosNotasPagNFEItems.first;
    while not qryProdutosNotasPagNFEItems.eof do
    begin
      if qryProdutosNotasPagNFEItemsnlote.asString =
         qryProdutosNotasPagNFELotesnlote.asString then
      begin

        qryProdutosNotasPagNFEItems.delete;
        qryProdutosNotasPagNFELotes.VoltarRegistro;

        {
        qryProdutosNotasPagNFEItems.edit;
        qryProdutosNotasPagNFEItemsnlote.clear;
        qryProdutosNotasPagNFEItems.post;
        }
      end
      else
        qryProdutosNotasPagNFEItems.next;

    end;
  finally
    qryProdutosNotasPagNFELotes.VoltarRegistro;
    qryProdutosNotasPagNFEItems.VoltarRegistro;

    qryProdutosNotasPagNFELotes.AfterPost := qryProdutosNotasPagNFELotesAfterPost;
    qryProdutosNotasPagNFELotes.BeforeEdit := qryProdutosNotasPagNFELotesBeforeEdit;

  end;

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFELotesBeforeEdit(
  DataSet: TDataSet);
begin
  inherited;
  vProdutosNotasPagNFELotesnlote_Ant := qryProdutosNotasPagNFELotesnlote.asString;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFELotesBeforeScroll(
  DataSet: TDataSet);
begin
  inherited;
;
end;

function TdtmCadastroNotasFiscais.TodosProdutosNotasPagValidos: Boolean;
begin
  result := True;
  try
    qryProdutosNotaFiscal.GuardarRegistroAtual(false, true);
    qryProdutosNotaFiscal.first;
    while not qryProdutosNotaFiscal.eof do
    begin

      qryProdutosNotaFiscalnrlote.Required := qryProdutosNotaFiscalgerenciarloteevalidade.asBoolean;
      result := qryProdutosNotaFiscal.CheckRequiredFields(false, false, true, self, true, false);
      if not result then
        break
      else
        qryProdutosNotaFiscal.next;

    end;
  finally
    qryProdutosNotaFiscal.VoltarRegistro;
  end;

end;

function TdtmCadastroNotasFiscais.GetdtmCalcularCusto: TdtmCalcularCusto;
begin
  if not assigned(fdtmCalcularCusto) then
    fdtmCalcularCusto := TdtmCalcularCusto.create(self);

  Result := fdtmCalcularCusto;
end;

procedure TdtmCadastroNotasFiscais.SituacaoProdutosNotasPagNFEClassificacaoFiscal(Modo: byte; Reatualizar: boolean = false);
begin
{  try }
  if parsistema.AtualizarNCMNotaEntrada then
  begin
    case modo of
    1: begin

         GuardarPosicaoProdutosNotasPagNFE;
         ListaErroProdutosNFE('O NCM na empresa não esta preenchido', '', opRemover, loCaseInsensitive);
         VoltarPosicaoProdutosNotasPagNFE;

         GuardarPosicaoProdutosNotasPagNFE;
         ListaErroProdutosNFE('O NCM na empresa é diferente do NCM no fornecedor', '', opRemover, loCaseInsensitive, false);
         VoltarPosicaoProdutosNotasPagNFE;

         GuardarPosicaoProdutosNotasPagNFE;
         if qryProdutosNotasPagNFEdescricaoipi.isnull then
           ListaErroProdutosNFE('O NCM do fornecedor não está cadastrado', '', opAdicionar)
         else
           ListaErroProdutosNFE('O NCM do fornecedor não está cadastrado', '', opRemover, loCaseInsensitive, true {, Reatualizar});
         VoltarPosicaoProdutosNotasPagNFE;

       end;
    END;

  end;

{
  finally

  end;
}
end;

procedure TdtmCadastroNotasFiscais.qryIPIFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := qryIPIclassificacaofiscal.asString = qryProdutosNotasPagNFEncmfornecedor.asString;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEipiLookupGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  inherited;
  if qryProdutosNotasPagNFEdescricaoipi.isnull then
    Text := 'NÃO CADASTRADO'
  else
    Text := qryProdutosNotasPagNFEipilookup.asString;

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  if parsistema.AtualizarNCMNotaEntrada then
  begin
    qryIPI.macrobyname('vListaNCM').asString :=
      ' select distinct pnpnfe.ncmfornecedor '+
      ' from produtosnotaspagnfe pnpnfe      '+
      ' where pnpnfe.codigonota = ' + inttostr(qrynotafiscalcodigo.asinteger);

    qryIPI.close;
    qryIPI.open;

    {
    qryProdutosNotasPagNFE.First;
    while not qryProdutosNotasPagNFE.Eof do
    begin
      SituacaoProdutosNotasPagNFEClassificacaoFiscal;
      qryProdutosNotasPagNFE.next;
    end;
    }
  end;

end;

function TdtmCadastroNotasFiscais.GetdtmCadastroNotasFiscaisAuxiliar: TdtmCadastroNotasFiscaisAuxiliar;
begin

  if not assigned( fdtmCadastroNotasFiscaisAuxiliar)  then
     fdtmCadastroNotasFiscaisAuxiliar :=  tdtmCadastroNotasFiscaisAuxiliar.create(self);

  Result := fdtmCadastroNotasFiscaisAuxiliar;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEItemsipiLookupGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  inherited;
  if qryProdutosNotasPagNFEItemsdescricaoipi.isnull then
    Text := 'NÃO CADASTRADO'
  else
    Text := qryProdutosNotasPagNFEItemsipilookup.asString;

end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEItemsipiLookupChange(
  Sender: TField);
begin
  inherited;
  if qryProdutosNotasPagNFEItems.recordcount <> 0 then
    if self.owner.ClassName = 'TfrmCadastroNotasFiscais' then
      if TtecDBGrid(self.owner.FindComponent('dbgProdutosNotasPagNFEItems')).SelectedField = qryProdutosNotasPagNFEItemsipiLookup then
      begin
         try
           qryProdutosNotasPagNFEItemsipiLookup.OnChange := nil;
           dsrProdutosNotasPagNFEItemsDataChange(nil, qryProdutosNotasPagNFEItemsipi)
         finally
           qryProdutosNotasPagNFEItemsipiLookup.OnChange := qryProdutosNotasPagNFEItemsipiLookupChange;
         end;
      end;
end;

procedure TdtmCadastroNotasFiscais.qryGradeBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if assigned(GradeBeforeOpen) then
    GradeBeforeOpen(nil);
end;

procedure TdtmCadastroNotasFiscais.qryCaracteristicasNotaFiscalAfterPost(
  DataSet: TDataSet);
begin
  inherited;
//  perpetrar([qryCaracteristicasNotaFiscal]);
  UnlockedGerarTabelaGrade := true;

end;

procedure TdtmCadastroNotasFiscais.qryCaracteristicasNotaFiscalAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
//  perpetrar([qryCaracteristicasNotaFiscal]);
end;

procedure TdtmCadastroNotasFiscais.PostProdutosNotaFiscal;
begin
 if qryProdutosNotaFiscal.State in [dsedit, dsinsert] then
    qryProdutosNotaFiscal.post
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
;
end;

procedure TdtmCadastroNotasFiscais.qryProdutosNotasPagNFEItemsSituacaoAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  if qryProdutosNotasPagNFEItems.recordcount = 0 then
     qryProdutosNotasPagNFEItemsSituacao.cancel;
end;

procedure TdtmCadastroNotasFiscais.SetUnlockedGerarTabelaGrade(
  const Value: Boolean);
begin
  if fUnlockedGerarTabelaGrade <> Value then
  begin
   if value and not UnlockedGerarTabelaGrade then
     GerarTabelaGrade;

    fUnlockedGerarTabelaGrade := Value;

  end;
end;

procedure TdtmCadastroNotasFiscais.qryCaracteristicasNotaFiscalAfterCancel(
  DataSet: TDataSet);
begin
  inherited;
  UnlockedGerarTabelaGrade := True;
end;

procedure TdtmCadastroNotasFiscais.qryProcuraSeriesFornecedorBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
;
end;

procedure TdtmCadastroNotasFiscais.qryProcuraSeriesFornecedorBeforeClose(
  DataSet: TDataSet);
begin
  inherited;
;
end;

procedure TdtmCadastroNotasFiscais.qryNotaFiscalBeforeClose(
  DataSet: TDataSet);
begin
  inherited;
;
end;

end.





