unit fmgeracaorequisicoesmontagens;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls,
  Forms, Dialogs, fmajudabt, StdCtrls, ExtCtrls, cpdata,
  Mask, cpdbfindcontrols,  DBCtrls, cpdbtext, ComCtrls,
  cppagecontrol, Buttons, Grids, DBGrids, cpdbgrid,
  ctconstantes, fmconsultabasica, fmconsultaporcampo,
  zquery, ZPgSqlQuery, cpquery, dmgeracaorequisicoesmontagens,
  biblio, cpdbmemo, Windows, ActnList, frendereco, frdadoscliente, frtelefone,
  frfoneramal, clparametrossistema, ToolWin;

type
  TfrmGeracaoRequisicoesMontagens = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    gbxGeracaoRequisicoes: TGroupBox;
    pgcGeracaoRequisicoes: TtecPageControl;
    tstParametros: TTabSheet;
    gbxParametros: TGroupBox;
    pgcFilialGrupoFilialVenda: TtecPageControl;
    tstFilialVenda: TTabSheet;
    sbnProcuraFilialdeVenda: TSpeedButton;
    dtxFilialdeVenda: TtecDBText;
    tstGrupoFilialVenda: TTabSheet;
    sbnProcuraGrupoFilialVenda: TSpeedButton;
    dtxGrupoFilialVenda: TtecDBText;
    gbxPeriodo: TGroupBox;
    lblVencimentoInicial: TLabel;
    edtEmissaoInicial: TEditData;
    lblVencimentoFinal: TLabel;
    edtEmissaoFinal: TEditData;
    tstSelecionados: TTabSheet;
    rgpSelecionar: TRadioGroup;
    gbxCliente: TGroupBox;
    sbnProcuraCliente: TSpeedButton;
    dtxCliente: TtecDBText;
    sbnGerar: TSpeedButton;
    edfFilialVenda: TtecDbEditFind;
    edfCliente: TtecDbEditFind;
    edfGrupoFilialVenda: TtecDbEditFind;
    dbgGeracaoRequisicoes: TtecDBGrid;
    pgcFilialGrupoFilialMontagem: TtecPageControl;
    tstFilialMontagem: TTabSheet;
    tstGrupoFilialMontagem: TTabSheet;
    sbnProcuraGrupoFilialMontagem: TSpeedButton;
    dtxGrupoFilialMontagem: TtecDBText;
    edfGrupoFilialMontagem: TtecDbEditFind;
    edfFilialMontagem: TtecDbEditFind;
    sbnProcuraFilialdeMontagem: TSpeedButton;
    dtxFilialdeMontagem: TtecDBText;
    sbnConfirma: TSpeedButton;
    aclAbilitar: TActionList;
    actAbilitar: TAction;
    gbxMontagens: TGroupBox;
    lblContratosTotal: TLabel;
    lblContratosMarcados: TLabel;
    lblRequisicoesTotal: TLabel;
    lblRequisicoesMarcadas: TLabel;
    pgcSelecionado: TtecPageControl;
    tstObservacoes: TTabSheet;
    mmoObsMontagem: TtecDBMemo;
    tstEnderecoEntrega: TTabSheet;
    fraEnderecoEntrega: TfraEndereco;
    tstContrato: TTabSheet;
    tstdadosdoCliente: TTabSheet;
    tstDadosFiscais: TTabSheet;
    dbgProdutosContratos: TtecDBGrid;
    dbgProdutosDadosFiscais: TtecDBGrid;
    fraFoneRamalEntrega: TfraFoneRamal;
    fraEnderecoResidencial: TfraEndereco;
    fraFoneRamalEmpresa: TfraFoneRamal;
    fraFoneRamalResidencial: TfraFoneRamal;
    lblCliente: TLabel;
    dtxClienteDadosdoCliente: TtecDBText;
    ckbSelecionarTodos: TCheckBox;
    pnlContrato: TPanel;
    lblContrato: TLabel;
    dtxContrato: TtecDBText;
    lblEmissaoContrato: TLabel;
    dtxEmissaoContrato: TtecDBText;
    lblFilialdeVenda: TLabel;
    dtxFilialVendaContrato: TtecDBText;
    pnlDadosFiscais: TPanel;
    lblNotaFiscal: TLabel;
    dtxNotaFiscal: TtecDBText;
    lblEmissaoNotaFiscal: TLabel;
    dtxEmissaoNotaFiscal: TtecDBText;
    lblCupomFiscal: TLabel;
    dtxCupomFiscal: TtecDBText;
    lblMaquina: TLabel;
    dtxMaquina: TtecDBText;
    Label1: TLabel;
    dtxFilialEmissaoDadoFiscal: TtecDBText;
    Label2: TLabel;
    dtxIntervensao: TtecDBText;
    dtxSerie: TtecDBText;
    lblSerie: TLabel;
    procedure sbnProcuraClienteClick(Sender: TObject);
    procedure sbnProcuraFilialdeVendaClick(Sender: TObject);
    procedure sbnProcuraFilialdeMontagemClick(Sender: TObject);
    procedure sbnProcuraGrupoFilialVendaClick(Sender: TObject);
    procedure sbnProcuraGrupoFilialMontagemClick(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure dbgGeracaoRequisicoesDblClick(Sender: TObject);
    procedure dbgGeracaoRequisicoesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgGeracaoRequisicoesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actAbilitarUpdate(Sender: TObject);
    procedure pgcFilialGrupoFilialMontagemChange(Sender: TObject);
    procedure pgcFilialGrupoFilialVendaChange(Sender: TObject);
    procedure sbnConfirmaClick(Sender: TObject);
    procedure rgpSelecionarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AfterScrollLinhaColunaGradeItensRequisicoes(Sender: TObject);
    procedure AfterScrollLinhaColunaGradeProdutosContratos(Sender: TObject);
    procedure AfterScrollLinhaColunaGradeProdutosDadosFiscais(Sender: TObject);

  protected
   function  InternoPesquisar(Titulo: String): Integer; override;
   function  JanelaPesquisa: TfrmConsultaBasica; override;
   function  TabelaDePesquisa: TZDataSet; override;
   function  PermitirProcura: Boolean;
   function  TituloPesquisa(Tipo: TipoProcuraRequisicoes): String;
   function  ValidaControles: Boolean;
   procedure GerarItensRequisicoes;
   procedure KeyDown(var Key: Word; Shift: TShiftState); override;
   function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
   procedure AtualizarContadores(SoMarcados: Boolean);
  public
    { Public declarations }
   tipoprocura: TipoProcuraRequisicoes;
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
  end;

var
  frmGeracaoRequisicoesMontagens: TfrmGeracaoRequisicoesMontagens;

implementation

uses fmlerdadosgeracao;


{$R *.dfm}

{ TfrmGeracaoRequisicoesMontagens }

constructor TfrmGeracaoRequisicoesMontagens.Create(AOwner: TComponent);
begin
  dtmGeracaoRequisicoesMontagens:= TdtmGeracaoRequisicoesMontagens.Create(Self);
  inherited;
  edtEmissaoInicial.Text:=datetostr(dtmGeracaoRequisicoesMontagens.DataServidor);
  edtEmissaoFinal.Text:=datetostr(dtmGeracaoRequisicoesMontagens.DataServidor);
  dbgGeracaoRequisicoes.Columns[4].Visible := ParSistema.UsarGradesProdutos;
  dbgGeracaoRequisicoes.Columns[5].Visible := ParSistema.UsarGradesProdutos;
  dtmGeracaoRequisicoesMontagens.OnScrollLinhaColunaGradeItensRequisicoes := AfterScrollLinhaColunaGradeItensRequisicoes;
  dbgProdutosContratos.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutosContratos.Columns[4].Visible := ParSistema.UsarGradesProdutos;
  dtmGeracaoRequisicoesMontagens.OnScrollLinhaColunaGradeProdutosContratos := AfterScrollLinhaColunaGradeProdutosContratos;
  dbgProdutosDadosFiscais.Columns[2].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutosDadosFiscais.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  dtmGeracaoRequisicoesMontagens.OnScrollLinhaColunaGradeProdutosDadosFiscais := AfterScrollLinhaColunaGradeProdutosDadosFiscais;
  dbgGeracaoRequisicoes.Columns[6].Width := ParSistema.TamanhoMascaraQuantidade;
  dbgProdutosContratos.Columns[5].Width := ParSistema.TamanhoMascaraQuantidade;
  dbgProdutosContratos.Columns[6].Width := ParSistema.TamanhoMascaraQuantidade;
  dbgProdutosDadosFiscais.Columns[4].Width := ParSistema.TamanhoMascaraQuantidade;
  pgcGeracaoRequisicoes.ActivePage := tstParametros;
end;

destructor TfrmGeracaoRequisicoesMontagens.Destroy;
begin
  dtmGeracaoRequisicoesMontagens:=nil;
  inherited;
  frmGeracaoRequisicoesMontagens:=nil;
end;

function TfrmGeracaoRequisicoesMontagens.InternoPesquisar(
  Titulo: String): Integer;
begin
  if PermitirProcura then
  begin
   with dtmGeracaoRequisicoesMontagens do
   begin
    AbreTabelaPesquisa(tipoprocura);
    Titulo := TituloPesquisa(tipoprocura);
    result:=inherited internopesquisar(Titulo);
    if Result = mrOK then
      Selecionar(tipoProcura);
    FechaTabelaPesquisa(tipoprocura);
   end;
  end
  else
   Result := mrNone
end;

function TfrmGeracaoRequisicoesMontagens.PermitirProcura: Boolean;
begin
  Result := False;
  if CtrlOn then
  begin
    if edfFilialMontagem.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesFiliaisdeMontagem;
    end;
    if edfGrupoFilialMontagem.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesGrupoFiliaisdeMontagem;
    end;
    if edfFilialVenda.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesFiliaisdeVenda;
    end;
    if edfGrupoFilialVenda.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesGrupoFiliaisdeVenda;
    end;
    if edfCliente.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesClientes;
    end;
  end;
end;

function TfrmGeracaoRequisicoesMontagens.TituloPesquisa(
  Tipo: TipoProcuraRequisicoes): String;
begin
  Case tipo of
   tpRequisicoesFiliaisdeMontagem      :result := ctFILIAISMONTAGEM;
   tpRequisicoesFiliaisdeVenda         :result := ctFILIAISVENDAS;

   tpRequisicoesGrupoFiliaisdeVenda,
   tpRequisicoesGrupoFiliaisdeMontagem :Result := ctGRUPOFILIAIS;
   tpRequisicoesClientes               :result := ctCLIENTES;

  end;

end;

procedure TfrmGeracaoRequisicoesMontagens.sbnProcuraClienteClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfcliente, ctCLIENTES)
end;

procedure TfrmGeracaoRequisicoesMontagens.sbnProcuraFilialdeVendaClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfFilialVenda, ctFILIAISVENDAS);
end;

procedure TfrmGeracaoRequisicoesMontagens.sbnProcuraFilialdeMontagemClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfFilialMontagem, ctFILIAISMONTAGEM);
end;

procedure TfrmGeracaoRequisicoesMontagens.sbnProcuraGrupoFilialVendaClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfGrupoFilialVenda, ctGRUPOFILIAIS);
end;

function TfrmGeracaoRequisicoesMontagens.JanelaPesquisa: TfrmConsultaBasica;
var
  Jan: TfrmConsultaPorCampo;

begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := Not (TipoProcura in [tpRequisicoesClientes]) and CtrlOn;

  Result := Jan

end;

function TfrmGeracaoRequisicoesMontagens.TabelaDePesquisa: TZDataSet;
begin
  Result := inherited TabelaDePesquisa;
  with dtmGeracaoRequisicoesMontagens do
  Case tipoprocura of
  tpRequisicoesFiliaisdeMontagem,
  tpRequisicoesFiliaisdeVenda         :result := ConsultaFiliais;
  tpRequisicoesGrupoFiliaisdeMontagem,

  tpRequisicoesGrupoFiliaisdeVenda    :Result := ConsultaGrupoFiliais;

  tpRequisicoesClientes                :result := ConsultaClientes;

  end;

end;

function TfrmGeracaoRequisicoesMontagens.ValidaControles: Boolean;
begin
  Result := (edtEmissaoInicial.DataValida and edtEmissaoFinal.DataValida);
  if Result then
  begin
   if (not dataembranco(edtEmissaoInicial.text) and not dataembranco(edtEmissaoFinal.text)) then
     Result:=StrToDate(edtEmissaoInicial.Text) <= StrToDate(edtEmissaoFinal.Text);
   if result then
   begin
     Result:=(not dataembranco(edtEmissaoInicial.text) or not dataembranco(edtEmissaoFinal.text));
     if Result then
            Result := OperadorTernario((Trim(edfFilialMontagem.Text) <> ''),edfFilialMontagem.Exist, True) and
                      OperadorTernario((Trim(edfGrupoFilialMontagem.text) <> ''), edfGrupoFilialMontagem.Exist, True) and
                      OperadorTernario((Trim(edfCliente.Text) <> ''), edfCliente.Exist, True) and
                      OperadorTernario((Trim(edfFilialVenda.Text) <> ''), edfFilialVenda.Exist, True) and
                      OperadorTernario((Trim(edfGrupoFilialVenda.text) <> ''), edfGrupoFilialVenda.Exist, True)
     else
     begin
      MensagemAviso(ctDATAINVALIDA);
      edtEmissaoInicial.SetFocus;
     end;
   end
   else
   begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      edtEmissaoInicial.SetFocus;
   end;
  end;
end;

procedure TfrmGeracaoRequisicoesMontagens.sbnProcuraGrupoFilialMontagemClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfGrupoFilialMontagem, ctGRUPOFILIAIS);
end;

procedure TfrmGeracaoRequisicoesMontagens.GerarItensRequisicoes;
begin
if ValidaControles then
begin
  ckbSelecionarTodos.Checked:=false;
  with dtmGeracaoRequisicoesMontagens do
  begin
   TipodeSelecao         := rgpSelecionar.ItemIndex; 
   DataInicial           := edtEmissaoInicial.Text;
   DataFinal             := edtEmissaoFinal.Text;
   FilialdeMontagem      := edfFilialMontagem.Text;
   GrupoFilialdeMontagem := edfGrupoFilialMontagem.Text;
   FilialdeVenda         := edfFilialVenda.Text;
   GrupoFilialdeVenda    := edfGrupoFilialVenda.Text;
   Cliente               := edfCliente.Text;

   qryItensRequisicoes.Open;
   if not (qryItensRequisicoes.IsEmpty) then
     pgcGeracaoRequisicoes.ActivePage := tstSelecionados
   else
    begin
     pgcGeracaoRequisicoes.ActivePage := tstParametros;
     MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
     if pgcFilialGrupoFilialMontagem.ActivePage = tstFilialMontagem then
      edfFilialMontagem.setFocus
     else
      edfGrupoFilialMontagem.setFocus;
    end;
   QtdeMarcados:=0;
   ckbSelecionarTodos.Checked:=False;
   AtualizarContadores(False);
  end;
end;
end;

procedure TfrmGeracaoRequisicoesMontagens.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F5     : if not CtrlOn and sbnconfirma.enabled then sbnConfirma.Click;
    VK_F6     : if not CtrlOn and sbnGerar.enabled then sbnGerar.Click;
    VK_ESCAPE : begin
                   pgcGeracaoRequisicoes.ActivePage:= tstParametros;
                   if pgcFilialGrupoFilialMontagem.ActivePage = tstFilialMontagem then
                     edfFilialMontagem.SetFocus
                   else
                     edfGrupoFilialMontagem.SetFocus;
                 end;
  end;

end;

procedure TfrmGeracaoRequisicoesMontagens.sbnGerarClick(Sender: TObject);
begin
  inherited;
  GerarItensRequisicoes;
end;

procedure TfrmGeracaoRequisicoesMontagens.ckbSelecionarTodosClick(
  Sender: TObject);
begin
  inherited;
  dtmGeracaoRequisicoesMontagens.MarcarSelecionados(ckbSelecionarTodos.Checked,True);
  AtualizarContadores(True);
end;

procedure TfrmGeracaoRequisicoesMontagens.dbgGeracaoRequisicoesDblClick(
  Sender: TObject);
begin
  inherited;
  dtmGeracaoRequisicoesMontagens.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
  AtualizarContadores(True);
end;

procedure TfrmGeracaoRequisicoesMontagens.dbgGeracaoRequisicoesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dbgGeracaoRequisicoes.DataSource.DataSet.FieldByName('marcar').AsBoolean then  begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmGeracaoRequisicoesMontagens.dbgGeracaoRequisicoesKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then begin
      dtmGeracaoRequisicoesMontagens.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
      AtualizarContadores(True);
    end;
end;

procedure TfrmGeracaoRequisicoesMontagens.actAbilitarUpdate(
  Sender: TObject);
begin
  inherited;
  sbnGerar.Enabled   := (pgcGeracaoRequisicoes.ActivePage = tstParametros);
  sbnConfirma.Enabled:= (dtmGeracaoRequisicoesMontagens.QtdeMarcados > 0);
end;

procedure TfrmGeracaoRequisicoesMontagens.pgcFilialGrupoFilialMontagemChange(
  Sender: TObject);
begin
  inherited;
  if pgcFilialGrupoFilialMontagem.ActivePage = tstFilialMontagem then begin
    edfGrupoFilialMontagem.Clear;
    edfFilialMontagem.setFocus;
  end
  else begin
    edfFilialMontagem.Clear;
    edfGrupoFilialMontagem.setFocus;
  end;
end;

procedure TfrmGeracaoRequisicoesMontagens.pgcFilialGrupoFilialVendaChange(
  Sender: TObject);
begin
  inherited;
  if pgcFilialGrupoFilialVenda.ActivePage = tstFilialVenda then begin
    edfGrupoFilialVenda.Clear;
    edfFilialVenda.setFocus;
  end
  else begin
    edfFilialVenda.Clear;
    edfGrupoFilialVenda.setFocus;
  end;
end;

procedure TfrmGeracaoRequisicoesMontagens.sbnConfirmaClick(
  Sender: TObject);
begin
  inherited;
 frmLerDadosGeracao := TfrmLerDadosGeracao.Create(frmLerDadosGeracao);
 if frmLerDadosGeracao.ShowModal = mrok then
 begin
  dtmGeracaoRequisicoesMontagens.GerarRequisicoes;
  GerarItensRequisicoes;
 end;
 frmLerDadosGeracao.Free;
end;

function TfrmGeracaoRequisicoesMontagens.ExisteInformacao(
  Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  result := false;
  with dtmGeracaoRequisicoesMontagens do
  if CtrlOn then
   case tipoprocura of

    tpRequisicoesFiliaisdeMontagem,

    tpRequisicoesFiliaisdeVenda         :result := ExisteFilial(NomeCampo, Value);

    tpRequisicoesGrupoFiliaisdeVenda,
    tpRequisicoesGrupoFiliaisdeMontagem :result := ExisteGrupoFilial(NomeCampo, Value);
    tpRequisicoesClientes               :result := ExisteCliente(NomeCampo, Value);

   end;

end;


procedure TfrmGeracaoRequisicoesMontagens.rgpSelecionarClick(
  Sender: TObject);
begin
  inherited;
  if rgpSelecionar.ItemIndex=0 then
    gbxPeriodo.Caption:='Período de Entrega'
  else
    gbxPeriodo.Caption:='Período de Emissão';
end;

procedure TfrmGeracaoRequisicoesMontagens.AtualizarContadores(
  SoMarcados: Boolean);
begin
  with dtmGeracaoRequisicoesMontagens do begin
    if not SoMarcados then
     lblRequisicoesTotal.Caption   := IntToStr(TotalRegistros);
    lblRequisicoesMarcadas.Caption := IntToStr(QtdeMarcados);
  end;
end;

procedure TfrmGeracaoRequisicoesMontagens.AfterScrollLinhaColunaGradeItensRequisicoes(
  Sender: TObject);
begin
 dbgGeracaoRequisicoes.columns[4].title.Caption := dtmGeracaoRequisicoesMontagens.LinhadaGradeItensRequisicoes;
 dbgGeracaoRequisicoes.columns[5].title.caption := dtmGeracaoRequisicoesMontagens.ColunadaGradeItensRequisicoes;
end;

procedure TfrmGeracaoRequisicoesMontagens.AfterScrollLinhaColunaGradeProdutosContratos(
  Sender: TObject);
begin
 dbgProdutosContratos.columns[3].title.Caption := dtmGeracaoRequisicoesMontagens.LinhadaGradeProdutosContratos;
 dbgProdutosContratos.columns[4].title.caption := dtmGeracaoRequisicoesMontagens.ColunadaGradeProdutosContratos;
end;

procedure TfrmGeracaoRequisicoesMontagens.AfterScrollLinhaColunaGradeProdutosDadosFiscais(
  Sender: TObject);
begin
 dbgProdutosDadosFiscais.columns[2].title.Caption := dtmGeracaoRequisicoesMontagens.LinhadaGradeProdutosDadosFiscais;
 dbgProdutosDadosFiscais.columns[3].title.caption := dtmGeracaoRequisicoesMontagens.ColunadaGradeProdutosDadosFiscais;
end;

end.
