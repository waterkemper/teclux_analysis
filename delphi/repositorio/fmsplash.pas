unit fmsplash;

interface

uses
  //CLX
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Types, ExtCtrls{Qete,};

type
  TfrmSplash = class(TForm)
    lblSite: TLabel;
    lblMail: TLabel;
    lblCopyRight: TLabel;
    lblVersao: TLabel;
    lblRegistro: TLabel;
    lblNome: TLabel;
    lblNumero: TLabel;
    lblNotificacao: TLabel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Notificacao(Str: String);
    procedure setVersao(Valor: String);
  end;

var
  frmSplash: TfrmSplash;

implementation

uses
  //Biblio
   biblio;

{$R *.dfm}

constructor TfrmSplash.Create(AOwner: TComponent);
begin
  inherited;
  lblNome.Caption   := GetRegistro;
  NotificacaoSplash := Notificacao;
end;

destructor TfrmSplash.Destroy;
begin
  NotificacaoSplash := nil;
  inherited;
end;

procedure TfrmSplash.Notificacao(Str: String);
begin
  self.lblNotificacao.Caption := Str;
  self.lblNotificacao.Repaint;
end;

procedure TfrmSplash.setVersao(Valor: String);
begin
  lblNumero.Caption := Valor;
end;

procedure TfrmSplash.FormShow(Sender: TObject);
begin
 // // // // // QWidget_setActiveWindow(Handle);
end;

end.
