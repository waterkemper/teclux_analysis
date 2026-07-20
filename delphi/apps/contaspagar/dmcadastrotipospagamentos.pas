unit dmcadastrotipospagamentos;

interface

uses
  SysUtils, Classes, Forms, dmbasico, DB, ZQuery, ZPgSqlQuery, Math, cpquery,
  dmtecsoft, cpdatasource, ctconstantes, biblio, ZTransact;


type
  TdtmCadastroTiposPagamentos = class(Tdtmbasico)
    qryConsultaTipoPagamento: TtecQuery;
    qryConsultaTipoPagamentodescricao: TStringField;
    qryConsultaTipoPagamentocodigo: TIntegerField;
    spcTiposPagamentosProximoCodigo: TtecQuery;
    spcTiposPagamentosProximoCodigocodigo: TIntegerField;
    dsrTiposPagamentos: TtecDataSource;
    qryTiposPagamentos: TtecQuery;
    qryTiposPagamentoscodigo: TIntegerField;
    qryTiposPagamentosdescricao: TStringField;
    qryTiposPagamentossaidadocaixa: TBooleanField;
    procedure qryTiposPagamentosNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    function GetTabelaTiposPagamentos: TtecQuery;
    function GetConsultaTabelaTiposPagamentos: TtecQuery;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property TabelaTiposPagamentos: TtecQuery read GetTabelaTiposPagamentos;
    property ConsultaTabelaTiposPagamentos: TtecQuery read GetConsultaTabelaTiposPagamentos;
    function IncluirTiposPagamentos: Boolean;
    function GravarTiposPagamentos: Boolean;
    function ExcluirTiposPagamentos: Boolean;
    procedure PosicionarTabelaTiposPagamentos;
    function ExisteTabelaTipoPagamento(NomeCampo: String; Value: Variant): boolean;
  end;

var
  dtmCadastroTiposPagamentos: TdtmCadastroTiposPagamentos;

implementation

{$R *.dfm}

{ TdtmCadastroTiposPagamentos }

constructor TdtmCadastroTiposPagamentos.Create(AOwner: TComponent);
begin
  inherited;
  qryTiposPagamentos.Tag       := ctTabelas;
  qryConsultaTipoPagamento.Tag := ctConsultaTipoPagamento;
end;

function TdtmCadastroTiposPagamentos.GetTabelaTiposPagamentos: TtecQuery;
begin
   result := qryTiposPagamentos;
end;

function TdtmCadastroTiposPagamentos.IncluirTiposPagamentos: Boolean;
begin
  qryTiposPagamentos.append;
  result := true;
end;

function TdtmCadastroTiposPagamentos.GravarTiposPagamentos: Boolean;
begin
  result := false;
  if qryTiposPagamentos.CheckRequiredFields then
  begin
   if qryTiposPagamentos.State = dsinsert then
   begin
    RefazConsulta(spcTiposPagamentosProximoCodigo,[],[]);
    qryTiposPagamentoscodigo.Value:=spcTiposPagamentosProximoCodigocodigo.Value;
   end;
   qryTiposPagamentos.Post;
   Perpetrar([qryTiposPagamentos])
  end;
end;

function TdtmCadastroTiposPagamentos.ExcluirTiposPagamentos: Boolean;
begin
  result := false;
  if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o registro da TABELA DE TIPOS DE PAGAMENTOS'])) = smbOk then
  begin
    if not qryTiposPagamentos.IsEmpty then
      qryTiposPagamentos.delete
    else
      qryTiposPagamentos.Cancel;
    Perpetrar([qryTiposPagamentos]);
    Result:= True;
  end;
end;

procedure TdtmCadastroTiposPagamentos.PosicionarTabelaTiposPagamentos;
begin
  ReFazConsulta(qryTiposPagamentos, [0], [qryConsultaTipoPagamentocodigo.AsVariant]);
end;

function TdtmCadastroTiposPagamentos.GetConsultaTabelaTiposPagamentos: TtecQuery;
begin
  result := qryConsultaTipoPagamento;
end;

function TdtmCadastroTiposPagamentos.ExisteTabelaTipoPagamento(
  NomeCampo: String; Value: Variant): boolean;
begin
  result:=ExisteCodigo(qryConsultaTipoPagamento, NomeCampo, Value);
end;

procedure TdtmCadastroTiposPagamentos.qryTiposPagamentosNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryTiposPagamentossaidadocaixa.Value:=false;
end;

end.
