unit bbecf_elgin;

interface

uses {$IFNDEF LINUX}Windows,{$ENDIF} Classes;

{$B-}
{$R-}
{$V-}
{$T-}
{$X+}
{$P+}
{$J+}
{$H+}

{***************** Definicao de Constantes da API ****************}

const
{$IFNDEF LINUX}
  LIB_NAME = 'elgin.dll';
  INI_FILE = 'elgin.ini';
  INI_PATH = 'c:\windows\system32\';
{$ELSE}
  LIB_NAME = 'tececfelgin.so';
//  INI_FILE = 'BEMAFI.ini';
  INI_PATH = '/usr/lib/';

{$ENDIF}

   {************* Definicao de Tipos de Funçoes da API **************}

type

{~~~~~~~~~~~~~~~~~~~~~~~~
 Funções de Inicialização
~~~~~~~~~~~~~~~~~~~~~~~~~~}

    TElgin_AlteraSimboloMoeda = function(SimboloMoeda: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_ProgramaAliquota = function(Aliquota: String; ICMS_ISS: Integer): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_ProgramaHorarioVerao = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_NomeiaTotalizadorNaoSujeitoIcms = function(Indice: Integer; Totalizador: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_ProgramaArredondamento = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_ProgramaTruncamento = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_NomeiaDepartamento = function(Indice: Integer; Departamento: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_LinhasEntreCupons = function(Linhas: Integer): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_EspacoEntreLinhas = function(Dots: Integer): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_ResetaImpressora = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFDEF MSWINDOWS}
    TElgin_ForcaImpactoAgulhas = function(ForcaImpacto: Integer): Integer; stdcall;
    {$ENDIF}

{~~~~~~~~~~~~~~~~~~~~~~~~
 Funções do Cupom Fiscal
~~~~~~~~~~~~~~~~~~~~~~~~~~}

    TElgin_AbreCupom = function(CGC_CPF: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TElgin_VendeItem = function(Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String;
                               Quantidade: String; CasasDecimais: Integer; ValorUnitario: String;
                               TipoDesconto: String; Desconto: String): Integer; stdcall
    {$ELSE}
    TElgin_VendeItem = function(Codigo, Descricao, Aliquota, Quantidade,
                               Valor, Desconto: String): Integer; cdecl
    {$ENDIF};

    TElgin_VendeItemDepartamento = function(Codigo, Descricao, Aliquota, ValorUnitario,
                                           Quantidade, Acrescimo, Desconto, IndiceDepartamento,
                                           UnidadeMedida: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_CancelaItemAnterior = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_CancelaItemGenerico = function(NumeroItem: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_CancelaCupom = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TElgin_FechaCupomResumido = function(FormaPagamento, Mensagem: String): Integer; stdcall
    {$ELSE}
    TElgin_FechaCupomResumido = function(FormaPagamento, {Valor, }Mensagem: String): Integer; cdecl
    {$ENDIF};

    {$IFNDEF LINUX}
    TElgin_FechaCupom = function(FormaPagamento, AcrescimoDesconto, TipoAcrescimoDesconto,
                                ValorAcrescimoDesconto, ValorPago,
                                Mensagem: String): Integer; stdcall
    {$ELSE}
    TElgin_FechaCupom = function(AcrescimoDesconto, ValorAcrescimoDesconto :String;
                                QtdFormasPagto: Integer;
                                FormasPagto, Valores, Mensagem: String): Integer; cdecl
    {$ENDIF};

    {$IFNDEF LINUX}
    TElgin_IniciaFechamentoCupom = function(AcrescimoDesconto, TipoAcrescimoDesconto,
                                           ValorAcrescimoDesconto: String): Integer; stdcall
    {$ELSE}
    TElgin_IniciaFechamentoCupom = function(AcrescimoDesconto, TipoAcrescimoDesconto,
                                           ValorAcrescimoDesconto: String): Integer; cdecl
    {$ENDIF};

    TElgin_VerificaFormaPagamento = function(FormaPagto: String; var Valor: String): Integer; cdecl;

    {$IFNDEF LINUX}
    TElgin_EfetuaFormaPagamento = function(FormaPagamento,
                                          ValorFormaPagamento: String): Integer; stdcall
    {$ELSE}
    TElgin_EfetuaFormaPagamento = function(FormaPagamento, ValorFormaPagamento,
                                          Descricao: String): Integer; cdecl
    {$ENDIF};

    TElgin_ProgramaFormasPagamento = function(FormasPagto: String; var Indice: Integer): Integer cdecl;

    {$IFDEF MSWINDOWS}
    TElgin_EfetuaFormaPagamentoDescricaoForma = function(FormaPagamento, ValorFormaPagamento,
                                                        DescricaoFormaPagto: String ): Integer; stdcall;
    {$ENDIF}

    TElgin_TerminaFechamentoCupom = function(Mensagem: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFDEF MSWINDOWS}
    TElgin_EstornoFormasPagamento = function(FormaOrigem, FormaDestino,
                                            Valor: String): Integer; stdcall;
    {$ENDIF}

    TElgin_UsaUnidadeMedida = function(UnidadeMedida: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_AumentaDescricaoItem = function(Descricao: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};


{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções dos Relatórios Fiscais
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

    TElgin_LeituraX = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TElgin_ReducaoZ = function(Data, Hora: String): Integer; stdcall
    {$ELSE}
    TElgin_ReducaoZ = function: Integer; cdecl
    {$ENDIF};

    TElgin_RelatorioGerencial = function(Texto: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_FechaRelatorioGerencial = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_LeituraMemoriaFiscalData = function(DataInicial, DataFinal: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_LeituraMemoriaFiscalSerialDataMFD = function(DataInicial, DataFinal, FlagLeitura: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_LeituraMemoriaFiscalReducao = function(ReducaoInicial, ReducaoFinal: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};


{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções das Operações Não Fiscais
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

    TElgin_RecebimentoNaoFiscal = function(IndiceTotalizador: String; Valor: String;
                                          FormaPagamento: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_AbreComprovanteNaoFiscalVinculado = function(FormaPagamento, Valor,
                                                       NumeroCupom: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_UsaComprovanteNaoFiscalVinculado = function(Texto: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_FechaComprovanteNaoFiscalVinculado = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_Sangria = function(Valor: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TElgin_Suprimento = function(Valor, FormaPagamento: String): Integer; stdcall
    {$ELSE}
    TElgin_Suprimento = function(Valor: String): Integer; cdecl
    {$ENDIF};

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções de Informações da Impressora
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

    {$IFNDEF LINUX}
     TElgin_NumeroSerie = function(NumeroSerie: String): Integer; stdcall
    {$ELSE}
     TElgin_NumeroSerie = function(var NumeroSerie: String): Integer; cdecl
    {$ENDIF};

    TElgin_SubTotal = function(SubTotal: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TElgin_NumeroCupom = function(NumeroCupom: String): Integer; stdcall
    {$ELSE}
    TElgin_NumeroCupom = function(var NumeroCupom: String): Integer; cdecl
    {$ENDIF};

    TElgin_LeituraXSerial = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_VersaoFirmware = function(VersaoFirmware: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TElgin_CGC_IE = function(CGC, IE: String): Integer; stdcall
    {$ELSE}
    TElgin_CGC_IE = function(var CGCIE: String): Integer; cdecl
    {$ENDIF};

    TElgin_GrandeTotal = function(GrandeTotal: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_Cancelamentos = function(ValorCancelamentos: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
     TElgin_Descontos = function(ValorDescontos: String): Integer; stdcall
    {$ELSE}
     TElgin_Descontos = function(var ValorDescontos: String): Integer; cdecl
    {$ENDIF};

    TElgin_ContadorSequencial = function(Cupom: String): Integer; cdecl;

    TElgin_NumeroOperacoesNaoFiscais = function(NumeroOperacoes: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_NumeroCuponsCancelados = function(NumeroCancelamentos: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
     TElgin_NumeroIntervencoes = function(NumeroIntervencoes: String): Integer; stdcall
    {$ELSE}
     TElgin_NumeroIntervencoes = function(var NumeroIntervencoes: String): Integer; cdecl
    {$ENDIF};

    TElgin_NumeroReducoes = function(NumeroReducoes: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_NumeroSubstituicoesProprietario = function(NumeroSubstituicoes: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_UltimoItemVendido = function(NumeroItem: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_ClicheProprietario = function(Cliche: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TElgin_NumeroCaixa = function(NumeroCaixa: String): Integer; stdcall
    {$ELSE}
    TElgin_NumeroCaixa = function(var NumeroCaixa: String): Integer; cdecl
    {$ENDIF};

    TElgin_NumeroLoja = function(NumeroLoja: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_SimboloMoeda = function(SimboloMoeda: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_FlagsFiscais = function(var Flag: Integer): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_MinutosLigada = function(Minutos: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_MinutosImprimindo = function(Minutos: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_VerificaModoOperacao = function(Modo: string): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_VerificaEpromConectada = function(Flag: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_ValorPagoUltimoCupom = function(ValorCupom: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TElgin_DataHoraImpressora = function(Data, Hora: String): Integer; stdcall
    {$ELSE}
    TElgin_DataHoraImpressora = function(var DataHora: String): Integer; cdecl
    {$ENDIF};

    TElgin_ContadoresTotalizadoresNaoFiscais = function(var Contadores: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_VerificaTotalizadoresNaoFiscais = function(var Totalizadores: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TElgin_DataHoraReducao = function(Data, Hora: String): Integer; stdcall
    {$ELSE}
    TElgin_DataHoraReducao = function(var DataHora: String): Integer; cdecl
    {$ENDIF};

    TElgin_DataMovimento = function(Data: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_VerificaTruncamento = function(Flag: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TElgin_Acrescimos = function(ValorAcrescimos: String): Integer; stdcall
    {$ELSE}
    TElgin_Acrescimos = function(var ValorAcrescimos: String): Integer; cdecl
    {$ENDIF};

    TElgin_ContadorBilhetePassagem = function(ContadorPassagem: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFDEF MSWINDOWS}
    TElgin_VerificaAliquotasIss = function(Flag: String): Integer; stdcall;
    TElgin_VerificaFormasPagamento = function(Formas: String): Integer; stdcall;
    {$ENDIF}

    {$IFNDEF LINUX}
    TElgin_VerificaRecebimentoNaoFiscal = function( Recebimentos: String): Integer; stdcall;
    {$ELSE}
    TElgin_VerificaRecebimentoNaoFiscal = function(var Recebimentos: String): Integer; cdecl;
    {$ENDIF}

    TElgin_VerificaDepartamentos = function(Departamentos: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_VerificaTipoImpressora = function(var TipoImpressora: Integer): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TElgin_VerificaTotalizadoresParciais = function(Totalizadores: String): Integer; stdcall
    {$ELSE}
    TElgin_VerificaTotalizadoresParciais = function(var Totalizadores: String): Integer; cdecl
    {$ENDIF};

    {$IFNDEF LINUX}
    TElgin_RetornoAliquotas = function(Aliquotas: String): Integer; stdcall
    {$ELSE}
    TElgin_RetornoAliquotas = function(var Aliquotas: String): Integer; cdecl
    {$ENDIF};

    {$IFNDEF LINUX}
    TElgin_VerificaEstadoImpressora = function(var ACK, ST1, ST2: Integer): Integer; stdcall
    {$ELSE}
    TElgin_EstadoImpressora = function: Integer; cdecl
    {$ENDIF};

    TElgin_DadosUltimaReducao = function(DadosReducao: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_MonitoramentoPapel = function(var Linhas: Integer): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_VerificaIndiceAliquotasIss = function(Flag: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_ValorFormaPagamento = function(FormaPagamento,  Valor: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_ContadoresTotalizadoresNaoSujeitos = function(var Valor: String): Integer; cdecl;

    {$IFDEF MSWINDOWS}
    TElgin_ValorTotalizadorNaoFiscal = function(Totalizador, Valor: String): Integer; stdcall;
    {$ENDIF}

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções de Autenticação e Gaveta de Dinheiro
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

    TElgin_Autenticacao = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_ProgramaCaracterAutenticacao = function(Caracter: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_AcionaGaveta = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_VerificaEstadoGaveta = function(var EstadoGaveta: Integer): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções para a Impressora Restaurante
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

    {$IFDEF MSWINDOWS}
    TElgin_AbreCupomRestaurante = function(Mesa, CGC_CPF: String): Integer; stdcall;

    TElgin_RegistraVenda = function(Mesa, Codigo, Descricao, Aliquota, Quantidade,
                                   ValorUnitario, FlagAcrescimoDesconto,
                                   ValorAcrescimoDesconto: String): Integer; stdcall;

    TElgin_CancelaVenda = function(Mesa, Codigo, Descricao, Aliquota, Quantidade,
                                  ValorUnitario, FlagAcrescimoDesconto,
                                  ValorAcrescimoDesconto: String): Integer; stdcall;

    TElgin_ConferenciaMesa = function(Mesa, FlagAcrescimoDesconto, TipoAcrescimoDesconto,
                                     ValorAcrescimoDesconto: String): Integer; stdcall;

    TElgin_AbreConferenciaMesa = function(Mesa: String): Integer; stdcall;

    TElgin_FechaConferenciaMesa = function(FlagAcrescimoDesconto, TipoAcrescimoDesconto,
                                          ValorAcrescimoDesconto: String): Integer; stdcall;

    TElgin_TransferenciaMesa = function(MesaOrigem, MesaDestino: String): Integer; stdcall;

    TElgin_ContaDividida = function(NumeroCupons, ValorPago, CGC_CPF: String): Integer; stdcall;

    TElgin_FechaCupomContaDividida = function(NumeroCupons, FlagAcrescimoDesconto,
                                             TipoAcrescimoDesconto, ValorAcrescimoDesconto,
                                             FormasPagamento, ValorFormasPagamento,
                                             ValorPagoCliente, CGC_CPF: String): Integer; stdcall;

    TElgin_TransferenciaItem = function(MesaOrigem, Codigo, Descricao, Aliquota, Quantidade,
                                       ValorUnitario, FlagAcrescimoDesconto,
                                       ValorAcrescimoDesconto, MesaDestino: String) : Integer; stdcall;

    TElgin_RelatorioMesasAbertas = function(TipoRelatorio: Integer): Integer; stdcall;

    TElgin_ImprimeCardapio = function: Integer; stdcall;

    TElgin_RelatorioMesasAbertasSerial = function: Integer; stdcall;

    TElgin_CardapioPelaSerial = function: Integer; stdcall;

    TElgin_RegistroVendaSerial = function(Mesa: String): Integer; stdcall;

    TElgin_VerificaMemoriaLivre = function(Bytes: String): Integer; stdcall;

    TElgin_FechaCupomRestaurante = function(FormaPagamento, FlagAcrescimoDesconto,
                                           TipoAcrescimoDesconto, ValorAcrescimoDesconto,
                                           ValorFormaPagto, Mensagem: String): Integer; stdcall;

    TElgin_FechaCupomResumidoRestaurante = function(FormaPagamento, Valor,
                                                   Mensagem: String): Integer; stdcall;
    {$ENDIF}


{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Função para a Impressora Bilhete de Passagem
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

    {$IFDEF MSWINDOWS}
    TElgin_AbreBilhetePassagem = function (ImprimeValorFinal, ImprimeEnfatizado, Embarque,
                                          Destino, Linha, Prefixo, Agente, Agencia, Data,
                                          Hora,  Poltrona, Plataforma: String ): Integer; stdcall;
    {$ENDIF}


{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções de Impressão de Cheques
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

    TElgin_ProgramaMoedaSingular = function(MoedaSingular: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_ProgramaMoedaPlural = function(MoedaPlural: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_CancelaImpressaoCheque = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TElgin_VerificaStatusCheque = function(var StatusCheque: Integer): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TElgin_ImprimeCheque = function(Banco, Valor, Favorecido, Cidade, Data,
                                   Mensagem: String): Integer; stdcall
    {$ELSE}
    TElgin_ImprimeCheque = function(Banco, Valor, Favorecido, Localidade,
                                   Dia, Mes, Ano, Mensagem: String): Integer; cdecl
    {$ENDIF};

    TElgin_ImprimeChequeBR400 = function(ModoImpressao, Banco, Valor, Favorecido, Localidade,
                                        Dia, Mes, Ano, Mensagem: String): Integer; cdecl;

    TElgin_LeituraCheque = function(DadosCheque: String): Integer; cdecl;

    {$IFDEF MSWINDOWS}
    TElgin_IncluiCidadeFavorecido = function(Cidade: String; Favorecido: String): Integer; stdcall;

    TElgin_ImprimeCopiaCheque = function: Integer; stdcall;
    {$ENDIF}

{~~~~~~~~~~~~~~~~~~
 Funções para o TEF
~~~~~~~~~~~~~~~~~~~}

    {$IFDEF MSWINDOWS}
    TElgin_Status = function(Identificacao: String): Integer; stdcall;

    TElgin_VendaCartao = function(Identificacao, ValorCompra: String): Integer;  stdcall;

    TElgin_ConfirmaVenda = function(Identificacao, ValorCompra,
                                   Header: String): Integer; stdcall;

    TElgin_NaoConfirmaVendaImpressao = function(Identificacao,
                                               ValorCompra: String): Integer; stdcall;

    TElgin_CancelaVendaCartao = function(Identificacao, ValorCompra, Nsu, NumeroCupom, Hora,
                                        Data, Rede: String): Integer; stdcall;

    TElgin_ImprimeTEF = function(Identificacao, FormaPagamento,
                                ValorCompra: String): Integer; stdcall;

    TElgin_ImprimeRelatorio = function: Integer; stdcall;

    TElgin_ADM = function(Identificacao: String): Integer; stdcall;

    TElgin_VendaCompleta = function(Identificacao, ValorCompra, FormaPagamento,
                                   Texto: String): Integer; stdcall;

    TElgin_ConfiguraDiretorioTEF = function(PathReq, PathResp: String): Integer; stdcall;

    TElgin_VendaCheque = function(Identificacao, ValorCompra: String): Integer; stdcall;
    {$ENDIF}

{~~~~~~~~~~~~~~~~
 Outras Funções
~~~~~~~~~~~~~~~~~}

    {$IFNDEF LINUX}
     TElgin_AbrePortaSerial = function: Integer; stdcall
    {$ELSE}
     TElgin_AbrePortaSerial = function(Porta:String): Integer; cdecl
    {$ENDIF};

    TElgin_FechaPortaSerial = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFDEF MSWINDOWS}
    TElgin_RetornoImpressora = function(var iCodErro: Integer; var strErroMsg: String): Integer; stdcall;

    TElgin_MapaResumo = function: Integer; stdcall;

    TElgin_AberturaDoDia = function(ValorCompra, FormaPagamento: String): Integer; stdcall;

    TElgin_FechamentoDoDia = function: Integer; stdcall;

    TElgin_ImprimeConfiguracoesImpressora = function: Integer; stdcall;

    TElgin_ImprimeDepartamentos = function: Integer; stdcall;

    TElgin_RelatorioTipo60Analitico = function: Integer; stdcall;

    TElgin_RelatorioTipo60Mestre = function: Integer; stdcall;

    TElgin_VerificaImpressoraLigada = function: Integer; stdcall;


    {$ENDIF}
    TElgin_FechaRelatorioXouZ = function: Integer; StdCall;

{    TElgin_ImpressaoCarne = function(Titulo, ValoresParcelas, Datas: String;
                                    QtdeParcelas: Integer;
                                    TextoLivre, NomeCliente, RG_CPF, NumeroCupom: String;
                                    NumeroVias, Assinatura: Integer): Integer; StdCall;}

    TElgin_CodigoBarrasEAN13MFD = function(Codigo: String): Integer; StdCall;

    function ElginLoadLib: Boolean;

{**************** Variaveis para funçoes da API ******************}

var
    Elgin_AlteraSimboloMoeda                     : TElgin_AlteraSimboloMoeda;
    Elgin_ProgramaAliquota                       : TElgin_ProgramaAliquota;
    Elgin_ProgramaHorarioVerao                   : TElgin_ProgramaHorarioVerao;
    Elgin_NomeiaDepartamento                     : TElgin_NomeiaDepartamento;
    Elgin_NomeiaTotalizadorNaoSujeitoIcms        : TElgin_NomeiaTotalizadorNaoSujeitoIcms;
    Elgin_ProgramaArredondamento                 : TElgin_ProgramaArredondamento;
    Elgin_ProgramaTruncamento                    : TElgin_ProgramaTruncamento;
    Elgin_LinhasEntreCupons                      : TElgin_LinhasEntreCupons;
    Elgin_EspacoEntreLinhas                      : TElgin_EspacoEntreLinhas;
    Elgin_AbreCupom                              : TElgin_AbreCupom;
    Elgin_VendeItem                              : TElgin_VendeItem;
    Elgin_VendeItemDepartamento                  : TElgin_VendeItemDepartamento;
    Elgin_CancelaItemAnterior                    : TElgin_CancelaItemAnterior;
    Elgin_CancelaItemGenerico                    : TElgin_CancelaItemGenerico;
    Elgin_CancelaCupom                           : TElgin_CancelaCupom;
    Elgin_FechaCupomResumido                     : TElgin_FechaCupomResumido;
    Elgin_FechaCupom                             : TElgin_FechaCupom;
    Elgin_ResetaImpressora                       : TElgin_ResetaImpressora;
    Elgin_IniciaFechamentoCupom                  : TElgin_IniciaFechamentoCupom;
    Elgin_EfetuaFormaPagamento                   : TElgin_EfetuaFormaPagamento;
    Elgin_TerminaFechamentoCupom                 : TElgin_TerminaFechamentoCupom;
    Elgin_UsaUnidadeMedida                       : TElgin_UsaUnidadeMedida;
    Elgin_AumentaDescricaoItem                   : TElgin_AumentaDescricaoItem;
    Elgin_LeituraX                               : TElgin_LeituraX;
    Elgin_ReducaoZ                               : TElgin_ReducaoZ;
    Elgin_RelatorioGerencial                     : TElgin_RelatorioGerencial;
    Elgin_FechaRelatorioGerencial                : TElgin_FechaRelatorioGerencial;
    Elgin_LeituraMemoriaFiscalData               : TElgin_LeituraMemoriaFiscalData;
    Elgin_LeituraMemoriaFiscalSerialDataMFD      : TElgin_LeituraMemoriaFiscalSerialDataMFD;
    Elgin_LeituraMemoriaFiscalReducao            : TElgin_LeituraMemoriaFiscalReducao;
    Elgin_RecebimentoNaoFiscal                   : TElgin_RecebimentoNaoFiscal;
    Elgin_AbreComprovanteNaoFiscalVinculado      : TElgin_AbreComprovanteNaoFiscalVinculado;
    Elgin_UsaComprovanteNaoFiscalVinculado       : TElgin_UsaComprovanteNaoFiscalVinculado;
    Elgin_FechaComprovanteNaoFiscalVinculado     : TElgin_FechaComprovanteNaoFiscalVinculado;
    Elgin_Sangria                                : TElgin_Sangria;
    Elgin_Suprimento                             : TElgin_Suprimento;
    Elgin_NumeroSerie                            : TElgin_NumeroSerie;
    Elgin_SubTotal                               : TElgin_SubTotal;
    Elgin_NumeroCupom                            : TElgin_NumeroCupom;
    Elgin_LeituraXSerial                         : TElgin_LeituraXSerial;
    Elgin_VersaoFirmware                         : TElgin_VersaoFirmware;
    Elgin_CGC_IE                                 : TElgin_CGC_IE;
    Elgin_GrandeTotal                            : TElgin_GrandeTotal;
    Elgin_Cancelamentos                          : TElgin_Cancelamentos;
    Elgin_Descontos                              : TElgin_Descontos;
    Elgin_NumeroOperacoesNaoFiscais              : TElgin_NumeroOperacoesNaoFiscais;
    Elgin_NumeroCuponsCancelados                 : TElgin_NumeroCuponsCancelados;
    Elgin_NumeroIntervencoes                     : TElgin_NumeroIntervencoes;
    Elgin_NumeroReducoes                         : TElgin_NumeroReducoes;
    Elgin_NumeroSubstituicoesProprietario        : TElgin_NumeroSubstituicoesProprietario;
    Elgin_UltimoItemVendido                      : TElgin_UltimoItemVendido;
    Elgin_ClicheProprietario                     : TElgin_ClicheProprietario;
    Elgin_NumeroCaixa                            : TElgin_NumeroCaixa;
    Elgin_NumeroLoja                             : TElgin_NumeroLoja;
    Elgin_SimboloMoeda                           : TElgin_SimboloMoeda;
    Elgin_MinutosLigada                          : TElgin_MinutosLigada;
    Elgin_MinutosImprimindo                      : TElgin_MinutosImprimindo;
    Elgin_VerificaModoOperacao                   : TElgin_VerificaModoOperacao;
    Elgin_VerificaEpromConectada                 : TElgin_VerificaEpromConectada;
    Elgin_FlagsFiscais                           : TElgin_FlagsFiscais;
    Elgin_ValorPagoUltimoCupom                   : TElgin_ValorPagoUltimoCupom;
    Elgin_DataHoraImpressora                     : TElgin_DataHoraImpressora;
    Elgin_ContadoresTotalizadoresNaoFiscais      : TElgin_ContadoresTotalizadoresNaoFiscais;
    Elgin_VerificaTotalizadoresNaoFiscais        : TElgin_VerificaTotalizadoresNaoFiscais;
    Elgin_DataHoraReducao                        : TElgin_DataHoraReducao;
    Elgin_DataMovimento                          : TElgin_DataMovimento;
    Elgin_VerificaTruncamento                    : TElgin_VerificaTruncamento;
    Elgin_Acrescimos                             : TElgin_Acrescimos;
    Elgin_ContadorBilhetePassagem                : TElgin_ContadorBilhetePassagem;
    Elgin_VerificaRecebimentoNaoFiscal           : TElgin_VerificaRecebimentoNaoFiscal;
    Elgin_VerificaDepartamentos                  : TElgin_VerificaDepartamentos;
    Elgin_VerificaTipoImpressora                 : TElgin_VerificaTipoImpressora;
    Elgin_VerificaTotalizadoresParciais          : TElgin_VerificaTotalizadoresParciais;
    Elgin_RetornoAliquotas                       : TElgin_RetornoAliquotas;
    Elgin_DadosUltimaReducao                     : TElgin_DadosUltimaReducao;
    Elgin_MonitoramentoPapel                     : TElgin_MonitoramentoPapel;
    Elgin_VerificaIndiceAliquotasIss             : TElgin_VerificaIndiceAliquotasIss;
    Elgin_ValorFormaPagamento                    : TElgin_ValorFormaPagamento;
    Elgin_Autenticacao                           : TElgin_Autenticacao;
    Elgin_ProgramaCaracterAutenticacao           : TElgin_ProgramaCaracterAutenticacao;
    Elgin_AcionaGaveta                           : TElgin_AcionaGaveta;
    Elgin_VerificaEstadoGaveta                   : TElgin_VerificaEstadoGaveta;
    Elgin_ProgramaMoedaSingular                  : TElgin_ProgramaMoedaSingular;
    Elgin_ProgramaMoedaPlural                    : TElgin_ProgramaMoedaPlural;
    Elgin_CancelaImpressaoCheque                 : TElgin_CancelaImpressaoCheque;
    Elgin_VerificaStatusCheque                   : TElgin_VerificaStatusCheque;
    Elgin_ImprimeCheque                          : TElgin_ImprimeCheque;
    Elgin_AbrePortaSerial                        : TElgin_AbrePortaSerial;
    Elgin_FechaPortaSerial                       : TElgin_FechaPortaSerial;

    {$IFDEF MSWINDOWS}
    Elgin_VerificaAliquotasIss                   : TElgin_VerificaAliquotasIss;
    Elgin_VerificaFormasPagamento                : TElgin_VerificaFormasPagamento;
    Elgin_VerificaEstadoImpressora               : TElgin_VerificaEstadoImpressora;
    Elgin_ForcaImpactoAgulhas                    : TElgin_ForcaImpactoAgulhas;
    Elgin_EfetuaFormaPagamentoDescricaoForma     : TElgin_EfetuaFormaPagamentoDescricaoForma;
    Elgin_EstornoFormasPagamento                 : TElgin_EstornoFormasPagamento;
    Elgin_ValorTotalizadorNaoFiscal              : TElgin_ValorTotalizadorNaoFiscal;
    Elgin_AbreCupomRestaurante                   : TElgin_AbreCupomRestaurante;
    Elgin_RegistraVenda                          : TElgin_RegistraVenda;
    Elgin_CancelaVenda                           : TElgin_CancelaVenda;
    Elgin_ConferenciaMesa                        : TElgin_ConferenciaMesa;
    Elgin_AbreConferenciaMesa                    : TElgin_AbreConferenciaMesa;
    Elgin_FechaConferenciaMesa                   : TElgin_FechaConferenciaMesa;
    Elgin_TransferenciaMesa                      : TElgin_TransferenciaMesa;
    Elgin_ContaDividida                          : TElgin_ContaDividida;
    Elgin_FechaCupomContaDividida                : TElgin_FechaCupomContaDividida;
    Elgin_TransferenciaItem                      : TElgin_TransferenciaItem;
    Elgin_RelatorioMesasAbertas                  : TElgin_RelatorioMesasAbertas;
    Elgin_ImprimeCardapio                        : TElgin_ImprimeCardapio;
    Elgin_RelatorioMesasAbertasSerial            : TElgin_RelatorioMesasAbertasSerial;
    Elgin_CardapioPelaSerial                     : TElgin_CardapioPelaSerial;
    Elgin_RegistroVendaSerial                    : TElgin_RegistroVendaSerial;
    Elgin_VerificaMemoriaLivre                   : TElgin_VerificaMemoriaLivre;
    Elgin_FechaCupomRestaurante                  : TElgin_FechaCupomRestaurante;
    Elgin_FechaCupomResumidoRestaurante          : TElgin_FechaCupomResumidoRestaurante;
    Elgin_AbreBilhetePassagem                    : TElgin_AbreBilhetePassagem;
    Elgin_IncluiCidadeFavorecido                 : TElgin_IncluiCidadeFavorecido;
    Elgin_ImprimeCopiaCheque                     : TElgin_ImprimeCopiaCheque;
    Elgin_Status                                 : TElgin_Status;
    Elgin_VendaCartao                            : TElgin_VendaCartao;
    Elgin_ConfirmaVenda                          : TElgin_ConfirmaVenda;
    Elgin_NaoConfirmaVendaImpressao              : TElgin_NaoConfirmaVendaImpressao;
    Elgin_CancelaVendaCartao                     : TElgin_CancelaVendaCartao;
    Elgin_ImprimeTEF                             : TElgin_ImprimeTEF;
    Elgin_ImprimeRelatorio                       : TElgin_ImprimeRelatorio;
    Elgin_ADM                                    : TElgin_ADM;
    Elgin_VendaCompleta                          : TElgin_VendaCompleta;
    Elgin_ConfiguraDiretorioTEF                  : TElgin_ConfiguraDiretorioTEF;
    Elgin_VendaCheque                            : TElgin_VendaCheque;
    Elgin_RetornoImpressora                      : TElgin_RetornoImpressora;
    Elgin_MapaResumo                             : TElgin_MapaResumo;
    Elgin_AberturaDoDia                          : TElgin_AberturaDoDia;
    Elgin_FechamentoDoDia                        : TElgin_FechamentoDoDia;
    Elgin_ImprimeConfiguracoesImpressora         : TElgin_ImprimeConfiguracoesImpressora;
    Elgin_ImprimeDepartamentos                   : TElgin_ImprimeDepartamentos;
    Elgin_RelatorioTipo60Analitico               : TElgin_RelatorioTipo60Analitico;
    Elgin_RelatorioTipo60Mestre                  : TElgin_RelatorioTipo60Mestre;
    Elgin_VerificaImpressoraLigada               : TElgin_VerificaImpressoraLigada;
    {$ENDIF}

    Elgin_VerificaFormaPagamento                 : TElgin_VerificaFormaPagamento;
    Elgin_ProgramaFormasPagamento                : TElgin_ProgramaFormasPagamento;
    Elgin_ContadorSequencial                     : TElgin_ContadorSequencial;
    Elgin_ContadoresTotalizadoresNaoSujeitos     : TElgin_ContadoresTotalizadoresNaoSujeitos;
    Elgin_ImprimeChequeBR400                     : TElgin_ImprimeChequeBR400;
    Elgin_LeituraCheque                          : TElgin_LeituraCheque;
    Elgin_FechaRelatorioXouZ                     : TElgin_FechaRelatorioXouZ;
{    Elgin_ImpressaoCarne                         : TElgin_ImpressaoCarne;     }
    Elgin_CodigoBarrasEAN13MFD                   : TElgin_CodigoBarrasEAN13MFD;

const
  Lib: string = LIB_NAME;
  LibNotFound = 'A biblioteca %s não foi encontrada';

implementation

uses SysUtils;//, biblio {$IFDEF LINUX }, Libc {$ENDIF};//, bbbema;

{***************** Constantes da biblioteca  ****************}

const
  COM1  = '/dev/ttyS0';
  COM2  = '/dev/ttyS1';
  COM3  = '/dev/ttyS2';
  COM4  = '/dev/ttyS3';
  COM5  = '/dev/ttyS4';
  COM6  = '/dev/ttyS5';
  COM7  = '/dev/ttyS6';
  COM8  = '/dev/ttyS7';
  COM9  = '/dev/ttyS8';
  COM10 = '/dev/ttyS9';
  COM11 = '/dev/ttyS10';
  COM12 = '/dev/ttyS11';
  COM13 = '/dev/ttyS12';
  COM14 = '/dev/ttyS13';
  COM15 = '/dev/ttyS14';
  STX  = #2;
  ETX  = #3;
  ACK  = $06;
  NAK  = $15;
  STATUS = 3;

var
  hLib: THandle = 0;
  LibLoaded: Boolean = False;


{***************** Handlers da porta serial  ****************}

function ElginLoadLib: Boolean;
begin
  Result := False;
  {Carrega biblioteca}
  if hLib = 0 then
  begin
    hLib := GetModuleHandle(PChar(Lib));
    LibLoaded := False;
    if hLib = 0 then
    begin
      hLib := LoadLibrary(PChar(Lib));
      LibLoaded := True;
    end;
  end;
  {Carrega funcoes contidas na biblioteca}
  if hLib <> 0 then begin
    @Elgin_AlteraSimboloMoeda                    := GetProcAddress(hLib, 'Elgin_AlteraSimboloMoeda');
    @Elgin_ProgramaAliquota                      := GetProcAddress(hLib, 'Elgin_ProgramaAliquota');
    @Elgin_ProgramaHorarioVerao                  := GetProcAddress(hLib, 'Elgin_ProgramaHorarioVerao');
    @Elgin_NomeiaDepartamento                    := GetProcAddress(hLib, 'Elgin_NomeiaDepartamento');
    @Elgin_NomeiaTotalizadorNaoSujeitoIcms       := GetProcAddress(hLib, 'Elgin_NomeiaTotalizadorNaoSujeitoIcms');
    @Elgin_ProgramaArredondamento                := GetProcAddress(hLib, 'Elgin_ProgramaArredondamento');
    @Elgin_ProgramaTruncamento                   := GetProcAddress(hLib, 'Elgin_ProgramaTruncamento');
    @Elgin_LinhasEntreCupons                     := GetProcAddress(hLib, 'Elgin_LinhasEntreCupons');
    @Elgin_EspacoEntreLinhas                     := GetProcAddress(hLib, 'Elgin_EspacoEntreLinhas');
    @Elgin_AbreCupom                             := GetProcAddress(hLib, 'Elgin_AbreCupom');
    @Elgin_VendeItem                             := GetProcAddress(hLib, 'Elgin_VendeItem');
    @Elgin_VendeItemDepartamento                 := GetProcAddress(hLib, 'Elgin_VendeItemDepartamento');
    @Elgin_CancelaItemAnterior                   := GetProcAddress(hLib, 'Elgin_CancelaItemAnterior');
    @Elgin_CancelaItemGenerico                   := GetProcAddress(hLib, 'Elgin_CancelaItemGenerico');
    @Elgin_CancelaCupom                          := GetProcAddress(hLib, 'Elgin_CancelaCupom');
    @Elgin_FechaCupomResumido                    := GetProcAddress(hLib, 'Elgin_FechaCupomResumido');
    @Elgin_FechaCupom                            := GetProcAddress(hLib, 'Elgin_FechaCupom');
    @Elgin_ResetaImpressora                      := GetProcAddress(hLib, 'Elgin_ResetaImpressora');
    @Elgin_IniciaFechamentoCupom                 := GetProcAddress(hLib, 'Elgin_IniciaFechamentoCupom');
    @Elgin_EfetuaFormaPagamento                  := GetProcAddress(hLib, 'Elgin_EfetuaFormaPagamento');
    @Elgin_TerminaFechamentoCupom                := GetProcAddress(hLib, 'Elgin_TerminaFechamentoCupom');
    @Elgin_UsaUnidadeMedida                      := GetProcAddress(hLib, 'Elgin_UsaUnidadeMedida');
    @Elgin_AumentaDescricaoItem                  := GetProcAddress(hLib, 'Elgin_AumentaDescricaoItem');
    @Elgin_LeituraX                              := GetProcAddress(hLib, 'Elgin_LeituraX');
    @Elgin_ReducaoZ                              := GetProcAddress(hLib, 'Elgin_ReducaoZ');
    @Elgin_RelatorioGerencial                    := GetProcAddress(hLib, 'Elgin_RelatorioGerencial');
    @Elgin_FechaRelatorioGerencial               := GetProcAddress(hLib, 'Elgin_FechaRelatorioGerencial');
    @Elgin_LeituraMemoriaFiscalData              := GetProcAddress(hLib, 'Elgin_LeituraMemoriaFiscalData');
    @Elgin_LeituraMemoriaFiscalSerialDataMFD     := GetProcAddress(hLib, 'Elgin_LeituraMemoriaFiscalSerialDataMFD');
    
    @Elgin_LeituraMemoriaFiscalReducao           := GetProcAddress(hLib, 'Elgin_LeituraMemoriaFiscalReducao');
    @Elgin_RecebimentoNaoFiscal                  := GetProcAddress(hLib, 'Elgin_RecebimentoNaoFiscal');
    @Elgin_AbreComprovanteNaoFiscalVinculado     := GetProcAddress(hLib, 'Elgin_AbreComprovanteNaoFiscalVinculado');
    @Elgin_UsaComprovanteNaoFiscalVinculado      := GetProcAddress(hLib, 'Elgin_UsaComprovanteNaoFiscalVinculado');
    @Elgin_FechaComprovanteNaoFiscalVinculado    := GetProcAddress(hLib, 'Elgin_FechaComprovanteNaoFiscalVinculado');
    @Elgin_Sangria                               := GetProcAddress(hLib, 'Elgin_Sangria');
    @Elgin_Suprimento                            := GetProcAddress(hLib, 'Elgin_Suprimento');
    @Elgin_NumeroSerie                           := GetProcAddress(hLib, 'Elgin_NumeroSerie');
    @Elgin_SubTotal                              := GetProcAddress(hLib, 'Elgin_SubTotal');
    @Elgin_NumeroCupom                           := GetProcAddress(hLib, 'Elgin_NumeroCupom');
    @Elgin_LeituraXSerial                        := GetProcAddress(hLib, 'Elgin_LeituraXSerial');
    @Elgin_VersaoFirmware                        := GetProcAddress(hLib, 'Elgin_VersaoFirmware');
    @Elgin_CGC_IE                                := GetProcAddress(hLib, 'Elgin_CGC_IE');
    @Elgin_GrandeTotal                           := GetProcAddress(hLib, 'Elgin_GrandeTotal');
    @Elgin_Cancelamentos                         := GetProcAddress(hLib, 'Elgin_Cancelamentos');
    @Elgin_Descontos                             := GetProcAddress(hLib, 'Elgin_Descontos');
    @Elgin_NumeroOperacoesNaoFiscais             := GetProcAddress(hLib, 'Elgin_NumeroOperacoesNaoFiscais');
    @Elgin_NumeroCuponsCancelados                := GetProcAddress(hLib, 'Elgin_NumeroCuponsCancelados');
    @Elgin_NumeroIntervencoes                    := GetProcAddress(hLib, 'Elgin_NumeroIntervencoes');
    @Elgin_NumeroReducoes                        := GetProcAddress(hLib, 'Elgin_NumeroReducoes');
    @Elgin_NumeroSubstituicoesProprietario       := GetProcAddress(hLib, 'Elgin_NumeroSubstituicoesProprietario');
    @Elgin_UltimoItemVendido                     := GetProcAddress(hLib, 'Elgin_UltimoItemVendido');
    @Elgin_ClicheProprietario                    := GetProcAddress(hLib, 'Elgin_ClicheProprietario');
    @Elgin_NumeroCaixa                           := GetProcAddress(hLib, 'Elgin_NumeroCaixa');
    @Elgin_NumeroLoja                            := GetProcAddress(hLib, 'Elgin_NumeroLoja');
    @Elgin_SimboloMoeda                          := GetProcAddress(hLib, 'Elgin_SimboloMoeda');
    @Elgin_MinutosLigada                         := GetProcAddress(hLib, 'Elgin_MinutosLigada');
    @Elgin_MinutosImprimindo                     := GetProcAddress(hLib, 'Elgin_MinutosImprimindo');
    @Elgin_VerificaModoOperacao                  := GetProcAddress(hLib, 'Elgin_VerificaModoOperacao');
    @Elgin_VerificaEpromConectada                := GetProcAddress(hLib, 'Elgin_VerificaEpromConectada');
    @Elgin_FlagsFiscais                          := GetProcAddress(hLib, 'Elgin_FlagsFiscais');
    @Elgin_ValorPagoUltimoCupom                  := GetProcAddress(hLib, 'Elgin_ValorPagoUltimoCupom');
    @Elgin_DataHoraImpressora                    := GetProcAddress(hLib, 'Elgin_DataHoraImpressora');
    @Elgin_ContadoresTotalizadoresNaoFiscais     := GetProcAddress(hLib, 'Elgin_ContadoresTotalizadoresNaoFiscais');
    @Elgin_VerificaTotalizadoresNaoFiscais       := GetProcAddress(hLib, 'Elgin_VerificaTotalizadoresNaoFiscais');
    @Elgin_DataHoraReducao                       := GetProcAddress(hLib, 'Elgin_DataHoraReducao');
    @Elgin_DataMovimento                         := GetProcAddress(hLib, 'Elgin_DataMovimento');
    @Elgin_VerificaTruncamento                   := GetProcAddress(hLib, 'Elgin_VerificaTruncamento');
    @Elgin_Acrescimos                            := GetProcAddress(hLib, 'Elgin_Acrescimos');
    @Elgin_ContadorBilhetePassagem               := GetProcAddress(hLib, 'Elgin_ContadorBilhetePassagem');
    @Elgin_VerificaRecebimentoNaoFiscal          := GetProcAddress(hLib, 'Elgin_VerificaRecebimentoNaoFiscal');
    @Elgin_VerificaDepartamentos                 := GetProcAddress(hLib, 'Elgin_VerificaDepartamentos');
    @Elgin_VerificaTipoImpressora                := GetProcAddress(hLib, 'Elgin_VerificaTipoImpressora');
    @Elgin_VerificaTotalizadoresParciais         := GetProcAddress(hLib, 'Elgin_VerificaTotalizadoresParciais');
    @Elgin_RetornoAliquotas                      := GetProcAddress(hLib, 'Elgin_RetornoAliquotas');
    @Elgin_DadosUltimaReducao                    := GetProcAddress(hLib, 'Elgin_DadosUltimaReducao');
    @Elgin_MonitoramentoPapel                    := GetProcAddress(hLib, 'Elgin_MonitoramentoPapel');
    @Elgin_VerificaIndiceAliquotasIss            := GetProcAddress(hLib, 'Elgin_VerificaIndiceAliquotasIss');
    @Elgin_ValorFormaPagamento                   := GetProcAddress(hLib, 'Elgin_ValorFormaPagamento');
    @Elgin_Autenticacao                          := GetProcAddress(hLib, 'Elgin_Autenticacao');
    @Elgin_ProgramaCaracterAutenticacao          := GetProcAddress(hLib, 'Elgin_ProgramaCaracterAutenticacao');
    @Elgin_AcionaGaveta                          := GetProcAddress(hLib, 'Elgin_AcionaGaveta');
    @Elgin_VerificaEstadoGaveta                  := GetProcAddress(hLib, 'Elgin_VerificaEstadoGaveta');
    @Elgin_ProgramaMoedaSingular                 := GetProcAddress(hLib, 'Elgin_ProgramaMoedaSingular');
    @Elgin_ProgramaMoedaPlural                   := GetProcAddress(hLib, 'Elgin_ProgramaMoedaPlural');
    @Elgin_CancelaImpressaoCheque                := GetProcAddress(hLib, 'Elgin_CancelaImpressaoCheque');
    @Elgin_VerificaStatusCheque                  := GetProcAddress(hLib, 'Elgin_VerificaStatusCheque');
    @Elgin_ImprimeCheque                         := GetProcAddress(hLib, 'Elgin_ImprimeCheque');
    @Elgin_AbrePortaSerial                       := GetProcAddress(hLib, 'Elgin_AbrePortaSerial');
    @Elgin_FechaPortaSerial                      := GetProcAddress(hLib, 'Elgin_FechaPortaSerial');

    {$IFDEF MSWINDOWS}
    @Elgin_VerificaAliquotasIss                  := GetProcAddress(hLib, 'Elgin_VerificaAliquotasIss');
    @Elgin_VerificaFormasPagamento               := GetProcAddress(hLib, 'Elgin_VerificaFormasPagamento');
    @Elgin_VerificaEstadoImpressora              := GetProcAddress(hLib, 'Elgin_VerificaEstadoImpressora');
    @Elgin_ForcaImpactoAgulhas                   := GetProcAddress(hLib, 'Elgin_ForcaImpactoAgulhas');
    @Elgin_EfetuaFormaPagamentoDescricaoForma    := GetProcAddress(hLib, 'Elgin_EfetuaFormaPagamentoDescricaoForma');
    @Elgin_EstornoFormasPagamento                := GetProcAddress(hLib, 'Elgin_EstornoFormasPagamento');
    @Elgin_ValorTotalizadorNaoFiscal             := GetProcAddress(hLib, 'Elgin_ValorTotalizadorNaoFiscal');
    @Elgin_AbreCupomRestaurante                  := GetProcAddress(hLib, 'Elgin_FIR_AbreCupomRestaurante');
    @Elgin_RegistraVenda                         := GetProcAddress(hLib, 'Elgin_FIR_RegistraVenda');
    @Elgin_CancelaVenda                          := GetProcAddress(hLib, 'Elgin_FIR_CancelaVenda');
    @Elgin_ConferenciaMesa                       := GetProcAddress(hLib, 'Elgin_FIR_ConferenciaMesa');
    @Elgin_AbreConferenciaMesa                   := GetProcAddress(hLib, 'Elgin_FIR_AbreConferenciaMesa');
    @Elgin_FechaConferenciaMesa                  := GetProcAddress(hLib, 'Elgin_FIR_FechaConferenciaMesa');
    @Elgin_TransferenciaMesa                     := GetProcAddress(hLib, 'Elgin_FIR_TransferenciaMesa');
    @Elgin_ContaDividida                         := GetProcAddress(hLib, 'Elgin_FIR_ContaDividida');
    @Elgin_FechaCupomContaDividida               := GetProcAddress(hLib, 'Elgin_FIR_FechaCupomContaDividida');
    @Elgin_TransferenciaItem                     := GetProcAddress(hLib, 'Elgin_FIR_TransferenciaItem');
    @Elgin_RelatorioMesasAbertas                 := GetProcAddress(hLib, 'Elgin_FIR_RelatorioMesasAbertas');
    @Elgin_ImprimeCardapio                       := GetProcAddress(hLib, 'Elgin_FIR_ImprimeCardapio');
    @Elgin_RelatorioMesasAbertasSerial           := GetProcAddress(hLib, 'Elgin_FIR_RelatorioMesasAbertasSerial');
    @Elgin_CardapioPelaSerial                    := GetProcAddress(hLib, 'Elgin_FIR_CardapioPelaSerial');
    @Elgin_RegistroVendaSerial                   := GetProcAddress(hLib, 'Elgin_FIR_RegistroVendaSerial');
    @Elgin_VerificaMemoriaLivre                  := GetProcAddress(hLib, 'Elgin_FIR_VerificaMemoriaLivre');
    @Elgin_FechaCupomRestaurante                 := GetProcAddress(hLib, 'Elgin_FIR_FechaCupomRestaurante');
    @Elgin_FechaCupomResumidoRestaurante         := GetProcAddress(hLib, 'Elgin_FIR_FechaCupomResumidoRestaurante');
    @Elgin_AbreBilhetePassagem                   := GetProcAddress(hLib, 'Elgin_AbreBilhetePassagem');
    @Elgin_IncluiCidadeFavorecido                := GetProcAddress(hLib, 'Elgin_IncluiCidadeFavorecido');
    @Elgin_ImprimeCopiaCheque                    := GetProcAddress(hLib, 'Elgin_ImprimeCopiaCheque');
    @Elgin_Status                                := GetProcAddress(hLib, 'Elgin_Status');
    @Elgin_VendaCartao                           := GetProcAddress(hLib, 'Elgin_VendaCartao');
    @Elgin_ConfirmaVenda                         := GetProcAddress(hLib, 'Elgin_ConfirmaVenda');
    @Elgin_NaoConfirmaVendaImpressao             := GetProcAddress(hLib, 'Elgin_NaoConfirmaVendaImpressao');
    @Elgin_CancelaVendaCartao                    := GetProcAddress(hLib, 'Elgin_CancelaVendaCartao');
    @Elgin_ImprimeTEF                            := GetProcAddress(hLib, 'Elgin_ImprimeTEF');
    @Elgin_ImprimeRelatorio                      := GetProcAddress(hLib, 'Elgin_ImprimeRelatorio');
    @Elgin_ADM                                   := GetProcAddress(hLib, 'Elgin_ADM');
    @Elgin_VendaCompleta                         := GetProcAddress(hLib, 'Elgin_VendaCompleta');
    @Elgin_ConfiguraDiretorioTEF                 := GetProcAddress(hLib, 'Elgin_ConfiguraDiretorioTEF');
    @Elgin_VendaCheque                           := GetProcAddress(hLib, 'Elgin_VendaCheque');
    @Elgin_RetornoImpressora                     := GetProcAddress(hLib, 'Elgin_RetornoImpressora');
    @Elgin_MapaResumo                            := GetProcAddress(hLib, 'Elgin_MapaResumo');
    @Elgin_AberturaDoDia                         := GetProcAddress(hLib, 'Elgin_AberturaDoDia');
    @Elgin_FechamentoDoDia                       := GetProcAddress(hLib, 'Elgin_FechamentoDoDia');
    @Elgin_ImprimeConfiguracoesImpressora        := GetProcAddress(hLib, 'Elgin_ImprimeConfiguracoesImpressora');
    @Elgin_ImprimeDepartamentos                  := GetProcAddress(hLib, 'Elgin_ImprimeDepartamentos');
    @Elgin_RelatorioTipo60Analitico              := GetProcAddress(hLib, 'Elgin_RelatorioTipo60Analitico');
    @Elgin_RelatorioTipo60Mestre                 := GetProcAddress(hLib, 'Elgin_RelatorioTipo60Mestre');
    @Elgin_VerificaImpressoraLigada              := GetProcAddress(hLib, 'Elgin_VerificaImpressoraLigada');
    {$ENDIF}

    @Elgin_VerificaFormaPagamento                := GetProcAddress(hLib, 'Elgin_VerificaFormaPagamento');
    @Elgin_ProgramaFormasPagamento               := GetProcAddress(hLib, 'Elgin_ProgramaFormasPagamento');
    @Elgin_ContadorSequencial                    := GetProcAddress(hLib, 'Elgin_ContadorSequencial');
    @Elgin_ContadoresTotalizadoresNaoSujeitos    := GetProcAddress(hLib, 'Elgin_ContadoresTotalizadoresNaoSujeitos');
    @Elgin_ImprimeChequeBR400                    := GetProcAddress(hLib, 'Elgin_ImprimeChequeBR400');
    @Elgin_LeituraCheque                         := GetProcAddress(hLib, 'Elgin_LeituraCheque');
    @Elgin_FechaRelatorioXouZ                    := GetProcAddress(hLib, 'Elgin_FechaRelatorioXouZ');
{    @Elgin_ImpressaoCarne                        := GetProcAddress(hLib, 'Elgin_ImpressaoCarne');     }
    @Elgin_CodigoBarrasEAN13MFD                  := GetProcAddress(hLib, 'Elgin_CodigoBarrasEAN13MFD');
  end else
    raise Exception.Create(Format(LibNotFound,[Lib]));
end;

initialization

finalization
  if (hLib <> 0) and LibLoaded then
    FreeLibrary(hLib);

end.

