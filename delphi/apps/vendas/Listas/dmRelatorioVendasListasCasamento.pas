unit dmRelatorioVendasListasCasamento;

interface

uses
  SysUtils, Classes, dmbasico, ZTransact, DB, cpQuery, ZPgSqlQuery, cpquery,
  cpdatasource, fr_dset, fr_dbset, fr_class, fmpreviewpadrao, biblio;

type
  TdtmRelatorioVendasListasCasamento = class(TDtmBasico)
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
    procedure frpRelatorioListaCasamentoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure qryRelatorioListaCasamentoCalcFields(DataSet: TDataSet);
    procedure qryRelatorioListaCasamentoCTCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImprimirRelatorio(DataInicial, DataFinal: String);
  end;

var
  dtmRelatorioVendasListasCasamento: TdtmRelatorioVendasListasCasamento;

implementation
uses dmtecsoft;

{$R *.dfm}

{ TdtmRelatorioVendasListasCasamento }

procedure TdtmRelatorioVendasListasCasamento.ImprimirRelatorio(DataInicial,
  DataFinal: String);
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
  FParametroCabecalho: String;

begin
  FParametroCabecalho := 'Entre ' + DataInicial + ' e ' + DataFinal;

  refazconsultapornome(qryRelatorioListaCasamento,
                       ['datainicial','datafinal'],
                       [FormatDateTime('YYYY-MM-DD',strtodate(DataInicial)),
                        FormatDateTime('YYYY-MM-DD',strtodate(DataFinal))]);

  refazconsultapornome(qryRelatorioListaCasamentoCT,
                       ['datainicial','datafinal'],
                       [FormatDateTime('YYYY-MM-DD',strtodate(DataInicial)),
                        FormatDateTime('YYYY-MM-DD',strtodate(DataFinal))]);

  refazconsultapornome(qryRelatorioListaCasamentoDF,
                       ['datainicial','datafinal'],
                       [FormatDateTime('YYYY-MM-DD',strtodate(DataInicial)),
                        FormatDateTime('YYYY-MM-DD',strtodate(DataFinal))]);

  frVariables['RAZAOFILIALBASE']  := RazaoFilialBase;
  frVariables['ENDERECO_BAIRRO']   := RuaFilialBase+ ' - '+BairroFilialBase;
  frVariables['CEP_CIDADE_UF']:= FormatarCEP(CEPFilialBase)+'  '+CidadeFilialBase+ '  '+ EstadoFilialBase;
  frVariables['Outras']:= FParametroCabecalho;
//  frpRelatorioListaCasamento.DesignReport;
  frmPreview := TfrmPreviewPadrao.create(self);
  try
   Relatorio := frmPreview.frCompositeReport;
   with frmPreview do
   begin
    frCompositeReport.Reports.Clear;
    frCompositeReport.Reports.Add(frpRelatorioListaCasamento);
   end;
   Relatorio.Preview := frmPreview.frPreviewPadrao;
   Relatorio.ShowReport;
   frmPreview.ShowModal;

  finally

   frmPreview.Free

  end;

                          
end;

procedure TdtmRelatorioVendasListasCasamento.frpRelatorioListaCasamentoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRelatorioListaCasamento, View);
end;

procedure TdtmRelatorioVendasListasCasamento.qryRelatorioListaCasamentoCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryRelatorioListaCasamentoPrecoTotalLista.AsCurrency := qryRelatorioListaCasamentopreco.AsFloat * qryRelatorioListaCasamentoqtdadelista.AsFloat;
end;

procedure TdtmRelatorioVendasListasCasamento.qryRelatorioListaCasamentoCTCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryRelatorioListaCasamentoCTPrecoTotalContrato.AsCurrency := qryRelatorioListaCasamentoCTpreco.AsFloat * qryRelatorioListaCasamentoCTqtdadecontrato.AsFloat;
end;

end.
