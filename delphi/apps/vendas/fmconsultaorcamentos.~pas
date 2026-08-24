unit fmconsultaorcamentos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, DateUtils,
  StdCtrls, ExtCtrls, Buttons, DBCtrls, Mask, Grids, DBGrids, {Qete,} Windows,
  ComCtrls,
  // Terceiros
  ZQuery,
  // Constantes
  ctconstantes, biblio, clparametrossistema,
  // Componentes
  cpdbfindcontrols, cpdata, cpdbgrid, cpdbtext,
  // Repositorio
  fmconsultaporcampo, fmconsultabasica, fmajudabt,
  // Outros
  dmconsultaorcamentos, cpnumero, ActnList, cppagecontrol, cptexto, ToolWin,
  fmPrincipalBasico, fmconsultavendas, clusuario,
  frmultiplaselecaoaleatoria, cpdbradiogroup, TypInfo, variants, db,
  frconsulta, frconsultacodigo;

type
  TfrmConsultaOrcamentos = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    sbnGerar: TSpeedButton;
    sbnCancelar: TSpeedButton;
    gbxCancelamento: TGroupBox;
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    pgcOrcamentos: TtecPageControl;
    tstFiltros: TTabSheet;
    tstRegistros: TTabSheet;
    gbxFiltros: TGroupBox;
    gbxResultados: TGroupBox;
    gbxEmissao: TGroupBox;
    lblEmissaoInicial: TLabel;
    edtEmissaoInicial: TEditData;
    lblEmissaoFinal: TLabel;
    edtEmissaoFinal: TEditData;
    dbgOrcamentos: TtecDBGrid;
    gbxContratos: TGroupBox;
    lblQtdeContratos: TLabel;
    lblQtdeMarcados: TLabel;
    edtQtdeContratos: TEditNumero;
    edtQtdeMarcados: TEditNumero;
    gbxValores: TGroupBox;
    lblTotalContratos: TLabel;
    lblTotalMarcados: TLabel;
    edtTotalContratos: TEditNumero;
    edtTotalMarcados: TEditNumero;
    ckbSelecionarTodos: TCheckBox;
    gbxValidade: TGroupBox;
    lblValidadeInicial: TLabel;
    edtValidadeInicial: TEditData;
    lblValidadeFinal: TLabel;
    edtValidadeFinal: TEditData;
    rgbSituacao: TRadioGroup;
    rgbOrdenacao: TRadioGroup;
    gbxPlanos: TGroupBox;
    sbnImprimir: TSpeedButton;
    sbnOrcamento: TSpeedButton;
    sbnAtendimento: TSpeedButton;
    sbnFichaFinanceira: TSpeedButton;
    sbnConsultaVendas: TSpeedButton;
    sbnAbrirContrato: TSpeedButton;
    rgpMarcadosparanaoligar: TtecDBRadioGroup;
    rbnMarcadosNaoLigar: TtecRadioButton;
    rbnAmbosLigar: TtecRadioButton;
    rbnnaoMarcadosNaoLigar: TtecRadioButton;
    pnlBottom: TPanel;
    gbxAtendimentos: TGroupBox;
    cbbQtAtendimentos: TComboBox;
    sttQtAtendimentos: TStaticText;
    edtQtAtendimentos: TEditNumero;
    gbxDataContrato: TGroupBox;
    lblDataInicialContato: TLabel;
    lblDataFinalContato: TLabel;
    edtDataInicialContato: TEditData;
    edtDataFinalContato: TEditData;
    ckbVisualizarProdutos: TCheckBox;
    dbgProdutos: TtecDBGrid;
    gbxSituacaoProdutos: TGroupBox;
    lblAtendidos: TLabel;
    lblParcialmenteAtendidos: TLabel;
    lblNaoAtendidos: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Splitter1: TSplitter;
    GroupBox1: TGroupBox;
    fraConsultaFilial: TfraConsultaCodigo;
    gbxVendedor: TGroupBox;
    fraConsultaVendedor: TfraConsultaCodigo;
    gbxCliente: TGroupBox;
    fraConsultaCliente: TfraConsultaCodigo;
    lblContem: TLabel;
    edtContem: TEditTexto;
    gbxItem: TGroupBox;
    fraConsultaItemProduto: TfraConsultaCodigo;
    fraConsultaPlano: TfraConsultaCodigo;
    gbxDatadeLembrarem: TGroupBox;
    lblDataLembraremInicial: TLabel;
    lblDataLembraremFinal: TLabel;
    edtDataLembraremInicial: TEditData;
    edtDataLembraremFinal: TEditData;
    gbxIntervaloValorTotal: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    edtValorTotalOrcamentoInicial: TEditNumero;
    edtValorTotalOrcamentoFinal: TEditNumero;
    ckbMesclarOrcamentoseProdutos: TCheckBox;
    fraMultiplaSelecaoAleatoria1: tfraMultiplaSelecaoAleatoria;
    procedure actHabilitarUpdate(Sender: TObject);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure dbgOrcamentosDblClick(Sender: TObject);
    procedure dbgOrcamentosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
              State: TGridDrawState);
    procedure dbgOrcamentosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbnCancelarClick(Sender: TObject); virtual;
    procedure sbnGerarClick(Sender: TObject); virtual;
    procedure sbnVendedorClick(Sender: TObject);
    procedure sbnImprimirClick(Sender: TObject);
    procedure dbgOrcamentosTitleClick(Column: TColumn);
    procedure sbnOrcamentoClick(Sender: TObject);
    procedure sbnAtendimentoClick(Sender: TObject);
    procedure sbnFichaFinanceiraClick(Sender: TObject);
    procedure sbnAbrirContratoClick(Sender: TObject);
    procedure sbnConsultaVendasClick(Sender: TObject);
    procedure ckbVisualizarProdutosClick(Sender: TObject);
    procedure dbgProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  protected
    procedure AtualizarContadores(SoMarcados: Boolean);
    procedure CancelarOrcamentos;
//    function  ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean; Override;
//    function  JanelaPesquisa: TfrmConsultaBasica; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  ValidarCampos: Boolean;
    procedure ZerarContadores;
  private
    vChamadodeOutrosForms: Boolean;
  public
    dtmConsultaOrcamentos: TdtmConsultaOrcamentos;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure   RefazConsulta;
  end;

var
  frmConsultaOrcamentos: TfrmConsultaOrcamentos;
  TipoPesquisa: TtecConsultaOrcamentos;
  Indice: Integer;
  AcionarTelaConsultaOrcamento: procedure (CodigoCliente: integer; TipoCliente: String; DataInicial: String = ''; DataFinal: String = '');

implementation

Uses
  //Projetos
 fmmotivos{, fmcadastrocontratos, fmoperacoescontratos};

{$R *.dfm}

procedure TfrmConsultaOrcamentos.actHabilitarUpdate(Sender: TObject);
begin
  inherited;
  sbnCancelar.Enabled := (dtmConsultaOrcamentos.QtdeMarcados > 0) and (pgcOrcamentos.ActivePageIndex = 1);
  sbnGerar.Enabled    := pgcOrcamentos.ActivePageIndex = 0;
  sbnImprimir.Enabled := (pgcOrcamentos.ActivePageIndex = 1) and (dtmConsultaOrcamentos.QtdeMarcados > 0);
  edtContem.Enabled   := (fraConsultaCliente.edfcodigo.Text = '');
  if not edtContem.Enabled then
    edtContem.Clear;

  if dtmConsultaOrcamentos.qryOrcamentos.recordcount <> 0 then
  begin
    sbnOrcamento.enabled := true;
    sbnAtendimento.enabled := true;
    sbnConsultaVendas.enabled := true;
    sbnFichaFinanceira.enabled := true;

    if not dtmConsultaOrcamentos.qryOrcamentoscontrato.isnull then
      sbnAbrirContrato.enabled := true
    else
      sbnAbrirContrato.enabled := false;
  end
  else
  begin
    sbnOrcamento.enabled := False;
    sbnAtendimento.enabled := False;
    sbnConsultaVendas.enabled := False;
    sbnFichaFinanceira.enabled := False;
    sbnAbrirContrato.enabled := false;
  end;

end;

procedure TfrmConsultaOrcamentos.AtualizarContadores(SoMarcados: Boolean);
begin
  with dtmConsultaOrcamentos do
  begin
    if not SoMarcados then begin
      edtQtdeContratos.Text  := IntToStr(QtdeContratos);
      edtTotalContratos.Text := Format('%8.2m', [TotalContratos]);
    end;
    edtQtdeMarcados.Text  := IntToStr(QtdeMarcados);
    edtTotalMarcados.Text := Format('%8.2m', [TotalMarcados]);
  end;
end;

procedure TfrmConsultaOrcamentos.ckbSelecionarTodosClick(Sender: TObject);
begin
  if dtmConsultaOrcamentos.PodeCancelar then begin
    dtmConsultaOrcamentos.MarcarSelecionados(ckbSelecionarTodos.Checked,True);
    AtualizarContadores(True);
  end;  
end;

constructor TfrmConsultaOrcamentos.Create(AOwner: TComponent);
begin
  inherited;
  dtmConsultaOrcamentos:= TdtmConsultaOrcamentos.Create(Self);

  with dtmConsultaOrcamentos do
  begin
    edtEmissaoInicial.Text := DateToStr(DataServidor - 60);
    edtEmissaoFinal.Text   := DateToStr(DataServidor);
  end;
  Indice:= 1;

  AtualizarContadores(False);

  SetarActivePage(self);

  fraConsultaFilial.TipoPesquisa := pesFILIAIS;
  fraConsultaVendedor.TipoPesquisa    := pesVENDEDORES;
  fraConsultaCliente.TipoCliente := 'C';
  fraConsultaCliente.TipoPesquisa := pesCLIENTES;
  fraConsultaItemProduto.TipoPesquisa := pesITEMPRODUTOS;
  fraConsultaPlano.TipoPesquisa := pesPLANO;
  
end;

procedure TfrmConsultaOrcamentos.dbgOrcamentosDblClick(Sender: TObject);
begin
  if dtmConsultaOrcamentos.PodeCancelar then begin
    dtmConsultaOrcamentos.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
    AtualizarContadores(True);
  end;  
end;

procedure TfrmConsultaOrcamentos.dbgOrcamentosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if dbgOrcamentos.DataSource.DataSet.FieldByName('selecionar').AsBoolean then begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmConsultaOrcamentos.dbgOrcamentosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  inherited;

  if Key = VK_SPACE then
  begin
    if Shift = [ssCtrl] then begin
      if dtmConsultaOrcamentos.PodeCancelar then begin
        dtmConsultaOrcamentos.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
        AtualizarContadores(True);
      end;
    end;
  end;
end;

destructor TfrmConsultaOrcamentos.Destroy;
begin
  if assigned(UsuarioAutAux) then
    freeandnil(UsuarioAutAux);

  dtmConsultaOrcamentos:=nil;
  inherited;
  frmConsultaOrcamentos:= nil;
end;

(*
function TfrmConsultaOrcamentos.ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean;
begin
  with dtmConsultaOrcamentos do
  begin
//    case TipoPesquisa of
    Result:= False;
//    end;
  end;
end;


function TfrmConsultaOrcamentos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(result).ConsultaInterativa := not (TipoPesquisa in [ccoPRODUTOS, ccoCLIENTES]);
end;
*)

procedure TfrmConsultaOrcamentos.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_ESCAPE: begin
                  dtmConsultaOrcamentos.FecharConsultaOrcamentos;
                  pgcOrcamentos.ActivePageIndex:= 0;
                  fraConsultaFilial.edfcodigo.SetFocus;
                  AtualizarContadores(False);
                end;
       VK_F6 : if not CtrlOn and sbnGerar.Enabled then sbnGerar.Click;
       VK_F7 : if not CtrlOn and sbnCancelar.Enabled then sbnCancelar.Click;
       VK_F11: if not CtrlOn and sbnImprimir.Enabled then
                   sbnImprimir.Click;

       VK_X :  begin
                 if activecontrol = dbgOrcamentos then
                 begin
                   if CtrlOn or (Shift = [ssCtrl])  then
                   begin
                     if ckbMesclarOrcamentoseProdutos.checked then
                       dbgOrcamentos.gridassociado := dbgProdutos
                     else
                       dbgOrcamentos.gridassociado := nil;
                   end;
                 end;
               end;
  end;
end;

procedure TfrmConsultaOrcamentos.CancelarOrcamentos;
var
  Cancelar, Res: Boolean;
  Msg: String;
begin
  Res:= True;
  if ParSistema.ExclusaoOrcamento = exoCANCELAR then
    Cancelar:= True
  else begin
    if ParSistema.ExclusaoOrcamento = exoPERGUNTAR then begin
      Cancelar:= MensagemConfirmacao(ctCANCELARORCAMENTO) = smbCANCEL;
      if not Cancelar then begin
        Msg := Format(ctCONFIRMEEXCLUIR, ['o(s) orçamento(s)']);
        Res := MensagemConfirmacao(Msg) = smbOk;
      end
    end else begin
      Cancelar:= False;
      Msg := Format(ctCONFIRMEEXCLUIR, ['o(s) orçamento(s)']);
      Res := MensagemConfirmacao(Msg) = smbOk;
    end
  end;
  if Res then begin
    if Cancelar then begin
      dtmConsultaOrcamentos.Abre(ctTabelasConsultaMotivos);
      frmMotivos := TfrmMotivos.Create(frmMotivos, 'Cancelamentos do orçamento', dtmConsultaOrcamentos.ConsultarMotivos, true);
      Res:= frmMotivos.ShowModal = mrOK;
      dtmConsultaOrcamentos.TextoCancelamento := frmMotivos.mmoTexto.text;
      frmMotivos.free;
    end;
    if Res then
      dtmConsultaOrcamentos.CancelarOrcamentos(Cancelar);
  end;
end;

procedure TfrmConsultaOrcamentos.sbnCancelarClick(Sender: TObject);
begin
  CancelarOrcamentos;
  AtualizarContadores(False);
end;

procedure TfrmConsultaOrcamentos.sbnGerarClick(Sender: TObject);
begin
  if ValidarCampos then begin
    with dtmConsultaOrcamentos do begin
      Filial          := fraConsultaFilial.edfcodigo.Text;
      Vendedor        := fraConsultaVendedor.edfcodigo.Text;
      Cliente         := fraConsultaCliente.edfCodigo.Text;
      Contem          := edtContem.Text;
      Produto         := fraConsultaItemProduto.edfCodigo.Text;
      Plano           := fraConsultaPlano.edfcodigo.Text;
      EmissaoInicial  := edtEmissaoInicial.Text;
      EmissaoFinal    := edtEmissaoFinal.Text;
      ValidadeInicial := edtValidadeInicial.Text;
      ValidadeFinal   := edtValidadeFinal.Text;
      Situacao        := rgbSituacao.ItemIndex;

      ListaItemProdutos := fraMultiplaSelecaoAleatoria1.fraSelecaoAleatoriaItemdeProdutos.ListaCondicional;
      ListaProdutos     := fraMultiplaSelecaoAleatoria1.fraSelecaoAleatoriaprodutos.ListaCondicional;
      ListaGrupos       := fraMultiplaSelecaoAleatoria1.fraSelecaoaleatoriagruposprodutos.ListaCondicional;
      ListaClasses      := fraMultiplaSelecaoAleatoria1.fraSelecaoaleatoriaclassesprodutos.ListaCondicional;
      ListaMarcas       := fraMultiplaSelecaoAleatoria1.fraSelecaoAleatoriamarcasProdutos.ListaCondicional;
      ListaCondicionalPromocoes := fraMultiplaSelecaoAleatoria1.fraSelecaoaleatoriapromocoes.ListaCondicional;


      Marcadosparanaoligar := rgpMarcadosparanaoligar.ItemIndex;

      if edtQtAtendimentos.text = '' then
         QtAtendimentos := '0'
      else
        QtAtendimentos := cbbQtAtendimentos.text + edtQtAtendimentos.text;

      DataContatoInicial  := edtDataInicialContato.Text;
      DataContatoFinal    := edtDataFinalContato.Text;

      DataLembraremInicial  := edtDataLembraremInicial.Text;
      DataLembraremFinal    := edtDataLembraremFinal.Text;


      ValorTotalOrcamentoInicial := edtValorTotalOrcamentoInicial.Text;
      ValorTotalOrcamentoFinal := edtValorTotalOrcamentoFinal.Text;


      Ordenacao       := rgbOrdenacao.ItemIndex;
      if AbrirConsultaOrcamento then
      begin
        MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['orçamento']));
        pgcOrcamentos.ActivePageIndex:= 0;
        fraConsultaFilial.edfcodigo.SetFocus;
      end
      else begin
        pgcOrcamentos.ActivePageIndex:= 1;
        dbgOrcamentos.SetFocus;
      end;
      AtualizarContadores(False);
    end;
  end;
end;

procedure TfrmConsultaOrcamentos.sbnVendedorClick(Sender: TObject);
begin
  CtrlOn:= True;
  fraConsultaVendedor.edfcodigo.SetFocus;
  InternoPesquisar('');
end;

function TfrmConsultaOrcamentos.ValidarCampos: Boolean;
begin
  Result:= edtEmissaoInicial.Criticar(False)  and
           edtEmissaoFinal.Criticar(False)    and
           edtValidadeInicial.Criticar(False) and
           edtValidadeFinal.Criticar(False);
end;

procedure TfrmConsultaOrcamentos.ZerarContadores;
begin
  fraConsultaFilial.edfcodigo.SetFocus;
  edtQtdeContratos.Clear;
  edtQtdeMarcados.Clear;
  edtTotalContratos.Clear;
  edtTotalMarcados.Clear;
end;

procedure TfrmConsultaOrcamentos.RefazConsulta;
begin
  dtmConsultaOrcamentos.AbrirConsultaOrcamento
end;



procedure TfrmConsultaOrcamentos.sbnImprimirClick(Sender: TObject);
begin
  inherited;
  dtmConsultaOrcamentos.ImprimirOrcamento;
end;

procedure TfrmConsultaOrcamentos.dbgOrcamentosTitleClick(Column: TColumn);
begin
  inherited;
  if AltOn then
  begin
    case Column.Index of
      4: begin
           if Indice < 3 then Indice:= 3
           else               Indice:= 2;
           case Indice of
             1: begin
                  dbgOrcamentos.Columns[04].Title.Caption := 'Nome...';
                  dbgOrcamentos.Columns[04].FieldName     := 'nome';
                end;
             2: begin
                  dbgOrcamentos.Columns[04].Title.Caption := 'Contrato...';
                  dbgOrcamentos.Columns[04].FieldName     := 'contrato';
                end;
           end;
         end;
    end;
  end;  
end;

procedure TfrmConsultaOrcamentos.sbnOrcamentoClick(Sender: TObject);
begin
  inherited;
  if dtmConsultaOrcamentos.qryOrcamentos.recordcount <> 0 then
    TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado(['Open',dtmConsultaOrcamentos.qryOrcamentoscodigo.asinteger], 'TfrmOrcamentos', True)
end;

procedure TfrmConsultaOrcamentos.sbnAtendimentoClick(Sender: TObject);
begin
  inherited;
  if dtmConsultaOrcamentos.qryOrcamentos.recordcount <> 0 then
    TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado(['AbrirUltimoAtendimento',
                                                                   dtmConsultaOrcamentos.qryOrcamentosCliente.asInteger,
                                                                   dtmConsultaOrcamentos.qryOrcamentosTipoCliente.asString], 'TfrmCadastroAtendimento', True);
end;

procedure TfrmConsultaOrcamentos.sbnFichaFinanceiraClick(Sender: TObject);
begin
  inherited;
  if dtmConsultaOrcamentos.qryOrcamentos.recordcount <> 0 then
    TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmConsultaOrcamentos.qryOrcamentosCliente.asInteger,
                                                                   dtmConsultaOrcamentos.qryOrcamentosTipoCliente.asString,
                                                                   ClassName, True, false],
                                                                   'TfrmFichaFinanceira', True)
end;

procedure TfrmConsultaOrcamentos.sbnAbrirContratoClick(Sender: TObject);
begin
  inherited;
  if not dtmConsultaOrcamentos.qryOrcamentoscontrato.isnull then
    TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmConsultaOrcamentos.qryOrcamentoscontrato.asString,
                                                                   ClassName], 'TfrmCadastroContratos', True);

end;

procedure TfrmConsultaOrcamentos.sbnConsultaVendasClick(Sender: TObject);
begin
  inherited;
  AcionarTelaConsultaVendas(dtmConsultaOrcamentos.qryOrcamentosCliente.asInteger,
                            dtmConsultaOrcamentos.qryOrcamentosTipoCliente.asString);
end;

procedure TfrmConsultaOrcamentos.ckbVisualizarProdutosClick(
  Sender: TObject);
begin
  inherited;
  if ckbVisualizarProdutos.Checked then
  begin
    dtmConsultaOrcamentos.visualizandoprodutos := true;
    ckbMesclarOrcamentoseProdutos.visible := true;
//    ckbMesclarOrcamentoseProdutosClick(nil);
    dbgOrcamentos.Align := alTop;
    dbgOrcamentos.Height := 231;
    Splitter1.visible := true;
    dbgprodutos.Visible := true;
    dbgprodutos.Align := alClient;
    gbxSituacaoProdutos.Visible := true;
//    dtmConsultaOrcamentos.AbrirProdutos;
  end
  else
  begin
    dtmConsultaOrcamentos.visualizandoprodutos := false;
    ckbMesclarOrcamentoseProdutos.visible := false;
    Splitter1.visible := false;
    dbgprodutos.Visible := false;
    dbgOrcamentos.Align := alClient;
    gbxSituacaoProdutos.Visible := false;
  end;
end;

procedure TfrmConsultaOrcamentos.dbgProdutosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if datacol = 1 then
  begin
    if dbgProdutos.DataSource.DataSet.FieldByName('situacao_produto').AsString = 'A' then
      TDBGrid(Sender).Canvas.Font.Color := clGreen
    else
    if dbgProdutos.DataSource.DataSet.FieldByName('situacao_produto').AsString = 'P' then
      TDBGrid(Sender).Canvas.Font.Color := $000080FF
    else
    if dbgProdutos.DataSource.DataSet.FieldByName('situacao_produto').AsString = 'N' then
      TDBGrid(Sender).Canvas.Font.Color := clRed;

    TDBGrid(Sender).Canvas.Font.Style := [fsBold];
   TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

end;


procedure AcionarTelaConsultaOrcamento_(CodigoCliente: integer; TipoCliente: String; DataInicial: String = ''; DataFinal: String = '');
var
 i: integer;
begin
 //  if not assigned(frmConsultaCompras) then
  if (codigocliente<>0) and (tipocliente<>'') then
  begin
    frmConsultaOrcamentos := TfrmConsultaOrcamentos.create(frmConsultaOrcamentos);
//    frmConsultaVendas.windowstate := wsNormal;

//    with frmConsultaOrcamentos do
//    begin
  //    sbnGerarClick(frmconsultaVendas);
      frmConsultaOrcamentos.dbgOrcamentos.datasource := frmConsultaOrcamentos.dtmConsultaOrcamentos.dsrOrcamentos;
      frmConsultaOrcamentos.dbgProdutos.datasource := frmConsultaOrcamentos.dtmConsultaOrcamentos.dsrProdutosOrcamentos;

      frmConsultaOrcamentos.fraConsultaFilial.edfcodigo.DataSource := frmConsultaOrcamentos.fraConsultaFilial.dsrProcuraFiliais;
      frmConsultaOrcamentos.fraConsultaFilial.dtxDescricao.DataSource := frmConsultaOrcamentos.fraConsultaFilial.dsrProcuraFiliais;

      frmConsultaOrcamentos.fraConsultaVendedor.edfcodigo.DataSource := frmConsultaOrcamentos.fraConsultaVendedor.dsrProcuraVendedores;
      frmConsultaOrcamentos.fraConsultaVendedor.dtxDescricao.DataSource := frmConsultaOrcamentos.fraConsultaVendedor.dsrProcuraVendedores;

      frmConsultaOrcamentos.fraConsultaCliente.edfCodigo.DataSource := frmConsultaOrcamentos.fraConsultaCliente.dsrProcuraCliente;
      frmConsultaOrcamentos.fraConsultaCliente.dtxDescricao.DataSource := frmConsultaOrcamentos.fraConsultaCliente.dsrProcuraCliente;

      frmConsultaOrcamentos.fraConsultaItemProduto.edfCodigo.DataSource := frmConsultaOrcamentos.fraConsultaItemProduto.dsrProcuraItemProdutos;
      frmConsultaOrcamentos.fraConsultaItemProduto.dtxDescricao.DataSource := frmConsultaOrcamentos.fraConsultaItemProduto.dsrProcuraItemProdutos;

      frmConsultaOrcamentos.fraConsultaPlano.edfcodigo.DataSource := frmConsultaOrcamentos.fraConsultaPlano.dsrProcuraPlano;
      frmConsultaOrcamentos.fraConsultaPlano.dtxDescricao.DataSource := frmConsultaOrcamentos.fraConsultaPlano.dsrProcuraPlano;

      frmConsultaOrcamentos.fraConsultaCliente.edfCodigo.text := inttostr(codigocliente);
      frmConsultaOrcamentos.fraConsultaCliente.edfCodigo.exist;

      if DataInicial<>'' then
        frmConsultaOrcamentos.edtEmissaoInicial.text := DataInicial;

      if DataFinal<>'' then
        frmConsultaOrcamentos.edtEmissaoFinal.Text := DataFinal;

      frmConsultaOrcamentos.rgbSituacao.itemindex := 3;

      frmConsultaOrcamentos.BringToFront;
      frmConsultaOrcamentos.vchamadodeOutrosForms := true;
      frmConsultaOrcamentos.sbnGerarClick(nil);
//    end;
  end;

end;


initialization
   AcionarTelaConsultaOrcamento :=  AcionarTelaConsultaOrcamento_;


end.
