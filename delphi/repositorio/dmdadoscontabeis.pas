unit dmdadoscontabeis;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource;

type
  TdtmDadosContabeis = class(TDtmBasico)
    qryConsultaConta: TtecQuery;
    qryConsultaContadescricaoedentada: TStringField;
    qryConsultaContadescricao: TStringField;
    qryConsultaContaclassificacao: TStringField;
    qryConsultaContacodigo: TIntegerField;
    qryConsultaContatipo: TStringField;
    qryProcuraDebitar: TtecQuery;
    qryProcuraDebitarcodigo: TIntegerField;
    qryProcuraDebitarclassificacao: TStringField;
    qryProcuraDebitardescricao: TStringField;
    qryProcuraDebitartipo: TStringField;
    dsrProcuraDebitar: TtecDataSource;
    dsrProcuraCreditar: TtecDataSource;
    qryProcuraCreditar: TtecQuery;
    qryProcuraCreditarcodigo: TIntegerField;
    qryProcuraCreditarclassificacao: TStringField;
    qryProcuraCreditardescricao: TStringField;
    qryProcuraCreditartipo: TStringField;
  private
    FTipoContaContabilConsultaSelecionavel: String;
    FTipoContaContabilDebitoSelecionavel: String;
    procedure SetTipoContaContabilConsultaSelecionavel(
      const Value: String);
    procedure SetTipoContaContabilDebitoSelecionavel(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property TipoContaContabilConsultaSelecionavel: String read FTipoContaContabilConsultaSelecionavel write SetTipoContaContabilConsultaSelecionavel;
    property TipoContaContabilDebitoSelecionavel: String read FTipoContaContabilDebitoSelecionavel write SetTipoContaContabilDebitoSelecionavel;
  end;

var
  dtmDadosContabeis: TdtmDadosContabeis;

implementation

{$R *.dfm}

{ TdtmDadosContabeis }

procedure TdtmDadosContabeis.SetTipoContaContabilConsultaSelecionavel(
  const Value: String);
const
  SQLListatipo = 'and tipo = %s';
begin
  FTipoContaContabilConsultaSelecionavel := Value;
  if value<>'' then
  begin
    qryConsultaConta.macrobyname('SQLListatipo').AsString := format(SQLListatipo,[quotedstr(FTipoContaContabilConsultaSelecionavel)]);
    qryconsultaconta.FieldByName('descricaoedentada').Visible := false;
    qryconsultaconta.FieldByName('descricao').Visible := true;
    qryConsultaConta.sql[qryConsultaConta.sql.Count-1] := 'order by UPPER(TO_ASCII(Descricao,''LATIN1'')), classificacao';
  end
  else
  begin
    qryConsultaConta.macrobyname('SQLListatipo').AsString := '';
    qryconsultaconta.FieldByName('descricaoedentada').Visible := true;
    qryconsultaconta.FieldByName('descricao').Visible := false;
    qryConsultaConta.sql[qryConsultaConta.sql.Count-1] := 'order by classificacao, UPPER(TO_ASCII(Descricao,''LATIN1'')), codigo';
  end;
end;

procedure TdtmDadosContabeis.SetTipoContaContabilDebitoSelecionavel(
  const Value: String);
const
  SQLListatipo = 'and tipo = %s';
begin
  FTipoContaContabilDebitoSelecionavel := Value;
  if value<>'' then
    qryProcuraDebitar.macrobyname('SQLListatipo').AsString := format(SQLListatipo,[quotedstr(FTipoContaContabilDebitoSelecionavel)])
  else
    qryProcuraDebitar.macrobyname('SQLListatipo').AsString := '';
end;

end.
