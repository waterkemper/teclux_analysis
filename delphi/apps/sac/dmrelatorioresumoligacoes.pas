unit dmrelatorioresumoligacoes;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  dmbasico, FR_Class, FR_DSet, FR_DBSet, DB, cpdatasource, ZQuery,
  ZPgSqlQuery, cpquery, dmtecsoft, ctconstantes;

type
  TdtmRelatorioResumoLigacoes = class(TdtmBasico)
    qryResumoLigacoes: TtecQuery;
    dsrResumoLigacoes: TtecDataSource;
    qryResumoLigacoesTotais: TtecQuery;
    dsrResumoLigacoesTotais: TtecDataSource;
    frDBResumoLigacoes: TfrDBDataSet;
    frResumoLigacoes: TfrReport;
    qryFiltroSac: TtecQuery;
    dsrFiltroSac: TtecDataSource;
    qryConsultaFiltroSac: TtecQuery;
    dsrConsultaFiltroSac: TtecDataSource;
    qryConsultaFiltroSacdescricao: TStringField;
    qryConsultaFiltroSacnumero: TIntegerField;
    qryFiltroSacnumero: TIntegerField;
    qryFiltroSacdescricao: TStringField;
    qryResumoLigacoesTotaissomatotal_a: TIntegerField;
    qryResumoLigacoesTotaissomatotal_r: TIntegerField;
    qryResumoLigacoesTotaissomatotal_c: TIntegerField;
    qryResumoLigacoesTotaissomatotal_d: TIntegerField;
    qryResumoLigacoesTotaistotal: TIntegerField;
    qryResumoLigacoesoperador: TIntegerField;
    qryResumoLigacoesnome: TStringField;
    qryResumoLigacoessoma_a: TIntegerField;
    qryResumoLigacoessoma_r: TIntegerField;
    qryResumoLigacoessoma_c: TIntegerField;
    qryResumoLigacoessoma_d: TIntegerField;
    qryResumoLigacoestotal: TIntegerField;
  private
    function GetConsultaFiltroSac: TtecQuery;
  public
    constructor Create(AOwner: TComponent); override;
    function  ExisteFiltroSac(campo, codigo: string): boolean;
    procedure FiltroSac(comFiltroSac:boolean;FiltroSac:string);
    procedure Periodo(comPeriodo:boolean;periodoinicial,periodofinal:string);
    procedure RefazConsultaFiltro;
    property  ConsultaFiltroSac   : TtecQuery read GetConsultaFiltroSac;
  end;

{var
  dtmRelatorioAtendimento: TdtmRelatorioAtendimento;}

implementation

{$R *.dfm}

{ TdtmRelatorioAtendimento }

constructor TdtmRelatorioResumoLigacoes.Create(AOwner: TComponent);
begin
  inherited;
  qryFiltroSac.Tag              := ctRelatorioResumoLigacoes;
  qryConsultaFiltroSac.Tag      := ctRelatorioResumoLigacoesConsulta;
  qryResumoLigacoes.Tag         := ctRelatorioResumoLigacoesRelatorio;
  qryResumoLigacoesTotais.Tag   := ctRelatorioResumoLigacoesRelatorio;
end;

function TdtmRelatorioResumoLigacoes.ExisteFiltroSac(campo,
  codigo: string): boolean;
begin
  Result := ExisteCodigo(qryConsultaFiltroSac, campo, codigo);
end;

procedure TdtmRelatorioResumoLigacoes.FiltroSac(comFiltroSac: boolean;
  FiltroSac: string);
begin
  if comFiltroSac then begin
    qryResumoLigacoes.Sql[10]:=' and (ligacoes.filtrosac = '+FiltroSac+') ';
    qryResumoLigacoesTotais.Sql[9]:=' and (ligacoes.filtrosac = '+FiltroSac+') ';
  end else begin
    qryResumoLigacoes.Sql[10]:=' ';
    qryResumoLigacoesTotais.Sql[9]:=' ';
  end;
end;

function TdtmRelatorioResumoLigacoes.GetConsultaFiltroSac: TtecQuery;
begin
  Result := qryConsultaFiltroSac
end;

procedure TdtmRelatorioResumoLigacoes.Periodo(comPeriodo:boolean; periodoinicial,
  periodofinal: string);
begin
  if comPeriodo then begin
    periodofinal := DatetoStr(StrTodate(periodofinal)+1);
    qryResumoLigacoes.Sql[9]:='and (datahora >= '''+periodoinicial+''') and (datahora <= '''+periodofinal+''')';
    qryResumoLigacoesTotais.Sql[8]:='and (datahora >= '''+periodoinicial+''') and (datahora <= '''+periodofinal+''')';
  end else begin
    qryResumoLigacoes.Sql[9]:='';
    qryResumoLigacoesTotais.Sql[8]:='';
  end;
end;

procedure TdtmRelatorioResumoLigacoes.RefazConsultaFiltro;
begin
  RefazConsulta(qryFiltroSac ,[0] ,[qryConsultaFiltroSacnumero.AsVariant]);
end;

end.
