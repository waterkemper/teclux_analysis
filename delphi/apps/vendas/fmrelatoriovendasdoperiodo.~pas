unit fmrelatoriovendasdoperiodo;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cpdata, DBCtrls, cpdbtext, Mask,
  cpdbfindcontrols, ComCtrls, cppagecontrol, ExtCtrls, Buttons,
  ctconstantes, biblio, cpdbradiogroup,
  cpeditioncontrolvalidation, fmrelatoriopadrao, ZQuery,
  fmconsultabasica,
  fmconsultaporcampo, CheckLst, cpnumero, DB, ZPgSqlQuery, cpquery,
  frlistagruposfiliais, frlistafiliais, ToolWin, frselecaoaleatoria,
  frConsultaCodigo, windows, frselecaoaleatoriausuarios, fmpreviewpadrao,
  frselecaoaleatoriagruposusuarios, Grids, AdvObj, BaseGrid, AdvGrid,
  DBAdvGrid, Menus, AdvMenus, tmsAdvGridExcel;

type
  TfrmRelatorioVendasdoPeriodo = class(TfrmRelatorioPadrao)
    gbxvendasdoperiodo: TGroupBox;
    gbxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    edtDataInicial: TEditData;
    lblDataFinal: TLabel;
    edtDataFinal: TEditData;
    rgpResumo: TRadioGroup;
    gbxAgentes: TGroupBox;
    sbnMarcarAgentes: TSpeedButton;
    sbnDesmarcarAgentes: TSpeedButton;
    clbAgentes: TCheckListBox;
    gbxConceitos: TGroupBox;
    sbnMarcarConceitos: TSpeedButton;
    sbnDesmarcarConceitos: TSpeedButton;
    clbConceitos: TCheckListBox;
    gbxTipodeVenda: TGroupBox;
    ckbVendaaVista: TCheckBox;
    ckbVendaaPrazo: TCheckBox;
    gbxAgrupamento: TGroupBox;
    ckbAgruparGrupoFilial: TCheckBox;
    ckbAgruparFilial: TCheckBox;
    ckbDataVenda: TCheckBox;
    rgpOpcaoRelatorio: TRadioGroup;
    rgpSelecao: TRadioGroup;
    gbxClientes: TGroupBox;
    lblInicial: TLabel;
    lblFinal: TLabel;
    sbnConsultaClienteFinal: TSpeedButton;
    sbnConsultaClienteInicial: TSpeedButton;
    dtxClienteInicial: TtecDBText;
    dtxClienteFinal: TtecDBText;
    edfClienteInicial: TtecDbEditFind;
    edfClienteFinal: TtecDbEditFind;
    ckbMaioresVendas: TCheckBox;
    lblQuantidade: TLabel;
    edtQuantidadeMaioresVendas: TEditNumero;
    ckbMaioresClientes: TCheckBox;
    gbxOrdenacao: TGroupBox;
    rbnCliente: TRadioButton;
    rbnDataCliente: TRadioButton;
    rbnContrato: TRadioButton;
    rbnNotaFiscal: TRadioButton;
    rbnValorCliente: TRadioButton;
    gbxDevolucoes: TGroupBox;
    ckbDevolucoesPeriodoSelecionado: TCheckBox;
    ckbDevolucoesPeriodoAnterior: TCheckBox;
    gbxSeparar: TGroupBox;
    ckbSepararVendas: TCheckBox;
    ckbSepararDevolucoes: TCheckBox;
    ckbExibirTotais: TCheckBox;
    pnlSeparator: TPanel;
    fraListaFiliais1: TfraListaFiliais;
    fraListaGruposFiliais1: TfraListaGruposFiliais;
    gbxMaquinas: TGroupBox;
    fraSelecaoAleatoriaRegioes: TfraSelecaoAleatoria;
    pgcPlanos_e_Vendedores: TtecPageControl;
    tstVendedores: TTabSheet;
    fraSelecaoAleatoriausuarios: TfraSelecaoAleatoriausuarios;
    tstGruposdeVendedores: TTabSheet;
    fraSelecaoAleatoriagruposusuarios1: TfraSelecaoAleatoriagruposusuarios;
    ckbIncluirDevolucoesSemContrato: TCheckBox;
    ckbAgruparTabelaPreco: TCheckBox;
    pgcVendasdoPeriodo: TPageControl;
    tstParametros: TTabSheet;
    tstVisualizacaSemanaHora: TTabSheet;
    DBAdvGridVendasSemanais: TDBAdvGrid;
    AdvGridExcelIO1: TAdvGridExcelIO;
    AdvPopupMenu1: TAdvPopupMenu;
    ExportarExcel1: TMenuItem;
    procedure sbnMarcarAgentesClick(Sender: TObject);
    procedure sbnDesmarcarAgentesClick(Sender: TObject);
    procedure sbnMarcarConceitosClick(Sender: TObject);
    procedure sbnDesmarcarConceitosClick(Sender: TObject);
    procedure ckbVendaaPrazoClick(Sender: TObject);
    procedure ckbVendaaVistaClick(Sender: TObject);
    procedure sbnConsultaClienteInicialClick(Sender: TObject);
    procedure sbnConsultaClienteFinalClick(Sender: TObject);
    procedure ckbMaioresVendasClick(Sender: TObject);
    procedure ckbMaioresClientesClick(Sender: TObject);
    procedure rgpOpcaoRelatorioClick(Sender: TObject);
    procedure ckbSepararDevolucoesClick(Sender: TObject);
    procedure fraListaFiliais1sbnMarcarFiliaisClick(Sender: TObject);
    procedure fraListaGruposFiliais1sbnmarcarGrupodeFiliaisClick(
      Sender: TObject);
    procedure fraListaFiliais1clbFiliaisClickCheck(Sender: TObject);
    procedure fraListaGruposFiliais1clbGrupodeFiliaisClickCheck(
      Sender: TObject);
    procedure fraSelecaoAleatoriaRegioesqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaRegioesdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaRegioesdbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSelecaoAleatoriaRegioessbnProcuraClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure pgcVendasdoPeriodoChange(Sender: TObject);
    procedure ExportarExcel1Click(Sender: TObject);
    procedure DBAdvGridVendasSemanaisKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure AcionarPesquisaGradeRegioes;
    procedure AtribuirDadosRegioes(Found: Boolean);

    procedure RecalcularTotaisVendasSemanais;

  protected
     function InternoPesquisar(Titulo: String): Integer; override;
     function JanelaPesquisa: TfrmConsultaBasica; override;
     function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
     function TabelaDePesquisa: TZDataSet; override;
     procedure InternoImpressao; override;
  public
    { Public declarations  }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
    function PesquisaHabilitada: Boolean;
    function TituloPesquisa: String;
    procedure MontaPesquisa(VisualizacaoPorSemana: Boolean = false);
    function  ValidarCamposSelecao: Boolean;
    procedure ObterLista(Origem: TStrings; Destino: TCheckListBox);
  end;

var
  frmRelatorioVendasdoPeriodo: TfrmRelatorioVendasdoPeriodo;
  tiporelatorio              : TTecTipoRelatorioVendas;
  TipoPesquisa               : TtecRelatorioVendas;

implementation

{$R *.dfm}

{ TfrmRelatorioVendasdoPeriodo }

uses dmrelatoriovendasdoperiodo;

procedure TfrmRelatorioVendasdoPeriodo.InternoImpressao;
begin
  inherited;
  MontaPesquisa;
end;

procedure TfrmRelatorioVendasdoPeriodo.MontaPesquisa(VisualizacaoPorSemana: Boolean );
begin
  if ValidarCamposSelecao then begin
    with dtmrelatoriovendasdoperiodo do
    begin
      ApagarTabelaTemporaria;
      OpcaoRelatorio      := rgpOpcaoRelatorio.ItemIndex;
      ParametroCabecalho  :='';
      ParametroSelecao := rgpSelecao.ItemIndex;
      if VisualizacaoPorSemana then
        Resumo       := 1
      else
        Resumo       := rgpResumo.ItemIndex;

      MaioresVendasdoPeriodo := ckbMaioresVendas.Checked;
      MaioresClientesdoPeriodo := ckbMaioresClientes.Checked;
      QuantidadeMaioresVendas := edtQuantidadeMaioresVendas.Text;
      DevolucoesPeriodoSelecionado := ckbDevolucoesPeriodoSelecionado.Checked;
      DevolucoesPeriodoAnterior := ckbDevolucoesPeriodoAnterior.Checked;
      IncluirDevolucoesSemContrato := ckbIncluirDevolucoesSemContrato.Checked;
      MontarConsultaImpressao;
      ParametroClienteInicial := edfClienteInicial.Text;
      ParametroClienteFinal  := edfClienteFinal.Text;
      DataInicial         := edtDataInicial.Text;
      DataFinal           := edtDataFinal.Text;
      Filiais             := fraListaFiliais1.ListaSelecionada;
      GrupoFiliais        := fraListaGruposFiliais1.ListaSelecionada;
      if GrupoFiliais<>'' then
        ParametroCabecalho:=ParametroCabecalho+' Grupo de Filiais: '+GrupoFiliais
      else
      if Filiais<>'' then
        ParametroCabecalho:=ParametroCabecalho+' Filiais: '+Filiais;
      MontarFiltroAgentes(clbAgentes);
      MontarFiltroConceitos(clbConceitos);
      ListadeRegioes := fraSelecaoAleatoriaRegioes.StringSelecionada;
      ListadeVendedores := fraSelecaoAleatoriausuarios.ListaCondicional;
      ListadeGruposVendedores := fraSelecaoAleatoriagruposusuarios1.ListaCondicional;
      VendaaVista         := ckbVendaaVista.checked;
      VendaaPrazo         := ckbVendaaPrazo.Checked;
      AgruparGrupoFilial  := ckbAgruparGrupoFilial.Checked;
      AgruparFilial       := ckbAgruparFilial.Checked;
      AgruparTabelaPreco  := ckbAgruparTabelaPreco.Checked;
      AgruparDataVenda    := ckbDataVenda.Checked;
      SepararVendas := ckbSepararVendas.Checked;
      SepararDevolucoes := ckbSepararDevolucoes.Checked;
      ExibirTotaisVendaseDevolucoes := ckbExibirTotais.Checked;
      MontaDatas;
      if rbnCliente.Checked then TipoAgrupamento := 0
      else if rbnDataCliente.Checked then TipoAgrupamento := 1
      else if rbnContrato.Checked then TipoAgrupamento := 2
      else if rbnNotaFiscal.Checked then TipoAgrupamento := 3
      else if rbnValorCliente.Checked then TipoAgrupamento := 4;

      MontarOrdenacao;
      if AbrirConsultasRelatorio(VisualizacaoPorSemana) then
      begin
        if not VisualizacaoPorSemana then
          ImprimirRelatorio
      end
      else
       MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
    end;
  end;
end;


function TfrmRelatorioVendasdoPeriodo.ValidarCamposSelecao: Boolean;
begin
  Result:=(ckbVendaaVista.Checked or ckbVendaaPrazo.Checked);
  if Result then
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
        Result := OperadorTernario((Trim(edfClienteInicial.Text) <> ''), edfClienteInicial.Exist, True) and
                  OperadorTernario((Trim(edfClienteFinal.Text) <> ''), edfClienteFinal.Exist, True)
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
  end
  else
  begin
   MensagemAviso(ctPARAMETROSINEXISTENTES);
   ckbVendaaVista.SetFocus;
  end;
end;

constructor TfrmRelatorioVendasdoPeriodo.Create(Aowner: Tcomponent);
begin
  dtmRelatorioVendasdoPeriodo := TdtmRelatorioVendasdoPeriodo.Create(Self);
  inherited;
  dtmrelatoriovendasdoPeriodo.Abre(ctTabelas);
  ObterLista(dtmRelatorioVendasdoPeriodo.ListaAgentes, clbAgentes);
  ObterLista(dtmRelatorioVendasdoPeriodo.ListaConceitos, clbConceitos);

  edtDataInicial.Text := DateToStr(PrimeiroDiaMes(dtmrelatoriovendasdoPeriodo.DataServidor));
  edtDataFinal.Text := DateToStr(dtmrelatoriovendasdoPeriodo.DataServidor);

  rgpOpcaoRelatorioClick(self);
//  self.ClientHeight := self.Height + 20;
//  self.ClientWidth := self.Width + 20;

  fraSelecaoAleatoriaRegioes.CampoParaLista := 'codigo';
  fraSelecaoAleatoriaRegioes.qrySelecaoAleatoria.Open;
  with fraSelecaoAleatoriaRegioes do
  begin
    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoriaRegioes';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 4;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraRegioes;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'Codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'Codigo';
    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoria.TipoPesquisa := pesRegioes;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosRegioes;
  end;


  RecalcularTotaisVendasSemanais;

  pgcVendasdoPeriodo.activepage := tstParametros;
end;

destructor TfrmRelatorioVendasdoPeriodo.Destroy;
{
var
  cnt: Integer;
  v_frmPreviewPadrao : TfrmPreviewPadrao;
  }
begin
{
  for cnt :=self.ComponentCount-1 downto 0 do
    if Components[cnt] is TfrmPreviewPadrao then
    begin
      v_frmPreviewPadrao := TfrmPreviewPadrao(Components[cnt]);
      v_frmPreviewPadrao.ModalResult := mrOK;
    end;
 }
 
  dtmRelatorioVendasdoPeriodo:=nil;
  inherited;
  frmRelatorioVendasdoPeriodo:= nil;
//  freeandnil(frmRelatorioVendasdoPeriodo);
end;

procedure TfrmRelatorioVendasdoPeriodo.ObterLista(Origem: TStrings;
  Destino: TCheckListBox);
begin
  Destino.Items.AddStrings(Origem);
end;

procedure TfrmRelatorioVendasdoPeriodo.sbnMarcarAgentesClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbAgentes, True);
end;

procedure TfrmRelatorioVendasdoPeriodo.sbnDesmarcarAgentesClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbAgentes, False);
end;

procedure TfrmRelatorioVendasdoPeriodo.sbnMarcarConceitosClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbConceitos, True);
end;

procedure TfrmRelatorioVendasdoPeriodo.sbnDesmarcarConceitosClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbConceitos, False);
end;

procedure TfrmRelatorioVendasdoPeriodo.ckbVendaaPrazoClick(
  Sender: TObject);
begin
  inherited;
  if not ckbVendaaPrazo.Checked then
    ckbVendaaVista.Checked := True;
end;

procedure TfrmRelatorioVendasdoPeriodo.ckbVendaaVistaClick(
  Sender: TObject);
begin
  inherited;
  if not ckbVendaaVista.Checked then
    ckbVendaaPrazo.Checked := True;
end;

function TfrmRelatorioVendasdoPeriodo.PesquisaHabilitada: Boolean;
begin
  Result:= False;
  if (CtrlOn) and (ActiveControl is TtecDBEditFind) then
  begin
    if edfClienteInicial.Focused then
      TipoPesquisa := rvCLIENTESINICIAL
    else if edfClienteFinal.Focused then
      TipoPesquisa := rvCLIENTESFINAL;
    Result:= True;
  end;

end;

function TfrmRelatorioVendasdoPeriodo.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmrelatoriovendasdoperiodo do
    case TipoPesquisa of
      rvCLIENTESINICIAL,
      rvCLIENTESFINAL     : result := ExisteCliente(NomeCampo, Value);
    else  Result:= False;
    end;
end;

function TfrmRelatorioVendasdoPeriodo.InternoPesquisar(
  Titulo: String): Integer;
begin
  if PesquisaHabilitada then
    with dtmrelatoriovendasdoperiodo do
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

function TfrmRelatorioVendasdoPeriodo.JanelaPesquisa: TfrmConsultaBasica;
var
  Jan: TfrmConsultaPorCampo;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := Not (TipoPesquisa in [rvCLIENTESINICIAL, rvCLIENTESFINAL]) and CtrlOn;
  Jan.UsarParametrosDaTabela := True;
  Result := Jan
end;

function TfrmRelatorioVendasdoPeriodo.TabelaDePesquisa: TZDataSet;
begin
  Result := inherited TabelaDePesquisa;
  with dtmrelatoriovendasdoperiodo do
  Case TipoPesquisa of
   rvCLIENTESINICIAL,
   rvCLIENTESFINAL  : Result := ConsultaClientes
  end;
end;

function TfrmRelatorioVendasdoPeriodo.TituloPesquisa: String;
begin
  case TipoPesquisa of
    rvCLIENTESINICIAL,
    rvCLIENTESFINAL  : Result := ctCLIENTES
  end;
end;

procedure TfrmRelatorioVendasdoPeriodo.sbnConsultaClienteInicialClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfClienteInicial, ctCLIENTES);
end;

procedure TfrmRelatorioVendasdoPeriodo.sbnConsultaClienteFinalClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfClienteFinal, ctCLIENTES);
end;

procedure TfrmRelatorioVendasdoPeriodo.ckbMaioresVendasClick(
  Sender: TObject);
begin
  inherited;
  if ckbMaioresVendas.Checked then
  begin
   ckbMaioresClientes.Checked := False;
   rbnValorCliente.Checked := True;
   ckbSepararVendas.Checked := false;
   ckbSepararDevolucoes.Checked := false;
   ckbExibirTotais.Checked := false;
   ckbSepararVendas.enabled := false;
   ckbSepararDevolucoes.enabled := false;
   ckbExibirTotais.enabled := false;
  end
  else
  begin
   ckbSepararVendas.enabled := true;
   ckbSepararDevolucoes.enabled := true;
   ckbExibirTotais.enabled := true;
  end;
  if not ckbMaioresClientes.Checked and not ckbMaioresVendas.Checked then
   edtQuantidadeMaioresVendas.Text := '';
end;

procedure TfrmRelatorioVendasdoPeriodo.ckbMaioresClientesClick(
  Sender: TObject);
begin
  inherited;
  if ckbMaioresClientes.Checked then
  begin
   ckbMaioresVendas.Checked := False;
   rbnValorCliente.Checked := True;
   ckbSepararDevolucoes.Checked := false;
   ckbExibirTotais.Checked := false;
   ckbSepararVendas.enabled := false;
   ckbSepararDevolucoes.enabled := false;
   ckbExibirTotais.enabled := false;
  end
  else
  begin
   ckbSepararVendas.enabled := true;
   ckbSepararDevolucoes.enabled := true;
   ckbExibirTotais.enabled := true;
  end;
  if not ckbMaioresClientes.Checked and not ckbMaioresVendas.Checked then
   edtQuantidadeMaioresVendas.Text := '';
end;

procedure TfrmRelatorioVendasdoPeriodo.rgpOpcaoRelatorioClick(
  Sender: TObject);
begin
  inherited;
  case rgpOpcaoRelatorio.ItemIndex of
  0: begin
       if rbnNotaFiscal.Checked then
       begin
         rbnNotaFiscal.Checked := false;
         rbnContrato.Checked := true;
        end;
        rbnContrato.Enabled := true;
        rbnNotaFiscal.Enabled := false;
        ckbIncluirDevolucoesSemContrato.enabled := True;
     end;
  1: begin
      rbnContrato.Enabled := true;
      rbnNotaFiscal.Enabled := true;
      ckbIncluirDevolucoesSemContrato.enabled := False;
     end;
  end;
end;

procedure TfrmRelatorioVendasdoPeriodo.ckbSepararDevolucoesClick(
  Sender: TObject);
begin
  inherited;
  if not ckbSepararVendas.Checked and
     not ckbSepararDevolucoes.Checked then
   ckbExibirTotais.Checked := false;
end;

procedure TfrmRelatorioVendasdoPeriodo.fraListaFiliais1sbnMarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  fraListaFiliais1.sbnMarcarFiliaisClick(Sender);
  fraListaGruposFiliais1.sbnDesmarcarGrupodeFiliaisClick(Sender);
end;

procedure TfrmRelatorioVendasdoPeriodo.fraListaGruposFiliais1sbnmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  fraListaGruposFiliais1.sbnmarcarGrupodeFiliaisClick(Sender);
  fraListaFiliais1.sbnDesmarcarFiliaisClick(Sender);
end;

procedure TfrmRelatorioVendasdoPeriodo.fraListaFiliais1clbFiliaisClickCheck(
  Sender: TObject);
begin
  inherited;
  fraListaGruposFiliais1.sbnDesmarcarGrupodeFiliaisClick(self);
end;

procedure TfrmRelatorioVendasdoPeriodo.fraListaGruposFiliais1clbGrupodeFiliaisClickCheck(
  Sender: TObject);
begin
  inherited;
  fraListaFiliais1.sbnDesmarcarFiliaisClick(self);
end;

procedure TfrmRelatorioVendasdoPeriodo.fraSelecaoAleatoriaRegioesqrySelecaoAleatoriaAfterOpen(
  DataSet: TDataSet);
var nc: integer;
  
begin
  inherited;
  with fraSelecaoAleatoriaRegioes do begin
     for nc:= 0 to qrySelecaoAleatoria.FieldCount - 1 do
         qrySelecaoAleatoria.Fields[nc].Visible := false;

     qrySelecaoAleatoria.FieldByName('codigo').visible := true;
     qrySelecaoAleatoria.FieldByName('codigo').DisplayLabel := 'CÓDIGO';
     qrySelecaoAleatoria.FieldByName('codigo').ReadOnly := False;

     qrySelecaoAleatoria.FieldByName('nome').visible := true;
     qrySelecaoAleatoria.FieldByName('nome').DisplayLabel := 'NOME';
     qrySelecaoAleatoria.FieldByName('nome').ReadOnly := true;

     qrySelecaoAleatoria.Append;
     qrySelecaoAleatoria.Post;

     with dbgSelecaoAleatoria do
          for nc:= 0 to 1 do with Columns[nc].Title do begin
              Alignment:= taCenter;
              Font.Name:= 'helvetica';
              Font.Height:= -9;
          end;
  end;

end;

procedure TfrmRelatorioVendasdoPeriodo.AcionarPesquisaGradeRegioes;
begin
  with fraSelecaoAleatoriaRegioes do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar('Regiões');
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;

end;

procedure TfrmRelatorioVendasdoPeriodo.AtribuirDadosRegioes(Found: Boolean);
begin
  with fraSelecaoAleatoriaRegioes do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('codigo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraRegioescodigo.AsString;

    qrySelecaoAleatoria.FieldByName('nome').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraRegioesnome.AsString;

    qrySelecaoAleatoria.Post;
  end;

end;

procedure TfrmRelatorioVendasdoPeriodo.fraSelecaoAleatoriaRegioesdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeRegioes;

end;

procedure TfrmRelatorioVendasdoPeriodo.fraSelecaoAleatoriaRegioesdbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                     fraSelecaoAleatoriaRegioes.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                     if (Shift = []) or fraSelecaoAleatoriaRegioes.ConsultaSelecaoAleatoria.CtrlOn then
                       AcionarPesquisaGradeRegioes
                   end;
    end;
  end
  else
  case Key of
    VK_Return: if (fraSelecaoAleatoriaRegioes.dbgSelecaoAleatoria.SelectedIndex = 0)  then
                begin
                  fraSelecaoAleatoriaRegioes.ConsultaSelecaoAleatoria.edfCodigo.DoExit;
                  if not fraSelecaoAleatoriaRegioes.ConsultaSelecaoAleatoria.qryProcuraRegioes.IsEmpty then
                    AtribuirDadosRegioes(true)
                  else
                  begin
                    key := 0;
                    fraSelecaoAleatoriaRegioes.dbgSelecaoAleatoria.SelectedIndex := 0;
                    fraSelecaoAleatoriaRegioes.dbgSelecaoAleatoria.SetFocus;
                  end;
                end;
  end;
  inherited;

end;

procedure TfrmRelatorioVendasdoPeriodo.fraSelecaoAleatoriaRegioessbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeRegioes;
end;

procedure TfrmRelatorioVendasdoPeriodo.Button1Click(Sender: TObject);
var
  cnt: Integer;
  v_frmPreviewPadrao : TfrmPreviewPadrao;
begin
  for cnt :=self.ComponentCount-1 downto 0 do
    if Components[cnt] is TfrmPreviewPadrao then
    begin
      v_frmPreviewPadrao := TfrmPreviewPadrao(Components[cnt]);
      v_frmPreviewPadrao.ModalResult := mrOK;
    end;
end;

procedure TfrmRelatorioVendasdoPeriodo.pgcVendasdoPeriodoChange(
  Sender: TObject);
begin
  inherited;
  if pgcVendasdoPeriodo.activepage = tstVisualizacaSemanaHora then
  begin
    MontaPesquisa(true);
    RecalcularTotaisVendasSemanais
  end;  

end;

procedure TfrmRelatorioVendasdoPeriodo.RecalcularTotaisVendasSemanais;
begin
  DBAdvGridVendasSemanais.FloatingFooter.Visible := False;
  DBAdvGridVendasSemanais.FloatingFooter.Visible := True;
  DBAdvGridVendasSemanais.FloatingFooter.ColumnCalc[DBAdvGridVendasSemanais.ColumnByFieldName['T_Domingo'].Index] := acSum;
  DBAdvGridVendasSemanais.FloatingFooter.ColumnCalc[DBAdvGridVendasSemanais.ColumnByFieldName['Q_Domingo'].Index] := acSum;

  DBAdvGridVendasSemanais.FloatingFooter.ColumnCalc[DBAdvGridVendasSemanais.ColumnByFieldName['T_Segunda'].Index] := acSum;
  DBAdvGridVendasSemanais.FloatingFooter.ColumnCalc[DBAdvGridVendasSemanais.ColumnByFieldName['Q_Segunda'].Index] := acSum;

  DBAdvGridVendasSemanais.FloatingFooter.ColumnCalc[DBAdvGridVendasSemanais.ColumnByFieldName['T_Terça'].Index] := acSum;
  DBAdvGridVendasSemanais.FloatingFooter.ColumnCalc[DBAdvGridVendasSemanais.ColumnByFieldName['Q_Terça'].Index] := acSum;

  DBAdvGridVendasSemanais.FloatingFooter.ColumnCalc[DBAdvGridVendasSemanais.ColumnByFieldName['T_Quarta'].Index] := acSum;
  DBAdvGridVendasSemanais.FloatingFooter.ColumnCalc[DBAdvGridVendasSemanais.ColumnByFieldName['Q_Quarta'].Index] := acSum;

  DBAdvGridVendasSemanais.FloatingFooter.ColumnCalc[DBAdvGridVendasSemanais.ColumnByFieldName['T_Quinta'].Index] := acSum;
  DBAdvGridVendasSemanais.FloatingFooter.ColumnCalc[DBAdvGridVendasSemanais.ColumnByFieldName['Q_Quinta'].Index] := acSum;

  DBAdvGridVendasSemanais.FloatingFooter.ColumnCalc[DBAdvGridVendasSemanais.ColumnByFieldName['T_Sexta'].Index] := acSum;
  DBAdvGridVendasSemanais.FloatingFooter.ColumnCalc[DBAdvGridVendasSemanais.ColumnByFieldName['Q_Sexta'].Index] := acSum;

  DBAdvGridVendasSemanais.FloatingFooter.ColumnCalc[DBAdvGridVendasSemanais.ColumnByFieldName['T_Sabado'].Index] := acSum;
  DBAdvGridVendasSemanais.FloatingFooter.ColumnCalc[DBAdvGridVendasSemanais.ColumnByFieldName['Q_Sabado'].Index] := acSum;

  DBAdvGridVendasSemanais.FloatingFooter.ColumnCalc[DBAdvGridVendasSemanais.ColumnByFieldName['Valor_Total'].Index] := acSum;
  DBAdvGridVendasSemanais.FloatingFooter.ColumnCalc[DBAdvGridVendasSemanais.ColumnByFieldName['Qtde_Total'].Index] := acSum;


  DBAdvGridVendasSemanais.MergeCells(4,0,2,1);
  DBAdvGridVendasSemanais.Cells[4,0] := 'DOMINGO';

  DBAdvGridVendasSemanais.MergeCells(6,0,2,1);
  DBAdvGridVendasSemanais.Cells[6,0] := 'SEGUNDA';

  DBAdvGridVendasSemanais.MergeCells(8,0,2,1);
  DBAdvGridVendasSemanais.Cells[8,0] := 'TERÇA';

  DBAdvGridVendasSemanais.MergeCells(10,0,2,1);
  DBAdvGridVendasSemanais.Cells[10,0] := 'QUARTA';

  DBAdvGridVendasSemanais.MergeCells(12,0,2,1);
  DBAdvGridVendasSemanais.Cells[12,0] := 'QUINTA';

  DBAdvGridVendasSemanais.MergeCells(14,0,2,1);
  DBAdvGridVendasSemanais.Cells[14,0] := 'SEXTA';

  DBAdvGridVendasSemanais.MergeCells(16,0,2,1);
  DBAdvGridVendasSemanais.Cells[16,0] := 'SÁBADO';

  DBAdvGridVendasSemanais.MergeCells(18,0,2,1);
  DBAdvGridVendasSemanais.Cells[18,0] := 'TOTAL';



end;

procedure TfrmRelatorioVendasdoPeriodo.ExportarExcel1Click(
  Sender: TObject);
var
  vNomeArquivo : String;

begin
  inherited;
  if pgcVendasdoPeriodo.ActivePage = tstVisualizacaSemanaHora then
  begin
    AdvGridExcelIO1.AdvStringGrid := DBAdvGridVendasSemanais;
    vNomeArquivo := ExtractFilePath(Application.ExeName) + 'Saidas\VendasSemanais.xls';
    AdvGridExcelIO1.XLSExport(vNomeArquivo, 'VendasSemanais');
  end;
end;

procedure TfrmRelatorioVendasdoPeriodo.DBAdvGridVendasSemanaisKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = vk_x) and (ssCtrl in Shift) then
    ExportarExcel1Click(nil);

end;

end.
