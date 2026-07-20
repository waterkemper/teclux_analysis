unit fmrelatorioestoque;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, ExtCtrls, Buttons, StdCtrls, cpdata, DBCtrls,
  cpdbtext, Mask, cpdbfindcontrols, CheckLst, ComCtrls, cppagecontrol,
  cpnumero, Windows,
  // Repositorio
  fmajudabt, fmconsultaporcampo, fmconsultabasica,
  // Terceiros
  ZQuery,
  // Constantes
  ctconstantes, biblio, cpeditioncontrolvalidation, cptexto, ToolWin, clparametrossistema,
  cpdbradiogroup, frselecaoaleatoriagruposfornecedores, frconsulta,
  frconsultacodigo, frselecaoaleatoriaclientes, frmultiplaselecaoaleatoria;

type
  TfrmRelatorioEstoque = class(TFrmRelatorioPadrao)
    pgcFilialGrupoFilial: TtecPageControl;
    tstFilial: TTabSheet;
    sbnMarcarFiliais: TSpeedButton;
    sbnDesmarcarFiliais: TSpeedButton;
    clbFiliais: TCheckListBox;
    tstGrupoFilial: TTabSheet;
    sbnmarcarGrupodeFiliais: TSpeedButton;
    sbnDesmarcarGrupodeFiliais: TSpeedButton;
    clbGrupodeFiliais: TCheckListBox;
    gbxData: TGroupBox;
    edtData: TEditData;
    gbxAgrupamento: TGroupBox;
    ckbAgruparGrupoFilial: TCheckBox;
    ckbAgruparFilial: TCheckBox;
    ckbAgruparClasseProduto: TCheckBox;
    ckbAgruparGrupoProduto: TCheckBox;
    ckbAgruparProduto: TCheckBox;
    rgpResumo: TRadioGroup;
    gbxOpcoes: TGroupBox;
    ckbValorFinanceiro: TCheckBox;
    ckbComQuantidades: TCheckBox;
    ckbSemEstoqueZero: TCheckBox;
    ckbProdSimples: TCheckBox;
    ckbProdComposto: TCheckBox;
    ckbPrecoComIcms: TCheckBox;
    gbxQuantidades: TGroupBox;
    lblEmEstoque: TLabel;
    lblReservado: TLabel;
    lblEmTransito: TLabel;
    lblDemonstracao: TLabel;
    lblConserto: TLabel;
    lblFuturo: TLabel;
    lblAvariado: TLabel;
    lblPedido: TLabel;
    edtEmEstoque_Inicial: TEditNumero;
    edtReservado_Inicial: TEditNumero;
    edtEmTransito_Inicial: TEditNumero;
    edtEmDemonstracao_Inicial: TEditNumero;
    edtConserto_Inicial: TEditNumero;
    edtFuturo_Inicial: TEditNumero;
    edtAvariado_Inicial: TEditNumero;
    edtPedido_Inicial: TEditNumero;
    lblEmEstoque_a: TLabel;
    lblReservado_a: TLabel;
    lblEmTransito_a: TLabel;
    lblDemonstracao_a: TLabel;
    lblConserto_a: TLabel;
    lblFuturo_a: TLabel;
    lblAvariado_a: TLabel;
    lblLocacao_a: TLabel;
    edtEmEstoque_Final: TEditNumero;
    edtReservado_Final: TEditNumero;
    edtEmTransito_Final: TEditNumero;
    edtEmDemonstracao_Final: TEditNumero;
    edtConserto_Final: TEditNumero;
    edtFuturo_Final: TEditNumero;
    edtAvariado_Final: TEditNumero;
    edtPedido_Final: TEditNumero;
    Bevel1: TBevel;
    gbxProdutos: TGroupBox;
    ckbProdutoEmLinha: TCheckBox;
    ckbProdutoForadeLinha: TCheckBox;
    ckbProdutoComMontagem: TCheckBox;
    ckbProdutoSemMontagem: TCheckBox;
    ckbProdutoNaoBrinde: TCheckBox;
    ckbProdutoBrinde: TCheckBox;
    ecvValida: TtecEditionControlValidation;
    edtNDiasNaoVendidos: TEditNumero;
    lblNaoVendidoHa: TLabel;
    ckbAgruparFornecedor: TCheckBox;
    ckbPrecodeVenda: TCheckBox;
    ckbPrecoSemIcms: TCheckBox;
    gbxGrupos: TGroupBox;
    sbnMarcarColunas: TSpeedButton;
    sbnDesmarcarColunas: TSpeedButton;
    clbColunas: TCheckListBox;
    ckbProdutoInativo: TCheckBox;
    ckbProdutoAtivo: TCheckBox;
    ckbAgruparLocalizacao: TCheckBox;
    ckbCodigodeBarras: TCheckBox;
    ckbAcabadosouSemiAcabados: TCheckBox;
    ckbRelatorioemGrades: TCheckBox;
    ckbGradecomElementos: TCheckBox;
    rgpOrdenacao: TtecDBRadioGroup;
    rbnOdenacaoCodigoProduto: TtecRadioButton;
    rbnOdenacaoDescricaoProduto: TtecRadioButton;
    rbnOdenacaoFilial: TtecRadioButton;
    rbnOdenacaoLocalizacao: TtecRadioButton;
    rbnOdenacaoUltimaVenda: TtecRadioButton;
    ckbDisponivelnoSite: TCheckBox;
    ckbNaoDisponivelnoSite: TCheckBox;
    gbxCompostos: TGroupBox;
    cbbCompostos: TComboBox;
    fraSelecaoAleatoriagruposfornecedores1: TfraSelecaoAleatoriagruposfornecedores;
    lblREservaPrevia: TLabel;
    edtReservaPrevia_Inicial: TEditNumero;
    lblReservaPrevia_a: TLabel;
    edtReservaPrevia_Final: TEditNumero;
    pgcMultiplasSelecoes: TPageControl;
    tstMultiplasSelecoesProdutos: TTabSheet;
    fraMultiplaSelecaoAleatoriaProdutos: TfraMultiplaSelecaoAleatoria;
    tstMultiplasSelecoesFornecedores: TTabSheet;
    fraSelecaoAleatoriaFornecedores: TfraSelecaoAleatoriaClientes;
    tstGruposdeFornecedores: TTabSheet;
    gbxLocalizacao: TGroupBox;
    edtLocalizacao: TEditTexto;
    ckbInverterLinhaColuna: TCheckBox;
    ckbSomenteResumoporColuna: TCheckBox;
    procedure clbFiliaisClickCheck(Sender: TObject);
    procedure sbnMarcarFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarFiliaisClick(Sender: TObject);
    procedure clbGrupodeFiliaisClickCheck(Sender: TObject);
    procedure sbnmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure ckbProdSimplesClick(Sender: TObject);
    procedure ckbProdCompostoClick(Sender: TObject);
    procedure ckbValorFinanceiroClick(Sender: TObject);
    procedure ckbPrecodeVendaClick(Sender: TObject);
    procedure ckbPrecoComIcmsClick(Sender: TObject);
    procedure ckbPrecoSemIcmsClick(Sender: TObject);
    procedure sbnMarcarColunasClick(Sender: TObject);
    procedure sbnDesmarcarColunasClick(Sender: TObject);
    procedure ckbProdutoAtivoClick(Sender: TObject);
    procedure ckbProdutoInativoClick(Sender: TObject);
    procedure ckbAcabadosouSemiAcabadosClick(Sender: TObject);
    procedure ckbRelatorioemGradesClick(Sender: TObject);
    procedure ckbDisponivelnoSiteClick(Sender: TObject);
    procedure ckbNaoDisponivelnoSiteClick(Sender: TObject);
  private
    { Private declarations }
    procedure ObterLista(Origem: TStrings; Destino: TCheckListBox);

  protected
    procedure InternoImpressao; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function SomenteFisico:Boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmRelatorioEstoque: TfrmRelatorioEstoque;
  TipoPesquisa: TTecPesquisa;
  ControleValido : TWinControl;

implementation
{$R *.dfm}
uses dmrelatorioestoque;

{ TfrmRelatorioEstoque }

constructor TfrmRelatorioEstoque.Create(AOwner: TComponent);
begin
  dtmRelatorioEstoque := TdtmRelatorioEstoque.Create(Self);
  inherited;
  edtData.Text := DateToStr(DataLocal);
  pgcFilialGrupoFilial.ActivePage := tstFilial;
  ObterLista(dtmRelatorioEstoque.ListaFiliais, clbFiliais);
  ObterLista(dtmRelatorioEstoque.ListaGruposFiliais, clbGrupodeFiliais);
  MarcarLista(clbColunas,True);
  clbColunas.Checked[7]:=False;
  ckbAcabadosouSemiAcabados.visible := parsistema.controlesvoltadosparaindustria;

  {
  if ParSistema.PermitirProdutoAlfanumerico then
  begin
     edfItemProdutoInicial.DataField      := 'codigovisual';
     edfItemProdutoInicial.QueryParameter := 'codigovisual';

     edfItemProdutoFinal.DataField      := 'codigovisual';
     edfItemProdutoFinal.QueryParameter := 'codigovisual';

     edfProdutoInicial.DataField      := 'codigovisual';
     edfProdutoInicial.QueryParameter := 'codigovisual';

     edfProdutoFinal.DataField      := 'codigovisual';
     edfProdutoFinal.QueryParameter := 'codigovisual';
  end
  else
  begin
     edfItemProdutoInicial.DataField      := 'codigo';
     edfItemProdutoInicial.QueryParameter := 'codigo';

     edfItemProdutoFinal.DataField      := 'codigo';
     edfItemProdutoFinal.QueryParameter := 'codigo';

     edfProdutoInicial.DataField     := 'codigo';
     edfProdutoInicial.QueryParameter := 'codigo';

     edfProdutoFinal.DataField      := 'codigo';
     edfProdutoFinal.QueryParameter := 'codigo';

  end;
  }

  fraSelecaoAleatoriaFornecedores.fraSelecaoAleatoriaCliente.ConsultaSelecaoAleatoria.qryProcuraCliente.ParamByName('NaoConsiderarTipoCliente').asBoolean := false;
  fraSelecaoAleatoriaFornecedores.fraSelecaoAleatoriaCliente.ConsultaSelecaoAleatoria.TipoPesquisa := pesFORNECEDORES;
  fraSelecaoAleatoriaFornecedores.fraSelecaoAleatoriaCliente.ConsultaSelecaoAleatoria.TipoCliente := 'F';
  fraSelecaoAleatoriaFornecedores.fraSelecaoAleatoriaCliente.ConsultaSelecaoAleatoria.Tipovfornecedor := 'F';

  fraMultiplaSelecaoAleatoriaProdutos.tstSelecaoAleatoriamodelosProduto.TabVisible := false;
//  fraMultiplaSelecaoAleatoriaProdutos.tstSelecaoAleatoriaPromocoes.TabVisible := false;
  fraMultiplaSelecaoAleatoriaProdutos.tstCST.TabVisible := false;
  fraMultiplaSelecaoAleatoriaProdutos.tstCSOSN.TabVisible := false;
  fraMultiplaSelecaoAleatoriaProdutos.tstListaPadronizada.TabVisible := false;

  //ckbRelatorioemGrades.Checked := parsistema.UsarGradesProdutos;

end;

destructor TfrmRelatorioEstoque.Destroy;
begin
  dtmRelatorioEstoque:=nil;
  inherited;
  frmRelatorioEstoque := nil;
end;



procedure TfrmRelatorioEstoque.ObterLista(Origem: TStrings; Destino: TCheckListBox);
begin
  Destino.Items.AddStrings(Origem);
end;


procedure TfrmRelatorioEstoque.clbFiliaisClickCheck(Sender: TObject);
begin
  inherited;
   MarcarLista(clbGrupodeFiliais, False);

end;

procedure TfrmRelatorioEstoque.sbnMarcarFiliaisClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais, True);
  MarcarLista(clbGrupodeFiliais, False);

end;

procedure TfrmRelatorioEstoque.sbnDesmarcarFiliaisClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais, False);

end;

procedure TfrmRelatorioEstoque.clbGrupodeFiliaisClickCheck(
  Sender: TObject);
begin
  inherited;
   MarcarLista(clbFiliais, False);

end;

procedure TfrmRelatorioEstoque.sbnmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais, True);
  MarcarLista(clbFiliais, False);

end;

procedure TfrmRelatorioEstoque.sbnDesmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais, False);
end;

procedure TfrmRelatorioEstoque.InternoImpressao;
begin
  inherited;
    with dtmRelatorioEstoque do
    begin
     DataSituacao := edtData.Text;
     ParametroCabecalho := '';
     SomenteEstoqueFisico:=SomenteFisico;

     ProdutoEmLinha     := ckbProdutoEmLinha.checked;
     ProdutoForadeLinha := ckbProdutoForadeLinha.checked;
     ProdutoAtivo       := ckbProdutoAtivo.checked;
     ProdutoInativo     := ckbProdutoInativo.checked;
     ProdutoComMontagem := ckbProdutoComMontagem.Checked;
     ProdutoSemMontagem := ckbProdutoSemMontagem.Checked;
     ProdutoBrinde      := ckbProdutoBrinde.Checked;
     ProdutoNaoBrinde   := ckbProdutoNaoBrinde.Checked;
     DisponivelnoSite := ckbDisponivelnoSite.checked;
     NaoDisponivelnoSite := ckbNaoDisponivelnoSite.checked;


     MontarFiltroFiliais(clbFiliais);
     MontarFiltroGrupoFiliais(clbGrupodeFiliais);

     ParametroFornecedor := fraSelecaoAleatoriaFornecedores.fraSelecaoAleatoriaCliente.ListaCondicional;
     ListaGruposFornecedores := fraSelecaoAleatoriagruposfornecedores1.fraSelecaoAleatoriaGruposFornecedores.ListaCondicional;

     ParametroLocalizacao:= edtLocalizacao.Text ;
     ParametroTituloLocalizacao := edtLocalizacao.Text ;
     ImpressaoemGrade := ckbRelatorioemGrades.Checked;
     InverterLinhaColuna := ckbInverterLinhaColuna.Checked;
//     ResumoPorGrupo := ckbResumoPorGrupo.checked;
     GradecomElementos := ckbGradecomElementos.checked;


     emEstoque_Inicial     := Trocar(edtEmEstoque_Inicial.     ValorSemFormatacao, ',', '.');
     emEstoque_Final       := Trocar(edtEmEstoque_Final.       ValorSemFormatacao, ',', '.');
     Reservado_Inicial     := Trocar(edtReservado_Inicial.     ValorSemFormatacao, ',', '.');
     Reservado_Final       := Trocar(edtReservado_Final.       ValorSemFormatacao, ',', '.');

     ReservaPrevia_Inicial     := Trocar(edtReservaPrevia_Inicial.     ValorSemFormatacao, ',', '.');
     ReservaPrevia_Final       := Trocar(edtReservaPrevia_Final.       ValorSemFormatacao, ',', '.');

     emTransito_Inicial    := Trocar(edtEmTransito_Inicial.    ValorSemFormatacao, ',', '.');
     emTransito_Final      := Trocar(edtEmTransito_Final.      ValorSemFormatacao, ',', '.');
     emDemonstracao_Inicial:= Trocar(edtEmDemonstracao_Inicial.ValorSemFormatacao, ',', '.');
     emDemonstracao_Final  := Trocar(edtEmDemonstracao_Final.  ValorSemFormatacao, ',', '.');
     emConserto_Inicial    := Trocar(edtConserto_Inicial.      ValorSemFormatacao, ',', '.');
     emConserto_Final      := Trocar(edtConserto_Final.        ValorSemFormatacao, ',', '.');
     Futuro_Inicial        := Trocar(edtFuturo_Inicial.        ValorSemFormatacao, ',', '.');
     Futuro_Final          := Trocar(edtFuturo_Final.          ValorSemFormatacao, ',', '.');
     Avariado_Inicial      := Trocar(edtAvariado_Inicial.      ValorSemFormatacao, ',', '.');
     Avariado_Final        := Trocar(edtAvariado_Final.        ValorSemFormatacao, ',', '.');
     Pedido_Inicial        := Trocar(edtPedido_Inicial.        ValorSemFormatacao, ',', '.');
     Pedido_Final          := Trocar(edtPedido_Final.          ValorSemFormatacao, ',', '.');

//     ParametroSelecaoProdutos := rgpSelecaoProduto.ItemIndex;
     AgruparGrupoFilial:=ckbAgruparGrupoFilial.Checked;
     AgruparFilial:=ckbAgruparFilial.Checked;
     AgruparFornecedor := ckbAgruparFornecedor.Checked;
     AgruparLocalizacao:= ckbAgruparLocalizacao.Checked;
     AgruparClasseProduto:=ckbAgruparClasseProduto.Checked;
     AgruparGrupoProduto:=ckbAgruparGrupoProduto.Checked;
     AgruparProduto:=ckbAgruparProduto.Checked;
     ParametroOrdenacao:=rgpOrdenacao.ItemIndex;
     SemEstoqueZero := ckbSemEstoqueZero.Checked;
     NaoVendidosHaNDias := edtNDiasNaoVendidos.ValorSemFormatacao;
     Resumo := rgpResumo.ItemIndex;
     DefineOrdenacao ;

     ComValorFinanceiro := ckbValorFinanceiro.Checked;
     ComPrecodeVenda:= ckbPrecodeVenda.Checked;
     ComQuantidades := ckbComQuantidades.Checked;
     PrecoComICMS := ckbPrecoComIcms.Checked;
     PrecoSemICMS := ckbPrecoSemIcms.Checked;
     ComCodigodeBarras := ckbCodigodeBarras.Checked;
     AcabadosSemiAcabados := ckbAcabadosouSemiAcabados.Checked;
     Compostos := cbbCompostos.itemIndex;

     SomenteResumoporColuna := ckbSomenteResumoporColuna.checked;

     //MontarFiltroColunas(clbColunas);
     AbreConsultaEstoques(

      fraMultiplaSelecaoAleatoriAProdutos.fraSelecaoAleatoriaItemdeProdutos.ListaCondicional,
      fraMultiplaSelecaoAleatoriAProdutos.fraSelecaoAleatoriaprodutos.ListaCondicional,
      fraMultiplaSelecaoAleatoriAProdutos.fraSelecaoaleatoriagruposprodutos.ListaCondicional,
      fraMultiplaSelecaoAleatoriAProdutos.fraSelecaoaleatoriaclassesprodutos.ListaCondicional,
      fraMultiplaSelecaoAleatoriAProdutos.fraSelecaoAleatoriamarcasProdutos.ListaCondicional,
      fraMultiplaSelecaoAleatoriAProdutos.fraSelecaoaleatoriamarketplace1.ListaCondicional,
      fraMultiplaSelecaoAleatoriAProdutos.fraSelecaoaleatoriaPromocoes.ListaCondicional

     );


     ImprimirRelatorio;
    end;
end;

procedure TfrmRelatorioEstoque.ckbProdSimplesClick(Sender: TObject);
begin
  inherited;
  if ckbProdSimples.Checked then
   ckbProdComposto.Checked := false;
end;

procedure TfrmRelatorioEstoque.ckbProdCompostoClick(Sender: TObject);
begin
  inherited;
  if ckbProdComposto.Checked then
   ckbProdSimples.Checked := false;
end;

procedure TfrmRelatorioEstoque.ckbValorFinanceiroClick(Sender: TObject);
begin
  inherited;
  if ckbValorFinanceiro.Checked then
    ckbPrecodeVenda.Checked := false;

  rgpResumo.Enabled := ckbValorFinanceiro.Checked;

  if not (ckbPrecodeVenda.Checked  or ckbValorFinanceiro.Checked) then
  begin
    ckbPrecoComIcms.Enabled := false;
    ckbPrecoSemIcms.Enabled := false;
  end
  else
  begin
    ckbPrecoComIcms.Enabled := true;
    ckbPrecoSemIcms.Enabled := true;
  end;

  if not ckbValorFinanceiro.Checked then
  begin
    ckbCodigodeBarras.Enabled := false;
    ckbAcabadosouSemiAcabados.Checked := false;
  end
  else
    ckbCodigodeBarras.Enabled := true;
end;

procedure TfrmRelatorioEstoque.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
//  if key = VK_Escape then
//    dtmRelatorioEstoque.CancelarRelatorio;
end;

procedure TfrmRelatorioEstoque.ckbPrecodeVendaClick(Sender: TObject);
begin
  inherited;
  if ckbPrecodeVenda.Checked then
  begin
    ckbValorFinanceiro.Checked:= false;
    ckbAcabadosouSemiAcabados.Checked:= false;
    ckbCodigodeBarras.Checked:= false;
  end;

  rgpResumo.Enabled := ckbPrecodeVenda.Checked;
  clbColunas.Enabled:=ckbPrecodeVenda.Checked;
  if not (ckbPrecodeVenda.Checked  or ckbValorFinanceiro.Checked) then
  begin
    ckbPrecoComIcms.Enabled := false;
    ckbPrecoSemIcms.Enabled := false;
  end
  else
  begin
    ckbPrecoComIcms.Enabled := true;
    ckbPrecoSemIcms.Enabled := true;
  end;
end;

procedure TfrmRelatorioEstoque.ckbPrecoComIcmsClick(Sender: TObject);
begin
  inherited;
  ckbPrecoSemIcms.Checked:=False;
end;

procedure TfrmRelatorioEstoque.ckbPrecoSemIcmsClick(Sender: TObject);
begin
  inherited;
  ckbPrecoComIcms.Checked := False;
end;

procedure TfrmRelatorioEstoque.sbnMarcarColunasClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbColunas,True);
end;

procedure TfrmRelatorioEstoque.sbnDesmarcarColunasClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbColunas,False);
end;

function TfrmRelatorioEstoque.SomenteFisico: Boolean;
var
I: integer;
ret: boolean;
begin
   ret:=clbColunas.Checked[7];
   for i:=0 to clbColunas.Items.Count do
   begin
     if (i < 7) and (clbColunas.Checked[i]) then
       ret:=false;
   end;
   result:=ret;
end;

procedure TfrmRelatorioEstoque.ckbProdutoAtivoClick(Sender: TObject);
begin
  inherited;
  if not ckbProdutoInativo.Checked and
     not ckbProdutoAtivo.Checked then
     ckbProdutoInAtivo.Checked := True;
end;

procedure TfrmRelatorioEstoque.ckbProdutoInativoClick(Sender: TObject);
begin
  inherited;
  if not ckbProdutoInativo.Checked and
     not ckbProdutoAtivo.Checked then
     ckbProdutoAtivo.Checked := True;
end;

procedure TfrmRelatorioEstoque.ckbAcabadosouSemiAcabadosClick(
  Sender: TObject);
begin
  inherited;
  if ckbAcabadosouSemiAcabados.checked and not ckbValorFinanceiro.checked then
    ckbValorFinanceiro.checked := true;

end;

procedure TfrmRelatorioEstoque.ckbRelatorioemGradesClick(Sender: TObject);
begin
  inherited;
  ckbGradecomElementos.Enabled := ckbRelatorioemGrades.Checked;

  if ckbRelatorioemGrades.Checked then
  begin
//    rgpResumo.ItemIndex := 1;
//    rgpresumo.Enabled := false;
    ckbValorFinanceiro.Enabled := false;
    ckbPrecodeVenda.Enabled := false;
    ckbPrecoComIcms.Enabled := false;
    ckbPrecoSemIcms.Enabled := false;
    ckbCodigodeBarras.Enabled := false;

    ckbAgruparGrupoFilial.Checked := False;
    ckbAgruparFilial.Checked := False;
    ckbAgruparFornecedor.Checked := False;
    ckbAgruparLocalizacao.Checked := False;
    ckbAgruparClasseProduto.Checked := False;
    ckbAgruparGrupoProduto.Checked := true;
    ckbAgruparProduto.Checked := False;

    ckbAgruparGrupoFilial.enabled := False;
    ckbAgruparFilial.enabled := False;
    ckbAgruparFornecedor.enabled := False;
    ckbAgruparLocalizacao.enabled := False;
    ckbAgruparClasseProduto.enabled := False;
    ckbAgruparGrupoProduto.enabled := False;
    ckbAgruparProduto.enabled := False;

    ckbSomenteResumoporColuna.visible := True;


  end
  else
  begin
//    rgpresumo.Enabled := True;
    ckbValorFinanceiro.Enabled := True;
    ckbPrecodeVenda.Enabled := True;
    ckbPrecoComIcms.Enabled := True;
    ckbPrecoSemIcms.Enabled := True;
    ckbCodigodeBarras.Enabled := True;

    ckbAgruparGrupoFilial.enabled := true;
    ckbAgruparFilial.enabled := true;
    ckbAgruparFornecedor.enabled := true;
    ckbAgruparLocalizacao.enabled := true;
    ckbAgruparClasseProduto.enabled := true;
    ckbAgruparGrupoProduto.enabled := true;
    ckbAgruparProduto.enabled := true;

    ckbSomenteResumoporColuna.visible := False;

  end;


end;

procedure TfrmRelatorioEstoque.ckbDisponivelnoSiteClick(Sender: TObject);
begin
  inherited;
  if not ckbNaoDisponivelnoSite.Checked and
     not ckbDisponivelnoSite.Checked then
     ckbNaoDisponivelnoSite.Checked := True;

end;

procedure TfrmRelatorioEstoque.ckbNaoDisponivelnoSiteClick(
  Sender: TObject);
begin
  inherited;
  if not ckbNaoDisponivelnoSite.Checked and
     not ckbDisponivelnoSite.Checked then
     ckbDisponivelnoSite.Checked := True;

end;


end.
