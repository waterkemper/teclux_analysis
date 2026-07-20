unit fmcadastrotipospagamentos;

interface

uses dmcadastrotipospagamentos,
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls, DBCtrls,
  //Terceiros
  ZQuery, ZPgSqlQuery, biblio,
  // PRojeto
  fmcadastropadrao, cpdbfindcontrols, Mask, cptexto,fmconsultabasica,
  fmconsultaporcampo,
  //biblio
  ctconstantes, ToolWin, frconsultacontabil, frconsultacodigocontabil;

type
  TfrmCadastroTiposPagamentos = class(TfrmCadastroPadrao)
    edtCodigo: TtecDbEditFind;
    edtDescricao: TDBEditTexto;
    ckbPagamento: TDBCheckBox;
    gbxCodigo: TGroupBox;
    gbxDescricao: TGroupBox;
    gbxEventos: TGroupBox;
    fraConsultaEventos: TfraConsultaCodigoContabil;
  private
    { Private declarations }
  protected
    dtmCadastroTiposPagamentos: TdtmCadastroTiposPagamentos;
    function InternoIncluir: Boolean; override;
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoPesquisar(Titulo:String): Integer; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function TabelaDePesquisa: TZDataSet; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override; 
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;
var
  frmCadastroTiposPagamentos: TfrmCadastroTiposPagamentos;

implementation

{$R *.dfm}

{ TfrmCadastroTiposPagamentos }

constructor TfrmCadastroTiposPagamentos.Create(AOwner: TComponent);
begin
  dtmCadastroTiposPagamentos := TdtmCadastroTiposPagamentos.Create(Self);
  inherited;
  dataset := dtmCadastroTiposPagamentos.tabelaTiposPagamentos;
  fraConsultaEventos.TipoPesquisa  := pesEVENTO;
end;

destructor TfrmCadastroTiposPagamentos.Destroy;
begin
  dtmCadastroTiposPagamentos:=nil;
  inherited;
  frmCadastroTiposPagamentos := nil;
end;

function TfrmCadastroTiposPagamentos.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  result := dtmCadastroTiposPagamentos.ExisteTabelaTipoPagamento(NomeCampo, Value)
end;

function TfrmCadastroTiposPagamentos.InternoExcluir: Boolean;
begin
  result := false;
  if not ctrlon then
  begin
    result:= inherited InternoExcluir;
    if result then
      dtmcadastroTiposPagamentos.ExcluirTiposPagamentos;
  end;
end;

function TfrmCadastroTiposPagamentos.InternoGravar: Boolean;
begin
  Result:=inherited InternoGravar;
  if result then
    dtmCadastroTiposPagamentos.GravarTiposPagamentos;
end;

function TfrmCadastroTiposPagamentos.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then
    if not CtrlOn then
      dtmCadastroTiposPagamentos.IncluirTiposPagamentos;
end;

function TfrmCadastroTiposPagamentos.InternoPesquisar(
  Titulo: String): Integer;
begin
  result:=0;
  if not CtrlOn then
  begin
    dtmCadastroTiposPagamentos.Abre(ctConsultaTipoPagamento);
    result:=inherited internopesquisar('Tabela de Tipo de Pagamentos');
    if Result = mrOK then
       dtmCadastroTiposPagamentos.PosicionarTabelaTiposPagamentos;

    dtmCadastroTiposPagamentos.Fecha(ctConsultaTipoPagamento);
  end;

end;

function TfrmCadastroTiposPagamentos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(result).ConsultaInterativa := True;
end;

function TfrmCadastroTiposPagamentos.TabelaDePesquisa: TZDataSet;
begin
 result:=dtmCadastroTiposPagamentos.ConsultaTabelaTiposPagamentos;
end;

end.
