unit dmsac;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB,
  //Terceiros
  ZQuery, ZPgSqlQuery, ZUpdateSql,
  //Biblio
  biblio,ctconstantes,
  //Componentes
  cpdatasource, cpquery, cpupdatesql,
  //Repositorio
  dmbasico, dmcadastrocontatos;

type
  TdtmSAC = class(TdtmCadastroContatos)
    qryPesquisarPergunta: TtecQuery;
    qryPesquisarPerguntacodigo: TIntegerField;
    qryConsultaClientes: TtecQuery;
    qryConsultaClientescodigo: TIntegerField;
    qryConsultaClientesnome: TStringField;
    qryConsultaClientesnascto: TDateField;
    qryConsultaClientesiddocumento: TStringField;
    qryNrOpcoesAssinaladas: TtecQuery;
    qryNrOpcoesAssinaladasquantidade: TIntegerField;
    qryDetalhesCliente: TtecQuery;
    qryDetalhesClienterua: TStringField;
    qryDetalhesClientebairro: TStringField;
    qryDetalhesClientecidade: TStringField;
    qryDetalhesClientecep: TIntegerField;
    qryDetalhesClienteestado: TStringField;
    qryProdutosContrato: TtecQuery;
    qryProdutosContratodescricao: TStringField;
    qryProdutosContratoquantidade: TIntegerField;
    dsrDetalhesCliente: TtecDataSource;
    dsrProdutosContrato: TtecDataSource;
    qryDetalhesClientecodigo: TIntegerField;
    qryContratosCliente: TtecQuery;
    qryContratosClientefilialvenda: TIntegerField;
    dsrContratosCliente: TtecDataSource;
    qryContratosClientenumero: TStringField;
    qryContratosClientedata: TDateField;
    qryQuestionarioFiltro: TtecQuery;
    qryQuestionarioFiltroquestionario: TIntegerField;
    qryQuestionarioFiltrotipo: TStringField;
    qryQuestionarioFiltrodescricao: TStringField;
    qryFonesCliente: TtecQuery;
    qryFonesClientefonenumero: TIntegerField;
    qryFonesClientefone2numero: TIntegerField;
    qryFonesClienteempfonenumero: TIntegerField;
    qryFonesClienteconfonenumero: TIntegerField;
    qryFonesClientereffonenumero: TIntegerField;
    qryFonesClientereffone2numero: TIntegerField;
    qryDetalhesClienterefcidade: TIntegerField;
    qryDetalhesClienterefestado: TStringField;
    qryChamadaLigar: TtecQuery;
    qryChamadaLigarnumero: TIntegerField;
    qryChamadaDesligar: TtecQuery;
    qryChamadaStatus: TtecQuery;
    qryDetalhesClientecodcidade: TIntegerField;
    qryDetalhesClienteempcidade: TIntegerField;
    qryDetalhesClienteempestado: TStringField;
    qryChamadaStatusQueStatus: TStringField;
    dsrAtendimentosPorCliente: TtecDataSource;
    qryAtendimentosPorCliente: TtecQuery;
    qryAtendimentosPorClientecliente: TIntegerField;
    qryAtendimentosPorClientedata: TDateField;
    qryAtendimentosPorClientelembrar: TDateField;
    qryAtendimentosPorClientetipo: TStringField;
    qryAtendimentosPorClienteconcluido: TBooleanField;
    qryAtendimentosPorClienteinformes: TStringField;
    qryContratosClientenome: TStringField;
    qryDetalhesClientesexo: TStringField;
    qryDetalhesClientetelefone1: TStringField;
    qryDetalhesClientetelefone2: TStringField;
    qryDetalhesClientefoneempresa: TStringField;
    qryDetalhesClientefoneconjuge: TStringField;
    qryDetalhesClientefoneref1: TStringField;
    qryDetalhesClientefoneref2: TStringField;
    qryExisteLigacoes: TtecQuery;
    qryExisteLigacoesqtde: TIntegerField;
    qryDetalhesClienteconnome: TStringField;
    qryDetalhesClientedescricaocargo: TStringField;
    procedure qryContatosAfterScroll(DataSet: TDataSet);
    procedure qryContatosAfterPost(DataSet: TDataSet);
    procedure qryContratosClienteAfterScroll(DataSet: TDataSet);
    procedure qryContatosAfterCancel(DataSet: TDataSet);
    procedure qryDetalhesClienteAfterScroll(DataSet: TDataSet);
  protected
    FOnScrollContato: TNotifyEvent;
    FOnScrollPerguntas: TNotifyEvent;
    QuestionarioAplicado: Integer;
    NomeQuestionarioAplicado: String;
    function GetSituacaoLigacao: Char;

//    procedure LiberarInstancia; override;
    class function Instancia: TdtmBasico; override;
  public
    function GetNumeroChamada: Integer;
    function GetCampanhaChamada: Integer;
    function GetCidadeClienteChamada: Integer;
    function GetCidadeEmpresaChamada: Integer;
    function GetCidadeReferenciaChamada: Integer;
    function GetEstadoClienteChamada: String;
    function GetEstadoEmpresaChamada: String;
    function GetEstadoReferenciaChamada: String;
    function GetOperadorChamada: String;
    function GetTabelaChamadaDesligar: TtecQuery;
    function GetTabelaChamadaLigar: TtecQuery;
    function GetTabelaChamadaStatus: TtecQuery;
    function GetFone1Cliente: Integer;
    function GetFone1Referencia: Integer;
    function GetFone2Cliente: Integer;
    function GetFone2Referencia: Integer;
    function GetFoneConjuge: Integer;
    function GetFoneEmpresa: Integer;
    function GetNomeClienteContato: String;
    function GetCodigoClienteContato: Integer;
    function GetTipoContato: String;
    function EditandoContato :Boolean;
    function  InserindoContato: Boolean;
    procedure NovaLigacao;
    procedure LimparControlesEdicaoContato;
    function  ExisteClientes(Codigo: Integer): Boolean; overload;

    property  SituacaoLigacao: Char read GetSituacaoLigacao;
    property  NumeroChamada: Integer read GetNumeroChamada;
    property  EstadoClienteChamada: String read GetEstadoClienteChamada;
    property  CidadeClienteChamada: Integer read GetCidadeClienteChamada;
    property  EstadoEmpresaChamada: String read GetEstadoEmpresaChamada;
    property  CidadeEmpresaChamada: Integer read GetCidadeEmpresaChamada;
    property  EstadoReferenciaChamada: String read GetEstadoReferenciaChamada;
    property  CidadeReferenciaChamada: Integer read GetCidadeReferenciaChamada;
    property  OperadorChamada: String read GetOperadorChamada;
    property  CampanhaChamada: Integer read GetCampanhaChamada; {Filtro}
    property  OnScrollContato: TNotifyEvent read FOnScrollContato write FOnScrollContato;
    property  TabelaChamadaLigar: TtecQuery read GetTabelaChamadaLigar;
    property  TabelaChamadaDesligar: TtecQuery read GetTabelaChamadaDesligar;
    property  TabelaChamadaStatus: TtecQuery read GetTabelaChamadaStatus;
    property  Fone1Cliente    : Integer read GetFone1Cliente;
    property  Fone2Cliente    : Integer read GetFone2Cliente;
    property  FoneEmpresa     : Integer read GetFoneEmpresa;
    property  FoneConjuge     : Integer read GetFoneConjuge;
    property  Fone1Referencia : Integer read GetFone1Referencia;
    property  Fone2ReferenciA : Integer read GetFone2Referencia;
    property  CodigoClienteContato: Integer read GetCodigoClienteContato;
    property  NomeClienteContato: String read GetNomeClienteContato;
    property  TipoContato: String read GetTipoContato;
  end;

var
    dtmSAC : TdtmSAC;

implementation

uses
  //Biblio
  dmtecsoft;

{$R *.dfm}

{procedure TdtmSAC.LiberarInstancia;
begin
  dtmSAC := nil
end;}

class function TdtmSAC.Instancia: TdtmBasico;
begin
  Result := dtmSAC
end;

function TdtmSAC.GetNomeClienteContato: String;
begin
  Result:= qryConsultaClientesnome.AsString;
end;

function TdtmSAC.GetCodigoClienteContato: Integer;
begin
  Result:= qryLigacoesCliente.AsInteger;
end;

function TdtmSAC.EditandoContato: Boolean;
begin
  Result:= qryContatos.State = dsEdit;
end;

function TdtmSAC.InserindoContato: Boolean;
begin
  Result:= qryContatos.State = dsInsert;
end;

Procedure TdtmSAC.NovaLigacao;
begin
  repeat
//    case dtmTecSoft.NumeroLigacao of
//      0 :  qryLigacoes.SQL[9]:= 'and (Situacao = ''0'')';
//      else qryLigacoes.SQL[9]:= 'and (Situacao = ''R'') and (Religado = ' + IntToStr(dtmTecSoft.NumeroLigacao) + ')';
//    end;
//    ReFazConsulta(qryLigacoes,[0],[dtmTecSoft.CodigoFiltroSAC_Usuario]);
    if not (qryLigacoes.IsEmpty) then begin
      if JaExisteContato then begin
         PosicionarContato(True);
         ReFazConsulta(qryQuestionarioFiltro,[0],[qryLigacoesfiltrosac.AsInteger]);

         SetStatusLigacao(ctSACFazendoLigacao);

         qryContatos.Edit;
         qryContatosdata.AsDateTime   := Date;
         qryContatosusuario.AsInteger := CodigoUsuario;
         qryContatos.Post;
         Perpetrar([qryContatos]);

         ReFazConsulta(qryPerguntasAplicadas,[0],[qryContatosquestionario.AsInteger]);
         ReFazConsulta(qryFonesCliente,      [0],[qryContatoscliente.AsInteger]);
         ReFazConsulta(qryDetalhesCliente,   [0],[qryContatoscliente.AsInteger]);
      end
      else
        if ExisteClientes(qryLigacoescliente.AsInteger) then begin

          SetStatusLigacao(ctSACFazendoLigacao);

          IncluirContatos;
          ReFazConsulta(qryQuestionarioFiltro,[0],[qryLigacoesfiltrosac.AsInteger]);
          ReFazConsulta(qryPerguntasAplicadas,[0],[0]);
          qryContatoscliente.AsInteger     := CodigoClienteContato;  // Provém de ExisteClientes
          qryContatosnome.AsString         := NomeClienteContato;    // Provém de ExisteClientes
          qryContatosquestionario.AsInteger:= qryQuestionarioFiltroquestionario.AsInteger;
          qryContatosdescricao.AsString    := qryQuestionarioFiltrodescricao.AsString;
          qryContatostipo.AsString         := TipoContato;

          ReFazConsulta(qryFonesCliente,   [0],[qryContatoscliente.AsInteger]);
          ReFazConsulta(qryDetalhesCliente,[0],[qryContatoscliente.AsInteger]);
        end;
    end
    else begin
{      case dtmTecSoft.NumeroLigacao of
        0 :  qryExisteLigacoes.SQL[3]:= '(Situacao = ''0'') and';
        else qryExisteLigacoes.SQL[3]:= '(Situacao = ''R'') and (Religado = ' + IntToStr(dtmTecSoft.NumeroLigacao) + ') and';
      end;
      ReFazConsulta(qryExisteLigacoes,[0],[dtmTecSoft.CodigoFiltroSAC_Usuario]);}
      if qryExisteLigacoesQtde.AsInteger = 0 then begin
         MensagemAviso(Format(ctSELECAOLIGACOES,[]));
         LimparControlesEdicaoContato;
      end;
    end;
  until not (qryLigacoes.IsEmpty) or (qryExisteLigacoesQtde.AsInteger = 0);
end;

function TdtmSAC.ExisteClientes(Codigo: Integer): Boolean;
begin
  try
    qryConsultaClientes.Sql[5] := 'where c.codigo = ' + IntToStr(Codigo)
  except
    qryConsultaClientes.Sql[5] := 'where c.codigo = 0';
  end;
  qryConsultaClientes.Open;
  Result := Not qryConsultaClientes.IsEmpty
end;

function TdtmSAC.GetFone1Cliente: Integer;
begin
  Result:= qryFonesClientefonenumero.AsInteger;
end;

function TdtmSAC.GetFone1Referencia: Integer;
begin
  Result:= qryFonesClientereffonenumero.AsInteger;
end;

function TdtmSAC.GetFone2Cliente: Integer;
begin
  Result:= qryFonesClientefone2numero.AsInteger;
end;

function TdtmSAC.GetFone2Referencia: Integer;
begin
  Result:= qryFonesClientereffone2numero.AsInteger;
end;

function TdtmSAC.GetFoneConjuge: Integer;
begin
  Result:= qryFonesClienteconfonenumero.AsInteger;
end;

function TdtmSAC.GetFoneEmpresa: Integer;
begin
  Result:= qryFonesClienteempfonenumero.AsInteger;
end;

function TdtmSAC.GetTipoContato: String;
begin
  Result:= qryQuestionarioFiltrotipo.AsString;
end;

procedure TdtmSAC.qryContatosAfterPost(DataSet: TDataSet);
begin
  inherited;
  if qryContatos.IsEmpty then begin
    ReFazConsulta(qryDetalhesCliente, [],[]);
    ReFazConsulta(qryProdutosContrato,[],[]);
  end;
  ReFazConsulta(qryPerguntasAplicadas,[0],[qryContatosquestionario.AsInteger]);
end;

procedure TdtmSAC.qryContratosClienteAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryProdutosContrato, [0], [qryContratosClientenumero.AsString]);
end;

procedure TdtmSAC.qryContatosAfterCancel(DataSet: TDataSet);
begin
  inherited;
  LimparControlesEdicaoContato;
end;

procedure TdtmSAC.qryDetalhesClienteAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryContratosCliente, [0], [qryDetalhesClientecodigo.AsInteger]);
  ReFazConsulta(qryAtendimentosPorCliente,[0], [qryDetalhesClientecodigo.AsInteger]);
end;

function TdtmSAC.GetTabelaChamadaDesligar: TtecQuery;
begin
  Result:= qryChamadaDesligar;
end;

function TdtmSAC.GetTabelaChamadaLigar: TtecQuery;
begin
  Result:= qryChamadaLigar;
end;

function TdtmSAC.GetTabelaChamadaStatus: TtecQuery;
begin
  Result:= qryChamadaStatus;
end;

function TdtmSAC.GetCampanhaChamada: Integer;
begin
  Result:= qryLigacoesfiltrosac.AsInteger;
end;

function TdtmSAC.GetCidadeClienteChamada: Integer;
begin
  Result:= qryDetalhesClientecodcidade.AsInteger;
end;

function TdtmSAC.GetCidadeEmpresaChamada: Integer;
begin
  Result:= qryDetalhesClienteempcidade.AsInteger;
end;

function TdtmSAC.GetCidadeReferenciaChamada: Integer;
begin
  Result:= qryDetalhesClienterefcidade.AsInteger;
end;

function TdtmSAC.GetEstadoClienteChamada: String;
begin
  Result:= qryDetalhesClienteestado.AsString;
end;

function TdtmSAC.GetEstadoEmpresaChamada: String;
begin
  Result:= qryDetalhesClienteempestado.AsString;
end;

function TdtmSAC.GetEstadoReferenciaChamada: String;
begin
  Result:= qryDetalhesClienterefestado.AsString;
end;

function TdtmSAC.GetOperadorChamada: String;
begin
  Result:= CodigoOperador;
end;

function TdtmSAC.GetNumeroChamada: Integer;
begin
  Result:= qryChamadaLigarnumero.AsInteger;
end;

function TdtmSAC.GetSituacaoLigacao: Char;
begin
  Result := qryLigacoessituacao.AsString[1];
end;

procedure TdtmSAC.qryContatosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if Assigned(OnScrollContato) then
    OnScrollContato(qryContatos);
end;

procedure TdtmSAC.LimparControlesEdicaoContato;
begin
  ReFazConsulta(qryContatos,              [0],[0]);
  ReFazConsulta(qryLigacoes,              [0],[0]);
  ReFazConsulta(qryDetalhesCliente,       [0],[0]);
  ReFazConsulta(qryProdutosContrato,      [0],[0]);
  ReFazConsulta(qryContratosCliente,      [0],[0]);
  ReFazConsulta(qryAtendimentosPorCliente,[0],[0]);
  if qryPerguntasAplicadas.Active then
    ReFazConsulta(qryPerguntasAplicadas,  [0],[0]);
  if qryRespostaObjetiva.Active then
    ReFazConsulta(qryRespostaObjetiva,    [0],[0]);
  if qryRespostaDiscursiva.Active then
    ReFazConsulta(qryRespostaDiscursiva,  [0],[0]);
end;

end.
