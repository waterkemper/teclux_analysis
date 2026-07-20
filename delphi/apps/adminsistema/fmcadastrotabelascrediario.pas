unit fmcadastrotabelascrediario;

interface

uses
  {$IFDEF MSWINDOWS} FileCtrl, {$ENDIF} Dialogs, Forms,
  DBCtrls, StdCtrls, ExtCtrls, DBGrids, Mask, Controls, ComCtrls,
  Buttons, SysUtils, Classes, Variants, Graphics, fmcadastropadrao,
  ActnList, frconsultacontabil, frconsultacodigocontabil, frconsulta,
  frconsultacodigo, Windows, cpdbfindcontrols, cpdbtext, CheckLst, cpdbradiogroup,
  cptexto, Grids, cpdbgrid, cpnumero, cpdbdata, cppagecontrol, ToolWin, Types, Menus, {Qete}
  // Biblio
  ctconstantes, Biblio, clusuario,
  // Componentes
  cpfone, cpcpf, cpdocumento, cpdata, clparametrossistema,
  // Terceiros
  ZQuery, ComObj,
  // Repositorio
  fmconsultabasica, fmconsultaporcampo, frendereco,
  frenderecoeditor, dmconsultaenderecos, frtelefone,
  frcomissao, DB, dmcadastrotabelascrediario, fmprogresso, cpdbmemo,
  AdvObj, BaseGrid, AdvGrid, DBAdvGrid, AdvPageControl;

type
  TfrmCadastroTabelasCrediario = class(TfrmCadastroPadrao)
    pgcTabelas: TtecPageControl;
    tstAgentes: TTabSheet;
    tstCargos: TTabSheet;
    tstConceitos: TTabSheet;
    tstMotivos: TTabSheet;
    tstTiposPlanos: TTabSheet;
    tstTiposCartas: TTabSheet;
    edfCodigoAgente: TtecDbEditFind;
    edtDescricaoAgente: TDBEditTexto;
    edfCodigoCargo: TtecDbEditFind;
    edtDescricaoCargo: TDBEditTexto;
    edtPontos: TDBEditNumero;
    edtRenda: TDBEditNumero;
    edfCodigoConceito: TtecDbEditFind;
    edtDescricaoConceito: TDBEditTexto;
    ckbRestricoes: TDBCheckBox;
    edfCodigoMotivo: TtecDbEditFind;
    edtDescricaoMotivo: TDBEditTexto;
    edfCodigoTipoPlano: TtecDbEditFind;
    edtDescricaoTipoPlano: TDBEditTexto;
    edfCodigoTipoCarta: TtecDbEditFind;
    edtDescricaoTipoCarta: TDBEditTexto;
    edtInativoAgente: TDBEditData;
    tstNaturezas: TTabSheet;
    edfCodigoNatureza: TtecDbEditFind;
    edtDescricaoNatureza: TDBEditTexto;
    edtInativoNatureza: TDBEditData;
    edtInativoCargo: TDBEditData;
    edtInativoConceito: TDBEditData;
    edtInativoMotivo: TDBEditData;
    pnlFundoJanela: TPanel;
    rgpTipo: TtecDBRadioGroup;
    rbnMalaDireta: TtecRadioButton;
    rbnAviso: TtecRadioButton;
    rbnSPC: TtecRadioButton;
    flkCodigosFiscais: TtecDBFindLookup;
    flkTiposMovimentos: TtecDBFindLookup;
    sbnCodigosFiscais: TSpeedButton;
    sbnTiposMovimentos: TSpeedButton;
    dtxCodigosFiscais: TtecDBText;
    dtxTiposMovimentos: TtecDBText;
    rgpTipoNatureza: TtecDBRadioGroup;
    rgbEntrada: TtecRadioButton;
    rgbSaida: TtecRadioButton;
    chkGerarDuplicatas: TDBCheckBox;
    rgpTipoMotivo: TtecDBRadioGroup;
    ckbCheques: TtecRadioButton;
    ckbOutros: TtecRadioButton;
    ckbPedidos: TtecRadioButton;
    edtInativoTipoCarta: TDBEditData;
    pgcParametros: TPageControl;
    tstParametrosAvisos: TTabSheet;
    gbxIncluir: TGroupBox;
    ckbIncompleto: TDBCheckBox;
    ckbDevolvida: TDBCheckBox;
    gbxNaoConsiderar: TGroupBox;
    pgcAgentesaExcluir: TtecPageControl;
    TabSheet1: TTabSheet;
    sbnIncluirAgente: TSpeedButton;
    sbnExcluirAgente: TSpeedButton;
    dbgAgentes: TtecDBGrid;
    TabSheet2: TTabSheet;
    sbnIncluirConceito: TSpeedButton;
    sbnExcluirConceito: TSpeedButton;
    dbgConceitos: TtecDBGrid;
    edtDiasAtraso: TDBEditNumero;
    sbnProcuraModeloAviso: TSpeedButton;
    flkPrecedente: TtecDBFindLookup;
    dtxDescricaoPrecedente: TtecDBText;
    sbnConsultaPrecedente: TSpeedButton;
    dtxModeloAviso: TtecDBText;
    dlgModeloAvisos: TOpenDialog;
    tstCampos: TTabSheet;
    clbCampos: TCheckListBox;
    sbnMarcarCampos: TSpeedButton;
    sbnDesmarcarCampos: TSpeedButton;
    dtxArquivoaExportar: TtecDBText;
    sbnProcuraArquivoaExportar: TSpeedButton;
    sbnAlterarModelo: TSpeedButton;
    dtxModeloEtiqueta: TtecDBText;
    sbnProcuraModeloEtiqueta: TSpeedButton;
    sbnAlterarModeloEtiqueta: TSpeedButton;
    ckbCartao: TDBCheckBox;
    rgpEntrada: TtecDBRadioGroup;
    rgbPedido: TtecRadioButton;
    rgbNotaSaida: TtecRadioButton;
    edtRendaConjuge: TDBEditNumero;
    gbxLancamentosNaturezas: TGroupBox;
    dbgLancamentosNaturezas: TtecDBGrid;
    tstTiposRecebimentos: TTabSheet;
    edtDescricaoTipoRecebimento: TDBEditTexto;
    edtInativoTipoRecebimento: TDBEditData;
    edfCodigoTipoRecebimento: TtecDbEditFind;
    ckbDevolucaoCaixa: TDBCheckBox;
    rgpTipoRecebimento: TtecDBRadioGroup;
    rgbDinheiro: TtecRadioButton;
    rgbDebito: TtecRadioButton;
    rgbCredito: TtecRadioButton;
    rgbCheque: TtecRadioButton;
    edtDesagio: TDBEditNumero;
    gbxrRecebimentos: TGroupBox;
    dbgRecebimentos: TtecDBGrid;
    sbnExcluirRecebimento: TSpeedButton;
    gbxCodigoPlano: TGroupBox;
    gbxDescPlano: TGroupBox;
    gbxInativoPlano: TGroupBox;
    gbxCodigoAgente: TGroupBox;
    gbxInativoAgente: TGroupBox;
    gbxDescricaoAgente: TGroupBox;
    gbxCodigoCargo: TGroupBox;
    gbxInativoCargo: TGroupBox;
    gbxDescricaoCargo: TGroupBox;
    gbxCodigoConceito: TGroupBox;
    gbxInativoConceito: TGroupBox;
    gbxDescricaoConceito: TGroupBox;
    gbxCodigoMotivo: TGroupBox;
    gbxInativoMotivo: TGroupBox;
    gbxDescricaoMotivo: TGroupBox;
    gbxCodigoRecebimento: TGroupBox;
    gbxInativoRecebimento: TGroupBox;
    gbxDescricaoRecebimento: TGroupBox;
    gbxRendaMaxima: TGroupBox;
    gbxPontos: TGroupBox;
    gbxRendaConjuge: TGroupBox;
    lblPercConjuge: TLabel;
    gbxPontuacao: TGroupBox;
    gbxCodigoCarta: TGroupBox;
    gbxInativoCarta: TGroupBox;
    gbxDescricaoCarta: TGroupBox;
    gbxPrecedente: TGroupBox;
    gbxDiasAtraso: TGroupBox;
    Label1: TLabel;
    gbxModeloAviso: TGroupBox;
    gbxModeloEtiqueta: TGroupBox;
    gbxArquivoExportar: TGroupBox;
    gbxCodigoNatureza: TGroupBox;
    gbxInativoNatureza: TGroupBox;
    gbxDescricaoNatureza: TGroupBox;
    gbxCFOP: TGroupBox;
    gbxTipoMovto: TGroupBox;
    gbxDesagio: TGroupBox;
    lblPercDesagio: TLabel;
    dlgArquivoaExportar: TSaveDialog;
    ckbDestacarIPI: TDBCheckBox;
    rgbServicos: TtecRadioButton;
    gbxOpcoes: TGroupBox;
    gbxDiasUteisDebito: TGroupBox;
    edtDiasUteis: TDBEditNumero;
    gbxProdutosporCargos: TGroupBox;
    dbgprodutoscargos: TtecDBGrid;
    gbxMarkUpPadrao: TGroupBox;
    DBEditNumero1: TDBEditNumero;
    Label3: TLabel;
    gbxICMSCST: TGroupBox;
    fraConsultaICMSCST: TfraConsultaCodigo;
    gbxIPICST: TGroupBox;
    fraConsultaIPICST: TfraConsultaCodigo;
    gbxCOFINSSCT: TGroupBox;
    fraConsultaCOFINSCST: TfraConsultaCodigo;
    gbxPISCST: TGroupBox;
    fraConsultaPISCST: TfraConsultaCodigo;
    odgImportaExcel: TOpenDialog;
    gbxCodigosSituacoesTributaria: TGroupBox;
    gbxTipoAtendimento: TGroupBox;
    flkTipoAtendimento: TtecDBFindLookup;
    sbnTipoAtendimento: TSpeedButton;
    dtxTipoAtendimento: TtecDBText;
    lblNaoPrecisam: TLabel;
    ckbCReDBigualValorNota: TDBCheckBox;
    ckbLancamentosOpcionais: TDBCheckBox;
    gbxNumeroRecebimentos: TGroupBox;
    edtNumeroRecebimentos: TDBEditNumero;
    gbxIntervaloRecebimentos: TGroupBox;
    edtIntervaloRecebimentos: TDBEditNumero;
    ckbLantosCustoMedio: TDBCheckBox;
    rgpMovFisica: TtecDBRadioGroup;
    rbnMovFisica_Sim: TtecRadioButton;
    rbnMovFisica_Nao: TtecRadioButton;
    gbxContas: TGroupBox;
    dbgContasTiposRecebimentos: TtecDBGrid;
    pnlBotoesContas: TPanel;
    bvlTopo: TBevel;
    sbnIncluirContaTipoRecebimento: TSpeedButton;
    sbnExcluirContaTipoRecebimento: TSpeedButton;
    pnlbotoes: TPanel;
    pnltop: TPanel;
    rgbordenacao: TRadioGroup;
    gbxlocalizar: TGroupBox;
    gbxlocalizardescricao: TGroupBox;
    edtLocalizarDescricao: TEditTexto;
    gbxLocalizarCodigo: TGroupBox;
    edtLocalizarCodigo: TEditTexto;
    sbnImportarExcel: TSpeedButton;
    sbnIncluirTodosProdutos: TSpeedButton;
    sbnExcluirImposto: TSpeedButton;
    sbnIncluirImposto: TSpeedButton;
    ckbICMSSobreIPI: TDBCheckBox;
    gbxCSOSN: TGroupBox;
    fraConsultaCSOSN: TfraConsultaCodigoContabil;
    ckbDiferenciada: TDBCheckBox;
    ckbNaoGerarCreditoICMS: TDBCheckBox;
    actAtualizar: TActionList;
    aclAtualizar: TAction;
    ckbNaoGerarCreditoIPI: TDBCheckBox;
    ckbIPISobreFrete: TDBCheckBox;
    gbxAgenteTipoRecebimento: TGroupBox;
    sbnProcuraAgente: TSpeedButton;
    flkAgenteTipoRecebimento: TtecDBFindLookup;
    dtxProcuraAgente: TtecDBText;
    ckbUtilizarObsAutomatica: TDBCheckBox;
    ckbnaocalcularvaloresicmsdiferimento: TDBCheckBox;
    ckbrequernfentrada: TDBCheckBox;
    ckbrequernfsaida: TDBCheckBox;
    ckbMercdoriaClienteouFornecedor: TDBCheckBox;
    gbxISSQNST: TGroupBox;
    fraConsultaISSQNST: TfraConsultaCodigoContabil;
    ckbicmssobredespesasacessorias: TDBCheckBox;
    gbxEvento: TGroupBox;
    fraConsultaCodigoContabilEvento: TfraConsultaCodigoContabil;
    gbxFornecedor: TGroupBox;
    fraConsultaFornecedor: TfraConsultaCodigo;
    stxMarkUp: TStaticText;
    stxRenda: TStaticText;
    stxOrdenacao: TStaticText;
    stxNumero: TStaticText;
    stxDias: TStaticText;
    pnlTopNatureza: TPanel;
    pnlCentroNatureza: TPanel;
    rgbCreditoTroca: TtecRadioButton;
    pnlDetalhesSituacaoTributaria: TPanel;
    ckbVendas: TtecRadioButton;
    tstQualidade_Venda: TTabSheet;
    dbgQualidade_Vendas: TtecDBGrid;
    ColorDialog1: TColorDialog;
    pnlBottomQualidade_Vendas: TPanel;
    gbxDiferimento: TGroupBox;
    edtPDiferimento: TDBEditNumero;
    gbxINfComplementares: TGroupBox;
    mmoINfComplementares: TtecDBMemo;
    gbxNomeRede: TGroupBox;
    edtNomeRede: TDBEditTexto;
    gbxDesagioMinimo: TGroupBox;
    stxDesagio: TStaticText;
    DBEditNumero2: TDBEditNumero;
    ckbPermitirImpressaodoBoleto: TDBCheckBox;
    ckbEntrega: TtecRadioButton;
    rgbPIX: TtecRadioButton;
    DBCheckBox1: TDBCheckBox;
    tstRedes_Adquirentes: TTabSheet;
    ckbrecebimento_antecipado: TDBCheckBox;
    gbxCodigoredes_adquirentes: TGroupBox;
    edfcodigoredes_adquirentes: TtecDbEditFind;
    gbxDescricaoredes_adquirentes: TGroupBox;
    edtdescricaorede_adquirente: TDBEditTexto;
    AdvPageRedes_adquirentes_tipos_recebimentos: TAdvPageControl;
    AdvTabSheetRedes_adquirentes_tipos_recebimentos: TAdvTabSheet;
    DBAdvGridRedes_Adquirentes_Tipos_Recebimentos: TDBAdvGrid;
    PanelProdutos: TPanel;
    sbnIncluirRedes_Adquirentes_Tipos_Recebimentos: TSpeedButton;
    sbnRedes_Adquirentes_Tipos_Recebimentos: TSpeedButton;
    DBCheckBox2: TDBCheckBox;
    gbxIBSCBS: TGroupBox;
    gbxtributos_cst_ibscbs: TGroupBox;
    fraConsultatributos_cst_ibscbs: TfraConsultaCodigo;
    gbxtributos_is: TGroupBox;
    fraConsultatributos_is: TfraConsultaCodigo;
    naoGearCredito: TGroupBox;
    ckbnaogerarcreditoibs: TDBCheckBox;
    ckbnaogerarcreditocbs: TDBCheckBox;
    ckbnaogerarcreditois: TDBCheckBox;
    gbxNaoGearDebito: TGroupBox;
    ckbnaogerardebitoibs: TDBCheckBox;
    ckbnaogerardebitocbs: TDBCheckBox;
    ckbnaogerardebitois: TDBCheckBox;
    gbxNaoGerarCreditoDebitocbsibs: TGroupBox;
    procedure pgcTabelasChange(Sender: TObject);
    procedure sbnCodigosFiscaisClick(Sender: TObject);
    procedure sbnTiposMovimentosClick(Sender: TObject);
    procedure edtInativoMotivoExit(Sender: TObject);
    procedure edtInativoConceitoExit(Sender: TObject);
    procedure edtInativoCargoExit(Sender: TObject);
    procedure edtInativoAgenteExit(Sender: TObject);
    procedure edtInativoNaturezaExit(Sender: TObject);
    procedure sbnIncluirAgenteClick(Sender: TObject);
    procedure sbnIncluirConceitoClick(Sender: TObject);
    procedure dbgAgentesDblClick(Sender: TObject);
    procedure dbgAgentesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgConceitosDblClick(Sender: TObject);
    procedure dbgConceitosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnExcluirAgenteClick(Sender: TObject);
    procedure sbnExcluirConceitoClick(Sender: TObject);
    procedure rgpTipoChange(Sender: TObject);
    procedure sbnConsultaPrecedenteClick(Sender: TObject);
    procedure sbnProcuraModeloAvisoClick(Sender: TObject);
    procedure edfCodigoTipoCartaFound(Found: Boolean);
    procedure sbnProcuraArquivoaExportarClick(Sender: TObject);
    procedure clbCamposClickCheck(Sender: TObject);
    procedure clbCamposKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnMarcarCamposClick(Sender: TObject);
    procedure sbnDesmarcarCamposClick(Sender: TObject);
    procedure sbnAlterarModeloClick(Sender: TObject);
    procedure sbnProcuraModeloEtiquetaClick(Sender: TObject);
    procedure sbnAlterarModeloEtiquetaClick(Sender: TObject);
    procedure dbgLancamentosNaturezasDblClick(Sender: TObject);
    procedure dbgLancamentosNaturezasKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure edtInativoTipoRecebimentoExit(Sender: TObject);
    procedure sbnExcluirRecebimentoClick(Sender: TObject);
    procedure sbnIncluirImpostoClick(Sender: TObject);
    procedure dbgprodutoscargosDblClick(Sender: TObject);
    procedure sbnExcluirImpostoClick(Sender: TObject);
    procedure sbnIncluirTodosProdutosClick(Sender: TObject);
    procedure rgbordenacaoClick(Sender: TObject);
    procedure edtLocalizarCodigoExit(Sender: TObject);
    procedure edtLocalizarDescricaoExit(Sender: TObject);
    procedure dbgprodutoscargosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnImportarExcelClick(Sender: TObject);
    procedure flkPrecedenteExit(Sender: TObject);
    procedure edtDiasAtrasoExit(Sender: TObject);
    procedure sbnTipoAtendimentoClick(Sender: TObject);
    procedure rgbEntradaClick(Sender: TObject);
    procedure rgbSaidaClick(Sender: TObject);
    procedure rgbServicosClick(Sender: TObject);
    procedure sbnIncluirContaTipoRecebimentoClick(Sender: TObject);
    procedure dbgContasTiposRecebimentosDblClick(Sender: TObject);
    procedure dbgContasTiposRecebimentosKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure sbnExcluirContaTipoRecebimentoClick(Sender: TObject);
    procedure aclAtualizarUpdate(Sender: TObject);
    procedure sbnProcuraAgenteClick(Sender: TObject);
    procedure dbgQualidade_VendasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgQualidade_VendasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgQualidade_VendasDblClick(Sender: TObject);
    procedure sbnIncluirRedes_Adquirentes_Tipos_RecebimentosClick(
      Sender: TObject);
    procedure sbnRedes_Adquirentes_Tipos_RecebimentosClick(
      Sender: TObject);
    procedure DBAdvGridRedes_Adquirentes_Tipos_RecebimentosKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pgcTabelasChanging(Sender: TObject;
      var AllowChange: Boolean);
  private
    Valor: String;
    Codigos, Markups : TStringList;
    procedure CriticarDataInativa(datainativa: TDBEditData);
    procedure CondicoesEventos;

  protected
    FCadastroTabelasCrediario: TdtmCadastroTabelasCrediario;
    fraConsultaRedes_Adquirentes: TfraConsultaCodigo;
    function  TituloPesquisa: String;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    procedure AlterarEstadoBotoes; override;
    function  ImportarExcel(XLS: string) : Boolean;
    procedure GravarDadosTabela;
    procedure AcionarPesquisaGrade;
    procedure AcionaCadastroProdutos(Editando: Boolean);
    procedure AcionaCadastroContas(Editando: Boolean);
    procedure AtualizaNumeroRegistros;
    procedure SelecionarCorQualidade_Vendas;
    procedure AtribuirDadosRedes_Adquirentes(Found: Boolean);

  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    function AcionaCadastroConceitosAviso(Editar: Boolean): Boolean;
    function AcionaCadastroAgentesAviso(Editar: Boolean): Boolean;
    procedure SetDataModulo(Dtm: TdtmCadastroTabelasCrediario);
    property CadastroTabelasCrediario: TdtmCadastroTabelasCrediario read FCadastroTabelasCrediario;
    procedure LerCampos;
    procedure GravarCampos;
    function LocalizarProduto(Codigo: Boolean; Valor: String):Boolean;
    procedure CondicoesIPICST;
  end;

var
  frmCadastroTabelasCrediario: TfrmCadastroTabelasCrediario;
  TipoTabela  : TtecTabelasCrediario;
  TipoPesquisa: TtecPesquisa;

implementation

uses
  //Projeto
  fmcadastroagentestiposcartas,
  fmcadastroconceitostiposcartas, fmcadastroprodutoscargos,
  fmcadastrocontastiposrecebimentos, dmbasico;

{$R *.dfm}

constructor TfrmCadastroTabelasCrediario.Create(AOwner: TComponent);
begin
  dtmCadastroTabelasCrediario:= TdtmCadastroTabelasCrediario.Create(Self);
  inherited;
  SetDataModulo(dtmCadastroTabelasCrediario);
  CadastroTabelasCrediario.AbrirTabelasCadastro(tbcAGENTE);
  pgcTabelas.ActivePage:= tstAgentes;
  pgcTabelasChange(pgcTabelas);
  if ParSistema.GerarContabilidade then
    gbxLancamentosNaturezas.Visible := true
  else
    gbxLancamentosNaturezas.Visible := false;

  fraConsultaICMSCST.TipoPesquisa := pesTRIBUTOSICMS;

  fraConsultaIPICST.CondicoesdaConsulta := CondicoesIPICST;
  fraConsultaIPICST.TipoPesquisa := pesTRIBUTOSIPI;

  fraConsultaCOFINSCST.TipoPesquisa := pesTRIBUTOSCOFINS;
  fraConsultaPISCST.TipoPesquisa := pesTRIBUTOSPIS;
  fraConsultaISSQNST.TipoPesquisa := pesTRIBUTOSISSQN;

  fraConsultatributos_cst_ibscbs.TipoPesquisa    := pestributos_cst_ibscbs;
  fraConsultatributos_is.TipoPesquisa    := pestributos_is;

  TipoTabela:= tbcNENHUM;
  dbgprodutoscargos.OnDelete := sbnExcluirImposto.Click;
  dtmCadastroTabelasCrediario.OrdenarCodigo:= rgbordenacao.ItemIndex;

  fraConsultaCSOSN.TipoPesquisa := pesCSOSN;

  fraConsultaCodigoContabilEvento.TipoPesquisa := pesEVENTO;
  fraConsultaCodigoContabilEvento.CondicoesdaConsulta := CondicoesEventos;

  fraConsultaFornecedor.TipoCliente := 'F';
  fraConsultaFornecedor.Tipovfornecedor := 'F';
  fraConsultaFornecedor.TipoPesquisa := pesFORNECEDORES;

  stxNumero.Height:= 12;
  stxDias.  Height:= 12;
  stxMarkUp.Height:= 12;
  stxRenda .Height:= 12;



  fraConsultaRedes_Adquirentes := TfraConsultaCodigo.Create(self);
  fraConsultaRedes_Adquirentes.Name := 'fraConsultaRedes_Adquirentes';
  fraConsultaRedes_Adquirentes.edfCodigo.DataSource := dtmCadastroTabelasCrediario.dsrRedes_Adquirentes;
  fraConsultaRedes_Adquirentes.edfCodigo.DataField := 'codigo';

//  fraConsultaRedes_Adquirentes.edfCodigo.LookupSource := fraConsultaRedes_Adquirentes.dsrProcuraRedes_Adquirentes;
//  fraConsultaRedes_Adquirentes.edfCodigo.LookupField := 'codigo';
//  fraConsultaRedes_Adquirentes.edfCodigo.LookupQueryParameter := 'codigo';

  fraConsultaRedes_Adquirentes.edfCodigo.Operacao := opATRIBUICAO;



  fraConsultaRedes_Adquirentes.AbrirTabelaProcura := false;
  fraConsultaRedes_Adquirentes.TipoPesquisa := pesRedes_Adquirentes;
  fraConsultaRedes_Adquirentes.OnFound := AtribuirDadosRedes_Adquirentes;

end;

destructor TfrmCadastroTabelasCrediario.Destroy;
begin
  CadastroTabelasCrediario.Free;
  inherited;
  frmCadastroTabelasCrediario:= nil;
end;

procedure TfrmCadastroTabelasCrediario.pgcTabelasChange(Sender: TObject);
begin
  with CadastroTabelasCrediario do begin
    if pgcTabelas.ActivePage = tstAgentes then
    begin
      DataSet:= TabelaAgentes;
      TipoTabela:= tbcAGENTE;
      edfCodigoAgente.SetFocus;
    end
    else
    if pgcTabelas.ActivePage = tstCargos then
    begin
      if ParSistema.PrecosporCargo then
      begin
       if not dtmCadastroTabelasCrediario.qryProdutosporCargo.Active then
         dtmCadastroTabelasCrediario.qryProdutosporCargo.Open;
       gbxProdutosporCargos.Visible := True;
      end
      else
       gbxProdutosporCargos.Visible := False;
      DataSet:= TabelaCargos;
      edfCodigoCargo.SetFocus;
      TipoTabela:= tbcCARGO;
    end
    else
    if pgcTabelas.ActivePage = tstConceitos then begin
      DataSet:= TabelaConceitos;
      edfCodigoConceito.SetFocus;
      TipoTabela:= tbcCONCEITO;
    end
    else
    if pgcTabelas.ActivePage = tstMotivos then begin
      DataSet:= TabelaMotivos;
      edfCodigoMotivo.SetFocus;
      TipoTabela:= tbcMOTIVO;
    end
    else
    if pgcTabelas.ActivePage = tstTiposPlanos then begin
      DataSet:= TabelaTiposPlanos;
      edfCodigoTipoPlano.SetFocus;
      TipoTabela:= tbcTIPOPLANO;
    end
    else
    if pgcTabelas.ActivePage = tstTiposCartas then begin
      DataSet:= TabelaTiposCartas;
      edfCodigoTipoCarta.SetFocus;
      TipoTabela:= tbcTIPOCARTA;
    end
    else
    if pgcTabelas.ActivePage = tstNaturezas then begin
      DataSet:= TabelaNaturezas;
      edfCodigoNatureza.SetFocus;
      TipoTabela:= tbcNATUREZA;
      gbxNaoGerarCreditoDebitocbsibs.top := gbxIBSCBS.top;
    end
    else
    if pgcTabelas.ActivePage = tstTiposRecebimentos then
    begin
      DataSet := TabelaTiposRecebimentos;
      edfCodigoTipoRecebimento.SetFocus;
      TipoTabela := tbcTIPORECEBIMENTO;
    end
    else
    if pgcTabelas.ActivePage = tstRedes_Adquirentes then
    begin
      DataSet := dtmCadastroTabelasCrediario.qryRedes_Adquirentes;
      edfcodigoredes_adquirentes.SetFocus;
      TipoTabela := tbcRedesAdquirentes;
    end
    else
    if pgcTabelas.ActivePage = tstQualidade_Venda then
    begin
      DataSet := TabelaQualidade_Vendas;
      dbgQualidade_Vendas.setfocus;
      dbgQualidade_Vendas.SelectedField := dtmCadastroTabelasCrediario.qryQualidade_Vendasdescricao;
      TipoTabela := tbcQUALIDADE_VENDAS;
    end;
    AbrirTabelasCadastro(TipoTabela);
  end;
end;

function TfrmCadastroTabelasCrediario.TituloPesquisa: String;
begin
  case TipoTabela of
    tbcAGENTE    : Result:= 'Agentes';
    tbcCARGO     : Result:= 'Cargos';
    tbcCONCEITO  : Result:= 'Conceitos';
    tbcMOTIVO    : Result:= 'Motivos';
    tbcTIPOPLANO : Result:= 'Tipos Planos';
    tbcTIPOCARTAPRECEDENTE,
    tbcTIPOCARTA : Result:= 'Tipos Cartas';
    tbcNATUREZA  : Result:= 'Naturezas de Operação';
    tbcCFOP      : Result:= 'Códigos Fiscais de Operação';
    tbcTIPOMOVTO : Result:= 'Tipos Movimentos';
    tbcTIPORECEBIMENTO : Result := 'Tipos de Recebimentos';
    tbcPRODUTOS  : Result:= 'Produtos';
    tbcTIPOATENDIMENTO : Result := 'Tipo Atendimento';
    tbcAGENTETIPORECEBIMENTO : Result := 'Agente'
    else           Result:= '';
  end;
end;

function TfrmCadastroTabelasCrediario.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  with CadastroTabelasCrediario do begin
    case TipoTabela of
      tbcAGENTE    : Result:= ExisteAgente(NomeCampo, Value);
      tbcCARGO     : Result:= ExisteCargo(NomeCampo, Value);
      tbcCONCEITO  : Result:= ExisteConceito(NomeCampo, Value);
      tbcMOTIVO    : Result:= ExisteMotivo(NomeCampo, Value);
      tbcTIPOPLANO : Result:= ExisteTipoPlano(NomeCampo, Value);
      tbcTIPOCARTA : Result:= ExisteTipoCarta(NomeCampo, Value);
      tbcTIPOCARTAPRECEDENTE : Result:= ExisteTipoCartaPrecedente(NomeCampo, Value);
      tbcNATUREZA  : Result:= ExisteNatureza(NomeCampo, Value);
      tbcCFOP      : Result:= ExisteCodigosFiscais(NomeCampo, Value);
      tbcTIPOMOVTO : Result:= ExisteTiposMovimentos(NomeCampo, Value);
      tbcCONTADEBITO,
      tbcCONTACREDITO,
      tbcCONTACONTABIL : Result:= ExisteContaContabil(NomeCampo, Value);
      tbcHISTORICO: Result := ExisteHistorico(NomeCampo, Value);
      tbcTIPORECEBIMENTO: Result := ExisteTipoRecebimento(NomeCampo, Value)
      else           Result:= False;
    end;
  end;
end;

function TfrmCadastroTabelasCrediario.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
    begin
      if pgcTabelas.ActivePage = tstAgentes then
        CadastroTabelasCrediario.ExcluirAgente
      else
      if pgcTabelas.ActivePage = tstCargos then
        CadastroTabelasCrediario.ExcluirCargo
      else
      if pgcTabelas.ActivePage = tstConceitos then
        CadastroTabelasCrediario.ExcluirConceito
      else
      if pgcTabelas.ActivePage = tstMotivos then
        CadastroTabelasCrediario.ExcluirMotivo
      else
      if pgcTabelas.ActivePage = tstTiposPlanos then
        CadastroTabelasCrediario.ExcluirTipoPlano
      else
      if pgcTabelas.ActivePage = tstTiposCartas then
        CadastroTabelasCrediario.ExcluirTipoCarta
      else
      if pgcTabelas.ActivePage = tstNaturezas then
        CadastroTabelasCrediario.ExcluirNatureza
      else
      if pgcTabelas.ActivePage = tstTiposRecebimentos then
        CadastroTabelasCrediario.ExcluirTipoRecebimento
      else
      if pgcTabelas.ActivePage = tstRedes_Adquirentes then
        CadastroTabelasCrediario.ExcluirRedes_Adquirentes
      else
      if pgcTabelas.ActivePage = tstQualidade_Venda then
        CadastroTabelasCrediario.ExcluirQualidade_Venda;
    end;
  end;
end;

function TfrmCadastroTabelasCrediario.InternoGravar: Boolean;
begin
  Result:= True;
//  if ActiveControl is TtecFindCustom then
//    Result:= TtecFindCustom(ActiveControl).Exist;
  if Result then begin
    Result:= inherited InternoGravar;
    if Result then begin
      if pgcTabelas.ActivePage = tstAgentes then
        CadastroTabelasCrediario.GravarAgente
      else
      if pgcTabelas.ActivePage = tstCargos then
        CadastroTabelasCrediario.GravarCargo
      else
      if pgcTabelas.ActivePage = tstConceitos then
        CadastroTabelasCrediario.GravarConceito
      else
      if pgcTabelas.ActivePage = tstMotivos then
        CadastroTabelasCrediario.GravarMotivo
      else
      if pgcTabelas.ActivePage = tstTiposPlanos then
        CadastroTabelasCrediario.GravarTipoPlano
      else
      if pgcTabelas.ActivePage = tstTiposCartas then
      begin
        GravarCampos;
        CadastroTabelasCrediario.GravarTipoCarta;
      end
      else
      if pgcTabelas.ActivePage = tstNaturezas then
        CadastroTabelasCrediario.GravarNatureza
      else
      if pgcTabelas.ActivePage = tstTiposRecebimentos then
      begin
        if (trim(edtDiasUteis.Text) = '') and
           dbgRecebimentos.DataSource.DataSet.IsEmpty then
        begin
          MensagemAviso(format(ctCAMPODEVESERPREENCHIDO,['"DIAS ÚTEIS" ou "RECEBIMENTOS"']));
          edtDiasUteis.SetFocus;
        end
        else
          CadastroTabelasCrediario.GravarTipoRecebimento;
      end
      else
      if pgcTabelas.ActivePage = tstRedes_Adquirentes then
         CadastroTabelasCrediario.GravarRedes_Adquirentes
      else
      if pgcTabelas.ActivePage = tstQualidade_Venda then
      begin
        vPressionadoBotaoGravar := true;
        CadastroTabelasCrediario.GravarQualidade_Venda;
        vPressionadoBotaoGravar := false;
      end;
    end;
  end;
end;

function TfrmCadastroTabelasCrediario.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
    begin
      if pgcTabelas.ActivePage = tstAgentes then
      begin
        CadastroTabelasCrediario.IncluirAgente;
        edtDescricaoAgente.SetFocus;
      end
      else
      if pgcTabelas.ActivePage = tstCargos then
      begin
        CadastroTabelasCrediario.IncluirCargo;
        edtDescricaoCargo.SetFocus;
      end
      else
      if pgcTabelas.ActivePage = tstConceitos then
      begin
        CadastroTabelasCrediario.IncluirConceito;
        edtDescricaoConceito.SetFocus;
      end
      else
      if pgcTabelas.ActivePage = tstMotivos then
      begin
        CadastroTabelasCrediario.IncluirMotivo;
        edtDescricaoMotivo.SetFocus;
      end
      else
      if pgcTabelas.ActivePage = tstTiposPlanos then
      begin
        CadastroTabelasCrediario.IncluirTipoPlano;
        edtDescricaoTipoPlano.SetFocus;
      end
      else
      if pgcTabelas.ActivePage = tstTiposCartas then
      begin
        CadastroTabelasCrediario.IncluirTipoCarta;
        edtDescricaoTipoCarta.SetFocus;
      end
      else
      if pgcTabelas.ActivePage = tstNaturezas then
      begin
        CadastroTabelasCrediario.IncluirNatureza;
        edtDescricaoNatureza.SetFocus;
      end
      else
      if pgcTabelas.ActivePage = tstTiposRecebimentos then
      begin
        CadastroTabelasCrediario.IncluirTipoRecebimento;
        edtDescricaoTipoRecebimento.SetFocus;
      end
      else
      if pgcTabelas.ActivePage = tstRedes_Adquirentes then
      begin
        CadastroTabelasCrediario.IncluirRedes_Adquirentes;
        edtdescricaorede_adquirente.SetFocus;
      end
      else
      if pgcTabelas.ActivePage = tstQualidade_Venda then
      begin
        CadastroTabelasCrediario.IncluirQualidade_Venda;
        dbgQualidade_Vendas.setfocus;
        dbgQualidade_Vendas.SelectedField := dtmCadastroTabelasCrediario.qryQualidade_Vendasdescricao;
      end;
    end;
  end;
end;

function TfrmCadastroTabelasCrediario.InternoPesquisar(Titulo:String): Integer;
begin
  Result := mrNone;
  if CtrlOn then
  begin
    TipoTabela := tbcNENHUM;
    if ActiveControl = flkCodigosFiscais then
      TipoTabela:= tbcCFOP
    else if ActiveControl = flkTiposMovimentos then
      TipoTabela:= tbcTIPOMOVTO
    else if ActiveControl = flkPrecedente then
      TipoTabela:= tbcTIPOCARTAPRECEDENTE
    else if ActiveControl = flkTipoAtendimento then
      TipoTabela:= tbcTIPOATENDIMENTO
    else if ActiveControl = flkAgenteTipoRecebimento then
      TipoTabela:= tbcAGENTETIPORECEBIMENTO
    else if ActiveControl = fraConsultaCodigoContabilEvento.edfcodigo then
      TipoTabela := tbcNENHUM
    else if ActiveControl = fraConsultaFornecedor.edfcodigo then
      TipoTabela := tbcNENHUM;


    if TipoTabela <> tbcNENHUM then
    begin
      if ActiveControl is TtecFindCustom then begin
        CadastroTabelasCrediario.AbrirTabelasConsulta(TipoTabela);
        Result:= inherited InternoPesquisar(TituloPesquisa);
        if Result = mrOK then
          CadastroTabelasCrediario.SelecionarMultiplas(TipoTabela);
        dtmCadastroTabelasCrediario.FecharTabelasConsulta(TipoTabela);
        TipoTabela:= tbcNENHUM;
      end
      else
      begin
        if (TipoTabela in [tbcCONTACONTABIL, tbcHISTORICO]) then
        begin
          CadastroTabelasCrediario.AbrirTabelasConsulta(TipoTabela);
          Result:= inherited InternoPesquisar(Titulo);
          if Result = mrOK then
            CadastroTabelasCrediario.SelecionarMultiplas(TipoTabela);
          dtmCadastroTabelasCrediario.FecharTabelasConsulta(TipoTabela);
          TipoTabela:= tbcNENHUM;
        end;
      end;
    end;
  end
  else
  begin
    TipoTabela := tbcNENHUM;

    if pgcTabelas.ActivePage = tstAgentes then
      TipoTabela:= tbcAGENTE
    else if pgcTabelas.ActivePage = tstCargos then
      TipoTabela:= tbcCARGO
    else if pgcTabelas.ActivePage = tstConceitos then
      TipoTabela:= tbcCONCEITO
    else if pgcTabelas.ActivePage = tstMotivos then
      TipoTabela:= tbcMOTIVO
    else if pgcTabelas.ActivePage = tstTiposPlanos then
      TipoTabela:= tbcTIPOPLANO
    else if pgcTabelas.ActivePage = tstTiposCartas then
      TipoTabela:= tbcTIPOCARTA
    else if pgcTabelas.ActivePage = tstNaturezas then
      TipoTabela:= tbcNATUREZA
    else if pgcTabelas.ActivePage = tstTiposRecebimentos then
      TipoTabela:= tbcTIPORECEBIMENTO
    else if pgcTabelas.ActivePage = tstRedes_Adquirentes then
      TipoTabela := tbcRedesAdquirentes;

    if TipoTabela = tbcRedesAdquirentes then
       fraConsultaRedes_Adquirentes.internopesquisar('Redes Adquirentes')
    else
    if TipoTabela <> tbcNENHUM then
    begin
      CadastroTabelasCrediario.AbrirTabelasConsulta(TipoTabela);
      Result:= inherited InternoPesquisar(TituloPesquisa);
      if Result = mrOK then
        CadastroTabelasCrediario.SelecionarMultiplas(TipoTabela);
      CadastroTabelasCrediario.FecharTabelasConsulta(TipoTabela);
      TipoTabela:= tbcNENHUM;
    end;
  end;
end;

function TfrmCadastroTabelasCrediario.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa:= True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

function TfrmCadastroTabelasCrediario.TabelaDePesquisa: TZDataSet;
begin
  with CadastroTabelasCrediario do begin
    case TipoTabela of
      tbcAGENTE    : Result:= ConsultarAgentes;
      tbcCARGO     : Result:= ConsultarCargos;
      tbcCONCEITO  : Result:= ConsultarConceitos;
      tbcMOTIVO    : Result:= ConsultarMotivos;
      tbcTIPOPLANO : Result:= ConsultarTiposPlanos;
      tbcTIPOCARTA : Result:= ConsultarTiposCartas;
      tbcTIPOATENDIMENTO : Result := dtmCadastroTabelasCrediario.qryConsultaTiposAtendimentos;
      tbcTIPOCARTAPRECEDENTE : Result:= ConsultarTiposCartasPrecedentes;
      tbcNATUREZA  : Result:= ConsultarNaturezas;
      tbcCFOP      : Result:= ConsultarCodigosFiscais;
      tbcTIPOMOVTO : Result:= ConsultarTiposMovimentos;
      tbcCONTADEBITO,
      tbcCONTACREDITO,
      tbcCONTACONTABIL : result:= qryconsultacontacontabil;
      tbcHISTORICO: result := qryConsultaHistorico;
      tbcAGENTETIPORECEBIMENTO : Result := dtmCadastroTabelasCrediario.qryConsultaAgentes;
      tbcTIPORECEBIMENTO: Result := ConsultarTiposRecebimentos
      else           Result:= Nil;
    end;
  end;
end;

procedure TfrmCadastroTabelasCrediario.sbnCodigosFiscaisClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkCodigosFiscais, '');
end;

procedure TfrmCadastroTabelasCrediario.sbnTiposMovimentosClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkTiposMovimentos, '');
end;

procedure TfrmCadastroTabelasCrediario.edtInativoMotivoExit(
  Sender: TObject);
begin
  inherited;
  CriticarDataInativa(edtInativoMotivo);
end;

procedure TfrmCadastroTabelasCrediario.edtInativoConceitoExit(
  Sender: TObject);
begin
  inherited;
  CriticarDataInativa(edtInativoConceito);
end;

procedure TfrmCadastroTabelasCrediario.edtInativoCargoExit(
  Sender: TObject);
begin
  inherited;
  CriticarDataInativa(edtInativoCargo);
end;

procedure TfrmCadastroTabelasCrediario.edtInativoAgenteExit(
  Sender: TObject);
begin
  inherited;
  CriticarDataInativa(edtinativoAgente);
end;

procedure TfrmCadastroTabelasCrediario.edtInativoNaturezaExit(
  Sender: TObject);
begin
  inherited;
  CriticarDataInativa(edtInativoNatureza);
end;

procedure TfrmCadastroTabelasCrediario.CriticarDataInativa(
  datainativa: TDBEditData);
begin
  if not dataembranco(datainativa.Text) and datainativa.Criticar(false) then
   if strtodate(datainativa.Text)>CadastroTabelasCrediario.DataServidor then
    if MensagemConfirmacao(ctDATASUPERIORAATUAL)=smbCancel then
      datainativa.SetFocus;
end;

function TfrmCadastroTabelasCrediario.AcionaCadastroAgentesAviso(
  Editar: Boolean): Boolean;
begin
  frmCadastroAgentesTiposCartas:= TfrmCadastroAgentesTiposCartas.Create(frmCadastroAgentesTiposCartas);
  with frmCadastroAgentesTiposCartas do
  begin
    SetDataModulo(dtmCadastroTabelasCrediario);
    DataSet:= CadastroTabelasCrediario.TabelaAgentesTiposCartas;
    Result := CadastroTabelasCrediario.IncluirAgenteTipoCarta(Editar);
    ShowModal;
    free;
  end;
end;

function TfrmCadastroTabelasCrediario.AcionaCadastroConceitosAviso(
  Editar: Boolean): Boolean;
begin
  if not Assigned (frmCadastroConceitosTiposCartas) then
    frmCadastroConceitosTiposCartas:= TfrmCadastroConceitosTiposCartas.Create(frmCadastroConceitosTiposCartas);
  with frmCadastroConceitosTiposCartas do
  begin
    SetDataModulo(dtmCadastroTabelasCrediario);
    DataSet:= CadastroTabelasCrediario.TabelaConceitosTiposCartas;
    Result := CadastroTabelasCrediario.IncluirConceitoTipoCarta(Editar);
    ShowModal;
    free;
  end;
end;

procedure TfrmCadastroTabelasCrediario.sbnIncluirAgenteClick(
  Sender: TObject);
begin
  inherited;
  AcionaCadastroAgentesAviso(False);
end;

procedure TfrmCadastroTabelasCrediario.sbnIncluirConceitoClick(
  Sender: TObject);
begin
  inherited;
  AcionaCadastroConceitosAviso(False);
end;

procedure TfrmCadastroTabelasCrediario.dbgAgentesDblClick(Sender: TObject);
begin
  inherited;
  AcionaCadastroAgentesAviso(True);
end;

procedure TfrmCadastroTabelasCrediario.dbgAgentesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Shift = [ssCtrl] then
    case Key of
      TeclaEditarRegistro : AcionaCadastroAgentesAviso(True);
      TeclaInserirRegistro: AcionaCadastroAgentesAviso(False);
      TeclaExcluirRegistro: sbnExcluirAgente.Click;
    end;
end;

procedure TfrmCadastroTabelasCrediario.dbgConceitosDblClick(
  Sender: TObject);
begin
  inherited;
  AcionaCadastroConceitosAviso(True);
end;

procedure TfrmCadastroTabelasCrediario.dbgConceitosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Shift = [ssCtrl] then begin
    case Key of
      TeclaEditarRegistro : AcionaCadastroConceitosAviso(True);
      TeclaInserirRegistro: AcionaCadastroConceitosAviso(False);
      TeclaExcluirRegistro: sbnExcluirConceito.Click;
    end;
  end;
end;

procedure TfrmCadastroTabelasCrediario.sbnExcluirAgenteClick(
  Sender: TObject);
begin
  inherited;
  CadastroTabelasCrediario.ExcluirAgenteTipoCarta;
  dbgAgentes.SetFocus;
end;

procedure TfrmCadastroTabelasCrediario.sbnExcluirConceitoClick(
  Sender: TObject);
begin
  inherited;
  CadastroTabelasCrediario.ExcluirConceitoTipoCarta;
  dbgConceitos.SetFocus;
end;

procedure TfrmCadastroTabelasCrediario.rgpTipoChange(Sender: TObject);
begin
  inherited;
  if rbnMalaDireta.Checked then
  begin
   tstParametrosAvisos.Visible := False ;
   pgcParametros.Visible := False        ;
  end
  else
  begin
    tstParametrosAvisos.Visible := True;
    pgcParametros.Visible := True;
    if rbnAviso.Checked then
      gbxTipoAtendimento.Visible := true
    else
      gbxTipoAtendimento.Visible := false;
  end;
end;

procedure TfrmCadastroTabelasCrediario.sbnConsultaPrecedenteClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkPrecedente, '');
end;

procedure TfrmCadastroTabelasCrediario.sbnProcuraModeloAvisoClick(
  Sender: TObject);
begin
  inherited;
  if dlgModeloAvisos.Execute then
   CadastroTabelasCrediario.TiposCartasarquivo:= trim(ExtractFileName(dlgModeloAvisos.FileName));
end;

procedure TfrmCadastroTabelasCrediario.SetDataModulo(
  Dtm: TdtmCadastroTabelasCrediario);
begin
  FCadastroTabelasCrediario:= Dtm;
end;

procedure TfrmCadastroTabelasCrediario.edfCodigoTipoCartaFound(
  Found: Boolean);
begin
  inherited;
  if found then
  begin
   CadastroTabelasCrediario.passarparametrotipodecarta;
   flkPrecedente.Exist;
   LerCampos;
  end;
end;

procedure TfrmCadastroTabelasCrediario.sbnProcuraArquivoaExportarClick(Sender: TObject);
begin
  inherited;
  if dlgArquivoaExportar.Execute then
   CadastroTabelasCrediario.TiposCartasexportar := trim(ExtractFileName(dlgArquivoaExportar.FileName));
end;

procedure TfrmCadastroTabelasCrediario.LerCampos;
var
  cnt: Integer;
  str: String;
begin
  str:= CadastroTabelasCrediario.CamposTiposCartas;
  if Length(str) < clbCampos.Items.Count then
    str:= '000000000000000000000000';
  for cnt:= 0 to clbCampos.Items.Count - 1 do
    clbCampos.Checked[cnt]:= False;
  for cnt:= 0 to clbCampos.Items.Count - 1 do
    clbCampos.Checked[cnt]:= str[cnt + 1] = '1';
end;

procedure TfrmCadastroTabelasCrediario.GravarCampos;
var
  cnt: Integer;
  str: String;
begin
  for cnt:= 0 to clbCampos.Items.Count - 1 do
    if clbCampos.Checked[cnt] then
      str:= str + '1'
    else
      str:= str + '0';
  CadastroTabelasCrediario.CamposTiposCartas:= str;
end;

procedure TfrmCadastroTabelasCrediario.clbCamposClickCheck(
  Sender: TObject);
begin
  inherited;
  if not (CadastroTabelasCrediario.TabelaTiposCartas.State in [dsEdit]) then
    CadastroTabelasCrediario.TabelaTiposCartas.Edit;
end;

procedure TfrmCadastroTabelasCrediario.clbCamposKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Shift = [ssCtrl] then
  begin
    case Key of
      TeclaInserirRegistro : sbnMarcarCampos.Click;
      TeclaExcluirLista    : sbnDesmarcarCampos.Click;
    end;
  end;
end;

procedure TfrmCadastroTabelasCrediario.sbnMarcarCamposClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbCampos,  True);
  if not (CadastroTabelasCrediario.TabelaTiposCartas.State in [dsEdit]) then
    CadastroTabelasCrediario.TabelaTiposCartas.Edit;
end;

procedure TfrmCadastroTabelasCrediario.sbnDesmarcarCamposClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbCampos,False);
  if not (CadastroTabelasCrediario.TabelaTiposCartas.State in [dsEdit]) then
    CadastroTabelasCrediario.TabelaTiposCartas.Edit;
end;

procedure TfrmCadastroTabelasCrediario.sbnAlterarModeloClick(
  Sender: TObject);
begin
  inherited;
  CadastroTabelasCrediario.AlterarModeloAviso
end;

procedure TfrmCadastroTabelasCrediario.sbnProcuraModeloEtiquetaClick(
  Sender: TObject);
begin
  inherited;
  if dlgModeloAvisos.Execute then
   CadastroTabelasCrediario.TiposCartasEtiqueta:= trim(ExtractFileName(dlgModeloAvisos.FileName));
end;

procedure TfrmCadastroTabelasCrediario.sbnAlterarModeloEtiquetaClick(
  Sender: TObject);
begin
  inherited;
  CadastroTabelasCrediario.AlterarModeloEtiqueta;
end;

procedure TfrmCadastroTabelasCrediario.dbgLancamentosNaturezasDblClick(
  Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  AcionarPesquisaGrade
end;

procedure TfrmCadastroTabelasCrediario.dbgLancamentosNaturezasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_F9     : begin
                   CtrlOn := Shift = [ssCtrl];
                   if (Shift = []) or CtrlOn then
                     AcionarPesquisaGrade
                 end;
    VK_Return  : CadastroTabelasCrediario.GravarLancamentosNaturezas;
  end;
end;

procedure TfrmCadastroTabelasCrediario.AcionarPesquisaGrade;
begin
  case dbgLancamentosNaturezas.SelectedIndex of
    2: begin
          TipoTabela := tbcCONTACONTABIL;
          if CadastroTabelasCrediario.TipoContaContabil='D' then
            InternoPesquisar(ctCONTADEBITO)
          else
            InternoPesquisar(ctCONTACREDITO);
       end;
    4: begin
          TipoTabela := tbcHISTORICO;
          InternoPesquisar(ctHISTORICO);
       end;
  end;
end;

procedure TfrmCadastroTabelasCrediario.edtInativoTipoRecebimentoExit(
  Sender: TObject);
begin
  inherited;
    CriticarDataInativa(edtInativoTipoRecebimento);
end;

procedure TfrmCadastroTabelasCrediario.sbnExcluirRecebimentoClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroTabelasCrediario.ExcluirRecebimentoTipoRecebimento;
  dbgRecebimentos.SetFocus;
end;

procedure TfrmCadastroTabelasCrediario.AcionaCadastroProdutos(
  Editando: Boolean);
begin
  frmCadastroProdutosCargos := TfrmCadastroProdutosCargos.Create(frmCadastroProdutosCargos);
  frmCadastroProdutosCargos.DataSet:= dtmCadastroTabelasCrediario.qryProdutosporCargo;
  dtmCadastroTabelasCrediario.formularioInsercao:= True;
  try
    if not Editando then
      dtmCadastroTabelasCrediario.qryProdutosporCargo.Append
    else
      dtmCadastroTabelasCrediario.qryProdutosporCargo.Edit;
    frmCadastroProdutosCargos.ShowModal;
  finally
    frmCadastroProdutosCargos.free;
    dtmCadastroTabelasCrediario.formularioInsercao:= False;
    dbgprodutoscargos.SetFocus;
  end
end;

procedure TfrmCadastroTabelasCrediario.sbnIncluirImpostoClick(
  Sender: TObject);
begin
  inherited;
  AcionaCadastroProdutos(False);
  AtualizaNumeroRegistros;
end;

procedure TfrmCadastroTabelasCrediario.dbgprodutoscargosDblClick(
  Sender: TObject);
begin
  inherited;
   AcionaCadastroProdutos(True);
end;

procedure TfrmCadastroTabelasCrediario.sbnExcluirImpostoClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroTabelasCrediario.ExcluirProdutoCargo;
end;

procedure TfrmCadastroTabelasCrediario.sbnIncluirTodosProdutosClick(
  Sender: TObject);
begin
  inherited;
  with dtmCadastroTabelasCrediario do
  begin
    qryProdutos.Open;
    qryProdutos.First;
    while not qryProdutos.Eof do
    begin
      if not qryProdutosporCargo.Locate('produto',qryProdutoscodigo.AsString,[]) then
      begin
        qryProdutosporCargo.Append;
        qryProdutosporCargocargo.AsInteger := qryCargoscodigo.AsInteger;
        qryProdutosporCargoproduto.AsLargeInt := qryProdutoscodigo.AsLargeInt;
        qryProdutosporCargoprodutovisual.AsString := qryProdutoscodigovisual.AsString;
        qryProdutosporCargoprodutodigitado.AsString := qryProdutoscodigovisual.AsString;

        qryProdutosporCargodescricao.AsString := qryProdutosdescricao.AsString;
        if  qryCargosmarkuppadrao.AsFloat > 0 then
          qryProdutosporCargomarkup.AsFloat:= qryCargosmarkuppadrao.AsFloat;
{        else
          qryProdutosporCargomarkup.AsFloat:= 0;}
        qryProdutosporCargo.Post;
      end;
      qryProdutos.Next;
    end;
{
    try
      Perpetrar([qryProdutosporCargo]);
    Except
      MensagemErro('O Produto já Cadastrado para este Cargo');
    end;
    ReFazConsulta(qryProdutosporCargo,[0],[qryCargoscodigo.AsVariant]);
    }
  end;
end;

procedure TfrmCadastroTabelasCrediario.AtualizaNumeroRegistros;
begin

end;

function TfrmCadastroTabelasCrediario.LocalizarProduto(Codigo: Boolean; Valor: String):Boolean;
begin
  if Codigo then
  begin
    if dtmCadastroTabelasCrediario.qryProdutosporCargo.Locate('produto',Valor,[loCaseInsensitive]) then
      dbgprodutoscargos.Fields[2].FocusControl;
  end
  else
  begin
    if dtmCadastroTabelasCrediario.qryProdutosporCargo.Locate('descricao',Valor,[loCaseInsensitive, lopartialKey]) then
      dbgprodutoscargos.Fields[2].FocusControl;
  end;
end;

procedure TfrmCadastroTabelasCrediario.rgbordenacaoClick(Sender: TObject);
begin
  inherited;
  dtmCadastroTabelasCrediario.OrdenarCodigo:= rgbordenacao.ItemIndex;

  dtmCadastroTabelasCrediario.OrdenarProdutosCargos;
end;

procedure TfrmCadastroTabelasCrediario.edtLocalizarCodigoExit(Sender: TObject);
begin
  inherited;
  LocalizarProduto(True, edtLocalizarCodigo.Text);
end;

procedure TfrmCadastroTabelasCrediario.edtLocalizarDescricaoExit(Sender: TObject);
begin
  inherited;
  LocalizarProduto(False, edtLocalizarDescricao.Text);
end;

procedure TfrmCadastroTabelasCrediario.dbgprodutoscargosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Shift = [ssCtrl] then
  begin
    case Key of
      TeclaEditarRegistro : AcionaCadastroProdutos(True);
      TeclaInserirRegistro: AcionaCadastroProdutos(False);
    end;
  end;
  if TeclaEnterOuReturn(Key) then
  begin
    with dtmCadastroTabelasCrediario do
    begin
      Selecionado:= qryProdutosporCargo.RecNo;
      qryProdutosporCargo.Edit;
    end;
  end;
end;

procedure TfrmCadastroTabelasCrediario.sbnImportarExcelClick(Sender: TObject);
begin
  inherited;
  if odgImportaExcel.Execute then
  begin
    ImportarExcel(odgImportaExcel.FileName);
    GravarDadosTabela;
  end;
end;

function TfrmCadastroTabelasCrediario.ImportarExcel(XLS: string): Boolean;
const
    xlCellTypeLastCell = $0000000B;

var XLApp, Sheet : OleVariant;
    Matriz: Variant;
    x, y, k, i : Integer;
begin
  Result:= False;
  Codigos:= TStringList.Create;
  Markups:= TStringList.Create;
  XLApp:= CreateOleObject('Excel.Application');
  XLApp.Visible:= False;
  try
    XLApp.WorkBooks.Open(XLS);
    Sheet:= XLApp.Workbooks[ExtractFileName(XLS)].WorkSheets[1];
    Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
    x:= XLApp.ActiveCell.Row;
    y:= XLApp.ActiveCell.Column;
    Matriz:= XLApp.Range['A1',Xlapp.Cells.Item[x,y]].Value;
    k:= 1;
    repeat
      for i:= 1 to y do
      begin
        if i = 1 then
          Codigos.Add(Matriz[K,i])
        else if i = 2 then
          Markups.Add(Matriz[K,i]);
      end;
        Inc(K,1);
    until k > x;
    Matriz:= Unassigned;

  finally
    if not VarIsEmpty(XLApp) then
      begin
        XLApp.Quit;
        XLAPP:=Unassigned;
        Sheet:=Unassigned;
        Result:=True;
      end;
  end;
end;

procedure TfrmCadastroTabelasCrediario.GravarDadosTabela;
var i: Integer;
begin
  with dtmCadastroTabelasCrediario do
  begin
    for i:= 0 to Codigos.Count-1 do
    begin
      if ((trim(Codigos[i]) <> '')and(PossuiSomenteNumero(Codigos[i]))) and
         ((trim(Markups[i]) <> '')and(PossuiSomenteNumero(Markups[i])))  then
      begin
        formularioInsercao := True;
        if not qryProdutosporCargo.Locate('produto',(Codigos[i]),[]) then
        begin
          qryProdutosporCargo.Append;
          qryProdutosporCargocargo.AsInteger   := qryCargoscodigo.AsInteger;
          qryProdutosporCargoproduto.AsLargeInt:= StrToInt(Codigos[i]);
          qryProdutosporCargomarkup.AsFloat    := StrToCurr(Markups[i]);
          qryProdutosporCargo.Post
        end
        else
        begin
          qryProdutosporCargo.Edit;
          qryProdutosporCargomarkup.AsFloat   := StrToCurr(Markups[i]);
          qryProdutosporCargo.Post
        end;
      end;
    end;
    Perpetrar([qryProdutosporCargo]);
    RefazConsultaPorNome(qryProdutosporCargo,['Cargo'],[qryCargoscodigo.AsVariant]);
    Codigos.Clear;
    Markups.Clear;
  end;
end;

procedure TfrmCadastroTabelasCrediario.flkPrecedenteExit(Sender: TObject);
begin
  inherited;
  with dtmCadastroTabelasCrediario do
    if qryTiposCartasprecedente.AsInteger<>0 then
      if (qryTiposCartasatraso.AsInteger <= qryProcuraTiposCartasPrecedenteatraso.AsInteger) and
         (qryTiposCartasatraso.AsInteger <> 0) then
      begin
        MensagemErro(format('O atraso deve ser superior a %s dias da carta precedente',
                    [qryProcuraTiposCartasPrecedenteatraso.AsString]));
        flkPrecedente.Clear;
        flkPrecedente.SetFocus;
        flkPrecedente.SelectAll;
      end;
end;

procedure TfrmCadastroTabelasCrediario.edtDiasAtrasoExit(Sender: TObject);
begin
  inherited;
  with dtmCadastroTabelasCrediario do
    if qryTiposCartasatraso.AsInteger=0 then
    begin
      MensagemErro('O atraso deve ser superior a zero.');
      edtDiasAtraso.Clear;
      edtDiasAtraso.SetFocus;
      edtDiasAtraso.SelectAll;
    end
    else
    if qryTiposCartasprecedente.AsInteger<>0 then
    begin
      if qryTiposCartasatraso.AsInteger <= qryProcuraTiposCartasPrecedenteatraso.AsInteger then
      begin
        MensagemErro(format('O atraso deve ser superior a %s dias da carta precedente',
                    [qryProcuraTiposCartasPrecedenteatraso.AsString]));
        edtDiasAtraso.Clear;
        edtDiasAtraso.SetFocus;
        edtDiasAtraso.SelectAll;
      end;
    end
    else
    begin
      qryConsultaTiposCartas.MacroByName('SQL').AsString := format('Where precedente = %s and atraso <= %s',
                       [inttostr(qrytiposcartascodigo.asinteger),
                        inttostr(qryTiposCartasatraso.asinteger)]);
      refazconsulta(qryConsultaTiposCartas,[],[]);
      if not qryConsultaTiposCartas.IsEmpty then
      begin
        MensagemErro(format('O atraso deve ser inferior a %s dias da carta precedente n. %s.',
                    [inttostr(qryConsultaTiposCartasatraso.Asinteger),
                     qryConsultaTiposCartascodigo.Asstring]));
        edtDiasAtraso.Clear;
        edtDiasAtraso.SetFocus;
        edtDiasAtraso.SelectAll;
      end;
    end;
end;

procedure TfrmCadastroTabelasCrediario.sbnTipoAtendimentoClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkTipoAtendimento, '');
end;

procedure TfrmCadastroTabelasCrediario.rgbEntradaClick(Sender: TObject);
begin
  inherited;
  ckbLantosCustoMedio.Enabled := not rgbEntrada.Checked;
  
  ckbrequernfsaida.Visible   := rgbEntrada.Checked;
  ckbrequernfentrada.Visible := rgbSaida.Checked;

  rgpEntrada.visible := true;

end;

procedure TfrmCadastroTabelasCrediario.rgbSaidaClick(Sender: TObject);
begin
  inherited;
  ckbLantosCustoMedio.Enabled := rgbSaida.Checked;
  
  ckbrequernfsaida.Visible   := rgbEntrada.Checked;
  ckbrequernfentrada.Visible := rgbSaida.Checked;

  rgpEntrada.Visible := false;

end;

procedure TfrmCadastroTabelasCrediario.rgbServicosClick(Sender: TObject);
begin
  inherited;
  ckbLantosCustoMedio.Enabled := not rgbServicos.Checked;

  ckbrequernfsaida.Visible   := false;
  ckbrequernfentrada.Visible := false;

  rgpEntrada.Visible := false;

end;

procedure TfrmCadastroTabelasCrediario.sbnIncluirContaTipoRecebimentoClick(
  Sender: TObject);
begin
  inherited;
  AcionaCadastroContas(False);
end;

procedure TfrmCadastroTabelasCrediario.AcionaCadastroContas(
  Editando: Boolean);
begin
  frmCadastroContasTiposRecebimentos := TfrmCadastroContasTiposRecebimentos.Create(frmCadastroContasTiposRecebimentos);
  frmCadastroContasTiposRecebimentos.DataSet:= dtmCadastroTabelasCrediario.qryContasTiposRecebimentos;
  try
    if not Editando then
      dtmCadastroTabelasCrediario.IncluirContasTiposRecebimentos
    else
      dtmCadastroTabelasCrediario.EditarContasTiposRecebimentos;
    frmCadastroContasTiposRecebimentos.ShowModal;
  finally
    frmCadastroContasTiposRecebimentos.free;
    dbgContasTiposRecebimentos.SetFocus;
  end
end;

procedure TfrmCadastroTabelasCrediario.dbgContasTiposRecebimentosDblClick(
  Sender: TObject);
begin
  inherited;
  AcionaCadastroContas(true);
end;

procedure TfrmCadastroTabelasCrediario.dbgContasTiposRecebimentosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Shift = [ssCtrl] then
    case Key of
      TeclaEditarRegistro : AcionaCadastroContas(True);
      TeclaInserirRegistro: AcionaCadastroContas(False);
      TeclaExcluirRegistro: sbnExcluirContaTipoRecebimento.Click;
    end;
end;

procedure TfrmCadastroTabelasCrediario.sbnExcluirContaTipoRecebimentoClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroTabelasCrediario.ExcluirContasTiposRecebimentos;
end;

procedure TfrmCadastroTabelasCrediario.aclAtualizarUpdate(Sender: TObject);
begin
  inherited;
  if pgcTabelas.ActivePage = tstNaturezas then
  begin
    gbxNaoGerarCreditoDebitocbsibs.top := gbxIBSCBS.top;
    with dtmCadastroTabelasCrediario do
    begin
      ckbNaoGerarCreditoICMS.visible := (qryNaturezasTipo.AsString = 'E')  and

                                        (ExisteCRTSimples or
                                         {para o regime normal libera-se somnete os cst´s que são tributados}
                                         (ExisteCRTNormal and
                                          ((qryNaturezasicmscst.asstring = ctTRIBUTADA               ) or    {00}
                                           (qryNaturezasICMSCST.asstring = ctREDUCAOBASE             ) or    {20}
                                           (qryNaturezasICMSCST.asstring = ctDIFERIMENTO             ) or    {51}
                                           (qryNaturezasICMSCST.asstring = ctCOBRADOSUSTITUICAO      ) or    {60}
                                           (qryNaturezasICMSCST.asstring = ctOUTROS                  ))      {90}
                                         ) ) and  not (dtmCadastroTabelasCrediario.qryNaturezasTipo.AsString = 'R');

      ckbNaoGerarCreditoIPI.visible := (qryNaturezasTipo.AsString = 'E');
      ckbnaocalcularvaloresicmsdiferimento.Visible := (qryNaturezasicmscst.AsString = ctDIFERIMENTO) and  not (dtmCadastroTabelasCrediario.qryNaturezasTipo.AsString = 'R');
      ckbMercdoriaClienteouFornecedor.Visible := usuariologin.administrador and qryNaturezasinterno.AsBoolean;

      if (dtmCadastroTabelasCrediario.qryNaturezasTipo.AsString = 'R') then
      begin

        gbxICMSCST.visible := false;
        gbxDiferimento.visible := false;
        gbxCSOSN.visible := false;

        if not gbxISSQNST.visible then
          gbxISSQNST.visible := true;

        if ckbICMSSobreIPI.visible then
          ckbICMSSobreIPI.visible := false;

        if ckbicmssobredespesasacessorias.visible then
          ckbicmssobredespesasacessorias.visible := false;

      end
      else
      begin
        gbxICMSCST.visible := dtmCadastroTabelasCrediario.ExisteCRTNormal;
        gbxDiferimento.visible := (fraConsultaICMSCST.edfcodigo.text = '51');
        gbxCSOSN.visible := dtmCadastroTabelasCrediario.ExisteCRTSimples;;

        if gbxISSQNST.visible then
          gbxISSQNST.visible := false;

        if not ckbICMSSobreIPI.visible then
          ckbICMSSobreIPI.visible := true;

        if not ckbicmssobredespesasacessorias.visible then
          ckbicmssobredespesasacessorias.visible := true;

      end;
    end;
  end;
end;

procedure TfrmCadastroTabelasCrediario.CondicoesIPICST;
begin
  if dtmCadastroTabelasCrediario.qryNaturezasTipo.AsString = 'E' then
  begin
    fraConsultaIPICST.qryProcuratributosipi.MacroByName('SQL').AsString := ' and  codigo < ''50'' ';
    fraConsultaIPICST.qryConsultatributosipi.MacroByName('SQL').AsString := ' and codigo < ''50'' ';
  end
  else
  if (dtmCadastroTabelasCrediario.qryNaturezasTipo.AsString = 'S') or
     (dtmCadastroTabelasCrediario.qryNaturezasTipo.AsString = 'R') then
  begin
    fraConsultaIPICST.qryProcuratributosipi.MacroByName('SQL').AsString := ' and codigo >= ''50'' ';
    fraConsultaIPICST.qryConsultatributosipi.MacroByName('SQL').AsString := ' and codigo >= ''50'' ';
  end;
end;

procedure TfrmCadastroTabelasCrediario.sbnProcuraAgenteClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkAgenteTipoRecebimento, '');
end;

procedure TfrmCadastroTabelasCrediario.CondicoesEventos;
begin
  fraConsultaCodigoContabilEvento.qryConsultaEventos.MacroByName('condicoes').AsString := 'AND e.tipomovimentacao = ''S'' and e.tipo = ''A'' and e.inativo is null';
  fraConsultaCodigoContabilEvento.qryProcuraEventos.MacroByName('condicoes').AsString  := 'AND e.tipomovimentacao = ''S'' and e.tipo = ''A''';
end;

procedure TfrmCadastroTabelasCrediario.dbgQualidade_VendasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ctrlon then
    if key = VK_F9 then
      SelecionarCorQualidade_Vendas;
end;

procedure TfrmCadastroTabelasCrediario.dbgQualidade_VendasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dtmCadastroTabelasCrediario.qryQualidade_Vendascor.Index = datacol then
  begin
    if dtmCadastroTabelasCrediario.qryQualidade_Vendascor.asstring <> '' then
    begin
      TDBGrid(Sender).Canvas.Font.Color := StringtoColor(dtmCadastroTabelasCrediario.qryQualidade_Vendascor.asstring);
      TDBGrid(Sender).Canvas.Brush.Color := StringtoColor(dtmCadastroTabelasCrediario.qryQualidade_Vendascor.asstring);
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;  
  end;
end;

procedure TfrmCadastroTabelasCrediario.dbgQualidade_VendasDblClick(
  Sender: TObject);
begin
  inherited;
  if dbgQualidade_Vendas.SelectedField.fieldname = dbgQualidade_Vendas.ColumnByName('cor').Fieldname then
    SelecionarCorQualidade_Vendas;

end;

procedure TfrmCadastroTabelasCrediario.SelecionarCorQualidade_Vendas;
begin
  if ColorDialog1.execute then
  begin
    dtmCadastroTabelasCrediario.qryQualidade_Vendas.edit;
    dtmCadastroTabelasCrediario.qryQualidade_Vendascor.asString := inttostr(tcolorref(ColorDialog1.Color));
  end;
end;

procedure TfrmCadastroTabelasCrediario.AlterarEstadoBotoes;
begin
  inherited;
  if pgcTabelas.ActivePage = tstRedes_Adquirentes then
  begin
    sbnSalvar.Enabled := not (dtmCadastroTabelasCrediario.
                   qryRedes_Adquirentes_Tipos_Recebimentos.state in
      [dsedit, dsinsert]) and
      (dtmCadastroTabelasCrediario.
                   qryRedes_Adquirentes.state in [dsedit, dsinsert])


  end;
end;

procedure TfrmCadastroTabelasCrediario.sbnIncluirRedes_Adquirentes_Tipos_RecebimentosClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroTabelasCrediario.qryRedes_Adquirentes_Tipos_Recebimentos.append;
  DBAdvGridRedes_Adquirentes_Tipos_Recebimentos.col :=
    DBAdvGridRedes_Adquirentes_Tipos_Recebimentos.ColumnByFieldName['tipo_recebimentol'].Index;

end;

procedure TfrmCadastroTabelasCrediario.sbnRedes_Adquirentes_Tipos_RecebimentosClick(
  Sender: TObject);
begin
  inherited;
    dtmCadastroTabelasCrediario.qryRedes_Adquirentes_Tipos_Recebimentos.delete;
end;

procedure TfrmCadastroTabelasCrediario.DBAdvGridRedes_Adquirentes_Tipos_RecebimentosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Shift = [ssCtrl] then
    case Key of
      TeclaEditarRegistro : DBAdvGridRedes_Adquirentes_Tipos_Recebimentos.setfocus;
      TeclaInserirRegistro: begin
                              if sbnIncluirRedes_Adquirentes_Tipos_Recebimentos.enabled then
                                sbnIncluirRedes_Adquirentes_Tipos_RecebimentosClick(nil);
                            end;

      TeclaExcluirRegistro: begin
                              if sbnRedes_Adquirentes_Tipos_Recebimentos.enabled then
                                sbnRedes_Adquirentes_Tipos_Recebimentosclick(nil); 

                            end;
    end;
end;

procedure TfrmCadastroTabelasCrediario.AtribuirDadosRedes_Adquirentes(
  Found: Boolean);
begin
  edfcodigoredes_adquirentes.text := fraConsultaRedes_Adquirentes.qryProcuraRedes_Adquirentescodigo.asstring;
  edfcodigoredes_adquirentes.exist;

end;

procedure TfrmCadastroTabelasCrediario.pgcTabelasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  gbxNaoGerarCreditoDebitocbsibs.top := gbxIBSCBS.top;
end;

end.
