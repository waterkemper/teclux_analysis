unit dmOrdensCarga;

interface

uses
  SysUtils, Classes, dmbasico, ZTransact, dmtecsoft, DB, cpdatasource,
  ZQuery, ZPgSqlQuery, cpquery, biblio;

type
  TdtmOrdensCarga = class(TdtmBasico)
    qryOrdensCarga: TtecQuery;
    dsrOrdensCarga: TtecDataSource;
    qryOrdensCarganumero: TIntegerField;
    qryOrdensCargadata: TDateField;
    qryOrdemdeCargaRegioes: TtecQuery;
    dsrOrdemdeCargaRegioes: TtecDataSource;
    qryOrdemdeCargaRegioesordemcarga: TIntegerField;
    qryOrdemdeCargaRegioesregiao: TStringField;
    qryOrdemdeCargaRegioesnomeregiao: TStringField;
    qryOrdemdeCargaRegioesresponsavelentrega: TStringField;
    qryOrdemdeCargaProdutos: TtecQuery;
    dsrOrdemdeCargaProdutos: TtecDataSource;
    qryOrdemdeCargaProdutosnrentrega: TIntegerField;
    qryOrdemdeCargaProdutosnomecliente: TStringField;
    qryOrdemdeCargaProdutosnomecidade: TStringField;
    qryOrdemdeCargaProdutosnomebairro: TStringField;
    qryOrdemdeCargaProdutoslocalentrega: TStringField;
    qryOrdemdeCargaProdutostelefone: TStringField;
    qryOrdemdeCargaProdutoscontato: TStringField;
    qryOrdemdeCargaProdutosnrnota: TIntegerField;
    qryOrdemdeCargaProdutosobservacoes: TStringField;
    qryOrdemdeCargaProdutos_001: TFloatField;
    qryOrdemdeCargaProdutos_002: TFloatField;
    qryOrdemdeCargaProdutos_003: TFloatField;
    qryOrdemdeCargaProdutos_004: TFloatField;
    qryOrdemdeCargaProdutos_005: TFloatField;
    qryOrdemdeCargaProdutos_010: TFloatField;
    qryOrdemdeCargaProdutos_013: TFloatField;
    qryOrdemdeCargaProdutos_014: TFloatField;
    qryOrdemdeCargaProdutos_024_12: TFloatField;
    qryOrdemdeCargaProdutos_10: TFloatField;
    qryOrdemdeCargaProdutos_15: TFloatField;
    qryOrdemdeCargaProdutos_24_12: TFloatField;
    qryOrdemdeCargaProdutos_5: TFloatField;
    qryOrdemdeCargaProdutos_7: TFloatField;
    procedure qryOrdensCargaAfterScroll(DataSet: TDataSet);
    procedure qryOrdemdeCargaRegioesAfterScroll(DataSet: TDataSet);
    procedure qryOrdemdeCargaProdutosAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmOrdensCarga: TdtmOrdensCarga;

implementation

{$R *.dfm}

procedure TdtmOrdensCarga.qryOrdensCargaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qryOrdemdeCargaRegioes,['ordemcarga'],[qryOrdensCarganumero.asinteger]);
   
end;

procedure TdtmOrdensCarga.qryOrdemdeCargaRegioesAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if qryOrdemdeCargaRegioesregiao.isnull then
  qryOrdemdeCargaProdutos.Sql[NumerodalinhanoTexto(qryOrdemdeCargaProdutos.sql, '%ordemcarga_1')+1] :=
    'where e.ordemcarga = '+qryOrdensCarganumero.asstring+' and coalesce(ba.regiao, cid.regiao) is null'
  else
  qryOrdemdeCargaProdutos.Sql[NumerodalinhanoTexto(qryOrdemdeCargaProdutos.sql, '%ordemcarga_1')+1] :=
    'where e.ordemcarga = '+qryOrdensCarganumero.asstring+' and coalesce(ba.regiao, cid.regiao) = ' + qryOrdemdeCargaRegioesregiao.AsString;

  if qryOrdemdeCargaRegioesregiao.isnull then
  qryOrdemdeCargaProdutos.Sql[NumerodalinhanoTexto(qryOrdemdeCargaProdutos.sql, '%ordemcarga_2')+1] :=
    'where e.ordemcarga = '+qryOrdensCarganumero.asstring+' and coalesce(ba.regiao, cid.regiao) is null'
  else
  qryOrdemdeCargaProdutos.Sql[NumerodalinhanoTexto(qryOrdemdeCargaProdutos.sql, '%ordemcarga_2')+1] :=
    'where e.ordemcarga = '+qryOrdensCarganumero.asstring+' and coalesce(ba.regiao, cid.regiao) = ' + qryOrdemdeCargaRegioesregiao.AsString;

  if qryOrdemdeCargaRegioesregiao.isnull then
  qryOrdemdeCargaProdutos.Sql[NumerodalinhanoTexto(qryOrdemdeCargaProdutos.sql, '%ordemcarga_3')+1] :=
    'where e.ordemcarga = '+qryOrdensCarganumero.asstring+' and coalesce(ba.regiao, cid.regiao) is null'
  else
  qryOrdemdeCargaProdutos.Sql[NumerodalinhanoTexto(qryOrdemdeCargaProdutos.sql, '%ordemcarga_3')+1] :=
    'where e.ordemcarga = '+qryOrdensCarganumero.asstring+' and coalesce(ba.regiao, cid.regiao) = ' + qryOrdemdeCargaRegioesregiao.AsString;

  if qryOrdemdeCargaRegioesregiao.isnull then
  qryOrdemdeCargaProdutos.Sql[NumerodalinhanoTexto(qryOrdemdeCargaProdutos.sql, '%ordemcarga_4')+1] :=
    'where e.ordemcarga = '+qryOrdensCarganumero.asstring+' and coalesce(ba.regiao, cid.regiao) is null'
  else
  qryOrdemdeCargaProdutos.Sql[NumerodalinhanoTexto(qryOrdemdeCargaProdutos.sql, '%ordemcarga_4')+1] :=
    'where e.ordemcarga = '+qryOrdensCarganumero.asstring+' and coalesce(ba.regiao, cid.regiao) = ' + qryOrdemdeCargaRegioesregiao.AsString;


  qryOrdemdeCargaProdutos.open;
end;

procedure TdtmOrdensCarga.qryOrdemdeCargaProdutosAfterOpen(
  DataSet: TDataSet);
var
 i: integer;
begin
  inherited;
end;

end.
