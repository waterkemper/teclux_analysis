unit rgestoque;

interface

Uses
  //CLX
  classes;

implementation

Uses
  fmcadastroprodutos, fmconsultafichaproduto, fmcadastroestoque, fmconsultaestoque, {fmmanutencaopreco,}
  fmcadastrotabelasestoque, fmconsultapedidos, fmconsultareservas,
  fmconsultaentrada, fmcadastrocaracteristicas, {fmcadastrofornecedores,} fmlancamentosmanuais,
  {fmcadastropedidos,} fmlista, fmtiposmovimentosestoque, fmcadastronotasfiscais, fmemissaoetiquetas,
  fmemissaonotassaidaavulsas, fmtransferenciaautomatica, fmcancelamentopedidos,
  fmrelatoriomovimentacaodiaria, fmrelatoriosugestaocompra, fmcadastrogerarprodutos,
  fmrelatorioestoque, fmprodutosfornecedor, fmcadastromercadoriasanuncio,
  fmrelatorionotasentrada, fmrelatoriocurvaabc, {fmconsultacompras,} fmrelatorioicmsstarecolher,
  fmemissaonotasacrescimofinanceiro, fmcadastroinventario, fmemissaonotacomplementar,
  fmcontrolenotasfiscaiseletronicas, fmdevolucaofornecedores, fmexportacaoprodutos, fmimportacaoprodutos,
  fmrelatorioestoqueicmsstarecolher, fmrelatorioprodutosconferidos, fmControleESNF,
  fmControleEmissaodeEtiquetas, fmAnaliseEconomicaCompras, fmControleLocalizacoes,
  fmAnaliseestoques, fmAlteracoesPrecos, fmVerificacaoReservas, fmnfeentradasefaz,
  fmManutencaoProdutos, fmConsultaProgramacaoEntregaNfe;

initialization
  RegisterClasses([TfrmCadastroCaracteristicas,TfrmConsultaReservas, TfrmConsultaFichaProduto,
                   TfrmLancamentosManuais, Tfrmcadastroestoque, Tfrmcadastrotabelasestoque,
                   Tfrmconsultaestoque, {TfrmManutencaoPreco,} TfrmConsultaPedidos,
                   TfrmCadastroNotasFiscais,
                   {Tfrmcadastrofornecedores,} TfrmConsultaEntradas,
                   TfrmLancamentosManuais,{ Tfrmcadastropedidos,} TfrmListaPrecos, {TfrmConsultaEstoque,}
                   {TfrmCadastroFornecedores,} TfrmEmissaoEtiquetas,
                   TfrmTiposMovimentosDoEstoque, TfrmEmissaoNotasSaidaAvulsas, TfrmTransferenciaAutomatica,
                   TfrmCancelamentoPedidos, TfrmRelatorioMovimentacaoDiaria,
                   TfrmRelatorioSugestaoCompra, TfrmCadastroGerarProdutos,
                   TfrmRelatorioEstoque, TfrmProdutosFornecedor, Tfrmrelatorioicmsstarecolher,
                   TfrmCadastroMercadoriasAnuncio, TfrmRelatorioNotasEntrada,
                   TfrmRelatorioCurvaABC, {TfrmconsultaCompras,}
                   TfrmEmissaoNotasAcrescimoFinanceiro, TfrmCadastroInventario,
                   TfrmEmissaoNotaComplementar, TfrmControleNotasFiscaisEletronicas,
                   TfrmDevolucaoFornecedores, TfrmExportacaoProdutos, TfrmImportacaoProdutos,
                   Tfrmrelatorioestoqueicmsstarecolher, TfrmRelatorioProdutosConferidos,
                   TfrmControleESNF, TfrmControleEmissaodeEtiquetas,
                   TfrmAnaliseEconomicaCompras, TfrmControleLocalizacoes,
                   TfrmAnaliseestoques, TfrmAlteracoesPrecos,
                   TfrmVerificacaoReservas, TfrmNFeEntradaSefaz,
                   TfrmManutencaoProdutos, TfrmConsultaProgramacaoEntregaNfe]);
end.
