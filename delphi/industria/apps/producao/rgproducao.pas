unit rgproducao;

interface

Uses
  //CLX
  classes;

implementation

Uses
  fmcadastroosp, fmcadastroniveissalariais, fmcadastromaquinas,
  fmcadastrooperacoes, fmcadastrofluxogramas, fmrelatorioentradaosp,
  fmrelatorionotasportransportador, fmconsultaosp, fmcadastrofalha,
  fmrelatoriopedidosclientes, fmquadroprogramacaosemanal,
  fmquadroatrasosemanal, fmoperacoesosp, fmcadastroniveisconhecimento,
  fmcadastroturnos, fmrelatorioresumoestoque, fmcadastromotivosparadas,
  fmcadastroSetoresProducao, fmLiberacaoMaquinas,  fmcadastroInstrucoes,
  fmcadastroOperadores, fmindiceprodutividade, fmindiceprodutividadeoee,
  fmindicenaoqualidade, fmtempousuariosetor, fmrelatorioclienteprodutofaturado,
  fmrelatorioevolucaoprecos, fmRequisicoesOSP, fmImprimirPNs, fmmotivosparadas,
  fmRelatorioComposicaoPN, fmCustoporPN, fmAnaliseFalhasMaquinasSetores,
  fmAnaliseParadasMaquinasSetores, fmFCI, fmOperacoesPorcelana;

initialization
  RegisterClasses([TfrmCadastroOSP,TfrmCadastroNiveisSalariais,
                   TfrmCadastroMaquinas, TfrmCadastroOperacoes,
                   TfrmCadastroFluxoGramas, Tfrmrelatorioentradaosp,
                   Tfrmrelatorionotasportransportador,
                   Tfrmrelatorionotasportransportador, TfrmConsultaOsp,
                   TfrmCadastroFalhas, TfrmRelatorioPedidosClientes,
                   TfrmQuadroProgramacaoSemanal, TFrmQuadroAtrasoSemanal,
                   TfrmOperacoesOSP, TfrmCadastroNiveisConhecimento,
                   TfrmCadastroMotivosParadas, TfrmCadastroTurnos,
                   TfrmRelatorioResumoEstoque, TfrmCadastroSetoresProducao,
                   TfrmLiberacaoMaquinas, TfrmcadastroInstrucoes,
                   TfrmcadastroOperadores, TfrmIndiceProdutividade,
                   TfrmIndiceProdutividadeOEE, TfrmIndicenaoqualidade,
                   Tfrmtempousuariosetor, TfrmRelatorioClienteProdutoFaturado,
                   TfrmRelatorioEvolucaoPrecos, TfrmRequisicoesOSP,
                   TfrmImprimirPNs, Tfrmmotivosparadas,
                   TfrmRelatorioComposicaoPN, TfrmCustoporPN,
                   TfrmAnaliseFalhasMaquinasSetores, TfrmAnaliseParadasMaquinasSetores,
                   TfrmFCI, TfrmOperacoesPorcelana]);
end.
