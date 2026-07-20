unit clecf_elgin;

interface

uses
  //CLX
  Classes, SysUtils, IniFiles,
  //Componentes
  {bbecf_elgin, }clecf;

type

  TtecTotalizadoresElgin = class(TtecTotalizadoresECF)
  protected
    function LerTotalizador(Index: Integer): String; override;
  end;

  TtecECFElgin = class(TtecECF)
(*  protected
    function AtualizarStatus(Codigo: Integer): Integer; override;
    function ConverteAliquota(Valor: String): String; override;
    function ConverteFormaPagto(Valor: String; IndInicial: Integer): String; override;
    function VerificaFormasPagamento: Integer;

{$IFDEF MSWINDOWS}
    function RetornoImpressora(iCodErro: Integer; strErroMsg: String): Integer;
{$ENDIF}
*)
  public
(*    function  CupomAberto: Boolean; override;
    procedure FinalizarImpressora; override;
*)
    procedure IniciarImpressora(Porta: String); override;
(*
    procedure ProgramaFormasPagto; override;
    procedure AbrirGaveta; override;
    procedure IniciarCupom(CGC_CPF, Nome, Endereco: String); override;
*)
    procedure CancelarCupom; override;
    procedure PagamentoCupom(FormaPagto, Valor:String); override;
(*
    procedure TotalizaCupom(TipoDesconto, Desconto: String); override;
*)
    procedure FinalizarCupom(FormaPagto, Total, Mensagem: String); override;
(*
    procedure VenderItem(Codigo, Descricao, Preco, Quantidade, Unidade,
                         Tributo: String; TipoDesconto: Char; Desconto,
                         Filial: String; TipoTributo: TtecTributo); override;
    procedure AumentarDescricaoItem(descricao: String); override;
    procedure CancelarItem(Numero: String); override;
*)
    procedure IniciarVinculado(FormaPagto, Valor, Cupom: String); override;
(*
    procedure ImprimirVinculado(Texto: array of String); override;
    procedure CancelarVinculado; override;
    procedure FinalizarVinculado; override;
    procedure ImprimirNaoVinculado(Registrador, FormaPagto, Valor: String); override;
    procedure Autenticar; override;
*)
    procedure LeituraX; override;
    procedure ReducaoZ; override;
(*    procedure RelatorioGerencial(Texto: array of String); override;
    procedure FecharRelatorioGerencial; override;
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
    function GerarMapa: TtecMapaECF; override;
    function GerarMapaArquivoRetorno: TtecMapaECF; override;
    procedure LerAliquotasDaECF; override;
    procedure LerFormasPagamento; override;
    function  FechaRelatorioXouZ: Integer; override;
*)
    procedure LeituraMemoriaFiscalData(DataInicial, DataFinal: String;
                                       Simplificada: Boolean = False); override;
(*
    function LeituraMemoriaFiscalSerialDataMFD(DataInicial, DataFinal, FlagLeitura: String):boolean; override;
*)
    procedure LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal: String;
                                          Simplificada: Boolean = False); override;
(*
{    function  ImprimirCarne(Titulo, ValoresParcelas, Datas: String; QtdeParcelas: Integer;
                            TextoLivre, NomeCliente, RG_CPF, NumeroCupom: String;
                            NumeroVias, Assinatura: Integer): Integer; override;}
    function CodigoBarrasEAN13MFD(Codigo: String): Integer; override;
*)
  end;

implementation

Uses
  //biblio
  biblio, ctelgin;

{ TtecTotalizadoresElgin }

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
  if Campo[1] = '-' then
    Delete(Campo, 1, 1);
  Ponto := Pos(',', Campo);
  if Ponto > 0 then
  begin
    Decimal := Copy(Campo, Pos(',', Campo) + 1, CasasDecimais);
    if Length(Decimal) > CasasDecimais then
      Decimal := Copy(Decimal, 1, CasasDecimais);
    if Length(Decimal) < CasasDecimais then
      Decimal := Decimal + StringofChar('0', CasasDecimais - Length(Decimal));
    Inteiro := Copy(Campo, 1, Ponto - 1) ;
    Inteiro := StringofChar(Valor, Tamanho - (CasasDecimais + Length(Inteiro)) ) + Inteiro;
  end
  else
  begin
    Decimal := StringOfChar(Valor, CasasDecimais);
    Inteiro := StringOfChar(Valor, Tamanho - (CasasDecimais + (Length(Campo)))) + Campo;
  end;
  Campo := Inteiro + Decimal;
end;
(*
procedure TtecECFElgin.LerAliquotasDaECF;
var
//  Aliquotas: String;
  TotalAliq, idx: Integer;
begin
  inherited;
{$IFDEF MSWINDOWS}
//  Aliquotas := Preencher(79);
{$ENDIF}
  ACBrECF1.CarregaAliquotas;

  TotalAliq := ACBrECF1.Aliquotas.Count;
  {AtualizarStatus(Elgin_RetornoAliquotas(Aliquotas));}
  if Not Erro then begin
{$IFDEF MSWINDOWS}
{    Delete(Aliquotas, Pos(#0, Aliquotas), Length(Aliquotas));
    TotalAliq := PosOcor(',', Aliquotas, 0) + 1; }
{$ELSE}
{    Delete(Aliquotas, 1, 2);
    TotalAliq := StrtoInt(Copy(Aliquotas, 1, 2)); }
{$ENDIF}
    SetLength(FAliquotas, TotalAliq);
    for idx := 0 to TotalAliq - 1 do begin
      FAliquotas[idx] := FloatToStr(ACBrECF1.Aliquotas[idx].aliquota); //Copy(Aliquotas, 1, 4);
{$IFDEF MSWINDOWS}
{      Delete(Aliquotas, 1, Pos(',', Aliquotas));}
{$ELSE}
{      Delete(Aliquotas, 1, 4);}
{$ENDIF}
    end
  end
end;

procedure TtecECFElgin.LerFormasPagamento;
var
//  Recebimento: String;
  a: Integer;

  procedure MontaRecebimentosNaoFiscal;
  var
//    Str: String;
    Count, totalNaoFiscal: Integer;
  begin
    ACBrECF1.CarregaComprovantesNaoFiscais;
    totalNaoFiscal := ACBrECF1.ComprovantesNaoFiscais.Count;
    {Count  := 0;
    while Recebimento <> '' do begin
      Str := ANSIUpperCase(Trim(Copy(Recebimento, 25, 19)));
      if Str = '' then
        break
      else begin
        SetLength(FRecebimentosNaoFiscais, Count + 1);
        FRecebimentosNaoFiscais[Count] := Str;
        Inc(Count);
      end;
    }
    SetLength(FRecebimentosNaoFiscais, totalNaoFiscal);
    for count := 0 to totalNaoFiscal - 1 do
      FRecebimentosNaoFiscais[count] := AnsiUpperCase(ACBrECF1.ComprovantesNaoFiscais[count].Descricao);
{$IFDEF LINUX }
{      Delete(Recebimento, 1, 43);}
{$ELSE }
{      Delete(Recebimento, 1, 44);}
{$ENDIF}
{    end;}
  end;

begin
  inherited;
  { A Elgin apaga as formas de pagamento sempre que a reducao Z
    for executada. Por isso e necessario a programacao novamente }
//{$IFDEF LINUX}
//  ProgramaFormasPagto;
//{$ELSE}
  VerificaFormasPagamento;
//{$ENDIF}


  if Not Erro then begin
    {Recebimento := '';
    for a := 1 to 2200 do
      Recebimento := Recebimento + ' ';
    AtualizarStatus(Elgin_VerificaRecebimentoNaoFiscal(Recebimento)); }
    MontaRecebimentosNaoFiscal;
  end
end;
*)
function TtecTotalizadoresElgin.LerTotalizador(Index: Integer): String;
var
  Tot: String;
  VirgIdx: Integer;
begin
  Tot := Preencher(455);
//  Elgin_VerificaTotalizadoresParciais(Tot);
  {Index funciona como offset da virgula separadora dos totalizadores}
  {$IFNDEF LINUX}
  VirgIdx := Index;
  {$ELSE}
  VirgIdx := 1;
  {$ENDIF}
  case Index of
   1: Result := SuprimirZeros(Copy(Tot, VirgIdx, 224));
   2: Result := SuprimirZeros(Copy(Tot, 225 + (VirgIdx - 1), 14));
   3: Result := SuprimirZeros(Copy(Tot, 239 + (VirgIdx - 1), 14));
   4: Result := SuprimirZeros(Copy(Tot, 253 + (VirgIdx - 1), 14));
   5: Result := SuprimirZeros(Copy(Tot, 267 + (VirgIdx - 1), 126));
   6: Result := SuprimirZeros(Copy(Tot, 393 + (VirgIdx - 1), 14));
   7: Result := SuprimirZeros(Copy(Tot, 407 + (VirgIdx - 1), 14));
   8: Result := SuprimirZeros(Copy(Tot, 421 + (VirgIdx - 1), 18));
   9: begin
        Preencher(14, ' ', Result);
//        Elgin_Cancelamentos(Result);
      end;
  10: begin
        Preencher(14, ' ', Result);
//        Elgin_Descontos(Result);
      end;
  11: begin
        Preencher(4, ' ', Result);
//        Elgin_NumeroReducoes(Result);
      end;
  end;
end;
(*
{ TtecECFElgin }

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Metodos de Inicializacao e Finalizacao
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

procedure TtecECFElgin.FinalizarImpressora;
begin
  ACBrECF1.Desativar;
//  Elgin_FechaPortaSerial;
end;
*)
procedure TtecECFElgin.IniciarImpressora(Porta: String);
{$IFNDEF LINUX}
{var
  CodErro: Integer;
  }
//  ParamsFile: TMemIniFile;
{$ENDIF}
begin
//  ECFPadrao.Modelo := 3;
  inherited IniciarImpressora(Porta);
//  ElginLoadLib;
  Self.Totalizadores := TtecTotalizadoresElgin.Create;
  { Extrai parametros Tecsoft incluidos no arquivo 'ini' da impressora }
{  ParamsFile := TMemIniFile.Create(INI_PATH + INI_FILE);
  try
    ParamsFile.ReadSectionValues('TECSOFT', Self.Params);
  finally
    ParamsFile.Free;
  end; }
{$IFNDEF LINUX}
{  CodErro := Elgin_AbrePortaSerial;
  if CodErro = ELGIN_ERR_ININAOENCONTRADO then
    FMensagem := 'O arquivo de inicialização ELGINFI32.INI não foi encontrado no diretório de sistema do Windows.'
  else if CodErro = ELGIN_ERR_ABRIRPORTASERIAL then
    FMensagem := 'Erro ao abrir a porta de comunicação.';
  Erro := CodErro <> 1;
  }
{$ELSE}
{  Self.AtualizarStatus(Elgin_AbrePortaSerial(Porta);//);}
{$ENDIF}
//  Self.ProgramaFormasPagto;
end;
(*
procedure TtecECFElgin.ProgramaFormasPagto;
var
  a, Indice: Integer;
begin
  SetLength(FFormasPagamento, High(ECF_FORMA_PAGTO)+1);
  for a := Low(ECF_FORMA_PAGTO) to High(ECF_FORMA_PAGTO) do begin
//    AtualizarStatus(Elgin_ProgramaFormasPagamento(ECF_FORMA_PAGTO[a], Indice));
    if Erro then
      Break;
    if Indice > High(ECF_FORMA_PAGTO)+1 then
      SetLength(FFormasPagamento, Indice);
    FFormasPagamento[Indice-1] := ECF_FORMA_PAGTO[a];
  end
end;

{~~~~~~~~~~~~~~~~~~~~~~~
  Metodos de Impressora
~~~~~~~~~~~~~~~~~~~~~~~~}

procedure TtecECFElgin.AbrirGaveta;
begin
//  Self.AtualizarStatus(Elgin_AcionaGaveta);
end;

function TtecECFElgin.SerieMaquina: String;
begin
  Result := ACBrECF1.NumSerie;
{  Result := Preencher(15);
  Self.AtualizarStatus(Elgin_NumeroSerie(Result));
}
{$IFDEF MSWINDOWS}
{  Result := Copy(Result, 1, Pos(#0,Result) - 1);}
{$ENDIF}
end;

function TtecECFElgin.NumeroMaquina: String;
begin
  Result := ACBrECF1.NumECF;
{  Result := Preencher(4);
  Self.AtualizarStatus(Elgin_NumeroCaixa(Result));
}
end;

function TtecECFElgin.Cupom: String;
begin
{  Result := Preencher(6);
  Self.AtualizarStatus(Elgin_NumeroCupom(Result));
  Result := Trim(Result)}
  Result := ACBrECF1.NumCupom;
end;

function TtecECFElgin.Intervencao: String;
begin
{  Result := Preencher(4);
  Self.AtualizarStatus(Elgin_NumeroIntervencoes(Result));
}  Result := ACBrECF1.NumCRO;
end;

function TtecECFElgin.Data: String;
var
  Data: String;
{$IFNDEF LINUX}
  Hora: String;
{$ENDIF}
begin
{$IFNDEF LINUX}
   Data := Preencher(6);
   Hora := Preencher(6);
//   Self.AtualizarStatus(Elgin_DataHoraImpressora(Data, Hora));
   Result := Copy(Data,0,2) + '/' + Copy(Data,3,2) + '/' + Copy(Data,5,2) + ' '
           + Copy(Hora,0,2) + ':' + Copy(Hora,3,2) + ':' + Copy(Hora,5,2);
{$ELSE}
//   Self.AtualizarStatus(Elgin_DataHoraImpressora(Data));
   Result := Copy(Data,0,2) + '/' + Copy(Data,3,2) + '/' + Copy(Data,5,2) + ' '
           + Copy(Data,7,2) + ':' + Copy(Data,9,2) + ':' + Copy(Data,11,2);
{$ENDIF}
  Result := DateTimeToStr(ACBrECF1.DataHora);
end;

function TtecECFElgin.DataReducao: String;
var
  Data: String;
{$IFNDEF LINUX}
  Hora: String;
{$ENDIF}
begin
{$IFNDEF LINUX}
   Data := Preencher(6);
   Hora := Preencher(6);
//   Self.AtualizarStatus(Elgin_DataHoraReducao(Data, Hora));
   Result := Copy(Data,0,2) + '/' + Copy(Data,3,2) + '/' + Copy(Data,5,2) + ' '
           + Copy(Hora,0,2) + ':' + Copy(Hora,3,2) + ':' + Copy(Hora,5,2);
{$ELSE}
//   Self.AtualizarStatus(Elgin_DataHoraReducao(Data));
   Result := Copy(Data,0,2) + '/' + Copy(Data,3,2) + '/' + Copy(Data, 5,2) + ' '
           + Copy(Data,7,2) + ':' + Copy(Data,9,2) + ':' + Copy(Data,11,2);
{$ENDIF}
end;

function TtecECFElgin.CGC: String;
var
  CGC: String;
{$IFNDEF LINUX}
  IE: String;
{$ENDIF}
begin
{$IFNDEF LINUX}
  CGC := Preencher(18);
  IE := Preencher(15);
//  Self.AtualizarStatus(Elgin_CGC_IE(CGC, IE));
{$ELSE}
//  Self.AtualizarStatus(Elgin_CGC_IE(CGC));
{$ENDIF}
  Result := CGC;
Result := ACBrECF1.CNPJ;
end;

function TtecECFElgin.CuponsDoDia: String;
begin
end;

function TtecECFElgin.TotalizadorAcrescimo: String;
begin
//  Result := Preencher(14);
//  Self.AtualizarStatus(Elgin_Acrescimos(Result));
  Result := FloatToStr(ACBrECF1.TotalAcrescimos)
end;

function TtecECFElgin.TotalizadorDesconto: String;
begin
//  Result := Preencher(14);
//  Self.AtualizarStatus(Elgin_Descontos(Result));
  Result := FloatToStr(ACBrECF1.TotalDescontos)
end;

function TtecECFElgin.AtualizarStatus(Codigo: Integer): Integer;
var
  CodErro: Integer;
  MsgErro: String;
{$IFDEF MSWINDOWS}
  Ack, ST1, ST2: Integer;
{$ENDIF}

begin
  Erro := Codigo <> ELGIN_OK;
  FMensagem := '';
{$IFDEF MSWINDOWS}
  if Codigo = ELGIN_ERR_COMUNICACAO then begin
    FMensagem := 'Impressora não responde.';
    Result := Codigo;
  end else begin
    Codigo := RetornoImpressora(CodErro, MsgErro);
    if (Codigo = ELGIN_ERR_COMUNICACAO) then
      FMensagem := 'Impressora não responde.';
//    else
//      Codigo := (ST1 and 255) shl 8 + (ST2 and 255);
    Result := Codigo;
    Erro := Codigo <> ELGIN_OK;
    if Codigo = 1 then
      FMensagem := 'Comando executado com sucesso';
  end;
{$ELSE }
  Result := Codigo;
  if Not Erro then
    FMensagem := 'Comando executado com sucesso'
//  else begin
{$ENDIF}
{ST1}
{
    CodErro := Codigo shr 8;
    if CodErro and ELGIN_ERR_NROPARAMETROSINVALIDO = ELGIN_ERR_NROPARAMETROSINVALIDO then
      FMensagem := FMensagem + 'Número de parâmetros de Comando inválido.' + #13#10;
    if CodErro and ELGIN_ERR_CUPOMABERTO = ELGIN_ERR_CUPOMABERTO then
      FMensagem := FMensagem + 'Cupom aberto' + #13#10;
    if CodErro and ELGIN_ERR_COMANDOINEXISTENTE = ELGIN_ERR_COMANDOINEXISTENTE then
      FMensagem := FMensagem + 'Comando inexistente' + #13#10;
    if CodErro and ELGIN_ERR_PRIMEIROCODIGODIFEREDEESC = ELGIN_ERR_PRIMEIROCODIGODIFEREDEESC then
      FMensagem := FMensagem + 'Primeiro dado de Comando não foi ESC (1BH)' + #13#10;
    if CodErro and ELGIN_ERR_IMPRESSORACOMERRO = ELGIN_ERR_IMPRESSORACOMERRO then
      FMensagem := FMensagem + 'Impressora com erro' + #13#10;
    if CodErro and ELGIN_ERR_ERRONORELOGIO = ELGIN_ERR_ERRONORELOGIO then
      FMensagem := FMensagem + 'Erro no relógio' + #13#10;
    if CodErro and ELGIN_ERR_POUCOPAPEL = ELGIN_ERR_POUCOPAPEL then begin
      FMensagem := FMensagem + 'Pouco papel' + #13#10;
}
{$IFDEF MSWINDOWS}
//      if ((ST1 and 255) = ELGIN_ERR_POUCOPAPEL) and ((ST2 and 255) = 0) then begin
{$ELSE }
//      if CodErro = ELGIN_ERR_POUCOPAPEL then begin
//        MensagemAviso(FMensagem);
{$ENDIF}
{
        Erro := False
      end;
    end;
    if CodErro and ELGIN_ERR_FIMPAPEL = ELGIN_ERR_FIMPAPEL then
      FMensagem := FMensagem + 'Fim de papel' + #13#10;
}
{ST2}
{    CodErro := Codigo and 255;
    if CodErro and ELGIN_ERR_COMANDONAOEXECUTADO = ELGIN_ERR_COMANDONAOEXECUTADO then
      FMensagem := FMensagem + 'Comando não executado.' + #13#10;
    if CodErro and ELGIN_ERR_CGCIENAOPROGRAMADO = ELGIN_ERR_CGCIENAOPROGRAMADO then
      FMensagem := FMensagem + 'CGC/IE do proprietário não programados.' + #13#10;
    if CodErro and ELGIN_ERR_CANCELAMENTONAOPERMITIDO = ELGIN_ERR_CANCELAMENTONAOPERMITIDO then
      FMensagem := FMensagem + 'Cancelamento não permitido.' + #13#10;
    if CodErro and ELGIN_ERR_NROALIQLOTADA = ELGIN_ERR_NROALIQLOTADA then
      FMensagem := FMensagem + 'Capacidade de alíq. programáveis lotada.' + #13#10;
    if CodErro and ELGIN_ERR_ALIQUOTANAOPROGRAMADA = ELGIN_ERR_ALIQUOTANAOPROGRAMADA then
      FMensagem := FMensagem + 'Alíquota não programada.' + #13#10;
    if CodErro and ELGIN_ERR_ERRORAMCMOS = ELGIN_ERR_ERRORAMCMOS then
      FMensagem := FMensagem + 'Erro na Memória RAM CMOS Não Volátil.' + #13#10;
    if CodErro and ELGIN_ERR_MEMORIAFISCALCHEIA = ELGIN_ERR_MEMORIAFISCALCHEIA then
      FMensagem := FMensagem + 'Memória Fiscal lotada.' + #13#10;
    if CodErro and ELGIN_ERR_TIPOPARAMETROINVALIDO = ELGIN_ERR_TIPOPARAMETROINVALIDO then
      FMensagem := FMensagem + 'Tipo de parâmetro de Comando inválido.' + #13#10;
    Delete(FMensagem, Length(FMensagem), 6);
  end
}
end;

{~~~~~~~~~~~~~~~~~~~~~~~
 Metodos de Cupom Fiscal
~~~~~~~~~~~~~~~~~~~~~~~~}

function TtecECFElgin.CupomAberto: Boolean;
var
  Flags: Integer;
begin
  Result := ACBrECF1.estado in [estVenda,estPagamento];
//  AtualizarStatus(Elgin_FlagsFiscais(Flags));
//  Result := Not Erro and ((Flags and 1) = 1)
end;

procedure TtecECFElgin.IniciarCupom(CGC_CPF, Nome, Endereco: String);
begin
{  Self.AtualizarStatus(Elgin_AbreCupom(CGC_CPF));}
  if (CGC_CPF <> '') and (Nome <> '') and (Endereco <> '') then
    ACBrECF1.AbreCupom(CGC_CPF, Nome, Endereco)
  else
    ACBrECF1.AbreCupom('', '', '');
end;
*)
procedure TtecECFElgin.CancelarCupom;
begin
  inherited;
  PulaLinhas(6);
end;
procedure TtecECFElgin.PagamentoCupom(FormaPagto, Valor: String);
begin
{$IFDEF LINUX}
{  Preencher(13, 2, '0', Valor);}
{$ENDIF}
{$IFNDEF LINUX}
{  MakePack(13, 2, '0', Valor);
  Self.AtualizarStatus(Elgin_EfetuaFormaPagamento(FormaPagto, Valor));
}
{$ELSE}
{  FormaPagto := ConverteFormaPagto(FormaPagto,1);
  AtualizarStatus(Elgin_EfetuaFormaPagamento(FormaPagto, Valor,''));
}
{$ENDIF}
  FormaPagto := ConverteFormaPagto(FormaPagto,0);
  inherited PagamentoCupom(FormaPagto,Valor);
end;
(*
procedure TtecECFElgin.TotalizaCupom(TipoDesconto, Desconto: String);
var
  AcrescimoDesconto: Char;
begin
{$IFDEF LINUX}
{  if StrToFloat(Desconto) <= 0 then
    AcrescimoDesconto := 'd'
  else
    AcrescimoDesconto := 'a';
  if TipoDesconto = '%' then
    AcrescimoDesconto := UpCase(AcrescimoDesconto);
  if TipoDesconto = '%' then
    MakePack(4, 2, '0', Desconto)
  else
    MakePack(14, 2, '0', Desconto);}
{$ELSE}
{  Desconto := FloatToStr(StrToCurr(Desconto)*100);
  if StrToFloat(Desconto) <= 0 then
    AcrescimoDesconto := 'D'
  else
    AcrescimoDesconto := 'A';
  if TipoDesconto <> '%' then
    TipoDesconto := '$';
}
{$ENDIF}
{  AtualizarStatus(Elgin_IniciaFechamentoCupom(AcrescimoDesconto, TipoDesconto, Desconto)); }
  ACBrECF1.SubtotalizaCupom(StrToFloat(Desconto));
end;
*)
procedure TtecECFElgin.FinalizarCupom(FormaPagto, Total, Mensagem: String);
{var
  APIResult: Integer;}
begin
{$IFNDEF LINUX}
//  MakePack(14, 2, '0', Total);
{  APIResult := Elgin_FechaCupom(FormaPagto, AcresDesc, TipoDesconto,
                               Desconto, Total, Mensagem);   }
//  APIResult := Elgin_FechaCupomResumido(FormaPagto, Mensagem);
//  APIResult:= Elgin_TerminaFechamentoCupom(Mensagem);
{$ELSE}
//  FormaPagto := ConverteFormaPagto(FormaPagto,1);
//  APIResult := Elgin_FechaCupomResumido(FormaPagto, Mensagem);
//  APIResult := Elgin_FechaCupom('', '', 1, FormaPagto, Total, Mensagem);
{$ENDIF}
//  Self.AtualizarStatus(APIResult);
  inherited;
  PulaLinhas(6);
end;
(*
procedure TtecECFElgin.VenderItem(Codigo, Descricao, Preco, Quantidade,
  Unidade, Tributo: String; TipoDesconto: Char; Desconto, Filial: String;
  TipoTributo: TtecTributo);
//var
//{$IFNDEF LINUX}
//  Decimais,
//{$ENDIF}
//  APIResult: Integer;
//{$IFNDEF LINUX}
 // TipoQtd: Char;
//{$ENDIF}
begin
  case TipoTributo of
   tbNTributado: Tributo := 'NN';
       tbIsento: Tributo := 'II';
    tbSubstitui: Tributo := 'FF';
  end;
{  else
    Tributo := ConverteAliquota(Tributo)
  end;

  if Length(Codigo) > 14 then
    Codigo := Copy(Codigo,1,14);
  if Length(Descricao) > 29 then
  begin
    Descricao:= Copy(Descricao,1,200);
    AumentarDescricaoItem(Descricao);
    Descricao:= Copy(Descricao, 1, 29);
  end;
}
{$IFNDEF LINUX}
{  APIResult := Elgin_VendeItem(Codigo, Descricao, Tributo, 'F', Quantidade, 2,
                               Preco, TipoDesconto, Desconto);
}
{$ELSE}
{  if TipoDesconto = '%' then
    Preencher(4, 2, '0', Desconto)
  else
    Preencher(8, 2, '0', Desconto);
  APIResult := Elgin_VendeItem(Codigo, Descricao, Tributo, Quantidade,
                              Preco, Desconto);
}
{$ENDIF}
{  Self.AtualizarStatus(APIResult);}
  ACBrECF1.VendeItem(codigo,descricao,tributo,StrToFloat(quantidade),StrToFloat(preco),StrToFloat(desconto),unidade,tipodesconto);
end;

procedure TtecECFElgin.AumentarDescricaoItem(descricao: String);
var
  APIResult: Integer;
begin
//  APIResult := Elgin_AumentaDescricaoItem(descricao);
//  Self.AtualizarStatus(APIResult);
end;

procedure TtecECFElgin.CancelarItem(Numero: String);
begin
//  Self.AtualizarStatus(Elgin_CancelaItemGenerico(Numero));
  ACBrECF1.CancelaItemVendido(StrToInt(Numero));
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Metodos de Operaþoes NÒo Fiscais
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
*)
procedure TtecECFElgin.IniciarVinculado(FormaPagto, Valor, Cupom: String);
begin
//  Self.AtualizarStatus(Elgin_AbreComprovanteNaoFiscalVinculado(FormaPagto, Valor, Cupom));
  FormaPagto := ConverteFormaPagto(FormaPagto,0);
  inherited IniciarVinculado(FormaPagto,Valor,Cupom);
end;
(*
procedure TtecECFElgin.CancelarVinculado;
begin
end;

procedure TtecECFElgin.ImprimirVinculado(Texto: array of String);
var
  a: Integer;
begin
{  for a := 0 to High(Texto) do begin
    AtualizarStatus(Elgin_UsaComprovanteNaoFiscalVinculado(Texto[a]));
    if Erro then
      break
  end
}
end;

procedure TtecECFElgin.FinalizarVinculado;
begin
//  Self.AtualizarStatus(Elgin_FechaComprovanteNaoFiscalVinculado);
end;


procedure TtecECFElgin.ImprimirNaoVinculado(Registrador, FormaPagto, Valor: String);
var
  Maior, Ind: Integer;
  Indice: String;
begin
{  Ind := IndiceRecebimentoNaoFiscal(Registrador, Maior);
  if Ind = -1 then begin
    if Maior = 0 then
      Maior := 1;
    AtualizarStatus(Elgin_NomeiaTotalizadorNaoSujeitoIcms(Maior, Registrador));
    if Not Erro then begin
      SetLength(FRecebimentosNaoFiscais, High(FRecebimentosNaoFiscais) + 2);
      FRecebimentosNaoFiscais[High(FRecebimentosNaoFiscais)] := Registrador;
      Ind := Maior;
    end
  end;
  if Ind > -1 then begin
    Indice := IntToStr(Ind);
    AtualizarStatus(Elgin_RecebimentoNaoFiscal(Indice, Valor, FormaPagto));
  end
}
end;

{~~~~~~~~~~~~~~~~~~~~~~~
 Metodos de Relatorios
~~~~~~~~~~~~~~~~~~~~~~~~}
*)
procedure TtecECFElgin.ReducaoZ;
begin
//{$IFNDEF LINUX}
//  Self.AtualizarStatus(Elgin_ReducaoZ('',''));
//{$ELSE}
//  Self.AtualizarStatus(Elgin_ReducaoZ);
//{$ENDIF}
  inherited;
  PulaLinhas(6);
end;

procedure TtecECFElgin.LeituraX;
begin
  inherited;
  PulaLinhas(6);
end;
(*
procedure TtecECFElgin.RelatorioGerencial(Texto: array of String);
{var
  a: Integer;
}
begin
{  for a := 0 to High(Texto) do begin
    AtualizarStatus(Elgin_RelatorioGerencial(Texto[a]));
    if Erro then
      break;
  end}
end;

procedure TtecECFElgin.FecharRelatorioGerencial;
begin
//  Self.AtualizarStatus(Elgin_FechaRelatorioGerencial);
end;

function TtecECFElgin.FechaRelatorioXouZ: Integer;
begin
 // Result := AtualizarStatus(Elgin_FechaRelatorioXouZ)
 ACBrECF1.FechaNaoFiscal;
end;

procedure TtecECFElgin.Autenticar;
begin
//  AtualizarStatus(Elgin_Autenticacao);
  ACBrECF1.EnviaComando('ImprimeAutenticacao');
end;

function TtecECFElgin.GerarMapa: TtecMapaECF;
var
  Idx, Max: Integer;
  Tributos, Aliquotas, Valor: String;
begin
  SetLength(Result, Length(Result) + 1);
  with Self.Totalizadores do
  begin
    Result[Length(Result) - 1].cpfinal := StrToInt(Cupom);
    Result[Length(Result) - 1].reducoes := StrToInt(Reducoes);
    Result[Length(Result) - 1].gt := ToDouble(GrandeTotal);
    Result[Length(Result) - 1].tcanc := ToDouble(Cancelamentos);
    Result[Length(Result) - 1].tdesc := ToDouble(Descontos);
    Result[Length(Result) - 1].tsubs := ToDouble(Substitucao);
    Result[Length(Result) - 1].tisen := ToDouble(Isentos);
    Result[Length(Result) - 1].tntrb := ToDouble(SemInsidencia);
    Preencher(79, ' ', Aliquotas);
//    Elgin_RetornoAliquotas(Aliquotas);
    Tributos := Tributados;
// primeiro caracter Ú o contador de aliquotas
    Max := StrtoInt(Copy(Aliquotas, 1, 2));
    Delete(Aliquotas, 1, 2);
    for Idx := 1 to Max do
    begin
      Valor := Copy(Aliquotas, 1 , 4);
      with Result[Length(Result) - 1] do
      begin
        SetLength(ttrib, Length(ttrib) + 1);
        ttrib[Length(ttrib) - 1].base := ToDouble(Valor);
        Valor := Copy(Tributos, 1 , 14);
        ttrib[Length(ttrib) - 1].valor := ToDouble(Valor);
      end;
// excluir a virgula separadora entre as aliquotas
      Delete(Aliquotas, 1, 5);
      Delete(Tributos, 1, 14);
    end;
  end;
end;

function TtecECFElgin.GerarMapaArquivoRetorno: TtecMapaECF;
var
  Retorno : TStringList;
  GrandeTotal, ValorVendaBruta,
  Acrescimos, Cancelamentos, Descontos,
  substituicao, Isentos, NaoTributados,
  Aliquota, Base, Valor : Double;
  LendoCorpoReducoes,
  LendoCampoReducao,
  LendoCampoData,
  LendoCampoCRO,
  LendoCampoHora,
  LendoCampoValorVendaBruta,
  LendoNumeroMaquina, QuebrouLinha : Boolean;
  Reducao, Data, caracter, linha, valorcampo, CRO, maquina : String;
  i,j,nlinhas: integer;

  Tributados: array of TtecTotaisTributados;

  procedure GuardarValores;
  var
   k: integer;
  begin
    GrandeTotal := GrandeTotal-ValorVendaBruta;
    SetLength(Result, Length(Result) + 1);
    try
    Result[Length(Result) - 1].maquina := strtoint(maquina);
    Result[Length(Result) - 1].intervensao := strtoint(maquina);
    Result[Length(Result) - 1].data := data;
    Result[Length(Result) - 1].cpfinal := 0;
    Result[Length(Result) - 1].reducoes := StrToInt(Reducao);
    Result[Length(Result) - 1].gt := GrandeTotal;
    Result[Length(Result) - 1].tacre := Acrescimos;
    Result[Length(Result) - 1].tcanc := Cancelamentos;
    Result[Length(Result) - 1].tdesc := Descontos;
    Result[Length(Result) - 1].tsubs := Substituicao;
    Result[Length(Result) - 1].tisen := Isentos;
    Result[Length(Result) - 1].tntrb := NaoTributados;
    except
    ;
    end;
    with Result[Length(Result) - 1] do
    begin
      for k:=0 to high(tributados) do
      begin
        try
        SetLength(ttrib, length(ttrib)+1);
        ttrib[k].base := tributados[k].base;
        ttrib[k].valor := tributados[k].valor;
        ttrib[k].aliquota := tributados[k].aliquota;
        except
        ;
        end;
      end;
    end;
  end;

begin
  GrandeTotal := 0;
  Linha := '';
  ValorCampo := '';

  LendoCorpoReducoes := false;
  LendoCampoReducao := false;
  LendoCampoData := false;
  LendoCampoHora := false;
  LendoCampoCRO := false;
  LendoCampoValorVendaBruta := false;
  LendoNumeroMaquina := false;

  QuebrouLinha := false;

  Acrescimos    := 0;
  Cancelamentos := 0;
  Descontos     := 0;
  substituicao  := 0;
  Isentos       := 0;
  NaoTributados := 0;

  ValorVendaBruta := 0;

  Aliquota := 0;
  Base := 0;
  Valor := 0;

  CRO := '';
  maquina := ECFPadrao.NumeroMaquina;

  Tributados := nil;

  Retorno := TStringList.Create;
  Retorno.LoadFromFile('c:\retorno.txt');
  nlinhas := retorno.Count;
  for i:= 0 to nlinhas do
  begin
    if QuebrouLinha then
    begin
      Linha := Linha + lowercase(trim(retorno[i]));
      Quebroulinha := false;
    end
    else
      linha := lowercase(trim(retorno[i]));

    if pos('gt:',linha)<>0 then
      if GrandeTotal=0 then
        GrandeTotal := ToDouble(SomenteNumero(linha));

    if pos('d=descontos',linha)<>0 then
      LendoCorpoReducoes := True;

    if LendoCorpoReducoes then
    begin
      if PossuiNumero(linha) then
      begin
        if (pos('=', linha)<>0) then
        begin
          for j:=1 to length(linha) do
          begin
            caracter := linha[j];
            if (caracter = ' ') or
               (caracter = '?') then
            begin
              try
              if (pos('a=', valorcampo))<>0 then
                Acrescimos := todouble(SomenteNumero(valorcampo))
              else
              if (pos('c=', valorcampo))<>0 then
                Cancelamentos := todouble(SomenteNumero(valorcampo))
              else
              if (pos('d', valorcampo))<>0 then
                Descontos := todouble(SomenteNumero(valorcampo))
              else
              if (pos('i=', valorcampo))<>0 then
                Isentos := todouble(SomenteNumero(valorcampo))
              else
              if (pos('f=', valorcampo))<>0 then
                substituicao := todouble(SomenteNumero(valorcampo))
              else
              if (pos('n=', valorcampo))<>0 then
                NaoTributados := todouble(SomenteNumero(valorcampo))
              else
              if (pos('%', valorcampo))<>0 then
              begin
                Aliquota := ToDouble(SomenteNumero(copy(valorcampo,pos('t',valorcampo)+1,pos('%',valorcampo))));
                Base := ToDouble(SomenteNumero(copy(valorcampo,pos('=',valorcampo)+1,length(valorcampo))));
                Valor := Truncar((base * aliquota / 100),2);
                SetLength(tributados, Length(tributados) + 1);
                Tributados[Length(tributados) - 1].base := base;
                Tributados[Length(tributados) - 1].valor := valor;
                Tributados[Length(tributados) - 1].aliquota := Aliquota;
              end;

              valorcampo := '';
              except
              ;
              end;
            end
            else
              valorcampo := valorcampo+caracter;
          end;
          if valorcampo <> '' then
          begin
            QuebrouLinha := True;
            Tributados := nil;
            ValorCampo := ''
          end;
        end
        else
        begin
          if (pos('total',linha)<>0) then
          begin
            LendoNumeroMaquina := true;
            LendoCorpoReducoes := false;
            if reducao<>'' then
              GuardarValores;
          end
          else
          begin
            if reducao<>'' then
              GuardarValores;

            Reducao := '';
            CRO := '';
            ValorVendaBruta := 0;
            Data := '';

            Acrescimos    := 0;
            Cancelamentos := 0;
            Descontos     := 0;
            substituicao  := 0;
            Isentos       := 0;
            NaoTributados := 0;
            tributados    := nil;

            LendoCampoReducao := True;
            for J:=1 to length(linha) do
            begin
              caracter := linha[j];
              if LendoCampoReducao then
              begin
                if PossuiNumero(caracter) then
                  Reducao := Reducao + caracter
                else
                if (caracter = ' ') or
                   (caracter = '?') then
                begin
                  LendoCampoReducao := false;
                  LendoCampoCRO := True;
                end;
              end
              else
              if LendoCampoCRO then
              begin
                if PossuiNumero(caracter) then
                  CRO := cro + caracter
                else
                if (caracter = ' ') or
                   (caracter = '?') then
                begin
                  LendoCampoCRO := false;
                  LendoCampoData := True;
                end
              end
              else
              if LendocampoData then
              begin
                if PossuiNumero(caracter) or (caracter='/') then
                  Data := Data + caracter
                else
                if (caracter = ' ') or
                   (caracter = '?') then
                begin
                  LendoCampoData := False;
                  LendoCampoHora := True;
                end;
              end
              else
              if LendoCampoHora then
              begin
                if (caracter = ' ') or
                   (caracter = '?') then
                begin
                  LendoCampoHora := false;
                  LendoCampoValorVendaBruta := True;
                end
              end
              else
              if LendocampoValorVendabruta then
              begin
                ValorVendaBruta := ToDouble(SomenteNumero(copy(linha,j,length(linha))));
                break;
              end;
            end;
          end;
        end;
      end;
    end
    else
    if LendoNumeroMaquina then
    begin
      if (pos('ecf:',linha))<>0 then
      begin
        Maquina := copy(linha,pos('ecf:',linha)+1,4);
        break;
      end
    end;

  end;
end;

*)
procedure TtecECFElgin.LeituraMemoriaFiscalData(DataInicial, DataFinal: String;
                                                Simplificada: Boolean);
begin
//AtualizarStatus(Elgin_LeituraMemoriaFiscalData(DataInicial, DataFinal));
  inherited;
  PulaLinhas(6);
end;
(*

function TtecECFElgin.LeituraMemoriaFiscalSerialDataMFD(DataInicial, DataFinal, FlagLeitura : String): boolean;
var
//  retorno : byte;
  Linhas : TStringList;
begin
{  retorno := Elgin_LeituraMemoriaFiscalSerialDataMFD(DataInicial, DataFinal,
                                                             FlagLeitura);
  result := retorno = ELGIN_OK;
  atualizarStatus(retorno);
} Linhas := TStringList.Create;
  ACBrECF1.LeituraMemoriaFiscalSerial(StrToDateTime(DataInicial), StrToDateTime(DataFinal), Linhas);
end;
*)
procedure TtecECFElgin.LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal: String;
                                                   Simplificada: Boolean);
begin
//  AtualizarStatus(Elgin_LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal));
  inherited;
  PulaLinhas(6);
end;
(*
{function TtecECFElgin.ImprimirCarne(Titulo, ValoresParcelas, Datas: String;
                                        QtdeParcelas: Integer;
                                        TextoLivre, NomeCliente, RG_CPF, NumeroCupom: String;
                                        NumeroVias, Assinatura: Integer): Integer;
begin
  result := AtualizarStatus(Elgin_ImpressaoCarne(Titulo, ValoresParcelas, Datas, QtdeParcelas, TextoLivre,
                                                NomeCliente, RG_CPF, NumeroCupom, NumeroVias, Assinatura));
end;
}

function TtecECFElgin.CodigoBarrasEAN13MFD(Codigo: String): Integer;
begin
//  Result := AtualizarStatus(Elgin_CodigoBarrasEAN13MFD(Codigo));
end;

function TtecECFElgin.ConverteAliquota(Valor: String): String;
var
  Tributo: String;
  idx, PosVirg: Integer;
begin
  Result := '00';
  Tributo := '';
  repeat
    PosVirg := Pos(',', Valor);
    Delete(Valor, PosVirg, 1);
  until PosVirg = 0;
  for idx := 1 to Length(Valor) do
    Tributo := Tributo + Valor[idx];
  if Length(Tributo) = 1 then
    Tributo := '0' + Tributo;
  for idx := Length(Tributo)+1 to 4 do
    Tributo := Tributo + '0';
  for idx := 0 to High(FAliquotas) do
    if FAliquotas[idx] = Tributo then begin
      Result := IntToStr(idx);
      Preencher(2, 0, '0', Result);
      Break;
    end
end;

{$IFDEF MSWINDOWS}
function TtecECFElgin.RetornoImpressora(iCodErro: Integer; strErroMsg: String): Integer;
begin
//  Result := Elgin_RetornoImpressora(iCodErro, strErroMsg);
end;



{$ENDIF}

function TtecECFElgin.VerificaFormasPagamento: Integer;
var
{  Formas,
  Forma: String;}
  a, totalFormas: Integer;
begin
  {Formas := Preencher(3016);
  Result := Elgin_VerificaFormasPagamento(Formas);
  AtualizarStatus(Result);}
  ACBrECF1.CarregaFormasPagamento;
  totalFormas := ACBrECF1.FormasPagamento.Count;
  if Not Erro then begin
    {a := 1;
    while Formas <> '' do begin }
    SetLength(FFormasPagamento,totalFormas);
    for a := 0 to totalFormas - 1 do begin
      FFormasPagamento[a] :=  ACBrECF1.FormasPagamento[a].Descricao;
      {Forma := Trim(Copy(Formas, 1, 16));
      if Forma <> '' then begin
        SetLength(FFormasPagamento, a);
        FFormasPagamento[a-1] := Forma;
        Inc(a);
      end;
      Delete(Formas, 1, 58); }
    end
  end
end;

function TtecECFElgin.ConverteFormaPagto(Valor: String;
  IndInicial: Integer): String;
var
  a: Integer;
begin
  Result := '99';
  for a := 0 to High(FFormasPagamento) do
    if FFormasPagamento[a] = Trim(Valor) then begin
      Result := IntToStr(a + IndInicial);
      Break;
    end
end;
*)
end.
