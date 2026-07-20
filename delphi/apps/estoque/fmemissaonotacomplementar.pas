unit fmemissaonotacomplementar;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadrao,  DBCtrls, Mask, DBGrids,
  ComCtrls, Buttons, ExtCtrls,
  //Terceiros
  ZQuery,
  //Biblio
  ctconstantes, clparametrossistema,
  //Repositorio
  fmconsultabasica, fmconsultaporcampo, frconsulta, frconsultacodigo,
  //Componentes
  cpdbtext, cpdbfindcontrols, cpdbgrid, cpdbmemo, cppagecontrol,
  cpnumero, cptexto, cpdbdata,  DB, ZPgSqlQuery, cpquery,
  cpcpfcnpj, clusuario, Grids, frlancamentocontabilidade, frendereco,
  frenderecoeditor, cpcep, ToolWin;

type
  TfrmEmissaoNotaComplementar = class(TfrmCadastroPadrao)
    pnlFiltro: TPanel;
    pnlDados: TPanel;
    pgcprodutosnotacomplemtar: TtecPageControl;
    tstProdutos: TTabSheet;
    tstObservacoes: TTabSheet;
    tstTotaisNota: TTabSheet;
    dbgProdutos: TtecDBGrid;
    Panel4: TPanel;
    gbxDadosNotaFiscal: TGroupBox;
    gbxDestinatario: TGroupBox;
    dtxCliente: TtecDBText;
    gbxCPFouCNPJ: TGroupBox;
    gbxNatureza: TGroupBox;
    gbxCFOP: TGroupBox;
    dtxDescricaoCFOP: TtecDBText;
    dtxNatureza: TtecDBText;
    gbxEmissao: TGroupBox;
    gbxSaida: TGroupBox;
    gbxNrNota: TGroupBox;
    ckbSelecionarTodos: TCheckBox;
    Panel5: TPanel;
    gbxDescricaoNota: TGroupBox;
    Bevel2: TBevel;
    mmoDescricaoSemProdutos: TtecDBMemo;
    gbxServicos: TGroupBox;
    edtServicos: TDBEditNumero;
    gbxDesconto: TGroupBox;
    edtDesconto: TDBEditNumero;
    gbxAcrescimo: TGroupBox;
    edtAcrescimo: TDBEditNumero;
    gbxTotalProdutos: TGroupBox;
    dtxValorVista: TtecDBText;
    gbxICMSSubstituicacao: TGroupBox;
    sbnGerarICMSSubst: TSpeedButton;
    edtICMSSubstituicao: TDBEditNumero;
    gbxBaseSubstituicao: TGroupBox;
    edtBaseSubstituicao: TDBEditNumero;
    gbxValorICMS: TGroupBox;
    edticms: TDBEditNumero;
    gbxBaseICMS: TGroupBox;
    edtBaseICMS: TDBEditNumero;
    gbxFrete: TGroupBox;
    edtFrete: TDBEditNumero;
    gbxSeguro: TGroupBox;
    edtSeguro: TDBEditNumero;
    gbxDespAcessorias: TGroupBox;
    edtDespesasAcessorias: TDBEditNumero;
    gbxValorIPI: TGroupBox;
    edtValorIPI: TDBEditNumero;
    gbxTotalNota: TGroupBox;
    edtValorNota: TDBEditNumero;
    pnlObservacoes: TPanel;
    gbxObservacoesComplementares: TGroupBox;
    Bevel1: TBevel;
    mmoObservacoesComplementares: TtecDBMemo;
    dtxCodigoCliente: TtecDBText;
    dtxCodigoFiscal: TtecDBText;
    gbxFilial: TGroupBox;
    gbxSerie: TGroupBox;
    fraConsultaSerie: TfraConsultaCodigo;
    fraConsultaFilial: TfraConsultaCodigo;
    fraConsultaNota: TfraConsultaCodigo;
    dtxEmissao: TtecDBText;
    dtxsaida: TtecDBText;
    gbxnovoNumeronota: TGroupBox;
    dtxnovonumero: TtecDBText;
    tstImpostos: TTabSheet;
    pnlOpcoesImpostos: TPanel;
    sbnIncluirImposto: TSpeedButton;
    sbnExcluirImposto: TSpeedButton;
    sbnIncluirAliquotasImpostos: TSpeedButton;
    dbgImpostos: TtecDBGrid;
    tstContabilidade: TTabSheet;
    fraLancamentoContabilidade: TfraLancamentoContabilidade;
    dtxcpf_cnpj: TtecDBText;
    tstCliente: TTabSheet;
    gbxCliente: TGroupBox;
    gbxObservacoes: TGroupBox;
    Bevel3: TBevel;
    mmoObservacoes: TtecDBMemo;
    tstServicos: TTabSheet;
    gbxImpostosRetidos: TGroupBox;
    gbxIRRF: TGroupBox;
    edtIRRetido: TDBEditNumero;
    gbxPISRetido: TGroupBox;
    edtPISRetido: TDBEditNumero;
    gbxINSS: TGroupBox;
    edtINSSRetido: TDBEditNumero;
    gbxCOFINSRetida: TGroupBox;
    edtCofinsRetido: TDBEditNumero;
    gbxCSLLRetida: TGroupBox;
    edtCSLLRetido: TDBEditNumero;
    gbxISSQN: TGroupBox;
    edtISSRetido: TDBEditNumero;
    gbxValorServicos: TGroupBox;
    edtValorServicos: TDBEditNumero;
    fraEndereco: TfraEndereco;
    procedure dbgProdutosDblClick(Sender: TObject);
    procedure dbgProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure sbnIncluirImpostoClick(Sender: TObject);
    procedure dbgImpostosDblClick(Sender: TObject);
    procedure dbgImpostosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnExcluirImpostoClick(Sender: TObject);
    procedure sbnIncluirAliquotasImpostosClick(Sender: TObject);
    procedure pgcprodutosnotacomplemtarChange(Sender: TObject);
    procedure edtICMSSubstituicaoChange(Sender: TObject);
    procedure sbnGerarICMSSubstClick(Sender: TObject);
    procedure fraConsultaNotaedfCodigoFound(Found: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure AtribuirCampos;
    { Private declarations }
  protected
    function InternoGravar: Boolean; override;

  public
    ParametroFilial : Variant;
    ParametroSerie  : Variant;
    ParametroNota   : Variant;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function  IncluirImpostosNotaFiscal(Editar:Boolean):Boolean;
  end;

var
  frmEmissaoNotaComplementar: TfrmEmissaoNotaComplementar;

implementation

uses
  //CLX
    Windows, DateUtils,
  //Biblio
    biblio,
  //Repositorio
    fmajuda,
  //Projeto
    dmemissaonotacomplementar, fmnavcontroles, dmbasico,
    fmcadastroimpostosnotacomplementar;
{$R *.dfm}

{ TfrmEmissaoNotaComplementar }


procedure TfrmEmissaoNotaComplementar.AtribuirCampos;
begin
   if fraConsultaFilial.edfCodigo.Text<>'' then
     ParametroFilial:= strtoint(fraConsultaFilial.edfCodigo.text)
   else
     ParametroFilial := 0;

   fraConsultaSerie.qryConsultaSerie.ParamByName('Filial').AsInteger:= ParametroFilial;
   fraConsultaSerie.qryProcuraSerie.ParamByName('Filial').AsInteger:= ParametroFilial;

   if fraConsultaSerie.edfCodigo.Text<>'' then
     ParametroSerie:= fraConsultaSerie.edfCodigo.Text
   else
     ParametroSerie := '';

   fraConsultaNota.qryProcuraNotas.ParamByName('Filial').AsInteger:= ParametroFilial;
   fraConsultaNota.qryProcuranotas.ParamByName('Serie').AsString:= ParametroSerie;
   //fraConsultaNota.qryConsultaNotas.ParamByName('Filial').AsInteger:= ParametroFilial;
 //  fraConsultaNota.qryConsultaNotas.ParamByName('Serie').AsString:= ParametroSerie;
end;

constructor TfrmEmissaoNotaComplementar.Create(AOwner: TComponent);
begin
  inherited;
  dtmEmissaonotacomplementar:= tdtmemissaonotacomplementar.Create(self);
  Dataset:= dtmEmissaoNotaComplementar.qryConsultadadosFiscais;

  fraConsultaFilial.TipoPesquisa := pesFILIAIS;
  fraConsultaSerie.TipoPesquisa  := pesSERIES;
  fraConsultaSerie.CondicoesdaConsulta:= AtribuirCampos;
  fraConsultaNota.TipoPesquisa   := pesNOTASFILIAIS;
  fraconsultanota.CondicoesdaConsulta := Atribuircampos;

  dbgProdutos.Columns[5].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutos.Columns[6].Visible := ParSistema.UsarGradesProdutos;

  dtmEmissaoNotaComplementar.qryConsultadadosFiscais.Open;

  gbxnovoNumeronota.Visible:= False;

  tstContabilidade.TabVisible := ParSistema.GerarContabilidade;

  pgcprodutosnotacomplemtar.ActivePage:= tstProdutos;

  with fraLancamentoContabilidade do
  begin
    VaLorICMS                := dtmEmissaoNotaComplementar.getvaloricms;
    ValorIPI                 := dtmEmissaoNotaComplementar.getValorIPI;
    ValordaNota              := dtmEmissaoNotaComplementar.GetValordaNota;
    ValordosProdutos         := dtmEmissaoNotaComplementar.GetValorProdutos;
    ValorServicos            := dtmEmissaoNotaComplementar.GetValorServicos;
    ValorAcrescimo           := dtmEmissaoNotaComplementar.GetValorAcrescimo;
    ValorFrete               := dtmEmissaoNotaComplementar.GetValorFrete;
    ValorSeguro              := dtmEmissaoNotaComplementar.GetValorSeguro;
    ValorDespesasAcessorias  := dtmEmissaoNotaComplementar.GetValorDespesasAcessorias;
    ValorCustodaMercadoria   := dtmEmissaoNotaComplementar.RetornaZero;
    ValorICMSSubstituicao    := dtmEmissaoNotaComplementar.GetValorICMSSubstituicao;
    ValorcofinsRetido        := dtmEmissaoNotaComplementar.GetValorCofinsRetido;
    ValorcsllRetido          := dtmEmissaoNotaComplementar.GetValorcsllRetido;
    ValorinssRetido          := dtmEmissaoNotaComplementar.GetValorinssRetido;
    ValorirRetido            := dtmEmissaoNotaComplementar.GetValorirRetido;
    Valoriss                 := dtmEmissaoNotaComplementar.GetValorISS;
    ValorissRetido           := dtmEmissaoNotaComplementar.GetValorISSRetido;
    ValorpisRetido           := dtmEmissaoNotaComplementar.GetValorpisRetido;
    ValorDescontos           := dtmEmissaoNotaComplementar.GetValordesconto;
    ValorReceitasDespesasFinanceiras := dtmEmissaoNotaComplementar.RetornaZero;
    DataDocumento            := dtmEmissaoNotaComplementar.GetDataDocumento;
    CodigoNatureza           := dtmEmissaoNotaComplementar.GetCodigoNatureza;
    DebitoFornecedor         := dtmEmissaoNotaComplementar.getDebitoFornecedor;
    CreditoFornecedor        := dtmEmissaoNotaComplementar.getCreditoFornecedor;
    SomenteLeituraContabilidade := dtmEmissaoNotaComplementar.getSomenteLeituraContabilidade;
    GerarDuplicatas          := dtmEmissaoNotaComplementar.GetGerarDocumentoPag;
    DescricaoHistorico       := dtmEmissaoNotaComplementar.getdescricaohistorico;
    FilialDocumento          := dtmEmissaoNotaComplementar.GetFilialDocumento;
    CodigoDocumento          := dtmEmissaoNotaComplementar.GetCodigoDocumento;
    NumeroNotaFiscal         := dtmEmissaoNotaComplementar.getnumeronotafiscal;
    ContaDebitarouCreditar   := dtmEmissaoNotaComplementar.GetContaDebitar;
    HistoricoDebitarouCreditar := dtmEmissaoNotaComplementar.GetHistoricoDebitar;

    Origem                   := 'S';
    OrigemFormulario         := 'S';
    NomeOrigemFormulario     := self.name;

    AtribuirContaDocumento   := dtmEmissaoNotaComplementar.AtribuirContaCreditoDocumentoPag;
    EditarDocumento          := dtmEmissaoNotaComplementar.EditarNotaFiscal;
  end;
end;

destructor TfrmEmissaoNotaComplementar.Destroy;
begin
  frmEmissaoNotaComplementar:= nil;
  inherited;
end;

procedure TfrmEmissaoNotaComplementar.dbgProdutosDblClick(Sender: TObject);
begin
  inherited;
  dtmEmissaoNotaComplementar.MarcarSelecionados(ckbSelecionarTodos.Checked,False);
end;

procedure TfrmEmissaoNotaComplementar.dbgProdutosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
  if Shift = [ssCtrl] then
    dtmEmissaoNotaComplementar.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
end;

procedure TfrmEmissaoNotaComplementar.dbgProdutosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dbgProdutos.DataSource.DataSet.FieldByName('OK').AsBoolean then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmEmissaoNotaComplementar.ckbSelecionarTodosClick(
  Sender: TObject);
begin
  inherited;
  dtmEmissaoNotaComplementar.MarcarSelecionados(ckbSelecionarTodos.Checked, True);
end;


function TfrmEmissaoNotaComplementar.IncluirImpostosNotaFiscal(
  Editar: Boolean): Boolean;
begin
  if not dtmEmissaoNotaComplementar.SomenteLeituraImpostos then
  begin
    if dtmEmissaoNotaComplementar.TabelaNotaFiscalVazia then
      Result := False
    else
    begin
      frmCadastroImpostoNotaComplementar := TfrmCadastroImpostoNotaComplementar.Create(frmCadastroImpostoNotaComplementar);

      Result := dtmEmissaoNotaComplementar.IncluirImpostosNotaFiscal(Editar);
      frmCadastroImpostoNotaComplementar.ShowModal;
      frmCadastroImpostoNotaComplementar.Free;
      dtmEmissaoNotaComplementar.CancelarImpostos;
    end;
    dbgImpostos.SetFocus
  end
  else
    Result := False
end;

procedure TfrmEmissaoNotaComplementar.sbnIncluirImpostoClick(
  Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  IncluirImpostosNotaFiscal(False);
end;

procedure TfrmEmissaoNotaComplementar.dbgImpostosDblClick(Sender: TObject);
begin
  inherited;
  IncluirImpostosNotaFiscal(True);
end;

procedure TfrmEmissaoNotaComplementar.dbgImpostosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Shift = [ssCtrl] then begin
    case Key of
      TeclaEditarRegistro : IncluirImpostosNotaFiscal(True);
      TeclaInserirRegistro: IncluirImpostosNotaFiscal(False);
    end;
  end;
end;

procedure TfrmEmissaoNotaComplementar.sbnExcluirImpostoClick(
  Sender: TObject);
begin
  inherited;
  dbgImpostos.SetFocus;
  if not dtmEmissaoNotaComplementar.SomenteLeituraImpostos then
    dtmEmissaoNotaComplementar.ExcluirImpostoNotaFiscal;
end;

procedure TfrmEmissaoNotaComplementar.sbnIncluirAliquotasImpostosClick(
  Sender: TObject);
begin
  inherited;
  if not dtmEmissaoNotaComplementar.SomenteLeituraImpostos then
    dtmEmissaoNotaComplementar.CalcularDadosFiscais;
end;

procedure TfrmEmissaoNotaComplementar.pgcprodutosnotacomplemtarChange(
  Sender: TObject);
begin
  inherited;
  if (pgcprodutosnotacomplemtar.ActivePage = tstTotaisNota) then
  begin
    if dtmEmissaoNotaComplementar.AlteracoesProdutos <= 0 then
    begin
      dtmEmissaoNotaComplementar.LimparCamposDadosFiscais;
      dtmEmissaoNotaComplementar.LimparImpostos;
    end
    else
    begin
      dtmEmissaoNotaComplementar.CalcularValorTotalProdutos;
      dtmEmissaoNotaComplementar.CalcularValoresNotaFiscal;
    end;
  end
  else if (pgcprodutosnotacomplemtar.ActivePage = tstImpostos) then
  begin
    if dtmEmissaoNotaComplementar.AlteracoesProdutos <= 0 then
    begin
      dtmEmissaoNotaComplementar.LimparCamposDadosFiscais;
      dtmEmissaoNotaComplementar.LimparImpostos;
    end
    else
    begin
      dtmEmissaoNotaComplementar.CalcularValorTotalProdutos;
      dtmEmissaoNotaComplementar.CalcularValoresNotaFiscal;
      dtmEmissaoNotaComplementar.CalcularImpostos;
    end
  end
  else if pgcprodutosnotacomplemtar.ActivePage = tstContabilidade then
  begin
    fraLancamentoContabilidade.qryLancamentos.Open;
    fraLancamentoContabilidade.GerarLancamentosContabeis;
  end;
end;

function TfrmEmissaoNotaComplementar.InternoGravar: Boolean;
begin
  try
    Result := dtmEmissaoNotaComplementar.GravarNotaFiscal;
  finally
    gbxnovoNumeronota.Visible:= True;
  end;
end;

procedure TfrmEmissaoNotaComplementar.edtICMSSubstituicaoChange(
  Sender: TObject);
begin
  inherited;
  dtmEmissaoNotaComplementar.TotalValorICMSSubstAlterado := True;
end;

procedure TfrmEmissaoNotaComplementar.sbnGerarICMSSubstClick(
  Sender: TObject);
begin
  inherited;
  dtmEmissaoNotaComplementar.TotalValorICMSSubstAlterado := False;
  dtmEmissaoNotaComplementar.CalcularValorTotalProdutos;
end;

procedure TfrmEmissaoNotaComplementar.fraConsultaNotaedfCodigoFound(
  Found: Boolean);
begin
  inherited;
  pgcprodutosnotacomplemtar.ActivePage := tstProdutos;
  gbxnovoNumeronota.Visible:= False;
end;


procedure TfrmEmissaoNotaComplementar.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  dtmEmissaoNotaComplementar.CalcularValorTotalProdutos;
  dtmEmissaoNotaComplementar.CalcularDadosFiscais;
end;

end.
