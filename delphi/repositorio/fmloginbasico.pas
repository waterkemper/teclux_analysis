unit fmloginbasico;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Forms, Controls, StdCtrls,
  ExtCtrls, DB, {Qete,}
  // Biblio
  ctconstantes, biblio, Windows;

type
  TfrmLoginBasico = class(TForm)
    pnlLogin: TPanel;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnOk: TButton;
    btnCancelar: TButton;
    procedure edtUsuarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
    function ControlesPreenchidos: Boolean;
    function GetSenha: String;
    function GetUsuario: String;
  public
    property Senha: String read GetSenha;
    property Usuario: String read GetUsuario;
  end;

var
  frmLoginBasico: TfrmLoginBasico;

implementation

{$R *.dfm}

{ TfrmLogin }

procedure TfrmLoginBasico.edtUsuarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if TeclaEnterOuReturn(Key) then
    edtSenha.SetFocus
  else
  if Key = VK_ESCAPE then
    ModalResult := mrAbort;
end;

procedure TfrmLoginBasico.edtSenhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if TeclaEnterOuReturn(Key) then begin
    if ControlesPreenchidos then
      ModalResult := mrOk
  end else if Key = VK_ESCAPE then
    ModalResult := mrAbort;
end;

function TfrmLoginBasico.GetSenha: String;
begin
  Result := edtSenha.Text
end;

function TfrmLoginBasico.GetUsuario: String;
begin
  Result := edtUsuario.Text
end;

function TfrmLoginBasico.ControlesPreenchidos: Boolean;
begin
  if Trim(edtUsuario.Text) = '' then begin
    MensagemAviso(ctUSUARIOLOGINVAZIO);
    edtUsuario.SetFocus;
    Result := False
  end else if Pos(' ', edtUsuario.Text) > 0 then begin
    MensagemAviso(ctUSUARIOCOMESPACO);
    Result := False
  end else if Trim(edtSenha.Text) = '' then begin
    MensagemAviso(ctSENHALOGINVAZIO);
    edtSenha.SetFocus;
    Result := False
  end else begin
    edtSenha.Text := StringReplace(edtSenha.Text, ' ', '*', [rfReplaceAll, rfIgnoreCase]);
    Result := True
  end
end;

procedure TfrmLoginBasico.btnOkClick(Sender: TObject);
begin
  if ControlesPreenchidos then
    ModalResult := mrOk;
end;

procedure TfrmLoginBasico.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrAbort;
end;

procedure TfrmLoginBasico.FormShow(Sender: TObject);
begin
//  // // // // // QWidget_setActiveWindow(Handle);
end;

end.
