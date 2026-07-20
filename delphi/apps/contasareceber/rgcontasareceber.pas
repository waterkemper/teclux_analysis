unit rgcontasareceber;

interface

Uses
  //CLX
  classes;

implementation

Uses
  fmrelatoriocontasareceber,
  fmrelatoriocontasareceberportipoderecebimento,
  fmestornorecebimentos, fmquitacaolote,
  fmrelatoriofluxodecaixa, fmrelatoriosituacaoclientes;

initialization
  RegisterClasses([Tfrmrelatoriocontasareceber,
                   Tfrmrelatoriocontasareceberportipoderecebimento,
                   TfrmQuitacaoLote,
                   TfrmEstornoRecebimentos, TfrmRelatorioFluxoDeCaixa,
                   TfrmRelatorioSituacaoClientes]);
end.
