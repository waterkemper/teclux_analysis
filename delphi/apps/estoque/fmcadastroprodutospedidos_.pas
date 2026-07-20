unit fmcadastroprodutospedidos_;

interface

uses
  //CLX
  SysUtils, Classes, Forms, ExtCtrls, StdCtrls, Controls, Mask, Buttons,
  DBCtrls, Graphics,
  //Terceiros
  ZQuery,
  //Biblio
  biblio, ctconstantes, clparametrossistema,
  //Componentes
  cpnumero, cpdbfindcontrols, cpdbtext,
  //Repositorio
  fmajudabt, fmcadastropadraonavegacao, fmconsultabasica, fmconsultaporcampo,
  ComCtrls, cpdata, DB, ZPgSqlQuery, cpquery, Grids, DBGrids, cpdbgrid,
  frconsultacodigo, frconsultacontabil, frconsultacodigocontabil,
  frconsulta, ActnList, ToolWin, cptexto, StrUtils, dmcadastropedidos,
  AdvEdit, AdvEdBtn, DBPlannerDatePicker;

type
  Tfrmcadastroprodutospedidos_ = class(TfrmCadastroPadraoNav)
    pnlFundoJanela: TPanel;
    gbxPreco: TGroupBox;
    edtQuantidade: TDBEditNumero;
    dtxDescricaoProduto: TtecDBText;
    flkCodigoProduto: TtecDBFindLookup;
    gbxProdutos: TGroupBox;
    sbnProdutos: TSpeedButton;
    edtPrecoProduto: TDBEditNumero;
    gbxItem: TGroupBox;
    gbxQtdeItem: TGroupBox;
    gbxPrecoUnitario: TGroupBox;
    gbxQtxPRECO: TGroupBox;
    gbxTotalmaisIPI: TGroupBox;
    dtxTotalMaisIPI: TtecDBText;
    dtxValorTotalProduto: TtecDBText;
    gbxICMSProprio: TGroupBox;
    gbxPercICMSProprio: TGroupBox;
    edtPICMS: TDBEditNumero;
    gbxValorReducaoBase: TGroupBox;
    edtRedBC: TDBEditNumero;
    gbxBaseCalculoICMSProprio: TGroupBox;
    edtBaseICMS: TDBEditNumero;
    gbxValorICMSProprio: TGroupBox;
    edtVlICMS: TDBEditNumero;
    gbxPercentualReducao: TGroupBox;
    edtPRedBC: TDBEditNumero;
    gbxICMSSubstTrib: TGroupBox;
    gbxBaseCalculoICMSST: TGroupBox;
    edtBaseICMSST: TDBEditNumero;
    gbxValorICMSPropriost: TGroupBox;
    edtVlICMSST: TDBEditNumero;
    gbxIPI: TGroupBox;
    GroupBox1: TGroupBox;
    edtIPI: TDBEditNumero;
    GroupBox2: TGroupBox;
    sbnGerarTotalIPI: TSpeedButton;
    edtValorIPI: TDBEditNumero;
    gbxBaseCalculoIPI: TGroupBox;
    edtBaseCalculoIPI: TDBEditNumero;
    sbnGerarTotalICMS: TSpeedButton;
    gbxBaseICMS: TGroupBox;
    edtBaseICMSNota: TDBEditNumero;
    gbxValorICMS: TGroupBox;
    edtValorICMSNota: TDBEditNumero;
    gbxBaseSubst: TGroupBox;
    edtBaseICMSSubstituicao: TDBEditNumero;
    gbxValorSubst: TGroupBox;
    edtValorICMSSubstituicao: TDBEditNumero;
    gbxProdutos_6: TGroupBox;
    gbxTotalNota: TGroupBox;
    edtValor: TDBEditNumero;
    DBEditNumero1: TDBEditNumero;
    gbxValordoIPINF: TGroupBox;
    edtValordoIPINF: TDBEditNumero;
    gbxTotaisdaNota: TGroupBox;
    gbxNCM: TGroupBox;
    dtxNCM: TtecDBText;
    pgcImpostos: TPageControl;
    tstImpostosFechamentoNF: TTabSheet;
    tstImpostosPISCOFINS: TTabSheet;
    gbxPIS: TGroupBox;
    GroupBox6: TGroupBox;
    edtPISPercentual: TDBEditNumero;
    GroupBox7: TGroupBox;
    edtValorPIS: TDBEditNumero;
    GroupBox8: TGroupBox;
    edtBaseCalculoPis: TDBEditNumero;
    gbxPISCST: TGroupBox;
    fraConsultaTributacaopis: TfraConsultaCodigo;
    gbxCOFINS: TGroupBox;
    GroupBox11: TGroupBox;
    edtCofinsPercentual: TDBEditNumero;
    GroupBox12: TGroupBox;
    edtValorCofins: TDBEditNumero;
    GroupBox13: TGroupBox;
    edtBaseCalculoCofins: TDBEditNumero;
    GroupBox16: TGroupBox;
    fraConsultaTributacaoCOFINS: TfraConsultaCodigo;
    sbnGerarTotalPIS: TSpeedButton;
    sbnGerarTotalCOFINS: TSpeedButton;
    gbxDescricaoPreco: TGroupBox;
    dtxDescricaoPreco: TtecDBText;
    dtxPreco: TtecDBText;
    gbxCSOSN_OU_CST_NF: TGroupBox;
    fraConsultaCSOSN_OU_CST_NF: TfraConsultaCodigoContabil;
    GroupBox9: TGroupBox;
    edtpredbcst: TDBEditNumero;
    GroupBox10: TGroupBox;
    edtvalorreducaobasest: TDBEditNumero;
    GroupBox14: TGroupBox;
    edtaliquotaicmsst: TDBEditNumero;
    gbxIPICST: TGroupBox;
    fraConsultaIPICST: TfraConsultaCodigo;
    GroupBox15: TGroupBox;
    edtpMVAST: TDBEditNumero;
    gbxpcredsn: TGroupBox;
    edtpcredsn: TDBEditNumero;
    GroupBox18: TGroupBox;
    edtvcredicmssn: TDBEditNumero;
    gbxCST_OU_CSOSN_EMPRESA: TGroupBox;
    fraConsultaCST_OU_CSOSN_EMPRESA: TfraConsultaCodigoContabil;
    pnlDadosICMSProprio: TPanel;
    pnlDadosIPIProprio: TPanel;
    GroupBox17: TGroupBox;
    fraConsultaIPICST_NF: TfraConsultaCodigo;
    dtxcst_csosn_produto: TtecDBText;
    gbx_cst_csosn_produto: TGroupBox;
    gbxDescontoProduto: TGroupBox;
    edtDescontoProduto: TDBEditNumero;
    gbxValorLiquidoProduto: TGroupBox;
    edtValorLiquidoProduto: TtecDBText;
    sbnRatearValorTotalProdutos: TSpeedButton;
    gbxFreteProduto: TGroupBox;
    sbnRatearValorTotalFrete: TSpeedButton;
    edtFrete: TDBEditNumero;
    gbxUnidadeNF: TGroupBox;
    gbxFatorConversao: TGroupBox;
    fraConsultaUnidadeNF: TfraConsultaCodigo;
    gbxUnidadeEstoque: TGroupBox;
    dtxUnidadeEstoque: TtecDBText;
    dtxDescricaoUnidadeEstoque: TtecDBText;
    gbxQtdeEstoque: TGroupBox;
    edtQtdeEstoque: TDBEditNumero;
    edtFatorConsersao: TDBEditNumero;
    gbxBaseSTRetAnt: TGroupBox;
    edtBaseSTRetAnt: TDBEditNumero;
    gbxValorSTRetAnt: TGroupBox;
    edtValorSTRetAnt: TDBEditNumero;
    DBEditNumero5: TDBEditNumero;
    gbxNatureza: TGroupBox;
    fraConsultaNatureza: TfraConsultaCodigo;
    dtxNatureza: TtecDBText;
    gbxSelecionar: TGroupBox;
    ckbFiltrarProdutosPorFornecedor: TCheckBox;
    Timer1: TTimer;
    tecDBText1: TtecDBText;
    dbckbAtualizarPrecoVenda: TDBCheckBox;
    gbxLembrarEm: TGroupBox;
    edttpDataEntrega: TDBPlannerDatePicker;
    procedure flkPedidoEnter(Sender: TObject);
    procedure flkCodigoProdutoEnter(Sender: TObject);
    procedure sbnProdutosClick(Sender: TObject);
    procedure ckbFiltrarProdutosPorFornecedorClick(Sender: TObject);
    procedure flkCodigoProdutoMessage(var Msg: String);
    procedure sbnProximoClick(Sender: TObject);
    procedure sbnAnteriorClick(Sender: TObject);
    procedure sbnPrimeiroClick(Sender: TObject);
    procedure sbnUltimoClick(Sender: TObject);
    procedure edtValorIPIKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnGerarTotalIPIClick(Sender: TObject);
    procedure sbnNaturezaProdutoClick(Sender: TObject);
    procedure sbnGerarTotalICMSSTClick(Sender: TObject);
    procedure sbnGerarTotalICMSClick(Sender: TObject);
    procedure sbnGerarTotalPISClick(Sender: TObject);
    procedure sbnGerarTotalCOFINSClick(Sender: TObject);
    procedure fraConsultaCSOSN_OU_CST_NFedfCodigoEnter(Sender: TObject);
    procedure sbnRatearValorTotalProdutosClick(Sender: TObject);
    procedure sbnRatearValorTotalFreteClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure fraConsultaNaturezaedfCodigoEnter(Sender: TObject);
    procedure fraConsultaNaturezaedfCodigoChange(Sender: TObject);
    procedure dbckbAtualizarPrecoVendaClick(Sender: TObject);
  protected
    TipoProcura: TtecProdutosNotaFiscal;
    procedure AlterarEstadoBotoesNavegacao; override;
    function  InternoPesquisar(Titulo: String): Integer; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure NavegarProdutos;
    procedure PosicionarCursor;

    procedure CondicoesdaConsultaNaturezasCFOP_NF;
    procedure AtribuirDadosNATUREZASCFOP_NF(Found: Boolean);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure  SetDataModulo (Dtm: tdtmCadastroPedidos);
    procedure PosicionarActiveControl;

  end;

{
var
  frmcadastroprodutospedidos_: Tfrmcadastroprodutospedidos_;
}

implementation

uses
  //CLX
  Windows,
  //Projeto
  fmcadastropadrao, dmbasico, fmcadastropedidos;

{$R *.dfm}

{ Tfrmcadastroprodutospedidos_ }

procedure Tfrmcadastroprodutospedidos_.AlterarEstadoBotoesNavegacao;
begin
  inherited;
  flkCodigoProduto.Exist;
end;


procedure Tfrmcadastroprodutospedidos_.PosicionarActiveControl;
begin
  inherited;
  { Mantém pressionada SHIFT }
  keybd_event(VK_SHIFT, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
  { Pressiona V }
  keybd_event(VK_TAB, 0, 0, 0);
  { Libera (solta) SHIFT }
  keybd_event(VK_SHIFT, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  keybd_event(VK_TAB, 0, 0, 0);

end;

procedure Tfrmcadastroprodutospedidos_.ckbFiltrarProdutosPorFornecedorClick(Sender: TObject);
begin
  inherited;
 TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.ProcurarPorFornecedor := ckbFiltrarProdutosPorFornecedor.Checked
end;

constructor Tfrmcadastroprodutospedidos_.Create(AOwner: TComponent);
begin
  inherited;

end;

function Tfrmcadastroprodutospedidos_.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  case TipoProcura of
    dnfProduto: Result := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.ExisteProduto(NomeCampo, Value);
  else
    Result := False;
  end
end;

procedure Tfrmcadastroprodutospedidos_.flkPedidoEnter(Sender: TObject);
begin
  inherited;
  TipoProcura := dnfPedido
end;

procedure Tfrmcadastroprodutospedidos_.flkCodigoProdutoEnter(Sender: TObject);
begin
  inherited;
  TipoProcura := dnfProduto
end;

procedure Tfrmcadastroprodutospedidos_.flkCodigoProdutoMessage(var Msg: String);
begin
  inherited;
  Msg := Copy(Msg, 1, Length(Msg) - 1) + ' ou esta incluído no pedido.'; 
end;

function Tfrmcadastroprodutospedidos_.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
    TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.ExcluirProdutoPedido(False);
  if not sbnIncluir.Visible then
    ModalResult := mrOk;
end;

function Tfrmcadastroprodutospedidos_.InternoGravar: Boolean;
begin
  result := inherited InternoGravar;
{  if (ActiveControl is TtecFindCustom) and
     (TtecFindCustom(ActiveControl).text <> '') then
    Result:= TtecFindCustom(ActiveControl).Exist;
}
  if Result then
    Result  := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.Gravarprodutopedido;

  if not sbnIncluir.Visible then
    ModalResult := mrOk;
  Self.BringToFront;
end;

function Tfrmcadastroprodutospedidos_.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.IncluirProdutoPedido(False);
    fraConsultaNatureza.edfCodigo.Exist;
    PosicionarCursor;
  end;
end;

function Tfrmcadastroprodutospedidos_.InternoPesquisar(Titulo: String): Integer;
var
  PesquisaReferencia: Boolean;
  Tit: String;
begin
{
  PesquisaReferencia := ((ActiveControl is TtecDBFindLookup) or
                         (ActiveControl is TtecDbEditFind)) and CtrlOn;
}
//  PesquisaReferencia := (TipoProcura in [dnfPedido, dnfProduto, dnfFILIAL, dnfSERIE, dnfNOTAFISCAL]);

  PesquisaReferencia := ActiveControl.name = 'flkCodigoProduto';

  if PesquisaReferencia then
  begin
    case TipoProcura of
      dnfProduto: begin
                    if not TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.dataset.fieldbyname('produto').ReadOnly then
                    begin
                      if ckbFiltrarProdutosPorFornecedor.Checked then
                        Tit := '(' + TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.NomeFornecedor + ')'
                      else
                        Tit := '';
                      Titulo := Format(ctPRODUTOSFORNECEDORES, [Tit]);
                      TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.AbreTabelaConsultaprodutospedidos;
                    end
                    else
                      PesquisaReferencia := false;
                  end;
    end;
  end;

  if PesquisaReferencia then
  begin
    Result := inherited InternoPesquisar(Titulo);
    if Result = mrOK then
      case TipoProcura of
        dnfProduto: TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.Selecionar(pcoPRODUTO);
      end;

    case TipoProcura of
      dnfProduto: TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.qryConsultaProdutos.close;
    end;
  end else
    Result := mrNone
end;

function Tfrmcadastroprodutospedidos_.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := TipoProcura <> dnfProduto;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

procedure Tfrmcadastroprodutospedidos_.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and (Key = VK_I) then
  begin
    sbnGerarTotalIPIClick(nil);
    edtValorIPI.SetFocus;
    edtValorIPI.SelectAll;
  end;
end;

procedure Tfrmcadastroprodutospedidos_.sbnProdutosClick(Sender: TObject);
begin
  inherited;
  PosicionarCursor;
  CtrlOn := True;
  InternoPesquisar('')
end;

function Tfrmcadastroprodutospedidos_.TabelaDePesquisa: TZDataSet;
begin
  case TipoProcura of
    dnfProduto: Result := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.qryConsultaProdutos;
  else
    Result := nil;
  end
end;

destructor Tfrmcadastroprodutospedidos_.Destroy;
begin
  inherited;
//  frmcadastroprodutospedidos_ := nil;

//  TfrmCadastroPedidos(owner).frmcadastroprodutospedidos_ := nil;
end;

procedure Tfrmcadastroprodutospedidos_.sbnProximoClick(Sender: TObject);
begin
  NavegarProdutos;
  inherited;
end;

procedure Tfrmcadastroprodutospedidos_.sbnAnteriorClick(Sender: TObject);
begin
  NavegarProdutos;
  inherited;
end;

procedure Tfrmcadastroprodutospedidos_.sbnPrimeiroClick(Sender: TObject);
begin
  NavegarProdutos;
  inherited;
end;

procedure Tfrmcadastroprodutospedidos_.sbnUltimoClick(Sender: TObject);
begin
  NavegarProdutos;
  inherited;
end;

procedure Tfrmcadastroprodutospedidos_.NavegarProdutos;
begin
{
  with dtmCadastroNotasFiscais do
    Incluirprodutospedidos(false);
    }
end;

procedure Tfrmcadastroprodutospedidos_.edtValorIPIKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if TeclaEnterOuReturn(Key) and (Shift = []) then
  begin
    InternoGravar;
    PosicionarCursor;
  end;
end;

procedure Tfrmcadastroprodutospedidos_.sbnGerarTotalIPIClick(
  Sender: TObject);
begin
  inherited;
  TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.CalcularValorTotalItemProduto(ipi);
end;

procedure Tfrmcadastroprodutospedidos_.PosicionarCursor;
begin
  if gbxprodutos.Enabled then
  begin
    flkCodigoProduto.SetFocus;
    flkCodigoProduto.SelectAll;
  end
  else
  begin
    edtQuantidade.SetFocus;
    edtQuantidade.SelectAll;
  end;
end;

procedure Tfrmcadastroprodutospedidos_.sbnNaturezaProdutoClick(
  Sender: TObject);
begin
  inherited;
end;
{
procedure Tfrmcadastroprodutospedidos_.FormShow(Sender: TObject);
var
  foco: TWinControl;
begin
  inherited;
  foco := FocusedControl;
  if flkNaturezaProduto.Text <> '' then
  begin
    tipoprocura := dnfNATUREZA;
    flkNaturezaProduto.Exist;
    foco.SetFocus;
  end;
end;
}

procedure Tfrmcadastroprodutospedidos_.sbnGerarTotalICMSSTClick(
  Sender: TObject);
begin
  inherited;
  TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.CalcularValorTotalItemProduto(icmsst);
end;

procedure Tfrmcadastroprodutospedidos_.sbnGerarTotalICMSClick(
  Sender: TObject);
begin
  inherited;
  TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.CalcularValorTotalItemProduto(icms);
end;

procedure Tfrmcadastroprodutospedidos_.sbnGerarTotalPISClick(
  Sender: TObject);
begin
  inherited;
  TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.CalcularValorTotalItemProduto(pis);
end;

procedure Tfrmcadastroprodutospedidos_.sbnGerarTotalCOFINSClick(
  Sender: TObject);
begin
  inherited;
  TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.CalcularValorTotalItemProduto(cofins);
end;

procedure Tfrmcadastroprodutospedidos_.fraConsultaCSOSN_OU_CST_NFedfCodigoEnter(
  Sender: TObject);
begin
  inherited;
  if TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.CondicaoCSOSN then
    tipoprocura := dnfCSOSN
  else
    tipoprocura := dnfCSTICMS;
end;

procedure Tfrmcadastroprodutospedidos_.sbnRatearValorTotalProdutosClick(
  Sender: TObject);
begin
  inherited;
  TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.RatearDesconto;
end;

procedure Tfrmcadastroprodutospedidos_.sbnRatearValorTotalFreteClick(
  Sender: TObject);
begin
  inherited;
  TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.RatearFrete;
end;

procedure Tfrmcadastroprodutospedidos_.SetDataModulo(
  Dtm: TdtmCadastroPedidos);
begin


//  if TfrmCadastroPedidos(self.owner).dtmCadastroPedidos <> Dtm then
//  begin
//    TfrmCadastroPedidos(self.owner).dtmCadastroPedidos := Dtm;

    edtQuantidade.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edtPrecoProduto.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    dtxValorTotalProduto.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    dtxTotalMaisIPI.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    DBEditNumero1.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrPedidos           ;
    edtBaseICMSNota.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrPedidos          ;
    edtValorICMSNota.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrPedidos          ;
    edtBaseICMSSubstituicao.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrPedidos    ;
    edtValorICMSSubstituicao.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrPedidos    ;
    edtValordoIPINF.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrPedidos              ;
    edtValor.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrPedidos                      ;
    edtBaseSTRetAnt.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrPedidos                ;
    edtValorSTRetAnt.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrPedidos                ;
    fraConsultaCSOSN_OU_CST_NF.edfCodigo.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    fraConsultaCST_OU_CSOSN_EMPRESA.edfCodigo.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edtBaseICMS.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edtPRedBC.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos   ;
    edtPICMS.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos     ;
    edtVlICMS.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos     ;
    edtvcredicmssn.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos ;
    edtpcredsn.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos      ;
    edtBaseICMSST.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos    ;
    edtpredbcst.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos       ;
    edtvalorreducaobasest.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edtaliquotaicmsst.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos     ;
    edtpMVAST.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos              ;
    fraConsultaIPICST.edfCodigo.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edtValorIPI.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edtBaseCalculoIPI.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edtIPI.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edtDescontoProduto.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    DBEditNumero5.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edtValorLiquidoProduto.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edtFrete.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos               ;
    fraConsultaUnidadeNF.edfCodigo.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edtFatorConsersao.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    dtxUnidadeEstoque.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos ;
    dtxDescricaoUnidadeEstoque.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edtQtdeEstoque.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edttpDataEntrega.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;

    dtxDescricaoProduto.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProcuraProdutos;
    flkCodigoProduto.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos    ;
    flkCodigoProduto.LookupSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProcuraProdutos   ;
    dtxNCM.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos                ;
    dtxDescricaoPreco.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos      ;
    dtxPreco.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos                ;
    dtxcst_csosn_produto.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos     ;
    fraConsultaNatureza.edfCodigo.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edtVlICMSST.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;

    fraConsultaTributacaopis.edfcodigo.Datasource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edtBaseCalculoPis.Datasource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edtPISPercentual.Datasource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edtValorPIS.Datasource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;

    fraConsultaTributacaoCofins.edfcodigo.Datasource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edtBaseCalculoCofins.Datasource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edtCofinsPercentual.Datasource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;
    edtValorCofins.Datasource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;

    dbckbAtualizarPrecoVenda.Datasource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;


  //  tecDBText2.DataSource := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrProdutosPedidos;

  //  TTecQuery(flkProduto.LookupSource.DataSet).parambyname(flkProduto.LookupQueryParameter).clear;
    {
    if ParSistema.PermitirProdutoAlfanumerico then begin
       flkProduto.Lookupfield:= 'codigovisual';
       flkProduto.LookupQueryParameter:= 'codigovisual';
       flkProduto.DataField     := 'produtovisual';
    end
    else begin
       flkProduto.Lookupfield:= 'codigo';
       flkProduto.LookupQueryParameter:= 'codigo';
       flkProduto.DataField     := 'produto';
    end;
    }
    TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.CasasDecimais(edtPrecoProduto);


    if TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.qryPedidosregimetributario.asinteger = 1 then
    begin
      dtxcst_csosn_produto.datafield := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.DataSet.fieldbyname('csosn_produto').FieldName;
      gbx_cst_csosn_produto.Caption := 'CSOSN DO PRODUTO';
    end
    else
    begin
      dtxcst_csosn_produto.datafield := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.DataSet.fieldbyname('cst_produto').FieldName;;
      gbx_cst_csosn_produto.Caption := 'CST DO PRODUTO';
    end;

    TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.CasasDecimais(edtPrecoProduto);
    ckbFiltrarProdutosPorFornecedor.Enabled := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.TipoFornecedor = 'F';

    if (TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.qryPedidosregimetributario.asinteger = 1)  then
    begin
      fraConsultaCST_OU_CSOSN_EMPRESA.edfCodigo.DataField := 'csosn';
      fraConsultaCST_OU_CSOSN_EMPRESA.edfCodigo.LookupSource := fraConsultaCST_OU_CSOSN_EMPRESA.dsrProcuraCSOSN;
      fraConsultaCST_OU_CSOSN_EMPRESA.edfCodigo.MaxLength := 3;

      fraConsultaCST_OU_CSOSN_EMPRESA.TipoPesquisa := pesCSOSN;

      fraConsultaCST_OU_CSOSN_EMPRESA.dtxDescricao.DataSource := fraConsultaCST_OU_CSOSN_EMPRESA.dsrProcuraCSOSN;

      fraConsultaCST_OU_CSOSN_EMPRESA.edfCodigo.Width := 33;
      fraConsultaCST_OU_CSOSN_EMPRESA.sbnProcura.Left := 32;
      fraConsultaCST_OU_CSOSN_EMPRESA.dtxDescricao.Left := 56;
      fraConsultaCST_OU_CSOSN_EMPRESA.dtxDescricao.Width := 644;

      gbxCST_OU_CSOSN_EMPRESA.Caption := 'CSOSN - COD. SIT. OP. SIMPLES NACIONAL NA EMPRESA';
      TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.DataSet.fieldbyname('csosn').Required := true;

    end
    else
    begin
      fraConsultaCST_OU_CSOSN_EMPRESA.edfCodigo.DataField := 'incidencia';
      fraConsultaCST_OU_CSOSN_EMPRESA.edfCodigo.LookupSource := fraConsultaCST_OU_CSOSN_EMPRESA.dsrProcuraTributosICMS;
      fraConsultaCST_OU_CSOSN_EMPRESA.edfCodigo.MaxLength := 2;

      fraConsultaCST_OU_CSOSN_EMPRESA.TipoPesquisa := pesTRIBUTOSICMS;

      fraConsultaCST_OU_CSOSN_EMPRESA.dtxDescricao.DataSource := fraConsultaCST_OU_CSOSN_EMPRESA.dsrProcuraTributosICMS;

      fraConsultaCST_OU_CSOSN_EMPRESA.edfCodigo.Width := 25;
      fraConsultaCST_OU_CSOSN_EMPRESA.sbnProcura.Left := 24;
      fraConsultaCST_OU_CSOSN_EMPRESA.dtxDescricao.Left := 48;
      fraConsultaCST_OU_CSOSN_EMPRESA.dtxDescricao.Width := 652;

      gbxCST_OU_CSOSN_EMPRESA.Caption := 'CST - CODIGO DA SITUAÇÃO TRIBUTÁRIA DA EMPRESA';
      TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.DataSet.fieldbyname('incidencia').Required := true;
    end;

    fraConsultaCST_OU_CSOSN_EMPRESA.edfCodigo.readonly := true;
    TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.DataSet.fieldbyname('csosn_nf').Required := false;
    TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.DataSet.fieldbyname('cst_nf').Required := false;

    if TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.CondicaoCSOSN  then
    begin
      fraConsultaCSOSN_OU_CST_NF.edfCodigo.DataField := 'csosn_nf';
      fraConsultaCSOSN_OU_CST_NF.edfCodigo.LookupSource := fraConsultaCSOSN_OU_CST_NF.dsrProcuraCSOSN;
      fraConsultaCSOSN_OU_CST_NF.edfCodigo.MaxLength := 3;

      fraConsultaCSOSN_OU_CST_NF.TipoPesquisa := pesCSOSN;

      fraConsultaCSOSN_OU_CST_NF.dtxDescricao.DataSource := fraConsultaCSOSN_OU_CST_NF.dsrProcuraCSOSN;

      fraConsultaCSOSN_OU_CST_NF.edfCodigo.Width := 33;
      fraConsultaCSOSN_OU_CST_NF.sbnProcura.Left := 32;
      fraConsultaCSOSN_OU_CST_NF.dtxDescricao.Left := 56;
      fraConsultaCSOSN_OU_CST_NF.dtxDescricao.Width := 644;

      gbxCSOSN_OU_CST_NF.Caption := 'CSOSN - COD. SIT. OP. SIMPLES NACIONAL DA NOTA FISCAL';
      TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.DataSet.fieldbyname('csosn_nf').Required :=  true {not TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.qryNotaFiscalpermitirimprimir.AsBoolean};

    end
    else
    begin
      fraConsultaCSOSN_OU_CST_NF.edfCodigo.DataField := 'cst_nf';
      fraConsultaCSOSN_OU_CST_NF.edfCodigo.LookupSource := fraConsultaCSOSN_OU_CST_NF.dsrProcuraTributosICMS;
      fraConsultaCSOSN_OU_CST_NF.edfCodigo.MaxLength := 2;

      fraConsultaCSOSN_OU_CST_NF.TipoPesquisa := pesTRIBUTOSICMS;

      fraConsultaCSOSN_OU_CST_NF.dtxDescricao.DataSource := fraConsultaCSOSN_OU_CST_NF.dsrProcuraTributosICMS;

      fraConsultaCSOSN_OU_CST_NF.edfCodigo.Width := 25;
      fraConsultaCSOSN_OU_CST_NF.sbnProcura.Left := 24;
      fraConsultaCSOSN_OU_CST_NF.dtxDescricao.Left := 48;
      fraConsultaCSOSN_OU_CST_NF.dtxDescricao.Width := 652;

      gbxCSOSN_OU_CST_NF.Caption := 'CST - CODIGO DA SITUAÇÃO TRIBUTÁRIA DA NOTA FISCAL';
      TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.DataSet.fieldbyname('cst_nf').Required := true; {not TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.qryNotaFiscalpermitirimprimir.AsBoolean;}

    end;

    fraConsultaIPICST.TipoPesquisa := pesTRIBUTOSIPI;
    fraConsultaIPICST_NF.TipoPesquisa := pesTRIBUTOSIPI;

    fraConsultaTributacaopis.TipoPesquisa := pesTRIBUTOSPIS;
    fraConsultaTributacaoCOFINS.TipoPesquisa := pesTRIBUTOSCOFINS;

    pgcImpostos.ActivePage := tstImpostosFechamentoNF;

    fraConsultaUnidadeNF.TipoPesquisa := pesUNIDADES;


    fraConsultaNatureza.CondicoesdaConsulta := CondicoesdaConsultaNaturezasCFOP_NF;
    fraConsultaNatureza.onFound := AtribuirDadosNATUREZASCFOP_NF;
    TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.qryProcuraNaturezasProduto := fraConsultaNatureza.qryProcuraNaturezasCFOP_NF;
    fraConsultaNatureza.TipoPesquisa := pesNATUREZASCFOP_NF;

    Timer1.enabled := True;

    TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.ProcurarPorFornecedor := ckbFiltrarProdutosPorFornecedor.Checked;
//  end;


                                                                        end;

procedure Tfrmcadastroprodutospedidos_.Timer1Timer(Sender: TObject);
var
  vIPIReadOnly : Boolean;
  vSomenteLeitura : Boolean;
  vSomenteLeituraNotaEntrada : boolean;
  vCondicaoDevolucao_CST60 : boolean;

begin
  inherited;
                    {
  vSomenteLeitura := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.PedidoCancelado or
                     TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.SomenteLeitura;
                     }

  vSomenteLeitura := TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.qryPedidosentrega.readonly;


  sbnIncluir.enabled := not vSomenteLeitura and not sbnSalvar.Enabled;

  sbnExcluir.Enabled := not vSomenteLeitura;
  sbnProdutos.Enabled := not vSomenteLeitura;
  fraConsultaCSOSN_OU_CST_NF.sbnProcura.Enabled := not vSomenteLeitura;
  fraConsultaCSOSN_OU_CST_NF.edfcodigo.ReadOnly := vSomenteLeitura;

  if vSomenteLeitura then
  begin
    fraConsultaCSOSN_OU_CST_NF.edfcodigo.tabstop := false;
    fraConsultaCSOSN_OU_CST_NF.edfcodigo.Color := clBtnFace;
  end
  else
  begin
    fraConsultaCSOSN_OU_CST_NF.edfcodigo.tabstop := true;
    fraConsultaCSOSN_OU_CST_NF.edfcodigo.Color := clWindow;
  end;

  sbnGerarTotalICMS.Enabled := not vSomenteLeitura;
  fraConsultaIPICST_NF.sbnProcura.Enabled := not vSomenteLeitura;

  fraConsultaIPICST_NF.edfcodigo.ReadOnly := vSomenteLeitura;
  if vSomenteLeitura then
  begin
    fraConsultaIPICST_NF.edfcodigo.tabstop := false;
    fraConsultaIPICST_NF.edfcodigo.Color := clBtnFace;
  end
  else
  begin
    fraConsultaIPICST_NF.edfcodigo.tabstop := true;
    fraConsultaIPICST_NF.edfcodigo.Color := clWindow;
  end;

  sbnGerarTotalIPI.Enabled := not vSomenteLeitura;

  vIPIReadOnly :=  not TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.CondicaoIPI(TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.dataset.fieldbyname('ipicst').AsString);

  edtValorIPI.ReadOnly := vSomenteLeitura or vIPIReadOnly;
  edtIPI.ReadOnly := vSomenteLeitura or vIPIReadOnly;
  edtBaseCalculoIPI.ReadOnly := vSomenteLeitura or vIPIReadOnly;

  if edtValorIPI.ReadOnly then
  begin
    edtipi.TabStop := false;
    edtBaseCalculoIPI.TabStop := false;
    edtValorIPI.TabStop := false;

    edtBaseCalculoIPI.Color := clBtnFace;
    edtipi.Color := clBtnFace;
    edtValorIPI.Color := clBtnFace;
  end
  else
  begin
    edtipi.TabStop := true;
    edtBaseCalculoIPI.TabStop := true;
    edtValorIPI.TabStop := true;

    edtBaseCalculoIPI.Color := clWindow;
    edtipi.Color := clWindow;
    edtValorIPI.Color := clWindow;
  end;

  edtPRedBC.ReadOnly := vSomenteLeitura or not TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.CondicaoPRedBC(TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.dataset.fieldbyname('cst_nf').asstring,
                                                                   TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.dataset.fieldbyname('csosn_nf').asstring,
                                                                   TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.qryProcuraFornecedorescrt.AsInteger);
  edtRedBC.ReadOnly := edtPRedBC.ReadOnly;

  if edtPRedBC.ReadOnly then
  begin
    edtPRedBC.TabStop := false;
    edtRedBC.TabStop := false;
    edtPRedBC.color  := clBtnFace;
    edtRedBC.color  := clBtnFace;
  end
  else
  begin
    edtPRedBC.TabStop := true;
    edtRedBC.TabStop := true;
    edtPRedBC.color  := clWindow;
    edtRedBC.color  := clWindow;
  end;

  edtBaseICMS.ReadOnly := vSomenteLeitura or not TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.CondicaoBaseICMS(
                                                                     TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.dataset.fieldbyname('cst_nf').asstring,
                                                                     TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.dataset.fieldbyname('csosn_nf').asstring,
                                                                     TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.dataset.fieldbyname('csosn_produto').asstring,
                                                                     TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.qryProcuraFornecedorescrt.AsInteger, false);

  edtPICMS.ReadOnly := edtBaseICMS.ReadOnly;
  edtVlICMS.ReadOnly := edtBaseICMS.ReadOnly;

  if edtBaseICMS.ReadOnly then
  begin
    edtBaseICMS.TabStop := false;
    edtPICMS.TabStop := false;
    edtVlICMS.TabStop := false;
    edtBaseICMS.color  := clBtnFace;
    edtPICMS.color  := clBtnFace;
    edtVlICMS.color  := clBtnFace;
  end
  else
  begin
    edtBaseICMS.TabStop := true;
    edtPICMS.TabStop := true;
    edtVlICMS.TabStop := true;
    edtBaseICMS.color  := clWindow;
    edtPICMS.color  := clWindow;
    edtVlICMS.color  := clWindow;
  end;

  edtpcredsn.ReadOnly := vSomenteLeitura or not TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.Condicaopcredsn(TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.dataset.fieldbyname('csosn_nf').asstring,
                                                                     TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.qryProcuraFornecedorescrt.AsInteger);

  if edtpcredsn.ReadOnly then
  begin
    edtpcredsn.TabStop := false;
    edtvcredicmssn.TabStop := false;
    edtpcredsn.color  := clBtnFace;
    edtvcredicmssn.color  := clBtnFace;
  end
  else
  begin
    edtpcredsn.TabStop := true;
    edtvcredicmssn.TabStop := true;
    edtpcredsn.color  := clWindow;
    edtvcredicmssn.color  := clWindow;
  end;

  edtpMVAST.ReadOnly := vSomenteLeitura or not TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.CondicaopMVAST(
                                                                   TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.dataset.fieldbyname('cst_nf').asstring,
                                                                   TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.dataset.fieldbyname('csosn_nf').asstring,
                                                                   TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.qryProcuraFornecedorescrt.AsInteger);

  if edtpMVAST.ReadOnly then
  begin

    edtpredbcst.ReadOnly := true;
    edtvalorreducaobasest.ReadOnly := true;
    edtBaseICMSST.ReadOnly := true;
    edtaliquotaicmsst.ReadOnly := true;
    edtVlICMSST.ReadOnly := true;

    edtpMVAST.TabStop := false;
    edtpredbcst.TabStop := false;
    edtvalorreducaobasest.TabStop := false;
    edtBaseICMSST.TabStop := false;
    edtaliquotaicmsst.TabStop := false;
    edtVlICMSST.TabStop := false;

    edtpMVAST.color  := clBtnFace;
    edtpredbcst.color  := clBtnFace;
    edtvalorreducaobasest.color  := clBtnFace;
    edtBaseICMSST.color  := clBtnFace;
    edtaliquotaicmsst.color  := clBtnFace;
    edtVlICMSST.color  := clBtnFace;

  end
  else
  begin

    edtpredbcst.ReadOnly := false;
    edtvalorreducaobasest.ReadOnly := false;
    edtBaseICMSST.ReadOnly := false;
    edtaliquotaicmsst.ReadOnly := false;
    edtVlICMSST.ReadOnly := false;

    edtpMVAST.TabStop := true;
    edtpredbcst.TabStop := true;
    edtvalorreducaobasest.TabStop := true;
    edtBaseICMSST.TabStop := true;
    edtaliquotaicmsst.TabStop := true;
    edtVlICMSST.TabStop := true;

    edtpMVAST.color  := clWindow;
    edtpredbcst.color  := clWindow;
    edtvalorreducaobasest.color  := clWindow;
    edtBaseICMSST.color  := clWindow;
    edtaliquotaicmsst.color  := clWindow;
    edtVlICMSST.color  := clWindow;
  end;

  if TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.dataset.fieldbyname('valoricmsdigitado').AsBoolean then
  begin
    gbxICMSProprio.Font.Color := clRed;
//    edtICMSOutras.tabstop := true;
//    edtICMSOutras.color  := clWindow;
//    edtICMSOutras.readonly := false;
  end
  else
  begin
    gbxICMSProprio.Font.Color := clBlack;
//    edtICMSOutras.tabstop := false;
//    edtICMSOutras.color  := clBtnFace;
//    edtICMSOutras.readonly := true;
  end;


  if TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.dataset.fieldbyname('descontodigitado').AsBoolean then
    gbxDescontoProduto.Font.Color := clRed
  else
    gbxDescontoProduto.Font.Color := clBlack;


  if TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.dataset.fieldbyname('fretedigitado').AsBoolean then
    gbxFreteProduto.Font.Color := clRed
  else
    gbxFreteProduto.Font.Color := clBlack;

  if TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.dataset.fieldbyname('valoricmsstdigitado').AsBoolean then
    gbxICMSSubstTrib.font.Color := clRed
  else
    gbxICMSSubstTrib.font.Color := clBlack;

  if TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.dataset.fieldbyname('valoripidigitado').AsBoolean then
    gbxIPI.Font.Color := clRed
  else gbxIPI.Font.Color := clBlack;

  if TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.dataset.fieldbyname('valorpisdigitado').AsBoolean then
    gbxPIS.Font.Color := clRed
  else gbxPIS.Font.Color := clBlack;

  if TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.dsrprodutospedidos.dataset.fieldbyname('valorcofinsdigitado').AsBoolean then
    gbxCOFINS.Font.Color := clRed
  else gbxCOFINS.Font.Color := clBlack;


  vSomenteLeituraNotaEntrada := flkCodigoProduto.DataSource.DataSet.FieldByName(flkCodigoProduto.DataField).ReadOnly or
                                ({TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.qryNotaFiscalrequernfsaida.AsBoolean and}  (flkCodigoProduto.Text<>''));

  vCondicaoDevolucao_CST60 := False;

  if vCondicaoDevolucao_CST60 then
  begin
    edtBaseICMSST.DataField := 'vBCSTRet';
    edtVlICMSST.DataField := 'vICMSSTRet';

    edtBaseICMS.DataField := 'icmsbasecalculo_dev';
    edtVlICMS.DataField := 'icmsvalor_dev';

    gbxICMSSubstTrib.Caption := 'ICMS SUBSTITUIÇÃO TRIBUTÁRIA RETIDO ANTERIORMENTE';
    gbxICMSProprio.Caption := 'ICMS PRÓPRIO DA NOTA DE ORIGEM';

  end
  else
  begin
    edtBaseICMSST.DataField := 'icmsbasecalculost';
    edtVlICMSST.DataField := 'icmsvalorst';

    edtBaseICMS.DataField := 'icmsbasecalculo';
    edtVlICMS.DataField := 'icmsvalor';

    gbxICMSSubstTrib.Caption := 'ICMS SUBSTITUIÇÃO TRIBUTÁRIA';
    gbxICMSProprio.Caption := 'ICMS PRÓPRIO';

  end;

  if TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.qryProdutosPedidosatualizarprecovenda.asBoolean then
    dbckbAtualizarPrecoVenda.color := clBtnHighlight
  else
    dbckbAtualizarPrecoVenda.color := clBtnFace;


//  TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.qryProcuraNaturezasProduto := fraConsultaNatureza.qryProcuraNaturezasCFOP_NF;

end;

procedure Tfrmcadastroprodutospedidos_.CondicoesdaConsultaNaturezasCFOP_NF;
begin
  with TfrmCadastroPedidos(self.owner).dtmCadastroPedidos do
  begin

    fraConsultaNatureza.qryProcuraNaturezasCFOP_NF.MacroByName('WhereInativo').asstring := ' and (n.inativo is null)';
//    fraConsultaNatureza.qryConsultaNaturezasCFOP_NF.MacroByName('WhereInativo').asstring := ' and (n.inativo is null)';

    if HeUnidadeFederacao(qryProcuraFornecedoresestado.asString) then
    begin
      if qryProcuraFornecedoresestado.asString = EstadoFilialBase then
         fraConsultaNatureza.qryProcuraNaturezasCFOP_NF.parambyname('local').asString := ''
      else
         fraConsultaNatureza.qryProcuraNaturezasCFOP_NF.parambyname('local').asString := 'F';
    end
    else
      fraConsultaNatureza.qryProcuraNaturezasCFOP_NF.parambyname('local').asString := 'E';

    fraConsultaNatureza.qryConsultaNaturezasCFOP_NF.parambyname('local').asString :=
      fraConsultaNatureza.qryProcuraNaturezasCFOP_NF.parambyname('local').asString;

    fraConsultaNatureza.qryProcuraNaturezasCFOP_NF.parambyname('finalidade').asString := '1';
    fraConsultaNatureza.qryConsultaNaturezasCFOP_NF.parambyname('finalidade').asString := '1';

    fraConsultaNatureza.qryProcuraNaturezasCFOP_NF.macrobyname('ListaTipos').asString := quotedstr('E');
    fraConsultaNatureza.qryConsultaNaturezasCFOP_NF.macrobyname('ListaTipos').asString := quotedstr('E');

    if not qryProdutosPedidosnatureza.isNull then
      fraConsultaNatureza.qryProcuraNaturezasCFOP_NF.parambyname('natureza').value := qryProdutosPedidosnatureza.asVariant;

  end;
end;

procedure Tfrmcadastroprodutospedidos_.fraConsultaNaturezaedfCodigoEnter(
  Sender: TObject);
begin
  inherited;
  fraConsultaNatureza.edfCodigoEnter(Sender);
  tipoprocura := dnfNATUREZA;
end;

procedure Tfrmcadastroprodutospedidos_.AtribuirDadosNATUREZASCFOP_NF(Found: Boolean);
begin
  with TfrmCadastroPedidos(self.owner).dtmCadastroPedidos do
  begin
    if fraConsultaNatureza.qryProcuraNaturezasCFOP_NF.recordcount = 1 then
      qryProdutosPedidosnatureza.asinteger := fraConsultaNatureza.qryProcuraNaturezasCFOP_NFcodigo.AsInteger;
      
    qryProdutosPedidoscodigofiscal.asinteger := fraConsultaNatureza.qryProcuraNaturezasCFOP_NFcodigofiscal.AsInteger;

  end;
end;

procedure Tfrmcadastroprodutospedidos_.fraConsultaNaturezaedfCodigoChange(
  Sender: TObject);
begin
  inherited;
  TfrmCadastroPedidos(self.owner).dtmCadastroPedidos.qryProdutosPedidosnatureza.clear;
end;

procedure Tfrmcadastroprodutospedidos_.dbckbAtualizarPrecoVendaClick(
  Sender: TObject);
begin
  inherited;
;
end;

end.
