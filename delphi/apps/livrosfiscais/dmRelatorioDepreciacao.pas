unit dmRelatorioDepreciacao;

interface

uses
  SysUtils, Classes, dmbasico, ZTransact, DB, ZQuery, ZPgSqlQuery, cpquery, biblio, dmtecsoft, variants,
  clparametrossistema, dateutils, fr_dset, fr_dbset, fr_class, fmpreviewpadrao;

type
  TdtmRelatorioDepreciacao = class(TdtmBasico)
    qryDepreciacao: TtecQuery;
    qryDepreciacaonumero: TIntegerField;
    qryDepreciacaocodigobem: TLargeintField;
    qryDepreciacaoiniciouso: TDateField;
    qryDepreciacaotaxadepreciacao: TFloatField;
    qryDepreciacaovalordepreciar: TFloatField;
    qryDepreciacaodata_saida: TDateField;
    qryDepreciacaodescricaoproduto: TStringField;
    qryDepreciacaom01_ano: TFloatField;
    qryDepreciacaom02_ano: TFloatField;
    qryDepreciacaom03_ano: TFloatField;
    qryDepreciacaom04_ano: TFloatField;
    qryDepreciacaom05_ano: TFloatField;
    qryDepreciacaom06_ano: TFloatField;
    qryDepreciacaom07_ano: TFloatField;
    qryDepreciacaom08_ano: TFloatField;
    qryDepreciacaom09_ano: TFloatField;
    qryDepreciacaom10_ano: TFloatField;
    qryDepreciacaom11_ano: TFloatField;
    qryDepreciacaom12_ano: TFloatField;
    qryDepreciacao_aux: TtecQuery;
    frpRelatorioDepreciacao_ComResumo: TfrReport;
    fdsRelatorioDepreciacao: TfrDBDataSet;
    qryDepreciacaocodigovisual: TStringField;
    qryDepreciacaoccdobem: TIntegerField;
    qryDepreciacaodescricaoccdobem: TStringField;
    qryDepreciacaoccdepreciacaoacumulada: TIntegerField;
    qryDepreciacaodescricaoccdepreciacaoacumulada: TStringField;
    qryDepreciacaoccdepreciacao: TIntegerField;
    qryDepreciacaodescricaoccdepreciacao: TStringField;
    qryDepreciacaoAgrupamento: TStringField;
    frpRelatorioDepreciacao_SemResumo: TfrReport;
    frpRelatorioDepreciacao_SoResumo: TfrReport;
    procedure frpRelatorioDepreciacao_ComResumoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure qryDepreciacaoCalcFields(DataSet: TDataSet);
    procedure frpRelatorioDepreciacao_SemResumoBeforePrint(
      Memo: TStringList; View: TfrView);
    procedure frpRelatorioDepreciacao_SoResumoBeforePrint(
      Memo: TStringList; View: TfrView);
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarRelatorio(Periodo, MesInicial, MesFinal, ListaBens: String; Resumo: word): boolean;
  end;

var
  dtmRelatorioDepreciacao: TdtmRelatorioDepreciacao;

implementation

{$R *.dfm}

{ TdtmRelatorioDepreciacao }

function TdtmRelatorioDepreciacao.GerarRelatorio(Periodo, MesInicial, MesFinal,
  ListaBens: String; Resumo: word): boolean;
var
  vDataInicial, vDataFinal, vDataInicial_p, vDataFinal_p, vTitulo : String;
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;

begin
  result := false;
  vTitulo := 'Entre '+MesInicial+'/'+periodo +' e '+MesFinal+'/'+periodo;

  vDataInicial := '01/'+MesInicial+'/'+Periodo;
  vDataFinal := inttostr(DaysInAMonth(strtoint(Periodo),strtoint(MesFinal)))+'/'+Mesfinal+'/'+Periodo;

  vDataInicial_p := '01/01/'+Periodo;
  vDataFinal_p := '31/12/'+Periodo;


  qryDepreciacao.Close;
  qryDepreciacao.Sql.Text := qryDepreciacao_aux.Sql.Text;

  qryDepreciacao.Sql[NumerodalinhanoTexto(qryDepreciacao.sql, '%DataInicial_r')] := vDataInicial;
  qryDepreciacao.Sql[NumerodalinhanoTexto(qryDepreciacao.sql, '%DataInicial_r')] := vDataInicial; //duas vezes
  qryDepreciacao.Sql[NumerodalinhanoTexto(qryDepreciacao.sql, '%DataFinal_r')] := vDataFinal;

  qryDepreciacao.Sql[NumerodalinhanoTexto(qryDepreciacao.sql, '%DataInicial_p')] := vDataInicial_p;
  qryDepreciacao.Sql[NumerodalinhanoTexto(qryDepreciacao.sql, '%DataInicial_p')] := vDataInicial_p; //duas vezes
  qryDepreciacao.Sql[NumerodalinhanoTexto(qryDepreciacao.sql, '%DataFinal_p')] := vDataFinal_p;

  if ListaBens <> '' then
  begin
    qryDepreciacao.Sql[NumerodalinhanoTexto(qryDepreciacao.sql, '%SQLListadeBens')] := 'and i.numero in ('+ListaBens+')';
    vTitulo := vTitulo + ' Lista de Bens: '+ListaBens
  end
  else
    qryDepreciacao.Sql[NumerodalinhanoTexto(qryDepreciacao.sql, '%SQLListadeBens')] := '';

  case resumo of
  0,2: qryDepreciacao.macrobyname('Ordenacao').AsString := 'order by ccdobem, descricaoccdobem, ccdepreciacaoacumulada, descricaoccdepreciacaoacumulada, ccdepreciacao, descricaoccdepreciacao,  descricaoproduto, codigobem, codigovisual';
  1: qryDepreciacao.macrobyname('Ordenacao').AsString := 'order by descricaoproduto, codigobem, codigovisual';
  end;

  qryDepreciacao.Open;


  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3; //125%
  try
   Relatorio := frmPreview.frCompositeReport;
   with frmPreview do
   begin
    frCompositeReport.Reports.Clear;
    case resumo of
    0: frCompositeReport.Reports.Add(frpRelatorioDepreciacao_ComResumo);
    1: frCompositeReport.Reports.Add(frpRelatorioDepreciacao_SemResumo);
    2: frCompositeReport.Reports.Add(frpRelatorioDepreciacao_SoResumo);
    end;
    frVariables['periodo']  := periodo;
    frVariables['Outras']  := vTitulo;
    Relatorio.Preview := frmPreview.frPreviewPadrao;
    Relatorio.ShowReport;
    frmPreview.ShowModal;  end    finally   frmPreview.Free
  end;

end;

procedure TdtmRelatorioDepreciacao.frpRelatorioDepreciacao_ComResumoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRelatorioDepreciacao_ComResumo, View);
end;

procedure TdtmRelatorioDepreciacao.qryDepreciacaoCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryDepreciacaoAgrupamento.asstring := qryDepreciacaoccdobem.asstring + ' ' +
                                        qryDepreciacaodescricaoccdobem.asstring + ' ' +
                                        qryDepreciacaoccdepreciacaoacumulada.asstring + ' ' +
                                        qryDepreciacaodescricaoccdepreciacaoacumulada.asstring + ' ' +
                                        qryDepreciacaoccdepreciacao.asstring + ' ' +
                                        qryDepreciacaodescricaoccdepreciacao.asstring;
end;

procedure TdtmRelatorioDepreciacao.frpRelatorioDepreciacao_SemResumoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRelatorioDepreciacao_SemResumo, View);
end;

procedure TdtmRelatorioDepreciacao.frpRelatorioDepreciacao_SoResumoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRelatorioDepreciacao_SoResumo, View);
end;

end.
