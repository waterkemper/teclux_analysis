unit cpsacsockets;

interface

uses
 Classes, SysUtils, Types, Controls, IdBaseComponent, IdComponent,
 IdTCPServer, IniFiles;

const
  BufferSize = 200;
  HeaderSize = 8;

type

 EtecSocket = class (Exception);

 TtecBuffer = array [1..BufferSize] of Byte;

 TtecCommandResult = record
   Chamada:   LongWord;
   CallId:    Word;
   CmdResult: Word;
 end;

{ TtecTcpSocket }

 TtecTcpSocket = class(TComponent)
 private
   FServidorTcp: TIdTCPServer;
   procedure MoveDWord (var Buf: TtecBuffer; Pac: LongWord; var LenPac: Word);
   procedure MoveWord  (var Buf: TtecBuffer; Pac: Word; var LenPac: Word);
   procedure MoveByte  (var Buf: TtecBuffer; Pac: Byte; var LenPac: Word);
   procedure MoveString(var Buf: TtecBuffer; Pac: String; var LenPac: Word);
   procedure MoveBCD   (var Buf: TtecBuffer; Pac: String; var LenPac: Word);
 protected
   function  EnviarComando(Comando: TtecBuffer; Tamanho: Word): TtecBuffer; virtual;
   function  CalcularPulo(Indice: Integer): Integer; virtual;
 public
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
   function  VerificaPacote(Buf: TtecBuffer; Pos, Pacote: Integer): Variant; virtual;
   function  ComporComando(TipoComando: Integer; Params: Array of Variant): TtecBuffer; virtual;
   function DecomporComando(Comando: TtecBuffer): TtecCommandResult; virtual;
   procedure LerParametros(Arquivo: TFileName); virtual;
   procedure Conectar;
   procedure Desconectar;
   property TcpServer: TIdTCPServer read FServidorTcp write FServidorTcp;
 end;

{ TtecDigitroTcpSocket }

type

 TdigAcaoChamada = (acGrupo, acPrioridade, acPA, acOperador, acCSP, acMensagem);

 TdigAcoes = Set of TdigAcaoChamada;

 TdigChaveChamada = record
   bDia       : Byte;
   bMes       : Byte;
   bAno       : Byte;
   bHora      : Byte;
   bMinuto    : Byte;
   bSegundo   : Byte;
   wChave     : Word;
   wInstancia : Word;
 end;

 TdigComando = (cmAtivar = 1, cmExecutar = 2, cmDerrubar = 3);

 TdigResposta = (rpAtivarServico = $03,
                 rpDesativarServico = $05,
                 rpAtivarDesativar = $07,
                 rpAlocaInstancia = $0A,
                 rpExecutandoAcao = $0C,
                 rpExecutarAcao = $0E,
                 rpAtendimento = $12
                 );

 TdigResultadoAlocacao = (raSucesso = $00, raFalha = $01);

 TdigResultadoChamada = (rcNada = $0000,
                         rcRedeCongestionada = $0001,
                         rcCentralDestinoCongestionada = $0003,
                         rcEnderecoIncompleto = $0004,
                         rcFalhaChamada = $0005,
                         rcAssinanteOcupado = $0006,
                         rcNumeroInexistente = $0007,
                         rcLinhaForaServico = $0008,
                         rcPrefixoMalRegistrado = $000C,
                         rcNumeroMudado = $000D,
                         rcSucesso01 = $0100,
                         rcSucesso02 = $0101,
                         rcSucesso03 = $0102,
                         rcSucesso04 = $0103,
                         rcSucesso05 = $0104,
                         rcSucesso06 = $0105,
                         rcSucesso07 = $0106,
                         rcSucesso08 = $0107,
                         rcSucesso09 = $0140,
                         rcSucesso10 = $0141,
                         rcSucesso11 = $0142,
                         rcSucesso12 = $0143,
                         rcSucesso13 = $0144,
                         rcSucesso14 = $0145,
                         rcSucesso15 = $0146,
                         rcSucesso16 = $0147
                        );

 TdigResultadoServico = (rsQuedaLinha = $0000,
                         rsRecebeuInformacao = $0001,
                         rsExecedeuTentativas = $0002,
                         rsForadeHorario = $0003,
                         rsBDIndisponivelInterno = $0004,
                         rsTimeOutConsultaBDInterno = $0005,
                         rsOutros = $0006,
                         rsBDIndisponivelExterno = $0007,
                         rsTimeOutConsultaBDExterno = $0008,
                         rsServicoInexistente = $0009,
                         rsFalhaCanal = $000A,
                         rsFalhaComutacao = $000B,
                         rsFalhaAlocaoInstancia = $000C,
                         rsFalhaMensagem = $000D,
                         rsNaoAtendeu = $0010,
                         rsFalhaAlocaLinha = $0011,
                         rsTimeOutGerarChamada = $0012,
                         rsFalhaComutacaoLinha = $0013,
                         rsLiberacaoCentralDestino = $0014,
                         rsOperadorDesligou = $0015,
                         rsClienteDesligou = $0016,
                         rsGeracao = $0017,
                         rsDerrubadaPorAplicacao = $0018,
                         rsPAIndisponivel = $0020,
                         rsGrupoIndisponivel =$0021,
                         rsOperadorIndisponivel = $0022,
                         rsTimeOutAtendimento = $0023,
                         rsOperadorLiberado = $0030,
                         rsOperadorNaoLiberado = $0031,
                         rsTransferenciaRamal = $0035,
                         rsIndefinido = $FFFF
                        );

 TtecDigitroTcpSocket = class(TtecTcpSocket)
 private
   FTelemarketing: String;
   FServico: Word;
   FOrigem: Word;
   FDestino: Word;
   FGrupos: Array of Integer;
   FFrases: Array of Integer;
   FComplementos: Array of Integer;
   FAcoesChamada: TdigAcoes;
   function  GetFrases(Index: Integer): Integer;
   function  GetComplementos(Index: Integer): Integer;
   procedure SetFrases(Index: Integer; Value: Integer);
   procedure SetComplementos(Index: Integer; Value: Integer);
 protected
   function  EnviarComando(Comando: TtecBuffer; Tamanho: Word): TtecBuffer; override;
   function  CalcularPulo(Indice: Integer): Integer; override;
   function  GetAcoes: Word;
   function  GetGrupos: Word;
   function  AtivarServico(Params: Array of Variant): TtecBuffer;
   function  ExecutarAcao(Params: Array of Variant): TtecBuffer;
   function  DerrubarChamada(Params: Array of Variant): TtecBuffer;
   function InstanciaAlocada(Comando: TtecBuffer): TtecCommandResult;
   function ExecutandoAcao(Comando: TtecBuffer): TtecCommandResult;
   function SinalizaAtendimento(Comando: TtecBuffer): TtecCommandResult;
   function RespostaExecutarAcao(Comando: TtecBuffer): TtecCommandResult;

 public
   constructor Create(AOwner: TComponent); override;
   function VerificaPacote(Buf: TtecBuffer; Pos, Pacote: Integer): Variant; override;
   function ComporComando(TipoComando: Integer; Params: Array of Variant): TtecBuffer; override;
   function DecomporComando(Comando: TtecBuffer): TtecCommandResult; override;
   procedure LerParametros(Arquivo: TFileName); override;
   property Servico: Word read FServico write FServico;
   property Origem: Word read FOrigem write FOrigem;
   property Destino: Word read FDestino write FDestino;
   property Telemarketing: String read FTelemarketing write FTelemarketing;
   property Frases[Index: Integer]: Integer read GetFrases write SetFrases;
   property Complementos[Index: Integer]: Integer read GetComplementos write SetComplementos;
   property AcoesChamada: TdigAcoes read FAcoesChamada write FAcoesChamada;
 end;

implementation

{ TtecTcpSocket }

constructor TtecTcpSocket.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FServidorTcp:= TIdTCPServer.Create(Self);
end;

destructor TtecTcpSocket.Destroy;
begin
  FServidorTcp.Free;
  inherited Destroy;
end;

procedure TtecTcpSocket.Conectar;
begin
  FServidorTcp.Active:= True;
end;

procedure TtecTcpSocket.Desconectar;
begin
  FServidorTcp.Active:= False;
end;

{ coloca 4 bytes no buffer }
procedure TtecTcpSocket.MoveDWord(var Buf: TtecBuffer; Pac: LongWord; var LenPac: Word);
begin
  Buf[LenPac]:= Pac shr 24; // LSB
  Inc(LenPac);
  Buf[LenPac]:= Pac shr 16 and 255;
  Inc(LenPac);
  Buf[LenPac]:= Pac shr 8 and 255;
  Inc(LenPac);
  Buf[LenPac]:= Pac and 255; // MSB
  Inc(LenPac);
end;

{ colocar 2 bytes no buffer }
procedure TtecTcpSocket.MoveWord(var Buf: TtecBuffer; Pac: Word; var LenPac: Word);
begin
  Buf[LenPac]:= Pac shr 8;   // LSB
  Inc(LenPac);
  Buf[LenPac]:= Pac and 255; // MSB
  Inc(LenPac);
end;

{ coloca 1 byte no buffer }
procedure TtecTcpSocket.MoveByte(var Buf: TtecBuffer; Pac: Byte; var LenPac: Word);
begin
  Buf[LenPac]:= Pac;
  Inc(LenPac);
end;

{ coloca n bytes no buffer }
procedure TtecTcpSocket.MoveString(var Buf: TtecBuffer; Pac: String; var LenPac: Word);
var
  cnt: Byte;
begin
   for cnt:= 1 to Length(Pac) do
   begin
      Buf[LenPac]:= Ord(Pac[cnt]);
      Inc(LenPac);
   end;
end;

{ transforma 2 bytes em 1 byte e coloca no buffer }
procedure TtecTcpSocket.MoveBCD(var Buf: TtecBuffer; Pac: String; var LenPac: Word);
var
  cnt: Byte;
begin
   if Length(Pac) <> 0 then
   begin
     if Length(Pac) mod 2 = 1 then
        Pac:= Pac + ':';
     cnt:= 1;
     repeat
        Buf[LenPac]:= (Ord(Pac[cnt])- $30) shl 4 + (Ord(Pac[cnt + 1])- $30);
        Inc(LenPac);
        Inc(cnt,2);
     until cnt > Length(Pac);
   end;
end;

procedure TtecTcpSocket.LerParametros(Arquivo: TFileName);
begin
end;

function TtecTcpSocket.ComporComando(TipoComando: Integer; Params: Array of Variant): TtecBuffer;
begin
end;

function TtecTcpSocket.DecomporComando(Comando: TtecBuffer): TtecCommandResult;
begin
end;

function TtecTcpSocket.VerificaPacote(Buf: TtecBuffer; Pos, Pacote: Integer): Variant;
begin
   Result:= 0;
end;

function TtecTcpSocket.CalcularPulo(Indice: Integer): Integer;
begin
  Result:= 0;
end;

function TtecTcpSocket.EnviarComando(Comando: TtecBuffer; Tamanho: Word): TtecBuffer;
begin
end;

{ TtecDigitroTcpSocket }

constructor TtecDigitroTcpSocket.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TtecDigitroTcpSocket.SetFrases(Index: Integer; Value: Integer);
begin
  FFrases[Index]:= Value;
end;

function TtecDigitroTcpSocket.GetFrases(Index: Integer): Integer;
begin
  Result:= FFrases[Index];
end;

procedure TtecDigitroTcpSocket.SetComplementos(Index: Integer; Value: Integer);
begin
  FComplementos[Index]:= Value;
end;

function TtecDigitroTcpSocket.GetComplementos(Index: Integer): Integer;
begin
  Result:= FComplementos[Index];
end;

procedure TtecDigitroTcpSocket.LerParametros(Arquivo: TFileName);
var
  IniFile: TIniFile;
  cnt: Integer;
begin
  if not FileExists(Arquivo) then
    raise EtecSocket.Create('Arquivo de parâmetros não existe.');
  try
    IniFile:= TIniFile.Create(Arquivo);
{ Gerais }
    FTelemarketing:= IniFile.ReadString('Gerais', 'VK_Telemarketing', '0');
    FOrigem:= IniFile.ReadInteger('Gerais', 'VK_Origem', $0000);
    FDestino:= IniFile.ReadInteger('Gerais', 'VK_Destino', $0000);
{ Acoes }
    if IniFile.ReadBool('Acao', 'grupo', False) then
      FAcoesChamada:= FAcoesChamada + [acGrupo];
    if IniFile.ReadBool('Acao', 'prioridade', False) then
      FAcoesChamada:= FAcoesChamada + [acPrioridade];
    if IniFile.ReadBool('Acao', 'pa', False) then
      FAcoesChamada:= FAcoesChamada + [acPA];
    if IniFile.ReadBool('Acao', 'operador', False) then
      FAcoesChamada:= FAcoesChamada + [acOperador];
    if IniFile.ReadBool('Acao', 'csp', False) then
      FAcoesChamada:= FAcoesChamada + [acCSP];
    if IniFile.ReadBool('Acao', 'mensagem', False) then
      FAcoesChamada:= FAcoesChamada + [acMensagem];
{ Grupos }
    SetLength(FGrupos, IniFile.ReadInteger('Grupo', 'num_grupos', 0));
    for cnt:= 0 to High(FGrupos) do
       FGrupos[cnt]:= IniFile.ReadInteger('Grupo', 'grupo_' + IntToStr(cnt + 1), 0);
{ Frases }
    SetLength(FFrases, IniFile.ReadInteger('Mensagem', 'num_frases', 0));
    for cnt:= 0 to High(FFrases) do
       FFrases[cnt]:= IniFile.ReadInteger('Mensagem', 'frase_' + IntToStr(cnt + 1), 0);
{ Complementos }
    SetLength(FComplementos, IniFile.ReadInteger('Complemento', 'num_complementos', 0));
    for cnt:= 0 to High(FComplementos) do
       FComplementos[cnt]:= IniFile.ReadInteger('Complemento', 'complemento_' + IntToStr(cnt + 1), 0);
    IniFile.Free;
  except
    raise Exception.Create('Problemas no arquivo ' + Arquivo);
  end;
end;

function TtecDigitroTcpSocket.ComporComando(TipoComando: Integer; Params: Array of Variant): TtecBuffer;
begin
  case TdigComando(TipoComando) of
          cmAtivar: if High(Params) <> 1 then
                     raise EtecSocket.Create('Erro na quantidade de parâmetros. Comando ' + IntToStr(TipoComando))
                    else
                      Result:= AtivarServico(Params);
        cmExecutar: if High(Params) <> 2 then
                      raise EtecSocket.Create('Erro na quantidade de parâmetros. Comando ' + IntToStr(TipoComando))
                    else
                      Result:= ExecutarAcao(Params);
        cmDerrubar: if High(Params) <> 0 then
                      raise EtecSocket.Create('Erro na quantidade de parâmetros. Comando ' + IntToStr(TipoComando))
                    else
                      Result:= DerrubarChamada(Params);
  else raise EtecSocket.Create('O comando solicitado não existe. Comando ' + IntToStr(TipoComando));
  end;
end;

function TtecDigitroTcpSocket.DecomporComando(Comando: TtecBuffer): TtecCommandResult;
var
  Resposta: Word;
begin
  Resposta:= Comando[9];
  case TdigResposta(Resposta) of
    rpAlocaInstancia: Result:= InstanciaAlocada(Comando);
    rpExecutandoAcao: Result:= ExecutandoAcao(Comando);
    rpAtendimento   : Result:= SinalizaAtendimento(Comando);
    rpExecutarAcao  : Result:= RespostaExecutarAcao(Comando)
  end;
end;

function TtecDigitroTcpSocket.CalcularPulo(Indice: Integer): Integer;
begin
  Result:= 0;
end;

function TtecDigitroTcpSocket.GetAcoes: Word;
begin
  Result:= $0000;
  if acGrupo in FAcoesChamada then
    Inc(Result, $0001);
  if acPrioridade in FAcoesChamada then
    Inc(Result, $0002);
  if acPA in FAcoesChamada then
    Inc(Result, $0004);
  if acOperador in FAcoesChamada then
    Inc(Result, $0008);
  if acCSP in FAcoesChamada then
    Inc(Result, $0010);
  if acMensagem in FAcoesChamada then
    Inc(Result, $0020);
end;

function TtecDigitroTcpSocket.GetGrupos: Word;
begin
  Result:= $0000;
end;

function TtecDigitroTcpSocket.VerificaPacote(Buf: TtecBuffer; Pos,Pacote: Integer): Variant;
begin
  case Pacote of
    1: Result:= Buf[6] + (Buf[5] shl 8);
    2: Result:= Buf[9];
    3: Result:= Buf[11] + (Buf[10] shl 8);
    4: Result:= Buf[14] = 1;
    5: Result:= Buf[Pos] <> FDestino shr 8;
    6: Result:= Buf[Pos] <> FDestino and 255;
    7: Result:= Buf[Pos] <> FOrigem shr 8;
    8: Result:= Buf[Pos] <> FOrigem and 255;
    9: Result:= Buf[Pos] <> 0;
   10: Result:= Buf[27] + (Buf[26] shl 8) + (Buf[25] shl 16) + (Buf[24] shl 24);
   11: Result:= Buf[21] + (Buf[20] shl 8);
  end;
end;

{PROTOCOLO GERADOR DE CHAMADAS DIGITRO}

{ monta um pacote de dados valido (header + dados) }
function TtecDigitroTcpSocket.EnviarComando(Comando: TtecBuffer; Tamanho: Word): TtecBuffer;
var
  Tam: Word;
begin
  FillChar(Result, SizeOf(Result), 0);
  Tam:= 1;
{ monta header do pacote }
  MoveWord(Result, FOrigem, Tam);                       // ORG
  MoveWord(Result, FDestino, Tam);                      // DST
  MoveWord(Result, Tamanho + 8, Tam);                   // TamF
  MoveWord(Result, Tamanho, Tam);                       // TamC
{ concatena header e comando }
  Move(Comando[1], Result[Tam], Tamanho);               // DAD
  Result:= Result;
end;

{ comando para ativar/desativar o serviço }
function TtecDigitroTcpSocket.AtivarServico(Params: Array of Variant): TtecBuffer;
var
  Tam: Word;
begin
  Tam:= 1;
  MoveByte(Result, $02, Tam);                           // CMD
  MoveWord(Result, Word(Params[0]), Tam);               // SV
  MoveWord(Result, $0000, Tam);                         // INST
  MoveByte(Result, Word(Params[1]), Tam);               // ST
  Result:= EnviarComando(Result, Tam - 1);
end;

{ comando para gerar uma chamada }
function TtecDigitroTcpSocket.ExecutarAcao(Params: Array of Variant): TtecBuffer;
var
  Tam: Word;
begin
  Tam:= 1;
  MoveByte(Result, $08, Tam);                           // CMD
  MoveWord(Result, $0001,Tam);                          // wINSTap
  MoveWord(Result, $0000, Tam);                         // wINSTsv
  MoveWord(Result, GetAcoes, Tam);                      // wACOES
  MoveWord(Result, Length(String(Params[0])), Tam);     // wNBOP
  MoveString(Result, String(Params[0]), Tam);           // OPn
  MoveByte(Result, $00, Tam);                           // NG
//  MoveWord(Result, 0, Tam);                           // wGRx
  MoveByte(Result, $00, Tam);                           // PRI
  MoveWord(Result, $0000, Tam);                         // wPA
  MoveDWord(Result, Integer(Params[1]), Tam);           // dwCAMP
  MoveByte(Result, $04, Tam);                           // NC
  MoveBCD (Result, FTelemarketing, Tam);                // NUMs
  MoveByte(Result, Length(String(Params[2])), Tam);     // NNb
  MoveBCD(Result, String(Params[2]), Tam);              // NUMb
//  MoveByte(Result, $00, Tam);                         // NFR
//  MoveWord(Result, $0000, Tam);                       // wFRx
//  MoveByte(Result, $00, Tam);                         // NBx
//  MoveByte(Result, $00, Tam);                         // Dnx
  Result:= EnviarComando(Result, Tam - 1);
end;

{ comando para derrubar uma chamada }
function TtecDigitroTcpSocket.DerrubarChamada(Params: Array of Variant): TtecBuffer;
var
  Tam: Word;
begin
  Tam:= 1;
  MoveByte(Result, $10, Tam);                           // CMD
  MoveWord(Result, $0001, Tam);                         // wINSTap
  MoveWord(Result, Integer(Params[0]), Tam);            // wINSTsv
  Result:= EnviarComando(Result, Tam - 1);
end;

{ resposta recurso (pa/operador/grupo) disponível }
function TtecDigitroTcpSocket.InstanciaAlocada(Comando: TtecBuffer): TtecCommandResult;
var
  Pos: Integer;
begin
  Result.CallId := VerificaPacote(Comando, 0, 11);
  Result.Chamada:= VerificaPacote(Comando, 0, 10);
  Pos:= VerificaPacote(Comando, 0, 1);
  Result.CmdResult:= Comando[Pos]; // RS
end;

{ resposta discando para assinante }
function TtecDigitroTcpSocket.ExecutandoAcao(Comando: TtecBuffer): TtecCommandResult;
var
  Pos: Integer;
begin
  Result.CallId := VerificaPacote(Comando, 0, 11);
  Result.Chamada:= VerificaPacote(Comando, 0, 10);
  Pos:= VerificaPacote(Comando, 0, 1);
  Result.CmdResult:= Comando[Pos]; // wPa
end;

{ resposta assinante atendeu }
function TtecDigitroTcpSocket.SinalizaAtendimento(Comando: TtecBuffer): TtecCommandResult;
var
  Pos: Integer;
begin
  Result.CallId := VerificaPacote(Comando, 0, 11);
  Result.Chamada:= VerificaPacote(Comando, 0, 10);
  Pos:= VerificaPacote(Comando, 0, 1);
  Result.CmdResult:= Comando[Pos]; // Tipo
end;

{ resposta final da chamada }
function TtecDigitroTcpSocket.RespostaExecutarAcao(Comando: TtecBuffer): TtecCommandResult;
var
  Pos: Integer;
begin
  Result.CallId := VerificaPacote(Comando, 0, 11);
  Result.Chamada:= VerificaPacote(Comando, 0, 10);
  Pos:= VerificaPacote(Comando, 0, 1);
  Result.CmdResult:= Comando[Pos-8] + (Comando[Pos - 9] shl 8); // wRS
end;

end.
