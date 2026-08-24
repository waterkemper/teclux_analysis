unit dmquestionarios;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, dmtecsoft, ctconstantes;

type
  TdtmQuestionarios = class(TdtmBasico)
    dsrQuestionarios: TtecDataSource;
    qryQuestionarios: TtecQuery;
    qryQuestionarioscodigo: TIntegerField;
    qryQuestionariosdescricao: TStringField;
    qryQuestionariosdata_inicio: TDateTimeField;
    qryQuestionariosdata_fim: TDateTimeField;
    qryQuestionariosdisponivel: TBooleanField;
    qryQuestionariosdata_inativo: TDateTimeField;
    qryQuestionariosdescricao_text: TStringField;
    qryQuestionariosrespondermaisdeumavez: TBooleanField;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;

  end;

var
  dtmQuestionarios: TdtmQuestionarios;

implementation

{$R *.dfm}

{ TdtmQuestionarios }

constructor TdtmQuestionarios.Create(AOwner: TComponent);
begin
  inherited;
  qryQuestionarios.Tag := ctTabelas;
end;

end.
