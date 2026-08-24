unit fmcadastroseriesfiliais;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, Mask, DBCtrls,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, Biblio,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Componentes
  cpnumero, cptexto, cpdbcombobox, cpdbtext, cpdbfindcontrols,
  //Repositorio
  fmcadastropadrao, fmConsultaBasica, ActnList, frconsultacontabil,
  frconsultacodigocontabil, ToolWin;

type
  TfrmCadastroSeriesFilial = class(TfrmCadastroPadrao)
    edtSerieFilial: TDBEditTexto;
    edtNumeroInicial: TDBEditNumero;
    edtNumeroFinal: TDBEditNumero;
    pnlFundoJanela: TPanel;
    flkModeloNota: TtecDBFindLookup;
    sbnProcuraModeloNota: TSpeedButton;
    dtxModeloNota: TtecDBText;
    aclAbilitar: TActionList;
    actAbilitar: TAction;
    fraConsultaModeloDoctoFiscal: TfraConsultaCodigoContabil;
    ckbSerieAtiva: TDBCheckBox;
    gbxSerie: TGroupBox;
    gbxNumeracao: TGroupBox;
    gbxNrInicial: TGroupBox;
    gbxNrFinal: TGroupBox;
    gbxModelNota: TGroupBox;
    gbxModDoctoFiscal: TGroupBox;
    ckbRequerConfirmacao: TDBCheckBox;
    procedure sbnProcuraModeloNotaClick(Sender: TObject);
    procedure edtSerieFilialExit(Sender: TObject);
    procedure actAbilitarUpdate(Sender: TObject);
  protected
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function ValidaSerieFilial: boolean;
  public
    constructor Create(AOwner: TComponent); Override;
    destructor  Destroy; override;

  end;

var
  frmCadastroSeriesFilial: TfrmCadastroSeriesFilial;

implementation

uses
  //Biblio
  ctconstantes,
  //Repositorio
  fmconsultaporcampo,
  //Projeto
  dmcadastrosinternos;

{$R *.dfm}

{ TfrmCadastroSeriesFilial }

constructor TfrmCadastroSeriesFilial.Create(AOwner: TComponent);
begin
  inherited;
  DataSet := dtmCadastrosInternos.TabelaSeriesFiliais;
  fraConsultaModeloDoctoFiscal.TipoPesquisa := pesMODELODOCTOSFISCAIS;
end;

function TfrmCadastroSeriesFilial.InternoExcluir: Boolean;
begin
  Result := dtmCadastrosInternos.ExcluirSerieFilial
end;

function TfrmCadastroSeriesFilial.InternoGravar: Boolean;
begin
  result := ValidaSerieFilial;
  if result then
    Result := dtmCadastrosInternos.GravarSeriesFilial;
end;

function TfrmCadastroSeriesFilial.InternoIncluir: Boolean;
begin
  Result := dtmCadastrosInternos.IncluirSerieFilial;
end;

function TfrmCadastroSeriesFilial.InternoPesquisar(Titulo: String): Integer;
begin
  if flkModeloNota.Focused then
    if CtrlOn then begin
      dtmCadastrosInternos.Abre(ctConsultaModeloNotaFiscal);
      Result := inherited InternoPesquisar('Modelos de Notas Fiscais');
      if Result = mrOK then
        dtmCadastrosInternos.SelecionarModeloNotaFiscal;
      dtmCadastrosInternos.Fecha(ctConsultaModeloNotaFiscal);
    end else
      Result := mrNone;
end;

function TfrmCadastroSeriesFilial.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

procedure TfrmCadastroSeriesFilial.sbnProcuraModeloNotaClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkModeloNota, '')
end;

function TfrmCadastroSeriesFilial.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmCadastrosInternos.TabelaModeloNotaFiscal
end;

procedure TfrmCadastroSeriesFilial.edtSerieFilialExit(Sender: TObject);
begin
  inherited;
  dtmCadastrosInternos.VerificarSerieFilial(edtSerieFilial.Text,
                                            edtNumeroInicial.Text,
                                            edtNumeroFinal.Text,
                                            flkModeloNota.text);
end;

procedure TfrmCadastroSeriesFilial.actAbilitarUpdate(Sender: TObject);
begin
  inherited;
  sbnExcluir.Enabled := not dtmCadastrosInternos.ExisteSerieFilialUtilizada
end;

function TfrmCadastroSeriesFilial.ValidaSerieFilial: boolean;
begin
  result := true;
  if (edtnumeroinicial.Text<>'') and (edtNumeroFinal.Text<>'') then
  begin
   if (edtnumeroinicial.ValorSemFormatacao) > (edtNumeroFinal.ValorSemFormatacao) then
   begin
    MensagemAviso(format(ctINICIALMAIORFINAL,['INICIAL','FINAL']));
    edtNumeroInicial.SetFocus;
    result := false;
   end
   else
    if dtmCadastrosInternos.VerificaIntervaloSerieFilial(edtNumeroInicial.ValorSemFormatacao) then
    begin
     MensagemAviso(format(ctNOTAJAUTILIZADA,['INICIAL']));
     edtNumeroInicial.SetFocus;
     result := false;
   end
   else
    if dtmCadastrosInternos.VerificaIntervaloSerieFilial(edtNumeroFinal.ValorSemFormatacao) then
    begin
     MensagemAviso(format(ctNOTAJAUTILIZADA,['FINAL']));
     edtNumeroFinal.SetFocus;
     result := false;
    end
  end;
end;
destructor TfrmCadastroSeriesFilial.Destroy;
begin
  inherited;
  frmCadastroSeriesFilial := nil;
end;

end.
