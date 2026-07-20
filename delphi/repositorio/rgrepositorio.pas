unit rgrepositorio;

interface

Uses
  //CLX
  Forms, classes;

implementation

Uses
  //Pojeto
  dmbasico, dmconsultaenderecos, dmtecsoft, fmajuda, fmajudabt,
  fmcadastropadrao, fmcadastropadraonavegacao, fmconsultabasica,
  fmconsultaporcampo, fmlogin, fmnavcontroles, {fmparametroselecaobasica,}
  fmprincipalbasico, fmtrocasenha, frcgcoucpf, frcomissao, frdadoscliente,
  frendereco, frenderecoeditor, frfoneramal, frintervalodata, frtelefone,
  fmlerdata, fmprogresso, fmrelatoriopadrao, dmsenhaautorizacao,
  fmsenhaautorizacao, fmlerdatanumero, fmsplash, fmhelpviewer,
  dmimprimefiscal, fmpreviewpadrao, dmimprimenotaentrada,
  dmimprimetermos, dmimprimeboleto, dmimprimecontratosimoveis,
  dmimprimeordemservicos, fmrenovarsenha, fmleituramemoriafiscaldata,
  fmleituramemoriafiscalreducao, fmimpressaocontratoimoveis,
  fmfichafinanceira, fmestornorecebimentos , fmquitacaolote,
  fmrelatoriofluxodecaixa, fmConferenciaProdutos, fmconsultavendas,
  fmConsultaProdutosNotasSefaz, fmconsultacompras,
  fmrequisicaoexposicao, fmcadastropedidos,
  fmmanutencaopreco,
  fmcadastrofornecedores;

initialization
  RegisterClasses([TdtmBasico, TdtmConsultaEnderecos, Tdtmtecsoft, Tdtmimprimecontratosimoveis,
                   Tfrmajuda, Tfrmajudabt, Tfrmcadastropadrao, TfrmCadastroPadraoNav,
                   Tfrmconsultabasica, Tfrmconsultaporcampo, Tfrmlogin,
                   Tfrmnavcontroles,  Tfrmprincipalbasico,
                   Tfrmtrocasenha, Tfracgcoucpf, Tfracomissao, Tfradadoscliente,
                   Tfraendereco, Tfraenderecoeditor, Tfrafoneramal, Tfraintervalodata,
                   Tfratelefone, Tfrmlerdata, Tfrmprogresso, Tfrmrelatoriopadrao,
                   Tdtmsenhaautorizacao, Tfrmsenhaautorizacao, Tfrmlerdatanumero,
                   TfrmSplash, TfrmHelpForm, TdtmImprimeFiscal, TdtmImprimeNotaEntrada,
                   TdtmImprimeTermos, Tfrmpreviewpadrao, TdtmImprimeOrdemServicos,
                   TfrmRenovarSenha, TfrmLeituraMemoriaFiscalData, TfrmLeituraMemoriaFiscalReducao,
                   Tfrmimpressaocontratoimoveis, TfrmFichaFinanceira,
                   Tfrmestornorecebimentos , Tfrmquitacaolote, Tfrmrelatoriofluxodecaixa,
                   TfrmConferenciaProdutos, TfrmConsultaVendas,
                   TfrmConsultaProdutosNotasSefaz, TfrmconsultaCompras,
                   Tfrmrequisicaoexposicao,
                   Tfrmcadastropedidos,
                   TfrmManutencaoPreco,
                   Tfrmcadastrofornecedores]);
end.
