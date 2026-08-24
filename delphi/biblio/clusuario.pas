unit clusuario;

interface

Uses
  //Componentes
  cpdatabase, classes;


type

  TtecUsuarios = class
  private
    FAlterarPrecoContrato: Boolean;
    FAnalistaCredito: Boolean;
    FCaixa: Boolean;
    FCaixaAberto: Boolean;
    FCobrador: Boolean;
    FCodigoFiltroSAC_Usuario: Integer;
    FCodigoOperador: String;
    FCodigoUsuario: integer;
    FDataAberturaCaixa: TDateTime;
    FDataFechamentoCaixa: TDateTime;
    FDataLocal: TDateTime;
    FDescontoExtra: Boolean;
    FDevolucaoProduto: Boolean;
    FTrocaProduto: Boolean;
    FDevolucaoNumerario: Boolean;
    FFiltroSAC: Integer;
    FFilial: Integer;
    FNomeUsuario: String;
    FNumeroLigacao: Integer;
    FPermiteReserva: Boolean;
    FPermiteExcluirReserva: Boolean;
    FVendedor: Boolean;
    FAtendente: Boolean;
    FAlterarFilialVenda: Boolean;
    FAlterarDadosContabeis: Boolean;
    FGerenteCaixa: Boolean;
    FGerenteEstoque: Boolean;
    FGerenteTecnico: Boolean;
    FAnalistaSite: Boolean;
    FGerenteAnalista: Boolean;
    FGerenteProducao: Boolean;
    FGerenteVendas: Boolean;
    FAdministrador: Boolean;
    FSuporte: Boolean;
    FPagamento: Boolean;
    FTransferenciaporItem: Boolean;
    FRestringirFichaCliente: Boolean;
    FEmissorNotaFiscal: Boolean;

    FEmail: String;
    FEmailUsuario: String;

    FUsuarioEmail: String;
    FUsuarioEmailUsuario: String;

    FSenhaEmail: String;
    FSenhaEmailUsuario: String;

    FHostPop: String;
    FPortaPop: String;
    FHostSmtp: String;
    FHostSmtpUsuario: String;

    FPortaSmtp: String;
    FPortaSmtpUsuario: String;

    FExpiracaoSenha: TDateTime;
    FDiasValidadeSenha: Integer;
    FDiasAvisoSenha: Integer;
    FLogin: String;
    FUsuariosAcessosModulos: TStringList;
    FFilialBase: Integer;
    FAutenticarSmtp: Boolean;
    FIntroducao: String;
    FConclusao: String;
    FAssunto: String;
    fsmtprequerssl: Boolean;
    fsmtprequersslUsuario: Boolean;

    fsmtprequertls: Boolean;
    function GetAcessosUsuarios: TStringList;
    function GetAnalistaCredito: Boolean;
    function GetAtendente: Boolean;
    function GetCaixa: Boolean;
    function GetCaixaAberto: Boolean;
    function GetCobrador: Boolean;
    function GetCodigoFiltroSAC_Usuario: Integer;
    function GetCodigoOperador: String;
    function GetCodigoUsuario: integer;
    function GetTransferenciaPorItem: Boolean;
    function GetDataAberturaCaixa: TDateTime;
    function GetFiltroSAC: Integer;
    function GetNomeUsuario: String;
    function GetNumeroLigacao: Integer;
    function GetPermiteAbrirCaixa: Boolean;
    function GetPermiteReserva: Boolean;
    function GetPermiteExcluirReserva: Boolean;
    function GetVendedor: Boolean;
    function GetAlterarPrecoContrato: Boolean;
    function GetDescontoExtra: Boolean;
    function GetDevolucaoProduto: Boolean;
    function GetPermiteAutenticar: Boolean;
    function GetDevolucaoNumerario: Boolean;
    function GetAlterarFilialVenda: Boolean;
    function GetAlterarDadosContabeis: Boolean;
    function GetGerenteEstoque: Boolean;
    function GetGerenteVendas: Boolean;
    function GetAdministrador: Boolean;
    function GetSuporte: Boolean;
    function GetPagamento: Boolean;
    function GetLoginUsuario: String;
    function GetRestringirFichaCliente: Boolean;
    function GetEmissorNotaFiscal: Boolean;
    procedure LerPropriedades;
    procedure LerAcessosUsuarios;
    function  GetGerenteCaixa: Boolean;
    function getFilial: Integer;
    function GetTrocaProdutos: Boolean;
    function GetEmail: String;
    function GetHostPop: String;

    function GetHostSmtp: String;
    function GetHostSmtpusuario: String;

    function GetPortaPop: String;
    function GetPortaSmtp: String;

    function GetPortaSmtpUsuario: String;

    function GetSenhaEmail: String;
    function GetSenhaEmailUsuario: String;


    function GetUsuarioEmail: String;
    function GetExpiracaoSenha: TDateTime;
    function GetDiasValidadeSenha: Integer;
    function GetDiasAvisoSenha: Integer;
    function GetAutenticarSmtp: Boolean;
    function GetAssunto: String;
    function GetConclusao: String;
    function GetIntroducao: String;
    function GetGerenteProducao: Boolean;
    function GetGerenteTecnico: Boolean;
    function GetAnalistaSite: Boolean;
    function Getsmtprequerssl: Boolean;
    function GetsmtprequersslUsuario: Boolean;

    function Getsmtprequertls: Boolean;


    function GetUsuarioEmailusuario: String;
    function GetEmailUsuario: String;
  protected

  public
    procedure AbrirCaixa;
    constructor Create(DB: TtecDatabase); reintroduce; overload; virtual;
    constructor Create(DB: TtecDatabase; FilialBase: Integer); overload;
//    destructor  Destroy; override;
    function  FecharCaixa(const Value: TDateTime): Boolean;
    procedure ReAbreUsuario;
    procedure ReAbrirCaixa;
    procedure AtualizarSenha(Senha: String);
    property  AnalistaCredito: Boolean read GetAnalistaCredito;
    property  AlterarPrecoContrato: Boolean read GetAlterarPrecoContrato;
    property  Caixa: Boolean read GetCaixa;
    property  CaixaAberto: Boolean read GetCaixaAberto;
    property  Cobrador: Boolean read GetCobrador;
    property  CodigoFiltroSAC_Usuario: Integer read GetCodigoFiltroSAC_Usuario;
    property  CodigoOperador: String read GetCodigoOperador;
    property  CodigoUsuario: integer read GetCodigoUsuario;
    property  LoginUsuario: String read GetLoginUsuario;
    property  DataAberturaCaixa: TDateTime read GetDataAberturaCaixa;
    property  DescontoExtra: Boolean read GetDescontoExtra;
    property  DevolucaoProduto: Boolean read GetDevolucaoProduto;
    property  TrocaProduto: Boolean read GetTrocaProdutos;
    property  DevolucaoNumerario: Boolean read GetDevolucaoNumerario;
    property  Filial: Integer read getFilial;
    property  FiltroSAC: Integer read GetFiltroSAC;
    property  NomeUsuario: String read GetNomeUsuario;
    property  NumeroLigacao: Integer read GetNumeroLigacao;
    property  PermiteAbrirCaixa: Boolean read GetPermiteAbrirCaixa;
    property  PermiteReserva: Boolean read GetPermiteReserva;
    property  PermiteExcluirReserva: Boolean read GetPermiteExcluirReserva;
    property  PermiteAutenticar: Boolean read GetPermiteAutenticar;
    property  Vendedor: Boolean read GetVendedor;
    property  Atendente: Boolean read GetAtendente;
    property  AlterarFilialVenda: Boolean read GetAlterarFilialVenda;
    property  AlterarDadosContabeis: Boolean read GetAlterarDadosContabeis;
    property  GerenteEstoque: Boolean read GetGerenteEstoque;
    property  GerenteVendas: Boolean read GetGerenteVendas;
    property  GerenteTecnico: Boolean read GetGerenteTecnico;
    property  AnalistaSite: Boolean read GetAnalistaSite;
    property  GerenteProducao: Boolean read GetGerenteProducao;
    property  GerenteCaixa: Boolean read GetGerenteCaixa;
    property  Administrador: Boolean read GetAdministrador;
    property  Suporte: Boolean read GetSuporte;
    property  Pagamento: Boolean read GetPagamento;
    property  TransferenciaPorItem: Boolean read GetTransferenciaPorItem;
    property  RestringirFichaCliente: Boolean read GetRestringirFichaCliente;
    property  EmissorNotaFiscal: Boolean read GetEmissorNotaFiscal;
    property  AcessosUsuarios: TStringList read GetAcessosUsuarios;
    property  Email: String read GetEmail;
    property  EmailUsuario: String read GetEmailUsuario;


    property  UsuarioEmail: String read GetUsuarioEmail;
    property  UsuarioEmailusuario: String read GetUsuarioEmailusuario;

    property  SenhaEmail: String read GetSenhaEmail;
    property  SenhaEmailUsuario: String read GetSenhaEmailUsuario;

    property  HostPop: String read GetHostPop;
    property  PortaPop: String read GetPortaPop;
    property  HostSmtp: String read GetHostSmtp;
    property  HostSmtpusuario: String read GetHostSmtpusuario;

    property  PortaSmtp: String read GetPortaSmtp;
    property  PortaSmtpUsuario: String read GetPortaSmtpUsuario;

    property  ExpiracaoSenha: TDateTime read GetExpiracaoSenha;
    property  DiasValidadeSenha: Integer read GetDiasValidadeSenha;
    property  DiasAvisoSenha: Integer read GetDiasAvisoSenha;
    property  AutenticarSmtp: Boolean read GetAutenticarSmtp;

    property  smtprequerssl: Boolean read Getsmtprequerssl write fsmtprequerssl;
    property  smtprequersslUsuario: Boolean read GetsmtprequersslUsuario write fsmtprequersslUsuario;

    property  smtprequertls: Boolean read Getsmtprequertls write fsmtprequertls;

    property  Introducao: String read GetIntroducao;
    property  Conclusao: String read GetConclusao;
    property  Assunto: String read GetAssunto;
  end;

var
  UsuarioLogin: TtecUsuarios;
  UsuarioAutAux: TtecUsuarios;

implementation

Uses
  //CLX
  SysUtils, DB, DateUtils, cpquery, ZPgSqlQuery, biblio;

const
  ctCODIGO                 = 0;
  ctNOME                   = 1;
  ctFILIAL                 = 2;
  ctANALISTACREDITO        = 3;
  ctRESERVARPRODUTO        = 4;
  ctCOBRADOR               = 5;
  ctVENDEDOR               = 6;
  ctATENDENTE              = 7;
  ctCAIXA                  = 8;
  ctALTERARPRECOCONTRATO   = 9;
  ctDESCONTOEXTRA          = 10;
  ctDEVOLUCAOPRODUTO       = 11;
  ctFILTROSAC              = 12;
  ctOPERADOR               = 13;
  ctLIGACAO                = 14;
  ctDATAABERTURACAIXA      = 15;
  ctDATAFECHAMENTOCAIXA    = 16;
  ctDATACORRENTE           = 17;
  ctDEVOLUCAONUMERARIO     = 18;
  ctALTERARFILIALVENDA     = 19;
  ctALTERARDADOSCONTABEIS  = 20;
  ctGERENTEESTOQUE         = 21;
  ctADMINISTRADOR          = 22;
  ctSUPORTE                = 23;
  ctPAGAMENTO              = 24;
  ctTRANSFERENCIAPORITEM   = 25;
  ctRESTRINGIRFICHACLIENTE = 26;
  ctEMISSORNOTAFISCAL      = 27;
  ctGERENTECAIXA           = 28;
  ctLOGIN                  = 29;
  ctEXCLUIRESERVAPRODUTO   = 30;
  ctTROCAPRODUTO           = 31;
  ctEMAIL                  = 32;
  ctUSUARIOEMAIL           = 33;
  ctSENHAEMAIL             = 34;
  ctHOSTPOP                = 35;
  ctPORTAPOP               = 36;
  ctHOSTSMTP               = 37;
  ctPORTASMTP              = 38;
  ctEXPIRACAOSENHA         = 39;
  ctDIASVALIDADESENHA      = 40;
  ctDIASAVISOSENHA         = 41;
  ctAUTENTICARSMTP         = 42;
  ctINTRODUCAO             = 43;
  ctCONCLUSAO              = 44;
  ctASSUNTO                = 45;
  ctGERENTEPRODUCAO        = 46;
  ctGERENTETECNICO         = 47;
  ctANALISTASITE           = 48;
  ctGERENTEVENDAS          = 49;



  SQL = 'select codigo, nome, coalesce((select uf.filial' + #13#10 +
        '                               from usuariosfiliais uf' + #13#10 +
        '                               where uf.usuario = codigo' + #13#10 +
        '                                 and uf.filial = :filialbase),-1) as filial,' + #13#10 +
        '       credito, reserva, cobranca, '+ #13#10 +
        '       venda, atendimento, caixa, alterarprecocontrato, '+ #13#10 +
        '       descontoextra, devolucaoproduto, filtrosac, '+ #13#10 +
        '       operador, ligacao, dataaberturacaixa, '+ #13#10 +
        '       datafechamentocaixa, current_date, devolucaonumerario, '   + #13#10 +
        '       alterarfilial, alterardadoscontabeis, gerenteestoque, '    + #13#10 +
        '       admini10strador, suporte, pagamento, confirmartransfitem, '  + #13#10 +
        '       restringirfichacliente, emissornotafiscal, gerentecaixa, ' + #13#10 +
        '       (select pg_user.usename from pg_user where pg_user.usename = usuarios.usename) as login, excluireserva,trocaproduto, ' + #13#10 +
        '       email, usuarioemail, senhaemail, hostpop, portapop, hostsmtp, portasmtp, ' + #13#10 +
        '       expiracaosenha, diasvalidadesenha, diasavisosenha, autenticarsmtp, ' + #13#10 +
        '       introducao, conclusao, assunto, gerenteproducao, gerentetecnico, analistasite, gerentevendas, smtprequerssl, smtprequertls ' + #13#10 +
        'from usuarios '+#13#10+
        'where (usename = (select usename ' + #13#10 +
                          'from pg_user '+ #13#10 +
                          'where usename = user)) and '+ #13#10 +
               'inativo is null ';
{        'where ((shadow = (select usesysid ' +
                          'from pg_user '+
                          'where usename = user)) or '+
               '(codigo = (select usesysid ' +
                          'from pg_user '+
                          'where usename = user))) and '+
}

  SQLUsuariosAcessosModulos = 'select nomemenu '+
                               'from acessosmodulos '+
                               'where codigo in ('+
                                '(select uam.acesso '+
                                 'from usuariosacessosmodulos uam '+
                                 'where uam.usuario = :codigo) '+
                                 'union '+
                                 '(select guam.acesso '+
                                  'from (usuarios u join (gruposusuarios g join '+
                                         'gruposusuariosacessosmodulos guam on '+
                                         'g.codigo = guam.grupo) '+
                                         'on u.grupo = g.codigo) '+
                                  'where u.codigo = :codigo))';
  SQLSenhaUsuario = ' WITH PASSWORD ';


Var
  qryUsuarios: TtecQuery;
  qryusuariosacessosmodulos: TtecQuery;
  qryUsuariosNovaSenha: TtecQuery;

{ TtecUsuarios }

procedure TtecUsuarios.AbrirCaixa;
begin
  qryUsuarios.Open;
  qryUsuarios.Edit;
  qryUsuarios.Fields[ctDATAABERTURACAIXA].AsDateTime := FDataLocal;
  qryUsuarios.Post;
  qryUsuarios.ApplyUpdates;
  qryUsuarios.Transaction.Commit;
  qryUsuarios.Close;
  FCaixaAberto := True;
  FDataAberturaCaixa := Date;
end;

constructor TtecUsuarios.Create(DB: TtecDatabase);
var
  DBAnt: TtecDatabase;
begin
  inherited Create;
//  FUsuariosAcessosModulos := TStringList.Create;
  if Assigned(DB) and DB.Connected then begin
    if Assigned(qryUsuarios.Database){ and
       Assigned(qryusuariosacessosmodulos.Database)} then
      DBAnt := TtecDatabase(qryUsuarios.Database)
    else
      DBAnt := nil;
    try
      qryUsuarios.Database := DB;
      qryUsuarios.Params[0].AsString := IntToStr(FFilialBase);
      qryUsuarios.Open;
      if qryUsuarios.RecordCount > 0 then
        LerPropriedades;

//      qryUsuariosAcessosmodulos.Database := DB;
//      qryusuariosAcessosmodulos.Params[0].asstring := inttostr(codigousuario);
//      qryusuariosAcessosmodulos.open;

//      if qryusuariosacessosmodulos.RecordCount > 0 then
//        LerAcessosUsuarios;

//      qryUsuariosNovaSenha.Database := DB;
      qryUsuarios.close;
//      qryusuariosacessosmodulos.close;
//      qryUsuariosNovaSenha.Close;
    finally
      if Assigned(DBAnt) then
      begin
        qryUsuarios.Database := DBAnt;
//        qryusuariosacessosmodulos.database := DBAnt;
//        qryUsuariosNovaSenha.database := DBAnt;
      end;
    end
  end
end;

function TtecUsuarios.FecharCaixa(const Value: TDateTime): Boolean;
begin
  Result := FDataAberturaCaixa = Value;
  if Result then begin
    qryUsuarios.Open;
    qryUsuarios.Edit;
    qryUsuarios.Fields[ctDATAFECHAMENTOCAIXA].AsDateTime := Value;
    qryUsuarios.Post;
    qryUsuarios.ApplyUpdates;
    qryUsuarios.Transaction.Commit;
    qryUsuarios.Close;
    FDataFechamentoCaixa := FDataAberturaCaixa;
    FCaixaAberto := False;
  end
end;

function TtecUsuarios.GetAcessosUsuarios: TStringList;
begin

 qryusuariosacessosmodulos := TtecQuery.Create(nil);
 qryusuariosacessosmodulos.Sql.Text := SQLUsuariosAcessosModulos;

 qryUsuariosAcessosmodulos.Database := qryUsuarios.Database;
 qryusuariosAcessosmodulos.Params[0].asstring := inttostr(codigousuario);
 qryusuariosAcessosmodulos.open;
 LerAcessosUsuarios;

 qryusuariosacessosmodulos.Free;

 result := FUsuariosAcessosModulos;
end;

function TtecUsuarios.GetAdministrador: Boolean;
begin
  Result := FAdministrador
end;

function TtecUsuarios.GetAlterarDadosContabeis: Boolean;
begin
  Result:= FAlterarDadosContabeis
end;

function TtecUsuarios.GetAlterarFilialVenda: Boolean;
begin
  Result := FAlterarFilialVenda
end;

function TtecUsuarios.GetAlterarPrecoContrato: Boolean;
begin
  Result := FAlterarPrecoContrato;
end;

function TtecUsuarios.GetAnalistaCredito: Boolean;
begin
  Result := FAnalistaCredito;
end;

function TtecUsuarios.GetAtendente: Boolean;
begin
  Result := FAtendente
end;

function TtecUsuarios.GetCaixa: Boolean;
begin
  Result := FCaixa
end;

function TtecUsuarios.GetCaixaAberto: Boolean;
begin
  Result := FCaixaAberto
end;

function TtecUsuarios.GetCobrador: Boolean;
begin
  Result := FCobrador
end;

function TtecUsuarios.GetCodigoFiltroSAC_Usuario: Integer;
begin
  Result := FCodigoFiltroSAC_Usuario
end;

function TtecUsuarios.GetCodigoOperador: String;
begin
  Result := FCodigoOperador
end;

function TtecUsuarios.GetCodigoUsuario: integer;
begin
  Result := FCodigoUsuario
end;

function TtecUsuarios.GetDataAberturaCaixa: TDateTime;
begin
  Result := FDataAberturaCaixa
end;

function TtecUsuarios.GetDescontoExtra: Boolean;
begin
  Result := FDescontoExtra
end;

function TtecUsuarios.GetDevolucaoNumerario: Boolean;
begin
  Result:= FDevolucaoNumerario;
end;

function TtecUsuarios.GetDevolucaoProduto: Boolean;
begin
  Result := FDevolucaoProduto
end;

function TtecUsuarios.GetEmissorNotaFiscal: Boolean;
begin
  Result := FEmissorNotaFiscal;
end;

function TtecUsuarios.getFilial: Integer;
begin
  Result := FFilial
end;

function TtecUsuarios.GetFiltroSAC: Integer;
begin
  Result := FFiltroSAC
end;

function TtecUsuarios.GetGerenteCaixa: Boolean;
begin
  Result:= FGerenteCaixa;
end;

function TtecUsuarios.GetGerenteEstoque: Boolean;
begin
  Result := FGerenteEstoque
end;

function TtecUsuarios.GetGerenteVendas: Boolean;
begin
  Result := FGerenteVendas
end;


function TtecUsuarios.GetLoginUsuario: String;
begin
  Result := FLogin;
end;

function TtecUsuarios.GetNomeUsuario: String;
begin
  Result := FNomeUsuario
end;

function TtecUsuarios.GetNumeroLigacao: Integer;
begin
  Result := FNumeroLigacao
end;

function TtecUsuarios.GetPagamento: Boolean;
begin
  Result:= FPagamento;
end;

function TtecUsuarios.GetPermiteAbrirCaixa: Boolean;
begin
  Result := FCaixa and (FDataFechamentoCaixa < FDataLocal)
end;

function TtecUsuarios.GetPermiteAutenticar: Boolean;
begin
  Result := FCaixaAberto and (FDataAberturaCaixa = FDataLocal)
end;

function TtecUsuarios.GetPermiteReserva: Boolean;
begin
  Result := FPermiteReserva;
end;

function TtecUsuarios.GetPermiteExcluirReserva: Boolean;
begin
  Result := FPermiteExcluirReserva;
end;

function TtecUsuarios.GetRestringirFichaCliente: Boolean;
begin
  Result := FRestringirFichaCliente;
end;

function TtecUsuarios.GetSuporte: Boolean;
begin
  Result := FSuporte
end;

function TtecUsuarios.GetTransferenciaPorItem: Boolean;
begin
  Result:= FTransferenciaporItem;
end;

function TtecUsuarios.GetVendedor: Boolean;
begin
  Result := FVendedor
end;

procedure TtecUsuarios.LerAcessosUsuarios;
begin
  if not assigned(FUsuariosAcessosModulos) then
    FUsuariosAcessosModulos := TStringList.Create;

  FUsuariosAcessosModulos.Clear;
  qryusuariosacessosmodulos.First;
  while not qryusuariosacessosmodulos.Eof do begin
    FUsuariosAcessosModulos.Add(qryusuariosacessosmodulos.Fields[0].AsString);
    qryusuariosacessosmodulos.Next;
  end;
  FUsuariosAcessosModulos.Sort;
  
end;

procedure TtecUsuarios.LerPropriedades;
begin
  FAlterarPrecoContrato    := qryUsuarios.Fields[ctALTERARPRECOCONTRATO].AsBoolean;
  FAnalistaCredito         := qryUsuarios.Fields[ctANALISTACREDITO].AsBoolean;
  FCaixa                   := qryUsuarios.Fields[ctCAIXA].AsBoolean;
  FCaixaAberto             := qryUsuarios.Fields[ctDATAFECHAMENTOCAIXA].AsDateTime < qryUsuarios.Fields[ctDATAABERTURACAIXA].AsDateTime;
  FCobrador                := qryUsuarios.Fields[ctCOBRADOR].AsBoolean;
  FCodigoFiltroSAC_Usuario := qryUsuarios.Fields[ctFILTROSAC].AsInteger;
  FCodigoOperador          := qryUsuarios.Fields[ctOPERADOR].AsString;
  FCodigoUsuario           := qryUsuarios.Fields[ctCODIGO].AsInteger;
  FDataAberturaCaixa       := qryUsuarios.Fields[ctDATAABERTURACAIXA].AsDateTime;
  FDataFechamentoCaixa     := qryUsuarios.Fields[ctDATAFECHAMENTOCAIXA].AsDateTime;
  FDescontoExtra           := qryUsuarios.Fields[ctDESCONTOEXTRA].AsBoolean;
  FDevolucaoProduto        := qryUsuarios.Fields[ctDEVOLUCAOPRODUTO].AsBoolean;
  FFiltroSAC               := qryUsuarios.Fields[ctFILTROSAC].AsInteger;
  FNomeUsuario             := qryUsuarios.Fields[ctNOME].AsString;
  FNumeroLigacao           := qryUsuarios.Fields[ctLIGACAO].AsInteger;
  FPermiteReserva          := qryUsuarios.Fields[ctRESERVARPRODUTO].AsBoolean;
  FPermiteExcluirReserva   := qryUsuarios.Fields[ctEXCLUIRESERVAPRODUTO].AsBoolean;
  FDataLocal               := qryUsuarios.Fields[ctDATACORRENTE].AsDateTime;
  FVendedor                := qryUsuarios.Fields[ctVENDEDOR].AsBoolean;
  FAtendente               := qryUsuarios.Fields[ctATENDENTE].AsBoolean;
  FDevolucaoNumerario      := qryUsuarios.Fields[ctDEVOLUCAONUMERARIO].AsBoolean;
  FAlterarFilialVenda      := qryUsuarios.Fields[ctALTERARFILIALVENDA].AsBoolean;
  FAlterarDadosContabeis   := qryUsuarios.Fields[ctALTERARDADOSCONTABEIS].AsBoolean;
  FGerenteEstoque          := qryUsuarios.Fields[ctGERENTEESTOQUE].AsBoolean;
  FGerenteTecnico          := qryUsuarios.Fields[ctGERENTETECNICO].AsBoolean;
  FAnalistaSite            := qryUsuarios.Fields[ctANALISTASITE].AsBoolean;
  FGerenteProducao         := qryUsuarios.Fields[ctGERENTEPRODUCAO].AsBoolean;
  FGerenteVendas           := qryUsuarios.Fields[ctGERENTEVENDAS].AsBoolean;
  FGerenteCaixa            := qryUsuarios.Fields[ctGERENTECAIXA].AsBoolean;
  FAdministrador           := qryUsuarios.Fields[ctADMINISTRADOR].AsBoolean;
  FSuporte                 := qryUsuarios.Fields[ctSUPORTE].AsBoolean;
  FPagamento               := qryUsuarios.Fields[ctPAGAMENTO].AsBoolean;
  FTransferenciaporItem    := qryUsuarios.Fields[ctTRANSFERENCIAPORITEM].AsBoolean;
  FRestringirFichaCliente  := qryUsuarios.Fields[ctRESTRINGIRFICHACLIENTE].AsBoolean;
  FEmissorNotaFiscal       := qryUsuarios.Fields[ctEMISSORNOTAFISCAL].AsBoolean;
  FLogin                   := qryUsuarios.Fields[ctLOGIN].AsString;
  FFilial                  := qryUsuarios.Fields[ctFILIAL].AsInteger;
  FTrocaProduto            := qryUsuarios.Fields[ctTROCAPRODUTO].AsBoolean;
  FEmail                   := qryUsuarios.Fields[ctEMAIL].AsString;
  FEmailUsuario            := qryUsuarios.Fields[ctEMAIL].AsString;

  FUsuarioEmail            := qryUsuarios.Fields[ctUSUARIOEMAIL].AsString;
  FUsuarioEmailUsuario     := qryUsuarios.Fields[ctUSUARIOEMAIL].AsString;

  FSenhaEmail              := qryUsuarios.Fields[ctSENHAEMAIL].AsString;
  FSenhaEmailUsuario       := qryUsuarios.Fields[ctSENHAEMAIL].AsString;

  FHostPop                 := qryUsuarios.Fields[ctHOSTPOP].AsString;
  FPortaPop                := qryUsuarios.Fields[ctPORTAPOP].AsString;
  FHostSmtp                := qryUsuarios.Fields[ctHOSTSMTP].AsString;
  FHostSmtpUsuario         := qryUsuarios.Fields[ctHOSTSMTP].AsString;

  FPortaSmtp               := qryUsuarios.Fields[ctPORTASMTP].AsString;
  FPortaSmtpUsuario        := qryUsuarios.Fields[ctPORTASMTP].AsString;

  FExpiracaoSenha          := qryUsuarios.Fields[ctEXPIRACAOSENHA].AsDateTime;
  FDiasValidadeSenha       := qryUsuarios.Fields[ctDIASVALIDADESENHA].AsInteger;
  FDiasAvisoSenha          := qryUsuarios.Fields[ctDIASAVISOSENHA].AsInteger;
  FAutenticarSmtp          := qryUsuarios.Fields[ctAUTENTICARSMTP].AsBoolean;

  fsmtprequerssl           := qryUsuarios.Fieldbyname('smtprequerssl').AsBoolean;
  fsmtprequersslUsuario    := qryUsuarios.Fieldbyname('smtprequerssl').AsBoolean;

  fsmtprequertls           := qryUsuarios.Fieldbyname('smtprequertls').AsBoolean;
  FAssunto                 := qryUsuarios.Fields[ctAssunto].AsString;
  FIntroducao              := qryUsuarios.Fields[ctIntroducao].AsString;
  FConclusao               := qryUsuarios.Fields[ctConclusao].AsString;


end;

procedure TtecUsuarios.ReAbreUsuario;
begin
  qryUsuarios.Close;
  qryUsuarios.Open;
  LerPropriedades;
end;

procedure TtecUsuarios.ReAbrirCaixa;
begin
  qryUsuarios.Open;
  qryUsuarios.Edit;
  qryUsuarios.Fields[ctDATAFECHAMENTOCAIXA].AsDateTime := FDataLocal - 1;
  qryUsuarios.Post;
  qryUsuarios.ApplyUpdates;
  qryUsuarios.Transaction.Commit;
  qryUsuarios.Close;
  FCaixaAberto := True;
  FDataFechamentoCaixa := FDataLocal - 1;
end;

function TtecUsuarios.GetTrocaProdutos: Boolean;
begin
  result:=FTrocaProduto;
end;

function TtecUsuarios.GetEmail: String;
begin
  if FEmailEnvio_FilialBase<>'' then
    result := FEmailEnvio_FilialBase
  else
    result := FEmail;
end;

function TtecUsuarios.GetHostPop: String;
begin
  result:=FHostPop;
end;

function TtecUsuarios.GetHostSmtp: String;
begin
  result := fHostSmtp_FilialBase;

  if result='' then
    result:=FHostSmtp;

end;

function TtecUsuarios.GetPortaPop: String;
begin
  if FPortaPop<>'' then
    result:=FPortaPop
  else
    result:='110';
end;

function TtecUsuarios.GetPortaSmtp: String;
begin
  if FPortaSmtp_FilialBase<>'' then
    result := FPortaSmtp_FilialBase
  else
  if FPortaSmtp<>'' then
    result:=FPortaSmtp
  else
    result:='25';
end;

function TtecUsuarios.GetPortaSmtpUsuario: String;
begin
  if FPortaSmtpUsuario<>'' then
    result := FPortaSmtpUsuario
  else
  if FPortaSmtp_FilialBase<>'' then
    result:=FPortaSmtp_FilialBase
  else
    result:='25';
end;


function TtecUsuarios.GetSenhaEmail: String;
begin
  if FSenhaEmail_FilialBase<>'' then
    result := FSenhaEmail_FilialBase
  else
    result:=FSenhaEmail;
end;

function TtecUsuarios.GetUsuarioEmail: String;
begin
  if FUsuarioEmail_FilialBase <> '' then
    result := FUsuarioEmail_FilialBase
  else
    result:=FUsuarioEmail;
end;

function TtecUsuarios.GetExpiracaoSenha: TDateTime;
begin
  result := FExpiracaoSenha;
end;

function TtecUsuarios.GetDiasValidadeSenha: Integer;
begin
  Result := FDiasValidadeSenha;
end;

function TtecUsuarios.GetDiasAvisoSenha: Integer;
begin
  Result := FDiasAvisoSenha;
end;

procedure TtecUsuarios.AtualizarSenha(Senha: String);
begin

  qryUsuariosNovaSenha := TtecQuery.Create(nil);

  qryUsuariosNovaSenha.Database := qryUsuarios.Database;
  qryUsuariosNovaSenha.Sql.Text := 'ALTER USER ' + FLogin + SQLSenhaUsuario + '''' + Senha + '''';
 // qryUsuariosNovaSenha.Params[0].AsString := FLogin;
 // qryUsuariosNovaSenha.Params[1].AsString := Senha;
  qryUsuariosNovaSenha.Open;
  qryUsuariosNovaSenha.Close;

  qryUsuarios.Open;
  qryUsuarios.Edit;
  qryUsuarios.Fields[ctEXPIRACAOSENHA].AsDateTime := IncDay(FDataLocal, FDiasValidadeSenha);
  qryUsuarios.Post;
  qryUsuarios.ApplyUpdates;
  qryUsuarios.Transaction.Commit;
  qryUsuarios.Close;
end;

constructor TtecUsuarios.Create(DB: TtecDatabase; FilialBase: Integer);
var
  DBAnt: TtecDatabase;
begin
  inherited Create;
//  FUsuariosAcessosModulos := TStringList.Create;
  if Assigned(DB) and DB.Connected then begin
    if Assigned(qryUsuarios.Database) {and
       Assigned(qryusuariosacessosmodulos.Database)} then
      DBAnt := TtecDatabase(qryUsuarios.Database)
    else
      DBAnt := nil;
    try
      qryUsuarios.Database := DB;
      qryUsuarios.Params[0].AsString := IntToStr(FilialBase);
      qryUsuarios.Open;
      if qryUsuarios.RecordCount > 0 then
        LerPropriedades;

//      qryUsuariosAcessosmodulos.Database := DB;
//      qryusuariosAcessosmodulos.Params[0].asstring := inttostr(codigousuario);
//      qryusuariosAcessosmodulos.open;

//      if qryusuariosacessosmodulos.RecordCount > 0 then
//        LerAcessosUsuarios;

//      qryUsuariosNovaSenha.Database := DB;
      qryUsuarios.close;
//      qryusuariosacessosmodulos.close;
//      qryUsuariosNovaSenha.Close;
    finally
      if Assigned(DBAnt) then
      begin
        qryUsuarios.Database := DBAnt;
//        qryusuariosacessosmodulos.database := DBAnt;
//        qryUsuariosNovaSenha.database := DBAnt;
      end;
      FFilialBase := FilialBase;
    end
  end
end;

function TtecUsuarios.GetAutenticarSmtp: Boolean;
begin
  if FAutenticarSmtp_FilialBase then
    Result := FAutenticarSmtp_FilialBase
  else
    Result := FAutenticarSmtp;
end;

function TtecUsuarios.GetAssunto: String;
begin
Result:= FAssunto;
end;

function TtecUsuarios.GetConclusao: String;
begin
Result:= FConclusao;
end;

function TtecUsuarios.GetIntroducao: String;
begin
Result:= FIntroducao;
end;

function TtecUsuarios.GetGerenteProducao: Boolean;
begin
  Result := FGerenteProducao
end;

function TtecUsuarios.GetGerenteTecnico: Boolean;
begin
  Result := FGerenteTecnico
end;

function TtecUsuarios.GetAnalistaSite: Boolean;
begin
  Result := FAnalistaSite;
end;


{
destructor TtecUsuarios.Destroy;
begin
  inherited;
  self := nil;
end;
}

function TtecUsuarios.Getsmtprequerssl: Boolean;
begin
  if Fsmtprequerssl_FilialBase then
    result := Fsmtprequerssl_FilialBase
  else
    Result := Fsmtprequerssl;
end;

function TtecUsuarios.Getsmtprequertls: Boolean;
begin
  if fsmtprequertls_FilialBase then
    result := fsmtprequertls_FilialBase
  else
    Result := fsmtprequertls;
    
end;

function TtecUsuarios.GetHostSmtpusuario: String;
begin
  result := FHostSmtpUsuario;

  if result='' then
    result := fHostSmtp_FilialBase;;
end;

function TtecUsuarios.GetUsuarioEmailusuario: String;
begin
  if FUsuarioEmailUsuario <> '' then
    result := FUsuarioEmailUsuario
  else
    result:=FUsuarioEmail_FilialBase;
end;

function TtecUsuarios.GetSenhaEmailUsuario: String;
begin
  if FSenhaEmailUsuario<>'' then
    result := FSenhaEmailUsuario
  else
    result:=FSenhaEmail_FilialBase;

end;

function TtecUsuarios.GetEmailUsuario: String;
begin
  if FEmailUsuario<>'' then
    result := FEmailUsuario
  else
    result := FEmailEnvio_FilialBase;
end;

function TtecUsuarios.GetsmtprequersslUsuario: Boolean;
begin
  if FsmtprequersslUsuario then
    result := fsmtprequersslUsuario
  else
    Result := Fsmtprequerssl_FilialBase;

end;

initialization
  UsuarioLogin := nil;

  qryUsuarios := TtecQuery.Create(nil);
  qryUsuarios.RequestLive := True;
  qryUsuarios.Sql.Text := SQL;

//  qryusuariosacessosmodulos := TtecQuery.Create(nil);
//  qryusuariosacessosmodulos.Sql.Text := SQLUsuariosAcessosModulos;

//  qryUsuariosNovaSenha := TtecQuery.Create(nil);
//  qryUsuariosNovaSenha.Sql.Text := SQLSenhaUsuario;

finalization
  qryUsuarios.Free;
//  qryusuariosacessosmodulos.Free;
//  qryUsuariosNovaSenha.Free;


end.

