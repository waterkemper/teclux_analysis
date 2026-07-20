unit fmcadastrotabelafretes;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls,  DBCtrls, biblio,

  //Terceiros
  ZQuery, ZPgSqlQuery,
  // PRojeto
  fmcadastropadrao, fmconsultabasica, fmconsultaporcampo, cpdbfindcontrols,
  cpdbmemo, cpnumero, Mask, cptexto,
  //biblio
  ctconstantes, ToolWin;

type
  TfrmCadastroTabelaFretes = class(TfrmCadastroPadrao)
    pnlfundojanela: TPanel;
    gbxTabeladeFretes: TGroupBox;
    edtDescricao: TDBEditTexto;
    edtValorCliente: TDBEditNumero;
    edtValorFornecedor: TDBEditNumero;
    edfCodigo: TtecDbEditFind;
    mmoObservacoes: TtecDBMemo;
    gbxCodigo: TGroupBox;
    gbxDescricao: TGroupBox;
    gbxValorCliente: TGroupBox;
    gbxValorFornecedor: TGroupBox;
    gbxObservacoes: TGroupBox;
    gbxValores: TGroupBox;
  protected
    function InternoIncluir: Boolean; override;
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoPesquisar(Titulo:String): Integer; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function TabelaDePesquisa: TZDataSet; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override; // faz a busca

  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

  end;

var
  frmCadastroTabelaFretes: TfrmCadastroTabelaFretes;

implementation

uses dmcadastrotabelafretes;

{$R *.dfm}

{ TfrmCadastroTabelaFretes }

constructor TfrmCadastroTabelaFretes.Create(AOwner: TComponent);
begin
  inherited;
  dtmCadastroTabelaFretes:= TdtmCadastroTabelaFretes.Create(Self);
  DataSet:= dtmCadastroTabelaFretes.TabelaFrete;
end;

destructor TfrmCadastroTabelaFretes.Destroy;
begin
  dtmCadastroTabelaFretes:=nil;
  inherited;
  frmCadastroTabelaFretes:= nil;
end;

function TfrmCadastroTabelaFretes.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  result:=dtmcadastroTabelaFretes.ExisteTabeladeFrete(NomeCampo, Value);
end;

function TfrmCadastroTabelaFretes.InternoExcluir: Boolean;
begin
  result := false;
  if not ctrlon then
  begin
    result:= inherited InternoExcluir;
    if result then
      dtmcadastroTabelaFretes.ExcluirTabeladeFretes;
  end;
end;

function TfrmCadastroTabelaFretes.InternoGravar: Boolean;
begin
  Result := inherited InternoGravar;
  if Result then
    dtmCadastroTabelaFretes.GravarTabeladeFretes;
end;

function TfrmCadastroTabelaFretes.InternoIncluir: Boolean;
begin
  result := false;
  if not ctrlon then
  begin
    result:= inherited InternoIncluir;
    if result then
      dtmcadastroTabelaFretes.IncluirTabeladeFretes;
  end;
end;

function TfrmCadastroTabelaFretes.InternoPesquisar(
  Titulo: String): Integer;
begin
  result:=0;
  if not CtrlOn then
  begin
    dtmCadastroTabelaFretes.Abre(ctconsultatabelafrete); //constante; abre a consulta
    result:=inherited internopesquisar('Tabela de Frete');

    if Result = mrOK then
       dtmCadastroTabelaFretes.PosicionarTabelaFrete;

    dtmCadastroTabelaFretes.Fecha(ctconsultaTabelafrete);
  end;

end;

function TfrmCadastroTabelaFretes.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(result).ConsultaInterativa := True;
end;

function TfrmCadastroTabelaFretes.TabelaDePesquisa: TZDataSet;
begin
 result:=dtmCadastroTabelaFretes.ConsultaTabelaFrete;
end;

end.
