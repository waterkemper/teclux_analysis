unit cpsacclient;

interface

uses
 Classes, SysUtils, Types, Controls, ExtCtrls, Contnrs,
 IdTCPServer, cpsacsockets;

type

  TServerKind = (skUndefined, skDigitro);
  TRequestKind = (rkNone, rkDial, rkKill);
  TResponse = (reAlocation, reDial, reRungUp, reCallEnd, reLock);
  TResponseResult = (rrNone, rrBusy, rrNumberProblem, rrCallProblem, rrSucess, rrFail, rrUnknow);
  TResponseEvent = procedure (Chamada: LongWord; Call: Word; Response: TResponse; ResponseResult: TResponseResult) of object;
  TChamadaEvent = procedure of object;

  TTeste = procedure (Texto: String) of object;

{ TtecSacTcpServer }

  TtecSacTcpServer = class (TComponent)
  private
   FSocket: TtecTcpSocket;
   FServerKind: TServerKind;
   FSocketParams: TFileName;
   FOnResponse: TResponseEvent;
   FOnChamada: TChamadaEvent;
   FServiceActive: Boolean;
   FServiceId: Integer;
   FResponseTime: Integer;
   FCall: TRequestKind;
   FChamada: LongWord;
   FOperador: String;
   FFone: String;
   FIdCall: Word;
   function  GetLocalPort: Integer;
   procedure SetLocalPort(Value: Integer);
  protected
   procedure DigitroCallServer(AThread: TIdPeerThread);
   procedure UpdateRequest(Chamada: LongWord; Call: Word; Response: TResponse; ResponseResult: TResponseResult);
   procedure Loaded; override;
   property ServiceId: Integer read FServiceId write FServiceId;
   property Socket: TtecTcpSocket read FSocket write FSocket;
  public
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
   procedure SendSocketParams;
   procedure Connect;
   procedure Disconect;
   procedure Chamada(Chamada: LongWord; Operador,Fone: String);
   procedure DerrubaChamada(IdCall: Word);
  published
   property LocalPort: Integer read GetLocalPort write SetLocalPort;
   property ServerKind: TServerKind read FServerKind write FServerKind default skUndefined;
   property SocketParams: TFileName read FSocketParams write FSocketParams;
   property ResponseTime: Integer read FResponseTime write FResponseTime default 1000;
   property OnResponse: TResponseEvent read FOnResponse write FOnResponse;
   property OnChamada: TChamadaEvent read FOnChamada write FOnChamada;
end;

 procedure Register;

implementation

{ TtecSacTcpServer }

constructor TtecSacTcpServer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSocket:= TtecDigitroTcpSocket.Create(Self);
  FSocket.TcpServer.OnExecute:= DigitroCallServer;
end;

destructor TtecSacTcpServer.Destroy;
begin
  FSocket.Free;
  inherited Destroy;
end;

procedure TtecSacTcpServer.Loaded;
begin
  inherited Loaded;
  case FServerKind of
    skDigitro: begin
                 FSocket:= TtecDigitroTcpSocket.Create(Self);
                 FSocket.TcpServer.OnExecute:= DigitroCallServer;
               end;
  end;
  SendSocketParams;
end;

procedure TtecSacTcpServer.SendSocketParams;
begin
  if Length(FSocketParams) > 0 then
    FSocket.LerParametros(FSocketParams);
end;

procedure TtecSacTcpServer.Connect;
begin
  FSocket.Conectar;
end;

procedure TtecSacTcpServer.Disconect;
begin
  FSocket.Desconectar;
end;

function TtecSacTcpServer.GetLocalPort: Integer;
begin
  Result:= FSocket.TcpServer.DefaultPort;
end;

procedure TtecSacTcpServer.SetLocalPort(Value: Integer);
begin
  FSocket.TcpServer.DefaultPort:= Value;
end;

procedure TtecSacTcpServer.UpdateRequest(Chamada: LongWord; Call: Word; Response: TResponse; ResponseResult: TResponseResult);
begin
  if Assigned(FOnResponse) then
    FOnResponse(Chamada, Call, Response, ResponseResult);
end;

procedure TtecSacTcpServer.Chamada(Chamada: LongWord; Operador,Fone: String);
begin
   FCall := rkDial;
   FChamada := Chamada;
   FOperador := Operador;
   FFone := Fone;
end;

procedure TtecSacTcpServer.DerrubaChamada(IdCall: Word);
begin
   FCall    := rkKill;
   FIdCall  := IdCall;
end;

procedure TtecSacTcpServer.DigitroCallServer(AThread: TIdPeerThread);
var
  Comando, Resposta: TtecBuffer;
  Res: TtecCommandResult;
  Error: Boolean;
  LimBuf, PosBuf: Word;

  function LerByte: Byte;
  var
    Buffer: String[1];
  begin
    with Athread.Connection do begin
      if (CurrentReadBufferSize = 0) and (PosBuf > 1) then begin
        ReadFromStack(False, FResponseTime);
        Error:= CurrentReadBufferSize = 0;
      end;
      if CurrentReadBufferSize <> 0 then begin
        Buffer:= ExtractXBytesFromBuffer(1);
        Result:= Ord(Buffer[1]);
      end
      else 
        Result:= 0;
    end;
  end;

begin
   with Athread.Connection do begin

{ monitora solicitaþ§es }
      if FServiceActive then
        if Assigned(FOnChamada) Then Begin
          FOnChamada;
          If FCall <> rkNone Then begin
             case FCall of
              rkDial: Comando:= FSocket.ComporComando(2, [FOperador,FChamada,FFone]);
              rkKill: Comando:= FSocket.ComporComando(3, [FIdCall]);
             end;
             WriteBuffer(Comando,FSocket.VerificaPacote(Comando, 0, 1));

             FCall := rkNone;
          end;
        end;
{ monitora respostas }
      ReadFromStack(False,FResponseTime);
      if True {(CurrentReadBufferSize <> 0) }then begin
        LimBuf:= 65535;
        PosBuf := 1;
        Error:= False;
{ lÛ resposta byte a byte }
        while (Connected) and (PosBuf <= LimBuf) and not (Error) Do Begin
           Resposta[PosBuf]:= LerByte;
           if not Error then begin
{ verifica os 8 primeiros bytes (header) }
             case PosBuf of
                1:   Error:= FSocket.VerificaPacote(Resposta, PosBuf, 5);
                2:   Error:= FSocket.VerificaPacote(Resposta, PosBuf, 6);
                3:   Error:= FSocket.VerificaPacote(Resposta, PosBuf, 7);
                4:   Error:= FSocket.VerificaPacote(Resposta, PosBuf, 8);
                5:   Error:= FSocket.VerificaPacote(Resposta, PosBuf, 9);
                6:   begin
                        Error:= Resposta[PosBuf] > BufferSize;
                        if not Error then
                           LimBuf:= Resposta[PosBuf];
                     end;
                7:   Error:= FSocket.VerificaPacote(Resposta, PosBuf, 9);
                8:   Error:= Resposta[PosBuf] > BufferSize - HeaderSize;
             end;
             if Error then
             begin
               PosBuf:= 1;
               Error:= False;
             end
             else
               Inc(PosBuf,1);
           end;
        end;
{ processa respostas vßlidas }
        if not Error then begin
          case FSocket.VerificaPacote(Resposta, 0, 2) of
             $03: begin // pooling ativacao
                    FServiceActive:= False;
                    FServiceId:= FSocket.VerificaPacote(Resposta, 0, 3);
                    Comando:= FSocket.ComporComando(1, [FServiceId, $01]);
                    WriteBuffer(Comando, FSocket.VerificaPacote(Comando, 0, 1));
                  end;
             $05: begin // pooling desativacao
                    FServiceActive:= False;
                    FServiceId:= FSocket.VerificaPacote(Resposta, 0, 3);
                    Comando:= FSocket.ComporComando(1, [FServiceId, $00]);
                    WriteBuffer(Comando, FSocket.VerificaPacote(Comando, 0, 1));
                  end;
             $07: begin // resposta ativacao/desativacao
                    FServiceActive:= FSocket.VerificaPacote(Resposta, 0, 4);
                  end;
             $0A: begin // alocacao
                    Res:= FSocket.DecomporComando(Resposta);
                    case TdigResultadoAlocacao(Res.CmdResult)of
                      raSucesso: UpdateRequest(Res.Chamada, Res.CallId, reAlocation, rrSucess);
                      raFalha  : UpdateRequest(Res.Chamada, Res.CallId, reAlocation, rrFail);
                      else       UpdateRequest(Res.Chamada, Res.CallId, reAlocation, rrFail);
                    end;
                  end;
             $0C: begin // discagem
                    Res:= FSocket.DecomporComando(Resposta);
                    UpdateRequest(Res.Chamada, Res.CallId, reDial, rrNone);
                  end;
             $12: begin // atendimento
                    Res:= FSocket.DecomporComando(Resposta);
                    UpdateRequest(Res.Chamada, Res.CallId, reRungUp, rrNone);
                  end;
             $0E: begin // fim da chamada
                    Res:= FSocket.DecomporComando(Resposta);
                    case TdigResultadoChamada(Res.CmdResult) of
                      rcNada                              : UpdateRequest(Res.Chamada, Res.CallId, reCallEnd, rrNone);
                      rcSucesso01..rcSucesso16            : UpdateRequest(Res.Chamada, Res.CallId, reCallEnd, rrSucess);
                      rcNumeroInexistente..rcNumeroMudado : UpdateRequest(Res.Chamada, Res.CallId, reCallEnd, rrNumberProblem);
                      rcAssinanteOcupado                  : UpdateRequest(Res.Chamada, Res.CallId, reCallEnd, rrBusy);
                      rcRedeCongestionada..rcFalhaChamada : UpdateRequest(Res.Chamada, Res.CallId, reCallEnd, rrCallProblem);
                      else                                  UpdateRequest(Res.Chamada, Res.CallId, reCallEnd, rrCallProblem);
                    end;
                end;
          end;
        end;
      end;
   end;
end;

procedure Register;
begin
  RegisterComponents('tecSOFT', [TtecSacTcpServer]);
end;

end.
