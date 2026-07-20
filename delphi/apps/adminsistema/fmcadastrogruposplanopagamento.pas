unit fmcadastrogruposplanopagamento;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons,
  //Terceiros
  ZQuery, 
  //Componentes
  cpdbtext, cpdbfindcontrols,
  //Repositorio
  fmcadastropadrao, fmconsultabasica, ComCtrls, ToolWin;

type
  TfrmCadastroGrupoPlanoPagamento = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    flkCodigoGrupo: TtecDBFindLookup;
    dtxDescricaoGrupo: TtecDBText;
    sbnGrupo: TSpeedButton;
    lblCodigoGrupo: TLabel;
    procedure sbnGrupoClick(Sender: TObject);
    procedure flkCodigoGrupoMessage(var Msg: String);
  protected
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmCadastroGrupoPlanoPagamento: TfrmCadastroGrupoPlanoPagamento;

implementation

uses
  //Biblio
  ctconstantes,
  //Repositorio
  fmconsultaporcampo,
  //Projeto
  dmcadastroplanospagamentos, fmnavcontroles;

{$R *.dfm}


{ TfrmCadastroGrupoPlanoPagamento }

constructor TfrmCadastroGrupoPlanoPagamento.Create(AOwner: TComponent);
begin
  inherited;
  DataSet := dtmCadastroPlanosPagamentos.TabelaGrupoPlanos
end;

destructor TfrmCadastroGrupoPlanoPagamento.Destroy;
begin
  inherited;
  frmCadastroGrupoPlanoPagamento := nil
end;

function TfrmCadastroGrupoPlanoPagamento.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmCadastroPlanosPagamentos.ExisteGrupoPlano(NomeCampo, Value)
end;

procedure TfrmCadastroGrupoPlanoPagamento.flkCodigoGrupoMessage(var Msg: String);
begin
  inherited;
  Msg := Format(ctGRUPOCADASTRADOOUINEXISTENTE, [ctGRUPO, flkCodigoGrupo.Text])
end;

function TfrmCadastroGrupoPlanoPagamento.InternoExcluir: Boolean;
begin
  Result := dtmCadastroPlanosPagamentos.ExcluirGrupoPlano
end;

function TfrmCadastroGrupoPlanoPagamento.InternoGravar: Boolean;
begin
  Result:= False;
  if flkCodigoGrupo.Exist then
    dtmCadastroPlanosPagamentos.GravarGrupoPlano
end;

function TfrmCadastroGrupoPlanoPagamento.InternoIncluir: Boolean;
begin
  Result := dtmCadastroPlanosPagamentos.IncluirGrupoPlano
end;

function TfrmCadastroGrupoPlanoPagamento.InternoPesquisar(Titulo: String): Integer;
begin
  dtmCadastroPlanosPagamentos.Abre(ctCrediarioConsultaGrupos);
  Result:= inherited InternoPesquisar(Titulo);
  if Result = mrOK then
    dtmCadastroPlanosPagamentos.SelecionarGrupoPlano;
  dtmCadastroPlanosPagamentos.Fecha(ctCrediarioConsultaGrupos);
end;

function TfrmCadastroGrupoPlanoPagamento.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa:= True;
end;

procedure TfrmCadastroGrupoPlanoPagamento.sbnGrupoClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkCodigoGrupo, ctGRUPOS)
end;

function TfrmCadastroGrupoPlanoPagamento.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmCadastroPlanosPagamentos.TabelaConsultaGrupoPlanos
end;

end.
