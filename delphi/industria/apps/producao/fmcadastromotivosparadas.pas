unit fmcadastroMotivosParadas;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadrao, ComCtrls, Buttons, ExtCtrls,
  dmcadastroMotivosParadas, Grids, DBGrids, cpdbgrid, DBCtrls, cptexto,
  Mask, cpdbfindcontrols, frconsultacodigo, ctconstantes, db, Windows,
  cpdbspinedit, cpnumero, ToolWin, frRegistroOperacoes;

type
  TfrmCadastroMotivosParadas = class(TfrmCadastroPadrao)
    gbxCodigoMaquina: TGroupBox;
    gbxDescricao: TGroupBox;
    edtDescricao: TDBEditTexto;
    edfCodigo: TtecDbEditFind;
    fraRegistroOperacoes1: TfraRegistroOperacoes;
    PageControl1: TPageControl;
    tstCadastro: TTabSheet;
    tstLog: TTabSheet;
    ckbBloqueiaMaquina: TDBCheckBox;
    ckbParadaNaoProgramada: TDBCheckBox;
    ckbNaoInfluiEficiencia: TDBCheckBox;
    procedure sbnProcurarClick(Sender: TObject);
  private
    { Private declarations }

  protected
    ConsultaMotivosParadas : TfraConsultaCodigo;
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoIncluir: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AbrirMotivoParadas(Found: Boolean) ;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmCadastroMotivosParadas: TfrmCadastroMotivosParadas;

implementation

uses frconsulta,biblio;

{$R *.dfm}

{ TfrmCadastroMotivosParadas }

procedure TfrmCadastroMotivosParadas.AbrirMotivoParadas(Found: Boolean);
begin
  edfCodigo.Text := ConsultaMotivosParadas.qryProcuraMotivosParadascodigo.AsString;
  dtmCadastroMotivosParadas.
        refazconsulta(dtmCadastroMotivosParadas.qryMotivosParadas,[0],
             [edfCodigo.Text]);
end;

constructor TfrmCadastroMotivosParadas.Create(AOwner: TComponent);
begin
  inherited;
  dtmCadastroMotivosParadas := TdtmCadastroMotivosParadas.Create(Self);
  DataSet := dtmCadastroMotivosParadas.qryMotivosParadas;

  ConsultaMotivosParadas := TfraConsultaCodigo.Create(self);
  ConsultaMotivosParadas.edfCodigo.DataSource := dtmCadastroMotivosParadas.dsrMotivosParadas;
  ConsultaMotivosParadas.edfCodigo.DataField := 'codigo';
  ConsultaMotivosParadas.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaMotivosParadas.AbrirTabelaProcura := false;
  ConsultaMotivosParadas.TipoPesquisa := pesMotivosParadas;
  ConsultaMotivosParadas.OnFound := AbrirMotivoParadas;
  ConsultaMotivosParadas.Name := 'fraConsultaMotivosParadas';

end;

destructor TfrmCadastroMotivosParadas.Destroy;
begin
  dtmCadastroMotivosParadas.qryMotivosParadas.close;
  dtmCadastroMotivosParadas := nil;
  inherited;
  frmCadastroMotivosParadas := nil;
end;

function TfrmCadastroMotivosParadas.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
      dtmCadastroMotivosParadas.ExcluirMotivosParadas;
  end;
end;

function TfrmCadastroMotivosParadas.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    dtmCadastroMotivosParadas.GravarMotivosParadas;
end;

function TfrmCadastroMotivosParadas.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
      dtmCadastroMotivosParadas.IncluirMotivosParadas;
      edtDescricao.SetFocus;
  end;
end;

procedure TfrmCadastroMotivosParadas.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not CtrlOn then
  begin
    if (key =VK_F9) then
    begin
      if sbnProcurar.Enabled then
	  begin
        ConsultaMotivosParadas.InternoPesquisar('Motivo das paradas');
        self.SetFocus;
	  end
    end;
  end;

end;

procedure TfrmCadastroMotivosParadas.sbnProcurarClick(Sender: TObject);
begin
  inherited;
  ConsultaMotivosParadas.InternoPesquisar('Motivo das paradas');
  self.SetFocus;
end;

end.
