unit rgbancos;

interface

implementation

Uses
  //CLX
  classes,
  //Projeto
  fmmovtosbancos, fmconciliacaobancaria, fmImportacaoConciliacao,
  fmImportacaoDDA,
  fmrelatorioextratoconta, fmbalancetefinanceiro;

initialization
  RegisterClasses([TfrmMovtosBancos,
                   TfrmConciliacaoBancaria,
                   TfrmImportacaoDDA,
                   tfrmImportacaoConciliacao,
                   TfrmRelatorioExtratoConta,
                   Tfrmbalancetefinanceiro]);
end.
