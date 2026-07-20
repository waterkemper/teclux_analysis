unit dmcadastrocontatos;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, DB,
  //Terceiros
  ZQuery, ZPgSqlQuery, ZUpdateSql,
  //Biblio
  ctconstantes,
  //Componentes
  cpdatasource,  cpquery,      
  //Repositorio
  dmtecsoft, dmbasico;

type
  TdtmCadastroContatos = class(TdtmBasico)
    qryPerguntasAplicadas: TtecQuery;
    qryPerguntasAplicadascodigo: TIntegerField;
    qryPerguntasAplicadasenunciado: TStringField;
    qryPerguntasAplicadascomplementos: TStringField;
    qryPerguntasAplicadasminimo: TIntegerField;
    qryPerguntasAplicadasmaximo: TIntegerField;
    qryPerguntasAplicadastipo: TStringField;
    dsrPerguntasAplicadas: TtecDataSource;
    dsrRespostaDiscursiva: TtecDataSource;
    qryContatos: TtecQuery;
    qryContatosnumero: TIntegerField;
    qryContatoscliente: TIntegerField;
    qryContatosquestionario: TIntegerField;
    qryContatosdata: TDateField;
    qryContatostexto: TStringField;
    qryContatosnome: TStringField;
    qryContatosdescricao: TStringField;
    dsrContatos: TtecDataSource;
    qryRespostaDiscursiva: TtecQuery;
    qryRespostaDiscursivacontato: TIntegerField;
    qryRespostaDiscursivaquestionario: TIntegerField;
    qryRespostaDiscursivapergunta: TIntegerField;
    qryRespostaDiscursivatexto: TStringField;
    qryOpcoesPerguntasAplicadas: TtecQuery;
    qryOpcoesPerguntasAplicadaspergunta: TIntegerField;
    qryOpcoesPerguntasAplicadascodigo: TIntegerField;
    qryOpcoesPerguntasAplicadasopcao: TStringField;
    qryRespostaObjetiva: TtecQuery;
    qryRespostaObjetivacontato: TIntegerField;
    qryRespostaObjetivaquestionario: TIntegerField;
    qryRespostaObjetivapergunta: TIntegerField;
    qryRespostaObjetivaopcao: TIntegerField;
    qryConsultaRespostaObjetiva: TtecQuery;
    qryConsultaRespostaObjetivacontato: TIntegerField;
    qryConsultaRespostaObjetivaquestionario: TIntegerField;
    qryConsultaRespostaObjetivapergunta: TIntegerField;
    qryConsultaRespostaObjetivaopcao: TIntegerField;
    qryConsultaContatos: TtecQuery;
    qryConsultaContatosnome: TStringField;
    qryConsultaContatosnumero: TIntegerField;
    qryConsultaContatosdata: TDateField;
    qryProximoNumeroContato: TtecQuery;
    qryContatostipo: TStringField;
    qryLigacoes: TtecQuery;
    qryLigacoesfiltrosac: TIntegerField;
    qryLigacoescliente: TIntegerField;
    qryLigacoesusuario: TIntegerField;
    qryLigacoessituacao: TStringField;
    dsrLigacoes: TtecDataSource;
    qryLigacoesdatahora: TDateTimeField;
    qryExisteContatos: TtecQuery;
    qryExisteContatonumero: TIntegerField;
    qryExisteContatocliente: TIntegerField;
    qryExisteContatodata: TDateField;
    qryExisteContatoquestionario: TIntegerField;
    qryExisteContatotexto: TStringField;
    qryExisteContatotipo: TStringField;
    qryExcluirRespostaObjetiva: TtecQuery;
    qryExcluirRespostaDiscursiva: TtecQuery;
    qryContatossexo: TStringField;
    qryContatosusuario: TIntegerField;
    qryLigacoesreligado: TIntegerField;
    qryLigacoescontato: TIntegerField;
    qryExcluirLigacoes: TtecQuery;
    qryExcluirLigacoesfiltrosac: TIntegerField;
    qryExcluirLigacoescliente: TIntegerField;
    qryExcluirLigacoesusuario: TIntegerField;
    qryExcluirLigacoesdatahora: TDateTimeField;
    qryExcluirLigacoessituacao: TStringField;
    qryExcluirLigacoesreligado: TIntegerField;
    qryExcluirLigacoescontato: TIntegerField;
    qryProximoNumeroContatonumero: TIntegerField;
    { Contato }
    procedure qryContatosNewRecord(DataSet: TDataSet);
    { Pergunta }
    procedure qryPerguntasAplicadasAfterScroll(DataSet: TDataSet);
    procedure qryPerguntasAplicadasBeforeScroll(DataSet: TDataSet);
  protected
    FRequerContato: Boolean;
    FBeforeScrollPerguntaAplicada: TNotifyEvent;
    FOnScrollPerguntaAplicada: TNotifyEvent;
    FOnBeforeScrollPerguntaAplicada: TNotifyEvent;
    { Contato }
    procedure SetRequerContato(const Value: Boolean);
    function  GetTabelaConsultaContato: TtecQuery;
    function  GetTabelaContato: TtecQuery;
    { Ligacao }
    function  GetSituacaoLigacao: String;
    { FiltroSAC }
    function  GetFiltroSAC: Integer;
    { Pergunta }
    function  GetTipoPerguntaAplicada: TtecTipoPergunta;
  public
    { Ligacao }
    function  ExisteLigacao: Boolean;
    procedure SetStatusLigacao(Status:String);
    { Contato }
    function  GravarContatos   : Boolean;
    function  ExcluirContatos  : Boolean;
    function  IncluirContatos  : Boolean;
    function  JaExisteContato:Boolean;
    function  ExisteContato(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; overload;
    procedure PosicionarContato(NoDia: Boolean);
    procedure ExcluirRespostasContato;
    { Resposta }
    procedure GravarResposta; overload;
    procedure GravarResposta(Index:Integer); overload;
    procedure ExcluirResposta; overload;
    procedure ExcluirResposta(Index: Integer); overload;
    function  IncluirRespostaDiscursiva: Boolean;
    function  IncluirRespostaObjetiva: Boolean;
    { Pergunta }
    procedure PerguntaAnterior;
    procedure ProximaPergunta;
    function  MaximoOpcoes: Integer;
    function  MinimoOpcoes: Integer;
    { Questionario }
    procedure SelecionarQuestionarioAplicado;

    constructor Create(AOwner: TComponent); override;

    property  OnScrollPerguntaAplicada: TNotifyEvent read FOnScrollPerguntaAplicada
                                                     write FOnScrollPerguntaAplicada;
    property  OnBeforeScrollPerguntaAplicada: TNotifyEvent read FBeforeScrollPerguntaAplicada
                                                           write FBeforeScrollPerguntaAplicada;
    property  SituacaoLigacao: String read GetSituacaoLigacao;
    property  FiltroSAC: Integer read GetFiltroSAC;
    property  TabelaConsultaContato: TtecQuery read GetTabelaConsultaContato;
    property  TabelaContato: TtecQuery read GetTabelaContato;
    property  TipoPerguntaAplicada: TtecTipoPergunta read GetTipoPerguntaAplicada;
    property  RequerContato: Boolean read FRequerContato write SetRequerContato;
  end;

implementation

{$R *.dfm}

constructor TdtmCadastroContatos.Create(AOwner: TComponent);
begin
  inherited;
  qryContatos.Tag                 := ctCadastroContatos;
  qryLigacoes.Tag                 := ctTabelasAplicarPerguntas;
  qryPerguntasAplicadas.Tag       := ctTabelasAplicarPerguntas;
  qryRespostaDiscursiva.Tag       := ctTabelasAplicarPerguntas;
  qryOpcoesPerguntasAplicadas.Tag := ctTabelasAplicarPerguntas;
  qryConsultaContatos.Tag         := ctTabelasConsultaContatos;
end;

{ ============================== CONTATOS ===============================}

function TdtmCadastroContatos.GravarContatos: Boolean;
begin
  try
    if (qryLigacoessituacao.AsString <> ctSACCancelarLigacao) or
       ((qryLigacoessituacao.AsString = ctSACCancelarLigacao) and RequerContato) then begin

      if qryContatos.State in [dsInsert] then Begin
         qryProximoNumeroContato.Open;
         qryContatosNumero.AsInteger    := qryProximoNumeroContatonumero.AsInteger;
         qryProximoNumeroContato.Close;
      end;

      if qryContatos.State in [dsInsert,dsEdit] then begin
        qryContatos.Post;
        Perpetrar([qryContatos]);

        qryLigacoes.Edit;
        qryLigacoescontato.AsInteger:= qryContatosNumero.AsInteger;
        qryLigacoes.Post;
        Perpetrar([qryLigacoes]);
      end;
    end
    else
      qryContatos.Cancel;
    Result := True;
  except
    raise
  end;
  inherited;
end;

function TdtmCadastroContatos.ExcluirContatos: Boolean;
begin
  if ExisteLigacao then begin
    if (qryLigacoescontato.AsInteger > 0) then begin
      ReFazConsulta(qryExcluirLigacoes,[0],[qryLigacoescontato.AsInteger]);
      if not qryExcluirLigacoes.IsEmpty then begin
        qryExcluirLigacoes.Edit;
        qryExcluirLigacoesusuario.Clear;
        qryExcluirLigacoesDataHora.Clear;
        qryExcluirLigacoessituacao.AsString  := ctSACNenhuma;
        qryExcluirLigacoesreligado.Clear;
        qryExcluirLigacoesContato.Clear;
        qryExcluirLigacoes.Post;
        Perpetrar([qryExcluirLigacoes]);
      end;
    end
    else
      SetStatusLigacao(ctSACNenhuma);
  end;

  if not qryContatos.IsEmpty Then
    qryContatos.Delete;
  Perpetrar([qryContatos]);

  if TipoPerguntaAplicada = tpDISCURSIVA then
     ReFazConsulta(qryRespostaDiscursiva, [0,1,2], [qryContatosnumero.AsInteger,
                                                    qryContatosquestionario.AsInteger,
                                                    qryPerguntasAplicadascodigo.AsInteger])
  else
     if TipoPerguntaAplicada = tpOBJETIVA then
        ReFazConsulta(qryRespostaObjetiva, [0,1,2], [qryContatosnumero.AsInteger,
                                                     qryContatosquestionario.AsInteger,
                                                     qryPerguntasAplicadascodigo.AsInteger]);
  ReFazConsulta(qryPerguntasAplicadas,[0],[0]);
  Result := True;
end;

function TdtmCadastroContatos.IncluirContatos: Boolean;
begin
  qryContatos.Insert;
  Result:=True;
end;

function TdtmCadastroContatos.JaExisteContato: Boolean;
begin
  if qryLigacoescontato.AsInteger > 0 then begin
    ReFazConsulta(qryExisteContatos,[0],[qryLigacoescontato.AsInteger]);
    Result:= not qryExisteContatos.IsEmpty;
  end
  else
    Result:= False;
end;

function TdtmCadastroContatos.ExisteContato(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  qryConsultaContatos.Sql[5] := 'and to_ascii(' + NomeCampo + ',''latin1'') ilike to_ascii(''' + Value + '%'',''latin1'')';
  qryConsultaContatos.Open;
  Result := Not qryConsultaContatos.IsEmpty
end;

procedure TdtmCadastroContatos.PosicionarContato(NoDia:Boolean);
begin
  if not NoDia then begin
    ReFazConsulta(qryContatos, [0], [qryConsultaContatosnumero.AsInteger]);
    SelecionarQuestionarioAplicado;
  end
  else
    ReFazConsulta(qryContatos, [0], [qryExisteContatonumero.AsInteger]);
end;

procedure TdtmCadastroContatos.SetRequerContato(const Value: Boolean);
begin
  if FRequerContato <> Value then
    FRequerContato:= Value;
end;

function TdtmCadastroContatos.GetTabelaConsultaContato: TtecQuery;
begin
  Result := qryConsultaContatos
end;

function TdtmCadastroContatos.GetTabelaContato: TtecQuery;
begin
  Result := qryContatos
end;

procedure TdtmCadastroContatos.qryContatosNewRecord(DataSet: TDataSet);
begin
   inherited;
   qryContatosUsuario.AsInteger := CodigoUsuario;
   qryContatosData.AsDateTime   := Date;
   qryContatosTexto.AsString    := '';
end;

procedure TdtmCadastroContatos.ExcluirRespostasContato;
begin
  ReFazConsulta(qryExcluirRespostaObjetiva  ,[0,1],[qryContatosnumero.AsInteger,
                                                    qryContatosquestionario.AsInteger]);
  ReFazConsulta(qryExcluirRespostaDiscursiva,[0,1],[qryContatosnumero.AsInteger,
                                                    qryContatosquestionario.AsInteger]);
end;

{ ============================== LIGAÇOES ===============================}

function TdtmCadastroContatos.ExisteLigacao: Boolean;
begin
  Result:= not (qryLigacoes.IsEmpty);
end;

function TdtmCadastroContatos.GetSituacaoLigacao: String;
begin
  Result:= qryLigacoessituacao.AsString;
end;

procedure TdtmCadastroContatos.SetStatusLigacao(Status: String);
begin
  qryLigacoes.Edit;
  qryLigacoessituacao.AsString     := Status;
  qryLigacoesusuario.AsInteger     := CodigoUsuario;
  qryLigacoesdatahora.AsDateTime   := TDateTime(Now);

  if Status = ctSACReligando then
    qryLigacoesReligado.AsInteger:= qryLigacoesReligado.AsInteger + 1;

  qryLigacoes.Post;
  Perpetrar([qryLigacoes]);
end;

{ ============================== PERGUNTAS ===============================}

procedure TdtmCadastroContatos.PerguntaAnterior;
begin
  qryPerguntasAplicadas.Prior;
end;

procedure TdtmCadastroContatos.ProximaPergunta;
begin
  qryPerguntasAplicadas.Next;
end;

function TdtmCadastroContatos.MaximoOpcoes: Integer;
begin
  Result := qryPerguntasAplicadasmaximo.AsInteger;
end;

function TdtmCadastroContatos.MinimoOpcoes: Integer;
begin
  Result := qryPerguntasAplicadasminimo.AsInteger;
end;

function TdtmCadastroContatos.GetTipoPerguntaAplicada: TtecTipoPergunta;
begin
  if qryPerguntasAplicadastipo.AsString = 'O' then
    Result := tpOBJETIVA
  else if qryPerguntasAplicadastipo.AsString = 'D' then
    Result := tpDISCURSIVA
  else
    Result := tpNENHUMA
end;

procedure TdtmCadastroContatos.qryPerguntasAplicadasAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryOpcoesPerguntasAplicadas,[0],    [qryPerguntasAplicadascodigo.AsInteger]);
  ReFazConsulta(qryConsultaRespostaObjetiva,[0,1,2],[qryContatosNumero.AsInteger,
                                                     qryContatosquestionario.AsInteger,
                                                     qryPerguntasAplicadasCodigo.AsInteger]);
  if Assigned(OnScrollPerguntaAplicada) then
     OnScrollPerguntaAplicada(qryPerguntasAplicadas);

  if TipoPerguntaAplicada = tpDISCURSIVA then
     ReFazConsulta(qryRespostaDiscursiva, [0,1,2], [qryContatosnumero.AsInteger,
                                                    qryContatosquestionario.AsInteger,
                                                    qryPerguntasAplicadascodigo.AsInteger])
  else
     if TipoPerguntaAplicada = tpOBJETIVA then begin
        ReFazConsulta(qryRespostaObjetiva, [0,1,2], [qryContatosnumero.AsInteger,
                                                     qryContatosquestionario.AsInteger,
                                                     qryPerguntasAplicadascodigo.AsInteger]);
     end;
end;

procedure TdtmCadastroContatos.qryPerguntasAplicadasBeforeScroll(DataSet: TDataSet);
begin
  inherited;
  if Assigned(OnBeforeScrollPerguntaAplicada) then
     OnBeforeScrollPerguntaAplicada(qryPerguntasAplicadas);
end;

{ ============================== RESPOSTA ===============================}

procedure TdtmCadastroContatos.GravarResposta;
begin
   if qryRespostaDiscursiva.State in [dsInsert,dsEdit] Then begin
     qryRespostaDiscursivaContato.AsInteger      := qryContatosNumero.AsInteger;
     qryRespostaDiscursivaquestionario.AsInteger := qryContatosquestionario.AsInteger;
     qryRespostaDiscursivapergunta.AsInteger     := qryPerguntasAplicadasCodigo.AsInteger;
     qryRespostaDiscursiva.Post;
     Perpetrar([qryRespostaDiscursiva]);
   end;
end;

procedure TdtmCadastroContatos.GravarResposta(Index:Integer);
begin
   ReFazConsulta(qryRespostaObjetiva,[0,1,2,3],[qryContatosNumero.AsInteger,
                                                qryContatosquestionario.AsInteger,
                                                qryPerguntasAplicadasCodigo.AsInteger,
                                                Index]);
   if qryRespostaObjetiva.IsEmpty then begin
     qryRespostaObjetiva.Insert;

     qryRespostaObjetivaContato.AsInteger      := qryContatosNumero.AsInteger;
     qryRespostaObjetivaQuestionario.AsInteger := qryContatosquestionario.AsInteger;
     qryRespostaObjetivaPergunta.AsInteger     := qryPerguntasAplicadasCodigo.AsInteger;
     qryRespostaObjetivaOpcao.AsInteger        := Index;
     qryRespostaObjetiva.Post;
     Perpetrar([qryRespostaObjetiva]);
   end;
end;

procedure TdtmCadastroContatos.ExcluirResposta;
{var
  i:integer;}
begin
//  if TipoPerguntaAplicada = tpDISCURSIVA then begin
     if not (qryRespostaDiscursiva.State in [dsInsert,dsEdit]) then begin
        qryRespostaDiscursiva.Delete;
     end;
//  end;
{  else if TipoPerguntaAplicada = tpOBJETIVA then begin
    ReFazConsulta(qryConsultaRespostaObjetiva,[0,1,2],[qryContatosNumero.AsInteger,
                                                       qryContatosquestionario.AsInteger,
                                                       qryPerguntasAplicadasCodigo.AsInteger]);
    for i:=1 to qryConsultaRespostaObjetiva.RecordCount do begin
       qryConsultaRespostaObjetiva.Delete;
       qryConsultaRespostaObjetiva.Next;
    end;
  end;}
end;

procedure TdtmCadastroContatos.ExcluirResposta(Index:Integer);
begin
  ReFazConsulta(qryRespostaObjetiva,[0,1,2,3],[qryContatosNumero.AsInteger,
                                               qryContatosquestionario.AsInteger,
                                               qryPerguntasAplicadasCodigo.AsInteger,
                                               Index]);
  if not qryRespostaObjetiva.IsEmpty then begin
     qryRespostaObjetiva.Delete;
     Perpetrar([qryRespostaObjetiva]);
  end
end;

function TdtmCadastroContatos.IncluirRespostaDiscursiva: Boolean;
begin
  if qryRespostaDiscursiva.IsEmpty then
    qryRespostaDiscursiva.Insert;
  Result := True;
end;

function TdtmCadastroContatos.IncluirRespostaObjetiva: Boolean;
begin
  Result := True
end;

{ ============================== QUESTIONARIO ===============================}

procedure TdtmCadastroContatos.SelecionarQuestionarioAplicado;
begin
  ReFazConsulta(qryPerguntasAplicadas, [0], [qryContatosquestionario.AsInteger]);
end;

{ ============================== FILTROSAC ===============================}

function TdtmCadastroContatos.GetFiltroSAC: Integer;
begin
//  Result:= dtmTecSoft.CodigoFiltroSAC_Usuario;
end;


end.
