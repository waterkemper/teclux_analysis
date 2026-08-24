unit dmoperacoesosp;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery, dmtecsoft, IniFiles,
  cpdatasource, biblio, ctconstantes, Forms, ZTransact, Windows, clusuario, Controls,
  dmImprimeOsp, clparametrossistema, variants, dateutils;

Const cmposp         = 1;   PosicaoAtual = 0;
      cmplote        = 2;   Primeiro     = 1;
                            Anterior     = 2;
                            Proximo      = 3;
                            Ultimo       = 4;
type
StatusCadastro = (Nenhum, IniciandoOperacao, FinalizandoOperacao);

type
  TdtmOperacoesOSP = class(TdtmBasico)
    qryOperacoesOSP: TtecQuery;
    qryOperacoesOSPosp: TIntegerField;
    qryOperacoesOSPoperacao: TIntegerField;
    qryOperacoesOSPUsuario: TtecQuery;
    qryOperacoesOSPUsuarioFalhas: TtecQuery;
    qryOperacoesOSPUsuarioFalhasusuario: TIntegerField;
    qryOperacoesOSPUsuarioFalhasfalha: TIntegerField;
    qryOperacoesOSPUsuarioFalhasquantidadeperda: TIntegerField;
    qryOperacoesOSPUsuariousuario: TIntegerField;
    qryOperacoesOSPUsuarioquantidade: TIntegerField;
    dsrOperacoesOSP: TtecDataSource;
    dsrOperacoesOSPUsuario: TtecDataSource;
    dsrOperacoesOSPUsuarioFalhas: TtecDataSource;
    qryOSPLotes: TtecQuery;
    dsrOSPLotes: TtecDataSource;
    qryOperacoesOSPnome: TStringField;
    qryOperacoesOSPc01: TStringField;
    qryOperacoesOSPc02: TStringField;
    qryOperacoesOSPc03: TStringField;
    qryOperacoesOSPtempopadrao: TFloatField;
    qryOperacoesOSPUsuarionome: TStringField;
    qryFluxoGramasOperacoes: TtecQuery;
    qryFluxoGramasOperacoesfluxograma: TIntegerField;
    qryFluxoGramasOperacoesoperacao: TIntegerField;
    qryFluxoGramasOperacoesnome: TStringField;
    qryFluxoGramasOperacoesc01: TStringField;
    qryFluxoGramasOperacoesc02: TStringField;
    qryFluxoGramasOperacoesc03: TStringField;
    qryFluxoGramasOperacoestempopadrao: TFloatField;
    qryFluxoGramasOperacoesdescricao: TStringField;
    dsrFluxoGramasOperacoes: TtecDataSource;
    qryOSPProximo: TtecQuery;
    qryOSPProximonumero: TIntegerField;
    qryOperacoesOSPUsuariousuariovalidado: TBooleanField;
    qryOperacoesOSPUsuariodata: TDateField;
    qryOperacoesOSPUsuarioosp: TIntegerField;
    qryOperacoesOSPUsuariooperacao: TIntegerField;
    qryOperacoesOSPUsuarioFalhasosp: TIntegerField;
    qryOperacoesOSPUsuarioFalhasoperacao: TIntegerField;
    qryOperacoesOSPUsuarioinicio: TTimeField;
    qryOperacoesOSPUsuariotermino: TTimeField;
    qryOperacoesOSPUsuarioFalhasdata: TDateField;
    qryOperacoesOSPUsuarioFalhasinicio: TTimeField;
    qryOperacoesOSPUsuarioFalhasfalhavalidada: TBooleanField;
    qryOperacoesOSPppm: TIntegerField;
    dsrClientesProdutos: TtecDataSource;
    qryClientesProdutos: TtecQuery;
    qryClientesProdutoscliente: TIntegerField;
    qryClientesProdutostipocliente: TStringField;
    qryClientesProdutosproduto: TLargeintField;
    qryClientesProdutosproduto_cliente: TStringField;
    qryClientesProdutosfinalidade: TStringField;
    qryClientesProdutospn: TStringField;
    qryClientesProdutosorigem: TStringField;
    qryUsuarioOperacoesProducao: TtecQuery;
    qryOperacoesOSPoperacaoliberada: TBooleanField;
    qryUsuarioOperacoesProducaousuario: TIntegerField;
    qryOperacoesOSPsequencia: TStringField;
    qryFluxoGramasOperacoessequencia: TStringField;
    qryOperacoesOSPoperacaoemandamento: TBooleanField;
    qryClientesProdutostamloteproducao: TIntegerField;
    qryClientesProdutosexcedentepermitido: TIntegerField;
    qryOperacoesOSPUsuarioFalhasperdatotal: TBooleanField;
    qryFluxoGramasOperacoestipooperacao: TStringField;
    qryFluxoGramasOperacoesorigemoperacaoalternativa: TIntegerField;
    qryOperacoesOSPorigemoperacaoalternativa: TIntegerField;
    qryOperacoesOSPselecionada: TBooleanField;
    qryOperacoesOSPquantidade: TLargeintField;
    qryOperacoesOSPSaldoFaltanteGeral: TIntegerField;
    qryListaOperacaoLiberada: TtecQuery;
    dsrListaOperacaoLiberada: TtecDataSource;
    qryListaOperacaoLiberadanome: TStringField;
    qryListaOperacaoLiberadac1: TStringField;
    qryListaOperacaoLiberadac2: TStringField;
    qryListaOperacaoLiberadac3: TStringField;
    qryListaOperacaoLiberadaoperacao: TIntegerField;
    qryListaFalhas: TtecQuery;
    qryListaFalhascodigo: TIntegerField;
    qryListaFalhasdescricao: TStringField;
    qryListaFalhasperdatotal: TBooleanField;
    qryListaFalhasquantidade: TIntegerField;
    dsrListaFalhas: TtecDataSource;
    qryOSPLotesosp: TIntegerField;
    qryOSPLotesnumero: TIntegerField;
    qryOSPLotesquantidadelote: TFloatField;
    qryOSPLotesexcedentelote: TFloatField;
    qryOSPLotesproduzidalote: TFloatField;
    qryOSPLotesentrega: TDateField;
    qryOSPLotesentrega_anterior: TDateField;
    qryOSPLotessemana: TIntegerField;
    qryOSPLotesano: TIntegerField;
    qryOSPLotesprioridade: TIntegerField;
    qryOSPLotesobservacoes: TStringField;
    qryOSPLotesproduto: TLargeintField;
    qryOSPLotesdata: TDateField;
    qryOSPLotescliente: TIntegerField;
    qryOSPLotespedidocliente: TStringField;
    qryOSPLotesquantidadeosp: TFloatField;
    qryOSPLotesquantidade_anterior: TFloatField;
    qryOSPLotespreco: TFloatField;
    qryOSPLotesprodutovisual: TStringField;
    qryOSPLotescaracteristica: TLargeintField;
    qryOSPLotescaracteristicavisual: TStringField;
    qryOSPLotesqtdeentregue: TFloatField;
    qryOSPLotescomplementoproduto: TStringField;
    qryOSPLotesunidade: TStringField;
    qryOSPLotesapelido: TStringField;
    qryOSPLotesalterada: TBooleanField;
    qryOSPLotesTotal: TCurrencyField;
    qryOSPLotesSaldo: TCurrencyField;
    qryOperacoesOSPlote: TIntegerField;
    qryOperacoesOSPUsuariolote: TIntegerField;
    qryOperacoesOSPUsuarioFalhaslote: TIntegerField;
    qryOperacoesOSPUsuarioFalhasdescricao: TStringField;
    qryOperacoesOSPsetup: TBooleanField;
    qryOperacoesOSPplanocontrole: TBooleanField;
    qryFluxoGramasOperacoessetup: TBooleanField;
    qryFluxoGramasOperacoesplanocontrole: TBooleanField;
    qryUsuarios: TtecQuery;
    qryUsuarioscodigo: TIntegerField;
    qryUsuariosnome: TStringField;
    qryUsuariosgerenteproducao: TBooleanField;
    qryUsuariosoperador: TStringField;
    dsrUsuarios: TtecDataSource;
    qryUsuarioOSPLote: TtecQuery;
    dsrUsuarioOSPLote: TtecDataSource;
    qryUsuarioOSPLoteosp: TIntegerField;
    qryUsuarioOSPLotelote: TIntegerField;
    qryUsuariosturno: TIntegerField;
    qryOperacoesOSPUsuarioturno: TIntegerField;
    qryOperacoesOSPquantidadeanterior: TIntegerField;
    qryOperacoesOSPSaldoFaltanteProducao: TIntegerField;
    qryUsuarioOperacoesProducaohabilitadosetup: TBooleanField;
    qryOperacoesOSPhabilitadosetup: TBooleanField;
    qryUsuariosHabilitadosSetup: TtecQuery;
    qryUsuariosHabilitadosSetupusuario: TIntegerField;
    qryUsuariosHabilitadosSetupnome: TStringField;
    dsrUsuariosHabilitadosSetup: TtecDataSource;
    qryOperacoesOSPUsuariousuariosetup: TIntegerField;
    qryOperacoesOSPUsuarionomeusuariosetup: TStringField;
    qryOperacoesOSPUsuarionumeromovimento: TIntegerField;
    qryMovimentos_DESATIVADO_TEMPORARIAMENTE: TtecQuery;
    dsrMovimentos: TtecDataSource;
    qryMovimentosProximo: TtecQuery;
    qryMovimentosProximonumero: TIntegerField;
    qryTiposMovimentos: TtecQuery;
    qryTiposMovimentosoperacao: TStringField;
    qryMovimentos_DESATIVADO_TEMPORARIAMENTEnumero: TIntegerField;
    qryMovimentos_DESATIVADO_TEMPORARIAMENTEproduto: TLargeintField;
    qryMovimentos_DESATIVADO_TEMPORARIAMENTEfilial: TIntegerField;
    qryMovimentos_DESATIVADO_TEMPORARIAMENTEtipomovimento: TStringField;
    qryMovimentos_DESATIVADO_TEMPORARIAMENTEoperacao: TStringField;
    qryMovimentos_DESATIVADO_TEMPORARIAMENTEquantidade: TFloatField;
    qryMovimentos_DESATIVADO_TEMPORARIAMENTEfinanceiro: TFloatField;
    qryMovimentos_DESATIVADO_TEMPORARIAMENTEvalor: TFloatField;
    qryMovimentos_DESATIVADO_TEMPORARIAMENTEreferencia: TStringField;
    qryOperacoesOSPUsuarioParadas: TtecQuery;
    dsrOperacoesOSPUsuarioParadas: TtecDataSource;
    qryOperacoesOSPUsuarioParadasosp: TIntegerField;
    qryOperacoesOSPUsuarioParadaslote: TIntegerField;
    qryOperacoesOSPUsuarioParadasoperacao: TIntegerField;
    qryOperacoesOSPUsuarioParadasusuario: TIntegerField;
    qryOperacoesOSPUsuarioParadasdata: TDateField;
    qryOperacoesOSPUsuarioParadasinicio: TTimeField;
    qryOperacoesOSPUsuarioParadascodigoparada: TIntegerField;
    qryOperacoesOSPUsuarioParadastempoparada: TIntegerField;
    qryOperacoesOSPUsuarioParadasdescricao: TStringField;
    qryOperacoesOSPUsuarioParadasparadavalidada: TBooleanField;
    qryOperacoesOSPtotaltempoparada: TLargeintField;
    qryOperacoesOSPquantidadecomperda: TLargeintField;
    qryOperacoesOSPquantidadesemperda: TLargeintField;
    qryOperacoesOSPnaobloqueiausuario: TBooleanField;
    qryFluxoGramasOperacoesnaobloqueiausuario: TBooleanField;
    qryListaOperacaoLiberadatipooperacao: TStringField;
    qryOperacoesOSPUsuariodatatermino: TDateField;
    qryOperacoesOSPUsuariousuariotermino: TIntegerField;
    qryOperacoesOSPUsuariousuariosetupvalidado: TBooleanField;
    qryOperacoesOSPUsuariousuariofechamentovalidado: TBooleanField;
    qryOperacoesOSPUsuarioretrabalho: TIntegerField;
    qryOperacoesOSPoperacaoemandamento_complementar: TBooleanField;
    qryListaOperacaoMaquinaLiberada: TtecQuery;
    dsrListaOperacaoMaquinaLiberada: TtecDataSource;
    qryOperacoesMaquinas: TtecQuery;
    qryOperacoesOSPUsuariomaquina: TIntegerField;
    qryListaOperacaoMaquinaLiberadamaquina: TIntegerField;
    qryListaOperacaoMaquinaLiberadadescricaomaquina: TStringField;
    qryOperacoesOSPUsuariodescricaomaquina: TStringField;
    qryListaOperacaoMaquinaLiberadaoperacao: TIntegerField;
    qryOperacoesOSPUsuariomaquinavalidada: TBooleanField;
    qryListaOperacaoMaquinaUtilizada: TtecQuery;
    dsrListaOperacaoMaquinaUtilizada: TtecDataSource;
    qryListaOperacaoMaquinaUtilizadaoperacao: TIntegerField;
    qryListaOperacaoMaquinaUtilizadamaquina: TIntegerField;
    qryListaOperacaoMaquinaUtilizadadescricaomaquina: TStringField;
    qryListaOperacaoMaquinaUtilizadaosp: TIntegerField;
    qryListaOperacaoMaquinaUtilizadausuario: TIntegerField;
    qryListaOperacaoMaquinaUtilizadanomeusuario: TStringField;
    qryListaOperacaoLiberadasequencia: TIntegerField;
    qryListaFalhasfalhavalidada: TBooleanField;
    qryOSPLotestipocliente: TStringField;
    qryOperacoesOSPUsuarioParadasbloqueiamaquina: TBooleanField;
    qryListaOperacaoMaquinaBloqueada: TtecQuery;
    dsrListaOperacaoMaquinaBloqueada: TtecDataSource;
    qryListaOperacaoMaquinaBloqueadaoperacao: TIntegerField;
    qryListaOperacaoMaquinaBloqueadamaquina: TIntegerField;
    qryListaOperacaoMaquinaBloqueadadescricaomaquina: TStringField;
    qryListaOperacaoMaquinaBloqueadaosp: TIntegerField;
    qryListaOperacaoMaquinaBloqueadacodigoparada: TIntegerField;
    qryListaOperacaoMaquinaBloqueadadescricaoparada: TStringField;
    qryListaOperacaoMaquinaBloqueadausuario: TIntegerField;
    qryListaOperacaoMaquinaBloqueadanomeusuario: TStringField;
    qryOperacaoesaFechar: TtecQuery;
    qryOperacaoesaFecharosp: TIntegerField;
    qryOperacaoesaFecharlote: TIntegerField;
    qryOperacaoesaFecharmaquina: TIntegerField;
    qryOperacaoesaFechardescricaomaquina: TStringField;
    qryOperacaoesaFecharoperacao: TIntegerField;
    qryOperacaoesaFecharnome: TStringField;
    qryOperacaoesaFecharc01: TStringField;
    qryOperacaoesaFecharc02: TStringField;
    qryOperacaoesaFecharc03: TStringField;
    qryOperacaoesaFechardescricaooperacao: TStringField;
    qryOperacaoesaFecharusuario: TIntegerField;
    qryOperacaoesaFecharnomeuusuario: TStringField;
    qryOperacaoesaFechardata: TDateField;
    qryOperacaoesaFecharinicio: TTimeField;
    qryOperacaoesaFecharquantidadeafechar: TLargeintField;
    dsrOperacaoesaFechar: TtecDataSource;
    qryOperacaoesaFecharnaobloqueiausuario: TBooleanField;
    qryOperacaoesaFecharoperacaopermitidaaousuario: TBooleanField;
    qryOperacoesMaquinasoperacao: TIntegerField;
    qryOperacoesMaquinasmaquina: TIntegerField;
    qryOperacoesMaquinasdescricaomaquina: TStringField;
    qryOperacoesMaquinassituacao: TStringField;
    qryOperacoesMaquinasusuario: TIntegerField;
    qryOperacoesMaquinasnomeusuario: TStringField;
    qryOperacoesMaquinascodigoparada: TIntegerField;
    qryOperacoesMaquinasdescricaoparada: TStringField;
    qryOperacoesMaquinasosp: TIntegerField;
    qryOperacoesMaquinaslote: TIntegerField;
    qryListaOperacaoMaquinaUtilizadalote: TIntegerField;
    qryListaOperacaoMaquinaBloqueadalote: TIntegerField;
    qryOperacoesMaquinasnaobloqueiausuario: TBooleanField;
    qryListaOperacaoMaquinaLiberadanaobloqueiausuario: TBooleanField;
    qryListaOperacaoLiberadanaobloqueiausuario: TBooleanField;
    qryUpdateOperacoesaFechar: TtecQuery;
    qryMaquinasaFechar: TtecQuery;
    dsrMaquinasaFechar: TtecDataSource;
    qryMaquinasaFecharmaquina: TIntegerField;
    qryMaquinasaFechardescricaomaquina: TStringField;
    qryMaquinasaFecharselecionar: TBooleanField;
    qryMaquinasaFechardesconsiderar: TBooleanField;
    qryOperacoesOSPquantidadenasalternativas: TIntegerField;
    qryOperacoesOSPheaprimeiraoperacao: TBooleanField;
    qryOperacoesOSPquantidadelimite: TIntegerField;
    qryFluxoGramasOperacoesOperacaoemGrupoComAnterior: TBooleanField;
    qryOperacoesOSPOperacaoemGrupoComAnterior: TBooleanField;
    qryFluxoGramasOperacoesInformarTerminodoProcesso: TBooleanField;
    qryOperacoesOSPInformarTerminodoProcesso: TBooleanField;
    qryOperacoesOSPfechamentoforcado: TBooleanField;
    qryOperacoesOSPUsuariointervalo: TIntegerField;
    qryOperacoesOSPc8d: TStringField;
    qryOperacoesOSPUsuariotempo: TIntegerField;
    qryOperacoesOSPUsuarioeficiencia: TFloatField;
    qryOperacoesOSPUsuarioqualidade: TFloatField;
    qryOperacoesOSPUsuarioParadasinicioparada: TDateTimeField;
    qryOperacoesOSPUsuarioParadasfimparada: TDateTimeField;
    qryOSPLotesfluxograma: TIntegerField;
    qryOperacoesOSPUsuarionumero: TIntegerField;
    spcoperacoesospusuario_numero_seq: TtecQuery;
    spcoperacoesospusuario_numero_seqcodigo: TIntegerField;
    qryOperacoesOSPUsuarioFalhasnumero_operacoesospusuario: TIntegerField;
    qryOperacoesOSPUsuarioParadasnumero_operacoesospusuario: TIntegerField;
    qryFluxoGramasOperacoesoperacaoconjugada: TBooleanField;
    qryFluxoGramasOperacoestipo: TStringField;
    qryOperacoesOSPoperacaoconjugada: TBooleanField;
    qryOperacoesOSPtipooperacao: TStringField;
    qryOperacoesOSPTipoOperacao_c: TStringField;
    qryUsuarioOperacoesProducaohabilitadotodasconjugadas: TBooleanField;
    qryOperacoesOSPusuariopossuitodasoperacoesconjugadas: TBooleanField;
    qryListaFalhasoperacaoorigemfalha: TIntegerField;
    qryListaFalhasfalhaoperacaoorigem: TIntegerField;
    qryVerificarFalhaOperacaoOrigem: TtecQuery;
    spcoperacoesospusuariofalhas_numero_seq: TtecQuery;
    spcoperacoesospusuariofalhas_numero_seqcodigo: TIntegerField;
    qryOperacoesOSPUsuarioFalhasVerNaoInfluiPremiacao: TStringField;
    qryOperacoesOSPUsuarioFalhasoperacaoorigemfalha: TIntegerField;
    qryOperacoesOSPUsuarioFalhasfalhaoperacaoorigem: TIntegerField;
    qryOperacoesOSPUsuarioFalhasOutrasOrigensDestinos: TtecQuery;
    dsrOperacoesOSPUsuarioFalhasOutrasOrigensDestinos: TtecDataSource;
    qryOperacoesOSPUsuarioFalhasOutrasOrigensDestinosoperacao: TStringField;
    qryOperacoesOSPUsuarioFalhasOutrasOrigensDestinosc01: TStringField;
    qryOperacoesOSPUsuarioFalhasOutrasOrigensDestinosc02: TStringField;
    qryOperacoesOSPUsuarioFalhasOutrasOrigensDestinosc03: TStringField;
    qryOperacoesOSPUsuarioFalhasOutrasOrigensDestinosusuario: TIntegerField;
    qryOperacoesOSPUsuarioFalhasOutrasOrigensDestinosnome: TStringField;
    qryOperacoesOSPUsuarioFalhasOutrasOrigensDestinosdata: TDateField;
    qryOperacoesOSPUsuarioFalhasOutrasOrigensDestinosinicio: TTimeField;
    qryOperacoesOSPUsuarioFalhasOutrasOrigensDestinosfalha: TIntegerField;
    qryOperacoesOSPUsuarioFalhasOutrasOrigensDestinosdescricao: TStringField;
    qryOperacoesOSPUsuarioFalhasOutrasOrigensDestinosperdatotal: TBooleanField;
    qryOperacoesOSPUsuarioFalhasOutrasOrigensDestinosquantidadeperda: TIntegerField;
    qryOperacoesOSPUsuarioIntervaloDigitado: TBooleanField;
    qryOperacoesOSPPCSHR: TFloatField;
    procedure qryOSPLotesCalcFields(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuarioNewRecord(DataSet: TDataSet);
    procedure qryOperacoesOSPAfterScroll(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuarioAfterPost(DataSet: TDataSet);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure qryOperacoesOSPUsuarioAfterOpen(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuarioFalhasNewRecord(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuariodataChange(Sender: TField);
    procedure dsrOperacoesOSPUsuarioDataChange(Sender: TObject;
      Field: TField);
    procedure qryOperacoesOSPUsuarioFalhasAfterDelete(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuarioFalhasAfterPost(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuarioBeforeDelete(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuarioAfterScroll(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuarioFalhasAfterOpen(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuarioAfterInsert(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuarioAfterDelete(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuarioAfterEdit(DataSet: TDataSet);
    procedure qryOSPLotesAfterScroll(DataSet: TDataSet);
    procedure qryOSPLotesBeforeOpen(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuarioBeforePost(DataSet: TDataSet);
    procedure qryOperacoesOSPFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryOperacoesOSPCalcFields(DataSet: TDataSet);
    procedure qryOperacoesOSPAfterPost(DataSet: TDataSet);
    procedure qryListaFalhasAfterInsert(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuarioFalhasAfterScroll(DataSet: TDataSet);
    procedure qryOperacoesOSPBeforeDelete(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuarioParadasNewRecord(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuarioParadasAfterPost(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuarioParadasAfterOpen(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuarioParadasAfterDelete(DataSet: TDataSet);
    procedure qryListaFalhasAfterPost(DataSet: TDataSet);
    procedure qryListaFalhasAfterDelete(DataSet: TDataSet);
    procedure qryListaFalhasNewRecord(DataSet: TDataSet);
    procedure qryListaOperacaoLiberadaAfterScroll(DataSet: TDataSet);
    procedure dsrOperacoesOSPUsuarioParadasDataChange(Sender: TObject;
      Field: TField);
    procedure qryUsuariosAfterOpen(DataSet: TDataSet);
    procedure dsrOperacoesOSPDataChange(Sender: TObject; Field: TField);
    procedure qryOperacoesOSPUsuarioBeforeInsert(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuarioFalhasFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryOperacoesOSPUsuarioParadasFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryOSPLotesAfterOpen(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuarioCalcFields(DataSet: TDataSet);
    procedure qryOperacoesOSPNewRecord(DataSet: TDataSet);
    procedure qryOperacoesOSPUsuarioFalhasCalcFields(DataSet: TDataSet);
    procedure dsrOperacoesOSPUsuarioFalhasDataChange(Sender: TObject;
      Field: TField);
  private
    function Getoperacoesospusuariofalhas_numero_seq: integer;
  private
    FListaUsuariosTerminoAberto: String;
    FListaFalhas: String;
    FTipoLoginSenha: TtecTipoLogin;
    FSelecionarCampoQuantidade: TNotifyEvent;
    FSelecionarCampoUsuario: TNotifyEvent;
    FSelecionarCampoOSP: TNotifyEvent;
    FSelecionarGradeFalhas: TNotifyEvent;
    FSetarParametrosGrade: TNotifyEvent;
    FListaParadas: String;
    fUltimaImpressoraSelecionada: String;
    FListaFalhasSelecionadas: String;
    FListaOperacaoLiberadaSequencia: Boolean;
    fSenhadoGerenteFixada: boolean;
    function GetUltimaOSP: integer;
    function Getoperacoesospusuario_numero_seq: integer;
    property operacoesospusuario_numero_seq: integer read Getoperacoesospusuario_numero_seq;

    property operacoesospusuariofalhas_numero_seq: integer read Getoperacoesospusuariofalhas_numero_seq;

    { Private declarations }
  protected

    procedure AtualizaListaUsuariosTerminoemAberto;
    procedure AtualizaListaFalhas;
    procedure AtualizaListaFalhasGeral;

    procedure AtualizaListaParadas;

    procedure CalcularQuantidades;
    procedure CalcularTempoParada;

    procedure GravarOperacoesConjugadas;

  public
    { Public declarations }
    StatusCadastro: StatusCadastro;
    IncluindoCodigoUsuario : Boolean;
    TempoAbrirJanela : TDatetime;
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
    property UltimaOSP: integer read GetUltimaOSP;
    procedure EditarOSP;
    procedure EditarOperacoesOSPUsuario;
    procedure EditarOperacoesOSP;

    function GravarOperacoesOSPUsuario: Boolean;
    procedure LimparOperacoesOSPUsuario;
    procedure LimparOperacoesOSPUsuarioSetup;
    procedure LimparOperacoesOSPUsuarioFechamento;

    procedure LimparOperacoesOSPUsuarioMaquinas;


    procedure CancelarOperacoesOSPUsuario;
    procedure CancelarOperacoesOSPUsuarioSetup;
    procedure CancelarOperacoesOSPUsuarioFechamento;

    function RegistrodeOperacoesOSPUsuario: boolean;
    function RegistrodeOperacoesOSPUsuarioSetup: boolean;
    function RegistrodeOperacoesOSPUsuarioMaquinas: boolean;

    function ExcluirOperacoesOSP: boolean;
    procedure ExcluirOperacoesOSPUsuario;

    property ListaUsuariosTerminoAberto: String read FListaUsuariosTerminoAberto write FListaUsuariosTerminoAberto;
    property ListaFalhas: String read FListaFalhas write FListaFalhas;
    property ListaParadas: String read FListaParadas write FListaParadas;

    function PosicionarOperacoesOSPUsuarioAguardandoFechamento: boolean;

    procedure MarcarOperacaoemAndamento(NaoPosicionar: Boolean = false);
    procedure ExcluirOperacao;

    function GravarOperacoesOSPUsuarioFalhas: Boolean;
    function GravarOperacoesOSPUsuarioParadas: Boolean;

    procedure EditarOperacoesOSPUsuarioFalhas;
    procedure EditarOperacoesOSPUsuarioParadas;

    procedure LimparOperacoesOSPUsuarioFalhas;
    procedure LimparOperacoesOSPUsuarioParadas;

    function RegistrodeOperacoesOSPUsuarioFalhas: boolean;
    function RegistrodeOperacoesOSPUsuarioParadas: boolean;

    procedure ExcluirOperacoesOSPUsuarioFalhas;
    procedure ExcluirOperacoesOSPUsuarioParadas;

    procedure CancelarOperacoesOSPUsuarioFalhas;
    procedure CancelarOperacoesOSPUsuarioParadas;

    procedure  Percorrer(Campo: Byte; Key: Word; Shift: TShiftState);

    property TipoLogin: TtecTipoLogin read FTipoLoginSenha write FTipoLoginSenha;
    procedure IncluirOperacoesOSP;
    function SelecionarOperacao: Boolean;
    function selecionarUsuarioSetup: Boolean;
    function FinalizarOperacao: Boolean;
    function SelecionarUsuarioOperacao: Boolean;
    property SelecionarCampoQuantidade: TNotifyEvent
             read FSelecionarCampoQuantidade
             write FSelecionarCampoQuantidade;

    property SelecionarCampoUsuario: TNotifyEvent
             read FSelecionarCampoUsuario
             write FSelecionarCampoUsuario;

    property SelecionarCampoOSP: TNotifyEvent
             read FSelecionarCampoOSP
             write FSelecionarCampoOSP;

    property SelecionarGradeFalhas: TNotifyEvent
             read FSelecionarGradeFalhas
             write FSelecionarGradeFalhas;

    property SetarParametrosGrade: TNotifyEvent
             read FSetarParametrosGrade
             write FSetarParametrosGrade;


    function GravarDados: Boolean;

    procedure IniciarOperacao;
    procedure SetarSomenteLeitura(Valor: boolean);
//    procedure DefinirAlternativas;
    procedure DefinirComplementar;
    procedure DefinirOrigemComplementar;

    function ExisteOperacoesOSPUsuarios: boolean;
    function ExisteOperacoesOSPUsuarios_Complementar: boolean;

    function ImprimirProcessos: boolean;
    function AbreOperacaoemAbertoUsuario: Boolean;
    property UltimaImpressoraSelecionada: String read fUltimaImpressoraSelecionada write fUltimaImpressoraSelecionada;
    procedure GravarFalhas;

    property ListaFalhasSelecionadas: String read FListaFalhasSelecionadas write FListaFalhasSelecionadas;
    property ListaOperacaoLiberadaSequencia: Boolean read FListaOperacaoLiberadaSequencia write FListaOperacaoLiberadaSequencia;

    procedure MarcarSelecionados(Marcando, Todos: Boolean);
    procedure AbrirOperacaoesaFechar;
    procedure gravarOperacaoesaFechar;
    function ExisteOperacoesOSPUsuariosemAberto: boolean;
    procedure ConcluirOperacao;
    procedure FixarSenhaGerente;
    property SenhadoGerenteFixada: boolean read fSenhadoGerenteFixada write fSenhadoGerenteFixada;

//    procedure CalcularQuantidadesFalhasOperacaoOriginal;


  end;

var
  dtmOperacoesOSP: TdtmOperacoesOSP;

implementation

uses fmlistaoperacoesusuario, fmfechamentooperacaousuario,
  fmusuariosoperacao, fmlistausuariossetup;

{$R *.dfm}

procedure TdtmOperacoesOSP.qryOSPLotesCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryOSPlotestotal.AsCurrency := qryOSPLotesquantidadeosp.AsCurrency * qryOSPLotespreco.AsCurrency;
  if not qryOSPLotesqtdeentregue.IsNull then
    qryOSPLotessaldo.AsCurrency := qryOSPLotesquantidadeosp.AsCurrency -
                              qryOSPLotesqtdeentregue.AsCurrency
  else
    qryOSPLotessaldo.AsCurrency := qryOSPLotesquantidadeosp.AsCurrency;
end;

constructor TdtmOperacoesOSP.Create(AOwner: TComponent);
begin
  inherited;
  ListaUsuariosTerminoAberto := '0';
  ListaFalhas := '0';
  ListaFalhasSelecionadas := '0';
  ListaParadas := '0';
  TipoLogin := NaoInformado;
//  qryOSPLotes.Tag := ctTabelas;
  qryTiposMovimentos.Tag := ctTabelas;

  //qryOSPProximo.Open;




//    qryOSPLotes.AfterScroll := nil;
 //   qryOSPLotes.AfterClose := nil;
 //   qryOSPLotes.AfterCancel := nil;

   qryOperacoesOSPUsuario.AfterScroll := nil;
   qryOperacoesOSPUsuarioFalhas.AfterScroll := nil;

    //ReFazConsulta(qryOSPLotes,[0,1,2,3],[0,0,qryOSPProximonumero.asinteger-1,1]);
    ReFazConsulta(qryOSPLotes,[0,1,2,3],[0,0,0,0]);

   qryOperacoesOSPUsuario.AfterScroll := qryOperacoesOSPUsuarioAfterScroll;
   qryOperacoesOSPUsuarioFalhas.AfterScroll := qryOperacoesOSPUsuarioFalhasAfterScroll;


 //   qryOSPLotes.AfterScroll := qryOSPLotesAfterScroll;
 //   qryOSPLotes.AfterClose := qryOSPLotesAfterScroll;
 //   qryOSPLotes.AfterCancel := qryOSPLotesAfterScroll;



end;

destructor TdtmOperacoesOSP.Destroy;
begin

  inherited;
end;

function TdtmOperacoesOSP.GetUltimaOSP: integer;
begin
  result := qryOSPProximonumero.AsInteger - 1;
end;

procedure TdtmOperacoesOSP.EditarOperacoesOSPUsuario;
begin
  if not (qryOperacoesOSPUsuario.State in [dsedit, dsinsert]) then
    qryOperacoesOSPUsuario.Edit;
end;

function TdtmOperacoesOSP.GravarOperacoesOSPUsuario: Boolean;
begin
  result := true;
  if (qryOperacoesOSPUsuario.State in [dsedit,dsinsert]) then
  begin
    result := qryOperacoesOSPUsuario.CheckRequiredFields;
    if result then
       qryOperacoesOSPUsuario.Post;
  end;
end;

procedure TdtmOperacoesOSP.LimparOperacoesOSPUsuario;
begin
   if not (qryOperacoesOSPUsuario.State in [dsedit, dsinsert]) then
     qryOperacoesOSPUsuario.Edit;
   qryOperacoesOSPUsuariousuario.Clear;
   qryOperacoesOSPUsuarionome.Clear;
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryOperacoesOSPUsuarionumero.asinteger := operacoesospusuario_numero_seq;
  qryOperacoesOSPUsuarioosp.AsInteger := qryOperacoesOSPosp.AsInteger;
  qryOperacoesOSPUsuariolote.AsInteger := qryOperacoesOSPlote.AsInteger;
  qryOperacoesOSPUsuariooperacao.AsInteger := qryOperacoesOSPoperacao.AsInteger;
  qryOperacoesOSPUsuariousuariovalidado.AsBoolean := false;
  qryOperacoesOSPUsuariousuariosetupvalidado.AsBoolean := false;
  qryOperacoesOSPUsuariousuariofechamentovalidado.AsBoolean := false;

  qryOperacoesOSPUsuariodata.AsDateTime := DataServidor;
//  qryOperacoesOSPUsuarioinicio.AsString := FormatDateTime('HH:MM',Now);
  qryOperacoesOSPUsuarioinicio.AsDateTime := strtoDateTime(FormatDateTime('HH:MM',HoraServidor));

  qryOperacoesOSPUsuariodatatermino.Clear;
  qryOperacoesOSPUsuariotermino.Clear;

end;

function TdtmOperacoesOSP.RegistrodeOperacoesOSPUsuario: boolean;
begin
  result := qryOperacoesOSPUsuariousuario.IsNull or
            qryOperacoesOSPUsuarionome.IsNull;
end;

procedure TdtmOperacoesOSP.CancelarOperacoesOSPUsuario;
var
 RegistroAtual : TBookMark;
begin
  try
    RegistroAtual := qryOperacoesOSPUsuario.getBookMark;
    qryOperacoesOSPUsuario.AfterScroll := nil;
    qryOperacoesOSPUsuarioFalhas.AfterScroll := nil;
    qryOperacoesOSPUsuario.Cancel;
    qryOperacoesOSPUsuario.First;
    while not qryOperacoesOSPUsuario.Eof do
    begin
      CancelarOperacoesOSPUsuarioFalhas;
      if not qryOperacoesOSPUsuariousuariovalidado.AsBoolean then
        qryOperacoesOSPUsuario.Delete
      else
        qryOperacoesOSPUsuario.next;

    end;
    qryOperacoesOSPUsuario.GotoBookmark(RegistroAtual);
    qryOperacoesOSPUsuario.FreeBookmark(RegistroAtual);
    qryOperacoesOSPUsuario.AfterScroll := qryOperacoesOSPUsuarioAfterScroll;
    qryOperacoesOSPUsuarioFalhas.AfterScroll := qryOperacoesOSPUsuarioFalhasAfterScroll;
  except
  end;
end;



procedure TdtmOperacoesOSP.ExcluirOperacoesOSPUsuario;
begin
  if not qryOperacoesOSPUsuario.IsEmpty then
    if not qryOperacoesOSPUsuario.ReadOnly then
      if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o usuário desta operação'])) = smbOk) then
         qryOperacoesOSPUsuario.Delete;
end;

procedure TdtmOperacoesOSP.AtualizaListaUsuariosTerminoemAberto;
var
  Pos: TBookmark;
begin
  Pos := qryOperacoesOSPUsuario.GetBookmark;
  try
    qryOperacoesOSPUsuario.AfterScroll := nil;
    qryOperacoesOSPUsuarioFalhas.AfterScroll := nil;
    qryOperacoesOSPUsuario.DisableControls;
    ListaUsuariosTerminoAberto := '';
    qryOperacoesOSPUsuario.First;
    while Not qryOperacoesOSPUsuario.Eof do
    begin
      if qryOperacoesOSPUsuariotermino.isnull then
        if qryOperacoesOSPUsuariousuariovalidado.AsBoolean then
          ListaUsuariosTerminoAberto := ListaUsuariosTerminoAberto +
                                       qryOperacoesOSPUsuariousuario.AsString + ',';
      qryOperacoesOSPUsuario.Next
    end;

    if ListaUsuariosTerminoAberto <> '' then
      ListaUsuariosTerminoAberto := copy(ListaUsuariosTerminoAberto,0, Length(ListaUsuariosTerminoAberto)-1)
    else
      ListaUsuariosTerminoAberto := '0';

  finally
    qryOperacoesOSPUsuario.GotoBookmark(Pos);
    qryOperacoesOSPUsuario.FreeBookmark(Pos);
    qryOperacoesOSPUsuario.enableControls;
    qryOperacoesOSPUsuario.AfterScroll := qryOperacoesOSPUsuarioAfterScroll;
    qryOperacoesOSPUsuarioFalhas.AfterScroll := qryOperacoesOSPUsuarioFalhasAfterScroll;
  end
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPAfterScroll(DataSet: TDataSet);
var
 vValor : Boolean;

begin
  inherited;
//  dtmOperacoesOSP.TempoAbrirJanela := now();

  case TipoLogin of
    GerenteProducao:
    begin
      AtualizaListaUsuariosTerminoemAberto;
      if not SenhadoGerenteFixada then
      begin
        qryOperacoesOSPUsuario.RequestLive := (qryOperacoesOSPoperacaoemandamento.AsBoolean or
                                               not qryOperacoesOSPUsuario.isempty) and
                                               (TipoLogin = GerenteProducao);

        vValor := qryOperacoesOSPUsuario.ReadOnly or
                  qryOperacoesOSPUsuario.IsEmpty or
                  (qryOperacoesOSPUsuario.State = dsinsert);

        qryOperacoesOSPUsuarioFalhas.ReadOnly := vValor {or (qryOSPLotes.State = dsedit)};
        qryOperacoesOSPUsuarioParadas.ReadOnly := vValor;
      end
      else
      begin
        qryOperacoesOSPUsuario.RequestLive := true;
        qryOperacoesOSPUsuarioFalhas.ReadOnly := False {(qryOSPLotes.State = dsedit)};
        qryOperacoesOSPUsuarioParadas.ReadOnly := false;

        SetarSomenteLeitura(false);
      end;

    end;

    operador:
    begin
      if qryOperacoesOSPoperacaoliberada.AsBoolean then
      begin
        qryOperacoesOSPUsuario.ReadOnly := false;
        qryOperacoesOSPUsuarioFalhas.ReadOnly := false {(qryOSPLotes.State = dsedit)};
        qryOperacoesOSPUsuarioParadas.ReadOnly := false;

        case StatusCadastro of
         IniciandoOperacao:
         begin
            if qryOperacoesOSPUsuariotermino.IsNull and
               (qryOperacoesOSPUsuariousuario.AsInteger = qryUsuariosCodigo.asinteger) then
              qryOperacoesOSPUsuario.Delete;
            IniciarOperacao;
         end;
         FinalizandoOperacao:
         begin
           if qryOperacoesOSPUsuariotermino.IsNull then
           begin
             qryOperacoesOSPUsuario.Edit;
             SelecionarCampoQuantidade(nil);
           end;
         end;
        end;
      end
      else
      begin
        qryOperacoesOSPUsuario.ReadOnly := true;
        qryOperacoesOSPUsuarioFalhas.ReadOnly := true;
        qryOperacoesOSPUsuarioParadas.ReadOnly := true;
      end;
    end;

    NaoInformado :
    begin
      qryOperacoesOSPUsuario.ReadOnly := true;
      qryOperacoesOSPUsuarioFalhas.ReadOnly := true;
      qryOperacoesOSPUsuarioParadas.ReadOnly := true;
    end;

  end;

  qryOperacoesOSPCalcFields(qryOperacoesOSP);
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qryOperacoesOSPUsuarioFalhas.filtered := false;
  qryOperacoesOSPUsuarioParadas.filtered := false;
  (*
  if qryOperacoesOSP.RecNo = qryOperacoesOSP.RecordCount then  // é a ultima operação
  begin

    if (qryOperacoesOSPUsuarioquantidade.AsCurrency<>0) then
    begin
      if (qryMovimentosnumero.AsInteger = qryOperacoesOSPUsuarionumeromovimento.AsInteger) and     // ja possui movimento
         (qryMovimentosnumero.AsInteger <> 0) and
         (qryOperacoesOSPUsuarioquantidade.AsCurrency <> qryMovimentosquantidade.AsCurrency) then  // e foi modificada
      begin
        if qryOperacoesOSPUsuarioquantidade.AsCurrency <> 0 then
        begin
          qryMovimentos.Edit;
          qryMovimentosquantidade.AsCurrency := qryOperacoesOSPUsuarioquantidade.AsCurrency;
          qryMovimentos.post;
        end
        else
        begin
          qryMovimentos.delete;

          qryOperacoesOSPUsuario.AfterPost := nil;
          qryOperacoesOSPUsuario.Edit;
          qryOperacoesOSPUsuarionumeromovimento.clear;
          qryOperacoesOSPUsuario.Post;
          qryOperacoesOSPUsuario.AfterPost := qryOperacoesOSPUsuarioAfterPost;

        end;
      end
      else
      begin
        qryMovimentosProximo.close;
        qryMovimentosProximo.Open;

        qryMovimentos.append;
        qryMovimentosproduto.asLargeint := qryOSPLotesproduto.AsLargeInt;
        qryMovimentosfilial.asInteger   := FilialBase;
        qryMovimentostipomovimento.asString := 'ESP';
        qryMovimentosoperacao.AsString := qryTiposMovimentosoperacao.AsString;
        qryMovimentosquantidade.ascurrency := qryOperacoesOSPUsuarioquantidade.AsCurrency;
        qryMovimentosfinanceiro.ascurrency := 0;
        qryMovimentosvalor.ascurrency := 0;
        qryMovimentosreferencia.AsString := 'SAÍDA DA PRODUÇÃO. OSP: '+qryOSPLotesosp.AsString+' LOTE: '+qryOSPLotesnumero.AsString+
                                            ' USUARIO: '+qryOperacoesOSPUsuariousuario.AsString+'-'+qryOperacoesOSPUsuarionome.AsString;

        qryMovimentosnumero.AsInteger := qryMovimentosProximonumero.AsInteger;

        qryMovimentos.post;

        qryOperacoesOSPUsuario.AfterPost := nil;
        qryOperacoesOSPUsuario.Edit;
        qryOperacoesOSPUsuarionumeromovimento.AsInteger := qryMovimentosProximonumero.AsInteger;

        qryOperacoesOSPUsuario.Post;

        qryOperacoesOSPUsuario.AfterPost := qryOperacoesOSPUsuarioAfterPost;

      end;
    end
    else
    begin
      if (qryMovimentosnumero.AsInteger = qryOperacoesOSPUsuarionumeromovimento.AsInteger) and     // ja possui movimento
         (qryMovimentosnumero.AsInteger <> 0) and
         (qryOperacoesOSPUsuarioquantidade.AsCurrency <> qryMovimentosquantidade.AsCurrency) then  // e foi modificada
      begin
        qryMovimentos.delete;

        qryOperacoesOSPUsuario.AfterPost := nil;
        qryOperacoesOSPUsuario.Edit;
        qryOperacoesOSPUsuarionumeromovimento.clear;
        qryOperacoesOSPUsuario.Post;
        qryOperacoesOSPUsuario.AfterPost := qryOperacoesOSPUsuarioAfterPost;

      end;
    end;

  end;
  *)

  case TipoLogin of
    GerenteProducao:
    begin
      EditarOSP;
      qryOperacoesOSPUsuarioFalhas.ReadOnly := qryOperacoesOSPUsuario.ReadOnly or
                                           qryOperacoesOSPUsuario.IsEmpty or
                                           (qryOperacoesOSPUsuario.State = dsinsert) {or
                                           (qryOSPLotes.State = dsedit)};

      qryOperacoesOSPUsuarioParadas.ReadOnly := qryOperacoesOSPUsuario.ReadOnly or
                                           qryOperacoesOSPUsuario.IsEmpty or
                                           (qryOperacoesOSPUsuario.State = dsinsert);

    end;
  end;

  if qryOperacoesOSPtipooperacao.AsString[2] = 'c' then
    GravarOperacoesConjugadas;

  CalcularQuantidades;

end;

procedure TdtmOperacoesOSP.ZMonitor1MonitorEvent(Sql, Result: String);
var
 Listar : TStringList;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('c:\OSP.sql') then
    Listar.loadfromfile('c:\OSP.sql');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('c:\OSP.sql');
  listar.free;
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  case TipoLogin of
    GerenteProducao:
      AtualizaListaUsuariosTerminoemAberto;
  end;
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioFalhasNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryOperacoesOSPUsuarioFalhasnumero_operacoesospusuario.AsInteger := qryOperacoesOSPUsuarionumero.AsInteger;
//  qryOperacoesOSPUsuarioFalhasnumero.Asinteger := operacoesospusuario_numero_seq;

  qryOperacoesOSPUsuarioFalhasosp.AsInteger := qryOperacoesOSPosp.AsInteger;
  qryOperacoesOSPUsuarioFalhaslote.AsInteger := qryOperacoesOSPlote.AsInteger;
  qryOperacoesOSPUsuarioFalhasoperacao.AsInteger := qryOperacoesOSPoperacao.AsInteger;

  qryOperacoesOSPUsuarioFalhasusuario.AsInteger := qryOperacoesOSPUsuariousuario.AsInteger;
  qryOperacoesOSPUsuarioFalhasdata.AsDateTime := qryOperacoesOSPUsuariodata.AsDateTime;
  qryOperacoesOSPUsuarioFalhasinicio.AsString := qryOperacoesOSPUsuarioinicio.AsString;

  qryOperacoesOSPUsuarioFalhasquantidadeperda.AsInteger := 0;

end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuariodataChange(
  Sender: TField);
begin
  inherited;
  {
  qryOperacoesOSPUsuarioinicio.ReadOnly := false;
  qryOperacoesOSPUsuariotermino.ReadOnly := false;
  qryOperacoesOSPUsuarioquantidade.ReadOnly := false;
   }
end;

procedure TdtmOperacoesOSP.dsrOperacoesOSPUsuarioDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;

  if field = qryOperacoesOSPUsuariodata then
  begin
    if NOT qryOperacoesOSPUsuariodatatermino.IsNull AND
       NOT qryOperacoesOSPUsuariodata.IsNull AND
       (qryOperacoesOSPUsuariodata.Asdatetime >
        qryOperacoesOSPUsuariodatatermino.AsDateTime) then
    begin
      MensagemErro('A data inicial não pode ser superior à final.');
      qryOperacoesOSPUsuariodata.Clear;
    end;
  end
  else
  if field = qryOperacoesOSPUsuarioinicio then
  begin
    if NOT qryOperacoesOSPUsuariotermino.IsNull AND
       (qryOperacoesOSPUsuarioinicio.AsDateTime >
        qryOperacoesOSPUsuariotermino.AsDateTime) and
       (qryOperacoesOSPUsuariodata.AsDatetime >=
        qryOperacoesOSPUsuariodatatermino.Asdatetime) then
    begin
      MensagemErro('A hora inicial não pode ser superior à final.');
      qryOperacoesOSPUsuarioinicio.Clear;
    end;
  end
  {
  else
  if (field = qryOperacoesOSPUsuariousuariotermino) and
     qryOperacoesOSPUsuariousuariofechamentovalidado.AsBoolean then

  begin
    if not qryOperacoesOSPnaobloqueiausuario.asboolean and
       not qryoperacoesospUsuariousuariotermino.isnull and
       (qryoperacoesospUsuariousuariotermino.asinteger <> qryOperacoesOSPUsuariousuario.asinteger) then
    begin
      MensagemErro('O usuário de fechamento não pode ser diferente do usuário da abertura para operações que não bloqueiam o usuário.');
      qryoperacoesospUsuariousuariotermino.value :=  qryoperacoesospUsuariousuariotermino.oldvalue;
    end;
  end
  }
  else
  if field = qryOperacoesOSPUsuariotermino then
  begin
    if qryOperacoesOSPUsuariodatatermino.isnull and not qryOperacoesOSPUsuariotermino.isnull then
      qryOperacoesOSPUsuariodatatermino.asdatetime := DataServidor;

    if NOT qryOperacoesOSPUsuariotermino.IsNull AND
       (qryOperacoesOSPUsuarioinicio.Asdatetime >
        qryOperacoesOSPUsuariotermino.AsDateTime) and
       (qryOperacoesOSPUsuariodata.AsDateTime >=
        qryOperacoesOSPUsuariodatatermino.AsDateTime) then
    begin
      MensagemErro('A hora final não pode ser inferior à inicial.');
      qryOperacoesOSPUsuariotermino.Clear;
    end;
  end
  else
  if (field = qryOperacoesOSPUsuariodatatermino) then
  begin
    if NOT qryOperacoesOSPUsuariodata.IsNull AND
       NOT qryOperacoesOSPUsuariodatatermino.IsNull AND
       (qryOperacoesOSPUsuariodata.AsDateTime >
        qryOperacoesOSPUsuariodatatermino.AsDateTime) then
    begin
      MensagemErro('A data final não pode ser inferior à inicial.');
      qryOperacoesOSPUsuariodatatermino.Clear;
    end;
  end
  else
  if field = qryOperacoesOSPUsuarioquantidade then
  begin
    if qryOperacoesOSPUsuarioquantidade.AsInteger <> 0 then
    begin
      if qryOperacoesOSPUsuariodatatermino.IsNull
      then qryOperacoesOSPUsuariodatatermino.asdatetime := DataServidor;
//      qryOperacoesOSPUsuariotermino.AsString := FormatDateTime('HH:MM',Now);
      if qryOperacoesOSPUsuariotermino.IsNull
      then qryOperacoesOSPUsuariotermino.Asdatetime := strtoDateTime(FormatDateTime('HH:MM',HoraServidor));

      qryOperacoesOSPUsuarioFalhas.RequestLive := true; {not (qryOSPLotes.State = dsedit);}
    end
    else
    begin
      qryOperacoesOSPUsuariodatatermino.clear;
      qryOperacoesOSPUsuariotermino.Clear;
      case TipoLogin of
      Operador : qryOperacoesOSPUsuarioFalhas.RequestLive := false;
      end;
    end
  end
  else
  if field = qryOperacoesOSPUsuarioretrabalho then
  begin
    if qryOperacoesOSPUsuarioretrabalho.AsInteger <> 0 then
    begin
      if qryOperacoesOSPUsuarioretrabalho.AsInteger >
         qryOperacoesOSPUsuarioquantidade.AsInteger then
      begin
        MensagemAviso('A quantidade de retrabalho não pode ser superior a quantidade produzida');
        qryOperacoesOSPUsuarioretrabalho.clear;
      end;
    end
  end
  else
  // Por implementar LW 13-FEV-2013
  if Field = qryOperacoesOSPUsuarioIntervalo then
  begin
    if qryOperacoesOSPUsuarioIntervaloDigitado.AsBoolean
    then // definir vermelho negritado
    else begin
        // definir preto normal
    end;
  end;

end;

function TdtmOperacoesOSP.GravarDados: Boolean;
var
  vOperacao : integer;
  vUsuario: integer;
  vData: TDateTime;
  vInicio: TTime;

  RegistroAtualOperacaoOSP: TBookMark;

  function VerificarFalhas: Boolean;
  begin
    result := true;
    if TipoLogin = GerenteProducao then
    begin
      if (qryOperacoesOSPUsuariotermino.AsString<>'') and
         (qryOperacoesOSPUsuarioFalhas.RecordCount=0) then
        result := MensagemConfirmacao('Não existem falhas cadastradas. Deseja gravar assim mesmo?') = smbOk;
    end;
  end;

begin
  try

    result := GravarOperacoesOSPUsuario;

    vOperacao := qryOperacoesOSPoperacao.asinteger;
    vUsuario :=  qryOperacoesOSPUsuariousuario.asinteger;
    vData := qryOperacoesOSPUsuariodata.AsDateTime;
    vInicio := qryOperacoesOSPUsuarioinicio.AsDateTime;


    if result then
      result := GravarOperacoesOSPUsuarioFalhas;

    if result then
    begin
      CancelarOperacoesOSPUsuario;

      result := VerificarFalhas;
      if result then
      begin
        if qryOSPLotes.State in [dsedit, dsinsert] then
          qryosplotes.Post;

        result := perpetrar([qryOperacoesOSP, {qrymovimentos,}
                             qryOperacoesOSPUsuario, qryOperacoesOSPUsuarioFalhas,
                             qryOperacoesOSPUsuarioParadas]);

        qryOperacoesOSPUsuario.AfterOpen := nil;
        qryOperacoesOSPUsuario.AfterScroll := nil;
        qryOperacoesOSPUsuarioFalhas.AfterScroll := nil;

        RefazConsultaPorNome(qryOperacoesOSPUsuario,
                             ['OSP', 'Lote'],
                             [qryOSPLotesosp.Asinteger, qryOSPLotesnumero.Asinteger]);

        qryOperacoesOSPUsuario.AfterOpen := qryOperacoesOSPUsuarioAfterOpen;
        qryOperacoesOSPUsuario.AfterScroll := qryOperacoesOSPUsuarioAfterScroll;
        qryOperacoesOSPUsuarioFalhas.AfterScroll := qryOperacoesOSPUsuarioFalhasAfterScroll;

        if result then
          SetarSomenteLeitura(True);
      end
      else
        SelecionarGradeFalhas(nil);
    end;
  finally
    qryOperacoesOSP.locate('operacao',vOperacao,[]);
    qryOperacoesOSPUsuario.locate('operacao;usuario;data;inicio', VarArrayOf([voperacao,vusuario,vdata,vinicio]),[])
  end;
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioFalhasAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  case TipoLogin of
    GerenteProducao, Operador:
    begin
      EditarOSP;
      AtualizaListaFalhas;
      CalcularQuantidades;
    end;
  end;
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioFalhasAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  case TipoLogin of
    GerenteProducao, operador:
    begin
      EditarOSP;
      AtualizaListaFalhas;
      CalcularQuantidades;
    end;
  end;
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  case TipoLogin of
    GerenteProducao:
    begin
      qryOperacoesOSPUsuarioFalhas.First;
      while not qryOperacoesOSPUsuarioFalhas.Eof do
        qryOperacoesOSPUsuarioFalhas.Delete;

      qryOperacoesOSPUsuarioParadas.First;
      while not qryOperacoesOSPUsuarioParadas.Eof do
        qryOperacoesOSPUsuarioParadas.Delete;

        {
      qrymovimentos.First;
      while not qrymovimentos.Eof do
        qrymovimentos.delete;
        }
    end;
  end;
end;

function TdtmOperacoesOSP.ExcluirOperacoesOSP: Boolean;
begin
  result := false;
  if not qryOperacoesOSP.IsEmpty then
    if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['e todas as OPERAÇÕES DA OSP'])) = smbOk) then
    begin
      qryOperacoesOSP.Filtered := false;
      qryoperacoesosp.DisableControls;
      qryOperacoesOSP.First;
      while not qryoperacoesosp.Eof do
        qryOperacoesOSP.Delete;
      result := perpetrar([qryOperacoesOSP{, qrymovimentos}]);
      qryOperacoesOSP.Filtered := true;
      qryoperacoesosp.EnableControls;
    end;
end;

procedure TdtmOperacoesOSP.EditarOperacoesOSPUsuarioFalhas;
begin
  if not (qryOperacoesOSPUsuarioFalhas.State in [dsedit, dsinsert]) then
    qryOperacoesOSPUsuarioFalhas.Edit;

  if not (qryOperacoesOSPUsuarioParadas.State in [dsedit, dsinsert]) then
    qryOperacoesOSPUsuarioParadas.Edit;
end;

procedure TdtmOperacoesOSP.AtualizaListaFalhas;
var
  Pos: TBookmark;
begin

  if qryOperacoesOSPUsuarioFalhas.Active then
  begin
    Pos := qryOperacoesOSPUsuarioFalhas.GetBookmark;
    try
      qryOperacoesOSPUsuarioFalhas.DisableControls;
      ListaFalhas := '';

      qryOperacoesOSPUsuarioFalhas.First;
      while Not qryOperacoesOSPUsuarioFalhas.Eof do
      begin
        if qryOperacoesOSPUsuarioFalhasfalhavalidada.AsBoolean then
          ListaFalhas := ListaFalhas +
                         qryOperacoesOSPUsuarioFalhasfalha.AsString + ',';
        qryOperacoesOSPUsuarioFalhas.Next
      end;

      if ListaFalhas <> '' then
        ListaFalhas := copy(ListaFalhas,0, Length(ListaFalhas)-1)
      else
        ListaFalhas := '0';

    finally
      qryOperacoesOSPUsuarioFalhas.GotoBookmark(Pos);
      qryOperacoesOSPUsuarioFalhas.FreeBookmark(Pos);
      qryOperacoesOSPUsuarioFalhas.enableControls;
    end
  end;

end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  dtmOperacoesOSP.TempoAbrirJanela := now();


  if ((qryOperacoesOSPtipooperacao.AsString <> '') and
      (qryOperacoesOSPtipooperacao.AsString[2] = 'C')) then
    SetarSomenteLeitura(true)
  else
  begin
    case TipoLogin of
      GerenteProducao : begin
                          AtualizaListaFalhas;
                          AtualizaListaParadas;
                          SetarSomenteLeitura(false);
                        end;
      Operador        : begin
                          AtualizaListaFalhas;
                          AtualizaListaParadas;
                          SetarSomenteLeitura(not(qryUsuarioscodigo.asinteger = qryOperacoesOSPUsuariousuario.AsInteger));
                        end;
      NaoInformado    : SetarSomenteLeitura(true);
    end;
  end;

  {
  if qryOperacoesOSPUsuarioquantidade.asinteger = 0 then
    qryOperacoesOSPUsuarioFalhasOutrasOrigensDestinos.Close
  else
    refazconsultapornome(qryOperacoesOSPUsuarioFalhasOutrasOrigensDestinos,
      ['osp','lote','operacao','usuario','datainicial','horainicial','tipofalha'],
      [qryOperacoesOSPUsuarioosp.asinteger,
       qryOperacoesOSPUsuariolote.AsInteger,
       qryOperacoesOSPUsuariooperacao.asinteger,
       qryOperacoesOSPUsuariousuario.asinteger,
       qryOperacoesOSPUsuariodata.asdatetime,
       FormatDateTime('hh:mm:ss', qryOperacoesOSPUsuarioinicio.asdatetime),
       'N']);
   }
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioFalhasAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  case TipoLogin of
    GerenteProducao, Operador: AtualizaListaFalhas;
  end;
end;

procedure TdtmOperacoesOSP.LimparOperacoesOSPUsuarioFalhas;
begin
   if not (qryOperacoesOSPUsuarioFalhas.State in [dsedit, dsinsert]) then
     qryOperacoesOSPUsuarioFalhas.Edit;
   qryOperacoesOSPUsuarioFalhasfalha.Clear;
   qryOperacoesOSPUsuarioFalhasdescricao.Clear;
   qryOperacoesOSPUsuarioFalhasperdatotal.Clear;
end;

function TdtmOperacoesOSP.RegistrodeOperacoesOSPUsuarioFalhas: boolean;
begin
  result := qryOperacoesOSPUsuarioFalhasfalha.IsNull;
end;

procedure TdtmOperacoesOSP.ExcluirOperacoesOSPUsuarioFalhas;
begin
  if not qryOperacoesOSPUsuarioFalhas.IsEmpty then
    if not qryOperacoesOSPUsuarioFalhas.ReadOnly then
      if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['a falha desta operação'])) = smbOk) then
         qryOperacoesOSPUsuarioFalhas.Delete;
end;

procedure TdtmOperacoesOSP.CancelarOperacoesOSPUsuarioFalhas;
var
  RegistroAtual : TBookmark;
begin
  try
    RegistroAtual := qryOperacoesOSPUsuarioFalhas.getBookMark;

    qryOperacoesOSPUsuarioFalhas.Cancel;
    qryOperacoesOSPUsuarioFalhas.First;
    while not qryOperacoesOSPUsuarioFalhas.Eof do
    begin
      if not (qryOperacoesOSPUsuarioFalhasfalhavalidada.AsBoolean) or
              qryOperacoesOSPUsuarioFalhasquantidadeperda.IsNull then
        qryOperacoesOSPUsuarioFalhas.Delete
      else
        qryOperacoesOSPUsuarioFalhas.next;
    end;
    qryOperacoesOSPUsuarioFalhas.GotoBookmark(RegistroAtual);
    qryOperacoesOSPUsuarioFalhas.FreeBookmark(RegistroAtual);

  except
  end;
end;

procedure TdtmOperacoesOSP.Percorrer(Campo: Byte; Key: Word;
  Shift: TShiftState);
var Operacao: Byte;
    osp, lote: Integer;
begin
   Operacao := 0;
   with qryOSPLotes do begin
      if ssCtrl in Shift
      then case Key of
             VK_Home:     Operacao:= Primeiro;
             VK_End:      Operacao:= Ultimo;
           end
      else case Key of
             VK_PRIOR:   Operacao:= Anterior;
             VK_next: Operacao:= Proximo;
           end;

{      case Campo of
         cmposp:} case Operacao of
                            Primeiro,
                            Proximo:  qryOSPLotes.MacroByName('Ordenacao').AsString:=
                                                  'ORDER BY osplotes.osp, osplotes.numero LIMIT 1';
                            Anterior,
                            Ultimo:   qryOSPLotes.MacroByName('Ordenacao').AsString:=
                                                  'ORDER BY osplotes.osp DESC, osplotes.numero LIMIT 1';
                   end;
{      end;}

      osp         := qryOSPLotesosp.AsInteger;
      lote        := qryOSPLotesnumero.AsInteger;

      RefazConsulta(qryOSPLotes, [0, 1, 2, 3],
                    [Campo, Operacao, qryOSPLotesosp.AsInteger, qryOSPLotesnumero.asinteger]);

      if qryOSPLotes.RecordCount = 0 then
      begin
          RefazConsulta(qryOSPLotes, [0,1,2,3],
                        [PosicaoAtual, PosicaoAtual, osp,lote]);

         case campo of
         cmposp: case Operacao of
                   Anterior,Primeiro: MensagemAviso('Esta é a 1ª OSP');
                   Proximo, Ultimo  : MensagemAviso('Esta é a última OSP');
                 end;
         cmplote: case Operacao of
                   Anterior,Primeiro: MensagemAviso('Este é o 1º LOTE');
                   Proximo, Ultimo  : MensagemAviso('Este é o último LOTE');
                 end;
         end;

         case campo of
          1 : qryOSPLotesosp.FocusControl;
          2 : qryOSPLotesnumero.FocusControl;
         end;
      end;
  //   EnableControls;
   end;
   qryOSPLotes.Params[0].AsInteger := 0;
   qryOSPLotes.Params[1].AsInteger := 0;
end;


procedure TdtmOperacoesOSP.IncluirOperacoesOSP;

begin
//  TipoLogin := NaoInformado;
{  UsuarioAut := ObterAutorizacao(taLOGIN, 'Registro de operações', 'Gerente ou Operador de Produção', '');

  if Assigned(UsuarioAut) then
  begin

    if UsuarioAut.GerenteProducao then
      TipoLogin := GerenteProducao
    else
      TipoLogin := Operador;}

  if SelecionarUsuarioOperacao then
  begin
    SetarParametrosGrade(nil);
    MarcarOperacaoemAndamento;

    case TipoLogin of
      Operador:
      begin
        SetarSomenteLeitura(true);
        if qryOperacoesOSPUsuariotermino.IsNull and
           (qryOperacoesOSPUsuario.RecordCount<>0) and
           (qryOperacoesOSPUsuariousuario.AsInteger = qryUsuarioscodigo.asinteger) and
           not (qryOperacoesOSPnaobloqueiausuario.AsBoolean) then
        begin
          StatusCadastro := FinalizandoOperacao;
          qryOperacoesOSPUsuario.ReadOnly := false;

          qryOperacoesOSPUsuarioquantidade.ReadOnly := false;
          qryOperacoesOSPUsuario.Edit;
//          qryOperacoesOSPUsuarioquantidade.AsInteger := qryOperacoesOSPSaldoFaltanteProducao.AsInteger;
          if qryOperacoesOSPUsuariodatatermino.IsNull
          then qryOperacoesOSPUsuariodatatermino.Asdatetime := DataServidor;
          if qryOperacoesOSPUsuariotermino.IsNull
          then qryOperacoesOSPUsuariotermino.AsDateTime := strtoDateTime(FormatDateTime('HH:MM',HoraServidor));
//          qryOperacoesOSPUsuariotermino.AsString := FormatDateTime('HH:MM',Now);

          qryOperacoesOSPUsuariousuariotermino.AsInteger := qryUsuarioscodigo.asinteger;
          qryOperacoesOSPUsuariousuariofechamentovalidado.AsBoolean := True;

          qryOperacoesOSPUsuarioFalhas.RequestLive := true; {not (qryOSPLotes.State = dsedit);}

          qryOperacoesOSPUsuariotermino.FocusControl;

          if (qryOperacoesOSPUsuariodata.AsDatetime < qryOperacoesOSPUsuariodatatermino.AsDatetime) or
             ((qryOperacoesOSPUsuarioinicio.AsDateTime <= qryOperacoesOSPUsuariotermino.AsDateTime) and
              (qryOperacoesOSPUsuariodata.Asdatetime = qryOperacoesOSPUsuariodatatermino.AsDateTime)) then
          begin
            if FinalizarOperacao then
            begin
              if Gravardados then
              begin
                if assigned(SelecionarCampoOSP) then
                  SelecionarCampoOSP(self);
                  
                TipoLogin := NaoInformado;
                MarcarOperacaoemAndamento(true);
  //              SelecionarCampoQuantidade(self);
  //              EditarOSP;
                IncluirOperacoesOSP;
              end;
            end
            else
              if assigned(SelecionarCampoOSP) then
                SelecionarCampoOSP(self);
          end
          else
          begin
            qryOperacoesOSPUsuario.Cancel;
            StatusCadastro := Nenhum;
            qryOperacoesOSPUsuario.ReadOnly := true;
            qryOperacoesOSPUsuarioquantidade.ReadOnly := true;
            IncluirOperacoesOSP;
          end;
        end
        else
        begin
          if SelecionarOperacao then
          begin
            if qryListaOperacaoLiberadatipooperacao.AsString = 'FECHAMENTO' then
            begin
              if PosicionarOperacoesOSPUsuarioAguardandoFechamento then
              begin
                StatusCadastro := FinalizandoOperacao;
                qryOperacoesOSPUsuario.ReadOnly := false;
                qryOperacoesOSPUsuarioquantidade.ReadOnly := false;
                qryOperacoesOSPUsuario.Edit;
                //          qryOperacoesOSPUsuarioquantidade.AsInteger := qryOperacoesOSPSaldoFaltanteProducao.AsInteger;
                if qryOperacoesOSPUsuarioDataTermino.IsNull
                then qryOperacoesOSPUsuariodatatermino.Asdatetime := DataServidor;
//                qryOperacoesOSPUsuariotermino.AsString := FormatDateTime('HH:MM',Now);
                if qryOperacoesOSPUsuariotermino.IsNull
                then qryOperacoesOSPUsuariotermino.AsDateTime := strtoDateTime(FormatDateTime('HH:MM',HoraServidor));

//                if qryOperacoesOSPUsuariousuario.AsInteger <> qryUsuarioscodigo.asinteger then
                qryOperacoesOSPUsuariousuariotermino.AsInteger := qryUsuarioscodigo.asinteger;
                qryOperacoesOSPUsuariousuariofechamentovalidado.AsBoolean := True;

                qryOperacoesOSPUsuarioFalhas.RequestLive := true; { not (qryOSPLotes.State = dsedit);}
                qryOperacoesOSPUsuariotermino.FocusControl;
                if FinalizarOperacao then
                begin
                  if Gravardados then
                  begin
                    if assigned(SelecionarCampoOSP) then
                      SelecionarCampoOSP(self);

                    TipoLogin := NaoInformado;
                    MarcarOperacaoemAndamento(true);
                    IncluirOperacoesOSP;
                  end;
                end
                else
                 if assigned(SelecionarCampoOSP) then
                   SelecionarCampoOSP(self);
              end;
            end
            else
            begin
              if (qryOperacoesOSPhabilitadosetup.AsBoolean or not
                  qryOperacoesOSPsetup.AsBoolean) or

                 (not qryOperacoesOSPhabilitadosetup.AsBoolean and
                  qryOperacoesOSPsetup.AsBoolean and selecionarUsuarioSetup) then
              begin
                IniciarOperacao;
                if Gravardados then
                begin
                  if parsistema.Liberaraimpressaodosprocessosnoregistrodeoperacoes then
                    ImprimirProcessos;

                  if assigned(SelecionarCampoOSP) then
                    SelecionarCampoOSP(self);
                    
                  TipoLogin := NaoInformado;
                  MarcarOperacaoemAndamento(true);
                  IncluirOperacoesOSP;
                end;
              end;

            end;
          end
          else
          begin
            if qryListaOperacaoLiberada.RecordCount = 0 then
            begin
              MensagemErro(format('O usuário ''%s'' não está habilitado para a operação ''%s''.',
                             [inttostr(qryUsuarioscodigo.asinteger)+' - '+
                              qryUsuariosnome.asstring,

                              trim(qryOperacoesOSPnome.asstring+ ' '+
                                   qryOperacoesOSPc01.asstring+ ' '+
                                   qryOperacoesOSPc02.asstring+ ' '+
                                   qryOperacoesOSPc03.asstring) ]));
                                   
              if assigned(SelecionarCampoOSP) then
                SelecionarCampoOSP(self);

              IncluirOperacoesOSP;
            end;
          end;
        end;
      end;

      GerenteProducao:
      begin
        SetarSomenteLeitura(false);
        qryOperacoesOSPAfterScroll(nil);
        qryOperacoesOSPUsuarioAfterScroll(nil);
      end;
    end;
  end;
  IncluindoCodigoUsuario := false;
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioAfterInsert(
  DataSet: TDataSet);
var
 v: string;
begin
  inherited;

  case TipoLogin of
    {
    Operador: begin
                if (qryOperacoesOSPoperacaoliberada.AsBoolean and
                    qryOperacoesOSPoperacaoemandamento.AsBoolean) or
                   not qryOperacoesOSPoperacaoliberada.AsBoolean then
                 qryOperacoesOSPUsuario.Cancel;
              end;
    }
    
    GerenteProducao: EditarOSP;
  end;

  qryOperacoesOSPUsuarioFalhas.filtered := true;
  qryOperacoesOSPUsuarioParadas.filtered := true;

//  qryOperacoesOSPUsuarioFalhas.LinkFields := '';
//  qryOperacoesOSPUsuarioFalhas.mastersource := nil;
//  qryOperacoesOSPUsuarioFalhas.LinkOptions := [];

//  qryOperacoesOSPUsuarioFalhas.LinkFields := 'osp=osp,lote=lote,operacao=operacao,usuariorelacao=usuario,datarelacao=data,iniciorelacao=inicio';
//  qryOperacoesOSPUsuarioParadas.mastersource := dsrOperacoesOSPUsuario;
//  qryOperacoesOSPUsuarioFalhas.LinkFields := 'osp=osp,lote=lote,operacao=operacao,usuariorelacao=usuario,datarelacao=data,iniciorelacao=inicio';
//  qryOperacoesOSPUsuarioFalhas.LinkOptions := [loAlwaysResync];


end;

procedure TdtmOperacoesOSP.EditarOSP;
begin
  if not (qryOSPLotes.State in [dsedit, dsinsert]) then
    qryOSPLotes.Edit;
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  case TipoLogin of
    GerenteProducao: EditarOSP;
  end;
  CalcularQuantidades;
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioAfterEdit(
  DataSet: TDataSet);
begin
  inherited;
  case TipoLogin of
    GerenteProducao: EditarOSP;
  end;
end;

procedure TdtmOperacoesOSP.qryOSPLotesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if assigned(SelecionarCampoOSP) then
    SelecionarCampoOSP(nil);

  qryOperacoesOSP.AfterScroll := nil;
  qryOperacoesOSPUsuarioFalhas.AfterScroll := nil;
  RefazConsultaPorNome(qryClientesProdutos,['cliente','tipocliente','produto'],
                        [qryOSPLotescliente.AsVariant,qryOSPLotestipocliente.AsVariant, qryOSPLotesproduto.AsVariant]);

  qryOperacoesOSPUsuarioParadas.Close;
  qryOperacoesOSPUsuarioFalhas.Close;
  qryOperacoesOSPUsuario.Close;
  qryOperacoesOSP.Close;


  RefazConsultaPorNome(qryOperacoesOSP,['osp', 'lote'],[qryOSPLotesosp.Asinteger, qryOSPLotesnumero.Asinteger]);
  if qryOperacoesOSP.IsEmpty then
  begin
    RefazConsultaPorNome(qryFluxoGramasOperacoes,['numero'],[qryOSPLotesosp.Asinteger]);
    if qryFluxoGramasOperacoes.RecordCount <> 0 then
    begin
      qryOperacoesOSP.DisableControls;
      ListaUsuariosTerminoAberto := '0';
      ListaFalhas := '0';
      qryFluxoGramasOperacoes.First;
      while not qryFluxoGramasOperacoes.Eof do
      begin
        qryOperacoesOSP.Append;
        qryOperacoesOSPosp.AsInteger := qryOSPLotesosp.AsVariant;
        qryOperacoesOSPlote.AsInteger := qryOSPLotesnumero.AsVariant;
        qryOperacoesOSPoperacao.AsInteger := qryFluxoGramasOperacoesoperacao.AsVariant;
        qryOperacoesOSPsequencia.AsString := qryFluxoGramasOperacoessequencia.AsString;
        qryOperacoesOSPnome.AsString := qryFluxoGramasOperacoesnome.AsString;
        qryOperacoesOSPc01.AsString := qryFluxoGramasOperacoesc01.AsString;
        qryOperacoesOSPc02.AsString := qryFluxoGramasOperacoesc02.AsString;
        qryOperacoesOSPc03.AsString := qryFluxoGramasOperacoesc03.AsString;
        qryOperacoesOSPtempopadrao.AsFloat := qryFluxoGramasOperacoestempopadrao.AsFloat;
        qryOperacoesOSPtipooperacao.AsString := qryFluxoGramasOperacoestipo.AsString;
        qryOperacoesOSPorigemoperacaoalternativa.AsString := qryFluxoGramasOperacoesorigemoperacaoalternativa.AsString;
        qryOperacoesOSPoperacaoemandamento.AsBoolean := false;
        qryOperacoesOSPoperacaoemandamento_complementar.AsBoolean := false;

        qryOperacoesOSPselecionada.AsBoolean := true {qryFluxoGramasOperacoestipooperacao.AsString = 'N'};
        qryOperacoesOSPsetup.AsBoolean := qryFluxoGramasOperacoessetup.AsBoolean;
        qryOperacoesOSPplanocontrole.AsBoolean := qryFluxoGramasOperacoesplanocontrole.AsBoolean;
        qryOperacoesOSPnaobloqueiausuario.AsBoolean := qryFluxoGramasOperacoesnaobloqueiausuario.AsBoolean;
        qryOperacoesOSPOperacaoemGrupoComAnterior.AsBoolean := qryFluxoGramasOperacoesOperacaoemGrupoComAnterior.AsBoolean;
        qryOperacoesOSPInformarTerminodoProcesso.AsBoolean := qryFluxoGramasOperacoesInformarTerminodoProcesso.AsBoolean;
        qryOperacoesOSPoperacaoconjugada.asboolean := qryFluxoGramasOperacoesoperacaoconjugada.AsBoolean;

        qryOperacoesOSP.Post;

        {
        if qryFluxoGramasOperacoestipooperacao.AsString = 'A' then
        begin
         if qryoperacoesosp.Locate('operacao',qryFluxoGramasOperacoesorigemoperacaoalternativa.AsString,[]) then
         begin
           qryOperacoesOSP.AfterPost := nil;
           qryOperacoesOSP.Edit;
           qryOperacoesOSPtipooperacao.asstring := 'A';
           qryOperacoesOSP.Post;
           qryOperacoesOSP.AfterPost := qryOperacoesOSPAfterPost;
         end;
        end;
        }

        qryFluxoGramasOperacoes.Next;
      end;
      qryOperacoesOSP.EnableControls;
      qryoperacoesosp.First;
    end;
  end;

  RefazConsultaPorNome(qryOperacoesOSPUsuario,
                       ['OSP', 'Lote'],
                       [qryOSPLotesosp.Asinteger, qryOSPLotesnumero.Asinteger]);

  RefazConsultaPorNome(qryOperacoesOSPUsuarioFalhas,
                       ['OSP', 'Lote'],
                       [qryOSPLotesosp.Asinteger, qryOSPLotesnumero.Asinteger]);

  RefazConsultaPorNome(qryOperacoesOSPUsuarioParadas,
                       ['OSP', 'Lote'],
                       [qryOSPLotesosp.Asinteger, qryOSPLotesnumero.Asinteger]);

                       {
  RefazConsultaPorNome(qryMovimentos,
                       ['OSP', 'Lote'],
                       [qryOSPLotesosp.Asinteger, qryOSPLotesnumero.Asinteger]);
                       }

  if DataSet <> nil then
    MarcarOperacaoemAndamento;

  qryOperacoesOSP.AfterScroll := qryOperacoesOSPAfterScroll;
  qryOperacoesOSPAfterScroll(nil);

  qryOperacoesOSPUsuarioFalhas.AfterScroll := qryOperacoesOSPUsuarioFalhasAfterScroll;
  qryOperacoesOSPUsuarioFalhasAfterScroll(nil);

//  dtmOperacoesOSP.TempoAbrirJanela := now();



end;

function TdtmOperacoesOSP.GravarOperacoesOSPUsuarioFalhas: Boolean;
begin
  result := true;
  if (qryOperacoesOSPUsuarioFalhas.State in [dsedit, dsinsert]) then
  begin
    result := qryOperacoesOSPUsuarioFalhas.CheckRequiredFields;
    if result then
      qryOperacoesOSPUsuarioFalhas.Post;
  end;
end;

procedure TdtmOperacoesOSP.IniciarOperacao;
begin
  SelecionarCampoUsuario(self);
  qryOperacoesOSPUsuario.Requestlive := true;
  qryOperacoesOSPUsuariousuario.ReadOnly := true;
  qryOperacoesOSPUsuarioquantidade.ReadOnly := true;
//  qryOperacoesOSPUsuario.AfterInsert := nil;
  qryOperacoesOSPUsuario.append;
  qryOperacoesOSPUsuariousuario.AsInteger := qryUsuarioscodigo.asinteger;

  if qryUsuariosturno.AsInteger <> 0 then
    qryOperacoesOSPUsuarioturno.AsInteger := qryUsuariosturno.AsInteger
  else
    qryOperacoesOSPUsuarioturno.clear;

  if qryOperacoesOSPsetup.AsBoolean then
  begin
    if qryOperacoesOSPhabilitadosetup.AsBoolean then
    begin
      qryOperacoesOSPUsuariousuariosetup.AsInteger := qryUsuarioscodigo.asinteger;
      qryOperacoesOSPUsuarionomeusuariosetup.AsString := qryUsuariosnome.AsString;
    end
    else
    begin
      qryOperacoesOSPUsuariousuariosetup.AsInteger := qryUsuariosHabilitadosSetupusuario.asinteger;
      qryOperacoesOSPUsuarionomeusuariosetup.AsString := qryUsuariosHabilitadosSetupnome.asString;
    end;
  end;

  qryOperacoesOSPUsuarionome.AsString := qryUsuariosnome.asstring;
  qryOperacoesOSPUsuariousuariovalidado.AsBoolean := true;
  qryOperacoesOSPUsuariousuariosetupvalidado.AsBoolean := true;

  if qryListaOperacaoMaquinaLiberada.RecordCount >= 1 then
  begin
    qryOperacoesOSPUsuariomaquina.AsInteger := qryListaOperacaoMaquinaLiberadamaquina.AsInteger;
    qryOperacoesOSPUsuariodescricaomaquina.AsString := qryListaOperacaoMaquinaLiberadadescricaomaquina.AsString;
  end
  else
  begin
    qryOperacoesOSPUsuariomaquina.clear;
    qryOperacoesOSPUsuariodescricaomaquina.clear;
  end;

//  qryOperacoesOSPUsuario.AfterInsert := qryOperacoesOSPUsuarioAfterInsert;
  EditarOSP;
end;

procedure TdtmOperacoesOSP.qryOSPLotesBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if qryOSPLotes.ParamByName('campo').IsNull then
    qryOSPLotes.ParamByName('campo').AsInteger := 0;

  if qryOSPLotes.ParamByName('operacao').IsNull then
    qryOSPLotes.ParamByName('operacao').AsInteger := 0;

end;

procedure TdtmOperacoesOSP.SetarSomenteLeitura(Valor: boolean);
begin
  if SenhadoGerenteFixada then
  begin
    qryOperacoesOSPUsuariousuario.ReadOnly               := false;
    qryOperacoesOSPUsuariodata.ReadOnly                  := false;
    qryOperacoesOSPUsuarioinicio.ReadOnly                := false;
    qryOperacoesOSPUsuariodatatermino.ReadOnly           := false;
    qryOperacoesOSPUsuariotermino.ReadOnly               := false;
    qryOperacoesOSPUsuarioquantidade.ReadOnly            := false;
  end
  else
  begin
    qryOperacoesOSPUsuariousuario.ReadOnly               := valor;
    qryOperacoesOSPUsuariodata.ReadOnly                  := valor;
    qryOperacoesOSPUsuarioinicio.ReadOnly                := valor;
    qryOperacoesOSPUsuariodatatermino.ReadOnly           := valor;
    qryOperacoesOSPUsuariotermino.ReadOnly               := valor;
    qryOperacoesOSPUsuarioquantidade.ReadOnly            := valor;
  //  qryOperacoesOSPUsuarioFalhasfalha.ReadOnly           := valor;
  //  qryOperacoesOSPUsuarioFalhasquantidadeperda.ReadOnly := valor;
  end;
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioBeforePost(
  DataSet: TDataSet);
var
  NRegistros: integer;

begin
  inherited;

  qryOperacoesOSPUsuarioFalhas.First;
  NRegistros := 0;
  while not qryOperacoesOSPUsuarioFalhas.Eof do
  begin
    NRegistros := qryOperacoesOSPUsuarioFalhas.RecordCount;

    qryOperacoesOSPUsuarioFalhas.AfterPost := nil;
    qryOperacoesOSPUsuarioFalhas.Edit;
    qryOperacoesOSPUsuarioFalhasusuario.AsInteger := qryOperacoesOSPUsuariousuario.AsInteger;
    qryOperacoesOSPUsuarioFalhasdata.AsDateTime := qryOperacoesOSPUsuariodata.AsDateTime;
    qryOperacoesOSPUsuarioFalhasinicio.AsString := qryOperacoesOSPUsuarioinicio.AsString;
    qryOperacoesOSPUsuarioFalhas.Post;
    qryOperacoesOSPUsuarioFalhas.AfterPost := qryOperacoesOSPUsuarioFalhasAfterPost;

    if NRegistros = qryOperacoesOSPUsuarioFalhas.RecordCount then
      qryOperacoesOSPUsuarioFalhas.Next;
  end;


  qryOperacoesOSPUsuarioParadas.First;
  NRegistros := 0;
  while not qryOperacoesOSPUsuarioParadas.Eof do
  begin
    NRegistros := qryOperacoesOSPUsuarioParadas.RecordCount;

    qryOperacoesOSPUsuarioParadas.AfterPost := nil;
    qryOperacoesOSPUsuarioParadas.Edit;
    qryOperacoesOSPUsuarioParadasusuario.AsInteger := qryOperacoesOSPUsuariousuario.AsInteger;
    qryOperacoesOSPUsuarioParadasdata.AsDateTime := qryOperacoesOSPUsuariodata.AsDateTime;
    qryOperacoesOSPUsuarioParadasinicio.AsString := qryOperacoesOSPUsuarioinicio.AsString;
    qryOperacoesOSPUsuarioParadas.Post;
    qryOperacoesOSPUsuarioParadas.AfterPost := qryOperacoesOSPUsuarioParadasAfterPost;

    if NRegistros = qryOperacoesOSPUsuarioParadas.RecordCount then
      qryOperacoesOSPUsuarioParadas.Next;
  end;


  if not qryOperacoesOSPnaobloqueiausuario.asboolean and
     not qryoperacoesospUsuariousuariotermino.isnull and
     (qryoperacoesospUsuariousuariotermino.asinteger <> qryOperacoesOSPUsuariousuario.asinteger) then
  begin
    MensagemErro('O usuário de fechamento só pode ser diferente do usuário da abertura para operações que não bloqueiam o usuário.');
    if qryoperacoesospUsuariousuario.asinteger <> 0 then
      qryoperacoesospUsuariousuariotermino.asinteger :=  qryoperacoesospUsuariousuario.asinteger
    else
      qryoperacoesospUsuariousuariotermino.clear;
  end;


  {
  if qryOperacoesOSPUsuariousuariorelacao.isnull then
    qryOperacoesOSPUsuariousuariorelacao.AsVariant := qryOperacoesOSPUsuariousuario.AsVariant;

  if qryOperacoesOSPUsuariodatarelacao.IsNull then
    qryOperacoesOSPUsuariodatarelacao.AsVariant := qryOperacoesOSPUsuariodata.AsVariant;

  if qryOperacoesOSPUsuarioiniciorelacao.IsNull then
    qryOperacoesOSPUsuarioiniciorelacao.AsVariant := qryOperacoesOSPUsuarioinicio.AsVariant;

}
end;


procedure TdtmOperacoesOSP.MarcarOperacaoemAndamento(NaoPosicionar: Boolean = false);
var
  vOperacaoOSPAnteriorSemRegistrodeUsuario,
  vOperacaoOSPUsuarioAnterioremAberto,
  vExisteOperacaoOSPAnteriorFechada,
  vExisteOperacaoOSPAnterioremAberto,
  vVerificarCondicoes, vProsseguir, vCondicaoGrupo: Boolean;

  vTipoSequenciaAnterior,
  vProximaOperacaoAnterior: String;

  RegistroAtualUsuario : TBookMark;
  RegistroAtualOperacao: TBookMark;



  procedure SetarOperacaoemAndamento;
  begin

    if TipoLogin = operador then
    begin
      if qryOperacoesOSPoperacaoemandamento.AsBoolean and
         qryOperacoesOSPoperacaoliberada.AsBoolean then
      begin

        if {qryOperacoesOSPnaobloqueiausuario.AsBoolean and}
           PosicionarOperacoesOSPUsuarioAguardandoFechamento then
        begin
          qryListaOperacaoLiberada.Append;

          qryListaOperacaoLiberadasequencia.AsInteger := qryListaOperacaoLiberada.RecordCount + 1;
          qryListaOperacaoLiberadaoperacao.AsInteger := qryOperacoesOSPoperacao.AsInteger;
          qryListaOperacaoLiberadanome.AsString := qryOperacoesOSPnome.AsString;
          qryListaOperacaoLiberadac1.AsString := qryOperacoesOSPc01.AsString;
          qryListaOperacaoLiberadac2.AsString := qryOperacoesOSPc02.AsString;
          qryListaOperacaoLiberadac3.AsString := qryOperacoesOSPc03.AsString;
          qryListaOperacaoLiberadatipooperacao.AsString := 'FECHAMENTO';
          qryListaOperacaoLiberada.post;

          if qryOperacoesOSPUsuariomaquina.AsInteger<>0 then
          begin
            qryListaOperacaoMaquinaUtilizada.append;
            qryListaOperacaoMaquinaUtilizadaoperacao.AsInteger := qryOperacoesOSPUsuariooperacao.asinteger;
            qryListaOperacaoMaquinaUtilizadamaquina.asinteger := qryOperacoesOSPUsuariomaquina.asinteger;
            qryListaOperacaoMaquinaUtilizadadescricaomaquina.AsString := qryOperacoesOSPUsuariodescricaomaquina.AsString;
            qryListaOperacaoMaquinaUtilizadaosp.AsInteger := qryOperacoesOSPUsuarioosp.AsInteger;
            qryListaOperacaoMaquinaUtilizadausuario.AsInteger := qryOperacoesOSPUsuariousuario.AsInteger;
            qryListaOperacaoMaquinaUtilizada.post;
          end;

        end
        else
        begin
          if (qryOperacoesOSPSaldoFaltanteProducao.AsInteger <> 0) or
             ((qryOperacoesOSPtipooperacao.AsString[2] = 'G') and
              qryOperacoesOSPOperacaoemGrupoComAnterior.AsBoolean) then
          begin
            qryListaOperacaoLiberada.Append;
            qryListaOperacaoLiberadasequencia.AsInteger := qryListaOperacaoLiberada.RecordCount + 1;
            qryListaOperacaoLiberadaoperacao.AsInteger := qryOperacoesOSPoperacao.AsInteger;
            qryListaOperacaoLiberadanome.AsString := qryOperacoesOSPnome.AsString;
            qryListaOperacaoLiberadac1.AsString := qryOperacoesOSPc01.AsString;
            qryListaOperacaoLiberadac2.AsString := qryOperacoesOSPc02.AsString;
            qryListaOperacaoLiberadac3.AsString := qryOperacoesOSPc03.AsString;
            qryListaOperacaoLiberadatipooperacao.AsString := 'ABERTURA';
            qryListaOperacaoLiberadanaobloqueiausuario.asboolean := qryOperacoesOSPnaobloqueiausuario.asboolean;
            qryListaOperacaoLiberada.post;

            RefazConsultaPorNome(qryOperacoesMaquinas, ['operacao'], [qryOperacoesOSPoperacao.AsInteger]);

            qryOperacoesMaquinas.First;
            while not qryOperacoesMaquinas.eof do
            begin
              if qryOperacoesMaquinassituacao.AsString = 'DISPONÍVEL' then
              begin
                qryListaOperacaoMaquinaLiberada.append;
                qryListaOperacaoMaquinaLiberadaoperacao.AsInteger := qryOperacoesMaquinasoperacao.asinteger;
                qryListaOperacaoMaquinaLiberadamaquina.asinteger := qryOperacoesMaquinasmaquina.asinteger;
                qryListaOperacaoMaquinaLiberadadescricaomaquina.asString := qryOperacoesMaquinasdescricaomaquina.asString;
                qryListaOperacaoMaquinaLiberadanaobloqueiausuario.asboolean := qryOperacoesMaquinasnaobloqueiausuario.asboolean;
                qryListaOperacaoMaquinaLiberada.post;
              end
              else
              begin
                if qryOperacoesMaquinassituacao.AsString = 'EM USO' then
                begin
                  qryListaOperacaoMaquinaUtilizada.append;
                  qryListaOperacaoMaquinaUtilizadaoperacao.AsInteger := qryOperacoesMaquinasoperacao.asinteger;
                  qryListaOperacaoMaquinaUtilizadamaquina.asinteger := qryOperacoesMaquinasmaquina.asinteger;
                  qryListaOperacaoMaquinaUtilizadadescricaomaquina.asString := qryOperacoesMaquinasdescricaomaquina.asString;
                  qryListaOperacaoMaquinaUtilizadaosp.AsInteger := qryOperacoesMaquinasosp.AsInteger;
                  qryListaOperacaoMaquinaUtilizadalote.AsInteger := qryOperacoesMaquinaslote.AsInteger;
                  qryListaOperacaoMaquinaUtilizadausuario.AsInteger := qryOperacoesMaquinasusuario.AsInteger;
                  qryListaOperacaoMaquinaUtilizadanomeusuario.AsString := qryOperacoesMaquinasnomeusuario.AsString;
                  qryListaOperacaoMaquinaUtilizada.post;
                end
                else
                begin
                {
                  qryListaOperacaoMaquinaBloqueada.append;
                  qryListaOperacaoMaquinaBloqueadaoperacao.AsInteger := qryOperacoesMaquinasoperacao.asinteger;
                  qryListaOperacaoMaquinaBloqueadamaquina.asinteger := qryOperacoesMaquinasmaquina.asinteger;
                  qryListaOperacaoMaquinaBloqueadadescricaomaquina.asString := qryOperacoesMaquinasdescricaomaquina.asString;
                  qryListaOperacaoMaquinaBloqueadaosp.AsInteger := qryOperacoesMaquinasosp.AsInteger;
                  qryListaOperacaoMaquinaBloqueadalote.AsInteger := qryOperacoesMaquinaslote.AsInteger;

                  qryListaOperacaoMaquinaBloqueadausuario.AsInteger := qryOperacoesMaquinasusuario.AsInteger;
                  qryListaOperacaoMaquinaBloqueadanomeusuario.AsString := qryOperacoesMaquinasnomeusuario.AsString;

                  qryListaOperacaoMaquinaBloqueadacodigoparada.asinteger :=  qryOperacoesMaquinascodigoparada.asinteger;
                  qryListaOperacaoMaquinaBloqueadadescricaoparada.asstring := qryOperacoesMaquinasdescricaoparada.asstring;

                  qryListaOperacaoMaquinaBloqueada.post;
                 }
                end;
              end;
              qryOperacoesMaquinas.next;
            end;

            qryListaOperacaoLiberada.First;
            qryListaOperacaoMaquinaLiberada.First;
            qryListaOperacaoMaquinaUtilizada.First;
//            qryListaOperacaoMaquinaBloqueada.First;

          end;
        end;
      end;
    end;

  end;


  procedure desmarcaroperacoes;
  begin
    {Desmarcar as operações em andamento e liberadas}
    qryOperacoesOSP.AfterPost := nil;
    qryOperacoesOSP.First;
    while not qryOperacoesOSP.Eof do
    begin
      if qryOperacoesOSPoperacaoemandamento.AsBoolean then
      begin
        qryOperacoesOSP.Edit;
        qryOperacoesOSPoperacaoemandamento.AsBoolean := false;
        qryOperacoesOSP.Post;
      end;

      if qryOperacoesOSPoperacaoliberada.AsBoolean then
      begin
        qryOperacoesOSP.Edit;
        qryOperacoesOSPoperacaoliberada.AsBoolean := false;
        qryOperacoesOSPhabilitadosetup.AsBoolean := false;
        qryOperacoesOSP.Post;
      end;

      qryOperacoesOSP.Next;
    end;
    qryOperacoesOSP.AfterPost := qryOperacoesOSPAfterPost;
  end;

  procedure CalcularLimiteQuantidade;
  var
   vEncontrouaPrimeira : Boolean;
   vQuantidadeLimiteAnterior,
   vProduzidaAnterior,
   vProduzidaAnteriorAlternativa,
   vProduzidaAnteriorComplementarOrigem,
   vOrigemOperacaoComplementar : integer;

   vSequenciaOrigemOperacaoComplementar,
   vsequenciaorigem : String;

   vOperacao : integer;
   vOperacaoOrigemAlternativa : integer;
   vQuantidadeProduzidaNasAlternativas : integer;
   vTipoUltimaOperacao : String;

  begin
    qryOperacoesOSP.AfterPost := nil;
    qryOperacoesOSP.First;
    vEncontrouaPrimeira := false;

    vProduzidaAnteriorAlternativa := 0;
    while not qryOperacoesOSP.Eof do
    begin
      vQuantidadeProduzidaNasAlternativas := 0;
      if qryOperacoesOSPselecionada.AsBoolean then
      begin
        {Encontrou uma origem da alternativa}
        if qryOperacoesOSPorigemoperacaoalternativa.IsNull and
           ((qryOperacoesOSPtipooperacao.AsString[1] = 'A') or
            (qryOperacoesOSPtipooperacao.AsString[1] = 'D'))  then
        begin

          if (vTipoUltimaOperacao = 'A') or (vTipoUltimaOperacao = 'D')  then
          begin
            vProduzidaAnterior := vProduzidaAnteriorAlternativa;
            vProduzidaAnteriorAlternativa := 0;
          end;

          vTipoUltimaOperacao := qryOperacoesOSPtipooperacao.AsString[1];
          {encontrar a quantidade produzida nas alternativas para achar o limite }
          vOperacao := qryOperacoesOSPoperacao.AsInteger;
          if qryoperacoesosp.Locate('origemoperacaoalternativa',vOperacao,[]) then
          begin
            while (qryOperacoesOSPorigemoperacaoalternativa.AsInteger = vOperacao) and
                  not qryOperacoesOSP.Eof do
            begin
              vQuantidadeProduzidaNasAlternativas :=  vQuantidadeProduzidaNasAlternativas + qryOperacoesOSPquantidade.AsInteger {+ qryOperacoesOSPquantidadecomperda.AsInteger};
              qryOperacoesOSP.Next;
            end;
          end;

          if qryOperacoesOSP.locate('operacao',vOperacao,[]) then
          begin
            if not vEncontrouaPrimeira then
            begin
              qryOperacoesOSP.Edit;
              qryOperacoesOSPheaprimeiraoperacao.AsBoolean := true;
              qryOperacoesOSPquantidadelimite.AsInteger   := qryOSPLotesquantidadelote.AsInteger + qryOSPLotesexcedentelote.AsInteger;
              qryOperacoesOSPquantidadeanterior.AsInteger := qryOSPLotesquantidadelote.AsInteger + qryOSPLotesexcedentelote.AsInteger;
              qryOperacoesOSPquantidadenasalternativas.AsInteger := vQuantidadeProduzidaNasAlternativas;
              qryOperacoesOSP.Post;
              vEncontrouaPrimeira := true;

              vProduzidaAnterior := qryOperacoesOSPquantidade.AsInteger;

              if (qryOperacoesOSPquantidade.AsInteger > qryOperacoesOSPquantidadelimite.AsInteger) or qryOperacoesOSPfechamentoforcado.asboolean then
                vQuantidadeLimiteAnterior := qryOperacoesOSPquantidade.AsInteger
              else
                vQuantidadeLimiteAnterior := qryOperacoesOSPquantidadelimite.AsInteger - qryOperacoesOSPquantidadecomperda.AsInteger;
            end
            else
            begin


              qryOperacoesOSP.Edit;
              qryOperacoesOSPheaprimeiraoperacao.AsBoolean := false;
              qryOperacoesOSPquantidadelimite.AsInteger := vQuantidadeLimiteAnterior;
              qryOperacoesOSPquantidadeanterior.AsInteger := vProduzidaAnterior;
              qryOperacoesOSPquantidadenasalternativas.AsInteger := vQuantidadeProduzidaNasAlternativas;
              qryOperacoesOSP.Post;

            end;
            vProduzidaAnteriorAlternativa := qryOperacoesOSPquantidade.AsInteger {+ qryOperacoesOSPquantidadecomperda.AsInteger} + qryOperacoesOSPquantidadenasalternativas.AsInteger;
          end;

        end
        else
        if  not qryOperacoesOSPorigemoperacaoalternativa.IsNull and
           ((qryOperacoesOSPtipooperacao.AsString[1] = 'A') or
            (qryOperacoesOSPtipooperacao.AsString[1] = 'D')) then
        begin
          vOperacao := qryOperacoesOSPoperacao.AsInteger;
          vOperacaoOrigemAlternativa := qryOperacoesOSPorigemoperacaoalternativa.AsInteger;

          vTipoUltimaOperacao := qryOperacoesOSPtipooperacao.AsString[1];

          if qryoperacoesosp.Locate('operacao', vOperacaoOrigemAlternativa,[]) then
          begin
            vQuantidadeProduzidaNasAlternativas :=  vQuantidadeProduzidaNasAlternativas + qryOperacoesOSPquantidade.AsInteger + qryOperacoesOSPquantidadecomperda.AsInteger;
            qryoperacoesosp.Next;
            while (qryOperacoesOSPorigemoperacaoalternativa.AsInteger = vOperacaoOrigemAlternativa) and
                  not qryOperacoesOSP.Eof do
            begin
              if vOperacao <> qryOperacoesOSPoperacao.AsInteger then
                vQuantidadeProduzidaNasAlternativas :=  vQuantidadeProduzidaNasAlternativas + qryOperacoesOSPquantidade.AsInteger;
              qryOperacoesOSP.Next;
            end;

            if qryOperacoesOSP.locate('operacao',vOperacao,[]) then
            begin

              if not vEncontrouaPrimeira then
              begin
                qryOperacoesOSP.Edit;
                qryOperacoesOSPheaprimeiraoperacao.AsBoolean := true;
                qryOperacoesOSPquantidadelimite.AsInteger   := qryOSPLotesquantidadelote.AsInteger + qryOSPLotesexcedentelote.AsInteger;
                qryOperacoesOSPquantidadeanterior.AsInteger := qryOSPLotesquantidadelote.AsInteger + qryOSPLotesexcedentelote.AsInteger { - qryOperacoesOSPquantidadecomperda.AsInteger};
                qryOperacoesOSPquantidadenasalternativas.AsInteger := vQuantidadeProduzidaNasAlternativas;
                qryOperacoesOSP.Post;
                vEncontrouaPrimeira := true;
                vProduzidaAnterior := qryOperacoesOSPquantidade.AsInteger + qryOperacoesOSPquantidadecomperda.AsInteger;
                vQuantidadeLimiteAnterior := qryOperacoesOSPquantidadelimite.AsInteger;
              end
              else
              begin
                qryOperacoesOSP.Edit;
                qryOperacoesOSPheaprimeiraoperacao.AsBoolean := false;
                qryOperacoesOSPquantidadelimite.AsInteger := vQuantidadeLimiteAnterior;
                qryOperacoesOSPquantidadeanterior.AsInteger := vProduzidaAnterior;
                qryOperacoesOSPquantidadenasalternativas.AsInteger := vQuantidadeProduzidaNasAlternativas;
                qryOperacoesOSP.Post;
              end;
              vProduzidaAnteriorAlternativa := qryOperacoesOSPquantidade.AsInteger + qryOperacoesOSPquantidadecomperda.AsInteger + qryOperacoesOSPquantidadenasalternativas.AsInteger;
            end;
          end;

        end
        else
        begin
          if not vEncontrouaPrimeira then
          begin
            qryOperacoesOSP.Edit;
            qryOperacoesOSPheaprimeiraoperacao.AsBoolean := true;
            qryOperacoesOSPquantidadelimite.AsInteger   := qryOSPLotesquantidadelote.AsInteger + qryOSPLotesexcedentelote.AsInteger;
            qryOperacoesOSPquantidadeanterior.AsInteger := qryOSPLotesquantidadelote.AsInteger + qryOSPLotesexcedentelote.AsInteger;
            vEncontrouaPrimeira := true;
            vProduzidaAnterior := qryOperacoesOSPquantidade.AsInteger;
            vTipoUltimaOperacao := qryOperacoesOSPtipooperacao.AsString[1];


            if qryOperacoesOSPfechamentoforcado.asboolean then
            begin
              vQuantidadeLimiteAnterior := qryOperacoesOSPquantidade.AsInteger;
              qryOperacoesOSPquantidadelimite.AsInteger := qryOperacoesOSPquantidade.AsInteger + qryOperacoesOSPquantidadecomperda.AsInteger;
              qryOperacoesOSPquantidadeanterior.AsInteger := qryOperacoesOSPquantidade.AsInteger + qryOperacoesOSPquantidadecomperda.AsInteger;
            end
            else
            begin
              if (qryOperacoesOSPquantidade.AsInteger > qryOperacoesOSPquantidadelimite.AsInteger) or qryOperacoesOSPfechamentoforcado.asboolean then
                vQuantidadeLimiteAnterior := qryOperacoesOSPquantidade.AsInteger
              else
                vQuantidadeLimiteAnterior := qryOperacoesOSPquantidadelimite.AsInteger - qryOperacoesOSPquantidadeComPerda.AsInteger; {ok1}
            end;

            vProduzidaAnteriorAlternativa := 0;
            qryOperacoesOSP.Post;

          end
          else
          begin

            qryOperacoesOSP.Edit;
            qryOperacoesOSPheaprimeiraoperacao.AsBoolean := false;
            qryOperacoesOSPquantidadelimite.AsInteger := vQuantidadeLimiteAnterior;
            if (vTipoUltimaOperacao = 'A') or (vTipoUltimaOperacao = 'D')  then
            begin
              vProduzidaAnterior := vProduzidaAnteriorAlternativa;
              vProduzidaAnteriorAlternativa := 0;
            end;
            qryOperacoesOSPquantidadeanterior.AsInteger := vProduzidaAnterior;

            vProduzidaAnterior := qryOperacoesOSPquantidade.AsInteger;
            vTipoUltimaOperacao := qryOperacoesOSPtipooperacao.AsString[1];

            if qryOperacoesOSPfechamentoforcado.asboolean then
            begin
              vQuantidadeLimiteAnterior := qryOperacoesOSPquantidade.AsInteger;
              qryOperacoesOSPquantidadelimite.AsInteger := qryOperacoesOSPquantidade.AsInteger + qryOperacoesOSPquantidadecomperda.AsInteger;
              qryOperacoesOSPquantidadeanterior.AsInteger := qryOperacoesOSPquantidade.AsInteger + qryOperacoesOSPquantidadecomperda.AsInteger;
            end
            else
            if (qryOperacoesOSPquantidade.AsInteger + qryOperacoesOSPquantidadecomperda.AsInteger) > qryOperacoesOSPquantidadelimite.AsInteger  then
            begin
              vQuantidadeLimiteAnterior := qryOperacoesOSPquantidade.AsInteger;
              qryOperacoesOSPquantidadelimite.AsInteger := qryOperacoesOSPquantidade.AsInteger + qryOperacoesOSPquantidadecomperda.AsInteger;
            end
            else
              vQuantidadeLimiteAnterior := vQuantidadeLimiteAnterior - qryOperacoesOSPquantidadecomperda.AsInteger;

            if (qryOperacoesOSPquantidade.AsInteger + qryOperacoesOSPquantidadecomperda.AsInteger) > qryOperacoesOSPquantidadeanterior.AsInteger then
               qryOperacoesOSPquantidadeanterior.AsInteger := (qryOperacoesOSPquantidade.AsInteger + qryOperacoesOSPquantidadecomperda.AsInteger);

            qryOperacoesOSP.Post;

          end;
        end;

{        vQuantidadeLimiteAnterior := vQuantidadeLimiteAnterior - qryOperacoesOSPquantidadecomperda.AsInteger;}

      end;
      qryOperacoesOSP.Next;

    end;
    qryOperacoesOSP.AfterPost := qryOperacoesOSPAfterPost;
  end;


  procedure SetarOperacaoLiberada;
  begin
    qryOperacoesOSP.AfterPost := nil;
    case  TipoLogin of
      operador:
      begin
        RefazConsultaPorNome(qryUsuarioOperacoesProducao,
                             ['operacao','usuario','osp'],
                             [qryOperacoesOSPoperacao.AsVariant,
                              qryUsuarioscodigo.asinteger,
                              qryOperacoesOSPosp.AsInteger
                              ]);

        if qryUsuarioOperacoesProducao.RecordCount<>0 then
        begin
          if not qryOperacoesOSPoperacaoliberada.AsBoolean then
          begin
            qryOperacoesOSP.Edit;
            qryOperacoesOSPoperacaoliberada.AsBoolean := true;
            qryOperacoesOSPusuariopossuitodasoperacoesconjugadas.asboolean := qryUsuarioOperacoesProducaohabilitadotodasconjugadas.asboolean;
            qryOperacoesOSPhabilitadosetup.AsBoolean := qryUsuarioOperacoesProducaohabilitadosetup.AsBoolean;
//            qryOperacoesOSPhabilitadosetup.AsBoolean := qryUsuarioOperacoesProducaohabilitadosetup.AsBoolean;

            qryOperacoesOSP.Post;
          end;
        end
        else
        begin
          if qryOperacoesOSPoperacaoliberada.AsBoolean then
          begin
            qryOperacoesOSP.Edit;
            qryOperacoesOSPoperacaoliberada.AsBoolean := false;
            qryOperacoesOSPhabilitadosetup.AsBoolean := false;
            qryOperacoesOSP.Post;
          end;
        end;

      end;

      GerenteProducao:
      begin
        if not qryOperacoesOSPoperacaoliberada.AsBoolean then
        begin
          qryOperacoesOSP.Edit;
          qryOperacoesOSPoperacaoliberada.AsBoolean := true;
          qryOperacoesOSPhabilitadosetup.AsBoolean := true;
          qryOperacoesOSP.Post;
        end;
      end;

      NaoInformado:
      begin
        if qryOperacoesOSPoperacaoliberada.AsBoolean then
        begin
          qryOperacoesOSP.Edit;
          qryOperacoesOSPoperacaoliberada.AsBoolean := false;
          qryOperacoesOSPhabilitadosetup.AsBoolean := false;
          qryOperacoesOSP.Post;
        end;
      end;
    end;
    qryOperacoesOSP.AfterPost := qryOperacoesOSPAfterPost;
  end;

begin

  qryOperacoesOSP.AfterScroll := nil;
  qryOperacoesOSPUsuarioFalhas.AfterScroll := nil;

  vOperacaoOSPAnteriorSemRegistrodeUsuario := false;
  vOperacaoOSPUsuarioAnterioremAberto := false;
  vExisteOperacaoOSPAnteriorFechada := false;
  vExisteOperacaoOSPAnterioremAberto := false;
  vVerificarCondicoes := false;

  qryListaOperacaoLiberada.Close;
  qryListaOperacaoLiberada.open;
  qryListaOperacaoLiberada.delete;

  qryListaOperacaoMaquinaLiberada.Close;
  qryListaOperacaoMaquinaLiberada.open;
  qryListaOperacaoMaquinaLiberada.delete;

  qryListaOperacaoMaquinaUtilizada.Close;
  qryListaOperacaoMaquinaUtilizada.open;
  qryListaOperacaoMaquinaUtilizada.delete;

{  qryListaOperacaoMaquinaBloqueada.Close;
  qryListaOperacaoMaquinaBloqueada.open;
  qryListaOperacaoMaquinaBloqueada.delete;}

  RegistroAtualOperacao := qryOperacoesOSP.GetBookmark;
  RegistroAtualUsuario := qryOperacoesOSPUsuario.GetBookmark;

  desmarcaroperacoes;

  CalcularLimiteQuantidade;

  qryOperacoesOSP.First;
  while not qryOperacoesOSP.Eof do
  begin
    SetarOperacaoLiberada;
    qryOperacoesOSP.next;
  end;

  vCondicaoGrupo := false;
  qryOperacoesOSP.First;
  while not qryOperacoesOSP.Eof do
  begin
    qryOperacoesOSP.AfterPost := nil;

    qryOperacoesOSP.Edit;
    if qryOperacoesOSPfechamentoforcado.AsBoolean then
      qryOperacoesOSPoperacaoemandamento.AsBoolean := false
    else
    if ((qryOperacoesOSPSaldoFaltanteProducao.AsInteger = 0) and
        ((qryOperacoesOSPtipooperacao.AsString[1]='A') or
         (qryOperacoesOSPtipooperacao.AsString[1]='D')) and
         (qryOperacoesOSPtipooperacao.AsString[2] <> 'G') ) then
      qryOperacoesOSPoperacaoemandamento.AsBoolean := false
    else

      qryOperacoesOSPoperacaoemandamento.AsBoolean := (qryOperacoesOSPSaldoFaltanteProducao.AsInteger > 0) or
                                                      (qryOperacoesOSPOperacaoemGrupoComAnterior.AsBoolean and VCondicaoGrupo);


    qryOperacoesOSP.Post;
    qryOperacoesOSP.AfterPost := qryOperacoesOSPAfterPost;

    if qryOperacoesOSPtipooperacao.AsString[2] = 'g' then
      vCondicaoGrupo := (qryOperacoesOSPtipooperacao.AsString[2] = 'g') and
                        (qryOperacoesOSPUsuario.RecordCount<>0)
    else
    if qryOperacoesOSPtipooperacao.AsString[2] = 'G' then
      vCondicaoGrupo := qryOperacoesOSPoperacaoemandamento.AsBoolean;

    case tipologin of
      Operador:
      begin
        SetarOperacaoemAndamento;
        if (qryOperacoesOSPUsuariotermino.IsNull) and
           (qryOperacoesOSPUsuariousuario.AsInteger = qryUsuarioscodigo.asinteger) and
           not qryOperacoesOSPnaobloqueiausuario.AsBoolean then
          break;
      end;
    end;

    if ((qryOperacoesOSPquantidade.AsInteger <> 0) or
        (qryOperacoesOSPquantidadenasalternativas.AsInteger <> 0)) then
      qryOperacoesOSP.next
    else
    if ((qryOperacoesOSPquantidade.AsInteger = 0) and
        (qryOperacoesOSPquantidadenasalternativas.AsInteger = 0) and
        (qryOperacoesOSPtipooperacao.AsString[1] = 'N') and
         ((qryOperacoesOSPtipooperacao.AsString[2] <> 'G') and
          (qryOperacoesOSPtipooperacao.AsString[2] <> 'g') )) then
      break
    else
      qryOperacoesOSP.next;


    (*
    if not vVerificarCondicoes then
    begin
      vVerificarCondicoes := true;
      vProsseguir := true;
    end
    else
    begin
      if vOperacaoOSPAnteriorSemRegistrodeUsuario then
        vProsseguir := false
      else
      case tipologin of
      Operador:
        begin
          if vOperacaoOSPUsuarioAnterioremAberto then {Considerar 1. esta}
            vProsseguir := false
          else
          if vExisteOperacaoOSPAnteriorFechada then
          begin
            vProsseguir := true;
            vExisteOperacaoOSPAnteriorFechada := false;
          end
          else
          if vExisteOperacaoOSPAnterioremAberto then
          begin
            vProsseguir := false;
            qryOperacoesOSP.Prior;
          end
        end;
      NaoInformado, GerenteProducao:
        begin
          if vExisteOperacaoOSPAnteriorFechada then   {Considerar 1. esta}
          begin
            vProsseguir := true;
            vExisteOperacaoOSPAnteriorFechada := false;
          end
          else
          if vExisteOperacaoOSPAnterioremAberto then
          begin
            vProsseguir := false;
            qryOperacoesOSP.Prior;
          end;
        end;
      end;
    end;


    if vProsseguir then
    begin

      vProsseguir := false;
      SetarOperacaoemAndamento;

      qryOperacoesOSPUsuario.First;
      if qryOperacoesOSPUsuario.IsEmpty then
        vOperacaoOSPAnteriorSemRegistrodeUsuario := true
      else
      begin
        case TipoLogin of
          Operador:
          begin
            while not qryOperacoesOSPUsuario.Eof do
            begin
              if  (qryOperacoesOSPUsuariotermino.IsNull) and
                 (qryOperacoesOSPUsuariousuario.AsInteger = qryUsuarioscodigo.asinteger) and
                 not qryOperacoesOSPnaobloqueiausuario.AsBoolean then
              begin
                vOperacaoOSPUsuarioAnterioremAberto := true;
                break;
              end
              else
              if not qryOperacoesOSPUsuariotermino.IsNull and
                 not vExisteOperacaoOSPAnteriorFechada then
                vExisteOperacaoOSPAnteriorFechada := true
              else
              if qryOperacoesOSPUsuariotermino.IsNull and
                  not vExisteOperacaoOSPAnterioremAberto then
                vExisteOperacaoOSPAnterioremAberto := true;

              qryOperacoesOSPUsuario.Next;
            end;
          end;

          NaoInformado, GerenteProducao:
          begin
            while not qryOperacoesOSPUsuario.Eof do
            begin
              if (qryOperacoesOSPUsuariotermino.IsNull) and
                 not vExisteOperacaoOSPAnterioremAberto then
                vExisteOperacaoOSPAnterioremAberto := true
              else
              if not qryOperacoesOSPUsuariotermino.IsNull and
                 not vExisteOperacaoOSPAnteriorFechada then
              begin
                vExisteOperacaoOSPAnteriorFechada := true;
                break;
              end;
              qryOperacoesOSPUsuario.Next;
            end;
          end;

        end;
      end;

      if ((TipoLogin = Operador) and
          (vOperacaoOSPUsuarioAnterioremAberto or
           (vExisteOperacaoOSPAnterioremAberto and
            not vExisteOperacaoOSPAnteriorFechada)
           )
          ) or
         vOperacaoOSPAnteriorSemRegistrodeUsuario then
          break
      else
      begin
        qryOperacoesOSP.Next;
        vProsseguir := false;
      end;
    end
    else
      break;
    *)

  end;

  if NaoPosicionar then
  begin
    qryOperacoesOSP.GotoBookmark(RegistroAtualOperacao);
    qryOperacoesOSPUsuario.GotoBookmark(RegistroAtualUsuario);
  end;
  qryOperacoesOSP.FreeBookmark(RegistroAtualOperacao);
  qryOperacoesOSPUsuario.FreeBookmark(RegistroAtualUsuario);

  qryOperacoesOSP.AfterScroll := qryOperacoesOSPAfterScroll;
  qryOperacoesOSPUsuarioFalhas.AfterScroll := qryOperacoesOSPUsuarioFalhasAfterScroll;




end;


procedure TdtmOperacoesOSP.qryOperacoesOSPFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := qryOperacoesOSPselecionada.AsBoolean;
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPCalcFields(DataSet: TDataSet);
begin
  inherited;
  {
  if qryOperacoesOSPtipooperacao.AsString = 'A' then
    qryOperacoesOSPalternativa.AsString := 'A'
  else
  if qryOperacoesOSPtipooperacao.AsString = 'AG' then
  begin
    if qryOperacoesOSPOperacaoemGrupoComAnterior.AsBoolean then
      qryOperacoesOSPalternativa.AsString := 'AG'
    else
      qryOperacoesOSPalternativa.AsString := 'Ag';
  end
  else
  if qryOperacoesOSPtipooperacao.AsString = 'NG' then
  begin
    if qryOperacoesOSPOperacaoemGrupoComAnterior.AsBoolean then
      qryOperacoesOSPalternativa.AsString := 'G'
    else
      qryOperacoesOSPalternativa.AsString := 'g';
  end
  else
  if qryOperacoesOSPtipooperacao.AsString = 'D' then
    qryOperacoesOSPalternativa.AsString := 'D'
  else
    qryOperacoesOSPalternativa.AsString := '';
  }

{
  qryOperacoesOSPSaldoFaltante.AsInteger := (qryOSPLotesquantidadelote.AsInteger +
                                             qryOSPLotesexcedentelote.AsInteger) -
                                            (qryOperacoesOSPquantidade.AsInteger +
                                             qryOperacoesOSPquantidadeperda.AsInteger);
}

  qryOperacoesOSPTipoOperacao_c.AsString := Trocar(qryOperacoesOSPTipoOperacao.AsString,'N',' ');


  qryOperacoesOSPSaldoFaltanteGeral.AsInteger := qryOperacoesOSPquantidadelimite.AsInteger -
                                            (qryOperacoesOSPquantidade.AsInteger +
                                             qryOperacoesOSPquantidadecomperda.AsInteger +
                                             qryOperacoesOSPquantidadenasalternativas.AsInteger);


  qryOperacoesOSPSaldoFaltanteProducao.AsInteger := qryOperacoesOSPquantidadeanterior.AsInteger -

                                            (qryOperacoesOSPquantidade.AsInteger +
                                             qryOperacoesOSPquantidadecomperda.AsInteger +
                                             qryOperacoesOSPquantidadenasalternativas.AsInteger);

  if qryOperacoesOSPtempopadrao.AsFloat <> 0 then
    qryOperacoesOSPPCSHR.AsFloat := 6000 / qryOperacoesOSPtempopadrao.AsFloat
  else
    qryOperacoesOSPPCSHR.clear;  




end;

(*
procedure TdtmOperacoesOSP.DefinirAlternativas;
var
  vOrigemOperacaoAlternativa, vOperacao : String;
  vQuantidadeLimite, vQuantidadeAnterior, vQuantidadenasAlternativas : integer;
  vOperacaoemAndamento : boolean;

begin

  vOrigemOperacaoAlternativa := '';
  vOperacao := '';

  //if TipoLogin = GerenteProducao then
  begin
    if qryOperacoesOSPalternativa.AsString[1] = 'A' then
    begin
      if not ExisteOperacoesOSPUsuarios then
      begin
        vOrigemOperacaoAlternativa := IfThen(not qryOperacoesOSPorigemoperacaoalternativa.IsNull,qryOperacoesOSPorigemoperacaoalternativa.asstring,'');
        vOperacao := IfThen(qryOperacoesOSPorigemoperacaoalternativa.IsNull,qryOperacoesOSPoperacao.asstring,'');
        if vOperacao <> '' then
        begin

          vQuantidadeLimite          := qryOperacoesOSPquantidadelimite.AsInteger;
          vQuantidadeAnterior        := qryOperacoesOSPquantidadeanterior.AsInteger;
          vQuantidadenasAlternativas := qryOperacoesOSPquantidadenasalternativas.AsInteger;
          vOperacaoemAndamento       := qryOperacoesOSPoperacaoemandamento.asboolean;

          {
          qryOperacoesOSP.Edit;
          qryOperacoesOSPselecionada.AsBoolean := false;
          qryOperacoesOSP.Post;}

          qryoperacoesosp.Filtered := false;
          if qryoperacoesosp.Locate('origemoperacaoalternativa',vOperacao,[]) then
          begin
            while (qryOperacoesOSPorigemoperacaoalternativa.AsString = vOperacao) and
                  not qryOperacoesOSP.Eof do
            begin
              qryOperacoesOSP.Edit;
              qryOperacoesOSPselecionada.AsBoolean := true;

              qryOperacoesOSPquantidadelimite.AsInteger := vQuantidadeLimite;
              qryOperacoesOSPquantidadeanterior.AsInteger := vQuantidadeAnterior;
              qryOperacoesOSPquantidadenasalternativas.AsInteger := vQuantidadenasAlternativas;
              qryOperacoesOSPoperacaoemandamento.asboolean := vOperacaoemAndamento;

              qryOperacoesOSP.Post;

              qryOperacoesOSP.Next;
            end;
          end;

          qryOperacoesOSP.Filtered := true;
          {qryoperacoesosp.Locate('origemoperacaoalternativa',vOperacao,[]);}
          qryoperacoesosp.Locate('operacao',vOperacao,[]);

        end
        else
        if vOrigemOperacaoAlternativa <> '' then
        begin
          {qryoperacoesosp.Filtered := false;}
          if qryoperacoesosp.Locate('origemoperacaoalternativa',vOrigemOperacaoAlternativa,[]) then
          begin
            while (qryOperacoesOSPorigemoperacaoalternativa.AsString = vOrigemOperacaoAlternativa) and
                  not qryOperacoesOSP.Eof do
            begin
              qryOperacoesOSP.Edit;
              qryOperacoesOSPselecionada.AsBoolean := false;
              qryOperacoesOSP.Post;

              qryOperacoesOSP.Next;
            end;

          end;

          {
          if qryoperacoesosp.Locate('operacao',vOrigemOperacaoAlternativa,[]) then
          begin
            qryOperacoesOSP.Edit;
            qryOperacoesOSPselecionada.AsBoolean := true;
            qryOperacoesOSP.Post;
          end;
          qryOperacoesOSP.Filtered := true;}

          qryoperacoesosp.Locate('operacao',vOrigemOperacaoAlternativa,[]);

        end;
      end
      else
        MensagemAviso('A operação já possui movimentação e não pode ser trocada.');

    end;
  end;
end;

*)

function TdtmOperacoesOSP.ExisteOperacoesOSPUsuarios: boolean;
var
  RegistroAtual: TBookmark;
  vOrigemOperacaoAlternativa : String;
begin
  result := false;
  RegistroAtual := qryOperacoesOSP.GetBookmark;
  try
    if qryOperacoesOSPorigemoperacaoalternativa.IsNull then
      result := not qryOperacoesOSPUsuario.IsEmpty
    else
    begin
      vOrigemOperacaoAlternativa := qryOperacoesOSPorigemoperacaoalternativa.asString;
      if qryOperacoesOSP.Locate('origemoperacaoalternativa',vOrigemOperacaoAlternativa,[]) then
      begin
        while (qryOperacoesOSPorigemoperacaoalternativa.AsString = vOrigemOperacaoAlternativa) and not
              qryOperacoesOSP.Eof do
        begin
          if not qryOperacoesOSPUsuario.IsEmpty then
          begin
            result := true;
            break;
          end
          else
            qryOperacoesOSP.Next;
        end;
      end;
    end;
  finally
    qryOperacoesOSP.GotoBookmark(RegistroAtual);
    qryOperacoesOSP.FreeBookmark(RegistroAtual);
  end;
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPAfterPost(DataSet: TDataSet);
begin
  inherited;
  if TipoLogin = GerenteProducao then
    qryospLotes.Edit;
end;

procedure TdtmOperacoesOSP.CalcularQuantidades;
var
  vQuantidade, vQuantidadeComPerdaTotal, vQuantidadeSemPerdaTotal : integer;
  RegistroAtual : TBookMark;
begin
  RegistroAtual := qryOperacoesOSPUsuario.GetBookmark;
  try
    vQuantidade := 0;
    vQuantidadeComPerdaTotal := 0;
    vQuantidadeSemPerdaTotal := 0;

    qryOperacoesOSPUsuario.First;
    while not qryOperacoesOSPUsuario.Eof do
    begin
      vQuantidade := vQuantidade + qryOperacoesOSPUsuarioquantidade.AsInteger - qryOperacoesOSPUsuarioretrabalho.AsInteger;

      qryOperacoesOSPUsuarioFalhas.First;
      while not qryOperacoesOSPUsuarioFalhas.Eof do
      begin
        if qryOperacoesOSPUsuarioFalhasperdatotal.AsBoolean then
          vQuantidadeComPerdaTotal := vQuantidadeComPerdaTotal + qryOperacoesOSPUsuarioFalhasquantidadeperda.AsInteger
        else
          vQuantidadeSemPerdaTotal := vQuantidadeSemPerdaTotal + qryOperacoesOSPUsuarioFalhasquantidadeperda.AsInteger;

        qryOperacoesOSPUsuarioFalhas.next;
      end;

      qryOperacoesOSPUsuario.next;
    end;

    if (qryOperacoesOSPquantidade.AsInteger <> vQuantidade) or
       (qryOperacoesOSPquantidadecomperda.AsInteger <> vQuantidadeComPerdaTotal) or
       (qryOperacoesOSPquantidadesemperda.AsInteger <> vQuantidadeSemPerdaTotal) then
    begin
      qryOperacoesOSP.AfterPost := nil;
      qryOperacoesOSP.Edit;
      qryOperacoesOSPquantidade.AsInteger := vQuantidade;
      qryOperacoesOSPquantidadecomperda.AsInteger := vQuantidadeComPerdaTotal;
      qryOperacoesOSPquantidadeSemperda.AsInteger := vQuantidadeSemPerdaTotal;
      qryOperacoesOSP.Post;
      qryOperacoesOSP.AfterPost := qryOperacoesOSPAfterPost;
    end;

  finally
    qryOperacoesOSPUsuario.GotoBookmark(RegistroAtual);
    qryOperacoesOSPUsuario.FreeBookmark(RegistroAtual);
  end;
end;

function TdtmOperacoesOSP.SelecionarOperacao: Boolean;
begin
  result := qryListaOperacaoLiberada.RecordCount <> 0 ;

  if result then
  begin
    frmListaOperacoesUsuario := TfrmListaOperacoesUsuario.Create(frmListaOperacoesUsuario);
    Result := frmListaOperacoesUsuario.ShowModal = mrOK;
    if result then
    begin
      if qryOperacoesOSPoperacao.AsInteger <> qryListaOperacaoLiberadaoperacao.AsInteger then
        qryOperacoesOSP.Locate('operacao', qryListaOperacaoLiberadaoperacao.AsInteger,[]);

      if (qryOperacoesOSPtipooperacao.AsString<>'') and
         (uppercase(qryOperacoesOSPtipooperacao.AsString[2]) = 'C') and
         not qryOperacoesOSPusuariopossuitodasoperacoesconjugadas.AsBoolean then
      begin
        MensagemAviso('Esta operação é conjugada com outras operações que não estão liberadas para o usuário.');
        result := false;
      end;
    end
    else
    begin
      TipoLogin := NaoInformado;
      qryOperacoesOSPAfterScroll(qryOperacoesOSP);
    end;

    frmListaOperacoesUsuario.free;
    RestaurarFoco;
  end;
end;

function TdtmOperacoesOSP.FinalizarOperacao: Boolean;
var
  vOperacaoAtual: integer;
  vSaldoFinalRateado : integer;
  //vnumero_operacoesospusuariofalhas : integer;

begin
  qryOperacoesOSPUsuarioParadas.ReadOnly := false;
  RefazConsultaPorNome(qryListaFalhas,['operacao'],[qryOperacoesOSPoperacao.AsVariant]);
  frmFechamentoOperacoesUsuario := TfrmFechamentoOperacoesUsuario.Create(frmFechamentoOperacoesUsuario);
//  frmFechamentoOperacoesUsuario.gbxNrDocumentoDesvioProcesso.Visible := dtmOperacoesOSP.qryOperacoesOSPdesviodeprocesso.AsBoolean;
  Result := frmFechamentoOperacoesUsuario.ShowModal = mrOK;
  if result then
  begin
    if qryOperacoesOSPUsuarioquantidade.AsInteger <> 0 then
    begin
      if qryOperacoesOSPUsuarioDataTermino.IsNull
      then qryOperacoesOSPUsuariodatatermino.Asdatetime := DataServidor;
//      qryOperacoesOSPUsuariotermino.AsString := frmFechamentoOperacoesUsuario.lblHoraTermino.Caption;
      if qryOperacoesOSPUsuarioTermino.IsNull
      then qryOperacoesOSPUsuariotermino.AsDateTime := strtoDateTime(FormatDateTime('HH:MM',HoraServidor));
      qryOperacoesOSPUsuario.Post;

      qryListaFalhas.First;
      while not qryListaFalhas.Eof do
      begin

        if qryListaFalhasquantidade.AsInteger <> 0 then
        begin
          qryOperacoesOSPUsuarioFalhas.Append;
          qryOperacoesOSPUsuarioFalhasfalha.AsInteger := qryListaFalhascodigo.AsInteger;
          qryOperacoesOSPUsuarioFalhasdescricao.AsString := qryListaFalhasdescricao.AsString;
          qryOperacoesOSPUsuarioFalhasquantidadeperda.AsInteger := qryListaFalhasquantidade.AsInteger;
          qryOperacoesOSPUsuarioFalhasperdatotal.AsBoolean := qryListaFalhasperdatotal.AsBoolean;

          if qryListaFalhasoperacaoorigemfalha.asinteger <> 0 then
          begin
            qryOperacoesOSPUsuarioFalhasoperacaoorigemfalha.AsInteger := qryListaFalhasoperacaoorigemfalha.asinteger;
            qryOperacoesOSPUsuarioFalhasfalhaoperacaoorigem.AsInteger := qryListaFalhasfalhaoperacaoorigem.asinteger;
          end
          else
          begin
            qryOperacoesOSPUsuarioFalhasoperacaoorigemfalha.clear;
            qryOperacoesOSPUsuarioFalhasfalhaoperacaoorigem.clear;
          end;

          qryOperacoesOSPUsuarioFalhasfalhavalidada.AsBoolean := true;
          qryOperacoesOSPUsuarioFalhas.post;

          (*
          if (qryOperacoesOSPUsuarioFalhasfalhaoperacaoorigem.AsInteger<>0) then
          begin
            vOperacaoAtual := qryOperacoesOSPUsuariooperacao.AsInteger;
//            vnumero_operacoesospusuariofalhas := qryOperacoesOSPUsuarioFalhasnumero.AsInteger;

            RefazConsultaPorNome(qryVerificarFalhaOperacaoOrigem,['QuantidadeFalha','falha','osp','lote','sequencia','operacaoorigem'],
                                [qryListaFalhasquantidade.Asinteger, qryListaFalhasfalhaoperacaoorigem.AsInteger,
                                 qryOSPLotesosp.Asinteger, qryOSPLotesnumero.Asinteger, qryOperacoesOSPsequencia.asstring,
                                 qryListaFalhasoperacaoorigemfalha.AsInteger]);

            vSaldoFinalRateado := 0;

            while not qryVerificarFalhaOperacaoOrigem.Eof do
            begin
              if qryOperacoesOSP.Locate('operacao',qryListaFalhasoperacaoorigemfalha.AsInteger,[]) then
              begin
                if qryOperacoesOSPUsuario.Locate('numero',qryVerificarFalhaOperacaoOrigem.fieldbyname('numero').AsInteger,[]) then
                begin

                  if qryVerificarFalhaOperacaoOrigem.RecNo = qryVerificarFalhaOperacaoOrigem.RecordCount then
                  begin
                    qryOperacoesOSPUsuarioFalhas.Append;
                    qryOperacoesOSPUsuarioFalhasfalha.AsInteger := qryListaFalhascodigo.AsInteger;
                    qryOperacoesOSPUsuarioFalhasdescricao.AsString := qryListaFalhasdescricao.AsString;
                    qryOperacoesOSPUsuarioFalhasquantidadeperda.AsInteger := qryListaFalhasquantidade.AsInteger - vSaldoFinalRateado;
                    qryOperacoesOSPUsuarioFalhasperdatotal.AsBoolean := qryListaFalhasperdatotal.AsBoolean;
                    qryOperacoesOSPUsuarioFalhasfalhavalidada.AsBoolean := true;
//                    qryOperacoesOSPUsuarioFalhasnumero_operacoesospusuariofalhas.AsInteger := vnumero_operacoesospusuariofalhas;
                    qryOperacoesOSPUsuarioFalhas.post;
                  end
                  else
                  begin
                    qryOperacoesOSPUsuarioFalhas.Append;
                    qryOperacoesOSPUsuarioFalhasfalha.AsInteger := qryListaFalhascodigo.AsInteger;
                    qryOperacoesOSPUsuarioFalhasdescricao.AsString := qryListaFalhasdescricao.AsString;
                    qryOperacoesOSPUsuarioFalhasquantidadeperda.AsInteger := qryVerificarFalhaOperacaoOrigem.fieldbyname('quantidadefalharateada').AsInteger;
                    qryOperacoesOSPUsuarioFalhasperdatotal.AsBoolean := qryListaFalhasperdatotal.AsBoolean;
                    qryOperacoesOSPUsuarioFalhasfalhavalidada.AsBoolean := true;
                    qryOperacoesOSPUsuarioFalhasnumero_operacoesospusuariofalhas.AsInteger := vnumero_operacoesospusuariofalhas;
                    qryOperacoesOSPUsuarioFalhas.post;
                  end;

                  vSaldoFinalRateado := vSaldoFinalRateado + qryVerificarFalhaOperacaoOrigem.fieldbyname('quantidadefalharateada').AsInteger;
                end;
              end;
              qryVerificarFalhaOperacaoOrigem.Next;
            end;

            qryOperacoesOSP.Locate('operacao', vOperacaoAtual,[]);

          end;
          *)

        end;

        qryListaFalhas.Next;
      end;

      ConcluirOperacao;

    end
    else
    begin
      result := false;
      qryOperacoesOSPUsuarioquantidade.clear;
      qryOperacoesOSPUsuariotermino.Clear;
      qryOperacoesOSPUsuariodatatermino.Clear;
    end;

    if qryOperacoesOSPUsuarioParadas.RecordCount <> 0 then
      CalcularTempoParada;

  end
  else
  begin
    qryOperacoesOSPUsuario.Cancel;
    LimparTabela(qryOperacoesOSPUsuarioParadas);
    TipoLogin := NaoInformado;
    qryOperacoesOSPAfterScroll(qryOperacoesOSP);
  end;

  frmFechamentoOperacoesUsuario.free;
  RestaurarFoco;
end;

procedure TdtmOperacoesOSP.qryListaFalhasAfterInsert(DataSet: TDataSet);
begin
  inherited;
//  qryListaFalhas.Cancel;
end;



function TdtmOperacoesOSP.ImprimirProcessos: boolean;
var
  vImprimiuSetup, vImprimiuControle   : Boolean;
  vImpressoraSetupProcesso, vImpressoraControleProcesso : String;
begin
  result := false;
  vImprimiuSetup := false;
  vImprimiuControle := false;


  if qryOperacoesOSPsetup.AsBoolean or qryOperacoesOSPplanocontrole.AsBoolean then
  begin
    dtmImprimeOsp := TdtmImprimeOsp.Create(Self);
    try
      if qryOperacoesOSPsetup.AsBoolean and (result or not vImprimiuSetup) then
      begin
        if MensagemSimNaoOpcaoCancelar(Format(ctMENSAGEMIMPRIMIR,['o SET-UP DA OPERAÇÃO']),'',false) = mryes then
        begin

          if ParSistema.NomeImpressoraSetupProcesso<> '' then
             vImpressoraSetupProcesso := ParSistema.NomeImpressoraSetupProcesso
          else
          if UltimaImpressoraSelecionada<>'' then
            vImpressoraSetupProcesso := UltimaImpressoraSelecionada
          else
          begin
            vImpressoraSetupProcesso := SelecionarImpressora;
            UltimaImpressoraSelecionada := vImpressoraSetupProcesso;
          end;


          if vImpressoraSetupProcesso <> '' then
          begin

            if dtmImprimeOsp.ImpressaoSetup(qryOSPLotesosp.asinteger,
                                            qryOperacoesOSPoperacao.AsInteger,
                                            qryOperacoesOSPUsuariousuariosetup.AsInteger,
                                            qryOperacoesOSPUsuarionomeusuariosetup.AsString,
                                            vImpressoraSetupProcesso) then
            begin
              result := true;
              vImprimiuSetup := true;
            end
            else
              result := false;

          end;
        end;
      end;

      if qryOperacoesOSPplanocontrole.AsBoolean and (result or not vImprimiuControle) then
      begin

        if MensagemSimNaoOpcaoCancelar(Format(ctMENSAGEMIMPRIMIR,['o CONTROLE DA OPERAÇÃO']),'',false) = mryes then
        begin

          if ParSistema.NomeImpressoraControleProcesso<> '' then
             vImpressoraControleProcesso := ParSistema.NomeImpressoraControleProcesso
          else
          if UltimaImpressoraSelecionada<>'' then
            vImpressoraControleProcesso := UltimaImpressoraSelecionada
          else
          begin
            vImpressoraControleProcesso := SelecionarImpressora;
            UltimaImpressoraSelecionada := vImpressoraControleProcesso;
          end;

          if vImpressoraControleProcesso <> '' then
          begin

            if dtmImprimeOsp.ImpressaoControleProcesso(qryOSPLotesosp.asinteger, qryOperacoesOSPoperacao.AsInteger,
                                                        vImpressoraControleProcesso) then
            begin
              result := true;
              vImprimiuControle := true;
            end
            else
              result := false;
          end;
        end;
      end;
    finally
      dtmImprimeOsp.Free;
      dtmImprimeOsp := nil;
    end;
  end;
end;

function TdtmOperacoesOSP.SelecionarUsuarioOperacao: Boolean;
var
  UsuarioAut: TtecUsuarios;
begin
  IncluindoCodigoUsuario := true;
  result := true;
  if not SenhadoGerenteFixada then
  begin
    TipoLogin := NaoInformado;
    result := false;
    refazconsulta(qryusuarios,[0],[0]);
    qryOSPLotes.ParamByName('osp').AsInteger := 0;
    qryOSPLotes.ParamByName('numero').asinteger := 0;
    try

      qryOSPLotes.AfterScroll := nil;
      frmUsuariosOperacao := TfrmUsuariosOperacao.Create(frmUsuariosOperacao);
      Result := frmUsuariosOperacao.ShowModal = mrOK;
      qryOSPLotes.AfterScroll := qryOSPLotesAfterScroll;

      if result then
      begin
        if qryUsuariosgerenteproducao.AsBoolean then
        begin
          if UsuarioLogin.GerenteProducao then
            UsuarioAut := ObterAutorizacao(taSENHA, ctPARAAUTORIZACAOOPERACOESOSP, ctGERENTEPRODUCAO, '')
          else
            UsuarioAut := ObterAutorizacao(taLOGIN, ctPARAAUTORIZACAOOPERACOESOSP, ctGERENTEPRODUCAO, '');

          if Assigned(UsuarioAut) and UsuarioAut.GerenteProducao then
          begin
            TipoLogin := GerenteProducao;
            qryOSPLotesAfterScroll(nil);
          end
          else
          begin
            TipoLogin := NaoInformado;
            qryOSPLotesAfterScroll(qryOSPLotes);
//            MarcarOperacaoemAndamento;
//            qryOperacoesOSPAfterScroll(qryOperacoesOSP);
          end;
        end
        else
        begin
          TipoLogin := Operador;
          qryOSPLotesAfterScroll(nil);
        end;
      end
      else
      begin
        TipoLogin := NaoInformado;
        qryOSPLotesAfterScroll(qryOSPLotes);
//        MarcarOperacaoemAndamento;
        //qryOperacoesOSPAfterScroll(qryOperacoesOSP);
      end;

//      qryOSPLotesAfterScroll(qryOSPLotes);



    finally
      frmUsuariosOperacao.free;
    end;
  end;

  RestaurarFoco;
end;


function TdtmOperacoesOSP.AbreOperacaoemAbertoUsuario: boolean;
begin
  result := false;
  RefazConsultaPorNome(qryUsuarioOSPLote,['usuario'],[qryUsuarioscodigo.AsVariant]);


  if qryUsuarioOSPLote.RecordCount<>0 then
  begin
//    qryOSPLotes.AfterScroll := nil;
    qryOSPLotes.AfterClose := nil;
    qryOSPLotes.AfterCancel := nil;

    RefazConsulta(qryOSPLotes, [0, 1, 2, 3],
                 [0, 0, qryUsuarioOSPLoteosp.AsInteger, qryUsuarioOSPLotelote.asinteger]);

//    qryOSPLotes.AfterScroll := qryOSPLotesAfterScroll;
    qryOSPLotes.AfterClose := qryOSPLotesAfterScroll;
    qryOSPLotes.AfterCancel := qryOSPLotesAfterScroll;

    result := qryospLotes.recordcount <> 0;


  {
  end

  else
  begin
    qryOSPLotes.AfterClose := nil;
    qryOSPLotes.AfterCancel := nil;

    RefazConsulta(qryOSPLotes, [0, 1, 2, 3],
                   [0, 0, 0, 0]);

    qryOSPLotes.AfterClose := qryOSPLotesAfterScroll;
    qryOSPLotes.AfterCancel := qryOSPLotesAfterScroll;
  }
  end;

end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioFalhasAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  dtmOperacoesOSP.TempoAbrirJanela := now();
  if dataset <> nil then
  begin
    if qryOperacoesOSPUsuarioFalhasoperacaoorigemfalha.asinteger = 0 then
    begin
      if qryOperacoesOSPUsuarioquantidade.asinteger = 0 then
        qryOperacoesOSPUsuarioFalhasOutrasOrigensDestinos.Close
      else
        refazconsultapornome(qryOperacoesOSPUsuarioFalhasOutrasOrigensDestinos,
          ['osp','lote','operacao','usuario','datainicial','horainicial','tipofalha'],
          [qryOperacoesOSPUsuarioosp.asinteger,
           qryOperacoesOSPUsuariolote.AsInteger,
           qryOperacoesOSPUsuariooperacao.asinteger,
           qryOperacoesOSPUsuariousuario.asinteger,
           qryOperacoesOSPUsuariodata.asdatetime,
           FormatDateTime('hh:mm:ss', qryOperacoesOSPUsuarioinicio.asdatetime),
           'N']);
    end
    else
      refazconsultapornome(qryOperacoesOSPUsuarioFalhasOutrasOrigensDestinos,
        ['osp','lote','operacao','usuario','datainicial','horainicial','tipofalha'],
        [qryOperacoesOSPUsuarioFalhasosp.asinteger,
         qryOperacoesOSPUsuarioFalhaslote.AsInteger,
         qryOperacoesOSPUsuarioFalhasoperacao.asinteger,
         qryOperacoesOSPUsuarioFalhasusuario.asinteger,
         qryOperacoesOSPUsuarioFalhasdata.asdatetime,
         FormatDateTime('hh:mm:ss', qryOperacoesOSPUsuarioFalhasinicio.asdatetime),
         'O']);
   end;         
end;

function TdtmOperacoesOSP.selecionarUsuarioSetup: Boolean;
//var
//  UsuarioAut: TtecUsuarios;

begin
  RefazConsultaPorNome(qryUsuariosHabilitadosSetup, ['operacao'],[qryOperacoesOSPoperacao.AsInteger]);
  result := qryUsuariosHabilitadosSetup.RecordCount <> 0 ;


  if result then
  begin
    frmListaUsuariosSetup := TfrmListaUsuariosSetup.Create(frmListaUsuariosSetup);
    Result := frmListaUsuariosSetup.ShowModal = mrOK;

    if not result then
    begin
      TipoLogin := NaoInformado;
      qryOperacoesOSPAfterScroll(qryOperacoesOSP);
    end;
    {
    if result then
    begin
      if UsuarioLogin.CodigoUsuario = qryUsuariosHabilitadosSetupusuario.AsInteger then
        UsuarioAut := ObterAutorizacao(taSENHA, ctPARAAUTORIZACAOSETUP, ctRESPONSAVELSETUP, '')
      else
        UsuarioAut := ObterAutorizacao(taLOGIN, ctPARAAUTORIZACAOSETUP, ctRESPONSAVELSETUP, '');

      if Assigned(UsuarioAut) and
        (UsuarioAut.CodigoUsuario = qryUsuariosHabilitadosSetupusuario.AsInteger) then
        result := true
      else
        result := false;
    end;
    }

    frmListaUsuariosSetup.free;
  end
  else
    MensagemErro(format('Não existem usuários habilitados para o setup da operação ''%s''.',
                   [trim(qryOperacoesOSPnome.asstring+ ' '+
                         qryOperacoesOSPc01.asstring+ ' '+
                         qryOperacoesOSPc02.asstring+ ' '+
                         qryOperacoesOSPc03.asstring) ]));

end;

procedure TdtmOperacoesOSP.qryOperacoesOSPBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  case TipoLogin of
    GerenteProducao:
    begin
      qryOperacoesOSPUsuario.First;
      while not qryOperacoesOSPUsuario.Eof do
        qryOperacoesOSPUsuario.Delete;
    end;
  end;

end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioParadasNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryOperacoesOSPUsuarioParadasnumero_operacoesospusuario.AsInteger := qryOperacoesOSPUsuarionumero.AsInteger;
  qryOperacoesOSPUsuarioParadasosp.AsInteger := qryOperacoesOSPosp.AsInteger;
  qryOperacoesOSPUsuarioParadaslote.AsInteger := qryOperacoesOSPlote.AsInteger;
  qryOperacoesOSPUsuarioParadasoperacao.AsInteger := qryOperacoesOSPoperacao.AsInteger;
  qryOperacoesOSPUsuarioParadasusuario.AsInteger := qryOperacoesOSPUsuariousuario.AsInteger;
  qryOperacoesOSPUsuarioParadasdata.AsDateTime := qryOperacoesOSPUsuariodata.AsDateTime;
  qryOperacoesOSPUsuarioParadasinicio.AsString := qryOperacoesOSPUsuarioinicio.AsString;
  qryOperacoesOSPUsuarioParadastempoparada.AsInteger := 0;
  qryOperacoesOSPUsuarioParadasinicioparada.AsDateTime := now;

end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioParadasAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  case TipoLogin of
    GerenteProducao:
    begin
      EditarOSP;
      AtualizaListaParadas;
      CalcularTempoParada;
    end;
    Operador:  AtualizaListaParadas;
  end;
end;

procedure TdtmOperacoesOSP.AtualizaListaParadas;
var
  Pos: TBookmark;
begin
  if qryOperacoesOSPUsuarioParadas.Active then
  begin
    Pos := qryOperacoesOSPUsuarioParadas.GetBookmark;
    try
      qryOperacoesOSPUsuarioParadas.DisableControls;
      ListaParadas := '';

      qryOperacoesOSPUsuarioParadas.First;
      while Not qryOperacoesOSPUsuarioParadas.Eof do
      begin
        if qryOperacoesOSPUsuarioParadasparadavalidada.AsBoolean then
          ListaParadas := ListaParadas +
                         qryOperacoesOSPUsuarioParadascodigoparada.AsString + ',';
        qryOperacoesOSPUsuarioParadas.Next
      end;

      if ListaParadas <> '' then
        ListaParadas := copy(ListaParadas,0, Length(ListaParadas)-1)
      else
        ListaParadas := '0';

    finally
      qryOperacoesOSPUsuarioParadas.GotoBookmark(Pos);
      qryOperacoesOSPUsuarioParadas.FreeBookmark(Pos);
      qryOperacoesOSPUsuarioParadas.enableControls;
    end
  end;
end;

procedure TdtmOperacoesOSP.CalcularTempoParada;
var
  vTotalTempoParada: integer;
  RegistroAtual : TBookMark;
begin
  RegistroAtual := qryOperacoesOSPUsuario.GetBookmark;
  try
    vTotalTempoParada := 0;
    qryOperacoesOSPUsuario.First;
    while not qryOperacoesOSPUsuario.Eof do
    begin
      qryOperacoesOSPUsuarioParadas.First;
      while not qryOperacoesOSPUsuarioParadas.Eof do
      begin
        vTotalTempoParada := vTotalTempoParada + qryOperacoesOSPUsuarioParadastempoparada.AsInteger;
        qryOperacoesOSPUsuarioParadas.next;
      end;

      qryOperacoesOSPUsuario.next;
    end;

    if (qryOperacoesOSPtotaltempoparada.AsInteger <> vTotalTempoParada) then
    begin
      qryOperacoesOSP.AfterPost := nil;
      qryOperacoesOSP.Edit;
      qryOperacoesOSPtotaltempoparada.AsInteger := vTotalTempoParada;
      qryOperacoesOSP.Post;
      qryOperacoesOSP.AfterPost := qryOperacoesOSPAfterPost;
    end;

  finally
    qryOperacoesOSPUsuario.GotoBookmark(RegistroAtual);
    qryOperacoesOSPUsuario.FreeBookmark(RegistroAtual);
  end;
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioParadasAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  case TipoLogin of
    GerenteProducao, Operador: AtualizaListaParadas;
  end;
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioParadasAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  case TipoLogin of
    GerenteProducao, Operador:
    begin
      EditarOSP;
      AtualizaListaParadas;
      CalcularTempoParada;
    end;
  end;
end;

procedure TdtmOperacoesOSP.EditarOperacoesOSPUsuarioParadas;
begin
  if not (qryOperacoesOSPUsuarioParadas.State in [dsedit, dsinsert]) then
    qryOperacoesOSPUsuarioParadas.Edit;
end;

procedure TdtmOperacoesOSP.LimparOperacoesOSPUsuarioParadas;
begin
   if not (qryOperacoesOSPUsuarioParadas.State in [dsedit, dsinsert]) then
     qryOperacoesOSPUsuarioParadas.Edit;
   qryOperacoesOSPUsuarioParadascodigoparada.Clear;
   qryOperacoesOSPUsuarioParadasdescricao.Clear;
   qryOperacoesOSPUsuarioParadastempoparada.Clear;
   qryOperacoesOSPUsuarioParadasbloqueiamaquina.Clear;
   
end;

function TdtmOperacoesOSP.RegistrodeOperacoesOSPUsuarioParadas: boolean;
begin
  result := qryOperacoesOSPUsuarioParadascodigoparada.IsNull;
end;

procedure TdtmOperacoesOSP.ExcluirOperacoesOSPUsuarioParadas;
begin
  if not qryOperacoesOSPUsuarioParadas.IsEmpty then
    if not qryOperacoesOSPUsuarioParadas.ReadOnly then
      if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['a parada desta operação'])) = smbOk) then
         qryOperacoesOSPUsuarioParadas.Delete;
end;

procedure TdtmOperacoesOSP.CancelarOperacoesOSPUsuarioParadas;
var
  RegistroAtual : TBookmark;
begin
  try
    RegistroAtual := qryOperacoesOSPUsuarioParadas.getBookMark;

    qryOperacoesOSPUsuarioParadas.Cancel;
    qryOperacoesOSPUsuarioParadas.First;
    while not qryOperacoesOSPUsuarioParadas.Eof do
    begin
      if not (qryOperacoesOSPUsuarioParadasparadavalidada.AsBoolean) or
              qryOperacoesOSPUsuarioParadastempoparada.IsNull then
        qryOperacoesOSPUsuarioParadas.Delete
      else
        qryOperacoesOSPUsuarioParadas.next;
    end;
    qryOperacoesOSPUsuarioParadas.GotoBookmark(RegistroAtual);
    qryOperacoesOSPUsuarioParadas.FreeBookmark(RegistroAtual);

  except
  end;
end;

function TdtmOperacoesOSP.GravarOperacoesOSPUsuarioParadas: Boolean;
begin
  result := true;
  if (qryOperacoesOSPUsuarioParadas.State in [dsedit, dsinsert]) then
  begin
    result := qryOperacoesOSPUsuarioParadas.CheckRequiredFields;
    if result then
      qryOperacoesOSPUsuarioParadas.Post;
  end;
end;

function TdtmOperacoesOSP.PosicionarOperacoesOSPUsuarioAguardandoFechamento: boolean;
begin
  result := false;
  qryOperacoesOSPUsuario.First;
  while not qryOperacoesOSPUsuario.eof do
  begin
    case TipoLogin of
      operador :
      begin
        if qryOperacoesOSPUsuariotermino.IsNull and
           (qryOperacoesOSPUsuariousuario.AsInteger = qryUsuariosCodigo.asinteger) then
        begin
          result := true;
          break;
        end
        else
          qryOperacoesOSPUsuario.Next;
      end;

      NaoInformado, gerenteProducao:
      begin
        if qryOperacoesOSPUsuariotermino.IsNull then
        begin
          result := true;
          break;
        end
        else
          qryOperacoesOSPUsuario.Next;
      end;
    end;
  end;
end;

procedure TdtmOperacoesOSP.LimparOperacoesOSPUsuarioSetup;
begin
   if not (qryOperacoesOSPUsuario.State in [dsedit, dsinsert]) then
     qryOperacoesOSPUsuario.Edit;
   qryOperacoesOSPUsuariousuariosetup.Clear;
end;

procedure TdtmOperacoesOSP.CancelarOperacoesOSPUsuarioSetup;
var
 RegistroAtual : TBookMark;
begin
  try
    RegistroAtual := qryOperacoesOSPUsuario.getBookMark;
    qryOperacoesOSPUsuario.AfterScroll := nil;
    qryOperacoesOSPUsuarioFalhas.AfterScroll := nil;
    qryOperacoesOSPUsuario.Cancel;
    qryOperacoesOSPUsuario.First;
    while not qryOperacoesOSPUsuario.Eof do
    begin
      CancelarOperacoesOSPUsuarioFalhas;
      if not qryOperacoesOSPUsuariousuariosetupvalidado.AsBoolean then
        qryOperacoesOSPUsuario.Delete
      else
        qryOperacoesOSPUsuario.next;

    end;
    qryOperacoesOSPUsuario.GotoBookmark(RegistroAtual);
    qryOperacoesOSPUsuario.FreeBookmark(RegistroAtual);
    qryOperacoesOSPUsuario.AfterScroll := qryOperacoesOSPUsuarioAfterScroll;
    qryOperacoesOSPUsuarioFalhas.AfterScroll := qryOperacoesOSPUsuarioFalhasAfterScroll;
  except
  end;
end;

function TdtmOperacoesOSP.RegistrodeOperacoesOSPUsuarioSetup: boolean;
begin
  result := qryOperacoesOSPUsuariousuarioSetup.IsNull;
end;

procedure TdtmOperacoesOSP.LimparOperacoesOSPUsuarioFechamento;
begin
   if not (qryOperacoesOSPUsuario.State in [dsedit, dsinsert]) then
     qryOperacoesOSPUsuario.Edit;
   qryOperacoesOSPUsuariousuariotermino.Clear;
end;

procedure TdtmOperacoesOSP.CancelarOperacoesOSPUsuarioFechamento;
var
 RegistroAtual : TBookMark;
begin
  try
    RegistroAtual := qryOperacoesOSPUsuario.getBookMark;
    qryOperacoesOSPUsuario.AfterScroll := nil;
    qryOperacoesOSPUsuarioFalhas.AfterScroll := nil;
    qryOperacoesOSPUsuario.Cancel;
    qryOperacoesOSPUsuario.First;
    while not qryOperacoesOSPUsuario.Eof do
    begin
      CancelarOperacoesOSPUsuarioFalhas;
      if not qryOperacoesOSPUsuariousuariofechamentovalidado.AsBoolean then
        qryOperacoesOSPUsuario.Delete
      else
        qryOperacoesOSPUsuario.next;

    end;
    qryOperacoesOSPUsuario.GotoBookmark(RegistroAtual);
    qryOperacoesOSPUsuario.FreeBookmark(RegistroAtual);
    qryOperacoesOSPUsuario.AfterScroll := qryOperacoesOSPUsuarioAfterScroll;
    qryOperacoesOSPUsuarioFalhas.AfterScroll := qryOperacoesOSPUsuarioFalhasAfterScroll;
  except
  end;
end;


procedure TdtmOperacoesOSP.DefinirComplementar;
var
  vOperacaoAnterior: String;
  vSequencia : String;
begin
  vOperacaoAnterior := qryOperacoesOSPoperacao.AsString;

  vSequencia := qryOperacoesOSPsequencia.AsString+'.1';

  qryOperacoesOSP.Next;
  while not qryOperacoesOSP.Eof do
  begin
    if qryOperacoesOSPorigemoperacaoalternativa.AsString = vOperacaoAnterior then
    begin
      if pos('.',qryOperacoesOSPsequencia.AsString)<>0 then
        vSequencia := copy(qryOperacoesOSPsequencia.AsString,1,pos('.',qryOperacoesOSPsequencia.AsString))+
                      inttostr(strtoint(copy(qryOperacoesOSPsequencia.AsString,pos('.',qryOperacoesOSPsequencia.AsString)+1,length(qryOperacoesOSPsequencia.AsString)))+1)
    end;


    if (qryOperacoesOSPtipooperacao.AsString[1] = 'N') or

       ((qryOperacoesOSPtipooperacao.AsString[1] = 'D') and
         qryOperacoesOSPorigemoperacaoalternativa.IsNull) or

       (qryOperacoesOSPtipooperacao.AsString[1] = 'A') then

      break;

    qryOperacoesOSP.Next;
  end;


  if qryOperacoesOSP.Eof then
    qryOperacoesOSP.Append
  else
    qryOperacoesOSP.Insert;

  qryOperacoesOSPtipooperacao.AsString := 'D  ';
  qryOperacoesOSPorigemoperacaoalternativa.AsString := vOperacaoAnterior;
  qryOperacoesOSPsequencia.AsString := vSequencia;

end;

(*
procedure TdtmOperacoesOSP.DefinirComplementar;
var
  vOrigemOperacaoAlternativa, vOperacaoNormal : String;
begin

  vOrigemOperacaoAlternativa := '';
  vOperacaoNormal := '';

  if TipoLogin = GerenteProducao then
  begin
    if (qryOperacoesOSPalternativa.AsString = 'A') or
       (qryOperacoesOSPalternativa.AsString = 'C') then
    begin
      //if qryOperacoesOSPSaldoFaltanteProducao.AsCurrency > 0 then
      //begin
        vOrigemOperacaoAlternativa := IfThen(not qryOperacoesOSPorigemoperacaoalternativa.IsNull,qryOperacoesOSPorigemoperacaoalternativa.asstring,'');  // é uma operação alternativa
        vOperacaoNormal := IfThen(qryOperacoesOSPorigemoperacaoalternativa.IsNull,qryOperacoesOSPoperacao.asstring,''); // não é uma operação de origem das alternativa

        {se estiver em uma operação origem das alternativas}
        if vOperacaoNormal <> '' then
        begin
          if qryOperacoesOSPtipooperacao.AsString[1] = 'A' then
          begin
            qryOperacoesOSP.Edit;
            qryOperacoesOSPselecionada.AsBoolean := true;
            qryOperacoesOSPtipooperacao.AsString := 'C';
            qryOperacoesOSP.Post;

            qryoperacoesosp.Filtered := false;
            if qryoperacoesosp.Locate('origemoperacaoalternativa',vOperacaoNormal,[]) then
            begin
              while (qryOperacoesOSPorigemoperacaoalternativa.AsString = vOperacaoNormal) and

                    not qryOperacoesOSP.Eof do
              begin
                qryOperacoesOSP.Edit;
                qryOperacoesOSPselecionada.AsBoolean := true;
                qryOperacoesOSPtipooperacao.AsString := 'C';
                qryOperacoesOSP.Post;

                qryOperacoesOSP.Next;
              end;
            end;

            qryOperacoesOSP.Filtered := true;
            qryoperacoesosp.Locate('operacao',vOperacaoNormal,[]);
          end
          else
          begin
            if not ExisteOperacoesOSPUsuarios_Complementar then
            begin
              qryOperacoesOSP.Edit;
              qryOperacoesOSPselecionada.AsBoolean := true;
              qryOperacoesOSPtipooperacao.AsString := 'A';
              qryOperacoesOSP.Post;

              qryoperacoesosp.Filtered := false;

              if qryoperacoesosp.Locate('origemoperacaoalternativa',vOperacaoNormal,[]) then
              begin
                while (qryOperacoesOSPorigemoperacaoalternativa.AsString = vOperacaoNormal) and

                      not qryOperacoesOSP.Eof do
                begin
                  qryOperacoesOSP.Edit;
                  qryOperacoesOSPselecionada.AsBoolean := false;
                  qryOperacoesOSPtipooperacao.AsString := 'A';
                  qryOperacoesOSP.Post;

                  qryOperacoesOSP.Next;
                end;
              end;

              qryOperacoesOSP.Filtered := true;
              qryoperacoesosp.Locate('operacao',vOperacaoNormal,[]);

            end
            else
              MensagemAviso('A operação já possui movimentação e não pode ser trocada.');

          end;
        end
        else
          if (qryOperacoesOSPalternativa.AsString = 'C') and
             (vOrigemOperacaoAlternativa <> '') then
          begin
            if not ExisteOperacoesOSPUsuarios_Complementar then
            begin
              qryoperacoesosp.Filtered := false;
              if qryoperacoesosp.Locate('origemoperacaoalternativa',vOrigemOperacaoAlternativa,[]) then
              begin
                while (qryOperacoesOSPorigemoperacaoalternativa.AsString = vOrigemOperacaoAlternativa) and
                      not qryOperacoesOSP.Eof do
                begin
                  qryOperacoesOSP.Edit;
                  qryOperacoesOSPselecionada.AsBoolean := false;
                  qryOperacoesOSPtipooperacao.AsString := 'A';
                  qryOperacoesOSP.Post;
                  qryOperacoesOSP.Next;
                end;
              end;

              if qryoperacoesosp.Locate('operacao',vOrigemOperacaoAlternativa,[]) then
              begin
                qryOperacoesOSP.Edit;
                qryOperacoesOSPselecionada.AsBoolean := true;
                qryOperacoesOSPtipooperacao.AsString := 'A';
                qryOperacoesOSP.Post;
              end;
              qryOperacoesOSP.Filtered := true;
              qryoperacoesosp.Locate('operacao',vOrigemOperacaoAlternativa,[]);
            end
            else
              MensagemAviso('A operação já possui movimentação e não pode ser trocada.');

          end;
      //end
      //else
      //  MensagemAviso('A quantidade produzida em relação a operação anterior já foi atingida.');

    end;
  end;
end;
*)

function TdtmOperacoesOSP.ExisteOperacoesOSPUsuarios_Complementar: boolean;
var
  RegistroAtual: TBookmark;
  vOperacao : String;
begin
  result := false;
  RegistroAtual := qryOperacoesOSP.GetBookmark;
  try
    if qryOperacoesOSPorigemoperacaoalternativa.IsNull then
    begin
      result := not qryOperacoesOSPUsuario.IsEmpty;

      if not result then
      begin
        vOperacao := qryOperacoesOSPoperacao.asString;
        if qryOperacoesOSP.Locate('origemoperacaoalternativa',vOperacao,[]) then
        begin
          while (qryOperacoesOSPorigemoperacaoalternativa.AsString = vOperacao) and not
                qryOperacoesOSP.Eof do
          begin
            if not qryOperacoesOSPUsuario.IsEmpty then
            begin
              result := true;
              break;
            end
            else
              qryOperacoesOSP.Next;
          end;
        end;
      end;

    end
    else
    begin
      result := not qryOperacoesOSPUsuario.IsEmpty;

      if not result then
      begin
        vOperacao := qryOperacoesOSPorigemoperacaoalternativa.asString;
        if qryOperacoesOSP.Locate('origemoperacaoalternativa',vOperacao,[]) then
        begin
          while (qryOperacoesOSPorigemoperacaoalternativa.AsString = vOperacao) and not
                qryOperacoesOSP.Eof do
          begin
            if not qryOperacoesOSPUsuario.IsEmpty then
            begin
              result := true;
              break;
            end
            else
              qryOperacoesOSP.Next;
          end;
        end;
      end;

    end;

  finally
    qryOperacoesOSP.GotoBookmark(RegistroAtual);
    qryOperacoesOSP.FreeBookmark(RegistroAtual);
  end;
end;

procedure TdtmOperacoesOSP.LimparOperacoesOSPUsuarioMaquinas;
begin
   if not (qryOperacoesOSPUsuario.State in [dsedit, dsinsert]) then
     qryOperacoesOSPUsuario.Edit;

   qryOperacoesOSPUsuariomaquina.Clear;
   qryOperacoesOSPUsuariodescricaomaquina.Clear;

end;

function TdtmOperacoesOSP.RegistrodeOperacoesOSPUsuarioMaquinas: boolean;
begin
  result := qryOperacoesOSPUsuariomaquina.IsNull or
            qryOperacoesOSPUsuariodescricaomaquina.IsNull;
end;

procedure TdtmOperacoesOSP.GravarFalhas;
begin
  if (qryListaFalhas.State in [dsedit, dsinsert]) then
    if qryListaFalhas.CheckRequiredFields then
       qryListaFalhas.Post;
end;

procedure TdtmOperacoesOSP.AtualizaListaFalhasGeral;
var
  Pos: TBookmark;
begin

  if qryListaFalhas.Active then
  begin
    Pos := qryListaFalhas.GetBookmark;
    try
      qryListaFalhas.DisableControls;
      ListaFalhasSelecionadas := '';

      qryListaFalhas.First;
      while Not qryListaFalhas.Eof do
      begin
        if qryListaFalhasFalhaValidada.AsBoolean then
          ListaFalhasSelecionadas := ListaFalhas +
                         qryListaFalhascodigo.AsString + ',';
        qryListaFalhas.Next
      end;

      if ListaFalhasSelecionadas <> '' then
        ListaFalhasSelecionadas := copy(ListaFalhasSelecionadas,0, Length(ListaFalhasSelecionadas)-1)
      else
        ListaFalhasSelecionadas := '0';

    finally
      qryListaFalhas.GotoBookmark(Pos);
      qryListaFalhas.FreeBookmark(Pos);
      qryListaFalhas.enableControls;
    end
  end;

end;

procedure TdtmOperacoesOSP.qryListaFalhasAfterPost(DataSet: TDataSet);
begin
  inherited;
  AtualizaListaFalhasGeral;
end;

procedure TdtmOperacoesOSP.qryListaFalhasAfterDelete(DataSet: TDataSet);
begin
  inherited;
  AtualizaListaFalhasGeral;
end;

procedure TdtmOperacoesOSP.qryListaFalhasNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryListaFalhasFalhaValidada.AsBoolean := false;
  qryListaFalhascodigo.FocusControl;
end;

procedure TdtmOperacoesOSP.qryListaOperacaoLiberadaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  ListaOperacaoLiberadaSequencia := qryListaOperacaoLiberada.RecNo =
                                    qryListaOperacaoLiberadasequencia.asinteger;

end;

procedure TdtmOperacoesOSP.dsrOperacoesOSPUsuarioParadasDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if field = qryOperacoesOSPUsuarioParadascodigoparada then
  begin
    if field.isnull then
      qryOperacoesOSPUsuarioParadasbloqueiamaquina.readonly := true
    else
      qryOperacoesOSPUsuarioParadasbloqueiamaquina.readonly := false;
  end;
end;

procedure TdtmOperacoesOSP.qryUsuariosAfterOpen(DataSet: TDataSet);
var
 i: integer;
begin
  inherited;
  if qryOperacaoesaFechar.active then
  begin
    qryMaquinasaFechar.First;
    while not qryMaquinasaFechar.Eof do
    begin
      qryOperacaoesaFechar.first;
      for i:=0 to qryOperacaoesaFechar.recordcount -1 do
      begin
        RefazConsultaPorNome(qryUsuarioOperacoesProducao,
                             ['operacao','usuario'],
                             [qryOperacaoesaFecharoperacao.AsVariant,
                              qryUsuarioscodigo.asinteger]);

        if not qryUsuarioOperacoesProducao.IsEmpty then
        begin
          if not qryOperacaoesaFecharoperacaopermitidaaousuario.AsBoolean then
          begin
            qryOperacaoesaFechar.edit;
            qryOperacaoesaFecharoperacaopermitidaaousuario.AsBoolean := true;
            qryOperacaoesaFechar.post;
          end;

          if qryMaquinasaFechardesconsiderar.AsBoolean then
          begin
            qryMaquinasaFechar.Edit;
            qryMaquinasaFechardesconsiderar.AsBoolean := false;
            qryMaquinasaFechar.Post;
          end;

        end
        else
        begin
          if qryOperacaoesaFecharoperacaopermitidaaousuario.AsBoolean then
          begin
            qryOperacaoesaFechar.edit;
            qryOperacaoesaFecharoperacaopermitidaaousuario.AsBoolean := false;
            qryOperacaoesaFechar.post;
          end;

          if not qryMaquinasaFechardesconsiderar.AsBoolean then
          begin
            qryMaquinasaFechar.Edit;
            qryMaquinasaFechardesconsiderar.AsBoolean := true;
            qryMaquinasaFechar.Post;
          end;
        end;

        qryOperacaoesaFechar.next;
      end;
      qryMaquinasaFechar.Next;
    end;

    MarcarRegistros(qryMaquinasaFechar,qryMaquinasaFecharselecionar,false,true);
  end;
end;

procedure TdtmOperacoesOSP.MarcarSelecionados(Marcando, Todos: Boolean);
begin
  MarcarRegistros(qryMaquinasaFechar,qryMaquinasaFecharselecionar,qryMaquinasaFechardesconsiderar,marcando, todos);
end;

procedure TdtmOperacoesOSP.AbrirOperacaoesaFechar;
begin
  qryUsuarios.Close;
  qryMaquinasaFechar.Close;
  qryMaquinasaFechar.Open;
  dtmOperacoesOSP.qryOperacaoesaFechar.Close;
  dtmOperacoesOSP.qryOperacaoesaFechar.open;
  QtdeMarcados := 0;
  qryUsuariosAfterOpen(qryUsuarios);
end;

procedure TdtmOperacoesOSP.gravarOperacaoesaFechar;
var
  i: integer;
begin

//  qryMaquinasaFechar.first;

//  while not qryMaquinasaFechar.Eof do
//  begin
    if not qryMaquinasaFechardesconsiderar.AsBoolean then
    begin
      qryOperacaoesaFechar.First;
      for i:=0 to qryOperacaoesaFechar.recordcount -1 do
      begin
        qryUpdateOperacoesaFechar.parambyname('quantidade').AsCurrency := qryOperacaoesaFecharquantidadeafechar.AsCurrency;
        qryUpdateOperacoesaFechar.parambyname('termino').AsString := FormatDateTime('HH:MM:SS',now());
        qryUpdateOperacoesaFechar.parambyname('usuariotermino').Asinteger := qryUsuarioscodigo.AsInteger;
        qryUpdateOperacoesaFechar.parambyname('osp').Asinteger := qryOperacaoesaFecharosp.AsInteger;
        qryUpdateOperacoesaFechar.parambyname('lote').Asinteger := qryOperacaoesaFecharlote.AsInteger;
        qryUpdateOperacoesaFechar.parambyname('operacao').Asinteger := qryOperacaoesaFecharoperacao.AsInteger;
        qryUpdateOperacoesaFechar.parambyname('usuario').Asinteger := qryOperacaoesaFecharusuario.AsInteger;
        qryUpdateOperacoesaFechar.parambyname('data').AsDateTime := qryOperacaoesaFechardata.AsDateTime;
        qryUpdateOperacoesaFechar.parambyname('inicio').AsString := FormatDateTime('HH:MM:SS',qryOperacaoesaFecharinicio.asdatetime);

        qryUpdateOperacoesaFechar.ExecSql;

        qryOperacaoesaFechar.Next;
      end;
    end;

//    qryMaquinasaFechar.Next;
//  end;
  perpetrar([]);


end;

function TdtmOperacoesOSP.ExisteOperacoesOSPUsuariosemAberto: boolean;
var
  vRegistroAtual : TBookmark;
begin
  result := false;
  vRegistroAtual := qryOperacoesOSPUsuario.GetBookmark;
  qryOperacoesOSPUsuario.First;
  while not qryOperacoesOSPUsuario.Eof do
  begin
    if qryOperacoesOSPUsuariotermino.IsNull then
    begin
      result := true;
      break;
    end;
    qryOperacoesOSPUsuario.Next;
  end;
  qryOperacoesOSPUsuario.GotoBookmark(vRegistroAtual);
  qryOperacoesOSPUsuario.FreeBookmark(vRegistroAtual);
end;

procedure TdtmOperacoesOSP.ConcluirOperacao;
begin
  if tipoLogin in [Operador, GerenteProducao] then
  begin
    if qryOperacoesOSPInformarTerminodoProcesso.AsBoolean then
    begin
      if qryOperacoesOSPfechamentoforcado.AsBoolean then
      begin
        if tipologin = GerenteProducao then
        begin
          if MensagemSimNaoOpcaoCancelar('Confirma a reabertura desta operação?','',False) = mrYes then
          begin
            qryOperacoesOSP.Edit;
            qryOperacoesOSPfechamentoforcado.AsBoolean := false;
            qryOperacoesOSP.Post;
          end;
        end;
      end
      else
      begin
        if not ExisteOperacoesOSPUsuariosemAberto then
        begin
          if MensagemSimNaoOpcaoCancelar('Confirma a conclusão desta operação?','',False) = mrYes then
          begin
            qryOperacoesOSP.Edit;
            qryOperacoesOSPfechamentoforcado.AsBoolean := true;
            qryOperacoesOSP.Post;
          end;
        end
        else
        if TipoLogin = GerenteProducao then
          MensagemAviso('A operação não pode ser fechada pois existem operações em aberto.');
      end;
    end
    else
    if TipoLogin = GerenteProducao then
       MensagemAviso('Não é permitido ''Forçar o fechamento'' para esta operação, '+#13+
                     'Verifique a parâmetro ''INFORMAR TÉRMINO DO PROCESSO'' no cadastro de fluxogramas.');
  end;

end;

procedure TdtmOperacoesOSP.EditarOperacoesOSP;
begin
  if not (qryOperacoesOSP.State in [dsedit, dsinsert]) then
    qryOperacoesOSP.Edit;
end;

procedure TdtmOperacoesOSP.DefinirOrigemComplementar;
var
  vOrigemOperacaoalternativa: String;
  vOperacao: String;
begin
  vOperacao := qryoperacoesospoperacao.asstring;
  vOrigemOperacaoalternativa := qryOperacoesOSPorigemoperacaoalternativa.AsString;

  if qryoperacoesosp.Locate('operacao',vOrigemOperacaoalternativa,[]) then
  begin
    if qryoperacoesosptipooperacao.asstring[1]<>'D' then
    begin
      qryoperacoesosp.edit;
      qryoperacoesosptipooperacao.asstring := 'D'+qryoperacoesosptipooperacao.asstring[2]+qryoperacoesosptipooperacao.asstring[3];
      qryoperacoesosp.post;
    end;
  end;
  qryoperacoesosp.Locate('operacao',vOperacao,[]);
end;

procedure TdtmOperacoesOSP.dsrOperacoesOSPDataChange(Sender: TObject;
  Field: TField);
var
 vteste : string;
begin
  inherited;
  if field = qryoperacoesospnome then
  begin
    vteste := qryoperacoesospnome.asstring;
  end;
end;

procedure TdtmOperacoesOSP.FixarSenhaGerente;
var
  UsuarioAut: TtecUsuarios;
begin
  if UsuarioLogin.GerenteProducao then
    UsuarioAut := ObterAutorizacao(taSENHA, ctPARAAUTORIZACAOOPERACOESOSP, ctGERENTEPRODUCAO, '')
  else
    UsuarioAut := ObterAutorizacao(taLOGIN, ctPARAAUTORIZACAOOPERACOESOSP, ctGERENTEPRODUCAO, '');

  if Assigned(UsuarioAut) and UsuarioAut.GerenteProducao then
  begin
    TipoLogin := GerenteProducao;
    if SenhadoGerenteFixada then
    begin
      SenhadoGerenteFixada := false;
      TipoLogin := NaoInformado;
      qryOperacoesOSPAfterScroll(nil);
    end  
    else
    begin
      SenhadoGerenteFixada := true;
      TipoLogin := GerenteProducao;
      qryOperacoesOSPAfterScroll(nil);
    end
  end
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
//  qryOperacoesOSPUsuarioFalhas.mastersource := nil;
//  qryOperacoesOSPUsuarioParadas.mastersource := dsrOperacoesOSPUsuario;
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioFalhasFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  Accept := not (qryOperacoesOSPUsuario.state = dsinsert);
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioParadasFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  Accept := not (qryOperacoesOSPUsuario.state = dsinsert);
end;

procedure TdtmOperacoesOSP.qryOSPLotesAfterOpen(DataSet: TDataSet);
begin
  inherited;
//  qryOSPLotesAfterScroll(nil);
end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioCalcFields(
  DataSet: TDataSet);
begin
  inherited;
{
  if not qryOperacoesOSPUsuariodatatermino.isnull and
     not qryOperacoesOSPUsuariotermino.isnull then
    qryOperacoesOSPUsuariotempo.asinteger := MinutesBetween(strtodatetime(qryOperacoesOSPUsuariodata.asstring+' '+qryOperacoesOSPUsuarioinicio.AsString),
                                                            strtodatetime(qryOperacoesOSPUsuariodatatermino.asstring+' '+qryOperacoesOSPUsuariotermino.AsString))
  else
    qryOperacoesOSPUsuariotempo.clear;
    }
end;

procedure TdtmOperacoesOSP.ExcluirOperacao;
begin
  if (dtmOperacoesOSP.TipoLogin = GerenteProducao) and
     (dtmOperacoesOSP.qryOperacoesOSPtipooperacao.AsString<>'') and
     (dtmOperacoesOSP.qryOperacoesOSPtipooperacao.AsString[1] = 'D') and
      not dtmOperacoesOSP.qryOperacoesOSPorigemoperacaoalternativa.IsNull and
     (Pos('.', dtmOperacoesOSP.qryOperacoesOSPsequencia.asstring)<>0)   then
    if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['a operação de desvio de processo'])) = smbOk) then
       dtmOperacoesOSP.qryOperacoesOSP.Delete;

end;

function TdtmOperacoesOSP.Getoperacoesospusuario_numero_seq: integer;
begin
  ReFazConsulta(spcoperacoesospusuario_numero_seq,[],[]);
  result := spcoperacoesospusuario_numero_seqcodigo.AsInteger;
end;

procedure TdtmOperacoesOSP.GravarOperacoesConjugadas;
var
  vOperacao        : integer;
  vusuario         : integer;
  vnome            : string;
  vdata            : TDateTime;
  vinicio          : TTime;
  vtermino         : String;
  vquantidade      : INTEGER;
  vturno           : INTEGER;
  vusuariosetup    : INTEGER;
  vnumeromovimento : INTEGER;
  vdatatermino     : String;
  vusuariotermino  : INTEGER;
  vretrabalho      : INTEGER;
  vmaquina         : INTEGER;
  vintervalo       : INTEGER;
  vdescricaomaquina : String;
begin

  vOperacao        := qryOperacoesOSPUsuariooperacao.AsInteger;

  vusuario         := qryOperacoesOSPUsuariousuario.AsInteger;
  vNome            := qryOperacoesOSPUsuarionome.AsString;
  vdata            := qryOperacoesOSPUsuariodata.AsDateTime;
  vinicio          := qryOperacoesOSPUsuarioinicio.AsDateTime;
  vtermino         := qryOperacoesOSPUsuariotermino.AsString;
  vquantidade      := qryOperacoesOSPUsuarioquantidade.AsInteger;
  vturno           := qryOperacoesOSPUsuarioturno.AsInteger;
  vusuariosetup    := qryOperacoesOSPUsuariousuariosetup.AsInteger;
  vnumeromovimento := qryOperacoesOSPUsuarionumeromovimento.AsInteger;
  vdatatermino     := qryOperacoesOSPUsuariodatatermino.AsString;
  vusuariotermino  := qryOperacoesOSPUsuariousuariotermino.AsInteger;
  vretrabalho      := qryOperacoesOSPUsuarioretrabalho.AsInteger;
  vmaquina         := qryOperacoesOSPUsuariomaquina.AsInteger;
  vintervalo       := qryOperacoesOSPUsuariointervalo.AsInteger;
  vdescricaomaquina := qryOperacoesOSPUsuariodescricaomaquina.AsString;

  qryOperacoesOSPUsuario.AfterPost   := nil;
  qryOperacoesOSPUsuario.AfterScroll := nil;
  qryOperacoesOSPUsuarioFalhas.AfterScroll := nil;
  qryOperacoesOSPUsuario.BeforePost  := nil;

  qryOperacoesOSP.Next;


  while qryOperacoesOSPtipooperacao.AsString[2] = 'C' do
  begin
    qryOperacoesOSPUsuario.RequestLive := true;
    SetarSomenteLeitura(false);

    if not qryOperacoesOSPUsuario.Locate('usuario;data;inicio', VarArrayOf([vusuario,vdata,vinicio]),[]) then
      qryOperacoesOSPUsuario.Append
    else
      qryOperacoesOSPUsuario.edit;

    qryOperacoesOSPusuario.ReadOnly := false;

    qryOperacoesOSPUsuariousuario.AsInteger          := vusuario;
    qryOperacoesOSPUsuarionome.AsString              := vnome;
    qryOperacoesOSPUsuariodata.AsDateTime            := vdata;
    qryOperacoesOSPUsuarioinicio.AsDateTime          := vinicio ;

    if vtermino <> '' then
      qryOperacoesOSPUsuariotermino.AsString         := vtermino
    else
      qryOperacoesOSPUsuariotermino.clear;

    if vquantidade <> 0 then
      qryOperacoesOSPUsuarioquantidade.AsInteger       := vquantidade
    else
      qryOperacoesOSPUsuarioquantidade.clear;

    qryOperacoesOSPUsuarioturno.AsInteger            := vturno;

    if vusuariosetup <> 0 then
      qryOperacoesOSPUsuariousuariosetup.AsInteger     := vusuariosetup
    else
      qryOperacoesOSPUsuariousuariosetup.clear;

//      qryOperacoesOSPUsuarionumeromovimento.AsInteger  := vnumeromovimento;

    if vdatatermino <> '' then
      qryOperacoesOSPUsuariodatatermino.AsString     := vdatatermino
    else
      qryOperacoesOSPUsuariodatatermino.clear;

    if vusuariotermino <> 0 then
      qryOperacoesOSPUsuariousuariotermino.AsInteger   := vusuariotermino
    else
      qryOperacoesOSPUsuariousuariotermino.clear;

    if vretrabalho <> 0 then
      qryOperacoesOSPUsuarioretrabalho.AsInteger       := vretrabalho
    else
      qryOperacoesOSPUsuarioretrabalho.clear;

    if vmaquina <> 0 then
      qryOperacoesOSPUsuariomaquina.AsInteger          := vmaquina
    else
      qryOperacoesOSPUsuariomaquina.clear;

    if vdescricaomaquina <> '' then
      qryOperacoesOSPUsuariodescricaomaquina.AsString  := vdescricaomaquina
    else
      qryOperacoesOSPUsuariodescricaomaquina.clear;

    if vintervalo <> 0 then
      qryOperacoesOSPUsuariointervalo.AsInteger        := vintervalo
    else
      qryOperacoesOSPUsuariointervalo.clear;

    qryOperacoesOSPUsuariousuariovalidado.AsBoolean := true;
    qryOperacoesOSPUsuariousuariosetupvalidado.AsBoolean := true;
    qryOperacoesOSPUsuariousuariofechamentovalidado.AsBoolean := true;

    qryOperacoesOSPUsuario.Post;

    CalcularQuantidades;

    qryOperacoesOSP.next;
  end;

  qryOperacoesOSP.Locate('operacao', vOperacao,[]);
  qryOperacoesOSPUsuario.Locate('usuario;data;inicio', VarArrayOf([vusuario,vdata,vinicio]),[]);

  qryOperacoesOSPUsuario.AfterPost   := qryOperacoesOSPUsuarioAfterPost;
  qryOperacoesOSPUsuario.AfterScroll := qryOperacoesOSPUsuarioAfterScroll;
  qryOperacoesOSPUsuarioFalhas.AfterScroll := qryOperacoesOSPUsuarioFalhasAfterScroll;
  qryOperacoesOSPUsuario.BeforePost  := qryOperacoesOSPUsuarioBeforePost;

end;

procedure TdtmOperacoesOSP.qryOperacoesOSPNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryOperacoesOSPoperacaoconjugada.asboolean := false;
end;

function TdtmOperacoesOSP.Getoperacoesospusuariofalhas_numero_seq: integer;
begin
  ReFazConsulta(spcoperacoesospusuariofalhas_numero_seq,[],[]);
  result := spcoperacoesospusuariofalhas_numero_seqcodigo.AsInteger;

end;

procedure TdtmOperacoesOSP.qryOperacoesOSPUsuarioFalhasCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if (qryOperacoesOSPUsuarioFalhasfalhaoperacaoorigem.AsInteger<>0) then
    qryOperacoesOSPUsuarioFalhasVerNaoInfluiPremiacao.asstring := '*'
  else
    qryOperacoesOSPUsuarioFalhasVerNaoInfluiPremiacao.clear;

end;

procedure TdtmOperacoesOSP.dsrOperacoesOSPUsuarioFalhasDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  (*
  if Field = qryOperacoesOSPUsuarioFalhasquantidadeperda then
  begin
    if qryOperacoesOSPUsuarioFalhasnaoinfluipremiacao.asboolean then
    begin
      CalcularQuantidadesFalhasOperacaoOriginal;
    end;
  end;
  *)
end;

(*
procedure TdtmOperacoesOSP.CalcularQuantidadesFalhasOperacaoOriginal;
var
  vOperacaoAtual: integer;
  vSaldoFinalRateado : integer;
  vnumero_operacoesospusuariofalhas : integer;

begin
  vOperacaoAtual := qryOperacoesOSPUsuariooperacao.AsInteger;
  vnumero_operacoesospusuariofalhas := qryOperacoesOSPUsuarioFalhasnumero.AsInteger;

  RefazConsultaPorNome(qryVerificarFalhaOperacaoOrigem,['QuantidadeFalha','falha','osp','lote','sequencia','operacaoorigem'],
  [qryOperacoesOSPUsuarioFalhasquantidadeperda.Asinteger,
   qryOperacoesOSPUsuarioFalhasfalhaoperacaoorigem.AsInteger,
   qryOSPLotesosp.Asinteger,
   qryOSPLotesnumero.Asinteger,
   qryOperacoesOSPsequencia.asstring,
   qryOperacoesOSPUsuarioFalhasoperacaoorigemfalha.AsInteger]);

  vSaldoFinalRateado := 0;

  while not qryVerificarFalhaOperacaoOrigem.Eof do
  begin
    if qryOperacoesOSP.Locate('operacao',qryOperacoesOSPUsuarioFalhasoperacaoorigemfalha.AsInteger,[]) then
    begin
      if qryOperacoesOSPUsuario.Locate('numero',qryVerificarFalhaOperacaoOrigem.fieldbyname('numero').AsInteger,[]) then
      begin
        qryOperacoesOSPUsuarioFalhas.first;
        while not qryOperacoesOSPUsuarioFalhas.eof do
        begin
          if qryOperacoesOSPUsuarioFalhasnumero_operacoesospusuariofalhas.asinteger = vnumero_operacoesospusuariofalhas then
            qryOperacoesOSPUsuarioFalhas.delete
          else
            qryOperacoesOSPUsuarioFalhas.next;
        end;

        if qryVerificarFalhaOperacaoOrigem.RecNo = qryVerificarFalhaOperacaoOrigem.RecordCount then
        begin
          qryOperacoesOSPUsuarioFalhas.Append;
          qryOperacoesOSPUsuarioFalhasfalha.AsInteger := qryOperacoesOSPUsuarioFalhasfalhaoperacaoorigem.AsInteger;
          qryOperacoesOSPUsuarioFalhasdescricao.AsString := qryVerificarFalhaOperacaoOrigem.fieldbyname('descricaofalha').AsString;
          qryOperacoesOSPUsuarioFalhasquantidadeperda.AsInteger := qryListaFalhasquantidade.AsInteger - vSaldoFinalRateado;
          qryOperacoesOSPUsuarioFalhasperdatotal.AsBoolean := qryListaFalhasperdatotal.AsBoolean;
          qryOperacoesOSPUsuarioFalhasnaoinfluipremiacao.asboolean := false;
          qryOperacoesOSPUsuarioFalhasfalhavalidada.AsBoolean := true;
          qryOperacoesOSPUsuarioFalhasnumero_operacoesospusuariofalhas.AsInteger := vnumero_operacoesospusuariofalhas;
          qryOperacoesOSPUsuarioFalhas.post;
        end
        else
        begin
          qryOperacoesOSPUsuarioFalhas.Append;
          qryOperacoesOSPUsuarioFalhasfalha.AsInteger := qryListaFalhascodigo.AsInteger;
          qryOperacoesOSPUsuarioFalhasdescricao.AsString := qryListaFalhasdescricao.AsString;
          qryOperacoesOSPUsuarioFalhasquantidadeperda.AsInteger := qryVerificarFalhaOperacaoOrigem.fieldbyname('quantidadefalharateada').AsInteger;
          qryOperacoesOSPUsuarioFalhasperdatotal.AsBoolean := qryListaFalhasperdatotal.AsBoolean;
          qryOperacoesOSPUsuarioFalhasnaoinfluipremiacao.asboolean := false;
          qryOperacoesOSPUsuarioFalhasfalhavalidada.AsBoolean := true;
          qryOperacoesOSPUsuarioFalhasnumero_operacoesospusuariofalhas.AsInteger := vnumero_operacoesospusuariofalhas;
          qryOperacoesOSPUsuarioFalhas.post;
        end;

        vSaldoFinalRateado := vSaldoFinalRateado + qryVerificarFalhaOperacaoOrigem.fieldbyname('quantidadefalharateada').AsInteger;
      end;
    end;
    qryVerificarFalhaOperacaoOrigem.Next;
  end;

  qryOperacoesOSP.Locate('operacao', vOperacaoAtual,[]);

end;
*)

end.


