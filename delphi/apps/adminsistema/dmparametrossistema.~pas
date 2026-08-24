unit dmparametrossistema;

interface                     

uses
  //CLX
  SysUtils, Classes, DB, Forms, Variants,
  //Repositorio
  dmbasico,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Componentes
  cpquery, cpdatasource, ZConnect, ZPgSqlCon, cpdatabase, biblio,
  clparametrossistema,
  //Biblio
  ctconstantes, ZTransact, clecf;

type
  TtecParametroFilial = (Global, porFilial);

type
  TdtmParametrosSistema = class(TdtmBasico)
    qryFiliais: TtecQuery;
    dsrFiliais: TtecDataSource;
    qryFiliaiscodigo: TIntegerField;
    qryICMSFrete: TtecQuery;
    dsrICMSFrete: TtecDataSource;
    qryICMSSeguro: TtecQuery;
    dsrICMSSeguro: TtecDataSource;
    qryConsultaICMSFrete: TtecQuery;
    qryConsultaICMSSeguro: TtecQuery;
    qryConsultaICMSFretecodigo: TIntegerField;
    qryConsultaICMSFretedescricao: TStringField;
    qryConsultaICMSSegurocodigo: TIntegerField;
    qryConsultaICMSSegurodescricao: TStringField;
    qryICMSFretecodigo: TIntegerField;
    qryICMSFretedescricao: TStringField;
    qryICMSSegurocodigo: TIntegerField;
    qryICMSSegurodescricao: TStringField;
    qryModeloCarne: TtecQuery;
    qryModeloCarnecodigo: TIntegerField;
    qryModeloCarnedescricao: TStringField;
    dsrModeloCarne: TtecDataSource;
    qryConsultaModeloCarne: TtecQuery;
    qryConsultaModeloCarnecodigo: TIntegerField;
    qryConsultaModeloCarnedescricao: TStringField;
    qryFiliaisnome: TStringField;
    qryPlanos: TtecQuery;
    dsrPlanos: TtecDataSource;
    qryConsultaPlanos: TtecQuery;
    qryConsultaPlanosdescricao: TStringField;
    qryConsultaPlanoscodigo: TIntegerField;
    qryPlanoscodigo: TIntegerField;
    qryPlanosdescricao: TStringField;
    qryPlanoOrcamentoPadrao: TtecQuery;
    dsrPlanoOrcamentoPadrao: TtecDataSource;
    qryPlanoOrcamentoPadraocodigo: TIntegerField;
    qryPlanoOrcamentoPadraodescricao: TStringField;
    qryModeloBoletos: TtecQuery;
    dsrModeloBoletos: TtecDataSource;
    qryConsultaModeloBoletos: TtecQuery;
    qryModeloBoletoscodigo: TIntegerField;
    qryModeloBoletosdescricao: TStringField;
    qryConsultaModeloBoletoscodigo: TIntegerField;
    qryConsultaModeloBoletosdescricao: TStringField;
    qryModeloContratoMatricial: TtecQuery;
    dsrModeloContratoMatricial: TtecDataSource;
    qryModeloContratoMatricialcodigo: TIntegerField;
    qryModeloContratoMatricialdescricao: TStringField;
    qryConsultaModeloContratoMatricial: TtecQuery;
    qryConsultaModeloContratoMatricialdescricao: TStringField;
    qryConsultaModeloContratoMatricialcodigo: TIntegerField;
    qryImpostosRetidos: TtecQuery;
    qryImpostosRetidoscodigo: TIntegerField;
    qryImpostosRetidosdescricao: TStringField;
    qryImpostosRetidostaxa: TFloatField;
    qryImpostosRetidosminimo: TFloatField;
    dsrImpostosRetidos: TtecDataSource;
    qryImpostosRetidosreter: TBooleanField;
    qryImpostosRetidoslegislacao: TStringField;
    qryBonusValorCompra: TtecQuery;
    dsrBonusValorCompra: TtecDataSource;
    qryBonusValorCompraminimo: TFloatField;
    qryBonusValorCompracodigo: TIntegerField;
    qryBonusValorCompramaximo: TFloatField;
    qryBonusValorComprabonus: TIntegerField;
    qryMascaraContas: TtecQuery;
    qryMascaraContasnivel: TIntegerField;
    qryMascaraContasmascara: TStringField;
    qryMascaraContasinativo: TDateField;
    dsrMascaraContas: TtecDataSource;
    qryProcuraDebitaraVista: TtecQuery;
    qryProcuraDebitaraVistacodigo: TIntegerField;
    qryProcuraDebitaraVistaclassificacao: TStringField;
    qryProcuraDebitaraVistadescricao: TStringField;
    dsrProcuraDebitaraVista: TtecDataSource;
    qryProcuraCreditaraVista: TtecQuery;
    IntegerField3: TIntegerField;
    StringField6: TStringField;
    StringField1: TStringField;
    dsrProcuraCreditaraVista: TtecDataSource;
    qryConsultaContaContabil: TtecQuery;
    qryConsultaContaContabildescricaoedentada: TStringField;
    qryConsultaContaContabildescricao: TStringField;
    qryConsultaContaContabilclassificacao: TStringField;
    qryConsultaContaContabilcodigo: TIntegerField;
    qryConsultaContaContabiltipo: TStringField;
    qryProcuraDebitaraPrazo: TtecQuery;
    qryProcuraDebitaraPrazocodigo: TIntegerField;
    qryProcuraDebitaraPrazoclassificacao: TStringField;
    qryProcuraDebitaraPrazodescricao: TStringField;
    dsrProcuraDebitaraPrazo: TtecDataSource;
    qryProcuraCreditaraPrazo: TtecQuery;
    IntegerField1: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    dsrProcuraCreditaraPrazo: TtecDataSource;
    qryProcuraDebitarAbatimentos: TtecQuery;
    qryProcuraDebitarAbatimentoscodigo: TIntegerField;
    qryProcuraDebitarAbatimentosclassificacao: TStringField;
    qryProcuraDebitarAbatimentosdescricao: TStringField;
    dsrProcuraDebitarAbatimentos: TtecDataSource;
    qryProcuraCreditarAbatimentos: TtecQuery;
    IntegerField2: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    dsrProcuraCreditarAbatimentos: TtecDataSource;
    qryProcuraDebitarDevolucoes: TtecQuery;
    qryProcuraDebitarDevolucoescodigo: TIntegerField;
    qryProcuraDebitarDevolucoesclassificacao: TStringField;
    qryProcuraDebitarDevolucoesdescricao: TStringField;
    dsrProcuraDebitarDevolucoes: TtecDataSource;
    qryProcuraCreditarDevolucoes: TtecQuery;
    IntegerField4: TIntegerField;
    StringField8: TStringField;
    StringField9: TStringField;
    dsrProcuraCreditarDevolucoes: TtecDataSource;
    qryProcuraHistoricoVendaaVista: TtecQuery;
    qryProcuraHistoricoVendaaVistacodigo: TIntegerField;
    qryProcuraHistoricoVendaaVistadescricao: TStringField;
    dsrProcuraHistoricoVendaaVista: TtecDataSource;
    qryConsultaHistorico: TtecQuery;
    qryConsultaHistoricodescricao: TStringField;
    qryConsultaHistoricocodigo: TIntegerField;
    qryProcuraHistoricoVendaaPrazo: TtecQuery;
    qryProcuraHistoricoVendaaPrazocodigo: TIntegerField;
    qryProcuraHistoricoVendaaPrazodescricao: TStringField;
    dsrProcuraHistoricoVendaaPrazo: TtecDataSource;
    qryProcuraHistoricoAbatimentos: TtecQuery;
    qryProcuraHistoricoAbatimentoscodigo: TIntegerField;
    qryProcuraHistoricoAbatimentosdescricao: TStringField;
    dsrProcuraHistoricoAbatimentos: TtecDataSource;
    qryProcuraHistoricoDevolucoes: TtecQuery;
    qryProcuraHistoricoDevolucoescodigo: TIntegerField;
    qryProcuraHistoricoDevolucoesdescricao: TStringField;
    dsrProcuraHistoricoDevolucoes: TtecDataSource;
    qryParametrosContas: TtecQuery;
    qryParametrosContasdebitarvendaavista: TIntegerField;
    qryParametrosContasdebitarvendaaprazo: TIntegerField;
    qryParametrosContasdebitarabatimentos: TIntegerField;
    qryParametrosContasdebitardevolucoes: TIntegerField;
    qryParametrosContascreditarvendaavista: TIntegerField;
    qryParametrosContascreditarvendaaprazo: TIntegerField;
    qryParametrosContascreditarabatimentos: TIntegerField;
    qryParametrosContascreditardevolucoes: TIntegerField;
    qryParametrosContashistoricovendaavista: TIntegerField;
    qryParametrosContashistoricovendaaprazo: TIntegerField;
    qryParametrosContashistoricoabatimentos: TIntegerField;
    qryParametrosContashistoricodevolucoes: TIntegerField;
    dsrParametrosContas: TtecDataSource;
    qryParametrosContastipo: TStringField;
    qryContas: TtecQuery;
    qryContasBanco: TIntegerField;
    qryContasAgencia: TIntegerField;
    qryContasConta: TIntegerField;
    qryContasDigito: TStringField;
    qryContasSigla: TStringField;
    qryContasNome: TStringField;
    qryContasSequencial: TIntegerField;
    dsrContas: TtecDataSource;
    qryConsultaContas: TtecQuery;
    qryConsultaContasSigla: TStringField;
    qryConsultaContasNome: TStringField;
    qryConsultaContasConta: TIntegerField;
    qryConsultaContasDigito: TStringField;
    qryConsultaContasTitular: TStringField;
    qryConsultaContasAgencia: TIntegerField;
    qryConsultaContasBanco: TIntegerField;
    qryCalendario: TtecQuery;
    qryCalendariofilial: TIntegerField;
    qryCalendarioano: TIntegerField;
    qryCalendarioJaneiro: TStringField;
    qryCalendarioFevereiro: TStringField;
    qryCalendarioMarco: TStringField;
    qryCalendarioAbril: TStringField;
    qryCalendarioMaio: TStringField;
    qryCalendarioJunho: TStringField;
    qryCalendarioJulho: TStringField;
    qryCalendarioAgosto: TStringField;
    qryCalendarioSetembro: TStringField;
    qryCalendarioOutubro: TStringField;
    qryCalendarioNovembro: TStringField;
    qryCalendarioDezembro: TStringField;
    qryAtualizarCalendarios: TtecQuery;
    qryIncluirCalendarios: TtecQuery;
    qryVenctosImpostosRetidosEntradas: TtecQuery;
    dsrVenctosImpostosRetidosEntradas: TtecDataSource;
    qryVenctosImpostosRetidosEntradasdescricao: TStringField;
    qryVenctosImpostosRetidosEntradasparametro_inicial: TStringField;
    qryVenctosImpostosRetidosEntradasdia: TIntegerField;
    qryVenctosImpostosRetidosEntradasparametro_final: TStringField;
    qryVenctosImpostosRetidosEntradasquinzenal: TBooleanField;
    qryVenctosImpostosRetidosEntradasdescricaoabrev: TStringField;
    qryVenctosImpostosRetidosEntradasocasiao: TStringField;
    qryVenctosImpostosRetidosEntradasfornecedor: TIntegerField;
    qryVenctosImpostosRetidosEntradastipofornecedor: TStringField;
    qryIncluirVenctosImpostosRetidosEntradas: TtecQuery;
    qryVenctosImpostosRetidosEntradasfilial: TIntegerField;
    qryContasEntradasFiliais: TtecQuery;
    qryContasEntradasFiliaisfilial: TIntegerField;
    qryContasEntradasFiliaiscontacontabil: TIntegerField;
    qryContasEntradasFiliaisdescricao: TStringField;
    qryContasEntradasFiliaisdescricaoconta: TStringField;
    qryContasEntradasFiliaisclassificacao: TStringField;
    qryContasSaidasFiliais: TtecQuery;
    qryContasSaidasFiliaisfilial: TIntegerField;
    qryContasSaidasFiliaiscontacontabil: TIntegerField;
    qryContasSaidasFiliaisdescricao: TStringField;
    qryContasSaidasFiliaisdescricaoconta: TStringField;
    qryContasSaidasFiliaisclassificacao: TStringField;
    dsrContasEntradasFiliais: TtecDataSource;
    dsrContasSaidasFiliais: TtecDataSource;
    qryMascaraBancos: TtecQuery;
    dsrMascaraBancos: TtecDataSource;
    qryMascaraBancosnivel: TIntegerField;
    qryMascaraBancosmascara: TStringField;
    qryMascaraBancosinativo: TDateField;
    qryMascaraContastipo: TStringField;
    qryMascaraBancostipo: TStringField;
    qryNaturezasPadrao: TtecQuery;
    qryNaturezasPadraodescricao: TStringField;
    qryNaturezasPadraonatureza: TIntegerField;
    dsrNaturezasPadrao: TtecDataSource;
    qryNaturezasPadraodescricaonatureza: TStringField;
    qryImpostosRetidosregime: TStringField;
    qryImpostosRetidosarredondamento: TStringField;
    qryParametrosContasImoveis: TtecQuery;
    dsrParametrosContasImoveis: TtecDataSource;
    qryParametrosContasImoveisCreditarCOFINSVenda: TIntegerField;
    qryParametrosContasImoveisCreditarCSLLVenda: TIntegerField;
    qryParametrosContasImoveisCreditarIRPJVenda: TIntegerField;
    qryParametrosContasImoveisCreditarPISVenda: TIntegerField;
    qryParametrosContasImoveisDebitarCSLLChaves: TIntegerField;
    qryParametrosContasImoveisDebitarIRPJChaves: TIntegerField;
    qryParametrosContasImoveisDebitarPISChaves: TIntegerField;
    qryParametrosContasImoveisCreditarCOFINSRecebimento: TIntegerField;
    qryParametrosContasImoveisCreditarCSLLRecebimento: TIntegerField;
    qryParametrosContasImoveisCreditarIRPJRecebimento: TIntegerField;
    qryParametrosContasImoveiscreditarpisrecebimento: TIntegerField;
    qryParametrosContasImoveisDebitarCOFINSChaves: TIntegerField;
    qryParametrosContasImoveisEvento: TIntegerField;
    qryParametrosContasImoveisHistoricoVendaLancamento: TIntegerField;
    qryParametrosContasImoveisHistoricoVendaImpostos: TIntegerField;
    qryParametrosContasImoveisHistoricoChavesValorVenda: TIntegerField;
    qryParametrosContasImoveisHistoricoChavesImpostos: TIntegerField;
    qryParametrosContasImoveisHistoricoChavescustosComissoes: TIntegerField;
    qryParametrosContasImoveisHistoricoChavesAtualizacaoMonetaria: TIntegerField;
    qryParametrosContasImoveisHistoricoRecebCaixaBanco: TIntegerField;
    qryParametrosContasImoveisHistoricoRecebPrincipal: TIntegerField;
    qryParametrosContasImoveisHistoricoRecebAtualizacaoMonetaria: TIntegerField;
    qryParametrosContasImoveisHistoricoRecebDescontos: TIntegerField;
    qryParametrosContasImoveishistoricorecebjuros: TIntegerField;
    qryParametrosContasImoveishistoricorecebimpostos: TIntegerField;
    qryParametrosContasImoveiscontaContaCreditarCEF: TIntegerField;
    qrySignatarios: TtecQuery;
    dsrSignatarios: TtecDataSource;
    qrySignatarioscpf: TStringField;
    qrySignatariosnome: TStringField;
    qrySignatariosqualificacao: TStringField;
    qrySignatarioscrc: TStringField;
    qrySignatariosdescricaoqualificacao: TStringField;
    qryParametrosContasImoveisPrazoDevolucaoCobranca: TIntegerField;
    qryContasSaidasFiliaishistoricocontabil: TIntegerField;
    qryContasSaidasFiliaisdescricaohistorico: TStringField;
    qryContasEntradasFiliaishistoricocontabil: TIntegerField;
    qryContasEntradasFiliaisdescricaohistorico: TStringField;
    qryParametrosContasImoveisDebitarDespesasVenda: TIntegerField;
    qryProducao: TtecQuery;
    StringField7: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    dsrProducao: TtecDataSource;
    qryParametrosProducao: TtecQuery;
    dsrParametrosProducao: TtecDataSource;
    qryParametrosProducaoqtcargagas: TIntegerField;
    qryParametrosProducaofornecedorgas: TIntegerField;
    qryParametrosProducaoprodutoplaca: TLargeintField;
    qryParametrosProducaoqtplacascarga: TIntegerField;
    qryParametrosProducaociclodevidadaplaca: TIntegerField;
    qryParametrosProducaoperccustoadimpprod: TFloatField;
    qryParametrosProducaoperccustoestoque: TFloatField;
    qryParametrosProducaoperccustoadimpgeral: TFloatField;
    qryParametrosProducaopercmargemlucro: TFloatField;
    qryParametrosProducaoperccustovenda: TFloatField;
    qryParametrosProducaoperccustoadm: TFloatField;
    qryParametrosProducaoperccustodesenv: TFloatField;
    qryParametrosProducaoprodutoplacavisual: TStringField;
    qryParametrosContasImoveisDebitarAtualizacaoMonetariaAte2013: TIntegerField;
    qryParametrosContasImoveisDebitarAtualizacaoMonetariaApos2014: TIntegerField;
    qryAtualizarSequenciainiciacamponossonumeronaparcela: TtecQuery;
    qryUltimoNossoNumeroParcelas: TtecQuery;
    qryUltimoNossoNumeroParcelasnossonumero: TLargeintField;
    qrySequenciainiciacamponossonumeronaparcela: TtecQuery;
    qrySequenciainiciacamponossonumeronaparcelalast_value: TLargeintField;
    dsrSequenciainiciacamponossonumeronaparcela: TtecDataSource;
    qrySignatariosfone: TStringField;
    qrySignatariosemail: TStringField;
    qrySignatariosuf_crc: TStringField;
    qrySignatariosdata_crc: TDateField;
    qrySignatariosnum_seq_crc: TStringField;
    qryParametrosContasImoveisApropriarImpostosImoveis: TBooleanField;
    qryParametrosContasImoveishistoricoapropriacaomensal: TIntegerField;
    qryParametrosContasImoveishistoricoapropriacaomensalimpostos: TIntegerField;
    qryParametrosContasImoveisAVPImoveisEmConstrucao: TIntegerField;
    qryParametrosContasImoveisAVPImoveisConcluidos: TIntegerField;
    qryParametrosContasImoveisAVPHistoricoProvisionamento: TIntegerField;
    qryParametrosContasImoveisAVPHistoricoReversao: TIntegerField;
    qryParametrosContasImoveisAVPNrMinimoDias: TIntegerField;
    qryParametrosContasImoveisAVPDeveSerApropriado: TBooleanField;
    qryParametrosContasImoveisAVPHistoricoTransfLongoCurtoPrazo: TIntegerField;
    qrySignatariosind_resp_legal: TStringField;
    qryParametrosContasImoveisContaContratosRescindidosComHabiteSe: TIntegerField;
    qryParametrosContasImoveisContaAjusteValorRenegociacoes: TIntegerField;
    qryParametrosContasImoveisContaAjusteValorTransferencias: TIntegerField;
    qryParametrosContasImoveisHistoricoRescisoes: TIntegerField;
    qryParametrosContasImoveisHistoricoRenegociacoes: TIntegerField;
    qryParametrosContasImoveisHistoricoTransferencias: TIntegerField;
    qryParametrosContasImoveisContaReversaoCustoImoveis: TIntegerField;
    qryParametrosContasImoveisHistoricoAjusteTransferencias: TIntegerField;
    qryParametrosContasImoveisHistoricoTransferenciaCurtoParaLongoP: TIntegerField;
    qryParametrosContasImoveisHistoricoTransferenciaLongoParaCurtoP: TIntegerField;
    qryParametrosContasImoveisHistoricoApuracaoCustos: TIntegerField;
    qryParametrosContasImoveisHistoricoAjusteRenegociacoes: TIntegerField;
    dsrMeiosdePagamentoecf: TtecDataSource;
    qryMeiosdePagamentoecf: TtecQuery;
    qryMeiosdePagamentoecfecf: TIntegerField;
    qryMeiosdePagamentoecfmeiodepagamento: TIntegerField;
    qryMeiosdePagamentoecfdescricaoecf: TStringField;
    qryMeiosdePagamentoecfdescricaomeiodepagamento: TStringField;
    qryAtualizarMeiosdePagamentoecf: TtecQuery;
    qryNaturezasPadraocodigofiscal: TIntegerField;
    qryNaturezasPadraotipomovimento: TStringField;
    qryParametrosContasImoveisContaContratosRescindidosSemHabiteSe: TIntegerField;
    qryImpostosRetidosaplicacao: TStringField;
    qrySignatariosind_resp_nfe: TStringField;
    procedure qryFiliaisAfterScroll(DataSet: TDataSet);
    procedure qryBonusValorCompraBeforeInsert(DataSet: TDataSet);
    procedure qryBonusValorCompraAfterInsert(DataSet: TDataSet);
    procedure dsrBonusValorCompraDataChange(Sender: TObject;
      Field: TField);
    procedure dsrParametrosContasDataChange(Sender: TObject;
      Field: TField);
    procedure qryVenctosImpostosRetidosEntradasAfterInsert(
      DataSet: TDataSet);
    procedure qryVenctosImpostosRetidosEntradasCalcFields(
      DataSet: TDataSet);
    procedure qryVenctosImpostosRetidosEntradasAfterScroll(
      DataSet: TDataSet);
    procedure dsrVenctosImpostosRetidosEntradasDataChange(Sender: TObject;
      Field: TField);
    procedure qryVenctosImpostosRetidosEntradasBeforePost(
      DataSet: TDataSet);
    procedure qryContasEntradasFiliaisAfterInsert(DataSet: TDataSet);
    procedure qryContasSaidasFiliaisAfterInsert(DataSet: TDataSet);
    procedure qryMascaraContasNewRecord(DataSet: TDataSet);
    procedure qryMascaraBancosNewRecord(DataSet: TDataSet);
    procedure qryNaturezasPadraoAfterInsert(DataSet: TDataSet);
    procedure dsrContasEntradasFiliaisDataChange(Sender: TObject;
      Field: TField);
    procedure dsrContasSaidasFiliaisDataChange(Sender: TObject;
      Field: TField);
    procedure dsrSequenciainiciacamponossonumeronaparcelaDataChange(
      Sender: TObject; Field: TField);
    procedure qrySequenciainiciacamponossonumeronaparcelaAfterOpen(
      DataSet: TDataSet);
    procedure dsrSignatariosDataChange(Sender: TObject; Field: TField);
    procedure qryImpostosRetidosNewRecord(DataSet: TDataSet);
    procedure qryImpostosRetidosBeforePost(DataSet: TDataSet);
    procedure qrySignatariosNewRecord(DataSet: TDataSet);
  private
    FOnScrollFiliais: TNotifyEvent;
    FBonusValorCompraMinimo: Real;
    FTipoSugestao: byte;
    FTipoParametroFilial: TtecParametroFilial;
    FVenctosImpostosRetidosEntradas: TNotifyEvent;
    FVenctosImpostosRetidosEntradastipofornecedor: String;
    function getCodigoFilial: Integer;
    function getTabelaConsultaFrete: TZDataset;
    function getTabelaConsultaSeguro: TZDataset;
    function getCodigoFrete: Integer;
    function getCodigoSeguro: Integer;
    function getCodigoModeloCarne: Integer;
    function getCodigoModeloBoleto: Integer;
    function getTabelaConsultaModeloCarne: TZDataset;
    function getTabelaConsultaModeloBoleto: TZDataset;
    function getTabelaConsultaPlano: TZDataset;
    function getCodigoPlano: Integer;
    function getCodigoPlanoOrcamentoPadrao: Integer;
    function getCodigoModeloContratoMatricial: Integer;
    function getTabelaConsultaModeloContratoMatricial: TZDataset;
    procedure setFaixaMinimo(Query: TtecQuery);
    procedure VerificaValores(Query: TtecQuery; Field: TField);
    procedure SetTipoSugestao(const Value: byte);
    procedure setVenctosImpostosRetidosEntradastipofornecedor(
      const Value: String);
  public
    vedtSequenciainiciacamponossonumeronaparcela : integer;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ExisteFrete(NomeCampo: String; Value: Variant): Boolean;
    function ExisteConta(NomeCampo: String; Value: Variant): Boolean;
    function ExisteSeguro(NomeCampo: String; Value: Variant): Boolean;
    function ExistePlano(NomeCampo: String; Value: Variant): Boolean;
    function ExistePlanoOrcamentoPadrao(NomeCampo: String; Value: Variant): Boolean;
    procedure SelecionarFrete; overload;
    procedure SelecionarFrete(CodigoFrete: Integer); overload;
    procedure SelecionarConta; overload;
    procedure SelecionarConta(NumeroConta: Integer); overload;
    procedure SelecionarSeguro; overload;
    procedure SelecionarSeguro(CodigoSeguro: Integer); overload;
    procedure SelecionarCarne; overload;
    procedure SelecionarBoleto; overload;
    procedure SelecionarCarne(CodigoCarne: Integer); overload;
    procedure SelecionarBoleto(CodigoBoleto: Integer); overload;
    procedure SelecionarPlano; overload;
    procedure SelecionarPlano(CodigoPlano: Integer); overload;
    procedure SelecionarPlanoOrcamentoPadrao; overload;
    procedure SelecionarPlanoOrcamentoPadrao(CodigoPlano: Integer); overload;
    procedure SelecionarContratoMatricial; overload;
    procedure SelecionarContratoMatricial(CodigoContrato: Integer); overload;
    property CodigoFilial: Integer read getCodigoFilial;
    property CodigoFrete: Integer read getCodigoFrete;
    property CodigoSeguro: Integer read getCodigoSeguro;
    property CodigoModeloCarne: Integer read getCodigoModeloCarne;
    property CodigoModeloBoleto: Integer read getCodigoModeloBoleto;
    property CodigoPlano: Integer read getCodigoPlano;
    property CodigoPlanoOrcamentoPadrao: Integer read getCodigoPlanoOrcamentoPadrao;
    property CodigoModeloContratoMatricial: Integer read getCodigoModeloContratoMatricial;
    property OnScrollFiliais: TNotifyEvent read FOnScrollFiliais write FOnScrollFiliais;
    property OnScrollVenctosImpostosRetidosEntradas: TNotifyEvent read FVenctosImpostosRetidosEntradas write FVenctosImpostosRetidosEntradas;
    property TabelaConsultaFrete: TZDataset read getTabelaConsultaFrete;
    property TabelaConsultaSeguro: TZDataset read getTabelaConsultaSeguro;
    property TabelaConsultaModeloCarne: TZDataset read getTabelaConsultaModeloCarne;
    property TabelaConsultaModeloBoleto: TZDataset read getTabelaConsultaModeloBoleto;
    property TabelaConsultaPlano: TZDataset read getTabelaConsultaPlano;
    property TabelaConsultaModeloContratoMatricial: TZDataset read getTabelaConsultaModeloContratoMatricial;
    property BonusValorCompraMinimo               : Real read FBonusValorCompraMinimo write FBonusValorCompraMinimo;
    function SalvarImpostosRetidos: Boolean;
    function SalvarNaturezasPadrao: Boolean;
    function ExcluirImpostoRetido: Boolean;
    procedure MarcarCampoReter;
    procedure verificaPreenchimentoBonus;
    function SalvarBonusValorCompra: Boolean;
    function ExcluirBonusValorCompra: Boolean;
    procedure AbrirMascaras;
    procedure AbrirContasEntradaseSaidas;    
    function SalvarMascaraContas: Boolean;
    function SalvarMascaraBancos: Boolean;
    function SalvarParametrosContas: Boolean;
    function SalvarParametrosContasImoveis: Boolean;
    function SalvarParametrosProducao: Boolean;

    function SalvarCalendario: Boolean;
    function SalvarContasContabeis: Boolean;
    function SalvarSignatarios: Boolean;
    function SalvarVenctosImpostosRetidosEntradas: Boolean;

    procedure AbreTabelasConsulta(TipoConsulta: TtecParSistemaTipoConsulta);
    procedure FechaTabelasConsulta(TipoConsulta: TtecParSistemaTipoConsulta);
    procedure Selecionar(TipoConsulta: TtecParSistemaTipoConsulta);
    function ExisteContaContabil(campo, codigo: String): Boolean;
    function ExisteHistorico(campo, codigo: string): boolean;
    property TipoSugestao: byte read FTipoSugestao write SetTipoSugestao;
    procedure VerificarFeriados(var dias: ARRAY OF BOOLEAN;
                                Data: TDateTime;
                                var SituacaoFeriado:Boolean; Setar:Boolean);
    procedure DefinirFeriado(Data: TDateTime; EhFeriado: Boolean);
    function  EhFeriadoNacional(Dia, Mes: Integer): boolean;
    property TipoParametroFilial: TtecParametroFilial read FTipoParametroFilial write FTipoParametroFilial;
    procedure VerificarVenctosImpostosRetidosEntradas;
    procedure MarcarCampoQuinzenal;
    procedure GerarContasEntradas;
    procedure GerarContasSaidas;
    procedure GravarNaturezasPadrao;
    procedure CancelarNaturezasPadrao;
    function LimparContaEntrada: Boolean;
    function LimparHistoricoEntrada: Boolean;
    function LimparContaSaida: Boolean;
    function LimparHistoricoSaida: Boolean;
    property VenctosImpostosRetidosEntradastipofornecedor: String
      read FVenctosImpostosRetidosEntradastipofornecedor
      write setVenctosImpostosRetidosEntradastipofornecedor;

    function UltimoNossoNumeroParcela: integer;
    procedure AbreqrySequenciainiciacamponossonumeronaparcela;

    function SalvarNossoNumeroParcela: boolean;
    function PerpetrarTabelasDiversas: Boolean;
  end;

var
  dtmParametrosSistema: TdtmParametrosSistema;

implementation

Uses
  //Repositorio
  dmtecsoft, dateUtils;

{$R *.dfm}

{ TdtmParametrosSistema }

procedure TdtmParametrosSistema.AbreqrySequenciainiciacamponossonumeronaparcela;
begin
  qrySequenciainiciacamponossonumeronaparcela.Close;
  qrySequenciainiciacamponossonumeronaparcela.Open;
end;



constructor TdtmParametrosSistema.Create(AOwner: TComponent);
begin
  inherited;
  qryFiliais.Tag                := ctTabelaConsultaFiliais;
  qryICMSFrete.Tag              := ctTabelaConsultaFiliais;
  qryICMSSeguro.Tag             := ctTabelaConsultaFiliais;
  qryModeloCarne.Tag            := ctTabelaConsultaFiliais;
  qryPlanos.Tag                 := ctTabelaConsultaFiliais;
  qryModeloBoletos.Tag          := ctTabelaConsultaFiliais;
  qryImpostosRetidos.Tag        := ctTabelaConsultaFiliais;
  qryNaturezasPadrao.Tag        := ctTabelaConsultaFiliais;
  qryBonusValorCompra.Tag       := ctTabelaConsultaFiliais;
  qryParametrosContas.Tag       := ctTabelaConsultaFiliais;
  qrycontas.Tag                 := ctTabelaConsultaFiliais;
  qryCalendario.Tag             := ctTabelaConsultaFiliais;

  if assigned(ecfpadrao) then
  begin
    qryAtualizarMeiosdePagamentoecf.ParamByName('ecf').AsString := FCodigoECF;
    qryAtualizarMeiosdePagamentoecf.ExecSQL;
    RefazConsultaPorNome(qryMeiosdePagamentoecf, ['ecf'], [FCodigoECF]);
  end;

  qryParametrosContasImoveis.Open;
  qryParametrosproducao.Open;

  qryConsultaICMSFrete.Tag      := ctTabelaConsultaFrete;
  qryConsultaICMSSeguro.Tag     := ctTabelaConsultaSeguro;
  qryConsultaModeloCarne.Tag    := ctTabelaConsultaCarne;
  qryConsultaPlanos.Tag         := ctTabelaConsultaPlano;
  qryConsultaModeloBoletos.Tag  := ctTabelaConsultaBoleto;
  qryModeloContratoMatricial.Tag := ctTabelaConsultaFiliais;
  qryConsultaModeloContratoMatricial.Tag := ctTabelaConsultaContratoMatricial;

  qrySignatarios.Tag := ctTabelas;

  qryConsultaContaContabil.Tag := ctConsultaContaContabil;
  qryProcuraDebitaraVista.Params[1].AsInteger   := 0;
  qryProcuraCreditaraVista.Params[1].AsInteger  := 0;
  qryProcuraDebitaraPrazo.Params[1].AsInteger   := 0;
  qryProcuraCreditaraPrazo.Params[1].AsInteger  := 0;
  qryProcuraDebitarAbatimentos.Params[1].AsInteger := 0;
  qryProcuraCreditarAbatimentos.Params[1].AsInteger := 0;
  qryProcuraDebitarDevolucoes.Params[1].AsInteger := 0;
  qryProcuraCreditarDevolucoes.Params[1].AsInteger := 0;
  qryConsultaHistorico.Tag := ctConsultaHistoricos;

  setFaixaMinimo(qryBonusValorCompra);
  TipoParametroFilial := Global;
  AbreqrySequenciainiciacamponossonumeronaparcela;
end;

procedure TdtmParametrosSistema.Selecionar(
  TipoConsulta: TtecParSistemaTipoConsulta);
begin
  case TipoConsulta of
  pscContaContabilEntrada : begin
                              if qryConsultaContaContabiltipo.AsString<>'S' then
                              begin
                                 if not (qryContasEntradasFiliais.State in [dsinsert, dsedit]) then
                                   qryContasEntradasFiliais.Edit;
                                 case FTipoParametroFilial of
                                   Global : qryContasEntradasFiliaisfilial.clear;
                                   porFilial : qryContasEntradasFiliaisfilial.AsInteger := qryFiliaiscodigo.AsInteger;
                                 end;
                                 qryContasEntradasFiliaiscontacontabil.AsInteger := qryConsultaContaContabilcodigo.AsInteger;
                                 qryContasEntradasFiliaisdescricaoconta.AsString := qryConsultaContaContabildescricao.AsString;
                                 qryContasEntradasFiliaisclassificacao.AsString  := qryConsultaContaContabilclassificacao.AsString;
                                 qryContasEntradasFiliais.Post;
                              end
                              else
                              begin
                                if not qryContasEntradasFiliaiscontacontabil.IsNull then
                                begin
                                  if not (qryContasEntradasFiliais.state in [dsinsert, dsedit]) then
                                    qryContasEntradasFiliais.Edit;
                                  qryContasEntradasFiliaiscontacontabil.Clear;
                                  qryContasEntradasFiliais.Post;
                                end;
                              end;
                            end;

 pscContaContabilSaida    : begin
                              if qryConsultaContaContabiltipo.AsString<>'S' then
                              begin
                                 if not (qryContasSaidasFiliais.State in [dsinsert, dsedit]) then
                                   qryContasSaidasFiliais.Edit;
                                 case FTipoParametroFilial of
                                   Global : qryContasSaidasFiliaisfilial.clear;
                                   porFilial : qryContasSaidasFiliaisfilial.AsInteger := qryFiliaiscodigo.AsInteger;
                                 end;
                                 qryContasSaidasFiliaiscontacontabil.AsInteger := qryConsultaContaContabilcodigo.AsInteger;
                                 qryContasSaidasFiliaisdescricaoconta.AsString := qryConsultaContaContabildescricao.AsString;
                                 qryContasSaidasFiliaisclassificacao.AsString  := qryConsultaContaContabilclassificacao.AsString;
                                 qryContasSaidasFiliais.Post;
                              end
                              else
                              begin
                                if not qryContasSaidasFiliaiscontacontabil.IsNull then
                                begin
                                  if not (qryContasSaidasFiliais.state in [dsinsert, dsedit]) then
                                    qryContasSaidasFiliais.Edit;
                                  qryContasSaidasFiliaiscontacontabil.Clear;
                                  qryContasSaidasFiliais.Post;
                                end;
                              end;
                            end;

     pscDebitarVendaaVista : begin
                              if qryConsultaContaContabiltipo.AsString<>'S' then
                              begin
                                if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                  qryparametrosContas.Edit;
                                qryparametrosContasdebitarvendaavista.AsInteger := qryConsultaContaContabilcodigo.AsInteger
                              end
                              else
                              begin
                                if not qryparametrosContasdebitarvendaavista.IsNull then
                                begin
                                  if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                    qryparametrosContas.Edit;
                                  qryparametrosContasdebitarvendaavista.Clear;
                                end;
                              end
                            end;

    pscCreditarVendaaVista : begin
                              if qryConsultaContaContabiltipo.AsString<>'S' then
                              begin
                                if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                  qryparametrosContas.Edit;
                                qryparametrosContascreditarvendaavista.AsInteger := qryConsultaContaContabilcodigo.AsInteger
                              end
                              else
                              begin
                                if not qryparametrosContascreditarvendaavista.IsNull then
                                begin
                                  if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                    qryparametrosContas.Edit;
                                  qryparametrosContascreditarvendaavista.Clear;
                                end;
                              end
                            end;
   pscHistoricoVendaaVista : begin
                              if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                 qryparametrosContas.Edit;
                              qryparametrosContashistoricovendaavista.AsInteger := qryConsultaHistoricocodigo.AsInteger
                            end;

     pscDebitarVendaaPrazo : begin
                              if qryConsultaContaContabiltipo.AsString<>'S' then
                              begin
                                if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                  qryparametrosContas.Edit;
                                qryparametrosContasdebitarvendaaprazo.AsInteger := qryConsultaContaContabilcodigo.AsInteger
                              end
                              else
                              begin
                                if not qryparametrosContasdebitarvendaaprazo.IsNull then
                                begin
                                  if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                    qryparametrosContas.Edit;
                                  qryparametrosContasdebitarvendaaprazo.Clear;
                                end;
                              end
                            end;

    pscCreditarVendaaPrazo : begin
                              if qryConsultaContaContabiltipo.AsString<>'S' then
                              begin
                                if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                  qryparametrosContas.Edit;
                                qryparametrosContascreditarvendaaprazo.AsInteger := qryConsultaContaContabilcodigo.AsInteger
                              end
                              else
                              begin
                                if not qryparametrosContascreditarvendaaprazo.IsNull then
                                begin
                                  if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                    qryparametrosContas.Edit;
                                  qryparametrosContascreditarvendaaprazo.Clear;
                                end;
                              end
                            end;
   pscHistoricoVendaaPrazo : begin
                              if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                 qryparametrosContas.Edit;
                              qryparametrosContashistoricovendaaprazo.AsInteger := qryConsultaHistoricocodigo.AsInteger
                            end;


     pscDebitarAbatimentos : begin
                              if qryConsultaContaContabiltipo.AsString<>'S' then
                              begin
                                if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                  qryparametrosContas.Edit;
                                qryparametrosContasdebitarabatimentos.AsInteger := qryConsultaContaContabilcodigo.AsInteger
                              end
                              else
                              begin
                                if not qryparametrosContasdebitarabatimentos.IsNull then
                                begin
                                  if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                    qryparametrosContas.Edit;
                                  qryparametrosContasdebitarabatimentos.Clear;
                                end;
                              end
                            end;

    pscCreditarAbatimentos : begin
                              if qryConsultaContaContabiltipo.AsString<>'S' then
                              begin
                                if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                  qryparametrosContas.Edit;
                                qryparametrosContascreditarabatimentos.AsInteger := qryConsultaContaContabilcodigo.AsInteger
                              end
                              else
                              begin
                                if not qryparametrosContascreditarabatimentos.IsNull then
                                begin
                                  if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                    qryparametrosContas.Edit;
                                  qryparametrosContascreditarabatimentos.Clear;
                                end;
                              end
                            end;
   pscHistoricoAbatimentos : begin
                              if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                 qryparametrosContas.Edit;
                              qryparametrosContashistoricoabatimentos.AsInteger := qryConsultaHistoricocodigo.AsInteger
                            end;
     pscDebitarDevolucoes : begin
                              if qryConsultaContaContabiltipo.AsString<>'S' then
                              begin
                                if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                  qryparametrosContas.Edit;
                                qryparametrosContasdebitarDevolucoes.AsInteger := qryConsultaContaContabilcodigo.AsInteger
                              end
                              else
                              begin
                                if not qryparametrosContasdebitarDevolucoes.IsNull then
                                begin
                                  if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                    qryparametrosContas.Edit;
                                  qryparametrosContasdebitarDevolucoes.Clear;
                                end;
                              end
                            end;

    pscCreditarDevolucoes : begin
                              if qryConsultaContaContabiltipo.AsString<>'S' then
                              begin
                                if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                  qryparametrosContas.Edit;
                                qryparametrosContascreditarDevolucoes.AsInteger := qryConsultaContaContabilcodigo.AsInteger
                              end
                              else
                              begin
                                if not qryparametrosContascreditarDevolucoes.IsNull then
                                begin
                                  if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                    qryparametrosContas.Edit;
                                  qryparametrosContascreditarDevolucoes.Clear;
                                end;
                              end
                            end;
   pscHistoricoDevolucoes : begin
                              if not (qryparametrosContas.state in [dsinsert, dsedit]) then
                                 qryparametrosContas.Edit;
                              qryparametrosContashistoricoDevolucoes.AsInteger := qryConsultaHistoricocodigo.AsInteger
                            end;
   pscHistoricoEntrada     : begin
                               if not (qryContasEntradasFiliais.state in [dsinsert, dsedit]) then
                                 qryContasEntradasFiliais.edit;
                               qryContasEntradasFiliaishistoricocontabil.AsInteger:= qryConsultaHistoricocodigo.AsInteger;
                               qryContasEntradasFiliaisdescricaohistorico.AsString:= qryConsultaHistoricodescricao.AsString;
                               qryContasEntradasFiliais.Post;
                             end;
   pscHistoricoSaida       : begin
                               if not (qryContasSaidasFiliais.state in [dsinsert, dsedit]) then
                                 qryContasSaidasFiliais.edit;
                               qryContasSaidasFiliaishistoricocontabil.AsInteger:= qryConsultaHistoricocodigo.AsInteger;
                               qryContasSaidasFiliaisdescricaohistorico.AsString:= qryConsultaHistoricodescricao.AsString;
                               qryContasSaidasFiliais.Post;
                             end;



  end;

end;


procedure TdtmParametrosSistema.AbrirContasEntradaseSaidas;
begin
  case FTipoParametroFilial of
  global   : begin
               qryContasEntradasFiliais.MacroByName('WhereFilial').AsString := 'Where Filial is null';
               RefazConsulta(qryContasEntradasFiliais,[],[]);
               qryContasSaidasFiliais.MacroByName('WhereFilial').AsString := 'Where Filial is null';
               RefazConsulta(qryContasSaidasFiliais,[],[]);
               GerarContasEntradas;
               gerarcontasSaidas;
             end;

  porfilial: begin
               if qryFiliaiscodigo.AsInteger<>0 then
               begin
                 qryContasEntradasFiliais.MacroByName('WhereFilial').AsString := 'Where Filial = '+qryFiliaiscodigo.AsString;
                 RefazConsulta(qryContasEntradasFiliais,[],[]);
                 qryContasSaidasFiliais.MacroByName('WhereFilial').AsString := 'Where Filial = '+qryFiliaiscodigo.AsString;
                 RefazConsulta(qryContasSaidasFiliais,[],[]);
                 GerarContasEntradas;
                 gerarcontasSaidas;
               end;
             end;
  end;
end;

procedure TdtmParametrosSistema.qryContasEntradasFiliaisAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  case TipoParametroFilial of
    porFilial : qryContasEntradasFiliaisfilial.AsString := qryFiliaiscodigo.AsString;
  end;
end;

procedure TdtmParametrosSistema.qryContasSaidasFiliaisAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  case TipoParametroFilial of
    porFilial : qryContasSaidasFiliaisfilial.AsString := qryFiliaiscodigo.AsString;
  end;
end;

procedure TdtmParametrosSistema.GerarContasEntradas;
var
 i: TtecLancamentosContasEntradas;
begin
 for i := lceCOFINSretida to lcePIS_COFINS_CSLL do
 begin
   if not qryContasEntradasFiliais.Locate('descricao',filialcontasEntradas[i],[]) then
   begin
     qryContasEntradasFiliais.First;
     while not qryContasEntradasFiliais.Eof do
     begin
       if qryContasEntradasFiliaisdescricao.AsString < filialcontasEntradas[i] then
         qryContasEntradasFiliais.Next
       else
       begin
         qryContasEntradasFiliais.Insert;
         break;
       end;
     end;

     if qryContasEntradasFiliais.State<>dsinsert then
       qryContasEntradasFiliais.Append;

     qryContasEntradasFiliaisdescricao.AsString := filialcontasEntradas[i];
     qryContasEntradasFiliais.post;
   end;
 end;
 qryContasEntradasFiliais.First;

end;

procedure TdtmParametrosSistema.GerarContasSaidas;
var
 i: TtecLancamentosContasSaidas;

begin
 for i := lcsCOFINSacompensar to lcsReceitasFinanceiras do
 begin
   if not qryContasSaidasFiliais.Locate('descricao',filialcontassaidas[i],[]) then
   begin
     qryContasSaidasFiliais.First;
     while not qryContasSaidasFiliais.Eof do
     begin
       if qryContasSaidasFiliaisdescricao.AsString < filialcontasSaidas[i] then
         qryContasSaidasFiliais.Next
       else
       begin
         qryContasSaidasFiliais.Insert;
         break;
       end;
     end;

     if qryContasSaidasFiliais.State<>dsinsert then
       qryContasSaidasFiliais.Append;

     qryContasSaidasFiliaisdescricao.AsString := filialcontasSaidas[i];
     qryContasSaidasFiliais.post;
   end;
 end;
 qryContasSaidasFiliais.First;
end;

function TdtmParametrosSistema.ExisteFrete(NomeCampo: String; Value: Variant): Boolean;
begin
  Result := qryICMSFrete.Locate(NomeCampo, Value, [])
end;

function TdtmParametrosSistema.ExisteSeguro(NomeCampo: String; Value: Variant): Boolean;
begin
  Result := qryICMSSeguro.Locate(NomeCampo, Value, [])
end;

function TdtmParametrosSistema.ExistePlano(NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= qryPlanos.Locate(NomeCampo, Value, []);
end;

function TdtmParametrosSistema.getCodigoFilial: Integer;
begin
  Result := qryFiliaiscodigo.AsInteger
end;

function TdtmParametrosSistema.getCodigoFrete: Integer;
begin
  Result := qryICMSFretecodigo.AsInteger
end;

function TdtmParametrosSistema.getCodigoSeguro: Integer;
begin
  Result := qryICMSSegurocodigo.AsInteger
end;

function TdtmParametrosSistema.getTabelaConsultaFrete: TZDataset;
begin
  Result := qryConsultaICMSFrete
end;

function TdtmParametrosSistema.getTabelaConsultaSeguro: TZDataset;
begin
  Result := qryConsultaICMSSeguro
end;

function TdtmParametrosSistema.getCodigoModeloCarne: Integer;
begin
  Result:= qryModeloCarnecodigo.AsInteger;
end;

function TdtmParametrosSistema.getCodigoModeloBoleto: Integer;
begin
  Result:= qryModeloBoletosCODIGO.AsInteger;
end;

procedure TdtmParametrosSistema.qryFiliaisAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if Assigned(OnScrollFiliais) then
    OnScrollFiliais(qryFiliais);
end;

procedure TdtmParametrosSistema.SelecionarFrete;
begin
  ReFazConsulta(qryICMSFrete, [0], [qryConsultaICMSFretecodigo.AsInteger]);
end;

procedure TdtmParametrosSistema.SelecionarCarne;
begin
  ReFazConsulta(qryModeloCarne, [0], [qryConsultaModeloCarnecodigo.AsInteger]);
end;

procedure TdtmParametrosSistema.SelecionarBoleto;
begin
  ReFazConsulta(qryModeloBoletos, [0], [qryConsultaModeloBoletosCODIGO.AsInteger]);
end;

procedure TdtmParametrosSistema.SelecionarCarne(CodigoCarne: Integer);
begin
  ReFazConsulta(qryModeloCarne, [0], [CodigoCarne]);
end;

procedure TdtmParametrosSistema.SelecionarBoleto(CodigoBoleto: Integer);
begin
  ReFazConsulta(qryModeloBoletos, [0], [CodigoBoleto]);
end;

procedure TdtmParametrosSistema.SelecionarFrete(CodigoFrete: Integer);
begin
  ReFazConsulta(qryICMSFrete, [0], [CodigoFrete]);
end;

procedure TdtmParametrosSistema.SelecionarSeguro;
begin
  ReFazConsulta(qryICMSSeguro, [0], [qryConsultaICMSSegurocodigo.AsInteger]);
end;

procedure TdtmParametrosSistema.SelecionarSeguro(CodigoSeguro: Integer);
begin
  ReFazConsulta(qryICMSSeguro, [0], [CodigoSeguro]);
end;

function TdtmParametrosSistema.getTabelaConsultaModeloCarne: TZDataset;
begin
  Result:= qryConsultaModeloCarne;
end;

function TdtmParametrosSistema.getTabelaConsultaModeloBoleto: TZDataset;
begin
  Result:= qryConsultaModeloBoletos;
end;


procedure TdtmParametrosSistema.SelecionarPlano;
begin
  ReFazConsulta(qryPlanos, [0], [qryConsultaPlanoscodigo.AsInteger]);
end;

function TdtmParametrosSistema.getTabelaConsultaPlano: TZDataset;
begin
  Result:= qryConsultaPlanos;
end;

procedure TdtmParametrosSistema.SelecionarPlano(CodigoPlano: Integer);
begin
  ReFazConsulta(qryPlanos, [0], [CodigoPlano]);
end;

function TdtmParametrosSistema.getCodigoPlano: Integer;
begin
  Result:= qryPlanoscodigo.AsInteger;
end;

procedure TdtmParametrosSistema.SelecionarPlanoOrcamentoPadrao;
begin
  ReFazConsulta(qryPlanoOrcamentoPadrao, [0], [qryConsultaPlanoscodigo.AsInteger]);
end;

procedure TdtmParametrosSistema.SelecionarPlanoOrcamentoPadrao(CodigoPlano: Integer);
begin
  ReFazConsulta(qryPlanoOrcamentoPadrao, [0], [CodigoPlano]);
end;

function TdtmParametrosSistema.getCodigoPlanoOrcamentoPadrao: Integer;
begin
  Result:= qryPlanoorcamentopadraocodigo.AsInteger;
end;

function TdtmParametrosSistema.ExistePlanoOrcamentoPadrao(
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= qryPlanoorcamentopadrao.Locate(NomeCampo, Value, []);
end;

procedure TdtmParametrosSistema.SelecionarContratoMatricial;
begin
  ReFazConsulta(qryModeloContratoMatricial, [0], [qryConsultaModeloContratoMatricialcodigo.AsInteger]);
end;

procedure TdtmParametrosSistema.SelecionarContratoMatricial(CodigoContrato: Integer);
begin
  ReFazConsulta(qryModeloContratoMatricial, [0], [CodigoContrato]);
end;

function TdtmParametrosSistema.getCodigoModeloContratoMatricial;
begin
  Result:= qryModeloContratoMatricialcodigo.AsInteger;
end;

function TdtmParametrosSistema.getTabelaConsultaModeloContratoMatricial: TZDataset;
begin
  Result:= qryConsultaModeloContratoMatricial;
end;

function TdtmParametrosSistema.SalvarImpostosRetidos: Boolean;
begin
  result := true;
  qryImpostosRetidos.First;
  while not qryImpostosRetidos.Eof do
  begin
    if qryImpostosRetidosdescricao.AsString='' then
    begin
      result := false;
      break;
    end
    else
     qryImpostosRetidos.Next;
  end;
  if result then
  begin
   if qryImpostosRetidos.UpdatesPending then
    result := Perpetrar([qryimpostosretidos]);
  end
end;

function TdtmParametrosSistema.ExcluirImpostoRetido: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o IMPOSTO RETIDO'])) = smbOk then begin
    if not qryImpostosRetidos.IsEmpty then begin
      qryImpostosRetidos.delete;
      Result:= True;
    end;
  end
end;

procedure TdtmParametrosSistema.MarcarCampoReter;
begin
  if not (qryImpostosRetidos.State in [dsedit, dsinsert]) then
    qryImpostosRetidos.Edit;
  qryImpostosRetidosreter.AsBoolean := not qryImpostosRetidosreter.AsBoolean;
end;

procedure TdtmParametrosSistema.setFaixaMinimo(Query: TtecQuery);
var
  max: Real;
  pos : TBookmark;
begin
  if not qryBonusValorCompra.Active then
    qryBonusValorCompra.Open;
  max := 0.00;
  pos := query.GetBookmark;
  query.DisableControls;
  query.First;
  while not query.Eof do
  begin
    query.Edit;
    query.FieldByName('minimo').AsFloat := max;
    query.Post;
    max := query.FieldByName('maximo').AsInteger + 1;
    query.Next;
  end;
  query.GotoBookmark(pos);
  query.FreeBookmark(pos);
  query.EnableControls;
end;

procedure TdtmParametrosSistema.qryBonusValorCompraBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  if (qryBonusValorCompramaximo.AsFloat > 0) and
     (qryBonusValorComprabonus.AsFloat <> Null) then
    BonusValorCompraMinimo := qryBonusValorCompramaximo.AsFloat + 1
  else DataSet.Cancel;
end;

procedure TdtmParametrosSistema.qryBonusValorCompraAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  if (BonusValorCompraMinimo <> 0) then begin
    qryBonusValorCompracodigo.AsCurrency :=  qryBonusValorCompra.RecordCount + 1;
    qryBonusValorCompraminimo.AsFloat := BonusValorCompraMinimo;
    BonusValorCompraMinimo := 0;
  end
  else DataSet.Cancel;
end;

procedure TdtmParametrosSistema.verificaPreenchimentoBonus;
begin
  if (qryBonusValorCompramaximo.AsString = '') and
     (qryBonusValorComprabonus.AsString = '') and
     (qryBonusValorCompra.Eof) then
    qryBonusValorCompra.Cancel;
end;

function TdtmParametrosSistema.SalvarBonusValorCompra: Boolean;
begin
  result := False;
  qryBonusValorCompra.First;
  while not qryBonusValorCompra.Eof do
  begin
    if qryBonusValorCompra.CheckRequiredFields then
      Result := True
    else begin
      Result := False;
      Break;
    end;
    qryBonusValorCompra.Next;
  end;
  if Result then
    Perpetrar([qryBonusValorCompra]);
end;

procedure TdtmParametrosSistema.dsrBonusValorCompraDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if Field = qryBonusValorCompramaximo then
    VerificaValores(qryBonusValorCompra,Field);
end;

procedure TdtmParametrosSistema.VerificaValores(Query: TtecQuery;
  Field: TField);

  function ValoresNaoBatem(Query: TtecQuery): Boolean;
  var
   a : Integer;
   maximo : Currency;
   pos : TBookmark;
  begin
    Result := False;
    Query.DisableControls;
    pos := Query.GetBookmark;
    for a := Query.RecNo to Query.RecordCount - 1 do
    begin
      maximo := Query.FieldByName('maximo').AsCurrency;
      Query.Next;
      if Query.FieldByName('minimo').AsCurrency <= maximo then
      begin
        Query.Edit;
        Query.FieldByName('minimo').AsCurrency := maximo + 1;
        if Query.FieldByName('minimo').AsCurrency > Query.FieldByName('maximo').AsCurrency then
          Query.FieldByName('maximo').AsCurrency :=  maximo + 1;
        Query.Post;
        Result := True;
      end;
    end;
    Query.GotoBookmark(pos);
    Query.FreeBookmark(pos);
    Query.EnableControls;
    if Result then
      MensagemAviso('Os valores foram atualizados, verifique-os.')
  end;


begin
  if (Field.AsInteger < Query.FieldByName('minimo').AsInteger) and
     (Field.AsVariant <> Null) then
  begin
    MensagemAviso(Format('O valor a digitar deve ser Maior ou igual a %s.' ,[Query.FieldByName('minimo').AsString]));
    if (Field.OldValue <> Null) then
     if Query.State <> dsInsert then
        Field.AsVariant := Field.OldValue
     else Field.AsVariant := Null
    else Field.AsVariant := Null;
    Field.FocusControl;
  end;
  ValoresNaoBatem(Query);
end;

function TdtmParametrosSistema.ExcluirBonusValorCompra: Boolean;
begin
  Result:= False;
  if (qryBonusValorCompra.RecordCount > 1) and
     (qryBonusValorCompracodigo.AsInteger > 1) then
  begin
    qryBonusValorCompra.delete;
    Result:= True;
  end;
end;

procedure TdtmParametrosSistema.AbrirMascaras;
begin
  ReFazConsulta(qrymascaracontas, [],[]);
  ReFazConsulta(qryMascaraBancos, [],[]);
end;

function TdtmParametrosSistema.SalvarMascaraContas: Boolean;
begin
  result := true;
  qryMascaraContas.First;
  begin
    while not qryMascaraContas.Eof do
    begin
     if (qryMascaraContasnivel.AsString='') or
        (qryMascaraContasnivel.AsInteger=0) or
        (qryMascaraContasmascara.AsString='') then
     begin
       result := false;
       break;
     end;
     qryMascaraContas.Next;
    end;
  end;
  if result then
  begin
   if qryMascaraContas.UpdatesPending then
    result := Perpetrar([qrymascaracontas]);
  end;
end;

procedure TdtmParametrosSistema.dsrVenctosImpostosRetidosEntradasDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if field = qryVenctosImpostosRetidosEntradasquinzenal then
  begin
    if field.asboolean then
    begin
      qryVenctosImpostosRetidosEntradasdia.clear;
      qryVenctosImpostosRetidosEntradasdia.readonly := true;
      if pos('seguinte', qryVenctosImpostosRetidosEntradasparametro_final.asstring)<>0 then
        qryVenctosImpostosRetidosEntradasparametro_final.asstring := 'Quinzena seguinte'
      else
        qryVenctosImpostosRetidosEntradasparametro_final.asstring := 'Quinzena atual';
    end
    else
    begin
      qryVenctosImpostosRetidosEntradasdia.readonly := false;
      if pos('seguinte', qryVenctosImpostosRetidosEntradasparametro_final.asstring)<>0 then
        qryVenctosImpostosRetidosEntradasparametro_final.asstring := 'Mês seguinte'
      else
        qryVenctosImpostosRetidosEntradasparametro_final.asstring := 'Mês atual';
    end
  end
  else
  if field = qryVenctosImpostosRetidosEntradasdia then
  begin
    if field.AsInteger > 31 then
      field.asinteger := 31;
  end
  else
  if field = qryVenctosImpostosRetidosEntradasfornecedor then
    if qryVenctosImpostosRetidosEntradas.state = dsedit then
    begin
      dsrVenctosImpostosRetidosEntradas.OnDataChange := nil;
      qryVenctosImpostosRetidosEntradas.post;
      dsrVenctosImpostosRetidosEntradas.onDataChange :=
         dsrVenctosImpostosRetidosEntradasDataChange;
    end
end;

procedure TdtmParametrosSistema.AbreTabelasConsulta(
  TipoConsulta: TtecParSistemaTipoConsulta);
begin
  case TipoConsulta of
    pscCONTAEMISSAOBOLETO : qryConsultaContas.Open;
    pscContaContabilEntrada,
    pscContaContabilSaida : begin
                              qryConsultaContaContabil.MacroByName('consulta').AsString := '';
                              Abre(ctConsultaContaContabil);
                            end;
    pscDebitarVendaaVista : begin
                              if qryParametrosContascreditarvendaavista.AsInteger<>0 then
                                 qryConsultaContaContabil.MacroByName('consulta').AsString :=
                                    'and codigo <> '+qryParametrosContascreditarvendaavista.AsString;
                              Abre(ctConsultaContaContabil);
                           end;
   pscCreditarVendaaVista : begin
                            if qryParametrosContasdebitarvendaavista.AsInteger<>0 then
                               qryConsultaContaContabil.MacroByName('consulta').AsString :=
                                  'and codigo <> '+qryParametrosContasdebitarvendaavista.AsString;
                            Abre(ctConsultaContaContabil);
                           end;
    pscDebitarVendaaPrazo : begin
                            if qryParametrosContascreditarvendaaprazo.AsInteger<>0 then
                               qryConsultaContaContabil.MacroByName('consulta').AsString :=
                                  'and codigo <> '+qryParametrosContascreditarvendaaprazo.AsString;
                            Abre(ctConsultaContaContabil);
                           end;
   pscCreditarVendaaPrazo : begin
                            if qryParametrosContasdebitarvendaaprazo.AsInteger<>0 then
                               qryConsultaContaContabil.MacroByName('consulta').AsString :=
                                  'and codigo <> '+qryParametrosContasdebitarvendaaprazo.AsString;
                            Abre(ctConsultaContaContabil);
                           end;
    pscDebitarAbatimentos : begin
                            if qryParametrosContascreditarabatimentos.AsInteger<>0 then
                               qryConsultaContaContabil.MacroByName('consulta').AsString :=
                                  'and codigo <> '+qryParametrosContascreditarabatimentos.AsString;
                            Abre(ctConsultaContaContabil);
                           end;
   pscCreditarAbatimentos : begin
                            if qryParametrosContasdebitarabatimentos.AsInteger<>0 then
                               qryConsultaContaContabil.MacroByName('consulta').AsString :=
                                  'and codigo <> '+qryParametrosContasdebitarabatimentos.AsString;
                              Abre(ctConsultaContaContabil);
                            end;
    pscDebitarDevolucoes : begin
                            if qryParametrosContascreditardevolucoes.AsInteger<>0 then
                               qryConsultaContaContabil.MacroByName('consulta').AsString :=
                                  'and codigo <> '+qryParametrosContascreditardevolucoes.AsString;
                            Abre(ctConsultaContaContabil);
                           end;
   pscCreditarDevolucoes : begin
                            if qryParametrosContasdebitarabatimentos.AsInteger<>0 then
                               qryConsultaContaContabil.MacroByName('consulta').AsString :=
                                  'and codigo <> '+qryParametrosContasdebitardevolucoes.AsString;
                            Abre(ctConsultaContaContabil);
                           end;
  pscHistoricoEntrada,
  pscHistoricoSaida,
  pscHistoricoVendaaVista,
  pscHistoricoVendaaPrazo,
  pscHistoricoAbatimentos,
  pscHistoricoDevolucoes   : abre(ctConsultaHistoricos);
  end;
end;

procedure TdtmParametrosSistema.FechaTabelasConsulta(
  TipoConsulta: TtecParSistemaTipoConsulta);
begin
  case TipoConsulta of
   pscDebitarVendaaVista,
   pscCreditarVendaaVista,
   pscDebitarAbatimentos,
   pscCreditarDevolucoes,
   pscContaContabilEntrada,
   pscContaContabilSaida  : fecha(ctConsultaContaContabil);
   pscHistoricoVendaaVista,
   pscHistoricoVendaaPrazo,
   pscHistoricoAbatimentos,
   pscHistoricoDevolucoes : fecha(ctConsultaHistoricos);
  end;
end;


function TdtmParametrosSistema.SalvarParametrosContas: Boolean;
begin
  result := true;
  if qryParametrosContas.State = dsedit then
    qryParametrosContas.Post;
  if qryParametrosContas.UpdatesPending then
    result := Perpetrar([qryParametrosContas]);
  qryParametrosContas.Edit;
end;

function TdtmParametrosSistema.ExisteContaContabil(campo,
  codigo: String): Boolean;
begin
  if campo = 'descricaoedentada' then
    Result:= ExisteCodigo(qryConsultaContaContabil, 'descricao', codigo)
  else
    Result:= ExisteCodigo(qryConsultaContaContabil, campo, codigo);
end;

function TdtmParametrosSistema.ExisteHistorico(campo,
  codigo: string): boolean;
begin
  Result := ExisteCodigo(qryConsultaHistorico, campo, codigo);
end;

procedure TdtmParametrosSistema.SetTipoSugestao(const Value: byte);
begin
  FTipoSugestao := Value;
  case FTipoSugestao of
   0: qryParametrosContas.Locate('tipo','P',[]);
   1: qryParametrosContas.Locate('tipo','S',[]);
  end;
end;

procedure TdtmParametrosSistema.dsrParametrosContasDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Field = qryParametrosContasdebitarvendaavista
  then
    qryProcuraCreditaraVista.Params[1].AsInteger := qryParametrosContasdebitarvendaavista.AsInteger
  else if field = qryParametrosContascreditarvendaavista then
    qryProcuraDebitaraVista.Params[1].AsInteger := qryParametrosContascreditarvendaavista.AsInteger
  else if Field = qryParametrosContasdebitarvendaaprazo then
    qryProcuraCreditaraPrazo.Params[1].AsInteger := qryParametrosContasdebitarvendaaprazo.AsInteger
  else if field = qryParametrosContascreditarvendaaprazo then
    qryProcuraDebitaraPrazo.Params[1].AsInteger := qryParametrosContascreditarvendaaprazo.AsInteger
  else if Field = qryParametrosContasdebitarabatimentos then
    qryProcuraCreditarAbatimentos.Params[1].AsInteger := qryParametrosContasdebitarabatimentos.AsInteger
  else if field = qryParametrosContascreditarabatimentos then
    qryProcuraDebitarAbatimentos.Params[1].AsInteger := qryParametrosContascreditarabatimentos.AsInteger
  else if Field = qryParametrosContasdebitardevolucoes then
    qryProcuraCreditarDevolucoes.Params[1].AsInteger := qryParametrosContasdebitardevolucoes.AsInteger
  else if field = qryParametrosContascreditardevolucoes then
    qryProcuraDebitarDevolucoes.Params[1].AsInteger := qryParametrosContascreditardevolucoes.AsInteger;
end;

function TdtmParametrosSistema.ExisteConta(NomeCampo: String;
  Value: Variant): Boolean;
begin
  Result := qrycontas.Locate(NomeCampo, Value, [])
end;

procedure TdtmParametrosSistema.SelecionarConta;
begin
  ReFazConsulta(qrycontas,[0],[qryConsultaContasConta.AsVariant]);
end;

procedure TdtmParametrosSistema.SelecionarConta(NumeroConta: Integer);
begin
  if NumeroConta <> 0 then
    ReFazConsulta(qryContas, [0], [NumeroConta])
  else
    ReFazConsulta(qryContas, [0], [-1])
end;

procedure TdtmParametrosSistema.VerificarFeriados(var dias: ARRAY OF BOOLEAN;
                                Data: TDateTime;
                                var SituacaoFeriado:Boolean; Setar:Boolean);
var
 i: integer;
 vdia, vMes, vAno : integer;

 function HeFeriado: boolean;
 var
 Mes, Mes2: Variant;
 filial: integer;
 begin
  case TipoParametroFilial of
    Global : Filial := 0;
    porFilial: filial := CodigoFilial;
  end;

  if qryCalendario.Locate('ano;filial',varArrayof([vAno,Filial]),[]) then
  begin
   case vMes of
    1: result := copy(qryCalendarioJaneiro.  AsString, vdia,1) = 'F';
    2: result := copy(qryCalendarioFevereiro.AsString, vdia,1) = 'F';
    3: result := copy(qryCalendarioMarco.    AsString, vdia,1) = 'F';
    4: result := copy(qryCalendarioAbril.    AsString, vdia,1) = 'F';
    5: result := copy(qryCalendarioMaio.     AsString, vdia,1) = 'F';
    6: result := copy(qryCalendarioJunho.    AsString, vdia,1) = 'F';
    7: result := copy(qryCalendarioJulho.    AsString, vdia,1) = 'F';
    8: result := copy(qryCalendarioAgosto.   AsString, vdia,1) = 'F';
    9: result := copy(qryCalendarioSetembro. AsString, vdia,1) = 'F';
   10: result := copy(qryCalendarioOutubro.  AsString, vdia,1) = 'F';
   11: result := copy(qryCalendarioNovembro. AsString, vdia,1) = 'F';
   12: result := copy(qryCalendarioDezembro. AsString, vdia,1) = 'F';
   end;
  end
  else
    result := eHFeriadoNacional(Vdia,VMes);
 end;

begin
  vMes := MonthOf(Data);
  vAno := yearof(Data);
  if not Setar then
  begin
    for i := 1 to 31 do
    begin
      vDia := i;
      dias[i-1] := HeFeriado;
    end;
  end
  else
  begin
    SituacaoFeriado := not SituacaoFeriado;
    DefinirFeriado(data, SituacaoFeriado );
  end;
end;


procedure TdtmParametrosSistema.DefinirFeriado(Data: TDateTime;
                                               EhFeriado: Boolean);
const MesPadrao = '1...5....0....5....0....5....0.';
      SQLFiliais = 'Filial = %s';
      SQLFilialNula = 'Filial is null';

var   vAno,vMes,vDia,i : integer;
      vDias: String[31];
      vDiasMeses,SQL: String;
      Filial : integer;


      function FeriadoPadrao(Mes: integer): String;
      var Dia: Byte;
      begin
          vDias := MesPadrao;
          for Dia:= 1 to 31 do
              if EhFeriadoNacional(Dia, Mes)
              then vDias[Dia]:= 'F';
          Result:= vDias;
      end;


      procedure Feriado;
      var Mes: TField;
      begin
         case vMes of
            1: Mes := qryCalendarioJaneiro;
            2: Mes := qryCalendarioFevereiro;
            3: Mes := qryCalendarioMarco;
            4: Mes := qryCalendarioAbril;
            5: Mes := qryCalendarioMaio;
            6: Mes := qryCalendarioJunho;
            7: Mes := qryCalendarioJulho;
            8: Mes := qryCalendarioAgosto;
            9: Mes := qryCalendarioSetembro;
           10: Mes := qryCalendarioOutubro;
           11: Mes := qryCalendarioNovembro;
           12: Mes := qryCalendarioDezembro;
         end;

         vDias := Mes.AsString;
         if EhFeriado
         then vdias[vdia] := 'F'
         else vdias[vdia] := MesPadrao[vDia];
         Mes.AsString := vdias;
      end;


begin
  vAno := YearOf(Data);
  vMes := MonthOf(Data);
  vDia := dayof(data);
  case TipoParametroFilial of
    Global : begin
               Filial := 0;
               SQL := SQLFilialNula;
             end;
    porFilial: begin
                 filial := codigofilial;
                 SQL := format(SQLFiliais, [inttostr(filial)]);
               end;
  end;
  if qryCalendario.Locate('ano;filial',varArrayof([vAno,Filial]),[]) then
  begin
   qryCalendario.Edit;
   Feriado;
   qryCalendario.Post;
   qryAtualizarCalendarios.Params[0].AsInteger := vMes;
   qryAtualizarCalendarios.Params[1].AsString := qryCalendario.Fields[vMes].AsString;
   qryAtualizarCalendarios.MacroByName('Filiais').asstring := SQL;
   qryAtualizarCalendarios.Params[2].AsInteger := vAno;
   qryAtualizarCalendarios.ExecSql;
//   Perpetrar([qryatualizarCalendarios]);
  end
  else
  begin
   qryCalendario.append;
   case TipoParametroFilial of
     Global : begin
                qryCalendariofilial.AsInteger := 0;
                qryIncluirCalendarios.Params[0].clear;
              end;
     porFilial : begin
                   qryCalendariofilial.asinteger := Filial;
                   qryIncluirCalendarios.Params[0].value := filial;
                 end;
   end;
   qryCalendarioano.AsInteger := vAno;

   for i:=1 to 12 do
     qryCalendario.Fields[i].AsString := FeriadoPadrao(i);

   Feriado;
   qryCalendario.Post;
   qryIncluirCalendarios.Params[1].AsInteger := vAno;
   for i:=1 to 12 do
     vDiasMeses := vDiasMeses+ '"'+qryCalendario.Fields[i].AsString+'",';
   delete(vDiasMeses,length(vDiasMeses),1);
   Insert('{',vDiasMeses,0);
   insert('}',vDiasMeses, length(vDiasMeses)+1);
   qryIncluirCalendarios.Params[2].AsString := vDiasMeses;
   qryIncluirCalendarios.ExecSql;
//   Perpetrar([qryincluirCalendarios]);
  end;

end;


function TdtmParametrosSistema.EhFeriadoNacional(Dia, Mes: Integer): Boolean;
begin
   Result:= ((Dia =  1) AND (Mes =  1)) OR   {1º de janeiro                   }
            ((Dia = 21) AND (Mes =  4)) OR   {21 de abril    - TIRADENTES     }
            ((Dia =  1) AND (Mes =  5)) OR   {1º de maio     - DIA DO TRABALHO}
            ((Dia =  7) AND (Mes =  9)) OR   { 7 de setembro - INDEPENDÊNCIA  }
            ((Dia = 12) AND (Mes = 10)) OR   {12 de outubro  - N.S. APARECIDA }
            ((Dia =  2) AND (Mes = 11)) OR   { 2 de novembro - FINADOS        }
            ((Dia = 15) AND (Mes = 11)) OR   {15 de novembro - PROCL REPÚBLICA}
            ((Dia = 25) AND (Mes = 12));     {25 de dezembro - NATAL          }

end;

function TdtmParametrosSistema.SalvarCalendario: Boolean;
begin
  result := Perpetrar([qryAtualizarCalendarios, qryIncluirCalendarios]);
end;

destructor TdtmParametrosSistema.Destroy;
begin
  CancelarAtualizacoes([qryAtualizarCalendarios,qryIncluirCalendarios]);
  qryParametrosContasImoveis.Close;
  qryParametrosProducao.Close;

  inherited;
end;

procedure TdtmParametrosSistema.VerificarVenctosImpostosRetidosEntradas;
var
  vLancamentosContasEntradas : TtecLancamentosContasEntradas;
begin
  qryVenctosImpostosRetidosEntradas.AfterInsert := nil;
  case TipoParametroFilial of
    Global : begin
              qryVenctosImpostosRetidosEntradas.macrobyname('FilialGlobal').asstring := 'or filial is null';
              refazconsulta(qryVenctosImpostosRetidosEntradas, [0],[0]);
              for vLancamentosContasEntradas := lceCOFINSretida to lcePIS_COFINS_CSLL do
              begin
                if vLancamentosContasEntradas in [lceCOFINSretida,
                                                  lceCSLLretida,
                                                  lceINSSRetido,
                                                  lceIRRetido,
                                                  lceISSRetido,
                                                  lcePISRetido,
                                                  lcePIS_COFINS_CSLL] then
                if not qryVenctosImpostosRetidosEntradas.locate('descricao',
                       FilialContasEntradas[vLancamentosContasEntradas],[]) then
                begin
                  qryVenctosImpostosRetidosEntradas.append;
                  qryVenctosImpostosRetidosEntradasdescricao.asstring := FilialContasEntradas[vLancamentosContasEntradas];
                  qryVenctosImpostosRetidosEntradasquinzenal.asboolean := false;
                  qryVenctosImpostosRetidosEntradasparametro_inicial.asstring :='Até o dia';
                  qryVenctosImpostosRetidosEntradasdia.asinteger := 10;
                  qryVenctosImpostosRetidosEntradasparametro_final.asstring :='Mês seguinte';
                  qryVenctosImpostosRetidosEntradasocasiao.asstring :='No pagto da duplicata';
                  qryVenctosImpostosRetidosEntradas.post;
                end;
              end;
              qryVenctosImpostosRetidosEntradas.AfterInsert := qryVenctosImpostosRetidosEntradasAfterInsert;
             end;
  porFilial: begin
              qryVenctosImpostosRetidosEntradas.macrobyname('FilialGlobal').asstring := '';
              refazconsulta(qryVenctosImpostosRetidosEntradas, [0],[CodigoFilial]);
              if qryVenctosImpostosRetidosEntradas.isempty then
              begin
                qryIncluirVenctosImpostosRetidosEntradas.params[0].asinteger := CodigoFilial;
                qryIncluirVenctosImpostosRetidosEntradas.execsql;
                perpetrar([qryIncluirVenctosImpostosRetidosEntradas]);
                refazconsulta(qryVenctosImpostosRetidosEntradas, [0],[CodigoFilial]);
              end;
              for vLancamentosContasEntradas := lceCOFINSretida to lcePIS_COFINS_CSLL do
              begin
                if vLancamentosContasEntradas in [lceCOFINSretida,
                                                  lceCSLLretida,
                                                  lceINSSRetido,
                                                  lceIRRetido,
                                                  lceISSRetido,
                                                  lcePISRetido,
                                                  lcePIS_COFINS_CSLL] then
                if not qryVenctosImpostosRetidosEntradas.locate('descricao',
                       FilialContasEntradas[vLancamentosContasEntradas],[]) then
                begin
                  qryVenctosImpostosRetidosEntradas.append;
                  qryVenctosImpostosRetidosEntradasfilial.asinteger := CodigoFilial;
                  qryVenctosImpostosRetidosEntradasdescricao.asstring := FilialContasEntradas[vLancamentosContasEntradas];
                  qryVenctosImpostosRetidosEntradasquinzenal.asboolean := false;
                  qryVenctosImpostosRetidosEntradasparametro_inicial.asstring :='Até o dia';
                  qryVenctosImpostosRetidosEntradasdia.asinteger := 10;
                  qryVenctosImpostosRetidosEntradasparametro_final.asstring :='Mês seguinte';
                  qryVenctosImpostosRetidosEntradasocasiao.asstring :='No pagto da duplicata';
                  qryVenctosImpostosRetidosEntradas.post;
                end;
              end;
              qryVenctosImpostosRetidosEntradas.AfterInsert := qryVenctosImpostosRetidosEntradasAfterInsert;
             end;
  end;
end;

procedure TdtmParametrosSistema.qryVenctosImpostosRetidosEntradasAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  dataset.cancel;
end;

function TdtmParametrosSistema.SalvarVenctosImpostosRetidosEntradas: Boolean;
begin
  result := true;
  if qryVenctosImpostosRetidosEntradas.active then
  begin
    if qryVenctosImpostosRetidosEntradas.state = dsedit then
    begin
      result := qryVenctosImpostosRetidosEntradas.checkrequiredfields;
      if result then
        qryVenctosImpostosRetidosEntradas.post;
    end;

    if result then
    begin
      qryVenctosImpostosRetidosEntradas.first;
      while not qryVenctosImpostosRetidosEntradas.eof do
      begin
        result := qryVenctosImpostosRetidosEntradas.checkrequiredfields;
        if not result then
          break
        else
          qryVenctosImpostosRetidosEntradas.next;
      end;
    end;

    if result then
      result := Perpetrar([qryVenctosImpostosRetidosEntradas]);
  end;      
end;

procedure TdtmParametrosSistema.qryVenctosImpostosRetidosEntradasCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryVenctosImpostosRetidosEntradasdescricaoabrev.asstring :=
    copy(qryVenctosImpostosRetidosEntradasdescricao.asstring,1,
    pos(' ',qryVenctosImpostosRetidosEntradasdescricao.asstring));
end;

procedure TdtmParametrosSistema.MarcarCampoQuinzenal;
begin
  if not (qryVenctosImpostosRetidosEntradas.State in [dsedit, dsinsert]) then
    qryVenctosImpostosRetidosEntradas.Edit;
  qryVenctosImpostosRetidosEntradasquinzenal.asboolean := not qryVenctosImpostosRetidosEntradasquinzenal.asboolean;

end;

procedure TdtmParametrosSistema.qryVenctosImpostosRetidosEntradasAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if Assigned(OnScrollVenctosImpostosRetidosEntradas) then
    OnScrollVenctosImpostosRetidosEntradas(qryVenctosImpostosRetidosEntradas);

  qryVenctosImpostosRetidosEntradasdia.readonly :=
     qryVenctosImpostosRetidosEntradasquinzenal.asboolean;
  qryVenctosImpostosRetidosEntradasdia.required := not
     qryVenctosImpostosRetidosEntradasdia.readonly;
end;

procedure TdtmParametrosSistema.qryVenctosImpostosRetidosEntradasBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if not qryVenctosImpostosRetidosEntradas.checkrequiredfields then
  begin
    qryVenctosImpostosRetidosEntradasdia.focuscontrol;
    abort;
  end;
end;



function TdtmParametrosSistema.SalvarContasContabeis: Boolean;
begin
  result := false;

  if ParSistema.GerarContabilidade and
     qrycontasentradasfiliais.active and
     qrycontassaidasfiliais.active then
  begin
    qryContasEntradasFiliais.First;
    while not qryContasEntradasFiliais.eof do
    begin
  //    if qryContasEntradasFiliaiscontacontabil.IsNull then
  //      qryContasEntradasFiliais.Delete
  //    else
      begin
        case FTipoParametroFilial of
        global: begin
                  qryContasEntradasFiliais.Edit;
                  qryContasEntradasFiliaisfilial.clear;
                  qryContasEntradasFiliais.Post;
                end;
        porFilial: begin
                     qryContasEntradasFiliais.Edit;
                     qryContasEntradasFiliaisfilial.AsInteger := qryFiliaiscodigo.AsInteger;
                     qryContasEntradasFiliais.Post;
                   end;
        end;
        qryContasEntradasFiliais.Next;
      end;
    end;

    qryContasSaidasFiliais.First;
    while not qryContasSaidasFiliais.eof do
    begin
  //    if qryContasSaidasFiliaiscontacontabil.IsNull then
  //      qryContasSaidasFiliais.Delete
  //    else
      begin
        case FTipoParametroFilial of
        global: begin
                  qryContasSaidasFiliais.Edit;
                  qryContasSaidasFiliaisfilial.clear;
                  qryContasSaidasFiliais.Post;
                end;
        porFilial: begin
                     qryContasSaidasFiliais.Edit;
                     qryContasSaidasFiliaisfilial.AsInteger := qryFiliaiscodigo.AsInteger;
                     qryContasSaidasFiliais.Post;
                   end;
        end;
        qryContasSaidasFiliais.Next;
      end;
    end;
    result := perpetrar([qrycontasentradasfiliais, qrycontassaidasfiliais]);
    GerarContasEntradas;
    gerarcontasSaidas;
  end
  else
    result := true;

end;

function TdtmParametrosSistema.SalvarMascaraBancos: Boolean;
begin
  result := true;
  qryMascaraBancos.First;
  begin
    while not qryMascaraBancos.Eof do
    begin
     if (qryMascaraBancosnivel.AsString='') or
        (qryMascaraBancosnivel.AsInteger=0) or
        (qryMascaraBancosmascara.AsString='') then
     begin
       result := false;
       break;
     end;
     qryMascaraBancos.Next;
    end;
  end;
  if result then
  begin
   if qryMascaraBancos.UpdatesPending then
    result := Perpetrar([qrymascarabancos]);
  end;
end;

procedure TdtmParametrosSistema.qryMascaraContasNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryMascaraContastipo.asstring := 'C';
end;

procedure TdtmParametrosSistema.qryMascaraBancosNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryMascaraBancostipo.asstring := 'B';
end;

procedure TdtmParametrosSistema.CancelarNaturezasPadrao;
begin
  if qryNaturezasPadrao.State in [dsinsert,dsedit] then
    qryNaturezasPadrao.cancel;
end;

procedure TdtmParametrosSistema.GravarNaturezasPadrao;
begin
  if qryNaturezasPadrao.State in [dsinsert,dsedit] then
    if qryNaturezasPadrao.CheckRequiredFields then
      qryNaturezasPadrao.Post;
end;

procedure TdtmParametrosSistema.qryNaturezasPadraoAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  CancelarNaturezasPadrao;
end;

function TdtmParametrosSistema.SalvarNaturezasPadrao: Boolean;
begin
  result := true;
  if qryNaturezasPadrao.UpdatesPending then
    result := Perpetrar([qryNaturezasPadrao]);
end;

function TdtmParametrosSistema.LimparContaEntrada: Boolean;
begin
  result := false;
  if MensagemConfirmacao('Confirma a retirada desta conta contábil vinculada?') = smbOk then
  begin
    result := true;
    qryContasEntradasFiliais.edit;
//    qryContasEntradasFiliaiscontacontabil.clear;
    qryContasEntradasFiliaisdescricaoconta.clear;
    qryContasEntradasFiliaisclassificacao.clear;
    qryContasEntradasFiliais.Post;
  end;

end;

procedure TdtmParametrosSistema.dsrContasEntradasFiliaisDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if field = qrycontasentradasfiliaiscontacontabil then
  begin
    if qrycontasentradasfiliais.state in [dsedit,dsinsert] then
      if qryContasEntradasFiliaiscontacontabil.isnull and
         (qryContasEntradasFiliaiscontacontabil.oldvalue <> null) then
        if not LimparContaEntrada then
          qrycontasentradasfiliaiscontacontabil.value := qrycontasentradasfiliaiscontacontabil.oldvalue;
  end
  else if field = qryContasEntradasFiliaisdescricaohistorico then
  begin
    if qrycontasentradasfiliais.state in [dsedit,dsinsert] then
      if qryContasEntradasFiliaisdescricaohistorico.isnull and
         (qryContasEntradasFiliaisdescricaohistorico.oldvalue <> null) then
        if not LimparHistoricoEntrada then
        begin
          qryContasEntradasFiliaishistoricocontabil.value := qryContasEntradasFiliaishistoricocontabil.oldvalue;
          qryContasEntradasFiliaisdescricaohistorico.value := qryContasEntradasFiliaisdescricaohistorico.oldvalue;
        end;
  end;
end;

procedure TdtmParametrosSistema.dsrContasSaidasFiliaisDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if field = qrycontassaidasfiliaiscontacontabil then
  begin
    if qrycontassaidasfiliais.state in [dsedit,dsinsert] then
      if (qryContassaidasFiliaiscontacontabil.isnull) and
         (qrycontassaidasfiliaiscontacontabil.oldvalue <> null) then
        if not LimparContaSaida then
          qrycontassaidasfiliaiscontacontabil.value := qrycontassaidasfiliaiscontacontabil.oldvalue;
  end
  else if field = qryContasSaidasFiliaisdescricaohistorico then
  begin
    if qryContasSaidasFiliais.state in [dsedit,dsinsert] then
      if qryContasSaidasFiliaisdescricaohistorico.isnull and
         (qryContasSaidasFiliaisdescricaohistorico.oldvalue <> null) then
        if not LimparHistoricoSaida then
        begin
          qryContasSaidasFiliaishistoricocontabil.value := qryContasSaidasFiliaishistoricocontabil.oldvalue;
          qryContasSaidasFiliaisdescricaohistorico.value := qryContasSaidasFiliaisdescricaohistorico.oldvalue;
        end;
  end;

end;

function TdtmParametrosSistema.LimparContaSaida: Boolean;
begin
  result := false;
  if MensagemConfirmacao('Confirma a saída desta conta contábil vinculada?') = smbOk then
  begin
    result := true;
    qryContasSaidasFiliais.edit;
    qryContasSaidasFiliaisdescricaoconta.clear;
    qryContasSaidasFiliaisclassificacao.clear;
    qryContasSaidasFiliais.Post;
  end;
end;

procedure TdtmParametrosSistema.setVenctosImpostosRetidosEntradastipofornecedor(
  const Value: String);
begin
  FVenctosImpostosRetidosEntradastipofornecedor := Value;
  qryVenctosImpostosRetidosEntradas.Edit;
  qryVenctosImpostosRetidosEntradastipofornecedor.AsString := Value;
  qryVenctosImpostosRetidosEntradas.Post;
end;

function TdtmParametrosSistema.SalvarParametrosContasImoveis: Boolean;
begin
  result := true;
  if qryParametrosContasImoveis.State = dsedit then
    qryParametrosContasImoveis.Post;

  if qryParametrosContasImoveis.UpdatesPending then
    result := Perpetrar([qryParametrosContasImoveis]);
  qryParametrosContasImoveis.Edit;
end;

function TdtmParametrosSistema.SalvarSignatarios: Boolean;
begin
  qrySignatarios.First;
  while not qrySignatarios.Eof do
  begin
    result := qrySignatarios.CheckRequiredFields;
    if result then
      qrysignatarios.Next
    else
      break;
  end;

  if result then
    perpetrar([qrySignatarios]);
end;

function TdtmParametrosSistema.LimparHistoricoEntrada: Boolean;
begin
  result := false;
  if MensagemConfirmacao('Confirma a retirada deste Histórico contábil vinculado?') = smbOk then
  begin
    result := true;
    qryContasEntradasFiliais.edit;
    qryContasEntradasFiliaishistoricocontabil.clear;
    qryContasEntradasFiliais.Post;
  end;
end;

function TdtmParametrosSistema.LimparHistoricoSaida: Boolean;
begin
  result := false;
  if MensagemConfirmacao('Confirma a saída deste histórico contábil vinculado?') = smbOk then
  begin
    result := true;
    qryContasSaidasFiliais.edit;
    qryContasSaidasFiliaishistoricocontabil.clear;
    qryContasSaidasFiliais.Post;
  end;
end;

function TdtmParametrosSistema.SalvarParametrosProducao: Boolean;
begin
  result := true;
  if qryParametrosProducao.State = dsedit then
    qryParametrosProducao.Post;

  if qryParametrosProducao.UpdatesPending then
    result := Perpetrar([qryParametrosProducao]);
  qryParametrosProducao.Edit;

end;

function TdtmParametrosSistema.UltimoNossoNumeroParcela: integer;
begin
  qryUltimoNossoNumeroParcelas.close;
  qryUltimoNossoNumeroParcelas.open;
  result := qryUltimoNossoNumeroParcelasnossonumero.AsInteger;
end;

procedure TdtmParametrosSistema.dsrSequenciainiciacamponossonumeronaparcelaDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if field = qrySequenciainiciacamponossonumeronaparcelalast_value then
  begin
    if UltimoNossoNumeroParcela >= qrySequenciainiciacamponossonumeronaparcelalast_value.AsInteger then
    begin
      MensagemErro('O valor do campo nosso número possui um valor menor dos já existentes nas parcelas');
      if vedtSequenciainiciacamponossonumeronaparcela<>0 then
        field.asinteger := vedtSequenciainiciacamponossonumeronaparcela
      else
        field.Clear;
      field.FocusControl;
    end
    else
      vedtSequenciainiciacamponossonumeronaparcela :=  qrySequenciainiciacamponossonumeronaparcelalast_value.AsInteger;
  end;
end;

procedure TdtmParametrosSistema.qrySequenciainiciacamponossonumeronaparcelaAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  vedtSequenciainiciacamponossonumeronaparcela :=  qrySequenciainiciacamponossonumeronaparcelalast_value.AsInteger;
end;
             {
    qryAtualizarSequenciainiciacamponossonumeronaparcela.ParamByName('proximovalor').AsInteger := vedtSequenciainiciacamponossonumeronaparcela;
    qryAtualizarSequenciainiciacamponossonumeronaparcela.ExecSql;
    perpetrar([dtmParametrosSistema.qryAtualizarSequenciainiciacamponossonumeronaparcela]);
  end;

              }
function TdtmParametrosSistema.SalvarNossoNumeroParcela: boolean;
begin
  result := true;
  if qrySequenciainiciacamponossonumeronaparcela.UpdatesPending then
  begin
    qryAtualizarSequenciainiciacamponossonumeronaparcela.ParamByName('proximovalor').AsInteger := vedtSequenciainiciacamponossonumeronaparcela;
    qryAtualizarSequenciainiciacamponossonumeronaparcela.ExecSql;
    result := perpetrar([qryAtualizarSequenciainiciacamponossonumeronaparcela]);
  end;
end;

procedure TdtmParametrosSistema.dsrSignatariosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if field = qrySignatariosind_resp_legal then
  begin
    if (field.value <> null) then
    begin
      if (uppercase(field.value) <> 'S') and (uppercase(field.value) <> 'N') then
        field.clear
      else
      if field.value <> uppercase(field.value) then
        field.value := uppercase(field.value);
    end
    else
      field.value := 'N';
  end;
end;

function TdtmParametrosSistema.PerpetrarTabelasDiversas: Boolean;
begin
  result := perpetrar([qryMeiosdePagamentoECF]);
end;

procedure TdtmParametrosSistema.qryImpostosRetidosNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  
  qryImpostosRetidosreter.asBoolean := false;

end;

procedure TdtmParametrosSistema.qryImpostosRetidosBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if trim(qryImpostosRetidosaplicacao.asString)='' then
    qryImpostosRetidosaplicacao.clear;

  if pos(qryImpostosRetidosdescricao.asString+',',
      'PIS,COFINS,CSLL,BC IRRF,IRRF,BC Prev Social,Prev Social,ISS,INSS,')=0 then
  begin
    MensagemErro('Descrição do imposto incorreta, selecione o item da lista!');
    qryImpostosRetidosdescricao.clear;
  end;

end;

procedure TdtmParametrosSistema.qrySignatariosNewRecord(DataSet: TDataSet);
begin
  inherited;
  qrySignatariosind_resp_legal.asString := 'N';
  qrySignatariosind_resp_nfe.asString := 'N';

end;

end.
