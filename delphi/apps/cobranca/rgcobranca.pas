unit rgcobranca;

interface

implementation

Uses
  //CLX
  classes,
  //Projeto
  fmdevolucaonumerario, fmfichacobranca, fmrenegociacao,
  fmaviso, fmspc, fmprestacoesabertas, fmlerdadosopcaoavisos, fmdefinircobrador,
  fmrelatoriorecebimentosporcobrador, fmgerarremessas, fmlerretornos,
  fmimprimirduplicatas {$IFDEF MSWINDOWS},fmgerarremessassoacred{$ENDIF};


initialization
  RegisterClasses([TfrmDevolucaoNumerario, TfrmRenegociacao, TfrmFichaCobranca,
                   TfrmAviso, TfrmSPC, TfrmPrestacoesAbertas,
                   TfrmLerDadosOpcaoAvisos, TfrmDefinirCobrador,
                   TfrmRelatorioRecebimentosPorCobrador, TfrmGerarRemessas,
                   TfrmLerRetornos, Tfrmimprimirduplicatas
		  {$IFDEF MSWINDOWS},TfrmGerarRemessasSoacred{$ENDIF}]);
end.
