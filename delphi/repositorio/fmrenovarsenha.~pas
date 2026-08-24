unit fmrenovarsenha;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, {Qete,} biblio, Windows;

type
  TfrmRenovarSenha = class(TForm)
    Panel1: TPanel;
    lblSenha: TLabel;
    lblConfirmarSenha: TLabel;
    edtSenha: TEdit;
    edtConfirmarSenha: TEdit;
    btnOk: TButton;
    btnCancelar: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConfirmarSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function getConfirmacaoNovaSenha: String;
    function getNovaSenha: String;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    property NovaSenha: String read getNovaSenha;
    property ConfirmacaoNovaSenha: String read getConfirmacaoNovaSenha;
    { Public declarations }
  end;

var
  frmRenovarSenha: TfrmRenovarSenha;

implementation

{$R *.dfm}

{ TfrmRenovarSenha }

constructor TfrmRenovarSenha.Create(AOwner: TComponent);
begin
  inherited;
  Top  := (Screen.Height - Height) div 2;
  Left := (Screen.Width - Width) div 2;
end;

function TfrmRenovarSenha.getConfirmacaoNovaSenha: String;
begin
  result := edtSenha.Text;
end;

function TfrmRenovarSenha.getNovaSenha: String;
begin
  result := edtConfirmarSenha.Text;
end;

procedure TfrmRenovarSenha.btnOkClick(Sender: TObject);
begin
  if (trim(edtSenha.Text) <> '') then
  begin
    if trim(edtConfirmarSenha.Text) = trim(edtSenha.Text) then
      ModalResult := mrOk
    else
    begin
      MensagemAviso('As senhas não conferem!');
      edtSenha.SetFocus;
    end;
  end
  else
  begin
    MensagemAviso('O campo "Senha" não pode ser nulo ou conter apenas espaços em branco!');
    edtSenha.SetFocus;
  end;
end;

procedure TfrmRenovarSenha.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrAbort;
end;

procedure TfrmRenovarSenha.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if TeclaEnterOuReturn(Key) then
    edtConfirmarSenha.SetFocus
  else
  if Key = VK_ESCAPE then
    ModalResult := mrAbort;
end;

procedure TfrmRenovarSenha.edtConfirmarSenhaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if TeclaEnterOuReturn(Key) then
    btnOkClick(nil)
  else if Key = VK_ESCAPE then
    ModalResult := mrAbort;
end;

end.
