unit fmcadastroprodutosemitiretiquetas;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, DB, Windows,
  //Terceiros
  ZQuery,
  //Repositorio
  fmcadastropadrao, fmconsultabasica, fmconsultaporcampo,
  //Biblio
  ctconstantes, biblio,
  // Projeto
  dmemissaoetiquetas,
  //Componentes
  cpnumero, cptexto, cpdbfindcontrols, cpdbtext, ComCtrls, ToolWin,
  clparametrossistema, frconsulta, frconsultacodigo;

type
  TfrmCadastroProdutosEmitirEtiquetas = class(TfrmCadastroPadrao)
    gbxSimilares: TGroupBox;
    lblProduto: TLabel;
    pnlFundoJanela: TPanel;
    lblQuantidade: TLabel;
    edtQuantidade: TDBEditNumero;
    sbnProcuraFilial: TSpeedButton;
    dtxFilial: TtecDBText;
    lblFilial: TLabel;
    flkFilial: TtecDBFindLookup;
    fraConsultaProduto: TfraConsultaCodigo;
    procedure flkProdutoMessage(var Msg: String);
    procedure sbnProcuraFilialClick(Sender: TObject);
    procedure flkProdutoFound(Found: Boolean);
  protected
    dtmEtiquetas: TdtmEmissaoEtiquetas;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    procedure AtribuirDadosEtiquetas(Found: Boolean);
  public
    TipoProcura: TTecPesquisa;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    function  GetTitulo: string;
    function  PermitirProcura: boolean;
    procedure SetDataModulo (dtm: TdtmEmissaoEtiquetas);
  end;

var
  frmCadastroProdutosEmitirEtiquetas: TfrmCadastroProdutosEmitirEtiquetas;

implementation

{$R *.dfm}

destructor TfrmCadastroProdutosEmitirEtiquetas.Destroy;
begin
  inherited;
  frmCadastroProdutosEmitirEtiquetas := nil;
end;

function TfrmCadastroProdutosEmitirEtiquetas.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  case TipoProcura of
     pesFILIAIS: Result := dtmEtiquetas.ExisteFilial(NomeCampo, Value);
     else        Result := False;
  end;
end;

function TfrmCadastroProdutosEmitirEtiquetas.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
    if not CtrlOn then
      Result:= dtmEtiquetas.ExcluirProdutoEtiqueta;
end;

function TfrmCadastroProdutosEmitirEtiquetas.InternoGravar: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then
    Result := dtmEtiquetas.GravarProdutoEtiqueta;
end;

function TfrmCadastroProdutosEmitirEtiquetas.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then
    Result:= dtmEtiquetas.IncluirProdutoEtiqueta(False);
end;

function TfrmCadastroProdutosEmitirEtiquetas.InternoPesquisar(Titulo: String): Integer;
begin
  Result := mrOK;
  with dtmEtiquetas do
    if PermitirProcura then begin
      AbreTabelaPesquisa(TipoProcura);
      Result := inherited InternoPesquisar(GetTitulo);
      if Result = mrOK then
        Selecionar(TipoProcura,True);
      FechaTabelaPesquisa(tipoProcura);
    end;
end;

function TfrmCadastroProdutosEmitirEtiquetas.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := False;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

procedure TfrmCadastroProdutosEmitirEtiquetas.SetDataModulo(Dtm: TdtmEmissaoEtiquetas);
begin
  dtmEtiquetas := Dtm;
end;

function TfrmCadastroProdutosEmitirEtiquetas.TabelaDePesquisa: TZDataSet;
begin
  case TipoProcura of
     pesFILIAIS: Result:= dtmEtiquetas.ConsultarFilial;
     else        Result:= Nil;
  end;
end;

function TfrmCadastroProdutosEmitirEtiquetas.GetTitulo: string;
begin
  case TipoProcura of
    pesPRODUTOS: Result := 'Produtos';
     pesFILIAIS: Result := 'Filiais';
    else         Result := '';
  end;
end;

function TfrmCadastroProdutosEmitirEtiquetas.PermitirProcura: boolean;
begin
  Result := False;
  if CtrlOn then
  begin
    if flkFilial.Focused then
    begin
      TipoProcura := pesFILIAIS;
      Result := True;
    end;
  end;
end;

procedure TfrmCadastroProdutosEmitirEtiquetas.flkProdutoMessage(var Msg: String);
begin
  inherited;
  Msg:= Format(ctREGISTROINCLUIDO, [fraConsultaProduto.edfCodigo.Text,'na relação de Etiquetas.']);
end;

procedure TfrmCadastroProdutosEmitirEtiquetas.sbnProcuraFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  flkFilial.SetFocus;
  InternoPesquisar('');
end;


constructor TfrmCadastroProdutosEmitirEtiquetas.Create(AOwner: TComponent);
begin
  inherited;
  fraConsultaProduto.TipoPesquisa := pesItemProdutos;
  fraConsultaProduto.OnFound := AtribuirDadosEtiquetas;
end;

procedure TfrmCadastroProdutosEmitirEtiquetas.flkProdutoFound(
  Found: Boolean);
begin
  inherited;
  {
  if Found then
  begin
    if ParSistema.PermitirProdutoAlfanumerico then
      dtmEtiquetas.qryEtiquetascodigo.AsLargeInt := dtmEtiquetas.qryProcuraProdutosCadastrocodigo.AsLargeInt
    else
      dtmEtiquetas.qryEtiquetascodigovisual.AsString := dtmEtiquetas.qryProcuraProdutosCadastrocodigovisual.AsString;
  end
  else
  begin
    dtmEtiquetas.qryEtiquetascodigo.clear;
    dtmEtiquetas.qryEtiquetascodigovisual.clear;
  end;
  }
end;

procedure TfrmCadastroProdutosEmitirEtiquetas.AtribuirDadosEtiquetas(Found: Boolean);
begin
  if fraConsultaProduto.edfCodigo.ValoraDataFieldInterno <> '' then
    dtmEtiquetas.AtribuirDadosEtiquetas(fraConsultaProduto.edfCodigo.ValoraDataFieldInterno);
end;

end.

