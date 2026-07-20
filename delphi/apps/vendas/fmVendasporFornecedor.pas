unit fmvendasporfornecedor;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, Mask, DBCtrls, Windows,
  ComCtrls,
  // Repositorio
  fmajudabt, fmconsultaporcampo, fmconsultabasica, clparametrossistema,
  // Constantes
  ctconstantes, biblio,
  // Terceiros
  ZQuery,
  // Componenetes
  cpnumero, cptexto, cpdbfindcontrols, cpdbgrid, cpdbtext, cpdata, cppagecontrol,
  cpeditioncontrolvalidation, CheckLst, DB, ZPgSqlQuery, cpquery,
  ToolWin, DateUtils, fmVisualizarImageURL,
  frselecaoaleatoriagruposfornecedores, fmprincipalbasico, dmVendasporFornecedor,
  frconsulta, frconsultacodigo, frmultiplaselecaoaleatoria, frselecaoaleatoria,
  frselecaoaleatoriaclientes;

type
  TfrmVendasporFornecedor = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    sbnGerar: TSpeedButton;
    sbnRelatorio: TSpeedButton;
    tstParametros: TTabSheet;
    pgcFilialGrupoFilial: TtecPageControl;
    tstFilial: TTabSheet;
    sbnMarcarFiliais: TSpeedButton;
    sbnDesmarcarFiliais: TSpeedButton;
    clbFiliais: TCheckListBox;
    tstGrupoFilial: TTabSheet;
    sbnmarcarGrupodeFiliais: TSpeedButton;
    sbnDesmarcarGrupodeFiliais: TSpeedButton;
    clbGrupodeFiliais: TCheckListBox;
    gbxPeriodo: TGroupBox;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    gbxProdutos: TGroupBox;
    ckbProdutoEmLinha: TCheckBox;
    ckbProdutoForadeLinha: TCheckBox;
    ckbProdutoComMontagem: TCheckBox;
    ckbProdutoSemMontagem: TCheckBox;
    ckbProdutoNaoBrinde: TCheckBox;
    ckbProdutoBrinde: TCheckBox;
    pgcConsulta: TPageControl;
    ckbProdutoAtivo: TCheckBox;
    ckbProdutoInativo: TCheckBox;
    rgpOrdenacao: TRadioGroup;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    gbxCurvaABC: TGroupBox;
    ckbCurvaABC_A: TCheckBox;
    ckbCurvaABC_C: TCheckBox;
    ckbCurvaABC_B: TCheckBox;
    ckbCurvaABC_NaoDefinido: TCheckBox;
    gbxReducaoTabelaCompras: TGroupBox;
    dbgReducaoTabelaCompras: TtecDBGrid;
    pnlReducaoTabelaCompras: TPanel;
    sbnExcluirReducaoTabelaCompras: TSpeedButton;
    sbnIncluirReducaoTabelaCompras: TSpeedButton;
    fraSelecaoAleatoriagruposfornecedores1: TfraSelecaoAleatoriagruposfornecedores;
    gbxGrupoFornecedores: TGroupBox;
    Timer1: TTimer;
    fraMultiplaSelecaoAleatoria: TfraMultiplaSelecaoAleatoria;
    PageScroller1: TPanel;
    ckbComposto: TCheckBox;
    ckbNaoComposto: TCheckBox;
    gbxFornecedores: TGroupBox;
    tstConsulta: TTabSheet;
    dbgFornecedores: TtecDBGrid;
    dbgProdutos: TtecDBGrid;
    fraSelecaoAleatoriaFornecedores: TfraSelecaoAleatoriaClientes;
    gbxEstoque: TGroupBox;
    ckbemEstoque: TCheckBox;
    ckbReservado: TCheckBox;
    ckbTransito: TCheckBox;
    ckbDemonstracao: TCheckBox;
    ckbConserto: TCheckBox;
    ckbDanificada: TCheckBox;
    ckbReservaPrevia: TCheckBox;
    tstFiliaisEstoque: TTabSheet;
    clbFiliaisEstoque: TCheckListBox;
    sbnMarcarFiliaisEstqoue: TSpeedButton;
    sbnDesmarcarFiliaisEstoque: TSpeedButton;
    stxA: TStaticText;
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnRelatorioClick(Sender: TObject);
    procedure edtDiasEstoqueKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ckbProdutoEmLinhaClick(Sender: TObject);
    procedure ckbProdutoForadeLinhaClick(Sender: TObject);
    procedure ckbProdutoComMontagemClick(Sender: TObject);
    procedure ckbProdutoSemMontagemClick(Sender: TObject);
    procedure ckbProdutoBrindeClick(Sender: TObject);
    procedure ckbProdutoNaoBrindeClick(Sender: TObject);
    procedure sbnMarcarFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarFiliaisClick(Sender: TObject);
    procedure sbnmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure clbFiliaisClickCheck(Sender: TObject);
    procedure clbGrupodeFiliaisClickCheck(Sender: TObject);
    procedure ckbProdutoAtivoClick(Sender: TObject);
    procedure ckbProdutoInativoClick(Sender: TObject);
    procedure dbgProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnVisualizarFotoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbnMarcarFiliaisEstqoueClick(Sender: TObject);
    procedure sbnDesmarcarFiliaisEstoqueClick(Sender: TObject);
    procedure clbFiliaisEstoqueClickCheck(Sender: TObject);
  private
    procedure ObterLista(Origem: TStrings; Destino: TCheckListBox);

  protected
    dtmVendasporFornecedor: TdtmVendasporFornecedor;
    procedure KeyDown(var Key: Word; Shift: TShiftState);override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function PesquisaHabilitada: Boolean;
    function VerificaCamposConsulta: Boolean;
    procedure LimpaControles;
  end;

var
  frmVendasporFornecedor: TfrmVendasporFornecedor;
  TipoPesquisa: TTecPesquisa;
  ControleValido : TWinControl;
  AcionarTelaVendasporFornecedor: function (Owner: TComponent; ListadeProdutos: TStringList): boolean;

implementation

uses fmcadastropedidos, dmcadastropedidos,
     fmselecionarquantidades, dmbasico,
  fmajuda, frselecaoaleatoriaitemdeprodutos;

{$R *.dfm}



constructor TfrmVendasporFornecedor.Create(AOwner: TComponent);
begin
  inherited;
  dtmVendasporFornecedor := TdtmVendasporFornecedor.Create(self);

  ObterLista(dtmVendasporFornecedor.ListaFiliais, clbFiliais);
  ObterLista(dtmVendasporFornecedor.ListaGruposFiliais, clbGrupodeFiliais);

  ObterLista(dtmVendasporFornecedor.ListaFiliais, clbFiliaisEstoque);

  CarregarConfiguracoesFormulario;

  pgcConsulta.ActivePage := tstParametros;

  edtDataInicial.Text := datetostr((Date() - 90));

  edtDataFinal.Text := datetostr(Date());

//  sbnRelatorio.Enabled := false;

  dbgProdutos.ColumnByName('valorgrade1').Visible := ParSistema.UsarGradesProdutos;
  dbgProdutos.ColumnByName('valorgrade2').Visible := ParSistema.UsarGradesProdutos;

  fraSelecaoAleatoriaFornecedores.fraSelecaoAleatoriaCliente.ConsultaSelecaoAleatoria.TipoCliente := 'F';
  SetarActivePage(self);
  self.activecontrol := edtDataInicial;
  edtDataInicial.SelectAll;

end;

destructor TfrmVendasporFornecedor.Destroy;
begin
  inherited;
  frmVendasporFornecedor := nil;
  dtmVendasporFornecedor := nil;

end;

function TfrmVendasporFornecedor.PesquisaHabilitada: Boolean;
begin
  Result:= False;
  if CtrlOn and (ActiveControl is TtecDBEditFind) then
  begin
    Result := True;
  end;
end;



procedure TfrmVendasporFornecedor.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
       VK_F6 : if sbnGerar.Enabled then sbnGerarClick(Self);
   VK_Escape : LimpaControles;
       VK_F7 : if sbnRelatorio.Enabled then sbnRelatorioClick(Self);

  end;
  inherited;
end;

procedure TfrmVendasporFornecedor.sbnGerarClick(Sender: TObject);
var
 Param_Estoque : String;

begin
  if VerificaCamposConsulta then
  begin

    with dtmVendasporFornecedor do
    begin
      ParametroDataInicial := edtDataInicial.Text;
      ParametroDataFinal := edtDataFinal.Text;

      ParametroCabecalho := gbxPeriodo.Caption+formatdatetime('dd/mm/yy',strtodate(edtDataInicial.Text))+
                            ' e '+ formatdatetime('dd/mm/yy',strtodate(edtDataFinal.Text));

      ListaFornecedores := fraSelecaoAleatoriaFornecedores.ListaCondicional;
      ListaGruposFornecedores := fraSelecaoAleatoriagruposfornecedores1.ListaCondicional;


      Param_Estoque :='0 ';
      if ckbemEstoque.Checked then
      begin
        Param_Estoque :=Param_Estoque + ' + e.emEstoque';
        CabecalhoSaldoEstoque := CabecalhoSaldoEstoque+'em Estoque + ';
      end;
      if ckbReservado.Checked then
      begin
        Param_Estoque :=Param_Estoque+' + e.Reservado';
        CabecalhoSaldoEstoque := CabecalhoSaldoEstoque+'Reservado + ';
      end;
      if ckbTransito.Checked then
      begin
        Param_Estoque :=Param_Estoque+' + e.Transito';
        CabecalhoSaldoEstoque := CabecalhoSaldoEstoque+'em Transito + ';
      end;
      if ckbDemonstracao.Checked then
      begin
        Param_Estoque :=Param_Estoque+' + e.Demonstracao';
        CabecalhoSaldoEstoque := CabecalhoSaldoEstoque+'Demonstracao + ';
      end;
      if ckbConserto.Checked then
      begin
        Param_Estoque :=Param_Estoque+' + e.Conserto';
        CabecalhoSaldoEstoque := CabecalhoSaldoEstoque+'Conserto + ';
      end;
      if ckbDanificada.Checked then
      begin
        Param_Estoque :=Param_Estoque+' + e.Danificada';
        CabecalhoSaldoEstoque := CabecalhoSaldoEstoque+'Danificada + ';
      end;
      if ckbReservaPrevia.Checked then
      begin
        Param_Estoque :=Param_Estoque+' + e.reservaprevia';
        CabecalhoSaldoEstoque := CabecalhoSaldoEstoque+'em Reserva Prévia + ';
      end;
      ParametroEstoque := Param_estoque;
     

      ProdutoEmLinha     := ckbProdutoEmLinha.checked;
      ProdutoForadeLinha := ckbProdutoForadeLinha.checked;
      ProdutoAtivo       := ckbProdutoAtivo.checked;
      ProdutoInativo     := ckbProdutoInativo.checked;
      ProdutoComMontagem := ckbProdutoComMontagem.Checked;
      ProdutoSemMontagem := ckbProdutoSemMontagem.Checked;
      ProdutoBrinde      := ckbProdutoBrinde.Checked;
      ProdutoNaoBrinde   := ckbProdutoNaoBrinde.Checked;

      ProdutoComposto := ckbComposto.Checked;
      ProdutoNaoComposto := ckbNaoComposto.Checked;

      CurvaABC_A := ckbCurvaABC_A.Checked;
      CurvaABC_B := ckbCurvaABC_B.Checked;
      CurvaABC_C := ckbCurvaABC_C.Checked;
      CurvaABC_NaoDefinido := ckbCurvaABC_NaoDefinido.Checked;

      MontarFiltroFiliais(clbFiliais);
      MontarFiltroFiliaisEstoque(clbFiliaisEstoque);
      MontarFiltroGrupoFiliais(clbGrupodeFiliais);

      ListaCondicaoItemProduto := fraMultiplaSelecaoAleatoria.fraSelecaoAleatoriaItemdeProdutos.ListaCondicional;

      ListaCondicaoProduto := fraMultiplaSelecaoAleatoria.fraSelecaoAleatoriaprodutos.ListaCondicional;

      ListaCondicaoGrupoProduto := fraMultiplaSelecaoAleatoria.fraSelecaoaleatoriagruposprodutos.ListaCondicional;

      ListaCondicaoMarcaProduto := fraMultiplaSelecaoAleatoria.fraSelecaoAleatoriamarcasProdutos.ListaCondicional;

      ListaCondicaoClasseProduto := fraMultiplaSelecaoAleatoria.fraSelecaoaleatoriaclassesprodutos.ListaCondicional;

      ListaCondicaoPromocoesProduto := fraMultiplaSelecaoAleatoria.fraSelecaoaleatoriapromocoes.ListaCondicional;

      AbreVendasporFornecedor;
      if not ConsultaVazia then
      begin
        dtmVendasporFornecedor.ImprimirRelatorio; 
        {
        pgcConsulta.ActivePage := tstConsulta;
        dbgFornecedores.SetFocus;
        sbnRelatorio.Enabled := true;
        }
      end
{      else
        sbnRelatorio.Enabled := false};
    end;
  end;
end;

procedure TfrmVendasporFornecedor.LimpaControles;
begin
  pgcConsulta.ActivePage := tstParametros;
end;

function TfrmVendasporFornecedor.VerificaCamposConsulta: Boolean;
begin
  result := True;

  if result then
  begin
    Result := (edtDataInicial.DataValida and edtDataFinal.DataValida);
    if Result then
    begin
     if (not dataembranco(edtDataInicial.text) and not dataembranco(edtDataFinal.text)) then
       Result:=StrToDate(edtDataInicial.Text) <= StrToDate(edtDataFinal.Text);

     if result then
     begin
      Result:=(not dataembranco(edtDataInicial.text) or not dataembranco(edtDataFinal.text));

      if not Result then
      begin
       MensagemAviso(ctPARAMETROSINEXISTENTES);
       edtDataInicial.SetFocus;
      end;
     end
     else
     begin
       MensagemAviso(ctDTINICIALMAIORDTFINAL);
       edtDataInicial.SetFocus;
     end;
    end;
   end;
end;

procedure TfrmVendasporFornecedor.sbnRelatorioClick(Sender: TObject);
begin
  sbnGerarClick(nil)
//  dtmVendasporFornecedor.ImprimirRelatorio;
end;

procedure TfrmVendasporFornecedor.edtDiasEstoqueKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if TeclaEnterOuReturn(Key) and (Shift = []) and VerificaCamposConsulta then
    sbnGerarClick(self);
end;

procedure TfrmVendasporFornecedor.ckbProdutoEmLinhaClick(Sender: TObject);
begin
  inherited;
  if not ckbProdutoForadeLinha.Checked and
     not ckbProdutoEmLinha.Checked then
     ckbProdutoforadelinha.Checked := True;
end;

procedure TfrmVendasporFornecedor.ckbProdutoForadeLinhaClick(Sender: TObject);
begin
  inherited;
  if not ckbProdutoForadeLinha.Checked and
     not ckbProdutoEmLinha.Checked then
     ckbProdutoEmLinha.Checked := True;
end;

procedure TfrmVendasporFornecedor.ckbProdutoComMontagemClick(Sender: TObject);
begin
  inherited;
  if not ckbProdutoComMontagem.Checked and
     not ckbProdutoSemMontagem.Checked then
     ckbProdutoSemMontagem.Checked := True;
end;

procedure TfrmVendasporFornecedor.ckbProdutoSemMontagemClick(Sender: TObject);
begin
  inherited;
  if not ckbProdutoComMontagem.Checked and
     not ckbProdutoSemMontagem.Checked then
     ckbProdutoComMontagem.Checked := True;

end;

procedure TfrmVendasporFornecedor.ckbProdutoBrindeClick(Sender: TObject);
begin
  inherited;
  if not ckbProdutoBrinde.Checked and
     not ckbProdutoNaoBrinde.Checked then
     ckbProdutoNaoBrinde.Checked := True;

end;

procedure TfrmVendasporFornecedor.ckbProdutoNaoBrindeClick(Sender: TObject);
begin
  inherited;
  if not ckbProdutoBrinde.Checked and
     not ckbProdutoNaoBrinde.Checked then
     ckbProdutoBrinde.Checked := True;
end;

procedure TfrmVendasporFornecedor.sbnMarcarFiliaisClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais, True);
  MarcarLista(clbGrupodeFiliais, False);
end;

procedure TfrmVendasporFornecedor.sbnDesmarcarFiliaisClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais, False);
end;

procedure TfrmVendasporFornecedor.sbnmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais, True);
  MarcarLista(clbFiliais, False);
end;

procedure TfrmVendasporFornecedor.sbnDesmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais, False);
end;

procedure TfrmVendasporFornecedor.ObterLista(Origem: TStrings;
  Destino: TCheckListBox);
var
 i: integer;
 v_JaEstanaLista: boolean;
begin
  v_JaEstanaLista := false;
  for i:=0 to destino.Items.Count -1 do
  begin
    if Destino.Items.Strings[i] = Origem[0] then
    begin
      v_JaEstanaLista := true;
      break;
    end;
  end;

  if not v_JaEstanaLista then
    Destino.Items.AddStrings(Origem);

end;

procedure TfrmVendasporFornecedor.clbFiliaisClickCheck(Sender: TObject);
var
 i: integer;

begin
  inherited;
  MarcarLista(clbGrupodeFiliais, False);
  tstGrupoFilial.Highlighted := false;

  tstFilial.Highlighted := false;
  for i:= 0 to clbFiliais.Count-1 do
  begin
    if clbFiliais.checked[i] then
    begin
      tstFilial.Highlighted := true;
      break;
    end;
  end;

end;

procedure TfrmVendasporFornecedor.clbGrupodeFiliaisClickCheck(Sender: TObject);
var
 i: integer;

begin
  inherited;
  MarcarLista(clbFiliais, False);
  tstFilial.Highlighted := false;
  tstGrupoFilial.Highlighted := false;
  for i:= 0 to clbGrupodeFiliais.Count-1 do
  begin
    if clbGrupodeFiliais.checked[i] then
    begin
      tstGrupoFilial.Highlighted := true;
      break;
    end;
  end;

end;




procedure TfrmVendasporFornecedor.ckbProdutoAtivoClick(Sender: TObject);
begin
  inherited;
  if not ckbProdutoInativo.Checked and
     not ckbProdutoAtivo.Checked then
     ckbProdutoInAtivo.Checked := True;
end;

procedure TfrmVendasporFornecedor.ckbProdutoInativoClick(Sender: TObject);
begin
  inherited;
  if not ckbProdutoInativo.Checked and
     not ckbProdutoAtivo.Checked then
     ckbProdutoAtivo.Checked := True;

end;


procedure TfrmVendasporFornecedor.dbgProdutosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
{
  if key = VK_return then
  begin
    if dbgProdutos.SelectedField.fieldname = 'sugestao' then
    begin
      if (dtmVendasporFornecedor.qryComprasTotalsugestao.AsCurrency > 0) and
         not (dtmVendasporFornecedor.qryComprasTotalselecionado.asBoolean) then
        dtmVendasporFornecedor.SelecionarProdutos(true, False)
      else
      if (dtmVendasporFornecedor.qryComprasTotalsugestao.AsCurrency <= 0) and
         (dtmVendasporFornecedor.qryComprasTotalselecionado.asBoolean) then
        dtmVendasporFornecedor.SelecionarProdutos(false, False)
    end;
  end;
}
end;

procedure TfrmVendasporFornecedor.sbnVisualizarFotoClick(Sender: TObject);
begin
  inherited;
  AcionarTelaVisualizarImageURL(self, dtmVendasporFornecedor.GetProduto);
end;


procedure TfrmVendasporFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  Action := caFree;
//  freeandnil(frmVendasporFornecedor);
end;

procedure TfrmVendasporFornecedor.sbnMarcarFiliaisEstqoueClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliaisEstoque, True);
end;

procedure TfrmVendasporFornecedor.sbnDesmarcarFiliaisEstoqueClick(
  Sender: TObject);
begin
  inherited;
    MarcarLista(clbFiliaisEstoque, False);
end;

procedure TfrmVendasporFornecedor.clbFiliaisEstoqueClickCheck(
  Sender: TObject);
var
  i: integer;
begin
  inherited;
  tstFiliaisEstoque.Highlighted := false;
  for i:= 0 to clbFiliaisEstoque.Count-1 do
  begin
    if clbFiliaisEstoque.checked[i] then
    begin
      tstFiliaisEstoque.Highlighted := true;
      break;
    end;
  end;

end;

end.
