{********************************************************}
{                                                        }
{                                                        }
{          Classe abstrata para acesso a API de          }
{                  impressoras fiscais                   }
{                                                        }
{                   Ver 1.0 12/03/2003                   }
{********************************************************}

unit clecf_daruma;

interface

uses
  //CLX
  Classes, SysUtils,
  //Biblio
  clecf;

type

  TtecECFDaruma = class(TtecECF)
//  protected
//    function AtualizarStatus(Codigo: Integer): Integer; override;
  public
(*    constructor Create; override;
    function  CupomAberto: Boolean; override;
    procedure ProgramaFormasPagto; override;
    procedure AbrirGaveta; override;
    procedure FinalizarImpressora; override;
    procedure IniciarCupom(CGC_CPF, Nome, Endereco: String); override;
*)
    procedure IniciarImpressora(Porta: String); override;
(*    procedure CancelarCupom; override;
*)
    procedure PagamentoCupom(FormaPagto, Valor: String); override;
(*    procedure TotalizaCupom(TipoDesconto, Desconto: String); override;
    procedure FinalizarCupom(FormaPagto, Total, Mensagem: String);override;
    procedure VenderItem(Codigo, Descricao, Preco, Quantidade, Unidade,
                         Tributo: String; TipoDesconto: Char; Desconto,
                         Filial: String; TipoTributo: TtecTributo); override;

    procedure CancelarItem(Numero: String); override;
*)
    procedure IniciarVinculado(FormaPagto, Valor, Cupom: String); override;
(*
    procedure ImprimirVinculado(Texto: array of String); override;
    procedure CancelarVinculado; override;
    procedure FinalizarVinculado; override;
//    procedure ImprimirNaoVinculado(Registrador, FormaPagto, Valor, TipoDesconto, Desconto, Msg: String); overload; override;
    procedure ImprimirNaoVinculado(Registrador, FormaPagto, Valor: String); overload; override;
    procedure Autenticar; override;
    procedure LeituraX; override;
    procedure ReducaoZ; override;
    procedure RelatorioGerencial(Texto: array of String); override;
    procedure FecharRelatorioGerencial; override;
    function CGC: String; override;
    function SerieMaquina: String; override;
    function NumeroMaquina: String; override;
    function Cupom: String; override;
    function Intervencao: String; override;
    function Data: String; override;
//    function DataReducao: String; override;
    function TotalizadorAcrescimo: String; override;
    function TotalizadorDesconto: String; override;
//    function CuponsDoDia: String; override;
    function GerarMapa: TtecMapaECF; override;
    procedure LerAliquotasDaECF; override;
    procedure LerFormasPagamento; override;
//    function FechaRelatorioXouZ: Integer; override;
    procedure LeituraMemoriaFiscalData(DataInicial, DataFinal: String); override;
    procedure LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal: String); override;
*)
  end;

implementation

(*
Uses
  ctdaruma, bbecf_daruma;
)*
{ TtecECFDaruma }
(*
procedure TtecECFDaruma.AbrirGaveta;
begin
  inherited;
//  AtualizarStatus(Daruma_AcionaGaveta)
end;

function TtecECFDaruma.AtualizarStatus(Codigo: Integer): Integer;
var
  CodErro: Integer;
  Ack, ST1, ST2: Integer;

begin
  Erro := Codigo <> DARUMA_OK;
  FMensagem := '';
  if Codigo = DARUMA_ERR_COMUNICACAO then begin
    FMensagem := 'Impressora não responde.';
    Result := Codigo;
  end else if Erro then begin
    Codigo := Daruma_RetornoImpressora(Ack, ST1, ST2);
    if (Codigo = DARUMA_ERR_COMUNICACAO) or (Ack = NAK) then
      FMensagem := 'Impressora não responde.'
    else
      Codigo := (ST1 and 255) shl 8 + (ST2 and 255);
    Result := Codigo;
    Erro := Codigo <> 0;
    if Codigo = 0 then
      FMensagem := 'Comando executado com sucesso';
{ST1}
    CodErro := Codigo shr 8;
    if CodErro and DARUMA_ERR_NROPARAMETROSINVALIDO = DARUMA_ERR_NROPARAMETROSINVALIDO then
      FMensagem := FMensagem + 'Número de parâmetros de Comando inválido.' + #13#10;
    if CodErro and DARUMA_ERR_CUPOMABERTO = DARUMA_ERR_CUPOMABERTO then
      FMensagem := FMensagem + 'Cupom aberto' + #13#10;
    if CodErro and DARUMA_ERR_COMANDOINEXISTENTE = DARUMA_ERR_COMANDOINEXISTENTE then
      FMensagem := FMensagem + 'Comando inexistente' + #13#10;
    if CodErro and DARUMA_ERR_PRIMEIROCODIGODIFEREDEESC = DARUMA_ERR_PRIMEIROCODIGODIFEREDEESC then
      FMensagem := FMensagem + 'Primeiro dado de Comando não foi ESC (1BH)' + #13#10;
    if CodErro and DARUMA_ERR_IMPRESSORACOMERRO = DARUMA_ERR_IMPRESSORACOMERRO then
      FMensagem := FMensagem + 'Impressora com erro' + #13#10;
    if CodErro and DARUMA_ERR_ERRONORELOGIO = DARUMA_ERR_ERRONORELOGIO then
      FMensagem := FMensagem + 'Erro no relógio' + #13#10;
    if CodErro and DARUMA_ERR_POUCOPAPEL = DARUMA_ERR_POUCOPAPEL then begin
      FMensagem := FMensagem + 'Pouco papel' + #13#10;
      if Codigo = DARUMA_ERR_POUCOPAPEL then
        Erro := False
    end;
    if CodErro and DARUMA_ERR_FIMPAPEL = DARUMA_ERR_FIMPAPEL then
      FMensagem := FMensagem + 'Fim de papel' + #13#10;
{ST2}
    CodErro := Codigo and 255;
    if CodErro and DARUMA_ERR_COMANDONAOEXECUTADO = DARUMA_ERR_COMANDONAOEXECUTADO then
      FMensagem := FMensagem + 'Comando não executado.' + #13#10;
    if CodErro and DARUMA_ERR_CGCIENAOPROGRAMADO = DARUMA_ERR_CGCIENAOPROGRAMADO then
      FMensagem := FMensagem + 'CGC/IE do proprietário não programados.' + #13#10;
    if CodErro and DARUMA_ERR_CANCELAMENTONAOPERMITIDO = DARUMA_ERR_CANCELAMENTONAOPERMITIDO then
      FMensagem := FMensagem + 'Cancelamento não permitido.' + #13#10;
    if CodErro and DARUMA_ERR_NROALIQLOTADA = DARUMA_ERR_NROALIQLOTADA then
      FMensagem := FMensagem + 'Capacidade de alíq. programáveis lotada.' + #13#10;
    if CodErro and DARUMA_ERR_ALIQUOTANAOPROGRAMADA = DARUMA_ERR_ALIQUOTANAOPROGRAMADA then
      FMensagem := FMensagem + 'Alíquota não programada.' + #13#10;
    if CodErro and DARUMA_ERR_ERRORAMCMOS = DARUMA_ERR_ERRORAMCMOS then
      FMensagem := FMensagem + 'Erro na Memória RAM CMOS Não Volátil.' + #13#10;
    if CodErro and DARUMA_ERR_MEMORIAFISCALCHEIA = DARUMA_ERR_MEMORIAFISCALCHEIA then
      FMensagem := FMensagem + 'Memória Fiscal lotada.' + #13#10;
    if CodErro and DARUMA_ERR_TIPOPARAMETROINVALIDO = DARUMA_ERR_TIPOPARAMETROINVALIDO then
      FMensagem := FMensagem + 'Tipo de parâmetro de Comando inválido.' + #13#10;
    Delete(FMensagem, Length(FMensagem), 6);
  end else
    Result := 0;
end;

procedure TtecECFDaruma.Autenticar;
begin
  inherited;
//  AtualizarStatus(Daruma_Autenticacao);
end;

procedure TtecECFDaruma.CancelarCupom;
begin
  inherited;
//  AtualizarStatus(Daruma_CancelaCupom)
end;

procedure TtecECFDaruma.CancelarItem(Numero: String);
begin
  if StrToInt(Numero) < 1 then
    Numero := '1'
  else
  if StrToInt(Numero) > 100 then
    Numero := '100';
//  AtualizarStatus(Daruma_CancelaItemGenerico(Numero));
end;

procedure TtecECFDaruma.CancelarVinculado;
begin

end;

function TtecECFDaruma.CGC: String;
var
  CGC: String;
  IE: String;
begin
  CGC := Preencher(18);
  IE := Preencher(15);
//  AtualizarStatus(Daruma_CGC_IE(CGC, IE));
  Result := CGC;
end;

constructor TtecECFDaruma.Create;
begin
  inherited;
  DarumaLoadLib;
  Daruma_Registry_StatusFuncao('1');
  Daruma_Registry_AlteraRegistry('IgnoraCupomAberto', '1');
end;

function TtecECFDaruma.Cupom: String;
begin
  SetLength(Result, 6);
//  AtualizarStatus(Daruma_NumeroCupom(Result));
  if not CupomAberto then
    Result := inttostr(strtoint(result) - 1);
end;

function TtecECFDaruma.CupomAberto: Boolean;
var
  Str: String;
begin
  SetLength(Str, 2);
//  AtualizarStatus(Daruma_StatusCupomFiscal(Str));
  Result := Not Erro and (Trim(Str) = '1')
end;

function TtecECFDaruma.CuponsDoDia: String;
begin

end;

function TtecECFDaruma.Data: String;
var
  Hora: String;
begin
  SetLength(Result, 6);
  SetLength(Hora, 6);
//  AtualizarStatus(Daruma_DataHoraImpressora(Result, Hora))
end;

function TtecECFDaruma.DataReducao: String;
var
  Hora: String;
begin
  SetLength(Result, 6);
  SetLength(Hora, 6);
  AtualizarStatus(Daruma_DataHoraReducao(Result, Hora))
end;

function TtecECFDaruma.FechaRelatorioXouZ: Integer;
begin
  inherited;
  Result := AtualizarStatus(Daruma_FechaRelatorioGerencial);
end;

procedure TtecECFDaruma.FecharRelatorioGerencial;
var
  Str_Informacao: String;
begin
  SetLength (Str_Informacao,2);
//  AtualizarStatus(Daruma_StatusRelatorioGerencial(Str_Informacao));
  if Not Erro and (Trim(Str_Informacao) = '1') then
//    AtualizarStatus(Daruma_FechaRelatorioGerencial)
end;

procedure TtecECFDaruma.FinalizarCupom(FormaPagto, Total, Mensagem: String);
begin
  inherited;
  if Mensagem = '' then
    Mensagem := ' '; //Esta sendo usado assim para evitar um erro na DLL
//  AtualizarStatus(Daruma_TerminaFechamentoCupom(Mensagem))
end;

procedure TtecECFDaruma.FinalizarImpressora;
begin
  inherited;

end;

procedure TtecECFDaruma.FinalizarVinculado;
begin
  inherited;
//  AtualizarStatus(Daruma_FechaComprovanteNaoFiscalVinculado)
end;

procedure TtecECFDaruma.ImprimirNaoVinculado(Registrador, FormaPagto,
  Valor, TipoDesconto, Desconto, Msg: String);
begin
  inherited;

end;

function TtecECFDaruma.GerarMapa: TtecMapaECF;
begin

end;

procedure TtecECFDaruma.ImprimirNaoVinculado(Registrador, FormaPagto, Valor: String);
var
  Maior, Ind: Integer;
  Indice: String;

begin
  Ind := IndiceRecebimentoNaoFiscal(Registrador, Maior);
  if Ind = -1 then begin
//    AtualizarStatus(Daruma_NomeiaTotalizadorNaoSujeitoIcms(Maior, Registrador));
    if Not Erro then begin
      SetLength(FRecebimentosNaoFiscais, High(FRecebimentosNaoFiscais) + 2);
      FRecebimentosNaoFiscais[High(FRecebimentosNaoFiscais)] := Registrador;
      Ind := Maior;
    end
  end;
  if Ind > -1 then begin
    Indice := IntToStr(Ind);
//    AtualizarStatus(Daruma_RecebimentoNaoFiscal(Indice, Valor, FormaPagto));
  end
end;

procedure TtecECFDaruma.ImprimirVinculado(Texto: array of String);
var
  a: Integer;
begin
  for a := 0 to High(Texto) do begin
    AtualizarStatus(Daruma_UsaComprovanteNaoFiscalVinculado(Texto[a]));
    if Erro then
      break
  end
end;

procedure TtecECFDaruma.IniciarCupom(CGC_CPF, Nome, Endereco: String);
begin
//  inherited;
//  AtualizarStatus(Daruma_AbreCupom(CGC_CPF));
  if (CGC_CPF <> '') and (Nome <> '') and (Endereco <> '') then
    ACBrECF1.AbreCupom(CGC_CPF, Nome, Endereco)
  else
    ACBrECF1.AbreCupom('', '', '');
end;
*)
procedure TtecECFDaruma.IniciarImpressora(Porta: String);
begin
//  ECFPadrao.Modelo := 2;
  inherited IniciarImpressora(Porta);
end;

procedure TtecECFDaruma.IniciarVinculado(FormaPagto, Valor, Cupom: String);
begin
  FormaPagto := ConverteFormaPagto(FormaPagto,1);
  inherited IniciarVinculado(FormaPagto,Valor,Cupom);
//  AtualizarStatus(Daruma_AbreComprovanteNaoFiscalVinculado(FormaPagto, Valor, Cupom))
end;
(*
function TtecECFDaruma.Intervencao: String;
begin
  SetLength(Result, 4);
  AtualizarStatus(Daruma_NumeroIntervencoes(Result))
end;

procedure TtecECFDaruma.LeituraX;
begin
  inherited;
  AtualizarStatus(Daruma_LeituraX)
end;

procedure TtecECFDaruma.LerAliquotasDaECF;
var
  Aliquotas: String;
  a: Integer;
begin
  SetLength(Aliquotas, 79);
  AtualizarStatus(Daruma_RetornoAliquotas(Aliquotas));
  Aliquotas := Trim(Aliquotas);
  if Not Erro then begin
    a := 0;
    repeat
      SetLength(FAliquotas, a + 1);
      FAliquotas[a] := Copy(Aliquotas, 1, 4);
      Inc(a);
      Delete(Aliquotas, 1, 5);
    until Aliquotas = '';
  end
end;

procedure TtecECFDaruma.LerFormasPagamento;
var
  Recebimento,
  FormasPag,
  FormPag: String;
  a, b: Integer;

  procedure MontaRecebimentosNaoFiscal;
  var
    Str: String;
    Count: Integer;
  begin
    Count  := 0;
    while Recebimento <> '' do begin
      Str := ANSIUpperCase(Trim(Copy(Recebimento, 25, 19)));
      if Str = '' then
        break
      else begin
        SetLength(FRecebimentosNaoFiscais, Count + 1);
        FRecebimentosNaoFiscais[Count] := Str;
        Inc(Count);
      end;
      Delete(Recebimento, 1, 44);
    end;
  end;

begin
  SetLength(FormasPag, 1027);
  AtualizarStatus(Daruma_VerificaFormasPagamento(FormasPag));
  if Not Erro then begin
    a := 0;
    repeat
      FormPag := Trim(Copy(FormasPag, 1, 16));
      if FormPag <> '' then begin
        SetLength(FFormasPagamento, a+1);
        FFormasPagamento[a] := FormPag;
        Inc(a);
      end;
      Delete(FormasPag, 1, 57);
    until FormasPag = '';
    for a := Low(ECF_FORMA_PAGTO) to High(ECF_FORMA_PAGTO) do begin
      for b := Low(FFormasPagamento) to High(FFormasPagamento) do
        if ECF_FORMA_PAGTO[a] = FFormasPagamento[b] then
          break;
      if b > High(FFormasPagamento) then begin
        AtualizarStatus(Daruma_ProgramaFormasPagamento(ECF_FORMA_PAGTO[a]));
        if Not Erro then begin
          SetLength(FFormasPagamento, High(FFormasPagamento)+2);
          FFormasPagamento[High(FFormasPagamento)] := ECF_FORMA_PAGTO[a];
        end
      end
    end;
    if Not Erro then begin
      SetLength(Recebimento, 2200);
      AtualizarStatus(Daruma_VerificaRecebimentoNaoFiscal(Recebimento));
      MontaRecebimentosNaoFiscal;
    end;
  end
end;

function TtecECFDaruma.NumeroMaquina: String;
begin
  SetLength(Result, 4);
  AtualizarStatus(Daruma_NumeroCaixa(Result))
end;
*)
procedure TtecECFDaruma.PagamentoCupom(FormaPagto, Valor: String);
begin
(*  inherited;
  AtualizarStatus(Daruma_EfetuaFormaPagamento(FormaPagto, Valor));
*)
  FormaPagto := ConverteFormaPagto(FormaPagto,1);
  inherited PagamentoCupom(FormaPagto,Valor);
end;
(*
procedure TtecECFDaruma.ProgramaFormasPagto;
var
  cnt: Integer;
  Forma: String;
begin
  for cnt := Low(ECF_FORMA_PAGTO) to High(ECF_FORMA_PAGTO) do begin
    Forma := ECF_FORMA_PAGTO[cnt];
    AtualizarStatus(Daruma_ProgramaFormasPagamento(Forma));
    if Erro then
      break
  end;
end;

procedure TtecECFDaruma.ReducaoZ;
begin
  inherited;      
  AtualizarStatus(Daruma_ReducaoZ(' ',' '))
end;

procedure TtecECFDaruma.RelatorioGerencial(Texto: array of String);
var
  a: Integer;
begin
  for a := 0 to High(Texto) do begin
    AtualizarStatus(Daruma_RelatorioGerencial(Texto[a]));
    if Erro then
      break;
  end
end;

function TtecECFDaruma.SerieMaquina: String;
var
  Str: String;
begin
  SetLength(Str, 15);
  AtualizarStatus(Daruma_NumeroSerie(Str));
  Result := Str;
end;

procedure TtecECFDaruma.TotalizaCupom(TipoDesconto, Desconto: String);
var
  TipoDesc, AcresDesc: String;
  PosVirg: Integer;
begin
  if StrToFloat(Desconto) <= 0 then
    AcresDesc := 'D'
  else
    AcresDesc := 'A';
  if TipoDesconto = '%' then
    TipoDesc := '%'
  else
    TipoDesc := '$';
  PosVirg := Pos(',', Desconto);
  if PosVirg = 0 then
    Desconto := Desconto + ',00'
  else if PosVirg + 1 = Length(Desconto) then
    Desconto := Desconto + ',0';
  AtualizarStatus(Daruma_IniciaFechamentoCupom(AcresDesc, TipoDesc, Desconto));
end;

function TtecECFDaruma.TotalizadorAcrescimo: String;
begin

end;

function TtecECFDaruma.TotalizadorDesconto: String;
begin
  SetLength(Result, 14);
  AtualizarStatus(Daruma_Descontos(Result))
end;

procedure TtecECFDaruma.VenderItem(Codigo, Descricao, Preco, Quantidade,
  Unidade, Tributo: String; TipoDesconto: Char; Desconto, Filial: String;
  TipoTributo: TtecTributo);
var
 ITributo: String;
begin
  inherited;
  case TipoTributo of
    tbNTributado: ITributo := 'NN';
    tbIsento:     ITributo := 'II';
    tbSubstitui:  ITributo := 'FF';
    tbServico:    ITributo := 'I' + ConverteAliquota(Tributo);
  else
    ITributo := ConverteAliquota(Tributo);
  end;
  AtualizarStatus(Daruma_VendeItem(Codigo, Descricao, ITributo, 'F', Quantidade, 3, Preco, TipoDesconto, Desconto));

end;

procedure TtecECFDaruma.LeituraMemoriaFiscalData(DataInicial, DataFinal: String);
begin
  AtualizarStatus(Daruma_LeituraMemoriaFiscalData(DataInicial, DataFinal));
end;

procedure TtecECFDaruma.LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal: String);
begin
  AtualizarStatus(Daruma_LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal));
end;
*)
end.

