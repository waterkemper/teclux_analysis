unit dmrelatoriopedidosclientes;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, fr_class, fr_dset, fr_dbset;

type
  TdtmRelatorioPedidosClientes = class(TdtmBasico)
    qryOsp: TtecQuery;
    qryOspnumero: TIntegerField;
    qryOspentrega: TDateField;
    qryOspproduto: TLargeintField;
    qryOspdata: TDateField;
    qryOspcliente: TIntegerField;
    qryOsppedidocliente: TStringField;
    qryOspquantidade: TFloatField;
    qryOspnomecliente: TStringField;
    qryOspprodutovisual: TStringField;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    procedure frReport1BeforePrint(Memo: TStringList; View: TfrView);
  private
    { Private declarations }
  public
    function ImprimirRelatorio(SemanaEntrada, AnoEntrada, SemanaEntrega, AnoEntrega,
      OSPInicial, OSPFinal, CodigoCliente, TipoCliente: String): Boolean;
    { Public declarations }
  end;

var
  dtmRelatorioPedidosClientes: TdtmRelatorioPedidosClientes;

implementation

uses
  biblio, fmpreviewpadrao;
{$R *.dfm}

{ TdtmRelatorioPedidosClientes }

function TdtmRelatorioPedidosClientes.ImprimirRelatorio(SemanaEntrada,
  AnoEntrada, SemanaEntrega, AnoEntrega, OSPInicial, OSPFinal, CodigoCliente,
  TipoCliente: String): Boolean;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin

  if SemanaEntrada <> '0'
  then qryOsp.MacroByName('SemanaEntrada').AsString:= 'AND ((SELECT EXTRACT(YEAR FROM Osp.Data)) > '  + AnoEntrada +
                                                      ' OR ((SELECT EXTRACT(YEAR FROM Osp.Data)) = '  + AnoEntrada +
                                                      ' AND (SELECT EXTRACT(WEEK FROM Osp.Data)) >= ' + SemanaEntrada + '))'
  else qryOsp.MacroByName('SemanaEntrada').AsString:= 'AND (SELECT EXTRACT(YEAR FROM Osp.Data)) >= '  + AnoEntrada;


  if (SemanaEntrega <> '0') and (AnoEntrega<>'') then
    qryOsp.MacroByName('SemanaEntrega').AsString:= ' and osp.semana = ' + SemanaEntrega+
                                                   ' and osp.ano = '+AnoEntrega
  else
  if (AnoEntrega<>'0') then
     qryOsp.MacroByName('SemanaEntrega').AsString:= ' and osp.ano = '+AnoEntrega
  else
    qryOsp.MacroByName('SemanaEntrega').AsString:= '';



  if (OSPInicial <> '') and (OSPFinal <> '') then
    qryOsp.MacroByName('OSP').AsString := 'and osp.numero between '+OSPInicial+' and '+OSPFinal
  else if (OSPInicial <> '') and (OSPFinal = '') then
    qryOsp.MacroByName('OSP').AsString := 'and osp.numero >= '+OSPInicial
  else if (OSPInicial = '') and (OSPFinal <> '') then
    qryOsp.MacroByName('OSP').AsString := 'and osp.numero <= '+OSPInicial
  else
    qryOsp.MacroByName('OSP').AsString := '';

  if CodigoCliente <> '' then
    qryOsp.MacroByName('Cliente').AsString := 'and osp.cliente = ' + CodigoCliente
  else
    qryOsp.MacroByName('Cliente').AsString := '';

  qryOSP.Close;
  qryOSP.Open;

  Result := qryOsp.RecordCount > 0;
  if Result then
  begin
    frVariables['RAZAOFILIALBASE']  := RazaoFilialBase;
    frVariables['ENDERECO_BAIRRO']  := RuaFilialBase + ' - ' + BairroFilialBase;
    frVariables['CEP_CIDADE_UF']:= FormatarCEP(CEPFilialBase) + '  ' + CidadeFilialBase + '  ' + EstadoFilialBase;
    frVariables['Titulo']:= 'QUADRO DE PEDIDOS POR CLIENTE';
    frVariables['Outras']:= '';

    if SemanaEntrada <> '0'
    then frVariables['Outras']:= frVariables['Outras'] + 'ENTRADAS DESDE ' + SemanaEntrada + '/' + AnoEntrada + sLineBreak
    else frVariables['Outras']:= frVariables['Outras'] + 'ENTRADAS DESDE ' + AnoEntrada + sLineBreak;

    if SemanaEntrega <> '0'
    then frVariables['Outras']:= frVariables['Outras'] + 'ENTREGAS EM ' + SemanaEntrega + '/' + AnoEntrega + sLineBreak
    else frVariables['Outras']:= frVariables['Outras'] + 'ENTREGAS EM ' + AnoEntrega + sLineBreak;

    frmPreview := TfrmPreviewPadrao.create(self);

    try
//     frReport1.DesignReport;
     Relatorio := frmPreview.frCompositeReport;
     with frmPreview do
     begin
      frCompositeReport.Reports.Clear;
      frCompositeReport.Reports.Add(frReport1);
     end;
     frmPreview.cmbZoom.ItemIndex:= 3;
     Relatorio.Preview := frmPreview.frPreviewPadrao;
     Relatorio.ShowReport;
     frmPreview.ShowModal;
    finally
     frmPreview.Free
    end;
  end;
end;

procedure TdtmRelatorioPedidosClientes.frReport1BeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frReport1,View);
end;

end.
 