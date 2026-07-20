{********************************************************}
{                                                        }
{                                                        }
{             Classe para acesso a API de                }
{              impressoras fiscais Mecaf                 }
{                                                        }
{                   Ver 1.0 12/03/2003                   }
{********************************************************}

unit clecf_mecaf;

interface

uses
  //CLX
  Classes, SysUtils, IniFiles, clecf;

type

  TtecECFMecaf = class;
(*  TtecTotalizadoresMecaf = class(TtecTotalizadoresECF)
  private
    FOwner: TtecECFMecaf;
  protected
    function LerTotalizador(Index: Integer): String; override;
  public
    constructor Create(AOwner: TtecECFMecaf); reintroduce; virtual;
  end;
*)
  TtecECFMecaf = class(TtecECF)
(*  private
    FBuffer: array [0..MECA_BUFFER_SIZE] of Char;
    function GetBuffer(Index: Integer): Char;
  protected
    function  AtualizarStatus(Codigo: Integer): Integer; override;
    function VerificaFormasPagamento: Integer;
    procedure RecuperarResultado(var Valor: Integer);
*)
  public
    procedure IniciarImpressora(Porta: String); override;
(*
    procedure FinalizarImpressora; override;
    procedure ProgramaFormasPagto; override;
//    procedure AbrirGaveta; override;
    procedure IniciarCupom(CGC_CPF, Nome, Endereco: String); override;
    procedure CancelarCupom; override;
    function  CupomAberto: Boolean; override;
    procedure TotalizaCupom(TipoDesconto, Desconto: String); override;
*)
    procedure PagamentoCupom(FormaPagto, Valor: String); override;
(*
    procedure FinalizarCupom(FormaPagto, Total, Mensagem: String); override;
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
    procedure ImprimirNaoVinculado(Registrador, FormaPagto, Valor, TipoDesconto, Desconto, Msg: String); overload; override;
    procedure ImprimirNaoVinculado(Registrador, FormaPagto, Valor: String); overload; override;
    procedure Autenticar; override;
    procedure LeituraX; override;
    procedure ReducaoZ; override;
    procedure RelatorioGerencial(Texto: array of String); override;
    procedure FecharRelatorioGerencial; override;
    function FechaRelatorioXouZ: Integer; override;
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
    procedure LerAliquotasDaECF; override;
    procedure LerFormasPagamento; override;
    procedure LeituraMemoriaFiscalData(DataInicial, DataFinal: String); override;
    function LeituraMemoriaFiscalSerialDataMFD(DataInicial, DataFinal, FlagLeitura: String):boolean; override;
    procedure LeituraMemoriaFiscalReducao(ReducaoInicial, ReducaoFinal: String); override;
    property Buffer[Index: Integer]: Char read GetBuffer;
*)
  end;

implementation

Uses
  //Biblio
  biblio;

{ TtecTotalizadoresMecaf }
(*
constructor TtecTotalizadoresMecaf.Create(AOwner: TtecECFMecaf);
begin
  Self.FOwner := AOwner;
end;

function TtecTotalizadoresMecaf.LerTotalizador(Index: Integer): String;
var
  Tot: Array [0..MECA_BUFFER_SIZE] of Char;
  cnt: Integer;
begin
  Result := '';
  Self.FOwner.AtualizarStatus(Meca_TransTotCont);
  for cnt := 0 to MECA_BUFFER_SIZE do
     Tot[cnt] := Self.FOwner.Buffer[cnt];
  case Index of
    1: Result := SuprimirZeros(Copy(Tot, MECA_INICIO_MSG + 31, 224));
    2: Result := SuprimirZeros(Copy(Tot, MECA_INICIO_MSG + 269, 14));
    3: Result := SuprimirZeros(Copy(Tot, MECA_INICIO_MSG + 283, 14));
    4: Result := SuprimirZeros(Copy(Tot, MECA_INICIO_MSG + 255, 14));
    5: begin
         for cnt := 50 to 81 do
         begin
           Self.FOwner.AtualizarStatus(Meca_EcfPar(PChar(IntToStr(cnt))));
           Result := Result + Copy(Self.FOwner.FBuffer, MECA_INICIO_MSG, 31);
         end;
         Result := SuprimirZeros(Result);
       end;
    6: Result := '0'; // encontrar //
    7: Result := '0'; // encontrar //
    8: Result := SuprimirZeros(Copy(Tot, MECA_INICIO_MSG + 12, 18));
    9: Result := SuprimirZeros(Copy(Tot, MECA_INICIO_MSG + 297, 14));
   10: Result := SuprimirZeros(Copy(Tot, MECA_INICIO_MSG + 311, 14));
   11: Result := SuprimirZeros(Copy(Tot, MECA_INICIO_MSG + 337, 4));
  end;
end;
*)
{ TtecECFMecaf }
(*
function TtecECFMecaf.GetBuffer(Index: Integer): Char;
begin
  Result := Self.FBuffer[Index];
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Metodos de Inicializacao e Finalizacao
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

procedure TtecECFMecaf.FinalizarImpressora;
begin
//  Meca_CloseCif;
end;
*)
procedure TtecECFMecaf.IniciarImpressora(Porta: String);
{var
  ParamsFile: TMemIniFile; }
begin
//  ECFPadrao.Modelo := 4;
  inherited IniciarImpressora(Porta);
{  MecafLoadLib;}
//  Totalizadores := TtecTotalizadoresMecaf.Create(Self);
  { Extrai parametros Tecsoft incluidos no arquivo 'ini' da impressora }
{  ParamsFile := TMemIniFile.Create(INI_PATH + INI_FILE);
  try
    ParamsFile.ReadSectionValues('TECSOFT', Self.Params);
  finally
    ParamsFile.Free;
  end; }
{$IFNDEF LINUX}
{  Self.AtualizarStatus(}//Meca_OpenCif;//);
{$ELSE}
{  Self.AtualizarStatus(}//Meca_OpenCif(PChar(Porta));//);
{$ENDIF}
//  Self.ProgramaFormasPagto;
end;
(*
procedure TtecECFMecaf.ProgramaFormasPagto;
var
  cnt: Integer;
  Indice, Forma: String;
begin
  for cnt := Low(ECF_FORMA_PAGTO) to High(ECF_FORMA_PAGTO) do begin
    Indice := IntToStr(cnt);
    Forma := ECF_FORMA_PAGTO[cnt];
    Preencher(2, 0, '0', Indice);
    Preencher(16, ' ', Forma);
    AtualizarStatus(Meca_ProgramaLegenda(PChar(Indice),PChar(Forma)));
    if Erro then
      break
  end;
end;

{~~~~~~~~~~~~~~~~~~~~~~~
 Metodos de Impressora
~~~~~~~~~~~~~~~~~~~~~~~~}

procedure TtecECFMecaf.AbrirGaveta;
var
  Tipo, Ton, Toff: Char;
begin
  Self.ParamByName('DriverGaveta', Tipo);
  Self.ParamByName('GavetaOn', Ton);
  Self.ParamByName('GavetaOff', Toff);
  Self.AtualizarStatus(Meca_AbrirGaveta(Tipo, Ton, Toff));
end;

procedure TtecECFMecaf.LerAliquotasDaECF;
{var
  Tabela, Tributo: String;
  a: Integer;
begin
  inherited;
  AtualizarStatus(Meca_TransTabAliquotas);
  if Not Erro then begin
    Tabela := Copy(Self.FBuffer, MECA_INICIO_MSG+4, Length(Self.FBuffer));
    a := 0;
    repeat
      Tributo := Copy(Tabela, a * 4 + 1 , 4);
      if Tributo = '0000' then
        break;
      SetLength(FAliquotas, a + 1);
      FAliquotas[a] := Tributo;
      Inc(a);
    until False;
  end
}
var
  TotalAliq, idx: Integer;
begin
  inherited;
  ACBrECF1.CarregaAliquotas;

  TotalAliq := ACBrECF1.Aliquotas.Count;
  if Not Erro then begin
    SetLength(FAliquotas, TotalAliq);
    for idx := 0 to TotalAliq - 1 do
      FAliquotas[idx] := FloatToStr(ACBrECF1.Aliquotas[idx].aliquota);
  end
end;

procedure TtecECFMecaf.LerFormasPagamento;
{var
  a, b: Integer;
  Tabela,
  Indice,
  Forma: String;
begin
  inherited;
  AtualizarStatus(Meca_EcfPar(''));
  if Not Erro then begin
    Tabela := Copy(Self.FBuffer, 80, 512);
    a := 0;
    repeat
      Forma := Trim(Copy(Tabela, a * 32 + 1, 16));
      if Forma = '' then
        break;
      SetLength(FFormasPagamento, a + 1);
      FFormasPagamento[a] := Forma;
      Inc(a);
    until False;
    for a := 1 to High(ECF_FORMA_PAGTO) do begin
      for b := 0 to High(FFormasPagamento) do
        if ECF_FORMA_PAGTO[a] = FFormasPagamento[b] then
          break;
      if b > High(FFormasPagamento) then begin
        Indice := IntToStr(b);
        Preencher(2, 0, '0', Indice);
        Forma := ECF_FORMA_PAGTO[a];
        Preencher(16, ' ', Forma);
        AtualizarStatus(Meca_ProgramaLegenda(PChar(Indice),PChar(Forma)));
        if Not Erro then begin
          SetLength(FFormasPagamento, b + 1);
          FFormasPagamento[b] := ECF_FORMA_PAGTO[a];
        end
      end
    end
  end
}

  procedure MontaRecebimentosNaoFiscal;
  var
    Count, totalNaoFiscal: Integer;
  begin
    ACBrECF1.CarregaComprovantesNaoFiscais;
    totalNaoFiscal := ACBrECF1.ComprovantesNaoFiscais.Count;
    SetLength(FRecebimentosNaoFiscais, totalNaoFiscal);
    for count := 0 to totalNaoFiscal - 1 do
      FRecebimentosNaoFiscais[count] := AnsiUpperCase(ACBrECF1.ComprovantesNaoFiscais[count].Descricao);
  end;


begin
  inherited;
  VerificaFormasPagamento;
  if Not Erro then
    MontaRecebimentosNaoFiscal;
end;

function TtecECFMecaf.SerieMaquina: String;
begin
{  Self.AtualizarStatus(Meca_EcfID);
  Result := Copy(Self.FBuffer, MECA_INICIO_MSG + 4, 10);
  Result := SuprimirZeros(Result);
}
  Result := ACBrECF1.NumSerie;
end;

function TtecECFMecaf.NumeroMaquina: String;
begin
{  Self.AtualizarStatus(Meca_EcfID);
  Result := Copy(Self.FBuffer, MECA_INICIO_MSG + 14, 6);
  Result := SuprimirZeros(Result);
}
  Result := ACBrECF1.NumECF;
end;

function TtecECFMecaf.Cupom: String;
begin
{  Self.AtualizarStatus(Meca_EcfPar('41'));
  Result := Copy(Self.FBuffer, MECA_INICIO_MSG, 6);
  Result := SuprimirZeros(Result);
}
  Result := ACBrECF1.NumCupom;
end;

function TtecECFMecaf.Intervencao: String;
begin
{  Self.AtualizarStatus(Meca_TransTotCont);
  Result := Copy(Result, Length(Self.FBuffer) - 8, 4);
  Result := SuprimirZeros(Result);
}
  Result := ACBrECF1.NumCRO;
end;

function TtecECFMecaf.Data: String;
begin
{  Self.AtualizarStatus(Meca_TransDataHora);
  Result := Copy(Self.FBuffer, MECA_INICIO_MSG, 8) + ' '
          + Copy(Self.FBuffer, MECA_INICIO_MSG + 9, 8);
}
  Result := DateTimeToStr(ACBrECF1.DataHora);
end;

function TtecECFMecaf.DataReducao: String;
begin
{  Self.AtualizarStatus(Meca_EcfPar('83'));
  Result := Copy(Self.FBuffer, MECA_INICIO_MSG, 2) + '/'
          + Copy(Self.FBuffer, MECA_INICIO_MSG + 2, 2) + '/'
          + Copy(Self.FBuffer, MECA_INICIO_MSG + 4, 2);
}

end;

function TtecECFMecaf.CGC: String;
begin
{  Self.AtualizarStatus(Meca_EcfPar('88'));
  Result := Copy(Self.FBuffer, MECA_INICIO_MSG, 18);
  Result := SuprimirZeros(Result);
}
  Result := ACBrECF1.CNPJ;
end;

function TtecECFMecaf.CuponsDoDia: String;
var
  I, F: Integer;
begin
  Self.AtualizarStatus(Meca_EcfPar('82'));
  F := StrToInt(Copy(Self.FBuffer, MECA_INICIO_MSG, 6));
  I := StrToInt(Copy(Self.FBuffer, MECA_INICIO_MSG + 6, 6));
  Result := IntToStr(F - I);
  Result := SuprimirZeros(Result);
end;

function TtecECFMecaf.TotalizadorAcrescimo: String;
begin
{  Self.AtualizarStatus(Meca_EcfPar('37'));
  Result := Copy(Self.FBuffer, MECA_INICIO_MSG, 15);
  Result := SuprimirZeros(Result);
}
  Result := FloatToStr(ACBrECF1.TotalAcrescimos)
end;

function TtecECFMecaf.TotalizadorDesconto: String;
begin
{  Self.AtualizarStatus(Meca_EcfPar('36'));
  Result := Copy(Self.FBuffer, MECA_INICIO_MSG, 15);
  Result := SuprimirZeros(Result);
}
  Result := FloatToStr(ACBrECF1.TotalDescontos)
end;

procedure TtecECFMecaf.RecuperarResultado(var Valor: Integer);
const
  MaxTimeout = 30000;
var
  TimeOut, TimeOut1, count: Comp;
{$IFDEF LINUX}
  Buffer: String;
{$ENDIF}
begin
  TimeOut := Clock + MaxTimeout;
  repeat
    Sleep(1000);
{$IFNDEF LINUX}
     Valor := Meca_ObtemRetorno(Self.FBuffer);
     Count := Length(Self.FBuffer);
{$ELSE}
     Valor := Meca_ObtemRetorno(Buffer);
     Count := Length(Buffer);
     if Count = 0 then begin
       FillChar(FBuffer, 2001, 0);
     end else
       Move(Buffer[1], Self.FBuffer[0], Length(Buffer));
{$ENDIF}
    TimeOut1 := Clock;
  until (TimeOut1 > TimeOut) or ((Valor <> MECA_SEMRETORNO) and (Count >0));
end;

function TtecECFMecaf.AtualizarStatus(Codigo: Integer): Integer;
begin
  RecuperarResultado(Codigo);
  Erro := Codigo <> MECA_OK;
  case Codigo of
    MECA_BUFFERVAZIO                   : FMensagem := 'A ECF não esta respondendo';
    MECA_OK                            : FMensagem := 'Comando executado com sucesso';
    MECA_OK_CUPNF                      : FMensagem := 'Abrindo cupom relatório gerencial';
    MECA_OK_CANCCUP                    : FMensagem := 'Cancelando cupom';
    MECA_OK_PPAPEL                     : FMensagem := 'Detectado pouco papel';
    MECA_EMEXECUCAO                    : FMensagem := 'Comando não recebido pelo ECF';
    MECA_IRRECUPERAVEL                 : FMensagem := 'Erro irrecuperável';
    MECA_SEMRETORNO                    : FMensagem := 'Ainda não obteve retorno';
    MECA_OVERFLOW                      : FMensagem := 'Overflow';
    MECA_TIMEOUT                       : FMensagem := 'TimeOut na execução do comando';
    MECA_INVAL_CABECALHO               : FMensagem := 'O cabeçalho contém caracteres inválidos';
    MECA_INVAL_COMANDO                 : FMensagem := 'Comando inexistente';
    MECA_INVAL_NUMERO                  : FMensagem := 'Valor não numérico em campo numérico';
    MECA_INVAL_FAIXA                   : FMensagem := 'Valor fora da faixa entre 20h e 7Fh';
    MECA_INVAL_OPERADOR1               : FMensagem := 'Campo deveria iniciar com @, & ou %';
    MECA_INVAL_OPERADOR2               : FMensagem := 'Campo deveria iniciar com $, # ou ?';
    MECA_INVAL_INTERVALO_DATA          : FMensagem := 'O intervalo é inconsistente. No caso de datas, valores anteriores a ' +
                                                          '01/01/1995 serão considerados como pertencentes ao intervalo 2000-2094';
    MECA_INVAL_TOTAL                   : FMensagem := 'A string TOTAL não é aceita';
    MECA_INVAL_SINTAXE                 : FMensagem := 'A sintaxe do comando está errada';
    MECA_INVAL_LINHAS                  : FMensagem := 'Execedeu o número máximo de linhas permitido pelo comando';
    MECA_INVAL_TERMINADOR              : FMensagem := 'O terminador enviado não está obedecendo o protocolo de comunicação';
    MECA_INVAL_CHECKSUM                : FMensagem := 'O checksum enviado está incorreto';
    MECA_INVAL_SITUACAO_TRIBUTO        : FMensagem := 'A situação tributária deve iniciar com T, F ou N';
    MECA_INVAL_DATA                    : FMensagem := 'Data inválida';
    MECA_INVAL_HORA                    : FMensagem := 'Hora inválida';
    MECA_INVAL_INTERVALO_ALIQUOTA      : FMensagem := 'Alíquota não programada ou fora da intervalo';
    MECA_INVAL_SINAL                   : FMensagem := 'O campo de sinal está incorreto';
    MECA_INVAL_ALFANUMERIO             : FMensagem := 'Campo somente de caracteres não-numéricos';
    MECA_ACPT_CUPOM_FISCAL             : FMensagem := 'Comando não pode ser aceito durante um cupom fiscal';
    MECA_ACPT_CUPOM_NAO_FISCAL         : FMensagem := 'Comando não aceito em cupom não fiscal';
    MECA_MEM_NAO_VENDAS                : FMensagem := 'A memória fiscal não permite mais realizar vendas ' +
                                                          'Só é possível executar Leitura X ou Leitura da Memória Fiscal';
    MECA_MEM_INTERVENCAO               : FMensagem := 'A memória fiscal não permite mais realizar vendas ' +
                                                          'Só é possível executar Leitura X ou Leitura da Memória Fiscal ' +
                                                          'ocorreu algum problema na memória NOVRAM. Será necessário ' +
                                                          'realizar uma Intervenção Fiscal';
    MECA_STAT_CMD_EXECUTANDO           : FMensagem := 'Comando válido ainda em execução';
    MECA_STAT_IMP_CHEQUE               : FMensagem := 'Está em estado de impressão de cheques';
    MECA_STAT_NAO_IMP_CHEQUE           : FMensagem := 'Não está em estado de impressão de cheques';
    MECA_ERR_MODO_INTERVENCAO          : FMensagem := 'Comando só aceito durante Intervenção Fiscal';
    MECA_ERR_MODO_NORMAL               : FMensagem := 'Comando só aceito durante Modo Normal';
    MECA_ERR_ABRIR_CUPOM_FISCAL        : FMensagem := 'Necessário abrir cupom fiscal';
    MECA_ERR_ABRIR_CUPOM_NAO_FISCAL    : FMensagem := 'Necessário abrir cupom não fiscal';
    MECA_ERR_RELOGIO_VERAO             : FMensagem := 'O relógio já está em horário de verão';
    MECA_ERR_RELOGIO_NAO_VERAO         : FMensagem := 'O relógio não está em horário de verão';
    MECA_ERR_REALIZAR_REDUCAOZ         : FMensagem := 'Necessário realizar Redução Z';
    MECA_ERR_FECHA_REDUCAOZ_EXECUTADO  : FMensagem := 'Fechamento do dia (Redução Z) já executado';
    MECA_ERR_PROGRAMAR_LEGENDA         : FMensagem := 'Necessário programar legenda';
    MECA_ERR_ITEM_CANCELADO            : FMensagem := 'Item já cancelado ou item inexistente';
    MECA_ERR_CUPOM_NAO_PODE_CANCELAR   : FMensagem := 'Cupom anterior não pode ser cancelado';
    MECA_ERR_FALTA_PAPEL               : FMensagem := 'Detectado Falta de Papel';
    MECA_ERR_PROGRAMAR_ESTABELECIMENTO : FMensagem := 'Necessário programar os dados do estabelecimento';
    MECA_ERR_REALIZAR_INTERVENCAO      : FMensagem := 'Necessário realizar Intervenção Fiscal';
    MECA_ERR_PROGRAMAR_RELOGIO         : FMensagem := 'Necessário programar a data do relógio';
    MECA_ERR_ITENS_CUPOM               : FMensagem := 'Número máximo de itens por cupom ultrapassado';
    MECA_ERR_AJUSTE_HORA               : FMensagem := 'Já foi realizado o ajuste de hora diário';
    MECA_ERR_INSERIR_CHEQUE            : FMensagem := 'Necessário inserir o cheque';
    MECA_ERR_INSERIR_BOBINA            : FMensagem := 'Necessário inserir nova bobina';
    MECA_ERR_REALIZAR_LEITURAX         : FMensagem := 'Necessário executar uma Leitura X';
    MECA_ERR_IMPRESSORA                : FMensagem := 'Detectado algum problema na impressora (paper jam, sobretensão, etc)';
    MECA_ERR_CUPOM_TOTALIZADO          : FMensagem := 'Cupom já foi totalizado';
    MECA_ERR_TOTALIZAR_CUPOM           : FMensagem := 'Necessário totalizar cupom antes de fechar';
    MECA_ERR_FINALIZAR_CUPOM           : FMensagem := 'Necessário finalizar cupom antes de fechar';
    MECA_ERR_GRAVAR_MEMORIA            : FMensagem := 'Ocorreu erro de gravação da memória fiscal';
    MECA_ERR_NUMERO_ESTABELECIMENTO    : FMensagem := 'Excedeu número máximo de estabelecimentos';
    MECA_ERR_MEMORIA_INICIADA          : FMensagem := 'Memória fiscal não iniciada';
    MECA_ERR_ULTRAPASSA_PAGAMENTO      : FMensagem := 'Ultrapassou valor do pagamento';
    MECA_ERR_TROCO_REALIZADO           : FMensagem := 'Registrador não programado ou troco já realizado';
    MECA_ERR_COMPLETAR_PAGAMENTO       : FMensagem := 'Falta completar valor do pagamento';
    MECA_ERR_NUMERO_CARACTER           : FMensagem := 'Excedeu campo máximo de caracteres';
    MECA_ERR_TROCO_NAO_REALIZADO       : FMensagem := 'Troco não realizado';
    MECA_ERR_CMD_DESABILITADO          : FMensagem := 'Comando desabilitado';
    MECA_ERR                           : FMensagem := 'Falha Geral';
    MECA_ERR_CONFIG                    : FMensagem := 'Erro no arquivo Cif.ini';
    MECA_ERR_SERIAL                    : FMensagem := 'Erro na abertura da serial';
    MECA_ERR_ANSWER                    : FMensagem := 'Retorno não identificado';
    MECA_ERR_READSER                   : FMensagem := 'Falha na leitura da serial';
    MECA_ERR_TEMP                      : FMensagem := 'Temperatura da cabeça está alta';
    MECA_ERR_PPAPEL                    : FMensagem := 'Pouco papel na impressora';
    MECA_ERR_MECANICO                  : FMensagem := 'Erro mecânico';
    MECA_ERR_TABERTA                   : FMensagem := 'A tampa está aberta. Verifique a impressora';
  {$IFDEF MSWINDOWS}
    MECA_ERR_SYS                       : FMensagem := 'Erro na alocação de recursos do Windows';
  {$ENDIF}
  end;
  Result := Codigo;
end;

{~~~~~~~~~~~~~~~~~~~~~~~
 Metodos p/ Cupom Fiscal
~~~~~~~~~~~~~~~~~~~~~~~~}

procedure TtecECFMecaf.IniciarCupom(CGC_CPF, Nome, Endereco: String);
begin
{  Self.AtualizarStatus(Meca_AbreCupomFiscal);
  Sleep(300);
}
  if (CGC_CPF <> '') and (Nome <> '') and (Endereco <> '') then
    ACBrECF1.AbreCupom(CGC_CPF, Nome, Endereco)
  else
    ACBrECF1.AbreCupom('', '', '');
end;

procedure TtecECFMecaf.CancelarCupom;
begin
{  AtualizarStatus(Meca_CancelaCupomFiscal);}
  ACBrECF1.CancelaCupom;
//  ACBrECF1.PulaLinhas(6);
end;

procedure TtecECFMecaf.TotalizaCupom(TipoDesconto, Desconto: String);
{var
  TipoDesc, AcresDesc: Char;
  APIResult: Integer;
  MsgOP: String;
begin
  if StrToFloat(Desconto) <= 0 then begin
    AcresDesc := Char(0);
    Desconto := Copy(Desconto, 2, Length(Desconto));
    MsgOP := 'Desconto'
  end else begin
    AcresDesc := '@';
    MsgOP := 'Acrescimo'
  end;
  Preencher(14, ' ', MsgOP);
  if TipoDesconto = '%' then begin
    TipoDesc := '%';
    Preencher(4, 2, '0', Desconto);
  end else begin
    TipoDesc := '&';
    Preencher(15, 2, '0', Desconto);
  end;
  APIResult := Meca_TotalizarCupom(AcresDesc, TipoDesc, PChar(Desconto), PChar(MsgOP));
  Self.AtualizarStatus(APIResult);
}
begin
  ACBrECF1.SubtotalizaCupom(StrToFloat(Desconto));
end;
*)
procedure TtecECFMecaf.PagamentoCupom(FormaPagto, Valor: String);
(*var
  IFormaPagto: String;
begin
  Preencher(14, ' ', FormaPagto);
  IFormaPagto := ConverteFormaPagto(FormaPagto);
  Preencher(15, 2, '0', Valor);
  AtualizarStatus(Meca_PagamentoA(PChar(IFormaPagto), PChar(Valor), '1'));
*)
begin
  FormaPagto := ConverteFormaPagto(FormaPagto,0);
  inherited PagamentoCupom(FormaPagto,Valor);
end;
(*
procedure TtecECFMecaf.FinalizarCupom(FormaPagto, Total, Mensagem: String);
{var
  IFormaPagto,
  MsgSize: String;
  APIResult: Integer;
}
begin
{Efetua troco}
{  IFormaPagto := ConverteFormaPagto(FormaPagto);
  AtualizarStatus(Meca_PagamentoA(PChar(IFormaPagto), PChar(StringOfChar('0', 15)), '1'));
  if Not Erro then begin
    MsgSize := IntToStr(Length(Mensagem));
    Preencher(3, 0, '0', MsgSize);
    APIResult := Meca_FechaCupomFiscalA(PChar('S' + MsgSize), PChar(Mensagem));
    AtualizarStatus(APIResult);
  end
}
  ACBrECF1.FechaCupom(Mensagem);
//  ACBrECF1.PulaLinhas(6);
end;

procedure TtecECFMecaf.VenderItem(Codigo, Descricao, Preco, Quantidade, Unidade,
  Tributo: String; TipoDesconto: Char; Desconto, Filial: String;
  TipoTributo: TtecTributo);
{var
 ITributo: String;
 APIResult: Integer;
begin
  if TipoDesconto = '$' then begin
    TipoDesconto := '&';
    Preencher(15, 2, '0', Desconto);
  end else
    Preencher(4, 2, '0', Desconto);
  Preencher(6, 3, '0', Quantidade);
  Preencher(11, 2, '0', Preco);
  Preencher(2, ' ', Unidade);
  Preencher(13, ' ', Codigo);
  Preencher(38, ' ', Descricao);
  case TipoTributo of
   tbNTributado: ITributo := 'N00';
       tbIsento: ITributo := 'I00';
    tbSubstitui: ITributo := 'F00';
    tbServico:   ITributo := 'T00';
   else
     ITributo := 'T' + ConverteAliquota(Tributo);
  end;
  if Not Erro then begin
    APIResult := Meca_VendaItem(#0, PChar(Quantidade), PChar(Preco), PChar(ITributo),
                                TipoDesconto, PChar(Desconto), PChar(Unidade),
                                PChar(Codigo), '1', PChar(Descricao), '');
    Self.AtualizarStatus(APIResult);
  end
}
begin
  ACBrECF1.VendeItem(codigo,descricao,tributo,StrToFloat(quantidade),StrToFloat(preco),StrToFloat(desconto),unidade,tipodesconto);
end;

procedure TtecECFMecaf.CancelarItem(Numero: String);
begin
{  if StrToInt(Numero) < 1 then
    Numero := '1'
  else
  if StrToInt(Numero) > 450 then
    Numero := '450';
  Preencher(3, 0, '0', Numero);
  Self.AtualizarStatus(Meca_CancelamentoItem(PChar(Numero)));
}  ACBrECF1.CancelaItemVendido(StrToInt(Numero));
end;

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Metodos p/ Operaçoes Não Fiscais
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
*)
procedure TtecECFMecaf.IniciarVinculado(FormaPagto, Valor, Cupom: String);
begin
{  AtualizarStatus(Meca_AbreCupomVinculado);}
  FormaPagto := ConverteFormaPagto(FormaPagto,0);
  inherited IniciarVinculado(FormaPagto,Valor,Cupom);
end;
(*
procedure TtecECFMecaf.CancelarVinculado;
begin
//  AtualizarStatus(Meca_CancelaCupomNaoFiscal);
  ACBrECF1.FechaRelatorio;
end;

procedure TtecECFMecaf.ImprimirVinculado(Texto: array of String);
var
  a: Integer;
begin
{  for a := 0 to High(Texto) do begin
    Preencher(48, ' ', Texto[a]);
    AtualizarStatus(Meca_ImprimeLinhaNaoFiscalA('0', PChar(Texto[a])));
    if Erro then
      break
  end
}
  for a := 0 to High(Texto) do begin
    ACBrECF1.LinhaCupomVinculado(Texto[a]);
    if Erro then
      break
  end
end;

procedure TtecECFMecaf.FinalizarVinculado;
begin
{  AtualizarStatus(Meca_EncerraCupomNaoFiscal);}
  ACBrECF1.FechaRelatorio;
end;

procedure TtecECFMecaf.ImprimirNaoVinculado(Registrador, FormaPagto, Valor: String);
begin
  inherited;
  ImprimirNaoVinculado(Registrador, FormaPagto, Valor, '&', '0', '');
end;

procedure TtecECFMecaf.ImprimirNaoVinculado(Registrador, FormaPagto, Valor, TipoDesconto, Desconto, Msg: String);
var
  TipoDesc, AcresDesc: Char;
  MsgOP: String;

begin
{  if StrToInt(Desconto) <= 0 then begin
    AcresDesc := #0;
    Desconto := Copy(Desconto, 2, Length(Desconto));
    MsgOP := 'Desconto'
  end else begin
    AcresDesc := '@';
    MsgOP := 'Acrescimo'
  end;
  Preencher(14, ' ', MsgOP);
  if TipoDesconto = '%' then begin
    TipoDesc := '%';
    Preencher(4, 2, '0', Desconto);
  end else begin
    TipoDesc := '&';
    Preencher(15, 2, '0', Desconto);
  end;
  Preencher(15, 2, '0', Valor);
  AtualizarStatus(Meca_ProgramaLegenda(PChar('16'),PChar(Registrador)));
  AtualizarStatus(Meca_AbreCupomNaoVinculado);
  AtualizarStatus(Meca_OperRegNaoVinculadoA(PChar('16'), PChar(Valor),
                  AcresDesc, TipoDesc, PChar(Desconto),PChar(Msg)));
  AtualizarStatus(Meca_PagamentoA(PChar('16'), PChar(Valor), #0));
  AtualizarStatus(Meca_EncerraCupomNaoFiscal);
}
end;

{~~~~~~~~~~~~~~~~~~~~~~~
 Metodos p/ Relatorios
~~~~~~~~~~~~~~~~~~~~~~~~}

procedure TtecECFMecaf.ReducaoZ;
begin
{  Self.AtualizarStatus(Meca_ReducaoZ('0'));}
  ACBrECF1.ReducaoZ();
//  ACBrECF1.PulaLinhas(6);
end;

procedure TtecECFMecaf.LeituraX;
begin
{  Self.AtualizarStatus(Meca_LeituraX('0'));}
  ACBrECF1.LeituraX;
//  ACBrECF1.PulaLinhas(6);
end;

procedure TtecECFMecaf.RelatorioGerencial(Texto: array of String);
var
  a: Integer;
begin
{  AtualizarStatus(Meca_LeituraX('1'));
  AtualizarStatus(Meca_AbreCupomNaoVinculado);
  for a := 0 to High(Texto) do begin
    Meca_ImprimeNaoFiscal(#1, PChar(Texto[a]));
    if Erro then
      break
  end

begin
}
  ACBrECF1.AbreRelatorioGerencial;
  for a := 0 to High(Texto) do
  begin
    ACBrECF1.LinhaRelatorioGerencial(Texto[a]);
  end;
end;

procedure TtecECFMecaf.FecharRelatorioGerencial;
begin
{  Self.AtualizarStatus(Meca_EncerraCupomNaoFiscal);}
  ACBrECF1.FechaRelatorio;
end;

procedure TtecECFMecaf.Autenticar;
{var
  coment: String;
begin
  coment := Preencher(40);
  AtualizarStatus(Meca_ModoChequeValidacao('0','0'));
  AtualizarStatus(Meca_ImprimeValidacao(Pchar('Aut  '),PChar(coment)));
}
begin
  ACBrECF1.EnviaComando('ImprimeAutenticacao');
end;

function TtecECFMecaf.GerarMapa: TtecMapaECF;
{var
  Idx: Integer;
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
    AtualizarStatus(Meca_TransTabAliquotas);
    Aliquotas := Copy(Self.FBuffer, MECA_INICIO_MSG, Length(Self.FBuffer));
    Tributos := Tributados;
    for Idx := 0 to 15 do
    begin
      Valor := Copy(Aliquotas, 1 , 4);
      if Valor <> '0000' then
      begin
        with Result[Length(Result) - 1] do
        begin
          SetLength(ttrib, Length(ttrib) + 1);
          ttrib[Length(ttrib) - 1].base := ToDouble(Valor);
          Valor := Copy(Tributos, 1 , 15);
          ttrib[Length(ttrib) - 1].valor := ToDouble(Valor);
        end;
      end;
      Delete(Aliquotas, 1, 4);
      Delete(Tributos, 1, 15);
    end;
  end;
}
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

function TtecECFMecaf.CupomAberto: Boolean;
{var
  Status: PChar;
begin
  New(Status);
  Meca_TransStatus(8, Status);
  Result := Status = '1';
  Dispose(Status)
}
begin
  Result := ACBrECF1.estado in [estVenda,estPagamento];
end;

function TtecECFMecaf.FechaRelatorioXouZ: Integer;
begin
{  Result := AtualizarStatus(Meca_EncerraCupomNaoFiscal)}
  ACBrECF1.FechaNaoFiscal;
end;

function TtecECFMecaf.VerificaFormasPagamento: Integer;
var
  a, totalFormas: Integer;
begin
try
  ACBrECF1.CarregaFormasPagamento;
  totalFormas := ACBrECF1.FormasPagamento.Count;
  if Not Erro then begin
    SetLength(FFormasPagamento,totalFormas);
    for a := 0 to totalFormas - 1 do
      FFormasPagamento[a] :=  ACBrECF1.FormasPagamento[a].Descricao;
  end
except
  on E: Exception do MensagemErro(E.Message);
end;
end;

procedure TtecECFMecaf.LeituraMemoriaFiscalData(DataInicial,
  DataFinal: String);
begin
  inherited;
  ACBrECF1.LeituraMemoriaFiscal(StrToDate(DataInicial),StrToDate(DataFinal));
end;

procedure TtecECFMecaf.LeituraMemoriaFiscalReducao(ReducaoInicial,
  ReducaoFinal: String);
begin
  inherited;
  ACBrECF1.LeituraMemoriaFiscal(StrToInt(ReducaoInicial), StrToInt(ReducaoFinal));
end;

function TtecECFMecaf.LeituraMemoriaFiscalSerialDataMFD(DataInicial,
  DataFinal, FlagLeitura: String): boolean;
var
  Linhas : TStringList;
begin
  Linhas := TStringList.Create;
  ACBrECF1.LeituraMemoriaFiscalSerial(StrToDateTime(DataInicial), StrToDateTime(DataFinal), Linhas);
end;
*)
end.
