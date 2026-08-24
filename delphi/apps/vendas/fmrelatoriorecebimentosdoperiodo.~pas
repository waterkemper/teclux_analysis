unit fmrelatoriorecebimentosdoperiodo;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, cpdata, DBCtrls, cpdbtext,
  Mask, cpdbfindcontrols, ComCtrls, cppagecontrol, Buttons,
  ctconstantes, biblio, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpeditioncontrolvalidation, fmrelatoriopadrao, CheckLst,
  fmconsultabasica,
  fmconsultaporcampo, cpdbcombobox, frlistafiliais, frlistagruposfiliais,
  ToolWin;

type
  TfrmRelatorioRecebimentosdoPeriodo = class(TfrmRelatorioPadrao)
    gbxRecebimentosdoPeriodo: TGroupBox;
    gbxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    edtDataInicial: TEditData;
    lblDataFinal: TLabel;
    edtDataFinal: TEditData;
    rgpTipodeContrato: TRadioGroup;
    rgpRenegociacao: TRadioGroup;
    rgpFilialSelecao: TRadioGroup;
    rgpFilialExibicao: TRadioGroup;
    rgpOrdenacao: TRadioGroup;
    rgpResumo: TRadioGroup;
    gbxTipodeVenda: TGroupBox;
    ckbVendaaVista: TCheckBox;
    ckbVendaaPrazo: TCheckBox;
    gbxConceitos: TGroupBox;
    sbnMarcarConceitos: TSpeedButton;
    sbnDesmarcarConceitos: TSpeedButton;
    clbConceitos: TCheckListBox;
    gbxAgentes: TGroupBox;
    sbnMarcarAgentes: TSpeedButton;
    sbnDesmarcarAgentes: TSpeedButton;
    clbAgentes: TCheckListBox;
    gbxAgrupamento: TGroupBox;
    ckbAgruparGrupoFilial: TCheckBox;
    ckbAgruparFilial: TCheckBox;
    ckbDataPagto: TCheckBox;
    gbxCreditoTroca: TGroupBox;
    cbbCreditoTroca: TComboBox;
    gbxListar: TGroupBox;
    ckbRecebimentosporContrato: TCheckBox;
    ckbRecebimentosFrentedeCaixa: TCheckBox;
    gbxCliente: TGroupBox;
    sbnProcuraCliente: TSpeedButton;
    dtxCliente: TtecDBText;
    edfCliente: TtecDbEditFind;
    rgpNotasDoContrato: TRadioGroup;
    fraListaFiliais1: TfraListaFiliais;
    fraListaGruposFiliais1: TfraListaGruposFiliais;
    ckbRecebimentosporOS: TCheckBox;
    procedure rgpFilialSelecaoClick(Sender: TObject);
    procedure sbnMarcarConceitosClick(Sender: TObject);
    procedure sbnDesmarcarConceitosClick(Sender: TObject);
    procedure sbnMarcarAgentesClick(Sender: TObject);
    procedure sbnDesmarcarAgentesClick(Sender: TObject);
    procedure ckbRecebimentosporContratoClick(Sender: TObject);
    procedure ckbRecebimentosFrentedeCaixaClick(Sender: TObject);
    procedure sbnProcuraClienteClick(Sender: TObject);
    procedure fraListaFiliais1sbnMarcarFiliaisClick(Sender: TObject);
    procedure fraListaFiliais1clbFiliaisClickCheck(Sender: TObject);
    procedure fraListaGruposFiliais1sbnmarcarGrupodeFiliaisClick(
      Sender: TObject);
    procedure fraListaGruposFiliais1clbGrupodeFiliaisClickCheck(
      Sender: TObject);
  protected
    Jan: TfrmConsultaPorCampo;
    procedure InternoImpressao; override;
    function  PermitirPesquisa: Boolean;
    function  InternoPesquisar(Titulo: string): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean; Override;
    function  TabelaDePesquisa: TZdataSet; override;
  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
    function  ValidarCamposSelecao: Boolean;
    procedure ObterLista(Origem: TStrings; Destino: TCheckListBox);
  end;

var
  frmRelatorioRecebimentosdoPeriodo: TfrmRelatorioRecebimentosdoPeriodo;
  tiporelatorio                    : TTecTipoRelatorioVendas;
  TipoPesquisa                     : TtecRelatorioVendas;

implementation

{$R *.dfm}

{ TfrmRelatorioRecebimentosdoPeriodo }

uses dmrelatoriorecebimentosdoperiodo;

constructor TfrmRelatorioRecebimentosdoPeriodo.Create(Aowner: Tcomponent);
begin
  dtmrelatoriorecebimentosdoperiodo := Tdtmrelatoriorecebimentosdoperiodo.Create(Self);
  inherited;
  ObterLista(dtmrelatoriorecebimentosdoperiodo.ListaAgentes, clbAgentes);
  ObterLista(dtmrelatoriorecebimentosdoperiodo.ListaConceitos, clbConceitos);
  edtDataInicial.Text := DateToStr(UltimoDiaMesPassado(1));
  edtDataFinal.Text := DateToStr(DataLocal);
end;

destructor TfrmRelatorioRecebimentosdoPeriodo.Destroy;
begin
  dtmrelatoriorecebimentosdoperiodo:=nil;
  inherited;
  frmRelatorioRecebimentosdoPeriodo:= nil;
end;


function TfrmRelatorioRecebimentosdoPeriodo.ValidarCamposSelecao: Boolean;
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
      if not Result then
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

  if result then
  begin
    if not ckbRecebimentosporContrato.checked and
       not ckbRecebimentosporOS.checked and
       not ckbRecebimentosFrentedeCaixa.checked then
    begin
      MensagemAviso('Informe um tipo de recebimento!');
      ckbRecebimentosporContrato.setfocus;
      result := false;
    end;
  end;
end;

procedure TfrmRelatorioRecebimentosdoPeriodo.rgpFilialSelecaoClick(
  Sender: TObject);
begin
  inherited;
  rgpFilialExibicao.ItemIndex:=rgpFilialSelecao.ItemIndex;
end;


procedure TfrmRelatorioRecebimentosdoPeriodo.InternoImpressao;
begin
  inherited;
  if ValidarCamposSelecao then
  begin
    with dtmrelatoriorecebimentosdoperiodo do
    begin
      ParametroCabecalho :='';
      RecebimentosporContrato := ckbRecebimentosporContrato.Checked;
      RecebimentosporOrdemServico := ckbRecebimentosporOS.checked;
      RecebimentosporFrenteCaixa := ckbRecebimentosFrentedeCaixa.Checked;

      FilialSelecao := rgpFilialSelecao.ItemIndex;
      Filiais             := fraListaFiliais1.ListaSelecionada;
      GrupoFiliais        := fraListaGruposFiliais1.ListaSelecionada;
      if GrupoFiliais<>'' then
       case FilialSelecao of
        0: ParametroCabecalho:=ParametroCabecalho+' Grupo Filial de Pagto: '+GrupoFiliais;
        1: ParametroCabecalho:=ParametroCabecalho+' Grupo Filial de Venda: '+GrupoFiliais;
       end
      else
      if Filiais<>'' then
       case FilialSelecao of
         0: ParametroCabecalho:=ParametroCabecalho+' Filial de Pagto: '+Filiais;
         1: ParametroCabecalho:=ParametroCabecalho+' Filial de Venda: '+Filiais;
       end;

//      MontarFiltroFiliais(clbFiliais);
//      MontarFiltroGrupoFiliais(clbGrupodeFiliais);
      MontarFiltroAgentes(clbAgentes);
      MontarFiltroConceitos(clbConceitos);
      DataInicial   := edtDataInicial.Text;
      DataFinal     := edtDataFinal.Text;
      Cliente       := trim(edfCliente.Text);
      Renegociacao  := rgpRenegociacao.ItemIndex;
      SituacaoCreditoTroca := cbbCreditoTroca.ItemIndex;
      TipodeContrato:= rgpTipodeContrato.ItemIndex;
      NotasDoContrato := rgpNotasDoContrato.ItemIndex;
      VendaaVista   := ckbVendaaVista.Checked;
      VendaaPrazo   := ckbVendaaPrazo.checked;
      FilialExibicao:= rgpFilialExibicao.ItemIndex;
      Ordenacao     := rgpOrdenacao.ItemIndex;
      AgruparGrupoFilial := ckbAgruparGrupoFilial.Checked;
      AgruparFilial      := ckbAgruparFilial.Checked;
      AgruparDataPagto   := ckbDataPagto.Checked;

      MontarOrdenacao;
      Resumo        := rgpResumo.ItemIndex;
     if AbrirConsultas then
         ImprimirRelatorio
      else
        MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
    end;
  end;
end;

procedure TfrmRelatorioRecebimentosdoPeriodo.ObterLista(Origem: TStrings;
  Destino: TCheckListBox);
begin
  Destino.Items.AddStrings(Origem);
end;

procedure TfrmRelatorioRecebimentosdoPeriodo.sbnMarcarConceitosClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbConceitos, True);
end;

procedure TfrmRelatorioRecebimentosdoPeriodo.sbnDesmarcarConceitosClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbConceitos, false);
end;

procedure TfrmRelatorioRecebimentosdoPeriodo.sbnMarcarAgentesClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbAgentes, True);
end;

procedure TfrmRelatorioRecebimentosdoPeriodo.sbnDesmarcarAgentesClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbAgentes, False);
end;

procedure TfrmRelatorioRecebimentosdoPeriodo.ckbRecebimentosporContratoClick(
  Sender: TObject);
begin
  inherited;
  rgpTipodeContrato.Enabled := ckbRecebimentosporContrato.Checked or ckbRecebimentosporOS.checked;
  rgpRenegociacao.Enabled := ckbRecebimentosporContrato.Checked or ckbRecebimentosporOS.checked;
  gbxCreditoTroca.Enabled := ckbRecebimentosporContrato.Checked or ckbRecebimentosporOS.checked;
  ckbVendaaPrazo.Enabled := ckbRecebimentosporContrato.Checked or ckbRecebimentosporOS.checked;

         {
  if not ckbRecebimentosporContrato.Checked then
  begin
    ckbRecebimentosFrentedeCaixa.Checked := true;
    cbbCreditoTroca.ItemIndex := 0;
    ckbVendaaVista.Checked := true;
    ckbVendaaPrazo.Checked := false;
  end;
  }

end;

procedure TfrmRelatorioRecebimentosdoPeriodo.ckbRecebimentosFrentedeCaixaClick(
  Sender: TObject);
begin
  inherited;
  {
  if not ckbRecebimentosFrentedeCaixa.Checked then
    ckbRecebimentosporContrato.Checked := true;
    }
end;

function TfrmRelatorioRecebimentosdoPeriodo.ExisteInformacao(
  Parametro: Integer; NomeCampo: string; Value: Variant): Boolean;
begin
  case TipoPesquisa of
    rvCLIENTES     : Result := dtmrelatoriorecebimentosdoperiodo.ExisteCliente(NomeCampo, Value);
    else              Result := False;
  end;
end;

function TfrmRelatorioRecebimentosdoPeriodo.InternoPesquisar(
  Titulo: string): Integer;
begin
  Result:= mrNone;
  if PermitirPesquisa then begin
    dtmrelatoriorecebimentosdoperiodo.AbreTabelaConsulta(TipoPesquisa);
    Result := inherited InternoPesquisar(Titulo);
    if Result = mrOK then
      dtmrelatoriorecebimentosdoperiodo.Selecionar(TipoPesquisa);
    dtmrelatoriorecebimentosdoperiodo.FechaTabelaConsulta(TipoPesquisa);
  end;
end;

function TfrmRelatorioRecebimentosdoPeriodo.JanelaPesquisa: TfrmConsultaBasica;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := Not (TipoPesquisa in [rvCLIENTES]) and CtrlOn;
  Jan.UsarParametrosDaTabela := true;
  Result := Jan
end;

function TfrmRelatorioRecebimentosdoPeriodo.PermitirPesquisa: Boolean;
begin
  Result := False;
  if CtrlOn then begin
    if ActiveControl is TtecFindCustom then begin
      if edfCliente.Focused then TipoPesquisa := rvCLIENTES;
      Result:= True;
    end;
  end;
end;

function TfrmRelatorioRecebimentosdoPeriodo.TabelaDePesquisa: TZdataSet;
begin
  case TipoPesquisa of
    rvCLIENTES   : Result := dtmrelatoriorecebimentosdoperiodo.TabelaConsultaClientes;
    else              Result := nil;
  end;
end;

procedure TfrmRelatorioRecebimentosdoPeriodo.sbnProcuraClienteClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfCliente, ctCLIENTES)
end;

procedure TfrmRelatorioRecebimentosdoPeriodo.fraListaFiliais1sbnMarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  fraListaFiliais1.sbnMarcarFiliaisClick(Sender);
  fraListaGruposFiliais1.sbnDesmarcarGrupodeFiliaisClick(Sender);

end;

procedure TfrmRelatorioRecebimentosdoPeriodo.fraListaFiliais1clbFiliaisClickCheck(
  Sender: TObject);
begin
  inherited;
  fraListaGruposFiliais1.sbnDesmarcarGrupodeFiliaisClick(self);

end;

procedure TfrmRelatorioRecebimentosdoPeriodo.fraListaGruposFiliais1sbnmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  fraListaGruposFiliais1.sbnmarcarGrupodeFiliaisClick(Sender);
  fraListaFiliais1.sbnDesmarcarFiliaisClick(Sender);
end;

procedure TfrmRelatorioRecebimentosdoPeriodo.fraListaGruposFiliais1clbGrupodeFiliaisClickCheck(
  Sender: TObject);
begin
  inherited;
  fraListaFiliais1.sbnDesmarcarFiliaisClick(Sender);
end;

end.
