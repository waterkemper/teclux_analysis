unit fmquitacaorequisicoesmontagens;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmajudabt, frtelefone, frfoneramal, frendereco, StdCtrls, DBCtrls,
  cpdbmemo, Grids, DBGrids, cpdbgrid, Mask, cpdbfindcontrols, cpdbtext,
  cpdata, ComCtrls, cppagecontrol, Buttons, ExtCtrls,
  dmquitacaorequisicoesmontagens,
  fmConsultaBasica, fmConsultaporCampo,
  zquery, ctconstantes, biblio, Windows, ActnList, cpdbdata, clparametrossistema,
  ToolWin;


type
  TfrmQuitacaoRequisicoesMontagens = class(TfrmAjudabt)
    pgcGeracaoRequisicoes: TtecPageControl;
    tstParametros: TTabSheet;
    gbxParametros: TGroupBox;
    gbxPeriododeAberturadaRequisicao: TGroupBox;
    lblVencimentoInicial: TLabel;
    edtMontagemInicial: TEditData;
    lblVencimentoFinal: TLabel;
    edtMontagemFinal: TEditData;
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
    gbxQuitacao: TGroupBox;
    lblContratosTotal: TLabel;
    lblContratosMarcados: TLabel;
    lblRequisicoesTotal: TLabel;
    lblRequisicoesMarcadas: TLabel;
    ckbSelecionarTodos: TCheckBox;
    dbgQuitacaoRequisicoes: TtecDBGrid;
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
    sbnConfirma: TSpeedButton;
    sbnGerar: TSpeedButton;
    aclAbilitar: TActionList;
    actAbilitar: TAction;
    gbxObservacao: TGroupBox;
    mmoObsMontagem: TtecDBMemo;
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
    procedure sbnGerarClick(Sender: TObject);
    procedure pgcFilialGrupoFilialMontagemChange(Sender: TObject);
    procedure sbnProcuraFilialdeMontagemClick(Sender: TObject);
    procedure sbnProcuraGrupoFilialMontagemClick(Sender: TObject);
    procedure sbnProcuraMontadorClick(Sender: TObject);
    procedure sbnConfirmaClick(Sender: TObject);
    procedure actAbilitarUpdate(Sender: TObject);
    procedure dbgQuitacaoRequisicoesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgQuitacaoRequisicoesDblClick(Sender: TObject);
    procedure dbgQuitacaoRequisicoesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckbSelecionarTodosClick(Sender: TObject);
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
  public
    { Public declarations }
   tipoprocura: TipoProcuraRequisicoes;
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
  end;

var
  frmQuitacaoRequisicoesMontagens: TfrmQuitacaoRequisicoesMontagens;

implementation

uses fmlerdadosquitacao;

{$R *.dfm}

{ TfrmQuitacaoRequisicoesMontagens }

constructor TfrmQuitacaoRequisicoesMontagens.Create(AOwner: TComponent);
begin
  dtmQuitacaoRequisicoesMontagens:= TdtmQuitacaoRequisicoesMontagens.Create(Self);
  inherited;
  edtMontagemInicial.Text:=datetostr(dtmQuitacaoRequisicoesMontagens.DataServidor);
  edtMontagemFinal.Text:=datetostr(dtmQuitacaoRequisicoesMontagens.DataServidor);

  dbgQuitacaoRequisicoes.Columns[5].Visible := ParSistema.UsarGradesProdutos;
  dbgQuitacaoRequisicoes.Columns[6].Visible := ParSistema.UsarGradesProdutos;
  dtmQuitacaoRequisicoesMontagens.OnScrollLinhaColunaGradeItensRequisicoes := AfterScrollLinhaColunaGradeItensRequisicoes;
  dbgProdutosContratos.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutosContratos.Columns[4].Visible := ParSistema.UsarGradesProdutos;
  dtmQuitacaoRequisicoesMontagens.OnScrollLinhaColunaGradeProdutosContratos := AfterScrollLinhaColunaGradeProdutosContratos;
  dbgProdutosDadosFiscais.Columns[2].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutosDadosFiscais.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  dtmQuitacaoRequisicoesMontagens.OnScrollLinhaColunaGradeProdutosDadosFiscais := AfterScrollLinhaColunaGradeProdutosDadosFiscais;
  dbgQuitacaoRequisicoes.Columns[7].Width := length(parsistema.MascaraQuantidade)*7;
  dbgProdutosContratos.Columns[5].Width := length(parsistema.MascaraQuantidade)*7;
  dbgProdutosContratos.Columns[6].Width := length(parsistema.MascaraQuantidade)*7;
  dbgProdutosDadosFiscais.Columns[4].Width := length(parsistema.MascaraQuantidade)*7;
end;

destructor TfrmQuitacaoRequisicoesMontagens.Destroy;
begin
  dtmQuitacaoRequisicoesMontagens:=nil;
  inherited;
  frmQuitacaoRequisicoesMontagens:=nil;
end;

function TfrmQuitacaoRequisicoesMontagens.ExisteInformacao(
  Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  result := false;
  with dtmQuitacaoRequisicoesMontagens do
  if CtrlOn then
   case tipoprocura of
    tpRequisicoesFiliaisdeMontagem      :result := ExisteFilial(NomeCampo, Value);
    tpRequisicoesGrupoFiliaisdeMontagem :result := ExisteGrupoFilial(NomeCampo, Value);
    tpRequisicoesMontadores             :result := ExisteMontador(NomeCampo, Value);
   end;
end;

procedure TfrmQuitacaoRequisicoesMontagens.GerarItensRequisicoes;
begin
if ValidaControles then
begin
  ckbSelecionarTodos.Checked:=false;
  with dtmQuitacaoRequisicoesMontagens do
  begin
   DataInicial           := edtMontagemInicial.Text;
   DataFinal             := edtMontagemFinal.Text;
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

function TfrmQuitacaoRequisicoesMontagens.InternoPesquisar(
  Titulo: String): Integer;
begin
  if PermitirProcura then
  begin
   with dtmQuitacaoRequisicoesMontagens do
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

function TfrmQuitacaoRequisicoesMontagens.JanelaPesquisa: TfrmConsultaBasica;
var
  Jan: TfrmConsultaPorCampo;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := true;  Result := Janend;
procedure TfrmQuitacaoRequisicoesMontagens.KeyDown(var Key: Word;
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

function TfrmQuitacaoRequisicoesMontagens.PermitirProcura: Boolean;
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

function TfrmQuitacaoRequisicoesMontagens.TabelaDePesquisa: TZDataSet;
begin
  Result := inherited TabelaDePesquisa;
  with dtmQuitacaoRequisicoesMontagens do
  Case tipoprocura of
  tpRequisicoesFiliaisdeMontagem      :result := ConsultaFiliais;
  tpRequisicoesGrupoFiliaisdeMontagem :Result := ConsultaGrupoFiliais;
  tpRequisicoesMontadores             :result := ConsultaMontadores;
  end;
end;

function TfrmQuitacaoRequisicoesMontagens.TituloPesquisa(
  Tipo: TipoProcuraRequisicoes): String;
begin
  Case tipo of
   tpRequisicoesFiliaisdeMontagem      :result := ctFILIAISMONTAGEM;
   tpRequisicoesGrupoFiliaisdeMontagem :Result := ctGRUPOFILIAIS;
   tpRequisicoesMontadores             :result := ctMONTADORES;
  end;
end;

function TfrmQuitacaoRequisicoesMontagens.ValidaControles: Boolean;
begin
  Result := (edtMontagemInicial.DataValida and edtMontagemFinal.DataValida);
  if Result then
  begin
   if (not dataembranco(edtMontagemInicial.text) and not dataembranco(edtMontagemFinal.text)) then
     Result:=StrToDate(edtMontagemInicial.Text) <= StrToDate(edtMontagemFinal.Text);
   if result then
   begin
     Result:=(not dataembranco(edtMontagemInicial.text) or not dataembranco(edtMontagemFinal.text));
     if Result then
            Result := OperadorTernario((Trim(edfFilialMontagem.Text) <> ''),edfFilialMontagem.Exist, True) and
                      OperadorTernario((Trim(edfGrupoFilialMontagem.text) <> ''), edfGrupoFilialMontagem.Exist, True) and
                      OperadorTernario((Trim(edfMontador.Text) <> ''), edfMontador.Exist, True)
     else
     begin
      MensagemAviso(ctDATAINVALIDA);
      edtMontagemInicial.SetFocus;
     end;
   end
   else
   begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      edtMontagemInicial.SetFocus;
   end;
  end;
end;

procedure TfrmQuitacaoRequisicoesMontagens.sbnGerarClick(Sender: TObject);
begin
  inherited;
  GerarItensRequisicoes;
end;

procedure TfrmQuitacaoRequisicoesMontagens.pgcFilialGrupoFilialMontagemChange(
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

procedure TfrmQuitacaoRequisicoesMontagens.sbnProcuraFilialdeMontagemClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfFilialMontagem, ctFILIAISMONTAGEM);
end;

procedure TfrmQuitacaoRequisicoesMontagens.sbnProcuraGrupoFilialMontagemClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfGrupoFilialMontagem, ctGRUPOFILIAIS);
end;

procedure TfrmQuitacaoRequisicoesMontagens.sbnProcuraMontadorClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfMontador, ctMONTADORES);
end;

procedure TfrmQuitacaoRequisicoesMontagens.sbnConfirmaClick(
  Sender: TObject);
begin
  inherited;
 frmLerDadosQuitacao := TfrmLerDadosQuitacao.Create(frmLerDadosQuitacao);
 frmLerDadosQuitacao.edtDataPagto.Text:=datetostr(dtmQuitacaoRequisicoesMontagens.DataServidor);

 if frmLerDadosQuitacao.ShowModal = mrok then
 begin
  dtmQuitacaoRequisicoesMontagens.GerarQuitacaoRequisicoes;
  GerarItensRequisicoes;
 end;
 frmLerDadosQuitacao.Free;

end;

procedure TfrmQuitacaoRequisicoesMontagens.actAbilitarUpdate(
  Sender: TObject);
begin
  inherited;
  sbnGerar.Enabled   := (pgcGeracaoRequisicoes.ActivePage = tstParametros);
  sbnConfirma.Enabled:= (dtmQuitacaoRequisicoesMontagens.QtdeMarcados > 0);
end;

procedure TfrmQuitacaoRequisicoesMontagens.dbgQuitacaoRequisicoesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dbgQuitacaoRequisicoes.DataSource.DataSet.FieldByName('marcar').AsBoolean then  begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

end;

procedure TfrmQuitacaoRequisicoesMontagens.dbgQuitacaoRequisicoesDblClick(
  Sender: TObject);
begin
  inherited;
  dtmQuitacaoRequisicoesMontagens.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
  AtualizarContadores(True);
end;

procedure TfrmQuitacaoRequisicoesMontagens.dbgQuitacaoRequisicoesKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then begin
      dtmQuitacaoRequisicoesMontagens.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
      AtualizarContadores(True);
    end;
end;

procedure TfrmQuitacaoRequisicoesMontagens.ckbSelecionarTodosClick(
  Sender: TObject);
begin
  inherited;
  dtmQuitacaoRequisicoesMontagens.MarcarSelecionados(ckbSelecionarTodos.Checked,True);
  AtualizarContadores(True);
end;

procedure TfrmQuitacaoRequisicoesMontagens.AtualizarContadores(
  SoMarcados: Boolean);
begin
  with dtmQuitacaoRequisicoesMontagens do begin
    if not SoMarcados then
     lblRequisicoesTotal.Caption   := IntToStr(TotalRegistros);
    lblRequisicoesMarcadas.Caption := IntToStr(QtdeMarcados);
  end;
end;

procedure TfrmQuitacaoRequisicoesMontagens.AfterScrollLinhaColunaGradeItensRequisicoes(
  Sender: TObject);
begin
 dbgQuitacaoRequisicoes.columns[5].title.Caption := dtmQuitacaoRequisicoesMontagens.LinhadaGradeItensRequisicoes;
 dbgQuitacaoRequisicoes.columns[6].title.caption := dtmQuitacaoRequisicoesMontagens.ColunadaGradeItensRequisicoes;
end;

procedure TfrmQuitacaoRequisicoesMontagens.AfterScrollLinhaColunaGradeProdutosContratos(
  Sender: TObject);
begin
 dbgProdutosContratos.columns[3].title.Caption := dtmQuitacaoRequisicoesMontagens.LinhadaGradeProdutosContratos;
 dbgProdutosContratos.columns[4].title.caption := dtmQuitacaoRequisicoesMontagens.ColunadaGradeProdutosContratos;
end;

procedure TfrmQuitacaoRequisicoesMontagens.AfterScrollLinhaColunaGradeProdutosDadosFiscais(
  Sender: TObject);
begin
 dbgProdutosDadosFiscais.columns[2].title.Caption := dtmQuitacaoRequisicoesMontagens.LinhadaGradeProdutosDadosFiscais;
 dbgProdutosDadosFiscais.columns[3].title.caption := dtmQuitacaoRequisicoesMontagens.ColunadaGradeProdutosDadosFiscais;
end;

end.
