{********************************************************}
{                                                        }
{                                                        }
{         Interface com a Biblioteca BEMAFI32            }
{          das impressoras fiscais Bematech              }
{                                                        }
{                   Ver 1.0 12/03/2003                   }
{********************************************************}

unit bbecf_bematech;

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
  LIB_NAME = 'BEMAFI32.dll';
  INI_FILE = 'BEMAFI32.ini';
  INI_PATH = 'c:\windows\system\';
{$ELSE}
  LIB_NAME = 'tececfbematech.so';
//  INI_FILE = 'BEMAFI.ini';
  INI_PATH = '/usr/lib/';

{$ENDIF}

   {************* Definicao de Tipos de Funçoes da API **************}

type

{~~~~~~~~~~~~~~~~~~~~~~~~
 Funções de Inicialização
~~~~~~~~~~~~~~~~~~~~~~~~~~}

    TBema_AlteraSimboloMoeda = function(SimboloMoeda: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_ProgramaAliquota = function(Aliquota: String; ICMS_ISS: Integer): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_ProgramaHorarioVerao = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_NomeiaTotalizadorNaoSujeitoIcms = function(Indice: Integer; Totalizador: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_ProgramaArredondamento = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_ProgramaTruncamento = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_NomeiaDepartamento = function(Indice: Integer; Departamento: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_LinhasEntreCupons = function(Linhas: Integer): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_EspacoEntreLinhas = function(Dots: Integer): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_ResetaImpressora = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFDEF MSWINDOWS}
    TBema_ForcaImpactoAgulhas = function(ForcaImpacto: Integer): Integer; stdcall;
    {$ENDIF}

{~~~~~~~~~~~~~~~~~~~~~~~~
 Funções do Cupom Fiscal
~~~~~~~~~~~~~~~~~~~~~~~~~~}

    TBema_AbreCupom = function(CGC_CPF: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TBema_VendeItem = function(Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String;
                               Quantidade: String; CasasDecimais: Integer; ValorUnitario: String;
                               TipoDesconto: String; Desconto: String): Integer; stdcall
    {$ELSE}
    TBema_VendeItem = function(Codigo, Descricao, Aliquota, Quantidade,
                               Valor, Desconto: String): Integer; cdecl
    {$ENDIF};

    TBema_VendeItemDepartamento = function(Codigo, Descricao, Aliquota, ValorUnitario,
                                           Quantidade, Acrescimo, Desconto, IndiceDepartamento,
                                           UnidadeMedida: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_CancelaItemAnterior = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_CancelaItemGenerico = function(NumeroItem: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_CancelaCupom = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TBema_FechaCupomResumido = function(FormaPagamento, Mensagem: String): Integer; stdcall
    {$ELSE}
    TBema_FechaCupomResumido = function(FormaPagamento, {Valor, }Mensagem: String): Integer; cdecl
    {$ENDIF};

    {$IFNDEF LINUX}
    TBema_FechaCupom = function(FormaPagamento, AcrescimoDesconto, TipoAcrescimoDesconto,
                                ValorAcrescimoDesconto, ValorPago,
                                Mensagem: String): Integer; stdcall
    {$ELSE}
    TBema_FechaCupom = function(AcrescimoDesconto, ValorAcrescimoDesconto :String;
                                QtdFormasPagto: Integer;
                                FormasPagto, Valores, Mensagem: String): Integer; cdecl
    {$ENDIF};

    {$IFNDEF LINUX}
    TBema_IniciaFechamentoCupom = function(AcrescimoDesconto, TipoAcrescimoDesconto,
                                           ValorAcrescimoDesconto: String): Integer; stdcall
    {$ELSE}
    TBema_IniciaFechamentoCupom = function(AcrescimoDesconto, TipoAcrescimoDesconto,
                                           ValorAcrescimoDesconto: String): Integer; cdecl
    {$ENDIF};

    TBema_VerificaFormaPagamento = function(FormaPagto: String; var Valor: String): Integer; cdecl;

    {$IFNDEF LINUX}
    TBema_EfetuaFormaPagamento = function(FormaPagamento,
                                          ValorFormaPagamento: String): Integer; stdcall
    {$ELSE}
    TBema_EfetuaFormaPagamento = function(FormaPagamento, ValorFormaPagamento,
                                          Descricao: String): Integer; cdecl
    {$ENDIF};

    TBema_ProgramaFormasPagamento = function(FormasPagto: String; var Indice: Integer): Integer cdecl;

    {$IFDEF MSWINDOWS}
    TBema_EfetuaFormaPagamentoDescricaoForma = function(FormaPagamento, ValorFormaPagamento,
                                                        DescricaoFormaPagto: String ): Integer; stdcall;
    {$ENDIF}

    TBema_TerminaFechamentoCupom = function(Mensagem: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFDEF MSWINDOWS}
    TBema_EstornoFormasPagamento = function(FormaOrigem, FormaDestino,
                                            Valor: String): Integer; stdcall;
    {$ENDIF}

    TBema_UsaUnidadeMedida = function(UnidadeMedida: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_AumentaDescricaoItem = function(Descricao: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};


{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções dos Relatórios Fiscais
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

    TBema_LeituraX = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TBema_ReducaoZ = function(Data, Hora: String): Integer; stdcall
    {$ELSE}
    TBema_ReducaoZ = function: Integer; cdecl
    {$ENDIF};

    TBema_RelatorioGerencial = function(Texto: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_FechaRelatorioGerencial = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_LeituraMemoriaFiscalData = function(DataInicial, DataFinal: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_LeituraMemoriaFiscalSerialDataMFD = function(DataInicial, DataFinal, FlagLeitura: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_LeituraMemoriaFiscalReducao = function(ReducaoInicial, ReducaoFinal: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};


{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções das Operações Não Fiscais
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

    TBema_RecebimentoNaoFiscal = function(IndiceTotalizador: String; Valor: String;
                                          FormaPagamento: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_AbreComprovanteNaoFiscalVinculado = function(FormaPagamento, Valor,
                                                       NumeroCupom: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_UsaComprovanteNaoFiscalVinculado = function(Texto: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_FechaComprovanteNaoFiscalVinculado = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_Sangria = function(Valor: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TBema_Suprimento = function(Valor, FormaPagamento: String): Integer; stdcall
    {$ELSE}
    TBema_Suprimento = function(Valor: String): Integer; cdecl
    {$ENDIF};

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções de Informações da Impressora
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

    {$IFNDEF LINUX}
     TBema_NumeroSerie = function(NumeroSerie: String): Integer; stdcall
    {$ELSE}
     TBema_NumeroSerie = function(var NumeroSerie: String): Integer; cdecl
    {$ENDIF};

    TBema_SubTotal = function(SubTotal: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TBema_NumeroCupom = function(NumeroCupom: String): Integer; stdcall
    {$ELSE}
    TBema_NumeroCupom = function(var NumeroCupom: String): Integer; cdecl
    {$ENDIF};

    TBema_LeituraXSerial = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_VersaoFirmware = function(VersaoFirmware: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TBema_CGC_IE = function(CGC, IE: String): Integer; stdcall
    {$ELSE}
    TBema_CGC_IE = function(var CGCIE: String): Integer; cdecl
    {$ENDIF};

    TBema_GrandeTotal = function(GrandeTotal: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_Cancelamentos = function(ValorCancelamentos: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
     TBema_Descontos = function(ValorDescontos: String): Integer; stdcall
    {$ELSE}
     TBema_Descontos = function(var ValorDescontos: String): Integer; cdecl
    {$ENDIF};

    TBema_ContadorSequencial = function(Cupom: String): Integer; cdecl;

    TBema_NumeroOperacoesNaoFiscais = function(NumeroOperacoes: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_NumeroCuponsCancelados = function(NumeroCancelamentos: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
     TBema_NumeroIntervencoes = function(NumeroIntervencoes: String): Integer; stdcall
    {$ELSE}
     TBema_NumeroIntervencoes = function(var NumeroIntervencoes: String): Integer; cdecl
    {$ENDIF};

    TBema_NumeroReducoes = function(NumeroReducoes: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_NumeroSubstituicoesProprietario = function(NumeroSubstituicoes: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_UltimoItemVendido = function(NumeroItem: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_ClicheProprietario = function(Cliche: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TBema_NumeroCaixa = function(NumeroCaixa: String): Integer; stdcall
    {$ELSE}
    TBema_NumeroCaixa = function(var NumeroCaixa: String): Integer; cdecl
    {$ENDIF};

    TBema_NumeroLoja = function(NumeroLoja: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_SimboloMoeda = function(SimboloMoeda: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_FlagsFiscais = function(var Flag: Integer): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_MinutosLigada = function(Minutos: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_MinutosImprimindo = function(Minutos: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_VerificaModoOperacao = function(Modo: string): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_VerificaEpromConectada = function(Flag: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_ValorPagoUltimoCupom = function(ValorCupom: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TBema_DataHoraImpressora = function(Data, Hora: String): Integer; stdcall
    {$ELSE}
    TBema_DataHoraImpressora = function(var DataHora: String): Integer; cdecl
    {$ENDIF};

    TBema_ContadoresTotalizadoresNaoFiscais = function(var Contadores: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_VerificaTotalizadoresNaoFiscais = function(var Totalizadores: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TBema_DataHoraReducao = function(Data, Hora: String): Integer; stdcall
    {$ELSE}
    TBema_DataHoraReducao = function(var DataHora: String): Integer; cdecl
    {$ENDIF};

    TBema_DataMovimento = function(Data: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_VerificaTruncamento = function(Flag: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TBema_Acrescimos = function(ValorAcrescimos: String): Integer; stdcall
    {$ELSE}
    TBema_Acrescimos = function(var ValorAcrescimos: String): Integer; cdecl
    {$ENDIF};

    TBema_ContadorBilhetePassagem = function(ContadorPassagem: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFDEF MSWINDOWS}
    TBema_VerificaAliquotasIss = function(Flag: String): Integer; stdcall;
    TBema_VerificaFormasPagamento = function(Formas: String): Integer; stdcall;
    {$ENDIF}

    {$IFNDEF LINUX}
    TBema_VerificaRecebimentoNaoFiscal = function( Recebimentos: String): Integer; stdcall;
    {$ELSE}
    TBema_VerificaRecebimentoNaoFiscal = function(var Recebimentos: String): Integer; cdecl;
    {$ENDIF}

    TBema_VerificaDepartamentos = function(Departamentos: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_VerificaTipoImpressora = function(var TipoImpressora: Integer): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TBema_VerificaTotalizadoresParciais = function(Totalizadores: String): Integer; stdcall
    {$ELSE}
    TBema_VerificaTotalizadoresParciais = function(var Totalizadores: String): Integer; cdecl
    {$ENDIF};

    {$IFNDEF LINUX}
    TBema_RetornoAliquotas = function(Aliquotas: String): Integer; stdcall
    {$ELSE}
    TBema_RetornoAliquotas = function(var Aliquotas: String): Integer; cdecl
    {$ENDIF};

    {$IFNDEF LINUX}
    TBema_VerificaEstadoImpressora = function(var ACK, ST1, ST2: Integer): Integer; stdcall
    {$ELSE}
    TBema_EstadoImpressora = function: Integer; cdecl
    {$ENDIF};

    TBema_DadosUltimaReducao = function(DadosReducao: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_MonitoramentoPapel = function(var Linhas: Integer): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_VerificaIndiceAliquotasIss = function(Flag: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_ValorFormaPagamento = function(FormaPagamento,  Valor: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_ContadoresTotalizadoresNaoSujeitos = function(var Valor: String): Integer; cdecl;

    {$IFDEF MSWINDOWS}
    TBema_ValorTotalizadorNaoFiscal = function(Totalizador, Valor: String): Integer; stdcall;
    {$ENDIF}

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções de Autenticação e Gaveta de Dinheiro
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

    TBema_Autenticacao = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_ProgramaCaracterAutenticacao = function(Caracter: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_AcionaGaveta = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_VerificaEstadoGaveta = function(var EstadoGaveta: Integer): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções para a Impressora Restaurante
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

    {$IFDEF MSWINDOWS}
    TBema_AbreCupomRestaurante = function(Mesa, CGC_CPF: String): Integer; stdcall;

    TBema_RegistraVenda = function(Mesa, Codigo, Descricao, Aliquota, Quantidade,
                                   ValorUnitario, FlagAcrescimoDesconto,
                                   ValorAcrescimoDesconto: String): Integer; stdcall;

    TBema_CancelaVenda = function(Mesa, Codigo, Descricao, Aliquota, Quantidade,
                                  ValorUnitario, FlagAcrescimoDesconto,
                                  ValorAcrescimoDesconto: String): Integer; stdcall;

    TBema_ConferenciaMesa = function(Mesa, FlagAcrescimoDesconto, TipoAcrescimoDesconto,
                                     ValorAcrescimoDesconto: String): Integer; stdcall;

    TBema_AbreConferenciaMesa = function(Mesa: String): Integer; stdcall;

    TBema_FechaConferenciaMesa = function(FlagAcrescimoDesconto, TipoAcrescimoDesconto,
                                          ValorAcrescimoDesconto: String): Integer; stdcall;

    TBema_TransferenciaMesa = function(MesaOrigem, MesaDestino: String): Integer; stdcall;

    TBema_ContaDividida = function(NumeroCupons, ValorPago, CGC_CPF: String): Integer; stdcall;

    TBema_FechaCupomContaDividida = function(NumeroCupons, FlagAcrescimoDesconto,
                                             TipoAcrescimoDesconto, ValorAcrescimoDesconto,
                                             FormasPagamento, ValorFormasPagamento,
                                             ValorPagoCliente, CGC_CPF: String): Integer; stdcall;

    TBema_TransferenciaItem = function(MesaOrigem, Codigo, Descricao, Aliquota, Quantidade,
                                       ValorUnitario, FlagAcrescimoDesconto,
                                       ValorAcrescimoDesconto, MesaDestino: String) : Integer; stdcall;

    TBema_RelatorioMesasAbertas = function(TipoRelatorio: Integer): Integer; stdcall;

    TBema_ImprimeCardapio = function: Integer; stdcall;

    TBema_RelatorioMesasAbertasSerial = function: Integer; stdcall;

    TBema_CardapioPelaSerial = function: Integer; stdcall;

    TBema_RegistroVendaSerial = function(Mesa: String): Integer; stdcall;

    TBema_VerificaMemoriaLivre = function(Bytes: String): Integer; stdcall;

    TBema_FechaCupomRestaurante = function(FormaPagamento, FlagAcrescimoDesconto,
                                           TipoAcrescimoDesconto, ValorAcrescimoDesconto,
                                           ValorFormaPagto, Mensagem: String): Integer; stdcall;

    TBema_FechaCupomResumidoRestaurante = function(FormaPagamento, Valor,
                                                   Mensagem: String): Integer; stdcall;
    {$ENDIF}


{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Função para a Impressora Bilhete de Passagem
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

    {$IFDEF MSWINDOWS}
    TBema_AbreBilhetePassagem = function (ImprimeValorFinal, ImprimeEnfatizado, Embarque,
                                          Destino, Linha, Prefixo, Agente, Agencia, Data,
                                          Hora,  Poltrona, Plataforma: String ): Integer; stdcall;
    {$ENDIF}


{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções de Impressão de Cheques
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

    TBema_ProgramaMoedaSingular = function(MoedaSingular: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_ProgramaMoedaPlural = function(MoedaPlural: String): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_CancelaImpressaoCheque = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    TBema_VerificaStatusCheque = function(var StatusCheque: Integer): Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFNDEF LINUX}
    TBema_ImprimeCheque = function(Banco, Valor, Favorecido, Cidade, Data,
                                   Mensagem: String): Integer; stdcall
    {$ELSE}
    TBema_ImprimeCheque = function(Banco, Valor, Favorecido, Localidade,
                                   Dia, Mes, Ano, Mensagem: String): Integer; cdecl
    {$ENDIF};

    TBema_ImprimeChequeBR400 = function(ModoImpressao, Banco, Valor, Favorecido, Localidade,
                                        Dia, Mes, Ano, Mensagem: String): Integer; cdecl;

    TBema_LeituraCheque = function(DadosCheque: String): Integer; cdecl;

    {$IFDEF MSWINDOWS}
    TBema_IncluiCidadeFavorecido = function(Cidade: String; Favorecido: String): Integer; stdcall;

    TBema_ImprimeCopiaCheque = function: Integer; stdcall;
    {$ENDIF}

{~~~~~~~~~~~~~~~~~~
 Funções para o TEF
~~~~~~~~~~~~~~~~~~~}

    {$IFDEF MSWINDOWS}
    TBema_Status = function(Identificacao: String): Integer; stdcall;

    TBema_VendaCartao = function(Identificacao, ValorCompra: String): Integer;  stdcall;

    TBema_ConfirmaVenda = function(Identificacao, ValorCompra,
                                   Header: String): Integer; stdcall;

    TBema_NaoConfirmaVendaImpressao = function(Identificacao,
                                               ValorCompra: String): Integer; stdcall;

    TBema_CancelaVendaCartao = function(Identificacao, ValorCompra, Nsu, NumeroCupom, Hora,
                                        Data, Rede: String): Integer; stdcall;

    TBema_ImprimeTEF = function(Identificacao, FormaPagamento,
                                ValorCompra: String): Integer; stdcall;

    TBema_ImprimeRelatorio = function: Integer; stdcall;

    TBema_ADM = function(Identificacao: String): Integer; stdcall;

    TBema_VendaCompleta = function(Identificacao, ValorCompra, FormaPagamento,
                                   Texto: String): Integer; stdcall;

    TBema_ConfiguraDiretorioTEF = function(PathReq, PathResp: String): Integer; stdcall;

    TBema_VendaCheque = function(Identificacao, ValorCompra: String): Integer; stdcall;
    {$ENDIF}

{~~~~~~~~~~~~~~~~
 Outras Funções
~~~~~~~~~~~~~~~~~}

    {$IFNDEF LINUX}
     TBema_AbrePortaSerial = function: Integer; stdcall
    {$ELSE}
     TBema_AbrePortaSerial = function(Porta:String): Integer; cdecl
    {$ENDIF};

    TBema_FechaPortaSerial = function: Integer;
    {$IFNDEF LINUX} stdcall {$ELSE} cdecl {$ENDIF};

    {$IFDEF MSWINDOWS}
    TBema_RetornoImpressora = function(var ACK, ST1, ST2: Integer): Integer; stdcall;

    TBema_MapaResumo = function: Integer; stdcall;

    TBema_AberturaDoDia = function(ValorCompra, FormaPagamento: String): Integer; stdcall;

    TBema_FechamentoDoDia = function: Integer; stdcall;

    TBema_ImprimeConfiguracoesImpressora = function: Integer; stdcall;

    TBema_ImprimeDepartamentos = function: Integer; stdcall;

    TBema_RelatorioTipo60Analitico = function: Integer; stdcall;

    TBema_RelatorioTipo60Mestre = function: Integer; stdcall;

    TBema_VerificaImpressoraLigada = function: Integer; stdcall;


    {$ENDIF}
    TBema_FechaRelatorioXouZ = function: Integer; StdCall;

{    TBema_ImpressaoCarne = function(Titulo, ValoresParcelas, Datas: String;
                                    QtdeParcelas: Integer;
                                    TextoLivre, NomeCliente, RG_CPF, NumeroCupom: String;
                                    NumeroVias, Assinatura: Integer): Integer; StdCall;}

    TBema_CodigoBarrasEAN13MFD = function(Codigo: String): Integer; StdCall;

    function BematechLoadLib: Boolean;

{**************** Variaveis para funçoes da API ******************}

var
    Bema_AlteraSimboloMoeda                     : TBema_AlteraSimboloMoeda;
    Bema_ProgramaAliquota                       : TBema_ProgramaAliquota;
    Bema_ProgramaHorarioVerao                   : TBema_ProgramaHorarioVerao;
    Bema_NomeiaDepartamento                     : TBema_NomeiaDepartamento;
    Bema_NomeiaTotalizadorNaoSujeitoIcms        : TBema_NomeiaTotalizadorNaoSujeitoIcms;
    Bema_ProgramaArredondamento                 : TBema_ProgramaArredondamento;
    Bema_ProgramaTruncamento                    : TBema_ProgramaTruncamento;
    Bema_LinhasEntreCupons                      : TBema_LinhasEntreCupons;
    Bema_EspacoEntreLinhas                      : TBema_EspacoEntreLinhas;
    Bema_AbreCupom                              : TBema_AbreCupom;
    Bema_VendeItem                              : TBema_VendeItem;
    Bema_VendeItemDepartamento                  : TBema_VendeItemDepartamento;
    Bema_CancelaItemAnterior                    : TBema_CancelaItemAnterior;
    Bema_CancelaItemGenerico                    : TBema_CancelaItemGenerico;
    Bema_CancelaCupom                           : TBema_CancelaCupom;
    Bema_FechaCupomResumido                     : TBema_FechaCupomResumido;
    Bema_FechaCupom                             : TBema_FechaCupom;
    Bema_ResetaImpressora                       : TBema_ResetaImpressora;
    Bema_IniciaFechamentoCupom                  : TBema_IniciaFechamentoCupom;
    Bema_EfetuaFormaPagamento                   : TBema_EfetuaFormaPagamento;
    Bema_TerminaFechamentoCupom                 : TBema_TerminaFechamentoCupom;
    Bema_UsaUnidadeMedida                       : TBema_UsaUnidadeMedida;
    Bema_AumentaDescricaoItem                   : TBema_AumentaDescricaoItem;
    Bema_LeituraX                               : TBema_LeituraX;
    Bema_ReducaoZ                               : TBema_ReducaoZ;
    Bema_RelatorioGerencial                     : TBema_RelatorioGerencial;
    Bema_FechaRelatorioGerencial                : TBema_FechaRelatorioGerencial;
    Bema_LeituraMemoriaFiscalData               : TBema_LeituraMemoriaFiscalData;
    Bema_LeituraMemoriaFiscalSerialDataMFD      : TBema_LeituraMemoriaFiscalSerialDataMFD;
    Bema_LeituraMemoriaFiscalReducao            : TBema_LeituraMemoriaFiscalReducao;
    Bema_RecebimentoNaoFiscal                   : TBema_RecebimentoNaoFiscal;
    Bema_AbreComprovanteNaoFiscalVinculado      : TBema_AbreComprovanteNaoFiscalVinculado;
    Bema_UsaComprovanteNaoFiscalVinculado       : TBema_UsaComprovanteNaoFiscalVinculado;
    Bema_FechaComprovanteNaoFiscalVinculado     : TBema_FechaComprovanteNaoFiscalVinculado;
    Bema_Sangria                                : TBema_Sangria;
    Bema_Suprimento                             : TBema_Suprimento;
    Bema_NumeroSerie                            : TBema_NumeroSerie;
    Bema_SubTotal                               : TBema_SubTotal;
    Bema_NumeroCupom                            : TBema_NumeroCupom;
    Bema_LeituraXSerial                         : TBema_LeituraXSerial;
    Bema_VersaoFirmware                         : TBema_VersaoFirmware;
    Bema_CGC_IE                                 : TBema_CGC_IE;
    Bema_GrandeTotal                            : TBema_GrandeTotal;
    Bema_Cancelamentos                          : TBema_Cancelamentos;
    Bema_Descontos                              : TBema_Descontos;
    Bema_NumeroOperacoesNaoFiscais              : TBema_NumeroOperacoesNaoFiscais;
    Bema_NumeroCuponsCancelados                 : TBema_NumeroCuponsCancelados;
    Bema_NumeroIntervencoes                     : TBema_NumeroIntervencoes;
    Bema_NumeroReducoes                         : TBema_NumeroReducoes;
    Bema_NumeroSubstituicoesProprietario        : TBema_NumeroSubstituicoesProprietario;
    Bema_UltimoItemVendido                      : TBema_UltimoItemVendido;
    Bema_ClicheProprietario                     : TBema_ClicheProprietario;
    Bema_NumeroCaixa                            : TBema_NumeroCaixa;
    Bema_NumeroLoja                             : TBema_NumeroLoja;
    Bema_SimboloMoeda                           : TBema_SimboloMoeda;
    Bema_MinutosLigada                          : TBema_MinutosLigada;
    Bema_MinutosImprimindo                      : TBema_MinutosImprimindo;
    Bema_VerificaModoOperacao                   : TBema_VerificaModoOperacao;
    Bema_VerificaEpromConectada                 : TBema_VerificaEpromConectada;
    Bema_FlagsFiscais                           : TBema_FlagsFiscais;
    Bema_ValorPagoUltimoCupom                   : TBema_ValorPagoUltimoCupom;
    Bema_DataHoraImpressora                     : TBema_DataHoraImpressora;
    Bema_ContadoresTotalizadoresNaoFiscais      : TBema_ContadoresTotalizadoresNaoFiscais;
    Bema_VerificaTotalizadoresNaoFiscais        : TBema_VerificaTotalizadoresNaoFiscais;
    Bema_DataHoraReducao                        : TBema_DataHoraReducao;
    Bema_DataMovimento                          : TBema_DataMovimento;
    Bema_VerificaTruncamento                    : TBema_VerificaTruncamento;
    Bema_Acrescimos                             : TBema_Acrescimos;
    Bema_ContadorBilhetePassagem                : TBema_ContadorBilhetePassagem;
    Bema_VerificaRecebimentoNaoFiscal           : TBema_VerificaRecebimentoNaoFiscal;
    Bema_VerificaDepartamentos                  : TBema_VerificaDepartamentos;
    Bema_VerificaTipoImpressora                 : TBema_VerificaTipoImpressora;
    Bema_VerificaTotalizadoresParciais          : TBema_VerificaTotalizadoresParciais;
    Bema_RetornoAliquotas                       : TBema_RetornoAliquotas;
    Bema_DadosUltimaReducao                     : TBema_DadosUltimaReducao;
    Bema_MonitoramentoPapel                     : TBema_MonitoramentoPapel;
    Bema_VerificaIndiceAliquotasIss             : TBema_VerificaIndiceAliquotasIss;
    Bema_ValorFormaPagamento                    : TBema_ValorFormaPagamento;
    Bema_Autenticacao                           : TBema_Autenticacao;
    Bema_ProgramaCaracterAutenticacao           : TBema_ProgramaCaracterAutenticacao;
    Bema_AcionaGaveta                           : TBema_AcionaGaveta;
    Bema_VerificaEstadoGaveta                   : TBema_VerificaEstadoGaveta;
    Bema_ProgramaMoedaSingular                  : TBema_ProgramaMoedaSingular;
    Bema_ProgramaMoedaPlural                    : TBema_ProgramaMoedaPlural;
    Bema_CancelaImpressaoCheque                 : TBema_CancelaImpressaoCheque;
    Bema_VerificaStatusCheque                   : TBema_VerificaStatusCheque;
    Bema_ImprimeCheque                          : TBema_ImprimeCheque;
    Bema_AbrePortaSerial                        : TBema_AbrePortaSerial;
    Bema_FechaPortaSerial                       : TBema_FechaPortaSerial;

    {$IFDEF MSWINDOWS}
    Bema_VerificaAliquotasIss                   : TBema_VerificaAliquotasIss;
    Bema_VerificaFormasPagamento                : TBema_VerificaFormasPagamento;
    Bema_VerificaEstadoImpressora               : TBema_VerificaEstadoImpressora;
    Bema_ForcaImpactoAgulhas                    : TBema_ForcaImpactoAgulhas;
    Bema_EfetuaFormaPagamentoDescricaoForma     : TBema_EfetuaFormaPagamentoDescricaoForma;
    Bema_EstornoFormasPagamento                 : TBema_EstornoFormasPagamento;
    Bema_ValorTotalizadorNaoFiscal              : TBema_ValorTotalizadorNaoFiscal;
    Bema_AbreCupomRestaurante                   : TBema_AbreCupomRestaurante;
    Bema_RegistraVenda                          : TBema_RegistraVenda;
    Bema_CancelaVenda                           : TBema_CancelaVenda;
    Bema_ConferenciaMesa                        : TBema_ConferenciaMesa;
    Bema_AbreConferenciaMesa                    : TBema_AbreConferenciaMesa;
    Bema_FechaConferenciaMesa                   : TBema_FechaConferenciaMesa;
    Bema_TransferenciaMesa                      : TBema_TransferenciaMesa;
    Bema_ContaDividida                          : TBema_ContaDividida;
    Bema_FechaCupomContaDividida                : TBema_FechaCupomContaDividida;
    Bema_TransferenciaItem                      : TBema_TransferenciaItem;
    Bema_RelatorioMesasAbertas                  : TBema_RelatorioMesasAbertas;
    Bema_ImprimeCardapio                        : TBema_ImprimeCardapio;
    Bema_RelatorioMesasAbertasSerial            : TBema_RelatorioMesasAbertasSerial;
    Bema_CardapioPelaSerial                     : TBema_CardapioPelaSerial;
    Bema_RegistroVendaSerial                    : TBema_RegistroVendaSerial;
    Bema_VerificaMemoriaLivre                   : TBema_VerificaMemoriaLivre;
    Bema_FechaCupomRestaurante                  : TBema_FechaCupomRestaurante;
    Bema_FechaCupomResumidoRestaurante          : TBema_FechaCupomResumidoRestaurante;
    Bema_AbreBilhetePassagem                    : TBema_AbreBilhetePassagem;
    Bema_IncluiCidadeFavorecido                 : TBema_IncluiCidadeFavorecido;
    Bema_ImprimeCopiaCheque                     : TBema_ImprimeCopiaCheque;
    Bema_Status                                 : TBema_Status;
    Bema_VendaCartao                            : TBema_VendaCartao;
    Bema_ConfirmaVenda                          : TBema_ConfirmaVenda;
    Bema_NaoConfirmaVendaImpressao              : TBema_NaoConfirmaVendaImpressao;
    Bema_CancelaVendaCartao                     : TBema_CancelaVendaCartao;
    Bema_ImprimeTEF                             : TBema_ImprimeTEF;
    Bema_ImprimeRelatorio                       : TBema_ImprimeRelatorio;
    Bema_ADM                                    : TBema_ADM;
    Bema_VendaCompleta                          : TBema_VendaCompleta;
    Bema_ConfiguraDiretorioTEF                  : TBema_ConfiguraDiretorioTEF;
    Bema_VendaCheque                            : TBema_VendaCheque;
    Bema_RetornoImpressora                      : TBema_RetornoImpressora;
    Bema_MapaResumo                             : TBema_MapaResumo;
    Bema_AberturaDoDia                          : TBema_AberturaDoDia;
    Bema_FechamentoDoDia                        : TBema_FechamentoDoDia;
    Bema_ImprimeConfiguracoesImpressora         : TBema_ImprimeConfiguracoesImpressora;
    Bema_ImprimeDepartamentos                   : TBema_ImprimeDepartamentos;
    Bema_RelatorioTipo60Analitico               : TBema_RelatorioTipo60Analitico;
    Bema_RelatorioTipo60Mestre                  : TBema_RelatorioTipo60Mestre;
    Bema_VerificaImpressoraLigada               : TBema_VerificaImpressoraLigada;
    {$ENDIF}

    Bema_VerificaFormaPagamento                 : TBema_VerificaFormaPagamento;
    Bema_ProgramaFormasPagamento                : TBema_ProgramaFormasPagamento;
    Bema_ContadorSequencial                     : TBema_ContadorSequencial;
    Bema_ContadoresTotalizadoresNaoSujeitos     : TBema_ContadoresTotalizadoresNaoSujeitos;
    Bema_ImprimeChequeBR400                     : TBema_ImprimeChequeBR400;
    Bema_LeituraCheque                          : TBema_LeituraCheque;
    Bema_FechaRelatorioXouZ                     : TBema_FechaRelatorioXouZ;
{    Bema_ImpressaoCarne                         : TBema_ImpressaoCarne;     }
    Bema_CodigoBarrasEAN13MFD                   : TBema_CodigoBarrasEAN13MFD;

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

function BematechLoadLib: Boolean;
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
    @Bema_AlteraSimboloMoeda                    := GetProcAddress(hLib, 'Bematech_FI_AlteraSimboloMoeda');
    @Bema_ProgramaAliquota                      := GetProcAddress(hLib, 'Bematech_FI_ProgramaAliquota');
    @Bema_ProgramaHorarioVerao                  := GetProcAddress(hLib, 'Bematech_FI_ProgramaHorarioVerao');
    @Bema_NomeiaDepartamento                    := GetProcAddress(hLib, 'Bematech_FI_NomeiaDepartamento');
    @Bema_NomeiaTotalizadorNaoSujeitoIcms       := GetProcAddress(hLib, 'Bematech_FI_NomeiaTotalizadorNaoSujeitoIcms');
    @Bema_ProgramaArredondamento                := GetProcAddress(hLib, 'Bematech_FI_ProgramaArredondamento');
    @Bema_ProgramaTruncamento                   := GetProcAddress(hLib, 'Bematech_FI_ProgramaTruncamento');
    @Bema_LinhasEntreCupons                     := GetProcAddress(hLib, 'Bematech_FI_LinhasEntreCupons');
    @Bema_EspacoEntreLinhas                     := GetProcAddress(hLib, 'Bematech_FI_EspacoEntreLinhas');
    @Bema_AbreCupom                             := GetProcAddress(hLib, 'Bematech_FI_AbreCupom');
    @Bema_VendeItem                             := GetProcAddress(hLib, 'Bematech_FI_VendeItem');
    @Bema_VendeItemDepartamento                 := GetProcAddress(hLib, 'Bematech_FI_VendeItemDepartamento');
    @Bema_CancelaItemAnterior                   := GetProcAddress(hLib, 'Bematech_FI_CancelaItemAnterior');
    @Bema_CancelaItemGenerico                   := GetProcAddress(hLib, 'Bematech_FI_CancelaItemGenerico');
    @Bema_CancelaCupom                          := GetProcAddress(hLib, 'Bematech_FI_CancelaCupom');
    @Bema_FechaCupomResumido                    := GetProcAddress(hLib, 'Bematech_FI_FechaCupomResumido');
    @Bema_FechaCupom                            := GetProcAddress(hLib, 'Bematech_FI_FechaCupom');
    @Bema_ResetaImpressora                      := GetProcAddress(hLib, 'Bematech_FI_ResetaImpressora');
    @Bema_IniciaFechamentoCupom                 := GetProcAddress(hLib, 'Bematech_FI_IniciaFechamentoCupom');
    @Bema_EfetuaFormaPagamento                  := GetProcAddress(hLib, 'Bematech_FI_EfetuaFormaPagamento');
    @Bema_TerminaFechamentoCupom                := GetProcAddress(hLib, 'Bematech_FI_TerminaFechamentoCupom');
    @Bema_UsaUnidadeMedida                      := GetProcAddress(hLib, 'Bematech_FI_UsaUnidadeMedida');
    @Bema_AumentaDescricaoItem                  := GetProcAddress(hLib, 'Bematech_FI_AumentaDescricaoItem');
    @Bema_LeituraX                              := GetProcAddress(hLib, 'Bematech_FI_LeituraX');
    @Bema_ReducaoZ                              := GetProcAddress(hLib, 'Bematech_FI_ReducaoZ');
    @Bema_RelatorioGerencial                    := GetProcAddress(hLib, 'Bematech_FI_RelatorioGerencial');
    @Bema_FechaRelatorioGerencial               := GetProcAddress(hLib, 'Bematech_FI_FechaRelatorioGerencial');
    @Bema_LeituraMemoriaFiscalData              := GetProcAddress(hLib, 'Bematech_FI_LeituraMemoriaFiscalSerialData');
    @Bema_LeituraMemoriaFiscalSerialDataMFD     := GetProcAddress(hLib, 'Bematech_FI_LeituraMemoriaFiscalSerialDataMFD');
    
    @Bema_LeituraMemoriaFiscalReducao           := GetProcAddress(hLib, 'Bematech_FI_LeituraMemoriaFiscalReducao');
    @Bema_RecebimentoNaoFiscal                  := GetProcAddress(hLib, 'Bematech_FI_RecebimentoNaoFiscal');
    @Bema_AbreComprovanteNaoFiscalVinculado     := GetProcAddress(hLib, 'Bematech_FI_AbreComprovanteNaoFiscalVinculado');
    @Bema_UsaComprovanteNaoFiscalVinculado      := GetProcAddress(hLib, 'Bematech_FI_UsaComprovanteNaoFiscalVinculado');
    @Bema_FechaComprovanteNaoFiscalVinculado    := GetProcAddress(hLib, 'Bematech_FI_FechaComprovanteNaoFiscalVinculado');
    @Bema_Sangria                               := GetProcAddress(hLib, 'Bematech_FI_Sangria');
    @Bema_Suprimento                            := GetProcAddress(hLib, 'Bematech_FI_Suprimento');
    @Bema_NumeroSerie                           := GetProcAddress(hLib, 'Bematech_FI_NumeroSerie');
    @Bema_SubTotal                              := GetProcAddress(hLib, 'Bematech_FI_SubTotal');
    @Bema_NumeroCupom                           := GetProcAddress(hLib, 'Bematech_FI_NumeroCupom');
    @Bema_LeituraXSerial                        := GetProcAddress(hLib, 'Bematech_FI_LeituraXSerial');
    @Bema_VersaoFirmware                        := GetProcAddress(hLib, 'Bematech_FI_VersaoFirmware');
    @Bema_CGC_IE                                := GetProcAddress(hLib, 'Bematech_FI_CGC_IE');
    @Bema_GrandeTotal                           := GetProcAddress(hLib, 'Bematech_FI_GrandeTotal');
    @Bema_Cancelamentos                         := GetProcAddress(hLib, 'Bematech_FI_Cancelamentos');
    @Bema_Descontos                             := GetProcAddress(hLib, 'Bematech_FI_Descontos');
    @Bema_NumeroOperacoesNaoFiscais             := GetProcAddress(hLib, 'Bematech_FI_NumeroOperacoesNaoFiscais');
    @Bema_NumeroCuponsCancelados                := GetProcAddress(hLib, 'Bematech_FI_NumeroCuponsCancelados');
    @Bema_NumeroIntervencoes                    := GetProcAddress(hLib, 'Bematech_FI_NumeroIntervencoes');
    @Bema_NumeroReducoes                        := GetProcAddress(hLib, 'Bematech_FI_NumeroReducoes');
    @Bema_NumeroSubstituicoesProprietario       := GetProcAddress(hLib, 'Bematech_FI_NumeroSubstituicoesProprietario');
    @Bema_UltimoItemVendido                     := GetProcAddress(hLib, 'Bematech_FI_UltimoItemVendido');
    @Bema_ClicheProprietario                    := GetProcAddress(hLib, 'Bematech_FI_ClicheProprietario');
    @Bema_NumeroCaixa                           := GetProcAddress(hLib, 'Bematech_FI_NumeroCaixa');
    @Bema_NumeroLoja                            := GetProcAddress(hLib, 'Bematech_FI_NumeroLoja');
    @Bema_SimboloMoeda                          := GetProcAddress(hLib, 'Bematech_FI_SimboloMoeda');
    @Bema_MinutosLigada                         := GetProcAddress(hLib, 'Bematech_FI_MinutosLigada');
    @Bema_MinutosImprimindo                     := GetProcAddress(hLib, 'Bematech_FI_MinutosImprimindo');
    @Bema_VerificaModoOperacao                  := GetProcAddress(hLib, 'Bematech_FI_VerificaModoOperacao');
    @Bema_VerificaEpromConectada                := GetProcAddress(hLib, 'Bematech_FI_VerificaEpromConectada');
    @Bema_FlagsFiscais                          := GetProcAddress(hLib, 'Bematech_FI_FlagsFiscais');
    @Bema_ValorPagoUltimoCupom                  := GetProcAddress(hLib, 'Bematech_FI_ValorPagoUltimoCupom');
    @Bema_DataHoraImpressora                    := GetProcAddress(hLib, 'Bematech_FI_DataHoraImpressora');
    @Bema_ContadoresTotalizadoresNaoFiscais     := GetProcAddress(hLib, 'Bematech_FI_ContadoresTotalizadoresNaoFiscais');
    @Bema_VerificaTotalizadoresNaoFiscais       := GetProcAddress(hLib, 'Bematech_FI_VerificaTotalizadoresNaoFiscais');
    @Bema_DataHoraReducao                       := GetProcAddress(hLib, 'Bematech_FI_DataHoraReducao');
    @Bema_DataMovimento                         := GetProcAddress(hLib, 'Bematech_FI_DataMovimento');
    @Bema_VerificaTruncamento                   := GetProcAddress(hLib, 'Bematech_FI_VerificaTruncamento');
    @Bema_Acrescimos                            := GetProcAddress(hLib, 'Bematech_FI_Acrescimos');
    @Bema_ContadorBilhetePassagem               := GetProcAddress(hLib, 'Bematech_FI_ContadorBilhetePassagem');
    @Bema_VerificaRecebimentoNaoFiscal          := GetProcAddress(hLib, 'Bematech_FI_VerificaRecebimentoNaoFiscal');
    @Bema_VerificaDepartamentos                 := GetProcAddress(hLib, 'Bematech_FI_VerificaDepartamentos');
    @Bema_VerificaTipoImpressora                := GetProcAddress(hLib, 'Bematech_FI_VerificaTipoImpressora');
    @Bema_VerificaTotalizadoresParciais         := GetProcAddress(hLib, 'Bematech_FI_VerificaTotalizadoresParciais');
    @Bema_RetornoAliquotas                      := GetProcAddress(hLib, 'Bematech_FI_RetornoAliquotas');
    @Bema_DadosUltimaReducao                    := GetProcAddress(hLib, 'Bematech_FI_DadosUltimaReducao');
    @Bema_MonitoramentoPapel                    := GetProcAddress(hLib, 'Bematech_FI_MonitoramentoPapel');
    @Bema_VerificaIndiceAliquotasIss            := GetProcAddress(hLib, 'Bematech_FI_VerificaIndiceAliquotasIss');
    @Bema_ValorFormaPagamento                   := GetProcAddress(hLib, 'Bematech_FI_ValorFormaPagamento');
    @Bema_Autenticacao                          := GetProcAddress(hLib, 'Bematech_FI_Autenticacao');
    @Bema_ProgramaCaracterAutenticacao          := GetProcAddress(hLib, 'Bematech_FI_ProgramaCaracterAutenticacao');
    @Bema_AcionaGaveta                          := GetProcAddress(hLib, 'Bematech_FI_AcionaGaveta');
    @Bema_VerificaEstadoGaveta                  := GetProcAddress(hLib, 'Bematech_FI_VerificaEstadoGaveta');
    @Bema_ProgramaMoedaSingular                 := GetProcAddress(hLib, 'Bematech_FI_ProgramaMoedaSingular');
    @Bema_ProgramaMoedaPlural                   := GetProcAddress(hLib, 'Bematech_FI_ProgramaMoedaPlural');
    @Bema_CancelaImpressaoCheque                := GetProcAddress(hLib, 'Bematech_FI_CancelaImpressaoCheque');
    @Bema_VerificaStatusCheque                  := GetProcAddress(hLib, 'Bematech_FI_VerificaStatusCheque');
    @Bema_ImprimeCheque                         := GetProcAddress(hLib, 'Bematech_FI_ImprimeCheque');
    @Bema_AbrePortaSerial                       := GetProcAddress(hLib, 'Bematech_FI_AbrePortaSerial');
    @Bema_FechaPortaSerial                      := GetProcAddress(hLib, 'Bematech_FI_FechaPortaSerial');

    {$IFDEF MSWINDOWS}
    @Bema_VerificaAliquotasIss                  := GetProcAddress(hLib, 'Bematech_FI_VerificaAliquotasIss');
    @Bema_VerificaFormasPagamento               := GetProcAddress(hLib, 'Bematech_FI_VerificaFormasPagamento');
    @Bema_VerificaEstadoImpressora              := GetProcAddress(hLib, 'Bematech_FI_VerificaEstadoImpressora');
    @Bema_ForcaImpactoAgulhas                   := GetProcAddress(hLib, 'Bematech_FI_ForcaImpactoAgulhas');
    @Bema_EfetuaFormaPagamentoDescricaoForma    := GetProcAddress(hLib, 'Bematech_FI_EfetuaFormaPagamentoDescricaoForma');
    @Bema_EstornoFormasPagamento                := GetProcAddress(hLib, 'Bematech_FI_EstornoFormasPagamento');
    @Bema_ValorTotalizadorNaoFiscal             := GetProcAddress(hLib, 'Bematech_FI_ValorTotalizadorNaoFiscal');
    @Bema_AbreCupomRestaurante                  := GetProcAddress(hLib, 'Bematech_FIR_AbreCupomRestaurante');
    @Bema_RegistraVenda                         := GetProcAddress(hLib, 'Bematech_FIR_RegistraVenda');
    @Bema_CancelaVenda                          := GetProcAddress(hLib, 'Bematech_FIR_CancelaVenda');
    @Bema_ConferenciaMesa                       := GetProcAddress(hLib, 'Bematech_FIR_ConferenciaMesa');
    @Bema_AbreConferenciaMesa                   := GetProcAddress(hLib, 'Bematech_FIR_AbreConferenciaMesa');
    @Bema_FechaConferenciaMesa                  := GetProcAddress(hLib, 'Bematech_FIR_FechaConferenciaMesa');
    @Bema_TransferenciaMesa                     := GetProcAddress(hLib, 'Bematech_FIR_TransferenciaMesa');
    @Bema_ContaDividida                         := GetProcAddress(hLib, 'Bematech_FIR_ContaDividida');
    @Bema_FechaCupomContaDividida               := GetProcAddress(hLib, 'Bematech_FIR_FechaCupomContaDividida');
    @Bema_TransferenciaItem                     := GetProcAddress(hLib, 'Bematech_FIR_TransferenciaItem');
    @Bema_RelatorioMesasAbertas                 := GetProcAddress(hLib, 'Bematech_FIR_RelatorioMesasAbertas');
    @Bema_ImprimeCardapio                       := GetProcAddress(hLib, 'Bematech_FIR_ImprimeCardapio');
    @Bema_RelatorioMesasAbertasSerial           := GetProcAddress(hLib, 'Bematech_FIR_RelatorioMesasAbertasSerial');
    @Bema_CardapioPelaSerial                    := GetProcAddress(hLib, 'Bematech_FIR_CardapioPelaSerial');
    @Bema_RegistroVendaSerial                   := GetProcAddress(hLib, 'Bematech_FIR_RegistroVendaSerial');
    @Bema_VerificaMemoriaLivre                  := GetProcAddress(hLib, 'Bematech_FIR_VerificaMemoriaLivre');
    @Bema_FechaCupomRestaurante                 := GetProcAddress(hLib, 'Bematech_FIR_FechaCupomRestaurante');
    @Bema_FechaCupomResumidoRestaurante         := GetProcAddress(hLib, 'Bematech_FIR_FechaCupomResumidoRestaurante');
    @Bema_AbreBilhetePassagem                   := GetProcAddress(hLib, 'Bematech_FI_AbreBilhetePassagem');
    @Bema_IncluiCidadeFavorecido                := GetProcAddress(hLib, 'Bematech_FI_IncluiCidadeFavorecido');
    @Bema_ImprimeCopiaCheque                    := GetProcAddress(hLib, 'Bematech_FI_ImprimeCopiaCheque');
    @Bema_Status                                := GetProcAddress(hLib, 'Bematech_FI_Status');
    @Bema_VendaCartao                           := GetProcAddress(hLib, 'Bematech_FI_VendaCartao');
    @Bema_ConfirmaVenda                         := GetProcAddress(hLib, 'Bematech_FI_ConfirmaVenda');
    @Bema_NaoConfirmaVendaImpressao             := GetProcAddress(hLib, 'Bematech_FI_NaoConfirmaVendaImpressao');
    @Bema_CancelaVendaCartao                    := GetProcAddress(hLib, 'Bematech_FI_CancelaVendaCartao');
    @Bema_ImprimeTEF                            := GetProcAddress(hLib, 'Bematech_FI_ImprimeTEF');
    @Bema_ImprimeRelatorio                      := GetProcAddress(hLib, 'Bematech_FI_ImprimeRelatorio');
    @Bema_ADM                                   := GetProcAddress(hLib, 'Bematech_FI_ADM');
    @Bema_VendaCompleta                         := GetProcAddress(hLib, 'Bematech_FI_VendaCompleta');
    @Bema_ConfiguraDiretorioTEF                 := GetProcAddress(hLib, 'Bematech_FI_ConfiguraDiretorioTEF');
    @Bema_VendaCheque                           := GetProcAddress(hLib, 'Bematech_FI_VendaCheque');
    @Bema_RetornoImpressora                     := GetProcAddress(hLib, 'Bematech_FI_RetornoImpressora');
    @Bema_MapaResumo                            := GetProcAddress(hLib, 'Bematech_FI_MapaResumo');
    @Bema_AberturaDoDia                         := GetProcAddress(hLib, 'Bematech_FI_AberturaDoDia');
    @Bema_FechamentoDoDia                       := GetProcAddress(hLib, 'Bematech_FI_FechamentoDoDia');
    @Bema_ImprimeConfiguracoesImpressora        := GetProcAddress(hLib, 'Bematech_FI_ImprimeConfiguracoesImpressora');
    @Bema_ImprimeDepartamentos                  := GetProcAddress(hLib, 'Bematech_FI_ImprimeDepartamentos');
    @Bema_RelatorioTipo60Analitico              := GetProcAddress(hLib, 'Bematech_FI_RelatorioTipo60Analitico');
    @Bema_RelatorioTipo60Mestre                 := GetProcAddress(hLib, 'Bematech_FI_RelatorioTipo60Mestre');
    @Bema_VerificaImpressoraLigada              := GetProcAddress(hLib, 'Bematech_FI_VerificaImpressoraLigada');
    {$ENDIF}

    @Bema_VerificaFormaPagamento                := GetProcAddress(hLib, 'Bematech_FI_VerificaFormaPagamento');
    @Bema_ProgramaFormasPagamento               := GetProcAddress(hLib, 'Bematech_FI_ProgramaFormasPagamento');
    @Bema_ContadorSequencial                    := GetProcAddress(hLib, 'Bematech_FI_ContadorSequencial');
    @Bema_ContadoresTotalizadoresNaoSujeitos    := GetProcAddress(hLib, 'Bematech_FI_ContadoresTotalizadoresNaoSujeitos');
    @Bema_ImprimeChequeBR400                    := GetProcAddress(hLib, 'Bematech_FI_ImprimeChequeBR400');
    @Bema_LeituraCheque                         := GetProcAddress(hLib, 'Bematech_FI_LeituraCheque');
    @Bema_FechaRelatorioXouZ                    := GetProcAddress(hLib, 'Bematech_FI_FechaRelatorioXouZ');
{    @Bema_ImpressaoCarne                        := GetProcAddress(hLib, 'Bematech_FI_ImpressaoCarne');     }
    @Bema_CodigoBarrasEAN13MFD                  := GetProcAddress(hLib, 'Bematech_FI_CodigoBarrasEAN13MFD');
  end else
    raise Exception.Create(Format(LibNotFound,[Lib]));
end;

initialization

finalization
  if (hLib <> 0) and LibLoaded then
    FreeLibrary(hLib);

end.

