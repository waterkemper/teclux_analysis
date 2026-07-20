unit dmcadastroatividadeseconomicas;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery, dmtecsoft, cpdatasource,
  ctconstantes, biblio, ZTransact;

type
  TdtmCadastroAtividadesEconomicas = class(TdtmBasico)
    qryAtividadesEconomicas: TtecQuery;
    dsrAtividadesEconomicas: TtecDataSource;
    qryConsultaAtividadesEconomicas: TtecQuery;
    qryConsultaAtividadesEconomicasdescricao: TStringField;
    qryAtividadesEconomicasdescricao: TStringField;
    qryAtividadesEconomicasdenominacao: TStringField;
    qryConsultaAtividadesEconomicasdenominacao: TStringField;
    qryAtividadesEconomicascodigo: TIntegerField;
    qryConsultaAtividadesEconomicascodigo: TIntegerField;
    qryAtividadesEconomicascodigoatividade: TIntegerField;
    qryAtividadesEconomicasitem: TIntegerField;
    qryAtividadesEconomicassubitem: TIntegerField;
    qryConsultaAtividadesEconomicascodigoatividade: TIntegerField;
  protected
    function GetTabelaConsultaAtividadesEconomicas: TtecQuery;
    function GetTabelaAtividadesEconomicas: TtecQuery;
  public
    constructor Create(AOwner: TComponent); override;
    function  ExcluirAtividadeEconomica: Boolean;
    function  ExisteAtividadeEconomica(campo, codigo: string): boolean;
    function  GravarAtividadeEconomica: Boolean;
    function  IncluirAtividadeEconomica: Boolean;
    procedure RefazConsultaAtividadesEconomicas;
    property  TabelaAtividadesEconomicas : TtecQuery read GetTabelaAtividadesEconomicas;
    property  TabelaConsultaAtividadesEconomicas : TtecQuery read GetTabelaConsultaAtividadesEconomicas;
  end;

var
  dtmCadastroAtividadesEconomicas: TdtmCadastroAtividadesEconomicas;

implementation

{$R *.dfm}

{ TdtmCadastroCodigosFiscais }

constructor TdtmCadastroAtividadesEconomicas.Create(AOwner: TComponent);
begin
  inherited;
  qryAtividadesEconomicas.Tag         := ctTabelas;
  qryConsultaAtividadesEconomicas.Tag := ctConsultaAtividadesEconomicas;
end;

function TdtmCadastroAtividadesEconomicas.ExcluirAtividadeEconomica: Boolean;
begin
  qryAtividadesEconomicas.Delete;
  Perpetrar([qryAtividadesEconomicas]);
  Result := True;
end;

function TdtmCadastroAtividadesEconomicas.ExisteAtividadeEconomica(campo, codigo: string): boolean;
begin
  Result := ExisteCodigo(qryConsultaAtividadesEconomicas, campo, codigo);
end;


function TdtmCadastroAtividadesEconomicas.GetTabelaAtividadesEconomicas: TtecQuery;
begin
  Result := qryAtividadesEconomicas;
end;

function TdtmCadastroAtividadesEconomicas.GetTabelaConsultaAtividadesEconomicas: TtecQuery;
begin
  Result := qryConsultaAtividadesEconomicas
end;

function TdtmCadastroAtividadesEconomicas.GravarAtividadeEconomica: Boolean;
begin
  Result := False;
  if qryAtividadesEconomicas.CheckRequiredFields then
  begin
    qryAtividadesEconomicas.Post;
    Perpetrar([qryAtividadesEconomicas]);    Result := True;
  end
end;

function TdtmCadastroAtividadesEconomicas.IncluirAtividadeEconomica: Boolean;
begin
  qryAtividadesEconomicas.Insert;
  Result := True;
end;

procedure TdtmCadastroAtividadesEconomicas.RefazConsultaAtividadesEconomicas;
begin
  RefazConsulta(qryAtividadesEconomicas, [0], [qryConsultaAtividadesEconomicascodigo.AsInteger]);
end;

end.

