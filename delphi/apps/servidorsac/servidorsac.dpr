program servidorSAC;

{$APPTYPE CONSOLE}

uses SysUtils, cpsacclient, SqlExpr, DBXpress;

type
  TServidor = class(TObject)
     ssvSac: TtecSacTcpServer;

     qryChamadas: TSQLQuery;
     qryAtualizarChamadas: TSQLQuery;
     qryDerrubarChamada: TSQLQuery;
     dbaBanco: TSQLConnection;
     tstTransact: TTransactionDesc;

     procedure ssvSacResponse(Numero:         Cardinal;
                              Call:           Word;
                              Response:       TResponse;
                              ResponseResult: TResponseResult);
     procedure ssvSacChamada;
     procedure InicializaChamadas;
     procedure AtualizarStatus(Chamada: Cardinal;Call: Word;Status: Char);
     function LerPrimeiraChamada(var Numero,Chamada: Cardinal;
                                 var Status: Char;
                                 var Operador,Fone: String): Char;
     function BuscaChamada(Chamada: Cardinal): Word;


   public
     constructor Create;
     destructor Destroy; override;
     procedure Iniciar;
     procedure Finalizar;
  end;

Var Banco: String;
    Usuario: String;
    Senha: String;
    Host: String;
    TempoEspera: Cardinal;

procedure TServidor.ssvSacResponse(Numero:         Cardinal;
                                   Call:           Word;
                                   Response:       TResponse;
                                   ResponseResult: TResponseResult);
var status:    char;
begin
  status := 'X';
  case Response of
      reAlocation: case ResponseResult of
                     rrSucess: status := 'A';
                     rrFail  : status := 'F';
                   end;
      reDial     : status := 'D';
      reRungUp   : status := 'T';
      reCallEnd  : case ResponseResult of
                     rrNone,
                     rrCallProblem  : status := 'C';
                     rrBusy         : status := 'O';
                     rrNumberProblem: status := 'N';
                     rrSucess       : status := 'S';
                     Else             status := 'S';
                   end;
  end;
  Writeln('Atualizar:',Numero:1,'-',Status:1);
  AtualizarStatus(Numero,Call,Status);
end;


procedure TServidor.ssvSacChamada;
var numero,
    chamada:  cardinal;
    status:   char;
    operador: string;
    fone:     string;
    Call:     Word;
begin
  Case LerPrimeiraChamada(numero,chamada,status,operador,fone) of
   'E': begin
          ssvSacResponse(Numero,0,reLock,rrNone);
          Writeln('Chamada:',Numero:1,'-',Fone:1,'-',Operador:1);
          ssvSac.Chamada(Numero,Operador,Fone);
        end;
   'D': begin
          Call := BuscaChamada(Chamada);
          Writeln('Derrubar:',Chamada:1);
          ssvSacResponse(Numero,0,reCallEnd,rrSucess);
          If Call <> 0 then
            ssvSac.DerrubaChamada(Call);
        end;
  end;
  sleep(1000);
end;

procedure TServidor.Iniciar;
begin
   ssvSac.Connect;
   Writeln('Servidor Ativo');
   InicializaChamadas;
end;

procedure TServidor.Finalizar;
begin
   Writeln('Servidor Desativo');
   ssvSac.Disconect;
end;

procedure TServidor.InicializaChamadas;
begin
   qryChamadas.Open;
end;

procedure TServidor.AtualizarStatus(Chamada: Cardinal;Call: Word;Status: Char);
begin
    dbaBanco.StartTransaction(tstTransact);
    qryAtualizarChamadas.Sql.Clear;
    qryAtualizarChamadas.Sql.Add('UPDATE chamadas SET status = ''' + Status +'''');
    If Call <> 0 Then
       qryAtualizarChamadas.Sql.Add(' ,idcall = '+IntToStr(Call));
    qryAtualizarChamadas.Sql.Add(' WHERE numero = ' + InttoStr(Chamada));
    qryAtualizarChamadas.ExecSql;
    dbaBanco.Commit(tstTransact);
    TempoEspera := 0;
end;

function TServidor.LerPrimeiraChamada(var Numero,Chamada: Cardinal;
                                      var Status: Char;
                                      var Operador,Fone: String): Char;
begin
  If TempoEspera > 10 Then begin
     dbaBanco.Connected := False;
     dbaBanco.Connected := True;
     TempoEspera := 0;
     If dbaBanco.Connected Then
        InicializaChamadas;
  end;
  If qryChamadas.active then begin
     qryChamadas.Refresh;
     If qryChamadas.Active Then
       qryChamadas.First;
     If not qryChamadas.EOF and (qryChamadas.FieldByName('status').AsString = 'Z') then begin
        TempoEspera := 0;
        Numero  := qryChamadas.FieldByName('numero').Asinteger;
        Chamada := qryChamadas.FieldByName('chamada').Asinteger;
        Status := qryChamadas.FieldByName('status').AsString[1];
        Operador:= qryChamadas.FieldByName('operador').AsString;
        Fone:= qryChamadas.FieldByName('fone').AsString;
        If Length(Fone) > 8 Then
           Fone := '0' + Fone;

        Result := qryChamadas.FieldByName('comando').asString[1];
     end
     Else Result := #0;
  end
  Else Result := #0;
end;


function TServidor.BuscaChamada(Chamada: Cardinal): Word;
begin
  qryDerrubarChamada.Params[0].Value := InttoStr(Chamada);
  qryDerrubarChamada.Open;
  qryDerrubarChamada.First;
  if (qryDerrubarChamada.FieldByName('status').AsString = 'A') or
     (qryDerrubarChamada.FieldByName('status').AsString = 'D') or
     (qryDerrubarChamada.FieldByName('status').AsString = 'T') then
     Result := qryDerrubarChamada.FieldByName('idcall').AsInteger
  Else
     Result := 0;
  qryDerrubarChamada.Close;
end;

constructor TServidor.Create;
begin
   dbaBanco := TSQLConnection.Create(nil);
   With dbaBanco do begin
      ConnectionName := 'PostgreSQL';
      DriverName := 'PostgreSQL';
      GetDriverFunc := 'getSQLDriverPGSQL';
      LibraryName := 'libsqlpg.so.1';
      Params.Add('DriverName=PostgreSQL');
      Params.Add('HostName='+Host);
      Params.Add('Database='+Banco);
      Params.Add('User_Name='+Usuario);
      Params.Add('Password='+Senha);
      Params.Add('BlobSize=-1');
      Params.Add('ErrorResourceFile=./DbxPostgresErr.msg');
      Params.Add('LocaleCode=0000');
      VendorLib := 'libpq.so';
      LoginPrompt := True;
      Connected := True;
   end;

   qryChamadas:= TSQLQuery.Create(nil);
   With qryChamadas do begin
       SQLConnection := dbaBanco;
       Sql.Clear;
       Sql.Add('SELECT * FROM chamadas WHERE status = ''Z'' LIMIT 1');
   end;

   qryDerrubarChamada:= TSQLQuery.Create(nil);
   With qryDerrubarChamada do begin
       SQLConnection := dbaBanco;
       Sql.Clear;
       Sql.Add('SELECT idcall,status FROM chamadas WHERE numero = :numero');
    end;

   qryAtualizarChamadas:= TSQLQuery.Create(nil);
   With qryAtualizarChamadas do begin
       SQLConnection := dbaBanco;
    end;

   ssvSac     := TtecSacTcpServer.Create(nil);
   ssvSac.SocketParams:= 'digitrosocket.ini';
   ssvSac.ResponseTime:= 1000;
   ssvSac.LocalPort := 2020;
   ssvSac.SendSocketParams;
   ssvSac.OnChamada  := ssvSacChamada;
   ssvSac.OnResponse := ssvSacResponse;

   TempoEspera := 0;
end;

destructor TServidor.Destroy;
begin
  Finalizar;
  ssvSac.Free;
  qryAtualizarChamadas.Free;
  qryDerrubarChamada.Free;
  qryChamadas.Free;
  dbaBanco.Free;

  inherited Destroy;
end;

var Servidor: TServidor;
    Contador: Integer;
begin
   If (ParamCount = 4) Then begin
     Host   := ParamStr(1);
     Banco  := ParamStr(2);
     Usuario:= ParamStr(3);
     Senha  := ParamStr(4);
     Servidor := TServidor.Create();
     If Servidor.dbaBanco.Connected Then begin
       Servidor.Iniciar;
       Contador := 0;
       Repeat
         Contador := Contador + 1;
         If Contador = 1000000000 Then begin
            Write('.');
            Contador := 0;
            Inc(TempoEspera);
         end;
       Until 1=0;
     end
     else Writeln('Erro no inicializar o banco');
     Servidor.Finalizar;
     Servidor.Free;
   end
   else Writeln('servidorsac <host> <banco> <usuário> <senha>');
end.
