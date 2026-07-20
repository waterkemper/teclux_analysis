unit dmrelatoriovendascontatos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  dmbasico, FR_Class, FR_DSet, FR_DBSet, DB, cpdatasource, ZQuery,
  ZPgSqlQuery, cpquery, dmtecsoft, ctconstantes;

type
  TdtmRelatorioVendasContatos = class(TdtmBasico)
    qryRelatorioVendas: TtecQuery;
    dsrRelatorioVendas: TtecDataSource;
    qryRelatorioVendasTotal: TtecQuery;
    dsrRelatorioVendasTotal: TtecDataSource;
    qryRelatorioVendascliente: TIntegerField;
    qryRelatorioVendasdatahora: TDateTimeField;
    qryRelatorioVendasdata: TDateField;
    qryRelatorioVendasnumero: TStringField;
    qryRelatorioVendasnome: TStringField;
    qryRelatorioVendasvalorprazo: TFloatField;
    qryRelatorioVendasTotalcount: TIntegerField;
    qryRelatorioVendasTotalsum: TFloatField;
    frRelatorioVendas: TfrReport;
    frDBRelatorioVendas: TfrDBDataSet;
    frDBRelatorioVendasTotal: TfrDBDataSet;
    qryPagamentoContatoTotal: TtecQuery;
    qryPagamentoContato: TtecQuery;
    dsrPagamentoContato: TtecDataSource;
    frRelatorioPagamentoContato: TfrReport;
    frDBRelatorioPagamentoContato: TfrDBDataSet;
    qryPagamentoContatocliente: TIntegerField;
    qryPagamentoContatodatahora: TDateTimeField;
    qryPagamentoContatodata: TDateField;
    qryPagamentoContatonumero: TStringField;
    qryPagamentoContatonome: TStringField;
    qryPagamentoContatovalorvencto: TFloatField;
    qryPagamentoContatovalorpagto: TFloatField;
    qryPagamentoContatoTotalcount: TIntegerField;
    qryPagamentoContatoTotalsumvencto: TFloatField;
    qryPagamentoContatoTotalsumpagto: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DataRelatorio(dtInicial, dtFinal: string);
    constructor Create(AOwner: TComponent); override;
    procedure Periodo(DataInicio,DataTermio,Carencia:string);
  end;

{var
  dtmRelatorioVendasContatos: TdtmRelatorioVendasContatos;}

implementation

{$R *.dfm}

{ TdtmRelatorioVendasContatos }

constructor TdtmRelatorioVendasContatos.Create(AOwner: TComponent);
begin
  inherited;
  qryRelatorioVendas.Tag        := ctRelatorioVendasContatos;
  qryRelatorioVendasTotal.Tag   := ctRelatorioVendasContatos;
  qryPagamentoContato.Tag       := ctRelatorioVendasContatos;
  qryPagamentoContatoTotal.Tag  := ctRelatorioVendasContatos;
end;

procedure TdtmRelatorioVendasContatos.DataRelatorio(dtInicial,
  dtFinal: string);
begin
  frRelatorioVendas.Dictionary.Variables.Variable['Data1']:=QuotedStr(dtInicial);
  frRelatorioVendas.Dictionary.Variables.Variable['Data2']:=QuotedStr(dtFinal);
  frRelatorioPagamentoContato.Dictionary.Variables.Variable['Data1']:=QuotedStr(dtInicial);
  frRelatorioPagamentoContato.Dictionary.Variables.Variable['Data2']:=QuotedStr(dtFinal);
end;

procedure TdtmRelatorioVendasContatos.Periodo(DataInicio, DataTermio,
  Carencia: string);
begin
  qryRelatorioVendas.Params[0].AsString := DataInicio;
  qryRelatorioVendas.Params[1].AsString := DateToStr(StrtoDate(DataTermio)+1);
  qryRelatorioVendas.Params[2].AsInteger := StrToInt(Carencia);
  qryRelatorioVendasTotal.Params[0].AsString := DataInicio;
  qryRelatorioVendasTotal.Params[1].AsString := DateToStr(StrtoDate(DataTermio)+1);
  qryRelatorioVendasTotal.Params[2].AsInteger := StrToInt(Carencia);
  qryPagamentoContato.Params[0].AsString := DataInicio;
  qryPagamentoContato.Params[1].AsString := DateToStr(StrtoDate(DataTermio)+1);
  qryPagamentoContato.Params[2].AsInteger := StrToInt(Carencia);
  qryPagamentoContatoTotal.Params[0].AsString := DataInicio;
  qryPagamentoContatoTotal.Params[1].AsString := DateToStr(StrtoDate(DataTermio)+1);
  qryPagamentoContatoTotal.Params[2].AsInteger := StrToInt(Carencia);
end;

end.
