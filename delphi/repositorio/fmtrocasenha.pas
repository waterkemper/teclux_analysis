unit fmtrocasenha;

interface

uses
  SysUtils, Types, Classes, Variants, Controls, Forms,
  StdCtrls, Buttons, ExtCtrls,
  // Terceiros
//  ZQuery,
  // Biblio
  biblio, ctconstantes,
  // Repositorio
  fmnavcontroles, fmajudabt;

type

  TfrmTrocaSenha = class(TfrmNavControles)
    edtAtual: TEdit;
    edtNova: TEdit;
    edtConfirma: TEdit;
    lblAtual: TLabel;
    lblNova: TLabel;
    lblConfirma: TLabel;
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
  protected
    FNovaSenha: String;
    function DadosValidos: Integer;
  public
    property NovaSenha: String read FNovaSenha;
  end;

var
  frmTrocaSenha: TfrmTrocaSenha;

const

  Msg: array[0..3] of String = ('A senha atual é inválida.',
                                'Reconfirme sua nova senha.',
                                'A nova senha deve ser diferente da atual.',                                
                                'A senha deve ter no mínimo ' +
                                 TamanhoMinimoSenha + ' caracteres.');
implementation

uses
  //CLX
  dmbasico;

{$R *.dfm}

{ TfrmTrocaSenha }

function TfrmTrocaSenha.DadosValidos: Integer;
begin
  if edtAtual.Text <> TdtmBasico.dtmTecsoft.dbaTecSoft.Password then
    Result := 0
  else
  if edtNova.Text <> edtConfirma.Text then
    Result := 1
  else
  if edtAtual.Text = edtNova.Text then
    Result := 2
  else
  if Length(edtNova.Text) < StrToInt(TamanhoMinimoSenha) then
    Result := 3
  else
    Result := -1;
end;

end.
