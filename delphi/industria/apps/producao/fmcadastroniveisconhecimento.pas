unit fmcadastroniveisconhecimento;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadrao, ComCtrls, Buttons, ExtCtrls,
  dmcadastroniveisconhecimento, Grids, DBGrids, cpdbgrid, DBCtrls, cptexto,
  Mask, cpdbfindcontrols, frconsultacodigo, ctconstantes, db, Windows,
  cpdbspinedit, cpnumero, ToolWin;

type
  TfrmCadastroNiveisConhecimento = class(TfrmCadastroPadrao)
    gbxCodigoMaquina: TGroupBox;
    gbxDescricao: TGroupBox;
    edtDescricao: TDBEditTexto;
    edfCodigo: TtecDbEditFind;
    procedure sbnProcurarClick(Sender: TObject);
  private
    { Private declarations }

  protected
    ConsultaNiveisConhecimento : TfraConsultaCodigo;
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoIncluir: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AbrirNivelConhecimento(Found: Boolean);

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmCadastroNiveisConhecimento: TfrmCadastroNiveisConhecimento;

implementation

uses frconsulta,biblio;

{$R *.dfm}

{ TfrmCadastroniveisconhecimento }

procedure TfrmCadastroNiveisConhecimento.AbrirNivelConhecimento(Found: Boolean);
begin
  edfCodigo.Text := ConsultaNiveisConhecimento.qryProcuraNiveislConhecimentocodigo.AsString;
  dtmCadastroniveisconhecimento.
        refazconsulta(dtmCadastroniveisconhecimento.qryNiveisConhecimento,[0],
             [edfCodigo.Text]);
end;

constructor TfrmCadastroNiveisConhecimento.Create(AOwner: TComponent);
begin
  inherited;
  dtmCadastroniveisconhecimento := TdtmCadastroniveisconhecimento.Create(Self);
  DataSet := dtmCadastroniveisconhecimento.qryNiveisConhecimento;

  ConsultaNiveisConhecimento := TfraConsultaCodigo.Create(self);
  ConsultaNiveisConhecimento.edfCodigo.DataSource := dtmCadastroniveisconhecimento.dsrNiveisConhecimento;
  ConsultaNiveisConhecimento.edfCodigo.DataField := 'codigo';
  ConsultaNiveisConhecimento.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaNiveisConhecimento.AbrirTabelaProcura := false;
  ConsultaNiveisConhecimento.TipoPesquisa := pesNIVEISCONHECIMENTO;
  ConsultaNiveisConhecimento.OnFound := AbrirNivelConhecimento;
  ConsultaNiveisConhecimento.Name := 'fraConsultaNiveisConhecimento';

end;

destructor TfrmCadastroNiveisConhecimento.Destroy;
begin
  dtmCadastroniveisconhecimento.qryNiveisConhecimento.close;
  dtmCadastroniveisconhecimento := nil;
  inherited;
  frmCadastroniveisconhecimento := nil;
end;

function TfrmCadastroNiveisConhecimento.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
      dtmCadastroniveisconhecimento.ExcluirNiveisConhecimento;
  end;
end;

function TfrmCadastroNiveisConhecimento.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    dtmCadastroniveisconhecimento.GravarNiveisConhecimento;
end;

function TfrmCadastroNiveisConhecimento.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
      dtmCadastroniveisconhecimento.IncluirNiveisConhecimento;
      edtDescricao.SetFocus;
  end;
end;

procedure TfrmCadastroNiveisConhecimento.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not CtrlOn then
  begin
    if (key =VK_F9) then
    begin
      if sbnProcurar.Enabled then
	  begin
        ConsultaNiveisConhecimento.InternoPesquisar('Níveis de Conhecimento');
        self.SetFocus;
	  end
    end;
  end;

end;

procedure TfrmCadastroNiveisConhecimento.sbnProcurarClick(Sender: TObject);
begin
  inherited;
  ConsultaNiveisConhecimento.InternoPesquisar('Níveis de Conhecimento');
  self.SetFocus;
end;

end.
