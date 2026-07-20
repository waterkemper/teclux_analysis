unit fmparametroscredito;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, Grids, DBGrids, Windows,
  {Qete,} cpdbgrid, cppagecontrol, ExtCtrls, cpnumero, dmparametroscredito,
  ctconstantes, fmnavcontroles, ToolWin;

type
  TfrmParametrosCredito = class(TfrmNavControles)
    pnlFundoJanela: TPanel;
    tblBarra: TToolBar;
    sbnSalvar: TSpeedButton;
    sbnAjuda: TSpeedButton;
    sbnExcluir: TSpeedButton;
    tbnDivisor: TToolButton;
    pgcParametros: TtecPageControl;
    tstParametros: TTabSheet;
    dbgParametros: TtecDBGrid;
    dbgParametrosUnicos: TtecDBGrid;
    dbgLimites: TtecDBGrid;
    rgpDescontarDebitoMes: TRadioGroup;
    tstFaixas: TTabSheet;
    gbxIdade: TGroupBox;
    sbnExcluirIdade: TSpeedButton;
    dbgIdade: TtecDBGrid;
    gbxRendaConjuge: TGroupBox;
    sbnExcluirRendaConjuge: TSpeedButton;
    dbgRendaConjuge: TtecDBGrid;
    gbxTempoResidencia: TGroupBox;
    sbnExcluirTempoResidencia: TSpeedButton;
    dbgTempoResidencia: TtecDBGrid;
    gbxTempoServico: TGroupBox;
    sbnExcluirTempoServico: TSpeedButton;
    dbgTempoServico: TtecDBGrid;
    gbxMDA: TGroupBox;
    sbnExcluirMDA: TSpeedButton;
    dbgMDA: TtecDBGrid;
    gbxPrestacoesPagas: TGroupBox;
    sbnExcluirPrestacoesPagas: TSpeedButton;
    dbgPrestacoesPagas: TtecDBGrid;
    gbxTempoCasamento: TGroupBox;
    sbnExcluirTempoCasamento: TSpeedButton;
    dbgTempoCasamento: TtecDBGrid;
    gbxPontuacao: TGroupBox;
    sbnExcluirPontuacao: TSpeedButton;
    dbgPontuacao: TtecDBGrid;
    dbgResidencia: TtecDBGrid;
    dbgTelefone: TtecDBGrid;
    dbgReferencia: TtecDBGrid;
    dbgSexo: TtecDBGrid;
    dbgNaoInformado: TtecDBGrid;
    dbgEstadoCivil: TtecDBGrid;
    stxDescontar: TStaticText;
    stxDebitosMes: TStaticText;
    procedure sbnSalvarClick(Sender: TObject);
    procedure sbnExcluirIdadeClick(Sender: TObject);
    procedure sbnExcluirTempoCasamentoClick(Sender: TObject);
    procedure sbnExcluirTempoResidenciaClick(Sender: TObject);
    procedure sbnExcluirTempoServicoClick(Sender: TObject);
    procedure sbnExcluirRendaConjugeClick(Sender: TObject);
    procedure sbnExcluirMDAClick(Sender: TObject);
    procedure sbnExcluirPrestacoesPagasClick(Sender: TObject);
    procedure sbnExcluirPontuacaoClick(Sender: TObject);
    procedure dbgIdadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgTempoCasamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgTempoResidenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgTempoServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgRendaConjugeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgMDAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgPrestacoesPagasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgPontuacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgIdadeExit(Sender: TObject);
    procedure dbgTempoCasamentoExit(Sender: TObject);
    procedure dbgTempoResidenciaExit(Sender: TObject);
    procedure dbgTempoServicoExit(Sender: TObject);
    procedure dbgRendaConjugeExit(Sender: TObject);
    procedure dbgMDAExit(Sender: TObject);
    procedure dbgPrestacoesPagasExit(Sender: TObject);
    procedure dbgPontuacaoExit(Sender: TObject);
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  private
    { Private declarations }
    procedure LerParametros;
    procedure GravarParametros;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmParametrosCredito: TfrmParametrosCredito;

implementation

uses dmbasico;

{$R *.dfm}

{ TfrmParametrosCredito }

constructor TfrmParametrosCredito.Create(AOwner: TComponent);
begin
  inherited;
  dtmParametrosCredito := TdtmParametrosCredito.Create(Self);
  stxDescontar. Height:= 12;
  stxDebitosMes.Height:= 12;
  LerParametros;
  pgcParametros.ActivePage := tstParametros;
  dbgParametros.SetFocus;
end;

destructor TfrmParametrosCredito.Destroy;
begin
  dtmParametrosCredito:=nil;
  inherited;
  frmParametrosCredito := nil;
end;

procedure TfrmParametrosCredito.GravarParametros;
begin
  if rgpDescontarDebitoMes.ItemIndex = 0 then
    dtmParametrosCredito.DescontarDebitoMes := True
  else dtmParametrosCredito.DescontarDebitoMes := False;
  dtmParametrosCredito.GravarParametros;
end;

procedure TfrmParametrosCredito.LerParametros;
begin
  if dtmParametrosCredito.DescontarDebitoMes then
    rgpDescontarDebitoMes.ItemIndex := 0
  else rgpDescontarDebitoMes.ItemIndex := 1;
end;

procedure TfrmParametrosCredito.sbnSalvarClick(Sender: TObject);
begin
  inherited;
  GravarParametros;
end;

procedure TfrmParametrosCredito.sbnExcluirIdadeClick(Sender: TObject);
begin
  inherited;
  dtmParametrosCredito.Excluir(pcrIDADE);
end;

procedure TfrmParametrosCredito.sbnExcluirTempoCasamentoClick(
  Sender: TObject);
begin
  inherited;
  dtmParametrosCredito.Excluir(pcrCASAMENTO);
end;

procedure TfrmParametrosCredito.sbnExcluirTempoResidenciaClick(
  Sender: TObject);
begin
  inherited;
  dtmParametrosCredito.Excluir(pcrRESIDENCIA);
end;

procedure TfrmParametrosCredito.sbnExcluirTempoServicoClick(
  Sender: TObject);
begin
  inherited;
  dtmParametrosCredito.Excluir(pcrSERVICO);
end;

procedure TfrmParametrosCredito.sbnExcluirRendaConjugeClick(
  Sender: TObject);
begin
  inherited;
  dtmParametrosCredito.Excluir(pcrRENDACONJUGE);
end;

procedure TfrmParametrosCredito.sbnExcluirMDAClick(Sender: TObject);
begin
  inherited;
  dtmParametrosCredito.Excluir(pcrMDA);
end;

procedure TfrmParametrosCredito.sbnExcluirPrestacoesPagasClick(
  Sender: TObject);
begin
  inherited;
  dtmParametrosCredito.Excluir(pcrPRESTACOESPAGAS);
end;

procedure TfrmParametrosCredito.sbnExcluirPontuacaoClick(Sender: TObject);
begin
  inherited;
  dtmParametrosCredito.Excluir(pcrPONTUACAO);
end;

procedure TfrmParametrosCredito.dbgIdadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP:     dtmParametrosCredito.verificaPreenchimento(pcrIDADE);
  end
end;

procedure TfrmParametrosCredito.dbgTempoCasamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP:     dtmParametrosCredito.verificaPreenchimento(pcrCASAMENTO);
  end
end;

procedure TfrmParametrosCredito.dbgTempoResidenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP:     dtmParametrosCredito.verificaPreenchimento(pcrRESIDENCIA);
  end;
end;

procedure TfrmParametrosCredito.dbgTempoServicoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP:     dtmParametrosCredito.VerificaPreenchimento(pcrSERVICO);
  end;
end;

procedure TfrmParametrosCredito.dbgRendaConjugeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP:     dtmParametrosCredito.VerificaPreenchimento(pcrRENDACONJUGE);
  end;
end;

procedure TfrmParametrosCredito.dbgMDAKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP:     dtmParametrosCredito.VerificaPreenchimento(pcrMDA);
  end;
end;

procedure TfrmParametrosCredito.dbgPrestacoesPagasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP:     dtmParametrosCredito.VerificaPreenchimento(pcrPRESTACOESPAGAS);
  end;
end;

procedure TfrmParametrosCredito.dbgPontuacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP:     dtmParametrosCredito.VerificaPreenchimento(pcrPONTUACAO);
  end;
end;

procedure TfrmParametrosCredito.dbgIdadeExit(Sender: TObject);
begin
  inherited;
  dtmParametrosCredito.EditaValorMaximo([pcrIDADE]);
end;

procedure TfrmParametrosCredito.dbgTempoCasamentoExit(Sender: TObject);
begin
  inherited;
  dtmParametrosCredito.EditaValorMaximo([pcrCASAMENTO]);
end;

procedure TfrmParametrosCredito.dbgTempoResidenciaExit(Sender: TObject);
begin
  inherited;
  dtmParametrosCredito.EditaValorMaximo([pcrRESIDENCIA]);
end;

procedure TfrmParametrosCredito.dbgTempoServicoExit(Sender: TObject);
begin
  inherited;
  dtmParametrosCredito.EditaValorMaximo([pcrSERVICO]);
end;

procedure TfrmParametrosCredito.dbgRendaConjugeExit(Sender: TObject);
begin
  inherited;
  dtmParametrosCredito.EditaValorMaximo([pcrRENDACONJUGE]);
end;

procedure TfrmParametrosCredito.dbgMDAExit(Sender: TObject);
begin
  inherited;
  dtmParametrosCredito.EditaValorMaximo([pcrMDA]);
end;

procedure TfrmParametrosCredito.dbgPrestacoesPagasExit(Sender: TObject);
begin
  inherited;
  dtmParametrosCredito.EditaValorMaximo([pcrPRESTACOESPAGAS]);
end;

procedure TfrmParametrosCredito.dbgPontuacaoExit(Sender: TObject);
begin
  inherited;
  dtmParametrosCredito.EditaValorMaximo([pcrPONTUACAO]);
end;

procedure TfrmParametrosCredito.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Shift = [] then
    if (Key = VK_F5) and sbnSalvar.Enabled then
      GravarParametros
    else if Key = VK_ESCAPE then
      LerParametros
end;

end.
