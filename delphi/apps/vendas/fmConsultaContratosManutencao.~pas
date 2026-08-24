unit fmConsultaContratosManutencao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmajudabt, ComCtrls, Buttons, ToolWin, ExtCtrls, cpdbmemo,
  fratendimentosdocumentos, StdCtrls, DBCtrls, cptexto, cpnumero, Grids,
  DBGrids, cpdbgrid, frselecaoaleatoria, frselecaoaleatoriagruposusuarios,
  frselecaoaleatoriausuarios, cpdata, frconsulta, frconsultacodigo,
  cpdbtext, Mask, cpdbfindcontrols, cppagecontrol, dmConsultaContratosManutencao,
  ctconstantes, DBMaplistCombobox, cpdbdata, biblio, fmPrincipalBasico;

type
  TfrmConsultaContratosManutencao = class(TfrmAjudaBt)
    sbnGerar: TSpeedButton;
    pgcContratos: TtecPageControl;
    tstFiltros: TTabSheet;
    gbxFilial: TGroupBox;
    gbxDatas: TGroupBox;
    gbxFauramento: TGroupBox;
    lblAFaturado: TLabel;
    edtAssinaturaInicial: TEditData;
    edtAssinaturaFinal: TEditData;
    gbxAbertura: TGroupBox;
    lblACadastro: TLabel;
    edtAberturaInicial: TEditData;
    edtAberturaFinal: TEditData;
    gbxCancelamento: TGroupBox;
    lblACancelado: TLabel;
    edtDataCanceladoInicial: TEditData;
    edtDataCanceladoFinal: TEditData;
    gbxSituacao: TGroupBox;
    ckbAssinado: TCheckBox;
    ckbFechado: TCheckBox;
    ckbCancelado: TCheckBox;
    ckbOrcado: TCheckBox;
    gbxEquipamento: TGroupBox;
    fraConsultaCodigoEquipamento: TfraConsultaCodigo;
    pgcPlanos_e_Vendedores: TtecPageControl;
    tstVendedores: TTabSheet;
    fraSelecaoAleatoriausuarios: TfraSelecaoAleatoriausuarios;
    tstGruposdeVendedores: TTabSheet;
    fraSelecaoAleatoriagruposusuarios1: TfraSelecaoAleatoriagruposusuarios;
    gbxDatadeCompra: TGroupBox;
    Label1: TLabel;
    edtDataEncerramentoInicial: TEditData;
    edtDataEncerramentoFinal: TEditData;
    tstRegistros: TTabSheet;
    gbxResultados: TGroupBox;
    pnlsituacao: TPanel;
    shpReservado: TShape;
    shpCancelado: TShape;
    Shape1: TShape;
    Shape2: TShape;
    lblAssinado: TLabel;
    lblCancelado: TLabel;
    lblFechado: TLabel;
    lblOrcado: TLabel;
    pnlcontratos: TPanel;
    dbgContratos: TtecDBGrid;
    gbxSomaTotais: TGroupBox;
    lblQtdadeRegistros: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText1: TStaticText;
    lblRegistrosMarcados: TDBEditNumero;
    lblTotaisRegistrosSelecionados: TDBEditNumero;
    lblRegistrosSelecionados: TDBEditNumero;
    lblTotaisRegistrosMarcados: TDBEditNumero;
    ckbSelecionarTodos: TCheckBox;
    pnlProdutoscontratos: TPanel;
    pnlDadosCliente: TPanel;
    fraConsultaCodigoFilial: TfraConsultaCodigo;
    GroupBox1: TGroupBox;
    fraConsultaCodigoCliente: TfraConsultaCodigo;
    pnlTop: TPanel;
    gbxVendedor: TGroupBox;
    fraConsultaVendedor: TfraConsultaCodigo;
    gbxConsultaCliente: TGroupBox;
    fraConsultaCliente: TfraConsultaCodigo;
    gbxDatasFormatoContrato: TPanel;
    gbxDatadaAssinatura: TGroupBox;
    edtDataAssinatura: TDBEditData;
    gbxVigencia: TGroupBox;
    edtVigencia: TDBEditData;
    GroupBox2: TGroupBox;
    edtConclusao: TDBEditData;
    gbxDiaVencimento: TGroupBox;
    edtDiasAtraso: TDBEditNumero;
    gbxFormatoContrato_: TGroupBox;
    dbMapFormaContrato: TDBMaplistCombobox;
    gbxDataAbertura: TGroupBox;
    edtAbertura: TDBEditData;
    gbxPainelLocacao: TPanel;
    lblPeriodoMinimoLocacao: TStaticText;
    edtdiaslocados: TDBEditNumero;
    gbxEntrega: TGroupBox;
    lblDataEntrega: TStaticText;
    lblTaxadeEntrega: TStaticText;
    edtDataEntrega: TDBEditData;
    edtvalortaxaentrega: TDBEditNumero;
    gbxFianca: TGroupBox;
    lblvalorcaucao: TStaticText;
    edtvalorcaucao: TDBEditNumero;
    edtTitularCaucao: TStaticText;
    edtnometitularidadecaucao: TDBEditTexto;
    gbxFormadoAluguel: TGroupBox;
    DBMformadoaluguel: TDBMaplistCombobox;
    gbxCPF_CNPJ: TGroupBox;
    dtxCnpj: TtecDBText;
    dtxSituacaoContrato: TtecDBText;
    gbxFilialContrato: TGroupBox;
    fraConsultaFilial: TfraConsultaCodigo;
    gbxObservacoes: TGroupBox;
    mmoObservacoesMontagem: TtecDBMemo;
    pgcDetalhes: TtecPageControl;
    tstLocacao: TTabSheet;
    gbxServicosContratosManutencao: TGroupBox;
    pnlBottom: TPanel;
    lblValorTotal: TLabel;
    edtValorTotal: TDBEditNumero;
    dbgServicos: TtecDBGrid;
    GroupBox3: TGroupBox;
    fraConsultaEquipamento: TfraConsultaCodigo;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    lblMarca: TLabel;
    lblModelo: TLabel;
    lblOpcionais: TLabel;
    lblAno: TLabel;
    dtxReferencia: TtecDBText;
    dtxMarca: TtecDBText;
    dtxDescricaoMarca: TtecDBText;
    dtxModelo: TtecDBText;
    dtxOpcionais: TtecDBText;
    dtxAno: TtecDBText;
    tstSituacaoFinanceira: TTabSheet;
    dbgContratosSelecionados: TtecDBGrid;
    Timer1: TTimer;
    sbnContratoMS: TSpeedButton;
    sbnContrato: TSpeedButton;
    procedure dbgContratosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgContratosDblClick(Sender: TObject);
    procedure dbgContratosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnContratoClick(Sender: TObject);
    procedure sbnContratoMSClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

  end;

var
  frmConsultaContratosManutencao: TfrmConsultaContratosManutencao;

implementation

{$R *.dfm}

{ TfrmConsultaContratosManutencao }

constructor TfrmConsultaContratosManutencao.Create(AOwner: TComponent);
begin
  dtmConsultaContratosManutencao := TdtmConsultaContratosManutencao.Create(Self);
  inherited;
  fraConsultaCodigoFilial.TipoPesquisa := pesFILIAIS;
  fraConsultaCodigoFilial.edfCodigo.Text := IntToStr(dtmConsultaContratosManutencao.FilialBase);
  fraConsultaCodigoFilial.edfCodigo.Exist;

  fraConsultaFilial.TipoPesquisa := pesFILIAIS;

  fraConsultaCodigoCliente.TipoCliente := 'C';
  fraConsultaCodigoCliente.TipoPesquisa := pesCLIENTES;

  fraConsultaCliente.TipoCliente := 'C';
  fraConsultaCliente.TipoPesquisa := pesCLIENTES;

  fraConsultaCodigoEquipamento.tipopesquisa := pesEQUIPAMENTO;

  fraConsultaEquipamento.tipopesquisa := pesEQUIPAMENTO;

  fraConsultaVendedor.tipopesquisa := pesUSUARIOS;

  edtAberturaInicial.Text     := DateToStr(dtmConsultaContratosManutencao.DataServidor - 60);
  edtAberturaFinal.Text       := DateToStr(dtmConsultaContratosManutencao.DataServidor);

  setarActivePage(self);


end;

destructor TfrmConsultaContratosManutencao.Destroy;
begin

  inherited;
end;

procedure TfrmConsultaContratosManutencao.dbgContratosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

  TDBGrid(Sender).Canvas.Brush.Color := $007FAA55;
  TDBGrid(Sender).Canvas.Font.Color  := clBlack;

  if dtmConsultaContratosManutencao.qryContratosManutencaosituacao.asString = 'O' then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := clAqua;
    TDBGrid(Sender).Canvas.Font.Color  := clBlack;
  end
  else
  if dtmConsultaContratosManutencao.qryContratosManutencaosituacao.asString = 'A' then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := $00FFD9A4;
    TDBGrid(Sender).Canvas.Font.Color  := clBlack;
  end
  else
  if dtmConsultaContratosManutencao.qryContratosManutencaosituacao.asString = 'F' then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := $007FAA55;
    TDBGrid(Sender).Canvas.Font.Color  := clBlack;
  end
  else
  if dtmConsultaContratosManutencao.qryContratosManutencaosituacao.asString = 'C' then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := clYellow;
    TDBGrid(Sender).Canvas.Font.Color  := clBlack;
  end;

  if TDBGrid(Sender).DataSource.DataSet.FieldByName('selecionar').AsBoolean then
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmConsultaContratosManutencao.dbgContratosDblClick(
  Sender: TObject);
begin
  inherited;
  dtmConsultaContratosManutencao.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
end;

procedure TfrmConsultaContratosManutencao.dbgContratosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Space then
    if Shift = [ssCtrl] then
      dtmConsultaContratosManutencao.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
end;

procedure TfrmConsultaContratosManutencao.ckbSelecionarTodosClick(
  Sender: TObject);
begin
  inherited;
   dtmConsultaContratosManutencao.MarcarSelecionados(ckbSelecionarTodos.Checked, True);
end;

procedure TfrmConsultaContratosManutencao.Timer1Timer(Sender: TObject);
begin
  inherited;
  sbnGerar.enabled := pgcContratos.activepage = tstFiltros;
  sbnContratoMS.enabled := (pgcContratos.activepage = tstRegistros) and
                           (dtmConsultaContratosManutencao.qryContratosManutencao.recordcount<>0);

  sbnContrato.enabled := (pgcContratos.activepage = tstRegistros) and
                         (pgcDetalhes.activePage = tstSituacaoFinanceira) and
                         (dtmConsultaContratosManutencao.qryParcelasContratosManutencaocontrato.asstring<>'');

  
end;

procedure TfrmConsultaContratosManutencao.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if dtmConsultaContratosManutencao.GerarConsulta(
    edtAberturaInicial.text,
    edtAberturaFinal.text,

    edtAssinaturaInicial.text,
    edtAssinaturaFinal.text,

    edtDataEncerramentoInicial.text,
    edtDataEncerramentoFinal.text,

    edtDataCanceladoInicial.text,
    edtDataCanceladoFinal.text,

    ckbOrcado.checked,
    ckbAssinado.checked,
    ckbFechado.checked,
    ckbCancelado.checked,

    fraConsultaCodigoFilial.edfcodigo.text,

    fraConsultaCodigoCliente.edfcodigo.text,

    fraSelecaoAleatoriausuarios.ListaCondicional,
    fraSelecaoAleatoriagruposusuarios1.ListaCondicional,

    fraConsultaCodigoEquipamento.edfCodigo.text) then
      pgcContratos.activePage := tstRegistros;





end;

procedure TfrmConsultaContratosManutencao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F6 : if sbnGerar.enabled then sbnGerarClick(Sender);
    VK_F8 : if sbnContratoMS.enabled then sbnContratoMSClick(Sender);
    VK_F10 : if sbnContrato.enabled then sbnContratoClick(Sender);

  end;

end;

procedure TfrmConsultaContratosManutencao.sbnContratoClick(
  Sender: TObject);
begin
  inherited;
  TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmConsultaContratosManutencao.qryParcelasContratosManutencaocontrato.asstring], 'TfrmCadastroContratos', True)
end;

procedure TfrmConsultaContratosManutencao.sbnContratoMSClick(
  Sender: TObject);
begin
  inherited;
  TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmConsultaContratosManutencao.qryContratosManutencaonumero.asstring], 'TfrmCadastroContratosManutencao', True)
end;

end.
