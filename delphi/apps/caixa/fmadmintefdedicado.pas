unit fmadmintefdedicado;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ExtCtrls, Buttons, ComCtrls,
  //Projeto
  fmtefdedicado,
  //Componentes
  cppagecontrol;

type
  TfrmAdministracaoTEFDedicado = class(TfrmTEFDedicado)
    tstAdmin: TTabSheet;
    gbxReImpressao: TGroupBox;
    sbnUltimoComprovante: TSpeedButton;
    sbnComprovanteEspecifico: TSpeedButton;
    gbxCancelamentos: TGroupBox;
    sbnNormal: TSpeedButton;
    sbnTelemarketing: TSpeedButton;
    sbnPreAutorizacao: TSpeedButton;
    sbnCapturaPreAutorizacao: TSpeedButton;
    gbxDiversos: TGroupBox;
    sbnTransacoesGerenciais: TSpeedButton;
    sbnTesteComunicacao: TSpeedButton;
    procedure sbnUltimoComprovanteClick(Sender: TObject);
    procedure sbnComprovanteEspecificoClick(Sender: TObject);
    procedure sbnNormalClick(Sender: TObject);
    procedure sbnTelemarketingClick(Sender: TObject);
    procedure sbnPreAutorizacaoClick(Sender: TObject);
    procedure sbnCapturaPreAutorizacaoClick(Sender: TObject);
    procedure sbnTransacoesGerenciaisClick(Sender: TObject);
    procedure sbnTesteComunicacaoClick(Sender: TObject);
  protected
    function ObterAutorizacao: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

Uses
  //Biblio
  ctconstantes, biblio, cltefdedicado, clusuario, clparametrossistema,
  //Repositorio
  dmbasico, dmsenhaautorizacao;

{$R *.dfm}

constructor TfrmAdministracaoTEFDedicado.Create(AOwner: TComponent);
begin
  inherited;
  tecTEF.OnAutorizacao := ObterAutorizacao;
  pgcSiTEF.ActivePage := tstAdmin
end;

function TfrmAdministracaoTEFDedicado.ObterAutorizacao: Boolean;
var
  Usr: TtecUsuarios;
  Msg: String;
  dtmsenhaautorizacao: TdtmSenhaAutorizacao;
begin
  Msg := Format(ctTEXTOAUTORIZACAO, ['Cancelamento de transação do TEF', 'Gerente de Caixa']);
  dtmsenhaautorizacao := TdtmSenhaAutorizacao.Create(Self, taLOGIN, Msg);
  try
    if Assigned(dtmSenhaAutorizacao) and dtmSenhaAutorizacao.Autorizado then
      try
        Usr := TtecUsuarios.Create(dtmSenhaAutorizacao.dbaTecSoft);
        Result := Usr.Caixa;
      except
        on E:Exception do begin
          if Pos('permission denied', E.Message) > 0 then
            MensagemErro(ctERROPERMISSAONEGADA)
          else
            MensagemErro(E.Message);
          Result := False;
        end
      end
    else
      Result := False;
  finally
    dtmsenhaautorizacao.Free;
  end
end;

procedure TfrmAdministracaoTEFDedicado.sbnCapturaPreAutorizacaoClick(Sender: TObject);
begin
  inherited;
  tecTEF.ExecutarOperacao(ctFICancelamentoCapturaPreAutorizacao)
end;

procedure TfrmAdministracaoTEFDedicado.sbnComprovanteEspecificoClick(Sender: TObject);
begin
  inherited;
  tecTEF.ExecutarOperacao(ctFIReImpressaoEspecifico)
end;

procedure TfrmAdministracaoTEFDedicado.sbnNormalClick(Sender: TObject);
begin
  inherited;
  tecTEF.ExecutarOperacao(ctFICancelamentoNormal)
end;

procedure TfrmAdministracaoTEFDedicado.sbnPreAutorizacaoClick(Sender: TObject);
begin
  inherited;
  tecTEF.ExecutarOperacao(ctFICancelamentoPreAutorizacao)
end;

procedure TfrmAdministracaoTEFDedicado.sbnTelemarketingClick(Sender: TObject);
begin
  inherited;
  tecTEF.ExecutarOperacao(ctFICancelamentoTelemarketing)
end;

procedure TfrmAdministracaoTEFDedicado.sbnTesteComunicacaoClick(Sender: TObject);
begin
  inherited;
  tecTEF.ExecutarOperacao(ctFIComunicacaoTef)
end;

procedure TfrmAdministracaoTEFDedicado.sbnTransacoesGerenciaisClick(Sender: TObject);
begin
  inherited;
  tecTEF.ExecutarOperacao(ctFITransacoesGerenciais)
end;

procedure TfrmAdministracaoTEFDedicado.sbnUltimoComprovanteClick(Sender: TObject);
begin
  inherited;
  tecTEF.ExecutarOperacao(ctFIReImpressaoUltimoComprovante)
end;

end.
