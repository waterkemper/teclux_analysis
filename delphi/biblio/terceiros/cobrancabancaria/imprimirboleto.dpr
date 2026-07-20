program imprimirboleto;

uses
  Forms,
  fmemissaoboletos in 'fmemissaoboletos.pas' {frmImpressaoBoletoCodigoBarras};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmImpressaoBoletoCodigoBarras, frmImpressaoBoletoCodigoBarras);
  Application.Run;
end.
