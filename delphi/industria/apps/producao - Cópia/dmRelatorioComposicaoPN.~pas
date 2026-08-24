unit dmRelatorioComposicaoPN;

interface

uses
  SysUtils, Classes, dmbasico, ZTransact, dmtecsoft, DB, cpdatasource,
  ZQuery, ZPgSqlQuery, cpquery, fr_dset, fr_dbset, fr_class, fmpreviewpadrao, biblio;

type
  TdtmRelatorioComposicaoPN = class(TdtmBasico)
    qryClientesProdutos: TtecQuery;
    dsrClientesProdutos: TtecDataSource;
    qryProdutosCompostos: TtecQuery;
    qryClientesProdutoscodigo: TLargeintField;
    qryClientesProdutospn: TStringField;
    qryClientesProdutoscliente: TIntegerField;
    qryClientesProdutostipocliente: TStringField;
    qryClientesProdutosfinalidade: TStringField;
    qryClientesProdutosfluxograma: TIntegerField;
    qryClientesProdutostamloteproducao: TIntegerField;
    qryClientesProdutosexcedentepermitido: TIntegerField;
    qryClientesProdutostipoexcedente: TStringField;
    qryClientesProdutosorigem: TStringField;
    qryClientesProdutosrevisao: TStringField;
    frpComposicaoPNs: TfrReport;
    fdsComposicaoPNs: TfrDBDataSet;
    qryClientesProdutosrazao: TStringField;
    qryClientesProdutosproduto_cliente: TStringField;
    dsrProdutosCompostos: TtecDataSource;
    qryProdutosCompostoscomposto: TLargeintField;
    qryProdutosCompostosordem: TIntegerField;
    qryProdutosCompostosquantidade: TFloatField;
    qryProdutosCompostosunidade: TStringField;
    qryProdutosCompostoscomponente: TStringField;
    fdsProdutosCompostos: TfrDBDataSet;
    qryProdutosCompostosFios: TtecQuery;
    dsrProdutosCompostosFios: TtecDataSource;
    qryProdutosCompostosFioscomposto: TLargeintField;
    qryProdutosCompostosFioscomponente: TStringField;
    qryProdutosCompostosFiosordem: TIntegerField;
    qryProdutosCompostosFiosquantidade: TFloatField;
    qryProdutosCompostosFiosbitola: TStringField;
    qryProdutosCompostosFiosliga: TStringField;
    qryProdutosCompostosFiosnrvoltas: TIntegerField;
    qryProdutosCompostosFiosgramasporpeca: TFloatField;
    qryProdutosCompostosFiosresistividade: TFloatField;
    qryProdutosCompostosFiostolerancia: TIntegerField;
    qryProdutosCompostosFiosdescricaocomponente: TStringField;
    qryProdutosCompostosFiossequencia: TIntegerField;
    fdsProdutosCompostosFios: TfrDBDataSet;
    qryProdutosCompostosFitas: TtecQuery;
    dsrProdutosCompostosFitas: TtecDataSource;
    fdsProdutosCompostosFitas: TfrDBDataSet;
    qryProdutosCompostosFitascomposto: TLargeintField;
    qryProdutosCompostosFitascomponente: TStringField;
    qryProdutosCompostosFitasordem: TIntegerField;
    qryProdutosCompostosFitasquantidade: TFloatField;
    qryProdutosCompostosFitasespessura: TStringField;
    qryProdutosCompostosFitaslargura: TStringField;
    qryProdutosCompostosFitasliga: TStringField;
    qryProdutosCompostosFitasnrvoltas: TIntegerField;
    qryProdutosCompostosFitasgramasporpeca: TFloatField;
    qryProdutosCompostosFitasdescricaocomponente: TStringField;
    qryProdutosCompostosFitassequencia: TIntegerField;
  private
    fListadePNsSelecionadasAleatoriamente: String;
    FParametroCabecalho: String;
    procedure SetListadePNsSelecionadasAleatoriamente(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;

    property ListadePNsSelecionadasAleatoriamente: String read fListadePNsSelecionadasAleatoriamente write SetListadePNsSelecionadasAleatoriamente;
    property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
    function AbrirConsultas: Boolean;
    procedure ImprimirRelatorio;




  end;

var
  dtmRelatorioComposicaoPN: TdtmRelatorioComposicaoPN;

implementation

{$R *.dfm}

{ TdtmRelatorioComposicaoPN }

function TdtmRelatorioComposicaoPN.AbrirConsultas: Boolean;
begin
   ReFazConsulta(qryClientesProdutos,[],[]);
   ReFazConsulta(qryProdutosCompostos,[],[]);
   ReFazConsulta(qryProdutosCompostosFios,[],[]);
   ReFazConsulta(qryProdutosCompostosFitas,[],[]);
   result := not qryClientesProdutos.IsEmpty;

end;

constructor TdtmRelatorioComposicaoPN.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TdtmRelatorioComposicaoPN.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  frVariables['RAZAOFILIALBASE']  := RazaoFilialBase;
  frVariables['ENDERECO_BAIRRO']   := RuaFilialBase+ ' - '+BairroFilialBase;
  frVariables['CEP_CIDADE_UF']:= FormatarCEP(CEPFilialBase)+'  '+CidadeFilialBase+ '  '+ EstadoFilialBase;

  frVariables['Titulo']:= 'RELATÓRIO DE COMPOSIÇÃO DE PNs';
  frVariables['Outras']:= FParametroCabecalho;

//  frpNotasEntrada.DesignReport;
//  frpNotasEntradaProdutos.DesignReport;
  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3; //125
  try
   Relatorio := frmPreview.frCompositeReport;
   with frmPreview do
   begin
    frCompositeReport.Reports.Clear;
    frCompositeReport.Reports.Add(frpComposicaoPNs);
   end;
   Relatorio.Preview := frmPreview.frPreviewPadrao;
   Relatorio.ShowReport;

   frmPreview.ShowModal;

  finally

   frmPreview.Free

  end;

end;

procedure TdtmRelatorioComposicaoPN.SetListadePNsSelecionadasAleatoriamente(
  const Value: String);

const
SQLClientesProdutos = 'and cp.pn in (%s)';
SQLProdutosCompostos = 'and pc.composto in (select cp.produto from clientesprodutos cp where cp.pn in (%s))';
SQLProdutosCompostosFioseFitas = 'and pcfi.composto in (select cp.produto from clientesprodutos cp where cp.pn in (%s))';

begin
  fListadePNsSelecionadasAleatoriamente := Value;
  if Value<>'' then
  begin
   qryClientesProdutos.Macrobyname('ListadePNs').AsString := format(SQLClientesProdutos, [Value]);
   qryProdutosCompostos.Macrobyname('ListadePNs').AsString := format(SQLProdutosCompostos, [Value]);
   qryProdutosCompostosFios.Macrobyname('ListadePNs').AsString := format(SQLProdutosCompostosFioseFitas, [Value]);
   qryProdutosCompostosFitas.Macrobyname('ListadePNs').AsString := format(SQLProdutosCompostosFioseFitas, [Value]);

   FParametroCabecalho:=FParametroCabecalho+' Lista de PNs: '+Value;
  end
  else
  begin
   qryClientesProdutos.Macrobyname('ListadePNs').AsString := '';
   qryProdutosCompostos.Macrobyname('ListadePNs').AsString := '';
   qryProdutosCompostosFios.Macrobyname('ListadePNs').AsString := '';
   qryProdutosCompostosFitas.Macrobyname('ListadePNs').AsString := '';
  end;
end;

end.
