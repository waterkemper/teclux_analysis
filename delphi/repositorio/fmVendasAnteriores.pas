unit fmVendasAnteriores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frVendasAnteriores;

type
  TfrmVendasAnteriores = class(TForm)
    fraVendasAnteriores1: TfraVendasAnteriores;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendasAnteriores: TfrmVendasAnteriores;
  AcionarTelaVendasAnteriores: procedure (Owner: TComponent; cliente, tipocliente, produto: String);

implementation

{$R *.dfm}

procedure AcionarTelaVendasAnteriores_(Owner: TComponent; cliente, tipocliente, produto: String);
begin
  if not assigned(frmVendasAnteriores) or (frmVendasAnteriores.Owner <> Owner) then
  begin
    if assigned(frmVendasAnteriores) then
      frmVendasAnteriores.free;

    frmVendasAnteriores := TfrmVendasAnteriores.create(Owner);

    with frmVendasAnteriores do
    begin
      fraVendasAnteriores1.AbrirConsulta(cliente, tipocliente, produto);
      showmodal;
    end;
  end;
  freeandnil(frmVendasAnteriores);
end;

initialization
  AcionarTelaVendasAnteriores := AcionarTelaVendasAnteriores_;

end.
