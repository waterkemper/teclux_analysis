unit fmcadastroProdutoCompostoFios;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  DBCtrls, Mask, ComCtrls, ExtCtrls, Buttons, Windows, DB,
  // Biblio
  biblio, ctconstantes,
  // Componentes
  cpdata, cpnumero, cptexto, cpdbfindcontrols, cpdbdata, cpdbtext,
  // Terceiros
  ZQuery,
  // Repositorio
  fmconsultabasica, fmconsultaporcampo, fmcadastropadrao,
  // Projeto
  dmcadastroprodutos, clparametrossistema, cpdbcombobox, cpdblookupcombobox,
  ToolWin, cpdbedittext;

type

  TfrmCadastroProdutoCompostoFios = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    dtxCodigoProduto: TtecDBText;
    dtxProduto: TtecDBText;
    gbxComposto: TGroupBox;
    gbxBitola_fio: TGroupBox;
    edtBitola_fio: TDBEditTexto;
    gbxLiga_fio: TGroupBox;
    edtLiga_fio: TDBEditTexto;
    gbxVolta_fio: TGroupBox;
    edtVolta_fio: TDBEditNumero;
    gbxqtidadeporgrama_fio: TGroupBox;
    edtqtidadeporgrama_fio: TDBEditNumero;
    gbxResistividade_fio: TGroupBox;
    edtResistividade_fio: TDBEditNumero;
    gbxTolerancia_fio: TGroupBox;
    edtTolerancia_fio: TDBEditNumero;
    D: TLabel;
    gbxComponente: TGroupBox;
    dtxCodigoComponente: TtecDBText;
    procedure sbnConsultaProdutoClick(Sender: TObject);
  private
{    dtmCadastroProdutos: TdtmCadastroProdutos;}
  protected
    TipoConsulta: TtecConsultaProdutosContratos;
    function  InternoIncluir: Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;

    function  InternoPesquisar(Titulo: String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;

  public
{    procedure  SetDataModulo(Dtm: TdtmCadastroProdutos);}
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmCadastroProdutoCompostoFios: TfrmCadastroProdutoCompostoFios;

implementation

uses dmbasico;

{$R *.dfm}

destructor TfrmCadastroProdutoCompostoFios.Destroy;
begin
  inherited;
  frmCadastroProdutoCompostoFios := nil;
end;

function TfrmCadastroProdutoCompostoFios.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
      dtmCadastroProdutos.ExcluirProdutoCompostoFios;
  end;
end;

function TfrmCadastroProdutoCompostoFios.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    if not CtrlOn then
      Result := dtmCadastroProdutos.GravarProdutoCompostoFios;
  SetFocus;
end;

{
procedure TfrmCadastroProdutoCompostoFios.SetDataModulo(Dtm: TdtmCadastroProdutos);
begin
  dtmCadastroProdutos := Dtm;
end;
}

function TfrmCadastroProdutoCompostoFios.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
      Result := dtmCadastroProdutos.IncluirProdutoCompostoFios(False);
  end;
end;

function TfrmCadastroProdutoCompostoFios.InternoPesquisar(
  Titulo: String): Integer;
begin
(*
  dtmCadastroProdutos.AbreTabelaConsultaProdutoFio;
  Result := inherited InternoPesquisar(Titulo);
  if Result = mrOK then
  begin
    dtmCadastroProdutos.Selecionar(tpPRODUTOSFIOS);
//    flkCodigoProduto.DoExit;
  end;
  dtmCadastroProdutos.FechaTabelaConsultaProdutoFio;
*)
end;

function TfrmCadastroProdutoCompostoFios.JanelaPesquisa: TfrmConsultaBasica;
begin
{
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := true;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
  }
end;

function TfrmCadastroProdutoCompostoFios.TabelaDePesquisa: TZDataSet;
begin
{  Result := dtmCadastroProdutos.qryConsultaProdutosCompostosFios;}
end;

function TfrmCadastroProdutoCompostoFios.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
{  Result := dtmCadastroProdutos.ExisteProdutoCompostoComponenteFio(NomeCampo, Value);}
end;

constructor TfrmCadastroProdutoCompostoFios.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TfrmCadastroProdutoCompostoFios.sbnConsultaProdutoClick(
  Sender: TObject);
begin
  inherited;
  TipoConsulta := cpcPRODUTOS;
//  InternoPesquisar(flkCodigoProduto, ctPRODUTO);

end;

end.
