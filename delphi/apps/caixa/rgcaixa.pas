unit rgcaixa;

interface

implementation

Uses
  //CLX
  classes,
  //Projeto
  fmautenticacoes, fmfechamentocaixa, fmfrentecaixa, fmadmintefdedicado,
  fmquitacaoextracaixa,fmrelatoriocaixa, fmcontrolerecebimentos, fmclientefrentecaixa, fmCancelamentoNFCe;

initialization
  RegisterClasses([TfrmAutenticacoesCaixa, TfrmFechamentoCaixa, TfrmFrenteCaixa,
                   TfrmAdministracaoTEFDedicado, TfrmQuitacaoExtraCaixa, TfrmRelatorioCaixa,
                   TfrmControleRecebimentos, TfrmClienteFrenteCaixa, TfrmCancelamentoNFCe]);
end.
