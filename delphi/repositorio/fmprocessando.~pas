unit fmprocessando;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TfrmProcessando = class(Tform)
    lblProcessando: TLabel;
    lblMensagem: TLabel;
    pnlFundoJanela: TPanel;
  private
    FMensagem: String;
    procedure SetMensagem(const Value: String);
  public
    destructor destroy; override;
    property Mensagem: String read FMensagem write SetMensagem;
  end;

var
  frmProcessando: TfrmProcessando;

implementation

uses biblio;

{$R *.dfm}

{ TfrmProcessando }

destructor TfrmProcessando.destroy;
begin
  inherited;
  frmProcessando := nil;
end;

procedure TfrmProcessando.SetMensagem(const Value: String);
begin
  FMensagem := Value;
  if Trim(Value) <> '' then
  begin
    lblMensagem.Height := 30;
    lblMensagem.Caption := Mensagem;
  end;
end;

end.
