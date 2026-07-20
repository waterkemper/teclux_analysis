unit fmcadastrofornecedoresprodutos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  Mask, ExtCtrls, Buttons, StdCtrls, DBCtrls, DB,
  //Terceiros
  ZQuery,
  // Componentes
  cpdbtext, cptexto, cpdbfindcontrols,
  //Repositorio
  fmcadastropadrao,
  // Projeto
  fmconsultabasica, fmconsultaporcampo, dmcadastroprodutos,
  // Constantes
  biblio, ctConstantes, ComCtrls, cpdbdata, cpnumero, cpdbmemo, ToolWin;

type
  TfrmCadastroFornecedoresProdutos = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    sbnProcurarFornecedor: TSpeedButton;
    dtxCaracteristica: TtecDBText;
    flkFornecedor: TtecDBFindLookup;
    dtxFornecedor: TtecDBText;
    edtReferencia: TDBEditTexto;
    edtData: TDBEditData;
    edtPreco: TDBEditNumero;
    edtIPI: TDBEditNumero;
    mmoOBS: TtecDBMemo;
    dtxPrecoComIPI: TtecDBText;
    gbxCodProduto: TGroupBox;
    gbxObservacoes: TGroupBox;
    gbxPrecoComIPITabela: TGroupBox;
    gbxDataTabela: TGroupBox;
    gbxPrecoTabela: TGroupBox;
    gbxIPITabela: TGroupBox;
    gbxTabela: TGroupBox;
    gbxReferencia: TGroupBox;
    gbxFornProduto: TGroupBox;
    gbxUltimaEntrada: TGroupBox;
    gbxData: TGroupBox;
    dtxDataUltimaEntrada: TtecDBText;
    gbxPrecoComIPI: TGroupBox;
    dtxPrecoComIPIUltimaEntrada: TtecDBText;
    gbxValorIPI: TGroupBox;
    dtxIPIUltimaEntrada: TtecDBText;
    gbxPrecoUltEntrada: TGroupBox;
    dtxPrecoUltimaEntrada: TtecDBText;
    procedure sbnProcurarFornecedorClick(Sender: TObject);
    procedure flkFornecedorMessage(var Msg: String);
  protected
    {dtmCadastroProdutos: TdtmCadastroProdutos;}
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function TabelaDePesquisa: TZDataSet; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function InternoPesquisar(Titulo:string): Integer; override;
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoIncluir: Boolean; override;
  public
    TipoProcura: TipoProcuraProdutosEstoque;
    destructor Destroy; override;
//    procedure SetDataModulo (dtm: TdtmCadastroProdutos);
  end;

var
  frmCadastroFornecedoresProdutos: TfrmCadastroFornecedoresProdutos;

implementation

{$R *.dfm}

destructor TfrmCadastroFornecedoresProdutos.Destroy;
begin
  inherited;
  frmCadastroFornecedoresProdutos := nil;
end;

function TfrmCadastroFornecedoresProdutos.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
    if not CtrlOn then
      dtmCadastroProdutos.ExcluirFornecedoresProduto;
end;

function TfrmCadastroFornecedoresProdutos.InternoGravar: Boolean;
begin
  Result:= Inherited InternoGravar;
  if (ActiveControl is TtecFindCustom) and TtecFindCustom(ActiveControl).Modified then
    Result:= TtecFindCustom(ActiveControl).Exist;
  if Result then begin
    Result := dtmCadastroProdutos.GravarFornecedoresProduto;
    flkFornecedor.SetFocus;
  end;
end;

function TfrmCadastroFornecedoresProdutos.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then
    if not CtrlOn then
      dtmCadastroProdutos.IncluirFornecedoresProdutos(False);
end;

{
procedure TfrmCadastroFornecedoresProdutos.SetDataModulo(Dtm: TdtmCadastroProdutos);
begin
  dtmCadastroProdutos := Dtm;
end;
}

function TfrmCadastroFornecedoresProdutos.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmCadastroProdutos.ExisteFornecedor(NomeCampo, Value);
end;

function TfrmCadastroFornecedoresProdutos.InternoPesquisar(Titulo: string): Integer;
begin
  Result := mrOK;
  if CtrlOn then begin
    TipoProcura := tpFORNECEDORES;
    dtmCadastroProdutos.AbreTabelasConsulta(TipoProcura);
    Result := inherited InternoPesquisar('Fornecedor');
    if Result = mrOK then
      dtmCadastroProdutos.Selecionar(TipoProcura);
    dtmCadastroProdutos.FechaTabelasConsulta(TipoProcura);
  end;
end;

function TfrmCadastroFornecedoresProdutos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(result).UsarParametrosDaTabela := False;
end;

function TfrmCadastroFornecedoresProdutos.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmCadastroProdutos.ConsultarFornecedores;
end;

procedure TfrmCadastroFornecedoresProdutos.sbnProcurarFornecedorClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  flkFornecedor.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmCadastroFornecedoresProdutos.flkFornecedorMessage(var Msg: String);
begin
  inherited;
  Msg:= Format(ctREGISTROINCLUIDO, [flkFornecedor.Text,'na característica']);
end;

end.
