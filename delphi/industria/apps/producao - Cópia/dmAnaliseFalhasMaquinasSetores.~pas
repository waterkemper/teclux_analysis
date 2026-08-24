unit dmAnaliseFalhasMaquinasSetores;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, dmtecsoft, biblio, ctconstantes, ExcelExport, ZTransact;

type
  TdtmAnaliseFalhasMaquinasSetores = class(TdtmBasico)
    qryAnaliseFalhas_Maquinas_x_Falhas: TtecQuery;
    dsrAnaliseFalhas: TtecDataSource;
    ExcelExport1: TExcelExport;
    qryAnaliseFalhas_Setores_x_Falhas: TtecQuery;
    qryAnaliseFalhas_Maquinas_x_Falhassetorproducao: TStringField;
    qryAnaliseFalhas_Maquinas_x_Falhasmaquina: TIntegerField;
    qryAnaliseFalhas_Maquinas_x_Falhasdescricaomaquina: TStringField;
    qryAnaliseFalhas_Maquinas_x_Falhasfalha: TIntegerField;
    qryAnaliseFalhas_Maquinas_x_Falhasdescricaofalha: TStringField;
    qryAnaliseFalhas_Maquinas_x_Falhasquantidade: TLargeintField;
    qryAnaliseFalhas_Maquinas_x_Falhastotalcusto: TFloatField;
    qryAnaliseFalhas_Maquinas_x_Falhastipofalha: TStringField;
    qryAnaliseFalhas_Setores_x_Falhassetorproducao: TStringField;
    qryAnaliseFalhas_Setores_x_Falhasfalha: TIntegerField;
    qryAnaliseFalhas_Setores_x_Falhasdescricaofalha: TStringField;
    qryAnaliseFalhas_Setores_x_Falhasquantidade: TLargeintField;
    qryAnaliseFalhas_Setores_x_Falhastotalcusto: TFloatField;
    qryAnaliseFalhas_Setores_x_Falhastipofalha: TStringField;
    qryAnaliseFalhas_Setores_x_Falhasdescricaosetor: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;

    function AbrirConsulta(DataInicial, DataFinal, ListaMaquinas, ListaSetores, ListaFalhas: String; Tipo: integer): boolean;
    procedure ExportarExcell;
  end;

var
  dtmAnaliseFalhasMaquinasSetores: TdtmAnaliseFalhasMaquinasSetores;

implementation

{$R *.dfm}

{ TdtmAnaliseFalhasMaquinasSetores }

function TdtmAnaliseFalhasMaquinasSetores.AbrirConsulta(DataInicial, DataFinal,
  ListaMaquinas, ListaSetores, ListaFalhas: String;  Tipo: integer): boolean;

begin
  result := true;

  if result then
  begin
    if (DataInicial<>'') and (DataFinal<>'') then
    begin
      qryAnaliseFalhas_Maquinas_x_Falhas.MacroByName('FiltroPeriodo').AsString := 'and oou.data between :datainicial and :datafinal';
      qryAnaliseFalhas_Maquinas_x_Falhas.parambyname('datainicial').asdatetime := StrToDateTime(datainicial);
      qryAnaliseFalhas_Maquinas_x_Falhas.parambyname('datafinal').asdatetime := StrToDateTime(DataFinal);
    end
    else
    if (DataInicial<>'') and (DataFinal='') then
    begin
      qryAnaliseFalhas_Maquinas_x_Falhas.MacroByName('FiltroPeriodo').AsString := 'and oou.data >= :datainicial';
      qryAnaliseFalhas_Maquinas_x_Falhas.parambyname('datainicial').asdatetime := StrToDateTime(datainicial);
      qryAnaliseFalhas_Maquinas_x_Falhas.parambyname('datafinal').clear;
    end
    else
    if (DataInicial='') and (DataFinal<>'') then
    begin
      qryAnaliseFalhas_Maquinas_x_Falhas.MacroByName('FiltroPeriodo').AsString := 'and oou.data <= :datafinal';
      qryAnaliseFalhas_Maquinas_x_Falhas.parambyname('datainicial').clear;
      qryAnaliseFalhas_Maquinas_x_Falhas.parambyname('datafinal').asdatetime := StrToDateTime(DataFinal);
    end
    else
    if (DataInicial='') and (DataFinal='') then
    begin
      qryAnaliseFalhas_Maquinas_x_Falhas.MacroByName('FiltroPeriodo').AsString := '';
      qryAnaliseFalhas_Maquinas_x_Falhas.parambyname('datainicial').clear;
      qryAnaliseFalhas_Maquinas_x_Falhas.parambyname('datafinal').clear;
    end;

    if ListaMaquinas <> '' then
      qryAnaliseFalhas_Maquinas_x_Falhas.MacroByName('FiltroMaquinas').AsString := 'and oou.maquina in ('+ListaMaquinas+')'
    else
      qryAnaliseFalhas_Maquinas_x_Falhas.MacroByName('FiltroMaquinas').AsString := '';

    if ListaSetores <> '' then
      qryAnaliseFalhas_Maquinas_x_Falhas.MacroByName('FiltroSetores').AsString := 'and m.setorproducao in ('+ListaSetores+')'
    else
      qryAnaliseFalhas_Maquinas_x_Falhas.MacroByName('FiltroSetores').AsString := '';

    if ListaFalhas <> '' then
      qryAnaliseFalhas_Maquinas_x_Falhas.MacroByName('FiltroFalhas').AsString := 'and oouf.falha in ('+ListaFalhas+')'
    else
      qryAnaliseFalhas_Maquinas_x_Falhas.MacroByName('FiltroFalhas').AsString := '';

    case tipo of
    0: begin
        qryAnaliseFalhas_Maquinas_x_Falhas.Close;
        qryAnaliseFalhas_Maquinas_x_Falhas.Open;
        dsrAnaliseFalhas.DataSet := qryAnaliseFalhas_Maquinas_x_Falhas;
        ExcelExport1.DataSet := qryAnaliseFalhas_Maquinas_x_Falhas;
        ExcelExport1.WorksheetName := 'AnaliseFalhas_Maquinas_x_Falhas';

       end;
    1: begin
         qryAnaliseFalhas_Setores_x_Falhas.Params := qryAnaliseFalhas_Maquinas_x_Falhas.Params;
         qryAnaliseFalhas_Setores_x_Falhas.Macros := qryAnaliseFalhas_Maquinas_x_Falhas.Macros;
         qryAnaliseFalhas_Setores_x_Falhas.close;
         qryAnaliseFalhas_Setores_x_Falhas.open;
         dsrAnaliseFalhas.DataSet := qryAnaliseFalhas_Setores_x_Falhas;
         ExcelExport1.DataSet := qryAnaliseFalhas_Setores_x_Falhas;
         ExcelExport1.WorksheetName := 'AnaliseFalhas_Setores_x_Falhas';
       end;
    end;

    if (qryAnaliseFalhas_Maquinas_x_Falhas.IsEmpty and (tipo = 0)) or (qryAnaliseFalhas_Setores_x_Falhas.IsEmpty and (tipo = 1))  then
    begin
      result := false;
      MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
    end
    else
      result := true
  end;
end;

constructor TdtmAnaliseFalhasMaquinasSetores.Create(Aowner: Tcomponent);
begin
  inherited;
end;

procedure TdtmAnaliseFalhasMaquinasSetores.ExportarExcell;
begin
{
  GuardarRegistroAtual(qryAnaliseFalhasMaquinasSetores,true);
  ExcelExport1.ExportDataset;
  VoltarRegistroAtual(qryAnaliseFalhasMaquinasSetores);
  }

  GuardarRegistroAtual(TTecQuery(dsrAnaliseFalhas.dataset),true);
  ExcelExport1.ExportDataset;
  VoltarRegistroAtual(TTecQuery(dsrAnaliseFalhas.dataset));

end;


end.
