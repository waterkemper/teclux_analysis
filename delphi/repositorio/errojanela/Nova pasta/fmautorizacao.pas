unit fmautorizacao;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Forms, Controls, StdCtrls,
  ExtCtrls, DB, {Qete,}
  // Biblio
  biblio,
  //Repositorio
  fmloginbasico;

type
  TfrmAutorizacao = class(TfrmLoginBasico)
    mmoMensagem: TMemo;
  public
    constructor Create(Texto: String; AOwner: TComponent); reintroduce; virtual;
  end;

var
  frmAutorizacao: TfrmAutorizacao;

implementation

{$R *.dfm}

{ TfrmLogin }

constructor TfrmAutorizacao.Create(Texto: String; AOwner: TComponent);
begin
  inherited Create(nil);
  mmoMensagem.Lines.Text := Texto;
end;

end.
