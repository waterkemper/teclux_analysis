unit dmRelatorioListasCasamento;

interface

uses
  SysUtils, Classes, dmbasico, ZTransact, DB, cpQuery, ZPgSqlQuery, cpquery,
  cpdatasource, fr_dset, fr_dbset, fr_class, fmpreviewpadrao, biblio;

type
  TdtmRelatorioListasCasamento = class(TDtmBasico)
    qryRelatorioListaCasamento: TtecQuery;
    dsrRelatorioListaCasamento: TtecDataSource;
    qryRelatorioListaCasamentonumerolista: TIntegerField;
    qryRelatorioListaCasamentonome_noivo: TStringField;
    qryRelatorioListaCasamentonome_noiva: TStringField;
    qryRelatorioListaCasamentodata: TDateField;
    qryRelatorioListaCasamentoproduto: TLargeintField;
    qryRelatorioListaCasamentodescricaoproduto: TStringField;
    qryRelatorioListaCasamentoqtdadelista: TFloatField;
    qryRelatorioListaCasamentoqtdevendida: TFloatField;
    qryRelatorioListaCasamentocontrato: TStringField;
    qryRelatorioListaCasamentosituacaocontrato: TStringField;
    qryRelatorioListaCasamentofilial: TIntegerField;
    qryRelatorioListaCasamentoqtdadecontrato: TFloatField;
    qryRelatorioListaCasamentosituacaodadofiscal: TStringField;
    qryRelatorioListaCasamentonumeronota: TIntegerField;
    qryRelatorioListaCasamentofilialnota: TIntegerField;
    qryRelatorioListaCasamentonumerocupom: TIntegerField;
    qryRelatorioListaCasamentomaquina: TIntegerField;
    qryRelatorioListaCasamentointervensao: TIntegerField;
    qryRelatorioListaCasamentoqtdadenota: TFloatField;
    frpRelatorioListaCasamento: TfrReport;
    fdsRelatorioListaCasamento: TfrDBDataSet;
    qryRelatorioListaCasamentoprodutovisual: TStringField;
    qryRelatorioListaCasamentoserie: TStringField;
    procedure frpRelatorioListaCasamentoBeforePrint(Memo: TStringList;
      View: TfrView);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImprimirRelatorio(DataInicial, DataFinal: String);
  end;

var
  dtmRelatorioListasCasamento: TdtmRelatorioListasCasamento;

implementation
uses dmtecsoft;

{$R *.dfm}

{ TdtmRelatorioListasCasamento }

procedure TdtmRelatorioListasCasamento.ImprimirRelatorio(DataInicial,
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

procedure TdtmRelatorioListasCasamento.frpRelatorioListaCasamentoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRelatorioListaCasamento, View);
end;

end.
