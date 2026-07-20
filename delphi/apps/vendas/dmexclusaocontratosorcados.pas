unit dmexclusaocontratosorcados;

interface

uses
  SysUtils, Classes, DB,
  // Constantes
  ctconstantes, biblio,
  // Componentes
  cpquery, cpdatasource,
  // Terceiros
  ZQuery, ZPgSqlQuery,
  // Repositorio
  dmbasico, dmtecsoft, dmcancelamentocontratosaberto;

type
  TdtmExclusaoContratosOrcados = class(TdtmCancelamentoContratosAberto)
    qryFalsoCascade: TtecQuery;
  public
    procedure ExcluirOrcados;
    procedure FalsoCascade;
  end;

var
  dtmExclusaoContratosOrcados: TdtmExclusaoContratosOrcados;

implementation

{$R *.dfm}

procedure TdtmExclusaoContratosOrcados.ExcluirOrcados;
begin
  qryContratos.DisableControls;
  try
    qryContratos.First;
    while not qryContratos.Eof do
    begin
      if  (qryContratosdata.AsDateTime <= LimiteData)
      and (qryContratosselecionar.AsBoolean) then
      begin
        FalsoCascade;
        qryContratos.Delete;
      end;
      qryContratos.Next;
    end;
  finally
    Perpetrar([qryContratos]);
    qryContratos.EnableControls;
  end;
end;

procedure TdtmExclusaoContratosOrcados.FalsoCascade;

  function Completar(S: String): String;
  begin
    Result := S + StringOfchar(' ', 20 - Length(S));
  end;

const
  From: Array[0..2] of String = ('parcelas','produtoscontratos','venctoscontratos');
var
  cnt: Integer;
begin
  qryFalsoCascade.Params[0].AsString := Completar(qryContratosnumero.AsString);
  for cnt := 0 to High(From) do
  begin
    qryFalsoCascade.Sql[1] := From[cnt];
    qryFalsoCascade.ExecSql;
  end;
end;

end.
