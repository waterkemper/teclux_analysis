unit fmdevolucaomercadorias;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Windows,
  ExtCtrls, Buttons, DBCtrls, Mask, ComCtrls, Grids, DBGrids, {Qete,}
  // Terceiros
  ZQuery,
  // Componentes
  cpdbfindcontrols, cpdbgrid, cpdbtext,
  // Constantes
  ctconstantes, biblio, clfinanceira, clparametrossistema,
  // Repositorio
  fmprincipalbasico, fmconsultaporcampo, fmconsultabasica, fmcadastropadrao,
  // Projeto
  dmdevolucaomercadorias, ActnList, DB, ZPgSqlQuery, cpquery, cptexto,
  cpdbmemo, cpcep, cpnumero, dmgerarnotafiscal, ToolWin, dATEuTILS, TypInfo, frconsultacodigo;

type
  TtecTipoOperacao = (dmNENHUM, dmTOTAL, dmGRAVAR, dmPARCIAL, dmPARCELA, dmDEVOLVER, dmVERNOTA);

type
  TfrmDevolucaoMercadorias = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    sbnProcuraCliente: TSpeedButton;
    dtxNomeCliente: TtecDBText;
    aclDevolucaoMercadorias: TActionList;
    actHabilitarBotoes: TAction;
    Bevel1: TBevel;
    sbnExcluirParcial: TSpeedButton;
    sbnParcelas: TSpeedButton;
    sbnFichaFinanceira: TSpeedButton;
    pnlParcelas: TPanel;
    pgcDevolucao: TPageControl;
    tstDadosContratos: TTabSheet;
    pgcVendedor: TPageControl;
    tstVendedor: TTabSheet;
    gbxVendedor: TGroupBox;
    lblVendedor: TLabel;
    dtxVendedor: TtecDBText;
    dtxDescricaoVendedor: TtecDBText;
    lblPlano: TLabel;
    dtxPlano: TtecDBText;
    dtxDescricaoPlano: TtecDBText;
    lblEmissao: TLabel;
    dtxEmissao: TtecDBText;
    lblSituacao: TLabel;
    dtxSituacao: TtecDBText;
    lblFilial: TLabel;
    dtxFilial: TtecDBText;
    dtxDescricaoFilial: TtecDBText;
    lblAgente: TLabel;
    dtxAgente: TtecDBText;
    dtxDescricaoAgente: TtecDBText;
    tstValoresNovosPagos: TTabSheet;
    gbxValoresPagos: TGroupBox;
    lblValorPago: TLabel;
    dbgValorEmAberto: TDBGrid;
    edtDevolver: TEditNumero;
    lblDevolver: TLabel;
    edtPago: TEditNumero;
    gbxNovosValores: TGroupBox;
    lblAVistaNV: TLabel;
    lblDescontoNV: TLabel;
    lblFreteSeguroNV: TLabel;
    lblAcrescimoNV: TLabel;
    lblTotalNV: TLabel;
    edtAVista: TEditNumero;
    edtDesconto: TEditNumero;
    edtFreteSeguro: TEditNumero;
    edtAcrescimo: TEditNumero;
    edtTotal: TEditNumero;
    tstObservacao: TTabSheet;
    gbxObservacao: TGroupBox;
    mmoObservacoes: TtecDBMemo;
    pgcValoresContrato: TPageControl;
    tstValoresContratos: TTabSheet;
    gbxValoresContratos: TGroupBox;
    dtxAVistaVC: TtecDBText;
    lblAVistaVC: TLabel;
    lblDescontoVC: TLabel;
    dtxDescontoVC: TtecDBText;
    lblFreteSeguroVC: TLabel;
    dtxFreteSeguroVC: TtecDBText;
    lblAcrescimoVC: TLabel;
    dtxAcrescimoVC: TtecDBText;
    lblTotalVC: TLabel;
    dtxTotalVC: TtecDBText;
    pgcProdutosParcelas: TPageControl;
    tstProdutos: TTabSheet;
    pnlProdutoseServicos: TPanel;
    dbgProdutosContratos: TtecDBGrid;
    pnlContratos: TPanel;
    dbgContratosPorCliente: TtecDBGrid;
    tstParcelas: TTabSheet;
    gbxParcelas: TGroupBox;
    sbnExcluirParcela: TSpeedButton;
    sbnIncluirProduto: TSpeedButton;
    sbnReter: TSpeedButton;
    dbgParcelasContratos: TtecDBGrid;
    Shape1: TShape;
    lblDevolvido: TLabel;
    shpRenegociado: TShape;
    lblBrinde: TLabel;
    lblDefeito: TLabel;
    tstDadosNotasPag: TTabSheet;
    gbxDadosNotasPag: TGroupBox;
    dbgProdutosNotasPag: TtecDBGrid;
    edtValorNota: TDBEditNumero;
    edtValorProduto: TDBEditNumero;
    edtValorFrete: TDBEditNumero;
    edtValorSeguro: TDBEditNumero;
    lblValorNota: TStaticText;
    lblValorProduto: TStaticText;
    lblValorFrete: TStaticText;
    lblValorSeguro: TStaticText;
    lblValorDesconto: TStaticText;
    edtValorDesconto: TDBEditNumero;
    lblValorAcrescimo: TStaticText;
    edtValorAcrescimo: TDBEditNumero;
    lblTotalCalculosIPI: TLabel;
    edtTotalCalculosIPI: TDBEditNumero;
    lblFaturamento: TLabel;
    edtFaturamento: TtecDBText;
    lblSerieNota: TLabel;
    lblNumeroNota: TLabel;
    lblEmissaoNota: TLabel;
    edtSerieNota: TEditTexto;
    edtNumeroNota: TEditNumero;
    edtEmissaoNota: TEditTexto;
    edfCliente: TtecDbEditFind;
    lblSaldoCreditoTroca: TLabel;
    edtCreditoTroca: TEditNumero;
    lblcontratoCreditoTroca: TLabel;
    dtxCreditoTrocaVC: TtecDBText;
    edtTotalCalculosICMS: TDBEditNumero;
    lblTotalCalculosICMS: TLabel;
    sbnCheque: TSpeedButton;
    ckbDevolverTodos: TCheckBox;
    dbgCalculosNotaPag: TtecDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    edtCreditoDevolver: TEditNumero;
    edtCredito: TEditNumero;
    gbxCliente: TGroupBox;
    pnlLegendasDevolucao: TPanel;
    pnlTotaisContrato: TPanel;
    gbxProdutosContratos: TGroupBox;
    gbxServicosContratos: TGroupBox;
    lblValorServicos: TLabel;
    edtValorServicos: TEditNumero;
    lblValorServicosVC: TLabel;
    dtxValorServicosVC: TtecDBText;
    gbxNotaFiscalDevolucao: TGroupBox;
    gbxprodutosNotaDevolucao: TGroupBox;
    pnlCalculosNotaDevolucao: TPanel;
    gbxCalculosImpostosNotaDevolucao: TGroupBox;
    gbxTotaisNotaDevolucao: TGroupBox;
    dbgServicos: TtecDBGrid;
    Label1: TLabel;
    dtxRetencoes: TtecDBText;
    Label2: TLabel;
    dtxIPI: TtecDBText;
    Label5: TLabel;
    dtxICMSSubst: TtecDBText;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edticmsvalorst: TEditNumero;
    edtValorIPI: TEditNumero;
    edtValorImpostoRetido: TEditNumero;
    gbxBaseICMS: TStaticText;
    edtBaseICMSNota: TDBEditNumero;
    gbxValorICMS: TStaticText;
    edtValorICMSNota: TDBEditNumero;
    gbxvcredicmssn: TStaticText;
    edtvcredicmssn: TDBEditNumero;
    gbxBaseSubst: TStaticText;
    edtBaseICMSSubstituicao: TDBEditNumero;
    gbxValorSubst: TStaticText;
    edtValorICMSSubstituicao: TDBEditNumero;
    gbxBASESTRETIDOANT: TStaticText;
    edtBASESTRETIDOANT: TDBEditNumero;
    gbxICMSSTRETANT: TStaticText;
    edtICMSSTRETANT: TDBEditNumero;
    TabSheet1: TTabSheet;
    procedure sbnProcuraClienteClick(Sender: TObject);
    procedure edfClienteFound(Found: Boolean);
    procedure dbgProdutosContratosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure mmoObservacoesKeyPress(Sender: TObject; var Key: Char);
    procedure actHabilitarBotoesUpdate(Sender: TObject);
    procedure dbgParcelasContratosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbnExcluirParcelaClick(Sender: TObject);
    procedure sbnExcluirParcialClick(Sender: TObject);
    procedure sbnParcelasClick(Sender: TObject);
    procedure sbnFichaFinanceiraClick(Sender: TObject);
    procedure sbnIncluirProdutoClick(Sender: TObject);
    procedure dbgProdutosContratosEnter(Sender: TObject);
    procedure dbgParcelasContratosDblClick(Sender: TObject);
    procedure edfClienteMessage(var Msg: String);
    procedure sbnReterClick(Sender: TObject);
    procedure dbgProdutosContratosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnChequeClick(Sender: TObject);
    procedure ckbDevolverTodosClick(Sender: TObject);
    procedure dbgServicosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgServicosEnter(Sender: TObject);
 private
    procedure AfterScrollLinhaColunaGrade(Sender: TObject);
    procedure CondicoesFiliaisEntrada;
    procedure AtribuirDadosFilialEntrada(Found: Boolean);
    function NomeFrameFilialEntrada: String;

  protected
//    dtmDevolucaoMercadorias: TdtmDevolucaoMercadorias;
    procedure AcionaCadastroParcelas(Editar: Boolean);
    procedure AcionaDefinirParametros;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AfterScrollContratosClientes(Sender: TObject);
    function InternoCancelar: Boolean; override;
    function InternoExcluir: Boolean; override;
    function InternoGravar : Boolean; override;

    function InternoPesquisar(Titulo:String): Integer; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function TabelaDePesquisa: TZDataSet; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;

    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure HabilitarBotoes;
    procedure ExibirNovosValores(Sender: TObject);
    procedure LimparValores;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure  ReFazConsultaCliente(Contratos: Array of String);
  end;

var
  frmDevolucaoMercadorias: TfrmDevolucaoMercadorias;
  TipoOperacao: TtecTipoOperacao;
  NotaOK: Boolean;

implementation

uses fmcadastroparcelasdevolucao, fmdefinirparametrosdevolucao, fmcadastrocontratos,
      fmvendasavista, fmoperacoescontratos;

{$R *.dfm}

{ TfrmDevolucaoMercadorias }

procedure TfrmDevolucaoMercadorias.actHabilitarBotoesUpdate(Sender: TObject);
begin
  inherited;
  if TipoOperacao <= dmPARCIAL then begin
       sbnParcelas.Caption:= 'Parcelas F8';
       sbnParcelas.Hint   := 'Exibe as parcelas do contrato';
  end
  else if TipoOperacao = dmPARCELA then begin
    sbnParcelas.Caption:= 'Observ. F8';
    sbnParcelas.Hint   := 'Permite a inserção de um comentário';
  end
  else if (TipoOperacao = dmDEVOLVER) then begin
    sbnParcelas.Caption:= 'Ver Nota F8';
    sbnParcelas.Hint   := 'Permite a visualização da Nota Fiscal';
  end;
  HabilitarBotoes;
//  ExibirNovosValores;
end;

procedure TfrmDevolucaoMercadorias.AfterScrollContratosClientes(Sender: TObject);
begin
  TipoOperacao := dmNENHUM;
end;

constructor TfrmDevolucaoMercadorias.Create(AOwner: TComponent);
begin
  dtmDevolucaoMercadorias:= TdtmDevolucaoMercadorias.Create(Self);
  inherited;
  DataSet:= dtmDevolucaoMercadorias.TabelaContrato;
  pgcVendedor.ActivePage        := tstVendedor;
  pgcProdutosParcelas.ActivePage:= tstProdutos;
  pgcDevolucao.activepage := tstDadosContratos;
  TipoOperacao:= dmNENHUM;
  dtmDevolucaoMercadorias.AfterScrollContratosClientes:= AfterScrollContratosClientes;
  dtmDevolucaoMercadorias.OnScrollLinhaColunaGrade := AfterScrollLinhaColunaGrade;
  dtmDevolucaoMercadorias.ExibirNovosValores := ExibirNovosValores;
  dbgProdutosContratos.Columns[2].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutosContratos.Columns[3].Visible := ParSistema.UsarGradesProdutos;

  if dbgProdutosContratos.Columns[7].Width < ParSistema.TamanhoMascaraQuantidade then
    dbgProdutosContratos.Columns[7].Width := ParSistema.TamanhoMascaraQuantidade;

  if dbgProdutosContratos.Columns[8].Width < ParSistema.TamanhoMascaraQuantidade then
    dbgProdutosContratos.Columns[8].Width := ParSistema.TamanhoMascaraQuantidade;

  if dbgProdutosContratos.Columns[9].Width < ParSistema.TamanhoMascaraQuantidade then
    dbgProdutosContratos.Columns[9].Width := ParSistema.TamanhoMascaraQuantidade;

  if dbgProdutosContratos.Columns[12].Width < ParSistema.TamanhoMascaraQuantidade then
    dbgProdutosContratos.Columns[12].Width := ParSistema.TamanhoMascaraQuantidade;

  if dbgProdutosContratos.Columns[13].Width < ParSistema.TamanhoMascaraQuantidade then
    dbgProdutosContratos.Columns[13].Width := ParSistema.TamanhoMascaraQuantidade;

  if dbgProdutosNotasPag.Columns[2].Width < ParSistema.TamanhoMascaraQuantidade then
    dbgProdutosNotasPag.Columns[2].Width := ParSistema.TamanhoMascaraQuantidade;

  lblTotalCalculosIPI.Visible := dtmDevolucaoMercadorias.ContribIPI;
  edtTotalCalculosIPI.Visible := lblTotalCalculosIPI.Visible;

  lblTotalCalculosICMS.Visible := dtmDevolucaoMercadorias.contribICMS;
  edtTotalCalculosICMS.Visible := lblTotalCalculosICMS.Visible;

  gbxServicosContratos.visible := parsistema.contratocomservico;
  self.activecontrol :=  edfCliente;

  dbgProdutosContratos.PesquisaCampo('filialmovimentacao', pesFiliais, self);

  tfraconsultacodigo(self.FindComponent(NomeFrameFilialEntrada)).CondicoesdaConsulta := CondicoesFiliaisEntrada;
  tfraconsultacodigo(self.FindComponent(NomeFrameFilialEntrada)).onFound := AtribuirDadosFilialEntrada;


end;

procedure TfrmDevolucaoMercadorias.dbgParcelasContratosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then begin
    case Key of
      TeclaEditarRegistro : if dtmDevolucaoMercadorias.PodeAlterarParcela then
                              AcionaCadastroParcelas(True);
      TeclaInserirRegistro: AcionaCadastroParcelas(False);
    end;
  end;
end;

procedure TfrmDevolucaoMercadorias.dbgProdutosContratosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not TDBGrid(Sender).DataSource.DataSet.IsEmpty then begin
    if (TDBGrid(Sender).DataSource.DataSet.FieldByName('quantidade').AsCurrency =
        TDBGrid(Sender).DataSource.DataSet.FieldByName('cancelado').AsCurrency) then
        TDBGrid(Sender).Canvas.Brush.Color := $FFCB97;

    if TDBGrid(Sender).DataSource.DataSet.FieldByName('brinde').AsBoolean then
        TDBGrid(Sender).Canvas.Brush.Color := $7DBEFF;

    if (TDBGrid(Sender).DataSource.DataSet.FieldByName('devolver').AsCurrency > 0) then begin
      TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
      if TDBGrid(Sender).DataSource.DataSet.FieldByName('defeito').AsBoolean then
           TDBGrid(Sender).Canvas.Font.Color := clRed
      else TDBGrid(Sender).Canvas.Font.Color := clBlack;
    end;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmDevolucaoMercadorias.dbgProdutosContratosEnter(Sender: TObject);
begin
  inherited;
  if not (TipoOperacao in [dmPARCIAL, dmTOTAL]) then
    dbgContratosPorCliente.SetFocus;
end;

destructor TfrmDevolucaoMercadorias.Destroy;
begin
  dtmDevolucaoMercadorias:=nil;
  inherited;
  frmDevolucaoMercadorias:= nil;
end;

procedure TfrmDevolucaoMercadorias.edfClienteFound(Found: Boolean);
begin
  inherited;
  if Found then begin
    if pgcProdutosParcelas.ActivePage = tstParcelas then
      pgcProdutosParcelas.ActivePage := tstProdutos;
    if not dtmDevolucaoMercadorias.ReFazConsultaContratosPorCliente then
      dbgContratosPorCliente.SetFocus;

    case dtmDevolucaoMercadorias.TipoCliente[1] of
      'C': gbxCliente.Caption:= 'Cliente';
      'F': gbxCliente.Caption:= 'Fornecedor';
      'L': gbxCliente.Caption:= 'Filial';
    end;
  end;
end;

function TfrmDevolucaoMercadorias.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= dtmDevolucaoMercadorias.ExisteCliente(nomecampo, value);
end;

procedure TfrmDevolucaoMercadorias.HabilitarBotoes;
begin
  with dtmDevolucaoMercadorias do begin
    pnlParcelas.Visible       := (pgcProdutosParcelas.ActivePage = tstProdutos);
    sbnExcluir.Enabled        := (NrContratos > 0) and (TipoOperacao in [dmNENHUM]);
//    sbnExcluirParcial.Enabled := sbnExcluir.Enabled; XX-Jander

    sbnParcelas.Enabled       := not ((TipoOperacao in [dmNENHUM, dmVERNOTA]) or
                                      ((TipoOperacao = dmDEVOLVER) and not ClienteTrouxeNota));

    sbnSalvar.Enabled         := ((TipoOperacao = dmVERNOTA)                                or
                                 ((TipoOperacao = dmDEVOLVER) and (SituacaoContrato = 'F')) or
                                 ((TipoOperacao = dmDEVOLVER) and ((SituacaoContrato = 'N') or (SituacaoContrato = 'P'))
                                                              and not TemProdutoImprimirNotaDevolucao) or
                                 ((TipoOperacao = dmDEVOLVER) and ((SituacaoContrato = 'N') or (SituacaoContrato = 'P'))
                                                              and not ClienteTrouxeNota));
    sbnFichaFinanceira.Enabled:= (CodigoCliente > 0);
    sbnExcluirParcela.Enabled := (TipoOperacao in [dmPARCELA]) and PodeAlterarParcela;
    sbnReter.Enabled          := (TipoOperacao in [dmPARCELA]) and PodeReterValor;
    sbnCheque.Enabled         := (TipoOperacao in [dmPARCELA]) and PodeDevolverCheque;
    lblDefeito.Visible        := (TipoOperacao in [dmTOTAL, dmPARCIAL]) and (Qtde_A_Devolver > 0);
    ckbDevolverTodos.Enabled  := TipoOperacao in [dmPARCIAL, dmTOTAL];
  end;
end;

function TfrmDevolucaoMercadorias.InternoCancelar: Boolean;
begin
  if pgcDevolucao.ActivePageIndex = 1 then
    pgcDevolucao.ActivePageIndex:= 0;
  pgcVendedor.ActivePage:= tstVendedor;
  pgcProdutosParcelas.ActivePage:= tstProdutos;
  dtmDevolucaoMercadorias.ReFazConsultaTabelas;
  TipoOperacao:= dmNENHUM;
  Result:= False;
end;

function TfrmDevolucaoMercadorias.InternoExcluir: Boolean;
begin
  Result:= Inherited InternoExcluir;
  if not CtrlOn then
  begin
    LimparValores;
    TipoOperacao:= dmPARCIAL;
    AcionaDefinirParametros;
    {
    if (dtmDevolucaoMercadorias.ContratosCreditoTroca<>0) then
      MensagemAviso(ctCONTRATOCOMCREDITO)
    else
    begin
    }
      dtmDevolucaoMercadorias.IniciarDevolucao;
      pgcVendedor.ActivePage:= tstValoresNovosPagos;
      dbgProdutosContratos.SetFocus;
    //end;
  end;
end;

function TfrmDevolucaoMercadorias.InternoGravar: Boolean;
var
  Msg: String;
  Frm: TForm;
  NroCtr: vString;
begin
  Result:= False;
  if not CtrlOn then begin
    Result:= inherited InternoGravar;
    if dtmDevolucaoMercadorias.ValidarValoresNota then begin
      if Result then
      with dtmDevolucaoMercadorias do begin

        if ClienteTrouxeNota then
             Msg:= ctDEVOLUCAOCOMNOTA
        else Msg:= ctCONFIRMADEVOLUCAOMERCADORIA;

        if MensagemConfirmacao(Msg) = smbOK  then begin

          SetLength(NroCtr, 1);
          NroCtr[0] := dtmDevolucaoMercadorias.NumeroContrato;
          GravarDevolucaoMercadoria;
          Frm := TfrmCadastroContratos.Referencia;
          if Assigned(Frm) then
            TfrmCadastroContratos(Frm).SelecionarContrato(NroCtr);
          Frm := TfrmVendasaVista.Referencia;
          if Assigned(Frm) then
            TFrmVendasaVista(Frm).ReFazVendaVista(NroCtr);
          Frm := TfrmOperacoesContratos.Referencia;
          if Assigned(Frm) then
            TfrmOperacoesContratos(Frm).RefazConsulta;

        end else ReFazConsultaTabelas;
        if pgcDevolucao.ActivePageIndex = 1 then
          pgcDevolucao.ActivePageIndex:= 0;
        pgcVendedor.ActivePage:= tstVendedor;
        pgcProdutosParcelas.ActivePage:= tstProdutos;
        edfCliente.SetFocus;
        TipoOperacao:= dmNENHUM;
      end;
    end
    else begin
      MensagemAviso(ctERROVALORESIMPOSTOSNOTAFISCAL);
      if dbgCalculosNotaPag.CanFocus then
        dbgCalculosNotaPag.SetFocus;
    end;
  end;
end;

function TfrmDevolucaoMercadorias.InternoPesquisar(Titulo: String): Integer;
begin
  Result := mrNone;
  if CtrlOn then begin
    if ActiveControl is TtecFindCustom then begin
      dtmDevolucaoMercadorias.AbrirTabelas;
      Result := inherited InternoPesquisar('Cliente');
      if Result = mrOK then
        dtmDevolucaoMercadorias.Selecionar;
      dtmDevolucaoMercadorias.FecharTabelas;
    end;
  end
end;

function TfrmDevolucaoMercadorias.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa     := False;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
  TfrmConsultaPorCampo(Result).Msg:= Format(ctSEMDEVOLUCAO,['']);
end;

procedure TfrmDevolucaoMercadorias.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_Delete: if dbgCalculosNotaPag.Focused then
                  Key:= MAXWORD;
    VK_ESCAPE: InternoCancelar;
    VK_D     : if (Shift = [ssCtrl]) and (lblDefeito.Visible) and (TipoOperacao in [dmTOTAL, dmPARCIAL]) then  
                  dtmDevolucaoMercadorias.SetarProdutoComDefeito;
    VK_R     : if (Shift = [ssCtrl]) and sbnReter.Enabled     then sbnReter.Click;  
    VK_F2    : if (Shift = []) and sbnFichaFinanceira.Enabled then sbnFichaFinanceira.Click;
//    VK_F7    : if (Shift = []) and sbnExcluirParcial.Enabled  then sbnExcluirParcial.Click; XX-Jander
    VK_F8    : if (Shift = []) and sbnParcelas.Enabled        then sbnParcelas.Click;
  end;
  inherited;
end;

procedure TfrmDevolucaoMercadorias.mmoObservacoesKeyPress(Sender: TObject; var Key: Char);
begin
  Key:= UpCase(Key);
end;

procedure TfrmDevolucaoMercadorias.sbnExcluirParcelaClick(Sender: TObject);
begin
  inherited;
  dtmDevolucaoMercadorias.ExcluirParcelas;
  dbgParcelasContratos.SetFocus;
end;

procedure TfrmDevolucaoMercadorias.sbnProcuraClienteClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfCliente.SetFocus;
  InternoPesquisar('');
end;

function TfrmDevolucaoMercadorias.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmDevolucaoMercadorias.ConsultaCliente;
end;

procedure TfrmDevolucaoMercadorias.ExibirNovosValores;
begin
//  if pgcVendedor.ActivePage = tstValoresNovosPagos then
//  begin
    with dtmDevolucaoMercadorias do
    begin

      edtAVista.Text     := FormatarValor(ValorProdutos+ValorDesconto+ValorDescontoItem {ValorVista + ValorDesconto},2);

      edtValorServicos.Text := FormatarValor(ValorServicos, 2);
      edtValorImpostoRetido.text := FormatarValor((ValorImpostoRetido_s + ValorImpostoRetido_p), 2);
      edtValorIPI.text := FormatarValor(ValorIPI, 2);
      edticmsvalorst.text := FormatarValor(valoricmssubstituicao, 2);

      edtDesconto.Text   := FormatarValor(ValorDesconto+ValorDescontoItem,2);

      edtFreteSeguro.Text:= FormatarValor(ValorFrete + ValorSeguro,2);
      edtCreditoTroca.Text := FormatarValor(ValorCreditoTroca,2);

      edtAcrescimo.Text  := FormatarValor(ValorAcrescimo,2);
      edtTotal.Text      := FormatarValor(ValorPrazo,2);

      edtPago.Text       := FormatarValor(PagoVencto,2);
      edtDevolver.Text   := FormatarValor(Abs(DevolvePagto),2);

      edtcredito.Text       := FormatarValor(PagoCreditoTroca,2);
      edtCreditoDevolver.Text   := FormatarValor(Abs(DevolveCreditoTroca),2);


    end;
//  end;
end;

procedure TfrmDevolucaoMercadorias.sbnExcluirParcialClick(Sender: TObject);
begin
  inherited;
(*  AcionaDefinirParametros; XX-Jander
//  dtmDevolucaoMercadorias.CancelarTotal:= False; XX-Jander
  dtmDevolucaoMercadorias.IniciarDevolucao;
  TipoOperacao:= dmPARCIAL;
  dbgProdutosContratos.SelectedIndex:= 8;
  pgcVendedor.ActivePage:= tstValoresNovosPagos;
  dbgProdutosContratos.SetFocus; *)
end;

procedure TfrmDevolucaoMercadorias.sbnReterClick(Sender: TObject);
begin
  inherited;
  dtmDevolucaoMercadorias.ReterValorDevolucao;
end;

procedure TfrmDevolucaoMercadorias.sbnParcelasClick(Sender: TObject);
begin
  inherited;
  with dtmDevolucaoMercadorias do begin
    if (TipoOperacao = dmDEVOLVER) then begin
      TipoOperacao:= dmVERNOTA;
      pgcDevolucao.ActivePageIndex:= 1;
      if ClienteTrouxeNota then begin
        edtSerieNota.Text  := SerieDevolucao;
        edtNumeroNota.Text := Format('%6.6d',[StrToInt(NumeroDevolucao)]);
        edtEmissaoNota.Text:= DataDevolucao;
      end
      else begin
        edtSerieNota.Text  := '';
        edtNumeroNota.Text := '';
        edtEmissaoNota.Text:= '';
      end;
    end
    else if TipoOperacao = dmPARCELA then begin
      TipoOperacao:= dmDEVOLVER;
      pgcVendedor.ActivePage:= tstObservacao;
      EditarContrato:= True;
      mmoObservacoes.SetFocus;
      ExisteProdutoEmitirNota;
      if ClienteTrouxeNota then
        if not NotasFiscaisDevolucaoContrato and TemProdutoImprimirNotaDevolucao then begin
          if pgcDevolucao.ActivePageIndex = 1 then
            pgcDevolucao.ActivePageIndex:= 0;
          pgcVendedor.ActivePage:= tstVendedor;
          pgcProdutosParcelas.ActivePage:= tstProdutos;
          edfCliente.SetFocus;
          TipoOperacao:= dmNENHUM;
        end;
    end else if (TipoOperacao in [dmTOTAL, dmPARCIAL]) then  begin
      if AlterarParcelamento then begin
        pgcProdutosParcelas.ActivePage:= tstParcelas;
        TipoOperacao:= dmPARCELA;
      end;
    end;
  end;
end;

procedure TfrmDevolucaoMercadorias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dtmDevolucaoMercadorias.LimparTabelas;
end;

procedure TfrmDevolucaoMercadorias.sbnFichaFinanceiraClick(Sender: TObject);
begin
  inherited;
  TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmDevolucaoMercadorias.CodigoCliente,
                                                                   dtmDevolucaoMercadorias.TipoCliente], 'TfrmFichaFinanceira', True);
end;

procedure TfrmDevolucaoMercadorias.sbnIncluirProdutoClick(Sender: TObject);
begin
  inherited;
  AcionaCadastroParcelas(False);
end;

procedure TfrmDevolucaoMercadorias.AcionaCadastroParcelas(Editar: Boolean);
begin
  if not Assigned (frmCadastroParcelaDevolucao) then
    frmCadastroParcelaDevolucao:= TfrmCadastroParcelaDevolucao.Create(frmCadastroParcelaDevolucao);
  with frmCadastroParcelaDevolucao do begin
    SetDataModulo(dtmDevolucaoMercadorias);
    DataSet:= dtmDevolucaoMercadorias.TabelaParcela;
    dtmDevolucaoMercadorias.IncluirParcelas(Editar);
    ShowModal;
    free;
    dbgParcelasContratos.SetFocus;
  end
end;

procedure TfrmDevolucaoMercadorias.dbgParcelasContratosDblClick(Sender: TObject);
begin
  inherited;
  if dtmDevolucaoMercadorias.PodeAlterarParcela then
    AcionaCadastroParcelas(True);
end;

procedure TfrmDevolucaoMercadorias.edfClienteMessage(var Msg: String);
begin
  inherited;
  Msg:= Format(ctSEMDEVOLUCAO,[edfCliente.Text]);
end;

procedure TfrmDevolucaoMercadorias.AcionaDefinirParametros;
begin
  if not Assigned (frmDefinirParametrosDevolucao) then
    frmDefinirParametrosDevolucao:= TfrmDefinirParametrosDevolucao.Create(frmDefinirParametrosDevolucao);

  with dtmDevolucaoMercadorias do
  begin
    frmDefinirParametrosDevolucao.ckbCreditarICMS.Checked:= PodeCreditarICMS and (SituacaoContrato[1] in ['N','P']);
    frmDefinirParametrosDevolucao.ckbCreditarICMS.Enabled:= PodeCreditarICMS and (SituacaoContrato[1] in ['N','P']);
    frmDefinirParametrosDevolucao.ckbCliente.Enabled:= (ClientePessoaTipo = 'J');
    frmDefinirParametrosDevolucao.edtEmissao.Minimo := DaysBetween(DataServidor,DataContrato);
  end;

  with frmDefinirParametrosDevolucao dO
  begin

    ShowModal;

    dtmDevolucaoMercadorias.DevolverSeguro:= ckbSeguro.Checked;
    dtmDevolucaoMercadorias.DevolverFrete:= ckbFrete.Checked;
    dtmDevolucaoMercadorias.DevolverCreditoTroca:= ckbCreditoTroca.Checked;
    dtmDevolucaoMercadorias.CreditarICMS:= ckbCreditarICMS.Checked;
    dtmDevolucaoMercadorias.ClienteTrouxeNota:= ckbCliente.Checked;
    dtmDevolucaoMercadorias.SerieDevolucao:= edtSerie.Text;
    dtmDevolucaoMercadorias.NumeroDevolucao:= edtNumeroNota.Text;

    if edtEmissao.Text <> '' then
      dtmDevolucaoMercadorias.DataDevolucao:= edtEmissao.Text;

    dtmDevolucaoMercadorias.ChaveNfeDevolucao:= edtChaveNfe.Text;
    Free;
  end;

  dbgProdutosContratos.SetFocus;
  dbgProdutosContratos.SelectedIndex := 12;

end;

procedure TfrmDevolucaoMercadorias.ReFazConsultaCliente(Contratos: Array of String);
begin
  if dtmDevolucaoMercadorias.NumeroContrato = Contratos[0] then
    InternoCancelar
end;

procedure TfrmDevolucaoMercadorias.AfterScrollLinhaColunaGrade(
  Sender: TObject);
begin
  dbgProdutosContratos.Columns[2].Title.Caption := dtmDevolucaoMercadorias.LinhadaGrade;
  dbgProdutosContratos.Columns[3].Title.Caption := dtmDevolucaoMercadorias.colunadaGrade;
end;

procedure TfrmDevolucaoMercadorias.dbgProdutosContratosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = VK_Return) or
     (key = VK_Return) then
    if dbgProdutosContratos.SelectedIndex = 13 then
      dbgProdutosContratos.REFRESH;
  {
  if (key = VK_Return) or
     (key = VK_Return) then
    if dbgProdutosContratos.SelectedIndex = 10 then
      ExibirNovosValores;
      }
end;

procedure TfrmDevolucaoMercadorias.sbnChequeClick(Sender: TObject);
begin
  inherited;
  dtmDevolucaoMercadorias.DevolucaocomCheque;
end;

procedure TfrmDevolucaoMercadorias.ckbDevolverTodosClick(Sender: TObject);
begin
  inherited;
  dtmDevolucaoMercadorias.DevolverTodosProdutos(not ckbDevolverTodos.Checked)
end;

procedure TfrmDevolucaoMercadorias.LimparValores;
begin
  edtAVista.clear;
  edtValorServicos.clear;
  edtDesconto.clear;
  edtFreteSeguro.clear;
  edtCreditoTroca.clear;

  edtAcrescimo.clear;
  edtTotal.clear;

  edtPago.clear;
  edtDevolver.clear;

  edtcredito.clear;
  edtCreditoDevolver.clear;


end;

procedure TfrmDevolucaoMercadorias.dbgServicosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

  if not TDBGrid(Sender).DataSource.DataSet.IsEmpty then
  begin
    if (TDBGrid(Sender).DataSource.DataSet.FieldByName('quantidade').AsCurrency =
        TDBGrid(Sender).DataSource.DataSet.FieldByName('cancelado').AsCurrency) then
        TDBGrid(Sender).Canvas.Brush.Color := $FFCB97;

    if (TDBGrid(Sender).DataSource.DataSet.FieldByName('devolver').AsCurrency > 0) then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
      TDBGrid(Sender).Canvas.Font.Color := clBlack;
    end;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

end;

procedure TfrmDevolucaoMercadorias.dbgServicosEnter(Sender: TObject);
begin
  inherited;
  if not (TipoOperacao in [dmPARCIAL, dmTOTAL]) then
    dbgContratosPorCliente.SetFocus;

end;

procedure TfrmDevolucaoMercadorias.CondicoesFiliaisEntrada;
begin
  if assigned(tfraconsultacodigo(self.FindComponent(NomeFrameFilialEntrada))) then
  begin
     tfraconsultacodigo(self.FindComponent(NomeFrameFilialEntrada)).qryconsultaFiliais.macrobyname('SQL').asString := ' and tipofilial<>''V'' ';
     tfraconsultacodigo(self.FindComponent(NomeFrameFilialEntrada)).qryProcuraFiliais.macrobyname('SQL').asString := ' and tipofilial<>''V'' ';
  end;
end;

procedure TfrmDevolucaoMercadorias.AtribuirDadosFilialEntrada(Found: Boolean);
begin
  if dtmDevolucaoMercadorias.qryProdutosContratos.recordcount > 1 then
    if Mensagemconfirmacao('Atribuir a filial de entrada para todos os produtos com quantidade a devolver não definida?') = smbOK then
      AtribuirDados(dtmDevolucaoMercadorias.qryProdutosContratos,
                    [dtmDevolucaoMercadorias.qryProdutosContratosfilialmovimentacao],
                    [dtmDevolucaoMercadorias.qryProdutosContratosfilialmovimentacao.asVariant],
                    [dtmDevolucaoMercadorias.qryProdutosContratosdevolver],
                    [0], ['=']);

end;

function TfrmDevolucaoMercadorias.NomeFrameFilialEntrada: String;
begin
  result := self.name+'_'+GetEnumName(TypeInfo(TtecPesquisa), integer(pesFiliais))+'_'+dbgprodutoscontratos.DataSource.dataset.name+'_filialmovimentacao';
end;

end.
