unit fmrelatorioresumodevendaserecebimentos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, cpdata, DBCtrls, cpdbtext,
  Mask, cpdbfindcontrols, ComCtrls, cppagecontrol, Buttons, ctconstantes, biblio,
  cpnumero, cpeditioncontrolvalidation, fmrelatoriopadrao, CheckLst,
  Zquery,
  fmconsultabasica,
  fmconsultaporcampo, Grids, DBGrids, cpdbgrid, ActnList, frlistafiliais,
  frlistagruposfiliais, ToolWin;

type
  TfrmRelatorioResumodeVendaseRecebimentos = class(TfrmRelatorioPadrao)
    gbxVendaseRecebimentos: TGroupBox;
    gbxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    edtDataInicial: TEditData;
    lblDataFinal: TLabel;
    edtDataFinal: TEditData;
    gbxVendasEstornos: TGroupBox;
    ckbVendasEstornosMesmodia: TCheckBox;
    rgpImprimir: TRadioGroup;
    rgpResumo: TRadioGroup;
    gbxListar: TGroupBox;
    ckbVendasPorContrato: TCheckBox;
    ckbEstornodoMes: TCheckBox;
    ckbEstornoforadomes: TCheckBox;
    ckbRecebimentosporContrato: TCheckBox;
    gbxAgentes: TGroupBox;
    sbnMarcarAgentes: TSpeedButton;
    sbnDesmarcarAgentes: TSpeedButton;
    clbAgentes: TCheckListBox;
    gbxConceitos: TGroupBox;
    sbnMarcarConceitos: TSpeedButton;
    sbnDesmarcarConceitos: TSpeedButton;
    clbConceitos: TCheckListBox;
    ckbVendasFrentedeCaixa: TCheckBox;
    ckbRecebimentosFrentedeCaixa: TCheckBox;
    gbxCliente: TGroupBox;
    sbnProcuraCliente: TSpeedButton;
    dtxCliente: TtecDBText;
    edfCliente: TtecDbEditFind;
    fraListaFiliais1: TfraListaFiliais;
    fraListaGruposFiliais1: TfraListaGruposFiliais;
    procedure sbnMarcarAgentesClick(Sender: TObject);
    procedure sbnDesmarcarAgentesClick(Sender: TObject);
    procedure sbnMarcarConceitosClick(Sender: TObject);
    procedure sbnDesmarcarConceitosClick(Sender: TObject);
    procedure sbnProcuraClienteClick(Sender: TObject);
    procedure fraListaFiliais1clbFiliaisClickCheck(Sender: TObject);
    procedure fraListaGruposFiliais1sbnmarcarGrupodeFiliaisClick(
      Sender: TObject);
    procedure fraListaGruposFiliais1clbGrupodeFiliaisClickCheck(
      Sender: TObject);
    procedure fraListaFiliais1sbnMarcarFiliaisClick(Sender: TObject);
  private
    { Private declarations }
  protected
    Jan: TfrmConsultaPorCampo;
    procedure InternoImpressao; override;
  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
    procedure MontaPesquisa;
    function  ValidarCamposSelecao: Boolean;
    procedure ObterLista(Origem: TStrings; Destino: TCheckListBox);
    function  PermitirPesquisa: Boolean;
    function  InternoPesquisar(Titulo: string): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean; Override;
    function  TabelaDePesquisa: TZdataSet; override;
    
  end;

var
  frmRelatorioResumodeVendaseRecebimentos: TfrmRelatorioResumodeVendaseRecebimentos;
  TipoPesquisa      : TtecRelatorioVendas;

implementation

{$R *.dfm}
uses dmrelatorioresumodevendaserecebimentos;

{ TfrmRelatorioResumodevendaserecebimentos }

constructor TfrmRelatorioResumodeVendaseRecebimentos.Create(Aowner: Tcomponent);
begin
  dtmrelatorioresumodevendaserecebimentos := Tdtmrelatorioresumodevendaserecebimentos.Create(Self);
  inherited;
  dtmrelatorioresumodeVendaseRecebimentos.Abre(ctTabelas);
  ObterLista(dtmrelatorioresumodevendaserecebimentos.ListaAgentes, clbAgentes);
  ObterLista(dtmrelatorioresumodevendaserecebimentos.ListaConceitos, clbConceitos);
  edtDataInicial.Text :=DateToStr(DataLocal);
  edtDataFinal.Text := DateToStr(DataLocal);
end;

destructor TfrmRelatorioResumodeVendaseRecebimentos.Destroy;
begin
  dtmrelatorioresumodevendaserecebimentos:=nil;
  inherited;
  frmRelatorioResumodevendaserecebimentos:= nil;
end;

procedure TfrmRelatorioResumodeVendaseRecebimentos.InternoImpressao;
begin
  inherited;
  MontaPesquisa;
end;

procedure TfrmRelatorioResumodeVendaseRecebimentos.MontaPesquisa;
begin
  if ValidarCamposSelecao then begin
    with dtmrelatorioresumodevendaserecebimentos do begin
      ParametroCabecalho    :='';
      VendasporContrato     := ckbVendasPorContrato.Checked;
      VendasFrentedeCaixa   := ckbVendasFrentedeCaixa.Checked;
      EstornosdoMes         := ckbEstornodoMes.Checked;
      EstornosForadoMes     := ckbEstornoforadomes.Checked;
      RecebimentosporContrato := ckbRecebimentosporContrato.Checked;
      RecebimentosporFrentedeCaixa := ckbRecebimentosFrentedeCaixa.Checked;

      Resumo                := rgpResumo.ItemIndex;
      Imprimir              := rgpImprimir.ItemIndex;
      Filiais             := fraListaFiliais1.ListaSelecionada;
      GrupoFiliais        := fraListaGruposFiliais1.ListaSelecionada;
      if GrupoFiliais<>'' then
        ParametroCabecalho:=ParametroCabecalho+' Grupo de Filiais: '+GrupoFiliais
      else
      if Filiais<>'' then
        ParametroCabecalho:=ParametroCabecalho+' Filiais: '+Filiais;

      DataInicial           := edtDataInicial.Text;
      DataFinal             := edtDataFinal.Text;
      cliente := trim(edfCliente.Text);
      VendasEstornosMesmodia:=ckbVendasEstornosMesmodia.Checked;
      if (Resumo <> 2)
          and not VendasporContrato
          and not VendasFrentedeCaixa
          and not EstornosdoMes
          and not EstornosForadoMes
          and not RecebimentosporContrato
          and not RecebimentosporFrentedeCaixa then
         MensagemAviso('Uma das opões "Listar" deve estar selecionada.')
      else begin
        GerarRelatorio;
      end;
    end;
  end;
end;

procedure TfrmRelatorioResumodeVendaseRecebimentos.ObterLista(
  Origem: TStrings; Destino: TCheckListBox);
begin
  Destino.Items.AddStrings(Origem);
end;

function TfrmRelatorioResumodeVendaseRecebimentos.ValidarCamposSelecao: Boolean;
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
end;

procedure TfrmRelatorioResumodeVendaseRecebimentos.sbnMarcarAgentesClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbAgentes, True);
end;

procedure TfrmRelatorioResumodeVendaseRecebimentos.sbnDesmarcarAgentesClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbAgentes, false);
end;

procedure TfrmRelatorioResumodeVendaseRecebimentos.sbnMarcarConceitosClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbConceitos, True);
end;

procedure TfrmRelatorioResumodeVendaseRecebimentos.sbnDesmarcarConceitosClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbConceitos, False);
end;

function TfrmRelatorioResumodeVendaseRecebimentos.ExisteInformacao(
  Parametro: Integer; NomeCampo: string; Value: Variant): Boolean;
begin
  case TipoPesquisa of
    rvCLIENTES     : Result := dtmrelatorioresumodeVendaseRecebimentos.ExisteCliente(NomeCampo, Value);
    else              Result := False;
  end;
end;

function TfrmRelatorioResumodeVendaseRecebimentos.InternoPesquisar(
  Titulo: string): Integer;
begin
  Result:= mrNone;
  if PermitirPesquisa then begin
    dtmrelatorioresumodeVendaseRecebimentos.AbreTabelaConsulta(TipoPesquisa);
    Result := inherited InternoPesquisar(Titulo);
    if Result = mrOK then
      dtmrelatorioresumodeVendaseRecebimentos.Selecionar(TipoPesquisa);
    dtmrelatorioresumodeVendaseRecebimentos.FechaTabelaConsulta(TipoPesquisa);
  end;
end;

function TfrmRelatorioResumodeVendaseRecebimentos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := Not (TipoPesquisa in [rvCLIENTES]) and CtrlOn;
  Jan.UsarParametrosDaTabela := true;
  Result := Jan
end;

function TfrmRelatorioResumodeVendaseRecebimentos.PermitirPesquisa: Boolean;
begin
  Result := False;
  if CtrlOn then begin
    if ActiveControl is TtecFindCustom then begin
      if edfCliente.Focused then TipoPesquisa := rvCLIENTES;
      Result:= True;
    end;
  end;
end;

function TfrmRelatorioResumodeVendaseRecebimentos.TabelaDePesquisa: TZdataSet;
begin
  case TipoPesquisa of
    rvCLIENTES   : Result := dtmrelatorioresumodeVendaseRecebimentos.TabelaConsultaClientes;
    else              Result := nil;
  end;
end;

procedure TfrmRelatorioResumodeVendaseRecebimentos.sbnProcuraClienteClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfCliente, ctCLIENTES)
end;

procedure TfrmRelatorioResumodeVendaseRecebimentos.fraListaFiliais1clbFiliaisClickCheck(
  Sender: TObject);
begin
  inherited;
  fraListaGruposFiliais1.sbnDesmarcarGrupodeFiliaisClick(self);

end;

procedure TfrmRelatorioResumodeVendaseRecebimentos.fraListaGruposFiliais1sbnmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  fraListaGruposFiliais1.sbnmarcarGrupodeFiliaisClick(Sender);
  fraListaFiliais1.sbnDesmarcarFiliaisClick(Sender);
end;

procedure TfrmRelatorioResumodeVendaseRecebimentos.fraListaGruposFiliais1clbGrupodeFiliaisClickCheck(
  Sender: TObject);
begin
  inherited;
  fraListaFiliais1.sbnDesmarcarFiliaisClick(Sender);
end;

procedure TfrmRelatorioResumodeVendaseRecebimentos.fraListaFiliais1sbnMarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  fraListaFiliais1.sbnMarcarFiliaisClick(Sender);
  fraListaGruposFiliais1.sbnDesmarcarGrupodeFiliaisClick(Sender);

end;

end.
