unit dmrelatorioentradaosp;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, FR_Class, FR_DSet, FR_DBSet,
    // Constantes
  Biblio, ctConstantes,
  // Repositorio
  dmtecsoft, clparametrossistema,
  // Outros
  fmpreviewpadrao, ZTransact;

type
  TdtmRelatorioentradaOSP = class(TdtmBasico)
    qryOSP: TtecQuery;
    dsrOSP: TtecDataSource;
    qryOSPnumero: TIntegerField;
    qryOSPentrega: TDateField;
    qryOSPsemana: TIntegerField;
    qryOSPano: TIntegerField;
    qryOSPprioridade: TIntegerField;
    qryOSPobservacoes: TStringField;
    qryOSPproduto: TLargeintField;
    qryOSPdata: TDateField;
    qryOSPcliente: TIntegerField;
    qryOSPpedidocliente: TStringField;
    qryOSPpreco: TFloatField;
    qryOSPprodutovisual: TStringField;
    qryOSPcaracteristica: TLargeintField;
    qryOSPcaracteristicavisual: TStringField;
    qryOSPqtdeentregue: TFloatField;
    fdsEntradaOSPs: TfrDBDataSet;
    frpEntradaOSPs: TfrReport;
    qryOSPnomecliente: TStringField;
    qryOSPproduto_cliente: TStringField;
    qryOSPpn: TStringField;
    qryOSPqtdetotal: TFloatField;
    qryOSPsemanaano: TStringField;
    qryOSPunidade: TStringField;
    qryOSPquantidade: TFloatField;
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure frpEntradaOSPsBeforePrint(Memo: TStringList; View: TfrView);
    procedure qryOSPAfterOpen(DataSet: TDataSet);
  private
    FDataInicial: TDateTime;
    FDataFinal: TDateTime;
    FQuantidadeTotal: Currency;
    FParametroOrdenacao: Integer;
    { Private declarations }
  public
    procedure ImprimirRelatorio;
    constructor Create(AOwner: TComponent);
    procedure GerarRelatorio;
    procedure DefinirOrdenacao;
    property DataInicial: TDateTime read FDataInicial write FDataInicial;
    property DataFinal: TDateTime read FDataFinal write FDataFinal;
    property QuantidadeTotal: Currency read FQuantidadeTotal write FQuantidadeTotal;
    property ParametroOrdenacao: Integer read FParametroOrdenacao write FParametroOrdenacao;
  end;

var
  dtmRelatorioentradaOSP: TdtmRelatorioentradaOSP;

implementation

{$R *.dfm}

{ TdtmRelatorioentradaOSP }

constructor TdtmRelatorioentradaOSP.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TdtmRelatorioentradaOSP.GerarRelatorio;
begin
  DefinirOrdenacao;
  RefazConsultaPorNome(qryOSP,['datainicial','datafinal'],[FDataInicial, FDataFinal]);
  
  FQuantidadetotal:= 0;
  if qryOSP.RecordCount > 0 then
  begin
    qryOSP.First;
    while not qryOSP.Eof do
    begin
      FQuantidadeTotal:= FQuantidadeTotal + qryOSPquantidade.AsFloat;
      qryOSP.Next;
    end
  end;
end;

procedure TdtmRelatorioentradaOSP.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  frVariables['RAZAOFILIALBASE']  := RazaoFilialBase;
  frVariables['ENDERECO_BAIRRO']   := RuaFilialBase+ ' - '+BairroFilialBase;
  frVariables['CEP_CIDADE_UF']:= FormatarCEP(CEPFilialBase)+'  '+CidadeFilialBase+ '  '+ EstadoFilialBase;
  frVariables['Titulo']:= 'QUADRO DE ENTRADA DE OSPs';
  frVariables['Outras']:= 'PERÍODO ENTRE '+
  FormatDateTime('dd/mm/yy', fdatainicial)+
  ' E '+FormatDateTime('dd/mm/yy', FDataFinal);

  frmPreview := TfrmPreviewPadrao.create(self);

  try
   //frpEntradaOSPs.DesignReport;
   Relatorio := frmPreview.frCompositeReport;
   with frmPreview do
   begin
    frCompositeReport.Reports.Clear;
    frCompositeReport.Reports.Add(frpEntradaOSPs);
   end;
   frmPreview.cmbZoom.ItemIndex:= 3;
   Relatorio.Preview := frmPreview.frPreviewPadrao;
   Relatorio.ShowReport;
   frmPreview.ShowModal;
  finally
   frmPreview.Free
  end;
end;

procedure TdtmRelatorioentradaOSP.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('C:\OSP.sql') then
    Listar.loadfromfile('C:\OSP.sql');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('C:\OSP.sql');
  listar.free;
end;

procedure TdtmRelatorioentradaOSP.frpEntradaOSPsBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpEntradaOSPs,View);
end;

procedure TdtmRelatorioentradaOSP.DefinirOrdenacao;
var Ordem : String;
begin
  case ParametroOrdenacao of
    0: Ordem:= 'osp.numero';
    1: Ordem:= 'osp.entrega';
    2: Ordem:= 'nomecliente, osp.entrega';
    3: Ordem:= 'caracteristicavisual, osp.entrega';
  end;
  qryOSP.Close;
  qryOSP.MacroByName('Ordenacao').AsString:='Order By '+Ordem;
  qryOSP.Open;
end;

procedure TdtmRelatorioentradaOSP.qryOSPAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qryOSPquantidade.DisplayFormat:= '###,###,##0';
end;

end.
