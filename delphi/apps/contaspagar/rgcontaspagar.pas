unit rgcontaspagar;

interface
uses classes;

implementation
uses  fmfichafinanceirafornecedor, fmcontaspagar, fmquitacaoduplicatas,
      fmcadastrotipospagamentos, fmcancelamentoquitacao, fmrelatoriochequesemitidos,
      fmrelatorioduplicatas, fmautorizacaopagamento, fmrelatoriosituacaofornecedores,
      fmGerarRemessasPagamentos, fmLerRetornoPagFor;

initialization
registerclasses([TfrmFichaFinanceiraFornecedor, TfrmContasPagar, TfrmQuitacaoDuplicatas,
                 TfrmCadastroTiposPagamentos, TfrmCancelamentoQuitacao,
                 TfrmRelatorioChequesEmitidos, TfrmRelatorioDuplicatas,
                 TfrmAutorizacaoPagamento, TfrmRelatoriosituacaofornecedores,
                 TfrmGerarRemessasPagamentos, TfrmLerRetornoPagFor]);


end.
