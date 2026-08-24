unit dmrelatorioEvolucaoPrecos;

interface

uses
  SysUtils, Classes, dmbasico, ZTransact, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, ExcelExport, biblio, ctconstantes;

type
  TdtmRelatorioEvolucaoPrecos = class(TdtmBasico)
    dsrEvolucaoPrecos: TtecDataSource;
    qryEvolucaoPrecos: TtecQuery;
    ExcelExport1: TExcelExport;
    qryEvolucaoPrecostipocliente: TStringField;
    qryEvolucaoPrecoscliente: TIntegerField;
    qryEvolucaoPrecosnome: TStringField;
    qryEvolucaoPrecosnomepais: TStringField;
    qryEvolucaoPrecosgrupo: TStringField;
    qryEvolucaoPrecoscodigovisual: TStringField;
    qryEvolucaoPrecosproduto_cliente: TStringField;
    qryEvolucaoPrecospn: TStringField;
    qryEvolucaoPrecosdatainicio: TDateField;
    qryEvolucaoPrecosdatafinal: TDateField;
    qryEvolucaoPrecosprecounitario: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
    function AbrirConsulta(MesAnoInicial, MesAnoFinal, ListaClientes, ListaGruposProdutos: String): boolean;
    procedure ExportarExcel;

  end;

var
  dtmRelatorioEvolucaoPrecos: TdtmRelatorioEvolucaoPrecos;

implementation

uses DateUtils;

{$R *.dfm}

{ TdtmRelatorioEvolucaoPrecos }

function TdtmRelatorioEvolucaoPrecos.AbrirConsulta(MesAnoInicial,
  MesAnoFinal, ListaClientes, ListaGruposProdutos: String): boolean;
var
  vDataInicial, vDataFinal : TDateTime;
begin
  vDataInicial := strtodatetime('01/'+MesAnoInicial);
  vDataFinal :=  strtodatetime(inttostr(DaysInMonth(strtodatetime('01/'+MesAnoFinal)))+'/'+MesAnoFinal);

  qryEvolucaoPrecos.MacroByName('FiltroPeriodo').AsString := 'and df.data between :DataInicial and :DataFinal';
  qryEvolucaoPrecos.ParamByName('datainicial').AsDateTime := vdatainicial;
  qryEvolucaoPrecos.ParamByName('datafinal').  AsDateTime := vDataFinal;

  if ListaClientes <> '' then
    qryEvolucaoPrecos.MacroByName('FiltroClientes').AsString := 'and (df.cliente, df.tipocliente) in ('+ListaClientes+')'
  else
    qryEvolucaoPrecos.MacroByName('FiltroClientes').AsString := '';

  if ListaGruposProdutos <> '' then
    qryEvolucaoPrecos.MacroByName('FiltroGrupoProdutos').AsString := 'and c.grupo in ('+ListaGruposProdutos+')'
  else
    qryEvolucaoPrecos.MacroByName('FiltroGrupoProdutos').AsString := '';

  qryEvolucaoPrecos.Close;
  qryEvolucaoPrecos.Open;

  if qryEvolucaoPrecos.IsEmpty then
  begin
    result := false;
    MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
  end
  else
    result := true

end;

procedure TdtmRelatorioEvolucaoPrecos.ExportarExcel;
begin
  GuardarRegistroAtual(qryEvolucaoPrecos,true);
  ExcelExport1.ExportDataset;
  VoltarRegistroAtual(qryEvolucaoPrecos);
end;

end.
