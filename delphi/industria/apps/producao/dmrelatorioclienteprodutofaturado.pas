unit dmrelatorioclienteprodutofaturado;

interface

uses
  SysUtils, Classes, dmbasico, ZTransact, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, ExcelExport, biblio, ctconstantes;

type
  TdtmRelatorioClienteProdutoFaturado = class(TdtmBasico)
    dsrClienteProdutoFaturado: TtecDataSource;
    qryClienteProdutoFaturado: TtecQuery;
    ExcelExport1: TExcelExport;
    qryClienteProdutoFaturadotipocliente: TStringField;
    qryClienteProdutoFaturadocliente: TIntegerField;
    qryClienteProdutoFaturadonome: TStringField;
    qryClienteProdutoFaturadonomepais: TStringField;
    qryClienteProdutoFaturadogrupo: TStringField;
    qryClienteProdutoFaturadocodigovisual: TStringField;
    qryClienteProdutoFaturadoproduto_cliente: TStringField;
    qryClienteProdutoFaturadopn: TStringField;
    qryClienteProdutoFaturadoempcargo: TIntegerField;
    qryClienteProdutoFaturadodescricaoatividade: TStringField;
    qryClienteProdutoFaturadoano: TStringField;
    qryClienteProdutoFaturadomes: TStringField;
    qryClienteProdutoFaturadoquantidade_mes: TFloatField;
    qryClienteProdutoFaturadovalor_mes: TFloatField;
    qryClienteProdutoFaturadoVLRUNITARIO: TCurrencyField;
    procedure qryClienteProdutoFaturadoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function AbrirConsulta(MesAnoInicial, MesAnoFinal, ListaClientes, ListaGruposProdutos: String): boolean;
    procedure ExportarExcel;

  end;

var
  dtmRelatorioClienteProdutoFaturado: TdtmRelatorioClienteProdutoFaturado;

implementation

uses DateUtils;

{$R *.dfm}

{ TdtmRelatorioClienteProdutoFaturado }

function TdtmRelatorioClienteProdutoFaturado.AbrirConsulta(MesAnoInicial,
  MesAnoFinal, ListaClientes, ListaGruposProdutos: String): boolean;
var
  vDataInicial, vDataFinal : TDateTime;
begin
  vDataInicial := strtodatetime('01/'+MesAnoInicial);
  vDataFinal :=  strtodatetime(inttostr(DaysInMonth(strtodatetime('01/'+MesAnoFinal)))+'/'+MesAnoFinal);

  qryClienteProdutoFaturado.MacroByName('FiltroPeriodo').AsString := 'and df.data between :DataInicial and :DataFinal';
  qryClienteProdutoFaturado.ParamByName('datainicial').AsDateTime := vdatainicial;
  qryClienteProdutoFaturado.ParamByName('datafinal').  AsDateTime := vDataFinal;

  if ListaClientes <> '' then
    qryClienteProdutoFaturado.MacroByName('FiltroClientes').AsString := 'and (df.cliente, df.tipocliente) in ('+ListaClientes+')'
  else
    qryClienteProdutoFaturado.MacroByName('FiltroClientes').AsString := '';

  if ListaGruposProdutos <> '' then
    qryClienteProdutoFaturado.MacroByName('FiltroGrupoProdutos').AsString := 'and c.grupo in ('+ListaGruposProdutos+')'
  else
    qryClienteProdutoFaturado.MacroByName('FiltroGrupoProdutos').AsString := '';

  qryClienteProdutoFaturado.Close;
  qryClienteProdutoFaturado.Open;

  if qryClienteProdutoFaturado.IsEmpty then
  begin
    result := false;
    MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
  end
  else
    result := true

end;

procedure TdtmRelatorioClienteProdutoFaturado.ExportarExcel;
begin
  GuardarRegistroAtual(qryClienteProdutoFaturado,true);
  ExcelExport1.ExportDataset;
  VoltarRegistroAtual(qryClienteProdutoFaturado);
end;

procedure TdtmRelatorioClienteProdutoFaturado.qryClienteProdutoFaturadoCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if qryClienteProdutoFaturadoquantidade_mes.AsCurrency <> 0 then
    qryClienteProdutoFaturadoVLRUNITARIO.AsCurrency := qryClienteProdutoFaturadovalor_mes.AsCurrency /
                                                     qryClienteProdutoFaturadoquantidade_mes.AsCurrency
  else
    qryClienteProdutoFaturadoVLRUNITARIO.AsCurrency := 0;

end;

end.
