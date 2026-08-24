unit fmcadastroProdutoRequisicaoComposto;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  DBCtrls, Mask, ComCtrls, ExtCtrls, Buttons, Windows, DB,
  // Biblio
  biblio, ctconstantes,
  // Componentes
  cpdata, cpnumero, cptexto, cpdbfindcontrols, cpdbdata, cpdbtext,
  // Terceiros
  cpQuery,
  // Repositorio
  fmconsultabasica, fmconsultaporcampo, fmcadastropadrao,
  // Projeto
  dmcadastroprodutos, clparametrossistema, cpdbcombobox, cpdblookupcombobox,
  ToolWin;

type

  TfrmCadastroProdutoComposto = class(TfrmCadastroPadrao)
    gbxConsulta: TGroupBox;
    pnlFundoJanela: TPanel;
    dtxCodigoProduto: TtecDBText;
    dtxProduto: TtecDBText;
    flkCodigoProduto: TtecDBFindLookup;
    sbnConsultaProduto: TSpeedButton;
    dtxDescricaoProduto: TtecDBText;
    edtQuantidade: TDBEditNumero;
    edtPreco: TDBEditNumero;
    lblTotalComponentesValor: TLabel;
    gbxComposto: TGroupBox;
    gbxComponente: TGroupBox;
    gbxQuantidade: TGroupBox;
    gbxPreco: TGroupBox;
    gbxTotalComponentes: TGroupBox;
    gbxUnidade: TGroupBox;
    dtxUnidade: TtecDBText;
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
    function  TabelaDePesquisa: TTecQuery; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;

  public
{    procedure  SetDataModulo(Dtm: TdtmCadastroProdutos);}
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmCadastroProdutoComposto: TfrmCadastroProdutoComposto;

implementation

uses dmbasico;

{$R *.dfm}

destructor TfrmCadastroProdutoComposto.Destroy;
begin
  inherited;
  frmCadastroProdutoComposto := nil;
end;

function TfrmCadastroProdutoComposto.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
      dtmCadastroProdutos.ExcluirProdutoComposto;
  end;
end;

function TfrmCadastroProdutoComposto.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    if not CtrlOn then
      Result := dtmCadastroProdutos.GravarProdutoComposto;
  SetFocus;
  lblTotalComponentesValor.Caption := FormatarValor(dtmCadastroProdutos.TotalComponentes,2);
end;

{
procedure TfrmCadastroProdutoComposto.SetDataModulo(Dtm: TdtmCadastroProdutos);
begin
  dtmCadastroProdutos := Dtm;
end;
}

function TfrmCadastroProdutoComposto.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
      Result := dtmCadastroProdutos.IncluirProdutoComposto(False);
  end;
end;

procedure TfrmCadastroProdutoComposto.sbnConsultaProdutoClick(
  Sender: TObject);
begin
  inherited;
  TipoConsulta := cpcPRODUTOS;
  InternoPesquisar(flkCodigoProduto, ctPRODUTO);
end;

function TfrmCadastroProdutoComposto.InternoPesquisar(
  Titulo: String): Integer;
begin
  dtmCadastroProdutos.AbreTabelaConsultaProduto;
  Result := inherited InternoPesquisar(Titulo);
  if Result = mrOK then
  begin
    dtmCadastroProdutos.Selecionar(tpPRODUTOS);
    flkCodigoProduto.DoExit;
  end;
  dtmCadastroProdutos.FechaTabelaConsultaProduto;

end;

function TfrmCadastroProdutoComposto.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := False;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

function TfrmCadastroProdutoComposto.TabelaDePesquisa: TTecQuery;
begin
  Result := dtmCadastroProdutos.TabelaConsultaProduto;
end;

function TfrmCadastroProdutoComposto.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmCadastroProdutos.ExisteProdutoComponente(NomeCampo, Value);
end;

constructor TfrmCadastroProdutoComposto.Create(AOwner: TComponent);
begin
  inherited;
  if ParSistema.PermitirProdutoAlfanumerico then
  begin
    flkcodigoproduto.LocateParameters := 'componentevisual';
    flkCodigoProduto.LookupQueryParameter := 'codigovisual';
    flkCodigoProduto.LookupField := 'codigovisual';
    flkCodigoProduto.DataField := 'componentevisual';
    flkCodigoProduto.MaxLength := 30;
  end
  else
  begin
    flkcodigoproduto.LocateParameters := 'componente';
    flkCodigoProduto.LookupQueryParameter := 'codigo';
    flkCodigoProduto.LookupField := 'codigo';
    flkCodigoProduto.DataField := 'componente';
    flkCodigoProduto.MaxLength := 18;
  end;

  gbxPreco.Visible := not ParSistema.ControlesVoltadosparaIndustria;
  gbxTotalComponentes.Visible := not ParSistema.ControlesVoltadosparaIndustria;

end;

end.
