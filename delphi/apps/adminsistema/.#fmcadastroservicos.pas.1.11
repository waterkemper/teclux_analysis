unit fmcadastroservicos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs, ExtCtrls, Buttons,
  DBCtrls, StdCtrls, Mask, ComCtrls,
  //Terceiros
  ZQuery,
  //Biblio
  ctconstantes, biblio,
  //Componentes
  cpdbdata, cptexto, cpdbfindcontrols, cpnumero, cpdbtext,
  //Repositorio
  fmcadastropadrao, fmconsultabasica, fmconsultaporcampo,
  //Projeto
  cpdbmemo, cpdbradiogroup, clparametrossistema, clusuario, frcomissao,
  frconsulta, frconsultacodigo, ToolWin, frconsultacontabil,
  frconsultacodigocontabil, Grids, DBGrids, cpdbgrid, Windows;

type
  TfrmCadastroServicos = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    edfCodigo: TtecDbEditFind;
    edtDescricao: TDBEditTexto;
    edtISSQN: TDBEditNumero;
    edtValor: TDBEditNumero;
    dtxCNAEDescricao: TtecDBText;
    sbnProcuraCNAE: TSpeedButton;
    flkCNAE: TtecDBFindLookup;
    pgcContasContabeis: TPageControl;
    tstaVista: TTabSheet;
    gbxDebitarVendaaVista: TGroupBox;
    sbnConsultaDebitarVendaVista: TSpeedButton;
    dtxDebitarDescricaoVendaVista: TtecDBText;
    flkDebitarVendaaVista: TtecDBFindLookup;
    dtxDebitarClassificacaoVendaVista: TtecDBText;
    gbxCreditarVendaVista: TGroupBox;
    sbnConsultaCreditarVendaVista: TSpeedButton;
    dtxCreditarDescricaoVendaVista: TtecDBText;
    flkCreditarVendaVista: TtecDBFindLookup;
    dtxCreditarClassificacaoVendaVista: TtecDBText;
    gbxHistoricoVendaaVista: TGroupBox;
    sbnConsultaHistoricoVendaaVista: TSpeedButton;
    dtxHistoricoVendaaVista: TtecDBText;
    flkHistoricoVendaaVista: TtecDBFindLookup;
    tstVendaaPrazo: TTabSheet;
    gbxDebitarVendaaPrazo: TGroupBox;
    sbnConsultaDebitarVendaPrazo: TSpeedButton;
    dtxDebitarDescricaoVendaPrazo: TtecDBText;
    flkDebitarVendaaPrazo: TtecDBFindLookup;
    dtxDebitarClassificacaoVendaPrazo: TtecDBText;
    gbxCreditarVendaPrazo: TGroupBox;
    sbnConsultaCreditarVendaPrazo: TSpeedButton;
    dtxCreditarDescricaoVendaPrazo: TtecDBText;
    flkCreditarVendaPrazo: TtecDBFindLookup;
    dtxCreditarClassificacaoVendaPrazo: TtecDBText;
    gbxHistoricoVendaaPrazo: TGroupBox;
    sbnConsultaHistoricoVendaaPrazo: TSpeedButton;
    dtxHistoricoVendaaPrazo: TtecDBText;
    flkHistoricoVendaaPrazo: TtecDBFindLookup;
    tstAbatimentos: TTabSheet;
    gbxDebitarAbatimentos: TGroupBox;
    sbnConsultaDebitarAbatimentos: TSpeedButton;
    dtxDebitarDescricaoAbatimentos: TtecDBText;
    flkDebitarAbatimentos: TtecDBFindLookup;
    dtxDebitarClassificacaoAbatimentos: TtecDBText;
    gbxCreditarAbatimentos: TGroupBox;
    sbnConsultaCreditarAbatimentos: TSpeedButton;
    dtxCreditarDescricaoAbatimentos: TtecDBText;
    flkCreditarAbatimentos: TtecDBFindLookup;
    dtxCreditarClassificacaoAbatimentos: TtecDBText;
    gbxHistoricoAbatimentos: TGroupBox;
    sbnConsultaHistoricoAbatimentos: TSpeedButton;
    dtxHistoricoAbatimentos: TtecDBText;
    flkHistoricoAbatimentos: TtecDBFindLookup;
    tstDevolucoes: TTabSheet;
    gbxDebitarDevolucoes: TGroupBox;
    sbnConsultaDebitarDevolucoes: TSpeedButton;
    dtxDebitarDescricaoDevolucoes: TtecDBText;
    flkDebitarDevolucoes: TtecDBFindLookup;
    dtxDebitarClassificacaoDevolucoes: TtecDBText;
    gbxCreditarDevolucoes: TGroupBox;
    sbnConsultaCreditarDevolucoes: TSpeedButton;
    dtxCreditarDescricaoDevolucoes: TtecDBText;
    flkCreditarDevolucoes: TtecDBFindLookup;
    dtxCreditarClassificacaoDevolucoes: TtecDBText;
    gbxHistoricoDevolucoes: TGroupBox;
    sbnConsultaHistoricoDevolucoes: TSpeedButton;
    dtxHistoricoDevolucoes: TtecDBText;
    flkHistoricoDevolucoes: TtecDBFindLookup;
    fraComissao1: TfraComissao;
    gbxCodigo: TGroupBox;
    gbxDescricao: TGroupBox;
    gbxCNAE: TGroupBox;
    gbxValorServicos: TGroupBox;
    gbxAliquota: TGroupBox;
    gbxLCP116: TGroupBox;
    fraConsultaEFD: TfraConsultaCodigo;
    mmoDescricaoServico116: TtecDBMemo;
    gbxPISCST: TGroupBox;
    fraConsultaPISCST: TfraConsultaCodigo;
    gbxPisAliquota: TGroupBox;
    edtAliquotaPIS: TDBEditNumero;
    gbxCOFINSCST: TGroupBox;
    fraConsultaCOFINSCST: TfraConsultaCodigo;
    gbxCofinsAliquota: TGroupBox;
    edtAliquotaCofins: TDBEditNumero;
    gbxISSQNST: TGroupBox;
    fraConsultaISSQNST: TfraConsultaCodigoContabil;
    fraComissao2: TfraComissao;
    dtxAtividade: TtecDBText;
    gbxCNAEMunicipios: TGroupBox;
    dbgCNAEMunicipios: TtecDBGrid;
    pnlAbaixo: TPanel;
    lblOrientacao: TLabel;
    gbxSituacoesTributarias: TGroupBox;
    dtxDenominacao: TtecDBText;
    procedure sbnProcuraCNAEClick(Sender: TObject);
    procedure sbnConsultaDebitarVendaVistaClick(Sender: TObject);
    procedure sbnConsultaCreditarVendaVistaClick(Sender: TObject);
    procedure sbnConsultaHistoricoVendaaVistaClick(Sender: TObject);
    procedure sbnConsultaDebitarVendaPrazoClick(Sender: TObject);
    procedure sbnConsultaCreditarVendaPrazoClick(Sender: TObject);
    procedure sbnConsultaHistoricoVendaaPrazoClick(Sender: TObject);
    procedure sbnConsultaDebitarAbatimentosClick(Sender: TObject);
    procedure sbnConsultaCreditarAbatimentosClick(Sender: TObject);
    procedure sbnConsultaHistoricoAbatimentosClick(Sender: TObject);
    procedure sbnConsultaDebitarDevolucoesClick(Sender: TObject);
    procedure sbnConsultaCreditarDevolucoesClick(Sender: TObject);
    procedure sbnConsultaHistoricoDevolucoesClick(Sender: TObject);
    procedure dbgCNAEMunicipiosDblClick(Sender: TObject);
    procedure dbgCNAEMunicipiosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  protected
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;

    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  TabelaDePesquisa: TZDataSet; override;
  public
    Constructor Create(AOwner: TComponent); override;
    Destructor  Destroy; override;
  end;

var
  frmCadastroServicos: TfrmCadastroServicos;
  TipoPesquisa: TtecCadastroServicos;

implementation

uses dmcadastroservicos;

{$R *.dfm}

{ TfrmCadastroCodigosFiscais }

constructor TfrmCadastroServicos.Create(AOwner: TComponent);
begin
  dtmCadastroServicos := TdtmCadastroServicos.Create(Self);
  inherited;
  dtmCadastroServicos.Abre(ctTabelas);
  DataSet := dtmCadastroServicos.TabelaServicos;
  TipoPesquisa := csrNENHUMA;
  pgcContasContabeis.Visible := ParSistema.GerarContabilidade and
                                UsuarioLogin.AlterarDadosContabeis;

  fraConsultaEFD.TipoPesquisa := pesSERVICOSLCP116;
  fraConsultaCOFINSCST.TipoPesquisa := pesTRIBUTOSCOFINS;
  fraConsultaPISCST.TipoPesquisa    := pesTRIBUTOSPIS;

  if not pgcContasContabeis.Visible then
  begin
    Constraints.MaxHeight := 580;
    constraints.MinHeight := 580;
//    constraints.MaxWidth  := 810;
//    constraints.MinWidth  := 810;
  end;
  fraConsultaISSQNST.TipoPesquisa := pesTRIBUTOSISSQN;
end;

destructor TfrmCadastroServicos.Destroy;
begin
  dtmCadastroServicos:=nil;
  dtmCadastroServicos := nil;
  inherited;
  frmCadastroServicos := nil;
end;

function TfrmCadastroServicos.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  case TipoPesquisa of
    csrSERVICO: Result:= dtmCadastroServicos.ExisteServico(NomeCampo, Value);
    csrCNAE   : Result:= dtmCadastroServicos.ExisteCNAE(NomeCampo, Value);
    csrDebitarVendaaVista,
    csrCreditarVendaaVista,
    csrDebitarVendaaPrazo,
    csrCreditarVendaaPrazo,
    csrDebitarAbatimentos,
    csrCreditarAbatimentos,
    csrDebitarDevolucoes,
    csrCreditarDevolucoes : Result:= dtmCadastroServicos.ExisteContaContabil(NomeCampo, Value);
    csrHistoricoVendaaVista,
    csrHistoricoVendaaPrazo,
    csrHistoricoAbatimentos,
    csrHistoricoDevolucoes : Result := dtmCadastroServicos.ExisteHistorico(NomeCampo, Value)

    else        Result:= False;
  end;
end;

function TfrmCadastroServicos.InternoExcluir: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, [ctSERVICOS])) = smbOK then begin
    Result := inherited InternoExcluir;
    if Result then
      Result := dtmCadastroServicos.ExcluirServico
  end
end;

function TfrmCadastroServicos.InternoGravar: Boolean;
begin
  Result := dtmCadastroServicos.GravarServico
end;

function TfrmCadastroServicos.InternoIncluir: Boolean;
begin
  Result := dtmCadastroServicos.IncluirServico
end;

function TfrmCadastroServicos.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  if CtrlOn then begin
    if ActiveControl = flkCNAE then begin
      TipoPesquisa:= csrCNAE;
      Titulo      := 'Atividades Econômicas';
    end
    else if flkDebitarVendaaVista.Focused then
        TipoPesquisa := csrDebitarVendaaVista
    else if flkCreditarVendaVista.Focused then
        TipoPesquisa := csrCreditarVendaaVista
    else if flkHistoricoVendaaVista.Focused then
        TipoPesquisa := csrHistoricoVendaaVista
    else if flkDebitarVendaaPrazo.Focused then
        TipoPesquisa := csrDebitarVendaaPrazo
    else if flkCreditarVendaPrazo.Focused then
        TipoPesquisa := csrCreditarVendaaPrazo
    else if flkHistoricoVendaaPrazo.Focused then
        TipoPesquisa := csrHistoricoVendaaPrazo
    else if flkDebitarAbatimentos.Focused then
        TipoPesquisa := csrDebitarAbatimentos
    else if flkCreditarAbatimentos.Focused then
        TipoPesquisa := csrCreditarAbatimentos
    else if flkHistoricoAbatimentos.Focused then
        TipoPesquisa := csrHistoricoAbatimentos
    else if flkDebitarDevolucoes.Focused then
        TipoPesquisa := csrDebitarDevolucoes
    else if flkCreditarDevolucoes.Focused then
        TipoPesquisa := csrCreditarDevolucoes
    else if flkHistoricoDevolucoes.Focused then
        TipoPesquisa := csrHistoricoDevolucoes
    else
        TipoPesquisa:= csrNENHUMA;
  end
  else begin
    TipoPesquisa := csrSERVICO;
    Titulo       := 'Serviços';
  end;
  if TipoPesquisa <> csrNENHUMA then
  begin
    dtmCadastroServicos.AbrirTabelas(TipoPesquisa);
    Result := inherited InternoPesquisar(Titulo);
    if Result = mrOK then
      dtmCadastroServicos.RefazConsultaTabelas(TipoPesquisa);
    dtmCadastroServicos.FecharTabelas(TipoPesquisa);
  end
  else
    if fraConsultaEFD.edfCodigo.Focused then
      fraConsultaEFD.InternoPesquisar('Serviços LCP 116/03');
end;

function TfrmCadastroServicos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa    := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:= False;
end;

function TfrmCadastroServicos.TabelaDePesquisa: TZDataSet;
begin
  case TipoPesquisa of
    csrSERVICO: Result:= dtmCadastroServicos.TabelaConsultaServicos;
    csrCNAE   : Result:= dtmCadastroServicos.TabelaConsultaCNAE;
    csrDebitarVendaaVista,
    csrCreditarVendaaVista,
    csrDebitarVendaaPrazo,
    csrCreditarVendaaPrazo,
    csrDebitarAbatimentos,
    csrCreditarAbatimentos,
    csrDebitarDevolucoes,
    csrCreditarDevolucoes : result:= dtmCadastroServicos.qryconsultacontacontabil;
    csrHistoricoVendaaVista,
    csrHistoricoVendaaPrazo,
    csrHistoricoAbatimentos,
    csrHistoricoDevolucoes  : result := dtmCadastroServicos.qryconsultahistorico;
    else        Result:= nil;
  end;
end;

procedure TfrmCadastroServicos.sbnProcuraCNAEClick(Sender: TObject);
begin
  CtrlOn:= True;
  flkCNAE.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmCadastroServicos.sbnConsultaDebitarVendaVistaClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkDebitarVendaaVista, ctCONTADEBITO)
end;

procedure TfrmCadastroServicos.sbnConsultaCreditarVendaVistaClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkCreditarVendaVista, ctCONTACREDITO)
end;

procedure TfrmCadastroServicos.sbnConsultaHistoricoVendaaVistaClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkHistoricoVendaaVista, ctHISTORICO)
end;

procedure TfrmCadastroServicos.sbnConsultaDebitarVendaPrazoClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkDebitarVendaaPrazo, ctCONTADEBITO)
end;

procedure TfrmCadastroServicos.sbnConsultaCreditarVendaPrazoClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkCreditarVendaPrazo, ctCONTACREDITO)
end;

procedure TfrmCadastroServicos.sbnConsultaHistoricoVendaaPrazoClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkHistoricoVendaaPrazo, ctHISTORICO)
end;

procedure TfrmCadastroServicos.sbnConsultaDebitarAbatimentosClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkDebitarAbatimentos, ctCONTADEBITO)
end;

procedure TfrmCadastroServicos.sbnConsultaCreditarAbatimentosClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkCreditarAbatimentos, ctCONTACREDITO)
end;

procedure TfrmCadastroServicos.sbnConsultaHistoricoAbatimentosClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkHistoricoAbatimentos, ctHISTORICO)
end;

procedure TfrmCadastroServicos.sbnConsultaDebitarDevolucoesClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkDebitarDevolucoes, ctCONTADEBITO)
end;

procedure TfrmCadastroServicos.sbnConsultaCreditarDevolucoesClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkCreditarDevolucoes, ctCONTACREDITO)
end;

procedure TfrmCadastroServicos.sbnConsultaHistoricoDevolucoesClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkHistoricoDevolucoes, ctHISTORICO)
end;

procedure TfrmCadastroServicos.dbgCNAEMunicipiosDblClick(Sender: TObject);
begin
  inherited;
  dtmCadastroServicos.MarcarAtividadeMunicipioAtiva;
end;

procedure TfrmCadastroServicos.dbgCNAEMunicipiosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and (Key = VK_Space) then
    dtmCadastroServicos.MarcarAtividadeMunicipioAtiva;
end;

end.
