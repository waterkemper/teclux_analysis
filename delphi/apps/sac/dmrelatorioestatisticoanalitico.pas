unit dmrelatorioestatisticoanalitico;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery, cpquery,dmtecsoft,
  ctconstantes, FR_DSet, FR_DBSet, FR_Class;

type
  TdtmRelatorioEstatisticoAnalitico = class(TdtmBasico)
    qryEstatisticoAnalitco: TtecQuery;
    dsrEstatisticoAnalitco: TtecDataSource;
    frDBEstatisticoAnalitico: TfrDBDataSet;
    frEstatisticoAnalitico: TfrReport;
    qryQuestionario: TtecQuery;
    dsrQuestionario: TtecDataSource;
    qryConsultaQuestionario: TtecQuery;
    dsrConsultaQuestionario: TtecDataSource;
    qryPergunta: TtecQuery;
    dsrPergunta: TtecDataSource;
    qryConsultaPergunta: TtecQuery;
    dsrConsultaPergunta: TtecDataSource;
    qryOpcao: TtecQuery;
    dsrOpcao: TtecDataSource;
    qryConsultaOpcao: TtecQuery;
    dsrConsultaOpcao: TtecDataSource;
    qryQuestionariocodigo: TIntegerField;
    qryQuestionariodescricao: TStringField;
    qryConsultaQuestionariodescricao: TStringField;
    qryConsultaQuestionariocodigo: TIntegerField;
    qryPerguntacodigo: TIntegerField;
    qryPerguntaenunciado: TStringField;
    qryConsultaPerguntaenunciado: TStringField;
    qryConsultaPerguntacodigo: TIntegerField;
    qryOpcaocodigo: TIntegerField;
    qryOpcaoopcao: TStringField;
    qryConsultaOpcaoopcao: TStringField;
    qryConsultaOpcaocodigo: TIntegerField;
    qryEstatisticoAnalitcodescricao: TStringField;
    qryEstatisticoAnalitcocodquestionario: TIntegerField;
    qryEstatisticoAnalitcoenunciado: TStringField;
    qryEstatisticoAnalitcocomplementos: TStringField;
    qryEstatisticoAnalitcocodpergunta: TIntegerField;
    qryEstatisticoAnalitcoopcao: TStringField;
    qryEstatisticoAnalitcocodopcao: TIntegerField;
    qryEstatisticoAnalitcocodigo: TIntegerField;
    qryEstatisticoAnalitconome: TStringField;
  protected
    { Private declarations }
    function GetCodigoQuestionario      : integer;
    function GetCodigoPergunta          : integer;
    function GetCodigoOpcao             : integer;
    function GetConsultaQuestionario    : TtecQuery;
    function GetConsultaPergunta        : TtecQuery;
    function GetConsultaOpcao           : TtecQuery;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    function  ExisteQuestionario(campo, codigo: string): boolean;
    function  ExistePergunta(campo, codigo: string): boolean;
    function  ExisteOpcao(campo, codigo: string): boolean;
    procedure Selecionar(TipoPesquisa: TtecTipoConsultaOpcaoResposta);
    procedure RefazConsultaQuestionario(codQuestionario:integer);
    procedure RefazConsultaPergunta(codPergunta:integer);
    procedure RefazConsultaOpcao(codOpcao:integer);
    procedure SetParametros(datainicio,datatermio:string);
    procedure SetPerguntaEmOpcao;
    procedure SetQuestionarioEmPerguntas;
    property  CodigoQuestionario     : integer read GetCodigoQuestionario;
    property  CodigoPergunta         : integer read GetCodigoPergunta;
    property  CodigoOpcao            : integer read GetCodigoOpcao;
    property  ConsultaQuestionario   : TtecQuery read GetConsultaQuestionario;
    property  ConsultaPergunta       : TtecQuery read GetConsultaPergunta;
    property  ConsultaOpcao          : TtecQuery read GetConsultaOpcao;
  end;

{var
  dtmRelatorioEstatisticoAnalitico: TdtmRelatorioEstatisticoAnalitico;}

implementation

{$R *.dfm}

{ TdtmRelatorioEstatisticoAnalitico }


{ TdtmRelatorioEstatisticoAnalitico }

constructor TdtmRelatorioEstatisticoAnalitico.Create(AOwner: TComponent);
begin
  inherited;
  qryEstatisticoAnalitco.Tag         := ctRelatorioEstatisticoAnaliticoRelatorio;
  qryQuestionario.Tag                := ctRelatorioEstatisticoAnalitico;
  qryPergunta.Tag                    := ctRelatorioEstatisticoAnalitico;
  qryOpcao.Tag                       := ctRelatorioEstatisticoAnalitico;
  qryConsultaQuestionario.Tag        := ctRelatorioEstatisticoAnaliticoConsulta;
  qryConsultaPergunta.Tag            := ctRelatorioEstatisticoAnaliticoConsulta;
  qryConsultaOpcao.Tag               := ctRelatorioEstatisticoAnaliticoConsulta;
end;

function TdtmRelatorioEstatisticoAnalitico.ExisteOpcao(campo,
  codigo: string): boolean;
begin
  Result := ExisteCodigo(qryConsultaOpcao, campo, codigo);
end;

function TdtmRelatorioEstatisticoAnalitico.ExistePergunta(campo,
  codigo: string): boolean;
begin
  Result := ExisteCodigo(qryConsultaPergunta, campo, codigo);
end;

function TdtmRelatorioEstatisticoAnalitico.ExisteQuestionario(campo,
  codigo: string): boolean;
begin
  Result := ExisteCodigo(qryConsultaQuestionario, campo, codigo);
end;

function TdtmRelatorioEstatisticoAnalitico.GetCodigoOpcao: integer;
begin
  Result := qryConsultaOpcaocodigo.AsInteger
end;

function TdtmRelatorioEstatisticoAnalitico.GetCodigoPergunta: integer;
begin
  Result := qryConsultaPerguntacodigo.AsInteger
end;

function TdtmRelatorioEstatisticoAnalitico.GetCodigoQuestionario: integer;
begin
  Result := qryConsultaQuestionariocodigo.AsInteger
end;

function TdtmRelatorioEstatisticoAnalitico.GetConsultaOpcao: TtecQuery;
begin
  Result := qryConsultaOpcao
end;

function TdtmRelatorioEstatisticoAnalitico.GetConsultaPergunta: TtecQuery;
begin
  Result := qryConsultaPergunta
end;

function TdtmRelatorioEstatisticoAnalitico.GetConsultaQuestionario: TtecQuery;
begin
  Result := qryConsultaQuestionario
end;

procedure TdtmRelatorioEstatisticoAnalitico.RefazConsultaOpcao(
  codOpcao: integer);
begin
  ReFazConsulta(qryOpcao, [1], [codOpcao]);
end;

procedure TdtmRelatorioEstatisticoAnalitico.RefazConsultaPergunta(
  codPergunta: integer);
begin
  ReFazConsulta(qryPergunta, [1], [codPergunta]);
end;

procedure TdtmRelatorioEstatisticoAnalitico.RefazConsultaQuestionario(
  codQuestionario: integer);
begin
  ReFazConsulta(qryQuestionario, [0], [codQuestionario]);
end;

procedure TdtmRelatorioEstatisticoAnalitico.Selecionar(
  TipoPesquisa: TtecTipoConsultaOpcaoResposta);
begin
  case TipoPesquisa of
    tcoQUESTIONARIO: begin
                       RefazConsultaQuestionario(CodigoQuestionario);
                       SetQuestionarioEmPerguntas;
                     end;
    tcoPERGUNTA    : begin
                       RefazConsultaPergunta(CodigoPergunta);
                       SetPerguntaEmOpcao;
                     end;
    tcoOPCAO       : RefazConsultaOpcao(CodigoOpcao);
  end;
end;

procedure TdtmRelatorioEstatisticoAnalitico.SetParametros(datainicio,
  datatermio: string);
begin
  qryEstatisticoAnalitco.Params[0].AsInteger:=qryQuestionariocodigo.AsInteger;
  qryEstatisticoAnalitco.Params[1].AsInteger:=qryPerguntacodigo.AsInteger;
  qryEstatisticoAnalitco.Params[2].AsInteger:=qryOpcaocodigo.AsInteger;
  qryEstatisticoAnalitco.Params[3].AsString:=datainicio;
  qryEstatisticoAnalitco.Params[4].AsString:=datatermio;
end;

procedure TdtmRelatorioEstatisticoAnalitico.SetPerguntaEmOpcao;
begin
  qryOpcao.Params[0].AsString:=qryPerguntacodigo.AsString;
  qryConsultaOpcao.Params[0].AsString:=qryPerguntacodigo.AsString;
end;

procedure TdtmRelatorioEstatisticoAnalitico.SetQuestionarioEmPerguntas;
begin
  qryPergunta.Params[0].AsInteger:=qryQuestionariocodigo.AsInteger;
  qryConsultaPergunta.Params[0].AsInteger:=qryQuestionariocodigo.AsInteger;
end;

end.
