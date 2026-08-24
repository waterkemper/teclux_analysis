inherited frmTecsoft: TfrmTecsoft
  Tag = 10
  Left = 96
  Top = 182
  Width = 1612
  Height = 876
  VertScrollBar.Range = 27
  Caption = 'tecSOFT'
  Color = clWindow
  TransparentColorValue = clBtnFace
  DefaultMonitor = dmMainForm
  FormStyle = fsMDIForm
  KeyPreview = False
  Menu = mmuTecsoft
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 16
  inherited stbPrincipal: TStatusBar
    Top = 789
    Width = 1592
    Height = 25
    Panels = <
      item
        Text = 'INS'
        Width = 50
      end
      item
        Alignment = taCenter
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        Width = 100
      end
      item
        Width = 70
      end>
    SimplePanel = False
  end
  object pnlTopoJanela: TPanel
    Left = 0
    Top = 0
    Width = 1592
    Height = 2
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
  end
  object mmuTecsoft: TMainMenu
    Left = 449
    Top = 144
    object mitCadastros: TMenuItem
      Tag = 1
      AutoHotkeys = maAutomatic
      Caption = '&Cadastros'
      object mitCadastroBancos: TMenuItem
        Caption = '&Bancos'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroClientes: TMenuItem
        Caption = '&Clientes'
        OnClick = ExecutarItemMenu
      end
      object mitUnificarClientes: TMenuItem
        Caption = 'Unificar Clientes'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroEnderecos: TMenuItem
        Caption = 'En&dere'#231'os'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroFiliais: TMenuItem
        Caption = '&Filiais'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroFornecedores: TMenuItem
        Caption = 'Forn&ecedores'
        OnClick = ExecutarItemMenu
      end
      object mitListasPadrao: TMenuItem
        Caption = 'Listas Padr'#227'o'
        OnClick = ExecutarItemMenu
      end
      object mitConsultaListasPadrao: TMenuItem
        Caption = 'Consulta de Listas Padr'#227'o'
        OnClick = ExecutarItemMenu
      end
      object mitListaCasamento: TMenuItem
        Caption = '&Listas de Casamento'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroCaracteristicas: TMenuItem
        Caption = '&Produtos'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroEquipamentos: TMenuItem
        Caption = 'Equipa&mentos'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroServicos: TMenuItem
        Caption = '&Servi'#231'os'
        OnClick = ExecutarItemMenu
      end
      object mitLogs: TMenuItem
        Tag = 1
        Caption = '&Logs'
        object mitLogProdutos: TMenuItem
          Caption = 'Produtos'
          OnClick = ExecutarItemMenu
        end
      end
      object mitTabelas: TMenuItem
        Tag = 1
        Caption = '&Tabelas'
        object mitCadastroTabelasCrediario: TMenuItem
          Caption = '&Credi'#225'rio'
          OnClick = ExecutarItemMenu
        end
        object mitImpostos: TMenuItem
          Caption = 'Impostos'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroPlanosPagamentos: TMenuItem
          Caption = '&Planos de Pagamentos'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroGrupoFiliais: TMenuItem
          Caption = 'G&rupos de Filiais'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroGruposUsuarios: TMenuItem
          Caption = 'Gr&upos de Usu'#225'rios'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroTabelasEstoque: TMenuItem
          Caption = '&Estoque'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroCategorias: TMenuItem
          Caption = '&Categorias'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroEventos: TMenuItem
          Caption = 'E&ventos'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroHistoricos: TMenuItem
          Caption = '&Hist'#243'ricos'
          OnClick = ExecutarItemMenu
        end
        object mitTiposMovimentosDoEstoque: TMenuItem
          Caption = 'Tipos de &Movimentos do Estoque'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroTabelaFretes: TMenuItem
          Caption = '&Fretes'
          OnClick = ExecutarItemMenu
        end
        object mitNCM: TMenuItem
          Caption = 'Tabela de IPI/NCM'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroTabelaMontagem: TMenuItem
          Caption = 'Mont&agens'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroTiposPagamentos: TMenuItem
          Caption = 'Tip&os de Pagamentos'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroTiposAtendimentos: TMenuItem
          Caption = 'Tipo&s de Atendimentos'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroCodigosFiscais: TMenuItem
          Caption = 'C'#243'&digos Fiscais de Opera'#231#227'o'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroCodigosFiscaisServicos: TMenuItem
          Caption = 'C'#243'digos Fiscais de Presta'#231#227'o de Servi'#231'os'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroAtividadesEconomicas: TMenuItem
          Caption = 'Atividades Econ'#244'micas'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroServicosLCP116: TMenuItem
          Caption = 'Servi'#231'os - Lei Compl. 116/03'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroTabelasGIA: TMenuItem
          Caption = '&GIA'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroMoedas: TMenuItem
          Caption = '&Moedas'
          OnClick = ExecutarItemMenu
        end
        object mitCentrodeCusto: TMenuItem
          Caption = 'Centro de Custo'
          OnClick = ExecutarItemMenu
        end
        object mitSetoresVenda: TMenuItem
          Caption = 'Setores de Venda'
          OnClick = ExecutarItemMenu
        end
        object mitquestionarios: TMenuItem
          Caption = 'Question'#225'rios'
          OnClick = ExecutarItemMenu
        end
      end
      object mitUsuarios: TMenuItem
        Tag = 1
        Caption = '&Usu'#225'rios'
        object mitCadastroUsuarios: TMenuItem
          Caption = '&Cadastro'
          OnClick = ExecutarItemMenu
        end
        object mitManutencaoAcessos: TMenuItem
          Caption = '&Acessos'
          OnClick = ExecutarItemMenu
        end
      end
      object N3: TMenuItem
        Tag = 1
        Caption = '-'
      end
      object mitLogin: TMenuItem
        Tag = 1
        Caption = 'L&ogin'
        OnClick = mitLoginClick
      end
      object N1: TMenuItem
        Tag = 1
        Caption = '-'
      end
      object mitSairSistema: TMenuItem
        Tag = 1
        Caption = 'Finali&zar o tecLUX'
        OnClick = mitSairSistemaClick
      end
    end
    object mitMenuFiscal: TMenuItem
      Tag = 1
      Caption = 'Menu &Fiscal'
      OnClick = ExecutarItemMenu
    end
    object mitBancos: TMenuItem
      Tag = 1
      Caption = '&Bancos'
      object mitMovtosBancos: TMenuItem
        Caption = '&Movimenta'#231#227'o'
        OnClick = ExecutarItemMenu
      end
      object mitConciliacaoBancaria: TMenuItem
        Caption = '&Concilia'#231#227'o'
        OnClick = ExecutarItemMenu
      end
      object mitRelatorioExtratoConta: TMenuItem
        Caption = '&Extrato'
        OnClick = ExecutarItemMenu
      end
      object mitImportacaoConciliacao: TMenuItem
        Caption = 'Importa'#231#227'o OFX'
        OnClick = ExecutarItemMenu
      end
      object mitbalancetefinanceiro: TMenuItem
        Caption = 'Balancete Financeiro'
        OnClick = ExecutarItemMenu
      end
      object mitdre: TMenuItem
        Caption = 'DRE'
        OnClick = ExecutarItemMenu
      end
      object mitDREGerencial: TMenuItem
        Caption = 'DRE Gerencial'
        OnClick = ExecutarItemMenu
      end
    end
    object mitCaixa: TMenuItem
      Tag = 1
      Caption = 'Cai&xa'
      object mitAutenticacoesCaixa: TMenuItem
        Caption = 'A&utentica'#231#227'o'
        OnClick = mitAutenticacoesCaixaClick
      end
      object mitFechamentoCaixa: TMenuItem
        Caption = '&Fechamento'
        OnClick = ExecutarItemMenu
      end
      object mitQuitacaoExtraCaixa: TMenuItem
        Caption = 'E&xtra Caixa'
        OnClick = ExecutarItemMenu
      end
      object mitQuitacaoLote1: TMenuItem
        Caption = 'Rece&bimentos'
        OnClick = mitQuitacaoLote1Click
      end
      object mitEstornoRecebimentos1: TMenuItem
        Caption = 'E&storno Recebimentos'
        OnClick = mitEstornoRecebimentos1Click
      end
      object mitComandosECF: TMenuItem
        Tag = 1
        Caption = 'Comandos de &ECF'
        object mitAberturaGaveta: TMenuItem
          Tag = 1
          Caption = 'Abertura &Gaveta'
          OnClick = mitAberturaGavetaClick
        end
        object mitReducaoZ: TMenuItem
          Tag = 1
          Caption = 'Redu'#231#227'o &Z'
          Enabled = False
          OnClick = mitReducaoZClick
        end
        object mitLeituraX: TMenuItem
          Tag = 1
          Caption = 'Leitura &X'
          Enabled = False
          OnClick = mitLeituraXClick
        end
        object mitCancelarCupom: TMenuItem
          Tag = 1
          Caption = '&Cancelar Cupom'
          OnClick = mitCancelarCupomClick
        end
        object mitFinalizarCupomVinculado: TMenuItem
          Tag = 1
          Caption = '&Finalizar Vinculado'
          OnClick = mitFinalizarCupomVinculadoClick
        end
      end
      object mitFrenteCaixa: TMenuItem
        Caption = 'Frente de &Caixa'
        OnClick = mitFrenteCaixaClick
      end
      object mitAdministracaoTEF: TMenuItem
        Tag = 1
        Caption = 'Administra'#231#227'o do &TEF'
        OnClick = mitAdministracaoTEFClick
      end
      object mitRelatorioCaixa: TMenuItem
        Caption = '&Relat'#243'rio de Caixa'
        OnClick = ExecutarItemMenu
      end
      object mitControleRecebimentos: TMenuItem
        Caption = 'Controle de Recebimentos'
        OnClick = ExecutarItemMenu
      end
      object mitCancelamentoNFCe: TMenuItem
        Caption = 'Cancelamento NFCe'
        OnClick = ExecutarItemMenu
      end
    end
    object miCheques: TMenuItem
      Tag = 1
      Caption = 'C&heques'
      object mitCadastroCheques: TMenuItem
        Caption = '&Cadastro'
        OnClick = ExecutarItemMenu
      end
      object mitManutencaoCheques: TMenuItem
        Caption = '&Manuten'#231#227'o'
        OnClick = ExecutarItemMenu
      end
      object mitrepassecheques: TMenuItem
        Caption = '&Repasses'
        OnClick = ExecutarItemMenu
      end
      object mitRelatorioChequesVencimentos: TMenuItem
        Caption = '&Relat'#243'rios'
        OnClick = ExecutarItemMenu
      end
    end
    object Contasareceber: TMenuItem
      Tag = 1
      Caption = 'Contas a Receber'
      object Documento1: TMenuItem
        Caption = 'Documentos'
      end
      object mitQuitacaoLote: TMenuItem
        Caption = 'Rece&bimentos'
        OnClick = mitQuitacaoLoteClick
      end
      object mitEstornoRecebimentos: TMenuItem
        Caption = 'Estornos'
        OnClick = mitEstornoRecebimentosClick
      end
      object mitFichaFinanceira1: TMenuItem
        Caption = 'Ficha do Cliente'
        OnClick = mitFichaFinanceira1Click
      end
      object mitRelatoriosContasaReceber: TMenuItem
        Tag = 1
        Caption = '&Relat'#243'rios'
        object mitrelatoriocontasareceber: TMenuItem
          Caption = 'Contas a Receber'
          OnClick = ExecutarItemMenu
        end
        object mitrelatoriocontasareceberportipoderecebimento: TMenuItem
          Caption = 'Contas a Receber por Tipo de Recebimento'
          OnClick = ExecutarItemMenu
        end
        object mitrelatoriofluxodecaixa: TMenuItem
          Caption = 'Fluxo de Caixa'
          OnClick = mitrelatoriofluxodecaixaClick
        end
        object mitRelatorioSituacaoClientes: TMenuItem
          Caption = 'Situa'#231#227'o dos Clientes'
          OnClick = ExecutarItemMenu
        end
      end
    end
    object mitCobrancaESAC: TMenuItem
      Tag = 1
      Caption = 'Cobran'#231'a e &SAC'
      object mitCadastroAtendimento: TMenuItem
        Caption = '&Atendimentos'
        OnClick = ExecutarItemMenu
      end
      object mitLigarClientes: TMenuItem
        Caption = '&Ligar para Clientes'
        OnClick = ExecutarItemMenu
      end
      object mitMalaDireta: TMenuItem
        Caption = 'Mala Direta'
        OnClick = ExecutarItemMenu
      end
      object mitDefinirCobrador: TMenuItem
        Caption = 'Definir Co&brador'
        OnClick = ExecutarItemMenu
      end
      object mitRenegociacao: TMenuItem
        Caption = 'R&enegocia'#231#227'o de Contratos'
        OnClick = ExecutarItemMenu
      end
      object mitDevolucaoNumerario: TMenuItem
        Caption = '&Devolucao Numer'#225'rio'
        OnClick = ExecutarItemMenu
      end
      object mitAviso: TMenuItem
        Caption = 'A&viso de Cobran'#231'a'
        OnClick = ExecutarItemMenu
      end
      object mitSPC: TMenuItem
        Caption = 'Registrar no &SPC'
        OnClick = ExecutarItemMenu
      end
      object mitCartas: TMenuItem
        Caption = 'Cartas E&mitidas'
        OnClick = ExecutarItemMenu
      end
      object mitimprimirduplicatas: TMenuItem
        Caption = '&Imprimir Duplicatas'
        OnClick = ExecutarItemMenu
      end
      object mitManutencaoAgendamento: TMenuItem
        Caption = 'Manuten'#231#227'o de Agendamento'
        OnClick = ExecutarItemMenu
      end
      object mitManutencaoObservacoesVenda: TMenuItem
        Caption = 'Manuten'#231#227'o de Observa'#231#245'es de Venda'
        OnClick = ExecutarItemMenu
      end
      object mitGerarLerRemessas: TMenuItem
        Tag = 1
        Caption = '&Cobran'#231'a Banc'#225'ria'
        object mitGerarRemessas: TMenuItem
          Caption = '&Gerar Remessas'
          OnClick = ExecutarItemMenu
        end
        object mitLerRetornos: TMenuItem
          Caption = '&Ler Retornos'
          OnClick = ExecutarItemMenu
        end
      end
      object mitCobrancaFinanceira: TMenuItem
        Tag = 1
        Caption = 'Cobran'#231'a &Financeira'
        object mitSoacred: TMenuItem
          Tag = 1
          Caption = '&SOACRED'
          object mitGerarRemessasSoacred: TMenuItem
            Caption = 'Gerar &Remessas'
            OnClick = mitGerarRemessasSoacredClick
          end
          object TMenuItem
          end
        end
      end
      object mitCobrancaSACRelatorios: TMenuItem
        Tag = 1
        Caption = '&Relat'#243'rios'
        object mitPrestacoesAbertas: TMenuItem
          Caption = '&Parcelas em Aberto'
          OnClick = ExecutarItemMenu
        end
        object mitFichaCobranca: TMenuItem
          Caption = '&Ficha de Cobran'#231'a'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioRecebimentosPorCobrador: TMenuItem
          Caption = '&Recebimentos por Cobrador'
          OnClick = ExecutarItemMenu
        end
        object mitComissaoCobradores: TMenuItem
          Caption = '&Comiss'#245'es de Cobradores'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorio: TMenuItem
        end
      end
    end
    object mitContasaPagar: TMenuItem
      Tag = 1
      Caption = 'Contas &a Pagar'
      object mitContasPagar: TMenuItem
        Caption = '&Documentos'
        OnClick = ExecutarItemMenu
      end
      object mitAutorizacaoPagamento: TMenuItem
        Caption = '&Autoriza'#231#227'o para Pagamentos'
        OnClick = ExecutarItemMenu
      end
      object mitQuitacaoDuplicatas: TMenuItem
        Caption = '&Pagamentos'
        OnClick = ExecutarItemMenu
      end
      object mitCancelamentoQuitacao: TMenuItem
        Caption = '&Estornos'
        OnClick = ExecutarItemMenu
      end
      object mitFichaFinanceiraFornecedor: TMenuItem
        Caption = '&Ficha Financeira de Fornecedores'
        OnClick = ExecutarItemMenu
      end
      object mitGerarLerRemessasPagamentos: TMenuItem
        Tag = 1
        Caption = 'Cobran'#231'a Banc'#225'ria'
        object mitGerarRemessasPagamentos: TMenuItem
          Caption = 'Gerar Remessas'
          OnClick = ExecutarItemMenu
        end
        object mitLerRetornoPagFor: TMenuItem
          Caption = 'Ler Retorno'
          OnClick = ExecutarItemMenu
        end
      end
      object mitContasPagarRelatorios: TMenuItem
        Tag = 1
        Caption = '&Relat'#243'rios'
        object mitRelatorioDuplicatas: TMenuItem
          Caption = '&Contas a Pagar'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioChequesEmitidos: TMenuItem
          Caption = 'C&heques Emitidos'
          OnClick = ExecutarItemMenu
        end
        object mitRelatoriosituacaofornecedores: TMenuItem
          Caption = 'Situa'#231#227'o Fornecedores'
          OnClick = ExecutarItemMenu
        end
        object mitPlanilhaCusto: TMenuItem
          Caption = '&Planilha Custo'
          OnClick = ExecutarItemMenu
        end
        object mitrelatoriofluxodecaixa1: TMenuItem
          Caption = 'Fluxo de Caixa'
          OnClick = mitrelatoriofluxodecaixa1Click
        end
      end
    end
    object mitRomaneiosdeEntrega: TMenuItem
      Tag = 1
      Caption = 'Entrega e &Montagem'
      object mitEntrega: TMenuItem
        Tag = 1
        Caption = '&Entrega'
        object mitCadastroRomaneio: TMenuItem
          Caption = '&Romaneios'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioRomaneios: TMenuItem
          Caption = 'I&mpress'#227'o'
          OnClick = ExecutarItemMenu
        end
        object mitQuitacaoRomaneios: TMenuItem
          Caption = '&Pagamentos'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioFretes: TMenuItem
          Caption = 'Relat'#243'rio de &Fretes'
          OnClick = ExecutarItemMenu
        end
        object mitrelatorioentrega: TMenuItem
          Caption = 'Relat'#243'rio de Entrega'
          OnClick = ExecutarItemMenu
        end
        object mitConsultaEntregaProdutos: TMenuItem
          Caption = 'Consulta de Entrega de Produtos'
          OnClick = ExecutarItemMenu
        end
        object mitConsultaRomaneios: TMenuItem
          Caption = 'Consulta de Romaneios'
          OnClick = ExecutarItemMenu
        end
        object mitConfirmarRomaneiosSaida: TMenuItem
          Caption = 'Confirma'#231#227'o de Sa'#237'das de Romaneios'
          OnClick = ExecutarItemMenu
        end
      end
      object mitRequisiesdeMontagens: TMenuItem
        Tag = 1
        Caption = '&Montagens'
        object mitGeracaoRequisicoesMontagens: TMenuItem
          Caption = '&Gera'#231#227'o de Requisi'#231#245'es'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroRequisicoesMontagens: TMenuItem
          Caption = 'Cadast&ro'
          OnClick = ExecutarItemMenu
        end
        object mitDefinicaoMontador: TMenuItem
          Caption = '&Defini'#231#227'o Montador'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioReimpressaoRequisicoes: TMenuItem
          Caption = 'Re-i&mpress'#227'o'
          OnClick = ExecutarItemMenu
        end
        object mitFechamentoRequisicoesMontagens: TMenuItem
          Caption = '&Fechamentos'
          OnClick = ExecutarItemMenu
        end
        object mitQuitacaoRequisicoesMontagens: TMenuItem
          Caption = '&Pagamentos'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioRequisicoesporMontador: TMenuItem
          Caption = 'Rela&t'#243'rio'
          OnClick = ExecutarItemMenu
        end
      end
    end
    object mitEstoque: TMenuItem
      Tag = 1
      Caption = '&Estoque'
      object mitConsultaEstoque: TMenuItem
        Caption = '&Consulta'
        OnClick = ExecutarItemMenu
      end
      object mitConsultaFichaProduto: TMenuItem
        Caption = '&Ficha de Produtos'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroNotasFiscais: TMenuItem
        Caption = '&Entradas de Notas'
        OnClick = ExecutarItemMenu
      end
      object mitLancamentosManuais: TMenuItem
        Caption = '&Lan'#231'amentos Avulsos'
        OnClick = ExecutarItemMenu
      end
      object mitManutencaoPreco: TMenuItem
        Caption = '&Manuten'#231#227'o de Pre'#231'os'
        OnClick = ExecutarItemMenu
      end
      object mitManutencaoProdutos: TMenuItem
        Caption = 'Manuten'#231#227'o de Produtos'
        OnClick = ExecutarItemMenu
      end
      object mitControleLocalizacoes: TMenuItem
        Caption = 'Controle de Localiza'#231#245'es'
        OnClick = ExecutarItemMenu
      end
      object mitCompras: TMenuItem
        Tag = 1
        Caption = 'Com&pras'
        object mitCadastroPedidos: TMenuItem
          Caption = '&Pedidos'
          OnClick = ExecutarItemMenu
        end
        object mitCancelamentoPedidos: TMenuItem
          Caption = '&Cancelamento Pedidos'
          OnClick = ExecutarItemMenu
        end
        object mitConsultaCompras: TMenuItem
          Caption = 'C&onsultas'
          OnClick = ExecutarItemMenu
        end
        object mitConsultaPedidos: TMenuItem
          Caption = 'P&edidos de Compra'
          OnClick = ExecutarItemMenu
        end
        object mitConsultaProgramacaoEntregaNfe: TMenuItem
          Caption = 'Programa'#231#227'o Di'#225'ria de Entrega de Notas Fiscais'
          OnClick = ExecutarItemMenu
        end
      end
      object mitDevolucaoFornecedores: TMenuItem
        Caption = '&Devolu'#231#227'o a Fornecedores'
        OnClick = ExecutarItemMenu
      end
      object mitEmissaoNotasSaidaAvulsas: TMenuItem
        Caption = '&Notas Fiscais Avulsas'
        OnClick = ExecutarItemMenu
      end
      object mitEmissaoNotaComplementar: TMenuItem
        Caption = 'Notas Fiscais Complementares'
        OnClick = ExecutarItemMenu
      end
      object mitTransferenciaAutomatica: TMenuItem
        Caption = 'Notas de &Transfer'#234'ncia Autom'#225'tica'
        OnClick = ExecutarItemMenu
      end
      object mitConsultaNotaseCupons: TMenuItem
        Caption = 'Consulta Notas Sa'#237'da/C&upons fiscais'
        OnClick = ExecutarItemMenu
      end
      object mitConsultaEntradas: TMenuItem
        Caption = 'Consulta Notas F&iscais de Entrada'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroMercadoriasAnuncio: TMenuItem
        Caption = 'Mercadorias para &Anuncio'
        OnClick = ExecutarItemMenu
      end
      object mitEmissaoNotasAcrescimoFinanceiro: TMenuItem
        Caption = 'Emiss'#227'o de Notas de Acr'#233'scimo Financeiro'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroInventario: TMenuItem
        Caption = 'Invent'#225'rio'
        OnClick = ExecutarItemMenu
      end
      object mitControleNotasFiscaisEletronicas: TMenuItem
        Caption = 'Controle de Notas Fiscais Eletr'#244'nicas'
        OnClick = ExecutarItemMenu
      end
      object mitNFeEntradaSefaz: TMenuItem
        Caption = 'Nfe Entrada Sefaz'
        OnClick = ExecutarItemMenu
      end
      object mitExportacaoProdutos: TMenuItem
        Caption = 'Exporta'#231#227'o de Produtos'
        OnClick = ExecutarItemMenu
      end
      object mitImportacaoProdutos: TMenuItem
        Caption = 'Importa'#231#227'o de Produtos'
        OnClick = ExecutarItemMenu
      end
      object mitAlteracoesPrecos: TMenuItem
        Caption = 'Altera'#231#245'es de Precos'
        OnClick = ExecutarItemMenu
      end
      object mitRelatorios: TMenuItem
        Tag = 1
        Caption = '&Relat'#243'rios'
        object mitListaPrecos: TMenuItem
          Caption = '&Lista de Pre'#231'os'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioMovimentacaoDiaria: TMenuItem
          Caption = '&Movimenta'#231#227'o Di'#225'ria'
          OnClick = ExecutarItemMenu
        end
        object mitEmissaoEtiquetas: TMenuItem
          Caption = '&Etiquetas'
          OnClick = ExecutarItemMenu
        end
        object mitControleEmissaodeEtiquetas: TMenuItem
          Caption = 'Controle de emiss'#227'o de Etiquetas'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioSugestaoCompra: TMenuItem
          Caption = '&Sugest'#227'o de Compra'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioEstoque: TMenuItem
          Caption = 'E&stoques'
          OnClick = ExecutarItemMenu
        end
        object mitProdutosFornecedor: TMenuItem
          Caption = '&Produtos de Fornecedor'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioNotasEntrada: TMenuItem
          Caption = '&Entrada de Notas'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioCurvaABC: TMenuItem
          Caption = '&Curva ABC'
          OnClick = ExecutarItemMenu
        end
        object mitConsultaVendas: TMenuItem
          Caption = '&An'#225'lise de Vendas'
          OnClick = mitConsultaVendasClick
        end
        object mitrelatorioicmsstarecolher: TMenuItem
          Caption = 'ICMS ST a recolher'
          OnClick = ExecutarItemMenu
        end
        object mitrelatorioestoqueicmsstarecolher: TMenuItem
          Caption = 'Estoque ICMS ST a recolher'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioProdutosConferidos: TMenuItem
          Caption = 'Produtos Conferidos'
          OnClick = ExecutarItemMenu
        end
        object mitControleESNF: TMenuItem
          Caption = 'Entrada e Sa'#237'da por Notas'
          OnClick = ExecutarItemMenu
        end
        object mitAnaliseEconomicaCompras: TMenuItem
          Caption = 'An'#225'lise Econ'#244'mica de Compras'
          OnClick = ExecutarItemMenu
        end
        object mitAnaliseestoques: TMenuItem
          Caption = 'An'#225'lise Estoques'
          OnClick = ExecutarItemMenu
        end
        object mitVerificacaoReservas: TMenuItem
          Caption = 'Verifica'#231#227'o Reservas/Futuro'
          OnClick = ExecutarItemMenu
        end
      end
    end
    object mitInterLojas: TMenuItem
      Tag = 1
      Caption = '&InterLojas'
      object mitRequisicaoExposicao: TMenuItem
        Caption = '&Requisi'#231#227'o para Exposi'#231#227'o'
        OnClick = ExecutarItemMenu
      end
      object mitConsultaRequisicaoExposicao: TMenuItem
        Caption = '&Consulta Requisi'#231#227'o'
        OnClick = ExecutarItemMenu
      end
      object mitConsultaProdutosAdquiridos: TMenuItem
        Caption = '&Produtos Adquiridos'
        OnClick = ExecutarItemMenu
      end
      object mitTransferenciaRequisicaoExposicao: TMenuItem
        Caption = '&Transfer'#234'ncia'
        OnClick = ExecutarItemMenu
      end
      object mitConsultaTransferencias: TMenuItem
        Caption = 'Consulta Transfer'#234'ncias'
        OnClick = ExecutarItemMenu
      end
      object mitConfirmarNotasTransferencia: TMenuItem
        Caption = 'Confirma'#231#227'o por &Notas'
        OnClick = ExecutarItemMenu
      end
      object mitConfirmarNotasTransferenciaPorItem: TMenuItem
        Caption = 'Confirma'#231#227'o por It&ens'
        OnClick = ExecutarItemMenu
      end
      object mitConfirmarromaneiosTransferencia: TMenuItem
        Caption = 'Confirma'#231#227'o por &Romaneios'
        OnClick = ExecutarItemMenu
      end
      object mitExportacaoNotasTransferencia: TMenuItem
        Caption = '&Exporta'#231#227'o de Notas de Transfer'#234'ncia'
        OnClick = ExecutarItemMenu
      end
      object mitImportacaoNotasTransferencia: TMenuItem
        Caption = 'Importa'#231#227'o de Notas de Transfer'#234'ncia'
        OnClick = ExecutarItemMenu
      end
    end
    object mitLivrosFiscais: TMenuItem
      Tag = 1
      Caption = '&Livros Fiscais'
      object mitQuadrosGIA: TMenuItem
        Caption = '&Quadros da GIA'
        Enabled = False
        OnClick = ExecutarItemMenu
      end
      object mitGerarGIAEmArquivo: TMenuItem
        Caption = '&Gerar GIA em Arquivo'
        Enabled = False
        OnClick = ExecutarItemMenu
      end
      object mitQuadrosDIME: TMenuItem
        Caption = 'Quadros da &Dime'
        OnClick = ExecutarItemMenu
      end
      object mitEFD: TMenuItem
        Caption = 'EFD ICMS/IPI'
        OnClick = ExecutarItemMenu
      end
      object mitEPC: TMenuItem
        Caption = 'EFD Contribui'#231#245'es'
        OnClick = ExecutarItemMenu
      end
      object mitECD: TMenuItem
        Caption = 'ECD'
        OnClick = ExecutarItemMenu
      end
      object mitFcont: TMenuItem
        Caption = 'FCONT'
        OnClick = ExecutarItemMenu
      end
      object mitECF: TMenuItem
        Caption = 'ECF'
        OnClick = ExecutarItemMenu
      end
      object mitREinf: TMenuItem
        Tag = 1
        Caption = '&Reinf'
        object mitOperacoesEventosReinf: TMenuItem
          Caption = 'Opera'#231#245'es Eventos'
        end
        object mitProcessosJudiciaisReinf: TMenuItem
          Caption = 'Processos Judiciais'
          OnClick = ExecutarItemMenu
        end
      end
      object mitGerarDIMEEmArquivo: TMenuItem
        Caption = '&Gerar DIME em Arquivo'
        OnClick = ExecutarItemMenu
      end
      object mitGerarSintegraEmArquivo: TMenuItem
        Caption = 'Gerar &Sintegra em Arquivo'
        OnClick = ExecutarItemMenu
      end
      object mitLivroEntradaMercadorias: TMenuItem
        Caption = 'Entrada de Mercadorias'
        OnClick = ExecutarItemMenu
      end
      object mitLivroSaidaMercadorias: TMenuItem
        Caption = 'Saida de Mercadorias'
        OnClick = ExecutarItemMenu
      end
      object mitLivroApuracaoIcms: TMenuItem
        Caption = 'Apura'#231#227'o de ICMS'
        OnClick = ExecutarItemMenu
      end
      object mitLivroApuracaoISS: TMenuItem
        Caption = 'Apura'#231#227'o de ISS'
        OnClick = ExecutarItemMenu
      end
      object mitLivroApuracaoPisCofins: TMenuItem
        Caption = 'Apura'#231#227'o PIS/COFINS'
        OnClick = ExecutarItemMenu
      end
      object mitLivroAuxiliarImpostosRetidos: TMenuItem
        Caption = 'Auxiliar de Impostos Retidos'
        OnClick = ExecutarItemMenu
      end
      object mitrelatorioinventario: TMenuItem
        Caption = 'I&nvent'#225'rio'
        OnClick = ExecutarItemMenu
      end
      object mitLivroDiarioAuxiliarReceitas: TMenuItem
        Caption = 'Di'#225'rio Auxiliar de Recebimentos'
        OnClick = ExecutarItemMenu
      end
      object mitDiarioAuxiliarParcelas: TMenuItem
        Caption = '&Di'#225'rio Auxiliar das Parcelas em Aberto'
        OnClick = ExecutarItemMenu
      end
      object mitDiarioAuxiliarFornecedores: TMenuItem
        Caption = 'Di'#225'rio Auxiliar de &Fornecedores'
        OnClick = ExecutarItemMenu
      end
      object mitRelatorioNotasFuturas: TMenuItem
        Caption = 'Notas Fiscais de Vendas Futuras'
        OnClick = ExecutarItemMenu
      end
      object mitCadastrodeBens: TMenuItem
        Caption = 'Cadastro de Bens'
        OnClick = ExecutarItemMenu
      end
      object mitDIPJ_IPI: TMenuItem
        Caption = 'DIPJ IPI'
        OnClick = ExecutarItemMenu
      end
      object mitMapaResumoECF: TMenuItem
        Caption = 'Mapa Resumo ECF'
        OnClick = ExecutarItemMenu
      end
    end
    object mitVendas: TMenuItem
      Tag = 1
      Caption = '&Vendas'
      object mitCalculoFinanciamento: TMenuItem
        Caption = '&Simula'#231#227'o'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroContratos: TMenuItem
        Caption = '&Contratos'
        OnClick = ExecutarItemMenu
      end
      object mitConsultaContratos: TMenuItem
        Caption = 'Cons&ulta Contratos'
        OnClick = ExecutarItemMenu
      end
      object mitCancelamentoContratos: TMenuItem
        Caption = 'C&ancelamento Contratos'
        OnClick = ExecutarItemMenu
      end
      object mitOrcamentos: TMenuItem
        Caption = 'Or'#231'amentos'
        OnClick = ExecutarItemMenu
      end
      object mitConsultaOrcamentos: TMenuItem
        Caption = 'Consulta Or'#231'amentos'
        OnClick = mitConsultaOrcamentosClick
      end
      object mitDevolucaoMercadorias: TMenuItem
        Caption = '&Devolu'#231#227'o'
        OnClick = ExecutarItemMenu
      end
      object mitTrocaMercadorias: TMenuItem
        Caption = '&Troca'
        OnClick = ExecutarItemMenu
      end
      object mitOrdemServico: TMenuItem
        Caption = 'Ordem de Servi'#231'o'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroContratosManutencao: TMenuItem
        Caption = 'Contratos de Servi'#231'os/Loca'#231#245'es'
        OnClick = ExecutarItemMenu
      end
      object mitConsultaContratosManutencao: TMenuItem
        Caption = 'Cons&ulta Contratos Servi'#231'os/Loca'#231#245'es'
        OnClick = ExecutarItemMenu
      end
      object mitGerarContratosPrestacaoServicos: TMenuItem
        Caption = 'Gerar Contratos de Servi'#231'os/Loca'#231#245'es'
        OnClick = ExecutarItemMenu
      end
      object mitFichaFinanceira: TMenuItem
        Caption = 'Fic&ha Financeira de Clientes'
        OnClick = mitFichaFinanceiraClick
      end
      object mitConsultaCashBack: TMenuItem
        Caption = 'Consulta CashBack'
        OnClick = ExecutarItemMenu
      end
      object mitOrdensCarga: TMenuItem
        Caption = 'Ordens de Carga'
        Visible = False
        OnClick = ExecutarItemMenu
      end
      object mitOperacoesContratos: TMenuItem
        Caption = '&Opera'#231#245'es'
        OnClick = ExecutarItemMenu
      end
      object mitVendasAVista: TMenuItem
        Caption = '&Venda a Vista'
        Visible = False
        OnClick = ExecutarItemMenu
      end
      object mitVendasPerdidas: TMenuItem
        Caption = 'Vendas Perdidas'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroReservas: TMenuItem
        Caption = 'R&eserva Pr'#233'via'
        OnClick = ExecutarItemMenu
      end
      object mitConsultaReservas: TMenuItem
        Caption = 'Co&nsulta de Reserva'
        OnClick = ExecutarItemMenu
      end
      object mitCancelamentoReservas: TMenuItem
        Caption = 'Cancela&mento de Reservas'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroLicitacoes: TMenuItem
        Caption = 'Licita'#231#245'es'
        OnClick = ExecutarItemMenu
      end
      object mitConsultaLicitacoes: TMenuItem
        Caption = 'Consulta Licita'#231#245'es'
        OnClick = ExecutarItemMenu
      end
      object mitExtratoBonus: TMenuItem
        Caption = 'Extrato de &B'#244'nus'
        OnClick = ExecutarItemMenu
      end
      object mitcadastropedidossaidas: TMenuItem
        Caption = '&Pedidos'
        Visible = False
        OnClick = ExecutarItemMenu
      end
      object mitCadastroPedidosClientes: TMenuItem
        Caption = '&Pedidos de Clientes'
        OnClick = ExecutarItemMenu
      end
      object mitEmissaoNotasVenda: TMenuItem
        Caption = 'Emiss'#227'o de Notas Fiscais'
        OnClick = ExecutarItemMenu
      end
      object mitExportacaoVendasReducoes: TMenuItem
        Caption = 'Exporta'#231#227'o &Vendas e Redu'#231#245'es'
        OnClick = ExecutarItemMenu
      end
      object mitImportacaoClientesProdutos: TMenuItem
        Caption = 'Importa'#231#227'o de Clientes e Produtos'
        OnClick = ExecutarItemMenu
      end
      object mitVendasCasadas: TMenuItem
        Caption = 'Vendas Casadas'
        OnClick = ExecutarItemMenu
      end
      object mitRelatorioVendas: TMenuItem
        Tag = 1
        Caption = '&Relat'#243'rios'
        object mitRelatorioVendasdoPeriodo: TMenuItem
          Caption = '&Vendas'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioRecebimentosdoPeriodo: TMenuItem
          Caption = '&Recebimentos'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioResumodeVendaseRecebimentos: TMenuItem
          Caption = 'V&endas e Recebimentos'
          OnClick = ExecutarItemMenu
        end
        object mitrelatoriocontratosemitidos: TMenuItem
          Caption = '&Contratos Emitidos'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioContratosPendentes: TMenuItem
          Caption = 'Contratos &Pendentes'
          OnClick = ExecutarItemMenu
        end
        object mitrelatorioresumosinteticofaturamento: TMenuItem
          Caption = 'Re&sumo Sint'#233'tico do Faturamento'
          OnClick = ExecutarItemMenu
        end
        object mitrelatoriocustomercadoriasvendidas: TMenuItem
          Caption = 'C&usto de Mercadorias Vendidas'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioSituacaoRecebimentos: TMenuItem
          Caption = 'Si&tua'#231#227'o dos Recebimentos'
          OnClick = ExecutarItemMenu
        end
        object mitComissaoVendedores: TMenuItem
          Caption = 'C&omiss'#245'es de Vendedores'
          OnClick = ExecutarItemMenu
        end
        object mitcomissaovendedorespagtoparcelas: TMenuItem
          Caption = 'Comiss'#227'o de Vendedores por Recebimento'
          OnClick = ExecutarItemMenu
        end
        object mitEtiquetasReservas: TMenuItem
          Caption = 'Eti&quetas para Reserva Pr'#233'via'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioProdutosporClienteeVendedor: TMenuItem
          Caption = 'Produtos por Clientes e Vendedores'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioRenegociacao: TMenuItem
          Caption = 'Rene&gocia'#231#245'es'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioOS: TMenuItem
          Caption = 'Ordem de Servi'#231'o'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioFaturamentoPorGrupo: TMenuItem
          Caption = '&Faturamento Por Grupos'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioServicos: TMenuItem
          Caption = '&Servicos'
          OnClick = ExecutarItemMenu
        end
        object mitEspelhoCarne: TMenuItem
          Caption = 'Espelho de Carn'#234
          OnClick = ExecutarItemMenu
        end
        object mitrelatoriosaldocredito: TMenuItem
          Caption = 'Saldo de Cr'#233'dito'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioCupons: TMenuItem
          Caption = 'Cupons'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioListasCasamento: TMenuItem
          Caption = 'Listas de Casamento'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioVendasporSetores: TMenuItem
          Caption = 'Vendas por Setores'
          OnClick = ExecutarItemMenu
        end
        object mitVendasporFornecedor: TMenuItem
          Caption = 'Vendas por Fornecedores'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioLicitacoes: TMenuItem
          Caption = 'Licita'#231#245'es'
          OnClick = ExecutarItemMenu
        end
      end
    end
    object mitContabil: TMenuItem
      Tag = 1
      Caption = 'C&ont'#225'bil'
      object mitPlanoContas: TMenuItem
        Caption = 'Plano de &Contas'
        OnClick = ExecutarItemMenu
      end
      object mitPlanoContasReferencial: TMenuItem
        Caption = 'Plano &Referencial'
        OnClick = ExecutarItemMenu
      end
      object mitLancamentoContas: TMenuItem
        Caption = '&Lan'#231'amentos'
        OnClick = ExecutarItemMenu
      end
      object mitEncerramentoExercicio: TMenuItem
        Caption = '&Zerar Resultados'
        OnClick = ExecutarItemMenu
      end
      object mitImportarAlugueis: TMenuItem
        Caption = 'Importar Alugu'#233'is'
        OnClick = ExecutarItemMenu
      end
      object mitImportacaoFolhaSenior: TMenuItem
        Caption = 'Importa'#231#227'o Dados'
        OnClick = ExecutarItemMenu
      end
      object mitTransferirSaldosContabeis: TMenuItem
        Caption = '&Transferir Saldos'
        OnClick = ExecutarItemMenu
      end
      object mitImobilizado: TMenuItem
        Tag = 1
        Caption = 'Imobilizado'
        object mitLancamentosDepreciacao: TMenuItem
          Caption = 'Deprecia'#231#227'o'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioDepreciacao: TMenuItem
          Caption = 'Relat'#243'rio'
          OnClick = ExecutarItemMenu
        end
      end
      object mitRelatoriosContabil: TMenuItem
        Tag = 1
        Caption = '&Relat'#243'rios'
        object mitLivroDiario: TMenuItem
          Caption = 'Livro &Di'#225'rio'
          OnClick = ExecutarItemMenu
        end
        object mitLivroRazao: TMenuItem
          Caption = 'Livro &Raz'#227'o'
          OnClick = ExecutarItemMenu
        end
        object mitEmissaoBalancetes: TMenuItem
          Caption = '&Balancetes'
          OnClick = ExecutarItemMenu
        end
        object mitImpressaoLotes: TMenuItem
          Caption = '&Lotes'
          OnClick = ExecutarItemMenu
        end
      end
    end
    object mitProducao: TMenuItem
      Tag = 1
      Caption = '&Produ'#231#227'o'
      object mitCadastroOSP: TMenuItem
        Caption = '&OSP'
        OnClick = ExecutarItemMenu
      end
      object mitconsultaosp: TMenuItem
        Caption = 'Consulta de OSP'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroMaquinas: TMenuItem
        Caption = '&M'#225'quinas'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroMotivosParadas: TMenuItem
        Caption = 'Motivo das Paradas'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroSetoresProducao: TMenuItem
        Caption = 'Setores da Produ'#231#227'o'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroOperacoes: TMenuItem
        Caption = 'Ope&ra'#231#245'es'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroFluxoGramas: TMenuItem
        Caption = 'Flu&xogramas'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroFalhas: TMenuItem
        Caption = 'Cadastro de &Falhas'
        OnClick = ExecutarItemMenu
      end
      object mitOperacoesOSP: TMenuItem
        Caption = '&Ger'#234'ncia de Processos'
        OnClick = ExecutarItemMenu
      end
      object mitOperacoesPorcelana: TMenuItem
        Caption = 'Processos com Porcelana'
        OnClick = ExecutarItemMenu
      end
      object mitLiberacaoMaquinas: TMenuItem
        Caption = 'Liberar M'#225'quinas Bloqueadas'
        OnClick = ExecutarItemMenu
      end
      object mitRequisicoesOSP: TMenuItem
        Caption = 'Requisi'#231#245'es'
        OnClick = ExecutarItemMenu
      end
      object Habilitaes1: TMenuItem
        Tag = 1
        Caption = '&Habilita'#231#245'es'
        object mitCadastroInstrucoes: TMenuItem
          Caption = '&Instru'#231#245'es de Trabalho'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroOperadores: TMenuItem
          Caption = '&Operadores'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroTurnos: TMenuItem
          Caption = '&Turnos'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroNiveisSalariais: TMenuItem
          Caption = '&N'#237'veis Salariais'
          OnClick = ExecutarItemMenu
        end
        object mitCadastroNiveisConhecimento: TMenuItem
          Caption = 'N'#237'veis &Conhecimento'
          OnClick = ExecutarItemMenu
        end
      end
      object mitRelatorioProducao: TMenuItem
        Tag = 1
        Caption = '&Relat'#243'rios'
        object mitVendasAcumuladas: TMenuItem
          Caption = 'Vendas Acu&muladas'
          OnClick = ExecutarItemMenu
        end
        object mitVendasporAtividades: TMenuItem
          Caption = 'Vendas por A&tividades'
          OnClick = ExecutarItemMenu
        end
        object mitPedidosporAtividades: TMenuItem
          Caption = 'Pedidos por A&tividades'
          OnClick = ExecutarItemMenu
        end
        object mitVendasporProdutos: TMenuItem
          Caption = 'Vendas por &Produtos e Quantidades'
          OnClick = ExecutarItemMenu
        end
        object mitVendasporProdutosValor: TMenuItem
          Caption = 'Vendas por &Produtos e Valor'
          OnClick = ExecutarItemMenu
        end
        object mitVendasPlanRealizadas: TMenuItem
          Caption = 'Planejadas e &Realizadas'
          OnClick = ExecutarItemMenu
        end
        object mitrelatorioentradaosp: TMenuItem
          Caption = 'Entrada de OSPs'
          Hint = 'mitrelatorioentradaosp'
          OnClick = ExecutarItemMenu
        end
        object mitrelatorionotasportransportador: TMenuItem
          Caption = '&Notas por Transportador'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioPedidosClientes: TMenuItem
          Caption = 'Pedidos por &Cliente'
          OnClick = ExecutarItemMenu
        end
        object mitquadroprogramacaosemanal: TMenuItem
          Caption = 'Quadro Programa'#231#227'o Semanal'
          OnClick = ExecutarItemMenu
        end
        object mitquadroatrasosemanal: TMenuItem
          Caption = 'Quadro Atrasos Programa'#231#227'o Semanal'
          OnClick = ExecutarItemMenu
        end
        object mitIndiceProdutividade: TMenuItem
          Caption = #205'ndice de Produtividade por Operador'
          OnClick = ExecutarItemMenu
        end
        object mitIndiceProdutividadeOEE: TMenuItem
          Caption = #205'ndice de Produtividade por M'#225'quina'
          OnClick = ExecutarItemMenu
        end
        object mitindicenaoqualidade: TMenuItem
          Caption = #205'ndice da n'#227'o Qualidade'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioResumoEstoque: TMenuItem
          Caption = 'Resumo do Estoque'
          OnClick = ExecutarItemMenu
        end
        object mittempousuariosetor: TMenuItem
          Caption = 'Tempo de Operadores por Setor'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioClienteProdutoFaturado: TMenuItem
          Caption = 'Faturamento por Clientes e Produtos'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioEvolucaoPrecos: TMenuItem
          Caption = 'Evolu'#231#227'o de Pre'#231'os'
          OnClick = ExecutarItemMenu
        end
        object mitImprimirPNs: TMenuItem
          Caption = 'Rela'#231#227'o PN'#180's Cadastrados'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioComposicaoPN: TMenuItem
          Caption = 'Relat'#243'rio de Composi'#231#227'o de PN'#180's'
          OnClick = ExecutarItemMenu
        end
        object mitmotivosparadas: TMenuItem
          Caption = 'Motivos de Paradas'
          OnClick = ExecutarItemMenu
        end
        object mitCustoporPN: TMenuItem
          Caption = 'Custo por PN'
          OnClick = ExecutarItemMenu
        end
        object mitAnaliseFalhasMaquinasSetores: TMenuItem
          Caption = 'An'#225'lise de Falhas por M'#225'quinas/Setores'
          OnClick = ExecutarItemMenu
        end
        object mitAnaliseParadasMaquinasSetores: TMenuItem
          Caption = 'An'#225'lise de Paradas por M'#225'quinas/Setores'
          OnClick = ExecutarItemMenu
        end
        object mitFCI: TMenuItem
          Caption = 'FCI'
          OnClick = ExecutarItemMenu
        end
      end
    end
    object mitImoveis: TMenuItem
      Tag = 1
      Caption = 'I&m'#243'veis'
      object mitCadastroEmpreendimentos: TMenuItem
        Caption = 'Empreendimentos'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroUnidades: TMenuItem
        Caption = 'Tipos de Im'#243'veis'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroImoveis: TMenuItem
        Caption = 'Im'#243'veis'
        OnClick = ExecutarItemMenu
      end
      object mitContratosImoveis: TMenuItem
        Caption = 'Contratos'
        OnClick = ExecutarItemMenu
      end
      object mitGerarCobrancaBancaria: TMenuItem
        Caption = 'Cobran'#231'a Banc'#225'ria'
        OnClick = ExecutarItemMenu
      end
      object mitatualizacaomonetaria: TMenuItem
        Caption = 'Atualiza'#231#227'o Monet'#225'ria '
        OnClick = ExecutarItemMenu
      end
      object mitTransferenciaLongoPrazo: TMenuItem
        Caption = 'Transfer'#234'ncia do Longo Prazo'
        OnClick = ExecutarItemMenu
      end
      object mitRelatoriosImoveis: TMenuItem
        Tag = 1
        Caption = '&Relat'#243'rios'
        object mitRelatorioRecebimentos: TMenuItem
          Caption = '&Recebimentos'
          OnClick = ExecutarItemMenu
        end
        object mitrelatoriorecebimentossituacao: TMenuItem
          Caption = 'Recebimentos Situa'#231#227'o'
          OnClick = ExecutarItemMenu
        end
        object mitPlanilhaReversaoAVP: TMenuItem
          Caption = 'Revers'#227'o AVP'
          OnClick = ExecutarItemMenu
        end
        object mitrelatoriosaldodevedor: TMenuItem
          Caption = '&Saldos Devedores'
          OnClick = ExecutarItemMenu
        end
        object mitrelatorioatualizacaomonetaria: TMenuItem
          Caption = '&Atualiza'#231#227'o Monet'#225'ria'
          OnClick = ExecutarItemMenu
        end
        object mitrelatoriorecebimentoslongoprazo: TMenuItem
          Caption = 'Recebimentos &Longo Prazo'
          OnClick = ExecutarItemMenu
        end
        object mitrelatorioparcelasatraso: TMenuItem
          Caption = 'Parcelas em Atraso'
          OnClick = ExecutarItemMenu
        end
        object mitArquivoDimob: TMenuItem
          Caption = 'Arquivo Dimob'
          OnClick = ExecutarItemMenu
        end
        object mitDiarioAuxiliarRecebimentosImoveis: TMenuItem
          Caption = 'Di'#225'rio Auxiliar de Recebimentos'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioContratosSituacao: TMenuItem
          Caption = 'Situa'#231#227'o dos Contratos'
          OnClick = ExecutarItemMenu
        end
        object mITRelatoriosituacaoavp: TMenuItem
          Caption = 'Valores de Curto e Longo Prazo e do AVP'
          OnClick = ExecutarItemMenu
        end
        object mitRelatorioContasaReceberImoveis: TMenuItem
          Caption = 'Contas a Receber'
          OnClick = ExecutarItemMenu
        end
      end
    end
    object mitConfiguracoes: TMenuItem
      Tag = 1
      Caption = 'Co&nfigura'#231#245'es'
      object mitConfiguracoesSistema: TMenuItem
        Caption = 'Prefer'#234'nci&as locais'
        OnClick = ExecutarItemMenu
      end
      object mitParametrosSistema: TMenuItem
        Caption = '&Par'#226'metros do Sistema'
        OnClick = ExecutarItemMenu
      end
      object mitLerParametroSistema: TMenuItem
        Tag = 1
        Caption = '&Ler Par'#226'metros do Sistemas'
        OnClick = mitLerParametroSistemaClick
      end
      object mitParametrosCredito: TMenuItem
        Caption = 'Par'#226'metros de &Cr'#233'dito'
        OnClick = ExecutarItemMenu
      end
      object mitMemoriaCredito: TMenuItem
        Caption = 'M&em'#243'ria de Cr'#233'dito'
        OnClick = ExecutarItemMenu
      end
      object mitCadastroLogotipos: TMenuItem
        Caption = 'L&ogotipos'
        OnClick = ExecutarItemMenu
      end
      object mitCarregarModulos: TMenuItem
        Tag = 1
        Caption = 'Carregar &M'#243'dulos'
        OnClick = mitConfiguraMenuPorModulo
      end
      object mitExportacaoDados: TMenuItem
        Tag = 1
        Caption = 'E&xporta'#231#227'o Dados'
        OnClick = ExecutarItemMenu
      end
      object mitEnviarcapturasdetela: TMenuItem
        Caption = 'Enviar capturas de tela'
        OnClick = mitEnviarcapturasdetelaClick
      end
      object mitMonitoraBancoDados: TMenuItem
        Caption = 'Monitora o Banco de Dados'
        OnClick = ExecutarItemMenu
      end
    end
    object mitJanelas: TMenuItem
      Tag = 1
      Caption = '&Janelas'
      object mitAnterior: TMenuItem
        Tag = 1
        Caption = '&Anterior'
        ShortCut = 8309
        OnClick = mitAnteriorClick
      end
      object mitProxima: TMenuItem
        Tag = 1
        Caption = '&Pr'#243'xima'
        ShortCut = 16501
        OnClick = mitProximaClick
      end
      object mitFechar: TMenuItem
        Tag = 1
        Caption = '&Fechar'
        ShortCut = 16499
        OnClick = mitFecharClick
      end
    end
    object mitHelp: TMenuItem
      Tag = 1
      Caption = 'Aj&uda'
      object mitConteudo: TMenuItem
        Tag = 1
        Caption = '&Conte'#250'do'
        OnClick = mitConteudoClick
      end
      object N2: TMenuItem
        Tag = 1
        Caption = '-'
      end
      object mitSobre: TMenuItem
        Tag = 1
        Caption = '&Sobre o'
        OnClick = mitSobreClick
      end
      object TeclIns: TMenuItem
        Tag = 1
        ShortCut = 45
        Visible = False
        OnClick = TeclInsClick
      end
    end
  end
  object tmrAguardando: TTimer
    Interval = 60000
    OnTimer = tmrAguardandoTimer
    Left = 605
    Top = 15
  end
end
