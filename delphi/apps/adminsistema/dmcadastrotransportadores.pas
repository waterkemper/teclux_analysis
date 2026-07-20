unit dmcadastrotransportadores;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB,
  // Terceiros
  ZQuery,
  // Componentes
   cpquery, cpdatasource, cptransact, cpdatabase,
  // Biblio
  biblio, ctconstantes,
  // Repositorio
  dmbasico, ZPgSqlQuery;

type
  TdtmCadastroTransportadores = class(TdtmBasico)
    qryTransportadores: TtecQuery;
    dsrTransportadores: TtecDataSource;
    spcTransportadoresProximo: TtecQuery;
    spcTransportadoresProximocodigo: TIntegerField;
    qryTransportadorescodigo: TIntegerField;
    qryTransportadoresrazao: TStringField;
    qryTransportadoresinativo: TDateField;
    qryTransportadoresrua: TStringField;
    qryTransportadoresbairro: TIntegerField;
    qryTransportadorescidade: TIntegerField;
    qryTransportadoresestado: TStringField;
    qryTransportadorescep: TIntegerField;
    qryTransportadorespessoatipo: TStringField;
    qryTransportadoresdocumento: TStringField;
    qryTransportadoresfaxddd: TIntegerField;
    qryTransportadoresfaxnumero: TIntegerField;
    qryTransportadoresfoneddd: TIntegerField;
    qryTransportadoresfonenumero: TIntegerField;
    qryTransportadoresnomecidade: TStringField;
    qryTransportadoresnomebairro: TStringField;
    qryConsultaTransportadores: TtecQuery;
    qryConsultaTransportadoresrazao: TStringField;
    qryConsultaTransportadorescodigo: TIntegerField;
    qryTransportadorespessoanumero: TStringField;
  protected
    function  GetTabelaTransportadores: TZDataSet;
    function  GetConsultarTransportador: TZDataSet;
    function  GetTransportadorEstado: string;
    function GetTipoPessoa: String;
  public
   procedure PosicionarTransportadores;
   function  ExcluirTransportador: Boolean;
   function  IncluirTransportador: Boolean;
   function  GravarTransportador: Boolean;
   function  ExisteTransportador(campo, codigo: string): boolean;
   constructor Create(AOwner: TComponent); override;
   property  TabelaTransportadores: TZDataSet read GetTabelaTransportadores;
   property  ConsultarTransportador: TZDataSet read GetConsultarTransportador;
   property  TransportadorEstado: String read GetTransportadorEstado;
   property  TipoPessoa: String read GetTipoPessoa;
  end;

var
  dtmCadastroTransportadores: TdtmCadastroTransportadores;

implementation

uses dmtecsoft;

{$R *.dfm}

constructor TdtmCadastroTransportadores.Create(AOwner: TComponent);
begin
  inherited;
  qryTransportadores.Tag := ctTabelas;
  qryConsultaTransportadores.Tag := ctTabelasConsultaTransportadores;
end;

function TdtmCadastroTransportadores.ExcluirTransportador: Boolean;
begin
  if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o TRANSPORTADOR'])) = smbOk then
  begin
    if not qryTransportadores.IsEmpty then
      qryTransportadores.Delete
    else
      qryTransportadores.Cancel;
    Perpetrar([qryTransportadores]);
    Result:= True;
  end
  else
    Result:= False;
end;

function TdtmCadastroTransportadores.GravarTransportador: Boolean;
begin
  Result := False;
  if qryTransportadores.CheckRequiredFields then
  begin
    if qryTransportadores.State = dsInsert then
    begin
      spcTransportadoresProximo.Open;
      qryTransportadorescodigo.AsInteger:= spcTransportadoresProximocodigo.AsInteger;
      spcTransportadoresProximo.Close;
    end;
    if qryTransportadoresdocumento.AsString = '' then
      qryTransportadoresdocumento.AsString := 'ISENTO';
    qryTransportadores.Post;
    Perpetrar([qryTransportadores]);
    Result:= True;
  end;
end;

function TdtmCadastroTransportadores.ExisteTransportador(campo, codigo: string): boolean;
begin
  Result:= ExisteCodigo(qryConsultaTransportadores, campo, codigo);
end;

function TdtmCadastroTransportadores.IncluirTransportador: Boolean;
begin
  qryTransportadores.Insert;
  qryTransportadorespessoatipo.AsString := 'J';
  Result:= True;
end;

procedure TdtmCadastroTransportadores.PosicionarTransportadores;
begin
  ReFazConsulta(qryTransportadores, [0], [qryConsultaTransportadorescodigo.AsInteger]);
end;

function TdtmCadastroTransportadores.GetTabelaTransportadores: TZDataSet;
begin
  Result:= qryTransportadores;
end;

function TdtmCadastroTransportadores.GetConsultarTransportador: TZDataSet;
begin
  Result:= qryConsultaTransportadores;
end;

function TdtmCadastroTransportadores.GetTransportadorEstado: String;
begin
  Result := qryTransportadoresestado.AsString;
end;

function TdtmCadastroTransportadores.GetTipoPessoa: String;
begin
  Result := qryTransportadorespessoatipo.AsString
end;

end.
