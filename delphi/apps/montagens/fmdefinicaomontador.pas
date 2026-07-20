unit fmdefinicaomontador;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmajudabt, ComCtrls, Buttons, ExtCtrls, frtelefone, frfoneramal,
  frendereco, StdCtrls, DBCtrls, cpdbmemo, Grids, DBGrids, cpdbgrid,
  cpdata, Mask, cpdbfindcontrols, cpdbtext, cppagecontrol,
  dmdefinicaomontador, ctconstantes, ActnList, cpdbdata,
  fmconsultabasica, fmconsultaporcampo, zquery,
  biblio, Windows, clparametrossistema, ToolWin;

type
  TfrmDefinicaoMontador = class(TfrmAjudaBt)
    sbnConfirma: TSpeedButton;
    sbnGerar: TSpeedButton;
    pnlFundoJanela: TPanel;
    gbxGeracaoRequisicoes: TGroupBox;
    pgcGeracaoRequisicoes: TtecPageControl;
    tstParametros: TTabSheet;
    gbxParametros: TGroupBox;
    pgcFilialGrupoFilialVenda: TtecPageControl;
    tstFilialVenda: TTabSheet;
    sbnProcuraFilialdeVenda: TSpeedButton;
    dtxFilialdeVenda: TtecDBText;
    edfFilialVenda: TtecDbEditFind;
    tstGrupoFilialVenda: TTabSheet;
    sbnProcuraGrupoFilialVenda: TSpeedButton;
    dtxGrupoFilialVenda: TtecDBText;
    edfGrupoFilialVenda: TtecDbEditFind;
    gbxPeriodo: TGroupBox;
    lblVencimentoInicial: TLabel;
    edtDataInicial: TEditData;
    lblVencimentoFinal: TLabel;
    edtDataFinal: TEditData;
    gbxCliente: TGroupBox;
    sbnProcuraCliente: TSpeedButton;
    dtxCliente: TtecDBText;
    edfCliente: TtecDbEditFind;
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
    gbxMontagens: TGroupBox;
    lblContratosTotal: TLabel;
    lblContratosMarcados: TLabel;
    lblRequisicoesTotal: TLabel;
    lblRequisicoesMarcadas: TLabel;
    dbgGeracaoRequisicoes: TtecDBGrid;
    pgcSelecionado: TtecPageControl;
    tstRequisicaoItens: TTabSheet;
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
    aclAbilitar: TActionList;
    actAbilitar: TAction;
    gbxMontador: TGroupBox;
    sbnProcuraMontador: TSpeedButton;
    dtxMontador: TtecDBText;
    edfMontador: TtecDbEditFind;
    gbxObservacoesItens: TGroupBox;
    mmoObservacoes: TtecDBMemo;
    tstRequisicao: TTabSheet;
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
    dbgRequisicoesItens: TtecDBGrid;
    ckbRequisicoesSemMontador: TCheckBox;
    ckbSelecionarTodos: TCheckBox;
    pnlContrato: TPanel;
    lblFilialdeVenda: TLabel;
    dtxFilialVendaContrato: TtecDBText;
    lblContrato: TLabel;
    dtxContrato: TtecDBText;
    dtxEmissaoContrato: TtecDBText;
    lblEmissaoContrato: TLabel;
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
    procedure sbnProcuraGrupoFilialMontagemClick(Sender: TObject);
    procedure sbnProcuraFilialdeVendaClick(Sender: TObject);
    procedure sbnProcuraGrupoFilialVendaClick(Sender: TObject);
    procedure sbnProcuraClienteClick(Sender: TObject);
    procedure pgcFilialGrupoFilialMontagemChange(Sender: TObject);
    procedure pgcFilialGrupoFilialVendaChange(Sender: TObject);
    procedure actAbilitarUpdate(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnProcuraMontadorClick(Sender: TObject);
    procedure dbgGeracaoRequisicoesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgGeracaoRequisicoesDblClick(Sender: TObject);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure sbnConfirmaClick(Sender: TObject);
    procedure dbgGeracaoRequisicoesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure AfterScrollLinhaColunaGradeRequisicoesItens(Sender: TObject);
    procedure AfterScrollLinhaColunaGradeProdutosContratos(Sender: TObject);
    procedure AfterScrollLinhaColunaGradeProdutosDadosFiscais(Sender: TObject);

  protected
   function  InternoPesquisar(Titulo: String): Integer; override;
   function  JanelaPesquisa: TfrmConsultaBasica; override;
   function  TabelaDePesquisa: TZDataSet; override;
   function  PermitirProcura: Boolean;
   function  TituloPesquisa(Tipo: TipoProcuraRequisicoes): String;
   function  ValidaControles: Boolean;
   procedure GerarRequisicoes;
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
  frmDefinicaoMontador: TfrmDefinicaoMontador;

implementation

{$R *.dfm}
uses fmlerdadosdefinicaomontador;


{ TfrmDefinicaoMontador }

constructor TfrmDefinicaoMontador.Create(AOwner: TComponent);
begin
  dtmDefinicaoMontador:= TdtmDefinicaoMontador.Create(Self);
  inherited;
  edtDataInicial.Text:=datetostr(dtmDefinicaoMontador.DataServidor);
  edtDataFinal.Text:=datetostr(dtmDefinicaoMontador.DataServidor);
  dbgRequisicoesItens.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  dbgRequisicoesItens.Columns[4].Visible := ParSistema.UsarGradesProdutos;
  dtmDefinicaoMontador.OnScrollLinhaColunaGradeRequisicoesItens := AfterScrollLinhaColunaGradeRequisicoesItens;
  dbgProdutosContratos.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutosContratos.Columns[4].Visible := ParSistema.UsarGradesProdutos;
  dtmDefinicaoMontador.OnScrollLinhaColunaGradeProdutosContratos := AfterScrollLinhaColunaGradeProdutosContratos;
  dbgProdutosDadosFiscais.Columns[2].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutosDadosFiscais.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  dtmDefinicaoMontador.OnScrollLinhaColunaGradeProdutosDadosFiscais := AfterScrollLinhaColunaGradeProdutosDadosFiscais;
  pgcGeracaoRequisicoes.ActivePageIndex := 0;  
  dbgRequisicoesItens.Columns[5].Width := length(parsistema.MascaraQuantidade)*7;
  dbgProdutosContratos.Columns[5].Width := length(parsistema.MascaraQuantidade)*7;
  dbgProdutosContratos.Columns[6].Width := length(parsistema.MascaraQuantidade)*7;
  dbgProdutosDadosFiscais.Columns[4].Width := length(parsistema.MascaraQuantidade)*7;

end;

destructor TfrmDefinicaoMontador.Destroy;
begin
  dtmDefinicaoMontador:=nil;
  inherited;
  frmDefinicaoMontador:=nil;
end;

function TfrmDefinicaoMontador.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  result := false;
  with dtmDefinicaoMontador do
  if CtrlOn then
   case tipoprocura of
    tpRequisicoesFiliaisdeMontagem,
    tpRequisicoesFiliaisdeVenda         :result := ExisteFilial(NomeCampo, Value);
    tpRequisicoesGrupoFiliaisdeVenda,
    tpRequisicoesGrupoFiliaisdeMontagem :result := ExisteGrupoFilial(NomeCampo, Value);
    tpRequisicoesClientes               :result := ExisteCliente(NomeCampo, Value);
    tpRequisicoesMontadores             :result := ExisteMontador(NomeCampo, Value);
   end;
end;

procedure TfrmDefinicaoMontador.GerarRequisicoes;
begin
if ValidaControles then
begin
  ckbSelecionarTodos.Checked:=false;
  with dtmDefinicaoMontador do
  begin
   DataInicial           := edtDataInicial.Text;
   DataFinal             := edtDataFinal.Text;
   FilialdeMontagem      := edfFilialMontagem.Text;
   GrupoFilialdeMontagem := edfGrupoFilialMontagem.Text;
   FilialdeVenda         := edfFilialVenda.Text;
   GrupoFilialdeVenda    := edfGrupoFilialVenda.Text;
   Cliente               := edfCliente.Text;
   RequisicaoSemMontador := ckbRequisicoesSemMontador.Checked;
   Montador              := edfMontador.Text;
   qryRequisicoes.Open;
   if not (qryRequisicoes.IsEmpty) then
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

function TfrmDefinicaoMontador.InternoPesquisar(Titulo: String): Integer;
begin
  if PermitirProcura then
  begin
   with dtmDefinicaoMontador do
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

function TfrmDefinicaoMontador.JanelaPesquisa: TfrmConsultaBasica;
var
  Jan: TfrmConsultaPorCampo;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := Not (TipoProcura in [tpRequisicoesClientes]) and CtrlOn;  Result := Janend;
procedure TfrmDefinicaoMontador.KeyDown(var Key: Word; Shift: TShiftState);
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

function TfrmDefinicaoMontador.PermitirProcura: Boolean;
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
    if edfMontador.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesMontadores;
    end;
  end;
end;

function TfrmDefinicaoMontador.TabelaDePesquisa: TZDataSet;
begin
  Result := inherited TabelaDePesquisa;
  with dtmDefinicaoMontador do
  Case tipoprocura of
  tpRequisicoesFiliaisdeMontagem,
  tpRequisicoesFiliaisdeVenda          :result := ConsultaFiliais;
  tpRequisicoesGrupoFiliaisdeMontagem,
  tpRequisicoesGrupoFiliaisdeVenda     :Result := ConsultaGrupoFiliais;
  tpRequisicoesClientes                :result := ConsultaClientes;
  tpRequisicoesMontadores              :result := ConsultaMontadores;
  end;
end;

function TfrmDefinicaoMontador.TituloPesquisa(
  Tipo: TipoProcuraRequisicoes): String;
begin
  Case tipo of
   tpRequisicoesFiliaisdeMontagem      :result := ctFILIAISMONTAGEM;
   tpRequisicoesFiliaisdeVenda         :result := ctFILIAISVENDAS;
   tpRequisicoesGrupoFiliaisdeVenda,
   tpRequisicoesGrupoFiliaisdeMontagem :Result := ctGRUPOFILIAIS;
   tpRequisicoesClientes               :result := ctCLIENTES;
   tpRequisicoesMontadores             :result := ctMONTADORES;
  end;
end;

function TfrmDefinicaoMontador.ValidaControles: Boolean;
begin
  Result := (edtDataInicial.DataValida and edtDataFinal.DataValida);
  if Result then
  begin
   if (not dataembranco(edtDataInicial.text) and not dataembranco(edtDataFinal.text)) then
     Result:=StrToDate(edtDataInicial.Text) <= StrToDate(edtDataFinal.Text);
   if result then
   begin
     Result:=(not dataembranco(edtDataInicial.text) or not dataembranco(edtDataFinal.text));
     if Result then
     begin
      Result:= not (ckbRequisicoesSemMontador.Checked and (edfMontador.Text<> ''));
      if Result then
         Result := OperadorTernario((Trim(edfFilialMontagem.Text) <> ''),edfFilialMontagem.Exist, True) and
                   OperadorTernario((Trim(edfGrupoFilialMontagem.text) <> ''), edfGrupoFilialMontagem.Exist, True) and
                   OperadorTernario((Trim(edfCliente.Text) <> ''), edfCliente.Exist, True) and
                   OperadorTernario((Trim(edfFilialVenda.Text) <> ''), edfFilialVenda.Exist, True) and
                   OperadorTernario((Trim(edfGrupoFilialVenda.text) <> ''), edfGrupoFilialVenda.Exist, True) and
                   OperadorTernario((Trim(edfMontador.Text) <> ''), edfMontador.Exist, True)
      else
       begin
        MensagemAviso(ctAVISOREQUISICAOSEMMONTADOR);
        edfMontador.setfocus;
       end;
     end
     else
     begin
      MensagemAviso(ctDATAINVALIDA);
      edtDataInicial.SetFocus;
     end;
   end
   else
   begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      edtDataInicial.SetFocus;
   end;
  end;
end;

procedure TfrmDefinicaoMontador.sbnProcuraFilialdeMontagemClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfFilialMontagem, ctFILIAISMONTAGEM);
end;

procedure TfrmDefinicaoMontador.sbnProcuraGrupoFilialMontagemClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfGrupoFilialMontagem, ctGRUPOFILIAIS);
end;

procedure TfrmDefinicaoMontador.sbnProcuraFilialdeVendaClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfFilialVenda, ctFILIAISVENDAS);
end;

procedure TfrmDefinicaoMontador.sbnProcuraGrupoFilialVendaClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfGrupoFilialVenda, ctGRUPOFILIAIS);
end;

procedure TfrmDefinicaoMontador.sbnProcuraClienteClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfcliente, ctCLIENTES)
end;

procedure TfrmDefinicaoMontador.pgcFilialGrupoFilialMontagemChange(
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

procedure TfrmDefinicaoMontador.pgcFilialGrupoFilialVendaChange(
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

procedure TfrmDefinicaoMontador.actAbilitarUpdate(Sender: TObject);
begin
  inherited;
  sbnGerar.Enabled    := (pgcGeracaoRequisicoes.ActivePage = tstParametros);
  sbnConfirma.Enabled := (dtmDefinicaoMontador.QtdeMarcados > 0);
end;

procedure TfrmDefinicaoMontador.sbnGerarClick(Sender: TObject);
begin
  inherited;
  GerarRequisicoes
end;

procedure TfrmDefinicaoMontador.sbnProcuraMontadorClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfMontador, ctMONTADORES);
end;

procedure TfrmDefinicaoMontador.dbgGeracaoRequisicoesDrawColumnCell(
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

procedure TfrmDefinicaoMontador.dbgGeracaoRequisicoesDblClick(
  Sender: TObject);
begin
  inherited;
    dtmDefinicaoMontador.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
    AtualizarContadores(True);
end;

procedure TfrmDefinicaoMontador.ckbSelecionarTodosClick(Sender: TObject);
begin
  inherited;
  dtmDefinicaoMontador.MarcarSelecionados(ckbSelecionarTodos.Checked,True);
  AtualizarContadores(True);
end;

procedure TfrmDefinicaoMontador.sbnConfirmaClick(Sender: TObject);
begin
  inherited;
 frmLerDadosDefinicaoMontador := TfrmLerDadosDefinicaoMontador.Create(frmLerDadosDefinicaoMontador);
 if frmLerDadosDefinicaoMontador.ShowModal = mrok then
 begin
  dtmDefinicaoMontador.GerarDefinicaoMontadorRequisicoes;
  GerarRequisicoes;
 end;
 frmLerDadosDefinicaoMontador.Free;
end;

procedure TfrmDefinicaoMontador.dbgGeracaoRequisicoesKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then begin
      dtmDefinicaoMontador.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
      AtualizarContadores(True);
    end;
end;

procedure TfrmDefinicaoMontador.AtualizarContadores(SoMarcados: Boolean);
begin
  with dtmDefinicaoMontador do begin
    if not SoMarcados then
     lblRequisicoesTotal.Caption   := IntToStr(TotalRegistros);
    lblRequisicoesMarcadas.Caption := IntToStr(QtdeMarcados);
  end;
end;

procedure TfrmDefinicaoMontador.AfterScrollLinhaColunaGradeRequisicoesItens(
  Sender: TObject);
begin
 dbgRequisicoesItens.columns[3].title.Caption := dtmDefinicaoMontador.LinhadaGradeRequisicoesItens;
 dbgRequisicoesItens.columns[4].title.caption := dtmDefinicaoMontador.ColunadaGradeRequisicoesItens;
end;

procedure TfrmDefinicaoMontador.AfterScrollLinhaColunaGradeProdutosContratos(
  Sender: TObject);
begin
 dbgProdutosContratos.columns[3].title.Caption := dtmDefinicaoMontador.LinhadaGradeProdutosContratos;
 dbgProdutosContratos.columns[4].title.caption := dtmDefinicaoMontador.ColunadaGradeProdutosContratos;
end;

procedure TfrmDefinicaoMontador.AfterScrollLinhaColunaGradeProdutosDadosFiscais(
  Sender: TObject);
begin
 dbgProdutosDadosFiscais.columns[2].title.Caption := dtmDefinicaoMontador.LinhadaGradeProdutosDadosFiscais;
 dbgProdutosDadosFiscais.columns[3].title.caption := dtmDefinicaoMontador.ColunadaGradeProdutosDadosFiscais;
end;

end.
