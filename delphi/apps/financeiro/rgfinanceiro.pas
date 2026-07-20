unit rgfinanceiro;

interface

Uses
  //CLX
  classes;

implementation

Uses
  fmrelatoriochequesvencimentos, fmmanutencaocheques, fmrepassecheques,
  fmlerdadosdefinicaocobrador,fmplanilhacusto, fmcadastromoedas, fmcadastrocheques,
  fmdre, fmDREGerencial;

initialization
  RegisterClasses([TfrmRelatorioChequesVencimentos, TfrmManutencaoCheques,
                   Tfrmrepassecheques, TfrmLerDadosDefinicaoCobrador,
                   TfrmPlanilhaCusto, TfrmCadastroMoedas, tfrmCadastroCheques,
                   Tfrmdre, TfrmDREGerencial]);

end.
