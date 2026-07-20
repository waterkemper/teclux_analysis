unit fmcomissaocobradores;

interface

uses
  SysUtils, Windows, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask, DBCtrls, {QCheckLst,}
  // Terceiros
  ZQuery,
  // Constantes
  ctconstantes, biblio,
  // Repositorio
  fmajudabt, fmconsultabasica, fmconsultaporcampo,
  // Componentes
  cppagecontrol, cpnumero, cpdata, cpdbtext, cpdbfindcontrols,
  cpeditioncontrolvalidation, ZLibPgSql, DB, ZPgSqlQuery, cpquery,
  CheckLst, ToolWin;

type
  TfrmComissaoCobradores = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    gbxCobrador: TGroupBox;
    sbnProcurarVendedor: TSpeedButton;
    edfCobrador: TtecDbEditFind;
    gbxPeriodoComissao: TGroupBox;
    gbxPeriodoMeta: TGroupBox;
    dtxCobrador: TtecDBText;
    gbxEventos: TGroupBox;
    clbEventos: TCheckListBox;
    sbnMarcarEventos: TSpeedButton;
    sbnDesmarcarEventos: TSpeedButton;
    ecvValida: TtecEditionControlValidation;
    gbxTipoRelatorio: TGroupBox;
    rbnAnalitico: TRadioButton;
    rbnSintetico: TRadioButton;
    rbnResumoFolha: TRadioButton;
    sbnGerar: TSpeedButton;
    gbxGlobal: TGroupBox;
    dedComissaoInicio: TEditData;
    dedComissaoFim: TEditData;
    dedMetaInicio: TEditData;
    dedMetaFim: TEditData;
    lblAComissoes: TLabel;
    lblAMetas: TLabel;
    procedure sbnProcurarVendedorClick(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnMarcarEventosClick(Sender: TObject);
    procedure sbnDesmarcarEventosClick(Sender: TObject);
    procedure clbEventosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure clbEventosClickCheck(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoPesquisar(Titulo: String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function PesquisaHabilitada: Boolean;
    function VerificaCampos: Boolean;
    procedure LimpaControles;
    procedure GerarRelatorio;
    procedure MontarEventosRelatorio;
  end;

var
  frmComissaoCobradores: TfrmComissaoCobradores;
  TipoPesquisa: TtecPesquisa;
  ControleValido: TWinControl;  

implementation

uses dmcomissaocobradores, {Qete,} dmbasico;

{$R *.dfm}

constructor TfrmComissaoCobradores.Create(AOwner: TComponent);
begin
  inherited;
  dtmComissaoCobradores := TdtmComissaoCobradores.Create(Self);
  MarcarLista(clbEventos, True);
  dedComissaoInicio.Text := DateToStr(UltimoDiaMesPassado(1));
  dedComissaoFim.Text := DateToStr(DataLocal);
  dedMetaInicio.Text := DateToStr(UltimoDiaMesPassado(1));
  dedMetaFim.Text := DateToStr(DataLocal);
end;

destructor TfrmComissaoCobradores.Destroy;
begin
  frmComissaoCobradores := nil;
  inherited;
end;

procedure TfrmComissaoCobradores.sbnProcurarVendedorClick(Sender: TObject);
begin
  CtrlOn := True;
  ActiveControl := edfCobrador;
  InternoPesquisar('Cobrador');
end;

procedure TfrmComissaoCobradores.sbnGerarClick(Sender: TObject);
begin
  if VerificaCampos then
    MensagemAviso('MÓDULO NÃO ACABADO')
    //GerarRelatorio
end;

function TfrmComissaoCobradores.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmComissaoCobradores.ExisteCobrador(NomeCampo, Value);
end;

function TfrmComissaoCobradores.InternoPesquisar(Titulo: String): Integer;
begin
  if PesquisaHabilitada then
    with dtmComissaoCobradores do
    begin
      Abre(ctPesquisaVendedor);
      Result:= inherited InternoPesquisar(Titulo);
      if Result = mrOK then
        SelecionarCobrador;
      Fecha(ctPesquisaVendedor);
    end
  else
    Result:= 0;
end;

function TfrmComissaoCobradores.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmComissaoCobradores.qryConsultaCobradores;
end;

function TfrmComissaoCobradores.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmComissaoCobradores.PesquisaHabilitada: Boolean;
begin
  Result := False;
  if (CtrlOn) and (ActiveControl = edfCobrador) then
    Result := True;
end;

procedure TfrmComissaoCobradores.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_ESCAPE: LimpaControles;
      VK_F7: sbnGerar.Click;
  end;
  inherited;
end;

procedure TfrmComissaoCobradores.LimpaControles;
begin
  dtmComissaoCobradores.SelecionarCobrador;
end;

procedure TfrmComissaoCobradores.GerarRelatorio;
begin
  with dtmComissaoCobradores do
  begin
    ParametroCobrador := edfCobrador.Text;
    ParametroInicioComissao := dedComissaoInicio.Text;
    ParametroFimComissao := dedComissaoFim.Text;
    ParametroInicioMeta := dedMetaInicio.Text;
    ParametroFimMeta := dedMetaFim.Text;
    if rbnAnalitico.Checked then
      TipoRelatorio := TtecRelatorioComissao(0);
    if rbnSintetico.Checked then
      TipoRelatorio := TtecRelatorioComissao(1);
    if rbnResumoFolha.Checked then
      TipoRelatorio := TtecRelatorioComissao(2);
    if ParametroAlterado then
    begin
      ExcluirTabelas;
      MontarEventosRelatorio;
      GerarComissaoCobradores;
    end
    else
    begin
     if TipoRelatorio =trResumoFolha then
      qryResumoFolha.Open
     else
      qryComissao.Open;
    end;

    if not qryComissao.IsEmpty or not qryResumoFolha.IsEmpty then
    begin
     case TipoRelatorio of
      trANALITICO: frpAnalitico.ShowReport;
      trSINTETICO: frpSintetico.ShowReport;
      trRESUMOFOLHA: frpResumoFolha.ShowReport;
     end;
    end
    else
    begin
     MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
     dedComissaoInicio.SetFocus;
    end;
    ParametroAlterado := False;
  end;
end;

function TfrmComissaoCobradores.VerificaCampos: Boolean;
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
     if strtodate(dedComissaoInicio.Text)>strtodate(dedComissaoFim.Text) then
     begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      dedComissaoInicio.setfocus;
      result:=false;
     end;
     if Result then
      if strtodate(dedMetaInicio.Text)>strtodate(dedMetaFim.Text) then
      begin
       MensagemAviso(ctDTINICIALMAIORDTFINAL);
       dedMetaInicio.setfocus;
       result:=false;
      end;
      if Result then
         Result:=OperadorTernario(Trim(edfCobrador.Text) <> '', edfCobrador.Exist, True);
  end
  else
    MensagemAviso(Format(ctINFORME,['um evento para o cálculo de comissão.']));
end;

procedure TfrmComissaoCobradores.sbnMarcarEventosClick(Sender: TObject);
begin
  MarcarLista(clbEventos, True);
  dtmComissaoCobradores.ParametroAlterado := True;
end;

procedure TfrmComissaoCobradores.sbnDesmarcarEventosClick(Sender: TObject);
begin
  MarcarLista(clbEventos, False);
  dtmComissaoCobradores.ParametroAlterado := True;
end;

procedure TfrmComissaoCobradores.clbEventosClickCheck(Sender: TObject);
begin
  dtmComissaoCobradores.ParametroAlterado := True;
end;

procedure TfrmComissaoCobradores.clbEventosKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      TeclaInserirRegistro : sbnMarcarEventos.Click;
      TeclaExcluirLista    : sbnDesmarcarEventos.Click;
    end;
    dtmComissaoCobradores.ParametroAlterado := True;
  end;
end;

procedure TfrmComissaoCobradores.MontarEventosRelatorio;
begin
  dtmComissaoCobradores.MontarEventos(clbEventos);
end;

procedure TfrmComissaoCobradores.FormShow(Sender: TObject);
begin
  inherited;
  dedComissaoInicio.SetFocus;
end;

end.
