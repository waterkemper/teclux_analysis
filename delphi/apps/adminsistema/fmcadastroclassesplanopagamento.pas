unit fmcadastroclassesplanopagamento;

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
  TfrmCadastroClassePlanoPagamento = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    flkCodigoClasse: TtecDBFindLookup;
    dtxDescricaoClasse: TtecDBText;
    sbnClasse: TSpeedButton;
    lblCodigoClasse: TLabel;
    procedure sbnClasseClick(Sender: TObject);
    procedure flkCodigoClasseMessage(var Msg: String);
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
  frmCadastroClassePlanoPagamento: TfrmCadastroClassePlanoPagamento;

implementation

uses
  //Biblio
  ctconstantes,
  //Repositorio
  fmconsultaporcampo,
  //Projeto
  dmcadastroplanospagamentos, fmnavcontroles;

{$R *.dfm}


{ TfrmCadastroClassePlanoPagamento }

constructor TfrmCadastroClassePlanoPagamento.Create(AOwner: TComponent);
begin
  inherited;
  DataSet := dtmCadastroPlanosPagamentos.TabelaClassePlanos
end;

destructor TfrmCadastroClassePlanoPagamento.Destroy;
begin
  inherited;
  frmCadastroClassePlanoPagamento := nil
end;

function TfrmCadastroClassePlanoPagamento.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmCadastroPlanosPagamentos.ExisteClassePlano(NomeCampo, Value)
end;

procedure TfrmCadastroClassePlanoPagamento.flkCodigoClasseMessage(var Msg: String);
begin
  inherited;
  Msg := Format(ctGRUPOCADASTRADOOUINEXISTENTE, [ctGRUPO, flkCodigoClasse.Text])
end;

function TfrmCadastroClassePlanoPagamento.InternoExcluir: Boolean;
begin
  Result := dtmCadastroPlanosPagamentos.ExcluirClassePlano
end;

function TfrmCadastroClassePlanoPagamento.InternoGravar: Boolean;
begin
  Result:= False;
  if flkCodigoClasse.Exist then
    dtmCadastroPlanosPagamentos.GravarClassePlano
end;

function TfrmCadastroClassePlanoPagamento.InternoIncluir: Boolean;
begin
  Result := dtmCadastroPlanosPagamentos.IncluirClassePlano
end;

function TfrmCadastroClassePlanoPagamento.InternoPesquisar(Titulo: String): Integer;
begin
  dtmCadastroPlanosPagamentos.Abre(ctCrediarioConsultaClasses);
  Result:= inherited InternoPesquisar(Titulo);
  if Result = mrOK then
    dtmCadastroPlanosPagamentos.SelecionarClassePlano;
  dtmCadastroPlanosPagamentos.Fecha(ctCrediarioConsultaClasses);
end;

function TfrmCadastroClassePlanoPagamento.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa:= True;
end;

procedure TfrmCadastroClassePlanoPagamento.sbnClasseClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkCodigoClasse, ctGRUPOS)
end;

function TfrmCadastroClassePlanoPagamento.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmCadastroPlanosPagamentos.TabelaConsultaClassePlanos
end;

end.
