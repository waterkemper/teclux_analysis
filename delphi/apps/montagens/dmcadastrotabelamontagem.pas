unit dmcadastrotabelamontagem;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery,
  dmtecsoft, biblio, ctconstantes, Forms, cpdatasource, ZTransact;

type
  TdtmCadastroTabelaMontagem = class(TdtmBasico)
    qryTabelaMontagem: TtecQuery;
    qryConsultaTabelaMontagem: TtecQuery;
    qryConsultaTabelaMontagemcodigo: TIntegerField;
    qryConsultaTabelaMontagemdescricao: TStringField;
    dsrTabelaMontagem: TtecDataSource;
    spcTabelaMontagemProximoCodigo: TtecQuery;
    spcTabelaMontagemProximoCodigocodigo: TIntegerField;
    qryTabelaMontagemcodigo: TIntegerField;
    qryTabelaMontagemdescricao: TStringField;
    qryTabelaMontagemobservacoes: TStringField;
    qryTabelaMontagemvalorloja: TFloatField;
    qryTabelaMontagemvalordentro: TFloatField;
    qryTabelaMontagemvalorfora: TFloatField;
    qryTabelaMontagemtipovalor: TStringField;
  private
    function getConsultaTabelaMontagem: TZDataSet;
    function GetTabelaMontagem: TZDataSet;
    { Private declarations }
  public
    { Public declarations }
    function IncluirTabeladeMontagem: boolean;
    function GravarTabeladeMontagem: boolean;
    function ExcluirTabeladeMontagem: boolean;
    function ExisteTabeladeMontagem(NomeCampo: String; Value: Variant): boolean;

    procedure PosicionarTabelaMontagem;

    property ConsultaTabelaMontagem: TZDataSet read GetConsultaTabelaMontagem;
    property TabelaMontagem: TZDataSet read GetTabelaMontagem;
    constructor Create(AOwner: TComponent); override;
  end;

var
  dtmCadastroTabelaMontagem: TdtmCadastroTabelaMontagem;

implementation

{$R *.dfm}

{ TdtmCadastroTabelaMontagem }

constructor TdtmCadastroTabelaMontagem.Create(AOwner: TComponent);
begin
  inherited;
  qryTabelaMontagem.Tag := ctTabelas;
  qryConsultaTabelaMontagem.Tag := ctConsultaTabelaMontagem;
end;

function TdtmCadastroTabelaMontagem.ExcluirTabeladeMontagem: boolean;
begin
  if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o registro da TABELA DE MONTAGEM'])) = smbOk then
  begin
    if not qryTabelaMontagem.IsEmpty then
      qryTabelaMontagem.delete
    else
      qryTabelaMontagem.Cancel;
    Perpetrar([qryTabelaMontagem]);
    Result:= True;
  end
  else
    Result:= False;
end;

function TdtmCadastroTabelaMontagem.ExisteTabeladeMontagem(
  NomeCampo: String; Value: Variant): boolean;
begin
  result:=ExisteCodigo(qryConsultaTabelaMontagem, NomeCampo, Value);
end;

function TdtmCadastroTabelaMontagem.getConsultaTabelaMontagem: TZDataSet;
begin
  result:=qryConsultaTabelaMontagem
end;

function TdtmCadastroTabelaMontagem.GetTabelaMontagem: TZDataSet;
begin
  result:=qryTabelaMontagem;
end;

function TdtmCadastroTabelaMontagem.GravarTabeladeMontagem: boolean;
begin
  if qryTabelaMontagem.CheckRequiredFields then
  begin
    if qrytabelamontagem.State = dsinsert then
    begin
      ReFazConsulta(spcTabelaMontagemProximoCodigo,[],[]);
      qryTabelaMontagem.Edit;
      qryTabelaMontagemcodigo.Value:=spcTabelaMontagemProximoCodigocodigo.Value;
    end;
    qryTabelaMontagem.Post;
    result:=Perpetrar([qryTabelaMontagem]);
  end
  else
    result:=false;
end;

function TdtmCadastroTabelaMontagem.IncluirTabeladeMontagem: boolean;
begin
  qryTabelaMontagem.Insert;
  result:= true;
end;

procedure TdtmCadastroTabelaMontagem.PosicionarTabelaMontagem;
begin
  refazconsulta(qryTabelaMontagem, [0], [qryConsultaTabelaMontagemcodigo.AsVariant]);
end;

end.
