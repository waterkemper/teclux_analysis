unit dmcontaspagar;

interface

uses
  SysUtils, Classes, Forms, dmbasico, DB, ZQuery, ZPgSqlQuery, Math, cpquery,
  dmtecsoft, cpdatasource, ctconstantes, biblio, dateutils, clparametrossistema,
  ZTransact, clusuario, dmlancamentocontabilidade,
  dmimprimeautorizacaopagto, variants, Controls, StrUtils, AdvSmoothProgressBar,
  Provider, DBClient;

type
  TipoLancamento = (DEBITO, CREDITO);
  TipoOperacaoSaldo = (RetirarPagamento, IncluirPagamento);

  TtecDuplicatasSelecionadas = array of record
    DocumentoPag: Integer;
    DataVencto: TDateTime;
    Numero: Integer
  end;

  TdtmContasPagar = class(TdtmBasico)
    qryDocumentosPag: TtecQuery;
    dsrDocumentosPag: TtecDataSource;
    qryProcurarFornecedores: TtecQuery;
    dsrProcurarFornecedor: TtecDataSource;
    qryProcurarFornecedorescodigo: TIntegerField;
    qryConsultaFornecedores: TtecQuery;
    qryProcurarFiliais: TtecQuery;
    dsrProcurarFilial: TtecDataSource;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryProcurarFiliaiscodigo: TIntegerField;
    qryProcurarFiliaisnome: TStringField;
    dsrBanco: TtecDataSource;
    qryConsultarBancos: TtecQuery;
    qryConsultaFornecedorescodigo: TIntegerField;
    spcDocumentosPagProximo: TtecQuery;
    spcDocumentosPagProximocodigo: TIntegerField;
    qryDuplicatas: TtecQuery;
    dsrDuplicatas: TtecDataSource;
    qryConsultaDocumentosPag: TtecQuery;
    qryProcurarFornecedoresnome: TStringField;
    qryConsultaFornecedoresnome: TStringField;
    qryConsultaDocumentosPagemissao: TDateField;
    qryConsultaDocumentosPagvalor: TFloatField;
    qryConsultaDocumentosPagnome: TStringField;
    qryProcurarFornecedorestipo: TStringField;
    qryConsultaFornecedorestipo: TStringField;
    qryExisteNota: TtecQuery;
    qryExisteNotanumero: TIntegerField;
    qryExisteNotaserie: TStringField;
    dsrExisteNota: TtecDataSource;
    qryProcurarFiliaisPagamento: TtecQuery;
    qryProcurarTiposPagamento: TtecQuery;
    qryProcurarTiposPagamentocodigo: TIntegerField;
    qryProcurarTiposPagamentodescricao: TStringField;
    dsrProcurarFiliaisPagamento: TtecDataSource;
    dsrProcurarTiposPagamento: TtecDataSource;
    qryConsultaTipoPagamento: TtecQuery;
    qryConsultaTipoPagamentodescricao: TStringField;
    qryConsultaTipoPagamentocodigo: TIntegerField;
    qryProcurarFiliaisPagamentocodigo: TIntegerField;
    qryProcurarFiliaisPagamentonome: TStringField;
    qryConsultaDocumentosPagtipofornecedor: TStringField;
    qryConsultaDocumentosPagcomplemento: TStringField;
    qryConsultaDocumentosPagnumero: TIntegerField;
    qryConsultaFornecedorespessoanumero: TStringField;
    qryConsultaFornecedoresestado: TStringField;
    qryConsultaFornecedorestipocliente: TStringField;
    qryConsultaFornecedoresnomecidade: TStringField;
    qryExisteNotadocumentopag: TIntegerField;
    dsrContas: TtecDataSource;

    qryProcurarContas: TtecQuery;
    qryProcurarContasBanco: TIntegerField;
    qryProcurarContasAgencia: TIntegerField;
    qryProcurarContasConta: TIntegerField;
    qryProcurarContasDigito: TStringField;
    qryProcurarContasTitular: TStringField;
    qryProcurarContasSigla: TStringField;
    qryProcurarContasNome: TStringField;

    qryDocumentosPagNumero: TIntegerField;
    qryDocumentosPagfornecedor: TIntegerField;
    qryDocumentosPagemissao: TDateField;
    qryDocumentosPagcomplemento: TStringField;
    qryDocumentosPagfilialemissao: TIntegerField;
    qryDocumentosPagreferencia: TStringField;
    qryDocumentosPagvalor: TFloatField;
    qryDocumentosPagirretido: TFloatField;
    qryDocumentosPaginssretido: TFloatField;
    qryDocumentosPagissretido: TFloatField;
    qryDocumentosPagcofinsretido: TFloatField;
    qryDocumentosPagpisretido: TFloatField;
    qryDocumentosPagcsllretido: TFloatField;
    qryDocumentosPagtipofornecedor: TStringField;
    qryDocumentosPagprevisao: TBooleanField;
    qryDocumentosPagpedido: TIntegerField;
    qryDocumentosPaghistorico: TIntegerField;
    qryDocumentosPagValorLiquido: TCurrencyField;
    qryDocumentosPagEvento: TIntegerField;
    qryDocumentosPagdatalancto: TDateField;
    qryDuplicatasDocumentoPag: TIntegerField;
    qryDuplicatasDataVencto: TDateField;
    qryDuplicatasNumero: TIntegerField;
    qryDuplicatasValorVencto: TFloatField;
    qryDuplicatasvalordesconto: TFloatField;
    qryDuplicatasjuros: TFloatField;
    qryDuplicatastipojuros: TStringField;
    qryDuplicatasmulta: TFloatField;
    qryDuplicatastipomulta: TStringField;
    qryDuplicatasdatapagto: TDateField;
    qryDuplicatasvalorpagto: TFloatField;
    qryDuplicatasfilialpagto: TIntegerField;
    qryDuplicatasusuario: TIntegerField;
    qryDuplicatascontacredito: TIntegerField;
    qryDuplicatasobservacao: TStringField;
    qryDuplicatasautorizado: TBooleanField;
    qryDuplicatasdescricao: TStringField;
    qryDuplicatasValorAPagar: TCurrencyField;
    qryConsultarContas: TtecQuery;
    qryConsultarContasSigla: TStringField;
    qryConsultarContasNome: TStringField;
    qryConsultarContasConta: TIntegerField;
    qryConsultarContasDigito: TStringField;
    qryConsultarContasTitular: TStringField;
    qryConsultarContasBanco: TIntegerField;
    qryConsultarContasAgencia: TIntegerField;
    qryConsultarBancosSigla: TStringField;
    qryConsultarBancosCodigo: TIntegerField;
    qryConsultarBancosNome: TStringField;
    qryProcurarBancos: TtecQuery;
    qryProcurarBancosCodigo: TIntegerField;
    qryProcurarBancosSigla: TStringField;
    qryDuplicatasEvento: TIntegerField;
    qryDuplicatasOrdem: TStringField;
    qryDuplicatasBancoCobranca: TIntegerField;
    qryProcurarContascontacontabil: TIntegerField;
    qryProcurarFornecedoresdebito: TIntegerField;
    qryProcurarFornecedorescredito: TIntegerField;
    qryExisteNotacodigo: TIntegerField;
    spcLancamentosProximo: TtecQuery;
    spcLancamentosProximocodigo: TIntegerField;
    qryProcurarFornecedoresdescricaodebitoplanocontas: TStringField;
    qryProcurarFornecedoresclassificacaodebitoplanocontas: TStringField;
    qryProcurarFornecedoresdescricaocreditoplanocontas: TStringField;
    qryProcurarFornecedoresclassificacaocreditoplanocontas: TStringField;
    qryDocumentosPagImpostosRetidos: TtecQuery;
    qryDuplicatasImpostosRetidos: TtecQuery;
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
    qryDuplicatasImpostosRetidosdocumentopag: TIntegerField;
    qryDuplicatasImpostosRetidosdatavencto: TDateField;
    qryDuplicatasImpostosRetidosnumero: TIntegerField;
    qryDuplicatasImpostosRetidosvalorvencto: TFloatField;
    qryDuplicatasImpostosRetidosvalordesconto: TFloatField;
    qryDuplicatasImpostosRetidosjuros: TFloatField;
    qryDuplicatasImpostosRetidostipojuros: TStringField;
    qryDuplicatasImpostosRetidosmulta: TFloatField;
    qryDuplicatasImpostosRetidostipomulta: TStringField;
    qryDuplicatasImpostosRetidosdatapagto: TDateField;
    qryDuplicatasImpostosRetidosvalorpagto: TFloatField;
    qryDuplicatasImpostosRetidoscontapagto: TIntegerField;
    qryDuplicatasImpostosRetidoschequepagto: TIntegerField;
    qryDuplicatasImpostosRetidosfilialpagto: TIntegerField;
    qryDuplicatasImpostosRetidosbancocobranca: TIntegerField;
    qryDuplicatasImpostosRetidosusuario: TIntegerField;
    qryDuplicatasImpostosRetidostipopagamento: TIntegerField;
    qryDuplicatasImpostosRetidoscontacredito: TIntegerField;
    qryDuplicatasImpostosRetidosobservacao: TStringField;
    qryDuplicatasImpostosRetidosautorizado: TBooleanField;
    qryDuplicatasImpostosRetidosevento: TIntegerField;
    qryDocumentosPagImpostosRetidosdocumentopagorigem: TIntegerField;
    qryDocumentosPagImpostosRetidosdatavenctoorigem: TDateField;
    qryDocumentosPagImpostosRetidosnumeroorigem: TIntegerField;
    qryDocumentosPagdocumentopagorigem: TIntegerField;
    qryDocumentosPagdatavenctoorigem: TDateField;
    qryDocumentosPagnumeroorigem: TIntegerField;
    qryDuplicatasImpostosRetidos_Especifico: TtecQuery;
    qryDuplicatasImpostosRetidos_Geral: TtecQuery;
    qryVenctosImpostosRetidosEntradas: TtecQuery;
    qryVenctosImpostosRetidosEntradasdescricao: TStringField;
    qryVenctosImpostosRetidosEntradasquinzenal: TBooleanField;
    qryVenctosImpostosRetidosEntradasparametro_inicial: TStringField;
    qryVenctosImpostosRetidosEntradasdia: TIntegerField;
    qryVenctosImpostosRetidosEntradasparametro_final: TStringField;
    qryVenctosImpostosRetidosEntradasocasiao: TStringField;
    qryVenctosImpostosRetidosEntradasfornecedor: TIntegerField;
    qryVenctosImpostosRetidosEntradastipofornecedor: TStringField;
    qryDuplicatasdatavenctooriginal: TDateField;
    qryContasEntradasFiliais: TtecQuery;
    qryContasEntradasFiliaiscontacontabil: TIntegerField;
    qryContasEntradasFiliaisdescricao: TStringField;
    qryContasEntradasFiliaisclassificacao: TStringField;
    qryContasEntradasFiliaisdescricaocontacontabil: TStringField;
    qryContasEntradasFiliaisoperacao: TStringField;
    qryDocumentosPagadministrador: TBooleanField;
    qryDuplicatasnumeroaux: TIntegerField;
    qryDocumentosPagfornecedorparaiss: TIntegerField;
    qryDocumentosPagfatogerador: TStringField;
    qryDocumentosPagImpostosRetidosfatogerador: TStringField;
    qryProcurarTiposPagamentosaidadocaixa: TBooleanField;
    qryDocumentosPagpiscofinscsllretido: TFloatField;
    qryDocumentosPagcomplementoorigem: TStringField;
    qryDocumentosPagadiantamento: TBooleanField;
    qryDocumentosPagdebitar: TIntegerField;
    qryDocumentosPagtipopagamento: TIntegerField;
    qryDocumentosPagcontapagto: TIntegerField;
    qryDocumentosPagchequepagto: TIntegerField;
    qryProcurarContasdescricao: TStringField;
    qryProcurarContasclassificacao: TStringField;
    qryProcurarFornecedoresadiantamento: TIntegerField;
    qryAdiantamento: TtecQuery;
    dsrAdiantamento: TtecDataSource;
    qryAdiantamentoentrada: TFloatField;
    qryAdiantamentosaida: TFloatField;
    qryAdiantamentosaldo: TCurrencyField;
    qryAdiantamentosaidadocumento: TFloatField;
    qryDuplicatasvalorpagtooldvalue: TFloatField;
    qryDuplicatastipopagamentooldvalue: TIntegerField;
    qryAdiantamentoContabilidade: TtecQuery;
    dsrAdiantamentoContabilidade: TtecDataSource;
    qryAdiantamentoContabilidadesaldo: TFloatField;
    qryProcurarFornecedoreshistoricocontabil: TIntegerField;
    qryDuplicatasdataautorizacaopagto: TDateField;
    qryDocumentosPagcreditar: TIntegerField;
    qryDuplicatascontapagto: TIntegerField;
    qryDuplicataschequepagto: TIntegerField;
    qryDuplicatastipopagamento: TIntegerField;
    qryProximoNrLoteLanctoDuplicata: TtecQuery;
    qryProximoNrLoteLanctoDuplicataNrLote: TLargeintField;
    qryDuplicatasNrLoteContabil: TLargeintField;
    qryLotesPagamento_Duplicatas: TtecQuery;
    qryDuplicatasdatapagtoaux: TDateField;
    qryDuplicatascontapagtoaux: TIntegerField;
    qryDuplicataschequepagtoaux: TIntegerField;
    qryMovtosBancos: TtecQuery;
    qryMovtosBancosEventos: TtecQuery;
    qryMovtosBancosconta: TIntegerField;
    qryMovtosBancosdata: TDateField;
    qryMovtosBancossequencia: TIntegerField;
    qryMovtosBancoscompensacao: TDateField;
    qryMovtosBancosseqcompensacao: TIntegerField;
    qryMovtosBancosdataoriginal: TDateField;
    qryMovtosBancosevento: TIntegerField;
    qryMovtosBancostipo: TStringField;
    qryMovtosBancosorigemlancto: TStringField;
    qryMovtosBancosdocumento: TStringField;
    qryMovtosBancosobservacoes: TStringField;
    qryMovtosBancosvalor: TFloatField;
    qryMovtosBancosEventosconta: TIntegerField;
    qryMovtosBancosEventosdata: TDateField;
    qryMovtosBancosEventossequencia: TIntegerField;
    qryMovtosBancosEventosevento: TIntegerField;
    qryMovtosBancosEventostipo: TStringField;
    qryMovtosBancosEventosvalor: TFloatField;
    qryMovtosBancosEventoscontatransf: TIntegerField;
    qryMovtosBancosEventossequenciaorigem: TIntegerField;
    qryMovtosBancosEventosobservacoes: TStringField;
    qryDuplicatassequencia: TIntegerField;
    qryMovtosBancosEventossequenciaevento: TIntegerField;
    qryMovtosBancosProximaSequencia: TtecQuery;
    qryMovtosBancosProximaSequencianumero: TIntegerField;
    qryMovtosBancosProximaSequenciaEvento: TtecQuery;
    qryMovtosBancosProximaSequenciaEventonumero: TIntegerField;
    qryDuplicatassequenciaevento: TIntegerField;
    qryConta_e_Cheque: TtecQuery;
    qryLotesPagamento_Duplicatasdocumentopag: TIntegerField;
    qryLotesPagamento_Duplicatasnumero: TIntegerField;
    qryLotesPagamento_Duplicatasdatavencto: TDateField;
    qryLotesPagamento_Duplicatasvalorvencto: TFloatField;
    qryLotesPagamento_Duplicatasvalordesconto: TFloatField;
    qryLotesPagamento_Duplicatasjuros: TFloatField;
    qryLotesPagamento_Duplicatastipojuros: TStringField;
    qryLotesPagamento_Duplicatasmulta: TFloatField;
    qryLotesPagamento_Duplicatastipomulta: TStringField;
    qryLotesPagamento_Duplicatasobservacao: TStringField;
    qryLotesPagamento_Duplicatasdatapagto: TDateField;
    qryLotesPagamento_Duplicatasvalorpagto: TFloatField;
    qryLotesPagamento_Duplicataschequepagto: TIntegerField;
    qryLotesPagamento_Duplicatasbancocobranca: TIntegerField;
    qryLotesPagamento_Duplicatascontacredito: TIntegerField;
    qryLotesPagamento_Duplicatasautorizado: TBooleanField;
    qryLotesPagamento_Duplicatasfilialpagto: TIntegerField;
    qryLotesPagamento_Duplicatasusuario: TIntegerField;
    qryLotesPagamento_Duplicatastipopagamento: TIntegerField;
    qryLotesPagamento_Duplicatascontapagto: TIntegerField;
    qryLotesPagamento_Duplicatassequencia: TIntegerField;
    qryLotesPagamento_Duplicatasevento: TIntegerField;
    qryLotesPagamento_Duplicatasdataautorizacaopagto: TDateField;
    qryLotesPagamento_Duplicatasnrlotecontabil: TLargeintField;
    qryLotesPagamento_Duplicatassequenciaevento: TIntegerField;
    qryLotesPagamento_Duplicatasobservacoesmovtosbancos: TStringField;
    qryConta_e_Chequedatapagto: TDateField;
    qryConta_e_Chequenrlotecontabil: TLargeintField;
    qryConta_e_Chequesequencia: TIntegerField;
    qryLotesPagamento_Duplicatasdocumentopagretidopago: TIntegerField;
    qryLotesPagamento_DocumentosPagImpostosRetidos: TtecQuery;
    qryLotesPagamento_DuplicatasImpostosRetidos: TtecQuery;
    qryLotesPagamento_DocumentosPag: TtecQuery;
    dsrLotesPagamento_Duplicatas: TtecDataSource;
    qryLotesPagamento_DocumentosPagnumero: TIntegerField;
    qryLotesPagamento_DocumentosPagfornecedor: TIntegerField;
    qryLotesPagamento_DocumentosPagemissao: TDateField;
    qryLotesPagamento_DocumentosPagcomplemento: TStringField;
    qryLotesPagamento_DocumentosPagfilialemissao: TIntegerField;
    qryLotesPagamento_DocumentosPagpedido: TIntegerField;
    qryLotesPagamento_DocumentosPagprevisao: TBooleanField;
    qryLotesPagamento_DocumentosPagreferencia: TStringField;
    qryLotesPagamento_DocumentosPagvalor: TFloatField;
    qryLotesPagamento_DocumentosPagirretido: TFloatField;
    qryLotesPagamento_DocumentosPaginssretido: TFloatField;
    qryLotesPagamento_DocumentosPagissretido: TFloatField;
    qryLotesPagamento_DocumentosPagcofinsretido: TFloatField;
    qryLotesPagamento_DocumentosPagpisretido: TFloatField;
    qryLotesPagamento_DocumentosPagcsllretido: TFloatField;
    qryLotesPagamento_DocumentosPagtipofornecedor: TStringField;
    qryLotesPagamento_DocumentosPagevento: TIntegerField;
    qryLotesPagamento_DocumentosPagcreditar: TIntegerField;
    qryLotesPagamento_DocumentosPagdatalancto: TDateField;
    qryLotesPagamento_DocumentosPaghistorico: TIntegerField;
    qryLotesPagamento_DocumentosPagdocumentopagorigem: TIntegerField;
    qryLotesPagamento_DocumentosPagdatavenctoorigem: TDateField;
    qryLotesPagamento_DocumentosPagnumeroorigem: TIntegerField;
    qryLotesPagamento_DocumentosPagadministrador: TBooleanField;
    qryLotesPagamento_DocumentosPagfornecedorparaiss: TIntegerField;
    qryLotesPagamento_DocumentosPagfatogerador: TStringField;
    qryLotesPagamento_DocumentosPagpiscofinscsllretido: TFloatField;
    qryLotesPagamento_DocumentosPagadiantamento: TBooleanField;
    qryLotesPagamento_DocumentosPagdebitar: TIntegerField;
    qryLotesPagamento_DocumentosPagtipopagamento: TIntegerField;
    qryLotesPagamento_DocumentosPagcontapagto: TIntegerField;
    qryLotesPagamento_DocumentosPagchequepagto: TIntegerField;
    qryLotesPagamento_DocumentosPagsequencia: TIntegerField;
    qryLotesPagamento_DocumentosPagImpostosRetidosnumero: TIntegerField;
    qryLotesPagamento_DocumentosPagImpostosRetidosfornecedor: TIntegerField;
    qryLotesPagamento_DocumentosPagImpostosRetidosemissao: TDateField;
    qryLotesPagamento_DocumentosPagImpostosRetidosdatalancto: TDateField;
    qryLotesPagamento_DocumentosPagImpostosRetidoscomplemento: TStringField;
    qryLotesPagamento_DocumentosPagImpostosRetidosevento: TIntegerField;
    qryLotesPagamento_DocumentosPagImpostosRetidosfilialemissao: TIntegerField;
    qryLotesPagamento_DocumentosPagImpostosRetidosreferencia: TStringField;
    qryLotesPagamento_DocumentosPagImpostosRetidosvalor: TFloatField;
    qryLotesPagamento_DocumentosPagImpostosRetidosirretido: TFloatField;
    qryLotesPagamento_DocumentosPagImpostosRetidosinssretido: TFloatField;
    qryLotesPagamento_DocumentosPagImpostosRetidosissretido: TFloatField;
    qryLotesPagamento_DocumentosPagImpostosRetidoscofinsretido: TFloatField;
    qryLotesPagamento_DocumentosPagImpostosRetidospisretido: TFloatField;
    qryLotesPagamento_DocumentosPagImpostosRetidoscsllretido: TFloatField;
    qryLotesPagamento_DocumentosPagImpostosRetidostipofornecedor: TStringField;
    qryLotesPagamento_DocumentosPagImpostosRetidosprevisao: TBooleanField;
    qryLotesPagamento_DocumentosPagImpostosRetidospedido: TIntegerField;
    qryLotesPagamento_DocumentosPagImpostosRetidoscreditar: TIntegerField;
    qryLotesPagamento_DocumentosPagImpostosRetidoshistorico: TIntegerField;
    qryLotesPagamento_DocumentosPagImpostosRetidosdocumentopagorigem: TIntegerField;
    qryLotesPagamento_DocumentosPagImpostosRetidosdatavenctoorigem: TDateField;
    qryLotesPagamento_DocumentosPagImpostosRetidosnumeroorigem: TIntegerField;
    qryLotesPagamento_DocumentosPagImpostosRetidosfatogerador: TStringField;
    qryLotesPagamento_DuplicatasImpostosRetidosdocumentopag: TIntegerField;
    qryLotesPagamento_DuplicatasImpostosRetidosdatavencto: TDateField;
    qryLotesPagamento_DuplicatasImpostosRetidosnumero: TIntegerField;
    qryLotesPagamento_DuplicatasImpostosRetidosvalorvencto: TFloatField;
    qryLotesPagamento_DuplicatasImpostosRetidosvalordesconto: TFloatField;
    qryLotesPagamento_DuplicatasImpostosRetidosjuros: TFloatField;
    qryLotesPagamento_DuplicatasImpostosRetidostipojuros: TStringField;
    qryLotesPagamento_DuplicatasImpostosRetidosmulta: TFloatField;
    qryLotesPagamento_DuplicatasImpostosRetidostipomulta: TStringField;
    qryLotesPagamento_DuplicatasImpostosRetidosdatapagto: TDateField;
    qryLotesPagamento_DuplicatasImpostosRetidosvalorpagto: TFloatField;
    qryLotesPagamento_DuplicatasImpostosRetidoscontapagto: TIntegerField;
    qryLotesPagamento_DuplicatasImpostosRetidoschequepagto: TIntegerField;
    qryLotesPagamento_DuplicatasImpostosRetidosfilialpagto: TIntegerField;
    qryLotesPagamento_DuplicatasImpostosRetidosbancocobranca: TIntegerField;
    qryLotesPagamento_DuplicatasImpostosRetidosusuario: TIntegerField;
    qryLotesPagamento_DuplicatasImpostosRetidostipopagamento: TIntegerField;
    qryLotesPagamento_DuplicatasImpostosRetidoscontacredito: TIntegerField;
    qryLotesPagamento_DuplicatasImpostosRetidosobservacao: TStringField;
    qryLotesPagamento_DuplicatasImpostosRetidosautorizado: TBooleanField;
    qryLotesPagamento_DuplicatasImpostosRetidosevento: TIntegerField;
    dsrLotesPagamento_DocumentosPagImpostosRetidos: TtecDataSource;
    qryLotesPagamento_DocumentosPagValorLiquido: TCurrencyField;
    qryLotesPagamento_Duplicatasdatavenctooriginal: TDateField;
    qryDocumentosPagfilialcontabil: TIntegerField;
    qryProcurarFiliaiscontabil: TIntegerField;
    qryDocumentosPagImpostosRetidosfilialcontabil: TIntegerField;
    qryDocumentosPagpiscst: TStringField;
    qryDocumentosPagpisbasecalculo: TFloatField;
    qryDocumentosPagpisaliquota: TFloatField;
    qryDocumentosPagpisvalor: TFloatField;
    qryDocumentosPagcofinscst: TStringField;
    qryDocumentosPagcofinsbasecalculo: TFloatField;
    qryDocumentosPagcofinsaliquota: TFloatField;
    qryDocumentosPagcofinsvalor: TFloatField;
    qryDocumentosPagnat_bc_cred: TStringField;
    qryUltimoPagamento: TtecQuery;
    qryProcurarFornecedoreshistoricocontabilpagtoduplicata: TIntegerField;
    qryDocumentosPagregimedecaixa: TBooleanField;
    qryDuplicatasJurosPagos: TFloatField;
    qryDuplicatasDesctosObtidos: TFloatField;
    qryConsultaFornecedoresrazao: TStringField;
    qryConsultaDocumentosPagrazao: TStringField;
    qryDocumentosPagpedidos_da_nota: TStringField;
    qryDocumentosPagultimonumerodaduplicata: TIntegerField;
    qryValidarValoresDocumentosPag: TtecQuery;
    qryValidarValoresDocumentosPagok: TBooleanField;
    qryValidarValoresDocumentosPag_N: TtecQuery;
    qryValidarValoresDocumentosPag_Nok: TBooleanField;
    qryDocumentosPagEventoAnterior: TIntegerField;
    qryReinf_2010_infoTpServ: TtecQuery;
    dsrReinf_2010_infoTpServ: TtecDataSource;
    qryReinf_2010: TtecQuery;
    dsrReinf_2010: TtecDataSource;
    qryReinf_2010documentopag: TIntegerField;
    qryReinf_2010tpinscestab: TIntegerField;
    qryReinf_2010nrinscestab: TStringField;
    qryReinf_2010indobra: TIntegerField;
    qryReinf_2010cnpjprestador: TStringField;
    qryReinf_2010indcprb: TIntegerField;
    qryReinf_2010_infoTpServdocumentopag: TIntegerField;
    qryReinf_2010_infoTpServtpservico: TIntegerField;
    qryReinf_2010_infoTpServvlrbaseret: TFloatField;
    qryReinf_2010_infoTpServvlrretencao: TFloatField;
    qryReinf_2010_infoTpServvlrretsub: TFloatField;
    qryReinf_2010_infoTpServvlrnretprinc: TFloatField;
    qryReinf_2010_infoTpServvlrservicos15: TFloatField;
    qryReinf_2010_infoTpServvlrservicos20: TFloatField;
    qryReinf_2010_infoTpServvlrservicos25: TFloatField;
    qryReinf_2010_infoTpServvlradicional: TFloatField;
    qryReinf_2010_infoTpServvlrnretadic: TFloatField;
    qryReinf_2010fornecedor: TIntegerField;
    qryReinf_2010tpinscestabindobra_1: TIntegerField;
    qryReinf_2010filial: TIntegerField;
    qryReinf_2010tpinscestabindobra_2: TIntegerField;
    qryProcurarFiliaiscnpj: TStringField;
    qryreinf_tabela_06: TtecQuery;
    dsrreinf_tabela_06: TtecDataSource;
    qryreinf_tabela_06codigovisual: TIntegerField;
    qryreinf_tabela_06codigo: TIntegerField;
    qryreinf_tabela_06descricao: TStringField;
    qryreinf_tabela_06codigovisualdescricao: TStringField;
    qryReinf_2010_infoTpServtpservico_s: TStringField;
    qryProcurarFornecedorespessoanumero: TStringField;
    qryProcurarFornecedoresindcprb: TIntegerField;
    qryReinf_2010nrinscestab_0: TStringField;
    qryReinf_2010nrinscestab_1: TStringField;
    qryReinf_2010nrinscestab_2: TStringField;
    qryReinf_2010datahoraalteracaodadosreinf: TDateTimeField;
    qryReinf_2010datahoraexclusaodadosreinf: TDateTimeField;
    qryReinf_2010sdatahoraalteracaodadosreinf: TStringField;
    qryReinf_2010sdatahoraexclusaodadosreinf: TStringField;
    qryEnvioReinf_2010: TtecQuery;
    dsrEnvioReinf_2010: TtecDataSource;
    qryEnvioReinf_2010_infoTpServ: TtecQuery;
    dsrEnvioReinf_2010_infoTpServ: TtecDataSource;
    qryEnvioReinf_2010_infoTpServdocumentopag: TIntegerField;
    qryEnvioReinf_2010_infoTpServnumero: TIntegerField;
    qryEnvioReinf_2010_infoTpServtpservico: TIntegerField;
    qryEnvioReinf_2010_infoTpServvlrbaseret: TFloatField;
    qryEnvioReinf_2010_infoTpServvlrretencao: TFloatField;
    qryEnvioReinf_2010_infoTpServvlrretsub: TFloatField;
    qryEnvioReinf_2010_infoTpServvlrnretprinc: TFloatField;
    qryEnvioReinf_2010_infoTpServvlrservicos15: TFloatField;
    qryEnvioReinf_2010_infoTpServvlrservicos20: TFloatField;
    qryEnvioReinf_2010_infoTpServvlrservicos25: TFloatField;
    qryEnvioReinf_2010_infoTpServvlradicional: TFloatField;
    qryEnvioReinf_2010_infoTpServvlrnretadic: TFloatField;
    qryEnvioReinf_2010_infoTpServdescricaoservico: TStringField;
    qryEnvioReinf_2010documentopag: TIntegerField;
    qryEnvioReinf_2010datahoraprocessamento: TDateTimeField;
    qryEnvioReinf_2010operacao: TStringField;
    qryEnvioReinf_2010fornecedor: TIntegerField;
    qryEnvioReinf_2010filial: TIntegerField;
    qryEnvioReinf_2010tpinscestab: TIntegerField;
    qryEnvioReinf_2010nrinscestab: TStringField;
    qryEnvioReinf_2010indobra: TIntegerField;
    qryEnvioReinf_2010cnpjprestador: TStringField;
    qryEnvioReinf_2010indcprb: TIntegerField;
    qryEnvioReinf_2010datahoraalteracaodadosreinf: TDateTimeField;
    qryEnvioReinf_2010datahoraexclusaodadosreinf: TDateTimeField;
    qryEnvioReinf_2010stpinscestab: TStringField;
    qryEnvioReinf_2010sindobra: TStringField;
    qryEnvioReinf_2010s_operacao: TStringField;
    qryReinf_2010tipofornecedor: TStringField;
    qryReinf_2010tipofilial: TStringField;
    qryProcurarFornecedoresmaodeobra: TBooleanField;
    qryReinf_2040_recursosRep: TtecQuery;
    dsrReinf_2040_recursosRep: TtecDataSource;
    qryReinf_2040_recursosRepdocumentopag: TIntegerField;
    qryReinf_2040_recursosRepfornecedor: TIntegerField;
    qryReinf_2040_recursosReptipofornecedor: TStringField;
    qryReinf_2040_recursosRepfilial: TIntegerField;
    qryReinf_2040_recursosReptipofilial: TStringField;
    qryReinf_2040_recursosReptpinscestab: TIntegerField;
    qryReinf_2040_recursosRepnrinscestab: TStringField;
    qryReinf_2040_recursosRepcnpjassocdesp: TStringField;
    qryReinf_2040_recursosRepdatahoraalteracaodadosreinf: TDateTimeField;
    qryReinf_2040_recursosRepdatahoraexclusaodadosreinf: TDateTimeField;
    qryReinf_2040_recursosRepsdatahoraalteracaodadosreinf: TStringField;
    qryReinf_2040_recursosRepsdatahoraexclusaodadosreinf: TStringField;
    qryReinf_2040_infoRecurso: TtecQuery;
    dsrReinf_2040_infoRecurso: TtecDataSource;
    qryReinf_2040_infoRecursodocumentopag: TIntegerField;
    qryReinf_2040_infoRecursotprepasse: TIntegerField;
    qryReinf_2040_infoRecursodescrecurso: TStringField;
    qryReinf_2040_infoRecursovlrbruto: TFloatField;
    qryReinf_2040_infoRecursovlrretapur: TFloatField;
    qryReinf_2040_tpRepasse: TtecQuery;
    dsrReinf_2040_tpRepasse: TtecDataSource;
    qryReinf_2040_tpRepassecodigo: TIntegerField;
    qryReinf_2040_tpRepassedescricao: TStringField;
    qryReinf_2040_tpRepassecodigodescricao: TStringField;
    qryReinf_2040_infoRecursostprepasse: TStringField;
    qryEnvioReinf_2040_recursosRep: TtecQuery;
    dsrEnvioReinf_2040_recursosRep: TtecDataSource;
    qryEnvioReinf_2040_recursosRepdocumentopag: TIntegerField;
    qryEnvioReinf_2040_recursosRepdatahoraprocessamento: TDateTimeField;
    qryEnvioReinf_2040_recursosRepoperacao: TStringField;
    qryEnvioReinf_2040_recursosRepfornecedor: TIntegerField;
    qryEnvioReinf_2040_recursosReptipofornecedor: TStringField;
    qryEnvioReinf_2040_recursosRepfilial: TIntegerField;
    qryEnvioReinf_2040_recursosReptipofilial: TStringField;
    qryEnvioReinf_2040_recursosReptpinscestab: TIntegerField;
    qryEnvioReinf_2040_recursosRepnrinscestab: TStringField;
    qryEnvioReinf_2040_recursosRepcnpjassocdesp: TStringField;
    qryEnvioReinf_2040_recursosRepdatahoraalteracaodadosreinf: TDateTimeField;
    qryEnvioReinf_2040_recursosRepdatahoraexclusaodadosreinf: TDateTimeField;
    qryEnvioReinf_2040_recursosRepstpinscestab: TStringField;
    qryEnvioReinf_2040_recursosReps_operacao: TStringField;
    qryEnvioReinf_2040_infoRecurso: TtecQuery;
    dsrEnvioReinf_2040_infoRecurso: TtecDataSource;
    qryEnvioReinf_2040_infoRecursodocumentopag: TIntegerField;
    qryEnvioReinf_2040_infoRecursonumero: TIntegerField;
    qryEnvioReinf_2040_infoRecursotprepasse: TIntegerField;
    qryEnvioReinf_2040_infoRecursodescrecurso: TStringField;
    qryEnvioReinf_2040_infoRecursovlrbruto: TFloatField;
    qryEnvioReinf_2040_infoRecursovlrretapur: TFloatField;
    qryEnvioReinf_2040_infoRecursostprepasse: TStringField;
    qryReinf_2010_infoProcRetAd: TtecQuery;
    dsrReinf_2010_infoProcRetAd: TtecDataSource;
    dsrReinf_2010_infoProcRetPr: TtecDataSource;
    qryReinf_2010_infoProcRetPr: TtecQuery;
    qryReinf_2010_infoProcRetAddocumentopag: TIntegerField;
    qryReinf_2010_infoProcRetAdfornecedor: TIntegerField;
    qryReinf_2010_infoProcRetAdtipofornecedor: TStringField;
    qryReinf_2010_infoProcRetAdprocessojudicial: TIntegerField;
    qryReinf_2010_infoProcRetAdnumerosuspensaoexibilidadetributos: TIntegerField;
    qryReinf_2010_infoProcRetAdvaloradic: TFloatField;
    qryReinf_2010_infoProcRetAdtpprocretadic: TIntegerField;
    qryReinf_2010_infoProcRetAdnrprocretadic: TStringField;
    qryReinf_2010_infoProcRetAdcodsuspadic: TStringField;
    qryReinf_2010_infoProcRetPrdocumentopag: TIntegerField;
    qryReinf_2010_infoProcRetPrfornecedor: TIntegerField;
    qryReinf_2010_infoProcRetPrtipofornecedor: TStringField;
    qryReinf_2010_infoProcRetPrprocessojudicial: TIntegerField;
    qryReinf_2010_infoProcRetPrnumerosuspensaoexibilidadetributos: TIntegerField;
    qryReinf_2010_infoProcRetPrvalorprinc: TFloatField;
    qryReinf_2010_infoProcRetPrtpprocretprinc: TIntegerField;
    qryReinf_2010_infoProcRetPrnrprocretprinc: TStringField;
    qryReinf_2010_infoProcRetPrcodsuspprinc: TStringField;
    qryfornecedor_infoProcRetPr: TtecQuery;
    qryfornecedor_infoProcRetAd: TtecQuery;
    qryfornecedor_infoProcRetPrprocessojudicial: TIntegerField;
    qryfornecedor_infoProcRetPrnumerosuspensaoexibilidadetributos: TIntegerField;
    qryfornecedor_infoProcRetAdprocessojudicial: TIntegerField;
    qryfornecedor_infoProcRetAdnumerosuspensaoexibilidadetributos: TIntegerField;
    qryfornecedor_infoProcRetPrtpprocretprinc: TIntegerField;
    qryfornecedor_infoProcRetPrnrprocretprinc: TStringField;
    qryfornecedor_infoProcRetPrcodsuspprinc: TStringField;
    qryfornecedor_infoProcRetAdtpprocretprinc: TIntegerField;
    qryfornecedor_infoProcRetAdnrprocretprinc: TStringField;
    qryfornecedor_infoProcRetAdcodsuspprinc: TStringField;
    qryEnvioReinf_2010_infoProcRetPr: TtecQuery;
    dsrEnvioReinf_2010_infoProcRetPr: TtecDataSource;
    qryEnvioReinf_2010_infoProcRetPrdocumentopag: TIntegerField;
    qryEnvioReinf_2010_infoProcRetPrfornecedor: TIntegerField;
    qryEnvioReinf_2010_infoProcRetPrtipofornecedor: TStringField;
    qryEnvioReinf_2010_infoProcRetPrprocessojudicial: TIntegerField;
    qryEnvioReinf_2010_infoProcRetPrnumerosuspensaoexibilidadetributos: TIntegerField;
    qryEnvioReinf_2010_infoProcRetPrvalorprinc: TFloatField;
    qryEnvioReinf_2010_infoProcRetPrtpprocretprinc: TIntegerField;
    qryEnvioReinf_2010_infoProcRetPrnrprocretprinc: TStringField;
    qryEnvioReinf_2010_infoProcRetPrcodsuspprinc: TStringField;
    qryEnvioReinf_2010_infoProcRetAd: TtecQuery;
    dsrEnvioReinf_2010_infoProcRetAd: TtecDataSource;
    qryEnvioReinf_2010_infoProcRetAddocumentopag: TIntegerField;
    qryEnvioReinf_2010_infoProcRetAdfornecedor: TIntegerField;
    qryEnvioReinf_2010_infoProcRetAdtipofornecedor: TStringField;
    qryEnvioReinf_2010_infoProcRetAdprocessojudicial: TIntegerField;
    qryEnvioReinf_2010_infoProcRetAdnumerosuspensaoexibilidadetributos: TIntegerField;
    qryEnvioReinf_2010_infoProcRetAdvaloradic: TFloatField;
    qryEnvioReinf_2010_infoProcRetAdtpprocretadic: TIntegerField;
    qryEnvioReinf_2010_infoProcRetAdnrprocretadic: TStringField;
    qryEnvioReinf_2010_infoProcRetAdcodsuspadic: TStringField;
    qryReinf_2040_infoProc: TtecQuery;
    dsrReinf_2040_infoProc: TtecDataSource;
    qryReinf_2040_infoProcdocumentopag: TIntegerField;
    qryReinf_2040_infoProcfornecedor: TIntegerField;
    qryReinf_2040_infoProctipofornecedor: TStringField;
    qryReinf_2040_infoProcprocessojudicial: TIntegerField;
    qryReinf_2040_infoProcnumerosuspensaoexibilidadetributos: TIntegerField;
    qryReinf_2040_infoProcvlrnret: TFloatField;
    qryEnvioReinf_2040_infoProc: TtecQuery;
    dsrEnvioReinf_2040_infoProc: TtecDataSource;
    qryEnvioReinf_2040_infoProcdocumentopag: TIntegerField;
    qryEnvioReinf_2040_infoProcfornecedor: TIntegerField;
    qryEnvioReinf_2040_infoProctipofornecedor: TStringField;
    qryEnvioReinf_2040_infoProcprocessojudicial: TIntegerField;
    qryEnvioReinf_2040_infoProcnumerosuspensaoexibilidadetributos: TIntegerField;
    qryEnvioReinf_2040_infoProcvlrnret: TFloatField;
    qryReinf_2040_infoProctpproc: TIntegerField;
    qryReinf_2040_infoProcnrproc: TStringField;
    qryReinf_2040_infoProccodsusp: TStringField;
    qryEnvioReinf_2040_infoProctpproc: TIntegerField;
    qryEnvioReinf_2040_infoProcnrproc: TStringField;
    qryEnvioReinf_2040_infoProccodsusp: TStringField;
    qryEnvioReinf_2010numeroreinf: TIntegerField;
    qryEnvioReinf_2010tipofornecedor: TStringField;
    qryEnvioReinf_2010tipofilial: TStringField;
    qryEnvioReinf_2010nrrecarqbase: TStringField;
    qryEnvioReinf_2010_infoTpServnumeroreinf: TIntegerField;
    qryEnvioReinf_2010_infoProcRetAdnumeroreinf: TIntegerField;
    qryEnvioReinf_2010_infoProcRetPrnumeroreinf: TIntegerField;
    qryEnvioReinf_2040_recursosRepnumeroreinf: TIntegerField;
    qryEnvioReinf_2040_recursosRepnrrecarqbase: TStringField;
    qryEnvioReinf_2040_infoRecursonumeroreinf: TIntegerField;
    qryEnvioReinf_2040_infoProcnumeroreinf: TIntegerField;
    qryVerificarSituacao_Prestador_X_Reinf_2010_noMes: TtecQuery;
    qryVerificarSituacao_Prestador_X_Reinf_2010_noMesdocumentopag: TIntegerField;
    qryVerificarSituacao_Prestador_X_Reinf_2010_noMesfornecedor: TIntegerField;
    qryVerificarSituacao_Prestador_X_Reinf_2010_noMestipofornecedor: TStringField;
    qryVerificarSituacao_Prestador_X_Reinf_2010_noMesfilial: TIntegerField;
    qryVerificarSituacao_Prestador_X_Reinf_2010_noMestipofilial: TStringField;
    qryVerificarSituacao_Prestador_X_Reinf_2010_noMestpinscestabindobra_1: TIntegerField;
    qryVerificarSituacao_Prestador_X_Reinf_2010_noMestpinscestabindobra_2: TIntegerField;
    qryVerificarSituacao_Prestador_X_Reinf_2010_noMestpinscestab: TIntegerField;
    qryVerificarSituacao_Prestador_X_Reinf_2010_noMesnrinscestab: TStringField;
    qryVerificarSituacao_Prestador_X_Reinf_2010_noMesindobra: TIntegerField;
    qryVerificarSituacao_Prestador_X_Reinf_2010_noMescnpjprestador: TStringField;
    qryVerificarSituacao_Prestador_X_Reinf_2010_noMesindcprb: TIntegerField;
    qryVerificarSituacao_Prestador_X_Reinf_2010_noMesdatahoraalteracaodadosreinf: TDateTimeField;
    qryVerificarSituacao_Prestador_X_Reinf_2010_noMesdatahoraexclusaodadosreinf: TDateTimeField;
    qryDuplicatasdda: TBooleanField;
    qryProcurarFornecedoresdda: TBooleanField;
    qryDuplicatascomplemento: TStringField;
    qryDocumentosPagdatareferencia: TDateField;
    qryDuplicatasdatareferencia: TDateField;
    cdsTotalDuplicatas: TClientDataSet;
    dspTotalDuplicatas: TDataSetProvider;
    cdsTotalDuplicatasTotalValorVencto: TAggregateField;
    dsrTotalDuplicatas: TtecDataSource;
    cdsTotalDuplicatasTotalValorDesconto: TAggregateField;
    cdsTotalDuplicatastotaljuros: TAggregateField;
    cdsTotalDuplicatastotalmulta: TAggregateField;
    cdsTotalDuplicatasTotalValorAPagar: TAggregateField;
    cdsTotalDuplicatasTotalJurosPagos: TAggregateField;
    cdsTotalDuplicatasTotalvalorpagto: TAggregateField;
    cdsTotalDuplicatasToTalDesctosObtidos: TAggregateField;
    qryTotalDuplicatas: TtecQuery;
    qryTotalDuplicatasdatavencto: TDateField;
    qryTotalDuplicatasnumero: TIntegerField;
    qryTotalDuplicatasordem: TStringField;
    qryTotalDuplicatastotalvalorvencto: TFloatField;
    qryTotalDuplicatastotalvalordesconto: TFloatField;
    qryTotalDuplicatastotaljuros: TFloatField;
    qryTotalDuplicatasdatapagto: TDateField;
    qryTotalDuplicatasdatareferencia: TDateField;
    qryTotalDuplicatastotalvalorpagto: TFloatField;
    qryTotalDuplicatastotaljurospagos: TFloatField;
    qryTotalDuplicatastotaldesctosobtidos: TFloatField;
    qryTotalDuplicatasdda: TBooleanField;
    qryTotalDuplicatastotalmulta: TFloatField;
    qryTotalDuplicatastotalvalorapagar: TFloatField;
    qryDuplicatasvalorvencto_ant: TFloatField;
    qryDuplicatasmulta_ant: TFloatField;
    qryDuplicatastipomulta_ant: TStringField;
    qryDuplicatasjuros_ant: TFloatField;
    qryDuplicatastipojuros_ant: TStringField;
    qryDuplicatasvalordesconto_ant: TFloatField;
    qryDuplicatasdatavencto_ant: TDateField;
    qryDuplicatasfilialemissao_ant: TIntegerField;
    qryDocumentosPagfilialemissao_ant: TIntegerField;
    qryDuplicatasValoraPagarCalc: TCurrencyField;

    procedure qryDocumentosPagNewRecord(DataSet: TDataSet);
    procedure qryProcurarFornecedoresBeforeOpen(DataSet: TDataSet);
    procedure qryDocumentosPagBeforeClose(DataSet: TDataSet);
    procedure qryDuplicatasAfterDelete(DataSet: TDataSet);
    procedure qryDuplicatasCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dsrDuplicatasDataChange(Sender: TObject; Field: TField);
    procedure qryDocumentosPagCalcFields(DataSet: TDataSet);
    procedure dsrDocumentosPagDataChange(Sender: TObject; Field: TField);
    procedure qryDuplicatasjurosGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryDuplicatasmultaGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryDocumentosPagAfterScroll(DataSet: TDataSet);
    procedure qryVenctosImpostosRetidosEntradasAfterOpen(
      DataSet: TDataSet);
    procedure qryDocumentosPagImpostosRetidosAfterScroll(
      DataSet: TDataSet);
    procedure qryDocumentosPagImpostosRetidosBeforeDelete(
      DataSet: TDataSet);
    procedure qryDuplicatasImpostosRetidosAfterOpen(DataSet: TDataSet);
    procedure qryDocumentosPagAfterClose(DataSet: TDataSet);
    procedure qryDuplicatasAfterPost(DataSet: TDataSet);
    procedure qryDuplicatasAfterScroll(DataSet: TDataSet);
    procedure qryDuplicatasAfterOpen(DataSet: TDataSet);
    procedure qryDocumentosPagBeforeOpen(DataSet: TDataSet);
    procedure qryDuplicatasNewRecord(DataSet: TDataSet);
    procedure qryDuplicatasBeforePost(DataSet: TDataSet);
    procedure qryAdiantamentoCalcFields(DataSet: TDataSet);
    procedure qryDocumentosPagAfterEdit(DataSet: TDataSet);
    procedure qryLotesPagamento_DuplicatasAfterOpen(DataSet: TDataSet);
    procedure qryLotesPagamento_DocumentosPagCalcFields(DataSet: TDataSet);
    procedure qryDocumentosPagBeforePost(DataSet: TDataSet);
    procedure qryReinf_2010BeforePost(DataSet: TDataSet);
    procedure dsrReinf_2010DataChange(Sender: TObject; Field: TField);
    procedure qryReinf_2010AfterEdit(DataSet: TDataSet);
    procedure qryReinf_2010AfterInsert(DataSet: TDataSet);
    procedure qryReinf_2010_infoTpServAfterEdit(DataSet: TDataSet);
    procedure qryReinf_2010_infoTpServAfterInsert(DataSet: TDataSet);
    procedure qryReinf_2010NewRecord(DataSet: TDataSet);
    procedure qryReinf_2010nrinscestab_0GetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryDocumentosPagBeforeEdit(DataSet: TDataSet);
    procedure qryReinf_2010CalcFields(DataSet: TDataSet);
    procedure qryReinf_2010AfterOpen(DataSet: TDataSet);
    procedure qryReinf_2010_infoTpServAfterOpen(DataSet: TDataSet);
    procedure qryReinf_2010_infoTpServNewRecord(DataSet: TDataSet);
    procedure qryReinf_2010AfterDelete(DataSet: TDataSet);
    procedure qryReinf_2040_recursosRepCalcFields(DataSet: TDataSet);
    procedure qryReinf_2040_recursosRepNewRecord(DataSet: TDataSet);
    procedure qryReinf_2040_infoRecursoNewRecord(DataSet: TDataSet);
    procedure qryReinf_2040_infoRecursoAfterEdit(DataSet: TDataSet);
    procedure qryReinf_2040_infoRecursoAfterInsert(DataSet: TDataSet);
    procedure qryReinf_2040_infoRecursoAfterOpen(DataSet: TDataSet);
    procedure qryReinf_2040_recursosRepBeforePost(DataSet: TDataSet);
    procedure qryReinf_2010_infoProcRetPrAfterEdit(DataSet: TDataSet);
    procedure qryReinf_2010_infoProcRetAdAfterEdit(DataSet: TDataSet);
    procedure qryReinf_2010_infoProcRetAdAfterInsert(DataSet: TDataSet);
    procedure qryReinf_2010_infoProcRetPrAfterInsert(DataSet: TDataSet);
    procedure qryReinf_2010_infoProcRetAdAfterOpen(DataSet: TDataSet);
    procedure qryReinf_2010_infoProcRetPrAfterOpen(DataSet: TDataSet);
    procedure qryReinf_2040_infoProcAfterEdit(DataSet: TDataSet);
    procedure qryReinf_2040_infoProcAfterInsert(DataSet: TDataSet);
    procedure qryReinf_2040_infoProcAfterOpen(DataSet: TDataSet);
    procedure qryReinf_2010_infoProcRetPrAfterPost(DataSet: TDataSet);
    procedure qryReinf_2010_infoProcRetAdAfterPost(DataSet: TDataSet);
    procedure qryReinf_2010_infoTpServAfterPost(DataSet: TDataSet);
    procedure qryReinf_2040_infoProcAfterPost(DataSet: TDataSet);
    procedure qryReinf_2040_infoRecursoAfterPost(DataSet: TDataSet);
    procedure qryReinf_2040_infoRecursoAfterDelete(DataSet: TDataSet);
    procedure cdsTotalDuplicatasCalcFields(DataSet: TDataSet);
    procedure cdsTotalDuplicatasAfterOpen(DataSet: TDataSet);
    procedure cdsTotalDuplicatasBeforeClose(DataSet: TDataSet);

  private
    vPosition : dOUBLE;
    vDataPagtoCancelada: TdateTime;
    DuplicatasSelecionadas: TtecDuplicatasSelecionadas;
    FLancamentosOK: Boolean;
    fPermiteAlterarContabilidade: boolean;
    fOrigem: String;
    fDescricaoOrigem: String;
    fNrOrigem: integer;
    fTituloOrigem: String;
    fVenctosImpostosRetidosEntradasAfterOpen: TNotifyEvent;
    fExisteQuitacaoImpostosRetidosDuplicatas: Boolean;
    fExisteQuitacaoImpostosRetidosNotas: Boolean;
    FAfterOpenDocumentosPag: TNotifyEvent;
    FSomenteLeituraContabilidade: Boolean;
    FForadoLimitedaDataContabil: Boolean;
    FAdiantamentoFornecedor: Boolean;
    FDuplicatastipopagamentoChange: TNotifyEvent;
    FDuplicatasContaPagtoChange: TNotifyEvent;
    FExisteQuitacao: Boolean;
    FSaldoAdiantamento: Currency;
    fExisteDuplicatasemAberto: Boolean;
    FAfterScrollDuplicatas: TNotifyEvent;
    fExibirMensagemDesconto: Boolean;
    fehMultiploPagamento: Boolean;
    FDuplicatasDataPagtoError: TNotifyEvent;
    fehMultiploPagamentoCheque: Boolean;
    fdescricaohistoricopagamento: String;
    fOrigemImpostosRetidos: TOrigemImpostosRetidos;
    FOperacao: TtecTipoOperacaoDuplicatas;
    function GetConsultarEventos: TtecQuery;
    function GetConsultarContaPagto: TtecQuery;
    function GetPermiteAlterarContabilidade: boolean;
    function GetListaContasContabeis: String;
    function GetDescricaoOrigem: String;
    function GetNrOrigem: Integer;
    function GetTituloOrigem: String;
    function GetExisteDuplicatas: boolean;
    function GetPagamentosVinculados: String;
    function ExistenaListadeDuplicatasSelecionadas: boolean;
    function GetProximoNrLancto: integer;
    procedure SetProximoNrLancto(const Value: integer);
    function GetIncluindoDocumentoPag: Boolean;
    procedure SetFornecedorParaISS(const Value: integer);
    function GetAdiantamentoFornecedor: Boolean;
    procedure SetAdiantamentoFornecedor(const Value: Boolean);
    function GetExisteQuitacao: Boolean;
    function GetSaldoAdiantamento: Currency;
    function GetRefazerPagamento: Boolean;
    function ValidarValoresDocumentosPag(ContaPagto: integer; DataPagto: TDateTime; Sequencia: integer; ehCancelamento: boolean = false): boolean; overload;
    function ValidarValoresDocumentosPag(DocumentoPag: integer): boolean; overload;

    function VerificarSituacao_Prestador_X_Reinf_2010_noMes: boolean;
    procedure ShowProgress(Exibir: Boolean);



  protected

    FValorCalculado: Currency;
    FDataContabil: TDateTime;
    OperacaoContasaPagar : TtecTipoOperacaoDuplicatas;
    function GetDataEmissao: String;
    function GetDuplicataQuitada: Boolean;
    function GetExisteNota: Boolean;
    function GetTipoJuros: String;
    function GetTipoMulta: String;
    function GetTipoPessoa: String;
    function GetConsultarDocumentosPag: TtecQuery;
    function GetConsultarTiposPagamento: TtecQuery;
    function TotalImpostosRetidos: Currency;
    function GetTabelaDuplicatas: TtecQuery;
    function GetEditandoTabelaDuplicatas: Boolean;
    function GetConsultarFiliais: TtecQuery;
    function GetConsultarFornecedores: TtecQuery;
    function GetTabelaDocumentosPag: TtecQuery;
    function GetConsultarBancosVencto: TtecQuery;
    function GetDuplicataAutorizada: Boolean;
    function TotalDuplicatas: Currency;
    procedure AjustarSequencias;
    procedure CalcularSaldoAdiantamento;
    function ValidarSaldoAdiantamento: Boolean;

    function ListadeDuplicatas(Tipo: String; SomenteAtual: Boolean): String;


  public
    fRefazerPagamento: Boolean;
  
    FContrapartidaAlterada: Boolean;
    FProximoNrLancto: integer;
    FListaContasContabeis: String;
    fdescricaohistorico: String;
    FPagamentosVinculados: String;
    FExisteDuplicatas: boolean;

    function CancelarQuitacao: Boolean;
    procedure EdicaoCampos(Bloquear: Boolean);
    function PermiteAlterarDocumento: Boolean;
    function PermiteGerarDuplicata: Boolean;

    function PermiteAlterarEvento: Boolean;

    function PermiteAlterarPagamento: Boolean;
    function PermiteAlterarVencimento:Boolean;
    function PermiteExcluirDuplicata: Boolean;
    function PermiteCancelarDuplicata: Boolean;

    property PermiteAlterarContabilidade: boolean read GetPermiteAlterarContabilidade write fPermiteAlterarContabilidade;
    function IncluirContasPagar: Boolean;
    function IncluirAdiantamento: Boolean;

    function IncluirDuplicatas(Operacao: TtecTipoOperacaoDuplicatas):Boolean;

    function calcular_valor_pagar_(forced: Boolean = False): Currency;
    function ExcluirContasPagar: Boolean;
    function ExcluirDuplicatas: Boolean;

    function GravarContasPagar(Operacao: TtecTipoOperacaoDuplicatas; CancelarTodos: Boolean = False): Boolean;
    function GravarDuplicatas(Operacao: TtecTipoOperacaoDuplicatas): Boolean;
    procedure GravarObservacaoDuplicatas;

    function GravarDuplicatasPagamentos: Boolean;

    procedure GerarParcelas(NP: Integer; Vencto: TDateTime; Intervalo: Integer; TipoJuros, TipoMulta: Char; ValorJuros,ValorMulta: Real);
    procedure AbrirTabelasConsulta(TipoPesquisa: TtecQuitacaoDuplicatas);
    procedure FecharTabelasConsulta(TipoPesquisa: TtecQuitacaoDuplicatas);
    procedure Selecionar(TipoPesquisa: TtecQuitacaoDuplicatas);
    function ExisteDocumentosPag(Campo, Codigo: String): Boolean;
    function ExisteFiliais(Campo, Codigo: string): Boolean;
    function ExisteFornecedores(Campo, Codigo: string): Boolean;
    function ExisteEventos(Campo, Codigo: string): Boolean;
    function ExisteBancosVencto(Campo, Codigo: string): Boolean;

    property ConsultarBancosVencto: TtecQuery read GetConsultarBancosVencto;

    function ExisteConta(Campo, Codigo: string): Boolean;

    function ExisteTiposPagamento(Campo, Codigo: String): Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property TabelaDocumentosPag: TtecQuery read GetTabelaDocumentosPag;
    property TabelaDuplicatas: TtecQuery read GetTabelaDuplicatas;
    property ConsultarTiposPagamento: TtecQuery read GetConsultarTiposPagamento;
    property ConsultarContaPagto: TtecQuery read GetConsultarContaPagto;
    property ConsultarFiliais: TtecQuery read GetConsultarFiliais;
    property ConsultarFornecedores: TtecQuery read GetConsultarFornecedores;
    property ConsultarEventos: TtecQuery read GetConsultarEventos;

    property ConsultarDocumentosPag: TtecQuery read GetConsultarDocumentosPag;
    property EditandoTabelaDuplicatas: Boolean read GetEditandoTabelaDuplicatas;
    property ExisteNota: Boolean read GetExisteNota;
    property TipoPessoa: String read GetTipoPessoa;
    property TipoJuros: String read GetTipoJuros;
    property TipoMulta: String read GetTipoMulta;
    property DataContabil: TDateTime read FDataContabil write FDataContabil;
    property DataEmissao: String read GetDataEmissao;
    property DuplicataQuitada: Boolean read GetDuplicataQuitada;
    property DuplicataAutorizada: Boolean read GetDuplicataAutorizada;
    property ListaContasContabeis: String read GetListaContasContabeis write FListaContasContabeis;
    property DescricaoOrigem: String read GetDescricaoOrigem write fDescricaoOrigem;
    property NrOrigem: integer read GetNrOrigem write fNrOrigem;
    property TituloOrigem: String read GetTituloOrigem write fTituloOrigem;
    property ExisteDuplicatas: boolean read GetExisteDuplicatas write FExisteDuplicatas;
    function getdescricaohistorico: String;
    function getdescricaohistoricopagamento: String;


    property descricaohistorico:String read getdescricaohistorico write fdescricaohistorico;
    property descricaohistoricopagamento:String read getdescricaohistoricopagamento write fdescricaohistoricopagamento;


    property PagamentosVinculados: String read GetPagamentosVinculados write FPagamentosVinculados;

    function AbrirDocumentos(DocumentoPag, NumeroDuplicata: Integer;
                             DataVencto: TDateTime): Boolean;

    procedure FecharDocumentos;
    function QuitarDuplicatas(DocumentoPag,
                              NumeroDuplicata,
                              FilialPagto,
                              TipoPagto,
                              ContaBancaria,
                              ContaCreditoContabil: integer;
                              Cheque, Observacao: String;
                              DataVencto,
                              DataQuitacao: tDateTime;
                              ValorPagamento: Currency;
                              ValorDesconto: Currency;
                              AgruparPagamentosnoLote: Boolean;
                              SequenciaMovtosBancos, NrLoteContabil: String): Boolean;

    function DesQuitarDuplicatas(DocumentoPag,
                                 NumeroDuplicata: integer;
                                 DataVencto: tDateTime;
                                 ListaDuplicatas: TtecDuplicatasSelecionadas
                                 ): Boolean;

    procedure ReabrirDocumentoPag;
    procedure ReabrirDuplicatas;
    procedure AbrirDocumentoPag(Numero: integer);

    property VenctosImpostosRetidosEntradasAfterOpen: TNotifyEvent
             read fVenctosImpostosRetidosEntradasAfterOpen
             write fVenctosImpostosRetidosEntradasAfterOpen;

    property ExisteQuitacaoImpostosRetidosDuplicatas: Boolean
             read fExisteQuitacaoImpostosRetidosDuplicatas
             write fExisteQuitacaoImpostosRetidosDuplicatas;

    property ExisteQuitacaoImpostosRetidosNotas: Boolean
             read fExisteQuitacaoImpostosRetidosNotas
             write fExisteQuitacaoImpostosRetidosNotas;

    property ProximoNrLancto: integer read GetProximoNrLancto write SetProximoNrLancto;

    function GetValordaNota: Currency;
    function GetValorVencto: Currency;
    function GetValorPagto: Currency;

    function GetValorDespesasFinanceiras: Currency;
    function GetValorDescontos: Currency;

    function GetCofinsRetido: Currency;
    function GetCSLLRetido: Currency;
    function GetINSSRetido: Currency;
    function GetIRRetido: Currency;
    function GetISSRetido: Currency;
    function GetPISRetido: Currency;
    function GetPISCOFINSCSLLRetido: Currency;
    function GetDataDocumento: TDateTime;
    function GetDataPagamento: TDateTime;

    function GetDebitoFornecedor: Integer;
    function GetFornecedorParaISS: Integer;
    function GetCreditoFornecedor: Integer;
    function GetGerarDocumentoPag: Boolean;
    function GetFilialDocumento: Integer;
    function GetCodigoDocumento: Int64;
    function Getnrlotecontabil: int64;
    function GetnrlotecontabilDuplicata: int64;

    function GetContaCreditoPagamento: Integer;

    function GetContaCreditar: integer;
    function GetContaDebitar: integer;

    function GetHistoricoDebitar: integer;
    function GetHistoricoPadrao : Integer;
    function GetHistoricoPadraoPagamento : Integer;

    function GetOrigemFormulario: String;
    function GetOrigem: String;


    function GetDocumentoPossuiOrigem: Boolean;
    function GetEvento : Integer;

    procedure AtribuirContaCreditoDocumentoPag(Conta,Historico: Integer;
                                               excluir: Boolean);
    procedure EditarDocumento;
    property IncluindoDocumentoPag: Boolean Read GetIncluindoDocumentoPag;
    property AfterOpenDocumentosPag: TNotifyEvent read FAfterOpenDocumentosPag write FAfterOpenDocumentosPag;
    property AfterScrollDuplicatas: TNotifyEvent read FAfterScrollDuplicatas write FAfterScrollDuplicatas;
    function GetSomenteLeituraContabilidade: Boolean;
    property SomenteLeituraContabilidade: Boolean read GetSomenteLeituraContabilidade write FSomenteLeituraContabilidade;
    property ForadoLimitedaDataContabil: Boolean read FForadoLimitedaDataContabil write FForadoLimitedaDataContabil;
    property FornecedorParaISS: integer write SetFornecedorParaISS;
    function VerificarChequeCadastrado: Boolean;
    property AdiantamentoFornecedor: Boolean read GetAdiantamentoFornecedor write SetAdiantamentoFornecedor;
    property DuplicatastipopagamentoChange: TNotifyEvent read FDuplicatastipopagamentoChange write FDuplicatastipopagamentoChange;
    property DuplicatasContaPagtoChange: TNotifyEvent read FDuplicatasContaPagtoChange write FDuplicatasContaPagtoChange;
    property DuplicatasDataPagtoError: TNotifyEvent read FDuplicatasDataPagtoError write FDuplicatasDataPagtoError;


    property ExisteQuitacao: Boolean read GetExisteQuitacao write FExisteQuitacao;
    property ExisteDuplicatasemAberto: Boolean read fExisteDuplicatasemAberto write fExisteDuplicatasemAberto;
    property SaldoAdiantamento: Currency read GetSaldoAdiantamento write FSaldoAdiantamento;

    procedure ImprimirAutorizacoes;
    procedure ImprimirRecibo;

    property Origem: String read GetOrigem write fOrigem;
    property ExibirMensagemDesconto: Boolean read fExibirMensagemDesconto write fExibirMensagemDesconto default true;
    function GetehMultiploPagamento: Boolean;
    property ehMultiploPagamento: Boolean read GetehMultiploPagamento write fehMultiploPagamento;
    property ehMultiploPagamentoCheque: Boolean read fehMultiploPagamentoCheque write fehMultiploPagamentoCheque;
    property OrigemImpostosRetidos: TOrigemImpostosRetidos read fOrigemImpostosRetidos write fOrigemImpostosRetidos;
    property RefazerPagamento: Boolean read GetRefazerPagamento write fRefazerPagamento;
    procedure ExcluirReinf2010;
    procedure ExcluirReinf2040;

    procedure Gerarfornecedor_infoProcRetPr;
    procedure Gerarfornecedor_infoProc;
    procedure Gerarfornecedor_infoProcRetAd;

    Function ExibirFicha(FormOrigem: String): boolean;

    property Operacao: TtecTipoOperacaoDuplicatas read FOperacao write FOperacao;

    function ValidarPagamento(OrigemClass: TClass): Boolean;



end;


const
  SQLListaContaContabil =   'and (codigo = %s or codigo not in (%s))';

var
    dtmContasPagar: TdtmContasPagar;
    fViaLote_: boolean;
    CodClienteAnt: Integer;
    TipoClienteAnt: String;

  

implementation

uses fmcadastroduplicatascontaspagar, fmContasPagar, fmQuitacaoDuplicatas;


{$R *.dfm}

{ TdtmContasPagar }

procedure TdtmContasPagar.AbrirTabelasConsulta(TipoPesquisa: TtecQuitacaoDuplicatas);
begin
  case TipoPesquisa of
    dupDOCUMENTOSPAG: begin
                        qryConsultaDocumentosPag.MacroByName('todos').AsString:= 'and (d.numero = 0)';
                        if not (UsuarioLogin.Administrador or UsuarioLogin.Suporte) then
                          qryConsultaDocumentosPag.MacroByName('Administrador').AsString:= 'and not d.administrador';
                        fecha(ctConsultaDocumentosPag);
                        Abre(ctConsultaDocumentosPag);
                      end;
    dupFILIAIS,
    dupFILIAISPAGTO : Abre(ctConsultaFiliais);
    dupFORNECEDORES : begin
                        qryConsultaFornecedores.Sql[08]:= 'Where (v.codigo = 0)';
                        Abre(ctConsultaFornecedores);
                      end;

    dupEVENTO:        Abre(ctConsultaEventos);

    dupBANCOVENCTO:   Abre(ctConsultaBancos);


    dupCONTA,
    dupCONTADOCUMENTOSPAG:
    begin
      qryProcurarContas.Params[0].AsInteger:= qryDuplicatascontapagto.AsInteger;
      Abre(ctConsultaContas);
    end;

    dupTIPOPAGTO,
    dupTIPOPAGTODOCUMENTOSPAG  : Abre(ctConsultaTipoPagamento);
  end;
end;

function TdtmContasPagar.CancelarQuitacao: Boolean;
var
  vCancelarTodos: Boolean;
  vRegistroAtual: TBookMark;

  function Cancelar(limparNrLote: Boolean = False): boolean;
  begin
    result := true;

    dsrDuplicatas.OnDataChange := nil;

    qryDuplicatas.Edit;

    vDataPagtoCancelada := qryDuplicatasdatapagto.asdatetime;
    qryDuplicatasdatapagto.Clear;
//    qryDuplicatasvalorpagto.Clear;
    qryDuplicatasfilialpagto.Clear;
    qryDuplicatascontapagto.Clear;
    qryDuplicataschequepagto.clear;
    qryDuplicatastipopagamento.clear;
    qryDuplicatascontacredito.Clear;

    if limparNrLote then  //ira usar o lote do registro atual para apagar todos os lancamentos
    begin
      qryDuplicatasNrLoteContabil.Clear;
      qryDuplicatassequencia.Clear;
      qryDuplicatassequenciaevento.Clear;

      qryDuplicatasvalorpagto.Clear;
//      qryDuplicatasduplicatapaga.AsBoolean := False;
      qryDuplicatasEvento.Clear;

    end;

    qryDuplicatasautorizado.AsBoolean:= True;
    qryDuplicatasdataautorizacaopagto.AsDateTime := now;
//    qryDuplicatasduplicatapaga.Clear;


    qryDuplicatas.Post;
    if qryDocumentosPag.ReadOnly then
      qryDocumentosPag.ReadOnly:= False;
    qryDocumentosPag.Edit;

    dsrDuplicatas.OnDataChange := dsrDuplicatasDataChange;
  end;

  function ExisteQuitacaodeImpostosRetidosnoLote: boolean;
  begin
    result := false;
    qryLotesPagamento_Duplicatas.First;
    while not qryLotesPagamento_Duplicatas.Eof do
    begin
      if qryLotesPagamento_Duplicatasdocumentopagretidopago.AsInteger <> 0 then
      begin
        result := true;
        break;
      end
      else
        qryLotesPagamento_Duplicatas.next
    end;
  end;

begin
  vCancelarTodos := false;

  result := false;
  if not qryDuplicatas.IsEmpty then
  begin
    if fvialote_ or fRefazerPagamento then
      result := Cancelar
    else
    if (MensagemConfirmacao('O pagamento da duplicata será cancelado. Confirma?') = smbOK) then
    begin
      if qryLotesPagamento_Duplicatas.RecordCount <> 0 then
      begin
        case  MensagemSelecionaOpcao(ifthen((qryDuplicatascontapagto.AsInteger<>0) and (qryDuplicataschequepagto.AsInteger<>0),
                                        ctCANCELAMENTOQUITACAOCHEQUE,
                                        ctCANCELAMENTOQUITACAOLOTE)) of
        smbYES : begin
                   if ExisteQuitacaodeImpostosRetidosnoLote then

                        MensagemErro(format(ctEXISTEPAGTOIMPOSTOSVINCULADOS,
                              [qryLotesPagamento_Duplicatasdocumentopag.asstring+', Vencto: '+
                            qryLotesPagamento_Duplicatasdatavencto.asstring+', N.: '+
                            qryLotesPagamento_Duplicatasnumero.asstring,
                            qryLotesPagamento_Duplicatasdocumentopagretidopago.asstring]))

                   else
                   begin
                     vCancelarTodos := true;
                     qryDuplicatas.AfterScroll := nil;
                     qryLotesPagamento_Duplicatas.First;
                     while not qryLotesPagamento_Duplicatas.Eof do
                     begin
                       vRegistroAtual := qryDuplicatas.GetBookmark;
                       if qryDuplicatas.Locate('documentopag; datavencto; numero', VarArrayOf([
                          qryLotesPagamento_Duplicatasdocumentopag.AsVariant,
                          qryLotesPagamento_Duplicatasdatavencto.asdatetime,
                          qryLotesPagamento_Duplicatasnumero.AsVariant]),[]) then
                          Cancelar(true);
                       qryduplicatas.GotoBookmark(vRegistroAtual);
                       qryduplicatas.FreeBookmark(vRegistroAtual);

                       qryLotesPagamento_Duplicatas.Edit;
                       qryLotesPagamento_Duplicatasdatapagto.Clear;
                       qryLotesPagamento_Duplicatasvalorpagto.Clear;
                       qryLotesPagamento_Duplicatasfilialpagto.Clear;
                       qryLotesPagamento_Duplicatascontapagto.Clear;
                       qryLotesPagamento_Duplicataschequepagto.Clear;
                       qryLotesPagamento_Duplicatastipopagamento.Clear;
                       qryLotesPagamento_Duplicatascontacredito.Clear;
                       qryLotesPagamento_Duplicatasnrlotecontabil.Clear;

                       qryLotesPagamento_Duplicatassequencia.Clear;
                       qryLotesPagamento_Duplicatassequenciaevento.Clear;

                       qryLotesPagamento_Duplicatasautorizado.AsBoolean:= True;
                       qryLotesPagamento_Duplicatasdataautorizacaopagto.AsDateTime := now;

                       qryLotesPagamento_Duplicatas.Post;
                       qryLotesPagamento_Duplicatas.Next;

                     end;
                     result := Cancelar;

                     qryDuplicatas.AfterScroll := qryDuplicatasAfterScroll;
                   end;
                 end;

        smbNo : result := Cancelar;
        end;
      end
      else
        result := Cancelar;
    end;

    if result then
      result := GravarContasPagar(topCANCELAR, vCancelarTodos);

  end;
end;

constructor TdtmContasPagar.Create(AOwner: TComponent);
begin
  inherited;
  qryDocumentosPag.       Tag:= ctTabelas;
  qryDuplicatas.          Tag:= ctTabelas;
  qryProcurarBancos.      Tag:= ctTabelas;
  qryConsultarContas.     Tag:= ctTabelas;

  qryVenctosImpostosRetidosEntradas.tag := ctTabelas;
  qryVenctosImpostosRetidosEntradas.ParamByName('filial').AsInteger := FilialBase;


  qryConsultaFiliais.     Tag:= ctConsultaFiliais;
  qryConsultaFornecedores.Tag:= ctConsultaFornecedores;
  qryConsultarBancos.     Tag:= ctConsultaBancos;

//--------------------------------------------------------------
  qryConsultaDocumentosPag.Tag     := ctConsultaDocumentosPag;
  qryConsultaTipoPagamento.Tag     := ctConsultaTipoPagamento;
//-------------------------------------------------------------- Idem
//  qryConsultaAgenciasVencimento.Tag := ctPagamentoConsultaAgencias;
//--------------------------------------------------------------
  FDataContabil:= ParSistema.DataContabil;

  FLancamentosOK := True;

  qryDocumentosPagEvento.Required := (DataServidor >= ParSistema.InicioIntegracaoBancos) and
                                     (ParSistema.InicioIntegracaoBancos>StrToDateTime('01/01/1980'));

  FProximoNrLancto := 0;
  FSomenteLeituraContabilidade := not UsuarioLogin.AlterarDadosContabeis;

  OrigemImpostosRetidos := CadastroDuplicatas;

  fViaLote_ := false;

  ExibirMensagemDesconto := true;

//  qryreinf_tabela_06.Tag := ctTabelas;
//  qryReinf_2040_tpRepasse.Tag := ctTabelas;
  
end;

procedure TdtmContasPagar.EdicaoCampos(Bloquear: Boolean);
begin
  qryDocumentosPagemissao.ReadOnly      := ExisteNota or Bloquear or
                                           ExisteQuitacaoImpostosRetidosNotas;

  qryDocumentosPagdatalancto.ReadOnly   := ExisteNota or Bloquear or
                                           ExisteQuitacaoImpostosRetidosNotas;

  qryDocumentosPagfornecedor.ReadOnly   := ExisteNota or Bloquear;

  qryDocumentosPagfilialemissao.ReadOnly:= ExisteNota or Bloquear or
                                           ExisteQuitacaoImpostosRetidosDuplicatas or
                                           ExisteQuitacaoImpostosRetidosNotas;

  qryDocumentosPagvalor.ReadOnly        := ExisteNota or Bloquear or
                                           ExisteQuitacaoImpostosRetidosDuplicatas or
                                           ExisteQuitacaoImpostosRetidosNotas;

  qryDocumentosPagcomplemento.ReadOnly  := ExisteNota or Bloquear;

  qryDocumentosPagprevisao.ReadOnly     := ExisteNota or ExisteQuitacao or Bloquear;

  qryDocumentosPagirretido.ReadOnly     := ExisteNota or Bloquear or
                                           ExisteQuitacaoImpostosRetidosDuplicatas or
                                           ExisteQuitacaoImpostosRetidosNotas;

  qryDocumentosPaginssretido.ReadOnly   := ExisteNota or Bloquear or
                                           ExisteQuitacaoImpostosRetidosDuplicatas or
                                           ExisteQuitacaoImpostosRetidosNotas;

  qryDocumentosPagissretido.ReadOnly    := ExisteNota or Bloquear or
                                           ExisteQuitacaoImpostosRetidosDuplicatas or
                                           ExisteQuitacaoImpostosRetidosNotas;

  qryDocumentosPagpisretido.ReadOnly    := ExisteNota or Bloquear or
                                           ExisteQuitacaoImpostosRetidosDuplicatas or
                                           ExisteQuitacaoImpostosRetidosNotas;

  qryDocumentosPagpiscofinscsllretido.ReadOnly    := ExisteNota or Bloquear or
                                           ExisteQuitacaoImpostosRetidosDuplicatas or
                                           ExisteQuitacaoImpostosRetidosNotas;

  qryDocumentosPagcofinsretido.ReadOnly := ExisteNota or Bloquear or
                                           ExisteQuitacaoImpostosRetidosDuplicatas or
                                           ExisteQuitacaoImpostosRetidosNotas;

  qryDocumentosPagcsllretido.ReadOnly   := ExisteNota or Bloquear or
                                           ExisteQuitacaoImpostosRetidosDuplicatas or
                                           ExisteQuitacaoImpostosRetidosNotas;

  qryDocumentosPagNumero.ReadOnly         := Bloquear;
  qryDocumentosPagreferencia.ReadOnly     := Bloquear;
  qryDocumentosPagtipofornecedor.ReadOnly := Bloquear;
  qryDocumentosPagpedido.ReadOnly         := Bloquear;
  qryDocumentosPaghistorico.ReadOnly      := Bloquear;
  qryDocumentosPagValorLiquido.ReadOnly   := Bloquear or
                                           ExisteQuitacaoImpostosRetidosDuplicatas or
                                           ExisteQuitacaoImpostosRetidosNotas;

  qryDocumentosPagEvento.ReadOnly         := bloquear;
  if qryDocumentosPagEvento.ReadOnly then
    qryDocumentosPagEvento.ReadOnly         := not PermiteAlterarEvento;

  qryDocumentosPagcreditar.ReadOnly       := Bloquear;

//qryDuplicatasValorVencto.ReadOnly := ExisteQuitacaoImpostosRetidosDuplicatas or
//                                     Bloquear;

//  qryDocumentosPag.ReadOnly:= Bloquear;
//  qrydocumentospag.ReadOnly := (qryDocumentosPagdocumentopagorigem.AsInteger <> 0);

end;

function TdtmContasPagar.ExcluirContasPagar: Boolean;
  function PermiteExcluirContasPagar: Boolean;
  begin
    result := true;
    if ExisteQuitacao {and
       not parsistema.Contabilizacaoporregimedecaixa} then
    begin
      MensagemAviso(ctDOCUMENTODUPLICATASQUITADAS);
      result := false;
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
    if not qryDocumentosPagdocumentopagorigem.IsNull then
    begin
      Result := false;
      MensagemAviso('A exclusão deve ser feita pelo documento de origem.');
    end
    else
    if {(parsistema.GerarContabilidade) and}
       (ParSistema.DataContabil >= qryDocumentosPagdatalancto.AsDateTime) then
    begin
      Result := False;
      MensagemAviso('Este documento não pode ser excluído.'+#10#13+
                     Format(ctDATACONTABILMAIORDATALANCTO, ['de lançamento',
                            datetostr(qryDocumentosPagdatalancto.AsDateTime),
                            'contábil',
                            datetostr(ParSistema.DataContabil)]));
    end;
  end;

begin
  Result := (qryDocumentosPag.RecordCount > 0);
  if Result then
  begin
    if  PermiteExcluirContasPagar and
       (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['a CONTA A PAGAR'])) = smbOk) then
    begin
      if not qryexistenota.IsEmpty then
      begin
        qryExisteNota.Edit;
        qryExisteNotadocumentopag.Clear;
        qryExisteNota.Post;
      end;
      qryDocumentosPag.AfterScroll := nil;
      qryDocumentosPag.Delete;
      result := Perpetrar([qryExisteNota, qryDocumentosPag]);
      qryDocumentosPag.AfterScroll := qryDocumentosPagAfterScroll;
      qryDocumentosPagAfterScroll(qrydocumentospag);
    end else
      Result:= False;
  end;
end;

function TdtmContasPagar.ExcluirDuplicatas: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['a DUPLICATA'])) = smbOk then begin
    if not qryDuplicatas.IsEmpty then
      qryDuplicatas.Delete;
    Result:= True;
  end;
end;


function TdtmContasPagar.ExisteEventos(Campo, Codigo: string): Boolean;
begin
end;

function TdtmContasPagar.ExisteDocumentosPag(Campo, Codigo: String): Boolean;
const
  SQL  = 'and (to_ascii(d.%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
  SQL1 = 'and (to_ascii(f.%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
begin
  if (Campo = 'emissao') then
    qryConsultaDocumentosPag.MacroByName('todos').AsString :=
    'and (cast(to_char(d.emissao,''dd/mm/yyyy'') as varchar) ilike to_ascii(''' + Codigo + '%'',''latin1''))'
  else
  if (Campo = 'nome') then
    qryConsultaDocumentosPag.MacroByName('todos').AsString := Format(SQL1, [Campo, Codigo, '%'])
  else
  if (Campo = 'razao') then
    qryConsultaDocumentosPag.MacroByName('todos').AsString := Format(SQL1, [Campo, Codigo, '%'])
  else
    qryConsultaDocumentosPag.MacroByName('Todos').AsString := Format(SQL,  [Campo, Codigo, '%']);

  qryConsultaDocumentosPag.Close;
  qryConsultaDocumentosPag.Open;
  Result := qryConsultaDocumentosPag.RecordCount > 0
end;

function TdtmContasPagar.ExisteFiliais(Campo, Codigo: string): Boolean;
begin
  Result := ExisteCodigo(qryConsultaFiliais, Campo, Codigo);
end;

function TdtmContasPagar.ExisteFornecedores(Campo, Codigo: string): Boolean;
const
  SQL = 'Where (to_ascii(%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
begin
  if Campo = 'nomecidade' then
    Campo:= 'c.nome'
  else if Campo = 'tipocliente' then
    Campo:= 'v.tipo'
  else
    Campo:= 'v.' + Campo;    
  qryConsultaFornecedores.Sql[08] := Format(SQL, [Campo, Codigo, '%']);

  if parsistema.SelecionarSomenteFornecedoresnasContasaPagar then
    qryConsultaFornecedores.Sql[08] := qryConsultaFornecedores.Sql[08] + 'and v.tipo in (''F'',''L'')';

  qryConsultaFornecedores.Open;
  Result := qryConsultaFornecedores.RecordCount > 0
end;


function TdtmContasPagar.ExisteTiposPagamento(Campo, Codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaTipoPagamento, Campo, Codigo);
end;

procedure TdtmContasPagar.FecharTabelasConsulta(TipoPesquisa: TtecQuitacaoDuplicatas);
begin
  case TipoPesquisa of
    dupDOCUMENTOSPAG: Fecha(ctConsultaDocumentosPag);
    dupFILIAIS,
    dupFILIAISPAGTO : Fecha(ctConsultaFiliais);
    dupFORNECEDORES : Fecha(ctConsultaFornecedores);

    dupEVENTO:        Fecha(ctConsultaEventos);

//--  dupBANCOVENCTO,  ---------------------------------------- Carlos 26/10/2006
    dupBANCOVENCTO  : Fecha(ctConsultaBancos);  //ctVencimentoConsultaBancos;
//-------------------------------------------------------------

     dupCONTA,
     dupCONTADOCUMENTOSPAG: Fecha(ctConsultaContas);
//   dupAGENCIAVENCTO,
//    dupAGENCIA      : Fecha(ctConsultaAgencias);
//    dupAGENCIAPAGTO : Fecha(ctPagamentoConsultaAgencias);
    dupTIPOPAGTO,
    dupTIPOPAGTODOCUMENTOSPAG : Fecha(ctConsultaTipoPagamento);
{
    dupCONTADEBITO,
    dupCONTACREDITO,
    dupCONTACREDITOPAGAMENTO : Fecha(ctCONSULTACONTACONTABIL);
}
    dupCONTACONTABIL,
    dupCONTACREDITOPAGAMENTO : Fecha(ctCONSULTACONTACONTABIL);
    dupHISTORICOS   : Fecha(ctConsultaHistoricos);
  end;
end;

procedure TdtmContasPagar.GerarParcelas(NP: Integer;
                                        Vencto: TDateTime;
                                        Intervalo: Integer;
                                        TipoJuros,
                                        TipoMulta: char;
                                        ValorJuros: Real;
                                        ValorMulta: Real);
var
  I, J: Integer;
  Dif: Currency;

begin
  if qryDocumentosPagvalor.AsCurrency = 0 then
    MensagemAviso('Deve ser informado um valor para o documento.')
  else
    if (TotalImpostosRetidos > qryDocumentosPagvalor.AsCurrency) then
      MensagemAviso('A soma dos impostos deve ser menor que o valor total do documento.')
    else
    begin

      try

//        dsrDuplicatas.enabled := false;
        qryDuplicatas.AfterDelete := nil;
        qryDuplicatas.AfterPost := nil;
        qryDuplicatas.BeforePost := nil;
        qryDuplicatas.AfterScroll := nil;
        dsrDuplicatas.onDataChange := nil;

        if not (qryDocumentosPag.State in [dsInsert, dsEdit]) then
          qryDocumentosPag.Edit;

        J:=qryDuplicatas.RecordCount;

        if not qryDuplicatas.IsEmpty then
        begin
          qryDuplicatas.First;
          for I:= 1 to qryDuplicatas.RecordCount do
          begin
            qryDuplicatas.Delete;
            vPosition:=  (i * 100) / (J);
            ShowProgress(true);
          end;
        end;

        qryDuplicatas.DisableControls;
        try
          for I:= 1 to NP do
          begin
            qryDuplicatas.Append;
            qryDuplicatasdatavencto.AsDateTime := SomarDia(Vencto,((I-1) * Intervalo),'S');
            qryDuplicatasnumero.AsInteger      := I;
            qryDuplicatasvalorvencto.AsCurrency:= RoundTo((qryDocumentosPagvalor.AsCurrency - TotalImpostosRetidos) / NP,-2);
            qryDuplicatastipojuros.AsString := TipoJuros;
            qryDuplicatastipomulta.AsString:= TipoMulta;

            if ValorJuros<>0 then
              qryDuplicatasjuros.AsCurrency:= ValorJuros
            else
              qryDuplicatasjuros.clear;

            if ValorMulta<>0 then
              qryDuplicatasmulta.AsCurrency:= ValorMulta
            else
              qryDuplicatasmulta.clear;

            if ParSistema.AutorizacaoPagtoAutomatica then
            begin
               qryDuplicatasautorizado.AsBoolean  := True;
               qryDuplicatasdataautorizacaopagto.AsDateTime := now;
            end
            else
            begin
               qryDuplicatasautorizado.AsBoolean  := False;
               qryDuplicatasdataautorizacaopagto.clear;
            end;

            qryDuplicatasOrdem.asstring := inttostr(I) + '.' +
                                           inttostr(NP);


            qryDuplicatasvalorapagar.AsCurrency := calcular_valor_pagar_;
            qryDuplicatas.Post;


            vPosition:=  (i * 100) / (NP);
            ShowProgress(true);

          end;

        finally
          qryDuplicatas.EnableControls;
          ShowProgress(false);
        end;

      finally
        qryDuplicatas.AfterDelete := qryDuplicatasAfterDelete;
        qryDuplicatas.AfterPost := qryDuplicatasAfterPost;
        qryDuplicatas.BeforePost := qryDuplicatasBeforePost;
        qryDuplicatas.AfterScroll := qryDuplicatasAfterScroll;
        dsrDuplicatas.onDataChange := dsrDuplicatasDataChange;
//        dsrDuplicatas.enabled := true;

        cdsTotalDuplicatas.close;
        cdsTotalDuplicatas.open;

      end;


      qryDuplicatas.First;
      // Atribui dferenca para a 1 parcela.
      Dif:= ((qryDocumentosPagvalor.AsCurrency - TotalImpostosRetidos) - (qryDuplicatasvalorvencto.AsCurrency * NP));
      if Dif <> 0 then begin
        qryDuplicatas.Edit;
        qryDuplicatasvalorvencto.AsCurrency:= (qryDuplicatasvalorvencto.AsCurrency + Dif);
        qryDuplicatas.Post;
      end;
    end;
end;

function TdtmContasPagar.GetConsultarEventos: TtecQuery;
begin
end;

function TdtmContasPagar.GetConsultarDocumentosPag: TtecQuery;
begin
  Result:= qryConsultaDocumentosPag;
end;

function TdtmContasPagar.GetConsultarFiliais: TtecQuery;
begin
  Result:= qryConsultaFiliais;
end;

function TdtmContasPagar.GetConsultarFornecedores: TtecQuery;
begin
  Result:= qryConsultaFornecedores;
end;

function TdtmContasPagar.GetConsultarTiposPagamento: TtecQuery;
begin
  Result:= qryConsultaTipoPagamento;
end;

function TdtmContasPagar.GetDataEmissao: String;
begin
  Result:= qryDocumentosPagemissao.AsString;
end;

function TdtmContasPagar.GetDuplicataQuitada: Boolean;
begin
  Result:= (qryDuplicatasdatapagto.AsDateTime > 0);
end;

function TdtmContasPagar.GetEditandoTabelaDuplicatas: Boolean;
begin
  Result:= qryDuplicatas.State = dsEdit;
end;

function TdtmContasPagar.GetExisteNota: Boolean;
begin
  Result:= False;
  if not (qryDocumentosPag.State in [dsInsert]) then
    Result := qryExisteNota.RecordCount <> 0;
end;

function TdtmContasPagar.GetTabelaDocumentosPag: TtecQuery;
begin
  Result:= qryDocumentosPag;
end;

function TdtmContasPagar.GetTabelaDuplicatas: TtecQuery;
begin
  Result:= qryDuplicatas;
end;

function TdtmContasPagar.GetTipoJuros: String;
begin
  Result:= qryDuplicatastipojuros.AsString;
end;

function TdtmContasPagar.GetTipoMulta: String;
begin
  Result:= qryDuplicatastipomulta.AsString;
end;

function TdtmContasPagar.GetTipoPessoa: String;
begin
  if qryDocumentosPagtipofornecedor.AsString = '' then
       Result:= 'F'
  else Result:= qryDocumentosPagtipofornecedor.AsString;
end;

function TdtmContasPagar.GravarContasPagar(Operacao: TtecTipoOperacaoDuplicatas; CancelarTodos: Boolean = False): Boolean;

var
  I: Integer;

  vContaPagtoCheck : integer;
  vDataPagtoCheck : TDateTime;
  vSequenciaCheck : integer;

  procedure GravarLancamentosContabeis;
  var
    vTotalCredito, vTotalDebito : Currency;
    vNrOrigem : String;
    vMultiploPagamento, vHouveInclusaoLancto : Boolean;
    vComplemento : String;

  begin

     if parsistema.GerarContabilidade and
        ((origem = 'D') or (origem = 'E')) {and
        not AdiantamentoFornecedor} then
     begin
       FProximoNrLancto := 0;

       if not (operacao in [topPAGAMENTO, topCANCELAR]) then
       begin
         OperacaoContasaPagar := Operacao;
         dtmLancamentoContabilidade.qrylancamentosDocumentos.First;
         while not dtmLancamentoContabilidade.qrylancamentosDocumentos.Eof do
         begin
           dtmLancamentoContabilidade.qrylancamentosDocumentos.Edit;
           if (dtmLancamentoContabilidade.qryLancamentosDocumentosnumerocriado.asboolean) or
              ((qryDocumentosPagfilialcontabil.OldValue <> null) and
               (qryDocumentosPagfilialcontabil.AsInteger <> qryDocumentosPagfilialcontabil.OldValue)) then
             dtmLancamentoContabilidade.qrylancamentosDocumentosnrlancto.AsInteger := ProximoNrLancto;

           dtmLancamentoContabilidade.qrylancamentosDocumentosdata.AsDateTime         := qryDocumentosPagdatalancto.AsDateTime;
           dtmLancamentoContabilidade.qrylancamentosDocumentosnrorigem.AsString      := qryDocumentosPagNumero.AsString;
           dtmLancamentoContabilidade.qryLancamentosDocumentosexercicio.AsInteger     := yearof(qryDocumentosPagdatalancto.AsDateTime);
           dtmLancamentoContabilidade.qryLancamentosDocumentosfilial.AsInteger        := qryDocumentosPagfilialcontabil.AsInteger;
           dtmLancamentoContabilidade.qrylancamentosDocumentos.Next;
         end;
       end
       else
       if operacao = topPAGAMENTO then
       begin
         OperacaoContasaPagar := Operacao;

         if (qryDuplicatasNrLoteContabil.AsString = '') or
            (qryDuplicatasNrLoteContabil.AsString = '0') then begin

            RefazConsultaPorNome(qryProximoNrLoteLanctoDuplicata, ['Exercicio'], [yearof(qryDuplicatasdatapagto.AsDateTime)]);

            qryDuplicatas.AfterPost := nil;
            qryduplicatas.edit;
            qryDuplicatasNrLoteContabil.AsString := qryProximoNrLoteLanctoDuplicataNrLote.AsString +   // ...LLLLLLL
                                                    FStr(qryDocumentosPagNumero.AsInteger, $61)    +   //     DDDDDD
                                                    FStr(qryDuplicatasNumero.   AsInteger, $31);       //        NNN
            qryduplicatas.post;

            qryDuplicatas.AfterPost := qryDuplicatasAfterPost;
         end;

         dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.First;
         vHouveInclusaoLancto := false;
         while not dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.Eof do
         begin
           if dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasnumerocriado.asboolean then
           begin
             vHouveInclusaoLancto := true;
             break;
           end;
           dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.next;
         end;


         dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.First;
         while not dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.Eof do
         begin
           dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.Edit;

           if {(dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasnumerocriado.asboolean)} vHouveInclusaoLancto or

{              ((qryDuplicatasfilialpagto.OldValue <> null) and
               (qryDuplicatasfilialpagto.AsInteger <> qryDuplicatasfilialpagto.OldValue)) then}

              ((qryDocumentosPagfilialcontabil.OldValue <> null) and
               (qryDocumentosPagfilialcontabil.AsInteger <> qryDocumentosPagfilialcontabil.OldValue)) then

             dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasnrlancto.AsInteger := ProximoNrLancto;

           dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasdata.AsDateTime         := qryDuplicatasdatapagto.AsDateTime;

           if (dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasnrorigem.AsString = '') or
              (dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasnrorigem.AsString = '0')  then
           begin
             if (dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatascreditar.AsInteger <> 0) and
                (dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasdebitar.AsInteger   = 0) and
                (dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatascreditar.asInteger    = getcontacreditopagamento) and
                ehMultiploPagamento then
               dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasnrorigem.AsString :=
                 copy(qryDuplicatasNrLoteContabil.AsString, 1, length(qryDuplicatasNrLoteContabil.AsString)-9) + '000000000'
             else
               dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasnrorigem.AsString       := qryDuplicatasNrLoteContabil.AsString;
           end;

           dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasexercicio.AsInteger     := yearof(qryDuplicatasdatapagto.AsDateTime);
           dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasfilial.AsInteger        := qryDuplicatasfilialpagto.AsInteger;
           dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.Next;
         end;
       end
       else
       if operacao = topCANCELAR then
       begin

         ReFazConsultapornome(dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas,['origem','nrorigem','exercicio'],
              ['P',getnrlotecontabil, yearof(vDataPagtoCancelada) ]);

         dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.First;
         if CancelarTodos then  //Apagar todos oa lançamentos do lote
         begin
           while not dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.Eof do
             dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.Delete
         end
         else
         begin
           vTotalCredito := 0;
           vTotalDebito := 0;

           //Apagar somente os lançamentos da duplicata cancelada
           while not dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.Eof do
           begin
             if StrToInt64(dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasnrorigem.AsString) = GetnrlotecontabilDuplicata then
             begin
               if dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatascreditar.AsInteger <> 0 then
                 vTotalCredito := vTotalCredito + dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasvalor.AsCurrency;

               if dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasdebitar.AsInteger <> 0 then
                 vTotalDebito := vTotalDebito + dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasvalor.AsCurrency;

               dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.Delete
             end
             else
               dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.next;
           end;

           //acertar o saldo da conta credito (pagamento)
           dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.First;
           // se tiver somente um trata-se de um pagamento multiplo que deixou de ser e se refere a duplicata que esta sendo cancelada
           if dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.RecordCount = 1 then
             dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.delete
           else
           begin
             while not dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.Eof do
             begin
               if StrToInt64(dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasnrorigem.AsString) = Getnrlotecontabil then
               begin
                 dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.Edit;
                 dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasvalor.AsCurrency :=
                   dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasvalor.AsCurrency -
                                              (vTotalDebito - vTotalCredito);
                 dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.post;
                 break;
               end;

               dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.next;
             end;

             // acertar a conta credora caso deixar de ser múltiplo lançamento
             vNrOrigem := '';
             vMultiploPagamento := false;
             dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.First;
             while not dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.Eof do
             begin
               if (DtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasdebitar.AsInteger <> 0) and
                  (vNrOrigem='') then
                 vNrOrigem := dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasnrorigem.AsString;

               if (dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasdebitar.AsInteger <> 0) and
                  (dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasnrorigem.AsString <> vNrOrigem) then
               begin
                 vMultiploPagamento := true;
                 break;
               end;
               dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.next;
             end;

             vComplemento := '';

             if not vMultiploPagamento then
             begin

               dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.First;
               while not dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.Eof do
               begin
                 if (dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasdebitar.AsInteger <> 0) then
                 begin
                   vComplemento := dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatascomplemento.AsString;
                   break;
                 end
                 else
                   dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.Next;
               end;

               dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.First;
               while not dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.Eof do
               begin
                 if (dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatascreditar.AsInteger <> 0) and
                    (StrToInt64(dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasnrorigem.AsString) = Getnrlotecontabil) then
                 begin
                   dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.Edit;
                   dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatasnrorigem.AsString := vNrOrigem;
                   dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatascomplemento.AsString := vcomplemento;
                   dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.Post;
                   break;
                 end;
                 dtmLancamentoContabilidade.qryLancamentosPagamentosDuplicatas.next;
               end;

             end;
           end;
         end;

         qryDuplicatas.Edit;
         qryDuplicatasNrLoteContabil.Clear;
         qryduplicatas.Post;

       end;
     end;
  end;

  function VerificarFornecedorparaISS: Boolean;
  begin
    result := true;
    if ParSistema.GeracaoAutomaticadoImpostoRetido then
    begin
      if qryDocumentosPagissretido.AsCurrency <> 0 then
      begin
        qryVenctosImpostosRetidosEntradas.First;
        if (qryVenctosImpostosRetidosEntradas.Locate('descricao','ISS retido',[])) and
           qryVenctosImpostosRetidosEntradasfornecedor.IsNull and
           not qryDocumentosPagfornecedorparaiss.IsNull then
        begin
          qryVenctosImpostosRetidosEntradas.Edit;
          qryVenctosImpostosRetidosEntradasfornecedor.AsVariant := qryDocumentosPagfornecedorparaiss.AsVariant;
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

  procedure AbrirTabelasLotes;
  begin
    RefazConsultaPorNome(qryLotesPagamento_DocumentosPag,
                   ['nrlotecontabil','contapagto','datapagto','chequepagto','sequencia','documentopag','datavencto','numero'],
                   [Getnrlotecontabil,
                    qryDuplicatascontapagto.AsVariant,
                    qryDuplicatasdatapagto.asvariant,
                    qryDuplicataschequepagto.Asinteger,
                    qryDuplicatassequencia.AsVariant,
                    qryDuplicatasDocumentoPag.Asinteger,
                    qryDuplicatasDataVencto.asvariant,
                    qryDuplicatasNumero.asvariant]);

    RefazConsultaPorNome(qryLotesPagamento_DocumentosPagImpostosRetidos,
                   ['nrlotecontabil','contapagto','datapagto','chequepagto','sequencia','documentopag','datavencto','numero'],
                   [Getnrlotecontabil,
                    qryDuplicatascontapagto.AsVariant,
                    qryDuplicatasdatapagto.asvariant,
                    qryDuplicataschequepagto.Asinteger,
                    qryDuplicatassequencia.AsVariant,
                    qryDuplicatasDocumentoPag.Asinteger,
                    qryDuplicatasDataVencto.asvariant,
                    qryDuplicatasNumero.asvariant]);

    RefazConsultaPorNome(qryLotesPagamento_DuplicatasImpostosRetidos,
                   ['nrlotecontabil','contapagto','datapagto','chequepagto','sequencia','documentopag','datavencto','numero'],
                   [Getnrlotecontabil,
                    qryDuplicatascontapagto.AsVariant,
                    qryDuplicatasdatapagto.asvariant,
                    qryDuplicataschequepagto.Asinteger,
                    qryDuplicatassequencia.AsVariant,
                    qryDuplicatasDocumentoPag.Asinteger,
                    qryDuplicatasDataVencto.asvariant,
                    qryDuplicatasNumero.asvariant]);

  end;

begin

              {
  if (qryReinf_2010.state in [dsedit, dsinsert]) then
    qryReinf_2010.post;

//  if result then
//  begin

    AtribuirChave(qryReinf_2010,
                  [qryReinf_2010documentopag, qryReinf_2010fornecedor,
                   qryReinf_2010tipofornecedor,
                   qryReinf_2010filial, qryReinf_2010cnpjprestador,
                   qryReinf_2010indcprb],
                  [qryDocumentosPagNumero, qryDocumentosPagfornecedor,
                   qryDocumentosPagtipofornecedor,
                   qryDocumentosPagfilialemissao, qryProcurarFornecedorespessoanumero,
                   qryProcurarFornecedoresindcprb]);

    AtribuirChave(qryReinf_2010_infoTpServ,
                  [qryReinf_2010_infoTpServdocumentopag],
                  [qryDocumentosPagNumero]);

    AtribuirChave(qryReinf_2010_infoProcRetPr,
                  [qryReinf_2010_infoProcRetPrdocumentopag,
                   qryReinf_2010_infoProcRetPrfornecedor,
                   qryReinf_2010_infoProcRetPrtipofornecedor],

                  [qryDocumentosPagNumero,
                   qryDocumentosPagfornecedor,
                   qryDocumentosPagtipofornecedor]);

    AtribuirChave(qryReinf_2010_infoProcRetAd,

                  [qryReinf_2010_infoProcRetAddocumentopag,
                   qryReinf_2010_infoProcRetAdfornecedor,
                   qryReinf_2010_infoProcRetAdtipofornecedor],

                  [qryDocumentosPagNumero,
                   qryDocumentosPagfornecedor,
                   qryDocumentosPagtipofornecedor]);

    if (qryReinf_2040_recursosRep.state in [dsedit, dsinsert]) then
      qryReinf_2040_recursosRep.post;

    AtribuirChave(qryReinf_2040_recursosRep,

                  [qryReinf_2040_recursosRepdocumentopag,

                   qryReinf_2010fornecedor,
                   qryReinf_2040_recursosReptipofornecedor,
                   qryReinf_2040_recursosRepcnpjassocdesp,

                   qryReinf_2040_recursosRepfilial,
                   qryReinf_2040_recursosRepnrinscestab
                  ],

                  [qryDocumentosPagNumero,

                   qryDocumentosPagfornecedor,
                   qryDocumentosPagtipofornecedor,
                   qryProcurarFornecedorespessoanumero,

                   qryDocumentosPagfilialemissao,
                   qryProcurarFiliaiscnpj
                  ]);

    AtribuirChave(qryReinf_2040_infoRecurso,
                  [qryReinf_2040_infoRecursodocumentopag],
                  [qryDocumentosPagNumero]);

    AtribuirChave(qryReinf_2040_infoProc,
                  [qryReinf_2040_infoProcdocumentopag,
                   qryReinf_2040_infoProcfornecedor,
                   qryReinf_2040_infoProctipofornecedor],

                  [qryDocumentosPagNumero,
                   qryDocumentosPagfornecedor,
                   qryDocumentosPagtipofornecedor]);

    result := qryReinf_2010.CheckRequiredFields;

    if result then
      result := qryReinf_2010_infoTpServ.CheckRequiredFields(true);

    if result then
      result := qryReinf_2010_infoProcRetPr.CheckRequiredFields(true);

    if result then
      result := qryReinf_2010_infoProcRetAd.CheckRequiredFields(true);

    if result then
      result := qryReinf_2040_recursosRep.CheckRequiredFields(true);

    if result then
      result := qryReinf_2040_infoRecurso.CheckRequiredFields(true);

    if result then
      result := qryReinf_2040_infoProc.CheckRequiredFields(true);

    if result then
    }
      result := qryDocumentosPag.CheckRequiredFields;

      {
    if result then
      result := VerificarSituacao_Prestador_X_Reinf_2010_noMes;
      }

    if result then
    begin
      result := ValidarSaldoAdiantamento;
      if result then
      begin
        Result:= (TotalImpostosRetidos <= qryDocumentosPagvalor.AsCurrency);
        if Result then begin
           Result:= not qryDuplicatas.IsEmpty or AdiantamentoFornecedor;
           if Result then begin
              Result:= AdiantamentoFornecedor or fViaLote_;

              if not result then
              begin
                result := ((qryDocumentosPagvalor.AsCurrency - TotalImpostosRetidos) = TotalDuplicatas);
                if not result then
                begin
                  result := qryDocumentosPagregimedecaixa.AsBoolean;
                  if result then
                  begin
                    result := MensagemConfirmacao('A soma das duplicatas difere do valor líquido. Confirma alteração do valor bruto?')  = smbOk;
                    if result then
                      qrydocumentospagvalor.AsCurrency := TotalDuplicatas;
                  end
                  else
                    MensagemAviso('A soma das duplicatas difere do valor líquido.');
                end;
              end;

              if Result then begin
                Result := VerificarFornecedorparaISS;
                if result then
                begin

                  try

                    qryDuplicatas.AfterScroll := nil;
                    qryDuplicatas.AfterPost := nil;
                    qryDuplicatas.BeforePost := nil;

                    Result := Verificarimpostosretidos(qryDocumentosPagprevisao.AsBoolean,
                                                       VALIDAR,
                                                       qryDocumentosPagImpostosRetidos,
                                                       qryDuplicatasImpostosRetidos,
                                                       qryContasEntradasFiliais,
                                                       qryVenctosImpostosRetidosEntradas,
                                                       qryDocumentosPag,
                                                       qryDuplicatas,
                                                       spcDocumentosPagProximo,
                                                       OrigemImpostosRetidos
                                                       );



                    if result and
                       (operacao in [topCANCELAR]) and
                       (qryDuplicatasdatapagtoaux.AsDateTime >= ParSistema.InicioIntegracaoBancos) and
                       (ParSistema.InicioIntegracaoBancos > StrToDateTime('01/01/1980')) and
                       CancelarTodos then
                    begin
                      AbrirTabelasLotes;
                      Result := Verificarimpostosretidos(qryLotesPagamento_DocumentosPagprevisao.AsBoolean,
                                                         VALIDAR,
                                                         qryLotesPagamento_DocumentosPagImpostosRetidos,
                                                         qryLotesPagamento_DuplicatasImpostosRetidos,
                                                         qryContasEntradasFiliais,
                                                         qryVenctosImpostosRetidosEntradas,
                                                         qryLotesPagamento_DocumentosPag,
                                                         qryLotesPagamento_Duplicatas,
                                                         spcDocumentosPagProximo,
                                                         PagamentoDuplicatas
                                                         );
                    end;


                    if result then
                    begin
                      if qryDocumentosPag.State in [dsEdit,dsInsert] then
                      begin

                        if qryDocumentosPag.State in [dsInsert] then
                        begin
                             spcDocumentosPagProximo.Open;
                             qryDocumentosPagnumero.AsInteger:= spcDocumentosPagProximocodigo.AsInteger;
                             spcDocumentosPagProximo.Close;

                             AtribuirChave(qryDuplicatas,[qryduplicatasDocumentopag],[qryDocumentosPagNumero]);
                                                   {
                             AtribuirChave(qryReinf_2010,
                                            [qryReinf_2010documentopag],
                                            [qryDocumentosPagNumero]);

                             AtribuirChave(qryReinf_2010_infoTpServ,
                                            [qryReinf_2010_infoTpServdocumentopag],
                                            [qryDocumentosPagNumero]);

                             AtribuirChave(qryReinf_2010_infoProcRetPr,
                                            [qryReinf_2010_infoProcRetPrdocumentopag],
                                            [qryDocumentosPagNumero]);

                             AtribuirChave(qryReinf_2010_infoProcRetAd,
                                            [qryReinf_2010_infoProcRetAddocumentopag],
                                            [qryDocumentosPagNumero]);


                             AtribuirChave(qryReinf_2040_recursosRep,
                                            [qryReinf_2040_recursosRepdocumentopag],

                                            [qryDocumentosPagNumero]);

                             AtribuirChave(qryReinf_2040_infoRecurso,
                                            [qryReinf_2040_infoRecursodocumentopag],
                                            [qryDocumentosPagNumero]);

                             AtribuirChave(qryReinf_2040_infoProc,
                                            [qryReinf_2040_infoProcdocumentopag],
                                            [qryDocumentosPagNumero]);
                                            }

                        end;

                        AtribuirChave(qryDocumentosPagImpostosRetidos,[qryDocumentosPagImpostosRetidosdocumentopagorigem], [qryDocumentosPagNumero], true);

                        if result and
                           (operacao in [topCANCELAR]) and
                           (qryDuplicatasdatapagtoaux.AsDateTime >= ParSistema.InicioIntegracaoBancos) and
                           (ParSistema.InicioIntegracaoBancos > StrToDateTime('01/01/1980')) and
                           CancelarTodos then

                           Verificarimpostosretidos(qryLotesPagamento_DocumentosPagprevisao.AsBoolean,
                                                    GRAVAR,
                                                    qryLotesPagamento_DocumentosPagImpostosRetidos,
                                                    qryLotesPagamento_DuplicatasImpostosRetidos,
                                                    qryContasEntradasFiliais,
                                                    qryVenctosImpostosRetidosEntradas,
                                                    qryLotesPagamento_DocumentosPag,
                                                    qryLotesPagamento_Duplicatas,
                                                    spcDocumentosPagProximo,
                                                    PagamentoDuplicatas
                                                    );


                        Verificarimpostosretidos(qryDocumentosPagprevisao.AsBoolean,
                                                   GRAVAR,
                                                   qryDocumentosPagImpostosRetidos,
                                                   qryDuplicatasImpostosRetidos,
                                                   qryContasEntradasFiliais,
                                                   qryVenctosImpostosRetidosEntradas,
                                                   qryDocumentosPag,
                                                   qryDuplicatas,
                                                   spcDocumentosPagProximo,
                                                   OrigemImpostosRetidos);


                        if (operacao<>topeditar) and
                           (operacao<>topCANCELAR) then
                          AtribuirChave(qryDuplicatas,[qryDuplicatasEvento],[qryDocumentospagEvento], true, true);


                        qryDocumentosPag.Post;


                        if (operacao in [topPAGAMENTO]) and
                           (qryDuplicatastipopagamento.AsInteger <> 3) and { esta operação é quitação via adiantamento e não gera movtosbancos pois já foi gerado no adiantamento }
                           (qryDuplicatasdatapagto.AsDateTime >= ParSistema.InicioIntegracaoBancos) and
                           (ParSistema.InicioIntegracaoBancos > StrToDateTime('01/01/1980')) and
                           ((qryDuplicatasvalorpagto.AsCurrency<>0) or
                            ((qryDuplicatasvalorpagto.AsCurrency=0) and
                             (qryDuplicatasvalorvencto.AsCurrency=qryDuplicatasvalordesconto.AsCurrency)
                             )
                            )
                        then
                        begin

                          vContaPagtoCheck := qryDuplicatascontapagto.AsInteger;
                          vDataPagtoCheck :=  qryDuplicatasdatapagto.asDateTime;
                          vSequenciaCheck := qryDuplicatasSequencia.asinteger;

                          RefazConsultaPorNome(qryMovtosBancos,['conta','data','sequencia'],
                                                               [qryDuplicatascontapagto.AsInteger,
                                                                qryDuplicatasdatapagto.asDateTime,
                                                                qryDuplicatasSequencia.asinteger]);

                          RefazConsultaPorNome(qryMovtosBancosEventos,['conta','data','sequencia','evento','sequenciaevento', 'CancelarTodos'],
                                                               [qryDuplicatascontapagto.AsInteger,
                                                                qryDuplicatasdatapagto.asDateTime,
                                                                qryDuplicatasSequencia.asinteger,
                                                                qryDuplicatasEvento.asinteger,
                                                                qryDuplicatassequenciaevento.asinteger,
                                                                False]);

                          if qryMovtosBancos.RecordCount = 0 then
                          begin
                            RefazConsultaPorNome(qryMovtosBancosProximaSequencia, ['ContaPagto', 'DataPagto'], [qryDuplicatascontapagto.AsInteger, qryDuplicatasdatapagto.AsDateTime]);
                            qryduplicatas.edit;
                            qryDuplicatassequencia.AsInteger := qryMovtosBancosProximaSequencianumero.AsInteger + 1 ;
                            qryduplicatas.Post;
                            vSequenciaCheck := qryDuplicatasSequencia.asinteger;

                            RefazConsultaPorNome(qryMovtosBancosProximaSequenciaEvento, ['ContaPagto', 'DataPagto', 'Sequencia', 'Evento'],
                            [qryDuplicatascontapagto.AsInteger, qryDuplicatasdatapagto.AsDateTime, qryDuplicatassequencia.AsInteger, qryDocumentosPagEvento.AsInteger]);

                            qryDuplicatassequenciaevento.AsInteger := qryMovtosBancosProximaSequenciaEventonumero.AsInteger + 1;

                            qryMovtosBancos.Append;
                            qryMovtosBancosconta.AsInteger        := qryDuplicatascontapagto.AsInteger;
                            qryMovtosBancosdata.AsDateTime        := qryDuplicatasdatapagto.AsDateTime;
                            qryMovtosBancossequencia.AsInteger    := qryDuplicatassequencia.AsInteger;
                            qryMovtosBancoscompensacao.AsDateTime := qryDuplicatasdatapagto.AsDateTime;
                            qryMovtosBancosevento.AsInteger       := qryDocumentosPagEvento.AsInteger ;
                            qryMovtosBancosorigemlancto.AsString  := 'P';

                            if qryDuplicataschequepagto.asstring<>'' then
                              qryMovtosBancosdocumento.AsString     := FormatFloat('000,000',qryDuplicataschequepagto.AsInteger);

                            qryMovtosBancosobservacoes.AsString := getdescricaohistoricopagamento;
                            qryMovtosBancosvalor.AsCurrency       := qryDuplicatasvalorpagto.AsCurrency;
                            qryMovtosBancos.Post;

                            qryMovtosBancosEventos.Append;
                            qryMovtosBancosEventosconta.AsInteger     := qryDuplicatascontapagto.AsInteger;
                            qryMovtosBancosEventosdata.AsDateTime     := qryDuplicatasdatapagto.AsDateTime;
                            qryMovtosBancosEventossequencia.AsInteger := qryDuplicatassequencia.AsInteger;
                            qryMovtosBancosEventosevento.AsInteger    := qryDocumentosPagEvento.AsInteger ;
                            qryMovtosBancosEventossequenciaevento.AsInteger := qryDuplicatassequenciaevento.AsInteger;
                            qryMovtosBancosEventosobservacoes.AsString   := getdescricaohistoricopagamento;
                            qryMovtosBancosEventosvalor.AsCurrency       := qryDuplicatasvalorpagto.AsCurrency;
                            qryMovtosBancosEventos.Post;

                          end
                          else
                          begin
                            qryMovtosBancos.Edit;
                            qryMovtosBancosvalor.AsCurrency := - (abs(qryMovtosBancosvalor.ascurrency) + qryDuplicatasvalorpagto.AsCurrency);
                            if ehMultiploPagamento then
                            begin
                              qryMovtosBancosobservacoes.AsString := 'PAGTO DIVERSAS DUPLICATAS';
                              qryMovtosBancosevento.Clear;
                            end
                            else
                              qryMovtosBancosobservacoes.AsString := getdescricaohistoricopagamento;

                            qryMovtosBancos.post;

                            RefazConsultaPorNome(qryMovtosBancosProximaSequenciaEvento, ['ContaPagto', 'DataPagto', 'Sequencia', 'Evento'],
                            [qryDuplicatascontapagto.AsInteger, qryDuplicatasdatapagto.AsDateTime, qryDuplicatassequencia.AsInteger, qryDocumentosPagEvento.AsInteger]);

                            qryDuplicatassequenciaevento.AsInteger := qryMovtosBancosProximaSequenciaEventonumero.AsInteger + 1;

                            qryMovtosBancosEventos.Append;
                            qryMovtosBancosEventosconta.AsInteger     := qryDuplicatascontapagto.AsInteger;
                            qryMovtosBancosEventosdata.AsDateTime     := qryDuplicatasdatapagto.AsDateTime;
                            qryMovtosBancosEventossequencia.AsInteger := qryDuplicatassequencia.AsInteger;
                            qryMovtosBancosEventosevento.AsInteger    := qryDocumentosPagEvento.AsInteger ;
                            qryMovtosBancosEventossequenciaevento.AsInteger := qryMovtosBancosProximaSequenciaEventonumero.AsInteger + 1;
                            qryMovtosBancosEventosobservacoes.AsString      := getdescricaohistoricopagamento;
                            qryMovtosBancosEventosvalor.AsCurrency          := qryDuplicatasvalorpagto.AsCurrency;
                            qryMovtosBancosEventos.Post;

                          end;
                        end;


                        if (operacao in [topCANCELAR]) and
                           (qryDuplicatastipopagamento.AsInteger <> 3) and  { esta operação é cancelamento de pagamento via adiantamento e não gera movtosbancos pois já foi gerado no adiantamento }
                           (qryDuplicatasdatapagtoaux.AsDateTime >= ParSistema.InicioIntegracaoBancos) and
                           (ParSistema.InicioIntegracaoBancos > StrToDateTime('01/01/1980')) and
                           ((qryDuplicatasvalorpagto.AsCurrency<>0) or
                            ((qryDuplicatasvalorpagto.AsCurrency=0) and
                             (qryDuplicatasvalorvencto.AsCurrency=qryDuplicatasvalordesconto.AsCurrency)
                             )
                            )

                        then
                        begin

                          vContaPagtoCheck := qryDuplicatascontapagtoaux.AsInteger;
                          vDataPagtoCheck :=  qryDuplicatasdatapagtoaux.asDateTime;
                          vSequenciaCheck := qryDuplicatasSequencia.asinteger;

                          RefazConsultaPorNome(qryMovtosBancos,['conta','data','sequencia'],
                                                               [qryDuplicatascontapagtoaux.AsInteger,
                                                                qryDuplicatasdatapagtoaux.asDateTime,
                                                                qryDuplicatasSequencia.asinteger]);

                          RefazConsultaPorNome(qryMovtosBancosEventos,['conta','data','sequencia','evento','sequenciaevento','CancelarTodos'],
                                                               [qryDuplicatascontapagtoaux.AsInteger,
                                                                qryDuplicatasdatapagtoaux.asDateTime,
                                                                qryDuplicatasSequencia.asinteger,
                                                                qryDuplicatasEvento.asinteger,
                                                                qryDuplicatassequenciaevento.asinteger,
                                                                CancelarTodos]);

                          if qryMovtosBancos.RecordCount <> 0 then
                          begin
                            if (not ehMultiploPagamento and
                              ((abs(qryMovtosBancosvalor.AsCurrency) - qryDuplicatasvalorpagto.AsCurrency) = 0)) or CancelarTodos then
                              qryMovtosBancos.Delete
                            else
                            begin
                              qryMovtosBancos.edit;
                              qryMovtosBancosvalor.AsCurrency := -(abs(qryMovtosBancosvalor.AsCurrency) - qryDuplicatasvalorpagto.AsCurrency);
                              qryMovtosBancos.Post;

                              if qryMovtosBancosvalor.AsCurrency = 0 then
                                 qryMovtosBancos.Delete
                              else
                              begin
                                if qryLotesPagamento_Duplicatas.RecordCount = 1  then
                                begin
                                  qryMovtosBancos.edit;
                                  qryMovtosBancosobservacoes.AsString := qryLotesPagamento_Duplicatasobservacoesmovtosbancos.AsString;
                                  qryMovtosBancosevento.Asinteger    := qrydocumentospagevento.asinteger;
                                  qryMovtosBancos.Post;
                                end;
                              end;
                            end;

                            while not qryMovtosBancosEventos.eof do
                              qryMovtosBancosEventos.delete;

                            qryDuplicatas.Edit;
                            qryDuplicatasEvento.Clear;
                            qryDuplicatassequencia.Clear;
                            qryDuplicatassequenciaevento.Clear;

                            qryduplicatas.Post;

                          end;

                        end;


                        if (operacao in [topPAGAMENTO]) then
                        begin
                          qryDuplicatas.Edit;
                          qryDuplicatasdatapagtoaux.AsDateTime := qryDuplicatasdatapagto.AsDateTime;
                          qryDuplicatasContaPagtoAux.AsString  := qryDuplicatasContaPagto.AsString;
                          qryDuplicatasChequePagtoAux.AsString := qryDuplicatasChequePagto.AsString;
//                          qryDuplicatasduplicatapaga.AsBoolean := true;
                          qryDuplicatas.post;
                        end;

                        if (operacao in [topCANCELAR]) then
                        begin
                          qryDuplicatas.Edit;
                          qryDuplicatasvalorpagto.clear;
//                          qryDuplicatasvalordesconto.clear;
//                          qryDuplicatasduplicatapaga.AsBoolean := False;

                          qryDuplicatasdatapagtoaux.clear;
                          qryDuplicatasContaPagtoAux.clear;
                          qryDuplicatasChequePagtoAux.clear;
//                          qryDuplicatasduplicatapaga.clear;

                          qryDuplicatas.post;
                        end;


                        if Assigned(dtmLancamentoContabilidade) then
                        begin
                          GravarLancamentosContabeis;

                          AtribuirChave(dtmLancamentoContabilidade.qryDocumentosPagLancamentos,
                                       [dtmLancamentoContabilidade.qryDocumentosPagLancamentos.fieldbyname('numerodocumentopag')],
                                       [qryDocumentosPagNumero], true);

                          case operacao of
                            topPAGAMENTO :  result := Perpetrar([qryDocumentosPag,
                                                        qryMovtosBancos, qryMovtosBancosEventos,
                                                        qryLotesPagamento_Duplicatas,
                                                        qryDuplicatas, qrydocumentospagimpostosretidos,
                                                        qryDuplicatasImpostosRetidos,
                                                        dtmLancamentoContabilidade.qrylancamentosDocumentos,
                                                        dtmLancamentoContabilidade.qrylancamentosPagamentosDuplicatas,
                                                        dtmLancamentoContabilidade.qryDocumentosPagLancamentos,
                                                        qryLotesPagamento_DocumentosPagImpostosRetidos, qryLotesPagamento_DuplicatasImpostosRetidos], AguardareTerminarDentroDm);

                            topCANCELAR  : result := Perpetrar([qryDocumentosPag,
                                                      qryLotesPagamento_Duplicatas,
                                                      qryDuplicatas, qrydocumentospagimpostosretidos,
                                                      qryDuplicatasImpostosRetidos,
                                                      dtmLancamentoContabilidade.qrylancamentosDocumentos,
                                                      dtmLancamentoContabilidade.qrylancamentosPagamentosDuplicatas,
                                                      dtmLancamentoContabilidade.qryDocumentosPagLancamentos,
                                                      qryLotesPagamento_DocumentosPagImpostosRetidos, qryLotesPagamento_DuplicatasImpostosRetidos,
                                                      qryMovtosBancos, qryMovtosBancosEventos], AguardareTerminarDentroDm);
                          else

                            result := Perpetrar([qryDocumentosPag,
                                       qryLotesPagamento_Duplicatas,
                                       qryDuplicatas, qrydocumentospagimpostosretidos,
                                       qryDuplicatasImpostosRetidos,
                                       dtmLancamentoContabilidade.qrylancamentosDocumentos,
                                       dtmLancamentoContabilidade.qryDocumentosPagLancamentos,
                                       qryLotesPagamento_DocumentosPagImpostosRetidos, qryLotesPagamento_DuplicatasImpostosRetidos,
                                       qryMovtosBancos, qryMovtosBancosEventos], AguardareTerminarDentroDm);
                          end;

                        end
                        else
                        begin
                          case operacao of
                            topPAGAMENTO : result := Perpetrar([qryDocumentosPag,
                                                      qryMovtosBancos, qryMovtosBancosEventos,
                                                      qryLotesPagamento_Duplicatas,
                                                      qryDuplicatas,

                                                      qrydocumentospagimpostosretidos,
                                                      qryDuplicatasImpostosRetidos,
                                                      qryLotesPagamento_DocumentosPagImpostosRetidos, qryLotesPagamento_DuplicatasImpostosRetidos], AguardareTerminarDentroDm);

                            topCANCELAR  : result := Perpetrar([qryDocumentosPag,
                                                        qryLotesPagamento_Duplicatas,
                                                        qryDuplicatas, qrydocumentospagimpostosretidos,
                                                        qryDuplicatasImpostosRetidos,
                                                        qryLotesPagamento_DocumentosPagImpostosRetidos, qryLotesPagamento_DuplicatasImpostosRetidos,
                                                        qryMovtosBancos, qryMovtosBancosEventos], AguardareTerminarDentroDm);

                          else
                              result := Perpetrar([qryDocumentosPag,
                                         qryLotesPagamento_Duplicatas,
                                         qryDuplicatas, qrydocumentospagimpostosretidos,
                                         qryDuplicatasImpostosRetidos,
                                         qryLotesPagamento_DocumentosPagImpostosRetidos, qryLotesPagamento_DuplicatasImpostosRetidos,
                                         qryMovtosBancos, qryMovtosBancosEventos],AguardareTerminarDentroDm);
                          end;

                        end;

                       {Atenção após o perpetrar sem fechar a transacao uma nova alteração em duplicatas não é gravada no banco,
                         causa desconhecida, sendo assim, todas as tabelas são recuperadas novamente para este erro não ocorrer}
                         {
                       if result then
                         qryDocumentosPagAfterScroll(qrydocumentospag);
                         }

                      end;

                      if result then
                      begin

                         case operacao of
                           topPAGAMENTO : result := ValidarValoresDocumentosPag(vContaPagtoCheck, vDataPagtoCheck, vSequenciaCheck, false);
                           topCANCELAR : result := ValidarValoresDocumentosPag(vContaPagtoCheck, vDataPagtoCheck, vSequenciaCheck, true);
                         else
                           result := ValidarValoresDocumentosPag(qryDocumentosPagNumero.asinteger);
                         end;

                        if result then
                        begin
                                          {
                          if qryReinf_2010.active then
                          begin
                            if (qryReinf_2010.state in [dsedit, dsinsert]) then
                            begin
                              qryReinf_2010datahoraalteracaodadosreinf.AsDateTime := DataHoraServidor;
                              qryReinf_2010.Post;
                            end;

                            if (qryReinf_2040_recursosRep.state in [dsedit, dsinsert]) then
                            begin
                              qryReinf_2040_recursosRepdatahoraalteracaodadosreinf.AsDateTime := DataHoraServidor;
                              qryReinf_2040_recursosRep.Post;
                            end;


                            result := perpetrar([qryReinf_2010, qryReinf_2010_infoTpServ, qryReinf_2010_infoProcRetPr,
                                      qryReinf_2010_infoProcRetAd, qryReinf_2040_recursosRep, qryReinf_2040_infoRecurso,
                                      qryReinf_2040_infoProc, qryVerificarSituacao_Prestador_X_Reinf_2010_noMes])
                                      
                          end
                          else
                          }
                            result := perpetrar([]);
                            ReabrirDuplicatas;
                        end;
                      end;

                    end;

                  finally
                    qryDuplicatas.AfterPost := qryDuplicatasAfterPost;
                    qryDuplicatas.BeforePost := qryDuplicatasBeforePost;
                    qryDuplicatas.AfterScroll := qryDuplicatasAfterScroll;
                  end;

                end
                else MensagemAviso('Não foi informado um fornecedor para o ISSQN');
              end;
           end
           else MensagemAviso('O documento deve conter pelo menos uma duplicata.');
        end
        else MensagemAviso('A soma dos impostos é maior do que o valor bruto.');
      end;
    end;
//  end;
end;

function TdtmContasPagar.GravarDuplicatas(Operacao: TtecTipoOperacaoDuplicatas): Boolean;

  procedure GerarNovaParcela;
  var
    Data: TDateTime;
    ValorPago: Currency;
    TpMulta,
    TpJuros: String;
    Multa,Juros: Real;
  begin
    Data     := qryDuplicatasdatavencto.AsDateTime;
    ValorPago:= qryDuplicatasvalorpagto.AsCurrency;
    TpMulta  := qryDuplicatastipomulta.AsString;
    TpJuros  := qryDuplicatastipojuros.AsString;
    Multa    := qryDuplicatasmulta.AsFloat;
    Juros    := qryDuplicatasjuros.AsFloat;

    if fViaLote_ then
      FValorCalculado := qryDuplicatasvalorvencto.AsCurrency;

    qryDuplicatasvalorvencto.AsCurrency    := ValorPago;

    qryDuplicatas.AfterPost := nil;

    qryDuplicatas.Post;

    GuardarRegistroAtual(qryDuplicatas,true);

    qryDuplicatas.Append;
    qryDuplicatasdatavencto.AsDateTime  := Data;
    qryDuplicatasvalorvencto.AsCurrency := (FValorCalculado - ValorPago);

    qryDuplicatastipomulta.AsString     := TpMulta;
    qryDuplicatasmulta.AsFloat          := Multa;
    qryDuplicatastipojuros.AsString     := TpJuros;
    qryDuplicatasjuros.AsFloat          := Juros;

    if ParSistema.AutorizacaoPagtoAutomatica then
    begin
      qryDuplicatasautorizado.AsBoolean  := True;
      qryDuplicatasdataautorizacaopagto.AsDateTime := now;
    end
    else
    begin
       qryDuplicatasautorizado.AsBoolean  := False;
       qryDuplicatasdataautorizacaopagto.clear;
    end;

    qryDuplicatas.Post;

    VoltarRegistroAtual(qryDuplicatas);
    qryDuplicatas.AfterPost := qryDuplicatasAfterPost;
    qryDuplicatasAfterPost(qryduplicatas);
  end;

begin
  Result:= true;
  if (qryDuplicatasvalordesconto.AsCurrency > qryDuplicatasvalorvencto.AsCurrency) then
  begin
    MensagemAviso('O valor de desconto não pode ser maior que' + #10#13 +
                  'o de vencimento.');
    result := false;
  end
  else
{ if ((qryDuplicatasAgenciaPagto.AsInteger <> 0) and (qryDuplicatasContaPagto.AsInteger = 0)) then
        MensagemAviso('Numero da Conta deve ser informada.')
  else}
  begin
    if (qryDuplicatasvalorpagto.AsCurrency > 0) and
       (qryDuplicatasvalorpagto.AsCurrency < (qryDuplicatasvalorvencto.AsCurrency -
                                              qryDuplicatasvalordesconto.AsCurrency)) then
    begin
      if ExibirMensagemDesconto then
        case MensagemSimNaoOpcaoCancelar(format('Duplicata: %s  Valor a ser pago: %f Valor de vencimento: %f' + #10#13 +
                                                'O valor a ser pago é menor do que o valor de vencimento.' + #10#13 +
                                                'A operação a ser realizada, refere-se a um pagamento PARCIAL. Confirma?',
                                                [qrydocumentospagnumero.asstring+'/'+qryduplicatasnumero.asstring,
                                                 qryduplicatasvalorpagto.ascurrency,
                                                 qryduplicatasvalorvencto.ascurrency]),'',true,
                                         '&Gerar outra parcela',
                                         '&Desconto obtido') of
          mrYes: GerarNovaParcela;
          mrNo:;
          mrCancel: result := false
        end;
    end;
  end;

  if result then
  begin
    if qryDuplicatas.State in [dsEdit, dsInsert] then
    begin
      qryDuplicatas.Post;
      if not qryDocumentosPagprevisao.ReadOnly then
        qryDocumentosPagprevisao.ReadOnly:= True;
    end;

    if qryAdiantamento.Active then
      CalcularSaldoAdiantamento;

    qryDocumentosPag.ReadOnly:= False;
    qryDocumentosPag.Edit;
  end;

 (*
  if result then
    if operacao = topPAGAMENTO then
      result := GravarContasPagar(Operacao);
*)

end;

function TdtmContasPagar.IncluirContasPagar: Boolean;
begin
  ReFazConsulta(qryExisteNota,[0],[0]);
  EdicaoCampos(False);
  qryDocumentosPag.Insert;
  qryDocumentosPagadiantamento.AsBoolean := AdiantamentoFornecedor;
  Result:= True;
end;

function TdtmContasPagar.IncluirDuplicatas(Operacao: TtecTipoOperacaoDuplicatas): Boolean;
begin
  if (Operacao = topINSERIR) then
  begin
    qryDuplicatas.Append;

    if ParSistema.AutorizacaoPagtoAutomatica then
    begin
      qryDuplicatasautorizado.AsBoolean  := True;
      qryDuplicatasdataautorizacaopagto.AsDateTime := now;
    end
    else
    begin
      qryDuplicatasautorizado.AsBoolean  := False;
      qryDuplicatasdataautorizacaopagto.clear;
    end;

//    if qryDocumentosPagAgencia.AsInteger > 0 then
//       qryDuplicatasAgenciaPagto.AsInteger:= qryDocumentosPagagencia.AsInteger;

    qryDuplicatastipojuros.AsString  := 'V';
    qryDuplicatasjuros.AsFloat       := 0;
    qryDuplicatastipomulta.AsString  := 'V';
    qryDuplicatasmulta.AsFloat       := 0;
  end
  else if (Operacao = topPAGAMENTO) then
  begin
    if qryDuplicatasvalorpagto.AsCurrency = 0 then
    begin
      FValorCalculado:= 0;
      qryDuplicatas.Edit;
      if qryDuplicatasdatapagto.AsDateTime = 0 then begin
        qryDuplicatasdatapagto.AsDateTime  := DataServidor;
        qryDuplicatasfilialpagto.AsInteger := FilialBase;
        qryDuplicatasvalorpagto.AsCurrency := calcular_valor_pagar_(true);
        FValorCalculado:= qryDuplicatasvalorpagto.AsCurrency;
      end;
      qryDuplicatas.Edit;
    end
    else
      FValorCalculado := qryDuplicatasvalorpagto.AsCurrency;
  end;
  Result:=True;
end;

function TdtmContasPagar.PermiteAlterarDocumento: Boolean;
begin
{  if ParSistema.GerarContabilidade then}
   Result:=    ((qryDocumentosPagdatalancto.AsDateTime > FDataContabil) or (qryDocumentosPagdatalancto.asDateTime = 0))
           and (not fExisteQuitacao {or parsistema.Contabilizacaoporregimedecaixa})
           and (UsuarioLogin.AlterarDadosContabeis or  UsuarioLogin.Pagamento)
           and (qryDocumentosPagdocumentopagorigem.AsInteger = 0);
{  else
    Result:= (UsuarioLogin.AlterarDadosContabeis or  UsuarioLogin.Pagamento) and
            (qryDocumentosPagdocumentopagorigem.AsInteger = 0);   }
end;

function TdtmContasPagar.PermiteGerarDuplicata: Boolean;
begin
  Result:= (qryDocumentosPag.State in [dsInsert]);
  if not Result then
  begin
{    if ParSistema.GerarContabilidade then}
      Result:=     (qryDocumentosPagdatalancto.AsDateTime > FDataContabil)
               and (not fExisteQuitacao)
               and (UsuarioLogin.AlterarDadosContabeis or UsuarioLogin.Pagamento)
               and (qryDocumentosPagdocumentopagorigem.AsInteger = 0);
{    else
      Result:=     (not FExisteQuitacao)
               and (UsuarioLogin.AlterarDadosContabeis or UsuarioLogin.Pagamento)
               and (qryDocumentosPagdocumentopagorigem.AsInteger = 0);}
  end;
end;

function TdtmContasPagar.PermiteAlterarPagamento: Boolean;
begin
  Result := false;
  if not (qryDocumentosPag.State in [dsInsert]) then
  begin
{    if parsistema.GerarContabilidade then }
      Result:= (((qryDuplicatasdatapagto.AsDateTime <> 0) and
                 (qryDuplicatasdatapagto.AsDateTime > FDataContabil)) or
                (qryDuplicatasdatapagto.AsDateTime = 0)) and
               (qryDuplicatas.RecordCount>0) and
           not (qryDocumentosPagprevisao.AsBoolean) and
               (UsuarioLogin.AlterarDadosContabeis or UsuarioLogin.Pagamento) and
           not (qryDocumentosPag.State in [dsinsert, dsedit])
{    else
      Result:= (qryDuplicatasdatapagto.AsDateTime <> 0) and
               (qryDuplicatas.RecordCount>0) and
           not (qryDocumentosPagprevisao.AsBoolean) and
               (UsuarioLogin.AlterarDadosContabeis or UsuarioLogin.Pagamento)}
  end;
end;

function TdtmContasPagar.PermiteAlterarVencimento: Boolean;
begin
  Result:= (qryDocumentosPag.State in [dsInsert]);
  if not result then
    Result:= (qryDuplicatasdatapagto.AsDateTime = 0) and
             (UsuarioLogin.AlterarDadosContabeis or UsuarioLogin.Pagamento)
             and not ExisteQuitacaoImpostosRetidosDuplicatas;
end;

function TdtmContasPagar.PermiteExcluirDuplicata: Boolean;
begin
  Result := (qryDocumentosPag.State in [dsInsert]);
  if not result then
  begin
{    if ParSistema.GerarContabilidade then}
      Result:=   (qryDuplicatasdatapagto.AsDateTime = 0)
{            and (qryDuplicatasdataVencto.AsDateTime > FDataContabil)}
             and (UsuarioLogin.AlterarDadosContabeis or UsuarioLogin.Pagamento)
             and not ExisteQuitacaoImpostosRetidosDuplicatas;
{    else
      Result:=   (qryDuplicatasdatapagto.AsDateTime = 0)
             and (UsuarioLogin.AlterarDadosContabeis or UsuarioLogin.Pagamento)
             and not ExisteQuitacaoImpostosRetidosDuplicatas;}
  end;
end;

procedure TdtmContasPagar.qryDocumentosPagBeforeClose(DataSet: TDataSet);
begin
  inherited;
  EdicaoCampos(False);
  qryDuplicatas.Close;
  qryExisteNota.Close;
end;

procedure TdtmContasPagar.qryDocumentosPagNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryDocumentosPagemissao.AsDateTime:= Date;
  qryDocumentosPagdatalancto.AsDateTime:= Date;
  qryDocumentosPagfilialemissao.AsInteger:= FilialBase;
  qryDocumentosPagtipofornecedor.AsString:= 'F';
  qryDocumentosPagprevisao.AsBoolean     := False;
  qryDocumentosPagadministrador.AsBoolean := False;
  qryDocumentosPagadiantamento.AsBoolean := False;
  qryDocumentosPagregimedecaixa.AsBoolean := False;
end;

procedure TdtmContasPagar.qryDuplicatasAfterDelete(DataSet: TDataSet);
begin
  inherited;

  CalcularSaldoAdiantamento;

  GetExisteQuitacao;
  EdicaoCampos(not PermiteAlterarDocumento);

  if qryDocumentosPag.ReadOnly then
    qryDocumentosPag.ReadOnly:= False;

  if qryDocumentosPag.State = dsBrowse then
    qryDocumentosPag.Edit;

  AjustarSequencias;


  cdsTotalDuplicatas.close;
  cdsTotalDuplicatas.open;

    
end;

procedure TdtmContasPagar.qryProcurarFornecedoresBeforeOpen(DataSet: TDataSet);
begin
  inherited;

  if not qryConsultaFornecedores.Active then
  begin
    if ParSistema.SelecionarSomenteFornecedoresnasContasaPagar then
    begin
      if qryProcurarFornecedores.ParamByname('codigo').AsString = qryDocumentosPagfornecedor.AsString then
        qryProcurarFornecedores.Params[0].AsString := qryDocumentosPagtipofornecedor.AsString
      else
        qryProcurarFornecedores.Params[0].AsString := 'F';
    end
    else
      qryProcurarFornecedores.Params[0].AsString := qryDocumentosPagtipofornecedor.AsString;
  end;

  if qryProcurarFornecedores.Params[0].AsString = '' then
    qryProcurarFornecedores.Params[0].AsString:= 'F';


end;

procedure TdtmContasPagar.Selecionar(TipoPesquisa: TtecQuitacaoDuplicatas);
begin
  if not (TipoPesquisa in [dupDOCUMENTOSPAG, dupFORNECEDORES,
                            dupFILIAISPAGTO, dupCONTA,
                            dupTIPOPAGTO, dupCONTADEBITO,
                            dupCONTACREDITO]) then
  begin
    qryDocumentosPag.ReadOnly := False;
    qryDocumentosPag.Edit;
  end;

  if (TipoPesquisa in [dupFILIAISPAGTO, dupCONTA, dupTIPOPAGTO,
                       dupBANCOVENCTO, dupCONTACREDITO]) then
    qryDuplicatas.Edit;

  case TipoPesquisa of
    dupDOCUMENTOSPAG: ReFazConsulta(qryDocumentosPag,[0],[qryConsultaDocumentosPagnumero.AsInteger]);
    dupFILIAIS      : qryDocumentosPagfilialemissao.AsInteger:= qryConsultaFiliaiscodigo.AsInteger;
    dupFORNECEDORES : begin
                        qryProcurarFornecedores.Params[0].AsString:= qryConsultaFornecedorestipo.AsString;
                        qryDocumentosPag.Edit;
                        qryDocumentosPagfornecedor.AsInteger := qryConsultaFornecedorescodigo.AsInteger;
                        qryDocumentosPagtipofornecedor.AsString  := qryConsultaFornecedorestipo.AsString;
                      end;

//    dupAGENCIA      : qryDocumentosPagagencia.AsInteger      := qryConsultaAgenciascodigo.AsInteger;
    dupFILIAISPAGTO : qryDuplicatasfilialpagto.AsInteger     := qryConsultaFiliaiscodigo.AsInteger;
            dupCONTA: begin
                         ReFazConsulta(qryProcurarContas,[0],[qryConsultarContasConta.AsInteger]);
                         qryDuplicatascontapagto.AsInteger:= qryProcurarContasConta.AsInteger;
                      end;

dupCONTADOCUMENTOSPAG: begin
                         ReFazConsulta(qryProcurarContas,[0],[qryConsultarContasConta.AsInteger]);
                         qryDocumentosPagcontapagto.asinteger := qryProcurarContasConta.AsInteger;
                      end;

    dupBANCOVENCTO  : begin
                        ReFazConsulta(qryProcurarBancos,[0], [qryConsultarBancosCodigo.AsInteger]);
                        qryDuplicatasBancoCobranca.AsInteger := qryProcurarBancosCodigo.AsInteger;
                      end;
//    dupAGENCIAPAGTO : begin
//                        ReFazConsulta(qryProcurarAgenciasPagamento,[0],[qryProcurarBancosPagamentoCODIGO.AsInteger]);
//                        qryDuplicatasagenciapagto.AsInteger := qryConsultaAgenciasPagamentocodigo.AsInteger;
//                        ReFazConsulta(qryContasPagto,[0,1],[qryProcurarAgenciasPagamentoBanco.AsInteger,
//                                                            qryProcurarAgenciasPagamentoCodigo.AsString]);
 //                     end;
//    dupAGENCIAVENCTO: begin
//                        ReFazConsulta(qryProcurarAgenciasVencimento,[0],[qryProcurarBancosVencimentoCODIGO.AsInteger]);
//                        qryDuplicatasAgenciaVencto.AsInteger := qryConsultaAgenciasVencimentoCodigo.AsInteger;
//                      end;
    dupTIPOPAGTO    : qryDuplicatastipopagamento.AsInteger := qryConsultaTipoPagamentocodigo.AsInteger;
    dupTIPOPAGTODOCUMENTOSPAG : qryDocumentospagtipopagamento.AsInteger := qryConsultaTipoPagamentocodigo.AsInteger;


  end;
end;

function TdtmContasPagar.TotalDuplicatas: Currency;
var
  Tot: Currency;
Begin
  Tot:= 0;

  qryDuplicatas.GuardarRegistroAtual(true);
  try
    qryDuplicatas.onCalcFields := nil;
    qryDuplicatas.AfterPost := nil;
    qryDuplicatas.BeforePost := nil;
    qryDuplicatas.AfterScroll := nil;


    qryDuplicatas.First;
    while not qryDuplicatas.Eof do begin
      Tot:= Tot + qryDuplicatasvalorvencto.AsCurrency;
      qryDuplicatas.Next;
    end;

  finally
    qryDuplicatas.VoltarRegistro;

    qryDuplicatas.AfterPost := qryDuplicatasAfterPost;
    qryDuplicatas.BeforePost := qryDuplicatasBeforePost;
    qryDuplicatas.AfterScroll := qryDuplicatasAfterScroll;
    qryDuplicatas.onCalcFields := qryDuplicatasCalcFields;

  end;
  Result:= Tot;
end;

function TdtmContasPagar.TotalImpostosRetidos: Currency;
begin
  Result:= qryDocumentosPagirretido.    AsCurrency +
           qryDocumentosPaginssretido.  AsCurrency +
           qryDocumentosPagissretido.   AsCurrency +
           qryDocumentosPagpisretido.   AsCurrency +
           qryDocumentosPagcofinsretido.AsCurrency +
           qryDocumentosPagcsllretido.  AsCurrency +
           qryDocumentosPagpiscofinscsllretido.  AsCurrency
end;

function TdtmContasPagar.ExisteBancosVencto(Campo, Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultarBancos, Campo, Codigo);
end;

function TdtmContasPagar.GetConsultarBancosVencto: TtecQuery;
begin
  Result:= qryConsultarBancos;
end;



function TdtmContasPagar.ExisteConta(Campo, Codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultarContas, Campo, Codigo);
end;


function TdtmContasPagar.GetDuplicataAutorizada: Boolean;
begin
  Result:= qryDuplicatasautorizado.AsBoolean;
end;

function TdtmContasPagar.calcular_valor_pagar_(forced: Boolean): Currency;

var vDataBase : TDateTime;
{{
 Multa,Juros: Real;
 NrDias: Integer;
 vDataVencto : TDateTime;

 }

begin

  result := 0;


  if forced or
     (qryDuplicatasdatapagto.isnull and
       (qryDocumentosPagfilialemissao.AsInteger <> qryDocumentosPagfilialemissao_ant.AsInteger) or
  //     (DataServidor <> qryDuplicatasdataservidor_ant.AsDateTime) or
       (qryDuplicatasvalorvencto.AsCurrency <> qryDuplicatasvalorvencto_ant.AsCurrency) or

       (qryDuplicatasmulta.AsCurrency <> qryDuplicatasmulta_ant.AsCurrency) or
       (qryDuplicatastipomulta.AsString <> qryDuplicatastipomulta_ant.AsString) or
       (qryDuplicatasjuros.AsCurrency <> qryDuplicatasjuros_ant.AsCurrency) or
       (qryDuplicatastipojuros.AsString <> qryDuplicatastipojuros_ant.AsString) or
       (qryDuplicatasvalordesconto.AsCurrency <> qryDuplicatasvalordesconto_ant.AsCurrency) or
       (qryDuplicatasdatavencto.AsDateTime <> qryDuplicatasdatavencto_ant.AsDateTime)
     ) then
     begin
      if (operacao=topPAGAMENTO) then
        vDataBase := qryduplicatasdatapagto.asdateTime
      else
        vDataBase := dataservidor;

      result :=
       calcular_valor_pagar(qryDuplicatasvalorvencto.AsCurrency,
                         qryDuplicatasmulta.AsCurrency,
                         qryDuplicatastipomulta.AsString,
                         qryDuplicatasjuros.AsCurrency,
                         qryDuplicatastipojuros.AsString,
                         qryDuplicatasvalordesconto.AsCurrency,
                         qryDuplicatasdatavencto.AsDateTime,
                         vDataBase,
                         qryDocumentosPagfilialemissao.AsInteger, Forced);
    end;


(*
  Multa:= 0;  Juros:= 0;
  if qryDuplicatasdatavencto.isnull then
    vDataVencto := dataservidor
  else
  begin
  {
    if qryDuplicatasdatavencto.AsDateTime <>
       qryDuplicatasdatavencto.OldValue then
       }
      vDataVencto := PrimeiroDiaUtil(qryDocumentosPagfilialemissao.AsInteger, qryDuplicatasdatavencto.AsDateTime, 'P');
      {
    else
      vDataVencto := qryDuplicatasprimeirodiautil.asdateTime;}
  end;

//   PrimeiroDiaUtil_(qryDocumentosPagfilialemissao.AsInteger, qryDuplicatasdatavencto.AsDateTime, 'P');

 if (DataServidor > vDataVencto) then
 begin
   NrDias:= DaysBetween(DataServidor,vDataVencto);
   if qryDuplicatasmulta.AsFloat > 0 then
     if (qryDuplicatastipomulta.AsString = '%') then
          Multa := ((qryDuplicatasvalorvencto.AsCurrency * qryDuplicatasmulta.AsFloat) / 100)
     else Multa := qryDuplicatasmulta.AsFloat;

   if qryDuplicatasjuros.AsFloat > 0 then
     if qryDuplicatastipojuros.AsString = '%' then
          Juros := ((qryDuplicatasvalorvencto.AsCurrency * (qryDuplicatasjuros.AsFloat * NrDias)) / 100)
     else Juros := (qryDuplicatasjuros.AsFloat * NrDias);

 end;

 if dataservidor <= vDataVencto then
   Result:= qryDuplicatasvalorvencto.AsCurrency + Multa + Juros - qryDuplicatasvalordesconto.AsCurrency
 else
   Result:= qryDuplicatasvalorvencto.AsCurrency + Multa + Juros;

*)

end;

procedure TdtmContasPagar.qryDuplicatasCalcFields(DataSet: TDataSet);
begin
   inherited;
   if qryDuplicatasvalorpagto.AsCurrency >=
      (qryDuplicatasValorVencto.AsCurrency -
      qryDuplicatasvalordesconto.AsCurrency) then
     qryDuplicatasValoraPagarCalc.AsCurrency := 0.00
   else
     qryDuplicatasValoraPagarCalc.AsCurrency :=
       qryDuplicatasValoraPagar.AsCurrency 
       - qryDuplicatasvalorpagto.AsCurrency;

        {
   if not qryDuplicatasduplicatapaga.AsBoolean then
     qryDuplicatasvalorapagar.AsCurrency:= ValorPagar
   else
     qryDuplicatasvalorapagar.AsString  := '';
     }
end;


procedure TdtmContasPagar.DataModuleCreate(Sender: TObject);
begin
  inherited;
  RemoveDataModule(Self);
//  qryConsultarContas.Open;

end;

procedure TdtmContasPagar.DataModuleDestroy(Sender: TObject);
begin
  inherited;
//  qryConsultarContas.Close;
end;

procedure TdtmContasPagar.dsrDuplicatasDataChange(Sender: TObject;
  Field: TField);
VAR
  vPodeContinuar: Boolean;
begin
   inherited;
   vPodeContinuar := True;
   
   if field = qryDuplicatastipopagamento then
   begin
     if qryDuplicatastipopagamento.AsInteger = 3 then {Adiantamento}
     begin
       dsrduplicatas.OnDataChange := nil;
       {Quando for adiantamento não possui movtos bancos, pois já foi movimentado}
       qryDuplicatascontapagto.Clear;
       qryDuplicataschequepagto.Clear;
       qryDuplicatascontacredito.Clear;
       if ParSistema.GerarContabilidade then
       begin
         if qryProcurarFornecedoresadiantamento.AsInteger<>0 then
         begin
           if (qryDocumentosPagcreditar.AsInteger<>0) then
              qryDuplicatascontacredito.AsInteger := qryProcurarFornecedoresadiantamento.AsInteger
           else
           begin
             MensagemErro('Não foi definida a contrapartida do lançamento.');
             qryDuplicatastipopagamento.Clear;
           end;
         end
         else
            MensagemErro(format(ctFORNECEDORSEMADIANTAMENTO,
               [qryProcurarFornecedoresnome.AsString]));
       end;
       dsrDuplicatas.OnDataChange := dsrDuplicatasDataChange;
     end
     else
     begin
       if ParSistema.GerarContabilidade then
         if qryDuplicatascontapagto.IsNull then
           qryDuplicatascontacredito.Clear;
     end;

     if assigned(DuplicatastipopagamentoChange) then
       DuplicatastipopagamentoChange(qryDuplicatastipopagamento);

     if assigned(DuplicatasContaPagtoChange) then
       DuplicatasContaPagtoChange(qryDuplicatasContaPagto);

   end
   else
   if field = qryDuplicatasContaPagto then
   begin

     if assigned(DuplicatasContaPagtoChange) then
       DuplicatasContaPagtoChange(qryDuplicatasContaPagto);

     if parsistema.GerarContabilidade then
     begin
       if not qryProcurarContascontacontabil.IsNull then
         qryDuplicatascontacredito.AsInteger :=qryProcurarContascontacontabil.AsInteger;

       if (qryDocumentosPagcreditar.AsInteger=0) and
          (dtmLancamentoContabilidade.qryDocumentosPagLancamentos.RecordCount=0) and
          not (qryduplicatascontapagto.IsNull) then
       begin
           MensagemAviso('Não foi definida a contrapartida do lançamento.');
           dsrduplicatas.OnDataChange := nil;
           qryDuplicatascontapagto.Clear;
           dsrduplicatas.OnDataChange := dsrDuplicatasDataChange;
       end;
     end;

     if not VerificarChequeCadastrado then
     begin
       dsrduplicatas.OnDataChange := nil;
       qryDuplicatasContaPagto.AsString := qryDuplicatascontapagtoaux.AsString;
       dsrduplicatas.OnDataChange := dsrDuplicatasDataChange;
       DuplicatasDataPagtoError(qryDuplicatascontapagto)
     end;

   end
   else
   if field = qryDuplicataschequepagto then
   begin
     if not VerificarChequeCadastrado then
     begin
       qryDuplicataschequepagto.AsString := qryDuplicataschequepagtoaux.AsString;
       DuplicatasDataPagtoError(qryDuplicataschequepagto)
     end;
   end
   else
   if field = qryDuplicatasdatapagto then
   begin
     if not VerificarChequeCadastrado then
     begin
       vPodeContinuar := False;
       qryDuplicatasdatapagto.AsDateTime := qryDuplicatasdatapagtoaux.AsDateTime;
       DuplicatasDataPagtoError(qryDuplicatasDataPagto)
     end;
//     vPodeContinuar := not qryDuplicatasdatapagto.isnull;
   end
   {
   else
   if field = qryDuplicatasdatapagto then
   begin
     if (qryDuplicatasDatapagto.OldValue <> null) and
        (qryDuplicatasdatapagto.IsNull) then
      if PagamentosVinculados<>'' then
      begin
        MensagemErro(format(ctEXISTEPAGTOIMPOSTOSVINCULADOS,[fPagamentosVinculados]));
        qryDuplicatasdatapagto.AsVariant := qryDuplicatasdatapagto.OldValue;
      end;
   end
   }
   else
   if field = qryDuplicatasBancoCobranca then
   begin
//     qryDuplicatasAgenciaVencto.Clear;
//     qryProcurarAgenciasVencimento.Params[0].AsInteger := qryDuplicatasBancoVencto.AsInteger;
//     qryConsultaAgenciasVencimento.Params[0].AsInteger := qryDuplicatasBancoVencto.AsInteger;
   end
   else
   if field = qryDuplicatasValorVencto then
   begin
     if Assigned(AfterScrollDuplicatas) then
       AfterScrollDuplicatas(dsrDuplicatas);
   end
   else
   if field = qryDuplicatasvalorpagto then
   begin
     if field.value = 0 then
     begin
       dsrduplicatas.OnDataChange := nil;
       if MensagemConfirmacao('A quitação será com 100% de desconto. Confirma?') = smbOk then
       begin
         qryDuplicatastipopagamento.clear;
         qryDuplicatasContaPagto.clear;
         qryDuplicataschequepagto.clear;
         qryDuplicatasvalordesconto.AsCurrency := qryDuplicatasValorVencto.AsCurrency;
       end
       else
         qryDuplicatasvalorpagto.AsCurrency := qryDuplicatasValorVencto.AsCurrency;
       dsrduplicatas.OnDataChange := dsrDuplicatasDataChange;
     end;
   end;

   if vPodeContinuar then
     if (field = qryDuplicatasdatapagto) or
        (field = qryDuplicatasvalorvencto) or
        (field = qryDuplicatasmulta) or
        (field = qryDuplicatastipomulta) or
        (field = qryDuplicatasjuros) or
        (field = qryDuplicatastipojuros) or
        (field = qryDuplicatasvalordesconto) or
        (field = qryDuplicatasdatavencto) then
     begin
       if field = qryDuplicatasdatapagto then
       begin
         dsrduplicatas.OnDataChange := nil;
         qryDuplicatasvalorpagto.AsCurrency := calcular_valor_pagar_(true);
         dsrduplicatas.OnDataChange := dsrDuplicatasDataChange;
       end
       else
       if operacao=TopCancelar then
         qryDuplicatasvalorapagar.AsCurrency := calcular_valor_pagar_(true)
       else
         qryDuplicatasvalorapagar.AsCurrency := calcular_valor_pagar_;

     end;


end;

function TdtmContasPagar.GetConsultarContaPagto: TtecQuery;
begin
   Result:= qryConsultarContas;
end;

procedure TdtmContasPagar.qryDocumentosPagCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryDocumentosPagValorLiquido.AsCurrency:= qryDocumentosPagvalor.       AsCurrency -
                                            qryDocumentosPagIRRetido.    AsCurrency -
                                            qryDocumentosPagINSSRetido.  AsCurrency -
                                            qryDocumentosPagISSRetido.   AsCurrency -
                                            qryDocumentosPagPISRetido.   AsCurrency -
                                            qryDocumentosPagCOFINSRetido.AsCurrency -
                                            qryDocumentosPagCSLLRetido.  AsCurrency -
                                            qryDocumentosPagPISCOFINSCSLLRetido.  AsCurrency;

end;

procedure TdtmContasPagar.dsrDocumentosPagDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if field = qryDocumentosPagfornecedor then
  begin
    qryDocumentosPagtipofornecedor.AsString := qryProcurarFornecedorestipo.AsString;
    if ParSistema.GerarContabilidade then
    begin
      if not AdiantamentoFornecedor then
      begin
        if not qryProcurarFornecedoresdebito.IsNull then
          qryDocumentosPagcreditar.AsVariant := qryProcurarFornecedoresdebito.AsVariant
        else qryDocumentosPagcreditar.clear;
      end
      else
      begin
        if not qryProcurarFornecedoresadiantamento.IsNull then
          qryDocumentosPagdebitar.AsVariant := qryProcurarFornecedoresadiantamento.AsVariant
        else qryDocumentosPagdebitar.clear;
      end;
    end;
    if not qryDocumentosPagadiantamento.AsBoolean then
      RefazConsultaPorNome(qryAdiantamento,
         ['fornecedor','tipofornecedor','numero'],
         [qryDocumentosPagfornecedor.AsVariant,
          qrydocumentospagtipofornecedor.asvariant,
          qryDocumentosPagNumero.AsVariant]);
  end
  else
  if field = qryDocumentosPagfilialemissao then
  begin
    qryDocumentosPagfilialcontabil.AsInteger := ifthen(qryProcurarFiliaiscontabil.AsInteger<>0,qryProcurarFiliaiscontabil.AsInteger,qryProcurarFiliaiscodigo.AsInteger);

    if qryDocumentosPagfilialcontabil.AsInteger = 0 then
      qryDocumentosPagfilialcontabil.AsInteger := qryDocumentosPagfilialemissao.AsInteger;

    if ParSistema.GeracaoAutomaticadoImpostoRetido then
      ReFazConsulta(qryVenctosImpostosRetidosEntradas, [0], [qryDocumentosPagfilialemissao.Asinteger]);
  end
  else
  if field = qryDocumentosPagissretido then
  begin
    if (qryDocumentosPagissretido.AsCurrency = 0) or
        qryDocumentosPagissretido.IsNull then
      if (qryDocumentosPag.State in [dsedit, dsinsert]) then
        qryDocumentosPagfornecedorparaiss.Clear;
  end
  else
  if field = qryDocumentosPagcontapagto then
  begin
    if AdiantamentoFornecedor and
       ParSistema.GerarContabilidade then
    begin
      if not qryProcurarContascontacontabil.IsNull then
        qryDocumentosPagcreditar.AsVariant := qryProcurarContascontacontabil.AsVariant
      else
        qryDocumentosPagcreditar.clear;
    end;
  end
  else
  if field = qryDocumentosPagadiantamento then
  begin
    qryDocumentosPagEvento.Required := qryDocumentosPagEvento.Required or field.AsBoolean;
    qryDocumentosPagdebitar.Required := field.AsBoolean and ParSistema.GerarContabilidade;
    qryDocumentosPagcreditar.Required := field.AsBoolean and parsistema.GerarContabilidade;
    qryDocumentosPagtipopagamento.Required := field.AsBoolean;
    qryDocumentosPagcontapagto.Required := field.AsBoolean;
  end
  else
  if (field = qryDocumentosPagpisbasecalculo) or
     (field = qryDocumentosPagpisaliquota) then
    qryDocumentosPagpisvalor.AsCurrency := qryDocumentosPagpisbasecalculo.AsCurrency * qryDocumentosPagpisaliquota.AsCurrency / 100
  else
  if (field = qryDocumentosPagcofinsbasecalculo) or
     (field = qryDocumentosPagcofinsaliquota) then
  qryDocumentosPagcofinsvalor.AsCurrency := qryDocumentosPagcofinsbasecalculo.AsCurrency * qryDocumentosPagcofinsaliquota.AsCurrency / 100;

end;

procedure TdtmContasPagar.qryDuplicatasjurosGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if qryDuplicatastipojuros.AsString = '%' then
    text := FormatarValor(qryDuplicatasjuros.AsCurrency,2)+'%'
  else text := FormatarValor(qryDuplicatasjuros.AsCurrency,2);
end;

procedure TdtmContasPagar.qryDuplicatasmultaGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if qryDuplicatastipomulta.AsString = '%' then
    text := FormatarValor(qryDuplicatasmulta.AsCurrency,2)+'%'
  else text := FormatarValor(qryDuplicatasmulta.AsCurrency,2);
end;

function TdtmContasPagar.GetPermiteAlterarContabilidade: boolean;
begin
  fPermiteAlterarContabilidade:= True;
  if not (qryDocumentosPag.State in [dsInsert]) then
     fPermiteAlterarContabilidade :=
               (qryDocumentosPagdatalancto.AsDateTime > FDataContabil) and
                UsuarioLogin.AlterarDadosContabeis and
                ParSistema.GerarContabilidade and
                not existenota and
                (qryDocumentosPagdocumentopagorigem.AsInteger<>0)

  else
     fPermiteAlterarContabilidade :=
               UsuarioLogin.AlterarDadosContabeis and
               ParSistema.GerarContabilidade;
  Result := fPermiteAlterarContabilidade;

end;

function TdtmContasPagar.GetListaContasContabeis: String;
begin
  if FListaContasContabeis <> '' then
    Result := FListaContasContabeis
  else Result := '0';
end;

function TdtmContasPagar.GetOrigem: String;
begin
  if ExisteNota then
    fOrigem := 'E'
  else
  begin
//    if qryDocumentosPagadiantamento.AsBoolean then
//      fOrigem := 'AD'
//    else
      fOrigem := 'D';
  end;

  Result := fOrigem;

end;

function TdtmContasPagar.GetDescricaoOrigem: String;
begin
  if ExisteNota then
    fDescricaoOrigem := 'ENTRADA'
  else fDescricaoOrigem := 'DOCUMENTO';
  Result := fDescricaoOrigem;
end;

function TdtmContasPagar.GetNrOrigem: integer;
begin
  if ExisteNota then
    fNrOrigem := qryExisteNotacodigo.AsInteger
  else fNrOrigem := qryDocumentosPagNumero.AsInteger;
  Result := fNrOrigem;
end;

function TdtmContasPagar.GetTituloOrigem: String;
begin
  if ExisteNota then
    fTituloOrigem := 'Lançamentos Contábeis da Nota Fiscal'
  else fTituloOrigem := 'Lançamentos Contábeis do Documento';
  Result := fTituloOrigem;
end;


destructor TdtmContasPagar.Destroy;
begin
{
  if assigned(self.frmcadastroduplicatascontaspagar) then
    frmcadastroduplicatascontaspagar.free;
}    
  
  inherited;

  if assigned(dtmlancamentocontabilidade) then
    dtmLancamentoContabilidade := nil;
end;


procedure TdtmContasPagar.qryDocumentosPagAfterScroll(DataSet: TDataSet);
var
  vNumeroDuplicata : integer;
  vDataVenctoDuplicata : TDateTime;
begin
  inherited;
  FContrapartidaAlterada := false;
  ForadoLimitedaDataContabil := qryDocumentosPagdatalancto.AsDateTime <= fDataContabil;

  vNumeroDuplicata := qryDuplicatasnumero.asinteger;
  vDataVenctoDuplicata := qryDuplicatasdataVencto.asDateTime;

  qryDuplicatas.MacroByName('SelecionarPorChave').AsString := '';

  try
    qryDuplicatas.disablecontrols;
    RefazConsultapornome(qryDuplicatas,['documento','DataVencto','numero'],[qryDocumentosPagnumero.AsInteger, 0, 0]);
  finally
    qryDuplicatas.enablecontrols;
    qryDuplicatasAfterScroll(qryDuplicatas);
  end;

  if vNumeroDuplicata <> 0 then
    qryduplicatas.locate('numero,datavencto', VarArrayOf([qryDuplicatasnumero.asinteger, qryDuplicatasdataVencto.asDateTime]),[]);

  qryDocumentosPagImpostosRetidos.MacroByName('SelecionarPorChave').asString := '';
  ReFazConsultaPorNome(qryDocumentosPagImpostosRetidos,
                 ['documentopagorigem', 'datavenctoorigem', 'numeroorigem'],
                 [qryDocumentosPagnumero.AsInteger, 0, 0]);

  ReFazConsulta(qryDuplicatasImpostosRetidos,[0],[qryDocumentosPagnumero.AsInteger]);

  ReFazConsulta(qryExisteNota,[0],[qryDocumentosPagnumero.AsInteger]);

  GetExisteQuitacao;
  EdicaoCampos(not PermiteAlterarDocumento);

  if ParSistema.GeracaoAutomaticadoImpostoRetido then
    ReFazConsulta(qryVenctosImpostosRetidosEntradas, [0], [qryDocumentosPagfilialemissao.Asinteger]);

  qryDocumentosPagEvento.Required        := qryDocumentosPagEvento.Required or AdiantamentoFornecedor;
  qryDocumentosPagdebitar.Required       := AdiantamentoFornecedor and ParSistema.GerarContabilidade;
  qryDocumentosPagcreditar.Required      := AdiantamentoFornecedor and parsistema.GerarContabilidade;
  qryDocumentosPagtipopagamento.Required := AdiantamentoFornecedor;
  qryDocumentosPagcontapagto.Required    := AdiantamentoFornecedor;


  RefazConsultaPorNome(qryAdiantamento,
    ['fornecedor','tipofornecedor','numero'],
    [qryDocumentosPagfornecedor.AsVariant,
     qrydocumentospagtipofornecedor.asvariant,
     qryDocumentosPagNumero.AsVariant]);

     {
  RefazConsultaPorNome(qryReinf_2010, ['documentopag'], [qryDocumentosPagnumero.AsInteger]);
  RefazConsultaPorNome(qryReinf_2010_infoTpServ, ['documentopag'], [qryDocumentosPagnumero.AsInteger]);
  RefazConsultaPorNome(qryReinf_2010_infoProcRetPr, ['documentopag'], [qryDocumentosPagnumero.AsInteger]);
  RefazConsultaPorNome(qryReinf_2010_infoProcRetAd, ['documentopag'], [qryDocumentosPagnumero.AsInteger]);

  RefazConsultaPorNome(qryEnvioReinf_2010, ['documentopag'], [qryDocumentosPagnumero.AsInteger]);
  RefazConsultaPorNome(qryEnvioReinf_2010_infoTpServ, ['documentopag'], [qryDocumentosPagnumero.AsInteger]);
  RefazConsultaPorNome(qryEnvioReinf_2010_infoProcRetPr, ['documentopag'], [qryDocumentosPagnumero.AsInteger]);
  RefazConsultaPorNome(qryEnvioReinf_2010_infoProcRetAd, ['documentopag'], [qryDocumentosPagnumero.AsInteger]);


  RefazConsultaPorNome(qryReinf_2040_recursosRep, ['documentopag'], [qryDocumentosPagnumero.AsInteger]);
  RefazConsultaPorNome(qryReinf_2040_infoRecurso, ['documentopag'], [qryDocumentosPagnumero.AsInteger]);
  RefazConsultaPorNome(qryReinf_2040_infoProc, ['documentopag'], [qryDocumentosPagnumero.AsInteger]);

  RefazConsultaPorNome(qryEnvioReinf_2040_recursosRep, ['documentopag'], [qryDocumentosPagnumero.AsInteger]);
  RefazConsultaPorNome(qryEnvioReinf_2040_infoRecurso, ['documentopag'], [qryDocumentosPagnumero.AsInteger]);
  RefazConsultaPorNome(qryEnvioReinf_2040_infoProc, ['documentopag'], [qryDocumentosPagnumero.AsInteger]);
  }

  if qryDocumentosPagtipofornecedor.AsString <> '' then
  begin
    if qryProcurarFornecedores.Params[0].AsString <> qryDocumentosPagtipofornecedor.AsString then
    begin
      qryProcurarFornecedores.Params[0].AsString := qryDocumentosPagtipofornecedor.AsString;
      if qryProcurarFornecedores.recordcount <> 0 then
      begin
        qryProcurarFornecedores.close;
        qryProcurarFornecedores.open;
      end;
    end;

  end;

  if Assigned(FAfterOpenDocumentosPag) then
    FAfterOpenDocumentosPag(DataSet);
  

end;


function TdtmContasPagar.getdescricaohistorico: String;
begin
  fdescricaohistorico := 'DOCUMENTO '+qryDocumentosPagcomplemento.asstring +
                         ' - '+trim(qryProcurarFornecedoresnome.AsString);
  Result := fdescricaohistorico;
end;

function TdtmContasPagar.GetExisteDuplicatas: boolean;
begin
  FExisteDuplicatas := not qryduplicatas.IsEmpty;
  Result := FExisteDuplicatas;
end;

function TdtmContasPagar.PermiteAlterarEvento: Boolean;
begin
  Result:= (qryDocumentosPag.State in [dsInsert]);
  if not Result then
  begin
{    if ParSistema.GerarContabilidade then}
       Result:=    (qryDocumentosPagdatalancto.AsDateTime > FDataContabil)
               and (UsuarioLogin.AlterarDadosContabeis or UsuarioLogin.Pagamento)
               { and not ExisteQuitacao } ;
{    else
       Result:= (UsuarioLogin.AlterarDadosContabeis or UsuarioLogin.Pagamento)}
  end
end;

function TdtmContasPagar.GetPagamentosVinculados: String;
begin
  FPagamentosVinculados := '';
  qryDocumentosPagImpostosRetidos.First;
  while not qryDocumentosPagImpostosRetidos.Eof do
  begin
    if (qryDocumentosPagImpostosRetidosdatavenctoorigem.AsDateTime =
        qryDuplicatasDataVencto.AsDateTime) and
       (qryDocumentosPagImpostosRetidosnumeroorigem.AsInteger =
        qryDuplicatasNumero.AsInteger) then
    begin
      qryDuplicatasImpostosRetidos.First;
      while not qryDuplicatasImpostosRetidos.Eof do
      begin
        if (qryDuplicatasImpostosRetidosdocumentopag.AsInteger =
            qryDocumentosPagImpostosRetidosnumero.AsInteger) then
        begin
          if not qryDuplicatasImpostosRetidosdatapagto.IsNull and
             not ExistenaListadeDuplicatasSelecionadas then
          begin
            FPagamentosVinculados := FPagamentosVinculados +
                       qryDuplicatasImpostosRetidosdocumentopag.AsString + ', ';

          end;
        end;
        qryDuplicatasImpostosRetidos.Next;
      end;
    end;
    qryDocumentosPagImpostosRetidos.Next;
  end;
  if FPagamentosVinculados<>'' then
    delete(FPagamentosVinculados,length(FPagamentosVinculados)-1,2);

  Result := FPagamentosVinculados;
end;


function TdtmContasPagar.QuitarDuplicatas(DocumentoPag, NumeroDuplicata,
  FilialPagto, TipoPagto, ContaBancaria, ContaCreditoContabil: integer;
  Cheque, Observacao: String; DataVencto, DataQuitacao: tDateTime;
  ValorPagamento: Currency;
  ValorDesconto: Currency;
  AgruparPagamentosnoLote: Boolean;
  SequenciaMovtosBancos, NrLoteContabil: String): Boolean;
const
  SQLDuplicatas = 'and d.datavencto = :DataVencto and d.numero = :numero';
  SQLDocumentosPagImpostosRetidos = 'and p.datavenctoorigem = :datavenctoorigem and p.numeroorigem = :numeroorigem';
begin
  fViaLote_ := True;
  try
    result := AbrirDocumentos(DocumentoPag, NumeroDuplicata, DataVencto);
    OrigemImpostosRetidos := PagamentoDuplicatas;
    if result then
    begin
      dsrDuplicatas.OnDataChange := nil;
      qryduplicatas.Edit;
      qryDuplicatasdatapagto.AsDateTime      := DataQuitacao;
      qryDuplicatasvalorpagto.AsCurrency     := ValorPagamento;
      qryDuplicatasvalordesconto.AsCurrency  := ValorDesconto;

      qryDuplicatasfilialpagto.AsInteger     := FilialPagto;
      qryDuplicatastipopagamento.AsInteger   := TipoPagto;
      qryDuplicatasusuario.AsInteger         := CodigoUsuario;
      qryDuplicatasobservacao.AsString       := Observacao;

      if ContaBancaria<>0 then
      begin
        qryDuplicatascontapagto.AsInteger    := ContaBancaria;
        if Cheque <> '' then
          qryDuplicataschequepagto.AsInteger := StrToInt(Cheque);
      end;

      if (DataQuitacao >= ParSistema.InicioIntegracaoBancos) and
         (ParSistema.InicioIntegracaoBancos > StrToDateTime('01/01/1980')) then
      begin
        if AgruparPagamentosnoLote and (SequenciaMovtosBancos<>'') then
          qryDuplicatassequencia.AsString := SequenciaMovtosBancos
        else
        begin
          if not qryMovtosBancosProximaSequencia.Active then
            RefazConsultaPorNome(qryMovtosBancosProximaSequencia, ['ContaPagto', 'DataPagto'], [qryDuplicatascontapagto.AsInteger, qryDuplicatasdatapagto.AsDateTime]);
          qryDuplicatassequencia.AsInteger := qryMovtosBancosProximaSequencianumero.AsInteger + 1;
        end;

        RefazConsultaPorNome(qryMovtosBancosProximaSequenciaEvento, ['ContaPagto', 'DataPagto', 'Sequencia', 'Evento'],
        [qryDuplicatascontapagto.AsInteger, qryDuplicatasdatapagto.AsDateTime, qryDuplicatassequencia.AsInteger, qryDocumentosPagEvento.AsInteger]);
        qryDuplicatassequenciaevento.AsInteger := qryMovtosBancosProximaSequenciaEventonumero.AsInteger + 1;

      end
      else
      begin
        qryMovtosBancosProximaSequencia.close;
        qryMovtosBancosProximaSequenciaEvento.close;
      end;

//      if not assigned(frmcadastroduplicatascontaspagar) then
//        frmcadastroduplicatascontaspagar := Tfrmcadastroduplicatascontaspagar.Create(self)
//      else
//      if (frmcadastroduplicatascontaspagar.owner.owner.name <> 'dtmQuitacaoDuplicatas') and
//         (frmcadastroduplicatascontaspagar.owner.owner.name <> 'dtmLerRetornoPagFor') then
//      begin
//        frmcadastroduplicatascontaspagar.free;
//        frmcadastroduplicatascontaspagar := Tfrmcadastroduplicatascontaspagar.Create(self);
//      end;
//      frmcadastroduplicatascontaspagar.SetDataModulo(self);
//      frmcadastroduplicatascontaspagar.dataset := qryduplicatas;
//      frmcadastroduplicatascontaspagar.Operacao := topPAGAMENTO;

      Operacao := topPAGAMENTO;

      if ParSistema.GerarContabilidade then begin
         if AgruparPagamentosnoLote and (NrLoteContabil <> '')
         then qryDuplicatasNrLoteContabil.AsString:= NrLoteContabil +                               // ...LLLLLLL
                                                     FStr(qryDocumentosPagNumero.AsInteger, $61) +  //     DDDDDD
                                                     FStr(qryDuplicatasNumero.   AsInteger, $31)    //        NNN

         else begin
            if qryProximoNrLoteLanctoDuplicataNrLote.AsInteger = 0
            then RefazConsultaPorNome(qryProximoNrLoteLanctoDuplicata, ['Exercicio'], [yearof(qryDuplicatasdatapagto.AsDateTime)]);

            qryDuplicatasNrLoteContabil.AsString:= qryProximoNrLoteLanctoDuplicataNrLote.AsString + // ...LLLLLLL
                                                   FStr(qryDocumentosPagNumero.AsInteger, $61)    + //     DDDDDD
                                                   FStr(qryDuplicatasNumero.   AsInteger, $31);     //        NNN

         end;

         if qryDocumentosPagcreditar.AsInteger <> 0
         then if ContaCreditoContabil <> 0
              then qryDuplicatascontacredito.AsInteger:=  ContaCreditoContabil;

      end;

      qryDuplicatasAfterScroll(qryDuplicatas);
      result := ValidarPagamento(self.classType);
      if result then
        result := GravarDuplicatas(Operacao);

      {Aqui implementar a parte da geração de lançamentos...deve-se separar os dados da apresentação}  

      if result then
        result := GravarContasPagar(Operacao);

//      result := frmcadastroduplicatascontaspagar.InternoGravar;
      dsrDuplicatas.OnDataChange := dsrDuplicatasDataChange;

//      frmcadastroduplicatascontaspagar.Operacao := topINSERIR;
      Operacao := topINSERIR;
    end;
    FecharDocumentos;
  finally

    fViaLote_ := false;
  end;
end;

procedure TdtmContasPagar.ReabrirDocumentoPag;
begin
  ReFazConsulta(qryDocumentosPag,[0],[qryDocumentosPagNumero.asinteger]);
end;


function TdtmContasPagar.DesQuitarDuplicatas(DocumentoPag,
  NumeroDuplicata: integer; DataVencto: tDateTime;
  ListaDuplicatas: TtecDuplicatasSelecionadas): Boolean;
begin
  OrigemImpostosRetidos := PagamentoDuplicatas;
  DuplicatasSelecionadas := ListaDuplicatas;
  fViaLote_ := True;
  try

    result := AbrirDocumentos(DocumentoPag, NumeroDuplicata, DataVencto);
    if result then
    begin
      if PagamentosVinculados<>'' then
      begin
          MensagemErro(format(ctEXISTEPAGTOIMPOSTOSVINCULADOS,
             [qrydocumentospagnumero.asstring+', Vencto: '+
              qryduplicatasDataVencto.asstring+', N.: '+
              qryduplicatasNumero.asstring,
              fPagamentosVinculados]));
      end
      else
      begin

//        if not assigned(frmcadastroduplicatascontaspagar) then
//          frmcadastroduplicatascontaspagar := Tfrmcadastroduplicatascontaspagar.Create(self)
//        else
//        if frmcadastroduplicatascontaspagar.owner.owner.name <> 'dtmCancelamentoQuitacao' then
//        begin
//          frmcadastroduplicatascontaspagar.free;
//          frmcadastroduplicatascontaspagar := Tfrmcadastroduplicatascontaspagar.Create(self);
//        end;

//        frmcadastroduplicatascontaspagar.SetDataModulo(self);
//        frmcadastroduplicatascontaspagar.dataset := qryduplicatas;
//        frmcadastroduplicatascontaspagar.Operacao := topCANCELAR;

        Operacao := topCANCELAR;
        qryDuplicatasAfterScroll(qryDuplicatas);
//        CtrlOn := false;
//        result := frmcadastroduplicatascontaspagar.InternoExcluir;

        result := CancelarQuitacao


      end;
    end;
    FecharDocumentos;
    DuplicatasSelecionadas := nil;
  finally
    fViaLote_ := false;
  end;
end;

function TdtmContasPagar.AbrirDocumentos(DocumentoPag,
                                         NumeroDuplicata: Integer;
                                         DataVencto: TDateTime): Boolean;
const
  SQLDuplicatas = 'and d.datavencto = :DataVencto and d.numero = :numero';
  SQLDocumentosPagImpostosRetidos = 'and p.datavenctoorigem = :datavenctoorigem and p.numeroorigem = :numeroorigem';
begin
  result := true;
  qryDocumentosPag.AfterScroll := nil;
  qryDuplicatas.AfterScroll := nil;

  ReFazConsulta(qryDocumentosPag, [0], [DocumentoPag]);

  RefazConsultaPorNome(qryProcurarFornecedores,['tipo','codigo'],
      [qryDocumentosPagtipofornecedor.AsVariant,qryDocumentosPagfornecedor.AsVariant]);

  ReFazConsulta(qryExisteNota,[0],[qryDocumentosPagnumero.AsInteger]);

  if result then
  begin
    qryDuplicatas.MacroByName('SelecionarPorChave').AsString := SQLDuplicatas;
    RefazConsultapornome(qryDuplicatas,['documento','DataVencto','numero'],[DocumentoPag, DataVencto, NumeroDuplicata]);

    result := not qryduplicatas.IsEmpty;
    if result then
    begin
      qryDocumentosPagImpostosRetidos.MacroByName('SelecionarPorChave').asString := SQLDocumentosPagImpostosRetidos;

      ReFazConsultaPorNome(qryDocumentosPagImpostosRetidos,
                     ['documentopagorigem', 'datavenctoorigem', 'numeroorigem'],
                     [DocumentoPag, DataVencto, NumeroDuplicata]);

      if not qryDocumentosPagImpostosRetidos.IsEmpty then
      begin
        qryDuplicatasImpostosRetidos.Sql.Text := qryDuplicatasImpostosRetidos_Especifico.sql.Text;
        ReFazConsulta(qryDuplicatasImpostosRetidos,[0],[qryDocumentosPagImpostosRetidosnumero.AsInteger]);
      end;
    end;
  end;

  qryDuplicatas.AfterScroll := qryDuplicatasAfterScroll;
  qryDocumentosPag.AfterScroll := qryDocumentosPagAfterScroll;
end;

procedure TdtmContasPagar.FecharDocumentos;
begin
  qryDocumentosPagImpostosRetidos.Close;
  qryDuplicatasImpostosRetidos.Close;
  qryDuplicatasImpostosRetidos.Sql.Text := qryDuplicatasImpostosRetidos_Geral.sql.Text;
  qryduplicatas.close;
  ReFazConsulta(qrydocumentospag,[0],[0]);
  qryDocumentosPag.AfterScroll := qryDocumentosPagAfterScroll;
end;

function TdtmContasPagar.ExistenaListadeDuplicatasSelecionadas: boolean;
var
 i : integer;
begin
  result := false;
  if assigned(DuplicatasSelecionadas) then
  begin
    for i:= 0 to high(DuplicatasSelecionadas) do
    begin
      result := (qryDuplicatasImpostosRetidosdocumentopag.AsInteger =
                 DuplicatasSelecionadas[i].DocumentoPag) and
                (qryDuplicatasImpostosRetidosdatavencto.AsDateTime =
                 DuplicatasSelecionadas[i].DataVencto) and
                (qryDuplicatasImpostosRetidosnumero.AsInteger =
                 DuplicatasSelecionadas[i].Numero);
      if result then
        break;
    end;
  end;
end;

procedure TdtmContasPagar.qryVenctosImpostosRetidosEntradasAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  if ParSistema.GeracaoAutomaticadoImpostoRetido then
    if Assigned(FVenctosImpostosRetidosEntradasAfterOpen) then
      FVenctosImpostosRetidosEntradasAfterOpen(qryVenctosImpostosRetidosEntradas);
end;

procedure TdtmContasPagar.qryDocumentosPagImpostosRetidosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if qryDuplicatasImpostosRetidos.Active then
    qryDuplicatasImpostosRetidos.Locate('documentopag', qryDocumentosPagImpostosRetidosnumero.AsInteger, [])
end;

procedure TdtmContasPagar.qryDocumentosPagImpostosRetidosBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  qryDuplicatasImpostosRetidos.First;
  while not qryDuplicatasImpostosRetidos.Eof do
    if qryDuplicatasImpostosRetidosdocumentopag.AsInteger =
       qryDocumentosPagImpostosRetidosnumero.AsInteger then
      qryDuplicatasImpostosRetidos.Delete
    else
      qryDuplicatasImpostosRetidos.Next;
end;

procedure TdtmContasPagar.qryDuplicatasImpostosRetidosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryDocumentosPagImpostosRetidos.AfterScroll := nil;

  ExisteQuitacaoImpostosRetidosDuplicatas := false;
  ExisteQuitacaoImpostosRetidosNotas := false;
  qryDuplicatasImpostosRetidos.First;
  while not qryDuplicatasImpostosRetidos.Eof do
  begin
    if not qryDuplicatasImpostosRetidosdatapagto.IsNull then
    begin
      if qryDocumentosPagImpostosRetidos.Locate('numero', qryDuplicatasImpostosRetidosdocumentopag.AsInteger,[]) then
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

  qryDocumentosPagImpostosRetidos.AfterScroll :=
    qryDocumentosPagImpostosRetidosAfterScroll;
end;

procedure TdtmContasPagar.qryDocumentosPagAfterClose(DataSet: TDataSet);
begin
  inherited;
  if ParSistema.GeracaoAutomaticadoImpostoRetido then
    if Assigned(FVenctosImpostosRetidosEntradasAfterOpen) then
      FVenctosImpostosRetidosEntradasAfterOpen(qryVenctosImpostosRetidosEntradas);
end;

function TdtmContasPagar.GetProximoNrLancto: integer;
begin
  if FProximoNrLancto=0 then
  begin
    if OperacaoContasaPagar = topPAGAMENTO then
      spcLancamentosProximo.ParamByName('Exercicio').AsInteger:= yearof(qryDuplicatasdatapagto.AsDateTime)
    else
      spcLancamentosProximo.ParamByName('Exercicio').AsInteger:= yearof(qryDocumentosPagdatalancto.AsDateTime);
      
    spcLancamentosProximo.ParamByName('Filial').AsInteger:= qryDocumentosPagfilialcontabil.AsInteger;
    spcLancamentosProximo.Open;
    FProximoNrLancto := spcLancamentosProximocodigo.AsInteger;
    spcLancamentosProximo.Close;
  end
  else
   FProximoNrLancto := FProximoNrLancto + 1;
  Result := FProximoNrLancto;
end;

procedure TdtmContasPagar.SetProximoNrLancto(const Value: integer);
begin
  FProximoNrLancto := value;
end;

function TdtmContasPagar.GetValordaNota: Currency;
begin
  result := qryDocumentosPagvalor.AsCurrency;
end;

function TdtmContasPagar.GetCofinsRetido: Currency;
begin
  result := qryDocumentosPagcofinsretido.AsCurrency;
end;

function TdtmContasPagar.GetCSLLRetido: Currency;
begin
  result := qryDocumentosPagcsllretido.AsCurrency
end;

function TdtmContasPagar.GetINSSRetido: Currency;
begin
  result := qryDocumentosPaginssretido.AsCurrency
end;

function TdtmContasPagar.GetIRRetido: Currency;
begin
  result := qryDocumentosPagirretido.AsCurrency
end;

function TdtmContasPagar.GetISSRetido: Currency;
begin
  result := qryDocumentosPagissretido.AsCurrency
end;

function TdtmContasPagar.GetPISRetido: Currency;
begin
  result := qryDocumentosPagpisretido.AsCurrency
end;

function TdtmContasPagar.GetDataDocumento: TDateTime;
begin
  result := qryDocumentosPagdatalancto.AsDateTime;
end;

function TdtmContasPagar.GetDebitoFornecedor: Integer;
begin
  result := qryProcurarFornecedoresdebito.AsInteger;
end;

function TdtmContasPagar.GetCreditoFornecedor: Integer;
begin
  result := qryProcurarFornecedorescredito.AsInteger;
end;

function TdtmContasPagar.GetGerarDocumentoPag: Boolean;
begin
  result := true;
end;

function TdtmContasPagar.GetFilialDocumento: Integer;
begin
  result := qryDocumentosPagfilialcontabil.AsInteger;
end;

function TdtmContasPagar.GetCodigoDocumento: Int64;
begin
  result := qryDocumentosPagNumero.AsInteger;
end;

function TdtmContasPagar.GetContaCreditar: integer;
begin
  result := qryDocumentosPagcreditar.AsInteger;
end;

function TdtmContasPagar.GetHistoricoDebitar: integer;
begin
  Result := qryDocumentosPaghistorico.AsInteger
end;

procedure TdtmContasPagar.AtribuirContaCreditoDocumentoPag(Conta,
  Historico: Integer; excluir: Boolean);
begin
  if not (qryDocumentosPag.state in [dsedit,dsinsert]) then
    qryDocumentosPag.Edit;

  if excluir then
  begin
    qryDocumentosPagcreditar.Clear;
    qryDocumentosPaghistorico.Clear;
  end
  else
  begin
    qryDocumentosPagcreditar.AsInteger := Conta;
    if Historico<>0 then
      qryDocumentosPaghistorico.AsInteger := Historico
    else
      qryDocumentosPaghistorico.clear;
  end;

  if qryDocumentosPag.State = dsedit then
  begin
    if qryDocumentosPagcreditar.OldValue <> null then
    begin
      if qryDocumentosPagcreditar.OldValue <>
         qryDocumentosPagcreditar.AsInteger then
      begin
        FContrapartidaAlterada := true;
      end;
    end
    else
    if (conta = 0) and (historico = 0) and excluir then {neste caso é regime de caixa, sendo melhor refazer os pagamentos}
      FContrapartidaAlterada := true;
  end;
end;

procedure TdtmContasPagar.EditarDocumento;
begin
  if (qryDocumentosPag.RecordCount = 1) or
     (qryDocumentosPag.State = dsinsert) then
    if not (qryDocumentosPag.State in [dsinsert, dsedit]) then
      qryDocumentosPag.Edit;
end;

function TdtmContasPagar.GetIncluindoDocumentoPag: Boolean;
begin
  Result := (qryDocumentosPag.State = dsInsert) or qryDocumentosPag.IsEmpty
end;

function TdtmContasPagar.GetSomenteLeituraContabilidade: Boolean;
begin
  FSomenteLeituraContabilidade :=
                (qryDocumentosPagdatalancto.AsDateTime <= FDataContabil) or
                not UsuarioLogin.AlterarDadosContabeis or
                not ParSistema.GerarContabilidade or
                existenota or
                (qryDocumentosPagdocumentopagorigem.AsInteger<>0);

  if not FSomenteLeituraContabilidade then
    FSomenteLeituraContabilidade :=   (YearOf(qryDocumentosPagdatalancto.AsDateTime) <> parsistema.Exerciciocontabilidade) AND  { o atual ou ano corrente}
                                      (YearOf(qryDocumentosPagdatalancto.AsDateTime) <  yearof(now) - 1);
  result := FSomenteLeituraContabilidade;
end;

procedure TdtmContasPagar.qryDuplicatasAfterPost(DataSet: TDataSet);
begin
  inherited;
  GetExisteQuitacao;
  EdicaoCampos(not PermiteAlterarDocumento);
  EditarDocumento;
  AjustarSequencias;

  cdsTotalDuplicatas.close;
  cdsTotalDuplicatas.open;

end;

procedure TdtmContasPagar.qryDuplicatasAfterScroll(DataSet: TDataSet);
var
  i: integer;
begin
  inherited;

  qryDuplicatasDataVencto.ReadOnly := not PermiteAlterarVencimento;
  qryDuplicatasValorVencto.ReadOnly := not PermiteAlterarVencimento;
  qryDuplicatasvalordesconto.ReadOnly := not PermiteAlterarVencimento;
  qryDuplicatastipomulta.ReadOnly := not PermiteAlterarVencimento;
  qryDuplicatasmulta.ReadOnly := not PermiteAlterarVencimento;
  qryDuplicatastipojuros.ReadOnly := not PermiteAlterarVencimento;
  qryDuplicatasjuros.ReadOnly := not PermiteAlterarVencimento;
  qryDuplicatasBancoCobranca.ReadOnly := not PermiteAlterarVencimento;

  qryDuplicatasdatapagto.ReadOnly := not PermiteAlterarPagamento;
  qryDuplicatasvalorpagto.ReadOnly := not PermiteAlterarPagamento;
  qryDuplicatasfilialpagto.ReadOnly := not PermiteAlterarPagamento;

  qryDuplicatastipopagamento.ReadOnly := not PermiteAlterarPagamento;
  qryDuplicatascontapagto.ReadOnly := not PermiteAlterarPagamento;
  qryDuplicataschequepagto.ReadOnly := not PermiteAlterarPagamento;

  if not qryDuplicatas.controlsdisabled then
    RefazConsultaPorNome(qryLotesPagamento_Duplicatas,
                   ['nrlotecontabil','contapagto','datapagto','chequepagto','sequencia','documentopag','datavencto','numero'],
                   [Getnrlotecontabil,
                    qryDuplicatascontapagto.AsVariant,
                    qryDuplicatasdatapagto.asvariant,
                    qryDuplicataschequepagto.Asinteger,
                    qryDuplicatassequencia.AsVariant,
                    qryDuplicatasDocumentoPag.Asinteger,
                    qryDuplicatasDataVencto.asvariant,
                    qryDuplicatasNumero.asvariant]);

  if Assigned(AfterScrollDuplicatas) then
    AfterScrollDuplicatas(DataSet);


end;

procedure TdtmContasPagar.AjustarSequencias;
begin
  if not fViaLote_ then
  begin

    ExisteDuplicatasemAberto := false;
    ExisteQuitacao := False;
    qryDuplicatas.onCalcFields := nil;
    qryDuplicatas.AfterPost := nil;
    qryDuplicatas.BeforePost := nil;
    qryDuplicatas.AfterScroll := nil;

    qryDuplicatas.GuardarRegistroAtual(true);
    while not qryDuplicatas.Eof do
    begin
      if qryDuplicatasNumeroAux.AsInteger <> qryDuplicatas.RecNo then
      begin
        qryDuplicatas.Edit;
        qryDuplicatasNumeroAux.AsInteger := qryDuplicatas.RecNo;
        qryDuplicatas.Post;
      end;

      if qryDuplicatasdatapagto.IsNull then
        ExisteDuplicatasemAberto := true
      else
        ExisteQuitacao := True;

      if qryduplicatasnumero.asinteger > qryDocumentosPagultimonumerodaduplicata.asinteger then
         qryDocumentosPagultimonumerodaduplicata.asinteger := qryduplicatasnumero.asinteger;
         
      qryduplicatas.Next;
    end;

    qryduplicatas.SortByField('datavencto, numeroaux');
    qryDuplicatas.First;
    while not qryDuplicatas.Eof do
    begin
      if (qryDuplicatasNumeroAux.AsInteger <> qryDuplicatas.RecNo) or
         (qryDuplicatasOrdem.asstring <> (inttostr(qryDuplicatas.RecNo) + '.' +
                                          inttostr(qryduplicatas.RecordCount))) then
      begin
        qryDuplicatas.Edit;
        qryDuplicatasNumeroAux.AsInteger := qryDuplicatas.RecNo;
        qryDuplicatasOrdem.asstring := inttostr(qryDuplicatas.RecNo) + '.' +
                                       inttostr(qryduplicatas.RecordCount);
        qryDuplicatas.Post;
      end;
      qryduplicatas.Next;
    end;

    qryduplicatas.VoltarRegistro;

    qryDuplicatas.AfterPost := qryDuplicatasAfterPost;
    qryDuplicatas.BeforePost := qryDuplicatasBeforePost;
    qryDuplicatas.AfterScroll := qryDuplicatasAfterScroll;
    qryDuplicatas.onCalcFields := qryDuplicatasCalcFields;
  end;
end;

procedure TdtmContasPagar.qryDuplicatasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  AjustarSequencias;
  cdsTotalDuplicatas.close;
  cdsTotalDuplicatas.open;
end;

procedure TdtmContasPagar.qryDocumentosPagBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if not (UsuarioLogin.Administrador or UsuarioLogin.Suporte) then
    qryDocumentosPag.MacroByName('Administrador').AsString:= 'and not p.administrador';
end;

procedure TdtmContasPagar.qryDuplicatasNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryDuplicatasDocumentoPag.AsInteger := qryDocumentosPagNumero.AsInteger;
//  if fvialote_ then
    qryDuplicatasNumeroAux.AsInteger := qryDocumentosPagultimonumerodaduplicata.asinteger + 1;
//  else
//    qryDuplicatasNumeroAux.AsInteger := qryDuplicatas.RecordCount + 1;

  qryDuplicatasdda.asBoolean := qryProcurarFornecedoresdda.AsBoolean;

end;

procedure TdtmContasPagar.SetFornecedorParaISS(const Value: integer);
begin
  if not (qryDocumentosPag.State in [dsinsert, dsinsert]) then
    qryDocumentosPag.Edit;

  if value<>0 then
    qryDocumentosPagfornecedorparaiss.AsInteger := Value
  else
    qryDocumentosPagfornecedorparaiss.clear;

end;

function TdtmContasPagar.VerificarChequeCadastrado: Boolean;
var
  vDataVencto : TDateTime;
begin
  ehMultiploPagamentoCheque := false;
  result := true;
  if (qryConta_e_Cheque.parambyname('contapagto').asinteger   <> qryDuplicatascontapagto.Asinteger) or
     (qryConta_e_Cheque.parambyname('chequepagto').asinteger  <> qryDuplicataschequepagto.Asinteger) or
     (qryConta_e_Cheque.parambyname('documentopag').asinteger <> qryDuplicatasDocumentoPag.Asinteger) or
     (qryConta_e_Cheque.parambyname('datavencto').AsDateTime  <> qryDuplicatasDataVencto.AsDateTime) or
     (qryConta_e_Cheque.parambyname('numero').AsInteger       <> qryDuplicatasNumero.Asinteger) or
     ((not qryDuplicatasdatapagtoaux.IsNull) and
      (qryduplicatasdatapagtoaux.AsDateTime <> qryDuplicatasdatapagto.AsDateTime)) then
  begin
  {
    if qryDuplicatasDataVencto.isnull then
      vDataVencto := strtodate('
    else
    }

    RefazConsultaPorNome(qryConta_e_Cheque,
                   ['contapagto','chequepagto','documentopag',
                    'datavencto','numero'],
                   [qryDuplicatascontapagto.Asinteger,
                    qryDuplicataschequepagto.Asinteger,
                    qryDuplicatasDocumentoPag.Asinteger,
                    qryDuplicatasDataVencto.AsVariant,
                    qryDuplicatasNumero.Asinteger]);

    qryDuplicatasNrLoteContabil.AsString := '';

    if not qryConta_e_Cheque.IsEmpty then
    begin
      if qryConta_e_Chequedatapagto.AsDateTime =
         qryDuplicatasdatapagto.AsDateTime then
      begin
        result := fRefazerPagamento or (MensagemSelecionaOpcao(ctCHEQUEJAUTILIZADOSNESTEDIA) = smbYes);

        if result then
        begin
           // contabilidade
          qryDuplicatasNrLoteContabil.AsString := copy(qryConta_e_Chequenrlotecontabil.AsString,1,
                                                       length(qryConta_e_Chequenrlotecontabil.AsString)-9)     +
                                                   preencheString(qryDocumentosPagNumero.AsString,'0',6, false)+
                                                   preencheString(qryDuplicatasNumero.AsString,'0',3, false);
          // movtos bancos
          qryDuplicatassequencia.AsString := qryConta_e_Chequesequencia.AsString;


         ehMultiploPagamentoCheque := true;
         if Assigned(AfterScrollDuplicatas) then
           AfterScrollDuplicatas(qryDuplicatas);
        end
      end
      else
      begin
        result := false;
        MensagemErro(format(ctCHEQUEJAUTILIZADOS,[qryconta_e_chequeDataPagto.asstring]));
      end
    end;
  end;
end;

function TdtmContasPagar.GetPISCOFINSCSLLRetido: Currency;
begin
  result := qryDocumentosPagpiscofinscsllretido.AsCurrency
end;

function TdtmContasPagar.GetFornecedorParaISS: Integer;
begin
  result := qryDocumentosPagfornecedorparaiss.AsInteger;
end;

function TdtmContasPagar.GetDocumentoPossuiOrigem: Boolean;
begin
  result := qryDocumentosPagdocumentopagorigem.asinteger<>0;
end;

procedure TdtmContasPagar.qryDuplicatasBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qryDuplicatasdatavenctooriginal.IsNull then
    qryDuplicatasdatavenctooriginal.AsDateTime := qryDuplicatasDataVencto.AsDateTime;
  if qryDuplicatasNumero.IsNull then
    qryDuplicatasNumero.AsInteger := qryDuplicatasnumeroaux.AsInteger;

  qryDuplicatastipopagamentooldvalue.AsInteger := qryDuplicatastipopagamento.AsInteger;
  qryDuplicatasvalorpagtooldvalue.AsCurrency := qryDuplicatasvalorpagto.AsCurrency;

end;

function TdtmContasPagar.GetAdiantamentoFornecedor: Boolean;
begin
  FAdiantamentoFornecedor := qryDocumentosPagadiantamento.AsBoolean;
  Result := FAdiantamentoFornecedor;
end;

procedure TdtmContasPagar.SetAdiantamentoFornecedor(const Value: Boolean);
begin
  qryDocumentosPagadiantamento.AsBoolean := value;
end;

procedure TdtmContasPagar.qryAdiantamentoCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryAdiantamentosaldo.AsCurrency :=qryAdiantamentoentrada.AsCurrency -
                                    (qryAdiantamentosaida.AsCurrency +
                                     qryAdiantamentosaidadocumento.AsCurrency)
end;

procedure TdtmContasPagar.CalcularSaldoAdiantamento;
var
  ValorSaidaAdiantamento: Currency;


begin
  ValorSaidaAdiantamento := 0;

  qryDuplicatas.onCalcFields := nil;
  qryDuplicatas.AfterPost := nil;
  qryDuplicatas.BeforePost := nil;
  qryDuplicatas.AfterScroll := nil;

  qryDuplicatas.GuardarRegistroAtual(true);
  qryDuplicatas.First;
  while not qryDuplicatas.Eof do
  begin
    if qryDuplicatastipopagamento.AsInteger = 3 then  //adiantamento
      ValorSaidaAdiantamento := ValorSaidaAdiantamento +
                                qryDuplicatasvalorpagto.AsCurrency;
    qryduplicatas.Next;
  end;
  qryDuplicatas.VoltarRegistro;

  qryDuplicatas.AfterPost := qryDuplicatasAfterPost;
  qryDuplicatas.BeforePost := qryDuplicatasBeforePost;
  qryDuplicatas.AfterScroll := qryDuplicatasAfterScroll;
  qryDuplicatas.onCalcFields := qryDuplicatasCalcFields;

  if qryAdiantamentosaidadocumento.AsCurrency <> ValorSaidaAdiantamento then
  begin
    qryAdiantamento.Edit;
    qryAdiantamentosaidadocumento.AsCurrency := ValorSaidaAdiantamento;
    qryAdiantamento.Post;
  end;

end;

function TdtmContasPagar.GetExisteQuitacao: Boolean;
begin
  {
  FExisteQuitacao := false;

  if qryDuplicatas.Active then
  begin
    GuardarRegistroAtual(qryDuplicatas, true);
    qryDuplicatas.AfterScroll := nil;
    qryDuplicatas.First;
    while not qryDuplicatas.Eof do
    begin
      if not qryDuplicatasdatapagto.IsNull then
      begin
        FExisteQuitacao := true;
        break;
      end;
      qryduplicatas.Next;
    end;
    VoltarRegistroAtual(qryduplicatas);
    qryDuplicatas.AfterScroll := qryDuplicatasAfterScroll;
  end;
  }
  Result := FExisteQuitacao;

end;

function TdtmContasPagar.GetSaldoAdiantamento: Currency;
begin
  if (qryDuplicatastipopagamentooldvalue.AsInteger = 0) or
     (qryDuplicatastipopagamentooldvalue.AsInteger <> 3) then
     FSaldoAdiantamento := qryAdiantamentosaldo.AsCurrency
  else
     FSaldoAdiantamento := qryAdiantamentosaldo.AsCurrency +
                           qryDuplicatasvalorpagtooldvalue.AsCurrency;
  Result := FSaldoAdiantamento;
end;

function TdtmContasPagar.ValidarSaldoAdiantamento: Boolean;
begin
  result := true;
  if qryDocumentosPagadiantamento.AsBoolean then
  begin
    if qryProcurarFornecedoresadiantamento.AsInteger <> 0 then
    begin
      RefazConsultaPorNome(qryAdiantamento,
        ['fornecedor','tipofornecedor','numero'],
        [qryDocumentosPagfornecedor.AsVariant,
         qrydocumentospagtipofornecedor.asvariant,
         qryDocumentosPagNumero.AsVariant]);
      CalcularSaldoAdiantamento;
      result := qryAdiantamentosaldo.AsCurrency >= 0;
      if not result then
        MensagemAviso(format('O saldo do adiantamento para o fornecedor ficará negativo em R$ %f.'+#10#13+
                             'Reveja outras quitações também efetuadas com esse saldo.',[qryadiantamentosaldo.ascurrency]))
      else
      begin
        if ParSistema.GerarContabilidade then
        begin
          RefazConsultaPorNome(qryAdiantamentoContabilidade,
            ['contaadiantamento','numero','DataPagto'],
            [qryProcurarFornecedoresadiantamento.asinteger,
             qryDocumentosPagNumero.asinteger,FormatDateTime('YYYY-MM-DD',qryDuplicatasdatapagto.AsDateTime)]);
          result := (qryAdiantamentoContabilidadesaldo.AsCurrency -
                     qryAdiantamentosaidadocumento.AsCurrency)>=0;
          if not result then
            MensagemAviso(format('O saldo da conta de adiantamento ficará negativa em R$ %f.'+#10#13+
                                 'Reveja outras quitações também efetuadas nessa conta.',[qryadiantamentosaldo.ascurrency]));
        end;
      end;
    end;
  end;
end;

function TdtmContasPagar.IncluirAdiantamento: Boolean;
begin
  ReFazConsulta(qryExisteNota,[0],[0]);
  EdicaoCampos(False);
  qryDocumentosPag.Insert;
  qryDocumentosPagadiantamento.AsBoolean := true;
  Result:= True;
end;

function TdtmContasPagar.GetHistoricoPadrao: Integer;
begin
  if not (qryProcurarFornecedoreshistoricocontabil.IsNull) then
    result := qryProcurarFornecedoreshistoricocontabil.AsInteger
  else
    Result := 0;
end;

procedure TdtmContasPagar.ImprimirAutorizacoes;
var
  Usuario: TtecUsuarios;

  vDocumentoPag : integer;
  vDataVencto : TDateTime;
  vNumero : integer;
  vReadOnlyDuplicatas : Boolean;


begin
  Usuario:= TtecUsuarios.Create(dtmTecSoft.Database);
  if UsuarioLogin.Pagamento then
       Usuario:= ObterAutorizacao(taSENHA)
  else Usuario:= ObterAutorizacao(taLOGIN, ctAUTORIZACAOPAGAMENTO, ctAUTORIZADO);

  try

    vDocumentoPag := qryDuplicatasDocumentoPag.AsInteger;
    vDataVencto   := qryDuplicatasDataVencto.AsDateTime;
    vNumero       := qryDuplicatasNumero.AsInteger;

    qryDuplicatas.MacroByName('SelecionarPorChave').AsString := '';
    RefazConsultapornome(qryDuplicatas,['documento','DataVencto','numero'],[qryDocumentosPagnumero.AsInteger, 0, 0]);

    vReadOnlyDuplicatas := qryDuplicatas.ReadOnly;
    qryDuplicatas.ReadOnly := false;


    if qryduplicatas.Locate('documentopag;datavencto;numero',VarArrayof([vDocumentoPag,vDataVencto,vNumero]),[]) then
    begin
      qryDuplicatas.AfterPost := nil;
      qryDuplicatas.AfterScroll := nil;
      qryDuplicatas.BeforePost := nil;

      if Assigned(Usuario) and Usuario.Pagamento then
      begin
        dtmImprimeAutorizacaoPagto := TdtmImprimeAutorizacaoPagto.create(self);
        if qryDuplicatas.RecordCount = 1 then
          dtmImprimeAutorizacaoPagto.ImprimirAutorizacao(ListadeDuplicatas('A',true))
        else
        begin
          case MensagemSimNaoOpcaoCancelar('Deseja imprimir todas as autorizações de pagamento possíveis?' ,'',true,
                                           '&Todas',
                                           '&Registro Atual') of
            mrYes: dtmImprimeAutorizacaoPagto.ImprimirAutorizacao(ListadeDuplicatas('A',false));
            mrNo : dtmImprimeAutorizacaoPagto.ImprimirAutorizacao(ListadeDuplicatas('A',true));
          end;
        end;
      end;
    end
    else
      MensagemErro(format(ctNENHUMREGISTROENCONTRADO,['registro']));


  finally
    qryDuplicatas.ReadOnly := vReadOnlyDuplicatas;

    qryDuplicatas.AfterPost   := qryDuplicatasAfterPost;
    qryDuplicatas.AfterScroll := qryDuplicatasAfterScroll;
    qryDuplicatas.BeforePost  := qryDuplicatasBeforePost;

  end;
end;

function TdtmContasPagar.GetEvento: Integer;
begin
  result := qryDocumentosPagEvento.AsInteger;
end;

function TdtmContasPagar.GravarDuplicatasPagamentos: Boolean;
begin
{##
  if qryDuplicatas.State in [dsedit, dsinsert] then
    qryDuplicatas.post;
}    
end;

function TdtmContasPagar.Getnrlotecontabil: int64;
begin
  if qryDuplicatasNrLoteContabil.AsString <> '' then
    result := strtoint64(copy(qryDuplicatasNrLoteContabil.AsString,1,length(qryDuplicatasNrLoteContabil.AsString)-9)+'000000000')
  else
    result := 0;
end;

function TdtmContasPagar.GetValorVencto: Currency;
begin
  result := qryDuplicatasValorVencto.AsCurrency;
end;

function TdtmContasPagar.GetContaCreditoPagamento: Integer;
begin
  result := qryDuplicatascontacredito.AsInteger;
end;

function TdtmContasPagar.GetValorDespesasFinanceiras: Currency;
begin
  result := 0;
  if qryDuplicatasvalorpagto.AsCurrency > qryDuplicatasValorVencto.AsCurrency then
    result := qryDuplicatasvalorpagto.AsCurrency - qryDuplicatasValorVencto.AsCurrency;
end;

function TdtmContasPagar.GetValorDescontos: Currency;
begin
  result := 0;
  if (qryDuplicatasvalorpagto.AsCurrency < qryDuplicatasValorVencto.AsCurrency) and
     (qryDuplicatasvalorpagto.AsCurrency <> 0) then
    result := qryDuplicatasValorVencto.AsCurrency - qryDuplicatasvalorpagto.AsCurrency
  else
  if qryDuplicatasvalorpagto.AsCurrency = 0 then
    result := qryDuplicatasValorVencto.AsCurrency;
end;

function TdtmContasPagar.GetValorPagto: Currency;
begin
  result := qryDuplicatasvalorpagto.AsCurrency;
end;

procedure TdtmContasPagar.qryDocumentosPagAfterEdit(DataSet: TDataSet);
begin
  inherited;
;
end;

function TdtmContasPagar.GetOrigemFormulario: String;
begin
  if qryDocumentosPagadiantamento.AsBoolean then
    result := 'A'
  else result := 'D';
end;

function TdtmContasPagar.GetContaDebitar: integer;
begin
  result := qryDocumentosPagdebitar.AsInteger;
end;

function TdtmContasPagar.GetDataPagamento: TDateTime;
begin
  result := qryDuplicatasdatapagto.AsDateTime;
end;

function TdtmContasPagar.PermiteCancelarDuplicata: Boolean;
begin
  Result := (qryDocumentosPag.State in [dsInsert]);
  if not result then
  begin
{    if ParSistema.GerarContabilidade then}
      Result:=   (qryDuplicatasdatapagto.AsDateTime <> 0)
{            and (qryDuplicatasdataVencto.AsDateTime > FDataContabil)}
             and (UsuarioLogin.AlterarDadosContabeis or UsuarioLogin.Pagamento)
             and not ExisteQuitacaoImpostosRetidosDuplicatas;
{    else
      Result:=   (qryDuplicatasdatapagto.AsDateTime = 0)
             and (UsuarioLogin.AlterarDadosContabeis or UsuarioLogin.Pagamento)
             and not ExisteQuitacaoImpostosRetidosDuplicatas;}
  end;

end;

function TdtmContasPagar.GetnrlotecontabilDuplicata: int64;
begin

  if qryDuplicatasNrLoteContabil.AsString <> '' then
    result := strtoint64(qryDuplicatasNrLoteContabil.AsString)
  else
    result := 0;

end;

function TdtmContasPagar.GetehMultiploPagamento: Boolean;
begin
  Result := fehMultiploPagamento or fehMultiploPagamentoCheque;
end;

procedure TdtmContasPagar.qryLotesPagamento_DuplicatasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ehMultiploPagamento := qryLotesPagamento_Duplicatas.RecordCount <> 0;
end;

function TdtmContasPagar.getdescricaohistoricopagamento: String;
begin
   if ExisteNota
   then fDescricaoHistoricoPagamento:= 'NF'
   else fDescricaoHistoricoPagamento:= 'DOC';

   if trim(qryDocumentosPagcomplemento.asstring) <> '' then
      fdescricaohistoricopagamento := fdescricaohistoricopagamento + ' ' +
                                     trim(Trocar( trim(Trocar(qryDocumentosPagcomplemento.asstring,' /', '/')),' /', '/'));

  if not qryProcurarFornecedores.Active or fvialote_ then
    RefazConsultaPorNome(qryProcurarFornecedores,['tipo','codigo'],
      [qryDocumentosPagtipofornecedor.AsVariant,qryDocumentosPagfornecedor.AsVariant]);

  fdescricaohistoricopagamento := fdescricaohistoricopagamento +
                                ' DUP ' + qryDuplicatasDocumentoPag.asstring + '/' + qryDuplicatasNumero.asstring +
                                ' - ' + trim(qryProcurarFornecedoresnome.AsString);


  Result := fdescricaohistoricopagamento;

end;

procedure TdtmContasPagar.qryLotesPagamento_DocumentosPagCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryLotesPagamento_DocumentosPagValorLiquido.AsCurrency:= qryLotesPagamento_DocumentosPagvalor.       AsCurrency -
                                            qryLotesPagamento_DocumentosPagIRRetido.    AsCurrency -
                                            qryLotesPagamento_DocumentosPagINSSRetido.  AsCurrency -
                                            qryLotesPagamento_DocumentosPagISSRetido.   AsCurrency -
                                            qryLotesPagamento_DocumentosPagPISRetido.   AsCurrency -
                                            qryLotesPagamento_DocumentosPagCOFINSRetido.AsCurrency -
                                            qryLotesPagamento_DocumentosPagCSLLRetido.  AsCurrency -
                                            qryLotesPagamento_DocumentosPagPISCOFINSCSLLRetido.  AsCurrency;

end;

procedure TdtmContasPagar.GravarObservacaoDuplicatas;
begin
  if qryDuplicatas.State in [dsEdit, dsInsert] then
    qryDuplicatas.Post;
end;

function TdtmContasPagar.GetRefazerPagamento: Boolean;
begin
  fRefazerPagamento := (((qryDocumentosPagEventoAnterior.AsInteger <> 0) and
                         (qryDocumentosPagEvento.AsInteger <> qryDocumentosPagEventoAnterior.asinteger)) or
                         FContrapartidaAlterada)
                   and ExisteQuitacao;

  Result := fRefazerPagamento;
end;

function TdtmContasPagar.GetHistoricoPadraoPagamento: Integer;
begin
  if not (qryProcurarFornecedoreshistoricocontabilpagtoduplicata.IsNull) then
    result := qryProcurarFornecedoreshistoricocontabilpagtoduplicata.asinteger
  else
    if parsistema.historicopadraopagtoduplicata <> '' then
      Result := strtoint(parsistema.historicopadraopagtoduplicata)
    else
      if not (qryProcurarFornecedoreshistoricocontabil.IsNull) then
        result := qryProcurarFornecedoreshistoricocontabil.asinteger
      else
        result := 0;
end;

function TdtmContasPagar.ValidarValoresDocumentosPag(ContaPagto: integer;
  DataPagto: TDateTime; Sequencia: integer; ehCancelamento: boolean = false): boolean;
begin
  if ContaPagto = 0 then {indica que é uma quitação com adiantamento e não ha movtosbancos pois já esta no documento de adiantamento}
    result := true
  else
  begin
    try
      RefazConsultaporNome(qryValidarValoresDocumentosPag, ['Conta', 'Data', 'Sequencia', 'ehCancelamento'], [ContaPagto, DataPagto, Sequencia, ehCancelamento]);
    finally
      result := qryValidarValoresDocumentosPagok.asboolean;
      if not result then
      begin
        dtmTecSoft.tstTecSoft.Rollback;
        ReabrirDocumentoPag;
      end;
    end;
  end;
end;

function TdtmContasPagar.ValidarValoresDocumentosPag(
  DocumentoPag: integer): boolean;
begin
  try
    RefazConsultaporNome(qryValidarValoresDocumentosPag_N, ['DocumentoPag'], [DocumentoPag]);
  finally
    result := qryValidarValoresDocumentosPag_Nok.asboolean;
    if not result then
    begin
      dtmTecSoft.tstTecSoft.Rollback;
      ReabrirDocumentoPag;
    end;
  end;
end;

procedure TdtmContasPagar.qryDocumentosPagBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryDocumentosPagEventoAnterior.asinteger := qryDocumentosPagEvento.asinteger;
end;


procedure TdtmContasPagar.qryReinf_2010BeforePost(DataSet: TDataSet);
begin
  inherited;
  qryReinf_2010datahoraalteracaodadosreinf.AsDateTime := DataHoraServidor;

  if qryReinf_2010indobra.AsInteger = 1 then
  begin
    qryReinf_2010tpinscestabindobra_1.AsInteger := 1;
    qryReinf_2010tpinscestabindobra_2.clear;
  end
  else
  if qryReinf_2010indobra.AsInteger = 2 then
  begin
    qryReinf_2010tpinscestabindobra_1.clear;
    qryReinf_2010tpinscestabindobra_2.AsInteger := 2
  end
  else
  begin
    qryReinf_2010tpinscestabindobra_1.clear;
    qryReinf_2010tpinscestabindobra_2.clear;
  end;
end;

procedure TdtmContasPagar.dsrReinf_2010DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if field = qryReinf_2010indobra then
  begin
    dsrReinf_2010.OnDataChange := nil;

    case qryReinf_2010indobra.asinteger of
    0: begin
         if qryReinf_2010nrinscestab_0.asstring <> qryProcurarFiliaiscnpj.AsString then
           qryReinf_2010nrinscestab_0.asstring := qryProcurarFiliaiscnpj.AsString;

         qryReinf_2010nrinscestab_0.required := true;
         qryReinf_2010nrinscestab_1.required := false;
         qryReinf_2010nrinscestab_2.required := false;
       end;

    1: begin
         qryReinf_2010nrinscestab_0.required := false;
         qryReinf_2010nrinscestab_1.required := true;
         qryReinf_2010nrinscestab_2.required := false;
       end ;

    2: begin
         qryReinf_2010nrinscestab_0.required := false;
         qryReinf_2010nrinscestab_1.required := false;
         qryReinf_2010nrinscestab_2.required := true;
       end;
    end;

    dsrReinf_2010.OnDataChange := dsrReinf_2010DataChange;
  end
  else
  if (field = qryReinf_2010nrinscestab_0) then
    qryReinf_2010nrinscestab.value := qryReinf_2010nrinscestab_0.value
  else
  if (field = qryReinf_2010nrinscestab_1) then
    qryReinf_2010nrinscestab.value := qryReinf_2010nrinscestab_1.value
  else
  if (field = qryReinf_2010nrinscestab_2) then
    qryReinf_2010nrinscestab.value := qryReinf_2010nrinscestab_2.value;

end;

procedure TdtmContasPagar.qryReinf_2010AfterEdit(DataSet: TDataSet);
begin
  inherited;
  qryDocumentosPag.edit;
  
end;

procedure TdtmContasPagar.qryReinf_2010AfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryDocumentosPag.edit;
end;

procedure TdtmContasPagar.qryReinf_2010_infoTpServAfterEdit(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2010.edit;
end;

procedure TdtmContasPagar.qryReinf_2010_infoTpServAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2010.edit;

end;

procedure TdtmContasPagar.qryReinf_2010NewRecord(DataSet: TDataSet);
begin
  inherited;
  qryReinf_2010cnpjprestador.asString := qryProcurarFornecedorespessoanumero.asString;
  qryReinf_2010indcprb.value := qryProcurarFornecedoresindcprb.value;
  qryReinf_2010tipofilial.asString := 'L';
end;

procedure TdtmContasPagar.qryReinf_2010nrinscestab_0GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if qryReinf_2010indobra.asinteger = 0 then
    Text := FormatarCPFouCGC(qryReinf_2010nrinscestab_0.AsString)

end;

procedure TdtmContasPagar.qryDocumentosPagBeforeEdit(DataSet: TDataSet);
begin
  inherited;
;
end;

procedure TdtmContasPagar.qryReinf_2010CalcFields(DataSet: TDataSet);
begin
  inherited;
  if not qryReinf_2010datahoraexclusaodadosreinf.IsNull then
    qryReinf_2010sdatahoraexclusaodadosreinf.asString := 'CANCELADO EM '+ formatDateTime('dd/MM/yyyy hh:mm:ss', qryReinf_2010datahoraexclusaodadosreinf.asDateTime)
  else
    qryReinf_2010sdatahoraexclusaodadosreinf.clear;

  if not qryReinf_2010datahoraalteracaodadosreinf.IsNull then
    qryReinf_2010sdatahoraalteracaodadosreinf.asString := 'ALTERADO EM '+ formatDateTime('dd/MM/yyyy hh:mm:ss', qryReinf_2010datahoraalteracaodadosreinf.asDateTime)
  else
    qryReinf_2010sdatahoraalteracaodadosreinf.clear;

end;

procedure TdtmContasPagar.ExcluirReinf2010;
begin
  if MensagemConfirmacao('A exclusão deste registro?') = smbOK then
  begin
    if qryEnvioReinf_2010.IsEmpty then
    begin
      LimparTabela(qryReinf_2010_infoTpServ);
      LimparTabela(qryReinf_2010);
      perpetrar([qryReinf_2010_infoTpServ, qryReinf_2010]);
    end
    else
    begin
      qryReinf_2010.edit;
      qryReinf_2010datahoraexclusaodadosreinf.AsDateTime := DataHoraServidor;
      qryReinf_2010.post;
      perpetrar([qryReinf_2010]);
    end;
  end;

end;

procedure TdtmContasPagar.qryReinf_2010AfterOpen(DataSet: TDataSet);
begin
  inherited;
  qryReinf_2010.ReadOnly := not qryReinf_2010datahoraexclusaodadosreinf.IsNull;
end;

procedure TdtmContasPagar.qryReinf_2010_infoTpServAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2010_infoTpServ.ReadOnly := not qryReinf_2010datahoraexclusaodadosreinf.IsNull;
end;

procedure TdtmContasPagar.qryReinf_2010_infoTpServNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2010_infoTpServtpservico.asinteger := 3;
end;

procedure TdtmContasPagar.qryReinf_2010AfterDelete(DataSet: TDataSet);
begin
  inherited;
  qryDocumentosPag.edit;
end;

procedure TdtmContasPagar.qryReinf_2040_recursosRepCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if not qryReinf_2040_recursosRepdatahoraexclusaodadosreinf.IsNull then
    qryReinf_2040_recursosRepsdatahoraexclusaodadosreinf.asString := 'CANCELADO EM '+ formatDateTime('dd/MM/yyyy hh:mm:ss', qryReinf_2040_recursosRepdatahoraexclusaodadosreinf.asDateTime)
  else
    qryReinf_2040_recursosRepsdatahoraexclusaodadosreinf.clear;

  if not qryReinf_2040_recursosRepdatahoraalteracaodadosreinf.IsNull then
    qryReinf_2040_recursosRepsdatahoraalteracaodadosreinf.asString := 'ALTERADO EM '+ formatDateTime('dd/MM/yyyy hh:mm:ss', qryReinf_2040_recursosRepdatahoraalteracaodadosreinf.asDateTime)
  else
    qryReinf_2040_recursosRepsdatahoraalteracaodadosreinf.clear;

end;

procedure TdtmContasPagar.qryReinf_2040_recursosRepNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2040_recursosRepcnpjassocdesp.asString := qryProcurarFornecedorespessoanumero.asString;
  qryReinf_2040_recursosReptpinscestab.Value := 1;
  qryReinf_2040_recursosRepnrinscestab.value :=  qryProcurarFiliaiscnpj.AsString;
  qryReinf_2040_recursosReptipofilial.asString := 'L';
end;

procedure TdtmContasPagar.qryReinf_2040_infoRecursoNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2040_infoRecursotprepasse.Value := 1;
end;

procedure TdtmContasPagar.qryReinf_2040_infoRecursoAfterEdit(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2040_recursosRep.edit;
end;

procedure TdtmContasPagar.qryReinf_2040_infoRecursoAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2040_recursosRep.edit;
  if qryReinf_2040_recursosRep.isempty then
    qryReinf_2040_recursosRep.append; 
end;

procedure TdtmContasPagar.qryReinf_2040_infoRecursoAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2040_infoRecurso.ReadOnly := not qryReinf_2040_recursosRepdatahoraexclusaodadosreinf.IsNull;
end;

procedure TdtmContasPagar.qryReinf_2040_recursosRepBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2040_recursosRepdatahoraalteracaodadosreinf.AsDateTime := DataHoraServidor;
end;

procedure TdtmContasPagar.ExcluirReinf2040;
begin
  if MensagemConfirmacao('A exclusão deste registro?') = smbOK then
  begin
    if qryEnvioReinf_2040_recursosRep.IsEmpty then
    begin
      LimparTabela(qryReinf_2040_infoRecurso);
      LimparTabela(qryReinf_2040_recursosRep);
      perpetrar([qryReinf_2040_infoRecurso, qryReinf_2040_recursosRep]);
    end
    else
    begin
      qryReinf_2040_recursosRep.edit;
      qryReinf_2040_recursosRepdatahoraexclusaodadosreinf.AsDateTime := DataHoraServidor;
      qryReinf_2040_recursosRep.post;
      perpetrar([qryReinf_2040_recursosRep]);
    end;
  end;

end;

procedure TdtmContasPagar.qryReinf_2010_infoProcRetPrAfterEdit(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2010.edit;
end;

procedure TdtmContasPagar.qryReinf_2010_infoProcRetAdAfterEdit(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2010.edit;
end;

procedure TdtmContasPagar.qryReinf_2010_infoProcRetAdAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2010.edit;
end;

procedure TdtmContasPagar.qryReinf_2010_infoProcRetPrAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2010.edit;
end;

procedure TdtmContasPagar.qryReinf_2010_infoProcRetAdAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2010_infoProcRetAd.ReadOnly := not qryReinf_2010datahoraexclusaodadosreinf.IsNull;
end;

procedure TdtmContasPagar.qryReinf_2010_infoProcRetPrAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2010_infoProcRetPr.ReadOnly := not qryReinf_2010datahoraexclusaodadosreinf.IsNull;
end;

procedure TdtmContasPagar.Gerarfornecedor_infoProcRetAd;
begin
{
  LimparTabela(qryReinf_2010_infoProcRetAd);

  RefazConsultaPorNome(qryfornecedor_infoProcRetAd, ['fornecedor','tipofornecedor'],
                    [qryDocumentosPagfornecedor.AsInteger,
                     qryDocumentosPagtipofornecedor.AsString]);

  qryfornecedor_infoProcRetAd.first;
  while not qryfornecedor_infoProcRetAd.eof do
  begin
    qryReinf_2010_infoProcRetAd.Append;

    qryReinf_2010_infoProcRetAdprocessojudicial.Value := qryfornecedor_infoProcRetAdprocessojudicial.value;
    qryReinf_2010_infoProcRetAdnumerosuspensaoexibilidadetributos.value := qryfornecedor_infoProcRetAdnumerosuspensaoexibilidadetributos.value;
    qryReinf_2010_infoProcRetAdtpprocretadic.value := qryfornecedor_infoProcRetAdtpprocretprinc.value;
    qryReinf_2010_infoProcRetAdnrprocretadic.value := qryfornecedor_infoProcRetAdnrprocretprinc.value;
    qryReinf_2010_infoProcRetAdcodsuspadic.value := qryfornecedor_infoProcRetAdcodsuspprinc.value;

    qryReinf_2010_infoProcRetAd.Post;

    qryfornecedor_infoProcRetAd.next;

  end;
  }
end;

procedure TdtmContasPagar.Gerarfornecedor_infoProcRetPr;
begin
{
  LimparTabela(qryReinf_2010_infoProcRetPr);

  RefazConsultaPorNome(qryfornecedor_infoProcRetPr, ['fornecedor','tipofornecedor'],
                    [qryDocumentosPagfornecedor.AsInteger,
                     qryDocumentosPagtipofornecedor.AsString]);

  qryfornecedor_infoProcRetPr.first;
  while not qryfornecedor_infoProcRetPr.eof do
  begin
    qryReinf_2010_infoProcRetPr.Append;

    qryReinf_2010_infoProcRetPrprocessojudicial.Value := qryfornecedor_infoProcRetPrprocessojudicial.value;
    qryReinf_2010_infoProcRetPrnumerosuspensaoexibilidadetributos.value := qryfornecedor_infoProcRetPrnumerosuspensaoexibilidadetributos.value;
    qryReinf_2010_infoProcRetPrtpprocretprinc.value := qryfornecedor_infoProcRetPrtpprocretprinc.value;
    qryReinf_2010_infoProcRetPrnrprocretprinc.value := qryfornecedor_infoProcRetPrnrprocretprinc.value;
    qryReinf_2010_infoProcRetPrcodsuspprinc.value := qryfornecedor_infoProcRetPrcodsuspprinc.value;

    qryReinf_2010_infoProcRetPr.Post;

    qryfornecedor_infoProcRetPr.next;

  end;
   }
end;

procedure TdtmContasPagar.qryReinf_2040_infoProcAfterEdit(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2040_recursosRep.edit;
end;

procedure TdtmContasPagar.qryReinf_2040_infoProcAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2040_recursosRep.edit;
end;

procedure TdtmContasPagar.qryReinf_2040_infoProcAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2040_infoProc.ReadOnly := not qryReinf_2010datahoraexclusaodadosreinf.IsNull;
end;

procedure TdtmContasPagar.Gerarfornecedor_infoProc;
begin
{
  LimparTabela(qryReinf_2040_infoProc);

  RefazConsultaPorNome(qryfornecedor_infoProcRetPr, ['fornecedor','tipofornecedor'],
                    [qryDocumentosPagfornecedor.AsInteger,
                     qryDocumentosPagtipofornecedor.AsString]);

  qryfornecedor_infoProcRetPr.first;
  while not qryfornecedor_infoProcRetPr.eof do
  begin
    qryReinf_2040_infoProc.Append;

    qryReinf_2040_infoProcprocessojudicial.Value := qryfornecedor_infoProcRetPrprocessojudicial.value;
    qryReinf_2040_infoProcnumerosuspensaoexibilidadetributos.value := qryfornecedor_infoProcRetPrnumerosuspensaoexibilidadetributos.value;
    qryReinf_2040_infoProctpproc.value := qryfornecedor_infoProcRetPrtpprocretprinc.value;
    qryReinf_2040_infoProcnrproc.value := qryfornecedor_infoProcRetPrnrprocretprinc.value;
    qryReinf_2040_infoProccodsusp.value := qryfornecedor_infoProcRetPrcodsuspprinc.value;

    qryReinf_2040_infoProc.Post;

    qryfornecedor_infoProcRetPr.next;

  end;
}
end;

procedure TdtmContasPagar.qryReinf_2010_infoProcRetPrAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2010.edit;
end;

procedure TdtmContasPagar.qryReinf_2010_infoProcRetAdAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2010.edit;

end;

procedure TdtmContasPagar.qryReinf_2010_infoTpServAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2010.edit;

end;

procedure TdtmContasPagar.qryReinf_2040_infoProcAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2040_recursosRep.edit;

end;

procedure TdtmContasPagar.qryReinf_2040_infoRecursoAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2040_recursosRep.edit;
end;

procedure TdtmContasPagar.qryReinf_2040_infoRecursoAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  qryReinf_2040_recursosRep.edit;
end;

function TdtmContasPagar.VerificarSituacao_Prestador_X_Reinf_2010_noMes: boolean;
begin
      {
  result := true;

  if qryReinf_2010.recordcount <> 0 then
  begin
    RefazConsultaPorNome(qryVerificarSituacao_Prestador_X_Reinf_2010_noMes,
                          ['fornecedor','tipofornecedor', 'AnoMes','documentopag',
                           'tpinscestab', 'nrInscEstab', 'indobra', 'cnpjPrestador',
                           'indCPRB',
                           'fornecedor_r','tipofornecedor_r', 'tpinscestabindobra_1',
                           'filial_r', 'tipofilial_r', 'tpinscestabindobra_2'],

                          [qryDocumentosPagfornecedor.Value,
                           qryDocumentosPagtipofornecedor.Value,

                           FormatDateTime('yyyy-MM', qryDocumentosPagdatalancto.AsDateTime),
                           qryReinf_2010documentopag.Value,

                           qryReinf_2010tpinscestab.value,
                           qryReinf_2010nrinscestab.value,

                           qryReinf_2010indobra.value,
                           qryReinf_2010cnpjprestador.value,
                           qryReinf_2010indcprb.value,

                           qryReinf_2010fornecedor.asVariant,
                           qryReinf_2010tipofornecedor.asVariant,
                           qryReinf_2010tpinscestabindobra_1.asVariant,

                           qryReinf_2010filial.asVariant,
                           qryReinf_2010tipofilial.asVariant,
                           qryReinf_2010tpinscestabindobra_2.AsVariant

                           ]);

    if qryVerificarSituacao_Prestador_X_Reinf_2010_noMes.RecordCount <> 0 then
    begin
      result := MensagemConfirmacao('Existem outros documentos dentro do período cadastrados com outroa inscrição no CNO.'+chr(13)+
                                     'Estes serão atualizados. Confirma?') = smbOK;
      if result then
      begin

        AtribuirDados(qryVerificarSituacao_Prestador_X_Reinf_2010_noMes,

                      [qryVerificarSituacao_Prestador_X_Reinf_2010_noMestpinscestabindobra_1,
                       qryVerificarSituacao_Prestador_X_Reinf_2010_noMestpinscestabindobra_2,
                       qryVerificarSituacao_Prestador_X_Reinf_2010_noMestpinscestab,
                       qryVerificarSituacao_Prestador_X_Reinf_2010_noMesnrinscestab,
                       qryVerificarSituacao_Prestador_X_Reinf_2010_noMesindobra,
                       qryVerificarSituacao_Prestador_X_Reinf_2010_noMescnpjprestador,
                       qryVerificarSituacao_Prestador_X_Reinf_2010_noMesindcprb,
                       qryVerificarSituacao_Prestador_X_Reinf_2010_noMesdatahoraalteracaodadosreinf,
                       qryVerificarSituacao_Prestador_X_Reinf_2010_noMesfornecedor,
                       qryVerificarSituacao_Prestador_X_Reinf_2010_noMestipofornecedor,
                       qryVerificarSituacao_Prestador_X_Reinf_2010_noMesfilial,
                       qryVerificarSituacao_Prestador_X_Reinf_2010_noMestipofilial],

                      [qryReinf_2010tpinscestabindobra_1.asvariant,
                       qryReinf_2010tpinscestabindobra_2.asvariant,
                       qryReinf_2010tpinscestab.value,
                       qryReinf_2010nrinscestab.value,
                       qryReinf_2010indobra.value,
                       qryReinf_2010cnpjprestador.value,
                       qryReinf_2010indcprb.value,
                       qryReinf_2010datahoraalteracaodadosreinf.value,
                       qryReinf_2010fornecedor.AsVariant,
                       qryReinf_2010tipofornecedor.AsVariant,
                       qryReinf_2010filial.AsVariant,
                       qryReinf_2010tipofilial.AsVariant]);

      end;
    end;
  end;
      }
end;

function TdtmContasPagar.ExibirFicha(FormOrigem: String): boolean;
begin
 result := ExibirFichacliente(qryProcurarFornecedorescodigo.AsInteger,
                              qryProcurarFornecedorestipo.AsString,
                              qryProcurarFornecedoresnome.AsString,
                              FormOrigem)

end;


function IncluirDocumentosPag(
                               AOwner: TComponent;
                               OrigemDocumentopag: TOrigemDocumentopag;
                               NumeroDocumentoPag: integer;
                               ds: array of TZDataSet;
                               ForcarExclusao : Boolean = false
                              ): tStatusDocumentosPag;
var
  Frm: TForm;
  dtmContasPagar: TdtmContasPagar;

  function ExisteEntregaPendente: Boolean;
  begin
    result := true;
    ds[2].First;
    while not ds[2].Eof do
    begin
      if not ds[2].fieldbyname('cancelado').asBoolean then
        if ds[2].fieldbyname('entrega').IsNull then
        begin
          result := false;
          break;
        end;

      ds[2].Next;
    end;
  end;


begin

  result := OK;

  try

    dtmContasPagar := TdtmContasPagar.Create(AOwner);

    case OrigemDocumentopag of

      Romaneios :
      begin
        {
         ds[0] qryRomaneios
         ds[1] qryValorEntrada
         ds[2] qryItensRomaneio
        }

        with dtmContasPagar do
        begin
//          ReFazConsultapornome(qryDocumentosPag, ['numero'], [ds[0].fieldbyname('documentopag').AsInteger]);
          ReFazConsultapornome(qryDocumentosPag, ['numero'], [NumeroDocumentoPag]);

          if not ExisteQuitacao then
          begin
             if (ds[1].fieldbyname('valorvencimento').asCurrency=0) or ForcarExclusao then
             begin
               if (qrydocumentospag.RecordCount = 1) then
               begin

                 qryDuplicatas.first;
                 while not qryDuplicatas.eof do
                    qryDuplicatas.delete;

                 qryDocumentosPag.delete;

                 Perpetrar([qryDuplicatas, qryDocumentosPag]);
                 result := OK;
               end;

             end
             else
             begin

               if (qrydocumentospag.RecordCount = 1) then
                 EditarDocumento
               else
                 IncluirContasPagar;

               qryDocumentosPagfornecedor.AsInteger := ds[0].fieldbyname('fornecedor').asinteger;

               if (ds[0].fieldbyname('frete').asInteger = 1) or
                  (ds[0].fieldbyname('tipo').asString = 'N') then
                 qryDocumentosPagfilialemissao.AsInteger := filialBase
               else
               if pos('L', ds[2].fieldbyname('cliente').AsString)<>0 then
                 qryDocumentosPagfilialemissao.AsString := somentenumero(ds[2].fieldbyname('cliente').AsString)
               else
                 qryDocumentosPagfilialemissao.AsInteger := filialBase;

               qryDocumentosPagevento.AsString := parsistema.Evento_para_pagamento_de_romaneio;
               qryDocumentosPagtipofornecedor.AsString := 'F';
               qryDocumentosPagcomplemento.AsString := 'ROMANEIO '+ds[0].fieldbyname('numero').asString;
               qryDocumentosPagemissao.AsDateTime := ds[0].fieldbyname('emissao').asDateTime;
               qryDocumentosPagdatalancto.AsDateTime := dataServidor;
               qryDocumentosPagvalor.AsCurrency := ds[1].fieldbyname('valorvencimento').asCurrency;
               qryDocumentosPagprevisao.AsBoolean := not ExisteEntregaPendente;

   //            qryDocumentosPag.Post;

               if qryDuplicatas.recordcount <> 0 then
               begin

                 qryDuplicatas.first;
                 while not qryDuplicatas.eof do
                 begin
                   if qryDuplicatas.RecNo = 1 then
                   begin
                     qryDuplicatas.Edit;
                     qryDuplicatasDataVencto.AsDateTime := DataServidor;
                     qryDuplicatasValorVencto.AsCurrency := ds[1].fieldbyname('valorvencimento').asCurrency;
                     qryDuplicatas.post;
                     qryDuplicatas.next;
                   end
                   else
                     qryDuplicatas.delete;
                 end;

               end
               else
               begin
                 IncluirDuplicatas(topINSERIR);
                 qryDuplicatasDataVencto.AsDateTime := DataServidor;
                 qryDuplicatasValorVencto.AsCurrency := ds[1].fieldbyname('valorvencimento').asCurrency;
                 qryDuplicatas.Post;
               end;

               if  GravarContasPagar(topINSERIR) then
               begin
                 result := OK;
                 ds[0].edit;
                 ds[0].fieldbyname('documentopag').asinteger := qrydocumentospagnumero.asinteger;
                 ds[0].post;

                 Frm := TfrmContasPagar.Referencia;
                 if Assigned(Frm) then
                   if qrydocumentospagnumero.asinteger = TfrmContasPagar(Frm).NumeroDocumentoPag then
                      TfrmContasPagar(Frm).ReabrirDocumentoPag;

               end
               else
                 result := ErroGravacao
             end;

          end
          else
            result := DuplicataPaga;
        end;

      end;

    end;
  finally

    freeandnil(dtmContasPagar);

  end;



end;


Function DesQuitarDuplicatas_(AOwner: TComponent;
          OrigemDocumentopag: TOrigemDocumentopag;
          DocumentoPag, NumeroDuplicata: integer; DataVencto: tDateTime): Boolean;
var
  dtmContasPagar: TdtmContasPagar;
  Frm, FrmQuitacao: TForm;

begin
  result := true;

  try
    dtmContasPagar := TdtmContasPagar.Create(AOwner);

    if result then
    begin
      case OrigemDocumentopag of
        PagamentoCaixa :
          result := dtmContasPagar.DesQuitarDuplicatas(
            DocumentoPag, NumeroDuplicata,
            DataVencto, nil);
      end;
    end;

  finally
    freeandnil(dtmContasPagar);

    Frm := TfrmContasPagar.Referencia;
    if Assigned(Frm) then
      if DocumentoPag = TfrmContasPagar(Frm).NumeroDocumentoPag then
        TfrmContasPagar(Frm).ReabrirDocumentoPag;

    FrmQuitacao := TfrmQuitacaoDuplicatas.Referencia;
    if Assigned(FrmQuitacao) then
      TfrmQuitacaoDuplicatas(FrmQuitacao).sbnGerar.Click;

  end;

end;



function QuitarDuplicatas_(AOwner: TComponent;
          OrigemDocumentopag: TOrigemDocumentopag;
          DocumentoPag, NumeroDuplicata,
          FilialPagto, TipoPagto, ContaBancaria, ContaCreditoContabil: integer;
          Cheque, Observacao: String; DataVencto, DataQuitacao: tDateTime;
          ValorPagamento: Currency; AgruparPagamentosnoLote: Boolean;
          SequenciaMovtosBancos, NrLoteContabil: String): Boolean;
var
  dtmContasPagar: TdtmContasPagar;
  Frm, FrmQuitacao: TForm;

begin
  result := true;

  try
    dtmContasPagar := TdtmContasPagar.Create(AOwner);

    if result then
    begin

      if dtmContasPagar.IntegracaocomBancos or ParSistema.GerarContabilidade then
      begin
        if ContaBancaria=0 then
        begin
          MensagemErro(ctCONTABRANCO+'. Verifique a conta para pagamento no cadastro de filiais.');
          result := false;
        end
        else
        if ParSistema.GerarContabilidade and (ContaCreditoContabil = 0) then
        begin
           MensagemErro(format(ctBANCOSEMCONTACONTABIL,
               [inttostr(ContaBancaria)]));
           result := false;
        end;
      end;


      case OrigemDocumentopag of

        PagamentoCaixa :
          result := dtmContasPagar.QuitarDuplicatas(
            DocumentoPag, NumeroDuplicata,
            FilialPagto, TipoPagto, ContaBancaria, ContaCreditoContabil,
            Cheque, Observacao, DataVencto, DataQuitacao,
            ValorPagamento, 0.00,
            AgruparPagamentosnoLote,
            SequenciaMovtosBancos, NrLoteContabil);
      end;
    end;

  finally
    freeandnil(dtmContasPagar);

    Frm := TfrmContasPagar.Referencia;
    if Assigned(Frm) then
      if DocumentoPag = TfrmContasPagar(Frm).NumeroDocumentoPag then
        TfrmContasPagar(Frm).ReabrirDocumentoPag;

    FrmQuitacao := TfrmQuitacaoDuplicatas.Referencia;
    if Assigned(FrmQuitacao) then
      TfrmQuitacaoDuplicatas(FrmQuitacao).sbnGerar.Click;

  end;

end;



procedure TdtmContasPagar.AbrirDocumentoPag(Numero: integer);
begin
  ReFazConsulta(qryDocumentosPag,[0],[numero]);
end;

{
function TdtmContasPagar.getfrmcadastroduplicatascontaspagar: Tfrmcadastroduplicatascontaspagar;
begin
  if not assigned(ffrmcadastroduplicatascontaspagar) then
    ffrmcadastroduplicatascontaspagar := Tfrmcadastroduplicatascontaspagar.Create(self);

  Result := ffrmcadastroduplicatascontaspagar;
end;
}

function TdtmContasPagar.ValidarPagamento(OrigemClass: TClass): Boolean;
begin
  result := true;

  if Operacao  = topPAGAMENTO then
  begin
    //result := VerificarChequeCadastrado;
    if result then
    begin
      if (qryDuplicatastipopagamento.AsInteger=0) and
         (qryDuplicatasvalorpagto.AsCurrency<>0) then
      begin
        MensagemErro('Não foi informado o tipo de pagamento');
        if OrigemClass  =  Tfrmcadastroduplicatascontaspagar then
        with TfrmContasPagar(self.owner).frmCadastroDuplicatasContasPagar do
        begin
          flkTipoPagto.SetFocus;
          flkTipoPagto.SelectAll;
        end;
        result := false;
      end;

      if ParSistema.GerarContabilidade and result then
      begin
        if not qryDocumentosPagcreditar.IsNull or
           (dtmLancamentoContabilidade.qryDocumentosPagLancamentos.RecordCount<>0) then
        begin
          if qryDuplicatastipopagamento.AsInteger<>3 then
          begin
            if qryDuplicatasvalorpagto.AsCurrency <> 0 then
            begin
              if qryDuplicatascontapagto.IsNull then
              begin
                MensagemErro(ctCONTABRANCO);
                result := false;
              end
              else
              if qryDuplicatascontacredito.IsNull then
              begin
                MensagemErro(format(ctBANCOSEMCONTACONTABIL,
                   [qryDuplicatascontapagto.AsString]));
                result := false;
              end;
            end;
          end
          else
          begin
            if qryDuplicatascontacredito.IsNull or
               qryProcurarFornecedoresadiantamento.IsNull then
            begin
              MensagemErro(format(ctFORNECEDORSEMADIANTAMENTO,
                 [qryProcurarFornecedoresnome.AsString]));
              result := false;
            end;
          end;

        end
        else
        begin
          MensagemAviso('Não foi definida a contrapartida do lançamento.');
          result := false;
        end;
      end;

      if (qryDuplicatastipopagamento.AsInteger=3) and result then
      begin
        if SaldoAdiantamento <
           qryDuplicatasvalorpagto.AsCurrency then
        begin
          if SaldoAdiantamento = 0 then
            MensagemErro('Não existe saldo de adiantamento para o pagamento.')
          else
            MensagemErro(format('O Saldo do adiantamento é de %f.'+ #10#13 +
                                'Insuficiente para o pagamento.',[SaldoAdiantamento]));
          result := false;
        end;
      end;
    end;
  end;

end;


procedure TdtmContasPagar.ShowProgress(Exibir: Boolean);
begin
  if self.owner.ClassName = 'TfrmContasPagar' then
  begin
    if Exibir then
    begin
      TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).visible := true;
      TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).Appearance.ValueFormat := 'Adicionando duplicatas %.0f%%';
      TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).Position := vPosition;
      Application.ProcessMessages;
    end
    else
    begin
      TAdvSmoothProgressBar(self.owner.FindComponent('AdvSmoothProgressBar1')).visible := false;
      Application.ProcessMessages;
    end;

  end;
end;


procedure TdtmContasPagar.ImprimirRecibo;
var
  Usuario: TtecUsuarios;

  vDocumentoPag : integer;
  vDataVencto : TDateTime;
  vNumero : integer;
  vReadOnlyDuplicatas : Boolean;


begin

  try

    vDocumentoPag := qryDuplicatasDocumentoPag.AsInteger;
    vDataVencto   := qryDuplicatasDataVencto.AsDateTime;
    vNumero       := qryDuplicatasNumero.AsInteger;

    qryDuplicatas.MacroByName('SelecionarPorChave').AsString := '';
    RefazConsultapornome(qryDuplicatas,['documento','DataVencto','numero'],[qryDocumentosPagnumero.AsInteger, 0, 0]);

    vReadOnlyDuplicatas := qryDuplicatas.ReadOnly;
    qryDuplicatas.ReadOnly := false;


    if qryduplicatas.Locate('documentopag;datavencto;numero',VarArrayof([vDocumentoPag,vDataVencto,vNumero]),[]) then
    begin
      qryDuplicatas.AfterPost := nil;
      qryDuplicatas.AfterScroll := nil;
      qryDuplicatas.BeforePost := nil;

      dtmImprimeAutorizacaoPagto := TdtmImprimeAutorizacaoPagto.create(self);
      if qryDuplicatas.RecordCount = 1 then
        dtmImprimeAutorizacaoPagto.ImprimirRecibo(ListadeDuplicatas('F',true))
      else
      begin
        case MensagemSimNaoOpcaoCancelar('Deseja imprimir todos os recibos de pagamento possíveis?' ,'',true,
                                         '&Todas',
                                         '&Registro Atual') of
          mrYes: dtmImprimeAutorizacaoPagto.ImprimirRecibo(ListadeDuplicatas('F',false));
          mrNo : dtmImprimeAutorizacaoPagto.ImprimirRecibo(ListadeDuplicatas('F',true));
        end;
      end;
    end
    else
      MensagemErro(format(ctNENHUMREGISTROENCONTRADO,['registro']));


  finally
    qryDuplicatas.ReadOnly := vReadOnlyDuplicatas;

    qryDuplicatas.AfterPost   := qryDuplicatasAfterPost;
    qryDuplicatas.AfterScroll := qryDuplicatasAfterScroll;
    qryDuplicatas.BeforePost  := qryDuplicatasBeforePost;

  end;
end;

function TdtmContasPagar.ListadeDuplicatas(Tipo: String; SomenteAtual: Boolean): String;
var
 vRecno : integer;
begin
  begin
    if SomenteAtual then
    begin

      if ((tipo='A') and qryDuplicatasdatapagto.IsNull) or
         ((tipo='F') and not qryDuplicatasdatapagto.IsNull) then
      begin
        result := '('+qryDuplicatasDocumentoPag.AsString+','+
                      quotedstr(formatdatetime('yyyy-mm-dd',qryDuplicatasDataVencto.AsDateTime))+','+
                      qryDuplicatasNumero.AsString+')';
        try
          vRecno := qryDuplicatas.recno;
          qryDuplicatas.Edit;
          {Não esta atualizando o banco quando o dado continua igual}
          qryDuplicatasautorizado.AsBoolean := true;
          qryDuplicatasdataautorizacaopagto.AsDateTime := now;
          qryDuplicatas.Post;
          perpetrar([qryduplicatas]);

        finally
          qryDuplicatas.recno := vRecno;
        end;
      end;
    end
    else
    begin
      qryduplicatas.First;
      while not qryduplicatas.Eof do
      begin
        if ((tipo='A') and qryDuplicatasdatapagto.IsNull) or
           ((tipo='F') and not qryDuplicatasdatapagto.IsNull) then
        begin
          result := result +
                    '('+ qryDuplicatasdocumentopag.AsString + ','
                       + quotedstr(formatdatetime('yyyy-mm-dd',qryDuplicatasdatavencto.AsDateTime)) + ','
                       + qryDuplicatasnumero.AsString + '),';
          try
            vRecno := qryDuplicatas.recno;
            qryDuplicatas.Edit;
            qryDuplicatasautorizado.AsBoolean := true;
            qryDuplicatasdataautorizacaopagto.AsDateTime := now;
            qryDuplicatas.Post;
            perpetrar([qryduplicatas]);

          finally
            qryDuplicatas.recno := vRecno;
          end;
        end;
        qryduplicatas.next;
      end;
      delete(result, length(result),1);

    end;
  end;

end;

procedure TdtmContasPagar.cdsTotalDuplicatasCalcFields(DataSet: TDataSet);
begin
  inherited;
//  cdsTotalDuplicatasTotalValorVencto_.value := cdsTotalDuplicatasTotalValorVencto.value;
end;

procedure TdtmContasPagar.cdsTotalDuplicatasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qryDuplicatas.VoltarRegistro;

  qryTotalDuplicatas.close;
  qryTotalDuplicatas.open;
  qryTotalDuplicatas.delete;

  qryTotalDuplicatas.append;

  qryTotalDuplicatastotalvalorvencto.asVariant := cdsTotalDuplicatasTotalValorVencto.asVariant;
  qryTotalDuplicatastotalvalordesconto.asVariant := cdsTotalDuplicatasTotalValorDesconto.asVariant;
  qryTotalDuplicatastotaljuros.asVariant := cdsTotalDuplicatastotaljuros.asVariant;
  qryTotalDuplicatastotalmulta.asVariant := cdsTotalDuplicatastotalmulta.asVariant;
  qryTotalDuplicatastotalvalorapagar.asVariant := cdsTotalDuplicatasTotalValorAPagar.asVariant;
  qryTotalDuplicatastotalvalorpagto.asVariant := cdsTotalDuplicatasTotalvalorpagto.asVariant;
  qryTotalDuplicatastotaljurospagos.asVariant := cdsTotalDuplicatasTotalJurosPagos.asVariant;
  qryTotalDuplicatasTotaldesctosobtidos.asVariant := cdsTotalDuplicatasToTalDesctosObtidos.asVariant;

  qryTotalDuplicatas.post;


end;

procedure TdtmContasPagar.cdsTotalDuplicatasBeforeClose(DataSet: TDataSet);
begin
  inherited;
  qryDuplicatas.GuardarRegistroAtual(true);
end;

procedure TdtmContasPagar.ReabrirDuplicatas;
begin

  {
  try
    qryDuplicatas.GuardarRegistroAtual(true);
    RefazConsultapornome(qryDuplicatas,['documento','DataVencto','numero'],[qryDocumentosPagnumero.AsInteger, 0, 0]);
  finally
    qryDuplicatas.VoltarRegistro;

  end;
  }
  
end;

initialization
  dmBasico.IncluirDocumentosPag := IncluirDocumentosPag;
  dmBasico.QuitarDuplicatas_ := QuitarDuplicatas_;
  dmBasico.DesQuitarDuplicatas_ := DesQuitarDuplicatas_;
end.


