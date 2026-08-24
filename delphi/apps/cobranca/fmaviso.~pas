unit fmaviso;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmajudabt, ExtCtrls, Buttons, StdCtrls, CheckLst, DBCtrls, Mask,
  ComCtrls, Grids, DBGrids, DB, Windows,
  // Terceiros
  ZQuery,
  // Constantes
  ctconstantes, biblio,
  // Componentes
  cpdbdata, cpnumero, cptexto, cpdbfindcontrols, cpdbgrid, cpdbtext, cppagecontrol,
  // Repositorio
  fmconsultabasica, fmconsultaporcampo, fmcadastropadrao, ZPgSqlQuery,
  cpquery, fmrelatoriopadrao, cpdata, frendereco, clparametrossistema,
  frcgcoucpf, ToolWin;

type
  TfrmAviso = class(TfrmRelatorioPadrao)
    sbnGerar: TSpeedButton;
    pgcGeracaoCartas: TPageControl;
    tstGeracao: TTabSheet;
    tstGerenciarCartas: TTabSheet;
    gbxAvisos: TGroupBox;
    sbnMarcarAvisos: TSpeedButton;
    sbnDesmarcarAvisos: TSpeedButton;
    dbgTiposCartas: TtecDBGrid;
    dtxModeloArquivo: TtecDBText;
    dtxArquivoExportar: TtecDBText;
    dtxModeloEtiqueta: TtecDBText;
    gbxFiliais: TGroupBox;
    sbnMarcarFiliais: TSpeedButton;
    sbnDesmarcarFiliais: TSpeedButton;
    clbFiliais: TCheckListBox;
    sbnExcluir: TSpeedButton;
    dtxTipoEndereco: TtecDBText;
    pgcCartas: TPageControl;
    tstParametros: TTabSheet;
    tstCartas: TTabSheet;
    dbgCartas: TtecDBGrid;
    dbgParcelasCartas: TtecDBGrid;
    gbxContratos: TGroupBox;
    dtxAvalista: TtecDBText;
    dtxclientecarta: TtecDBText;
    dtxTipoCliente: TtecDBText;
    dtxcodigoclienteCarta: TtecDBText;
    dtxCodigoAvalsita: TtecDBText;
    dtxTotalemAberto: TtecDBText;
    dtxQtdeemAtraso: TtecDBText;
    lblCartasTotal: TLabel;
    lblCartasMarcadas: TLabel;
    ckbSelecionarTodos: TCheckBox;
    dtxBloqueada: TtecDBText;
    dtxSituacao: TtecDBText;
    lblCartaDevolvida: TLabel;
    shCartaDevolvida: TShape;
    fraEnderecoDadosCliente: TfraEndereco;
    sbnPesquisarFilial: TSpeedButton;
    sbnPesquisarCliente: TSpeedButton;
    edfTipoCarta: TtecDbEditFind;
    gbxPeriodo: TGroupBox;
    edtInicial: TEditData;
    edtFinal: TEditData;
    dtxTipoCarta: TtecDBText;
    edfCodigoCliente: TtecDbEditFind;
    dtxCliente: TtecDBText;
    gbxFiliaisSelecao: TGroupBox;
    sbnMarcarFiliaisSelecao: TSpeedButton;
    sbnDesmarcarFiliaisSelecao: TSpeedButton;
    clbFiliaisSelecao: TCheckListBox;
    gbxSelecionar: TGroupBox;
    ckbCartasNaoEnviadas: TCheckBox;
    ckbCartasEnviadasnaoConfirmadas: TCheckBox;
    ckbCartasBloqueadas: TCheckBox;
    ckbCartasValidas: TCheckBox;
    SpeedButton1: TSpeedButton;
    fracgcoucpf: Tfracgcoucpf;
    gbxModeloAviso: TGroupBox;
    gbxModeloEtiqueta: TGroupBox;
    gbxArquivoExportar: TGroupBox;
    gbxTipoCarta: TGroupBox;
    gbxQueCliente: TGroupBox;
    lblAPeriodo: TLabel;
    gbxTotalAtraso: TGroupBox;
    gbxNrParcelas: TGroupBox;
    gbxAvalista: TGroupBox;
    gbxClienteCarta: TGroupBox;
    gbxNrCartas: TGroupBox;
    gbxMarcadas: TGroupBox;
    procedure sbnMarcarFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarFiliaisClick(Sender: TObject);
    procedure sbnmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure sbnMarcarAvisosClick(Sender: TObject);
    procedure sbnDesmarcarAvisosClick(Sender: TObject);
    procedure dbgTiposCartasDblClick(Sender: TObject);
    procedure dbgTiposCartasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure clbGrupodeFiliaisClickCheck(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnPesquisarFilialClick(Sender: TObject);
    procedure edtFinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgCartasDblClick(Sender: TObject);
    procedure dbgCartasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgCartasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure sbnExcluirClick(Sender: TObject);
    procedure sbnPesquisarClienteClick(Sender: TObject);
    procedure ckbCartasEnviadasnaoConfirmadasClick(Sender: TObject);
    procedure ckbCartasNaoEnviadasClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure fracgcoucpfrgbTipoPessoaChange(Sender: TObject);
  private
    procedure AtualizarContadores(SoMarcados: Boolean);
  protected
    function  InternoPesquisar(Titulo: String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    procedure InternoImpressao; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function PesquisaHabilitada: Boolean;
    function TituloPesquisa: String;
    procedure GerarAviso;
    procedure ObterLista(Origem: TStrings; Destino: TCheckListBox);
    function VerificaCampos: Boolean;
    function AcionaSituacaoCarta: Boolean;
    procedure MarcarFilialBase(Habilitar: Boolean);
  end;

var
  frmAviso: TfrmAviso;
  TipoPesquisa: TtecPesquisa;


implementation

uses dmaviso, DateUtils, fmlerdadosopcaoavisos, fmsituacaocarta,
fmselecionarimpressoras;


{$R *.dfm}

function TfrmAviso.PesquisaHabilitada: Boolean;
begin
  Result:= False;
  if (CtrlOn) and (ActiveControl is TtecDBEditFind) then
  begin
    if edfCodigoCliente.Focused then
      TipoPesquisa := pesCLIENTES
    else
     if edfTipoCarta.Focused then
       TipoPesquisa := pesTIPOCARTAS;
    Result:= True;
  end;
end;


function TfrmAviso.TituloPesquisa: String;
begin
  case TipoPesquisa of
     pesNENHUMA      : Result:= 'Avisos';
     pesGRUPOSFILIAIS: Result:= 'Grupos Filiais';
     pesFILIAIS      : Result:= 'Filiais';
  end;
end;

constructor TfrmAviso.Create(AOwner: TComponent);
begin
  dtmAviso:= TdtmAviso.Create(Self);
  inherited;
  dtmAviso.Abre(cttabelas);
  ObterLista(dtmAviso.ListaFiliais, clbFiliais);
  ObterLista(dtmAviso.ListaFiliais, clbFiliaisSelecao);
  MarcarFilialBase(false);
  sbnImprimir.Enabled := False;
  sbnExcluir.Enabled := False;
  pgcGeracaoCartas.ActivePageIndex := 0;
  pgcCartas.ActivePageIndex := 0;

  if dtmAviso.TabelaAvisos.IsEmpty then
  begin
   mensagemaviso(format(ctTABELAVAZIA, [ANSIUpperCase(ctTIPOSDECARTA)]));
   close;
  end;
end;

destructor TfrmAviso.Destroy;
begin
  dtmAviso.Fecha(ctTabelas);
  inherited;
  frmAviso := nil;
end;

procedure TfrmAviso.ObterLista(Origem: TStrings; Destino: TCheckListBox);
begin
  Destino.Items.AddStrings(Origem);
end;

procedure TfrmAviso.sbnMarcarFiliaisClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais, True);
end;

procedure TfrmAviso.sbnDesmarcarFiliaisClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais, False);
end;

procedure TfrmAviso.sbnmarcarGrupodeFiliaisClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais, False);
end;

procedure TfrmAviso.sbnMarcarAvisosClick(Sender: TObject);
begin
  inherited;
  dtmAviso.MarcarTipoCartaSelecionados(True,True);
end;

procedure TfrmAviso.sbnDesmarcarAvisosClick(Sender: TObject);
begin
  inherited;
  dtmAviso.MarcarTipoCartaSelecionados(False,True);
end;

procedure TfrmAviso.dbgTiposCartasDblClick(Sender: TObject);
begin
  inherited;
  dtmAviso.MarcarTipoCartaSelecionados(False, False);
end;

procedure TfrmAviso.dbgTiposCartasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then
      dtmAviso.MarcarTipoCartaSelecionados(False, False);
end;

procedure TfrmAviso.InternoImpressao;
var
  Imp: String;
begin
  inherited;
  frmLerDadosOpcaoAvisos := TfrmLerDadosOpcaoAvisos.Create(frmLerDadosOpcaoAvisos);
  if frmLerDadosOpcaoAvisos.ShowModal = mrok then
   begin
    dtmAviso.OpcaoAvisosCartas := frmLerDadosOpcaoAvisos.rgpOpcoesAvisos.ItemIndex;
    case dtmAviso.OpcaoAvisosCartas of
       0: begin
           dtmAviso.DataHoraGravacao := '';
           dtmAviso.CartaNaoImpressa := ckbCartasNaoEnviadas.Checked;
           dtmAviso.CartaEnviadaNaoConfirmada := ckbCartasEnviadasnaoConfirmadas.Checked;
           dtmAviso.CartaBloqueada := ckbCartasBloqueadas.Checked;
           dtmAviso.ImprimirCartas;
           AtualizarContadores(false);
           ckbSelecionarTodos.Checked := false;
          end;
       1: dtmAviso.ImprimirEtiquetas;
       2: begin
            frmSelecionarImpressoras := TfrmSelecionarImpressoras.Create(frmSelecionarImpressoras, ' ');
            try
              if frmSelecionarImpressoras.ShowModal = mrok then begin
                Imp := frmSelecionarImpressoras.NomeImpressora;
                dtmaviso.NCopiasEtiquetaTexto :=  frmLerDadosOpcaoAvisos.edtNCopias.ValorSemFormatacao;
                dtmAviso.ImprimirEtiquetasTexto(Imp);
              end else
                MensagemAviso(ctSELECIONARIMPRESSORA)
            finally
              frmSelecionarImpressoras.Free;
            end
          end;
       3: begin
           dtmAviso.DataHoraGravacao := '';
           dtmAviso.CartaNaoImpressa := ckbCartasNaoEnviadas.Checked;
           dtmAviso.ExportarArquivo;
           AtualizarContadores(false);
           ckbSelecionarTodos.Checked := false;
          end;
    end;
   end;
   frmLerDadosOpcaoAvisos.free;
end;

procedure TfrmAviso.clbGrupodeFiliaisClickCheck(Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais, False);
end;

procedure TfrmAviso.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if pgcGeracaoCartas.ActivePage = tstGeracao then
  begin
    MarcarFilialBase(False);
    GerarAviso;
  end
  else
   if VerificaCampos then
   begin
    dtmAviso.MontarFiltroFiliais(clbFiliaisSelecao);
    if not dtmAviso.GerarConsultaCartas(edfCodigoCliente.Text,
                                 edfTipoCarta.Text,
                                   edtInicial.text,
                                     edtFinal.text,
                     ckbCartasValidas.Checked,
                     ckbCartasNaoEnviadas.Checked,
                     ckbCartasBloqueadas.Checked,
                     ckbCartasEnviadasnaoConfirmadas.Checked
                     ) then


      MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']))
    else
    begin
     ckbSelecionarTodosClick(self);
     pgcCartas.ActivePage := tstCartas;
    end;
   end;
end;

procedure TfrmAviso.sbnPesquisarFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  ActiveControl := edfTipoCarta;
  InternoPesquisar(ctTIPOSDECARTA);
end;

function TfrmAviso.VerificaCampos: Boolean;
begin
   Result := (edtInicial.DataValida and edtFinal.DataValida);
   if Result then
   begin
    if (not dataembranco(edtInicial.text) and not dataembranco(edtFinal.text)) then
      Result:=StrToDate(edtInicial.Text) <= StrToDate(edtFinal.Text);
    if result then
    begin
      Result:=(not dataembranco(edtInicial.text) or not dataembranco(edtFinal.text))
               or ckbCartasNaoEnviadas.Checked;
      if Result then
      begin
        if (Trim(edfTipoCarta.Text) <> '') then
          Result := OperadorTernario((Trim(edfTipoCarta.Text) <> ''), edfTipoCarta.Exist, True)
      end
      else
      begin
       MensagemAviso(ctPARAMETROSINEXISTENTES);
       edtInicial.SetFocus;
      end;
    end
    else
    begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      edtInicial.SetFocus;
    end;
   end;
end;

procedure TfrmAviso.edtFinalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if TeclaEnterouReturn(Key) and (Shift = []) then
    sbnGerar.Click;
end;

function TfrmAviso.AcionaSituacaoCarta: Boolean;
begin
  frmSituacaoCarta := TfrmSituacaoCarta.Create(frmSituacaoCarta);
  frmSituacaoCarta.SetDataModulo(dtmAviso);
  frmSituacaoCarta.DataSet := dtmAviso.TabelaCartas;
  dtmAviso.qryCartas.Edit;
  frmSituacaoCarta.ShowModal;
  frmSituacaoCarta.free;
  Result := True;
  AtualizarContadores(True);
end;

procedure TfrmAviso.dbgCartasDblClick(Sender: TObject);
begin
  inherited;
  dtmAviso.MarcarCartasSelecionadas(ckbSelecionarTodos.Checked, False);
  AtualizarContadores(True);
end;

procedure TfrmAviso.dbgCartasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if not (gdFocused in State) then begin
   if dbgCartas.DataSource.DataSet.FieldByName('marcar').AsBoolean then
//    if dtmAviso.qryCartasmarcar.AsBoolean then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
      TDBGrid(Sender).Canvas.Font.Color := clBlack;
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
    if (dbgCartas.DataSource.DataSet.FieldByName('voltou').AsString<>'') then
//    if dtmAviso.qryCartasvoltou.AsString<>'' then
    begin
      TDBGrid(Sender).Canvas.Font.Color := clRed;
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;
end;

procedure TfrmAviso.dbgCartasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then begin
      dtmAviso.MarcarCartasSelecionadas(ckbSelecionarTodos.Checked, False);
      AtualizarContadores(True);
    end;
  if (Key = VK_F2) then
    if (Shift = [ssCtrl]) then     if not dtmAviso.TabelaCartasVazia then
      if dtmAviso.CartaPodeEditar then
        AcionaSituacaoCarta
      else
        MensagemAviso(ctCARTANAOIMPRESSA);
end;

procedure TfrmAviso.ckbSelecionarTodosClick(Sender: TObject);
begin
  inherited;
  dtmAviso.MarcarCartasSelecionadas(ckbSelecionarTodos.Checked,True);
  AtualizarContadores(false);
end;

procedure TfrmAviso.AtualizarContadores(SoMarcados: Boolean);
begin
  with dtmAviso do
  begin
   if not SoMarcados then
    lblCartasTotal.Caption   := IntToStr(TotalRegistros);
   lblCartasMarcadas.Caption := IntToStr(QtdeMarcados);
   sbnImprimir.Enabled := QtdeMarcados<>0;
   sbnExcluir.Enabled  := sbnImprimir.Enabled;
  end;
end;

procedure TfrmAviso.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
       VK_F5: if not CtrlOn then
                  sbnGerar.Click;
       VK_F6: if not CtrlOn and sbnexcluir.Enabled then
                  sbnExcluir.click;
       VK_F7: if not CtrlOn and sbnImprimir.Enabled then
                  sbnImprimir.click;
  end;
  inherited;
end;

procedure TfrmAviso.sbnExcluirClick(Sender: TObject);
begin
  inherited;
  dtmAviso.ExcluirCartasMarcadas;
  AtualizarContadores(false);
end;

function TfrmAviso.ExisteInformacao(Parametro: Integer; NomeCampo: String;
  Value: Variant): Boolean;
begin
  result := false;
  with dtmAviso do
    case TipoPesquisa of
      pesCLIENTES : result := ExisteCliente(NomeCampo, Value);
      pesTIPOCARTAS : result := ExisteTipoCarta(NomeCampo, Value);
    end;
end;

function TfrmAviso.InternoPesquisar(Titulo: String): Integer;
begin
  if PesquisaHabilitada then
    with dtmAviso do
    begin
      AbreTabelaPesquisa(TipoPesquisa);
      Result := inherited InternoPesquisar(TituloPesquisa);
      if Result = mrOK then
        Selecionar(TipoPesquisa);
      FechaTabelaPesquisa(TipoPesquisa);
    end
  else
    Result := 0;

end;

function TfrmAviso.JanelaPesquisa: TfrmConsultaBasica;
var
  Jan: TfrmConsultaPorCampo;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := Not (TipoPesquisa in [pesCLIENTES]) and CtrlOn;
  Result := Jan
end;


function TfrmAviso.TabelaDePesquisa: TZDataSet;
begin
  Result := inherited TabelaDePesquisa;
  with dtmAviso do
  Case TipoPesquisa of
   pesCLIENTES  : Result := ConsultaClientes;
   pesTIPOCARTAS : Result := ConsultarTiposCartas;
  end;
end;

procedure TfrmAviso.MarcarFilialBase(Habilitar: Boolean);
var
 I: integer;
begin
 if not parsistema.ControleSPCCentralizado then
 begin
   for I := 0 to dtmAviso.ListaFiliais.Count -1 do
    if (dtmAviso.FilialBase = integer(dtmAviso.ListaFiliais.Objects[I])) then
    begin
     clbFiliais.Checked[I] := True;
     clbFiliaisSelecao.Checked[I] := True;
    end
    else
    begin
      clbFiliais.Checked[I] := False;
      clbFiliaisSelecao.Checked[I] := False;
    end;

    clbFiliais.Enabled := habilitar;
    sbnMarcarFiliais.Enabled := habilitar;
    sbnDesmarcarFiliais.Enabled := habilitar;
 end;
end;

procedure TfrmAviso.sbnPesquisarClienteClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  ActiveControl := edfCodigoCliente;
  InternoPesquisar(edfCodigoCliente, ctCLIENTES);
end;

procedure TfrmAviso.GerarAviso;
begin
 with dtmAviso do
   begin
    DataHoraGravacao := DateTimeToStr(now());
    MontarFiltroFiliais(clbFiliais);
    MontarFiltroAviso;
    if GerarCartas then
    begin
     edfTipoCarta.text := '';
     edfCodigoCliente.Text := '';
     edtInicial.text := datetostr(date());
     edtFinal.text := datetostr(date());
     ckbCartasNaoEnviadas.Checked := True;
     ckbCartasBloqueadas.Checked := false;
     ckbCartasEnviadasnaoConfirmadas.Checked := False;
     pgcGeracaoCartas.ActivePage := tstGerenciarCartas;
     sbnGerar.Click;
    end
    else
      MensagemAviso(ctNAOEXISTEMAVISOS);
   end;
end;

procedure TfrmAviso.ckbCartasEnviadasnaoConfirmadasClick(Sender: TObject);
begin
  inherited;
  ckbCartasNaoEnviadas.Checked := false;
end;

procedure TfrmAviso.ckbCartasNaoEnviadasClick(Sender: TObject);
begin
  inherited;
    ckbCartasEnviadasnaoConfirmadas.Checked := false;
end;

procedure TfrmAviso.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if not dtmAviso.TabelaCartasVazia then
    if dtmAviso.CartaPodeEditar then
      AcionaSituacaoCarta
    else
      MensagemAviso(ctCARTANAOIMPRESSA);
end;

procedure TfrmAviso.fracgcoucpfrgbTipoPessoaChange(Sender: TObject);
begin
  inherited;
  if Assigned(fracgcoucpf) and Assigned(dtmAviso) then
    fracgcoucpf.edtCPFCNPJ.Tipo:= dtmAviso.qryCartaspessoatipo.AsString;
end;

end.
