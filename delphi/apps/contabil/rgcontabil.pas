unit rgcontabil;

interface

implementation

Uses
  //CLX
  classes,
  //Projeto
  fmplanocontas, fmplanocontasreferencial, fmlancamentocontas, fmlivrodiario, fmlivrorazao,
  fmemissaobalancetes, fmtranferenciasaldoscontabeis, fmencerramentoexercicio,
  fmimpressaolotes, fmimportacaofolhasenior, fmcentrodecusto;

initialization
  RegisterClasses([TfrmPlanoContas, TfrmPlanoContasReferencial, TfrmLancamentoContas,
                   TfrmLivroDiario, TfrmLivroRazao,
                   TfrmEmissaoBalancetes, TfrmTransferirSaldosContabeis,
                   TfrmEncerramentoExercicio, TfrmImpressaoLotes, TfrmImportacaoFolhaSenior,
                   TfrmCentrodeCusto]);
end.
