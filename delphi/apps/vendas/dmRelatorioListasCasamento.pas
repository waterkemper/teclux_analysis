unit dmRelatorioListasCasamento;

interface

uses
  SysUtils, Classes, dmbasico, ZTransact, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, fr_dset, fr_dbset, fr_class, fmpreviewpadrao, biblio, variants,
  Math;

type
  TdtmRelatorioListasCasamento = class(TDtmBasico)
    qryRelatorioListaCasamento: TtecQuery;
    qryRelatorioListaCasamentonumerolista: TIntegerField;
    qryRelatorioListaCasamentonome_noivo: TStringField;
    qryRelatorioListaCasamentonome_noiva: TStringField;
    qryRelatorioListaCasamentodata: TDateField;
    qryRelatorioListaCasamentoproduto: TLargeintField;
    qryRelatorioListaCasamentodescricaoproduto: TStringField;
    qryRelatorioListaCasamentoqtdadelista: TFloatField;
    qryRelatorioListaCasamentoqtdevendida: TFloatField;
    frpRelatorioListaCasamento: TfrReport;
    fdsRelatorioListaCasamento: TfrDBDataSet;
    qryRelatorioListaCasamentoprodutovisual: TStringField;
    qryRelatorioListaCasamentoCT: TtecQuery;
    fdsRelatorioListaCasamentoCT: TfrDBDataSet;
    dsrRelatorioListaCasamento: TtecDataSource;
    dsrRelatorioListaCasamentoCT: TtecDataSource;
    qryRelatorioListaCasamentoDF: TtecQuery;
    qryRelatorioListaCasamentoCTnumerolista: TIntegerField;
    qryRelatorioListaCasamentoCTproduto: TLargeintField;
    qryRelatorioListaCasamentoCTcontrato: TStringField;
    qryRelatorioListaCasamentoCTsituacaocontrato: TStringField;
    qryRelatorioListaCasamentoCTfilial: TIntegerField;
    qryRelatorioListaCasamentoCTqtdadecontrato: TFloatField;
    qryRelatorioListaCasamentoDFnumerolista: TIntegerField;
    qryRelatorioListaCasamentoDFproduto: TLargeintField;
    qryRelatorioListaCasamentoDFsituacaodadofiscal: TStringField;
    qryRelatorioListaCasamentoDFnumeronota: TIntegerField;
    qryRelatorioListaCasamentoDFserie: TStringField;
    qryRelatorioListaCasamentoDFfilialnota: TIntegerField;
    qryRelatorioListaCasamentoDFnumerocupom: TIntegerField;
    qryRelatorioListaCasamentoDFmaquina: TIntegerField;
    qryRelatorioListaCasamentoDFintervensao: TIntegerField;
    qryRelatorioListaCasamentoDFqtdadenota: TFloatField;
    qryRelatorioListaCasamentoDFcontrato: TStringField;
    fdsRelatorioListaCasamentoDF: TfrDBDataSet;
    qryRelatorioListaCasamentopreco: TFloatField;
    qryRelatorioListaCasamentoPrecoTotalLista: TFloatField;
    qryRelatorioListaCasamentoCTpreco: TFloatField;
    qryRelatorioListaCasamentoCTPrecoTotalContrato: TCurrencyField;
    qryRelatorioListaCasamentoqtdadecontrato: TFloatField;
    qryRelatorioListaCasamentoprecocontrato: TFloatField;
    qryRelatorioListaCasamentoCTnomeclientecontrato: TStringField;
    procedure frpRelatorioListaCasamentoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure qryRelatorioListaCasamentoCalcFields(DataSet: TDataSet);
    procedure qryRelatorioListaCasamentoCTCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImprimirRelatorio(DataInicial, DataFinal, ListasdeCasamento: String; QuebrarPaginaporListadeCasamento: boolean);
  end;

var
  dtmRelatorioListasCasamento: TdtmRelatorioListasCasamento;

implementation
uses dmtecsoft;

{$R *.dfm}

{ TdtmRelatorioListasCasamento }

procedure TdtmRelatorioListasCasamento.ImprimirRelatorio(DataInicial,
  DataFinal, ListasdeCasamento: String; QuebrarPaginaporListadeCasamento: boolean);
var
  FParametroCabecalho: String;
begin

  qryRelatorioListaCasamento.ParamByName('datainicial').clear;
  qryRelatorioListaCasamento.ParamByName('datafinal').clear;
  
  qryRelatorioListaCasamento.ParamByName('FilialPreco').AsInteger := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);

  if ListasdeCasamento<>'' then
  begin
    FParametroCabecalho := FParametroCabecalho + ' Listas: '+ ListasdeCasamento;
    qryRelatorioListaCasamento.MacroByName('SQL').AsString := 'and lc.codigo in (' + ListasdeCasamento + ')';
    qryRelatorioListaCasamentoCT.MacroByName('SQL').AsString := 'and lc.codigo in (' + ListasdeCasamento + ')';
    qryRelatorioListaCasamentoDF.MacroByName('SQL').AsString := 'and lc.codigo in (' + ListasdeCasamento + ')';
  end
  else
  if (DataInicial<>'') and (DataFinal<>'') then
  begin
    FParametroCabecalho := 'Entre ' + DataInicial + ' e ' + DataFinal;
    qryRelatorioListaCasamento.ParamByName('datainicial').asdatetime := strtodate(DataInicial);
    qryRelatorioListaCasamento.ParamByName('datafinal').asdatetime := strtodate(DataFinal);
    qryRelatorioListaCasamento.MacroByName('SQL').AsString := ' and lc.data between :datainicial and :datafinal ';
  end
  else
  if (DataInicial<>'') and (DataFinal='') then
  begin
    FParametroCabecalho := 'Desde ' + DataInicial ;
    qryRelatorioListaCasamento.ParamByName('datainicial').asdatetime := strtodate(DataInicial);
    qryRelatorioListaCasamento.MacroByName('SQL').AsString := ' and lc.data >= :datainicial ';
  end
  else
  if (DataInicial='') and (DataFinal<>'') then
  begin
    FParametroCabecalho := 'Até ' + DataFinal ;
    qryRelatorioListaCasamento.ParamByName('datafinal').asdatetime := strtodate(DataFinal);
    qryRelatorioListaCasamento.MacroByName('SQL').AsString := ' and lc.data <= :datafinal ';
  end
  else
  if (DataInicial='') and (DataFinal='') then
    qryRelatorioListaCasamento.MacroByName('SQL').clear;

  qryRelatorioListaCasamentoCT.Params := qryRelatorioListaCasamentoCT.Params;
  qryRelatorioListaCasamentoDF.Params := qryRelatorioListaCasamentoCT.Params;

  qryRelatorioListaCasamentoCT.Macros := qryRelatorioListaCasamentoCT.Params;
  qryRelatorioListaCasamentoDF.Macros := qryRelatorioListaCasamentoCT.Params;

  refazconsulta(qryRelatorioListaCasamento, [], []);
  refazconsulta(qryRelatorioListaCasamentoCT, [], []);
  refazconsulta(qryRelatorioListaCasamentoDF, [], []);

  frVariables['QuebrarPaginaporListadeCasamento']  := QuebrarPaginaporListadeCasamento;
  ImprimirRelatoriofast(null, FParametroCabecalho, MSimples, 0, [frpRelatorioListaCasamento], false, self);

end;

procedure TdtmRelatorioListasCasamento.frpRelatorioListaCasamentoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRelatorioListaCasamento, View);
end;

procedure TdtmRelatorioListasCasamento.qryRelatorioListaCasamentoCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryRelatorioListaCasamentoPrecoTotalLista.AsCurrency := qryRelatorioListaCasamentopreco.AsFloat * qryRelatorioListaCasamentoqtdadelista.AsFloat;
end;

procedure TdtmRelatorioListasCasamento.qryRelatorioListaCasamentoCTCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryRelatorioListaCasamentoCTPrecoTotalContrato.AsCurrency := qryRelatorioListaCasamentoCTpreco.AsFloat * qryRelatorioListaCasamentoCTqtdadecontrato.AsFloat;
end;

end.
