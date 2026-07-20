unit fmrelatoriorenegociacao;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, ExtCtrls, Buttons, StdCtrls, cpdata, CheckLst,
  ComCtrls, cppagecontrol, DBCtrls, cpdbtext, Mask, cpdbfindcontrols,

  biblio,
  fmconsultabasica, fmconsultaporcampo,
  zquery,
  ctconstantes, frlistagruposfiliais, frlistafiliais, ToolWin;

type
  TfrmRelatorioRenegociacao = class(TFrmRelatorioPadrao)
    rgpResumo: TRadioGroup;
    rgpOrdenacao: TRadioGroup;
    gbxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    edtDataInicial: TEditData;
    lblDataFinal: TLabel;
    edtDataFinal: TEditData;
    gbxAgentes: TGroupBox;
    sbnMarcarAgentes: TSpeedButton;
    sbnDesmarcarAgentes: TSpeedButton;
    clbAgentes: TCheckListBox;
    gbxConceitos: TGroupBox;
    sbnMarcarConceitos: TSpeedButton;
    sbnDesmarcarConceitos: TSpeedButton;
    clbConceitos: TCheckListBox;
    gbxVendedor: TGroupBox;
    sbnProcurarVendedor: TSpeedButton;
    edfVendedor: TtecDbEditFind;
    dtxVendedor: TtecDBText;
    gbxAgrupamento: TGroupBox;
    ckbAgruparGrupoFilial: TCheckBox;
    ckbAgruparFilial: TCheckBox;
    fraListaFiliais1: TfraListaFiliais;
    fraListaGruposFiliais1: TfraListaGruposFiliais;
    procedure sbnMarcarAgentesClick(Sender: TObject);
    procedure sbnDesmarcarAgentesClick(Sender: TObject);
    procedure sbnMarcarConceitosClick(Sender: TObject);
    procedure sbnDesmarcarConceitosClick(Sender: TObject);
    procedure sbnProcurarVendedorClick(Sender: TObject);
    procedure fraListaFiliais1clbFiliaisClickCheck(Sender: TObject);
    procedure fraListaFiliais1sbnMarcarFiliaisClick(Sender: TObject);
    procedure fraListaGruposFiliais1clbGrupodeFiliaisClickCheck(
      Sender: TObject);
    procedure fraListaGruposFiliais1sbnmarcarGrupodeFiliaisClick(
      Sender: TObject);
  private
    { Private declarations }
  protected
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoPesquisar(Titulo: String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    procedure InternoImpressao; override;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ObterLista(Origem: TStrings; Destino: TCheckListBox);
    function PesquisaHabilitada: Boolean;
    function VerificaCampos: Boolean;


  end;

var
  frmRelatorioRenegociacao: TfrmRelatorioRenegociacao;
  TipoPesquisa: TtecPesquisa;


implementation
 uses dmrelatoriorenegociacao;

{$R *.dfm}

{ TfrmRelatorioRenegociacao }

constructor TfrmRelatorioRenegociacao.Create(AOwner: TComponent);
begin
  inherited;
  dtmRelatorioRenegociacao := TdtmRelatorioRenegociacao.Create(Self);
  ObterLista(dtmRelatorioRenegociacao.ListaAgentes, clbAgentes);
  ObterLista(dtmRelatorioRenegociacao.ListaConceitos, clbConceitos);
  MarcarLista(clbAgentes, True);
  MarcarLista(clbConceitos, False);
  edtDataInicial.Text := DateToStr(PrimeiroDiaMesPassado(1));
  edtDataFinal.Text := DateToStr(DataLocal);
end;

destructor TfrmRelatorioRenegociacao.Destroy;
begin
  inherited;

end;

function TfrmRelatorioRenegociacao.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmRelatorioRenegociacao do
    case TipoPesquisa of
        pesVENDEDORES: Result := ExisteVendedor(NomeCampo, Value);
    else Result:= False;
    end;
end;

function TfrmRelatorioRenegociacao.InternoPesquisar(
  Titulo: String): Integer;
begin
  if PesquisaHabilitada then
    with dtmRelatorioRenegociacao do
    begin
      AbreTabelaPesquisa(TipoPesquisa);
      Result:= inherited InternoPesquisar(Titulo);
      if Result = mrOK then
        Selecionar(TipoPesquisa);
      FechaTabelaPesquisa(TipoPesquisa);
    end
  else
    Result:= 0;
end;

function TfrmRelatorioRenegociacao.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

procedure TfrmRelatorioRenegociacao.ObterLista(Origem: TStrings;
  Destino: TCheckListBox);
begin
  Destino.Items.AddStrings(Origem);
end;

function TfrmRelatorioRenegociacao.PesquisaHabilitada: Boolean;
begin
  Result := False;
  if CtrlOn then
    if ActiveControl is TtecDBEditFind then
    begin
      if edfVendedor.Focused then
        TipoPesquisa:= pesVENDEDORES;
      Result:= True;
    end;
end;

function TfrmRelatorioRenegociacao.TabelaDePesquisa: TZDataSet;
begin
  with dtmRelatorioRenegociacao do
    case TipoPesquisa of
        pesVENDEDORES: Result := ConsultarVendedor;
    else Result:= nil;
    end;
end;

procedure TfrmRelatorioRenegociacao.sbnMarcarAgentesClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbAgentes, True);
end;

procedure TfrmRelatorioRenegociacao.sbnDesmarcarAgentesClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbAgentes, False);
end;

procedure TfrmRelatorioRenegociacao.sbnMarcarConceitosClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbConceitos, True);

end;

procedure TfrmRelatorioRenegociacao.sbnDesmarcarConceitosClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbConceitos, False);
end;

procedure TfrmRelatorioRenegociacao.InternoImpressao;
begin
  inherited;
  if VerificaCampos then
  begin
    with dtmRelatorioRenegociacao do
    begin
      ParametrosCabecalho := '';
      Filial            := fraListaFiliais1.ListaSelecionada;
      GrupoFilial       := fraListaGruposFiliais1.ListaSelecionada;
      if GrupoFilial<>'' then
        ParametrosCabecalho:=ParametrosCabecalho+' Grupo de Filiais: '+GrupoFilial
      else
      if Filial<>'' then
        ParametrosCabecalho:=ParametrosCabecalho+' Filiais: '+Filial;

      MontarFiltroAgentes(clbAgentes);
      MontarFiltroConceitos(clbConceitos);
      DataInicial := edtDataInicial.Text;
      DataFinal := edtDataFinal.Text;
      Vendedor := edfVendedor.Text;
      Resumo := rgpResumo.ItemIndex;
      Ordenacao := rgpOrdenacao.ItemIndex;
      AgruparGrupoFilial := ckbAgruparGrupoFilial.Checked;
      AgruparFilial      := ckbAgruparFilial.Checked;
      MontarOrdenacao;
      if AbrirConsultas then
         ImprimirRelatorio
      else
        MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
    end;
  end;
end;

function TfrmRelatorioRenegociacao.VerificaCampos: Boolean;
begin
   Result := (edtDataInicial.DataValida and edtDataFinal.DataValida);
   if Result then
   begin
    if (not dataembranco(edtDataInicial.text) and not dataembranco(edtDataFinal.text)) then
      Result:=StrToDate(edtDataInicial.Text) <= StrToDate(edtDataFinal.Text);
    if result then
    begin
      Result:=(not dataembranco(edtDataInicial.text) or not dataembranco(edtDataFinal.text));
      if result then
        Result:= OperadorTernario(Trim(edfVendedor.Text) <> '', edfVendedor.Exist, True)
      else
      begin
       if not Result then
       begin
        MensagemAviso(ctDATAINVALIDA);
        edtDataInicial.SetFocus;
       end;
      end;
    end
    else
    begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      edtDataInicial.SetFocus;
    end;
   end;
end;

procedure TfrmRelatorioRenegociacao.sbnProcurarVendedorClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfVendedor, ctVENDEDORES)
end;

procedure TfrmRelatorioRenegociacao.fraListaFiliais1clbFiliaisClickCheck(
  Sender: TObject);
begin
  inherited;
  fraListaGruposFiliais1.sbnDesmarcarGrupodeFiliaisClick(self);

end;

procedure TfrmRelatorioRenegociacao.fraListaFiliais1sbnMarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  fraListaFiliais1.sbnMarcarFiliaisClick(Sender);
  fraListaGruposFiliais1.sbnDesmarcarGrupodeFiliaisClick(self);

end;

procedure TfrmRelatorioRenegociacao.fraListaGruposFiliais1clbGrupodeFiliaisClickCheck(
  Sender: TObject);
begin
  inherited;
  fraListaFiliais1.sbnDesmarcarFiliaisClick(Sender);

end;

procedure TfrmRelatorioRenegociacao.fraListaGruposFiliais1sbnmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  fraListaGruposFiliais1.sbnmarcarGrupodeFiliaisClick(Sender);
  fraListaFiliais1.sbnDesmarcarFiliaisClick(Sender);

end;

end.
