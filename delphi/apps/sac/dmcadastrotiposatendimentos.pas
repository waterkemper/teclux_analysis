unit dmcadastrotiposatendimentos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms,
  Dialogs, DB,
  // Terceiros
  ZQuery,
  // Repositorio
  dmbasico, dmtecsoft,
  // Constantes
  ctConstantes, biblio,
  // Componentes
  cpdatasource, cpquery, ZPgSqlQuery, ZTransact;

type
  TdtmCadastroTiposAtendimentos = class(TdtmBasico)
    qryTiposAtendimentos: TtecQuery;
    qryTiposAtendimentoscodigo: TIntegerField;
    qryTiposAtendimentosdescricao: TStringField;
    qryTiposAtendimentostipo: TStringField;
    dsrTiposAtendimentos: TtecDataSource;
    qryConsultaTiposAtendimentos: TtecQuery;
    qryConsultaTiposAtendimentosdescricao: TStringField;
    qryConsultaTiposAtendimentoscodigo: TIntegerField;
    qryConsultaTiposAtendimentostipo: TStringField;
    dsrConsultaTiposAtendimentos: TtecDataSource;
    qryTiposAtendimentosProximoCodigo: TtecQuery;
    qryTiposAtendimentosProximoCodigocodigo: TIntegerField;
    procedure qryTiposAtendimentosNewRecord(DataSet: TDataSet);
  protected
    function GetConsultaTiposAtendimentos: TtecQuery;
    function GetTabelaCadastroTiposAtendimentos: TtecQuery;
  public
    function  ExcluirTiposAtendimentos: Boolean;
    function  ExisteCadastroTiposAtendimentos(campo, codigo: string): boolean;
    function  GravarTiposAtendimentos: Boolean;
    function  IncluirTiposAtendimentos: Boolean;
    procedure RefazConsultaTiposAtendimentos;

    constructor Create(AOwner: TComponent); override;
    property  ConsultaTiposAtendimentos  : TtecQuery read GetConsultaTiposAtendimentos;
    property  TabelaCadastroTiposAtendimentos: TtecQuery read GetTabelaCadastroTiposAtendimentos;
  end;

var
  dtmCadastroTiposAtendimentos: TdtmCadastroTiposAtendimentos;

implementation

{$R *.dfm}

{ TdtmCadastroTiposAtendimentos }

constructor TdtmCadastroTiposAtendimentos.Create(AOwner: TComponent);
begin
  inherited;
  qryTiposAtendimentos.Tag    := ctCadastroTiposAtendimentos;
  qryConsultaTiposAtendimentos.Tag    := ctConsultaTiposAtendimentos;
end;

function TdtmCadastroTiposAtendimentos.ExcluirTiposAtendimentos: Boolean;
begin
  Result := False;
  if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o TIPO DE ATENDIMENTO'])) = smbOk then begin
    qryTiposAtendimentos.Delete;
    Perpetrar([qryTiposAtendimentos]);
    Result := True;
  end;
end;

function TdtmCadastroTiposAtendimentos.ExisteCadastroTiposAtendimentos(campo, codigo: string): boolean;
begin
  Result := ExisteCodigo(qryConsultaTiposAtendimentos, campo, codigo);
end;

function TdtmCadastroTiposAtendimentos.GetConsultaTiposAtendimentos: TtecQuery;
begin
  Result := qryConsultaTiposAtendimentos;
end;

function TdtmCadastroTiposAtendimentos.GetTabelaCadastroTiposAtendimentos: TtecQuery;
begin
  Result:= qryTiposAtendimentos;
end;

function TdtmCadastroTiposAtendimentos.GravarTiposAtendimentos: Boolean;
begin
  Result:= False;
  if qryTiposAtendimentos.CheckRequiredFields then begin

    if qryTiposAtendimentos.State in [dsInsert] then begin
      qryTiposAtendimentosProximoCodigo.Open;
      qryTiposAtendimentoscodigo.AsInteger := qryTiposAtendimentosProximoCodigocodigo.AsInteger;
      qryTiposAtendimentosProximoCodigo.Close;
    end;
    qryTiposAtendimentos.Post;
    Perpetrar([qryTiposAtendimentos]);
    Result := True;
  end;
end;

function TdtmCadastroTiposAtendimentos.IncluirTiposAtendimentos: Boolean;
begin
  qryTiposAtendimentos.Insert;
  Result := True;
end;

procedure TdtmCadastroTiposAtendimentos.RefazConsultaTiposAtendimentos;
begin
  RefazConsulta(qryTiposAtendimentos, [0],[qryConsultaTiposAtendimentoscodigo.AsInteger]);
end;

procedure TdtmCadastroTiposAtendimentos.qryTiposAtendimentosNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryTiposAtendimentostipo.AsString:='C';
end;

end.
