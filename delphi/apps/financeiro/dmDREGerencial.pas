unit dmDREGerencial;

interface

uses
  SysUtils, Classes, dmTecSoft, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, dmbasico;

type
  TdtmDREGerencial = class(TdtmBasico)
    dsrDREGerencial: TtecDataSource;
    qryDREGerencial: TtecQuery;
    qryDREGerencial_Aux: TtecQuery;
    procedure qryDREGerencialAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AbrirConsulta(
          DataInicial, DataFinal: String);

  end;

var
  dtmDREGerencial: TdtmDREGerencial;

implementation

{$R *.dfm}

{ TdtmDREGerencial }

procedure TdtmDREGerencial.AbrirConsulta(DataInicial, DataFinal: String);
begin

  qryDREGerencial.Sql.Text := qryDREGerencial_Aux.Sql.Text;
  
  qryDREGerencial.Sql.Text :=
    StringReplace(qryDREGerencial.Sql.Text, ':Data_Inicial',


             FormatDateTime('yyyy-MM-DD', strtoDate(DAtainicial))
             , [rfReplaceAll]);

  qryDREGerencial.Sql.Text :=
    StringReplace(qryDREGerencial.Sql.Text, ':Data_Final', FormatDateTime('yyyy-MM-DD', strtoDate(DAtaFinal)), [rfReplaceAll]);

  qryDREGerencial.open;

end;

procedure TdtmDREGerencial.qryDREGerencialAfterOpen(DataSet: TDataSet);
begin
  inherited;
//  qryDREGerencial.FieldByName('descricao').DisplayLabel := 'CONTA'
end;

end.
