unit dmAlteracoesPrecos;

interface

uses
  SysUtils, Classes, dmBasico, dmTecsoft, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, {FxDB, FxCommon, FxStore, FxHtml,} DBClient, Provider,
  windows, forms;

type
  TdtmAlteracoesPrecos = class(TdtmBasico)
    dsrAlteracoesPrecos: TtecDataSource;
    qryAlteracoesPrecos: TtecQuery;
    qryAlteracoesPrecosproduto: TLargeintField;
    qryAlteracoesPrecosdescricao_produto: TStringField;
    qryAlteracoesPrecosdata: TDateField;
    qryAlteracoesPrecospreco: TIntegerField;
    qryAlteracoesPrecosdescricao_preco: TStringField;
    qryAlteracoesPrecosvalor: TFloatField;
    qryAlteracoesPrecosmarkup: TFloatField;
    qryAlteracoesPrecoscargo: TStringField;
    qryAlteracoesPrecosvalorprodutocargo: TFloatField;
    prvAlteracoesPrecos: TDataSetProvider;
    AlteracoesPrecos: TClientDataSet;
    AlteracoesPrecosproduto: TLargeintField;
    AlteracoesPrecosdescricao_produto: TStringField;
    AlteracoesPrecosdata: TDateField;
    AlteracoesPrecospreco: TIntegerField;
    AlteracoesPrecosdescricao_preco: TStringField;
    AlteracoesPrecosvalor: TFloatField;
    AlteracoesPrecosmarkup: TFloatField;
    AlteracoesPrecoscargo: TStringField;
    AlteracoesPrecosvalorprodutocargo: TFloatField;
    qryAlteracoesPrecosprodutovisual: TStringField;
    qryAlteracoesPrecosprodutovisualdescricao: TStringField;
    qryAlteracoesPrecostrigger_user: TStringField;
    procedure FxCube1AfterOpen(DataCube: TFxCustomStore);
    function FxCube1Call(const PID, Off: Integer;
      const Params: TExprs): Variant;
    procedure qryAlteracoesPrecosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;

    procedure AbrirConsulta(DataInicial, DataFinal: String;
          ListadeItemProdutos, ListadeProdutos,
          ListadeGrupos, ListadeClasses, ListadeMarcas: String);

  end;

var
  dtmAlteracoesPrecos: TdtmAlteracoesPrecos;

implementation

{$R *.dfm}

{ TdtmAlteracoesPrecos }

procedure TdtmAlteracoesPrecos.AbrirConsulta(DataInicial, DataFinal,
  ListadeItemProdutos, ListadeProdutos, ListadeGrupos, ListadeClasses,
  ListadeMarcas: String);
begin

  qryAlteracoesPrecos.MacrobyName('ListadeItemProdutos').asString := '';
  qryAlteracoesPrecos.MacrobyName('ListadeProdutos').asString := '';
  qryAlteracoesPrecos.MacrobyName('ListadeGrupos').asString := '';
  qryAlteracoesPrecos.MacrobyName('ListadeClasses').asString := '';
  qryAlteracoesPrecos.MacrobyName('ListadeMarcas').asString := '';

  qryAlteracoesPrecos.ParambyName('DataInicial').asDateTime := strtoDate(DataInicial);
  qryAlteracoesPrecos.ParambyName('DataFinal').asDateTime := strtoDate(DataFinal);

  if ListadeItemProdutos<>'' then
    qryAlteracoesPrecos.MacrobyName('ListadeItemProdutos').asString := ' and ('+ListadeItemProdutos+')';

  if ListadeProdutos <> '' then
    qryAlteracoesPrecos.MacrobyName('ListadeProdutos').asString := ' and ('+ListadeProdutos+')';

  if ListadeGrupos <> '' then
    qryAlteracoesPrecos.MacrobyName('ListadeGrupos').asString := ' and ('+ListadeGrupos+')';

  if ListadeClasses <> '' then
    qryAlteracoesPrecos.MacrobyName('ListadeClasses').asString := ' and ('+ListadeClasses+')';

  if ListadeMarcas <> '' then
    qryAlteracoesPrecos.MacrobyName('ListadeMarcas').asString := ' and ('+ListadeMarcas+')';

  qryAlteracoesPrecos.close;
  qryAlteracoesPrecos.open;

  FxCube1.active := false;
  FxCube1.active := true;

end;

constructor TdtmAlteracoesPrecos.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TdtmAlteracoesPrecos.FxCube1AfterOpen(DataCube: TFxCustomStore);
{
var
  FileName:string;
  }
begin
{
  FileName:=ExtractFilePath(Application.ExeName)+'precos.cds';
  AlteracoesPrecos.SaveToFile(FileName);
  AlteracoesPrecos.Close;
  AlteracoesPrecos.FileName:=FileName;
  }
end;

function TdtmAlteracoesPrecos.FxCube1Call(const PID, Off: Integer;
  const Params: TExprs): Variant;
begin
  inherited;
  Result:=-Params[0].Eval(Off);
end;

procedure TdtmAlteracoesPrecos.qryAlteracoesPrecosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryAlteracoesPrecosprodutovisualdescricao.asString := qryAlteracoesPrecosprodutovisual.asString + ' ' +
          qryAlteracoesPrecosdescricao_produto.asString;
end;

end.
