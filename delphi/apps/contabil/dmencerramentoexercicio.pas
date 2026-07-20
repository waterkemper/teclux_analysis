unit dmencerramentoexercicio;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery, variants,
  ZTransact;

type
  TdtmEncerramentoExercicio = class(TdtmBasico)
    qryGerarLancamentosEncerramento: TtecQuery;
    qryExcluirLancamentosEncerramento: TtecQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GerarLancamentos(filial: integer; data: TDateTime;
                                 ContaResultadoSintetica, ContaResultadoAnalitica, Historico : integer);

    procedure ExcluirLancamentos(filial: integer; data: TDateTime);


  end;

var
  dtmEncerramentoExercicio: TdtmEncerramentoExercicio;

implementation

{$R *.dfm}

{ TdtmEncerramentoExercicio }

procedure TdtmEncerramentoExercicio.ExcluirLancamentos(Filial: integer; Data: TDateTime);
begin
   qryExcluirLancamentosEncerramento.ParamByName('filial').AsInteger  := Filial;
   qryExcluirLancamentosEncerramento.ParamByName('data').  Asdatetime := Data;
   qryExcluirLancamentosEncerramento.ExecSql;
end;


procedure TdtmEncerramentoExercicio.GerarLancamentos(Filial: integer;
                                                     Data: TDateTime;
                                                     ContaResultadoSintetica,
                                                     ContaResultadoAnalitica,
                                                     Historico: integer);
begin
  qryGerarLancamentosEncerramento.ParamByName('filial').AsInteger := filial;
  qryGerarLancamentosEncerramento.ParamByName('data').Asdatetime := data;
  qryGerarLancamentosEncerramento.ParamByName('ResultadoSintetica').AsInteger := ContaResultadoSintetica;
  qryGerarLancamentosEncerramento.ParamByName('ResultadoAnalitica').AsInteger := ContaResultadoAnalitica;
  if Historico<>0 then
    qryGerarLancamentosEncerramento.ParamByName('Historico').asinteger := Historico
  else
    qryGerarLancamentosEncerramento.ParamByName('Historico').value := null;
  qryGerarLancamentosEncerramento.ExecSql;
end;

end.
