unit dmAnaliseParadasMaquinasSetores;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, dmtecsoft, biblio, ctconstantes, ExcelExport, ZTransact;

type
  TdtmAnaliseParadasMaquinasSetores = class(TdtmBasico)
    qryAnaliseParadas_Maquinas_x_Paradas: TtecQuery;
    dsrAnaliseParadas: TtecDataSource;
    ExcelExport1: TExcelExport;
    qryAnaliseParadas_Setores_x_Paradas: TtecQuery;
    qryAnaliseParadas_Maquinas_x_Paradassetorproducao: TStringField;
    qryAnaliseParadas_Maquinas_x_Paradasmaquina: TIntegerField;
    qryAnaliseParadas_Maquinas_x_Paradasdescricaomaquina: TStringField;
    qryAnaliseParadas_Maquinas_x_Paradascodigoparada: TIntegerField;
    qryAnaliseParadas_Maquinas_x_Paradasdescricaoparada: TStringField;
    qryAnaliseParadas_Maquinas_x_Paradastempoparada: TLargeintField;
    qryAnaliseParadas_Setores_x_Paradassetorproducao: TStringField;
    qryAnaliseParadas_Setores_x_Paradasdescricaosetor: TStringField;
    qryAnaliseParadas_Setores_x_Paradascodigoparada: TIntegerField;
    qryAnaliseParadas_Setores_x_Paradasdescricaoparada: TStringField;
    qryAnaliseParadas_Setores_x_Paradastempoparada: TLargeintField;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;

    function AbrirConsulta(DataInicial, DataFinal, ListaMaquinas, ListaSetores, ListaParadas: String; Tipo: integer): boolean;
    procedure ExportarExcell;
  end;

var
  dtmAnaliseParadasMaquinasSetores: TdtmAnaliseParadasMaquinasSetores;

implementation

{$R *.dfm}

{ TdtmAnaliseParadasMaquinasSetores }

function TdtmAnaliseParadasMaquinasSetores.AbrirConsulta(DataInicial, DataFinal,
  ListaMaquinas, ListaSetores, ListaParadas: String;  Tipo: integer): boolean;

begin
  result := true;

  if result then
  begin
    if (DataInicial<>'') and (DataFinal<>'') then
    begin
      qryAnaliseParadas_Maquinas_x_Paradas.MacroByName('FiltroPeriodo').AsString := 'and oou.data between :datainicial and :datafinal';
      qryAnaliseParadas_Maquinas_x_Paradas.parambyname('datainicial').asdatetime := StrToDateTime(datainicial);
      qryAnaliseParadas_Maquinas_x_Paradas.parambyname('datafinal').asdatetime := StrToDateTime(DataFinal);
    end
    else
    if (DataInicial<>'') and (DataFinal='') then
    begin
      qryAnaliseParadas_Maquinas_x_Paradas.MacroByName('FiltroPeriodo').AsString := 'and oou.data >= :datainicial';
      qryAnaliseParadas_Maquinas_x_Paradas.parambyname('datainicial').asdatetime := StrToDateTime(datainicial);
      qryAnaliseParadas_Maquinas_x_Paradas.parambyname('datafinal').clear;
    end
    else
    if (DataInicial='') and (DataFinal<>'') then
    begin
      qryAnaliseParadas_Maquinas_x_Paradas.MacroByName('FiltroPeriodo').AsString := 'and oou.data <= :datafinal';
      qryAnaliseParadas_Maquinas_x_Paradas.parambyname('datainicial').clear;
      qryAnaliseParadas_Maquinas_x_Paradas.parambyname('datafinal').asdatetime := StrToDateTime(DataFinal);
    end
    else
    if (DataInicial='') and (DataFinal='') then
    begin
      qryAnaliseParadas_Maquinas_x_Paradas.MacroByName('FiltroPeriodo').AsString := '';
      qryAnaliseParadas_Maquinas_x_Paradas.parambyname('datainicial').clear;
      qryAnaliseParadas_Maquinas_x_Paradas.parambyname('datafinal').clear;
    end;

    if ListaMaquinas <> '' then
      qryAnaliseParadas_Maquinas_x_Paradas.MacroByName('FiltroMaquinas').AsString := 'and oou.maquina in ('+ListaMaquinas+')'
    else
      qryAnaliseParadas_Maquinas_x_Paradas.MacroByName('FiltroMaquinas').AsString := '';

    if ListaSetores <> '' then
      qryAnaliseParadas_Maquinas_x_Paradas.MacroByName('FiltroSetores').AsString := 'and m.setorproducao in ('+ListaSetores+')'
    else
      qryAnaliseParadas_Maquinas_x_Paradas.MacroByName('FiltroSetores').AsString := '';

    if ListaParadas <> '' then
      qryAnaliseParadas_Maquinas_x_Paradas.MacroByName('FiltroParadas').AsString := 'and ooup.codigoparada in ('+ListaParadas+')'
    else
      qryAnaliseParadas_Maquinas_x_Paradas.MacroByName('FiltroParadas').AsString := '';

    case tipo of
    0: begin
        qryAnaliseParadas_Maquinas_x_Paradas.Close;
        qryAnaliseParadas_Maquinas_x_Paradas.Open;
        dsrAnaliseParadas.DataSet := qryAnaliseParadas_Maquinas_x_Paradas;
        ExcelExport1.DataSet := qryAnaliseParadas_Maquinas_x_Paradas;
        ExcelExport1.WorksheetName := 'AnaliseParadas_Maquinas';

       end;
    1: begin
         qryAnaliseParadas_Setores_x_Paradas.Params := qryAnaliseParadas_Maquinas_x_Paradas.Params;
         qryAnaliseParadas_Setores_x_Paradas.Macros := qryAnaliseParadas_Maquinas_x_Paradas.Macros;
         qryAnaliseParadas_Setores_x_Paradas.close;
         qryAnaliseParadas_Setores_x_Paradas.open;
         dsrAnaliseParadas.DataSet := qryAnaliseParadas_Setores_x_Paradas;
         ExcelExport1.DataSet := qryAnaliseParadas_Setores_x_Paradas;
         ExcelExport1.WorksheetName := 'AnaliseParadas_Setores';
       end;
    end;

    if (qryAnaliseParadas_Maquinas_x_Paradas.IsEmpty and (tipo = 0)) or (qryAnaliseParadas_Setores_x_Paradas.IsEmpty and (tipo = 1))  then
    begin
      result := false;
      MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
    end
    else
      result := true
  end;
end;

constructor TdtmAnaliseParadasMaquinasSetores.Create(Aowner: Tcomponent);
begin
  inherited;
end;

procedure TdtmAnaliseParadasMaquinasSetores.ExportarExcell;
begin
{
  GuardarRegistroAtual(qryAnaliseParadasMaquinasSetores,true);
  ExcelExport1.ExportDataset;
  VoltarRegistroAtual(qryAnaliseParadasMaquinasSetores);
  }

  GuardarRegistroAtual(TTecQuery(dsrAnaliseParadas.dataset),true);
  ExcelExport1.ExportDataset;
  VoltarRegistroAtual(TTecQuery(dsrAnaliseParadas.dataset));

end;


end.
