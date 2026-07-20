unit dmmaladireta;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  dmtecsoft, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery, cpdatasource,
  ctconstantes;

type
  TdtmMalaDireta = class(TdtmBasico)
    qryMontada: TtecQuery;
    dsrMontada: TtecDataSource;
    qryFiltro: TtecQuery;
    dsrFiltro: TtecDataSource;
    qryFiltrofiltro: TStringField;
    qryFiltrosql: TStringField;
    qryFiltrotabela: TStringField;
    qryFiltrotipopesquisa: TStringField;
    qryPesquisaFiltro: TtecQuery;
    dsrPesquisaFiltro: TtecDataSource;
    qryPesquisaFiltrosql: TStringField;
    qryPesquisaFiltrotabela: TStringField;
    qryPesquisaFiltrotipopesquisa: TStringField;
    qryMalaDireta: TtecQuery;
    dsrMalaDireta: TtecDataSource;
    qryConsultaMalaDireta: TtecQuery;
    dsrConsultaMalaDireta: TtecDataSource;
    qryMalaDiretanome: TStringField;
    qryMalaDiretafiltro: TStringField;
    qryMalaDiretadados: TStringField;
    qryConsultaMalaDiretanome: TStringField;
    qryPesquisaFiltrocampo: TStringField;
    qryFiltrocampo: TStringField;
  protected
    { Private declarations }
    function GetTabelaMalaDireta: TZDataSet;
    function GetConsultaMalaDireta: TtecQuery;
    function GetConsultaMalaDiretaNome:string;
    function GetNomeFiltro:string;
    function GetPrimeiroFiltro:boolean;
    function GetProximoFiltro:boolean;
    function GetPrimeiraLinha:boolean;
    function GetProximaLinha:boolean;
    function GetUltimaLinha:boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    function  ExcluirMalaDireta: Boolean;
    function  GravarMalaDireta:  Boolean;

    function  IncluirMalaDireta: Boolean;

    function  ExisteMalaDireta(campo, codigo: string): boolean;

    function  FiltroEof:boolean;
    function  GetMalaDiretaDados:string;
    function  GetMalaDiretaFiltro:string;
    function  GetMontadaField(field:integer):string;
    function  GetMontadaFieldCount:integer;
    function  GetTabela(filtro:string):string;
    function  GetTipoDeDado(filtro:string):string;
    function  SetMontadaSql(sql:string):boolean;
    procedure GetCampo(filtro: string;var campo,tabela:string);
    procedure GetSQL(filtro: string;var sql,tabela:string);
    procedure SetMalaDiretaFiltro(value:string);
    procedure SetMalaDiretaDados(value:string);
    procedure RefazConsultaMalaDireta;
    property  ConsultaMaladDireta : TtecQuery read GetConsultaMalaDireta;
    property  PrimeiroFiltro      : boolean   read GetPrimeiroFiltro;
    property  ProximoFiltro       : boolean   read GetProximoFiltro;
    property  PrimeiraLinha       : boolean   read GetPrimeiraLinha;
    property  ProximaLinha        : boolean   read GetProximaLinha;
    property  TabelaMalaDireta    : TZDataSet read GetTabelaMalaDireta;
    property  UltimaLinha         : boolean   read GetUltimaLinha;
    property  NomeFiltro          : string    read GetNomeFiltro;
  end;

{var
  dtmMalaDireta: TdtmMalaDireta;}

implementation

{$R *.dfm}

{ TdtmMalaDireta }

constructor TdtmMalaDireta.Create(AOwner: TComponent);
begin
  inherited;
  qryFiltro.Tag              := ctMalaDireta;
  qryMalaDireta.Tag          := ctMalaDireta;
  qryPesquisaFiltro.Tag      := ctMalaDireta;
  qryMontada.Tag             := ctMalaDiretaMontada;
  qryConsultaMalaDireta.Tag  := ctMalaDiretaConsulta;
end;

function TdtmMalaDireta.ExcluirMalaDireta: Boolean;
begin
  qryMalaDireta.Delete;
  Perpetrar([qryMalaDireta]);

  Result := True;

end;

function TdtmMalaDireta.ExisteMalaDireta(campo, codigo: string): boolean;
begin
  Result := ExisteCodigo(qryConsultaMalaDireta, campo, codigo);
end;

function TdtmMalaDireta.FiltroEof: boolean;
begin
  Result:=qryFiltro.eof;
end;

procedure TdtmMalaDireta.GetCampo(filtro: string; var campo,
  tabela: string);
begin
  RefazConsulta(qryPesquisaFiltro, [0], [filtro]);
  campo:=qryPesquisaFiltrocampo.AsString;
  tabela:=qryPesquisaFiltrotabela.AsString;
end;

function TdtmMalaDireta.GetConsultaMalaDireta: TtecQuery;
begin
  Result := qryConsultaMalaDireta
end;

function TdtmMalaDireta.GetConsultaMalaDiretaNome: string;
begin
  Result:= qryConsultaMalaDiretanome.AsString
end;

function TdtmMalaDireta.GetMalaDiretaDados: string;
begin
  Result:=qryMalaDiretadados.AsString
end;

function TdtmMalaDireta.GetMalaDiretaFiltro: string;
begin
  Result:=qryMalaDiretafiltro.AsString
end;

function TdtmMalaDireta.GetMontadaField(field: integer): string;
begin
  Result:=qryMontada.IndexFields[field].AsString
end;

function TdtmMalaDireta.GetMontadaFieldCount: integer;
begin
  Result:=qryMontada.IndexFieldCount;
end;

function TdtmMalaDireta.GetNomeFiltro: string;
begin
  Result:=qryFiltrofiltro.AsString
end;

function TdtmMalaDireta.GetPrimeiraLinha: boolean;
begin
  qryMontada.First;
  Result:=True;
end;

function TdtmMalaDireta.GetPrimeiroFiltro: boolean;
begin
  qryFiltro.First;
  Result:=True;
end;

function TdtmMalaDireta.GetProximaLinha: boolean;
begin
  qryMontada.Next;
  Result:=True;
end;

function TdtmMalaDireta.GetProximoFiltro: boolean;
begin
  qryFiltro.Next;
  Result:=True;
end;

procedure TdtmMalaDireta.GetSQL(filtro: string;var sql,tabela:string);
begin
  RefazConsulta(qryPesquisaFiltro, [0], [filtro]);
  sql:=qryPesquisaFiltrosql.AsString;
  tabela:=qryPesquisaFiltrotabela.AsString;
end;

function TdtmMalaDireta.GetTabela(filtro: string): string;
begin
  RefazConsulta(qryPesquisaFiltro, [0], [filtro]);
  Result:=qryPesquisaFiltrotabela.AsString;
end;

function TdtmMalaDireta.GetTabelaMalaDireta: TZDataSet;
begin
  Result:=qryMalaDireta
end;

function TdtmMalaDireta.GetTipoDeDado(filtro:string): string;
begin
  RefazConsulta(qryPesquisaFiltro, [0], [filtro]);
  Result:=qryPesquisaFiltrotipopesquisa.AsString;
end;

function TdtmMalaDireta.GetUltimaLinha: boolean;
begin
  Result:=qryMontada.Eof;
end;

function TdtmMalaDireta.GravarMalaDireta: Boolean;
begin
  Result := qryMalaDireta.CheckRequiredFields;
  if result then
  begin
   qryMalaDireta.Edit;
   qryMalaDireta.Post;
   Perpetrar([qryMalaDireta]);
  end;
end;

function TdtmMalaDireta.IncluirMalaDireta: Boolean;
begin
  qryMalaDireta.Insert;
  Result := True;

end;

procedure TdtmMalaDireta.RefazConsultaMalaDireta;
begin
  ReFazConsulta(qryMalaDireta, [0], [GetConsultaMalaDiretaNome]);
end;

procedure TdtmMalaDireta.SetMalaDiretaDados(value: string);
begin
  qryMalaDireta.Edit;
  qryMalaDiretadados.AsString:=value;
end;

procedure TdtmMalaDireta.SetMalaDiretaFiltro(value: string);
begin
  qryMalaDireta.Edit;
  qryMalaDiretafiltro.AsString:=value;
end;

function TdtmMalaDireta.SetMontadaSql(sql: string): boolean;
begin
  qryMontada.Sql.Text:=sql;
  Result:=True;
end;

end.
