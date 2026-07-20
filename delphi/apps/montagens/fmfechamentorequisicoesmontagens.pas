
unit fmfechamentorequisicoesmontagens;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmajudabt, ComCtrls, Buttons, ExtCtrls, frtelefone, frfoneramal,
  frendereco, StdCtrls, DBCtrls, cpdbmemo, Grids, DBGrids, cpdbgrid,
  Mask, cpdbfindcontrols, cpdbtext, cpdata, cppagecontrol,
  dmfechamentorequisicoesmontagens,
  fmConsultaBasica, fmConsultaporCampo, clparametrossistema,
  zquery, ctconstantes, ActnList, biblio, Windows, cpdbdata, ToolWin;

type
  TfrmFechamentoRequisicoesMontagens = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    gbxGeracaoRequisicoes: TGroupBox;
    pgcGeracaoRequisicoes: TtecPageControl;
    tstParametros: TTabSheet;
    gbxParametros: TGroupBox;
    gbxPeriododeAberturadaRequisicao: TGroupBox;
    lblVencimentoInicial: TLabel;
    edtEmissaoInicial: TEditData;
    lblVencimentoFinal: TLabel;
    edtEmissaoFinal: TEditData;
    gbxMontador: TGroupBox;
    sbnProcuraMontador: TSpeedButton;
    dtxMontador: TtecDBText;
    edfMontador: TtecDbEditFind;
    pgcFilialGrupoFilialMontagem: TtecPageControl;
    tstFilialMontagem: TTabSheet;
    sbnProcuraFilialdeMontagem: TSpeedButton;
    edfFilialMontagem: TtecDbEditFind;
    dtxFilialdeMontagem: TtecDBText;
    tstGrupoFilialMontagem: TTabSheet;
    sbnProcuraGrupoFilialMontagem: TSpeedButton;
    dtxGrupoFilialMontagem: TtecDBText;
    edfGrupoFilialMontagem: TtecDbEditFind;
    tstSelecionados: TTabSheet;
    gbxFechamento: TGroupBox;
    lblContratosTotal: TLabel;
    lblContratosMarcados: TLabel;
    lblRequisicoesTotal: TLabel;
    lblRequisicoesMarcadas: TLabel;
    sbnConfirma: TSpeedButton;
    sbnGerar: TSpeedButton;
    pgcSelecionado: TtecPageControl;
    tstRequisicao: TTabSheet;
    tstEnderecoEntrega: TTabSheet;
    fraEnderecoEntrega: TfraEndereco;
    fraFoneRamalEntrega: TfraFoneRamal;
    tstContrato: TTabSheet;
    dbgProdutosContratos: TtecDBGrid;
    tstDadosFiscais: TTabSheet;
    dbgProdutosDadosFiscais: TtecDBGrid;
    tstdadosdoCliente: TTabSheet;
    fraEnderecoResidencial: TfraEndereco;
    fraFoneRamalEmpresa: TfraFoneRamal;
    fraFoneRamalResidencial: TfraFoneRamal;
    lblCliente: TLabel;
    dtxClienteDadosdoCliente: TtecDBText;
    AclAbilitar: TActionList;
    actAbilitar: TAction;
    dbgFechamentoRequisicoes: TtecDBGrid;
    gbxObservacao: TGroupBox;
    mmoObsMontagem: TtecDBMemo;
    ckbSelecionarTodos: TCheckBox;
    pnlRequisicao: TPanel;
    lblDataAbertura: TLabel;
    edtDataAbertura: TDBEditData;
    lblDatahora: TLabel;
    dtxDataHora: TtecDBText;
    lblFilialdeMontagem: TLabel;
    lblMontador: TLabel;
    lblVendedor: TLabel;
    dtxNomeFilialdeMontagem: TtecDBText;
    dtxRazaoMontador: TtecDBText;
    dtxNomeVendedor: TtecDBText;
    flkFilialdeMontagemRequisicao: TtecDBText;
    dtxMontadorRequisicao: TtecDBText;
    dtxVendedorRequisicao: TtecDBText;
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
    procedure sbnProcuraFilialdeMontagemClick(Sender: TObject);
    procedure sbnProcuraMontadorClick(Sender: TObject);
    procedure sbnProcuraGrupoFilialMontagemClick(Sender: TObject);
    procedure actAbilitarUpdate(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure pgcFilialGrupoFilialMontagemChange(Sender: TObject);
    procedure dbgFechamentoRequisicoesDblClick(Sender: TObject);
    procedure dbgFechamentoRequisicoesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgFechamentoRequisicoesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure sbnConfirmaClick(Sender: TObject);
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
   procedure AtualizarContadores(SoMarcados: Boolean);
   function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
   procedure AcionaEdicaoItensRequisicoes;
  public
    { Public declarations }
   tipoprocura: TipoProcuraRequisicoes;
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
  end;

var
  frmFechamentoRequisicoesMontagens: TfrmFechamentoRequisicoesMontagens;

implementation

uses fmfechamentorequisicoesitensmontagens, fmlerdadosfechamento;

{$R *.dfm}

{ TfrmFechamentoRequisicoesMontagens }

constructor TfrmFechamentoRequisicoesMontagens.Create(AOwner: TComponent);
begin
  dtmFechamentoRequisicoesMontagens:= TdtmFechamentoRequisicoesMontagens.Create(Self);
  inherited;
  edtEmissaoInicial.Text:=datetostr(dtmFechamentoRequisicoesMontagens.DataServidor);
  edtEmissaoFinal.Text:=datetostr(dtmFechamentoRequisicoesMontagens.DataServidor);
  pgcGeracaoRequisicoes.ActivePageIndex := 0;
  dbgFechamentoRequisicoes.Columns[5].Visible := ParSistema.UsarGradesProdutos;
  dbgFechamentoRequisicoes.Columns[6].Visible := ParSistema.UsarGradesProdutos;
  dtmFechamentoRequisicoesMontagens.OnScrollLinhaColunaGradeItensRequisicoes := AfterScrollLinhaColunaGradeItensRequisicoes;
  dbgProdutosContratos.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutosContratos.Columns[4].Visible := ParSistema.UsarGradesProdutos;
  dtmFechamentoRequisicoesMontagens.OnScrollLinhaColunaGradeProdutosContratos := AfterScrollLinhaColunaGradeProdutosContratos;
  dbgProdutosDadosFiscais.Columns[2].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutosDadosFiscais.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  dtmFechamentoRequisicoesMontagens.OnScrollLinhaColunaGradeProdutosDadosFiscais := AfterScrollLinhaColunaGradeProdutosDadosFiscais;
  dbgFechamentoRequisicoes.Columns[7].Width := length(parsistema.MascaraQuantidade)*7;
  dbgProdutosContratos.Columns[5].Width := length(parsistema.MascaraQuantidade)*7;
  dbgProdutosContratos.Columns[6].Width := length(parsistema.MascaraQuantidade)*7;
  dbgProdutosDadosFiscais.Columns[4].Width := length(parsistema.MascaraQuantidade)*7;
    
end;

destructor TfrmFechamentoRequisicoesMontagens.Destroy;
begin
  dtmFechamentoRequisicoesMontagens:=nil;
  inherited;
  frmFechamentoRequisicoesMontagens:=nil;
end;

function TfrmFechamentoRequisicoesMontagens.ExisteInformacao(
  Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  result := false;
  with dtmFechamentoRequisicoesMontagens do
  if CtrlOn then
   case tipoprocura of
    tpRequisicoesFiliaisdeMontagem      :result := ExisteFilial(NomeCampo, Value);
    tpRequisicoesGrupoFiliaisdeMontagem :result := ExisteGrupoFilial(NomeCampo, Value);
    tpRequisicoesMontadores             :result := ExisteMontador(NomeCampo, Value);
   end;
end;

procedure TfrmFechamentoRequisicoesMontagens.GerarItensRequisicoes;
begin
if ValidaControles then
begin
  ckbSelecionarTodos.Checked:=false;
  with dtmFechamentoRequisicoesMontagens do
  begin
   DataInicial           := edtEmissaoInicial.Text;
   DataFinal             := edtEmissaoFinal.Text;
   FilialdeMontagem      := edfFilialMontagem.Text;
   GrupoFilialdeMontagem := edfGrupoFilialMontagem.Text;
   MontadorMontagem      := edfmontador.text;
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

function TfrmFechamentoRequisicoesMontagens.InternoPesquisar(
  Titulo: String): Integer;
begin
  if PermitirProcura then
  begin
   with dtmFechamentoRequisicoesMontagens do
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

function TfrmFechamentoRequisicoesMontagens.JanelaPesquisa: TfrmConsultaBasica;
var
  Jan: TfrmConsultaPorCampo;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := true;
  Result := Jan
end;

procedure TfrmFechamentoRequisicoesMontagens.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F5     : if not CtrlOn and sbnConfirma.Enabled then sbnConfirma.Click;
    VK_F6     : if not CtrlOn and sbnGerar.Enabled then sbnGerar.Click;
    VK_ESCAPE : begin
                   pgcGeracaoRequisicoes.ActivePage:= tstParametros;
                   if pgcFilialGrupoFilialMontagem.ActivePage = tstFilialMontagem then
                     edfFilialMontagem.SetFocus
                   else
                     edfGrupoFilialMontagem.SetFocus;
                 end;
  end;
end;

function TfrmFechamentoRequisicoesMontagens.PermitirProcura: Boolean;
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
    if edfMontador.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesMontadores;
    end;
  end;
end;

function TfrmFechamentoRequisicoesMontagens.TabelaDePesquisa: TZDataSet;
begin
  Result := inherited TabelaDePesquisa;
  with dtmFechamentoRequisicoesMontagens do
  Case tipoprocura of
  tpRequisicoesFiliaisdeMontagem      :result := ConsultaFiliais;
  tpRequisicoesGrupoFiliaisdeMontagem :Result := ConsultaGrupoFiliais;
  tpRequisicoesMontadores             :result := ConsultaMontadores;
  end;
end;

function TfrmFechamentoRequisicoesMontagens.TituloPesquisa(
  Tipo: TipoProcuraRequisicoes): String;
begin
  Case tipo of
   tpRequisicoesFiliaisdeMontagem      :result := ctFILIAISMONTAGEM;
   tpRequisicoesGrupoFiliaisdeMontagem :Result := ctGRUPOFILIAIS;
   tpRequisicoesMontadores             :result := ctMONTADORES;
  end;
end;

function TfrmFechamentoRequisicoesMontagens.ValidaControles: Boolean;
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
                      OperadorTernario((Trim(edfMontador.Text) <> ''), edfMontador.Exist, True)
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

procedure TfrmFechamentoRequisicoesMontagens.sbnProcuraFilialdeMontagemClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfFilialMontagem, ctFILIAISMONTAGEM);
end;

procedure TfrmFechamentoRequisicoesMontagens.sbnProcuraMontadorClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfMontador, ctMONTADORES);
end;

procedure TfrmFechamentoRequisicoesMontagens.sbnProcuraGrupoFilialMontagemClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfGrupoFilialMontagem, ctGRUPOFILIAIS);
end;

procedure TfrmFechamentoRequisicoesMontagens.actAbilitarUpdate(
  Sender: TObject);
begin
  inherited;
  sbnGerar.Enabled   := (pgcGeracaoRequisicoes.ActivePage = tstParametros);
  sbnConfirma.Enabled:= (dtmFechamentoRequisicoesMontagens.QtdeMarcados > 0);
  lblRequisicoesMarcadas.Caption:= IntToStr(dtmFechamentoRequisicoesMontagens.QtdeMarcados);
end;

procedure TfrmFechamentoRequisicoesMontagens.sbnGerarClick(
  Sender: TObject);
begin
  inherited;
  GerarItensRequisicoes;
end;

procedure TfrmFechamentoRequisicoesMontagens.pgcFilialGrupoFilialMontagemChange(
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

procedure TfrmFechamentoRequisicoesMontagens.dbgFechamentoRequisicoesDblClick(
  Sender: TObject);
begin
  inherited;
  dtmFechamentoRequisicoesMontagens.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
  AtualizarContadores(True);
end;

procedure TfrmFechamentoRequisicoesMontagens.dbgFechamentoRequisicoesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dbgFechamentoRequisicoes.DataSource.DataSet.FieldByName('marcar').AsBoolean then  begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmFechamentoRequisicoesMontagens.dbgFechamentoRequisicoesKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then begin
      dtmFechamentoRequisicoesMontagens.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
      AtualizarContadores(True);
    end;
  if (Key = VK_F2) then
    if (Shift = [ssCtrl]) then
      AcionaEdicaoItensRequisicoes;
end;

procedure TfrmFechamentoRequisicoesMontagens.ckbSelecionarTodosClick(
  Sender: TObject);
begin
  inherited;
  dtmFechamentoRequisicoesMontagens.MarcarSelecionados(ckbSelecionarTodos.Checked,True);
  AtualizarContadores(True);
end;

procedure TfrmFechamentoRequisicoesMontagens.AcionaEdicaoItensRequisicoes;
begin
 frmFechamentoRequisicoesItensMontagens := TfrmFechamentoRequisicoesItensMontagens.Create(frmFechamentoRequisicoesItensMontagens);
 dtmFechamentorequisicoesmontagens.EditarItensRequisicoes;
 frmFechamentoRequisicoesItensMontagens.flkTabeladeMontagem.Exist;
 frmFechamentoRequisicoesitensMontagens.ShowModal;
 frmFechamentoRequisicoesitensMontagens.Free;
end;

procedure TfrmFechamentoRequisicoesMontagens.sbnConfirmaClick(
  Sender: TObject);
begin
 inherited;
 frmLerDadosFechamento := TfrmLerDadosFechamento.Create(frmLerDadosFechamento);
 frmLerDadosFechamento.edtDataMontagem.Text:=datetostr(dtmFechamentoRequisicoesMontagens.DataServidor);
 if frmLerDadosFechamento.ShowModal = mrok then
 begin
  dtmFechamentoRequisicoesMontagens.GerarFechamentoRequisicoes;
  GerarItensRequisicoes;
 end;
 frmLerDadosFechamento.Free;
end;

procedure TfrmFechamentoRequisicoesMontagens.AtualizarContadores(
  SoMarcados: Boolean);
begin
  with dtmFechamentoRequisicoesMontagens do begin
    if not SoMarcados then
     lblRequisicoesTotal.Caption   := IntToStr(TotalRegistros);
    lblRequisicoesMarcadas.Caption := IntToStr(QtdeMarcados);
  end;
end;

procedure TfrmFechamentoRequisicoesMontagens.AfterScrollLinhaColunaGradeItensRequisicoes(
  Sender: TObject);
begin
 dbgFechamentoRequisicoes.columns[5].title.Caption := dtmFechamentoRequisicoesMontagens.LinhadaGradeItensRequisicoes;
 dbgFechamentoRequisicoes.columns[6].title.caption := dtmFechamentoRequisicoesMontagens.ColunadaGradeItensRequisicoes;
end;

procedure TfrmFechamentoRequisicoesMontagens.AfterScrollLinhaColunaGradeProdutosContratos(
  Sender: TObject);
begin
 dbgProdutosContratos.columns[3].title.Caption := dtmFechamentoRequisicoesMontagens.LinhadaGradeProdutosContratos;
 dbgProdutosContratos.columns[4].title.caption := dtmFechamentoRequisicoesMontagens.ColunadaGradeProdutosContratos;
end;

procedure TfrmFechamentoRequisicoesMontagens.AfterScrollLinhaColunaGradeProdutosDadosFiscais(
  Sender: TObject);
begin
 dbgProdutosDadosFiscais.columns[2].title.Caption := dtmFechamentoRequisicoesMontagens.LinhadaGradeProdutosDadosFiscais;
 dbgProdutosDadosFiscais.columns[3].title.caption := dtmFechamentoRequisicoesMontagens.ColunadaGradeProdutosDadosFiscais;
end;

end.
