unit dmmotivosparadas;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, dmtecsoft, biblio, ctconstantes, ExcelExport, ZTransact;

type
  Tdtmmotivosparadas = class(TdtmBasico)
    qrymotivosparadas: TtecQuery;
    dsrmotivosparadas: TtecDataSource;
    ExcelExport1: TExcelExport;
    qrySetores: TtecQuery;
    qrySetoressetor: TStringField;
    qrymotivosparadassetor: TStringField;
    qrymotivosparadasdescricaosetor: TStringField;
    qrymotivosparadasmaquina: TIntegerField;
    qrymotivosparadasdescricaomaquina: TStringField;
    qrymotivosparadasusuario: TIntegerField;
    qrymotivosparadasnomeusuario: TStringField;
    qrymotivosparadascodigoparada: TIntegerField;
    qrymotivosparadasdescricaoparada: TStringField;
    qrymotivosparadastempoparada: TLargeintField;
    qrymotivosparadaspn: TStringField;
    qrymotivosparadasosp: TIntegerField;
    qrymotivosparadaslote: TIntegerField;
    qrymotivosparadasnomeoperacao: TStringField;
    qrymotivosparadasc01: TStringField;
    qrymotivosparadasc02: TStringField;
    qrymotivosparadasc03: TStringField;
    procedure qrymotivosparadasAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function AbrirConsulta(DataInicial, DataFinal,
                           ListaSetoresProducao, ListaFuncionarios,
                           ListaMaquinas, ListaMotivosParadas: String): boolean;
                           
    procedure ExportarExcell;
  end;

var
  dtmmotivosparadas: Tdtmmotivosparadas;

implementation

{$R *.dfm}

{ Tdtmmotivosparadas }

function Tdtmmotivosparadas.AbrirConsulta(DataInicial, DataFinal,
  ListaSetoresProducao, ListaFuncionarios,
  ListaMaquinas, ListaMotivosParadas: String): boolean;
var
 vLider : string;
 vMediaEficiencia : Currency;
 vMaiorValorPremio : Currency;
 vNumero: integer;
 vFinalArquivo : Boolean;
 vListaSetores : String;
 i : integer;

begin

  qrymotivosparadas.parambyname('dataInicial').AsString := DataInicial;
  qrymotivosparadas.parambyname('dataFinal').AsString := DataFinal;

  if (DataInicial<>'') and (DataFinal<>'') then
    qrymotivosparadas.macrobyname('SQLIntervalo').AsString :=  ' and oou.data between :dataInicial and :dataFinal '
  else
  if (DataInicial<>'') and (DataFinal='') then
    qrymotivosparadas.macrobyname('SQLIntervalo').AsString :=  ' and oou.data between >=:dataInicial '
  else
  if (DataInicial='') and (DataFinal<>'') then
    qrymotivosparadas.macrobyname('SQLIntervalo').AsString :=  ' and oou.data <=:dataFinal '
  else
  if (DataInicial='') and (DataFinal='') then
    qrymotivosparadas.macrobyname('SQLIntervalo').Clear;

  if ListaSetoresProducao <> '' then
    qrymotivosparadas.MacroByName('SQLSetoresProducao').AsString := 'and sp.codigo in ('+ListaSetoresProducao+')'
  else
    qrymotivosparadas.MacroByName('SQLSetoresProducao').clear;

  if ListaFuncionarios <> '' then
    qrymotivosparadas.MacroByName('SQLOperadores').AsString := 'and oou.usuario in ('+ListaFuncionarios+')'
  else
    qrymotivosparadas.MacroByName('SQLOperadores').clear;

  if ListaMaquinas <> '' then
    qrymotivosparadas.MacroByName('SQLMaquinas').AsString := 'and m.codigo in ('+ListaMaquinas+')'
  else
    qrymotivosparadas.MacroByName('SQLMaquinas').clear;

  if ListaMotivosParadas <> '' then
    qrymotivosparadas.MacroByName('SQLMotivosParadas').AsString := 'and mp.codigo in ('+ListaMotivosParadas+')'
  else
    qrymotivosparadas.MacroByName('SQLMotivosParadas').clear;

  qrymotivosparadas.Close;
  qrymotivosparadas.Open;

  if qrymotivosparadas.IsEmpty then
  begin
    result := false;
    MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
  end
  else
    result := true
end;

procedure Tdtmmotivosparadas.ExportarExcell;
begin
  GuardarRegistroAtual(qrymotivosparadas,true);
  ExcelExport1.ExportDataset;
  VoltarRegistroAtual(qrymotivosparadas);
end;

procedure Tdtmmotivosparadas.qrymotivosparadasAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  if qrymotivosparadas.FindField('descricao')<>nil then
     qrymotivosparadas.Fieldbyname('descricao').DisplayWidth := 100

end;

end.
