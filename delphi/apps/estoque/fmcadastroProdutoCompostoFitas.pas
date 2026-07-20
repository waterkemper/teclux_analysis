unit fmcadastroProdutoCompostoFitas;

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

  TfrmCadastroProdutoCompostoFitas = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    dtxCodigoProduto: TtecDBText;
    dtxProduto: TtecDBText;
    gbxComposto: TGroupBox;
    gbxEspessura_fita: TGroupBox;
    edtEspessura_fita: TDBEditTexto;
    gbxLargura_fita: TGroupBox;
    edtLargura_fita: TDBEditTexto;
    gbxLiga_fita: TGroupBox;
    edtLiga_fita: TDBEditTexto;
    gbxVolta_fita: TGroupBox;
    edtVolta_fita: TDBEditNumero;
    gbxqtidadeporgrama_fita: TGroupBox;
    edtqtidadeporgrama_fita: TDBEditNumero;
    Label1: TLabel;
    Label2: TLabel;
    gbxComponente: TGroupBox;
    flkCodigoProduto: TtecDBText;
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
  frmCadastroProdutoCompostoFitas: TfrmCadastroProdutoCompostoFitas;

implementation

uses dmbasico;

{$R *.dfm}

destructor TfrmCadastroProdutoCompostoFitas.Destroy;
begin
  inherited;
  frmCadastroProdutoCompostoFitas := nil;
end;

function TfrmCadastroProdutoCompostoFitas.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
      dtmCadastroProdutos.ExcluirProdutoCompostoFitas;
  end;
end;

function TfrmCadastroProdutoCompostoFitas.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    if not CtrlOn then
      Result := dtmCadastroProdutos.GravarProdutoCompostoFitas;
  SetFocus;
end;

{
procedure TfrmCadastroProdutoCompostoFitas.SetDataModulo(Dtm: TdtmCadastroProdutos);
begin
  dtmCadastroProdutos := Dtm;
end;
}

function TfrmCadastroProdutoCompostoFitas.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
      Result := dtmCadastroProdutos.IncluirProdutoCompostoFitas(False);
  end;
end;

function TfrmCadastroProdutoCompostoFitas.InternoPesquisar(
  Titulo: String): Integer;
begin
  dtmCadastroProdutos.AbreTabelaConsultaProdutoFita;
  Result := inherited InternoPesquisar(Titulo);
  if Result = mrOK then
  begin
    dtmCadastroProdutos.Selecionar(tpPRODUTOSFITAS);
//    flkCodigoProduto.DoExit;
  end;
  dtmCadastroProdutos.FechaTabelaConsultaProdutoFita;
end;

function TfrmCadastroProdutoCompostoFitas.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := true;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

function TfrmCadastroProdutoCompostoFitas.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmCadastroProdutos.qryConsultaProdutosCompostosFitas;
end;

function TfrmCadastroProdutoCompostoFitas.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmCadastroProdutos.ExisteProdutoCompostoComponentefita(NomeCampo, Value);
end;

constructor TfrmCadastroProdutoCompostoFitas.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TfrmCadastroProdutoCompostoFitas.sbnConsultaProdutoClick(
  Sender: TObject);
begin
  inherited;
  TipoConsulta := cpcPRODUTOS;
//  InternoPesquisar(flkCodigoProduto, ctPRODUTO);

end;

end.
