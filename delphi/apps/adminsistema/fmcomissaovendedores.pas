unit fmcomissaovendedores;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, CheckLst, ComCtrls, Mask, DBCtrls, ActnList,
  DateUtils, clparametrossistema, Windows, clusuario,
  // Terceiros
  ZQuery,
  // Constantes
  ctconstantes, biblio,
  // Repositorio
  fmajudabt, fmconsultabasica, fmconsultaporcampo,
  // Componentes
  cpnumero, cpdbfindcontrols, cpdata, cppagecontrol, cpdbtext,
  cpeditioncontrolvalidation, fmrelatoriopadrao,
  frconsultafilialgrupofilial, frconsulta, ToolWin;

type
  TfrmComissaoVendedores = class(TfrmRelatorioPadrao)
    aclFolha: TActionList;
    actArquivo: TAction;
    gbxVendedor: TGroupBox;
    sbnProcurarVendedor: TSpeedButton;
    edfVendedor: TtecDbEditFind;
    dtxVendedor: TtecDBText;
    gbxAgentes: TGroupBox;
    sbnMarcarAgentes: TSpeedButton;
    sbnDesmarcarAgentes: TSpeedButton;
    clbAgentes: TCheckListBox;
    gbxConceitos: TGroupBox;
    sbnMarcarConceitos: TSpeedButton;
    sbnDesmarcarConceitos: TSpeedButton;
    clbConceitos: TCheckListBox;
    gbxPeriodoComissao: TGroupBox;
    lblComissaoInicio: TLabel;
    edtComissaoInicio: TEditData;
    lblComissaoFim: TLabel;
    edtComissaoFim: TEditData;
    gbxEventos: TGroupBox;
    sbnMarcarEventos: TSpeedButton;
    sbnDesmarcarEventos: TSpeedButton;
    clbEventos: TCheckListBox;
    rgpResumo: TRadioGroup;
    ecvValida: TtecEditionControlValidation;
    fraConsultaFilialGrupoFilial: TfraConsultaFilialGrupoFilial;
    ckbExibirProdutos: TCheckBox;
    ckbIncluirDevolucoesSemContrato: TCheckBox;
    ckbConsiderarTrocasComoDevolucoes: TCheckBox;
    procedure sbnProcurarVendedorClick(Sender: TObject);
    procedure sbnMarcarAgentesClick(Sender: TObject);
    procedure sbnDesmarcarAgentesClick(Sender: TObject);
    procedure sbnMarcarConceitosClick(Sender: TObject);
    procedure sbnDesmarcarConceitosClick(Sender: TObject);
    procedure sbnMarcarEventosClick(Sender: TObject);
    procedure sbnDesmarcarEventosClick(Sender: TObject);
    procedure clbEventosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure clbAgentesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure clbConceitosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtComissaoFimEnter(Sender: TObject);
  protected
    procedure InternoImpressao; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoPesquisar(Titulo: String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function PesquisaHabilitada: Boolean;
    function TituloPesquisa: String;
    function VerificaCampos: Boolean;
    procedure ObterLista(Origem: TStrings; Destino: TCheckListBox);
    procedure LimpaControles;
    procedure MontarEventosRelatorio;
    procedure MontarFiltrosRelatorio;
    procedure GerarRelatorio;
  end;

var
  frmComissaoVendedores: TfrmComissaoVendedores;
  TipoPesquisa: TtecPesquisa;
  ControleValido: TWinControl;

implementation

uses dmcomissaovendedores{Qete,};

{$R *.dfm}

constructor TfrmComissaoVendedores.Create(AOwner: TComponent);
begin
  inherited;


  dtmComissaoVendedores := TdtmComissaoVendedores.Create(Self);
  ObterLista(dtmComissaoVendedores.ListaAgentes, clbAgentes);
  ObterLista(dtmComissaoVendedores.ListaConceitos, clbConceitos);
  MarcarLista(clbAgentes, False);
  MarcarLista(clbConceitos, False);
  MarcarLista(clbEventos, True);
  edtComissaoInicio.Text := DateToStr(UltimoDiaMesPassado(1));
  edtComissaoFim.Text := DateToStr(DataLocal);
  fraConsultaFilialGrupoFilial.MultiplosFiltros := false;
  fraConsultaFilialGrupoFilial.fraConsultaFilial.SomenteFiliaisUsuario :=
    ParSistema.RelatorioSomenteFiliaisAutorizadas;
  fraConsultaFilialGrupoFilial.fraConsultaGrupoFilial.SomenteFiliaisUsuario :=
    ParSistema.RelatorioSomenteFiliaisAutorizadas;
  fraConsultaFilialGrupoFilial.fraConsultaFilial.TipoPesquisa := pesFILIAIS;

  fraConsultaFilialGrupoFilial.fraConsultaGrupoFilial.TipoPesquisa := pesGRUPOSFILIAIS;


  if usuariologin.Vendedor and not
     usuariologin.GerenteVendas then
  begin
    edfVendedor.Text := inttostr(usuariologin.Codigousuario);
    edfVendedor.Exist;
    edfVendedor.Color := dtxVendedor.Color;
    edfVendedor.ReadOnly := true;
    sbnProcurarVendedor.Enabled := false;
    edfVendedor.TabStop := false;
  end;

end;

destructor TfrmComissaoVendedores.Destroy;
begin
  frmComissaoVendedores := nil;
  inherited;
end;

function TfrmComissaoVendedores.PesquisaHabilitada: Boolean;
begin
  Result := False;
  if CtrlOn then
    if ActiveControl is TtecDBEditFind then
      if edfVendedor.Focused and not edfVendedor.ReadOnly then
      begin
        TipoPesquisa:= pesVENDEDORES;
        Result:= True;
      end;
end;

function TfrmComissaoVendedores.TituloPesquisa: String;
begin
  case TipoPesquisa of
         pesFILIAIS: Result := 'Filial';
   pesGRUPOSFILIAIS: Result := 'Grupo de Filial';
      pesVENDEDORES: Result := 'Vendedor';
  end;
end;

function TfrmComissaoVendedores.ExisteInformacao(Parametro: Integer;NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmComissaoVendedores do
    case TipoPesquisa of
        pesVENDEDORES: Result := ExisteVendedor(NomeCampo, Value);
    else Result:= False;
    end;
end;

function TfrmComissaoVendedores.InternoPesquisar(Titulo: String): Integer;
begin
  TipoPesquisa := pesNENHUMA;
  if PesquisaHabilitada then
    with dtmComissaoVendedores do
    begin
      AbreTabelaPesquisa(TipoPesquisa);
      Result:= inherited InternoPesquisar(TituloPesquisa);
      if Result = mrOK then
        Selecionar(TipoPesquisa);
      FechaTabelaPesquisa(TipoPesquisa);
    end
  else
    Result:= 0;
end;

function TfrmComissaoVendedores.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmComissaoVendedores.TabelaDePesquisa: TZDataSet;
begin
  with dtmComissaoVendedores do
    case TipoPesquisa of
        pesVENDEDORES: Result := ConsultarVendedor;
    else Result:= nil;
    end;
end;

function TfrmComissaoVendedores.VerificaCampos: Boolean;
var
  cnt: Integer;
begin
  Result := False;
  for cnt := 0 to clbEventos.Items.Count - 1 do
    if clbEventos.Checked[cnt] then
    begin
      Result := True;
      Break;
    end;
  if Result then
  begin
    Result := ecvValida.Verify(pnlFundoJanela, ControleValido);
    if Result then
    if strtodate(edtComissaoInicio.Text)>strtodate(edtComissaoFim.Text) then
    begin
     MensagemAviso(ctDTINICIALMAIORDTFINAL);
     edtComissaoInicio.setfocus;
     result:=false;
    end;

    if Result then
       Result:= OperadorTernario(Trim(fraConsultaFilialGrupoFilial.fraConsultaFilial.edfCodigo.Text) <> '',
                fraConsultaFilialGrupoFilial.fraConsultaFilial.edfCodigo.Exist, True)
              and
              OperadorTernario(Trim(fraConsultaFilialGrupoFilial.fraConsultaFilial.edfCodigo.Text) <> '',
              fraConsultaFilialGrupoFilial.fraConsultaFilial.edfCodigo.Exist, True)
              and
              OperadorTernario(Trim(edfVendedor.Text) <> '', edfVendedor.Exist, True);
  end
  else
    MensagemAviso(Format(ctINFORME,['um evento para o cálculo de comissão.']));
end;

procedure TfrmComissaoVendedores.KeyDown(var Key: Word;Shift: TShiftState);
begin
  case Key of
  VK_ESCAPE: LimpaControles;
  end;
  inherited;
end;

procedure TfrmComissaoVendedores.ObterLista(Origem: TStrings; Destino: TCheckListBox);
begin
  Destino.Items.AddStrings(Origem);
end;

procedure TfrmComissaoVendedores.LimpaControles;
begin
  with dtmComissaoVendedores do
  begin
     Selecionar(pesVENDEDORES);
     Selecionar(pesGRUPOSFILIAIS);
     Selecionar(pesFILIAIS);
  end;
  MarcarLista(clbAgentes, False);
  MarcarLista(clbConceitos, False);
  MarcarLista(clbEventos, True);
end;

procedure TfrmComissaoVendedores.sbnProcurarVendedorClick(Sender: TObject);
begin
  CtrlOn := True;
  ActiveControl := edfVendedor;
  InternoPesquisar('');
end;

procedure TfrmComissaoVendedores.sbnMarcarAgentesClick(Sender: TObject);
begin
  MarcarLista(clbAgentes, True);
end;

procedure TfrmComissaoVendedores.sbnDesmarcarAgentesClick(Sender: TObject);
begin
  MarcarLista(clbAgentes, False);
end;

procedure TfrmComissaoVendedores.sbnMarcarConceitosClick(Sender: TObject);
begin
  MarcarLista(clbConceitos, True);
end;

procedure TfrmComissaoVendedores.sbnDesmarcarConceitosClick(Sender: TObject);
begin
  MarcarLista(clbConceitos, False);
end;

procedure TfrmComissaoVendedores.sbnMarcarEventosClick(Sender: TObject);
begin
  MarcarLista(clbEventos, True);
end;

procedure TfrmComissaoVendedores.sbnDesmarcarEventosClick(Sender: TObject);
begin
  MarcarLista(clbEventos, False);
end;

procedure TfrmComissaoVendedores.clbAgentesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Shift = [ssCtrl] then
  begin
    case Key of
      TeclaInserirRegistro : sbnMarcarAgentes.Click;
         TeclaExcluirLista : sbnDesmarcarAgentes.Click;
    end;
  end;
end;

procedure TfrmComissaoVendedores.clbConceitosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Shift = [ssCtrl] then
  begin
    case Key of
      TeclaInserirRegistro : sbnMarcarConceitos.Click;
      TeclaExcluirLista : sbnDesmarcarConceitos.Click;
    end;
  end;
end;

procedure TfrmComissaoVendedores.clbEventosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      TeclaInserirRegistro : sbnMarcarEventos.Click;
      TeclaExcluirLista : sbnDesmarcarEventos.Click;
    end;
  end;
end;

procedure TfrmComissaoVendedores.MontarEventosRelatorio;
begin
  dtmComissaoVendedores.MontarEventos(clbEventos);
end;

procedure TfrmComissaoVendedores.MontarFiltrosRelatorio;
begin
  dtmComissaoVendedores.MontarFiltros(clbAgentes, clbConceitos);
end;

procedure TfrmComissaoVendedores.GerarRelatorio;
begin
  with dtmComissaoVendedores do
  begin
    ParametrosCabecalho:='';
    ParametroFilial := fraConsultaFilialGrupoFilial.fraConsultaFilial.edfCodigo.Text;
    ParametroGrupoFilial := fraConsultaFilialGrupoFilial.fraConsultaGrupoFilial.edfCodigo.Text;
    if ParametroGrupoFilial<>'' then
      ParametrosCabecalho:=ParametrosCabecalho+' Grupo de Filial: '+ParametroGrupoFilial
    else
    if ParametroFilial<>'' then
      ParametrosCabecalho:=ParametrosCabecalho+' Filial: '+ParametroFilial;
    ParametroVendedor := edfVendedor.Text;
    ParametroInicioComissao := edtComissaoInicio.Text;
    ParametroFimComissao := edtComissaoFim.Text;
    AgruparFilial := true {ckbAgruparFilial.Checked};
    AgruparGrupoFilial := false {ckbAgruparGrupoFilial.Checked};
    ExibirProdutos := ckbExibirProdutos.Checked;
    IncluirDevolucoesSemContrato := ckbIncluirDevolucoesSemContrato.Checked;
    ConsiderarTrocasComoDevolucoes := ckbConsiderarTrocasComoDevolucoes.Checked;

    Resumo := rgpResumo.ItemIndex;
    MontarFiltrosRelatorio;
    MontarEventosRelatorio;
    if GerarComissaoVendedores then
      ImprimirRelatorio
    else
      MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
  end;
end;

procedure TfrmComissaoVendedores.edtComissaoFimEnter(Sender: TObject);
begin
  inherited;
  if not dataembranco(edtComissaoInicio.Text) and edtComissaoInicio.Criticar(false) then
    edtComissaoFim.Minimo:= DaysBetween(Date,StrToDate(edtComissaoInicio.Text));
end;


procedure TfrmComissaoVendedores.internoimpressao;
begin
  inherited;
  if VerificaCampos then
    GerarRelatorio;
end;

end.
