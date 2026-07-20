unit fmparametrossistema;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  Buttons, Grids, DBGrids, {Qete,} ComCtrls, DBCtrls, Mask,
  //Terceiros
  ZQuery,
  //Repositorio
  fmajuda, fmnavcontroles, fmconsultabasica,
  //Biblio
  ctconstantes, clparametrossistema, biblio,
  //Componentes
  cpdbgrid, cptexto, cppagecontrol, cpdbradiogroup, cpdbtext, cpdbfindcontrols,
  cpnumero, cpdata, DB, ZPgSqlQuery, cpquery, cpeditioncontrolvalidation,
  cpdbcombobox, QMonthCalendar, frconsulta, frconsultacodigo;

type
  TfrmParametrosSistema = class(TfrmNavControles)
    pnlFundoJanela: TPanel;
    pnlFiliais: TPanel;
    pnlParametros: TPanel;
    tblBarra: TToolBar;
    sbnSalvar: TSpeedButton;
    sbnAjuda: TSpeedButton;
    tbnDivisor: TToolButton;
    rgpParametro: TRadioGroup;
    rbnGlobal: TtecRadioButton;
    rbnFilial: TtecRadioButton;
    sbnExcluir: TSpeedButton;
    pgcParametros: TtecPageControl;
    tstCaixa: TTabSheet;
    tstVenda: TTabSheet;
    tstCobranca: TTabSheet;
    tstGeral: TTabSheet;
    gbxRenegociacao: TGroupBox;
    ckbPermiteReducaoDivida: TCheckBox;
    ckbCobrarMultasJuros: TCheckBox;
    edtTaxaJuros: TEditNumero;
    edtAtrasoMinimo: TEditNumero;
    lblTaxaJuros: TLabel;
    lblAtrasoMinimo: TLabel;
    gbxPagamentosAtraso: TGroupBox;
    lblDiasAtrasoMulta1: TLabel;
    lblDiasAtrasoJuros1: TLabel;
    edtDiasAtraso1: TEditNumero;
    edtDiasAtraso2: TEditNumero;
    gbxSPC: TGroupBox;
    ckbRegistraAvalistaNoSPC: TCheckBox;
    ckbConfirmaRecebimentoAvisoSPC: TCheckBox;
    tstGIA: TTabSheet;
    gbxGIA: TGroupBox;
    lblNumeroProcessoAutorizacaoPresumido: TLabel;
    edtNroProcAutPresumido: TEditTexto;
    edtNomeContador: TEditTexto;
    lblNomeContador: TLabel;
    lblCrcContador: TLabel;
    lblDDDContador: TLabel;
    lblFoneContador: TLabel;
    lblEmailContador: TLabel;
    edtCRCContador: TEditTexto;
    edtEmailContador: TEdit;
    edtDDDContador: TEditNumero;
    edtFoneContador: TEditNumero;
    tstInternet: TTabSheet;
    gbxInternet: TGroupBox;
    lblEnderecoLogotipo: TLabel;
    edtEnderecoLogotipo: TEdit;
    lblSiteEmpresa: TLabel;
    edtSiteEmpresa: TEdit;
    edtDataInicialSaldoAcumulado: TEditData;
    dbgFiliais: TtecDBGrid;
    dlgPastaImagem: TOpenDialog;
    dlgExecTEF: TOpenDialog;
    lblRegistrodiasSPC: TLabel;
    edtRegistrodiasSPC: TEditNumero;
    lbldiasNovaInscricao: TLabel;
    edtdiasNovaInscricao: TEditNumero;
    gbxCartas: TGroupBox;
    ckbVaiCartasefoiAnterior: TCheckBox;
    lblDias: TLabel;
    lblPercentagem: TLabel;
    lblMaximoParcelas: TLabel;
    edtMaximoParcelas: TEditNumero;
    lblVencimentoPrimeiraParcela: TLabel;
    edtVencimentoPrimeiraParcela: TEditNumero;
    lblDias2: TLabel;
    lblDias3: TLabel;
    lblPercentagem2: TLabel;
    edtPercAtrasoMulta1: TEditNumero;
    lblPercentagem3: TLabel;
    edtPercAtrasoMulta2: TEditNumero;
    lblMultas: TLabel;
    lblPercentagem4: TLabel;
    edtPercAtrasoJuros1: TEditNumero;
    lblPercentagem5: TLabel;
    edtPercAtrasoJuros2: TEditNumero;
    lblDias5: TLabel;
    lblJuros: TLabel;
    gbxDesconto: TGroupBox;
    lblDescontoPagAntecipado: TLabel;
    edtDescontoPagAntecipado: TEditNumero;
    gbxMeta: TGroupBox;
    lblTetoMetaCobranca: TLabel;
    edtTetoMetaCobranca: TEditNumero;
    lblPercentagem6: TLabel;
    lblMultas1: TLabel;
    lblJuros1: TLabel;
    ckbInscreverSPCCartasDevolvidas: TCheckBox;
    ckbSPCCentralizado: TCheckBox;
    lblMaximoAtraso: TLabel;
    edtMaximoATraso: TEditNumero;
    ckbRetiraSPCRenegociados: TCheckBox;
    gbxResponsavelLivros: TGroupBox;
    edtResponsavelLivros1: TEdit;
    edtResponsavelLivros2: TEdit;
    rgpFormaLivros: TRadioGroup;
    lblcpfContador: TLabel;
    edtCPFContador: TEditTexto;
    ColorDlg: TColorDialog;
    stsFCaixa: TTabSheet;
    tecPageControl1: TtecPageControl;
    stsFCaixaPgto: TTabSheet;
    tecPageControl2: TtecPageControl;
    tstFCaixaPgtoCheque: TTabSheet;
    ckbNaoInformaDadosChequeFrenteCaixa: TCheckBox;
    tstFCaixaVendedor: TTabSheet;
    ckbFrenteCaixaVendedor: TCheckBox;
    ckbObrigaVendedorFrenteCaixa: TCheckBox;
    ckbSugerirUsuarioComoVendedorFrenteCaixa: TCheckBox;
    stsFCaixaCliente: TTabSheet;
    ckbFrenteCaixaCliente: TCheckBox;
    tstFCaixaLancamentoProdutos: TTabSheet;
    lblQtdadeMaxFrenteCaixa: TLabel;
    edtQtdadeMaxFrenteCaixa: TEditNumero;
    tstFCaixaPgtoDesconto: TTabSheet;
    lblPercentualDescontoFrenteCaixa: TLabel;
    edtPercentualDescontoFrenteCaixa: TEditNumero;
    Label1: TLabel;
    ckbMensagemInformarDadosCheque: TCheckBox;
    tecEdtCtrlVldFCaixaPgtoCheque: TtecEditionControlValidation;
    tecEdtCtrlVldFCaixaVendedor: TtecEditionControlValidation;
    tecPageControl3: TtecPageControl;
    Autenticacoes: TTabSheet;
    rgpAutenticadoras: TRadioGroup;
    gbxTEF: TGroupBox;
    pgcTipoTEF: TPageControl;
    tstTEFDedicado: TTabSheet;
    lblLojaTEF: TLabel;
    lblIPTEF: TLabel;
    lblMensagemTEF: TLabel;
    edtLojaTEF: TEditTexto;
    edtIPTEF: TEditTexto;
    edtMensagemTEF: TEditTexto;
    edtTerminalTEF: TEditTexto;
    lblTerminalTEF: TLabel;
    tstTEFDiscado: TTabSheet;
    sbnTEFReq: TSpeedButton;
    sbnTEFResp: TSpeedButton;
    sbnTEFExec: TSpeedButton;
    lblTEFRequisicao: TLabel;
    lblTEFResposta: TLabel;
    lblTEFPrograma: TLabel;
    lblTEFArqRequisicao: TLabel;
    lblTEFArqResposta: TLabel;
    lblTEFArqPrograma: TLabel;
    lblNroViasTEF: TLabel;
    edtNroViasTEF: TEditNumero;
    tstTEFNenhum: TTabSheet;
    rgpTipoTEF: TtecDBRadioGroup;
    rbnDedicado: TtecRadioButton;
    rbnDiscado: TtecRadioButton;
    rbnSemTEF: TtecRadioButton;
    FechamentoCaixa: TTabSheet;
    ckbCancelamentos: TCheckBox;
    ckbChequePrazo: TCheckBox;
    ckbChequeVista: TCheckBox;
    ckbDepositos: TCheckBox;
    ckbDevolucoes: TCheckBox;
    ckbDocumentos: TCheckBox;
    ckbDuplicatas: TCheckBox;
    ckbPerdas: TCheckBox;
    ckbImprimirNFSFrenteCaixa: TCheckBox;
    ckbResgateCheques: TCheckBox;
    ckbRecebimentos: TCheckBox;
    ckbResumo: TCheckBox;
    ckbTransferencias: TCheckBox;
    ckbSaldoCaixaNegativo: TCheckBox;
    ckbVisualizarfechamentocaixa: TCheckBox;
    gbxDevolucoes: TGroupBox;
    ckbExigeSenhaGerenteDevolucao: TCheckBox;
    ckbExigeSenhaChefeCreditoDevolucao: TCheckBox;
    gbxParcelas: TGroupBox;
    ckbExigeSenhaDescontoParcela: TCheckBox;
    ckbMostraSaldoPagarRecibo: TCheckBox;
    ckbPermitirAlterarPagtoCaixa: TCheckBox;
    ckbImprimirReciboAcumulado: TCheckBox;
    tstRetencoes: TTabSheet;
    gbxServicos: TGroupBox;
    ckbDevolucoesTroca: TCheckBox;
    ckbAutenticacaoParcelasModo2: TCheckBox;
    tstBancos: TTabSheet;
    ckbInscreverpessoajuridicaSPC: TCheckBox;
    tstFidelidade: TTabSheet;
    gbxFidelidade: TGroupBox;
    gbxBonusValorCompra: TGroupBox;
    dbgBonusValorCompra: TtecDBGrid;
    sbnExcluirValorCompra: TSpeedButton;
    gbxBonusPagamentoDia: TGroupBox;
    edtBonusPagamentoEmDia: TEditNumero;
    lblBonusPagamentoEmDia: TLabel;
    edtValidadeBonus: TEditNumero;
    lblValidadeBonus: TLabel;
    tstFrenteCaixaGeral: TTabSheet;
    gbxFrenteCaixaGeral: TGroupBox;
    ckbExibirTelaCalculoTroco: TCheckBox;
    ckbInformarParcelaQuitar: TCheckBox;
    lblAssinatura1: TLabel;
    edtAssinatura1: TEditTexto;
    lblAssinatura2: TLabel;
    edtAssinatura2: TEditTexto;
    lblAssinatura3: TLabel;
    edtAssinatura3: TEditTexto;
    lblNumeroCopias: TLabel;
    EdtNumeroCopias: TEditNumero;
    lblArredondamentoJuros: TLabel;
    edtArredondamentoJuros: TEditNumero;
    Label2: TLabel;
    edtValorMaxDescAlteracaoParcela: TEditNumero;
    edtTotalizadorAutenticacao: TEditTexto;
    lblTotalizadorAutenticacao: TLabel;
    pgcVendas: TPageControl;
    tstVendasGeral: TTabSheet;
    tstvendasOutros: TTabSheet;
    gbxVendas: TGroupBox;
    sbnPlanos: TSpeedButton;
    sbnPlanoOrcamentoPadrao: TSpeedButton;
    edtValidadeReserva: TEditNumero;
    ckbUtilizarJurosSimples: TCheckBox;
    ckbCalculoTodosPlanos: TCheckBox;
    ckbPermiteAlterarPreco: TCheckBox;
    ckbExigeAnalistaCredito: TCheckBox;
    ckbPermiteAvalista: TCheckBox;
    lblValidadeReserva: TLabel;
    lblNotaFiscalVinculada: TLabel;
    cmbNotaFiscalVinculada: TComboBox;
    edtTetoMetaVendas: TEditNumero;
    lblTetoMetaVendas: TLabel;
    ckbFaturarAlteraParcelas: TCheckBox;
    lblPlano: TLabel;
    edfPlanos: TtecDbEditFind;
    dtxPlanos: TtecDBText;
    lblHs: TLabel;
    ckbUtilizarListaCasamento: TCheckBox;
    ckbFaturarVendaVista: TCheckBox;
    ckbUtilizarPrecodaFilialBase: TCheckBox;
    ckbSoVisualizarEstoqueDeposito: TCheckBox;
    lblPlanoOrcamentoPadrao: TLabel;
    edfPlanoOrcamentoPadrao: TtecDbEditFind;
    dtxPlanoOrcamentoPadrao: TtecDBText;
    ckbIncluirContratoTrocaEquivalente: TCheckBox;
    ckbUtilizarCreditoTrocaContrato: TCheckBox;
    gbxMostrarFichaFinanceira: TGroupBox;
    ckbMostrarFichaSomenteAtraso: TCheckBox;
    ckbPerguntarAntesDeExibir: TCheckBox;
    ckbPesquisaSomenteEstoqueFilialBaseVendas: TCheckBox;
    ckbMostrarSimilaresContrato: TCheckBox;
    ckbGravarProdutoAutomaticamente: TCheckBox;
    cmbOperacoesOrcamentos: TComboBox;
    cmbOperacoesContratos: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    lblValordaQuantidade: TLabel;
    edtValorQuantidade: TEditNumero;
    ckbObservacoesAoGravar: TCheckBox;
    ckbTotalizarBaseComissoes: TCheckBox;
    ckbContratoComServico: TCheckBox;
    ckbUtilizarFidelidade: TCheckBox;
    gbxAnexosContrato: TGroupBox;
    ckbAnexoContratoReceitaOculos: TCheckBox;
    tstContabil: TTabSheet;
    gbxContabilidade: TGroupBox;
    tstVendasImpressao: TTabSheet;
    ckbImprimirContratoMatricial: TCheckBox;
    ckbImprimirTaxasJuros: TCheckBox;
    ckbImprimirContratoSimples: TCheckBox;
    ckbImpCarneVendaVista: TCheckBox;
    ckbImprimirCarneFaturar: TCheckBox;
    sbnProcuraModeloCarne: TSpeedButton;
    sbnProcuraModeloBoleto: TSpeedButton;
    sbnModeloContratoMatricial: TSpeedButton;
    lnlModeloCarne: TLabel;
    edfModeloCarne: TtecDbEditFind;
    dtxModeloCarne: TtecDBText;
    lblModeloBoleto: TLabel;
    edfModeloBoleto: TtecDbEditFind;
    dtxModeloBoleto: TtecDBText;
    lblModeloContratoMatricial: TLabel;
    edfModeloContratoMatricial: TtecDbEditFind;
    gbxCancelamentoCaixa: TGroupBox;
    ckbSolicitarAutorizacaoCancelamentoCaixa: TCheckBox;
    gbxAutorizacaoVendas: TGroupBox;
    ckbSolicitarAutorizacaoCancelarContratoFaturado: TCheckBox;
    ckbSolicitarAutorizacaoVendaFutura: TCheckBox;
    edfConta: TtecDbEditFind;
    dtxDigito: TtecDBText;
    sbnProcurarConta: TSpeedButton;
    lblContaCobranca: TLabel;
    dtxModeloContratoMatricial: TtecDBText;
    dtxSigla: TtecDBText;
    dtxAgencia: TtecDBText;
    lblLimiteDias: TLabel;
    edtLimiteDias: TEditNumero;
    Label6: TLabel;
    cmbOperacoesNotaAvulsa: TComboBox;
    pgcBancos: TPageControl;
    tstParametros: TTabSheet;
    tstCalendario: TTabSheet;
    grpPeriodoLanctos: TGroupBox;
    gbxBancoDataInicial: TGroupBox;
    edtBancoDataInicial: TEditData;
    gbxBancoDataFinal: TGroupBox;
    edtBancoDataFinal: TEditData;
    gbxInicioIntegracao: TGroupBox;
    MonthCalendar1: TMonthCalendar;
    gbxNdiasparaLiberacaoCobranca: TGroupBox;
    lblNdiasparaLiberacaoCobranca: TLabel;
    edtNdiasparaLiberacaoCobranca: TEditNumero;
    ckbClientesComPlanoPadrao: TCheckBox;
    Entradas: TGroupBox;
    dbgVenctosImpostosRetidosEntradas: TtecDBGrid;
    gbxRetencoesSaidas: TGroupBox;
    dbgImpostosRetidos: TtecDBGrid;
    ckbCFPSOBRIGATORIO: TCheckBox;
    sbnExcluirImpostoRetido: TSpeedButton;
    gbxFornecedor: TGroupBox;
    fraConsultaFornecedor: TfraConsultaCodigo;
    PageControl1: TPageControl;
    tstPadraodeContabilizacao: TTabSheet;
    tstContasEntradas: TTabSheet;
    gbxParametroSelecaoPadrao: TGroupBox;
    cmbParametroPadraoConta: TComboBox;
    pgcContasContabeis: TPageControl;
    tstaVista: TTabSheet;
    gbxDebitarVendaaVista: TGroupBox;
    sbnConsultaDebitarVendaVista: TSpeedButton;
    dtxDebitarDescricaoVendaVista: TtecDBText;
    dtxDebitarClassificacaoVendaVista: TtecDBText;
    flkDebitarVendaaVista: TtecDBFindLookup;
    gbxCreditarVendaVista: TGroupBox;
    sbnConsultaCreditarVendaVista: TSpeedButton;
    dtxCreditarDescricaoVendaVista: TtecDBText;
    flkCreditarVendaVista: TtecDBFindLookup;
    dtxCreditarClassificacaoVendaVista: TtecDBText;
    gbxHistoricoVendaaVista: TGroupBox;
    sbnConsultaHistoricoVendaaVista: TSpeedButton;
    dtxHistoricoVendaaVista: TtecDBText;
    flkHistoricoVendaaVista: TtecDBFindLookup;
    tstVendaaPrazo: TTabSheet;
    gbxDebitarVendaaPrazo: TGroupBox;
    sbnConsultaDebitarVendaPrazo: TSpeedButton;
    dtxDebitarDescricaoVendaPrazo: TtecDBText;
    flkDebitarVendaaPrazo: TtecDBFindLookup;
    dtxDebitarClassificacaoVendaPrazo: TtecDBText;
    gbxCreditarVendaPrazo: TGroupBox;
    sbnConsultaCreditarVendaPrazo: TSpeedButton;
    dtxCreditarDescricaoVendaPrazo: TtecDBText;
    flkCreditarVendaPrazo: TtecDBFindLookup;
    dtxCreditarClassificacaoVendaPrazo: TtecDBText;
    gbxHistoricoVendaaPrazo: TGroupBox;
    sbnConsultaHistoricoVendaaPrazo: TSpeedButton;
    dtxHistoricoVendaaPrazo: TtecDBText;
    flkHistoricoVendaaPrazo: TtecDBFindLookup;
    tstAbatimentos: TTabSheet;
    gbxDebitarAbatimentos: TGroupBox;
    sbnConsultaDebitarAbatimentos: TSpeedButton;
    dtxDebitarDescricaoAbatimentos: TtecDBText;
    flkDebitarAbatimentos: TtecDBFindLookup;
    dtxDebitarClassificacaoAbatimentos: TtecDBText;
    gbxCreditarAbatimentos: TGroupBox;
    sbnConsultaCreditarAbatimentos: TSpeedButton;
    dtxCreditarDescricaoAbatimentos: TtecDBText;
    flkCreditarAbatimentos: TtecDBFindLookup;
    dtxCreditarClassificacaoAbatimentos: TtecDBText;
    gbxHistoricoAbatimentos: TGroupBox;
    sbnConsultaHistoricoAbatimentos: TSpeedButton;
    dtxHistoricoAbatimentos: TtecDBText;
    flkHistoricoAbatimentos: TtecDBFindLookup;
    tstDevolucoes: TTabSheet;
    gbxDebitarDevolucoes: TGroupBox;
    sbnConsultaDebitarDevolucoes: TSpeedButton;
    dtxDebitarDescricaoDevolucoes: TtecDBText;
    flkDebitarDevolucoes: TtecDBFindLookup;
    dtxDebitarClassificacaoDevolucoes: TtecDBText;
    gbxCreditarDevolucoes: TGroupBox;
    sbnConsultaCreditarDevolucoes: TSpeedButton;
    dtxCreditarDescricaoDevolucoes: TtecDBText;
    flkCreditarDevolucoes: TtecDBFindLookup;
    dtxCreditarClassificacaoDevolucoes: TtecDBText;
    gbxHistoricoDevolucoes: TGroupBox;
    sbnConsultaHistoricoDevolucoes: TSpeedButton;
    dtxHistoricoDevolucoes: TtecDBText;
    flkHistoricoDevolucoes: TtecDBFindLookup;
    rgpTipoSugestao: TRadioGroup;
    ckbPermitirGravarDocumentossemLancamentos: TCheckBox;
    tstContasSaidas: TTabSheet;
    dbgEntradas: TtecDBGrid;
    dbgSaidas: TtecDBGrid;
    pnlGeracaoAutomaticadoImpostoRetido: TPanel;
    ckbGeracaoAutomaticadoImpostoRetido: TCheckBox;
    Bevel1: TBevel;
    pnlMascaraContas: TPanel;
    lblExercicioAtual: TLabel;
    edtExercicioAtualContabilidade: TEditNumero;
    gbxMascaraContas: TGroupBox;
    dbgMascaraContas: TtecDBGrid;
    edtInicioIntegracaoBancos: TEditData;
    ckbPermitirAlterarBrindenoContrato: TCheckBox;
    gbxSeparador: TGroupBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    gbxMascaraBancos: TGroupBox;
    dbgMascaraBancos: TtecDBGrid;
    ckbMarcarProdutosParaEntregaContrato: TCheckBox;
    ckbContabilizacaoporRegimedeCaixa: TCheckBox;
    Bevel2: TBevel;
    pgcGeral: TtecPageControl;
    tstGeral2: TTabSheet;
    tstOutrosGeral: TTabSheet;
    gbxGeral: TGroupBox;
    cmbMascaraQuantidade: TComboBox;
    edtSalarioReferencia: TEditNumero;
    edtDataContabil: TEditData;
    lblSalarioReferencia: TLabel;
    lblDataContabil: TLabel;
    edtAgencia: TEditNumero;
    lblAgencia: TLabel;
    ckbClientePessoaJuridica: TCheckBox;
    ckbCreditarICMS: TCheckBox;
    edtDiasCreditarICMS: TEditNumero;
    ckbIncluirEstoqueAutomatico: TCheckBox;
    ckbControlarSomente2Devolucao: TCheckBox;
    ckbLeitoraChequePortaSerial: TCheckBox;
    ckbExibirAtrasoMedioParcelas: TCheckBox;
    ckbCPFCNPJObrigatorio: TCheckBox;
    ckbExibirDescontoSugerido: TCheckBox;
    ckbFilialIndependente: TCheckBox;
    ckbReplicarFornecedores: TCheckBox;
    lblDiasValidadeOrcamento: TLabel;
    edtDiasValidadeOrcamento: TEditNumero;
    ckbUsarConsultaInterativa: TCheckBox;
    ckbAbrirConsultaAutomaticamente: TCheckBox;
    ckbClienteComDependentes: TCheckBox;
    ckbMostrarSomenteContratosEmAbertoFicha: TCheckBox;
    ckbRequisicaoSubtraiEstoque: TCheckBox;
    ckbAutorizacaoPagtoAutomatica: TCheckBox;
    spnSeculo: TSpinEdit;
    Label5: TLabel;
    ckbGerarContabilidade: TCheckBox;
    lblDiasNotaRetroativa: TLabel;
    edtDiasNotaRetroativa: TEditNumero;
    ckbAtualizarDadosClientesContratos: TCheckBox;
    lblMascaraQuantidade: TLabel;
    edtMascaraQuantidade: TEdit;
    lblCorZebradadoRelatorio: TLabel;
    btnCorZebrado: TBitBtn;
    ckbOcultarObservacoesClienteVendedor: TCheckBox;
    ckbRelatorioSomenteFiliaisAutorizadas: TCheckBox;
    Label9: TLabel;
    gbxValoresSugestao: TGroupBox;
    sbnProcuraSeguro: TSpeedButton;
    sbnProcuraFrete: TSpeedButton;
    lblICMSSeguro: TLabel;
    edfICMSSeguro: TtecDbEditFind;
    dtxSeguro: TtecDBText;
    lblICMSFrete: TLabel;
    edfICMSFrete: TtecDbEditFind;
    dtxFrete: TtecDBText;
    lblAliquotaCofins: TLabel;
    edtAliquotaPIS: TEditNumero;
    edtAliquotaCofins: TEditNumero;
    lblPIS: TLabel;
    lblPercCofins: TLabel;
    lblPercPIS: TLabel;
    gbxSeparadorValoresSugestao: TGroupBox;
    gbxOutrosGeral: TGroupBox;
    ckbUsarLimiteAcrescimoFinanceiro: TCheckBox;
    tstProdutos: TTabSheet;
    gbxProdutos: TGroupBox;
    ckbPesquisaPadraoProdutoCodigoBarras: TCheckBox;
    ckbUsarCodigoBarras: TCheckBox;
    ckbGerarCodigoProdutoAutomatico: TCheckBox;
    ckbDescricaoProduto: TCheckBox;
    ckbUsarGradesProdutos: TCheckBox;
    ckbUsaProdutoComposto: TCheckBox;
    tstNotas: TTabSheet;
    gbxNotas: TGroupBox;
    ckbBloquearNotaEntradaComPedido: TCheckBox;
    ckbCNPJOpcionalNFEntrada: TCheckBox;
    ckbNotaTransfDestacaICMS: TCheckBox;
    ckbPermitirGravacaoNFEParcial: TCheckBox;
    ckbPadraoNotaManual: TCheckBox;
    ckbGerarParcelaSubstituicaoTributaria: TCheckBox;
    gbxObservacaoRodapePedidos: TGroupBox;
    edtObservacaoRodapePedidos: TEditTexto;
    tstPrecoVenda: TTabSheet;
    gbxPrecoVenda: TGroupBox;
    ckbNaorateardescontoparacalculodeprecodevendanaNFE: TCheckBox;
    ckbRetirarPISCONFINSCalculoPreco: TCheckBox;
    ckbGerarPrecoAutomatico: TCheckBox;
    lblMultiploPreco: TLabel;
    edtMultiploPreco: TEditNumero;
    ckbSugerirPrecoPeloPrecoVenda: TCheckBox;
    gbxCalcularPrecoVenda: TGroupBox;
    rbnCalcularPrecoPedido: TRadioButton;
    rbnCalcularPrecoNota: TRadioButton;
    rbnCalcularPrecoAmbos: TRadioButton;
    ckbnaoatualizarprecomenorqueatual: TCheckBox;
    Label10: TLabel;
    ckbVincuarAutomaticoProdutoFornecedor: TCheckBox;
    procedure ckbConfirmaRecebimentoAvisoSPCClick(Sender: TObject);
    procedure rbnDedicadoClick(Sender: TObject);
    procedure rgpParametroChange(Sender: TObject);
    procedure sbnSalvarClick(Sender: TObject);
    procedure sbnExcluirClick(Sender: TObject);
    procedure sbnProcuraSeguroClick(Sender: TObject);
    procedure sbnProcuraFreteClick(Sender: TObject);
    procedure sbnProcuraModeloCarneClick(Sender: TObject);
//    procedure sbnProcuraLogotipoClick(Sender: TObject);
    procedure ckbCreditarICMSClick(Sender: TObject);
    procedure sbnPlanosClick(Sender: TObject);
    procedure sbnTEFReqClick(Sender: TObject);
    procedure sbnTEFRespClick(Sender: TObject);
    procedure sbnTEFExecClick(Sender: TObject);
    procedure ckbGerarPrecoAutomaticoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbnPlanoOrcamentoPadraoClick(Sender: TObject);
    procedure btnCorZebradoClick(Sender: TObject);
    procedure sbnProcuraModeloBoletoClick(Sender: TObject);
    procedure ckbFrenteCaixaVendedorClick(Sender: TObject);
    procedure ckbNaoInformaDadosChequeFrenteCaixaClick(Sender: TObject);
    procedure sbnModeloContratoMatricialClick(Sender: TObject);
    procedure sbnExcluirImpostoRetidoClick(Sender: TObject);
    procedure dbgImpostosRetidosDblClick(Sender: TObject);
    procedure dbgImpostosRetidosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgBonusValorCompraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnExcluirValorCompraClick(Sender: TObject);
    procedure ckbUtilizarFidelidadeClick(Sender: TObject);
    procedure ckbGerarContabilidadeClick(Sender: TObject);
    procedure cmbParametroPadraoContaChange(Sender: TObject);
    procedure sbnConsultaDebitarVendaVistaClick(Sender: TObject);
    procedure sbnConsultaCreditarVendaVistaClick(Sender: TObject);
    procedure sbnConsultaHistoricoVendaaVistaClick(Sender: TObject);
    procedure sbnConsultaDebitarVendaPrazoClick(Sender: TObject);
    procedure sbnConsultaCreditarVendaPrazoClick(Sender: TObject);
    procedure sbnConsultaHistoricoVendaaPrazoClick(Sender: TObject);
    procedure sbnConsultaDebitarAbatimentosClick(Sender: TObject);
    procedure sbnConsultaCreditarAbatimentosClick(Sender: TObject);
    procedure sbnConsultaHistoricoAbatimentosClick(Sender: TObject);
    procedure sbnConsultaDebitarDevolucoesClick(Sender: TObject);
    procedure sbnConsultaCreditarDevolucoesClick(Sender: TObject);
    procedure sbnConsultaHistoricoDevolucoesClick(Sender: TObject);
    procedure rgpTipoSugestaoClick(Sender: TObject);
    procedure cmbMascaraQuantidadeChange(Sender: TObject);
    procedure sbnProcurarContaClick(Sender: TObject);
    procedure MonthCalendar1DblClick(Sender: TObject);
    procedure MonthCalendar1BoldDays(Sender: TObject; mStart, mEnd,
      mFeriado: TDateTime; var SituacaoFeriado: Boolean; Setar: Boolean;
      var BoldDays: TBoldDays);
    procedure dbgVenctosImpostosRetidosEntradasDblClick(Sender: TObject);
    procedure dbgVenctosImpostosRetidosEntradasKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure ckbGeracaoAutomaticadoImpostoRetidoClick(
      Sender: TObject);
    procedure dbgEntradasDblClick(Sender: TObject);
    procedure dbgSaidasDblClick(Sender: TObject);
    {
    procedure MonthCalendar1BoldDays(Sender: TObject; mStart,
      mEnd: TDateTime; var BoldDays: TBoldDays);}
  private
  protected
    ParSistema:   TtecParametrosSistema;
    TipoConsulta: TtecParSistemaTipoConsulta;
    FErro: Integer;
    slPickListQuinzena:TStringList;
    slPickListMensal:TStringList;
    procedure AtualizaINISection;
    procedure DoScrollFiliais(Sender: TObject);
    procedure DoScrollVenctosImpostosRetidosEntradas(Sender: TObject);
    function  InternoGravar: Boolean;
    function  InternoExcluir: Boolean;

    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;

    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure LerParametros;
    function  SalvarParametros: Boolean;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmParametrosSistema: TfrmParametrosSistema;

implementation

uses
  //CLX
  QPrinters, inifiles,
  //Biblio
  cltextprinter, cltefdedicado,
{$IFDEF MSWINDOWS}
  cltefdiscado,
{$ENDIF}
  //Repositorio
  fmconsultaporcampo,
  //Projeto
  dmparametrossistema;

{$R *.dfm}

{ TfrmParametrosSistema }

procedure TfrmParametrosSistema.AtualizaINISection;
var
  ArquivoCFG: TIniFile;
begin
  if FileExists(NomeArquivoCFG) then begin
    ArquivoCFG := TIniFile.Create(NomeArquivoCFG);
    try
{$IFDEF LINUX}
      ArquivoCFG.CaseSensitive := False;
{$ENDIF}
      if ParSistema.TipoTEF = tsSEMTEF then
         ArquivoCFG.EraseSection(TEFSection)
      else
      if ParSistema.TipoTEF = tsDEDICADO then begin
         if TtecTEFDedicado.Terminal = '' then
             ArquivoCFG.EraseSection(TEFSection)
         else begin
             ArquivoCFG.WriteString(TEFSection, 'terminal', TtecTEFDedicado.Terminal);
             ArquivoCFG.DeleteKey(TEFSection,   'dirreq');
             ArquivoCFG.DeleteKey(TEFSection,   'dirresp');
             ArquivoCFG.DeleteKey(TEFSection,   'exec');
          end
{$IFDEF MSWINDOWS}
          end else begin
          if (TtecTEFDiscado.DiretorioRequisicao = '') and
             (TtecTEFDiscado.DiretorioResposta = '')   and
             (TtecTEFDiscado.ExecutavelTEF = '')
          then
             ArquivoCFG.EraseSection(TEFSection)
          else begin
            if TtecTEFDiscado.DiretorioRequisicao = '' then
              ArquivoCFG.DeleteKey(TEFSection, 'dirreq')
            else
              ArquivoCFG.WriteString(TEFSection, 'dirreq', TtecTEFDiscado.DiretorioRequisicao);
            if TtecTEFDiscado.DiretorioResposta = '' then
              ArquivoCFG.DeleteKey(TEFSection, 'dirresp')
            else
              ArquivoCFG.WriteString(TEFSection, 'dirresp', TtecTEFDiscado.DiretorioResposta);
            if TtecTEFDiscado.ExecutavelTEF = '' then
              ArquivoCFG.DeleteKey(TEFSection, 'exec')
            else
              ArquivoCFG.WriteString(TEFSection, 'exec', TtecTEFDiscado.ExecutavelTEF);
            ArquivoCFG.DeleteKey(TEFSection, 'terminal');
      end
{$ENDIF}
    end;
      ArquivoCFG.UpdateFile;
    finally
      ArquivoCFG.Free
    end
  end
end;

procedure TfrmParametrosSistema.ckbConfirmaRecebimentoAvisoSPCClick(
  Sender: TObject);
begin
  inherited;
  if ckbConfirmaRecebimentoAvisoSPC.Checked
  then lblRegistrodiasSPC.Caption := ctREGISTRODIASSPCCONFIRMACAO
  else lblRegistrodiasSPC.Caption := ctREGISTRODIASSPCAVISO;
end;

procedure TfrmParametrosSistema.ckbCreditarICMSClick(Sender: TObject);
begin
  inherited;
  edtDiasCreditarICMS.Enabled:= ckbCreditarICMS.Checked;
  if not ckbCreditarICMS.Checked then
    edtDiasCreditarICMS.Text:= '';
end;

procedure TfrmParametrosSistema.ckbGerarPrecoAutomaticoClick(Sender: TObject);
begin
  inherited;
  gbxCalcularPrecoVenda.Enabled := ckbGerarPrecoAutomatico.Checked
end;

constructor TfrmParametrosSistema.Create(AOwner: TComponent);
begin
try
  dtmParametrosSistema := TdtmParametrosSistema.Create(Self);
  inherited;
  dtmParametrosSistema.Abre(ctTabelaConsultaFiliais);
  dtmParametrosSistema.OnScrollFiliais := DoScrollFiliais;
  dtmParametrosSistema.OnScrollVenctosImpostosRetidosEntradas := DoScrollVenctosImpostosRetidosEntradas;
  ParSistema := TtecParametrosSistema.Create;
  ParSistema.Database := dtmParametrosSistema.dtmTecsoft.dbaTecSoft;
  ParSistema.Filial := -1;
  FErro := ParSistema.Ler;
  sbnExcluir.Enabled  := False;
  dbgFiliais.Enabled  := False;
  edtTerminalTEF.Text := TtecTEFDedicado.Terminal;
{$IFDEF LINUX}
  lblTEFRequisicao.Visible    := False;
  lblTEFResposta.Visible      := False;
  lblTEFPrograma.Visible      := False;
  lblTEFArqRequisicao.Visible := False;
  lblTEFArqResposta.Visible   := False;
  lblTEFArqPrograma.Visible   := False;
  sbnTEFReq.Visible           := False;
  sbnTEFResp.Visible          := False;
  sbnTEFExec.Visible          := False;
{$ELSE}
  lblTEFArqRequisicao.Caption := TtecTEFDiscado.DiretorioRequisicao;
  lblTEFArqResposta.Caption   := TtecTEFDiscado.DiretorioResposta;
  lblTEFArqPrograma.Caption   := TtecTEFDiscado.ExecutavelTEF;
{$ENDIF}
  if ParSistema.TipoTEF = tsSEMTEF then
    rbnDedicadoClick(rbnSemTEF)
  else if ParSistema.TipoTEF = tsDEDICADO then
    rbnDedicadoClick(rbnDedicado)
  else if ParSistema.TipoTEF = tsDISCADO then
    rbnDedicadoClick(rbnDiscado);
  pgcParametros.ActivePage := tstGeral;
  tstFidelidade.TabVisible := ckbUtilizarFidelidade.Checked;
  edtMascaraQuantidade.BringToFront;
  MonthCalendar1.Date := DataLocal;
  slPickListQuinzena:=TStringList.Create;
  slPickListMensal:=TStringList.Create;
  slPickListQuinzena.Add('Quinzena atual');
  slPickListQuinzena.Add('Quinzena seguinte');
  slPickListMensal.Add('Mês atual');
  slPickListMensal.Add('Mês seguinte');
  fraConsultaFornecedor.TipoCliente := 'F';
  fraConsultaFornecedor.TipoPesquisa := pesCLIENTES;
except
     on E: Exception do ShowMessage(E.Message);
end;
end;

destructor TfrmParametrosSistema.Destroy;
begin
  slPickListQuinzena.Free;
  slPickListMensal.Free;
  ParSistema.Free;
  dtmParametrosSistema.Fecha(ctTabelaConsultaFiliais);
  dtmParametrosSistema:=nil;
  inherited;
  frmParametrosSistema := nil;
end;

procedure TfrmParametrosSistema.DoScrollFiliais(Sender: TObject);
begin
  if rbnFilial.Checked then begin
    ParSistema.Filial := dtmParametrosSistema.CodigoFilial;
    LerParametros
  end
end;

function TfrmParametrosSistema.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  case TipoConsulta of
    pscCONTAEMISSAOBOLETO   : Result:= dtmParametrosSistema.ExisteConta(NomeCampo, Value);
    pscFRETE                : Result:= dtmParametrosSistema.ExisteFrete(NomeCampo, Value);
    pscSEGURO               : Result:= dtmParametrosSistema.ExisteSeguro(NomeCampo, Value);
    pscPLANO                : Result:= dtmParametrosSistema.ExistePlano(NomeCampo, Value);
    pscPLANOORCAMENTOPADRAO : Result:= dtmParametrosSistema.ExistePlanoOrcamentoPadrao(NomeCampo, Value);
    pscDebitarVendaaVista,
    pscCreditarVendaaVista,
    pscDebitarVendaaPrazo,
    pscCreditarVendaaPrazo,
    pscDebitarAbatimentos,
    pscCreditarAbatimentos,
    pscDebitarDevolucoes,
    pscCreditarDevolucoes,
    pscContaContabilEntrada,
    pscContaContabilSaida   : Result:= dtmParametrosSistema.ExisteContaContabil(NomeCampo, Value);
    pscHistoricoVendaaVista,
    pscHistoricoVendaaPrazo,
    pscHistoricoAbatimentos,
    pscHistoricoDevolucoes  : Result := dtmParametrosSistema.ExisteHistorico(NomeCampo, Value)
  else                       Result:= False;
  end
end;

procedure TfrmParametrosSistema.FormShow(Sender: TObject);
begin
  inherited;
  if FErro = cttecPARSIS_NOERROR then
    LerParametros
  else
    pnlParametros.Enabled := False;
end;

function TfrmParametrosSistema.InternoExcluir: Boolean;
begin
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, [ctPARAMETROSFILIAL])) = smbOK then begin
    ParSistema.ExcluirFilial;
    rbnGlobal.OnClick := nil;
    rbnGlobal.Checked := True;
    rbnGlobal.OnClick := rgpParametroChange;
    ParSistema.Filial := -1;
    LerParametros;
    clparametrossistema.ParSistema.Ler;
    dbgFiliais.Enabled := False;
    Result := True
  end else
    Result := False;
end;

function TfrmParametrosSistema.InternoGravar: Boolean;
begin
  if SalvarParametros then begin
     ParSistema.Salvar;
     clparametrossistema.ParSistema.Ler;
     Result := True
  end else
     Result := False
end;

function TfrmParametrosSistema.InternoPesquisar(Titulo: String): Integer;
var
  Tabela: Integer;
begin
  Tipoconsulta := pscNENHUM;
  Result := mrNone;
  if CtrlOn then begin
    Tabela := 0;
    if edfICMSSeguro.Focused then
      TipoConsulta := pscSEGURO
    else if edfICMSFrete.Focused then
      TipoConsulta := pscFRETE
    else if edfModeloCarne.Focused then
      TipoConsulta := pscCARNE
    else if edfModeloBoleto.Focused then
      TipoConsulta := pscBOLETO
    else if edfConta.Focused then
      TipoConsulta := pscCONTAEMISSAOBOLETO
    else if edfPlanos.Focused then
      TipoConsulta:= pscPLANO
    else if edfPlanoOrcamentoPadrao.Focused then
      TipoConsulta:= pscPLANOORCAMENTOPADRAO
    else if edfModeloContratoMatricial.Focused then
      TipoConsulta:= pscCONTRATOMATRICIAL
    else if flkDebitarVendaaVista.Focused then
        TipoConsulta := pscDebitarVendaaVista
    else if flkCreditarVendaVista.Focused then
        TipoConsulta := pscCreditarVendaaVista
    else if flkHistoricoVendaaVista.Focused then
        TipoConsulta := pscHistoricoVendaaVista
    else if flkDebitarVendaaPrazo.Focused then
        TipoConsulta := pscDebitarVendaaPrazo
    else if flkCreditarVendaPrazo.Focused then
        TipoConsulta := pscCreditarVendaaPrazo
    else if flkHistoricoVendaaPrazo.Focused then
        TipoConsulta := pscHistoricoVendaaPrazo
    else if flkDebitarAbatimentos.Focused then
        TipoConsulta := pscDebitarAbatimentos
    else if flkCreditarAbatimentos.Focused then
        TipoConsulta := pscCreditarAbatimentos
    else if flkHistoricoAbatimentos.Focused then
        TipoConsulta := pscHistoricoAbatimentos
    else if flkDebitarDevolucoes.Focused then
        TipoConsulta := pscDebitarDevolucoes
    else if flkCreditarDevolucoes.Focused then
        TipoConsulta := pscCreditarDevolucoes
    else if flkHistoricoDevolucoes.Focused then
        TipoConsulta := pscHistoricoDevolucoes
    else if dbgEntradas.Focused then
        Tipoconsulta := pscContaContabilEntrada
    else if dbgSaidas.Focused then
        Tipoconsulta := pscContaContabilSaida
    else
      TipoConsulta := pscNENHUM;

    if TipoConsulta <> pscNENHUM then begin
      case TipoConsulta of
        pscFRETE:  begin
                     Tabela := ctTabelaConsultaFrete;
                     Titulo:= ctFRETE;
                   end;
        pscSEGURO: begin
                     Tabela := ctTabelaConsultaSeguro;
                     Titulo:= ctSEGURO;
                   end;
        pscCARNE:  begin
                     Tabela := ctTabelaConsultaCarne;
                     Titulo:= ctCARNE;
                   end;
        pscBOLETO: begin
                     Tabela := ctTabelaConsultaBoleto;
                     Titulo:= ctBOLETO;
                   end;
        pscPLANO,
pscPLANOORCAMENTOPADRAO
                :  begin
                     Tabela := ctTabelaConsultaPlano;
                     Titulo:= ctPLANOSPAGAMENTOS;
                   end;
pscCONTRATOMATRICIAL
                :  begin
                     Tabela := ctTabelaConsultaContratoMatricial;
                     Titulo := ctCONTRATOMATRICIAL;
                   end;

      end;
      if tabela <> 0 then
        dtmParametrosSistema.Abre(Tabela)
      else dtmParametrosSistema.AbreTabelasConsulta(TipoConsulta);

      Result := inherited InternoPesquisar(Titulo);
      if Result = mrOK then begin
        case TipoConsulta of
          pscCONTAEMISSAOBOLETO : dtmParametrosSistema.SelecionarConta;
          pscFRETE:  dtmParametrosSistema.SelecionarFrete;
          pscSEGURO: dtmParametrosSistema.SelecionarSeguro;
          pscCARNE:  dtmParametrosSistema.SelecionarCarne;
          pscBOLETO: dtmParametrosSistema.SelecionarBoleto;
          pscPLANO:  dtmParametrosSistema.selecionarPlano;
          pscPLANOORCAMENTOPADRAO :  dtmParametrosSistema.selecionarPlanoOrcamentoPadrao;
          pscCONTRATOMATRICIAL:  dtmParametrosSistema.SelecionarContratoMatricial;
        else
          dtmParametrosSistema.Selecionar(TipoConsulta);
        end;

        if tabela <> 0 then
          dtmParametrosSistema.Fecha(Tabela)
        else dtmParametrosSistema.FechaTabelasConsulta(TipoConsulta);
      end
    end
  end
end;

function TfrmParametrosSistema.JanelaPesquisa: TfrmConsultaBasica;
var
  Jan: TfrmConsultaPorCampo;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  jan.ConsultaInterativa := true;
  Result := Jan
end;

procedure TfrmParametrosSistema.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Shift = [] then
    if (Key = VK_F5) and sbnSalvar.Enabled then
      InternoGravar
    else if (Key = VK_F6) and sbnExcluir.Enabled then
      InternoExcluir
    else if Key = VK_ESCAPE then
      LerParametros
end;

procedure TfrmParametrosSistema.LerParametros;

  procedure ResetModificado(Ctrl: TWinControl);
  var
    a: Integer;
  begin
    for a := 0 to Ctrl.ControlCount - 1 do begin
      if Ctrl.Controls[a] is TEdit then
        TEdit(Ctrl.Controls[a]).Modified := False;
      if Ctrl.Controls[a] is TWinControl then
        ResetModificado(TWinControl(Ctrl.Controls[a]));
    end
  end;

begin
  edtAssinatura1.Text             := ParSistema.Assinatura1;
  edtAssinatura2.Text             := ParSistema.Assinatura2;
  edtAssinatura3.Text             := ParSistema.Assinatura3;
  EdtNumeroCopias.Text            := IntToStr(ParSistema.NumeroCopias);
  ckbCancelamentos.Checked        := ParSistema.Cancelamentos;

  ckbVisualizarfechamentocaixa.Checked := ParSistema.VisualizarFechamentoCaixa;

  ckbDepositos.Checked            := ParSistema.Depositos;
  ckbDevolucoes.Checked           := ParSistema.Devolucoes;
  ckbDevolucoesTroca.Checked      := ParSistema.DevolucoesSaldo;
  ckbDocumentos.Checked           := ParSistema.Documentos;
  ckbDuplicatas.Checked           := ParSistema.Duplicatas;
  ckbPerdas.Checked               := ParSistema.Perdas;
  ckbRecebimentos.Checked         := ParSistema.Recebimentos;
  ckbResgateCheques.Checked       := ParSistema.ResgateDeCheques;
  ckbResumo.Checked               := ParSistema.Resumo;
  ckbTransferencias.Checked       := ParSistema.Transferencias;
  ckbChequePrazo.Checked          := ParSistema.ChequePrazo;
  ckbChequeVista.Checked          := ParSistema.ChequeVista;
  ckbAutorizacaoPagtoAutomatica.Checked := ParSistema.AutorizacaoPagtoAutomatica;
  ckbGerarPrecoAutomatico.Checked := ParSistema.GerarPrecoAutomatico;
  edtDiasAtraso1.Text             := IntToStr(ParSistema.DiasAtraso1);
  edtDiasAtraso2.Text             := IntToStr(ParSistema.DiasAtraso2);
  edtPercAtrasoMulta1.Text   := FloatToStr(ParSistema.PercentualAtrasoMultas1);
  edtPercAtrasoMulta2.Text   := FloatToStr(ParSistema.PercentualAtrasoMultas2);
  edtPercAtrasoJuros1.Text   := FloatToStr(ParSistema.PercentualAtrasoJuros1);
  edtPercAtrasoJuros2.Text   := FloatToStr(ParSistema.PercentualAtrasoJuros2);
  edtTaxaJuros.Text          := FloatToStr(ParSistema.TaxaJuros);
  edtAtrasoMinimo.Text       := IntToStr(ParSistema.AtrasoMinimo);
  edtTetoMetaCobranca.Text   := FloatToStr(ParSistema.TetoDaMetaCobranca);
  ckbCobrarMultasJuros.Checked := ParSistema.CobrarMultasJuros;
  ckbRetiraSPCRenegociados.Checked := ParSistema.RetiraSPCRenegociados;
  ckbPermiteReducaoDivida.Checked := ParSistema.PermiteReducaoDivida;
  edtDescontoPagAntecipado.Text := FloatToStr(ParSistema.DescontoPagAntecipado);
  edtValidadeReserva.Text := IntToStr(ParSistema.ValidadeReserva);
  edtTetoMetaVendas.Text  := FloatToStr(ParSistema.TetoDaMetaVendas);
  ckbUtilizarJurosSimples.Checked := ParSistema.UtilizarJurosSimples;
  ckbCalculoTodosPlanos.Checked   := ParSistema.CalculoComTodosPlanos;

  ckbObrigaVendedorFrenteCaixa.Checked := ParSistema.ObrigaVendedorFrenteCaixa;
  ckbSugerirUsuarioComoVendedorFrenteCaixa.Checked := ParSistema.SugerirUsuariOComoVendedorFCx;
  ckbNaoInformaDadosChequeFrenteCaixa.Checked := ParSistema.NaoInformaDadosChequeFCaixa;
  ckbMensagemInformarDadosCheque.Checked := ParSistema.MensagemInformarDadosChequeFCaixa;
  ckbExigeSenhaDescontoParcela.Checked := ParSistema.exigeSenhaDescontoAlteracaoParcela;
  ckbMostraSaldoPagarRecibo.Checked := ParSistema.MostrarSaldoPagarRecibo;
  ckbExigeSenhaGerenteDevolucao.Checked:= ParSistema.ExigeSenhaGerenteDevolucao;
  ckbExigeSenhaChefeCreditoDevolucao.Checked:=ParSistema.ExigeSenhaAnalistaCreditoDevolucao;
  ckbUsaProdutoComposto.Checked := ParSistema.UsaProdutoComposto;

  ckbPermiteAlterarPreco.Checked  := ParSistema.PermiteAlterarPreco;
  ckbExigeAnalistaCredito.Checked := ParSistema.ExigeAnaListaCredito;
  ckbPermiteAvalista.Checked      := ParSistema.PermiteAvalista;
  cmbNotaFiscalVinculada.ItemIndex := Ord(ParSistema.NotaFiscalVinculada);
  cmbOperacoesOrcamentos.ItemIndex := Ord(ParSistema.ExclusaoOrcamento);
  cmbOperacoesContratos.ItemIndex  := Ord(ParSistema.ExclusaoContrato);
  cmbOperacoesNotaAvulsa.ItemIndex := Ord(ParSistema.ExclusaoNotaAvulsa);
  edtSalarioReferencia.Text        := FloatToStr(ParSistema.SalarioReferencia);
 // edtDiretorioImagem.Text          := ParSistema.DiretorioImagens;
  dtmParametrosSistema.SelecionarSeguro(ParSistema.IcmsSeguro);
  dtmParametrosSistema.SelecionarFrete(ParSistema.IcmsFrete);
  dtmParametrosSistema.SelecionarCarne(ParSistema.ModeloCarne);
  dtmParametrosSistema.SelecionarBoleto(ParSistema.ModeloBoleto);
  dtmParametrosSistema.SelecionarConta(ParSistema.ContaEmissaoBoleto);
  dtmParametrosSistema.SelecionarPlano(ParSistema.PlanoVendaVista);
  dtmparametrosSistema.SelecionarPlanoOrcamentoPadrao(ParSistema.PlanoOrcamentoPadrao);
  dtmParametrosSistema.SelecionarContratoMatricial(ParSistema.ModeloContratoMatricial);
  edtDataContabil.Text             := DateTimeToStr(ParSistema.DataContabil);
  edtAliquotaCofins.Text           := FloatToStr(ParSistema.AliquotaCofins);
  edtAliquotaPIS.Text              := FloatToStr(ParSistema.AliquotaPIS);
  edtAgencia.Text                  := IntToStr(ParSistema.Agencia);
  edtNomeContador.Text             := ParSistema.NomeContador;
  edtCRCContador.Text              := ParSistema.CRCContador;
  edtCPFContador.Text              := ParSistema.CPFContador;
  edtDDDContador.Text              := IntToStr(ParSistema.DDDContador);
  edtFoneContador.Text             := IntToStr(ParSistema.TelefoneContador);
  edtEmailContador.Text            := ParSistema.EmailContador;
  rgpformalivros.ItemIndex         := Parsistema.LivrosFiscaisFolhaouPagina;
  edtResponsavelLivros1.Text       := ParSistema.ResponsavelLivros1;
  edtResponsavelLivros2.Text       := ParSistema.ResponsavelLivros2;
  edtMaximoParcelas.Text           := IntToStr(ParSistema.MaximoParcelasRenegociacao);
  edtVencimentoPrimeiraParcela.Text:= IntToStr(ParSistema.VenctoPrimeiraParcela);
  ckbConfirmaRecebimentoAvisoSPC.Checked := ParSistema.ConfirmaRecebimentoAvisoSPC;
  ckbConfirmaRecebimentoAvisoSPCClick(self);
  ckbInscreverSPCCartasDevolvidas.Checked := Parsistema.InscreveSPCClienteCartaDevolvida;
  ckbVaiCartasefoiAnterior.Checked       := Parsistema.VaiCartasefoiAnterior;
  ckbRegistraAvalistaNoSPC.Checked       := ParSistema.RegistraAvalistaNoSPC;
  ckbInscreverpessoajuridicaSPC.Checked  := ParSistema.InscreverPessoaJuridicaSPC;
  edtRegistrodiasSPC.Text                := inttostr(Parsistema.DiasEntradaSPC);
  edtdiasNovaInscricao.Text              := inttostr(ParSistema.DiasNovaInscricaoSPC);
  ckbSPCCentralizado.checked             := ParSistema.ControleSPCCentralizado;
  edtMaximoATraso.text                   := inttostr(ParSistema.MaximoEntradaSPC);
  ckbClientePessoaJuridica.Checked       := ParSistema.ClientePessoaJuridica;
  edtNroProcAutPresumido.Text            := ParSistema.NumeroProcessoAutorizacao;
//  edtEmailEmpresa.Text                   := ParSistema.EmailEmpresa;
//  edtHost.Text                           := ParSistema.Host;
//  edtSenha.Text                          := ParSistema.Senha;
//  edtUsuario.Text                        := ParSistema.Usuario;
  edtEnderecoLogotipo.Text               := ParSistema.EnderecoLogotipo;
  edtSiteEmpresa.Text                    := ParSistema.SiteEmpresa;
//  edtDiretorioImagem.Text                := ParSistema.DiretorioImagens;
  ckbContratoComServico.Checked          := ParSistema.ContratoComServico;
  ckbClienteComDependentes.Checked       := ParSistema.ClienteComDependentes;
  ckbPesquisaPadraoProdutoCodigoBarras.Checked := ParSistema.PesquisaPadraoProdutoCodigoBarras;
  ckbRequisicaoSubtraiEstoque.Checked    := ParSistema.RequisicaoSubtraiEstoque;
  edtDataInicialSaldoAcumulado.Text      := DateTimeToStr(ParSistema.DataInicialFluxoCaixa);
//edtSaldoInicial.Text                   := FloatToStr(ParSistema.SaldoInicialFluxoCaixa);
  ckbFaturarAlteraParcelas.Checked       := ParSistema.FaturarAlteraPercelas;
  ckbCreditarICMS.Checked                := ParSistema.CreditarICMSDevolucao;
  edtDiasCreditarICMS.Text               := IntToStr(ParSistema.DiasCreditarICMS);
  edtBancoDataInicial.Text               := DateTimeToStr(ParSistema.BancoDataInicial);
  edtBancoDataFinal.Text                 := DateTimeToStr(ParSistema.BancoDataFinal);
  edtInicioIntegracaoBancos.Text      := DateTimeToStr(ParSistema.InicioIntegracaoBancos);
  edtNdiasparaLiberacaoCobranca.text     := inttostr(ParSistema.NdiasparaLiberacaoCobranca);

  {
  ==TROCADO PARA COMBOBOX  JR
  if ParSistema.ExclusaoContrato = excEXCLUIR then
    rbnExcluirContratoSempre.Checked := True
  else if ParSistema.ExclusaoContrato = excCANCELAR then
    rbnCancelarContratoSempre.Checked := True
  else if ParSistema.ExclusaoContrato = excPERGUNTAR then
    rbnPerguntarQualOperacao.Checked := True;

  if ParSistema.ExclusaoOrcamento = exoEXCLUIR then
    rbnExcluirOrcamentoSempre.Checked := True
  else if ParSistema.ExclusaoOrcamento = exoCANCELAR then
    rbnCancelarOrcamentoSempre.Checked := True
  else if ParSistema.ExclusaoOrcamento = exoPERGUNTAR then
    rbnPerguntarSempre.Checked := True;
  }
  ckbSolicitarAutorizacaoVendaFutura.Checked := ParSistema.SolicitarAutorizacaoVendaFutura;
  ckbGerarCodigoProdutoAutomatico.Checked:= ParSistema.GerarCodigoProdutoAutomatico;
  ckbUsarCodigoBarras.Checked            := ParSistema.UsarCodigoBarras;
  ckbDescricaoProduto.Checked            := ParSistema.PermitiProdutoMesmaDescricao;
  ckbIncluirEstoqueAutomatico.Checked    := ParSistema.IncluirEstoqueAutomatico;
  edtLojaTEF.Text                        := ParSistema.LojaTEF;
  edtIPTEF.Text                          := ParSistema.IPTEF;
  edtMensagemTEF.Text                    := ParSistema.MensagemTEF;
  ckbControlarSomente2Devolucao.Checked  := ParSistema.ControlarSomente2Devolucao;
  ckbLeitoraChequePortaSerial.Checked    := ParSistema.LeitoraChequePortaSerial;
  if ParSistema.TipoTEF = tsDEDICADO then
    rbnDedicado.Checked := True
  else if ParSistema.TipoTEF = tsDISCADO then
    rbnDiscado.Checked := True
  else
    rbnSemTEF.Checked := True;
  edtNroViasTEF.Text     := IntToStr(ParSistema.QtdeViaTEFDiscado);
  ckbExibirAtrasoMedioParcelas.Checked   := ParSistema.ExibirAtrasoMedioParcelas;
  ckbCPFCNPJObrigatorio.Checked          := ParSistema.CPF_CNPJObrigatorio;
  ckbCNPJOpcionalNFEntrada.Checked       := ParSistema.CNPJOpcionalNFEntrada;
  ckbExibirDescontoSugerido.Checked      := ParSistema.ExibirDescontoSugerido;
  ckbImprimirCarneFaturar.Checked        := ParSistema.ImprimirCarneAoFaturar;
  ckbUtilizarListaCasamento.Checked      := ParSistema.UtilizarListaCasamento;
  ckbUtilizarPrecodaFilialBase.Checked   := ParSistema.UtilizarPrecoFilialBase;
  ckbSoVisualizarEstoqueDeposito.Checked := ParSistema.SoVisualizarEstoqueDeposito;
  ckbIncluirContratoTrocaEquivalente.Checked := ParSistema.IncluirContratoTrocaEquivalente;
  ckbUtilizarCreditoTrocaContrato.Checked := ParSistema.utilizarcreditotrocacontrato;
  ckbImprimirContratoMatricial.Checked := ParSistema.imprimircontratomatricial;
  ckbImprimirTaxasJuros.Checked := ParSistema.ImprimirTaxadeJuros;
  ckbPesquisaSomenteEstoqueFilialBaseVendas.Checked := ParSistema.PesquisaSomenteEstoqueFilialBaseVendas;
  ckbMostrarSimilaresContrato.Checked := ParSistema.MostrarSimilaresContrato;
  ckbGravarProdutoAutomaticamente.Checked := ParSistema.GravarProdutoContratoAutomaticamente;
  ckbPermitirAlterarPagtoCaixa.Checked   := ParSistema.PermitirAlterarVenctoCaixa;
  ckbImprimirReciboAcumulado.Checked     := ParSistema.ImprimirReciboAcumulado;
  edtMultiploPreco.Text                  := FloatToStr(ParSistema.MultiploPreco);
  edtTotalizadorAutenticacao.Text        := ParSistema.TotalizadorAutenticacao;
  edtValorMaxDescAlteracaoParcela.Text   := FloatToStr(ParSistema.ValorMaxDescontoAlteracaoParcela);

  ckbSaldoCaixaNegativo.Checked          := ParSistema.SaldoCaixaNegativo;
  ckbFaturarVendaVista.Checked           := ParSistema.FaturarVendaVista;
  ckbImpCarneVendaVista.Checked          := ParSistema.ImpCarneVendaVista;
  edtArredondamentoJuros.Text            := FloatToStr(ParSistema.ArredondamentoJurosCaixa);
  ckbRetirarPISCONFINSCalculoPreco.Checked := ParSistema.RetirarPISCONFINSCalPreco;
  ckbPermitirGravacaoNFEParcial.Checked := ParSistema.PermitirGravacaoNFEParcial;
  ckbVincuarAutomaticoProdutoFornecedor.Checked := ParSistema.VincularAutomaticoProdutoFornecedor;
  ckbNaorateardescontoparacalculodeprecodevendanaNFE.Checked := ParSistema.NaorateardescontoparacalculodeprecodevendanaNFE;  
  ckbSugerirPrecoPeloPrecoVenda.Checked    := ParSistema.SugestaoPeloPrecoVenda;
  ckbBloquearNotaEntradaComPedido.Checked  := ParSistema.BloquearNotaComPedido;
  if ParSistema.LocalCalculoPreco = lcpPEDIDO then
    rbnCalcularPrecoPedido.Checked := True
  else if ParSistema.LocalCalculoPreco = lcpNOTAENTRADA then
    rbnCalcularPrecoNota.Checked := True
  else if ParSistema.LocalCalculoPreco = lcpAMBOS then
    rbnCalcularPrecoAmbos.Checked  := True;
  ckbFilialIndependente.Checked    := ParSistema.FiliaisIndependentes;
  ckbUsarGradesProdutos.Checked    := ParSistema.UsarGradesProdutos;
  ckbReplicarFornecedores.Checked  := ParSistema.Replicar_Fornecedores;
  ckbNotaTransfDestacaICMS.Checked := ParSistema.NotaTransfDestacaICMS;
  edtDiasValidadeOrcamento.Text    := IntToStr(ParSistema.DiasValidadeOrcamento);
  spnSeculo.Value                  := ParSistema.Seculo;
  edtValorQuantidade.Text          := FloatToStr(ParSistema.ValordaQuantidade);
  if parsistema.CorZebradoRelatorio<>'' then
    btnCorZebrado.Color              := TColorRef(strtoint(parsistema.CorZebradoRelatorio));
  ColorDlg.Color                   := btnCorZebrado.Color;
  ckbUsarConsultaInterativa.Checked:= ParSistema.UsarConsultaInterativa;
  ckbAbrirConsultaAutomaticamente.Checked := ParSistema.AbrirConsultaAutomaticamente;
  ckbFrenteCaixaCliente.Checked           := ParSistema.FrenteCaixaComCliente;
  ckbFrenteCaixaVendedor.Checked          := ParSistema.FrenteCaixaComVendedor;
  edtQtdadeMaxFrenteCaixa.Text            := IntToStr(ParSistema.QtdadeMaxFrenteCaixa);
  ckbImprimirNFSFrenteCaixa.Checked       := ParSistema.ImprimirNFSFrenteCaixa;
  edtPercentualDescontoFrenteCaixa.Text   := floattostr(ParSistema.PercentualDescontoFrenteCaixa);
  ckbMostrarFichaSomenteAtraso.Checked    := ParSistema.MostrarFichaSomenteAtraso;
  ckbPerguntarAntesDeExibir.Checked       := ParSistema.PerguntarAntesExibirFicha;
  ckbMostrarSomenteContratosEmAbertoFicha.Checked := ParSistema.MostrarSomenteContratosEmabertoFicha;
  ckbPadraoNotaManual.Checked             := ParSistema.PadraoNotaManual;
  ckbObservacoesAoGravar.Checked          := ParSistema.ObservacoesAoGravarContrato;
  ckbTotalizarBaseComissoes.Checked       := ParSistema.TotalizarBaseComissoes;
  ckbAutenticacaoParcelasModo2.Checked    := ParSistema.AutenticacaoParcelasModo2;
  ckbCFPSOBRIGATORIO.Checked              := ParSistema.CFPSOBRIGATORIO;
  ckbUtilizarFidelidade.Checked           := ParSistema.UtilizarFidelidade;
  ckbPermitirAlterarBrindenoContrato.Checked := ParSistema.PermitirAlterarBrindenoContrato;
  edtBonusPagamentoEmDia.Text             := IntToStr(ParSistema.BonusPagamentoEmDia);
  edtValidadeBonus.Text                   := IntToStr(ParSistema.ValidadeBonus);
  ckbExibirTelaCalculoTroco.Checked       := ParSistema.ExibirTelaCalculoTroco;
  ckbInformarParcelaQuitar.Checked        := ParSistema.InformarParcelaQuitar;
  ckbAnexoContratoReceitaOculos.Checked   := ParSistema.ANEXOCONTRATORECEITAOCULOS;
  ckbGerarContabilidade.Checked           := ParSistema.GERARCONTABILIDADE;
  edtDiasNotaRetroativa.text              := inttostr(ParSistema.DiasNotaRetroativa);

 //  Propriedade provisoria devera de excluida
  rgpAutenticadoras.ItemIndex := ParSistema.Autenticadora-1;
  if ParSistema.EXERCICIOCONTABILIDADE<>0 then
    edtExercicioAtualContabilidade.Text     := inttostr(ParSistema.EXERCICIOCONTABILIDADE);
  dtmParametrosSistema.abrirmascaras;


  ResetModificado(pnlParametros);
  ckbGerarContabilidadeClick(ckbGerarContabilidade);

  if parsistema.PadraoSelecaoConta = 'Por natureza de operação'
  then cmbParametroPadraoConta.ItemIndex := 0
  else cmbParametroPadraoConta.ItemIndex := 1;
  ckbAtualizarDadosClientesContratos.Checked := ParSistema.ATUALIZARDADOSCLIENTESCONTRATOS;
  ckbRelatorioSomenteFiliaisAutorizadas.Checked := ParSistema.RelatorioSomenteFiliaisAutorizadas;
  ckbnaoatualizarprecomenorqueatual.Checked := ParSistema.NaoAtualizarPrecoMenorQueAtual;

  cmbParametroPadraoContaChange(self);
//  cmbParametroPadraoConta.Text := parsistema.PadraoSelecaoConta;
  ckbImprimirContratoSimples.Checked := ParSistema.ImprimirContratoSimples;
  edtMascaraQuantidade.Text := ParSistema.MascaraQuantidade;
  ckbSolicitarAutorizacaoCancelamentoCaixa.Checked := ParSistema.SolicitarAutorizacaoCancelamentoCaixa;
  ckbSolicitarAutorizacaoCancelarContratoFaturado.Checked := ParSistema.AutorizacaoCancelarContratoFaturado;
  edtLimiteDias.Text := IntToStr(ParSistema.LimiteDiasFechamentoCaixa);
  ckbClientesComPlanoPadrao.Checked := ParSistema.ClientesComPlanoPadrao;
  ckbPermitirGravarDocumentossemLancamentos.Checked := ParSistema.PermitirDoctossemLanctosContabeis;
  ckbContabilizacaoporRegimedeCaixa.Checked     := parsistema.Contabilizacaoporregimedecaixa;
  ckbOcultarObservacoesClienteVendedor.Checked  := ParSistema.OcultarObservacoesClienteVendedor;
  ckbGeracaoAutomaticadoImpostoRetido.Checked := ParSistema.GeracaoAutomaticadoImpostoRetido;
  ckbGeracaoAutomaticadoImpostoRetidoClick(self);
  ckbMarcarProdutosParaEntregaContrato.Checked := ParSistema.MarcarProdutosParaEntregaContrato;
  edtObservacaoRodapePedidos.Text := ParSistema.ObservacaoRodapePedidos;
  ckbUsarLimiteAcrescimoFinanceiro.Checked := ParSistema.UsarLimitesAcrescimoFinanceiro;
  ckbGerarParcelaSubstituicaoTributaria.Checked := ParSistema.GerarParcelaSubstituicaoTributaria;
  MonthCalendar1.Repaint;
  if ParSistema.GerarContabilidade then
    dtmParametrosSistema.AbrirContasEntradaseSaidas;
end;

procedure TfrmParametrosSistema.rbnDedicadoClick(Sender: TObject);
begin
  inherited;
  if Sender =  rbnDedicado then
    pgcTipoTEF.ActivePage := tstTEFDedicado
  else if Sender =  rbnDiscado then
    pgcTipoTEF.ActivePage := tstTEFDiscado
  else if Sender = rbnSemTEF then
    pgcTipoTEF.ActivePage := tstTEFNenhum;
end;

procedure TfrmParametrosSistema.rgpParametroChange(Sender: TObject);
begin
  inherited;
  if rbnGlobal.Checked then begin
    sbnExcluir.Enabled := False;
    dbgFiliais.Enabled := False;
    SalvarParametros;
    ParSistema.Filial := -1;
    dtmParametrosSistema.TipoParametroFilial := Global;
    LerParametros
  end else if rbnFilial.Checked then begin
    sbnExcluir.Enabled := True;
    dbgFiliais.Enabled := True;
    SalvarParametros;
    ParSistema.Filial := dtmParametrosSistema.CodigoFilial;
    dtmParametrosSistema.TipoParametroFilial := porFilial;
    LerParametros
  end
end;

function TfrmParametrosSistema.SalvarParametros: Boolean;
var
  tecTEFDedicado: TtecTEFDedicado;
{$IFDEF MSWINDOWS }
  tecTEFDiscado: TtecTEFDiscado;
{$ENDIF}
  CodErroTEF: Integer;
begin
  result := true;
  if ParSistema.ContratoComServico then
    result := dtmParametrosSistema.SalvarImpostosRetidos;
  if not result then
  begin
    pgcParametros.ActivePage := tstRetencoes;
    MensagemAviso(ctPARAMETROSGRAVACAOINCOMPLETOS);
    dbgImpostosRetidos.SetFocus;
  end
  else
  begin
    result := dtmParametrosSistema.SalvarVenctosImpostosRetidosEntradas;
    if not result then
    begin
      pgcParametros.ActivePage := tstRetencoes;
      dbgVenctosImpostosRetidosEntradas.SetFocus;
    end
    else
    begin
      result := dtmParametrosSistema.SalvarMascaraContas and
                dtmParametrosSistema.SalvarParametrosContas and
                dtmParametrosSistema.SalvarCalendario and
                dtmParametrosSistema.SalvarContasContabeis;
      if not result then
      begin
        pgcParametros.ActivePage := tstContabil;
        MensagemAviso(ctPARAMETROSGRAVACAOINCOMPLETOS);
      end
      else
      begin
        result := dtmParametrosSistema.SalvarMascaraBancos;
        if not result then
        begin
          pgcParametros.ActivePage := tstBancos;
          MensagemAviso(ctPARAMETROSGRAVACAOINCOMPLETOS);
        end
        else
        begin
          ParSistema.MascaraQuantidade           := edtMascaraQuantidade.Text;
          ParSistema.GeracaoAutomaticadoImpostoRetido := ckbGeracaoAutomaticadoImpostoRetido.Checked;
          if edtAssinatura1.Modified then
            ParSistema.Assinatura1 := edtAssinatura1.Text;
          if edtAssinatura2.Modified then
            ParSistema.Assinatura2 := edtAssinatura2.Text;
          if edtAssinatura3.Modified then
            ParSistema.Assinatura3 := edtAssinatura3.Text;
          if EdtNumeroCopias.Modified then
            ParSistema.NumeroCopias := StrToInt(EdtNumeroCopias.Text);
          ParSistema.Depositos            := ckbDepositos.Checked;
          ParSistema.Devolucoes           := ckbDevolucoes.Checked;
          ParSistema.DevolucoesSaldo      := ckbDevolucoesTroca.Checked;
          ParSistema.Documentos           := ckbDocumentos.Checked;
          ParSistema.Duplicatas           := ckbDuplicatas.Checked;
          ParSistema.Perdas               := ckbPerdas.Checked;
          ParSistema.Recebimentos         := ckbRecebimentos.Checked;
          ParSistema.ResgateDeCheques     := ckbResgateCheques.Checked;
          ParSistema.Resumo               := ckbResumo.Checked;
          ParSistema.ChequePrazo          := ckbChequePrazo.Checked;
          ParSistema.ChequeVista          := ckbChequeVista.Checked;
          ParSistema.Cancelamentos        := ckbCancelamentos.Checked;
          ParSistema.VisualizarFechamentoCaixa := ckbVisualizarfechamentocaixa.Checked;
          ParSistema.Transferencias       := ckbTransferencias.Checked;
          ParSistema.GerarPrecoAutomatico := ckbGerarPrecoAutomatico.Checked;
          ParSistema.GERARCONTABILIDADE := ckbGerarContabilidade.Checked;
          if edtDiasNotaRetroativa.Modified then
            ParSistema.DiasNotaRetroativa :=  strtoint(edtDiasNotaRetroativa.text);
          ParSistema.AutorizacaoPagtoAutomatica := ckbAutorizacaoPagtoAutomatica.Checked;
          if edtDiasAtraso1.Modified then
            ParSistema.DiasAtraso1        := StrToInt(edtDiasAtraso1.Text);
          if edtDiasAtraso2.Modified then
            ParSistema.DiasAtraso2        := StrToInt(edtDiasAtraso2.Text);
          if edtPercAtrasoMulta1.Modified then
            ParSistema.PercentualAtrasoMultas1 := StrToFloat(edtPercAtrasoMulta1.Text);
          if edtPercAtrasoMulta2.Modified then
            ParSistema.PercentualAtrasoMultas2 := StrToFloat(edtPercAtrasoMulta2.Text);
          if edtPercAtrasoJuros1.Modified then
            ParSistema.PercentualAtrasoJuros1  := StrToFloat(edtPercAtrasoJuros1.Text);
          if edtPercAtrasoJuros2.Modified then
            ParSistema.PercentualAtrasoJuros2  := StrToFloat(edtPercAtrasoJuros2.Text);
          if edtTaxaJuros.Modified then
            ParSistema.TaxaJuros := StrToFloat(edtTaxaJuros.Text);
          if edtAtrasoMinimo.Modified then
            ParSistema.AtrasoMinimo:= StrToInt(edtAtrasoMinimo.Text);
          if edtMaximoParcelas.Modified then
            ParSistema.MaximoParcelasRenegociacao:= StrToInt(edtMaximoParcelas.Text);
          if edtVencimentoPrimeiraParcela.Modified then
            ParSistema.VenctoPrimeiraParcela:= StrToInt(edtVencimentoPrimeiraParcela.Text);
          if edtTetoMetaCobranca.Modified then
            ParSistema.TetoDaMetaCobranca := StrToFloat(edtTetoMetaCobranca.ValorSemFormatacao);
          ParSistema.CobrarMultasJuros := ckbCobrarMultasJuros.Checked;
          ParSistema.RetiraSPCRenegociados := ckbRetiraSPCRenegociados.Checked;
          ParSistema.PermiteReducaoDivida := ckbPermiteReducaoDivida.Checked;
          if edtDescontoPagAntecipado.Modified then
            ParSistema.DescontoPagAntecipado := StrToFloat(edtDescontoPagAntecipado.Text);
          if edtValidadeReserva.Modified then
            ParSistema.ValidadeReserva := StrToInt(edtValidadeReserva.Text);
          if edtTetoMetaVendas.Modified then
            ParSistema.TetoDaMetaVendas := StrToFloat(edtTetoMetaVendas.ValorSemFormatacao);
          ParSistema.UtilizarJurosSimples  := ckbUtilizarJurosSimples.Checked;
          ParSistema.CalculoComTodosPlanos := ckbCalculoTodosPlanos.Checked;
          ParSistema.ObrigaVendedorFrenteCaixa := ckbObrigaVendedorFrenteCaixa.Checked;
          ParSistema.SugerirUsuariOComoVendedorFCx := ckbSugerirUsuarioComoVendedorFrenteCaixa.Checked;
          ParSistema.NaoInformaDadosChequeFCaixa   := ckbNaoInformaDadosChequeFrenteCaixa.Checked;
          ParSistema.MensagemInformarDadosChequeFCaixa := ckbMensagemInformarDadosCheque.Checked;
          ParSistema.exigeSenhaDescontoAlteracaoParcela := ckbExigeSenhaDescontoParcela.Checked;
          ParSistema.MostrarSaldoPagarRecibo := ckbMostraSaldoPagarRecibo.Checked;
          ParSistema.ExigeSenhaGerenteDevolucao:=ckbExigeSenhaGerenteDevolucao.Checked;
          ParSistema.ExigeSenhaAnalistaCreditoDevolucao:=ckbExigeSenhaChefeCreditoDevolucao.Checked;
          ParSistema.UsaProdutoComposto := ckbUsaProdutoComposto.Checked;

          ParSistema.PermiteAlterarPreco   := ckbPermiteAlterarPreco.Checked;
          ParSistema.ExigeanaListaCredito  := ckbExigeAnalistaCredito.Checked;
          ParSistema.PermiteAvalista       := ckbPermiteAvalista.Checked;
          ParSistema.NotaFiscalVinculada   := TtecTIPONOTAFISCAL(cmbNotaFiscalVinculada.ItemIndex);
          ParSistema.ExclusaoOrcamento     := TtecEXCLUSAOORCAMENTO(cmbOperacoesOrcamentos.ItemIndex);
          ParSistema.ExclusaoContrato      := TtecEXCLUSAOCONTRATO(cmbOperacoesContratos.ItemIndex);
          ParSistema.ExclusaoNotaAvulsa    := TtecEXCLUSAONOTAAVULSA(cmbOperacoesNotaAvulsa.ItemIndex);

          if edtSalarioReferencia.Modified then
            ParSistema.SalarioReferencia  := StrToFloat(edtSalarioReferencia.ValorSemFormatacao);
        //  if edtDiretorioImagem.Modified then
        //    ParSistema.DiretorioImagens   := edtDiretorioImagem.Text;
          ParSistema.IcmsSeguro           := dtmParametrosSistema.CodigoSeguro;
          ParSistema.IcmsFrete            := dtmParametrosSistema.CodigoFrete;
          ParSistema.ModeloCarne          := dtmParametrosSistema.CodigoModeloCarne;
          ParSistema.ModeloBoleto         := dtmParametrosSistema.CodigoModeloBoleto;
          ParSistema.ContaEmissaoBoleto   := dtmParametrosSistema.qryContasConta.AsInteger;
          ParSistema.PlanoVendaVista      := dtmParametrosSistema.CodigoPlano;
          ParSistema.PlanoOrcamentoPadrao := dtmParametrosSistema.CodigoPlanoOrcamentoPadrao;
          ParSistema.ModeloContratoMatricial:= dtmParametrosSistema.CodigoModeloContratoMatricial;
          if edtDataContabil.Modified then
            if edtDataContabil.Criticar(True) and (Trim(edtDataContabil.Text) <> '') then
              ParSistema.DataContabil     := StrToDateTime(edtDataContabil.Text)
            else
              Result := False;
          if edtAliquotaCofins.Modified then
            ParSistema.AliquotaCofins     := StrToFloat(edtAliquotaCofins.Text);
          if edtAliquotaPIS.Modified then
            ParSistema.AliquotaPIS        := StrToFloat(edtAliquotaPIS.Text);
          if edtAgencia.Modified then
            ParSistema.Agencia            := StrToInt(edtAgencia.Text);
          if edtNomeContador.Modified then
            ParSistema.NomeContador       := edtNomeContador.Text;
          if edtCRCContador.Modified  then
            ParSistema.CRCContador        := edtCRCContador.Text;
          if edtCPFContador.Modified  then
            ParSistema.CPFContador        := edtCPFContador.Text;
          if edtDDDContador.Modified  then
            ParSistema.DDDContador        := StrToInt(edtDDDContador.Text);
          if edtFoneContador.Modified then
            ParSistema.TelefoneContador   := StrToInt(edtFoneContador.Text);
          if edtEmailContador.Modified then
            ParSistema.EmailContador      := edtEmailContador.Text;
          if edtResponsavelLivros1.Modified then
            ParSistema.ResponsavelLivros1 := edtResponsavelLivros1.Text;
          if edtResponsavelLivros2.Modified then
            ParSistema.ResponsavelLivros2 := edtResponsavelLivros2.Text;
          parsistema.LivrosFiscaisFolhaouPagina := rgpFormaLivros.ItemIndex;
          ParSistema.ConfirmaRecebimentoAvisoSPC := ckbConfirmaRecebimentoAvisoSPC.Checked;
          ParSistema.InscreveSPCClienteCartaDevolvida := ckbInscreverSPCCartasDevolvidas.Checked;
          ParSistema.RegistraAvalistaNoSPC       := ckbRegistraAvalistaNoSPC.Checked;
          Parsistema.InscreverPessoaJuridicaSPC  := ckbInscreverpessoajuridicaSPC.Checked;
          Parsistema.DiasEntradaSPC              := strtoint(edtRegistrodiasSPC.Text);
          ParSistema.DiasNovaInscricaoSPC        := strtoint(edtdiasNovaInscricao.Text);
          ParSistema.ControleSPCCentralizado     := ckbSPCCentralizado.checked;
          ParSistema.MaximoEntradaSPC            := strtoint (edtMaximoATraso.text);
          ParSistema.ClientePessoaJuridica       := ckbClientePessoaJuridica.Checked;
          ParSistema.NumeroProcessoAutorizacao   := Trim(edtNroProcAutPresumido.Text);
        {  if edtEmailEmpresa.Modified then
            ParSistema.EmailEmpresa      := edtEmailEmpresa.Text;
          if edtHost.Modified then
            ParSistema.Host := edtHost.Text;
          if edtSenha.Modified then
            ParSistema.Senha := edtSenha.Text;
          if edtUsuario.Modified then
            ParSistema.Usuario := edtUsuario.Text;}
          if edtEnderecoLogotipo.Modified then
            ParSistema.EnderecoLogotipo:= edtEnderecoLogotipo.Text;
          if edtSiteEmpresa.Modified then
            ParSistema.SiteEmpresa:= edtSiteEmpresa.Text;
        //  if edtDiretorioImagem.Modified then
        //    ParSistema.DiretorioImagens:= edtDiretorioImagem.Text;
          ParSistema.ContratoComServico := ckbContratoComServico.Checked;
          ParSistema.ClienteComDependentes := ckbClienteComDependentes.Checked;
          ParSistema.PesquisaPadraoProdutoCodigoBarras:=ckbPesquisaPadraoProdutoCodigoBarras.Checked;
          ParSistema.RequisicaoSubtraiEstoque:=ckbRequisicaoSubtraiEstoque.Checked;
          if edtDataInicialSaldoAcumulado.Modified then
            if edtDataInicialSaldoAcumulado.Criticar(True) and (Trim(edtDataInicialSaldoAcumulado.Text) <> '') then
                 ParSistema.DataInicialFluxoCaixa := StrToDateTime(edtDataInicialSaldoAcumulado.Text)
            else Result := False;
          if edtBancoDataInicial.Modified then
            if edtBancoDataInicial.Criticar(True) and (Trim(edtBancoDataInicial.Text) <> '') then
                 ParSistema.BancoDataInicial:= StrToDateTime(edtBancoDataInicial.Text)
            else Result := False;
          if edtBancoDataFinal.Modified then
            if edtBancoDataFinal.Criticar(True) and (Trim(edtBancoDataFinal.Text) <> '') then
                 ParSistema.BancoDataFinal:= StrToDateTime(edtBancoDataFinal.Text)
            else Result := False;
          if edtInicioIntegracaoBancos.Modified then
            if edtInicioIntegracaoBancos.Criticar(True) and (Trim(edtInicioIntegracaoBancos.Text) <> '') then
                 ParSistema.InicioIntegracaoBancos:= StrToDateTime(edtInicioIntegracaoBancos.Text)
            else Result := False;

          ParSistema.NdiasparaLiberacaoCobranca := edtNdiasparaLiberacaoCobranca.ValorSemFormatacao;

  //    if edtSaldoInicial.Modified then
  //        ParSistema.SaldoInicialFluxoCaixa := StrToFloat(edtSaldoInicial.ValorSemFormatacao);
          ParSistema.FaturarAlteraPercelas := ckbFaturarAlteraParcelas.Checked;
          Parsistema.CreditarICMSDevolucao := ckbCreditarICMS.Checked;
          if edtDiasCreditarICMS.Modified then
            if edtDiasCreditarICMS.Text<>'' then
              ParSistema.DiasCreditarICMS := StrToInt(edtDiasCreditarICMS.Text)
            else ParSistema.DiasCreditarICMS := 0;

        {  if rbnExcluirContratoSempre.Checked then
            ParSistema.ExclusaoContrato := excEXCLUIR
          else if rbnCancelarContratoSempre.Checked then
            ParSistema.ExclusaoContrato := excCANCELAR
          else if rbnPerguntarQualOperacao.Checked then
            ParSistema.ExclusaoContrato := excPERGUNTAR;

          if rbnExcluirOrcamentoSempre.Checked then
            ParSistema.ExclusaoOrcamento := exoEXCLUIR
          else if rbnCancelarOrcamentoSempre.Checked then
            ParSistema.ExclusaoOrcamento := exoCANCELAR
          else if rbnPerguntarSempre.Checked then
            ParSistema.ExclusaoOrcamento := exoPERGUNTAR;}
          ParSistema.SolicitarAutorizacaoVendaFutura:= ckbSolicitarAutorizacaoVendaFutura.Checked;
          ParSistema.GerarCodigoProdutoAutomatico := ckbGerarCodigoProdutoAutomatico.Checked;
          ParSistema.PermitiProdutoMesmaDescricao := ckbDescricaoProduto.Checked;
          ParSistema.UsarCodigoBarras             := ckbUsarCodigoBarras.Checked;
          ParSistema.IncluirEstoqueAutomatico     := ckbIncluirEstoqueAutomatico.Checked;
          ParSistema.VaiCartasefoiAnterior        := ckbVaiCartasefoiAnterior.Checked;
          ParSistema.ControlarSomente2Devolucao   := ckbControlarSomente2Devolucao.Checked;
          ParSistema.LeitoraChequePortaSerial     := ckbLeitoraChequePortaSerial.Checked;
          ParSistema.ExibirAtrasoMedioParcelas    := ckbExibirAtrasoMedioParcelas.Checked;
          ParSistema.CPF_CNPJObrigatorio          := ckbCPFCNPJObrigatorio.Checked;
          ParSistema.CNPJOpcionalNFEntrada        := ckbCNPJOpcionalNFEntrada.Checked;
          ParSistema.ExibirDescontoSugerido       := ckbExibirDescontoSugerido.Checked;
          ParSistema.ImprimirCarneAoFaturar       := ckbImprimirCarneFaturar.Checked;
          ParSistema.UtilizarListaCasamento       := ckbUtilizarListaCasamento.Checked;
          ParSistema.UtilizarPrecoFilialBase      := ckbUtilizarPrecodaFilialBase.Checked;
          ParSistema.SoVisualizarEstoqueDeposito  := ckbSoVisualizarEstoqueDeposito.Checked;
          ParSistema.IncluirContratoTrocaEquivalente := ckbIncluirContratoTrocaEquivalente.Checked;
          ParSistema.utilizarcreditotrocacontrato := ckbUtilizarCreditoTrocaContrato.Checked;
          Parsistema.Imprimircontratomatricial    := ckbimprimircontratomatricial.checked;
          Parsistema.ImprimirTaxadeJuros    := ckbImprimirTaxasJuros.checked;
          ParSistema.PesquisaSomenteEstoqueFilialBaseVendas:=ckbPesquisaSomenteEstoqueFilialBaseVendas.Checked;
          ParSistema.MostrarSimilaresContrato:=ckbMostrarSimilaresContrato.Checked;
          ParSistema.GravarProdutoContratoAutomaticamente:=ckbGravarProdutoAutomaticamente.Checked;
          ParSistema.PermitirAlterarVenctoCaixa   := ckbPermitirAlterarPagtoCaixa.Checked;
          ParSistema.ImprimirReciboAcumulado      := ckbImprimirReciboAcumulado.Checked;
          ParSistema.MultiploPreco                := StrToFloat(edtMultiploPreco.Text);
          ParSistema.SaldoCaixaNegativo           := ckbSaldoCaixaNegativo.Checked;
          ParSistema.FaturarVendaVista            := ckbFaturarVendaVista.Checked;
          ParSistema.ImpCarneVendaVista           := ckbImpCarneVendaVista.Checked;
          ParSistema.Replicar_Fornecedores        := ckbReplicarFornecedores.Checked;
          ParSistema.MostrarFichaSomenteAtraso    := ckbMostrarFichaSomenteAtraso.Checked;
          ParSistema.PerguntarAntesExibirFicha    := ckbPerguntarAntesDeExibir.Checked;
          ParSistema.MostrarSomenteContratosEmabertoFicha := ckbMostrarSomenteContratosEmAbertoFicha.Checked;
          ParSistema.PadraoNotaManual             := ckbPadraoNotaManual.Checked;
          ParSistema.ObservacoesAoGravarContrato  := ckbObservacoesAoGravar.Checked;
          ParSistema.TotalizarBaseComissoes       := ckbTotalizarBaseComissoes.Checked;
          ParSistema.CFPSOBRIGATORIO              := ckbCFPSOBRIGATORIO.Checked;
          parsistema.PadraoSelecaoConta           := cmbParametroPadraoConta.Text;

          if edtArredondamentoJuros.Modified then
              ParSistema.ArredondamentoJurosCaixa     := StrToFloat(edtArredondamentoJuros.Text);
          if edtDiasValidadeOrcamento.Modified then
             ParSistema.DiasValidadeOrcamento      := StrToInt(edtDiasValidadeOrcamento.Text);

          ParSistema.Seculo := spnSeculo.Value;

          if edtValorQuantidade.Modified then
           ParSistema.ValordaQuantidade      := StrToFloat(edtValorQuantidade.Text);
          if (inttostr(tcolorref(ColorDlg.Color))<>'') and
             (tcolorref(ColorDlg.Color)<>tcolorref(clWhite)) then
              Parsistema.CorZebradoRelatorio := inttostr(tcolorref(ColorDlg.Color))
          else
            Parsistema.CorZebradoRelatorio := inttostr(tcolorref(clnone));

          ParSistema.UsarConsultaInterativa      := ckbUsarConsultaInterativa.Checked;
          ParSistema.AbrirConsultaAutomaticamente:= ckbAbrirConsultaAutomaticamente.Checked;

          if pgcTipoTEF.ActivePage = tstTEFDedicado then
            ParSistema.TipoTEF := tsDEDICADO
          else if pgcTipoTEF.ActivePage = tstTEFDiscado then
            ParSistema.TipoTEF := tsDISCADO
          else if pgcTipoTEF.ActivePage = tstTEFNenhum then
            ParSistema.TipoTEF := tsSEMTEF;
          if ParSistema.TipoTEF = tsDEDICADO then begin
            if Trim(edtTerminalTEF.Text) = '' then
              MensagemAviso(ctTEFTERMINALNULO)
            else if Trim(edtIPTEF.Text) = '' then
              MensagemAviso(ctTEFIPNULO)
            else begin
              CodErroTEF := TtecTEFDedicado.Terminal(Trim(edtTerminalTEF.Text));
              if CodErroTEF <> ctCODOK then
                MensagemErro(TtecTEFDedicado.MsgErro(CodErroTEF))
              else begin
                tecTEFDedicado := TtecTEFDedicado.Create;
                try
                  if edtLojaTEF.Modified then begin
                    tecTEFDedicado.Loja := edtLojaTEF.Text;
                    ParSistema.LojaTEF := edtLojaTEF.Text;
                  end;
                  if edtIPTEF.Modified then begin
                    tecTEFDedicado.ServerIP := edtIPTEF.Text;
                    ParSistema.IPTEF := edtIPTEF.Text;
                  end;
                  if edtMensagemTEF.Modified then begin
                    if tecTEFDedicado.Terminal <> '' then begin
                      tecTEFDedicado.ConfigurarTEF;
                      if tecTEFDedicado.ExistePinPad then
                        tecTEFDedicado.MensagemPermanentePinPad := edtMensagemTEF.Text;
                    end;
                    ParSistema.MensagemTEF := edtMensagemTEF.Text
                  end;
                finally
                  tecTEFDedicado.Free;
                end
              end
            end;
        {$IFDEF MSWINDOWS}
            TtecTEFDiscado.DiretorioRequisicao('');
            TtecTEFDiscado.DiretorioResposta('');
            TtecTEFDiscado.ExecutavelTEF('');
        {$ENDIF}
            lblTEFArqRequisicao.Caption := '';
            lblTEFArqResposta.Caption   := '';
            lblTEFArqPrograma.Caption   := '';
          end else if ParSistema.TipoTEF = tsDISCADO then begin
        {$IFDEF MSWINDOWS}
            TtecTEFDiscado.DiretorioRequisicao(lblTEFArqRequisicao.Caption);
            TtecTEFDiscado.DiretorioResposta(lblTEFArqResposta.Caption);
            TtecTEFDiscado.ExecutavelTEF(lblTEFArqPrograma.Caption);
            tecTEFDiscado := TtecTEFDiscado.Create;
            try
              if Not tecTEFDiscado.GerenciadorAtivo(False) then begin
                Result := False;
                MensagemErro(ctTEFTEGERENCIADORINATIVO);
              end
            finally
              tecTEFDiscado.Free
            end;
        {$ENDIF}
            ParSistema.LojaTEF  := '';
            ParSistema.IPTEF    := '';
            edtLojaTEF.Text     := '';
            edtIPTEF.Text       := '';
            edtTerminalTEF.Text := '';
            edtMensagemTEF.Text := '';

          end else begin
        {$IFDEF MSWINDOWS}
            TtecTEFDiscado.DiretorioRequisicao('');
            TtecTEFDiscado.DiretorioResposta('');
            TtecTEFDiscado.ExecutavelTEF('');
        {$ENDIF}
            ParSistema.LojaTEF          := '';
            ParSistema.IPTEF            := '';
            edtLojaTEF.Text             := '';
            edtIPTEF.Text               := '';
            edtTerminalTEF.Text         := '';
            edtMensagemTEF.Text         := '';
            lblTEFRequisicao.Caption    := '';
            lblTEFResposta.Caption      := '';
            lblTEFPrograma.Caption      := '';
            lblTEFArqRequisicao.Caption := '';
            lblTEFArqResposta.Caption   := '';
            lblTEFArqPrograma.Caption   := '';
          end;
          ParSistema.QtdeViaTEFDiscado         := StrToInt(edtNroViasTEF.Text);
          ParSistema.TotalizadorAutenticacao   := edtTotalizadorAutenticacao.Text;
          ParSistema.ValorMaxDescontoAlteracaoParcela := StrToFloat(edtValorMaxDescAlteracaoParcela.ValorSemFormatacao);
          ParSistema.RetirarPISCONFINSCalPreco := ckbRetirarPISCONFINSCalculoPreco.Checked;
          ParSistema.PermitirGravacaoNFEParcial := ckbPermitirGravacaoNFEParcial.Checked;
          ParSistema.VincularAutomaticoProdutoFornecedor:=ckbVincuarAutomaticoProdutoFornecedor.Checked;
          ParSistema.NaorateardescontoparacalculodeprecodevendanaNFE := ckbNaorateardescontoparacalculodeprecodevendanaNFE.Checked;
          ParSistema.SugestaoPeloPrecoVenda    := ckbSugerirPrecoPeloPrecoVenda.Checked;
          ParSistema.BloquearNotaComPedido     := ckbBloquearNotaEntradaComPedido.Checked;
          if rbnCalcularPrecoPedido.Checked then
            ParSistema.LocalCalculoPreco := lcpPEDIDO
          else if rbnCalcularPrecoNota.Checked then
            ParSistema.LocalCalculoPreco := lcpNOTAENTRADA
          else if rbnCalcularPrecoAmbos.Checked then
            ParSistema.LocalCalculoPreco := lcpAMBOS;
          ParSistema.FiliaisIndependentes   := ckbFilialIndependente.Checked;
          ParSistema.UsarGradesProdutos     := ckbUsarGradesProdutos.Checked;
          ParSistema.NotaTransfDestacaICMS  := ckbNotaTransfDestacaICMS.Checked;
          ParSistema.FrenteCaixaComVendedor := ckbFrenteCaixaVendedor.Checked;
          ParSistema.FrenteCaixaComCliente  := ckbFrenteCaixaCliente.Checked;
          ParSistema.QtdadeMaxFrenteCaixa   := StrToInt(edtQtdadeMaxFrenteCaixa.ValorSemFormatacao);
          ParSistema.ImprimirNFSFrenteCaixa := ckbImprimirNFSFrenteCaixa.Checked;
         //  Propriedade provisoria devera de excluida
          ParSistema.Autenticadora := rgpAutenticadoras.ItemIndex+1;
          ParSistema.PercentualDescontoFrenteCaixa := strtofloat(edtPercentualDescontoFrenteCaixa.Text);
          ParSistema.AutenticacaoParcelasModo2        := ckbAutenticacaoParcelasModo2.Checked;
          ParSistema.UtilizarFidelidade               := ckbUtilizarFidelidade.Checked;
          parsistema.PermitirAlterarBrindenoContrato := ckbPermitirAlterarBrindenoContrato.Checked;        
          if ParSistema.UtilizarFidelidade then
          begin
            ParSistema.BonusPagamentoEmDia              := StrToInt(edtBonusPagamentoEmDia.Text);
            ParSistema.ValidadeBonus                    := StrToInt(edtValidadeBonus.Text);
            dtmParametrosSistema.SalvarBonusValorCompra;
          end;
          ParSistema.ExibirTelaCalculoTroco := ckbExibirTelaCalculoTroco.Checked;
          ParSistema.InformarParcelaQuitar  := ckbInformarParcelaQuitar.Checked;
          ParSistema.ANEXOCONTRATORECEITAOCULOS := ckbAnexoContratoReceitaOculos.Checked;
          if edtExercicioAtualContabilidade.text <> '' then
             Parsistema.EXERCICIOCONTABILIDADE := strtoint(edtExercicioAtualContabilidade.text);
          ParSistema.ATUALIZARDADOSCLIENTESCONTRATOS := ckbAtualizarDadosClientesContratos.Checked;
          parsistema.RelatorioSomenteFiliaisAutorizadas := ckbRelatorioSomenteFiliaisAutorizadas.Checked;
          ParSistema.NaoAtualizarPrecoMenorQueAtual  := ckbnaoatualizarprecomenorqueatual.Checked;
          ParSistema.ImprimirContratoSimples := ckbImprimirContratoSimples.Checked;
          ParSistema.SolicitarAutorizacaoCancelamentoCaixa := ckbSolicitarAutorizacaoCancelamentoCaixa.Checked;
          ParSistema.AutorizacaoCancelarContratoFaturado := ckbSolicitarAutorizacaoCancelarContratoFaturado.Checked;
          ParSistema.LimiteDiasFechamentoCaixa := StrToInt(edtLimiteDias.Text);
          ParSistema.ClientesComPlanoPadrao := ckbClientesComPlanoPadrao.Checked;
          ParSistema.PermitirDoctossemLanctosContabeis := ckbPermitirGravarDocumentossemLancamentos.Checked;
          parsistema.Contabilizacaoporregimedecaixa := ckbContabilizacaoporRegimedeCaixa.Checked;
          ParSistema.OcultarObservacoesClienteVendedor := ckbOcultarObservacoesClienteVendedor.Checked;
          ParSistema.MarcarProdutosParaEntregaContrato := ckbMarcarProdutosParaEntregaContrato.Checked;
          ParSistema.ObservacaoRodapePedidos := edtObservacaoRodapePedidos.Text;
          ParSistema.UsarLimitesAcrescimoFinanceiro := ckbUsarLimiteAcrescimoFinanceiro.Checked;
          ParSistema.GerarParcelaSubstituicaoTributaria := ckbGerarParcelaSubstituicaoTributaria.Checked;

          AtualizaINISection;
        end;
      end;
    end;
  end;
end;

procedure TfrmParametrosSistema.sbnExcluirClick(Sender: TObject);
begin
  inherited;
  InternoExcluir;
end;

procedure TfrmParametrosSistema.sbnPlanosClick(Sender: TObject);
begin
  inherited;
  TipoConsulta := pscPLANO;
  InternoPesquisar(edfPlanos, ctPLANOSPAGAMENTOS)
end;

procedure TfrmParametrosSistema.sbnProcuraFreteClick(Sender: TObject);
begin
  inherited;
  TipoConsulta := pscFRETE;
  InternoPesquisar(edfICMSFrete, ctFRETE)
end;

procedure TfrmParametrosSistema.sbnProcuraModeloCarneClick(Sender: TObject);
begin
  inherited;
  TipoConsulta := pscCARNE;
  InternoPesquisar(edfModeloCarne, ctCARNE)
end;

procedure TfrmParametrosSistema.sbnProcuraSeguroClick(Sender: TObject);
begin
  inherited;
  TipoConsulta := pscSEGURO;
  InternoPesquisar(edfICMSSeguro, ctSEGURO)
end;

{procedure TfrmParametrosSistema.sbnProcuraLogotipoClick(Sender: TObject);
begin
  inherited;
  if dlgPastaImagem.Execute then
    edtDiretorioImagem.text:=ExtractFilePath(dlgPastaImagem.FileName)
end;}


procedure TfrmParametrosSistema.sbnSalvarClick(Sender: TObject);
begin
  inherited;
  InternoGravar;
end;

procedure TfrmParametrosSistema.sbnTEFExecClick(Sender: TObject);
begin
  inherited;
  if dlgExecTEF.Execute then
    lblTEFArqPrograma.Caption := dlgExecTEF.FileName
end;

procedure TfrmParametrosSistema.sbnTEFReqClick(Sender: TObject);
var
{$ifdef ver150}
  Dir: WideString;
{$else }
  Dir: String;
{$endif}
begin
  inherited;
  if SelectDirectory('Diretório de Requisição TEF', '', Dir) then
    lblTEFArqRequisicao.Caption := Dir;
end;

procedure TfrmParametrosSistema.sbnTEFRespClick(Sender: TObject);
var
{$ifdef ver150}
  Dir: WideString;
{$else }
  Dir: String;
{$endif}
begin
  inherited;
  if SelectDirectory('Diretório de Resposta TEF', '', Dir) then
    lblTEFArqResposta.Caption := Dir;
end;

function TfrmParametrosSistema.TabelaDePesquisa: TZDataSet;
begin
  case TipoConsulta of
   pscCONTAEMISSAOBOLETO  : result := dtmParametrosSistema.qryConsultaContas;
   pscFRETE               : Result := dtmParametrosSistema.TabelaConsultaFrete;
   pscSEGURO              : Result := dtmParametrosSistema.TabelaConsultaSeguro;
   pscCARNE               : Result := dtmParametrosSistema.TabelaConsultaModeloCarne;
   pscBOLETO              : Result := dtmParametrosSistema.TabelaConsultaModeloBoleto;
   pscPLANO,
   pscPLANOORCAMENTOPADRAO: Result := dtmParametrosSistema.TabelaConsultaPlano;
   pscCONTRATOMATRICIAL   : Result := dtmParametrosSistema.TabelaConsultaModeloContratoMatricial;
   pscDebitarVendaaVista,
   pscCreditarVendaaVista,
   pscDebitarVendaaPrazo,
   pscCreditarVendaaPrazo,
   pscDebitarAbatimentos,
   pscCreditarAbatimentos,
   pscDebitarDevolucoes,
   pscCreditarDevolucoes,
   pscContaContabilEntrada,
   pscContaContabilSaida  : result := dtmParametrosSistema.qryconsultacontacontabil;
   pscHistoricoVendaaVista,
   pscHistoricoVendaaPrazo,
   pscHistoricoAbatimentos,
   pscHistoricoDevolucoes  : result:= dtmParametrosSistema.qryconsultahistorico;
  else                      Result := nil;
  end
end;

procedure TfrmParametrosSistema.sbnPlanoOrcamentoPadraoClick(
  Sender: TObject);
begin
  inherited;
  TipoConsulta := pscPLANOORCAMENTOPADRAO;
  InternoPesquisar(edfPlanoOrcamentoPadrao, ctPLANOSPAGAMENTOS)
end;

procedure TfrmParametrosSistema.btnCorZebradoClick(Sender: TObject);
begin
  inherited;
  if ColorDlg.Execute then
    btnCorZebrado.Color := ColorDlg.Color;
end;

procedure TfrmParametrosSistema.sbnProcuraModeloBoletoClick(Sender: TObject);
begin
  inherited;
  TipoConsulta := pscBoleto;
  InternoPesquisar(edfModeloBoleto, ctBoleto)
end;

procedure TfrmParametrosSistema.ckbFrenteCaixaVendedorClick(
  Sender: TObject);
begin
  inherited;
  if TCheckBox(Sender).Checked then
  begin
    ckbObrigaVendedorFrenteCaixa.Enabled := True;
    ckbSugerirUsuarioComoVendedorFrenteCaixa.Enabled := True;
  end
  else
  begin
    ckbObrigaVendedorFrenteCaixa.Enabled := False;
    ckbSugerirUsuarioComoVendedorFrenteCaixa.Enabled := False;
    ckbObrigaVendedorFrenteCaixa.Checked := False;
    ckbSugerirUsuarioComoVendedorFrenteCaixa.Checked := False;
  end;
end;

procedure TfrmParametrosSistema.ckbNaoInformaDadosChequeFrenteCaixaClick(
  Sender: TObject);
begin
  inherited;
  if TCheckBox(Sender).Checked then
  begin
    ckbMensagemInformarDadosCheque.Enabled := True;
  end
  else
  begin
    ckbMensagemInformarDadosCheque.Checked := False;
    ckbMensagemInformarDadosCheque.Enabled := False;
  end;
end;

procedure TfrmParametrosSistema.sbnModeloContratoMatricialClick(
  Sender: TObject);
begin
  inherited;
  TipoConsulta := pscCONTRATOMATRICIAL;
  InternoPesquisar(edfModeloContratoMatricial, ctCONTRATOMATRICIAL)
end;

procedure TfrmParametrosSistema.sbnExcluirImpostoRetidoClick(
  Sender: TObject);
begin
  inherited;
  dtmParametrosSistema.ExcluirImpostoRetido;
end;

procedure TfrmParametrosSistema.dbgImpostosRetidosDblClick(
  Sender: TObject);
begin
  inherited;
  if dbgImpostosRetidos.SelectedIndex = 4 then
    dtmParametrosSistema.marcarcamporeter;
end;

procedure TfrmParametrosSistema.dbgImpostosRetidosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then
      if dbgImpostosRetidos.SelectedIndex = 4 then
        dbgImpostosRetidosDblClick(self);
end;

procedure TfrmParametrosSistema.dbgBonusValorCompraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP:     dtmParametrosSistema.verificaPreenchimentoBonus;
  end;
end;

procedure TfrmParametrosSistema.sbnExcluirValorCompraClick(
  Sender: TObject);
begin
  inherited;
  dtmParametrosSistema.ExcluirBonusValorCompra;
end;

procedure TfrmParametrosSistema.ckbUtilizarFidelidadeClick(
  Sender: TObject);
begin
  inherited;
  tstFidelidade.TabVisible := ckbUtilizarFidelidade.Checked;
end;

procedure TfrmParametrosSistema.ckbGerarContabilidadeClick(
  Sender: TObject);
begin
  inherited;
  tstContabil.TabVisible := ckbGerarContabilidade.Checked;
end;

procedure TfrmParametrosSistema.cmbParametroPadraoContaChange(
  Sender: TObject);
begin
  inherited;
  pgcContasContabeis.Visible := (cmbParametroPadraoConta.ItemIndex = 1);
  rgpTipoSugestao.Visible := pgcContasContabeis.Visible;
  if rgpTipoSugestao.Visible then
    rgpTipoSugestaoClick(self);
end;

procedure TfrmParametrosSistema.sbnConsultaDebitarVendaVistaClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkDebitarVendaaVista, ctCONTADEBITO)

end;

procedure TfrmParametrosSistema.sbnConsultaCreditarVendaVistaClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkCreditarVendaVista, ctCONTACREDITO)

end;

procedure TfrmParametrosSistema.sbnConsultaHistoricoVendaaVistaClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkHistoricoVendaaVista, ctHISTORICO)

end;

procedure TfrmParametrosSistema.sbnConsultaDebitarVendaPrazoClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkDebitarVendaaPrazo, ctCONTADEBITO)

end;

procedure TfrmParametrosSistema.sbnConsultaCreditarVendaPrazoClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkCreditarVendaPrazo, ctCONTACREDITO)

end;

procedure TfrmParametrosSistema.sbnConsultaHistoricoVendaaPrazoClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkHistoricoVendaaPrazo, ctHISTORICO)

end;

procedure TfrmParametrosSistema.sbnConsultaDebitarAbatimentosClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkDebitarAbatimentos, ctCONTADEBITO)

end;

procedure TfrmParametrosSistema.sbnConsultaCreditarAbatimentosClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkCreditarAbatimentos, ctCONTACREDITO)

end;

procedure TfrmParametrosSistema.sbnConsultaHistoricoAbatimentosClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkHistoricoAbatimentos, ctHISTORICO)

end;

procedure TfrmParametrosSistema.sbnConsultaDebitarDevolucoesClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkDebitarDevolucoes, ctCONTADEBITO)

end;

procedure TfrmParametrosSistema.sbnConsultaCreditarDevolucoesClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkCreditarDevolucoes, ctCONTACREDITO)

end;

procedure TfrmParametrosSistema.sbnConsultaHistoricoDevolucoesClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkHistoricoDevolucoes, ctHISTORICO)
end;

procedure TfrmParametrosSistema.rgpTipoSugestaoClick(Sender: TObject);
begin
  inherited;
  dtmParametrosSistema.TipoSugestao := rgptipoSugestao.itemindex;
end;

procedure TfrmParametrosSistema.cmbMascaraQuantidadeChange(
  Sender: TObject);
begin
  inherited;
  edtMascaraQuantidade.Text := cmbMascaraQuantidade.Text;
end;

procedure TfrmParametrosSistema.sbnProcurarContaClick(Sender: TObject);
begin
  inherited;
  TipoConsulta := pscCONTAEMISSAOBOLETO;
  InternoPesquisar(edfConta, ctCONTAS)
end;

{
procedure TfrmParametrosSistema.MonthCalendar1BoldDays(Sender: TObject;
  mStart, mEnd: TDateTime; var BoldDays: TBoldDays);
begin
  inherited;
//  dtmParametrosSistema.VerificarFeriados(BoldDays, mStart);
end;
 }

procedure TfrmParametrosSistema.MonthCalendar1DblClick(Sender: TObject);
begin
  inherited;
{ dtmParametrosSistema.VerificarFeriados(BoldDays, mStart,);}

end;

procedure TfrmParametrosSistema.MonthCalendar1BoldDays(Sender: TObject;
  mStart, mEnd, mFeriado: TDateTime; var SituacaoFeriado: Boolean;
  Setar: Boolean; var BoldDays: TBoldDays);
begin
  inherited;
  dtmParametrosSistema.VerificarFeriados(BoldDays, mFeriado,
                                         SituacaoFeriado, Setar);

end;

procedure TfrmParametrosSistema.dbgVenctosImpostosRetidosEntradasDblClick(
  Sender: TObject);
begin
  inherited;
  if dbgVenctosImpostosRetidosEntradas.SelectedIndex = 1 then
  begin
    dtmParametrosSistema.MarcarCampoQuinzenal;
    DoScrollVenctosImpostosRetidosEntradas(self);
  end;
end;

procedure TfrmParametrosSistema.dbgVenctosImpostosRetidosEntradasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then
      if dbgVenctosImpostosRetidosEntradas.SelectedIndex = 1 then
        dbgVenctosImpostosRetidosEntradasDblClick(self);
end;

procedure TfrmParametrosSistema.DoScrollVenctosImpostosRetidosEntradas(
  Sender: TObject);
begin
    if dtmParametrosSistema.qryVenctosImpostosRetidosEntradasquinzenal.AsBoolean then
      dbgVenctosImpostosRetidosEntradas.Columns[4].PickList := slPickListQuinzena
    else
      dbgVenctosImpostosRetidosEntradas.Columns[4].PickList := slPickListMensal;
end;

procedure TfrmParametrosSistema.ckbGeracaoAutomaticadoImpostoRetidoClick(
  Sender: TObject);
begin
  inherited;
  if ckbGeracaoAutomaticadoImpostoRetido.Checked then
  begin
    dbgVenctosImpostosRetidosEntradas.Visible := true;
    fraConsultaFornecedor.Visible := true;
    dtmParametrosSistema.VerificarVenctosImpostosRetidosEntradas;
  end
  else
  begin
    dbgVenctosImpostosRetidosEntradas.Visible := false;
    fraConsultaFornecedor.Visible := false;
  end;
end;

procedure TfrmParametrosSistema.dbgEntradasDblClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  InternoPesquisar(ctCONTAS);
end;

procedure TfrmParametrosSistema.dbgSaidasDblClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  InternoPesquisar(ctCONTAS);
end;

end.


