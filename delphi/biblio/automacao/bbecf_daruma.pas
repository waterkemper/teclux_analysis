{********************************************************}
{                                                        }
{                                                        }
{         Interface com a Biblioteca DARUMA32            }
{          das impressoras fiscais Daruma                }
{                                                        }
{                   Ver 1.0 24/10/2005                   }
{********************************************************}

unit bbecf_daruma;

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
  LIB_NAME = 'daruma32.dll';
  INI_FILE = '';
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


{~~~~~~~~~~~~~~~~~~~~~~~~
 Funções do Cupom Fiscal
~~~~~~~~~~~~~~~~~~~~~~~~~~}

 TDaruma_AbreCupom = function( CPF_ou_CNPJ: String ): Integer; StdCall;
 TDaruma_VendeItem = function( Codigo: String; Descricao: String; Aliquota: String; Tipo_de_Quantidade: String; Quantidade: String; Casas_Decimais: Integer; Valor_Unitario: String; Tipo_de_Desconto: String; Valor_do_Desconto: String ): Integer; StdCall;
 TDaruma_VendeItemDepartamento = function( Codigo: String; Descricao: String; Aliquota: String; Valor_Unitario: String; Quantidade: String; Valor_do_Desconto: String; Valor_do_Acrescimo: String; Indice_Departamento: String; Unidade_Medida: String ): Integer; StdCall;
 TDaruma_VendeItemTresDecimais = function( Codigo: String; Descricao: String; Aliquota: String; Quantidade: String; Valor_Unitario: String; Acrescimo_ou_Desconto: String; Percentual_Acrescimo_ou_Desconto : String ): Integer; StdCall;
 TDaruma_FechaCupomResumido = function( Descricao_da_Forma_de_Pagamento: String; Mensagem_Promocional: String ): Integer; StdCall;
 TDaruma_IniciaFechamentoCupom = function( Acrescimo_ou_Desconto: String; Tipo_do_Acrescimo_ou_Desconto: String; Valor_do_Acrescimo_ou_Desconto: String ): Integer; StdCall;
 TDaruma_EfetuaFormaPagamento = function( Descricao_da_Forma_Pagamento: String; Valor_da_Forma_Pagamento: String ): Integer; StdCall;
 TDaruma_EfetuaFormaPagamentoDescricaoForma = function ( Descricao_da_Forma_Pagamento: string; Valor_da_Forma_Pagamento: string; Texto_Livre: string ): integer; StdCall;
 TDaruma_IdentificaConsumidor = function( Nome_do_Consumidor: String; Endereco: String; CPF_ou_CNPJ: String ): Integer; StdCall;
 TDaruma_TerminaFechamentoCupom = function( Mensagem_Promocional: String ): Integer; StdCall;
 TDaruma_FechaCupom = function( Forma_de_Pagamento: String; Acrescimo_ou_Desconto: String; Tipo_Acrescimo_ou_Desconto: String; Valor_Acrescimo_ou_Desconto: String; Valor_Pago: String; Mensagem_Promocional: String ): Integer; StdCall;
 TDaruma_CancelaItemAnterior = function : Integer; StdCall;
 TDaruma_CancelaItemGenerico = function ( Numero_Item: String ): Integer; StdCall;
 TDaruma_CancelaCupom = function : Integer; StdCall;
 TDaruma_AumentaDescricaoItem = function ( Descricao_Extendida: String ): Integer; StdCall;
 TDaruma_UsaUnidadeMedida = function ( Unidade_Medida: String ): Integer; StdCall;
 TDaruma_EmitirCupomAdicional = function : Integer; StdCall;
 TDaruma_EstornoFormasPagamento = function ( Forma_de_Origem: String; Nova_Forma: String; Valor_Total_Pago: String ): Integer; StdCall;



{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções dos Relatórios Fiscais
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
  TDaruma_AbreComprovanteNaoFiscalVinculado = function( Forma_de_Pagamento: String; Valor_Pago: String; Numero_do_Cupom: String ): Integer; StdCall;
  TDaruma_UsaComprovanteNaoFiscalVinculado = function( Texto_Livre: String ): Integer; StdCall;
  TDaruma_FechaComprovanteNaoFiscalVinculado = function: Integer; StdCall;
  TDaruma_RelatorioGerencial = function ( Texto_Livre: String ): Integer; StdCall;
  TDaruma_AbreRelatorioGerencial = function: Integer; StdCall;
  TDaruma_EnviarTextoCNF = function( Texto_Livre: String ): Integer; StdCall;
  TDaruma_FechaRelatorioGerencial = function: Integer; StdCall;
  TDaruma_LeituraX = function: Integer; StdCall;
  TDaruma_ReducaoZ = function( Data: String; Hora: String ): Integer; StdCall;
  TDaruma_LeituraMemoriaFiscalData = function(DataInicial, DataFinal: String): Integer; StdCall;
  TDaruma_LeituraMemoriaFiscalReducao = function(ReducaoInicial, ReducaoFinal: String): Integer; StdCall;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções das Operações Não Fiscais
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
  TDaruma_RecebimentoNaoFiscal = function( Indice_do_Totalizador: String; Valor_do_Recebimento: String; Forma_de_Pagamento: String ): Integer; StdCall;
  TDaruma_VerificaRecebimentoNaoFiscal = function( Recebimentos: String ): Integer; StdCall;


{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções de Informações da Impressora
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
  TDaruma_NumeroCupom = function( NumeroCupom: String ): Integer; StdCall;
  TDaruma_StatusCupomFiscal = function( StatusCupomFiscal: String ): Integer; StdCall;
  TDaruma_ProgramaAliquota = function( Valor_Aliquota: String; Tipo_Aliquota: Integer ): Integer; StdCall;
  TDaruma_NomeiaTotalizadorNaoSujeitoIcms = function( Indice_do_Totalizador: Integer; Nome_do_Totalizador: String ): Integer; StdCall;
  TDaruma_ProgramaFormasPagamento = function( Descricao_das_Formas_Pagamento: String ): Integer; StdCall;
  TDaruma_CGC_IE = function( CGC: String; IE: String ): Integer; StdCall;
  TDaruma_NumeroSerie = function( NumeroSerie: String ): Integer; StdCall;
  TDaruma_NumeroIntervencoes = function( NumeroIntervencoes: String ): Integer; StdCall;
  TDaruma_DataHoraImpressora = function( Data: String; Hora: String ): Integer; StdCall;
  TDaruma_DataHoraReducao = function( Data: String; Hora: String ): Integer; StdCall;
  TDaruma_Descontos = function( ValorDescontos: String ): Integer; StdCall;
//  TDaruma_Acrescimos = function( ValorAcrescimos: String ): Integer; StdCall;
  TDaruma_RetornoAliquotas = function( Aliquotas: String ): Integer; StdCall;
  TDaruma_VerificaFormasPagamento = function( FormasEx: String ): Integer; StdCall;
  TDaruma_NumeroCaixa = function( NumeroCaixa: String ): Integer; StdCall;
  TDaruma_VerificaEstadoImpressora = function( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall;
  TDaruma_RetornoImpressora = function( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall;
  TDaruma_StatusRelatorioGerencial = function( StatusRelGerencial: String ): Integer; StdCall;




{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções de Autenticação e Gaveta de Dinheiro
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
   TDaruma_AcionaGaveta = function: Integer; StdCall;
   TDaruma_Autenticacao = function: Integer; StdCall;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções para a Impressora Restaurante
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}



{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Função para a Impressora Bilhete de Passagem
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}



{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções de Impressão de Cheques
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}


{~~~~~~~~~~~~~~~~~~
 Funções para o TEF
~~~~~~~~~~~~~~~~~~~}


{~~~~~~~~~~~~~~~~
 Outras Funções
~~~~~~~~~~~~~~~~~}

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Funções para Configuração e Registry
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
   TDaruma_Registry_Separador = function( Separador: String ): Integer; StdCall;
   TDaruma_Registry_StatusFuncao = function( StatusFuncao: String ): Integer; StdCall;
   TDaruma_Registry_AlteraRegistry = function( Chave: String; ValorChave: String ): Integer; StdCall;

   function DarumaLoadLib: Boolean;

{**************** Variaveis para funçoes da API ******************}

var
{    Daruma_AlteraSimboloMoeda                     : TDaruma_AlteraSimboloMoeda;
}    Daruma_ProgramaAliquota                       : TDaruma_ProgramaAliquota;
 {   Daruma_ProgramaHorarioVerao                   : TDaruma_ProgramaHorarioVerao;
    Daruma_NomeiaDepartamento                     : TDaruma_NomeiaDepartamento;
}    Daruma_NomeiaTotalizadorNaoSujeitoIcms        : TDaruma_NomeiaTotalizadorNaoSujeitoIcms;
 {   Daruma_ProgramaArredondamento                 : TDaruma_ProgramaArredondamento;
    Daruma_ProgramaTruncamento                    : TDaruma_ProgramaTruncamento;
    Daruma_LinhasEntreCupons                      : TDaruma_LinhasEntreCupons;
    Daruma_EspacoEntreLinhas                      : TDaruma_EspacoEntreLinhas;
}    Daruma_AbreCupom                              : TDaruma_AbreCupom;
    Daruma_VendeItem                              : TDaruma_VendeItem;
    Daruma_VendeItemDepartamento                  : TDaruma_VendeItemDepartamento;
    Daruma_CancelaItemAnterior                    : TDaruma_CancelaItemAnterior;
    Daruma_CancelaItemGenerico                    : TDaruma_CancelaItemGenerico;
    Daruma_CancelaCupom                           : TDaruma_CancelaCupom;
    Daruma_FechaCupomResumido                     : TDaruma_FechaCupomResumido;
    Daruma_FechaCupom                             : TDaruma_FechaCupom;
    Daruma_IniciaFechamentoCupom                  : TDaruma_IniciaFechamentoCupom;
    Daruma_EfetuaFormaPagamento                   : TDaruma_EfetuaFormaPagamento;
    Daruma_TerminaFechamentoCupom                 : TDaruma_TerminaFechamentoCupom;
    Daruma_UsaUnidadeMedida                       : TDaruma_UsaUnidadeMedida;
    Daruma_AumentaDescricaoItem                   : TDaruma_AumentaDescricaoItem;
//    Daruma_ResetaImpressora                       : TDaruma_ResetaImpressora;
    Daruma_LeituraX                               : TDaruma_LeituraX;
    Daruma_ReducaoZ                               : TDaruma_ReducaoZ;
    Daruma_RelatorioGerencial                     : TDaruma_RelatorioGerencial;
    Daruma_FechaRelatorioGerencial                : TDaruma_FechaRelatorioGerencial;
    Daruma_LeituraMemoriaFiscalData               : TDaruma_LeituraMemoriaFiscalData;
    Daruma_LeituraMemoriaFiscalReducao            : TDaruma_LeituraMemoriaFiscalReducao;
{    Daruma_LeituraMemoriaFiscalSerialData         : TDaruma_LeituraMemoriaFiscalSerialData;
    Daruma_LeituraMemoriaFiscalSerialReducao      : TDaruma_LeituraMemoriaFiscalSerialReducao;
}    Daruma_RecebimentoNaoFiscal                   : TDaruma_RecebimentoNaoFiscal;
    Daruma_AbreComprovanteNaoFiscalVinculado      : TDaruma_AbreComprovanteNaoFiscalVinculado;
    Daruma_UsaComprovanteNaoFiscalVinculado       : TDaruma_UsaComprovanteNaoFiscalVinculado;
    Daruma_FechaComprovanteNaoFiscalVinculado     : TDaruma_FechaComprovanteNaoFiscalVinculado;
 {   Daruma_Sangria                                : TDaruma_Sangria;
    Daruma_Suprimento                             : TDaruma_Suprimento;
}    Daruma_NumeroSerie                            : TDaruma_NumeroSerie;
 {   Daruma_SubTotal                               : TDaruma_SubTotal;
}    Daruma_NumeroCupom                            : TDaruma_NumeroCupom;
 {   Daruma_LeituraXSerial                         : TDaruma_LeituraXSerial;
    Daruma_VersaoFirmware                         : TDaruma_VersaoFirmware;
}    Daruma_CGC_IE                                 : TDaruma_CGC_IE;
 {   Daruma_GrandeTotal                            : TDaruma_GrandeTotal;
    Daruma_Cancelamentos                          : TDaruma_Cancelamentos;
}    Daruma_Descontos                              : TDaruma_Descontos;
 {   Daruma_NumeroOperacoesNaoFiscais              : TDaruma_NumeroOperacoesNaoFiscais;
    Daruma_NumeroCuponsCancelados                 : TDaruma_NumeroCuponsCancelados;
}    Daruma_NumeroIntervencoes                     : TDaruma_NumeroIntervencoes;
 {   Daruma_NumeroReducoes                         : TDaruma_NumeroReducoes;
    Daruma_NumeroSubstituicoesProprietario        : TDaruma_NumeroSubstituicoesProprietario;
    Daruma_UltimoItemVendido                      : TDaruma_UltimoItemVendido;
    Daruma_ClicheProprietario                     : TDaruma_ClicheProprietario;
}    Daruma_NumeroCaixa                            : TDaruma_NumeroCaixa;
 {   Daruma_NumeroLoja                             : TDaruma_NumeroLoja;
    Daruma_SimboloMoeda                           : TDaruma_SimboloMoeda;
    Daruma_MinutosLigada                          : TDaruma_MinutosLigada;
    Daruma_MinutosImprimindo                      : TDaruma_MinutosImprimindo;
    Daruma_VerificaModoOperacao                   : TDaruma_VerificaModoOperacao;
    Daruma_VerificaEpromConectada                 : TDaruma_VerificaEpromConectada;
    Daruma_FlagsFiscais                           : TDaruma_FlagsFiscais;
    Daruma_ValorPagoUltimoCupom                   : TDaruma_ValorPagoUltimoCupom;
}    Daruma_DataHoraImpressora                     : TDaruma_DataHoraImpressora;
 {   Daruma_ContadoresTotalizadoresNaoFiscais      : TDaruma_ContadoresTotalizadoresNaoFiscais;
    Daruma_VerificaTotalizadoresNaoFiscais        : TDaruma_VerificaTotalizadoresNaoFiscais;
}    Daruma_DataHoraReducao                        : TDaruma_DataHoraReducao;
 {   Daruma_DataMovimento                          : TDaruma_DataMovimento;
    Daruma_VerificaTruncamento                    : TDaruma_VerificaTruncamento;
    Daruma_Acrescimos                             : TDaruma_Acrescimos;
    Daruma_ContadorBilhetePassagem                : TDaruma_ContadorBilhetePassagem;
}    Daruma_VerificaRecebimentoNaoFiscal           : TDaruma_VerificaRecebimentoNaoFiscal;
 {   Daruma_VerificaDepartamentos                  : TDaruma_VerificaDepartamentos;
    Daruma_VerificaTipoImpressora                 : TDaruma_VerificaTipoImpressora;
    Daruma_VerificaTotalizadoresParciais          : TDaruma_VerificaTotalizadoresParciais;
}    Daruma_RetornoAliquotas                       : TDaruma_RetornoAliquotas;
 {   Daruma_DadosUltimaReducao                     : TDaruma_DadosUltimaReducao;
    Daruma_MonitoramentoPapel                     : TDaruma_MonitoramentoPapel;
    Daruma_VerificaIndiceAliquotasIss             : TDaruma_VerificaIndiceAliquotasIss;
    Daruma_ValorFormaPagamento                    : TDaruma_ValorFormaPagamento;
}    Daruma_Autenticacao                           : TDaruma_Autenticacao;
//    Daruma_ProgramaCaracterAutenticacao           : TDaruma_ProgramaCaracterAutenticacao;
    Daruma_AcionaGaveta                           : TDaruma_AcionaGaveta;
 {   Daruma_VerificaEstadoGaveta                   : TDaruma_VerificaEstadoGaveta;
    Daruma_ProgramaMoedaSingular                  : TDaruma_ProgramaMoedaSingular;
    Daruma_ProgramaMoedaPlural                    : TDaruma_ProgramaMoedaPlural;
    Daruma_CancelaImpressaoCheque                 : TDaruma_CancelaImpressaoCheque;
    Daruma_VerificaStatusCheque                   : TDaruma_VerificaStatusCheque;
    Daruma_ImprimeCheque                          : TDaruma_ImprimeCheque;
    Daruma_AbrePortaSerial                        : TDaruma_AbrePortaSerial;
    Daruma_FechaPortaSerial                       : TDaruma_FechaPortaSerial;

    Daruma_VerificaAliquotasIss                   : TDaruma_VerificaAliquotasIss;
}    Daruma_VerificaEstadoImpressora               : TDaruma_VerificaEstadoImpressora;
 {   Daruma_ForcaImpactoAgulhas                    : TDaruma_ForcaImpactoAgulhas;
    Daruma_EfetuaFormaPagamentoDescricaoForma     : TDaruma_EfetuaFormaPagamentoDescricaoForma;
    Daruma_EstornoFormasPagamento                 : TDaruma_EstornoFormasPagamento;
    Daruma_ValorTotalizadorNaoFiscal              : TDaruma_ValorTotalizadorNaoFiscal;
    Daruma_AbreCupomRestaurante                   : TDaruma_AbreCupomRestaurante;
    Daruma_RegistraVenda                          : TDaruma_RegistraVenda;
    Daruma_CancelaVenda                           : TDaruma_CancelaVenda;
    Daruma_ConferenciaMesa                        : TDaruma_ConferenciaMesa;
    Daruma_AbreConferenciaMesa                    : TDaruma_AbreConferenciaMesa;
    Daruma_FechaConferenciaMesa                   : TDaruma_FechaConferenciaMesa;
    Daruma_TransferenciaMesa                      : TDaruma_TransferenciaMesa;
    Daruma_ContaDividida                          : TDaruma_ContaDividida;
    Daruma_FechaCupomContaDividida                : TDaruma_FechaCupomContaDividida;
    Daruma_TransferenciaItem                      : TDaruma_TransferenciaItem;
    Daruma_RelatorioMesasAbertas                  : TDaruma_RelatorioMesasAbertas;
    Daruma_ImprimeCardapio                        : TDaruma_ImprimeCardapio;
    Daruma_RelatorioMesasAbertasSerial            : TDaruma_RelatorioMesasAbertasSerial;
    Daruma_CardapioPelaSerial                     : TDaruma_CardapioPelaSerial;
    Daruma_RegistroVendaSerial                    : TDaruma_RegistroVendaSerial;
    Daruma_VerificaMemoriaLivre                   : TDaruma_VerificaMemoriaLivre;
    Daruma_FechaCupomRestaurante                  : TDaruma_FechaCupomRestaurante;
    Daruma_FechaCupomResumidoRestaurante          : TDaruma_FechaCupomResumidoRestaurante;
    Daruma_AbreBilhetePassagem                    : TDaruma_AbreBilhetePassagem;
    Daruma_IncluiCidadeFavorecido                 : TDaruma_IncluiCidadeFavorecido;
    Daruma_ImprimeCopiaCheque                     : TDaruma_ImprimeCopiaCheque;
}    Daruma_StatusCupomFiscal                     : TDaruma_StatusCupomFiscal;
 {   Daruma_VendaCartao                            : TDaruma_VendaCartao;
    Daruma_ConfirmaVenda                          : TDaruma_ConfirmaVenda;
    Daruma_NaoConfirmaVendaImpressao              : TDaruma_NaoConfirmaVendaImpressao;
    Daruma_CancelaVendaCartao                     : TDaruma_CancelaVendaCartao;
    Daruma_ImprimeTEF                             : TDaruma_ImprimeTEF;
    Daruma_ImprimeRelatorio                       : TDaruma_ImprimeRelatorio;
    Daruma_ADM                                    : TDaruma_ADM;
    Daruma_VendaCompleta                          : TDaruma_VendaCompleta;
    Daruma_ConfiguraDiretorioTEF                  : TDaruma_ConfiguraDiretorioTEF;
    Daruma_VendaCheque                            : TDaruma_VendaCheque;
}    Daruma_RetornoImpressora                      : TDaruma_RetornoImpressora;
 {   Daruma_MapaResumo                             : TDaruma_MapaResumo;
    Daruma_AberturaDoDia                          : TDaruma_AberturaDoDia;
    Daruma_FechamentoDoDia                        : TDaruma_FechamentoDoDia;
    Daruma_ImprimeConfiguracoesImpressora         : TDaruma_ImprimeConfiguracoesImpressora;
    Daruma_ImprimeDepartamentos                   : TDaruma_ImprimeDepartamentos;
    Daruma_RelatorioTipo60Analitico               : TDaruma_RelatorioTipo60Analitico;
    Daruma_RelatorioTipo60Mestre                  : TDaruma_RelatorioTipo60Mestre;
    Daruma_VerificaImpressoraLigada               : TDaruma_VerificaImpressoraLigada;

}    Daruma_VerificaFormasPagamento                 : TDaruma_VerificaFormasPagamento;
    Daruma_ProgramaFormasPagamento                : TDaruma_ProgramaFormasPagamento;
 {   Daruma_ContadorSequencial                     : TDaruma_ContadorSequencial;
    Daruma_ContadoresTotalizadoresNaoSujeitos     : TDaruma_ContadoresTotalizadoresNaoSujeitos;
    Daruma_ImprimeChequeBR400                     : TDaruma_ImprimeChequeBR400;
    Daruma_LeituraCheque                          : TDaruma_LeituraCheque;
    Daruma_FechaRelatorioXouZ                     : TDaruma_FechaRelatorioXouZ;
}
    Daruma_Registry_Separador                     : TDaruma_Registry_Separador;
    Daruma_Registry_StatusFuncao                  : TDaruma_Registry_StatusFuncao;
    Daruma_StatusRelatorioGerencial               : TDaruma_StatusRelatorioGerencial;
    Daruma_Registry_AlteraRegistry                : TDaruma_Registry_AlteraRegistry;
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

function DarumaLoadLib: Boolean;
begin
  Result := False;
  {Carrega biblioteca}
  if hLib = 0 then begin
    hLib := GetModuleHandle(PChar(Lib));
    LibLoaded := False;
    if hLib = 0 then begin
      hLib := LoadLibrary(PChar(Lib));
      LibLoaded := True;
    end;
  end;
  {Carrega funcoes contidas na biblioteca}
  if hLib <> 0 then begin
{    @Daruma_AlteraSimboloMoeda                    := GetProcAddress(hLib, 'Daruma_FI_AlteraSimboloMoeda');
    @Daruma_ProgramaAliquota                      := GetProcAddress(hLib, 'Daruma_FI_ProgramaAliquota');
    @Daruma_ProgramaHorarioVerao                  := GetProcAddress(hLib, 'Daruma_FI_ProgramaHorarioVerao');
    @Daruma_NomeiaDepartamento                    := GetProcAddress(hLib, 'Daruma_FI_NomeiaDepartamento');
}    @Daruma_NomeiaTotalizadorNaoSujeitoIcms       := GetProcAddress(hLib, 'Daruma_FI_NomeiaTotalizadorNaoSujeitoIcms');
 {   @Daruma_ProgramaArredondamento                := GetProcAddress(hLib, 'Daruma_FI_ProgramaArredondamento');
    @Daruma_ProgramaTruncamento                   := GetProcAddress(hLib, 'Daruma_FI_ProgramaTruncamento');
    @Daruma_LinhasEntreCupons                     := GetProcAddress(hLib, 'Daruma_FI_LinhasEntreCupons');
    @Daruma_EspacoEntreLinhas                     := GetProcAddress(hLib, 'Daruma_FI_EspacoEntreLinhas');
}    @Daruma_AbreCupom                             := GetProcAddress(hLib, 'Daruma_FI_AbreCupom');
    @Daruma_VendeItem                             := GetProcAddress(hLib, 'Daruma_FI_VendeItem');
    @Daruma_VendeItemDepartamento                 := GetProcAddress(hLib, 'Daruma_FI_VendeItemDepartamento');
    @Daruma_CancelaItemAnterior                   := GetProcAddress(hLib, 'Daruma_FI_CancelaItemAnterior');
    @Daruma_CancelaItemGenerico                   := GetProcAddress(hLib, 'Daruma_FI_CancelaItemGenerico');
    @Daruma_CancelaCupom                          := GetProcAddress(hLib, 'Daruma_FI_CancelaCupom');
    @Daruma_FechaCupomResumido                    := GetProcAddress(hLib, 'Daruma_FI_FechaCupomResumido');
    @Daruma_FechaCupom                            := GetProcAddress(hLib, 'Daruma_FI_FechaCupom');
    @Daruma_IniciaFechamentoCupom                 := GetProcAddress(hLib, 'Daruma_FI_IniciaFechamentoCupom');
    @Daruma_EfetuaFormaPagamento                  := GetProcAddress(hLib, 'Daruma_FI_EfetuaFormaPagamento');
    @Daruma_TerminaFechamentoCupom                := GetProcAddress(hLib, 'Daruma_FI_TerminaFechamentoCupom');
{    @Daruma_ResetaImpressora                      := GetProcAddress(hLib, 'Daruma_FI_ResetaImpressora');
    @Daruma_UsaUnidadeMedida                      := GetProcAddress(hLib, 'Daruma_FI_UsaUnidadeMedida');
    @Daruma_AumentaDescricaoItem                  := GetProcAddress(hLib, 'Daruma_FI_AumentaDescricaoItem');
}    @Daruma_LeituraX                              := GetProcAddress(hLib, 'Daruma_FI_LeituraX');
    @Daruma_ReducaoZ                              := GetProcAddress(hLib, 'Daruma_FI_ReducaoZ');
    @Daruma_RelatorioGerencial                    := GetProcAddress(hLib, 'Daruma_FI_RelatorioGerencial');
    @Daruma_FechaRelatorioGerencial               := GetProcAddress(hLib, 'Daruma_FI_FechaRelatorioGerencial');
    @Daruma_LeituraMemoriaFiscalData              := GetProcAddress(hLib, 'Daruma_FI_LeituraMemoriaFiscalData');
    @Daruma_LeituraMemoriaFiscalReducao           := GetProcAddress(hLib, 'Daruma_FI_LeituraMemoriaFiscalReducao');
{    @Daruma_LeituraMemoriaFiscalSerialData        := GetProcAddress(hLib, 'Daruma_FI_LeituraMemoriaFiscalSerialData');
    @Daruma_LeituraMemoriaFiscalSerialReducao     := GetProcAddress(hLib, 'Daruma_FI_LeituraMemoriaFiscalSerialReducao');
}    @Daruma_RecebimentoNaoFiscal                  := GetProcAddress(hLib, 'Daruma_FI_RecebimentoNaoFiscal');
    @Daruma_AbreComprovanteNaoFiscalVinculado     := GetProcAddress(hLib, 'Daruma_FI_AbreComprovanteNaoFiscalVinculado');
    @Daruma_UsaComprovanteNaoFiscalVinculado      := GetProcAddress(hLib, 'Daruma_FI_UsaComprovanteNaoFiscalVinculado');
    @Daruma_FechaComprovanteNaoFiscalVinculado    := GetProcAddress(hLib, 'Daruma_FI_FechaComprovanteNaoFiscalVinculado');
 {   @Daruma_Sangria                               := GetProcAddress(hLib, 'Daruma_FI_Sangria');
    @Daruma_Suprimento                            := GetProcAddress(hLib, 'Daruma_FI_Suprimento');
}    @Daruma_NumeroSerie                           := GetProcAddress(hLib, 'Daruma_FI_NumeroSerie');
 {   @Daruma_SubTotal                              := GetProcAddress(hLib, 'Daruma_FI_SubTotal');
}    @Daruma_NumeroCupom                           := GetProcAddress(hLib, 'Daruma_FI_NumeroCupom');
 {   @Daruma_LeituraXSerial                        := GetProcAddress(hLib, 'Daruma_FI_LeituraXSerial');
    @Daruma_VersaoFirmware                        := GetProcAddress(hLib, 'Daruma_FI_VersaoFirmware');
}    @Daruma_CGC_IE                                := GetProcAddress(hLib, 'Daruma_FI_CGC_IE');
 {   @Daruma_GrandeTotal                           := GetProcAddress(hLib, 'Daruma_FI_GrandeTotal');
    @Daruma_Cancelamentos                         := GetProcAddress(hLib, 'Daruma_FI_Cancelamentos');
}    @Daruma_Descontos                             := GetProcAddress(hLib, 'Daruma_FI_Descontos');
 {   @Daruma_NumeroOperacoesNaoFiscais             := GetProcAddress(hLib, 'Daruma_FI_NumeroOperacoesNaoFiscais');
    @Daruma_NumeroCuponsCancelados                := GetProcAddress(hLib, 'Daruma_FI_NumeroCuponsCancelados');
}    @Daruma_NumeroIntervencoes                    := GetProcAddress(hLib, 'Daruma_FI_NumeroIntervencoes');
 {   @Daruma_NumeroReducoes                        := GetProcAddress(hLib, 'Daruma_FI_NumeroReducoes');
    @Daruma_NumeroSubstituicoesProprietario       := GetProcAddress(hLib, 'Daruma_FI_NumeroSubstituicoesProprietario');
    @Daruma_UltimoItemVendido                     := GetProcAddress(hLib, 'Daruma_FI_UltimoItemVendido');
    @Daruma_ClicheProprietario                    := GetProcAddress(hLib, 'Daruma_FI_ClicheProprietario');
}    @Daruma_NumeroCaixa                           := GetProcAddress(hLib, 'Daruma_FI_NumeroCaixa');
 {   @Daruma_NumeroLoja                            := GetProcAddress(hLib, 'Daruma_FI_NumeroLoja');
    @Daruma_SimboloMoeda                          := GetProcAddress(hLib, 'Daruma_FI_SimboloMoeda');
    @Daruma_MinutosLigada                         := GetProcAddress(hLib, 'Daruma_FI_MinutosLigada');
    @Daruma_MinutosImprimindo                     := GetProcAddress(hLib, 'Daruma_FI_MinutosImprimindo');
    @Daruma_VerificaModoOperacao                  := GetProcAddress(hLib, 'Daruma_FI_VerificaModoOperacao');
    @Daruma_VerificaEpromConectada                := GetProcAddress(hLib, 'Daruma_FI_VerificaEpromConectada');
    @Daruma_FlagsFiscais                          := GetProcAddress(hLib, 'Daruma_FI_FlagsFiscais');
    @Daruma_ValorPagoUltimoCupom                  := GetProcAddress(hLib, 'Daruma_FI_ValorPagoUltimoCupom');
 }   @Daruma_DataHoraImpressora                    := GetProcAddress(hLib, 'Daruma_FI_DataHoraImpressora');
  {  @Daruma_ContadoresTotalizadoresNaoFiscais     := GetProcAddress(hLib, 'Daruma_FI_ContadoresTotalizadoresNaoFiscais');
    @Daruma_VerificaTotalizadoresNaoFiscais       := GetProcAddress(hLib, 'Daruma_FI_VerificaTotalizadoresNaoFiscais');
}    @Daruma_DataHoraReducao                       := GetProcAddress(hLib, 'Daruma_FI_DataHoraReducao');
 {   @Daruma_DataMovimento                         := GetProcAddress(hLib, 'Daruma_FI_DataMovimento');
    @Daruma_VerificaTruncamento                   := GetProcAddress(hLib, 'Daruma_FI_VerificaTruncamento');
    @Daruma_Acrescimos                            := GetProcAddress(hLib, 'Daruma_FI_Acrescimos');
    @Daruma_ContadorBilhetePassagem               := GetProcAddress(hLib, 'Daruma_FI_ContadorBilhetePassagem');
}    @Daruma_VerificaRecebimentoNaoFiscal          := GetProcAddress(hLib, 'Daruma_FI_VerificaRecebimentoNaoFiscal');
 {   @Daruma_VerificaDepartamentos                 := GetProcAddress(hLib, 'Daruma_FI_VerificaDepartamentos');
    @Daruma_VerificaTipoImpressora                := GetProcAddress(hLib, 'Daruma_FI_VerificaTipoImpressora');
    @Daruma_VerificaTotalizadoresParciais         := GetProcAddress(hLib, 'Daruma_FI_VerificaTotalizadoresParciais');
}    @Daruma_RetornoAliquotas                      := GetProcAddress(hLib, 'Daruma_FI_RetornoAliquotas');
 {   @Daruma_DadosUltimaReducao                    := GetProcAddress(hLib, 'Daruma_FI_DadosUltimaReducao');
    @Daruma_MonitoramentoPapel                    := GetProcAddress(hLib, 'Daruma_FI_MonitoramentoPapel');
    @Daruma_VerificaIndiceAliquotasIss            := GetProcAddress(hLib, 'Daruma_FI_VerificaIndiceAliquotasIss');
    @Daruma_ValorFormaPagamento                   := GetProcAddress(hLib, 'Daruma_FI_ValorFormaPagamento');
}    @Daruma_Autenticacao                          := GetProcAddress(hLib, 'Daruma_FI_Autenticacao');
//    @Daruma_ProgramaCaracterAutenticacao          := GetProcAddress(hLib, 'Daruma_FI_ProgramaCaracterAutenticacao');
    @Daruma_AcionaGaveta                          := GetProcAddress(hLib, 'Daruma_FI_AcionaGaveta');
 {   @Daruma_VerificaEstadoGaveta                  := GetProcAddress(hLib, 'Daruma_FI_VerificaEstadoGaveta');
    @Daruma_ProgramaMoedaSingular                 := GetProcAddress(hLib, 'Daruma_FI_ProgramaMoedaSingular');
    @Daruma_ProgramaMoedaPlural                   := GetProcAddress(hLib, 'Daruma_FI_ProgramaMoedaPlural');
    @Daruma_CancelaImpressaoCheque                := GetProcAddress(hLib, 'Daruma_FI_CancelaImpressaoCheque');
    @Daruma_VerificaStatusCheque                  := GetProcAddress(hLib, 'Daruma_FI_VerificaStatusCheque');
    @Daruma_ImprimeCheque                         := GetProcAddress(hLib, 'Daruma_FI_ImprimeCheque');
    @Daruma_AbrePortaSerial                       := GetProcAddress(hLib, 'Daruma_FI_AbrePortaSerial');
    @Daruma_FechaPortaSerial                      := GetProcAddress(hLib, 'Daruma_FI_FechaPortaSerial');

    @Daruma_VerificaAliquotasIss                  := GetProcAddress(hLib, 'Daruma_FI_VerificaAliquotasIss');
}    @Daruma_VerificaFormasPagamento               := GetProcAddress(hLib, 'Daruma_FI_VerificaFormasPagamentoEx');
    @Daruma_VerificaEstadoImpressora              := GetProcAddress(hLib, 'Daruma_FI_VerificaEstadoImpressora');
 {   @Daruma_ForcaImpactoAgulhas                   := GetProcAddress(hLib, 'Daruma_FI_ForcaImpactoAgulhas');
    @Daruma_EfetuaFormaPagamentoDescricaoForma    := GetProcAddress(hLib, 'Daruma_FI_EfetuaFormaPagamentoDescricaoForma');
    @Daruma_EstornoFormasPagamento                := GetProcAddress(hLib, 'Daruma_FI_EstornoFormasPagamento');
    @Daruma_ValorTotalizadorNaoFiscal             := GetProcAddress(hLib, 'Daruma_FI_ValorTotalizadorNaoFiscal');
    @Daruma_AbreCupomRestaurante                  := GetProcAddress(hLib, 'Daruma_FIR_AbreCupomRestaurante');
    @Daruma_RegistraVenda                         := GetProcAddress(hLib, 'Daruma_FIR_RegistraVenda');
    @Daruma_CancelaVenda                          := GetProcAddress(hLib, 'Daruma_FIR_CancelaVenda');
    @Daruma_ConferenciaMesa                       := GetProcAddress(hLib, 'Daruma_FIR_ConferenciaMesa');
    @Daruma_AbreConferenciaMesa                   := GetProcAddress(hLib, 'Daruma_FIR_AbreConferenciaMesa');
    @Daruma_FechaConferenciaMesa                  := GetProcAddress(hLib, 'Daruma_FIR_FechaConferenciaMesa');
    @Daruma_TransferenciaMesa                     := GetProcAddress(hLib, 'Daruma_FIR_TransferenciaMesa');
    @Daruma_ContaDividida                         := GetProcAddress(hLib, 'Daruma_FIR_ContaDividida');
    @Daruma_FechaCupomContaDividida               := GetProcAddress(hLib, 'Daruma_FIR_FechaCupomContaDividida');
    @Daruma_TransferenciaItem                     := GetProcAddress(hLib, 'Daruma_FIR_TransferenciaItem');
    @Daruma_RelatorioMesasAbertas                 := GetProcAddress(hLib, 'Daruma_FIR_RelatorioMesasAbertas');
    @Daruma_ImprimeCardapio                       := GetProcAddress(hLib, 'Daruma_FIR_ImprimeCardapio');
    @Daruma_RelatorioMesasAbertasSerial           := GetProcAddress(hLib, 'Daruma_FIR_RelatorioMesasAbertasSerial');
    @Daruma_CardapioPelaSerial                    := GetProcAddress(hLib, 'Daruma_FIR_CardapioPelaSerial');
    @Daruma_RegistroVendaSerial                   := GetProcAddress(hLib, 'Daruma_FIR_RegistroVendaSerial');
    @Daruma_VerificaMemoriaLivre                  := GetProcAddress(hLib, 'Daruma_FIR_VerificaMemoriaLivre');
    @Daruma_FechaCupomRestaurante                 := GetProcAddress(hLib, 'Daruma_FIR_FechaCupomRestaurante');
    @Daruma_FechaCupomResumidoRestaurante         := GetProcAddress(hLib, 'Daruma_FIR_FechaCupomResumidoRestaurante');
    @Daruma_AbreBilhetePassagem                   := GetProcAddress(hLib, 'Daruma_FI_AbreBilhetePassagem');
    @Daruma_IncluiCidadeFavorecido                := GetProcAddress(hLib, 'Daruma_FI_IncluiCidadeFavorecido');
    @Daruma_ImprimeCopiaCheque                    := GetProcAddress(hLib, 'Daruma_FI_ImprimeCopiaCheque');
}    @Daruma_StatusCupomFiscal                    := GetProcAddress(hLib, 'Daruma_FI_StatusCupomFiscal');
 {   @Daruma_VendaCartao                           := GetProcAddress(hLib, 'Daruma_FI_VendaCartao');
    @Daruma_ConfirmaVenda                         := GetProcAddress(hLib, 'Daruma_FI_ConfirmaVenda');
    @Daruma_NaoConfirmaVendaImpressao             := GetProcAddress(hLib, 'Daruma_FI_NaoConfirmaVendaImpressao');
    @Daruma_CancelaVendaCartao                    := GetProcAddress(hLib, 'Daruma_FI_CancelaVendaCartao');
    @Daruma_ImprimeTEF                            := GetProcAddress(hLib, 'Daruma_FI_ImprimeTEF');
    @Daruma_ImprimeRelatorio                      := GetProcAddress(hLib, 'Daruma_FI_ImprimeRelatorio');
    @Daruma_ADM                                   := GetProcAddress(hLib, 'Daruma_FI_ADM');
    @Daruma_VendaCompleta                         := GetProcAddress(hLib, 'Daruma_FI_VendaCompleta');
    @Daruma_ConfiguraDiretorioTEF                 := GetProcAddress(hLib, 'Daruma_FI_ConfiguraDiretorioTEF');
    @Daruma_VendaCheque                           := GetProcAddress(hLib, 'Daruma_FI_VendaCheque');
}    @Daruma_RetornoImpressora                     := GetProcAddress(hLib, 'Daruma_FI_RetornoImpressora');
 {   @Daruma_MapaResumo                            := GetProcAddress(hLib, 'Daruma_FI_MapaResumo');
    @Daruma_AberturaDoDia                         := GetProcAddress(hLib, 'Daruma_FI_AberturaDoDia');
    @Daruma_FechamentoDoDia                       := GetProcAddress(hLib, 'Daruma_FI_FechamentoDoDia');
    @Daruma_ImprimeConfiguracoesImpressora        := GetProcAddress(hLib, 'Daruma_FI_ImprimeConfiguracoesImpressora');
    @Daruma_ImprimeDepartamentos                  := GetProcAddress(hLib, 'Daruma_FI_ImprimeDepartamentos');
    @Daruma_RelatorioTipo60Analitico              := GetProcAddress(hLib, 'Daruma_FI_RelatorioTipo60Analitico');
    @Daruma_RelatorioTipo60Mestre                 := GetProcAddress(hLib, 'Daruma_FI_RelatorioTipo60Mestre');
    @Daruma_VerificaImpressoraLigada              := GetProcAddress(hLib, 'Daruma_FI_VerificaImpressoraLigada');

    @Daruma_VerificaFormaPagamento                := GetProcAddress(hLib, 'Daruma_FI_VerificaFormaPagamento');
}    @Daruma_ProgramaFormasPagamento               := GetProcAddress(hLib, 'Daruma_FI_ProgramaFormasPagamento');
 {   @Daruma_ContadorSequencial                    := GetProcAddress(hLib, 'Daruma_FI_ContadorSequencial');
    @Daruma_ContadoresTotalizadoresNaoSujeitos    := GetProcAddress(hLib, 'Daruma_FI_ContadoresTotalizadoresNaoSujeitos');
    @Daruma_ImprimeChequeBR400                    := GetProcAddress(hLib, 'Daruma_FI_ImprimeChequeBR400');
    @Daruma_LeituraCheque                         := GetProcAddress(hLib, 'Daruma_FI_LeituraCheque');
    @Daruma_FechaRelatorioXouZ                    := GetProcAddress(hLib, 'Daruma_FI_FechaRelatorioXouZ');
}   @Daruma_Registry_Separador                    := GetProcAddress(hLib, 'Daruma_Registry_Separador');
    @Daruma_Registry_StatusFuncao                 := GetProcAddress(hLib, 'Daruma_Registry_StatusFuncao');
    @Daruma_StatusRelatorioGerencial              := GetProcAddress(hLib, 'Daruma_FI_StatusRelatorioGerencial');
    @Daruma_Registry_AlteraRegistry               := GetProcAddress(hLib, 'Daruma_Registry_AlteraRegistry');
  end else
    raise Exception.Create(Format(LibNotFound,[Lib]));
end;

initialization

finalization
  if (hLib <> 0) and LibLoaded then
    FreeLibrary(hLib);

end.

