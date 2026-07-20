unit rgbancos;

interface

implementation

Uses
  //CLX
  classes,
  //Projeto
  fmmovtosbancos, fmconciliacaobancaria, fmImportacaoConciliacao,
  fmrelatorioextratoconta, fmbalancetefinanceiro;

initialization
  RegisterClasses([TfrmMovtosBancos, TfrmConciliacaoBancaria,
                   tfrmImportacaoConciliacao, TfrmRelatorioExtratoConta,
                   Tfrmbalancetefinanceiro]);
end.
