unit fmlancamentocontas;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, DBCtrls,
  cpdbmemo, cpnumero, cptexto, cpdbtext, Mask, cpdbfindcontrols, ZQuery,
  fmconsultabasica, fmconsultaporcampo, ctconstantes, clparametrossistema,
  cpdbdata, DB, ZPgSqlQuery, cpquery, cpdbdiames, Windows, {Qete,} cppagecontrol, cpdata,
  Grids, DBGrids, cpdbgrid, biblio, clusuario, DateUtils, ActnList,
  fmprincipalbasico, dmlancamentocontabilidade, fmimpressaolotes, Spin,
  ToolWin;

type
  TfrmLancamentoContas = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    pgcLancamentos: TPageControl;
    tstLancamento: TTabSheet;
    gbxComplemento: TGroupBox;
    mmoComplemento: TtecDBMemo;
    gbxCabecalhoLancamento: TGroupBox;
    gbxLancamento: TGroupBox;
    edfLancamento: TtecDbEditFind;
    gbxOrigem: TGroupBox;
    dtxOrigem: TtecDBText;
    gbxData: TGroupBox;
    edtDiaMes: TDBEditDiaMes;
    tstParametrosConsulta: TTabSheet;
    pgcConsultaLanctos: TPageControl;
    tstParametros: TTabSheet;
    sbnGerarConsulta: TSpeedButton;
    gbxPlanoConsulta: TGroupBox;
    sbnPlanoConsulta: TSpeedButton;
    dtxClassificacaoConsulta: TtecDBText;
    dtxDescricaoPlanoConsulta: TtecDBText;
    edfPlanoConsulta: TtecDbEditFind;
    gbxHistoricoConsulta: TGroupBox;
    sbnHistoricoConsulta: TSpeedButton;
    dxtDescricaoHistoricoConsulta: TtecDBText;
    edfHistoricoConsulta: TtecDbEditFind;
    gbxFilialConsulta: TGroupBox;
    gbxDataConsultaLancto: TGroupBox;
    gbxLanctoConsulta: TGroupBox;
    edtNrLanctoConsulta: TEditNumero;
    gbxOrigemConsulta: TGroupBox;
    ckbEntradas: TCheckBox;
    ckbManual: TCheckBox;
    ckbPagamentos: TCheckBox;
    ckbRecebimentos: TCheckBox;
    ckbSaidas: TCheckBox;
    tstConsulta: TTabSheet;
    dbgConsultaLancamentos: TtecDBGrid;
    gbxDebitar: TGroupBox;
    flkDebitar: TtecDBFindLookup;
    dtxDescricaoDebitar: TtecDBText;
    dtxClassificacaoDebitar: TtecDBText;
    sbnConsultaDebitar: TSpeedButton;
    gbxCreditar: TGroupBox;
    sbnConsultaCreditar: TSpeedButton;
    flkCreditar: TtecDBFindLookup;
    dtxDescricaoCreditar: TtecDBText;
    dtxClassificacaoCreditar: TtecDBText;
    lblFilialBase: TLabel;
    gbxValorInicial: TGroupBox;
    edtValorInicial: TEditNumero;
    gbxValorFinal: TGroupBox;
    edtValorFinal: TEditNumero;
    rgpOrdenacao: TRadioGroup;
    ckbDocPagar: TCheckBox;
    tstLote: TTabSheet;
    dbgContabilidade: TtecDBGrid;
    pnlValor: TPanel;
    gbxValor: TGroupBox;
    edtValor: TDBEditNumero;
    gbxHistorico: TGroupBox;
    sbnConsultaHistorico: TSpeedButton;
    dtxHistoricoDescricao: TtecDBText;
    flkHistorico: TtecDBFindLookup;
    Bevel1: TBevel;
    GroupBox3: TGroupBox;
    mmoComplementoLote: TtecDBMemo;
    pnlHistoricosTotais: TPanel;
    gbxTotaisLotes: TGroupBox;
    gbxTotalDebitos: TGroupBox;
    gbxTotalCreditos: TGroupBox;
    GroupBox2: TGroupBox;
    Bevel3: TBevel;
    gbxHistorioLotes: TGroupBox;
    flkHistoricoLote: TtecDBFindLookup;
    dtxHistoricoLote: TtecDBText;
    pnlRegistros: TPanel;
    GroupBox4: TGroupBox;
    edtRegistros: TEditNumero;
    sbnIncluirLotes: TSpeedButton;
    aclHabilitar: TActionList;
    aclAbilitar: TAction;
    edtTotalCredito: TtecDBText;
    edtTotalDebito: TtecDBText;
    ckbLotes: TCheckBox;
    gbxTotaisLancamentos: TGroupBox;
    gbxDebitosLancamentos: TGroupBox;
    dtxDebitosLancamentos: TtecDBText;
    gbxCreditosLancamentos: TGroupBox;
    dtxCreditosLancamentos: TtecDBText;
    ckbEncerramento: TCheckBox;
    lblTituloExercicio: TLabel;
    gbxLote: TGroupBox;
    edtNrLote: TDBEditNumero;
    gbxlotes: TGroupBox;
    dtxNrLote: TtecDBText;
    sbnImprimir: TSpeedButton;
    gbxDataConsultaAlteracao: TGroupBox;
    ckbBancos: TCheckBox;
    lblOrdenacao: TLabel;
    gbxExercicio: TGroupBox;
    edtAnoExercicio: TSpinEdit;
    ckbImportacao: TCheckBox;
    ckbAdiantamentos: TCheckBox;
    edtDataInicialAlteracao: TEditData;
    lblA_PeriodoAlteracoes: TLabel;
    edtDataFinalAlteracao: TEditData;
    edtDataIniciallancto: TEditData;
    Label2: TLabel;
    edtDataFinallancto: TEditData;
    ckbVendasImoveis: TCheckBox;
    ckbChavesImoveis: TCheckBox;
    ckbAtMonImoveis: TCheckBox;
    ckbRecebimentosImoveis: TCheckBox;
    ckbAlteracoesContrato: TCheckBox;
    procedure sbnConsultaDebitarClick(Sender: TObject);
    procedure sbnConsultaCreditarClick(Sender: TObject);
    procedure sbnConsultaHistoricoClick(Sender: TObject);
    procedure edfLancamentoFound(Found: Boolean);
    procedure sbnProcurarClick(Sender: TObject);
    procedure sbnGerarConsultaClick(Sender: TObject);
    procedure dbgConsultaLancamentosDblClick(Sender: TObject);
    procedure dbgConsultaLancamentosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnPlanoConsultaClick(Sender: TObject);
    procedure sbnHistoricoConsultaClick(Sender: TObject);
    procedure edfLancamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgcConsultaLanctosChange(Sender: TObject);
    procedure PercorrerLanctos(Campo: Byte; ValorCampo: Variant; var Key: Word; Shift: TShiftState);
    procedure edtDiaMesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure flkDebitarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure flkCreditarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure flkHistoricoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure flkCreditarMessage(var Msg: String);
    procedure flkDebitarMessage(var Msg: String);
    procedure pgcLancamentosChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure flkDebitarEnter(Sender: TObject);
    procedure flkCreditarEnter(Sender: TObject);
    procedure sbnIncluirLotesClick(Sender: TObject);
    procedure aclAbilitarUpdate(Sender: TObject);
    procedure dbgContabilidadeDblClick(Sender: TObject);
    procedure dbgContabilidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mmoComplementoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNrLoteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnImprimirClick(Sender: TObject);
    procedure edtAnoExercicioExit(Sender: TObject);
    procedure edtAnoExercicioChange(Sender: TObject);
  private
    FRegravarLancamentos: TtecProcedure;
  private
    tecla :  Word;
    FOntecClose: TtecProcedure;
    EditandoLotes: Boolean;
    Incluindo: Boolean;
    ImprimindoLotes: Boolean;
    function PesquisaHabilitada: Boolean;
    function GetTitulo: String;
    function ValidarCamposSelecao: Boolean;
    procedure LimparConsulta;
    property RegravarLancamentos: TtecProcedure read FRegravarLancamentos write FRegravarLancamentos;
    procedure FocarRelatorio;
    { Private declarations }
  protected
    function InternoIncluir: Boolean; override;
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoPesquisar(Titulo:String): Integer; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function TabelaDePesquisa: TZDataSet; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure HabilitarCampos(SomenteLeitura: Boolean);
    procedure IncluirLancamentosLotes;
    function  InternoCancelar: Boolean; override;
    procedure LancamentosAfterOpen(Sender: TObject);
    procedure MensagemDataContabil;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure OperacaoPadrao(Value: Array of Variant); override;
    { Public declarations }
  end;

var
  frmLancamentoContas: TfrmLancamentoContas;
  TipoPesquisa: TtecLancamentoContas;

implementation

uses
  dmlancamentocontas;

{$R *.dfm}
{ TForm2 }

constructor TfrmLancamentoContas.Create(AOwner: TComponent);
begin
  dtmLancamentoContas := TdtmLancamentoContas.Create(Self);
  inherited  Create(AOwner);
  DataSet := dtmLancamentoContas.TabelaLancamentos;
  lblFilialBase.Caption := dtmLancamentoContas.DescricaoFilial;
  LimparConsulta;
  edtAnoExercicio.OnChange := nil;
  if UsuarioLogin.AlterarDadosContabeis then
  begin
    edtAnoExercicio.MaxValue := ParSistema.EXERCICIOCONTABILIDADE;
    edtAnoExercicio.MinValue := ParSistema.EXERCICIOCONTABILIDADE -1;
    gbxExercicio.Enabled := true;
  end
  else
  begin
    edtAnoExercicio.MaxValue := ParSistema.EXERCICIOCONTABILIDADE;
    edtAnoExercicio.MinValue := ParSistema.EXERCICIOCONTABILIDADE;
    gbxExercicio.Enabled := false;
  end;
  edtAnoExercicio.Value:= ParSistema.EXERCICIOCONTABILIDADE;
  edtAnoExercicio.OnChange := edtAnoExercicioChange;
  edtDiaMes.AnoExercicio := inttostr(ParSistema.EXERCICIOCONTABILIDADE);
  pgcLancamentos.ActivePageIndex := 0;

  pgclancamentos.TabHeight := 1;
  pgcLancamentos.TabWidth := 1;

  {pgclancamentos.Style := bsTabs;}

  dtmLancamentoContas.LancamentosAfterOpen := LancamentosAfterOpen;
  gbxlotes.visible := false;
  sbnImprimir.enabled := false;

  edtDiaMes.Minimo := DaysBetween(DataLocal,ParSistema.DataContabil+1);
  edtDiaMes.MensagemPadronizada := MensagemDataContabil;

//  Self.ActiveControl := edfLancamento;
  edfLancamento.SetFocus;
  edfLancamento.SelectAll;


end;


destructor TfrmLancamentoContas.Destroy;
begin
  inherited;
  dtmLancamentoContas := nil;
  frmLancamentoContas := nil;
end;

function TfrmLancamentoContas.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if result then
    result := not CtrlOn and
              ((OperacaoLancamento in [tlcINSERIREXTERNO, tlcEDITAREXTERNO, tlcLOTESEXTERNO]) and
                dtmLancamentoContas.PermiteAlterarContabilidade) or
                (OperacaoLancamento in [tlcMANUAL, tlcLOTES]);

  if Result then
  begin
    pgcLancamentos.ActivePageIndex := 0;
    case OperacaoLancamento of
      tlcMANUAL: begin
                   dtmLancamentoContas.IncluirLancamentos(false);
                   HabilitarCampos(false);
                   LancamentosAfterOpen(nil);
                   edtDiaMes.SetFocus;
                   edtdiames.SelectAll;
                 end;
      tlcLOTES: begin
                  IncluirLancamentosLotes;
                  if (sbnIncluir.Enabled) or
                     (dtmLancamentoContas.qryLancamentos.IsEmpty) then
                    dtmLancamentoContas.IncluirLancamentos(EditandoLotes);
                  EditandoLotes := (dtmLancamentoContas.qrylancamentoslotes.ReadOnly) and
                                   not (dtmLancamentoContas.qryLancamentos.IsEmpty);
                  if not EditandoLotes then
                    HabilitarCampos(false);

//                  edtNrLote.ReadOnly := true;
                  edtDiaMes.SetFocus;
                  edtdiames.SelectAll;
                end;
      tlcLOTESEXTERNO,
      tlcINSERIREXTERNO,
      tlcEDITAREXTERNO : begin
                            IncluirLancamentosLotes;
                            if (sbnIncluir.Enabled) or
                               (dtmLancamentoContas.qryLancamentos.IsEmpty) then
                              dtmLancamentoContas.IncluirLancamentos(EditandoLotes);
                            EditandoLotes := (dtmLancamentoContas.qrylancamentoslotes.ReadOnly) and
                                             not (dtmLancamentoContas.qryLancamentos.IsEmpty);
                            if not EditandoLotes then
                              HabilitarCampos(false);

                            flkDebitar.SetFocus;
                            flkDebitar.SelectAll;
                          end;
    end;
  end;
end;

function TfrmLancamentoContas.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
    result := not CtrlOn and
              (((OperacaoLancamento in [tlcINSERIREXTERNO, tlcEDITAREXTERNO, tlcLOTESEXTERNO]) and
                dtmLancamentoContas.PermiteAlterarContabilidade
               ) or
               (OperacaoLancamento in [tlcMANUAL,tlcLOTES]));
  if Result then
    if pgcLancamentos.ActivePage = tstLancamento then
      result := dtmLancamentoContas.ExcluirLancamentos
    else
    if pgcLancamentos.ActivePage = tstLote then
      result := dtmLancamentoContas.ExcluirLotes;

  if result then
  begin
    tecla := VK_NEXT;
    case operacaoLancamento of
      tlcMANUAL : PercorrerLanctos(1, inttostr(dtmLancamentoContas.NrLanctoAtual), tecla,[ssShift]);
    end;
  end;
end;


function TfrmLancamentoContas.InternoGravar: Boolean;
begin
  Result := inherited InternoGravar;
  if Result then
    if pgcLancamentos.ActivePage = tstLancamento then
      result := dtmLancamentoContas.GravarLancamentos
    else
    if pgcLancamentos.ActivePage = tstLote then    //so acontece qdo tlcLOTES
      result := dtmLancamentoContas.GravarLancamentosLotes;
end;

function TfrmLancamentoContas.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  if PesquisaHabilitada then
  begin
    with dtmLancamentoContas do begin
      if TipoPesquisa <> lacLANCAMENTO then
      begin
        if TipoPesquisa <> lacNENHUM then
        begin
          AbreTabelaConsulta(TipoPesquisa);
          Result := inherited InternoPesquisar(GetTitulo);
          if Result = mrOK then
            Selecionar(TipoPesquisa);
          FechaTabelaConsulta(TipoPesquisa);
        end;
      end
      else
        sbnProcurarClick(nil);
    end;
  end;
end;

function TfrmLancamentoContas.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

function TfrmLancamentoContas.PesquisaHabilitada: Boolean;
begin
  Result:= False;
  if CtrlOn then begin
    if ActiveControl is TtecDBFindLookup then begin
      if flkDebitar.Focused and not flkDebitar.ReadOnly then
        TipoPesquisa := lacDEBITAR
      else if flkCreditar.Focused and not flkCreditar.ReadOnly then
        TipoPesquisa := lacCREDITAR
      else if flkHistorico.Focused and not flkHistorico.ReadOnly then
        TipoPesquisa := lacHISTORICO
      else
        TipoPesquisa := lacNENHUM;
      Result := True;
    end
    else if ActiveControl is TtecDbEditFind then begin
      if edfPlanoConsulta.Focused then
        TipoPesquisa := lacCONTACONTABIL
      else if edfHistoricoConsulta.Focused then
        TipoPesquisa := lacHISTORICOCONSULTA
      else
        TipoPesquisa := lacNENHUM;
      Result := True;
    end;
  end
  else
  begin
     TipoPesquisa := lacLANCAMENTO;
     Result := True;
  end;
end;

function TfrmLancamentoContas.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmLancamentoContas do
  begin
    case TipoPesquisa of
      lacLANCAMENTO       : Result := ExisteLancamento(NomeCampo, Value);
      lacDEBITAR,
      lacCREDITAR,
      lacCONTACONTABIL    : Result := ExisteConta(NomeCampo, Value);
      lacHISTORICO,
      lacHISTORICOCONSULTA: Result := ExisteHistorico(NomeCampo, Value)
      else                  Result := False;
    end;
  end;
end;

function TfrmLancamentoContas.TabelaDePesquisa: TZDataSet;
begin
  with dtmLancamentoContas do
  begin
    case TipoPesquisa of
      lacLANCAMENTO       : Result := ConsultaLancamentos;
      lacDEBITAR,
      lacCREDITAR,
      lacCONTACONTABIL    : Result := ConsultaConta;
      lacHISTORICO,
      lacHISTORICOCONSULTA: Result := ConsultaHistoricos
      else                  Result := nil;
    end;
  end;
end;

procedure TfrmLancamentoContas.sbnConsultaDebitarClick(Sender: TObject);
begin
  CtrlOn := True;
  flkDebitar.SetFocus;
  if not flkDebitar.ReadOnly then
    InternoPesquisar('');
end;

procedure TfrmLancamentoContas.sbnConsultaCreditarClick(Sender: TObject);
begin
  CtrlOn := True;
  flkCreditar.SetFocus;
  if not flkCreditar.ReadOnly then
    InternoPesquisar('');
end;

procedure TfrmLancamentoContas.sbnConsultaHistoricoClick(Sender: TObject);
begin
  CtrlOn := True;
  flkHistorico.SetFocus;
  if not flkHistorico.ReadOnly then
    InternoPesquisar('');
end;

function TfrmLancamentoContas.GetTitulo:String;
begin
  case TipoPesquisa of
    lacLANCAMENTO       : Result := 'Lançamentos';
    lacDEBITAR,
    lacCREDITAR,
    lacCONTACONTABIL    : Result := 'Plano de Contas';
    lacHISTORICO        : Result := 'Históricos';
  end;
end;

procedure TfrmLancamentoContas.KeyDown(var Key: Word; Shift: TShiftState);
begin

  if (mmoComplemento.Focused) and
     (shift<>[ssAlt]) and
     (key = vk_return) then
  begin
    tecla := key;
    mmoComplementoKeyDown(mmoComplemento, tecla,  shift);
  end
  else
  begin
    inherited;
    case key of
      VK_ESCAPE: begin
                    case OperacaoLancamento of
                    tlcMANUAL : begin
                                  dtmLancamentoContas.LimparParametros;
                                  LimparConsulta;
                                  pgcLancamentos.ActivePageIndex := 0;
                                  edfLancamento.SetFocus;
                                  HabilitarCampos(not ((dtmLancamentoContas.OrigemLancamento='M') or
                                                       (dtmLancamentoContas.OrigemLancamento='')));
                                end;
                    tlcLOTES,
                    tlcLOTESEXTERNO  : sbnIncluirLotesClick(nil);

                    tlcINSERIREXTERNO,
                    tlcEDITAREXTERNO:
                                begin
                                  pgcLancamentos.ActivePageIndex := 0;
                                  edfLancamento.SetFocus;
                                end;
                    end;
                  end;
      VK_F5: begin
                if (sbnSalvar.Enabled) and
                   (pgcLancamentos.ActivePage = tstLote) then
                     sbnSalvarClick(nil);
              end;
      VK_F7: begin
                if pgcLancamentos.ActivePage = tstLote then
                begin
                  if sbnImprimir.enabled then
                    sbnImprimirClick(nil);
                end
                else
                  if pgclancamentos.ActivePage = tstParametrosConsulta then
                    if pgcConsultaLanctos.ActivePage = tstParametros then
                      sbnGerarConsultaClick(nil);
              end;
      VK_F8: begin
                case OperacaoLancamento of
                  tlcMANUAL,
                  tlcINSERIREXTERNO,
                  tlcEDITAREXTERNO:
                      if pgcLancamentos.ActivePage = tstLancamento then
                        sbnIncluirLotesClick(nil);
                  tlcLOTES,
                  tlcLOTESEXTERNO: sbnIncluirLotesClick(nil);
                end;
              end;

    end;
  end;  
end;

procedure TfrmLancamentoContas.edfLancamentoFound(Found: Boolean);
begin
  inherited;
//  if found then
     HabilitarCampos(not ((dtmLancamentoContas.OrigemLancamento = 'M') or
                          ((dtmLancamentoContas.OrigemLancamento = 'L') and
                           (OperacaoLancamento = tlcLOTES)) or
                          (dtmLancamentoContas.OrigemLancamento = '') ));
end;

procedure TfrmLancamentoContas.sbnProcurarClick(Sender: TObject);
begin
  pgcLancamentos.ActivePageIndex := 2;
  case OperacaoLancamento of
    tlcMANUAL: begin
                 pgcConsultaLanctos.ActivePageIndex := 0;
                 edtNrLanctoConsulta.SetFocus;
               end;
    tlcINSERIREXTERNO,
    tlcEDITAREXTERNO,
    tlcLOTESEXTERNO,
    tlcLOTES : begin
                          with dtmLancamentoContas do
                          begin
                            CancelarLancamentos;
                            dbgConsultaLancamentos.DataSource := dsrLancamentos;
                            pgcConsultaLanctos.ActivePageIndex := 1;
                            edtRegistros.Text := IntToStr(NumeroLancamentos);
                            dbgConsultaLancamentos.SetFocus;
                          end;
                        end;
  end;
end;

procedure TfrmLancamentoContas.sbnGerarConsultaClick(Sender: TObject);
var
  par_origem: String;
begin
  inherited;
  if ValidarCamposSelecao then
    with dtmLancamentoContas do
    begin
      NrLanctoConsulta := edtNrLanctoConsulta.Text;
      PlanoConsulta  := edfPlanoConsulta.Text;
      HistoricoConsulta := edfHistoricoConsulta.Text;

      DataInicialConsulta := edtDataInicialLancto.Text;
      DataFinalConsulta := edtDataFinalLancto.Text;

      if not DataEmBranco(edtDataInicialAlteracao.Text) then
        DataInicialAlteracao := edtDataInicialAlteracao.Text
      else
        DataInicialAlteracao := '';

      if not DataEmBranco(edtDataFinalAlteracao.Text) then
        DataFinalAlteracao := edtDataFinalAlteracao.Text
      else
        DataFinalAlteracao := '';

      ValorInicialConsulta := edtValorInicial.Text;
      ValorFinalConsulta := edtValorFinal.Text;

      par_origem:= '';

      if ckbBancos.      Checked then par_origem := par_origem + '''B'',';
      if ckbAdiantamentos.Checked then par_origem := par_origem + '''A'',';
      if ckbDocPagar.    Checked then par_origem := par_origem + '''D'',';
      if ckbEntradas.    Checked then par_origem := par_origem + '''E'',';
      if ckbLotes.       Checked then par_origem := par_origem + '''L'',';
      if ckbManual.      Checked then par_origem := par_origem + '''M'',';
      if ckbPagamentos.  Checked then par_origem := par_origem + '''P'',';
      if ckbRecebimentos.Checked then par_origem := par_origem + '''R'',';
      if ckbSaidas.      Checked then par_origem := par_origem + '''S'',';
      if ckbEncerramento.Checked then par_origem := par_origem + '''X'',';
      if ckbImportacao.Checked   then par_origem := par_origem + '''I'',';
      if ckbVendasImoveis.Checked then par_origem := par_origem + '''V'',';
      if ckbChavesImoveis.Checked then par_origem := par_origem + '''H'',';
      if ckbAtMonImoveis.Checked  then par_origem := par_origem + '''O'',';
      if ckbAlteracoesContrato.Checked  then par_origem := par_origem + '''G'',';
      if ckbRecebimentosImoveis.Checked   then par_origem := par_origem + '''T'',';


      if Length(par_origem) > 0  then delete(par_origem,Length(Par_Origem),1);
      OrigemConsulta := par_origem;

      OrdenacaoConsulta := rgpOrdenacao.ItemIndex;

      if AbrirConsultaLancamentos then
      begin
        MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO, ['lançamento']));
        pgcConsultaLanctos.ActivePageIndex := 0;
        edtNrLanctoConsulta.SetFocus;
      end
      else
      begin
        pgcConsultaLanctos.ActivePageIndex := 1;
        edtRegistros.Text := IntToStr(NumeroLancamentos);
        dbgConsultaLancamentos.SetFocus;
      end;
    end;


  //refazConsulta

end;

function TfrmLancamentoContas.ValidarCamposSelecao: Boolean;
begin
  Result := (edtDataInicialLancto.DataValida and edtDataFinalLancto.DataValida);
  if Result then
  begin
    Result:=(not DataEmBranco(edtDataInicialLancto.text) or
             not DataEmBranco(edtDataFinalLancto.text));
    if result then
    begin
      Result:=   StrToDate(edtDataInicialLancto.Text)
              <= StrToDate(edtDataFinalLancto.Text);
      if not Result then
      begin
        MensagemAviso(ctDATAINVALIDA);
        edtDataInicialLancto.SetFocus;
      end;
    end
    else
    begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      edtDataInicialLancto.SetFocus;
    end;
  end;

  if result then
  begin
    Result := (edtDataInicialAlteracao.DataValida and
               edtDataFinalAlteracao.DataValida);
    if Result then
    begin
      if (not DataEmBranco(edtDataInicialAlteracao.text) and
          not DataEmBranco(edtDataFinalAlteracao.text)) then
      begin
        Result:=   StrToDate(edtDataInicialAlteracao.Text)
              <= StrToDate(edtDataFinalAlteracao.Text);
        if not result then
        begin
          MensagemAviso(ctDTINICIALMAIORDTFINAL);
          edtDataInicialAlteracao.SetFocus;
        end;
      end;
    end;
  end;
end;

procedure TfrmLancamentoContas.dbgConsultaLancamentosDblClick(
  Sender: TObject);
begin
  inherited;
  if not dtmLancamentoContas.ReFazConsultaLancamento then
  begin
    pgcLancamentos.ActivePageIndex := 0;
//    edfLancamento.ActiveSetControls := True;
    edfLancamento.SetFocus;
    edfLancamento.SetControl(true);
  end;
end;

procedure TfrmLancamentoContas.dbgConsultaLancamentosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((key = VK_Return) or (Key = VK_Return)) then
    dbgConsultaLancamentosDblClick(nil);
end;

procedure TfrmLancamentoContas.sbnPlanoConsultaClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  edfPlanoConsulta.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmLancamentoContas.sbnHistoricoConsultaClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  edfHistoricoConsulta.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmLancamentoContas.edfLancamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_ESCAPE then
  begin
    dtmLancamentoContas.LimparConsultaLancamentos;
    HabilitarCampos(false);
  end
  else
    PercorrerLanctos(cmpLancto, edfLancamento.Text, Key, Shift);
end;

procedure TfrmLancamentoContas.pgcConsultaLanctosChange(Sender: TObject);
begin
  inherited;
  case OperacaoLancamento of
    tlcMANUAL:
      case pgcConsultaLanctos.ActivePageIndex of
        1:  begin
              if dtmLancamentoContas.NumeroLancamentos = 0 then
                sbnGerarConsultaClick(nil);
            end;
      end;
  end;
end;

procedure TfrmLancamentoContas.PercorrerLanctos(Campo: Byte; ValorCampo: Variant; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_NEXT) or
      (Key = VK_PRIOR)   or
     ((ssCtrl in Shift) and ((Key = VK_HOME) or (Key = VK_END)))
   then
   begin
     edfLancamento.ExibirMensagem := false;
     dtmLancamentoContas.PercorrerLanctos(Campo, ValorCampo, Key, Shift);
     edfLancamento.ExibirMensagem := true;     
   end;
end;

procedure TfrmLancamentoContas.edtDiaMesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  PercorrerLanctos(cmpDiaMes, edtDiaMes.Text, Key, Shift);
end;

procedure TfrmLancamentoContas.flkDebitarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  PercorrerLanctos(cmpDebitar, flkDebitar.Text, Key, Shift);
end;

procedure TfrmLancamentoContas.flkCreditarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  PercorrerLanctos(cmpCreditar, flkCreditar.Text, Key, Shift);
end;

procedure TfrmLancamentoContas.edtValorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  PercorrerLanctos(cmpValor, edtValor.Text, Key, Shift);
end;

procedure TfrmLancamentoContas.flkHistoricoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  PercorrerLanctos(cmpHistorico, flkHistorico.Text, Key, Shift);
end;

procedure TfrmLancamentoContas.flkCreditarMessage(var Msg: String);
begin
  inherited;
  if flkCreditar.Text = flkDebitar.Text then
    msg := ctCREDITARDIFERENTEDEBITAR;{
  else
    case OperacaoLancamento of
      tlcINSERIREXTERNO,
      tlcEDITAREXTERNO: msg :=
        format(ctREGISTROINCLUIDO,['codigo: '+flkcreditar.text, 'nos lançamentos']);
    end;}
end;

procedure TfrmLancamentoContas.flkDebitarMessage(var Msg: String);
begin
  inherited;
  if flkDebitar.Text = flkCreditar.Text then
    msg := ctCREDITARDIFERENTEDEBITAR;{
  else
    case OperacaoLancamento of
      tlcINSERIREXTERNO,
      tlcEDITAREXTERNO: msg :=
        format(ctREGISTROINCLUIDO,['codigo: '+flkdebitar.text, 'nos lançamentos']);
    end;}
end;

procedure TfrmLancamentoContas.LimparConsulta;
begin
  edtNrLanctoConsulta.Text := '';
  edtValorInicial.Text := '';
  edtValorFinal.Text := '';
  edtDataInicialLancto.Text := DateToStr(PrimeiroDiaMesPassado(0));
  edtDataFinalLancto.Text := DateToStr(DataLocal);
  edfPlanoConsulta.Text := '';
  edfPlanoConsulta.Exist;
  edfHistoricoConsulta.Text := '';
  edfHistoricoConsulta.Exist;
  ckbEntradas.Checked := False;
  ckbLotes.Checked := false;
  ckbManual.Checked := False;
  ckbPagamentos.Checked := False;
  ckbRecebimentos.Checked := False;
  ckbSaidas.Checked := False;
  ckbEncerramento.Checked := false;
  ckbVendasImoveis.Checked := false;
  ckbChavesImoveis.Checked := false;
  ckbAlteracoesContrato.Checked := False;
  ckbAtMonImoveis.Checked := false;
  ckbRecebimentosImoveis.Checked := false;

  rgpOrdenacao.ItemIndex := 1;
end;

procedure TfrmLancamentoContas.pgcLancamentosChange(Sender: TObject);
begin
  inherited;
  if pgcLancamentos.ActivePage = tstLote then
  begin
    sbnExcluir.Hint := 'Exclui o Lote';
  {
    case OperacaoLancamento of
      tlcMANUAL:  sbnExcluir.Enabled := False;
      tlcINSERIREXTERNO,
      tlcEDITAREXTERNO: sbnExcluir.Enabled := true;
    end;
}
    gbxlotes.Visible := true;
  end
  else
  begin
    gbxlotes.Visible := false;
    sbnExcluir.Hint := 'Exclui o Registro Atual';
  end;
end;

procedure TfrmLancamentoContas.OperacaoPadrao(Value: array of Variant);
begin
  inherited;
  dtmLancamentoContas.GuardarParametrosExternos(Value);
  RegravarLancamentos := dtmLancamentoContabilidade.RegravarLancamentos;
//  edfLancamento.ReadOnly := true;
//  edtDiaMes.ReadOnly := true;

  try
  tstParametros.TabVisible := false; except end;

  self.Caption := value[5];
  edtAnoExercicio.MaxValue := yearof(dtmLancamentoContas.dataorigem);
  edtAnoExercicio.MinValue := yearof(dtmLancamentoContas.dataorigem);
  edtAnoExercicio.Value := yearof(dtmLancamentoContas.dataorigem);
  edtDiaMes.AnoExercicio := inttostr(edtAnoExercicio.Value);

  case OperacaoLancamento of
    tlcINSERIREXTERNO: InternoIncluir;
    tlcEDITAREXTERNO: begin
                         edfLancamento.SetControl(true);
                         edfLancamento.SetFocus;
                       end;
  end;
  HabilitarCampos(not dtmLancamentoContas.PermiteAlterarContabilidade);
  BloquearFormularios(self.name);
  LancamentosAfterOpen(nil);
end;

procedure TfrmLancamentoContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  case OperacaoLancamento of
  tlcINSERIREXTERNO,
  tlcEDITAREXTERNO,
  tlcLOTESEXTERNO: begin
    dtmLancamentoContas.GravarLancamentosExternos;
    FormOrigemBloqueio := dtmLancamentoContas.Nomeorigemformulario;
    DesbloquearFormularios;
    if Assigned(fRegravarLancamentos) then
      FRegravarLancamentos;
  end;
  end;
end;

procedure TfrmLancamentoContas.HabilitarCampos(SomenteLeitura: Boolean);
var
  ForaLimiteDataContabil, valor: Boolean;
begin

  valor := somenteleitura;
  ForaLimiteDataContabil := false;
  if dtmLancamentoContas.qryLancamentos.State <> dsinsert then
    ForaLimiteDataContabil := (dtmLancamentoContas.qryLancamentosdata.AsDateTime<>0) and
                            (dtmLancamentoContas.qryLancamentosdata.AsDateTime <=
                             ParSistema.DataContabil);

  valor := valor or ForaLimiteDataContabil;

  if (OperacaoLancamento in [tlcLOTESEXTERNO,
                           tlcINSERIREXTERNO, tlcEDITAREXTERNO]) then
    edtdiames.ReadOnly := true
  else
    edtDiaMes.ReadOnly := Valor;

  if (OperacaoLancamento in [tlcLOTES, tlcLOTESEXTERNO,
                             tlcINSERIREXTERNO, tlcEDITAREXTERNO]) then
  begin
    edtNrLote.ReadOnly := true;
    edfLancamento.ReadOnly := true;
  end
  else
  begin
    edtNrLote.ReadOnly := Valor;
    edfLancamento.ReadOnly := false;
  end;

  flkDebitar.ReadOnly     := Valor;
  flkCreditar.ReadOnly    := Valor;
  edtValor.ReadOnly       := Valor;
  flkHistorico.ReadOnly   := Valor;
  mmoComplemento.ReadOnly := Valor;

end;

procedure TfrmLancamentoContas.flkDebitarEnter(Sender: TObject);
begin
  inherited;
  dtmLancamentoContas.DebitoAnterior := flkDebitar.text;
end;

procedure TfrmLancamentoContas.flkCreditarEnter(Sender: TObject);
begin
  inherited;
  dtmLancamentoContas.CreditoAnterior := flkCreditar.text;
end;

procedure TfrmLancamentoContas.sbnIncluirLotesClick(Sender: TObject);
var
  cancelar: boolean;
begin
  inherited;
  with dtmLancamentoContas do
  begin
    if (sbnIncluirLotes.Caption = 'Incluir Lotes F8') or
       (sbnIncluirLotes.Caption = 'Exibir Lotes F8') then
    begin
      edtAnoExercicio.Enabled := false;
      if qrylancamentos.State in [dsedit, dsinsert] then
         qrylancamentos.Cancel;

      if (OperacaoLancamento in [tlcLOTES, tlcLOTESEXTERNO]) then
      begin
        pgcLancamentos.ActivePage := tstLote;
        sbnIncluirLotes.Caption := 'Exibir Lançtos F8';
        sbnIncluirLotes.Hint := 'Lançamentos manuais';
      end
      else
      begin
//        edfLancamento.ReadOnly := true;
//        edtNrLote.ReadOnly := true;
  //      edtDiaMes.ReadOnly := true;
        if OperacaoLancamento = tlcMANUAL then
          OperacaoLancamento := tlcLOTES
        else
          OperacaoLancamento := tlcLOTESEXTERNO;
        dtmLancamentoContas.AbrirLoteLancamentos;
        EditandoLotes := (qrylancamentoslotes.ReadOnly) and
                         not (qryLancamentos.IsEmpty);
        if qryLancamentos.IsEmpty then
          InternoIncluir
        else
        begin
          pgcLancamentos.ActivePage := tstLote;
          sbnIncluirLotes.Caption := 'Exibir Lançtos F8';
          sbnIncluirLotes.Hint := 'Lançamentos manuais';
        end;
      end;
    end
    else
    if sbnIncluirLotes.Caption = 'Exibir Lançtos F8' then
    begin
      edtAnoExercicio.Enabled := true;
      cancelar := InternoCancelar;
      if cancelar then
      begin
        LoteAlterado := false;
//        edfLancamento.ReadOnly := false;
//        edtNrLote.ReadOnly := false;
  //      edtDiaMes.ReadOnly := false;
        case OperacaoLancamento of
          tlcLOTES : OperacaoLancamento := tlcMANUAL;
          tlcLOTESEXTERNO: OperacaoLancamento := tlcEDITAREXTERNO;
        end;

        pgcLancamentos.ActivePage := tstLancamento;
        DesligarLancamentosemLote;

        sbnIncluirLotes.Caption := 'Incluir Lotes F8';
        sbnIncluirLotes.Hint := 'Incluir Lançamentos em lotes';

        if LoteAlterado then
        begin
          if NrLanctoOriginal<>0 then
          begin
            sbnIncluirLotes.Caption := 'Exibir Lotes F8';
            sbnIncluirLotes.Hint := 'Exibir Lançamentos em lotes';
            case OperacaoLancamento of
              tlcMANUAL : begin
                           edfLancamento.Text := inttostr(NrLanctoOriginal);
                           edfLancamento.Exist;
                         end;
              tlcEDITAREXTERNO: qryLancamentos.Locate('nrlancto',qryLancamentosLotesnrlancto.AsInteger,[]);
            end;
          end;
        end
        else
        begin
          if NrLanctoAtual<>0 then
          begin
            sbnIncluirLotes.Caption := 'Exibir Lotes F8';
            sbnIncluirLotes.Hint := 'Exibir Lançamentos em lotes';
            case OperacaoLancamento of
              tlcMANUAL : begin
                           edfLancamento.Text := inttostr(NrLanctoAtual);
                           edfLancamento.Exist;
                         end;
              tlcEDITAREXTERNO: qryLancamentos.Locate('nrlancto',qryLancamentosLotesnrlancto.AsInteger,[]);
            end;
          end;
        end;
        AlterarEstadoBotoes;
        edfLancamentoFound(true);
        LancamentosAfterOpen(nil);
      end;
    end;
  end;
end;

procedure TfrmLancamentoContas.aclAbilitarUpdate(Sender: TObject);
begin
  inherited;
  case OperacaoLancamento of
    tlcMANUAL: begin
                 sbnImprimir.enabled := false;
                 sbnExcluir.Enabled := (dtmLancamentoContas.OrigemLancamento = 'M');

                 sbnIncluirLotes.Enabled := not sbnSalvar.Enabled;
                 sbnProcurar.Enabled := true;
                 if dtmLancamentoContas.qryLancamentos.RecordCount=1 then
                 begin
                   sbnIncluirLotes.Hint := 'Exibir lançamentos em lotes';
                   sbnIncluirLotes.Caption := 'Exibir Lotes F8';
                 end
                 else
                 begin
                   sbnIncluirLotes.Hint := 'Incluir lançamentos em lotes';
                   sbnIncluirLotes.Caption := 'Incluir Lotes F8';
                 end;
               end;
    tlcLOTES: begin
                if not (dtmLancamentoContas.qryLancamentos.State in [dsedit, dsinsert]) then
                  sbnIncluir.Enabled  := (dtmLancamentoContas.OrigemLancamento = 'M') or
                                         (dtmLancamentoContas.OrigemLancamento = 'L');
//                sbnExcluir.enabled  := (sbnincluir.Enabled) and (pgcLancamentos.ActivePage = tstLancamento);

               sbnExcluir.Enabled := ((sbnincluir.Enabled) and (pgcLancamentos.ActivePage = tstLancamento)) or
                                     (dtmLancamentoContas.OrigemLancamento = 'M') or
                                     (((dtmLancamentoContas.OrigemLancamento = 'L') or
                                       (dtmLancamentoContas.OrigemLancamento = 'I')) and
                                      (OperacaoLancamento = tlcLOTES) and
                                      ((pgcLancamentos.ActivePage = tstLote)));

                sbnProcurar.Enabled := false;
                if pgcLancamentos.ActivePage = tstLote then
                begin
                  sbnSalvar.Enabled := dtmLancamentoContas.LoteAlterado;
                  sbnImprimir.enabled := not dtmLancamentoContas.LoteAlterado and
                                         (dtmLancamentoContas.qryLancamentosLotes.RecordCount>0) and
                                         ((dtmLancamentoContas.qryLancamentosorigem.asstring = 'L') or
                                          (dtmLancamentoContas.qryLancamentosorigem.asstring = 'X') or
                                          (dtmLancamentoContas.qryLancamentosorigem.asstring = 'I'));
                end
                else
                  sbnImprimir.enabled := false;
              end;
  end;
end;

procedure TfrmLancamentoContas.dbgContabilidadeDblClick(Sender: TObject);
begin
  inherited;
  EditandoLotes := not dtmLancamentoContas.qryLancamentosLotes.IsEmpty or
                   EditandoLotes;
  InternoIncluir;
end;

procedure TfrmLancamentoContas.IncluirLancamentosLotes;
begin
  pgcLancamentos.ActivePage := tstLancamento;
  with dtmLancamentoContas do
    qrylancamentos.Locate('nrlancto',qryLancamentosLotesnrlancto.AsInteger,[]);

  sbnSalvar.Enabled := false;
  sbnIncluirLotes.Caption := 'Exibir Lotes F8';
  sbnIncluirLotes.Hint := 'Exibir lançamentos em lotes';
  aclAbilitarUpdate(nil);
end;

procedure TfrmLancamentoContas.dbgContabilidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = teclaeditarregistro then
  begin
    EditandoLotes := not dtmLancamentoContas.qryLancamentosLotes.IsEmpty or
                     EditandoLotes;
    InternoIncluir;
  end;
end;

function TfrmLancamentoContas.InternoCancelar: Boolean;
begin
 result := true;
 if (pgcLancamentos.ActivePage = tstLote) or
    ((pgcLancamentos.ActivePage = tstLancamento) and
     (dtmLancamentoContas.qryLancamentos.state = dsBrowse)) then
 begin
   if dtmLancamentoContas.LoteAlterado and
      (OperacaoLancamento = tlcLOTES) then
      result := MensagemConfirmacao(ctLOTELANCAMENTOALTERADO+ #10#13 +
                                        ctINFORMACOESSERAOPERDIDAS) = smbOk;
 end
 else
   result :=  inherited internocancelar;
end;

procedure TfrmLancamentoContas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if canclose then
  begin
    Canclose := not dtmLancamentoContas.LoteAlterado and
                (OperacaoLancamento = tlcLOTES);
     if not canclose then
      canclose := InternoCancelar;
  end;
end;

procedure TfrmLancamentoContas.LancamentosAfterOpen(Sender: TObject);
begin
  gbxTotaisLancamentos.Visible := ((dtmLancamentoContas.OrigemLancamento<>'M') and
                                   (dtmLancamentoContas.OrigemLancamento<>'')) or
                                   (OperacaoLancamento = tlcLOTES);
  if gbxTotaisLancamentos.Visible and
     not dtmLancamentoContas.LoteAlterado then
    dtmLancamentoContas.AbrirTotaisLotes;
end;

procedure TfrmLancamentoContas.mmoComplementoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  Incluindo := False;
  if (tecla = VK_Return) then
  begin
   tecla := 0;
   Incluindo := dtmLancamentoContas.qrylancamentos.State = dsinsert;
   if sbnSalvar.Enabled then
   begin
     if InternoGravar then
     begin
       if Incluindo then
       begin
         dtmLancamentoContas.guardarvaloresinclusao;
         sbnIncluirClick(nil);
         dtmLancamentoContas.AtribuirValoresInclusao;
       end;
       case OperacaoLancamento of
         tlcMANUAL,
         tlcLOTES : begin
                      edtdiames.SetFocus;
                      edtDiaMes.SelectAll;
                    end;
         tlcINSERIREXTERNO,
         tlcEDITAREXTERNO,
         tlcLOTESEXTERNO : begin
                             flkdebitar.SetFocus;
                             flkdebitar.SelectAll;
                           end;
       end;
     end;
   end;
  end;
end;


procedure TfrmLancamentoContas.edtNrLoteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_ESCAPE then
    dtmLancamentoContas.LimparConsultaLancamentos
  else
    PercorrerLanctos(cmpNrOrigemLote, edtNrLote.Text, Key, Shift);
end;

procedure TfrmLancamentoContas.sbnImprimirClick(Sender: TObject);
begin
  inherited;
  dtmLancamentoContas.AtualizarListaContaContabil;

  if not assigned(frmImpressaoLotes) then
    frmImpressaoLotes := TfrmImpressaoLotes.Create(self);
    
  frmImpressaoLotes.FormOrigemBloqueio := self.name;
  frmImpressaoLotes.OperacaoPadrao([dtmLancamentoContas.qryTotaisdatainicial.AsVariant,
                                 dtmLancamentoContas.qryTotaisdatafinal.AsVariant,
                                 dtmLancamentoContas.qryLancamentosnrorigemlote.AsString,
                                 dtmlancamentocontas.ListaContasContabeis]);
  frmImpressaoLotes.OntecClose := FocarRelatorio;

end;

procedure TfrmLancamentoContas.edtAnoExercicioExit(Sender: TObject);
begin
  inherited;
  if (edtAnoExercicio.Value >= edtAnoExercicio.MinValue) and
     (edtAnoExercicio.Value <= edtAnoExercicio.MaxValue) then
  begin
    if dtmLancamentoContas.ExercicioLancamento <> edtAnoExercicio.Value then
    begin
      dtmLancamentoContas.ProximoNrLancto := 0;
      dtmLancamentoContas.ExercicioLancamento := edtAnoExercicio.Value;
      edtDiaMes.AnoExercicio := inttostr(edtAnoExercicio.Value);
      tecla := VK_END;
      PercorrerLanctos(1, inttostr(dtmLancamentoContas.NrLanctoAtual), tecla,[ssCtrl]);
    end;
  end;
end;

procedure TfrmLancamentoContas.FocarRelatorio;
begin
  dbgContabilidade.SetFocus;
end;

procedure TfrmLancamentoContas.MensagemDataContabil;
begin
  MensagemAviso(format(ctDATACONTABILMAIORDATALANCTO, ['de lançamento',
                       edtDiaMes.Text, 'contábil', ParSistema.DataContabilstring]));
end;

procedure TfrmLancamentoContas.edtAnoExercicioChange(Sender: TObject);
begin
  inherited;
  edtAnoExercicioExit(edtAnoExercicio);
end;

end.
