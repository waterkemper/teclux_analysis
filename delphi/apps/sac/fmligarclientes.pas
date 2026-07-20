unit fmligarclientes;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, ExtCtrls, Buttons, StdCtrls, ComCtrls, {Qete,}
  cppagecontrol, Mask, cpdbfindcontrols, DBCtrls, cpdbtext,  Windows,
  cpdbradiogroup, cpdata, dmligarclientes, ctconstantes, biblio,
  fmconsultabasica, fmconsultaporcampo, zquery, Grids, DBGrids, cpdbgrid,
  cpdbmemo, cpnumero, ActnList, clparametrossistema,
  fmprincipalbasico, ToolWin,fmconsultavendas, frendereco, dateutils,
  frselecaoaleatoriagruposusuarios, frselecaoaleatoriausuarios,
  frlistatiposAtendimentos;

type
  TfrmLigarClientes = class(TfrmRelatorioPadrao)
    pgcLigarClientes: TtecPageControl;
    tstParametros: TTabSheet;
    tstRegistrosSelecionados: TTabSheet;
    gbxParametros: TGroupBox;
    pgcFilialGrupoFilial: TtecPageControl;
    tstFilial: TTabSheet;
    sbnProcurarFilial: TSpeedButton;
    dtxFilial: TtecDBText;
    edfFilial: TtecDbEditFind;
    tstGrupoFilial: TTabSheet;
    sbnProcurarGrupoFilial: TSpeedButton;
    dtxGrupoFilial: TtecDBText;
    edfGrupoFilial: TtecDbEditFind;
    gbxAgentes: TGroupBox;
    sbnProcurarAgentes: TSpeedButton;
    dtxAgentes: TtecDBText;
    edfAgentes: TtecDbEditFind;
    gbxConceitos: TGroupBox;
    sbnProcurarConceitos: TSpeedButton;
    dtxConceitos: TtecDBText;
    edfConceitos: TtecDbEditFind;
    gbxRegiao: TGroupBox;
    sbnProcurarRegiao: TSpeedButton;
    dtxRegiao: TtecDBText;
    edfRegiao: TtecDbEditFind;
    rgpParcelas: TtecDBRadioGroup;
    ckbTodosAtrasados: TtecRadioButton;
    ckbSomentePeriodo: TtecRadioButton;
    ckbNenhumPagamento: TtecRadioButton;
    gbxPeriodoVencimento: TGroupBox;
    edtVenctoInicial: TEditData;
    edtVenctoFinal: TEditData;
    gbxVenda: TGroupBox;
    edtVenda: TEditData;
    rgpComOcorrencia: TtecDBRadioGroup;
    ckbNaoLigar: TtecRadioButton;
    ckbLigar: TtecRadioButton;
    rgpSemTelefone: TtecDBRadioGroup;
    ckbSelecionar: TtecRadioButton;
    ckbNaoSelecionar: TtecRadioButton;
    rgpOrdenacao: TtecDBRadioGroup;
    ckbNomeCliente: TtecRadioButton;
    ckbValor: TtecRadioButton;
    ckbEmissao: TtecRadioButton;
    sbnGerar: TSpeedButton;
    rgpTipoSelecao: TtecDBRadioGroup;
    ckbAtraso: TtecRadioButton;
    ckbLembrete: TtecRadioButton;
    gbxUltimoAtendimentoCobranca: TGroupBox;
    mmoUltimoAtendimentoCobranca: TtecDBMemo;
    gbxTotais: TGroupBox;
    edtRegistros: TEditNumero;
    edtValores: TEditNumero;
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    gbxUltimoAtendimentoReclamacao: TGroupBox;
    mmoUltimoAtendimentoReclamacao: TtecDBMemo;
    gbxLembrar: TGroupBox;
    edtInicioLembrar: TEditData;
    edtFinalLembrar: TEditData;
    rgpPosOcorrencias: TtecDBRadioGroup;
    ckbSemPagamento: TtecRadioButton;
    ckbOcorrencias: TtecRadioButton;
    ckbAvisos: TtecRadioButton;
    pgcTipoControle: TPageControl;
    tstAtraso: TTabSheet;
    tstAvisos: TTabSheet;
    dbgLigarClientes: TtecDBGrid;
    dbgLigarClientesAvisos: TtecDBGrid;
    rgpComCobrador: TtecDBRadioGroup;
    ckbNaoSelecionarComCobrador: TtecRadioButton;
    ckbSelecionarComCobrador: TtecRadioButton;
    ckbCodigoCliente: TtecRadioButton;
    lblFaturamento: TLabel;
    lblAVencto: TLabel;
    Label1: TLabel;
    gbxQtde: TGroupBox;
    gbxValor: TGroupBox;
    rgpMarcadosparanaoligar: TtecDBRadioGroup;
    rbnMarcadosNaoLigar: TtecRadioButton;
    rbnAmbosLigar: TtecRadioButton;
    rbnnaoMarcadosNaoLigar: TtecRadioButton;
    tstLembretes: TTabSheet;
    dbgLigarClientesLembrete: TtecDBGrid;
    sbnConsultaVendas: TSpeedButton;
    pnlBottom: TPanel;
    gbxGrades: TPanel;
    dtpHoraInicial: TDateTimePicker;
    gbxLembraraPartrdas: TGroupBox;
    Splitter1: TSplitter;
    SplitterUltimoAtendimentoReclamacao: TSplitter;
    SplitterUltimoAtendimentoCobranca: TSplitter;
    gbxUltimoContatoRelacionado: TGroupBox;
    mmoinformeultimocontato: TtecDBMemo;
    gbxParcelas: TGroupBox;
    dbgParcelas: TtecDBGrid;
    fraEndereco1: TfraEndereco;
    gbxCPFouCNPJ: TGroupBox;
    edtCPFCNPJ: TDBEdit;
    gbxDocIdentidade: TGroupBox;
    edtDocumento: TDBEdit;
    dtxTipoAvalista: TtecDBText;
    dtxNomeClienteouAvalista: TtecDBText;
    Panel1: TPanel;
    Splitter2: TSplitter;
    Panel2: TPanel;
    gbxFones: TGroupBox;
    gbxEmpresa: TGroupBox;
    edtFoneEmpresa: TDBEdit;
    edtEmpresa: TDBEdit;
    gbxConjuge: TGroupBox;
    edtnomeconjuge: TDBEdit;
    edtFoneConjuge: TDBEdit;
    gbxReferencia: TGroupBox;
    edtFoneReferencia2: TDBEdit;
    edtFonereferencia1: TDBEdit;
    gbxResidencia: TGroupBox;
    edtFoneResidencia1: TDBEdit;
    edtFoneResidencia2: TDBEdit;
    sbnAtendimento: TSpeedButton;
    sbnCadastroClientes: TSpeedButton;
    sbnFichaFinanceira: TSpeedButton;
    edtNumerodediasAtras: TEditNumero;
    Label2: TLabel;
    Label3: TLabel;
    edtNumerodediasAFrente: TEditNumero;
    pgcVendedores: TtecPageControl;
    tstVendedores: TTabSheet;
    fraSelecaoAleatoriausuariosVendedores: TfraSelecaoAleatoriausuarios;
    tstGruposdeVendedores: TTabSheet;
    fraSelecaoAleatoriaGrupoVendedores: TfraSelecaoAleatoriagruposusuarios;
    pgcAntendentes: TtecPageControl;
    TabSheet1: TTabSheet;
    fraSelecaoAleatoriausuariosCobradores: TfraSelecaoAleatoriausuarios;
    TabSheet2: TTabSheet;
    fraSelecaoAleatoriaGrupoCobradores: TfraSelecaoAleatoriagruposusuarios;
    sbnContrato: TSpeedButton;
    sbnOrcamento: TSpeedButton;
    fraListatiposatendimentos1: TfraListatiposatendimentos;
    procedure actHabilitarUpdate(Sender: TObject);
    procedure dbgLigarClientesDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure pgcFilialGrupoFilialChange(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnProcurarAgentesClick(Sender: TObject);
    procedure sbnProcurarCobradorClick(Sender: TObject);
    procedure sbnProcurarConceitosClick(Sender: TObject);
    procedure sbnProcurarFilialClick(Sender: TObject);
    procedure sbnProcurarGrupoFilialClick(Sender: TObject);
    procedure sbnProcurarRegiaoClick(Sender: TObject);
    procedure dbgLigarClientesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ckbAtrasoClick(Sender: TObject);
    procedure dbgLigarClientesAvisosDblClick(Sender: TObject);
    procedure ckbAvisosClick(Sender: TObject);
    procedure sbnAbrirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgLigarClientesLembreteDblClick(Sender: TObject);
    procedure dbgLigarClientesLembreteDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure sbnConsultaVendasClick(Sender: TObject);
    procedure sbnAtendimentoClick(Sender: TObject);
    procedure sbnCadastroClientesClick(Sender: TObject);
    procedure sbnFichaFinanceiraClick(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure edtNumerodediasAtrasExit(Sender: TObject);
    procedure edtInicioLembrarExit(Sender: TObject);
    procedure edtNumerodediasAFrenteExit(Sender: TObject);
    procedure edtFinalLembrarExit(Sender: TObject);
    procedure sbnContratoClick(Sender: TObject);
    procedure sbnOrcamentoClick(Sender: TObject);
  protected
    vContinuarAposEnter : boolean;
    dtmLigarClientes: TdtmLigarClientes;
    procedure AtribuirDatas;
    procedure AtualizarValores;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  InternoPesquisar(Titulo: string): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean; Override;
    function  TabelaDePesquisa: TZdataSet; override;
    function  ValidarCamposSelecao: Boolean;
    procedure OnClosefmligarclientesdadosclientes;
  public
    Iniciando : boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmLigarClientes: TfrmLigarClientes;
  TipoPesquisa: TtecLigarClientes;

implementation

uses frselecaoaleatoria;

{
uses
  fmligarclientesdadoscliente;
  }

{$R *.dfm}

{ TfrmLigarClentes }

procedure TfrmLigarClientes.actHabilitarUpdate(Sender: TObject);
begin
  inherited;
  sbnGerar.Enabled         := pgcLigarClientes.ActivePage = tstParametros;
//  gbxCobrador.Enabled      := (rgpTipoSelecao.ItemIndex = 1);
  gbxLembrar.Enabled       := (rgpTipoSelecao.ItemIndex = 1);
  gbxVenda.Enabled         := (rgpTipoSelecao.ItemIndex = 0);
  lblFaturamento.Enabled   := (rgpTipoSelecao.ItemIndex = 0);

  rgpComOcorrencia.Enabled := (rgpTipoSelecao.ItemIndex = 0) or
                              (rgpTipoSelecao.ItemIndex = 1);

  rgpParcelas.Enabled      := (rgpTipoSelecao.ItemIndex = 0);
  rgpPosOcorrencias.Enabled   := (rgpTipoSelecao.ItemIndex = 1);
  gbxPeriodoVencimento.Enabled := ((rgptiposelecao.ItemIndex = 0) and
                                   (rgpParcelas.ItemIndex <> 0)) or
                                   (rgptiposelecao.ItemIndex = 1);
  if (rgpTipoSelecao.ItemIndex = 0) then
       gbxPeriodoVencimento.Caption:= 'VENCIMENTOS DAS PARCELAS'
  else if (rgpTipoSelecao.ItemIndex = 1) then
       gbxPeriodoVencimento.Caption:= 'DATAS DOS ATENDIMENTOS';
  if not ParSistema.ControleSPCCentralizado then
   pgcFilialGrupoFilial.Enabled := (rgpTipoSelecao.ItemIndex <> 2);


  sbnContrato.enabled := (dtmLigarClientes.dsrligarClientes.DataSet.recordcount <>0)
                        and (dtmLigarClientes.dsrligarClientes.DataSet.FindField('contrato')<>nil)
                        and not dtmLigarClientes.dsrligarClientes.DataSet.FieldByName('contrato').isnull;

  sbnOrcamento.enabled := (dtmLigarClientes.dsrligarClientes.DataSet.recordcount <>0)
                        and (dtmLigarClientes.dsrligarClientes.DataSet.FindField('orcamento')<>nil)
                        and not dtmLigarClientes.dsrligarClientes.DataSet.FieldByName('orcamento').isnull;

 fraListatiposatendimentos1.visible := (rgpTipoSelecao.itemindex = 1); 





   
end;

procedure TfrmLigarClientes.AtribuirDatas;
var
  Dia, Mes, Ano: word;
begin
  with dtmLigarClientes do
  begin
    if rgpTipoSelecao.ItemIndex = 0 then
    begin
      if not iniciando and (edtVenctoInicial.text = '') then
          edtVenctoInicial.Text:= DateToStr(DataServidor - 37);

      if not iniciando and (edtVenctoFinal.text = '') then
        edtVenctoFinal.Text  := DateToStr(DataServidor - 30);

      DecodeDate(DataServidor,Ano,Mes,Dia);
      Dec(Ano);

      if not iniciando and (edtVenda.text = '') then
        edtVenda.Text:= DateToStr(EncodeDate(Ano,01,01));

      if not iniciando then
      begin
        edtInicioLembrar.Clear;
        edtFinalLembrar.Clear;
//        edfCobrador.Clear;
//        dtxCobrador.DataSource.DataSet.FindField('nome').Clear;
      end;
    end
    else
    begin
      if not iniciando and (edtVenctoInicial.Text = '') then
        edtVenctoInicial.Text:= DateToStr(DataServidor - 30);

      if not iniciando and (edtVenctoFinal.Text = '') then
        edtVenctoFinal.Text  := DateToStr(DataServidor);

      if not iniciando and (edtInicioLembrar.Text = '') then
        edtInicioLembrar.Text:= DateToStr(DataServidor);

      if not iniciando and (edtFinalLembrar.Text = '') then
        edtFinalLembrar.Text := DateToStr(DataServidor);

      if not iniciando then
        edtVenda.Clear;
    end;
  end;
end;

procedure TfrmLigarClientes.AtualizarValores;
begin
  with dtmLigarClientes do begin
    edtRegistros.Text := Format('%6.6d',[QtdeRegistros]);
    edtValores.Text   := Format('%8.2m',[TotalRegistros]);
  end;
end;

procedure TfrmLigarClientes.ckbAtrasoClick(Sender: TObject);
begin
  inherited;
  AtribuirDatas;
end;

constructor TfrmLigarClientes.Create(AOwner: TComponent);
begin
  dtmLigarClientes:= TdtmLigarClientes.Create(Self);
  inherited;
  dtmLigarClientes.Abre(ctTabelas);
  AtribuirDatas;
  pgcLigarClientes.ActivePageIndex := 0;
  rgpTipoSelecao.setfocus;
  iniciando := false;
  dtpHoraInicial.Time := strtotime('00:00');

  edtNumerodediasAtrasExit(nil);
  edtNumerodediasAFrenteExit(nil);

//  ckbAtraso.SetFocus;
end;

procedure TfrmLigarClientes.dbgLigarClientesDblClick(Sender: TObject);
begin
  inherited;
  if dbgLigarClientes.Focused and (dbgLigarClientes.DataSource.DataSet.RecNo > 0) then
    dtmLigarClientes.ComContato:= not dtmLigarClientes.ComContato;
end;

procedure TfrmLigarClientes.dbgLigarClientesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if not (gdFocused in State) then begin
    if dtmLigarClientes.ComContato then begin
       TDBGrid(Sender).Canvas.Brush.Color := $5555FF;
       TDBGrid(Sender).Canvas.Font.Color := clBlack;
    end;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

destructor TfrmLigarClientes.Destroy;
begin
  dtmLigarClientes:=nil;
  inherited;
  frmLigarClientes:= nil;
end;

function TfrmLigarClientes.ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean;
begin
  with dtmLigarClientes do
    case TipoPesquisa of
           tlcFILIAIS: Result:= ExisteFiliais(NomeCampo, Value);
     tlcGRUPOSFILIAIS: Result:= ExisteGruposFiliais(NomeCampo, Value);
        tlcCOBRADORES: Result:= ExisteCobradores(NomeCampo, Value);
           tlcAGENTES: Result:= ExisteAgentes(NomeCampo, Value);
         tlcCONCEITOS: Result:= ExisteConceitos(NomeCampo, Value);
           tlcREGIOES: Result:= ExisteRegioes(NomeCampo, Value);
      else             Result:= False
    end;
end;

procedure TfrmLigarClientes.FormActivate(Sender: TObject);
begin
  inherited;
  if pgcLigarClientes.ActivePage = tstRegistrosSelecionados then
  begin
   if pgcTipoControle.ActivePage = tstAtraso then
     dbgLigarClientes.SetFocus
   else
   if pgcTipoControle.ActivePage = tstLembretes then
     dbgLigarClientesLembrete.SetFocus
   else
     dbgLigarClientesAvisos.SetFocus;
  end
  else begin
    if pgcFilialGrupoFilial.ActivePage = tstFilial then
         ActiveControl:= edfFilial
    else ActiveControl:= edfGrupoFilial;
  end;
end;

function TfrmLigarClientes.InternoPesquisar(Titulo: string): Integer;
begin
  Result := mrNone;
  if ActiveControl is TtecFindCustom then begin
    if CtrlOn then begin
      if ActiveControl = edfFilial then begin
        TipoPesquisa := tlcFILIAIS;
        Titulo       := 'Filiais';
      end
      else if ActiveControl = edfGrupoFilial then begin
        TipoPesquisa := tlcGRUPOSFILIAIS;
        Titulo       := 'Grupo Filiais';
      end
      {
      else if ActiveControl = edfCobrador then begin
        TipoPesquisa := tlcCOBRADORES;
        Titulo       := 'Cobradores';
      end
      }
      else if ActiveControl = edfAgentes then begin
        TipoPesquisa := tlcAGENTES;
        Titulo       := 'Agentes';
      end
      else if ActiveControl = edfConceitos then begin
        TipoPesquisa := tlcCONCEITOS;
        Titulo       := 'Conceitos';
      end
      else if ActiveControl = edfRegiao then begin
        TipoPesquisa := tlcREGIOES;
        Titulo       := 'Regiões';
      end;

      with dtmLigarClientes do begin
        AbreTabelaPesquisa(TipoPesquisa);
        Result:= inherited InternoPesquisar(Titulo);
        if Result = mrOK then
          Selecionar(TipoPesquisa);
        FechaTabelaPesquisa(TipoPesquisa);
      end;
    end;
  end;
end;

function TfrmLigarClientes.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

procedure TfrmLigarClientes.KeyDown(var Key: Word; Shift: TShiftState);
{
  var
    vContinuarAposEnter : boolean;
    }

begin
  case Key of
    VK_F6    : if sbnGerar.Enabled then sbnGerar.Click;
    VK_F8    : if sbnAtendimento.enabled then sbnAtendimento.Click;
    VK_F10   : begin key:=0; if sbnCadastroClientes.enabled then sbnCadastroClientes.click; end;
    VK_F9   : begin key:=0; if sbnContrato.enabled then sbnContrato.click; end;
    VK_F11   : if sbnFichaFinanceira.enabled then sbnFichaFinanceira.Click;
    VK_F12   : begin key:=0; if sbnOrcamento.enabled then sbnOrcamento.click; end;
    VK_SPACE : if (Shift = [ssCtrl]) then
               begin
                 case rgpTipoSelecao.ItemIndex of
                 0: dbgLigarClientesDblClick(dbgLigarClientes);
                 1: dbgLigarClientesLembreteDblClick(dbgLigarClienteslembrete);
                 2: dbgLigarClientesAvisosDblClick(dbgLigarClientesAvisos);
                 end;
               end;
    (*
    VK_Return : if (dbgLigarClientes.Focused) or
                   (dbgLigarClientesLembrete.Focused) or
                   (dbgLigarClientesAvisos.Focused) then
                begin
                  vContinuarAposEnter := false;
                  if dbgLigarClientes.Focused and dtmLigarClientes.qryLigarClientesnaoligar.AsBoolean then
                    vContinuarAposEnter := MensagemSimNaoOpcaoCancelarmmo('O cliente esta marcado para não ligar.','',true,'  Sim  ','  Não  ',dtmLigarClientes.qryLigarClientesrazaonaoligar.AsString) = mrYes
                  else
                  if dbgLigarClientesLembrete.Focused and dtmLigarClientes.qryLigarClientesLembretesnaoligar.AsBoolean then
                    vContinuarAposEnter := MensagemSimNaoOpcaoCancelarmmo('O cliente esta marcado para não ligar.','',true,'  Sim  ','  Não  ',dtmLigarClientes.qryLigarClientesLembretesrazaonaoligar.AsString) = mrYes
                  else
                  if dbgLigarClientesAvisos.Focused and dtmLigarClientes.qryLigarClientesAvisosnaoligar.AsBoolean then
                    vContinuarAposEnter := MensagemSimNaoOpcaoCancelarmmo('O cliente esta marcado para não ligar.','',true,'  Sim  ','  Não  ',dtmLigarClientes.qryLigarClientesAvisosrazaonaoligar.AsString) = mrYes
                  else
                    vContinuarAposEnter := true;

                  {
                  if vContinuarAposEnter then
                  begin
                    if not Assigned(frmLigarClientesDadosCliente) then
                      frmLigarClientesDadosCliente := TfrmLigarClientesDadosCliente.Create(Self);
                    frmLigarClientesDadosCliente.SetDataModulo(dtmLigarClientes);
                    dtmLigarClientes.InformacoesCliente;
                    frmLigarClientesDadosCliente.OntecClose := OnClosefmligarclientesdadosclientes;
                    frmLigarClientesDadosCliente.Show;
                    frmLigarClientesDadosCliente.dbgParcelas.SetFocus;
                    Key:= MAXWORD;
                  end;
                  }

                end;
      *)
  end;
  inherited;
end;

procedure TfrmLigarClientes.pgcFilialGrupoFilialChange(Sender: TObject);
begin
  inherited;
  if pgcFilialGrupoFilial.ActivePage = tstFilial then begin
    edfGrupoFilial.Clear;
    dtxGrupoFilial.DataSource.DataSet.FindField('descricao').Clear;
  end
  else begin
    edfFilial.Clear;
    dtxFilial.DataSource.DataSet.FindField('nome').Clear;
  end;
end;

procedure TfrmLigarClientes.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if ValidarCamposSelecao then
  begin

    gbxUltimoContatoRelacionado.visible := true;
    mmoinformeultimocontato.DataField := '';
    gbxUltimoContatoRelacionado.width := 331;
    gbxUltimoContatoRelacionado.align := alClient;

    gbxUltimoAtendimentoReclamacao.Align := alLeft;
    gbxUltimoAtendimentoReclamacao.width := 241;
    SplitterUltimoAtendimentoReclamacao.visible := true;
    SplitterUltimoAtendimentoReclamacao.left := gbxUltimoAtendimentoReclamacao.left + gbxUltimoAtendimentoReclamacao.width;

    gbxUltimoAtendimentoCobranca.align := alLeft;
    gbxUltimoAtendimentoCobranca.width := 222;
    SplitterUltimoAtendimentoCobranca.left := gbxUltimoAtendimentoCobranca.left + gbxUltimoAtendimentoCobranca.width;


    with dtmLigarClientes do
    begin
      TipoSelecao   := rgpTipoSelecao.ItemIndex;
      Filial        := edfFilial.Text;
      Grupo         := edfGrupoFilial.Text;

{      Cobrador      := edfCobrador.Text;}
      Cobradores := fraSelecaoAleatoriausuariosCobradores.ListaCondicional;
      GrupoCobradores := fraSelecaoAleatoriaGrupoCobradores.ListaCondicional;

      Vendedores := fraSelecaoAleatoriausuariosVendedores.ListaCondicional;
      GrupoVendedores := fraSelecaoAleatoriaGrupoVendedores.ListaCondicional;


      Agente        := edfAgentes.Text;
      Conceito      := edfConceitos.Text;
      Regiao        := edfRegiao.Text;
      VenctoInicial := edtVenctoInicial.Text;
      VenctoFinal   := edtVenctoFinal.Text;
      Venda         := edtVenda.Text;
      Pagamento     := rgpParcelas.ItemIndex;
      Ocorrencia    := rgpComOcorrencia.ItemIndex;
      Marcadosparanaoligar := rgpMarcadosparanaoligar.ItemIndex;
      Telefone      := rgpSemTelefone.ItemIndex;
      ComSemCobrador:= rgpComCobrador.ItemIndex;
      LembrarInicial:= edtInicioLembrar.Text;
      LembrarFinal  := edtFinalLembrar.Text;
      LembrarHoraInicial := timetostr(dtpHoraInicial.time);

      PosOcorrencia := rgpPosOcorrencias.ItemIndex;

      TodosListaTiposAtendimentosMarcados := fraListatiposatendimentos1.TodosMarcados;
      ListaTiposAtendimentos := fraListatiposatendimentos1.ListaSelecionada;

      Ordenacao     := rgpOrdenacao.ItemIndex;

      if not SelecionarclientesLigar then
      begin
        pgcLigarClientes.ActivePage:= tstRegistrosSelecionados;
        case rgpTipoSelecao.ItemIndex of
         0 : pgcTipoControle.ActivePage := tstAtraso;
         1 : pgcTipoControle.ActivePage := tstLembretes;
         2 : pgcTipoControle.ActivePage := tstAvisos;
        end;
        AtualizarValores;
      end
      else begin
             MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
             case rgpTipoSelecao.ItemIndex of
             0,1 : begin
                     if pgcFilialGrupoFilial.ActivePage = tstFilial then
                          edfFilial.SetFocus
                     else edfGrupoFilial.SetFocus;
                   end;
             end;
           end;

      if ckbLembrete.checked then
      begin
        gbxUltimoContatoRelacionado.visible := true;
        mmoinformeultimocontato.DataField := 'informeultimocontato';
        gbxUltimoContatoRelacionado.width := 331;
        gbxUltimoContatoRelacionado.align := alClient;

        gbxUltimoAtendimentoReclamacao.Align := alLeft;
        gbxUltimoAtendimentoReclamacao.width := 241;
        SplitterUltimoAtendimentoReclamacao.visible := true;
        SplitterUltimoAtendimentoReclamacao.left := gbxUltimoAtendimentoReclamacao.left + gbxUltimoAtendimentoReclamacao.width;

        gbxUltimoAtendimentoCobranca.align := alLeft;
        gbxUltimoAtendimentoCobranca.width := 222;
        SplitterUltimoAtendimentoCobranca.left := gbxUltimoAtendimentoCobranca.left + gbxUltimoAtendimentoCobranca.width;
      end
      else
      begin
        gbxUltimoContatoRelacionado.visible := false;
        mmoinformeultimocontato.DataField := '';

        gbxUltimoAtendimentoCobranca.align := alLeft;
        gbxUltimoAtendimentoCobranca.width := 413;
        SplitterUltimoAtendimentoCobranca.left := gbxUltimoAtendimentoCobranca.left + gbxUltimoAtendimentoCobranca.width;

        SplitterUltimoAtendimentoReclamacao.visible := false;
        gbxUltimoAtendimentoReclamacao.width := 241;
        gbxUltimoAtendimentoReclamacao.Align := alClient;

      end;

    end;
  end;
end;

procedure TfrmLigarClientes.sbnProcurarAgentesClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfAgentes.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmLigarClientes.sbnProcurarCobradorClick(Sender: TObject);
begin
  inherited;
  {
  CtrlOn:= True;
  edfCobrador.SetFocus;
  InternoPesquisar('');
  }
end;

procedure TfrmLigarClientes.sbnProcurarConceitosClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfConceitos.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmLigarClientes.sbnProcurarFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfFilial.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmLigarClientes.sbnProcurarGrupoFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfGrupoFilial.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmLigarClientes.sbnProcurarRegiaoClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfRegiao.SetFocus;
  InternoPesquisar('');
end;

function TfrmLigarClientes.TabelaDePesquisa: TZdataSet;
begin
  with dtmLigarClientes do
    case TipoPesquisa of
             tlcFILIAIS: Result:= ConsultaFiliais;
       tlcGRUPOSFILIAIS: Result:= ConsultaGrupoSFiliais;
          tlcCOBRADORES: Result:= ConsultaCobradores;
             tlcAGENTES: Result:= ConsultaAgentes;
           tlcCONCEITOS: Result:= ConsultaConceitos;
             tlcREGIOES: Result:= ConsultaRegioes;
    else                 Result:= nil;
    end;
end;

function TfrmLigarClientes.ValidarCamposSelecao: Boolean;
begin
   Result:= edtVenctoInicial.DataValida and edtVenctoFinal.DataValida;
   if Result then
     Result := OperadorTernario((Trim(edfFilial.Text) <> ''),edfFilial.Exist, True)           and
               OperadorTernario((Trim(edfGrupoFilial.Text) <> ''),edfGrupoFilial.Exist, True) and
{               OperadorTernario((Trim(edfCobrador.Text) <> ''),edfCobrador.Exist, True)       and} 
               OperadorTernario((Trim(edfAgentes.Text) <> ''),edfAgentes.Exist, True)         and
               OperadorTernario((Trim(edfConceitos.Text) <> ''),edfConceitos.Exist, True)     and
               OperadorTernario((Trim(edfRegiao.Text) <> ''),edfRegiao.Exist, True);
end;


procedure TfrmLigarClientes.dbgLigarClientesAvisosDblClick(
  Sender: TObject);
begin
  inherited;
  if dbgLigarClientesAvisos.Focused and (dbgLigarClientesAvisos.DataSource.DataSet.RecNo > 0) then
    dtmLigarClientes.ComContato := not dtmLigarClientes.ComContato;
end;

procedure TfrmLigarClientes.ckbAvisosClick(Sender: TObject);
begin
  inherited;
  if not ParSistema.ControleSPCCentralizado then
  begin
    pgcFilialGrupoFilial.ActivePageIndex := 0;
    edfFilial.Text := inttostr(dtmLigarClientes.FilialBase);
    edfFilial.Exist;    
  end;
end;

procedure TfrmLigarClientes.OnClosefmligarclientesdadosclientes;
begin
 case rgpTipoSelecao.ItemIndex of
 0: dbgLigarClientes.SetFocus;
 1: dbgLigarClienteslembrete.SetFocus;
 2: dbgLigarClientesAvisos.SetFocus;
 end;
end;

procedure TfrmLigarClientes.sbnAbrirClick(Sender: TObject);
begin
  inherited;
  while not dtmLigarClientes.qryLigarClientes.Eof do
  begin
  {
    if dtmLigarClientes.Tipocliente =  'C' then
      TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmLigarClientes.CodigoCliente, ClassName, True], 'TfrmCadastroClientes', True)
    else
      TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmLigarClientes.CodigoCliente, ClassName, True], 'TfrmCadastroFornecedores', True);

    application.processmessages;

    TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmLigarClientes.CodigoCliente,
                                                                   dtmLigarClientes.TipoCliente,
                                                                   ClassName, True], 'TfrmFichaFinanceira', True);
    application.processmessages;
    }

    TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmLigarClientes.qryLigarClientescontrato.asstring,
                                                                   ClassName, True], 'TfrmCadastroContratos', True);
    application.processmessages;
    
    dtmLigarClientes.qryLigarClientes.next;
    
  end;
end;

procedure TfrmLigarClientes.FormShow(Sender: TObject);
begin
  inherited;
  pgcLigarClientes.TabIndex := 0;
  rgpTipoSelecao.setfocus;
  Iniciando := true;
//  ckbAtraso.SetFocus;
end;

procedure TfrmLigarClientes.dbgLigarClientesLembreteDblClick(
  Sender: TObject);
begin
  inherited;
  if dbgLigarClientesLembrete.Focused and (dbgLigarClientes.DataSource.DataSet.RecNo > 0) then
    dtmLigarClientes.ComContato:= not dtmLigarClientes.ComContato;

end;

procedure TfrmLigarClientes.dbgLigarClientesLembreteDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if not (gdFocused in State) then begin
    if dtmLigarClientes.ComContato then begin
       TDBGrid(Sender).Canvas.Brush.Color := $5555FF;
       TDBGrid(Sender).Canvas.Font.Color := clBlack;
    end;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

end;

procedure TfrmLigarClientes.sbnConsultaVendasClick(Sender: TObject);
begin
  inherited;
  IF dtmLigarClientes.dsrligarClientes.DataSet.fieldbyname('cliente').asinteger <> 0 then
    AcionarTelaConsultaVendas(dtmLigarClientes.dsrligarClientes.DataSet.fieldbyname('cliente').asinteger,
                              dtmLigarClientes.dsrligarClientes.DataSet.fieldbyname('clientetipo').asString);

end;

procedure TfrmLigarClientes.sbnAtendimentoClick(Sender: TObject);
begin
  inherited;

  if dtmLigarClientes.dsrligarClientes.DataSet.fieldbyname('cliente').asinteger <> 0 then
  begin

    vContinuarAposEnter := false;
    if (dbgLigarClientes.Focused) or
       (dbgLigarClientesLembrete.Focused) or
       (dbgLigarClientesAvisos.Focused) then
    begin
      if dbgLigarClientes.Focused and dtmLigarClientes.qryLigarClientesnaoligar.AsBoolean then
        vContinuarAposEnter := MensagemSimNaoOpcaoCancelarmmo('O cliente esta marcado para não ligar.','',true,'  Sim  ','  Não  ',dtmLigarClientes.qryLigarClientesrazaonaoligar.AsString) = mrYes
      else
      if dbgLigarClientesLembrete.Focused and dtmLigarClientes.qryLigarClientesLembretesnaoligar.AsBoolean then
        vContinuarAposEnter := MensagemSimNaoOpcaoCancelarmmo('O cliente esta marcado para não ligar.','',true,'  Sim  ','  Não  ',dtmLigarClientes.qryLigarClientesLembretesrazaonaoligar.AsString) = mrYes
      else
      if dbgLigarClientesAvisos.Focused and dtmLigarClientes.qryLigarClientesAvisosnaoligar.AsBoolean then
        vContinuarAposEnter := MensagemSimNaoOpcaoCancelarmmo('O cliente esta marcado para não ligar.','',true,'  Sim  ','  Não  ',dtmLigarClientes.qryLigarClientesAvisosrazaonaoligar.AsString) = mrYes
      else
        vContinuarAposEnter := true;
    end;

    if vContinuarAposEnter then
      case dtmLigarClientes.TipoSelecao of
        0 : TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado(['IncluirAtendimento',
                                                                       dtmLigarClientes.dsrligarClientes.DataSet.fieldbyname('cliente').asinteger,
                                                                       dtmLigarClientes.dsrligarClientes.DataSet.fieldbyname('clientetipo').asString,
                                                                       'C'   //cobrança
                                                                       ], 'TfrmCadastroAtendimento', True);

        1 : TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado(['IncluirFollowup',
                                                                       dtmLigarClientes.CodigoAtendimento
                                                                       ], 'TfrmCadastroAtendimento', True);


        2 : TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado(['IncluirAtendimentoAvisosCartas',
                                                                       dtmLigarClientes.dsrligarClientes.DataSet.fieldbyname('cliente').asinteger,
                                                                       dtmLigarClientes.dsrligarClientes.DataSet.fieldbyname('clientetipo').asString,
                                                                       'C',
                                                                       dtmLigarClientes.carta,
                                                                       dtmLigarClientes.CartaNumero,
                                                                       dtmLigarClientes.TipodeCarta,
                                                                       dtmLigarClientes.EmissaoCarta,
                                                                       dtmLigarClientes.StreAvalista,
                                                                       dtmLigarClientes.dataAtraso,
                                                                       dtmLigarClientes.ValorAtraso,
                                                                       dtmLigarClientes.tipoAtendimentoCarta,
                                                                       dtmLigarClientes.eAvalista
                                                                        ], 'TfrmCadastroAtendimento', True);
      end;
  end;

end;

procedure TfrmLigarClientes.sbnCadastroClientesClick(Sender: TObject);
begin
  inherited;
  if dtmLigarClientes.dsrligarClientes.DataSet.fieldbyname('cliente').asinteger <> 0 then
  begin
    if dtmLigarClientes.Tipocliente =  'C' then
      TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmLigarClientes.dsrligarClientes.DataSet.fieldbyname('cliente').asinteger], 'TfrmCadastroClientes', True)
    else
      TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmLigarClientes.dsrligarClientes.DataSet.fieldbyname('cliente').asinteger], 'TfrmCadastroFornecedores', True);
  end;
end;

procedure TfrmLigarClientes.sbnFichaFinanceiraClick(Sender: TObject);
begin
  inherited;
  if dtmLigarClientes.dsrligarClientes.DataSet.fieldbyname('cliente').asinteger <> 0 then
    TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmLigarClientes.dsrligarClientes.DataSet.fieldbyname('cliente').asinteger,
                                                                     dtmLigarClientes.dsrligarClientes.DataSet.fieldbyname('clientetipo').asString], 'TfrmFichaFinanceira', True)

end;

procedure TfrmLigarClientes.Panel1Resize(Sender: TObject);
begin
  inherited;
  gbxParcelas.Height := Panel1.height - gbxFones.height;
end;

procedure TfrmLigarClientes.edtNumerodediasAtrasExit(Sender: TObject);
begin
  inherited;
  if edtNumerodediasAtras.ValorSemFormatacao <> 0 then
  begin
    if edtFinalLembrar.Text<>'' then
      edtInicioLembrar.Text := {strtodate(edtFinalLembrar.Text)} Date() - edtNumerodediasAtras.ValorSemFormatacao
    else
    begin
      edtInicioLembrar.Text := datetostr((Date() - edtNumerodediasAtras.ValorSemFormatacao));
      edtFinalLembrar.Text := datetostr(Date());
    end;
  end;
end;

procedure TfrmLigarClientes.edtInicioLembrarExit(Sender: TObject);
begin
  inherited;
  if (edtInicioLembrar.Text <> '') {and
     (edtFinalLembrar.Text <> '')} then
  edtNumerodediasatras.Text := inttostr(DaysBetween(strtodatetime(edtInicioLembrar.Text), date(){strtodatetime(edtFinalLembrar.Text)}));

end;

procedure TfrmLigarClientes.edtNumerodediasAFrenteExit(Sender: TObject);
begin
  inherited;
  if edtNumerodediasAFrente.ValorSemFormatacao <> 0 then
  begin
    if edtInicioLembrar.Text<>'' then
      edtFinalLembrar.Text := {strtodate(edtFinalLembrar.Text)} Date() + edtNumerodediasAFrente.ValorSemFormatacao
    else
    begin
      edtFinalLembrar.Text := datetostr((Date() + edtNumerodediasAFrente.ValorSemFormatacao));
      edtInicioLembrar.Text := datetostr(Date());
    end;
  end;
end;

procedure TfrmLigarClientes.edtFinalLembrarExit(Sender: TObject);
begin
  inherited;
  if (edtFinalLembrar.Text <> '') {and
     (edtFinalLembrar.Text <> '')} then
  edtNumerodediasAfrente.Text := inttostr(DaysBetween(date(), strtodatetime(edtFinalLembrar.Text){strtodatetime(edtFinalLembrar.Text)}));

end;

procedure TfrmLigarClientes.sbnContratoClick(Sender: TObject);
begin
  inherited;

  if dtmLigarClientes.dsrligarClientes.DataSet.FindField('contrato')<>nil then
    if not dtmLigarClientes.dsrligarClientes.DataSet.FieldByName('contrato').isnull then
      if dtmLigarClientes.dsrligarClientes.DataSet.FieldByName('os').asBoolean then
        TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmLigarClientes.dsrligarClientes.DataSet.FieldByName('contrato').asstring], 'TfrmOrdemServico', True)
      else
        TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmLigarClientes.dsrligarClientes.DataSet.FieldByName('contrato').asstring], 'TfrmCadastroContratos', True)
end;

procedure TfrmLigarClientes.sbnOrcamentoClick(Sender: TObject);
begin
  inherited;
  if dtmLigarClientes.dsrligarClientes.DataSet.FindField('orcamento')<>nil then
    if not dtmLigarClientes.dsrligarClientes.DataSet.FieldByName('orcamento').isnull then
       TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado(['Open', dtmLigarClientes.dsrligarClientes.DataSet.FieldByName('orcamento').asstring], 'TfrmOrcamentos', True)
end;

end.

