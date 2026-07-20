unit fmsac;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  Menus, Types, ExtCtrls, ComCtrls,
  //Repositorio
  dmtecsoft, fmprincipalbasico;

type
  TfrmSAC = class(TfrmPrincipalBasico)
    mmuSAC: TMainMenu;
    mitCadastros: TMenuItem;
    mitPergunta: TMenuItem;
    mitQuestionario: TMenuItem;
    mitAtendimentoSAC: TMenuItem;
    mitAtendimento: TMenuItem;
    bvlsac: TBevel;
    imgsac: TImage;
    mitSair: TMenuItem;
    N1: TMenuItem;
    mitLigacao: TMenuItem;
    mitUsuario: TMenuItem;
    mitFiltro: TMenuItem;
    mitManutencaoContato: TMenuItem;
    mitManutencaoLigacao: TMenuItem;
    mitRelatoriosSAC: TMenuItem;
    mitEstatistico: TMenuItem;
    mitRelatorioAtendimento: TMenuItem;
    mitAtendentes: TMenuItem;
    mitResumoLigacoes: TMenuItem;
    mitTiposAtendimentos: TMenuItem;
    mitResultadosdosContatos: TMenuItem;
    mitEstatsticodeRespostaAnaltico: TMenuItem;
    TrocadeSenha1: TMenuItem;
    Trocadesenha2: TMenuItem;
    procedure mitPerguntaClick(Sender: TObject);
    procedure mitQuestionarioClick(Sender: TObject);
    procedure mitAtendimentoClick(Sender: TObject);
    procedure mitSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mitLigacaoClick(Sender: TObject);
    procedure mitUsuarioClick(Sender: TObject);
    procedure mitFiltroClick(Sender: TObject);
    procedure mitManutencaoContatoClick(Sender: TObject);
    procedure mitManutencaoLigacaoClick(Sender: TObject);
    procedure mitEstatisticoClick(Sender: TObject);
    procedure mitRelatorioAtendimentoClick(Sender: TObject);
    procedure mitAtendentesClick(Sender: TObject);
    procedure mitResumoLigacoesClick(Sender: TObject);
    procedure mitTiposAtendimentosClick(Sender: TObject);
    procedure mitResultadosdosContatosClick(Sender: TObject);
    procedure mitEstatsticodeRespostaAnalticoClick(Sender: TObject);
    procedure Trocadesenha2Click(Sender: TObject);
  public
    constructor Create(AOnwer: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmSAC: TfrmSAC;

implementation

uses
  //Biblio
  ctconstantes,
  //Projetos
  dmsac, fmcadastroperguntas, fmcadastroquestionarios, fmaplicaquestionario,
  fmcadastrofiltros, fmcadastrocontatos,
  fmmanutencaoligacao, fmrelatoriosac, fmrelatorioatendimento, fmatendentes,
  fmrelatorioresumoligacoes, fmcadastrotiposatendimentos,
  fmrelatoriovendascontatos, fmrelatorioestatisticoanalitico, fmtrocasenha,
  fmcadastroatendimento;

{$R *.dfm}

constructor TfrmSAC.Create(AOnwer: TComponent);
begin
  inherited;
  if Not Assigned(dtmSAC) then
    dtmSAC := TdtmSAC.Create(Application);
//  mitLigacao.Enabled:= dtmTecSoft.FazerAtendimento;
end;

destructor TfrmSAC.Destroy;
begin
   inherited;
   frmSAC:= nil;
end;

procedure TfrmSAC.mitPerguntaClick(Sender: TObject);
begin
  if not Assigned(frmCadastroPerguntas) then
    frmCadastroPerguntas := TfrmCadastroPerguntas.Create(Self);
  frmCadastroPerguntas.Show;
end;

procedure TfrmSAC.mitQuestionarioClick(Sender: TObject);
begin
  if not Assigned(frmCadastroQuestionarios) then
    frmCadastroQuestionarios := TfrmCadastroQuestionarios.Create(Self);
  frmCadastroQuestionarios.Show;
end;

procedure TfrmSAC.mitAtendimentoClick(Sender: TObject);
begin
  if not Assigned(frmcadastroatendimento) then
    frmcadastroatendimento := Tfrmcadastroatendimento.Create(Self);
  frmcadastroatendimento.OnActivate:= nil;
  frmcadastroatendimento.show;
end;

procedure TfrmSAC.mitSairClick(Sender: TObject);
begin
  inherited;
  Close
end;

procedure TfrmSAC.FormShow(Sender: TObject);
begin
  inherited;
  if dtmSAC.Atendente then
//    mitLigacoesClick(mitLigacoes);
end;

procedure TfrmSAC.mitLigacaoClick(Sender: TObject);
begin
  inherited;
  if Not Assigned(frmAplicaQuestionario) then
    frmAplicaQuestionario := TfrmAplicaQuestionario.Create(Self);
  frmAplicaQuestionario.Show
end;

procedure TfrmSAC.mitUsuarioClick(Sender: TObject);
Begin
  inherited;
//  If Not Assigned(frmCadastroUsuarios) Then
//    frmCadastroUsuarios := TfrmCadastroUsuarios.Create(Self);
//  frmCadastroUsuarios.Show
end;

procedure TfrmSAC.mitFiltroClick(Sender: TObject);
begin
  inherited;
  if Not Assigned(frmCadastroFiltros) then
    frmCadastroFiltros := TfrmCadastroFiltros.Create(Self);
  frmCadastroFiltros.Show
end;

procedure TfrmSAC.mitManutencaoContatoClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmCadastroContatos) then
    frmCadastroContatos := TfrmCadastroContatos.Create(Self);
  frmCadastroContatos.Show
end;

procedure TfrmSAC.mitManutencaoLigacaoClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmManutencaoLigacao) then
    frmManutencaoLigacao := TfrmManutencaoLigacao.Create(Self);
  frmManutencaoLigacao.Show
end;

procedure TfrmSAC.mitEstatisticoClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmrelatoriosac) then
    frmrelatoriosac := Tfrmrelatoriosac.Create(Self);
  frmrelatoriosac.Show
end;

procedure TfrmSAC.mitRelatorioAtendimentoClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmRelatorioAtendimento) then
    frmRelatorioAtendimento := TfrmRelatorioAtendimento.Create(Self);
  frmRelatorioAtendimento.Show
end;

procedure TfrmSAC.mitAtendentesClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmAtendentes) then
    frmAtendentes := TfrmAtendentes.Create(Self);
  frmAtendentes.Show
end;

procedure TfrmSAC.mitResumoLigacoesClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmRelatorioResumoLigacoes) then
    frmRelatorioResumoLigacoes := TfrmRelatorioResumoLigacoes.Create(Self);
  frmRelatorioResumoLigacoes.Show
end;

procedure TfrmSAC.mitTiposAtendimentosClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmCadastroTiposAtendimentos) then
    frmCadastroTiposAtendimentos := TfrmCadastroTiposAtendimentos.Create(Self);
  frmCadastroTiposAtendimentos.Show
end;

procedure TfrmSAC.mitResultadosdosContatosClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmRelatorioVendasContatos) then
    frmRelatorioVendasContatos := TfrmRelatorioVendasContatos.Create(Self);
  frmRelatorioVendasContatos.Show
end;

procedure TfrmSAC.mitEstatsticodeRespostaAnalticoClick(Sender: TObject);
begin
  inherited;
  if not Assigned(frmRelatorioEstatisticoAnalitico) then
    frmRelatorioEstatisticoAnalitico := TfrmRelatorioEstatisticoAnalitico.Create(Self);
  frmRelatorioEstatisticoAnalitico.Show
end;

procedure TfrmSAC.Trocadesenha2Click(Sender: TObject);
begin
  inherited;
  if not Assigned(frmTrocaSenha) then
    frmTrocaSenha := TfrmTrocaSenha.Create(Self);
  frmTrocaSenha.Show
end;

end.
