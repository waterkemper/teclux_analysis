unit fmcadastrocontratosmanutencao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmcadastropadrao, ComCtrls, Buttons, ToolWin, ExtCtrls,
  dmcadastrocontratosmanutencao, StdCtrls, Mask, cpdbfindcontrols,
  frconsulta, frconsultacodigo, cpnumero, ctconstantes, cpdbdata, DBCtrls,
  cpdbmemo, Grids, DBGrids, cpdbgrid, fmConsultaBasica, biblio, ActnList,
  cppagecontrol, cpdbradiogroup, DBMaplistCombobox, cptexto, DB, ZQuery,
  ZPgSqlQuery, cpquery, cpdbtext, fmPrincipalBasico;

type
  TfrmCadastroContratosManutencao = class(TFrmCadastroPadrao)
    edfNumeroContrato: TtecDbEditFind;
    gbxNumero: TGroupBox;
    fraConsultaCliente: TfraConsultaCodigo;
    gbxConsultaCliente: TGroupBox;
    gbxObservacoes: TGroupBox;
    mmoObservacoesMontagem: TtecDBMemo;
    gbxServicosContratosManutencao: TGroupBox;
    dbgServicos: TtecDBGrid;
    pnlBotoesProdutosContratos: TPanel;
    sbnIncluirServico: TSpeedButton;
    sbnExcluirServico: TSpeedButton;
    edtValorTotal: TDBEditNumero;
    dbMapFormaContrato: TDBMaplistCombobox;
    gbxDatasFormatoContrato: TPanel;
    pnlBottom: TPanel;
    gbxEquipamento: TGroupBox;
    fraConsultaEquipamento: TfraConsultaCodigo;
    sbnImprimirContrato: TSpeedButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
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
    Label1: TLabel;
    gbxVendedor: TGroupBox;
    fraConsultaVendedor: TfraConsultaCodigo;
    pgcDetalhes: TtecPageControl;
    tstLocacao: TTabSheet;
    tstSituacaoFinanceira: TTabSheet;
    lblValorTotal: TLabel;
    dbgContratosSelecionados: TtecDBGrid;
    Timer1: TTimer;
    sbnContrato: TSpeedButton;
    lblSituacaoContrato: TLabel;
    dtxNomeSituacao: TtecDBText;
    dtxMotivoCancelamento: TtecDBText;
    gbxDatadaAssinatura: TGroupBox;
    edtDataAssinatura: TDBEditData;
    gbxVigencia: TGroupBox;
    edtVigencia: TDBEditData;
    GroupBox2: TGroupBox;
    edtConclusao: TDBEditData;
    gbxCancelamento: TGroupBox;
    edtDataCancelamento: TDBEditData;
    gbxDiaVencimento: TGroupBox;
    edtDiasAtraso: TDBEditNumero;
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
    gbxFormatoContrato_: TGroupBox;
    sbnAlterarSituacao: TSpeedButton;
    gbxDataAbertura: TGroupBox;
    edtAbertura: TDBEditData;
    pnlTop: TPanel;
    pgcCancelamento: TtecPageControl;
    tstCodigoMotivoCancelamento: TTabSheet;
    tstDescricaoCancelamento: TTabSheet;
    mmoDescricaoCancelamento: TtecDBMemo;
    procedure sbnProcurarClick(Sender: TObject);
    procedure dbgServicosDblClick(Sender: TObject);
    procedure sbnIncluirServicoClick(Sender: TObject);
    procedure dbgServicosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnExcluirServicoClick(Sender: TObject);
    procedure dbMapFormaContratoChange(Sender: TObject);
    procedure DBMformadoaluguelChange(Sender: TObject);
    procedure edtdiaslocadosEnter(Sender: TObject);
    procedure sbnImprimirContratoClick(Sender: TObject);
    procedure edfNumeroContratoFound(Found: Boolean);
    procedure pgcDetalhesChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure sbnContratoClick(Sender: TObject);
    procedure sbnAlterarSituacaoClick(Sender: TObject);
    procedure pgcDetalhesChange(Sender: TObject);
    procedure edtvalorcaucaoExit(Sender: TObject);
  private
    { Private declarations }
    procedure AssinarContrato;
    procedure FecharContrato;
  protected
    ConsultaContratoManutencao : TfraConsultaCodigo;
    ConsultaServicos : TfraConsultaCodigo;

    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoIncluir: Boolean; override;
    function InternoCancelar: Boolean; override;
    procedure AlterarEstadoBotoes; override;
    procedure AtribuirDadosServicos(Found: Boolean);
//    procedure AtribuirDadosCliente;
    procedure AbrirContrato(Found: Boolean);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure CondicaoConsultaServicos;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure OperacaoPadrao(Value: Array of Variant); override;

  end;

var
  frmCadastroContratosManutencao: TfrmCadastroContratosManutencao;

implementation


{$R *.dfm}

{ TfrmCadastroContratosManutencao }

constructor TfrmCadastroContratosManutencao.Create(AOwner: TComponent);
begin
  dtmCadastroContratosManutencao := TdtmCadastroContratosManutencao.Create(self);
  inherited;

  dataset := dtmCadastroContratosManutencao.qryContratosManutencao;

  ConsultaContratoManutencao := TfraConsultaCodigo.Create(self);
  ConsultaContratoManutencao.Name := 'fraConsultaContratoManutencao';
  ConsultaContratoManutencao.edfCodigo.DataSource := dtmCadastroContratosManutencao.dsrContratosManutencao;
  ConsultaContratoManutencao.edfCodigo.DataField := 'numero';
  ConsultaContratoManutencao.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaContratoManutencao.AbrirTabelaProcura := false;
  ConsultaContratoManutencao.TipoCliente := 'C';
  ConsultaContratoManutencao.Tipovfornecedor := 'C';
  ConsultaContratoManutencao.TipoPesquisa := pesCONTRATOSMANUTENCAO;
  ConsultaContratoManutencao.OnFound := AbrirContrato;
  ConsultaContratoManutencao.CtrlOn := False;


  ConsultaServicos := TfraConsultaCodigo.Create(self);
  ConsultaServicos.Name := 'fraConsultaServicos';
  ConsultaServicos.edfCodigo.DataSource := dtmCadastroContratosManutencao.dsrServicosContratosManutencao;
  ConsultaServicos.edfCodigo.DataField := 'servico';
  ConsultaServicos.edfCodigo.LookupSource := ConsultaServicos.dsrProcuraServicos;
  ConsultaServicos.edfCodigo.LookupField := 'codigo';
  ConsultaServicos.edfCodigo.LookupQueryParameter := 'codigo';
  ConsultaServicos.AbrirTabelaProcura := false;
  ConsultaServicos.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaServicos.TipoPesquisa := pesSERVICOS;
  ConsultaServicos.CondicoesdaConsulta := CondicaoConsultaServicos;
  ConsultaServicos.edfCodigo.NaoExecutarLookupFound := true;

  ConsultaServicos.OnFound := AtribuirDadosServicos;
  ConsultaServicos.CtrlOn := True;

  fraConsultaCliente.TipoCliente := 'C';
  fraConsultaCliente.TipoPesquisa := pesCLIENTES;

//  fraConsultaCliente.OnFound := AtribuirDadosCliente;

  dtmCadastroContratosManutencao.dbMapFormaContratoChange := dbMapFormaContratoChange;

  fraConsultaEquipamento.TipoPesquisa := pesEQUIPAMENTO;
  fraConsultaVendedor.TipoPesquisa := pesVENDEDORES;

//  edtValorTotal.Alignment := taRightJustify;
  self.activecontrol := edfNumeroContrato;

  edfNumeroContrato.height := 30;

end;

destructor TfrmCadastroContratosManutencao.Destroy;
begin
  inherited;
  frmCadastroContratosManutencao := nil;
end;

function TfrmCadastroContratosManutencao.InternoExcluir: Boolean;
begin
  dtmCadastroContratosManutencao.ExcluirContrato;
  pgcDetalhes.ActivePage := tstLocacao;
  pgcDetalhesChange(nil);
end;

function TfrmCadastroContratosManutencao.InternoGravar: Boolean;
begin
  Result := inherited InternoGravar;
  if result then
    dtmCadastroContratosManutencao.GravarContrato;

  pgcDetalhes.ActivePage := tstLocacao;
  pgcDetalhesChange(nil);

end;

function TfrmCadastroContratosManutencao.InternoIncluir: Boolean;
begin
  Result := inherited InternoIncluir;
  if CtrlOn then
  begin
    if dbgServicos.Focused then
      Result := dtmCadastroContratosManutencao.IncluirEditarServicosContrato(False)
  end
  else
  begin
    Result := dtmCadastroContratosManutencao.IncluirContrato;
    if Result then
    begin
      fraConsultaVendedor.edfCodigo.SetFocus;

      dbMapFormaContratoChange(nil);
      pgcDetalhes.ActivePage := tstLocacao;
      pgcDetalhesChange(nil);
    end;
  end;
end;


procedure TfrmCadastroContratosManutencao.sbnProcurarClick(
  Sender: TObject);
begin
  inherited;
  if not CtrlOn then
  begin
    if ConsultaContratoManutencao.InternoPesquisar('Contratos de Manutenção') = mrOk then
    begin
      if edfNumeroContrato.canfocus then
        edfNumeroContrato.SetFocus;

      pgcDetalhes.ActivePage := tstLocacao;
      pgcDetalhesChange(nil);

    end;
  end;
end;

procedure TfrmCadastroContratosManutencao.dbgServicosDblClick(
  Sender: TObject);
begin
  inherited;
  if (dbgServicos.SelectedField = dtmCadastroContratosManutencao.qryServicosContratosManutencaoservico) or
     (dbgServicos.SelectedField = dtmCadastroContratosManutencao.qryServicosContratosManutencaodescricaoservico) then
    ConsultaServicos.InternoPesquisar('SERVIÇOS')
  else
    dtmCadastroContratosManutencao.IncluirEditarServicosContrato(true);
end;

procedure TfrmCadastroContratosManutencao.sbnIncluirServicoClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroContratosManutencao.IncluirEditarServicosContrato(false);
end;

procedure TfrmCadastroContratosManutencao.dbgServicosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (dbgServicos.SelectedField = dtmCadastroContratosManutencao.qryServicosContratosManutencaoservico) or
     (dbgServicos.SelectedField = dtmCadastroContratosManutencao.qryServicosContratosManutencaodescricaoservico) then
  begin
    if (key = VK_F9) and
       CtrlOn then
    begin
      ConsultaServicos.InternoPesquisar('SERVIÇOS');
      dbgServicos.SetFocus;
    end
    else
    if key = VK_return then
    begin
      if ConsultaServicos.edfCodigo.Exist then
        AtribuirDadosServicos(true)
    end;
  end;
end;

procedure TfrmCadastroContratosManutencao.sbnExcluirServicoClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroContratosManutencao.ExcluirServicosContrato;
end;

procedure TfrmCadastroContratosManutencao.AtribuirDadosServicos(Found: Boolean);
begin
  dtmCadastroContratosManutencao.qryServicosContratosManutencao.edit;
  dtmCadastroContratosManutencao.qryServicosContratosManutencaodescricaoservico.AsString :=
    ConsultaServicos.qryProcuraServicos.fieldbyname('descricao').AsString;

  dtmCadastroContratosManutencao.qryServicosContratosManutencaovalor.AsCurrency :=
    ConsultaServicos.qryProcuraServicos.fieldbyname('valor').AsCurrency;

  if (dtmCadastroContratosManutencao.qryServicosContratosManutencao.state in [dsedit, dsinsert]) then
    dtmCadastroContratosManutencao.qryServicosContratosManutencao.post;

end;

procedure TfrmCadastroContratosManutencao.AbrirContrato(Found: Boolean);
begin
  edfNumeroContrato.text := ConsultaContratoManutencao.qryProcuraContratoManutencaonumero.AsString;
  edfNumeroContrato.Exist;
end;

procedure TfrmCadastroContratosManutencao.dbMapFormaContratoChange(
  Sender: TObject);
begin
  inherited;
  case dbMapFormaContrato.datasource.dataset.fieldbyname('formacontrato').asinteger of
  0 : begin
        gbxPainelLocacao.visible := false;
        gbxVigencia.visible := true;
        gbxDiaVencimento.visible := true;
        gbxEquipamento.visible := false;
      end;
  1 : begin
        gbxPainelLocacao.visible := true;
        gbxVigencia.visible := false;
        gbxDiaVencimento.visible := false;
        gbxEquipamento.visible := True;
      end;
  end;
end;

procedure TfrmCadastroContratosManutencao.DBMformadoaluguelChange(
  Sender: TObject);
begin
  inherited;
  {
  if DBMformadoaluguel.datasource.dataset.fieldbyname('formadoaluguel').asString = 'D' then
  begin
    edtdiaslocados.enabled := true;
    edtdiaslocados.tabstop := true;

  end
  else
  if DBMformadoaluguel.datasource.dataset.fieldbyname('formadoaluguel').asString = 'M' then
  begin
    edtdiaslocados.enabled := false;
    edtdiaslocados.tabstop := false;
  end;
  }
end;

procedure TfrmCadastroContratosManutencao.edtdiaslocadosEnter(
  Sender: TObject);
begin
  inherited;
  {
  if DBMformadoaluguel.datasource.dataset.fieldbyname('formadoaluguel').asString = 'M' then
    edtDataEntrega.setfocus;
    }
end;

procedure TfrmCadastroContratosManutencao.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = vk_F9) and not (ssCtrl in shift) then
    sbnProcurarClick(nil)
  else
  if (key = vk_F7) and not (ssCtrl in shift) then
  begin
    if sbnImprimirContrato.enabled then
      sbnImprimirContratoClick(nil)
  end;
end;

procedure TfrmCadastroContratosManutencao.sbnImprimirContratoClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroContratosManutencao.ImprimirContrato;
end;

procedure TfrmCadastroContratosManutencao.CondicaoConsultaServicos;
begin
  dtmCadastroContratosManutencao.ListaServicosIncluidos;

  ConsultaServicos.qryProcuraServicos.MacroByName('Condicao').asString :=
    'and s.codigo not in ('+dtmCadastroContratosManutencao.fListaServicosIncluidos+')';

  ConsultaServicos.qryConsultaServicos.MacroByName('Condicao').asString :=
    'and s.codigo not in ('+dtmCadastroContratosManutencao.fListaServicosIncluidos+')'
end;

procedure TfrmCadastroContratosManutencao.edfNumeroContratoFound(
  Found: Boolean);
begin
  inherited;
  if found then
  begin
    pgcDetalhes.ActivePage := tstLocacao;
    pgcDetalhesChange(nil);
  end;
end;

procedure TfrmCadastroContratosManutencao.pgcDetalhesChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  inherited;
  if pgcDetalhes.ActivePage = tstLocacao then
    AllowChange := dtmCadastroContratosManutencao.GravarContrato(false);
end;

function TfrmCadastroContratosManutencao.InternoCancelar: Boolean;
begin
  Result := inherited InternoCancelar;
  if result then
    dtmCadastroContratosManutencao.Cancelar;

  pgcDetalhes.ActivePage := tstLocacao;
  pgcDetalhesChange(nil);

  AlterarEstadoBotoes;
end;  

procedure TfrmCadastroContratosManutencao.Timer1Timer(Sender: TObject);
begin
  inherited;

  sbnIncluirServico.Enabled := not dtmCadastroContratosManutencao.qryContratosManutencao.IsEmpty and
                               not dtmCadastroContratosManutencao.qryServicosContratosManutencao.readonly;

  sbnExcluirServico.Enabled := not dtmCadastroContratosManutencao.qryServicosContratosManutencao.IsEmpty and
                               not dtmCadastroContratosManutencao.qryServicosContratosManutencao.readonly;


  sbnImprimirContrato.enabled := (dtmCadastroContratosManutencao.qryContratosManutencao.recordcount <> 0)
                                 and not (dtmCadastroContratosManutencao.qryContratosManutencao.state in [dsedit, dsinsert])
                                 and ((dtmCadastroContratosManutencao.qryContratosManutencaosituacao.asString = 'A') or
                                      (dtmCadastroContratosManutencao.qryContratosManutencaosituacao.asString = 'F'));

  sbnContrato.enabled := (pgcDetalhes.activepage = tstSituacaoFinanceira) and
                         (dtmCadastroContratosManutencao.qryParcelasContratosManutencaocontrato.asstring<>'');

  gbxCancelamento.visible := (dtmCadastroContratosManutencao.qryContratosManutencaosituacao.asString = 'C');

  sbnAlterarSituacao.enabled := ((dtmCadastroContratosManutencao.qryContratosManutencaosituacao.asString = 'O') or
                                 (dtmCadastroContratosManutencao.qryContratosManutencaosituacao.asString = 'A')) and
                                 not (dtmCadastroContratosManutencao.qryContratosManutencao.state in [dsedit, dsinsert])


end;

procedure TfrmCadastroContratosManutencao.sbnContratoClick(
  Sender: TObject);
begin
  inherited;
  TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmCadastroContratosManutencao.qryParcelasContratosManutencaocontrato.asstring], 'TfrmCadastroContratos', True)
end;

procedure TfrmCadastroContratosManutencao.sbnAlterarSituacaoClick(
  Sender: TObject);
begin
  inherited;
  case dtmCadastroContratosManutencao.SituacaoContrato of
    scmORCADO: begin
                 AssinarContrato;
                 dtmCadastroContratosManutencao.ReabrirContrato;
               end;
    scmASSINADO : FecharContrato;
  end;
  dtxNomeSituacao.Refresh;

//  dbgProdutos.Refresh;
end;

procedure TfrmCadastroContratosManutencao.AssinarContrato;
begin
  if dtmCadastroContratosManutencao.AssinarContrato then
  begin
    pgcDetalhes.ActivePage := tstSituacaoFinanceira;
    pgcDetalhesChange(nil);
    MensagemAutoClose('Aviso', ' O contrato foi assinado e as parcelas foram geradas corretamentoe ',3);
  end;
end;

procedure TfrmCadastroContratosManutencao.FecharContrato;
begin
  dtmCadastroContratosManutencao.FecharContrato;
end;

procedure TfrmCadastroContratosManutencao.AlterarEstadoBotoes;
begin
  inherited;
  case dtmCadastroContratosManutencao.SituacaoContrato of
    scmORCADO   : begin
                    sbnAlterarSituacao.Caption := 'Assinar F11';
                    sbnAlterarSituacao.Hint := 'Assinar o contrato e gerar os vencimentos para cobrança';

                    sbnExcluir.Caption := 'Excluir F6';
                    sbnExcluir.Hint := 'Exclui o Registro Atual';

                  end;
    scmASSINADO : begin
                    sbnAlterarSituacao.Caption := 'Fechar F11';
                    sbnAlterarSituacao.Hint := 'Fechar o contrato e encerrar os vencimentos para cobrança';

                    sbnExcluir.Caption := 'Cancelar F6';
                    sbnExcluir.Hint := 'Cancela o Registro atual e mantém um registro do cancelamento';

                  end
  end;
end;

procedure TfrmCadastroContratosManutencao.pgcDetalhesChange(
  Sender: TObject);
begin
  inherited;
  pnlTop.enabled := pgcDetalhes.activePage = tstLocacao;

end;

procedure TfrmCadastroContratosManutencao.OperacaoPadrao(
  Value: array of Variant);
begin
  inherited;

  if Length(Value) > 0 then
  begin
    dtmCadastroContratosManutencao.RefazConsultaContrato(Value[0]);
    edfNumeroContrato.SetFocus;
  end;

end;


{
procedure TfrmCadastroContratosManutencao.AtribuirDadosCliente;
begin

end;
}

procedure TfrmCadastroContratosManutencao.edtvalorcaucaoExit(
  Sender: TObject);
begin
  inherited;
  if (dtmCadastroContratosManutencao.qryContratosManutencaovalorcaucao.asCurrency <> 0) and
      (trim(edtnometitularidadecaucao.text) = '') then
     dtmCadastroContratosManutencao.qryContratosManutencaonometitularidadecaucao.asString :=
               fraConsultaCliente.qryProcuraCliente.fieldbyname('nome').asString;

end;

end.
