unit fmVisualizarImageURL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, ToolWin, ComCtrls, fmnavcontroles, ctconstantes,
  frVisualizarImageURL, biblio, DB, ZQuery, ZPgSqlQuery, cpquery, StdCtrls,
  HTMListB, UHTMLabel, HTMLForm, cpdatasource, Htmlview, Grids, AdvObj,
  BaseGrid, AdvGrid, DBAdvGrid, HTMLUn2;

type
  TfrmVisualizarImageURL = class(TfrmNavControles)
    fraVisualizarImageURL1: TfraVisualizarImageURL;
    qryProdutos: TtecQuery;
    qryProdutoscodigo: TLargeintField;
    qryProdutoscodigovisual: TStringField;
    qryProdutosdescricao: TStringField;
    dsrProdutos: TtecDataSource;
    qryProdutosdescricaocomplementar: TStringField;
    qryProdutoscaracteristicas: TStringField;
    pnlDetalhes: TPanel;
    StaticText1: TStaticText;
    HTMLViewerDescricaoComplementar: THTMLViewer;
    StaticText2: TStaticText;
    HTMLViewerCaracteristicas: THTMLViewer;
    Splitter1: TSplitter;
    Panel1: TPanel;
    lblProduto: TLabel;
    StaticText3: TStaticText;
    qryProdutos_Atributos: TtecQuery;
    qryProdutos_Atributosnome: TStringField;
    qryProdutos_Atributosvalor: TStringField;
    qryProdutos_Atributosdescricao: TStringField;
    qryProdutos_Atributostipo: TStringField;
    qryProdutos_Atributostodos: TBooleanField;
    dsrProdutos_Atributos: TtecDataSource;
    DBAdvGridProdutos_Atributos: TDBAdvGrid;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    procedure qryProdutosAfterOpen(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;

  end;

var
  frmVisualizarImageURL: TfrmVisualizarImageURL;
  AcionarTelaVisualizarImageURL: procedure (Owner: TComponent; Produto: TTecStringRetorno);
  AcionarTelaVisualizarImageBase64: procedure (Owner: TComponent; MemoryStream: TMemoryStream);



implementation

{$R *.dfm}

{ TfrmVisualizarImageURL }

procedure AcionarTelaVisualizarImageURL_(Owner: TComponent; Produto: TTecStringRetorno);
begin
  if not assigned(frmVisualizarImageURL) or (frmVisualizarImageURL.Owner <> Owner) then
  begin
    if assigned(frmVisualizarImageURL) then
      frmVisualizarImageURL.free;

    frmVisualizarImageURL := TfrmVisualizarImageURL.create(Owner);
    frmVisualizarImageURL.fraVisualizarImageURL1.Produto := Produto;
    frmVisualizarImageURL.fraVisualizarImageURL1.AbrirqryFotosProdutos;

    frmVisualizarImageURL.qryProdutos.parambyname('produto').asString := produto;
    frmVisualizarImageURL.qryProdutos.close;
    frmVisualizarImageURL.qryProdutos.open;

    frmVisualizarImageURL.qryProdutos_Atributos.parambyname('produto').asString := produto;
    frmVisualizarImageURL.qryProdutos_Atributos.close;
    frmVisualizarImageURL.qryProdutos_Atributos.open;

    if frmVisualizarImageURL.fraVisualizarImageURL1.qryFotosProdutos.isempty then
    begin
      if not frmVisualizarImageURL.qryProdutoscaracteristicas.isnull or
         not frmVisualizarImageURL.qryProdutosdescricaocomplementar.isnull then
        frmVisualizarImageURL.showmodal
      else
        MensagemAviso('Imagem não encontrada.');
    end
    else
      frmVisualizarImageURL.showmodal;

  end;
  frmVisualizarImageURL.free;
//  frmVisualizarImageURL.BringToFront;
end;

procedure AcionarTelaVisualizarImageBase64_(Owner: TComponent; MemoryStream: TMemoryStream);
begin
  if not assigned(frmVisualizarImageURL) or (frmVisualizarImageURL.Owner <> Owner) then
  begin
    if assigned(frmVisualizarImageURL) then
      frmVisualizarImageURL.free;

    frmVisualizarImageURL := TfrmVisualizarImageURL.create(Owner);
    frmVisualizarImageURL.fraVisualizarImageURL1.ToolBar1.visible := false;
    frmVisualizarImageURL.fraVisualizarImageURL1.pnlInformacoesProduto.visible := false;
    frmVisualizarImageURL.fraVisualizarImageURL1.imgVisualFormURL.proportional := true;
    frmVisualizarImageURL.fraVisualizarImageURL1.imgVisualFormURL.stretch := true;

    frmVisualizarImageURL.Autosize := true;
    frmVisualizarImageURL.Constraints.MaxHeight := frmVisualizarImageURL.fraVisualizarImageURL1.ScrollBox1.height;
    frmVisualizarImageURL.height := frmVisualizarImageURL.fraVisualizarImageURL1.ScrollBox1.height;

    frmVisualizarImageURL.fraVisualizarImageURL1.AbrirImgBase64(MemoryStream);


    frmVisualizarImageURL.showmodal;
  end;
  frmVisualizarImageURL.free;
//  frmVisualizarImageURL.BringToFront;
end;



destructor TfrmVisualizarImageURL.Destroy;
begin
  frmVisualizarImageURL := nil;
  inherited;
end;

procedure TfrmVisualizarImageURL.qryProdutosAfterOpen(DataSet: TDataSet);
var
  SourceString: string;
  MemoryStream: TMemoryStream;

begin
  inherited;
  {
  HTMLViewerCaracteristicas.LoadStrings(vtstring);
  HTMLViewerDescricaoComplementar.LoadStrings(vtstring);
  }


  SourceString :=qryProdutoscaracteristicas.AsString;
  MemoryStream := TMemoryStream.Create;
  try
    MemoryStream.WriteBuffer(Pointer(SourceString)^, Length(SourceString));
    MemoryStream.Position := 0;
  finally
    HTMLViewerCaracteristicas.LoadFromStream(MemoryStream);
    MemoryStream.Free;
  end;

  SourceString :=qryProdutosdescricaocomplementar.AsString;
  MemoryStream := TMemoryStream.Create;
  try
    MemoryStream.WriteBuffer(Pointer(SourceString)^, Length(SourceString));
    MemoryStream.Position := 0;
  finally
    HTMLViewerDescricaoComplementar.LoadFromStream(MemoryStream);
    MemoryStream.Free;
  end;

  lblProduto.caption := qryProdutoscodigovisual.asString + ' - ' + qryProdutosdescricao.asString


end;

procedure TfrmVisualizarImageURL.Button1Click(Sender: TObject);
begin
  inherited;
  HTMLViewerCaracteristicas.LoadFromFile('c:\teste_html.html');
end;

initialization
   AcionarTelaVisualizarImageURL :=  AcionarTelaVisualizarImageURL_;
   AcionarTelaVisualizarImageBase64 :=  AcionarTelaVisualizarImageBase64_;


end.
