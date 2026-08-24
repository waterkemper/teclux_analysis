unit rgadminsistema;

interface

implementation

Uses
  //CLX
  classes,
  //Projeto
  fmcadastrobancos, fmcadastroenderecos, fmcadastroeventos,
  fmcadastrocategorias, fmcadastrofiliais, fmcadastrogrupofiliais,
  fmcadastrogruposusuarios, fmcadastrohistoricos, fmcadastroplanospagamentos,
  fmcadastrotabelascrediario, fmcadastrousuarios, fmconversaocidades,
  fmconversaoruas, fmparametrossistema, fmcomissaocobradores,
  fmcomissaovendedores, fmcomissaovendedorespagtoparcelas, fmcadastroagencias, fmcadastrologotipos,
  fmcadastroequipamentos, fmcadastroservicos, fmcadastrosetoresusuarios,
  fmcadastroagentestiposcartas, fmcadastroconceitostiposcartas,
  fmmanutencaoacessos, fmconfiguracaosistema, fmcadastrocomissoesusuariosgrupos,
  fmcadastrocomissoesusuariosclasses, fmparametroscredito, fmmemoriacredito,
  fmcadastrousuariosfiliais,fmlogprodutos, fmexportacaodados, fmncm,
  fmMonitoraBancoDados, fmquestionarios, fmManutencaoObservacoesVenda,
  fmImpostos;

initialization
  RegisterClasses([TfrmCadastroBancos, TfrmCadastroEnderecos,
                   TfrmCadastroEventos, TfrmCadastroCategorias, TfrmCadastroFiliais,
                   TfrmCadastroGrupoFiliais,
                   TfrmCadastroGruposUsuarios, TfrmCadastroHistoricos,
                   TfrmCadastroPlanosPagamentos, TfrmCadastroTabelasCrediario,
                   TfrmCadastroUsuarios, TfrmConversaoCidades,
                   TfrmConversaoRuas, TfrmParametrosSistema, TfrmComissaoCobradores,
                   TfrmComissaoVendedores, Tfrmcomissaovendedorespagtoparcelas,
                   TfrmCadastroAgencias, TfrmCadastroLogotipos,
                   TfrmCadastroEquipamentos, TfrmCadastroServicos, TfrmCadastroSetoresUsuarios,
                   TfrmCadastroAgentesTiposCartas, TfrmCadastroConceitosTiposCartas,
                   TfrmManutencaoAcessos, TfrmConfiguracoesSistema,
                   TfrmCadastroComissoesUsuariosGrupos,
                   TfrmCadastroComissoesUsuariosClasses, TfrmParametrosCredito,
                   TfrmMemoriaCredito, TfrmCadastroUsuariosFiliais,TfrmLogProdutos,
                   TfrmExportacaoDados, Tfrmncm,
                   TfrmMonitoraBancoDados, TfrmQuestionarios,
                   TfrmManutencaoObservacoesVenda,
                   TfrmImpostos]);
end.
