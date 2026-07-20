
unit rglivrosfiscais;

interface

implementation

Uses
  //CLX
  classes,
  //Projeto
  fmcadastrocodigosfiscais, fmcadastrotabelasgia, fmquadrosgia, fmgerargiaemarquivo,
  fmlivroentradamercadorias, fmlivrosaidamercadorias, fmcadastroatividadeseconomicas,
  fmlivroapuracaoicms, fmlivroapuracaoiss, fmlivroauxiliarimpostosretidos, fmcadastrocodigosfiscaisservicos,
  fmlivrodiarioauxiliarreceitas, fmdiarioauxiliarparcelas,
  fmrelatorioinventario, fmquadrosdime, 
  fmgerardimeemarquivo, fmgerarsintegraemarquivo,
  fmdiarioauxiliarfornecedores, fmcadastroservicoslcp116, fmefd, fmecd, fmecf, fmfcont,
  fmcadastrodebens,fmdipj_ipi, fmepc, fmlivroapuracaopiscofins, fmMapaResumoECF, fmLancamentosDepreciacao,
  fmRelatorioDepreciacao, fmprocessosjudiciaisreinf;

initialization
  RegisterClasses([TfrmCadastroCodigosFiscais, TfrmCadastroTabelasGIA, TfrmQuadrosGIA, TfrmGerarGIAEmArquivo,
                   TfrmLivroEntradaMercadorias, TfrmLivroSaidaMercadorias, TfrmCadastroCodigosFiscaisServicos,
                   TfrmCadastroAtividadesEconomicas, TfrmLivroApuracaoIcms, TfrmLivroApuracaoISS,
                   TfrmLivroAuxiliarImpostosRetidos,
                   TfrmLivroDiarioAuxiliarReceitas, TfrmDiarioAuxiliarParcelas,
                   TfrmRelatorioInventario, TfrmQuadrosDIME,
                   TfrmGerarDIMEEmArquivo, TfrmGerarSintegraEmArquivo,
                   TfrmDiarioAuxiliarFornecedores, TfrmCadastroServicosLCP116,
                   TfrmEFD, TfrmECD, TfrmECF, TfrmFCont, TfrmCadastrodeBens, TfrmDIPJ_IPI, TfrmEPC,
                   TfrmLivroApuracaoPisCofins, TfrmMapaResumoECF, TfrmLancamentosDepreciacao,
                   TfrmRelatorioDepreciacao, TfrmProcessosJudiciaisReinf])
end.