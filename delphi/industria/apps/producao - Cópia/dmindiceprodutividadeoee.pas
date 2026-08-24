unit dmindiceprodutividadeoee;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, dmtecsoft, biblio, ctconstantes, ExcelExport, ZTransact;

type
  TdtmIndiceProdutividadeOEE = class(TdtmBasico)
    qryIndiceProdutividadeOEE_Maquina: TtecQuery;
    dsrIndiceProdutividadeOEE: TtecDataSource;
    ExcelExport1: TExcelExport;
    qryIndiceProdutividadeOEE_Maquinamaquina: TIntegerField;
    qryIndiceProdutividadeOEE_Maquinadescricaomaquina: TStringField;
    qryIndiceProdutividadeOEE_Maquinaito: TFloatField;
    qryIndiceProdutividadeOEE_Maquinaipa: TFloatField;
    qryIndiceProdutividadeOEE_Maquinaido: TFloatField;
    qryIndiceProdutividadeOEE_Maquinaoee: TFloatField;
    qryTurnos: TtecQuery;
    qryTurnosturno: TStringField;
    qryTurnosinicio: TTimeField;
    qryTurnosfim: TTimeField;
    dsrTurnos: TtecDataSource;
    qryTurnosselecionar: TBooleanField;
    qryIndiceProdutividadeOEE_Maquinaturno: TStringField;
    qryIndiceProdutividadeOEE_Maquinatcl: TIntegerField;
    qryIndiceProdutividadeOEE_MaquinaTTD: TIntegerField;
    qryIndiceProdutividadeOEE_MaquinaPP: TIntegerField;
    qryIndiceProdutividadeOEE_MaquinaPNP: TIntegerField;
    qryIndiceProdutividadeOEE_MaquinaTempo: TIntegerField;
    qryIndiceProdutividadeOEE_Setor: TtecQuery;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    qryIndiceProdutividadeOEE_SetorSetorProducao: TStringField;
    qryIndiceProdutividadeOEE_SetorDescricaoSetor: TStringField;
    qryIndiceProdutividadeOEE_MaquinaSETOR: TStringField;
    procedure qryTurnosAfterScroll(DataSet: TDataSet);
    procedure qryTurnosAfterInsert(DataSet: TDataSet);
    procedure qryTurnosAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;

    function AbrirConsulta(DataInicial, DataFinal, ListaMaquinas, ListaSetores: String; PorTurnos: Boolean; Tipo: integer): boolean;
    procedure ExportarExcell;
  end;

var
  dtmIndiceProdutividadeOEE: TdtmIndiceProdutividadeOEE;

implementation

{$R *.dfm}

{ TdtmIndiceProdutividadeOEE }

function TdtmIndiceProdutividadeOEE.AbrirConsulta(DataInicial, DataFinal,
  ListaMaquinas, ListaSetores: String;  PorTurnos: Boolean; Tipo: integer): boolean;

begin
  result := true;

  if PorTurnos then
  begin
    qryIndiceProdutividadeOEE_Maquina.ParamByName('ValorTCLSemana').AsInteger := 450;
    qryIndiceProdutividadeOEE_Maquina.ParamByName('ValorTCLSabado').AsInteger := 375;
    qryIndiceProdutividadeOEE_Maquina.ParamByName('ValorTCLDomingo').AsInteger := 90;

    qryTurnos.First;
    while not qryturnos.Eof do
    begin
      if (qryTurnosturno.AsString = 'M') then
      begin
        if  qryTurnosselecionar.AsBoolean then
          qryIndiceProdutividadeOEE_Maquina.MacroByName('TurnoM').AsString :=  'select cast(''M'' as char(1)) as turno, cast(''05:00:00'' as time) as inicio, cast(''13:30:00'' as time) as fim where true'
        else
          qryIndiceProdutividadeOEE_Maquina.MacroByName('TurnoM').AsString :=  'select cast(''M'' as char(1)) as turno, cast(''05:00:00'' as time) as inicio, cast(''13:30:00'' as time) as fim where false';
      end
      else
      if (qryTurnosturno.AsString = 'V') then
      begin
        if qryTurnosselecionar.AsBoolean then
          qryIndiceProdutividadeOEE_Maquina.MacroByName('TurnoV').AsString :=  'select cast(''V'' as char(1)) as turno, cast(''13:30:01'' as time) as inicio, cast(''22:00:00'' as time) as fim where true'
        else
          qryIndiceProdutividadeOEE_Maquina.MacroByName('TurnoV').AsString :=  'select cast(''V'' as char(1)) as turno, cast(''13:30:01'' as time) as inicio, cast(''22:00:00'' as time) as fim where false';
      end
      else
      if (qryTurnosturno.AsString = 'N') then
      begin
        if qryTurnosselecionar.AsBoolean then
        begin
          qryIndiceProdutividadeOEE_Maquina.MacroByName('TurnoN1').AsString :=  'select cast(''N'' as char(1)) as turno, cast(''22:00:01'' as time) as inicio, cast(''23:59:59'' as time) as fim where true';
          qryIndiceProdutividadeOEE_Maquina.MacroByName('TurnoN2').AsString :=  'select cast(''N'' as char(1)) as turno, cast(''00:00:00'' as time) as inicio, cast(''04:59:59'' as time) as fim where true'
        end
        else
        begin
          qryIndiceProdutividadeOEE_Maquina.MacroByName('TurnoN1').AsString :=  'select cast(''N'' as char(1)) as turno, cast(''22:00:01'' as time) as inicio, cast(''23:59:59'' as time) as fim where false';
          qryIndiceProdutividadeOEE_Maquina.MacroByName('TurnoN2').AsString :=  'select cast(''N'' as char(1)) as turno, cast(''00:00:00'' as time) as inicio, cast(''04:59:59'' as time) as fim where false'
        end
      end
      else
      if (qryTurnosturno.AsString = 'X') then
      begin
        if qryTurnosselecionar.AsBoolean then
        begin
          if (qryTurnosinicio.AsString = '') then
          begin
            result := false;
            qryTurnosinicio.FocusControl;
            MensagemErro('Informe o início do turno.');
            break;
          end
          else
          if (qryTurnosfim.AsString = '') then
          begin
            result := false;
            qryTurnosfim.FocusControl;
            MensagemErro('Informe o final do turno.');
            break;
          end
          else
            qryIndiceProdutividadeOEE_Maquina.MacroByName('TurnoX').AsString :=  'select cast(''X'' as char(1)) as turno, cast('''+qryTurnosinicio.AsString+''' as time) as inicio, cast('''+qryTurnosfim.AsString+''' as time) as fim where true'
        end
        else
          qryIndiceProdutividadeOEE_Maquina.MacroByName('TurnoX').AsString :=  'select cast(''X'' as char(1)) as turno, cast(''00:00:00'' as time) as inicio, cast(''00:00:00'' as time) as fim where false';
      end;
      qryTurnos.next;
    end;
  end
  else
  begin
    qryIndiceProdutividadeOEE_Maquina.ParamByName('ValorTCLSemana').AsInteger := 1350;
    qryIndiceProdutividadeOEE_Maquina.ParamByName('ValorTCLSabado').AsInteger := 750;
    qryIndiceProdutividadeOEE_Maquina.ParamByName('ValorTCLDomingo').AsInteger := 90;

    qryIndiceProdutividadeOEE_Maquina.MacroByName('TurnoM').AsString  :=  'select cast(''M'' as char(1)) as turno, cast(''05:00:00'' as time) as inicio, cast(''13:30:00'' as time) as fim where false';
    qryIndiceProdutividadeOEE_Maquina.MacroByName('TurnoV').AsString  :=  'select cast(''V'' as char(1)) as turno, cast(''13:30:01'' as time) as inicio, cast(''22:00:00'' as time) as fim where false';
    qryIndiceProdutividadeOEE_Maquina.MacroByName('TurnoN1').AsString :=  'select cast(''V'' as char(1)) as turno, cast(''22:00:01'' as time) as inicio, cast(''23:59:59'' as time) as fim where false';
    qryIndiceProdutividadeOEE_Maquina.MacroByName('TurnoN2').AsString :=  'select cast(''V'' as char(1)) as turno, cast(''00:00:00'' as time) as inicio, cast(''04:59:59'' as time) as fim where false';
    qryIndiceProdutividadeOEE_Maquina.MacroByName('TurnoX').AsString  :=  'select cast(''T'' as char(1)) as turno, cast(''00:00:00'' as time) as inicio, cast(''23:59:59'' as time) as fim where true';
  end;

  if result then
  begin
    if (DataInicial<>'') and (DataFinal<>'') then
    begin
      qryIndiceProdutividadeOEE_Maquina.MacroByName('FiltroPeriodo').AsString := 'and oou.data between :datainicial and :datafinal';
      qryIndiceProdutividadeOEE_Maquina.parambyname('datainicial').asdatetime := StrToDateTime(datainicial);
      qryIndiceProdutividadeOEE_Maquina.parambyname('datafinal').asdatetime := StrToDateTime(DataFinal);
    end
    else
    if (DataInicial<>'') and (DataFinal='') then
    begin
      qryIndiceProdutividadeOEE_Maquina.MacroByName('FiltroPeriodo').AsString := 'and oou.data >= :datainicial';
      qryIndiceProdutividadeOEE_Maquina.parambyname('datainicial').asdatetime := StrToDateTime(datainicial);
    end
    else
    if (DataInicial='') and (DataFinal<>'') then
    begin
      qryIndiceProdutividadeOEE_Maquina.MacroByName('FiltroPeriodo').AsString := 'and oou.data <= :datafinal';
      qryIndiceProdutividadeOEE_Maquina.parambyname('datafinal').asdatetime := StrToDateTime(DataFinal);
    end
    else
    if (DataInicial='') and (DataFinal='') then
      qryIndiceProdutividadeOEE_Maquina.MacroByName('FiltroPeriodo').AsString := '';

    if ListaMaquinas <> '' then
      qryIndiceProdutividadeOEE_Maquina.MacroByName('FiltroMaquinas').AsString := 'and oou.maquina in ('+ListaMaquinas+')'
    else
      qryIndiceProdutividadeOEE_Maquina.MacroByName('FiltroMaquinas').AsString := '';

    if ListaSetores <> '' then
      qryIndiceProdutividadeOEE_Maquina.MacroByName('FiltroSetores').AsString := 'and m.setorproducao in ('+ListaSetores+')'
    else
      qryIndiceProdutividadeOEE_Maquina.MacroByName('FiltroSetores').AsString := '';

    case tipo of
    0: begin
        qryIndiceProdutividadeOEE_Maquina.Close;
        qryIndiceProdutividadeOEE_Maquina.Open;
        dsrIndiceProdutividadeOEE.DataSet := qryIndiceProdutividadeOEE_Maquina;
        ExcelExport1.DataSet := qryIndiceProdutividadeOEE_Maquina;
        ExcelExport1.WorksheetName := 'Indice_Prod_por_Máquinas';

       end;
    1: begin
         qryIndiceProdutividadeOEE_Setor.Params := qryIndiceProdutividadeOEE_Maquina.Params;
         qryIndiceProdutividadeOEE_Setor.Macros := qryIndiceProdutividadeOEE_Maquina.Macros;
         qryIndiceProdutividadeOEE_Setor.close;
         qryIndiceProdutividadeOEE_Setor.open;
         dsrIndiceProdutividadeOEE.DataSet := qryIndiceProdutividadeOEE_Setor;
         ExcelExport1.DataSet := qryIndiceProdutividadeOEE_Setor;
         ExcelExport1.WorksheetName := 'Indice_Prod_por_Setores';
       end;
    end;

    if (qryIndiceProdutividadeOEE_Maquina.IsEmpty and (tipo = 0)) or (qryIndiceProdutividadeOEE_Setor.IsEmpty and (tipo = 1))  then
    begin
      result := false;
      MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
    end
    else
      result := true
  end;
end;

constructor TdtmIndiceProdutividadeOEE.Create(Aowner: Tcomponent);
begin
  inherited;
  qryTurnos.close;
  qryTurnos.Open;
end;

procedure TdtmIndiceProdutividadeOEE.ExportarExcell;
begin
{
  GuardarRegistroAtual(qryIndiceProdutividadeOEE,true);
  ExcelExport1.ExportDataset;
  VoltarRegistroAtual(qryIndiceProdutividadeOEE);
  }

  GuardarRegistroAtual(TTecQuery(dsrIndiceProdutividadeOEE.dataset),true);
  ExcelExport1.ExportDataset;
  VoltarRegistroAtual(TTecQuery(dsrIndiceProdutividadeOEE.dataset));

end;

procedure TdtmIndiceProdutividadeOEE.qryTurnosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if qryTurnosturno.AsString = 'X' then
  begin
    qryTurnosinicio.ReadOnly := false;
    qryTurnosfim.ReadOnly := false;
  end
  else
  begin
    qryTurnosinicio.ReadOnly := true;
    qryTurnosfim.ReadOnly := true;
  end;

end;

procedure TdtmIndiceProdutividadeOEE.qryTurnosAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryTurnos.Cancel;

end;

procedure TdtmIndiceProdutividadeOEE.qryTurnosAfterPost(DataSet: TDataSet);
var
  vTurno : String;
begin
  inherited;
  qryturnos.DisableControls;
  vTurno := qryTurnosturno.AsString;
  qryTurnos.AfterPost := nil;

  if (qryTurnosturno.AsString = 'X') then
  begin
    qryTurnos.First;
    while not qryTurnos.Eof do
    begin
      if qryTurnosturno.AsString <> 'X' then
      begin
        qryturnos.Edit;
        qryTurnosselecionar.AsBoolean := false;
        qryturnos.post;
      end;
      qryTurnos.next;
    end;
  end
  else
  begin
    if qryTurnosselecionar.AsBoolean then
    begin
      qryturnos.Locate('turno','X',[]);
      qryturnos.Edit;
      qryTurnosselecionar.AsBoolean := false;
      qryturnos.post;
    end;
  end;
  qryturnos.Locate('turno',vTurno,[]);
  qryTurnos.EnableControls;
  qryTurnos.AfterPost := qryTurnosAfterPost;
end;

end.
