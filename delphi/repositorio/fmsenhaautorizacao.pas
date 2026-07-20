unit fmsenhaautorizacao;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, {Qete,} DB, StdCtrls,
  ExtCtrls, Buttons, Windows;

type
  TfrmSenhaAutorizacao = class(TForm)
    gbxSenhaAutorizacao: TGroupBox;
    edtSenha: TEdit;
    lblDescricao: TLabel;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    pnlSeparador: TPanel;
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  end;


implementation

Uses
  // Constantes
  biblio,
  // Repositorio
  dmbasico;


{$R *.dfm}

procedure TfrmSenhaAutorizacao.edtSenhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if TeclaEnterOuReturn(Key) then begin
    edtSenha.Text := StringReplace(edtSenha.Text, ' ', '*', [rfReplaceAll, rfIgnoreCase]);
    ModalResult := mrOk
  end else if Key = VK_ESCAPE then
    ModalResult := mrCancel;
end;

procedure TfrmSenhaAutorizacao.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult <> mrOK then
    Close;
end;

end.
