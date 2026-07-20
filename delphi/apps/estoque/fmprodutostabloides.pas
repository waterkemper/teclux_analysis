unit fmprodutostabloides;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadrao, fmconsultabasica, ComCtrls, Buttons,
  ExtCtrls, DBCtrls, cpdbtext, Mask, cpdbfindcontrols, cpnumero,
  cpdbmemo, Grids, DBGrids, cpdbgrid, dmcadastromercadoriasanuncio,
  fmnavcontroles, ctconstantes, cptexto, fmconsultaporcampo, ZQuery,
  biblio, clparametrossistema, ToolWin;

type
  TfrmProdutosTabloides = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    lblItemProduto: TLabel;
    flkCodigoProduto: TtecDBFindLookup;
    sbnConsultaProduto: TSpeedButton;
    dtxDescricaoProduto: TtecDBText;
    lblPrecoPauta: TLabel;
    lblPrecoSugestao: TLabel;
    dtxPrecoPauta: TtecDBText;
    dtxPrecoSugestao: TtecDBText;
    lblPreco: TLabel;
    lblPlano: TLabel;
    lblTotal: TLabel;
    dtxTotal: TtecDBText;
    dtxDescricaoPlano: TtecDBText;
    sbnConsultaPlano: TSpeedButton;
    gbxObservacoes: TGroupBox;
    lblPrestacao: TLabel;
    dtxPrestacao: TtecDBText;
    edtPrecoVenda: TDBEditNumero;
    gbxTaxas: TGroupBox;
    gbxEstoques: TGroupBox;
    dbgTaxas: TtecDBGrid;
    lblPosicao: TLabel;
    lblFoto: TLabel;
    edtPosicao: TDBEditTexto;
    edtFoto: TDBEditTexto;
    flkCodigoPlano: TtecDBFindLookup;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dtxDeposito: TtecDBText;
    dtxLoja: TtecDBText;
    dtxPedido: TtecDBText;
    mmoObservacao: TtecDBMemo;
    lblDescricaoProduto: TLabel;
    edtDescricaoProduto: TDBEditTexto;
    procedure sbnConsultaProdutoClick(Sender: TObject);
    procedure sbnConsultaPlanoClick(Sender: TObject);
  protected
    function InternoIncluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoExcluir: Boolean; override;
    function InternoPesquisar(Titulo:String): Integer; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function TabelaDePesquisa: TZDataSet; override;
    function PesquisaHabilitada: Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmProdutosTabloides: TfrmProdutosTabloides;
  TipoPesquisa: TtecProcuraTabloides;
  Jan: TfrmConsultaPorCampo;

implementation

{$R *.dfm}
constructor TfrmProdutosTabloides.Create(AOwner: TComponent);
begin
  inherited;
  DataSet := dtmCadastroMercadoriasAnuncio.TabelaProdutosTabloide;

  if ParSistema.PermitirProdutoAlfanumerico then begin
     flkCodigoProduto.Lookupfield:= 'codigovisual';
     flkCodigoProduto.LookupQueryParameter:= 'codigovisual';
     flkCodigoProduto.DataField     := 'produtovisual';
     flkCodigoProduto.Width         := 200;
     sbnConsultaProduto.Left        := 308;
  end
  else begin
     flkCodigoProduto.Lookupfield:= 'codigo';
     flkCodigoProduto.LookupQueryParameter:= 'codigo';
     flkCodigoProduto.DataField     := 'produto';
     flkCodigoProduto.Width         := 107;
     sbnConsultaProduto.Left        := 244;
  end;

end;

destructor TfrmProdutosTabloides.Destroy;
begin
  inherited;
  frmProdutosTabloides := nil;
end;

function TfrmProdutosTabloides.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    Result := dtmCadastroMercadoriasAnuncio.IncluirProdutoTabloide;
    flkCodigoProduto.SetFocus
  end
end;

function TfrmProdutosTabloides.InternoGravar: Boolean;
begin
  Result := inherited InternoGravar;
  if Result then
    Result := dtmCadastroMercadoriasAnuncio.GravarProdutoTabloide;
end;

function TfrmProdutosTabloides.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
    Result := dtmCadastroMercadoriasAnuncio.ExcluirProdutoTabloide;
end;

function TfrmProdutosTabloides.InternoPesquisar(Titulo:String): Integer;
begin
  Result:= mrNone;
  if PesquisaHabilitada then
  begin
    with dtmCadastroMercadoriasAnuncio do begin
      if TipoPesquisa <> ttcNENHUM then
      begin
        AbreTabelaPesquisa(TipoPesquisa);
        Result := inherited InternoPesquisar(Titulo);
        if Result = mrOK then
          Selecionar(TipoPesquisa);
      FechaTabelaPesquisa(TipoPesquisa)
      end;
    end;
  end;
end;

function TfrmProdutosTabloides.PesquisaHabilitada: Boolean;
begin
  Result:= False;
  if CtrlOn then begin
    if ActiveControl is TtecDBFindLookup then begin
      if flkCodigoProduto.Focused then
        TipoPesquisa := ttcPRODUTO
      else if flkCodigoPlano.Focused then
        TipoPesquisa := ttcPLANO
      else
        TipoPesquisa := ttcNENHUM;
      Result := True;
    end;
  end;
end;

function TfrmProdutosTabloides.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmCadastroMercadoriasAnuncio do
    case TipoPesquisa of
      ttcPRODUTO: Result := ExisteProduto(NomeCampo, Value);
      ttcPLANO  : Result := ExistePlano(NomeCampo, Value);
    else          Result := False;
    end;
end;

function TfrmProdutosTabloides.TabelaDePesquisa: TZDataSet;
begin
  with dtmCadastroMercadoriasAnuncio do
    case TipoPesquisa of
      ttcPRODUTO        : Result := ConsultarProduto;
      ttcPLANO          : Result := ConsultarPlano;
    else                  Result := nil;
    end;
end;

function TfrmProdutosTabloides.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(result).ConsultaInterativa := (TipoPesquisa <> ttcPRODUTO) or
                                                     ((TipoPesquisa = ttcPRODUTO) and
                                                     (Parsistema.UsarConsultaInterativa));
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

procedure TfrmProdutosTabloides.sbnConsultaProdutoClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkCodigoProduto, ctPRODUTO);
end;

procedure TfrmProdutosTabloides.sbnConsultaPlanoClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkCodigoPlano, ctPLANOSPAGAMENTOS);
end;

end.
