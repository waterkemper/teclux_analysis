{********************************************************}
{                                                        }
{                                                        }
{             Classe para acesso a API de                }
{            impressoras fiscais Bematech                }
{                                                        }
{                   Ver 1.0 12/03/2003                   }
{********************************************************}

unit cpecf_bematech;

interface

uses Classes, SysUtils, IniFiles, LibBematech, cpecf;

type

  TtecTotalizadoresBematech = class(TtecTotalizadoresECF)
  protected
    function LerTotalizador(Index: Integer): String; override;
  end;

  TtecECFBematech = class(TtecECF)
  protected
    procedure AtualizarStatus(Codigo: Integer); override;
    function ConverteAliquota(Valor: String): String; override;
    function ConverteFormaPagto(Forma: String): String; override;
  public
    procedure FinalizarImpressora; override;
    procedure IniciarImpressora; override;
    procedure ProgramaFormasPagto; override;
    procedure AbrirGaveta; override;
    procedure Avancar; override;
    procedure IniciarCupom; override;
    procedure CancelarCupom; override;
    procedure PagamentoCupom(FormaPagto, Valor, TipoDesconto, Desconto:String); override;
    procedure FinalizarCupom(FormaPagto, Total, TipoDesconto, Desconto,
                             Mensagem: String); override;
    procedure VenderItem(Codigo, Descricao, Preco, Quantidade, Unidade,
                         Tributo: String; TipoDesconto: Char; Desconto,
                         Filial: String); override;
    procedure CancelarItem(Numero: String); override;
    procedure IniciarVinculado(FormaPagto: String); override;
    procedure ImprimirVinculado(Texto: String); override;
    procedure CancelarVinculado; override;
    procedure FinalizarVinculado; override;
    procedure ImprimirNaoVinculado(Registrador, FormaPagto, Valor, TipoDesconto, Desconto, Msg: String); override;
    procedure LeituraX; override;
    procedure ReducaoZ; override;
    procedure RelatorioGerencial(Texto: String); override;
    procedure FecharRelatorioGerencial; override;
    procedure ApagaDados; override;
    function CGC: String; override;
    function SerieMaquina: String; override;
    function NumeroMaquina: String; override;
    function Cupom: String; override;
    function Intervencao: String; override;
    function Data: String; override;
    function DataReducao: String; override;
    function TotalizadorAcrescimo: String; override;
    function TotalizadorDesconto: String; override;
    function CuponsDoDia: String; override;
  end;

//  TtecECFBematechClass = class of TtecECFBematech;

implementation

{ TtecTotalizadoresBematech }

function TtecTotalizadoresBematech.LerTotalizador(Index: Integer): String;
var
  Tot: String;
begin
  Tot := Preencher(455);
  Bema_VerificaTotalizadoresParciais(Tot);
  {Index funciona como offset da virgula separadora dos totalizadores}
  case Index of
   1: begin
        Result := SuprimirZeros(Copy(Tot, 1, 224));
      end;
   2: begin
        Result := SuprimirZeros(Copy(Tot, 225 + (Index - 1), 14));
      end;
   3: begin
        Result := SuprimirZeros(Copy(Tot, 239 + (Index - 1), 14));
      end;
   4: begin
        Result := SuprimirZeros(Copy(Tot, 253 + (Index - 1), 14));
      end;
   5: begin
      {$IFNDEF LINUX}
        Result := SuprimirZeros(Copy(Tot, 267 + (Index - 1), 126));
      {$ELSE}
        Result := SuprimirZeros(Copy(Tot, 267 + (Index - 1), 14));
      {$ENDIF};
      end;
   6: begin
      {$IFNDEF LINUX}
        Result := SuprimirZeros(Copy(Tot, 393 + (Index - 1), 14));
      {$ELSE}
        Result := SuprimirZeros(Copy(Tot, 281 + (Index - 1), 14));
      {$ENDIF};
      end;
   7: begin
      {$IFNDEF LINUX}
        Result := SuprimirZeros(Copy(Tot, 407 + (Index - 1), 14));
      {$ELSE}
        Result := SuprimirZeros(Copy(Tot, 295 + (Index - 1), 14));
      {$ENDIF};
      end;
   8: begin
      {$IFNDEF LINUX}
        Result := SuprimirZeros(Copy(Tot, 421 + (Index - 1), 18));
      {$ELSE}
        Result := SuprimirZeros(Copy(Tot, 309 + (Index - 1), 14));
      {$ENDIF};
      end;
  end;
end;

{ TtecECFBematech }

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Metodos de Inicializacao e Finalizacao
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

procedure TtecECFBematech.FinalizarImpressora;
begin
  Bema_FechaPortaSerial;
end;

procedure TtecECFBematech.IniciarImpressora;
var
  ParamsFile: TMemIniFile;
begin
  BematechLoadLib;
  Self.Totalizadores := TtecTotalizadoresBematech.Create;
  { Extrai parametros Tecsoft incluidos no arquivo 'ini' da impressora }
  ParamsFile := TMemIniFile.Create(INI_PATH + INI_FILE);
  try
    ParamsFile.ReadSectionValues('TECSOFT', Self.Params);
  finally
    ParamsFile.Free;
  end;
{$IFNDEF LINUX}
  Self.AtualizarStatus(Bema_AbrePortaSerial);
{$ELSE}
  Self.AtualizarStatus(Bema_AbrePortaSerial('COM1'));
{$ENDIF}
end;

procedure TtecECFBematech.ProgramaFormasPagto;
begin
  {$IFNDEF LINUX}
  //
  {$ELSE}
   Bema_ProgramaFormasPagamento('');
  {$ENDIF}
end;

{~~~~~~~~~~~~~~~~~~~~~~~
  Metodos de Impressora
~~~~~~~~~~~~~~~~~~~~~~~~}

procedure TtecECFBematech.AbrirGaveta;
begin
  Self.AtualizarStatus(Bema_AcionaGaveta);
end;

procedure TtecECFBematech.Avancar;
begin
end;

function TtecECFBematech.ConverteAliquota(Valor: String): String;
begin
  Result := Valor;
end;

function TtecECFBematech.ConverteFormaPagto(Forma: String): String;
begin
  Result := Forma;
end;

function TtecECFBematech.SerieMaquina: String;
begin
  Result := Preencher(15);
  Self.AtualizarStatus(Bema_NumeroSerie(Result));
end;

function TtecECFBematech.NumeroMaquina: String;
begin
end;

function TtecECFBematech.Cupom: String;
begin
  Result := Preencher(6);
  Self.AtualizarStatus(Bema_NumeroCupom(Result));
end;

function TtecECFBematech.Intervencao: String;
begin
  Result := Preencher(4);
  Self.AtualizarStatus(Bema_NumeroIntervencoes(Result));
end;

function TtecECFBematech.Data: String;
var
  Data, Hora: String;
begin
{$IFNDEF LINUX}
   Data := Preencher(6);
   Hora := Preencher(6);
   Self.AtualizarStatus(Bema_DataHoraImpressora(Data, Hora));
   Result := Copy(Data,0,2) + '/' + Copy(Data,3,2) + '/' + Copy(Data,5,2) + ' '
           + Copy(Hora,0,2) + ':' + Copy(Hora,3,2) + ':' + Copy(Hora,5,2);
{$ELSE}
   Self.AtualizarStatus(Bema_DataHoraImpressora(Data));
   Result := Data;
{$ENDIF};
end;

function TtecECFBematech.DataReducao: String;
var
  Data, Hora: String;
begin
{$IFNDEF LINUX}
   Data := Preencher(6);
   Hora := Preencher(6);
   Self.AtualizarStatus(Bema_DataHoraReducao(Data, Hora));
   Result := Copy(Data,0,2) + '/' + Copy(Data,3,2) + '/' + Copy(Data,5,2) + ' '
           + Copy(Hora,0,2) + ':' + Copy(Hora,3,2) + ':' + Copy(Hora,5,2);
{$ELSE}
   Self.AtualizarStatus(Bema_DataHoraReducao(Data));
   Result := Data;
{$ENDIF};
end;

function TtecECFBematech.CGC: String;
var
  CGC, IE: String;
begin
{$IFNDEF LINUX}
  CGC := Preencher(18);
  IE := Preencher(15);
  Self.AtualizarStatus(Bema_CGC_IE(CGC, IE));
  Result := CGC;
{$ELSE}
  Self.AtualizarStatus(Bema_CGC_IE(Result));
{$ENDIF};
end;

function TtecECFBematech.CuponsDoDia: String;
begin
end;

function TtecECFBematech.TotalizadorAcrescimo: String;
begin
end;

function TtecECFBematech.TotalizadorDesconto: String;
begin
end;

procedure TtecECFBematech.ApagaDados;
begin
end;

procedure TtecECFBematech.AtualizarStatus(Codigo: Integer);
begin
  Erro := Codigo <> BEMA_OK;
  case Codigo of
    BEMA_OK                             : Self.Mensagem := 'Comando executado com sucesso';
    BEMA_ERR_COMUNICACAO                : Self.Mensagem := 'Erro de comunicação';
    BEMA_ERR_FUNCAO                     : Self.Mensagem := 'Erro de execução na função';
    BEMA_ERR_PARAMETRO                  : Self.Mensagem := 'Parâmetro inválido';
    BEMA_ERR_ALIQUOTA_NAO_PROGRAMADA    : Self.Mensagem := 'Alíquota não programada';
    BEMA_ERR_CONFIG                     : Self.Mensagem := 'Arquivo BemaFI32.INI não encontrado';
    BEMA_ERR_READSER                    : Self.Mensagem := 'Erro ao abrir a porta de comunicação';
    BEMA_IMPRESSORA_DESLIGADA           : Self.Mensagem := 'Impressora desligada ou desconectada';
    BEMA_ERR_BANCO_NAO_CADASTRADO       : Self.Mensagem := 'Banco não cadastrado no arquivo BemaFI32.ini';
    BEMA_ERR_CRIAR_ARQUIVO              : Self.Mensagem := 'Erro ao criar ou gravar no arquivo Retorno.txt ou mensagem.txt';
    BEMA_ERR_ABRIR_ARQUIVO              : Self.Mensagem := 'Não foi possível abrir arquivo INTPOS.001';
    BEMA_ERR_PARAMETROS_DIFERENTES      : Self.Mensagem := 'Parâmetros diferentes';
    BEMA_MSG_TRANSACAO_ENCERRADA        : Self.Mensagem := 'Transação cancelada pelo operador';
    BEMA_MSG_TRANSACAO_NAO_APROVADA     : Self.Mensagem := 'A transação não foi aprovada';
    BEMA_MSG_IMPRESSAO_NAO_TERMINADA    : Self.Mensagem := 'Não foi possível terminar a impressão';
    BEMA_MSG_OPERACAO_NAO_TERMINADA     : Self.Mensagem := 'Não foi possível terminar a operação';
    BEMA_ERR_FORMAPAGTO_NAO_PROGRAMADA  : Self.Mensagem := 'Forma de pagamento não programada';
    BEMA_ERR_TOTALIZADOR_NAO_PROGRAMADO : Self.Mensagem := 'Totalizador não fiscal não programado';
    BEMA_ERR_TRANSACAO_EFETUADA         : Self.Mensagem := 'Transação já efetuada';
    BEMA_ERR_NENHUMA_INFORMACAO         : Self.Mensagem := 'Não há informações para serem impressas';
  end;
end;

{~~~~~~~~~~~~~~~~~~~~~~~
 Metodos de Cupom Fiscal
~~~~~~~~~~~~~~~~~~~~~~~~}

procedure TtecECFBematech.IniciarCupom;
begin
  Self.AtualizarStatus(Bema_AbreCupom(''));
end;

procedure TtecECFBematech.CancelarCupom;
begin
  Self.AtualizarStatus(Bema_CancelaCupom);
end;

procedure TtecECFBematech.PagamentoCupom(FormaPagto, Valor, TipoDesconto, Desconto: String);
begin
{$IFNDEF LINUX}
  Self.AtualizarStatus(Bema_EfetuaFormaPagamento(FormaPagto, Valor));
{$ELSE}
  Self.AtualizarStatus(Bema_EfetuaFormaPagamento(FormaPagto, Valor, ''));
{$ENDIF};
end;

procedure TtecECFBematech.FinalizarCupom(FormaPagto, Total, TipoDesconto, Desconto,
  Mensagem: String);
var
  APIResult: Integer;
  AcresDesc: Char;
  Valor: String;
begin
  Valor := Desconto;
{$IFNDEF LINUX}
  if StrToInt(Valor) < 0 then
    AcresDesc := 'D'
  else
    AcresDesc := 'A';
  APIResult := Bema_FechaCupom(FormaPagto, AcresDesc, TipoDesconto,
                               Desconto, Total, Mensagem);
{$ELSE}
  if (TipoDesconto = '%') and (StrToInt(Valor) < 0) then
    AcresDesc := 'D'
  else
  if (TipoDesconto = '$') and (StrToInt(Valor) < 0) then
    AcresDesc := 'd'
  else
  if (TipoDesconto = '%') and (StrToInt(Valor) >= 0) then
    AcresDesc := 'A'
  else
    AcresDesc := 'a';
  APIResult := Bema_FechaCupom(AcresDesc, Desconto, 1, FormaPagto, Total, Mensagem);
{$ENDIF}
  Self.AtualizarStatus(APIResult);
end;

procedure TtecECFBematech.VenderItem(Codigo, Descricao, Preco, Quantidade,
  Unidade, Tributo: String; TipoDesconto: Char; Desconto, Filial: String);
var
  Decimais, APIResult: Integer;
  TipoQtd: Char;
begin
{$IFNDEF LINUX}
  Decimais := 2;
  if Pos(',', Quantidade) > 0 then
   TipoQtd := 'F'
  else
   TipoQtd := 'I';
  APIResult := Bema_VendeItem(Codigo, Descricao, Tributo, TipoQtd, Quantidade,
                              Decimais, Preco, TipoDesconto, Desconto);
{$ELSE}
  APIResult := Bema_VendeItem(Codigo, Descricao, Tributo, Quantidade,
                              Preco, Desconto);
{$ENDIF}
  Self.AtualizarStatus(APIResult);
end;

procedure TtecECFBematech.CancelarItem(Numero: String);
begin
  Self.AtualizarStatus(Bema_CancelaItemGenerico(Numero));
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Metodos de Operaçoes Não Fiscais
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

procedure TtecECFBematech.IniciarVinculado(FormaPagto: String);
begin
  Self.AtualizarStatus(Bema_AbreComprovanteNaoFiscalVinculado(FormaPagto, '', ''));
end;

procedure TtecECFBematech.CancelarVinculado;
begin
end;

procedure TtecECFBematech.ImprimirVinculado(Texto: String);
begin
  Self.AtualizarStatus(Bema_UsaComprovanteNaoFiscalVinculado(Texto));
end;

procedure TtecECFBematech.FinalizarVinculado;
begin
  Self.AtualizarStatus(Bema_FechaComprovanteNaoFiscalVinculado);
end;

procedure TtecECFBematech.ImprimirNaoVinculado(Registrador, FormaPagto, Valor, TipoDesconto, Desconto, Msg: String);
var
  Calc: String;
  IntValor, IntDesconto: Integer;
begin
  IntValor := StrToInt(Valor);
  IntDesconto := StrToInt(Desconto);
  if TipoDesconto = '$' then
    Calc := IntToStr(IntValor + IntDesconto)
  else
    Calc := FloatToStr( IntValor + (IntValor * IntDesconto) / 100);
  Self.AtualizarStatus(Bema_NomeiaTotalizadorNaoSujeitoIcms(10, 'Nao Vinculado'));
  Self.AtualizarStatus(Bema_RecebimentoNaoFiscal('10', Calc, FormaPagto));
end;


{~~~~~~~~~~~~~~~~~~~~~~~
 Metodos de Relatorios
~~~~~~~~~~~~~~~~~~~~~~~~}

procedure TtecECFBematech.ReducaoZ;
begin
{$IFNDEF LINUX}
  Self.AtualizarStatus(Bema_ReducaoZ(DateToStr(Date), DateToStr(Time)));
{$ELSE}
  Self.AtualizarStatus(Bema_ReducaoZ);
{$ENDIF};
end;

procedure TtecECFBematech.LeituraX;
begin
  Self.AtualizarStatus(Bema_LeituraX);
end;

procedure TtecECFBematech.RelatorioGerencial(Texto: String);
begin
  Self.AtualizarStatus(Bema_RelatorioGerencial(Texto));
end;

procedure TtecECFBematech.FecharRelatorioGerencial;
begin
  Self.AtualizarStatus(Bema_FechaRelatorioGerencial);
end;

initialization
  RegisterClasses([TtecECFBematech]);
end.
