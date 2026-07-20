unit dmcadastrotabelafretes;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, biblio, ctconstantes, Forms, ZTransact;


type
  TdtmCadastroTabelaFretes = class(TdtmBasico)
    qryTabelaFrete: TtecQuery;
    qryConsultaTabelaFrete: TtecQuery;
    spcTabelaFreteProximoCodigo: TtecQuery;
    dsrTabelaFrete: TtecDataSource;
    qryTabelaFretecodigo: TIntegerField;
    qryTabelaFretedescricao: TStringField;
    qryTabelaFreteobservacoes: TStringField;
    qryTabelaFretevalorcliente: TFloatField;
    qryTabelaFretevalorfornecedor: TFloatField;
    qryConsultaTabelaFretecodigo: TIntegerField;
    qryConsultaTabelaFretedescricao: TStringField;
    spcTabelaFreteProximoCodigocodigo: TIntegerField;
  private
    { Private declarations }
    function getConsultaTabelaFrete: TZDataSet;
    function GetTabelaFrete: TZDataSet;

  public
    { Public declarations }
    function IncluirTabeladeFretes: boolean;
    function GravarTabeladeFretes: boolean;
    function ExcluirTabeladeFretes: boolean;
    function ExisteTabeladefrete(NomeCampo: String; Value: Variant): boolean;

    procedure PosicionarTabelaFrete;

    property TabelaFrete: TZDataSet read GetTabelaFrete;
    property ConsultaTabelaFrete: TZDataSet read GetConsultaTabelaFrete;

    constructor Create(AOwner: TComponent); override;  //abrir a tabela


  end;

var
  dtmCadastroTabelaFretes: TdtmCadastroTabelaFretes;

implementation

{$R *.dfm}

{ TdtmCadastroTabelaFretes }

constructor TdtmCadastroTabelaFretes.Create(AOwner: TComponent);
begin
  inherited;
  qryTabelaFrete.Tag := ctTabelas;
  qryConsultaTabelaFrete.Tag := ctConsultaTabelaFrete;
end;

function TdtmCadastroTabelaFretes.ExcluirTabeladeFretes: boolean;
begin
  result := false;
  if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o registro da TABELA DE FRETES'])) = smbOk then
  begin
    if not qryTabelaFrete.IsEmpty then
      qryTabelaFrete.delete
    else
      qryTabelaFrete.Cancel;
    Perpetrar([qryTabelaFrete]);
    Result:= True;
  end;
end;

function TdtmCadastroTabelaFretes.ExisteTabeladefrete(NomeCampo: String;
  Value: Variant): boolean;
begin
  result:=ExisteCodigo(qryConsultaTabelaFrete, NomeCampo, Value);
end;

function TdtmCadastroTabelaFretes.getConsultaTabelaFrete: TZDataSet;
begin
  result:=qryConsultaTabelaFrete
end;

function TdtmCadastroTabelaFretes.GetTabelaFrete: TZDataSet;
begin
  result:=qryTabelaFrete
end;

function TdtmCadastroTabelaFretes.GravarTabeladeFretes: boolean;
begin
  if qryTabelaFrete.CheckRequiredFields then
  begin
    if qryTabelaFrete.State = dsinsert then
    begin
      ReFazConsulta(spcTabelaFreteProximoCodigo,[],[]);
      qryTabelaFrete.Edit;
      qryTabelaFretecodigo.Value:=spcTabelaFreteProximoCodigocodigo.Value;
    end;
    qryTabelaFrete.Post;
    result:=Perpetrar([qryTabelaFrete]);
  end
  else
    result:=false;
end;

function TdtmCadastroTabelaFretes.IncluirTabeladeFretes: boolean;
begin
  qryTabelaFrete.Insert;
  result:= true;
end;


procedure TdtmCadastroTabelaFretes.PosicionarTabelaFrete;
begin
  refazconsulta(qryTabelaFrete, [0], [qryconsultatabelafretecodigo.AsVariant]);
end;

end.
