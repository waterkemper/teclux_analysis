unit dmsenhaautorizacao;

interface

uses
  SysUtils, Classes, Forms, DB, Controls,
  //Terceiros
  ZTransact, ZPgSqlTr, cptransact, ZConnect, ZPgSqlCon,
  // Constantes
  ctconstantes, biblio,
  //Compoentes
  cpdatabase;

type
  TdtmSenhaAutorizacao = class(TDataModule)
    dbaTecSoft: TtecDatabase;
    tstTransact: TtecTransact;
    procedure dbaTecSoftBeforeConnect(Sender: TObject);
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
  inherited;
  while not dbaTecSoft.Connected do begin
    if (Tentativa < LimiteTentativasLogin) then begin
      Reconectar;
      if not dbaTecSoft.Connected then begin
        Inc(Tentativa);
        if Tentativa < LimiteTentativasLogin then
          MensagemAviso(Format(ctSENHAAUTORIZACAOINVALIDA, [dbaTecSoft.Login]))
         else
          MensagemAviso(ctAUTORIZACAOFALHOU)
      end;
    end
    else
      Break;
  end;
end;

constructor TdtmSenhaAutorizacao.Create(AOwner: TComponent; TipoAutorizacao: TtecTipoAutorizacao; Texto: String);
begin
  inherited Create(AOwner);
  Tentativa:= 0;
  FTipoAutorizacao    := TipoAutorizacao;
  dbaTecSoft.Database := dtmTecSoft.Database.Database;
  dbaTecSoft.Host     := dtmTecSoft.Database.Host;
  dbaTecSoft.Port     := dtmTecSoft.Database.port;
  FTexto              := Texto;
end;

procedure TdtmSenhaAutorizacao.dbaTecSoftBeforeConnect(Sender: TObject);
begin
  Login
end;

function TdtmSenhaAutorizacao.GetAutorizado: Boolean;
begin
  Result:= dbaTecSoft.Connected;
end;

function TdtmSenhaAutorizacao.Janela: TForm;
begin
  if FTipoAutorizacao = taSENHA then
    Result := TfrmSenhaAutorizacao.Create(Self)
  else
    Result := TfrmAutorizacao.Create(FTexto,Self);
end;

procedure TdtmSenhaAutorizacao.Login;
begin
  frmJanela := Janela;
  try
    if frmJanela.ShowModal = mrOk then begin
      dbaTecSoft.Login    := Usuario;
      dbaTecSoft.Password := Senha;
    end else
      Tentativa := LimiteTentativasLogin;
  finally
    frmJanela.Free;
  end;
end;

procedure TdtmSenhaAutorizacao.Reconectar;
begin
  dbaTecSoft.Connected := False;
  try
    dbaTecSoft.Connected := True;
  except
    on E:EDatabaseError do begin
      if (Pos('password authentication failed for user', E.Message) = 0) and
         (Pos('no password supplied', E.Message) = 0) then
        frmJanela.ModalResult:= mrCancel;
    end else
      raise;
  end;
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


