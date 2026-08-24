unit fmcadastroquestionarios;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  Grids, DBGrids, Mask, DBCtrls, ExtCtrls, Buttons,
  //Terceiros
  ZQuery,
  //Biblio
  ctconstantes,
  //Componentes
  cptexto, cpdbfindcontrols,
  //Repositorio
  fmcadastropadrao, fmconsultabasica,
  //Projeto
  dmcadastroquestionarios, ComCtrls, ToolWin;

type
  TfrmCadastroQuestionarios = class(TfrmCadastroPadrao)
    lblCodigoQuestionario: TLabel;
    dbgPerguntas: TDBGrid;
    sbnIncluirPergunta: TSpeedButton;
    sbnExcluirPergunta: TSpeedButton;
    edtDescricaoQuestionario: TDBEditTexto;
    lblDescricaoQuestionario: TLabel;
    edfCodigoQuestionario: TtecDbEditFind;
    procedure sbnIncluirPerguntaClick(Sender: TObject);
    procedure sbnExcluirPerguntaClick(Sender: TObject);
    procedure edtCodigoProcuraFound(ValueFound: Variant; Found: Boolean);
  protected
    TipoConsulta: TtecTipoConsultaQuestionario;
    procedure AlterarEstadoBotoesPerguntas;
    function  InternoExcluir: boolean; override;
    function  InternoGravar: boolean;  override;
    function  InternoIncluir: boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmCadastroQuestionarios: TfrmCadastroQuestionarios;

implementation

uses
  //CLX
  {Qete,}
  //Repostorio
  fmconsultaporcampo;

{$R *.dfm}

{ TfrmCadastroQuestionarios }

constructor TfrmCadastroQuestionarios.create(AOwner: TComponent);
begin
  dtmCadastroQuestionarios:= TdtmCadastroQuestionarios.Create(Self);
  inherited;
  dtmCadastroQuestionarios.Abre(ctCadastroQuestionarios);
  DataSet := dtmCadastroQuestionarios.TabelaQuestionario;
end;

destructor TfrmCadastroQuestionarios.Destroy;
begin
  dtmCadastroQuestionarios.Fecha(ctCadastroQuestionarios);
  dtmCadastroQuestionarios:=nil;
  inherited;
  frmCadastroQuestionarios:= nil;
end;

procedure TfrmCadastroQuestionarios.AlterarEstadoBotoesPerguntas;
begin
//  sbnIncluirPergunta.Enabled := dtmCadastroQuestionario.QuestionarioValido;
  sbnExcluirPergunta.Enabled := dtmCadastroQuestionarios.QuestionarioPossuiPergunta;
end;

procedure TfrmCadastroQuestionarios.edtCodigoProcuraFound(ValueFound: Variant;
  Found: Boolean);
begin
  inherited;
  AlterarEstadoBotoesPerguntas;
end;

function TfrmCadastroQuestionarios.InternoExcluir: boolean;
begin
  if CtrlOn then begin
    if (ActiveControl is TDBGrid) then
      dtmCadastroQuestionarios.RetirarPerguntaDoQuestionario;
    Result:= True;
  end
  else begin
    Result := dtmCadastroQuestionarios.ExcluirQuestionario;
    if Result then begin
      AlterarEstadoBotoesPerguntas;
      Result := inherited InternoExcluir;
    end
  end
end;

function TfrmCadastroQuestionarios.InternoGravar: boolean;
begin
  Result := inherited InternoGravar;
  if Result then begin
    Result := dtmCadastroQuestionarios.GravarQuestionario;
    AlterarEstadoBotoesPerguntas;
  end
end;

function TfrmCadastroQuestionarios.InternoIncluir: boolean;
begin
  if CtrlOn then begin
    if (ActiveControl is TDBGrid) then
      sbnIncluirPergunta.Click;
    Result:= True;
  end
  else begin
    Result := inherited InternoIncluir;
    if Result then begin
      dtmCadastroQuestionarios.IncluirQuestionario;
      AlterarEstadoBotoesPerguntas;
    end
  end
end;

function TfrmCadastroQuestionarios.InternoPesquisar(Titulo:String): Integer;
begin
  if not CtrlOn then begin
    TipoConsulta := tcqQUESTIONARIO;
    dtmCadastroQuestionarios.Abre(ctTabelasConsultaQuestionarios);
    Result := inherited InternoPesquisar('Questionários');
    if Result  = mrok then begin
      dtmCadastroQuestionarios.PosicionarQuestionario;
    end;
    dtmCadastroQuestionarios.Fecha(ctTabelasConsultaQuestionarios);
    AlterarEstadoBotoesPerguntas;
  end
  else
    Result:= 0;
end;

procedure TfrmCadastroQuestionarios.sbnIncluirPerguntaClick(Sender: TObject);
begin
  TipoConsulta := tcqPERGUNTASNAOINCLUIDAS;
  dtmCadastroQuestionarios.AbreTabelasConsultaPergNaoIncluidas;
  if inherited InternoPesquisar('Perguntas') = mrok then
    dtmCadastroQuestionarios.IncluirPerguntaNoQuestionario;
  dtmCadastroQuestionarios.Fecha(ctTabelasConsultaPergNaoIncluidas);
  AlterarEstadoBotoesPerguntas;
end;

procedure TfrmCadastroQuestionarios.sbnExcluirPerguntaClick(Sender: TObject);
begin
  inherited;
  dtmCadastroQuestionarios.RetirarPerguntaDoQuestionario;
  AlterarEstadoBotoesPerguntas;
end;

function TfrmCadastroQuestionarios.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  if TipoConsulta = tcqQUESTIONARIO then
    Result := dtmCadastroQuestionarios.ExisteQuestionario(Parametro, NomeCampo, Value)
  else
    Result := dtmCadastroQuestionarios.ExistePerguntaNaoIncluida(Parametro, NomeCampo, Value)
end;

function TfrmCadastroQuestionarios.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  if TipoConsulta = tcqPERGUNTASNAOINCLUIDAS then
    TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

function TfrmCadastroQuestionarios.TabelaDePesquisa: TZDataSet;
begin
  if TipoConsulta = tcqQUESTIONARIO then
    Result := dtmCadastroQuestionarios.TabelaConsultaQuestionario
  else
    Result := dtmCadastroQuestionarios.TabelaPerguntasNaoIncluidas
end;


end.
