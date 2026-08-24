unit fmprestacoesabertas;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls, CheckLst, Grids, DBGrids,
  Windows, Menus, ComCtrls, DateUtils,
  //Terceiros
  ZQuery,
  //Biblio
  ctConstantes, biblio,
  //Repositorio
  fmajudabt, fmconsultabasica, fmconsultaporcampo,
  //Projeto
  dmprestacoesabertas,
  //Componentes
  cptexto, cpdbfindcontrols, cpdata, cpdbtext, cppagecontrol, FR_RRect,
  fmrelatoriopadrao, DB, ZPgSqlQuery, cpquery, ToolWin,
  frselecaoaleatoriavendedores;

type
  TfrmPrestacoesAbertas = class(TfrmRelatorioPadrao)
    gbxPrestacoesAtrasadas: TGroupBox;
    gbxOpcoes: TGroupBox;
    ckbComOcorrencia: TCheckBox;
    ckbClientesSemCartaDevolvida: TCheckBox;
    ckbClientesEnderecoCompleto: TCheckBox;
    ckbClientesEPrimeiraCompra: TCheckBox;
    ckbContratosSemPagamento: TCheckBox;
    gbxVencimentos: TGroupBox;
    gbxFaturamento: TGroupBox;
    gbxRegiao: TGroupBox;
    sbnProcurarRegiao: TSpeedButton;
    edfRegiao: TtecDbEditFind;
    dtxNomeRegiao: TtecDBText;
    gbxSelecionarAtraso: TGroupBox;
    rbnQualquerAtraso: TRadioButton;
    rbnMaiorAtraso: TRadioButton;
    rgpResumo: TRadioGroup;
    gbxAgrupamento: TGroupBox;
    ckbAgruparGrupoFilial: TCheckBox;
    ckbAgruparFilial: TCheckBox;
    pgcFilialGrupoFilial: TtecPageControl;
    tstFilial: TTabSheet;
    sbnMarcarFiliais: TSpeedButton;
    sbnDesmarcarFiliais: TSpeedButton;
    clbFiliais: TCheckListBox;
    tstGrupoFilial: TTabSheet;
    sbnmarcarGrupodeFiliais: TSpeedButton;
    sbnDesmarcarGrupodeFiliais: TSpeedButton;
    clbGrupodeFiliais: TCheckListBox;
    pgcParametros: TPageControl;
    tstAgentes: TTabSheet;
    tstConceitos: TTabSheet;
    clbAgentes: TCheckListBox;
    sbnMarcarAgentes: TSpeedButton;
    sbnDesmarcarAgentes: TSpeedButton;
    clbConceitos: TCheckListBox;
    sbnMarcarConceitos: TSpeedButton;
    sbnDesmarcarConceitos: TSpeedButton;
    ckbClientesComCartaDevolvida: TCheckBox;
    ckbSemOcorrencia: TCheckBox;
    ckbClientesEnderecoIncompleto: TCheckBox;
    ckbClientesNaoEPrimeiraCompra: TCheckBox;
    ckbContratosComPagamento: TCheckBox;
    rgpOrdenacao: TRadioGroup;
    gbxCliente: TGroupBox;
    sbnProcuraCliente: TSpeedButton;
    dtxCliente: TtecDBText;
    edfCliente: TtecDbEditFind;
    edtVendaInicial: TEditData;
    edtVendaFinal: TEditData;
    edtVencimentoInicial: TEditData;
    edtVencimentoFinal: TEditData;
    lblFaturamento: TLabel;
    lblAVencto: TLabel;
    lblResumo: TStaticText;
    lblOrdenacao: TStaticText;
    gbxListaCondicionalVendedores: TGroupBox;
    fraSelecaoAleatoriavendedores: TfraSelecaoAleatoriavendedores;
    ckbAgruparVendedor: TCheckBox;
    procedure sbnProcurarRegiaoClick(Sender: TObject);
    procedure pgcFilialGrupoFilial_Change(Sender: TObject);
    procedure sbnMarcarAgentesClick(Sender: TObject);
    procedure sbnDesmarcarAgentesClick(Sender: TObject);
    procedure sbnMarcarConceitosClick(Sender: TObject);
    procedure sbnDesmarcarConceitosClick(Sender: TObject);
    procedure edtVendaFinalEnter(Sender: TObject);
    procedure edtVencimentoFinalEnter(Sender: TObject);
    procedure ckbComOcorrenciaClick(Sender: TObject);
    procedure ckbSemOcorrenciaClick(Sender: TObject);
    procedure ckbClientesComCartaDevolvidaClick(Sender: TObject);
    procedure ckbClientesSemCartaDevolvidaClick(Sender: TObject);
    procedure ckbClientesEnderecoCompletoClick(Sender: TObject);
    procedure ckbClientesEnderecoIncompletoClick(Sender: TObject);
    procedure ckbClientesEPrimeiraCompraClick(Sender: TObject);
    procedure ckbClientesNaoEPrimeiraCompraClick(Sender: TObject);
    procedure ckbContratosSemPagamentoClick(Sender: TObject);
    procedure ckbContratosComPagamentoClick(Sender: TObject);
    procedure sbnMarcarFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarFiliaisClick(Sender: TObject);
    procedure sbnmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure clbFiliaisClickCheck(Sender: TObject);
    procedure clbGrupodeFiliaisClickCheck(Sender: TObject);
    procedure sbnProcuraClienteClick(Sender: TObject);
    procedure FormLoaded(Sender: TObject);
  private
    procedure ObterLista(Origem: TStrings; Destino: TCheckListBox);
  protected
    Jan: TfrmConsultaPorCampo;
    procedure GerarRelatorio;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  PermitirPesquisa: Boolean;
    function  ValidaControles: Boolean;
    function  InternoPesquisar(Titulo: string): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean; Override;
    function  TabelaDePesquisa: TZdataSet; override;
    procedure internoimpressao; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmPrestacoesAbertas: TfrmPrestacoesAbertas;
  TipoPesquisa: TtecPesquisa;

implementation

{$R *.dfm}

constructor TfrmPrestacoesAbertas.Create(AOwner: TComponent);
begin
  dtmPrestacoesAbertas:= TdtmPrestacoesAbertas.Create(Self);
  inherited;
  dtmPrestacoesAbertas.Abre(ctTabelas);
  ObterLista(dtmPrestacoesAbertas.ListaFiliais, clbFiliais);
  ObterLista(dtmPrestacoesAbertas.ListaGruposFiliais, clbGrupodeFiliais);
  ObterLista(dtmPrestacoesAbertas.ListaAgentes, clbAgentes);
  ObterLista(dtmPrestacoesAbertas.ListaConceitos, clbConceitos);
  edtVendaInicial.Text     := DateToStr(Date - 90);
  edtVendaFinal.Text       := DateToStr(Date);
  edtVencimentoInicial.Text:= DateToStr(Date - 30);
  edtVencimentoFinal.Text  := DateToStr(Date);
end;

destructor TfrmPrestacoesAbertas.Destroy;
begin
  inherited;
  frmPrestacoesAbertas:= nil;
end;

function TfrmPrestacoesAbertas.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  if PermitirPesquisa then begin
    dtmPrestacoesAbertas.AbreTabelaConsulta(TipoPesquisa);
    Result := inherited InternoPesquisar(Titulo);
    if Result = mrOK then
      dtmPrestacoesAbertas.Selecionar(TipoPesquisa);
    dtmPrestacoesAbertas.FechaTabelaConsulta(TipoPesquisa);
  end;
end;

function TfrmPrestacoesAbertas.JanelaPesquisa;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := Not (TipoPesquisa in [pesCLIENTES]) and CtrlOn;
  Jan.UsarParametrosDaTabela := true;
  Result := Jan
end;

function TfrmPrestacoesAbertas.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  case TipoPesquisa of
    pesREGIOES      : Result := dtmPrestacoesAbertas.ExisteRegiao(NomeCampo,Value);
    pesVENDEDORES   : Result := dtmPrestacoesAbertas.ExisteVendedor(NomeCampo,Value);
    pesCLIENTES     : Result := dtmPrestacoesAbertas.ExisteCliente(NomeCampo, Value);
    else              Result := False;
  end;
end;

function TfrmPrestacoesAbertas.TabelaDePesquisa: TZdataSet;
begin
  case TipoPesquisa of
    pesREGIOES    : Result := dtmPrestacoesAbertas.ConsultarRegiao;
    pesVENDEDORES : Result := dtmPrestacoesAbertas.ConsultarVendedor;
    pesCLIENTES   : Result := dtmPrestacoesAbertas.TabelaConsultaClientes;
    else              Result := nil;
  end;
end;

procedure TfrmPrestacoesAbertas.sbnProcurarRegiaoClick(Sender: TObject);
begin
  InternoPesquisar(edfRegiao, ctREGIAO)
end;


function TfrmPrestacoesAbertas.PermitirPesquisa: Boolean;
begin
  Result := False;
  if CtrlOn then begin
    if ActiveControl is TtecFindCustom then begin
      if edfRegiao.Focused      then TipoPesquisa:= pesREGIOES
      else if edfCliente.Focused then TipoPesquisa := pesCLIENTES;
      Result:= True;
    end;
  end;
end;


procedure TfrmPrestacoesAbertas.GerarRelatorio;
begin
 if ValidaControles then
 With dtmPrestacoesAbertas do
 begin
  ParametrosCabecalho:='';
  MontarFiltroFiliais(clbFiliais);
  MontarFiltroGrupoFiliais(clbGrupodeFiliais);
  MontarFiltroAgentes(clbAgentes);
  MontarFiltroConceitos(clbConceitos);
  ListaCondicionalVendedor := fraSelecaoAleatoriavendedores.ListaCondicional;
  Cliente           := Trim(edfCliente.Text);
  Regiao            := Trim(edfRegiao.Text);
  DataVendaInicial  := edtVendaInicial.Text;
  DataVendaFinal    := edtVendaFinal.Text;
  DataVenctoInicial := edtVencimentoInicial.Text;
  DataVenctoFinal   := edtVencimentoFinal.Text;
  AgruparGrupoFilial:= ckbAgruparGrupoFilial.Checked;
  AgruparFilial     := ckbAgruparFilial.Checked;
{  AgruparVendedor   := ckbAgruparVendedor.checked;} 
  Atraso            := rbnQualquerAtraso.Checked;
  Resumo            := rgpResumo.itemindex;
  Ordenacao         := rgpOrdenacao.ItemIndex;
  AgruparGrupoFilial:= ckbAgruparGrupoFilial.Checked;
  AgruparFilial     := ckbAgruparFilial.Checked;
  try
    qryDropTabelaOpcoesPrestacoesAbertas.ExecSql;
  except
  end;
  RefazConsulta(qryCriarTabelaOpcoesPrestacoesAbertas, [], []);
  CartaDevolvida(ckbClientesComCartaDevolvida.Checked,
                    ckbClientesSemCartaDevolvida.Checked,
                    ckbClientesComCartaDevolvida.Caption,
                    ckbClientesSemCartaDevolvida.Caption);
  OcorrenciasCobranca(ckbComOcorrencia.Checked,
                      ckbSemOcorrencia.Checked,
                      ckbComOcorrencia.caption,
                      ckbSemOcorrencia.caption);
  EnderecoCompleto(ckbClientesEnderecoCompleto.Checked,
                   ckbClientesEnderecoIncompleto.Checked,
                   ckbClientesEnderecoCompleto.Caption,
                   ckbClientesEnderecoIncompleto.Caption);
  PrimeiraCompra(ckbClientesEPrimeiraCompra.Checked,
                 ckbClientesNaoEPrimeiraCompra.Checked,
                 ckbClientesEPrimeiraCompra.Caption,
                 ckbClientesNaoEPrimeiraCompra.Caption);
  ContratosSemPagamento(ckbContratosComPagamento.Checked,
                        ckbContratosSemPagamento.Checked,
                        ckbContratosComPagamento.Caption,
                        ckbContratosSemPagamento.Caption);
  if not (ckbClientesComCartaDevolvida.Checked or
           ckbClientesSemCartaDevolvida.Checked or
           ckbComOcorrencia.Checked or
           ckbSemOcorrencia.Checked or
           ckbClientesEnderecoCompleto.Checked or
           ckbClientesEnderecoIncompleto.Checked or
           ckbClientesEPrimeiraCompra.Checked or
           ckbClientesNaoEPrimeiraCompra.Checked or
           ckbContratosComPagamento.Checked or
           ckbContratosSemPagamento.Checked) then
  refazConsulta(qryInserirTabelaOpcoesPrestacoesAbertas,[0],['']);
  ReFazConsulta(qryOpcoesPrestacoesAbertas,[],[]);
  MontarSQLParcelasClientes;
  MontarSQLContratos;
  MontarSQLParcelasPrestacoesAbertasResumo;
  MontarOrdenacao;
  case rgpResumo.ItemIndex of
   0 : begin
         RefazConsulta(qryParcelasClientes, [],[]);
         RefazConsulta(qryParcelasPrestacoesAbertasResumo, [],[]);
       end;
   1 : RefazConsulta(qryParcelasClientes, [],[]);
   2 : RefazConsulta(qryParcelasPrestacoesAbertasResumo, [],[]);
  end;
  qryParcelasExportar.params := qryparcelas.Params;
  qryParcelasExportar.Macros := qryparcelas.Macros;
  
  RefazConsulta(qryParcelasExportar, [],[]);

  if not qryParcelasclientes.IsEmpty or
     not qryParcelasPrestacoesAbertasResumo.IsEmpty  then
    GerarRelatorio
  else
    MensagemAviso(format(ctNENHUMREGISTROENCONTRADO,['registro']));
 end;
end;

procedure TfrmPrestacoesAbertas.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
end;

function TfrmPrestacoesAbertas.ValidaControles: Boolean;
begin
  Result := (edtVencimentoInicial.DataValida and edtVencimentoFinal.DataValida);
  if Result then
  begin
    if not DataEmBranco(edtVencimentoInicial.Text) and not DataEmBranco(edtVencimentoFinal.Text) then
      Result := StrToDate(edtVencimentoInicial.Text) <= StrToDate(edtVencimentoFinal.Text);
    if result then
    begin
      Result := (edtVendaInicial.DataValida) and (edtVendaFinal.DataValida);
      if result then
      begin
        if not DataEmBranco(edtVendaInicial.Text) and not DataEmBranco(edtVendaFinal.Text) then
          Result := StrToDate(edtVendaInicial.Text) <= StrToDate(edtVendaFinal.Text);
        if result then
        begin
          if (ActiveControl = edfRegiao) and (edfRegiao.Text <> '') then
            Result := edfRegiao.Exist;
        end
        else
        begin
          MensagemAviso(ctDTINICIALMAIORDTFINAL);
          edtVendaInicial.SetFocus;
        end;
      end;
    end
    else
    begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      edtVencimentoInicial.SetFocus;
    end;
  end
  else
  begin
    MensagemAviso(ctDATAINVALIDA);
    edtVencimentoInicial.SetFocus;
  end;
end;

procedure TfrmPrestacoesAbertas.pgcFilialGrupoFilial_Change(Sender: TObject);
begin
  inherited;
  if pgcFilialGrupoFilial.ActivePage = tstFilial then begin
  end
  else begin
  end;
end;

procedure TfrmPrestacoesAbertas.sbnMarcarAgentesClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbAgentes,True);
end;

procedure TfrmPrestacoesAbertas.sbnDesmarcarAgentesClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbAgentes,False);
end;

procedure TfrmPrestacoesAbertas.sbnMarcarConceitosClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbConceitos,True);
end;

procedure TfrmPrestacoesAbertas.sbnDesmarcarConceitosClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbConceitos,False);
end;

procedure TfrmPrestacoesAbertas.edtVendaFinalEnter(Sender: TObject);
begin
  inherited;
  if not dataembranco(edtVencimentoinicial.text) and edtVencimentoInicial.Criticar(false) then
    edtVencimentoFinal.Minimo:= DaysBetween(dtmPrestacoesAbertas.DataServidor,StrToDate(edtVencimentoInicial.Text));
end;

procedure TfrmPrestacoesAbertas.edtVencimentoFinalEnter(Sender: TObject);
begin
  inherited;
  if not dataembranco(edtVencimentoInicial.text) and edtVencimentoInicial.Criticar(false) then
    edtVencimentoFinal.Minimo:=DaysBetween(dtmPrestacoesAbertas.DataServidor,StrToDate(edtVencimentoInicial.Text));
end;

procedure TfrmPrestacoesAbertas.internoimpressao;
begin
  inherited;
  GerarRelatorio;
end;

procedure TfrmPrestacoesAbertas.ObterLista(Origem: TStrings;
  Destino: TCheckListBox);
begin
  Destino.Items.AddStrings(Origem);
end;

procedure TfrmPrestacoesAbertas.ckbComOcorrenciaClick(Sender: TObject);
begin
  inherited;
  ckbSemOcorrencia.Checked := False
end;

procedure TfrmPrestacoesAbertas.ckbSemOcorrenciaClick(Sender: TObject);
begin
  inherited;
  ckbComOcorrencia.Checked := False
end;

procedure TfrmPrestacoesAbertas.ckbClientesComCartaDevolvidaClick(
  Sender: TObject);
begin
  inherited;
  ckbClientesSemCartaDevolvida.Checked := False
end;

procedure TfrmPrestacoesAbertas.ckbClientesSemCartaDevolvidaClick(
  Sender: TObject);
begin
  inherited;
  ckbClientesComCartaDevolvida.Checked := False
end;

procedure TfrmPrestacoesAbertas.ckbClientesEnderecoCompletoClick(
  Sender: TObject);
begin
  inherited;
  ckbClientesEnderecoIncompleto.Checked := False
end;

procedure TfrmPrestacoesAbertas.ckbClientesEnderecoIncompletoClick(
  Sender: TObject);
begin
  inherited;
  ckbClientesEnderecocompleto.Checked := False
end;

procedure TfrmPrestacoesAbertas.ckbClientesEPrimeiraCompraClick(
  Sender: TObject);
begin
  inherited;
  ckbClientesNaoEPrimeiraCompra.Checked := False
end;

procedure TfrmPrestacoesAbertas.ckbClientesNaoEPrimeiraCompraClick(
  Sender: TObject);
begin
  inherited;
  ckbClientesEPrimeiraCompra.Checked := False
end;

procedure TfrmPrestacoesAbertas.ckbContratosSemPagamentoClick(
  Sender: TObject);
begin
  inherited;
  ckbContratosComPagamento.Checked := False
end;

procedure TfrmPrestacoesAbertas.ckbContratosComPagamentoClick(
  Sender: TObject);
begin
  inherited;
  ckbContratosSemPagamento.Checked := False
end;

procedure TfrmPrestacoesAbertas.sbnMarcarFiliaisClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais,True);
  MarcarLista(clbGrupodeFiliais,False);
end;

procedure TfrmPrestacoesAbertas.sbnDesmarcarFiliaisClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais,False);
end;

procedure TfrmPrestacoesAbertas.sbnmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais,False);
  MarcarLista(clbGrupodeFiliais,True);
end;

procedure TfrmPrestacoesAbertas.sbnDesmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais,False);
end;

procedure TfrmPrestacoesAbertas.clbFiliaisClickCheck(Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais, False);
end;

procedure TfrmPrestacoesAbertas.clbGrupodeFiliaisClickCheck(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais, False);
end;

procedure TfrmPrestacoesAbertas.sbnProcuraClienteClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfCliente, ctCLIENTES)
end;

procedure TfrmPrestacoesAbertas.FormLoaded(Sender: TObject);
begin
  inherited;
  edtVendaInicial.SetFocus;
end;

end.
