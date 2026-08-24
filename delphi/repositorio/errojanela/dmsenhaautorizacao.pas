unit dmsenhaautorizacao;

interface

uses
  SysUtils, Classes, Forms, DB, Controls,
  //Terceiros
  ZTransact, ZPgSqlTr, cptransact, ZConnect, ZPgSqlCon,
  // Constantes
  ctconstantes, biblio,
  //Compoentes
  cpdatabase, windows;

type
  TdtmSenhaAutorizacao = class(TDataModule)
    dbaTecSoft_u: TtecDatabase;
    tstTecSoft_u: TtecTransact;
//    procedure dbaTecSoft_uBeforeConnect(Sender: TObject);
  protected
    FTexto: String;
    FTipoAutorizacao: TtecTipoAutorizacao;
    frmJanela: TForm;
    function GetAutorizado: Boolean;
    function Janela: TForm; virtual;
    procedure Login;
    function Senha: String; virtual;
    function Usuario: String; virtual;
  public
    Tentativa: Integer;
    procedure AfterConstruction; override;
    procedure Reconectar;
    constructor Create(AOwner: TComponent; TipoAutorizacao: TtecTipoAutorizacao; Texto: String); reintroduce;
    property Autorizado: Boolean read GetAutorizado;
  end;

implementation

uses
  //Repositorio
  dmtecsoft, fmautorizacao, fmsenhaautorizacao;

{$R *.dfm}

procedure TdtmSenhaAutorizacao.AfterConstruction;
begin
//  OutputDebugString('entrou AfterConstruction');
  inherited;
//  OutputDebugString('saiu AfterConstruction');

//  OutputDebugString('entrou reconectar');
  while not dbaTecSoft_u.Connected do
  begin
    if (Tentativa < LimiteTentativasLogin) then
    begin
      Reconectar;
      if not dbaTecSoft_u.Connected then begin
        Inc(Tentativa);
        if Tentativa < LimiteTentativasLogin then
          MensagemAviso(Format(ctSENHAAUTORIZACAOINVALIDA, [dbaTecSoft_u.Login]))
         else
          MensagemAviso(ctAUTORIZACAOFALHOU)
      end;
    end
    else
      Break;
  end;
//  OutputDebugString('saiu reconectar');
end;

constructor TdtmSenhaAutorizacao.Create(AOwner: TComponent; TipoAutorizacao: TtecTipoAutorizacao; Texto: String);
begin
//  OutputDebugString('antes TdtmSenhaAutorizacao.Create(AOwner: TComponent; TipoAutorizacao: TtecTipoAutorizacao; Texto: String)');
  inherited Create(AOwner);
//  OutputDebugString('depois TdtmSenhaAutorizacao.Create(AOwner: TComponent; TipoAutorizacao: TtecTipoAutorizacao; Texto: String)');
  Tentativa:= 0;
  FTipoAutorizacao    := TipoAutorizacao;

  OutputDebugString(pansichar(dtmTecSoft.Database.Database + ' - ' +
                    dtmTecSoft.Database.Host + ' - ' +
                    dtmTecSoft.Database.port + ' - ' +
                    texto));

//  OutputDebugString('antes dbaTecSoft.Database := dtmTecSoft.Database.Database;');
  dbaTecSoft_u.Database := dtmTecSoft.Database.Database;
//  OutputDebugString('depois dbaTecSoft.Database := dtmTecSoft.Database.Database;');

//  OutputDebugString('antes dbaTecSoft.Host     := dtmTecSoft.Database.Host;');
  dbaTecSoft_u.Host     := dtmTecSoft.Database.Host;
//  OutputDebugString('depois dbaTecSoft.Host     := dtmTecSoft.Database.Host;');

//  OutputDebugString('antes dbaTecSoft.Port     := dtmTecSoft.Database.port;');
  dbaTecSoft_u.Port     := dtmTecSoft.Database.port;
//  OutputDebugString('depois dbaTecSoft.Port     := dtmTecSoft.Database.port;');

//  OutputDebugString('antes FTexto');
  FTexto              := Texto;
//  OutputDebugString('depois FTexto');
end;

{
procedure TdtmSenhaAutorizacao.dbaTecSoft_uBeforeConnect(Sender: TObject);
begin
  Login
end;
}

function TdtmSenhaAutorizacao.GetAutorizado: Boolean;
begin
  Result:= dbaTecSoft_u.Connected;
end;

function TdtmSenhaAutorizacao.Janela: TForm;
begin
{
  if FTipoAutorizacao = taSENHA then
    Result := TfrmSenhaAutorizacao.Create(Self)
  else
    Result := TfrmAutorizacao.Create(FTexto,Self);
    }

  if FTipoAutorizacao = taSENHA then
    Result := TfrmSenhaAutorizacao.Create(nil)
  else
    Result := TfrmAutorizacao.Create(FTexto,nil);

end;

procedure TdtmSenhaAutorizacao.Login;
begin
  frmJanela := Janela;
  try
    if frmJanela.ShowModal = mrOk then begin
      dbaTecSoft_u.Login    := Usuario;
      dbaTecSoft_u.Password := Senha;
    end else
      Tentativa := LimiteTentativasLogin;
  finally
    frmJanela.Free;
  end;
end;

procedure TdtmSenhaAutorizacao.Reconectar;
begin
//  OutputDebugString('reconectar');

  if dbaTecSoft_u.Connected then
  begin
    exit;

    dbaTecSoft_u.Connected := False;
//    OutputDebugString('dbaTecSoft.Connected := False;');
  end;

  login;

  if (dbaTecSoft_u.Login = '') or
     (dbaTecSoft_u.Password = '') then
   Reconectar;

  try

    OutputDebugString('inicio dbaTecSoft.Connected := True;');
    dbaTecSoft_u.Connected := True;
    OutputDebugString('fim dbaTecSoft.Connected := True;');
  except

    on E:EDatabaseError do begin
      if (Pos('password authentication failed for user', E.Message) = 0) and
         (Pos('no password supplied', E.Message) = 0) then
      begin

//        OutputDebugString('antes cancel janela');

        if assigned(frmJanela)  then
          frmJanela.ModalResult:= mrCancel;
//        OutputDebugString('depois cancel janela');

      end;
    end
    {
    else
      raise;
      }
  end;

//  OutputDebugString('fim reconectar');
end;

function TdtmSenhaAutorizacao.Senha: String;
begin
  if FTipoAutorizacao = taSENHA then
    Result := TfrmSenhaAutorizacao(frmJanela).edtSenha.Text
  else
    Result := TfrmAutorizacao(frmJanela).Senha
end;

function TdtmSenhaAutorizacao.Usuario: String;
begin
  if FTipoAutorizacao = taSENHA then
    Result := dtmTecsoft.Database.Login
  else
    Result := TfrmAutorizacao(frmJanela).Usuario
end;

end.


