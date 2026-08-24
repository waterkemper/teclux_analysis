unit dmconsultaestoque;

interface

uses

  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, DB, Variants,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Biblio
  ctconstantes, biblio, clparametrossistema, clecf,
  //Componentes
  cpquery,  cpdatasource,
  //Repositorio
  dmtecsoft, dmbasico, ZTransact, clusuario, cppagecontrol;

type
  TipoProduto = (produtos, produtoslotes, similares, similareslotes, componentes, produtosAlteracoesPrecos);

type

  TdtmConsultaEstoque = class(TdtmBasico)
    qryConsultaFilial: TtecQuery;
    qryConsultaFilialcodigo: TIntegerField;
    qryConsultaFilialnome: TStringField;
    qryProcuraFilial: TtecQuery;
    dsrProcuraFilial: TtecDataSource;
    qryProcuraFilialcodigo: TIntegerField;
    qryProcuraFilialnome: TStringField;
    qryConsultaEstoques: TtecQuery;
    dsrConsultaEstoques: TtecDataSource;
    qryConsultaEstoquesproduto: TLargeintField;
    qryConsultaEstoquesfilial: TIntegerField;
    qryConsultaEstoqueslocalizacao: TStringField;

    qryConsultaEstoquesminimo: TFloatField;
    qryConsultaEstoquesmaximo: TFloatField;
    qryConsultaEstoquesQtdecompra: TFloatField;
    qryConsultaEstoquesemestoque: TFloatField;
    qryConsultaEstoquesreservado: TFloatField;
    qryConsultaEstoquesdemonstracao: TFloatField;
    qryConsultaEstoquestransito: TFloatField;
    qryConsultaEstoquesconserto: TFloatField;
    qryConsultaEstoquesdanificada: TFloatField;
    qryConsultaEstoquesfuturo: TFloatField;
    qryConsultaEstoquesestoquevenda: TFloatField;
    qryConsultaEstoquesestoquetotal: TFloatField;

    qryConsultaEstoquesdescproduto: TStringField;
    qryConsultaEstoquescaracteristica: TLargeintField;
    qryConsultaEstoquespreco: TIntegerField;
    qryVendasAcumuladas: TtecQuery;
    dsrVendasAcumuladas: TtecDataSource;
    qryComprasAcumuladas: TtecQuery;
    dsrComprasAcumuladas: TtecDataSource;
    qryConsultaEstoquesprecosemicms: TFloatField;
    qryConsultaEstoquesprecocomicms: TFloatField;
    qryConsultaEstoquesdatacompra: TDateField;
    qryConsultaEstoquesultimaentrada: TDateField;
    qryConsultaEstoquesultimavenda: TDateField;
    qryProdutosPedidos: TtecQuery;
    dsrProdutosPedidos: TtecDataSource;
    qryConsultaEstoquespreconormal: TIntegerField;
    qryConsultaEstoquesprecopromocao: TIntegerField;
    qryPrecos: TtecQuery;
    dsrPrecos: TDataSource;
    qryConsultaEstoquesreferencia: TStringField;
    qryConsultaEstoquesdescmarca: TStringField;
    qryPrecosvalornormal: TFloatField;
    qryPrecosvalorpromocao: TFloatField;
    qryPrecosvalidade: TDateField;
    
    qryConsultaEstoquesSimilares: TtecQuery;
    qryConsultaEstoquesSimilaresproduto: TLargeintField;
    qryConsultaEstoquesSimilaresfilial: TIntegerField;
    qryConsultaEstoquesSimilareslocalizacao: TStringField;

    qryConsultaEstoquesSimilaresminimo: TFloatField;
    qryConsultaEstoquesSimilaresmaximo: TFloatField;
    qryConsultaEstoquesSimilaresQtdecompra: TFloatField;
    qryConsultaEstoquesSimilaresemestoque: TFloatField;
    qryConsultaEstoquesSimilaresreservado: TFloatField;
    qryConsultaEstoquesSimilaresdemonstracao: TFloatField;
    qryConsultaEstoquesSimilarestransito: TFloatField;
    qryConsultaEstoquesSimilaresconserto: TFloatField;
    qryConsultaEstoquesSimilaresdanificada: TFloatField;
    qryConsultaEstoquesSimilaresfuturo: TFloatField;
    qryConsultaEstoquesSimilaresestoquevenda: TFloatField;
    qryConsultaEstoquesSimilaresestoquetotal: TFloatField;

    qryConsultaEstoquesSimilaresdatacompra: TDateField;
    qryConsultaEstoquesSimilaresultimaentrada: TDateField;
    qryConsultaEstoquesSimilaresultimavenda: TDateField;
    qryConsultaEstoquesSimilarespreconormal: TIntegerField;
    qryConsultaEstoquesSimilaresprecopromocao: TIntegerField;
    qryConsultaEstoquesSimilarescaracteristica: TLargeintField;
    qryConsultaEstoquesSimilarespreco: TIntegerField;
    qryConsultaEstoquesSimilaresdescproduto: TStringField;
    qryConsultaEstoquesSimilaresreferencia: TStringField;
    qryConsultaEstoquesSimilaresdescmarca: TStringField;
    qryConsultaEstoquesprodutoempromocao: TBooleanField;
    qryConsultaEstoquesSimilaresprodutoempromocao: TBooleanField;
    qryVendasAcumuladasfilial: TIntegerField;
    qryVendasAcumuladastotalvenda: TFloatField;
    qryComprasAcumuladastotalcompra: TFloatField;
    qryComprasAcumuladasfilial: TIntegerField;
    qryVendasAcumuladasmes: TStringField;
    qryComprasAcumuladasmes: TStringField;
    qryConsultaEstoquesfinanceiro: TFloatField;
    qryConsultaEstoquescustomedio: TFloatField;
    qryConsultaEstoquesaliquotaipi: TFloatField;
    qryConsultaEstoqueslinha: TStringField;
    qryConsultaEstoquescoluna: TStringField;
    qryConsultaLinhaColuna: TtecQuery;
    qryConsultaLinhaColunaproduto: TLargeintField;
    qryGrade: TtecQuery;
    dsrGrade: TtecDataSource;
    qryConsultaEstoquesgrade1: TIntegerField;
    qryConsultaEstoquesgrade2: TIntegerField;
    qryConsultaEstoquesvalorgrade1: TStringField;
    qryConsultaEstoquesvalorgrade2: TStringField;
    qryConsultaLinhaColunaemestoque: TFloatField;
    qryConsultaLinhaColunaestoquetotal: TFloatField;
    qryConsultaLinhaColunaprodutoempromocao: TBooleanField;
    qryConsultaLinhaColunaprecoatual: TFloatField;
    qryConsultaLinhaColunavalorgrade1: TStringField;
    qryConsultaLinhaColunavalorgrade2: TStringField;
    qryConsultaLinhaColunacaracteristica: TLargeintField;
    qryConsultaLinhaColunafilial: TIntegerField;
    qryConsultaEstoquesdescricaocaracteristica: TStringField;
    qryConsultaEstoquesnomefilial: TStringField;
    qryConsultaEstoquesSimilareslinha: TStringField;
    qryConsultaEstoquesSimilarescoluna: TStringField;
    qryConsultaEstoquesSimilaresvalorgrade1: TStringField;
    qryConsultaEstoquesSimilaresvalorgrade2: TStringField;
    qryConsultaEstoquesreservaprevia: TFloatField;
    qryConsultaEstoquesSimilaresreservaprevia: TFloatField;
    qryPrecosalteracaopreconormal: TDateField;
    qryConsultaEstoquesestoquefisico: TFloatField;
    qryConsultaEstoquesSimilaresestoquefisico: TFloatField;
    qryConsultaEstoquesprodutoinativo: TBooleanField;
    qryConsultaEstoquesprodutoforalinha: TBooleanField;
    qryConsultaEstoquesSimilaresprodutoinativo: TBooleanField;
    qryConsultaEstoquesSimilaresprodutoforalinha: TBooleanField;
    qryPrecosdescricaopreco: TStringField;
    qryConsultaEstoquesprodutovisual: TStringField;
    qryConsultaEstoquesSimilaresprodutovisual: TStringField;
    qryProdutosPedidosquantidadefilial: TFloatField;
    qryConsultaFiliais: TtecQuery;
    dsrConsultaFiliais: TtecDataSource;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryProdutosPedidostotalfiliais: TFloatField;
    qryPrecosCargos: TtecQuery;
    qryPrecosCargoscodigo: TIntegerField;
    qryPrecosCargosproduto: TLargeintField;
    qryPrecosCargosdescricao: TStringField;
    qryPrecosCargosvalorproduto: TFloatField;
    dsrPrecosCargos: TtecDataSource;
    qryAjustarValorUltimaCompra: TtecQuery;
    qryAjustarValorUltimaCompravalorultimacompra: TFloatField;
    dsrAjustarValorUltimaCompra: TtecDataSource;
    qryAtualizaValorUltimaCompra: TtecQuery;
    qryConsultaEstoquesSimilaresnomefilial: TStringField;
    qryConsultaEstoquesSimilaresprecosemicms: TFloatField;
    qryConsultaEstoquesSimilaresprecocomicms: TFloatField;
    qryConsultaEstoquesSimilaresfinanceiro: TFloatField;
    qryConsultaEstoquesSimilarescustomedio: TFloatField;
    qryConsultaEstoquesSimilaresaliquotaipi: TFloatField;
    qryConsultaEstoquesSimilaresdescricaocaracteristica: TStringField;
    qryPrecosClientes: TtecQuery;
    dsrPrecosClientes: TtecDataSource;
    qryPrecosClientesproduto: TLargeintField;
    qryPrecosClientescliente: TIntegerField;
    qryPrecosClientesnomecliente: TStringField;
    qryPrecosClientesproduto_cliente: TStringField;
    qryPrecosClientesprecocliente: TFloatField;
    qryPrecosClientesvalorultimavenda: TFloatField;
    qryConsultaEstoquesincidencia: TStringField;
    qryConsultaEstoquessequencia: TIntegerField;
    qryConsultaEstoquescodigonotaentrada: TIntegerField;
    qryConsultaEstoquesnomefornecedor: TStringField;
    qryConsultaEstoquesfornecedornosimples: TBooleanField;
    qryConsultaEstoquesunidade: TStringField;
    qryConsultaEstoquesproducaopropria: TStringField;
    qryConsultaEstoquesarredondamento: TStringField;
    qryConsultaEstoquessituacaotributaria: TStringField;
    qryModelosCaracteristicas: TtecQuery;
    qryModelosCaracteristicascaracteristica: TLargeintField;
    qryModelosCaracteristicasespecificacao: TStringField;
    qryModelosCaracteristicasobservacao: TStringField;
    dsrModelosCaracteristicas: TtecDataSource;
    qryConsultaEstoquespeso: TFloatField;
    qryConsultaEstoquesSimilarespeso: TFloatField;
    qryModelosCaracteristicasdescricaomodelo: TStringField;
    qryModelosCaracteristicasmodelo: TIntegerField;
    qryConsultaEstoquescsosn: TStringField;
    qryConsultaEstoquescodigobarras: TStringField;
    qryConsultaProdutosPedidos: TtecQuery;
    qryConsultaProdutosPedidospedido: TIntegerField;
    qryConsultaProdutosPedidosproduto: TLargeintField;
    qryConsultaProdutosPedidosquantidade: TFloatField;
    qryConsultaProdutosPedidosentrega: TDateField;
    qryConsultaProdutosPedidosquantidadependente: TFloatField;
    dsrConsultaProdutosPedidos: TtecDataSource;
    qryConsultaProdutosPedidosfilialentrega: TIntegerField;
    qryColunasPrecos: TtecQuery;
    qryColunasPrecoscaracteristica: TLargeintField;
    qryColunasPrecospreco: TIntegerField;
    qryColunasPrecoscoluna: TIntegerField;
    qryColunasPrecosdata: TDateField;
    qryColunasPrecosvalor: TFloatField;
    qryColunasPrecosvalidade: TDateField;
    qryColunasPrecoscolunasdescricao: TStringField;
    qryColunasPrecosalteracao: TDateField;
    dsrColunasPrecos: TtecDataSource;
    qryConsultaEstoquescst_nfentrada: TStringField;
    qryConsultaEstoquescsosn_nfentrada: TStringField;
    qryConsultaEstoquescst_nf: TStringField;
    qryConsultaEstoquescsosn_nf: TStringField;
    qryConsultaEstoquesultimacompra_com_icms: TFloatField;
    qryConsultaEstoquesComponentes: TtecQuery;
    qryConsultaEstoquesComponentesproduto: TLargeintField;
    qryConsultaEstoquesComponentesprodutovisual: TStringField;
    qryConsultaEstoquesComponentesfilial: TIntegerField;
    qryConsultaEstoquesComponentesnomefilial: TStringField;
    qryConsultaEstoquesComponenteslocalizacao: TStringField;
    qryConsultaEstoquesComponentesminimo: TFloatField;
    qryConsultaEstoquesComponentesmaximo: TFloatField;
    qryConsultaEstoquesComponentesprecosemicms: TFloatField;
    qryConsultaEstoquesComponentesprecocomicms: TFloatField;
    qryConsultaEstoquesComponentesfinanceiro: TFloatField;
    qryConsultaEstoquesComponentescustomedio: TFloatField;
    qryConsultaEstoquesComponentesaliquotaipi: TFloatField;
    qryConsultaEstoquesComponentesdatacompra: TDateField;
    qryConsultaEstoquesComponentesqtdecompra: TFloatField;
    qryConsultaEstoquesComponentesultimaentrada: TDateField;
    qryConsultaEstoquesComponentesultimavenda: TDateField;
    qryConsultaEstoquesComponentesemestoque: TFloatField;
    qryConsultaEstoquesComponentesreservado: TFloatField;
    qryConsultaEstoquesComponentesreservaprevia: TFloatField;
    qryConsultaEstoquesComponentesdemonstracao: TFloatField;
    qryConsultaEstoquesComponentestransito: TFloatField;
    qryConsultaEstoquesComponentesconserto: TFloatField;
    qryConsultaEstoquesComponentesdanificada: TFloatField;
    qryConsultaEstoquesComponentesfuturo: TFloatField;
    qryConsultaEstoquesComponentesestoquefisico: TFloatField;
    qryConsultaEstoquesComponentesprodutoempromocao: TBooleanField;
    qryConsultaEstoquesComponentesprodutoinativo: TBooleanField;
    qryConsultaEstoquesComponentesprodutoforalinha: TBooleanField;
    qryConsultaEstoquesComponentesestoquevenda: TFloatField;
    qryConsultaEstoquesComponentesestoquetotal: TFloatField;
    qryConsultaEstoquesComponentespreconormal: TIntegerField;
    qryConsultaEstoquesComponentesprecopromocao: TIntegerField;
    qryConsultaEstoquesComponentescaracteristica: TLargeintField;
    qryConsultaEstoquesComponentesdescricaocaracteristica: TStringField;
    qryConsultaEstoquesComponentespreco: TIntegerField;
    qryConsultaEstoquesComponentesdescproduto: TStringField;
    qryConsultaEstoquesComponentesreferencia: TStringField;
    qryConsultaEstoquesComponentesdescmarca: TStringField;
    qryConsultaEstoquesComponenteslinha: TStringField;
    qryConsultaEstoquesComponentescoluna: TStringField;
    qryConsultaEstoquesComponentesvalorgrade1: TStringField;
    qryConsultaEstoquesComponentesvalorgrade2: TStringField;
    qryConsultaEstoquesComponentespeso: TFloatField;
    qryConsultaEstoquesComponentesquantidade: TFloatField;
    qryConsultaEstoquesComponentesunidade: TStringField;
    qryConsultaEstoquesComponentespreco_1: TFloatField;
    qryConsultaEstoquesComponentestotal: TFloatField;
    qryConsultaEstoquesComponentescsosn: TStringField;
    qryConsultaEstoquesSimilarescsosn: TStringField;
    qryConsultaEstoquesSimilaresincidencia: TStringField;
    qryConsultaEstoquesComponentesincidencia: TStringField;
    qryConsultaEstoquesSimilarescodigonotaentrada: TIntegerField;
    qryConsultaEstoquesSimilaresnomefornecedor: TStringField;
    qryConsultaEstoquesSimilarescst_nfentrada: TStringField;
    qryConsultaEstoquesSimilarescsosn_nfentrada: TStringField;
    qryConsultaEstoquesSimilarescst_nf: TStringField;
    qryConsultaEstoquesSimilarescsosn_nf: TStringField;
    qryConsultaEstoquesSimilaresfornecedornosimples: TBooleanField;
    qryConsultaEstoquesComponentescodigonotaentrada: TIntegerField;
    qryConsultaEstoquesComponentesnomefornecedor: TStringField;
    qryConsultaEstoquesComponentescst_nfentrada: TStringField;
    qryConsultaEstoquesComponentescsosn_nfentrada: TStringField;
    qryConsultaEstoquesComponentescst_nf: TStringField;
    qryConsultaEstoquesComponentescsosn_nf: TStringField;
    qryConsultaEstoquesComponentesfornecedornosimples: TBooleanField;
    qryConsultaEstoquesComponentesultimacompra_com_icms: TFloatField;
    qryConsultaEstoquesSimilaresultimacompra_com_icms: TFloatField;
    qryConsultaEstoquesSimilarescomposto: TBooleanField;
    qryConsultaEstoquesSimilarescomposto2: TBooleanField;
    qryConsultaEstoquescomposto: TBooleanField;
    qryConsultaEstoquescomposto2: TBooleanField;
    qryConsultaEstoquesComponentescomposto: TBooleanField;
    qryConsultaEstoquesComponentescomposto2: TBooleanField;
    qryConsultaEstoquescest: TStringField;
    qryConsultaEstoquesclassificacaofiscal: TStringField;
    qryConsultaEstoquespreco_atual: TFloatField;
    qryEstoque: TtecQuery;
    dsrEstoque: TtecDataSource;
    qryEstoquefilial: TIntegerField;
    qryEstoqueemestoque: TFloatField;
    qryConsultaEstoquesgrupo: TStringField;
    qryConsultaEstoquesdescricaogrupo: TStringField;
    qryConsultaEstoquesSimilaresgrupo: TStringField;
    qryConsultaEstoquesSimilaresdescricaogrupo: TStringField;
    qryConsultaEstoquesSimilaresclassificacaofiscal: TStringField;
    qryConsultaEstoquesComponentesgrupo: TStringField;
    qryConsultaEstoquesComponentesdescricaogrupo: TStringField;
    qryConsultaEstoquesComponentesclassificacaofiscal: TStringField;
    qryConsultaEstoquespromocao: TIntegerField;
    qryConsultaEstoquesdescricaopromocao: TStringField;
    qryConsultaEstoquesSimilarespromocao: TIntegerField;
    qryConsultaEstoquesSimilaresdescricaopromocao: TStringField;
    qryConsultaEstoquesComponentespromocao: TIntegerField;
    qryConsultaEstoquesComponentesdescricaopromocao: TStringField;
    qryAtualizarEstoque: TtecQuery;
    qryConsultaEstoquessublocalizacao: TStringField;
    qryFornecedoresProdutos: TtecQuery;
    qryFornecedoresProdutoscaracteristica: TLargeintField;
    qryFornecedoresProdutosfornecedor: TIntegerField;
    qryFornecedoresProdutosreferencia: TStringField;
    qryFornecedoresProdutosrazao: TStringField;
    qryFornecedoresProdutosdata: TDateField;
    qryFornecedoresProdutospreco: TFloatField;
    qryFornecedoresProdutosipi: TFloatField;
    qryFornecedoresProdutosobservacao: TStringField;
    qryFornecedoresProdutosprecocomipi: TFloatField;
    qryFornecedoresProdutosprecoultimaentrada: TFloatField;
    qryFornecedoresProdutosprecoipiultimaentrada: TFloatField;
    qryFornecedoresProdutosipiultimaentrada: TFloatField;
    qryFornecedoresProdutosdataultimaentrada: TDateField;
    qryFornecedoresProdutosgeradocadastro: TBooleanField;
    dsrFornecedoresProdutos: TtecDataSource;
    qryFornecedoresProdutos_slow: TtecQuery;
    LargeintField1: TLargeintField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    DateField1: TDateField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    DateField2: TDateField;
    BooleanField1: TBooleanField;
    qryConsultaEstoquesmodelos_agg: TStringField;
    qryConsultaEstoquesSimilaresmodelos_agg: TStringField;
    qryConsultaEstoquesComponentesmodelos_agg: TStringField;
    dsrConsultaProdutosEntradaSefaz: TtecDataSource;
    qryConsultaProdutosEntradaSefaz: TtecQuery;
    qryConsultaProdutosEntradaSefazfilial: TIntegerField;
    qryConsultaProdutosEntradaSefazfornecedor: TIntegerField;
    qryConsultaProdutosEntradaSefaznomefornecedor: TStringField;
    qryConsultaProdutosEntradaSefazserie: TStringField;
    qryConsultaProdutosEntradaSefaznrnfe: TIntegerField;
    qryConsultaProdutosEntradaSefaznomecsifnfe: TStringField;
    qryConsultaProdutosEntradaSefazdescricaoprodutonfe: TStringField;
    qryConsultaProdutosEntradaSefazucom: TStringField;
    qryConsultaProdutosEntradaSefazqcom: TFloatField;
    qryConsultaProdutosEntradaSefazvuncom: TFloatField;
    qryConsultaProdutosEntradaSefazvfrete: TFloatField;
    qryConsultaProdutosEntradaSefazvseg: TFloatField;
    qryConsultaProdutosEntradaSefazvdesc: TFloatField;
    qryConsultaProdutosEntradaSefazvoutro: TFloatField;
    qryConsultaProdutosEntradaSefazdhemi: TDateTimeField;
    qryConsultaEstoquescomissao_grupo: TFloatField;
    qryConsultaEstoquescomissao_produto: TFloatField;
    qryConsultaEstoquestipocomissao_produto: TStringField;
    qryConsultaEstoquestipocomissao_grupo: TStringField;
    qryConsultaEstoquesespecificacao_agg: TStringField;
    qryConsultaEstoquesSimilaresespecificacao_agg: TStringField;
    qryConsultaEstoquesComponentesespecificacao_agg: TStringField;
    qryConsultaEstoquesLotes: TtecQuery;
    qryConsultaEstoquesLotesproduto: TLargeintField;
    qryConsultaEstoquesLotesprodutovisual: TStringField;
    qryConsultaEstoquesLotesnrlote: TStringField;
    qryConsultaEstoquesLotesfilial: TIntegerField;
    qryConsultaEstoquesLotesnomefilial: TStringField;
    qryConsultaEstoquesLoteslocalizacao: TStringField;
    qryConsultaEstoquesLotesminimo: TFloatField;
    qryConsultaEstoquesLotesmaximo: TFloatField;
    qryConsultaEstoquesLotesprecosemicms: TFloatField;
    qryConsultaEstoquesLotesprecocomicms: TFloatField;
    qryConsultaEstoquesLotesultimacompra_com_icms: TFloatField;
    qryConsultaEstoquesLotesfinanceiro: TFloatField;
    qryConsultaEstoquesLotescustomedio: TFloatField;
    qryConsultaEstoquesLotesaliquotaipi: TFloatField;
    qryConsultaEstoquesLotesdatacompra: TDateField;
    qryConsultaEstoquesLotesqtdecompra: TFloatField;
    qryConsultaEstoquesLotesultimaentrada: TDateField;
    qryConsultaEstoquesLotesultimavenda: TDateField;
    qryConsultaEstoquesLotesemestoque: TFloatField;
    qryConsultaEstoquesLotesreservado: TFloatField;
    qryConsultaEstoquesLotesreservaprevia: TFloatField;
    qryConsultaEstoquesLotesdemonstracao: TFloatField;
    qryConsultaEstoquesLotestransito: TFloatField;
    qryConsultaEstoquesLotesconserto: TFloatField;
    qryConsultaEstoquesLotesdanificada: TFloatField;
    qryConsultaEstoquesLotesfuturo: TFloatField;
    qryConsultaEstoquesLotescodigonotaentrada: TIntegerField;
    qryConsultaEstoquesLotesprodutoempromocao: TBooleanField;
    qryConsultaEstoquesLotesprodutoinativo: TBooleanField;
    qryConsultaEstoquesLotesprodutoforalinha: TBooleanField;
    qryConsultaEstoquesLotesestoquevenda: TFloatField;
    qryConsultaEstoquesLotesestoquetotal: TFloatField;
    qryConsultaEstoquesLotespreconormal: TIntegerField;
    qryConsultaEstoquesLotesprecopromocao: TIntegerField;
    qryConsultaEstoquesLotescaracteristica: TLargeintField;
    qryConsultaEstoquesLotesdescricaocaracteristica: TStringField;
    qryConsultaEstoquesLotesincidencia: TStringField;
    qryConsultaEstoquesLotescsosn: TStringField;
    qryConsultaEstoquesLotespreco: TIntegerField;
    qryConsultaEstoquesLotesdescproduto: TStringField;
    qryConsultaEstoquesLotesreferencia: TStringField;
    qryConsultaEstoquesLotesdescmarca: TStringField;
    qryConsultaEstoquesLotesgrade1: TIntegerField;
    qryConsultaEstoquesLotesgrade2: TIntegerField;
    qryConsultaEstoquesLoteslinha: TStringField;
    qryConsultaEstoquesLotescoluna: TStringField;
    qryConsultaEstoquesLotesvalorgrade1: TStringField;
    qryConsultaEstoquesLotesvalorgrade2: TStringField;
    qryConsultaEstoquesLotesestoquefisico: TFloatField;
    qryConsultaEstoquesLotessequencia: TIntegerField;
    qryConsultaEstoquesLotesunidade: TStringField;
    qryConsultaEstoquesLotesproducaopropria: TStringField;
    qryConsultaEstoquesLotesarredondamento: TStringField;
    qryConsultaEstoquesLotessituacaotributaria: TStringField;
    qryConsultaEstoquesLotescodigobarras: TStringField;
    qryConsultaEstoquesLotescest: TStringField;
    qryConsultaEstoquesLotesclassificacaofiscal: TStringField;
    qryConsultaEstoquesLotespeso: TFloatField;
    qryConsultaEstoquesLotescomposto: TBooleanField;
    qryConsultaEstoquesLotescomposto2: TBooleanField;
    qryConsultaEstoquesLotespreco_atual: TFloatField;
    qryConsultaEstoquesLotesgrupo: TStringField;
    qryConsultaEstoquesLotesdescricaogrupo: TStringField;
    qryConsultaEstoquesLotespromocao: TIntegerField;
    qryConsultaEstoquesLotesdescricaopromocao: TStringField;
    qryConsultaEstoquesLotessublocalizacao: TStringField;
    qryConsultaEstoquesLotestipocomissao_produto: TStringField;
    qryConsultaEstoquesLotescomissao_produto: TFloatField;
    qryConsultaEstoquesLotestipocomissao_grupo: TStringField;
    qryConsultaEstoquesLotescomissao_grupo: TFloatField;
    qryConsultaEstoquesLotesmodelos_agg: TStringField;
    qryConsultaEstoquesLotesespecificacao_agg: TStringField;
    qryConsultaEstoquesLotesnomefornecedor: TStringField;
    qryConsultaEstoquesLotescst_nfentrada: TStringField;
    qryConsultaEstoquesLotescsosn_nfentrada: TStringField;
    qryConsultaEstoquesLotescst_nf: TStringField;
    qryConsultaEstoquesLotescsosn_nf: TStringField;
    qryConsultaEstoquesLotesfornecedornosimples: TBooleanField;
    qryConsultaEstoquesnrlote: TStringField;
    qryConsultaEstoquesSimilaresnrlote: TStringField;
    qryConsultaEstoquesComponentesnrlote: TStringField;
    qryProdutos_Atributos: TtecQuery;
    qryProdutos_Atributosnome: TStringField;
    qryProdutos_Atributosvalor: TStringField;
    qryProdutos_Atributosdescricao: TStringField;
    qryProdutos_Atributostipo: TStringField;
    qryProdutos_Atributostodos: TBooleanField;
    dsrProdutos_Atributos: TtecDataSource;
    qryConsultaEstoquesLotesvalidade: TDateField;
    qryConsultaEstoquesComponentesvalidade: TDateField;
    qryConsultaEstoquesSimilaresvalidade: TDateField;
    qryConsultaEstoquesvalidade: TDateField;
    qryLicitacoesporProdutos: TtecQuery;
    qryLicitacoesporProdutosnumero: TIntegerField;
    qryLicitacoesporProdutoscliente: TIntegerField;
    qryLicitacoesporProdutossituacao_licitacao: TStringField;
    qryLicitacoesporProdutosnomecliente: TStringField;
    qryLicitacoesporProdutosdatavenda: TDateField;
    qryLicitacoesporProdutosvigencia: TDateField;
    qryLicitacoesporProdutosprodutovisual: TStringField;
    qryLicitacoesporProdutosdescricaoproduto: TStringField;
    qryLicitacoesporProdutosquantidade: TFloatField;
    qryLicitacoesporProdutossaldopendente: TFloatField;
    qryLicitacoesporProdutosprazo: TIntegerField;
    qryLicitacoesporProdutostotalproduto: TFloatField;
    qryLicitacoesporProdutoscustomediototal: TFloatField;
    qryLicitacoesporProdutosaliquotaicms: TFloatField;
    dsrLicitacoesporProdutos: TtecDataSource;
    qryLicitacoesporProdutosTotalSaldoPendente: TCurrencyField;
    qryLicitacoesporProdutosnumeroprodutolicitacao: TIntegerField;
    qryLicitacoesporProdutospreco: TFloatField;
    procedure qryConsultaEstoquesAfterScroll(DataSet: TDataSet);
    procedure qryConsultaEstoquesSimilaresAfterScroll(DataSet: TDataSet);
    procedure qryAjustarValorUltimaCompraAfterPost(DataSet: TDataSet);
    procedure qryConsultaEstoquesAfterOpen(DataSet: TDataSet);
    procedure qryConsultaEstoquesSimilaresAfterOpen(DataSet: TDataSet);
    procedure qryConsultaEstoquesComponentesAfterOpen(DataSet: TDataSet);
    procedure qryConsultaEstoquesComponentesAfterScroll(DataSet: TDataSet);
    procedure qryEstoquefilialGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryGradeAfterScroll(DataSet: TDataSet);
    procedure qryConsultaEstoquesAfterPost(DataSet: TDataSet);
    procedure qryConsultaEstoquesSimilaresAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qryConsultaEstoquescomissao_grupoGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryConsultaEstoquescomissao_produtoGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryConsultaEstoquesBeforeOpen(DataSet: TDataSet);
    procedure qryConsultaEstoquesLotesBeforeOpen(DataSet: TDataSet);
    procedure qryConsultaEstoquesLotesAfterOpen(DataSet: TDataSet);
    procedure qryConsultaEstoquesLotesAfterScroll(DataSet: TDataSet);
    procedure qryLicitacoesporProdutosCalcFields(DataSet: TDataSet);
    procedure qryLicitacoesporProdutosAfterOpen(DataSet: TDataSet);
  private
    FFilial: String;
    FProduto: String;
    FGrupo: String;
    FClasse: String;
    FItemProduto: String;
//  FMostrar: Char;
    TotalPedidos: Currency;
    FOnScrollLinhaColunaGrade: TNotifyEvent;
    FOnScrollLinhaColunaGradeSimilar: TNotifyEvent;
    FOnScrollLinhaColunaGradeComponente: TNotifyEvent;
    fListaCondicaoPromocoes: String;
    FListaCondicaoMarcas: String;
    FListaCondicaoModelos: String;
    fTipoConsultaProduto: TipoProduto;
    fListaCondicaoLocalizacaoEstoque: String;
    FListaCondicaoEspecificacoes: String;
    FOnScrollLinhaColunaGradeLotes: TNotifyEvent;
    fListaCondicionalLotesProdutos: String;
    fListaCondicionalAtributos: String;
    FProdutoNaoBrinde: Boolean;
    FprodutoEmLinha: Boolean;
    FProdutoBrinde: Boolean;
    FSemEstoqueZero: Boolean;
    FprodutoForadeLinha: Boolean;
    FProdutoSemMontagem: Boolean;
    FprodutoAtivo: Boolean;
    fDisponivelnoSite: Boolean;
    FProdutoComMontagem: Boolean;
    FprodutoInativo_: Boolean;
    fNaoDisponivelnoSite: Boolean;
    procedure SetClasse(const Value: String);
    procedure SetFilial(const Value: String);
    procedure SetGrupo(const Value: String);
    procedure SetProduto(const Value: String);
    procedure SetItemProduto(const Value: String);
    function GetConsultaFilial: TtecQuery;
//    procedure SetMostrar(const Value: Char);
    function GetProdutoEmPromocao: Boolean;
    function GetProdutoSimilarEmPromocao: Boolean;
    function GetColunadaGrade: String;
    function GetLinhadaGrade: String;
    function GetProdutoColunaGrade: String;
    function GetProdutoLinhaGrade: String;
    function GetProdutoLinhaColunaEmPromocao: Boolean;
    function GetConsultaLinhaColunaCaracteristica: String;
    function GetConsultaLinhaColunaFilial: String;
    function GetColunadaGradeSimilar: String;
    function GetLinhadaGradeSimilar: String;
    function GetProdutoInativo: Boolean;
    function GetProdutoForaLinha: Boolean;
    function GetProdutoSimilarForaLinha: Boolean;
    function GetProdutoSimilarInativo: Boolean;
    function GetComponenteForaLinha: Boolean;
    function GetComponenteInativo: Boolean;
    function GetComponenteEmPromocao: Boolean;
    function GetColunadaGradeComponente: String;
    function GetLinhadaGradeComponente: String;
    procedure SetListaCondicaoPromocoes(const Value: String);
    procedure SetListaCondicaoMarcas(const Value: String);
    procedure SetListaCondicaoModelos(const Value: String);
    function GetTipoConsultaProduto: TipoProduto;
    procedure SetListaCondicaoLocalizacaoEstoque(const Value: String);
    procedure SetListaCondicaoEspecificacoes(const Value: String);
    procedure SetListaCondicionalLotesProdutos(const Value: String);
    procedure SetListaCondicionalAtributos(const Value: String);
  public
    Colunas : TStringList;
    NomeCampoColunaSelecionadoGrade : String;
//    NomeCampoLinhaSelecionadoGrade : String;

    procedure AbrirTabelasEstoque;
    procedure GravarValorUltimaCompra(Valor: Currency; Similares: Boolean);
    procedure AbrirTabelasAcumuladores(Similares: Boolean);
    procedure AbrirTabelasProcura(TipoPesquisa: TtecPesquisa);
    procedure AbrirTabelaProdutosSimilares;
    procedure AbrirTabelaProdutosLotes;

    procedure AbrirTabelaComponentes;
    procedure AbrirTabelaProdutosModelos;
    function  AbrirTabelaConsultaEstoques: Boolean;
    procedure AbreTabelasPesquisa(TipoPesquisa: TtecPesquisa);
    procedure FechaTabelasPesquisa(TipoPesquisa: TtecPesquisa);
    procedure Selecionar(TipoProcura: TtecPesquisa);
    procedure ReFazConsultaTabelas;
    function  ExisteFilial(campo, codigo: String): Boolean;
    constructor Create(AOwner: TComponent); override;
    property ConsultaFilial: TtecQuery read GetConsultaFilial;
    property Filial: String read FFilial write SetFilial;
    property Produto: String read FProduto write SetProduto;
    property ItemProduto: String read FItemProduto write SetItemProduto;
    property Grupo: String read FGrupo write SetGrupo;
    property Classe: String read FClasse write SetClasse;
    property ListaCondicaoMarcas: String read FListaCondicaoMarcas write SetListaCondicaoMarcas;

    property ListaCondicaoModelos: String read FListaCondicaoModelos write SetListaCondicaoModelos;
    property ListaCondicaoEspecificacoes: String read FListaCondicaoEspecificacoes write SetListaCondicaoEspecificacoes;


    property ListaCondicaoPromocoes: String read fListaCondicaoPromocoes write SetListaCondicaoPromocoes;

    property ListaCondicaoLocalizacaoEstoque: String read fListaCondicaoLocalizacaoEstoque write SetListaCondicaoLocalizacaoEstoque;
    property ListaCondicionalLotesProdutos: String read fListaCondicionalLotesProdutos write SetListaCondicionalLotesProdutos;
    property ListaCondicionalAtributos: String read fListaCondicionalAtributos write SetListaCondicionalAtributos;



//    property Mostrar: Char read FMostrar write SetMostrar;
    property ProdutoEmPromocao: Boolean read GetProdutoEmPromocao;
    property ProdutoInativo: Boolean read GetProdutoInativo;
    property ProdutoForaLinha: Boolean read GetProdutoForaLinha;
    property ProdutoLinhacolunaEmPromocao: Boolean read GetProdutoLinhaColunaEmPromocao;
    property ProdutoSimilarEmPromocao: Boolean read GetProdutoSimilarEmPromocao;
    property ProdutoSimilarInativo: Boolean read GetProdutoSimilarInativo;
    property ProdutoSimilarForaLinha: Boolean read GetProdutoSimilarForaLinha;

    property ComponenteInativo: Boolean read GetComponenteInativo;
    property ComponenteForaLinha: Boolean read GetComponenteForaLinha;
    property ComponenteEmPromocao: Boolean read GetComponenteEmPromocao;

    property LinhadaGrade: String read GetLinhadaGrade;
    property ColunadaGrade: String read GetColunadaGrade;
    property LinhadaGradeSimilar: String read GetLinhadaGradeSimilar;
    property ColunadaGradeSimilar: String read GetColunadaGradeSimilar;

    property LinhadaGradeComponente: String read GetLinhadaGradeComponente;
    property ColunadaGradeComponente: String read GetColunadaGradeComponente;


    property OnScrollLinhaColunaGrade    : TNotifyEvent read FOnScrollLinhaColunaGrade write FOnScrollLinhaColunaGrade;
    property OnScrollLinhaColunaGradeSimilar    : TNotifyEvent read FOnScrollLinhaColunaGradeSimilar write FOnScrollLinhaColunaGradeSimilar;
    property OnScrollLinhaColunaGradeComponente    : TNotifyEvent read FOnScrollLinhaColunaGradeComponente write FOnScrollLinhaColunaGradeComponente;

    property OnScrollLinhaColunaGradeLotes : TNotifyEvent read FOnScrollLinhaColunaGradeLotes write FOnScrollLinhaColunaGradeLotes;

    procedure GerarTabelaGrade;
    property ProdutoLinhaGrade : String read GetProdutoLinhaGrade;
    property ProdutoColunaGrade : String read GetProdutoColunaGrade;
    function PosicionarLinhaColunanoProduto(Valorlinha, ValorColuna :String; Tabela: TtecQuery): boolean;

    property ConsultaLinhaColunaCaracteristica: String read GetConsultaLinhaColunaCaracteristica;
    property ConsultaLinhaColunaFilial: String read GetConsultaLinhaColunaFilial;
    function UtilizandoGrade: Boolean;
    procedure TotalPedidosFiliais(produto: int64);
    function GetCodigoNotaProduto: int64;
    function GetProduto: String;
    function GetProdutoGrade: String;
    procedure AbrirConsulteEstoque;

    property TipoConsultaProduto: TipoProduto read GetTipoConsultaProduto write fTipoConsultaProduto;
    procedure Abrir_Produtos_Atributos;

    property SemEstoqueZero: Boolean read FSemEstoqueZero write FSemEstoqueZero;

    property ProdutoEmLinha: Boolean read FprodutoEmLinha write FProdutoEmLinha;
    property ProdutoForadeLinha: Boolean read FprodutoForadeLinha write FProdutoForadeLinha;
    property ProdutoAtivo: Boolean read FprodutoAtivo write FProdutoAtivo;
    property ProdutoInativo_: Boolean read FprodutoInativo_ write FProdutoInativo_;
    property ProdutoComMontagem: Boolean read FProdutoComMontagem write FProdutoComMontagem;
    property ProdutoSemMontagem: Boolean read FProdutoSemMontagem write FProdutoSemMontagem;
    property ProdutoBrinde: Boolean read FProdutoBrinde write FProdutoBrinde;
    property ProdutoNaoBrinde: Boolean read FProdutoNaoBrinde write FProdutoNaoBrinde;
    property DisponivelnoSite: Boolean read fDisponivelnoSite write fDisponivelnoSite;
    property NaoDisponivelnoSite : Boolean read fNaoDisponivelnoSite write fNaoDisponivelnoSite;



  end;

const

   SQLEstoquesDeposito = ' and  (filial in (Select codigo ' +
                                           ' From filiais '+

                                           ' Where (tipofilial = ''D''))) ';

{
var
  dtmconsultaestoque: Tdtmconsultaestoque;
  }

implementation
uses fmconsultaestoque;

{$R *.dfm}

procedure TdtmConsultaEstoque.AbreTabelasPesquisa(TipoPesquisa: TtecPesquisa);
begin
  case TipoPesquisa of
             pesFILIAIS: Abre(ctPesquisaFilial);
              pesGRUPOS: Abre(ctPesquisaGrupo);
             pesCLASSES: Abre(ctPesquisaClasse);
  end;
end;

function TdtmConsultaEstoque.AbrirTabelaConsultaEstoques: Boolean;
var
 SQLSituacaoProdutos, SqlEstoque: String;

begin
  SQLSituacaoProdutos := '';
  SqlEstoque := '';
  
  qryConsultaEstoques.ParamByName('FilialBase').AsInteger := FilialBase;
  qryConsultaEstoques.ParamByName('arredondamento').AsBoolean := Assigned(EcfPadrao) and EcfPadrao.Arredonda;

  if SemEstoqueZero then
  begin
    SqlEstoque   := ' and (quantidadetotaldoestoque(e.produto,e.filial) <> 0) ';
    qryConsultaEstoquesLotes.MacroByName('quantidadetotaldoestoquelote').asString := ' and (quantidadetotaldoestoquelote(e.produto,e.lote,e.filial) <> 0) ';
  end
  else
    qryConsultaEstoquesLotes.MacroByName('quantidadetotaldoestoquelote').asString := '';

  if FProdutoEmLinha and not FprodutoForadeLinha then
    SQLSituacaoProdutos := SQLSituacaoProdutos +
                            ' and  (not p.foralinhal ) and (not c.foralinhal)'
  else
  if FprodutoForadeLinha and not Fprodutoemlinha then
    SQLSituacaoProdutos := SQLSituacaoProdutos +
                           ' and  (p.foralinhal or c.foralinhal)';

  if FProdutoAtivo and not FprodutoInativo_ then
     SQLSituacaoProdutos := SQLSituacaoProdutos + ' and  (not (p.inativo is not null))'
  else
  if FprodutoInativo_ and not FprodutoAtivo then
     SQLSituacaoProdutos := SQLSituacaoProdutos + ' and  (p.inativo is not null)';

  if FProdutoComMontagem and not FProdutoSemMontagem then
     SQLSituacaoProdutos := SQLSituacaoProdutos + ' and (c.montagem)'
  else
  if FProdutoSemMontagem and not FProdutoComMontagem then
     SQLSituacaoProdutos := SQLSituacaoProdutos + ' and not (c.montagem)';

  if FProdutoBrinde and not FProdutoNaoBrinde then
     SQLSituacaoProdutos := SQLSituacaoProdutos + ' and (c.brinde)'
  else
  if FProdutoNaoBrinde and not FProdutoBrinde then
     SQLSituacaoProdutos := SQLSituacaoProdutos + ' and not (c.brinde)';

  if FDisponivelnoSite and not FNaoDisponivelnoSite then
     SQLSituacaoProdutos := SQLSituacaoProdutos + ' and (p.aparecernosite)'
  else
  if FNaoDisponivelnoSite and not FDisponivelnoSite then
     SQLSituacaoProdutos := SQLSituacaoProdutos + ' and not (p.aparecernosite)';


  qryConsultaEstoques.macrobyname('estoque').asString := SqlEstoque;
  qryConsultaEstoques.macrobyname('produtos').asString := SQLSituacaoProdutos;

  qryConsultaLinhaColuna.macrobyname('estoque').asString := SqlEstoque;
  qryConsultaLinhaColuna.macrobyname('produtos').asString := SQLSituacaoProdutos;



  qryConsultaEstoques.Close;
  qryConsultaEstoques.Open;
  Result:= qryConsultaEstoques.IsEmpty;
  if Result then
  begin
    MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
    ReFazConsultaTabelas;
  end;
end;

constructor TdtmConsultaEstoque.Create(AOwner: TComponent);
begin
  inherited;
  qryProcuraFilial.Tag          := ctTabelas;
  qryConsultaFilial.Tag := ctPesquisaFilial;

  qryConsultaProdutosPedidosquantidadependente.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryConsultaEstoquesminimo.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryConsultaEstoquesmaximo.displayformat := parsistema.mascaraquantidadegrade;
  qryConsultaEstoquesQtdecompra.displayformat := parsistema.mascaraquantidadegrade;
  qryConsultaEstoquesemestoque.displayformat := parsistema.mascaraquantidadegrade; 
  qryConsultaEstoquesreservado.displayformat := parsistema.mascaraquantidadegrade;
  qryConsultaEstoquesdemonstracao.displayformat := parsistema.mascaraquantidadegrade;
  qryConsultaEstoquestransito.displayformat := parsistema.mascaraquantidadegrade;
  qryConsultaEstoquesconserto.displayformat := parsistema.mascaraquantidadegrade;
  qryConsultaEstoquesdanificada.displayformat := parsistema.mascaraquantidadegrade;
  qryConsultaEstoquesfuturo.displayformat := parsistema.mascaraquantidadegrade;
  qryConsultaEstoquesestoquevenda.displayformat := parsistema.mascaraquantidadegrade;
  qryConsultaEstoquesestoquetotal.displayformat := parsistema.mascaraquantidadegrade;
  qryConsultaEstoquesreservaprevia.displayformat := parsistema.mascaraquantidadegrade;
  qryConsultaEstoquesestoquefisico.displayformat := parsistema.mascaraquantidadegrade;

  qryProdutosPedidosquantidadefilial.displayformat := parsistema.mascaraquantidadegrade;
  qryProdutosPedidostotalfiliais.DisplayFormat     := ParSistema.MascaraQuantidadeGrade;

  qryVendasAcumuladastotalvenda.displayformat := parsistema.mascaraquantidadegrade;
  qryComprasAcumuladastotalcompra.displayformat := parsistema.mascaraquantidadegrade;


  qryLicitacoesporProdutosquantidade.DisplayFormat := ParSistema.MascaraQuantidadeGrade;
  qryLicitacoesporProdutossaldopendente.DisplayFormat := ParSistema.MascaraQuantidadeGrade;


  qryPrecosCargos.ParamByName('FilialBase').AsInteger:= FilialBase;


end;




function TdtmConsultaEstoque.GetConsultaFilial: TtecQuery;
begin
  Result := qryConsultaFilial;
end;





function TdtmConsultaEstoque.ExisteFilial(campo, codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaFilial, campo, codigo);
end;


procedure TdtmConsultaEstoque.Selecionar(TipoProcura: TtecPesquisa);
begin
  case TipoProcura of
            pesFILIAIS: ReFazConsulta(qryProcuraFilial,         [0],[qryConsultaFilialcodigo.AsInteger]);
  end;
end;

procedure TdtmConsultaEstoque.FechaTabelasPesquisa(TipoPesquisa: TtecPesquisa);
begin
  case TipoPesquisa of
        pesITEMPRODUTOS: Fecha(ctPesquisaItemProdutos);
     pesCARACTERISTICAS: Fecha(ctPesquisaCaracteristica);
             pesFILIAIS: Fecha(ctPesquisaFilial);
              pesGRUPOS: Fecha(ctPesquisaGrupo);
             pesCLASSES: Fecha(ctPesquisaClasse);
  end;
end;

procedure TdtmConsultaEstoque.SetClasse(const Value: String);
begin
  if (Value <> '') then qryConsultaEstoques.MacroByName('Classe').AsString := 'and ('+ Value + ')'
  else                  qryConsultaEstoques.MacroByName('Classe').AsString := '';
end;

procedure TdtmConsultaEstoque.SetFilial(const Value: String);
begin
  if ParSistema.FiliaisIndependentes then
  begin
    qryConsultaEstoques.MacroByName('Filial').AsString := 'and (e.filial = ' + IntToStr(FilialBase) + ')';
    qryConsultaEstoquesSimilares.MacroByName('Filial').AsString := 'and (e.filial = ' + IntToStr(FilialBase) + ')';
    qryConsultaEstoquesComponentes.MacroByName('Filial').AsString := 'and (e.filial = ' + IntToStr(FilialBase) + ')';
  end
  else
  if (Value <> '') then
  begin
    qryConsultaEstoques.MacroByName('Filial').AsString := 'and (e.filial = ' + Value + ')';
    qryConsultaEstoquesSimilares.MacroByName('Filial').AsString := 'and (e.filial = ' + Value + ')';
    qryConsultaEstoquesComponentes.MacroByName('Filial').AsString := 'and (e.filial = ' + Value + ')';
  end
  else
  begin
    qryConsultaEstoques.MacroByName('Filial').AsString := '';
    qryConsultaEstoquesSimilares.MacroByName('Filial').AsString := '';
    qryConsultaEstoquesComponentes.MacroByName('Filial').AsString := '';
  end;
end;

procedure TdtmConsultaEstoque.SetGrupo(const Value: String);
begin
  if (Value <> '') then qryConsultaEstoques.MacroByName('Grupo').AsString := 'and (' + Value + ')'
  else                  qryConsultaEstoques.MacroByName('Grupo').AsString := '';
end;

procedure TdtmConsultaEstoque.SetProduto(const Value: String);
begin
  if (Value <> '') then qryConsultaEstoques.MacroByName('Produto').AsString := 'and (' + Value + ')'
  else                  qryConsultaEstoques.MacroByName('Produto').AsString  := '';
end;

procedure TdtmConsultaEstoque.SetItemProduto(const Value: String);
begin
  if (Value <> '') then qryConsultaEstoques.MacroByName('Item').AsString := 'and (' + Value + ')'
  else                  qryConsultaEstoques.MacroByName('Item').AsString  := '';
end;

procedure TdtmConsultaEstoque.ReFazConsultaTabelas;
begin
  if not qryProcuraFilial.IsEmpty then
    ReFazConsulta(qryProcuraFilial,[0],[0]);
  if not qryPrecos.IsEmpty then
    qryPrecos.Close;
{  if not qryMovimentos.IsEmpty then
    qryMovimentos.Close;}
  if not qryProdutosPedidos.IsEmpty then
    qryProdutosPedidos.Close;
  if not qryVendasAcumuladas.IsEmpty then
    qryVendasAcumuladas.Close;
  if not qryComprasAcumuladas.IsEmpty then
    qryComprasAcumuladas.Close;
  if not qryConsultaEstoques.IsEmpty then
    qryConsultaEstoques.Close;
  if not qryGrade.IsEmpty then
    qrygrade.Close;
end;

procedure TdtmConsultaEstoque.qryConsultaEstoquesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  AbrirTabelasEstoque;

  if tipoconsultaproduto <> produtosAlteracoesPrecos then
    AbrirTabelasAcumuladores(False);

  if (qryPrecosvalidade.AsDateTime < DataServidor) then
  begin
    qryPrecosvalorpromocao.Clear;
    qryPrecosvalidade.Clear;
  end;

  if qryConsultaEstoquesSimilares.Active then
    qryConsultaEstoquesSimilares.Close;

  if qryModelosCaracteristicas.Active then
    qryModelosCaracteristicas.Close;
               {
  if qryPrecosSimilares.Active then
    qryPrecosSimilares.Close;
    }

    {
  if qryProdutosPedidosSimilares.Active then
    qryProdutosPedidosSimilares.Close;
    }

  if Assigned(OnScrollLinhaColunaGrade) then
    OnScrollLinhaColunaGrade(qryConsultaEstoques);

    {
  if ParSistema.PrecosporCargo then
    RefazConsultaPorNome(qryPrecosCargos,['produto','FilialBase'],[qryConsultaEstoquesproduto.AsVariant, FilialBase])
  else
    RefazConsultaPorNome(qryColunasPrecos,['caracteristica','preco'],[qryConsultaEstoquescaracteristica.AsString, qryConsultaEstoquespreco.AsInteger]);


  RefazConsultaPorNome(qryAjustarValorUltimaCompra,['produto','FilialBase'],[qryConsultaEstoquesproduto.AsVariant, FilialBase]);

  RefazConsultaPorNome(qryConsultaProdutosPedidos,['produto'],[qryConsultaEstoquesproduto.AsVariant]);
  }

  qryConsultaEstoqueslocalizacao.readonly := not usuariologin.GerenteEstoque;
  qryConsultaEstoquesmaximo.readonly := not usuariologin.GerenteEstoque;
  qryConsultaEstoquesminimo.readonly := not usuariologin.GerenteEstoque;

end;

procedure TdtmConsultaEstoque.AbrirTabelasProcura(TipoPesquisa: TtecPesquisa);
begin
//  case TipoPesquisa of
//  end;
end;
{
procedure TdtmConsultaEstoque.SetMostrar(const Value: Char);
begin
  if FMostrar <> Value then
    FMostrar:= Value;
end;
}

procedure TdtmConsultaEstoque.AbrirTabelasAcumuladores(Similares: Boolean);
begin
  If Similares then
  begin
    RefazConsultaPorNome(qryVendasAcumuladas, ['produto','filial'],
                                              [qryConsultaEstoquesSimilaresproduto.AsLargeInt,
                                               qryConsultaEstoquesfilial.AsInteger]);
    RefazConsultaPorNome(qryComprasAcumuladas,['produto','filial'],
                                              [qryConsultaEstoquesSimilaresproduto.AsLargeInt,
                                               qryConsultaEstoquesfilial.AsInteger]);
  end
  else
  begin
    RefazConsultaPorNome(qryVendasAcumuladas, ['produto','filial'],
                                              [qryConsultaEstoquesproduto.AsLargeInt,
                                               qryConsultaEstoquesfilial.AsInteger]);
    RefazConsultaPorNome(qryComprasAcumuladas,['produto','filial'],
                                              [qryConsultaEstoquesproduto.AsLargeInt,
                                               qryConsultaEstoquesfilial.AsInteger]);
  end;
end;

procedure TdtmConsultaEstoque.AbrirTabelasEstoque;
begin
  case tipoconsultaproduto of
    similares :
    begin

      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstEstoque' then
      begin
        RefazConsultaPorNome(qryPrecos,['caracteristica','preco','filial','colunanormal','colunapromocao'],
                                       [qryConsultaEstoquesSimilarescaracteristica.AsLargeInt,
                                        qryConsultaEstoquesSimilarespreco.AsInteger,
                                        qryConsultaEstoquesSimilaresfilial.AsInteger,
                                        qryConsultaEstoquesSimilarespreconormal.AsInteger,
                                        qryConsultaEstoquesSimilaresprecopromocao.AsInteger]);

        if ParSistema.FiliaisIndependentes then
          TotalPedidosFiliais(qryConsultaEstoquesSimilaresproduto.AsLargeInt)
        else
          RefazConsultaPorNome(qryProdutosPedidos,['produto','filial'],
                                                         [qryConsultaEstoquesSimilaresproduto.AsLargeInt,
                                                          qryConsultaEstoquesSimilaresfilial.AsInteger]);
      end;

      if ParSistema.PrecosporCargo then
      begin
        if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstPrecosCargos' then
          RefazConsultaPorNome(qryPrecosCargos,['produto','filialbase'],
                                               [qryConsultaEstoquesSimilaresproduto.AsVariant,
                                               FilialBase])
      end
      else
      begin
        if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstPrecos' then
          RefazConsultaPorNome(qryColunasPrecos,['caracteristica','preco'],[qryConsultaEstoquesSimilarescaracteristica.AsVariant,
                                                                            qryConsultaEstoquesSimilarespreco.AsInteger]);
      end;

      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstPrecosporCliente' then
        RefazConsultaPorNome(qryPrecosClientes,['produto'],[qryConsultaEstoquesSimilaresproduto.AsVariant]);

      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstMovimento' then
        RefazConsultaPorNome(qryAjustarValorUltimaCompra,['Produto','FilialBase'],[qryConsultaEstoquesSimilaresproduto.AsVariant,  FilialBase]);


      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstPedidos' then
      begin
        RefazConsultaPorNome(qryConsultaProdutosPedidos,['produto'],[qryConsultaEstoquesSimilaresproduto.AsLargeInt]);
        RefazConsultaPorNome(qryConsultaProdutosEntradaSefaz,['produto'],[qryConsultaEstoquesSimilaresproduto.AsLargeInt], True);
      end;

      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstFornecedores' then
        RefazConsultaPorNome(qryfornecedoresprodutos,['produto', 'Caracteristica'],
          [qryConsultaEstoquesSimilaresproduto.AsLargeInt,
          qryConsultaEstoquesSimilarescaracteristica.AsLargeInt], true);

      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstLicitacoes' then
        RefazConsultaPorNome(qryLicitacoesporProdutos,['produto'],
          [qryConsultaEstoquesSimilaresproduto.AsLargeInt], true);


    end;

    produtosAlteracoesPrecos :
    begin
      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstMovimento' then
        RefazConsultaPorNome(qryAjustarValorUltimaCompra,['produto','FilialBase'],[qryConsultaEstoquesproduto.AsLargeInt, FilialBase])
    end;

    produtos :
    begin
      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstEstoque' then
      begin
        RefazConsultaPorNome(qryPrecos,['caracteristica','preco','filial','colunanormal','colunapromocao'],
                                       [qryConsultaEstoquescaracteristica.AsLargeInt,
                                        qryConsultaEstoquespreco.AsInteger,
                                        qryConsultaEstoquesfilial.AsInteger,
                                        qryConsultaEstoquespreconormal.AsInteger,
                                        qryConsultaEstoquesprecopromocao.AsInteger]);
        if ParSistema.FiliaisIndependentes then
          TotalPedidosFiliais(qryConsultaEstoquesproduto.AsLargeInt)
        else
          RefazConsultaPorNome(qryProdutosPedidos,['produto','filial'],
                                                  [qryConsultaEstoquesproduto.AsLargeInt,
                                                   qryConsultaEstoquesfilial.AsInteger]);
      end;

      if ParSistema.PrecosporCargo then
      begin
        if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstPrecosCargos' then
          RefazConsultaPorNome(qryPrecosCargos,['produto','filialbase'],[qryConsultaEstoquesproduto.AsLargeInt, FilialBase])
      end
      else
      begin
        if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstPrecos' then
          RefazConsultaPorNome(qryColunasPrecos,['caracteristica','preco'],[qryConsultaEstoquescaracteristica.Asvariant,
                                                                            qryConsultaEstoquespreco.AsInteger]);
      end;
      
      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstPrecosporCliente' then
        RefazConsultaPorNome(qryPrecosClientes,['produto'],[qryConsultaEstoquesproduto.AsLargeInt]);

      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstMovimento' then
        RefazConsultaPorNome(qryAjustarValorUltimaCompra,['produto','FilialBase'],[qryConsultaEstoquesproduto.AsLargeInt, FilialBase]);

      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstPedidos' then
      begin
        RefazConsultaPorNome(qryConsultaProdutosPedidos,['produto'],[qryConsultaEstoquesproduto.AsLargeInt]);
        RefazConsultaPorNome(qryConsultaProdutosEntradaSefaz,['produto'],[qryConsultaEstoquesproduto.AsLargeInt], True);
      end;  

      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstFornecedores' then
        RefazConsultaPorNome(qryfornecedoresprodutos,['produto', 'Caracteristica'],
           [qryConsultaEstoquesproduto.AsLargeInt,
            qryConsultaEstoquescaracteristica.AsLargeInt], True);

      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstLicitacoes' then
        RefazConsultaPorNome(qryLicitacoesporProdutos,['produto'],
          [qryConsultaEstoquesproduto.AsLargeInt], true);


    end;

    produtoslotes :
    begin
      RefazConsultaPorNome(qryPrecos,['caracteristica','preco','filial','colunanormal','colunapromocao'],
                                     [qryConsultaEstoquesLotescaracteristica.AsLargeInt,
                                      qryConsultaEstoquesLotespreco.AsInteger,
                                      qryConsultaEstoquesLotesfilial.AsInteger,
                                      qryConsultaEstoquesLotespreconormal.AsInteger,
                                      qryConsultaEstoquesLotesprecopromocao.AsInteger]);
      if ParSistema.FiliaisIndependentes then
        TotalPedidosFiliais(qryConsultaEstoquesLotesproduto.AsLargeInt)
      else
        RefazConsultaPorNome(qryProdutosPedidos,['produto','filial'],
                                                [qryConsultaEstoquesLotesproduto.AsLargeInt,
                                                 qryConsultaEstoquesLotesfilial.AsInteger]);

      if ParSistema.PrecosporCargo then
        RefazConsultaPorNome(qryPrecosCargos,['produto','filialbase'],[qryConsultaEstoquesLotesproduto.AsLargeInt, FilialBase])
      else
        RefazConsultaPorNome(qryColunasPrecos,['caracteristica','preco'],[qryConsultaEstoquesLotescaracteristica.Asvariant,
                                                                          qryConsultaEstoquesLotespreco.AsInteger]);
      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstPrecosporCliente' then
        RefazConsultaPorNome(qryPrecosClientes,['produto'],[qryConsultaEstoquesLotesproduto.AsLargeInt]);

      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstMovimento' then
        RefazConsultaPorNome(qryAjustarValorUltimaCompra,['produto','FilialBase'],[qryConsultaEstoquesLotesproduto.AsLargeInt, FilialBase]);

      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstPedidos' then
      begin
        RefazConsultaPorNome(qryConsultaProdutosPedidos,['produto'],[qryConsultaEstoquesLotesproduto.AsLargeInt]);
        RefazConsultaPorNome(qryConsultaProdutosEntradaSefaz,['produto'],[qryConsultaEstoquesLotesproduto.AsLargeInt], True);
      end;

      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstFornecedores' then
        RefazConsultaPorNome(qryfornecedoresprodutos,['produto', 'Caracteristica'],
           [qryConsultaEstoquesLotesproduto.AsLargeInt,
            qryConsultaEstoquesLotescaracteristica.AsLargeInt], True);

      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstLicitacoes' then
        RefazConsultaPorNome(qryLicitacoesporProdutos,['produto'],
          [qryConsultaEstoquesLotesproduto.AsLargeInt], true);

    end;


    componentes:
    begin

      RefazConsultaPorNome(qryPrecos,['caracteristica','preco','filial','colunanormal','colunapromocao'],
                                     [qryConsultaEstoquesComponentescaracteristica.AsLargeInt,
                                      qryConsultaEstoquesComponentespreco.AsInteger,
                                      qryConsultaEstoquesComponentesfilial.AsInteger,
                                      qryConsultaEstoquesComponentespreconormal.AsInteger,
                                      qryConsultaEstoquesComponentesprecopromocao.AsInteger]);

      if ParSistema.FiliaisIndependentes then
        TotalPedidosFiliais(qryConsultaEstoquesComponentesproduto.AsLargeInt)
      else
        RefazConsultaPorNome(qryProdutosPedidos,['produto','filial'],
                                                       [qryConsultaEstoquesComponentesproduto.AsLargeInt,
                                                        qryConsultaEstoquesComponentesfilial.AsInteger]);
      if ParSistema.PrecosporCargo then
        RefazConsultaPorNome(qryPrecosCargos,['produto','filialbase'],
                                             [qryConsultaEstoquesComponentesproduto.AsVariant,
                                              FilialBase])
      else
        RefazConsultaPorNome(qryColunasPrecos,['caracteristica','preco'],[qryConsultaEstoquesComponentescaracteristica.AsVariant,
                                                                          qryConsultaEstoquesComponentespreco.AsInteger]);

      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstPrecosporCliente' then
        RefazConsultaPorNome(qryPrecosClientes,['produto'],[qryConsultaEstoquesComponentesproduto.AsVariant]);

      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstMovimento' then
        RefazConsultaPorNome(qryAjustarValorUltimaCompra,['Produto','FilialBase'],[qryConsultaEstoquesComponentesproduto.AsVariant,
                                                                                FilialBase]);

      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstPedidos' then
      begin
        RefazConsultaPorNome(qryConsultaProdutosPedidos,['produto'],[qryConsultaEstoquesComponentesproduto.AsLargeInt]);
        RefazConsultaPorNome(qryConsultaProdutosEntradaSefaz,['produto'],[qryConsultaEstoquesComponentesproduto.AsLargeInt], True);
      end;

      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstFornecedores' then
        RefazConsultaPorNome(qryfornecedoresprodutos,['produto', 'Caracteristica'],
           [qryConsultaEstoquesComponentesproduto.AsLargeInt,
            qryConsultaEstoquesComponentescaracteristica.AsLargeInt], True);

      if TtecPageControl(TfrmConsultaEstoque(self.Owner).FindComponent('pgcEstoques')).activepage.Name = 'tstLicitacoes' then
        RefazConsultaPorNome(qryLicitacoesporProdutos,['produto'],
          [qryConsultaEstoquesComponentesproduto.AsLargeInt], true);


    end;
  end;

  with TfrmConsultaEstoque(self.owner) do
    if pgcItensProdutos.ActivePage = tstAtributos then
      Abrir_Produtos_Atributos

end;

procedure TdtmConsultaEstoque.AbrirTabelaProdutosSimilares;
begin
  if not qryConsultaEstoques.IsEmpty then
    RefazConsultaPorNome(qryConsultaEstoquesSimilares,['produto'],
                                                      [qryConsultaEstoquesproduto.AsLargeInt]);
end;

procedure TdtmConsultaEstoque.qryConsultaEstoquesSimilaresAfterScroll(DataSet: TDataSet);
begin
  inherited;
  AbrirTabelasEstoque;
  AbrirTabelasAcumuladores(True);

  RefazConsultaPorNome(qryPrecos,['caracteristica','preco','filial','colunanormal','colunapromocao'],
                                          [qryConsultaEstoquesSimilarescaracteristica.AsLargeInt,
                                           qryConsultaEstoquesSimilarespreco.AsInteger,
                                           qryConsultaEstoquesSimilaresfilial.AsInteger,
                                           qryConsultaEstoquesSimilarespreconormal.AsInteger,
                                           qryConsultaEstoquesSimilaresprecopromocao.AsInteger]);
  RefazConsultaPorNome(qryProdutosPedidos,['produto','filial'],
                                                   [qryConsultaEstoquesSimilaresproduto.AsLargeInt,
                                                    qryConsultaEstoquesSimilaresfilial.AsInteger]);

  if (qryPrecosvalidade.AsDateTime < DataServidor) then
  begin
    qryPrecosvalorpromocao.Clear;
    qryPrecosvalidade.Clear;
  end;
  if Assigned(OnScrollLinhaColunaGradeSimilar) then
    OnScrollLinhaColunaGradeSimilar(qryConsultaEstoquesSimilares);

    {
  RefazConsultaPorNome(qryPrecosCargos,['produto','FilialBase'],[qryConsultaEstoquesSimilaresproduto.AsVariant,
                                                                 FilialBase]);

  RefazConsultaPorNome(qryAjustarValorUltimaCompra,['Produto','FilialBase'],[qryConsultaEstoquesSimilaresproduto.AsVariant,
                                                                             FilialBase]);
   }

  qryConsultaEstoquesSimilareslocalizacao.ReadOnly := not UsuarioLogin.GerenteEstoque;
  qryConsultaEstoquesSimilaresmaximo.ReadOnly := not UsuarioLogin.GerenteEstoque;
  qryConsultaEstoquesSimilaresminimo.ReadOnly := not UsuarioLogin.GerenteEstoque;

end;

function TdtmConsultaEstoque.GetProdutoEmPromocao: Boolean;
begin
  Result:= qryConsultaEstoquesprodutoempromocao.AsBoolean;
end;

function TdtmConsultaEstoque.GetProdutoSimilarEmPromocao: Boolean;
begin
  Result:= qryConsultaEstoquesSimilaresprodutoempromocao.AsBoolean;
end;

function TdtmConsultaEstoque.GetColunadaGrade: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryConsultaEstoquescoluna.AsString)
end;

function TdtmConsultaEstoque.GetLinhadaGrade: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryConsultaEstoqueslinha.AsString)
end;

procedure TdtmConsultaEstoque.GerarTabelaGrade;
const
 SQLColunaGrade = 'cast(null as varchar(120)) as %s';
 SQLLinha =  'eg1.valor as valorgrade1';
 SQLColuna = 'eg2.valor as valorgrade2';

 SQLFromLinha = '(elementosgrades eg1 join grades g1 on eg1.grade = g1.codigo)';

 SQLFromColuna = '(elementosgrades eg2 join grades g2 on eg2.grade = g2.codigo)';

 SQLWhereLinha = 'eg1.grade = :linha';

 SQLWhereColuna = 'eg2.grade = :coluna';

 SQLOrderLinha = 'eg1.valor';

 SQLOrderColuna = 'eg2.valor';

Var
 SQLGrade, Linhas : TStringList;
 I,J : Integer;
begin
 if (qryConsultaEstoquescaracteristica.AsString<>
     ConsultaLinhaColunacaracteristica) or
    (qryConsultaEstoquesfilial.AsString<>
     ConsultaLinhaColunafilial) or not qrygrade.Active then
 begin
   SQLGrade := TStringList.Create;
   Colunas :=  TStringList.Create;
   Linhas := TStringList.Create;
   Colunas.Duplicates := dupIgnore;
   Linhas.Duplicates := dupIgnore;
   Colunas.Sorted := True;
   Linhas.Sorted := True;
   if (qryConsultaEstoquesgrade1.AsString<>'') and
      (qryConsultaEstoquesgrade2.AsString<>'') then
   begin
     qryConsultaLinhaColuna.sql[32] := SQLLinha+',';
     qryConsultaLinhaColuna.sql[33] := SQLColuna;
     qryConsultaLinhaColuna.sql[35] := SQLFromLinha+',';
     qryConsultaLinhaColuna.sql[36] := SQLFromColuna;
     qryConsultaLinhaColuna.sql[38] := SQLWhereLinha+' and ';
     qryConsultaLinhaColuna.sql[39] := SQLWhereColuna;
     qryConsultaLinhaColuna.sql[41] := SQLOrderlinha+',';
     qryConsultaLinhaColuna.sql[42] := SQLOrderColuna;
     RefazConsultaPorNome(qryConsultaLinhaColuna, ['linha','coluna','caracteristica','filial'],
                                                  [qryConsultaEstoquesgrade1.AsVariant,
                                                   qryConsultaEstoquesgrade2.AsVariant,
                                                   qryConsultaEstoquescaracteristica.AsVariant,
                                                   qryConsultaEstoquesfilial.AsVariant])
   end
   else
   if (qryConsultaEstoquesgrade1.AsString<>'') then
   begin
     qryConsultaLinhaColuna.sql[32] := SQLLinha+', cast('''' as varchar) as valorgrade2';
     qryConsultaLinhaColuna.sql[33] := '';
     qryConsultaLinhaColuna.sql[35] := SQLFromLinha;
     qryConsultaLinhaColuna.sql[36] := '';
     qryConsultaLinhaColuna.sql[38] := SQLWhereLinha;
     qryConsultaLinhaColuna.sql[39] := '';
     qryConsultaLinhaColuna.sql[41] := SQLOrderlinha;
     qryConsultaLinhaColuna.sql[42] := '';
     ReFazConsulta(qryConsultaLinhaColuna, [0,1,2],
                         [qryConsultaEstoquesgrade1.AsVariant,
                          qryConsultaEstoquescaracteristica.AsVariant,
                          qryConsultaEstoquesfilial.AsVariant])
   end
   else
   if (qryConsultaEstoquesgrade2.AsString<>'') then
   begin
     qryConsultaLinhaColuna.sql[32] := '';
     qryConsultaLinhaColuna.sql[33] := 'cast('''' as varchar) as valorgrade1, '+SQLColuna;
     qryConsultaLinhaColuna.sql[35] := '';
     qryConsultaLinhaColuna.sql[36] := SQLFromColuna;
     qryConsultaLinhaColuna.sql[38] := '';
     qryConsultaLinhaColuna.sql[39] := SQLWhereColuna;
     qryConsultaLinhaColuna.sql[41] := '';
     qryConsultaLinhaColuna.sql[42] := SQLOrderColuna;
     ReFazConsulta(qryConsultaLinhaColuna, [0,1,2],
                         [qryConsultaEstoquesgrade2.AsVariant,
                          qryConsultaEstoquescaracteristica.AsVariant,
                          qryConsultaEstoquesfilial.AsVariant])
   end;
   qryConsultaLinhaColuna.First;
   while not qryConsultaLinhaColuna.Eof do
   begin
    linhas.Add(qryConsultaLinhaColunavalorgrade1.AsString);
    Colunas.Add(qryConsultaLinhaColunavalorgrade2.AsString);
    qryConsultaLinhaColuna.Next;
   end;

   SQLGrade.Append('Select cast('''' as varchar) as LinhaColuna,');
   for I:=0 to Colunas.Count -1 do
   begin
    if I<>Colunas.Count -1 then
     SQLGrade.append(format(SQLColunaGrade,['_'+inttostr(I)+',']))
    else
     SQLGrade.append(format(SQLColunaGrade,['_'+inttostr(I)]));
   end;

   qryGrade.Free;
   qryGrade:= TtecQuery.Create(Nil);
   qryGrade.Database := qryconsultalinhacoluna.Database;

   qryGrade.SQL := SQLGrade;

   qryGrade.CachedUpdates := true;

   qrygrade.RequestLive := true;

   qryGrade.Open;

   qryGrade.Delete;

   for I:=0 to Linhas.Count -1 do

   begin

    qryGrade.Append;

    qrygrade.Fields[0].AsString := Linhas.Strings[I];

    if I=0 then

    begin

      qrygrade.Fields[0].DisplayLabel := LinhadaGrade+'/'+ColunadaGrade;

      qrygrade.Fields[0].DisplayWidth := 12;
      qrygrade.Fields[0].Alignment := taCenter;
    end;


    for J:=0 to Colunas.count-1 do

    begin

     if qryConsultaLinhaColuna.Locate('valorgrade1;valorgrade2',

       VarArrayof([Linhas.Strings[I],Colunas.Strings[J]]),[]) then

     begin

       if qryConsultaLinhaColunaproduto.AsString<>'' then

        qrygrade.Fields[J+1].AsString := qryconsultalinhacolunaproduto.asstring+chr(13)+chr(10)+

                                         qryconsultalinhacolunaemestoque.asstring+'/'+

                                         qryconsultalinhacolunaestoquetotal.asstring+chr(13)+chr(10)+

                                         ctMOEDA+'  '+trim(formatarvalor(qryConsultaLinhaColunaprecoatual.Asfloat,2));

     end;

     if I=0 then

     begin

       qrygrade.Fields[J+1].DisplayLabel :=  Colunas.Strings[J];

       qrygrade.Fields[J+1].DisplayWidth := 16;
       qrygrade.Fields[J+1].Alignment := taCenter;
     end;
    end;

    qryGrade.Post;

   end;



   dsrGrade.DataSet := qryGrade;

   qrygrade.First;

   while not qrygrade.Eof do

   begin

    if qrygrade.Fields[0].AsString = qryConsultaEstoquesvalorgrade1.AsString then

     break;

    qrygrade.Next;

   end;

   SQLGrade.Free;

  end;

  qryGrade.AfterScroll := qryGradeAfterScroll;

end;

function TdtmConsultaEstoque.GetProdutoColunaGrade: String;
begin
 result := qryConsultaEstoquesvalorgrade2.AsString;
end;

function TdtmConsultaEstoque.GetProdutoLinhaGrade: String;
begin
 result := qryConsultaEstoquesvalorgrade1.AsString;
end;

function TdtmConsultaEstoque.PosicionarLinhaColunanoProduto(
  ValorLinha, ValorColuna: String; Tabela: TtecQuery): boolean;
begin
  result := false;

  NomeCampoColunaselecionadoGrade := ValorColuna;

  if Tabela = nil then
    if qrygrade.fields[0].asString <> ValorLinha then
      qryGrade.Locate(qrygrade.fields[0].fieldname, ValorLinha, []);

  if (tabela<>nil) and tabela.Active then
  begin
    if (ValorColuna <> '') and (ValorLinha <> '') then
     result := Tabela.Locate('valorgrade1;valorgrade2;filial', VarArrayOf([ValorLinha,
                      ValorColuna,strtoint(ConsultaLinhaColunaFilial)]),[])
    else
    if (ValorColuna <> '') then
     result := tabela.Locate('valorgrade2,filial', VarArrayOf([ValorColuna, strtoint(ConsultaLinhaColunaFilial)]), [])
    else
    if (ValorLinha <> '') then
     result := tabela.Locate('valorgrade1,filial', VarArrayOf([ValorLinha,strtoint(ConsultaLinhaColunaFilial)]),[]);
  end;
end;

function TdtmConsultaEstoque.GetProdutoLinhaColunaEmPromocao: Boolean;
begin
  Result:= qryConsultaLinhaColunaprodutoempromocao.AsBoolean;
end;

function TdtmConsultaEstoque.GetConsultaLinhaColunaCaracteristica: String;
begin
 result := '';
 if qryConsultaLinhaColuna.Active then
 begin
   qryConsultaLinhaColuna.First;
   while not qryConsultaLinhaColuna.Eof do
   begin
    if qryConsultaLinhaColunacaracteristica.AsString<>'' then
    begin
     result := qryConsultaLinhaColunacaracteristica.AsString;
     break;
    end
    else
     qryConsultaLinhaColuna.Next;
   end;
 end;
end;

function TdtmConsultaEstoque.GetConsultaLinhaColunaFilial: String;
begin
 result := '';
 if qryConsultaLinhaColuna.Active then
 begin
   qryConsultaLinhaColuna.First;
   while not qryConsultaLinhaColuna.Eof do
   begin
    if qryConsultaLinhaColunafilial.AsString<>'' then
    begin
     result := qryConsultaLinhaColunafilial.AsString;
     break;
    end
    else
     qryConsultaLinhaColuna.Next;
   end;
 end;
end;

function TdtmConsultaEstoque.UtilizandoGrade: Boolean;
begin
 result := ParSistema.UsarGradesProdutos and
           ((qryConsultaEstoquesgrade1.AsString<>'') or
            (qryConsultaEstoquesgrade2.AsString<>''))
end;

function TdtmConsultaEstoque.GetColunadaGradeSimilar: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryConsultaEstoquesSimilarescoluna.AsString)
end;

function TdtmConsultaEstoque.GetLinhadaGradeSimilar: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryConsultaEstoquesSimilareslinha.AsString)
end;

function TdtmConsultaEstoque.GetProdutoInativo: Boolean;
begin
  Result:=qryConsultaEstoquesprodutoinativo.AsBoolean;
end;

function TdtmConsultaEstoque.GetProdutoForaLinha: Boolean;
begin
  Result:=qryConsultaEstoquesprodutoforalinha.AsBoolean;
end;

function TdtmConsultaEstoque.GetProdutoSimilarForaLinha: Boolean;
begin
  Result:=qryConsultaEstoquesSimilaresProdutoForaLinha.AsBoolean;
end;

function TdtmConsultaEstoque.GetProdutoSimilarInativo: Boolean;
begin
  Result:=qryConsultaEstoquesSimilaresprodutoforalinha.AsBoolean;
end;

procedure TdtmConsultaEstoque.TotalPedidosFiliais(produto: int64);
begin
  TotalPedidos:= 0;
  qryConsultaFilial.Open;
  qryConsultaFilial.First;
  while not qryConsultaFilial.Eof do
  begin
    RefazConsultaPorNome(qryProdutosPedidos,['produto','filial'],[produto,
                                                                  qryConsultaFilialcodigo.AsVariant]);
    TotalPedidos:= TotalPedidos + qryProdutosPedidosquantidadefilial.AsFloat;
    qryConsultaFilial.Next;
  end;
  qryProdutosPedidos.Edit;
  qryProdutosPedidostotalfiliais.AsFloat:= TotalPedidos;
  qryProdutosPedidos.Post
end;

procedure TdtmConsultaEstoque.qryAjustarValorUltimaCompraAfterPost(DataSet: TDataSet);
begin
  inherited;
    //RefazConsultaPorNome(qryPrecosCargos,['Produto','FilialBase'],[qryConsultaEstoquesproduto.AsVariant,FilialBase]);
end;

procedure TdtmConsultaEstoque.GravarValorUltimaCompra(Valor: Currency; Similares: Boolean);
begin
  if Similares then
  begin
    qryAtualizaValorUltimaCompra.Params[0].AsCurrency := Valor;
    qryAtualizaValorUltimaCompra.Params[1].AsString   := qryConsultaEstoquesSimilaresproduto.AsString;
    qryAtualizaValorUltimaCompra.ExecSql;
    Perpetrar([qryAtualizaValorUltimaCompra]);
    RefazConsultaPorNome(qryAjustarValorUltimaCompra,['produto','FilialBase'],[qryConsultaEstoquesSimilaresproduto.AsVariant,FilialBase]);
  end
  else
  begin
    qryAtualizaValorUltimaCompra.Params[0].AsCurrency := Valor;
    qryAtualizaValorUltimaCompra.Params[1].AsString   := qryConsultaEstoquesproduto.AsString;
    qryAtualizaValorUltimaCompra.ExecSql;
    Perpetrar([qryAtualizaValorUltimaCompra]);
    RefazConsultaPorNome(qryAjustarValorUltimaCompra,['produto','FilialBase'],[qryConsultaEstoquesproduto.AsVariant,FilialBase]);
  end;
end;


procedure TdtmConsultaEstoque.AbrirTabelaProdutosModelos;
begin
  if not qryConsultaEstoques.IsEmpty then
    RefazConsultaPorNome(qryModelosCaracteristicas,['codigo'],[qryConsultaEstoquesproduto.AsLargeInt]);
end;

procedure TdtmConsultaEstoque.qryConsultaEstoquesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  perpetrar([]);
  qryConsultaEstoquespeso.Visible := ParSistema.LiberarVisualizacaoPesoProdutonasPesquisas;
end;

procedure TdtmConsultaEstoque.qryConsultaEstoquesSimilaresAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaEstoquesSimilarespeso.Visible := ParSistema.LiberarVisualizacaoPesoProdutonasPesquisas;
end;

procedure TdtmConsultaEstoque.qryConsultaEstoquesComponentesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaEstoquesComponentespeso.Visible := ParSistema.LiberarVisualizacaoPesoProdutonasPesquisas;

end;

procedure TdtmConsultaEstoque.AbrirTabelaComponentes;
begin
  if not qryConsultaEstoques.IsEmpty then
    RefazConsultaPorNome(qryConsultaEstoquesComponentes,['composto'], [qryConsultaEstoquesproduto.AsLargeInt]);
end;


function TdtmConsultaEstoque.GetComponenteForaLinha: Boolean;
begin
  Result:=qryConsultaEstoquesComponentesProdutoForaLinha.AsBoolean;
end;

function TdtmConsultaEstoque.GetComponenteInativo: Boolean;
begin
  Result:=qryConsultaEstoquesComponentesProdutoInativo.AsBoolean;
end;

function TdtmConsultaEstoque.GetComponenteEmPromocao: Boolean;
begin
  Result:= qryConsultaEstoquesComponentesProdutoempromocao.AsBoolean;
end;

procedure TdtmConsultaEstoque.qryConsultaEstoquesComponentesAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  AbrirTabelasEstoque;
//  AbrirTabelasAcumuladores(True);

  RefazConsultaPorNome(qryPrecos,['caracteristica','preco','filial','colunanormal','colunapromocao'],
                                          [qryConsultaEstoquesComponentescaracteristica.AsLargeInt,
                                           qryConsultaEstoquesComponentespreco.AsInteger,
                                           qryConsultaEstoquesComponentesfilial.AsInteger,
                                           qryConsultaEstoquesComponentespreconormal.AsInteger,
                                           qryConsultaEstoquesComponentesprecopromocao.AsInteger]);
  RefazConsultaPorNome(qryProdutosPedidos,['produto','filial'],
                                                   [qryConsultaEstoquesComponentesproduto.AsLargeInt,
                                                    qryConsultaEstoquesComponentesfilial.AsInteger]);

  if (qryPrecosvalidade.AsDateTime < DataServidor) then
  begin
    qryPrecosvalorpromocao.Clear;
    qryPrecosvalidade.Clear;
  end;
  if Assigned(OnScrollLinhaColunaGradeComponente) then
    OnScrollLinhaColunaGradeComponente(qryConsultaEstoquesComponentes);

    {
  RefazConsultaPorNome(qryPrecosCargos,['produto','FilialBase'],[qryConsultaEstoquesSimilaresproduto.AsVariant,
                                                                 FilialBase]);

  RefazConsultaPorNome(qryAjustarValorUltimaCompra,['Produto','FilialBase'],[qryConsultaEstoquesSimilaresproduto.AsVariant,
                                                                             FilialBase]);
   }

end;

function TdtmConsultaEstoque.GetColunadaGradeComponente: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryConsultaEstoquesComponentescoluna.AsString);
end;

function TdtmConsultaEstoque.GetLinhadaGradeComponente: String;
begin
  result := PrimeiraLetraEmMaiuscula(qryConsultaEstoquesComponenteslinha.AsString);
end;

function TdtmConsultaEstoque.GetCodigoNotaProduto: int64;
begin
  result := 2147483647;
end;

function TdtmConsultaEstoque.GetProduto: String;
begin
  result := dsrConsultaEstoques.dataSet.FieldByName('produto').asString;
end;

function TdtmConsultaEstoque.GetProdutoGrade: String;
begin
  result := ItemProdutoGrade(dsrConsultaEstoques.dataSet.FieldByName('caracteristica').asString,
                             qryGrade.Fields[0].asString,
                             NomeCampoColunaselecionadoGrade);
end;


procedure TdtmConsultaEstoque.AbrirConsulteEstoque;
var
 vProduto : String;
begin
  if NomeCampoColunaselecionadoGrade <> '' then
  begin
    vproduto :=  ItemProdutoGrade(dsrConsultaEstoques.dataSet.FieldByName('caracteristica').asString,
                               qrygrade.fieldbyname(qryGrade.Fields[0].fieldname).asString,
                               NomeCampoColunaselecionadoGrade);
    if vProduto = '' then
      vProduto := '0';                           

    if (qryEstoque.ParamByName('produto').asString <> vProduto)  then
    begin

      qryEstoque.ParamByName('produto').asString := vProduto;

      if ParSistema.SoVisualizarEstoqueDeposito then
       qryEstoque.Sql[4] := SQLEstoquesDeposito
      else
       qryEstoque.Sql[4] := '';

      qryEstoque.close;
      qryEstoque.open;
    end;  
  end;
end;

procedure TdtmConsultaEstoque.qryEstoquefilialGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
;
end;

procedure TdtmConsultaEstoque.qryGradeAfterScroll(DataSet: TDataSet);
begin
  inherited;
  AbrirConsulteEstoque;
end;

procedure TdtmConsultaEstoque.SetListaCondicaoPromocoes(
  const Value: String);
begin
  fListaCondicaoPromocoes := Value;
  if (Value <> '') then qryConsultaEstoques.MacroByName('Promocoes').AsString := 'and (' + Value + ')'
  else                  qryConsultaEstoques.MacroByName('Promocoes').AsString  := '';

end;

procedure TdtmConsultaEstoque.SetListaCondicaoMarcas(const Value: String);
begin
  FListaCondicaoMarcas := Value;
//  fListaCondicaoPromocoes := Value;
  if (Value <> '') then qryConsultaEstoques.MacroByName('Marcas').AsString := 'and (' + Value + ')'
  else                  qryConsultaEstoques.MacroByName('Marcas').AsString  := '';

end;

procedure TdtmConsultaEstoque.qryConsultaEstoquesAfterPost(
  DataSet: TDataSet);
begin
  inherited;
//  qryAtualizarEstoque.ParamByName('localizacao').asString := qryConsultaEstoqueslocalizacao.asString;

  if qryConsultaEstoquesmaximo.isnull then
    qryAtualizarEstoque.ParamByName('maximo').Clear
  else
    qryAtualizarEstoque.ParamByName('maximo').asCurrency := qryConsultaEstoquesmaximo.asCurrency;

  if qryConsultaEstoquesminimo.isnull then
    qryAtualizarEstoque.ParamByName('minimo').Clear
  else
    qryAtualizarEstoque.ParamByName('minimo').asCurrency := qryConsultaEstoquesminimo.asCurrency;

  qryAtualizarEstoque.ParamByName('produto').asString := qryConsultaEstoquesproduto.AsString;
  qryAtualizarEstoque.ParamByName('filial').AsInteger := qryConsultaEstoquesfilial.Asinteger;

  qryAtualizarEstoque.ExecSql;
  perpetrar([qryAtualizarEstoque]);


end;

procedure TdtmConsultaEstoque.qryConsultaEstoquesSimilaresAfterPost(
  DataSet: TDataSet);
begin
  inherited;
//  qryAtualizarEstoque.ParamByName('localizacao').asString := qryConsultaEstoquesSimilareslocalizacao.asString;

  if qryConsultaEstoquesSimilaresmaximo.isnull then
    qryAtualizarEstoque.ParamByName('maximo').Clear
  else
    qryAtualizarEstoque.ParamByName('maximo').asCurrency := qryConsultaEstoquesSimilaresmaximo.asCurrency;

  if qryConsultaEstoquesSimilaresminimo.isnull then
    qryAtualizarEstoque.ParamByName('minimo').Clear
  else
    qryAtualizarEstoque.ParamByName('minimo').asCurrency := qryConsultaEstoquesSimilaresminimo.asCurrency;

  qryAtualizarEstoque.ParamByName('produto').asString := qryConsultaEstoquesSimilaresproduto.AsString;
  qryAtualizarEstoque.ParamByName('filial').AsInteger := qryConsultaEstoquesSimilaresfilial.Asinteger;

  qryAtualizarEstoque.ExecSql;
  perpetrar([qryAtualizarEstoque]);

end;


procedure TdtmConsultaEstoque.SetListaCondicaoModelos(const Value: String);
begin
  FListaCondicaoModelos := Value;
  if (Value <> '') then
    qryConsultaEstoques.MacroByName('Modelos').AsString :=

    'and c.codigo in ( select mc.caracteristica                  '+
    '                  from modeloscaracteristicas mc            '+
    '                  where mc.modelo in (select mo.codigo      '+
    '                                      from modelos mo       '+
    '                                      where true            '+
    '                                        and (' + Value + '))) '

  else
    qryConsultaEstoques.MacroByName('Modelos').AsString := '';

end;

function TdtmConsultaEstoque.GetTipoConsultaProduto: TipoProduto;
begin
  Result := fTipoConsultaProduto;
end;

procedure TdtmConsultaEstoque.DataModuleCreate(Sender: TObject);
begin
  inherited;
  RemoveDataModule(Self);
end;

procedure TdtmConsultaEstoque.SetListaCondicaoLocalizacaoEstoque(
  const Value: String);
begin
  fListaCondicaoLocalizacaoEstoque := Value;

  if (Value <> '') then qryConsultaEstoques.MacroByName('LocalizacaoEstoque').AsString :=

    'and ( '+ Value + ') '

  else
    qryConsultaEstoques.MacroByName('LocalizacaoEstoque').AsString := '';

end;

procedure TdtmConsultaEstoque.qryConsultaEstoquescomissao_grupoGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  inherited;
  if qryConsultaEstoquescomissao_grupo.asCurrency <> 0 then
  begin
    if qryConsultaEstoquestipocomissao_grupo.asString = 'V' then
      Text := qryConsultaEstoquescomissao_grupo.asString + ' V'
    else
      Text := qryConsultaEstoquescomissao_grupo.asString + ' P'
  end;
end;

procedure TdtmConsultaEstoque.qryConsultaEstoquescomissao_produtoGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  inherited;
  if qryConsultaEstoquescomissao_produto.asCurrency <> 0 then
  begin
    if qryConsultaEstoquestipocomissao_produto.asString = 'V' then
      Text := qryConsultaEstoquescomissao_produto.asString + ' V'
    else
      Text := qryConsultaEstoquescomissao_produto.asString + ' P'
  end;

end;

procedure TdtmConsultaEstoque.SetListaCondicaoEspecificacoes(
  const Value: String);
begin
  FListaCondicaoEspecificacoes := Value;

  if (Value <> '') then
    qryConsultaEstoques.MacroByName('Especificacoes').AsString :=

    'and c.codigo in ( select mc.caracteristica                  '+
    '                  from modeloscaracteristicas mc            '+
    '                  where mc.modelo in (select mo.codigo      '+
    '                                      from modelos mo       '+
    '                                      where true            '+
    '                                        and (' + Value + '))) '

  else
    qryConsultaEstoques.MacroByName('Especificacoes').AsString := '';

end;

procedure TdtmConsultaEstoque.qryConsultaEstoquesBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaEstoques.ParamByName('datahora').asDateTime := DataHoraServidor;
  qryConsultaEstoques.ParamByName('filialbase').asInteger := filialbase;
  qryConsultaEstoques.ParamByName('usuario_logado').asInteger := usuariologin.CodigoUsuario;
end;

procedure TdtmConsultaEstoque.AbrirTabelaProdutosLotes;
begin
  if not qryConsultaEstoques.IsEmpty then
    RefazConsultaPorNome(qryConsultaEstoquesLotes,['produto'],
                                                      [qryConsultaEstoquesproduto.AsLargeInt]);

end;

procedure TdtmConsultaEstoque.qryConsultaEstoquesLotesBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaEstoquesLotes.ParamByName('filialbase').asInteger := filialbase;
  qryConsultaEstoquesLotes.ParamByName('arredondamento').AsBoolean := Assigned(EcfPadrao) and EcfPadrao.Arredonda;


end;

procedure TdtmConsultaEstoque.qryConsultaEstoquesLotesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaEstoquesLotespeso.Visible := ParSistema.LiberarVisualizacaoPesoProdutonasPesquisas;
end;

procedure TdtmConsultaEstoque.qryConsultaEstoquesLotesAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  AbrirTabelasEstoque;
  AbrirTabelasAcumuladores(false);

  RefazConsultaPorNome(qryPrecos,['caracteristica','preco','filial','colunanormal','colunapromocao'],
                                          [qryConsultaEstoquesLotescaracteristica.AsLargeInt,
                                           qryConsultaEstoquesLotespreco.AsInteger,
                                           qryConsultaEstoquesLotesfilial.AsInteger,
                                           qryConsultaEstoquesLotespreconormal.AsInteger,
                                           qryConsultaEstoquesLotesprecopromocao.AsInteger]);
  RefazConsultaPorNome(qryProdutosPedidos,['produto','filial'],
                                                   [qryConsultaEstoquesLotesproduto.AsLargeInt,
                                                    qryConsultaEstoquesLotesfilial.AsInteger]);

  if (qryPrecosvalidade.AsDateTime < DataServidor) then
  begin
    qryPrecosvalorpromocao.Clear;
    qryPrecosvalidade.Clear;
  end;
  if Assigned(OnScrollLinhaColunaGradeLotes) then
    OnScrollLinhaColunaGradeLotes(qryConsultaEstoquesLotes);

  qryConsultaEstoquesLoteslocalizacao.ReadOnly := not UsuarioLogin.GerenteEstoque;
  qryConsultaEstoquesLotesmaximo.ReadOnly := not UsuarioLogin.GerenteEstoque;
  qryConsultaEstoquesLotesminimo.ReadOnly := not UsuarioLogin.GerenteEstoque;

end;

procedure TdtmConsultaEstoque.SetListaCondicionalLotesProdutos(const Value: String);
begin
  fListaCondicionalLotesProdutos := Value;

  if (Value <> '') then
  begin
    qryConsultaEstoques.MacroByName('LotesProdutos').AsString :=

    'and p.codigo in ( select l.produto '+
    '                  from lotes l '+
    '                  where (' + Value + ')) ';

    qryConsultaEstoquesLotes.MacroByName('LotesProdutos').AsString :=

    'and e.lote in ( select l.lote '+
    '                  from lotes l '+
    '                  where (' + Value + ')) ';


  end
  else
  begin
    qryConsultaEstoques.MacroByName('LotesProdutos').AsString := '';
    qryConsultaEstoquesLotes.MacroByName('LotesProdutos').AsString := '';
  end;

end;

procedure TdtmConsultaEstoque.Abrir_Produtos_Atributos;
begin
  RefazConsultaPorNome(qryProdutos_Atributos, ['produto'], [qryConsultaEstoquesproduto.asLargeint], true);
end;


procedure TdtmConsultaEstoque.SetListaCondicionalAtributos(
  const Value: String);

begin
  fListaCondicionalAtributos := Value;

  if (Value <> '') then
  begin
    qryConsultaEstoques.MacroByName('Atributos').AsString :=

    'and (' + Value + ') ';

    qryConsultaEstoquesLotes.MacroByName('Atributos').AsString :=

    'and (' + Value + ') ';


  end
  else
  begin
    qryConsultaEstoques.MacroByName('Atributos').AsString := '';
    qryConsultaEstoquesLotes.MacroByName('Atributos').AsString := '';
  end;
end;  


procedure TdtmConsultaEstoque.qryLicitacoesporProdutosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryLicitacoesporProdutosTotalSaldoPendente.asCurrency :=
    qryLicitacoesporProdutossaldopendente.asFloat *
    qryLicitacoesporProdutospreco.asCurrency;

end;

procedure TdtmConsultaEstoque.qryLicitacoesporProdutosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TfrmConsultaEstoque(Self.owner).CalcularTotaisLicitacoesporProdutos;
end;

end.

