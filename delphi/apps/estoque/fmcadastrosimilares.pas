unit fmcadastrosimilares;

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
  ctconstantes, biblio, clparametrossistema,
  // Projeto
  dmcadastroprodutos,
  //Componentes
  cpnumero, cptexto, cpdbfindcontrols, cpdbtext, ComCtrls, ToolWin;

type
  TfrmCadastroSimilares = class(TfrmCadastroPadrao)
    dtxCaracteristica: TtecDBText;
    flkSimilar: TtecDBFindLookup;
    sbnProcurarSimilar: TSpeedButton;
    dtxSimilar: TtecDBText;
    pnlFundoJanela: TPanel;
    gbxCodProduto: TGroupBox;
    gbxSimilar: TGroupBox;
    procedure sbnProcurarSimilarClick(Sender: TObject);
    procedure flkSimilarMessage(var Msg: String);
  protected
    {dtmCadastroProdutos: TdtmCadastroProdutos;}
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
  public
    tipoProcura: tipoProcuraProdutosEstoque;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    function  GetTitulo: string;
    function  PermitirProcura: boolean;
//    procedure SetDataModulo (dtm: TdtmCadastroProdutos);
  end;

var
  frmCadastroSimilares: TfrmCadastroSimilares;

implementation

{$R *.dfm}

destructor TfrmCadastroSimilares.Destroy;
begin
  inherited;
  frmCadastroSimilares := nil;
end;

function TfrmCadastroSimilares.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmCadastroProdutos.ExisteCaracteristicasSimilar(NomeCampo, Value);
end;

function TfrmCadastroSimilares.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
    if not CtrlOn then
      Result:= dtmCadastroProdutos.ExcluirSimilar;
end;

function TfrmCadastroSimilares.InternoGravar: Boolean;
begin
  Result:= False;
  if flkSimilar.Text = IntToStr(dtmCadastroProdutos.CodigoCaracteristica) then
    MensagemAviso(ctAVISOSIMILARIGUAL)
  else begin
    if ActiveControl = flkSimilar then
      Result:= flkSimilar.Exist;
    if Result then begin
      Result := dtmCadastroProdutos.GravarSimilar;
      flkSimilar.SetFocus;
    end;
  end;
end;

function TfrmCadastroSimilares.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then
    if not CtrlOn then
      Result:= dtmCadastroProdutos.IncluirSimilar(False);
end;

function TfrmCadastroSimilares.InternoPesquisar(Titulo: String): Integer;
begin
  Result := mrOK;
  with dtmCadastroProdutos do
    if PermitirProcura then
    begin
      AbreTabelasConsulta(TipoProcura);
      Result := inherited InternoPesquisar(GetTitulo);
      if Result = mrOK then
        Selecionar(tipoProcura);
      FechaTabelasConsulta(tipoProcura);
    end;
end;

function TfrmCadastroSimilares.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := False;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

{
procedure TfrmCadastroSimilares.SetDataModulo(Dtm: TdtmCadastroProdutos);
begin
  dtmCadastroProdutos := Dtm;
end;
}

function TfrmCadastroSimilares.TabelaDePesquisa: TZDataSet;
begin
  Result:= dtmCadastroProdutos.ConsultarSimilar;
end;

procedure TfrmCadastroSimilares.sbnProcurarSimilarClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  flkSimilar.SetFocus;
  InternoPesquisar('');
end;

function TfrmCadastroSimilares.GetTitulo: string;
begin
  case TipoProcura of
    tpSIMILARES: Result := 'Produtos';
    else         Result := '';
  end;
end;

function TfrmCadastroSimilares.PermitirProcura: boolean;
begin
  Result := False;
  if CtrlOn then
    if ActiveControl.ClassType = TtecDBFindLookup then begin
      if flkSimilar.Focused then
        TipoProcura := tpSIMILARES;
      Result := True;
    end;
end;

procedure TfrmCadastroSimilares.flkSimilarMessage(var Msg: String);
begin
  inherited;
  Msg:= Format(ctREGISTROINCLUIDO, [flkSimilar.Text,'na característica']);
end;


constructor TfrmCadastroSimilares.Create(AOwner: TComponent);
begin
  inherited;

  {
  if ParSistema.PermitirProdutoAlfanumerico then
  begin
    flkSimilar.DataField := 'similarvisual';
    flkSimilar.LookupQueryParameter :='codigovisual';
    flkSimilar.LookupField :='codigovisual';
  end
  else
  begin
    flkSimilar.DataField := 'similar';
    flkSimilar.LookupQueryParameter :='codigo';
    flkSimilar.LookupField :='codigo';
  end;
  }
end;

end.

