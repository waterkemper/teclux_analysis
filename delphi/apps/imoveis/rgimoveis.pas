unit rgimoveis;

interface

implementation

Uses
  //CLX
  classes, fmcadastroempreendimentos, fmcadastrounidades, fmcadastroimoveis,
  fmcontratosimoveis, fmGerarCobrancaBancaria, fmatualizacaomonetaria,
  fmrelatoriorecebimentos, fmrelatoriosaldodevedor, fmrelatorioatualizacaomonetaria,
  fmrelatoriorecebimentoslongoprazo, fmrelatorioparcelasatraso, fmarquivodimob,
  fmdiarioauxiliarrecebimentosimoveis, fmImportarAlugueis, fmPlanilhaReversaoAVP,
  fmTransferenciaLongoPrazo, fmrelatoriocontratossituacao, fmrelatoriocontasareceberimoveis,
  fmrelatoriosituacaoavp;

initialization
  RegisterClasses([TFrmcadastroempreendimentos, TFrmCadastroUnidades,
                    TFrmCadastroImoveis, TFrmContratosImoveis,
                    TfrmGerarCobrancaBancaria, TFrmatualizacaomonetaria,
                    TfrmRelatorioRecebimentos, TFrmRelatorioSaldoDevedor,
                    TFrmrelatorioatualizacaomonetaria, TFrmrelatoriorecebimentoslongoprazo,
                    TFrmrelatorioparcelasatraso, TfrmArquivoDimob,
                    TfrmDiarioAuxiliarRecebimentosImoveis, TfrmImportarAlugueis,
                    TfrmPlanilhaReversaoAVP, TfrmTransferenciaLongoPrazo,
                    TfrmrelatorioContratosSituacao, TfrmRelatorioContasaReceberImoveis,
                    Tfrmrelatoriosituacaoavp]);
end.
