unit rgmontagens;

interface
uses classes;

implementation
uses  fmcadastrotabelamontagem,
      fmcadastrorequisicoesmontagens,
      fmcadastrorequisicoesitensmontagens,
      fmgeracaorequisicoesmontagens,
      fmlerdadosgeracao,
      fmfechamentorequisicoesmontagens,
      fmfechamentorequisicoesitensmontagens,
      fmlerdadosfechamento,
      fmquitacaorequisicoesmontagens,
      fmdefinicaomontador,
      fmrelatoriorequisicoespormontador,
      fmrelatorioreimpressaorequisicoes,
      fmlerdadosdefinicaomontador,
      fmlerdadosquitacao;

initialization
registerclasses([TfrmCadastroTabelaMontagem,
                 TfrmCadastroRequisicoesMontagens,
                 TfrmCadastroRequisicoesItensMontagens,
                 TfrmGeracaoRequisicoesMontagens,
                 TfrmLerDadosGeracao,
                 TfrmFechamentoRequisicoesMontagens,
                 TfrmFechamentoRequisicoesItensMontagens,
                 TfrmLerDadosFechamento,
                 TfrmQuitacaoRequisicoesMontagens,
                 TfrmDefinicaoMontador,
                 TfrmRelatorioRequisicoesporMontador,
                 TfrmRelatorioReimpressaoRequisicoes,
                 TfrmLerDadosDefinicaoMontador,
                 TfrmLerDadosQuitacao]);
end.
