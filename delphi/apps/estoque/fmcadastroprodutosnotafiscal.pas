unit fmcadastroprodutosnotafiscal;

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
  frconsulta, ActnList, ToolWin, cptexto, StrUtils, dmCadastroNotasFiscais,
  AdvEdit, AdvEdBtn, PlannerDatePicker, PlannerDBDatePicker;

type
  TfrmCadastroProdutosNotaFiscal = class(TfrmCadastroPadraoNav)
    pnlFundoJanela: TPanel;
    gbxPreco: TGroupBox;
    edtQuantidade: TDBEditNumero;
    dtxDescricaoProduto: TtecDBText;
    flkCodigoProduto: TtecDBFindLookup;
    gbxProdutos: TGroupBox;
    gbxSelecionar: TGroupBox;
    ckbFiltrarProdutosPorFornecedor: TCheckBox;
    sbnProdutos: TSpeedButton;
    edtPrecoProduto: TDBEditNumero;
    pgcEntrada: TPageControl;
    tstEntradaPedido: TTabSheet;
    tstEntradaNotas: TTabSheet;
    flkPedido: TtecDBFindLookup;
    sbnPedidos: TSpeedButton;
    sbnIncluirProdutosDoPedido: TSpeedButton;
    sbnProcuraserienotafiscalsaida: TSpeedButton;
    flknumeronotafiscalsaida: TtecDBFindLookup;
    sbnGerarnumeronotafiscalsaida: TSpeedButton;
    flkserienotafiscalsaida: TtecDBFindLookup;
    flkfilialnotafiscalsaida: TtecDBFindLookup;
    sbnProcurafilialnotafiscalsaida: TSpeedButton;
    dtxFilial: TtecDBText;
    sbnProcuranumeronotafiscalsaida: TSpeedButton;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    gbxItem: TGroupBox;
    gbxNrPedido: TGroupBox;
    gbxFilial: TGroupBox;
    gbxSerieNF: TGroupBox;
    gbxNumeroNF: TGroupBox;
    gbxDataInicial: TGroupBox;
    gbxDataFinal: TGroupBox;
    gbxQtdeItem: TGroupBox;
    gbxPrecoUnitario: TGroupBox;
    gbxQtxPRECO: TGroupBox;
    gbxTotalmaisIPI: TGroupBox;
    dtxTotalMaisIPI: TtecDBText;
    dtxValorTotalProduto: TtecDBText;
    gbxMoeda: TGroupBox;
    edtValorMoeda: TDBEditNumero;
    sbnProcuraMoedas: TSpeedButton;
    dtxMoeda: TtecDBText;
    gbxNatureza: TGroupBox;
    sbnNaturezaProduto: TSpeedButton;
    dtxNatureza: TtecDBText;
    flkNaturezaProduto: TtecDBFindLookup;
    dtxNaturezaProduto: TtecDBText;
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
    aclHabilitar: TActionList;
    actImpostos: TAction;
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
    DBEditNumero2: TDBEditNumero;
    GroupBox7: TGroupBox;
    DBEditNumero3: TDBEditNumero;
    GroupBox8: TGroupBox;
    DBEditNumero4: TDBEditNumero;
    gbxPISCST: TGroupBox;
    fraConsultaTributacaopis: TfraConsultaCodigo;
    gbxCOFINS: TGroupBox;
    GroupBox11: TGroupBox;
    DBEditNumero7: TDBEditNumero;
    GroupBox12: TGroupBox;
    DBEditNumero8: TDBEditNumero;
    GroupBox13: TGroupBox;
    DBEditNumero9: TDBEditNumero;
    GroupBox16: TGroupBox;
    fraConsultaTributacaoCOFINS: TfraConsultaCodigo;
    sbnGerarTotalPIS: TSpeedButton;
    sbnGerarTotalCOFINS: TSpeedButton;
    gbxDescricaoPreco: TGroupBox;
    dtxDescricaoPreco: TtecDBText;
    dtxPreco: TtecDBText;
    gbxNaturezaOriginal: TGroupBox;
    dtxCFOPDescricaoNfe: TtecDBText;
    dtxDescricaoCFOPNFe: TtecDBText;
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
    dtxCodigoNatureza: TtecDBText;
    gbxNrProdutoTabela: TGroupBox;
    dtxNrProdutoTabela: TtecDBText;
    GroupBox3: TGroupBox;
    tecDBText1: TtecDBText;
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
    pnlTopProdutos: TPanel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    DBEditTextoNrLote: TDBEditTexto;
    PlannerDBDatePickerDAtaFabricacao: TPlannerDBDatePicker;
    PlannerDBDatePickerDataValidade: TPlannerDBDatePicker;
    procedure flkPedidoEnter(Sender: TObject);
    procedure flkCodigoProdutoEnter(Sender: TObject);
    procedure sbnPedidosClick(Sender: TObject);
    procedure sbnProdutosClick(Sender: TObject);
    procedure sbnIncluirProdutosDoPedidoClick(Sender: TObject);
    procedure ckbFiltrarProdutosPorFornecedorClick(Sender: TObject);
    procedure flkPedidoExit(Sender: TObject);
    procedure flkCodigoProdutoMessage(var Msg: String);
    procedure flkserienotafiscalsaidaEnter(Sender: TObject);
    procedure sbnGerarnumeronotafiscalsaidaClick(Sender: TObject);
    procedure sbnProcuraserienotafiscalsaidaClick(Sender: TObject);
    procedure sbnProcurafilialnotafiscalsaidaClick(Sender: TObject);
    procedure flkfilialnotafiscalsaidaEnter(Sender: TObject);
    procedure sbnProcuranumeronotafiscalsaidaClick(Sender: TObject);
    procedure flknumeronotafiscalsaidaEnter(Sender: TObject);
    procedure edfFilialFound(Found: Boolean);
    procedure edfSerieNotaFound(Found: Boolean);
    procedure edfNumeroNotaFound(Found: Boolean);
    procedure edtPrecoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnProximoClick(Sender: TObject);
    procedure sbnAnteriorClick(Sender: TObject);
    procedure sbnPrimeiroClick(Sender: TObject);
    procedure sbnUltimoClick(Sender: TObject);
    procedure edtValorIPIKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnGerarTotalIPIClick(Sender: TObject);
    procedure sbnProcuraMoedasClick(Sender: TObject);
    procedure flkNaturezaProdutoEnter(Sender: TObject);
    procedure sbnNaturezaProdutoClick(Sender: TObject);
//    procedure FormShow(Sender: TObject);
    procedure flkNaturezaProdutoExit(Sender: TObject);
    procedure tstEntradaPedidoMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tstEntradaNotasMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure actImpostosUpdate(Sender: TObject);
    procedure sbnGerarTotalICMSSTClick(Sender: TObject);
    procedure sbnGerarTotalICMSClick(Sender: TObject);
    procedure sbnGerarTotalPISClick(Sender: TObject);
    procedure sbnGerarTotalCOFINSClick(Sender: TObject);
    procedure fraConsultaCSOSN_OU_CST_NFedfCodigoEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure flknumeronotafiscalsaidaFound(Found: Boolean);
    procedure sbnRatearValorTotalProdutosClick(Sender: TObject);
    procedure sbnRatearValorTotalFreteClick(Sender: TObject);
    procedure PlannerDBDatePickerDAtaFabricacaoEnter(Sender: TObject);
    procedure PlannerDBDatePickerDataValidadeEnter(Sender: TObject);
  protected
    dtmCadastroNotasFiscais : tdtmCadastroNotasFiscais;
    TipoProcura: TtecProdutosNotaFiscal;
    fraConsultaMoeda: TfraConsultaCodigo;
    procedure AlterarEstadoBotoesNavegacao; override;
    function  InternoPesquisar(Titulo: String): Integer; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoCancelar: Boolean; override;

    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure NavegarProdutos;
    procedure PosicionarCursor;
  private
    procedure  SetDataModulo (Dtm: TdtmCadastroNotasFiscais);

  public
    constructor Create(AOwner: TComponent; dtm: TdtmCadastroNotasFiscais);  reintroduce;
    destructor Destroy; override;

  end;

var
  frmCadastroProdutosNotaFiscal: TfrmCadastroProdutosNotaFiscal;

implementation

uses
  //CLX
  Windows,
  //Projeto
  fmcadastropadrao, dmbasico;

{$R *.dfm}

{ TfrmCadastroProdutosNotaFiscal }

procedure TfrmCadastroProdutosNotaFiscal.AlterarEstadoBotoesNavegacao;
begin
  inherited;
  flkCodigoProduto.Exist;
end;

procedure TfrmCadastroProdutosNotaFiscal.ckbFiltrarProdutosPorFornecedorClick(Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.ProcurarPorFornecedor := ckbFiltrarProdutosPorFornecedor.Checked
end;

constructor TfrmCadastroProdutosNotaFiscal.Create(AOwner: TComponent; dtm: TdtmCadastroNotasFiscais);
begin
  inherited create(AOwner);
  SetDataModulo(dtm);

  if (dtmCadastroNotasFiscais.RegimeTributario IN [1,4]) then
  begin
    dtxcst_csosn_produto.datafield := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.DataSet.fieldbyname('csosn_produto').FieldName;
    gbx_cst_csosn_produto.Caption := 'CSOSN DO PRODUTO';
  end
  else
  begin
    dtxcst_csosn_produto.datafield := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.DataSet.fieldbyname('cst_produto').FieldName;;
    gbx_cst_csosn_produto.Caption := 'CST DO PRODUTO';
  end;


//  DataSet := dtmCadastroNotasFiscais.TabelaProdutosNotaFiscal;
//  dtmCadastroNotasFiscais.SetarParametroEstado;
//  if flkPedido.CanFocus then
//  flkPedido.SetFocus;
//  edtPreco.ReadOnly := Trim(flkPedido.Text) <> '';
//  dtmCadastroNotasFiscais.Abre(ctTabelas);
  dtmCadastroNotasFiscais.CasasDecimais(edtPrecoProduto);
  ckbFiltrarProdutosPorFornecedor.Enabled := dtmCadastroNotasFiscais.TipoFornecedor = 'F';
  edtDataInicial.Text := DateToStr(PrimeiroDiaMesPassado(1));
  edtDataFinal.Text := DateToStr(DataLocal);

  if dtmCadastroNotasFiscais.qryProcuraNaturezasoperacao.AsString[15]<>'*' then
  begin
    gbxMoeda.Visible := true;
    dtxMoeda.Visible := true;
    fraConsultaMoeda := TfraConsultaCodigo.Create(self);
    fraConsultaMoeda.Name := 'fraConsultaMoeda';
    fraConsultaMoeda.AbrirTabelaProcura := false;
    fraConsultaMoeda.edfCodigo.DataField := 'moeda';
    fraConsultaMoeda.edfCodigo.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
    fraConsultaMoeda.edfCodigo.MaxLength := 10;
    fraConsultaMoeda.edfCodigo.LookupSource := fraconsultamoeda.dsrProcuraMoedas;
    fraConsultaMoeda.edfCodigo.LookupQueryParameter := 'codigo';
    fraConsultaMoeda.edfCodigo.LookupField := 'codigo';
    fraConsultaMoeda.edfCodigo.Operacao := opATRIBUICAO;
    fraConsultaMoeda.AbrirMoedaPadrao := true;
    fraConsultaMoeda.TipoPesquisa := pesMOEDAS;

    dtxMoeda.DataField := 'codigo';
    dtxMoeda.DataSource := fraConsultaMoeda.dsrProcuraMoedas;
  end
  else
  begin
    gbxMoeda.Visible := false;
    dtxMoeda.Visible := false;
  end;


  if (dtmCadastroNotasFiscais.RegimeTributario IN [1,4])  then
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
//    dtmCadastroNotasFiscais.qryProdutosNotaFiscalcsosn.Required := true;
    dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.DataSet.fieldbyname('csosn').Required := true;

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
//    dtmCadastroNotasFiscais.qryProdutosNotaFiscalincidencia.Required := true;
    dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.DataSet.fieldbyname('incidencia').Required := true;
  end;

  fraConsultaCST_OU_CSOSN_EMPRESA.edfCodigo.readonly := true;

//  gbxCSOSN_OU_CST_NF.Visible := not dtmCadastroNotasFiscais.qryNotaFiscalpermitirimprimir.AsBoolean;

  dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.DataSet.fieldbyname('csosn_nf').Required := false;
//  dtmCadastroNotasFiscais.qryProdutosNotaFiscalcsosn_nf.Required := false;
//  dtmCadastroNotasFiscais.qryProdutosNotaFiscalcst_nf.Required := false;
  dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.DataSet.fieldbyname('cst_nf').Required := false;

  if dtmCadastroNotasFiscais.CondicaoCSOSN  then
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
//    dtmCadastroNotasFiscais.qryProdutosNotaFiscalcsosn_nf.Required := not dtmCadastroNotasFiscais.qryNotaFiscalpermitirimprimir.AsBoolean;
    dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.DataSet.fieldbyname('csosn_nf').Required := not dtmCadastroNotasFiscais.qryNotaFiscalpermitirimprimir.AsBoolean;

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
//    dtmCadastroNotasFiscais.qryProdutosNotaFiscalcst_nf.Required := not dtmCadastroNotasFiscais.qryNotaFiscalpermitirimprimir.AsBoolean;
    dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.DataSet.fieldbyname('cst_nf').Required := not dtmCadastroNotasFiscais.qryNotaFiscalpermitirimprimir.AsBoolean;

  end;

//  gbxCSOSN.Visible := dtmCadastroNotasFiscais.CondicaoCSOSN;

  fraConsultaIPICST.TipoPesquisa := pesTRIBUTOSIPI;
  fraConsultaIPICST_NF.TipoPesquisa := pesTRIBUTOSIPI;


  fraConsultaTributacaopis.TipoPesquisa := pesTRIBUTOSPIS;
  fraConsultaTributacaoCOFINS.TipoPesquisa := pesTRIBUTOSCOFINS;

//  fraConsultaTributacaoICMS.edfCodigo.ReadOnly  := true;
//  fraConsultaTributacaoIpi.edfCodigo.ReadOnly  := true;
//  fraConsultaTributacaopis.edfCodigo.ReadOnly  := true;
//  fraConsultaTributacaoCOFINS.edfCodigo.ReadOnly  := true;


  pgcImpostos.ActivePage := tstImpostosFechamentoNF;

  dtmCadastroNotasFiscais.qryProcuraPedidosNotaFiscal.parambyname('PesquisaNFE').asBoolean := false;
  dtmCadastroNotasFiscais.qryConsultaPedidosNotaFiscal.parambyname('PesquisaNFE').asBoolean := false;

  fraConsultaUnidadeNF.TipoPesquisa := pesUNIDADES;

end;

function TfrmCadastroProdutosNotaFiscal.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  case TipoProcura of
    dnfPedido : Result := dtmCadastroNotasFiscais.ExistePedidoNotaFiscal(NomeCampo, Value);
    dnfProduto: Result := dtmCadastroNotasFiscais.ExisteProdutoNotaFiscal(NomeCampo, Value);
    dnfFILIAL : Result := dtmCadastroNotasFiscais.ExisteFilial(NomeCampo, Value);
    dnfSERIE  : result := dtmCadastroNotasFiscais.ExisteSerie(NomeCampo, Value);
    dnfNOTAFISCAL : result := dtmCadastroNotasFiscais.ExisteNotaFiscalProduto(NomeCampo, Value);
    dnfNATUREZA : Result := dtmCadastroNotasFiscais.ExisteNatureza(NomeCampo, Value);

  else
    Result := False;
  end
end;

procedure TfrmCadastroProdutosNotaFiscal.flkPedidoEnter(Sender: TObject);
begin
  inherited;
  TipoProcura := dnfPedido
end;

procedure TfrmCadastroProdutosNotaFiscal.flkPedidoExit(Sender: TObject);
begin
  inherited;
  if flkPedido.Text <> '' then
    ckbFiltrarProdutosPorFornecedor.Checked := False;
//  edtPreco.ReadOnly := Trim(flkPedido.Text) <> '';
end;

procedure TfrmCadastroProdutosNotaFiscal.flkCodigoProdutoEnter(Sender: TObject);
begin
  inherited;
  TipoProcura := dnfProduto
end;

procedure TfrmCadastroProdutosNotaFiscal.flkCodigoProdutoMessage(var Msg: String);
begin
  inherited;
  Msg := Copy(Msg, 1, Length(Msg) - 1) + ' ou esta incluído na nota.';

end;

function TfrmCadastroProdutosNotaFiscal.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
    dtmCadastroNotasFiscais.ExcluirProdutosNotaFiscal;
  if not sbnIncluir.Visible then
    ModalResult := mrOk;
end;

function TfrmCadastroProdutosNotaFiscal.InternoGravar: Boolean;
begin
  result := inherited InternoGravar;
{  if (ActiveControl is TtecFindCustom) and
     (TtecFindCustom(ActiveControl).text <> '') then
    Result:= TtecFindCustom(ActiveControl).Exist;
}
  if Result then
  begin
    if assigned(fraConsultaMoeda) then

//      dtmCadastroNotasFiscais.qryProdutosNotaFiscalmoeda.AsString := fraConsultaMoeda.qryProcuraMoedascodigo.asstring;
      dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.DataSet.fieldbyname('moeda').asString := fraConsultaMoeda.qryProcuraMoedas.FieldByName('codigo').asstring;

    Result  := dtmCadastroNotasFiscais.GravarProdutosNotaFiscal;
//    if result then
      if dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.DataSet =
         dtmCadastroNotasFiscais.qryProdutosNotaFiscal then
        if dtmCadastroNotasFiscais.gravarnotaparcial then
          dtmCadastroNotasFiscais.qrynotafiscal.Edit;
  end;

  if not sbnIncluir.Visible then
    ModalResult := mrOk;
  Self.BringToFront;

  if dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.DataSet =
           dtmCadastroNotasFiscais.qryProdutosNotaFiscal then
  begin
    flkCodigoProduto.SetFocus;
    flkCodigoProduto.SelectAll;
  end;  
end;

function TfrmCadastroProdutosNotaFiscal.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    dtmCadastroNotasFiscais.IncluirProdutosNotaFiscal(False);
    flkNaturezaProduto.Exist;
    PosicionarCursor;
  end;
end;

function TfrmCadastroProdutosNotaFiscal.InternoPesquisar(Titulo: String): Integer;
var
  PesquisaReferencia: Boolean;
  Tit: String;
begin
{
  PesquisaReferencia := ((ActiveControl is TtecDBFindLookup) or
                         (ActiveControl is TtecDbEditFind)) and CtrlOn;
}
  PesquisaReferencia := (TipoProcura in [dnfPedido, dnfProduto, dnfFILIAL, dnfSERIE, dnfNOTAFISCAL, dnfNATUREZA]);

  if PesquisaReferencia then
  begin
    case TipoProcura of
      dnfPedido: begin
                   if not dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('pedido').ReadOnly then
                   begin
                     Titulo := Format(ctPEDIDOSFORNECEDORES, ['(' + dtmCadastroNotasFiscais.NomeFornecedor + ')']);
                     dtmCadastroNotasFiscais.qryConsultaPedidosNotaFiscal.close;
                     dtmCadastroNotasFiscais.qryConsultaPedidosNotaFiscal.Open;
                   end
                   else
                     PesquisaReferencia := false;
                 end;
      dnfProduto: begin
                    if not dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('produto').ReadOnly then
                    begin
                      if ckbFiltrarProdutosPorFornecedor.Checked then
                        Tit := '(' + dtmCadastroNotasFiscais.NomeFornecedor + ')'
                      else
                        Tit := '';
                      Titulo := Format(ctPRODUTOSFORNECEDORES, [Tit]);
                      dtmCadastroNotasFiscais.AbreTabelaConsultaProdutosNotaFiscal(ckbFiltrarProdutosPorFornecedor.Checked,
                                              Trim(flkPedido.Text) <> '',
                                              (dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('dadofiscal').AsInteger <> 0));
                    end
                    else
                      PesquisaReferencia := false;
                  end;

      dnfFILIAL: begin
                   if not dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('CodigoNota').ReadOnly and
                      not flkfilialnotafiscalsaida.ReadOnly then
                     dtmCadastroNotasFiscais.Abre(ctTabelaConsultaFiliais)
                   else
                     PesquisaReferencia := false;
                 end;

      dnfserie: begin
                  if (not dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('CodigoNota').ReadOnly) and
                     (not flkserienotafiscalsaida.readonly) then
                    dtmCadastroNotasFiscais.Abre(ctTabelaConsultaSerie)
                  else
                    PesquisaReferencia := false;
                end;
      dnfNOTAFISCAL : begin
                        if (not dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('CodigoNota').ReadOnly) and
                           (not flknumeronotafiscalsaida.readonly) then
                        begin
                          dtmCadastroNotasFiscais.DataInicialNotaProduto := edtDataInicial.Text;
                          dtmCadastroNotasFiscais.DataFinalNotaProduto := edtDataFinal.Text;
                          dtmCadastroNotasFiscais.Abre(ctTabelaConsultaNotasFiscais);
                        end
                        else
                          PesquisaReferencia := false;
                      end;

      dnfNATUREZA : begin
                      if not dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('codigofiscal').ReadOnly then
                        dtmCadastroNotasFiscais.abreConsultaNaturezaProduto
                      else
                        PesquisaReferencia := false;
                    end
    end;
  end;

  if PesquisaReferencia then  begin
    Result := inherited InternoPesquisar(Titulo);
    if Result = mrOK then
      case TipoProcura of
        dnfPedido: dtmCadastroNotasFiscais.SelecionarPedidoNotaFiscal;
        dnfProduto: dtmCadastroNotasFiscais.SelecionarProdutoNotaFiscal;
        dnfFILIAL: dtmCadastroNotasFiscais.SelecionarFilial;
        dnfSERIE:  dtmCadastroNotasFiscais.SelecionarSerie;
        dnfNOTAFISCAL : dtmCadastroNotasFiscais.SelecionarNotaFiscalProduto;
        dnfNATUREZA : dtmCadastroNotasFiscais.SelecionarNaturezaProduto;
      end;

    case TipoProcura of
      dnfPedido: dtmCadastroNotasFiscais.Fecha(ctTabelaConsultaPedidosNotaFiscal);
      dnfProduto: dtmCadastroNotasFiscais.FechaTabelaConsultaProdutosNotafiscal;
      dnfFILIAL: dtmCadastroNotasFiscais.fecha(ctTabelaConsultaFiliais);
      dnfSERIE: dtmCadastroNotasFiscais.fecha(ctTabelaConsultaSerie);
      dnfNOTAFISCAL : dtmCadastroNotasFiscais.fecha(ctTabelaConsultaNotasFiscais);
      dnfNATUREZA : dtmCadastroNotasFiscais.fechaConsultaNaturezaProduto
    end;
  end else
    Result := mrNone
end;

function TfrmCadastroProdutosNotaFiscal.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := TipoProcura <> dnfProduto;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

procedure TfrmCadastroProdutosNotaFiscal.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and (Key = VK_P) then
  begin
    sbnIncluirProdutosDoPedidoClick(nil);
    PosicionarCursor
  end
  else
  if (Shift = [ssCtrl]) and (Key = VK_I) then
  begin
    sbnGerarTotalIPIClick(nil);
    edtValorIPI.SetFocus;
    edtValorIPI.SelectAll;
  end
  else
  if (Shift = [ssCtrl]) and
     (ActiveControl = edtValorMoeda) and (key = VK_F9) then
    InternoPesquisar(ctMOEDA);

end;

procedure TfrmCadastroProdutosNotaFiscal.sbnIncluirProdutosDoPedidoClick(Sender: TObject);
begin
  inherited;
  if flkPedido.Exist then
    dtmCadastroNotasFiscais.IncluirProdutosDoPedido;
  Self.BringToFront;
end;

procedure TfrmCadastroProdutosNotaFiscal.sbnPedidosClick(Sender: TObject);
begin
  inherited;
  flkPedido.SetFocus;
  CtrlOn := True;
  InternoPesquisar('')
end;

procedure TfrmCadastroProdutosNotaFiscal.sbnProdutosClick(Sender: TObject);
begin
  inherited;
  PosicionarCursor;
  CtrlOn := True;
  InternoPesquisar('')
end;

function TfrmCadastroProdutosNotaFiscal.TabelaDePesquisa: TZDataSet;
begin
  case TipoProcura of
    dnfPedido:  Result := dtmCadastroNotasFiscais.TabelaConsultaPedidosNotaFiscal;
    dnfProduto: Result := dtmCadastroNotasFiscais.TabelaConsultaProdutosNotaFiscal;
    dnfFILIAL: result := dtmCadastroNotasFiscais.TabelaConsultaFilial;
    dnfserie: Result := dtmCadastroNotasFiscais.TabelaConsultaSerieFilial;
    dnfNOTAFISCAL: result := dtmCadastroNotasFiscais.TabelaConsultaNotasProdutos;
    dnfNATUREZA : Result := dtmCadastroNotasFiscais.TabelaConsultaNaturezaOperacao;
  else
    Result := nil;
  end
end;

procedure TfrmCadastroProdutosNotaFiscal.flkserienotafiscalsaidaEnter(
  Sender: TObject);
begin
  inherited;
  TipoProcura := dnfSERIE;
end;

procedure TfrmCadastroProdutosNotaFiscal.sbnGerarnumeronotafiscalsaidaClick(
  Sender: TObject);
begin
  inherited;
  if flknumeronotafiscalsaida.Exist then
    dtmCadastroNotasFiscais.IncluirProdutosDaNota;
  Self.BringToFront;
end;

procedure TfrmCadastroProdutosNotaFiscal.sbnProcuraserienotafiscalsaidaClick(Sender: TObject);
begin
  inherited;
  flkserienotafiscalsaida.setfocus;
  CtrlOn := True;
  InternoPesquisar(flkserienotafiscalsaida, ctSERIES)
end;

procedure TfrmCadastroProdutosNotaFiscal.sbnProcurafilialnotafiscalsaidaClick(Sender: TObject);
begin
  inherited;
  flkfilialnotafiscalsaida.setfocus;
  CtrlOn := True;
  InternoPesquisar(flkfilialnotafiscalsaida, ctFILIAL)
end;

procedure TfrmCadastroProdutosNotaFiscal.flkfilialnotafiscalsaidaEnter(Sender: TObject);
begin
  inherited;
  TipoProcura := dnfFILIAL;
end;

procedure TfrmCadastroProdutosNotaFiscal.sbnProcuranumeronotafiscalsaidaClick(
  Sender: TObject);
begin
  inherited;
  flknumeronotafiscalsaida.setfocus;
  CtrlOn := True;
  InternoPesquisar(flknumeronotafiscalsaida, ctNOTASFISCAIS)
end;

procedure TfrmCadastroProdutosNotaFiscal.flknumeronotafiscalsaidaEnter(
  Sender: TObject);
begin
  inherited;
  TipoProcura := dnfNOTAFISCAL;
end;

procedure TfrmCadastroProdutosNotaFiscal.edfFilialFound(Found: Boolean);
begin
  inherited;
  if not found then
  begin
    flkfilialnotafiscalsaida.Text := '';
    flkserienotafiscalsaida.Text := '';
    flknumeronotafiscalsaida.Text := '';
  end;
end;

procedure TfrmCadastroProdutosNotaFiscal.edfSerieNotaFound(Found: Boolean);
begin
  inherited;
  if not found then
  begin
   flkserienotafiscalsaida.Text := '';
   flknumeronotafiscalsaida.Text := '';
  end;
end;

procedure TfrmCadastroProdutosNotaFiscal.edfNumeroNotaFound(
  Found: Boolean);
begin
  inherited;
  if not found then
    flknumeronotafiscalsaida.Text := '';
end;

destructor TfrmCadastroProdutosNotaFiscal.Destroy;
begin
  inherited;
  frmCadastroProdutosNotaFiscal := nil;
end;

procedure TfrmCadastroProdutosNotaFiscal.edtPrecoProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if TeclaEnterOuReturn(Key) and (Shift = []) then
  begin
//    dtmCadastroNotasFiscais.VerificarValoresDosProdutos(false);
//    dtmCadastroNotasFiscais.AtualizarPrecoVenda(true);
    edtValorMoeda.SelectAll;
  end;
end;

procedure TfrmCadastroProdutosNotaFiscal.sbnProximoClick(Sender: TObject);
begin
  NavegarProdutos;
  inherited;
end;

procedure TfrmCadastroProdutosNotaFiscal.sbnAnteriorClick(Sender: TObject);
begin
  NavegarProdutos;
  inherited;
end;

procedure TfrmCadastroProdutosNotaFiscal.sbnPrimeiroClick(Sender: TObject);
begin
  NavegarProdutos;
  inherited;
end;

procedure TfrmCadastroProdutosNotaFiscal.sbnUltimoClick(Sender: TObject);
begin
  NavegarProdutos;
  inherited;
end;

procedure TfrmCadastroProdutosNotaFiscal.NavegarProdutos;
begin
{
  with dtmCadastroNotasFiscais do
    IncluirProdutosNotaFiscal(false);
    }
end;

procedure TfrmCadastroProdutosNotaFiscal.edtValorIPIKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if TeclaEnterOuReturn(Key) and (Shift = []) then
  begin
    InternoGravar;
    PosicionarCursor;
  end;
end;

procedure TfrmCadastroProdutosNotaFiscal.sbnGerarTotalIPIClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.CalcularValorTotalItemProduto(ipi);
end;

procedure TfrmCadastroProdutosNotaFiscal.PosicionarCursor;
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

procedure TfrmCadastroProdutosNotaFiscal.sbnProcuraMoedasClick(
  Sender: TObject);
begin
  inherited;
  fraConsultaMoeda.InternoPesquisar(ctMOEDA);
  edtValorMoeda.SetFocus;
  edtValorMoeda.SelectAll;

end;

procedure TfrmCadastroProdutosNotaFiscal.flkNaturezaProdutoEnter(
  Sender: TObject);
begin
  inherited;
  TipoProcura := dnfNATUREZA;
end;

procedure TfrmCadastroProdutosNotaFiscal.sbnNaturezaProdutoClick(
  Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  flkNaturezaProduto.SetFocus;
  InternoPesquisar('')
end;
{
procedure TfrmCadastroProdutosNotaFiscal.FormShow(Sender: TObject);
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
procedure TfrmCadastroProdutosNotaFiscal.flkNaturezaProdutoExit(
  Sender: TObject);
begin
  inherited;
  if dtmCadastroNotasFiscais.QuantidadeNaturezasProduto then
    InternoPesquisar(flkNaturezaProduto,ctCODIGOFISCAL);
end;

procedure TfrmCadastroProdutosNotaFiscal.tstEntradaPedidoMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if pgcEntrada.Style <> tsTabs then
    if Button <> mbMiddle then
      inherited;
end;

procedure TfrmCadastroProdutosNotaFiscal.tstEntradaNotasMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if pgcEntrada.Style <> tsTabs then
    if Button <> mbMiddle then
      inherited;

end;

procedure TfrmCadastroProdutosNotaFiscal.actImpostosUpdate(
  Sender: TObject);
var
  vIPIReadOnly : Boolean;
  vSomenteLeitura : Boolean;
  vSomenteLeituraNotaEntrada : boolean;
  vCondicaoDevolucao_CST60 : boolean;

begin
  inherited;

  vSomenteLeitura := dtmCadastroNotasFiscais.notacancelada or
                     dtmCadastroNotasFiscais.SomenteLeituraProdutos or
                     dtmCadastroNotasFiscais.IncluindoViaXml or
                     dtmCadastroNotasFiscais.IncluidoViaXml;


  sbnIncluir.enabled := not vSomenteLeitura and not sbnSalvar.Enabled;

  sbnExcluir.Enabled := not vSomenteLeitura;
//  sbnNaturezaProduto.Enabled := not vSomenteLeitura;
  sbnProcurafilialnotafiscalsaida.Enabled := not vSomenteLeitura;
//  sbnSerie.Enabled := not vSomenteLeitura;
//  sbnnumeronota.Enabled := not vSomenteLeitura;
  sbnPedidos.Enabled := not vSomenteLeitura;
  sbnProdutos.Enabled := not vSomenteLeitura;
//  sbnIncluirProdutosDaNota.Enabled := not vSomenteLeitura;
  sbnProcuraMoedas.Enabled := not vSomenteLeitura;
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
  sbnIncluirProdutosDoPedido.Enabled := not vSomenteLeitura;

  if dtmCadastroNotasFiscais.qryNotaFiscalpermitirimprimir.AsBoolean then
    vIPIReadOnly := not (dtmCadastroNotasFiscais.ContribIPI or dtmCadastroNotasFiscais.qryProcuranaturezasdestacaripi.AsBoolean)
                    and dtmCadastroNotasFiscais.CondicaoIPI(dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('ipicst').AsString)
  else
    vIPIReadOnly :=  not dtmCadastroNotasFiscais.CondicaoIPI(dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('ipicst').AsString);

  edtValorIPI.ReadOnly := {vSomenteLeitura or} vIPIReadOnly;
  edtIPI.ReadOnly := {vSomenteLeitura or} vIPIReadOnly;
  edtBaseCalculoIPI.ReadOnly := {vSomenteLeitura or} vIPIReadOnly;

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

  edtPRedBC.ReadOnly := vSomenteLeitura or not dtmCadastroNotasFiscais.CondicaoPRedBC(dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('cst_nf').asstring,
                                                                   dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('csosn_nf').asstring,
                                                                   dtmCadastroNotasFiscais.qrynotafiscalcrt.asinteger);
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

  edtBaseICMS.ReadOnly := vSomenteLeitura or not dtmCadastroNotasFiscais.CondicaoBaseICMS(
                                                                   ifthen(dtmCadastroNotasFiscais.qryNotaFiscalpermitirimprimir.AsBoolean,
                                                                     dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('incidencia').asstring,
                                                                     dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('cst_nf').asstring),

                                                                   ifthen(dtmCadastroNotasFiscais.qryNotaFiscalpermitirimprimir.AsBoolean,
                                                                     dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('csosn').asstring,
                                                                     dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('csosn_nf').asstring),

                                                                     dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('csosn_produto').asstring,

                                                                   dtmCadastroNotasFiscais.qrynotafiscalcrt.asinteger, false);

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

  edtpcredsn.ReadOnly := vSomenteLeitura or not dtmCadastroNotasFiscais.Condicaopcredsn(dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('csosn_nf').asstring,
                                                                     dtmCadastroNotasFiscais.qrynotafiscalcrt.asinteger);

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

  edtpMVAST.ReadOnly := vSomenteLeitura or not dtmCadastroNotasFiscais.CondicaopMVAST(

                                                                   ifthen(dtmCadastroNotasFiscais.qryNotaFiscalpermitirimprimir.AsBoolean,
                                                                     dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('incidencia').asstring,
                                                                     dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('cst_nf').asstring),

                                                                   ifthen(dtmCadastroNotasFiscais.qryNotaFiscalpermitirimprimir.AsBoolean,
                                                                     dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('csosn').asstring,
                                                                     dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('csosn_nf').asstring),

                                                                   dtmCadastroNotasFiscais.qrynotafiscalcrt.asinteger{,'J',false});

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

  if dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('valoricmsdigitado').AsBoolean then
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


  if dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('descontodigitado').AsBoolean then
    gbxDescontoProduto.Font.Color := clRed
  else
    gbxDescontoProduto.Font.Color := clBlack;


  if dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('fretedigitado').AsBoolean then
    gbxFreteProduto.Font.Color := clRed
  else
    gbxFreteProduto.Font.Color := clBlack;

  if dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('valoricmsstdigitado').AsBoolean then
    gbxICMSSubstTrib.font.Color := clRed
  else
    gbxICMSSubstTrib.font.Color := clBlack;

  if dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('valoripidigitado').AsBoolean then
    gbxIPI.Font.Color := clRed
  else gbxIPI.Font.Color := clBlack;

  if dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('valorpisdigitado').AsBoolean then
    gbxPIS.Font.Color := clRed
  else gbxPIS.Font.Color := clBlack;

  if dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('valorcofinsdigitado').AsBoolean then
    gbxCOFINS.Font.Color := clRed
  else gbxCOFINS.Font.Color := clBlack;


  vSomenteLeituraNotaEntrada := flkCodigoProduto.DataSource.DataSet.FieldByName(flkCodigoProduto.DataField).ReadOnly or
                                ({dtmCadastroNotasFiscais.qryNotaFiscalrequernfsaida.AsBoolean and}  (flkCodigoProduto.Text<>''));

  sbnProcurafilialnotafiscalsaida.Enabled := not vSomenteLeituraNotaEntrada;
  flkfilialnotafiscalsaida.readonly := vSomenteLeituraNotaEntrada;
  flkfilialnotafiscalsaida.tabstop := not vSomenteLeituraNotaEntrada;

  sbnProcuraserienotafiscalsaida.Enabled := not vSomenteLeituraNotaEntrada;
  flkserienotafiscalsaida.readonly := vSomenteLeituraNotaEntrada;
  flkserienotafiscalsaida.tabstop := not vSomenteLeituraNotaEntrada;

  sbnGerarnumeronotafiscalsaida.Enabled := not vSomenteLeituraNotaEntrada;
  sbnProcuranumeronotafiscalsaida.Enabled := not vSomenteLeituraNotaEntrada;
  flknumeronotafiscalsaida.readonly := vSomenteLeituraNotaEntrada;
  flknumeronotafiscalsaida.tabstop := not vSomenteLeituraNotaEntrada;


  if dtmCadastroNotasFiscais.qryNotaFiscalrequernfsaida.AsBoolean then
  begin
    gbxItem.Enabled := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('dadofiscal').AsInteger<>0;
    gbxPreco.Enabled := gbxItem.Enabled;
  end;

  if flkfilialnotafiscalsaida.focused and
     flkfilialnotafiscalsaida.readonly then
   flkCodigoProduto.setfocus;

   if dtmCadastroNotasFiscais.qryNotaFiscalpermitirimprimir.AsBoolean and
    (dtmCadastroNotasFiscais.eHNotaFiscalEntradaDevolucao(dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('codigofiscal').Asinteger))  
    and dtmCadastroNotasFiscais.CondicaoICMSSTDEVOLUCAO_CST60(dtmCadastroNotasFiscais.ValorSituacaoTributaria(dtmCadastroNotasFiscais.qryProdutosNotaFiscal),true, 'J', false) then
    vCondicaoDevolucao_CST60 := True
  else
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


end;

procedure TfrmCadastroProdutosNotaFiscal.sbnGerarTotalICMSSTClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.CalcularValorTotalItemProduto(icmsst);
end;

procedure TfrmCadastroProdutosNotaFiscal.sbnGerarTotalICMSClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.CalcularValorTotalItemProduto(icms);
end;

procedure TfrmCadastroProdutosNotaFiscal.sbnGerarTotalPISClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.CalcularValorTotalItemProduto(pis);
end;

procedure TfrmCadastroProdutosNotaFiscal.sbnGerarTotalCOFINSClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.CalcularValorTotalItemProduto(cofins);
end;

procedure TfrmCadastroProdutosNotaFiscal.fraConsultaCSOSN_OU_CST_NFedfCodigoEnter(
  Sender: TObject);
begin
  inherited;
  if dtmCadastroNotasFiscais.CondicaoCSOSN then
    tipoprocura := dnfCSOSN
  else
    tipoprocura := dnfCSTICMS;
end;

procedure TfrmCadastroProdutosNotaFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dtmCadastroNotasFiscais.qryProcuraPedidosNotaFiscal.parambyname('PesquisaNFE').asBoolean := true;
  dtmCadastroNotasFiscais.qryConsultaPedidosNotaFiscal.parambyname('PesquisaNFE').asBoolean := true;
end;

procedure TfrmCadastroProdutosNotaFiscal.flknumeronotafiscalsaidaFound(
  Found: Boolean);
begin
  inherited;
  if found then
  begin
    dtmCadastroNotasFiscais.dadofiscalnotafiscalsaida := flknumeronotafiscalsaida.LookupSource.DataSet.fieldbyname('dadofiscal').Asinteger;

    flkCodigoProduto.clear;
    edtPrecoProduto.clear;
    dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('quantidade').AsCurrency := 1;
    dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('produto').Clear;
    dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('produtovisual').Clear;
    dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('precounitario').Clear;

    actImpostosUpdate(nil);
    if edtQuantidade.CanFocus then
    begin
      edtQuantidade.SetFocus;
      edtQuantidade.SelectAll;
    end;
  end
  else
  begin
    dtmCadastroNotasFiscais.dadofiscalnotafiscalsaida := 0;
    if dtmCadastroNotasFiscais.qryNotaFiscalrequernfsaida.AsBoolean then
    begin
      dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('quantidade').AsCurrency := 1;
      dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('produto').Clear;
      dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('produtovisual').Clear;
      dtmCadastroNotasFiscais.dsrProdutosNotaFiscal.dataset.fieldbyname('precounitario').Clear;
    end;
  end;


end;

procedure TfrmCadastroProdutosNotaFiscal.sbnRatearValorTotalProdutosClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.RatearDesconto;
end;

procedure TfrmCadastroProdutosNotaFiscal.sbnRatearValorTotalFreteClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroNotasFiscais.RatearFrete;
end;

procedure TfrmCadastroProdutosNotaFiscal.SetDataModulo(
  Dtm: TdtmCadastroNotasFiscais);
begin

  dtmCadastroNotasFiscais := Dtm;

  edtQuantidade.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtPrecoProduto.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  dtxValorTotalProduto.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  dtxTotalMaisIPI.DataSource :=dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtValorMoeda.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  DBEditNumero1.DataSource := dtmCadastroNotasFiscais.dsrNotaFiscal;
  edtBaseICMSNota.DataSource := dtmCadastroNotasFiscais.dsrNotaFiscal;
  edtValorICMSNota.DataSource := dtmCadastroNotasFiscais.dsrNotaFiscal;
  edtBaseICMSSubstituicao.DataSource := dtmCadastroNotasFiscais.dsrNotaFiscal;
  edtValorICMSSubstituicao.DataSource := dtmCadastroNotasFiscais.dsrNotaFiscal;
  edtValordoIPINF.DataSource := dtmCadastroNotasFiscais.dsrNotaFiscal;
  edtValor.DataSource := dtmCadastroNotasFiscais.dsrNotaFiscal;
  edtBaseSTRetAnt.DataSource := dtmCadastroNotasFiscais.dsrNotaFiscal;
  edtValorSTRetAnt.DataSource := dtmCadastroNotasFiscais.dsrNotaFiscal;
  fraConsultaCSOSN_OU_CST_NF.edfCodigo.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  fraConsultaCST_OU_CSOSN_EMPRESA.edfCodigo.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtBaseICMS.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtPRedBC.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtRedBC.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtPICMS.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtVlICMS.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtvcredicmssn.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtpcredsn.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtBaseICMSST.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtVlICMSST.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtpredbcst.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtvalorreducaobasest.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtaliquotaicmsst.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtpMVAST.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  fraConsultaIPICST_NF.edfCodigo.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  fraConsultaIPICST.edfCodigo.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtValorIPI.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtBaseCalculoIPI.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtIPI.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  DBEditNumero2.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  DBEditNumero3.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  DBEditNumero4.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  fraConsultaTributacaopis.edfCodigo.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  DBEditNumero7.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  DBEditNumero8.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  DBEditNumero9.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  fraConsultaTributacaoCOFINS.edfCodigo.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtDescontoProduto.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  DBEditNumero5.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtValorLiquidoProduto.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtFrete.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  fraConsultaUnidadeNF.edfCodigo.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtFatorConsersao.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  dtxUnidadeEstoque.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  dtxDescricaoUnidadeEstoque.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  edtQtdeEstoque.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  flkPedido.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  flkPedido.LookupSource := dtmCadastroNotasFiscais.dsrProcuraPedidosNotaFiscal;
  tecDBText1.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  dtxFilial.DataSource := dtmCadastroNotasFiscais.dsrProcuraFiliais;
  flkfilialnotafiscalsaida.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  flkfilialnotafiscalsaida.LookupSource := dtmCadastroNotasFiscais.dsrProcuraFiliais;
  flkserienotafiscalsaida.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  flkserienotafiscalsaida.LookupSource := dtmCadastroNotasFiscais.dsrProcuraSerieFiliais;
  flknumeronotafiscalsaida.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  flknumeronotafiscalsaida.LookupSource := dtmCadastroNotasFiscais.dsrProcuraNotaFiscalProduto;
  dtxNrProdutoTabela.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  dtxDescricaoProduto.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  flkCodigoProduto.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  flkCodigoProduto.LookupSource := dtmCadastroNotasFiscais.dsrProcuraProdutoNotaFiscal;
  dtxNCM.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  dtxDescricaoPreco.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  dtxPreco.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  dtxcst_csosn_produto.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  dtxNatureza.DataSource := dtmCadastroNotasFiscais.dsrProcuraNaturezasProduto;
  flkNaturezaProduto.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  flkNaturezaProduto.LookupSource := dtmCadastroNotasFiscais.dsrProcuraNaturezasProduto;
  dtxNaturezaProduto.DataSource := dtmCadastroNotasFiscais.dsrProcuraNaturezasProduto;
  dtxCodigoNatureza.DataSource := dtmCadastroNotasFiscais.dsrProcuraNaturezasProduto;
  dtxCFOPDescricaoNfe.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotasPagNFE;
  dtxDescricaoCFOPNFe.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotasPagNFE;
  DBEditTextoNrLote.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  PlannerDBDatePickerDAtaFabricacao.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
  PlannerDBDatePickerDataValidade.DataSource := dtmCadastroNotasFiscais.dsrProdutosNotaFiscal;
end;

function TfrmCadastroProdutosNotaFiscal.InternoCancelar: Boolean;
begin
  Result:= inherited InternoCancelar;
  if Result then
    dtmCadastroNotasFiscais.CancelarProdutosNotaFiscal_;
end;

procedure TfrmCadastroProdutosNotaFiscal.PlannerDBDatePickerDAtaFabricacaoEnter(
  Sender: TObject);
begin
  inherited;
  if not dtmCadastroNotasFiscais.qryProdutosNotaFiscalvalidade.isnull then
  begin
    PlannerDBDatePickerDAtaFabricacao.calendar.maxdate.use := true;
    PlannerDBDatePickerDAtaFabricacao.calendar.maxdate.date :=
      dtmCadastroNotasFiscais.qryProdutosNotaFiscalvalidade.asDatetime;
  end
  else
    PlannerDBDatePickerDAtaFabricacao.calendar.maxdate.use := false;

end;

procedure TfrmCadastroProdutosNotaFiscal.PlannerDBDatePickerDataValidadeEnter(
  Sender: TObject);
begin
  inherited;

  if not dtmCadastroNotasFiscais.qryProdutosNotaFiscalfabricacao.isnull then
  begin
    PlannerDBDatePickerDataValidade.calendar.mindate.use := true;
    PlannerDBDatePickerDataValidade.calendar.mindate.date :=
      dtmCadastroNotasFiscais.qryProdutosNotaFiscalfabricacao.asDatetime;
  end
  else
    PlannerDBDatePickerDataValidade.calendar.mindate.use := false;
end;

end.
