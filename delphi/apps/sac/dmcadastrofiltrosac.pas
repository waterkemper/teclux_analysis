unit dmcadastrofiltrosac;
    
interface  

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery, cpquery;

type
  TdtmCadastroFiltroSAC = class(TdtmBasico)
    dsrFiltrosSAC: TtecDataSource;
    qryConsultaFiltrosSAC: TtecQuery;
    qryConsultaFiltrosSACdescricao: TStringField;
    qryConsultaFiltrosSACnumero: TIntegerField;
    qryProximoNumeroFiltro: TtecQuery;
    qryProximoNumeroFiltronumero: TIntegerField;
    qryConsultaQuestionarios: TtecQuery;
    qryConsultaQuestionariosdescricao: TStringField;
    qryConsultaQuestionarioscodigo: TIntegerField;
    dsrConsultaQuestionarios: TtecDataSource;
    dsrQuestionario: TtecDataSource;
    qryGerarLigacoes: TtecQuery;
    qryUpdateFiltroSac: TtecQuery;
    qryUpdateLigacoes: TtecQuery;
    qryDeleteLigacoes: TtecQuery;
    qryExisteLigacoes: TtecQuery;
    qryExisteLigacoesqtde: TIntegerField;
    qryLigacoes: TtecQuery;
    qryLigacoesfiltrosac: TIntegerField;
    qryLigacoescliente: TIntegerField;
    qryLigacoesusuario: TIntegerField;
    qryLigacoesdatahora: TDateTimeField;
    qryLigacoessituacao: TStringField;
    qryLigacoesreligado: TIntegerField;
    qryLigacoescontato: TIntegerField;
    qryQuestionarios: TtecQuery;
    qryQuestionarioscodigo: TIntegerField;
    qryQuestionariosdescricao: TStringField;
    qryFiltrosSAC: TtecQuery;
    qryFiltrosSACnumero: TIntegerField;
    qryFiltrosSACdescricao: TStringField;
    qryFiltrosSACtipo: TStringField;
    qryFiltrosSACdata: TDateField;
    qryFiltrosSACfiltro: TStringField;
    qryFiltrosSACinativo: TDateField;
    qryFiltrosSACquestionario: TIntegerField;
    qryFiltrosSACsql: TStringField;
    procedure qryFiltrosSACNewRecord(DataSet: TDataSet);
    procedure qryFiltrosSACAfterScroll(DataSet: TDataSet);
  private
    function GetAtivaInsercao: boolean;
    procedure SetAtivaInsercao(const Value: boolean);
  protected
    function GetTabelaConsultaQuestionario: TtecQuery;
    function GetFiltroSacQuestionario: boolean;
    function GetTipoFiltro: String;
    function GetTabelaFiltrosSAC: TtecQuery;
    function GetTabelaConsultaFiltrosSAC: TtecQuery;
  public
    function  PermiteAlteracaoRegistro: Boolean;
    function  ExisteQuestionario(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
    function  InserindoFiltro: Boolean;
    procedure GravarSelecaoFiltro(Selecao:TStringList; SQL:WideString);
    procedure SetTipoFiltro(Tipo: String);
    procedure CopiarFiltro;
    procedure AtribuirQuestionarioFiltro;
    procedure PosicionarFiltrosSAC;
    function  InserirFiltrosSAC: Boolean;
    function  GravarFiltrosSAC : Boolean;
    function  ExcluirFiltrosSAC: Boolean;
    function  ExisteFiltrosSAC(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
    function  ExisteLigacaoFiltro: Boolean;
    procedure GerarLigacoes;
    constructor Create(AOwner: TComponent); override;
    property  TabelaConsultaQuestionario: TtecQuery read GetTabelaConsultaQuestionario;
    property  ConfereFiltroSacQuestionario: boolean read GetFiltroSacQuestionario;
    property  TipoFiltro: String read GetTipoFiltro;
    property  TabelaConsultaFiltrosSAC: TtecQuery read GetTabelaConsultaFiltrosSAC;
    property  TabelaFiltrosSAC: TtecQuery read GetTabelaFiltrosSAC;
    property  AtivaInsercao   : boolean read GetAtivaInsercao write SetAtivaInsercao;
  end;

var
  dtmCadastroFiltroSAC: TdtmCadastroFiltroSAC;

implementation

{$R *.dfm}

uses ctConstantes,
     biblio,
     dmtecsoft;

{ TdtmCadastroFiltroSAC }

constructor TdtmCadastroFiltroSAC.Create(AOwner: TComponent);
begin
  inherited;
  qryFiltrosSAC.Tag                     := ctCadastroFiltrosSAC;
  qryConsultaFiltrosSAC.Tag             := ctConsultaFiltrosSAC;
  qryConsultaQuestionarios.Tag          := ctTabelasConsultaQuestionarios;
end;

procedure TdtmCadastroFiltroSAC.AtribuirQuestionarioFiltro;
begin
  qryFiltrosSAC.Edit;
  qryFiltrosSACquestionario.AsInteger:= qryConsultaQuestionarioscodigo.AsInteger;
end;

procedure TdtmCadastroFiltroSAC.CopiarFiltro;
var
  Descricao   : String;
  Tipo        : String[1];
  Questionario: Integer;
  Filtro      : String;
begin
  qryFiltrosSAC.ReadOnly:= False;
  if not qryFiltrosSAC.IsEmpty then begin
    Descricao   := qryFiltrosSACdescricao.AsString;
    Tipo        := qryFiltrosSACtipo.AsString;
    Questionario:= qryFiltrosSACquestionario.AsInteger;
    Filtro      := qryFiltrosSACfiltro.AsString;
    qryFiltrosSAC.Insert;
    qryFiltrosSACnumero.AsInteger      := qryProximoNumeroFiltronumero.AsInteger;
    qryFiltrosSACdescricao.AsString    := Descricao;
    qryFiltrosSACtipo.AsString         := Tipo;
    qryFiltrosSACfiltro.AsString       := Filtro;
    qryFiltrosSACdata.AsDateTime       := Now;
    qryFiltrosSACinativo.Clear;
    qryFiltrosSACquestionario.AsInteger:= Questionario;
  end;

end;
function TdtmCadastroFiltroSAC.ExcluirFiltrosSAC: Boolean;
begin
  qryFiltrosSAC.ReadOnly:= False;
{  if not qryFiltrosSAC.IsEmpty then
     qryFiltrosSAC.Delete;
  Perpetrar([qryFiltrosSAC]);
  Result:= True;}
  if qryFiltrosSACinativo.AsString = '' then begin
     if ExisteLigacaoFiltro then begin
        qryUpdateLigacoes.Params[0].AsInteger :=qryFiltrosSACnumero.AsInteger;
        qryDeleteLigacoes.Params[0].AsInteger :=qryFiltrosSACnumero.AsInteger;
        qryUpdateLigacoes.ExecSql;
        qryDeleteLigacoes.ExecSQL;
     end;
     qryUpdateFiltroSac.Params[0].AsInteger:=qryFiltrosSACnumero.AsInteger;
     qryUpdateFiltroSac.ExecSql;
     Perpetrar([qryUpdateLigacoes,qryDeleteLigacoes,qryUpdateFiltroSac]);
     RefazConsulta(qryFiltrosSAC, [],[]);
     Result := True;
  end else Result := False;
end;

function TdtmCadastroFiltroSAC.ExisteFiltrosSAC(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaFiltrosSAC, NomeCampo, Value)
end;

function TdtmCadastroFiltroSAC.ExisteLigacaoFiltro: Boolean;
begin
  Result:= qryExisteLigacoesqtde.AsInteger > 0;
end;

procedure TdtmCadastroFiltroSAC.GerarLigacoes;
begin
  ReFazConsulta(qryGerarLigacoes,[0],[qryFiltrosSACnumero.AsInteger]);
  Perpetrar([qryLigacoes]);
end;

function TdtmCadastroFiltroSAC.GetFiltroSacQuestionario: boolean;
begin
   If qryFiltrosSACquestionario.AsString = '' then
      Result := False
   else Result := True
end;

function TdtmCadastroFiltroSAC.GetTabelaConsultaFiltrosSAC: TtecQuery;
begin
  Result:= qryConsultaFiltrosSAC;
end;

function TdtmCadastroFiltroSAC.GetTabelaFiltrosSAC: TtecQuery;
begin
  Result:= qryFiltrosSAC;
end;

function TdtmCadastroFiltroSAC.GetTipoFiltro: String;
begin
  Result:= qryFiltrosSACtipo.AsString;
end;

function TdtmCadastroFiltroSAC.GravarFiltrosSAC: Boolean;
begin
  if qryFiltrosSAC.State in [dsInsert] then begin
    qryProximoNumeroFiltro.Active:= True;
    qryFiltrosSACnumero.AsInteger:= qryProximoNumeroFiltronumero.AsInteger;
    qryProximoNumeroFiltro.Active:= False;
  end;

  if qryFiltrosSAC.State in [dsEdit,dsInsert] then begin
//  if qryFiltrosSAC.State in [dsInsert] then begin
      qryFiltrosSAC.Post;
      Perpetrar([qryFiltrosSAC]);
      if (qryFiltrosSACtipo.AsString <> '') and (qryFiltrosSACSQL.AsString <> '') then
        GerarLigacoes;
      qryFiltrosSAC.ReadOnly := PermiteAlteracaoRegistro;
      Result := True;
  end else
    Result:= False;
end;

procedure TdtmCadastroFiltroSAC.GravarSelecaoFiltro(Selecao: TStringList; SQL: WideString);
begin
  if not (qryFiltrosSAC.State in [dsInsert]) then
     qryFiltrosSAC.Edit;
  qryFiltrosSACfiltro.AsString:= Selecao.Text;
  qryFiltrosSACSQL.AsString   := SQL;
end;

function TdtmCadastroFiltroSAC.InserindoFiltro: Boolean;
begin
  Result:= qryFiltrosSAC.State in [dsInsert];
end;

function TdtmCadastroFiltroSAC.InserirFiltrosSAC: Boolean;
begin
  qryFiltrosSAC.ReadOnly:= False;
  if not qryFiltrosSAC.Active then begin
     qryFiltrosSAC.Open;
     AtivaInsercao:=True;
  end;
  qryFiltrosSAC.Insert;
  Result:= True;
end;

procedure TdtmCadastroFiltroSAC.PosicionarFiltrosSAC;
begin
  ReFazConsulta(qryFiltrosSAC,[0],[qryConsultaFiltrosSACnumero.AsInteger]);
end;

procedure TdtmCadastroFiltroSAC.SetTipoFiltro(Tipo: String);
begin
  qryFiltrosSAC.Edit;
  qryFiltrosSACtipo.AsString:= Tipo;
end;

procedure TdtmCadastroFiltroSAC.qryFiltrosSACNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryFiltrosSACdata.AsDateTime:= Now;
  qryFiltrosSACTipo.AsString  := '';
end;

procedure TdtmCadastroFiltroSAC.qryFiltrosSACAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryExisteLigacoes,[0],[qryFiltrosSACnumero.AsInteger]);
  qryFiltrosSAC.ReadOnly := PermiteAlteracaoRegistro;
//  if not qryFiltrosSACinativo.IsNull then qryFiltrosSAC.ReadOnly :=true;
end;


function TdtmCadastroFiltroSAC.ExisteQuestionario(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result := ExisteCodigo(qryConsultaQuestionarios, NomeCampo, Value);
end;

function TdtmCadastroFiltroSAC.GetTabelaConsultaQuestionario: TtecQuery;
begin
  Result := qryConsultaQuestionarios;
end;

function TdtmCadastroFiltroSAC.PermiteAlteracaoRegistro: Boolean;
begin
  Result:= (ExisteLigacaoFiltro or not qryFiltrosSACinativo.IsNull);
end;

function TdtmCadastroFiltroSAC.GetAtivaInsercao: boolean;
begin
  Result := qryFiltrosSAC.RequestLive
end;

procedure TdtmCadastroFiltroSAC.SetAtivaInsercao(const Value: boolean);
begin
  qryFiltrosSAC.RequestLive := Value;
  refazconsulta(qryFiltrosSAC, [], []);
end;

end.
