unit fmquadrosgia;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, DBCtrls,
  cpdbtext, Buttons, Mask, ComCtrls, Grids, DBGrids, Windows, 
  //Terceiros
  ZQuery,
  //Componentes
  cpdbdata, cpdbfindcontrols, cppagecontrol, cpnumero, cpdbgrid, cptexto,
  //Repositorio
  fmcadastropadrao, fmconsultabasica, cpdbmemo,
  //Biblio
  ctconstantes, DB, ZPgSqlQuery, cpquery, ToolWin;

type
  TfrmQuadrosGIA = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    lblFilial: TLabel;
    flkFilial: TtecDBFindLookup;
    sbnProcuraFilial: TSpeedButton;
    dtxNomeFilial: TtecDBText;
    pgcQuadrosGIA: TtecPageControl;
    tstFaturamento: TTabSheet;
    tstCFOPEntradas: TTabSheet;
    gbxFundoFaturamento: TGroupBox;
    gbxFundoCFOPEntradas: TGroupBox;
    dbgEntradas: TtecDBGrid;
    tstFundoCFOPSaidas: TTabSheet;
    tstResumoApuracao: TTabSheet;
    tstImpostosPagar: TTabSheet;
    tstSubstituicaoTributaria: TTabSheet;
    gbxFundoCFOPSaidas: TGroupBox;
    dbgSaidas: TtecDBGrid;
    gbxFundoResumoApuracao: TGroupBox;
    lblDiferencaAliquota: TLabel;
    lblTransferenciaDebito: TLabel;
    lblEstornoCredito: TLabel;
    lblEstornoCreditoAtivoImobilizado: TLabel;
    lblOutrosDebitos: TLabel;
    lblApuracaoConsolidadaDebito: TLabel;
    edtDiferencaAliquota: TDBEditNumero;
    edtTransferenciaDebito: TDBEditNumero;
    edtEstornoCredito: TDBEditNumero;
    edtEstCredAtivoImobilizado: TDBEditNumero;
    edtOutrosDebitos: TDBEditNumero;
    edtApuracaoConsolidadaDebito: TDBEditNumero;
    gbxFundoImpostosPagar: TGroupBox;
    gbxFundoSubstTribu: TGroupBox;
    lblBaseCalculo: TLabel;
    edtBaseCalculo: TDBEditNumero;
    lblDebitoPelaSaidas: TLabel;
    lblPeriodo: TLabel;
    lblTotaisCFOPSaidas: TLabel;
    dtxTotalContabilCFOPSaidas: TtecDBText;
    dtxTotalBaseCFOPSaidas: TtecDBText;
    dtxTotalImpostoCFOPSaidas: TtecDBText;
    dtxTotalIsentasCFOPSaidas: TtecDBText;
    dtxTotalOutrasCFOPSaidas: TtecDBText;
    dtxDebitosPelaSaidas: TtecDBText;
    lblDifAliquotaAtivoImobilizado: TLabel;
    lblTransferenciaCredito: TLabel;
    lblPresumidos: TLabel;
    lblIncentivosFiscais: TLabel;
    lblOutroCreditos: TLabel;
    lblApuracaoConsolidadaCredito: TLabel;
    edtDifAliquotaAtivoImobilizado: TDBEditNumero;
    edtTransferenciaCredito: TDBEditNumero;
    edtPresumidos: TDBEditNumero;
    edtIncentivosFiscais: TDBEditNumero;
    edtOutroCreditos: TDBEditNumero;
    edtApuracaoConsolidadaCredito: TDBEditNumero;
    lblDifAliquotaMaterialConsumo: TLabel;
    edtDifAliquotaMaterialConsumo: TDBEditNumero;
    edtPagtoOcasiaoFatoGerador: TDBEditNumero;
    lblPagtoOcasiaoFatoGerador: TLabel;
    pnlSeparadorResumo: TPanel;
    lblResumoDebitos: TLabel;
    lblResumoCreditos: TLabel;
    lblSaldoCredorPeriodoAnterior: TLabel;
    lblSubTotalDebito: TLabel;
    lblSaldoCredorPeriodoSeguinte: TLabel;
    lblTotalDebitos: TLabel;
    dtxSubTotalDebitos: TtecDBText;
    dtxSaldoCredorPeriodoSeguinte: TtecDBText;
    dtxTotalDebitos: TtecDBText;
    lblCreditoPelasEntradas: TLabel;
    dtxCreditoPelasEntradas: TtecDBText;
    lblSubTotalCredito: TLabel;
    Label6: TLabel;
    dtxTotalContabilCFOPEntradas: TtecDBText;
    dtxTotalBaseCFOPEntradas: TtecDBText;
    dtxTotalImpostoCFOPEntradas: TtecDBText;
    dtxTotalIsentasCFOPEntradas: TtecDBText;
    dtxTotalOutrasCFOPEntradas: TtecDBText;
    dtxTotalCreditos: TtecDBText;
    lblTotalCreditos: TLabel;
    dtxSubTotalCredito: TtecDBText;
    dtxImpostoRecolher: TtecDBText;
    lblImpostoRecolher: TLabel;
    dtxSaldoCredorPeriodoAnterior: TtecDBText;
    edfPeriodo: TtecDbEditFind;
    lblImpostoPagar: TLabel;
    dtxImpostRecolher: TtecDBText;
    lblDiscriminacao: TLabel;
    dgbImpostoPagar: TtecDBGrid;
    lblImpostoRetido: TLabel;
    lblCreditoSustituicao: TLabel;
    lblRessarcimentoICMS: TLabel;
    edtImpostoRetido: TDBEditNumero;
    edtCreditoSustituicao: TDBEditNumero;
    edtRessarcimentoICMS: TDBEditNumero;
    lblSubstSaldoCredorSeguinte: TLabel;
    dtxSubstSaldoCredorSeguinte: TtecDBText;
    lblSubsTribDebitos: TLabel;
    lblSubsTribCredito: TLabel;
    lblSubstSubTotalDebitos: TLabel;
    lblSubstSubTotalCreditos: TLabel;
    lblSubstSaldoCredorAnterior: TLabel;
    dtxSubstSaldoCredorAnterior: TtecDBText;
    lblSubstImpostoRecolher: TLabel;
    dtxSubstSubTotalDebitos: TtecDBText;
    lblSubstTotalDebitos: TLabel;
    dtxSubstTotalDebitos: TtecDBText;
    lblSubstTotalCreditos: TLabel;
    dtxSubstSubTotalCreditos: TtecDBText;
    dtxSubstImpostoRecolher: TtecDBText;
    dtxSubstTotalCreditos: TtecDBText;
    TabSheet1: TTabSheet;
    pnlSubstSeparadorHor: TPanel;
    pnlSubstSeparadorVert: TPanel;
    dbgInfComplementares: TtecDBGrid;
    sbnIncluirImpostoPagar: TSpeedButton;
    sbnExcluirImpostoPagar: TSpeedButton;
    gbxObservacao: TGroupBox;
    edtObservacao: TtecDBMemo;
    gbxFaturamento: TGroupBox;
    lblValorFaturamento: TLabel;
    lblQtdadeEmpregados: TLabel;
    lblAcrescimoFinanceiro: TLabel;
    lblDepesaMensalPessoal: TLabel;
    edtDespesaMensalPessoal: TDBEditNumero;
    edtAcrescimoFinanceiro: TDBEditNumero;
    edtQtdadeEmpregados: TDBEditNumero;
    edtValorFaturamento: TDBEditNumero;
    gbxGuiasdeRecolhimento: TGroupBox;
    lblNumero: TLabel;
    lblData: TLabel;
    lblValor: TLabel;
    lblOrgao: TLabel;
    gbxGuiadeInformacao: TGroupBox;
    edtValor1: TDBEditNumero;
    edtValor2: TDBEditNumero;
    edtValor3: TDBEditNumero;
    edtValor4: TDBEditNumero;
    edtNumero1: TDBEditTexto;
    edtNumero2: TDBEditTexto;
    edtNumero3: TDBEditTexto;
    edtNumero4: TDBEditTexto;
    edtData1: TDBEditData;
    edtData2: TDBEditData;
    edtData3: TDBEditData;
    edtData4: TDBEditData;
    edtOrgao1: TDBEditTexto;
    edtOrgao2: TDBEditTexto;
    edtOrgao3: TDBEditTexto;
    edtOrgao4: TDBEditTexto;
    procedure edfPeriodoExit(Sender: TObject);
    procedure sbnIncluirImpostoPagarClick(Sender: TObject);
    procedure sbnExcluirImpostoPagarClick(Sender: TObject);
    procedure dgbImpostoPagarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbnProcuraFilialClick(Sender: TObject);
    procedure edfPeriodoFound(Found: Boolean);
  protected
    procedure IncluirEditarImpostoPagar(Incluir: Boolean);
    function  InternoCancelar: Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmQuadrosGIA: TfrmQuadrosGIA;

implementation

uses
  //CLX
  {Qete,}
  //Biblio
  biblio,
  //Repositorio
  fmconsultaporcampo,
  //Projeto
  dmquadrosgia, fmimpostospagarquadrogia;

{$R *.dfm}

{ TfrmQuadrosGIA }

constructor TfrmQuadrosGIA.Create(AOwner: TComponent);
begin
  inherited;
  dtmQuadrosGIA := TdtmQuadrosGIA.Create(Self);
  dtmQuadrosGIA.Abre(ctLIVTabelaQuadrosGIA);
  DataSet := dtmQuadrosGIA.TabelaQuadroGIA
end;

destructor TfrmQuadrosGIA.Destroy;
begin
  dtmQuadrosGIA:=nil;
  inherited;
  frmQuadrosGIA := nil;
end;

procedure TfrmQuadrosGIA.dgbImpostoPagarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F2) and (Shift = [ssCtrl]) then
    IncluirEditarImpostoPagar(False);
end;

procedure TfrmQuadrosGIA.edfPeriodoExit(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmQuadrosGIA.edfPeriodoFound(Found: Boolean);
var
  DataValida: Boolean;
  Data: TDateTime;
begin
  inherited;
  if Pos(' ', edfPeriodo.Text) = 0 then
    try
      Data := StrToDate('01/' + edfPeriodo.Text);
      DataValida := True;
    except
      DataValida := False;
    end
  else
    DataValida := False;
  if DataValida then begin
    dtmQuadrosGIA.SelecionarEntradasSaidas;
    if edfPeriodo.ForeignFound = stFound then begin
      dtmQuadrosGIA.CalcularSaldoAnterior;
      tstImpostosPagar.TabVisible := dtmQuadrosGIA.ImpostoPagar > 0
    end
  end else
    dtmQuadrosGIA.CancelarQuadrosGIA
end;

procedure TfrmQuadrosGIA.IncluirEditarImpostoPagar(Incluir: Boolean);
begin
  dtmQuadrosGIA.IncluirEditarImpostoPagar(Incluir);
  frmImpostosPagarQuadroGIA := TfrmImpostosPagarQuadroGIA.Create(frmImpostosPagarQuadroGIA);
  frmImpostosPagarQuadroGIA.ShowModal;
  frmImpostosPagarQuadroGIA.Free;
end;

function TfrmQuadrosGIA.InternoCancelar: Boolean;
begin
  Result := inherited InternoCancelar;
  if Result then
    Result := dtmQuadrosGIA.CancelarQuadrosGIA
end;

function TfrmQuadrosGIA.InternoExcluir: Boolean;
begin
  Result := inherited InternoExcluir;
  if Result then
    if CtrlOn then
      Result := dtmQuadrosGIA.ExcluirImpostoPagar
    else if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, [ctESTEQUADROGIA])) = smbOK then
      Result := dtmQuadrosGIA.ExcluirQuadroGIA
    else
      Result := False
end;

function TfrmQuadrosGIA.InternoGravar: Boolean;
begin
  inherited InternoGravar;
  Result := dtmQuadrosGIA.GravarQuadroGIA
end;

function TfrmQuadrosGIA.InternoIncluir: Boolean;
begin
  if CtrlOn then begin
    IncluirEditarImpostoPagar(True);
    Result := True
  end else
    Result := dtmQuadrosGIA.IncluirQuadroGIA
end;

function TfrmQuadrosGIA.InternoPesquisar(Titulo: String): Integer;
begin
  if CtrlOn then begin
   Titulo := ctFILIAL;
   dtmQuadrosGIA.abre(ctLIVTabelaConsultaFiliais);
  end else begin
   Titulo := ctQUADROSGIA;
   dtmQuadrosGIA.Abre(ctLIVTabelaConsultaQuadrosGIA);
  end;
  Result := inherited InternoPesquisar(Titulo);
  if Result = mrOK then begin
    if Titulo=ctQUADROSGIA then begin
      dtmQuadrosGIA.SelecionarQuadrosGIA;
      tstImpostosPagar.TabVisible := dtmQuadrosGIA.ImpostoPagar > 0
     end;
     dtmQuadrosGIA.Fecha(ctLIVTabelaConsultaQuadrosGIA);
  end else
  if Titulo=ctFILIAL then begin
    dtmQuadrosGIA.SelecionarFilial;
    dtmQuadrosGIA.Fecha(ctLIVTabelaConsultaFiliais);
  end;
end;

function TfrmQuadrosGIA.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

procedure TfrmQuadrosGIA.sbnExcluirImpostoPagarClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  InternoExcluir;
end;

procedure TfrmQuadrosGIA.sbnIncluirImpostoPagarClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  InternoIncluir;
end;

function TfrmQuadrosGIA.TabelaDePesquisa: TZDataSet;
begin
  if CtrlOn then
    Result := dtmQuadrosGIA.TabelaConsultaFilial
  else
    Result := dtmQuadrosGIA.TabelaConsultaQuadroGIA;
end;

procedure TfrmQuadrosGIA.sbnProcuraFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn:=True;
  flkFilial.SetFocus;
  internopesquisar(ctFILIAL);
end;

end.
