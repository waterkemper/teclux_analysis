unit dmUnificarClientes;

interface

uses
  SysUtils, Classes, DB, cpdatasource, ZQuery, ZPgSqlQuery, cpquery, dmtecsoft, ctconstantes,
  dmbasico, ZTransact;

type
  TdtmUnificarClientes = class(TDtmBasico)
    qryClientesDuplicados: TtecQuery;
    dsrClientesDuplicados: TtecDataSource;
    qryClientesDuplicadoscodigo: TIntegerField;
    qryClientesDuplicadosnome: TStringField;
    qryClientesDuplicadosapelido: TStringField;
    qryClientesDuplicadosselecionar: TBooleanField;
    qryClientesDuplicadoscodigoselecionado: TIntegerField;
    qryClientesDuplicadospessoanumero: TStringField;
    qryClientesDuplicadosrua: TStringField;
    qryClientesDuplicadosnumero: TIntegerField;
    qryClientesDuplicadoscomplemento: TStringField;
    qryClientesDuplicadosnomebairrocliente: TStringField;
    qryClientesDuplicadosnomecidadecliente: TStringField;
    qryClientesDuplicadoscep: TIntegerField;
    qryClientesDuplicadosestado: TStringField;
    qryClientesDuplicadosultimaalteracao: TDateField;
    qryClientesDuplicadosdatacadastro: TDateField;
    qryClientesDuplicadosnomeusariosite: TStringField;
    qryClientesDuplicadosdatacadastrousuariosite: TDateTimeField;
    qryAtualizarClientesDuplicados: TtecQuery;
    procedure qryClientesDuplicadosAfterInsert(DataSet: TDataSet);
    procedure qryClientesDuplicadosAfterScroll(DataSet: TDataSet);
  private
    fvcnpj_cpfSelecionado: String;
    fCodigoAtual: integer;
    fExisteMarcados: boolean;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure MarcarRegistro;
    property vcnpj_cpfSelecionado: String read fvcnpj_cpfSelecionado write fvcnpj_cpfSelecionado;
    property CodigoAtual: integer read fCodigoAtual write fCodigoAtual;
    property ExisteMarcados: boolean read fExisteMarcados write fExisteMarcados;
    function GravarAlteracoes: boolean;
  end;

var
  dtmUnificarClientes: TdtmUnificarClientes;

implementation

{$R *.dfm}

{ TdtmUnificarClientes }

constructor TdtmUnificarClientes.Create(AOwner: TComponent);
begin
  inherited;
  qryClientesDuplicados.open;
end;

function TdtmUnificarClientes.GravarAlteracoes: boolean;
begin
  result := false;
  qryClientesDuplicados.First;
  while not qryClientesDuplicados.eof do
  begin
    if (qryClientesDuplicadoscodigoselecionado.AsInteger <> 0) and
       (qryClientesDuplicadoscodigoselecionado.AsInteger <> qryClientesDuplicadoscodigo.AsInteger) then
    begin
      qryAtualizarClientesDuplicados.ParamByName('clientenovo').AsInteger := qryClientesDuplicadoscodigoselecionado.AsInteger;
      qryAtualizarClientesDuplicados.ParamByName('clienteantigo').AsInteger := qryClientesDuplicadoscodigo.AsInteger;
      qryAtualizarClientesDuplicados.ExecSql;
      result := Perpetrar([qryAtualizarClientesDuplicados]);
      if not result then
        break;
    end;
    qryClientesDuplicados.next;
  end;

  if result then
  begin
    qryClientesDuplicados.close;
    qryClientesDuplicados.Open;
    ExisteMarcados := false;
  end;
end;

procedure TdtmUnificarClientes.MarcarRegistro;
var
  vCodigo: integer;
  vcpf_cnpj: String;
  vLimparSelecao: Boolean;

begin
  vCodigo := qryClientesDuplicadoscodigo.AsInteger;
  vcpf_cnpj := qryClientesDuplicadospessoanumero.AsString;
  vLimparSelecao := vCodigo = qryClientesDuplicadoscodigoselecionado.AsInteger;

  ExisteMarcados := false;

  GuardarRegistroAtual(qryClientesDuplicados, true);
  qryClientesDuplicados.first;
  if qryClientesDuplicados.Locate('pessoanumero',vcpf_cnpj,[]) then
  begin
    while qryClientesDuplicadospessoanumero.AsString = vcpf_cnpj do
    begin
      qryClientesDuplicados.Edit;
      if vLimparSelecao then
        qryClientesDuplicadoscodigoselecionado.clear
      else
      begin
        qryClientesDuplicadoscodigoselecionado.AsInteger := vCodigo;
        ExisteMarcados := true;
      end;

      qryClientesDuplicados.Post;
      qryClientesDuplicados.Next;

      if qryClientesDuplicados.Eof then
        break;
    end;
  end;

  if not ExisteMarcados then
  begin
    qryClientesDuplicados.First;
    while not qryClientesDuplicados.Eof do
    begin
      if qryClientesDuplicadoscodigoselecionado.AsInteger <> 0 then
      begin
        ExisteMarcados := true;
        break;
      end;
      qryClientesDuplicados.next;

    end;
  end;
  
  VoltarRegistroAtual(qryClientesDuplicados);
end;

procedure TdtmUnificarClientes.qryClientesDuplicadosAfterInsert(
  DataSet: TDataSet);
begin
  qryClientesDuplicados.Cancel;
end;

procedure TdtmUnificarClientes.qryClientesDuplicadosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  vcnpj_cpfSelecionado := qryClientesDuplicadospessoanumero.AsString;
  CodigoAtual := qryClientesDuplicadoscodigo.AsInteger;
end;

end.
