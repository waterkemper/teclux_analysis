unit dmcadastroniveisconhecimento;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, biblio, ctconstantes, Forms;

type
  TdtmCadastroniveisconhecimento = class(TdtmBasico)
    dsrNiveisConhecimento: TtecDataSource;
    qryNiveisConhecimentoProximo: TtecQuery;
    qryNiveisConhecimentoProximocodigo: TIntegerField;
    qryNiveisConhecimento: TtecQuery;
    qryNiveisConhecimentocodigo: TIntegerField;
    qryNiveisConhecimentodescricao: TStringField;
  private
    FListaUsuariosSelecionados: String;
    { Private declarations }
  protected
    function ProximoCodigo: Integer;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
    procedure ExcluirNiveisConhecimento;
    procedure IncluirNiveisConhecimento;
    function GravarNiveisConhecimento: Boolean;
    procedure Editar;
    property ListaUsuariosSelecionados: String read FListaUsuariosSelecionados write FListaUsuariosSelecionados;

  end;

var
  dtmCadastroniveisconhecimento: TdtmCadastroniveisconhecimento;

implementation

{$R *.dfm}

procedure TdtmCadastroNiveisConhecimento.ExcluirNiveisConhecimento;
begin
  if not qryNiveisConhecimento.IsEmpty then
    if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['este NÍVEL'])) = smbOk) then
    begin
       qryNiveisConhecimento.Delete;
       Perpetrar([qryNiveisConhecimento]);
    end;
end;

function TdtmCadastroNiveisConhecimento.GravarNiveisConhecimento: Boolean;
begin
  result := false;
  if (qryNiveisConhecimento.CheckRequiredFields) then
  begin
    if qryNiveisConhecimento.State = dsinsert then
        qryNiveisConhecimentocodigo.AsInteger := ProximoCodigo;
    qryNiveisConhecimento.Post;
    result := Perpetrar([qryNiveisConhecimento]);
  end;
end;

procedure TdtmCadastroNiveisConhecimento.IncluirNiveisConhecimento;
begin
  qryNiveisConhecimento.Insert;
  qryNiveisConhecimentocodigo.AsInteger := ProximoCodigo;
end;

function TdtmCadastroNiveisConhecimento.ProximoCodigo: Integer;
begin
 qryNiveisConhecimentoProximo.Open;
 result := qryNiveisConhecimentoProximocodigo.AsInteger;
 qryNiveisConhecimentoProximo.Close;
end;


procedure TdtmCadastroNiveisConhecimento.Editar;
begin
  if not (qryNiveisConhecimento.State in [dsedit, dsinsert]) then
    qryNiveisConhecimento.Edit;
end;

constructor TdtmCadastroNiveisConhecimento.Create(AOwner: TComponent);
begin
  inherited;
  qryNiveisConhecimento.Tag := ctTabelas;
end;

destructor TdtmCadastroNiveisConhecimento.Destroy;
begin

  inherited;
end;


end.
