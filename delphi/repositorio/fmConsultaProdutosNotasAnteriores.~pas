unit fmConsultaProdutosNotasAnteriores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmnavcontroles, frProdutosNotasFiscaisAnteriores, ctconstantes;

type
  TfrmConsultaProdutosNotasFiscaisAnteriores = class(TfrmNavControles)
    fraProdutosNotasFiscaisAnteriores1: TfraProdutosNotasFiscaisAnteriores;
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;


  end;

var
  frmConsultaProdutosNotasFiscaisAnteriores: TfrmConsultaProdutosNotasFiscaisAnteriores;
  AcionarTelaonsultaProdutosNotasAnteriores: procedure (Owner: TComponent; CodigoNota: TTecLargeIntRetorno;  Produto: TTecStringRetorno);

implementation

{$R *.dfm}


procedure AcionarTelaonsultaProdutosNotasAnteriores_(Owner: TComponent; CodigoNota: TTecLargeIntRetorno;  Produto: TTecStringRetorno);
begin
  if not assigned(frmConsultaProdutosNotasFiscaisAnteriores) or (frmConsultaProdutosNotasFiscaisAnteriores.Owner <> Owner) then
  begin
    if assigned(frmConsultaProdutosNotasFiscaisAnteriores) then
      frmConsultaProdutosNotasFiscaisAnteriores.free;
      
    frmConsultaProdutosNotasFiscaisAnteriores := TfrmConsultaProdutosNotasFiscaisAnteriores.create(Owner);
  end;

{
  if frmConsultaProdutosNotasFiscaisAnteriores.Owner <> Owner then
  begin
    frmConsultaProdutosNotasFiscaisAnteriores.free;
    frmConsultaProdutosNotasFiscaisAnteriores := TfrmConsultaProdutosNotasFiscaisAnteriores.create(Owner);
  end;
}  

  frmConsultaProdutosNotasFiscaisAnteriores.fraProdutosNotasFiscaisAnteriores1.Codigonota := CodigoNota;
  frmConsultaProdutosNotasFiscaisAnteriores.fraProdutosNotasFiscaisAnteriores1.Produto := Produto;

  frmConsultaProdutosNotasFiscaisAnteriores.fraProdutosNotasFiscaisAnteriores1.AbrirqryProdutosNotaFiscalAnteriores;
  frmConsultaProdutosNotasFiscaisAnteriores.BringToFront;

end;

{ TfrmConsultaProdutosNotasFiscaisAnteriores }

destructor TfrmConsultaProdutosNotasFiscaisAnteriores.Destroy;
begin
  frmConsultaProdutosNotasFiscaisAnteriores := nil;
  inherited;
end;

initialization
   AcionarTelaonsultaProdutosNotasAnteriores :=  AcionarTelaonsultaProdutosNotasAnteriores_;


end.
