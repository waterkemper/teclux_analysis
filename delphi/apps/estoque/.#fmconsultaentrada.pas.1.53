unit fmconsultaentrada;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids, DBCtrls, ComCtrls,
  Windows, DB, ActnList,
  // Repositorio
  fmajudabt, fmconsultaporcampo, fmconsultabasica, clparametrossistema,
  // Constantes
  ctconstantes, biblio,
  // Terceiros
  ZQuery, ZPgSqlQuery,
  // Componenetes
  cpnumero, cpdbfindcontrols, cpdatasource, cpdbgrid, cpdbtext, cpdata,
  cppagecontrol, cpeditioncontrolvalidation, cpquery, cptexto,
  // Projeto
  dmconsultaentrada, fmcadastropadrao, fmcalcularduplicatas, cpdbdata,
  cpdbmemo, fmselecionarimpressoras, ToolWin, frCartaCorrecaoEletronica,
  fmConferenciaProdutos, fmFormacaoPrecoVenda, fmConsultaProdutosNotasAnteriores,
  frmultiplaselecaoaleatoria, fmEnviarEmail, clUsuario, fmtecsoft,
  fmmanutencaopreco, fmconfirmarimpressaonocontrato,
  frselecaoaleatorianotas, frselecaoaleatoriacontratos,
  frselecaoaleatoriavendedores, fmPrincipalBasico, FolderDialog,
  AdvSmoothProgressBar;


type
  TfrmConsultaEntradas = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    sbnGerar: TSpeedButton;
    pgcParametros: TtecPageControl;
    tstParametros: TTabSheet;
    tstRegistrosSelecionados: TTabSheet;
    dtxFornecedor: TtecDBText;
    gbxFornecedor: TGroupBox;
    edfFornecedor: TtecDbEditFind;
    sbnFornecedor: TSpeedButton;
    gbxFilial: TGroupBox;
    sbnFilial: TSpeedButton;
    dtxFilial: TtecDBText;
    edfFilial: TtecDbEditFind;
    gbxEmissao: TGroupBox;
    sbnImprimir: TSpeedButton;
    pnlCabecalhoNota: TPanel;
    dbgNotas: TtecDBGrid;
    pgcDadosNotas: TtecPageControl;
    tstDadosNota: TTabSheet;
    tstConhecimentoFrete: TTabSheet;
    tstImpostosRetidos: TTabSheet;
    dtxIR: TtecDBText;
    dtxINSS: TtecDBText;
    dtxISS: TtecDBText;
    dtxCofns: TtecDBText;
    dtxPIS: TtecDBText;
    dtxCSLL: TtecDBText;
    pgcProdutos: TtecPageControl;
    tstProdutos: TTabSheet;
    dbgProdutosNota: TtecDBGrid;
    tstDuplicatas: TTabSheet;
    dbgDuplicatas: TtecDBGrid;
    tstImpostos: TTabSheet;
    tstObservacoes: TTabSheet;
    mmoObservacoes: TtecDBMemo;
    edfCfopPesquisa: TtecDbEditFind;
    dtxCfopPesquisa: TtecDBText;
    sbnCfop: TSpeedButton;
    gbxCFOP: TGroupBox;
    edtEmissaoInicial: TEditData;
    edtEmissaoFinal: TEditData;
    gbxLancto: TGroupBox;
    edtLanctoInicial: TEditData;
    edtLanctoFinal: TEditData;
    gbxNotaFiscal: TGroupBox;
    gbxSerie: TGroupBox;
    sbnSerie: TSpeedButton;
    edfSerie: TtecDbEditFind;
    gbxNumero: TGroupBox;
    edtNumero: TEditNumero;
    gxbFornecedor1: TGroupBox;
    flkFornecedores: TtecDBFindLookup;
    sbnProcurarMarcas: TSpeedButton;
    dtxDescricaoFornecedor: TtecDBText;
    gbxSerie1: TGroupBox;
    flkSerie: TtecDBFindLookup;
    sbnProcurarSeries: TSpeedButton;
    gbxNumero1: TGroupBox;
    edtNumeroNota: TDBEditNumero;
    gbxBaseICMS: TGroupBox;
    gbxValorICMS: TGroupBox;
    gbxBaseSubstituicao: TGroupBox;
    gbxICMSSubstituto: TGroupBox;
    gbxValorProdutos: TGroupBox;
    gbxAcrescimo: TGroupBox;
    gbxFrete: TGroupBox;
    gbxSeguro: TGroupBox;
    gbxDespAcessorias: TGroupBox;
    gbxValorIPI: TGroupBox;
    gbxTotalNota: TGroupBox;
    dtxAcrescimo: TtecDBText;
    dtxSeguro: TtecDBText;
    dtxValorNota: TtecDBText;
    dtxBaseICMSSubst: TtecDBText;
    dtxValorICMSSubst: TtecDBText;
    dtxDespesasAcessoarias: TtecDBText;
    dtxFreteIncluso: TtecDBText;
    gbxNatureza: TGroupBox;
    dtxNatureza: TtecDBText;
    gbxCFOP1: TGroupBox;
    flkCodigoFiscal: TtecDBFindLookup;
    sbnProcurarNaturezas: TSpeedButton;
    dtxDescricaoCFOP: TtecDBText;
    gbxEmissao1: TGroupBox;
    edtEmissao: TDBEditData;
    gbxDataLancto: TGroupBox;
    dtxLancamento: TtecDBText;
    gbxCPFouCNPJ: TGroupBox;
    dtxCNPJ: TtecDBText;
    gbxInscEstadual: TGroupBox;
    dtxInscricaoEstadual: TtecDBText;
    gbxUF: TGroupBox;
    dtxUF: TtecDBText;
    gbxDocumento: TGroupBox;
    dtxDocumentosPag: TtecDBText;
    gbxContrato: TGroupBox;
    dtxContrato: TtecDBText;
    gbxFornecedor2: TGroupBox;
    dtxFornecConhecFrete: TtecDBText;
    dtxDescFornecConhecFrete: TtecDBText;
    gbxSerie2: TGroupBox;
    dtxSerieConhecFrete: TtecDBText;
    gbxNumero2: TGroupBox;
    dtxNumeroConhecFrete: TtecDBText;
    gbxValorFrete: TGroupBox;
    dtxFreteExterno: TtecDBText;
    dtxBaseICMS: TtecDBText;
    dtxValorICMS: TtecDBText;
    dtxValorIPI: TtecDBText;
    dtxTotalProdutos: TtecDBText;
    gbxValorServicos: TGroupBox;
    edtValorServicos: TtecDBText;
    gbxValoresNota: TGroupBox;
    gbxFreteTotal: TGroupBox;
    gbxICMSFrete: TGroupBox;
    gbxValorDosServicos: TGroupBox;
    gbxINSS: TGroupBox;
    gbxISSQN: TGroupBox;
    gbxPIS: TGroupBox;
    gbxCOFINS: TGroupBox;
    gbxCSLL: TGroupBox;
    gbxIRRF: TGroupBox;
    gbxImpostosRetidos: TGroupBox;
    tecDBText2: TtecDBText;
    tstNFe: TTabSheet;
    gbxCancelamentoNFe: TGroupBox;
    dtxCancelamentoNFe: TtecDBText;
    gbxProtocoloNFe: TGroupBox;
    dtxProtocoloNFe: TtecDBText;
    gbxReciboNFe: TGroupBox;
    dtxReciboNFe: TtecDBText;
    gbxLoteNFe: TGroupBox;
    dtxLoteNFe: TtecDBText;
    lblALancto: TLabel;
    lblAEmissao: TLabel;
    gbxChaveNFe: TGroupBox;
    edtChaveNFe: TDBEditTexto;
    sbnEspelhoNota: TSpeedButton;
    gbxInutilizacao: TGroupBox;
    dtxInutilizacao: TtecDBText;
    dbgImpostosProdutos: TtecDBGrid;
    dtxCancelada: TtecDBText;
    fraCartaCorrecaoEletronica1: TfraCartaCorrecaoEletronica;
    pnlProdutos: TPanel;
    sbnConferir: TSpeedButton;
    gbxChaveNFECalculada: TGroupBox;
    edtChaveNFeCalculada: TDBEditTexto;
    gbxEvento: TGroupBox;
    sbnEvento: TSpeedButton;
    dtxEvento: TtecDBText;
    flkEvento: TtecDBFindLookup;
    dtxCodigoNatureza: TtecDBText;
    GroupBox4: TGroupBox;
    DBEditNumero6: TDBEditNumero;
    GroupBox9: TGroupBox;
    DBEditNumero10: TDBEditNumero;
    gbxSituacaoNotaEntrada: TGroupBox;
    ckbNotaEntradaNormal: TCheckBox;
    ckbNotaEntradaParcial: TCheckBox;
    ckbNotaEntradaCancelada: TCheckBox;
    ckbNotaEntradaDenegada: TCheckBox;
    sbnAcionarTelaFormacaoPrecoVenda: TSpeedButton;
    sbnVisualizarDetalhesProdutosNota: TSpeedButton;
    Timer1: TTimer;
    GroupBox1: TGroupBox;
    ckbNotasdeCompra: TCheckBox;
    ckbNotasdeTransferencia: TCheckBox;
    ckbNotasdeDevolucao: TCheckBox;
    sbnEnviarNFe: TSpeedButton;
    GroupBox2: TGroupBox;
    edtDescontoItem: TtecDBText;
    tstFreteNotasdeEntrada: TTabSheet;
    dbgNotasdeDevolucao: TtecDBGrid;
    sbnManutencaoPrecos: TSpeedButton;
    pnlSelecionarTodos: TPanel;
    ckbSelecionarTodos: TCheckBox;
    pnlLeftNotas: TPanel;
    GroupBox3: TGroupBox;
    fraSelecaoAleatorianotas1: TfraSelecaoAleatorianotas;
    pnlTop: TPanel;
    pgcMultiplaSelecao: TPageControl;
    tstMultiplosProdutos: TTabSheet;
    fraMultiplaSelecaoAleatoria1: TfraMultiplaSelecaoAleatoria;
    tstVendedores: TTabSheet;
    fraSelecaoAleatoriavendedores1: TfraSelecaoAleatoriavendedores;
    tstContratos: TTabSheet;
    fraSelecaoAleatoriacontratos1: TfraSelecaoAleatoriacontratos;
    gbxSomaTotais: TGroupBox;
    lblQtdadeRegistros: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText1: TStaticText;
    lblRegistrosMarcados: TDBEditNumero;
    lblTotaisRegistrosSelecionados: TDBEditNumero;
    lblRegistrosSelecionados: TDBEditNumero;
    lblTotaisRegistrosMarcados: TDBEditNumero;
    sbnContrato: TSpeedButton;
    sbnSaveXMLePDF: TSpeedButton;
    FolderDialog1: TFolderDialog;
    OpenDialog1: TOpenDialog;
    sbnCadastroNota: TSpeedButton;
    AdvSmoothProgressBar1: TAdvSmoothProgressBar;
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnProcuraFilialClick(Sender: TObject);
    procedure sbnProcuraFornecedorClick(Sender: TObject);
    procedure sbnProcuraSerieClick(Sender: TObject);
    procedure sbnImprimirClick(Sender: TObject);
    procedure sbnProcurarMarcasClick(Sender: TObject);
    procedure sbnProcurarSeriesClick(Sender: TObject);
    procedure sbnProcurarNaturezasClick(Sender: TObject);
    procedure sbnCfopClick(Sender: TObject);
    procedure flkCodigoFiscalExit(Sender: TObject);
    procedure sbnEspelhoNotaClick(Sender: TObject);
    procedure dbgImpostosProdutosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure sbnConferirClick(Sender: TObject);
    procedure dbgProdutosNotaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnAcionarTelaFormacaoPrecoVendaClick(Sender: TObject);
    procedure sbnVisualizarDetalhesProdutosNotaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sbnEnviarNFeClick(Sender: TObject);
    procedure sbnManutencaoPrecosClick(Sender: TObject);
    procedure fraCartaCorrecaoEletronica1sbnImprmirNotaClick(
      Sender: TObject);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure dbgNotasDblClick(Sender: TObject);
    procedure dbgNotasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgNotasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnContratoClick(Sender: TObject);
    procedure sbnSaveXMLePDFClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbnCadastroNotaClick(Sender: TObject);
  private
    vPosition : dOUBLE;
    procedure AfterScrollLinhaColunaGrade(Sender: TObject);

  protected
    dtmConsultaEntradas: TdtmConsultaEntradas;
    procedure ControlesReadOnly;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;

    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoPesquisar(Titulo: String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;

    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  ValidaCamposSelecao: Boolean;
    procedure ImprimirEspelho;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmConsultaEntradas: TfrmConsultaEntradas;
  TipoPesquisa: TtecConsultaNotasEntradas;
  ControleValido: TWinControl;

implementation

uses frselecaoaleatoriaitemdeprodutos, dmbasico;

{$R *.dfm}


constructor TfrmConsultaEntradas.Create(AOwner: TComponent);
begin
  dtmConsultaEntradas := TdtmConsultaEntradas.Create(Self);
  inherited;
  with dtmConsultaEntradas do
  begin
//    DataSet:= TabelaNotas;
    DataSet:= dtmConsultaEntradas.qryNotaFiscal;
//    Abre(ctTabelas);
    edtLanctoInicial.Text:= DateToStr(DataServidor);
    edtLanctoFinal.Text  := DateToStr(DataServidor);
  end;
  ControlesReadOnly;
  dbgProdutosNota.Columnbyname('valorgrade1').Visible := ParSistema.UsarGradesProdutos;
  dbgProdutosNota.Columnbyname('valorgrade2').Visible := ParSistema.UsarGradesProdutos;
  dtmConsultaEntradas.OnScrollLinhaColunaGrade := AfterScrollLinhaColunaGrade;
  pgcParametros.ActivePage := tstParametros;
  dbgProdutosNota.Columns[7].Width := ParSistema.TamanhoMascaraQuantidade;

  case ParSistema.PrecoUnitarioCasasDecimais of
    2: dbgProdutosNota.columnByName('quantidade').Width:=  75;
    3: dbgProdutosNota.columnByName('quantidade').Width:=  85;
    4: dbgProdutosNota.columnByName('quantidade').Width:=  95;
    5: dbgProdutosNota.columnByName('quantidade').Width:= 105;
    6: dbgProdutosNota.columnByName('quantidade').Width:= 110;
    7: dbgProdutosNota.columnByName('quantidade').Width:= 120;
    8: dbgProdutosNota.columnByName('quantidade').Width:= 130;
  end;
  dtmConsultaEntradas.AcertarCasasDecimais;

  pgcParametros.ActivePageIndex := 0;
  pgcDadosNotas.ActivePageIndex := 0;
  pgcProdutos.ActivePageIndex := 0;

  if ParSistema.PermitirProdutoAlfanumerico then
     dbgProdutosNota.Columns[1].Width:= 217
  else
     dbgProdutosNota.Columns[1].Width:= 135;
  tstNFe.TabVisible := dtmConsultaEntradas.condicaoEmissorNfe;
  edtLanctoInicial.SetFocus;


  with fraCartaCorrecaoEletronica1 do
  begin
    chave_nfe  := dtmConsultaEntradas.Getchave_nfe;
    tiponota   := 'E';
    codigonota := dtmConsultaEntradas.GetCodigoNota;
    email      := dtmConsultaEntradas.GetEmail;
    filial     := dtmConsultaEntradas.GetFilialNota;
    NumeroNota := dtmConsultaEntradas.GetNumeroNota;
    DataNota   := dtmConsultaEntradas.getDataNota;
    EmailNotaVinculada :=  dtmConsultaEntradas.GetEmail;
    SerieNota := dtmConsultaEntradas.GetSerieNota;
    CondicaoCartaDevolucao := dtmConsultaEntradas.GetCondicaoCartaCorrecao;
  end;

  sbnManutencaoPrecos.Visible :=  assigned(tfrmTecsoft(Application.MainForm).mitManutencaoPreco) and
                                  tfrmTecsoft(Application.MainForm).mitManutencaoPreco.Enabled;

  

end;

procedure TfrmConsultaEntradas.ControlesReadOnly;
begin
  flkFornecedores.ReadOnly:= not dtmConsultaEntradas.EditandoRegistro;
  flkCodigoFiscal.ReadOnly:= not dtmConsultaEntradas.EditandoRegistro;
  flkSerie.ReadOnly       := not dtmConsultaEntradas.EditandoRegistro;
  edtEmissao.ReadOnly     := not dtmConsultaEntradas.EditandoRegistro;
  edtChaveNFe.ReadOnly     := not dtmConsultaEntradas.EditandoRegistro;
end;


destructor TfrmConsultaEntradas.Destroy;
begin

  if assigned(frmConsultaProdutosNotasFiscaisAnteriores) and (frmConsultaProdutosNotasFiscaisAnteriores.owner = self) then
    frmConsultaProdutosNotasFiscaisAnteriores.free;

  if assigned(frmManutencaoPreco) then
    freeandnil(frmManutencaoPreco);


  dtmConsultaEntradas:=nil;
  inherited;
  frmConsultaEntradas := nil;
end;

function TfrmConsultaEntradas.ExisteInformacao(Parametro: Integer;NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmConsultaEntradas do
    case TipoPesquisa of
      cneFORNECEDORES : Result:= ExisteFornecedor(NomeCampo, Value);
      cneSERIES       : Result:= ExisteSerie(Nomecampo,Value);
      cneFILIAIS      : Result:= ExisteFilial(Nomecampo,Value);
      cneNATUREZA     : Result:= ExisteNatureza(NomeCampo,Value);
      cneCFOP         : Result:= ExisteCfop(NomeCampo,Value);
      else              Result:= False;
    end;
end;

function TfrmConsultaEntradas.InternoGravar: Boolean;
var
  ExcluindoDuplicatas: Boolean;

  function VerificarTamanho_CHV_NFE: boolean;
  begin
    result := true;
    if edtChaveNFe.Text <> '' then
    begin
      if length(trim(SomenteNumero(edtChaveNFe.Text))) <> 44 then
      begin
        result := false;
        MensagemErro('O tamanho da chave da nota fiscal eletrônica deve ter 44 caracteres');
        pgcDadosNotas.ActivePage := tstNFe;
        edtChaveNFe.SetFocus;
      end;
    end;
  end;

begin
  with dtmConsultaEntradas do begin
    ExcluindoDuplicatas:= False;
    Result:= inherited InternoGravar;

    if GerarPagamento and not TemDuplicatas then begin
      result := MensagemConfirmacao(ctNATUREZAGERARPAGAMENTO) = smbOk;
      if result then begin
        frmcalcularduplicatas:= Tfrmcalcularduplicatas.Create(frmcalcularduplicatas);
        frmcalcularduplicatas.ShowModal;
        if frmcalcularduplicatas.ModalResult = mrOK then
          dtmConsultaEntradas.GerarDocumento_Duplicatas(frmcalcularduplicatas.NrParcelas,
                                                        frmcalcularduplicatas.Intervalo,
                                                        frmcalcularduplicatas.Vencimento,
                                                        frmcalcularduplicatas.TipoJuros,
                                                        frmcalcularduplicatas.TipoMulta,
                                                        frmcalcularduplicatas.Juros,
                                                        frmcalcularduplicatas.Multa);
        frmcalcularduplicatas.free;
      end;
    end
    else if not GerarPagamento and TemDuplicatas then
    begin
      result := MensagemConfirmacao(Format(ctNATUREZAEXCLUIRPAGAMENTO,[edtNumeroNota.Text]))= smbOk;
      if result then begin
        if DuplicatasQuitatas then
        begin
          result := false;
          MensagemAviso(Format(ctDUPLICATASNAOEXCLUIR,[edtNumeroNota.Text]));
        end
        else begin
          ExcluirDocumento_Duplicatas;
          ExcluindoDuplicatas:= True;
        end
      end;
    end;

    if result then
      Result := VerificarTamanho_CHV_NFE;

    if result then
      Result:= dtmConsultaEntradas.GravarAlteracoesNota(ExcluindoDuplicatas);

    if Result then begin
      ControlesReadOnly;
//      dbgImpostos.Options := dbgImpostos.Options - [dgEditing];
      dbgNotas.SetFocus;
    end;

  end;
end;

function TfrmConsultaEntradas.InternoIncluir: Boolean;
begin
  Result:= dtmConsultaEntradas.AlterarNota;
  if Result then begin
    pgcDadosNotas.ActivePage:= tstDadosNota;
    pgcProdutos.ActivePage  := tstImpostos;
//    dbgImpostos.Options     := dbgImpostos.Options + [dgEditing];
    flkFornecedores.SetFocus;
    ControlesReadOnly;
  end
  else
    dbgNotas.SetFocus;
end;

function TfrmConsultaEntradas.InternoPesquisar(Titulo: String): Integer;
var
  Search: Boolean;
begin
  Result:= mrNone;
  Search:= True;
  TipoPesquisa := cneNENHUM;
  if CtrlOn then begin
    if ActiveControl = edfFornecedor then begin
      TipoPesquisa := cneFORNECEDORES;
      Titulo:= 'Fornecedores';
    end
    else if ActiveControl = edfFilial then begin
      TipoPesquisa := cneFILIAIS;
      Titulo:= 'Filiais';
    end
    else if ActiveControl = edfSerie then begin
      TipoPesquisa := cneSERIES;
      Titulo:= 'Series';
    end
    else if (ActiveControl = flkFornecedores) then begin
      TipoPesquisa := cneFORNECEDORES;
      Titulo:= 'Fornecedores';
      Search:= dtmConsultaEntradas.EditandoRegistro;
    end
    else if ActiveControl = flkSerie then begin
      TipoPesquisa := cneSERIES;
      Titulo:= 'Series';
      Search:= dtmConsultaEntradas.EditandoRegistro;
    end
    else if ActiveControl = flkCodigoFiscal then begin
      TipoPesquisa := cneNATUREZA;
      Titulo:= 'Naturezas';
      Search:= dtmConsultaEntradas.EditandoRegistro;
    end
    else if ActiveControl = edfCfopPesquisa then begin
      TipoPesquisa := cneCFOP;
      Titulo:= 'CFOP';
    end;

    if Search and (TipoPesquisa <> cneNENHUM) then
    with dtmConsultaEntradas do
    begin
      AbreTabelaPesquisa(TipoPesquisa);
      Result := inherited InternoPesquisar(Titulo);
      if Result = mrOK then begin
        Selecionar(TipoPesquisa);
//        if TipoPesquisa = cneSERIES then begin
//          edfSerie.Text:= CodSerie;
//          edfSerie.SetFocus;
//        end;
      end;
      FechaTabelaPesquisa(TipoPesquisa);
    end;
  end;
end;

function TfrmConsultaEntradas.JanelaPesquisa;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  if TipoPesquisa = cneFORNECEDORES then
    TfrmConsultaPorCampo(Result).ConsultaInterativa := False
  else begin
    TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
    TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:= False;
  end;
end;

procedure TfrmConsultaEntradas.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_Escape:  begin
                   pgcParametros.ActivePageIndex := 0;
                   dtmConsultaEntradas.FecharTabelas;
                   ControlesReadOnly;
//                   dbgImpostos.Options := dbgImpostos.Options - [dgEditing];
                 end;
        VK_F6 : if sbnGerar.Enabled then sbnGerar.Click;
        VK_F7 : if sbnImprimir.Enabled then sbnImprimir.Click;
        VK_F8 : if sbnEspelhoNota.Enabled then sbnEspelhoNota.Click;
        VK_F12 : if sbnEnviarNfe.Enabled then sbnEnviarNfe.Click;

  end;
end;

procedure TfrmConsultaEntradas.sbnGerarClick(Sender: TObject);
  function ListaSituacaoNotaEntrada: String;
  begin
    result := '';
    if ckbNotaEntradaNormal.checked    then result := result + '''N'',';
    if ckbNotaEntradaParcial.checked   then result := result + '''P'',';
    if ckbNotaEntradaCancelada.checked then result := result + '''C'',';
    if ckbNotaEntradaDenegada.checked  then result := result + '''D'',';

    if result <> '' then
      delete(result,length(result),1);
  end;
  
begin
    with dtmConsultaEntradas do
    begin
      if ValidaCamposSelecao then
      begin
        Fornecedor    := edfFornecedor.Text;
        Filial        := edfFilial.Text;
        Serie         := edfSerie.Text;
        Numero        := edtNumero.Text;
        DataInicial   := edtEmissaoInicial.Text;
        DataFinal     := edtEmissaoFinal.Text;
        LanctoInicial := edtLanctoInicial.Text;
        LanctoFinal   := edtLanctoFinal.Text;
        Cfop          := edfCfopPesquisa.Text;
        SituacaoNotaEntrada := ListaSituacaoNotaEntrada;

        ListaItemProdutos := fraMultiplaSelecaoAleatoria1.fraSelecaoAleatoriaItemdeProdutos.ListaCondicional;
        ListaProdutos     := fraMultiplaSelecaoAleatoria1.fraSelecaoAleatoriaprodutos.ListaCondicional;
        ListaLotes     := fraMultiplaSelecaoAleatoria1.fraSelecaoAleatorialotes1.ListaCondicional;

        ListaGrupos       := fraMultiplaSelecaoAleatoria1.fraSelecaoaleatoriagruposprodutos.ListaCondicional;
        ListaClasses      := fraMultiplaSelecaoAleatoria1.fraSelecaoaleatoriaclassesprodutos.ListaCondicional;
        ListaMarcas       := fraMultiplaSelecaoAleatoria1.fraSelecaoAleatoriamarcasProdutos.ListaCondicional;
        ListaCondicionalNotasEntrada := fraSelecaoAleatorianotas1.ListaCondicional;

        ListaCondicionalVendedores := fraSelecaoAleatoriavendedores1.ListaCondicional;
        ListaCondicionalContratos := fraSelecaoAleatoriacontratos1.ListaCondicional;


        NotaEntradaCompra      := ckbNotasdeCompra.checked;
        NotaEntradaDevolucao     := ckbNotasdeDevolucao.checked;
        NotaEntradaTransferencia := ckbNotasdeTransferencia.checked;

        if GerarRelatorio then
        begin
          MensagemAviso(format(ctNENHUMREGISTROSELECIONADO,['registro']));
          edtLanctoInicial.SetFocus;
        end
        else
        begin
//          dbgImpostos.Options     := dbgImpostos.Options - [dgEditing];
          ckbSelecionarTodos.checked := false;
          pgcParametros.ActivePage:= tstRegistrosSelecionados;

          //contorna chuncho 2008.04
          try
            dbgNotas.SetFocus;
            Application.MainForm.SetFocusedControl(frmConsultaEntradas);
          except
            //on E: Exception do ShowMessage(E.Message);
          end;
        end;

      end;
    end;
end;

procedure TfrmConsultaEntradas.sbnImprimirClick(Sender: TObject);
var
  CarnesAbertas, ImprimirContrato: Boolean;
begin
  inherited;
  frmConfirmarImpressaoNoContrato := TfrmConfirmarImpressaoNoContrato.Create(frmConfirmarImpressaoNoContrato, True, false,
                                     false, false, false, 1, false);


  frmConfirmarImpressaoNoContrato.ckbImprimirContrato.enabled := dtmConsultaEntradas.PodeImprimirNfe;
  frmConfirmarImpressaoNoContrato.pnlImprimirListaProdutosporLocalizacoes.visible := true;
  frmConfirmarImpressaoNoContrato.ckbImprimirListaProdutosporLocalizacao.enabled := (dtmConsultaEntradas.QtdeMarcados<>0);
  frmConfirmarImpressaoNoContrato.pnlImprimirContratomeiaPagina.visible := False;
  frmConfirmarImpressaoNoContrato.pnlParcelas.visible := False;

  frmConfirmarImpressaoNoContrato.ckbImprimirContrato.caption := 'Imprimir Nota';

  try
    frmConfirmarImpressaoNoContrato.ShowModal;
    if frmConfirmarImpressaoNoContrato.ModalResult = mrOK then
    begin
      if frmConfirmarImpressaoNoContrato.ckbImprimirListaProdutosporLocalizacao.checked then
        dtmConsultaEntradas.ImprimirListaProdutosporLocalizacao
      else
      if frmConfirmarImpressaoNoContrato.Contrato then
        dtmConsultaEntradas.Imprimir;
    end
  finally
    frmConfirmarImpressaoNoContrato.Free;
  end
end;

procedure TfrmConsultaEntradas.sbnProcuraFilialClick(Sender: TObject);
begin
  CtrlOn := True;
  edfFilial.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmConsultaEntradas.sbnProcuraFornecedorClick(Sender: TObject);
begin
  CtrlOn := True;
  edfFornecedor.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmConsultaEntradas.sbnProcuraSerieClick(Sender: TObject);
begin
  CtrlOn := True;
  edfSerie.SetFocus;
  InternoPesquisar('');
end;

function TfrmConsultaEntradas.TabelaDePesquisa: TZDataSet;
begin
  with dtmConsultaEntradas do
    case TipoPesquisa of
      cneFORNECEDORES : Result:= ConsultarFornecedor;
      cneSERIES       : Result:= ConsultarSerie;
      cneFILIAIS      : Result:= ConsultarFilial;
      cneNATUREZA     : Result:= ConsultarNatureza;
      cneCFOP         : Result:= ConsultarCfop;
      else              Result:= nil;
    end;
end;

function TfrmConsultaEntradas.ValidaCamposSelecao: Boolean;
begin
  Result:= ((trim(edtLanctoInicial.Text) <> '') or (trim(edtLanctoFinal.Text) <> ''));
  if Result then
    Result := OperadorTernario((Trim(edfFornecedor.Text) <> ''),edfFornecedor.Exist, True)   and
              OperadorTernario((Trim(edfFilial.Text) <> ''),edfFilial.Exist, True)
  else
  begin
    if trim(edtLanctoInicial.Text) = '' then
    begin
      MensagemAviso(Format(ctCAMPODEVESERPREENCHIDO,['Lançamento Inicial']));
      edtLanctoInicial.SetFocus;
    end
    else
    begin
      MensagemAviso(Format(ctCAMPODEVESERPREENCHIDO,['Lançamento Final']));
      edtLanctoFinal.SetFocus;
    end;
  end;;
end;

procedure TfrmConsultaEntradas.sbnProcurarMarcasClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  flkFornecedores.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmConsultaEntradas.sbnProcurarSeriesClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  flkSerie.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmConsultaEntradas.sbnProcurarNaturezasClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  flkCodigoFiscal.SetFocus;
  InternoPesquisar('');
end;


procedure TfrmConsultaEntradas.AfterScrollLinhaColunaGrade(
  Sender: TObject);
begin
  dbgProdutosNota.Columnbyname('valorgrade1').Title.Caption := dtmConsultaEntradas.LinhadaGrade;
  dbgProdutosNota.Columnbyname('valorgrade2').Title.Caption := dtmConsultaEntradas.colunadaGrade;

  if assigned(frmConsultaProdutosNotasFiscaisAnteriores) and (frmConsultaProdutosNotasFiscaisAnteriores.owner = self) then
    frmConsultaProdutosNotasFiscaisAnteriores.fraProdutosNotasFiscaisAnteriores1.AbrirqryProdutosNotaFiscalAnteriores;


end;

procedure TfrmConsultaEntradas.sbnCfopClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  edfCfopPesquisa.SetFocus;
  InternoPesquisar('');
end;


procedure TfrmConsultaEntradas.flkCodigoFiscalExit(Sender: TObject);
begin
  inherited;
  if dtmConsultaEntradas.QuantidadeNaturezas then
    InternoPesquisar(flkCodigoFiscal,ctCODIGOFISCAL);
end;

procedure TfrmConsultaEntradas.sbnEspelhoNotaClick(Sender: TObject);
begin
  inherited;
  ImprimirEspelho;
end;

procedure TfrmConsultaEntradas.ImprimirEspelho;
begin
  dtmConsultaEntradas.ImprimirEspelhoNota;
end;

procedure TfrmConsultaEntradas.dbgImpostosProdutosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  with dtmConsultaEntradas do begin
      if (qryCalculosProdutostipo.asstring = 'TOTAL ICMS') or
         (qryCalculosProdutostipo.asstring = 'TOTAL IPI') or
         (qryCalculosProdutostipo.asstring = 'TOTAL ISS') then
      begin
        TDBGrid(Sender).Canvas.Font.Style := [fsBold];
        if not (gdSelected in State) then
          TDBGrid(Sender).Canvas.Brush.Color := TColor(strtoint(parsistema.CorZebradoRelatorio));
      end
      else TDBGrid(Sender).Canvas.Font.Style := []
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmConsultaEntradas.sbnConferirClick(Sender: TObject);
begin
  inherited;
  with dtmConsultaEntradas do
    ConferirProdutos(qryProdutos, qryProdutosproduto.fieldname,
     qryProdutosprodutovisual.FieldName, qryProdutosdescricao.FieldName,
     qryProdutosqtdeestoque.FieldName,'NFE',qryProdutosCodigoNota.AsString,
     qryProdutosvalorgrade1.FieldName, qryProdutosvalorgrade2.FieldName,
     qryProdutoslinha.FieldName, qryProdutoscoluna.FieldName);

end;

procedure TfrmConsultaEntradas.dbgProdutosNotaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_F11 then
    sbnAcionarTelaFormacaoPrecoVendaClick(nil)
end;

procedure TfrmConsultaEntradas.sbnAcionarTelaFormacaoPrecoVendaClick(
  Sender: TObject);
begin
  inherited;
     AcionarTelaFormacaoPrecoVenda(dtmConsultaEntradas.qryEntradascodigo.asInteger,
                                   dtmConsultaEntradas.qryProdutosnumero.asInteger,
                                   dtmConsultaEntradas.qryProdutosproduto.asString,
                                   'NotasPag');
end;

procedure TfrmConsultaEntradas.sbnVisualizarDetalhesProdutosNotaClick(
  Sender: TObject);
begin
  inherited;
  AcionarTelaonsultaProdutosNotasAnteriores(self, dtmConsultaEntradas.GetCodigoNotaProduto, dtmConsultaEntradas.GetProduto);
end;

procedure TfrmConsultaEntradas.Timer1Timer(Sender: TObject);
begin
  inherited;

  with dtmConsultaEntradas do begin
    case TipoPessoa[1] of
      'F': gbxFornecedor.Caption:= 'FORNECEDOR';
      'C': gbxFornecedor.Caption:= 'FORNECEDOR (CLIENTE)';
      'L': gbxFornecedor.Caption:= 'FORNECEDOR (FILIAL)';
    end;

    sbnImprimir.Enabled := PodeImprimirNFe or (QtdeMarcados <> 0);
    sbnEnviarNfe.Enabled := PodeImprimirNFe;
  end;

  sbnEspelhoNota.Enabled := pgcParametros.ActivePage = tstRegistrosSelecionados;
  sbnProcurarNaturezas.Enabled := sbnSalvar.Enabled;
  sbnIncluir.Enabled          := (pgcParametros.ActivePage = tstRegistrosSelecionados) and (dtmConsultaEntradas.QtdeNotas > 0) and
                                 not (dtmConsultaEntradas.NotaCancelada) and not dtmConsultaEntradas.alterandonota;

  sbnGerar.Enabled            := pgcParametros.ActivePage = tstParametros;
  sbnCadastroNota.Enabled  := (pgcParametros.ActivePage = tstRegistrosSelecionados) and
                              (dtmConsultaEntradas.qryNotaFiscal.recordcount<>0); 

//  sbnImprimir.Enabled         := dtmConsultaEntradas.EhDevolucao or dtmConsultaEntradas.PermiteReImprimir;
  tstDuplicatas.TabVisible    := not dtmConsultaEntradas.EhDevolucao and dtmConsultaEntradas.TemDuplicatas;

  if not sbnSalvar.Enabled then
  begin
    ControlesReadOnly;
//    dbgImpostos.Options := dbgImpostos.Options - [dgEditing];
  end;

  tstFreteNotasdeEntrada.tabvisible := dtmConsultaEntradas.qryFreteEntradaNotas.recordcount <> 0;

  sbnConferir.enabled := not sbnSalvar.enabled and (dtmConsultaEntradas.qryProdutos.RecordCount <> 0);

  if sbnManutencaoPrecos.visible then
    sbnManutencaoPrecos.enabled := not dtmConsultaEntradas.qryProdutos.IsEmpty;


  with fraMultiplaSelecaoAleatoria1 do
    tstMultiplosProdutos.Highlighted :=
       tstItemdeProduto.Highlighted or
       tstProduto.Highlighted or
       tstSelecaoAleatoriaGrupoProduto.Highlighted or
       tstSelecaoAleatoriaClasseProduto.Highlighted or
       tstSelecaoAleatoriaMarcaProduto.Highlighted or
       tstSelecaoAleatoriamodelosProduto.Highlighted or
       tstSelecaoAleatoriaPromocoes.Highlighted or
       tstCST.Highlighted or
       tstCSOSN.Highlighted or
       tstListaPadronizada.Highlighted;

    tstVendedores.Highlighted :=
      fraSelecaoAleatoriavendedores1.fraSelecaoAleatoriavendedores.qrySelecaoAleatoria.RecordCount<>0;

    tstContratos.Highlighted :=
      fraSelecaoAleatoriacontratos1.fraSelecaoAleatoriaContrato.qrySelecaoAleatoria.RecordCount<>0;

    sbnContrato.enabled := (dtmConsultaEntradas.qryNotaFiscalcontrato.asstring <> '');

    sbnSaveXMLePDF.enabled := not dtmConsultaEntradas.qryNotaFiscalNumProtocoloNfe.isnull or dtmConsultaEntradas.qryNotaFiscalpossuixmlnfe.asBoolean;
  

end;

procedure TfrmConsultaEntradas.sbnEnviarNFeClick(Sender: TObject);
begin
  inherited;
  frmEnviarEmail := TfrmEnviarEmail.Create(frmEnviarEmail,UsuarioLogin.HostSmtp,
                     dtmConsultaEntradas.qryNotaFiscalEmail.asString,
                     dtmConsultaEntradas.qryNotaFiscalnome.asString,
                     'NFe em formato pdf', 'NFe em formato pdf', EnvioNFeEmail);
  try
    with frmEnviarEmail do
    begin
      Data        := dtmConsultaEntradas.DataServidor;
      Empresa     := PrimeiraLetraEmMaiuscula(dtmConsultaEntradas.NomeFilialBase);
      ShowModal;
      if frmEnviarEmail.modalresult = mrOk then
        dtmConsultaEntradas.EnviarEmailNfe(frmEnviarEmail.vListaEmailValidos);
    end;
  finally
    frmEnviarEmail.Free;
  end;

end;

procedure TfrmConsultaEntradas.sbnManutencaoPrecosClick(Sender: TObject);
begin
  inherited;
  AcionarTelaManutencaoPreco_NFEntrada(self, dtmConsultaEntradas.qryEntradasfornecedor.AsString,
                                             dtmConsultaEntradas.qryEntradastipofornecedor.AsString,
                                             dtmConsultaEntradas.qryEntradasserie.AsString,
                                             dtmConsultaEntradas.qryEntradasnumero.AsString);
end;

procedure TfrmConsultaEntradas.fraCartaCorrecaoEletronica1sbnImprmirNotaClick(
  Sender: TObject);
begin
  inherited;
  fraCartaCorrecaoEletronica1.sbnImprmirNotaClick(Sender);

end;

procedure TfrmConsultaEntradas.ckbSelecionarTodosClick(Sender: TObject);
begin
  inherited;
  dtmConsultaEntradas.MarcarSelecionados(ckbSelecionarTodos.Checked, True);
end;

procedure TfrmConsultaEntradas.dbgNotasDblClick(Sender: TObject);
begin
  inherited;
  dtmConsultaEntradas.MarcarSelecionados(ckbSelecionarTodos.Checked, False)
end;

procedure TfrmConsultaEntradas.dbgNotasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  TDBGrid(Sender).Canvas.font.Color := clBlack;
  if TDBGrid(Sender).DataSource.DataSet.FieldByName('selecionar').AsBoolean then
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmConsultaEntradas.dbgNotasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Space then
    if Shift = [ssCtrl] then
      dtmConsultaEntradas.MarcarSelecionados(ckbSelecionarTodos.Checked, False);

end;

procedure TfrmConsultaEntradas.sbnContratoClick(Sender: TObject);
begin
  inherited;
  if dtmConsultaEntradas.qryNotaFiscalcontrato.asstring <> '' then
  begin
    if dtmConsultaEntradas.qryNotaFiscalos.asBoolean then
      TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmConsultaEntradas.qryNotaFiscalcontrato.asstring], 'TfrmOrdemServico', True)
    else
      TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmConsultaEntradas.qryNotaFiscalcontrato.asstring], 'TfrmCadastroContratos', True)
  end;

end;

procedure TfrmConsultaEntradas.sbnSaveXMLePDFClick(Sender: TObject);

var
  Dir: String;
  vCont: integer;
  vChaves: String;
  vRetorno : TModalResult;
begin
  inherited;

  vRetorno := MensagemSimNaoOpcaoCancelar('Gerar os arquivo no formato xml e pdf?'+chr(13)+'Confirma os tipos a serem gerados.',
         'Arquivos em PDF', true, 'Ambos arquivos', 'Arquivos em xml', true, true, true);

  if vRetorno = mrCancel then
    exit;

  vCont := 0;
  if FolderDialog1.Execute then
  begin
    dir := FolderDialog1.Directory;

    with dtmConsultaEntradas do
    begin
      if qryTotais_registrosmarcados.asinteger = 0 then
        SalvarConteudoxmlepdf('E', dtmConsultaEntradas.qryNotaFiscalCodigo.asstring, false, false, dir,
          ((vRetorno = mrYes) {or (vRetorno = mrOk)}),
          ((vRetorno = mrYes) or (vRetorno = mrNo)),
          true, AdvSmoothProgressBar1 )
      else
      begin

        qryEntradas.GuardarRegistroAtual(true);
        qryEntradas.first;
        while not qryEntradas.eof do
        begin
          if qryEntradasselecionar.asBoolean then
          begin
            if not dtmConsultaEntradas.qryEntradasnumprotocolonfe.isnull or
                  (dtmConsultaEntradas.qryEntradasnumprotocolonfe.isnull and
                   dtmConsultaEntradas.qryEntradaspossuixmlnfe.asBoolean and
                   not dtmConsultaEntradas.qryEntradaspermitirimprimir.asBoolean) then
               vChaves := vChaves + dtmConsultaEntradas.qryEntradasCodigo.asstring + ', ';

            inc(vCont);
          end;

          if vCont = qryTotais_registrosmarcados.asinteger then
            break;

          dtmConsultaEntradas.qryEntradas.next;

          vPosition :=  (dtmConsultaEntradas.qryEntradas.RecNo * 100) / dtmConsultaEntradas.qryEntradas.recordcount;

          AdvSmoothProgressBar1.visible := true;
          AdvSmoothProgressBar1.Appearance.ValueFormat := 'Gerando o arquivo xml das notas fiscais selecionados %.0f%%';
          AdvSmoothProgressBar1.Position := vPosition;

          Application.ProcessMessages;



        end;
        qryEntradas.VoltarRegistro;

        if vChaves <> '' then
        begin
          delete(vchaves, length(vchaves)-1, 2);
          SalvarConteudoxmlepdf('E', vChaves, false, false, dir,
               ((vRetorno = mrYes) {or (vRetorno = mrOk)}),
               ((vRetorno = mrYes) or (vRetorno = mrNo)),
               false, AdvSmoothProgressBar1);
        end;

        AdvSmoothProgressBar1.visible := False;


      end;
    end;
  end;

  OpenDialog1.initialdir := dir;
  OpenDialog1.Execute;


end;

procedure TfrmConsultaEntradas.FormCreate(Sender: TObject);
begin
  inherited;
  dbgNotas.ColumnByName('contabilizado').visible := parsistema.gerarcontabilidade;
end;

procedure TfrmConsultaEntradas.sbnCadastroNotaClick(Sender: TObject);
begin
  inherited;
  TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado(['Abrir',

                                                                   dtmConsultaEntradas.qryEntradascodigo.asinteger,
                                                                   dtmConsultaEntradas.qryEntradasfornecedor.asinteger,
                                                                   dtmConsultaEntradas.qryEntradastipofornecedor.asString,
                                                                   dtmConsultaEntradas.qryEntradasserie.asString,
                                                                   dtmConsultaEntradas.qryEntradasNumero.asinteger

                                                                   ], 'TfrmCadastroNotasFiscais', True)
end;

end.


