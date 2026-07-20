{********************************************************}
{                                                        }
{                                                        }
{                Biblioteca das impressoras              }
{                 fiscais Mecaf para Linux               }
{                                                        }
{                                                        }
{********************************************************}

unit bbelgin;

interface

uses Classes, SysUtils {$IFDEF LINUX },Libc {$ELSE} ,idglobal{$ENDIF};

    function Elgin_AlteraSimboloMoeda(SimboloMoeda: String): Integer; cdecl;
    function Elgin_ProgramaAliquota(Aliquota: String; ICMS_ISS: Integer): Integer; cdecl;
    function Elgin_ProgramaHorarioVerao: Integer; cdecl;
    function Elgin_NomeiaTotalizadorNaoSujeitoIcms(Indice: Integer; Totalizador: String): Integer; cdecl;
    function Elgin_ProgramaArredondamento: Integer; cdecl;
    function Elgin_ProgramaTruncamento  : Integer; cdecl;
    function Elgin_NomeiaDepartamento(Indice: Integer; Departamento: String): Integer; cdecl;
    function Elgin_LinhasEntreCupons(Linhas: Integer): Integer; cdecl;
    function Elgin_EspacoEntreLinhas(Dots: Integer): Integer; cdecl;
    function Elgin_ResetaImpressora: Integer; cdecl;
    function Elgin_AbreCupom (CGC_CPF: String): Integer; cdecl;
    function Elgin_VendeItem (Codigo, Descricao, Aliquota, Quantidade,
                             Valor, Desconto: String): Integer; cdecl;
    function Elgin_VendeItemDepartamento (Codigo, Descricao, Aliquota, ValorUnitario,
                                         Quantidade, Acrescimo, Desconto, IndiceDepartamento,
                                          UnidadeMedida: String): Integer; cdecl;
    function Elgin_CancelaItemAnterior : Integer; cdecl;
    function Elgin_CancelaItemGenerico(NumeroItem: String): Integer; cdecl;
    function Elgin_CancelaCupom : Integer; cdecl;
    function Elgin_FechaCupomResumido(FormaPagamento, {Valor, }Mensagem: String): Integer; cdecl;
    function Elgin_FechaCupom(AcrescimoDesconto, ValorAcrescimoDesconto :String;
                             QtdFormasPagto: Integer;
                             FormasPagto, Valores, Mensagem: String): Integer; cdecl;

    function Elgin_IniciaFechamentoCupom(AcrescimoDesconto, TipoAcrescimoDesconto,
                                        ValorAcrescimoDesconto: String): Integer; cdecl;
    function Elgin_VerificaFormaPagamento(FormaPagto: String; var Valor: String): Integer; cdecl;
    function Elgin_EfetuaFormaPagamento(FormaPagamento, ValorFormaPagamento,
                                       Descricao: String): Integer; cdecl;
    function Elgin_ProgramaFormasPagamento(FormasPagto: String; var Indice: Integer): Integer cdecl;
    function Elgin_TerminaFechamentoCupom (Mensagem: String): Integer; cdecl;
    function Elgin_UsaUnidadeMedida(UnidadeMedida: String): Integer; cdecl;
    function Elgin_AumentaDescricaoItem(Descricao: String): Integer; cdecl;
    function Elgin_LeituraX: Integer; cdecl;
    function Elgin_ReducaoZ: Integer; cdecl;
    function Elgin_RelatorioGerencial(Texto: String): Integer; cdecl;
    function Elgin_FechaRelatorioGerencial: Integer; cdecl;
    function Elgin_LeituraMemoriaFiscalData(DataInicial, DataFinal: String): Integer; cdecl;
    function Elgin_LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal: String): Integer; cdecl;
    function Elgin_LeituraMemoriaFiscalSerialData(DataInicial, DataFinal: String): Integer; cdecl;
    function Elgin_LeituraMemoriaFiscalSerialReducao(ReducaoInicial,
                                                    ReducaoFinal: String): Integer; cdecl;
    function Elgin_RecebimentoNaoFiscal(IndiceTotalizador, Valor,
                                          FormaPagamento: String): Integer; cdecl;
    function Elgin_AbreComprovanteNaoFiscalVinculado(FormaPagamento, Valor,
                                                       NumeroCupom: String): Integer; cdecl;
    function Elgin_UsaComprovanteNaoFiscalVinculado(Texto: String): Integer; cdecl;
    function Elgin_FechaComprovanteNaoFiscalVinculado: Integer; cdecl;
    function Elgin_Sangria(Valor: String): Integer; cdecl;
    function Elgin_Suprimento(Valor: String): Integer; cdecl;

    function Elgin_NumeroSerie(var NumeroSerie: String): Integer; cdecl;
    function Elgin_SubTotal(SubTotal: String): Integer; cdecl;
    function Elgin_NumeroCupom(var NumeroCupom: String): Integer; cdecl;
    function Elgin_LeituraXSerial: Integer; cdecl;
    function Elgin_VersaoFirmware(var VersaoFirmware: String): Integer; cdecl;
    function Elgin_CGC_IE(var CGCIE: String): Integer; cdecl;
    function Elgin_GrandeTotal(var GrandeTotal: String): Integer; cdecl;
    function Elgin_Cancelamentos(var ValorCancelamentos: String): Integer; cdecl;
    function Elgin_Descontos(var ValorDescontos: String): Integer; cdecl;
    function Elgin_ContadorSequencial(var Cupom: String): Integer; cdecl;
    function Elgin_NumeroOperacoesNaoFiscais(var NumeroOperacoes: String): Integer; cdecl;
    function Elgin_NumeroCuponsCancelados(var NumeroCancelamentos: String): Integer; cdecl;
    function Elgin_NumeroIntervencoes(var NumeroIntervencoes: String): Integer; cdecl;
    function Elgin_NumeroReducoes(var NumeroReducoes: String): Integer; cdecl;
    function Elgin_NumeroSubstituicoesProprietario(var NumeroSubstituicoes: String): Integer; cdecl;
    function Elgin_UltimoItemVendido(var NumeroItem: String): Integer; cdecl;
    function Elgin_ClicheProprietario(var Cliche: String): Integer; cdecl;
    function Elgin_NumeroCaixa(var NumeroCaixa: String): Integer; cdecl;
    function Elgin_NumeroLoja(var NumeroLoja: String): Integer; cdecl;
    function Elgin_SimboloMoeda(SimboloMoeda: String): Integer; cdecl;
    function Elgin_FlagsFiscais(var Flag: Integer): Integer; cdecl;
    function Elgin_MinutosLigada(var Minutos: String): Integer; cdecl;
    function Elgin_MinutosImprimindo(var Minutos: String): Integer; cdecl;
    function Elgin_VerificaModoOperacao(Modo: string): Integer; cdecl;
    function Elgin_VerificaEpromConectada(Flag: String): Integer; cdecl;
    function Elgin_ValorPagoUltimoCupom(ValorCupom: String): Integer; cdecl;
    function Elgin_DataHoraImpressora(var DataHora: String): Integer; cdecl;
    function Elgin_ContadoresTotalizadoresNaoFiscais(var Contadores: String): Integer; cdecl;
    function Elgin_VerificaTotalizadoresNaoFiscais(var Totalizadores: String): Integer; cdecl;
    function Elgin_DataHoraReducao(var DataHora: String): Integer; cdecl;
    function Elgin_DataMovimento(var Data: String): Integer; cdecl;
    function Elgin_VerificaTruncamento(Flag: String): Integer; cdecl;
    function Elgin_Acrescimos(var ValorAcrescimos: String): Integer; cdecl;
    function Elgin_ContadorBilhetePassagem(var ContadorPassagem: String): Integer; cdecl;
    function Elgin_VerificaRecebimentoNaoFiscal(var Recebimentos: String): Integer; cdecl;
    function Elgin_VerificaDepartamentos(Departamentos: String): Integer; cdecl;
    function Elgin_VerificaTipoImpressora(var TipoImpressora: Integer): Integer; cdecl;
    function Elgin_VerificaTotalizadoresParciais(var Totalizadores: String): Integer; cdecl;
    function Elgin_RetornoAliquotas(var Aliquotas: String): Integer; cdecl;
    function Elgin_EstadoImpressora: Integer; cdecl;
    function Elgin_DadosUltimaReducao(var DadosReducao: String): Integer; cdecl;
    function Elgin_MonitoramentoPapel(var Linhas: Integer): Integer; cdecl;
    function Elgin_VerificaIndiceAliquotasIss(Flag: String): Integer; cdecl;
    function Elgin_ValorFormaPagamento(FormaPagamento,  Valor: String): Integer; cdecl;
    function Elgin_ContadoresTotalizadoresNaoSujeitos(var Valor: String): Integer; cdecl;
    function Elgin_Autenticacao: Integer; cdecl;
    function Elgin_ProgramaCaracterAutenticacao(Caracter: String): Integer; cdecl;
    function Elgin_AcionaGaveta: Integer; cdecl;
    function Elgin_VerificaEstadoGaveta(var EstadoGaveta: Integer): Integer; cdecl;
    function Elgin_ProgramaMoedaSingular(MoedaSingular: String): Integer; cdecl;
    function Elgin_ProgramaMoedaPlural(MoedaPlural: String): Integer; cdecl;
    function Elgin_CancelaImpressaoCheque: Integer; cdecl;
    function Elgin_VerificaStatusCheque(var StatusCheque: Integer): Integer; cdecl;
    function Elgin_ImprimeCheque(Banco, Valor, Favorecido, Localidade,
                                Dia, Mes, Ano, Mensagem: String): Integer; cdecl;
    function Elgin_ImprimeChequeBR400(ModoImpressao, Banco, Valor, Favorecido, Localidade,
                                     Dia, Mes, Ano, Mensagem: String): Integer; cdecl;
    function Elgin_LeituraCheque(DadosCheque: String): Integer; cdecl;
    function Elgin_AbrePortaSerial(Porta: String): Integer; cdecl;
    function Elgin_FechaPortaSerial: Integer; cdecl;

{***************** Funcoes internas  ****************}

    function OpenPort(Port: PChar): Integer;
    function WritePort(Cmd: array of integer; Par: String): Integer; overload;
    function WritePort(Cmd: array of integer): Integer; overload
    function ReadPort(var Buffer: String): Integer;
    function ClosePort: Integer;
    function ProcessBuffer(var Value: String; BCD: Boolean = True): Integer; overload;
    function ProcessBuffer(var Value: String; TamItem: Integer; PosBCD: Array of Integer): Integer; overload;
    function ProcessBuffer: Integer; overload;


{***************** Constantes da biblioteca  ****************}

const

  COMs: Array[1..15] of Pchar = ('/dev/ttyS0',  '/dev/ttyS1',  '/dev/ttyS2',  '/dev/ttyS3',
                                 '/dev/ttyS4',  '/dev/ttyS5',  '/dev/ttyS6',  '/dev/ttyS7',
                                 '/dev/ttyS8',  '/dev/ttyS9',  '/dev/ttyS10', '/dev/ttyS11',
                                 '/dev/ttyS12', '/dev/ttyS13', '/dev/ttyS14');
  STX  = #2;
  ETX  = #3;
  ACK  = $06;
  NAK  = $15;
  STATUS = 3;

{***************** Handlers da porta serial  ****************}

var
  ComPort: Integer;
  ComAttr: termios;
  Empty: String;

implementation

Uses ctbematech;

function MakePack(Tamanho: Integer): String; overload;
begin
  Result := StringOfChar(' ', Tamanho);
end;

procedure MakePack(Tamanho: Integer; Valor: Char; var Campo: String); overload;
begin
  Campo := Campo + StringOfChar(Valor, ( Tamanho - Length(Campo) ));
end;

procedure MakePack(Tamanho, CasasDecimais: Integer; Valor: Char; var Campo: String); overload;
var
  Ponto: Integer;
  Inteiro, Decimal: String;
begin
  Ponto := Pos(',', Campo);
  if Ponto > 0 then begin
    Decimal := Copy(Campo, Pos(',', Campo) + 1, CasasDecimais);
    if Length(Decimal) > CasasDecimais then
      Decimal := Copy(Decimal, 1, CasasDecimais);
    if Length(Decimal) < CasasDecimais then
      Decimal := Decimal + StringofChar('0', CasasDecimais - Length(Decimal));
    Inteiro := Copy(Campo, 1, Ponto - 1) ;
    Inteiro := StringofChar(Valor, Tamanho - (CasasDecimais + Length(Inteiro)) ) + Inteiro;
  end else begin
    Decimal := StringOfChar(Valor, CasasDecimais);
    Inteiro := StringOfChar(Valor, Tamanho - (CasasDecimais + (Length(Campo)))) + Campo;
  end;
  Campo := Inteiro + Decimal;
end;

function Clock: Comp;
begin
{$IFDEF LINUX}
  Result := TimeStampToMSecs(DateTimeToTimeStamp(Now));
{$ELSE }
  Result := GetTickCount;
{$ENDIF }
end;

function Elgin_AbreComprovanteNaoFiscalVinculado(FormaPagamento, Valor, NumeroCupom: String): Integer;
begin
  MakePack(14,2,'0',Valor);
  MakePack(16,' ',FormaPagamento);
  WritePort([27,66], FormaPagamento);
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_AbreCupom(CGC_CPF: String): Integer;
begin
  if Trim(CGC_CPF) <> '' then
  begin
    MakePack(29, ' ', CGC_CPF);
    WritePort([27,0], CGC_CPF);
  end
  else
    WritePort([27,0]);
//  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_AbrePortaSerial(Porta: String): Integer;
begin
  Result := OpenPort(PChar(Porta));
end;

function Elgin_FechaPortaSerial: Integer;
begin
  Result := ClosePort;
end;

function Elgin_AcionaGaveta: Integer;
begin
  WritePort([27,22]);
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_Acrescimos(var ValorAcrescimos: String): Integer;
begin
  WritePort([27,35,30]);
  sleep(1500);
  Result := ProcessBuffer(ValorAcrescimos);
end;

function Elgin_AlteraSimboloMoeda(SimboloMoeda: String): Integer;
begin
  WritePort([27,01], SimboloMoeda);
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_AumentaDescricaoItem(Descricao: String): Integer;
begin
  WritePort([27,62,52], Descricao);
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_Autenticacao: Integer;
begin
  WritePort([27,16]);
  sleep(1500);
  Result := ProcessBuffer(Empty);
  Sleep(5000);
end;

function Elgin_CancelaCupom: Integer;
begin
  WritePort([27,14]);
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_CancelaImpressaoCheque: Integer;
begin
  WritePort([27,62,49]);
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_CancelaItemAnterior: Integer;
begin
  WritePort([27,13]);
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_CancelaItemGenerico(NumeroItem: String): Integer;
begin
  MakePack(4, 0, '0', NumeroItem);
  WritePort([27,31], NumeroItem);
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_Cancelamentos(var ValorCancelamentos: String): Integer;
begin
  WritePort([27,35,4]);
  sleep(1500);
  Result := ProcessBuffer(ValorCancelamentos);
end;

function Elgin_CGC_IE(var CGCIE: String): Integer;
begin
  WritePort([27,35,2]);
  sleep(1500);
  Result := ProcessBuffer(CGCIE, False);
end;

function Elgin_ClicheProprietario(var Cliche: String): Integer;
begin
  WritePort([27,35,13]);
  sleep(1500);
  Result := ProcessBuffer(Cliche, False);
end;

function Elgin_ContadorBilhetePassagem(var ContadorPassagem: String): Integer;
begin
  WritePort([27,35,31]);
  sleep(1500);
  Result := ProcessBuffer(ContadorPassagem);
end;

function Elgin_ContadoresTotalizadoresNaoSujeitos(var Valor: String): Integer;
begin
  WritePort([27,35,24]);
  sleep(1500);
  Result := ProcessBuffer(Valor);
end;

function Elgin_ContadorSequencial(var Cupom: String): Integer;
begin
  WritePort([27,35,06]);
  sleep(1500);
  Result := ProcessBuffer(Cupom);
end;

function Elgin_DataHoraImpressora(var DataHora: String): Integer;
begin
  WritePort([27,35,23]);
  sleep(1500);
  Result := ProcessBuffer(DataHora);
end;

function Elgin_ContadoresTotalizadoresNaoFiscais(var Contadores: String): Integer;
begin
  WritePort([27,35,24]);
  sleep(1500);
  Result := ProcessBuffer(Contadores);
end;

function Elgin_DataHoraReducao(var DataHora: String): Integer;
begin
  WritePort([27,35,26]);
  sleep(1500);
  Result := ProcessBuffer(DataHora);
end;

function Elgin_DataMovimento(var Data: String): Integer;
begin
  WritePort([27,35,27]);
  sleep(1500);
  Result := ProcessBuffer(Data);
end;

function Elgin_Descontos(var ValorDescontos: String): Integer;
begin
  WritePort([27,35,5]);
  sleep(1500);
  Result := ProcessBuffer(ValorDescontos);
end;

function Elgin_EfetuaFormaPagamento(FormaPagamento, ValorFormaPagamento, Descricao: String): Integer;
begin
  WritePort([27,72], FormaPagamento + ValorFormaPagamento + Descricao);
// sleep(1500);
  Result := ProcessBuffer(Empty, False);
end;

function Elgin_EspacoEntreLinhas(Dots: Integer): Integer;
begin
  WritePort([27,60], IntToStr(Dots));
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_EstadoImpressora: Integer;
begin
  WritePort([27,19]);
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_DadosUltimaReducao(var DadosReducao: String): Integer; cdecl;
begin
  WritePort([27,62,55]);
  sleep(1500);
  Result := ProcessBuffer(DadosReducao);
end;

function Elgin_FechaComprovanteNaoFiscalVinculado: Integer;
begin
  sleep(1500);
  WritePort([27,21]);
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_FechaCupom(AcrescimoDesconto, ValorAcrescimoDesconto: String; QtdFormasPagto: Integer;
  FormasPagto, Valores, Mensagem: String): Integer;
begin
  MakePack(14, 2, '0', Valores);
  WritePort([27,72], FormasPagto + Valores);
  sleep(1500);
  Result := ProcessBuffer(Empty);
  if (Result = BEMA_OK) or ((Result and $4000) > 0) then begin
    WritePort([27,34], Mensagem);
    sleep(1500);
    Result := ProcessBuffer(Empty);
  end
end;

function Elgin_FechaCupomResumido(FormaPagamento, {Valor, }Mensagem: String): Integer;
begin
  WritePort([27,34], Mensagem);
//  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_FechaRelatorioGerencial: Integer;
begin
  WritePort([27,25]);
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_FlagsFiscais(var Flag: Integer): Integer;
var
  StrFlag: String;
begin
  WritePort([27,35,17]);
//  sleep(1500);
  Result := ProcessBuffer(StrFlag);
  Flag := StrToInt(StrFlag);
end;

function Elgin_GrandeTotal(var GrandeTotal: String): Integer;
begin
  WritePort([27,35,3]);
  sleep(1500);
  Result := ProcessBuffer(GrandeTotal);
end;

function Elgin_ImprimeCheque(Banco, Valor, Favorecido, Localidade, Dia,
  Mes, Ano, Mensagem: String): Integer;
begin
  Result := ProcessBuffer;
end;

function Elgin_ImprimeChequeBR400(ModoImpressao, Banco, Valor, Favorecido, Localidade,
  Dia, Mes, Ano, Mensagem: String): Integer; cdecl;
begin
  Result := ProcessBuffer;
end;

function Elgin_IniciaFechamentoCupom (AcrescimoDesconto, TipoAcrescimoDesconto, ValorAcrescimoDesconto: String): Integer;
begin
//  Sleep(4000);
  WritePort([27,32], AcrescimoDesconto + ValorAcrescimoDesconto);
//  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_LeituraCheque(DadosCheque: String): Integer;
begin
   Result := ProcessBuffer
end;

function Elgin_LeituraMemoriaFiscalData(DataInicial, DataFinal: String): Integer;
begin
  WritePort([27,8], DataInicial + DataFinal + 'I');
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_LeituraMemoriaFiscalSerialData(DataInicial, DataFinal: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_LeituraMemoriaFiscalSerialReducao(ReducaoInicial, ReducaoFinal: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_LeituraX: Integer;
begin
  WritePort([27,6]);
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_LeituraXSerial: Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_LinhasEntreCupons(Linhas: Integer): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_MinutosImprimindo(var Minutos: String): Integer;
begin
  WritePort([27,35,19]);
  sleep(1500);
  Result := ProcessBuffer(Minutos);
end;

function Elgin_MinutosLigada(var Minutos: String): Integer;
begin
  WritePort([27,35,18]);
  sleep(1500);
  Result := ProcessBuffer(Minutos);
end;

function Elgin_MonitoramentoPapel(var Linhas: Integer): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_NomeiaDepartamento(Indice: Integer; Departamento: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_NomeiaTotalizadorNaoSujeitoIcms(Indice: Integer; Totalizador: String): Integer;
begin
  MakePack(19, ' ', Totalizador);
  WritePort([27,40], IntToStr(Indice) + Totalizador);
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_NumeroCaixa(var NumeroCaixa: String): Integer;
begin
  WritePort([27,35,14]);
//  sleep(1500);
  Result := ProcessBuffer(NumeroCaixa);
end;

function Elgin_NumeroCupom(var NumeroCupom: String): Integer;
begin
  WritePort([27,35,6]);
  sleep(1500);
  Result := ProcessBuffer(NumeroCupom);
end;

function Elgin_NumeroCuponsCancelados(var NumeroCancelamentos: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_NumeroIntervencoes(var NumeroIntervencoes: String): Integer;
begin
  WritePort([27,35,10]);
//  sleep(1500);
  Result := ProcessBuffer(NumeroIntervencoes);
end;

function Elgin_NumeroLoja(var NumeroLoja: String): Integer;
begin
  WritePort([27,35,15]);
  sleep(1500);
  Result := ProcessBuffer(NumeroLoja);
end;

function Elgin_NumeroOperacoesNaoFiscais(var NumeroOperacoes: String): Integer;
begin
  WritePort([27,35,7]);
  sleep(1500);
  Result := ProcessBuffer(NumeroOperacoes);
end;

function Elgin_NumeroReducoes(var NumeroReducoes: String): Integer;
begin
  WritePort([27,35,9]);
  sleep(1500);
  Result := ProcessBuffer(NumeroReducoes);
end;

function Elgin_NumeroSerie(var NumeroSerie: String): Integer;
begin
  WritePort([27,35,0]);
//  sleep(1500);
  Result := ProcessBuffer(NumeroSerie, False);
end;

function Elgin_NumeroSubstituicoesProprietario(var NumeroSubstituicoes: String): Integer;
begin
  WritePort([27,35,11]);
  sleep(1500);
  Result := ProcessBuffer(NumeroSubstituicoes);
end;

function Elgin_ProgramaAliquota(Aliquota: String; ICMS_ISS: Integer): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_ProgramaArredondamento: Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_ProgramaCaracterAutenticacao(Caracter: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_ProgramaFormasPagamento(FormasPagto: String; var Indice: Integer): Integer;
var
  strInd: String;
begin
  MakePack(16, ' ', FormasPagto);
  WritePort([27,71], FormasPagto);
  sleep(1500);
  Result := ProcessBuffer(strInd, False);
  Try
    Indice := StrToInt(strInd);
  except
    Indice := 0
  end
end;

function Elgin_ProgramaHorarioVerao: Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_ProgramaMoedaPlural(MoedaPlural: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_ProgramaMoedaSingular(MoedaSingular: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_ProgramaTruncamento: Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_RecebimentoNaoFiscal(IndiceTotalizador, Valor,
  FormaPagamento: String): Integer;
begin
  if Length(IndiceTotalizador) = 1 then
    IndiceTotalizador := '0' + IndiceTotalizador;
  MakePack(14,2,'0',Valor);
  MakePack(16,' ',FormaPagamento);
  WritePort([27,25], IndiceTotalizador + Valor + FormaPagamento);
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_ReducaoZ: Integer;
begin
  WritePort([27,5]);
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_RelatorioGerencial(Texto: String): Integer;
begin
  WritePort([27,20], Texto + #13#10);
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_ResetaImpressora: Integer;
begin
  WritePort([27,70]);
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_RetornoAliquotas(var Aliquotas: String): Integer;
begin
  WritePort([27,26]);
  sleep(1500);
  Result := ProcessBuffer(Aliquotas);
end;

function Elgin_Sangria(Valor: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_SimboloMoeda(SimboloMoeda: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_SubTotal(SubTotal: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_Suprimento(Valor: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_TerminaFechamentoCupom(Mensagem: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_UltimoItemVendido(var NumeroItem: String): Integer;
begin
  WritePort([27,35,12]);
  sleep(1500);
  Result := ProcessBuffer(NumeroItem);
end;

function Elgin_UsaComprovanteNaoFiscalVinculado(Texto: String): Integer;
begin
  WritePort([27,67], Texto);
  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_UsaUnidadeMedida(UnidadeMedida: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_ValorFormaPagamento(FormaPagamento, Valor: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_ValorPagoUltimoCupom(ValorCupom: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_VendeItem(Codigo, Descricao, Aliquota, Quantidade, Valor, Desconto: String): Integer;
begin
  MakePack(13, 0, '0', Codigo);
  MakePack(29, ' ', Descricao);
  if Pos(',', Quantidade) > 0 then
    MakePack(7, 3, '0', Quantidade)
  else
    MakePack(4, 0, '0',  Quantidade);
  MakePack(8, 2, '0', Valor);
  WritePort([27,9], Codigo + Descricao + Aliquota + Quantidade + Valor + Desconto);
//  sleep(1500);
  Result := ProcessBuffer(Empty);
end;

function Elgin_VendeItemDepartamento(Codigo, Descricao, Aliquota,
  ValorUnitario, Quantidade, Acrescimo, Desconto, IndiceDepartamento,
  UnidadeMedida: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_VerificaDepartamentos(Departamentos: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_VerificaEpromConectada(Flag: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_VerificaEstadoGaveta(var EstadoGaveta: Integer): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_VerificaFormaPagamento(FormaPagto: String; var Valor: String): Integer;
begin
  MakePack(16, ' ', FormaPagto);
  WritePort([27,71], FormaPagto);
  sleep(1500);
  Result := ProcessBuffer(Valor, False);
  if Length(Valor) > 2 then
    Delete(Valor, 1, 2);
end;

function Elgin_VerificaIndiceAliquotasIss(Flag: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_VerificaModoOperacao(Modo: string): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_VerificaRecebimentoNaoFiscal(var Recebimentos: String): Integer;
begin
  WritePort([27,35,33]);
  sleep(1500);
  Result := ProcessBuffer(Recebimentos, 31, [2, 12]);
end;

function Elgin_VerificaStatusCheque(var StatusCheque: Integer): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_VerificaTipoImpressora(var TipoImpressora: Integer): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_VerificaTotalizadoresNaoFiscais(var Totalizadores: String): Integer;
begin
  WritePort([27,35,33]);
  sleep(1500);
  Result := ProcessBuffer(Totalizadores)
end;

function Elgin_VerificaTotalizadoresParciais(var Totalizadores: String): Integer;
begin
  WritePort([27,27]);
  sleep(1500);
  Result := ProcessBuffer(Totalizadores);
end;

function Elgin_VerificaTruncamento(Flag: String): Integer;
begin
  Result := ProcessBuffer
end;

function Elgin_VersaoFirmware(var VersaoFirmware: String): Integer;
begin
  WritePort([27,35,1]);
  sleep(1500);
  Result := ProcessBuffer(VersaoFirmware);
end;

{***************** Funcoes internas  ****************}

function OpenPort(Port: PChar): Integer;
var
  tty : PChar;
  NP: Integer;
  Texto: String;
begin
   Texto:=Port;
   NP:= StrToInt(Copy(Texto,4,length(Texto)-3));
   tty:= COMs[NP];
   if tty='' then
    tty := PChar('/dev/ttyS0');
  ComPort := open(tty, O_RDWR or O_NOCTTY or O_NDELAY);
  tcgetattr(ComPort, ComAttr);
  cfmakeraw(ComAttr);//
  with ComAttr do
  begin
//    c_cflag := B9600 or CS8 or CREAD;
    c_cflag := c_cflag or B9600 or CS8 or CRTSCTS;
    c_cflag := c_cflag and (not PARENB);  // incluida
    c_cflag := c_cflag and (not CSTOPB);//incluida
    c_lflag := c_lflag or NOFLSH;
//    c_iflag := IGNBRK;
//    c_oflag := 0;
    c_line  := '0';
    c_cc[VMIN] := '0';
    c_cc[VTIME] := '2';
  end;
  tcsetattr(ComPort, TCSANOW, ComAttr);
  if fcntl(ComPort, F_SETFL, FNDELAY) = -1 then
    raise Exception.Create('Comport: Erro no fcntl: ' + strerror(errno));
  Result := ComPort;
end;

function WritePort(Cmd: array of integer): Integer;
begin
  Result := WritePort(Cmd, '')
end;

function WritePort(Cmd: array of integer; Par: String): Integer;
const
  MAX_SIZE = 450;
var
  CmdSize, BufSize, cnt: Integer;
  Buffer: Array[0..MAX_SIZE] of Byte;
  CheckSum: Word;
begin
  CmdSize := High(Cmd)+1;
  CheckSum := 0;
  if CmdSize = 1 then
    CmdSize := 2;
  for cnt := 0 to CmdSize - 1 do
    Buffer[3+cnt] := Cmd[cnt];
  if Par <> '' then
    Move(Par[1], Buffer[3+CmdSize], Length(Par));
  CmdSize := CmdSize + Length(Par);
  BufSize := CmdSize + 5;
  for cnt := 0 to CmdSize - 1 do
    Inc(CheckSum, Buffer[cnt+3]);
  Inc(CmdSize, 2);
  Buffer[0] := Ord(STX);
  Buffer[1] := Lo(CmdSize);
  Buffer[2] := Hi(CmdSize);
  Buffer[BufSize - 2] := Lo(CheckSum);
  Buffer[BufSize - 1] := Hi(CheckSum);
//  Buffer[BufSize - 1] := Ord(ETX);
//  tcflow(ComPort, TCOON);
//  Result := FileWrite(ComPort, Buffer, BufSize);
  Result := __write(ComPort, Buffer, BufSize);
{  if fcntl(ComPort, F_SETFL, FNDELAY) = -1 then
    raise Exception.Create('Comport: Erro no fcntl: ' + strerror(errno));}
end;

function ReadPort(var Buffer: String): Integer;
const
  MaxTimeout = 30000;
var
  C: Char;//Array[1..4096] of Char;
  TimeOut, TimeOut1: Comp;
//  Cont: Integer;
begin
//  tcflow(ComPort, TCOOFF);
  TimeOut := Clock + MaxTimeout;
  repeat
   Result := __read(ComPort, C, 1);
//   Result := __read(ComPort, C, 4096);
   TimeOut1 := Clock;
   if TimeOut1 > TimeOut then
     Exit
   else if Result = -1 then
     sleep(1000)
//   else if C[1] = #21 then
   else if C = #21 then
     Exit;
//  until C[1] = #6;
  until C = #6;
//  until (C[1] = #6) or (C[1] = #21) or (TimeOut1 > TimeOut);
  if (C = #21) then
    Buffer := C
  else if C = #6 then begin
{    SetLength(Buffer, Result);
    for Cont := 1 to Result do
      Buffer[Cont] := C[Cont];}
    TimeOut := Clock + MaxTimeout;
    TimeOut1 := 0;
    Buffer := C;
    Result := 0;
    while (Result <> -1) and (TimeOut > TimeOut1) do begin
     Result := __read(ComPort, C, 1);
     if Result <> -1 then
       Buffer := Buffer + C;
     TimeOut1 := Clock;
    end;
  end
end;

function ClosePort: Integer;
begin
  Result := __close(ComPort);
end;

function ProcessBuffer(var Value: String; BCD: Boolean = True): Integer;
var
  Buffer: String;
  BufSize, cnt: Integer;
  Flag: Integer;
begin
  Value := '';
  ReadPort(Buffer);
  BufSize := Length(Buffer);
  if BufSize = 0 then
    Result := BEMA_ERR_COMUNICACAO
  else begin
    if BufSize > STATUS then begin
      for cnt := 1 to (BufSize - STATUS) do
        if BCD then begin
          Value := Value + Chr( 48 + (Ord(Buffer[cnt + 1]) shr 4) );
          Value := Value + Chr( 48 + (Ord(Buffer[cnt + 1]) and $F) );
        end else if Buffer[cnt + 1] <> #0 then
          Value := Value + Buffer[cnt + 1];
    end;
    Result := 0;
    if Ord(Buffer[1]) = ACK then begin
      Result := BEMA_OK;
      if BufSize = 3 then begin
        Flag := (Ord(Buffer[BufSize - 1]) shl 8) + Ord(Buffer[BufSize]);
        if Flag > 0 then
          Result := Flag
      end
    end else if Ord(Buffer[1]) = NAK then
      Result := BEMA_ERR_COMUNICACAO
  end;
end;

function ProcessBuffer(var Value: String; TamItem: Integer; PosBCD: Array of Integer): Integer;
var
  Buffer: String;
  BufSize, cnt, PBCD: Integer;
  Flag: Integer;
begin
  PBCD  := 0;
  Value := '';
  ReadPort(Buffer);
  BufSize := Length(Buffer);
  if BufSize = 0 then
    Result := BEMA_ERR_COMUNICACAO
  else begin
    if BufSize > STATUS then begin
      for cnt := 1 to (BufSize - STATUS) do begin
        if (High(PosBCD) >= PBCD) and (((cnt - 1) mod TamItem) < PosBCD[PBCD]) then begin
          Value := Value + Chr( 48 + (Ord(Buffer[cnt + 1]) shr 4) );
          Value := Value + Chr( 48 + (Ord(Buffer[cnt + 1]) and $F) );
        end else 
          Value := Value + Buffer[cnt + 1];
        if (cnt mod TamItem) = 0 then
          PBCD := 0
        else if (High(PosBCD) >= PBCD) and ((cnt mod TamItem) = PosBCD[PBCD]) then
          Inc(PBCD)
      end
    end;
    Result := 0;
    if Ord(Buffer[1]) = ACK then begin
      Result := BEMA_OK;
      if BufSize = 3 then begin
        Flag := (Ord(Buffer[BufSize - 1]) shl 8) + Ord(Buffer[BufSize]);
        if Flag > 0 then
          Result := Flag
      end
    end else if Ord(Buffer[1]) = NAK then
      Result := BEMA_ERR_COMUNICACAO
  end;
end;

function ProcessBuffer: Integer;
begin
  Result := 1;
end;

end.

