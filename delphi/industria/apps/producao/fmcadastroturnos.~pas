unit fmcadastroTurnos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadrao, ComCtrls, Buttons, ExtCtrls,
  dmcadastroTurnos, Grids, DBGrids, cpdbgrid, DBCtrls, cptexto,
  Mask, cpdbfindcontrols, frconsultacodigo, ctconstantes, db, Windows,
  ToolWin;

type
  TfrmCadastroTurnos = class(TfrmCadastroPadrao)
    gbxCodigoNivelSalarial: TGroupBox;
    gbxDescricaoNivelSalarial: TGroupBox;
    edfCodigo: TtecDbEditFind;
    edtDescricao: TDBEditTexto;
    gbxIntervalos: TGroupBox;
    Bevel1: TBevel;
    dbgIntervalos: TtecDBGrid;
    procedure sbnProcurarClick(Sender: TObject);
    procedure sbnExcluirFuncionariosClick(Sender: TObject);
  private
    { Private declarations }

  protected
    ConsultaTurnos : TfraConsultaCodigo;
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoIncluir: Boolean; override;
    procedure AbrirTurnos;
    procedure TurnosIntervalosNewRecord(Sender: TObject);


  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmCadastroTurnos: TfrmCadastroTurnos;

implementation

uses frconsulta,biblio;

{$R *.dfm}

{ TfrmCadastroTurnos }

procedure TfrmCadastroTurnos.AbrirTurnos;
begin
  edfCodigo.Text := ConsultaTurnos.qryProcuraTurnoscodigo.AsString;
  dtmCadastroTurnos.
        refazconsulta(dtmCadastroTurnos.qryTurnos,[0],
             [edfCodigo.Text]);
end;

constructor TfrmCadastroTurnos.Create(AOwner: TComponent);
begin
  inherited;
  dtmCadastroTurnos := TdtmCadastroTurnos.Create(Self);
  DataSet := dtmCadastroTurnos.qryTurnos;

  ConsultaTurnos := TfraConsultaCodigo.Create(self);
  ConsultaTurnos.edfCodigo.DataSource := dtmCadastroTurnos.dsrTurnos;
  ConsultaTurnos.edfCodigo.DataField := 'codigo';
  ConsultaTurnos.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaTurnos.AbrirTabelaProcura := false;
  ConsultaTurnos.TipoPesquisa := pesTURNO;
  ConsultaTurnos.OnFound := AbrirTurnos;
  ConsultaTurnos.Name := 'fraConsultaTurnos';

  dbgIntervalos.OnDelete := dtmCadastroTurnos.ExcluirTurnosIntervalos;
end;

destructor TfrmCadastroTurnos.Destroy;
begin
  dtmCadastroTurnos.qryTurnos.close;
  dtmCadastroTurnos.qryTurnosIntervalos.close;
  dtmCadastroTurnos := nil;
  inherited;
  frmCadastroTurnos := nil;
end;

function TfrmCadastroTurnos.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
       dtmCadastroTurnos.ExcluirTurnos;
  end;
end;

function TfrmCadastroTurnos.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    dtmCadastroTurnos.GravarTurnos;
end;

function TfrmCadastroTurnos.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
      dtmCadastroTurnos.IncluirTurnos;
  end;
end;


procedure TfrmCadastroTurnos.sbnProcurarClick(Sender: TObject);
begin
  inherited;
  ConsultaTurnos.InternoPesquisar('Turnos');
  self.SetFocus;
end;

procedure TfrmCadastroTurnos.sbnExcluirFuncionariosClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroTurnos.ExcluirTurnosIntervalos;
end;

procedure TfrmCadastroTurnos.TurnosIntervalosNewRecord(Sender: TObject);
begin
end;

end.
