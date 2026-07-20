unit rgentrega;

interface

implementation
uses
  //CLX
  classes,
  //Projeto
  fmcadastrotabelafretes, fmcadastroromaneios, fmcadastroitensromaneio,
  fmquitacaoromaneios, fmrelatorioromaneios, fmrelatoriofretes,
  fmrelatorioentrega, fmConsultaEntregaProdutos, fmConsultaRomaneios,
  fmConfirmarRomaneiosSaida;

initialization
  registerclasses([TfrmCadastroTabelaFretes, TfrmCadastroRomaneio,
   TfrmCadastroItensRomaneio, TfrmQuitacaoRomaneios,
   TfrmRelatorioRomaneios, TfrmRelatorioFretes, Tfrmrelatorioentrega,
   TfrmConsultaEntregaProdutos, TfrmConsultaRomaneios,
   TfrmConfirmarRomaneiosSaida]);

end.
