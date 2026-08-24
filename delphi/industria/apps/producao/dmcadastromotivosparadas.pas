unit dmcadastroMotivosParadas;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, biblio, ctconstantes, Forms, ZTransact;

type
  TdtmCadastroMotivosParadas = class(TdtmBasico)
    dsrMotivosParadas: TtecDataSource;
    qryMotivosParadasProximo: TtecQuery;
    qryMotivosParadasProximocodigo: TIntegerField;
    qryMotivosParadas: TtecQuery;
    qryMotivosParadascodigo: TIntegerField;
    qryMotivosParadasdescricao: TStringField;
    qryRegistrodasOperacoes: TtecQuery;
    qryRegistrodasOperacoesusuarioinclusao: TStringField;
    qryRegistrodasOperacoesdatainclusao: TStringField;
    qryRegistrodasOperacoesusuarioalteracao: TStringField;
    qryRegistrodasOperacoesdataalteracao: TStringField;
    qryRegistrodasOperacoesoperacao: TStringField;
    qryRegistrodasOperacoestabela: TStringField;
    qryRegistrodasOperacoesnomeusuarioinclusao: TStringField;
    qryRegistrodasOperacoesnomeusuarioalteracao: TStringField;
    qryMotivosParadasbloqueiamaquina: TBooleanField;
    qryMotivosParadasparadanaoprogramada: TBooleanField;
    qryMotivosParadasNaoInfluiEficiencia: TBooleanField;
    procedure qryMotivosParadasAfterScroll(DataSet: TDataSet);
    procedure qryMotivosParadasNewRecord(DataSet: TDataSet);
  private
    FListaUsuariosSelecionados: String;
    { Private declarations }
  protected
    function ProximoCodigo: Integer;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
    procedure ExcluirMotivosParadas;
    procedure IncluirMotivosParadas;
    function GravarMotivosParadas: Boolean;
    procedure Editar;
    property ListaUsuariosSelecionados: String read FListaUsuariosSelecionados write FListaUsuariosSelecionados;

  end;

var
  dtmCadastroMotivosParadas: TdtmCadastroMotivosParadas;

implementation

{$R *.dfm}

procedure TdtmCadastroMotivosParadas.ExcluirMotivosParadas;
begin
  if not qryMotivosParadas.IsEmpty then
    if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['este NÍVEL'])) = smbOk) then
    begin
       qryMotivosParadas.Delete;
       Perpetrar([qryMotivosParadas]);
       RefazConsultaPorNome(qryRegistrodasOperacoes,['motivo'],[qryMotivosParadascodigo.AsVariant]);
    end;
end;

function TdtmCadastroMotivosParadas.GravarMotivosParadas: Boolean;
begin
  result := false;
  if (qryMotivosParadas.CheckRequiredFields) then
  begin
    if qryMotivosParadas.State = dsinsert then
        qryMotivosParadascodigo.AsInteger := ProximoCodigo;
    qryMotivosParadas.Post;
    result := Perpetrar([qryMotivosParadas]);
    RefazConsultaPorNome(qryRegistrodasOperacoes,['motivo'],[qryMotivosParadascodigo.AsVariant]);
  end;
end;

procedure TdtmCadastroMotivosParadas.IncluirMotivosParadas;
begin
  qryMotivosParadas.Insert;
  qryMotivosParadascodigo.AsInteger := ProximoCodigo;
end;

function TdtmCadastroMotivosParadas.ProximoCodigo: Integer;
begin
 qryMotivosParadasProximo.Open;
 result := qryMotivosParadasProximocodigo.AsInteger;
 qryMotivosParadasProximo.Close;
end;


procedure TdtmCadastroMotivosParadas.Editar;
begin
  if not (qryMotivosParadas.State in [dsedit, dsinsert]) then
    qryMotivosParadas.Edit;
end;

constructor TdtmCadastroMotivosParadas.Create(AOwner: TComponent);
begin
  inherited;
  qryMotivosParadas.Tag := ctTabelas;
end;

destructor TdtmCadastroMotivosParadas.Destroy;
begin

  inherited;
end;


procedure TdtmCadastroMotivosParadas.qryMotivosParadasAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qryRegistrodasOperacoes,['motivo'],[qryMotivosParadascodigo.AsVariant]);
end;

procedure TdtmCadastroMotivosParadas.qryMotivosParadasNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryMotivosParadasbloqueiamaquina.AsBoolean := false;
  qryMotivosParadasparadanaoprogramada.AsBoolean := false;

end;

end.
