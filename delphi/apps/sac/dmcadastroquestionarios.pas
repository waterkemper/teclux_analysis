unit dmcadastroquestionarios;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery, cpdatasource;

type
  TdtmCadastroQuestionarios = class(TdtmBasico)
    qryQuestionarios: TtecQuery;
    qryQuestionarioscodigo: TIntegerField;
    qryQuestionariosdescricao: TStringField;
    dsrQuestionario: TtecDataSource;
    qryQuestionariosPerguntas: TtecQuery;
    qryQuestionariosPerguntasquestionario: TIntegerField;
    qryQuestionariosPerguntaspergunta: TIntegerField;
    qryQuestionariosPerguntasenunciado: TStringField;
    dsrQuestionariosPerguntas: TtecDataSource;
    qryConsultaQuestionarios: TtecQuery;
    qryConsultaQuestionariosdescricao: TStringField;
    qryConsultaQuestionarioscodigo: TIntegerField;
    dsrConsultaQuestionarios: TtecDataSource;
    qryPerguntasNaoIncluidas: TtecQuery;
    qryPerguntasNaoIncluidascodigo: TIntegerField;
    qryPerguntasNaoIncluidasenunciado: TStringField;
    qryCodigoProximoQuestionario: TtecQuery;
    qryCodigoProximoQuestionariocodigo: TIntegerField;
    procedure qryQuestionariosAfterScroll(DataSet: TDataSet);
    procedure qryQuestionariosAfterCancel(DataSet: TDataSet);
  protected
    function GetTabelaConsultaQuestionario: TtecQuery;
    function GetTabelaPerguntasNaoIncluidas: TtecQuery;
    function GetQuestionarioPossuiPergunta: Boolean;
    function GetQuestionarioValido: Boolean;
    function GetTabelaQuestionario: TtecQuery;
  public
    procedure AbreTabelasConsultaPergNaoIncluidas;
    function  ExcluirQuestionario: boolean;
    function  GravarQuestionario: boolean;
    function  IncluirQuestionario: boolean;
    procedure IncluirPerguntaNoQuestionario;
    procedure PosicionarQuestionario;
    procedure RetirarPerguntaDoQuestionario;
    function  ExistePerguntaNaoIncluida(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
    function  ExisteQuestionario(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;

    constructor Create(AOwner: TComponent); override;
    property  TabelaPerguntasNaoIncluidas: TtecQuery read GetTabelaPerguntasNaoIncluidas;
    property  TabelaConsultaQuestionario: TtecQuery read GetTabelaConsultaQuestionario;
    property  QuestionarioValido: Boolean read GetQuestionarioValido;
    property  QuestionarioPossuiPergunta: Boolean read GetQuestionarioPossuiPergunta;
    property  TabelaQuestionario: TtecQuery read GetTabelaQuestionario;
  end;

var
  dtmCadastroQuestionarios: TdtmCadastroQuestionarios;

implementation

{$R *.dfm}

uses ctConstantes,
     biblio,
     dmtecsoft;

{ TdtmCadastroQuestionarios }

constructor TdtmCadastroQuestionarios.Create(AOwner: TComponent);
begin
  inherited;
  qryQuestionarios.Tag                  := ctCadastroQuestionarios;
  qryQuestionariosPerguntas.Tag         := ctCadastroQuestionarios;
  qryPerguntasNaoIncluidas.Tag          := ctTabelasConsultaPergNaoIncluidas;
  qryConsultaQuestionarios.Tag          := ctTabelasConsultaQuestionarios;
end;

procedure TdtmCadastroQuestionarios.AbreTabelasConsultaPergNaoIncluidas;
var
  pos: TBookmark;
  Perguntas: String;
begin
  pos := qryQuestionariosPerguntas.GetBookmark;
  qryQuestionariosPerguntas.DisableControls;
  try
    qryQuestionariosPerguntas.First;
    while Not qryQuestionariosPerguntas.Eof do begin
      Perguntas := Perguntas + qryQuestionariosPerguntaspergunta.AsString + ',';
      qryQuestionariosPerguntas.Next;
    end;
    if Perguntas <> '' then        //Retirar a vírgula caso exista na última posiçao da String.
      qryPerguntasNaoIncluidas.Sql[10] := '('+Copy(Perguntas, 1, Length(Perguntas) - 1)+')'
    else
      qryPerguntasNaoIncluidas.Sql[10] := '(0)';
    qryPerguntasNaoIncluidas.Open;
  finally
    qryQuestionariosPerguntas.GotoBookmark(pos);
    qryQuestionariosPerguntas.FreeBookmark(pos);
    qryQuestionariosPerguntas.EnableControls;
  end
end;

function TdtmCadastroQuestionarios.ExcluirQuestionario: boolean;
begin
  if not qryQuestionarios.IsEmpty then begin
    qryQuestionarios.Delete;
    Perpetrar([qryQuestionariosPerguntas,qryQuestionarios]);
  end;
  Result := True;
end;

function TdtmCadastroQuestionarios.ExistePerguntaNaoIncluida(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result := ExisteCodigo(qryPerguntasNaoIncluidas, NomeCampo, Value);
end;

function TdtmCadastroQuestionarios.ExisteQuestionario(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaQuestionarios, NomeCampo, Value);
end;

function TdtmCadastroQuestionarios.GetQuestionarioPossuiPergunta: Boolean;
begin
  Result := not qryQuestionariosPerguntas.IsEmpty;
end;

function TdtmCadastroQuestionarios.GetQuestionarioValido: Boolean;
begin
  Result := not qryQuestionarios.IsEmpty and (qryQuestionarios.State = dsBrowse);
end;

function TdtmCadastroQuestionarios.GetTabelaConsultaQuestionario: TtecQuery;
begin
  Result := qryConsultaQuestionarios;
end;

function TdtmCadastroQuestionarios.GetTabelaPerguntasNaoIncluidas: TtecQuery;
begin
  Result := qryPerguntasNaoIncluidas;
end;

function TdtmCadastroQuestionarios.GetTabelaQuestionario: TtecQuery;
begin
  Result := qryQuestionarios;
end;

function TdtmCadastroQuestionarios.GravarQuestionario: boolean;
begin
  if qryQuestionarios.State in [dsInsert] then begin
    qryCodigoProximoQuestionario.Open;
    qryQuestionarioscodigo.AsInteger := qryCodigoProximoQuestionariocodigo.AsInteger;
    qryCodigoProximoQuestionario.Close;
  end;
  qryQuestionarios.Post;
  qryQuestionariosPerguntas.DisableControls;
  try
    qryQuestionariosPerguntas.First;
    while not qryQuestionariosPerguntas.Eof do  begin
      qryQuestionariosPerguntas.Edit;
      qryQuestionariosPerguntasquestionario.AsInteger := qryQuestionarioscodigo.AsInteger;
      qryQuestionariosPerguntas.Next
    end;
  finally
    qryQuestionariosPerguntas.EnableControls
  end;
  Perpetrar([qryQuestionarios, qryQuestionariosPerguntas]);
  Result := True;
end;

procedure TdtmCadastroQuestionarios.IncluirPerguntaNoQuestionario;
begin
  qryQuestionarios.Edit;
  qryQuestionariosPerguntas.Insert;
  qryQuestionariosPerguntasquestionario.AsInteger := qryQuestionarioscodigo.AsInteger;
  qryQuestionariosPerguntaspergunta.AsInteger     := qryPerguntasNaoIncluidascodigo.AsInteger;
  qryQuestionariosPerguntasenunciado.AsString     := qryPerguntasNaoIncluidasenunciado.AsString;
  qryQuestionariosPerguntas.Post;
end;

function TdtmCadastroQuestionarios.IncluirQuestionario: boolean;
begin
  if Not qryQuestionarios.Active then
    qryQuestionarios.Open;
  qryQuestionarios.Insert;
  Result := True;
end;

procedure TdtmCadastroQuestionarios.PosicionarQuestionario;
begin
  qryQuestionarios.Close;
  qryQuestionariosPerguntas.Close;
  qryQuestionarios.Params[0].AsInteger := qryConsultaQuestionarioscodigo.AsInteger;
  qryQuestionarios.Open;
  qryQuestionariosPerguntas.Open

//  ReFazConsulta(qryQuestionarios, [0], [qryConsultaQuestionarioscodigo.AsInteger]);
end;

procedure TdtmCadastroQuestionarios.RetirarPerguntaDoQuestionario;
begin
  if not qryQuestionariosPerguntas.IsEmpty then begin
    qryQuestionarios.Edit;
    qryQuestionariosPerguntas.Delete;
  end
end;

procedure TdtmCadastroQuestionarios.qryQuestionariosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryQuestionariosPerguntas, [0], [qryQuestionarioscodigo.AsInteger]);
  qryPerguntasNaoIncluidas.Params[0].AsInteger := qryQuestionarioscodigo.AsInteger;
end;


procedure TdtmCadastroQuestionarios.qryQuestionariosAfterCancel(
  DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryQuestionariosPerguntas, [0], [qryQuestionarioscodigo.AsInteger]);
end;

end.
